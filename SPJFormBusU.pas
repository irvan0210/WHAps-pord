unit SPJFormBusU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Grids, ADODB, QRCtrls, QuickRpt, WHUnit,
  jpeg, ComCtrls, DB, DBTables, Buttons, ZColorStringGrid, ppStrtch,
  ppMemo, ppPrnabl, ppClass, ppCtrls, ppParameter, ppBands, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, InvokeRegistry, Rio, SOAPHTTPClient,XSBuiltIns,ShellApi;

type
  TSPJFormBus = class(TForm)
    Label2: TLabel;
    Label10: TLabel;
    Catatan: TMemo;
    Driver: TComboBox;
    Simpan: TButton;
    Keluar: TButton;
    Bersihkan: TButton;
    GroupMitra: TGroupBox;
    GridMitra: TStringGrid;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QTandaPetugas: TQRLabel;
    QMessage: TQRLabel;
    GroupBox1: TGroupBox;
    SJDate: TEdit;
    NoSPJ: TEdit;
    Label13: TLabel;
    Label1: TLabel;
    Cari: TEdit;
    Label12: TLabel;
    Label16: TLabel;
    Panel1: TPanel;
    Sisa: TEdit;
    GroupPemakaian: TGroupBox;
    Label6: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Remark: TMemo;
    Label11: TLabel;
    Label17: TLabel;
    Kenek: TComboBox;
    GroupDisabled: TPanel;
    QRBand2: TQRBand;
    QCatatan: TQRLabel;
    QJamReservasi: TQRLabel;
    QTanggal: TQRLabel;
    QNama: TQRLabel;
    QNoPolisi: TQRLabel;
    QNoBody: TQRLabel;
    QTelpHP: TQRLabel;
    QAcara: TQRMemo;
    QAlamat: TQRMemo;
    QTanggalReservasi: TQRLabel;
    QSeat: TQRLabel;
    QGuide: TQRLabel;
    QGuidePhone: TQRLabel;
    QCustomer: TQRLabel;
    QNoOrder: TQRLabel;
    QNoSPJ: TQRLabel;
    Label18: TLabel;
    Label19: TLabel;
    QCopy: TQRLabel;
    Route: TMemo;
    Label9: TLabel;
    PanelCariOrder: TPanel;
    CariOrder: TSpeedButton;
    CetakUlang: TButton;
    ReservedOrderDetaiId: TEdit;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    GroupBatal: TPanel;
    Status: TCheckBox;
    GroupOrder: TPanel;
    OrderId: TEdit;
    FromDate: TEdit;
    Label14: TLabel;
    ToDate: TEdit;
    Label7: TLabel;
    CustomerId: TEdit;
    CustomerDisp: TEdit;
    GuideCellular: TEdit;
    Guide: TEdit;
    Label22: TLabel;
    Group: TEdit;
    Panel2: TPanel;
    Package: TCheckBox;
    PickupPoint: TMemo;
    Label23: TLabel;
    Destination: TComboBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    GroupPengemudi: TPanel;
    Label32: TLabel;
    DriverExternal: TEdit;
    PanelJam: TPanel;
    Label20: TLabel;
    FromTime: TMaskEdit;
    StandbyTime: TMaskEdit;
    Label33: TLabel;
    PanelService: TPanel;
    OutService: TCheckBox;
    WebService: THTTPRIO;
    FromDateApi: TEdit;
    KirimWA: TBitBtn;
    CellularWA: TEdit;
    Label34: TLabel;
    Kmestimasi: TEdit;
    pnl1: TPanel;
    StatusWA: TCheckBox;
    NoPolisi: TEdit;
    SeatDisp: TEdit;
    lbl1: TLabel;
    NoBody: TComboBox;
    DisplayNoBody: TEdit;
    grp1: TGroupBox;
    DriverDisp: TEdit;
    lbl2: TLabel;
    grp2: TGroupBox;
    lbl4: TLabel;
    DriverDisp2: TEdit;
    lbl3: TLabel;
    TelpHP: TEdit;
    lbl5: TLabel;
    TelpHP2: TEdit;
    pnl2: TPanel;
    Connecting: TCheckBox;
    CariPengemudi2: TButton;
    CariPengemudi1: TButton;
    BtnKendaraan: TButton;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppNoOrder2: TppLabel;
    ppCustomer2: TppLabel;
    ppTanggalReservasi2: TppLabel;
    ppAlamat2: TppMemo;
    ppAcara2: TppMemo;
    ppNama2: TppLabel;
    ppTelpHP2: TppLabel;
    ppTanggal2: TppLabel;
    ppTandaPetugas2: TppLabel;
    ppMessage2: TppLabel;
    ppNoBody2: TppLabel;
    ppNoPolisi2: TppLabel;
    ppSeat2: TppLabel;
    ppGuide2: TppLabel;
    ppGuidePhone2: TppLabel;
    ppCatatan2: TppMemo;
    ppNoSPJ2: TppLabel;
    ppJamReservasi2: TppLabel;
    ppCopy2: TppLabel;
    ppGroupName2: TppLabel;
    ppLabel15: TppLabel;
    ppCompany2: TppLabel;
    ppAddress2: TppMemo;
    ppPhone2: TppLabel;
    ppLogo2: TppImage;
    ppLabel18: TppLabel;
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
    ppLabel31: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppFax2: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppKernet: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppParameterList2: TppParameterList;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppNoOrder: TppLabel;
    ppCustomer: TppLabel;
    ppTanggalReservasi: TppLabel;
    ppAlamat: TppMemo;
    ppAcara: TppMemo;
    ppNama: TppLabel;
    ppTelpHP: TppLabel;
    ppTanggal: TppLabel;
    ppTandaPetugas: TppLabel;
    ppMessage: TppLabel;
    ppNoBody: TppLabel;
    ppNoPolisi: TppLabel;
    ppSeat: TppLabel;
    ppGuide: TppLabel;
    ppGuidePhone: TppLabel;
    ppCatatan: TppMemo;
    ppNoSPJ: TppLabel;
    ppJamReservasi: TppLabel;
    ppCopy: TppLabel;
    ppGroupName: TppLabel;
    ppExtras: TppLabel;
    ppKernet2: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppKernetHP: TppLabel;
    ppdriver2: TppLabel;
    ppHpDriver2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    ppReport3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppNoOrder3: TppLabel;
    ppCustomer3: TppLabel;
    ppTanggalReservasi3: TppLabel;
    ppAlamat3: TppMemo;
    ppAcara3: TppMemo;
    ppTanggal3: TppLabel;
    ppTandaPetugas3: TppLabel;
    ppSeat3: TppLabel;
    ppGuide3: TppLabel;
    ppGuidePhone3: TppLabel;
    ppNoSPJ3: TppLabel;
    ppJamReservasi3: TppLabel;
    ppCopy3: TppLabel;
    ppGroupName3: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppParameterList3: TppParameterList;
    ppNama3: TppLabel;
    ppTelpHP3: TppLabel;
    ppKernet3: TppLabel;
    ppKernetHP3: TppLabel;
    ppNoPolisi3: TppLabel;
    ppCatatan3: TppMemo;
    ppNoBody3: TppLabel;
    ppReport4: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppMemo3: TppMemo;
    ppLabel49: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppParameterList4: TppParameterList;
    ppdriver23: TppLabel;
    ppHpDriver23: TppLabel;
    BtnDriver: TButton;
    StatusPenugasanDriver: TEdit;
    Label3: TLabel;
    Label15: TLabel;
    StatusPenugasanDriver2: TEdit;
    ClearDriver2: TButton;
    BtnDriver2: TButton;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label30: TLabel;
    BusBoyDisp: TEdit;
    ComboBox1: TComboBox;
    StatusPenugasanHelper: TEdit;
    BtnKenek: TButton;
    ClearKenek: TButton;
    Penjadwalan: TButton;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    HelperID: TEdit;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridMitraSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DriverChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure DriverKeyPress(Sender: TObject; var Key: Char);
    procedure KMOrdoKeyPress(Sender: TObject; var Key: Char);
    procedure TelpHPKeyPress(Sender: TObject; var Key: Char);
    procedure ReprintClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure GridMitraKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridMitraDblClick(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure GuideKeyPress(Sender: TObject; var Key: Char);
    procedure GuideCellularKeyPress(Sender: TObject; var Key: Char);
    procedure PickupPointKeyPress(Sender: TObject; var Key: Char);
    procedure NoBodyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KenekChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure KmestimasiExit(Sender: TObject);
    procedure KmestimasiEnter(Sender: TObject);
    procedure CariPengemudi1Click(Sender: TObject);
    procedure BtnKendaraanClick(Sender: TObject);
    procedure BtnDriverClick(Sender: TObject);
    procedure BtnKenekClick(Sender: TObject);
    procedure BtnDriver2Click(Sender: TObject);
    procedure PenjadwalanClick(Sender: TObject);
    procedure ClearDriver2Click(Sender: TObject);
    procedure ClearKenekClick(Sender: TObject);
  private
    { Private declarations }
    EmplArr,HelperArr,SchArr,SPJArr:Array of TArrString16;
    VhcArr:Array of TArrString17;
    DestinationArr:Array of TArrString4;
    IsInput,IsVehicleOnly,FullPayment,AllVehicle,isSent_WA,isChooseWANumber,isMultiple_WA_Number,IsAuthRevCrew:Boolean;
    IntRow,MinRowService,SJRange,SPJ_Form:Integer;
    IsDataFound:Boolean;
    KMOdo,SJId,FormRequest,URL_Webwhatsapp, StrDeskripsiHist:String;
   // StrGroup,StrIsOnline: String;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure SetDriverCar;
    procedure SetHelper;
    procedure RefreshCombo;
    procedure RefreshHeader;
    procedure RefreshDestination;
    procedure RefreshVehicle;
    procedure DisableInput;
    procedure EnableInput;
    procedure LoadData1;
    procedure PreparePrint;
    procedure send_WA();
  public
    { Public declarations }

    procedure InitReport;
    procedure RefreshGrid;
    procedure SetBookedDetailId(BookedDetail_Id:String;Is_Package:Boolean=False;Dates:String='');
    procedure RePrint(No_SPJ:String);
    constructor Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True;Form_Request:String='';IsVehicle_Only:Boolean=False);Overload;
  end;

var
  SPJFormBus: TSPJFormBus;
  StrDriver,StrDriverOld,StrDriver2,StrDriver2Old,StrVehicleID,StrGroup,StrIsOnline,
  StrHelperPhone,StrBusboyID,StrBusboyIDOld,StrDriverStatus,StrHelperStatus,
  KtpDriver1,KtpDriver2,KtpHelper,NoRekDriver1,NoRekDriver2,
  NoRekHelper,SIMDriver,SIMDriver2,TglExpSIMDriver1,TglExpSIMDriver2,ReservedOrderId: String;
  IntWajibHelper: Integer;

implementation

{$R *.dfm}

Uses MainU, MaskUtils, DateUtils, StrUtils, RePrintFormU,
  AuthorizedFormU, BookingListU, SPJBusListU
  , IntersysAPI_New
  , SJPenjadwalanList, EmployeeRDListU, VehicleRDListU, BookingFormU;
  

constructor TSPJFormBus.Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True;Form_Request:String='';IsVehicle_Only:Boolean=False);
begin
  SJId:=SJ_Id;
  IsInput:=Is_Input;
  IsVehicleOnly:=IsVehicle_Only;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TSPJFormBus.Init;
begin
  BtnKendaraan.Visible:=False;
  DriverDisp2.Text:='';
  TelpHP2.Text:='';
  Kenek.Enabled:=False;
  IntRow:=0;
  Driver.Items.Clear;
  Driver.ItemIndex:=0;
  Driver.Text:='';
  Kenek.ItemIndex:=-1;
  BusBoyDisp.Clear;
  NoBody.Items.Clear;
  NoBody.ItemIndex:=-1;
  NoBody.Text:='';
  DisplayNoBody.Text:='';
  Destination.Items.Clear;
  Destination.ItemIndex:=-1;
  Destination.Text:='';
  OrderId.Text:='';
  SJDate.Text:='';
  ReservedOrderDetaiId.Text:='';
  NoSPJ.Text:='';
  NoPolisi.Text:='';
  SeatDisp.Text:='';
  DriverDisp.Text:='';
  TelpHP.Text:='';
  Catatan.Text:='';
  EnableInput;
  InitGrid;
  Cari.Text:='';
  KMOdo:='';
  FromDate.Text:='';
  ToDate.Text:='';
  FromTime.Text:='';
  StandbyTime.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  Route.Text:='';
  PickupPoint.Text:='';
  Remark.Text:='';
  StrGroup:='';
  Kmestimasi.Text:='';
  PanelJam.Enabled:=True;
  if SJId<>'' then Status.Visible:=True
  else Status.Visible:=False;
  Package.Checked:=False;
  FullPayment:=False;
  AllVehicle:=False;
  Connecting.Checked:=False;
//  SPJ_Form:=1;
  StatusPenugasanDriver.Text:='';
  StatusPenugasanDriver2.Text:='';
  StatusPenugasanHelper.Text:='';
  BtnDriver.Visible:=False;
  //BtnKenek.Visible:=False;
  //ClearKenek.Visible:=False;
  HelperID.Text := '';
  BtnDriver2.Visible:=False;
  ClearDriver2.Visible:=False;
  IsAuthRevCrew:=False;
//  end;
end;

procedure TSPJFormBus.InitGrid;
begin
  SetLength(SPJArr,0);
  GridMitra.RowCount:=2;
  GridMitra.Cells[0,0]:='NIK';
  GridMitra.Cells[1,0]:='Nama';
  GridMitra.Cells[2,0]:='Telphone';
  GridMitra.Cells[3,0]:='Handphone';
  GridMitra.Cells[0,1]:='';
  GridMitra.Cells[1,1]:='';
  GridMitra.Cells[2,1]:='';
  GridMitra.Cells[3,1]:='';
end;

procedure TSPJFormBus.InitGridService;
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

procedure TSPJFormBus.LoadData1;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    IsAuth:Boolean;
begin
  RefreshCombo;
