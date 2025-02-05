unit OrderFeeAddU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, WHUnit, ADODB, QuickRpt, QRCtrls,
  ZColorStringGrid, Buttons, ppParameter, ppBands, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

const
  InputBoxMessage = WM_USER + 200;

type
  TOrderFeeAdd = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    NoPolisi: TEdit;
    DriverDisp: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    Label13: TLabel;
    GroupBiaya: TGroupBox;
    NoBody: TEdit;
    Driver: TEdit;
    Label8: TLabel;
    QRDalamKota: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QNoSJ: TQRLabel;
    QTanggal: TQRLabel;
    QNama: TQRLabel;
    QNoResv: TQRLabel;
    QNoPolisi: TQRLabel;
    QRBand3: TQRBand;
    QBBM: TQRLabel;
    QFeeSupir: TQRLabel;
    QFeeKenek: TQRLabel;
    QTollParkir: TQRLabel;
    QTotal: TQRLabel;
    QRLuarKota: TQuickRep;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QLTanggal: TQRLabel;
    QLDriver: TQRLabel;
    QLBus: TQRLabel;
    QLCustomer: TQRLabel;
    QLRoute: TQRLabel;
    QLFeeSupir: TQRLabel;
    QLFeeKenek: TQRLabel;
    QLBBM: TQRLabel;
    QLTolParkir: TQRLabel;
    QLHari: TQRLabel;
    QLTotalFeeSupir: TQRLabel;
    QLTotalFeeKenek: TQRLabel;
    QLLain: TQRLabel;
    QLTotalBBM: TQRLabel;
    QLTotalTolParkir: TQRLabel;
    QLTotalLain: TQRLabel;
    QLTotal: TQRLabel;
    NoReservasi: TEdit;
    Label11: TLabel;
    Customer: TEdit;
    Label9: TLabel;
    Hari: TEdit;
    QLNoSJ: TQRLabel;
    QLNoReservasi: TQRLabel;
    QCopy: TQRLabel;
    QLCopy: TQRLabel;
    Seat: TEdit;
    Label21: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Route: TMemo;
    PickupPoint: TMemo;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    Label2: TLabel;
    GroupRupiah: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    GroupLiter: TGroupBox;
    BBMLiter: TEdit;
    Panel4: TPanel;
    GroupTotal: TGroupBox;
    Label18: TLabel;
    DriverFee: TMemo;
    BusBoyFee: TMemo;
    TollParking: TMemo;
    StayNight: TMemo;
    BBMTotalRupiah: TMemo;
    DriverFeeTotal: TMemo;
    BusBoyFeeTotal: TMemo;
    TollParkingTotal: TMemo;
    StayNightTotal: TMemo;
    TotalBayar: TMemo;
    Label19: TLabel;
    Remark: TMemo;
    Label20: TLabel;
    FromDate: TEdit;
    ToDate: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Group: TEdit;
    Label24: TLabel;
    Guide: TEdit;
    Label25: TLabel;
    GuideCellular: TEdit;
    Panel2: TPanel;
    BBMRupiah: TMemo;
    Label26: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    BusBoyFeeAdd: TMemo;
    TollParkingAdd: TMemo;
    StayNightAdd: TMemo;
    DriverFeeAdd: TMemo;
    NoSJ: TEdit;
    GroupBox3: TGroupBox;
    BBMAddLiter: TEdit;
    PanelSJ: TPanel;
    CariSJ: TSpeedButton;
    BBMAddRupiah: TMemo;
    GroupBox4: TGroupBox;
    BBMTotalLiter: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    TotalAdd: TMemo;
    ppReportUangOrder2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppNoPolisi2: TppLabel;
    ppNoOrder2: TppLabel;
    ppCopy2: TppLabel;
    ppTgl2: TppLabel;
    ppNoSJ2: TppLabel;
    ppDriver2: TppLabel;
    ppBBMFee2: TppLabel;
    ppDriverFee2: TppLabel;
    ppBusboyFee2: TppLabel;
    ppTolParking2: TppLabel;
    ppTotal2: TppLabel;
    ppLine2: TppLine;
    ppLabelOther2: TppLabel;
    ppOtherFee2: TppLabel;
    ppLogo2: TppImage;
    ppCompany2: TppLabel;
    ppAddress2: TppMemo;
    ppPhone2: TppLabel;
    ppFax2: TppLabel;
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
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    ppReportUangOrder: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppNoPolisi: TppLabel;
    ppNoOrder: TppLabel;
    ppCopy: TppLabel;
    ppTgl: TppLabel;
    ppNoSJ: TppLabel;
    ppDriver: TppLabel;
    ppBBMFee: TppLabel;
    ppDriverFee: TppLabel;
    ppBusboyFee: TppLabel;
    ppTolParking: TppLabel;
    ppTotal: TppLabel;
    ppLine1: TppLine;
    ppLabelOther: TppLabel;
    ppOtherFee: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppParameterList4: TppParameterList;
    ppReportUangOrderAdd: TppReport;
    ppHeaderBand2: TppHeaderBand;
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
    ppLabel32: TppLabel;
    ppLine3: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppParameterList2: TppParameterList;
    Toll: TMemo;
    TollAdd: TMemo;
    TollTotal: TMemo;
    Label12: TLabel;
    GroupBox5: TGroupBox;
    BusBoyFeeReimburse: TMemo;
    TollParkingReimburse: TMemo;
    DriverFeeReimburse: TMemo;
    TollReimburse: TMemo;
    Panel5: TPanel;
    Label27: TLabel;
    TotalReimburse: TMemo;
    Overtime: TMemo;
    OvertimeAdd: TMemo;
    XOvertimeReimburse: TMemo;
    OvertimeTotal: TMemo;
    BBMReimburse: TMemo;
    GroupBox6: TGroupBox;
    BBMSpbu: TMemo;
    GroupBox7: TGroupBox;
    BBMReimburseAddLiter: TEdit;
    GroupBox8: TGroupBox;
    BBMSpbuAddLiter: TEdit;
    Panel6: TPanel;
    Label28: TLabel;
    TotalSPBU: TMemo;
    Label31: TLabel;
    ListKunciCepat: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure HariKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);   
    procedure NoSJKeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeEnter(Sender: TObject);
    procedure BusBoyFeeEnter(Sender: TObject);
    procedure TollParkingEnter(Sender: TObject);
    procedure StayNightEnter(Sender: TObject);
    procedure DriverFeeExit(Sender: TObject);
    procedure BusBoyFeeExit(Sender: TObject);
    procedure TollParkingExit(Sender: TObject);
    procedure StayNightExit(Sender: TObject);
    procedure DriverFeeKeyPress(Sender: TObject; var Key: Char);
    procedure BusBoyFeeKeyPress(Sender: TObject; var Key: Char);
    procedure TollParkingKeyPress(Sender: TObject; var Key: Char);
    procedure StayNightKeyPress(Sender: TObject; var Key: Char);
    procedure AllDailyPackageClick(Sender: TObject);
    procedure BBMAddRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure BBMAddRupiahEnter(Sender: TObject);
    procedure BBMAddRupiahExit(Sender: TObject);
    procedure DriverFeeAddKeyPress(Sender: TObject; var Key: Char);
    procedure BusBoyFeeAddKeyPress(Sender: TObject; var Key: Char);
    procedure TollParkingAddKeyPress(Sender: TObject; var Key: Char);
    procedure StayNightAddKeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeAddEnter(Sender: TObject);
    procedure BusBoyFeeAddEnter(Sender: TObject);
    procedure TollParkingAddEnter(Sender: TObject);
    procedure StayNightAddEnter(Sender: TObject);
    procedure DriverFeeAddExit(Sender: TObject);
    procedure BusBoyFeeAddExit(Sender: TObject);
    procedure TollParkingAddExit(Sender: TObject);
    procedure StayNightAddExit(Sender: TObject);
    procedure CariSJClick(Sender: TObject);
    procedure BBMAddLiterEnter(Sender: TObject);
    procedure BBMAddLiterExit(Sender: TObject);
    procedure BBMAddLiterKeyPress(Sender: TObject; var Key: Char);
    procedure TollAddEnter(Sender: TObject);
    procedure TollAddExit(Sender: TObject);
    procedure TollAddKeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeReimburseEnter(Sender: TObject);
    procedure DriverFeeReimburseExit(Sender: TObject);
    procedure DriverFeeReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure BusBoyFeeReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure BusBoyFeeReimburseExit(Sender: TObject);
    procedure BusBoyFeeReimburseEnter(Sender: TObject);
    procedure TollReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure TollReimburseExit(Sender: TObject);
    procedure TollReimburseEnter(Sender: TObject);
    procedure TollParkingReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure TollParkingReimburseExit(Sender: TObject);
    procedure TollParkingReimburseEnter(Sender: TObject);
    procedure OvertimeEnter(Sender: TObject);
    procedure OvertimeExit(Sender: TObject);
    procedure OvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure OvertimeAddEnter(Sender: TObject);
    procedure OvertimeAddExit(Sender: TObject);
    procedure OvertimeAddKeyPress(Sender: TObject; var Key: Char);
    procedure XOvertimeReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure XOvertimeReimburseEnter(Sender: TObject);
    procedure XOvertimeReimburseExit(Sender: TObject);
    procedure BBMReimburseEnter(Sender: TObject);
    procedure BBMReimburseExit(Sender: TObject);
    procedure BBMReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure BBMSpbuEnter(Sender: TObject);
    procedure BBMSpbuExit(Sender: TObject);
    procedure BBMSpbuKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SJArr,BiayaArr:Array of TArrString30;
    IntRow,MinRowBiaya,MinRowService,BBMPerLiter,SolarPerLiter,GasPerLiter,TotalDays,FormNumber_Day,FormNumber_Days,Show_eToll:Integer;
    TransId,EmplId,OrderId,SJId:String;
    LockBudget,AllowUnlockNullBudget,LockBudgetIntegrate,LockBudgetRev:Boolean;

    IsInput, isIntegrate:Boolean;
    procedure Init;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure LoadData;
    procedure InitReport;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
  public
    { Public declarations }
    StrRemark_arrive :String;
    constructor Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True);Overload;
    procedure RePrint(Trans_Id:String);
    procedure RePrint2(Trans_Id:String);
    procedure SetSJId(SJ_Id:String);
  end;

