unit OrderFeeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, WHUnit, ADODB, QuickRpt, QRCtrls,
  ZColorStringGrid, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, StrUtils;

type
  TOrderFee = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;     
    Cari: TEdit;
    Panel1: TPanel;
    NoPolisi: TEdit;
    DriverDisp: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    GroupSPJ: TGroupBox;
    Label12: TLabel;
    Panel3: TPanel;
    UnitJalan: TEdit;
    GridSPJ: TStringGrid;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    Label13: TLabel;
    NoSJ: TComboBox;
    GroupBiaya: TGroupBox;
    NoBody: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    RemoveOk: TCheckBox;
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
    BBMBBGTotal: TMemo;
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
    Label26: TLabel;
    GroupDailyPackage: TPanel;
    AllDailyPackage: TCheckBox;
    GroupBBM: TPanel;
    QRSPJ: TQuickRep;
    QRBand6: TQRBand;
    QRLabel1: TQRLabel;
    QLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QNoSPJ: TQRLabel;
    QPengemudi: TQRLabel;
    QNoBody: TQRLabel;
    QNoPol: TQRLabel;
    QPetugas: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel34: TQRLabel;
    QLocation: TQRLabel;
    QAddress: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTelpHP: TQRLabel;
    QPKB: TQRLabel;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QTanggalSPJ: TQRLabel;
    QRLabel16: TQRLabel;
    QJam: TQRLabel;
    QRBand7: TQRBand;
    QRLabel20: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QKMOrdo: TQRLabel;
    QCatatan: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape2: TQRShape;
    QLabelLayananPrima: TQRLabel;
    QRBand8: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QTandaPetugas: TQRLabel;
    QRLabel32: TQRLabel;
    QTandaPengemudi: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QMessage: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape3: TQRShape;
    QRLabel22: TQRLabel;
    CetakUlangSPJ: TButton;
    All: TCheckBox;
    BBMRupiah: TMemo;
    JamStandby: TEdit;
    Label27: TLabel;
    ppReportUangOrder: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppNoPolisi: TppLabel;
    ppNoOrder: TppLabel;
    ppCopy: TppLabel;
    ppTgl: TppLabel;
    ppNoSJ: TppLabel;
    ppDriver: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppParameterList4: TppParameterList;
    ppBBMFee: TppLabel;
    ppDriverFee: TppLabel;
    ppBusboyFee: TppLabel;
    ppTolParking: TppLabel;
    ppTotal: TppLabel;
    ppLine1: TppLine;
    ppLabelOther: TppLabel;
    ppOtherFee: TppLabel;
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
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
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
    QBBMLiter: TQRLabel;
    QBBMTotal: TQRLabel;
    ppReportSPPB: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppSPPBPetugas: TppLabel;
    ppSPPBNoBodi: TppLabel;
    ppSPPBNoSPPB: TppLabel;
    ppSPPBPengemudi: TppLabel;
    ppSPPBTanggal: TppLabel;
    ppSPPBTelpHP: TppLabel;
    ppSPPBCatatan: TppLabel;
    ppSPPBLogo: TppImage;
    ppSPPBAlamat: TppMemo;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel47: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppParameterList2: TppParameterList;
    ppLine4: TppLine;
    ppShape1: TppShape;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape2: TppShape;
    ppLine9: TppLine;
    ppLabel37: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel61: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel48: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppSPPBJam: TppLabel;
    ppSPPBNoPolisi: TppLabel;
    ppSPPBOdo: TppLabel;
    ppSPPBBBMLiter: TppLabel;
    ppSPPBBBMRupiah: TppLabel;
    ppSPPBTandaPengemudi: TppLabel;
    ppSPPBTandaPetugas: TppLabel;
    ppSPPBMessage: TppLabel;
    ppSPPBNoPKB: TppLabel;
    Label28: TLabel;
    Toll: TMemo;
    TollTotal: TMemo;
    ppReportUangOrder3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppNoPolisi3: TppLabel;
    ppNoOrder3: TppLabel;
    ppCopy3: TppLabel;
    ppTgl3: TppLabel;
    ppNoSJ3: TppLabel;
    ppDriver3: TppLabel;
    ppBBMFee3: TppLabel;
    ppDriverFee3: TppLabel;
    ppBusboyFee3: TppLabel;
    ppTolParking3: TppLabel;
    ppTotal3: TppLabel;
    ppLine3: TppLine;
    ppLabelOther3: TppLabel;
    ppOtherFee3: TppLabel;
    ppLogo3: TppImage;
    ppCompany3: TppLabel;
    ppAddress3: TppMemo;
    ppPhone3: TppLabel;
    ppFax3: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppParameterList3: TppParameterList;
    ppEToll: TppLabel;
    ListKunciCepat: TMemo;
    Label31: TLabel;
    EditRemark: TEdit;
    FuelSet: TCheckBox;
    SewaLuar: TCheckBox;
    Overtime: TMemo;
    lbl1: TLabel;
    OvertimeTotal: TMemo;
    ppOvertime: TppLabel;
    ppOvertime2: TppLabel;
    ppOvertime3: TppLabel;
    ppSPPBNoOrder: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    spbu: TComboBox;
    Label29: TLabel;
    plbl1: TppLabel;
    plbl2: TppLabel;
    ppspbu: TppLabel;
    plbl3: TppLabel;
    qrlbl1: TQRLabel;
    ppTol3: TppLabel;
    DriverFee2: TMemo;
    lbl2: TLabel;
    DriverFeeTotal2: TMemo;
    Driver2: TEdit;
    Driver: TEdit;
    TripType: TComboBox;
    Label30: TLabel;
    DailyPackage: TCheckBox;
    CopyBiaya: TCheckBox;
    procedure BBMLiterKeyPress(Sender: TObject; var Key: Char);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BBMLiterEnter(Sender: TObject);
    procedure BBMLiterExit(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure NoSJChange(Sender: TObject);
    procedure HariKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure RemoveOkClick(Sender: TObject);
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
    procedure CariChange(Sender: TObject);
    procedure FuelSetClick(Sender: TObject);
    procedure CetakUlangSPJClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure BBMRupiahEnter(Sender: TObject);
    procedure BBMRupiahExit(Sender: TObject);
    procedure BBMRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure TollEnter(Sender: TObject);
    procedure TollExit(Sender: TObject);
    procedure TollKeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OvertimeEnter(Sender: TObject);
    procedure OvertimeExit(Sender: TObject);
    procedure OvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbuChange(Sender: TObject);
    procedure DriverFee2Enter(Sender: TObject);
    procedure DriverFee2Exit(Sender: TObject);
    procedure DriverFee2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DriverFee2KeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeChange(Sender: TObject);
    procedure TripTypeChange(Sender: TObject);
    procedure BBMRupiahChange(Sender: TObject);
    procedure BusBoyFeeChange(Sender: TObject);
    procedure TollChange(Sender: TObject);
    procedure TollParkingChange(Sender: TObject);
    procedure StayNightChange(Sender: TObject);
    procedure OvertimeChange(Sender: TObject);
    procedure CopyBiayaClick(Sender: TObject);
  private
    { Private declarations }
    SJArr,BiayaArr:Array of TArrString45;
    IntRow,MinRowBiaya,MinRowService,BBMPerLiter,SolarPerLiter,GasPerLiter,LastOdo,TotalDays,FormNumber_Day,FormNumber_Days,Show_eToll, eToll_Calculation:Integer;
    TransId,EmplId,OrderId,SJId,StrBBM:String;
    IsInput,Initiation:Boolean;
    TotDriver: Integer ;
    LockBudget,AllowUnlockNullBudget,LockBudgetIntegrate:Boolean;
    SpbuArr:Array of TArrString8;
    TripTypeArr:Array of TArrString8;

    StrRemarkChange:String;
    procedure Init;
    procedure InitGridSJ;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGridSJ;
    procedure LoadData;
    procedure InitReport;
    procedure CheckData;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure PreparePrintSPPB;
    procedure Trip_Type;
    procedure CekFeeOrder;
    //procedure CekRepeatOrder;

    //procedure ReadOnlybudget(_isTrue:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True);Overload;
    procedure RePrint(Trans_Id:String);
    procedure RePrintSPPB(Trans_Id:String);
    procedure SPBU2;


  end;

var
  OrderFee: TOrderFee;
  StatusSJ, StrIsRepeatOrder: string;

implementation

uses MainU, Math, RePrintFormU, DB, OrderFeeListU, AuthorizedFormU;

{$R *.dfm}

constructor TOrderFee.Create(AOwner:TComponent;SJ_Id:String='';Is_Input:Boolean=True);
begin
  SJId:=SJ_Id;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: OrderFee='+SJ_Id+','+BoolToStr(Is_Input),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TOrderFee.SPBU2;
  var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  QStr:='SELECT * from wh_spbu' ;

  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(SpbuArr,Count+1);
    SpbuArr[Count][0]:=Qry.FieldValues['id'];
    SpbuArr[Count][1]:=Qry.FieldValues['spbu_name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  For Count:=0 to Length(SpbuArr)-1 do begin
    spbu.Items.Add(SpbuArr[Count][1]);
  end;
end;

procedure TOrderFee.Trip_Type;
  var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  QStr:='SELECT trip_type_id,trip_type_name from wh_trip_type where status=1' ;

  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(TripTypeArr,Count+1);
    TripTypeArr[Count][0]:=Qry.FieldValues['trip_type_id'];
    TripTypeArr[Count][1]:=Qry.FieldValues['trip_type_name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  TripType.Clear;
  For Count:=0 to Length(TripTypeArr)-1 do begin
    TripType.Items.Add(TripTypeArr[Count][1]);
  end;
end;

procedure TOrderFee.Init;
var IntCount,IntCount2:Integer;
begin

  MinRowBiaya:=0;
  Cari.Text:='';
  NoReservasi.Text:='';
  Customer.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  NoSJ.Items.Clear;
  NoSJ.ItemIndex:=-1;
  NoSJ.Text:='';
  spbu.ItemIndex:=-1;
  Driver.Text:='';
  DriverDisp.Text:='';
  Tanggal.Text:='';
  Jam.Text:='';
  Hari.Text:='';
  InitGridSJ;
  BBMLiter.Text:='';
  DriverFee.Text:='';
  BusBoyFee.Text:='';
  TollParking.Text:='';
  StayNight.Text:='';
  Route.Text:='';
  PickupPoint.Text:='';
  Remark.Text:='';
  BBMPerLiter:=0;
  DriverFee.Text:='0';
  DriverFeeTotal.Text:='0';
  BusBoyFee.Text:='0';
  BusBoyFeeTotal.Text:='0';
  Toll.Text:='0';
  TollTotal.Text:='0';
  TollParking.Text:='0';
  TollParkingTotal.Text:='0';
  BBMLiter.Text:='0';
  Driver2.Text:='';
  DriverFee2.Text:='0';
  DriverFeeTotal2.Text:='0';
  GasPerLiter:=0;
  SolarPerLiter:=0;
  BBMRupiah.Text:='0';
  BBMBBGTotal.Text:='0';
  Overtime.Text:='0';
  OvertimeTotal.Text:='0';
  TotalBayar.Text:='0';
  StayNight.Text:='0';
  StayNightTotal.Text:='0';
  Seat.Text:='';
  FuelSet.Checked:=False;
  StrBBM:='';
  DailyPackage.Checked:=False;
  FromDate.Text:='';
  ToDate.Text:='';
  TripType.ItemIndex:=-1;
end;

procedure TOrderFee.InitReport;
begin
  QTanggalSPJ.Caption:='';
  QJam.Caption:='';
  QNoSPJ.Caption:='';
  QPengemudi.Caption:='';
  QNoPol.Caption:='';
  QNoBody.Caption:='';
  QTelpHP.Caption:='';
  QKMOrdo.Caption:='';
  QCatatan.Caption:='';
  QPKB.Caption:='';
  QPetugas.Caption:='';
  QTandaPetugas.Caption:='';
  QMessage.Caption:='';
  QTandaPengemudi.Caption:='';
  QBBMLiter.Caption:='';
  QBBMTotal.Caption:='';
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
  ppNoSJ.Caption:='';
  ppCopy.Caption:='';
  ppTgl.Caption:='';
  ppDriver.Caption:='';
  ppNoOrder.Caption:='';
  ppNoPolisi.Caption:='';
  ppBBMFee.Caption:='';
  ppDriverFee.Caption:='';
  ppBusboyFee.Caption:='';
  ppOtherFee.Caption:='';
  ppLabelOther.Caption:='';
  ppTotal.Caption:='';
  ppCompany2.Caption:='';
  ppAddress2.Lines.Clear;
  ppPhone2.Caption:='';
  ppFax2.Caption:='';
  ppNoSJ2.Caption:='';
  ppCopy2.Caption:='';
  ppTgl2.Caption:='';
  ppDriver2.Caption:='';
  ppNoOrder2.Caption:='';
  ppNoPolisi2.Caption:='';
  ppBBMFee2.Caption:='';
  ppDriverFee2.Caption:='';
  ppBusboyFee2.Caption:='';
  ppOtherFee2.Caption:='';
  ppLabelOther2.Caption:='';
  ppTotal2.Caption:='';
  //FormNumber_Day:=2;
  //FormNumber_Days:=1;
end;

procedure TOrderFee.InitGridSJ;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='No Polisi';
  GridSPJ.Cells[3,0]:='No KPP';
  GridSPJ.Cells[4,0]:='Driver';
  GridSPJ.Cells[5,0]:='Tanggal';
  GridSPJ.Cells[6,0]:='Jam';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  GridSPJ.Cells[6,1]:='';
  GridSPJ.Cells[7,1]:='';
  IntRow:=1;
end;

procedure TOrderFee.InitGridService;
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

procedure TOrderFee.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
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


    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('eToll_Calculation_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then eToll_Calculation:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;


    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Lock_Budget_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then LockBudget:=True;
      if Qry.FieldValues['value_string']=0 then LockBudget:=False;
    end;
    Qry.Close;

    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Allow_UnlockBudget_NULL_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then AllowUnlockNullBudget:=True;
      if Qry.FieldValues['value_string']=0 then AllowUnlockNullBudget:=False;
    end;
    Qry.Close;

    
    DriverFee.ReadOnly:=LockBudget;
    BusBoyFee.ReadOnly:=LockBudget;

    if LockBudget then begin
      DriverFee.Color:=clInfoBk;
      BusBoyFee.Color:=clInfoBk;
    end else begin
      DriverFee.Color:=clWhite;
      BusBoyFee.Color:=clWhite;
    end;


  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderFee.CekFeeOrder;
var StrQry,StrTripId,StrCategoryID:String;
    Qry:TADOQuery;
    IntCount,IntBermalam:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if NoSJ.Text<>'' then begin
      if TripType.ItemIndex=-1 then StrTripId:='0' else
      StrTripId:=TripTypeArr[TripType.ItemIndex][0];
      StrCategoryID:= SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][42];
      StrQry:='SELECT * from wh_vhc_budget WHERE '+
              'company_id='+CompanyId+' AND trip_type_id='+StrTripId+' '+
              'AND category_id='+StrCategoryID+' AND seat='+QuotedStr(Seat.Text)+' AND status=1';

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if (Hari.Text<>'') or (Hari.Text='1') then
        begin
          IntBermalam:= (StrToInt(Hari.Text)- 1);
        end else
        begin
          IntBermalam:=0;
        end;

        BBMRupiah.Text:=IToCurr(StrToInt(Qry.FieldValues['fuel_price']));
        BBMBBGTotal.Text:=IToCurr(StrToInt(Qry.FieldValues['fuel_price']));
        BBMLiter.Text:=IToCurr(StrToInt(Qry.FieldValues['fuel_litre']));
        DriverFee.Text:=IToCurr(StrToInt(Qry.FieldValues['driver']));
        BusBoyFee.Text:=IToCurr(StrToInt(Qry.FieldValues['helper']));//*
        Toll.Text:=IToCurr(StrToInt(Qry.FieldValues['toll']));
        TollParking.Text:=IToCurr(StrToInt(Qry.FieldValues['parkir']));
        if IntBermalam > 0 then begin
          StayNight.Text:=IToCurr( StrToInt(Qry.FieldValues['overnight_driver']));
          StayNightTotal.Text:=IToCurr( StrToInt(Qry.FieldValues['overnight_driver']) * IntBermalam);
        end else begin
          StayNight.Text:='0';
          StayNightTotal.Text:='0';
        end;
      end;
      Qry.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderFee.RefreshData;
var StrQry,StrOrderId,StrFoward,StrSewaLuar:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(SJArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if All.Checked=True then StrFoward:=',@AllFoward=1' else StrFoward:=',@AllFoward=2';
    if SewaLuar.Checked=True then StrSewaLuar:=',@isSewaLuar=1' else StrSewaLuar:=',@isSewaLuar=0';

    StrQry:='EXEC GetVhcOutList2_S '+LocationId+',1,'+CompanyId+StrFoward+StrSewaLuar+'; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[IntCount][1]:=Qry.FieldValues['body_id'];

      SJArr[IntCount][2]:=LicensePlate(Qry.FieldValues['license_plate']);

      if Qry.FieldValues['employee_id']<>NULL then SJArr[IntCount][3]:=Qry.FieldValues['employee_id'] else SJArr[IntCount][3]:='';
      if Qry.FieldValues['name']<>NULL then SJArr[IntCount][4]:=Qry.FieldValues['name'] else SJArr[IntCount][4]:='';


      if Qry.FieldValues['employee_id2']<>NULL then SJArr[IntCount][38]:=Qry.FieldValues['employee_id2'] else SJArr[IntCount][38]:='';
      if Qry.FieldValues['driver2']<>NULL then SJArr[IntCount][39]:=Qry.FieldValues['driver2'] else SJArr[IntCount][39]:='';


      SJArr[IntCount][5]:=Qry.FieldValues['out_date'];
      if Qry.FieldValues['out_ordo_km']<>NULL then SJArr[IntCount][7]:=Qry.FieldValues['out_ordo_km'];
      if Qry.FieldValues['fuel_budget_price']<>NULL then SJArr[IntCount][8]:=Qry.FieldValues['fuel_budget_price']
      else SJArr[IntCount][8]:='';
      if Qry.FieldValues['gas_price']<>NULL then SJArr[IntCount][9]:=Qry.FieldValues['gas_price']
      else SJArr[IntCount][9]:='';
      if Qry.FieldValues['customer_order_id']<>NULL then SJArr[IntCount][10]:=Qry.FieldValues['customer_order_id'];
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



      if Qry.FieldValues['fee_supir2']<>NULL then
      begin
         if Qry.FieldValues['fee_supir1']<>NULL then SJArr[IntCount][25]:=Qry.FieldValues['fee_supir1'] else SJArr[IntCount][25]:='';
         if Qry.FieldValues['fee_supir2']<>NULL then SJArr[IntCount][40]:=Qry.FieldValues['fee_supir2'] else SJArr[IntCount][40]:='';
      end else
      begin
         if Qry.FieldValues['driver_fee']<>NULL then SJArr[IntCount][25]:=Qry.FieldValues['driver_fee'] else SJArr[IntCount][25]:='';
      end;

      if Qry.FieldValues['fuel']<>NULL then begin
        FuelSet.Checked:=True;
        BBMLiter.Text:=Qry.FieldValues['fuel'];
        StrBBM:=Qry.FieldValues['fuel'];
      end else begin
        FuelSet.Checked:=False;
        BBMLiter.Text:='';
      end;
      SJArr[IntCount][26]:=Qry.FieldValues['standby_time'];
      if Qry.FieldValues['fuel_price']<>NULL then
        SJArr[IntCount][27]:=Qry.FieldValues['fuel_price']
      else SJArr[IntCount][27]:='0';
      if Qry.FieldValues['fuel_litre']<>NULL then
        SJArr[IntCount][28]:=Qry.FieldValues['fuel_litre']
      else SJArr[IntCount][28]:='0';
      if Qry.FieldValues['driver_fee2']<>NULL then
        SJArr[IntCount][29] :=Qry.FieldValues['driver_fee2']
      else SJArr[IntCount][29]:='0';
      if Qry.FieldValues['helper_fee']<>NULL then
        SJArr[IntCount][30]:=Qry.FieldValues['helper_fee']
      else SJArr[IntCount][30]:='0';
      if Qry.FieldValues['toll_fee']<>NULL then
        SJArr[IntCount][31]:=Qry.FieldValues['toll_fee']
      else SJArr[IntCount][31]:='0';
      if Qry.FieldValues['parkir_fee']<>NULL then
        SJArr[IntCount][32]:=Qry.FieldValues['parkir_fee']
      else SJArr[IntCount][32]:='0';
      if Qry.FieldValues['overnight_driver']<>NULL then
        SJArr[IntCount][33]:=Qry.FieldValues['overnight_driver']
      else SJArr[IntCount][33]:='0';
      if Qry.FieldValues['remark_sj']<>NULL then
        SJArr[IntCount][34]:=Qry.FieldValues['remark_sj']
      else SJArr[IntCount][34]:='';
      if Qry.FieldValues['overnight_helper']<>NULL then
        SJArr[IntCount][35]:=Qry.FieldValues['overnight_helper']
      else SJArr[IntCount][35]:='0';

      SJArr[IntCount][36]:=Qry.FieldValues['route2'];
      SJArr[IntCount][37]:=Qry.FieldValues['DoubleDriver'];
      if Qry.FieldValues['trip_type_name']<>null then SJArr[IntCount][41]:=Qry.FieldValues['trip_type_name']
      else SJArr[IntCount][41]:='';

      SJArr[IntCount][42]:=Qry.FieldValues['category_seg2'];
      if Qry.FieldValues['isRepeatOrder']<>null then
        SJArr[IntCount][43] := Qry.FieldValues['isRepeatOrder']
      else SJArr[IntCount][43] :='';

      SJArr[IntCount][44] := Qry.FieldValues['product_price_id'];
      Inc(IntCount);
      Qry.Next;
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
  RefreshGridSJ;
  Main.StatusUpdate('Premium : '+IntToStr(BBMPerLiter)+'/Ltr, Solar : '+IntToStr(SolarPerLiter)+'/Ltr, Gas : '+IntToStr(GasPerLiter)+'/Ltr','');
  for IntCount:=0 to Length(SJArr)-1 do
    if SJId='' then begin
      if (SJArr[IntCount][25]='') then NoSJ.Items.Add(SJArr[IntCount][0]);
    end else begin
      NoSJ.Items.Add(SJArr[IntCount][0]);
    end;
  Calculate;
  Main.M_Normal;
end;

procedure TOrderFee.RefreshGridSJ;
var Count,Count2:Integer;
begin
  for Count2:=0 to 7 do
    for Count:=1 to GridSPJ.RowCount-1 do
      GridSPJ.Cells[Count2,Count]:='';
  if Length(SJArr)>0 then begin
    GridSPJ.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      if (RemoveOk.Checked=True) then begin
        if (SJArr[Count][25]='') then begin
          GridSPJ.RowCount:=Count2+1;
          GridSPJ.Cells[0,Count2]:=SJArr[Count][0];
          GridSPJ.Cells[1,Count2]:=SJArr[Count][1];
          GridSPJ.Cells[2,Count2]:=SJArr[Count][2];
          GridSPJ.Cells[3,Count2]:=SJArr[Count][3];
          GridSPJ.Cells[4,Count2]:=SJArr[Count][4];
          GridSPJ.Cells[5,Count2]:=SJArr[Count][13];
          GridSPJ.Cells[6,Count2]:=SJArr[Count][14];
          GridSPJ.Cells[7,Count2]:='';
          Inc(Count2);
        end;
      end else begin
        GridSPJ.RowCount:=Count2+1;
        GridSPJ.Cells[0,Count2]:=SJArr[Count][0];
        GridSPJ.Cells[1,Count2]:=SJArr[Count][1];
        GridSPJ.Cells[2,Count2]:=SJArr[Count][2];
        GridSPJ.Cells[3,Count2]:=SJArr[Count][3];
        GridSPJ.Cells[4,Count2]:=SJArr[Count][4];
        GridSPJ.Cells[5,Count2]:=SJArr[Count][13];
        GridSPJ.Cells[6,Count2]:=SJArr[Count][14];
        if (SJArr[Count][25]<>'') then GridSPJ.Cells[7,Count2]:='OK'
//        if (SJArr[Count][8]<>'') and (SJArr[Count][9]<>'') then GridSPJ.Cells[7,Count2]:='OK'
        else GridSPJ.Cells[7,Count2]:='';
        Inc(Count2);
      end;
    end;
    UnitJalan.Text:=IntToStr(Length(SJArr));
  end else UnitJalan.Text:='0';
end;

procedure TOrderFee.LoadData;
var StrQry,StrOrderId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  CheckData;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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

    StrQry:='EXEC GetVhcOutDetail '+QuotedStr(SJId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      NoSJ.Items.Add(Qry.FieldValues['vhc_trans_id']);
      if LockBudgetIntegrate then begin
        if (Qry.FieldValues['isIntegrate'])=1 then
          DisableInput;
      end;
      NoSJ.ItemIndex:=NoSJ.Items.IndexOf(SJId);
      if (Qry.FieldValues['spbu_name']<> NULL) and (Qry.FieldValues['spbu_name']<> '') then
      spbu.ItemIndex:=spbu.Items.IndexOf(Qry.FieldValues['spbu_name']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['last_in_ordo']<>NULL then LastOdo:=Qry.FieldValues['last_in_ordo'] else LastOdo:=0;

      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      if (Qry.FieldValues['driver2']<>NULL) then
      begin
        TotDriver:=2;
        DriverDisp.Text:=Qry.FieldValues['name']+' & '+Qry.FieldValues['driver2'];
        Driver.Text:=Qry.FieldValues['employee_id'];
        Driver2.Text:=Qry.FieldValues['employee_id2'];
//        DriverFee2.ReadOnly:=False;
        DriverFee2.ReadOnly:=True;
      end else
      begin
        TotDriver:=1;
        DriverDisp.Text:=Qry.FieldValues['name'];
        Driver.Text:=Qry.FieldValues['employee_id'];
        DriverFee2.ReadOnly:=True;
        DriverFee2.Text:='0';
        DriverFeeTotal2.Text:='0';
      end;

//      TripType.ItemIndex:=TripType.Items.IndexOf(Trim(Qry.FieldValues['trip_type_name']));



      NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      Hari.Text:=Qry.FieldValues['day'];
      TotalDays:=Qry.FieldValues['day'];
      Tanggal.Text:=Qry.FieldValues['from_dates'];
      Jam.Text:=Qry.FieldValues['from_time'];
      JamStandby.Text:=Qry.FieldValues['standby_time'];
      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      if Qry.FieldValues['pickup_point']<>NULL then PickupPoint.Text:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];
      if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then  GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
//      GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        if Qry.FieldValues['fuel_budget_price']>0 then begin
          BBMBBGTotal.Text:=IToCurr(Qry.FieldValues['fuel_budget_price']);
          BBMLiter.Text:=Qry.FieldValues['fuel_budget_litre'];
          BBMRupiah.Text:=IToCurr(Qry.FieldValues['fuel_budget_price']);
        end else begin
          BBMBBGTotal.Text:='0';
          BBMLiter.Text:='0';
          BBMRupiah.Text:='0';
        end;
      if Qry.FieldValues['fee_supir']<>NULL then begin
//        if TotDriver=2 then
//        begin
//          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir1']*Qry.FieldValues['day']);
//          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir1']);
//          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']*Qry.FieldValues['day']);
//          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']);
//          if Qry.FieldValues['fee_supir2']<>NULL  then
//          begin
//            DriverFeeTotal2.Text:=IToCurr(Qry.FieldValues['fee_supir2']*Qry.FieldValues['day']);
//            DriverFee2.Text:=IToCurr(Qry.FieldValues['fee_supir2']);
//          end;

//        end else
//        begin
          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']*Qry.FieldValues['day']);
          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']);
//        end;

      end else begin
        DriverFeeTotal.Text:='0';
        DriverFee.Text:='0';
        DriverFeeTotal2.Text:='0';
        DriverFee2.Text:='0';
      end;
      if Qry.FieldValues['fee_kenek']<>NULL then begin
        BusBoyFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_kenek']*Qry.FieldValues['day']);
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
      if Qry.FieldValues['daily_package']<>NULL then begin
        AllDailyPackage.Checked:=True;
        AllDailyPackage.Enabled:=True;
      end else begin
        AllDailyPackage.Checked:=False;
        AllDailyPackage.Enabled:=False;
      end;
      OrderId:=NoReservasi.Text;
    end;

    EditRemark.Text :=Qry.FieldValues['remark_sj'];

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
  Calculate;
  Main.M_Normal;
end;

procedure TOrderFee.CheckData;
var StrQry,StrRoute2,Trip_type:String;
    Qry:TADOQuery;
    IntCount,IntDoubleFee:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if Trim(NoSJ.Text)<>'' then begin
      TransId:=NoSJ.Text;
      NoBody.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1];
      NoPolisi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][2];

      if SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][38] <> '' then
      begin
        TotDriver:=2;
        Driver.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3];
        Driver2.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][38];
        DriverDisp.Text:=(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4])+' & '+(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][39]);
        DriverFee2.ReadOnly:=False;
      end else
      begin
        TotDriver:=1;
        Driver.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3];
        DriverDisp.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4];
        DriverFee2.ReadOnly:=True;
      end;

      Trip_type:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][41];
      if Trip_type='' then  TripType.ItemIndex:=-1 else
      TripType.ItemIndex:=TripType.Items.IndexOf(Trim(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][41]));

      NoReservasi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][10];
      Customer.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][11];
      TotalDays:=StrToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12]);
      Hari.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12];
      Tanggal.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][13];
      Jam.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][14];
      JamStandby.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][26];
      Seat.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][15];
      Route.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][16];
      PickupPoint.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][17];
      Remark.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][18];
      FromDate.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][13];
      ToDate.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][19];
      Group.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][21];
      Guide.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][22];
      GuideCellular.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][23];
      if SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][24]='1' then AllDailyPackage.Enabled:=True else AllDailyPackage.Enabled:=False;
      AllDailyPackage.Checked:=StrToBool(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][24]);
      if SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][24]='1' then DailyPackage.Checked:=True;
      OrderId:=NoReservasi.Text;
      BBMRupiah.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][27]));
      BBMLiter.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][28];

      IntDoubleFee:= SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][37]);
      if SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][43] ='1' then   CopyBiaya.Enabled := True;

     // else
      //  CopyBiaya.Enabled := False;
  //    if SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][38] <> '' then
  //    begin
  //      DriverFee.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][29]));//*SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12]));
  //      DriverFee2.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][29]));
  //    end else
  //    begin
  //      DriverFee.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][29]));//*SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12]));
  //    end;
  //
  //    BusBoyFee.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][30]));//*SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12]));
  //
  //    Toll.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][31]));
  //    TollParking.Text:=IToCurr(SToInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][32]));
  //
  //    StayNight.Text:=IToCurr(strtoInt(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][33]) * ( StrToint(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12])-1 ) );
      EditRemark.Text :=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][34];

      if BBMLiter.Enabled then BBMLiter.SetFocus else DriverFee.SetFocus;
      Calculate;
    
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Lock_Budget_CompanyId_'+CompanyId)+') AND (active=1);';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['value_string']=1 then LockBudget:=True;
          if Qry.FieldValues['value_string']=0 then LockBudget:=False;
        end;
        Qry.Close;

        FreeAndNil(Qry);
        Main.CloseDb;
        Main.M_Normal;
        Application.ProcessMessages;
      end;

      if AllowUnlockNullBudget then begin
        if (SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][29]='') OR (SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][29]='0') then
          LockBudget:=False;
      end;

      if LockBudget then begin
        DriverFee.Color:=clInfoBk;
        BusBoyFee.Color:=clInfoBk;
      end else begin
        DriverFee.Color:=clWhite;
        BusBoyFee.Color:=clWhite;
      end;
      
      DriverFee.ReadOnly:=LockBudget;
      BusBoyFee.ReadOnly:=LockBudget;
      Label31.Visible:=LockBudget;
      ListKunciCepat.Visible:=LockBudget;


      
    end;
  Main.M_Normal;
  end;