//  RefreshGrid;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+
            ' AND form_id=''130502'' and active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IsAuth:=True;
    end else begin
      IsAuth:=False;
    end;

    Qry.Close;

    StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+
            ' AND form_id=''1305021'' AND active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IsAuthRevCrew:=True;
    end else begin
      IsAuthRevCrew:=False;
    end;

    Qry.Close;

    StrQry:='EXEC GetSJDetail '+QuotedStr(SJId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    KtpHelper:='';
    KtpDriver1:='';
    KtpDriver2:='';
    NoRekDriver1:='';
    NoRekDriver2:='';
    NoRekHelper:='';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if IsAuth=True then begin
        if (Qry.FieldValues['isTransfer'] = 1) OR (Qry.FieldValues['status_sj'] = 'COMPLETED') then
          BtnKendaraan.Visible:=False
        else
          BtnKendaraan.Visible:=True;
      end;

      if (Qry.FieldValues['isTransfer'] = 1) and (Qry.FieldValues['isTransfer_update_time'] <> null )then
      begin
        BtnKenek.Visible:=False;
        ClearKenek.Visible := False;
      end else begin
        BtnKenek.Visible:=True;
        ClearKenek.Visible := True;
      end;

      StrIsOnline:=VarToStr(Qry.FieldValues['isOnline']);
      NoSPJ.Text:=Qry.FieldValues['vhc_trans_id'];
      SJDate.Text:=Qry.FieldValues['out_dates'];
      if Qry.FieldValues['reserved_order_detail_id']<> NULL then
      ReservedOrderDetaiId.Text:=Qry.FieldValues['reserved_order_detail_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      FromDate.Text:=Qry.FieldValues['from_dates_l'];
      FromDateApi.Text:=Qry.FieldValues['from_dates_api'];
      ToDate.Text:=Qry.FieldValues['to_dates_l'];
      FromTime.Text:=Qry.FieldValues['from_time'];
      StandbyTime.Text:=Qry.FieldValues['standby_time'];
      DriverDisp.Text:=Qry.FieldValues['driver_name'];
      StrDriver:= Qry.FieldValues['employee_id'];
      StrDriverOld:= Qry.FieldValues['employee_id'];
      if Qry.FieldValues['no_ktp_driver']<>NULL then
      KtpDriver1:= Qry.FieldValues['no_ktp_driver'];
      if Qry.FieldValues['norek_driver']<>NULL then
      NoRekDriver1:= Qry.FieldValues['norek_driver'];
      StrVehicleID:= Qry.FieldValues['vehicle_id'];
      DisplayNoBody.Text:=Qry.FieldValues['body_id'];
      SeatDisp.Text:= Qry.FieldValues['seat'];
      ReservedOrderId:= Qry.FieldValues['reserved_order_id'];
      if Qry.FieldValues['license_plate']<>NULL then
      begin
         if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      end;
      if Qry.FieldValues['cellular_no_driver']<> null then
      TelpHP.Text:= Qry.FieldValues['cellular_no_driver']
      else
      TelpHP.Text:='';
      StatusPenugasanDriver.Text:='CONFIRM';
      if(Qry.FieldValues['driver_name2']<>NULL) then begin
        StrDriver2:= Qry.FieldValues['employee_id2'];
        StrDriver2Old:= Qry.FieldValues['employee_id2'];
        DriverDisp2.Text:=Qry.FieldValues['driver_name2'];
        if Qry.FieldValues['cellular_no_driver2']<> NULL then
        TelpHP2.Text:= Qry.FieldValues['cellular_no_driver2']
        else
        TelpHP2.Text:='';
        StatusPenugasanDriver2.Text:='CONFIRM';
        if Qry.FieldValues['no_ktp_driver2']<>NULL then
        KtpDriver2:= Qry.FieldValues['no_ktp_driver2'];
        if Qry.FieldValues['norek_driver2']<>NULL then
        NoRekDriver2:= Qry.FieldValues['norek_driver2'];
      end else
      begin
        DriverDisp2.Text:='';
        TelpHP2.Text:= '';
      end;


      if Qry.FieldValues['status_wa']=1 then
      StatusWA.Checked:=True
      else
      StatusWA.Checked:=False;

      if Qry.FieldValues['isConnecting']='1' then
      Connecting.Checked:=True
      else
      Connecting.Checked:=False;

      if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];

      if (Qry.FieldValues['field_contact_cellular_no']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['field_contact_cellular_no']))<>'') then CellularWA.text:=Qry.FieldValues['field_contact_cellular_no']
      else begin
        if (Qry.FieldValues['contact_hp']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['contact_hp']))<>'') then CellularWA.text:=Qry.FieldValues['contact_hp']
        else CellularWA.text:='';
      end;




            
      if Qry.FieldValues['full_day']=2 then begin
        SetLength(VhcArr,Length(VhcArr)+1);
        VhcArr[Length(VhcArr)-1][0]:=Qry.FieldValues['vehicle_id'];
        VhcArr[Length(VhcArr)-1][1]:=Qry.FieldValues['body_id'];
        VhcArr[Length(VhcArr)-1][2]:=LicensePlate(Qry.FieldValues['license_plate']);
        VhcArr[Length(VhcArr)-1][16]:=Qry.FieldValues['seat'];
        NoBody.Items.Add(Qry.FieldValues['body_id']);
        SetLength(EmplArr,Length(EmplArr)+1);
        EmplArr[Length(EmplArr)-1][0]:=Qry.FieldValues['employee_id'];
        EmplArr[Length(EmplArr)-1][1]:=Qry.FieldValues['name'];
        EmplArr[Length(EmplArr)-1][1]:=Qry.FieldValues['name'];
        EmplArr[Length(EmplArr)-1][3]:=Qry.FieldValues['phone_no'];
        Driver.Items.Add(Qry.FieldValues['employee_id']);
      end;
//      NoBody.ItemIndex:=NoBody.Items.IndexOf(Qry.FieldValues['body_id']);
//      Driver.ItemIndex:=Driver.Items.IndexOf(Qry.FieldValues['employee_id']);
//      if CompanyId='2' then begin
        if (Qry.FieldValues['busboyname_name']<>NULL) AND (Qry.FieldValues['busboyname_name']<>'') then
        begin
          BusBoyDisp.Text:=Qry.FieldValues['busboyname_name'];
          StrBusboyID:=Qry.FieldValues['employee_id3'];
          StrBusboyIDOld:=Qry.FieldValues['employee_id3'];
          StatusPenugasanHelper.Text:='CONFIRM';
          if Qry.FieldValues['no_ktp_helper']<> null then
          KtpHelper:= Qry.FieldValues['no_ktp_helper'];
          if Qry.FieldValues['norek_helper'] <> null then
          NoRekHelper:= Qry.FieldValues['norek_helper'];
        end else begin
          BusBoyDisp.Text:='';
          StrBusboyID:='';
          StatusPenugasanHelper.Text:='';
        end;
//      end else begin
//        Kenek.ItemIndex:=kenek.Items.IndexOf(VarToStr(Qry.FieldValues['busboyname_name']));
//      end;
      //HelperArr[Kenek.ItemIndex][0]

      Route.Text:=Qry.FieldValues['route'];
      PickupPoint.Text:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['remark']<>NULL then begin
        Remark.Text:=Qry.FieldValues['remark'];
      end;
      if Qry.FieldValues['description']<>NULL then begin
        Catatan.Text:=Qry.FieldValues['description'];
      end;
      
      if Qry.FieldValues['km_estimasi']<>NULL then
      Kmestimasi.Text:=IToCurr(StrToInt(Trim(Qry.FieldValues['km_estimasi'])));

      if IsAuthRevCrew=True then begin
        if (Qry.FieldValues['out_ordo_km_vhc_trans']<> NULL) and (CompanyId='2') and (Qry.FieldValues['status_sj']<>'COMPLETED') then
        begin
          BtnKenek.Visible:=True;
          BtnDriver.Visible:=True;
          BtnDriver2.Visible:=True;
          ClearDriver2.Visible:=True;
          ClearKenek.Visible:=True;
        end;
      end;

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
      GridService.Cells[4,IntCount]:=Qry.FieldValues['calculate_total'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TSPJFormBus.RefreshGrid;
var Count,Count2:Integer;
begin
//  if Length(EmplArr)>0 then GridMitra.RowCount:=Length(EmplArr)+1;
  Count2:=1;
  for Count:=0 to Length(EmplArr)-1 do begin
    GridMitra.RowCount:=Count2+1;
    if EmplArr[Count][7]<>'1' then begin
      GridMitra.Cells[0,Count2]:=EmplArr[Count][0];
      GridMitra.Cells[1,Count2]:=EmplArr[Count][1];
      GridMitra.Cells[2,Count2]:=EmplArr[Count][2];
      GridMitra.Cells[3,Count2]:=EmplArr[Count][3];
      Inc(Count2);
    end;
  end;
end;

procedure TSPJFormBus.RefreshVehicle;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
    StrFromDates,StrToDates:String;
begin
  SetLength(VhcArr,0);
  NoBody.Items.Clear;
  NoBody.ItemIndex:=-1;
  NoBody.Text:='';
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry.CommandTimeout:=3600;
  if Main.OpenDb then begin
    if (FromDate.Text<>'') and (ToDate.Text<>'') then begin
      StrFromDates:=',@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)));
      StrToDates:=',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)));
    end else begin
      StrFromDates:='';
      StrToDates:='';
    end;
    if AllVehicle then begin
      StrFromDates:=',@IsAll=1';
      StrToDates:='';
    end;
    StrQry:='EXEC GetVhcAvailList '+LocationId+','+CompanyId+StrFromDates+StrToDates+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(VhcArr,Qry.RecordCount+1);
    {
    VhcArr[0][0]:='BU00000001';
    VhcArr[0][1]:='Sewa Luar';
    VhcArr[0][17]:='1';
    }
    Count:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[Count][0]:=Qry.FieldValues['vehicle_id'];
      VhcArr[Count][1]:=Qry.FieldValues['body_id'];
      VhcArr[Count][2]:=LicensePlate(Qry.FieldValues['license_plate']);

      if Qry.FieldValues['work_order_id']<>NULL then VhcArr[Count][13]:=Qry.FieldValues['work_order_id']
      else VhcArr[Count][13]:='';
      if Qry.FieldValues['reason']<>NULL then VhcArr[Count][14]:=Qry.FieldValues['reason']
      else VhcArr[Count][14]:='';
      if Qry.FieldValues['vhc_batch_id']<>NULL then VhcArr[Count][15]:=Qry.FieldValues['vhc_batch_id'];
      if Qry.FieldValues['seat']<>NULL then VhcArr[Count][16]:=Qry.FieldValues['seat'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  IntCount2:=0;
  for Count:=0 to Length(VhcArr)-1 do begin
    if VhcArr[Count][17]<>'1' then
      Inc(IntCount2);
    NoBody.Items.Add(VhcArr[Count][1]);
  end;
  Sisa.Text:=IntToStr(IntCount2);
  Main.M_Normal;
end;

procedure TSPJFormBus.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
    StrFromDates,StrToDates:String;
begin
  SetLength(EmplArr,0);
  Driver.Items.Clear;
  Driver.ItemIndex:=0;
  Driver.Text:='';
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
//  Qry.CommandTimeout := 3600;
//  Qry.CommandTimeout:=3600;
  if Main.OpenDb then begin
    {StrQry:='EXEC GetDriverList '+LocationId+','+CompanyId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(EmplArr,Qry.RecordCount+1);

   // EmplArr[0][0]:='BU00000001';
   // EmplArr[0][1]:='Sewa Luar';
   // EmplArr[0][7]:='1';

    Count:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      EmplArr[Count][0]:=Qry.FieldValues['employee_id'];
      EmplArr[Count][1]:=Qry.FieldValues['name'];
      EmplArr[Count][2]:=Qry.FieldValues['phone_no'];
      EmplArr[Count][3]:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['last_phone_no']<>NULL then EmplArr[Count][4]:=Qry.FieldValues['last_phone_no'];
      if Qry.FieldValues['form_id']<>NULL then EmplArr[Count][5]:=Qry.FieldValues['form_id'];
      if Qry.FieldValues['reason']<>NULL then EmplArr[Count][6]:=Qry.FieldValues['reason'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;    }

    //==
//    if CompanyId<>'2' then begin
//      StrQry:='EXEC GetHelperList '+LocationId+','+CompanyId+';';
//      Qry.SQL.Clear;
//      Main.WriteLog('SQL :'+StrQry,2);
//      Qry.SQL.Add(StrQry);
//      Qry.Open;
//      SetLength(HelperArr,Qry.RecordCount+1);
//
//      Count:=1;
//      if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
//        HelperArr[Count][0]:=Qry.FieldValues['employee_id'];
//        HelperArr[Count][1]:=Qry.FieldValues['name'];
//        HelperArr[Count][2]:=Qry.FieldValues['cellular_no'];
//        Inc(Count);
//        Qry.Next;
//      end;
//      Qry.Close;
//
//      for Count:=0 to Length(HelperArr)-1 do
//      Kenek.Items.Add(HelperArr[Count][1]);
//    end;

    {StrQry:='SELECT a.*,b.body_id FROM wh_working_schedule AS a '+
          'LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
          'WHERE (location_id='+LocationId+') AND (GETDATE() BETWEEN from_date AND to_date) ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    SetLength(SchArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SchArr[Count][0]:=Qry.FieldValues['working_schedule_id'];
      SchArr[Count][1]:=Qry.FieldValues['employee_id'];
      SchArr[Count][2]:=Qry.FieldValues['vehicle_id'];
      SchArr[Count][3]:=Qry.FieldValues['body_id'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;   }
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Full_Payment_CompanyId'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then FullPayment:=True;
      if Qry.FieldValues['value_string']=0 then FullPayment:=False;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Sent_WA_DriverInfo_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then isSent_WA :=True;
      if Qry.FieldValues['value_string']=0 then isSent_WA:=False;
    end;
    Qry.Close;
    KirimWA.Visible:=isSent_WA;

    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Choose_WA_Number_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then isChooseWANumber:=True;
      if Qry.FieldValues['value_string']=0 then isChooseWANumber:=False;
    end;
    Qry.Close;


    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('URL_Webwhatsapp')+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      URL_Webwhatsapp:=Qry.FieldValues['value_string']
    end;
    Qry.Close;

    {Cetakan SPJ}
    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('SPJ_Form_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then SPJ_Form:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;
  end;
  Main.CloseDb;
//  for Count:=0 to Length(EmplArr)-1 do
//    Driver.Items.Add(EmplArr[Count][0]);



//  RefreshVehicle;
  Main.M_Normal;
end;

procedure TSPJFormBus.RefreshHeader;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Full_Payment_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then FullPayment:=True;
      if Qry.FieldValues['value_string']=0 then FullPayment:=False;
    end;
    Qry.Close;
    StrQry:='SELECT value_string FROM wh_setting WHERE setting_name='+QuotedStr('SJ_Range_CompanyId_'+CompanyId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then SJRange:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;

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

procedure TSPJFormBus.RefreshDestination;
var StrQry,StrSeat,StrGroups:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  SetLength(DestinationArr,0);
  Destination.Items.Clear;
  Destination.ItemIndex:=-1;
  Destination.Text:='';
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if SeatDisp.Text<>'' then StrSeat:=',@Seat='+SeatDisp.Text else StrSeat:='';
    if StrGroup<>'' then StrGroups:=',@VehicleGroup='+StrGroup else StrGroups:='';
    StrQry:='EXEC GetProductVehicleDetailList 2'+StrGroups+StrSeat+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    SetLength(DestinationArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      DestinationArr[Count][0]:=Qry.FieldValues['product_vehicle_detail_id'];
      DestinationArr[Count][1]:=Qry.FieldValues['destination'];
      DestinationArr[Count][2]:=Qry.FieldValues['fuel'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  for Count:=0 to Length(DestinationArr)-1 do
    Destination.Items.Add(DestinationArr[Count][1]);
  Main.M_Normal;
end;



procedure TSPJFormBus.InitReport;
begin
  QAlamat.Lines.Clear;
  QAcara.Lines.Clear;
  QNama.Caption:='';
  QTelpHP.Caption:='';
  QNoOrder.Caption:='';
  QNoSPJ.Caption:='';
  QCustomer.Caption:='';
  QTanggalReservasi.Caption:='';
  QJamReservasi.Caption:='';
  QSeat.Caption:='';
  QGuide.Caption:='';
  QGuidePhone.Caption:='';
  QNoBody.Caption:='';
  QNoPolisi.Caption:='';
  QCatatan.Caption:='';
  QMessage.Caption:='';
  SPJ_Form := 1;
end;

procedure TSPJFormBus.SetBookedDetailId(BookedDetail_Id:String;Is_Package:Boolean=False;Dates:String='');
var Qry:TADOQuery;
    StrQry,StrIsPackage,StrDates,StrNoBody,StrKenek:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    if Is_Package=False then StrIsPackage:='' else StrIsPackage:=',@IsPackage=1,@Dates='+QuotedStr(Dates);
    StrQry:='EXEC GetReservedOrderDetailDetail '+QuotedStr(BookedDetail_Id)+StrIsPackage+StrDates+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do
    begin
      StrIsOnline:=VarToStr(Qry.FieldValues['isOnline']);
      ReservedOrderDetaiId.Text:=Qry.FieldValues['reserved_order_detail_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      FromDate.Text:=Qry.FieldValues['from_dates_l'];
      FromDateApi.Text:=Qry.FieldValues['from_dates_api'];
      ToDate.Text:=Qry.FieldValues['to_dates_l'];
      FromTime.Text:=Qry.FieldValues['from_time'];
      StandbyTime.Text:=Qry.FieldValues['standby_time'];
      DriverDisp.Text:=Qry.FieldValues['driver_name'];
      StrVehicleID:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['driver_name2']<>NULL then
      begin
        StrDriver2:=Qry.FieldValues['employee_id2'];
        DriverDisp2.Text:=Qry.FieldValues['driver_name2'];
        if Qry.FieldValues['cellular_no_driver']<>NULL then
        TelpHP2.Text:=Qry.FieldValues['cellular_no_driver2']
        else
        TelpHP2.Text:='';
      end else
      begin
        DriverDisp2.Text:='';
        TelpHP2.Text:=''
      end;
      DisplayNoBody.Text:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['cellular_no_driver']<>NULL then
      begin
        TelpHP.Text:=Qry.FieldValues['cellular_no_driver'];
      end else
      begin
        TelpHP.Text:='';
      end;

      SeatDisp.Text:=Qry.FieldValues['seat'];
      if Qry.FieldValues['license_plate']<>NULL then
      begin
         if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      end;

      if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
      (* CEK YA *)
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];

      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];

      if (Qry.FieldValues['field_contact_cellular_no']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['field_contact_cellular_no']))<>'') then CellularWA.text:=Qry.FieldValues['field_contact_cellular_no']
      else begin
        if (Qry.FieldValues['contact_hp']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['contact_hp']))<>'') then CellularWA.text:=Qry.FieldValues['contact_hp']
        else CellularWA.text:='';
      end;

      StrGroup:=Qry.FieldValues['vehicle_vhc_batch_id'];
      StrNoBody:=Qry.FieldValues['body_id'];
      StrDriver:=Qry.FieldValues['employee_id'];


      StrKenek:=Qry.FieldValues['busboy_name'];
      Route.Text:=Qry.FieldValues['route'];
      PickupPoint.Text:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['remark']<>NULL then begin
        Remark.Text:=Qry.FieldValues['remark'];
        Catatan.Text:=Qry.FieldValues['remark'];
      end;
      if Qry.FieldValues['service_resume']<>NULL then begin
        Remark.Text:=Remark.Text+Qry.FieldValues['service_resume'];
        Catatan.Text:=Catatan.Text+Qry.FieldValues['service_resume'];
      end;
      if Qry.FieldValues['daily_package']<>NULL then Package.Checked:=True;
      if Qry.FieldValues['short_name']='SV' then OutService.Checked:=True;

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
    if Qry.RecordCount>0 then while not(Qry.Eof) do
    begin
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  RefreshCombo;
//  RefreshGrid;
//  NoBody.ItemIndex:=NoBody.Items.IndexOf(StrNoBody);
//  Driver.ItemIndex:=Driver.Items.IndexOf(StrDriver);
  Kenek.ItemIndex:=Kenek.Items.IndexOf(StrKenek);
//  SetDriverCar;
//  RefreshDestination;
end;

procedure TSPJFormBus.DisableInput;
begin
//  Driver.Enabled:=False;
//  Kenek.Enabled:=False;
//  NoBody.Enabled:=False;
//  TelpHP.Enabled:=False;
  Catatan.ReadOnly:=True;
  Simpan.Enabled:=False;
  GroupMitra.Enabled:=False;
  Cari.Enabled:=False;
  GroupPemakaian.Enabled:=False;
  PanelJam.Enabled:=False; 
end;

procedure TSPJFormBus.EnableInput;
begin
  NoBody.Enabled:=True;
  Driver.Enabled:=True;
  Kenek.Enabled:=True;
  Catatan.Enabled:=True;
  TelpHP.Enabled:=True;
  Simpan.Enabled:=True;
  GroupMitra.Enabled:=True;
  Cari.Enabled:=True;
  GroupPemakaian.Enabled:=True;
  PanelJam.Enabled:=True;
end;

procedure TSPJFormBus.KeluarClick(Sender: TObject);
begin
  SPJFormBus.Close;
end;

procedure TSPJFormBus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.CloseDb;
  Main.M_Normal;
  Action:=caFree;
end;

procedure TSPJFormBus.GridMitraSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSPJFormBus.DriverChange(Sender: TObject);
begin
  if (Driver.Text<>'') then begin
    SetDriverCar;
  end;
end;

procedure TSPJFormBus.SetDriverCar;
var Count:Integer;
begin
  if (Driver.Text<>'') then begin
    DriverDisp.Text:=EmplArr[Driver.ItemIndex][1];
    //if ((EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]<>'') AND (EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]<>',')) then TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]
    if ((EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3]<>'') AND (EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3]<>',')) then TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3]
    else TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][2]+','+EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3];
    if EmplArr[Driver.ItemIndex][7]='1' then begin
      NoBody.ItemIndex:=NoBody.Items.IndexOf('Sewa Luar');
      GroupPengemudi.Enabled:=True;
    end else
      GroupPengemudi.Enabled:=False;
  end;
  if (NoBody.Text='') AND (Driver.Items.Count>0) AND (NoBody.Items.Count>0) then begin
    if ArrayIndexOf(SchArr,Driver.Text,1)>=0 then begin
      if NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Driver.Text,1)][3])>=0 then begin
        NoBody.ItemIndex:=NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Driver.Text,1)][3]);
      end;
    end;
  end;
  if NoBody.Text<>'' then begin
    StrGroup:=VhcArr[NoBody.ItemIndex][15];
    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
    SeatDisp.Text:=VhcArr[NoBody.ItemIndex][16];
  end;
