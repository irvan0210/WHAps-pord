unit AuthReservedOrderRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,StrUtils,
  ComCtrls, Menus,ClipBrd;

type
  TAuthReservedOrderRpt = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    Button1: TButton;
    Label2: TLabel;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    Label3: TLabel;
    grpGroupTotal: TGroupBox;
    lbl1: TLabel;
    Total: TEdit;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    procedure Tan(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Copy1Click(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    ResvArr,CompanyArr:Array of TArrString18;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String='BUS';Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);Overload;
    procedure RefreshDisplay;
  end;

var
  AuthReservedOrderRpt: TAuthReservedOrderRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, SPJFormBusU;

{$R *.dfm}
{
constructor TAuthReservedOrderRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;
}
constructor TAuthReservedOrderRpt.Create(AOwner:TComponent;Company_Id:String='BUS';Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);
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
  Main.WriteLog('Form Open: AuthReservedOrderRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All),1);
  inherited Create(AOwner);
end;

procedure TAuthReservedOrderRpt.Init;
begin
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TAuthReservedOrderRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=13;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=150;
  StrGrid.ColWidths[4]:=50;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=65;
  StrGrid.ColWidths[8]:=200;
  StrGrid.ColWidths[9]:=200;
  StrGrid.ColWidths[10]:=200;
  //col 10=vhc_trans_id
  //col 11=status
  //col 12=package
  //col 13=total
  //col 14=total_payment
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.Cells[2,0]:='No Pesanan';
  StrGrid.Cells[3,0]:='Armada';
  StrGrid.Cells[4,0]:='No Bodi';
  StrGrid.Cells[5,0]:='Driver';
  StrGrid.Cells[6,0]:='Penggunaan';
  StrGrid.Cells[8,0]:='Rute';
  StrGrid.Cells[9,0]:='Pelanggan';
  StrGrid.Cells[9,0]:='Alasan Otorisasi';
  StrGrid.Cells[6,1]:='Tgl';
  StrGrid.Cells[7,1]:='Jam';
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
  for IntCount:=10 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
end;

procedure TAuthReservedOrderRpt.RefreshCombo;
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TAuthReservedOrderRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,StrOrder,StrRange,StrTanggal,StrToDates,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Main.M_Busy;
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    SetLength(ResvArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrOrder:='';
//    if OrderBy<>'' then StrOrder:=',@OrderBy='+QuotedStr(OrderBy) else StrOrder:='';
//    if Range>0 then StrRange:=',@Range='+IntToStr(Range) else StrRange:='';
    StrTanggal:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    if CekTglSampai.Checked=True then StrToDates:=',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglSampai.Date));

//    ',@Finish='+IntToStr(IsAll)+
    StrQry:='EXEC GetReservedOrderList '+StrCompanyId+StrLocationId+StrTanggal+StrToDates+StrOrder+',@Finish=9,@isAuth=1;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ResvArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ResvArr[IntCount][0]:=Qry.FieldValues['reserved_order_id'];
      ResvArr[IntCount][1]:=Qry.FieldValues['reserved_order_detail_id'];
      ResvArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['vehicle_name']<>NULL then
      ResvArr[IntCount][3]:=Qry.FieldValues['vehicle_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
      if Qry.FieldValues['body_id']<>NULL then
        ResvArr[IntCount][4]:=LeftStr(Qry.FieldValues['body_id'],Length(Qry.FieldValues['body_id'])-1);
      ResvArr[IntCount][5]:=LeftStr(Qry.FieldValues['drivers_name'],Length(Qry.FieldValues['drivers_name'])-1);
      ResvArr[IntCount][6]:=Qry.FieldValues['from_to_dates'];
      ResvArr[IntCount][7]:=Qry.FieldValues['from_to_times'];
      ResvArr[IntCount][8]:=Qry.FieldValues['route'];
      ResvArr[IntCount][9]:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['vhc_trans_id']<>NULL then ResvArr[IntCount][10]:=Qry.FieldValues['vhc_trans_id'];
      if (Qry.FieldValues['status']='0') OR (Qry.FieldValues['detail_status']='0') then
        ResvArr[IntCount][11]:='0'
      else ResvArr[IntCount][11]:='1';
      if Qry.FieldValues['daily_package']<>NULL then ResvArr[IntCount][12]:='1' else ResvArr[IntCount][12]:='0';
//      if Qry.FieldValues['total']<>NULL then ResvArr[IntCount][13]:=Qry.FieldValues['total'];
//      if Qry.FieldValues['total_payment']<>NULL then    ResvArr[IntCount][14]:=Qry.FieldValues['total_payment'];
      if Qry.FieldValues['cust_contract_id']<>NULL then   ResvArr[IntCount][15]:=Qry.FieldValues['cust_contract_id'];
      ResvArr[IntCount][16]:=vartoStr(Qry.FieldValues['isFix']);
      ResvArr[IntCount][17]:=vartoStr(Qry.FieldValues['isAuth']);
      ResvArr[IntCount][18]:=vartoStr(Qry.FieldValues['isAuthReason']);
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAuthReservedOrderRpt.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  if Length(ResvArr)>0 then StrGrid.RowCount:=Length(ResvArr)+2
  else begin
    StrGrid.RowCount:=3;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,2]:='';
      StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
      StrGrid.CellStyle[IntCount,2].BGColor:=clWhite;
    end;
  end;
  for IntCount:=0 to Length(ResvArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=ResvArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=ResvArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=ResvArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=ResvArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=ResvArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=ResvArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=ResvArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=ResvArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=ResvArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=ResvArr[IntCount][18]; //->9
    StrGrid.Cells[10,IntCount+2]:=ResvArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=ResvArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=ResvArr[IntCount][12];
    for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clWindowText;


  end;
  Total.Text:=IntToStr(Length(ResvArr));
  Main.M_Normal;
end;

procedure TAuthReservedOrderRpt.Tan(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TAuthReservedOrderRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TAuthReservedOrderRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TAuthReservedOrderRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
      if (IntCol<=5) then begin
        if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[2,IntRow],False)
      end;

      if (IntCol>5) then 
        if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[10,IntRow],False);

  end;
end;

procedure TAuthReservedOrderRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TAuthReservedOrderRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAuthReservedOrderRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TAuthReservedOrderRpt.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TAuthReservedOrderRpt.CekTglSampaiClick(Sender: TObject);
begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
end;

procedure TAuthReservedOrderRpt.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ((Key = 67) or (Key = 99)) and (Shift=[ssCtrl]) then
      Copy1Click(Nil);
end;

procedure TAuthReservedOrderRpt.Copy1Click(Sender: TObject);
var
  S: string;
  GRect: TGridRect;
  C, R: Integer;
begin
  GRect := StrGrid.Selection;
  S  := '';
  for R := GRect.Top to GRect.Bottom do
  begin
    for C := GRect.Left to GRect.Right do
    begin
      if C = GRect.Right then  S := S + (StrGrid.Cells[C, R])
      else
        S := S + StrGrid.Cells[C, R] + #9;
    end;
    S := S + #13#10;
  end;
  ClipBoard.AsText := S;
end;

end.
