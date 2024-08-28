unit OfferingFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ZColorStringGrid, WHUnit,
  ComCtrls, Mask, ppCtrls, ppParameter, ppMemo, ppReport, ppSubRpt,
  ppBands, ppStrtch, jpeg, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppDBPipe, ppDB, DB, ppDBBDE;

type
  TOfferingForm = class(TForm)
    Selesai: TButton;
    GroupHeader: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    LeadDisp: TEdit;
    CustomerDisp: TEdit;
    ContactDisp: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    OfferingId: TEdit;
    GroupDetail: TGroupBox;
    Label6: TLabel;
    GroupOrder: TGroupBox;
    StrGrid: TZColorStringGrid;
    Simpan: TButton;
    CetakUlang: TButton;
    LeadId: TEdit;
    CustomerId: TEdit;
    ContactId: TEdit;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SubTotal: TMemo;
    Discount: TMemo;
    Total: TMemo;
    GroupBatal: TPanel;
    Status: TCheckBox;
    Bersihkan: TButton;
    Product: TComboBox;
    DateStart: TDateTimePicker;
    TimeStart: TMaskEdit;
    DateFinish: TDateTimePicker;
    TimeStandby: TMaskEdit;
    Details: TMemo;
    PickUp: TMemo;
    DiscountDetailPrice: TMemo;
    DiscountDetailPercent: TMemo;
    DetailRemark: TMemo;
    PanelCariLead: TPanel;
    CariLead: TSpeedButton;
    PanelCariCustomer: TPanel;
    CariCustomer: TSpeedButton;
    PanelCariKontak: TPanel;
    CariKontak: TSpeedButton;
    Label8: TLabel;
    PanelDetail: TPanel;
    Remark: TMemo;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    OfferingDate: TEdit;
    Label12: TLabel;
    SalesPerson: TEdit;
    Label13: TLabel;
    ContractId: TEdit;
    PanelCariKontrak: TPanel;
    CariKontrak: TSpeedButton;
    LabelSegment1: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel16: TppLabel;
    ppOfferingId: TppLabel;
    ppDate: TppLabel;
    ppLogo: TppImage;
    ppParameterList1: TppParameterList;
    ppLabelTo: TppLabel;
    ppTo: TppMemo;
    ppAbout: TppLabel;
    ppGreetingHeader: TppMemo;
    ppShape1: TppShape;
    ppLabelTermCondition: TppLabel;
    ppAccount: TppMemo;
    ppTermsConditionDetail: TppMemo;
    ppLabelDate: TppLabel;
    ppLine1: TppLine;
    ppLabelUnit: TppLabel;
    ppLine2: TppLine;
    ppLabelDestination: TppLabel;
    ppLine3: TppLine;
    ppLabelPrice: TppLabel;
    ppDates: TppDBText;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppUnit: TppDBText;
    ppRoute: TppDBText;
    ppPrices: TppDBText;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel4: TppLabel;
    ppLabelRpDiscount: TppLabel;
    ppLine11: TppLine;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppLabelDiscount: TppLabel;
    ppLabel13: TppLabel;
    Units: TMemo;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppLine12: TppLine;
    ppSubTotal: TppLabel;
    ppDiscount: TppLabel;
    ppTotal: TppLabel;
    ppLine13: TppLine;
    ppReprinted: TppLabel;
    PanelDiscount: TPanel;
    DiscountPrice: TEdit;
    Label7: TLabel;
    DiscountPercent: TEdit;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    Service: TComboBox;
    JumlahBiaya: TEdit;
    Qty: TEdit;
    ppLine14: TppLine;
    ppLabelRpService: TppLabel;
    ppServicesPrice: TppLabel;
    ppServices: TppLabel;
    ppRemark: TppMemo;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppCompanySign: TppLabel;
    ppSincerely: TppLabel;
    ppLabelSign: TppLabel;
    ppSalesSign: TppLabel;
    ppRemarkLabel: TppLabel;
    Label20: TLabel;
    Group: TEdit;
    Address: TMemo;
    HeaderRemark: TMemo;
    ppSignature: TppImage;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ProductExit(Sender: TObject);
    procedure DetailsExit(Sender: TObject);
    procedure PickUpExit(Sender: TObject);
    procedure DateStartExit(Sender: TObject);
    procedure TimeStartExit(Sender: TObject);
    procedure DateFinishExit(Sender: TObject);
    procedure TimeStandbyExit(Sender: TObject);
    procedure DiscountDetailPriceExit(Sender: TObject);
    procedure DiscountDetailPercentExit(Sender: TObject);
    procedure DetailRemarkExit(Sender: TObject);
    procedure ProductChange(Sender: TObject);
    procedure ProductKeyPress(Sender: TObject; var Key: Char);
    procedure DetailsKeyPress(Sender: TObject; var Key: Char);
    procedure PickUpKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartKeyPress(Sender: TObject; var Key: Char);
    procedure TimeStartKeyPress(Sender: TObject; var Key: Char);
    procedure DateFinishKeyPress(Sender: TObject; var Key: Char);
    procedure TimeStandbyKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountDetailPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountDetailPercentKeyPress(Sender: TObject;
      var Key: Char);
    procedure DetailRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure CariLeadClick(Sender: TObject);
    procedure CariCustomerClick(Sender: TObject);
    procedure DiscountPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPercentKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPriceEnter(Sender: TObject);
    procedure DiscountPercentEnter(Sender: TObject);
    procedure DiscountPriceExit(Sender: TObject);
    procedure DiscountPercentExit(Sender: TObject);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure UnitsKeyPress(Sender: TObject; var Key: Char);
    procedure UnitsExit(Sender: TObject);
    procedure CariKontakClick(Sender: TObject);
    procedure CariKontrakClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure ServiceChange(Sender: TObject);
    procedure ServiceExit(Sender: TObject);
    procedure ServiceKeyPress(Sender: TObject; var Key: Char);
    procedure JumlahBiayaExit(Sender: TObject);
    procedure JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure GridServiceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DetailsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PickUpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateStartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimeStartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateFinishKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimeStandbyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UnitsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPercentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    IsInputGrid,IsInput:Boolean;
    OffrId,FormRequest:String;
    Revision,MinRowService,IntRowService,IntColService,DiscntPercent,DiscntPrice:Integer;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure RefreshProduct(Product_Id:String='');
    procedure RefreshService;
    procedure LoadData;
    procedure RefreshGrid;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure CheckProduct;
    procedure CheckService;
    procedure PreparePrint;
    procedure ShowLeadCustomer;
  public
    { Public declarations }
    procedure SetCustomerId(Customer_Id:String);
    procedure SetLeadId(Lead_Id:String);
    procedure SetContactId(Contact_Id:String);
    procedure SetContractId(Contract_Id:String);
    procedure RePrint(Offering_Id:String);
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Offering_Id:String='';Is_Input:Boolean=True;Form_Request:String='');Overload;
  end;

var
  OfferingForm: TOfferingForm;

implementation

uses MainU, ADODB, DateUtils, Math, LeadListU, CustomerListU,
  AuthorizedFormU, RePrintFormU, OfferingListU, CustomerU, ContractListU,
  OrderFormU, StrUtils, LeadU;

{$R *.dfm}

