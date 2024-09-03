unit EmployeeFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB, ComCtrls, WHUnit, Jpeg, Grids,
  ZColorStringGrid, Buttons, Menus;

type
  TEmployeeForm = class(TForm)
    GroupInput1: TGroupBox;
    Nama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TempatLahir: TEdit;
    Label17: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Agama: TComboBox;
    AgamaDisp: TEdit;
    GroupNonInput: TGroupBox;
    LabelId: TLabel;
    NoKPPExpired: TMaskEdit;
    GroupInput2: TGroupBox;
    Simpan3: TButton;
    TglGabung: TDateTimePicker;
    Label19: TLabel;
    TglLahir: TDateTimePicker;
    KPPReferensi: TEdit;
    LabelKPPLama: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    Referensi: TComboBox;
    ReferensiDisp: TEdit;
    LabelReferensi: TLabel;
    ReferensiId: TEdit;
    HistoryPanel: TGroupBox;
    StrGrid: TZColorStringGrid;
    TimerCheck: TTimer;
    NoKTP: TEdit;
    Label13: TLabel;
    Cari: TSpeedButton;
    ArgoPendapatan: TButton;
    Label10: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label24: TLabel;
    SIM: TComboBox;
    SIMDisp: TEdit;
    Label9: TLabel;
    Label25: TLabel;
    NoSIM: TEdit;
    LabelShift: TLabel;
    LabelReguler: TLabel;
    PanelShift: TPanel;
    ShiftPagi: TRadioButton;
    ShiftMalam: TRadioButton;
    ShiftSiang: TRadioButton;
    PanelReguler: TPanel;
    Eksekutif: TRadioButton;
    Reguler: TRadioButton;
    Label14: TLabel;
    NoSIMExpired: TDateTimePicker;
    Label26: TLabel;
    SBU: TComboBox;
    Label29: TLabel;
    ImgTemp: TImage;
    Family: TButton;
    Vehicle: TButton;
    Emergency: TButton;
    Label16: TLabel;
    Panel1: TPanel;
    Gentleman: TRadioButton;
    Ladies: TRadioButton;
    NoHPimei: TEdit;
    Label31: TLabel;
    NoKTPExpired: TDateTimePicker;
    PanelArmada: TPanel;
    Label33: TLabel;
    CariDriver: TSpeedButton;
    NoPolisi: TEdit;
    grpGroupEtoll: TGroupBox;
    CariNoEtoll: TEdit;
    NoEtoll: TComboBox;
    lbl1: TLabel;
    Label34: TLabel;
    RatingInt: TEdit;
    Label37: TLabel;
    IdAbsen: TEdit;
    GroupBox3: TGroupBox;
    BpjsKes: TEdit;
    BpjsKet: TEdit;
    Label18: TLabel;
    Label38: TLabel;
    GolDarah: TComboBox;
    Label39: TLabel;
    Label44: TLabel;
    StatusPanel: TPanel;
    StatusSingle: TRadioButton;
    StatusMenikah: TRadioButton;
    StatusCerai: TRadioButton;
    Label7: TLabel;
    Label45: TLabel;
    Label21: TLabel;
    Anak: TMaskEdit;
    Label20: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    NikKaryawan: TEdit;
    StatusKaryawan: TRadioGroup;
    Label48: TLabel;
    Label49: TLabel;
    NPWP: TEdit;
    GroupBox4: TGroupBox;
    Label41: TLabel;
    NoHPEmergency: TMaskEdit;
    Label50: TLabel;
    NamaKontakDarurat: TEdit;
    GroupRekening: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    AccountNo: TEdit;
    AccountName: TEdit;
    HubunganKontDarurat: TEdit;
    Label51: TLabel;
    Bank: TComboBox;
    Label52: TLabel;
    Label53: TLabel;
    DateBPJSKes: TDateTimePicker;
    Label54: TLabel;
    Label55: TLabel;
    DateBpjsKet: TDateTimePicker;
    Nppbpjsket: TEdit;
    Label56: TLabel;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Alamat: TMemo;
    SamaKTP: TCheckBox;
    Label27: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    AlamatSekarang: TMemo;
    Label4: TLabel;
    NoTelp: TMaskEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    NoHP: TMaskEdit;
    lbl3: TLabel;
    NoHP2: TMaskEdit;
    Email: TEdit;
    Label59: TLabel;
    Label60: TLabel;
    NoKK: TEdit;
    GroupBox6: TGroupBox;
    Label32: TLabel;
    Departemen: TComboBox;
    Label57: TLabel;
    Level: TComboBox;
    Label58: TLabel;
    GroupBox7: TGroupBox;
    GroupFoto: TGroupBox;
    Foto: TImage;
    GroupBox1: TGroupBox;
    FotoKK: TImage;
    GroupBox2: TGroupBox;
    FotoKTP: TImage;
    GroupSIM: TGroupBox;
    FotoSIM: TImage;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    PendidikanTerakhir: TComboBox;
    PendidikanTerakhirDisp: TEdit;
    Label61: TLabel;
    Jurusan: TEdit;
    Label62: TLabel;
    TahunKelulusan: TEdit;
    Label63: TLabel;
    TahunMasuk: TEdit;
    Label6: TLabel;
    InstitusiPendidikan: TEdit;
    Label64: TLabel;
    ipk: TEdit;
    Panel2: TPanel;
    Simpan: TButton;
    Selesai: TButton;
    Riwayat: TButton;
    Posisi: TEdit;
    IdKaryawan: TEdit;
    Label65: TLabel;
    Label40: TLabel;
    Label66: TLabel;
    Tinggi: TEdit;
    Berat: TEdit;
    Label67: TLabel;
    cm: TLabel;
    kg: TLabel;
    Label68: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure PendidikanTerakhirChange(Sender: TObject);
    procedure AgamaChange(Sender: TObject);
    procedure ReferensiChange(Sender: TObject);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure TempatLahirKeyPress(Sender: TObject; var Key: Char);
    procedure TglLahirKeyPress(Sender: TObject; var Key: Char);
    procedure AlamatKeyPress(Sender: TObject; var Key: Char);
    procedure NoTelpKeyPress(Sender: TObject; var Key: Char);
    procedure NoHPKeyPress(Sender: TObject; var Key: Char);
    procedure PendidikanTerakhirKeyPress(Sender: TObject; var Key: Char);
    procedure InstitusiPendidikanKeyPress(Sender: TObject; var Key: Char);
    procedure StatusSingleKeyPress(Sender: TObject; var Key: Char);
    procedure StatusMenikahKeyPress(Sender: TObject; var Key: Char);
    procedure StatusCeraiKeyPress(Sender: TObject; var Key: Char);
    procedure AnakKeyPress(Sender: TObject; var Key: Char);
    procedure AgamaKeyPress(Sender: TObject; var Key: Char);
    procedure NoSIMKeyPress(Sender: TObject; var Key: Char);
    procedure NoSIMExpiredKeyPress(Sender: TObject; var Key: Char);
    procedure TglGabungKeyPress(Sender: TObject; var Key: Char);
    procedure ReferensiKeyPress(Sender: TObject; var Key: Char);
    procedure ShiftPagiKeyPress(Sender: TObject; var Key: Char);
    procedure ShiftSiangKeyPress(Sender: TObject; var Key: Char);
    procedure ShiftMalamKeyPress(Sender: TObject; var Key: Char);
    procedure Simpan2Click(Sender: TObject);
    procedure SIMChange(Sender: TObject);
    procedure SIMKeyPress(Sender: TObject; var Key: Char);
    procedure FotoDblClick(Sender: TObject);
    procedure FotoSIMDblClick(Sender: TObject);
    procedure ReferensiIdKeyPress(Sender: TObject; var Key: Char);
    procedure KPPReferensiKeyPress(Sender: TObject; var Key: Char);
    procedure Simpan3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
    procedure NoKTPKeyPress(Sender: TObject; var Key: Char);
    procedure CariClick(Sender: TObject);
    procedure EksekutifKeyPress(Sender: TObject; var Key: Char);
    procedure RegulerKeyPress(Sender: TObject; var Key: Char);
    procedure RiwayatClick(Sender: TObject);
    procedure ArgoPendapatanClick(Sender: TObject);
    procedure FamilyClick(Sender: TObject);
    procedure EmergencyClick(Sender: TObject);
    procedure VehicleClick(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
    procedure AccountNoKeyPress(Sender: TObject; var Key: Char);
    procedure AccountNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CariNoEtollChange(Sender: TObject);
    procedure FotoKTPDblClick(Sender: TObject);
    procedure FotoKKDblClick(Sender: TObject);
    procedure RatingIntKeyPress(Sender: TObject; var Key: Char);
    procedure NoHP2Change(Sender: TObject);
    procedure SamaKTPClick(Sender: TObject);

  private
    { Private declarations }
    PendidikanArr,AgamaArr,ReferensiArr,LokasiArr,SIMArr, DeptArr:Array of TArrString2;
    IsOkClose,IsReadOnly,IsInputGrid,IsFotoOnly:Boolean;
    CompanyArr,EtollArr:Array of TArrString5;
    MinRowGrid:Integer;
    MitraId,VhcId,FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
    procedure InitHistory;
    procedure LoadHistory;
    procedure RefreshNoEtoll;
//    function AddLeadingZero(Id:Integer;Len:Integer):String;
  public
    { Public declarations }
    EmplType:Integer;
    EmplId:String;
    EmplCode:String;
    procedure SetMitra(Mitra_Id:String);
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='';IsFoto_Only:Boolean=False;Is_ReadOnly:Boolean=True;Form_Request:String='');Overload;
  end;

var
  EmployeeForm: TEmployeeForm;

implementation

{$R *.dfm}

Uses MainU, StrUtils, DateUtils,DB, ImageViewerU, EmployeeListU, EmployeeSearchU ,
  EmployeeHistoryListU, ArgoAllowanceFormU, EmployeeFamilyFormU,
  EmployeeEmergencyFormU, EmployeeVehicleFormU, RegistrationOLListU,
  VehicleFormU;

constructor TEmployeeForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='';IsFoto_Only:Boolean=False;Is_ReadOnly:Boolean=True;Form_Request:String='');
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    EmplCode:='BS';
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
    EmplCode:='BB';
  end else if UpperCase(EmployeeType)='GRAYLINE' then begin
    EmplType:=2;
    EmplCode:='GL';
  end else if UpperCase(EmployeeType)='OFFICE' then begin
    EmplType:=3;
    EmplCode:='OF';
  end;
  EmplId:=EmployeeId;
  IsReadOnly:=Is_ReadOnly;
  IsFotoOnly:=IsFoto_Only;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TEmployeeForm.Init;
