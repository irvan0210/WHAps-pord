unit IntegrateGPHPPBusU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit,
  DBGrids, DB;

type
  TIntegrateGPHPPBus = class(TForm)
    ToXCel1: TSpeedButton;
    Selesai: TButton;
    Label2: TLabel;
    FromDates: TDateTimePicker;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    StrGrid1: TZColorStringGrid;
    Process: TButton;
    StrGrid2: TZColorStringGrid;
    Label3: TLabel;
    ToDates: TDateTimePicker;
    ToDate: TCheckBox;
    StrGrid3: TZColorStringGrid;
    StrGrid4: TZColorStringGrid;
    Lokasi: TComboBox;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    rbdk: TRadioButton;
    rblk: TRadioButton;
    grpPilihanBiaya: TGroupBox;
    rbBiaya1: TRadioButton;
    rbBiaya2: TRadioButton;
    rbBiaya3: TRadioButton;
    rbBiaya4: TRadioButton;
    posting: TButton;
    Memo1: TMemo;
    butIntegrate: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCel1Click(Sender: TObject);
    procedure ToXcel2Click(Sender: TObject);
    procedure ProcessClick(Sender: TObject);
    procedure GPLastGLKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToDateClick(Sender: TObject);
    procedure postingClick(Sender: TObject);
    procedure SelesaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butIntegrateClick(Sender: TObject);

  private
    { Private declarations }
    JenisArr,LokasiArr:Array of TArrString7;
    CompanyArr:Array of TArrString8;
    GPConnection:TADOConnection;
    Query:TADOQuery;
    StrQuery:String;
    DbGP,DbHostGP,DbUserGP,DbPassGP,ProviderGP :String;
    IntTryType:Byte;
    lastRow1,lastRow2,lastRow3,lastRow4:Byte;
    LastSeq1,LastSeq2,LastSeq3,LastSeq4:Integer;

    procedure Init;
    procedure InitDB_GP;
    function OpenDb_GP:Boolean;

    procedure InitGrid1;
    procedure InitGrid2;
    procedure InitGrid3;
    procedure InitGrid4;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData1;
    procedure RefreshData2;
    procedure ProcessData;
  public
    { Public declarations }
  end;

var
  IntegrateGPHPPBus: TIntegrateGPHPPBus;

implementation

uses MainU, StrUtils;

{$R *.dfm}

procedure TIntegrateGPHPPBus.Init;
begin
  DbGP      :='INTERFACE';
  DbHostGP  :='192.168.25.170';
  DbUserGP  :='sa';
  DbPassGP  :='sasaja';//'admin@sql2013#';
(*
  DbHostGP  :='localhost';
  DbUserGP  :='sa';
  DbPassGP  :='Pram080707**';//'admin@sql2013#';
*)
  ProviderGP:=Main.Provider;//'SQLNCLI11';
  //posting.Enabled:=False;

  FromDates.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  ToDates.Enabled:=True;
  ToDates.Date:=Now();
  ToDates.Enabled:=False;
  rbdk.Checked := True;
  rblk.Checked := False;
  if UserLevel<59 then begin
    ToXCel1.Enabled:=False;
  end;
end;

procedure TIntegrateGPHPPBus.InitGrid1;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid1.RowCount-1 do
    for IntCount2:=0 to StrGrid1.ColCount-1 do
      StrGrid1.Cells[IntCount2,IntCount]:='';
  StrGrid1.RowCount:=3;
  StrGrid1.ColCount:=7;
  //StrGrid1.MergeCells.AddRectXY(0,0,3,3);

  StrGrid1.Cells[0,0]:='GL INTERFACE HEADER';
  StrGrid1.Cells[0,1]:='INTERID';
  StrGrid1.Cells[1,1]:='JRNENTRY';
  StrGrid1.Cells[2,1]:='BACHNUMB';
  StrGrid1.Cells[3,1]:='SOURCDOC';
  StrGrid1.Cells[4,1]:='REFRENCE';
  StrGrid1.Cells[5,1]:='TRXDATE';
  StrGrid1.Cells[6,1]:='CURNCYID';

  StrGrid1.ColWidths[0]:=60;
  StrGrid1.ColWidths[1]:=75;
  StrGrid1.ColWidths[2]:=80;
  StrGrid1.ColWidths[3]:=75;
  StrGrid1.ColWidths[4]:=130;
  StrGrid1.ColWidths[5]:=65;
  StrGrid1.ColWidths[6]:=65;
  StrGrid1.MergeCells.AddRectXY(0,0,3,0);
  
  StrGrid1.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 6 do
    StrGrid1.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;


procedure TIntegrateGPHPPBus.InitGrid2;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid2.Cells[IntCount2,IntCount]:='';
  StrGrid2.RowCount:=6;
  StrGrid2.ColCount:=7;
  StrGrid2.Cells[0,0]:='GL INTERFACE DETAIL';

  StrGrid2.Cells[0,1]:='INTERID';
  StrGrid2.Cells[1,1]:='JRNENTRY';
  StrGrid2.Cells[2,1]:='SQNCLINE';
  StrGrid2.Cells[3,1]:='ACTNUMBER';
  StrGrid2.Cells[4,1]:='DSCRIPTN';
  StrGrid2.Cells[5,1]:='ORCRDAMT';
  StrGrid2.Cells[6,1]:='ORDBDAMT';

  StrGrid2.ColWidths[0]:=53;
  StrGrid2.ColWidths[1]:=72;
  StrGrid2.ColWidths[2]:=65;
  StrGrid2.ColWidths[3]:=120;
  StrGrid2.ColWidths[4]:=130;
  StrGrid2.ColWidths[5]:=70;
  StrGrid2.ColWidths[6]:=70;
  StrGrid2.MergeCells.AddRectXY(0,0,3,0);
  
  StrGrid2.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 6 do
    StrGrid2.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;

procedure TIntegrateGPHPPBus.InitGrid3;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';
  StrGrid3.RowCount:=6;
  StrGrid3.ColCount:=9;
  StrGrid3.Cells[0,0]:='AA Interface Header';
  StrGrid3.Cells[0,1]:='INTERID';
  StrGrid3.Cells[1,1]:='JRNENTRY';
  StrGrid3.Cells[2,1]:='SQNCLINE';
  StrGrid3.Cells[3,1]:='ORD';
  StrGrid3.Cells[4,1]:='DISTRIBUTION';
  StrGrid3.Cells[5,1]:='ORIGAMT';
  StrGrid3.Cells[6,1]:='ASSIGN';
  StrGrid3.Cells[7,1]:='ALIAS';
  StrGrid3.Cells[8,1]:='REFERENCE';

  StrGrid3.ColWidths[0]:=53;
  StrGrid3.ColWidths[1]:=72;
  StrGrid3.ColWidths[2]:=65;
  StrGrid3.ColWidths[3]:=50;
  StrGrid3.ColWidths[4]:=130;
  StrGrid3.ColWidths[5]:=70;
  StrGrid3.ColWidths[6]:=50;
  StrGrid3.ColWidths[7]:=50;
  StrGrid3.ColWidths[8]:=120;
  StrGrid3.MergeCells.AddRectXY(0,0,3,0);

  StrGrid3.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 8 do
    StrGrid3.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;

procedure TIntegrateGPHPPBus.InitGrid4;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid4.RowCount-1 do
    for IntCount2:=0 to StrGrid4.ColCount-1 do
      StrGrid4.Cells[IntCount2,IntCount]:='';
  StrGrid4.RowCount:=6;
  StrGrid4.ColCount:=6;
  StrGrid4.Cells[0,0]:='AA Interface Detail';
  StrGrid4.Cells[0,1]:='INTERID';
  StrGrid4.Cells[1,1]:='JRNENTRY';
  StrGrid4.Cells[2,1]:='SQNCLINE';
  StrGrid4.Cells[3,1]:='ORD';
  StrGrid4.Cells[4,1]:='TRXDIM';
  StrGrid4.Cells[5,1]:='TRXDIMCODE';

  StrGrid4.ColWidths[0]:=53;
  StrGrid4.ColWidths[1]:=85;
  StrGrid4.ColWidths[2]:=65;
  StrGrid4.ColWidths[3]:=65;
  StrGrid4.ColWidths[4]:=100;
  StrGrid4.ColWidths[5]:=150;
  StrGrid4.MergeCells.AddRectXY(0,0,3,0);

  StrGrid4.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 5 do
    StrGrid4.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;