{
constructor TOfferingForm.Create(AOwner:TComponent);
begin
  CompId:=2;
  IsInputGrid:=True;
  inherited Create(AOwner);
end;
}
constructor TOfferingForm.Create(AOwner:TComponent;Offering_Id:String='';Is_Input:Boolean=True;Form_Request:String='');
begin
  CompId:=2;
  OffrId:=Offering_Id;
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  IsInputGrid:=Is_Input;
  Main.WriteLog('Form Open: OrderForm='+Offering_Id+','+BoolToStr(Is_Input)+','+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TOfferingForm.Init;
begin
  OfferingId.Text:='';
  LeadId.Text:='';
  LeadDisp.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  ContactId.Text:='';
  ContactDisp.Text:='';
  Group.Text:='';
  Address.Text:='';
  HeaderRemark.Text:='';
  ContractId.Text:='';
  DiscountPrice.Text:='0';
  DiscountPercent.Text:='0';
  Remark.Text:='';
  SubTotal.Text:='';
  Discount.Text:='';
  Total.Text:='';
  Details.Text:='';
  PickUp.Text:='';
  DiscntPercent:=0;
  DiscntPrice:=0;
  DateStart.Date:=IncDay(Now(),-1);
  TimeStart.Text:='';
  TimeStandby.Text:='';
  DateFinish.Date:=IncDay(Now(),-1);
  Units.Text:='';
  DiscountDetailPrice.Text:='';
  DiscountDetailPercent.Text:='';
  DetailRemark.Text:='';
  PanelCariLead.Enabled:=True;
  PanelCariKontak.Enabled:=True;
  PanelCariCustomer.Enabled:=True;
  PanelCariKontrak.Enabled:=True;
  PanelDiscount.Enabled:=True;
  Status.Checked:=False;
  TimeStart.Visible:=True;
  TimeStart.Height:=36;
  TimeStart.Visible:=False;
  TimeStandby.Visible:=True;
  TimeStandby.Height:=36;
  TimeStandby.Visible:=False;
  DiscountPrice.Enabled:=True;
  DiscountPercent.Enabled:=True;
  if OffrId<>'' then Status.Visible:=True
  else Status.Visible:=False;
  revision:=0;
  Bersihkan.Enabled:=True;
end;

procedure TOfferingForm.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=17;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=170;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=55;
  StrGrid.ColWidths[4]:=35;
  StrGrid.ColWidths[5]:=55;
  StrGrid.ColWidths[6]:=0;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=30;
  StrGrid.ColWidths[9]:=70;
  StrGrid.ColWidths[10]:=25;
  StrGrid.ColWidths[11]:=140;
  for IntCount:=12 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
  //col 12=price_weekday
  //col 13=price_weekend
  //col 14=total
  //col 15=contract_discount_price
  //col 16=lead_order_detail_id
  //col 17=product_price_id
  //col 18=package_day
  //col 19=price_overday
  //col 20=total_addDays
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.RowHeights[0]:=18;
  StrGrid.RowHeights[1]:=18;
  StrGrid.Cells[0,0]:='Product';
  StrGrid.Cells[1,0]:='Acara Perjalanan';
  StrGrid.Cells[2,0]:='Lokasi Jemput';
  StrGrid.Cells[3,0]:='Berangkat';
  StrGrid.Cells[5,0]:='Tgl Selesai';
  StrGrid.Cells[6,0]:='Jam Standby';
  StrGrid.Cells[7,0]:='Harga';
  StrGrid.Cells[8,0]:='Unit';
  StrGrid.Cells[9,0]:='Discount';
  StrGrid.Cells[11,0]:='Keterangan';
  StrGrid.Cells[3,1]:='Tanggal';
  StrGrid.Cells[4,1]:='Jam';
  StrGrid.Cells[9,1]:='Rp';
  StrGrid.Cells[10,1]:='%';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1  do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].WordWrap:=False;
  end;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[9,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[10,2].HorizontalAlignment:=taRightJustify;
end;

procedure TOfferingForm.InitGridService;
var IntCount,IntCount2:Integer;
begin
  MinRowService:=0;
  GridService.ColCount:=13;
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

procedure TOfferingForm.RefreshCombo;
begin
  RefreshProduct;
  RefreshService;
end;

procedure TOfferingForm.RefreshService;
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

procedure TOfferingForm.RefreshProduct(Product_Id:String='');
var Qry:TADOQuery;
    StrQry,StrProductId,StrCompanyId,StrLocationId:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrCompanyId:=CompanyId;
    StrLocationId:=',@LocationId='+LocationId; 
    If Product_Id<>'' then StrProductId:=',@ProductId='+QuotedStr(Product_Id) else StrProductId:='';
    StrQry:='EXEC GetProductPriceList '+StrCompanyId+StrLocationId+',@ContractId='+QuotedStr(ContractId.Text)+StrProductId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(ProductArr,Qry.RecordCount+1);
    for IntCount2:=0 to 8 do ProductArr[0][IntCount2]:=' ';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['product_price_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'];
      ProductArr[IntCount][2]:=Qry.FieldValues['price_weekday'];
      ProductArr[IntCount][3]:=Qry.FieldValues['price_weekend'];
      ProductArr[IntCount][4]:=Qry.FieldValues['price_overtime'];
      ProductArr[IntCount][5]:=Qry.FieldValues['seat'];
      ProductArr[IntCount][6]:=Qry.FieldValues['full_day'];
      if Qry.FieldValues['detail_discount_price']<>NULL then ProductArr[IntCount][7]:=Qry.FieldValues['detail_discount_price'];
      if Qry.FieldValues['detail_discount_percent']<>NULL then ProductArr[IntCount][8]:=Qry.FieldValues['detail_discount_percent'];
      ProductArr[IntCount][9]:=Qry.FieldValues['package_day'];
      ProductArr[IntCount][10]:=Qry.FieldValues['price_overday'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Product.Items.Clear;
  for IntCount:=0 to Length(ProductArr)-1 do
    Product.Items.Add(ProductArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TOfferingForm.CheckProduct;
var IntCount:Integer;
begin
  if Trim(ProductArr[Product.ItemIndex][1])<>'' then begin
    StrGrid.Cells[7,IntRow]:='';
    StrGrid.Cells[8,IntRow]:='1';
    if ProductArr[Product.ItemIndex][7]<>'' then begin
      StrGrid.Cells[9,IntRow]:=ProductArr[Product.ItemIndex][7];
      StrGrid.Cells[15,IntRow]:='1';
    end else begin
      StrGrid.Cells[9,IntRow]:='0';
      StrGrid.Cells[15,IntRow]:='';
    end;
    if ProductArr[Product.ItemIndex][8]<>'' then begin
      StrGrid.Cells[10,IntRow]:=ProductArr[Product.ItemIndex][8];
      StrGrid.Cells[15,IntRow]:='1';
    end else begin
      StrGrid.Cells[10,IntRow]:='0';
      StrGrid.Cells[15,IntRow]:='';
    end;
    StrGrid.Cells[12,IntRow]:=ProductArr[Product.ItemIndex][2];
    StrGrid.Cells[13,IntRow]:=ProductArr[Product.ItemIndex][3];
    StrGrid.Cells[14,IntRow]:='0';
    StrGrid.Cells[17,IntRow]:=ProductArr[Product.ItemIndex][0];
    StrGrid.Cells[18,IntRow]:=ProductArr[Product.ItemIndex][9];
    StrGrid.Cells[19,IntRow]:=ProductArr[Product.ItemIndex][10];
    StrGrid.CellStyle[7,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntRow].HorizontalAlignment:=taRightJustify;
  end else begin
    for IntCount:=0 to StrGrid.ColCount-1  do StrGrid.Cells[IntCount,IntRow]:='';
  end;
end;

procedure TOfferingForm.CheckService;
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

procedure TOfferingForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLeadOrderDetail '+QuotedStr(OffrId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      OfferingId.Text:=Qry.FieldValues['lead_order_id'];
      if Qry.FieldValues['customer_id']<>NULL then begin
        CustomerId.Text:=Qry.FieldValues['customer_id'];
        OfferingDate.Text:=Qry.FieldValues['dates'];
        revision:=Qry.FieldValues['rev']+1;
        if Qry.FieldValues['customer_name']<>NULL then CustomerDisp.Text:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
        if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      end;
      if Qry.FieldValues['lead_id']<>NULL then begin
        LeadId.Text:=Qry.FieldValues['lead_id'];
        if Qry.FieldValues['lead_name']<>NULL then LeadDisp.Text:=Qry.FieldValues['lead_name'];
        if Qry.FieldValues['lead_address']<>NULL then Address.Text:=Qry.FieldValues['lead_address'];
        if Qry.FieldValues['lead_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['lead_remark'];
        if Qry.FieldValues['lead_contact']<>NULL then ContactDisp.Text:=Qry.FieldValues['lead_contact'];
      end;
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      if Qry.FieldValues['cust_contract_id']<>NULL then ContractId.Text:=Qry.FieldValues['cust_contract_id'];
      SalesPerson.Text:=Qry.FieldValues['sales_name'];
      if Qry.FieldValues['discount_price']>0 then begin
        DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']);
        DiscntPrice:=Qry.FieldValues['discount_price'];
      end;
      if Qry.FieldValues['discount_percent']>0 then begin
        DiscountPercent.Text:=Qry.FieldValues['discount_percent'];
        DiscntPercent:=Qry.FieldValues['discount_percent'];
      end;
      if (Qry.FieldValues['contract_discount_price']<>NULL) OR (Qry.FieldValues['contract_discount_percent']<>NULL) then PanelDiscount.Enabled:=False;
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOfferingForm.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLeadOrderDetailList '+QuotedStr(OffrId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['product_price_name']<> NULL then begin
        StrGrid.RowCount:=IntCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
        if Qry.FieldValues['pickup_point']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['pickup_point'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['from_time'];
        StrGrid.Cells[5,IntCount]:=Qry.FieldValues['to_dates'];
        if Qry.FieldValues['standby_time']<>NULL then StrGrid.Cells[6,IntCount]:=Qry.FieldValues['standby_time'];
        StrGrid.Cells[8,IntCount]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[9,IntCount]:=IntToStr(Qry.FieldValues['discount_price']);
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[10,IntCount]:=Qry.FieldValues['discount_percent'];
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[11,IntCount]:=Qry.FieldValues['remark'];
        StrGrid.Cells[12,IntCount]:=Qry.FieldValues['price_weekday'];
        StrGrid.Cells[13,IntCount]:=Qry.FieldValues['price_weekend'];
        StrGrid.Cells[14,IntCount]:=Qry.FieldValues['total'];
        if (Qry.FieldValues['contract_discount_price']<>NULL) or (Qry.FieldValues['contract_discount_percent']<>NULL) then StrGrid.Cells[15,IntCount]:='1';
        StrGrid.Cells[16,IntCount]:=Qry.FieldValues['lead_order_detail_id'];
        StrGrid.Cells[17,IntCount]:=Qry.FieldValues['product_price_id'];
        StrGrid.Cells[18,IntCount]:=Qry.FieldValues['package_day'];
        StrGrid.Cells[19,IntCount]:=Qry.FieldValues['price_overday'];
        StrGrid.Cells[20,IntCount]:=Qry.FieldValues['total_addday'];
        StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[9,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[10,IntCount].HorizontalAlignment:=taRightJustify;
      end;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetLeadOrderServiceList '+QuotedStr(OffrId)+';';
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
      if Qry.FieldValues['amount']<>0 then GridService.Cells[2,IntCount]:=Qry.FieldValues['amount']
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

procedure TOfferingForm.Calculate;
var IntCount,IntTotal,IntTotalAll,IntPrice,IntDiscPrice,IntDiscPerc,IntMonths,IntDates,IntYears,IntAddDays,IntAmountAddDays:Integer;
    IntDays,IntTotalService,Intservice,IntMultiply,IntUnit,IntFromDate,IntToDate,IntFromYears,IntToYears,IntFromMonth,IntToMonth:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IsWeekday,IsWeekend:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    IntTotalAll:=0;
    IntMultiply:=0;
    for IntCount:=2 to StrGrid.RowCount-1 do begin
      IsWeekday:=False;
      IsWeekend:=False;
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[12,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'')
      and (StrGrid.Cells[3,IntCount]<>'') and (StrGrid.Cells[5,IntCount]<>'') and (StrGrid.Cells[8,IntCount]<>'') then begin
        IntTotal:=0;
        IntDays:=0;
        IntAddDays:=0;
        if StrGrid.Cells[8,IntCount]='' then StrGrid.Cells[8,IntCount]:='1';
        if StrGrid.Cells[9,IntCount]='' then StrGrid.Cells[9,IntCount]:='0';
        if StrGrid.Cells[10,IntCount]='' then StrGrid.Cells[10,IntCount]:='0';
        IntUnit:=SToInt(StrGrid.Cells[8,IntCount]);
        
        IntFromYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrGrid.Cells[3,IntCount])));
        IntToYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrGrid.Cells[5,IntCount])));
        for IntYears:=IntFromYears to IntToYears  do begin
          if IntYears<IntToYears then begin
            if IntYears>IntFromYears then begin
              IntFromMonth:=1;
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[5,IntCount])));
            end else begin
              IntFromMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[3,IntCount])));
              IntToMonth:=12;
            end;
          end else begin
            if IntYears>IntFromYears then begin
              IntFromMonth:=1;
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[5,IntCount])));
            end else begin
              IntFromMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[3,IntCount])));
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[5,IntCount])));
            end;
          end;
          for IntMonths:=IntFromMonth to IntToMonth do begin
            if (IntMonths<IntToMonth) OR ((IntMonths=IntToMonth) AND (IntYears<IntToYears)) then begin
              if IntMonths>IntFromMonth then begin
                IntFromDate:=1;
                IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
              end else begin
                IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[3,IntCount])));
                IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
              end;
            end else begin
              if (IntMonths>IntFromMonth) OR ((IntMonths=IntToMonth) AND (IntFromYears<IntYears)) then begin
                IntFromDate:=1;
                IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[5,IntCount])))
              end else begin
                IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[3,IntCount])));
                IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[5,IntCount])));
              end;
            end;
            for IntDates:=IntFromDate to IntToDate do begin
              if StrGrid.Cells[14,IntCount]<>StrGrid.Cells[13,IntCount] then begin
                StrQry:='SELECT dbo.IsWeekend('+QuotedStr(IntToStr(IntYears)+'-'+IntToStr(IntMonths)+'-'+IntToStr(IntDates))+') AS result;';
                Qry.SQL.Clear;
                Qry.SQL.Add(StrQry);
                Qry.Open;
                if Qry.RecordCount>0 then if Qry.FieldValues['result']=1 then begin
                  IntPrice:=SToInt(StrGrid.Cells[13,IntCount]);
                  IsWeekend:=True;
                end else begin
                  IntPrice:=SToInt(StrGrid.Cells[12,IntCount]);
                  IsWeekday:=True;
                end;
                Qry.Close;
              end else begin
                IntPrice:=SToInt(StrGrid.Cells[13,IntCount]);
              end;
              if StrGrid.Cells[18,IntCount]='0' then begin
                IntTotal:=IntTotal+(IntPrice*IntUnit);
                Inc(IntDays);
              end else begin
                if IntDays<StrToInt(StrGrid.Cells[18,IntCount]) then begin
                  Inc(IntDays);
                end else begin
                  Inc(IntAddDays)
                end;
                IntTotal:=IntPrice*IntUnit*SToInt(StrGrid.Cells[18,IntCount]);
              end;
            end;
          end
        end;
        IntMultiply:=IntMultiply+(IntDays*IntUnit);
        if StrGrid.Cells[12,IntCount]<>StrGrid.Cells[13,IntCount] then begin
          if IsWeekday=True then StrGrid.Cells[7,IntCount]:=SToCurr(StrGrid.Cells[12,IntCount]);
          if IsWeekend=True then if not(IsWeekday) then StrGrid.Cells[7,IntCount]:= SToCurr(StrGrid.Cells[13,IntCount])
          else StrGrid.Cells[7,IntCount]:=SToCurr(StrGrid.Cells[12,IntCount])+Chr(13)+'    '+SToCurr(StrGrid.Cells[13,IntCount])+'  ';
        end else begin
          if StrGrid.Cells[18,IntCount]='0' then begin
            StrGrid.Cells[7,IntCount]:=SToCurr(StrGrid.Cells[12,IntCount]);
          end else begin
            if IntAddDays<1 then begin
              StrGrid.Cells[7,IntCount]:='(P) '+IToCurr(SToInt(StrGrid.Cells[12,IntCount])*SToInt(StrGrid.Cells[18,IntCount]));
            end else begin
              StrGrid.Cells[7,IntCount]:='(P) '+IToCurr(SToInt(StrGrid.Cells[12,IntCount])*SToInt(StrGrid.Cells[18,IntCount]))+Chr(13)+' (A) '+SToCurr(StrGrid.Cells[19,IntCount]);
            end;
          end;
        end;
        if IntAddDays>0 then begin
          StrGrid.Cells[20,IntCount]:=IntToStr(IntAddDays*SToInt(StrGrid.Cells[19,IntCount]));
        end else begin
          StrGrid.Cells[20,IntCount]:='0';
        end;
        IntDiscPrice:=SToInt(StrGrid.Cells[9,IntCount]);
        IntDiscPerc:=SToInt(StrGrid.Cells[10,IntCount]);
        IntTotal:=IntTotal-IntDiscPrice-Round((IntTotal*IntDiscPerc)/100) ;
        IntTotalAll:=IntTotalAll+IntTotal;
        StrGrid.Cells[14,IntCount]:=IntToStr(IntTotal);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    IntTotalService:=0;
    for IntCount:=MinRowService+1 to GridService.RowCount-1 do begin
      if (Trim(GridService.Cells[0,IntCount])<>'') and (Trim(GridService.Cells[2,IntCount])<>'') and (GridService.Cells[7,IntCount]='1')then begin
        if (GridService.Cells[10,IntCount]='1') and (IntDays>0)  then GridService.Cells[2,IntCount]:=IToCurr(IntMultiply*SToInt(GridService.Cells[4,IntCount]));
        if (GridService.Cells[1,IntCount]<>'') and (GridService.Cells[1,IntCount]<>'0') then
          Intservice:=SToInt(GridService.Cells[1,IntCount])*SToInt(GridService.Cells[2,IntCount])
        else if (GridService.Cells[2,IntCount]<>'1') then
          Intservice:=SToInt(GridService.Cells[2,IntCount]);
        IntTotalService:=IntTotalService+IntService;
      end;
    end;
    IntAmountAddDays:=0;
    for IntCount:=2 to StrGrid.RowCount-1 do begin
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[12,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'')
      and (StrGrid.Cells[3,IntCount]<>'') and (StrGrid.Cells[5,IntCount]<>'') and (StrGrid.Cells[8,IntCount]<>'') 
      and (StrGrid.Cells[20,IntCount]<>'0') then begin
        IntAmountAddDays:=IntAmountAddDays+(SToInt(StrGrid.Cells[20,IntCount])*SToInt(StrGrid.Cells[8,IntCount] ));
      end;
    end;
    SubTotal.Text:=IToCurr(IntTotalAll);
    IntDiscPrice:=SToInt(DiscountPrice.Text);
    IntDiscPerc:=SToInt(DiscountPercent.Text);
    Discount.Text:=IToCurr(IntDiscPrice+(IntTotalAll*(IntDiscPerc/100)));
    Total.Text:=IToCurr((IntTotalAll-IntDiscPrice-(IntTotalAll*(IntDiscPerc/100)))+IntTotalService+IntAmountAddDays);
  end;
  Main.M_Normal;