var
  OrderFeeAdd: TOrderFeeAdd;
  TotalBiayaAwal : Integer;

implementation

uses MainU, Math, RePrintFormU, DB, OrderFeeListU, SPJBusListU,
  TimeInputFormU, AuthorizedFormU;

{$R *.dfm}

constructor TOrderFeeAdd.Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True);
begin
  SJId:=SJ_Id;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: ProductPriceList='+SJ_Id+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TOrderFeeAdd.Init;
var IntCount,IntCount2:Integer;
begin
  MinRowBiaya:=0;
  NoReservasi.Text:='';
  Customer.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  NoSJ.Text:='';
  Driver.Text:='';
  DriverDisp.Text:='';
  Tanggal.Text:='';
  FromDate.Text:='';
  ToDate.Text:='';
  Jam.Text:='';
  Hari.Text:='';
  BBMLiter.Text:='';
  DriverFee.Text:='';
  BusBoyFee.Text:='';
  TollParking.Text:='';
  Toll.Text:='';
  StayNight.Text:='';
  Overtime.Text:='';

  Route.Text:='';
  PickupPoint.Text:='';
  Remark.Text:='';
  BBMPerLiter:=0;
  GasPerLiter:=0;
  SolarPerLiter:=0;
  BBMAddRupiah.Text:='0';
  BBMAddLiter.Text:='0';
  BBMRupiah.Text:='0';
  BBMTotalLiter.Text:='0';
  BBMTotalRupiah.Text:='0';

  BBMSPBU.Text :='0';
  BBMSPBUAddLiter.Text :='0';

  BBMReimburse.Text :='0';
  BBMReimburseAddLiter.Text :='0';

  DriverFee.Text :='0';
  BusboyFee.Text :='0';
  Toll.Text :='0';
  TollParking.Text :='0';
  StayNight.Text :='0';
  Overtime.Text :='0';

  TotalAdd.Text := '0';
  TotalBayar.Text:='0';
  DriverFeeAdd.Text:='0';
  BusBoyFeeAdd.Text:='0';
  TollParkingAdd.Text:='0';
  TollAdd.Text:='0';
  TollTotal.Text:='0';

  StayNightAdd.Text:='0';
  OvertimeAdd.Text:='0';

  DriverFeeReimburse.Text:='0';
  BusBoyFeeReimburse.Text:='0';
  TollParkingReimburse.Text:='0';
  TollReimburse.Text:='0';
  //OvertimeReimburse.Text:='0';
  TotalReimburse.Text:='0';
  TotalSPBU.Text:='0';

  Seat.Text:='';
  DriverFeeTotal.Text:='0';
  BusboyFeeTotal.Text:='0';
  TollParkingTotal.Text:='0';
  StayNightTotal.Text:='0';
  OvertimeTotal.Text:='0';

  FormNumber_Day:=2;
  FormNumber_Days:=1;
end;

procedure TOrderFeeAdd.InitReport;
begin
  QNoSJ.Caption:='';
  QTanggal.Caption:='';
  QNama.Caption:='';
  QNoResv.Caption:='';
  QNoPolisi.Caption:='';
  QBBM.Caption:='';
  QFeeSupir.Caption:='';
  QFeeKenek.Caption:='';
  QTollParkir.Caption:='';
  QTotal.Caption:='';
  QLTanggal.Caption:='';
  QLNoSJ.Caption:='';
  QLNoReservasi.Caption:='';
  QLDriver.Caption:='';
  QLBus.Caption:='';
  QLRoute.Caption:='';
  QLCustomer.Caption:='';
  QLHari.Caption:='';
  QLFeeSupir.Caption:='';
  QLTotalFeeSupir.Caption:='';
  QLFeeKenek.Caption:='';
  QLTotalFeeKenek.Caption:='';
  QLBBM.Caption:='';
  QLTotalBBM.Caption:='';
  QLTolParkir.Caption:='';
  QLTotalTolParkir.Caption:='';
  QLLain.Caption:='';
  QLTotalLain.Caption:='';
  QLTotal.Caption:='';
end;

procedure TOrderFeeAdd.InitGridService;
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

