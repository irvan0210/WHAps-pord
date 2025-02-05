unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBXpress, DB, SqlExpr, FMTBcd, ComCtrls, DBTables, ADODB,
  StdCtrls, ExtCtrls, Registry, AppEvnts, jpeg, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, ppParameter, ppBands, ppCtrls,
  ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, pngimage;

const
  //Cursor Type
  MyCursor=1;
  //Application Expired Date
  MaxDate='31/12/2028';
  //Application Caption Name
  //MyApps='';
  MyApps='WHAps [White Horse Group Application] - ';
  //Background Value Set 1 to display backgound
  MyBackG=1;

type
  TClockThread = class(TThread)
  procedure Execute; override;
  public
    constructor Create; reintroduce;
  end;

  TMain = class(TForm)
    MainMenu: TMainMenu;
    Aplikasi1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N2: TMenuItem;
    Keluar1: TMenuItem;
    Status: TStatusBar;
    GantiPassword1: TMenuItem;
    Bantuan1: TMenuItem;
    Pembuat1: TMenuItem;
    N1: TMenuItem;
    ClockTimer: TTimer;
    TimerCheckFirstRun: TTimer;
    TimerUpdate: TTimer;
    TimerMessage: TTimer;
    Pesan1: TMenuItem;
    Update1: TMenuItem;
    N3: TMenuItem;
    AppHotKey: TApplicationEvents;
    Pengaturan1: TMenuItem;
    Pencetakan1: TMenuItem;
    Conn: TADOConnection;
    PindahLokasi1: TMenuItem;
    LogoWH: TImage;
    LogoWHET: TImage;
    LogoDT: TImage;
    LogoWHDC: TImage;
    LogoEUR: TImage;
    LogoGL: TImage;
    LogoCNR: TImage;
    TimerExpired: TTimer;
    IdTCPClient1: TIdTCPClient;
    logoDTN: TImage;
    logoWHG: TImage;
    procedure Keluar1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GantiPassword1Click(Sender: TObject);
    procedure SettingsDblClick(Sender: TObject);
    procedure Pembuat1Click(Sender: TObject);
    procedure ClockTimerTimer(Sender: TObject);
    procedure TimerCheckFirstRunTimer(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure TimerMessageTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Update1Click(Sender: TObject);
    procedure AppHotKeyShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure Pencetakan1Click(Sender: TObject);
    procedure PindahLokasi1Click(Sender: TObject);
    procedure TimerExpiredTimer(Sender: TObject);
    procedure Pesan1Click(Sender: TObject);
  private
    { Private declarations }
    LogFileName,LogAPIFileName:String;
    LogFile,LogAPIFile:TextFile;
    LocalLongDate,LocalShortDate:String;
    ClockThread:TClockThread;
    procedure Init;
    procedure InitParam;
    procedure InitMenuHelp;
    procedure InitShortKey;
    procedure DeInitShortKey;
    procedure LoadSetting;
    procedure SetDBManually;
    procedure CreateDbConnection;
    function GetDate:String;
    function GetTime:String;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public           
    { Public declarations }
    Db,DbHost,DbUser,DbPass,AppVersion,AppVersionSvr,Provider,IsChatAutoStart,DbPort:String;
    ThisMonth,ThisYear:String;
    ChatHost,ChatPort,StrUrlApi:String;
    MyConnection:TADOConnection;
    MyConnectionWehaOnline:TADOConnection;
    Expired,IsDashboard:Boolean;
    procedure InitReg;
    procedure InitDb;
    procedure InitLogin;
    procedure InitLogFile;
    procedure InitLogAPIFile;
    procedure InitBasedForm;
    procedure InitMenu;
    procedure deInitBasedForm;
    procedure deInitLogFile;
    procedure deInitLogAPIFile;
    procedure deInitMenu;
    procedure LogOut;
    procedure MainMenuClick(Sender:TObject);
    procedure StatusDisplay(StatusDisp:String;UserDisp:String);
    procedure StatusDateTime(DateDisp:String;TimeDisp:String);
    function IsFormOpen(const FormName : string): Boolean;
    procedure StatusUpdate(Status1,Status2:String);
    function OpenDb:Boolean;
    procedure CheckMessage;
    procedure CloseDb;
    procedure TransStart;
    procedure TransRollback;
    procedure TransCommit;
    function IsVersionUptodate:Boolean;
    function IsNewVersionAvail:Boolean;
    procedure TanyaUpdate;
    procedure StatusUserGroup(UserGroup:String);
    procedure StatusLocation(LocationName:String);
    procedure M_Busy;
    procedure M_Normal;
    function WhatDate:String;
    procedure CloseApp(Str:String);
    function MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
              Caption: ARRAY OF string; dlgcaption: string): Integer;
    procedure WriteLog(LogEntry:String;LogType:Integer=0);
    procedure WriteTableLog(Methode:String;ParamIn:String;Result:String);
end;

var
  Main: TMain;
  RegPath,FullName,User,LocationId,CompanyId,GroupId,DepartmentId,DepartmentName:String;
  LocationCode,CompanyCode,CompanyShortCode,DepartmentCode,SetPrinterSJ,SetPrinterINV,SetTambahanTopSJ:String;
  Filename,StrConnection,StrConnectionWehaOnline:String;
  app_edt_km_awal: String;
  Interval_CheckInDate,Interval_CheckInTime,SetHeightInv:Integer;
  Regs:TRegistry;
  Logged,IsMessageOpen,HoldLessDeposit,FinanceDetail:Boolean;
  TreeTag,IntCounterMessage,IntTimeCounterMessage,MaxLessDeposit,MaxDiscountPercent,MaxDiscountPrice,UserLevel:Integer;
  PrintAddPoint,LogLevel:Integer;
implementation

{$R *.dfm}{$R resource.RES}

Uses WHUnit, ShellApi, LoginU, ChangePassU, AppsU, SettingU, DateUtils, AddUserU, UserListU, EmployeeFormU,
     EmployeeListU, SPJFormU, VehicleFormU, VehicleListU, ScheduleFormU, ScheduleListU,
     SplashScreenU, DepositFormU, VhcOutRptU, RevenueVhcDayRptU, TxRunningDaysU, SPJServiceFormU,
     SPJTestVehicleFormU, SPJServiceInFormU, TxDrvRunningDaysU,
  RePrintFormU, MenuFormU, MenuListU, BengkelEksternalFormU,
  BengkelEksternalListU, WorkOrderFormU, WorkOrderFormInU, AuthorizedFormU,
  ReceivePaymentForm, MessageFormU, StrUtils, SPJKeluarU, KaneboRptU,
  KSRptU, MessageSendFormU, PaymentFormU, MonthlyCommissionRptU,
  MonthlyArgoRptU, MonthlyAllowanceRptU, AverageIncomeRptU,
  VhcOutMonthlyRptU, NewEmployeeRptU, VendorFormU, UserGroupListU,
  UserGroupFormU, UserGroupMenuFormU, UserGroupMenuListU, SubMenuFormU,
  SubMenuListU, TreeMenuFormU, TreeMenuListU, UserGroupTreeMenuU,
  UserGroupTreeMenuListU, UserGroupSubMenuFormU, UserGroupSubMenuListU,
  ReferensiMitraListU, EmployeeSearchU, VendorListU, KSRptDetailU,
  VhcOutTimeGrossMonthlyRptU, MaintenanceTrackingBodyU, SJDTrU,
  TransactionAddFormU, MitraDebtClaimRptU, SPJFormBusU,
  CheckerOutU, CheckerInU, RevenueVhcDayBusRptU, COAAddU, COAListU,
  BudgetCreateU,
  BudgetViewU, PurchaseOrderU,
  PurchaseRequestU,PurchaseRequestListU, EmployeeHoldU, EmployeeUnHoldU,
  PartGroupListU, PartTypeFormU, PartTypeListU,
  PartDetailFormU, PartDetailListU, PartGroupFormU, PrintSettingU,
  PurchaseOrderListU, LocationChangeU, GoodReceiveingU, GoodReceivingListU,
  GoodTransferU, BudgetCreateYearU, InventoryListU,
  ItemServiceRequestListU, ItemServiceREquestU, GoodAssignmentU,
  MonthlyFuelRptU, OfferingFormU, CustomerListU, OrderFeeU, VhcOutBusRptU,
  LeadU, LeadListU, ProductListU, ProductU, ProductPriceU,
  ProductPriceListU, CustomerU, ContractU, ContractListU, OfferingListU,
  OrderFormU, BusRunningDaysRptU, OrderListU, BusInvoiceU, BusInvoiceListU,
  BookingFormU, BookingListU, BusReceivePaymentFormU, SPJBusListU,
  DailySalesRptU, DailyOfferingRptU, DailySalesRDRptU, YearlySalesRDRptU,
  DailyVehicleRDRptU, MonthlySalesRptU, IntegrateGPSaleTaxiU,
  MonthlySalesRDRptU, IntegrateGPSaleBusU, IntegrateGPInsuranceTaxiU,
  IntegrateGPCommissionTaxiU, IntegrateGPTollTaxiU,
  KonditeMitraRptU, OrderFeeListU, DailyOrderFeeRptU, DailyBusActivityRptU,
  SpecialSettingU, ProductPriceDetailU, ProductPriceDetailListU,
  SJBusServiceFormU, DailyCheckRptU, YearlySalesRecapRptU, NumeratorListU,
  BusRunningDaysminiRptU, WorkOrderListU, DailyInvoiceRptU,
  EmployeeRDListU, VehicleEquipmentU, VehicleEquipmentListU,
  UserLocationListU, UserLocationFormU, VehicleEquipmentFormU,
  VehicleEquipmentCheckU, UserTreeMenuListU, UserTreeMenuU,
  VehicleTypeListU, ServiceRequestFormU, VehicleBlueprintFormU,
  VehicleTypeDetailListU, VehicleTypeDetailFormU, MaintenanceJobFormU,
  MaintenanceJobListU, RevenueVhcDayCancelRptU, ReservationOLListU,
  OrderFeeAddU, MaintenanceGroupFormU, AdditionalFeeOrderFormU,
  ServiceRequestListU, VehicleEquipmentCheckListRptU,
  CustomerComplainFormU, CustomerComplainListU, CustomerRefundFormU,
  CustomerRefundListU, RefundProcessFormU, RefundProcessListU,
  RegistrationOLListU, MaintenanceGroupListU, MaintenanceGroupJobFormU,
  MaintenanceServiceFormU, MaintenanceServiceListU, MaintenanceServiceRptU,
  EmployeeForm2U, WorkOrderRptU, VehicleForm2U, VehicleList2U,
  EmployeeList2U, VehicleAdminU, VehicleAdminListU, ServiceRequestRptU, ChatClientU,
  SettingChatU, ServiceRequestAnalizeFormU, VehicleListRptU, DashboardU,
  CustomerComplainRptU, WorkOrderLiteFormU, WorkOrderLiteReprintU,
  WorkOrderLiteFormInU, WorkOrderLiteListU, DailySalesRecapRptU,
  EmployeeHistoryListRptU, MaintenanceTrackingLastUpdateU,
  CustomerComplainInvestigationFormU, CustomerComplainInvestigationListU,
  BusRunningDaysminiCompactRptU, BlockUnitFormU, BlockUnitFinishU,
  IntegrateGPHPPBusU, RevenueVhcMonthlyRptU, BudgetVehicleFormU,
  BudgetVehicleListU, VehicleTopupRptU, UserRDLocationFormU,
  CheckListIntegrateHppU, BudgetListU, TimeInputFormU, IntegrateGPWehaOnlineU, 
  EtollFormU, eTollNumberListU, UploadTopup_eTollU, TopUpETollFormU, 
  Topup_eTollListU, TxETollRunningDaysU, TxCoDrvRunningDaysU, 
  EmplAttedanceMiniU, SplitBusSJU, OdoKmRevisionU, EditKMSJBusFormU, 
  VehicleInsuranceU, VehicleInsuranceListU, AttandanceLeaveFormU, 
  AttandanceLeaveListU, AuthReservedOrderRptU, SetCetakInv, 
  CustomerComplainRpt2, WorkOrderListRptDay, TransferUangHarianDriverU,
  ReturBarangU, ReturBarangListU,
  DriverComplainList, LaporanPermintaanBarangJasaU, SerahTerimaBarangU,
  ListSerahTerimaBarangU, PartU, ListPartsU, CekPengajuanBarangListU,
  UserExportFormU, UserExportFormListU, CustomerComplainCorrection,
  CustomerComplainCorrectionListU, CustomerComplainCorrectiveActionPlanU,
  CustomerComplainCorrectiveActionPlanListU,
  CetakKetidaksesuaianDanPerbaikanU, KetidakSesuaianDanPerbaikanListU,
  UserMenuU, UserSubMenuU, UserSubMenuListU, UserMenuListU, 
  EmployeeHistoryLakaListU, EmployeeHistoryLakaRptU, 
  EmployeeHistoryTrainingFormU, EmployeeHistoryTrainingListU,
  EmployeeHistoryTrainingRptU, MaintenanceGroupJobListU, 
  RekapHistoryArmadaPergantianPartU, RekapPergantianPartperArmadaU,
  TechnicalRecommendationU, TechnicalRecommendationListU;


constructor TClockThread.Create;
begin
  inherited Create(False);
end;

procedure TClockThread.Execute;
begin
  while not Self.Terminated do begin
      Main.Status.Panels.Items[1].Text:=TimeToStr(StrToTime(Main.Status.Panels.Items[1].Text)+1/86400);
      if IsMessageOpen=False then
        if IntCounterMessage>=(IntTimeCounterMessage*60) then begin
          IntCounterMessage:=0;
          Main.TimerMessage.Enabled:=True;
        end else
          Inc(IntCounterMessage);
      Sleep(999);
  end;
end;

procedure TMain.InitShortKey;
begin
  WriteLog('Init Shortkey');
  RegisterHotKey(Handle,1,MOD_ALT,Ord('S'));
  RegisterHotKey(Handle,2,MOD_ALT,Ord('L'));
  RegisterHotKey(Handle,3,MOD_ALT,VK_ESCAPE);
  RegisterHotKey(Handle,4,MOD_ALT,Ord('M'));
  RegisterHotKey(Handle,5,MOD_ALT,Ord('D'));
  RegisterHotKey(Handle,6,MOD_ALT,Ord('T'));
  RegisterHotKey(Handle,7,0,VK_F1);
  RegisterHotKey(Handle,8,MOD_ALT,Ord('U'));
  RegisterHotKey(Handle,9,MOD_ALT,VK_F2);
  RegisterHotKey(Handle,10,MOD_ALT,Ord('C'));
end;

procedure TMain.DeInitShortKey;
var IntCount:Integer;
begin
  for IntCount:=1 to 10 do
    UnRegisterHotKey(Handle,IntCount);
end;

