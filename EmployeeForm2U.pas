unit EmployeeForm2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB, ComCtrls, WHUnit, Jpeg, Grids,
  ZColorStringGrid, Buttons;

type
  TEmployeeForm2 = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    GroupInput1: TGroupBox;
    Nama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label11: TLabel;
    GroupNonInput: TGroupBox;
    LabelId: TLabel;
    TglGabung: TDateTimePicker;
    Label19: TLabel;
    TglLahir: TDateTimePicker;
    GroupFoto: TGroupBox;
    Foto: TImage;
    GroupSIM: TGroupBox;
    FotoSIM: TImage;
    NoKTP: TEdit;
    Label13: TLabel;
    IdKaryawan: TEdit;
    Riwayat: TButton;
    ArgoPendapatan: TButton;
    Label10: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    SBU: TComboBox;
    Label29: TLabel;
    Family: TButton;
    Vehicle: TButton;
    Emergency: TButton;
    Label16: TLabel;
    PanelJenisKelamin: TPanel;
    Gentleman: TRadioButton;
    Ladies: TRadioButton;
    GetData: TButton;
    Label3: TLabel;
    Alamat: TEdit;
    Label4: TLabel;
    NoTelp: TMaskEdit;
    NoHP: TMaskEdit;
    Label18: TLabel;
    Label9: TLabel;
    NoSIM: TEdit;
    Label25: TLabel;
    Label14: TLabel;
    NoSIMExpired: TDateTimePicker;
    Label26: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    SIM: TComboBox;
    Label6: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    PanelArmada: TPanel;
    Label15: TLabel;
    NoPolisi: TEdit;
    CariDriver: TSpeedButton;
    Bersihkan: TButton;
    TimerCheck: TTimer;
    Label7: TLabel;
    email: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure TempatLahirKeyPress(Sender: TObject; var Key: Char);
    procedure TglLahirKeyPress(Sender: TObject; var Key: Char);
    procedure AlamatKeyPress(Sender: TObject; var Key: Char);
    procedure NoTelpKeyPress(Sender: TObject; var Key: Char);
    procedure NoHPKeyPress(Sender: TObject; var Key: Char);
    procedure NoSIMKeyPress(Sender: TObject; var Key: Char);
    procedure NoSIMExpiredKeyPress(Sender: TObject; var Key: Char);
    procedure TglGabungKeyPress(Sender: TObject; var Key: Char);
    procedure Simpan2Click(Sender: TObject);
    procedure SIMKeyPress(Sender: TObject; var Key: Char);
    procedure FotoDblClick(Sender: TObject);
    procedure FotoSIMDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NoKTPKeyPress(Sender: TObject; var Key: Char);
    procedure RiwayatClick(Sender: TObject);
    procedure ArgoPendapatanClick(Sender: TObject);
    procedure FamilyClick(Sender: TObject);
    procedure EmergencyClick(Sender: TObject);
    procedure VehicleClick(Sender: TObject);
    procedure GetDataClick(Sender: TObject);
    procedure NoKTPExpiredKeyPress(Sender: TObject; var Key: Char);
    procedure GentlemanKeyPress(Sender: TObject; var Key: Char);
    procedure LadiesKeyPress(Sender: TObject; var Key: Char);
    procedure NoHPimeiKeyPress(Sender: TObject; var Key: Char);
    procedure CariDriverClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure emailKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    PendidikanArr,AgamaArr,ReferensiArr,LokasiArr,SIMArr:Array of TArrString2;
    IsOkClose,IsReadOnly,IsInputGrid,IsFotoOnly:Boolean;
    CompanyArr,DeptArr:Array of TArrString5;
    MinRowGrid:Integer;
    MitraId,VhcId:String;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
//    procedure InitHistory;
//    procedure LoadHistory;
//    function AddLeadingZero(Id:Integer;Len:Integer):String;
  public
    { Public declarations }
    procedure SetMitra(Mitra_Id:String);
    constructor Create(AOwner:TComponent;EmployeeId:String='';Is_FotoOnly:Boolean=False;Vehicle_Id:String='';Is_ReadOnly:Boolean=True);Overload;
  end;