procedure TOrderFeeAdd.SetSJId(SJ_Id:String);
var StrQry,StrOrderId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  isIntegrate := False;
  if SJ_Id<>'' then begin
    BersihkanClick(Self);
    SJId:=SJ_Id;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin

      StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Lock_Budget_Integrate_CompanyId_'+CompanyId)+') AND (active=1);';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
          if Qry.FieldValues['value_string']=1 then LockBudgetIntegrate:=True;
          if Qry.FieldValues['value_string']=0 then LockBudgetIntegrate:=False;
      end;
      Qry.Close;

      StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Lock_Budget_Revision_CompanyId_'+CompanyId)+') AND (active=1);';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
          if Qry.FieldValues['value_string']=1 then LockBudgetRev:=True;
          if Qry.FieldValues['value_string']=0 then LockBudgetRev:=False;
      end;
      Qry.Close;

      StrQry:='EXEC GetVhcOutDetail '+QuotedStr(SJId)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if (Qry.RecordCount>0) then begin
        NoSJ.Text:=Qry.FieldValues['vhc_trans_id'];

        if LockBudgetIntegrate then begin
          if (Qry.FieldValues['isIntegrate'])=1 then begin
            isIntegrate:=True;
            ShowMessage('Uang Order terkunci karena sudah diposting ke Integrate'+#13#10+'Silahkan hubungi Finance');
            DisableInput;
          end else begin
            if LockBudgetRev then begin
              if (Qry.FieldValues['isLockOrderFee'])=1 then begin
                ShowMessage('Uang Order terkunci'+#13#10+'Silahkan hubungi Finance');
                DisableInput;
              end;
            end;
          end;
        end else begin
          if LockBudgetRev then begin
            if (Qry.FieldValues['isLockOrderFee'])=1 then begin
              ShowMessage('Uang Order terkunci'+#13#10+'Silahkan hubungi Finance');
              DisableInput;
            end;
          end;
        end;

        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        Driver.Text:=Qry.FieldValues['employee_id'];
        DriverDisp.Text:=Qry.FieldValues['name'];
        NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
        Customer.Text:=Qry.FieldValues['customer_name'];
        Hari.Text:=Qry.FieldValues['day'];
        TotalDays:=Qry.FieldValues['day'];
        Tanggal.Text:=Qry.FieldValues['from_dates'];
        Jam.Text:=Qry.FieldValues['from_time'];
        Seat.Text:=Qry.FieldValues['seat'];
        Route.Text:=Qry.FieldValues['route'];
        if Qry.FieldValues['pickup_point']<>NULL then PickupPoint.Text:=Qry.FieldValues['pickup_point'];
        if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
        FromDate.Text:=Qry.FieldValues['from_dates'];
        ToDate.Text:=Qry.FieldValues['to_dates'];
        if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
        if Qry.FieldValues['field_contact_cellular_no']<> NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'] else GuideCellular.Text:='';
//        GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        //if Qry.FieldValues['fuel_price']>0 then begin
          BBMTotalRupiah.Text:=IToCurr(Qry.FieldValues['fuel_spbu_price'] + Qry.FieldValues['fuel_budget_price'] + Qry.FieldValues['fuel_reimburse_price']);
          BBMTotalLiter.Text:=Qry.FieldValues['fuel_spbu_litre'] + Qry.FieldValues['fuel_budget_litre'] + Qry.FieldValues['fuel_reimburse_litre'];

          BBMRupiah.Text:= IToCurr(Qry.FieldValues['fuel_budget_price']);
          BBMLiter.Text:=  Qry.FieldValues['fuel_budget_litre'];

          BBMReimburse.Text:= IToCurr(Qry.FieldValues['fuel_reimburse_price']);
          BBMReimburseAddLiter.Text:= Qry.FieldValues['fuel_reimburse_litre'];

          BBMSpbu.Text:= IToCurr(Qry.FieldValues['fuel_spbu_price']);
          BBMSpbuAddLiter.Text:= Qry.FieldValues['fuel_spbu_litre'];

        (*
        end else begin
          BBMTotalRupiah.Text:='0';
          BBMTotalLiter.Text:='0';
          BBMRupiah.Text:='0';
          BBMLiter.Text:='0';
        end;
        *)
        if Qry.FieldValues['fee_supir']<>NULL then begin
          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']);
          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']);
        end else begin
          DriverFeeTotal.Text:='0';
          DriverFee.Text:='0';
        end;
        if Qry.FieldValues['fee_kenek']<>NULL then begin
          BusBoyFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_kenek']);
          BusBoyFee.Text:=IToCurr(Qry.FieldValues['fee_kenek'])
        end else begin
          BusBoyFeeTotal.Text:='0';
          BusBoyFee.Text:='0';
        end;
        if Qry.FieldValues['tol_parking']<>NULL then begin
          TollParkingTotal.Text:=IToCurr(Qry.FieldValues['tol_parking']);
          TollParking.Text:=IToCurr(Qry.FieldValues['tol_parking'])
        end else begin
          TollParkingTotal.Text:='0';
          TollParking.Text:='0';
        end;
        
        if Qry.FieldValues['tol']<>NULL then begin
          TollTotal.Text:=IToCurr(Qry.FieldValues['tol']);
          Toll.Text:=IToCurr(Qry.FieldValues['tol'])
        end else begin
          TollTotal.Text:='0';
          Toll.Text:='0';
        end;
        if Qry.FieldValues['overnight']<>NULL then begin
          StayNightTotal.Text:=IToCurr(Qry.FieldValues['overnight']);
          StayNight.Text:=IToCurr(Qry.FieldValues['overnight']);
        end else begin
          StayNightTotal.Text:='0';
          StayNight.Text:='0';
        end;

        if Qry.FieldValues['overtime']<>NULL then begin
          OvertimeTotal.Text:=IToCurr(Qry.FieldValues['overtime']);
          Overtime.Text:=IToCurr(Qry.FieldValues['overtime'])
        end else begin
          OvertimeTotal.Text:='0';
          Overtime.Text:='0';
        end;

        {Reimburse}
        if Qry.FieldValues['fee_supir_reimburse']<>NULL then begin
          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']+Qry.FieldValues['fee_supir_reimburse']);
          DriverFeeReimburse.Text:=IToCurr(Qry.FieldValues['fee_supir_reimburse']);
        end else begin
          DriverFeeTotal.Text:='0';
          DriverFeeReimburse.Text:='0';
        end;
        if Qry.FieldValues['fee_kenek_reimburse']<>NULL then begin
          BusBoyFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_kenek']+Qry.FieldValues['fee_kenek_reimburse']);
          BusBoyFeeReimburse.Text:=IToCurr(Qry.FieldValues['fee_kenek_reimburse'])
        end else begin
          BusBoyFeeTotal.Text:='0';
          BusBoyFeeReimburse.Text:='0';
        end;
        if Qry.FieldValues['parkir_reimburse']<>NULL then begin
          TollParkingTotal.Text:=IToCurr(Qry.FieldValues['tol_parking']+Qry.FieldValues['parkir_reimburse']);
          TollParkingReimburse.Text:=IToCurr(Qry.FieldValues['parkir_reimburse'])
        end else begin
          TollParkingTotal.Text:='0';
          TollParkingReimburse.Text:='0';
        end;
        
        if Qry.FieldValues['tol_reimburse']<>NULL then begin
          TollTotal.Text:=IToCurr(Qry.FieldValues['tol']+Qry.FieldValues['tol_reimburse']);
          TollReimburse.Text:=IToCurr(Qry.FieldValues['tol_reimburse'])
        end else begin
          TollTotal.Text:='0';
          TollReimburse.Text:='0';
        end;

        Calculate;
        TotalBiayaAwal := SToInt(ToString(TotalBayar.Text));
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TOrderFeeAdd.RefreshCombo;
var StrQry,StrOrderId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(SJArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
{    StrQry:='EXEC GetVhcOutList2 '+LocationId+',1,2; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[IntCount][1]:=Qry.FieldValues['body_id'];
      SJArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                   ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      SJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
      SJArr[IntCount][4]:=Qry.FieldValues['name'];
      SJArr[IntCount][5]:=Qry.FieldValues['out_date'];
      if Qry.FieldValues['out_ordo_km']<>NULL then SJArr[IntCount][7]:=Qry.FieldValues['out_ordo_km'];
      if Qry.FieldValues['fuel_price']<>NULL then SJArr[IntCount][8]:=Qry.FieldValues['fuel_price']
      else SJArr[IntCount][8]:='';
      if Qry.FieldValues['gas_price']<>NULL then SJArr[IntCount][9]:=Qry.FieldValues['gas_price']
      else SJArr[IntCount][9]:='';
      SJArr[IntCount][10]:=Qry.FieldValues['customer_order_id'];
      SJArr[IntCount][11]:=Qry.FieldValues['customer_name'];
      SJArr[IntCount][12]:=Qry.FieldValues['day'];
      SJArr[IntCount][13]:=Qry.FieldValues['from_dates'];
      SJArr[IntCount][14]:=Qry.FieldValues['from_time'];
      SJArr[IntCount][15]:=Qry.FieldValues['seat'];
      SJArr[IntCount][16]:=Qry.FieldValues['route'];
      if Qry.FieldValues['pickup_point']<>NULL then SJArr[IntCount][17]:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['description']<>NULL then SJArr[IntCount][18]:=Qry.FieldValues['description'];
      SJArr[IntCount][19]:=Qry.FieldValues['to_dates'];
      SJArr[IntCount][20]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['group_name']<>NULL then SJArr[IntCount][21]:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then SJArr[IntCount][22]:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then SJArr[IntCount][23]:=Qry.FieldValues['field_contact_cellular_no'];
      if Qry.FieldValues['daily_package']<>NULL then SJArr[IntCount][24]:='1' else SJArr[IntCount][24]:='0';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
}
{    StrQry:='EXEC GetVhcOutDetail '+QuotedStr(SJId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      IntCount:=Length(SJArr);
      SetLength(SJArr,Length(SJArr)+1);
      SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[IntCount][1]:=Qry.FieldValues['body_id'];
      SJArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                   ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      SJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
      SJArr[IntCount][4]:=Qry.FieldValues['name'];
      SJArr[IntCount][5]:=Qry.FieldValues['out_date'];
      if Qry.FieldValues['out_ordo_km']<>NULL then SJArr[IntCount][7]:=Qry.FieldValues['out_ordo_km'];
      if Qry.FieldValues['fuel_price']<>NULL then SJArr[IntCount][8]:=Qry.FieldValues['fuel_price']
      else SJArr[IntCount][8]:='';
      if Qry.FieldValues['gas_price']<>NULL then SJArr[IntCount][9]:=Qry.FieldValues['gas_price']
      else SJArr[IntCount][9]:='';
      SJArr[IntCount][10]:=Qry.FieldValues['customer_order_id'];
      SJArr[IntCount][11]:=Qry.FieldValues['customer_name'];
      SJArr[IntCount][12]:=Qry.FieldValues['day'];
      SJArr[IntCount][13]:=Qry.FieldValues['from_dates'];
      SJArr[IntCount][14]:=Qry.FieldValues['from_time'];
      SJArr[IntCount][15]:=Qry.FieldValues['seat'];
      SJArr[IntCount][16]:=Qry.FieldValues['route'];
      if Qry.FieldValues['pickup_point']<>NULL then SJArr[IntCount][17]:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['description']<>NULL then SJArr[IntCount][18]:=Qry.FieldValues['description'];
      SJArr[IntCount][19]:=Qry.FieldValues['to_dates'];
      SJArr[IntCount][20]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['group_name']<>NULL then SJArr[IntCount][21]:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then SJArr[IntCount][22]:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then SJArr[IntCount][23]:=Qry.FieldValues['field_contact_cellular_no'];
      if Qry.FieldValues['daily_package']<>NULL then SJArr[IntCount][24]:='1' else SJArr[IntCount][24]:='0';
    end;
    Qry.Close;
}
    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('OrderFee_Form_Day_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then FormNumber_Day:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;
    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('OrderFee_Form_Days_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then FormNumber_Days:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;

    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('Show_eToll_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then Show_eToll:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;

    StrQry:='EXEC GetPrice;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      SolarPerLiter:=Qry.FieldValues['diesel_price_litre'];
      BBMPerLiter:=Qry.FieldValues['fuel_price_litre'];
      GasPerLiter:=Qry.FieldValues['gas_price_litre'];
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.StatusUpdate('Premium : '+IntToStr(BBMPerLiter)+'/Ltr, Solar : '+IntToStr(SolarPerLiter)+'/Ltr, Gas : '+IntToStr(GasPerLiter)+'/Ltr','');
  Main.M_Normal;
end;

procedure TOrderFeeAdd.LoadData;
var StrQry,StrOrderId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
{  Main.M_Busy;
//  NoSJ.ItemIndex:=NoSJ.Items.IndexOf(SJId);
  CheckData;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcOutDetail '+QuotedStr(SJId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['fuel_price']<>NULL then begin
        NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
        OrderId:=NoReservasi.Text;
        NoSJ.Text:=Qry.FieldValues['vhc_trans_id'];
        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        Driver.Text:=Qry.FieldValues['employee_id'];
        DriverDisp.Text:=Qry.FieldValues['name'];
        Customer.Text:=Qry.FieldValues['customer_name'];
        Hari.Text:=Qry.FieldValues['day'];
        Tanggal.Text:=Qry.FieldValues['from_dates'];
        Jam.Text:=Qry.FieldValues['from_time'];
        Seat.Text:=Qry.FieldValues['seat'];
        Route.Text:=Qry.FieldValues['route'];
        if Qry.FieldValues['pickup_point']<>NULL then PickupPoint.Text:=Qry.FieldValues['pickup_point'];
        if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
        FromDate.Text:=Qry.FieldValues['from_dates'];
        ToDate.Text:=Qry.FieldValues['to_dates'];
        BBMTotalRupiah.Text:=IToCurr(Qry.FieldValues['fuel_price']);
        BBMTotalLiter.Text:=Qry.FieldValues['fuel_litre'];
        BBMRupiah.Text:=Qry.FieldValues['fuel_price'];
        BBMLiter.Text:=Qry.FieldValues['fuel_litre'];
        if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
        if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        if Qry.FieldValues['fee_supir']<>NULL then begin
          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']);
          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']/Qry.FieldValues['day']);
        end else begin
          DriverFeeTotal.Text:='0';
          DriverFee.Text:='0';
        end;
        if Qry.FieldValues['fee_kenek']<>NULL then begin
          BusBoyFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_kenek']);
          BusBoyFee.Text:=IToCurr(Qry.FieldValues['fee_kenek']/Qry.FieldValues['day'])
        end else begin
          BusBoyFeeTotal.Text:='0';
          BusBoyFee.Text:='0';
        end;
        if Qry.FieldValues['tol_parking']<>NULL then begin
          TollParkingTotal.Text:=IToCurr(Qry.FieldValues['tol_parking']);
          TollParking.Text:=IToCurr(Qry.FieldValues['tol_parking']/Qry.FieldValues['day'])
        end else begin
          TollParkingTotal.Text:='0';
          TollParking.Text:='0';
        end;
        if Qry.FieldValues['overnight']<>NULL then begin
          StayNightTotal.Text:=IToCurr(Qry.FieldValues['overnight']);
          StayNight.Text:=IToCurr(Qry.FieldValues['overnight']/Qry.FieldValues['day']);
        end else begin
          StayNightTotal.Text:='0';
          StayNight.Text:='0';
        end;
      end;
    end;
    Qry.Close;
    StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(OrderId)+';';
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
  BBMAddRupiah.SetFocus;
}
end;

procedure TOrderFeeAdd.Calculate;
var TotalBBM,TotalDriverFee,TotalBusBoyFee,TotalTollParking,TotalToll,
    TotalStayNight,TotalBiaya,IntCount,TotalOvertime:Integer;
begin
  TotalBiaya:=0;
  TotalDriverFee:=0;
  TotalBusBoyFee:=0;
  TotalTollParking:=0;
  TotalToll:=0;
  TotalStayNight:=0;
  TotalOvertime:=0;
  if Hari.Text<>'' then begin
    if ToString(DriverFeeAdd.Text )<>'' then begin
      TotalDriverFee:=SToInt(DriverFee.Text)+SToInt(DriverFeeAdd.Text);
    end;
    if ToString(DriverFeeReimburse.Text )<>'' then begin
      TotalDriverFee:=SToInt(DriverFee.Text)+SToInt(DriverFeeAdd.Text)+SToInt(DriverFeeReimburse.Text);
    end;

    if ToString(BusBoyFeeAdd.Text )<>'' then begin
      TotalBusBoyFee:=SToInt(BusBoyFee.Text)+SToInt(BusBoyFeeAdd.Text);
    end;
    if ToString(BusBoyFeeReimburse.Text )<>'' then begin
      TotalBusBoyFee:=SToInt(BusBoyFee.Text)+SToInt(BusBoyFeeAdd.Text)+SToInt(BusBoyFeeReimburse.Text);
    end;

    if ToString(TollParkingAdd.Text )<>'' then begin
      TotalTollParking:=SToInt(TollParking.Text)+SToInt(TollParkingAdd.Text);
    end;
    if ToString(TollParkingReimburse.Text )<>'' then begin
      TotalTollParking:=SToInt(TollParking.Text)+SToInt(TollParkingAdd.Text)+SToInt(TollParkingReimburse.Text);
    end;

    if ToString(TollAdd.Text )<>'' then begin
      TotalToll:=SToInt(Toll.Text)+SToInt(TollAdd.Text);
    end;
    if ToString(TollReimburse.Text )<>'' then begin
      TotalToll:=SToInt(Toll.Text)+SToInt(TollAdd.Text)+SToInt(TollReimburse.Text);
    end;

    if ToString(StayNightAdd.Text )<>'' then begin
      TotalStayNight:=SToInt(StayNight.Text)+SToInt(StayNightAdd.Text);
    end;
    if ToString(OvertimeAdd.Text )<>'' then begin
      TotalOvertime:=SToInt(Overtime.Text)+SToInt(OvertimeAdd.Text);
    end;

  end;
  DriverFeeTotal.Text:=IToCurr(TotalDriverFee);
  BusBoyFeeTotal.Text:=IToCurr(TotalBusBoyFee);
  TollParkingTotal.Text:=IToCurr(TotalTollParking);
  TollTotal.Text:=IToCurr(TotalToll);
  StayNightTotal.Text:=IToCurr(TotalStayNight);

  OvertimeTotal.Text:=IToCurr(TotalOvertime);

  TotalBiaya:=TotalDriverFee+TotalBusBoyFee+TotalTollParking+TotalToll+TotalStayNight+TotalOvertime;
  TotalBayar.Text:=IToCurr(SToInt(BBMTotalRupiah.Text)+TotalBiaya);
  TotalAdd.Text:=IToCurr(
                  SToInt(BBMAddRupiah.Text)+
                  SToInt(DriverFeeAdd.Text)+SToInt(BusBoyFeeAdd.Text)+
                  SToInt(TollParkingAdd.Text)+SToInt(TollAdd.Text)+SToInt(StayNightAdd.Text)+SToInt(OvertimeAdd.Text));

  TotalReimburse.Text:=IToCurr(SToInt(DriverFeeReimburse.Text)+SToInt(BusBoyFeeReimburse.Text)+
                       SToInt(TollParkingReimburse.Text)+SToInt(TollReimburse.Text)+SToInt(BBMReimburse.Text));//+SToInt(OvertimeReimburse.Text)

  TotalSPBU.Text:=IToCurr(SToInt(BBMSPBU.Text));

end;


procedure TOrderFeeAdd.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGridService;
  RefreshCombo;
  if IsInput=False then DisableInput;
  if SJId<>'' then LoadData;
  Main.M_Normal;
end;


procedure TOrderFeeAdd.GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TOrderFeeAdd.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  RefreshCombo;
  EnableInput;
  Main.M_Normal;
end;

procedure TOrderFeeAdd.SimpanClick(Sender: TObject);
var StrQry,StrEMessage,StrMsg:String;
    Qry:TADOQuery;
    IsOk,IsCetak,IsAuth,IsEmplTrans:Boolean;
    FuelPrice,FuelLitre,GasPrice,GasLitre,TransType,Amount,Value,Value2:String;
    Count:Integer;
    NoSJArr:Array of String;
begin
  IsCetak:=False;
  IsOk:=True;
  {if (  ( (ToString(BBMAddRupiah.Text)<>'0') AND (ToString(BBMAddRupiah.Text)<>'')
    AND (ToString(TotalBayar.Text)<>'0')  AND (SToInt(ToString(TotalBayar.Text))>0) )  ) then begin}

  //StrTotal:=IntToStr( StrToInt((ToString(TotalAdd.Text))) + strtoint(ToString(TotalReimburse.Text)));//TotalAdd.Text;

  if (ToString(TotalBayar.Text)<>'0')  AND (SToInt(ToString(TotalBayar.Text))>0) then begin
    StrMsg:='Total Dibayarkan Rp.'+IToCurr( SToInt(ToString(TotalBayar.Text)) - TotalBiayaAwal )+Chr(13)+Chr(13)+'Sudah dihitung dengan benar ?';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Main.M_Busy;
    if (Main.OpenDb) AND (MessageBox(0,PChar(StrMsg),'Order Fee',MB_OKCANCEL or MB_ICONQUESTION) = 1) then begin
      DisableInput;
      Main.TransStart;
      GasPrice:='0';
      GasLitre:='0';
      if SJId<>'' then begin
        TransId:=SJId;
        StrQry:='';
        if BBMAddRupiah.Text<>'0' then begin
          TransType:=QuotedStr('140105');
          Amount:=ToString(BBMAddRupiah.Text);
          Value:=ToString(BBMAddRupiah.Text);
          Value2:=StringReplace(ToString(BBMAddLiter.Text),',','.',[rfReplaceAll]);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,value,value2,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Value+','+Value2+','+Amount+',GETDATE(),'+QuotedStr(User)+');';

        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
        StrQry:='';
        if (DriverFeeAdd.Text<>'0') then begin
          TransType:=QuotedStr('140101');
          Amount:=ToString(DriverFeeAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (1)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrQry:='';
        if (BusBoyFeeAdd.Text<>'0') then begin
          TransType:=QuotedStr('140102');
          Amount:=ToString(BusBoyFeeAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee detail (1)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrQry:='';
        if TollParkingAdd.Text<>'0' then begin
          TransType:=QuotedStr('140103');
          Amount:=ToString(TollParkingAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (3)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrQry:='';
        if TollAdd.Text<>'0' then begin
          TransType:=QuotedStr('140106');
          Amount:=ToString(TollAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (4)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:='';
        if StayNightAdd.Text<>'0' then begin
          TransType:=QuotedStr('140104');
          Amount:=ToString(StayNightAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (5)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:=''; { BBM SPBU VHC TRANS }
        StrQry:=' UPDATE wh_vhc_trans SET '+
                '  fuel_litre='+QuotedStr(StringReplace(StringReplace(BBMSpbuAddLiter.Text,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]))+
                ' ,fuel_price='+ToString(BBMSpbu.Text)+
                ' ,fuel_reimburse_litre='+QuotedStr(StringReplace(StringReplace(BBMReimburseAddLiter.Text,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]))+
                ' ,fuel_reimburse_price='+ToString(BBMReimburse.Text)+
                ' ,isLockOrderFee=1 '+
                ' WHERE vhc_trans_id='+QuotedStr(TransId)+' ;';

        {SPBU}
        StrQry:=StrQry+' UPDATE wh_vhc_trans_detail SET Status=0 WHERE Status=1 AND vhc_trans_id='+QuotedStr(TransId)+' AND '+
                ' transaction_type_id in (140110) ;';
        if BBMSpbu.Text<>'0' then begin
          TransType:=QuotedStr('140110');
          Amount:=ToString(BBMSpbu.Text);
          Value :=Amount;
          Value2:=StringReplace(ToString(BBMSpbuAddLiter.Text),',','.',[rfReplaceAll]);

          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,value2,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Value+','+Value2+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (SPBU1)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        {Reimburse}
        StrQry:=''; {BBM Reimburse}
        StrQry:=' UPDATE wh_vhc_trans_detail SET Status=0 WHERE Status=1 AND vhc_trans_id='+QuotedStr(TransId)+' AND '+
                ' transaction_type_id in (140107,140108,140109,140111,140112,140113) ;';  // Cek 140113
        if BBMReimburse.Text<>'0' then begin
          TransType:=QuotedStr('140107');
          Amount:=ToString(BBMReimburse.Text);
          Value :=Amount;
          Value2:=StringReplace(ToString(BBMReimburseAddLiter.Text),',','.',[rfReplaceAll]);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,value2,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Value+','+Value2+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R1)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:='';
        if DriverFeeReimburse.Text<>'0' then begin
          TransType:=QuotedStr('140108');
          Amount:=ToString(DriverFeeReimburse.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R1)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:='';
        if TollReimburse.Text<>'0' then begin
          TransType:=QuotedStr('140109');
          Amount:=ToString(TollReimburse.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R3)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        
        StrQry:='';
        if BusBoyFeeReimburse.Text<>'0' then begin
          TransType:=QuotedStr('140111');
          Amount:=ToString(BusBoyFeeReimburse.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R2)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:='';
        if TollParkingReimburse.Text<>'0' then begin
          TransType:=QuotedStr('140112');
          Amount:=ToString(TollParkingReimburse.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R4)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        StrQry:='';
        if OvertimeAdd.Text<>'0' then begin
          TransType:=QuotedStr('140113');
          Amount:=ToString(OvertimeAdd.Text);
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,remark_arrive,update_time,update_user)'+
                  ' VALUES ('+QuotedStr(TransId)+','+TransType+','+Amount+','+Amount+','+QuotedStr(StrRemark_arrive)+',GETDATE(),'+QuotedStr(User)+');';
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Tambahan Order Fee (R5)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

      end;
      if IsOk then begin
        Main.TransCommit;
        if MessageBox(0,'Penambahan Uang Order'+Chr(13)+Chr(13)+'    Cetak Slip ?','Penambahan Uang Order',MB_OKCANCEL or MB_ICONQUESTION) = 1 then
          IsCetak:=True;
      end else begin
        EnableInput;
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Penambahan Uang Order',MB_OK or MB_ICONWARNING);
      end;
    end else begin
      IsOk:=False;
      StrMsg:='Kolom Tidak boleh Kosong';
    end;
    Qry.Close;
    Qry.Destroy;
    if (IsCetak) then RePrint2(TransId);
  end else
    MessageBox(0,'Silahkan Isi semua kolom','Order Fee',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;
{
procedure TOrderFeeAdd.RePrint(Trans_Id:String);
var Qry:TADOQuery;
    StrQry,StrTransId:String;
    Total,TotalHari,Amount,TotalAmount:Integer;
begin
  RePrintForm.ReportName:='Order Fee';
  RePrintForm.ReportId:=Trans_Id;
  if RePrintForm.ShowModal=1 then begin
    Total:=0;
    InitReport;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVhcOutDetail '+QuotedStr(Trans_Id)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      TotalHari:=Qry.FieldValues['day'];
{      if TotalHari>1 then begin
        if RePrintForm.Copy>0 then QLCopy.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else QLCopy.Caption:='';
        QLTanggal.Caption:=Qry.FieldValues['from_dates'];
        QLNoSJ.Caption:=Qry.FieldValues['vhc_trans_id'];
        QLNoReservasi.Caption:=Qry.FieldValues['customer_order_id'];
        QLDriver.Caption:=Qry.FieldValues['name'];
        QLBus.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        QLCustomer.Caption:=Qry.FieldValues['customer_name'];
        QLHari.Caption:=Qry.FieldValues['day'];
        if Qry.FieldValues['fuel_price']>0 then begin
//          QLBBM.Caption:=IntToStr(Qry.FieldValues['fuel_litre'])+' Ltr x Rp. '+IToCurr(Qry.FieldValues['fuel_price']);
          QLBBM.Caption:=IntToStr(Qry.FieldValues['fuel_litre'])+' Ltr';
          QLTotalBBM.Caption:=IToCurr(Qry.FieldValues['fuel_price']);
          Total:=Total+Qry.FieldValues['fuel_price'];
        end else begin
//          QLBBM.Caption:=IntToStr(Qry.FieldValues['gas_litre'])+' Ltr x Rp. '+IToCurr(Qry.FieldValues['gas_price']);
          QLBBM.Caption:=IntToStr(Qry.FieldValues['gas_litre'])+' Ltr ';
          QLTotalBBM.Caption:=Qry.FieldValues['gas_price'];
          Total:=Total+Qry.FieldValues['gas_price'];
        end;
        Qry.Close;
        StrQry:='SELECT * FROM wh_vhc_trans_detail_detail WHERE vhc_trans_id='+QuotedStr(Trans_Id)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then while not Qry.Eof do begin
          QLRoute.Caption:=Qry.FieldValues['route'];
          Qry.Next;
        end;
        Qry.Close;
        StrTransId:=QuotedStr('140101');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT a.amount,a.total_amount FROM wh_vhc_trans_detail a '+
                'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'];
          if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'];
        end;
        QLFeeSupir.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeSupir.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        StrTransId:=QuotedStr('140102');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT a.amount,a.total_amount FROM wh_vhc_trans_detail a '+
                'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
          if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
        end;
        QLFeeKenek.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeKenek.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        StrTransId:=QuotedStr('140103');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT a.amount,a.total_amount FROM wh_vhc_trans_detail a '+
                'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
          if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
        end;
        QLTolParkir.Caption:=IToCurr(Amount);
        QLTotalTolParkir.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        StrTransId:=QuotedStr('140104');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT a.amount,a.total_amount FROM wh_vhc_trans_detail a '+
                'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
          if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
        end;
        QLLain.Caption:=IToCurr(Amount);
        QLTotalLain.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        QLTotal.Caption:=IToCurr(Total);
        QRLuarKota.Prepare;
        Main.M_Normal;
        QRLuarKota.Preview;
      end else begin
}
{        if RePrintForm.Copy>0 then QCopy.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else QCopy.Caption:='';
        QNoSJ.Caption:=Qry.FieldValues['vhc_trans_id'];
        QTanggal.Caption:=Qry.FieldValues['from_dates'];
        QNama.Caption:=Qry.FieldValues['name'];
        QNoResv.Caption:=Qry.FieldValues['customer_order_id'];
        QNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        Qry.Close;
        QBBM.Caption:=BBMAddRupiah.Text;
        Total:=Total+SToInt(BBMAddRupiah.Text);
        QFeeSupir.Caption:=DriverFeeAdd.Text;
        Total:=Total+SToInt(DriverFeeAdd.Text);
        QFeeKenek.Caption:=BusBoyFeeAdd.Text;
        Total:=Total+SToInt(BusBoyFeeAdd.Text);
        QTollParkir.Caption:=TollParkingAdd.Text;
        Total:=Total+SToInt(TollParkingAdd.Text);
        Qry.Close;
        QTotal.Caption:=IToCurr(Total);
        QRDalamKota.Prepare;
        Main.M_Normal;
        QRDalamKota.Preview;
//      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;
}

procedure TOrderFeeAdd.PreparePrint;
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
      if (FormNumber_Day=3) or (FormNumber_Days=3) then begin
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
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderFeeAdd.RePrint(Trans_Id:String);
var Qry:TADOQuery;
    StrQry,StrTransId:String;
    StrTanggal,StrNoReservasi,StrNoSJ,StrDriverName,StrNoPolisi,StrCustomer,StrBBMAmount,StrBBMFeeTotal:String;
    StrDriverFee,StrDriverFeeTotal,StrBusBoyFee,StrBusBoyFeeTotal,StrTolParkir,StrTolParkirTotal,StrOther,StrOtherTotal,StrTotal,StrCopy,StrHari,StrRoute:String;
    Total,TotalHari,Amount,TotalAmount,FormNumber:Integer;
begin
  RePrintForm.ReportName:='Order Fee';
  RePrintForm.ReportId:=Trans_Id;
  if RePrintForm.ShowModal=1 then begin
    Total:=0;
    InitReport;
    PreparePrint;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVhcOutDetail '+QuotedStr(Trans_Id)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      TotalHari:=Qry.FieldValues['day'];
      if TotalHari>1 then FormNumber:=FormNumber_Days
      else FormNumber:=FormNumber_Day;
      if RePrintForm.Copy>0 then StrCopy:='Copy ke-'+IntToStr(RePrintForm.Copy) else StrCopy:='';
      StrTanggal:=Qry.FieldValues['from_dates'];
      StrNoSJ:=Qry.FieldValues['vhc_trans_id'];
      StrNoReservasi:=Qry.FieldValues['customer_order_id'];
      StrDriverName:=Qry.FieldValues['name'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        StrNoPolisi:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        StrNoPolisi:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      StrCustomer:=Qry.FieldValues['customer_name'];
      StrHari:=Qry.FieldValues['day'];
      if Qry.FieldValues['fuel_budget_price']>0 then begin
        StrBBMAmount:=IntToStr(Qry.FieldValues['fuel_budget_litre']);
        StrBBMFeeTotal:=IToCurr(Qry.FieldValues['fuel_budget_price']);
        Total:=Total+Qry.FieldValues['fuel_budget_price'];
      end else begin
        StrBBMAmount:=IntToStr(Qry.FieldValues['gas_litre']);
        StrBBMFeeTotal:=Qry.FieldValues['gas_price'];
        Total:=Total+Qry.FieldValues['gas_price'];
      end;
      Qry.Close;
      StrQry:='SELECT * FROM wh_vhc_trans_detail_detail WHERE vhc_trans_id='+QuotedStr(Trans_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not Qry.Eof do begin
        StrRoute:=Qry.FieldValues['route'];
        Qry.Next;
      end;
      Qry.Close;
      StrTransId:=QuotedStr('140101');
      Amount:=0;
      TotalAmount:=0;
      StrQry:='SELECT SUM(a.amount) AS amount,SUM(a.total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
              'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
              'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'];
        if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'];
      end;
      StrDriverFee:=IToCurr(Amount);
      StrDriverFeeTotal:=IToCurr(TotalAmount);
      Total:=Total+TotalAmount;
      Qry.Close;
      StrTransId:=QuotedStr('140102');
      Amount:=0;
      TotalAmount:=0;
      StrQry:='SELECT SUM(a.amount) AS amount ,SUM(a.total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
              'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
              'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
        if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
      end;
      StrBusBoyFee:=IToCurr(Amount);
      StrBusBoyFeeTotal:=IToCurr(TotalAmount);
      Total:=Total+TotalAmount;
      Qry.Close;
      StrTransId:=QuotedStr('140103');
      Amount:=0;
      TotalAmount:=0;
      StrQry:='SELECT SUM(a.amount) as amount,SUM(a.total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
              'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
              'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
        if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
      end;
      StrTolParkir:=IToCurr(Amount);
      StrTolParkirTotal:=IToCurr(TotalAmount);
      Total:=Total+TotalAmount;
      Qry.Close;
      StrTransId:=QuotedStr('140104');
      Amount:=0;
      TotalAmount:=0;
      StrQry:='SELECT SUM(a.amount) AS amount,SUM(a.total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
              'INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
              'WHERE vhc_trans_id='+QuotedStr(Trans_Id)+' AND (a.transaction_type_id='+StrTransId+') AND (status=1);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if (Qry.FieldValues['amount']<>NULL) then Amount:=Qry.FieldValues['amount'] else Amount:=0;
        if (Qry.FieldValues['total_amount']<>NULL) then TotalAmount:=Qry.FieldValues['total_amount'] else TotalAmount:=0;
      end;
      StrOther:=IToCurr(Amount);
      StrOtherTotal:=IToCurr(TotalAmount);
      Total:=Total+TotalAmount;
      Qry.Close;
      StrTotal:=IToCurr(Total);
      Main.M_Normal;
{      if FormNumber=1 then begin
        QLCopy.Caption:=StrCopy;
        QLTanggal.Caption:=StrTanggal;
        QLNoSJ.Caption:=StrNoSJ;
        QLNoReservasi.Caption:=StrNoReservasi;
        QLDriver.Caption:=StrDriverName;
        QLBus.Caption:=StrNoPolisi;
        QLCustomer.Caption:=StrCustomer;
        QLHari.Caption:=StrHari;
        QLBBM.Caption:=StrBBMAmount+' Ltr';
        QLTotalBBM.Caption:=StrBBMFeeTotal;
        QLRoute.Caption:=StrRoute;
        QLFeeSupir.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+StrDriverFee;
        QLTotalFeeSupir.Caption:=StrDriverFeeTotal;
        QLFeeKenek.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+StrBusBoyFee;
        QLTotalFeeKenek.Caption:=StrBusBoyFeeTotal;
        QLTolParkir.Caption:=StrTolParkir;
        QLTotalTolParkir.Caption:=StrTolParkirTotal;
        QLLain.Caption:=StrOther;
        QLTotalLain.Caption:=StrOtherTotal;
        QLTotal.Caption:=StrTotal;
        QRLuarKota.Prepare;
        Main.M_Normal;
        QRLuarKota.Preview;
      end;
}
      if FormNumber=2 then begin
        ppCopy.Caption:=StrCopy;
        ppNoSJ.Caption:=StrNoSJ;
        ppTgl.Caption:=StrTanggal;
        ppDriver.Caption:=StrDriverName;
        ppNoOrder.Caption:=StrNoReservasi;
        ppNoPolisi.Caption:=StrNoPolisi;
        ppBBMFee.Caption:=StrBBMFeeTotal;
        ppDriverFee.Caption:=StrDriverFee;
        ppBusboyFee.Caption:=StrBusBoyFee;
        ppTolParking.Caption:=StrTolParkir;
        if StrOther<>'0' then begin
          ppOtherFee.Caption:=StrOther;
          ppLabelOther.Caption:='Lain-Lain';
        end;
        ppTotal.Caption:=StrTotal;
        ppReportUangOrder.PreviewFormSettings.WindowState:=wsMaximized;
        Main.M_Normal;
        ppReportUangOrder.Print;
      end;

{
      if FormNumber=3 then begin
        ppCopy2.Caption:=StrCopy;
        ppNoSJ2.Caption:=StrNoSJ;
        ppTgl2.Caption:=StrTanggal;
        ppDriver2.Caption:=StrDriverName;
        ppNoOrder2.Caption:=StrNoReservasi;
        ppNoPolisi2.Caption:=StrNoPolisi;
        ppBBMFee2.Caption:=StrBBMFeeTotal;
        ppDriverFee2.Caption:=StrDriverFee;
        ppBusboyFee2.Caption:=StrBusBoyFee;
        ppTolParking2.Caption:=StrTolParkir;
        if StrOther<>'0' then begin
          ppOtherFee2.Caption:=StrOther;
          ppLabelOther2.Caption:='Lain-Lain';
        end;
        ppTotal2.Caption:=StrTotal;
        ppReportUangOrder2.PreviewFormSettings.WindowState:=wsMaximized;
        Main.M_Normal;
        ppReportUangOrder2.Print;
      end;
}
    end;

    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TOrderFeeAdd.RePrint2(Trans_Id:String);
var Qry:TADOQuery;
    StrQry,StrTransId:String;
    StrTanggal,StrNoReservasi,StrNoSJ,StrDriverName,StrNoPolisi,StrCustomer,StrBBMAmount,StrBBMFeeTotal:String;
    StrDriverFee,StrDriverFeeTotal,StrBusBoyFee,StrBusBoyFeeTotal,StrTolParkir,StrTolParkirTotal,StrOther,StrOtherTotal,StrTotal,StrCopy,StrHari,StrRoute,StrStayNight:String;
    Total,TotalHari,Amount,TotalAmount,FormNumber:Integer;
begin
  RePrintForm.ReportName:='Order Fee';
  RePrintForm.ReportId:=Trans_Id;
  if RePrintForm.ShowModal=1 then begin
    if RePrintForm.Copy>0 then StrCopy:='Copy ke-'+IntToStr(RePrintForm.Copy) else StrCopy:='';

    Total:=0;
    InitReport;
    PreparePrint;
    Main.M_Busy;

    //if Main.OpenDb then begin

      StrTanggal:=Tanggal.Text;
      StrNoSJ:=NoSJ.Text;
      StrNoReservasi:=NoReservasi.Text;
      StrDriverName:=DriverDisp.Text;
      StrNoPolisi:=NoPolisi.Text;

      StrBBMAmount:=BBMAddRupiah.Text;
      StrDriverFee:=IntToStr( StrToInt((ToString(DriverFeeAdd.Text))) + strtoint(ToString(DriverFeeReimburse.Text)));
      StrBusBoyFee:=IntToStr( StrToInt((ToString(BusBoyFeeAdd.Text))) + strtoint(ToString(BusBoyFeeReimburse.Text)));//BusBoyFeeAdd.Text;
      StrTolParkir:=IntToStr( StrToInt((ToString(TollParkingAdd.Text))) + strtoint(ToString(TollParkingReimburse.Text)));//TollParkingAdd.Text;
      StrStayNight:=StayNightAdd.Text;
      StrTotal:=IntToStr( StrToInt((ToString(TotalAdd.Text))) + strtoint(ToString(TotalReimburse.Text)));//TotalAdd.Text;

      Main.M_Normal;

      //if FormNumber=2 then begin
        ppCopy.Caption:=StrCopy;
        ppNoSJ.Caption:=StrNoSJ;
        ppTgl.Caption:=StrTanggal;
        ppDriver.Caption:=StrDriverName;
        ppNoOrder.Caption:=StrNoReservasi;
        ppNoPolisi.Caption:=StrNoPolisi;
        ppBBMFee.Caption:=StrBBMAmount;
        ppDriverFee.Caption:=StrDriverFee;
        ppBusboyFee.Caption:=StrBusBoyFee;
        ppTolParking.Caption:=StrTolParkir;
        if StrOther<>'0' then begin
          ppOtherFee.Caption:=StrStayNight;
          ppLabelOther.Caption:='Lain-Lain';
        end;
        ppTotal.Caption:=StrTotal;
        ppReportUangOrder.PreviewFormSettings.WindowState:=wsMaximized;
        Main.M_Normal;
        ppReportUangOrder.Print;
      //end;


    //end;

  end;
end;

procedure TOrderFeeAdd.DisableInput;
begin
  NoSJ.Enabled:=False;
  Hari.Enabled:=False;
  GroupLiter.Enabled:=False;
  GroupBiaya.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TOrderFeeAdd.EnableInput;
begin
  NoSJ.Enabled:=True;
  Hari.Enabled:=True;
  GroupLiter.Enabled:=True;
  GroupBiaya.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TOrderFeeAdd.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOrderFeeAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.StatusUpdate('','');
  Action:=caFree;
end;

procedure TOrderFeeAdd.HariKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BBMLiter.SetFocus;
end;


procedure TOrderFeeAdd.CetakUlangClick(Sender: TObject);
begin
  OrderFeeList:=TOrderFeeList.Create(Self);
end;

procedure TOrderFeeAdd.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoSJ.SetFocus;
end;

procedure TOrderFeeAdd.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then BBMLiter.SetFocus;
end;

procedure TOrderFeeAdd.DriverFeeEnter(Sender: TObject);
begin
  DriverFee.Text:=ToString(DriverFee.Text);
end;

procedure TOrderFeeAdd.BusBoyFeeEnter(Sender: TObject);
begin
  BusBoyFee.Text:=ToString(BusBoyFee.Text);
end;

procedure TOrderFeeAdd.TollParkingEnter(Sender: TObject);
begin
  TollParking.Text:=ToString(TollParking.Text);
end;

procedure TOrderFeeAdd.StayNightEnter(Sender: TObject);
begin
  StayNight.Text:=ToString(StayNight.Text);
end;

procedure TOrderFeeAdd.DriverFeeExit(Sender: TObject);
begin
  if ToString(DriverFee.Text)='' then DriverFee.Text:='0';
  DriverFee.Text:=SToCurr(DriverFee.Text);
  Calculate;
end;

procedure TOrderFeeAdd.BusBoyFeeExit(Sender: TObject);
begin
  if ToString(BusBoyFee.Text)='' then BusBoyFee.Text:='0';
  BusBoyFee.Text:=SToCurr(BusBoyFee.Text);
  Calculate;
end;

procedure TOrderFeeAdd.TollParkingExit(Sender: TObject);
begin
  if ToString(TollParking.Text)='' then TollParking.Text:='0';
  TollParking.Text:=SToCurr(TollParking.Text);
  Calculate;
end;

procedure TOrderFeeAdd.StayNightExit(Sender: TObject);
begin
  if ToString(StayNight.Text)='' then StayNight.Text:='0';
  StayNight.Text:=SToCurr(StayNight.Text);
  Calculate;
end;

procedure TOrderFeeAdd.DriverFeeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BusBoyFee.SetFocus;
end;

procedure TOrderFeeAdd.BusBoyFeeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Toll.SetFocus;
end;

procedure TOrderFeeAdd.TollParkingKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then StayNight.SetFocus;
end;

procedure TOrderFeeAdd.StayNightKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Overtime.SetFocus;
end;

procedure TOrderFeeAdd.AllDailyPackageClick(Sender: TObject);
var StrQry,StrReservedOrderDetailId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
{  if AllDailyPackage.Checked=True then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT * FROM wh_reserved_order_detail_package WHERE (vhc_trans_id='+QuotedStr(NoSJ.Text)+') AND (status=1);';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        StrReservedOrderDetailId:=Qry.FieldValues['reserved_order_detail_id'];
      end;
      StrQry:='SELECT count(*) AS days'+
              ',(SELECT TOP 1 CONVERT(VARCHAR(10),from_date,103) FROM wh_reserved_order_detail_package WHERE (reserved_order_detail_id='+QuotedStr(StrReservedOrderDetailId)+') AND (status=1)) AS from_dates '+
              ',(SELECT TOP 1 CONVERT(VARCHAR(10),from_date,103) FROM wh_reserved_order_detail_package WHERE (reserved_order_detail_id='+QuotedStr(StrReservedOrderDetailId)+') AND (status=1) ORDER BY reserved_order_detail_package_id DESC) AS to_dates '+
              'FROM wh_reserved_order_detail_package a WHERE (a.reserved_order_detail_id='+QuotedStr(StrReservedOrderDetailId)+') AND (status=1);';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        Hari.Text:=Qry.FieldValues['days'];
        FromDate.Text:=Qry.FieldValues['from_dates'];
        ToDate.Text:=Qry.FieldValues['to_dates'];
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  Main.M_Normal;
}
end;

procedure TOrderFeeAdd.BBMAddRupiahKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then DriverFeeAdd.SetFocus;
end;

procedure TOrderFeeAdd.BBMAddRupiahEnter(Sender: TObject);
begin
  BBMAddRupiah.Text:=ToString(BBMAddrupiah.Text);
end;

procedure TOrderFeeAdd.BBMAddRupiahExit(Sender: TObject);
begin
  if Trim(BBMAddRupiah.Text)='' then BBMAddRupiah.Text:='0';
  BBMAddRupiah.Text:=SToCurr(BBMAddRupiah.Text);
  if (ToString(BBMAddRupiah.Text)<>'0') then begin
    BBMAddLiter.Text:= IToCurr(RoundTo(SToInt(BBMAddRupiah.Text)/SolarPerLiter,-2));
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text) +
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );

    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                          StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)
                        );
    Calculate;
  end else if (ToString(BBMAddRupiah.Text)='0') then begin
    BBMAddLiter.Text:='0';
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text)+
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );
    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                                StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)    
                          );
    Calculate;
  end;

end;

procedure TOrderFeeAdd.DriverFeeAddKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then BusBoyFeeAdd.SetFocus;
end;

procedure TOrderFeeAdd.BusBoyFeeAddKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then TollAdd.SetFocus;
end;

procedure TOrderFeeAdd.TollParkingAddKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then StayNightAdd.SetFocus;
end;

procedure TOrderFeeAdd.StayNightAddKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then OvertimeAdd.SetFocus;
end;

procedure TOrderFeeAdd.DriverFeeAddEnter(Sender: TObject);
begin
  DriverFeeAdd.Text:=ToString(DriverFeeAdd.Text);
end;

procedure TOrderFeeAdd.BusBoyFeeAddEnter(Sender: TObject);
begin
  BusBoyFeeAdd.Text:=ToString(BusBoyFeeAdd.Text);
end;

procedure TOrderFeeAdd.TollParkingAddEnter(Sender: TObject);
begin
  TollParkingAdd.Text:=ToString(TollParkingAdd.Text);
end;

procedure TOrderFeeAdd.StayNightAddEnter(Sender: TObject);
begin
  StayNightAdd.Text:=ToString(StayNightAdd.Text);
end;

procedure TOrderFeeAdd.DriverFeeAddExit(Sender: TObject);
begin
  if Trim(DriverFeeAdd.Text)<>'' then DriverFeeAdd.Text:=SToCurr(DriverFeeAdd.Text);
  if Trim(DriverFeeAdd.Text)='' then DriverFeeAdd.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.BusBoyFeeAddExit(Sender: TObject);
begin
  if Trim(BusBoyFeeAdd.Text)<>'' then BusBoyFeeAdd.Text:=SToCurr(BusBoyFeeAdd.Text);
  if Trim(BusBoyFeeAdd.Text)='' then BusBoyFeeAdd.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.TollParkingAddExit(Sender: TObject);
begin
  if Trim(TollParkingAdd.Text)<>'' then TollParkingAdd.Text:=SToCurr(TollParkingAdd.Text);
  if Trim(TollParkingAdd.Text)='' then TollParkingAdd.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.StayNightAddExit(Sender: TObject);
begin
  if Trim(StayNightAdd.Text)<>'' then StayNightAdd.Text:=SToCurr(StayNightAdd.Text);
  if Trim(StayNightAdd.Text)='' then StayNightAdd.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.CariSJClick(Sender: TObject);
begin
  if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'OrderFee-Additional',0,False,2);
end;

procedure TOrderFeeAdd.BBMAddLiterEnter(Sender: TObject);
begin
  BBMAddLiter.Text:=ToString(BBMAddLiter.Text);
end;

procedure TOrderFeeAdd.BBMAddLiterExit(Sender: TObject);
var Fl:Extended;
begin
  if ToString(BBMAddLiter.Text)='' then BBMAddLiter.Text:='0';
//  BBMAddLiter.Text:=SToCurr(BBMAddLiter.Text);
  if ToString(BBMAddLiter.Text)<>'0' then begin
    BBMAddRupiah.Text:=IToCurr(SToFloat(BBMAddLiter.Text)*SolarPerLiter);
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text));
    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text));
    Calculate;
  end;
