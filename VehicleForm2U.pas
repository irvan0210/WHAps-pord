unit VehicleForm2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB, ComCtrls, WHUnit, ExtCtrls, Grids,
  ZColorStringGrid, Jpeg, Buttons;

type
  TVehicleForm2 = class(TForm)
    GroupInput: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NoBPKB: TEdit;
    NoRangka: TEdit;
    NoMesin: TEdit;
    Tahun: TMaskEdit;
    GroupInput2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    KIU: TMaskEdit;
    KIO: TMaskEdit;
    Tera: TMaskEdit;
    Simpan: TButton;
    Selesai: TButton;
    KIR: TMaskEdit;
    Label12: TLabel;
    Group: TComboBox;
    Label13: TLabel;
    SBU: TComboBox;
    Label14: TLabel;
    Jenis: TComboBox;
    Bersihkan: TButton;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    NoPolisi: TEdit;
    STNK: TMaskEdit;
    Label11: TLabel;
    Nama: TEdit;
    Label15: TLabel;
    Alamat: TEdit;
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Slinder: TMaskEdit;
    Label30: TLabel;
    TahunReg: TMaskEdit;
    Label31: TLabel;
    Warna: TEdit;
    GroupDoc: TGroupBox;
    Doc2: TButton;
    Doc1: TButton;
    Doc3: TButton;
    Doc4: TButton;
    Doc5: TButton;
    Doc6: TButton;
    ImgTemp: TImage;
    PanelDriver: TPanel;
    Label18: TLabel;
    Driver: TEdit;
    CariDriver: TSpeedButton;
    Label32: TLabel;
    SetDriver: TButton;
    Label25: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Propinsi: TComboBox;
    Kotamadya: TComboBox;
    Doc7: TButton;
    Doc8: TButton;
    Label36: TLabel;
    Label37: TLabel;
    Tipe: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoBPKBKeyPress(Sender: TObject; var Key: Char);
    procedure NoMesinKeyPress(Sender: TObject; var Key: Char);
    procedure NoRangkaKeyPress(Sender: TObject; var Key: Char);
    procedure NoPolisiKeyPress(Sender: TObject; var Key: Char);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure KIRKeyPress(Sender: TObject; var Key: Char);
    procedure KIOKeyPress(Sender: TObject; var Key: Char);
    procedure TeraKeyPress(Sender: TObject; var Key: Char);
    procedure STNKKeyPress(Sender: TObject; var Key: Char);
    procedure KIUKeyPress(Sender: TObject; var Key: Char);
    procedure GroupKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure JenisKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PerlengkapanClick(Sender: TObject);
    procedure NoPolisiEnter(Sender: TObject);
    procedure NoPolisiExit(Sender: TObject);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure AlamatKeyPress(Sender: TObject; var Key: Char);
    procedure TahunRegKeyPress(Sender: TObject; var Key: Char);
    procedure SlinderKeyPress(Sender: TObject; var Key: Char);
    procedure WarnaKeyPress(Sender: TObject; var Key: Char);
    procedure Doc1Click(Sender: TObject);
    procedure Doc2Click(Sender: TObject);
    procedure Doc3Click(Sender: TObject);
    procedure Doc4Click(Sender: TObject);
    procedure Doc5Click(Sender: TObject);
    procedure Doc6Click(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
    procedure SetDriverClick(Sender: TObject);
    procedure Doc7Click(Sender: TObject);
    procedure Doc8Click(Sender: TObject);
    procedure PropinsiChange(Sender: TObject);
    procedure PropinsiKeyPress(Sender: TObject; var Key: Char);
    procedure KotamadyaKeyPress(Sender: TObject; var Key: Char);
    procedure JenisChange(Sender: TObject);
    procedure TipeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    GroupArr,JenisArr,TipeArr,ProvinceArr,ProvinceStateArr:Array of TArrString4;
    CompanyArr:array of TArrString8;
    IsReadOnly,IsPicOnly:Boolean;
    VhcDetailId,BodyId,EmplId:String;
    CompId:Integer;
    VhcType:Integer;
    VhcId:String;
    VhcCode:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshProvinceState;
    procedure RefreshGroup;
    procedure RefreshJenis;
    procedure RefreshTipe;
    procedure LoadData;
//    procedure InitGrid;
//    procedure LoadGrid;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleId:String;IsRead_Only:Boolean=True;Empl_Id:String='';IsPic_Only:Boolean=False);Overload;
  end;

var
  VehicleForm2: TVehicleForm2;

implementation

{$R *.dfm}

Uses MainU, VehicleEquipmentCheckU, DB, ImageViewerU, EmployeeForm2U;

constructor TVehicleForm2.Create(AOwner:TComponent;VehicleId:String;IsRead_Only:Boolean=True;Empl_Id:String='';IsPic_Only:Boolean=False);
begin
  VhcId:=VehicleId;
  EmplId:=Empl_Id;
  IsPicOnly:=IsPic_Only;
  if VhcId='' then IsReadOnly:=False
  else IsReadOnly:=IsRead_Only;
  inherited Create(AOwner);
end;

procedure TVehicleForm2.Init;
begin
  VhcCode:='GC';
  NoBPKB.Text:='';
  NoRangka.Text:='';
  NoMesin.Text:='';
  NoPolisi.Text:='';
  Tahun.Text:='';
  STNK.Text:=FormatDateTime('dd/mm/yyyy',Now);
  KIR.Text:='';
  KIU.Text:='';
  KIO.Text:='';
  Tera.Text:='';
  Propinsi.Text:='';
  Propinsi.ItemIndex:=-1;
  Propinsi.Items.Clear;
  Kotamadya.Text:='';
  Kotamadya.ItemIndex:=-1;
  Kotamadya.Clear;
  Group.Text:='';
  Group.ItemIndex:=-1;
  Group.Clear;
  Jenis.ItemIndex:=-1;
  Jenis.Items.Text:='';
  Jenis.Items.Clear;
  Tipe.ItemIndex:=-1;
  Tipe.Items.Text:='';
  Tipe.Items.Clear;
  VhcDetailId:='';
  GroupInput.Enabled:=True;
  GroupInput2.Enabled:=True;
  GroupDoc.Visible:=False;
  PanelDriver.Visible:=False;
  SetDriver.Visible:=False;
  Doc1.Font.Color:=clWindowText;
  Doc2.Font.Color:=clWindowText;
  Doc3.Font.Color:=clWindowText;
  Doc4.Font.Color:=clWindowText;
  Doc5.Font.Color:=clWindowText;
  Doc6.Font.Color:=clWindowText;
  Doc7.Font.Color:=clWindowText;
  Doc8.Font.Color:=clWindowText;
end;

procedure TVehicleForm2.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(CompanyArr,0);
  SetLength(ProvinceArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
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
    StrQry:='EXEC GetProvinceList';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.Open;
    IntCount:=0;
    SetLength(ProvinceArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProvinceArr[IntCount][0]:=Qry.FieldValues['province_id'];
      ProvinceArr[IntCount][1]:=Qry.FieldValues['province'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(ProvinceArr)-1 do
    Propinsi.Items.Add(ProvinceArr[IntCount][1]);
  if StrToInt(CompanyId)>1 then SBU.Enabled:=False;
  Main.M_Normal;
end;

procedure TVehicleForm2.RefreshProvinceState;
var Qry:TADOQuery;
    StrQry,StrProvinceId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(ProvinceStateArr,0);
  Kotamadya.ItemIndex:=-1;
  Kotamadya.Items.Clear;
  Kotamadya.Text:='';
  if Propinsi.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrProvinceId:=QuotedStr(ProvinceArr[Propinsi.ItemIndex][0]);
      StrQry:='EXEC GetProvinceStateList '+StrProvinceId;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.Open;
      IntCount:=0;
      SetLength(ProvinceStateArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        ProvinceStateArr[IntCount][0]:=Qry.FieldValues['province_state_id'];
        ProvinceStateArr[IntCount][1]:=Qry.FieldValues['province_state'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(ProvinceStateArr)-1 do
    Kotamadya.Items.Add(ProvinceStateArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TVehicleForm2.RefreshGroup;
var Qry:TADOQuery;
    QStr,StrCompanyId:String;
    IntCount:Integer;
begin
  Group.Items.Clear;
  Group.Text:='';
  SetLength(GroupArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.SQL.Clear;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    QStr:='EXEC GetVehicleGroup '+QuotedStr(StrCompanyId)+';';
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(GroupArr,IntCount+1);
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      GroupArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(GroupArr)-1 do
   Group.Items.Add(GroupArr[IntCount][1]);
end;

procedure TVehicleForm2.RefreshJenis;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrGroup:String;
    IntCount:Integer;
begin
  Tipe.Text:='';
  Tipe.Items.Clear;
  SetLength(TipeArr,0);
  Jenis.Text:='';
  Jenis.Items.Clear;
  SetLength(JenisArr,0);
  if Group.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrGroup:=GroupArr[Group.ItemIndex][0];
      QStr:='EXEC GetVehicleType '+StrCompanyId+','+StrGroup+';';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(JenisArr,IntCount+1);
        JenisArr[IntCount][0]:=Qry.FieldValues['vehicle_type_id'];
        JenisArr[IntCount][1]:=Qry.FieldValues['brand'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    for IntCount:=0 to Length(JenisArr)-1 do
      Jenis.Items.Add(JenisArr[IntCount][1]);
  end;
end;

procedure TVehicleForm2.RefreshTipe;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrTipe:String;
    IntCount:Integer;
begin
  Tipe.Text:='';
  Tipe.Items.Clear;
  SetLength(TipeArr,0);
  if Jenis.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrTipe:='@VehicleTypeId='+JenisArr[Jenis.ItemIndex][0];
      QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+StrTipe+';';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(TipeArr,IntCount+1);
        TipeArr[IntCount][0]:=Qry.FieldValues['vhc_type_detail_id'];
        TipeArr[IntCount][1]:=Qry.FieldValues['type'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    for IntCount:=0 to Length(TipeArr)-1 do
      Tipe.Items.Add(TipeArr[IntCount][1]);
  end;
end;

procedure TVehicleForm2.LoadData;
var IntCount:Integer;
    StrQry,StrTipe,StrJenis,StrProvince,StrProvinceState:String;
    Qry:TADOQuery;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if EmplId<>'' then begin
      StrQry:='EXEC GetVehicleDetail @EmployeeId='+QuotedStr(EmplId)+';';
    end else begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(VhcId)+';';
    end;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if BodyId<>'' then VhcId:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['reg_name']<> NULL then Nama.Text:=Qry.FieldValues['reg_name'];
      if Qry.FieldValues['address']<>NULL then Alamat.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['year_reg']<>NULL then TahunReg.Text:=Qry.FieldValues['year_reg'];
      if Qry.FieldValues['color']<>NULL then Warna.Text:=Qry.FieldValues['color'];
      if Qry.FieldValues['body_id']<>NULL then NoBPKB.Text:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['engine_id']<>NULL then NoMesin.Text:=Qry.FieldValues['engine_id'];
      if Qry.FieldValues['chasis_id']<>NULL then NoRangka.Text:=Qry.FieldValues['chasis_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['year']<>NULL then Tahun.Text:=Qry.FieldValues['year'];
      Group.ItemIndex:=ArrayIndexOf(GroupArr,Qry.FieldValues['vhc_batch_id'],0);
      StrJenis:=Qry.FieldValues['vehicle_type_id'];
      StrTipe:=Qry.FieldValues['vhc_type_detail_id'];
      if Qry.FieldValues['province_id']<>NULL then Propinsi.ItemIndex:=ArrayIndexOf(ProvinceArr,Qry.FieldValues['province_id'],0);
      if Qry.FieldValues['province_state_id']<>NULL then StrProvinceState:=Qry.FieldValues['province_state_id'];
      if Qry.FieldValues['cylinder']<>NULL then Slinder.Text:=Qry.FieldValues['cylinder'];
      if Qry.FieldValues['stnk']<>NULL then STNK.Text:=Qry.FieldValues['stnk'];
      if Qry.FieldValues['kir']<>NULL then KIR.Text:=Qry.FieldValues['kir'];
      if Qry.FieldValues['kiu']<>NULL then KIU.Text:=Qry.FieldValues['kiu'];
      if Qry.FieldValues['kio']<>NULL then KIO.Text:=Qry.FieldValues['kio'];
      if Qry.FieldValues['tera']<>NULL then Tera.Text:=Qry.FieldValues['tera'];
      VhcDetailId:=Qry.FieldValues['vhc_detail_id'];
      if Qry.FieldValues['name']<>NULL then Driver.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['employee_id']<>NULL then EmplId:=Qry.FieldValues['employee_id'];
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=1);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc1.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=2);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc2.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=3);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc3.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=4);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc4.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=5);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc5.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=6);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc6.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=7);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc7.Font.Color:=clBlue;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
          '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
          ' WHERE vehicle_id='+QuotedStr(VhcId)+' AND image_id=8);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        Doc8.Font.Color:=clBlue;
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
  RefreshJenis;
  for IntCount:=0 to Length(JenisArr)-1 do
    if JenisArr[IntCount][0]=StrJenis then Jenis.ItemIndex:=IntCount;
//  Jenis.ItemIndex:=ArrayIndexOf(JenisArr,StrJenis,0);
  RefreshTipe;
  Tipe.ItemIndex:=ArrayIndexOf(TipeArr,StrTipe,0);
  RefreshProvinceState;
  Kotamadya.ItemIndex:=ArrayIndexOf(ProvinceStateArr,StrProvinceState,0);
  Main.M_Normal;
end;

procedure TVehicleForm2.Doc1Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='1';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc1.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc1.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,1,VhcId,1);
  end;
end;


procedure TVehicleForm2.Doc2Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='2';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc2.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc2.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,2,VhcId,1);
  end;
end;

procedure TVehicleForm2.Doc3Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='3';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc3.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc3.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,3,VhcId,1);
  end;
end;

procedure TVehicleForm2.Doc4Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='4';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc4.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc4.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,4,VhcId,1);
  end;
