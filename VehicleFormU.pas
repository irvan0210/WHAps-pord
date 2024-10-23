unit VehicleFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB, ComCtrls, WHUnit, ExtCtrls, Grids,
  ZColorStringGrid, Jpeg, Buttons;

type
  TVehicleForm = class(TForm)
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
    GroupRiwayat: TGroupBox;
    StrGrid: TZColorStringGrid;
    CheckData: TTimer;
    Bersihkan: TButton;
    Label25: TLabel;
    Perlengkapan: TButton;
    STNK: TMaskEdit;
    VhcImage: TImage;
    GroupDriver: TPanel;
    Label17: TLabel;
    Driver: TEdit;
    CariDriver: TSpeedButton;
    GroupInput: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label11: TLabel;
    NoRangka: TEdit;
    NoMesin: TEdit;
    Tahun: TMaskEdit;
    SBU: TComboBox;
    NoBodi: TEdit;
    Panel2: TPanel;
    GroupReguler: TPanel;
    Label15: TLabel;
    Reguler: TRadioButton;
    Executive: TRadioButton;
    NoPolisi: TEdit;
    Jenis: TComboBox;
    Group: TComboBox;
    NoPolisi2: TEdit;
    isFacelift: TCheckBox;
    GroupNoUjiKir: TPanel;
    Label26: TLabel;
    NoUjiKIR: TEdit;
    Label27: TLabel;
    ETollNumber: TEdit;
    OwnerVhc: TComboBox;
    Label29: TLabel;
    Label28: TLabel;
    NoKP: TEdit;
    eDealer: TComboBox;
    Label30: TLabel;
    eKaroseri: TComboBox;
    Label31: TLabel;
    Label32: TLabel;
    eGPcode: TComboBox;
    GroupInput3: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    nomsisdn: TEdit;
    router: TEdit;
    password: TEdit;
    ssid: TEdit;
    Label37: TLabel;
    operator: TEdit;
    Label39: TLabel;
    noasset: TEdit;
    lbl1: TLabel;
    X1: TMemo;
    isOutsideRent: TCheckBox;
    Label40: TLabel;
    AssetOwner: TComboBox;
    isSafetyBelt: TCheckBox;
    Label41: TLabel;
    Label42: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoBodiKeyPress(Sender: TObject; var Key: Char);
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
    procedure CheckDataTimer(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure JenisKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PerlengkapanClick(Sender: TObject);
    procedure NoPolisiEnter(Sender: TObject);
    procedure NoPolisiExit(Sender: TObject);
    procedure NoPolisi2Enter(Sender: TObject);
    procedure NoPolisi2Exit(Sender: TObject);
    procedure NoPolisi2KeyPress(Sender: TObject; var Key: Char);
    procedure CariDriverClick(Sender: TObject);
    procedure NoPolisiChange(Sender: TObject);
    procedure isOutsideRentClick(Sender: TObject);
  private
    { Private declarations }
    GroupArr,JenisArr,OwnerArr,DealerArr,KaroseriArr,GPCodeArr,AssetArr:Array of TArrString2;
    CompanyArr:array of TArrString8;
    IsReadOnly:Boolean;
    VhcDetailId,BodyId:String;
    CompId:Integer;
    VhcType:Integer;
    VhcId,EmplId:String;
    VhcCode:String;
    procedure Init;
    procedure RefreshCompany;
    procedure RefreshGroup;
    procedure RefreshJenis;
    procedure LoadData;
    procedure InitGrid;
    procedure LoadGrid;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleType:String;VehicleId:String;IsRead_Only:Boolean=True;Body_Id:String='');Overload;
  end;

var
  VehicleForm: TVehicleForm;

implementation

{$R *.dfm}

Uses MainU, VehicleEquipmentCheckU, DB, ImageViewerU, EmployeeFormU;

constructor TVehicleForm.Create(AOwner:TComponent;VehicleType:String;VehicleId:String;IsRead_Only:Boolean=True;Body_Id:String='');
begin
  if UpperCase(VehicleType)='TAXI' then begin
    VhcType:=1;
    VhcCode:='TX';
    CompId:=3;
  end else if UpperCase(VehicleType)='BUS' then begin
    VhcType:=2;
    VhcCode:='BS';
    CompId:=2;
  end else if UpperCase(VehicleType)='GRAYLINE' then begin
    VhcType:=3;
    VhcCode:='GL';
    CompId:=7;
  end;
  BodyId:=Body_Id;
  VhcId:=VehicleId;
  if VhcId='' then IsReadOnly:=False
  else IsReadOnly:=IsRead_Only;
  inherited Create(AOwner);