end;

procedure TOrderFeeAdd.BBMAddLiterKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,',']) then Key:=#0;
  if Key=#13 then DriverFeeAdd.SetFocus;
end;

procedure TOrderFeeAdd.TollAddEnter(Sender: TObject);
begin
  TollAdd.Text:=ToString(TollAdd.Text);
end;

procedure TOrderFeeAdd.TollAddExit(Sender: TObject);
begin
  if Trim(TollAdd.Text)<>'' then TollAdd.Text:=SToCurr(TollAdd.Text);
  if Trim(TollAdd.Text)='' then TollAdd.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.TollAddKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then TollParkingAdd.SetFocus
end;

procedure TOrderFeeAdd.DriverFeeReimburseEnter(Sender: TObject);
begin
  DriverFeeReimburse.Text:=ToString(DriverFeeReimburse.Text);
end;

procedure TOrderFeeAdd.DriverFeeReimburseExit(Sender: TObject);
begin
  if Trim(DriverFeeReimburse.Text)<>'' then DriverFeeReimburse.Text:=SToCurr(DriverFeeReimburse.Text);
  if Trim(DriverFeeReimburse.Text)='' then DriverFeeReimburse.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.DriverFeeReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then BusBoyFeeReimburse.SetFocus;
end;

procedure TOrderFeeAdd.BusBoyFeeReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then TollReimburse.SetFocus;
end;