end;


procedure TOrderFee.Calculate;
var TotalBBM,TotalDriverFee,TotalDriverFee2,TotalBusBoyFee,TotalTollParking,
    TotalStayNight,TotalBiaya,IntCount,TotalToll,TotalOvertime:Integer;
begin
  TotalToll:=0;
  TotalBBM:=0;
  TotalBiaya:=0;
  TotalDriverFee:=0;
  TotalDriverFee2:=0;
  TotalBusBoyFee:=0;
  TotalTollParking:=0;
  TotalStayNight:=0;
  TotalOvertime:=0;
  if IsInput then begin
    if (ToString(BBMLiter.Text)<>'') and (IsInput) then begin
      //BBMRupiah.Text:=IToCurr(SolarPerLiter*SToInt(BBMLiter.Text));
      TotalBBM:=SToInt(BBMRupiah.Text);
    end
  end else TotalBBM:=SToInt(BBMRupiah.Text);
  if (Hari.Text<>'') then begin
    if ToString(DriverFee.Text )<>'' then begin
      if (DailyPackage.Checked=False) then
        TotalDriverFee:=SToInt(DriverFee.Text)*SToInt(Hari.Text)
      else
        TotalDriverFee:=SToInt(DriverFee.Text)
    end;
    if ToString(DriverFee2.Text )<>'' then begin
      if (DailyPackage.Checked=False) then
        TotalDriverFee2:=SToInt(DriverFee2.Text)*SToInt(Hari.Text)
      else
        TotalDriverFee2:=SToInt(DriverFee2.Text)
    end;
    if ToString(BusBoyFee.Text )<>'' then begin
      if (DailyPackage.Checked=False) then
        TotalBusBoyFee:=SToInt(BusBoyFee.Text)*SToInt(Hari.Text)
      else
        TotalBusBoyFee:=SToInt(BusBoyFee.Text);
    end;
    if ToString(TollParking.Text )<>'' then begin
      TotalTollParking:=SToInt(TollParking.Text);
    end;
    if ToString(Toll.Text )<>'' then begin
      TotalToll:=SToInt(Toll.Text);
    end;
    if ToString(StayNight.Text )<>'' then begin
      TotalStayNight:=SToInt(StayNight.Text);
    end;

    if ToString(Overtime.Text )<>'' then begin
      TotalOvertime:=SToInt(Overtime.Text);
    end;
  end;
  BBMBBGTotal.Text:=IToCurr(TotalBBM);
  DriverFeeTotal.Text:=IToCurr(TotalDriverFee);
  DriverFeeTotal2.Text:=IToCurr(TotalDriverFee2);
  BusBoyFeeTotal.Text:=IToCurr(TotalBusBoyFee);
  TollParkingTotal.Text:=IToCurr(TotalTollParking);
  TollTotal.Text:=IToCurr(TotalToll);
  StayNightTotal.Text:=IToCurr(TotalStayNight);
  OvertimeTotal.Text:=IToCurr(TotalOvertime);
  TotalBiaya:=TotalDriverFee+TotalDriverFee2+TotalBusBoyFee+TotalTollParking+TotalToll+TotalStayNight+TotalOvertime;
  TotalBayar.Text:=IToCurr(TotalBBM+TotalBiaya);