end;

procedure TVehicleForm2.Doc5Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='5';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc5.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc5.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,5,VhcId,1);
  end;
end;

procedure TVehicleForm2.Doc6Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='6';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc6.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc6.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,6,VhcId,1);
  end;
end;

procedure TVehicleForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleForm2.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleForm2.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrNewId,StrSTNK,StrKIR,StrKIU,StrKIO,StrTera,StrReguler,StrNoPolisi,StrLocationId,StrCompanyId:String;
    StrWarna,StrSlinder,StrTahunReg,StrNama,StrAlamat,StrBPKB,StrGroup,StrTipe,StrProvinceState:String;
    Ok,NoRecord:Boolean;
    NewId,Status:Integer;
begin
  Ok:=True;
  if (Trim(NoRangka.Text)<>'') AND (Trim(NoMesin.Text)<>'') AND
  (Trim(NoPolisi.Text)<>'') AND (Trim(Tahun.Text)<>'') AND (Trim(Group.Text)<>'')  AND (Trim(Jenis.Text)<>'')  then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Trim(NoBPKB.Text)<>'' then StrBPKB:=QuotedStr(Trim(NoBPKB.Text)) else StrBPKB:='NULL';
    StrNoPolisi:=QuotedStr(StringReplace(Trim(NoPolisi.Text),' ','',[rfReplaceAll]));
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrNama:=QuotedStr(Nama.Text);
    StrAlamat:=QuotedStr(Alamat.Text);
    StrSlinder:=Slinder.Text;
    if (Trim(TahunReg.Text)<>'') then StrTahunReg:=QuotedStr(TahunReg.Text) else StrTahunReg:='NULL';
    StrGroup:=GroupArr[Group.ItemIndex][0];
    StrTipe:=TipeArr[Tipe.ItemIndex][0];
    if Kotamadya.Text<>'' then StrProvinceState:=ProvinceStateArr[Kotamadya.ItemIndex][0]
    else StrProvinceState:='NULL';
    if Trim(Warna.Text)<>'' then StrWarna:=QuotedStr(Trim(Warna.Text)) else StrWarna:='NULL';
    if (Trim(STNK.Text)<>'/  /') then StrSTNK:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(STNK.Text)))
    else StrSTNK:='NULL';
    if (Trim(KIR.Text)<>'/  /') then StrKIR:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIR.Text)))
    else StrKIR:='NULL';
    if (Trim(KIU.Text)<>'/  /') then StrKIU:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIU.Text)))
    else StrKIU:='NULL';
    if (Trim(KIO.Text)<>'/  /') then StrKIO:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIO.Text)))
    else StrKIO:='NULL';
    if (Trim(Tera.Text)<>'/  /') then StrTera:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Tera.Text)))
    else StrTera:='NULL';
    if Main.OpenDb then begin
      Main.TransStart;
      DisableInput;
      StrQry:='SELECT * FROM wh_vehicle WHERE ( (body_id='+StrBPKB+
            ') OR (UPPER(license_plate)='+StrNoPolisi+') AND company_id='+StrCompanyId+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount<1 then begin
        NoRecord:=True;
      end else begin
        NoRecord:=False;
      end;
      if (NoRecord=True) OR (VhcId<>'') then begin
        StrQry:='SELECT RIGHT(MAX(vehicle_id),4) AS vehicle_id FROM wh_vehicle '+
              'WHERE company_id='+StrCompanyId+' AND vehicle_id LIKE '+QuotedStr(VhcCode+StrCompanyId+
              FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+'____')+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['vehicle_id']<>NULL then begin
           NewId:=Qry.FieldValues['vehicle_id'];
           StrNewId:=Format('%.*d',[4,NewId+1]);
        end else begin
           StrNewId:='0001';
        end;
        Qry.Close;
        StrNewId:=VhcCode+StrCompanyId+FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+StrNewId;
        StrSTNK:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(STNK.Text)));
        if (Vhcid='') then begin
          StrQry:='INSERT INTO wh_vehicle (vehicle_id,company_id,body_id,engine_id,chasis_id,'+
                'license_plate,year,cylinder,vhc_batch_id,vhc_type_detail_id,update_user)'+
                'VALUES ('+QuotedStr(StrNewId)+','+QuotedStr(StrCompanyId)+
                ','+StrBPKB+','+QuotedStr(Trim(NoMesin.Text))+
                ','+QuotedStr(Trim(NoRangka.Text))+','+StrNoPolisi+
                ','+QuotedStr(Tahun.Text)+','+StrSlinder+','+StrGroup+','+StrTipe+','+QuotedStr(User)+');';
        end else begin
          StrQry:='UPDATE wh_vehicle SET '+
                'vhc_type_detail_id='+StrTipe+
                ',body_id='+StrBPKB+
                ',engine_id='+QuotedStr(Trim(NoMesin.Text))+
                ',chasis_id='+QuotedStr(Trim(NoRangka.Text))+
                ',license_plate='+StrNoPolisi+
                ',year='+QuotedStr(Tahun.Text)+',cylinder='+StrSlinder+
                ',vhc_batch_id='+StrGroup+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vehicle_id='+QuotedStr(VhcId)+';';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do Ok:=False;
        end;
        if (Vhcid='') then begin
          StrQry:='INSERT INTO wh_vhc_detail (vehicle_id,location_id,name,address,year_reg,color,province_state_id,stnk,kir,kiu,kio,tera,update_user)'+
                ' VALUES ('+QuotedStr(StrNewId)+','+StrLocationId+','+StrNama+','+StrAlamat+','+StrTahunReg+
                ','+StrWarna+','+StrProvinceState+','+StrSTNK+
                ','+StrKIR+','+StrKIU+','+StrKIO+','+StrTera+','+QuotedStr(User)+');';
        end else begin
          StrQry:='UPDATE wh_vhc_detail  SET location_id='+StrLocationId+',name='+StrNama+',address='+StrAlamat+
                ',year_reg='+StrTahunReg+',province_state_id='+StrProvinceState+',color='+StrWarna+',stnk='+StrSTNK+
                ',kir='+StrKIR+',kiu='+StrKIU+',kio='+StrKIO+',tera='+StrTera+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vhc_detail_id='+QuotedStr(VhcDetailId)+';';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
           Qry.ExecSQL;
        except
          on E:Exception do Ok:=False;
        end;
        if (EmplId<>'') then begin
          StrQry:='INSERT INTO wh_working_schedule (vehicle_id,employee_id,from_date,to_date,location_id,update_user)'+
                ' VALUES ('+QuotedStr(StrNewId)+','+QuotedStr(EmplId)+',GETDATE(),'+QuotedStr('2099/12/31')+','+StrLocationId+','+QuotedStr(User)+');';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
             Qry.ExecSQL;
          except
            on E:Exception do Ok:=False;
          end;
        end;
        if Ok then begin
          Main.TransCommit;
          MessageBox(0,'Penambahan/Perubahan Armada Berhasil','Tambah Armada',MB_OK or MB_ICONINFORMATION);
          if VhcId='' then Bersihkan.SetFocus;
          VhcId:=StrNewId
