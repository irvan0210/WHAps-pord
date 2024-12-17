unit BookingFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ZColorStringGrid, WHUnit,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDBPipe, ppDB, DB, ppDBBDE,
  Mask, ppParameter, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppCache,
  ComCtrls, jpeg, InvokeRegistry, Rio, SOAPHTTPClient,ClipBrd, Menus;


type
  TBookingForm = class(TForm)
    Label19: TLabel;
    GroupBatal: TPanel;
    Status: TCheckBox;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GroupHeader: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LabelSegment1: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    ContactDisp: TEdit;
    CustomerId: TEdit;
    ContactId: TEdit;
    OrderId: TEdit;
    CustomerDisp: TEdit;
    PanelCariOrder: TPanel;
    CariOrder: TSpeedButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    ReservedId: TEdit;
    ReservedDate: TEdit;
    ReservationUser: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    GroupDetail: TGroupBox;
    Label8: TLabel;
    Label22: TLabel;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppOrderId: TppLabel;
    ppLabelTo: TppLabel;
    ppLabel14: TppLabel;
    ppLine15: TppLine;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppCustomerName: TppLabel;
    ppGroupName: TppLabel;
    ppContactName: TppLabel;
    ppLabel3: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppCelularNo: TppLabel;
    ppPhoneNo: TppLabel;
    ppFaxNo: TppLabel;
    ppLabel26: TppLabel;
    ppLabel16: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppSalesName: TppLabel;
    ppSubmitDate: TppLabel;
    ppSubmitTime: TppLabel;
    ppLabel32: TppLabel;
    ppShape3: TppShape;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine1: TppLine;
    ppCompany: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppService1: TppLabel;
    ppService2: TppLabel;
    ppService3: TppLabel;
    ppService4: TppLabel;
    ppService5: TppLabel;
    ppService6: TppLabel;
    ppService7: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppContract: TppLabel;
    ppTotal: TppLabel;
    ppDiscount: TppLabel;
    ppNameCN: TppLabel;
    ppTimeLimit: TppLabel;
    ppPayment1: TppLabel;
    ppPayment2: TppLabel;
    ppFullPayment: TppLabel;
    ppDiscountCN: TppLabel;
    ppNoRekCN: TppLabel;
    ppDatePayment1: TppLabel;
    ppDatePayment2: TppLabel;
    ppDatePayment3: TppLabel;
    ppLine2: TppLine;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppGuideName: TppLabel;
    ppGuideCellular: TppLabel;
    ppShape1: TppShape;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLine3: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine14: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppReprinted: TppLabel;
    ppInvoiceNo: TppLabel;
    ppLogo: TppImage;
    ppWhiteMiniVan: TppLabel;
    ppWhiteMicroBus: TppLabel;
    ppWhiteBigBus: TppLabel;
    ppSilverBigBus: TppLabel;
    ppSilverMicroBus: TppLabel;
    ppSilverMiniVan: TppLabel;
    ppLabel1: TppLabel;
    ppLine31: TppLine;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppemail: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppTanggal: TppDBText;
    ppBodyId: TppDBText;
    ppLine28: TppLine;
    ppLine5: TppLine;
    ppDriver: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine12: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppSeat: TppDBText;
    ppStandByTIme: TppDBText;
    ppRoute: TppDBMemo;
    ppPickupPoint: TppDBMemo;
    ppRemark: TppDBMemo;
    ppLine32: TppLine;
    ppUnits: TppDBText;
    ppLine13: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    Address: TMemo;
    HeaderRemark: TMemo;
    Remark: TMemo;
    Group: TEdit;
    Label6: TLabel;
    Guide: TEdit;
    GuideCellular: TEdit;
    Label23: TLabel;
    GroupPackage: TPanel;
    Package: TCheckBox;
    ppService8: TppLabel;
    Label10: TLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppPrintDate: TppLabel;
    GroupLock: TPanel;
    LockBooking: TCheckBox;
    ppLockSign: TppImage;
    WebService: THTTPRIO;
    ListKunciCepat: TMemo;
    GroupIsFix: TPanel;
    isFix: TCheckBox;
    ToXCel: TSpeedButton;
    PopupMenu1: TPopupMenu;
    GeserUnit1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    GeserDriver1: TMenuItem;
    GroupOrder: TGroupBox;
    Label7: TLabel;
    StrGrid: TZColorStringGrid;
    TimeStandby: TMaskEdit;
    DetailRemark: TMemo;
    DateStart: TDateTimePicker;
    DateFinish: TDateTimePicker;
    TimeStart: TMaskEdit;
    GeserHelper: TMenuItem;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimeStandbyExit(Sender: TObject);
    procedure TimeStandbyKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridDblClick(Sender: TObject);
    procedure DetailRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure DetailRemarkExit(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure GroupKeyPress(Sender: TObject; var Key: Char);
    procedure GuideKeyPress(Sender: TObject; var Key: Char);
    procedure GuideCellularKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartExit(Sender: TObject);
    procedure DateStartKeyPress(Sender: TObject; var Key: Char);
    procedure DateFinishExit(Sender: TObject);
    procedure DateFinishKeyPress(Sender: TObject; var Key: Char);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure TimeStartExit(Sender: TObject);
    procedure TimeStartKeyPress(Sender: TObject; var Key: Char);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StrGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure GeserUnit1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure GeserDriver1Click(Sender: TObject);
    procedure GeserHelperClick(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    IsInputGrid,IsInput,IsSetLock,IsDataFound:Boolean;
    BookedId,FormRequest,OrdersId,StrIsOnline:String;
    MinRowService,IntRowService,IntColService:Integer;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure LoadData;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure GetOrderDetail;
    procedure DeleteOrderDetail;
    procedure DeleteVehicleDetail;
    procedure DeleteDriverDetail;
    procedure DeleteBusboy;
    procedure ShowCustomerDetail;
  public
    { Public declarations }
    procedure SetOrderId(Order_Id:String);
    procedure RefreshHeader;
    procedure SetOrderDetail(Order_Detail_Id:String;Str_Reason:String='');
    procedure SetVehicleId(Vehicle_Id:String;Remarks:String='';IsMoveUnit:Boolean=False;VhcBatchId_Old:String='';VhcBatchId_New:String='');
    procedure SetEmployeeId(Employee_Id:String; Is_First:Boolean=True; Employee_Name:String=''; IsMoveDriver:Boolean=False);
    procedure SetEmp_BusBoy_Id(Employee_Id:String; Is_First:Boolean=True; Employee_Name:String=''; IsMoveBusBoy:Boolean=False);
    procedure RePrint(Reserved_Id:String='';Customer_Order_Id:String='');
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Booking_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Orders_Id:String='');Overload;
  end;

var
  BookingForm: TBookingForm;

implementation


uses MainU, DateUtils, ADODB, AuthorizedFormU, OrderFormU, OrderListU,
  VehicleRDListU, EmployeeRDListU, StrUtils, RePrintFormU, BookingListU,
  CustomerU
  , IntersysAPI_New, EmployeeListU;

{$R *.dfm}

constructor TBookingForm.Create(AOwner:TComponent;Booking_Id:String='';Is_Input:Boolean=True;Form_Request:String='';Orders_Id:String='');
begin
  BookedId:=Booking_Id;
  IsInputGrid:=Is_Input;
  IsInput:=Is_Input;
  OrdersId:=Orders_Id;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: BookingForm='+Booking_Id+','+Orders_Id+','+BoolToStr(Is_Input)+','+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TBookingForm.RefreshHeader;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('PostingData_API_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then IsDataFound:=True Else IsDataFound:=False;
      //if Qry.FieldValues['value_string']=0 then IsDataFound:=False;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingForm.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  IsSetLock:=False;
  OrderId.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  ContactId.Text:='';
  ContactDisp.Text:='';
  Address.Text:='';
  HeaderRemark.Text:='';
  Remark.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  PanelCariOrder.Enabled:=True;
  Status.Checked:=False;
  TimeStandby.Visible:=True;
  TimeStandby.Height:=36;
  TimeStandby.Visible:=False;
  TimeStart.Visible:=True;
  TimeStart.Height:=36;
  TimeStart.Visible:=False;
  LockBooking.Checked:=False;
  if BookedId<>'' then Status.Visible:=True
  else Status.Visible:=False;
  ppLockSign.Visible:=False;
  GroupBatal.Visible:=False;
  Status.Visible:=False;
  Status.Checked:=False;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=131101';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
       ToXCel.Enabled:=True;
    end else begin
      ToXCel.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

//  if UserLevel<59 then ToXCel.Enabled:=False;
end;

procedure TBookingForm.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=34;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=55;
  StrGrid.ColWidths[5]:=55;
  StrGrid.ColWidths[6]:=50;
  StrGrid.ColWidths[7]:=45;
  StrGrid.ColWidths[8]:=55;
  StrGrid.ColWidths[9]:=80;
  StrGrid.ColWidths[10]:=80;
  StrGrid.ColWidths[11]:=80;
  StrGrid.ColWidths[12]:=100;
  //col 12=product_price_id
  //col 13=customer_order_detail_id [00##00##00]
  //col 14=vhc_batch_id
  //col 15=vehicle_id
  //col 16=employee_id
  //col 17=seat
  //col 18=employee_id2
  //col 19=full_day
  //col 20=hour
  //col 21=vhc_trans_id
  //col 22=vehicle_change_remark
  //col 23=reserved_order_detail_id
  for IntCount:=13 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,5,0);
  StrGrid.MergeCells.AddRectXY(6,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.RowHeights[0]:=20;
  StrGrid.RowHeights[1]:=20;
  StrGrid.Cells[0,0]:='Armada';
  StrGrid.Cells[1,0]:='Acara Perjalanan';
  StrGrid.Cells[2,0]:='Lokasi Jemput';
  StrGrid.Cells[3,0]:='Keterangan Pesanan';
  StrGrid.Cells[4,0]:='Tgl Penggunaan';
  StrGrid.Cells[6,0]:='Waktu';
  StrGrid.Cells[8,0]:='No Body';
  StrGrid.Cells[9,0]:='Driver';
  StrGrid.Cells[10,0]:='Driver';
  StrGrid.Cells[11,0]:='Helper';
  StrGrid.Cells[12,0]:='Keterangan';
  StrGrid.Cells[4,1]:='Berangkat';
  StrGrid.Cells[5,1]:='Selesai';
  StrGrid.Cells[6,1]:='Berangkat';
  StrGrid.Cells[7,1]:='Standby';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1  do begin
    StrGrid.Cells[IntCount,2]:='';
  end;
end;

procedure TBookingForm.InitGridService;
var IntCount,IntCount2:Integer;
begin
  MinRowService:=0;
  GridService.ColCount:=6;
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

procedure TBookingForm.RefreshCombo;
begin
end;

procedure TBookingForm.SetOrderId(Order_Id:String);
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
      StrIsOnline:=VarToStr(Qry.FieldValues['online']);
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
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
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(Order_Id)+';';
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
      GridService.Cells[4,IntCount]:=Qry.FieldValues['calculate_total'];
      GridService.Cells[5,IntCount]:=Qry.FieldValues['transaction_type_id'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingForm.SetOrderDetail(Order_Detail_Id:String;Str_Reason:String='');
var Qry:TADOQuery;
    StrQry:String;
    StrVehicleName,StrRoute,StrPickupPoint,StrRemark,StrFromDates,StrToDates,StrFromTime,StrVhcBatchId,StrSeat:String;
    StrFullDay,StrHour,StrProductPrice:String;
    IntCount,IntCount2,IntFreeRow:Integer;
    StrList:TStringList;
    IsOk:Boolean;
begin
  if (StrGrid.Cells[0,IntRow]<>'') and (StrGrid.Cells[1,IntRow]<>'') then begin
    for IntCount:=StrGrid.RowCount-1 downto MinRowGrid+1 do
      if StrGrid.Cells[0,IntCount]='' then IntFreeRow:=IntCount;
  end else IntFreeRow:=IntRow;
  if IntFreeRow<MinRowGrid then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    IntFreeRow:=StrGrid.RowCount-1
  end;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrList:=TStringList.Create;
    StrList:=SplitStrings(Order_Detail_Id,'##');
    StrVehicleName:='';
    StrRoute:='';
    StrPickupPoint:='';
    StrRemark:='';
    StrFromDates:='';
    StrToDates:='';
    StrFromTime:='';
    StrVhcBatchId:='';
    IsOk:=True;
    for IntCount2:=0 to StrList.Count-1 do begin
      StrQry:='EXEC GetCustomerOrderDetailDetail '+QuotedStr(StrList.Strings[IntCount2])+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['product_price_name']<> NULL then begin
          if StrProductPrice='' then StrProductPrice:=Qry.FieldValues['product_price_id']
          else if StrProductPrice<>Qry.FieldValues['product_price_id'] then IsOk:=False;
          if StrVehicleName='' then StrVehicleName:=Qry.FieldValues['vehicle_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
          if StrRoute='' then if Qry.FieldValues['route']<>NULL then StrRoute:=Qry.FieldValues['route'];
          if StrPickupPoint='' then if Qry.FieldValues['pickup_point']<>NULL then StrPickupPoint:=Qry.FieldValues['pickup_point'];
          if StrRemark='' then if Qry.FieldValues['remark']<>NULL then StrRemark:=Qry.FieldValues['remark'];
          if StrFromDates='' then StrFromDates:=Qry.FieldValues['from_dates']
          else if (StrToDate(Qry.FieldValues['from_dates']))<(StrToDate(StrFromDates)) then StrFromDates:=Qry.FieldValues['from_dates'];
          if StrToDates='' then StrToDates:=Qry.FieldValues['to_dates']
          else if (StrToDate(Qry.FieldValues['to_dates']))>(StrToDate(StrToDates)) then StrToDates:=Qry.FieldValues['to_dates'];
          if StrFromTime='' then StrFromTime:=Qry.FieldValues['from_time'];
          if StrVhcBatchId='' then StrVhcBatchId:=Qry.FieldValues['vhc_batch_id']
          else if StrVhcBatchId<>Qry.FieldValues['vhc_batch_id'] then IsOk:=False;
          if StrSeat='' then StrSeat:=Qry.FieldValues['seat']
          else if StrSeat<>Qry.FieldValues['seat'] then IsOk:=False;
          if StrFullDay='' then StrFullDay:=Qry.FieldValues['full_day']
          else if StrFullDay<>Qry.FieldValues['full_day'] then IsOk:=False;
          if StrHour='' then StrHour:=Qry.FieldValues['hour']
          else if StrHour<>Qry.FieldValues['hour'] then IsOk:=False;
        end;
      end;
      Qry.Close;
    end;
    FreeAndNil(StrList);
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if IsOk then begin
    StrGrid.Cells[0,IntFreeRow]:=StrVehicleName;
    StrGrid.Cells[1,IntFreeRow]:=StrRoute;
    StrGrid.Cells[2,IntFreeRow]:=StrPickupPoint;
    if StrRemark<>'' then StrGrid.Cells[3,IntFreeRow]:=StrRemark;
    StrGrid.Cells[4,IntFreeRow]:=StrFromDates;
    StrGrid.Cells[5,IntFreeRow]:=StrToDates;
    StrGrid.Cells[6,IntFreeRow]:=StrFromTime;
    StrGrid.Cells[13,IntFreeRow]:=StrProductPrice;   //sudah diganti
    StrGrid.Cells[14,IntFreeRow]:=Order_Detail_Id;  //sudah diganti
    StrGrid.Cells[15,IntFreeRow]:=StrVhcBatchId;   //sudah diganti
    StrGrid.Cells[18,IntFreeRow]:=StrSeat;       //sudah diganti
    StrGrid.Cells[20,IntFreeRow]:=StrFullDay;     //sudah diganti
    StrGrid.Cells[21,IntFreeRow]:=StrHour;         //sudah diganti
    if Str_Reason<>'' then StrGrid.Cells[23,IntFreeRow]:=Str_Reason;    //sudah diganti
  end else
    MessageBox(Handle,'Jenis Kendaraan tidak Sama'+Chr(13)+Chr(13)+'Gagal Menambah Data','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  if IntFreeRow>StrGrid.RowCount-2 then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  end;
  Main.M_Normal;
end;

procedure TBookingForm.SetVehicleId(Vehicle_Id:String;Remarks:String='';IsMoveUnit:Boolean=False;VhcBatchId_Old:String='';VhcBatchId_New:String='');
var Qry:TADOQuery;
    StrQry,StrRemark:String;
    IntCount:Integer;
    IsFree:Boolean;
    StrBodyIdAsal:String;
begin
  if Vehicle_Id<>'' then begin
    IsFree:=True;
    for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') and (StrGrid.Cells[16,IntCount]<>'') then begin    //sudah diganti
        if LeftStr(Vehicle_Id,8)<>'BU000000' then begin
          if (StrGrid.Cells[4,IntCount]=StrGrid.Cells[4,IntRow]) and (StrGrid.Cells[5,IntCount]=StrGrid.Cells[5,IntRow])
          and (StrGrid.Cells[6,IntCount]=StrGrid.Cells[6,IntRow]) and (StrGrid.Cells[16,IntCount]=Vehicle_Id) then IsFree:=False;   //sudah diganti
        end;
      end;
    StrBodyIdAsal := StrGrid.Cells[8,IntRow];
    if IsFree=True then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      if Remarks<>'' then StrRemark:=Remarks else StrRemark:='';
      if Main.OpenDb then begin
        StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if IsMoveUnit Then begin
          for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do begin
            if (StrGrid.Cells[21,IntCount]='')   then begin
                if Qry.RecordCount>0 then begin
                  if StrBodyIdAsal=StrGrid.Cells[8,IntCount] then begin
                    StrGrid.Cells[16,IntCount]:=Qry.FieldValues['vehicle_id'];  //sudah diganti
                    StrGrid.Cells[8,IntCount]:=Qry.FieldValues['body_id'];
                    StrGrid.Cells[23,IntCount]:=StrGrid.Cells[22,IntCount]+StrRemark;   //sudah diganti
                    if Qry.FieldValues['name']<>NULL then begin
                      StrGrid.Cells[9,IntCount]:=Qry.FieldValues['name'];
                      StrGrid.Cells[17,IntCount]:=Qry.FieldValues['employee_id'];    //sudah diganti
                      StrGrid.Cells[25,IntCount]:=Qry.FieldValues['name']; {driver name}   //sudah diganti
                      StrGrid.Cells[26,IntCount]:=Qry.FieldValues['cellular_no'];      //sudah diganti
                    end;
                    StrGrid.Cells[27,IntCount]:=LicensePlate(Qry.FieldValues['license_plate']);  //sudah diganti

                    if Trim(VhcBatchId_Old)<>Trim(VhcBatchId_New) Then begin
                      StrGrid.Cells[28,IntCount] := VhcBatchId_Old+'|'+VhcBatchId_New;   //sudah diganti
                      //StrGrid.Cells[22,IntCount] := StrGrid.Cells[22,IntCount]+StrRemark+VhcBatchId_Old+'|'+VhcBatchId_New;
                    end else begin
                      StrGrid.Cells[28,IntCount] := '';   //sudah diganti
                      //StrGrid.Cells[22,IntCount] := StrGrid.Cells[22,IntCount]+StrRemark+VhcBatchId_Old+'|'+VhcBatchId_New;
                    end;
                  end;
                end;
            end;
          end;
        end else begin
          if Qry.RecordCount>0 then begin
            StrGrid.Cells[16,IntRow]:=Qry.FieldValues['vehicle_id'];  //sudah diganti
            StrGrid.Cells[8,IntRow]:=Qry.FieldValues['body_id'];
            StrGrid.Cells[23,IntRow]:=StrGrid.Cells[22,IntRow]+StrRemark;   //sudah diganti
            if Qry.FieldValues['name']<>NULL then begin
              StrGrid.Cells[9,IntRow]:=Qry.FieldValues['name'];
              StrGrid.Cells[17,IntRow]:=Qry.FieldValues['employee_id'];  //sudah diganti
              StrGrid.Cells[25,IntRow]:=Qry.FieldValues['name']; {driver name}  //sudah diganti
              StrGrid.Cells[26,IntRow]:=Qry.FieldValues['cellular_no'];    //sudah diganti
            end;
            StrGrid.Cells[27,IntRow]:=LicensePlate(Qry.FieldValues['license_plate']);  //sudah diganti

            if Trim(VhcBatchId_Old)<>Trim(VhcBatchId_New) Then begin
              StrGrid.Cells[28,IntRow] := VhcBatchId_Old+'|'+VhcBatchId_New;  //sudah diganti
              //StrGrid.Cells[22,IntRow] := StrGrid.Cells[22,IntRow]+StrRemark+VhcBatchId_Old+'|'+VhcBatchId_New;
            end else begin
              StrGrid.Cells[28,IntRow] := '';   //sudah diganti
              //StrGrid.Cells[22,IntRow] := StrGrid.Cells[22,IntRow]+StrRemark+VhcBatchId_Old+'|'+VhcBatchId_New;
            end;

          end;
        end;


        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end else
      MessageBox(Handle,'Kendaraan sudah dijadwalkan, Silahkan cek kembali','Penjadwalan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  end;
  Main.M_Normal;
end;

procedure TBookingForm.SetEmployeeId(Employee_Id:String; Is_First:Boolean=True; Employee_Name:String=''; IsMoveDriver:Boolean=False);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    IsFree,IsFound:Boolean;
begin
  if Employee_Id<>'' then begin
    IsFree:=True;
    IsFound:=False;
    if (StrPos(PChar(UpperCase(Employee_Name)),PChar(UpperCase('SEWA')))<>nil) then IsFound:=True;

    for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') and (StrGrid.Cells[16,IntCount]<>'') then begin    //sudah diganti
        if (Employee_Id<>'BU00000001') or IsFound then begin
          if (StrGrid.Cells[4,IntCount]=StrGrid.Cells[4,IntRow]) and (StrGrid.Cells[5,IntCount]=StrGrid.Cells[5,IntRow])
          and (StrGrid.Cells[6,IntCount]=StrGrid.Cells[6,IntRow])
          and ((StrGrid.Cells[17,IntCount]=Employee_Id) or (StrGrid.Cells[19,IntCount]=Employee_Id)) then IsFree:=False;   //sudah diganti
        end;
      end;

    if IsFree=True then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      if Main.OpenDb then begin
        StrQry:='EXEC GetEmployeeDetail '+QuotedStr(Employee_Id)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if IsMoveDriver Then begin
          for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do begin
            if Qry.RecordCount>0 then begin
              if Is_First then begin
                StrGrid.Cells[9,IntCount]:=Qry.FieldValues['name'];
                StrGrid.Cells[17,IntCount]:=Qry.FieldValues['employee_id'];    //sudah diganti
                StrGrid.Cells[25,IntCount]:=Qry.FieldValues['name']; {driver name}   //sudah diganti
                StrGrid.Cells[26,IntCount]:=Qry.FieldValues['cellular_no'];     //sudah diganti
              end else begin
                StrGrid.Cells[10,IntCount]:=Qry.FieldValues['name'];
                StrGrid.Cells[19,IntCount]:=Qry.FieldValues['employee_id'];   //sudah diganti
              end;
            end;
          end;
          Qry.Close;
        end else begin
          if Qry.RecordCount>0 then begin
            if Is_First then begin
              StrGrid.Cells[9,IntRow]:=Qry.FieldValues['name'];
              StrGrid.Cells[17,IntRow]:=Qry.FieldValues['employee_id'];     //sudah diganti
              StrGrid.Cells[25,IntRow]:=Qry.FieldValues['name']; {driver name}  //sudah diganti
              StrGrid.Cells[26,IntRow]:=Qry.FieldValues['cellular_no'];    //sudah diganti
            end else begin
              StrGrid.Cells[10,IntRow]:=Qry.FieldValues['name'];
              StrGrid.Cells[19,IntRow]:=Qry.FieldValues['employee_id'];   //sudah diganti
            end;
          end;
          Qry.Close;
        end;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end else
      MessageBox(Handle,'Pengemudi sudah dijadwalkan, Silahkan cek kembali','Penjadwalan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  end;
  Main.M_Normal;
end;

procedure TBookingForm.SetEmp_BusBoy_Id(Employee_Id:String; Is_First:Boolean=True; Employee_Name:String=''; IsMoveBusBoy:Boolean=False);
var Qry:TADOQuery;
    StrQry,helpername:String;
    IntCount:Integer;
    IsFree,IsFound:Boolean;
    StrBodyIdAsal:String;
begin
  if Employee_Id<>'' then begin
    IsFree:=True;
    IsFound:=False;
    if (StrPos(PChar(UpperCase(Employee_Name)),PChar(UpperCase('SEWA')))<>nil) then IsFound:=True;
    for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do
    if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') and (StrGrid.Cells[16,IntCount]<>'') then    //sudah diganti
      begin
          if (Employee_Id<>'BU00000001') or IsFound then begin
           // MessageBox(0,PChar(StrGrid.Cells[16,IntRow]+' , '+StrGrid.Cells[18,IntRow]),'Penjadwalan',MB_OK or MB_ICONWARNING);
            if (StrGrid.Cells[4,IntCount]=StrGrid.Cells[4,IntRow])  //tanggal
            and (StrGrid.Cells[5,IntCount]=StrGrid.Cells[5,IntRow]) // tanggal
            and (StrGrid.Cells[6,IntCount]=StrGrid.Cells[6,IntRow]) // jam
            and ((StrGrid.Cells[33,IntCount]=Employee_Id)) then IsFree:=False; //or (StrGrid.Cells[18,IntCount]=Employee_Id)
          end;
      end;
    StrBodyIdAsal := StrGrid.Cells[8,IntRow];
    if IsFree=True then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      if Main.OpenDb then begin
        StrQry:='EXEC GetEmployeeDetail '+QuotedStr(Employee_Id)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if IsMoveBusBoy Then begin
          for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do begin
            if Qry.RecordCount>0 then begin
              if StrBodyIdAsal=StrGrid.Cells[8,IntCount] then begin
                if Is_First then begin
                  StrGrid.Cells[11,IntCount]:=Qry.FieldValues['name'];
                  StrGrid.Cells[33,IntCount]:=Qry.FieldValues['employee_id'];
                  StrGrid.Cells[34,IntCount]:=Qry.FieldValues['cellular_no'];

                end else begin
                  StrGrid.Cells[11,IntCount]:=Qry.FieldValues['name'];
                  StrGrid.Cells[33,IntCount]:=Qry.FieldValues['employee_id'];
                  StrGrid.Cells[34,IntCount]:=Qry.FieldValues['cellular_no'];
                end;
              end
              else
              MessageBox(Handle,'Kendaraan Tidak Sama, Silahkan cek kembali','Penjadwalan Kernek',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            end;
          end;
          Qry.Close;
        end
        else begin
          if Qry.RecordCount>0 then begin
           // if StrBodyIdAsal=StrGrid.Cells[8,IntCount] then begin
              if Is_First then begin
                StrGrid.Cells[11,IntRow]:=Qry.FieldValues['name'];
                StrGrid.Cells[33,IntRow]:=Qry.FieldValues['employee_id'];
                StrGrid.Cells[34,IntRow]:=Qry.FieldValues['cellular_no'];
              end else begin
                StrGrid.Cells[11,IntRow]:=Qry.FieldValues['name'];
                StrGrid.Cells[33,IntRow]:=Qry.FieldValues['employee_id'];
                StrGrid.Cells[34,IntRow]:=Qry.FieldValues['cellular_no'];

              end;
           // end;
          end;
          Qry.Close;
        end;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end else
      MessageBox(Handle,'Kernet sudah dijadwalkan, Silahkan cek kembali','Penjadwalan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  end;
  Main.M_Normal;
end;

procedure TBookingForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    if BookedId<>'' then
      StrQry:='EXEC GetReservedOrderDetail '+QuotedStr(BookedId)+';'
    else if OrdersId<>'' then StrQry:='EXEC GetReservedOrderDetail @CustomerOrderId='+QuotedStr(OrdersId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ReservedId.Text:=Qry.FieldValues['reserved_order_id'];
      if BookedId='' then BookedId:=Qry.FieldValues['reserved_order_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      ReservedDate.Text:=Qry.FieldValues['dates'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      StrIsOnline:=VarToStr(Qry.FieldValues['online']);
      if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      ReservationUser.Text:=Qry.FieldValues['reserved_name'];
      if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      if Qry.FieldValues['daily_package']=1 then Package.Checked:=True;
      if Qry.FieldValues['lock_order']='1' then LockBooking.Checked:=True;
      if Qry.FieldValues['isfix']='1' then isFix.Checked:=True;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingForm.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntCount2:Integer;
//    IsCanCancel:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    if BookedId<>'' then StrQry:='EXEC GetReservedOrderDetailList '+QuotedStr(BookedId)+';'
    else if OrdersId<>'' then StrQry:='EXEC GetReservedOrderDetailList '+QuotedStr(ReservedId.Text)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
//    IsCanCancel:=True;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrGrid.RowCount:=IntCount+1;
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['vehicle_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
      StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
      StrGrid.Cells[2,IntCount]:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['remark'];
      StrGrid.Cells[4,IntCount]:=Qry.FieldValues['from_dates'];
      StrGrid.Cells[5,IntCount]:=Qry.FieldValues['to_dates'];
      StrGrid.Cells[6,IntCount]:=Qry.FieldValues['from_time'];
      StrGrid.Cells[7,IntCount]:=Qry.FieldValues['standby_time'];
      StrGrid.Cells[8,IntCount]:=Qry.FieldValues['body_id'];
      StrGrid.Cells[9,IntCount]:=Qry.FieldValues['driver_name'];
      if Qry.FieldValues['driver_name2']<>NULL then StrGrid.Cells[10,IntCount]:=Qry.FieldValues['driver_name2'];
      if Qry.FieldValues['busboy_name']<>NULL then StrGrid.Cells[11,IntCount]:=Qry.FieldValues['busboy_name'];
     // else StrGrid.Cells[11,IntCount]:='Tes Kenek';
      if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[12,IntCount]:=Qry.FieldValues['remark'];  //sudah diganti
      StrGrid.Cells[13,IntCount]:=Qry.FieldValues['product_price_id'];     //sudah diganti
      StrGrid.Cells[14,IntCount]:=LeftStr(Qry.FieldValues['customer_order_detail_id_resume'],Length(Qry.FieldValues['customer_order_detail_id_resume'])-2);    //sudah diganti
      StrGrid.Cells[15,IntCount]:=Qry.FieldValues['vhc_batch_id'];   //sudah diganti
      StrGrid.Cells[16,IntCount]:=Qry.FieldValues['vehicle_id'];    //sudah diganti
      StrGrid.Cells[17,IntCount]:=Qry.FieldValues['employee_id'];    //sudah diganti
      StrGrid.Cells[18,IntCount]:=Qry.FieldValues['seat'];        //sudah diganti
      if Qry.FieldValues['employee_id2']<>NULL then StrGrid.Cells[19,IntCount]:=Qry.FieldValues['employee_id2'];   //sudah diganti
      StrGrid.Cells[20,IntCount]:=Qry.FieldValues['full_day'];   //sudah diganti
      StrGrid.Cells[21,IntCount]:=Qry.FieldValues['hour'];   //sudah diganti
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;   //sudah diganti
      if (Qry.FieldValues['vhc_trans_id']<>NULL) AND (Qry.FieldValues['vhc_trans_id']<>'') then begin
        StrGrid.Cells[22,IntCount]:=Qry.FieldValues['vhc_trans_id'];     //sudah diganti
        GroupBatal.Enabled:=False;
//        IsCanCancel:=False;
        for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clGreen;
      end;
      StrGrid.Cells[24,IntCount]:=Qry.FieldValues['reserved_order_detail_id'];    //sudah diganti
      StrGrid.Cells[25,IntCount]:=Qry.FieldValues['driver_name'];   //sudah diganti
      StrGrid.Cells[26,IntCount]:=Qry.FieldValues['driver_cellphone'];   //sudah diganti
      StrGrid.Cells[27,IntCount]:=LicensePlate(Qry.FieldValues['license_plate']);  //sudah diganti
      StrGrid.Cells[29,IntCount]:=Qry.FieldValues['is_Auth'];  //sudah diganti
      StrGrid.Cells[30,IntCount]:=Qry.FieldValues['is_AuthReason'];    //sudah diganti
      StrGrid.Cells[31,IntCount]:=Qry.FieldValues['employee_id'];  //sudah diganti
      StrGrid.Cells[32,IntCount]:=Qry.FieldValues['vehicle_id']; //sudah diganti
      if (Qry.FieldValues['busboy_id']<>NULL) then StrGrid.Cells[33,IntCount]:=Qry.FieldValues['busboy_id'] else StrGrid.Cells[33,IntCount]:='';
      if (Qry.FieldValues['busboy_cellphone']<>NULL) then StrGrid.Cells[34,IntCount]:=Qry.FieldValues['busboy_cellphone'] else StrGrid.Cells[34,IntCount]:='';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId.Text)+';';
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
  //if IsCanCancel=False then GroupBatal.Enabled:=False;
end;

procedure TBookingForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBookingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Main.CloseDb;
  Main.M_Normal;
  Action:=caFree;
end;

procedure TBookingForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin

  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) then begin
    if (ARow > MinRowGrid) and (StrGrid.Cells[0,ARow]<>'') then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        {4:with DateStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+20;
            Height := (R.Bottom + 1) - R.Top;
            if StrGrid.Cells[ACol,ARow]<>'' then Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
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
          end; }
        6:with TimeStart do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        7:with TimeStandby do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;

        12:with DetailRemark do begin   //sudah diganti
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

procedure TBookingForm.SimpanClick(Sender: TObject);
var Qry,QryWehaOnline,QryWehaOnline2:TADOQuery;
    StrQry,StrQryLog,StrOrderId,StrCustomerId,StrQryWehaOnlineUser,StrQryWehaOnline,StrQryWehaOnlineCek:String;
    StrProductPriceId,StrDestination,StrPickup,StrFromDates,StrToDates,StrFromTimes,StrToTimes,StrTimeStandby,StrRemark,StrRemarkChangeVehicle,
    StrIsAuth,StrIsAuthReason,StrOrderDetailVehicleID,StrWehaUserID, StremployeeId3,StrHelperName,StrHelperPhone:String;
    StrBatchOld, StrBatchNew, StrSeatNew, StrSeatOld, StrEmployeeOld,StrVehicleOld, StrStatusOrderVehicleInfos: string;
    StrStatus,StrRevision,StrVehicleId,StrEmployeeId,StremployeeId2,StrFullDay,StrCustomerOrderId,StrTransIds,StrError:String;
    StrTransId2,StrVhcTransId,StrRemarkChange,StrLockBooking,StrFix:String;
    StrTransId,StrEMsg,StrEMsgAPI,StrCompanyId,StrLocationId,StrGroup,StrGuide,StrGuideCellular,StrReserver,StrPackage,StrStatusWL:String;
    IntCount,IntCount2,IntCount3,IntFromDate,IntToDate,IntDates,IntYears,IntMonths,IntFromMonths,IntToMonths,IntFromYears,IntToYears,IntRowCount,IntUnits:Integer;
    StrList,StrList2:TStringList;
    IsOk,IsComplete,IsAuth:Boolean;
    Dates:TDate;

    StrUrl,NameSpace,ParamIn,StrHelperFullName,StrHelperHP, StrHelperUserID: String;
    API: JadeServiceSoap;
    ResponAPI: ServiceResponse;
    StrReqOrderNo,ParamJsonRsvId,StrJsonRsvId, StrJsonRsvIdWL :WideString;
    CallApi, isLessUnit:Boolean;
begin
  if (OrderId.Text<>'') and (CustomerId.Text<>'')  then begin
      IsAuth:=True;
      IsOk:=True;
      if Package.Checked=True then begin
        for IntCount:=2 to StrGrid.RowCount-1 do begin
          if(IntCount<>2) and (IsOk=True) then
          begin
            if (StrGrid.Cells[0,IntCount]<>'') AND (StrGrid.Cells[1,IntCount]<>'') AND
            (StrGrid.Cells[0,IntCount]=StrGrid.Cells[0,IntCount-1]) AND
            (StrGrid.Cells[1,IntCount]=StrGrid.Cells[1,IntCount-1]) AND
            (StrGrid.Cells[2,IntCount]=StrGrid.Cells[2,IntCount-1]) AND
            (StrGrid.Cells[0,IntCount]=StrGrid.Cells[0,IntCount-1]) AND
            ((StrGrid.Cells[8,IntCount]<>StrGrid.Cells[8,IntCount-1]) OR
            (StrGrid.Cells[9,IntCount]<>StrGrid.Cells[9,IntCount-1]) ) then
            begin
              StrEMsg:='Armada atau Driver harus sama !';
              MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              IsOk:=False;

              AuthorizedForm.FormId:='1311012';
              AuthorizedForm.StrMessage:=' Otorisasi untuk dapat melanjutkan Simpan';
              if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;

              if IsAuth=False then
              begin
                Main.M_Normal;
                IsInputGrid:=True;
                IsInput:=True;
                EnableInput;
                Exit;
              end;
            end;
          end;
        end;
      end;

      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 360000;
      Qry.ParamCheck := False;

      QryWehaOnline:=TADOQuery.Create(Self);
      QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
      QryWehaOnline.CommandTimeout := 360000;
      QryWehaOnline.ParamCheck:=False;

      QryWehaOnline2:=TADOQuery.Create(Self);
      QryWehaOnline2.Connection:=Main.MyConnectionWehaOnline;
      QryWehaOnline2.CommandTimeout := 360000;
      QryWehaOnline2.ParamCheck:=False;



      Main.M_Busy;
      if (Main.OpenDb) AND (IsAuth=True) then begin
        DisableInput;
        Main.TransStart;
        IsOk:=True;
        StrQryWehaOnline:='';

        if (StrIsOnline='1') AND (LeftStr(UpperCase(FormRequest),11)='WAITINGLIST') AND (Status.Checked=False) then
        begin
          IntUnits:=0;
          IntRowCount:=0;
          StrQry:='SELECT SUM(units) units FROM wh_customer_order_detail '+
                  'WHERE customer_order_id IN ('+QuotedStr(OrderId.Text)+') AND status=1;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;

          IntUnits:=Qry.FieldValues['units'];

          for IntCount:=2 to StrGrid.RowCount-1 do begin
            if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') then    //sudah diganti
            begin
              if(StrGrid.Cells[7,IntCount]='') then
              begin
                StrEMsg:='Stand By wajib diisi!';
                MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                Main.CloseDb;
                Main.M_Normal;
                IsInputGrid:=True;
                IsInput:=True;
                EnableInput;
                Exit;
              end;
              if(StrGrid.Cells[16,IntCount]='') then    //sudah diganti
              begin
                StrEMsg:='No Body wajib diisi!';
                MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                Main.CloseDb;
                Main.M_Normal;
                IsInputGrid:=True;
                IsInput:=True;
                EnableInput;
                Exit;
              end;
              if(StrGrid.Cells[17,IntCount]='') then    //sudah diganti
              begin
                StrEMsg:='Driver wajib diisi!';
                MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                Main.CloseDb;
                Main.M_Normal;
                IsInputGrid:=True;
                IsInput:=True;
                EnableInput;
                Exit;
              end;

              IntRowCount:=IntRowCount+1;
            end;
          end;
          IntRowCount:=IntRowCount;
          if IntRowCount<>IntUnits then
          begin
            StrEMsg:='Jumlah Unit yang dinaikan tidak sesuai dengan yang diminta!';
            MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            Main.CloseDb;
            Main.M_Normal;
            IsInputGrid:=True;
            IsInput:=True;
            EnableInput;
            Exit;
          end;
        end;

        {get url API}
        if LowerCase(Main.Db)='wh_prod' then
          StrQry:='exec GetWebServiceURL 3'
        else  StrQry:='exec GetWebServiceURL 4';
        Qry.Close;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        Qry.First;
        if (Qry.RecordCount>0) then begin
          StrUrl:=Qry.FieldValues['url_webservice'];
          NameSpace:=Qry.FieldValues['name_space'];
        end;
//        IsAuth:=True;
//        if Package.Checked=True then begin
//          for IntCount:=2 to StrGrid.RowCount-1 do begin
//            if(IntCount<>2) and (IsOk=True) then
//            begin
//              if (StrGrid.Cells[0,IntCount]<>'') AND (StrGrid.Cells[1,IntCount]<>'') AND
//              (StrGrid.Cells[0,IntCount]=StrGrid.Cells[0,IntCount-1]) AND
//              (StrGrid.Cells[1,IntCount]=StrGrid.Cells[1,IntCount-1]) AND
//              (StrGrid.Cells[2,IntCount]=StrGrid.Cells[2,IntCount-1]) AND
//              (StrGrid.Cells[0,IntCount]=StrGrid.Cells[0,IntCount-1]) AND
//              ((StrGrid.Cells[8,IntCount]<>StrGrid.Cells[8,IntCount-1]) OR
//              (StrGrid.Cells[9,IntCount]<>StrGrid.Cells[9,IntCount-1]) ) then
//              begin
//                StrEMsg:='Armada atau Driver harus sama !';
//                MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
//                IsOk:=False;
//
//                AuthorizedForm.FormId:='1311012';
//                AuthorizedForm.StrMessage:=' Otorisasi untuk dapat melanjutkan Simpan';
//                if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
//
//                if IsAuth=False then
//                begin
//                  Main.CloseDb;
//                  Main.M_Normal;
//                  IsInputGrid:=True;
//                  IsInput:=True;
//                  EnableInput;
//                  Exit;
//                end;
//
//              end;
//            end;
//          end;
//
//        end;

        if (IsAuth=True) then
        begin
          IsOk:=True;
          StrCompanyId:=CompanyId;
          StrLocationId:=LocationId;
          StrOrderId:=QuotedStr(OrderId.Text);
          StrCustomerId:=QuotedStr(CustomerId.Text);
          StrReserver:='dbo.GetUsername('+QuotedStr(ReservationUser.Text)+')';
          if Trim(Group.Text)<>'' then StrGroup:=QuotedStr(Trim(Group.Text)) else StrGroup:='NULL';
          if Trim(Guide.Text)<>'' then StrGuide:=QuotedStr(Trim(Guide.Text)) else StrGuide:='NULL';
          if Trim(GuideCellular.Text)<>'' then StrGuideCellular:=QuotedStr(Trim(GuideCellular.Text)) else StrGuideCellular:='NULL';
          if Package.Checked then StrPackage:='1' else StrPackage:='NULL';
          if LockBooking.Checked=True then StrLockBooking:='1' else StrLockBooking:='0';
          if isFix.Checked then StrFix:='1' else StrFix:='0';

          if Status.Visible then if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
          else StrStatus:='1';
          if (ReservedId.Text<>'')  then begin
            StrTransId:=BookedId;
            StrQry:='UPDATE wh_reserved_order SET status='+StrStatus+',field_contact='+StrGuide+
                    ',field_contact_cellular_no='+StrGuideCellular+',group_name='+StrGroup+
                    ',daily_package='+StrPackage+',lock_order='+StrLockBooking+',isFix='+StrFix+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE reserved_order_id='+QuotedStr(StrTransId)+';';
            if not(IsSetLock) then begin
              if StrStatus='1' then begin
                {hanya update yang surat jalannya belum terbentuk}
                StrQry:=StrQry+' UPDATE wh_reserved_order_detail SET status=0 '+
                        //',update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (reserved_order_id='+QuotedStr(StrTransId)+') AND (status=1) ;';//AND ISNULL(vhc_trans_id, '+QuotedStr('kosong')+')='+QuotedStr('kosong')+';';

                  StrQry:=StrQry+' UPDATE wh_reserved_order_detail_detail SET status=0 '+
                        //',update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (reserved_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
                StrQry:=StrQry+' UPDATE wh_reserved_order_detail_package SET status=0 '+
                        //',update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (reserved_order_id='+QuotedStr(StrTransId)+') AND (status=1);';
              end;
            end;
          end else begin
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
            if Status.Checked=True then
            begin
              InitGrid;
              StrStatusWL:='0';
              StrQry:='UPDATE wh_customer_order set status=3 WHERE customer_order_id='+StrOrderId+';';
              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,4);
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  Main.TransRollback;
                  IsOk:=False;
                  EnableInput;
                  StrEMsg:=StrEMsg+E.Message;
                  MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                  Exit;
                end;
              end;

            end else begin
              StrStatusWL:='1'
            end;

            StrQry:='INSERT INTO wh_reserved_order (reserved_order_id,customer_order_id,company_id,location_id'+
                    ',customer_id,field_contact,field_contact_cellular_no,group_name,daily_package,lock_order,submit_user,isFix,update_user,status)'+
                    ' VALUES '+
                    '('+QuotedStr(StrTransId)+','+StrOrderId+','+StrCompanyId+','+StrLocationId+
                    ','+StrCustomerId+','+StrGuide+','+StrGuideCellular+','+StrGroup+','+StrPackage+
                    ','+StrLockBooking+','+StrReserver+','+StrFix+','+QuotedStr(User)+','+StrStatusWL+');';
          end;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              Main.TransRollback;
              IsOk:=False;
  //            Exit ;
              EnableInput;
              StrEMsg:=StrEMsg+E.Message;
              MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              Exit;
            end;
          end;

          if (StrIsOnline='1') AND (LeftStr(UpperCase(FormRequest),12)='WAITINGLIST') then  //sudah diganti
          begin
            StrQryWehaOnlineCek:='SELECT a.OrderDetailVehicleID FROM OrderDetailVehicles a '+
                                 'LEFT JOIN OrderDetails b ON a.OrderDetailID=b.OrderDetailID '+
                                 'LEFT JOIN Orders c ON b.OrderId=c.OrderId WHERE '+
                                 'c.OrderNo = '+QuotedStr(OrderId.Text);
            QryWehaOnline.Close;
            QryWehaOnline.SQL.Clear;
            QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
            QryWehaOnline.Open;

            if QryWehaOnline.RecordCount>0 then
            begin
              StrOrderDetailVehicleID:= QryWehaOnline.FieldValues['OrderDetailVehicleID'];
            end;
          end;

          if not(IsSetLock) then begin
            StrQry:='SELECT RIGHT(MAX(reserved_order_detail_id),5) AS max_id FROM wh_reserved_order_detail '+
                    'WHERE reserved_order_detail_id  LIKE '+QuotedStr('RESR'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'_____')+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['max_id']<>NULL then begin
              StrTransId2:=Qry.FieldValues['max_id'];
              StrTransId2:=Format('%.*d',[5,StrToInt(StrTransId2)+1]);
              Qry.Close;
              Qry.SQL.Clear;
            end else
              StrTransId2:='00000';
            StrQry:='';
            IntCount2:=0;
            StrList:=TStringList.Create;

            if StrStatus='1' then begin
              StrJsonRsvId := '';
              StrJsonRsvIdWL:= '';
              {start for}
              //ShowMessage(IntToStr(StrGrid.RowCount));
              for IntCount:=2 to StrGrid.RowCount-1 do begin

                if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') //sudah diganti
                and (StrGrid.Cells[15,IntCount]<>'') and (StrGrid.Cells[17,IntCount]<>'') then begin   //sudah diganti
                  Inc(IntCount2);
                  StrQry := '';
                  StrTransIds:=Format('%.*d',[5,StrToInt(StrTransId2)+IntCount2+1]);
                  StrTransIds:='RESR'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransIds;
                  StrProductPriceId:=QuotedStr(StrGrid.Cells[13,IntCount]);  //sudah diganti
                  StrDestination:=QuotedStr(Trim(StrGrid.Cells[1,IntCount]));
                  StrPickup:=QuotedStr(Trim(StrGrid.Cells[2,IntCount]));
                  StrFromDates:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[4,IntCount])));
                  StrToDates:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[5,IntCount])));
                  StrFromTimes:=QuotedStr(StrGrid.Cells[6,IntCount]);
                  StrTimeStandby:=QuotedStr(StrGrid.Cells[7,IntCount]);
                  if StrGrid.Cells[20,IntCount]='2' then StrToTimes:=QuotedStr('23:59')   //sudah diganti
  //              else StrToTimes:=QuotedStr(LeftStr(TimeToStr(StrToTime(StrGrid.Cells[6,IntCount])+EncodeTime(StrToInt(StrGrid.Cells[20,IntCount]),0,0,0)),5));
                  else StrToTimes:=QuotedStr(FormatDateTime('HH:nn',StrToTime(StrGrid.Cells[6,IntCount])+EncodeTime(StrToInt(StrGrid.Cells[21,IntCount]),0,0,0))); //sudah diganti
                   StrToTimes:=QuotedStr('00:00') ;

//                  if StrPackage<>'1' then begin
                    StrVehicleId:=QuotedStr(StrGrid.Cells[16,IntCount]); //sudah diganti
                    StrEmployeeId:=QuotedStr(StrGrid.Cells[17,IntCount]);  //sudah diganti
                    if StrGrid.Cells[19,IntCount]<>'' then StremployeeId2:=QuotedStr(StrGrid.Cells[19,IntCount]) else StremployeeId2:='NULL'; //sudah diganti
                    if StrGrid.Cells[22,IntCount]<>'' then StrVhcTransId:=QuotedStr(StrGrid.Cells[22,IntCount]) else StrVhcTransId:='NULL';   //sudah diganti
//                  end else begin
//                    StrVehicleId:='NULL';
//                    StrEmployeeId:='NULL';
//                    StremployeeId2:='NULL';
//                    StrVhcTransId:='NULL';
//                  end;
                  StrFullDay:=StrGrid.Cells[20,IntCount]; //sudah diganti
                  if StrGrid.Cells[12,IntCount]<>'' then StrRemark:=QuotedStr(StrGrid.Cells[12,IntCount]) else StrRemark:='NULL'; //sudah diganti
                  if StrGrid.Cells[23,IntCount]<>'' then StrRemarkChange:=QuotedStr(StrGrid.Cells[23,IntCount]) else StrRemarkChange:='NULL'; //sudah diganti

                  if StrGrid.Cells[29,IntCount]<>'' then StrIsAuth:=QuotedStr(StrGrid.Cells[29,IntCount]) else StrIsAuth:='NULL';           //sudah diganti
                  if StrGrid.Cells[30,IntCount]<>'' then StrIsAuthReason:=QuotedStr(StrGrid.Cells[30,IntCount]) else StrIsAuthReason:='NULL'; //sudah diganti
                  if StrGrid.Cells[33,IntCount]<>'' then StremployeeId3:=QuotedStr(StrGrid.Cells[33,IntCount]) else StremployeeId3:='NULL';
                  if StrGrid.Cells[11,IntCount]<>'' then StrHelperName:=QuotedStr(StrGrid.Cells[11,IntCount]) else StrHelperName:='NULL';
                  if StrGrid.Cells[34,IntCount]<>'' then StrHelperPhone:=QuotedStr(StrGrid.Cells[34,IntCount]) else StrHelperPhone:='NULL';

  //                isAuth, isAuthReason,
                  if (StrVhcTransId='NULL') then begin
                    StrQry:='INSERT INTO wh_reserved_order_detail (reserved_order_detail_id,reserved_order_id'+
                            ',product_price_id,from_date,to_date,from_time,to_time,standby_time,route,pickup_point'+
                            ',vehicle_id,employee_id,employee_id2,vhc_trans_id,full_day,remark,remark_change,update_user,isAuth, '+
                            ' isAuthReason,employee_id3 ) VALUES '+
                            '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+StrProductPriceId+
                            ','+StrFromDates+','+StrToDates+','+StrFromTimes+','+StrToTimes+','+StrTimeStandby+
                            ','+StrDestination+','+StrPickup+','+StrVehicleId+','+StrEmployeeId+','+StremployeeId2+
                            ','+StrVhcTransId+','+StrFullDay+','+StrRemark+','+StrRemarkChange+','+QuotedStr(User)+
                            ','+StrIsAuth+','+StrIsAuthReason+','+StremployeeId3+');';
                    StrList:=SplitStrings(StrGrid.Cells[14,IntCount],'##'); //sudah diganti

                    for IntCount3:=0 to StrList.Count-1 do begin
                      if Trim(StrList.Strings[IntCount3])<>'' then begin
                        StrQry:=StrQry+'INSERT INTO wh_reserved_order_detail_detail (reserved_order_detail_id,reserved_order_id'+
                              ',customer_order_detail_id,update_user) VALUES '+
                              '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+QuotedStr(StrList.Strings[IntCount3])+
                              ','+QuotedStr(User)+');';
                      end;
                    end;
                  end else if (StrVhcTransId<>'NULL') then begin
                    StrQry:='INSERT INTO wh_reserved_order_detail (reserved_order_detail_id,reserved_order_id'+
                            ',product_price_id,from_date,to_date,from_time,to_time,standby_time,route,pickup_point'+
                            ',vehicle_id,employee_id,employee_id2,vhc_trans_id,full_day,remark,remark_change,update_user,isAuth,'+
                            ' isAuthReason, employee_id3) VALUES '+
                            '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+StrProductPriceId+
                            ','+StrFromDates+','+StrToDates+','+StrFromTimes+','+StrToTimes+','+StrTimeStandby+
                            ','+StrDestination+','+StrPickup+','+StrVehicleId+','+StrEmployeeId+','+StremployeeId2+
                            ','+StrVhcTransId+','+StrFullDay+','+StrRemark+','+StrRemarkChange+','+QuotedStr(User)+
                            ','+StrIsAuth+','+StrIsAuthReason+','+StremployeeId3+');';
                    StrList:=SplitStrings(StrGrid.Cells[14,IntCount],'##'); //sudah diganti

                    for IntCount3:=0 to StrList.Count-1 do begin
                      if Trim(StrList.Strings[IntCount3])<>'' then begin
                        StrQry:=StrQry+'INSERT INTO wh_reserved_order_detail_detail (reserved_order_detail_id,reserved_order_id'+
                              ',customer_order_detail_id,update_user) VALUES '+
                              '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+QuotedStr(StrList.Strings[IntCount3])+
                              ','+QuotedStr(User)+');';
                      end;
                    end;
                  end;
//                  else if (StrPackage='1') then begin
//                    StrQry:='INSERT INTO wh_reserved_order_detail (reserved_order_detail_id,reserved_order_id'+
//                            ',product_price_id,from_date,to_date,from_time,to_time,standby_time,route,pickup_point'+
//                            ',vehicle_id,employee_id,employee_id2,vhc_trans_id,full_day,remark,remark_change,update_user,isAuth, isAuthReason) VALUES '+
//                            '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+StrProductPriceId+
//                            ','+StrFromDates+','+StrToDates+','+StrFromTimes+','+StrToTimes+','+StrTimeStandby+
//                            ','+StrDestination+','+StrPickup+','+StrVehicleId+','+StrEmployeeId+','+StremployeeId2+
//                            ','+StrVhcTransId+','+StrFullDay+','+StrRemark+','+StrRemarkChange+','+QuotedStr(User)+StrIsAuth+','+StrIsAuthReason+');';
//                    StrList:=SplitStrings(StrGrid.Cells[13,IntCount],'##');
//                    for IntCount3:=0 to StrList.Count-1 do begin
//                      if Trim(StrList.Strings[IntCount3])<>'' then begin
//                        StrQry:=StrQry+'INSERT INTO wh_reserved_order_detail_detail (reserved_order_detail_id,reserved_order_id'+
//                              ',customer_order_detail_id,update_user) VALUES '+
//                              '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+QuotedStr(StrList.Strings[IntCount3])+
//                              ','+QuotedStr(User)+');';
//                      end;
//                    end;
//                  end;

                  StrEmployeeOld:=QuotedStr(StrGrid.Cells[31,IntCount]); //sudah diganti

  //                GESER UNIT
                  if (StrIsOnline='1') AND (LeftStr(UpperCase(FormRequest),11)<>'WAITINGLIST') then
                  begin
                  //  if (StrVhcTransId='NULL') then begin

                      StrQryWehaOnlineCek:='SELECT WehaReservedCode From OrderDetailVehicleInfos'+
                                          ' WHERE WehaReservedCode='+QuotedStr(StrGrid.Cells[23,IntCount]);
                      QryWehaOnline.Close;
                      QryWehaOnline.SQL.Clear;
                      QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                      QryWehaOnline.Open;

                      if QryWehaOnline.RecordCount>0 then
                      begin

                        if (StrEmployeeOld<>StrEmployeeId) then
                        begin
                          StrStatusOrderVehicleInfos:=' ,Status=''ORDERED'' ';
                        end else
                        begin
                          StrStatusOrderVehicleInfos:='';
                        end;

                        StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                             'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                             'b.CustomerNo='+StrEmployeeId+' AND b.IsActive=1';
                        QryWehaOnline.Close;
                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                        QryWehaOnline.Open;


                        if QryWehaOnline.RecordCount=0 then begin
                          StrQryWehaOnlineUser:= 'INSERT INTO Contacts '+
                                        '(FullName,Gender,'+
                                        'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                                        'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                                        '('+QuotedStr(StrGrid.Cells[9,IntCount])+',''M'' '+
                                        ','+QuotedStr(StrGrid.Cells[26,IntCount])+',0,0,0 '+ //sudah diganti
                                        ',GETDATE(),0,GETDATE(),0); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineUser);
                          try
                            QryWehaOnline.ExecSQL;
                          except
                            on E:Exception do begin
                              Main.TransRollback;
                              IsOk:=False;
                              EnableInput;
                              StrEMsg:=StrEMsg+E.Message;
                              MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                              Exit;
                            end;
                          end;


                          StrQryWehaOnlineCek:='SELECT TOP 1 ContactID FROM Contacts '+
                                               'WHERE CreatedBy=0 Order By ContactID DESC';
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                          StrWehaUserID:=StringReplace(QuotedStr(StrGrid.Cells[9,IntCount]),' ','.',[rfReplaceAll]);



                          StrQryWehaOnlineUser:= 'INSERT INTO Users '+
                                        '(ContactID,CustomerNo,'+
                                        'Email,Password,Role,LoginType,WehaUserID,'+
                                        'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                                        '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                                        ','+StrEmployeeId+','+StrWehaUserID+' '+
                                        ',NULL,''DRIVER'',''EMAIL'' '+
                                        ','+StrWehaUserID+' '+
                                        ',1,0,GETDATE(),0,GETDATE()); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineUser);
                          try
                            QryWehaOnline.ExecSQL;
                          except
                            on E:Exception do begin
                              Main.TransRollback;
                              IsOk:=False;
                              EnableInput;
                              StrEMsg:=StrEMsg+E.Message;
                              MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                              Exit;
                            end;
                          end;

                          StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                             'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                             'b.CustomerNo='+StrEmployeeId+' AND b.IsActive=1';
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                        end;



                        if StremployeeId3<>'NULL' then
                        begin

                          StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                                 'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                                 'b.CustomerNo='+StremployeeId3+' AND b.IsActive=1';
                          QryWehaOnline2.Close;
                          QryWehaOnline2.SQL.Clear;
                          QryWehaOnline2.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline2.Open;


                          if QryWehaOnline2.RecordCount=0 then begin
                            StrHelperFullName := '';
                            StrHelperHP := '';
                            StrHelperUserID := '';

                            StrQryWehaOnlineUser:= 'INSERT INTO Contacts '+
                                          '(FullName,Gender,'+
                                          'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                                          'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                                          '('+StrHelperName+',''M'' '+
                                          ','+StrHelperPhone+',0,0,0 '+
                                          ',GETDATE(),0,GETDATE(),0); ';

                            QryWehaOnline2.SQL.Clear;
                            QryWehaOnline2.SQL.Add(StrQryWehaOnlineUser);
                            try
                              QryWehaOnline2.ExecSQL;
                            except
                              on E:Exception do begin
                                Main.TransRollback;
                                IsOk:=False;
                                EnableInput;
                                StrEMsg:=StrEMsg+E.Message;
                                MessageBox(Handle,PChar('Surat Jalan tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Surat jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                                Exit;
                              end;
                            end;


                            StrQryWehaOnlineCek:='SELECT TOP 1 ContactID FROM Contacts '+
                                                 'WHERE CreatedBy=0 Order By ContactID DESC';
                            QryWehaOnline2.Close;
                            QryWehaOnline2.SQL.Clear;
                            QryWehaOnline2.SQL.Add(StrQryWehaOnlineCek);
                            QryWehaOnline2.Open;

                            StrWehaUserID:=StringReplace(StrHelperName,' ','.',[rfReplaceAll]);

                            StrQryWehaOnlineUser:= 'INSERT INTO Users '+
                                          '(ContactID,CustomerNo,'+
                                          'Email,Password,Role,LoginType,WehaUserID,'+
                                          'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsHelper) VALUES '+
                                          '('+QuotedStr(QryWehaOnline2.FieldValues['ContactID'])+' '+
                                          ','+StremployeeId3+','+StrWehaUserID+' '+
                                          ',NULL,''DRIVER'',''EMAIL'' '+
                                          ','+StrWehaUserID+' '+
                                          ',1,0,GETDATE(),0,GETDATE(),1); ';

                            QryWehaOnline2.SQL.Clear;
                            QryWehaOnline2.SQL.Add(StrQryWehaOnlineUser);
                            try
                              QryWehaOnline2.ExecSQL;
                            except
                              on E:Exception do begin
                                Main.TransRollback;
                                IsOk:=False;
                                EnableInput;
                                StrEMsg:=StrEMsg+E.Message;
                                MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Surat Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                                Exit;
                              end;
                            end;

                            StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                               'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                               'b.CustomerNo='+StremployeeId3+' AND b.IsActive=1';
                            QryWehaOnline2.Close;
                            QryWehaOnline2.SQL.Clear;
                            QryWehaOnline2.SQL.Add(StrQryWehaOnlineCek);
                            QryWehaOnline2.Open;

                            StrHelperFullName :=  QuotedStr(QryWehaOnline2.FieldValues['FullName']);
                            StrHelperHP :=  QuotedStr(QryWehaOnline2.FieldValues['HP']);
                            StrHelperUserID :=  QuotedStr(QryWehaOnline2.FieldValues['UserID']);

                          end;
//                          StrQry:=' UPDATE OrderDetailVehicleInfos SET WorkOrderNo='+QuotedStr(StrTransId)+
//                                ' ,HelperName='+QuotedStr(QryWehaOnline2.FieldValues['FullName'])+',HelperPhone='+QuotedStr(QryWehaOnline2.FieldValues['HP'])+
//                                ' ,WEHAHelperCustomerNo='+StremployeeId3+',HelperID='+QuotedStr(QryWehaOnline2.FieldValues['UserID'])+
//                                ' WHERE WehaReservedCode='+StrReservedOrderDetailId;
                        end;
                        if StrHelperFullName = '' then StrHelperFullName := QuotedStr('');
                        if StrHelperHP = '' then StrHelperHP :=  QuotedStr('');
                        if StrHelperUserID = '' then StrHelperUserID :=  QuotedStr('');


                        StrQryWehaOnline:=  StrQryWehaOnline+' UPDATE OrderDetailVehicleInfos SET '+
                                            ' WehaReservedCode='+QuotedStr(StrTransIds)+', '+
                                            ' DriverID='+QuotedStr(QryWehaOnline.FieldValues['UserID'])+','+
                                            ' DriverName='+QuotedStr(QryWehaOnline.FieldValues['FullName'])+', '+
                                            ' DriverPhone='+QuotedStr(QryWehaOnline.FieldValues['HP'])+', '+
                                            ' VehiclePlateNo='+QuotedStr(StrGrid.Cells[27,IntCount])+', '+  //sudah diganti
                                            ' IsFixed='+StrFix+ StrStatusOrderVehicleInfos+', '+
                                            ' WEHACustomerNo='+StrEmployeeId+',HelperName='+StrHelperFullName+','+
                                            'HelperPhone='+StrHelperHP+','+
                                            'WEHAHelperCustomerNo='+StremployeeId3+',HelperID='+StrHelperUserID+
                                            ' WHERE WehaReservedCode='+QuotedStr(StrGrid.Cells[24,IntCount])+';';  //sudah diganti

                      end else
                      begin
                        isOk := False;
                        Main.TransRollback;
                        EnableInput;
                        Main.M_Normal;
                        StrEMsg:=QuotedStr(StrGrid.Cells[23,IntCount])+' not found';
                        MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                        Exit;
                      end;
                   // end;
                  end;

  //                WAITINGLIST
                  if (StrIsOnline='1') AND (LeftStr(UpperCase(FormRequest),12)='WAITINGLIST') then   //sudah diganti
                  begin

                    StrOrderDetailVehicleID:= StrOrderDetailVehicleID;
                    StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                         'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                         'b.CustomerNo='+StrEmployeeId+' AND b.IsActive=1';
                    QryWehaOnline.Close;
                    QryWehaOnline.SQL.Clear;
                    QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                    QryWehaOnline.Open;

                    StrQryWehaOnline:=  StrQryWehaOnline+' INSERT INTO '+
                                        'OrderDetailVehicleInfos '+
                                        '(OrderDetailVehicleID,WehaReservedCode,'+
                                        'VehiclePlateNo,DriverName,'+
                                        'DriverPhone,Status,CreatedBy,ModifiedBy,DriverID,'+
                                        'IsFixed,Overtime,OvertimeFee,CreatedDate'+
                                        ',ModifiedDate,WEHACustomerNo) VALUES '+
                                        '('+QuotedStr(StrOrderDetailVehicleID)+' '+
                                        ','+QuotedStr(StrTransIds)+' '+
                                        ','+QuotedStr(StrGrid.Cells[27,IntCount])+' '+    //sudah diganti
                                        ','+QuotedStr(QryWehaOnline.FieldValues['FullName'])+' '+
                                        ','+QuotedStr(QryWehaOnline.FieldValues['HP'])+' '+
                                        ',''ORDERED'',588,0 '+
                                        ','+QuotedStr(QryWehaOnline.FieldValues['UserID'])+' '+
                                        ','+StrFix+',0,0,GETDATE(),GETDATE(),'+StrEmployeeId+');';

                  end;

                  StrQryLog:='';
                  StrRemarkChangeVehicle:=QuotedStr(StrGrid.Cells[28,IntCount]);   //sudah diganti
                  StrList:=SplitStrings(StrGrid.Cells[28,IntCount],'|');  //sudah diganti
                  StrBatchOld := StrList.Strings[0];
                  StrSeatOld  := StrGrid.Cells[18,IntCount]; //sudah diganti
                  StrVehicleOld:=StrGrid.Cells[33,IntCount]; //sudah diganti


  //                if (StrEmployeeId<>StrEmployeeOld) then begin
  //                  StrRemarkChangeVehicle:=QuotedStr(StrGrid.Cells[27,IntCount]);
  //                  StrList:=SplitStrings(StrGrid.Cells[27,IntCount],'|');
  //                  StrBatchOld := StrList.Strings[0];
  //                  StrSeatOld  := StrGrid.Cells[17,IntCount];
  //
  //                  StrBatchNew := StrList.Strings[1];
  //                  StrList:=SplitStrings(StrBatchNew,'-');
  //                  StrBatchNew := StrList.Strings[0];
  //                  StrSeatNew  := StrList.Strings[1];
  //
  //                  StrQryLog:='INSERT INTO wh_reserved_order_chg_vhc_hist ('+
  //                            'customer_order_id, reserved_order_detail_id, batch_old, seat_old,'+
  //                            'batch_new, seat_new, remark, update_user,employee_id_old,employee_id_new,'+
  //                            'vehicle_id_old,vehicle_id_new) VALUES '+
  //                            '('+QuotedStr(OrderId.Text)+','+QuotedStr(StrGrid.Cells[23,IntCount]+' menjadi '+StrTransIds)+','+QuotedStr(StrBatchOld)+','+QuotedStr(StrSeatOld)+','+
  //                                QuotedStr(StrBatchNew)+','+QuotedStr(StrSeatNew)+','+StrRemarkChange+','+QuotedStr(User)+','+
  //                            StrEmployeeId+','+QuotedStr(StrEmployeeOld)+','+QuotedStr(StrVehicleOld)+','+StrVehicleId+');';
  //                end else begin
  //                  StrRemarkChangeVehicle:='NULL';
  //                end;

  //                  StrJsonRsvId := StrJsonRsvId + '{"OldWehaReservedCode":"'+StrGrid.Cells[23,IntCount]+'", "NewWehaReservedCode" : "'+StrTransIds+'", "NewDriverName" : "'+StrGrid.Cells[24,IntCount]+'", "NewDriverPhone" : "'+StrGrid.Cells[25,IntCount]+'", "NewVehiclePlateNo" : "'+StrGrid.Cells[26,IntCount]+'", "StandByTime" : "'+stringreplace(StrFromDates+' '+StrTimeStandby, #39, '', [rfReplaceAll, rfIgnoreCase])+'"}, ';
  //                StrJsonRsvIdWL:= StrJsonRsvIdWL+ '{"OrderDetailVehicleID" : "'+StrVehicleId+'", "NoReserveDetailId" : "'+StrTransIds+'", "DriverName" : "'+StrGrid.Cells[24,IntCount]+'", "DriverCellPhone" : "'+StrGrid.Cells[25,IntCount]+'", "LicensePlate" : "'+StrGrid.Cells[26,IntCount]+'"}, ';
                  if (trim(StrQry)<>'') then begin
                    Qry.SQL.Clear;
                    Main.WriteLog('SQL :'+StrQry,4);
                    Qry.SQL.Add(StrQryLog+StrQry);
                    try
                      Qry.ExecSQL;
                    except
                      on E:Exception do begin
                        Main.TransRollback;
                        IsOk:=False;

                        EnableInput;
                        Main.M_Normal;
                        StrEMsg:=StrEMsg+E.Message+#13#10+StrQry;
                        MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                        Exit;
                      end;
                    end;
                  end;

//                  if StrPackage='1' then begin
//                    StrList:=SplitStrings(StrGrid.Cells[21,IntCount],'##');
//                    StrVehicleId:=QuotedStr(StrGrid.Cells[15,IntCount]);
//                    StrEmployeeId:=QuotedStr(StrGrid.Cells[16,IntCount]);
//                    if StrGrid.Cells[18,IntCount]<>'' then StremployeeId2:=QuotedStr(StrGrid.Cells[18,IntCount]) else StremployeeId2:='NULL';
//                    if StrGrid.Cells[21,IntCount]<>'' then StrVhcTransId:=QuotedStr(StrGrid.Cells[21,IntCount]) else StrVhcTransId:='NULL';
//                    StrFromDates:=StrGrid.Cells[4,IntCount];
//                    StrToDates:=StrGrid.Cells[5,IntCount];
//                    IntFromYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrFromDates)));
//                    IntToYears:=StrToInt(FormatDateTime('yyyy',StrToDate(StrToDates)));
//                    for IntYears:=IntFromYears to IntToYears do begin
//                      if IntYears<IntToYears then begin
//                        if IntYears>IntFromYears then begin
//                          IntFromMonths:=1;
//                          IntToMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrToDates)));
//                        end else begin
//                          IntFromMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrFromDates)));
//                          IntToMonths:=12;
//                        end;
//                      end else begin
//                        if IntYears>IntFromYears then begin
//                          IntFromMonths:=1;
//                          IntToMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrToDates)));
//                        end else begin
//                          IntFromMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrFromDates)));
//                          IntToMonths:=StrToInt(FormatDateTime('mm',StrToDate(StrToDates)));
//                        end;
//                      end;
//                      for IntMonths:=IntFromMonths to IntToMonths do begin
//                        if (IntMonths<IntToMonths) OR ((IntMonths=IntToMonths) AND (IntYears<IntToYears)) then begin
//                          if IntMonths>IntFromMonths then begin
//                            IntFromDate:=1;
//                            IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
//                          end else begin
//                            IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrFromDates)));
//                            IntToDate:=StrToInt(FormatDateTime('dd',EndOfAMonth(IntYears,IntMonths)));
//                          end;
//                        end else begin
//                          if (IntMonths>IntFromMonths) OR ((IntMonths=IntToMonths) AND (IntFromYears<IntYears)) then begin
//                            IntFromDate:=1;
//                            IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrToDates)))
//                          end else begin
//                             IntFromDate:=StrToInt(FormatDateTime('dd',StrToDate(StrFromDates)));
//                             IntToDate:=StrToInt(FormatDateTime('dd',StrToDate(StrToDates)))
//                          end;
//                        end;
//                        for IntDates:=IntFromDate to IntToDate do begin
//                          StrVhcTransId:='NULL';
//                          Dates:=StrToDate(IntToStr(IntDates)+'/'+IntToStr(IntMonths)+'/'+IntToStr(IntYears));
//                          for IntCount3:=0 to StrList.Count-1 do begin
//                            if StrList.Strings[IntCount3]<>'' then begin
//                              StrList2:=TStringList.Create;
//                              StrList2:=SplitStrings(StrList.Strings[IntCount3],'**');
//                              if StrList2.Strings[1]=FormatDateTime('yyyy/mm/dd',Dates) then StrVhcTransId:=QuotedStr(StrList2.Strings[0]);
//
//                              FreeAndNil(StrList2);
//                            end;
//                          end;
//                          StrQry:='INSERT INTO wh_reserved_order_detail_package (reserved_order_detail_id,reserved_order_id'+
//                                  ',vehicle_id,employee_id,from_date,to_date,vhc_trans_id,update_user) VALUES '+
//                                  '('+QuotedStr(StrTransIds)+','+QuotedStr(StrTransId)+','+StrVehicleId+','+StrEmployeeId+
//                                  ','+QuotedStr(FormatDateTime('yyyy/mm/dd',Dates))+
//                                  ','+QuotedStr(FormatDateTime('yyyy/mm/dd',Dates))+
//                                  ','+StrVhcTransId+','+QuotedStr(User)+');';
//                          Qry.SQL.Clear;
//                          Main.WriteLog('SQL :'+StrQry,2);
//                          Qry.SQL.Add(StrQry);
//                          try
//                            Qry.ExecSQL;
//                          except
//                            on E:Exception do begin
//                              Main.TransRollback;
//                              IsOk:=False;
//                              EnableInput;
//                              Main.M_Normal;
//                              StrEMsg:=StrEMsg+E.Message;
//                              MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
//                              Exit;
//                            end;
//                          end;
//                        end;
//                      end
//                    end;
//                  end;
                end;
              end;
              {end for}
            end;
            FreeAndNil(StrList);

            Qry.Close;
            StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Allow_WL_Less_Unit_CompanyId_'+CompanyId)+') AND (active=1);';
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.RecordCount>0 then begin
              if Qry.FieldValues['value_string']=1 then isLessUnit:=True;
              if Qry.FieldValues['value_string']=0 then isLessUnit:=False;
            end;
            Qry.Close;

            StrQry:='SELECT (SELECT COUNT(*) FROM wh_reserved_order_detail_detail aa  '+
                    ' LEFT JOIn wh_reserved_order ab ON ab.reserved_order_id=aa.reserved_order_id '+
                    ' WHERE ((aa.customer_order_detail_id=a.customer_order_detail_id) AND (aa.status=1)) AND (ab.status=1) ) AS reserved_units'+
                    ',* FROM wh_customer_order_detail a '+
                    ' WHERE (customer_order_id='+StrOrderId+') AND (a.status=1) ;';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            IsComplete:=True;
            Qry.Open;
            if Qry.RecordCount>0 then while not(Qry.Eof) do begin
              if isLessUnit=False Then Begin
                if Qry.FieldValues['units']>Qry.FieldValues['reserved_units'] then IsComplete:=False;
              End;
              Qry.Next;
            end;
            Qry.Close;
            if IsComplete then
               StrQry:='UPDATE wh_customer_order SET complete=1 WHERE customer_order_id='+StrOrderId+';'
            else
               StrQry:='UPDATE wh_customer_order SET complete=NULL WHERE customer_order_id='+StrOrderId+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                Main.TransRollback;
                IsOk:=False;

                EnableInput;
                StrEMsg:=StrEMsg+E.Message;
                MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                Exit;
              end;
            end;
          end;
          if (IsOk=True) then begin
            Qry.Close;
            StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('PostingData_WehaOnline')+') AND (active=1);';
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.RecordCount>0 then begin
              if Qry.FieldValues['value_string']=1 then CallApi:=True;
              if Qry.FieldValues['value_string']=0 then CallApi:=False;
            end;
            Qry.Close;

            if StrIsOnline='0' Then CallApi:=False;

            if StrIsOnline='1' then begin
  //            if LeftStr(UpperCase(FormRequest),11)<>'WAITINGLIST' then
  //            begin
              QryWehaOnline.SQL.Clear;
              QryWehaOnline.SQL.Add(StrQryWehaOnline);
              try
                QryWehaOnline.ExecSQL;
                isOk := True;
              except
                on E:Exception do begin
                  Main.TransRollback;
                  IsOk:=False;

                  EnableInput;
                  StrEMsg:=StrEMsg+E.Message;
                  MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                  Exit;
                end;
              end;
              if LeftStr(UpperCase(FormRequest),12)='WAITINGLIST' then  //sudah diganti
              begin
                if Status.Checked=True then
                begin
                  StrQryWehaOnline:='UPDATE Orders SET Status=''WAITING_CANCELLED'','+
                                  'WaitingListStatus=''PROCESSED::'+StrTransId+''','+
                                  'CancelledReason=''Armada tidak tersedia'',modifiedDate=getdate() '+
                                  'WHERE OrderNo='+QuotedStr(OrderId.Text);
                end else begin
                  StrQryWehaOnline:='UPDATE Orders SET Status=''WAITING_RESPONSE'','+
                                  'WaitingListStatus=''PROCESSED::'+StrTransId+''','+
                                  'modifiedDate=getdate() '+
                                  'WHERE OrderNo='+QuotedStr(OrderId.Text);
                end;

                QryWehaOnline.SQL.Clear;
                QryWehaOnline.SQL.Add(StrQryWehaOnline);
                try
                  QryWehaOnline.ExecSQL;
                  isOk := True;
                except
                  on E:Exception do begin
                    Main.TransRollback;
                    IsOk:=False;

                    EnableInput;
                    StrEMsg:=StrEMsg+E.Message;
                    MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end;

            end;


            {
            if CallApi then begin
              if LeftStr(UpperCase(FormRequest),11)='WAITINGLIST' then begin
                //WebService.WSDLLocation := StrUrl;
                WebService.Port := 'JadeServiceSoap';
                WebService.Service := 'JadeService';
                //if StrGrid.RowCount-3
                Try
                  if LowerCase(Main.Db)='wh_prod' then
                    API := GetJadeServiceSoap(True,'',WebService, StrUrl, NameSpace)
                  else
                    API := GetJadeServiceSoap(False,'',WebService, StrUrl, NameSpace);
                  StrReqOrderNo := OrderId.Text;
              }//    if trim(StrJsonRsvIdWL)='' then StrJsonRsvIdWL:='{}';
                {  ParamJsonRsvId:= '['+StrJsonRsvIdWL+']';
                  ParamIn := 'StrReqOrderNo='+StrReqOrderNo+'; ParamJsonRsvId='+ParamJsonRsvId;
                  Main.WriteTableLog('Penjadwalan WaitingList - ChangeVehicleReservedCode',ParamIn, 'Mulai');
                  ResponAPI := API.UpdateOrderWaitingList(StrReqOrderNo, StrTransId, trim(ParamJsonRsvId));
                  if (LowerCase(ResponAPI.Status)='error') then begin
                    if IsDataFound Then Begin
                      isOk := False;
                      EnableInput;
                      StrEMsg := StrEMsg + Chr(13)+'Error API(1) : '+ResponAPI.Message;
                      StrEMsgAPI := ResponAPI.Message;
                    end else begin
                      if (lowercase(Copy(ResponAPI.Message, 1, 15))<>'unable to found') then begin
                        isOk := False;
                        EnableInput;
                        StrEMsg := StrEMsg + Chr(13)+'Error API(0) : '+ResponAPI.Message;
                        StrEMsgAPI := ResponAPI.Message;
                      end;
                    end;
                  end;

                  if (LowerCase(ResponAPI.Message)='cancelled') then begin
                    StrQry:='UPDATE wh_customer_order SET status=3,update_time=GETDATE(),update_user='+QuotedStr(User)+
                            ' WHERE customer_order_id='+QuotedStr(StrReqOrderNo)+';';
                    StrQry:=StrQry+
                            ' UPDATE wh_reserved_order SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                            ' WHERE customer_order_id='+QuotedStr(StrReqOrderNo)+';';
                    Qry.SQL.Clear;
                    Main.WriteLog('SQL :'+StrQry,2);
                    Qry.SQL.Add(StrQry);
                    try
                      Qry.ExecSQL;
                    except
                      on E:Exception do begin
                        Main.TransRollback;
                        IsOk:=False;
                        EnableInput;
                        StrEMsg:=StrEMsg+E.Message;
                        Exit;
                      end;
                    end;
                  end;
                  Main.WriteTableLog('Penjadwalan WaitingList',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
                Except
                  On E:Exception Do Begin
                    //Main.WriteTableLog('Penjadwalan WaitingList',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
                    Main.WriteTableLog('Penjadwalan WaitingList',ParamIn, 'Message Exception : '+e.Message);

                    if AnsiContainsText(e.message, 'timed out') then
                      isOk := true
                    else begin
                      isOk := False;
                      EnableInput;
                      ShowMessage('Error API'+#13#10+e.Message);
                    end;

                  End;
                end;

              end else begin
                //WebService.WSDLLocation := StrUrl;
                WebService.Port := 'JadeServiceSoap';
                WebService.Service := 'JadeService';

                Try
                  if LowerCase(Main.Db)='wh_prod' then
                    API := GetJadeServiceSoap(True,'',WebService, StrUrl, NameSpace)
                  else
                    API := GetJadeServiceSoap(False,'',WebService, StrUrl, NameSpace);
                  StrReqOrderNo := OrderId.Text;
                  ParamJsonRsvId:= '['+StrJsonRsvId+']';
                  ParamIn := 'StrReqOrderNo='+OrderId.Text+'; ParamJsonRsvId='+ParamJsonRsvId+'; IsFixed='+StrFix;

                  Main.WriteTableLog('Penjadwalan - ChangeVehicleReservedCode',ParamIn, 'Mulai');
                  ResponAPI := API.ChangeVehicleReservedCode(StrReqOrderNo, trim(ParamJsonRsvId), isFix.Checked);
                  if (LowerCase(ResponAPI.Status)='error') then begin
                    if IsDataFound Then Begin
                      isOk := False;
                      EnableInput;
                      StrEMsg := StrEMsg + Chr(13)+'Error API(1) : '+ResponAPI.Message;
                      StrEMsgAPI := ResponAPI.Message;
                    end else begin                                  //unable to found reserved code
                      if (lowercase(Copy(ResponAPI.Message, 1, 15))<>'unable to found') then begin
                        isOk := False;
                        EnableInput;
                        StrEMsg := StrEMsg + Chr(13)+'Error API(0) : '+ResponAPI.Message;
                        StrEMsgAPI := ResponAPI.Message;
                      end;
                    end;
                  end;
                  Main.WriteTableLog('Penjadwalan - ChangeVehicleReservedCode',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
                Except
                  On E:Exception Do Begin
                    Main.WriteTableLog('Penjadwalan - ChangeVehicleReservedCode',ParamIn, 'Message Exception : '+e.Message);
                    if AnsiContainsText(e.message, 'timed out') then
                      isOk := true
                    else begin
                      isOk := False;
                      EnableInput;
                      ShowMessage('Error API'+#13#10+e.Message);
                    end;

                  End;
                end;

              end;
            end;
            }
            if (IsOk) then begin
              Main.TransCommit;
              ReservedId.Text:=StrTransId;
              if LeftStr(UpperCase(FormRequest),11)='WAITINGLIST' then begin
                MessageBox(Handle,PChar('Data Berhasil Disimpan'),'Penjadwalan Data Tunggu',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end else begin
                if MessageBox(Handle,PChar('Data Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Penjadwalan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then
                  RePrint(StrTransId);
              end;
            end else begin
              Main.TransRollback;
              Main.WriteLog('Form Save: Fail='+StrEMsg,1);
              if LeftStr(UpperCase(FormRequest),12)='WAITINGLIST' then begin  //sudah diganti
                MessageBox(Handle,PChar('Data Gagal Disimpan..'+Chr(13)+Chr(13)+StrEMsgAPI+Chr(13)+Chr(13)),'Penjadwalan Data Tunggu',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end else begin
                MessageBox(Handle,PChar('Data Gagal Disimpan..'+Chr(13)+Chr(13)+StrEMsg+Chr(13)+Chr(13)),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
              EnableInput;
            end;
          end else begin
            Main.TransRollback;
            Main.WriteLog('Form Save: Fail='+StrEMsg,1);
            MessageBox(Handle,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            EnableInput;
          end;
        end;
      end;
      FreeAndNil(Qry)
  end else
    MessageBox(Handle,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Penjadwalan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingForm.FormShow(Sender: TObject);
var StrLock:String;
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  RefreshHeader;
  GroupIsFix.Enabled:=True;
  if LeftStr(UpperCase(FormRequest),12)='WAITINGLIST' then begin
    Caption:='Penjadwalan Data Tunggu';
    ListKunciCepat.Lines.Clear;
    LockBooking.Visible:=False;
    Package.Visible:=False;
    CetakUlang.Visible:=False;
    GroupIsFix.Enabled:=False;
    GroupBatal.Visible:=True;
    Status.Visible:=True;
  end;
  if (BookedId<>'') or (OrdersId<>'') then begin
    if LeftStr(UpperCase(FormRequest),11)<>'WAITINGLIST' then begin
//      Caption:='Penjadwalan Data Tunggu';
//    end else begin
      Caption:='Data Penjadwalan';
      ListKunciCepat.Lines.Add('Insert = Menambah Penjadwalan');
      ListKunciCepat.Lines.Add('Delete = Menghapus Helper');
      ListKunciCepat.Lines.Add('F5 = Tampilkan semua Armada');
      ListKunciCepat.Lines.Add('F6 = Tambahan Penjadwalan');
      LockBooking.Visible:=True;
//      Package.Visible:=True;
      CetakUlang.Visible:=False;
    end;
    LoadData;
    if (StrIsOnline='1') then
    begin
     Package.Visible:=True;
     Package.Enabled:=True;
     GroupPackage.Enabled:=False;
    end;
    RefreshGrid;
    if not(IsInput) then DisableInput;
    Bersihkan.Enabled:=False;
  end else begin
    ReservedDate.Text:=Main.Status.Panels.Items[0].Text;
    ReservationUser.Text:=FullName;
  end;

  if UpperCase(FormRequest)='MAIN-BOOKINGLOCK' then begin
    if LockBooking.Checked=False then begin
      LockBooking.Checked:=True;
      StrLock:='Mengunci';
    end else begin
      LockBooking.Checked:=False;
      StrLock:='Melepas kunci';
    end;
    if MessageBox(Handle,PChar('Yakin '+StrLock+' Penjadwalan'+Chr(13)+'Dari Pesanan '+Trim(OrderId.Text)),'Penjadwalan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then Simpan.Click
    else Close;
    IsSetLock:=True;
  end;
end;

procedure TBookingForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupBatal.Enabled:=False;
  Remark.Enabled:=False;
  IsInputGrid:=False;
  IsInput:=False;
  GroupPackage.Enabled:=False;
  GroupLock.Enabled:=False;
  GroupIsFix.Enabled:=False;
end;

procedure TBookingForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupBatal.Enabled:=True;
  Remark.Enabled:=True;
  GroupPackage.Enabled:=True;
  GroupLock.Enabled:=True;
  GroupIsFix.Enabled:=True;
end;

procedure TBookingForm.GetOrderDetail;
begin
  if (Main.IsFormOpen('OrderForm')=False) and (OrderId.Text<>'') then
    if LeftStr(UpperCase(FormRequest),12)='WAITINGLIST' then begin    //sudah diganti
      OrderForm:=TOrderForm.Create(Self,OrderId.Text,False,'WaitingList-Allocate')
    end else begin
      if UpperCase(FormRequest)='MAIN-FORCEADD' then begin
        OrderForm:=TOrderForm.Create(Self,OrderId.Text,False,'Reserved-ForceAdd')
      end else begin
        OrderForm:=TOrderForm.Create(Self,OrderId.Text,False,'Reserved-Create')
      end;
    end;
end;

procedure TBookingForm.DeleteOrderDetail;
var IntCount:Integer;
begin
  if IntRow>MinRowGrid then begin
    if MessageBox(Handle,'Mau Menghapus Produk baris ini ?','Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
      for IntCount:=0 to StrGrid.ColCount-1  do StrGrid.Cells[IntCount,IntRow]:='';
    end;
  end;
end;

procedure TBookingForm.DeleteVehicleDetail;
var IntCount:Integer;
begin
  if IntRow>MinRowGrid then begin
    if MessageBox(Handle,'Mau Mengosongkan jadwal Armada ini ?','Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
      StrGrid.Cells[16,IntRow]:=''; //sudah diganti
      StrGrid.Cells[8,IntRow]:='';
    end;
  end;
end;

procedure TBookingForm.DeleteDriverDetail;
var IntCount:Integer;
begin
  if IntRow>MinRowGrid then begin
    if MessageBox(Handle,'Mau Mengosongkaln jadwal Driver ini ?','Surat Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
      if IntCol=9 then begin
        StrGrid.Cells[9,IntRow]:='';
        StrGrid.Cells[17,IntRow]:='';  //sudah diganti
      end else begin
        StrGrid.Cells[10,IntRow]:='';
        StrGrid.Cells[19,IntRow]:='';//sudah diganti
      end;
    end;
  end;
end;

procedure TBookingForm.DeleteBusboy;
var IntCount:Integer;
begin
  if IntRow>MinRowGrid then begin
    if  MessageBox(0,PChar('Helper '+StrGrid.Cells[11,IntCount]+' Mau Dihapus ?') ,'Helper',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if IntCol=11 then begin
        StrGrid.Cells[11,IntRow]:='';  //sudah diganti
        StrGrid.Cells[33,IntRow]:='';    //sudah Ada
      end else begin
        StrGrid.Cells[11,IntRow]:='';     //sudah diganti
        StrGrid.Cells[33,IntRow]:='';     //sudah Ada
      end;
    end;
  end;
end;

procedure TBookingForm.PreparePrint;
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
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
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
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingForm.RePrint(Reserved_Id:String='';Customer_Order_Id:String='');
var StrQry,StrName,StrValue,StrDate,Order_Id,StrLine:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntCount,IntLineCount:Integer;
begin
  PreparePrint;
  if Reserved_Id<>'' then begin
    RePrintForm.ReportName:='Reservation Form';
    RePrintForm.ReportId:=Reserved_Id;
  end else begin
    RePrintForm.ReportName:='Reservation Form';
    RePrintForm.ReportId:=Customer_Order_Id;
  end;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      if Reserved_Id<>'' then begin
        StrQry:='EXEC GetReservedOrderDetail  '+QuotedStr(Reserved_Id)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        Order_Id:=Qry.FieldValues['customer_order_id'];
        Qry.Close;
      end else begin
        Order_Id:=Customer_Order_Id;
      end;
      StrQry:='EXEC GetCustomerOrderDetail  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppPrintDate.Caption:=FormatDateTime('dd/mm/yyyy',Now);  
        if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
        if Qry.FieldValues['rev']>0 then begin
          if Qry.FieldValues['rev']>1 then ppOrderId.Caption:=Order_Id+'R'+IntToStr(Qry.FieldValues['rev']-1)
          else ppOrderId.Caption:=Order_Id+'R';
        end else ppOrderId.Caption:=Order_Id;
        if Qry.FieldValues['customer_name']<>NULL then ppCustomerName.Caption:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['contact_person']<>NULL then ppContactName.Caption:=Qry.FieldValues['contact_person'];
        if Qry.FieldValues['contact_email']<>NULL then ppemail.Caption:=Qry.FieldValues['contact_email'];
        if Qry.FieldValues['phone_no']<>NULL then ppPhoneNo.Caption:=Qry.FieldValues['phone_no'];
        if Qry.FieldValues['cellular_no']<>NULL then ppCelularNo.Caption:=Qry.FieldValues['cellular_no'];
        if Qry.FieldValues['fax_no']<>NULL then ppFaxNo.Caption:=Qry.FieldValues['fax_no'];
        if Qry.FieldValues['group_name']<>NULL then ppGroupName.Caption:=Qry.FieldValues['group_name'];
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
        IntLineCount:=Qry.FieldValues['total_units'];
        if Qry.FieldValues['lock_order']='1' then ppLockSign.Visible:=True else ppLockSign.Visible:=False;
      end;
      Qry.Close;
      StrQry:='SELECT SUM(units) As total_units FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=5) AND (c.company_id=2) AND (a.status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then if Qry.FieldValues['total_units']<>NULL then ppSilverBigBus.Caption:=IntToStr(Qry.FieldValues['total_units']);
      Qry.Close;
      StrQry:='SELECT SUM(units) As total_units FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=6) AND (c.company_id=2) AND (a.status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then if Qry.FieldValues['total_units']<>NULL then ppSilverMicroBus.Caption:=IntToStr(Qry.FieldValues['total_units']);
      Qry.Close;
      Qry.Close;
      StrQry:='SELECT SUM(units) As total_units FROM wh_customer_order_detail a'+
              ' LEFT JOIN wh_product_price b ON b.product_price_id=a.product_price_id '+
              ' LEFT JOIN wh_product c ON c.product_id=b.product_id'+
              ' WHERE (customer_order_id='+QuotedStr(Order_Id)+') AND (c.vhc_batch_id=7) AND (c.company_id=2) AND (a.status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then if Qry.FieldValues['total_units']<>NULL then ppSilverMiniVan.Caption:=IntToStr(Qry.FieldValues['total_units']);
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderServiceList  '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['details']<>NULL then StrName:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
        else StrName:='- '+Qry.FieldValues['name'];
        Case IntCount of
          0:begin
              ppService1.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService1.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          1:begin
              ppService2.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService2.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          2:begin
              ppService3.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService3.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          3:begin
              ppService4.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService4.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          4:begin
              ppService5.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService5.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          5:begin
              ppService6.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService6.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          6:begin
              ppService7.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService7.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
          7:begin
              ppService8.Caption:=StrName;
              if Qry.FieldValues['mark']=1 then ppService8.Font.Style:=[fsBold]
              else ppService1.Font.Style:=[];
            end;
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
      Main.WriteLog('SQL :'+StrQry,2);
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
      StrQry:='EXEC GetCustomerOrderDetailPrint  '+QuotedStr(Order_Id)+',@LineRequest=1;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        IntLineCount:=Qry.RecordCount;
      end;
      Qry.Close;
      if IntLineCount<=16 then StrLine:='' else StrLine:=',@LineRequest=1';
      StrQry:='EXEC GetCustomerOrderDetailPrint  '+QuotedStr(Order_Id)+StrLine+';';
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
      ppReport.PreviewFormSettings.WindowState:=wsMaximized;
      ppReport.Print;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    if Reserved_Id='' then Close;
  end;
end;

procedure TBookingForm.CariOrderClick(Sender: TObject);
begin
  OrderList:=TOrderList.Create(Self,'Bus','Reserved-Create','',0,'from_datetime',30,1);
end;

procedure TBookingForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  RefreshHeader;
  EnableInput;
  ReservedDate.Text:=Main.Status.Panels.Items[0].Text;
  ReservationUser.Text:=FullName;
end;

procedure TBookingForm.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  IsAuth:Boolean;
  IntCount: Integer;
  StrEMsg: String;
begin
  if (IsInput) and (LeftStr(UpperCase(FormRequest),11)<>'WAITINGLIST') then begin
    if Key=VK_INSERT then GetOrderDetail;
    if Key=VK_F5 then begin
      IsAuth:=True;
      AuthorizedForm.FormId:='131101';
      AuthorizedForm.StrMessage:=' Otorisasi Alokasi Seluruh Armada';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then VehicleRDList:=TVehicleRDList.Create(Self,'Bus','','','Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow],True, False, StrGrid.Cells[14,IntRow] );
//     else VehicleRDList:=TVehicleRDList.Create(Self,'Bus',StrGrid.Cells[14,IntRow],StrGrid.Cells[17,IntRow],'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow]);
    end;
//    if Key=VK_DELETE then
//      if IntCol<8 then DeleteOrderDetail
//      else if (IntCol=8) and (StrGrid.Cells[8,IntRow]<>'') then DeleteVehicleDetail
//      else if (StrGrid.Cells[IntCol,IntRow]<>'') then DeleteDriverDetail;
  end;
  if (Key=VK_F6) and (UpperCase(FormRequest)='MAIN-FORCEADD') then
    if (Main.IsFormOpen('OrderForm')=False) and (OrderId.Text<>'') then OrderForm:=TOrderForm.Create(Self,OrderId.Text,False,'Reserved-ForceAdd');

  if Key=VK_DELETE then
    begin
      if (IntCol = 11)then
      begin
        DeleteBusboy;
      end;
    end;
end;

procedure TBookingForm.TimeStandbyExit(Sender: TObject);
begin
  if Trim(TimeStandby.Text)<>':' then begin
    StrGrid.Cells[7,IntRow]:=TimeStandby.Text;
    TimeStandby.Text:='';
  end;
  TimeStandby.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBookingForm.TimeStandbyKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStandby.Text))>4) then begin
    TimeStandbyExit(nil);
    StrGrid.Col:=8;
  end;
end;

procedure TBookingForm.StrGridDblClick(Sender: TObject);
var IsDoubleDriver,IsOk,IsAuth:Boolean;
    IntCount:Integer;
    hari:Real;
    StrEMsg:string;

begin
//  if (IsInputGrid) and (Package.Checked<>True) then begin
  IsOk:=True;
//  IsAuth:=True;
//  if (Package.Checked=True) then begin
//    for IntCount:=2 to StrGrid.RowCount-1 do begin
//    if (StrGrid.Cells[21,IntCount]<>'') AND (IsOk=True) then
//      begin
//        IsOk:=False;
//        StrEMsg:='Butuh otorisasi!';
//        MessageBox(Handle,PChar('Sudah ada yang jalan,'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
//        AuthorizedForm.FormId:='1311012';
//        AuthorizedForm.StrMessage:=' Otorisasi untuk dapat melanjutkan Simpan';
//        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
//
//      end;
//    end;
//  end;
 // if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2');

//  end;
//    if (IntRow > MinRowGrid) and (StrGrid.Cells[21,IntRow]='') and (IsAuth=True)  then begin

  if (IntRow > MinRowGrid) and (StrGrid.Cells[23,IntRow]='') then begin   //sudah diganti
    Case IntCol Of
      0..4:begin
            GetOrderDetail;
          //if (Main.IsFormOpen('OrderForm')=False) and (OrderId.Text<>'')  then OrderForm:=TOrderForm.Create(Self,OrderId.Text,False,'Reserved-Create');
        end;
      8:begin
          if (Main.IsFormOpen('VehicleList')=False) and (StrGrid.Cells[0,IntRow]<>'') then
            if LeftStr(UpperCase(FormRequest),12)='WAITINGLIST' then begin
              VehicleRDList:=TVehicleRDList.Create(Self,'Bus','','','WaitingList-Allocate',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow],True );
            end else begin
              VehicleRDList:=TVehicleRDList.Create(Self,'Bus',StrGrid.Cells[16,IntRow],StrGrid.Cells[18,IntRow],'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow] );  //sudah diganti
            end;
        end;
      9:begin
          if (Main.IsFormOpen('EmployeeList')=False) and (StrGrid.Cells[0,IntRow]<>'') then
            if LeftStr(UpperCase(FormRequest),13)='WAITINGLIST' then begin    //sudah diganti
              EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'WaitingList-Allocate',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])));
            end else begin
              EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])));
            end;
        end;
      10:begin
          IsDoubleDriver:=False;
          hari:=(StrtoDate(DateToStr(StrToDate(StrGrid.Cells[5,IntRow])))- StrtoDate(DateToStr(StrToDate(StrGrid.Cells[4,IntRow]))));
//            for IntCount:=1 to GridService.RowCount-1 do
//              if GridService.Cells[5,IntCount]='150201' then IsDoubleDriver:=True;
          if (Main.IsFormOpen('EmployeeList')=False) and (StrGrid.Cells[0,IntRow]<>'') and (hari>1) then
            EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'Reserved-Create-CoDriver',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])));
        end;

    end;
  end;

  if (IntCol = 11) AND (CompanyId='2') then
    begin
     //  MessageBox(0,PChar(StrGrid.Cells[11,IntRow]),'Penjadwalan',MB_OK or MB_ICONWARNING);
       if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'BUSBOY');
    end;
//  end else begin
//   MessageBox(0,PChar('Order Paket harus menggunakan fitur Geser Unit' +Chr(13)+StrEMessage),'Penjadwalan',MB_OK or MB_ICONWARNING);
//  end;

end;

procedure TBookingForm.DetailRemarkKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    DetailRemarkExit(nil);
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
  end;
end;

procedure TBookingForm.DetailRemarkExit(Sender: TObject);
begin
  if Trim(DetailRemark.Text)<>'' then begin
    StrGrid.Cells[13,IntRow]:=DetailRemark.Text;   //sudah diganti
    DetailRemark.Text:='';
  end;
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) and (StrGrid.Cells[0,IntRow]<>'') then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
  end;
  DetailRemark.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBookingForm.CetakUlangClick(Sender: TObject);
begin
  if ReservedId.Text<>'' then RePrint(ReservedId.Text) else
  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(nil,'Bus','Booking-Reprint');
end;

procedure TBookingForm.GroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Guide.SetFocus;
end;

procedure TBookingForm.GuideKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GuideCellular.SetFocus;
end;

procedure TBookingForm.GuideCellularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TBookingForm.DateStartExit(Sender: TObject);
begin
  if DateStart.Date>=IncDay(Today,-1) then begin
    StrGrid.Cells[4,IntRow]:=FormatDateTime('dd/mm/yy',DateStart.Date);
    DateStart.Date:=IncDay(Now(),-1);
  end;
  DateStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBookingForm.DateStartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateStartExit(nil);
    StrGrid.Col:=5;
  end;
end;

procedure TBookingForm.DateFinishExit(Sender: TObject);
begin
  if DateFinish.Date>=IncDay(Today,-1) then begin
    StrGrid.Cells[5,IntRow]:=FormatDateTime('dd/mm/yy',DateFinish.Date);
    DateFinish.Date:=IncDay(Now(),-1);
  end;
  DateFinish.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBookingForm.DateFinishKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DateFinishExit(nil);
    StrGrid.Col:=6;
  end;
end;

procedure TBookingForm.ShowCustomerDetail;
begin
  if (Main.IsFormOpen('Customer')=False) and (Trim(CustomerId.Text)<>'')  then Customer:=TCustomer.Create(Self,Trim(CustomerId.Text),'Bus',False);
end;

procedure TBookingForm.GroupBox1DblClick(Sender: TObject);
begin
  ShowCustomerDetail;
end;

procedure TBookingForm.TimeStartExit(Sender: TObject);
begin
  if Trim(TimeStart.Text)<>':' then begin
    StrGrid.Cells[6,IntRow]:=TimeStart.Text;
    TimeStart.Text:='';
  end;
  TimeStart.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBookingForm.TimeStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TimeStart.Text))>4) then begin
    TimeStartExit(nil);
    StrGrid.Col:=7;
  end;