begin
  PanelArmada.Visible:=True;
  case EmplType of
    1:begin
        Caption:='Data Mitra';
        LabelId.Caption:='No KPP';
        GroupInput2.Height:=220;
        EmployeeForm.Height:=153;
//        LabelKPPLama.Caption:='No KPP Lama';
//        LabelReferensi.Caption:='No KPP Sumber';
//        PanelDept.Visible:=False;
        Label32.Visible:=False;
        Departemen.Visible:=False;
      end;
    2:begin
        Caption:='Data Driver';
//        LabelId.Caption:='No Pengemudi';
//        GroupInput2.Height:=85;
//        EmployeeForm.Height:=725;
//        LabelKPPLama.Caption:='No ID Lama';
//        LabelReferensi.Caption:='No Id Sumber';
//        PanelDept.Visible:=False;
//        Label32.Visible:=False;
//        Departemen.Visible:=False;

      end;
    3:begin
        Caption:='Data Karyawan';
        LabelId.Caption:='NIK';
        GroupInput2.Height:=44;
//        EmployeeForm.Height:=559;
//        GroupInput2.Height:=147;
//        LabelKPPLama.Caption:='NIK Lama';//'NIK Lama';
//        LabelReferensi.Caption:='Identitas Sumber';
//        PanelDept.Visible:=True;
        Label32.Visible:=True;
        Departemen.Visible:=True;
        PanelArmada.Visible:=False;
      end;
    4:begin
        Caption:='Data BusBoy';
        LabelId.Caption:='No BusBoy';
//        GroupInput2.Height:=220;
//        EmployeeForm.Height:=153;


//        LabelKPPLama.Caption:='No BusBoy Lama';
//        LabelReferensi.Caption:='No Id Sumber';
//        PanelDept.Visible:=False;
//        Label32.Visible:=False;
//        Departemen.Visible:=False;
      end;
  end;
  TimerCheck.Enabled:=True;
  GroupFoto.Visible:=True;
  GroupSIM.Visible:=True;
  IdKaryawan.Text:='';
  NoKPPExpired.Text:='';
  NoKTP.Text:='';
  NoKK.Text:='';
  Nama.Text:='';
  TempatLahir.Text:='';
  TglLahir.Date:=StrToDate('01/01/1970') ;
  Alamat.Text:='';
  NoTelp.Text:='';
  NoHP.Text:='';
  NPWP.Text:='';
  Tinggi.Text:='';
  Berat.Text:='';
  PendidikanTerakhir.Clear;
  PendidikanTerakhir.ItemIndex:=0;
  PendidikanTerakhirDisp.Text:='';
  InstitusiPendidikan.Text:='';
  TahunMasuk.Text:='';
  TahunKelulusan.Text:='';
  Jurusan.Text:='';
  ipk.Text:='';
  Email.Text:='';
  StatusSingle.Checked:=True;
  StatusMenikah.Checked:=False;
  StatusCerai.Checked:=False;
  StatusKaryawan.ItemIndex:=0;
  Agama.Clear;
  Agama.ItemIndex:=0;
  AgamaDisp.Text:='';
  KPPReferensi.Text:='';
  SIM.Clear;
  SIM.ItemIndex:=0;
  SIMDisp.Text:='';
  NoSIM.Text:='';
  NoSIMExpired.Date:=Now;
  TglGabung.Date:=Now;
  Anak.Text:='';
  Referensi.Clear;
  Referensi.ItemIndex:=0;
  ReferensiDisp.Text:='';
  ReferensiId.Text:='';
  AccountNo.Text:='';
  AccountName.Text:='';
  BpjsKes.Text:='';
  BpjsKet.Text:='';
  Nppbpjsket.Text:='';
  DateBPJSKes.Format:=ShortDateFormat;
  DateBPJSKet.Format:=ShortDateFormat;
  NoHPEmergency.Text:='';
  AlamatSekarang.Text:='';
  NikKaryawan.Text:='';
  StatusKaryawan.ItemIndex:=-1;
  Bank.ItemIndex:=-1;
  NamaKontakDarurat.Text:='';
  HubunganKontDarurat.Text:='';
  Posisi.Text:='';
  Level.ItemIndex:=-1;
  Departemen.ItemIndex:=-1;

  ReferensiId.Enabled:=False;
  ShiftPagi.Checked:=True;
  ShiftSiang.Checked:=False;
  ShiftMalam.Checked:=False;
  IsOkClose:=False;
  Simpan.Visible:=True;
  GroupInput1.Enabled:=True;
  GroupInput2.Enabled:=True;
  Simpan3.Visible:=False;
  Family.Visible:=False;
  Emergency.Visible:=False;
  Vehicle.Visible:=False;
  Eksekutif.Checked:=True;
  LabelReguler.Visible:=True;
  PanelReguler.Visible:=True;
  Riwayat.Visible:=False;
  ArgoPendapatan.Visible:=False;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  DisableInput;
  Simpan.Visible:=False;
  MitraId:='';
  VhcId:='';
end;


procedure TEmployeeForm.DisableInput;
begin
  GroupInput1.Enabled:=False;
  GroupInput2.Enabled:=False;
end;

procedure TEmployeeForm.EnableInput;
begin
  GroupInput1.Enabled:=True;
  GroupInput2.Enabled:=True;
end;