procedure TOrderFeeAdd.BusBoyFeeReimburseExit(Sender: TObject);
begin
  if Trim(BusBoyFeeReimburse.Text)<>'' then BusBoyFeeReimburse.Text:=SToCurr(BusBoyFeeReimburse.Text);
  if Trim(BusBoyFeeReimburse.Text)='' then BusBoyFeeReimburse.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.BusBoyFeeReimburseEnter(Sender: TObject);
begin
  BusBoyFeeReimburse.Text:=ToString(BusBoyFeeReimburse.Text);
end;

procedure TOrderFeeAdd.TollReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then TollParkingReimburse.SetFocus
end;

procedure TOrderFeeAdd.TollReimburseExit(Sender: TObject);
begin
  if Trim(TollReimburse.Text)<>'' then TollReimburse.Text:=SToCurr(TollReimburse.Text);
  if Trim(TollReimburse.Text)='' then TollReimburse.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.TollReimburseEnter(Sender: TObject);
begin
  TollReimburse.Text:=ToString(TollReimburse.Text);
end;

procedure TOrderFeeAdd.TollParkingReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TOrderFeeAdd.TollParkingReimburseExit(Sender: TObject);
begin
  if Trim(TollParkingReimburse.Text)<>'' then TollParkingReimburse.Text:=SToCurr(TollParkingReimburse.Text);
  if Trim(TollParkingReimburse.Text)='' then TollParkingReimburse.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.TollParkingReimburseEnter(Sender: TObject);