end;

procedure TVehicleForm.Init;
begin
  Case VhcType of
    1:begin
        Caption:='Armada Taxi';
        Label10.Caption := 'Tera';
        GroupReguler.Visible:=True;
      end;
    2:begin
        Caption:='Armada Bus';
        Label10.Caption := 'Pajak';
        GroupReguler.Visible:=False;
      end;
    3:begin
        Caption:='Armada Gray Line';
        Label10.Caption := 'Pajak';
        GroupReguler.Visible:=False;
      end;
  end;
  EmplId:='';
  NoBodi.Text:='';
  NoRangka.Text:='';
  NoMesin.Text:='';
  NoPolisi.Text:='';
  Tahun.Text:='';
  STNK.Text:=FormatDateTime('dd/mm/yyyy',Now);
  KIR.Text:='';
  KIU.Text:='';
  KIO.Text:='';
  Tera.Text:='';
  ETollNumber.Text:='';
  NoUjiKIR.Text:='';

  Group.ItemIndex:=-1;
  Group.Clear;
  GroupInput.Enabled:=True;
  GroupInput2.Enabled:=True;
  GroupInput3.Enabled:=True;
  Jenis.Items.Clear;
  Jenis.Items.Text:='';
  Jenis.ItemIndex:=-1;
  VhcDetailId:='';
  Perlengkapan.Visible:=False;
  GroupDriver.Visible:=False;
  nomsisdn.Clear;
  operator.Clear;
  ssid.Clear;
  password.Clear;
end;

procedure TVehicleForm.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=65;
  StrGrid.ColWidths[1]:=65;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=120;
  StrGrid.Cells[0,0]:='Dari';
  StrGrid.Cells[1,0]:='Sampai';
  StrGrid.Cells[2,0]:='Lokasi';
  StrGrid.Cells[3,0]:='User';
  for Count:=0 to 3 do
    StrGrid.Cells[Count,1]:='';
end;

procedure TVehicleForm.RefreshCompany;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(CompanyArr,0);
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  if StrToInt(CompanyId)>1 then SBU.Enabled:=False;
  Main.M_Normal;
end;

procedure TVehicleForm.RefreshGroup;
var Qry:TADOQuery;
    QStr,StrCompanyId:String;
    IntCount:Integer;