end;

procedure TOfferingForm.SetCustomerId(Customer_Id:String);
var Qry:TADOQuery;
    StrQry,StrContactId:String;
    IntCount:Integer;
    IsContactSingle:Boolean;
begin
  PanelCariLead.Enabled:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerDetail '+Customer_Id+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      if Qry.FieldValues['title']<>NULL then CustomerDisp.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else CustomerDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+IntToStr(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
    end;
    Qry.Close;
    IsContactSingle:=False;
    StrQry:='EXEC GetContactPersonList '+QuotedStr(Customer_Id)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount=1 then while not(Qry.Eof) do begin
      IsContactSingle:=True;
      StrContactId:=Qry.FieldValues['contact_person_id'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  if IsContactSingle=True then SetContactId(StrContactId);
end;

procedure TOfferingForm.SetLeadId(Lead_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    IsContactSingle:Boolean;
begin
  PanelCariCustomer.Enabled:=False;
  PanelCariKontak.Enabled:=False;
  PanelCariKontrak.Enabled:=False;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLeadDetail '+Lead_Id+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      LeadId.Text:=Qry.FieldValues['lead_id'];
      if Qry.FieldValues['title']<>NULL then LeadDisp.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else LeadDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+Qry.FieldValues['zip']
      else Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['remark'];
      if Qry.FieldValues['contact_title']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_title']+' '+Qry.FieldValues['contact_person']
      else if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOfferingForm.SetContactId(Contact_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetContactPersonDetail '+Contact_Id+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ContactId.Text:=Qry.FieldValues['contact_person_id'];
      if Qry.FieldValues['title']<>NULL then ContactDisp.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else ContactDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+Qry.FieldValues['zip']
      else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOfferingForm.SetContractId(Contract_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetContractDetail '+QuotedStr(Contract_Id)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ContractId.Text:=Qry.FieldValues['cust_contract_id'];
      DiscountPrice.Text:=SToCurr(Qry.FieldValues['discount_price']);
      DiscountPercent.Text:=Qry.FieldValues['discount_percent'];
      Qry.Next;
    end;
    Qry.Close;
    PanelDiscount.Enabled:=False;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  RefreshProduct;
end;

procedure TOfferingForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOfferingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TOfferingForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) then begin
    if (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        0:with Product do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+70;
            Height := (R.Bottom + 1) - R.Top+10;
            RefreshProduct(StrGrid.Cells[17,ARow]);
            ItemIndex:=Items.IndexOf(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        1:with Details do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        2:with PickUp do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        3:with DateStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        4:with TimeStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        5:with DateFinish do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
{        6:with TimeStandby do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
}        8:with Units do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        9:if StrGrid.Cells[15,ARow]<>'1' then
            if (StrGrid.Cells[10,ARow]='0') or (StrGrid.Cells[10,ARow]='') then with DiscountDetailPrice do begin
              Left:=R.Left + 1;
              Top := R.Top + 1;
              Width := (R.Right + 1) - R.Left;
              Height := (R.Bottom + 1) - R.Top;
              Text:=ToString(StrGrid.Cells[ACol,ARow]);
              Visible:= True;
              BringToFront;
              SetFocus;
            end;
        10:if StrGrid.Cells[15,ARow]<>'1' then
             if (StrGrid.Cells[9,ARow]='0') or (StrGrid.Cells[9,ARow]='') then with DiscountDetailPercent do begin
               Left:=R.Left + 1;
               Top := R.Top + 1;
               Width := (R.Right + 1) - R.Left;
               Height := (R.Bottom + 1) - R.Top;
               Text:=StrGrid.Cells[ACol,ARow];
               Visible:= True;
               BringToFront;
               SetFocus;
             end;
        11:with DetailRemark do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;
  end;
end;

procedure TOfferingForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrLeadId,StrCustomerId,StrContactId,StrContractId,StrDiscountPrice,StrDiscountPercent,StrRemark:String;
    StrProductPriceId,StrDestination,StrPickup,StrDateStart,StrDateFinish,StrTimeStart,StrTimeStandby,StrGroup:String;
    StrPriceWeekday,StrPriceWeekend,StrTotal,StrStatus,StrUnits,StrRevision,StrPriceOverday:String;
    StrTransId,StrEMsg,StrCompanyId,StrLocationId,StrQuantity,StrAmount,StrTotalAddDay:String;
    IntCount,DiscPercent,DiscPrice:Integer;
    IsOk,IsAuth:Boolean;
begin
  IsOk:=False;
  for IntCount:=2 to StrGrid.RowCount-1 do
    if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[3,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'')
    and (StrGrid.Cells[5,IntCount]<>'') and (StrGrid.Cells[8,IntCount]<>'') and (StrGrid.Cells[12,IntCount]<>'')
    and (StrGrid.Cells[13,IntCount]<>'') then IsOk:=True;
  if ((LeadId.Text<>'') or (CustomerId.Text<>'') ) and ((Total.Text<>'') and (Total.Text<>'0')) and (IsOk) then begin
    IsAuth:=True;
    AuthorizedForm.FormId:=IntToStr(TreeTag);
    DiscPrice:=0;
    DiscPercent:=0;
    for IntCount:=2 to StrGrid.RowCount-1 do
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[3,IntCount]<>'') and (StrGrid.Cells[5,IntCount]<>'')
      and (StrGrid.Cells[11,IntCount]<>'') and (StrGrid.Cells[12,IntCount]<>'') and (StrGrid.Cells[15,IntCount]<>'1') then begin
        if Trim(StrGrid.Cells[9,IntCount])<>'' then if DiscPrice<StrToInt(ToString(StrGrid.Cells[9,IntCount])) then DiscPrice:=StrToInt(ToString(StrGrid.Cells[9,IntCount])) ;
        if Trim(StrGrid.Cells[10,IntCount])<>'' then if DiscPercent<StrToInt(StrGrid.Cells[10,IntCount]) then  DiscPercent:=StrToInt(StrGrid.Cells[10,IntCount]);
      end;
    if PanelDiscount.Enabled=True then begin
      if DiscountPrice.Text<>'' then if DiscPrice<StrToInt(ToString(DiscountPrice.Text)) then DiscPrice:=StrToInt(ToString(DiscountPrice.Text));
      if DiscountPercent.Text<>'' then if DiscPercent<StrToInt(DiscountPercent.Text) then  DiscPercent:=StrToInt(DiscountPercent.Text);
    end;
    if (DiscntPercent<DiscPercent) or (DiscntPrice<DiscPrice) then begin
      if (DiscPercent>MaxDiscountPercent) or (DiscPrice>MaxDiscountPrice) then begin
        AuthorizedForm.FormId:=IntToStr(TreeTag);
        if DiscPrice>MaxDiscountPrice then begin
          AuthorizedForm.StrMessage:=' Otorisasi Pemberian Diskon Sebesar :'+StrDiscountPercent;
          AuthorizedForm.CheckValues:='DISC-PRICE';
          AuthorizedForm.Values:=DiscPrice;
          if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        end;
        if DiscPercent>MaxDiscountPercent then begin
          AuthorizedForm.StrMessage:=' Otorisasi Pemberian Diskon Sebesar :'+StrDiscountPercent;
          AuthorizedForm.CheckValues:='DISC-PERCENT';
          AuthorizedForm.Values:=DiscPercent;
          if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        end;
      end;
      Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
    end;
    if IsAuth then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.M_Busy;
      Main.WriteLog('Form Save:OrderForm',1);
      if Main.OpenDb then begin
        DisableInput;
        Main.TransStart;
        IsOk:=True;
        StrCompanyId:=CompanyId;
        StrLocationId:=LocationId;
        if LeadId.Text<>'' then StrLeadId:=QuotedStr(LeadId.Text) else StrLeadId:='NULL';
        if CustomerId.Text<>'' then StrCustomerId:=QuotedStr(CustomerId.Text) else StrCustomerId:='NULL';
        if ContactId.Text<>'' then StrContactId:=QuotedStr(ContactId.Text) else StrContactId:='NULL';
        if ContractId.Text<>'' then StrContractId:=QuotedStr(ContractId.Text) else StrContractId:='NULL';
        if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
        if Trim(Group.Text)<>'' then StrGroup:=QuotedStr(Trim(Group.Text)) else StrGroup:='NULL';  
        if DiscountPrice.Text<>'' then StrDiscountPrice:=ToString(DiscountPrice.Text) else StrDiscountPrice:='NULL';
        if DiscountPercent.Text<>'' then StrDiscountPercent:=DiscountPercent.Text else StrDiscountPercent:='NULL';
        if Status.Visible then if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';
        StrRevision:=IntToStr(Revision);
        StrTotal:=ToString(Total.Text);
        if (OfferingId.Text<>'')  then begin
          StrTransId:=OffrId;
          StrQry:='UPDATE wh_lead_order SET lead_id='+StrLeadId+',customer_id='+StrCustomerId+',contact_person_id='+StrContactId+
                ',cust_contract_id='+StrContractId+',group_name='+StrGroup+',discount_price='+StrDiscountPrice+
                ',discount_percent='+StrDiscountPercent+',total='+StrTotal+',remark='+StrRemark+
                ',status='+StrStatus+',rev='+StrRevision+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE lead_order_id='+QuotedStr(StrTransId)+';';
          if StrStatus='1' then begin
            StrQry:=StrQry+' UPDATE wh_lead_order_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (lead_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
            StrQry:=StrQry+' UPDATE wh_lead_order_service_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (lead_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end;
        end else begin
          StrQry:='SELECT RIGHT(MAX(lead_order_id),4) AS max_id FROM wh_lead_order '+
                  'WHERE lead_order_id  LIKE '+QuotedStr('PTRANS/'+FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                  '.'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+'/MKT/OL-'+'____')+';';
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
          StrTransId:='PTRANS/'+FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                      '.'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+'/MKT/OL-'+StrTransId;
          StrQry:='INSERT INTO wh_lead_order (lead_order_id,company_id,location_id,lead_id,customer_id,contact_person_id'+
                  ',cust_contract_id,group_name,sales_id,total,discount_price,discount_percent,remark,update_user)'+
                  ' VALUES '+
                  '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrLeadId+','+StrCustomerId+
                  ','+StrContactId+','+StrContractId+','+StrGroup+','+QuotedStr(User)+','+StrTotal+','+StrDiscountPrice+
                  ','+StrDiscountPercent+','+StrRemark+','+QuotedStr(User)+');';
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
        if StrStatus='1' then begin
          for IntCount:=2 to StrGrid.RowCount-1 do
            if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[3,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'')
            and (StrGrid.Cells[5,IntCount]<>'') and (StrGrid.Cells[8,IntCount]<>'') and (StrGrid.Cells[12,IntCount]<>'')
            and (StrGrid.Cells[13,IntCount]<>'') then begin
              StrProductPriceId:=QuotedStr(StrGrid.Cells[17,IntCount]);
              if Trim(StrGrid.Cells[1,IntCount])<>'' then StrDestination:=QuotedStr(StrGrid.Cells[1,IntCount]) else StrDestination:='NULL';
              if Trim(StrGrid.Cells[2,IntCount])<>'' then StrPickup:=QuotedStr(Trim(StrGrid.Cells[2,IntCount])) else StrPickup:='NULL';
              if Trim(StrGrid.Cells[3,IntCount])<>'' then StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[3,IntCount])));
              if Trim(StrGrid.Cells[4,IntCount])<>'' then StrTimeStart:=QuotedStr(StrGrid.Cells[4,IntCount]);
              if Trim(StrGrid.Cells[5,IntCount])<>'' then StrDateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[5,IntCount])));
