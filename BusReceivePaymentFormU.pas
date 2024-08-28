unit BusReceivePaymentFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, QRCtrls, QuickRpt, ExtCtrls,
  ZColorStringGrid, Buttons, ppCtrls, ppParameter, ppBands, ppPrnabl,
  ppClass, ppStrtch, ppMemo, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppDBPipe, ppDB, DB, ppDBBDE, ComCtrls;

type
  TBusPaymentReceiveForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    GroupDetail: TGroupBox;
    Total: TEdit;
    Label5: TLabel;
    GroupPembayaran: TGroupBox;
    Received: TEdit;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    InvoiceDate: TEdit;
    Receiver: TEdit;
    GroupHeader: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    LabelSegment1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    CustomerId: TEdit;
    ContactId: TEdit;
    OrderId: TEdit;
    CustomerDisp: TEdit;
    ContactDisp: TEdit;
    InvoiceId: TEdit;
    CariOrder: TSpeedButton;
    Label1: TLabel;
    Label17: TLabel;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    GroupOrder: TGroupBox;
    Label14: TLabel;
    StrGrid: TZColorStringGrid;
    Receive: TEdit;
    Label2: TLabel;
    Remark: TMemo;
    Label9: TLabel;
    PanelCariInvoice: TPanel;
    CariInvoice: TSpeedButton;
    GroupBatal: TPanel;
    Status: TCheckBox;
    CetakUlang: TButton;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppInvoiceId: TppLabel;
    ppDates: TppLabel;
    ppReprinted: TppLabel;
    ppCustomerName: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppRemark: TppLabel;
    ppSignature: TppLabel;
    ppAmountSaid: TppLabel;
    ppParameterList1: TppParameterList;
    ppCompany: TppLabel;
    ppAddress: TppMemo;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppPhone: TppLabel;
    ppFax: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppPayment: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppPaymentId: TppLabel;
    Label11: TLabel;
    Remain: TEdit;
    Label13: TLabel;
    ReceiveDate: TDateTimePicker;
    Label15: TLabel;
    PaymentOption: TComboBox;
    Label16: TLabel;
    AccountNo: TEdit;
    ppLabel1: TppLabel;
    ppLabel13: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDescription: TppLabel;
    ppLabel31: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppPaymentOption: TppLabel;
    ppAccountNoLabel: TppLabel;
    ppLabel26: TppLabel;
    ppAccountNo: TppLabel;
    ppLabel8: TppLabel;
    HeaderRemark: TMemo;
    Address: TMemo;
    ppLabel9: TppLabel;
    Label18: TLabel;
    ValidationNo: TEdit;
    Label19: TLabel;
    AccountName: TEdit;
    ppLogo: TppImage;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumlahKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure ReceiveEnter(Sender: TObject);
    procedure ReceiveExit(Sender: TObject);
    procedure CariInvoiceClick(Sender: TObject);
    procedure ReceiveKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure CetakUlangClick(Sender: TObject);
    procedure ReceiveDateKeyPress(Sender: TObject; var Key: Char);
    procedure AccountNoKeyPress(Sender: TObject; var Key: Char);
    procedure PaymentOptionKeyPress(Sender: TObject; var Key: Char);
    procedure PaymentOptionChange(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    PaymentOptionArr:Array of TArrString4;
    IsInputGrid,IsInput:Boolean;
    PymtId,InvId:String;
    Revision,MinRowService,IntRowService,IntColService:Integer;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure LoadData;
    procedure RefreshGrid;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure RefreshPaymentOption;
  public
    { Public declarations }
    procedure SetInvoiceId(Invoice_Id:String);
    procedure RePrint(Payment_Id:String);
    constructor Create(AOwner:TComponent;Payment_Id:String='';Is_Input:Boolean=True);Overload;
  end;

var
  BusPaymentReceiveForm: TBusPaymentReceiveForm;

implementation

uses MainU, RePrintFormU, BusInvoiceListU, StrUtils;

{$R *.dfm}

constructor TBusPaymentReceiveForm.Create(AOwner:TComponent;Payment_Id:String='';Is_Input:Boolean=True);
begin
  CompId:=2;
  PymtId:=Payment_Id;
  IsInputGrid:=Is_Input;
  IsInput:=Is_Input;
  inherited Create(AOwner);
end;

procedure TBusPaymentReceiveForm.Init;
begin
  OrderId.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  ContactId.Text:='';
  ContactDisp.Text:='';
  Address.Text:='';
  HeaderRemark.Text:='';
  Total.Text:='0';
  Receive.Text:='0';
  Received.Text:='0';
  Remain.Text:=''; 
  Remark.Text:='';
  ReceiveDate.Date:=Now();
  PanelCariInvoice.Enabled:=True;
  Status.Checked:=False;
  if PymtId<>'' then Status.Visible:=True
  else Status.Visible:=False;
end;

procedure TBusPaymentReceiveForm.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=10;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=220;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=50;
  StrGrid.ColWidths[4]:=30;
  StrGrid.ColWidths[5]:=70;
  StrGrid.ColWidths[6]:=30;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=140;
  StrGrid.ColWidths[9]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,3,0);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,6,0);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.RowHeights[0]:=22;
  StrGrid.RowHeights[1]:=22;
  StrGrid.Cells[0,0]:='Product';
  StrGrid.Cells[1,0]:='Acara Perjalanan';
  StrGrid.Cells[2,0]:='Tgl Penggunaan';
  StrGrid.Cells[4,0]:='Unit';
  StrGrid.Cells[5,0]:='Discount';
  StrGrid.Cells[7,0]:='Total Biaya';
  StrGrid.Cells[8,0]:='Keterangan';
  StrGrid.Cells[2,1]:='Dari';
  StrGrid.Cells[3,1]:='Sampai';
  StrGrid.Cells[5,1]:='Rp';
  StrGrid.Cells[6,1]:='%';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1  do begin
    StrGrid.Cells[IntCount,2]:='';
  end;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taRightJustify;
