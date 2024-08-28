unit OrderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppParameter, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls, Buttons,
  Mask, ComCtrls, Grids, ZColorStringGrid, ExtCtrls, WHUnit, ppDBPipe, ppDB, DB, ppDBBDE,
  ppSubRpt, Jpeg;

type
  TOrderForm = class(TForm)
    Label19: TLabel;
    GroupOrder: TGroupBox;
    Label14: TLabel;
    StrGrid: TZColorStringGrid;
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
    PanelCariCustomer: TPanel;
    CariCustomer: TSpeedButton;
    PanelCariKontak: TPanel;
    CariKontak: TSpeedButton;
    PanelCariKontrak: TPanel;
    CariKontrak: TSpeedButton;
    GroupBox2: TGroupBox;
    LabelNo: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    OrderId: TEdit;
    OrderDate: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Units: TMemo;
    Label1: TLabel;
    OfferingId: TEdit;
    GroupDetail: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    PanelDetail: TPanel;
    PanelDiscount: TPanel;
    Label7: TLabel;
    DiscountPrice: TEdit;
    DiscountPercent: TEdit;
    Remark: TMemo;
    PanelOffering: TPanel;
    CariOffering: TSpeedButton;
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
    ScheduleAdd: TBitBtn;
    CheckSelect: TCheckBox;
    Label24: TLabel;
    Group: TEdit;
    Address: TMemo;
    HeaderRemark: TMemo;
    GroupOtorisasi: TPanel;
    Authorization: TCheckBox;
    GroupSalesPerson: TPanel;
    SalesPerson: TComboBox;
    ppReport: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLogo: TppImage;
    ppLabel387: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppContactName: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDates: TppDBText;
    ppLine100: TppLine;
    ppUnit: TppDBText;
    ppPrices: TppDBText;
    ppLine102: TppLine;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppTermsConditionDetail: TppMemo;
    ppParameterList4: TppParameterList;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppemail: TppLabel;
    ppPhoneNo: TppLabel;
    ppFaxNo: TppLabel;
    ppCelularNo: TppLabel;
    ppCustomerName: TppLabel;
    ppHeaderMemo: TppMemo;
    ppShape2: TppShape;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel114: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppFlight: TppDBText;
    ppLine39: TppLine;
    ppOrderId: TppLabel;
    ppGroupName: TppLabel;
    ppLabel115: TppLabel;
    ppTermsConditionDetail2: TppMemo;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppFooterMemo: TppMemo;
    ppMemo4: TppMemo;
    ppLabel385: TppLabel;
    ppDate: TppLabel;
    ppCompanySign: TppLabel;
    ppSincerely: TppLabel;
    ppAccepted: TppLabel;
    ppLabelSign: TppLabel;
    ppLabelSignatureBelow: TppLabel;
    ppLabelSignature: TppLabel;
    ppSalesSign: TppLabel;
    ppShape6: TppShape;
    ppReprinted: TppLabel;
    ppShape1: TppShape;
    ppLabelDiscountRp: TppLabel;
    ppDiscount: TppLabel;
    ppLine1: TppLine;
    ppTotal: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabelDiscount: TppLabel;
    ppRp: TppDBText;
    ppRemakLabel: TppLabel;
    ppRemark: TppMemo;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppServicesRp: TppLabel;
    ppServices: TppLabel;
    ppServicesLabel: TppLabel;
    pp_route: TppDBMemo;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppGuide: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    Button1: TButton;
    DeleteKontrak: TSpeedButton;
    ppSignature: TppImage;
    PanelBook: TPanel;
    Package: TCheckBox;
    PanelBookDirect: TPanel;
    Bookdirect: TCheckBox;
    ppMemo1: TppMemo;
    LockButton: TPanel;
    LockButtons: TSpeedButton;
    ppLockSign: TppImage;
    GroupBooked: TPanel;
    isBooked: TCheckBox;
    GroupIsService: TPanel;
    IsService: TCheckBox;
    cb_pilihan_service: TComboBox;
    Label3: TLabel;
    LabelPph: TLabel;
    PphPercen: TMemo;
    PphDeduction: TMemo;
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ProductExit(Sender: TObject);
    procedure DetailsExit(Sender: TObject);
    procedure PickUpExit(Sender: TObject);
    procedure DateStartExit(Sender: TObject);
    procedure TimeStartExit(Sender: TObject);
    procedure DateFinishExit(Sender: TObject);
    procedure TimeStandbyExit(Sender: TObject);
    procedure DiscountDetailPriceExit(Sender: TObject);
    procedure UnitsExit(Sender: TObject);
    procedure DiscountDetailPercentExit(Sender: TObject);
    procedure DetailRemarkExit(Sender: TObject);
    procedure CariOfferingClick(Sender: TObject);
    procedure CariCustomerClick(Sender: TObject);
    procedure CariKontakClick(Sender: TObject);
    procedure CariKontrakClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProductKeyPress(Sender: TObject; var Key: Char);
    procedure ProductChange(Sender: TObject);
    procedure DetailsKeyPress(Sender: TObject; var Key: Char);
    procedure PickUpKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartKeyPress(Sender: TObject; var Key: Char);
    procedure TimeStartKeyPress(Sender: TObject; var Key: Char);
    procedure DateFinishKeyPress(Sender: TObject; var Key: Char);
    procedure TimeStandbyKeyPress(Sender: TObject; var Key: Char);
    procedure UnitsKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountDetailPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountDetailPercentKeyPress(Sender: TObject;
      var Key: Char);
    procedure DetailRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure ProductKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PickUpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UnitsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPercentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure CetakUlangClick(Sender: TObject);
    procedure DiscountCNKeyPress(Sender: TObject; var Key: Char);
    procedure GuideCellularKeyPress(Sender: TObject; var Key: Char);
    procedure GuideKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridDblClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure ScheduleAddClick(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DeleteKontrakClick(Sender: TObject);
    procedure Label4DblClick(Sender: TObject);
    procedure Label5DblClick(Sender: TObject);
    procedure BookdirectClick(Sender: TObject);
    procedure IsServiceClick(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    OrderServiceTypeArr:Array of TArrString4;
    IsInputGrid,IsInput,IsPriceEdit,IsBookDirect,IsLock:Boolean;
    OrdrId,FormRequest:String;
    Revision,MinRowService,IntRowService,IntColService,DiscntPercent,DiscntPrice,FormLine:Integer;
    Initiation,IsWaitingListEnabled:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure RefreshProduct(Product_Id:String='');
    procedure RefreshService;
    procedure RefreshSales;
    procedure LoadData;
    procedure RefreshGrid;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure CheckProduct;
    procedure CheckService;
    procedure PreparePrint;
    procedure GetOfferingDetail;
    procedure DeleteOfferingDetail;
    procedure ShowCustomerDetail;
    procedure RefreshBook;
  public
    { Public declarations }
    procedure SetCustomerId(Customer_Id:String);
    procedure SetContactId(Contact_Id:String);
    procedure SetOfferingId(Offering_Id:String);
    procedure SetContractId(Contract_id:String);
    procedure SetOrderDetail(Lead_Order_Detail_Id:String);
    procedure RePrint(Order_Id:String);
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Order_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Book_Direct:Boolean=False);Overload;
  end;

var
  OrderForm: TOrderForm;

implementation

uses MainU, ADODB, DateUtils, AuthorizedFormU, RePrintFormU, OfferingListU,
  CustomerListU, CustomerU, ContractListU, OfferingFormU, OrderListU,
  BookingFormU, StrUtils;

{$R *.dfm}
constructor TOrderForm.Create(AOwner:TComponent;Order_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Book_Direct:Boolean=False);
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

procedure TOrderForm.Init;
begin
  LockButton.Visible:=False;
  IsLock:=False;
  IsPriceEdit:=False;
  OfferingId.Text:='';
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
  LabelPph.Caption:='';
  PphPercen.Text:='';
  PphDeduction.Text:='';
  Details.Text:='';
  PickUp.Text:='';
  DateStart.Date:=IncDay(Now(),-1);
  TimeStart.Text:='';
  TimeStandby.Text:='';
  DateFinish.Date:=IncDay(Now(),-1);
  DiscountDetailPrice.Text:='';
  DiscountDetailPercent.Text:='';
  DetailRemark.Text:='';
  PanelOffering.Enabled:=True; 
  PanelCariKontak.Enabled:=True;
  PanelCariCustomer.Enabled:=True;
  PanelCariKontrak.Enabled:=True;
  Status.Checked:=False;
  IsService.Checked:=False;
  Package.Checked:=False;

  TimeStart.Visible:=True;
  TimeStart.Height:=36;
  TimeStart.Visible:=False;
  TimeStandby.Visible:=True;
  TimeStandby.Height:=36;
  TimeStandby.Visible:=False;
  DiscountPrice.Enabled:=True;
  DiscountPercent.Enabled:=True;
  DiscountCN.Text:='';
  DiscntPercent:=0;
  DiscntPrice:=0;
  Bookdirect.Checked:=False;
  PanelBookDirect.Visible:=True;
  PanelBookDirect.Enabled:=True;
  PanelBook.Visible:=True;
  ppLockSign.Visible:=False;
  if OrdrId<>'' then begin
    Status.Visible:=True;
    Authorization.Visible:=True;
  end else begin
    Status.Visible:=False;
    Authorization.Visible:=False;
  end;
//  ScheduleAdd.Visible:=False;
  if DepartmentId='14' then begin
    SalesPerson.Style:=csSimple;
    GroupSalesPerson.Enabled:=False;
    SalesPerson.Text:='';
  end else begin
    SalesPerson.Style:=csDropDownList;
    GroupSalesPerson.Enabled:=True;
    SalesPerson.Text:='';
    SalesPerson.Items.Clear;
    SalesPerson.ItemIndex:=-1;
  end;
end;

procedure TOrderForm.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=28;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=170;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=160;
  StrGrid.ColWidths[4]:=55;
  StrGrid.ColWidths[5]:=35;
  StrGrid.ColWidths[6]:=55;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=70;
  StrGrid.ColWidths[9]:=30;
  StrGrid.ColWidths[10]:=70;
  StrGrid.ColWidths[11]:=25;
  StrGrid.ColWidths[12]:=140;
  //col 13=price_weekday
  //col 14=price_weekend
  //col 15=total
  //col 16=contract_discount_price
  //col 17=lead_order_detail_id
  //col 18=customer_order_detail_id
  //col 19=total_reserved
  //col 20=product_price_id
  //col 21=package_day
  //col 22=price_overday
  //col 23=total_addDays
  //col 24=seat
  //col 25=fullday
  //col 26=hour
  //col 27=vhc_batch_id
  for IntCount:=13 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,5,0);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,11,0);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.RowHeights[0]:=20;
  StrGrid.RowHeights[1]:=20;
  StrGrid.Cells[1,0]:='Product';
  StrGrid.Cells[2,0]:='Acara Perjalanan';
  StrGrid.Cells[3,0]:='Lokasi Jemput';
  StrGrid.Cells[4,0]:='Berangkat';
  StrGrid.Cells[6,0]:='Tgl Selesai';
  StrGrid.Cells[7,0]:='Jam Standby';
  StrGrid.Cells[8,0]:='Harga';
  StrGrid.Cells[9,0]:='Unit';
  StrGrid.Cells[10,0]:='Discount';
  StrGrid.Cells[12,0]:='Keterangan';
  StrGrid.Cells[4,1]:='Tanggal';
  StrGrid.Cells[5,1]:='Jam';
  StrGrid.Cells[10,1]:='Rp';
  StrGrid.Cells[11,1]:='%';
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1  do begin
    StrGrid.Cells[IntCount,2]:='';
  end;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[9,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[10,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[11,2].HorizontalAlignment:=taRightJustify;
end;

procedure TOrderForm.InitGridService;
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

procedure TOrderForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
begin
  RefreshProduct;
  RefreshService;
  if DepartmentId<>'14' then RefreshSales;
end;

procedure TOrderForm.RefreshBook;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if PanelBookDirect.Visible=True then begin
      StrQry:='SELECT value_string FROM wh_setting WHERE setting_name='+QuotedStr('Auto_Schedule')+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if Qry.FieldValues['value_string']='1' then Bookdirect.Checked:=True
        else Bookdirect.Checked:=False;
      end;
      Qry.Close;
      StrQry:='SELECT value_string FROM wh_setting WHERE setting_name='+QuotedStr('Confirmation_Form_Line_CompanyId_'+CompanyId)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if Qry.FieldValues['value_string']<>NULL then FormLine:=Qry.FieldValues['value_string'];
      end;
      Qry.Close;
      StrQry:='SELECT value_string FROM wh_setting WHERE setting_name='+QuotedStr('Waiting_List_Enabled_'+CompanyId)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if Qry.FieldValues['value_string']<>NULL then FormLine:=Qry.FieldValues['value_string'];
      end;
      Qry.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderForm.RefreshSales;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT dbo.GetUsername('+QuotedStr(User)+') AS sales ';
//            'UNION ALL '+
//            'SELECT dbo.GetUsername(username) AS sales FROM wh_user a '+
//            'LEFT JOIN wh_user_detail b ON b.user_id=a.username '+
//            'LEFT JOIN wh_company_location c ON c.company_location_id=a.company_location_id '+
//            'WHERE (b.department_id=14) AND (c.location_id='+QuotedStr(LocationId)+');';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SalesPerson.Items.Add(Qry.FieldValues['sales']);
      SalesPerson.ItemIndex:=SalesPerson.Items.IndexOf(Qry.FieldValues['sales']);
      Qry.Next;
    end;
    Qry.Close;
//    StrQry:='SELECT dbo.GetUsername('+QuotedStr(User)+') AS sales;';
//    Main.WriteLog('SQL :'+StrQry,2);
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
//    if (Qry.RecordCount>0) then begin
//      SalesPerson.ItemIndex:=SalesPerson.Items.IndexOf(Qry.FieldValues['sales']);
//    end;
//    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderForm.RefreshService;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCountPagi,IntCountMalam,IntCount,IntCount2:Integer;
begin
  Service.Text:='';
  Service.ItemIndex:=-1;
  Service.Items.Clear;
  SetLength(ServiceArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
  
    SetLength(OrderServiceTypeArr,0);
    StrQry:='EXEC GetOrderServiceType;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(OrderServiceTypeArr,Qry.RecordCount+1);
    for IntCount2:=0 to 4 do OrderServiceTypeArr[0][IntCount2]:=' ';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        OrderServiceTypeArr[IntCount][0]:=Qry.FieldValues['id'];
        OrderServiceTypeArr[IntCount][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount)
    end;
    Qry.Close;
    cb_pilihan_service.Items.Clear;
    for IntCount:=1 to Length(OrderServiceTypeArr)-1 do
      cb_pilihan_service.Items.Add(OrderServiceTypeArr[IntCount][1]);


    Qry.SQL.Clear;
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

procedure TOrderForm.RefreshProduct(Product_Id:String='');
var Qry:TADOQuery;
    StrQry,StrProduct,StrCompanyId,StrLocationId:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    if Product_Id<>'' then StrProduct:=',@ProductId='+QuotedStr(Product_Id) else StrProduct:='';
    StrCompanyId:=CompanyId;
    StrLocationId:=',@LocationId='+LocationId; 
    StrQry:='EXEC GetProductPriceList '+StrCompanyId+StrLocationId+',@ContractId='+QuotedStr(ContractId.Text)+StrProduct+';';
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
      ProductArr[IntCount][11]:=Qry.FieldValues['hour'];
      ProductArr[IntCount][12]:=Qry.FieldValues['vhc_batch_id'];
      ProductArr[IntCount][13]:=Qry.FieldValues['service'];
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

procedure TOrderForm.CheckProduct;
var IntCount:Integer;
begin
  if Trim(ProductArr[Product.ItemIndex][1])<>'' then begin
    StrGrid.Cells[8,IntRow]:='';
    if StrGrid.Cells[9,IntRow]='' then StrGrid.Cells[9,IntRow]:='1';
    if ProductArr[Product.ItemIndex][7]<>'' then begin
      StrGrid.Cells[10,IntRow]:=ProductArr[Product.ItemIndex][7];
      StrGrid.Cells[16,IntRow]:='1';
    end else begin
      StrGrid.Cells[10,IntRow]:='0';
      StrGrid.Cells[16,IntRow]:='';
    end;
    if ProductArr[Product.ItemIndex][8]<>'' then begin
      StrGrid.Cells[11,IntRow]:=ProductArr[Product.ItemIndex][8];
      StrGrid.Cells[16,IntRow]:='1';
    end else begin
      StrGrid.Cells[11,IntRow]:='0';
      StrGrid.Cells[16,IntRow]:='';
    end;
    if (ProductArr[Product.ItemIndex][13]='1') then IsService.Checked:=True else IsService.Checked:=False; 
    StrGrid.Cells[13,IntRow]:=ProductArr[Product.ItemIndex][2];
    StrGrid.Cells[14,IntRow]:=ProductArr[Product.ItemIndex][3];
    StrGrid.Cells[15,IntRow]:='0';
    StrGrid.Cells[20,IntRow]:=ProductArr[Product.ItemIndex][0];
    StrGrid.Cells[21,IntRow]:=ProductArr[Product.ItemIndex][9];
    StrGrid.Cells[22,IntRow]:=ProductArr[Product.ItemIndex][10];
    StrGrid.Cells[23,IntRow]:='0';
    StrGrid.Cells[24,IntRow]:=ProductArr[Product.ItemIndex][5];
    StrGrid.Cells[25,IntRow]:=ProductArr[Product.ItemIndex][6];
    StrGrid.Cells[26,IntRow]:=ProductArr[Product.ItemIndex][11];
    StrGrid.Cells[27,IntRow]:=ProductArr[Product.ItemIndex][12];
    StrGrid.CellStyle[8,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,IntRow].HorizontalAlignment:=taRightJustify;
  end else begin
    for IntCount:=0 to StrGrid.ColCount-1  do StrGrid.Cells[IntCount,IntRow]:='';
  end;
end;

procedure TOrderForm.CheckService;
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

procedure TOrderForm.SetOrderDetail(Lead_Order_Detail_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntFreeRow:Integer;
begin
  if (StrGrid.Cells[1,IntRow]<>'') and (StrGrid.Cells[2,IntRow]<>'') then begin
    for IntCount:=StrGrid.RowCount-1 downto MinRowGrid+1 do
      if StrGrid.Cells[1,IntCount]='' then IntFreeRow:=IntCount;
  end else IntFreeRow:=IntRow;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLeadOrderDetailDetail '+QuotedStr(Lead_Order_Detail_Id)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['product_price_name']<> NULL then begin
        StrGrid.Cells[1,IntFreeRow]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[2,IntFreeRow]:=Qry.FieldValues['route'];
        if Qry.FieldValues['pickup_point']<>NULL then StrGrid.Cells[3,IntFreeRow]:=Qry.FieldValues['pickup_point'];
        StrGrid.Cells[4,IntFreeRow]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[5,IntFreeRow]:=Qry.FieldValues['from_time'];
        StrGrid.Cells[6,IntFreeRow]:=Qry.FieldValues['to_dates'];
        if Qry.FieldValues['standby_time']<>NULL then StrGrid.Cells[7,IntFreeRow]:=Qry.FieldValues['standby_time'];
        StrGrid.Cells[9,IntFreeRow]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[10,IntFreeRow]:=IntToStr(Qry.FieldValues['discount_price']);
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[11,IntFreeRow]:=Qry.FieldValues['discount_percent'];
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[12,IntFreeRow]:=Qry.FieldValues['remark'];
        StrGrid.Cells[13,IntFreeRow]:=Qry.FieldValues['price_weekday'];
        StrGrid.Cells[14,IntFreeRow]:=Qry.FieldValues['price_weekend'];
        StrGrid.Cells[15,IntFreeRow]:=Qry.FieldValues['total'];
        if (Qry.FieldValues['contract_discount_price']<>NULL) or (Qry.FieldValues['contract_discount_percent']<>NULL) then StrGrid.Cells[16,IntFreeRow]:='1';
        StrGrid.Cells[17,IntFreeRow]:=Qry.FieldValues['lead_order_detail_id'];
        StrGrid.CellStyle[8,IntFreeRow].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[9,IntFreeRow].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[10,IntFreeRow].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[11,IntFreeRow].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[21,IntFreeRow]:=Qry.FieldValues['package_day'];
        StrGrid.Cells[22,IntFreeRow]:=Qry.FieldValues['price_overday'];
        StrGrid.Cells[23,IntFreeRow]:=Qry.FieldValues['total_addday'];
        StrGrid.Cells[24,IntFreeRow]:=Qry.FieldValues['seat'];
        StrGrid.Cells[25,IntFreeRow]:=Qry.FieldValues['full_day'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  Main.M_Normal;
end;

procedure TOrderForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntDiscount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
      if Qry.FieldValues['lead_order_id']<>NULL then OfferingId.Text:=Qry.FieldValues['lead_order_id'];
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
      if Qry.FieldValues['inv_later']<>NULL then if Qry.FieldValues['inv_later']=1 then Authorization.Checked:=True;
      Total.Text:=IToCurr(Qry.FieldValues['total']);
      Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']);
      if Qry.FieldValues['discount_amount']>0 then Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']);
//      IntDiscount:=Qry.FieldValues['discount_price']+Round((IntTotal*Qry.FieldValues['discount_percent'])/100);
//      Discount.Text:=IToCurr(IntDiscount);
//      SubTotal.Text:=IToCurr(Qry.FieldValues['total']+IntDiscount);
      if Qry.FieldValues['status']='0' then Status.Checked:=True;
      if Qry.FieldValues['lock_order']='1' then IsLock:=True;
      if Qry.FieldValues['is_booking']='1' then isBooked.Checked:=True else isBooked.Checked:=False;
      if Qry.FieldValues['is_service']='1' then IsService.Checked:=True else IsService.Checked:=False;

      if Qry.FieldValues['IsUsingTax']=True then
      begin
        LabelPph.Visible:=True;
        PphPercen.Visible:=True;
        PphDeduction.Visible:=True;
        LabelPph.Caption:=Qry.FieldValues['Pph'];
        PphPercen.Text:=IToCurr(Qry.FieldValues['PphPercentage'])+'%';
        PphDeduction.Text:=IToCurr(Qry.FieldValues['PphDeduction']);
      end else begin
        LabelPph.Caption:='';
        PphPercen.Text:='';
        PphDeduction.Text:='';
        LabelPph.Visible:=False;
        PphPercen.Visible:=False;
        PphDeduction.Visible:=False;
      end;


      cb_pilihan_service.ItemIndex:=cb_pilihan_service.Items.IndexOf(Qry.FieldValues['JenisOrder']);

      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderForm.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(OrdrId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['product_price_name']<> NULL then begin
        StrGrid.RowCount:=IntCount+1;
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['route'];
        if Qry.FieldValues['pickup_point']<>NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['pickup_point'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[5,IntCount]:=Qry.FieldValues['from_time'];
        StrGrid.Cells[6,IntCount]:=Qry.FieldValues['to_dates'];
        if Qry.FieldValues['standby_time']<>NULL then StrGrid.Cells[7,IntCount]:=Qry.FieldValues['standby_time'];
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[10,IntCount]:=IntToStr(Qry.FieldValues['discount_price']);
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[11,IntCount]:=Qry.FieldValues['discount_percent'];
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[12,IntCount]:=Qry.FieldValues['remark'];
        StrGrid.Cells[13,IntCount]:=Qry.FieldValues['price_weekday'];
        StrGrid.Cells[14,IntCount]:=Qry.FieldValues['price_weekend'];
        StrGrid.Cells[15,IntCount]:=Qry.FieldValues['total'];
        if (Qry.FieldValues['contract_discount_price']<>NULL) or (Qry.FieldValues['contract_discount_percent']<>NULL) then StrGrid.Cells[16,IntCount]:='1';
        if Qry.FieldValues['lead_order_detail_id']<>NULL then StrGrid.Cells[17,IntCount]:=Qry.FieldValues['lead_order_detail_id'];
        StrGrid.Cells[18,IntCount]:=Qry.FieldValues['customer_order_detail_id'];
        StrGrid.Cells[19,IntCount]:=Qry.FieldValues['total_reserved'];
        StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[9,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[10,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[11,IntCount].HorizontalAlignment:=taRightJustify;
        for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
        if UpperCase(FormRequest)='RESERVED-CREATE' then begin
          if StrToInt(StrGrid.Cells[9,IntCount])<=StrToInt(StrGrid.Cells[19,IntCount]) then begin
            for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clGreen;
          end;
        end;
        StrGrid.Cells[20,IntCount]:=Qry.FieldValues['product_price_id'];
        StrGrid.Cells[21,IntCount]:=Qry.FieldValues['package_day'];
        StrGrid.Cells[22,IntCount]:=Qry.FieldValues['price_overday'];
        StrGrid.Cells[23,IntCount]:=Qry.FieldValues['total_addday'];
        StrGrid.Cells[24,IntCount]:=Qry.FieldValues['seat'];
        StrGrid.Cells[25,IntCount]:=Qry.FieldValues['full_day'];
        StrGrid.Cells[26,IntCount]:=Qry.FieldValues['hour'];
        StrGrid.Cells[27,IntCount]:=Qry.FieldValues['vhc_batch_id'];
      end;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
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

procedure TOrderForm.Calculate;
var IntCount,IntTotal,IntTotalAll,IntPrice,IntDiscPrice,IntDiscPerc,IntMonths,IntDates,IntYears,IntUnit,IntAddDays:Integer;
    IntDays,IntTotalService,Intservice,IntMultiply,IntFromDate,IntToDate,IntToMonth,IntFromMonth,IntFromYears,IntToYears:Integer;
    IntAmountAddDays:Integer;
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
      if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'')
      and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[6,IntCount]<>'') and (StrGrid.Cells[9,IntCount]<>'') then begin
        IntTotal:=0;
        IntDays:=0;
        IntAddDays:=0;
        if StrGrid.Cells[9,IntCount]='' then StrGrid.Cells[9,IntCount]:='1';
        if StrGrid.Cells[10,IntCount]='' then StrGrid.Cells[10,IntCount]:='0';
        if StrGrid.Cells[11,IntCount]='' then StrGrid.Cells[11,IntCount]:='0';
        IntUnit:=SToInt(StrGrid.Cells[9,IntCount]);
        IntFromYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrGrid.Cells[4,IntCount])));
        IntToYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrGrid.Cells[6,IntCount])));
        for IntYears:=IntFromYears to IntToYears  do begin
          if IntYears<IntToYears then begin
            if IntYears>IntFromYears then begin
              IntFromMonth:=1;
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[6,IntCount])));
            end else begin
              IntFromMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[4,IntCount])));
              IntToMonth:=12;
            end;
          end else begin
            if IntYears>IntFromYears then begin
              IntFromMonth:=1;
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[6,IntCount])));
            end else begin
              IntFromMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[4,IntCount])));
              IntToMonth:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[6,IntCount])));
            end;
          end;