var
  EmployeeForm2: TEmployeeForm2;

implementation

{$R *.dfm}

Uses MainU, StrUtils, DateUtils,DB, ImageViewerU, EmployeeListU, EmployeeSearchU ,
  EmployeeHistoryListU, ArgoAllowanceFormU, EmployeeFamilyFormU,
  EmployeeEmergencyFormU, EmployeeVehicleFormU, RegistrationOLListU,
  VehicleForm2U;

constructor TEmployeeForm2.Create(AOwner:TComponent;EmployeeId:String='';Is_FotoOnly:Boolean=False;Vehicle_Id:String='';Is_ReadOnly:Boolean=True);
begin
  EmplId:=EmployeeId;
  VhcId:=Vehicle_Id;
  IsFotoOnly:=Is_FotoOnly;
  IsReadOnly:=Is_ReadOnly;
  Inherited Create(AOwner);
end;

procedure TEmployeeForm2.Init;
begin
  TimerCheck.Enabled:=True;
  GroupFoto.Visible:=False;
  GroupSIM.Visible:=False;
  IdKaryawan.Text:='';
  NoKTP.Text:='';
  Nama.Text:='';
  TglLahir.Date:=StrToDate('01/01/1970') ;
  Alamat.Text:='';
  NoTelp.Text:='';
  NoHP.Text:='';
  SIM.Clear;
  SIM.ItemIndex:=0;
  NoSIM.Text:='';
  NoSIMExpired.Date:=Now;
  TglGabung.Date:=Now;
  IsOkClose:=False;
  Simpan.Visible:=True;
  GroupInput1.Enabled:=True;
  Family.Visible:=False;
  GetData.Visible:=False;
  Emergency.Visible:=False;
  Vehicle.Visible:=False;
  Riwayat.Visible:=False;
  ArgoPendapatan.Visible:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  MitraId:='';
  PanelArmada.Visible:=False;
  Bersihkan.Enabled:=True;
end;


procedure TEmployeeForm2.DisableInput;
begin
  GroupInput1.Enabled:=False;
end;

procedure TEmployeeForm2.EnableInput;
begin
  GroupInput1.Enabled:=True;
end;

