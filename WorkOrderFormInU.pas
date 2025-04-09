unit WorkOrderFormInU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, Mask, ComCtrls,
  ExtCtrls, ppParameter, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ZColorStringGrid;

type
  TWorkOrderFormIn = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    NoBody: TEdit;
    NoPolisi: TEdit;
    KeluhanGrid: TZColorStringGrid;
    chkkeluhan: TCheckBox;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupDetail: TGroupBox;
    Label7: TLabel;
    TombolCari: TSpeedButton;
    StrGrid: TStringGrid;
    Cari: TEdit;
    NoPKB: TComboBox;
    GroupParts: TGroupBox;
    PartsGrid: TZColorStringGrid;
    CheckSelect: TCheckBox;
    Keterangan: TEdit;
    GroupPekerjaan: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    PekerjaanGrid: TStringGrid;
    PekerjaanDetail: TEdit;
    Teknisi: TEdit;
    TanggalSelesai: TDateTimePicker;
    JamSelesai: TMaskEdit;
    chkClose: TCheckBox;
    CetakUlang: TButton;
    GroupBox2: TGroupBox;
    StrGrid3: TZColorStringGrid;
    Analisa: TEdit;
    GroupBox3: TGroupBox;
    StrGridMekanik: TZColorStringGrid;
    Mekanik: TEdit;
    ListMekanik: TListBox;
    StatusMekanik: TComboBox;
    PanelMemoKhusus: TPanel;
    MemoKhusus: TCheckBox;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppNoBody: TppLabel;
    ppNoMesin: TppLabel;
    ppOdometer: TppLabel;
    ppTglKeluar: TppLabel;
    ppTglMasuk: TppLabel;
    ppLabel31: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine12: TppLine;
    ppLabel32: TppLabel;
    ppLine13: TppLine;
    ppReprinted: TppLabel;
    ppNoPKB: TppLabel;
    ppLogo: TppImage;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppTipeKendaraan: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppJenisPekerjaan: TppLabel;
    ppLabel33: TppLabel;
    ppLine14: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppKeluhan: TppMemo;
    ppParts: TppMemo;
    ppPekerjaan: TppMemo;
    ppRekomendasi: TppMemo;
    ppWaktu: TppMemo;
    ppTeknisi: TppMemo;
    ppKeterangan: TppMemo;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel17: TppLabel;
    ppAdminBengkel: TppLabel;
    ppKepalaBengkel: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NoPKBChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridClick(Sender: TObject);
    procedure PekerjaanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PekerjaanDetailExit(Sender: TObject);
    procedure PekerjaanDetailKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SimpanClick(Sender: TObject);
    procedure TeknisiExit(Sender: TObject);
    procedure TeknisiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TeknisiKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure PartsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CetakUlangClick(Sender: TObject);
    procedure MekanikExit(Sender: TObject);
    procedure MekanikKeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AnalisaExit(Sender: TObject);
    procedure AnalisaKeyPress(Sender: TObject; var Key: Char);
    procedure KeteranganExit(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure KeluhanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridMekanikSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StatusMekanikExit(Sender: TObject);
    procedure chkCloseClick(Sender: TObject);
  private
    { Private declarations }
    WOArr:Array of TArrString8;
    WorkOrderId,FormRequest:String;
    IsReadOnly,Initiation:Boolean;
    IntArow,IntPCol,IntPRow,IntRow,IntCol,IntRow2,IntCol2:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshList;
    procedure EnableInput;
    procedure DisableInput;
    procedure LoadData;
    procedure Search;
    procedure PreparePrint;
    procedure InitPartsGrid;
    procedure InitKeluhanGrid;
    procedure InitGrid3;
    procedure InitGrid4;
    procedure InitPekerjaan;
    procedure Calculate2;
    procedure Calculate4;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetWODetail(WorkOrderId:String);
  end;

var
  WorkOrderFormIn: TWorkOrderFormIn;
  MinRowGrid, IntMaxRow: Integer;

implementation

uses MainU, DateUtils, RePrintFormU;

{$R *.dfm}

constructor TWorkOrderFormIn.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TWorkOrderFormIn.Calculate2;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid3.RowCount-1 do
    if (Trim(StrGrid3.Cells[1,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid3.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGrid3.Cells[0,IntCount]:='';
end;

procedure TWorkOrderFormIn.Calculate4;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGridMekanik.RowCount-1 do
    if (Trim(StrGridMekanik.Cells[1,IntCount])<>'') and (Trim(StrGridMekanik.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGridMekanik.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGridMekanik.Cells[0,IntCount]:='';
end;

procedure TWorkOrderFormIn.InitGrid4;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGridMekanik.RowCount-1 do
    for IntCount2:=0 to StrGridMekanik.ColCount-1 do
      StrGridMekanik.Cells[IntCount2,IntCount]:='';

  StrGridMekanik.RowCount:=2;
  StrGridMekanik.ColWidths[0]:=20;
  StrGridMekanik.ColWidths[1]:=80;
  StrGridMekanik.ColWidths[2]:=200;

  StrGridMekanik.Cells[0,0]:='No';
  StrGridMekanik.Cells[1,0]:='Status';
  StrGridMekanik.Cells[2,0]:='Mekanik';
  StrGridMekanik.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridMekanik.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridMekanik.CellStyle[2,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGridMekanik.Cells[IntCount,1]:='';
    StrGridMekanik.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderFormIn.InitPekerjaan;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to PekerjaanGrid.RowCount-1 do
    for IntCount2:=0 to PekerjaanGrid.ColCount-1 do
      PekerjaanGrid.Cells[IntCount2,IntCount]:='';
   PekerjaanGrid.RowCount:=2;
  PekerjaanGrid.Cells[0,0]:='           Pekerjaan';
//  PekerjaanGrid.Cells[1,0]:='    Teknisi';
  PekerjaanGrid.Cells[0,1]:='';
//  PekerjaanGrid.Cells[1,1]:='';
end;

procedure TWorkOrderFormIn.Init;
begin
  NoPKB.Text:='';
  NoPKB.Items.Clear;
  NoPKB.ItemIndex:=0;
  Tanggal.Text:='';
  TanggalSelesai.Date:=Now();
  Jam.Text:='';
  JamSelesai.Text:=FormatDateTime('hh:nn',Now());
  NoBody.Text:='';
  NoPolisi.Text:='';
  KeluhanGrid.RowCount:=1;
  KeluhanGrid.Cells[0,0]:='';
  PekerjaanDetail.Text:='';
  PekerjaanDetail.Visible:=False;
  Label6.Visible:=False;
  TanggalSelesai.Visible:=False;
  Label9.Visible:=False;
  JamSelesai.Visible:=False;
  chkClose.Checked:=False;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Odo Msk';
  StrGrid.Cells[4,0]:='Tanggal Msk';
  StrGrid.Cells[5,0]:='Pekerjaan';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
//  PekerjaanGrid.RowCount:=2;
//  PekerjaanGrid.Cells[0,0]:='           Pekerjaan';
//  PekerjaanGrid.Cells[1,0]:='    Teknisi';
//  PekerjaanGrid.Cells[0,1]:='';
//  PekerjaanGrid.Cells[1,1]:='';
  NoPKB.SetFocus;
end;

procedure TWorkOrderFormIn.InitPartsGrid;
var IntCount:Integer;
begin
  PartsGrid.RowCount:=2;
  PartsGrid.ColWidths[0]:=20;
  PartsGrid.ColWidths[1]:=45;
  PartsGrid.ColWidths[2]:=330;
  PartsGrid.ColWidths[3]:=50;
  PartsGrid.ColWidths[4]:=0;

  PartsGrid.Cells[0,0]:='No';
  PartsGrid.Cells[1,0]:='Check';
  PartsGrid.Cells[2,0]:='Part';
  PartsGrid.Cells[3,0]:='Qty';
  PartsGrid.Cells[4,0]:='Kode Part GP';

  PartsGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 3 do begin
    PartsGrid.Cells[IntCount,1]:='';
    PartsGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  PartsGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderFormIn.InitKeluhanGrid;
var IntCount:Integer;
begin
  KeluhanGrid.RowCount:=2;
  KeluhanGrid.ColWidths[0]:=45;
  KeluhanGrid.ColWidths[1]:=318;

  KeluhanGrid.Cells[0,0]:='Check';
  KeluhanGrid.Cells[1,0]:='Deskripsi';

  KeluhanGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  KeluhanGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    KeluhanGrid.Cells[IntCount,1]:='';
    KeluhanGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  KeluhanGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderFormIn.InitGrid3;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=2;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=300;

  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Analisa';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid3.Cells[IntCount,1]:='';
    StrGrid3.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderFormIn.RefreshCombo;
var IntCount:Integer;
begin
end;

procedure TWorkOrderFormIn.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry,ServiceRequestId:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (WorkOrderId<>'') then
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@WorkOrderId='+QuotedStr(WorkOrderId)+';'
    else
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['status']=2 then
      begin
        chkClose.Checked:= True;
        chkClose.Enabled:=False;
        label6.Visible:=True;
        TanggalSelesai.Visible:=True;
        label9.Visible:=True;
        JamSelesai.Visible:=True;
      end else
      begin
        chkClose.Checked:= False;
        chkClose.Enabled:=True;
        label6.Visible:=False;
        TanggalSelesai.Visible:=False;
        label9.Visible:=False;
        JamSelesai.Visible:=False;
      end;
      NoPKB.Items.Add(Qry.FieldValues['work_order_id']);
      NoPKB.ItemIndex:=NoPKB.Items.IndexOf(Qry.FieldValues['work_order_id']);
      NoBody.Text:=Qry.FieldValues['body_id'];

      if Qry.FieldValues['service_request_id']<>NULL then begin
        ServiceRequestId:= Qry.FieldValues['service_request_id'];
      end else begin
        ServiceRequestId:='';
      end;

      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      Tanggal.Text:=Qry.FieldValues['date_in'];
      Jam.Text:=Qry.FieldValues['time_in'];
      TanggalSelesai.Date:=StrToDate(Qry.FieldValues['date_out']);
      if Qry.FieldValues['time_out']<>NULL then JamSelesai.Text:=Qry.FieldValues['time_out'];

      if Qry.FieldValues['ismemo_khusus']=1 then
      begin
        PanelMemoKhusus.Visible:=True;
        MemoKhusus.Checked:=True;
      end else
      begin
        PanelMemoKhusus.Visible:=False;
        MemoKhusus.Checked:=False;
      end;
    end;
    Qry.Close;
    StrQry:='select description,isdone from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=1 and status=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
//    KeluhanGrid.Cell[0,0].Width:='45';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      KeluhanGrid.RowCount:=Qry.RecordCount+1;
      if Qry.FieldValues['isdone']=1 then  begin
        KeluhanGrid.Cells[0,IntCount+1]:='v' ;
        KeluhanGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      end else KeluhanGrid.Cells[0,IntCount+1]:='';
      KeluhanGrid.Cells[1,IntCount+1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;

    Qry.Close;
    StrQry:='select description,isdone from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=2 and status=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if PekerjaanGrid.RowCount<IntCount+1 then PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,IntCount+1]:=Qry.FieldValues['description'];
      PekerjaanGrid.Cells[1,IntCount+1]:='';
      Qry.Next;
      Inc(IntCount);
    end;

    StrQry:='';
    StrQry:='select service_request_id from wh_work_order where work_order_id='+QuotedStr(WorkOrderId)+'  ;';
    Qry2.SQL.Clear;
    Qry2.Close;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;


    if Qry2.FieldValues['service_request_id']<>NULL then begin
       ServiceRequestId:=Qry2.FieldValues['service_request_id'];
    end else begin
       ServiceRequestId:='';
    end;

    StrQry:='';
//      StrQry:='select * from wh_work_order_part where work_order_id= '+QuotedStr(WorkOrderId)+' and status=1;';
    StrQry:='SELECT a.*,d.IsUsed FROM wh_tanda_terima_detail a '+
          'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
          'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
          'LEFT JOIN wh_work_order_part d on a.kode_part_gp=d.kode_part_gp  and d.status=1  '+
          'WHERE c.no_request='+QuotedStr(ServiceRequestId)+' AND a.status=1;';
    IntCount:=0;
    Qry2.SQL.Clear;
    Qry2.Close;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;

    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
      PartsGrid.RowCount:=Qry2.RecordCount+1;
        PartsGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        if Qry2.FieldValues['isUsed']='1' then
          PartsGrid.Cells[1,IntCount+1]:='v'
        else
          PartsGrid.Cells[1,IntCount+1]:='';
        PartsGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['item_detail'];
        PartsGrid.Cells[3,IntCount+1]:=Qry2.FieldValues['qty'];
        if Qry2.FieldValues['kode_part_gp']<>NULL then
          PartsGrid.Cells[4,IntCount+1]:=Qry2.FieldValues['kode_part_gp']
        else PartsGrid.Cells[4,IntCount+1]:='';

        PartsGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
        PartsGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
        PartsGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
        Qry2.Next;
        Inc(IntCount);
    end;

    //Mekanik
    StrQry:='';
    StrQry:='select * from wh_work_order_mekanik where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'status=1 ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGridMekanik.Cells[1,IntCount]:= Qry2.FieldValues['status_mekanik'];
      StrGridMekanik.Cells[2,IntCount]:= Qry2.FieldValues['name'];
      StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
      StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;

    //ANALISA
    StrQry:='';
    StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=3 and status=1 ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
      StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid3.Cells[1,IntCount]:= Qry2.FieldValues['description'];
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;
//    Qry.Next;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TWorkOrderFormIn.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.M_Busy;
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@Status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      WOArr[IntCount][3]:=Qry.FieldValues['odo_in'];
      WOArr[IntCount][4]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][5]:=Qry.FieldValues['time_in'];
      WOArr[IntCount][6]:=Qry.FieldValues['job_inout'];
      WOArr[IntCount][7]:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['ismemo_khusus']='1' then
      WOArr[IntCount][8]:=Qry.FieldValues['ismemo_khusus']
      else WOArr[IntCount][8]:='';
      Qry.Next;
      Inc(IntCount);
    end;
{    StrQry:='SELECT a.work_order_id,b.description FROM wh_work_order a '+
            ' LEFT JOIN wh_work_order_detail b ON b.work_order_id=a.work_order_id'+
            ' WHERE (a.time_out IS NULL) AND (a.date_out IS NULL) AND (b.description_id=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WODetArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WODetArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WODetArr[IntCount][1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
}
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderFormIn.RefreshList;
var IntCount:Integer;
begin
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=WOArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=WOArr[IntCount][6];
  end;
  for IntCount:=0 to Length(WOArr)-1 do NoPKB.Items.Add(WOArr[IntCount][0]);
end;

procedure TWorkOrderFormIn.EnableInput;
begin
  NoPKB.Enabled:=True;
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;
  GroupPekerjaan.Enabled:=True;
end;

procedure TWorkOrderFormIn.DisableInput;
begin
  NoPKB.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
  GroupPekerjaan.Enabled:=False;
end;

procedure TWorkOrderFormIn.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderFormIn.FormShow(Sender: TObject);
begin
  Init;
  InitPekerjaan;
  InitPartsGrid;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  Cari.Text:='';
  EnableInput;
  if WorkOrderId<>'' then CetakUlang.Visible:=true
  else CetakUlang.Visible:=false;

  if IsReadOnly then begin
    LoadData;
    DisableInput;
  end else begin
    RefreshCombo;
    RefreshData;
    RefreshList;
  end;
end;

procedure TWorkOrderFormIn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderFormIn.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderFormIn.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry,StrServiceReqID:String;
    IntCount:Integer;
begin
  if No_PKB<>'' then begin
  //  Init;
    RePrintForm.ReportName:='PKB';
    RePrintForm.ReportId:=No_PKB;
    if RePrintForm.ShowModal=1 then begin
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      PreparePrint;
      if Main.OpenDb then begin
        StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(No_PKB)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          ppNoPKB.Caption:=Qry.FieldValues['work_order_id'];
          if  Qry.FieldValues['service_request_id']<>NULL then
          StrServiceReqID:= Qry.FieldValues['service_request_id']
          else StrServiceReqID:='';
          ppTglMasuk.Caption:=Qry.FieldValues['date_in'];
          if Qry.FieldValues['time_in']<>NULL then ppTglMasuk.Caption:=ppTglMasuk.Caption+' '+Qry.FieldValues['time_in'];
          if Qry.FieldValues['date_out']<>NULL then ppTglKeluar.Caption:=Qry.FieldValues['date_out'];
          if Qry.FieldValues['time_out']<>NULL then ppTglKeluar.Caption:=ppTglKeluar.Caption+' '+Qry.FieldValues['time_out'];
          ppNoBody.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          ppNoMesin.Caption:=Qry.FieldValues['engine_id'];
          ppOdometer.Caption:=IToCurr(Qry.FieldValues['odo_in']);
          ppTipeKendaraan.Caption:=Qry.FieldValues['batch_name']+' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
          ppJenisPekerjaan.Caption:=Qry.FieldValues['job_inout']+'-';
          if Qry.FieldValues['general_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'General,';
          if Qry.FieldValues['body_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Body,';
          if Qry.FieldValues['insurance']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Asuransi';
          ppAdminBengkel.Caption:=Qry.FieldValues['user_admin'];
          if Qry.FieldValues['user_close_name']<>NULL then ppKepalaBengkel.Caption:=Qry.FieldValues['user_close_name'];
          if Qry.FieldValues['remark']<>NULL then ppRekomendasi.Lines.Add(Qry.FieldValues['remark']);

          //KELUHAN
          Qry.Close;
          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
                  'description_id=1 and status=1;';
          ppKeluhan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppKeluhan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;

          //PEKERJAAN
          Qry.Close;
          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
                  'description_id=2 and status=1;';
          ppPekerjaan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppPekerjaan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
//            ppTeknisi.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['technician']);
            Inc(IntCount);
            Qry.Next;
          end;

          //ANALISA
//          Qry.Close;
//          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
//                  'description_id=3 and status=1;';
//          ppParts.Lines.Clear;
//          Qry.SQL.Clear;
//          Main.WriteLog('SQL :'+StrQry,2);
//          Qry.SQL.Add(StrQry);
//          Qry.Open;
//          IntCount:=1;
//          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
//            Inc(IntCount);
//            Qry.Next;
//          end;


//          PARTS
          Qry.Close;
          StrQry:='SELECT a.* FROM wh_tanda_terima_detail a '+
                  'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
                  'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
                  'WHERE c.no_request='+QuotedStr(StrServiceReqID)+' AND a.status=1;';

          ppParts.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['item_detail']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;

          //Mekanik
          StrQry:='SELECT name,status_mekanik FROM wh_work_order_mekanik '+
                  'WHERE work_order_id='+QuotedStr(No_PKB)+' AND status=1;';

          ppTeknisi.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppTeknisi.Lines.Add(IntToStr(IntCount)+'. '+Qry.FieldValues['name']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
        end;
        ppReport.PreviewFormSettings.WindowState:=wsMaximized;
        ppReport.Print;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
    end;
  end;
end;

procedure TWorkOrderFormIn.SetWODetail(WorkOrderId:String);
var Qry,Qry2:TADOQuery;
    StrQry,ServiceRequestId:String;
    IntCount,IntRow:Integer;
begin
  if WorkOrderId<>'' then begin
    {
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    NoBody.Text:=WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=WOArr[NoPKB.ItemIndex][5];
    }
    NoBody.Text:=StrGrid.Cells[1,IntARow];//WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=StrGrid.Cells[2,IntARow];//WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=StrGrid.Cells[4,IntARow];//WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=StrGrid.Cells[5,IntARow];//WOArr[NoPKB.ItemIndex][5];
    if StrGrid.Cells[6,IntARow]='1' then begin
      PanelMemoKhusus.Visible:=True;
      MemoKhusus.Visible:=True;
      MemoKhusus.Checked:=True;
    end else
    begin
      PanelMemoKhusus.Visible:=False;
      MemoKhusus.Checked:=False;
    end;
//    KeluhanGrid.RowCount:=1;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='select description,isdone from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=1 and status=1 ';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
          KeluhanGrid.RowCount:=Qry.RecordCount+1;
          if (Qry.FieldValues['isdone']=1) then
            KeluhanGrid.Cells[0,IntCount+1]:='v'
          else
            KeluhanGrid.Cells[0,IntCount+1]:='';
          KeluhanGrid.Cells[1,IntCount+1]:=Qry.FieldValues['description'];
          KeluhanGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
          Qry.Next;
          Inc(IntCount);
      end;
//      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//        if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
//        KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
//        Qry.Next;
//        Inc(IntCount);
//      end;

      //CEK SERVICE REQUEST
      Qry.Close;
      StrQry:='';
      StrQry:='select service_request_id from wh_work_order where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;


      if Qry2.FieldValues['service_request_id']<>NULL then begin
         ServiceRequestId:=Qry2.FieldValues['service_request_id'];
      end else begin
         ServiceRequestId:='';
      end;

//      CEK PART
      StrQry:='EXEC GetPartDiterima '+QuotedStr(ServiceRequestId)+' ;';
//      StrQry:='SELECT a.*,d.IsUsed FROM wh_tanda_terima_detail a '+
//            'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
//            'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
//            'LEFT JOIN wh_work_order_part d on a.kode_part_gp=d.kode_part_gp and d.status=1 '+
//            'WHERE c.no_request='+QuotedStr(ServiceRequestId)+' AND a.status=1;';
      IntCount:=0;
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;

      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        PartsGrid.RowCount:=Qry2.RecordCount+1;
          PartsGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
          if Qry2.FieldValues['isUsed']='1' then
            PartsGrid.Cells[1,IntCount+1]:='v'
          else
            PartsGrid.Cells[1,IntCount+1]:='';
          PartsGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['item_detail'];
          PartsGrid.Cells[3,IntCount+1]:=Qry2.FieldValues['qty'];
          if Qry2.FieldValues['kode_part_gp']<>NULL then
          PartsGrid.Cells[4,IntCount+1]:=Qry2.FieldValues['kode_part_gp']
          else PartsGrid.Cells[4,IntCount+1]:='';

          PartsGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
          PartsGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
          PartsGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
          Qry2.Next;
          Inc(IntCount);
      end;

      //Mekanik
      StrQry:='';
      StrQry:='select * from wh_work_order_mekanik where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'status=1 ;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
        StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGridMekanik.Cells[1,IntCount]:= Qry2.FieldValues['status_mekanik'];
        StrGridMekanik.Cells[2,IntCount]:= Qry2.FieldValues['name'];
        StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry2.Next;
        Inc(IntCount);

      end;
      Qry2.Close;

      //ANALISA
      StrQry:='';
      StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=3 and status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
        StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid3.Cells[1,IntCount]:= Qry2.FieldValues['description'];
        StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
        
        Qry2.Next;
        Inc(IntCount);

      end;

       //PEKERJAAN
      StrQry:='';
      StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=2 and status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if PekerjaanGrid.RowCount<IntCount+1 then PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
        PekerjaanGrid.Cells[0,IntCount]:= Qry2.FieldValues['description'];

//        PekerjaanGrid.CellStyle[0,IntCount].HorizontalAlignment:=taLeftJustify;


        Qry2.Next;
        Inc(IntCount);

      end;
    end;
    FreeAndNil(Qry);
    FreeAndNil(Qry2);
    Main.CloseDb;
  end;
end;

procedure TWorkOrderFormIn.NoPKBChange(Sender: TObject);
begin
  SetWODetail(NoPKB.Text);
end;

procedure TWorkOrderFormIn.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntArow:=Arow;
end;

procedure TWorkOrderFormIn.StrGridClick(Sender: TObject);
begin
  InitPekerjaan;
  InitPartsGrid;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  NoPKB.ItemIndex:=NoPKB.Items.IndexOf(StrGrid.Cells[0,IntARow]);
  SetWODetail(StrGrid.Cells[0,IntARow]);
end;

procedure TWorkOrderFormIn.PekerjaanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  if (ARow>0) and not(IsReadOnly) AND (NoPKB.Text<>'') then begin
    if (ACol = 0) then begin
      R := PekerjaanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PekerjaanGrid.Left;
      R.Right := R.Right + PekerjaanGrid.Left;
      R.Top := R.Top + PekerjaanGrid.Top;
      R.Bottom := R.Bottom + PekerjaanGrid.Top;
      with PekerjaanDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then Text:=PekerjaanGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;

      end;
    end;
//    if (ACol = 1) then begin
//      R := PekerjaanGrid.CellRect(ACol, ARow);
//      R.Left := R.Left + PekerjaanGrid.Left;
//      R.Right := R.Right + PekerjaanGrid.Left;
//      R.Top := R.Top + PekerjaanGrid.Top;
//      R.Bottom := R.Bottom + PekerjaanGrid.Top;
//      with Teknisi do begin
//        Left:=R.Left + 1;
//        Top := R.Top + 1;
//        Width := (R.Right + 1) - R.Left;
//        Height := (R.Bottom + 1) - R.Top;
//        Visible:= True;
//        BringToFront;
//        SetFocus;
//        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then Teknisi.Text:=PekerjaanGrid.Cells[ACol,ARow];
//      end;
//    end;
  end;
end;

procedure TWorkOrderFormIn.PekerjaanDetailExit(Sender: TObject);
begin
  if Trim(PekerjaanDetail.Text)<>'' then PekerjaanGrid.Cells[0,PekerjaanGrid.Row]:=PekerjaanDetail.Text;
  PekerjaanDetail.Text:='';
  PekerjaanDetail.Visible := False;
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderFormIn.PekerjaanDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if (Key=#13) then begin
//    PekerjaanDetailExit(nil);
//
//    if PekerjaanGrid.Cells[2,IntRow]<>'' then begin
//
//      if (PekerjaanGrid.Row=StrGrid2.RowCount-1)  then begin
//        PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
//        PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
//      end;
//      PekerjaanGrid.Col:=0;
//      PekerjaanGrid.Row:=StrGrid2.Row+1;
//      PekerjaanGrid.Col:=1;
//    end;
//  end;


  if (Key=#13) then begin
    PekerjaanDetailExit(nil);
    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
  end;
//  if (Key=#27) then begin
//    PekerjaanDetailExit(nil);
//  end;
end;

procedure TWorkOrderFormIn.BersihkanClick(Sender: TObject);
begin
  EnableInput;
  Init;
  InitPartsGrid;
  InitPekerjaan;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  RefreshData;
  RefreshList;
  RefreshCombo;
end;

procedure TWorkOrderFormIn.PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key=38 then begin
//    if PekerjaanGrid.Row>0 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
//    end;
//  end;
//  if Key=39 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Col:=1;
//  end;
//  if Key=40 then begin
//    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
//    end;
//  end
end;

procedure TWorkOrderFormIn.TeknisiExit(Sender: TObject);
begin
  if Trim(Teknisi.Text)<>'' then PekerjaanGrid.Cells[1,PekerjaanGrid.Row]:=Teknisi.Text;
  Teknisi.Visible := False;
  Teknisi.Text:='';
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderFormIn.TeknisiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=37 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=0;
      PekerjaanGrid.Row:=PekerjaanGrid.Row;  
  end;
  if Key=38 then begin
    if PekerjaanGrid.Row>0 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=1;
      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    end;
  end
end;

procedure TWorkOrderFormIn.TeknisiKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    TeknisiExit(nil);
    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
    PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    PekerjaanGrid.Col:=0;
    PekerjaanDetail.SetFocus;
  end;
  if (Key=#27) then begin
    TeknisiExit(nil);
  end;
end;

procedure TWorkOrderFormIn.SimpanClick(Sender: TObject);
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrStatus,StrMsg,StrEMsg,StrTransId,StrVhcId,StrKeluhan,StrAnalisa,StrDone,StrIsUsed,StrMekanik,StrStatusMekanik,StrPart,StrQty,StrKodePart,StrTanggalSelesai,StrJamSelesai:String;
    IntCount,IntStatus:Integer;
    IsOk:Boolean;
begin
  if (NoPKB.Text<>'') AND (Trim(PekerjaanGrid.Cells[0,0])<>'') then begin
    StrTransId:=NoPKB.Text;
    StrVhcId:=WOArr[ArrayIndexOf(WOArr,NoPKB.Text,0)][7];
    IsOk:=True;
    if chkClose.Checked = True then
    begin
      StrStatus:=',status=2';
      StrTanggalSelesai:='='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalSelesai.Date));
      StrJamSelesai:='='+QuotedStr(JamSelesai.Text+':00');
    end else
    begin
      StrStatus:='';
      StrTanggalSelesai:=' = NULL';
      StrJamSelesai:=' = NULL';
    end;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Qry3:=TADOQuery.Create(Self);
    Qry3.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrMsg:='';
      StrEMsg:='';
      StrQry:='';

      Main.TransStart;
      if chkClose.Checked = True then
      begin
        if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
          IsOk:=False;
          StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk'
        end;
        StrQry:='UPDATE wh_work_order SET date_out'+StrTanggalSelesai+
              ',time_out'+StrJamSelesai+StrStatus+', user_close='+QuotedStr(User)+' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
      end else begin
        StrQry:='UPDATE wh_work_order SET update_user='+QuotedStr(User)+
                ' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
      end;

      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;

      StrQry:='';
      StrQry:='UPDATE wh_work_order_detail SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+' and description_id=2;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Keluhan';
          StrEMsg:=E.Message;
        end;
      end;



      for IntCount:=1 to PekerjaanGrid.RowCount-1 do begin
        if Trim(PekerjaanGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                ',description,technician,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',2'+
                ','+Chr(39)+PekerjaanGrid.Cells[0,IntCount]+Chr(39)+
                ','+Chr(39)+PekerjaanGrid.Cells[1,IntCount]+Chr(39)+
                ','+Chr(39)+User+Chr(39)+'); ';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Detail Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      //KELUHAN
      StrQry:='';
      StrQry:='UPDATE wh_work_order_detail SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+' and description_id=1;';
      Qry2.SQL.Add(StrQry);
      try
        Qry2.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Keluhan';
          StrEMsg:=E.Message;
        end;
      end;

      //Mekanik
      StrQry:='';
      StrMekanik:='';
      StrStatusMekanik:='';

      if (StrTransId<>'') then
      StrQry:='UPDATE wh_work_order_mekanik SET status=0 '+
              ' WHERE work_order_id='+QuotedStr(StrTransId)+';';
      for IntCount:=1 to StrGridMekanik.RowCount-1 do begin
        StrStatusMekanik := StrGridMekanik.Cells[1,IntCount];
        StrMekanik:= StrGridMekanik.Cells[2,IntCount];
        if Trim(StrGridMekanik.Cells[2,IntCount])<>'' then
          StrQry:=StrQry+' INSERT INTO wh_work_order_mekanik (work_order_id,name,status_mekanik,status)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrMekanik)+','+QuotedStr(StrStatusMekanik)+
                  ',1); ';
      end;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=E.Message;
        end;
      end;


      StrQry:='';
      for IntCount:=1 to KeluhanGrid.RowCount-1 do begin
          StrKeluhan:=QuotedStr(KeluhanGrid.Cells[1,IntCount]);
//          StrDone:=QuotedStr(KeluhanGrid.Cells[0,IntCount]);
          if (KeluhanGrid.Cells[0,IntCount])='v' then
          StrDone:='1' else StrDone:='0';
          if Trim(KeluhanGrid.Cells[1,IntCount])<>'' then
            StrQry:=' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,update_user,isdone)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrKeluhan+
                    ','+QuotedStr(User)+', '+
                    ''+QuotedStr(StrDone)+'); ';
      end;
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry2.SQL.Add(StrQry);
      try
        Qry2.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Keluhan';
          StrEMsg:=E.Message;
        end;
      end;

      //PARTS
      StrQry:='';
      StrQry:='UPDATE wh_work_order_part SET status=0 WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
      Qry3.SQL.Add(StrQry);
      try
        Qry3.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Keluhan';
          StrEMsg:=E.Message;
        end;
      end;

      StrQry:='';
      for IntCount:=1 to PartsGrid.RowCount-1 do begin
        StrPart:=QuotedStr(PartsGrid.Cells[2,IntCount]);
        StrQty:=QuotedStr(PartsGrid.Cells[3,IntCount]);
        StrKodePart:=QuotedStr(PartsGrid.Cells[4,IntCount]);
        if (PartsGrid.Cells[1,IntCount])='v' then
          StrIsUsed:='1' else StrIsUsed:='0';
        if PartsGrid.Cells[2,1]<>'' then
          StrQry:=StrQry+' INSERT INTO wh_work_order_part (work_order_id,part_name'+
                  ',qty,status,IsUsed,kode_part_gp)'+
                  ' VALUES ('+QuotedStr(StrTransId)+
                  ','+StrPart+
                  ','+StrQty+',1,'+QuotedStr(StrIsUsed)+','+StrKodePart+'); ';
      end;
      Qry3.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry3.SQL.Add(StrQry);
      try
        Qry3.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Parts';
          StrEMsg:=E.Message;
        end;
      end;

      //Analisa
      StrQry:='Update wh_work_order_detail set status=0 where work_order_id='+QuotedStr(StrTransId)+
              ' and description_id=3';
      StrAnalisa:='';
      for IntCount:=1 to StrGrid3.RowCount-1 do begin
        StrAnalisa:= StrGrid3.Cells[1,IntCount];
        if Trim(StrGrid3.Cells[1,IntCount])<>'' then
          StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id,description,status,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+',3,'+QuotedStr(StrAnalisa)+
                  ',1,'+QuotedStr(User)+'); ';
      end;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=E.Message;
        end;
      end;

      StrQry:='DELETE wh_vhc_hold WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        if chkClose.Checked= True then
         MessageBox(0,'PKB berhasil ditutup','Tutup PKB',MB_OK or MB_ICONINFORMATION)
        else MessageBox(0,'PKB berhasil diSimpan','Tutup PKB',MB_OK or MB_ICONINFORMATION)
      end else begin
        Main.TransRollback;
        if StrMsg<>'' then StrMsg:=StrMsg+Chr(13)+Chr(13);
        MessageBox(0,PChar(StrMsg+'Kesalahan'+Chr(13)+StrEMsg),'Tutup PKB',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
  end else
    MessageBox(0,'Silahkan isi kolom data yg kosong','Tutup PKB',MB_OK or MB_ICONERROR);
end;

procedure TWorkOrderFormIn.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(WOArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(WOArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[0,Count2-1]:=WOArr[Count][0];
          StrGrid.Cells[1,Count2-1]:=WOArr[Count][1];
          StrGrid.Cells[2,Count2-1]:=WOArr[Count][2];
          StrGrid.Cells[3,Count2-1]:=WOArr[Count][3];
          StrGrid.Cells[4,Count2-1]:=WOArr[Count][4];
          StrGrid.Cells[5,Count2-1]:=WOArr[Count][6];
          NoPKB.Items.Add(WOArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TWorkOrderFormIn.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search; 
end;

procedure TWorkOrderFormIn.TombolCariClick(Sender: TObject);
begin
  Search;
  RefreshCombo;
end;

procedure TWorkOrderFormIn.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshList;
    RefreshCombo;
  end;
end;

procedure TWorkOrderFormIn.PartsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
//    if (PartsGrid.Cells[5,ARow]='')  then begin
      R := PartsGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PartsGrid.Left;
      R.Right := R.Right + PartsGrid.Left;
      R.Top := R.Top + PartsGrid.Top;
      R.Bottom := R.Bottom + PartsGrid.Top;
      case ACol of
        1 :with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if PartsGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;

      end;
end;

procedure TWorkOrderFormIn.CetakUlangClick(Sender: TObject);
begin
  if WorkOrderId<>'' then RePrint(WorkOrderId)
end;

procedure TWorkOrderFormIn.MekanikExit(Sender: TObject);
begin

  if Trim(Mekanik.Text)<>'' then begin
    StrGridMekanik.Cells[2,IntRow]:=Mekanik.Text;
    StrGridMekanik.CellStyle[2,IntRow].HorizontalAlignment:=taLeftJustify;
  end;
  Mekanik.Text:='';
  Mekanik.Visible := False;
  Calculate4;
end;

procedure TWorkOrderFormIn.MekanikKeyPress(Sender: TObject; var Key: Char);
 var
  IntCount: Integer;
begin
  if (Key=#13) then begin
    MekanikExit(nil);
    if (StrGridMekanik.Row=StrGridMekanik.RowCount-1) AND (StrGridMekanik.RowCount<=IntMaxRow)  then begin
      StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      for IntCount:=0 to 4 do StrGridMekanik.Cells[IntCount,StrGridMekanik.RowCount-1]:='';
      StrGridMekanik.CellStyle[0,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGridMekanik.Col:=0;
    StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
    StrGridMekanik.Col:=1;

  end;
  if (Key=#27) then begin
    MekanikExit(nil);
  end;
end;

procedure TWorkOrderFormIn.StrGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPolisi.Text<>'') then begin
    R := StrGrid3.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid3.Left;
    R.Right := R.Right + StrGrid3.Left;
    R.Top := R.Top + StrGrid3.Top;
    R.Bottom := R.Bottom + StrGrid3.Top;
    with Analisa do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid3.Cells[ACol,ARow])<>'' then Text:=StrGrid3.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TWorkOrderFormIn.AnalisaExit(Sender: TObject);
begin
  if Trim(Analisa.Text)<>'' then begin
    StrGrid3.Cells[IntCol,IntRow]:=Analisa.Text;
    Calculate2;
  end;
  Analisa.Text:='';
  Analisa.Visible := False;
  StrGrid3.SetFocus;
end;

procedure TWorkOrderFormIn.AnalisaKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    AnalisaExit(nil);
    Calculate2;
    if (StrGrid3.RowCount=StrGrid3.RowCount-1) AND (StrGrid3.RowCount<=IntMaxRow)  then begin
      StrGrid3.RowCount:=StrGrid3.RowCount+1;
      for IntCount:=0 to 1 do StrGrid3.Cells[IntCount,StrGrid3.RowCount-1]:='';
      StrGrid3.CellStyle[0,StrGrid3.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,StrGrid3.RowCount-1].HorizontalAlignment:=taLeftJustify;
    end;
//    StrGrid3.Col:=0;
    StrGrid3.RowCount:=StrGrid3.RowCount+1;
//    StrGrid3.Col:=1;
  end;
  if (Key=#27) then begin
    AnalisaExit(nil);
  end;
end;

procedure TWorkOrderFormIn.KeteranganExit(Sender: TObject);
begin
  if Trim(Keterangan.Text)<>'' then PartsGrid.Cells[4,PartsGrid.Row]:=Keterangan.Text;
  Keterangan.Visible := False;
  Keterangan.Text:='';
  PartsGrid.SetFocus;
end;

procedure TWorkOrderFormIn.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    PartsGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    PartsGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  PartsGrid.SetFocus;
end;

procedure TWorkOrderFormIn.KeluhanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow2:=ARow;
  IntCol2:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
    if (KeluhanGrid.Cells[4,ARow]='')  then begin
      R := KeluhanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + KeluhanGrid.Left;
      R.Right := R.Right + KeluhanGrid.Left;
      R.Top := R.Top + KeluhanGrid.Top;
      R.Bottom := R.Bottom + KeluhanGrid.Top;
      case ACol of
        0 :with chkkeluhan do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if KeluhanGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;
end;

procedure TWorkOrderFormIn.StrGridMekanikSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPKB.Text<>'') then begin
    R := StrGridMekanik.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridMekanik.Left;
    R.Right := R.Right + StrGridMekanik.Left;
    R.Top := R.Top + StrGridMekanik.Top;
    R.Bottom := R.Bottom + StrGridMekanik.Top;
    with StatusMekanik do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGridMekanik.Cells[ACol,ARow])<>'' then Text:=StrGridMekanik.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
  if (ACol = 2) and (ARow > MinRowGrid) and (NoPKB.Text<>'') then begin
    R := StrGridMekanik.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridMekanik.Left;
    R.Right := R.Right + StrGridMekanik.Left;
    R.Top := R.Top + StrGridMekanik.Top;
    R.Bottom := R.Bottom + StrGridMekanik.Top;
    with Mekanik do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGridMekanik.Cells[ACol,ARow])<>'' then Text:=StrGridMekanik.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TWorkOrderFormIn.StatusMekanikExit(Sender: TObject);
begin
  if Trim(StatusMekanik.Text)<>'' then begin
    StrGridMekanik.Cells[IntCol,IntRow]:=StatusMekanik.Text;
  end;
  StatusMekanik.Text:='';
  StatusMekanik.Visible := False;
  StrGridMekanik.SetFocus;
end;

procedure TWorkOrderFormIn.chkCloseClick(Sender: TObject);
begin
  if chkClose.Checked=True then
  begin
    Label6.Visible:=True;
    TanggalSelesai.Visible:=True;
    Label9.Visible:=True;
    JamSelesai.Visible:=True;
  end else
  begin
    Label6.Visible:=False;
    TanggalSelesai.Visible:=False;
    Label9.Visible:=False;
    JamSelesai.Visible:=False;
  end;
end;

end.
