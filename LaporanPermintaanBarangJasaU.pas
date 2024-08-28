unit LaporanPermintaanBarangJasaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, ZColorStringGrid, Buttons, ADODB,
  WHUnit, DateUtils;

type
  TLaporanPermintaanBarangJasa = class(TForm)
    lbl3: TLabel;
    ToXCel: TSpeedButton;
    lbl2: TLabel;
    lbl4: TLabel;
    Label1: TLabel;
    Refresh: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    Button1: TButton;
    Periode: TRadioGroup;
    GroupBox1: TGroupBox;
    chkInput: TRadioButton;
    chkDibutuhkan: TRadioButton;
    Tanggal: TDateTimePicker;
    TglSampai: TDateTimePicker;
    Bulan: TDateTimePicker;
    StatusBarang: TComboBox;
    procedure TanggalChange(Sender: TObject);
    procedure PeriodeClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,GroupArr:Array of TArrString2;
    OrderArr,CompanyArr:Array of TArrString30;
    MaxCol:Integer;
    IntRow,IntCol,IsIntegrate,MinRowGrid:Integer;
    IsInput,Initiation:Boolean;
    StrTitel,FormRequest:String;
    myYear, myMonth, myDay : Word;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  LaporanPermintaanBarangJasa: TLaporanPermintaanBarangJasa;

implementation

uses
  MainU, ItemServiceRequestU;

{$R *.dfm}

procedure TLaporanPermintaanBarangJasa.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  chkDibutuhkan.Checked:=True;
  Bulan.Date:=Now();
  Periode.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TLaporanPermintaanBarangJasa.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=12;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=140;
  StrGrid.ColWidths[5]:=140;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=58;
  StrGrid.ColWidths[8]:=350;
  StrGrid.ColWidths[9]:=50;
  StrGrid.ColWidths[10]:=450;
  StrGrid.ColWidths[11]:=120;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No PBJ';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Tanggal Dibutuhkan';
  StrGrid.Cells[4,0]:='Department Asal';
  StrGrid.Cells[5,0]:='Department Tujuan';
  StrGrid.Cells[6,0]:='Requestor';
  StrGrid.Cells[7,0]:='Sifat';
  StrGrid.Cells[8,0]:='Barang/Jasa';
  StrGrid.Cells[9,0]:='Jumlah';
  StrGrid.Cells[10,0]:='Keterangan';
  StrGrid.Cells[11,0]:='No Request';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
end;