begin
  Group.Items.Clear;
  Group.Text:='';
  SetLength(GroupArr,0);

  OwnerVhc.Items.Clear;
  OwnerVhc.Text:='';
  SetLength(JenisArr,0);
  SetLength(OwnerArr,0);
  eDealer.Items.Clear;
  eDealer.Text:='';
  SetLength(DealerArr,0);
  eKaroseri.Items.Clear;
  eKaroseri.Text:='';
  SetLength(KaroseriArr,0);
  eGPcode.Items.Clear;
  eGPcode.Text:='';
  SetLength(GPCodeArr,0);
    
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
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

      Qry.SQL.Clear;
      QStr:='exec GetStnkOwner;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(OwnerArr,IntCount+1);
        OwnerArr[IntCount][0]:=Qry.FieldValues['id'];
        OwnerArr[IntCount][1]:=ToString(Qry.FieldValues['stnk_owner_name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;

      Qry.SQL.Clear;
      QStr:='exec GetDealer;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(DealerArr,IntCount+1);
        DealerArr[IntCount][0]:=Qry.FieldValues['id_dealer'];
        DealerArr[IntCount][1]:=ToString(Qry.FieldValues['dealer_name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;

      Qry.SQL.Clear;
      QStr:='exec GetKaroseri;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(KaroseriArr,IntCount+1);
        KaroseriArr[IntCount][0]:=Qry.FieldValues['id_karoseri'];
        KaroseriArr[IntCount][1]:=ToString(Qry.FieldValues['karoseri_name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;

      Qry.SQL.Clear;
      QStr:='Exec GetNopolGP;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(GPCodeArr,IntCount+1);
        GPCodeArr[IntCount][0]:=Qry.FieldValues['nopol_gp_id'];
        GPCodeArr[IntCount][1]:=ToString(Qry.FieldValues['name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;

      Qry.SQL.Clear;
      QStr:='exec GetCompanyIsAsset;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(AssetArr,IntCount+1);
        AssetArr[IntCount][0]:=Qry.FieldValues['id'];
        AssetArr[IntCount][1]:=ToString(Qry.FieldValues['name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);

  for IntCount:=0 to Length(OwnerArr)-1 do
    OwnerVhc.Items.Add(OwnerArr[IntCount][1]);
  for IntCount:=0 to Length(DealerArr)-1 do
    eDealer.Items.Add(DealerArr[IntCount][1]);
  for IntCount:=0 to Length(KaroseriArr)-1 do
    eKaroseri.Items.Add(KaroseriArr[IntCount][1]);
  for IntCount:=0 to Length(GPCodeArr)-1 do
    eGPcode.Items.Add(GPCodeArr[IntCount][1]);
  for IntCount:=0 to Length(AssetArr)-1 do
    AssetOwner.Items.Add(AssetArr[IntCount][1]);
        
  Main.M_Normal;
end;

procedure TVehicleForm.RefreshJenis;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrGroup:String;
    IntCount:Integer;
begin
  Jenis.Items.Clear;
  Jenis.Text:='';

  Main.M_Busy;
  if Group.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrGroup:=GroupArr[Group.ItemIndex][0];
      QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+StrGroup+';';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(JenisArr,IntCount+1);
        JenisArr[IntCount][0]:=Qry.FieldValues['vhc_type_detail_id'];
        JenisArr[IntCount][1]:=ToString(Qry.FieldValues['brand'])+' '+ToString(Qry.FieldValues['type'])+', '+ToString(Qry.FieldValues['seat'])+' Seat';
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;


    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(JenisArr)-1 do
    Jenis.Items.Add(JenisArr[IntCount][1]);

  Main.M_Normal;
end;

procedure TVehicleForm.LoadData;
var IntCount:Integer;
    StrQry,VhcTypeDetailImageTypeId,VhcTypeDetailId,VhcOwner,Karoseri,Dealer,GPCode,AssetId:String;
    Qry:TADOQuery;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if BodyId<>'' then begin
      StrQry:='EXEC GetVehicleDetail @BodyId='+QuotedStr(BodyId)+';';
    end else begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(VhcId)+';';
    end;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      VhcTypeDetailImageTypeId:='';
      if BodyId<>'' then VhcId:=Qry.FieldValues['vehicle_id'];
      NoBodi.Text:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['engine_id']<>NULL then NoMesin.Text:=Qry.FieldValues['engine_id'];
      if Qry.FieldValues['chasis_id']<>NULL then NoRangka.Text:=Qry.FieldValues['chasis_id'];
      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      if Qry.FieldValues['license_plate2']<>NULL then LicensePlate(Qry.FieldValues['license_plate2']);
      
      if Qry.FieldValues['year']<>NULL then Tahun.Text:=Qry.FieldValues['year'];
      Group.ItemIndex:=ArrayIndexOf(GroupArr,Qry.FieldValues['vhc_batch_id'],0);
      if Qry.FieldValues['stnk']<>NULL then STNK.Text:=Qry.FieldValues['stnk'];
      if Qry.FieldValues['kir']<>NULL then KIR.Text:=Qry.FieldValues['kir'];
      if Qry.FieldValues['kiu']<>NULL then KIU.Text:=Qry.FieldValues['kiu'];
      if Qry.FieldValues['kio']<>NULL then KIO.Text:=Qry.FieldValues['kio'];
      if Qry.FieldValues['tera']<>NULL then Tera.Text:=Qry.FieldValues['tera'];
      if GroupReguler.Visible then if Qry.FieldValues['reguler']=1 then Reguler.Checked:=True else Executive.Checked:=True;
      VhcDetailId:=Qry.FieldValues['vhc_detail_id'];
      VhcTypeDetailId:=Qry.FieldValues['vhc_type_detail_id'];
      VhcOwner:=VarToStr(Qry.FieldValues['stnk_owner_id']);
      Dealer:=VarToStr(Qry.FieldValues['id_dealer']);
      Karoseri:=VarToStr(Qry.FieldValues['id_karoseri']);
      GPCode:=VarToStr(Qry.FieldValues['nopol_gp_id']);
      AssetId:=VarToStr(Qry.FieldValues['asset_id']);

      nomsisdn.Text:=VarToStr(Qry.FieldValues['msisdn']);
      operator.Text:=VarToStr(Qry.FieldValues['operator']);
      router.Text:=VarToStr(Qry.FieldValues['router']);
      noasset.Text:=VarToStr(Qry.FieldValues['asset_no']);
      ssid.Text:=VarToStr(Qry.FieldValues['ssid']);
      password.Text:=VarToStr(Qry.FieldValues['password_ssid']);

      if Qry.FieldValues['vhc_type_detail_image_type_id']<>NULL then VhcTypeDetailImageTypeId:=Qry.FieldValues['vhc_type_detail_image_type_id'];
      if Qry.FieldValues['employee_id']<>NULL then EmplId:=Qry.FieldValues['employee_id'];
      if Qry.FieldValues['name']<>NULL then Driver.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['is_facelift']=1 then isFacelift.Checked:=True else isFacelift.Checked:=False;
      if Qry.FieldValues['is_safetybelt']=1 then isSafetyBelt.Checked:=True else isSafetyBelt.Checked:=False;
      if Qry.FieldValues['isOutsideRent']=1 then isOutsideRent.Checked:=True else isOutsideRent.Checked:=False;
      if Qry.FieldValues['no_uji_kir']<>NULL then NoUjiKIR.Text:=Qry.FieldValues['no_uji_kir'];
      if Qry.FieldValues['no_kp']<>NULL then NoKP.Text:=Qry.FieldValues['no_kp'];
      if Qry.FieldValues['etoll_number']<>NULL then ETollNumber.Text:=Qry.FieldValues['etoll_number'];
    end;
    Qry.Close;
    if VhcTypeDetailImageTypeId<>'' then begin
      StrQry:='SELECT * FROM wh_vhc_type_detail_image WHERE (vhc_type_detail_image_type_id='+QuotedStr(VhcTypeDetailImageTypeId)+') AND (vhc_image_type_id=1) ORDER BY vhc_type_detail_image_id DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          VhcImage.Picture.Assign(JPG);
          VhcImage.Stretch:=True;
          VhcImage.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  RefreshJenis;
  Jenis.ItemIndex:=ArrayIndexOf(JenisArr,VhcTypeDetailId,0);
  OwnerVhc.ItemIndex:=ArrayIndexOf(OwnerArr,VhcOwner,0);
  eDealer.ItemIndex:=ArrayIndexOf(DealerArr,Dealer,0);
  eKaroseri.ItemIndex:=ArrayIndexOf(KaroseriArr,Karoseri,0);
  eGPcode.ItemIndex:=ArrayIndexOf(GPCodeArr,GPCode,0);
  AssetOwner.ItemIndex:=ArrayIndexOf(AssetArr,AssetId,0);

  Main.M_Normal;
end;

procedure TVehicleForm.LoadGrid;
var IntCount:Integer;
    StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT dbo.GetUsername(a.update_user) AS user_name,* FROM wh_vhc_detail a '+
            ' LEFT JOIN wh_location b ON b.location_id=a.location_id'+
            ' WHERE a.vehicle_id='+QuotedStr(VhcId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then
      while not qry.Eof do begin
      StrGrid.RowCount:=IntCount+2;
      StrGrid.Cells[0,IntCount+1]:=Qry.FieldValues['from_date'];
      if Qry.FieldValues['to_date']<>NULL then StrGrid.Cells[1,IntCount+1]:=Qry.FieldValues['to_date'];
      StrGrid.Cells[2,IntCount+1]:=Qry.FieldValues['location'];
      StrGrid.Cells[3,IntCount+1]:=Qry.FieldValues['user_name'];
      Qry.Next;
      Inc(IntCount);
      end;
    Qry.Close;
  end;
  Main.CloseDb;
  Qry.Destroy;
end;

procedure TVehicleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleForm.SelesaiClick(Sender: TObject);
var QVhc:TADOQuery;
    StrQry,StrNoPolisi,StrNoPolisi2:String;
begin
  VehicleForm.Close;
end;

procedure TVehicleForm.SimpanClick(Sender: TObject);
var QVhc:TADOQuery;
    StrQry,StrNewId,StrSTNK,StrKIR,StrKIU,StrKIO,StrTera,StrReguler,StrNoPolisi,
    StrLocationId,StrCompanyId,StrNoPolisi2,StrGroup,StrJenis,StrFaceLift,StrSafetyBelt,StrNoUjiKir,StrNoEtoll,
    StrOwner,StrNoKP,StrDealer,StrKaroseri,StrGPCode,StrAssetId,
    StrMsisdn,StrOperator,StrSsid,StrPassword,StrAssetNo,StrRouter,StrOutsideRent:String;
    Ok,NoRecord:Boolean;
    NewId,Status:Integer;
begin
  Ok:=True;
  if ( (Trim(NoBodi.Text)<>'') AND (Trim(NoRangka.Text)<>'') AND (Trim(NoMesin.Text)<>'') AND
  (Trim(NoPolisi.Text)<>'') AND (Trim(Tahun.Text)<>'') AND (Trim(Group.Text)<>'')  AND (Trim(Jenis.Text)<>'') AND
  (Trim(OwnerVhc.Text)<>'') AND (Trim(AssetOwner.Text)<>'')) then begin
    QVhc:=TADOQuery.Create(Self);
    QVhc.Connection:=Main.MyConnection;
    StrNoPolisi:=QuotedStr(StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]));
    StrNoPolisi2:=StringReplace(NoPolisi2.Text,' ','',[rfReplaceAll]);
    if StrNoPolisi2='' then StrNoPolisi2:='NULL' else StrNoPolisi2:=QuotedStr(StrNoPolisi2);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrGroup:=GroupArr[Group.ItemIndex][0];
    StrJenis:=JenisArr[Jenis.ItemIndex][0];
    Try
      StrOwner:=OwnerArr[OwnerVhc.ItemIndex][0];
    Except
      on exception do
        StrOwner:='';
    End;
    Try
      StrDealer:=DealerArr[eDealer.ItemIndex][0];
    Except
      on exception do
        StrDealer:='';
    End;
    Try
      StrKaroseri:=KaroseriArr[eKaroseri.ItemIndex][0];
    Except
      on exception do
        StrKaroseri:='';
    End;
    Try
      StrGPCode:=GPCodeArr[eGPcode.ItemIndex][0];
    Except
      on exception do
        StrGPCode:='';
    End;

    StrAssetId:='';
    Try
      StrAssetId:=AssetArr[AssetOwner.ItemIndex][0];
    Except
      on exception do
        StrAssetId:='';
    End;

    if Main.OpenDb then begin
      Main.TransStart;
      DisableInput;
      StrQry:='SELECT * FROM wh_vehicle WHERE ( (body_id='+Chr(39)+Trim(NoBodi.Text)+Chr(39)+
            ') OR (UPPER(license_plate)='+QuotedStr(UpperCase(Trim(NoPolisi.Text)))+') AND company_id='+QuotedStr(StrCompanyId)+');';
      QVhc.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      QVhc.SQL.Add(StrQry);
      QVhc.Open;
      
      if QVhc.RecordCount<1 then begin
        NoRecord:=True;
      end else begin
        NoRecord:=False;
      end;
      if (NoRecord=True) OR (VhcId<>'') then begin
        StrQry:='SELECT RIGHT(MAX(vehicle_id),4) AS vehicle_id FROM wh_vehicle '+
              'WHERE company_id='+QuotedStr(StrCompanyId)+' AND vehicle_id LIKE '+Chr(39)+VhcCode+StrCompanyId+
              FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+'____'+Chr(39)+';';
        QVhc.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        QVhc.SQL.Add(StrQry);
        QVhc.Open;
        if QVhc.FieldValues['vehicle_id']<>NULL then begin
           NewId:=QVhc.FieldValues['vehicle_id'];
           StrNewId:=Format('%.*d',[4,NewId+1]);
        end else begin
           StrNewId:='0001';
        end;
        QVhc.Close;
        StrNewId:=VhcCode+StrCompanyId+FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+StrNewId;
        StrSTNK:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(STNK.Text)));
        if (Trim(KIR.Text)<>'/  /') then StrKIR:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIR.Text)))
        else StrKIR:='NULL';
        if (Trim(KIU.Text)<>'/  /') then StrKIU:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIU.Text)))
        else StrKIU:='NULL';
        if (Trim(KIO.Text)<>'/  /') then StrKIO:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(KIO.Text)))
        else StrKIO:='NULL';
        if (Trim(Tera.Text)<>'/  /') then StrTera:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Tera.Text)))
        else StrTera:='NULL';
        if GroupReguler.Visible=True then if Reguler.Checked=True then StrReguler:='1' else StrReguler:='0'
        else StrReguler:='0';
        if isFacelift.Checked then StrFaceLift:='1' else StrFaceLift:='0';
        if isOutsideRent.Checked then StrOutsideRent:='1' else StrOutsideRent:='0';
        if isSafetyBelt.Checked then StrSafetyBelt:='1' else StrSafetyBelt:='0';
        StrMsisdn := QuotedStr(nomsisdn.Text);
        StrOperator := QuotedStr(operator.Text);

        StrRouter := QuotedStr(router.Text);
        StrAssetNo := QuotedStr(noasset.Text);

        StrSsid := QuotedStr(ssid.Text);
        StrPassword := QuotedStr(password.Text);

        StrNoUjiKir := QuotedStr(NoUjiKIR.Text);
        StrNoEtoll := QuotedStr(ETollNumber.Text);
        StrNoKP := QuotedStr(NoKP.Text);

        if (Vhcid='') then begin
          StrQry:='INSERT INTO wh_vehicle (vehicle_id,company_id,body_id,engine_id,chasis_id,'+
                'license_plate,license_plate2,year,vhc_batch_id,vhc_type_detail_id,is_facelift,etoll_number,'+
                'stnk_owner_id,dealer_id,karoseri_id,code_gp_id,isOutsideRent,asset_id,'+
                'update_user,is_safetybelt)'+
                'VALUES ('+QuotedStr(StrNewId)+','+QuotedStr(StrCompanyId)+
                ','+QuotedStr(Trim(NoBodi.Text))+','+QuotedStr(Trim(NoMesin.Text))+
                ','+QuotedStr(Trim(NoRangka.Text))+','+StrNoPolisi+','+StrNoPolisi2+
                ','+QuotedStr(Tahun.Text)+','+StrGroup+','+StrJenis+','+StrFaceLift+','+StrNoEtoll+
                ','+QuotedStr(StrOwner)+','+QuotedStr(StrDealer)+','+QuotedStr(StrKaroseri)+
                ','+QuotedStr(StrGPCode)+','+StrOutsideRent+','+StrAssetId+
                ','+QuotedStr(User)+','+StrSafetyBelt+');';
        end else begin