procedure TEmployeeForm2.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
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
      SIMArr[IntCount][0]:=Qry.FieldValues['license_type_id'];
      SIMArr[IntCount][1]:=Qry.FieldValues['license_type'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(SIMArr)-1 do
    SIM.Items.Add(SIMArr[IntCount][1]);
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TEmployeeForm2.LoadData;
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
    Nama.Text:=Qry.FieldValues['name'];
    if Qry.FieldValues['sex']=1 then Gentleman.Checked:=True
    else if Qry.FieldValues['sex']=2 then Ladies.Checked:=True;
    if Qry.FieldValues['id_number']<>NULL then
      NoKTP.Text:=Qry.FieldValues['id_number'];
    if Qry.FieldValues['birth_date']<>NULL then
      TglLahir.Date:=Qry.FieldValues['birth_date'];
    if Qry.FieldValues['address']<>NULL then
      Alamat.Text:=Qry.FieldValues['address'];
    if Qry.FieldValues['phone_no']<>NULL then NoTelp.Text:=Qry.FieldValues['phone_no'];
    if Qry.FieldValues['cellular_no']<>NULL then NoHP.Text:=Qry.FieldValues['cellular_no'];
    if Qry.FieldValues['license_type_id']<>NULL then begin
      SIM.ItemIndex:=ArrayIndexOf(SIMArr,Qry.FieldValues['license_type_id'],0);
    end;
    if Qry.FieldValues['license_id']<>NULL then
      NoSIM.Text:=Qry.FieldValues['license_id'];
    if Qry.FieldValues['license_expired']<>NULL then
      NoSIMExpired.Date:=StrToDate(Qry.FieldValues['license_expired']);
    if Qry.FieldValues['join_date']<>NULL then
      TglGabung.Date:=Qry.FieldValues['join_date'];
    if Qry.FieldValues['vehicle_id']<>NULL then
      VhcId:=Qry.FieldValues['vehicle_id'];
    if Qry.FieldValues['license_plate']<>NULL then
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeForm2.SetMitra(Mitra_Id:String);
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
    if Qry.FieldValues['date_of_birth']<>NULL then
      TglLahir.Date:=Qry.FieldValues['date_of_birth'];
    if Qry.FieldValues['address']<>NULL then
      Alamat.Text:=Qry.FieldValues['address'];
//    if Qry.FieldValues['imei']<>NULL then NoHPimei.Text:=Qry.FieldValues['imei'];
    if Qry.FieldValues['mobilephone']<>NULL then NoHP.Text:=Qry.FieldValues['mobilephone'];
    if Qry.FieldValues['phone']<>NULL then NoTelp.Text:=Qry.FieldValues['phone'];
    if Qry.FieldValues['marital_status']<>NULL then
    if Qry.FieldValues['driver_license']<>NULL then
      NoSIM.Text:=Qry.FieldValues['driver_license'];
    if Qry.FieldValues['exp_driver_license']<>NULL then
      NoSIMExpired.Date:=StrToDate(Qry.FieldValues['exp_driver_license']);
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeForm2.SimpanClick(Sender: TObject);
var Qry,Qry2:TADOQuery;
    StrQry,NewIdS,StrEMsg,StrException,StrHP,StrKTP,StrSex,StrRelation:String;
    StrSIM,StrAlamat,StrName,StrPhoneNo,StrBirth,StrJob,StrYear,StrVhcName,StrOwn,StrLocationId,StrEmail:String;
    IsOk,IsNoRecord:Boolean;
    NewId,Status,IntCount:Integer;
    StrList:TStringList;
begin
  IsNoRecord:=True;
  StrException:='';
  if (Trim(Nama.Text)<>'') AND (Trim(NoHP.Text)<>'') AND (NoSIM.Text<>'') AND (Trim(Alamat.Text)<>'') then begin
    Main.M_Busy;
    IsOk:=True;
    StrEMsg:='';
    if Gentleman.Checked=True then StrSex:='1' else if Ladies.Checked=True then StrSex:='2';
    if RightStr(Trim(NoHP.Text),1)='/' then StrHP:=QuotedStr(Trim(LeftStr(Trim(NoHP.Text),Length(Trim(NoHp.Text))-2))) else StrHP:=QuotedStr(Trim(NoHP.Text));
    if Trim(NoKTP.Text)='' then StrKTP:='NULL' else StrKTP:=QuotedStr(Trim(NoKTP.Text));
    if SIM.Text<>'' then StrSIM:=QuotedStr(SIMArr[SIM.ItemIndex][0]) else StrSIM:='NULL';
    if Trim(Alamat.Text)<>'' then StrAlamat:=QuotedStr(Trim(Alamat.Text)) else Alamat.Text:='NULL';
    if Trim(email.Text)<>'' then StrEmail:=QuotedStr(Trim(email.Text)) else StrEmail:='NULL';
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if Main.OpenDb then begin
      Main.TransStart;
      Simpan.Enabled:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
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
                'WHERE employee_id LIKE '+QuotedStr('GC'+FormatDateTime('yy',TglGabung.Date)+
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
          NewIdS:='GC'+FormatDateTime('yy',TglGabung.Date)+FormatDateTime('mm',TglGabung.Date)+NewIdS;
          StrQry:='INSERT INTO wh_employee '+
                '(employee_id,id_number,name,sex,birth_town,birth_date'+
                ',join_date,update_user) '+
                'VALUES ('+QuotedStr(NewIds)+','+StrKTP+
                ','+QuotedStr(Nama.Text)+','+StrSex+
                ',NULL'+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                ','+QuotedStr(User)+');';
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
          StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no'+
                  ',license_type_id,license_id,license_expired,email,update_user) '+
                  'VALUES ('+QuotedStr(NewIds)+
                  ','+StrAlamat+','+QuotedStr(Trim(NoTelp.Text))+','+QuotedStr(StrHP)+
                  ','+StrSIM+','+QuotedStr(Trim(NoSIM.Text))+
                  ','+QuotedStr(FormatDateTime('yyyy-mm-dd',NoSIMExpired.Date))+','+StrEmail+','+QuotedStr(User)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrException:=StrEMsg+E.Message;
            end;
          end;
          StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id,'+
                  'from_date,update_user)'+
                  'VALUES ('+QuotedStr(NewIdS)+',2,'+QuotedStr(CompanyId)+
                  ','+QuotedStr(LocationId)+','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
                  ','+QuotedStr(User)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrException:=StrEMsg+E.Message;
            end
          end;
        end else begin
          IsOk:=False;
          StrEMsg:='No SIM Sudah ada, Silahkan Periksa Data';
        end;
        if MitraId<>'' then begin
          StrQry:='SELECT * FROM wh_web_employee_family WHERE mitra_id='+QuotedStr(MitraId)+';';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          StrQry:='';
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            StrName:=QuotedStr(Qry.FieldValues['family_name']);
            StrBirth:=QuotedStr(FormatDateTime('yyyy/mm/dd',Qry.FieldValues['family_date_of_birth']));
            StrJob:=QuotedStr(Qry.FieldValues['family_work']);
            StrPhoneNo:=QuotedStr(Qry.FieldValues['family_phone']);
            StrQry:=StrQry+'INSERT INTO wh_empl_family (employee_id,name,empl_relation_id,birth_date,job,phone_no,update_user) '+
                    'VALUES ('+QuotedStr(NewIdS)+','+StrName+','+StrRelation+','+StrBirth+','+StrJob+
                    ','+StrPhoneNo+','+QuotedStr(User)+');';
            Qry.Next;
          end;
          if StrQry<>'' then begin
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrException:=StrEMsg+E.Message;
              end;
            end;
          end;
          StrQry:='SELECT * FROM wh_web_employee_relation WHERE mitra_id='+QuotedStr(MitraId)+';';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          StrQry:='';
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            StrName:=QuotedStr(Qry.FieldValues['relation_name']);
            StrRelation:=QuotedStr(Qry.FieldValues['relation']);
            StrPhoneNo:=QuotedStr(Qry.FieldValues['relation_phone']);
            StrQry:=StrQry+'INSERT INTO wh_empl_emergency (employee_id,name,relation,phone_no,update_user) '+
                    'VALUES ('+QuotedStr(NewIdS)+','+StrName+','+StrRelation+','+StrPhoneNo+','+QuotedStr(User)+');';
            Qry.Next;
          end;
          if StrQry<>'' then begin
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrException:=StrEMsg+E.Message;
              end;
            end;
          end;
          StrQry:='SELECT * FROM wh_web_employee WHERE mitra_id='+QuotedStr(MitraId)+';';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          StrQry:='';
          StrName:=QuotedStr(Qry.FieldValues['ownvehiclename']);
          StrAlamat:=QuotedStr(Qry.FieldValues['ownvehicleaddress']);
          StrVhcName:=QuotedStr(Qry.FieldValues['ownvehicletype']);
          StrYear:=QuotedStr(Qry.FieldValues['ownvehicleproduction']);
          StrOwn:=QuotedStr(Qry.FieldValues['isownvehicle']);
          StrQry:=StrQry+'INSERT INTO wh_empl_vehicle (employee_id,name,address,vehicle,year,owner,update_user) '+
                  'VALUES ('+QuotedStr(NewIdS)+','+StrName+','+StrAlamat+','+StrVhcName+
                  ','+StrYear+','+StrOwn+','+QuotedStr(User)+');';
          StrList:=TStringList.Create;
          StrList:=SplitStrings(Qry.FieldValues['language'],',');
          for IntCount:=0 to StrList.Count -1 do begin
            if (StrList.Strings[IntCount])<>'' then
              StrQry:=StrQry+'INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                     ',detail,update_user) '+
                     'VALUES ('+QuotedStr(NewIdS)+',11,'+CompanyId+','+LocationId+','+QuotedStr(StrList.Strings[IntCount])+
                     ','+QuotedStr(User)+');';
          end;
          if Qry.FieldValues['basic_technique_certificate']=1 then begin
              StrQry:=StrQry+'INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                     ',detail,update_user) '+
                     'VALUES ('+QuotedStr(NewIdS)+',12,'+CompanyId+','+LocationId+','+QuotedStr('Teknikal Dasar Kendaraan')+
                     ','+QuotedStr(User)+');';
          end;
          if Qry.FieldValues['city_knowledge_certificate']=1 then begin
              StrQry:=StrQry+'INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                     ',detail,update_user) '+
                     'VALUES ('+QuotedStr(NewIdS)+',13,'+CompanyId+','+LocationId+','+QuotedStr('Pengetahuan Kota Jakarta dan Sekitarnya')+
                     ','+QuotedStr(User)+');';
          end;
          if Qry.FieldValues['safety_driving_certificate']=1 then begin
              StrQry:=StrQry+'INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                     ',detail,update_user) '+
                     'VALUES ('+QuotedStr(NewIdS)+',12,'+CompanyId+','+LocationId+','+QuotedStr('Safety Driving')+
                     ','+QuotedStr(User)+');';
          end;
          if StrQry<>'' then begin
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
          StrQry:='UPDATE wh_web_employee SET status=1 WHERE mitra_id='+QuotedStr(MitraId)+';';
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
        end;
        if (VhcId<>'') then begin
          StrQry:='INSERT INTO wh_working_schedule (vehicle_id,employee_id,from_date,to_date,location_id,update_user)'+
                ' VALUES ('+QuotedStr(VhcId)+','+QuotedStr(NewIdS)+',GETDATE(),'+QuotedStr('2099/12/31')+','+StrLocationId+','+QuotedStr(User)+');';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
             Qry.ExecSQL;
          except
            on E:Exception do IsOk:=False;
          end;
        end;
      end else begin
        StrQry:='UPDATE wh_employee SET name='+QuotedStr(Nama.Text)+',sex='+StrSex+
              ',birth_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+
              ',join_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglGabung.Date))+
              ',update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE employee_id='+QuotedStr(Trim(IdKaryawan.Text))+' ;';
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
      end;
      if IsOk then begin
        if Trim(IdKaryawan.Text)='' then begin
          StrEMsg:='ID Baru '+NewIdS
        end else begin
          Main.WriteLog('Penambahan/Perubahan Data Berhasil');
          StrEMsg:='Perubahan Sukses';
        end;
        Main.TransCommit;
        EmplId:=NewIdS;
        IsFotoOnly:=True;
        GroupFoto.Visible:=True;
        GroupSIM.Visible:=True;
      end else begin
        Main.WriteLog('Penambahan/Perubahan Data Gagal');
        StrEMsg:='Penambahan/Perubahan Data Gagal'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg;
        Simpan.Enabled:=True;
        Main.TransRollback;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end else begin
      StrEMsg:='Nama/Jenis Kelamin/Tgl Lahir/'+Chr(13)+'Jenis SIM/No SIM/Tgl Berakhir SIM '+Chr(13)+'tidak boleh kosong';
      IsOk:=False;
  end;
  if IsOk then begin
    MessageBox(0,PChar(StrEMsg),'Tambah/Rubah Data',MB_OK or MB_ICONINFORMATION);
    VehicleForm2:=TVehicleForm2.Create(nil,'',False,NewIds);
{    if IsOkClose then begin
      if RightStr(IntToStr(TreeTag),2)<>'02' then Close
    end else begin
      if RightStr(IntToStr(TreeTag),2)<>'02' then begin
        Init;
        RefreshCombo;
      end;
    end;
}  end else begin
    MessageBox(0,PChar(StrEMsg+Chr(13)+Chr(13)+StrException),'Tambah/Rubah Data',MB_OK or MB_ICONWARNING)
  end;