end;

procedure TSPJFormBus.SetHelper;
var Count:Integer;
begin
  if (Kenek.Text<>'') then begin
    BusBoyDisp.Text:=HelperArr[Kenek.ItemIndex][1];
    StrHelperPhone:=HelperArr[Kenek.ItemIndex][2];
  end else begin
    BusBoyDisp.Text:='';
    StrHelperPhone:='';
  end;

end;

procedure TSPJFormBus.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') AND (IsInput)  then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 8 do
        if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridMitra.RowCount:=Count2;
          for Count4:=0 to 8 do
          GridMitra.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TSPJFormBus.NoBodyChange(Sender: TObject);
var Count:Integer;
begin
  if (NoBody.Text)<>'' then begin
    if Driver.Text='' then begin
        if ArrayIndexOf(SchArr,NoBody.Text,3)>=0 then begin
              Driver.ItemIndex:=Driver.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,NoBody.Text,3)][1]);
              DriverDisp.Text:=EmplArr[Driver.ItemIndex][1];
            end;
    end;
    if VhcArr[NoBody.ItemIndex][17]='1' then begin
      Driver.ItemIndex:=Driver.Items.IndexOf('BU00000001');
    end;
    SetDriverCar;
    RefreshDestination;
  end;
end;

procedure TSPJFormBus.GridMitraDblClick(Sender: TObject);
begin
  if IsInput then begin
    if Length(EmplArr)>0 then begin
      Driver.ItemIndex:=Driver.Items.IndexOf(GridMitra.Cells[0,IntRow]);
      SetDriverCar;
    end;
  end;
end;

procedure TSPJFormBus.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGridService;
  RefreshHeader;
end;

procedure TSPJFormBus.SimpanClick(Sender: TObject);
var Qry,Qry2,Qry3,Qry4,Qry5,Qry6,Qry7,QryWehaOnline:TADOQuery;
    StrQry,StrQry2,StrQryWehaOnlineCek,StrQryWehaOnline : WideString;
    StrVhcId,StrTransId,StrEmployeeId,StrMsg,StrEMessage,StrHelperId,StrUrutID,StrWehaUserID,StrDriverQry,StrDriver2Qry,StrBusboyQry:String;
    StrFromDates,StrToDates,StrPickupPoint,StrRoute,StrRemark,StrRemark2,StrFromTimes,StrStandbyTimes,StrStatus,StrGroup,StrOutType,StrEMsg:String;
    StrReservedOrderDetailId,StrCustomerId,StrFieldContact,StrFieldPhoneNo,StrPhoneNo,StrBusBoy,StrCancel,StrDestination,StrConnecting:String;
    DayNight,IntCount,Val,IntKmestimasi,isMandatoryDriver2:Integer;
    IsAuth,IsOk:Boolean;
    NewSPJArr:Array of String;

    StrUrl,NameSpace,ParamIn, Pesan_WA,StrDriverBackupID,StrDriverBackupName,
    StrDriverBackupPhone,StrDriverBackupCustomerNo,
    StrWehaHelperID,StrWehaHelperName,
    StrWehaHelperPhone,StrWehaHelperCustomerNo: String;
    API: JadeServiceSoap;
    RequestAPI:VehicleInfoModel;
    ResponAPI: ServiceResponse;
    CallApi:Boolean;
    StandByTime_Api: TDateTime;
    D: TXSDateTime;