//          for IntMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[4,IntCount]))) to StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[6,IntCount]))) do begin
          for IntMonths:=IntFromMonth to IntToMonth do begin
//            if IntMonths<StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[6,IntCount]))) then begin
            if (IntMonths<IntToMonth) OR ((IntMonths=IntToMonth) AND (IntYears<IntToYears)) then begin
              if IntMonths>IntFromMonth then begin
                IntFromDate:=1;
                IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
              end else begin
                IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[4,IntCount])));
                IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
              end;
            end else begin
//              if IntMonths>StrToInt(FormatDateTime('mm',StrToDate(StrGrid.Cells[4,IntCount]))) then begin
              if (IntMonths>IntFromMonth) OR ((IntMonths=IntToMonth) AND (IntFromYears<IntYears)) then begin
                IntFromDate:=1;
                IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[6,IntCount])))
              end else begin
                IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[4,IntCount])));
                IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrGrid.Cells[6,IntCount])));
              end;
            end;
            for IntDates:=IntFromDate to IntToDate do begin
              if StrGrid.Cells[14,IntCount]<>StrGrid.Cells[13,IntCount] then begin
                StrQry:='SELECT dbo.IsWeekend('+QuotedStr(IntToStr(IntYears)+'-'+IntToStr(IntMonths)+'-'+IntToStr(IntDates))+') AS result;';
                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,2);
                Qry.SQL.Add(StrQry);
                Qry.Open;
                if Qry.RecordCount>0 then if Qry.FieldValues['result']=1 then begin
                  IntPrice:=SToInt(StrGrid.Cells[14,IntCount]);
                  IsWeekend:=True;
                end else begin
                  IntPrice:=SToInt(StrGrid.Cells[13,IntCount]);
                  IsWeekday:=True;
                end;
                Qry.Close;
              end else begin
                IntPrice:=SToInt(StrGrid.Cells[13,IntCount]);
              end;
              if StrGrid.Cells[21,IntCount]='0' then begin
                IntTotal:=IntTotal+(IntPrice*IntUnit);
                Inc(IntDays);
              end else begin
                if IntDays<StrToInt(StrGrid.Cells[21,IntCount]) then begin
                  Inc(IntDays);
                end else begin
                  Inc(IntAddDays)
                end;
                IntTotal:=IntPrice*IntUnit*SToInt(StrGrid.Cells[21,IntCount]);
              end;
            end;
          end
        end;
        IntMultiply:=IntMultiply+(IntDays*IntUnit);
        if StrGrid.Cells[13,IntCount]<>StrGrid.Cells[14,IntCount] then begin
          if IsWeekday=True then StrGrid.Cells[8,IntCount]:=SToCurr(StrGrid.Cells[13,IntCount]);
          if IsWeekend=True then if not(IsWeekday) then StrGrid.Cells[8,IntCount]:= SToCurr(StrGrid.Cells[14,IntCount])
          else StrGrid.Cells[8,IntCount]:=SToCurr(StrGrid.Cells[13,IntCount])+Chr(13)+'    '+SToCurr(StrGrid.Cells[14,IntCount])+'  ';
        end else begin
          if StrGrid.Cells[21,IntCount]='0' then begin
            StrGrid.Cells[8,IntCount]:=SToCurr(StrGrid.Cells[13,IntCount]);
          end else begin
            if IntAddDays<1 then begin
              StrGrid.Cells[8,IntCount]:='(P) '+IToCurr(SToInt(StrGrid.Cells[13,IntCount])*SToInt(StrGrid.Cells[21,IntCount]));
            end else begin
              StrGrid.Cells[8,IntCount]:='(P) '+IToCurr(SToInt(StrGrid.Cells[13,IntCount])*SToInt(StrGrid.Cells[21,IntCount]))+Chr(13)+' (A) '+SToCurr(StrGrid.Cells[22,IntCount]);
            end;
          end;
        end;
        if IntAddDays>0 then begin
          StrGrid.Cells[23,IntCount]:=IntToStr(IntAddDays*SToInt(StrGrid.Cells[22,IntCount]));
        end else begin
          StrGrid.Cells[23,IntCount]:='0';
        end;
        if Not(Initiation) then begin
          IntDiscPrice:=SToInt(StrGrid.Cells[10,IntCount]);
          IntDiscPerc:=SToInt(StrGrid.Cells[11,IntCount]);
        end;
        if Initiation then begin
          IntTotal:=StrToInt(StrGrid.Cells[15,IntCount]);
        end;
        IntTotal:=IntTotal-(IntDiscPrice+Round(IntTotal*(IntDiscPerc/100))) ;
        IntTotalAll:=IntTotalAll+IntTotal;
        StrGrid.Cells[15,IntCount]:=IntToStr(IntTotal);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    IntAmountAddDays:=0;
    for IntCount:=2 to StrGrid.RowCount-1 do begin
      if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'')
      and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[6,IntCount]<>'') and (StrGrid.Cells[9,IntCount]<>'')
      and (StrGrid.Cells[23,IntCount]<>'0') then begin
        IntAmountAddDays:=IntAmountAddDays+(SToInt(StrGrid.Cells[23,IntCount])*SToInt(StrGrid.Cells[9,IntCount] ));
      end;
    end;
    IntTotalService:=0;
    for IntCount:=MinRowService+1 to GridService.RowCount-1 do begin
      if (Trim(GridService.Cells[0,IntCount])<>'') and (Trim(GridService.Cells[2,IntCount])<>'') and (GridService.Cells[7,IntCount]='1')then begin
        if (GridService.Cells[10,IntCount]='1') and (IntDays>0)  then GridService.Cells[2,IntCount]:=IToCurr((IntMultiply+(IntAddDays*IntUnit))*SToInt(GridService.Cells[4,IntCount]));
        if (GridService.Cells[1,IntCount]<>'') and (GridService.Cells[1,IntCount]<>'0') then
          Intservice:=SToInt(GridService.Cells[1,IntCount])*SToInt(GridService.Cells[2,IntCount])
        else if (GridService.Cells[2,IntCount]<>'1') then
          Intservice:=SToInt(GridService.Cells[2,IntCount]);
        IntTotalService:=IntTotalService+IntService;
      end;
    end;
    SubTotal.Text:=IToCurr(IntTotalAll);
    IntDiscPrice:=SToInt(DiscountPrice.Text);
    IntDiscPerc:=SToInt(DiscountPercent.Text);
    if not(Initiation) then begin
      Discount.Text:=IToCurr(IntDiscPrice+(IntTotalAll*(IntDiscPerc/100)));
      Total.Text:=IToCurr(IntTotalAll-IntDiscPrice-(IntTotalAll*(IntDiscPerc/100))+IntTotalService+IntAmountAddDays);
    end;
  end;
  Main.M_Normal;