procedure TIntegrateGPHPPBus.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
end;

procedure TIntegrateGPHPPBus.RefreshCombo;
var QStr:String;
    Qry, Qry2:TADOQuery;
    Count, IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation '+CompanyId+',1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      LokasiArr[Count][2]:=Qry.FieldValues['code'];
      if Qry.FieldValues['coa_disposisi']<>NULL then LokasiArr[Count][3]:=Qry.FieldValues['coa_disposisi'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;

    SetLength(CompanyArr,0);
    QStr:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+QStr,2);
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry2.RecordCount);
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
      CompanyArr[IntCount][0]:=Qry2.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry2.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry2.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry2.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry2.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry2.FieldValues['company_code'];
      Qry2.Next;
      Inc(IntCount)
    end;
    Qry2.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Normal;
end;

procedure TIntegrateGPHPPBus.RefreshData1;
var Qry,Qry2:TADOQuery;
    StrQry,StrDiscount,StrOrderId,StrToDates:String;
    StrBatch,StrLocationId,StrCompanyId,StrisAll:String;
    IntCount,IntCount2,IntCount3,IntCount4,IntDiscount,IntTotalDetail,
    IntQty,IntDay,IntSeq,IntSeq2,IntCounterIntegrate:Integer;
    IsShowSJ,IsNewLine:Boolean;
    StrDistributionReff,StrNilai:String;
    StrTripType, StrNoSJ, StrJenisBeban,
    StrVhcTrans,StrJurnal:String;
    DebitAmt:Double;
    TglMulai, TglSelesai:TDate;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;

  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  TglMulai  := FromDates.Date;// - 1 ;
  TglSelesai:= ToDates.Date;// - 1 ;

  if todate.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy', TglSelesai));
  if rbdk.Checked=True then StrTripType:=',@TripType=0' else StrTripType:=',@TripType=1';

  if Main.OpenDb then begin

    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Show_SJ_IntegrateHPP_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then IsShowSJ:=True Else IsShowSJ:=False;
    end;
    Qry.Close;

    if rbBiaya1.Checked then begin StrJenisBeban:=',@JenisBeban=0'; IntTryType:=0; end
    else if rbBiaya2.Checked then begin StrJenisBeban:=',@JenisBeban=1'; IntTryType:=1; end
    else if rbBiaya3.Checked then begin StrJenisBeban:=',@JenisBeban=2'; IntTryType:=2; end
    else if rbBiaya4.Checked then begin StrJenisBeban:=',@JenisBeban=3'; IntTryType:=3; end;

    StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
            'WHERE trx_type='+IntToStr(IntTryType)+' and (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+') '+
            'Order By counter desc';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then IntCounterIntegrate:=Qry.FieldValues['counter']
    else IntCounterIntegrate:=0;
    Qry.Close;
    //StrJurnal:=Format('%.*d',[2, StrToInt(CompanyId)])+FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
    StrJurnal:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
    StrJurnal:='0';
    {Proses GL}
    StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
            QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntSeq:=0;
    IntCount:=0;
    if Qry.RecordCount>1 then while not(Qry.Eof) do begin
      {Grid 1}
      //if StrOrderId<>Qry.FieldValues['customer_order_id'] then begin
      if StrGrid2.RowCount<IntCount+3 then StrGrid2.RowCount:=IntCount+3;
      if Qry.RecNo=1 Then begin

        if Qry.RecNo=1 then begin
          StrGrid1.Cells[0, 2]:='WHDC';
          StrGrid1.Cells[1, 2]:=StrJurnal;//FormatDateTime('YYYYMMDD', VarToDateTime(Qry.FieldValues['DATE'])); {Increament tidak harus diisi}
          StrGrid1.Cells[2, 2]:=Qry.FieldValues['BATCH_ID'];
          StrGrid1.Cells[3, 2]:='IMGJ';
          StrGrid1.Cells[4, 2]:=Qry.FieldValues['Distribution_reference'];
          StrGrid1.Cells[5, 2]:=Qry.FieldValues['DATE'];
          StrGrid1.Cells[6, 2]:='IDR';

          {Grid 2}
          Inc(IntSeq);
          StrGrid2.Cells[0,IntCount+2]:='WHDC';
          StrGrid2.Cells[1,IntCount+2]:=StrJurnal;//FormatDateTime('YYYYMMDD', VarToDateTime(Qry.FieldValues['DATE'])); {Increament tidak harus diisi}
          StrGrid2.Cells[2,IntCount+2]:=IntToStr(IntSeq*100);
          StrGrid2.Cells[3,IntCount+2]:=Trim(Qry.FieldValues['COA']);;
          StrGrid2.Cells[4,IntCount+2]:=Qry.FieldValues['Distribution_reference'];
          StrGrid2.Cells[5,IntCount+2]:=Qry.FieldValues['DEBIT_AMOUNT'];
          StrGrid2.Cells[6,IntCount+2]:=Qry.FieldValues['KREDIT_AMOUNT'];
        end;
      end else begin
          if Qry.RecordCount>1 Then begin
            {Grid 2}
            Inc(IntSeq);
            if IsShowSJ then StrVhcTrans:=Qry.FieldValues['vhc_trans_id']+'|' else StrVhcTrans:='';
            StrGrid2.Cells[0,IntCount+2]:='WHDC';
            StrGrid2.Cells[1,IntCount+2]:=StrJurnal;//FormatDateTime('YYYYMMDD', VarToDateTime(Qry.FieldValues['DATE'])); {Increament tidak harus diisi}
            StrGrid2.Cells[2,IntCount+2]:=StrVhcTrans+IntToStr(IntSeq*100);
            StrGrid2.Cells[3,IntCount+2]:=Trim(Qry.FieldValues['COA']);;
            StrGrid2.Cells[4,IntCount+2]:=Qry.FieldValues['Distribution_reference'];
            StrGrid2.Cells[5,IntCount+2]:=Qry.FieldValues['DEBIT_AMOUNT'];
            StrGrid2.Cells[6,IntCount+2]:=Qry.FieldValues['KREDIT_AMOUNT'];
          end;
      end;
      Inc(IntCount);
      Qry.Next;
    end else begin
      MessageBox(0,'Tidak Ada Data GL INTERFACE HEADER !!!','Preview Integrate HPP',MB_OK or MB_ICONWARNING);
    end;
    Qry.Close;

    {Proses AA}
    StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
        QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=1'+StrTripType+StrJenisBeban;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    IntSeq:=0;
    IntSeq2:=0;
    IntCount:=0;
    IntCount2:=0;
    Qry.First;
    StrDistributionReff := '';
    StrNilai := '';
    StrNoSJ  := '';
    DebitAmt:=0;

    if Qry.RecordCount>1 then while not(Qry.Eof) do begin
      {Grid 3}
      //if StrOrderId<>Qry.FieldValues['customer_order_id'] then begin
      if StrGrid3.RowCount<IntCount+2  then StrGrid3.RowCount:=IntCount+2;
      if StrGrid4.RowCount<IntCount2+3 then StrGrid4.RowCount:=IntCount2+3;

        if (VarToStr(Qry.FieldValues['TRX_DIMENSION'])='BODY') then begin
              Inc(IntSeq);
              if IsShowSJ then StrVhcTrans:=Qry.FieldValues['vhc_trans_id']+'|' else StrVhcTrans:='';
              StrGrid3.Cells[0,IntCount+2]:='WHDC';
              StrGrid3.Cells[1,IntCount+2]:=StrJurnal;//FormatDateTime('YYYYMMDD', VarToDateTime(Qry.FieldValues['DATE'])); {Increament tidak harus diisi}
              StrGrid3.Cells[2,IntCount+2]:=StrVhcTrans+IntToStr(IntSeq*100);
              StrGrid3.Cells[3,IntCount+2]:='1';
              StrGrid3.Cells[4,IntCount+2]:=Trim(Qry.FieldValues['COA']);
              StrGrid3.Cells[5,IntCount+2]:=Qry.FieldValues['DEBIT_AMOUNT'];
              StrGrid3.Cells[6,IntCount+2]:='NULL';
              StrGrid3.Cells[7,IntCount+2]:=''; {ALIAS}
              StrGrid3.Cells[8,IntCount+2]:=Qry.FieldValues['Distribution_reference'];
              Inc(IntCount);
          //  end;
          //end;
        end;

        {Grid 4}
        Inc(IntSeq2);
        if IsShowSJ then StrVhcTrans:=Qry.FieldValues['vhc_trans_id']+'|' else StrVhcTrans:='';
        StrGrid4.Cells[0,IntCount2+2]:='WHDC';
        StrGrid4.Cells[1,IntCount2+2]:=StrJurnal;//FormatDateTime('YYYYMMDD', VarToDateTime(Qry.FieldValues['DATE'])); {Increament tidak harus diisi}
        StrGrid4.Cells[2,IntCount2+2]:=StrVhcTrans+IntToStr(IntSeq2*100);
        StrGrid4.Cells[3,IntCount2+2]:=IntToStr(IntSeq*100);
        StrGrid4.Cells[4,IntCount2+2]:=Trim(Qry.FieldValues['TRX_DIMENSION']);
        StrGrid4.Cells[5,IntCount2+2]:=Qry.FieldValues['TRX_DIMENSION_ALPHANUMERIK'];
        Inc(IntCount2);

        StrDistributionReff := Qry.FieldValues['Distribution_reference'];
        StrNilai := VarToStr(Qry.FieldValues['DEBIT_AMOUNT']);
        StrNoSJ  := VarToStr(Qry.FieldValues['vhc_trans_id']);

        DebitAmt:= Qry.FieldValues['DEBIT_AMOUNT'];
      Qry.Next;
    end else begin
      MessageBox(0,'Tidak Ada Data  AA Interface Header !!!','Preview Integrate HPP',MB_OK or MB_ICONWARNING);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPHPPBus.RefreshData2;