begin
  Qry7:=TADOQuery.Create(Self);
  Qry7.Connection:=Main.MyConnection;
  Qry7.ParamCheck:=False;

  if Main.OpenDb and Status.Checked<>True then begin
    if StrIsOnline='1' then
    begin
      StrQry:='SELECT * from wh_employee where employee_id='+QuotedStr(StrDriver)+' and active=1';
      Qry7.Close;
      Qry7.SQL.Clear;
      Qry7.SQL.Add(StrQry);
      Qry7.Open;

      if (Qry7.RecordCount=0) then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 1 Sudah Tidak Aktif'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end;

      if (DriverDisp2.Text<>'') then
      begin
        StrQry:='SELECT * from wh_employee where employee_id='+QuotedStr(StrDriver2)+' and active=1';
        Qry7.Close;
        Qry7.SQL.Clear;
        Qry7.SQL.Add(StrQry);
        Qry7.Open;

        if (Qry7.RecordCount=0) then begin
          MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 2 Sudah Tidak Aktif'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
          Exit;
        end;
      end;

      if (StrBusboyID<>'') then
      begin
        StrQry:='SELECT * from wh_employee where employee_id='+QuotedStr(StrBusboyID)+' and active=1';
        Qry7.Close;
        Qry7.SQL.Clear;
        Qry7.SQL.Add(StrQry);
        Qry7.Open;

        if (Qry7.RecordCount=0) then begin
          MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Helper Sudah Tidak Aktif'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
          Exit;
        end;
      end;

      if (IntWajibHelper=1) and (BusBoyDisp.Text='')  then
      begin
         MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Armada ini haru ada Helper'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
         Exit;
      end;

      StrQry:='SELECT * FROM wh_validasi where validasi=''PENUGASAN'' AND company_id='+CompanyId+' and active=1';
      Qry7.Close;
      Qry7.SQL.Clear;
      Qry7.SQL.Add(StrQry);
      Qry7.Open;



      if (Qry7.RecordCount>0) and (IsAuthRevCrew=False) then begin
        if (DriverDisp.Text<>'') and (StatusPenugasanDriver.Text<>'CONFIRM') AND (Status.Checked=False) then
        begin
           MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 1 Belum Konfirmasi Penugasan'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
           Exit;
        end else if (BusBoyDisp.Text<>'') and (StatusPenugasanHelper.Text<>'CONFIRM') AND (Status.Checked=False) then
        begin
           MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Kenek/Helper Belum Konfirmasi Penugasan'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
           Exit;
        end else if (DriverDisp2.Text<>'') and (StatusPenugasanDriver2.Text<>'CONFIRM') AND (Status.Checked=False) then
        begin
           MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 2 Belum Konfirmasi Penugasan'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
           Exit;
        end
      end;
      Qry7.Close;
    end;

    StrQry:='SELECT * FROM wh_validasi where validasi=''KELENGKAPAN DATA KARYAWAN'' AND company_id='+CompanyId+' and active=1';
    Qry7.Close;
    Qry7.SQL.Clear;
    Qry7.SQL.Add(StrQry);
    Qry7.Open;

    if (Qry7.RecordCount>0) then begin
      if (KtpDriver1='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 1 Tidak ada No KTP, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end else if (DriverDisp2.Text<>'') AND (KtpDriver2='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 2 Tidak ada No KTP, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end else if (StrBusboyID<>'') AND (KtpHelper='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Helper Tidak ada No KTP, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end else if (NoRekDriver1='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 1 Tidak ada No Rekening, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end else if (DriverDisp2.Text<>'') AND (NoRekDriver2='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Pengemudi 1 Tidak ada No Rekening, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end else if  (StrBusboyID<>'') AND (NoRekHelper='') then begin
        MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Helper Tidak ada No Rekening, Minta Team HRD untuk lengkapi data'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
        Exit;
      end;
    end;
  end;

  if (DisplayNoBody.Text<>'') AND (DriverDisp.Text<>'') AND (OrderId.Text<>'') {AND (Destination.Text<>'')}   then begin
    IsAuth:=True;
    IsOk:=True;
    StrMsg:='';
    StrEMessage:='';
    AuthorizedForm.FormId:=IntToStr(TreeTag);
    if IsAuth then begin
      DisableInput;
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.ParamCheck:=False;
      Qry2:=TADOQuery.Create(Self);
      Qry2.Connection:=Main.MyConnection;
      Qry2.ParamCheck:=False;
      Qry3:=TADOQuery.Create(Self);
      Qry3.Connection:=Main.MyConnection;
      Qry3.ParamCheck:=False;
      Qry4:=TADOQuery.Create(Self);
      Qry4.Connection:=Main.MyConnection;
      Qry4.ParamCheck:=False;
      Qry5:=TADOQuery.Create(Self);
      Qry5.Connection:=Main.MyConnection;
      Qry5.ParamCheck:=False;
      Qry6:=TADOQuery.Create(Self);
      Qry6.Connection:=Main.MyConnection;
      Qry6.ParamCheck:=False;
      QryWehaOnline:=TADOQuery.Create(Self);
      QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
      QryWehaOnline.ParamCheck:=False;
      Qry.CommandTimeout:=7200;
      Qry2.CommandTimeout:=7200;
      Qry3.CommandTimeout:=7200;
      Qry4.CommandTimeout:=7200;
      Qry5.CommandTimeout:=7200;
      Qry6.CommandTimeout:=7200;
      QryWehaOnline.CommandTimeout:=7200;

      if Main.OpenDb then begin
        Main.TransStart;

        {get url API}
       { if LowerCase(Main.Db)='wh_prod' then
          StrQry:='exec GetWebServiceURL 3'
        else  StrQry:='exec GetWebServiceURL 4';
        Qry.Close;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);,
        Qry.Open;
        Qry.First;
        if (Qry.RecordCount>0) then begin
          StrUrl:=Qry.FieldValues['url_webservice'];
          NameSpace:=Qry.FieldValues['name_space'];
        end;
        }
//        for IntCount:=0 to Length(VhcArr)-1 do
//          if NoBody.Text=VhcArr[IntCount][1] then StrVhcId:=QuotedStr(VhcArr[IntCount][0]);
        StrReservedOrderDetailId:=QuotedStr(ReservedOrderDetaiId.Text);
        StrEmployeeId:=QuotedStr(Driver.Text);
//        if CompanyId='2' then begin
          StrHelperId:=QuotedStr(StrBusboyID);
//        end else begin
//          Try
//            StrHelperId:=QuotedStr(HelperArr[Kenek.ItemIndex][0]);
//            StrHelperPhone:=HelperArr[Kenek.ItemIndex][2];
//          Except
//            on Exception Do
//              StrHelperId:=QuotedStr('');
//          End;
//        end;


        StrCustomerId:=QuotedStr(CustomerId.Text);
        StrFromDates:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(FromDate.Text)));
        StrToDates:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(ToDate.Text)));
        StrFromTimes:=QuotedStr(FromTime.Text);
        StrStandbyTimes:=QuotedStr(StandbyTime.Text);
        StrRoute:=QuotedStr(Route.Text);
        if Connecting.Checked then StrConnecting:='1' else StrConnecting:='0';
        if OutService.Checked then StrOutType:='2' else StrOutType:='1';
        if Destination.Text<>'' then  StrDestination:=QuotedStr(DestinationArr[Destination.ItemIndex][0]);
        if PickupPoint.Text<>'' then StrPickupPoint:=QuotedStr(PickupPoint.Text) else StrPickupPoint:='NULL';
        if Trim(Group.Text)<>'' then StrGroup:=QuotedStr(Trim(Group.Text)) else StrGroup:='NULL';
        if Guide.Text<>'' then StrFieldContact:=QuotedStr(Guide.Text) else StrFieldContact:='NULL';
        if GuideCellular.Text<>'' then StrFieldPhoneNo:=QuotedStr(GuideCellular.Text) else StrFieldPhoneNo:='NULL';
        StrPhoneNo:=QuotedStr(TelpHP.Text);
        if Trim(BusBoyDisp.Text)<>'' then StrBusBoy:=QuotedStr(BusBoyDisp.Text) else StrBusBoy:='NULL';
        if Catatan.Text<>'' then StrRemark:=QuotedStr(Catatan.Text) else StrRemark:='NULL';

        if Kmestimasi.Text ='' then  IntKmestimasi:=0 else IntKmestimasi := SToInt(ToString(Kmestimasi.Text));

        if Remark.Text<>'' then StrRemark2:=QuotedStr(Remark.Text) else StrRemark2:='NULL';

        StrRemark := stringreplace(StrRemark, '"', '*', [rfReplaceAll]);
        StrRemark2 := stringreplace(StrRemark2, '"', '*', [rfReplaceAll]);

        if Status.Visible=True then
          if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';

        StrQry:='SELECT b.employee_id FROM wh_attandance_leave_detail a '+
                'LEFT JOIN wh_attandance_leave b ON a.attandance_leave_id=b.attandance_leave_id  '+
                'WHERE a.status=1 AND b.status=1 AND b.status_approve=''APPROVED'' AND  '+
                'b.employee_id = '+QuotedStr(StrDriver)+' '+
                'AND (a.date_leave BETWEEN '+StrFromDates+' AND '+StrToDates+')';
        Qry4.Close;
        Qry4.SQL.Clear;
//        Main.WriteLog('SQL :'+StrQry,2);
        Qry4.SQL.Add(StrQry);
        Qry4.Open;

        StrQry:='SELECT b.customer_order_id,DATEDIFF(DAY,a.from_date,a.to_date)+1 hari '+
                          'FROM wh_reserved_order_detail a '+
                          'LEFT JOIN wh_reserved_order b ON a.reserved_order_id=b.reserved_order_id '+
                          'WHERE b.customer_order_id<>'+QuotedStr(OrderId.Text)+' AND ('+StrFromDates+' BETWEEN a.from_date '+
                          'AND a.to_date) AND '+
                          '(a.employee_id='+QuotedStr(StrDriver) +' OR '+
                          'a.employee_id2='+QuotedStr(StrDriver) +' OR '+
                          'a.employee_id='+QuotedStr(StrDriver2) +' OR '+
                          'a.employee_id2='+QuotedStr(StrDriver2) +') AND b.status=1 AND a.status=1 '+
                          'AND SUBSTRING(b.customer_order_id,1,2)<>''WL'';';
        Qry5.Close;
        Qry5.SQL.Clear;
//        Main.WriteLog('SQL :'+StrQry,2);
        Qry5.SQL.Add(StrQry);
        Qry5.Open;

        StrQry:='SELECT a.employee_id2 FROM wh_reserved_order_detail a '+
                'LEFT JOIN wh_reserved_order b on a.reserved_order_id=b.reserved_order_id '+
                'LEFT JOIN wh_vehicle c on a.vehicle_id=c.vehicle_id WHERE '+
                'a.reserved_order_detail_id='+StrReservedOrderDetailId+' AND b.company_id=2 AND '+
                '(c.isOutsideRent=0 OR c.isOutsideRent IS NULL) AND '+
                '(a.route LIKE ''%jawa tengah%'' OR a.route LIKE ''%central java%'' OR '+
                'a.route LIKE ''%jawa timur%'' OR a.route LIKE ''%East Java%'' OR '+
                'a.route LIKE ''%palembang%'' OR a.route LIKE ''%Surabaya%'') AND DATEDIFF(day, a.from_date, a.to_date)>1';
        Qry3.Close;
        Qry3.SQL.Clear;
        Qry3.SQL.Add(StrQry);
        Qry3.Open;

        StrQry:='SELECT isTransfer,isTransfer_update_time FROM wh_vhc_trans WHERE vhc_trans_id='+QuotedStr(NoSPJ.Text);
        Qry6.Close;
        Qry6.SQL.Clear;
//        Main.WriteLog('SQL :'+StrQry,2);
        Qry6.SQL.Add(StrQry);
        Qry6.Open;

        if (Qry4.RecordCount>0) and (Status.Checked=False) and (NoSPJ.Text='') then begin
          IsOk:=False;

          MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Driver '+QuotedStr(DriverDisp.Text)+' ada ijin'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
          Main.M_Normal;
          Qry4.Close;
          EnableInput;
          Main.CloseDb;
          Exit;
        end
        else if (Qry5.RecordCount>0) and (Status.Checked=False) AND (NoSPJ.Text='') AND (Connecting.Checked=False) then begin
          IsOk:=False;

          MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Driver sudah ada penjadwalan di order '+Qry5.FieldByName('customer_order_id').AsString+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
          Main.M_Normal;
          Qry5.Close;
          EnableInput;
          Main.CloseDb;
          Exit;
        end
        else if (Qry3.RecordCount>0 ) AND ( Qry3.FieldValues['employee_id2']=NULL) AND (Status.Checked=False) AND (NoSPJ.Text='') and (FromDate.Text<>ToDate.Text) then begin

            IsOk:=False;
            MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Driver harus 2'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
            Main.M_Normal;
            Qry3.Close;
            EnableInput;
            Main.CloseDb;
            Exit;

        end
        else if (Qry6.RecordCount>0 ) AND ( Qry6.FieldValues['isTransfer']='1') AND (Status.Checked=True) then begin

            IsOk:=False;
            MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Uang Order sudah di Transfer 2'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONWARNING);
            Main.M_Normal;
            Qry3.Close;
            EnableInput;
            Main.CloseDb;
            Exit;
        end
        else
        begin
          if SJId<>'' then begin
            if StrStatus='1' then
            begin
              StrCancel:='NULL';
              StrDeskripsiHist:='Perubahan surat jalan';
            end else
            begin
              StrCancel:='1';
              StrDeskripsiHist:='Cancel surat jalan';
            end;
            StrTransId:=SJId;
            StrQry:=' UPDATE wh_vhc_trans SET vehicle_id='+QuotedStr(StrVehicleID)+',employee_id='+QuotedStr(StrDriver)+',employee_id2='+QuotedStr(StrDriver2)+',employee_id3='+QuotedStr(StrBusboyID)+//StrHelperId+
                    ',phone_no='+StrPhoneNo+',description='+StrRemark+',remark='+StrRemark2+',cancel='+StrCancel+',update_user='+QuotedStr(User)+',update_time=GETDATE(),km_estimasi='+IntToStr(IntKmestimasi)+' '+
                    ' WHERE vhc_trans_id='+QuotedStr(StrTransId)+';';
            if StrStatus='1' then begin
              StrQry:=StrQry+' UPDATE wh_vhc_trans_detail_detail SET status=0 WHERE (vhc_trans_id='+QuotedStr(StrTransId)+') AND (status=1);';
              if (StrDriver<>StrDriverOld) or (StrDriver2<>StrDriver2Old) or (StrBusboyID<>StrBusboyIDOld)
              then StrQry:=StrQry+' UPDATE wh_reserved_order_detail SET employee_id='+QuotedStr(StrDriver)+',employee_id2='+QuotedStr(StrDriver2)+','+
                      'employee_id3='+QuotedStr(StrBusboyID)+' WHERE reserved_order_detail_id='+StrReservedOrderDetailId+' ';
            end else begin
//              if Package.Checked = False then begin
                StrQry:=StrQry+' UPDATE wh_reserved_order_detail SET vhc_trans_id=NULL, update_user='+QuotedStr(User)+',update_time=GETDATE() WHERE (reserved_order_detail_id='+StrReservedOrderDetailId+') AND (status=1);';
//              end else begin
//                StrQry:=StrQry+' UPDATE wh_reserved_order_detail_package SET vhc_trans_id=NULL WHERE (reserved_order_detail_id='+StrReservedOrderDetailId+') AND (status=1);';
//              end;
            end;
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                StrMsg:='Tidak Dapat Menyimpan SJ';
                StrEMessage:=E.Message;
                IsOk:=False;
              end;
            end;

            if (StrIsOnline='1') AND ((StrDriverOld<>StrDriver) OR (StrDriver2Old<>StrDriver2)
            OR (StrBusboyIDOld<>StrBusboyID) ) then begin
              if Main.OpenDb then begin

                StrDriverQry:='';
                StrDriver2Qry:='';
                StrBusboyQry:='';

                StrQry:='SELECT * FROM OrderDetailVehicleInfos WHERE WehaReservedCode='+StrReservedOrderDetailId;
                QryWehaOnline.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,2);
                QryWehaOnline.SQL.Add(StrQry);
                QryWehaOnline.Open;

                if QryWehaOnline.RecordCount>0 then begin
                  if Status.Checked=False then
                  begin
                    if StrDriverOld<>StrDriver then