procedure TMain.WMHotKey(var Msg: TWMHotKey);
begin
  inherited;
  if Logged then begin
    case Msg.HotKey of
      1,9:if IsFormOpen('Setting')=False then Setting:=TSetting.Create(Self);
      2:if Logged then Logout;
      3:MessageBox(Handle,'Log Out Dahulu','WHAps',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      4:if IsFormOpen('MessageForm')=False then MessageForm:=TMessageForm.Create(Self);
      6:SpecialSettings:=TSpecialSettings.Create(Self);
      7:Apps:=TApps.Create(nil);
    end;
  end else begin
    case Msg.HotKey of
      1,9:if IsFormOpen('Setting')=False then Setting:=TSetting.Create(Self);
      2:if IsFormOpen('Login')=False then Login:=TLogin.Create(Self);
      3:Keluar1Click(nil);
      5:SetDBManually;
      6:SpecialSettings:=TSpecialSettings.Create(Self);
      7:Apps:=TApps.Create(nil);
      8:TanyaUpdate;
      10:if IsFormOpen('SettingChat')=False then SettingChat:=TSettingChat.Create(Self);
    end;
  end;
end;

procedure TMain.MainMenuClick(Sender:TObject);
var Qry:TADOQuery;
    StrQry:String;
    IsOk:Boolean;
begin
  TreeTag:=0;
  IsOk:=False;
  with Sender as TMenuItem do begin
//    MessageDlg(IntToStr(Tag),mtInformation,mbOKCancel,1);
    WriteLog('Open Menu :'+IntToStr(Tag));
    TreeTag:=Tag;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if OpenDb then begin
      StrQry:='EXEC AuthMenu '+QuotedStr(User)+','+IntToStr(Tag)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);   
      Qry.Open;
      if Qry.RecordCount>0 then IsOk:=True;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    CloseDb;
    M_Normal;
    if IsOk then begin
      Case Tag of
        {110101..110105 User}
        110101..110106:begin
              if (Tag=110101) then
                AddUser:=TAddUser.Create(Self)
              else
                UserList:=TUserList.Create(Self);
        end;
        110108..110113:begin
          case CaseStr(RightStr(IntToStr(Tag),2),['08','09','13']) of
            0:begin
                UserLocationForm:=TUserLocationForm.Create(Self,'','Main-Create',True);
              end;
            1:begin
                UserLocationList:=TUserLocationList.Create(Self,'Main-Change',True);
              end;
            2:begin
                UserRDLocationForm:=TUserRDLocationForm.Create(Self,'','Main-Create',True);
              end;
            else begin
              UserLocationList:=TUserLocationList.Create(Self);
            end;
          end;
        end;
        {110301..110304 Menu}
        110301..110304:begin
          if Tag=110301 then
            MenuForm:=TMenuForm.Create(Self,'')
          else
            MenuList:=TMenuList.Create(Self);
        end;
        {110401..110404 SubMenu}
        110401..110404:begin
          if Tag=110401 then
            SubMenuForm:=TSubMenuForm.Create(Self,'')
          else
            SubMenuList:=TSubMenuList.Create(Self);
        end;
        {110501..110504 TreeMenu}
        110501..110504:begin
          if Tag=110501 then
            TreeMenuForm:=TTreeMenuForm.Create(Self,'')
          else
            TreeMenuList:=TTreeMenuList.Create(Self);
        end;
        {110701..110704 User Group Menu}
        110701..110704:begin
          if Tag=110701 then
            UserGroupMenuForm:=TUserGroupMenuForm.Create(Self,'')
          else
            UserGroupMenuList:=TUserGroupMenuList.Create(Self);
        end;
        {110801..110804 User Group Sub Menu}
        110801..110804:begin
          if Tag=110801 then
            UserGroupSubMenuForm:=TUserGroupSubMenuForm.Create(Self,'')
          else
            UserGroupSubMenuList:=TUserGroupSubMenuList.Create(Self);
        end;
        {110901..110904 User Group Tree Menu}
        110901..110904:begin
          if Tag=110901 then
            UserGroupTreeMenuForm:=TUserGroupTreeMenuForm.Create(Self,'')
          else
            UserGroupTreeMenuList:=TUserGroupTreeMenuList.Create(Self);
        end;
        {111101..111104 User Group}
        111101..111104:begin
          case Tag of
            111101:if IsFormOpen('UserGroupForm')=False then UserGroupForm:=TUserGroupForm.Create(Self,'01');
            111102:if IsFormOpen('UserGroupList')=False then TUserGroupList.Create(Self,1);
            111103:if IsFormOpen('UserGroupList')=False then TUserGroupList.Create(Self,9);
          else
            UserGroupList:=TUserGroupList.Create(Self);
          end;
        end;
        {111701..111704 User Tree Sub Menu}
        111701..111704:begin
          case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
            0:if IsFormOpen('UserTreeMenuForm')=False then UserTreeMenuForm:=TUserTreeMenuForm.Create(Self);
            1:if IsFormOpen('UserTreeMenuList')=False then TUserGroupList.Create(Self);
            2:if IsFormOpen('UserTreeMenuList')=False then TUserGroupList.Create(Self);
          else
            UserTreeMenuList:=TUserTreeMenuList.Create(Self);
          end;
        end;
        {119901..119905 Pesan}
        119901..119905:begin
          if Tag=119901 then begin
            MessageForm:=TMessageForm.Create(Self);
            IsMessageOpen:=True;
          end;
        end;
        {120101..120105 Armada Taxi}
        {130101..130105 Armada Bus}
        {170101..170105 Armada Greyline}
        120101..120105,130101..130105,170101..170105:begin
          if ((Tag=120101) or (Tag=130101) or (Tag=170101)) then begin
            if (Tag=120101) then begin
              if IsFormOpen('VehicleForm')=False then  VehicleForm:=TVehicleForm.Create(Self,'Taxi','');
            end else if (Tag=130101) then begin
              if IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Bus','');
            end else begin
              if IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'GrayLine','');
            end;
          end else begin
            if IsFormOpen('VehicleList')=False then begin
              if ( (Tag=120102) OR (Tag=120103) OR (Tag=120104) OR (Tag=120105) ) then begin
                if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Taxi');
              end else if ( (Tag=130102) OR (Tag=130103) OR (Tag=130104) OR (Tag=130105) ) then begin
                if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus');
              end else if ( (Tag=170102) OR (Tag=170103) OR (Tag=170104) OR (Tag=170105) ) then begin
                if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'GrayLine');
              end;
            end else begin
              MessageBox(Handle,'Silahkan tutup Jendela yg terbuka','WHAps',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            end;
          end;
        end;
        {120201..120210 Mitra Taxi}
        {130201..130210 Supir Bus}
        120201..120223,130201..130225,170201..170206:begin
          if ((Tag=120201) or (Tag=130201) or (Tag=130213) or (Tag=170201) )then begin
            if Tag=120201 then begin
              if IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Taxi','',False,False);
            end else if (Tag=130201) then begin
              if IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Bus','',False,False);
            end else if Tag=120701 then begin
              if IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'GrayLine','',False,False);
            end else begin
              if IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Bus2','',False,False);
            end;
          end else begin
              {taxi}
              if LeftStr(IntToStr(Tag),4)='1202' then begin
                case CaseStr(RightStr(IntToStr(Tag),2),['02','04','06','09','10','12','13','15','20','21','23']) of
                  0:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi',1,0,'Update-Employee');
                    end;
                  1:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi',9);
                    end;
                  2:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi',2);
                    end;
                  3:begin
                      if IsFormOpen('ReferensiMitraList')=False then ReferensiMitraList:=TReferensiMitraList.Create(Self,'Taxi','','',1);
                    end;
                  4:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi',9,1);
                    end;
                  5:begin
                      if IsFormOpen('EmployeeHold')=False then EmployeeHold:=TEmployeeHold.Create(Self,'Taxi');
                    end;
                  6:begin
                      if IsFormOpen('EmployeeUnHold')=False then EmployeeUnHold:=TEmployeeUnHold.Create(Self,'Taxi');
                    end;
                  7:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi');
                    end;
                  8:begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi');
                    end;
                  9:begin
                      //if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi');
                    end;
                  10:begin
                      if IsFormOpen('RegistrationOLList')=False then RegistrationOLList:=TRegistrationOLList.Create(Self,True);
                    end;
                  else begin
                    if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi');
                  end;
                end;
              {bus}
              end else  if LeftStr(IntToStr(Tag),4)='1302' then  begin
                if StrToInt(RightStr(IntToStr(Tag),2))<13 then begin
                  case CaseStr(RightStr(IntToStr(Tag),2),['02','04','06','09','11','12'{,'10'}]) of
                    0:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',1,0,'Update-Employee');
                      end;
                    1:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',9,0,'Update-Mutation');
                      end;
                    2:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',2);
                      end;
                    3:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus');
                      end;
                    4:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus');
                      end;
                    5:begin
                        if IsFormOpen('EmployeeHistoryLakaRpt')=False then EmployeeHistoryLakaRpt:=TEmployeeHistoryLakaRpt.Create(Self,'LAKA-LIST','','');
                      end;

{                    4:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',2);
                      end;
}                    else begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus');
                    end;
                  end;
                end else begin
                  case CaseStr(RightStr(IntToStr(Tag),2),['14','15','16','19','20','22','23','24','25'{,'21'}]) of
                    0:begin
                        if IsFormOpen('EmployeeList'
                        )=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',1,0,'Update-Employee');
                      end;
                    1:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',2);
                      end;
                    2:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',9,0,'Update-Mutation');
                      end;
                    3:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',1,0,'Update-Image');
                      end;
                    4:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',1,0,'Update-History');
                      end;
                    5:begin
                        if IsFormOpen('EmployeeHistoryTrainingForm')=False then EmployeeHistoryTrainingForm:=TEmployeeHistoryTrainingForm.Create(Self,'','EMPLOYEEHISTORYTRAINING-FORM','DRIVER');
                      end;
                    6:begin
                        if IsFormOpen('EmployeeHistoryTrainingList')=False then EmployeeHistoryTrainingList:=TEmployeeHistoryTrainingList.Create(Self,'TRAINING-LIST','','DRIVER');
                      end;
                    7:begin
                        if IsFormOpen('EmployeeHistoryTrainingForm')=False then EmployeeHistoryTrainingForm:=TEmployeeHistoryTrainingForm.Create(Self,'','EMPLOYEEHISTORYTRAINING-FORM','HELPER');
                      end;
                    8:begin
                        if IsFormOpen('EmployeeHistoryTrainingList')=False then EmployeeHistoryTrainingList:=TEmployeeHistoryTrainingList.Create(Self,'TRAINING-LIST','','HELPER');
                      end;
{                    5:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2');
                      end;
}                    else begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2');
                    end;
                  end;
                end;
              end else if LeftStr(IntToStr(Tag),4)='1702' then begin
                  case CaseStr(RightStr(IntToStr(Tag),2),['04','06','09']) of
                    0:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'GrayLine',9);
                      end;
                    1:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'GrayLine',2);
                      end;
                    2:begin
                        if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'GrayLine');
                      end;
                    else begin
                      if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'GrayLine');
                    end;
                  end;
              end;
          end;
        end;
        1301011..1301231:begin
          if (Tag=1301011) then begin
            if IsFormOpen('VehicleForm2')=False then VehicleForm2:=TVehicleForm2.Create(Self);
          end;
          if (Tag=1301021) then begin
            if IsFormOpen('VehicleList2')=False then VehicleList2:=TVehicleList2.Create(Self,'Main-Change');
          end;
          if (Tag=1301051) then begin
            if IsFormOpen('VehicleList2')=False then VehicleList2:=TVehicleList2.Create(Self);
          end;
          if (Tag=1301081) then begin
            if IsFormOpen('VehicleList2')=False then VehicleList2:=TVehicleList2.Create(Self,'Update-Image');
          end;
        end;
        1302011..1302231:begin
          if Tag=1302011 then begin
              if IsFormOpen('EmployeeForm2')=False then EmployeeForm2:=TEmployeeForm2.Create(Self);
          end;
          if Tag=1302021 then begin
              if IsFormOpen('EmployeeList2')=False then EmployeeList2:=TEmployeeList2.Create(Self,1,0,'Main-Update');
          end;
          if Tag=1302051 then begin
              if IsFormOpen('EmployeeList2')=False then EmployeeList2:=TEmployeeList2.Create(Self,1);
          end;
          if Tag=1302081 then begin
              if IsFormOpen('EmployeeList2')=False then EmployeeList2:=TEmployeeList2.Create(Self,1,0,'Update-Foto');
          end;
        end;
        {120301..120304 Jadwal Taxi}
        {130301..130304 Jadwal Bus}
        {170301..170304 Jadwal Rental}
        120301..120304,130301..130312,170301..170304:begin
          if (RightStr(IntToStr(Tag),2)='01') then begin
            if LeftStr(IntToStr(Tag),4)='1203' then begin
               if IsFormOpen('ScheduleForm')=False then ScheduleForm:=TScheduleForm.Create(Self,'Taxi')
            end else if LeftStr(IntToStr(Tag),4)='1303' then begin
               if IsFormOpen('ScheduleForm')=False then ScheduleForm:=TScheduleForm.Create(Self,'Bus');
            end else begin
               if IsFormOpen('ScheduleForm')=False then ScheduleForm:=TScheduleForm.Create(Self,'GrayLine');
            end;
          end else if (RightStr(IntToStr(Tag),2)='09') then begin
            if IsFormOpen('ScheduleForm')=False then ScheduleForm:=TScheduleForm.Create(Self,'Bus2');
          end else begin
            if IsFormOpen('ScheduleList')=False then begin
              if (Tag=120304) then begin
                if IsFormOpen('ScheduleList')=False then ScheduleList:=TScheduleList.Create(Self,'Taxi')
              end else begin
                if (Tag=130310) then begin
                  if IsFormOpen('ScheduleList')=False then ScheduleList:=TScheduleList.Create(Self,'Bus2', True, False) // Ubah Jadwal Kernet
                end else if (Tag=130312) then begin
                  if IsFormOpen('ScheduleList')=False then ScheduleList:=TScheduleList.Create(Self,'Bus2', True) // Jadwal Kernet
                end else if (Tag=130302) then begin
                  if IsFormOpen('ScheduleList')=False then ScheduleList:=TScheduleList.Create(Self,'Bus', False, False) // Ubah Jadwal Driver
                end else
                  if IsFormOpen('ScheduleList')=False then ScheduleList:=TScheduleList.Create(Self,'Bus') //Jadwal Driver
              end;
            end else begin
              MessageBox(Handle,'Silahkan tutup Jendela yg terbuka','WHAps',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            end;
          end;
        end;
        {120501 Surat Jalan Taxi}
        {120502 SPB Service Open}
        {120503 SPB Service Closing}
        {120504..120505 Data SPJ}
        120501..120505:begin
            Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05']) of
              0:if IsFormOpen('SPJForm')=False then SPJForm:=TSPJForm.Create(Self);
              1:if IsFormOpen('SPJServiceForm')=False then SPJServiceForm:=TSPJServiceForm.Create(Self);
              2:if IsFormOpen('SPJServiceInForm')=False then SPJServiceInForm:=TSPJServiceInForm.Create(Self);
              3..4:if IsFormOpen('SPJKeluar')=False then SPJKeluar:=TSPJKeluar.Create(Self);
            end;
        end;
        {120701..120704 Customer}
        120701..120704:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:begin
                  if IsFormOpen('Customer')=False then Customer:=TCustomer.Create(Self,'','Taxi',True);
              end;
              1:begin
                  if IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'Taxi','Main-Change');
                end;
              else CustomerList:=TCustomerList.Create(Self,'Taxi');
           end;
        end;
        {130107..130110 Perlengkapan}
        130107..130110:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['07','08']) of
              0:begin
                  if IsFormOpen('VehicleEquipmentForm')=False then VehicleEquipmentForm:=TVehicleEquipmentForm.Create(Self,'Main-Add','',True);
              end;
              1:begin
                  if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(nil,'Bus','VehicleEquipment-Change');
              end;
              else begin
                  if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(nil,'Bus','VehicleEquipment-List');
              end;
           end;
        end;
        {130112..130115 Check List Perlengkapan}
        130112..130115:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['12']) of
              0:begin
                  if IsFormOpen('VehicleEquipmentCheck')=False then VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'Main-CheckList-Input','',True);
              end;
              else begin
                  if IsFormOpen('VehicleEquipmentCheck')=False then  VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'','',False)
              end;
           end;
        end;
        {130117..130120 Perlengkapan}
        130117..130120:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['17','18','20']) of
              0:begin
                  if IsFormOpen('VehicleEquipment')=False then VehicleEquipment:=TVehicleEquipment.Create(Self);
              end;
              1:begin
                  if IsFormOpen('VehicleEquipmentList')=False then VehicleEquipmentList:=TVehicleEquipmentList.Create(Self,'Main-Change');
              end;
              else begin
                  if IsFormOpen('VehicleEquipmentList')=False then VehicleEquipmentList:=TVehicleEquipmentList.Create(Self);
              end;
           end;
        end;
        {130122..130127 Perlengkapan}
        130122..130127:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['22', '24','25','27']) of
              0:begin
                  if IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus');
              end;
              1:begin
                  if IsFormOpen('BudgetVehicleForm')=False then BudgetVehicleForm:=TBudgetVehicleForm.Create(Self);
              end;
              2:begin
                  if IsFormOpen('BudgetVehicleList')=False then BudgetVehicleList:=TBudgetVehicleList.Create(Self,'MAIN-CHANGE');
              end;
              3:begin
                  if IsFormOpen('BudgetVehicleList')=False then BudgetVehicleList:=TBudgetVehicleList.Create(Self);
              end;
           end;
        end;

        {130130..130130 Asuransi}
        130130..130132:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['30', '31', '32']) of
              0:begin
                  if IsFormOpen('VehicleInsurance')=False then VehicleInsurance:=TVehicleInsurance.Create(Self,'Bus', '', '', False);
              end;
              1:begin
                  if IsFormOpen('VehicleInsuranceList')=False then VehicleInsuranceList:=TVehicleInsuranceList.Create(Self, 'Bus', 'MAIN-CHANGE');
              end;
              2:begin
                  if IsFormOpen('VehicleInsuranceList')=False then VehicleInsuranceList:=TVehicleInsuranceList.Create(Self);
              end;
           end;
        end;



        132101..132108:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','05','06','07','08']) of
              0:begin
                  if IsFormOpen('EtollForm')=False then EtollForm:=TEtollForm.Create(Self,'',False);
              end;
              1:begin
                  if IsFormOpen('eTollNumberList')=False then eTollNumberList:=TeTollNumberList.Create(Self,'MAIN-CHANGE');
              end;
              2:begin
                  if IsFormOpen('eTollNumberList')=False then eTollNumberList:=TeTollNumberList.Create(Self,'');
              end;
              3:begin
                  if IsFormOpen('TopUpETollForm')=False then TopUpETollForm:=TTopUpETollForm.Create(Self,'',false);
              end;
              4:begin
                  if IsFormOpen('Topup_eTollList')=False then Topup_eTollList:=TTopup_eTollList.Create(Self,'MAIN-CHANGE' );
              end;
              5:begin
                  if IsFormOpen('Topup_eTollList')=False then Topup_eTollList:=TTopup_eTollList.Create(Self,'' );
              end;
              else
                  if IsFormOpen('eTollNumberList')=False then eTollNumberList:=TeTollNumberList.Create(Self,'');
           end;
        end;

        {130123..130130 Blueprint & Grid Armada}
{        130123..130130:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['23','24','27','28','29','30','26']) of
              0:begin
                  //if IsFormOpen('VehicleEquipment')=False then VehicleEquipment:=TVehicleEquipment.Create(Self);
              end;
              1:begin
                  //if IsFormOpen('VehicleEquipmentList')=False then VehicleEquipmentList:=TVehicleEquipmentList.Create(Self,'Main-Change');
              end;
              2:begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'BUS','Update-BluePrint');;
              end;
              3:begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'BUS','View-BluePrint');;
              end;
              4:begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'BUS','Update-Grid');
              end;
              5:begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'BUS','View-Grid');
              end;
              else begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'BUS');
              end;
           end;
        end;
}
        {130501..130505 Surat Jalan Bus}
        130501..130505:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05']) of
              0:begin
                  if IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,'',True,'',False);
              end;
              1:begin
                  //if IsFormOpen('SPJBusList')=False then
                  SPJBusList:=TSPJBusList.Create(nil,'Main-Change');
                end;
              4:begin
                  if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'Main-ChangeVehicle');
                end;
              else begin
                  //(AOwner:TComponent; Form_Request:String=''; Is_All:Integer=0; Is_Foward:Boolean=True; In_Out:Integer=0);
                  if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'',0,True, 1);
              end;
           end;
        end;
        {130507..130511 Surat Jalan Service Bus}
        130507..130511:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['07','08','10']) of
              0:begin
                  if IsFormOpen('SJBusServiceForm')=False then SJBusServiceForm:=TSJBusServiceForm.Create(Self);
              end;
              1:begin