end;

procedure TEmployeeForm2.NamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Gentleman.SetFocus;
  if Key=#27 then Close;
end;

procedure TEmployeeForm2.TempatLahirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TglLahir.SetFocus;
end;

procedure TEmployeeForm2.TglLahirKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Alamat.SetFocus;
end;

procedure TEmployeeForm2.AlamatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoTelp.SetFocus;
end;

procedure TEmployeeForm2.NoTelpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoHP.SetFocus;
end;

procedure TEmployeeForm2.NoHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SIM.SetFocus;
end;

procedure TEmployeeForm2.NoSIMKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then NoSIMExpired.SetFocus;
end;

procedure TEmployeeForm2.NoSIMExpiredKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then email.SetFocus;
end;

procedure TEmployeeForm2.TglGabungKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoKTP.SetFocus;
end;


procedure TEmployeeForm2.Simpan2Click(Sender: TObject);
begin
  IsOkClose:=True;
  SimpanClick(nil);
end;

procedure TEmployeeForm2.SIMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoSIM.SetFocus;
end;

procedure TEmployeeForm2.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeForm2.FotoDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if (IsFotoOnly) then begin
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

procedure TEmployeeForm2.FotoSIMDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
begin
  if (IsFotoOnly) then begin
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

procedure TEmployeeForm2.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  IsInputGrid:=not(IsReadOnly);
  if EmplId<>'' then begin