//                    if Kenek.Text<>'' then
                    begin

                      StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                             'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                             'b.CustomerNo='+QuotedStr(StrDriver)+' AND b.IsActive=1';
                      QryWehaOnline.Close;
                      QryWehaOnline.SQL.Clear;
                      QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                      QryWehaOnline.Open;

                      if QryWehaOnline.RecordCount=0 then begin
                        StrQryWehaOnline:= 'INSERT INTO Contacts '+
                                      '(FullName,Gender,'+
                                      'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                                      'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                                      '('+QuotedStr(DriverDisp.Text)+',''M'' '+
                                      ','+QuotedStr(TelpHP.Text)+',0,0,0 '+
                                      ',GETDATE(),0,GETDATE(),0); ';

                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnline);
                        try
                          QryWehaOnline.ExecSQL;
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
                        QryWehaOnline.Close;
                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                        QryWehaOnline.Open;

                        StrWehaUserID:=StringReplace(QuotedStr(DriverDisp.Text),' ','.',[rfReplaceAll]);

                        StrQryWehaOnline:= 'INSERT INTO Users '+
                                      '(ContactID,CustomerNo,'+
                                      'Email,Password,Role,LoginType,WehaUserID,'+
                                      'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,) VALUES '+
                                      '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                                      ','+QuotedStr(StrDriver)+','+StrWehaUserID+' '+
                                      ',NULL,''DRIVER'',''EMAIL'' '+
                                      ','+StrWehaUserID+' '+
                                      ',1,0,GETDATE(),0,GETDATE()); ';

                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnline);
                        try
                          QryWehaOnline.ExecSQL;
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
                                           'b.CustomerNo='+QuotedStr(StrDriver)+' AND b.IsActive=1';
                        QryWehaOnline.Close;
                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                        QryWehaOnline.Open;

                      end;

                      StrDriverQry:=' DriverID='+QuotedStr(QryWehaOnline.FieldValues['UserID'])+','+
                                    'DriverName='+QuotedStr(QryWehaOnline.FieldValues['FullName'])+','+
                                    'DriverPhone='+QuotedStr(QryWehaOnline.FieldValues['HP'])+','+
                                    'WEHACustomerNo='+QuotedStr(StrDriver);

                    end else if StrDriver2Old<>StrDriver2 then
                    begin
                      if StrDriver2<>'' then begin
                        StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                               'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                               'b.CustomerNo='+QuotedStr(StrDriver2)+' AND b.IsActive=1';
                        QryWehaOnline.Close;
                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                        QryWehaOnline.Open;

                        if QryWehaOnline.RecordCount=0 then begin
                          StrQryWehaOnline:= 'INSERT INTO Contacts '+
                                        '(FullName,Gender,'+
                                        'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                                        'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                                        '('+QuotedStr(DriverDisp2.Text)+',''M'' '+
                                        ','+QuotedStr(TelpHP2.Text)+',0,0,0 '+
                                        ',GETDATE(),0,GETDATE(),0); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnline);
                          try
                            QryWehaOnline.ExecSQL;
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
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                          StrWehaUserID:=StringReplace(QuotedStr(DriverDisp2.Text),' ','.',[rfReplaceAll]);

                          StrQryWehaOnline:= 'INSERT INTO Users '+
                                        '(ContactID,CustomerNo,'+
                                        'Email,Password,Role,LoginType,WehaUserID,'+
                                        'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,) VALUES '+
                                        '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                                        ','+QuotedStr(StrDriver2)+','+StrWehaUserID+' '+
                                        ',NULL,''DRIVER'',''EMAIL'' '+
                                        ','+StrWehaUserID+' '+
                                        ',1,0,GETDATE(),0,GETDATE()); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnline);
                          try
                            QryWehaOnline.ExecSQL;
                          except
                            on E:Exception do begin
                              Main.TransRollback;
                              IsOk:=False;
                              EnableInput;
                              StrEMsg:=StrEMsg+E.Message;
                              MessageBox(Handle,PChar('Surat Jalan tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Surat Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                              Exit;
                            end;
                          end;

                          StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                             'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                             'b.CustomerNo='+QuotedStr(StrDriver2)+' AND b.IsActive=1';
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                        end;
                      end;
                      if StrDriver2='' then
                      begin
                        StrDriverBackupID:='NULL';
                        StrDriverBackupName:='NULL';
                        StrDriverBackupPhone:='NULL';
                        StrDriverBackupCustomerNo:='NULL';
                      end else begin
                        StrDriverBackupID:=QuotedStr(QryWehaOnline.FieldValues['UserID']);
                        StrDriverBackupName:=QuotedStr(QryWehaOnline.FieldValues['FullName']);
                        StrDriverBackupPhone:=QuotedStr(QryWehaOnline.FieldValues['HP']);
                        StrDriverBackupCustomerNo:=QuotedStr(StrDriver2);
                      end;

                      if (StrDriverQry='') then
                      StrDriver2Qry:='DriverBackupID='+StrDriverBackupID+','+
                                    'DriverBackupName='+StrDriverBackupName+','+
                                    'DriverBackupPhone='+StrDriverBackupPhone+','+
                                    'DriverBackupCustomerNo='+StrDriverBackupCustomerNo
                      else  StrDriver2Qry:=',DriverBackupID='+StrDriverBackupID+','+
                                    'DriverBackupName='+StrDriverBackupName+','+
                                    'DriverBackupPhone='+StrDriverBackupPhone+','+
                                    'DriverBackupCustomerNo='+StrDriverBackupCustomerNo;

                    end

                    else if StrBusboyIDOld<>StrBusboyID then begin
                      if StrBusboyID <>'' then begin
                        StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                               'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                               'b.CustomerNo='+QuotedStr(StrBusboyID)+' AND b.IsActive=1';
                        QryWehaOnline.Close;
                        QryWehaOnline.SQL.Clear;
                        QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                        QryWehaOnline.Open;

                        if QryWehaOnline.RecordCount=0 then begin
                          StrQryWehaOnline:= 'INSERT INTO Contacts '+
                                        '(FullName,Gender,'+
                                        'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                                        'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                                        '('+QuotedStr(Kenek.Text)+',''M'' '+
                                        ','+QuotedStr(StrHelperPhone)+',0,0,1 '+
                                        ',GETDATE(),1,GETDATE(),0); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnline);
                          try
                            QryWehaOnline.ExecSQL;
                          except
                            on E:Exception do begin
                              Main.TransRollback;
                              IsOk:=False;
                              EnableInput;
                              StrEMsg:=StrEMsg+E.Message;
                              MessageBox(Handle,PChar('Surat Jalan tidak bisa diinput'+Chr(13)+Chr(13)+StrEMsg),'Surat jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                              Exit;
                            end;
                          end;


                          StrQryWehaOnlineCek:='SELECT TOP 1 ContactID FROM Contacts '+
                                               'WHERE CreatedBy=0 Order By ContactID DESC';
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                          StrWehaUserID:=StringReplace(QuotedStr(Kenek.Text),' ','.',[rfReplaceAll]);

                          StrQryWehaOnline:= 'INSERT INTO Users '+
                                        '(ContactID,CustomerNo,'+
                                        'Email,Password,Role,LoginType,WehaUserID,'+
                                        'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsHelper) VALUES '+
                                        '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                                        ','+QuotedStr(StrBusboyID)+','+StrWehaUserID+' '+
                                        ',NULL,''DRIVER'',''EMAIL'' '+
                                        ','+StrWehaUserID+' '+
                                        ',1,0,GETDATE(),0,GETDATE(),1); ';

                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnline);
                          try
                            QryWehaOnline.ExecSQL;
                          except
                            on E:Exception do begin
                              Main.TransRollback;
                              IsOk:=False;
                              EnableInput;
                              StrEMsg:=StrEMsg+E.Message;
                              MessageBox(Handle,PChar('Surat Jalan tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Surat Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                              Exit;
                            end;
                          end;

                          StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                             'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                             'b.CustomerNo='+QuotedStr(StrBusboyID)+' AND b.IsActive=1';
                          QryWehaOnline.Close;
                          QryWehaOnline.SQL.Clear;
                          QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                          QryWehaOnline.Open;

                        end;
                      end;
                      if StrBusboyID='' then
                      begin
                        StrWehaHelperID:='NULL';
                        StrWehaHelperName:='NULL';
                        StrWehaHelperPhone:='NULL';
                        StrWehaHelperCustomerNo:='NULL';
                      end else begin
                        StrWehaHelperID:=QuotedStr(QryWehaOnline.FieldValues['UserID']);
                        StrWehaHelperName:=QuotedStr(QryWehaOnline.FieldValues['FullName']);
                        StrWehaHelperPhone:=QuotedStr(QryWehaOnline.FieldValues['HP']);
                        StrWehaHelperCustomerNo:=QuotedStr(StrBusboyID);
                      end;

                      if (StrDriverQry='') AND (StrDriver2Qry='') then
                        StrBusboyQry:='HelperID='+StrWehaHelperID+','+
                                    'HelperName='+StrWehaHelperName+','+
                                    'HelperPhone='+StrWehaHelperPhone+','+
                                    'WEHAHelperCustomerNo='+QuotedStr(StrBusboyID)
                       else StrBusboyQry :=',HelperID='+StrWehaHelperID+','+
                                    'HelperName='+StrWehaHelperName+','+
                                    'HelperPhone='+StrWehaHelperPhone+','+
                                    'WEHAHelperCustomerNo='+QuotedStr(StrBusboyID);

                    end;

                    StrQry:=' UPDATE OrderDetailVehicleInfos SET '+StrDriverQry+StrDriver2Qry+StrBusboyQry+
                            ' WHERE WehaReservedCode='+StrReservedOrderDetailId;
                  end;
                  Main.WriteLog('SQL :'+StrQry,2);
                  QryWehaOnline.SQL.Clear;
                  QryWehaOnline.SQL.Add(StrQry);
                  try
                    QryWehaOnline.ExecSQL;
                    isOk := true ;
                  except
                    on E:Exception do begin
                      StrMsg:='Tidak Dapat Menyimpan Detail SJ';
                      StrEMessage:=E.Message;
                      IsOk:=False;
                    end;
                  end;
                end else begin
                  isOk := False;
                  EnableInput;
                  ShowMessage('Error '+StrReservedOrderDetailId);
                end;

  //              Main.CloseDb;
              end;
            end;


          end
          else
          begin
            StrQry:='SELECT RIGHT(MAX(vhc_trans_id),4) AS max_id FROM wh_vhc_trans '+
                    'WHERE vhc_trans_id  LIKE '+QuotedStr('SJB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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

            StrQry:='SELECT RIGHT(MAX(urut_id),3) AS max_id FROM wh_vhc_trans '+
                    'WHERE urut_id  LIKE '+QuotedStr('TF'+LocationCode+FormatDateTime('yy',StrToDate(FromDate.Text))+
                  FormatDateTime('mm',StrToDate(FromDate.Text))+FormatDateTime('dd',StrToDate(FromDate.Text))+'___')+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['max_id']<>NULL then begin
              StrUrutID:=Qry.FieldValues['max_id'];
              StrUrutID:=Format('%.*d',[3,StrToInt(StrUrutID)+1]);
              Qry.Close;
              Qry.SQL.Clear;
            end else
              StrUrutID:='001';
              StrUrutId:=StrUrutId;

              StrDeskripsiHist:='Buat surat jalan';

//            if Package.Checked = False then begin
              StrTransId:='SJB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                          FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
              StrUrutId:='TF'+LocationCode+FormatDateTime('yy',StrToDate(FromDate.Text))+
                          FormatDateTime('mm',StrToDate(FromDate.Text))+FormatDateTime('dd',StrToDate(FromDate.Text))+StrUrutID;
              StrQry:='INSERT INTO wh_vhc_trans (vhc_trans_id,vehicle_id,vhc_trans_type_id,employee_id,employee_id2,employee_id3'+
                    ',phone_no,location_id,out_date,out_user,description,remark,update_user,km_estimasi,isConnecting,urut_id) '+
                    'VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrVehicleID)+',1,'+QuotedStr(StrDriver)+','+QuotedStr(StrDriver2)+','+QuotedStr(StrBusboyID)+
                    ','+StrPhoneNo+','+LocationId+','+StrFromDates+','+QuotedStr(User)+
                    ','+StrRemark+
                    ','+StrRemark2+
                    ','+QuotedStr(User)+','+IntToStr(IntKmestimasi)+','+QuotedStr(StrConnecting)+','+QuotedStr(StrUrutID)+');';

              if (StrBusboyID <> '') then begin
                  StrQry:=StrQry+' UPDATE wh_reserved_order_detail SET vhc_trans_id='+QuotedStr(StrTransId)+
                          ',employee_id3 ='+QuotedStr(StrBusboyID)+',helper_status='+QuotedStr(StatusPenugasanHelper.Text)+
                          ' WHERE reserved_order_detail_id='+StrReservedOrderDetailId+';';
              end else begin
                  StrQry:=StrQry+' UPDATE wh_reserved_order_detail SET vhc_trans_id='+QuotedStr(StrTransId)+
                     //   ' employee_id3 ='+StrHelperId+',helper_status='+QuotedStr(StatusPenugasanHelper.Text)+
                        ' WHERE reserved_order_detail_id='+StrReservedOrderDetailId+';';
              end;

              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,4);
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  StrMsg:='Tidak Dapat Menyimpan SJ';
                  StrEMessage:=E.Message;
                  IsOk:=False;
                end;
              end;
              {Cek data Topup}
              (*
              Qry.Close;
              StrQry:='SELECT msisdn_topup_id as IdTopup FROM wh_vhc_msisdn_topup '+
                      'WHERE vehicle_id='+StrVhcId+' AND status=1;';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
              IntCount:=0;
              SetLength(VhcTransIdArr,Qry.RecordCount);
              if Qry.RecordCount>0 then while Not Qry.Eof do begin
                  VhcTransIdArr[IntCount][0]:=VarToStr(Qry.FieldValues['noSJ']);
                  if IntCount=0 then StrVhcTransId:=VarToStr(Qry.FieldValues['noSJ'])
                  else StrVhcTransId:=StrVhcTransId+','+VarToStr(Qry.FieldValues['noSJ']);
                  Inc(IntCount);
                  Qry.Next;
                end;
              Qry.Close;
              {end cek data Topup}
              *)
//            end else begin
//              StrQry:='SELECT CONVERT(VARCHAR(10),from_date,103) AS dates,* FROM wh_reserved_order_detail_package WHERE (reserved_order_detail_id='+StrReservedOrderDetailId+') AND (status=1);';
//              Qry2.SQL.Clear;
//              Main.WriteLog('SQL :'+StrQry,2);
//              Qry2.SQL.Add(StrQry);
//              Qry2.Open;
//              IntCount:=0;
//              SetLength(NewSPJArr,Qry2.RecordCount);
//              if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
//                StrTransId:='SJB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
//                          FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
//                StrUrutId:='TF'+LocationCode+FormatDateTime('yy',StrToDate(FromDate.Text))+
//                          FormatDateTime('mm',StrToDate(FromDate.Text))+FormatDateTime('dd',StrToDate(FromDate.Text))+StrUrutID;
//                StrFromDates:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Qry2.FieldValues['dates'])));
//                StrQry:='INSERT INTO wh_vhc_trans (vhc_trans_id,vehicle_id,vhc_trans_type_id,employee_id,employee_id2'+
//                        ',phone_no,location_id,out_date,out_user,description,remark,update_user,km_estimasi,isConnecting,urut_id) '+
//                        'VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrVehicleID)+','+StrOutType+','+QuotedStr(StrDriver)+','+QuotedStr(StrDriver2) +
//                        ','+StrPhoneNo+','+LocationId+','+StrFromDates+','+QuotedStr(User)+
//                        ','+StrRemark+
//                        ','+StrRemark2+
//                        ','+QuotedStr(User)+','+IntToStr(IntKmestimasi)+','+QuotedStr(StrConnecting)+','+QuotedStr(StrUrutID)+');';
//                StrQry:=StrQry+' UPDATE wh_reserved_order_detail_package SET vhc_trans_id='+QuotedStr(StrTransId)+
//                        ' WHERE (reserved_order_detail_package_id='+QuotedStr(Qry2.FieldValues['reserved_order_detail_package_id'])+');';
//                StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail_detail (vhc_trans_id,customer_id,from_date,to_date'+
//                        ',from_time,standby_time,route,pickup_point,group_name,field_contact,field_contact_cellular_no,busboy'+
//                        //',product_vehicle_detail_id
//                        ',update_user) '+
//                        'VALUES ('+QuotedStr(StrTransId)+','+StrCustomerId+','+StrFromDates+','+StrFromDates+
//                        ','+StrFromTimes+','+StrStandbyTimes+','+StrRoute+','+StrPickupPoint+','+StrGroup+
//                        ','+StrFieldContact+','+StrFieldPhoneNo+','+StrBusBoy+{','+StrDestination+}','+QuotedStr(User)+');';
//                NewSPJArr[IntCount]:=StrTransId;
//                Qry.SQL.Clear;
//                Main.WriteLog('SQL :'+StrQry,4);
//                Qry.SQL.Add(StrQry);
//                try
//                  Qry.ExecSQL;
//                except
//                  on E:Exception do begin
//                    StrMsg:='Tidak Dapat Menyimpan SJ';
//                    StrEMessage:=E.Message;
//                    IsOk:=False;
//                  end;
//                end;
//                Qry2.Next;
//                StrTransId:=Format('%.*d',[4,StrToInt(RightStr(StrTransId,4))+1]);
//                Inc(IntCount);
//              end;
//              Qry2.Close;
//            end;
          end;
          StrQry:='';

          if StrStatus='1' then begin
//            if Package.Checked = False then begin
              StrQry:=StrQry+'INSERT INTO wh_vhc_trans_detail_detail (vhc_trans_id,customer_id,from_date,to_date'+
                      ',from_time,standby_time,route,pickup_point,group_name,field_contact,field_contact_cellular_no'+
                      ',busboy'+
                      //,product_vehicle_detail_id
                      ',update_user) '+
                      'VALUES ('+QuotedStr(StrTransId)+','+StrCustomerId+','+StrFromDates+','+StrToDates+
                      ','+StrFromTimes+','+StrStandbyTimes+','+StrRoute+','+StrPickupPoint+','+StrGroup+
                      ','+StrFieldContact+','+StrFieldPhoneNo+','+StrBusBoy+{','+StrDestination+}','+QuotedStr(User)+');';
//            end else begin

  {            StrQry:=' UPDATE wh_reserved_order_detail_package SET vhc_trans_id='+QuotedStr(StrTransId)+
                      ' WHERE (reserved_order_detail_id='+StrReservedOrderDetailId+') '+
                      ' AND (CONVERT(VARCHAR(10),from_date,103)='+
                      QuotedStr(FormatDateTime('dd/mm/yyyy',StrToDate(FromDate.Text)))+');';
  }
//            end;
          end;

          if StrQry<>'' then begin
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                StrMsg:='Tidak Dapat Menyimpan Detail SJ';
                StrEMessage:=E.Message;
                IsOk:=False;
              end;
            end;
          end;

          //Kirim Data ke Weha Online
          if IsOk=True then begin
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
              if Main.OpenDb then begin

                StrDriverQry:='';
                StrDriver2Qry:='';
                StrBusboyQry:='';

               //  MessageBox(0,PChar(QuotedStr(HelperID.Text)),'SJ Bus',MB_OK or MB_ICONINFORMATION);
               //  MessageBox(0,PChar(StrHelperId),'SJ Bus',MB_OK or MB_ICONINFORMATION);


                StrQryWehaOnlineCek:='SELECT b.UserID,a.FullName,a.HP FROM Contacts a '+
                                         'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                         'b.CustomerNo='+QuotedStr(StrBusboyID)+' AND b.IsActive=1';
                QryWehaOnline.Close;
                QryWehaOnline.SQL.Clear;
                QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
                QryWehaOnline.Open;

                if(QryWehaOnline.RecordCount > 0) then begin
                  StrWehaHelperID:=QuotedStr(QryWehaOnline.FieldValues['UserID']);
                  StrWehaHelperName:=QuotedStr(QryWehaOnline.FieldValues['FullName']);
                  StrWehaHelperPhone:=QuotedStr(QryWehaOnline.FieldValues['HP']);
                  StrWehaHelperCustomerNo:=QuotedStr(StrBusboyID);
                end else begin
                  StrWehaHelperID:='NULL';
                  StrWehaHelperName:='NULL';
                  StrWehaHelperPhone:='NULL';
                  StrWehaHelperCustomerNo:='NULL';
                end;

                 StrBusboyQry :=',HelperID='+StrWehaHelperID+','+
                                'HelperName='+StrWehaHelperName+','+
                                'HelperPhone='+StrWehaHelperPhone+','+
                                'WEHAHelperCustomerNo='+QuotedStr(StrBusboyID);

                StrQry:='SELECT * FROM OrderDetailVehicleInfos WHERE WehaReservedCode='+StrReservedOrderDetailId;
                QryWehaOnline.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,2);
                QryWehaOnline.SQL.Add(StrQry);
                QryWehaOnline.Open;

                if QryWehaOnline.RecordCount>0 then begin
                  if Status.Checked=True then
                  begin
                    StrQry:=' UPDATE OrderDetailVehicleInfos SET WorkOrderNo = NULL'+StrBusboyQry+
                            ' WHERE WehaReservedCode='+StrReservedOrderDetailId;
                  end else begin
                   // if (BusBoyDisp.Text <>'') then begin
                      StrQry:=' UPDATE OrderDetailVehicleInfos SET WorkOrderNo='+QuotedStr(StrTransId)+StrBusboyQry+
                            ' WHERE WehaReservedCode='+StrReservedOrderDetailId;
                   // end else begin
                   //   StrQry:=' UPDATE OrderDetailVehicleInfos SET WorkOrderNo='+QuotedStr(StrTransId)+
                    //        ' WHERE WehaReservedCode='+StrReservedOrderDetailId;
                   //end;
                  end;
                  Main.WriteLog('SQL :'+StrQry,2);
                  QryWehaOnline.SQL.Clear;
                  QryWehaOnline.SQL.Add(StrQry);
                  try
                    QryWehaOnline.ExecSQL;
                    isOk := true ;
                  except
                    on E:Exception do begin
                      StrMsg:='Tidak Dapat Menyimpan Detail SJ';
                      StrEMessage:=E.Message;
                      IsOk:=False;
                    end;
                  end;
                end else begin
                  isOk := False;
                  EnableInput;
                  ShowMessage('Error '+StrReservedOrderDetailId);
                end;

  //              Main.CloseDb;
              end;
            end;

            {if CallApi then begin

              WebService.Port := 'JadeServiceSoap';
              WebService.Service := 'JadeService';

              RequestAPI:= VehicleInfoModel.Create;
              If StrStatus='1' Then
                With RequestAPI Do Begin
                  WehaReservedCode := ReservedOrderDetaiId.Text;
                  WorkOrderNo := StrTransId;
                  Status := '';
                  DriverName := DriverDisp.Text;
                  DriverPhone:= TelpHP.Text;
                  VehiclePlateNo:=NoPolisi.Text;
                  StandByTimeStr:=stringreplace(FromDateApi.Text+' '+StandbyTime.Text, #39, '', [rfReplaceAll, rfIgnoreCase]);

                End
              else
                With RequestAPI Do Begin
                  WehaReservedCode := ReservedOrderDetaiId.Text;//StrReservedOrderDetailId;
                  WorkOrderNo := '';
                  Status := '';
                  DriverName := '';
                  DriverPhone:= '';
                  VehiclePlateNo:='';
                  StandByTimeStr:='';
                End;
              ParamIn := 'NoOrder='+OrderId.Text+'; WehaReservedCode='+RequestAPI.WehaReservedCode+'; WorkOrderNo='+RequestAPI.WorkOrderNo+'; Status='+RequestAPI.Status+
                         '; DriverName='+RequestAPI.DriverName+'; DriverPhone='+RequestAPI.DriverPhone+'; VehiclePlateNo='+RequestAPI.VehiclePlateNo+'; Stand By Time='+RequestAPI.StandByTimeStr;

              Try
                  Main.WriteTableLog('Surat Jalan - ChangeVehicleInfo',ParamIn, 'Mulai');
                  if LowerCase(Main.Db)='wh_prod' then
                    API := GetJadeServiceSoap(True,'',WebService, StrUrl, NameSpace)
                  else
                    API := GetJadeServiceSoap(False,'',WebService, StrUrl, NameSpace);
                  ResponAPI := API.ChangeVehicleInfo(RequestAPI);
                  Main.WriteTableLog('Surat Jalan - ChangeVehicleInfo',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
              Except
                On E:Exception Do begin
                  Main.WriteTableLog('Surat Jalan - ChangeVehicleInfo',ParamIn, 'Message Exception : '+e.Message);
                  if AnsiContainsText(e.message, 'timed out') then
                    isOk := true
                  else begin
                    isOk := False;
                    EnableInput;
                    ShowMessage('Error API'+#13#10+e.Message);
                  end;
                end;
              end;
  /
              if (LowerCase(ResponAPI.Status)='error') then begin
                if IsDataFound Then Begin
                  isOk := False;
                  StrEMessage := StrEMessage + Chr(13)+'Error API : '+ResponAPI.Message;
                end else begin                                  //unable to found reserved code
                  if (lowercase(Copy(ResponAPI.Message, 1, 15))<>'unable to found') then begin
                    isOk := False;
                    StrEMessage := StrEMessage + Chr(13)+'Error API : '+ResponAPI.Message;
                  end;
                end;
              end;

              RequestAPI.Free;

            end;    }

            if IsOk=True then begin
              StrQry:=  'INSERT INTO wh_vhc_trans_log '+
                        '(customer_order_id,reserved_order_detail_id,vhc_trans_id,' +
                        ' cancel_reason,print_to,print_date,print_user) VALUES '+
                        '('+QuotedStr(OrderId.Text)+','+QuotedStr(ReservedOrderDetaiId.Text)+','+
                        ''+QuotedStr(StrTransId)+','+QuotedStr(StrDeskripsiHist)+','+IntToStr(RePrintForm.Copy)+','+
                        ''+QuotedStr(FormatDateTime('yyyy/mm/dd',Now()))+','+
                        ''+QuotedStr(User)+'); ';

              StrQry:=  StrQry+'INSERT INTO wh_vhc_trans_hist '+
                                '(vhc_trans_id,vehicle_id,employee_id,employee_id2,employee_id3,'+
                                'deskripsi,from_time,standby_time,route,pickup_point,field_contact,'+
                                'field_contact_cellular_no,isConnecting,update_user,customer_order_id,from_date,to_date,remark) VALUES '+
                                '('+QuotedStr(StrTransId)+','+QuotedStr(StrVehicleID)+','+
                                ''+QuotedStr(StrDriver)+','+QuotedStr(StrDriver2)+','+QuotedStr(StrBusboyID)+','+
                                ''+QuotedStr(StrDeskripsiHist)+','+StrFromTimes+','+StrStandbyTimes+','+StrRoute+','+
                                ''+StrPickupPoint+','+StrFieldContact+','+StrFieldPhoneNo+','+
                                ''+QuotedStr(StrConnecting)+','+QuotedStr(User)+','+QuotedStr(OrderId.Text)+','+
                                ''+QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)))+','+
                                ''+QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)))+','+
                                ''+StrRemark2+'); ';

              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  Main.TransRollback;
                  IsOk:=False;
                  EnableInput;
                  StrEMsg:=StrEMsg+E.Message;
                  MessageBox(Handle,PChar('Surat Jalan gagal disimpan '+Chr(13)+Chr(13)+StrEMsg),'Surat Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                  Exit;
                end;
              end;
            end;

            if IsOk=True then begin
              Main.TransCommit;
              Main.M_Normal;
              DisableInput;
              NoSPJ.Text:=StrTransId;
              Qry.Close;
              if FormRequest<>'KetidakSesuaianCrew' then
              begin
                if StrStatus='1' then begin
                  if isSent_WA then send_WA;
                  case MessageDlg('Apakah anda melakukan pengiriman WA?', mtConfirmation, [mbYes, mbNo], 0) of
                    mrYes:
                      begin
                      // Write code here for pressing button OK
                        StrQry:='Update wh_vhc_trans SET status_wa=1 where vhc_trans_id='+QuotedStr(StrTransId);
                        Qry.SQL.Clear;
                        Main.WriteLog('SQL :'+StrQry,4);
                        Qry.SQL.Add(StrQry);
                        try
                          Qry.ExecSQL;
                          StatusWA.Checked:=True;
                        except
                          on E:Exception do begin
                            IsOk:=False;
                            StrMsg:='Gagal Menyimpan Daftar Cekal';
                            StrEMessage:=E.Message;
                            StatusWA.Checked:=False;
                          end;
                        end;
                      end;
                    mrNo:
                      begin
                        StrQry:='Update wh_vhc_trans SET status_wa=0 where vhc_trans_id='+QuotedStr(StrTransId);
                        Qry.SQL.Clear;
                        Main.WriteLog('SQL :'+StrQry,4);
                        Qry.SQL.Add(StrQry);
                        try
                          Qry.ExecSQL;
                        except
                          on E:Exception do begin
                            IsOk:=False;
                            StrMsg:='Gagal Menyimpan Daftar Cekal';
                            StrEMessage:=E.Message;
                          end;
                        end;
                      end;
                  end;
                end;
              end;

              if StrStatus='1' then begin
                if MessageBox(0,'SJ Berhasil Disimpan' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SJ Bus',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
//                  if Package.Checked = False then begin
                    RePrint(StrTransId);
//                  end else begin
//                    for IntCount:=0 to Length(NewSPJArr)-1 do begin
//                      RePrint(NewSPJArr[IntCount]);
//                    end;
//                  end;
                end; //else
                  //MessageBox(0,'SJ tidak tercetak','SJ Bus',MB_OK or MB_ICONINFORMATION)


              end else
                MessageBox(0,'SJ Berhasil Dibatalkan','SJ Bus',MB_OK or MB_ICONINFORMATION);
            end else begin
              Main.TransRollback;
              Main.M_Normal;
              EnableInput;
              MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONERROR)
            end
          end else begin
            Main.TransRollback;
            Main.M_Normal;
            EnableInput;
            MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMessage),'SJ Bus',MB_OK or MB_ICONERROR)
          end;
        end;
        FreeAndNil(Qry);
        FreeAndNil(Qry2);
        FreeAndNil(Qry3);
        FreeAndNil(Qry4);
        FreeAndNil(Qry5);
        FreeAndNil(Qry6);
        FreeAndNil(QryWehaOnline);
      end;
      Main.CloseDb;
    end;
  end else  begin
    MessageBox(0,'Silahkan lengkapi kolom','SJ Bus',MB_OK or MB_ICONWARNING);
    EnableInput;
  end;