//                if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'Bus','Main-Change');
                end;
              else begin
//                if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'Bus');
              end;
           end;
        end;
        {130512..130512 Split KM Surat Jalan Bus}
        130512..130513:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['12','13']) of
              0:begin
                  if IsFormOpen('SplitBusSJ')=False then SplitBusSJ:=TSplitBusSJ.Create(Self);
              end;
              1:begin
                  if IsFormOpen('OdoKmRevision')=False then OdoKmRevision:=TOdoKmRevision.Create(Self, 2);
              end;
              else begin
//                if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'Bus');
              end;
           end;
        end;
        {130701..130704 Lead Bus}
        130701..130704:begin
                         case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
                         0:if IsFormOpen('Lead')=False then Lead :=TLead.Create(Self);
                         1:if IsFormOpen('LeadList')=False then LeadList:=TLeadList.Create(Self,'BUS','Main-Change');
                         else
                           if IsFormOpen('LeadList')=False then LeadList:=TLeadList.Create(Self,'BUS');
                         end;
        end;
        {130706..130709 Lead Order Bus}
        130706..130720:begin
                         Case CaseStr(RightStr(IntToStr(Tag),2),['06','07','10','12','15','17','18','20']) of
                           0:begin
                               if IsFormOpen('OfferingForm')=False then OfferingForm:=TOfferingForm.Create(Self);
                             end;
                           1:begin
                               if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'Bus','Main-Change');
                             end;
                           2:begin
                               if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'Bus','','',9);
                             end;
                           3:begin
                               if IsFormOpen('ReservationOLList')=False then ReservationOLList:=TReservationOLList.Create(Self,True);
                             end;
                           4:begin
                               if IsFormOpen('ReservationOLList')=False then ReservationOLList:=TReservationOLList.Create(Self,False);
                             end;
                           5:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','WaitingList-Allocate','',20);
                             end;
                           6:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','WaitingList-Change','',21);
                             end;
                           7:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','WaitingList','',20);
                             end;
                           else begin
                             if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'Bus');
                           end;
                         end
        end;
        {130801..130804 Customer Bus}
        130801..130804:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
                          0:begin
                              if IsFormOpen('Customer')=False then Customer:=TCustomer.Create(Self,'','BUS')
                            end;
                          1:begin
                              if IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'BUS','Main-Change');
                            end;
                          else begin
                            if IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'Bus');
                          end;
                       end;
                    end;
        {130806..130819 Customer Order Bus}
        130806..130821:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['06','07','10','11','12','18','19','21']) of
                           0:begin
                              //if IsFormOpen('OrderForm')=False then
                                OrderForm:=TOrderForm.Create(nil);
                             end;
                           1:begin
                              if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Main-Change','',7);
                             end;
                           2:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','','',9);
                             end;
                           3:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Invoice-Auth','',6);
                             end;
                           4:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Price-Revised','',2);
                             end;
                           5:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','','',8);
                             end;
                           6:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Reactivated-Revised','',8);
                             end;
                           7:begin
                                if IsFormOpen('AdditionalFeeOrderForm')=False then AdditionalFeeOrderForm:=TAdditionalFeeOrderForm.Create(Self);
                             end;
                           else begin
                              if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus');
                           end;
                         end;
                       end;
        {130823..130832 Customer Complain}
        130823..130848:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['23', '24', '26','28', '29', '31', '33', '34', '36', '38', '39', '40', '41','43','44','45','47','48']) of
                           0:begin
                                if IsFormOpen('CustomerComplainForm')=False then CustomerComplainForm:=TCustomerComplainForm.Create(Self, '','', 1);
                             end;
                           1:begin
                                {Daftar Komplain Pelanggan}
                                 if IsFormOpen('CustomerComplainList')=False then CustomerComplainList:=TCustomerComplainList.Create(Self, 'MAIN-CHANGE');
                             end;
                           2:begin
                                {Daftar Komplain Pelanggan}
                                if IsFormOpen('CustomerComplainList')=False then CustomerComplainList:=TCustomerComplainList.Create(Self, '');
                             end;
                           3:begin
                                {Tambah Refund}
                                if IsFormOpen('CustomerRefundForm')=False then CustomerRefundForm:=TCustomerRefundForm.Create(Self, 'Customer Refund', '','', 1);
                             end;
                           4:begin
                                {Ubah Refund Pelanggan}
                                if IsFormOpen('CustomerRefundList')=False then CustomerRefundList:=TCustomerRefundList.Create(Self, 'MAIN-CHANGE');
                             end;
                           5:begin
                                {Daftar REfund Pelanggan}
                                if IsFormOpen('CustomerRefundList')=False then CustomerRefundList:=TCustomerRefundList.Create(Self, '');
                             end;
                           6:begin
                                {Tambah Investigasi}
                                if IsFormOpen('CustomerComplainInvestigationForm')=False then CustomerComplainInvestigationForm:=TCustomerComplainInvestigationForm.Create(Self,'','',1,'',0,'Investigasi');
                             end;
                           7:begin
                                {Ubah Investigasi}
                                if IsFormOpen('CustomerComplainInvestigationList')=False then CustomerComplainInvestigationList:=TCustomerComplainInvestigationList.Create(Self,'MAIN-CHANGE','',2);
                             end;
                           8:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplainInvestigationList')=False then CustomerComplainInvestigationList:=TCustomerComplainInvestigationList.Create(Self,'','',2);
                             end;
                           9:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplainInvestigationList')=False then CustomerComplainInvestigationList:=TCustomerComplainInvestigationList.Create(Self,'INVESTIGATION-CLOSED','',2, 1);
                             end;
                          10:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplainCorrectionForm')=False then CustomerComplainCorrectionForm:=TCustomerComplainCorrectionForm.Create(Self,'','Create');
                             end;
                          11:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplainCorrectionList')=False then CustomerComplainCorrectionList:=TCustomerComplainCorrectionList.Create(Self,'MAIN-VIEW','',3);
                             end;
                          12:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplainCorrectionList')=False then CustomerComplainCorrectionList:=TCustomerComplainCorrectionList.Create(Self,'MAIN-UPDATE','',3);
                             end;
                          13:begin
                                {Lihat Data Investigasi}
                                if IsFormOpen('CustomerComplaiCorrectiveActionPlan')=False then CustComplainCorrectiveActionPlan:=TCustComplainCorrectiveActionPlan.Create(Self,'','Create');
                             end;
                           14:begin
                              {Lihat Data Investigasi}
                              if IsFormOpen('CustomerComplainCorrectiveActionPlanList')=False then CustomerComplainCorrectiveActionPlanList:=TCustomerComplainCorrectiveActionPlanList.Create(Self,'MAIN-VIEW','',5);
                           end;
                           15:begin
                              {Lihat Data Investigasi}
                              if IsFormOpen('CustomerComplainCorrectiveActionPlanList')=False then CustomerComplainCorrectiveActionPlanList:=TCustomerComplainCorrectiveActionPlanList.Create(Self,'MAIN-UPDATE','',5);
                           end;
                           16:begin
                              {Lihat Data Investigasi}
                              if IsFormOpen('CetakKetidaksesuaianDanPerbaikan')=False then CetakKetidaksesuaianDanPerbaikan:=TCetakKetidaksesuaianDanPerbaikan.Create(Self,'CREATE','');
                           end;
                           17:begin
                              {Lihat Data Investigasi}
                              if IsFormOpen('KetidakSesuaianDanPerbaikanList')=False then KetidakSesuaianDanPerbaikanList:=TKetidakSesuaianDanPerbaikanList.Create(Self,'MAIN-CETAKULANG','',6);
                           end;
                        end;
                       end;
        {130811..130814 Customer Contract}
        130901..130904:begin
                         if Tag=130901 then begin
                           if IsFormOpen('Contract')=False then Contract:=TContract.Create(Self);
                         end else if Tag=130902 then begin
                           if IsFormOpen('ContractList')=False then ContractList:=TContractList.Create(Self,'BUS','Main-Change');
                         end else begin
                           if IsFormOpen('ContractList')=False then ContractList:=TContractList.Create(Self,'BUS');
                         end;
        end;
        {131101..131109 Booking}
        131101..131111:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','05','06','07','08','09','11']) of
              0:begin
                if IsFormOpen('BookingForm')=False then BookingForm :=TBookingForm.Create(Self);
              end;
              1:begin
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','Main-Change');
              end;
              2:begin
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','','',9);
              end;
              3:begin
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','Main-ForceAdd','',6);
              end;
              4:begin
                if IsFormOpen('BusRunningDaysRpt')=False then BusRunningDaysRpt:=TBusRunningDaysRpt.Create(Self,'Main-Change',True);
              end;
              5:begin
                if IsFormOpen('BusRunningDaysMiniRpt')=False then BusRunningDaysMiniRpt:=TBusRunningDaysminiRpt.Create(Self,'Main-Change',True);
              end;
              6:begin
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','Main-BookingLock');
              end;
              7:begin
                //Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus','Main-BookingAuth','',8);
              end;
              else begin
                if IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(Self,'Bus');
              end;
           end;
        end;
        {131201..131202 Uang Order Bus}
        131201..131207:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04','05','07','09']) of
              0:begin
                  if IsFormOpen('OrderFee')=False then OrderFee:=TOrderFee.Create(Self);
              end;
              1:begin
                  if IsFormOpen('OrderFeeList')=False then OrderFeeList:=TOrderFeeList.Create(Self,'Main-Change');
              end;
              3:begin
                  if IsFormOpen('OrderFeeAdd')=False then OrderFeeAdd:=TOrderFeeAdd.Create(Self);
              end;
              4:begin
               //if IsFormOpen('OrderForm')=False then
                 OrderForm:=TOrderForm.Create(nil);
              end;
              5:begin
               //if IsFormOpen('OrderForm')=False then
                 DailyCheckRpt:=TDailyCheckRpt.Create(Self,'Bus','','',7);
              end;
              else begin
                  if IsFormOpen('OrderFeeList')=False then OrderFeeList:=TOrderFeeList.Create(Self, '',0,True);
              end;
           end;
        end;
        {131301..131302 Checker Bus}
        131301..131302:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:begin
                  if IsFormOpen('CheckerOut')=False then CheckerOut:=TCheckerOut.Create(Self);
              end;
              1:begin
                  if IsFormOpen('CheckerIn')=False then CheckerIn:=TCheckerIn.Create(Self);
              end;
           end;
        end;
        {131501..131504 Product}
        131501..131504:begin
                         if Tag=131501 then begin
                           if IsFormOpen('Product')=False then Product:=TProduct.Create(Self);
                         end else begin
                           if IsFormOpen('ProductList')=False then ProductList:=TProductList.Create(Self,'BUS');
                         end;
        end;
        {131506..131509 Product Price}
        131506..131509:begin
                         if Tag=131506 then begin
                          if IsFormOpen('ProductPrice')=False then ProductPrice:=TProductPrice.Create(Self);
                         end else begin
                         if IsFormOpen('ProductPriceList')=False then ProductPriceList:=TProductPriceList.Create(Self,'BUS');
                         end;
        end;
        {131511..131514 Product Price Detail}
        131511..131514:begin
                         if Tag=131511 then begin
                          if IsFormOpen('ProductPriceDetail')=False then ProductPriceDetail:=TProductPriceDetail.Create(Self);
                         end else begin
                         if IsFormOpen('ProductPriceDetailList')=False then ProductPriceDetailList:=TProductPriceDetailList.Create(Self,'BUS');
                         end;
        end;
        {131701..131704 Invoice}
        131701..131706:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','05','06']) of
                          0:begin
                              if IsFormOpen('BusInvoice')=False then BusInvoice:=TBusInvoice.Create(Self);
                            end;
                          1:begin
                              if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Main-Change');
                            end;
                          2:begin
                              if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','','',9);
                            end;
                          3:begin
                              if IsFormOpen('NumeratorList')=False then NumeratorList:=TNumeratorList.Create(Self,'Bus','',9);
                            end;
                          else begin
                              if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','','',2);
                          end;
                        end;
                      end;
        131901..131903:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03']) of
                          0:begin
                              if IsFormOpen('CheckListIntegrateHpp')=False then CheckListIntegrateHpp:=TCheckListIntegrateHpp.Create(Self, True, -1);
                            end;
                          1:begin
                              if IsFormOpen('CheckListIntegrateHpp')=False then CheckListIntegrateHpp:=TCheckListIntegrateHpp.Create(Self, False, 1, 'Daftar Sudah Ceklis Integrate');
                            end;
                          2:begin
                              if IsFormOpen('CheckListIntegrateHpp')=False then CheckListIntegrateHpp:=TCheckListIntegrateHpp.Create(Self, False, 0, 'Daftar Belum Ceklis Integrate');
                            end;
                          else begin
                              if IsFormOpen('CheckListIntegrateHpp')=False then CheckListIntegrateHpp:=TCheckListIntegrateHpp.Create(Self);
                          end;
                        end;
                      end;
        {140101..140104 Keuangan Taxi}
        140101..140104:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
              0:begin
                  {140101 Kasir, SPJ Operasional Closing}
                  if IsFormOpen('DepositForm')=False then DepositForm:=TDepositForm.Create(Self);
                end;
              1:begin
                 {140102 Kasir Pembayaran}
                 if IsFormOpen('PaymentReceiveForm')=False then PaymentReceiveForm:=TPaymentReceiveForm.Create(Self,'Taxi');
                end;
              2:begin
                 {140102 Kasir Pemngeluaran Kas}
                  if IsFormOpen('PaymentForm')=False then PaymentForm:=TPaymentForm.Create(Self,'Taxi');
                end;
              3:begin
                  {140104 Penambahan Biaya}
                  if IsFormOpen('TransactionAddForm')=False then TransactionAddForm:=TTransactionAddForm.Create(Self,'Taxi','');
                end;
            end;
        end;
        {140301..140304 Keuangan Bus}
        140301..140310:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04','05','07','08','09','10','12']) of
              0:begin
                  if IsFormOpen('BusReceivePaymentForm')=False then BusPaymentReceiveForm:=TBusPaymentReceiveForm.Create(Self);
                end;
              1:begin
                  if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Main-Change-Payment','',2,2);
                end;
              3:begin
                  if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Main-Change-Payment','',9,2);
                end;
              4:begin
                  if IsFormOpen('RefundProcessForm')=False then RefundProcessForm:=TRefundProcessForm.Create(Self, 'Pembayaran Refund Customer', '','', 1, False); {Finance} {MAIN NEW}
                end;
              5:begin
                  if IsFormOpen('RefundProcessList')=False then RefundProcessList:=TRefundProcessList.Create(Self, 'Pembayaran Refund Customer', 'MAIN-CANCEL'); {Finance}
                end;
              6:begin
                  if IsFormOpen('RefundProcessList')=False then RefundProcessList:=TRefundProcessList.Create(Self, 'Pembayaran Refund Customer', ''); {Finance}
                end;
              7:begin
                  if IsFormOpen('RefundProcessList')=False then RefundProcessList:=TRefundProcessList.Create(Self, 'Pembayaran Refund Customer', '', 1); {Finance}
                end;

              8:begin
                  if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Verify-Payment','', 2,2);
                end;

              else begin
                  if IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Main-Payment','',2,2);
              end;
            end;
        end;
        {141101..141104 C.O.A}
        141101..141104:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03']) of
              0:begin
                  if IsFormOpen('COAAdd')=False then COAAdd:=TCOAAdd.Create(Self,'');
                end;
              1:begin
                 if IsFormOpen('COAList')=False then COAList:=TCOAList.Create(Self);
                end;
              2:begin
                 if IsFormOpen('COAList')=False then COAList:=TCOAList.Create(Self);
                end;
              else begin
                 if IsFormOpen('COAList')=False then COAList:=TCOAList.Create(Self);
                end;
            end;
        end;
        {141201..141205 Budget}
        141201..141210:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','07','08']) of
              0:begin
                  if IsFormOpen('BudgetAdd')=False then BudgetCreate:=TBudgetCreate.Create(Self, False);
              end;
              1:begin
                if IsFormOpen('BudgetCreate')=False then BudgetCreate:=TBudgetCreate.Create(Self, False);
              end;
              4:begin
                  if IsFormOpen('BudgetAdd')=False then BudgetCreate:=TBudgetCreate.Create(Self, False);
              end;
              5:begin
                  if IsFormOpen('BudgetCreateYear')=False then BudgetCreateYear:=TBudgetCreateYear.Create(Self, False);
              end;
              6:begin
                  if IsFormOpen('BudgetCreateYear')=False then BudgetCreateYear:=TBudgetCreateYear.Create(Self);
              end;
              else begin
                  if IsFormOpen('BudgetCreate')=False then BudgetCreate:=TBudgetCreate.Create(Self);