end;

procedure TOrderForm.SetCustomerId(Customer_Id:String);
var Qry:TADOQuery;
    StrQry,StrContactId:String;
    IntCount:Integer;
    IsContactSingle:Boolean;
begin
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
      CustomerDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['title']<>NULL then CustomerDisp.Text:=Qry.FieldValues['title']+' '+CustomerDisp.Text;
      if Qry.FieldValues['alias']<>NULL then CustomerDisp.Text:=CustomerDisp.Text+' ('+Qry.FieldValues['alias']+')';
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+IntToStr(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
    end;
    Qry.Close;
    IsContactSingle:=False;
    StrQry:='EXEC GetContactPersonList '+QuotedStr(Customer_Id)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
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

procedure TOrderForm.SetContactId(Contact_Id:String);
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
      if Qry.FieldValues['address']<>NULL then begin
        if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+Qry.FieldValues['zip']
        else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  DiscountCN.SetFocus;
end;

procedure TOrderForm.SetContractId(Contract_Id:String);
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
  Calculate;
end;

procedure TOrderForm.SetOfferingId(Offering_Id:String);
var Qry:TADOQuery;
    StrQry,StrContactId:String;
    IntCount:Integer;
    IsContactSingle:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLeadOrderDetail '+QuotedStr(Offering_Id)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      MessageBox(Handle,PChar('Tekan Insert/F2 pada baris pesanan untuk mengambil data Penawaran'+Chr(13)+Chr(13)+'Tekan Delete/F3 pada baris pesanan untuk menghapus data Penawaran'),'Pesanan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      OfferingId.Text:=Qry.FieldValues['lead_order_id'];
      if Qry.FieldValues['customer_id']<>NULL then begin
        CustomerId.Text:=Qry.FieldValues['customer_id'];
        if Qry.FieldValues['customer_name']<>NULL then CustomerDisp.Text:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
        if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
        PanelCariCustomer.Enabled:=False;
      end else begin
        MessageBox(Handle,'Prospek Belum masuk ke data Customer','Pesanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
        PanelCariKontak.Enabled:=False;
      end;
      if Qry.FieldValues['cust_contract_id']<>NULL then begin
        ContractId.Text:=Qry.FieldValues['cust_contract_id'];
        PanelCariKontrak.Enabled:=False;
      end;
      if Qry.FieldValues['group_name']<>NULL then begin
        Group.Text:=Qry.FieldValues['group_name'];
      end;
      if SalesPerson.Style=csSimple then
        SalesPerson.Text:=Qry.FieldValues['sales_name']
      else
        SalesPerson.ItemIndex:=SalesPerson.Items.IndexOf(Qry.FieldValues['sales_name']);
        if Qry.FieldValues['discount_price']<>NULL then begin
          DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']);
          DiscntPrice:=Qry.FieldValues['discount_price'];
        end;
        if Qry.FieldValues['discount_percent']<>NULL then begin
          DiscountPercent.Text:=Qry.FieldValues['discount_percent'];
          DiscntPercent:=Qry.FieldValues['discount_percent'];
        end;
        if (Qry.FieldValues['contract_discount_price']<>NULL) OR (Qry.FieldValues['contract_discount_percent']<>NULL) then
          if (Qry.FieldValues['contract_discount_price']<>'0') OR (Qry.FieldValues['contract_discount_percent']<>'0') then PanelDiscount.Enabled:=False;
        if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetLeadOrderServiceList '+QuotedStr(Offering_Id)+';';
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
      else GridService.Cells[2,IntCount]:=IToCurr(Qry.FieldValues['transaction_amount']);
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
  if ContractId.Text<>'' then RefreshProduct;
end;

procedure TOrderForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TOrderForm.StrGridSelectCell(Sender: TObject; ACol,
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
        1:if not(IsLock) then with Product do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+70;
            Height := (R.Bottom + 1) - R.Top+10;
            RefreshProduct(StrGrid.Cells[20,ARow]);
            ItemIndex:=Items.IndexOf(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        2:with Details do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        3:with PickUp do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        4:if not(IsLock) then with DateStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        5:if not(IsLock) then with TimeStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        6:if not(IsLock) then with DateFinish do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
{        7:with TimeStandby do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
}        9:if not(IsLock) then with Units do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        10:if StrGrid.Cells[16,ARow]<>'1' then
            if (StrGrid.Cells[11,ARow]='0') or (StrGrid.Cells[11,ARow]='') then with DiscountDetailPrice do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        11:if StrGrid.Cells[16,ARow]<>'1' then
             if (StrGrid.Cells[10,ARow]='0') or (StrGrid.Cells[10,ARow]='') then with DiscountDetailPercent do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        12:with DetailRemark do begin
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
  end else if (IsPriceEdit) then begin
    if (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        1:with Product do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+70;
            Height := (R.Bottom + 1) - R.Top+10;
            ItemIndex:=Items.IndexOf(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        2://if Trim(StrGrid.Cells[ACol,ARow])='' then
          with Details do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        3://if Trim(StrGrid.Cells[ACol,ARow])='' then
          with PickUp do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+40;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        4:if Trim(StrGrid.Cells[ACol,ARow])='' then with DateStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        5:if Trim(StrGrid.Cells[ACol,ARow])='' then with TimeStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        6:if Trim(StrGrid.Cells[ACol,ARow])='' then with DateFinish do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        9:if (StrGrid.Cells[9,ARow]>StrGrid.Cells[19,ARow]) then with Units do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        10:if StrGrid.Cells[16,ARow]<>'1' then
             if (StrGrid.Cells[11,ARow]='0') or (StrGrid.Cells[11,ARow]='') then with DiscountDetailPrice do begin
               Left:=R.Left + 1;
               Top := R.Top + 1;
               Width := (R.Right + 1) - R.Left;
               Height := (R.Bottom + 1) - R.Top;
               Text:=ToString(StrGrid.Cells[ACol,ARow]);
               Visible:= True;
               BringToFront;
               SetFocus;
             end;
        11:if StrGrid.Cells[16,ARow]<>'1' then
             if (StrGrid.Cells[10,ARow]='0') or (StrGrid.Cells[10,ARow]='') then with DiscountDetailPercent do begin
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
  if (UpperCase(FormRequest)='RESERVED-CREATE') or (UpperCase(FormRequest)='RESERVED-FORCEADD') then begin
    if (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      if ACol=0 then begin
        with CheckSelect do begin
          Left:=R.Left + 1;
          Top := R.Top + 1;
          Width := (R.Right + 1) - R.Left;
          Height := (R.Bottom + 1) - R.Top;
          if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
          Visible:= True;
          BringToFront;
          SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TOrderForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrLeadOrderId,StrCustomerId,StrContactId,StrContractId,StrDiscountPrice,StrDiscountPercent,StrRemark:String;
    StrProductPriceId,StrDestination,StrPickup,StrDateStart,StrDateFinish,StrTimeStart,StrTimeStartS,StrTimeStandby,StrSeat,StrPackage,StrReserver:String;
    StrPriceWeekday,StrPriceWeekend,StrTotal,StrStatus,StrUnits,StrRevision,StrQuantity,StrAmount,StrDiscountCNPercent,StrIsService,StrServiceTypeId:String;
    StrGuide,StrGuideCellular,StrCustomerorderDetailId,StrGroup,StrSales,StrTotalAddDay,StrDiscountAmount,StrPriceOverday,StrFullDay:String;
    StrTransId,StrEMsg,StrCompanyId,StrLocationId,StrTransId2,StrTransIds,StrToTimes,StrBatchId,StrVehicleId,StrEmployeeId,StrReservedId:String;
    IntCount,IntCount2,DiscPercent,DiscPrice,TotalUnit,PrintBooking:Integer;
    IsOk,IsAuth,IsBooked,IsWaitingList:Boolean;
    VhcArr:Array of String;
begin
  IsOk:=True;
  PrintBooking:=0;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
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

  //service_type_id
  if IsService.Checked then begin
    if cb_pilihan_service.ItemIndex=-1 then begin
      IsOk := False;
    end;
  end;

  if (CustomerId.Text<>'') and ((Total.Text<>'')) and (IsOk) then begin
    IsAuth:=True;
    IsWaitingList:=False;
    AuthorizedForm.FormId:='130806';
    DiscPrice:=0;
    DiscPercent:=0;
    if Status.Checked=False then begin
      for IntCount:=2 to StrGrid.RowCount-1 do
        if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[6,IntCount]<>'')
        and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') and (StrGrid.Cells[16,IntCount]<>'1') then begin
          if Trim(StrGrid.Cells[10,IntCount])<>'' then if DiscPrice<StrToInt(ToString(StrGrid.Cells[10,IntCount])) then DiscPrice:=StrToInt(ToString(StrGrid.Cells[10,IntCount])) ;
          if Trim(StrGrid.Cells[11,IntCount])<>'' then if DiscPercent<StrToInt(StrGrid.Cells[11,IntCount]) then  DiscPercent:=StrToInt(StrGrid.Cells[11,IntCount]);
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
      end;
      if IsAuth=False then StrEMsg:='Tidak dapat mengotorisasi diskon'+Chr(13)+Chr(13)+'Silahkan Coba Hubungi Atasan Anda';
    end;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    Main.WriteLog('Form Save:OrderForm',1);
    if Main.OpenDb then begin
      if (Bookdirect.Checked=True) AND (OrdrId<>'') then begin
        StrQry:='SELECT *  FROM wh_reserved_order  a '+
                'INNER JOIN wh_reserved_order_detail b ON b.reserved_order_id=a.reserved_order_id '+
                'INNER JOIN wh_vhc_trans  c ON c.vhc_trans_id=b.vhc_trans_id '+
                'WHERE (a.customer_order_id='+QuotedStr(OrdrId)+') AND (c.cancel IS NULL) AND (a.status=1);';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          IsAuth:=False;
          StrEMsg:=StrEMsg+'Surat Jalan sudah dibentuk';
        end;
        Qry.Close;
      end;
    FreeAndNil(Qry);
    Main.M_Normal;
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
        StrSales:=QuotedStr(SalesPerson.Text);
        if OfferingId.Text<>'' then StrLeadOrderId:=QuotedStr(OfferingId.Text) else StrLeadOrderId:='NULL';
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
        if IsService.Checked then begin
          StrIsService:='1';
          StrServiceTypeId:=IntToStr(cb_pilihan_service.itemIndex+1);
        end else begin
          StrIsService:='0';
          StrServiceTypeId:='0';
        end;

        if (OrderId.Text<>'')  then begin
          StrTransId:=OrdrId;
          StrQry:='UPDATE wh_customer_order SET customer_id='+StrCustomerId+',contact_person_id='+StrContactId+
                ',cust_contract_id='+StrContractId+',group_name='+StrGroup+',discount_price='+StrDiscountPrice+
                ',discount_percent='+StrDiscountPercent+',discount_cn_percent='+StrDiscountCNPercent+
                ',discount_amount='+StrDiscountAmount+',field_contact='+StrGuide+',field_contact_cellular_no='+StrGuideCellular+
                ',total='+StrTotal+',remark='+StrRemark+',status='+StrStatus+',rev='+StrRevision+
                ',is_service='+StrIsService+', service_type_id='+StrServiceTypeId+
                ',sales_id=dbo.GetUserId('+StrSales+')'+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE customer_order_id='+QuotedStr(StrTransId)+';';
          if not(IsLock) then begin
            if StrStatus='1' then begin
              StrQry:=StrQry+' UPDATE wh_customer_order_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                      ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
              StrQry:=StrQry+' UPDATE wh_customer_order_service_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                      ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
              if Bookdirect.Checked=True then
                StrQry:=StrQry+' UPDATE wh_reserved_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
            end else begin
                StrQry:=StrQry+' UPDATE wh_reserved_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (customer_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
            end;
          end else begin
            if StrStatus='1' then begin


            end else begin
              IsOk:=False;
              MessageBox(Handle,PChar('   Penjadwalan Terkunci'+Chr(13)+'Silahkan cek ke Operasional'),'Surat Pesanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND)
            end;
          end;
        end else begin
          StrQry:='SELECT RIGHT(MAX(customer_order_id),4) AS max_id FROM wh_customer_order '+
                  'WHERE customer_order_id  LIKE '+QuotedStr('CO'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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
          StrTransId:='CO'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
          StrQry:='INSERT INTO wh_customer_order (customer_order_id,company_id,location_id,lead_order_id'+
                  ',customer_id,contact_person_id,cust_contract_id,group_name,sales_id,discount_price,discount_percent'+
                  ',discount_amount,total,discount_cn_percent,field_contact,field_contact_cellular_no,remark,is_service,service_type_id,update_user)'+
                  ' VALUES '+
                  '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrLeadOrderId+
                  ','+StrCustomerId+','+StrContactId+','+StrContractId+','+StrGroup+',dbo.GetUserId('+StrSales+')'+
                  ','+StrDiscountPrice+','+StrDiscountPercent+','+StrDiscountAmount+','+StrTotal+','+StrDiscountCNPercent+
                  ','+StrGuide+','+StrGuideCellular+','+StrRemark+','+StrIsService+','+StrServiceTypeId+','+QuotedStr(User)+');';
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
          for IntCount:=2 to StrGrid.RowCount-1 do
            if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[5,IntCount]<>'')
            and (StrGrid.Cells[6,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') then begin
              Inc(IntCount2);
              StrTransIds:=Format('%.*d',[6,StrToInt(StrTransId2)+IntCount2]);
              StrTransIds:='COR'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransIds;
              StrProductPriceId:=QuotedStr(StrGrid.Cells[20,IntCount]);
              if Trim(StrGrid.Cells[2,IntCount])<>'' then StrDestination:=QuotedStr(StrGrid.Cells[2,IntCount]) else IsOk:=False;
              if Trim(StrGrid.Cells[3,IntCount])<>'' then StrPickup:=QuotedStr(Trim(StrGrid.Cells[3,IntCount])) else StrPickup:='NULL';
              if Trim(StrGrid.Cells[4,IntCount])<>'' then StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[4,IntCount])));
              if Trim(StrGrid.Cells[5,IntCount])<>'' then StrTimeStart:=QuotedStr(StrGrid.Cells[5,IntCount]);
              if Trim(StrGrid.Cells[6,IntCount])<>'' then StrDateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[6,IntCount])));
//              if Trim(StrGrid.Cells[7,IntCount])<>'' then StrTimeStandby:=QuotedStr(StrGrid.Cells[7,IntCount]);
              StrTimeStandby:='NULL';
              StrUnits:=StrGrid.Cells[9,IntCount];
              if Trim(StrGrid.Cells[10,IntCount])<>'' then StrDiscountPrice:=QuotedStr(ToString(StrGrid.Cells[10,IntCount])) else StrDiscountPrice:='0';
              if Trim(StrGrid.Cells[11,IntCount])<>'' then StrDiscountPercent:=QuotedStr(StrGrid.Cells[11,IntCount]) else StrDiscountPercent:='0';
              if Trim(StrGrid.Cells[12,IntCount])<>'' then StrRemark:=QuotedStr(StrGrid.Cells[12,IntCount]) else StrRemark:='NULL';
              StrPriceWeekday:=QuotedStr(ToString(StrGrid.Cells[13,IntCount]));
              StrPriceWeekend:=QuotedStr(ToString(StrGrid.Cells[14,IntCount]));
              StrTotal:=QuotedStr(ToString(StrGrid.Cells[15,IntCount]));
              if Trim(StrGrid.Cells[17,IntCount])<>'' then StrLeadOrderId:=QuotedStr(StrGrid.Cells[17,IntCount]) else StrLeadOrderId:='NULL';
              StrCustomerOrderDetailId:=StrGrid.Cells[18,IntCount];
              if StrGrid.Cells[23,IntCount]<>'0' then StrTotalAddDay:=StrGrid.Cells[23,IntCount] else StrTotalAddDay:='0';
              if StrGrid.Cells[22,IntCount]<>'0' then StrPriceOverday:=StrGrid.Cells[22,IntCount] else StrPriceOverday:='0';
              if not(IsLock) then begin
                StrQry:='INSERT INTO wh_customer_order_detail (customer_order_detail_id,customer_order_id,lead_order_detail_id,product_price_id'+
                        ',depart_location_id,from_date,to_date,from_time,route,pickup_point,standby_time'+
                        ',price_weekday,price_weekend,price_overday,units,total,total_addday,discount_price,discount_percent'+
                        ',remark,update_user) VALUES '+
                        '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+StrLeadOrderId+','+StrProductPriceId+
                        ','+StrLocationId+','+StrDateStart+','+StrDateFinish+','+StrTimeStart+','+StrDestination+
                        ','+StrPickup+','+StrTimeStandby+','+StrPriceWeekday+','+StrPriceWeekend+','+StrPriceOverday+
                        ','+StrUnits+','+StrTotal+','+StrTotalAddDay+','+StrDiscountPrice+','+StrDiscountPercent+
                        ','+StrRemark+','+QuotedStr(User)+');';
              if (StrCustomerorderDetailId<>'') and (Bookdirect.Checked=False) then
                  StrQry:=StrQry+' UPDATE wh_reserved_order_detail_detail SET customer_order_detail_id='+QuotedStr(StrTransIds)+
                          ' WHERE customer_order_detail_id='+QuotedStr(StrCustomerOrderDetailId)+';';
              end else begin
                StrQry:='UPDATE wh_customer_order_detail SET route='+StrDestination+',pickup_point='+StrPickup+
                        ',total='+StrTotal+',discount_price='+StrDiscountPrice+',discount_percent='+StrDiscountPercent+
                        ',remark='+StrRemark+',update_user='+QuotedStr(User)+
                        ' WHERE customer_order_detail_id='+QuotedStr(StrCustomerOrderDetailId)+';';
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
              if IsOk then StrGrid.Cells[18,IntCount]:=StrTransIds;
            end;
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
               RePrint(StrTransId);
            end;
          end else
            MessageBox(Handle,'Pesanan Berhasil Disimpan','Surat Pesanan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND)
        end else begin
          Main.TransRollback;
          Main.WriteLog('Form Save : Fail='+StrEMsg,1);
          MessageBox(Handle,PChar('Pesanan Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Surat Pesanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          EnableInput;
        end;
        if not(IsLock) then begin
          if Bookdirect.Checked=True then begin
            IsBooked:=True;
            if (StrStatus='1') and (IsOk) then begin
              try
                if Package.Checked then StrPackage:='1' else StrPackage:='NULL';


                StrReserver:='dbo.GetUsername('+QuotedStr(SalesPerson.Text)+')';
                StrQry:='SELECT RIGHT(MAX(reserved_order_id),4) AS max_id FROM wh_reserved_order '+
                        'WHERE reserved_order_id  LIKE '+QuotedStr('RES'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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
                  StrTransId:='RES'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                              FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
                StrQry:='INSERT INTO wh_reserved_order (reserved_order_id,customer_order_id,company_id,location_id'+
                        ',customer_id,field_contact,field_contact_cellular_no,group_name,daily_package,submit_user,update_user)'+
                          ' VALUES '+
                        '('+QuotedStr(StrTransId)+','+QuotedStr(OrdrId)+','+StrCompanyId+','+StrLocationId+
                        ','+StrCustomerId+','+StrGuide+','+StrGuideCellular+','+StrGroup+','+StrPackage+','+StrReserver+','+QuotedStr(User)+');';
                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,4);
                Qry.SQL.Add(StrQry);
                try
                  Qry.ExecSQL;
                except
                  on E:Exception do begin
                    IsOk:=False;
                    IsBooked:=False;
                    StrEMsg:=StrEMsg+E.Message;
                  end;
                end;
                StrQry:='SELECT RIGHT(MAX(reserved_order_detail_id),5) AS max_id FROM wh_reserved_order_detail '+
                        'WHERE reserved_order_detail_id  LIKE '+QuotedStr('RESR'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                        FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'_____')+';';
                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,2);
                Qry.SQL.Add(StrQry);
                Qry.Open;
                if Qry.FieldValues['max_id']<>NULL then begin
                  StrTransIds:=Qry.FieldValues['max_id'];
                  StrTransIds:=Format('%.*d',[5,StrToInt(StrTransIds)+1]);
                  Qry.Close;
                  Qry.SQL.Clear;
                end else
                  StrTransIds:='00001';
                IntCount2:=0;
                for IntCount:=2 to StrGrid.RowCount-1 do
                  if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[5,IntCount]<>'')
                  and (StrGrid.Cells[6,IntCount]<>'') and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') then begin
                    TotalUnit:=SToInt(StrGrid.Cells[9,IntCount]);
                    Repeat
                      StrTransId2:=Format('%.*d',[5,StrToInt(StrTransIds)+IntCount2+1]);
                      StrTransId2:='RESR'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                                   FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId2;
                      StrProductPriceId:=QuotedStr(StrGrid.Cells[20,IntCount]);
                      if Trim(StrGrid.Cells[2,IntCount])<>'' then StrDestination:=QuotedStr(StrGrid.Cells[2,IntCount]) else IsOk:=False;
                      if Trim(StrGrid.Cells[3,IntCount])<>'' then StrPickup:=QuotedStr(Trim(StrGrid.Cells[3,IntCount])) else StrPickup:='NULL';
                      if Trim(StrGrid.Cells[4,IntCount])<>'' then StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[4,IntCount])));
                      if Trim(StrGrid.Cells[5,IntCount])<>'' then StrTimeStart:=QuotedStr(StrGrid.Cells[5,IntCount]);
                      if Trim(StrGrid.Cells[5,IntCount])<>'' then StrTimeStandby:=QuotedStr(StrGrid.Cells[5,IntCount]);
                      if Trim(StrGrid.Cells[6,IntCount])<>'' then StrDateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[6,IntCount])));
                      if Trim(StrGrid.Cells[12,IntCount])<>'' then StrRemark:=QuotedStr(StrGrid.Cells[12,IntCount]) else StrRemark:='NULL';
                      StrCustomerOrderDetailId:=StrGrid.Cells[18,IntCount];
                      StrSeat:=StrGrid.Cells[24,IntCount];
                      if StrGrid.Cells[25,IntCount]='2' then StrToTimes:=QuotedStr('23:59')
                        else if StrToInt(StrGrid.Cells[26,IntCount])+StrToInt(FormatDateTime('HH',StrToTime(StrGrid.Cells[5,IntCount])))>23 then StrToTimes:=QuotedStr('23:59')
                      else StrToTimes:=QuotedStr(FormatDateTime('HH:nn',StrToTime(StrGrid.Cells[5,IntCount])+EncodeTime(StrToInt(StrGrid.Cells[26,IntCount]),0,0,0)));
                      StrFullDay:=StrGrid.Cells[25,IntCount];
                      StrBatchId:=StrGrid.Cells[27,IntCount];
                      if StrTimeStart<>'00:00' then StrTimeStartS:=',@FromTime='+StrTimeStart else StrTimeStartS:='';
                      StrQry:='EXEC GetVhcAvail '+StrLocationId+','+StrCompanyId+',@BatchId='+StrBatchId+',@Seats='+StrSeat+',@FromDate='+StrDateStart+',@ToDate='+StrDateFinish+',@ProductPriceId='+StrProductPriceId+StrTimeStartS;
                      Qry.SQL.Clear;
                      Main.WriteLog('SQL :'+StrQry,2);
                      Qry.SQL.Add(StrQry);
                      Qry.Open;
                      if Qry.RecordCount>0 then begin
                        StrVehicleId:=QuotedStr(Qry.FieldValues['vehicle_id']);
                        StrEmployeeId:=QuotedStr(Qry.FieldValues['employee_id']);
                      end else begin
                        IsOk:=False;
                        if IsWaitingListEnabled=True then begin
                          {Jika Kosong Masukkan waiting list ?}
                          if (MessageBox(0,PChar('Armada Tidak Tersedia'+Chr(13)+'Tambahkan Ke Waiting List ?'),'Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
                            IsWaitingList:=True;
                          end;
                        end else begin
                          StrEMsg:=StrEMsg+'         Armada Tidak Tersedia'+Chr(13)+'       Silahkan Ganti Armada'+Chr(13)+ 'Atau Lakukan penjadwalan Manual';
                        end;
                      end;
                      Qry.Close;
                      if (IsOk) then begin
                        StrQry:='INSERT INTO wh_reserved_order_detail (reserved_order_detail_id,reserved_order_id'+
                                ',product_price_id,from_date,to_date,from_time,to_time,standby_time,route,pickup_point'+
                                ',vehicle_id,employee_id,full_day,remark,update_user) VALUES '+
                                '('+QuotedStr(StrTransId2)+','+QuotedStr(StrTransId)+','+StrProductPriceId+
                                ','+StrDateStart+','+StrDateFinish+','+StrTimeStart+','+StrToTimes+','+StrTimeStandby+
                                ','+StrDestination+','+StrPickup+','+StrVehicleId+','+StrEmployeeId+
                                ','+StrFullDay+','+StrRemark+','+QuotedStr(User)+');';
                        Qry.SQL.Clear;
                        Qry.SQL.Add(StrQry);
                        try
                          Qry.ExecSQL;
                        except
                          on E:Exception do begin
                            IsOk:=False;
                            IsBooked:=False;
                            StrEMsg:=StrEMsg+E.Message;
                          end;
                        end;
                      end;
                      if IsOk then begin
                        StrQry:='INSERT INTO wh_reserved_order_detail_detail (reserved_order_detail_id,reserved_order_id'+
                                ',customer_order_detail_id,update_user) VALUES '+
                                '('+QuotedStr(StrTransId2)+','+QuotedStr(StrTransId)+','+QuotedStr(StrCustomerorderDetailId)+
                                ','+QuotedStr(User)+');';
                        Main.WriteLog('SQL :'+StrQry,4);
                        Qry.SQL.Clear;
                        Qry.SQL.Add(StrQry);
                        try
                          Qry.ExecSQL;
                        except
                          on E:Exception do begin
                            IsOk:=False;
                            IsBooked:=False;
                            StrEMsg:=StrEMsg+E.Message;
                          end;
                        end;
                        Dec(TotalUnit);
                      end;
                      Inc(IntCount2);
                    until (TotalUnit<1) or (IsOk=False);
                  end;
                  StrReservedId:=StrTransId;
              except
                On E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=StrEMsg+E.Message;
                end;
              end;
            end;
{ Script Armada kosong dan masuk waiting list }
            if (IsWaitingList=True) then begin
              StrQry:='SELECT RIGHT(MAX(customer_order_id),4) AS max_id FROM wh_customer_order '+
                      'WHERE customer_order_id  LIKE '+QuotedStr('WL'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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
              StrTransId:='WL'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                          FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
              StrQry:='UPDATE wh_customer_order SET customer_order_id='+QuotedStr(StrTransId)+',status=2'+
                      ' WHERE (customer_order_id='+QuotedStr(OrdrId)+') AND (status=1);';
              StrQry:=StrQry+'UPDATE wh_customer_order_detail SET customer_order_id='+QuotedStr(StrTransId)+
                      ' WHERE (customer_order_id='+QuotedStr(OrdrId)+') AND (status=1);';
              Main.WriteLog('SQL :'+StrQry,4);
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
{Akhir Script}
            if (IsOk) and (StrStatus='1') then begin
              StrQry:='UPDATE wh_customer_order SET complete=1,update_time=GETDATE(),update_user='+QuotedStr(User)+
                      ' WHERE (customer_order_id='+QuotedStr(OrdrId)+') AND (status=1);';
              Main.WriteLog('SQL :'+StrQry,4);
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
              PrintBooking:=MessageBox(Handle,PChar('Penjadwalan Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)
            end else begin
              if IsBooked=False then begin
                StrQry:='';
//              StrQry:='UPDATE wh_customer_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
//                      ' WHERE customer_order_id='+QuotedStr(OrdrId)+';';
                StrQry:='UPDATE wh_reserved_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (reserved_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
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
                StrQry:='UPDATE wh_customer_order SET complete=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (customer_order_id='+QuotedStr(OrdrId)+') AND (status=1);';
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
              Main.WriteLog('Form Save : Fail='+StrEMsg,1);
              MessageBox(Handle,PChar('Penjadwalan Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Surat Pesanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              EnableInput;
            end;
          end;
        end else begin

        end;
      end;
      FreeAndNil(Qry)
    end else
      MessageBox(Handle,PChar(StrEMsg),'Surat Pesanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  end else
    MessageBox(Handle,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Surat Pesanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  Main.CloseDb;
  Main.M_Normal;
  if PrintBooking=1 then begin
    BookingForm:=TBookingForm.Create(Self,'',False,'Order-Print');
    BookingForm.RePrint(StrReservedId);
  end;
end;

procedure TOrderForm.FormShow(Sender: TObject);
begin
  FormLine:=11;
  IsService.Checked := True;
  IsServiceClick(Nil);
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  if (IsBookDirect=True) AND (UpperCase(FormRequest)<>'PRICE-REVISED') then begin
    PanelBookDirect.Enabled:=False;
    Bookdirect.Checked:=True;
  end;
  if (UpperCase(FormRequest)='RESERVED-CREATE') OR (UpperCase(FormRequest)='RESERVED-FORCEADD') then begin
    StrGrid.ColWidths[0]:=20;
    StrGrid.ColWidths[12]:=110;
//    ScheduleAdd.Visible:=True;
  end else begin
   ScheduleAdd.Visible:=False;
  end;
  if OrdrId<>'' then begin
    if LeftStr(UpperCase(FormRequest),11)='WAITINGLIST' then begin
      Caption:='Data Tunggu';
      LabelNo.Caption:='No Tunggu';
      GroupOtorisasi.Visible:=False;
    end else begin
      Caption:='Data Pesanan';
      LabelNo.Caption:='No Pesanan';
      GroupOtorisasi.Visible:=True;
    end;
    PanelDiscount.Enabled:=True;
    RefreshService;
    LoadData;
    RefreshGrid;
    if not(IsInput) then begin
      PanelBookDirect.Visible:=False;
      PanelBook.Visible:=False;
      DisableInput;
    end;
    Bersihkan.Enabled:=False;
    if UpperCase(FormRequest)='PRICE-REVISED' then begin
      PanelBookDirect.Visible:=False;
      PanelBook.Visible:=False;
      IsInput:=False;
      IsInputGrid:=False;
      IsPriceEdit:=True;
      PanelOffering.Enabled:=False;
      PanelCariCustomer.Enabled:=False;
      PanelCariKontak.Enabled:=False;
      GroupBatal.Enabled:=False;
      GroupIsService.Enabled:=False;
    end;
    if IsLock then begin
       LockButton.Visible:=True;
    end;
  end else begin
    OrderDate.Text:=Main.Status.Panels.Items[0].Text;
    SalesPerson.Text:=FullName;
  end;
  RefreshBook;
  Initiation:=False;
end;

procedure TOrderForm.DisableInput;
begin
  IsInputGrid:=False;
  IsPriceEdit:=False;
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupDetail.Enabled:=False;
  GroupBatal.Enabled:=False;
  GroupIsService.Enabled:=False;
  GroupSalesPerson.Enabled:=False;
  Remark.Enabled:=False;
end;

procedure TOrderForm.EnableInput;
begin
  IsInputGrid:=True;
  Simpan.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupDetail.Enabled:=True;
  GroupBatal.Enabled:=True;
  GroupIsService.Enabled:=True;
  GroupSalesPerson.Enabled:=True;
  Remark.Enabled:=True;
end;

procedure TOrderForm.GetOfferingDetail;
var IntCount:Integer;
begin
  if IsInput then
    if OfferingId.Text<>'' then OfferingForm:=TOfferingForm.Create(Self,OfferingId.Text,False,'Order-Create');
  if IsPriceEdit then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TOrderForm.DeleteOfferingDetail;
var IntCount:Integer;
begin
  if (IntRow>MinRowGrid) and (IsInput) then begin
    if MessageBox(Handle,'Mau Menghapus Produk baris ini ?','Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
      for IntCount:=0 to StrGrid.ColCount-1  do StrGrid.Cells[IntCount,IntRow]:='';
      if Product.Focused then Product.ItemIndex:=Product.Items.IndexOf(' ');  
    end;
  end;
end;

procedure TOrderForm.PreparePrint;
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
    Qry.Close;
    ppHeaderMemo.Lines.Clear;
    StrQry:='EXEC GetCompanyLocationDetailList '+CompanyId +','+LocationId+','+QuotedStr('Confirmation-HD')+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not Qry.Eof do begin
      if Qry.FieldValues['value_str']<>NULL then ppHeaderMemo.Lines.Add(Qry.FieldValues['value_str'])
      else ppHeaderMemo.Lines.Add('');
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
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
procedure TOrderForm.RePrint(Order_Id:String);
var StrQry,StrName,StrValue,StrDate,StrLine,StrSalesId:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntCount,IntLineCount:Integer;
    JPG:TJPEGImage;
    StmImage:TMemoryStream;
begin
  IsToFile:=Main.MyMessageDlg('Mau dicetak ke?',mtInformation,[mbYes,mbNo,mbCancel],['Kertas','Kop surat','e-mail'],'Tujuan');
  RePrintForm.ReportName:='Order Form';
  RePrintForm.ReportId:=Order_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    ppRemark.Lines.Clear;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='EXEC GetCustomerOrderDetail  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
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
        if Qry.FieldValues['lock_order']='1' then ppLockSign.Visible:=True;
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
      StrQry:='SELECT * FROM wh_user_signature WHERE (user_id='+QuotedStr(StrSalesId)+') AND (company_id='+CompanyId+') ORDER BY user_signature_id DESC;';
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
      if IntLineCount<=FormLine then StrLine:=',@LineRequest='+IntToStr(FormLine) else StrLine:=',@LineRequest=1';
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

procedure TOrderForm.ProductExit(Sender: TObject);
var IntCount:Integer;
begin
  if Product.Text<>'' then begin
    StrGrid.Cells[1,IntRow]:=Product.Text;
    Product.Text:='';
  end;
  Product.Visible:=False;
  StrGrid.SetFocus;
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) and (not IsPriceEdit) then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  RefreshProduct;
  Calculate;
end;

procedure TOrderForm.DetailsExit(Sender: TObject);
var IntCount:Integer;
begin
//  if Details.Text<>'' then begin
  StrGrid.Cells[2,IntRow]:=Details.Text;
//  end;
  Details.Visible:=False;
  StrGrid.SetFocus;
  Details.Text:='';
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  Calculate;
end;

procedure TOrderForm.PickUpExit(Sender: TObject);
begin
//  if PickUp.Text<>'' then begin
  StrGrid.Cells[3,IntRow]:=PickUp.Text;
//  end;
  PickUp.Visible:=False;
  StrGrid.SetFocus;
  PickUp.Text:='';
end;

procedure TOrderForm.DateStartExit(Sender: TObject);
begin
  if (IsPriceEdit=True) then begin
    if (DateStart.Date>=(IncDay(Today,-30))) then begin
      StrGrid.Cells[4,IntRow]:=FormatDateTime('dd/mm/yy',DateStart.Date);
    end;
  end else if DateStart.Date>=Today then begin
    StrGrid.Cells[4,IntRow]:=FormatDateTime('dd/mm/yy',DateStart.Date);
    DateStart.Date:=IncDay(Now(),-1);
  end;
  DateStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOrderForm.TimeStartExit(Sender: TObject);
begin
  if Trim(TimeStart.Text)<>':' then begin
    StrGrid.Cells[5,IntRow]:=TimeStart.Text;
    TimeStart.Text:='';
  end;
  TimeStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOrderForm.DateFinishExit(Sender: TObject);
begin
  if (IsPriceEdit=True) then begin
    if (DateFinish.Date>=(IncDay(Today,-30))) then begin
      StrGrid.Cells[6,IntRow]:=FormatDateTime('dd/mm/yy',DateFinish.Date);
    end;
  end else if DateFinish.Date>=Today then begin
    StrGrid.Cells[6,IntRow]:=FormatDateTime('dd/mm/yy',DateFinish.Date);
    DateFinish.Date:=IncDay(Now(),-1);
  end;
  DateFinish.Visible:=False;
  StrGrid.SetFocus;
  Calculate;
end;

procedure TOrderForm.TimeStandbyExit(Sender: TObject);
begin
  if Trim(TimeStandby.Text)<>':' then begin
    StrGrid.Cells[7,IntRow]:=TimeStandby.Text;
    TimeStandby.Text:='';
  end;
  TimeStandby.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOrderForm.UnitsExit(Sender: TObject);
begin
  if Units.Text<>'' then begin
    StrGrid.Cells[9,IntRow]:=Units.Text;
    Units.Text:='';
  end;
  Units.Visible:=False;
  StrGrid.SetFocus;
  Calculate;
end;

procedure TOrderForm.DiscountDetailPriceExit(Sender: TObject);
begin
  if DiscountDetailPrice.Text='' then begin
    DiscountDetailPrice.Text:='0';
  end;
  StrGrid.Cells[10,IntRow]:=SToCurr(DiscountDetailPrice.Text);
  DiscountDetailPrice.Visible:=False;
  StrGrid.SetFocus;
  DiscountDetailPrice.Text:='';
  Calculate;
end;

procedure TOrderForm.DiscountDetailPercentExit(Sender: TObject);
begin
  if DiscountDetailPercent.Text='' then begin
    DiscountDetailPercent.Text:='0';
  end;
    StrGrid.Cells[11,IntRow]:=DiscountDetailPercent.Text;
  DiscountDetailPercent.Visible:=False;
  StrGrid.SetFocus;
  DiscountDetailPercent.Text:='';
  Calculate;
end;

procedure TOrderForm.DetailRemarkExit(Sender: TObject);
var IntCount:Integer;
begin
//  if DetailRemark.Text<>'' then begin
    StrGrid.Cells[12,IntRow]:=DetailRemark.Text;
//  end;
  DetailRemark.Visible:=False;
  StrGrid.SetFocus;
  DetailRemark.Text:='';
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) and (StrGrid.Cells[1,IntRow]<>'') and (not IsPriceEdit) then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TOrderForm.ProductChange(Sender: TObject);
begin
  CheckProduct;
end;

procedure TOrderForm.ProductKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    ProductExit(nil);
    StrGrid.Col:=2;
  end;
  Calculate;
end;

procedure TOrderForm.DetailsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DetailsExit(nil);
    StrGrid.Col:=3;
  end;
end;

procedure TOrderForm.PickUpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    PickUpExit(nil);
    StrGrid.Col:=4;
  end;
end;

procedure TOrderForm.DateStartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateStartExit(nil);
    StrGrid.Col:=5;
  end;
end;

procedure TOrderForm.TimeStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStart.Text))>4) then begin
    TimeStartExit(nil);
    StrGrid.Col:=6;
  end;
end;

procedure TOrderForm.DateFinishKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateFinishExit(nil);
    StrGrid.Col:=8;
  end;
end;

procedure TOrderForm.TimeStandbyKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStandby.Text))>4)  then begin
    TimeStandbyExit(nil);
    StrGrid.Col:=9;
  end;
end;

procedure TOrderForm.UnitsKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPercentExit(nil);
    StrGrid.Col:=10;
  end;
end;

procedure TOrderForm.DiscountDetailPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPriceExit(nil);
    StrGrid.Col:=11;
  end;
end;

procedure TOrderForm.DiscountDetailPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPercentExit(nil);
    StrGrid.Col:=12;
  end;
end;

procedure TOrderForm.DetailRemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DetailRemarkExit(nil);
    StrGrid.Col:=1;
    StrGrid.Row:=StrGrid.Row+1;
  end;
end;

procedure TOrderForm.CariOfferingClick(Sender: TObject);
begin
  OfferingList:=TOfferingList.Create(Self,'Bus','Order-Create');
end;

procedure TOrderForm.CariCustomerClick(Sender: TObject);
begin
  CustomerList:=TCustomerList.Create(Self,'BUS','Order-Create');
end;

procedure TOrderForm.CariKontakClick(Sender: TObject);
begin
  If CustomerId.Text<>'' then begin
    Customer:=TCustomer.Create(Self,CustomerId.Text,'Bus',False,'Order-Create')
  end;
end;

procedure TOrderForm.CariKontrakClick(Sender: TObject);
begin
  ContractList:=TContractList.Create(Self,'Bus','Order-Create',CustomerId.Text);
end;

procedure TOrderForm.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
  if (Key=VK_DELETE) or (Key=VK_F3) then DeleteOfferingDetail;
end;

procedure TOrderForm.ProductKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
  if (Key=VK_DELETE) or (Key=VK_F3) then DeleteOfferingDetail;
end;

procedure TOrderForm.DetailsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.PickUpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.UnitsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.DetailRemarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.DiscountDetailPercentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.DiscountDetailPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_INSERT) or (Key=VK_F2) then GetOfferingDetail;
end;

procedure TOrderForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  EnableInput;
  OrderDate.Text:=Main.Status.Panels.Items[0].Text;
  SalesPerson.Text:=FullName;
end;

procedure TOrderForm.GridServiceSelectCell(Sender: TObject; ACol,
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

procedure TOrderForm.JumlahBiayaExit(Sender: TObject);
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

procedure TOrderForm.JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
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

procedure TOrderForm.ServiceChange(Sender: TObject);
begin
  CheckService;
end;

procedure TOrderForm.ServiceKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    if (Trim(Service.Text)='') then StrGrid.SetFocus
    else begin
      ServiceExit(nil);
      if GridService.Cells[14,IntRowService]='1' then GridService.Col:=1 else GridService.Col:=2; 
    end;
  end;
end;

procedure TOrderForm.ServiceExit(Sender: TObject);
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

procedure TOrderForm.QtyExit(Sender: TObject);
begin
   if Qty.Text<>'' then begin
    GridService.Cells[1,IntRowService]:=Qty.Text;
    Qty.Text:='';
  end;
  Qty.Visible:=False;
  GridService.SetFocus;
  Calculate;
end;

procedure TOrderForm.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
    GridService.Col:=2;
  end;
end;

procedure TOrderForm.DiscountPercentEnter(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then DiscountPercent.Text:=ToString(DiscountPercent.Text);
end;

procedure TOrderForm.DiscountPercentExit(Sender: TObject);
begin
  if DiscountPercent.Text<>'' then begin
    DiscountPercent.Text:=SToCurr(DiscountPercent.Text);
//    if StrToInt(DiscountPercent.Text)=0 then DiscountPrice.Enabled:=True else DiscountPrice.Enabled:=False;
  end else DiscountPercent.Text:='0';
  Calculate;
  if SToInt(ToString(DiscountPercent.Text))>0 then DiscountPrice.Enabled:=False else DiscountPrice.Enabled:=True;
end;

procedure TOrderForm.DiscountPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Remark.SetFocus;
end;

procedure TOrderForm.DiscountPriceEnter(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then DiscountPrice.Text:=ToString(DiscountPrice.Text);
end;

procedure TOrderForm.DiscountPriceExit(Sender: TObject);
begin
  if DiscountPrice.Text<>'' then begin
    DiscountPrice.Text:=SToCurr(DiscountPrice.Text);
//    if StrToInt(DiscountPrice.Text)=0 then DiscountPercent.Enabled:=True else DiscountPercent.Enabled:=False;
  end else DiscountPrice.Text:='0';
  Calculate;
  if SToInt(DiscountPrice.Text)>0 then DiscountPercent.Enabled:=False else DiscountPercent.Enabled:=True;
end;

procedure TOrderForm.DiscountPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPercent.SetFocus;
end;

procedure TOrderForm.CetakUlangClick(Sender: TObject);
begin
  if OrdrId<>'' then RePrint(OrdrId)
  else if Main.IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'BUS','Order-Reprint');
end;

procedure TOrderForm.DiscountCNKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Guide.SetFocus;
end;

procedure TOrderForm.GuideCellularKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TOrderForm.GuideKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GuideCellular.SetFocus;
end;

procedure TOrderForm.StrGridDblClick(Sender: TObject);
var StrReason:String;
begin
  if IntRow>MinRowGrid then begin
    if FormRequest='' then begin

    end else begin
      if UpperCase(FormRequest)='RESERVED-CREATE' then  begin
        if StrGrid.Cells[9,IntRow]>StrGrid.Cells[19,IntRow] then begin
          BookingForm.SetOrderDetail(StrGrid.Cells[18,IntRow]);
          OrderForm.Close;
        end else
          MessageBox(Handle,'Unit Armada sudah dijadwalkan','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
      if UpperCase(FormRequest)='RESERVED-FORCEADD' then  begin
        Repeat
          StrReason:=InputBox('Penjadwalan','Masukkan Alasan','')
        Until StrReason<>'';
        BookingForm.SetOrderDetail(StrGrid.Cells[18,IntRow],StrReason);
        Close;
      end;
      if UpperCase(FormRequest)='WAITINGLIST-ALLOCATE' then  begin
        if StrGrid.Cells[9,IntRow]>StrGrid.Cells[19,IntRow] then begin
          BookingForm.SetOrderDetail(StrGrid.Cells[18,IntRow]);
          OrderForm.Close;
        end else
          MessageBox(Handle,'Unit Armada sudah dijadwalkan','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
    end;
  end;
end;

procedure TOrderForm.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[0,IntRow]:='v';
  end else begin
    StrGrid.Cells[0,IntRow]:='';
  end;
  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TOrderForm.ScheduleAddClick(Sender: TObject);
var IntCount:Integer;
    StrCustomerOrderId:String;
begin
  if (UpperCase(FormRequest)='RESERVED-CREATE') or (UpperCase(FormRequest)='RESERVED-FORCEADD')  then  begin
    StrCustomerOrderId:='';
    for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do begin
      if (StrGrid.Cells[1,IntCount]<>'') and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[6,IntCount]<>'')
      and (StrGrid.Cells[13,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') then begin
        if StrGrid.Cells[0,IntCount]='v' then
          if StrCustomerOrderId='' then StrCustomerOrderId:=StrGrid.Cells[18,IntCount]
          else StrCustomerOrderId:=StrCustomerOrderId+'##'+StrGrid.Cells[18,IntCount];
      end;
    end;
    BookingForm.SetOrderDetail(StrCustomerOrderId);
    OrderForm.Close;
  end;
end;

procedure TOrderForm.ShowCustomerDetail;
begin
  if (Main.IsFormOpen('Customer')=False) and (Trim(CustomerId.Text)<>'')  then Customer:=TCustomer.Create(Self,Trim(CustomerId.Text),'Bus',False);
end;

procedure TOrderForm.GroupBox1DblClick(Sender: TObject);
begin
  ShowCustomerDetail;
end;


procedure TOrderForm.Button1Click(Sender: TObject);
begin
  if Trim(OrderId.Text)<>'' then begin
    BookingForm:=TBookingForm.Create(Self,'',False,'Order-Print');
    BookingForm.RePrint('',OrderId.Text);
  end;
end;

procedure TOrderForm.DeleteKontrakClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar('Hapus Nomor Kontrak ?'),'Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
    ContractId.Text:='';
    PanelDiscount.Enabled:=True;
    RefreshProduct;
    Calculate;
  end;
end;

procedure TOrderForm.Label4DblClick(Sender: TObject);
begin
  if CustomerId.Text<>'' then
    Customer:=TCustomer.Create(nil,CustomerId.Text)
end;

procedure TOrderForm.Label5DblClick(Sender: TObject);
begin
  if CustomerId.Text<>'' then
    Customer:=TCustomer.Create(nil,CustomerId.Text)
end;

procedure TOrderForm.BookdirectClick(Sender: TObject);
begin
  if Bookdirect.Checked=True then PanelBook.Enabled:=True
  else PanelBook.Enabled:=False;
end;

procedure TOrderForm.IsServiceClick(Sender: TObject);
begin
    if IsService.Checked then begin
//      IsService.Checked := False;
      cb_pilihan_service.ItemIndex:=-1;
      cb_pilihan_service.Enabled:=True;
    end else begin
//      IsService.Checked := True;
      cb_pilihan_service.ItemIndex:=-1;
      cb_pilihan_service.Enabled:=False;
    end;
end;

end.