//          else LoadGrid;
        end else begin
          Main.TransRollback;
          MessageBox(0,'Penambahan/Perubahan Armada Gagal','Rubah Armada',MB_OK or MB_ICONWARNING);
          EnableInput;
        end;
        Qry.Close;
      end else begin
        MessageBox(0,'No Body/No Polisi Sudah Ada','Tambah Armada',MB_OK or MB_ICONWARNING);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TVehicleForm2.NoBPKBKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Nama.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm2.NoMesinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoRangka.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm2.NoRangkaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then Warna.SetFocus
    else Key:=UpCase(Key);
end;

procedure TVehicleForm2.NoPolisiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoBPKB.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm2.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TahunReg.SetFocus;
end;

procedure TVehicleForm2.KIRKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIU.SetFocus;
end;

procedure TVehicleForm2.KIOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tera.SetFocus;
end;

procedure TVehicleForm2.TeraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TVehicleForm2.STNKKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIR.SetFocus;
end;

procedure TVehicleForm2.KIUKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIO.SetFocus;
end;

procedure TVehicleForm2.GroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Jenis.SetFocus;
end;

procedure TVehicleForm2.FormShow(Sender: TObject);
var Count:Integer;
begin
  Init;
  RefreshCombo;
  RefreshGroup;
  if (VhcId<>'') or (EmplId<>'') then begin
    LoadData;
    GroupDoc.Visible:=True;
    if (VhcId<>'') then
      PanelDriver.Visible:=True
    else
      SetDriver.Visible:=True;
  end;
  if IsReadOnly=True then begin
    DisableInput;
    GroupDoc.Visible:=True;
  end else begin
    if IsPicOnly then DisableInput;
  end;