end;

procedure TBusPaymentReceiveForm.InitGridService;
var IntCount,IntCount2:Integer;
begin
  MinRowService:=0;
  GridService.ColCount:=5;
  GridService.RowCount:=2;
  GridService.Cells[0,0]:='Jenis Layanan/Biaya';
  GridService.Cells[1,0]:='Qty';
  GridService.Cells[2,0]:='Biaya';
  GridService.CellStyle[0,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[1,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[2,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[1,1].HorizontalAlignment:=taRightJustify;
  GridService.CellStyle[2,1].HorizontalAlignment:=taRightJustify;
  GridService.ColWidths[0]:=180;
  GridService.ColWidths[1]:=40;
  GridService.ColWidths[2]:=70;
  for IntCount:=3 to GridService.ColCount-1  do
    GridService.ColWidths[IntCount]:=0;
  for IntCount:=MinRowService+1 to GridService.RowCount-1 do
    for IntCount2:=0 to GridService.ColCount-1 do
      GridService.Cells[IntCount2,IntCount]:='';
end;

procedure TBusPaymentReceiveForm.RefreshCombo;
begin
end;

procedure TBusPaymentReceiveForm.RefreshPaymentOption;
var Qry:TADOQuery;
    StrQry,StrAll:String;
    IntCount:Integer;
begin
  PaymentOption.Text:='';
  PaymentOption.Items.Clear;
  PaymentOption.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(PaymentOptionArr,0);
    if PymtId<>'' then StrAll:=',@All=1' else StrAll:='';
    StrQry:='EXEC GetTransactionOption '+QuotedStr('1601')+StrAll+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(PaymentOptionArr,IntCount+1);
      PaymentOptionArr[IntCount][0]:=Qry.FieldValues['transaction_option_id'];
      PaymentOptionArr[IntCount][1]:=Qry.FieldValues['name_detail'];
      PaymentOptionArr[IntCount][2]:=Qry.FieldValues['account_no'];
      PaymentOptionArr[IntCount][3]:=Qry.FieldValues['account_name'];
      PaymentOptionArr[IntCount][4]:=Qry.FieldValues['validation_no'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(PaymentOptionArr)-1 do
    PaymentOption.Items.Add(PaymentOptionArr[IntCount][1]); 
  Main.M_Normal;
end;

procedure TBusPaymentReceiveForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionDetail '+QuotedStr(PymtId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      InvId:=Qry.FieldValues['transaction_id'];
      InvoiceId.Text:=Qry.FieldValues['invoice_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      InvoiceDate.Text:=Qry.FieldValues['dates'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      Receiver.Text:=Qry.FieldValues['receiver'];
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Total.Text:=IToCurr(Qry.FieldValues['total']);
      Received.Text:=IToCurr(Qry.FieldValues['total']-Qry.FieldValues['total_sisa']);
      Remain.Text:=IToCurr(Qry.FieldValues['total_sisa']);
      Receive.Text:=IToCurr(Qry.FieldValues['payment']);
      ReceiveDate.Date:=StrToDate(Qry.FieldValues['payment_date']);
      PaymentOption.ItemIndex:=PaymentOption.Items.IndexOf(Trim(Qry.FieldValues['payment_option']));
      if Qry.FieldValues['account_no']<>NULL then AccountNo.Text:='XXXX'+LeftStr(Qry.FieldValues['account_no'],Length(Qry.FieldValues['account_no'])-4);
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusPaymentReceiveForm.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(OrderId.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['product_price_name']<> NULL then begin
        StrGrid.RowCount:=IntCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['to_dates'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[5,IntCount]:=IToCurr(Qry.FieldValues['discount_price'])
        else StrGrid.Cells[5,IntCount]:='0';
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[6,IntCount]:=Qry.FieldValues['discount_percent']
        else StrGrid.Cells[6,IntCount]:='0';
        StrGrid.Cells[7,IntCount]:=IToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[8,IntCount]:=Qry.FieldValues['remark'];
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['product_price_id'];
        StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
      end;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      GridService.RowCount:=IntCount+2;
      GridService.CellStyle[1,IntCount+1].HorizontalAlignment:=taRightJustify;
      GridService.CellStyle[2,IntCount+1].HorizontalAlignment:=taRightJustify;
      if Qry.FieldValues['details']<>NULL then
        GridService.Cells[0,IntCount]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else GridService.Cells[0,IntCount]:=Qry.FieldValues['name'];
      if Qry.FieldValues['quantity']<>NULL then GridService.Cells[1,IntCount]:=Qry.FieldValues['quantity']
      else GridService.Cells[1,IntCount]:='';
      if Qry.FieldValues['amount']<>0 then GridService.Cells[2,IntCount]:=IToCurr(Qry.FieldValues['amount'])
      else GridService.Cells[2,IntCount]:=Qry.FieldValues['transaction_amount'];
      GridService.Cells[3,IntCount]:=Qry.FieldValues['transaction_obj_id'];
      GridService.Cells[4,IntCount]:=Qry.FieldValues['calculate_total'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    Calculate;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusPaymentReceiveForm.Calculate;
var IntCount,IntTotal,IntReceived,IntReceive:Integer;
    Qry:TADOQuery;
    StrQry:String;
begin
{  Main.M_Busy;
  if InvoiceId.Text<>'' then begin
    IntTotal:=SToInt(Total.Text);
    IntReceived:=SToInt(Received.Text);
  end;
  Main.M_Normal;
}
end;

procedure TBusPaymentReceiveForm.SetInvoiceId(Invoice_Id:String);
var Qry:TADOQuery;
    StrQry,StrContactId:String;
    IntCount:Integer;
    IsContactSingle:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionDetail '+QuotedStr(Invoice_Id)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      InvId:=Qry.FieldValues['transaction_id'];
      InvoiceId.Text:=Qry.FieldValues['invoice_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
//      InvoiceDate.Text:=Qry.FieldValues['dates'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      Receiver.Text:=Qry.FieldValues['receiver'];
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Total.Text:=IToCurr(Qry.FieldValues['total']);
      Received.Text:=IToCurr(Qry.FieldValues['total']-Qry.FieldValues['total_sisa']);
      Remain.Text:=IToCurr(Qry.FieldValues['total_sisa']);
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(OrderId.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['product_price_name']<> NULL then begin
        StrGrid.RowCount:=IntCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['to_dates'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[5,IntCount]:=IToCurr(Qry.FieldValues['discount_price'])
        else StrGrid.Cells[5,IntCount]:='0';
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[6,IntCount]:=Qry.FieldValues['discount_percent']
        else StrGrid.Cells[6,IntCount]:='0';
        StrGrid.Cells[7,IntCount]:=IToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[8,IntCount]:=Qry.FieldValues['remark'];
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['product_price_id'];
        StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
      end;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      GridService.RowCount:=IntCount+2;
      GridService.CellStyle[1,IntCount+1].HorizontalAlignment:=taRightJustify;
      GridService.CellStyle[2,IntCount+1].HorizontalAlignment:=taRightJustify;
      if Qry.FieldValues['details']<>NULL then
        GridService.Cells[0,IntCount]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else GridService.Cells[0,IntCount]:=Qry.FieldValues['name'];
      if Qry.FieldValues['quantity']<>NULL then GridService.Cells[1,IntCount]:=Qry.FieldValues['quantity']
      else GridService.Cells[1,IntCount]:='';
      if Qry.FieldValues['amount']<>0 then GridService.Cells[2,IntCount]:=IToCurr(Qry.FieldValues['amount'])
      else GridService.Cells[2,IntCount]:=Qry.FieldValues['transaction_amount'];
      GridService.Cells[3,IntCount]:=Qry.FieldValues['transaction_obj_id'];
      GridService.Cells[4,IntCount]:=Qry.FieldValues['calculate_total'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    Calculate;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TBusPaymentReceiveForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusPaymentReceiveForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBusPaymentReceiveForm.JumlahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TBusPaymentReceiveForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  RefreshPaymentOption;
  if PymtId<>'' then begin
    LoadData;
    RefreshGrid;
    DisableInput;
    CetakUlang.Enabled:=True;
    if IsInput then EnableInput;
    Bersihkan.Enabled:=False;
  end else begin
    AccountNo.Enabled:=False;
    InvoiceDate.Text:=Main.Status.Panels.Items[0].Text;
    Receiver.Text:=FullName;
  end;
end;

procedure TBusPaymentReceiveForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBusPaymentReceiveForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrCompanyId,StrLocationId,StrCustomerId,StrReceive,StrMsg,StrEMsg,StrAmount,StrRemark:String;
    StrStatus,StrCustomerOrderId,StrAccountNo,StrPaymentOption,StrPaymentDate,StrInvoiceId:String;
    IntCount,IntTotal,IntConfirm:Integer;
    IsOk:Boolean;
begin
  if Status.Checked then
     IntConfirm:=MessageBox(0,PChar('Pembayaran Rp. '+Receive.Text+' mau dibatalkan ?'),'Pembayaran',MB_OKCANCEL or MB_ICONQUESTION)
  else
     IntConfirm:=MessageBox(0,PChar('Sudah dihitung dengan benar '+Chr(13)+'total pembayaran Rp. '+Receive.Text+' ?'),'Pembayaran',MB_OKCANCEL or MB_ICONQUESTION);
  if IntConfirm=1 then begin
  if ((InvoiceId.Text<>'') AND (Trim(Receive.Text)<>'') AND (Trim(Receive.Text)<>'0') AND (PaymentOption.Text<>'')
  AND ( (AccountNo.Enabled=False) OR ((AccountNo.Enabled=True) AND (AccountNo.Text<>'')) ) AND (Status.Checked=False) ) OR
  ( (InvoiceId.Text<>'') AND (Status.Checked=True)) 
  then begin
    Main.M_Busy;
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      StrInvoiceId:=QuotedStr(InvoiceId.Text); 
      StrCustomerOrderId:=QuotedStr(OrderId.Text);
      StrCustomerId:=QuotedStr(CustomerId.Text);
      StrCompanyId:=CompanyId;
      StrLocationId:=QuotedStr(LocationId);
      StrReceive:=ToString(Receive.Text);
      StrPaymentDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',ReceiveDate.Date));
      StrPaymentOption:=QuotedStr(PaymentOptionArr[PaymentOption.ItemIndex][0]); 
      if AccountNo.Enabled=True then StrAccountNo:=QuotedStr(Trim(AccountNo.Text)) else StrAccountNo:='NULL'; 
      if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
      if Status.Enabled then if Status.Checked then StrStatus:='0' else StrStatus:='1'
      else StrStatus:='1';
      if PymtId<>'' then begin
        StrTransId:=PymtId;
        StrQry:='UPDATE wh_transaction SET status='+StrStatus+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE transaction_id='+QuotedStr(StrTransId)+';';
      end else begin
        StrQry:='SELECT RIGHT(MAX(transaction_id),4) AS max_id FROM wh_transaction '+
                'WHERE transaction_id  LIKE '+QuotedStr('PTRANS/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/PAY/'+'____')+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        Qry.Close;
        Qry.SQL.Clear;
        StrTransId:='PTRANS/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/PAY/'+StrTransId;
        StrQry:='INSERT INTO wh_transaction (transaction_id,invoice_id,company_id,customer_id,location_id,form_id,submit_date'+
                ',payment_date,transaction_option_id,account_no,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+StrInvoiceId+','+StrCompanyId+','+StrCustomerId+','+StrLocationId+
                ','+StrCustomerOrderId+',GETDATE(),'+StrPaymentDate+','+StrPaymentOption+','+StrAccountNo+','+QuotedStr(User)+');';
      end;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        On E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      StrQry:='';
      if StrStatus='1' then begin
        StrAmount:=ToString(Receive.Text);
        StrQry:='INSERT INTO wh_transaction_detail (transaction_id,transaction_type_id,amount,remark,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+',160102,'+StrAmount+','+StrRemark+','+Chr(39)+User+Chr(39)+');';
      end;
      if StrQry<>'' then begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Transaksi';
            StrEMsg:=E.Message;
            IsOk:=False;
          end
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        if StrStatus='1' then begin
          if MessageBox(0,'Pembayaran Berhasil Disimpan'+Chr(13)+Chr(13)+'    Cetak Slip ?','Pembayaran',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
            RePrint(StrTransId);
          end;
        end else
          MessageBox(0,'Pembatalan Berhasil Dilakukan','Pembayaran',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,PChar('Gagal Menyimpan Pembayaran'+StrEMsg),'Pembayaran',MB_OK or MB_ICONERROR)
      end;
    end;
  end else
    MessageBox(0,PChar('Silahkan Masukkan Transaksi'),'Pembayaran',MB_OK or MB_ICONWARNING);
  Main.M_Normal;
  Main.CloseDb;
  end;
end;

procedure TBusPaymentReceiveForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  EnableInput;
  InvoiceDate.Text:=Main.Status.Panels.Items[0].Text;
  Receiver.Text:=FullName;
end;

procedure TBusPaymentReceiveForm.DisableInput;
begin
  PanelCariInvoice.Enabled:=False; 
  GroupPembayaran.Enabled:=False;
  GroupBatal.Enabled:=False;
  CetakUlang.Enabled:=False;
  Bersihkan.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TBusPaymentReceiveForm.EnableInput;
begin
  if PymtId=''  then begin
    PanelCariInvoice.Enabled:=True;
    GroupPembayaran.Enabled:=True;
    CetakUlang.Enabled:=True;
    Bersihkan.Enabled:=True;
  end;
  GroupBatal.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TBusPaymentReceiveForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppAddress.Lines.Add(Qry.FieldValues['address']);
      ppPhone.Caption:=Qry.FieldValues['phone_no'];
      ppFax.Caption:=Qry.FieldValues['fax_no'];
      ppCompany.Caption:=Qry.FieldValues['company_name'];
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
    StrQry:='SELECT name FROM wh_user WHERE username='+QuotedStr(User)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppSignature.Caption:=Qry.FieldValues['name'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusPaymentReceiveForm.RePrint(Payment_Id:String);
var StrQry,StrTransId,StrCustomerOrderId,StrInvoiceId:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IntTotal,IntDiscountPrice,IntDiscountPercent,IntTotalDiscount:Integer;
begin
  PreparePrint;
  RePrintForm.ReportName:='Bus Payment Receive Form';
  RePrintForm.ReportId:=Payment_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='EXEC GetTransactionDetail  '+QuotedStr(Payment_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if RePrintForm.Copy>0 then ppReprinted.Caption:='C-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='C-Asli';
        ppPaymentId.Caption:=Payment_Id;
        ppInvoiceId.Caption:=Qry.FieldValues['invoice_id'];
        StrInvoiceId:=Qry.FieldValues['invoice_id'];
        if Qry.FieldValues['customer_name']<>NULL then begin
          ppCustomerName.Caption:=Qry.FieldValues['customer_name'];
        end;
        ppDates.Caption:=Qry.FieldValues['payment_date'];
        StrCustomerOrderId:=Qry.FieldValues['customer_order_id'];
        ppPaymentOption.Caption:=Qry.FieldValues['payment_option_en'];
        if Qry.FieldValues['account_no']<>NULL then begin
          ppAccountNoLabel.Caption:='Account No';
          ppAccountNo.Caption:='XXXX'+LeftStr(Qry.FieldValues['account_no'],Length(Qry.FieldValues['account_no'])-4);
        end else begin
          ppAccountNoLabel.Caption:='';
        end;
      end;
      Qry.Close;
      ppDescription.Caption:='Payment for Reservation # '+StrCustomerOrderId;
      StrTransId:=QuotedStr('160101');
      StrQry:='SELECT a.amount,remark FROM wh_transaction_detail a '+
              'LEFT JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
              'WHERE transaction_id='+QuotedStr(Payment_Id)+' ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        ppPayment.Caption:='Rp. '+IToCurr(Qry.FieldValues['amount']);
        ppAmountSaid.Caption:=Trim(AmountSaid(Qry.FieldValues['amount']));
        IntTotal:=Qry.FieldValues['amount'];
        if Qry.FieldValues['remark']<>NULL then ppRemark.Caption:=Qry.FieldValues['remark'];
      end;
      Qry.Close;
      Main.M_Normal;
      ppReport.PreviewFormSettings.WindowState:=wsMaximized;
      ppReport.Print;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TBusPaymentReceiveForm.ReceiveEnter(Sender: TObject);
begin
  if Trim(Receive.Text)<>'' then Receive.Text:=ToString(Receive.Text);
end;

procedure TBusPaymentReceiveForm.ReceiveExit(Sender: TObject);
begin
  if ToString(Receive.Text)<>'' then Receive.Text:=SToCurr(Receive.Text);
  Calculate;
end;

procedure TBusPaymentReceiveForm.CariInvoiceClick(Sender: TObject);
begin
  if Main.IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Payment-Receive','',0);
end;

procedure TBusPaymentReceiveForm.ReceiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Remark.SetFocus;
end;

procedure TBusPaymentReceiveForm.RemarkKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TBusPaymentReceiveForm.CetakUlangClick(Sender: TObject);
begin
  if PymtId<>'' then RePrint(PymtId)
  else if Main.IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Payment-Reprint','',2,2);
end;

procedure TBusPaymentReceiveForm.ReceiveDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then PaymentOption.SetFocus;
end;

procedure TBusPaymentReceiveForm.AccountNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Remark.SetFocus;
end;

procedure TBusPaymentReceiveForm.PaymentOptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then if AccountNo.Enabled then AccountNo.SetFocus else Remark.SetFocus;
end;

procedure TBusPaymentReceiveForm.PaymentOptionChange(Sender: TObject);
begin
  if PaymentOption.Text<>'' then begin
    if PaymentOptionArr[PaymentOption.ItemIndex][2]='1' then AccountNo.Enabled:=True else AccountNo.Enabled:=False;
    if (PaymentOptionArr[PaymentOption.ItemIndex][2]='1') OR (PaymentOptionArr[PaymentOption.ItemIndex][3]='1') then AccountName.Enabled:=True else AccountName.Enabled:=False;
    if PaymentOptionArr[PaymentOption.ItemIndex][4]='1' then ValidationNo.Enabled:=True else ValidationNo.Enabled:=False;
  end;
end;

end.