end;

procedure TSPJFormBus.send_WA();
var
  URL, Pesan_WA, enter_char, StrNoHP,StrQry,StrGroupOrder: string;
  StrCustomer,StrPickUpPoint: Variant;
  Qry : TADOQuery;
  IntCount : Byte;
  StrList:TStringList;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry.CommandTimeout:=3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Choose_WA_Number_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then isChooseWANumber:=True;
      if Qry.FieldValues['value_string']=0 then isChooseWANumber:=False;
    end else isChooseWANumber:=False;
    Qry.Close;

    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Multiple_WA_Number_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then isMultiple_WA_Number:=True;
      if Qry.FieldValues['value_string']=0 then isMultiple_WA_Number:=False;
    end else isMultiple_WA_Number:=False;
    Qry.Close;

    enter_char := '%0A';

    if NoSPJ.Text<>'' then begin
      StrList:=SplitStrings(CellularWA.text, '/');
      StrNoHP:='';
      StrGroupOrder:='';
      if Trim(Group.Text)<>'' then
        StrGroupOrder:= '*'+Group.Text+'*';
        StrGroupOrder:= StringReplace(Group.Text, ' & ', ' And ', [rfReplaceAll]);
        StrGroupOrder:= StringReplace(Group.Text, '&', ' And ', [rfReplaceAll]);
        StrCustomer:= CustomerDisp.Text;
        StrCustomer:= StringReplace(StrCustomer, ' & ', ' And ', [rfReplaceAll]);
        StrCustomer:= StringReplace(StrCustomer, '&', ' And ', [rfReplaceAll]);

        StrPickUpPoint:= PickupPoint.Text;
        StrPickUpPoint:= StringReplace(StrPickUpPoint, ' & ', ' And ', [rfReplaceAll]);
        StrPickUpPoint:= StringReplace(StrPickUpPoint, '&', ' And ', [rfReplaceAll]);
      Pesan_WA :=
                    'Customer = *'+StrCustomer+'*'+enter_char+