var Qry,Qry2:TADOQuery;
    StrQry,StrDiscount,StrOrderId,StrToDates:String;
    StrBatch,StrLocationId,StrCompanyId,StrisAll:String;
    IntCount,IntCount2,IntCount3,IntCount4,IntDiscount,IntTotalDetail,
    IntQty,IntDay,IntSeq,IntSeq2,IntCounterIntegrate:Integer;
    IsShowSJ,IsNewLine:Boolean;
    StrDistributionReff,StrNilai:String;
    StrTripType, StrNoSJ, StrJenisBeban,
    StrVhcTrans,StrJurnal:String;
    DebitAmt:Double;
    TglMulai, TglSelesai:TDate;

    QueryWhaps:TADOQuery;
    StrError, StrDate, StrData,
    StrVhcTransId, StrDimcode, StrJurnalEntri:String;
    isOk:Boolean;
    StrList:TStringList;
    StrQueryWhaps:String;
begin

  InitDB_GP;
  isOk:=True;
  Query:=TADOQuery.Create(Self);
  Query.Connection := GPConnection;
  Query.CommandTimeout := 3600;
  QueryWhaps:=TADOQuery.Create(Self);
  QueryWhaps.Connection := Main.MyConnection;
  QueryWhaps.CommandTimeout := 3600;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;

  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  TglMulai  := FromDates.Date;// - 1 ;
  TglSelesai:= ToDates.Date;// - 1 ;

  if OpenDb_GP and Main.OpenDb then begin
    IsShowSJ:=False;
    Qry.Close;
    GPConnection.BeginTrans;
    //Main.TransStart;
    StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
            'WHERE trx_type='+IntToStr(IntTryType)+' and (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+') '+
            'Order By counter desc';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then IntCounterIntegrate:=Qry.FieldValues['counter']
    else IntCounterIntegrate:=0;
    Qry.Close;

    {Mulai}
    StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy', TglSelesai));
    StrTripType:=',@TripType=0';
    StrJenisBeban:=',@JenisBeban=0';
    IntTryType:=0;
    //StrJurnal:=Format('%.*d',[2, StrToInt(CompanyId)])+FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
    StrJurnal:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
    StrJurnalEntri:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
    StrJurnal:='0';
    {Proses GL}
    StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
            QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntSeq:=0;
    IntCount:=0;
    if Qry.RecordCount>1 then while not(Qry.Eof) do begin

      StrList:=TStringList.Create;
      StrList:=SplitStrings(VarToStr(Qry.FieldValues['DATE']),'/');
      StrDate:=StrList.Strings[2]+'/'+StrList.Strings[1]+'/'+StrList.Strings[0];

      {Grid 1}
      if Qry.RecNo=1 Then begin

        if Qry.RecNo=1 then begin
          StrList:=TStringList.Create;
          StrList:=SplitStrings(VarToStr(Qry.FieldValues['DATE']), '/');
          StrDate:=StrList.Strings[2]+'/'+StrList.Strings[1]+'/'+StrList.Strings[0];
          Inc(IntSeq);
          StrData:=IntToStr(IntSeq*100);
          StrQuery:=' INSERT INTO GL_INTERFACE_HDR (INTERID,JRNENTRY,BACHNUMB,SOURCDOC,REFRENCE,TRXDATE,CURNCYID)'+
                  ' VALUES ('+
                  QuotedStr('WHDC')+','+
                  QuotedStr(StrJurnalEntri)+','+
                  QuotedStr(Qry.FieldValues['BATCH_ID'])+','+
                  QuotedStr('IMGJ')+','+
                  QuotedStr(Qry.FieldValues['Distribution_reference'])+','+
                  QuotedStr(StrDate)+','+ //StrGrid1.Cells[5,intCount1]
                  QuotedStr('IDR')+
                  ');';
          StrQuery:=StrQuery+' INSERT INTO GL_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ACTNUMBR,DSCRIPTN,ORCRDAMT,ORDBTAMT)'+
                      ' VALUES ('+
                      QuotedStr('WHDC')+','+
                      QuotedStr(StrJurnalEntri)+','+
                      QuotedStr(Trim(StrData))+','+
                      QuotedStr(Trim(VarToStr(Qry.FieldValues['COA'])))+','+
                      QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']),31))+','+
                      QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+
                      QuotedStr(VarToStr(Qry.FieldValues['KREDIT_AMOUNT']))+
                      '); ';
          Query.SQL.Clear;
          Main.WriteLog('SQL :'+StrQuery,4);
          Query.SQL.Add(StrQuery);
          try
            Query.ExecSQL;
          except
            on E:Exception do begin
              StrError := StrError + 'Error GL_INTERFACE_HDR & GL_INTERFACE_HDR '+#13#10;
              IsOk:=False;
            end;
          end;

        end;
      end else begin
          if Qry.RecordCount>1 Then begin
            {Grid 2}
            StrData:=IntToStr(IntSeq*100);
            StrQuery:=' INSERT INTO GL_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ACTNUMBR,DSCRIPTN,ORCRDAMT,ORDBTAMT)'+
                      ' VALUES ('+
                      QuotedStr('WHDC')+','+
                      QuotedStr(StrJurnalEntri)+','+
                      QuotedStr(Trim(StrData))+','+
                      QuotedStr(Trim(VarToStr(Qry.FieldValues['COA'])))+','+
                      QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']),31))+','+
                      QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+
                      QuotedStr(VarToStr(Qry.FieldValues['KREDIT_AMOUNT']))+
                      '); ';
            Query.SQL.Clear;
            Main.WriteLog('SQL :'+StrQuery,4);
            Query.SQL.Add(StrQuery);
            try
              Query.ExecSQL;
            except
              on E:Exception do begin
                StrError := StrError + 'Error GL_INTERFACE_DTL '+E.Message+#13#10;
                Memo1.Lines.Add(Query.SQL.Text);
                IsOk:=False;
              end;
            end;

            //isGPsync
            StrVhcTransId:=Qry.FieldValues['vhc_trans_id'];
            StrQueryWhaps:='UPDATE WH_VHC_TRANS SET isGPsync=1 WHERE VHC_TRANS_ID='+QuotedStr(StrVhcTransId)+'; ';
            QueryWhaps.SQL.Clear;
            Main.WriteLog('SQL :'+StrQueryWhaps,4);
            QueryWhaps.SQL.Add(StrQueryWhaps);
            try
              QueryWhaps.ExecSQL;
            except
              on E:Exception do begin
                StrError := StrError + 'Error Update VhcTrans '+#13#10;
                IsOk:=False;
              end;
            end;
          end;
      end;
      Inc(IntSeq);
      Qry.Next;
    end else begin
      ShowMessage('Tidak Ada Data');
    end;
    LastSeq2:=IntSeq;
    Qry.Close;

    {Proses AA}
    StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
        QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=1'+StrTripType+StrJenisBeban;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    IntSeq:=0;
    IntSeq2:=0;
    IntCount:=0;
    IntCount2:=0;
    Qry.First;
    StrDistributionReff := '';
    StrNilai := '';
    StrNoSJ  := '';
    DebitAmt:=0;

    if Qry.RecordCount>1 then while not(Qry.Eof) do begin
      {Grid 3}
      if (VarToStr(Qry.FieldValues['TRX_DIMENSION'])='BODY') then begin
        Inc(IntSeq);
        StrQuery:=' INSERT INTO AA_INTERFACE_HDR ('+
                        ' INTERID,JRNENTRY,SQNCLINE,ORD,DISTRIBUTION,ORIGAMT,ASSIGN,ALIAS,REFERENCE)'+
                        ' VALUES ('+
                        QuotedStr('WHDC')+','+
                        QuotedStr(StrJurnalEntri)+','+
                        QuotedStr(IntToStr(IntSeq*100))+','+
                        QuotedStr('1')+','+ {ORD}
                        QuotedStr(VarToStr(Trim(Qry.FieldValues['COA'])))+','+ {DISTRIBUTION}
                        QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+ {ORIGAMT}
                        '0,'+ {ASSIGN}
                        QuotedStr('')+','+ {ALIAS}
                        QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']), 31))+     {REFERENCE}
                        ');';
        Query.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        Query.SQL.Add(StrQuery);
        if Trim(StrGrid3.Cells[0,intCount3])<>'' then begin
          try
            Query.ExecSQL;
            except on E:Exception do begin
                    StrError := StrError + 'Error AA_INTERFACE_HDR '+#13#10;
                    Memo1.Lines.Add(Query.SQL.Text);
                    IsOk:=False;
                  end;
          end;
        end;

      end;

      {Grid 4}
      Inc(IntSeq2);
      StrQuery:=' INSERT INTO AA_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ORD,TRXDIM,TRXDIMCODE)'+
                ' VALUES ('+
                QuotedStr('WHDC')+','+
                QuotedStr(StrJurnalEntri)+','+
                QuotedStr(IntToStr(IntSeq2*100))+','+
                QuotedStr(IntToStr(IntSeq*100))+','+
                QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION']))+','+
                QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION_ALPHANUMERIK']))+
                ');';
      Query.SQL.Clear;
      Main.WriteLog('SQL :'+StrQuery,4);
      Query.SQL.Add(StrQuery);
      try
          Query.ExecSQL;
      except on E:Exception do begin
            StrError := StrError + 'Error AA_INTERFACE_DTL '+#13#10;
            Memo1.Lines.Add(Query.SQL.Text);
            IsOk:=False;
          end;
      end;
      Qry.Next;
    end else begin
      ShowMessage('Tidak Ada Data');
    end;
    Qry.Close;

    if IsOk then begin
        GPConnection.CommitTrans;
        Main.TransCommit;
        MessageBox(0,'Proses integrate berhasil Disimpan','Integrate HPP',MB_OK or MB_ICONINFORMATION);
    end else begin
        //EnableInput;
        GPConnection.RollbackTrans;
        Main.TransRollback;
        MessageBox(0,PChar(StrError),'Integrate HPP',MB_OK or MB_ICONERROR);
    end;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPHPPBus.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshJenis;