//          QStr:='UPDATE wh_vehicle SET vehicle_type_id='+QuotedStr(IntToStr(VhcType))+
          StrQry:='UPDATE wh_vehicle SET '+
                'vhc_type_detail_id='+QuotedStr(StrJenis)+
                ',body_id='+QuotedStr(Trim(NoBodi.Text))+
                ',engine_id='+QuotedStr(Trim(NoMesin.Text))+
                ',chasis_id='+QuotedStr(Trim(NoRangka.Text))+
                ',license_plate='+StrNoPolisi+
                ',license_plate2='+StrNoPolisi2+
                ',is_facelift='+StrFaceLift+
                ',isOutsideRent='+StrOutsideRent+
                ',etoll_number='+StrNoEtoll+
                ',stnk_owner_id='+QuotedStr(StrOwner)+
                ',dealer_id='+QuotedStr(StrDealer)+
                ',karoseri_id='+QuotedStr(StrKaroseri)+
                ',code_gp_id='+QuotedStr(StrGPCode)+
                ',asset_id='+QuotedStr(StrAssetId)+
                ',year='+QuotedStr(Tahun.Text)+',vhc_batch_id='+StrGroup+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ',is_safetybelt='+StrSafetyBelt+
                ' WHERE vehicle_id='+QuotedStr(VhcId)+';';
        end;
        QVhc.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        QVhc.SQL.Add(StrQry);
        try
          QVhc.ExecSQL;
        except
          on E:Exception do Ok:=False;
        end;
        if (Vhcid='') then begin
          StrQry:='INSERT INTO wh_vhc_detail (vehicle_id,location_id,stnk,kir,kiu,kio,tera,reguler,no_uji_kir,no_kp,update_user)'+
                ' VALUES ('+QuotedStr(StrNewId)+','+StrLocationId+','+StrSTNK+
                ','+StrKIR+','+StrKIU+','+StrKIO+','+StrTera+','+StrReguler+','+StrNoUjiKir+','+StrNoKP+
                ','+QuotedStr(User)+');';
          //StrQry:=StrQry+'INSERT INTO wh_vhc_msisdn (vehicle_id,msisdn,operator,ssid,password_ssid,update_time,update_user) VALUES ('+
          //        QuotedStr(VhcId)+','+StrMsisdn+','+StrOperator+','+StrSSID+','+StrPassword+',GETDATE(),'+QuotedStr(User)+') ;';
          StrQry:=StrQry+'INSERT INTO wh_vhc_msisdn (vehicle_id,msisdn,operator,router,asset_no,ssid,password_ssid,update_time,update_user) VALUES ('+
                  QuotedStr(VhcId)+','+StrMsisdn+','+StrOperator+','+StrRouter+','+StrAssetNo+','+StrSSID+','+StrPassword+',GETDATE(),'+QuotedStr(User)+') ;';

        end else begin
          StrQry:='UPDATE wh_vhc_detail  SET location_id='+StrLocationId+',stnk='+StrSTNK+
                ',kir='+StrKIR+',kiu='+StrKIU+',kio='+StrKIO+',tera='+StrTera+',reguler='+StrReguler+',no_uji_kir='+StrNoUjiKir+',no_kp='+StrNoKP+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vhc_detail_id='+QuotedStr(VhcDetailId)+';';

          StrQry:=StrQry+'UPDATE wh_vhc_msisdn  SET status=0 '+
                //',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vehicle_id='+QuotedStr(VhcId)+' and status=1;';
          StrQry:=StrQry+'INSERT INTO wh_vhc_msisdn (vehicle_id,msisdn,operator,router,asset_no,ssid,password_ssid,update_time,update_user) VALUES ('+
                  QuotedStr(VhcId)+','+StrMsisdn+','+StrOperator+','+StrRouter+','+StrAssetNo+','+StrSSID+','+StrPassword+',GETDATE(),'+QuotedStr(User)+') ;';

        end;
        QVhc.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        QVhc.SQL.Add(StrQry);
        try
           QVhc.ExecSQL;
        except
          on E:Exception do Ok:=False;
        end;
        if Ok then begin
          Main.TransCommit;
          MessageBox(0,'Penambahan/Perubahan Armada Berhasil','Tambah Armada',MB_OK or MB_ICONINFORMATION);
          if VhcId='' then Bersihkan.SetFocus
          else LoadGrid;
        end else begin
          Main.TransRollback;
          MessageBox(0,'Penambahan/Perubahan Armada Gagal','Rubah Armada',MB_OK or MB_ICONWARNING);
          EnableInput;
        end;
        QVhc.Close;
      end else begin
        MessageBox(0,'No Body/No Polisi Sudah Ada','Tambah Armada',MB_OK or MB_ICONWARNING);
      end;
    end;
    QVhc.Destroy;
    Main.CloseDb;
  end else
  begin
    MessageBox(0,'Silahkan lengkapi kolom!!','Tambah Armada',MB_OK or MB_ICONWARNING);
  end;