//                    'Customer = *'+StrCustomer+'*'+enter_char+
                    'Group = '+StrGroupOrder+enter_char+
                    'Tgl/Jam = *'+FromDate.Text+'* / *'+StandbyTime.Text+'*'+enter_char+
//                    'Standby = *'+Trim(PickupPoint.Text)+'*'+enter_char+
                    'Standby = *'+StrPickUpPoint+'*'+enter_char+
                    'Nama Driver = *'+Trim(DriverDisp.Text)+'*'+enter_char+
                    'HP = *'+Trim(TelpHP.Text)+'*'+enter_char+
                    'No Polisi/Seat = *'+Trim(NoPolisi.Text)+'* / *'+Trim(SeatDisp.Text)+' Seats*';
      if isChooseWANumber then begin
        URL := URL_Webwhatsapp+Pesan_WA;
        URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);
        if isSent_WA then begin
          ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
        end;
      end else begin
        for IntCount:=0 to StrList.Count-1 do begin
          StrNoHP:=StrList.Strings[IntCount];
          StrNoHP:=StringReplace(StrNoHP, '+', '', [rfReplaceAll]);
          if LeftStr(StrNoHP,1)='0' then begin
            StrNoHP:='62'+MidStr(StrNoHP, 2, length(strNoHP));
          end;

          URL := URL_Webwhatsapp+Pesan_WA+'&phone='+StrNoHP;
          URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);

          if isSent_WA then begin
            ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
          end;
          if isMultiple_WA_Number=False then Break;
        end;
      end;
    end else begin
        MessageBox(0,'SJ Belum dibuat' +Chr(13)+Chr(13)+'   Silahkan buat terlebih dahulu SJ-nya  ?','SJ Bus',MB_OK or MB_ICONWARNING);
    end;
  end;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TSPJFormBus.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if CompanyId[1] in ['9','7'] then begin
        ppAddress2.Lines.Clear;
        ppCompany2.Caption:=Qry.FieldValues['company_name'];
        ppAddress2.Lines.Add(Qry.FieldValues['address']);
        ppPhone2.Caption:='Telp.'+Qry.FieldValues['phone_no'];
        ppFax2.Caption:='Fax.'+Qry.FieldValues['fax_no'];
        case Qry.FieldValues['logo'] of
          1:ppLogo2.Picture:=Main.LogoWH.Picture;
          2:ppLogo2.Picture:=Main.LogoWHDC.Picture;
          3:ppLogo2.Picture:=Main.LogoWHET.Picture;
          4:ppLogo2.Picture:=Main.LogoDT.Picture;
          5:ppLogo2.Picture:=Main.LogoEUR.Picture;
          6:ppLogo2.Picture:=Main.LogoGL.Picture;
          7:ppLogo2.Picture:=Main.LogoCNR.Picture;
          8:ppLogo2.Picture:=Main.logoDTN.Picture;
        end;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;

end;

procedure TSPJFormBus.RePrint(No_SPJ:String);
var StrNoBody:String;
    Qry,Qry2:TADOQuery;
    StrQry,StrWEHAmart,StrLokasiStandBy:String;
    Height2: Real;
begin
  if No_SPJ<>'' then begin
    PreparePrint;
    RePrintForm.ReportName:='SJ Operasi Bus';
    RePrintForm.ReportId:=No_SPJ;
    if RePrintForm.ShowModal=1 then begin
      if RePrintForm.Copy>0 then ppCopy.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppCopy.Caption:='Cetakan Asli';
      Main.M_Busy;
      //InitReport;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Qry2:=TADOQuery.Create(Self);
      Qry2.Connection:=Main.MyConnection;
      Qry2.CommandTimeout := 3600;

      ppAlamat.Lines.Clear;
      ppAcara.Lines.Clear;
      ppCatatan.Lines.Clear;
      ppAlamat2.Lines.Clear;
      ppAcara2.Lines.Clear;
      ppAlamat3.Lines.Clear;
      ppAcara3.Lines.Clear;
      ppCatatan3.Lines.Clear;
      if Main.OpenDb then begin
        StrQry:='EXEC GetSJDetail '+QuotedStr(No_SPJ)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if PickupPoint.Text<>'' then StrLokasiStandBy:='Lokasi Standby '+PickupPoint.Text else StrLokasiStandBy:='';
          if SetTambahanTopSJ='' then SetTambahanTopSJ:='0';
          If SPJ_Form=1 then begin
            StrWEHAmart:='';
            StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId.Text)+', @isWEHAmart=1;';
            Qry2.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry2.SQL.Add(StrQry);
            Qry2.Open;

            if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
              if Qry2.RecNo=1 then StrWEHAmart:=Qry2.FieldValues['name']
              else StrWEHAmart:=StrWEHAmart+', '+Qry2.FieldValues['name'];
              Qry2.Next;
            end;
            Qry2.Close;
            If trim(StrWEHAmart)<>'' Then ppExtras.Caption :=StrWEHAmart+'; '+PickupPoint.Text
            else ppExtras.Caption := '';
            ppNoSPJ.Caption:=UpperCase(Qry.FieldValues['vhc_trans_id']);
            ppTanggal.Caption:=Qry.FieldValues['from_dates'];
            if (Qry.FieldValues['from_dates']=Qry.FieldValues['to_dates']) then
              ppTanggalReservasi.Caption:=Qry.FieldValues['from_dates']
            else
              ppTanggalReservasi.Caption:=Qry.FieldValues['from_dates']+' s/d '+Qry.FieldValues['to_dates'];
            ppJamReservasi.Caption:=Qry.FieldValues['standby_time'];
            ppNoOrder.Caption:=UpperCase(Qry.FieldValues['customer_order_id']);
            ppNoBody.Caption:=UpperCase(Qry.FieldValues['body_id']);
            ppKernet2.Caption:=UpperCase(VarToStr(Qry.FieldValues['busboyname_name']));
            ppKernetHP.Caption:=UpperCase(VarToStr(Qry.FieldValues['busboyname_telp']));
            ppNoPolisi.Caption:=LicensePlate(Qry.FieldValues['license_plate']);
            ppSeat.Caption:=IntToStr(Qry.FieldValues['seat']);
            ppNama.Caption:=UpperCase(Qry.FieldValues['name']);
            ppTelpHP.Caption:=Qry.FieldValues['phone_no'];
            if Qry.FieldValues['driver_name2']<> null then
            begin
              ppdriver2.Caption:=UpperCase(Qry.FieldValues['driver_name2']);
              ppHpDriver2.Caption:=UpperCase(Qry.FieldValues['cellular_no_driver2']);
            end else
            begin
              ppdriver2.Caption:='';
              ppHpDriver2.Caption:='';
            end;

            ppTandaPetugas.Caption:=UpperCase(User);
            ppCustomer.Caption:=UpperCase(Qry.FieldValues['customer_name']);
            if Qry.FieldValues['group_name']<>NULL then ppGroupName.Caption:=UpperCase(Qry.FieldValues['group_name']) else ppGroupName.Caption:='';
            if Qry.FieldValues['field_contact']<>NULL then
              ppGuide.Caption:=UpperCase(Qry.FieldValues['field_contact'])
            else begin
              if (Qry.FieldValues['contact_name']<>NULL) then ppGuide.Caption:=Qry.FieldValues['contact_name']
              else ppGuide.Caption:='';
            end;

            //CEK YA
            if (Qry.FieldValues['field_contact_cellular_no']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['field_contact_cellular_no']))<>'') then ppGuidePhone.Caption:=Qry.FieldValues['field_contact_cellular_no']
            else begin
              if (Qry.FieldValues['contact_hp']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['contact_hp']))<>'') then ppGuidePhone.Caption:=Qry.FieldValues['contact_hp']
              else ppGuidePhone.Caption:='';
            end;

            ppAlamat.Lines.Add(UpperCase(Qry.FieldValues['pickup_point']));
            ppAcara.Lines.Add(UpperCase(Qry.FieldValues['route']));
            if Qry.FieldValues['description']<>NULL then ppCatatan.Lines.Add(UpperCase(Qry.FieldValues['description']));
            if SetPrinterSJ='EPSON LX-310' then
            begin
              ppcustomer.Top:= ppcustomer.Top+0.05;
              ppGroupName.Top:= ppGroupName.Top+0.05;
              ppTanggalReservasi.Top:= ppTanggalReservasi.Top+0.05;
              ppAlamat.Top:= ppAlamat.Top+0.10;
              ppSeat.Top:= ppSeat.Top-0.1;
              ppGuide.Top:= ppGuide.Top-0.08;
              ppGuidePhone.Top:= ppGuidePhone.Top-0.08;
              ppAcara.Top:= ppAcara.Top+0.1;
              ppTanggal.Top:= ppTanggal.Top+0.1;
              ppTandaPetugas.Top:= ppTandaPetugas.Top+0.25;
              ppCatatan.Top:= ppCatatan.Top+0.3;
              ppMessage.Top:= ppMessage.Top+0.3;
              ppCatatan.Left:= ppCatatan.Left+0.14;
              ppMessage.Left:= ppMessage.Left+0.14;
            end else begin
              ppNoSPJ.Top:=ppNoSPJ.Top+ StrToFloat(SetTambahanTopSJ);
              ppcustomer.Top:=ppcustomer.Top+ StrToFloat(SetTambahanTopSJ);
              ppGroupName.Top:=ppGroupName.Top+ StrToFloat(SetTambahanTopSJ);
              ppTanggalReservasi.Top:=ppTanggalReservasi.Top+ StrToFloat(SetTambahanTopSJ);
              ppAlamat.Top:=ppAlamat.Top+ StrToFloat(SetTambahanTopSJ);

              ppNoOrder.Top:=ppNoOrder.Top+ StrToFloat(SetTambahanTopSJ);
              ppSeat.Top:=ppSeat.Top+ StrToFloat(SetTambahanTopSJ);
              ppGuide.Top:=ppGuide.Top+ StrToFloat(SetTambahanTopSJ);
              ppGuidePhone.Top:=ppGuidePhone.Top+ StrToFloat(SetTambahanTopSJ);
              ppJamReservasi.Top:=ppJamReservasi.Top+ StrToFloat(SetTambahanTopSJ);
              ppAcara.Top:=ppAcara.Top+ StrToFloat(SetTambahanTopSJ);
              ppNama.Top:=ppNama.Top+ StrToFloat(SetTambahanTopSJ);
              ppTelpHP.Top:=ppTelpHP.Top+ StrToFloat(SetTambahanTopSJ);
              ppdriver2.Top:=ppdriver2.Top+ StrToFloat(SetTambahanTopSJ);
              ppHpDriver2.Top:=ppHpDriver2.Top+ StrToFloat(SetTambahanTopSJ);
              ppKernet.Top:=ppKernet.Top+ StrToFloat(SetTambahanTopSJ);
              ppKernetHP.Top:=ppKernetHP.Top+ StrToFloat(SetTambahanTopSJ);
              ppNoPolisi.Top:=ppNoPolisi.Top+ StrToFloat(SetTambahanTopSJ);
              ppNoBody.Top:=ppNoBody.Top+ StrToFloat(SetTambahanTopSJ);
              ppCatatan.Top:=ppCatatan.Top+ StrToFloat(SetTambahanTopSJ);
              ppTanggal.Top:=ppTanggal.Top+ StrToFloat(SetTambahanTopSJ);
              ppTandaPetugas.Top:=ppTandaPetugas.Top+ StrToFloat(SetTambahanTopSJ);
            end;

            ppReport.Print;