//    Riwayat.Visible:=True;
//    Family.Visible:=True;
//    Emergency.Visible:=True;
//      Vehicle.Visible:=True;
    GetData.Visible:=False;
    Simpan.Visible:=False;
    GroupFoto.Visible:=True;
    GroupSIM.Visible:=True;
    PanelArmada.Visible:=True;
    DisableInput;
    LoadData;
    Bersihkan.Enabled:=False;
  end else begin
    Vehicle.Visible:=True;
    IsFotoOnly:=False;
  end;
//  end;
  if IsReadOnly=False then begin
    EnableInput;
    GroupFoto.Visible:=True;
    GroupSIM.Visible:=True;
    Simpan.Visible:=True;
    PanelArmada.Visible:=False;
  end;
end;

procedure TEmployeeForm2.NoKTPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Nama.SetFocus;
end;
{
procedure TEmployeeForm2.InitHistory;
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

procedure TEmployeeForm2.LoadHistory;
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
}
procedure TEmployeeForm2.RiwayatClick(Sender: TObject);
var EmpType:String;
begin
  case EmplType of
    1:EmpType:='Taxi';
    2:EmpType:='Bus';
    3:EmpType:='';
  end;
  EmployeeHistoryList:=TEmployeeHistoryList.Create(Self,EmpType,EmplId);
