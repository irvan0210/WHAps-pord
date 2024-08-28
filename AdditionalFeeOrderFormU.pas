unit AdditionalFeeOrderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppParameter, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls, Buttons,
  Mask, ComCtrls, Grids, ZColorStringGrid, ExtCtrls, WHUnit, ppDBPipe, ppDB, DB, ppDBBDE,
  ppSubRpt, Jpeg;

type
  TAdditionalFeeOrderForm = class(TForm)
    Label19: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SubTotal: TMemo;
    Discount: TMemo;
    Total: TMemo;
    GroupBatal: TPanel;
    Status: TCheckBox;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GroupHeader: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    LabelSegment1: TLabel;
    Panel1: TPanel;
    CustomerDisp: TEdit;
    ContactDisp: TEdit;
    CustomerId: TEdit;
    ContactId: TEdit;
    ContractId: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    OrderId: TEdit;
    OrderDate: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    Label1: TLabel;
    RefOrderId: TEdit;
    GroupDetail: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    PanelDetail: TPanel;
    PanelDiscount: TPanel;
    Label7: TLabel;
    DiscountPrice: TEdit;
    DiscountPercent: TEdit;
    Remark: TMemo;
    PanelCari: TPanel;
    CariPesanan: TSpeedButton;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    Service: TComboBox;
    JumlahBiaya: TEdit;
    Qty: TEdit;
    Label20: TLabel;
    DiscountCN: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Guide: TEdit;
    Label23: TLabel;
    GuideCellular: TEdit;
    Label24: TLabel;
    Group: TEdit;
    Address: TMemo;
    HeaderRemark: TMemo;
    GroupSalesPerson: TPanel;
    SalesPerson: TComboBox;
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariPesananClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure GridServiceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JumlahBiayaExit(Sender: TObject);
    procedure JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
    procedure ServiceChange(Sender: TObject);
    procedure ServiceKeyPress(Sender: TObject; var Key: Char);
    procedure ServiceExit(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPercentEnter(Sender: TObject);
    procedure DiscountPercentExit(Sender: TObject);
    procedure DiscountPercentKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPriceEnter(Sender: TObject);
    procedure DiscountPriceExit(Sender: TObject);
    procedure DiscountPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountCNKeyPress(Sender: TObject; var Key: Char);
    procedure GuideCellularKeyPress(Sender: TObject; var Key: Char);
    procedure GuideKeyPress(Sender: TObject; var Key: Char);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure Label4DblClick(Sender: TObject);
    procedure Label5DblClick(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    IsInputGrid,IsInput,IsPriceEdit,IsBookDirect:Boolean;
    OrdrId,FormRequest:String;
    Revision,MinRowService,IntRowService,IntColService,DiscntPercent,DiscntPrice:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure RefreshService;
    procedure LoadData;
    procedure RefreshGrid;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure CheckService;
    procedure PreparePrint;
    procedure ShowCustomerDetail;
  public
    { Public declarations }
    procedure SetOrderId(Order_Id:String);
//    procedure RePrint(Order_Id:String);
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Order_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Book_Direct:Boolean=False);Overload;
  end;

var
  AdditionalFeeOrderForm: TAdditionalFeeOrderForm;

implementation

uses MainU, ADODB, DateUtils, AuthorizedFormU, RePrintFormU, OfferingListU,
  CustomerListU, CustomerU, ContractListU, OfferingFormU, OrderListU,
  BookingFormU, StrUtils;

{$R *.dfm}
constructor TAdditionalFeeOrderForm.Create(AOwner:TComponent;Order_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Book_Direct:Boolean=False);
begin
  CompId:=2;
  OrdrId:=Order_Id;
  IsInputGrid:=Is_Input;
  IsInput:=Is_Input;
  FormRequest:=Form_Request;
  IsBookDirect:=Book_Direct;
  Main.WriteLog('Form Open: OrderForm='+Order_Id+','+BoolToStr(Is_Input)+','+Form_Request+','+BoolToStr(Book_Direct),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TAdditionalFeeOrderForm.Init;
begin
  IsPriceEdit:=False;
  RefOrderId.Text:='';
  OrderId.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  ContactId.Text:='';
  ContactDisp.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  Address.Text:='';
  HeaderRemark.Text:='';
  ContractId.Text:='';
  DiscountPrice.Text:='0';
  DiscountPercent.Text:='0';
  Remark.Text:='';
  SubTotal.Text:='';
  Discount.Text:='';
  Total.Text:='';
  PanelCari.Enabled:=True;
  Status.Checked:=False;
  DiscountPrice.Enabled:=True;
  DiscountPercent.Enabled:=True;
  DiscountCN.Text:='';
  DiscntPercent:=0;
  DiscntPrice:=0;
  if OrdrId<>'' then begin
    Status.Visible:=True;
  end else begin
    Status.Visible:=False;
  end;
//  ScheduleAdd.Visible:=False;
  SalesPerson.Style:=csSimple;
  SalesPerson.Text:='';
end;

procedure TAdditionalFeeOrderForm.InitGridService;
var IntCount,IntCount2:Integer;
begin
  MinRowService:=0;
  GridService.ColCount:=12;
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
  for IntCount:=MinRowGrid+1 to GridService.RowCount-1 do
    for IntCount2:=0 to GridService.ColCount-1 do
      GridService.Cells[IntCount2,IntCount]:='';
end;

procedure TAdditionalFeeOrderForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
begin
  RefreshService;
end;

procedure TAdditionalFeeOrderForm.RefreshService;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCountPagi,IntCountMalam:Integer;
begin
  Service.Text:='';
  Service.ItemIndex:=-1;
  Service.Items.Clear;
  SetLength(ServiceArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionType '+QuotedStr('Order')+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=1;
    SetLength(ServiceArr,Qry.RecordCount+1);
    ServiceArr[0][0]:='0';
    ServiceArr[0][1]:=' ';
    ServiceArr[0][6]:='0';
    ServiceArr[0][8]:='1';
    ServiceArr[0][9]:='0';
    ServiceArr[0][10]:='0';
    ServiceArr[0][11]:='0';
    ServiceArr[0][12]:='0';
    ServiceArr[0][13]:='0';
    ServiceArr[0][14]:='0';
    ServiceArr[0][15]:='0';
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      ServiceArr[Count][0]:=Qry.FieldValues['transaction_type_id'];
      if Qry.FieldValues['details']<>NULL then
        ServiceArr[Count][1]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else ServiceArr[Count][1]:=Qry.FieldValues['name'];
      ServiceArr[Count][2]:=Qry.FieldValues['amount'];
      ServiceArr[Count][3]:=Qry.FieldValues['discount'];
      ServiceArr[Count][4]:=Qry.FieldValues['discount_percent'];
      ServiceArr[Count][5]:=Qry.FieldValues['tax'];
      ServiceArr[Count][6]:=Qry.FieldValues['transaction_obj_id'];
      ServiceArr[Count][7]:=Qry.FieldValues['value'];
      ServiceArr[Count][8]:=Qry.FieldValues['display'];
      ServiceArr[Count][9]:=Qry.FieldValues['non_cash'];
      ServiceArr[Count][10]:=Qry.FieldValues['calculate_total'];
      ServiceArr[Count][11]:=Qry.FieldValues['t_in'];
      ServiceArr[Count][12]:=Qry.FieldValues['t_out'];
      ServiceArr[Count][13]:=Qry.FieldValues['day_multiply'];
      ServiceArr[Count][14]:=Qry.FieldValues['quantity'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(ServiceArr)-1 do
    if StrToInt(ServiceArr[Count][8])>0 then
      Service.Items.Add(ServiceArr[Count][1]);
  Main.M_Normal;
end;

procedure TAdditionalFeeOrderForm.CheckService;
var IntCount:Integer;
begin
  if (Trim(Service.Text)<>'') then begin
    GridService.Cells[1,IntRowService]:='';
    GridService.Cells[2,IntRowService]:=SToCurr(ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][2]);
    GridService.Cells[3,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][6];
    GridService.Cells[4,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][7];
    GridService.Cells[5,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][0];
    GridService.Cells[6,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][9];
    GridService.Cells[7,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][10];
    GridService.Cells[8,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][11];
    GridService.Cells[9,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][12];
    GridService.Cells[10,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][13];
    GridService.Cells[11,IntRowService]:=ServiceArr[ArrayIndexOf(ServiceArr,Service.Text,1)][14];
  end else
    for IntCount:=1 to GridService.ColCount-1 do GridService.Cells[IntCount,IntRowService]:='';

end;

procedure TAdditionalFeeOrderForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntDiscount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerOrderDetail '+QuotedStr(OrdrId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['ref_customer_order_id']<>NULL then RefOrderId.Text:=Qry.FieldValues['ref_customer_order_id'];
      if Qry.FieldValues['customer_id']<>NULL then begin
        CustomerId.Text:=Qry.FieldValues['customer_id'];
        OrderDate.Text:=Qry.FieldValues['dates'];
        revision:=Qry.FieldValues['rev']+1;
        if Qry.FieldValues['customer_name']<>NULL then CustomerDisp.Text:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
        if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      end;
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      if Qry.FieldValues['cust_contract_id']<>NULL then ContractId.Text:=Qry.FieldValues['cust_contract_id'];
      if SalesPerson.Style=csSimple then
        SalesPerson.Text:=Qry.FieldValues['sales_name']
      else begin
        if SalesPerson.Items.IndexOf(Qry.FieldValues['sales_name'])<0 then
        SalesPerson.Items.Add(Qry.FieldValues['sales_name']);
        SalesPerson.ItemIndex:=SalesPerson.Items.IndexOf(Qry.FieldValues['sales_name']);
      end;
      if Qry.FieldValues['group_name']<>NULL then begin
        Group.Text:=Qry.FieldValues['group_name'];
      end;
      if Qry.FieldValues['discount_cn_percent']<>NULL then DiscountCN.Text:=IToCurr(Qry.FieldValues['discount_cn_percent']);
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
      if (Qry.FieldValues['discount_price']<>NULL) and (Qry.FieldValues['discount_price']>0) then begin
        DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']);
        DiscntPrice:=Qry.FieldValues['discount_price'];
      end;
      if (Qry.FieldValues['discount_percent']<>NULL) and (Qry.FieldValues['discount_percent']>0) then begin
        DiscountPercent.Text:=Qry.FieldValues['discount_percent'];
        DiscntPercent:=Qry.FieldValues['discount_percent'];
      end;
      if (Qry.FieldValues['contract_discount_price']<>NULL) OR (Qry.FieldValues['contract_discount_percent']<>NULL) then PanelDiscount.Enabled:=False;
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Total.Text:=IToCurr(Qry.FieldValues['total']);
      Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']);
      if Qry.FieldValues['discount_amount']>0 then Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']);
//      IntDiscount:=Qry.FieldValues['discount_price']+Round((IntTotal*Qry.FieldValues['discount_percent'])/100);
//      Discount.Text:=IToCurr(IntDiscount);
//      SubTotal.Text:=IToCurr(Qry.FieldValues['total']+IntDiscount);
      Qry.Next;              
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAdditionalFeeOrderForm.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrdrId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
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
      GridService.Cells[4,IntCount]:=Qry.FieldValues['value'];
      GridService.Cells[5,IntCount]:=Qry.FieldValues['transaction_type_id'];
      GridService.Cells[6,IntCount]:=Qry.FieldValues['non_cash'];
      GridService.Cells[7,IntCount]:=Qry.FieldValues['calculate_total'];
      GridService.Cells[8,IntCount]:=Qry.FieldValues['t_in'];
      GridService.Cells[9,IntCount]:=Qry.FieldValues['t_out'];
      GridService.Cells[10,IntCount]:=Qry.FieldValues['day_multiply'];
      GridService.Cells[11,IntCount]:=Qry.FieldValues['transaction_quantity'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  Calculate;
end;

procedure TAdditionalFeeOrderForm.Calculate;
var IntCount,IntTotal,IntTotalAll,IntPrice,IntDiscPrice,IntDiscPerc,IntMonths,IntDates,IntYears,IntUnit,IntAddDays:Integer;
    IntDays,IntTotalService,Intservice,IntMultiply,IntFromDate,IntToDate,IntToMonth,IntFromMonth,IntFromYears,IntToYears:Integer;
    IntAmountAddDays:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IsWeekday,IsWeekend:Boolean;
begin
  Main.M_Busy;
    IntTotalService:=0;
    for IntCount:=MinRowService+1 to GridService.RowCount-1 do begin
      if (Trim(GridService.Cells[0,IntCount])<>'') and (Trim(GridService.Cells[2,IntCount])<>'') and (GridService.Cells[7,IntCount]='1')then begin
        if (GridService.Cells[1,IntCount]<>'') and (GridService.Cells[1,IntCount]<>'0') then
          Intservice:=SToInt(GridService.Cells[1,IntCount])*SToInt(GridService.Cells[2,IntCount])
        else if (GridService.Cells[2,IntCount]<>'1') then
          Intservice:=SToInt(GridService.Cells[2,IntCount]);
        IntTotalService:=IntTotalService+IntService;
      end;
    end;
    SubTotal.Text:=IToCurr(IntTotalService);
    IntDiscPrice:=SToInt(DiscountPrice.Text);
    IntDiscPerc:=SToInt(DiscountPercent.Text);
    if not(Initiation) then begin
      Discount.Text:=IToCurr(IntDiscPrice+(IntTotalService*(IntDiscPerc/100)));
      Total.Text:=IToCurr(IntTotalService-(IntDiscPrice+(IntTotalService*(IntDiscPerc/100))));
    end;
  Main.M_Normal;
end;

procedure TAdditionalFeeOrderForm.SetOrderId(Order_Id:String);
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
    StrQry:='EXEC GetCustomerOrderDetail '+QuotedStr(Order_Id)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      RefOrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
//      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      SalesPerson.Text:=Qry.FieldValues['sales_name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAdditionalFeeOrderForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TAdditionalFeeOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAdditionalFeeOrderForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrRefOrderId,StrCustomerId,StrContactId,StrContractId,StrDiscountPrice,StrDiscountPercent,StrRemark:String;
    StrProductPriceId,StrDestination,StrPickup,StrDateStart,StrDateFinish,StrTimeStart,StrTimeStandby,StrSeat,StrPackage,StrReserver:String;
    StrPriceWeekday,StrPriceWeekend,StrTotal,StrStatus,StrUnits,StrRevision,StrQuantity,StrAmount,StrDiscountCNPercent:String;
    StrGuide,StrGuideCellular,StrCustomerorderDetailId,StrGroup,StrSales,StrTotalAddDay,StrDiscountAmount,StrPriceOverday,StrFullDay:String;
    StrTransId,StrEMsg,StrCompanyId,StrLocationId,StrTransId2,StrTransIds,StrToTimes,StrBatchId,StrVehicleId,StrEmployeeId,StrReservedId:String;
    IntCount,IntCount2,DiscPercent,DiscPrice,TotalUnit,PrintBooking:Integer;
    IsOk,IsAuth,IsBooked:Boolean;
    VhcArr:Array of String;
begin
  IsOk:=True;
  PrintBooking:=0;
{  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if (Trim(StrGrid.Cells[1,IntCount])<>'') then begin
      if (StrGrid.Cells[4,IntCount]='') or (StrGrid.Cells[3,IntCount]='') or (StrGrid.Cells[5,IntCount]='')
      and (StrGrid.Cells[6,IntCount]='') or (StrGrid.Cells[13,IntCount]='') or (StrGrid.Cells[14,IntCount]='') then IsOK:=False;
      if Length(Trim(StrGrid.Cells[5,IntCount]))<5 then IsOk:=False;
      try
        if (StrToInt(LeftStr(StrGrid.Cells[5,IntCount],2))>23) then IsOk:=False;
        if (StrToInt(RightStr(StrGrid.Cells[5,IntCount],2))>59) then IsOk:=False;
      except
        IsOk:=False;
      end;
    end;
  end;
}
  if (CustomerId.Text<>'') and ((Total.Text<>'')) and (IsOk) then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='130806';
    DiscPrice:=0;
    DiscPercent:=0;
    if Status.Checked=False then begin
    end;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Main.M_Busy;
    Main.WriteLog('Form Save:OrderForm',1);
    if Main.OpenDb then begin
    FreeAndNil(Qry);
    Main.M_Normal;
    end;
    if IsAuth then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      Main.WriteLog('Form Save:OrderForm',1);
      if Main.OpenDb then begin
        DisableInput;
        Main.TransStart;
        IsOk:=True;
        StrCompanyId:=CompanyId;
        StrLocationId:=LocationId;
        StrSales:=QuotedStr(SalesPerson.Text);
        if RefOrderId.Text<>'' then StrRefOrderId:=QuotedStr(RefOrderId.Text) else StrRefOrderId:='NULL';
        if CustomerId.Text<>'' then StrCustomerId:=QuotedStr(CustomerId.Text) else StrCustomerId:='NULL';
        if ContactId.Text<>'' then StrContactId:=QuotedStr(ContactId.Text) else StrContactId:='NULL';
        if ContractId.Text<>'' then StrContractId:=QuotedStr(ContractId.Text) else StrContractId:='NULL';
        if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
        if Trim(Group.Text)<>'' then StrGroup:=QuotedStr(Trim(Group.Text)) else StrGroup:='NULL';
        if DiscountPrice.Text<>'' then StrDiscountPrice:=ToString(DiscountPrice.Text) else StrDiscountPrice:='NULL';
        if DiscountPercent.Text<>'' then StrDiscountPercent:=DiscountPercent.Text else StrDiscountPercent:='NULL';
        StrDiscountAmount:=ToString(Discount.Text);
        if DiscountCN.Text<>'' then StrDiscountCNPercent:=DiscountCN.Text else StrDiscountCNPercent:='NULL';
        if Trim(Guide.Text)<>'' then StrGuide:=QuotedStr(Trim(Guide.Text)) else StrGuide:='NULL';
        if Trim(GuideCellular.Text)<>'' then StrGuideCellular:=QuotedStr(Trim(GuideCellular.Text)) else StrGuideCellular:='NULL';
        if Status.Visible then if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';
        StrRevision:=IntToStr(Revision);
        StrTotal:=ToString(Total.Text);
        if (OrderId.Text<>'')  then begin
          StrTransId:=OrdrId;
          StrQry:='UPDATE wh_customer_order SET customer_id='+StrCustomerId+',contact_person_id='+StrContactId+
                ',cust_contract_id='+StrContractId+',group_name='+StrGroup+',discount_price='+StrDiscountPrice+
                ',discount_percent='+StrDiscountPercent+',discount_cn_percent='+StrDiscountCNPercent+
                ',discount_amount='+StrDiscountAmount+',field_contact='+StrGuide+',field_contact_cellular_no='+StrGuideCellular+
                ',total='+StrTotal+',remark='+StrRemark+',status='+StrStatus+',rev='+StrRevision+
                ',sales_id=dbo.GetUserId('+StrSales+')'+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE customer_order_id='+QuotedStr(StrTransId)+';';
          if StrStatus='1' then begin
            StrQry:=StrQry+' UPDATE wh_customer_order_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
            StrQry:=StrQry+' UPDATE wh_customer_order_service_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end else begin
            StrQry:=StrQry+' UPDATE wh_reserved_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end;
        end else begin
          StrQry:='SELECT RIGHT(MAX(customer_order_id),4) AS max_id FROM wh_customer_order '+
                  'WHERE customer_order_id  LIKE '+QuotedStr('CA'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____')+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrTransId:=Qry.FieldValues['max_id'];
            StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
            Qry.Close;
            Qry.SQL.Clear;
          end else
            StrTransId:='0001';
          StrTransId:='CA'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
          StrQry:='INSERT INTO wh_customer_order (customer_order_id,company_id,location_id,ref_customer_order_id'+
                  ',customer_id,contact_person_id,cust_contract_id,group_name,sales_id,discount_price,discount_percent'+
                  ',discount_amount,total,discount_cn_percent,field_contact,field_contact_cellular_no,remark,update_user)'+
                  ' VALUES '+
                  '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrRefOrderId+
                  ','+StrCustomerId+','+StrContactId+','+StrContractId+','+StrGroup+',dbo.GetUserId('+StrSales+')'+
                  ','+StrDiscountPrice+','+StrDiscountPercent+','+StrDiscountAmount+','+StrTotal+','+StrDiscountCNPercent+
                  ','+StrGuide+','+StrGuideCellular+','+StrRemark+','+QuotedStr(User)+');';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMsg:=StrEMsg+E.Message;
          end;
        end;
        StrQry:='SELECT MAX(COALESCE(CAST(Substring(customer_order_detail_id,11, 8) as Int), 0)) AS max_id FROM wh_customer_order_detail '+
                'WHERE customer_order_detail_id  LIKE '+QuotedStr('COR'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'______')+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId2:=Qry.FieldValues['max_id'];
          StrTransId2:=Format('%.*d',[6,StrToInt(StrTransId2)]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId2:='000000';
        StrQry:='';
        IntCount2:=0;
        if StrStatus='1' then begin
          StrQry:='';
          for IntCount:=1 to GridService.RowCount-1 do
            if (GridService.Cells[0,IntCount]<>'') and (GridService.Cells[2,IntCount]<>'') then begin
              StrProductPriceId:=QuotedStr(GridService.Cells[5,IntCount]);
              if Trim(GridService.Cells[1,IntCount])<>'' then StrQuantity:=GridService.Cells[1,IntCount] else StrQuantity:='NULL';
              if (Trim(GridService.Cells[2,IntCount])<>'1') then StrAmount:=ToString(GridService.Cells[2,IntCount]) else StrAmount:='0';
              StrQry:='INSERT INTO wh_customer_order_service_detail (customer_order_id,transaction_type_id,quantity,amount'+
                      ',update_user) VALUES '+
                      '('+QuotedStr(StrTransId)+','+StrProductPriceId+','+StrQuantity+','+StrAmount+','+QuotedStr(User)+');';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=StrEMsg+E.Message;
                end;
              end;
            end;
        end;
        if (IsOk) then begin
          Main.TransCommit;
          OrderId.Text:=StrTransId;
          OrdrId:=StrTransId;
          if StrStatus='1' then begin
            if MessageBox(Handle,PChar('Pesanan Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
//               RePrint(StrTransId);
            end;
          end else
            MessageBox(Handle,'Pesanan Berhasil Disimpan','Surat Pesanan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND)
        end else begin
          Main.TransRollback;
          Main.WriteLog('Form Save : Fail='+StrEMsg,1);
          MessageBox(Handle,PChar('Pesanan Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Surat Pesanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          EnableInput;
        end;
      end;
      FreeAndNil(Qry)
    end else
      MessageBox(Handle,PChar(StrEMsg),'Surat Pesanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  end else
    MessageBox(Handle,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Surat Pensanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  Main.CloseDb;
  Main.M_Normal;
  if PrintBooking=1 then begin
    BookingForm:=TBookingForm.Create(Self,'',False,'Order-Print');
    BookingForm.RePrint(StrReservedId);
  end;
end;

procedure TAdditionalFeeOrderForm.FormShow(Sender: TObject);
begin
  Init;
  InitGridService;
  RefreshCombo;
  if OrdrId<>'' then begin
    Caption:='Data Pesanan';
    PanelDiscount.Enabled:=True;
    LoadData;
    RefreshGrid;
    if not(IsInput) then begin
      DisableInput;
    end;
    Bersihkan.Enabled:=False;
  end else begin
    OrderDate.Text:=Main.Status.Panels.Items[0].Text;
    SalesPerson.Text:=FullName;
  end;
  Initiation:=False;
end;

procedure TAdditionalFeeOrderForm.DisableInput;
begin
  IsInputGrid:=False;
  IsPriceEdit:=False;
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupDetail.Enabled:=False;
  GroupBatal.Enabled:=False;
  GroupSalesPerson.Enabled:=False;
  Remark.Enabled:=False;
  GroupService.Enabled:=False;
end;

procedure TAdditionalFeeOrderForm.EnableInput;
begin
  IsInputGrid:=True;
  Simpan.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupDetail.Enabled:=True;
  GroupBatal.Enabled:=True;
  GroupSalesPerson.Enabled:=True;
  Remark.Enabled:=True;
  GroupService.Enabled:=True;
end;

procedure TAdditionalFeeOrderForm.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
{  Qry:=TADOQuery.Create(Self);
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
      end;
      ppCompanySign.Caption:=Qry.FieldValues['company_name'];
    end;
    Qry.Close;
    ppTermsConditionDetail.Lines.Clear;
    StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Confirmation-TC')+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not Qry.Eof do begin
      if Qry.FieldValues['value_str']<>NULL then begin
        ppTermsConditionDetail.Lines.Add(IntToStr(IntCount)+'. '+Qry.FieldValues['value_str']);
        Inc(IntCount);
      end else ppTermsConditionDetail.Lines.Add('');
      StrQry:='EXEC GetCompanyLocationDetailDetailList '+IntToStr(Qry.FieldValues['company_location_detail_id'])+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then while not Qry2.Eof do begin
        ppTermsConditionDetail.Lines.Add(Qry2.FieldValues['value_str']);
        Qry2.Next;
      end;
      Qry.Next;
    end;
    Qry.Close;
    ppTermsConditionDetail2.Lines.Clear;
    StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Confirmation-AC')+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not Qry.Eof do begin
      if Qry.FieldValues['value_str']<>NULL then ppTermsConditionDetail2.Lines.Add(Qry.FieldValues['value_str'])
      else ppTermsConditionDetail2.Lines.Add('');
      Qry.Next;
    end;
    Qry.Close;
    ppFooterMemo.Lines.Clear;
    StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Confirmation-FT')+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not Qry.Eof do begin
      if Qry.FieldValues['value_str']<>NULL then ppFooterMemo.Lines.Add(Qry.FieldValues['value_str'])
      else ppFooterMemo.Lines.Add('');
      Qry.Next;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
}
end;
{
procedure TOrderForm.RePrint(Order_Id:String);
var StrQry,StrName,StrValue,StrDate:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntCount:Integer;
begin
  PreparePrint;
  RePrintForm.ReportName:='Order Form';
  RePrintForm.ReportId:=Order_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetCustomerOrderDetail  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
        if Qry.FieldValues['rev']>0 then ppOrderId.Caption:=Order_Id+'R' else ppOrderId.Caption:=Order_Id;
        if Qry.FieldValues['customer_name']<>NULL then ppCustomerName.Caption:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['contact_person']<>NULL then ppContactName.Caption:=Qry.FieldValues['contact_person'];
        if Qry.FieldValues['contact_email']<>NULL then ppemail.Caption:=Qry.FieldValues['contact_email'];
        if Qry.FieldValues['group_name']<>NULL then ppGroupName.Caption:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['phone_no']<>NULL then ppPhoneNo.Caption:=Qry.FieldValues['phone_no'];
        if Qry.FieldValues['cellular_no']<>NULL then ppCelularNo.Caption:=Qry.FieldValues['cellular_no'];
        if Qry.FieldValues['fax_no']<>NULL then ppFaxNo.Caption:=Qry.FieldValues['fax_no'];
        ppTotal.Caption:='Rp. '+IToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['discount_price']<>NULL then ppDiscount.Caption:=Qry.FieldValues['discount_price'];
        if Qry.FieldValues['discount_percent']<>NULL then ppDiscount.Caption:=Qry.FieldValues['discount_percent'];
        ppSalesName.Caption:=Qry.FieldValues['initial_name'];
        ppSubmitDate.Caption:=Qry.FieldValues['submit_dates'];
        ppSubmitTime.Caption:=Qry.FieldValues['submit_times'];
        if Qry.FieldValues['cust_contract_id']<>NULL then ppContract.Caption:='Kontrak' else ppContract.Caption:='Non Kontrak';
        if Qry.FieldValues['transaction_id']<>NULL then ppInvoiceNo.Caption:=Qry.FieldValues['transaction_id'];
        if Qry.FieldValues['discount_cn_percent']<>NULL then begin
          if Qry.FieldValues['contact_person']<>NULL then ppNameCN.Caption:=Qry.FieldValues['contact_person'];
          ppDiscountCN.Caption:=Qry.FieldValues['discount_cn_percent'];
        end;
        if Qry.FieldValues['field_contact']<>NULL then ppGuideName.Caption:=Qry.FieldValues['field_contact'];
        if Qry.FieldValues['field_contact_cellular_no']<>NULL then ppGuideCellular.Caption:=Qry.FieldValues['field_contact_cellular_no'];
      end;
      Qry.Close;
      StrQry:='SELECT SUM(units) AS total_units,c.seat FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=5) AND (c.company_id=2) AND (a.status=1)'+
              ' GROUP BY seat;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['total_units']<>NULL then begin
          if ppSilverBigBus.Caption='' then begin
            ppSilverBigBus.Caption:=IntToStr(Qry.FieldValues['total_units']);
            ppSilverBigBusSeat.Caption:=IntToStr(Qry.FieldValues['seat']);
          end else begin
            ppSilverBigBus.Caption:=ppSilverBigBus.Caption+' + '+IntToStr(Qry.FieldValues['total_units']);
            ppSilverBigBusSeat.Caption:=ppSilverBigBusSeat.Caption+' & '+IntToStr(Qry.FieldValues['seat']);
          end;
        end;
        Qry.Next;
      end;
      Qry.Close;
      StrQry:='SELECT SUM(units) AS total_units,c.seat FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=6) AND (c.company_id=2) AND (a.status=1)'+
              ' GROUP BY seat;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['total_units']<>NULL then begin
          if ppSilverMicroBus.Caption='' then begin
            ppSilverMicroBus.Caption:=IntToStr(Qry.FieldValues['total_units']);
            ppSilverMicroBusSeat.Caption:=IntToStr(Qry.FieldValues['seat']);
          end else begin
            ppSilverMicroBus.Caption:=ppSilverMicroBus.Caption+' + '+IntToStr(Qry.FieldValues['total_units']);
            ppSilverMicroBusSeat.Caption:=ppSilverMicroBusSeat.Caption+' & '+IntToStr(Qry.FieldValues['seat']);
          end;
        end;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Close;
      StrQry:='SELECT SUM(units) AS total_units,c.seat FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=7) AND (c.company_id=2) AND (a.status=1)'+
              ' GROUP BY seat;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['total_units']<>NULL then begin
          if ppSilverMiniVan.Caption='' then begin
            ppSilverMiniVan.Caption:=IntToStr(Qry.FieldValues['total_units']);
            ppSilverMiniVanSeat.Caption:=IntToStr(Qry.FieldValues['seat']);
          end else begin
            ppSilverMiniVan.Caption:=ppSilverMiniVan.Caption+' + '+IntToStr(Qry.FieldValues['total_units']);
            ppSilverMiniVanSeat.Caption:=ppSilverMiniVanSeat.Caption+' & '+IntToStr(Qry.FieldValues['seat']);
          end;
        end;
        Qry.Next;
      end;
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderServiceList  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['details']<>NULL then StrName:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
        else StrName:='- '+Qry.FieldValues['name'];
        Case IntCount of
          0:ppService1.Caption:=StrName;
          1:ppService2.Caption:=StrName;
          2:ppService3.Caption:=StrName;
          3:ppService4.Caption:=StrName;
          4:ppService5.Caption:=StrName;
          5:ppService6.Caption:=StrName;
        end;
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
      StrQry:='SELECT CONVERT(VARCHAR(10),a.submit_date,103) AS trans_date,* '+
              ' FROM wh_transaction_detail a '+
              ' LEFT JOIN wh_transaction b ON b.transaction_id=a.transaction_id '+
              ' LEFT JOIN wh_transaction_type c ON c.transaction_type_id=a.transaction_type_id'+
              ' WHERE (c.t_in=1) and (a.status=1) AND (b.status=1) AND (b.form_id='+QuotedStr(Order_Id)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['amount']<>NULL then begin
          StrValue:=IToCurr(Qry.FieldValues['amount']);
          StrDate:=Qry.FieldValues['trans_date'];
          Inc(IntCount);
        end;
        Case IntCount of
          1:begin
              ppPayment1.Caption:=StrValue;
              ppDatePayment1.Caption:=StrDate;
            end;
          2:begin
              ppPayment2.Caption:=StrValue;
              ppDatePayment2.Caption:=StrDate;
            end;
        end;
        Qry.Next;
      end;
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderDetailPrint  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport.PreviewFormSettings.WindowState:=wsMaximized;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;
}

{
procedure TAdditionalFeeOrderForm.RePrint(Order_Id:String);
var StrQry,StrName,StrValue,StrDate,StrLine,StrSalesId:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntCount,IntLineCount:Integer;
    JPG:TJPEGImage;
    StmImage:TMemoryStream;
begin
  PreparePrint;
  IsToFile:=Main.MyMessageDlg('Mau dicetak ke?',mtInformation,[mbYes,mbNo,mbCancel],['Kertas','Kop surat','e-mail'],'Tujuan');
  RePrintForm.ReportName:='Order Form';
  RePrintForm.ReportId:=Order_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    ppRemark.Lines.Clear;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetCustomerOrderDetail  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      ppDate.Caption:=FormatDateTime('dd mmmm yyyy',Now());
      ppServicesRp.Caption:='';
      ppServicesLabel.Caption:='';
      ppServices.Caption:='';
      if Qry.RecordCount>0 then begin
        StrSalesId:=Qry.FieldValues['sales_id'];
        if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
        if Qry.FieldValues['rev']>0 then ppOrderId.Caption:=Order_Id+'R' else ppOrderId.Caption:=Order_Id;
        if Qry.FieldValues['customer_name']<>NULL then ppCustomerName.Caption:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['contact_person']<>NULL then ppContactName.Caption:=Qry.FieldValues['contact_person']
        else ppContactName.Caption:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['contact_email']<>NULL then ppemail.Caption:=Qry.FieldValues['contact_email'];
        if Qry.FieldValues['group_name']<>NULL then ppGroupName.Caption:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['phone_no']<>NULL then ppPhoneNo.Caption:=Qry.FieldValues['phone_no'];
        if Qry.FieldValues['contact_cellular']<>NULL then ppCelularNo.Caption:=Qry.FieldValues['contact_cellular'];
        if Qry.FieldValues['fax_no']<>NULL then ppFaxNo.Caption:=Qry.FieldValues['fax_no'];
        IntTotal:=Qry.FieldValues['total_order'];
        ppTotal.Caption:=IToCurr(Qry.FieldValues['total']);
        if (Qry.FieldValues['discount_price']=0) and (Qry.FieldValues['discount_percent']=0) then begin
          ppLabelDiscountRp.Caption:='';
          ppLabelDiscount.Caption:='';
          ppDiscount.Caption:='';
        end else begin
          ppLabelDiscountRp.Caption:='Rp.';
          ppLabelDiscount.Caption:='Discount';
        end;
        if Qry.FieldValues['discount_amount']>0 then begin
          if Qry.FieldValues['discount_percent']<>0 then begin
            ppLabelDiscount.Caption:=ppLabelDiscount.Caption+' '+IntToStr(Qry.FieldValues['discount_percent'])+'%';
          end;
          ppDiscount.Caption:=IToCurr(Qry.FieldValues['discount_amount']);
        end else begin
          if Qry.FieldValues['discount_price']<>0 then begin
            IntDiscountPrice:=Qry.FieldValues['discount_price'];
            ppDiscount.Caption:=IToCurr(IntDiscountPrice+Round((IntTotal*IntDiscountPercent)/100));
          end;
          if Qry.FieldValues['discount_percent']<>0 then begin
            ppLabelDiscount.Caption:=ppLabelDiscount.Caption+' '+IntToStr(Qry.FieldValues['discount_percent'])+'%';
            IntDiscountPercent:=Qry.FieldValues['discount_percent'];
            ppDiscount.Caption:=IToCurr(IntDiscountPrice+Round((IntTotal*IntDiscountPercent)/100));
          end;
        end;
        ppSalesSign.Caption:=Qry.FieldValues['sales_name'];
//        ppSubmitDate.Caption:=Qry.FieldValues['submit_dates'];
//        ppSubmitTime.Caption:=Qry.FieldValues['submit_times'];
//        if Qry.FieldValues['cust_contract_id']<>NULL then ppContract.Caption:='Kontrak' else ppContract.Caption:='Non Kontrak';
//        if Qry.FieldValues['transaction_id']<>NULL then ppInvoiceNo.Caption:=Qry.FieldValues['transaction_id'];
//        if Qry.FieldValues['discount_cn_percent']<>NULL then begin
//          if Qry.FieldValues['contact_person']<>NULL then ppNameCN.Caption:=Qry.FieldValues['contact_person'];
//          ppDiscountCN.Caption:=Qry.FieldValues['discount_cn_percent'];
//        end;
        if Qry.FieldValues['field_contact']<>NULL then begin
          ppGuide.Caption:=Qry.FieldValues['field_contact'];
          if Qry.FieldValues['field_contact_cellular_no']<>NULL then ppGuide.Caption:=ppGuide.Caption+' ('+Qry.FieldValues['field_contact_cellular_no']+')';
        end;
        if Qry.FieldValues['service_resume']<>'' then begin
          ppServicesRp.Caption:='Rp.';
          ppServicesLabel.Caption:='Add Charge';
          ppServices.Caption:=Qry.FieldValues['service_price'];
          if ppRemakLabel.Caption='' then ppRemakLabel.Caption:='NOTES :';
          ppRemark.Lines.Add('Additional Charge :'+LeftStr(Qry.FieldValues['service_resume'],Length(Qry.FieldValues['service_resume'])-1));
        end;
        if Qry.FieldValues['total_addday']>0 then begin
          if ppRemakLabel.Caption='' then ppRemakLabel.Caption:='NOTES :';
           ppRemark.Lines.Add('Additional Day (Rp.'+IToCurr(Qry.FieldValues['total_addday'])+' for '+IntToStr(Qry.FieldValues['add_days'])+' Days)');
          if (ppServicesRp.Caption='') and (ppServicesLabel.Caption='') then begin
            ppServicesRp.Caption:='Rp.';
            ppServicesLabel.Caption:='Add Charge';
            ppServices.Caption:=IToCurr(Qry.FieldValues['total_addday']);
          end else begin
            ppServices.Caption:=IToCurr((Qry.FieldValues['total_addday'])+SToInt(ppServices.Caption));
          end;
        end;
        if Qry.FieldValues['remark']<>NULL then begin
          if ppRemakLabel.Caption='' then ppRemakLabel.Caption:='NOTES : ';
          ppRemark.Lines.Add(Qry.FieldValues['remark']);
        end;
        IntLineCount:=Qry.FieldValues['total_units'];
      end;
      Qry.Close;
      StrQry:='SELECT * FROM wh_user_signature WHERE user_id='+QuotedStr(StrSalesId)+' ORDER BY user_signature_id DESC;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('signature')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          ppSignature.Picture.Assign(JPG);
          ppSignature.Stretch:=True;
          ppSignature.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
      Qry.Close;
      FreeAndNil(StmImage);
      FreeAndNil(JPG); 
      if IntLineCount<=11 then StrLine:='' else StrLine:=',@LineRequest=1';
      StrQry:='EXEC GetCustomerOrderDetailPrint2  '+QuotedStr(Order_Id)+StrLine+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      if IsToFile=7 then ppLogo.Visible:=False
      else ppLogo.Visible:=True;
      if IsToFile=2 then begin
        ppReport.AllowPrintToFile:=True;
      end;
      ppReport.PreviewFormSettings.WindowState:=wsMaximized;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;
}
procedure TAdditionalFeeOrderForm.CariPesananClick(Sender: TObject);
begin
  OrderList:=TOrderList.Create(Self,'Bus','AdditionalFeeOrder','',3); 
end;


procedure TAdditionalFeeOrderForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGridService;
  RefreshCombo;
  EnableInput;
  OrderDate.Text:=Main.Status.Panels.Items[0].Text;
  SalesPerson.Text:=FullName;
end;

procedure TAdditionalFeeOrderForm.GridServiceSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRowService:=ARow;
  IntColService:=ACol;
  if (ARow > MinRowService) and ((IsInputGrid=True) OR (IsPriceEdit=True))  then begin
    Case ACol of
      0:begin
          R := GridService.CellRect(ACol, ARow);
          R.Left := R.Left + GridService.Left;
          R.Right := R.Right + GridService.Left;
          R.Top := R.Top + GridService.Top;
          R.Bottom := R.Bottom + GridService.Top;
          with Service do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            if Trim(GridService.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(GridService.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        end;
      1:if (GridService.Cells[11,ARow]='1') then begin
          R := GridService.CellRect(ACol, ARow);
          R.Left := R.Left + GridService.Left;
          R.Right := R.Right + GridService.Left;
          R.Top := R.Top + GridService.Top;
          R.Bottom := R.Bottom + GridService.Top;
          with Qty do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            if Trim(GridService.Cells[ACol,ARow])<>'' then Text:=GridService.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        end;
      2:if (GridService.Cells[2,ARow]='') or (GridService.Cells[2,ARow]='0') then begin
          R := GridService.CellRect(ACol, ARow);
          R.Left := R.Left + GridService.Left;
          R.Right := R.Right + GridService.Left;
          R.Top := R.Top + GridService.Top;
          R.Bottom := R.Bottom + GridService.Top;
          with JumlahBiaya do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            if Trim(GridService.Cells[ACol,ARow])<>'' then Text:=ToString(GridService.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        end;
    end;
  end;
//  CanSelect := True;
end;

procedure TAdditionalFeeOrderForm.JumlahBiayaExit(Sender: TObject);
begin
  if ToString(JumlahBiaya.Text)<>'' then begin
    JumlahBiaya.Text:=SToCurr(ToString(JumlahBiaya.Text));
    GridService.Cells[2,IntRowService]:= JumlahBiaya.Text;
    Calculate;
  end;
  JumlahBiaya.Visible := False;
  JumlahBiaya.Text:='';
  GridService.SetFocus;
end;

procedure TAdditionalFeeOrderForm.JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    JumlahBiayaExit(nil);
    if GridService.Row=GridService.RowCount-1 then begin
      GridService.RowCount:=GridService.RowCount+1;
      GridService.CellStyle[2,GridService.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    GridService.Row:=GridService.Row+1;
    GridService.Col:=0;
  end;
  if (Key=#27) then begin
    JumlahBiayaExit(nil);
  end;
end;

procedure TAdditionalFeeOrderForm.ServiceChange(Sender: TObject);
begin
  CheckService;
end;

procedure TAdditionalFeeOrderForm.ServiceKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    if (Trim(Service.Text)='') then Simpan.SetFocus
    else begin
      ServiceExit(nil);
      if GridService.Cells[14,IntRowService]='1' then GridService.Col:=1 else GridService.Col:=2; 
    end;
  end;
end;

procedure TAdditionalFeeOrderForm.ServiceExit(Sender: TObject);
begin
  if (Service.ItemIndex>=0) then begin
    GridService.Cells[0,IntRowService]:=Service.Text;
    if (GridService.Row=GridService.RowCount-1) and (GridService.RowCount>MinRowService)  then begin
      GridService.RowCount:=GridService.RowCount+1;
      GridService.CellStyle[2,GridService.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    CheckService;
  end;
  Service.Visible := False;
  Service.Text:='';
  Service.ItemIndex:=-1;
  GridService.SetFocus;
  Calculate;
end;

procedure TAdditionalFeeOrderForm.QtyExit(Sender: TObject);
begin
   if Qty.Text<>'' then begin
    GridService.Cells[1,IntRowService]:=Qty.Text;
    Qty.Text:='';
  end;
  Qty.Visible:=False;
  GridService.SetFocus;
  Calculate;
end;

procedure TAdditionalFeeOrderForm.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
    GridService.Col:=2;
  end;
end;

procedure TAdditionalFeeOrderForm.DiscountPercentEnter(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then DiscountPercent.Text:=ToString(DiscountPercent.Text);
end;

procedure TAdditionalFeeOrderForm.DiscountPercentExit(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then begin
    DiscountPercent.Text:=SToCurr(DiscountPercent.Text);
//    if StrToInt(DiscountPercent.Text)=0 then DiscountPrice.Enabled:=True else DiscountPrice.Enabled:=False;
  end else DiscountPercent.Text:='0';
  Calculate;
  if SToInt(ToString(DiscountPercent.Text))>0 then DiscountPrice.Enabled:=False else DiscountPrice.Enabled:=True;
end;

procedure TAdditionalFeeOrderForm.DiscountPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Remark.SetFocus;
end;

procedure TAdditionalFeeOrderForm.DiscountPriceEnter(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then DiscountPrice.Text:=ToString(DiscountPrice.Text);
end;

procedure TAdditionalFeeOrderForm.DiscountPriceExit(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then begin
    DiscountPrice.Text:=SToCurr(DiscountPrice.Text);
//    if StrToInt(DiscountPrice.Text)=0 then DiscountPercent.Enabled:=True else DiscountPercent.Enabled:=False;
  end else DiscountPrice.Text:='0';
  Calculate;
  if SToInt(DiscountPrice.Text)>0 then DiscountPercent.Enabled:=False else DiscountPercent.Enabled:=True;
end;

procedure TAdditionalFeeOrderForm.DiscountPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPercent.SetFocus;
end;

procedure TAdditionalFeeOrderForm.DiscountCNKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Guide.SetFocus;
end;

procedure TAdditionalFeeOrderForm.GuideCellularKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then GroupService.SetFocus;
end;

procedure TAdditionalFeeOrderForm.GuideKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GuideCellular.SetFocus;
end;

procedure TAdditionalFeeOrderForm.ShowCustomerDetail;
begin
  if (Main.IsFormOpen('Customer')=False) and (Trim(CustomerId.Text)<>'')  then Customer:=TCustomer.Create(Self,Trim(CustomerId.Text),'Bus',False);
end;

procedure TAdditionalFeeOrderForm.GroupBox1DblClick(Sender: TObject);
begin
  ShowCustomerDetail;
end;

procedure TAdditionalFeeOrderForm.Label4DblClick(Sender: TObject);
begin
  if CustomerId.Text<>'' then
    Customer:=TCustomer.Create(nil,CustomerId.Text)
end;

procedure TAdditionalFeeOrderForm.Label5DblClick(Sender: TObject);
begin
  if CustomerId.Text<>'' then
    Customer:=TCustomer.Create(nil,CustomerId.Text)
end;
end.