begin
  TollParkingReimburse.Text:=ToString(TollParkingReimburse.Text);
end;

procedure TOrderFeeAdd.OvertimeEnter(Sender: TObject);
begin
  Overtime.Text:=ToString(Overtime.Text);
end;

procedure TOrderFeeAdd.OvertimeExit(Sender: TObject);
var
  InputString: string;
begin
  if ToString(Overtime.Text)='' then Overtime.Text:='0';
  Overtime.Text:=SToCurr(Overtime.Text);
  Calculate;

  PostMessage(Handle, InputBoxMessage, 0, 0);
  InputString := InputBox('Input Box', 'Please Enter a Password', '');
end;

procedure TOrderFeeAdd.OvertimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TOrderFeeAdd.OvertimeAddEnter(Sender: TObject);
begin
  OvertimeAdd.Text:=ToString(OvertimeAdd.Text);
end;

procedure TOrderFeeAdd.OvertimeAddExit(Sender: TObject);
var
  InputString: string;
  IsInputs:Boolean;
begin
  if Trim(OvertimeAdd.Text)<>'' then OvertimeAdd.Text:=SToCurr(OvertimeAdd.Text);
  if Trim(OvertimeAdd.Text)='' then OvertimeAdd.Text:='0';
  if OvertimeAdd.Text<>'0' then begin
    if (TimeInputForm.ShowModal<>1) then IsInputs:=False;
    if not IsInputs then OvertimeAdd.Text:='0';
  end;
  Calculate;