end;


procedure TVehicleForm.NoBodiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoMesin.SetFocus;
end;

procedure TVehicleForm.NoMesinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoRangka.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm.NoRangkaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoPolisi.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm.NoPolisiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoPolisi2.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Group.SetFocus;
end;

procedure TVehicleForm.KIRKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIU.SetFocus;
end;

procedure TVehicleForm.KIOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tera.SetFocus;
end;

procedure TVehicleForm.TeraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TVehicleForm.STNKKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIR.SetFocus;
end;

procedure TVehicleForm.KIUKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then KIO.SetFocus;
end;

procedure TVehicleForm.GroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Jenis.SetFocus;
end;

procedure TVehicleForm.FormShow(Sender: TObject);
var Count:Integer;
begin
  Init;
  InitGrid;
  RefreshCompany;
//  Company.ItemIndex:=Company.Items.IndexOf(CompanyId);
//  CompanyDisp.Text:=CompanyArr[Company.ItemIndex][1];
//  RefreshLokasi;
//  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId)  ;
//  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
//  if StrToInt(LocationId)>1 then Lokasi.Enabled:=False;
  RefreshGroup;
  if (VhcId<>'') or (BodyId<>'') then begin
    GroupDriver.Visible:=True;
    LoadData;
    LoadGrid;
  end;
  if IsReadOnly=True then begin
    DisableInput;
    Perlengkapan.Visible:=True;
  end;
  CheckData.Enabled:=True;
{  if TreeTag=120105 then begin
    GroupInput.Enabled:=False;
    GroupInput2.Enabled:=False;
  end;
}
end;

