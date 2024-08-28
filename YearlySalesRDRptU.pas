unit YearlySalesRDRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TYearlySalesRDRpt = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Years: TEdit;
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure YearsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    OrderArr,CompanyArr:Array of TArrString30;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);Overload;
    procedure RefreshDisplay;
  end;

var
  YearlySalesRDRpt: TYearlySalesRDRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU;

{$R *.dfm}

constructor TYearlySalesRDRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TYearlySalesRDRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TYearlySalesRDRpt.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
//  Tanggal.Date:=Now();
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TYearlySalesRDRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=25;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=120;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=120;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=35;
  StrGrid.ColWidths[8]:=50;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=40;
  StrGrid.ColWidths[11]:=160;
  StrGrid.ColWidths[13]:=50;
  StrGrid.ColWidths[17]:=80;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,23,0);
  StrGrid.MergeCells.AddRectXY(24,0,24,1);
  StrGrid.Cells[0,0]:='Tanggal';
  StrGrid.Cells[1,0]:='No Pesanan';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Group';
  StrGrid.Cells[4,0]:='Contact Person';
  StrGrid.Cells[5,0]:='SC';
  StrGrid.Cells[6,0]:='Keberangkatan';
  StrGrid.Cells[7,0]:='Unit';
  StrGrid.Cells[8,0]:='Armada';
  StrGrid.Cells[11,0]:='Rute';
  StrGrid.Cells[12,0]:='Gross';
  StrGrid.Cells[13,0]:='Discount';
  StrGrid.Cells[14,0]:='CN (%)';
  StrGrid.Cells[15,0]:='Tol Parkir';
  StrGrid.Cells[16,0]:='Biaya Lain';
  StrGrid.Cells[17,0]:='Nett';
  StrGrid.Cells[18,0]:='Pembayaran';
  StrGrid.Cells[24,0]:='Keterangan';
  StrGrid.Cells[8,1]:='Seat';
  StrGrid.Cells[9,1]:='Jenis';
  StrGrid.Cells[10,1]:='Brand';
  StrGrid.Cells[18,1]:='Tgl';
  StrGrid.Cells[19,1]:='DP 1';
  StrGrid.Cells[20,1]:='Tgl';
  StrGrid.Cells[21,1]:='DP 2';
  StrGrid.Cells[22,1]:='Tgl';
  StrGrid.Cells[23,1]:='Pelunasan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[24,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[22,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[23,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TYearlySalesRDRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TYearlySalesRDRpt.RefreshData;