//               if IsFormOpen('BudgetView')=False then BudgetView:=TBudgetView.Create(Self);
                end;
            end;
        end;
        {141301..141304 Bank}
        141401..141404:begin
                         if Tag=141401 then begin
//                         if IsFormOpen('Bank')=False then Bank:=TBank.Create(Self,'','','T');
                         end else begin
//                         if IsFormOpen('BankList')=False then BankList:=TBankList.Create(Self);
                         end;
        end;
        {150101..150104 Bengkel Eksternal}
        150101..150104:begin
         if Tag=150101 then begin
          if IsFormOpen('BengkelEksternalForm')=False then BengkelEksternalForm:=TBengkelEksternalForm.Create(Self,'','T');
          end else begin
            if IsFormOpen('BengkelEksternalList')=False then BengkelEksternalList:=TBengkelEksternalList.Create(Self);
          end;
        end;
        {Perintah Kerja Bengkel}
        150301..150309:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','06','07','08','09']) of
            0:begin
                if IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(Self);
              end;
            1:begin
                if IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(Self,'Main-AddDetail');
              end;
            2:begin
                if IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(Self);
              end;
            3:begin
                if IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(Self);
              end;
            {PKB Ringan}
            4:begin
                if IsFormOpen('WorkOrderLiteForm')=False then WorkOrderLiteForm:=TWorkOrderLiteForm.Create(Self);
              end;
            5:begin
                if IsFormOpen('WorkOrderLiteList')=False then WorkOrderLiteList:=TWorkOrderLiteList.Create(Self,'Main-AddDetail');
              end;
            6:begin
                if IsFormOpen('WorkOrderLiteFormIn')=False then WorkOrderLiteFormIn:=TWorkOrderLiteFormIn.Create(Self);
              end;
            7:begin
                if IsFormOpen('WorkOrderLiteList')=False then WorkOrderLiteList:=TWorkOrderLiteList.Create(Self);
              end;
            else begin
                if IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(Self);
            end
          end;
        end;
        {150501..150503 Tracking Maintenance}
        150501..150504:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
          0:begin
              if IsFormOpen('MaintenanceTrackingBody')=False then MaintenanceTrackingBody:=TMaintenanceTrackingBody.Create(Self);
            end;
          3:begin
              if IsFormOpen('MaintenanceTrackingLastUpdate')=False then MaintenanceTrackingLastUpdate:=TMaintenanceTrackingLastUpdate.Create(Self);
            end;
          end;
        end;
        {150701..150704 Servis Berkala}
        150701..150704:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
            0:begin
                if IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self);
              end;
            1:begin
//                if IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(Self);
              end;
            else begin
                if IsFormOpen('MaintenanceServiceList')=False then MaintenanceServiceList:=TMaintenanceServiceList.Create(Self);
            end
          end;
        end;
        {150901..150905 Service Request}
        150901..150905:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','05']) of
            0:begin
                if IsFormOpen('ServiceRequestForm')=False then ServiceRequestForm:=TServiceRequestForm.Create(Self);
              end;
            1:begin
                if IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self,'Main-Update','',2);
              end;
            2:begin
             //   if IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self,'Main-Update','',2);
              end;
            3:begin
                if IsFormOpen('ServiceRequestAnalizeForm')=False then ServiceRequestAnalizeForm:=TServiceRequestAnalizeForm.Create(Self);
              end;                  
            else begin
                if IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self);
            end
          end;
        end;
        {151001..151004 Analisa Service Request}
        151001..151004:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04']) of
            0:begin
                if IsFormOpen('ServiceRequestAnalizeForm')=False then ServiceRequestAnalizeForm:=TServiceRequestAnalizeForm.Create(Self);
              end;
            1:begin
                //if IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self,'Main-Update','',2);
              end;
            else begin
               if IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self,'ServiceRequest-AnalizeList');
            end
          end;
        end;
        {Blok Unit}
        151101..151104:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
            0:begin
                if IsFormOpen('BlockUnitForm')=False then BlockUnitForm:=TBlockUnitForm.Create(Self);
              end;
            1:begin
                if IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(Self,'','',1,2); {2=edit; 1=readonly}
              end;
            2:begin
                if IsFormOpen('BlockUnitFinish')=False then BlockUnitFinish:=TBlockUnitFinish.Create(Self);
              end;
            else begin
                if IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(Self,'','',1,1);
            end
          end;
        end;
        {160101..160104 Inventory Vendor}
        160101..160104:begin
          if Tag=160101 then begin
            if IsFormOpen('VendorForm')=False then VendorForm:=TVendorForm.Create(Self);
          end else begin
            if IsFormOpen('VendorList')=False then VendorList:=TVendorList.Create(Self);
          end;
        end;
        {160301..160304 Inventory - Part Type}
        160301..160304:begin
          if Tag=160301 then begin
            if IsFormOpen('PartTypeForm')=False then PartTypeForm:=TPartTypeForm.Create(Self);
          end else begin
            if IsFormOpen('PartTypeList')=False then PartTypeList:=TPartTypeList.Create(Self);
          end;
        end;
        {160401..160404 Inventory - Part Description}
        160401..160404:begin
          if Tag=160401 then begin
            if IsFormOpen('PartDescriptionForm')=False then PartGroupForm:=TPartGroupForm.Create(Self);
          end else begin
            if IsFormOpen('PartDescriptionList')=False then PartGroupList:=TPartGroupList.Create(Self);
          end;
        end;
        {160401..160404 Inventory - Part Number}
        160501..160504:begin
          if Tag=160501 then begin
            if IsFormOpen('PartNumberForm')=False then PartDetailForm:=TPartDetailForm.Create(Self);
          end else begin
            if IsFormOpen('PartNumberList')=False then PartDetailList:=TPartDetailList.Create(Self);
          end;
        end;
        {160771..160704 Inventory - Purchasing Request}
        160701..160704:begin
          if Tag=160701 then begin
            if IsFormOpen('PurchaseRequest')=False then PurchaseRequest:=TPurchaseRequest.Create(Self);
          end else begin
            if IsFormOpen('PurchaseRequestList')=False then PurchaseRequestList:=TPurchaseRequestList.Create(Self);
          end;
        end;
        {160801..160804 Inventory - Purchasing Order}
        160801..160804:begin
          if Tag=160801 then begin
            if IsFormOpen('PurchaseOrder')=False then PurchaseOrder:=TPurchaseOrder.Create(Self);
          end else begin
            if IsFormOpen('PurchaseOrderList')=False then PurchaseOrderList:=TPurchaseOrderList.Create(Self);
          end;
        end;
        {161001..161008 Inventory - Good Receiving}
        161001..161008:begin
          if Tag=161001 then begin
            if IsFormOpen('GoodReceiving')=False then GoodReceiving:=TGoodReceiving.Create(Self);
          end else if Tag=161005 then begin
            if IsFormOpen('GoodTransfer')=False then GoodTransfer:=TGoodTransfer.Create(Self);
          end else if Tag=161008 then begin
            if IsFormOpen('InventoryList')=False then InventoryList:=TInventoryList.Create(Self);
          end else if Tag=161006 then begin
            if IsFormOpen('GoodAssignment')=False then GoodAssignment:=TGoodAssignment.Create(Self);
          end else begin
            if IsFormOpen('GoodReceivingList')=False then GoodReceivingList:=TGoodReceivingList.Create(Self);
          end;
        end;
        {161201..161207 Item/Service Request}
        161201..161207:begin
          if Tag=161201 then begin
            if IsFormOpen('ItemServiceRequest')=False then ItemServiceRequest:=TItemServiceRequest.Create(Self);
          end else begin
            if IsFormOpen('ItemServiceRequestList')=False then ItemServiceRequestList:=TItemServiceRequestList.Create(Self);
          end;
        end;
        {161411..161414 Armada}
        161411..161414:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['11','12','13']) of
              0:begin
                  if IsFormOpen('VehicleTypeDetailForm')=False then VehicleTypeDetailForm:=TVehicleTypeDetailForm.Create(Self);
              end;
              1:begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self,'Update-Detail');
              end;
              else begin
                  if IsFormOpen('VehicleTypeList')=False then VehicleTypeList:=TVehicleTypeList.Create(Self);
              end;
           end;
        end;
        {161416..161420 Armada 2}
        161416..161425:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['16','17','21','22','23','24','19']) of
              0:begin
                  if IsFormOpen('VehicleBlueprintForm')=False then VehicleBlueprintForm:=TVehicleBlueprintForm.Create(Self);
              end;
              1:begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'Update-BlueprintList');
              end;
              2:begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'Update-BluePrint');
              end;
              3:begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'View-Blueprint');
              end;
              4:begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'Update-Grid');
              end;
              5:begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'View -Grid');
              end;
             else begin
                  if IsFormOpen('VehicleTypeDetailList')=False then VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self);
              end;
           end;
        end;
        {161601..161609 Pekerjaan}
        161601..161604:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','06','04']) of
              0:begin
                  if IsFormOpen('MaintenanceJobForm')=False then MaintenanceJobForm:=TMaintenanceJobForm.Create(Self);
              end;
              1:begin
                  if IsFormOpen('MaintenanceJobList')=False then MaintenanceJobList:=TMaintenanceJobList.Create(Self,'Update-Detail');
              end;
              else begin
                  if IsFormOpen('MaintenanceJobList')=False then MaintenanceJobList:=TMaintenanceJobList.Create(Self,'Update-Detail');
              end;
           end;
        end;
        {161606..161609 Group Pekerjaan}
        161606..161609:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['06','07','09']) of
              0:begin
                  if IsFormOpen('MaintenanceGroupForm')=False then MaintenanceGroupForm:=TMaintenanceGroupForm.Create(Self);
              end;
              1:begin
                  if IsFormOpen('MaintenanceGroupList')=False then MaintenanceGroupList:=TMaintenanceGroupList.Create(Self);
              end;
              else begin
                  if IsFormOpen('MaintenanceGroupList')=False then MaintenanceGroupList:=TMaintenanceGroupList.Create(Self);
              end;
           end;
        end;
        {161606..161609 Group Pekerjaan Detail}
        161611..161614:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['11','12','14']) of
              0:begin
                  if IsFormOpen('MaintenanceGroupJobForm')=False then MaintenanceGroupJobForm:=TMaintenanceGroupJobForm.Create(Self);
              end;
              1:begin
                  if IsFormOpen('MaintenanceGroupJobList')=False then MaintenanceGroupJobList:=TMaintenanceGroupJobList.Create(Self);
              end;
              else begin
                  if IsFormOpen('MaintenanceGroupJobList')=False then MaintenanceGroupJobList:=TMaintenanceGroupJobList.Create(Self);
              end;
           end;
        end;
        {162001..162005 Administrasi Armada}
        162001..162006:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04','05','06']) of
              0:begin
                  if IsFormOpen('VehicleAdmin')=False then VehicleAdmin:=TVehicleAdmin.Create(Self);
              end;
              1:begin
                  if IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self,'Main-Change');
              end;
              3:begin
                  if IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self,'CheckList-Update');
              end;
              else begin
                  if IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self,'CheckList-View');