end;


procedure TOrderFee.BBMLiterEnter(Sender: TObject);
begin
  BBMRupiah.Text:=ToString(BBMRupiah.Text);
end;

procedure TOrderFee.BBMLiterExit(Sender: TObject);
begin
  if ToString(BBMLiter.Text)='' then BBMLiter.Text:='0';
  BBMLiter.Text:=SToCurr(BBMLiter.Text);
  if ToString(BBMLiter.Text)<>'' then begin
    BBMRupiah.Text:=IToCurr(SToInt(BBMLiter.Text)*SolarPerLiter);
    Calculate;
  end;
end;

procedure TOrderFee.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGridSJ;
  InitGridService;
  RefreshCombo;
  if IsInput=False then DisableInput;

  if SJId<>'' then begin
    SPBU2;
    LoadData;
  end else begin
    SPBU2;
    Trip_Type;
    if IsInput=False then DisableInput
    else RefreshData;
  end;
  Main.M_Normal;
  Initiation:=False;
end;


procedure TOrderFee.GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TOrderFee.GridSPJDblClick(Sender: TObject);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
//  Init;
//  InitReport;
//  NoBody.Text:='';
  if (NoBody.Text='') AND (Trim(GridSPJ.Cells[1,IntRow])<>'') AND (GridSPJ.Cells[6,IntRow]<>'OK')  then begin
    Main.M_Busy;
    NoSJ.ItemIndex:=NoSJ.Items.IndexOf(GridSPJ.Cells[0,IntRow]);
    CheckData;
    CekFeeOrder;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin

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
   // CekRepeatOrder;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
    Main.M_Normal;
  end;