end;

procedure TIntegrateGPHPPBus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TIntegrateGPHPPBus.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TIntegrateGPHPPBus.ToXCel1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid1,'File Interface Header',StrGrid2,'File Interface Detail',StrGrid3,'File AA Interface Header',StrGrid4,'File AA Interface Detail') then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPHPPBus.ToXcel2Click(Sender: TObject);
begin
  if ToExcel4(StrGrid2) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TIntegrateGPHPPBus.ProcessClick(Sender: TObject);
begin
  ProcessData;
end;

procedure TIntegrateGPHPPBus.ProcessData;
begin
  InitGrid1;
  InitGrid2;
  InitGrid3;
  InitGrid4;
  RefreshData1;
  posting.Enabled:=True;
end;

procedure TIntegrateGPHPPBus.GPLastGLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TIntegrateGPHPPBus.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];  
end;

procedure TIntegrateGPHPPBus.SpeedButton1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid3) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPHPPBus.ToDateClick(Sender: TObject);
begin
  if ToDate.Checked=True then begin
    ToDates.Enabled:=True;
  end else begin
    ToDates.Enabled:=False;
  end;
end;

procedure TIntegrateGPHPPBus.InitDB_GP;
var IsOk:Boolean;
begin
  StrConnection:='Provider='+ProviderGP+';Password='+DbPassGP+';Persist Security Info=True;User ID='+DbUserGP+';Initial Catalog='+DbGP+';Data Source='+DbHostGP;
  GPConnection:=TADOConnection.Create(Self);
  GPConnection.Connected:=False;
  GPConnection.KeepConnection:=False;
  GPConnection.CursorLocation:=clUseClient;
  GPConnection.LoginPrompt:=False;
  GPConnection.CommandTimeout:=3600;
  GPConnection.ConnectionTimeout:=3600;
  Main.WriteLog('Init DB GP');
  IsOk:=True;
  try
    //CreateDbConnection;
    GpConnection.ConnectionString:=StrConnection;
  except
    on E:Exception do begin
      Main.WriteLog('Error Create DB Connection GP');
      IsOk:=False;
      //SetManual:=MessageBox(Handle,PChar('Error Create DB Connection'+e.Message+Chr(13)+Chr(13)+' Set Connection Manually ?'),'Database',MB_OKCANCEL or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;

  if IsOk then Main.WriteLog('Finish Init DB GP')
  else Main.WriteLog('Error Init DB GP');
end;

function TIntegrateGPHPPBus.OpenDb_GP:Boolean;
var IsOk:Boolean;
    StrMsg:String;