//                  if IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self);
              end;
           end;
        end;
        {170701..170704 Lead Car Rental}
        170701..170704:begin
                         case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
                         0:if IsFormOpen('Lead')=False then Lead :=TLead.Create(Self);
                         1:if IsFormOpen('LeadList')=False then LeadList:=TLeadList.Create(Self,'GrayLine','Main-Change');
                         else
                           if IsFormOpen('LeadList')=False then LeadList:=TLeadList.Create(Self,'GrayLine');
                         end;
        end;
        {170706..170709 Lead Order Car Rental}
        170706..170715:begin
                         Case CaseStr(RightStr(IntToStr(Tag),2),['06','07','10','12','15']) of
                           0:begin
                               if IsFormOpen('OfferingForm')=False then OfferingForm:=TOfferingForm.Create(Self);
                             end;
                           1:begin
                               if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'GrayLine','Main-Change');
                             end;
                           2:begin
                               if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'GrayLine','','',9);
                             end;
                           3:begin
                               if IsFormOpen('ReservationOLList')=False then ReservationOLList:=TReservationOLList.Create(Self,True);
                             end;
                           4:begin
                               if IsFormOpen('ReservationOLList')=False then ReservationOLList:=TReservationOLList.Create(Self,False);
                             end;
                           else begin
                             if IsFormOpen('OfferingList')=False then OfferingList:=TOfferingList.Create(Self,'GrayLine');
                           end;
                         end
                         
        end;
        {170801..170804 Customer Rental}
        170801..170804:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
                          0:begin
                              if IsFormOpen('Customer')=False then Customer:=TCustomer.Create(Self,'','BUS')
                            end;
                          1:begin
                              if IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'BUS','Main-Change');
                            end;
                          else begin
                            if IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'Bus');
                          end;
                       end;
                    end;
        {170806..170819 Customer Order Bus}
        170806..170821:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['06','07','10','11','12','18','19','21']) of
                           0:begin
                              //if IsFormOpen('OrderForm')=False then
                                OrderForm:=TOrderForm.Create(nil);
                             end;
                           1:begin
                              if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Main-Change','',7);
                             end;
                           2:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','','',9);
                             end;
                           3:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Invoice-Auth','',6);
                             end;
                           4:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Price-Revised','',2);
                             end;
                           5:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','','',8);
                             end;
                           6:begin
                                if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus','Reactivated-Revised','',8);
                             end;
                           7:begin
                                if IsFormOpen('AdditionalFeeOrderForm')=False then AdditionalFeeOrderForm:=TAdditionalFeeOrderForm.Create(Self);
                             end;
                           else begin
                              if IsFormOpen('OrderList')=False then OrderList:=TOrderList.Create(Self,'Bus');
                           end;
                         end;
                       end;
        {17811..170814 Customer Contract Rental}
        170901..170904:begin
                        Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04']) of
                          0:begin
                              if IsFormOpen('Contract')=False then Contract:=TContract.Create(Self);
                            end;
                          1:begin
                             if IsFormOpen('ContractList')=False then ContractList:=TContractList.Create(Self,'Car Rental','Main-Change');
                            end;
                          else begin
                             if IsFormOpen('ContractList')=False then ContractList:=TContractList.Create(Self,'Car Rental');
                          end;
                        end;
        end;
        {170701..170701 Surat Jalan}
{        170501..170501:begin
          if Tag=170501 then begin
            if IsFormOpen('SJDTr')=False then SJDTr:=TSJDTr.Create(Self);
          end;
        end;
}

        {170501..170505 Surat Jalan Rental}
        170501..170505:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05']) of
              0:begin
                  if IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self);
              end;
              1:begin
                  //if IsFormOpen('SPJBusList')=False then
                  SPJBusList:=TSPJBusList.Create(nil,'Main-Change');
                end;
              4:begin
                  if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'Main-ChangeVehicle');
                end;
              else begin
                  if IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self);
              end;
           end;
        end;
        {171501..171504 Product}
        171501..171504:begin
                         if RightStr(IntToStr(Tag),2)='01' then begin
                           if IsFormOpen('Product')=False then Product:=TProduct.Create(Self);
                         end else begin
                           if IsFormOpen('ProductList')=False then ProductList:=TProductList.Create(Self,'GRAYLINE');
                         end;
        end;
        {171506..171509 Product Price}
        171506..171509:begin
                         if RightStr(IntToStr(Tag),2)='06' then begin
                          if IsFormOpen('ProductPrice')=False then ProductPrice:=TProductPrice.Create(Self);
                         end else begin
                         if IsFormOpen('ProductPriceList')=False then ProductPriceList:=TProductPriceList.Create(Self,'GRAYLINE');
                         end;
        end;
        {171511..171514 Product Price Detail}
        171511..171514:begin
                         if RightStr(IntToStr(Tag),2)='11' then begin
                          if IsFormOpen('ProductPriceDetail')=False then ProductPriceDetail:=TProductPriceDetail.Create(Self);
                         end else begin
                         if IsFormOpen('ProductPriceDetailList')=False then ProductPriceDetailList:=TProductPriceDetailList.Create(Self,'GRAYLINE');
                         end;
        end;
        {180101..180110 Karyawan}
        180101..180111:begin
          case CaseStr(RightStr(IntToStr(Tag),2),['01','02','04','07', '09','10','11']) of
              0:begin
                  if IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Office','',False,False);
                end;
              1:begin
                  if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Office',9,0,'Office-Change');
                end;
              3:begin
                  if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Office',1,0,'PrintID');
                end;
              4:begin
                  if IsFormOpen('AttandanceLeaveForm')=False then AttandanceLeaveForm:=TAttandanceLeaveForm.Create(Self);
                end;
              5:begin
                  if IsFormOpen('AttandanceLeaveList')=False then AttandanceLeaveList:=TAttandanceLeaveList.Create(Self, 'OFFICE', 'Main-Change');
                end;
              6:begin
                  if IsFormOpen('AttandanceLeaveList')=False then AttandanceLeaveList:=TAttandanceLeaveList.Create(Self, 'OFFICE');
                end;
              else begin
                  if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Office',9);
              end;
          end;
        end;
        {190101 Laporan Data Mitra}
        190101:begin
          if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Taxi',9);
        end;
        {190103 Laporan Mitra Baru perBulan}
        190103: begin
           if IsFormOpen('NewEmployeeRpt')=False then begin
              NewEmployeeRpt:=TNewEmployeeRpt.Create(Self,'Taxi');
           end;
        end;
        {Laporan Keuangan Taxi}
        190201..190220:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','07','09','10','11','12','13','14','15','16','17']) of
              {190201 Laporan Pendapatan Kendaraan}
              0:if IsFormOpen('RevenueVhcDayRpt')=False then RevenueVhcDayRpt:=TRevenueVhcDayRpt.Create(Self);
              {190207 Laporan KS}
              1:if IsFormOpen('KSRpt')=False then KSRpt:=TKSRpt.Create(Self);
              {190209 Laporan Komisi Bulanan}
              2:if IsFormOpen('MonthlyCommissionRpt')=False then MonthlyCommissionRpt:=TMonthlyCommissionRpt.Create(Self);
              {190210 Laporan Argo Bulanan}
              3:if IsFormOpen('MonthlyArgoRpt')=False then MonthlyArgoRpt:=TMonthlyArgoRpt.Create(Self,'Taxi');
              {190211 Laporan Tunjangan}
              4:if IsFormOpen('MonthlyAllowanceRpt')=False then MonthlyAllowanceRpt:=TMonthlyAllowanceRpt.Create(Self);
              {190212 Laporan Argo Bulanan}
              5:if IsFormOpen('KSRptDetail')=False then KSRptDetail:=TKSRptDetail.Create(Self,'Taxi',9);
              {190213 Laporan Hutang Piutang Mitra}
              6:if IsFormOpen('MitraDebtClaimRpt')=False then MitraDebtClaimRpt:=TMitraDebtClaimRpt.Create(Self,'Taxi');
              {190214 Laporan Argo ExMitra}
              7:if IsFormOpen('MonthlyArgoRpt')=False then MonthlyArgoRpt:=TMonthlyArgoRpt.Create(Self,'Taxi',0);
              {190215 Laporan Hutang/Piutang ExMitra}
              8:if IsFormOpen('MitraDebtClaimRpt')=False then MitraDebtClaimRpt:=TMitraDebtClaimRpt.Create(Self,'Taxi',0);
              {190216 Laporan Penggunaan BBM perBulan}
              9:if IsFormOpen('MonthlyFuelRpt')=False then MonthlyFuelRpt:=TMonthlyFuelRpt.Create(Self,'Taxi');
              {190217 Laporan Armada Batal Jalan}
              10:if IsFormOpen('RevenueVhcDayCancelRpt')=False then RevenueVhcDayCancelRpt:=TRevenueVhcDayCancelRpt.Create(Self);
           end;
        end;
        {Laporan Operasional Taxi}
        190301..190320:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','06','07','08']) of
              {190301 Laporan Armada Jalan}
              0:if IsFormOpen('VhcOutRpt')=False then VhcOutRpt:=TVhcOutRpt.Create(Self);
              {190302 Laporan Running Days(Armada)}
              1:if IsFormOpen('TxRunningDaysRpt')=False then TxRunningDaysRpt:=TTxRunningDaysRpt.Create(Self);
              {190303 Laporan Running Days (Mitra)}
              2:if IsFormOpen('TxDrvRunningDaysRpt')=False then TxDrvRunningDaysRpt:=TTxDrvRunningDaysRpt.Create(Self);
              {190304 Laporan Kanebo}
              3:if IsFormOpen('KaneboRpt')=False then KaneboRpt:=TKaneboRpt.Create(Self);
              {190305 Laporan Penghasilan Rata-rata perBulan}
              4:if IsFormOpen('AverageIncomeRpt')=False then AverageIncomeRpt:=TAverageIncomeRpt.Create(Self);
              {190306 Laporan Armada Operasi perBulan}
              5:if IsFormOpen('VhcOutMonthlyRpt')=False then VhcOutMonthlyRpt:=TVhcOutMonthlyRpt.Create(Self);
              {190307 Laporan Armada Operasi perBulan}
              6:if IsFormOpen('VhcOutTimeGrossMonthlyRpt')=False then VhcOutTimeGrossMonthlyRpt:=TVhcOutTimeGrossMonthlyRpt.Create(Self);
              {190308 Laporan Kondite Mitra}
              7:if IsFormOpen('KonditeMitraRpt')=False then KonditeMitraRpt:=TKonditeMitraRpt.Create(Self);
           end;
        end;
        {190401 Laporan Keuangan}
        190401..190406:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','06']) of
             0:if IsFormOpen('RevenueVhcDayBusRpt')=False then RevenueVhcDayBusRpt:=TRevenueVhcDayBusRpt.Create(Self);
             1:if IsFormOpen('YearlySalesRDRpt')=False then YearlySalesRDRpt:=TYearlySalesRDRpt.Create(Self,'Bus','','',6);
             2:if IsFormOpen('YearlySalesRecapRpt')=False then YearlySalesRecapRpt:=TYearlySalesRecapRpt.Create(Self,'Bus');
             3:if IsFormOpen('DailyInvoiceRpt')=False then DailyInvoiceRpt:=TDailyInvoiceRpt.Create(Self,'Bus','','',2);
             4:if IsFormOpen('RevenueVhcMonthyRpt')=False then RevenueVhcMonthlyRpt:=TRevenueVhcMonthlyRpt.Create(Self);
             5:if IsFormOpen('BudgetListRpt')=False then BudgetListRpt:=TBudgetListRpt.Create(Self,'Bus','','',0);
           end;
        end;
        {190501 Laporan Operasional Bus}
        190501..190517:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17']) of
             0:if IsFormOpen('VhcOutBusRpt')=False then VhcOutBusRpt:=TVhcOutBusRpt.Create(Self);
             1:if IsFormOpen('BusRunningDaysRpt')=False then BusRunningDaysRpt:=TBusRunningDaysRpt.Create(Self);
             2:if IsFormOpen('DailyVehicleRDRpt')=False then DailyVehicleRDRpt:=TDailyVehicleRDRpt.Create(Self,'Bus','','',6);
             3:if IsFormOpen('DailyBusActivityRpt')=False then DailyBusActivityRpt:=TDailyBusActivityRpt.Create(Self);
             4:if IsFormOpen('DailyOrderFeeRpt')=False then DailyOrderFeeRpt:=TDailyOrderFeeRpt.Create(Self);
             5:if IsFormOpen('DailyCheckRpt')=False then DailyCheckRpt:=TDailyCheckRpt.Create(Self,'Bus','','',6);
             6:if IsFormOpen('BusRunningDaysminiRpt')=False then BusRunningDaysminiRpt:=TBusRunningDaysminiRpt.Create(Self);
             7:if IsFormOpen('TxDrvRunningDaysRpt')=False then TxDrvRunningDaysRpt:=TTxDrvRunningDaysRpt.Create(Self,'Bus');
             8:if IsFormOpen('DailySalesRpt')=False then DailySalesRpt:=TDailySalesRpt.Create(Self,'Bus','','',6,False,True);
             9:if IsFormOpen('DailySalesRpt')=False then DailySalesRpt:=TDailySalesRpt.Create(Self,'Bus','','',11,True,True);
             10:if IsFormOpen('VehicleEquipmentCheckListRpt')=False then VehicleEquipmentCheckListRpt:=TVehicleEquipmentCheckListRpt.Create(Self);
             11:if IsFormOpen('BusRunningDaysminiCompactRpt')=False then BusRunningDaysminiCompactRpt:=TBusRunningDaysminiCompactRpt.Create(Self);
             12:if IsFormOpen('TxETollRunningDaysRpt')=False then TxETollRunningDaysRpt:=TTxETollRunningDaysRpt.Create(Self);
             13:if IsFormOpen('TxCoDrvRunningDaysRpt')=False then TxCoDrvRunningDaysRpt:=TTxCoDrvRunningDaysRpt.Create(Self,'Bus');
             14:if IsFormOpen('AuthReservedOrderRpt')=False then AuthReservedOrderRpt:=TAuthReservedOrderRpt.Create(Self,'Bus');
             15:if IsFormOpen('EmployeeHistoryLakaRpt')=False then EmployeeHistoryLakaRpt:=TEmployeeHistoryLakaRpt.Create(Self);
             16:if IsFormOpen('EmplHistoryTrainingRpt')=False then EmplHistoryTrainingRpt:=TEmplHistoryTrainingRpt.Create(Self,'TRAINING-LAPORAN','','','');

           end;
        end;

        {190601 Laporan Sales Bus}
        190601..190612:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','06','07','08','09','10','11','12']) of
             0:if IsFormOpen('DailySalesRpt')=False then DailySalesRpt:=TDailySalesRpt.Create(Self,'Bus','','',24);
             1:if IsFormOpen('DailyOfferingRpt')=False then DailyOfferingRpt:=TDailyOfferingRpt.Create(Self,'Bus','','',6); //Tidak
             2:if IsFormOpen('DailySalesRDRpt')=False then DailySalesRDRpt:=TDailySalesRDRpt.Create(Self,'Bus','','',24);
             3:if IsFormOpen('MonthlySalesRpt')=False then MonthlySalesRpt:=TMonthlySalesRpt.Create(Self,'Bus','','',24);
             4:if IsFormOpen('MonthlySalesRDRpt')=False then MonthlySalesRDRpt:=TMonthlySalesRDRpt.Create(Self,'Bus','','',12); //GetCustomerOrderList_P
             5:if IsFormOpen('DailySalesRpt')=False then DailySalesRpt:=TDailySalesRpt.Create(Self,'Bus','','',8,True);
             6:if IsFormOpen('MonthlySalesRpt')=False then MonthlySalesRpt:=TMonthlySalesRpt.Create(Self,'Bus','','',8,True);
             7:if IsFormOpen('DailySalesRDRpt')=False then DailySalesRDRpt:=TDailySalesRDRpt.Create(Self,'Bus','','',8,True);
             8:if IsFormOpen('DailySalesRecapRpt')=False then DailySalesRecapRpt:=TDailySalesRecapRpt.Create(Self,'Bus','','',12,True);
             9:if IsFormOpen('MonthlySalesRDRpt')=False then MonthlySalesRDRpt:=TMonthlySalesRDRpt.Create(Self,'Bus','','',12,0,0,1);
            10:if IsFormOpen('MonthlySalesRDRpt')=False then MonthlySalesRDRpt:=TMonthlySalesRDRpt.Create(Self,'Bus','','',12,0,0,2);
            11:if IsFormOpen('RevenueVhcMonthyRpt')=False then RevenueVhcMonthlyRpt:=TRevenueVhcMonthlyRpt.Create(Self,'Main',False,'Sales');
           end;
        end;

        {Laporan Data Driver}
        190701..190704:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04']) of
              0:if IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',9);
              1:if IsFormOpen('NewEmployeeRpt')=False then NewEmployeeRpt:=TNewEmployeeRpt.Create(Self,'Bus');
              2:if IsFormOpen('EmployeeHistoryListRpt')=False then EmployeeHistoryListRpt:=TEmployeeHistoryListRpt.Create(Self,'Bus', '');
              3:if IsFormOpen('EmplAttedanceMini')=False then EmplAttedanceMini:=TEmplAttedanceMini.Create(Self);
           end;
        end;
        {Laporan Bengkel}
        190801..190807:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','05','06','07']) of
              0:if IsFormOpen('MaintenanceServiceRpt')=False then MaintenanceServiceRpt:=TMaintenanceServiceRpt.Create(Self,);
              1:if IsFormOpen('ServiceRequestRpt')=False then ServiceRequestRpt:=TServiceRequestRpt.Create(Self);
              2:if IsFormOpen('WorkOrderRpt')=False then WorkOrderRpt:=TWorkOrderRpt.Create(Self);
              3:if IsFormOpen('WorkOrderRptDay')=False then WorkOrderRptDay:=TWorkOrderRptDay.Create(Self);
              4:if IsFormOpen('FDriverComplainList')=False then FDriverComplainList:=TFDriverComplainList.Create(Self,'Laporan Keluhan Driver');
              5:if IsFormOpen('RekapHistoryArmadaPergantianPart')=False then RekapHistoryArmadaPergantianPart:=TRekapHistoryArmadaPergantianPart.Create(Self);
              6:if IsFormOpen('RekapPergantianPartperArmada')=False then RekapPergantianPartperArmada:=TRekapPergantianPartperArmada.Create(Self);
           end;
        end;
        {Integrate GP}
        191001..191010:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03','04','08','09','10']) of
              0:if IsFormOpen('IntegrateGPSaleTaxi')=False then IntegrateGPSaleTaxi:=TIntegrateGPSaleTaxi.Create(Self);
              1:if IsFormOpen('IntegrateGPInsuranceTaxi')=False then IntegrateGPInsuranceTaxi:=TIntegrateGPInsuranceTaxi.Create(Self);
              2:if IsFormOpen('IntegrateGPCommissionTaxi')=False then IntegrateGPCommissionTaxi:=TIntegrateGPCommissionTaxi.Create(Self);
              3:if IsFormOpen('IntegrateGPTollTaxi')=False then IntegrateGPTollTaxi:=TIntegrateGPTollTaxi.Create(Self);
              4:if IsFormOpen('IntegrateGPSaleBus')=False then IntegrateGPSaleBus:=TIntegrateGPSaleBus.Create(Self);
              5:if IsFormOpen('IntegrateGPHPPBus')=False then IntegrateGPHPPBus:=TIntegrateGPHPPBus.Create(Self);
              6:if IsFormOpen('IntegrateGPWehaOnline')=False then IntegrateGPWehaOnline:=TIntegrateGPWehaOnline.Create(Self);
           end;
        end;
        {Customer Complain}
        191101..191102:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:if IsFormOpen('CustomerComplainRpt')=False then CustomerComplainRpt:=TCustomerComplainRpt.Create(Self);
              1:if IsFormOpen('FCustomerComplainRpt2')=False then FCustomerComplainRpt2:=TFCustomerComplainRpt2.Create(Self);
           end;
        end;
        191201..191202:begin
           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:if IsFormOpen('VehicleListRptU')=False then  VehicleListRpt:=TVehicleListRpt.Create(Self,'');
              1:if IsFormOpen('VehicleTopupRptU')=False then VehicleTopupRpt:=TVehicleTopupRpt.Create(Self,'');
           end;
        end;
        191301..191301:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01']) of
              0:if IsFormOpen('TransferUangHarianDriverU')=False then TransferUangHarianDriver:=TTransferUangHarianDriver.Create(Self);
           end;
        end;
        191401..191401:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01']) of
              0:if IsFormOpen('CekPengajuanBarangListU')=False then CekPengajuanBarangList:=TCekPengajuanBarangList.Create(Self);
           end;
        end;
        162101..162102:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:if IsFormOpen('ReturBarangU')=False then ReturBarang:=TReturBarang.Create(Self);
              1:if IsFormOpen('ReturBarangListU')=False then ReturBarangList:=TReturBarangList.Create(Self);
           end;
        end;
        190901..190901:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01']) of
              0:if IsFormOpen('LaporanPermintaanBarangJasaU')=False then LaporanPermintaanBarangJasa:=TLaporanPermintaanBarangJasa.Create(Self);
           end;
        end;
        162201..162202:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:if IsFormOpen('SerahTerimaBarangU')=False then SerahTerimaBarang:=TSerahTerimaBarang.Create(Self);
              1:if IsFormOpen('ListSerahTerimaBarangU')=False then ListSerahTerimaBarang:=TListSerahTerimaBarang.Create(Self);
           end;
        end;
        162301..162302:begin
          Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
              0:if IsFormOpen('PartU')=False then begin
                Part:=TPart.Create(Self);
                StatusPart:='INSERT';
              end;
              1:if IsFormOpen('ListPartU')=False then begin
                ListParts:=TListParts.Create(Self);
              end;
           end;
        end;

        112101..112101:begin
          case Tag of
           112101:if IsFormOpen('UserExportForm')=False then UserExportForm:=TUserExportForm.Create(Self,'01');
  //         112102:if IsFormOpen('UserExportFormList')=False then UserExportFormList:= TUserExportFormList.Create(self,1);
  //         112103:if IsFormOpen('UserExportFormList')=False then UserExportFormList:= TUserExportFormList.Create(self,9);
           //if tag=112101 then
          //  UserExportForm:=TUserExportForm.Create(Self,'')
  //          else
  //          UserExportFormList :=TUserExportFormList.Create(Self);
          end;
         end;

         // User Menu
        {115101..115104 User Menu}
        111501..111503:begin
          case Tag of
            111501:if IsFormOpen('UserMenuForm')=False then UserMenuForm:= TUserMenuForm.Create(Self,'01');
            111502:if IsFormOpen('UserMenuList')=False then TUserMenuList.Create(Self,1);
            //111103:if IsFormOpen('UserMenuList')=False then TUserMenuList.Create(Self,9);
          else
            UserMenuForm:=TUserMenuForm.Create(Self);
          end;
        end;

        // User Sub Menu
        {116101..116104 User Sub Menu}
        111601..111604:begin
          case Tag of
            111601:if IsFormOpen('UserSubMenuForm')=False then UserSubMenuForm:=   TUserSubMenuForm.Create(Self,'01');
            111602:if IsFormOpen('UserSubMenuList')=False then TUserSubMenuList.Create(Self,1);
            //111103:if IsFormOpen('UserMenuList')=False then TUserMenuList.Create(Self,9);
          else
            UserSubMenuList:=TUserSubMenuList.Create(Self);
          end;
        end;

        {162501..162505 Rekomendasi Teknis}
        162501..162503:begin
          case CaseStr(RightStr(IntToStr(Tag),2),['01','02','03']) of
            0:begin
              if IsFormOpen('TechnicalRecommendation')=False then TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,'',False);
            end;
            1:begin
              if IsFormOpen('TechnicalRecommendationList')=False then TechnicalRecommendationList:=TTechnicalRecommendationList.Create(Self);
            end;

          end;
        end;