end;

procedure TOrderFee.NoSJChange(Sender: TObject);
begin
  Main.M_Busy;
  CheckData;
  Main.M_Normal;
end;

procedure TOrderFee.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Cari.Text:='';
  Init;
  InitGridSJ;
  InitReport;
  InitGridService;
  RefreshCombo;
  RefreshData;
  EnableInput;
  Main.M_Normal;
  Trip_Type;
  CopyBiaya.Checked := False;
  CopyBiaya.Enabled := False;

end;

procedure TOrderFee.SimpanClick(Sender: TObject);
var StrQry,StrEMessage,StrMsg:String;
    Qry:TADOQuery;
    IsOk,IsCetak,IsAuth,IsEmplTrans:Boolean;
    FuelPrice,FuelLitre,GasPrice,GasLitre,TransType,Amount,Amount2,StrFuelPrice,StrFuelLitre:String;
    Count:Integer;
    NoSJArr:Array of String;
begin
  IsCetak:=False;
  IsOk:=True;

  if (LocationId='6') and (spbu.Text='') then
  begin
    MessageBox(0,'Silahkan Isi SPBU','',MB_OK or MB_ICONWARNING);
  end
  else                 
  begin
    if ( (ToString(TotalBayar.Text)<>'0')  AND (SToInt(ToString(TotalBayar.Text))>0) )   then begin
      StrMsg:='Total Dibayarkan Rp.'+TotalBayar.Text+Chr(13)+Chr(13)+'Sudah dihitung dengan benar ?';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      if (Main.OpenDb) AND (MessageBox(0,PChar(StrMsg),'Order Fee',MB_OKCANCEL or MB_ICONQUESTION) = 1) then begin
        DisableInput;
        Main.TransStart;
        if SToInt(BBMRupiah.Text)>0 then StrFuelPrice:=',fuel_budget_price='+ToString(BBMRupiah.Text) else StrFuelPrice:=',fuel_budget_price=NULL';
        if (BBMLiter.Text<>'0') and (Trim(BBMLiter.Text)<>'') then StrFuelLitre:=',fuel_budget_litre='+StringReplace(ToString(BBMLiter.Text),',','.',[rfReplaceAll]) else StrFuelLitre:=',fuel_budget_litre=NULL';
        GasPrice:='0';
        GasLitre:='0';
        StrQry:='';
        if SJId<>'' then begin
          TransId:=SJId;
        end;
          StrQry:='UPDATE wh_vhc_trans_detail SET status=0 WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (transaction_type_id in (140101, 140102, 140103, 140106, 140104, 140113) ) AND (status=1); ';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee[#1]';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        if (LocationId='6') and (AllDailyPackage.Checked=False) then begin
//          StrQry:='UPDATE wh_vhc_trans SET gas_price='+GasPrice+StrFuelPrice+StrFuelLitre+
//                  ',gas_litre='+GasLitre+',out_ordo_km='+IntToStr(LastOdo)+
//                  ',remark=Coalesce(remark,'+QuotedStr('')+')+'+QuotedStr(StrRemarkChange)+
//                  ',update_time=GETDATE(),update_user='+Chr(39)+User+Chr(39)+', spbu_id='+SpbuArr[spbu.ItemIndex][0]+' '+
//                  'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
            StrQry:='UPDATE wh_vhc_trans SET gas_price='+GasPrice+StrFuelPrice+StrFuelLitre+
                  ',gas_litre='+GasLitre+' '+
                  ',remark=Coalesce(remark,'+QuotedStr('')+')+'+QuotedStr(StrRemarkChange)+
                  ',update_time=GETDATE(),update_user='+Chr(39)+User+Chr(39)+', spbu_id='+SpbuArr[spbu.ItemIndex][0]+' '+
                  'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
        end else if (LocationId<>'6') and (AllDailyPackage.Checked=False) then begin
//          StrQry:='UPDATE wh_vhc_trans SET gas_price='+GasPrice+StrFuelPrice+StrFuelLitre+
//                  ',gas_litre='+GasLitre+',out_ordo_km='+IntToStr(LastOdo)+
//                  ',remark=Coalesce(remark,'+QuotedStr('')+')+'+QuotedStr(StrRemarkChange)+
//                  ',update_time=GETDATE(),update_user='+Chr(39)+User+Chr(39)+' '+
//                  'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
            StrQry:='UPDATE wh_vhc_trans SET gas_price='+GasPrice+StrFuelPrice+StrFuelLitre+
                  ',gas_litre='+GasLitre+' '+
                  ',remark=Coalesce(remark,'+QuotedStr('')+')+'+QuotedStr(StrRemarkChange)+
                  ',update_time=GETDATE(),update_user='+Chr(39)+User+Chr(39)+' '+
                  'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
        end else begin
          StrQry:='SELECT a.vhc_trans_id FROM wh_reserved_order_detail_package a '+
                  'LEFT JOIN wh_reserved_order_detail b ON (b.reserved_order_detail_id=a.reserved_order_detail_id) AND (b.status=1) '+
                  'LEFT JOIN wh_reserved_order c ON (c.reserved_order_id=b.reserved_order_id) AND (c.status=1) '+
                  'LEFT JOIN wh_vhc_trans d ON (d.vhc_trans_id=a.vhc_trans_id) AND (d.cancel IS NULL) '+
                  'WHERE c.customer_order_id='+QuotedStr(OrderId)+' AND (a.status=1);';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Count:=0;
          if Qry.RecordCount>0 then while not(Qry.eof) do begin
            SetLength(NoSJArr,Count+1);
            NoSJArr[Count]:=Qry.FieldValues['vhc_trans_id'];
            Qry.Next;
            Inc(Count);
          end;
          StrQry:='';
          for Count:=0 to Length(NoSJArr) do
            StrQry:=StrQry+'UPDATE wh_vhc_trans SET update_time=GETDATE()'+StrFuelPrice+StrFuelLitre+
                    ',remark=Coalesce(remark,'+QuotedStr('')+')+remark '+
                    ',gas_price='+GasPrice+',gas_litre='+GasLitre+',update_user='+Chr(39)+User+Chr(39)+
                    ' WHERE vhc_trans_id='+QuotedStr(NoSJArr[Count])+';';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Order Fee';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
        StrQry:='';
        if (DriverFee.Text<>'0') or (SToInt(BBMRupiah.Text)<1) then begin
          TransType:=QuotedStr('140101');
          Amount:=ToString(DriverFee.Text);
          if AllDailyPackage.Checked=False then begin
            if TotDriver=2 then
            begin
               Amount2:=ToString(DriverFee2.Text);
               StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user,remark,employee_id)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+',GETDATE(),'+QuotedStr(User)+','+QuotedStr(StrRemarkChange)+','+QuotedStr(Driver.Text)+'),'+
                    '('+QuotedStr(TransId)+','+TransType+','+ToString(Amount2)+','+IntToStr(SToInt(Amount2)*SToInt(Hari.Text))+',GETDATE(),'+QuotedStr(User)+','+QuotedStr(StrRemarkChange)+','+QuotedStr(Driver2.Text)+');';
            end else
            begin
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user,remark,employee_id)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+',GETDATE(),'+QuotedStr(User)+','+QuotedStr(StrRemarkChange)+','+QuotedStr(Driver.Text)+');';
            end;
            if Trim (StrQry)<>'' then begin

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

          end else begin
            if TotDriver=2 then
            begin
              Amount2:=ToString(DriverFee2.Text);
              for Count:=0 to Length(NoSJArr) do
                StrQry:=StrQry+' UPDATE wh_vhc_trans_detail SET amount='+Amount+',total_amount='+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+
                        ',remark='+QuotedStr(StrRemarkChange)+
                        ',update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(NoSJArr[Count])+') AND (transaction_type_id='+TransType+') '+
                        'AND employee_id='+QuotedStr(Driver.Text)+';';
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

              for Count:=0 to Length(NoSJArr) do
                StrQry:=StrQry+' UPDATE wh_vhc_trans_detail SET amount='+Amount2+',total_amount='+IntToStr(SToInt(Amount2)*SToInt(Hari.Text))+
                        ',remark='+QuotedStr(StrRemarkChange)+
                        ',update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(NoSJArr[Count])+') AND (transaction_type_id='+TransType+') '+
                        'AND employee_id='+QuotedStr(Driver2.Text)+';';
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

            end else
            begin

              for Count:=0 to Length(NoSJArr) do
                  StrQry:=StrQry+' UPDATE wh_vhc_trans_detail SET amount='+Amount+',total_amount='+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+
                          ',remark='+QuotedStr(StrRemarkChange)+
                          ',update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(NoSJArr[Count])+') AND (transaction_type_id='+TransType+');';
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
          end;
        end;

        StrQry:='';
        if (BusBoyFee.Text<>'0') or (SJId<>'')   then begin
          TransType:=QuotedStr('140102');
          Amount:=ToString(BusBoyFee.Text);
          if AllDailyPackage.Checked=False then begin
            StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user,remark)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount)*SToInt(Hari.Text))+',GETDATE(),'+QuotedStr(User)+','+QuotedStr(StrRemarkChange)+');';
          end else begin
            for Count:=0 to Length(NoSJArr) do
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user,remark)'+
                    ' VALUES ('+QuotedStr(NoSJArr[Count])+','+TransType+','+ToString(Amount)+','+ToString(Amount)+',GETDATE(),'+QuotedStr(User)+','+QuotedStr(StrRemarkChange)+');';
          end;
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
        if (TollParking.Text<>'0') or (SJId<>'')  then begin
          TransType:=QuotedStr('140103');
          Amount:=ToString(TollParking.Text);
          if AllDailyPackage.Checked=False then begin
            StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount))+',GETDATE(),'+QuotedStr(User)+');';
          end else begin
            for Count:=0 to Length(NoSJArr) do
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                      ' VALUES ('+QuotedStr(NoSJArr[Count])+','+TransType+','+ToString(Amount)+','+ToString(Amount)+',GETDATE(),'+QuotedStr(User)+');';
          end;
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee detail (3)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrQry:='';
        if (Toll.Text<>'0') or (SJId<>'')  then begin
          TransType:=QuotedStr('140106');
          Amount:=ToString(Toll.Text);
          if AllDailyPackage.Checked=False then begin
            StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount))+',GETDATE(),'+QuotedStr(User)+');';
          end else begin
            for Count:=0 to Length(NoSJArr) do
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                      ' VALUES ('+QuotedStr(NoSJArr[Count])+','+TransType+','+ToString(Amount)+','+ToString(Amount)+',GETDATE(),'+QuotedStr(User)+');';
          end;
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee detail (4)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrQry:='';
        if (StayNight.Text<>'0') or (SJId<>'')  then begin
          TransType:=QuotedStr('140104');
          Amount:=ToString(StayNight.Text);
          if AllDailyPackage.Checked=False then begin
            StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount))+',GETDATE(),'+QuotedStr(User)+');';
          end else begin
            for Count:=0 to Length(NoSJArr) do
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                      ' VALUES ('+QuotedStr(NoSJArr[Count])+','+TransType+','+ToString(Amount)+','+ToString(Amount)+',GETDATE(),'+QuotedStr(User)+');';
          end;
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee detail (5)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        {Overtime}
        StrQry:='';
        if (Overtime.Text<>'0') or (SJId<>'')  then begin
          TransType:=QuotedStr('140113 ');
          Amount:=ToString(Overtime.Text);
          if AllDailyPackage.Checked=False then begin
            StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                    ' VALUES ('+QuotedStr(TransId)+','+TransType+','+ToString(Amount)+','+IntToStr(SToInt(Amount))+',GETDATE(),'+QuotedStr(User)+');';
          end else begin
            for Count:=0 to Length(NoSJArr) do
              StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,amount,total_amount,update_time,update_user)'+
                      ' VALUES ('+QuotedStr(NoSJArr[Count])+','+TransType+','+ToString(Amount)+','+ToString(Amount)+',GETDATE(),'+QuotedStr(User)+');';
          end;
        end;
        if Trim(StrQry)<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan Order Fee detail (5)';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          if MessageBox(0,'Order Fee Berhasil Disimpan'+Chr(13)+Chr(13)+'    Cetak Slip ?','Uang Order',MB_OKCANCEL or MB_ICONQUESTION) = 1 then
            RePrint(TransId);
          if MessageBox(0,'Cetak SPPB ?','Uang Order',MB_OKCANCEL or MB_ICONQUESTION) = 1 then
            RePrintSPPB(TransId);
        end else begin
          EnableInput;
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Uang Order',MB_OK or MB_ICONWARNING);
        end;
      end else begin
        IsOk:=False;
        StrMsg:='Kolom Tidak boleh Kosong';
      end;
      Qry.Close;
      Qry.Destroy;
    end else
      MessageBox(0,'Silahkan Isi semua kolom','Order Fee',MB_OK or MB_ICONWARNING);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;
{
procedure TOrderFee.RePrint(Trans_Id:String);
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
      if TotalHari>1 then begin
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
        QLFeeSupir.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeSupir.Caption:=IToCurr(TotalAmount);
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
        QLFeeKenek.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeKenek.Caption:=IToCurr(TotalAmount);
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
        QLTolParkir.Caption:=IToCurr(Amount);
        QLTotalTolParkir.Caption:=IToCurr(TotalAmount);
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
        QLLain.Caption:=IToCurr(Amount);
        QLTotalLain.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        QLTotal.Caption:=IToCurr(Total);
        QRLuarKota.Prepare;
        Main.M_Normal;
        QRLuarKota.Preview;
      end else begin
        if RePrintForm.Copy>0 then QCopy.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else QCopy.Caption:='';
        QNoSJ.Caption:=Qry.FieldValues['vhc_trans_id'];
        QTanggal.Caption:=Qry.FieldValues['from_dates'];
        QNama.Caption:=Qry.FieldValues['name'];
        QNoResv.Caption:=Qry.FieldValues['customer_order_id'];
        QNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        if Qry.FieldValues['fuel_price']>0 then begin
          QBBM.Caption:=IToCurr(Qry.FieldValues['fuel_price']);
          Total:=Total+Qry.FieldValues['fuel_price'];
        end else begin
          QBBM.Caption:=IToCurr(Qry.FieldValues['gas_price']);
          Total:=Total+Qry.FieldValues['gas_price'];
        end;
        Qry.Close;
        StrTransId:=QuotedStr('140101');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT SUM(a.amount) AS amount,SUM(total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
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
        QFeeSupir.Caption:=IToCurr(Amount);
        Total:=Total+TotalAmount;
        Qry.Close;
        StrTransId:=QuotedStr('140102');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT SUM(a.amount) AS amount,SUM(total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
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
        QFeeKenek.Caption:=IToCurr(Amount);
        Total:=Total+TotalAmount;
        Qry.Close;
        StrTransId:=QuotedStr('140103');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT SUM(a.amount) AS amount,SUM(total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
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
        QTollParkir.Caption:=IToCurr(Amount);
        Total:=Total+TotalAmount;
        Qry.Close;

        StrTransId:=QuotedStr('140104');
        Amount:=0;
        TotalAmount:=0;
        StrQry:='SELECT SUM(a.amount) AS amount,SUM(total_amount) AS total_amount FROM wh_vhc_trans_detail a '+
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
        if Amount>0 then begin
          QLainlain.Caption:=IToCurr(Amount);
          QLabelLainlain.Caption:='Lain-Lain';
          Total:=Total+TotalAmount;
        end;
        Qry.Close;
        QTotal.Caption:=IToCurr(Total);
        QRDalamKota.Prepare;
        Main.M_Normal;
        QRDalamKota.Preview;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;
}

procedure TOrderFee.PreparePrint;
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
      end else if (FormNumber_Day=4) or (FormNumber_Days=4) then begin
        ppAddress3.Lines.Clear;
        ppCompany3.Caption:=Qry.FieldValues['company_name'];
        ppAddress3.Lines.Add(Qry.FieldValues['address']);
        ppPhone3.Caption:='Telp.'+Qry.FieldValues['phone_no'];
        ppFax3.Caption:='Fax.'+Qry.FieldValues['fax_no'];
        case Qry.FieldValues['logo'] of
          1:ppLogo3.Picture:=Main.LogoWH.Picture;
          2:ppLogo3.Picture:=Main.LogoWHDC.Picture;
          3:ppLogo3.Picture:=Main.LogoWHET.Picture;
          4:ppLogo3.Picture:=Main.LogoDT.Picture;
          5:ppLogo3.Picture:=Main.LogoEUR.Picture;
          6:ppLogo3.Picture:=Main.LogoGL.Picture;
          7:ppLogo3.Picture:=Main.LogoCNR.Picture;
          8:ppLogo3.Picture:=Main.logoDTN.Picture;
        end;
      end;

    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderFee.RePrint(Trans_Id:String);
var Qry:TADOQuery;
    StrQry,StrTransId:String;
    StrTanggal,StrNoReservasi,StrNoSJ,StrDriverName,StrNoPolisi,StrCustomer,StrBBMAmount,StrBBMFeeTotal,StrNoBody:String;
    StrDriverFee,StrDriverFeeTotal,StrBusBoyFee,StrBusBoyFeeTotal,StrTolParkir,StrTolParkirTotal,
    StrTol,StrTolTotal,StrOther,StrOtherTotal,StrTotal,StrCopy,StrHari,StrRoute,StrOvertime,StrOvertimeTotal:String;
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
      if TotDriver=2 then
      begin
         StrDriverName:=Qry.FieldValues['name'] +' & '+ Qry.FieldValues['driver2'];
      end else
      begin
        StrDriverName:=Qry.FieldValues['name'];
      end;

      StrNoPolisi:=LicensePlate(Qry.FieldValues['license_plate']);
      StrNoBody  :=VarToStr(Qry.FieldValues['body_id']);

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

      //TOLL
      StrTransId:=QuotedStr('140106');
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
      StrTol:=IToCurr(Amount);
      StrTolTotal:=IToCurr(TotalAmount);
      {Tol dijumlahkan atau tidak}
      if eToll_Calculation=1 then
        Total:=Total+TotalAmount;
      Qry.Close;

      //Overtime
      StrTransId:=QuotedStr('140113');
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
      StrOvertime:=IToCurr(Amount);
      StrOvertimeTotal:=IToCurr(TotalAmount);
      Total:=Total+TotalAmount;
      Qry.Close;

      StrTotal:=IToCurr(Total);

      Main.M_Normal;
      if FormNumber=1 then begin {form Luar Kota}
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
        if Show_eToll=1 then QLTolParkir.Caption:='Parkir: '+StrTolParkir+' ; Tol:'+StrTol
        else QLTolParkir.Caption:='Parkir: '+StrTolParkir;
        {Tol tidak dijumlahkan}
        //QLTolParkir.Caption:='Parkir: '+StrTolParkir;
        QLTotalTolParkir.Caption:=IToCurr(SToInt(StrTolParkirTotal));

        QLLain.Caption:=StrOther;
        QLTotalLain.Caption:=StrOtherTotal;
        QLTotal.Caption:=StrTotal;
        QRLuarKota.Prepare;
        Main.M_Normal;
        QRLuarKota.Preview;
{        if RePrintForm.Copy>0 then QLCopy.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else QLCopy.Caption:='';
        QLTanggal.Caption:=Qry.FieldValues['from_dates'];
        QLNoSJ.Caption:=Qry.FieldValues['vhc_trans_id'];
        QLNoReservasi.Caption:=Qry.FieldValues['customer_order_id'];
        QLDriver.Caption:=Qry.FieldValues['name'];
        QLBus.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        QLCustomer.Caption:=Qry.FieldValues['customer_name'];
        QLHari.Caption:=Qry.FieldValues['day'];
        if Qry.FieldValues['fuel_price']>0 then begin
//            QLBBM.Caption:=IntToStr(Qry.FieldValues['fuel_litre'])+' Ltr x Rp. '+IToCurr(Qry.FieldValues['fuel_price']);
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
        QLFeeSupir.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeSupir.Caption:=IToCurr(TotalAmount);
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
        QLFeeKenek.Caption:=IntToStr(TotalHari)+' Hr x Rp. '+IToCurr(Amount);
        QLTotalFeeKenek.Caption:=IToCurr(TotalAmount);
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
        QLTolParkir.Caption:=IToCurr(Amount);
        QLTotalTolParkir.Caption:=IToCurr(TotalAmount);
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
        QLLain.Caption:=IToCurr(Amount);
        QLTotalLain.Caption:=IToCurr(TotalAmount);
        Total:=Total+TotalAmount;
        Qry.Close;
        QLTotal.Caption:=IToCurr(Total);
        QRLuarKota.Prepare;
        Main.M_Normal;
        QRLuarKota.Preview;
}      end;
      if (FormNumber=2) then begin
        ppCopy.Caption:=StrCopy;
        ppNoSJ.Caption:=StrNoSJ;
        ppTgl.Caption:=StrTanggal;
        ppDriver.Caption:=StrDriverName;
        ppNoOrder.Caption:=StrNoReservasi;
        ppNoPolisi.Caption:=StrNoPolisi;
        ppBBMFee.Caption:=StrBBMFeeTotal;
        ppDriverFee.Caption:=StrDriverFeeTotal;
        ppOvertime.Caption:=StrOvertimeTotal;
        ppBusboyFee.Caption:=StrBusBoyFeeTotal;
        ppTolParking.Caption:=StrTolParkir;
        if Show_eToll=1 then begin
          //ppTolParking.Caption:='T:'+StrTol+'; P:'+StrTolParkir;
          ppTolParking.Caption:='P:'+StrTolParkir;
          ppEToll.Caption := ' T:'+StrTol;
        end else begin
          ppTolParking.Caption:='P:'+StrTolParkir;
          ppEToll.Caption := '';
        end;

        if StrOther<>'0' then begin
          ppOtherFee.Caption:=StrOther;
          ppLabelOther.Caption:='Lain-Lain';
        end;
        ppTotal.Caption:=StrTotal;
        ppReportUangOrder.PreviewFormSettings.WindowState:=wsMaximized;
        Main.M_Normal;
        ppReportUangOrder.Print;
      end;
//      FormNumber=FormNumber;

      if (FormNumber=3) then begin
        ppCopy2.Caption:=StrCopy;
        ppNoSJ2.Caption:=StrNoSJ;
        ppTgl2.Caption:=StrTanggal;
        ppDriver2.Caption:=StrDriverName;
        ppNoOrder2.Caption:=StrNoReservasi;
        ppNoPolisi2.Caption:=StrNoPolisi+' / '+StrNoBody;
        ppBBMFee2.Caption:=StrBBMFeeTotal;
        ppDriverFee2.Caption:=StrDriverFeeTotal;
        ppOvertime2.Caption:=StrOvertimeTotal;
        ppBusboyFee2.Caption:=StrBusBoyFeeTotal;
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

      if (FormNumber=4) then begin
        ppCopy3.Caption:=StrCopy;
        ppNoSJ3.Caption:=StrNoSJ;
        ppTgl3.Caption:=StrTanggal;
        ppDriver3.Caption:=StrDriverName;
        ppNoOrder3.Caption:=StrNoReservasi;
        ppNoPolisi3.Caption:=StrNoPolisi+' / '+StrNoBody;
        ppBBMFee3.Caption:=StrBBMFeeTotal;
        ppDriverFee3.Caption:=StrDriverFeeTotal;
        ppOvertime3.Caption:=StrOvertimeTotal;
        ppBusboyFee3.Caption:=StrBusBoyFeeTotal;
//        ppTolParking3.Caption:=StrTolParkir;
        if Show_eToll=1 then begin
          //ppTolParking.Caption:='T:'+StrTol+'; P:'+StrTolParkir;
          ppTolParking3.Caption:='P:'+StrTolParkir;
          ppTol3.Caption:='T:'+StrTol;
        end else begin
          ppTolParking3.Caption:='P:'+StrTolParkir;
        end;
        if StrOther<>'0' then begin
          ppOtherFee3.Caption:=StrOther;
          ppLabelOther3.Caption:='Lain-Lain';
        end;
        ppTotal3.Caption:=StrTotal;
        ppReportUangOrder3.PreviewFormSettings.WindowState:=wsMaximized;
        Main.M_Normal;
        ppReportUangOrder3.Print;

      end;

    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TOrderFee.PreparePrintSPPB;
var StrQry,StrAlamat:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  ppSPPBAlamat.Lines.Clear;
  if Main.OpenDb then begin
//    StrQry:='SELECT * FROM wh_location WHERE location_id='+Chr(39)+LocationId+Chr(39)+';';
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
//      QLocation.Caption:=Qry.FieldValues['location'];
//      QAddress.Caption:=Qry.FieldValues['address'];
      ppSPPBAlamat.Lines.Add(Qry.FieldValues['location']);
      StrAlamat:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone_no']<>NULL then
        StrAlamat:=StrAlamat+' Telp.'+LeftStr(Qry.FieldValues['phone_no'],Pos('1',Qry.FieldValues['phone_no']))+'-'+RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-Pos('1',Qry.FieldValues['phone_no']));
      ppSPPBAlamat.Lines.Add(StrAlamat);

      //if CompanyId[1] in ['9','7'] then begin
        case Qry.FieldValues['logo'] of
          1:ppSPPBLogo.Picture:=Main.LogoWH.Picture;
          2:ppSPPBLogo.Picture:=Main.LogoWHDC.Picture;
          3:ppSPPBLogo.Picture:=Main.LogoWHET.Picture;
          4:ppSPPBLogo.Picture:=Main.LogoDT.Picture;
          5:ppSPPBLogo.Picture:=Main.LogoEUR.Picture;
          6:ppSPPBLogo.Picture:=Main.LogoGL.Picture;
          7:ppSPPBLogo.Picture:=Main.LogoCNR.Picture;
          8:ppSPPBLogo.Picture:=Main.logoDTN.Picture;
        end;
      //end;

    end;
    Qry.Close;
    StrQry:='EXEC GetLocationMessage '+LocationId+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      //QMessage.Caption:=Qry.FieldValues['message'];
      ppSPPBMessage.Caption:=Qry.FieldValues['message'];
    end else
      //QMessage.Caption:='';
      ppSPPBMessage.Caption:='';
    Qry.Close;
  end;
  FreeAndNil(Qry);
//  QLogo.Picture:=Main.LogoWHDC.Picture;
  //ppSPPBLogo.Picture:=Main.LogoWHDC.Picture;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TOrderFee.RePrintSPPB(Trans_Id:String);
var Qry:TADOQuery;
    QStr:String;
begin
  if Trans_Id<>'' then begin
    RePrintForm.ReportName:='SPJ Bus';
    RePrintForm.ReportId:=Trans_Id;
    if RePrintForm.ShowModal=1 then begin
      InitReport;
      Main.M_Busy;
      PreparePrintSPPB;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      if Main.OpenDb then begin
        QStr:='SELECT a.vhc_trans_id,CONVERT(VARCHAR(10),a.out_date,103) AS out_date,CONVERT(VARCHAR(5),a.out_time,108) AS out_time '+
              ',a.employee_id,b.name,c.body_id,c.license_plate,a.phone_no,a.out_ordo_km,a.fuel_budget_price,a.fuel_budget_litre '+
              ',a.description,e.empl_history_id,CONVERT(VARCHAR(10),e.from_date,103) AS training_date,f.work_order_id, h.customer_order_id,i.spbu_name '+
              ',CONVERT(VARCHAR(10),g.from_date,103) from_date,CONVERT(VARCHAR(10),g.to_date,103) to_date '+
              'FROM wh_vhc_trans AS a '+
              'INNER JOIN wh_employee AS b ON b.employee_id=a.employee_id '+
              'INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
              'INNER JOIN wh_vhc_detail AS d ON (d.vhc_detail_id='+
              '(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=a.vehicle_id))) AND (GETDATE()>d.from_date) '+
              'LEFT JOIN wh_empl_history e ON e.empl_history_id='+
              '(SELECT empl_history_id FROM wh_empl_history WHERE (employee_id=a.employee_id) AND (company_id=2) AND (empl_history_type_id=9)) '+
      			  'LEFT JOIN wh_work_order f ON f.work_order_id=(SELECT MAX(work_order_id) FROM wh_work_order WHERE (vehicle_id=a.vehicle_id) AND (date_out IS NULL)) '+
              'LEFT JOIN wh_reserved_order_detail g ON g.vhc_trans_id=a.vhc_trans_id and g.status=1 '+
              'LEFT JOIN wh_reserved_order h ON h.reserved_order_id=g.reserved_order_id and h.status=1 '+
              'LEFT JOIN wh_spbu i on a.spbu_id=i.id '+
              'WHERE a.vhc_trans_id='+QuotedStr(Trans_Id)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          ppSPPBNoSPPB.Caption:=Qry.FieldValues['vhc_trans_id'];
          ppSPPBNoOrder.Caption:=Qry.FieldValues['customer_order_id'];
          if (Qry.FieldValues['from_date']=Qry.FieldValues['to_date']) then
            ppSPPBTanggal.Caption:=Qry.FieldValues['from_date']
          else
          ppSPPBTanggal.Caption:=Qry.FieldValues['from_date']+' - '+Qry.FieldValues['to_date'];
          ppSPPBPengemudi.Caption:=Qry.FieldValues['name'];
          ppSPPBNoBodi.Caption:=Qry.FieldValues['body_id'];

          ppSPPBNoPolisi.Caption:=LicensePlate(Qry.FieldValues['license_plate']);
          if (Qry.FieldValues['spbu_name']<>NULL) and (Qry.FieldValues['spbu_name']<>'') then
          begin
            ppspbu.Caption:=Qry.FieldValues['spbu_name'];
          end
          else
          begin
            ppspbu.Caption:='';
          end;

          ppSPPBTelpHP.Caption:=Qry.FieldValues['phone_no'];
          if Qry.FieldValues['out_ordo_km']<>NULL then ppSPPBOdo.Caption:=SToCurr(Qry.FieldValues['out_ordo_km']);
          if Qry.FieldValues['fuel_budget_litre']<>NULL then begin
            if Qry.FieldValues['fuel_budget_litre']>0 then ppSPPBBBMLiter.Caption:=SToCurr(Qry.FieldValues['fuel_budget_litre']);
          end else ppSPPBBBMLiter.Caption:='';

          ppSPPBCatatan.Caption := 'Pengisian hanya berlaku di tanggal '+ppSPPBTanggal.Caption;

          if Qry.FieldValues['fuel_budget_price']<>NULL then begin
            if Qry.FieldValues['fuel_budget_price']>0 then ppSPPBBBMRupiah.Caption:=SToCurr(Qry.FieldValues['fuel_budget_price']);
          end else ppSPPBBBMRupiah.Caption:= '';
          ppSPPBPetugas.Caption:=TitleCase(FullName);
          ppSPPBTandaPetugas.Caption:=TitleCase(FullName);
          ppSPPBTandaPengemudi.Caption:=Qry.FieldValues['name'];
          if (Qry.FieldValues['work_order_id']<>NULL) then ppSPPBNoPKB.Caption:='No PKB   : '+Qry.FieldValues['work_order_id'] else ppSPPBNoPKB.Caption:='';
{          QNoSPJ.Caption:=Qry.FieldValues['vhc_trans_id'];
          QTanggalSPJ.Caption:=Qry.FieldValues['out_date'];
//          QJam.Caption:=Qry.FieldValues['out_time'];
          QPengemudi.Caption:=Qry.FieldValues['name'];
          QNoBody.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            QNoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            QNoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          QTelpHP.Caption:=Qry.FieldValues['phone_no'];
          if Qry.FieldValues['out_ordo_km']<>NULL then QKMOrdo.Caption:=SToCurr(Qry.FieldValues['out_ordo_km']);
          if Qry.FieldValues['fuel_litre']<>NULL then if Qry.FieldValues['fuel_litre']>0 then QBBMLiter.Caption:=SToCurr(Qry.FieldValues['fuel_litre']);
          if Qry.FieldValues['fuel_price']<>NULL then if Qry.FieldValues['fuel_price']>0 then QBBMTotal.Caption:=SToCurr(Qry.FieldValues['fuel_price']);
          QPetugas.Caption:=User;
          QTandaPetugas.Caption:=UpperCase(User);
          QTandaPengemudi.Caption:=Qry.FieldValues['name'];
          if (Qry.FieldValues['work_order_id']<>NULL) then QPKB.Caption:='No PKB   : '+Qry.FieldValues['work_order_id'] else QPKB.Caption:='';
//          if Qry.FieldValues['description']<>NULL then QCatatan.Caption:=Qry.FieldValues['description']
//          else QCatatan.Caption:='';
          if Qry.FieldValues['empl_history_id']<>NULL then begin
            QLabelLayananPrima.Caption:='Training Pelayanan Prima ('+Qry.FieldValues['training_date']+')';
          end else QLabelLayananPrima.Caption:='';
}         Main.M_Normal;
          ppReportSPPB.PreviewFormSettings.WindowState:=wsMaximized;
          ppReportSPPB.Print;
//          QRSPJ.Preview;

        end;
        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end;
  end;
end;

procedure TOrderFee.DisableInput;
begin
  NoSJ.Enabled:=False;
  Hari.Enabled:=False;
  GroupLiter.Enabled:=False;
  GroupBiaya.Enabled:=False;
  GroupSPJ.Enabled:=False;
  Simpan.Enabled:=False;
  GroupBBM.Enabled:=False;
  GroupDailyPackage.Enabled:=False;
end;

procedure TOrderFee.EnableInput;
begin
  NoSJ.Enabled:=True;
  Hari.Enabled:=True;
  GroupLiter.Enabled:=True;
  GroupBiaya.Enabled:=True;
  GroupSPJ.Enabled:=True;
  Simpan.Enabled:=True;
  GroupBBM.Enabled:=True;
  GroupDailyPackage.Enabled:=True;
end;

procedure TOrderFee.RemoveOkClick(Sender: TObject);
begin
  RefreshGridSJ;
end;

procedure TOrderFee.BBMLiterKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DriverFee.SetFocus;
    DriverFee.SelectAll;
  end;
end;

procedure TOrderFee.SelesaiClick(Sender: TObject);
begin
  OrderFee.Close;
end;

procedure TOrderFee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.StatusUpdate('','');
  Action:=caFree;
end;

procedure TOrderFee.HariKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BBMLiter.SetFocus;
end;


procedure TOrderFee.CetakUlangClick(Sender: TObject);
begin
  if SJId<>'' then
    RePrint(SJId)
  else
    OrderFeeList:=TOrderFeeList.Create(Self,'OrderFee-RePrint');
end;

procedure TOrderFee.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoSJ.SetFocus;
end;

procedure TOrderFee.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then BBMLiter.SetFocus;
end;

procedure TOrderFee.DriverFeeEnter(Sender: TObject);
begin
  DriverFee.Text:=ToString(DriverFee.Text);
end;

procedure TOrderFee.BusBoyFeeEnter(Sender: TObject);
begin
  BusBoyFee.Text:=ToString(BusBoyFee.Text);
end;

procedure TOrderFee.TollParkingEnter(Sender: TObject);
begin
  TollParking.Text:=ToString(TollParking.Text);
end;

procedure TOrderFee.StayNightEnter(Sender: TObject);
begin
  StayNight.Text:=ToString(StayNight.Text);
end;

procedure TOrderFee.DriverFeeExit(Sender: TObject);
begin
  if ToString(DriverFee.Text)='' then DriverFee.Text:='0';
  DriverFee.Text:=SToCurr(DriverFee.Text);

  Calculate;
end;

procedure TOrderFee.BusBoyFeeExit(Sender: TObject);
begin
  if ToString(BusBoyFee.Text)='' then BusBoyFee.Text:='0';
  BusBoyFee.Text:=SToCurr(BusBoyFee.Text);
  Calculate;
end;

procedure TOrderFee.TollParkingExit(Sender: TObject);
begin
  if ToString(TollParking.Text)='' then TollParking.Text:='0';
  TollParking.Text:=SToCurr(TollParking.Text);
  Calculate;
end;

procedure TOrderFee.StayNightExit(Sender: TObject);
begin
  if ToString(StayNight.Text)='' then StayNight.Text:='0';
  StayNight.Text:=SToCurr(StayNight.Text);
  Calculate;
end;

procedure TOrderFee.DriverFeeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    BusBoyFee.SetFocus;
    BusBoyFee.SelectAll;
  end;
end;

procedure TOrderFee.BusBoyFeeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    Toll.SetFocus;
    Toll.SelectAll;
  end;
end;

procedure TOrderFee.TollParkingKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    StayNight.SetFocus;
    StayNight.SelectAll;
  end;
end;

procedure TOrderFee.StayNightKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Overtime.SetFocus;
end;

procedure TOrderFee.AllDailyPackageClick(Sender: TObject);
var StrQry,StrReservedOrderDetailId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
//  if not(Initiation) then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      if AllDailyPackage.Checked=True then begin
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
      end else begin
        StrQry:='SELECT CONVERT(VARCHAR(10),out_date,103) AS from_dates,CONVERT(VARCHAR(10),out_date,103) AS to_dates,'+QuotedStr('1')+' AS days '+
                'FROM wh_vhc_trans WHERE vhc_trans_id='+QuotedStr(NoSJ.Text)+';';
      end;
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
    Main.M_Normal;
//  end;
end;

procedure TOrderFee.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGridSJ;
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(SJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2+1;
          GridSPJ.Cells[0,Count2]:=SJArr[Count][0];
          GridSPJ.Cells[1,Count2]:=SJArr[Count][1];
          GridSPJ.Cells[2,Count2]:=SJArr[Count][3];
          GridSPJ.Cells[3,Count2]:=SJArr[Count][4];
          GridSPJ.Cells[4,Count2]:=SJArr[Count][13];
          GridSPJ.Cells[5,Count2]:=SJArr[Count][14];
          GridSPJ.Cells[6,Count2]:=SJArr[Count][14];
          if (SJArr[Count][8]<>'') and (SJArr[Count][9]<>'') then GridSPJ.Cells[7,Count2]:='OK' else GridSPJ.Cells[7,Count2]:='';
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGridSJ;
  end;
end;

procedure TOrderFee.FuelSetClick(Sender: TObject);
begin
  if FuelSet.Checked=True then begin
    BBMLiter.Enabled:=False;
    BBMLiter.Text:=StrBBM;
    Calculate; 
  end;
  if FuelSet.Checked=False then BBMLiter.Enabled:=True;
end;

procedure TOrderFee.CetakUlangSPJClick(Sender: TObject);
begin
  if SJId<>'' then
    RePrintSPPB (SJId)
  else
    OrderFeeList:=TOrderFeeList.Create(Self,'OrderFeeSPPB-Reprint');
end;

procedure TOrderFee.AllClick(Sender: TObject);
begin
  RefreshData;
  RefreshGridSJ;
end;

procedure TOrderFee.BBMRupiahEnter(Sender: TObject);
begin
  BBMRupiah.Text:=ToString(BBMRupiah.Text); 
end;

procedure TOrderFee.BBMRupiahExit(Sender: TObject);
begin
  if ToString(BBMRupiah.Text)='' then BBMRupiah.Text:='0';
  BBMRupiah.Text:=SToCurr(BBMRupiah.Text);
  if ToString(BBMRupiah.Text)<>'' then begin
    BBMLiter.Text:=IToCurr(RoundTo(SToInt(BBMRupiah.Text)/SolarPerLiter,-2));
    Calculate;
  end;
end;

procedure TOrderFee.BBMRupiahKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DriverFee.SetFocus;
    DriverFee.SelectAll;
  end;
end;

procedure TOrderFee.TollEnter(Sender: TObject);
begin
  Toll.Text:=ToString(Toll.Text);
end;

procedure TOrderFee.TollExit(Sender: TObject);
begin
  if ToString(Toll.Text)='' then Toll.Text:='0';
  Toll.Text:=SToCurr(Toll.Text);
  Calculate;
end;

procedure TOrderFee.TollKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    TollParking.SetFocus;
    TollParking.SelectAll;
  end;
end;

procedure TOrderFee.DriverFeeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var IsAuth:Boolean;
    StrRemark:String;
begin
  if LockBudget then begin
    if Key=VK_F5 then begin
      IsAuth:=True;
      AuthorizedForm.FormId:='131201';
      AuthorizedForm.StrMessage:=' Otorisasi Ubah Budget';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then begin
        StrRemark:=InputBox('Perubahan Budget','Sebab perubahan ?','');
        if StrRemark<>'' then begin
          EditRemark.Text :=EditRemark.Text+StrRemark;
          StrRemarkChange:=StrRemark;
          DriverFee.ReadOnly:=False;
          DriverFee2.ReadOnly:=False;
          BusBoyFee.ReadOnly:=False;

          DriverFee.Color:=clWhite;
          DriverFee2.Color:=clWhite;
          BusBoyFee.Color:=clWhite;
        end;
      end;
    end;
  end;

end;

{
procedure TOrderFee.SetRemark(NoSJ:String;Remarks:String='');
var Qry:TADOQuery;
    StrQry,StrRemark:String;
    IntCount:Integer;
    IsFree:Boolean;
begin
  if NoSJ<>'' then begin
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
        if Qry.RecordCount>0 then begin

          EditRemark.Text :=EditRemark.Text+StrRemark;

          if Qry.FieldValues['name']<>NULL then begin
            StrGrid.Cells[9,IntRow]:=Qry.FieldValues['name'];
            StrGrid.Cells[16,IntRow]:=Qry.FieldValues['employee_id'];
            StrGrid.Cells[24,IntRow]:=Qry.FieldValues['name']; //driver name
            StrGrid.Cells[25,IntRow]:=Qry.FieldValues['cellular_no'];
          end;
          StrGrid.Cells[26,IntRow]:=LicensePlate(Qry.FieldValues['license_plate']);

        end;
        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;

  end;
  Main.M_Normal;
end;
}

procedure TOrderFee.OvertimeEnter(Sender: TObject);
begin
  Overtime.Text:=ToString(Overtime.Text);
end;

procedure TOrderFee.OvertimeExit(Sender: TObject);
begin
  if ToString(Overtime.Text)='' then Overtime.Text:='0';
  Overtime.Text:=SToCurr(Overtime.Text);
  Calculate;
end;

procedure TOrderFee.OvertimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TOrderFee.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  IsAuth : Boolean;
begin
    if Key=VK_F6 then begin
      IsAuth:=True;
      AuthorizedForm.FormId:='13120102';
      AuthorizedForm.StrMessage:=' Otorisasi Revisi Budget';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then EnableInput;
 //     else VehicleRDList:=TVehicleRDList.Create(Self,'Bus',StrGrid.Cells[14,IntRow],StrGrid.Cells[17,IntRow],'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow]);
    end;
end;

procedure TOrderFee.spbuChange(Sender: TObject);
begin
 // MessageBox(0,)+,MB_OK or MB_ICONWARNING);

end;

procedure TOrderFee.DriverFee2Enter(Sender: TObject);
begin
DriverFee2.Text:=ToString(DriverFee2.Text);
end;

procedure TOrderFee.DriverFee2Exit(Sender: TObject);
begin
  if ToString(DriverFee2.Text)='' then DriverFee2.Text:='0';
  DriverFee2.Text:=SToCurr(DriverFee2.Text);
  Calculate;
end;

procedure TOrderFee.DriverFee2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var IsAuth:Boolean;
    StrRemark:String;
begin
if LockBudget then begin
    if Key=VK_F5 then begin
      IsAuth :=True;
      AuthorizedForm.FormId:='131201';
      AuthorizedForm.StrMessage:=' Otorisasi Ubah Budget';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then begin
        StrRemark:=InputBox('Perubahan Budget','Sebab perubahan ?','');
        if StrRemark<>'' then begin
          EditRemark.Text :=EditRemark.Text+StrRemark;
          StrRemarkChange:=StrRemark;
          DriverFee.ReadOnly:=False;
          DriverFee2.ReadOnly:=False;
          BusBoyFee.ReadOnly:=False;

          DriverFee.Color:=clWhite;
          DriverFee2.Color:=clWhite;
          BusBoyFee.Color:=clWhite;
        end;
      end;
    end;
  end;
end;

procedure TOrderFee.DriverFee2KeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    BusBoyFee.SetFocus;
    BusBoyFee.SelectAll;
  end;
end;

procedure TOrderFee.DriverFeeChange(Sender: TObject);
begin
  if DriverFee.Text='' then  DriverFee.Text:='0';
end;

procedure TOrderFee.TripTypeChange(Sender: TObject);
begin
  CekFeeOrder;
end;

procedure TOrderFee.BBMRupiahChange(Sender: TObject);
begin
  if BBMRupiah.Text='' then  BBMRupiah.Text:='0';
end;

procedure TOrderFee.BusBoyFeeChange(Sender: TObject);
begin
  if BusBoyFee.Text='' then  BusBoyFee.Text:='0';
end;

procedure TOrderFee.TollChange(Sender: TObject);
begin
  if Toll.Text='' then  Toll.Text:='0';
end;

procedure TOrderFee.TollParkingChange(Sender: TObject);
begin
  if TollParking.Text='' then  TollParking.Text:='0';
end;

procedure TOrderFee.StayNightChange(Sender: TObject);
begin
  if StayNight.Text='' then  StayNight.Text:='0';
end;

procedure TOrderFee.OvertimeChange(Sender: TObject);
begin
  if Overtime.Text='' then  Overtime.Text:='0';
end;

 //penambahan copy uang order
procedure TOrderFee.CopyBiayaClick(Sender: TObject);
var StrQry,StrVhcTransId:String;
    Qry:TADOQuery;
 //   IntCount,IntBermalam:Integer;
begin
//  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then
  begin
    if (CopyBiaya.Checked = True) AND (NoSJ.Text<>'') then
    begin

      StrQry:= 'SELECT TOP 1 a.vhc_trans_id,SUM(a.total_amount),c.from_date FROM wh_vhc_trans_detail a '+
               ' LEFT JOIN wh_vhc_trans b ON a.vhc_trans_id=b.vhc_trans_id  '+
               ' LEFT JOIN wh_reserved_order_detail c ON b.vhc_trans_id=c.vhc_trans_id AND c.status=1 '+
               ' LEFT JOIN wh_reserved_order d ON c.reserved_order_id=d.reserved_order_id '+
               ' WHERE d.customer_order_id='+QuotedStr(NoReservasi.Text)+
               ' AND (b.cancel IS NULL OR b.cancel<>'''')  '+
               ' AND a.transaction_type_id=140101 '+
               ' AND a.status=1  '+
               ' AND c.route='+QuotedStr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][16])+' '+
               ' AND c.product_price_id='+QuotedStr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][44])+' '+
               ' AND c.from_time='+QuotedStr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][14])+' '+
               ' GROUP BY a.vhc_trans_id,c.from_date  '+
               ' ORDER BY c.from_date DESC;';

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then
      begin
        StrVhcTransId := Qry.FieldValues['vhc_trans_id'];
        Qry.Close;
        StrQry:='EXEC GetVhcOutDetail '+QuotedStr(StrVhcTransId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        NoSJ.Items.Add(Qry.FieldValues['vhc_trans_id']);
  //      GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        if Qry.FieldValues['fuel_budget_price']>0 then begin
          BBMBBGTotal.Text:=IToCurr(Qry.FieldValues['fuel_budget_price']);
          BBMLiter.Text:=Qry.FieldValues['fuel_budget_litre'];
          BBMRupiah.Text:=IToCurr(Qry.FieldValues['fuel_budget_price']);
        end else begin
          BBMBBGTotal.Text:='0';
          BBMLiter.Text:='0';
          BBMRupiah.Text:='0';
        end;
        if Qry.FieldValues['fee_supir']<>NULL then begin
  //        if TotDriver=2 then
  //        begin
  //          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir1']*Qry.FieldValues['day']);
  //          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir1']);
  //          DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']*Qry.FieldValues['day']);
  //          DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']);
  //          if Qry.FieldValues['fee_supir2']<>NULL  then
  //          begin
  //            DriverFeeTotal2.Text:=IToCurr(Qry.FieldValues['fee_supir2']*Qry.FieldValues['day']);
  //            DriverFee2.Text:=IToCurr(Qry.FieldValues['fee_supir2']);
  //          end;

  //        end else
  //        begin
            DriverFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_supir']*Qry.FieldValues['day']);
            DriverFee.Text:=IToCurr(Qry.FieldValues['fee_supir']);
  //        end;

        end else begin
          DriverFeeTotal.Text:='0';
          DriverFee.Text:='0';
          DriverFeeTotal2.Text:='0';
          DriverFee2.Text:='0';
        end;

        if Qry.FieldValues['fee_kenek']<>NULL then begin
          BusBoyFeeTotal.Text:=IToCurr(Qry.FieldValues['fee_kenek']*Qry.FieldValues['day']);
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
        Calculate;
      end else
      begin
        CopyBiaya.Checked:=False;
        MessageBox(0,PChar('Uang Order belum ada yang diinput disurat jalan sebelumnya'),'Uang Order',MB_OK or MB_ICONWARNING);
      end;
      Qry.Close

//        else
//         MessageBox(0,PChar('Uang Order belum ada yang diinput disurat jalan sebelumnya'),'Uang Order',MB_OK or MB_ICONWARNING);
//        Calculate;
//        Qry.Close;
    end
    else
    begin
      BBMRupiah.Text:='0';
      BBMBBGTotal.Text:='0';
      BBMLiter.Text:='0';
      DriverFee.Text:='0';
      DriverFee2.Text := '0';
      BusBoyFee.Text:='0';
      Toll.Text:='0';
      TollParking.Text:='0';

      DriverFeeTotal.Text := '0';
      DriverFeeTotal2.Text := '0';
      BusBoyFeeTotal.Text := '0';
      TollTotal.Text := '0';
      TollParkingTotal.Text :='0';
          
      Calculate;
    end;
  end;
//  else
 // end;
  FreeAndNil(Qry);
  Main.CloseDb;
//  Main.M_Normal;
end;

end.