begin
  IsOk:=True;
  if IsPortOpened(DbHostGP,1433) then begin
    try
      Main.WriteLog('Open DB Connection');
      GPConnection.Open;
    except
      on E:Exception do begin
        IsOk:=False;
        Main.WriteLog('Error Opening DB Connection');
        StrMsg:='Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message;
        MessageBox(Handle,PChar(StrMsg),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
    end;
  end;
  Result:=IsOk;
end;

procedure TIntegrateGPHPPBus.postingClick(Sender: TObject);
var
  intCount1, intCount2, intCount3, intCount4,
  IntCounterIntegrate : Integer;
  StrError, StrDate, StrData,
  StrVhcTransId, StrDimcode, StrJurnalEntri, StrQry:String;
  isOk:Boolean;
  StrList:TStringList;
  QueryWhaps:TADOQuery;
begin
    InitDB_GP;
    isOk:=True;
    Query:=TADOQuery.Create(Self);
    Query.Connection := GPConnection;
    Query.CommandTimeout := 3600;
    QueryWhaps:=TADOQuery.Create(Self);
    QueryWhaps.Connection := Main.MyConnection;
    QueryWhaps.CommandTimeout := 3600;
    StrError:='';
    if OpenDb_GP and Main.OpenDb then begin
      GPConnection.BeginTrans;
      Main.TransStart;

      StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
              'WHERE (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+')'+ //trx_type='+IntToStr(IntTryType)+' and 
              'Order By counter desc';
      Main.WriteLog('SQL :'+StrQry,2);
      QueryWhaps.SQL.Clear;
      QueryWhaps.SQL.Add(StrQry);
      QueryWhaps.Open;
      if QueryWhaps.RecordCount>0 then IntCounterIntegrate:=QueryWhaps.FieldValues['counter']
      else IntCounterIntegrate:=0;
      QueryWhaps.Close;

      for intCount1:=2 to StrGrid1.RowCount-1 do begin

        StrList:=TStringList.Create;
        StrList:=SplitStrings(StrGrid1.Cells[5,intCount1],'/');
        StrDate:=StrList.Strings[2]+'/'+StrList.Strings[1]+'/'+StrList.Strings[0];
        {
        StrJurnalEntri := StrGrid1.Cells[1,intCount1];
        StrJurnalEntri := '';
        }
        StrJurnalEntri:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
        StrQuery:=' INSERT INTO GL_INTERFACE_HDR (INTERID,JRNENTRY,BACHNUMB,SOURCDOC,REFRENCE,TRXDATE,CURNCYID)'+
                  ' VALUES ('+
                  QuotedStr(StrGrid1.Cells[0,intCount1])+','+
                  QuotedStr(StrJurnalEntri)+','+
                  QuotedStr(StrGrid1.Cells[2,intCount1])+','+
                  QuotedStr(StrGrid1.Cells[3,intCount1])+','+
                  QuotedStr(StrGrid1.Cells[4,intCount1])+','+
                  QuotedStr(StrDate)+','+ //StrGrid1.Cells[5,intCount1]
                  QuotedStr(StrGrid1.Cells[6,intCount1])+
                  ');';
        Query.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        Query.SQL.Add(StrQuery);
        try
          Query.ExecSQL;
        except
          on E:Exception do begin
            StrError := StrError + 'Error GL_INTERFACE_HDR '+#13#10;
            IsOk:=False;
          end;
        end;

      end;

      {data 2}
      StrQuery:='';
      for intCount2:=2 to StrGrid2.RowCount-2 do begin
        if LeftStr(StrGrid2.Cells[2,intCount2],2)='SJ' Then StrData:=MidStr(StrGrid2.Cells[2,intCount2],15, 8)
        else StrData:=StrGrid2.Cells[2,intCount2];
        StrQuery:=' INSERT INTO GL_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ACTNUMBR,DSCRIPTN,ORCRDAMT,ORDBTAMT)'+
                  ' VALUES ('+
                  QuotedStr(StrGrid2.Cells[0,intCount2])+','+
                  QuotedStr(StrJurnalEntri)+','+
                  QuotedStr(Trim(StrData))+','+
                  QuotedStr(StrGrid2.Cells[3,intCount2])+','+
                  QuotedStr(LeftStr(StrGrid2.Cells[4,intCount2],31))+','+
                  QuotedStr(StrGrid2.Cells[5,intCount2])+','+
                  QuotedStr(StrGrid2.Cells[6,intCount2])+
                  '); ';
        Query.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        Query.SQL.Add(StrQuery);

        StrList:=SplitStrings(StrGrid2.Cells[2,intCount2],'|');
        StrVhcTransId:=StrList.Strings[0];

        //isGPsync
        StrQuery:='UPDATE WH_VHC_TRANS SET isGPsync=1 WHERE VHC_TRANS_ID='+QuotedStr(StrVhcTransId)+'; ';
        QueryWhaps.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        QueryWhaps.SQL.Add(StrQuery);
        try
          QueryWhaps.ExecSQL;
        except
          on E:Exception do begin
            StrError := StrError + 'Error Update VhcTrans '+#13#10;
            IsOk:=False;
          end;
        end;
        try
          Query.ExecSQL;
        except
          on E:Exception do begin
            StrError := StrError + 'Error GL_INTERFACE_DTL '+E.Message+#13#10;
            Memo1.Lines.Add(Query.SQL.Text);
            IsOk:=False;
          end;
        end;

      end;

      {data 3}
      StrQuery:='';
      for intCount3:=2 to StrGrid3.RowCount-2 do begin
        if LeftStr(StrGrid3.Cells[2,intCount3],2)='SJ' Then StrData:=MidStr(StrGrid3.Cells[2,intCount3],15, 8)
        else StrData:=StrGrid3.Cells[2,intCount3];
        StrQuery:=' INSERT INTO AA_INTERFACE_HDR ('+
                  ' INTERID,JRNENTRY,SQNCLINE,ORD,DISTRIBUTION,ORIGAMT,ASSIGN,ALIAS,REFERENCE)'+
                  ' VALUES ('+
                  QuotedStr(StrGrid3.Cells[0,intCount3])+','+
                  QuotedStr(StrJurnalEntri)+','+
                  QuotedStr(Trim(StrData))+','+
                  QuotedStr(StrGrid3.Cells[3,intCount3])+','+ {ORD}
                  QuotedStr(StrGrid3.Cells[4,intCount3])+','+ {DISTRIBUTION}
                  QuotedStr(StrGrid3.Cells[5,intCount3])+','+ {ORIGAMT}
                  '0,'+ {ASSIGN}
                  QuotedStr(StrGrid3.Cells[7,intCount3])+','+ {ALIAS}
                  QuotedStr(LeftStr(StrGrid3.Cells[8,intCount3], 31))+     {REFERENCE}
                  ');';
        Query.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        Query.SQL.Add(StrQuery);
        if Trim(StrGrid3.Cells[0,intCount3])<>'' then begin
          try
            Query.ExecSQL;
          except
            on E:Exception do begin
              StrError := StrError + 'Error AA_INTERFACE_HDR '+#13#10;
              IsOk:=False;
            end;
          end;
        end;

      end;

      {data 4}
      StrQuery:='';
      for intCount3:=2 to StrGrid4.RowCount-2 do begin
        if LeftStr(StrGrid4.Cells[2,intCount3],2)='SJ' Then StrData:=MidStr(StrGrid4.Cells[2,intCount3],15, 8)
        else StrData:=StrGrid4.Cells[2,intCount3];
        StrDimcode:= StrGrid4.Cells[5,intCount3];
        //StrDimcode:= StringReplace(StrDimcode,'CT/','CT',[rfReplaceAll]);
        StrQuery:=' INSERT INTO AA_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ORD,TRXDIM,TRXDIMCODE)'+
                  ' VALUES ('+
                  QuotedStr(StrGrid4.Cells[0,intCount3])+','+
                  QuotedStr(StrJurnalEntri)+','+
                  QuotedStr(Trim(StrData))+','+
                  QuotedStr(StrGrid4.Cells[3,intCount3])+','+
                  QuotedStr(StrGrid4.Cells[4,intCount3])+','+
                  QuotedStr(StrDimcode)+
                  ');';
        Query.SQL.Clear;
        Main.WriteLog('SQL :'+StrQuery,4);
        Query.SQL.Add(StrQuery);
        try
          Query.ExecSQL;
        except
          on E:Exception do begin
            StrError := StrError + 'Error AA_INTERFACE_DTL '+#13#10;
            IsOk:=False;
          end;
        end;

      end;
      FreeAndNil(StrList);
      {Update counter}
      StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
              'WHERE trx_type='+IntToStr(IntTryType)+' and (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+')'+
              'Order By counter desc';
      StrQry:='INSERT INTO wh_integrate_journal_counter (trx_type, company_id, yearmonth, counter) '+
              ' VALUES '+
              '('+
              IntToStr(IntTryType)+','+CompanyId+
              ','+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+','+QuotedStr(Format('%.*d',[4, IntCounterIntegrate+1]))+
              ')';
      Main.WriteLog('SQL :'+StrQry,2);
      QueryWhaps.SQL.Clear;
      QueryWhaps.SQL.Add(StrQry);
      try
          QueryWhaps.ExecSQL;
      except
        on E:Exception do begin
          StrError := StrError + 'Error Insert Counter '+#13#10;
          IsOk:=False;
        end;
      end;

      QueryWhaps.Close;

      if IsOk then begin
        GPConnection.CommitTrans;
        Main.TransCommit;
        MessageBox(0,'Proses integrate berhasil Disimpan','Integrate HPP',MB_OK or MB_ICONINFORMATION);
      end else begin
        //EnableInput;
        GPConnection.RollbackTrans;
        Main.TransRollback;
        MessageBox(0,PChar(StrError),'Integrate HPP',MB_OK or MB_ICONERROR);
      end;

    end;