//        132201..132202:begin
//           Case CaseStr(RightStr(IntToStr(Tag),2),['01','02']) of
//              0:if IsFormOpen('FormSPBU')=False then  FormSPBU:=TFormSPBU.Create(Self,'');
//              0:if IsFormOpen('FormSPBU')=False then  FormSPBU:=TFormSPBU.Create(Self,'');
              //1:if IsFormOpen('DataSPBU')=False then DataSPBU:=TDataSPBU.Create(Self,'');
//           end;
//        end;
      end;
    end else begin
      MessageBox(Handle,PChar('Hak Akses Menu Tidak Ada'+Chr(13)+Chr(13)+'Silahkan Hubungi IT'),'WHAps',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;
end;

procedure TMain.StatusDisplay(StatusDisp:String;UserDisp:String);
begin
  Status.Panels.Items[2].Text:=StatusDisp;
  Status.Panels.Items[3].Text:=UserDisp;
end;

procedure TMain.StatusDateTime(DateDisp:String;TimeDisp:String);
begin
  Status.Panels.Items[0].Text:=DateDisp;
  Status.Panels.Items[1].Text:=TimeDisp;
end;

procedure TMain.StatusUpdate(Status1,Status2:String);
begin
  Status.Panels.Items[4].Text:=Status1;
  Status.Panels.Items[5].Text:=Status2;
end;

procedure TMain.StatusUserGroup(UserGroup:String);
begin
  Status.Panels.Items[6].Text:=UserGroup;
end;

procedure TMain.StatusLocation(LocationName:String);
begin
  Status.Panels.Items[7].Text:=LocationName;
end;


function TMain.WhatDate:String;
begin
  Result:=Status.Panels.Items[0].Text;
end;

procedure TMain.InitMenuHelp;
var NwMenu,NwSMenu:TMenuItem;
begin
  {create Menu Bantuan}
  NwMenu:=TMenuItem.Create(Self);
  NwMenu.Caption:='Bantuan';

  NwSMenu:=TMenuItem.Create(Self);
  NwSMenu.Caption:='Update';
  NwSMenu.OnClick:=Update1Click;
  {attach submenu}
  NwMenu.Add(NwSMenu);

  NwSMenu:=TMenuItem.Create(Self);
  NwSMenu.Caption:='-';
  NwMenu.Add(NwSMenu);

  {create Menu Pembuat}
  NwSMenu:=TMenuItem.Create(Self);
  NwSMenu.Caption:='Pembuat';
  NwSMenu.OnClick:=Pembuat1Click;
  {attach submenu}
  NwMenu.Add(NwSMenu);
  {attach menu}
  MainMenu.Items.Add(NwMenu);
end;

procedure TMain.InitMenu;
var NwMenu,NwSMenu,NwTMenu:TMenuItem;
    StrQry,MenuId,SMenuId,SMenu:String;
    QMenu,QSMenu,QTMenu:TADOQuery;
begin
  M_Busy;
  if Not(Expired) then begin
    QMenu:=TADOQuery.Create(Self);
    QMenu.Connection:=MyConnection;
    if OpenDb then begin
      StrQry:='EXEC GetUserMenu '+QuotedStr(User)+';';
      WriteLog('SQL :'+StrQry,2);
      QMenu.SQL.Add(StrQry);
      QMenu.Open;
      if (QMenu.RecordCount>0) then while not(QMenu.Eof) do begin
        MenuId:=QMenu.FieldValues['menu_id'];
        NwMenu:=TMenuItem.Create(Self);
        NwMenu.Caption:=QMenu.FieldValues['menu'];
        QSMenu:=TADOQuery.Create(Self);
        QSMenu.Connection:=MyConnection;
        StrQry:='EXEC GetUserSubMenu '+QuotedStr(User)+','+QuotedStr(MenuId)+';';
        WriteLog('SQL :'+StrQry,2);
        QSMenu.SQL.Add(StrQry);
        QSMenu.Open;
        if (QSMenu.RecordCount>0)then while not(QSMenu.Eof) do begin
          NwSMenu:=TMenuItem.Create(Self);
          NwSMenu.Caption:=QSMenu.FieldValues['sub_menu'];
          SMenuId:=QSMenu.FieldValues['sub_menu_id'];
          SMenu:=QSMenu.FieldValues['sub_menu'];
          QTMenu:=TADOQuery.Create(Self);
          QTMenu.Connection:=MyConnection;
          StrQry:='EXEC GetUserTreeMenu '+QuotedStr(User)+','+QuotedStr(SMenuId)+',@CompanyId='+CompanyId+';';
          WriteLog('SQL :'+StrQry,2);
          QTMenu.SQL.Add(StrQry);
          QTMenu.Open;
          if (QTMenu.RecordCount>0)then while not(QTMenu.Eof) do begin
              NwTMenu:=TMenuItem.Create(Self);
              NwTMenu.Caption:=QTMenu.FieldValues['tree_menu'];
              NwTMenu.Tag:=QTMenu.FieldValues['tree_sub_menu_id'];
              NwTMenu.OnClick:=MainMenuClick;
              NwSMenu.Add(NwTMenu);
              QTMenu.Next;
          end;
          QTMenu.Close;
          NwMenu.Add(NwSMenu);
          QSMenu.Next;
        end;
        QSMenu.Close;
        MainMenu.Items.Add(NwMenu);
        QMenu.Next;
      end;
      QMenu.Close;
    end;
    FreeAndNil(QSMenu);
    FreeAndNil(QTMenu);
    FreeAndNil(QMenu);
    CloseDb;
  end;
  M_Normal;
end;

procedure TMain.InitLogin;
begin
  Login1.Enabled:=False;
  Keluar1.Enabled:=False;
  Logout1.Enabled:=True;
  GantiPassword1.Enabled:=True;
  Pesan1.Enabled:=True;
  Pengaturan1.Enabled:=True;
  PindahLokasi1.Enabled:=True;
  Logged:=True;
  deInitMenu;
  InitMenu;
  InitMenuHelp;
  StatusDisplay('Logged In',FullName);
  StatusDateTime(GetDate,GetTime);
  ClockThread:=TClockThread.Create;
  TimerMessage.Enabled:=True;
  InitBasedForm;
  LoadSetting;
end;

procedure TMain.InitBasedForm ;
begin
  ReprintForm:=TReprintForm.Create(Self);
  AuthorizedForm:=TAuthorizedForm.Create(Self);
  EmployeeSearch:=TEmployeeSearch.Create(Self);
  TimeInputForm:=TTimeInputForm.Create(Self);
end;

procedure TMain.DeInitBasedForm ;
begin
  if IsFormOpen('AuthorizedForm') then AuthorizedForm.Destroy;
  if IsFormOpen('RePrintForm') then RePrintForm.Destroy;
  if IsFormOpen('EmployeeSearch') then EmployeeSearch.Destroy;
  if IsFormOpen('TimeInputForm') then TimeInputForm.Destroy;
end;

procedure TMain.deInitMenu;
var I:Integer;
begin
  for I:=((MainMenu.Items.Count)-1) downto 1 do begin
     MainMenu.Items[I].Free;
  end;
end;

function TMain.GetTime:String;
var StrQry,Str:String;
    Qry:TADOQuery;
begin
  MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=MyConnection;
  StrQry:='SELECT CONVERT(VARCHAR(8),GETDATE(),108) AS hour_minute;';
  WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  Str:=Qry.FieldValues['hour_minute'];
  Qry.Close;
  MyConnection.Close;
  Result:=Str;
end;

function TMain.GetDate:String;
var StrQry,Str:String;
    Qry:TADOQuery;
begin
  MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=MyConnection;
  StrQry:='SELECT CONVERT(VARCHAR(10),GETDATE(),103) AS date_time;';
  WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  Str:=Qry.FieldValues['date_time'];
  Qry.Close;
  MyConnection.Close;
  Result:=Str;
end;

procedure TMain.WriteLog(LogEntry:String;LogType:Integer=0);
begin
  if (LogLevel<=LogType) and (not(Expired)) then begin
    WriteLn(LogFile,FormatDateTime('dd/mm/yyyy hh:nn:ss',Now())+Chr(9)+LogEntry);
  end;
end;

procedure TMain.WriteTableLog(Methode:String;ParamIn:String;Result:String);
var QryLog:TADOQuery;
    StrQry,LogText:String;
begin
  Main.MyConnection.Open;
  QryLog:=TADOQuery.Create(Self);
  QryLog.Connection:=Main.MyConnection;
  QryLog.CommandTimeout:=3600;
  Main.M_Busy;

  if Main.OpenDb then begin
    WriteLn(LogAPIFile,FormatDateTime('dd/mm/yyyy hh:nn:ss',Now())+Chr(9)+Methode+' : '+ParamIn+'; Result : '+Result);
    {
    StrQry:='Insert Into wh_api_intersys_log (id_log, methode, param_in, result, user_id) Values '+
          '( (select Concat(CONVERT(char(4), GetDate(),12), (SELECT RIGHT(CONCAT('''+'0000000'+''', COALESCE((SELECT TOP 1 coalesce(id_log,0) id_log from wh_api_intersys_log where id_log like CONVERT(char(4), GetDate(),12)+'''+'%'+''' ORDER By id_log DESC), 0)+1) , 5)))), '+QuotedStr(Methode)+', '+QuotedStr(ParamIn)+', '+QuotedStr(Result)+', '+QuotedStr(User)+');';
    }
    ParamIn:=StringReplace(Trim(ParamIn),':','=',[rfReplaceAll]);
    StrQry:='Insert Into wh_api_intersys_log (methode, param_in, result, user_id) Values '+
          '( '+QuotedStr(Methode)+', '+QuotedStr(ParamIn)+', '+QuotedStr(Result)+', '+QuotedStr(User)+')';
    QryLog.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,4);
    QryLog.SQL.Add(StrQry);
    try
      QryLog.ExecSQL;
    except
      on E:Exception do begin

      end;
    end;
    QryLog.Close;
  end;
  FreeAndNil(QryLog);
  //$sqlInsertLog = "Insert Into $LogTable (methode, param_in, dataorder, result, user_id) Values ('$methode', '$param_in', '$DataOrder', '$result', '$user_id');";

end;

procedure TMain.LogOut;
var Qry:TADOQuery;
    StrQry,LogText:String;
    IntCount:Integer;
    LogFiles:TextFile;
begin
  if IsFormOpen('ChatClient')=True then ChatClient.Disconnect;
  try
    ClockThread.Terminate;
    ClockThread.WaitFor;
    FreeAndNil(ClockThread);
  except
  end;
  if Screen.FormCount>2 then begin
    DeInitBasedForm;
  end;
  if Screen.FormCount>2 then begin
    ShowMessage('Silahkan Tutup Semua Jendela Sebelum keluar');
    InitBasedForm;
  end else begin
    WriteLog('Log Out');
    deInitMenu;
    Main.MyConnection.Close;
    Main.Logout1.Enabled:=False;
    Main.Login1.Enabled:=True;
    Main.Keluar1.Enabled:=True;
    GantiPassword1.Enabled:=False;
    Pesan1.Enabled:=False;
    Pengaturan1.Enabled:=False;
    PindahLokasi1.Enabled:=False;
    Logged:=False;
    InitMenuHelp;
    StatusDisplay('Offline','');
    StatusDateTime('','');
    StatusLocation('');
    ClockTimer.Enabled:=False;
    StatusUserGroup('');
    //Dashboard.Clear;
  end;
end;

procedure TMain.InitParam;
var
  rStream: TResourceStream;
  fStream: TFileStream;
  fname,RegPathOld: string;
  RegHost,RegDb,RegUser,RegPass,RegProvider,RegLogLevel,RegLogFileName,RegChatHost,RegChatPort,RegChatAutoStart,RegLogFileAPIName:String;
begin
  RegPath:='SOFTWARE\WEHA\Aplikasi\3';
  WriteLog('Registry Read: Path='+RegPath,1);
  RegHost:='103.96.147.245';
  RegDb:='wh_prod';
  RegUser:='sa';
  RegPass:='admin@mssql#';
  RegProvider:='SQLNCLI10';
  RegLogLevel:='5';
  RegLogFileName:='WHAps.log';
  RegLogFileAPIName:='WHApsAPI.log';
  RegChatHost:='103.96.147.245';
  RegChatPort:='7090';
  RegChatAutoStart:='1';
  try
    WriteLog('Registry Read/Write',1);
    Regs:=TRegistry.Create;
    Regs.RootKey:=HKEY_LOCAL_MACHINE;
    try
      if Regs.OpenKey(RegPath,True) then begin
        if not(Regs.ValueExists('Host')) then
          Regs.WriteString('Host',RegHost);
        if not(Regs.ValueExists('Host')) then
          Regs.WriteString('Host',RegHost);
        if not(Regs.ValueExists('Db')) then
          Regs.WriteString('Db',Encrypt(RegDb,3));
        if not(Regs.ValueExists('Username')) then
          Regs.WriteString('Username',Encrypt(RegUser,4));
        if not(Regs.ValueExists('Password')) then
          Regs.WriteString('Password',Encrypt(RegPass,5));
        if not(Regs.ValueExists('Provider')) then
          Regs.WriteString('Provider',RegProvider);
        if not(Regs.ValueExists('LogLevel')) then
          Regs.WriteString('LogLevel',RegLogLevel);
        if not(Regs.ValueExists('LogFileName')) then
          Regs.WriteString('LogFileName',RegLogFileName);
        if not(Regs.ValueExists('LogAPIFileName')) then
          Regs.WriteString('LogAPIFileName',RegLogFileAPIName);
        if not(Regs.ValueExists('ChatHost')) then
          Regs.WriteString('ChatHost',RegChatHost);
        if not(Regs.ValueExists('ChatPort')) then
          Regs.WriteString('ChatPort',RegChatPort);
        if not(Regs.ValueExists('ChatAutoStart')) then
          Regs.WriteString('ChatAutoStart',RegChatAutoStart);
      end else
        WriteLog('Registry Open:Fail',1);
    except
      on E:Exception do
        WriteLog('Registry Open:Fail='+E.Message,1);
    end;
  finally
    Regs.CloseKey;
    FreeAndNil(Regs);
  end;
    fname := ExtractFileDir(ParamStr(0))+'\busy.ani';
    rStream := TResourceStream.Create(hInstance, 'M_Busy', RT_RCDATA);
    try
      fStream := TFileStream.Create(fname, fmCreate) ;
      try
        fStream.CopyFrom(rStream, 0) ;
      finally
        fStream.Free;
      end;
    finally
      FreeAndNil(rStream);
    end;
  Screen.Cursors[MyCursor]:=LoadCursorFromFile('busy.ani');
end;

procedure TMain.InitReg;
begin
  WriteLog('Registry Read: Path='+RegPath,1);
  try
    Regs:=TRegistry.Create(KEY_READ or $0100);
    Regs.RootKey:=HKEY_LOCAL_MACHINE;
    try
      if Regs.OpenKeyReadOnly(RegPath) then begin
        DbHost:=Regs.ReadString('Host');
        Db:=Decrypt(Regs.ReadString('Db'),3);
        DbUser:=Decrypt(Regs.ReadString('Username'),4);
        DbPass:=Decrypt(Regs.ReadString('Password'),5);
        Provider:=Regs.ReadString('Provider');
        LogLevel:=StrToInt(Regs.ReadString('LogLevel'));
        LogFileName:=Regs.ReadString('LogFileName');
        LogAPIFileName:=Regs.ReadString('LogAPIFileName');
        ChatHost:=Regs.ReadString('ChatHost');
        ChatPort:=Regs.ReadString('ChatPort');
        IsChatAutoStart:=Regs.ReadString('ChatAutoStart');
      end else
        WriteLog('Registry Read:Fail',1);
    except
      on E:Exception do
        WriteLog('Registry Read:Fail='+E.Message,1);
    end;
  finally
    Regs.CloseKey;
    FreeAndNil(Regs);
  end;
end;

procedure TMain.InitDb;
var IsOk:Boolean;
    SetManual:Integer;
begin
  {ADODB}
  if (Db='wh_prod') then
  begin
    if (DbHost<>'103.96.147.245') AND (DbHost<>'10.10.27.221') AND (DbHost<>'whapsdb.whitehorse.co.id') then
    begin
      DbHost:='whapsdb.whitehorse.co.id';
    end;
    {$Define WH_PROD}
  end
  else
    {$Define WH_DEV}

  if DbUser='sa' then
  begin
     DbUser:='sa.whaps' ;
     DbPass:='whaps@whitehorse2024';
  end;

  WriteLog('Setting DB Param');
  StrConnection:='Provider='+Provider+';Password='+DbPass+';Persist Security Info=True;User ID='+DbUser+';Initial Catalog='+Db+';Data Source='+DbHost;
  WriteLog('Create DB Object');
  MyConnection:=TADOConnection.Create(Self);
  MyConnection.Connected:=False;
  MyConnection.KeepConnection:=False;
  MyConnection.CursorLocation:=clUseClient;
  MyConnection.LoginPrompt:=False;
  MyConnection.CommandTimeout:=3600;
  MyConnection.ConnectionTimeout:=3600;


  if (DbHost='103.96.147.245') OR (DbHost='10.10.27.221') or (DbHost='whapsdb.whitehorse.co.id') then
  begin
    if (DbHost='103.96.147.245') then begin
      StrConnectionWehaOnline:='Provider='+Provider+';Password=''password2018'';Persist Security Info=True;User ID=''weha'';Initial Catalog=''WHOnline'';Data Source=''103.96.146.219''';
    end else begin
      StrConnectionWehaOnline:='Provider='+Provider+';Password=''password2018'';Persist Security Info=True;User ID=''weha'';Initial Catalog=''WHOnline'';Data Source=''10.10.27.230''';
    end;
  end else if (DbHost='10.10.27.130') then
  begin
     StrConnectionWehaOnline:='Provider='+Provider+';Password=''password2018'';Persist Security Info=True;User ID=''weha'';Initial Catalog=''whonline_dev'';Data Source=''10.10.27.134''';
  end else
  begin
    StrConnectionWehaOnline:='Provider='+Provider+';Password=''password2018'';Persist Security Info=True;User ID=''weha'';Initial Catalog=''whonline_dev'';Data Source=''192.168.8.102''';
  end;
  WriteLog('Create DB Object');
  MyConnectionWehaOnline:=TADOConnection.Create(Self);
  MyConnectionWehaOnline.Connected:=False;
  MyConnectionWehaOnline.KeepConnection:=False;
  MyConnectionWehaOnline.CursorLocation:=clUseClient;
  MyConnectionWehaOnline.LoginPrompt:=False;
  MyConnectionWehaOnline.CommandTimeout:=3600;
  MyConnectionWehaOnline.ConnectionTimeout:=3600;

  WriteLog('Init DB');
  IsOk:=True;
  try
    CreateDbConnection;
  except
    on E:Exception do begin
      WriteLog('Error Create DB Connection');
      IsOk:=False;
      SetManual:=MessageBox(Handle,PChar('Error Create DB Connection'+e.Message+Chr(13)+Chr(13)+' Set Connection Manually ?'),'Database',MB_OKCANCEL or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;

  if IsOk then WriteLog('Finish Init DB')
  else if SetManual=1 then SetDBManually;
end;

procedure TMain.Init;
var TempLogFileName:String;
    FAtr:TWin32FileAttributeData;
    IntCount:Integer;
begin
  StrUrlApi := 'www.whitehorse.co.id/online/';

  TempLogFileName:='WHAps.Log';
  LogFileName:=TempLogFileName;
  LogAPIFileName:='WHApsAPI.Log';
  LogLevel:=0;
  InitLogFile;
  InitLogAPIFile;
  Logged:=False;
  WriteLog('Get Local Settings');
  LocalShortDate:=GetLocalSettings(LOCALE_SSHORTDATE);
  LocalLongDate:=GetLocalSettings(LOCALE_SLONGDATE);
  WriteLog('Start Change Local Settings');
  if SetLocaleInfo(LOCALE_SYSTEM_DEFAULT,LOCALE_SSHORTDATE,'dd/MM/yyyy') then
  begin
    //SendMessage(HWND_BROADCAST,WM_WININICHANGE,0,0);
    WriteLog('Change short date format');
  end else WriteLog('Could not change short date format');
  if SetLocaleInfo(LOCALE_SYSTEM_DEFAULT,LOCALE_SLONGDATE,'dd MMM yyyy') then
  begin
    //SendMessage(HWND_BROADCAST,WM_WININICHANGE,0,0);
    WriteLog('Change Long date format');
  end else WriteLog('Could not change long date format');
  try
    DateSeparator:='/';
    TimeSeparator:=':';
    DecimalSeparator:=',';
    ThousandSeparator:='.';
    ShortTimeFormat:='HH:nn';
    LongTimeFormat:='HH:nn:ss';
  except
    on E:Exception do WriteLog('Setting Parameter Error :'+E.Message);
  end;
  WriteLog('Finish Change Local Settings');
  StatusDisplay('Offline','');
  StatusDateTime('','');
  InitParam;
  InitReg;
  InitDb;
  if LogFileName<>TempLogFileName then begin
    deInitLogFile;
    InitLogFile;
    deInitLogAPIFile;
    InitLogAPIFile;
  end;
  IntCounterMessage:=0;
  IntTimeCounterMessage:=15;
  IsMessageOpen:=False;
  HoldLessDeposit:=False;
  MaxLessDeposit:=0;
  WriteLog('Get File Version');
  AppVersion:=FileVersion(ParamStr(0));
  WriteLog('Change  Caption');
  Application.Title:=MyApps;
  Caption:=MyApps+'Ver '+AppVersion;
  if MyBackG=0 then LogoWHG.Picture:=nil;
  LogoWHG.Align:=alClient;
  if CompareDate(StrToDate(MaxDate),Now)=-1 then begin
    WriteLog('WHAps Expired');
    Caption:=Caption+' (Expired)';
    Expired:=True;
  end;
  for IntCount:=1 to ParamCount do begin
    if UpperCase(ParamStr(IntCount))='NOBG' then LogoWHG.Picture:=nil;
    if UpperCase(ParamStr(IntCount))='NOHEADER' then Caption:='Ver '+AppVersion;
    if UpperCase(ParamStr(IntCount))='NOEXPIRED' then Expired:=False;
  end;
  TimerCheckFirstRun.Enabled:=True;
  ThisMonth:=FormatDateTime('mm',Now);
  ThisYear:=FormatDateTime('yyyy',Now);
end;

procedure TMain.InitLogFile;
begin
  AssignFile(LogFile,LogFileName);
  if FileExists(LogFileName) then begin
    Append(LogFile);
    if FileSize(LogFile)>5120 then Begin
      CloseFile(LogFile);
      RenameFile(LogFileName,LeftStr(LogFileName,Length(LogFileName)-4)+FormatDateTime('yymmdd',Now)+RightStr(LogFileName,4));
      Rewrite(LogFile);
    end;
  end else Rewrite(LogFile);
end;

procedure TMain.deInitLogFile;
begin
  CloseFile(LogFile);
end;

procedure TMain.InitLogAPIFile;
begin
  AssignFile(LogAPIFile, LogAPIFileName);
  if FileExists(LogAPIFileName) then begin
    Append(LogAPIFile);
    if FileSize(LogAPIFile)>5120 then Begin
      CloseFile(LogAPIFile);
      RenameFile(LogAPIFileName,LeftStr(LogAPIFileName,Length(LogAPIFileName)-4)+FormatDateTime('yymmdd',Now)+RightStr(LogAPIFileName,4));
      Rewrite(LogAPIFile);
    end;
  end else Rewrite(LogAPIFile);
end;

procedure TMain.deInitLogAPIFile;
begin
  CloseFile(LogAPIFile);
end;

function TMain.IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
  Result := False;
  WriteLog('Form Check :'+FormName,1);
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TMain.SetDBManually;
var StrConn:String;
    IsOk:Boolean;
begin
  IsOk:=True;
  if ADOConnectionString(Handle,StrConnection,StrConn)=True then StrConnection:=StrConn ;
  WriteLog('Change Db Connection to :'+StrConn);
  try
    CreateDbConnection;
  except
    on E:Exception do begin
      WriteLog('Error Create DB Connection');
      IsOk:=False;
      MessageBox(Handle,PChar('Error Create DB Connection'+e.Message),'Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;
  if IsOk then WriteLog('Finish Create DB Connection');
end;      

procedure TMain.CreateDbConnection;
begin
  WriteLog('Create Connection:'+StrConnection,-1);
  MyConnection.ConnectionString:=StrConnection;
  MyConnectionWehaOnline.ConnectionString:=StrConnectionWehaOnline;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  SystemMenu: HMenu;
begin
  Expired:=False;
  SystemMenu := GetSystemMenu(Handle, False);
  DeleteMenu(SystemMenu, SC_CLOSE, MF_BYCOMMAND);
  Init;
  if Expired then Login1.Enabled:=False;
  InitShortKey;
end;

procedure TMain.ClockTimerTimer(Sender: TObject);
begin
//  TimeSeparator:=':';
{
  Status.Panels.Items[1].Text:=TimeToStr(StrToTime(Status.Panels.Items[1].Text)+1/86400);
  if IsMessageOpen=False then
    if IntCounterMessage>=(IntTimeCounterMessage*60) then begin
      IntCounterMessage:=0;
      TimerMessage.Enabled:=True;
    end else
      Inc(IntCounterMessage);
}
end;

procedure TMain.TimerCheckFirstRunTimer(Sender: TObject);
begin
  TimerCheckFirstRun.Enabled:=False;
//  SplashScreen:=TSplashScreen.Create(Self);
  if FileExists('WHApsUpDater.exe') then begin
    DeleteFile('WHApsUpDater.exe');
    WriteLog('Deleting Updater');
  end;
  if FileExists('unzip32.dll') then begin
    DeleteFile('unzip32.dll');
    WriteLog('Deleting unzip32');
  end;
end;

function TMain.OpenDb:Boolean;
var IsOk:Boolean;
    StrMsg:String;
begin
  IsOk:=True;
  if IsPortOpened(DbHost,1433) then begin
    try
      WriteLog('Open DB Connection');
      MyConnection.Open;
      MyConnectionWehaOnline.Open;
    except
      on E:Exception do begin
        if DbHost='103.96.147.245' then
        begin
           DbHost:='10.10.27.221';
           InitDb;
           try
              WriteLog('Open DB Connection');
              MyConnection.Open;
              MyConnectionWehaOnline.Open;
           except
              on E:Exception do begin
                IsOk:=False;
                WriteLog('Error Opening DB Connection');
                StrMsg:='Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message;
                MessageBox(Handle,PChar(StrMsg),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
            end;
        end else if (DbHost='10.10.27.221') or (DbHost='whapsdb.whitehorse.co.id') then
        begin
           DbHost:='103.96.147.245';
           InitDb;
           try
              WriteLog('Open DB Connection');
              MyConnection.Open;
              MyConnectionWehaOnline.Open;
           except
              on E:Exception do begin
                IsOk:=False;
                WriteLog('Error Opening DB Connection');
                StrMsg:='Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message;
                MessageBox(Handle,PChar(StrMsg),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
            end;
        end;
//        IsOk:=False;
//        WriteLog('Error Opening DB Connection');
//        StrMsg:='Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message;
//        MessageBox(Handle,PChar(StrMsg),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
    end;
  end;
  Result:=IsOk;
end;

procedure TMain.CloseDb;
begin
  Main.MyConnection.Close;
//  Main.MyConnectionWehaOnline.Close;
end;

procedure TMain.TransStart;
begin
  Main.MyConnection.BeginTrans;
end;

procedure TMain.TransRollback;
begin
  Main.MyConnection.RollbackTrans;
end;

procedure TMain.TransCommit;
begin
  Main.MyConnection.CommitTrans;
end;

function TMain.IsVersionUptodate:Boolean;
var IsUptodate:Boolean;
    Qry:TADOQuery;
    StrQry,StrServerVersion,StrClientVersion:String;
    IntServerVersion,IntClientVersion,IntCount:Integer;
    StrList:TStringList;
begin
  IsUptodate:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=MyConnection;       
  WriteLog('Update check version');  
  if OpenDb then begin
    StrQry:='SELECT version FROM wh_application WHERE application_id=(SELECT MAX(application_id) FROM wh_application);';
    WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['version']<>NULL then begin
      StrList:=TStringList.Create;
      StrList:=SplitStrings(Qry.FieldValues['version'],'.');
      StrServerVersion:='';
      for IntCount:=0 to StrList.Count-1 do
        StrServerVersion:=StrServerVersion+Format('%.*d',[2,StrToInt(StrList.Strings[IntCount])]);
      StrList:=SplitStrings(FileVersion(ParamStr(0)),'.');
      StrClientVersion:='';
      for IntCount:=0 to StrList.Count-1 do
        StrClientVersion:=StrClientVersion+Format('%.*d',[2,StrToInt(StrList.Strings[IntCount])]);
      IntServerVersion:=StrToInt(StrServerVersion);
      IntClientVersion:=StrToInt(StrClientVersion);
      if IntClientVersion>=IntServerVersion then IsUptodate:=True;
      FreeAndNil(StrList);
    end;
    Qry.Close;
    Qry.Destroy;
    CloseDb;
  end;
  Result:=IsUptodate;
end;

function TMain.IsNewVersionAvail:Boolean;
var IsNewVersion:Boolean;
    Qry:TADOQuery;
    StrQry,StrServerVersion,StrClientVersion:String;
    IntServerVersion,IntClientVersion,IntCount:Integer;
    StrList:TStringList;
begin
  IsNewVersion:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=MyConnection;
  WriteLog('Update new version check');
  if OpenDb then begin
    WriteLog('SQL :'+StrQry,2);
    StrQry:='SELECT todate_version FROM wh_application WHERE application_id=(SELECT MAX(application_id) FROM wh_application);';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['todate_version']<>NULL then begin
      StrList:=TStringList.Create;
      AppVersionSvr:=Qry.FieldValues['todate_version'];
      StrList:=SplitStrings(Qry.FieldValues['todate_version'],'.');
      StrServerVersion:='';
      for IntCount:=0 to StrList.Count-1 do
        StrServerVersion:=StrServerVersion+Format('%.*d',[2,StrToInt(StrList.Strings[IntCount])]);
      StrList:=SplitStrings(FileVersion(ParamStr(0)),'.');
      StrClientVersion:='';
      for IntCount:=0 to StrList.Count-1 do
        StrClientVersion:=StrClientVersion+Format('%.*d',[2,StrToInt(StrList.Strings[IntCount])]);
      IntServerVersion:=StrToInt(StrServerVersion);
      IntClientVersion:=StrToInt(StrClientVersion);
      if IntClientVersion<IntServerVersion then IsNewVersion:=True;
      FreeAndNil(StrList);
    end;
    Qry.Close;
    Qry.Destroy;
    CloseDb;
  end;
  Result:=IsNewVersion;
end;

procedure TMain.TanyaUpdate;
var
  rStream: TResourceStream;
  fStream: TFileStream;
  fname: string;
begin
  if MessageBox(Handle,'Mau MengUpdate Versi Aplikasi?','APP Version',MB_OKCANCEL or MB_ICONEXCLAMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
    M_Busy;
    WriteLog('Update delete cache');
    DeleteIECache;
    WriteLog('Update extract file');
    fname := ExtractFileDir(Paramstr(0))+'\WHApsUpDater.exe';
    rStream := TResourceStream.Create(hInstance, 'UpDater', RT_RCDATA);
    try
      fStream := TFileStream.Create(fname, fmCreate) ;
      try
        fStream.CopyFrom(rStream, 0) ;
      finally
        fStream.Free;
      end;
    finally
      rStream.Free;
    end;
    fname := ExtractFileDir(Paramstr(0))+'\unzip32.dll';
    rStream := TResourceStream.Create(hInstance, 'zipdll', RT_RCDATA);
    try
      fStream := TFileStream.Create(fname, fmCreate) ;
      try
        fStream.CopyFrom(rStream, 0) ;
      finally
        fStream.Free;
      end;
    finally
      rStream.Free;
    end;
    WriteLog('Update start updater');
    ShellExecute(Handle,'open','WHApsUpDater.exe',nil,nil,SW_SHOWNORMAL);
    M_Normal;
    Keluar1Click(nil);
  end;
end;

procedure TMain.TimerUpdateTimer(Sender: TObject);
begin
  TimerUpdate.Enabled:=False;
  TanyaUpdate;
end;

procedure TMain.TimerMessageTimer(Sender: TObject);
begin
  TimerMessage.Enabled:=False;
  CheckMessage;
end;

procedure TMain.CheckMessage;
var Qry:TADOQuery;
    Conn:TADOConnection;
    StrQry,TotalSales:String;
    IsOk:Boolean;
    MsgArr:Array of TArrString7;
begin
  if Logged then begin
    IsMessageOpen:=True;
    IsOk:=True;
    Conn:=TADOConnection.Create(Self);
    Conn.ConnectionString:=StrConnection;
    Conn.LoginPrompt:=False;
    if IsPortOpened(Main.DbHost,1433) then begin
      try
        WriteLog('Message:Port Check');
        Conn.Open;
      except
        on E:Exception do begin
          IsOk:=False;
          MessageBox(Handle,PChar('Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
        end;
      end;
    end;
    if IsOk then begin
      WriteLog('Message:Open DB Connection');
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Conn;
      StrQry:='EXEC GetMessage '+QuotedStr(GroupId)+','+QuotedStr(User)+';';
      WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(MsgArr,Qry.RecordCount);
      if Qry.RecordCount>0 then begin
        if IsFormOpen('MessageForm')=False then MessageForm:=TMessageForm.Create(Self);
      end;
      Qry.Close;
      FreeAndNil(Qry);
    end;
    Conn.Close;
    FreeAndNil(Conn);
    IsMessageOpen:=False;
    if IsOk then begin
      StatusDateTime(GetDate,GetTime);
      Dashboard.RefreshData
    end;
  end;
end;

procedure TMain.LoadSetting;
var Qry:TADOQuery;
    StrQry,Value:String;
begin
  WriteLog('Loading Setting',2);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=MyConnection;
  if OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE setting_name='+Chr(39)+'Hold_Less_Deposit'+Chr(39)+';';
    WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['value_string']<>NULL then Value:=Qry.FieldValues['value_string'];
    HoldLessDeposit:=StrToBool(Value);
    Qry.Close;
    StrQry:='SELECT * FROM wh_setting WHERE setting_name='+Chr(39)+'Max_Less_Deposit'+Chr(39)+';';
    WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['value_string']<>NULL then Value:=Qry.FieldValues['value_string'];
    MaxLessDeposit:=StrToInt(Value);
    Qry.Close;
    StrQry:='SELECT * FROM wh_setting WHERE setting_name='+Chr(39)+'Dashboard_'+CompanyId+Chr(39)+';';
    WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['value_string']<>NULL then begin
      Value:=Qry.FieldValues['value_string'];
      if Value='1' then IsDashboard:=True else IsDashboard:=False;
    end else IsDashboard:=False;
    Qry.Close;
  end;
  CloseDb;
  Qry.Destroy;
end;

procedure TMain.CloseApp(Str:String);
var  hand: HWND ;
begin
  repeat
    hand:= FindWindow(PChar(Str), nil) ;
    PostMessage(hand, WM_NCDESTROY, 0, 0) ;
    SendMessage(hand, WM_CLOSE, 0, 0)
  until hand=0;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DeInitShortKey;
  if Not(Expired) then begin deInitLogFile; deInitLogAPIFile; end;
end;

procedure TMain.Keluar1Click(Sender: TObject);
begin
  M_Busy;
  WriteLog('Start Return Local Settings');
//  if SetLocaleInfo(LOCALE_SYSTEM_DEFAULT,LOCALE_SSHORTDATE,PChar(LocalShortDate)) then
//  begin
//    SendMessage(HWND_BROADCAST,WM_WININICHANGE,0,0);
//    WriteLog('Change short date format');
//  end else WriteLog('Could not change short date format');
//  if SetLocaleInfo(LOCALE_SYSTEM_DEFAULT,LOCALE_SLONGDATE,PChar(LocalLongDate)) then
//  begin
//    SendMessage(HWND_BROADCAST,WM_WININICHANGE,0,0);
//    WriteLog('Change Long date format');
//  end else WriteLog('Could not change long date format');

  WriteLog('Finish Return Local Settings');

  M_Normal;
  if FileExists('busy.ani') then begin
    DeleteFile('busy.ani');
  end;
  WriteLog('Destroying Object');
  FreeAndNil(MyConnection);
  FreeAndNil(MyConnectionWehaOnline);
  WriteLog('Closing Apps');

  Close;
end;

procedure TMain.Login1Click(Sender: TObject);
begin
  InitDb;
  Login:=TLogin.Create(Self);
end;

procedure TMain.Logout1Click(Sender: TObject);
begin
  LogOut;
end;

procedure TMain.GantiPassword1Click(Sender: TObject);
begin
  WriteLog('Change Password');
  ChangePass:=TChangePass.Create(Self);
end;

procedure TMain.SettingsDblClick(Sender: TObject);
begin
  WriteLog('Open Setting');
  Setting:=TSetting.Create(Self);
end;

procedure TMain.Pembuat1Click(Sender: TObject);
begin
  Apps:=TApps.Create(Self);
end;

procedure TMain.Update1Click(Sender: TObject);
begin
  TanyaUpdate;
end;

procedure TMain.M_Busy;
begin
  Screen.Cursor:=MyCursor;
end;

procedure TMain.M_Normal;
begin
  Screen.Cursor:=crDefault;
end;

procedure TMain.AppHotKeyShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode=VK_F1 then Apps:=TApps.Create(Self);
  if Msg.CharCode=VK_F9 then
    Fsetcetakinv.Show;
end;

procedure TMain.Pencetakan1Click(Sender: TObject);
begin
  PrintSetting:=TPrintSetting.Create(Self);
end;

procedure TMain.PindahLokasi1Click(Sender: TObject);
begin
  WriteLog('Location change from'+LocationId);
  LocationChange:=TLocationChange.Create(Self);
end;

function TMain.MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
  Caption: ARRAY OF string; dlgcaption: string): Integer;
var
  aMsgdlg: TForm;
  i,FormWidth: Integer;
  Dlgbutton: Tbutton;
  Captionindex: Integer;
begin
  aMsgdlg := createMessageDialog(Msg, DlgTypt, button);
  aMsgdlg.Caption := dlgcaption;
  aMsgdlg.BiDiMode := bdRightToLeft;
  Captionindex := 0;
  FormWidth:=0;
  for i := 0 to aMsgdlg.componentcount - 1 Do
  begin
    if (aMsgdlg.components[i] is Tbutton) then
    Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]);
      if Captionindex <= High(Caption) then
        Dlgbutton.Caption := Caption[Captionindex];
        Dlgbutton.Width := 80 ;
        Dlgbutton.Left := FormWidth+20;
        FormWidth:=FormWidth+Dlgbutton.Width+20;
        Inc(Captionindex);
    end;
  end;
  if aMsgdlg.Width<FormWidth then aMsgdlg.Width:=FormWidth+40;
  Result := aMsgdlg.Showmodal;
  aMsgdlg.Free;
end;


procedure TMain.TimerExpiredTimer(Sender: TObject);
begin
  ShowMessage('WHAps sudah Kadaluarsa, Silahkan Lakukan Update/Upgrade');
  Keluar1.Click;
end;

procedure TMain.Pesan1Click(Sender: TObject);
begin
  MessageForm:=TMessageForm.Create(Self);
  IsMessageOpen:=True;
end;

end.