end;

procedure TBookingForm.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TBookingForm.StrGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: String;
  drawrect :trect;
begin
  //StrGrid.CellStyle[ACol,ARow].VerticalAlignment:=vaCenter;
  S:= (Sender As TStringgrid).Cells[ ACol, ARow ];
  If Length(S) > 0 Then Begin
    drawrect := rect;
    DrawText((Sender As TStringgrid).canvas.handle, Pchar(S), Length(S), drawrect, dt_calcrect or dt_wordbreak or dt_left );
    If (drawrect.bottom - drawrect.top) > (Sender As TStringgrid).RowHeights[Arow] Then begin
      (Sender As TStringgrid).RowHeights[Arow] := 80;//(drawrect.bottom - drawrect.top);

    end;

    (*
    Else Begin
      drawrect.Right := rect.right;
      (Sender As TStringgrid).canvas.fillrect( drawrect );
      DrawText((Sender As TStringgrid).canvas.handle, Pchar(S), Length(S), drawrect, dt_wordbreak or dt_left or dt_noprefix);
    End;
    *)
  End;
end;

procedure TBookingForm.StrGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  S: string;
  X, Y: Integer;
begin
  if (ssCtrl in Shift) and (upcase(Char(key)) = 'C') then
  begin
    S := '';
    for Y := StrGrid.Selection.Top to StrGrid.Selection.Bottom do
    begin
      for X := StrGrid.Selection.Left to StrGrid.Selection.Right - 1 do
        S := S + StrGrid.Cells[X, Y] + #9;
      S := S + StrGrid.Cells[StrGrid.Selection.Right, Y] + sLineBreak;
    end;
    Delete(S, Length(S) - Length(sLineBreak) + 1, Length(sLineBreak));
    Clipboard.AsText := S;
  end;