procedure TVehicleForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
  GroupInput2.Enabled:=True;
  GroupInput3.Enabled:=True;
end;

procedure TVehicleForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  GroupInput2.Enabled:=False;
  GroupInput3.Enabled:=False;
end;


procedure TVehicleForm.CheckDataTimer(Sender: TObject);
begin
  CheckData.Enabled:=False;
  if NoBodi.Text<>'' then begin
    VehicleForm.Height:=587;
    VehicleForm.Width:=833;
  end else begin
    VehicleForm.Height:=462;
    VehicleForm.Width:=595;
  end;
end;

procedure TVehicleForm.GroupChange(Sender: TObject);
begin
  if Group.Text<>'' then begin
    RefreshJenis;
  end;
end;

procedure TVehicleForm.JenisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then STNK.SetFocus;
end;

procedure TVehicleForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCompany;
//  RefreshLokasi;
  RefreshGroup;
  NoBodi.SetFocus;
  EnableInput;
end;

procedure TVehicleForm.PerlengkapanClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleEquipmentCheck')=False then  VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'',VhcId,False)
end;

procedure TVehicleForm.NoPolisiEnter(Sender: TObject);
begin
  NoPolisi.Text:=StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]);
end;

procedure TVehicleForm.NoPolisiExit(Sender: TObject);
begin
  if IsCharAlpha(PChar(Copy(NoPolisi.Text,2,1))^)=False then
    NoPolisi.Text:=Copy(NoPolisi.Text,1,1)+' '+Copy(NoPolisi.Text,2,4)+
                              ' '+Copy(NoPolisi.Text,6,Length(NoPolisi.Text)+1)
  else
    NoPolisi.Text:=Copy(NoPolisi.Text,1,2)+' '+Copy(NoPolisi.Text,3,4)+
                              ' '+Copy(NoPolisi.Text,7,Length(NoPolisi.Text)+1);