//            ppReport3.Print;
          end;
          If SPJ_Form=2 then begin
          //if CompanyId='9' then begin
            ppNoSPJ2.Caption:=UpperCase(Qry.FieldValues['vhc_trans_id']);
            ppTanggal2.Caption:=Qry.FieldValues['from_dates'];

            if (Qry.FieldValues['from_dates']=Qry.FieldValues['to_dates']) then
              ppTanggalReservasi2.Caption:=Qry.FieldValues['from_dates']
            else
              ppTanggalReservasi2.Caption:=Qry.FieldValues['from_dates']+' s/d '+Qry.FieldValues['to_dates'];
            //ppTanggalReservasi2.Caption:=Qry.FieldValues['from_dates'];

            ppJamReservasi2.Caption:=Qry.FieldValues['standby_time'];
            ppNoOrder2.Caption:=UpperCase(Qry.FieldValues['customer_order_id']);
            ppNoPolisi2.Caption:=LicensePlate(Qry.FieldValues['license_plate']);

            ppSeat2.Caption:=IntToStr(Qry.FieldValues['seat']);
            ppNama2.Caption:=UpperCase(Qry.FieldValues['name']);
            ppTandaPetugas2.Caption:=UpperCase(User);
            ppCustomer2.Caption:=UpperCase(Qry.FieldValues['customer_name']);
            ppKernet.Caption:=UpperCase(VarToStr(Qry.FieldValues['busboyname_name']));
            if Qry.FieldValues['group_name']<>NULL then ppGroupName2.Caption:=UpperCase(Qry.FieldValues['group_name']);
            if Qry.FieldValues['field_contact']<>NULL then ppGuide2.Caption:=UpperCase(Qry.FieldValues['field_contact']);
            if Qry.FieldValues['field_contact_cellular_no']<>NULL then ppGuidePhone2.Caption:=Qry.FieldValues['field_contact_cellular_no'];
            ppAlamat2.Lines.Add(UpperCase(Qry.FieldValues['pickup_point']));
            ppAcara2.Lines.Add(UpperCase(Qry.FieldValues['route']));
            ppReport2.Print;
          end;

          If SPJ_Form=3 then begin

            StrWEHAmart:='';
            StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId.Text)+', @isWEHAmart=1;';
            Qry2.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry2.SQL.Add(StrQry);
            Qry2.Open;

            if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
              if Qry2.RecNo=1 then StrWEHAmart:=Qry2.FieldValues['name']
              else StrWEHAmart:=StrWEHAmart+', '+Qry2.FieldValues['name'];
              Qry2.Next;
            end;
            Qry2.Close;

            ppNoSPJ3.Caption:=UpperCase(Qry.FieldValues['vhc_trans_id']);
            ppTanggal3.Caption:=Qry.FieldValues['from_dates'];
            if (Qry.FieldValues['from_dates']=Qry.FieldValues['to_dates']) then
              ppTanggalReservasi3.Caption:=Qry.FieldValues['from_dates']
            else
              ppTanggalReservasi3.Caption:=Qry.FieldValues['from_dates']+' s/d '+Qry.FieldValues['to_dates'];
            ppJamReservasi3.Caption:=Qry.FieldValues['standby_time'];
            ppNoOrder3.Caption:=UpperCase(Qry.FieldValues['customer_order_id']);
            ppNoBody3.Caption:=UpperCase(Qry.FieldValues['body_id']);
            ppKernet3.Caption:=UpperCase(VarToStr(Qry.FieldValues['busboyname_name']));
            ppKernetHP3.Caption:=UpperCase(VarToStr(Qry.FieldValues['busboyname_telp']));
            ppNoPolisi3.Caption:=LicensePlate(Qry.FieldValues['license_plate']);
            ppSeat3.Caption:=IntToStr(Qry.FieldValues['seat']);
            ppNama3.Caption:=UpperCase(Qry.FieldValues['name']);
            ppTelpHP3.Caption:=Qry.FieldValues['phone_no'];
            if Qry.FieldValues['driver_name2']<> null then
            begin
              ppdriver23.Caption:=UpperCase(Qry.FieldValues['driver_name2']);
              ppHpDriver23.Caption:=UpperCase(Qry.FieldValues['cellular_no_driver2']);
            end else
            begin
              ppdriver23.Caption:='';
              ppHpDriver23.Caption:='';
            end;

            ppTandaPetugas3.Caption:=UpperCase(User);
            ppCustomer3.Caption:=UpperCase(Qry.FieldValues['customer_name']);
            if Qry.FieldValues['group_name']<>NULL then ppGroupName3.Caption:=UpperCase(Qry.FieldValues['group_name']) else ppGroupName3.Caption:='';
            if Qry.FieldValues['field_contact']<>NULL then
              ppGuide3.Caption:=UpperCase(Qry.FieldValues['field_contact'])
            else begin
              if (Qry.FieldValues['contact_name']<>NULL) then ppGuide3.Caption:=Qry.FieldValues['contact_name']
              else ppGuide3.Caption:='';
            end;

            //CEK YA
            if (Qry.FieldValues['field_contact_cellular_no']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['field_contact_cellular_no']))<>'') then ppGuidePhone3.Caption:=Qry.FieldValues['field_contact_cellular_no']
            else begin
              if (Qry.FieldValues['contact_hp']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['contact_hp']))<>'') then ppGuidePhone3.Caption:=Qry.FieldValues['contact_hp']
              else ppGuidePhone3.Caption:='';
            end;
            ppAcara3.Clear;
            ppAlamat3.Clear;
            ppCatatan3.Clear;

            ppAlamat3.Lines.Add(UpperCase(Qry.FieldValues['pickup_point']));
            ppAcara3.Lines.Add(UpperCase(Qry.FieldValues['route']));

            if (Qry.FieldValues['description']<>NULL) then begin
              ppCatatan3.Lines.Add(UpperCase(Qry.FieldValues['description'])+sLineBreak+StrLokasiStandBy);
            end;

            ppNoSPJ3.Top:=0.5417+ StrToFloat(SetTambahanTopSJ);
            ppcustomer3.Top:=1.0625+ StrToFloat(SetTambahanTopSJ);
            ppGroupName3.Top:=1.2396+ StrToFloat(SetTambahanTopSJ);
            ppTanggalReservasi3.Top:=1.4063+ StrToFloat(SetTambahanTopSJ);
            ppAlamat3.Top:=1.5833+ StrToFloat(SetTambahanTopSJ);

            ppNoOrder3.Top:=1.0521+ StrToFloat(SetTambahanTopSJ);
            ppSeat3.Top:=1.2187+ StrToFloat(SetTambahanTopSJ);
            ppGuide3.Top:=1.3854+ StrToFloat(SetTambahanTopSJ);
            ppGuidePhone3.Top:=1.5625+ StrToFloat(SetTambahanTopSJ);
            ppJamReservasi3.Top:=1.1771+ StrToFloat(SetTambahanTopSJ);
            ppAcara3.Top:=2.2604+ StrToFloat(SetTambahanTopSJ);
            ppNama3.Top:=3.7292+ StrToFloat(SetTambahanTopSJ);
            ppTelpHP3.Top:=3.8958+ StrToFloat(SetTambahanTopSJ);
            ppdriver23.Top:=3.7292+ StrToFloat(SetTambahanTopSJ);
            ppHpDriver23.Top:=3.8958+ StrToFloat(SetTambahanTopSJ);
            ppKernet3.Top:=3.7396+ StrToFloat(SetTambahanTopSJ);
            ppKernetHP3.Top:=3.8958+ StrToFloat(SetTambahanTopSJ);
            ppNoPolisi3.Top:=3.7292+ StrToFloat(SetTambahanTopSJ);
            ppNoBody3.Top:=3.8958+ StrToFloat(SetTambahanTopSJ);
            ppCatatan3.Top:=4.0833+ StrToFloat(SetTambahanTopSJ);
            ppTanggal3.Top:=4.7604+ StrToFloat(SetTambahanTopSJ);
            ppTandaPetugas3.Top:=5.2396+ StrToFloat(SetTambahanTopSJ);
//            Height2:=ppNoSPJ.Top;


            //            if SetPrinterSJ='EPSON LX-310' then
//            begin
//              ppcustomer3.Top:= ppcustomer3.Top+0.08;
//              ppGroupName3.Top:= ppGroupName3.Top+0.08;
//              ppTanggalReservasi3.Top:= ppTanggalReservasi3.Top+0.08;
//              ppAlamat3.Top:= ppAlamat3.Top+0.08;
//              ppSeat3.Top:= ppSeat3.Top-0.08;
//              ppGuide3.Top:= ppGuide3.Top-0.08;
//              ppGuidePhone3.Top:= ppGuidePhone3.Top-0.08;
//              ppAcara3.Top:= ppAcara3.Top+0.08;
//              ppTanggal3.Top:= ppTanggal3.Top+0.08;
//              ppTandaPetugas3.Top:= ppTandaPetugas3.Top+0.25;
//              ppCatatan3.Top:= ppCatatan3.Top+0.3;
//              ppCatatan3.Left:= ppCatatan3.Left+0.14;
//            end;

            ppReport3.Print;
          end;

          if RePrintForm.Copy>0 then begin
            StrQry:=  'INSERT INTO wh_vhc_trans_log '+
                      '(customer_order_id,reserved_order_detail_id,vhc_trans_id,' +
                      ' cancel_reason,print_to,print_date,print_user) VALUES '+
                      '('+QuotedStr(OrderId.Text)+','+QuotedStr(ReservedOrderDetaiId.Text)+','+
                      ''+QuotedStr(Qry.FieldValues['vhc_trans_id'])+','+QuotedStr('Cetak Ulang')+','+IntToStr(RePrintForm.Copy)+','+
                      ''+QuotedStr(FormatDateTime('yyyy/mm/dd',Now()))+','+
                      ''+QuotedStr(User)+'); ';

            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                Main.TransRollback;
               // IsOk:=False;
               // EnableInput;
               // StrEMsg:=E.Message;
                MessageBox(Handle,PChar('Surat Jalan gagal dicetak '),'Surat Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
               // Exit;
              end;
            end;
          end;
        end;
        Qry.Close;
      end;
      Qry.Destroy;
      Main.CloseDb;
      Main.M_Normal;
      {
      if CompanyId='2' then ppReport.Print;
      if CompanyId='9' then ppReport2.Print;
      }
    end;
  end;
end;

procedure TSPJFormBus.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TelpHP.SetFocus;
  if Key=#27 then SPJFormBus.Close;
end;

procedure TSPJFormBus.DriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Catatan.SetFocus;
  if Key=#27 then SPJFormBus.Close;
end;

procedure TSPJFormBus.TelpHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BusBoyDisp.SetFocus;
end;


procedure TSPJFormBus.KMOrdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Catatan.SetFocus;
end;

procedure TSPJFormBus.ReprintClick(Sender: TObject);
begin
  if NoSPJ.Text<>'' then
    RePrint(NoSPJ.Text)
  else
    SPJBusList:=TSPJBusList.Create(Self,'SJ-Create');
end;

procedure TSPJFormBus.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Driver.SetFocus;
  if Key=#27 then SPJFormBus.Close;
end;

procedure TSPJFormBus.GridMitraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then SPJFormBus.Close;
end;

procedure TSPJFormBus.FormShow(Sender: TObject);
begin
  SJRange:=60;
  Init;
  InitGridService;
  RefreshHeader;
  if SJId<>'' then begin
    PanelCariOrder.Enabled:=False;
    LoadData1;
//    RefreshGrid;
    if not(IsInput) then DisableInput;
    if IsVehicleOnly then begin
      GroupMitra.Enabled:=True;
      Driver.Enabled:=True;
      NoBody.Enabled:=True;
      Kenek.Enabled:=True;
    end;
    Bersihkan.Enabled:=False;
    CariPengemudi1.Enabled:=True;
    CariPengemudi2.Enabled:=True;
  end else begin
    RefreshCombo;
    PanelCariOrder.Enabled:=True;
    SJDate.Text:=Main.Status.Panels.Items[0].Text;
    CariPengemudi1.Enabled:=False;
    CariPengemudi2.Enabled:=False;
  end;
end;

procedure TSPJFormBus.CariOrderClick(Sender: TObject);
var IntPayment:Integer;
begin
  if FullPayment then IntPayment:=4 else IntPayment:=0;
//  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','SJBus-Create','',IntPayment,'a.from_date',SJRange);

  if Main.IsFormOpen('FSJPenjadwalanList')=False then FSJPenjadwalanList:=TFSJPenjadwalanList.Create(Self,'Bus','SJBus-Create','',IntPayment,'a.from_date',SJRange);
end;

procedure TSPJFormBus.GuideKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then GuideCellular.SetFocus;
end;

procedure TSPJFormBus.GuideCellularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Route.SetFocus;
end;

procedure TSPJFormBus.PickupPointKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Remark.SetFocus;
end;

procedure TSPJFormBus.NoBodyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var IsAuth:Boolean; 
begin
//  if Key=VK_F5 then begin
//    AuthorizedForm.FormId:='13050101';
//    AuthorizedForm.StrMessage:=' Buka Seluruh Armada';
//    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
//    if IsAuth then begin
//      AllVehicle:=True;
//      RefreshVehicle;
//    end;
//  end;
end;

procedure TSPJFormBus.KenekChange(Sender: TObject);
begin
  if (Kenek.Text<>'') then begin
    SetHelper;
  end;
end;

procedure TSPJFormBus.BitBtn1Click(Sender: TObject);
var Qry:TADOQuery;
    StrQry : WideString;
    StrMsg,StrEMessage:String;
begin
  send_WA;
  if NoSPJ.Text<>'' then
  begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.ParamCheck:=False;
    Qry.CommandTimeout:=7200;

    case MessageDlg('Apakah anda melakukan pengiriman WA?', mtConfirmation, [mbYes, mbNo], 0) of
    mrYes:
      begin
      // Write code here for pressing button OK
        StrQry:='Update wh_vhc_trans SET status_wa=1 where vhc_trans_id='+QuotedStr(NoSPJ.Text);
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          StatusWA.Checked:=True;
        except
          on E:Exception do begin
            StrMsg:='Gagal Menyimpan Daftar Cekal';
            StrEMessage:=E.Message;
            StatusWA.Checked:=False;
          end;
        end;
      end;
    mrNo:
      begin
        StrQry:='Update wh_vhc_trans SET status_wa=0 where vhc_trans_id='+QuotedStr(NoSPJ.Text);
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Gagal Menyimpan Daftar Cekal';
            StrEMessage:=E.Message;
          end;
        end;
      end;
    end;
  end;
end;

procedure TSPJFormBus.KmestimasiExit(Sender: TObject);
begin
  if ToString(Kmestimasi.Text)='' then Kmestimasi.Text:='0';
  Kmestimasi.Text:=SToCurr(Kmestimasi.Text);
end;

procedure TSPJFormBus.KmestimasiEnter(Sender: TObject);
begin
  Kmestimasi.Text:=ToString(Kmestimasi.Text);
end;

procedure TSPJFormBus.CariPengemudi1Click(Sender: TObject);
begin
  if (Main.IsFormOpen('EmployeeList')=False) and (OrderId.Text<>'') then
  EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'SJ-Driver1',FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)),FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)));
end;

procedure TSPJFormBus.BtnKendaraanClick(Sender: TObject);
begin
  if (Main.IsFormOpen('VehicleList')=False) and (NoSPJ.Text<>'') then
    VehicleRDList:=TVehicleRDList.Create(Self,'Bus','','','SJ-Change',FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)),FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)),'00:00' );
end;

procedure TSPJFormBus.BtnDriverClick(Sender: TObject);
begin
  if (Main.IsFormOpen('EmployeeRDList')=False) and (NoSPJ.Text<>'') then
  EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'SJ-Update-Driver1',FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)),FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)));
end;

procedure TSPJFormBus.BtnKenekClick(Sender: TObject);
begin
    if (Main.IsFormOpen('EmployeeRDList')=False) and (OrderId.Text<>'') then
    EmployeeRDList:=TEmployeeRDList.Create(Self,'BUS2',1,0,'SJ-Update-Helper',FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)),FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)));
end;

procedure TSPJFormBus.BtnDriver2Click(Sender: TObject);
begin
if (Main.IsFormOpen('EmployeeRDList')=False) and (NoSPJ.Text<>'') then
  EmployeeRDList:=TEmployeeRDList.Create(Self,'Bus',1,0,'SJ-Update-Driver2',FormatDateTime('yyyy/mm/dd',StrToDate(FromDate.Text)),FormatDateTime('yyyy/mm/dd',StrToDate(ToDate.Text)));
end;

procedure TSPJFormBus.PenjadwalanClick(Sender: TObject);
begin
  if (Main.IsFormOpen('BookingForm')=False) and (OrderId.Text<>'') then begin
    BookingForm:=TBookingForm.Create(nil,Trim(ReservedOrderId),True,'MAIN-CHANGE');
    Close;
  end;
end;

procedure TSPJFormBus.ClearDriver2Click(Sender: TObject);
begin
  StrDriver2:='';
  DriverDisp2.Text:='';
  TelpHP2.Text:='';
  StatusPenugasanDriver2.Text:='';
end;

procedure TSPJFormBus.ClearKenekClick(Sender: TObject);
begin
  StrBusboyID:='';
  BusBoyDisp.Text:='';
  StatusPenugasanHelper.Text:='';
end;

end.