end;

procedure TEmployeeForm2.ArgoPendapatanClick(Sender: TObject);
begin
  if IdKaryawan.Text<>'' then ArgoAllowanceForm:=TArgoAllowanceForm.Create(Self,Trim(IdKaryawan.Text));
end;


procedure TEmployeeForm2.FamilyClick(Sender: TObject);
begin
  EmployeeFamilyForm:=TEmployeeFamilyForm.Create(Self,EmplId);
end;

procedure TEmployeeForm2.EmergencyClick(Sender: TObject);
begin
  EmployeeEmergencyForm:=TEmployeeEmergencyForm.Create(Self,EmplId);
end;

procedure TEmployeeForm2.VehicleClick(Sender: TObject);
begin
  if EmplId<>'' then
    VehicleForm2:=TVehicleForm2.Create(self,'',True,EmplId);
end;

procedure TEmployeeForm2.GetDataClick(Sender: TObject);
begin
  if Main.IsFormOpen('RegistrationOLList')=False then RegistrationOLList:=TRegistrationOLList.Create(Self,True);
end;

procedure TEmployeeForm2.NoKTPExpiredKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Nama.SetFocus;
end;

procedure TEmployeeForm2.GentlemanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TglLahir.SetFocus;
end;

procedure TEmployeeForm2.LadiesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TglLahir.SetFocus;
end;

procedure TEmployeeForm2.NoHPimeiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SIM.SetFocus;
end;

procedure TEmployeeForm2.CariDriverClick(Sender: TObject);
begin
  if (Main.IsFormOpen('VehicleForm2')=False) and (VhcId<>'') then VehicleForm2:=TVehicleForm2.Create(Self,VhcId);
end;

procedure TEmployeeForm2.BersihkanClick(Sender: TObject);
begin
  VhcId:='';
  EmplId:='';
  IsFotoOnly:=False;
  Vehicle.Visible:=True;
  Init;
  RefreshCombo;
end;

procedure TEmployeeForm2.emailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