//              if Trim(StrGrid.Cells[6,IntCount])<>'' then StrTimeStandby:=QuotedStr(StrGrid.Cells[6,IntCount]);
              StrTimeStandby:='NULL';
              StrUnits:=StrGrid.Cells[8,IntCount];
              if Trim(StrGrid.Cells[9,IntCount])<>'' then StrDiscountPrice:=QuotedStr(ToString(StrGrid.Cells[9,IntCount])) else StrDiscountPrice:='0';
              if Trim(StrGrid.Cells[10,IntCount])<>'' then StrDiscountPercent:=QuotedStr(StrGrid.Cells[10,IntCount]) else StrDiscountPercent:='0';
              if Trim(StrGrid.Cells[11,IntCount])<>'' then StrRemark:=QuotedStr(StrGrid.Cells[11,IntCount]) else StrRemark:='NULL';
              StrPriceWeekday:=QuotedStr(ToString(StrGrid.Cells[12,IntCount]));
              StrPriceWeekend:=QuotedStr(ToString(StrGrid.Cells[13,IntCount]));
              StrTotal:=QuotedStr(ToString(StrGrid.Cells[14,IntCount]));
              if StrGrid.Cells[20,IntCount]<>'0' then StrTotalAddDay:=StrGrid.Cells[20,IntCount] else StrTotalAddDay:='0';
              if StrGrid.Cells[19,IntCount]<>'0' then StrPriceOverday:=StrGrid.Cells[19,IntCount] else StrPriceOverday:='0';
              StrQry:='INSERT INTO wh_lead_order_detail (lead_order_id,product_price_id,depart_location_id,from_date'+
                      ',to_date,from_time,route,pickup_point,standby_time,price_weekday,price_weekend,price_overday'+
                      ',units,total,total_addday,discount_price'+
                      ',discount_percent,remark,update_user) VALUES '+
                      '('+QuotedStr(StrTransId)+','+StrProductPriceId+','+StrLocationId+','+StrDateStart+','+StrDateFinish+
                      ','+StrTimeStart+','+StrDestination+','+StrPickup+','+StrTimeStandby+','+StrPriceWeekday+
                      ','+StrPriceWeekend+','+StrPriceOverday+','+StrUnits+','+StrTotal+','+StrTotalAddDay+','+StrDiscountPrice+','+StrDiscountPercent+','+StrRemark+','+QuotedStr(User)+');';
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
              end;
            end;
{
         if StrQry<>'' then begin
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
}
        StrQry:='';
        if StrStatus='1' then begin
          for IntCount:=1 to GridService.RowCount-1 do
            if (GridService.Cells[0,IntCount]<>'') and (GridService.Cells[2,IntCount]<>'') then begin
              StrProductPriceId:=QuotedStr(GridService.Cells[5,IntCount]);
              if Trim(GridService.Cells[1,IntCount])<>'' then StrQuantity:=GridService.Cells[1,IntCount] else StrQuantity:='NULL';
              if (Trim(GridService.Cells[2,IntCount])<>'1') then StrAmount:=ToString(GridService.Cells[2,IntCount]) else StrAmount:='0';
              StrQry:='INSERT INTO wh_lead_order_service_detail (lead_order_id,transaction_type_id,quantity,amount'+
                      ',update_user) VALUES '+
                      '('+QuotedStr(StrTransId)+','+StrProductPriceId+','+StrQuantity+','+StrAmount+','+QuotedStr(User)+');';
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
            end;
{
          if StrQry<>'' then begin
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
}
        end;
        if (IsOk) then begin
          Main.TransCommit;
          OfferingId.Text:=StrTransId;
          if StrStatus='1' then begin
            if MessageBox(0,PChar('Data Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Surat Penawaran',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
                RePrint(StrTransId);
              end;
          end else
            MessageBox(0,'Data Berhasil Disimpan','Surat Penawaran',MB_OK or MB_ICONINFORMATION)
        end else begin
          Main.TransRollback;
          Main.WriteLog('Form Save: Fail='+StrEMsg,1);
          MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Surat Penawaran',MB_OK or MB_ICONERROR);
          EnableInput;
        end;
      end;
      FreeAndNil(Qry)
    end else
      MessageBox(0,PChar('Tidak dapat mengotorisasi diskon'+Chr(13)+Chr(13)+'Silahkan Coba Hubungi Atasan Anda'),'Surat Penawaran',MB_OK or MB_ICONWARNING);
  end else
    MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Surat Penawaran',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TOfferingForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
      ppCompanySign.Caption:=Qry.FieldValues['company_name'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TOfferingForm.RePrint(Offering_Id:String);
const Bulan:array [1..12] of String=('January','February','March','April','May','June','July','August','September','October','November','December');
var StrQry,StrSalesId:String;
    Qry,Qry2:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent:Int64;
    RemarkHeight:Double;
    JPG:TJPEGImage;
    StmImage:TMemoryStream;
    IntCount:Integer;
begin
  PreparePrint;
  IsToFile:=Main.MyMessageDlg('Mau dicetak ke?',mtInformation,[mbYes,mbNo,mbCancel],['Kertas','Kop surat','e-mail'],'Tujuan');
//  IsToFile:=MessageBox(0,('Cetak ke PDF ?'),'Pencetakan Surat Penawaran',MB_YESNO or MB_ICONQUESTION);
//  IsEnglish:=MessageBox(0,('Dicetak  dalam Bahasa Inggris ?'),'Pencetakan Surat Penawaran',MB_YESNO or MB_ICONQUESTION);
  IsLanguage :=Main.MyMessageDlg('Dicetak menggunakan bahasa?',mtInformation,[mbYes,mbNo],['Inggris','Indonesia'],'Bahasa');
  RePrintForm.ReportName:='Offering Letter';
  RePrintForm.ReportId:=Offering_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetLeadOrderDetail  '+QuotedStr(Offering_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        StrSalesId:=Qry.FieldValues['sales_id'];
        ppSalesSign.Caption:=Qry.FieldValues['sales_name'];
        if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
        if Qry.FieldValues['rev']>0 then ppOfferingId.Caption:=Offering_Id+'R' else ppOfferingId.Caption:=Offering_Id;
        ppTo.Lines.Clear;
        if Qry.FieldValues['customer_name']<>NULL then begin
          ppTo.Lines.Add(Qry.FieldValues['customer_name']);
          if Qry.FieldValues['zip']<>NULL then ppTo.Lines.Add(Qry.FieldValues['address']+','+IntToStr(Qry.FieldValues['zip']))
          else if Qry.FieldValues['address']<>NULL then ppTo.Lines.Add(Qry.FieldValues['address']);
        end else if Qry.FieldValues['lead_name']<>NULL then begin
          ppTo.Lines.Add(Qry.FieldValues['lead_name']);
          if Qry.FieldValues['lead_address']<>NULL then ppTo.Lines.Add(Qry.FieldValues['lead_address']);
        end;
        if Qry.FieldValues['contact_person']<>NULL then begin
          ppTo.Lines.Add('Attn. '+Qry.FieldValues['contact_person'])
        end;
        if Qry.FieldValues['group_name']<>NULL then begin
          ppTo.Lines.Add('Group. '+Qry.FieldValues['group_name'])
        end;
        if (Qry.FieldValues['contact_cellular']<>NULL) AND (Qry.FieldValues['contact_cellular']<>'')  AND (Qry.FieldValues['contact_cellular']<>'/') then ppTo.Lines.Add('Hp. '+Qry.FieldValues['contact_cellular']);
        if (Qry.FieldValues['cellular_no']<>NULL) AND (Qry.FieldValues['cellular_no']<>'') then ppTo.Lines.Add('Hp. '+Qry.FieldValues['cellular_no']);
        if (Qry.FieldValues['phone_no']<>NULL) AND (Qry.FieldValues['phone_no']<>'') then ppTo.Lines.Add('Telp. '+Qry.FieldValues['phone_no']);
        if (Qry.FieldValues['fax_no']<>NULL) AND (Qry.FieldValues['fax_no']<>'') then ppTo.Lines.Add('Fax. '+Qry.FieldValues['fax_no']);
        if Qry.FieldValues['contact_email']<>NULL then ppTo.Lines.Add('email. '+Qry.FieldValues['contact_email']);
        IntTotal:=Qry.FieldValues['total_order'];
        if Qry.FieldValues['discount_price']>0 then IntDiscountPrice:=Qry.FieldValues['discount_price'] else IntDiscountPrice:=0;
        if Qry.FieldValues['discount_percent']>0 then IntDiscountPercent:=Qry.FieldValues['discount_percent'] else IntDiscountPercent:=0;
        ppSubTotal.Caption:=IToCurr(IntTotal);
        ppDiscount.Caption:=IToCurr(IntDiscountPrice+Round((IntTotal*IntDiscountPercent)/100));
        if (Qry.FieldValues['discount_price']=0) AND (Qry.FieldValues['discount_percent']=0) then begin
          ppLabelDiscount.Caption:='';
          ppLabelRpDiscount.Caption:='';
          ppDiscount.Caption:='';
        end;
        if Qry.FieldValues['service_resume']<>'' then begin
          ppLabelRpService.Caption:='Rp.';
          ppServices.Caption:=LeftStr(Qry.FieldValues['service_resume'],Length(Qry.FieldValues['service_resume'])-1);
          ppServicesPrice.Caption:=Qry.FieldValues['service_price'];
        end else begin
          ppLabelRpService.Caption:='';
          ppServices.Caption:='';
          ppServicesPrice.Caption:='';
        end;
        if Qry.FieldValues['total_addday']>0 then begin
          if (ppServices.Caption='') and (ppServicesPrice.Caption='')  then begin
            ppServices.Caption:='Additional Day';
            ppLabelRpService.Caption:='Rp.';
            ppServicesPrice.Caption:=IToCurr(Qry.FieldValues['total_addday']);
          end;
        end;
        ppTotal.Caption:=IToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['remark']<>NULL then begin
          ppRemarkLabel.Visible:=True;
          ppRemark.Visible:=True;
          ppRemark.Text:=Qry.FieldValues['remark'];
        end else begin
          ppRemarkLabel.Visible:=False;
          ppRemark.Visible:=False;
          ppRemark.Height:=0;
        end;
      end;
      ppGreetingHeader.Lines.Clear;
      ppTermsConditionDetail.Lines.Clear;
      if IsLanguage=6 then begin
        ppDate.Caption:=Bulan[StrToInt(FormatDateTime('mm',Now))]+' '+FormatDateTime('dd, yyyy',Now());
        ppLabelTo.Caption:='To :';
        ppAbout.Caption:='Re : Offering Letter';
//        ppGreetingHeader.Lines.Add('Dear Sir/Madam,');
        ppGreetingHeader.Lines.Add('Greeting from White Horse Group.');
        ppGreetingHeader.Lines.Add('Kindly please find our offering for Transportation services as you requested, below:');
        ppLabelDate.Caption:='Date';
        ppLabelUnit.Caption:='Unit / Seats';
        ppLabelDestination.Caption:='Destination';
        ppLabelPrice.Caption:='Price';
        ppLabelTermCondition.Caption:='Terms & Conditions:';
//        ppTermsConditionDetail.Lines.AddStrings(ppEnglish.Lines);
        ppSincerely.Caption:='Sincerely Yours,';
        ppRoute.DataField:='route_eng';
        ppRemarkLabel.Caption :='Notes :'
      end else begin
        ppDate.Caption:=FormatDateTime('dd mmmm yyyy',Now());
        ppLabelTo.Caption:='Kepada Yth :';
        ppAbout.Caption:='Hal : Surat Penawaran';
        ppGreetingHeader.Lines.Add('Dengan Hormat,');
        ppGreetingHeader.Lines.Add('Salam hangat dari White Horse Group.');
        ppGreetingHeader.Lines.Add('Bersama ini kami berikan penawaran harga pemakaian Armada White Horse dengan rician sbb:');
        ppLabelDate.Caption:='Tanggal';
        ppLabelUnit.Caption:='Unit / Seats';
        ppLabelDestination.Caption:='Tujuan';
        ppLabelPrice.Caption:='Harga';
        ppLabelTermCondition.Caption:='Dengan kondisi sebagai berikut:';
//        ppTermsConditionDetail.Lines.AddStrings(ppIndonesian.Lines);
        ppSincerely.Caption:='Hormat kami,';
        ppRoute.DataField:='route_indo';
        ppRemarkLabel.Caption :='Catatan :'
      end;
      Qry.Close;
      ppTermsConditionDetail.Lines.Clear;
      if IsLanguage=6 then
        StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Offering-TC')+',@LangId=2;'
      else
        StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Offering-TC')+',@LangId=1;';
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
      StrQry:='EXEC GetLeadOrderDetailPrint  '+QuotedStr(Offering_Id)+';';
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
//        ppAccount.Top:=2.6145999;
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

procedure TOfferingForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  if OffrId<>'' then begin
    Caption:='Data Surat Penawaran'; 
    LoadData;
    RefreshGrid;
    if not(IsInput) then DisableInput;
    Bersihkan.Enabled:=False;
  end else begin
    OfferingDate.Text:=Main.Status.Panels.Items[0].Text;
    SalesPerson.Text:=FullName;
  end;
end;

procedure TOfferingForm.DisableInput;
begin
  IsInputGrid:=False;
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupDetail.Enabled:=False;
  GroupBatal.Enabled:=False;
  Remark.Enabled:=False;
end;

procedure TOfferingForm.EnableInput;
begin
  IsInputGrid:=True;
  Simpan.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupDetail.Enabled:=True;
  GroupBatal.Enabled:=True;
  Remark.Enabled:=True;
end;

procedure TOfferingForm.ProductExit(Sender: TObject);
var IntCount:Integer;
begin
  if Product.Text<>'' then begin
    StrGrid.Cells[0,IntRow]:=Product.Text;
    Product.Text:='';
  end;
  Product.Visible:=False;
  StrGrid.SetFocus;
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) and (Product.Text<>'') then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[7,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  RefreshProduct;
end;

procedure TOfferingForm.DetailsExit(Sender: TObject);
begin
//  if Details.Text<>'' then begin
    StrGrid.Cells[1,IntRow]:=Details.Text;
//  end;
  Details.Visible:=False;
  StrGrid.SetFocus;
  Details.Text:='';
end;

procedure TOfferingForm.PickUpExit(Sender: TObject);
begin
//  if PickUp.Text<>'' then begin
    StrGrid.Cells[2,IntRow]:=PickUp.Text;
//  end;
  PickUp.Visible:=False;
  StrGrid.SetFocus;
  PickUp.Text:='';
end;

procedure TOfferingForm.DateStartExit(Sender: TObject);
begin
  if DateStart.Date>=Today then begin
    StrGrid.Cells[3,IntRow]:=FormatDateTime('dd/mm/yy',DateStart.Date);
    DateStart.Date:=IncDay(Now(),-1);
  end;
  DateStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOfferingForm.TimeStartExit(Sender: TObject);
begin
  if Trim(TimeStart.Text)<>':' then begin
    StrGrid.Cells[4,IntRow]:=TimeStart.Text;
    TimeStart.Text:='';
  end;
  TimeStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOfferingForm.DateFinishExit(Sender: TObject);
begin
  if DateFinish.Date>=Today then begin
    StrGrid.Cells[5,IntRow]:=FormatDateTime('dd/mm/yy',DateFinish.Date);
    DateFinish.Date:=IncDay(Now(),-1);
  end;
  DateFinish.Visible:=False;
  StrGrid.SetFocus;
  Calculate;
end;

procedure TOfferingForm.TimeStandbyExit(Sender: TObject);
begin
  if Trim(TimeStandby.Text)<>':' then begin
    StrGrid.Cells[6,IntRow]:=TimeStandby.Text;
    TimeStandby.Text:='';
  end;
  TimeStandby.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOfferingForm.DiscountDetailPriceExit(Sender: TObject);
begin
  if DiscountDetailPrice.Text='' then begin
    DiscountDetailPrice.Text:='0';
  end;
  StrGrid.Cells[9,IntRow]:=SToCurr(DiscountDetailPrice.Text);
  DiscountDetailPrice.Visible:=False;
  StrGrid.SetFocus;
  DiscountDetailPrice.Text:='';
  Calculate;
end;

procedure TOfferingForm.DiscountDetailPercentExit(Sender: TObject);
begin
  if DiscountDetailPercent.Text='' then begin
    DiscountDetailPercent.Text:='0';
  end;
  StrGrid.Cells[10,IntRow]:=DiscountDetailPercent.Text;
  DiscountDetailPercent.Visible:=False;
  StrGrid.SetFocus;
  DiscountDetailPercent.Text:='';
  Calculate;
end;

procedure TOfferingForm.DetailRemarkExit(Sender: TObject);
var IntCount:Integer;
begin
//  if DetailRemark.Text<>'' then begin
    StrGrid.Cells[11,IntRow]:=DetailRemark.Text;
//  end;
  DetailRemark.Visible:=False;
  StrGrid.SetFocus;
  DetailRemark.Text:='';
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[7,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TOfferingForm.ProductChange(Sender: TObject);
var IntCount:Integer;
begin
  CheckProduct;
end;

procedure TOfferingForm.ProductKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    ProductExit(nil);
    StrGrid.Col:=1;
  end;
  Calculate;
end;

procedure TOfferingForm.DetailsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DetailsExit(nil);
    StrGrid.Col:=2;
  end;
end;

procedure TOfferingForm.PickUpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    PickUpExit(nil);
    StrGrid.Col:=3;
  end;
end;

procedure TOfferingForm.DateStartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateStartExit(nil);
    StrGrid.Col:=4;
  end;
end;

procedure TOfferingForm.TimeStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStart.Text))>4) then begin
    TimeStartExit(nil);
    StrGrid.Col:=5;
  end;
end;

procedure TOfferingForm.DateFinishKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateFinishExit(nil);
    StrGrid.Col:=7;
  end;
end;

procedure TOfferingForm.TimeStandbyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStandby.Text))>4)  then begin
    TimeStandbyExit(nil);
    StrGrid.Col:=8;
  end;