end;

procedure TOrderFeeAdd.OvertimeAddKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then DriverFeeReimburse.SetFocus;
end;

procedure TOrderFeeAdd.XOvertimeReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TOrderFeeAdd.XOvertimeReimburseEnter(Sender: TObject);
begin
  XOvertimeReimburse.Text:=ToString(XOvertimeReimburse.Text);
end;

procedure TOrderFeeAdd.XOvertimeReimburseExit(Sender: TObject);
begin
  if Trim(XOvertimeReimburse.Text)<>'' then XOvertimeReimburse.Text:=SToCurr(XOvertimeReimburse.Text);
  if Trim(XOvertimeReimburse.Text)=''  then XOvertimeReimburse.Text:='0';
  Calculate;
end;

procedure TOrderFeeAdd.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit, hButton: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    {
      // Change button text:
      hButton := FindWindowEx(hInputForm, 0, 'TButton', nil);
      SendMessage(hButton, WM_SETTEXT, 0, Integer(PChar('Cancel')));
    }
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

procedure TOrderFeeAdd.BBMReimburseEnter(Sender: TObject);
begin
  BBMReimburse.Text:=ToString(BBMReimburse.Text);
end;

procedure TOrderFeeAdd.BBMReimburseExit(Sender: TObject);
begin
  if Trim(BBMReimburse.Text)='' then BBMReimburse.Text:='0';
  BBMReimburse.Text:=SToCurr(BBMReimburse.Text);
  if (ToString(BBMReimburse.Text)<>'0') then begin
    BBMReimburseAddLiter.Text:=IToCurr(RoundTo(SToInt(BBMReimburse.Text)/SolarPerLiter,-2));

    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text) +
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );

    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                          StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)
                        );

    Calculate;
  end else if (ToString(BBMReimburse.Text)='0') then begin
    BBMReimburseAddLiter.Text:='0';