end;

procedure TBookingForm.PopupMenu1Popup(Sender: TObject);
var
  IntCount: Integer;
  StrEMsg: string;
begin

  if (IntCol<>8) AND ((IntCol<>9)) AND (IntCol<>11) then
    Abort
  else begin
    if (IntCol=8) then begin
      GeserUnit1.Visible := True;
      GeserDriver1.Visible := False;
      GeserHelper.Visible  := False;
    end else if (IntCol=9) then begin
      GeserUnit1.Visible := False;
      GeserDriver1.Visible := True;
      GeserHelper.Visible  := False;
    end else if (IntCol=11) and (CompanyId='2') then begin
      GeserUnit1.Visible := False;
      GeserDriver1.Visible := False;
      GeserHelper.Visible  := True;
    end else begin
      GeserUnit1.Visible := False;
      GeserDriver1.Visible := False;
      GeserHelper.Visible  := False;
    end;
  end;
end;

procedure TBookingForm.GeserUnit1Click(Sender: TObject);
var
  IsAuth,IsOk:Boolean;
  IntCount: Integer;
  StrEMsg: string;
begin
  IsOk:=True;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[23,IntCount]<>'') AND (Package.Checked=True) then  //sudah diganti
    begin
      IsOk:=False;
      StrEMsg:='Butuh otorisasi!';
      MessageBox(Handle,PChar('Sudah ada yang jalan,'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      Exit;
    end;
  end;

  if IsOk=True then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='13110101';
    AuthorizedForm.StrMessage:=' Otorisasi Alokasi Seluruh Armada (Geser Unit)';
    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
    if IsAuth then VehicleRDList:=TVehicleRDList.Create(Self,'Bus','','','Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow],True, True );
  end;
end;

procedure TBookingForm.MenuItem2Click(Sender: TObject);
var IsAuth:Boolean;
begin
  IsAuth:=True;
  AuthorizedForm.FormId:='13110102';
  AuthorizedForm.StrMessage:=' Otorisasi Alokasi Seluruh Supir (Geser Unit)';
  if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
  if IsAuth then EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])), true);