procedure TEmployeeForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_education';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(PendidikanArr,IntCount+1);
      PendidikanTerakhir.Items.Add(Qry.FieldValues['education_id']);
      PendidikanArr[IntCount][0]:=Qry.FieldValues['education_id'];
      PendidikanArr[IntCount][1]:=Qry.FieldValues['education'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_religion';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(AgamaArr,IntCount+1);
      Agama.Items.Add(Qry.FieldValues['religion_id']);
      AgamaArr[IntCount][0]:=Qry.FieldValues['religion_id'];
      AgamaArr[IntCount][1]:=Qry.FieldValues['religion'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_reference WHERE company_id='+CompanyId ;
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(ReferensiArr,IntCount+1);
      Referensi.Items.Add(Qry.FieldValues['reference']);
      ReferensiArr[IntCount][0]:=Qry.FieldValues['reference_id'];
      ReferensiArr[IntCount][1]:=Qry.FieldValues['reference'];
      ReferensiArr[IntCount][2]:=Qry.FieldValues['local'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
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
    StrQry:='SELECT * FROM wh_license_type';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(SIMArr,IntCount+1);
      SIM.Items.Add(Qry.FieldValues['license_type_id']);
      SIMArr[IntCount][0]:=Qry.FieldValues['license_type_id'];
      SIMArr[IntCount][1]:=Qry.FieldValues['license_type'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(DeptArr,IntCount+1);
      DeptArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DeptArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  if ((TreeTag=120201) OR (TreeTag=130201)) then begin
    Referensi.ItemIndex:=0;
//    ReferensiDisp.Text:='Tidak Ada';
  end else begin

  end;
  if Departemen.Visible then begin
    Departemen.Text:='';
    Departemen.Items.Clear;
    Departemen.ItemIndex:=-1;
    for IntCount:=0 to Length(DeptArr)-1 do
      Departemen.Items.Add(DeptArr[IntCount][1]);
  end;
  Main.M_Normal;
end;

procedure TEmployeeForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+EmplId;
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IdKaryawan.Text:=Qry.FieldValues['employee_id'];
    if Qry.FieldValues['nik_karyawan']<>NULL then NikKaryawan.Text:=Qry.FieldValues['nik_karyawan'];
    if Qry.FieldValues['status_karyawan']=1 then StatusKaryawan.ItemIndex:=0
    else if Qry.FieldValues['status_karyawan']=2 then StatusKaryawan.ItemIndex:=1
    else StatusKaryawan.ItemIndex:=-1;
    if Qry.FieldValues['no_bpjs_kes']<>NULL then BpjsKes.Text:=Qry.FieldValues['no_bpjs_kes'];
    if Qry.FieldValues['no_bpjs_ket']<>NULL then BpjsKet.Text:=Qry.FieldValues['no_bpjs_ket'];
    if Qry.FieldValues['npp_bpjs_ket']<>NULL then Nppbpjsket.Text:=Qry.FieldValues['npp_bpjs_ket'];
    if Qry.FieldValues['date_bpjs_kes']<>NULL then DateBPJSKes.Date:=StrToDate(Qry.FieldValues['date_bpjs_kes']);
    if Qry.FieldValues['date_bpjs_ket']<>NULL then DateBpjsKet.Date:=StrToDate(Qry.FieldValues['date_bpjs_ket']);
    if Qry.FieldValues['height']<>NULL then Tinggi.Text:=Qry.FieldValues['height'];
    if Qry.FieldValues['weight']<>NULL then Berat.Text:=Qry.FieldValues['weight'];
//
    if Qry.FieldValues['gol_darah']='A' then GolDarah.ItemIndex:=0
    else if Qry.FieldValues['gol_darah']='B' then GolDarah.ItemIndex:=1
    else if Qry.FieldValues['gol_darah']='AB' then GolDarah.ItemIndex:=2
    else if Qry.FieldValues['gol_darah']='O' then GolDarah.ItemIndex:=3
    else GolDarah.ItemIndex:=-1;
    if Qry.FieldValues['address2']<>NULL then AlamatSekarang.Text:=Qry.FieldValues['address2'];
    if Qry.FieldValues['cellular_emergency']<>NULL then NoHPEmergency.Text:=Qry.FieldValues['cellular_emergency'];
    if Qry.FieldValues['name_emergency']<>NULL then NamaKontakDarurat.Text:=Qry.FieldValues['name_emergency'];
    if Qry.FieldValues['relationship_emergency']<>NULL then HubunganKontDarurat.Text:=Qry.FieldValues['relationship_emergency'];
    if Qry.FieldValues['kpp_expired']<>NULL then
      NoKPPExpired.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['kpp_expired']));
    Nama.Text:=Qry.FieldValues['name'];
    if Qry.FieldValues['email']<>NULL then Email.Text:=Qry.FieldValues['email'];
    if Qry.FieldValues['sex']=1 then Gentleman.Checked:=True
    else if Qry.FieldValues['sex']=2 then Ladies.Checked:=True;
    if Qry.FieldValues['id_number']<>NULL then
      NoKTP.Text:=Qry.FieldValues['id_number'];
    if Qry.FieldValues['birth_town']<>NULL then
      TempatLahir.Text:=Qry.FieldValues['birth_town'];
    if Qry.FieldValues['birth_date']<>NULL then
      TglLahir.Date:=Qry.FieldValues['birth_date'];
    if Qry.FieldValues['address']<>NULL then
      Alamat.Text:=Qry.FieldValues['address'];
    if Qry.FieldValues['address']=Qry.FieldValues['address2'] then SamaKTP.Checked:=True
    else SamaKTP.Checked:=False;

    if Qry.FieldValues['family_card_no']<>NULL then
      NoKK.Text:=Qry.FieldValues['family_card_no'];

    if Qry.FieldValues['rating']<>NULL then
      RatingInt.Text:=Qry.FieldValues['rating'];
    if Qry.FieldValues['phone_no']<>NULL then NoTelp.Text:=Qry.FieldValues['phone_no'];
    if Qry.FieldValues['cellular_no']<>NULL then NoHP.Text:=Qry.FieldValues['cellular_no'];
    if Qry.FieldValues['education_institution']<>NULL then InstitusiPendidikan.Text:=Qry.FieldValues['education_institution'];
    if Qry.FieldValues['old_id_reference']<>NULL then KPPReferensi.Text:=Qry.FieldValues['old_id_reference'];
    if Qry.FieldValues['education_id']<>NULL then begin
      PendidikanTerakhir.ItemIndex:=PendidikanTerakhir.Items.IndexOf(Qry.FieldValues['education_id']);
      PendidikanTerakhirDisp.Text:=PendidikanArr[PendidikanTerakhir.ItemIndex][1];
    end;
    if Qry.FieldValues['education_entry_year']<>NULL then TahunMasuk.Text:=Qry.FieldValues['education_entry_year'];
    if Qry.FieldValues['education_out_year']<>NULL then TahunKelulusan.Text:=Qry.FieldValues['education_out_year'];
    if Qry.FieldValues['education_major']<>NULL then Jurusan.Text:=Qry.FieldValues['education_major'];
    if Qry.FieldValues['education_ipk']<>NULL then ipk.Text:=Qry.FieldValues['education_ipk'];
    if Qry.FieldValues['marital_status_id']<>NULL then
    Case Qry.FieldValues['marital_status_id'] of
      1:StatusSingle.Checked:=True;
      2:StatusMenikah.Checked:=True;
      3:StatusCerai.Checked:=True;
    end;
    if Qry.FieldValues['children']<>NULL then
      Anak.Text:=Qry.FieldValues['children'];
    if Qry.FieldValues['religion_id']<>NULL then begin
      Agama.ItemIndex:=Agama.Items.IndexOf(Qry.FieldValues['religion_id']);
      AgamaDisp.Text:=AgamaArr[Agama.ItemIndex][1];
    end;
    if Qry.FieldValues['license_type_id']<>NULL then begin
      SIM.ItemIndex:=SIM.Items.IndexOf(Qry.FieldValues['license_type_id']);
      SIMDisp.Text:=SIMArr[SIM.ItemIndex][1];
    end;
    if Qry.FieldValues['license_id']<>NULL then
      NoSIM.Text:=Qry.FieldValues['license_id'];
    if Qry.FieldValues['license_expired']<>NULL then
      NoSIMExpired.Date:=StrToDate(Qry.FieldValues['license_expired']);
    if Qry.FieldValues['join_date']<>NULL then
      TglGabung.Date:=Qry.FieldValues['join_date'];
    if Qry.FieldValues['reference_id']<>NULL then begin
      Referensi.ItemIndex:=ArrayIndexOf(ReferensiArr,Qry.FieldValues['reference_id'],0) ;
      ReferensiDisp.Text:=ReferensiArr[Referensi.ItemIndex][1];
    end;

    if Qry.FieldValues['department_id']<>NULL then begin
      Departemen.ItemIndex:=ArrayIndexOf(DeptArr, Qry.FieldValues['department_id'],0) ;
    end;
    if Qry.FieldValues['job_position']<>NULL then begin
      Posisi.Text:=Qry.FieldValues['job_position'] ;
    end;

    if Qry.FieldValues['job_level']='Commissioner' then Level.ItemIndex:=0
    else if Qry.FieldValues['job_level']='Director' then Level.ItemIndex:=1
    else if Qry.FieldValues['job_level']='Executive Manager' then Level.ItemIndex:=2
    else if Qry.FieldValues['job_level']='Manager' then Level.ItemIndex:=3
    else if Qry.FieldValues['job_level']='Assistant Manager' then Level.ItemIndex:=4
    else if Qry.FieldValues['job_level']='Supervisor' then Level.ItemIndex:=5
    else if Qry.FieldValues['job_level']='Staff' then Level.ItemIndex:=6
    else if Qry.FieldValues['job_level']='Non Staff' then Level.ItemIndex:=7
    else Level.ItemIndex:=-1;

    if Qry.FieldValues['no_npwp']<>NULL then
      NPWP.Text:=Qry.FieldValues['no_npwp'];
    if Qry.FieldValues['reference']<>NULL then ReferensiId.Text:=Qry.FieldValues['reference'];
    Case Qry.FieldValues['day_night'] of
      1:ShiftPagi.Checked:=True;
      2:ShiftSiang.Checked:=True;
      3:ShiftMalam.Checked:=True;
    end;
    if Qry.FieldValues['reguler']=1 then Reguler.Checked:=True else Eksekutif.Checked:=True;

    if Qry.FieldValues['account_number']<>NULL then
      AccountNo.Text:=Qry.FieldValues['account_number'];
    if Qry.FieldValues['account_name']<>NULL then
      AccountName.Text:=Qry.FieldValues['account_name'];
    if Qry.FieldValues['account_bank']='BCA' then
      Bank.ItemIndex:=0
    else if Qry.FieldValues['account_bank']='PANIN' then
      Bank.ItemIndex:=1
    else Bank.ItemIndex:=-1;

    if Qry.FieldValues['no_etoll']<>NULL then begin
      for IntCount:=0 to Length(EtollArr)-1 do
        if trim(EtollArr[IntCount][0])=Trim(VarToStr(Qry.FieldValues['no_etoll'])) then NoEtoll.ItemIndex:=IntCount;

    end;

    if Qry.FieldValues['id_attandance_mapping']<>NULL then
      idAbsen.Text:=Qry.FieldValues['id_attandance_mapping'];

    if Qry.FieldValues['vehicle_id']<>NULL then
      VhcId:=Qry.FieldValues['vehicle_id'];
    if Qry.FieldValues['license_plate']<>NULL then LicensePlate(Qry.FieldValues['license_plate']);
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      if (CompanyArr[IntCount][1]=Qry.FieldValues['company_id']) and  (CompanyArr[IntCount][2]=Qry.FieldValues['location_id']) then SBU.ItemIndex:=IntCount;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
          '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
          ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=1);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        Foto.Picture.Assign(JPG);
        Foto.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
          '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
          ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=2);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoSIM.Picture.Assign(JPG);
        FotoSIM.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
          '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
          ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=6);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoKK.Picture.Assign(JPG);
        FotoKK.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
          '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
          ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=5);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoKTP.Picture.Assign(JPG);
        FotoKTP.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeForm.SetMitra(Mitra_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    MitraId:=Mitra_Id;
    StrQry:='EXEC GetWebData '+QuotedStr(Mitra_Id);
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Nama.Text:=Qry.FieldValues['name'];
    if Qry.FieldValues['sex']=1 then Gentleman.Checked:=True
    else if Qry.FieldValues['sex']=2 then Ladies.Checked:=True;
    if Qry.FieldValues['identity_card']<>NULL then
      NoKTP.Text:=Qry.FieldValues['identity_card'];
    if Qry.FieldValues['place_of_birth']<>NULL then
      TempatLahir.Text:=Qry.FieldValues['place_of_birth'];
    if Qry.FieldValues['date_of_birth']<>NULL then
      TglLahir.Date:=Qry.FieldValues['date_of_birth'];
    if Qry.FieldValues['address']<>NULL then
      Alamat.Text:=Qry.FieldValues['address'];
    if Qry.FieldValues['imei']<>NULL then NoHPimei.Text:=Qry.FieldValues['imei'];
    if Qry.FieldValues['mobilephone']<>NULL then NoHP.Text:=Qry.FieldValues['mobilephone'];
    if Qry.FieldValues['phone']<>NULL then NoTelp.Text:=Qry.FieldValues['phone'];
//    if Qry.FieldValues['education_institution']<>NULL then InstitusiPendidikan.Text:=Qry.FieldValues['education_institution'];
//    if Qry.FieldValues['old_id_reference']<>NULL then KPPReferensi.Text:=Qry.FieldValues['old_id_reference'];
//    if Qry.FieldValues['education_id']<>NULL then begin
//      PendidikanTerakhir.ItemIndex:=PendidikanTerakhir.Items.IndexOf(Qry.FieldValues['education_id']);
//      PendidikanTerakhirDisp.Text:=PendidikanArr[PendidikanTerakhir.ItemIndex][1];
//    end;
    if Qry.FieldValues['marital_status']<>NULL then
    Case Qry.FieldValues['marital_status'] of
      1:StatusSingle.Checked:=True;
      2:StatusMenikah.Checked:=True;
      3:StatusCerai.Checked:=True;
    end;
    if Qry.FieldValues['children']<>NULL then
      Anak.Text:=Qry.FieldValues['children'];
//    if Qry.FieldValues['religion_id']<>NULL then begin
//      Agama.ItemIndex:=Agama.Items.IndexOf(Qry.FieldValues['religion_id']);
//      AgamaDisp.Text:=AgamaArr[Agama.ItemIndex][1];
//    end;
//    if Qry.FieldValues['license_type_id']<>NULL then begin
//      SIM.ItemIndex:=SIM.Items.IndexOf(Qry.FieldValues['license_type_id']);
//      SIMDisp.Text:=SIMArr[SIM.ItemIndex][1];
//    end;
    if Qry.FieldValues['driver_license']<>NULL then
      NoSIM.Text:=Qry.FieldValues['driver_license'];
//  NoSIMExpired.Date:=FormatDateTime('dd/mm/yyyy',StrToDate(QEmpl.FieldValues['license_expired']));
    if Qry.FieldValues['exp_driver_license']<>NULL then
      NoSIMExpired.Date:=StrToDate(Qry.FieldValues['exp_driver_license']);
//    if Qry.FieldValues['join_date']<>NULL then
//      TglGabung.Date:=Qry.FieldValues['join_date'];
{    for IntCount:=0 to Length(CompanyArr)-1  do begin
      if (CompanyArr[IntCount][1]=Qry.FieldValues['company_id']) and  (CompanyArr[IntCount][2]=Qry.FieldValues['location_id']) then SBU.ItemIndex:=IntCount;
    end;
}
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeForm.SimpanClick(Sender: TObject);
var Qry,Qry2,QryWehaOnline:TADOQuery;
    StrQry,NewIdS,StrMsg,StrException,StrHP,StrRef,StrRefId,StrKPPRef,StrKTP,StrReguler,StrAnak,StrPendidikan,StrInstitusi,StrShift,StrSex, StrGender,
    StrQryWehaOnline,StrQryWehaOnlineCek:String;
    StrReligion,StrSIM,StrAlamat,StrName,StrRelation,StrPhoneNo,StrBirth,StrJob,StrYear,StrEMsg,StrPINDriver,
    StrVhcName,StrOwn,StrDept,StrRatingInt,StrNoRek,StrNamaRek,StrNoEtoll,StrIdAbsen,StrPhoneLogin,StrStatusKaryawan,StrWehaUserID,StrContactID:String;
    IsOk,IsNoRecord:Boolean;
    NewId,Status,IntCount:Integer;
    StrList:TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  QryWehaOnline:=TADOQuery.Create(Self);
  QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
  QryWehaOnline.CommandTimeout := 360000;
  QryWehaOnline.ParamCheck:=False;



  if (Trim(NikKaryawan.Text)<>'') then begin
    if (IdKaryawan.Text<>'') then begin
      StrQry:='SELECT nik_karyawan from wh_employee where nik_karyawan='+QuotedStr(NikKaryawan.Text)+' and employee_id<>'+QuotedStr(IdKaryawan.Text);
    end else begin
      StrQry:='SELECT nik_karyawan from wh_employee where nik_karyawan='+QuotedStr(NikKaryawan.Text);
    end;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      MessageBox(0,PChar('NIK Karyawan sudah ada'+Chr(13)+Chr(13)+StrException),'Tambah/Rubah Data',MB_OK or MB_ICONWARNING);
      Qry.Close;
    end else begin
    Qry.Close;

      IsNoRecord:=True;
      StrException:='';
      if (( (Trim(NikKaryawan.Text)<>'') AND (Trim(Nama.Text)<>'') and
      (Trim(NoKTP.Text)<>'') AND (Trim(Agama.Text)<>'') AND
      (Trim(Alamat.Text)<>'') AND (Trim(AlamatSekarang.Text)<>'') AND
      (StatusKaryawan.ItemIndex<>-1) AND (Trim(NoHP.Text)<>'') AND
      (NoSIM.Text<>'') AND (EmplType in [1,2])) OR
      ((Trim(Nama.Text)<>'') AND (Trim(Alamat.Text)<>'') AND (Trim(AlamatSekarang.Text)<>'') AND (EmplType in [3,4]) ))
      then begin
        Main.M_Busy;
        IsOk:=True;
        if Gentleman.Checked=True then StrSex:='1' else if Ladies.Checked=True then StrSex:='2';
        if Trim(NoHP.Text)<>'/' then begin
          if RightStr(Trim(NoHP.Text),1)='/' then StrHP:=QuotedStr(Trim(LeftStr(Trim(NoHP.Text),Length(Trim(NoHp.Text))-1)))
          else StrHP:=QuotedStr(Trim(NoHP.Text));
        end else StrHP:='NULL';
        if (Trim(NoTelp.Text)<>'-') and (Trim(NoTelp.Text)<>'') then StrPhoneNo:=QuotedStr(NoTelp.Text) else StrPhoneNo:='NULL';
        if Trim(KPPReferensi.Text)='' then StrKPPRef:='NULL' else StrKPPRef:=QuotedStr(Trim(KPPReferensi.Text));
        if Referensi.Text='' then StrRef:='NULL' else StrRef:=QuotedStr(ReferensiArr[Referensi.ItemIndex][0]);
        if Trim(ReferensiId.Text)='' then StrRefId:='NULL' else StrRefId:=QuotedStr(Trim(ReferensiId.Text));
        if Trim(NoKTP.Text)='' then StrKTP:='NULL' else StrKTP:=QuotedStr(Trim(NoKTP.Text));
        if Eksekutif.Checked=True then StrReguler:=QuotedStr('0') else if Reguler.Checked=True then StrReguler:=QuotedStr('1');
        if PendidikanTerakhir.Text<>'' then StrPendidikan:=QuotedStr(PendidikanTerakhir.Text) else StrPendidikan:='NULL';
        if Trim(InstitusiPendidikan.Text)<>'' then StrInstitusi:=QuotedStr(Trim(InstitusiPendidikan.Text)) else StrInstitusi:='NULL';
        if Trim(Anak.Text)<>'' then StrAnak:=Trim(Anak.Text) else StrAnak:='NULL';
        if Agama.Text<>'' then StrReligion:=Agama.Text else StrReligion:='NULL';
        if SIM.Text<>'' then StrSIM:=QuotedStr(SIM.Text) else StrSIM:='NULL';
        if Trim(Alamat.Text)<>'' then StrAlamat:=QuotedStr(Trim(Alamat.Text)) else StrAlamat:='NULL';
        if ShiftPagi.Checked=True then StrShift:='1' else if ShiftMalam.Checked=True then StrShift:='2' else StrShift:='3';
        if RatingInt.Text<>'' then StrRatingInt:=RatingInt.Text else StrRatingInt:='0';

        if IdAbsen.Text<>'' then StrIdAbsen:=QuotedStr(IdAbsen.Text) else StrIdAbsen:=QuotedStr('');


        if Trim(AccountNo.Text)<>'' then StrNoRek:=QuotedStr(Trim(AccountNo.Text)) else StrNoRek:='NULL';
        if Trim(AccountName.Text)<>'' then StrNamaRek:=QuotedStr(Trim(AccountName.Text)) else StrNamaRek:='NULL';
        //if Trim(NoEtoll.Text)<>'' then StrNoEtoll:=QuotedStr(Trim(NoEtoll.Text)) else StrNoEtoll:='NULL';
        if StatusKaryawan.ItemIndex=0 then begin
          StrStatusKaryawan:='1';
        end else if StatusKaryawan.ItemIndex=1 then begin
          StrStatusKaryawan:='2';
        end;
        StrNoEtoll:='NULL';
        for IntCount:=0 to Length(EtollArr)-1 do
          if trim(EtollArr[IntCount][1])=Trim(NoEtoll.Text) then StrNoEtoll:=EtollArr[IntCount][0];
        if NoHP.Text<>'' then begin
          if Copy(NoHP.Text,1,1)='0' then
          StrPhoneLogin:= '62'+Trim(Copy(NoHP.Text,2,15))
          else StrPhoneLogin:= NoHP.Text;
        end;
        StrPhoneLogin:= StrPhoneLogin;

        if Departemen.Visible then begin
          for IntCount:=0 to Length(DeptArr)-1 do
            if DeptArr[IntCount][1]=Departemen.Text then StrDept:=DeptArr[IntCount][0];
        end else StrDept:='';
        if StatusSingle.Checked then Status:=1
        else if StatusMenikah.Checked then Status:=2
        else if StatusCerai.Checked then Status:=3;
        if Main.OpenDb then begin
          Main.TransStart;
          Simpan.Enabled:=False;
    //      Qry:=TADOQuery.Create(Self);
    //      Qry.Connection:=Main.MyConnection;
          if Trim(IdKaryawan.Text)=''  then begin
            if (Trim(NoSIM.Text)<>'') then begin
              StrQry:='SELECT dbo.LicenseExist('+Chr(39)+Trim(NoSIM.Text)+Chr(39)+');';
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
              if Qry.Fields.Fields[0].Value then begin
                IsNoRecord:=False;
                IsOk:=False;
              end;
              Qry.Close;
              Qry.SQL.Clear;
            end;
            if IsNoRecord Then begin
              StrQry:='SELECT RIGHT(MAX(employee_id),4) AS employee_id FROM wh_employee '+
                    'WHERE employee_id LIKE '+QuotedStr(EmplCode+FormatDateTime('yy',TglGabung.Date)+
                    FormatDateTime('mm',TglGabung.Date)+'____')+';';
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
              if Qry.FieldValues['employee_id']<>NULL then begin
                NewId:=Qry.FieldValues['employee_id'];
                NewIdS:=Format('%.*d',[4,NewId+1]);
                Qry.Close;
                Qry.SQL.Clear;
              end else
                NewIdS:='0001';
              NewIdS:=EmplCode+FormatDateTime('yy',TglGabung.Date)+FormatDateTime('mm',TglGabung.Date)+NewIdS;
              StrPINDriver :='$2b$10$4a7dCnP8XJnYsikhZzoiPOzBZ36gBr/e4mnYo8tdVwiGWMcEc5y/a';

              if (EmplType=2) OR (EmplType=4) then begin
                StrQry:='INSERT INTO wh_employee '+
                      '(employee_id,id_number,name,sex,birth_town,birth_date,'+
                      'education_id,education_institution,religion_id,join_date,'+
                      'reference_id,reference,old_id_reference,rating, account_number, '+
                      'account_name,no_etoll,id_attandance_mapping,update_user,phone_login,'+
                      'no_bpjs_kes,no_bpjs_ket,gol_darah,nik_karyawan,status_karyawan,no_npwp,account_bank,'+
                      'education_entry_year,education_out_year,education_major,education_ipk,date_bpjs_kes,'+
                      'date_bpjs_ket,npp_bpjs_ket,email,family_card_no,height,weight,pin_login) '+
                      'VALUES ('+QuotedStr(NewIds)+','+StrKTP+
                      ','+QuotedStr(Nama.Text)+','+StrSex+
                      ','+QuotedStr(TempatLahir.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
                      ','+StrPendidikan+
                      ','+StrInstitusi+
                      ','+StrReligion+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                      ','+StrRef+','+StrRefId+','+StrKPPRef+','+StrRatingInt+
                      ','+StrNoRek+','+StrNamaRek+
                      ','+StrNoEtoll+
                      ','+StrIdAbsen+
                      ','+QuotedStr(User)+
                      ','+StrPhoneLogin+','+QuotedStr(BpjsKes.Text)+','+QuotedStr(BpjsKet.Text)+
                      ','+QuotedStr(GolDarah.Text)+','+QuotedStr(NikKaryawan.Text)+
                      ','+QuotedStr(StrStatusKaryawan)+','+QuotedStr(NPWP.Text)+','+QuotedStr(Bank.Text)+
                      ','+QuotedStr(TahunMasuk.Text)+','+QuotedStr(TahunKelulusan.Text)+','+QuotedStr(Jurusan.Text)+','+QuotedStr(ipk.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBPJSKes.Date)) +
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBpjsKet.Date)) +','+QuotedStr(Nppbpjsket.Text)+','+QuotedStr(Email.Text)+
                      ','+QuotedStr(NoKK.Text)+','+QuotedStr(Tinggi.Text)+','+QuotedStr(Berat.Text)+','+QuotedStr(StrPINDriver)+');';
                end
              else if(EmplType=3) and (Departemen.Text ='Operational') then begin
              // Departement Oprasional
             //   MessageBox(Handle,PChar('Tes karyawan Oprasinal'+Chr(13)+Chr(13)+StrEMsg),'kategori',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                 StrQry:='INSERT INTO wh_employee '+
                      '(employee_id,id_number,name,sex,birth_town,birth_date,'+
                      'education_id,education_institution,religion_id,join_date,'+
                      'reference_id,reference,old_id_reference,rating, account_number, '+
                      'account_name,no_etoll,id_attandance_mapping,update_user,phone_login,'+
                      'no_bpjs_kes,no_bpjs_ket,gol_darah,nik_karyawan,status_karyawan,no_npwp,account_bank,'+
                      'education_entry_year,education_out_year,education_major,education_ipk,date_bpjs_kes,'+
                      'date_bpjs_ket,npp_bpjs_ket,email,family_card_no,height,weight,pin_login) '+
                      'VALUES ('+QuotedStr(NewIds)+','+StrKTP+
                      ','+QuotedStr(Nama.Text)+','+StrSex+
                      ','+QuotedStr(TempatLahir.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
                      ','+StrPendidikan+
                      ','+StrInstitusi+
                      ','+StrReligion+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                      ','+StrRef+','+StrRefId+','+StrKPPRef+','+StrRatingInt+
                      ','+StrNoRek+','+StrNamaRek+
                      ','+StrNoEtoll+
                      ','+StrIdAbsen+
                      ','+QuotedStr(User)+
                      ','+StrPhoneLogin+','+QuotedStr(BpjsKes.Text)+','+QuotedStr(BpjsKet.Text)+
                      ','+QuotedStr(GolDarah.Text)+','+QuotedStr(NikKaryawan.Text)+
                      ','+QuotedStr(StrStatusKaryawan)+','+QuotedStr(NPWP.Text)+','+QuotedStr(Bank.Text)+
                      ','+QuotedStr(TahunMasuk.Text)+','+QuotedStr(TahunKelulusan.Text)+','+QuotedStr(Jurusan.Text)+','+QuotedStr(ipk.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBPJSKes.Date)) +
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBpjsKet.Date)) +','+QuotedStr(Nppbpjsket.Text)+','+QuotedStr(Email.Text)+
                      ','+QuotedStr(NoKK.Text)+','+QuotedStr(Tinggi.Text)+','+QuotedStr(Berat.Text)+','+QuotedStr(StrPINDriver)+');';
              end
              Else
              begin
                StrQry:='INSERT INTO wh_employee '+
                      '(employee_id,id_number,name,sex,birth_town,birth_date,'+
                      'education_id,education_institution,religion_id,join_date,'+
                      'reference_id,reference,old_id_reference,rating, account_number, '+
                      'account_name,no_etoll,id_attandance_mapping,update_user,phone_login,'+
                      'no_bpjs_kes,no_bpjs_ket,gol_darah,nik_karyawan,status_karyawan,no_npwp,account_bank,'+
                      'education_entry_year,education_out_year,education_major,education_ipk,date_bpjs_kes,'+
                      'date_bpjs_ket,npp_bpjs_ket,email,family_card_no,height,weight) '+
                      'VALUES ('+QuotedStr(NewIds)+','+StrKTP+
                      ','+QuotedStr(Nama.Text)+','+StrSex+
                      ','+QuotedStr(TempatLahir.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
                      ','+StrPendidikan+
                      ','+StrInstitusi+
                      ','+StrReligion+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                      ','+StrRef+','+StrRefId+','+StrKPPRef+','+StrRatingInt+
                      ','+StrNoRek+','+StrNamaRek+
                      ','+StrNoEtoll+
                      ','+StrIdAbsen+
                      ','+QuotedStr(User)+
                      ','+StrPhoneLogin+','+QuotedStr(BpjsKes.Text)+','+QuotedStr(BpjsKet.Text)+
                      ','+QuotedStr(GolDarah.Text)+','+QuotedStr(NikKaryawan.Text)+
                      ','+QuotedStr(StrStatusKaryawan)+','+QuotedStr(NPWP.Text)+','+QuotedStr(Bank.Text)+
                      ','+QuotedStr(TahunMasuk.Text)+','+QuotedStr(TahunKelulusan.Text)+','+QuotedStr(Jurusan.Text)+','+QuotedStr(ipk.Text)+
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBPJSKes.Date)) +
                      ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBpjsKet.Date)) +','+QuotedStr(Nppbpjsket.Text)+','+QuotedStr(Email.Text)+
                      ','+QuotedStr(NoKK.Text)+','+QuotedStr(Tinggi.Text)+','+QuotedStr(Berat.Text)+');';
              end;
              Main.WriteLog('SQL :'+StrQry,4);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do IsOk:=False;
              end;
              case EmplType of
                1:StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,cellular_no2'+
                        ',marital_status_id,children,kpp_expired,license_type_id,license_id'+
                        ',license_expired,day_night,update_user,cellular_emergency,address2,name_emergency,relationship_emergency) '+
                        'VALUES ('+QuotedStr(NewIds)+
                        ','+StrAlamat+
                        ','+StrPhoneNo+
                        ','+QuotedStr(NoHP.Text)+
                        ','+QuotedStr(NoHP2.Text)+
                        ','+IntToStr(Status)+','+StrAnak+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',IncYear(TglGabung.Date,1)))+
                        ','+StrSIM+
                        ','+QuotedStr(Trim(NoSIM.Text))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',NoSIMExpired.Date))+','+StrShift+
                        ','+QuotedStr(User)+','+QuotedStr(NoHPEmergency.Text)+','+QuotedStr(AlamatSekarang.Text)+
                        ','+QuotedStr(NamaKontakDarurat.Text)+','+QuotedStr(HubunganKontDarurat.Text)+');';
                2:StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,cellular_no2'+
                        ',marital_status_id,children,license_type_id,license_id'+
                        ',license_expired,day_night,update_user,cellular_emergency,address2,name_emergency,relationship_emergency) '+
                        'VALUES ('+QuotedStr(NewIds)+
                        ','+StrAlamat+
                        ','+StrPhoneNo+
                        ','+QuotedStr(NoHP.Text)+
                        ','+QuotedStr(NoHP2.Text)+
                        ','+IntToStr(Status)+','+StrAnak+
                        ','+StrSIM+
                        ','+QuotedStr(Trim(NoSIM.Text))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',NoSIMExpired.Date))+','+StrShift+
                        ','+QuotedStr(User)+','+QuotedStr(NoHPEmergency.Text)+','+QuotedStr(AlamatSekarang.Text)+
                        ','+QuotedStr(NamaKontakDarurat.Text)+','+QuotedStr(HubunganKontDarurat.Text)+');';
                3,4:StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,cellular_no2'+
                        ',marital_status_id,children'+
                        ',update_user,cellular_emergency,address2,name_emergency,relationship_emergency) '+
                        'VALUES ('+QuotedStr(NewIds)+
                        ','+StrAlamat+
                        ','+StrPhoneNo+
                        ','+QuotedStr(NoHP.Text)+
                        ','+QuotedStr(NoHP2.Text)+
                        ','+IntToStr(Status)+','+StrAnak+
                        ','+QuotedStr(User)+','+QuotedStr(NoHPEmergency.Text)+','+QuotedStr(AlamatSekarang.Text)+
                        ','+QuotedStr(NamaKontakDarurat.Text)+','+QuotedStr(HubunganKontDarurat.Text)+');';
              end;
              Main.WriteLog('SQL :'+StrQry,4);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrException:=E.Message;
                end;
              end;
              case EmplType of
                  3:StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id,'+
                            'from_date,reguler,department_id,update_user,job_position,job_level)'+
                            'VALUES ('+QuotedStr(NewIdS)+','+IntToStr(EmplType)+','+QuotedStr(CompanyId)+
                            ','+QuotedStr(LocationId)+','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                            ','+StrReguler+','+StrDept+','+QuotedStr(User)+
                            ','+QuotedStr(Posisi.Text)+','+QuotedStr(Level.Text)+');';
                else
                  StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id,'+
                        'from_date,reguler,update_user,job_position,job_level)'+
                        'VALUES ('+QuotedStr(NewIdS)+','+IntToStr(EmplType)+','+QuotedStr(CompanyId)+
                        ','+QuotedStr(LocationId)+','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                        ','+StrReguler+','+QuotedStr(User)+
                        ','+QuotedStr(Posisi.Text)+','+QuotedStr(Level.Text)+');';
              end;
              Main.WriteLog('SQL :'+StrQry,4);
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrException:=E.Message;
                end
              end;

              // data wehaonline

              if EmplType=2 then
             begin

              StrQryWehaOnline:= 'INSERT INTO Contacts '+
                              '(FullName,Gender,'+
                              'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                              'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                              '('+QuotedStr(Nama.Text)+',''M'' '+
                              ','+QuotedStr(NoHP.Text)+',0,0,0 '+
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

                StrWehaUserID:=StringReplace(QuotedStr(Nama.Text),' ','.',[rfReplaceAll]);

                StrQryWehaOnline:= 'INSERT INTO Users '+
                              '(ContactID,CustomerNo,'+
                              'Email,Password,Role,LoginType,WehaUserID,'+
                              'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                              '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                              ','+QuotedStr(NewIdS)+','+StrWehaUserID+' '+
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
                    MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end else if EmplType=4 then
              begin

                StrQryWehaOnline:= 'INSERT INTO Contacts '+
                              '(FullName,Gender,'+
                              'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                              'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                              '('+QuotedStr(Nama.Text)+',''M'' '+
                              ','+QuotedStr(NoHP.Text)+',0,0,0 '+
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

                StrWehaUserID:=StringReplace(QuotedStr(Nama.Text),' ','.',[rfReplaceAll]);

                StrQryWehaOnline:= 'INSERT INTO Users '+
                              '(ContactID,CustomerNo,'+
                              'Email,Password,Role,LoginType,WehaUserID,'+
                              'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                              '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                              ','+QuotedStr(NewIdS)+','+StrWehaUserID+' '+
                              ',NULL,''HELPER'',''EMAIL'' '+
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
                    MessageBox(Handle,PChar('Data tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end;
         //   end


            end else begin
              IsOk:=False;
              StrMsg:='No SIM Sudah ada, Silahkan Periksa Data';
            end;
          end else begin
            StrQry:='UPDATE wh_employee SET name='+QuotedStr(Nama.Text)+',sex='+StrSex+
                  ',birth_town='+QuotedStr(TempatLahir.Text)+',id_number='+StrKTP+
                  ',birth_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
                  ',education_id='+StrPendidikan+
                  ',education_institution='+QuotedStr(InstitusiPendidikan.Text)+
                  ',religion_id='+Agama.Text+
                  ',join_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                  ',reference_id='+StrRef+
                  ',reference='+StrRefId+
                  ',old_id_reference='+StrKPPRef+
                  ',rating='+StrRatingInt+
                  ',account_number='+StrNoRek+
                  ',account_name='+StrNamaRek+
                  ',no_etoll='+StrNoEtoll+
                  ',id_attandance_mapping='+StrIdAbsen+
                  ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ',phone_login='+StrPhoneLogin+',no_bpjs_kes='+QuotedStr(BpjsKes.Text)+
                  ',no_bpjs_ket='+QuotedStr(BpjsKet.Text)+
                  ',gol_darah='+QuotedStr(GolDarah.Text)+',nik_karyawan='+QuotedStr(NikKaryawan.Text)+
                  ',status_karyawan='+QuotedStr(StrStatusKaryawan)+', no_npwp='+QuotedStr(NPWP.Text)+
                  ',account_bank='+QuotedStr(Bank.Text)+',education_entry_year='+QuotedStr(TahunMasuk.Text)+
                  ',education_out_year='+QuotedStr(TahunKelulusan.Text)+',education_major='+QuotedStr(Jurusan.Text)+',education_ipk='+QuotedStr(ipk.Text)+
                  ',date_bpjs_kes='+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBPJSKes.Date))+
                  ',date_bpjs_ket='+QuotedStr(FormatDateTime('yyyy-mm-dd',DateBpjsKet.Date))+
                  ',npp_bpjs_ket='+QuotedStr(Nppbpjsket.Text)+',email='+QuotedStr(Email.Text)+
                  ',family_card_no='+QuotedStr(NoKK.Text)+',height='+QuotedStr(Tinggi.Text)+',weight='+QuotedStr(Berat.Text)+
                  ' WHERE employee_id='+QuotedStr(IdKaryawan.Text)+' ;';
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrException:=E.Message;
              end;
            end;
            StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,'+
                    'marital_status_id,children,kpp_expired,license_type_id,license_id,'+
                    'license_expired,day_night,update_time,update_user,cellular_emergency,address2,name_emergency,relationship_emergency) '+
                    'VALUES ('+QuotedStr(IdKaryawan.Text)+
                    ','+StrAlamat+
                    ','+StrPhoneNo+
                    ','+StrHP+
                    ','+IntToStr(Status)+','+StrAnak+
                    ','+QuotedStr(FormatDateTime('yyyy-mm-dd',IncYear(TglGabung.Date,1)))+
                    ','+StrSIM+
                    ','+QuotedStr(NoSIM.Text)+
                    ','+QuotedStr(FormatDateTime('yyyy-mm-dd',NoSIMExpired.Date))+','+StrShift+
                    ',GETDATE(),'+QuotedStr(User)+','+QuotedStr(NoHPEmergency.Text)+','+QuotedStr(AlamatSekarang.Text)+
                    ','+QuotedStr(NamaKontakDarurat.Text)+','+QuotedStr(HubunganKontDarurat.Text)+');';
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrException:=E.Message;
              end;
            end;
            StrQry:='UPDATE wh_empl_mutation SET reguler='+StrReguler+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ',department_id='+QuotedStr(StrDept)+',job_position='+QuotedStr(Posisi.Text)+
                    ',job_level='+QuotedStr(Level.Text)+
                    ' WHERE empl_mutation_id=(SELECT MAX(empl_mutation_id) '+
                    'FROM wh_empl_mutation WHERE employee_id='+QuotedStr(IdKaryawan.Text)+');';
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrException:=E.Message;
              end
            end;

            // DRIver

            if EmplType=2 then
            begin
              StrQryWehaOnlineCek:='SELECT DISTINCT b.UserID,a.FullName,a.HP,a.ContactID FROM Contacts a '+
                                   'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                   'b.CustomerNo='+QuotedStr(IdKaryawan.Text)+' AND b.IsActive=1';
              QryWehaOnline.Close;
              QryWehaOnline.SQL.Clear;
              QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
              QryWehaOnline.Open;
              StrContactID:= QryWehaOnline.FieldValues['ContactID'];

              if QryWehaOnline.RecordCount=0 then
              begin

                StrQryWehaOnline:= 'INSERT INTO Contacts '+
                              '(FullName,Gender,'+
                              'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                              'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                              '('+QuotedStr(Nama.Text)+',''M'' '+
                              ','+QuotedStr(NoHP.Text)+',0,0,0 '+
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

                StrWehaUserID:=StringReplace(QuotedStr(Nama.Text),' ','.',[rfReplaceAll]);

                StrQryWehaOnline:= 'INSERT INTO Users '+
                              '(ContactID,CustomerNo,'+
                              'Email,Password,Role,LoginType,WehaUserID,'+
                              'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                              '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                              ','+QuotedStr(IdKaryawan.Text)+','+StrWehaUserID+' '+
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
                    MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end else
              begin
                StrQryWehaOnline:=  'UPDATE Contacts '+
                                    'SET FullName='+QuotedStr(Nama.Text)+',Gender=''M'','+
                                    'HP='+QuotedStr(NoHP.Text)+',ViewHisOwnData=0,IsMain=0,'+
                                    'ModifiedBy=0,ModifiedDate=GETDATE(),ViewGroupOnly=0 '+
                                    'WHERE ContactID='+StrContactID+' ;';

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
                    MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end;
            end
            else if EmplType=4 then
            begin
               // Driver
              StrQryWehaOnlineCek:='SELECT DISTINCT b.UserID,a.FullName,a.HP,a.ContactID FROM Contacts a '+
                                   'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                   'b.CustomerNo='+QuotedStr(IdKaryawan.Text)+' AND b.IsActive=1';
              QryWehaOnline.Close;
              QryWehaOnline.SQL.Clear;
              QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
              QryWehaOnline.Open;
              StrContactID:= QryWehaOnline.FieldValues['ContactID'];

              if QryWehaOnline.RecordCount=0 then
              begin

                StrQryWehaOnline:= 'INSERT INTO Contacts '+
                              '(FullName,Gender,'+
                              'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                              'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                              '('+QuotedStr(Nama.Text)+',''M'' '+
                              ','+QuotedStr(NoHP.Text)+',0,0,0 '+
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

                StrWehaUserID:=StringReplace(QuotedStr(Nama.Text),' ','.',[rfReplaceAll]);
                StrQryWehaOnline:= 'INSERT INTO Users '+
                              '(ContactID,CustomerNo,'+
                              'Email,Password,Role,LoginType,WehaUserID,'+
                              'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                              '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                              ','+QuotedStr(IdKaryawan.Text)+','+StrWehaUserID+' '+
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
                    MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end else
                //   Contacts
              begin
                StrQryWehaOnline:=  'UPDATE Contacts '+
                                    'SET FullName='+QuotedStr(Nama.Text)+',Gender=''M'','+
                                    'HP='+QuotedStr(NoHP.Text)+',ViewHisOwnData=0,IsMain=0,'+
                                    'ModifiedBy=0,ModifiedDate=GETDATE(),ViewGroupOnly=0 '+
                                    'WHERE ContactID='+StrContactID+' ;';

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
                    MessageBox(Handle,PChar('Driver tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    Exit;
                  end;
                end;
              end;
            end;
          end;

          // Oprasioanl
      if (EmplType=3) and (Departemen.Text ='Operational') then
      begin
              StrQryWehaOnlineCek:='SELECT DISTINCT b.UserID,a.FullName,a.HP,a.ContactID FROM Contacts a '+
                                   'left join Users b ON a.ContactID=b.ContactID WHERE '+
                                   'b.CustomerNo='+QuotedStr(NewIds)+' AND b.IsActive=1;';
              QryWehaOnline.Close;
              QryWehaOnline.SQL.Clear;
              QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
              QryWehaOnline.Open;
             // StrContactID:= QryWehaOnline.FieldValues['ContactID'];
              if Gentleman.Checked=True then StrGender:='M' else if Ladies.Checked=True then StrGender:='F';

              if QryWehaOnline.RecordCount=0 then
                begin
                  //  Contacts
                  StrQryWehaOnline:= 'INSERT INTO Contacts '+
                              '(FullName,Gender,'+
                              'HP,ViewHisOwnData,IsMain,CreatedBy,CreatedDate,'+
                              'ModifiedBy,ModifiedDate,ViewGroupOnly) VALUES '+
                              '('+QuotedStr(Nama.Text)+','+QuotedStr(StrGender)+
                              ','+QuotedStr(NoHP.Text)+',0,0,0 '+
                              ',GETDATE(),0,GETDATE(),0); ';

                  QryWehaOnline.SQL.Clear;
                  QryWehaOnline.SQL.Add(StrQryWehaOnline);
                  try
                    QryWehaOnline.ExecSQL;
                  except
                  on E:Exception do
                  begin
                    Main.TransRollback;
                    IsOk:=False;
                    EnableInput;
                    StrEMsg:=StrEMsg+E.Message;
                    MessageBox(Handle,PChar('Oprasional tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                    StrException:=E.Message;
                  end Else
                    Begin
                      StrQryWehaOnline:= 'UPDATE Contacts '+
                                    'SET FullName='+QuotedStr(Nama.Text)+',Gender=''M'','+
                                    'HP='+QuotedStr(NoHP.Text)+',ViewHisOwnData=0,IsMain=0,'+
                                    'ModifiedBy=0,ModifiedDate=GETDATE(),ViewGroupOnly=0 '+
                                    'WHERE ContactID='+StrContactID+' ;';

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
                        MessageBox(Handle,PChar('Oprasional tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
                        Exit;
                        end;
                    end;
                  // End Contacts
              end;
            end;
                // Users
            StrQryWehaOnlineCek:='SELECT TOP 1 ContactID FROM Contacts '+
                                     'WHERE CreatedBy=0 Order By ContactID DESC';
            QryWehaOnline.Close;
            QryWehaOnline.SQL.Clear;
            QryWehaOnline.SQL.Add(StrQryWehaOnlineCek);
            QryWehaOnline.Open;
            StrContactID:= QryWehaOnline.FieldValues['ContactID'];
            StrWehaUserID:=StringReplace(QuotedStr(Nama.Text),' ','.',[rfReplaceAll]);
            StrQryWehaOnline:= 'INSERT INTO Users '+
                              '(ContactID,CustomerNo,'+
                              'Email,Password,Role,LoginType,WehaUserID,'+
                              'IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) VALUES '+
                              '('+QuotedStr(QryWehaOnline.FieldValues['ContactID'])+' '+
                              ','+QuotedStr(NewIdS)+','+StrWehaUserID+' '+
                              ',NULL,''ADMIN'',''EMAIL'' '+
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
              MessageBox(Handle,PChar('Oprasional tidak bisa diinput '+Chr(13)+Chr(13)+StrEMsg),'Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              Exit;
              end;
            end;
            //End Users
          end;
         end;

              // End Oprasional
          if IsOk then begin
            if Trim(IdKaryawan.Text)='' then begin
              StrMsg:='ID Baru '+NewIdS
            end else begin
              Main.WriteLog('Penambahan/Perubahan Data Berhasil');
              StrMsg:='Perubahan Sukses';
            end;
            Main.TransCommit;
          end else begin
            Main.WriteLog('Penambahan/Perubahan Data Gagal');
            StrMsg:='Penambahan/Perubahan Data Gagal'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg;
            Simpan.Enabled:=True;
            Main.TransRollback;
          end;
        end;
        FreeAndNil(Qry);
        Main.CloseDb;
        Main.M_Normal;
      end
      else
       begin
          StrMsg:='Inputan tanda * '+Chr(13)+'tidak boleh kosong !!';
          IsOk:=False;
      end;
      if IsOk then begin
        MessageBox(0,PChar(StrMsg),'Tambah/Rubah Data',MB_OK or MB_ICONINFORMATION);
        if IsOkClose then begin
          if RightStr(IntToStr(TreeTag),2)<>'02' then EmployeeForm.Close
        end else begin
          if RightStr(IntToStr(TreeTag),2)<>'02' then begin
            Init;
            RefreshCombo;
            EnableInput;
          end;
        end;
      end else begin
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+StrException),'Tambah/Rubah Data',MB_OK or MB_ICONWARNING)
      end;
    end;
  end
  else begin
    MessageBox(0,PChar('NIK Karyawan harus diisi'+Chr(13)+Chr(13)+StrException),'Tambah/Rubah Data',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TEmployeeForm.PendidikanTerakhirChange(Sender: TObject);
begin
  if (Trim(PendidikanTerakhir.Text)<>'') then
    PendidikanTerakhirDisp.Text:=PendidikanArr[PendidikanTerakhir.ItemIndex][1];
end;

procedure TEmployeeForm.AgamaChange(Sender: TObject);
begin
  if (Trim(Agama.Text)<>'') then
    AgamaDisp.Text:=AgamaArr[Agama.ItemIndex][1];
end;

procedure TEmployeeForm.ReferensiChange(Sender: TObject);
begin
  if (Trim(Referensi.Text)<>'') then
    ReferensiDisp.Text:=ReferensiArr[Referensi.ItemIndex][1];
  if ReferensiArr[Referensi.ItemIndex][2]='1' then begin
    ReferensiId.Enabled:=True;
    Cari.Visible:=True;
  end else begin
    ReferensiId.Enabled:=False;
    Cari.Visible:=False;
  end;
end;

procedure TEmployeeForm.NamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TempatLahir.SetFocus;
  if Key=#27 then EmployeeForm.Close;
end;

procedure TEmployeeForm.TempatLahirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TglLahir.SetFocus;
end;

procedure TEmployeeForm.TglLahirKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PendidikanTerakhir.SetFocus;
end;

procedure TEmployeeForm.AlamatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoTelp.SetFocus;
end;

procedure TEmployeeForm.NoTelpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoHP.SetFocus;
end;

procedure TEmployeeForm.NoHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then AccountNo.SetFocus;
end;

procedure TEmployeeForm.PendidikanTerakhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then InstitusiPendidikan.SetFocus;
end;

procedure TEmployeeForm.InstitusiPendidikanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Agama.SetFocus;
end;

procedure TEmployeeForm.StatusSingleKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Anak.SetFocus;
end;

procedure TEmployeeForm.StatusMenikahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Anak.SetFocus;
end;

procedure TEmployeeForm.StatusCeraiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Anak.SetFocus;
end;

procedure TEmployeeForm.AnakKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SIM.SetFocus;
end;

procedure TEmployeeForm.AgamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Referensi.SetFocus;
end;

procedure TEmployeeForm.NoSIMKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then NoSIMExpired.SetFocus;
end;

procedure TEmployeeForm.NoSIMExpiredKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then ShiftPagi.SetFocus;
end;

procedure TEmployeeForm.TglGabungKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoKTP.SetFocus;
end;

procedure TEmployeeForm.ReferensiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if ReferensiDisp.Text='Mitra' then ReferensiId.SetFocus else Alamat.SetFocus;
end;

procedure TEmployeeForm.ShiftPagiKeyPress(Sender: TObject; var Key: Char);
begin
  case EmplType of
    1:begin
        if Key=#13 then if Reguler.Checked then Reguler.SetFocus else Eksekutif.SetFocus;
      end;
    2,3:begin
        if Key=#13 then Simpan.Click;
      end;
  end;
end;

procedure TEmployeeForm.ShiftSiangKeyPress(Sender: TObject; var Key: Char);
begin
  case EmplType of
    1:begin
        if Key=#13 then if Reguler.Checked then Reguler.SetFocus else Eksekutif.SetFocus;
      end;
    2,3:begin
        if Key=#13 then Simpan.Click;
      end;
  end;
end;

procedure TEmployeeForm.ShiftMalamKeyPress(Sender: TObject; var Key: Char);
begin
  case EmplType of
    1:begin
        if Key=#13 then if Reguler.Checked then Reguler.SetFocus else Eksekutif.SetFocus;
      end;
    2,3:begin
        if Key=#13 then Simpan.Click;
      end;
  end;
end;

procedure TEmployeeForm.Simpan2Click(Sender: TObject);
begin
  IsOkClose:=True;
  SimpanClick(nil);
end;

procedure TEmployeeForm.SIMChange(Sender: TObject);
begin
  if (Trim(SIM.Text)<>'') then
    SIMDisp.Text:=SIMArr[SIM.ItemIndex][1];
end;

procedure TEmployeeForm.SIMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoSIM.SetFocus;
end;

procedure TEmployeeForm.SelesaiClick(Sender: TObject);
begin
  EmployeeForm.Close;
end;

procedure TEmployeeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeForm.FotoDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if (RightStr(IntToStr(TreeTag),2)='02') OR (RightStr(IntToStr(TreeTag),2)='08') OR (RightStr(IntToStr(TreeTag),2)='14') or (IsFotoOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      Foto.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
//      if (ImgJPG.Width < 620) AND (ImgJPG.Height<820) then begin
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          Foto.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        Foto.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('employee_id')).Value:=EmplId;
          TBlobField(Qry.FieldByName('image_id')).Value:='1';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if Assigned(Foto.Picture.Graphic) then
      ImageViewer:=TImageViewer.Create(Self,1,EmplId);
  end;
end;

procedure TEmployeeForm.FotoSIMDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
begin
  if (RightStr(IntToStr(TreeTag),2)='02') OR (RightStr(IntToStr(TreeTag),2)='08') OR (RightStr(IntToStr(TreeTag),2)='14') or (IsFotoOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      ImgJPG:=TJPEGImage.Create;
      FotoSIM.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
//      if (ImgJPG.Width < 820) AND (ImgJPG.Height<620) then begin
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoSIM.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoSIM.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('employee_id')).Value:=EmplId;
          TBlobField(Qry.FieldByName('image_id')).Value:='2';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 800x600','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if Assigned(FotoSIM.Picture.Graphic) then
      ImageViewer:=TImageViewer.Create(Self,2,EmplId);
  end;
end;

procedure TEmployeeForm.ReferensiIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then KPPReferensi.SetFocus;
end;

procedure TEmployeeForm.KPPReferensiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Alamat.SetFocus;
end;

procedure TEmployeeForm.Simpan3Click(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrHP,StrTransId,StrRefId,StrShift,StrReguler:String;
    IsOk:Boolean;
    Status:Integer;
begin
  IsOk:=True;
  if ((Trim(IdKaryawan.Text)<>'') AND (Trim(Alamat.Text)<>'') AND
  (Trim(Anak.Text)<>'') AND (Trim(SIM.Text)<>'')  ) then begin
    Main.M_Busy;
    StrTransId:=Trim(IdKaryawan.Text);
    if RightStr(Trim(NoHP.Text),1)='/' then StrHP:=Trim(LeftStr(Trim(NoHP.Text),Length(Trim(NoHp.Text))-2)) else StrHP:=Trim(NoHP.Text);
    if StatusSingle.Checked then Status:=1
    else if StatusMenikah.Checked then Status:=2
    else if StatusCerai.Checked then Status:=3;
    if ShiftPagi.Checked=True then StrShift:='1' else if ShiftMalam.Checked=True then StrShift:='2' else StrShift:='3';
    if Eksekutif.Checked=True then StrReguler:=QuotedStr('0') else if Reguler.Checked=True then StrReguler:=QuotedStr('1');
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrEMsg:='';
      Main.TransStart;
      Simpan3.Enabled:=False;
      StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,cellular_no2,'+
            'marital_status_id,children,kpp_expired,license_type_id,license_id,'+
            'license_expired,day_night,update_time,update_user) '+
            'VALUES ('+QuotedStr(StrTransId)+
            ','+QuotedStr(Alamat.Text)+
            ','+QuotedStr(Trim(NoTelp.Text))+
            ','+QuotedStr(Trim(NoHP.Text))+
            ','+QuotedStr(Trim(NoHP2.Text))+
            ','+IntToStr(Status)+','+Trim(Anak.Text)+
            ','+QuotedStr(FormatDateTime('yyyy-mm-dd',IncYear(TglGabung.Date,1)))+
            ','+QuotedStr(Trim(SIM.Text))+
            ','+QuotedStr(Trim(NoSIM.Text))+
            ','+QuotedStr(FormatDateTime('yyyy-mm-dd',NoSIMExpired.Date))+','+StrShift+
            ',GETDATE(),'+QuotedStr(User)+');';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      StrQry:='UPDATE wh_empl_mutation SET reguler='+StrReguler+',update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE empl_mutation_id=(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE employee_id='+QuotedStr(StrTransId)+');';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end
      end;
    end;
    if IsOk then begin
      Main.WriteLog('Perubahan/Penambahan Mitra Berhasil');
      StrMsg:='Perubahan Sukses';
      Main.TransCommit;
    end else begin
    MessageBox(0,PChar(StrMsg),'Tambah/Rubah Karyawan/Mitra',MB_OK or MB_ICONINFORMATION);
      Main.WriteLog('Perubahan/Penambahan Mitra Gagal');
      StrMsg:='Penambahan/Perubahan Mitra Gagal';
      Simpan.Enabled:=True;
      Main.TransRollback;
    end;
    Qry.Close;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else begin
      StrMsg:='Nama/Alamat/Anak/SIM'+Chr(13)+'   tidak boleh kosong';
      IsOk:=False;
  end;
  if IsOk then begin
    MessageBox(0,PChar(StrMsg),'Tambah/Rubah Karyawan/Mitra',MB_OK or MB_ICONINFORMATION);
  end else begin
    MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+StrEMsg),'Tambah/Rubah Karyawan/Mitra',MB_OK or MB_ICONWARNING)
  end;
end;

procedure TEmployeeForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  IsInputGrid:=not(IsReadOnly);
  if FormRequest='' then begin
    if (LeftStr(IntToStr(TreeTag),4)='1202') OR (LeftStr(IntToStr(TreeTag),4)='1302') then begin
      if (RightStr(IntToStr(TreeTag),2)='02')  OR (RightStr(IntToStr(TreeTag),2)='05') OR
        (RightStr(IntToStr(TreeTag),2)='08') OR (RightStr(IntToStr(TreeTag),2)='06') or
        (RightStr(IntToStr(TreeTag),2)='17')then begin
        if (RightStr(IntToStr(TreeTag),2)='02') then begin
          if (LeftStr(IntToStr(TreeTag),2)<>'12') then begin
            LabelReguler.Visible:=False;
            PanelReguler.Visible:=False;
            LabelShift.Visible:=False;
            PanelShift.Visible:=False;
          end;
          IsInputGrid:=True;
          Simpan.Visible:=True;
        end;
        if (RightStr(IntToStr(TreeTag),2)='05') OR (RightStr(IntToStr(TreeTag),2)='06') then begin
          DisableInput;
          if EmplType=1 then begin
            ArgoPendapatan.Visible:=True;
          end;
          Riwayat.Visible:=True;
//          Family.Visible:=True;
//          Emergency.Visible:=True;
          Vehicle.Visible:=True;
          Simpan.Visible:=False;
        end;
        if (RightStr(IntToStr(TreeTag),2)='08') then begin
          Simpan.Visible:=False;
          GroupInput1.Enabled:=False;
          GroupInput2.Enabled:=False;
          Cari.Visible:=False;
        end;
        if IsFotoOnly=False then Riwayat.Visible:=True;

        LoadData;
        GroupFoto.Visible:=True;
        GroupSIM.Visible:=True;
      end;
    end else begin
      if EmplId<>'' then begin
        if EmplType=1 then ArgoPendapatan.Visible:=True;
        Simpan.Visible:=False;
        GroupFoto.Visible:=True;
        GroupSIM.Visible:=True;
        //PanelArmada.Visible:=True;
        Riwayat.Visible:=True;
        DisableInput;
        LoadData;
      end;
    end;
  end else begin
    if EmplId<>'' then begin
      LoadData;
      if EmplType=1 then ArgoPendapatan.Visible:=True;
      Simpan.Visible:=False;
      GroupFoto.Visible:=True;
      GroupSIM.Visible:=True;
    end;
  end;
  if IsReadOnly=False then begin
    EnableInput;
    GroupFoto.Visible:=True;
    GroupSIM.Visible:=True;
    Simpan.Visible:=True;
//    Simpan3.Visible:=True;
  end;
end;

procedure TEmployeeForm.TimerCheckTimer(Sender: TObject);
begin
  TimerCheck.Enabled:=False;
  if EmplId='' then begin
    if HistoryPanel.Visible then begin
      EmployeeForm.Height:=EmployeeForm.Height-(HistoryPanel.Height);
      HistoryPanel.Visible:=False;
    end;
  end else begin
    InitHistory;
    LoadHistory;
  end;
end;

procedure TEmployeeForm.NoKTPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Nama.SetFocus;
end;

procedure TEmployeeForm.InitHistory;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=50;
  StrGrid.ColWidths[5]:=200;
  StrGrid.Cells[0,0]:='Tanggal Awal';
  StrGrid.Cells[1,0]:='Tanggal Akhir';
  StrGrid.Cells[2,0]:='Perusahaan';
  StrGrid.Cells[3,0]:='Lokasi';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.Cells[5,0]:='Keterangan';
  for IntCount:=0 to 5 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TEmployeeForm.LoadHistory;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT a.empl_mutation_id,CONVERT(VARCHAR(10),a.from_date,105) AS from_date,COALESCE(CONVERT(VARCHAR(10),a.to_date,105),'+
            Chr(39)+Chr(39)+') AS to_date '+
            ' ,b.name AS company,c.location,d.status'+
//            ',COALESCE(a.description,'+Chr(39)+Chr(39)+') AS description'+
            ',a.description AS descr'+
            ' FROM wh_empl_mutation a '+
            ' INNER JOIN wh_company b ON b.company_id=a.company_id'+
            ' INNER JOIN wh_location c ON c.location_id=a.location_id'+
            ' INNER JOIN wh_empl_status d ON d.status_id=a.status_id'+
            ' WHERE employee_id='+Chr(39)+Trim(IdKaryawan.Text)+Chr(39)+';';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+1;
      IntCount:=1;
      while not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['from_date'];
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['to_date'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['company'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['location'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['status'];
        if Qry.FieldValues['descr']<>NULL then
          StrGrid.Cells[5,IntCount]:=Qry.FieldValues['descr'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeForm.RefreshNoEtoll;
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetEtollList '+CompanyId+';';
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(EtollArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    EtollArr[Count][0]:=Qry.FieldValues['id'];
    EtollArr[Count][1]:=eToll(Qry.FieldValues['etoll_number']);
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  NoEtoll.Items.Clear;
  For Count:=0 to Length(EtollArr)-1 do begin
    NoEtoll.Items.Add(EtollArr[Count][1]);
  end;
end;

procedure TEmployeeForm.CariClick(Sender: TObject);
var GetParam:Integer;
begin
  EmployeeSearch.SetParam('Taxi');
  GetParam:=EmployeeSearch.ShowModal;
  if GetParam>1 then
    ReferensiId.Text:=EmplCode+IntToStr(GetParam);
end;

procedure TEmployeeForm.EksekutifKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TEmployeeForm.RegulerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TEmployeeForm.RiwayatClick(Sender: TObject);
var EmpType:String;
begin
  case EmplType of
    1:EmpType:='Taxi';
    2:EmpType:='Bus';
    3:EmpType:='';
  end;
  EmployeeHistoryList:=TEmployeeHistoryList.Create(Self,EmpType,EmplId);
end;

procedure TEmployeeForm.ArgoPendapatanClick(Sender: TObject);
begin
  if IdKaryawan.Text<>'' then ArgoAllowanceForm:=TArgoAllowanceForm.Create(Self,Trim(IdKaryawan.Text)); 
end;

procedure TEmployeeForm.FamilyClick(Sender: TObject);
begin
  EmployeeFamilyForm:=TEmployeeFamilyForm.Create(Self,EmplId);
end;

procedure TEmployeeForm.EmergencyClick(Sender: TObject);
begin
  EmployeeEmergencyForm:=TEmployeeEmergencyForm.Create(Self,EmplId);
end;

procedure TEmployeeForm.VehicleClick(Sender: TObject);
begin
  EmployeeVehicleForm:=TEmployeeVehicleForm.Create(Self,EmplId);
end;

procedure TEmployeeForm.CariDriverClick(Sender: TObject);
begin
  if (Main.IsFormOpen('VehicleForm')=False) and (VhcId<>'') then VehicleForm:=TVehicleForm.Create(Self,'Bus',VhcId);
end;

procedure TEmployeeForm.AccountNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then AccountName.SetFocus;
end;

procedure TEmployeeForm.AccountNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then StatusSingle.SetFocus;
end;

procedure TEmployeeForm.FormCreate(Sender: TObject);
begin
    RefreshNoEtoll;
end;

procedure TEmployeeForm.CariNoEtollChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
  if Trim(CariNoEtoll.Text)<>'' then begin

    NoEtoll.ItemIndex:=0;
    NoEtoll.Clear;
    for Count:=0 to Length(EtollArr)-1 do begin
      IsTrue:=False;
      for Count2:=0 to 1 do
        if (StrPos(PChar(UpperCase(EtollArr[Count][Count2])),PChar(UpperCase(CariNoEtoll.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        NoEtoll.Items.Add(EtollArr[Count][1]);
      end;
    end;
  end else begin
    NoEtoll.ItemIndex:=0;
    NoEtoll.Clear;
    RefreshNoEtoll;
  end;
end;

procedure TEmployeeForm.FotoKTPDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
begin
  if (RightStr(IntToStr(TreeTag),2)='02') OR (RightStr(IntToStr(TreeTag),2)='08') OR (RightStr(IntToStr(TreeTag),2)='14') or (IsFotoOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      ImgJPG:=TJPEGImage.Create;
      FotoKTP.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
//      if (ImgJPG.Width < 820) AND (ImgJPG.Height<620) then begin
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoKTP.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoKTP.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('employee_id')).Value:=EmplId;
          TBlobField(Qry.FieldByName('image_id')).Value:='5';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto KTP,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 800x600','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if Assigned(FotoKTP.Picture.Graphic) then
      ImageViewer:=TImageViewer.Create(Self, 5,EmplId);
  end;
end;

procedure TEmployeeForm.FotoKKDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
begin
  if (RightStr(IntToStr(TreeTag),2)='02') OR (RightStr(IntToStr(TreeTag),2)='08') OR (RightStr(IntToStr(TreeTag),2)='14') or (IsFotoOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      ImgJPG:=TJPEGImage.Create;
      FotoKK.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
//      if (ImgJPG.Width < 820) AND (ImgJPG.Height<620) then begin
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoKK.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoKK.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('employee_id')).Value:=EmplId;
          TBlobField(Qry.FieldByName('image_id')).Value:='6';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto KK,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 800x600','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if Assigned(FotoKK.Picture.Graphic) then
      ImageViewer:=TImageViewer.Create(Self, 6,EmplId);
  end;
end;

procedure TEmployeeForm.RatingIntKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Alamat.SetFocus;
end;

procedure TEmployeeForm.NoHP2Change(Sender: TObject);
begin
  if(NoHP.Text='')then
  begin
     MessageDlg('No HP1 diisi dulu', mtWarning, [mbOK], 0);
     NoHP.SetFocus;
     NoHP2.Text:='' ;
  end;

end;

procedure TEmployeeForm.SamaKTPClick(Sender: TObject);
begin
  if SamaKTP.Checked=True then begin
    AlamatSekarang.Text:=Alamat.Text;
  end else begin
    AlamatSekarang.Text:='';
  end;
end;

end.