end;

procedure TVehicleForm.NoPolisi2Enter(Sender: TObject);
begin
  NoPolisi2.Text:=StringReplace(NoPolisi2.Text,' ','',[rfReplaceAll]);
end;

procedure TVehicleForm.NoPolisi2Exit(Sender: TObject);
begin
  if IsCharAlpha(PChar(Copy(NoPolisi2.Text,2,1))^)=False then
    NoPolisi2.Text:=Copy(NoPolisi2.Text,1,1)+' '+Copy(NoPolisi2.Text,2,4)+
                              ' '+Copy(NoPolisi2.Text,6,Length(NoPolisi2.Text)+1)
  else
    NoPolisi2.Text:=Copy(NoPolisi2.Text,1,2)+' '+Copy(NoPolisi2.Text,3,4)+
                              ' '+Copy(NoPolisi.Text,7,Length(NoPolisi2.Text)+1);
end;

procedure TVehicleForm.NoPolisi2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tahun.SetFocus
  else Key:=UpCase(Key);
end;

procedure TVehicleForm.CariDriverClick(Sender: TObject);
begin
  if (Main.IsFormOpen('EmployeeForm')=False) and (EmplId<>'') then EmployeeForm:=TEmployeeForm.Create(Self,'Bus',EmplId);
end;