end;

procedure TVehicleForm2.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
  GroupInput2.Enabled:=True;
end;

procedure TVehicleForm2.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  GroupInput2.Enabled:=False;
end;


procedure TVehicleForm2.GroupChange(Sender: TObject);
begin
  if Group.Text<>'' then begin
    RefreshJenis;
  end;
end;

procedure TVehicleForm2.JenisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tipe.SetFocus;
end;

procedure TVehicleForm2.BersihkanClick(Sender: TObject);
begin
  Init;
  EmplId:='';
  RefreshCombo;
  RefreshGroup;
  NoBPKB.SetFocus;
  EnableInput;
end;

procedure TVehicleForm2.PerlengkapanClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleEquipmentCheck')=False then  VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'',VhcId,False)
end;

procedure TVehicleForm2.NoPolisiEnter(Sender: TObject);
begin
  NoPolisi.Text:=StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]);
end;

procedure TVehicleForm2.NoPolisiExit(Sender: TObject);
begin
  if IsCharAlpha(PChar(Copy(NoPolisi.Text,2,1))^)=False then
    NoPolisi.Text:=Copy(NoPolisi.Text,1,1)+' '+Copy(NoPolisi.Text,2,4)+
                              ' '+Copy(NoPolisi.Text,6,Length(NoPolisi.Text)+1)
  else
    NoPolisi.Text:=Copy(NoPolisi.Text,1,2)+' '+Copy(NoPolisi.Text,3,4)+
                              ' '+Copy(NoPolisi.Text,7,Length(NoPolisi.Text)+1);