procedure TLaporanPermintaanBarangJasa.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid,StrSearchDate:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit,No:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;
  Main.M_Busy;

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);
    if chkDibutuhkan.Checked=True then
    begin
      if Periode.ItemIndex=0 then
      begin
        StrSearchDate:=' (a.requested_date BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date+1))+' )';
      end else
      begin
        DecodeDate(Bulan.Date, myYear, myMonth, myDay);
        StrSearchDate:=' (a.requested_date BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)))+' AND '+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))))+' )';

      end;
    end else if chkInput.Checked=True then
    begin
      if Periode.ItemIndex=0 then
      begin
        StrSearchDate:=' (a.request_date BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date+1))+' )';
      end else
      begin
        DecodeDate(Bulan.Date, myYear, myMonth, myDay);
        StrSearchDate:=' (a.request_date BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)))+' AND '+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))))+' )';

      end;
    end;



    StrQry:='SELECT a.item_request_id,a.request_date,a.requested_date,c.name from_department,b.name to_department,d.name request_name,a.posting, '+
            'case WHEN a.importance=1 THEN ''Mendesak'' ELSE ''Normal'' END sifat,a.no_request FROM wh_item_request a '+
            'LEFT JOIN wh_department b ON a.to_department_id=b.department_id '+
            'LEFT JOIN wh_department c ON a.origin_department_id=c.department_id  '+
            'LEFT JOIN wh_user d ON a.requester_id=d.username '+
            'WHERE '+StrSearchDate+' AND a.company_id='+StrCompanyId+'  AND (a.cancel IS NULL OR a.cancel<>1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(OrderArr,IntCount+1);
      OrderArr[IntCount][0]:=IntToStr(No);
      OrderArr[IntCount][1]:=Qry.FieldValues['item_request_id'];
      OrderArr[IntCount][2]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['request_date']) ;
      OrderArr[IntCount][3]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['requested_date']) ;
      if Qry.FieldValues['from_department']<>NULL then OrderArr[IntCount][4]:=Qry.FieldValues['from_department'];
      if Qry.FieldValues['to_department']<>NULL then OrderArr[IntCount][5]:=Qry.FieldValues['to_department'] ;
      OrderArr[IntCount][6]:=Qry.FieldValues['request_name'];
      OrderArr[IntCount][7]:=Qry.FieldValues['sifat'];
      if Qry.FieldValues['no_request']<>NULL then OrderArr[IntCount][11]:=Qry.FieldValues['no_request'];
      StrQry:='SELECT item_detail,quantity,detail FROM wh_item_request_detail '+
              'WHERE item_request_id='+QuotedStr(Qry.FieldValues['item_request_id'])+' AND '+
              '(cancel IS NULL OR cancel<>1)';

      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(OrderArr,IntCount+1);
          OrderArr[IntCount][0]:=IntToStr(No);
          OrderArr[IntCount][1]:=Qry.FieldValues['item_request_id'];
          OrderArr[IntCount][2]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['request_date']) ;
          OrderArr[IntCount][3]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['requested_date']) ;
          if Qry.FieldValues['from_department']<>NULL then OrderArr[IntCount][4]:=Qry.FieldValues['from_department'];
          if Qry.FieldValues['to_department']<>NULL then OrderArr[IntCount][5]:=Qry.FieldValues['to_department'] ;
          OrderArr[IntCount][6]:=Qry.FieldValues['request_name'];
          if Qry.FieldValues['sifat']<>NULL then OrderArr[IntCount][7]:=Qry.FieldValues['sifat'];
          if Qry.FieldValues['no_request']<>NULL then OrderArr[IntCount][11]:=Qry.FieldValues['no_request'];
        end;
        OrderArr[IntCount][8]:=Qry2.FieldValues['item_detail'];
        OrderArr[IntCount][9]:=Qry2.FieldValues['quantity'];
        if Qry2.FieldValues['detail']<>NULL then OrderArr[IntCount][10]:=Qry2.FieldValues['detail'];

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TLaporanPermintaanBarangJasa.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];


  FreeAndNil(Qry);
  Main.CloseDb;


  Main.M_Normal;
end;


procedure TLaporanPermintaanBarangJasa.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
//  for IntCount:=0 to StrGrid.ColCount-1 do
//    for IntCount2:=3 to StrGrid.RowCount-1 do begin
//      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
//      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
//    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;
//  for IntCount:=0 to StrGrid.ColCount-1 do begin
//    StrGrid.Cells[IntCount,3]:='';
//    StrGrid.CellStyle[IntCount,3].Font.Color:=clWindowText;
//  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>OrderArr[IntCount][1])  then begin
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;

      StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];
      StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
      StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
      IsDrawRect:=False;
      IsDrawRect2:=False;

    end else if (IntCount2<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;

    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+2,3,IntCount+2);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+2,4,IntCount+2);
      StrGrid.MergeCells.AddRectXY(5,IntStartRow+2,5,IntCount+2);
      StrGrid.MergeCells.AddRectXY(6,IntStartRow+2,6,IntCount+2);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow+2,7,IntCount+2);
      StrGrid.MergeCells.AddRectXY(11,IntStartRow+2,11,IntCount+2);
    end;
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taLeftJustify;
  end;
end;

procedure TLaporanPermintaanBarangJasa.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then TglSampai.Date:=Tanggal.Date;
end;

procedure TLaporanPermintaanBarangJasa.PeriodeClick(Sender: TObject);
begin
    Case Periode.ItemIndex Of
    0 : Begin
          Tanggal.Enabled:=True;
          TglSampai.Enabled:=True;
          Bulan.Enabled:=False;
        End;
    1 : Begin
          Tanggal.Enabled:=False;
          TglSampai.Enabled:=False;
          Bulan.Enabled:=True;
        End;
    End;
end;

procedure TLaporanPermintaanBarangJasa.RefreshClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TLaporanPermintaanBarangJasa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLaporanPermintaanBarangJasa.FormShow(Sender: TObject);
begin
  if FormRequest='Laporan Keluhan Driver' then
  begin
    Caption:='Laporan Keluhan Driver' ;
  end else if FormRequest='Service Request' then
  begin
    Caption:='Data Keluhan Driver' ;
  end;

  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
  RefreshData;
  RefreshGrid;
end;

procedure TLaporanPermintaanBarangJasa.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