var Qry,Qry2:TADOQuery;
    StrQry,StrTahun:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
{    SetLength(OrderArr,0);
//    StrTahun:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
//    StrQry:='EXEC GetCustomerOrderList '+IntToStr(CompId)+StrTanggal+',@Finish='+IntToStr(IsAll)+' ;';
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
    IntCount:=0;
//    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//    StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
//    StrQry:='EXEC GetCustomerOrderList '+IntToStr(CompId)+StrTanggal+',@Finish='+IntToStr(IsAll)+' ;';
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
    IntCount:=0;
//    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//      StrQry:='SELECT * FROM wh_customer_order_service_detail '+
//              'WHERE (transaction_type_id='+QuotedStr('150202')+') AND (status=1) '+
//              'AND (customer_order_id='+QuotedStr(Qry.FieldValues['customer_order_id'])+');';
//      Qry2.SQL.Clear;
//      Qry2.SQL.Add(StrQry);
//      Qry2.Open;
      IntTolParkir:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        IntTolParkir:=IntTolParkir+Qry2.FieldValues['amount'];
        Qry2.Next;
      end;
      Qry2.Close;
      StrQry:='SELECT * FROM wh_customer_order_service_detail '+
              'WHERE (transaction_type_id<>'+QuotedStr('150202')+') AND (amount>1) AND (status=1) '+
              'AND (customer_order_id='+QuotedStr(Qry.FieldValues['customer_order_id'])+');';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntBiayaLain:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        IntBiayaLain:=IntBiayaLain+Qry2.FieldValues['amount'];
        Qry2.Next;
      end;
      Qry2.Close;
      StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(Qry.FieldValues['customer_order_id'])+';';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        OrderArr[IntCount][12]:=IToCurr(Qry2.FieldValues['total']);
        IntTotal:=Qry.FieldValues['total'];
        if IntTolParkir>0 then OrderArr[IntCount][15]:=IToCurr(IntTolParkir);
        if IntBiayaLain>0 then OrderArr[IntCount][16]:=IToCurr(IntBiayaLain);
        if Qry.FieldValues['discount_price']>0 then begin
          OrderArr[IntCount][13]:=IToCurr(Qry.FieldValues['discount_price']);
          OrderArr[IntCount][17]:=IToCurr(IntTotal-(Qry.FieldValues['discount_price'])+IntTolParkir+IntBiayaLain);
        end else if Qry.FieldValues['discount_percent']>0 then begin
          OrderArr[IntCount][13]:=IntToStr(Qry.FieldValues['discount_percent'])+' %';
          OrderArr[IntCount][17]:=IToCurr(IntTotal-((IntTotal*Qry.FieldValues['discount_percent'])/100)+IntTolParkir+IntBiayaLain);
        end else begin
          OrderArr[IntCount][17]:=IToCurr(IntTotal+IntTolParkir+IntBiayaLain);
        end;
        Qry2.Next;
        if not(Qry2.Eof) then Inc(IntCount);
      end;
      Qry2.Close;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
}
  end;
  FreeAndNil(Qry2);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TYearlySalesRDRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal:Integer;
    StrOrderId:String;
    IsDrawRect:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    if StrOrderId<>OrderArr[IntCount][1] then begin
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
      StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
      StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
      StrGrid.Cells[15,IntCount+2]:=OrderArr[IntCount][15];
      StrGrid.Cells[16,IntCount+2]:=OrderArr[IntCount][16];
      StrGrid.Cells[17,IntCount+2]:=OrderArr[IntCount][17];
      StrGrid.Cells[18,IntCount+2]:=OrderArr[IntCount][18];
      StrGrid.Cells[19,IntCount+2]:=OrderArr[IntCount][19];
      StrGrid.Cells[20,IntCount+2]:=OrderArr[IntCount][20];
      StrGrid.Cells[21,IntCount+2]:=OrderArr[IntCount][21];
      StrGrid.Cells[22,IntCount+2]:=OrderArr[IntCount][22];
      StrGrid.Cells[23,IntCount+2]:=OrderArr[IntCount][23];
      StrGrid.Cells[24,IntCount+2]:=OrderArr[IntCount][24];
      IsDrawRect:=False;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][1]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+2,3,IntCount+2);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+2,4,IntCount+2);
      StrGrid.MergeCells.AddRectXY(5,IntStartRow+2,5,IntCount+2);
      StrGrid.MergeCells.AddRectXY(13,IntStartRow+2,13,IntCount+2);
      StrGrid.MergeCells.AddRectXY(14,IntStartRow+2,14,IntCount+2);
      StrGrid.MergeCells.AddRectXY(15,IntStartRow+2,15,IntCount+2);
      StrGrid.MergeCells.AddRectXY(16,IntStartRow+2,16,IntCount+2);
      StrGrid.MergeCells.AddRectXY(17,IntStartRow+2,17,IntCount+2);
      StrGrid.MergeCells.AddRectXY(18,IntStartRow+2,18,IntCount+2);
      StrGrid.MergeCells.AddRectXY(19,IntStartRow+2,19,IntCount+2);
      StrGrid.MergeCells.AddRectXY(20,IntStartRow+2,20,IntCount+2);
      StrGrid.MergeCells.AddRectXY(21,IntStartRow+2,21,IntCount+2);
      StrGrid.MergeCells.AddRectXY(22,IntStartRow+2,22,IntCount+2);
      StrGrid.MergeCells.AddRectXY(23,IntStartRow+2,23,IntCount+2);
      StrGrid.MergeCells.AddRectXY(24,IntStartRow+2,24,IntCount+2);
      IntTotal:=IntTotal+SToInt(StrGrid.Cells[17,IntStartRow+2]);
    end;
    StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[21,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[23,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[16,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(IntTotal);
  StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
end;

procedure TYearlySalesRDRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TYearlySalesRDRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TYearlySalesRDRpt.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(OrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(OrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do
          StrGrid.Cells[Count4,Count2]:=OrderArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TYearlySalesRDRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TYearlySalesRDRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False)
    end;
  end;
end;

procedure TYearlySalesRDRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TYearlySalesRDRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TYearlySalesRDRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TYearlySalesRDRpt.YearsKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