//    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMReimburse.Text));
//    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMReimburseAddLiter.Text));
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text) +
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );

    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                          StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)
                        );
    Calculate;
  end;

end;

procedure TOrderFeeAdd.BBMReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then DriverFeeReimburse.SetFocus;
end;

procedure TOrderFeeAdd.BBMSpbuEnter(Sender: TObject);
begin
  BBMSpbu.Text:=ToString(BBMSpbu.Text);
end;

procedure TOrderFeeAdd.BBMSpbuExit(Sender: TObject);
begin
  if Trim(BBMSpbu.Text)='' then BBMSpbu.Text:='0';
  BBMSpbu.Text:=SToCurr(BBMSpbu.Text);
  if (ToString(BBMSpbu.Text)<>'0') then begin
    BBMSpbuAddLiter.Text:=IToCurr(RoundTo(SToInt(BBMSpbu.Text)/SolarPerLiter,-2));
//    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMSpbu.Text));
//    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text));
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text) +
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );

    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                          StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)
                        );
    Calculate;
  end else if (ToString(BBMSpbu.Text)='0') then begin
    BBMSpbuAddLiter.Text:='0';
(*
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMSpbu.Text));
    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text));
*)
    BBMTotalRupiah.Text:=IToCurr(SToInt(BBMRupiah.Text)+SToInt(BBMAddRupiah.Text) +
                          SToInt(BBMReimburse.Text)+SToInt(BBMSpbu.Text)
                          );

    BBMTotalLiter.Text:=IToCurr(StrToFloat(BBMLiter.Text)+StrToFloat(BBMAddLiter.Text)+
                          StrToFloat(BBMReimburseAddLiter.Text)+StrToFloat(BBMSpbuAddLiter.Text)
                        );
    Calculate;
  end;
end;

procedure TOrderFeeAdd.BBMSpbuKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TOrderFeeAdd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  IsAuth : Boolean;
begin
    if Key=VK_F6 then begin
      IsAuth:=True;
      AuthorizedForm.FormId:='13120102';
      AuthorizedForm.StrMessage:=' Otorisasi Revisi Budget [Integrate]';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then begin
        ShowMessage('Otorisasi berhasil'+#13#10+'Silahkan lakukan revisi');
        EnableInput;
      end;
 //     else VehicleRDList:=TVehicleRDList.Create(Self,'Bus',StrGrid.Cells[14,IntRow],StrGrid.Cells[17,IntRow],'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow]);
    end else  if Key=VK_F7 then begin
      if (isIntegrate=False) then begin
        IsAuth:=True;
        AuthorizedForm.FormId:='13120103';
        AuthorizedForm.StrMessage:=' Otorisasi Revisi Budget';
        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        if IsAuth then begin
            ShowMessage('Otorisasi berhasil'+#13#10+'Silahkan lakukan revisi');
            EnableInput;
        end;
      end else begin
        ShowMessage('Uang Order terkunci karena sudah diposting ke Integrate'+#13#10+'Silahkan hubungi Finance');
      end;

    end;
end;

end.