end;

procedure TIntegrateGPHPPBus.SelesaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_F3 then  Memo1.Visible := Not Memo1.Visible;
end;

procedure TIntegrateGPHPPBus.butIntegrateClick(Sender: TObject);
var Qry,Qry2:TADOQuery;
    StrQry,StrDiscount,StrOrderId,StrToDates:String;
    StrBatch,StrLocationId,StrCompanyId,StrisAll:String;
    IntCount,IntCount2,IntCount3,IntCount4,IntDiscount,IntTotalDetail,
    IntQty,IntDay,IntSeq,IntSeq2,IntCounterIntegrate,IntStepIntegrate:Integer;
    IsShowSJ,IsNewLine:Boolean;
    StrDistributionReff,StrNilai:String;
    StrTripType, StrNoSJ, StrJenisBeban,
    StrVhcTrans,StrJurnal:String;
    DebitAmt:Double;
    TglMulai, TglSelesai:TDate;
    IntJenisBeban:Integer;
    QueryWhaps:TADOQuery;
    StrError, StrDate, StrData,
    StrVhcTransId, StrDimcode, StrJurnalEntri:String;
    isOk:Boolean;
    StrList:TStringList;
    StrQueryWhaps:String;
    isDataExist : Boolean;
begin

  InitDB_GP;
  isOk:=True;
  Query:=TADOQuery.Create(Self);
  Query.Connection := GPConnection;
  Query.CommandTimeout := 3600;
  QueryWhaps:=TADOQuery.Create(Self);
  QueryWhaps.Connection := Main.MyConnection;
  QueryWhaps.CommandTimeout := 3600;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;

  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  TglMulai  := FromDates.Date;// - 1 ;
  TglSelesai:= ToDates.Date;// - 1 ;

  if OpenDb_GP and Main.OpenDb then begin
    IsShowSJ:=False;
    Qry.Close;
    GPConnection.BeginTrans;
    Main.TransStart;
    isDataExist := False;
    for IntJenisBeban:=0 to 3 do begin
        {Get Counter}
        StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
                'WHERE trx_type='+IntToStr(IntTryType)+' and (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+') '+
                'Order By counter desc';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IntCounterIntegrate:=Qry.FieldValues['counter']+1
        else IntCounterIntegrate:=1;
        Qry.Close;

        {Mulai Dalam kota}
        //Cek apakah ada detail atau tidak
        StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        IntSeq:=0;
        IntCount:=0;
        if Qry.RecordCount<1 then Continue
        else if (Qry.FieldValues['DEBIT_AMOUNT']=0) AND (Qry.FieldValues['KREDIT_AMOUNT']=0) then Continue
        else begin
            isDataExist := true;
            StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy', TglSelesai));
            StrTripType:=',@TripType=0';
            StrJenisBeban:=',@JenisBeban='+IntToStr(IntJenisBeban);
            IntTryType:=0;
            //StrJurnal:=Format('%.*d',[2, StrToInt(CompanyId)])+FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
            StrJurnal:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate]);
            StrJurnalEntri:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate]);
            StrJurnal:='0';

            {Proses GL}
            { GL_INTERFACE_HDR }
            StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                    QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=1';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            StrList:=TStringList.Create;
            StrList:=SplitStrings(VarToStr(Qry.FieldValues['DATE']),'/');
            StrDate:=StrList.Strings[2]+'/'+StrList.Strings[1]+'/'+StrList.Strings[0];
            StrQuery:=' INSERT INTO GL_INTERFACE_HDR (INTERID,JRNENTRY,BACHNUMB,SOURCDOC,REFRENCE,TRXDATE,CURNCYID)'+
                      ' VALUES ('+
                      QuotedStr('WHDC')+','+
                      QuotedStr(StrJurnalEntri)+','+
                      QuotedStr(Qry.FieldValues['BATCH_ID'])+','+
                      QuotedStr('IMGJ')+','+
                      QuotedStr(Qry.FieldValues['Distribution_reference'])+','+
                      QuotedStr(StrDate)+','+ //StrGrid1.Cells[5,intCount1]
                      QuotedStr('IDR')+
                      ');';
            Query.SQL.Clear;
            Main.WriteLog('SQL :'+StrQuery,4);
            Query.SQL.Add(StrQuery);
            try
              Query.ExecSQL;
            except
              on E:Exception do begin
                StrError := StrError + 'Error GL_INTERFACE_HDR '+#13#10;
                IsOk:=False;
              end;
            end;

            { GL_INTERFACE_DTL }
            StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                    QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            IntSeq:=0;
            IntCount:=0;
            if Qry.RecordCount>1 then while not(Qry.Eof) do begin
              {Grid 2}
              Inc(IntSeq);
              StrData:=IntToStr(IntSeq*100);
              StrQuery:=' INSERT INTO GL_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ACTNUMBR,DSCRIPTN,ORCRDAMT,ORDBTAMT)'+
                        ' VALUES ('+
                          QuotedStr('WHDC')+','+
                          QuotedStr(StrJurnalEntri)+','+
                          QuotedStr(Trim(StrData))+','+
                          QuotedStr(Trim(VarToStr(Qry.FieldValues['COA'])))+','+
                          QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']),31))+','+
                          QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+
                          QuotedStr(VarToStr(Qry.FieldValues['KREDIT_AMOUNT']))+
                        '); ';
              Query.SQL.Clear;
              Main.WriteLog('SQL :'+StrQuery,4);
              Query.SQL.Add(StrQuery);
              try
                Query.ExecSQL;
              except
                on E:Exception do begin
                  StrError := StrError + 'Error GL_INTERFACE_DTL '+E.Message+#13#10;
                  Memo1.Lines.Add(Query.SQL.Text);
                  IsOk:=False;
                end;
              end;
              Qry.Next;
            end else begin
              //ShowMessage('Tidak Ada Data');
              StrError := StrError + 'Tidak Ada Data '+#13#10;
              Memo1.Lines.Add(Qry.SQL.Text);
              //IsOk:=False;
            end;
            LastSeq2:=IntSeq;
            Qry.Close;

            {Proses AA}
            { AA_INTERFACE_HDR }
            StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=1'+StrTripType+StrJenisBeban;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;

            IntSeq:=1;      IntSeq2:=0;
            IntCount:=0;    IntCount2:=0;
            Qry.First;
            StrDistributionReff := '';
            StrNilai := '';
            StrNoSJ  := '';
            DebitAmt:=0;

            if Qry.RecordCount>1 then while not(Qry.Eof) do begin
              {Grid 3}
              if (VarToStr(Qry.FieldValues['TRX_DIMENSION'])='BODY') then begin
                  Inc(IntSeq);
                  StrQuery:=' INSERT INTO AA_INTERFACE_HDR ('+
                            ' INTERID,JRNENTRY,SQNCLINE,ORD,DISTRIBUTION,ORIGAMT,ASSIGN,ALIAS,REFERENCE)'+
                            ' VALUES ('+
                            QuotedStr('WHDC')+','+
                            QuotedStr(StrJurnalEntri)+','+
                            QuotedStr(IntToStr(IntSeq*100))+','+
                            QuotedStr('1')+','+ {ORD}
                            QuotedStr(VarToStr(Trim(Qry.FieldValues['COA'])))+','+ {DISTRIBUTION}
                            QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+ {ORIGAMT}
                            '0,'+ {ASSIGN}
                            QuotedStr('')+','+ {ALIAS}
                            QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']), 31))+     {REFERENCE}
                            ');';
                  Query.SQL.Clear;
                  Main.WriteLog('SQL :'+StrQuery,4);
                  Query.SQL.Add(StrQuery);
                  try
                    Query.ExecSQL;
                  except
                    on E:Exception do begin
                      StrError := StrError + 'Error AA_INTERFACE_HDR '+#13#10;
                      Memo1.Lines.Add(Query.SQL.Text);
                      IsOk:=False;
                      end;
                  end;

              end;

              {Grid 4}
              Inc(IntSeq2);
              StrQuery:=' INSERT INTO AA_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ORD,TRXDIM,TRXDIMCODE)'+
                          ' VALUES ('+
                          QuotedStr('WHDC')+','+
                          QuotedStr(StrJurnalEntri)+','+
                          QuotedStr(IntToStr(IntSeq2*100))+','+
                          QuotedStr(IntToStr(IntSeq*100))+','+
                          QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION']))+','+
                          QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION_ALPHANUMERIK']))+
                          ');';
              Query.SQL.Clear;
              Main.WriteLog('SQL :'+StrQuery,4);
              Query.SQL.Add(StrQuery);
              try
                  Query.ExecSQL;
              except
                  on E:Exception do begin
                    StrError := StrError + 'Error AA_INTERFACE_DTL '+#13#10;
                    Memo1.Lines.Add(Query.SQL.Text);
                    IsOk:=False;
                  end;
              end;
              Qry.Next;
            end else begin
              //ShowMessage('Tidak Ada Data');
              StrError := StrError + 'Tidak Ada Data '+#13#10;
              Memo1.Lines.Add(Qry.SQL.Text);
              //IsOk:=False;
            end;
            Qry.Close;

            { Update isGPsync }
            StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                    QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            IntSeq:=0;
            IntCount:=0;
            if Qry.RecordCount>1 then while not(Qry.Eof) do begin
              //isGPsync
              StrVhcTransId:=Qry.FieldValues['vhc_trans_id'];
              StrQueryWhaps:=' UPDATE WH_VHC_TRANS SET isGPsync=1, isGPsync_update_time=GETDATE() '+
                             ' WHERE VHC_TRANS_ID='+QuotedStr(StrVhcTransId)+'; ';
              QueryWhaps.SQL.Clear;
              Main.WriteLog('SQL :'+StrQueryWhaps,4);
              QueryWhaps.SQL.Add(StrQueryWhaps);
              try
                QueryWhaps.ExecSQL;
              except on E:Exception do begin
                        StrError := StrError + 'Error Update VhcTrans '+#13#10;
                        IsOk:=False;
                end;
              end;
              Qry.Next;
            end;
            Qry.Close;
            {Update counter}
            StrQry:='INSERT INTO wh_integrate_journal_counter (trx_type, company_id, yearmonth, counter) '+
                    ' VALUES '+
                    '('+
                    IntToStr(IntTryType)+','+CompanyId+
                    ','+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+','+QuotedStr(Format('%.*d',[4, IntCounterIntegrate]))+
                    ')';
            Main.WriteLog('SQL :'+StrQry,2);
            QueryWhaps.SQL.Clear;
            QueryWhaps.SQL.Add(StrQry);
            try
                      QueryWhaps.ExecSQL;
            except
              on E:Exception do begin
                StrError := StrError + 'Error Insert Counter '+#13#10;
                IsOk:=False;
              end;
            end;
            QueryWhaps.Close;
        end;

        if IntJenisBeban<>3 then begin
              {Get Counter}
              StrQry:='SELECT counter FROM wh_integrate_journal_counter '+
                      'WHERE trx_type='+IntToStr(IntTryType)+' and (yearmonth='+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+') '+
                      'Order By counter desc';
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
              if Qry.RecordCount>0 then IntCounterIntegrate:=Qry.FieldValues['counter']+1
              else IntCounterIntegrate:=1;
              Qry.Close;

              {Mulai Luar kota}
              //Cek apakah ada detail atau tidak
              StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                      QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
              IntSeq:=0;
              IntCount:=0;
              if Qry.RecordCount<1 then Continue
              else if (Qry.FieldValues['DEBIT_AMOUNT']=0) AND (Qry.FieldValues['KREDIT_AMOUNT']=0) then Continue
              else begin
                  isDataExist := true;
                  StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy', TglSelesai));
                  StrTripType:=',@TripType=1';
                  StrJenisBeban:=',@JenisBeban='+IntToStr(IntJenisBeban);
                  IntTryType:=0;
                  //StrJurnal:=Format('%.*d',[2, StrToInt(CompanyId)])+FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate+1]);
                  StrJurnal:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate]);
                  StrJurnalEntri:=FormatDateTime('yymm', FromDates.Date)+Format('%.*d',[4, IntCounterIntegrate]);
                  StrJurnal:='0';
    
                  {Proses GL}
                  { GL_INTERFACE_HDR }
                  StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                          QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=1';
                  Qry.SQL.Clear;
                  Qry.SQL.Add(StrQry);
                  Qry.Open;
                  StrList:=TStringList.Create;
                  StrList:=SplitStrings(VarToStr(Qry.FieldValues['DATE']),'/');
                  StrDate:=StrList.Strings[2]+'/'+StrList.Strings[1]+'/'+StrList.Strings[0];
                  StrQuery:=' INSERT INTO GL_INTERFACE_HDR (INTERID,JRNENTRY,BACHNUMB,SOURCDOC,REFRENCE,TRXDATE,CURNCYID)'+
                            ' VALUES ('+
                            QuotedStr('WHDC')+','+
                            QuotedStr(StrJurnalEntri)+','+
                            QuotedStr(Qry.FieldValues['BATCH_ID'])+','+
                            QuotedStr('IMGJ')+','+
                            QuotedStr(Qry.FieldValues['Distribution_reference'])+','+
                            QuotedStr(StrDate)+','+ //StrGrid1.Cells[5,intCount1]
                            QuotedStr('IDR')+
                            ');';
                  Query.SQL.Clear;
                  Main.WriteLog('SQL :'+StrQuery,4);
                  Query.SQL.Add(StrQuery);
                  try
                    Query.ExecSQL;
                  except
                    on E:Exception do begin
                      StrError := StrError + 'Error GL_INTERFACE_HDR '+#13#10;
                      IsOk:=False;
                    end;
                  end;

                  { GL_INTERFACE_DTL }
                  StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                          QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
                  Qry.SQL.Clear;
                  Qry.SQL.Add(StrQry);
                  Qry.Open;
                  IntSeq:=0;
                  IntCount:=0;
                  if Qry.RecordCount>1 then while not(Qry.Eof) do begin
                    {Grid 2}
                    Inc(IntSeq);
                    StrData:=IntToStr(IntSeq*100);
                    StrQuery:=' INSERT INTO GL_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ACTNUMBR,DSCRIPTN,ORCRDAMT,ORDBTAMT)'+
                              ' VALUES ('+
                                QuotedStr('WHDC')+','+
                                QuotedStr(StrJurnalEntri)+','+
                                QuotedStr(Trim(StrData))+','+
                                QuotedStr(Trim(VarToStr(Qry.FieldValues['COA'])))+','+
                                QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']),31))+','+
                                QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+
                                QuotedStr(VarToStr(Qry.FieldValues['KREDIT_AMOUNT']))+
                              '); ';
                    Query.SQL.Clear;
                    Main.WriteLog('SQL :'+StrQuery,4);
                    Query.SQL.Add(StrQuery);
                    try
                      Query.ExecSQL;
                    except
                      on E:Exception do begin
                        StrError := StrError + 'Error GL_INTERFACE_DTL '+E.Message+#13#10;
                        Memo1.Lines.Add(Query.SQL.Text);
                        IsOk:=False;
                      end;
                    end;
                    Qry.Next;
                  end else begin
                    //ShowMessage('Tidak Ada Data');
                    StrError := StrError + 'Tidak Ada Data '+#13#10;
                    Memo1.Lines.Add(Qry.SQL.Text);
                    //IsOk:=False;
                  end;
                  LastSeq2:=IntSeq;
                  Qry.Close;

                  {Proses AA}
                  { AA_INTERFACE_HDR }
                  StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                      QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=1'+StrTripType+StrJenisBeban;
                  Qry.SQL.Clear;
                  Qry.SQL.Add(StrQry);
                  Qry.Open;

                  IntSeq:=1;      IntSeq2:=0;
                  IntCount:=0;    IntCount2:=0;
                  Qry.First;
                  StrDistributionReff := '';
                  StrNilai := '';
                  StrNoSJ  := '';
                  DebitAmt:=0;

                  if Qry.RecordCount>1 then while not(Qry.Eof) do begin
                    {Grid 3}
                    if (VarToStr(Qry.FieldValues['TRX_DIMENSION'])='BODY') then begin
                        Inc(IntSeq);
                        StrQuery:=' INSERT INTO AA_INTERFACE_HDR ('+
                                  ' INTERID,JRNENTRY,SQNCLINE,ORD,DISTRIBUTION,ORIGAMT,ASSIGN,ALIAS,REFERENCE)'+
                                  ' VALUES ('+
                                  QuotedStr('WHDC')+','+
                                  QuotedStr(StrJurnalEntri)+','+
                                  QuotedStr(IntToStr(IntSeq*100))+','+
                                  QuotedStr('1')+','+ {ORD}
                                  QuotedStr(VarToStr(Trim(Qry.FieldValues['COA'])))+','+ {DISTRIBUTION}
                                  QuotedStr(VarToStr(Qry.FieldValues['DEBIT_AMOUNT']))+','+ {ORIGAMT}
                                  '0,'+ {ASSIGN}
                                  QuotedStr('')+','+ {ALIAS}
                                  QuotedStr(LeftStr(VarToStr(Qry.FieldValues['Distribution_reference']), 31))+     {REFERENCE}
                                  ');';
                        Query.SQL.Clear;
                        Main.WriteLog('SQL :'+StrQuery,4);
                        Query.SQL.Add(StrQuery);
                        try
                          Query.ExecSQL;
                        except
                          on E:Exception do begin
                            StrError := StrError + 'Error AA_INTERFACE_HDR '+#13#10;
                            Memo1.Lines.Add(Query.SQL.Text);
                            IsOk:=False;
                            end;
                        end;

                    end;

                    {Grid 4}
                    Inc(IntSeq2);
                    StrQuery:=' INSERT INTO AA_INTERFACE_DTL (INTERID,JRNENTRY,SQNCLINE,ORD,TRXDIM,TRXDIMCODE)'+
                                ' VALUES ('+
                                QuotedStr('WHDC')+','+
                                QuotedStr(StrJurnalEntri)+','+
                                QuotedStr(IntToStr(IntSeq2*100))+','+
                                QuotedStr(IntToStr(IntSeq*100))+','+
                                QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION']))+','+
                                QuotedStr(Trim(Qry.FieldValues['TRX_DIMENSION_ALPHANUMERIK']))+
                                ');';
                    Query.SQL.Clear;
                    Main.WriteLog('SQL :'+StrQuery,4);
                    Query.SQL.Add(StrQuery);
                    try
                        Query.ExecSQL;
                    except
                        on E:Exception do begin
                          StrError := StrError + 'Error AA_INTERFACE_DTL '+#13#10;
                          Memo1.Lines.Add(Query.SQL.Text);
                          IsOk:=False;
                        end;
                    end;
                    Qry.Next;
                  end else begin
                    //ShowMessage('Tidak Ada Data');
                    StrError := StrError + 'Tidak Ada Data '+#13#10;
                    Memo1.Lines.Add(Qry.SQL.Text);
                    //IsOk:=False;
                  end;
                  Qry.Close;

                  { Update isGPsync }
                  StrQry:='EXEC GetIntegrateGPBUDGET_P '+StrLocationId+','+
                          QuotedStr(FormatDateTime('dd-mm-yyyy', TglMulai))+',0,@CompanyId=2,@IsAll=1,@IntegrateType=0'+StrTripType+StrJenisBeban+',@isHeader=0';
                  Qry.SQL.Clear;
                  Qry.SQL.Add(StrQry);
                  Qry.Open;
                  IntSeq:=0;
                  IntCount:=0;
                  if Qry.RecordCount>1 then while not(Qry.Eof) do begin
                    //isGPsync
                    StrVhcTransId:=Qry.FieldValues['vhc_trans_id'];
                    StrQueryWhaps:='UPDATE WH_VHC_TRANS SET isGPsync=1 WHERE VHC_TRANS_ID='+QuotedStr(StrVhcTransId)+'; ';
                    QueryWhaps.SQL.Clear;
                    Main.WriteLog('SQL :'+StrQueryWhaps,4);
                    QueryWhaps.SQL.Add(StrQueryWhaps);
                    try
                      QueryWhaps.ExecSQL;
                    except on E:Exception do begin
                              StrError := StrError + 'Error Update VhcTrans '+#13#10;
                              IsOk:=False;
                      end;
                    end;
                    Qry.Next;
                  end;
                  Qry.Close;
                  {Update counter}
                  StrQry:='INSERT INTO wh_integrate_journal_counter (trx_type, company_id, yearmonth, counter) '+
                          ' VALUES '+
                          '('+
                          IntToStr(IntTryType)+','+CompanyId+
                          ','+QuotedStr(FormatDateTime('yyyymm', FromDates.Date))+','+QuotedStr(Format('%.*d',[4, IntCounterIntegrate]))+
                          ')';
                  Main.WriteLog('SQL :'+StrQry,2);
                  QueryWhaps.SQL.Clear;
                  QueryWhaps.SQL.Add(StrQry);
                  try
                      QueryWhaps.ExecSQL;
                  except
                    on E:Exception do begin
                      StrError := StrError + 'Error Insert Counter '+#13#10;
                      IsOk:=False;
                    end;
                  end;
                  QueryWhaps.Close;
              end;
              {Selesai Luar Kota}
        end;


    end;

    if IsOk then begin
      if Not isDataExist then begin
        GPConnection.RollbackTrans;
        Main.TransRollback;
        MessageBox(0,'Tidak ada data yang akan diproses!!!','Integrate HPP',MB_OK or MB_ICONWARNING);
      end else begin
        GPConnection.CommitTrans;
        Main.TransCommit;
        MessageBox(0,'Proses integrate berhasil Disimpan','Integrate HPP',MB_OK or MB_ICONINFORMATION);
      end;
    end else begin
        //EnableInput;
        GPConnection.RollbackTrans;
        Main.TransRollback;
        MessageBox(0,PChar(StrError),'Integrate HPP',MB_OK or MB_ICONERROR);
    end;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

//exec whdc..spAI_Import_GL_From_Interface 'WHDC'
end.