end;

procedure TVehicleForm2.NamaKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Alamat.SetFocus;
end;

procedure TVehicleForm2.AlamatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Propinsi.SetFocus;
end;

procedure TVehicleForm2.TahunRegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Slinder.SetFocus;
end;

procedure TVehicleForm2.SlinderKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then NoMesin.SetFocus;
end;

procedure TVehicleForm2.WarnaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then STNK.SetFocus;
end;

procedure TVehicleForm2.CariDriverClick(Sender: TObject);
begin
  if (Main.IsFormOpen('EmployeeForm2')=False) and (EmplId<>'') then EmployeeForm2:=TEmployeeForm2.Create(Self,EmplId);
end;

procedure TVehicleForm2.SetDriverClick(Sender: TObject);
begin
  if VhcId<>'' then
    EmployeeForm2:=TEmployeeForm2.Create(Self,'',False,VhcId,False);
end;

procedure TVehicleForm2.Doc7Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='7';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc7.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc7.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,7,VhcId,1);
  end;
end;

procedure TVehicleForm2.Doc8Click(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if not(IsReadOnly) then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      ImgTemp.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        ImgTemp.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_vhc_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('vehicle_id')).Value:=VhcId;
          TBlobField(Qry.FieldByName('image_id')).Value:='8';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
          Doc8.Font.Color:=clBlue;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 5 MegaPixel','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end else begin
    if (Doc8.Font.Color=clBlue) then
      ImageViewer:=TImageViewer.Create(Self,6,VhcId,1);
  end;
end;

procedure TVehicleForm2.PropinsiChange(Sender: TObject);
begin
  RefreshProvinceState;
end;

procedure TVehicleForm2.PropinsiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Kotamadya.SetFocus;
end;

procedure TVehicleForm2.KotamadyaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Group.SetFocus;
end;

procedure TVehicleForm2.JenisChange(Sender: TObject);
begin
  if Jenis.Text<>'' then RefreshTipe;
end;

procedure TVehicleForm2.TipeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tahun.SetFocus;
end;

end.