end;

procedure TOfferingForm.DiscountDetailPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPriceExit(nil);
    StrGrid.Col:=10;
  end;
end;

procedure TOfferingForm.DiscountDetailPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPercentExit(nil);
    StrGrid.Col:=11;
  end;
end;

procedure TOfferingForm.DetailRemarkKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    DetailRemarkExit(nil);
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
  end;
end;

procedure TOfferingForm.CariLeadClick(Sender: TObject);
begin
  LeadList:=TLeadList.Create(Self,'BUS','OfferingForm');
end;

procedure TOfferingForm.CariCustomerClick(Sender: TObject);
begin
  CustomerList:=TCustomerList.Create(Self,'BUS','Offering-Create');
end;

procedure TOfferingForm.DiscountPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPercent.SetFocus;
end;

procedure TOfferingForm.DiscountPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Remark.SetFocus;
end;

procedure TOfferingForm.DiscountPriceEnter(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then DiscountPrice.Text:=ToString(DiscountPrice.Text);
end;

procedure TOfferingForm.DiscountPercentEnter(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then DiscountPercent.Text:=ToString(DiscountPercent.Text);
end;

procedure TOfferingForm.DiscountPriceExit(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then begin
    DiscountPrice.Text:=SToCurr(DiscountPrice.Text);
//    if StrToInt(DiscountPrice.Text)=0 then DiscountPercent.Enabled:=True else DiscountPercent.Enabled:=False;
  end else DiscountPrice.Text:='0';
  Calculate;
end;

procedure TOfferingForm.DiscountPercentExit(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then begin
    DiscountPercent.Text:=SToCurr(DiscountPercent.Text);
//    if StrToInt(DiscountPercent.Text)=0 then DiscountPrice.Enabled:=True else DiscountPrice.Enabled:=False;
  end else DiscountPercent.Text:='0';
  Calculate;
end;

procedure TOfferingForm.RemarkKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key=#13 then Simpan.SetFocus;
end;

procedure TOfferingForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
  InitGrid;
  EnableInput;
end;

procedure TOfferingForm.CetakUlangClick(Sender: TObject);
begin
  if OffrId<>'' then RePrint(OffrId)
  else if Main.IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'BUS','Offering-Reprint');
end;

procedure TOfferingForm.UnitsKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    UnitsExit(nil);
    StrGrid.Col:=9;
  end;
end;

procedure TOfferingForm.UnitsExit(Sender: TObject);
begin
  if Units.Text<>'' then begin
    StrGrid.Cells[8,IntRow]:=Units.Text;
    Units.Text:='';
  end;
  Units.Visible:=False;
  StrGrid.SetFocus;
  Calculate;
end;

procedure TOfferingForm.CariKontakClick(Sender: TObject);
begin
  If CustomerId.Text<>'' then begin
    Customer:=TCustomer.Create(Self,CustomerId.Text,'Bus',False,'Offering-Create')  
  end;
end;

procedure TOfferingForm.CariKontrakClick(Sender: TObject);
begin
  ContractList:=TContractList.Create(Self,'Bus','Offering-Create',CustomerId.Text); 
end;

procedure TOfferingForm.StrGridDblClick(Sender: TObject);
begin
  if FormRequest='' then begin
  end else begin
    if UpperCase(FormRequest)='ORDER-CREATE' then  begin
      OrderForm.SetOrderDetail(StrGrid.Cells[16,IntRow]);
      OfferingForm.Close;
    end;
  end;
end;

procedure TOfferingForm.ServiceChange(Sender: TObject);
begin
  CheckService;
end;

procedure TOfferingForm.ServiceExit(Sender: TObject);
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

procedure TOfferingForm.ServiceKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    if (Trim(Service.Text)='') then StrGrid.SetFocus
    else begin
      ServiceExit(nil);
      if GridService.Cells[14,IntRowService]='1' then GridService.Col:=1 else GridService.Col:=2; 
    end;
  end;
end;

procedure TOfferingForm.JumlahBiayaExit(Sender: TObject);
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

procedure TOfferingForm.JumlahBiayaKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TOfferingForm.QtyExit(Sender: TObject);
begin
   if Qty.Text<>'' then begin
    GridService.Cells[1,IntRowService]:=Qty.Text;
    Qty.Text:='';
  end;
  Qty.Visible:=False;
  GridService.SetFocus;
  Calculate;
end;

procedure TOfferingForm.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
    GridService.Col:=2;
  end;
end;

procedure TOfferingForm.GridServiceSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRowService:=ARow;
  IntColService:=ACol;
  if (IsInputGrid) then begin
    if (ARow > MinRowService) then begin
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
  end;
end;

procedure TOfferingForm.DetailsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DetailsExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DetailsExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.PickUpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    PickUpExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    PickUpExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.DateStartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DateStartExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DateStartExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.TimeStartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    TimeStartExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    TimeStartExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.DateFinishKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DateFinishExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DateFinishExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.TimeStandbyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    TimeStandbyExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    TimeStandbyExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.UnitsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    UnitsExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    UnitsExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.DiscountDetailPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DiscountDetailPriceExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DiscountDetailPriceExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.DiscountDetailPercentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DiscountDetailPercentExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DiscountDetailPercentExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.DetailRemarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DetailRemarkExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DetailRemarkExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TOfferingForm.ShowLeadCustomer;
begin
  if (Main.IsFormOpen('Customer')=False) then begin
    if (Trim(CustomerId.Text)<>'')  then Customer:=TCustomer.Create(Self,Trim(CustomerId.Text),'Bus',False)
    else if (Trim(LeadId.Text)<>'')  then Lead:=TLead.Create(Self,Trim(LeadId.Text),False);
  end;
end;

procedure TOfferingForm.GroupBox1DblClick(Sender: TObject);
begin
  ShowLeadCustomer;
end;

end.