procedure TVehicleForm.NoPolisiChange(Sender: TObject);
var QVhc:TADOQuery;
    StrQry,StrNoPolisi,StrNoPolisi2:String;
begin
//  QVhc:=TADOQuery.Create(Self);
//  QVhc.Connection:=Main.MyConnection;
//  StrNoPolisi:=QuotedStr(StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]));
//  StrNoPolisi2:=QuotedStr(StringReplace(NoPolisi2.Text,' ','',[rfReplaceAll]));
//  if Main.OpenDb then begin
//
//    StrQry:='SELECT * FROM wh_vehicle WHERE ( (body_id='+Chr(39)+Trim(NoBodi.Text)+Chr(39)+
//            ') OR (UPPER(license_plate)='+UpperCase(StrNoPolisi)+') '+
//            'OR (UPPER(license_plate)='+UpperCase(StrNoPolisi2)+') '+
//            'OR (UPPER(license_plate2)='+UpperCase(StrNoPolisi)+') '+
//            'OR (UPPER(license_plate2)='+UpperCase(StrNoPolisi2)+') '+
//            'AND active=1);';
//    QVhc.SQL.Clear;
//    Main.WriteLog('SQL :'+StrQry,2);
//    QVhc.SQL.Add(StrQry);
//    QVhc.Open;
//    if (QVhc.FieldValues['license_plate']=Trim(NoPolisi.Text)) OR (QVhc.FieldValues['license_plate']=Trim(NoPolisi2.Text)) then
//    begin
//      MessageBox(0,'No Polisi Sudah Ada','Tambah Armada',MB_OK or MB_ICONWARNING);
//      EnableInput;
//    end
//  end;
//  QVhc.Destroy;
//  Main.CloseDb;
end;

procedure TVehicleForm.isOutsideRentClick(Sender: TObject);
begin
//  if isOutsideRent.Checked:=True then
//  begin
//    AssetOwner.ItemIndex:=-1;
//    Label41.Visible:=False;
//  end else begin
//    Label41.Visible:=True;
//  end;
end;

end.