end;

procedure TBookingForm.PopupMenu2Popup(Sender: TObject);
begin
    if IntCol<>9 then
      Abort
    else begin

      end;
end;

procedure TBookingForm.GeserDriver1Click(Sender: TObject);
var
  IsAuth,IsOk:Boolean;
  StrEMsg: string;
  IntCount:Integer;
begin
  IsOk:=True;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[24,IntCount]<>'') AND (Package.Checked=True) then
    begin
      IsOk:=False;
      StrEMsg:='Butuh otorisasi!';
      MessageBox(Handle,PChar('Sudah ada yang jalan,'+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      Exit;
    end;
  end;

  if isOk=True then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='13110102';
    AuthorizedForm.StrMessage:=' Otorisasi Alokasi Seluruh Supir (Geser Unit)';
    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
    if IsAuth then EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])), true);
  end;
end;

procedure TBookingForm.GeserHelperClick(Sender: TObject);
var
  IsAuth,IsOk:Boolean;
  StrEMsg: string;
  IntCount:Integer;
begin
  {for IntCount:=MinRowGrid+1 to StrGrid.RowCount-1 do
      if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[14,IntCount]<>'') and (StrGrid.Cells[16,IntCount]<>'') then begin    //sudah diganti
        if (Employee_Id<>'BU00000001') or IsFound then begin
          if (StrGrid.Cells[4,IntCount]=StrGrid.Cells[4,IntRow]) and (StrGrid.Cells[5,IntCount]=StrGrid.Cells[5,IntRow])
          and (StrGrid.Cells[6,IntCount]=StrGrid.Cells[6,IntRow])
          and ((StrGrid.Cells[17,IntCount]=Employee_Id) or (StrGrid.Cells[19,IntCount]=Employee_Id)) then IsFree:=False;   //sudah diganti
        end;
      end;}


 // MessageBox(Handle,PChar('StrGrid 17 ='+Chr(13)+Chr(13)+StrGrid.Cells[17,IntRow]),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  // MessageBox(Handle,PChar('StrGrid 19 =,'+Chr(13)+Chr(13)+StrGrid.Cells[19,IntRow]),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  //  MessageBox(Handle,PChar('StrGrid 8 =,'+Chr(13)+Chr(13)+StrGrid.Cells[8,IntRow]),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
  IsOk := True;
  if isOk=True then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='131101';
    AuthorizedForm.StrMessage:=' Otorisasi Alokasi Seluruh Helper';
    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
    if IsAuth then EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus2',1,0,'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])), true);
  end;
end;

end.
