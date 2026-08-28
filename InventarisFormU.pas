unit InventarisFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB, ExtCtrls, ComCtrls;

type
  TInventarisForm = class(TForm)
    LblKodeIntegrasi: TLabel;
    LblLokasi: TLabel;
    LblInventarisId: TLabel;
    LblGroupJenis: TLabel;
    LblGroupSubJenis: TLabel;
    LblGroupUser: TLabel;
    LblUserPengguna: TLabel;
    LblTglPerolehan: TLabel;
    LblNilaiPerolehan: TLabel;
    LblSandiBi: TLabel;
    LblMerk: TLabel;
    LblType: TLabel;
    LblMemory: TLabel;
    LblStorage: TLabel;
    LblSerialNumber: TLabel;
    LblKodeLabel: TLabel;
    LblTglValuta: TLabel;
    LblUsiaPemakaian: TLabel;
    LblDeskripsi: TLabel;
    LblKeterangan: TLabel;
    LblBulan: TLabel;
    KodeIntegrasi: TComboBox;
    Lokasi: TComboBox;
    InventarisId: TEdit;
    GroupJenis: TComboBox;
    GroupSubJenis: TComboBox;
    GroupUser: TComboBox;
    UserPengguna: TComboBox;
    TglPerolehan: TDateTimePicker;
    NilaiPerolehan: TEdit;
    SandiBi: TComboBox;
    Merk: TComboBox;
    TypeModel: TComboBox;
    Memory: TComboBox;
    Storage: TComboBox;
    SerialNumber: TEdit;
    KodeLabelInventaris: TEdit;
    TglValuta: TDateTimePicker;
    UsiaPemakaian: TEdit;
    DeskripsiRingkas: TEdit;
    Keterangan: TMemo;
    Batal: TButton;
    Simpan: TButton;
    Panel1: TPanel;
    LblAktif: TLabel;
    Aktif: TCheckBox;
    LabelCaption: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure GroupJenisChange(Sender: TObject);
    procedure MerkChange(Sender: TObject);
    procedure NilaiPerolehanExit(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure GroupSubJenisChange(Sender: TObject);
    procedure GroupUserChange(Sender: TObject);
    procedure TglPerolehanChange(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshCombo;
    procedure RefreshSubJenisCombo(StrJenisId:String);
    procedure RefreshTypeCombo(StrMerkId:String);
    procedure RefreshKodeLabelPreview;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;Inventaris_Id:String='');Overload;
  end;

var
  InventarisForm: TInventarisForm;
  FormInventarisId:String;
  KIArr:Array of TArrString2;
  LokasiArr:Array of TArrString7;
  JenisArr:Array of TArrString2;
  SubJenisArr:Array of TArrString2;
  DepartmentArr:Array of TArrString2;
  MerkArr:Array of TArrString2;
  TypeArr:Array of TArrString2;
  SandiBiArr:Array of TArrString2;
  MemoryArr:Array of TArrString2;
  StorageArr:Array of TArrString2;
  UserArr:Array of TArrString2;

implementation

uses MainU, InventarisListU;

{$R *.dfm}

Constructor TInventarisForm.Create(AOwner:TComponent;Inventaris_Id:String='');
begin
  FormInventarisId:=Inventaris_Id;
  Inherited Create(AOwner);
end;

procedure TInventarisForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TInventarisForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    KodeIntegrasi.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_kode_integrasi WHERE status=1 ORDER BY kode;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(KIArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      KIArr[IntCount][0]:=Qry.FieldValues['kode_integrasi_id'];
      KIArr[IntCount][1]:=Qry.FieldValues['kode']+' - '+Qry.FieldValues['nama'];
      KodeIntegrasi.Items.Add(KIArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    Lokasi.Items.Clear;
    StrQry:='EXEC GetCompanyLocationList 0,0,'+QuotedStr(User)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(LokasiArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      LokasiArr[IntCount][1]:=Qry.FieldValues['company_id'];
      LokasiArr[IntCount][2]:=Qry.FieldValues['location_id'];
      LokasiArr[IntCount][3]:=Qry.FieldValues['location_code'];
      LokasiArr[IntCount][4]:=Qry.FieldValues['location_code']+' - '+Qry.FieldValues['location'];
      Lokasi.Items.Add(LokasiArr[IntCount][4]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    GroupJenis.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_jenis WHERE status=1 ORDER BY nama;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(JenisArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      JenisArr[IntCount][0]:=Qry.FieldValues['jenis_id'];
      JenisArr[IntCount][1]:=Qry.FieldValues['nama'];
      GroupJenis.Items.Add(JenisArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    GroupUser.Items.Clear;
    StrQry:='SELECT * FROM wh_department WHERE active=1 ORDER BY name;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(DepartmentArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      GroupUser.Items.Add(DepartmentArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    Merk.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_merk WHERE status=1 ORDER BY nama;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MerkArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MerkArr[IntCount][0]:=Qry.FieldValues['merk_id'];
      MerkArr[IntCount][1]:=Qry.FieldValues['nama'];
      Merk.Items.Add(MerkArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    SandiBi.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_sandi_bi WHERE status=1 ORDER BY kode;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SandiBiArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SandiBiArr[IntCount][0]:=Qry.FieldValues['sandi_bi_id'];
      SandiBiArr[IntCount][1]:=Qry.FieldValues['kode']+' - '+Qry.FieldValues['nama'];
      SandiBi.Items.Add(SandiBiArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    Memory.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_memory WHERE status=1 ORDER BY memory;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MemoryArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MemoryArr[IntCount][0]:=Qry.FieldValues['memory_id'];
      MemoryArr[IntCount][1]:=Qry.FieldValues['memory'];
      Memory.Items.Add(MemoryArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    Storage.Items.Clear;
    StrQry:='SELECT * FROM wh_inv_storage WHERE status=1 ORDER BY storage;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(StorageArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StorageArr[IntCount][0]:=Qry.FieldValues['storage_id'];
      StorageArr[IntCount][1]:=Qry.FieldValues['storage'];
      Storage.Items.Add(StorageArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    UserPengguna.Items.Clear;
    StrQry:='SELECT username,name FROM wh_user WHERE active=1 ORDER BY name;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(UserArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      UserArr[IntCount][0]:=Qry.FieldValues['username'];
      UserArr[IntCount][1]:=Qry.FieldValues['name'];
      UserPengguna.Items.Add(UserArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TInventarisForm.RefreshSubJenisCombo(StrJenisId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  GroupSubJenis.Items.Clear;
  SetLength(SubJenisArr,0);
  if Trim(StrJenisId)='' then Exit;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_subjenis WHERE status=1 AND jenis_id='+StrJenisId+' ORDER BY nama;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SubJenisArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SubJenisArr[IntCount][0]:=Qry.FieldValues['subjenis_id'];
      SubJenisArr[IntCount][1]:=Qry.FieldValues['nama'];
      GroupSubJenis.Items.Add(SubJenisArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TInventarisForm.RefreshTypeCombo(StrMerkId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  TypeModel.Items.Clear;
  SetLength(TypeArr,0);
  if Trim(StrMerkId)='' then Exit;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_type WHERE status=1 AND merk_id='+StrMerkId+' ORDER BY kode;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(TypeArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      TypeArr[IntCount][0]:=Qry.FieldValues['type_id'];
      if Trim(VarToStr(Qry.FieldValues['nama']))<>'' then
        TypeArr[IntCount][1]:=Qry.FieldValues['kode']+' - '+Qry.FieldValues['nama']
      else
        TypeArr[IntCount][1]:=Qry.FieldValues['kode'];
      TypeModel.Items.Add(TypeArr[IntCount][1]);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TInventarisForm.GroupJenisChange(Sender: TObject);
begin
  GroupSubJenis.ItemIndex:=-1;
  if GroupJenis.ItemIndex<>-1 then
    RefreshSubJenisCombo(JenisArr[GroupJenis.ItemIndex][0])
  else
    RefreshSubJenisCombo('');
  RefreshKodeLabelPreview;
end;

procedure TInventarisForm.MerkChange(Sender: TObject);
begin
  TypeModel.ItemIndex:=-1;
  if Merk.ItemIndex<>-1 then
    RefreshTypeCombo(MerkArr[Merk.ItemIndex][0])
  else
    RefreshTypeCombo('');
end;

procedure TInventarisForm.LokasiChange(Sender: TObject);
begin
  RefreshKodeLabelPreview;
end;

procedure TInventarisForm.GroupSubJenisChange(Sender: TObject);
begin
  RefreshKodeLabelPreview;
end;

procedure TInventarisForm.GroupUserChange(Sender: TObject);
begin
  RefreshKodeLabelPreview;
end;

procedure TInventarisForm.TglPerolehanChange(Sender: TObject);
begin
  RefreshKodeLabelPreview;
end;

procedure TInventarisForm.RefreshKodeLabelPreview;
var Qry:TADOQuery;
    StrQry,StrLocationCode,StrJenisId,StrSubJenisId,StrDepartmentId:String;
    IntNextNum:Integer;
begin
  //Inventaris ID dan Kode Label Inventaris hanya boleh dibuat otomatis saat entry aset baru.
  //Saat edit, nilai yang sudah tersimpan (dan sudah dicetak/ditempel di fisik aset) tidak diubah lagi.
  if FormInventarisId<>'' then Exit;

  if Lokasi.ItemIndex=-1 then begin
    InventarisId.Text:='(otomatis)';
    KodeLabelInventaris.Text:='';
    Exit;
  end;
  StrLocationCode:=LokasiArr[Lokasi.ItemIndex][3];

  IntNextNum:=1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT ISNULL(MAX(CAST(RIGHT(inventaris_id,6) AS INT)),0) AS max_num FROM wh_inventaris '+
            'WHERE LEFT(inventaris_id,'+IntToStr(Length(StrLocationCode)+1)+')='+QuotedStr(StrLocationCode+'.')+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntNextNum:=Qry.FieldValues['max_num']+1;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);

  InventarisId.Text:=StrLocationCode+'.'+Format('%.*d',[6,IntNextNum]);

  //Segmen Jenis/SubJenis/Group User ditampilkan progresif - yang belum dipilih dibiarkan kosong,
  //tidak perlu menunggu ketiganya lengkap.
  if GroupJenis.ItemIndex<>-1 then StrJenisId:=Format('%.*d',[3,StrToIntDef(JenisArr[GroupJenis.ItemIndex][0],0)])
  else StrJenisId:='';
  if GroupSubJenis.ItemIndex<>-1 then StrSubJenisId:=Format('%.*d',[3,StrToIntDef(SubJenisArr[GroupSubJenis.ItemIndex][0],0)])
  else StrSubJenisId:='';
  if GroupUser.ItemIndex<>-1 then StrDepartmentId:=Format('%.*d',[3,StrToIntDef(DepartmentArr[GroupUser.ItemIndex][0],0)])
  else StrDepartmentId:='';

  KodeLabelInventaris.Text:=StrLocationCode+'/'+StrJenisId+'-'+StrSubJenisId+'-'+StrDepartmentId+'/'+
    FormatDateTime('mmyy',TglPerolehan.Date)+'/'+
    Copy(Format('%.*d',[6,IntNextNum]),3,4);
end;

procedure TInventarisForm.NilaiPerolehanExit(Sender: TObject);
var DblNilai:Double;
begin
  ThousandSeparator:='.';
  DecimalSeparator:=',';
  DblNilai:=StrToFloatDef(StringReplace(Trim(NilaiPerolehan.Text),'.','',[rfReplaceAll]),0);
  NilaiPerolehan.Text:=FormatFloat('#,##0',DblNilai);
end;

procedure TInventarisForm.Init;
begin
  KodeIntegrasi.ItemIndex:=-1;
  Lokasi.ItemIndex:=-1;
  InventarisId.Text:='(otomatis)';
  DeskripsiRingkas.Text:='';
  TglPerolehan.Date:=Now;
  TglValuta.Date:=Now;
  KodeLabelInventaris.Text:='(otomatis)';
  NilaiPerolehan.Text:='0';
  UsiaPemakaian.Text:='0';
  GroupJenis.ItemIndex:=-1;
  GroupSubJenis.Items.Clear;
  GroupUser.ItemIndex:=-1;
  Merk.ItemIndex:=-1;
  TypeModel.Items.Clear;
  SandiBi.ItemIndex:=-1;
  SerialNumber.Text:='';
  Memory.ItemIndex:=-1;
  Storage.ItemIndex:=-1;
  UserPengguna.ItemIndex:=-1;
  Aktif.Checked:=True;
  Keterangan.Text:='';
end;

procedure TInventarisForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrKodeIntegrasiId,StrCompanyId,StrLocationId,StrJenisId,StrSubJenisId,StrDepartmentId:String;
    StrMerkId,StrTypeId,StrSandiBiId,StrMemoryId,StrStorageId,StrUserId:String;
    VarTglPerolehan,VarTglValuta:Variant;
    IsNullTglPerolehan,IsNullTglValuta,IsAktif:Boolean;
begin
  //Semua nilai field dibaca ke variabel lokal dulu selagi koneksi masih terbuka.
  //Jangan panggil Main.OpenDb/CloseDb lain (mis. RefreshSubJenisCombo/RefreshTypeCombo)
  //selagi Qry ini masih dipakai - Main.CloseDb menutup MyConnection yang dipakai bersama,
  //sehingga field pada Qry ini jadi tidak valid ("Field 'xxx' not found").
  IsNullTglPerolehan:=True;
  IsNullTglValuta:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inventaris WHERE inventaris_id='+QuotedStr(FormInventarisId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      InventarisId.Text:=Qry.FieldValues['inventaris_id'];
      StrKodeIntegrasiId:=VarToStr(Qry.FieldValues['kode_integrasi_id']);
      StrCompanyId:=VarToStr(Qry.FieldValues['company_id']);
      StrLocationId:=VarToStr(Qry.FieldValues['location_id']);
      DeskripsiRingkas.Text:=Qry.FieldValues['deskripsi_ringkas'];
      IsNullTglPerolehan:=VarIsNull(Qry.FieldValues['tanggal_perolehan']);
      if Not(IsNullTglPerolehan) then VarTglPerolehan:=Qry.FieldValues['tanggal_perolehan'];
      IsNullTglValuta:=VarIsNull(Qry.FieldValues['tanggal_valuta']);
      if Not(IsNullTglValuta) then VarTglValuta:=Qry.FieldValues['tanggal_valuta'];
      KodeLabelInventaris.Text:=VarToStr(Qry.FieldValues['kode_label_inventaris']);
      ThousandSeparator:='.';
      DecimalSeparator:=',';
      NilaiPerolehan.Text:=FormatFloat('#,##0',StrToFloatDef(VarToStr(Qry.FieldValues['nilai_perolehan']),0));
      UsiaPemakaian.Text:=VarToStr(Qry.FieldValues['usia_pemakaian']);
      StrJenisId:=VarToStr(Qry.FieldValues['jenis_id']);
      StrSubJenisId:=VarToStr(Qry.FieldValues['subjenis_id']);
      StrDepartmentId:=VarToStr(Qry.FieldValues['department_id']);
      StrMerkId:=VarToStr(Qry.FieldValues['merk_id']);
      StrTypeId:=VarToStr(Qry.FieldValues['type_id']);
      StrSandiBiId:=VarToStr(Qry.FieldValues['sandi_bi_id']);
      SerialNumber.Text:=VarToStr(Qry.FieldValues['serial_number']);
      StrMemoryId:=VarToStr(Qry.FieldValues['memory_id']);
      StrStorageId:=VarToStr(Qry.FieldValues['storage_id']);
      StrUserId:=VarToStr(Qry.FieldValues['user_id']);
      IsAktif:=(Qry.FieldValues['status_aktif']=1);
      Keterangan.Text:=VarToStr(Qry.FieldValues['keterangan']);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);

  if Not(IsNullTglPerolehan) then TglPerolehan.Date:=VarTglPerolehan else TglPerolehan.Date:=Now;
  if Not(IsNullTglValuta) then TglValuta.Date:=VarTglValuta else TglValuta.Date:=Now;
  Aktif.Checked:=IsAktif;

  KodeIntegrasi.ItemIndex:=-1;
  for IntCount:=0 to Length(KIArr)-1 do
    if KIArr[IntCount][0]=StrKodeIntegrasiId then KodeIntegrasi.ItemIndex:=IntCount;

  Lokasi.ItemIndex:=-1;
  for IntCount:=0 to Length(LokasiArr)-1 do
    if (LokasiArr[IntCount][1]=StrCompanyId) and (LokasiArr[IntCount][2]=StrLocationId) then
      Lokasi.ItemIndex:=IntCount;

  GroupJenis.ItemIndex:=-1;
  for IntCount:=0 to Length(JenisArr)-1 do
    if JenisArr[IntCount][0]=StrJenisId then GroupJenis.ItemIndex:=IntCount;
  if GroupJenis.ItemIndex<>-1 then RefreshSubJenisCombo(JenisArr[GroupJenis.ItemIndex][0])
  else RefreshSubJenisCombo('');
  GroupSubJenis.ItemIndex:=-1;
  for IntCount:=0 to Length(SubJenisArr)-1 do
    if SubJenisArr[IntCount][0]=StrSubJenisId then GroupSubJenis.ItemIndex:=IntCount;

  GroupUser.ItemIndex:=-1;
  for IntCount:=0 to Length(DepartmentArr)-1 do
    if DepartmentArr[IntCount][0]=StrDepartmentId then GroupUser.ItemIndex:=IntCount;

  Merk.ItemIndex:=-1;
  for IntCount:=0 to Length(MerkArr)-1 do
    if MerkArr[IntCount][0]=StrMerkId then Merk.ItemIndex:=IntCount;
  if Merk.ItemIndex<>-1 then RefreshTypeCombo(MerkArr[Merk.ItemIndex][0])
  else RefreshTypeCombo('');
  TypeModel.ItemIndex:=-1;
  for IntCount:=0 to Length(TypeArr)-1 do
    if TypeArr[IntCount][0]=StrTypeId then TypeModel.ItemIndex:=IntCount;

  SandiBi.ItemIndex:=-1;
  for IntCount:=0 to Length(SandiBiArr)-1 do
    if SandiBiArr[IntCount][0]=StrSandiBiId then SandiBi.ItemIndex:=IntCount;

  Memory.ItemIndex:=-1;
  for IntCount:=0 to Length(MemoryArr)-1 do
    if MemoryArr[IntCount][0]=StrMemoryId then Memory.ItemIndex:=IntCount;

  Storage.ItemIndex:=-1;
  for IntCount:=0 to Length(StorageArr)-1 do
    if StorageArr[IntCount][0]=StrStorageId then Storage.ItemIndex:=IntCount;

  UserPengguna.ItemIndex:=-1;
  for IntCount:=0 to Length(UserArr)-1 do
    if UserArr[IntCount][0]=StrUserId then UserPengguna.ItemIndex:=IntCount;
end;

procedure TInventarisForm.FormShow(Sender: TObject);
begin
  Init;
  if FormInventarisId='' then LabelCaption.Caption:='Entry Data Master Inventaris'
  else LabelCaption.Caption:='Koreksi Data Master Inventaris';
  RefreshCombo;
  if FormInventarisId<>'' then LoadData;
  KodeIntegrasi.SetFocus;
end;

procedure TInventarisForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TInventarisForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive,StrNewId,StrLocationCode:String;
    StrKiId,StrCompanyId,StrLocationId,StrJenisId,StrSubJenisId,StrDepartmentId:String;
    StrMerkId,StrTypeId,StrSandiBiId,StrMemoryId,StrStorageId,StrUserId:String;
    StrTglPerolehan,StrTglValuta,StrKodeLabel,StrKeterangan,StrAutoLabel:String;
    StrLabelJenis,StrLabelSubJenis,StrLabelDept:String;
    DblNilai:Double;
    IntUsia,IntNextNum:Integer;
    IsOk:Boolean;
begin
  if (KodeIntegrasi.ItemIndex=-1) or (Lokasi.ItemIndex=-1) or (Trim(DeskripsiRingkas.Text)='') then begin
    MessageBox(0,'Silahkan lengkapi Kode Integrasi, Lokasi, dan Deskripsi Ringkas','Data Aset Inventaris',MB_OK or MB_ICONWARNING);
    Exit;
  end;

  IsOk:=True;
  StrEMsg:='';
  StrKiId:=KIArr[KodeIntegrasi.ItemIndex][0];
  StrCompanyId:=LokasiArr[Lokasi.ItemIndex][1];
  StrLocationId:=LokasiArr[Lokasi.ItemIndex][2];
  StrLocationCode:=LokasiArr[Lokasi.ItemIndex][3];
  if GroupJenis.ItemIndex<>-1 then StrJenisId:=JenisArr[GroupJenis.ItemIndex][0] else StrJenisId:='NULL';
  if GroupSubJenis.ItemIndex<>-1 then StrSubJenisId:=SubJenisArr[GroupSubJenis.ItemIndex][0] else StrSubJenisId:='NULL';
  if GroupUser.ItemIndex<>-1 then StrDepartmentId:=DepartmentArr[GroupUser.ItemIndex][0] else StrDepartmentId:='NULL';
  if Merk.ItemIndex<>-1 then StrMerkId:=MerkArr[Merk.ItemIndex][0] else StrMerkId:='NULL';
  if TypeModel.ItemIndex<>-1 then StrTypeId:=TypeArr[TypeModel.ItemIndex][0] else StrTypeId:='NULL';
  if SandiBi.ItemIndex<>-1 then StrSandiBiId:=SandiBiArr[SandiBi.ItemIndex][0] else StrSandiBiId:='NULL';
  if Memory.ItemIndex<>-1 then StrMemoryId:=MemoryArr[Memory.ItemIndex][0] else StrMemoryId:='NULL';
  if Storage.ItemIndex<>-1 then StrStorageId:=StorageArr[Storage.ItemIndex][0] else StrStorageId:='NULL';
  if UserPengguna.ItemIndex<>-1 then StrUserId:=QuotedStr(UserArr[UserPengguna.ItemIndex][0]) else StrUserId:='NULL';

  StrTglPerolehan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerolehan.Date));
  StrTglValuta:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglValuta.Date));
  if Trim(KodeLabelInventaris.Text)='' then StrKodeLabel:='NULL' else StrKodeLabel:=QuotedStr(Trim(KodeLabelInventaris.Text));
  if Trim(Keterangan.Text)='' then StrKeterangan:='NULL' else StrKeterangan:=QuotedStr(Trim(Keterangan.Text));

  ThousandSeparator:='.';
  DecimalSeparator:=',';
  DblNilai:=StrToFloatDef(StringReplace(Trim(NilaiPerolehan.Text),'.','',[rfReplaceAll]),0);
  DecimalSeparator:='.';
  IntUsia:=StrToIntDef(Trim(UsiaPemakaian.Text),0);
  if Aktif.Checked then StrActive:='1' else StrActive:='0';

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    if FormInventarisId='' then begin
      StrQry:='SELECT ISNULL(MAX(CAST(RIGHT(inventaris_id,6) AS INT)),0) AS max_num FROM wh_inventaris '+
              'WHERE LEFT(inventaris_id,'+IntToStr(Length(StrLocationCode)+1)+')='+QuotedStr(StrLocationCode+'.')+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntNextNum:=Qry.FieldValues['max_num']+1;
      Qry.Close;
      StrNewId:=StrLocationCode+'.'+Format('%.*d',[6,IntNextNum]);

      //Kode Label Inventaris: {kode_kantor}/{jenis-subjenis-groupuser 3 digit}/{MMYY tgl perolehan}/{4 digit terakhir nomor urut Inventaris ID}
      //Field ini disabled (full otomatis), jadi selalu dihitung ulang di sini memakai StrNewId final -
      //preview yang tampil sebelum Simpan (RefreshKodeLabelPreview) bisa saja beda kalau ada aset lain
      //yang tersimpan duluan, jadi nilai final di sini yang jadi acuan. Segmen Jenis/SubJenis/Group User
      //yang belum dipilih dibiarkan kosong (tidak wajib lengkap).
      if StrJenisId<>'NULL' then StrLabelJenis:=Format('%.*d',[3,StrToIntDef(StrJenisId,0)]) else StrLabelJenis:='';
      if StrSubJenisId<>'NULL' then StrLabelSubJenis:=Format('%.*d',[3,StrToIntDef(StrSubJenisId,0)]) else StrLabelSubJenis:='';
      if StrDepartmentId<>'NULL' then StrLabelDept:=Format('%.*d',[3,StrToIntDef(StrDepartmentId,0)]) else StrLabelDept:='';
      StrAutoLabel:=StrLocationCode+'/'+StrLabelJenis+'-'+StrLabelSubJenis+'-'+StrLabelDept+'/'+
        FormatDateTime('mmyy',TglPerolehan.Date)+'/'+
        Copy(StrNewId,Length(StrNewId)-3,4);
      KodeLabelInventaris.Text:=StrAutoLabel;
      StrKodeLabel:=QuotedStr(StrAutoLabel);

      StrQry:='INSERT INTO wh_inventaris (inventaris_id,company_id,location_id,department_id,kode_integrasi_id,'+
              'jenis_id,subjenis_id,merk_id,type_id,sandi_bi_id,serial_number,memory_id,storage_id,'+
              'deskripsi_ringkas,tanggal_perolehan,tanggal_valuta,kode_label_inventaris,nilai_perolehan,'+
              'usia_pemakaian,keterangan,status_aktif,user_id,status,create_date,create_user,update_time,update_user) VALUES ('+
              QuotedStr(StrNewId)+','+StrCompanyId+','+StrLocationId+','+StrDepartmentId+','+StrKiId+','+
              StrJenisId+','+StrSubJenisId+','+StrMerkId+','+StrTypeId+','+StrSandiBiId+','+QuotedStr(Trim(SerialNumber.Text))+','+
              StrMemoryId+','+StrStorageId+','+
              QuotedStr(Trim(DeskripsiRingkas.Text))+','+StrTglPerolehan+','+StrTglValuta+','+StrKodeLabel+','+
              FloatToStr(DblNilai)+','+IntToStr(IntUsia)+','+StrKeterangan+','+StrActive+','+StrUserId+',1,'+
              'GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
    end else begin
      StrQry:='UPDATE wh_inventaris SET company_id='+StrCompanyId+',location_id='+StrLocationId+
              ',department_id='+StrDepartmentId+',kode_integrasi_id='+StrKiId+
              ',jenis_id='+StrJenisId+',subjenis_id='+StrSubJenisId+',merk_id='+StrMerkId+
              ',type_id='+StrTypeId+',sandi_bi_id='+StrSandiBiId+',serial_number='+QuotedStr(Trim(SerialNumber.Text))+
              ',memory_id='+StrMemoryId+',storage_id='+StrStorageId+
              ',deskripsi_ringkas='+QuotedStr(Trim(DeskripsiRingkas.Text))+',tanggal_perolehan='+StrTglPerolehan+
              ',tanggal_valuta='+StrTglValuta+',kode_label_inventaris='+StrKodeLabel+
              ',nilai_perolehan='+FloatToStr(DblNilai)+',usia_pemakaian='+IntToStr(IntUsia)+
              ',keterangan='+StrKeterangan+',status_aktif='+StrActive+',user_id='+StrUserId+
              ',update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE inventaris_id='+QuotedStr(FormInventarisId)+';';
    end;
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
    if IsOk then begin
      Main.TransCommit;
      MessageBox(0,'Berhasil disimpan','Data Aset Inventaris',MB_OK or MB_ICONINFORMATION);
      if Main.IsFormOpen('InventarisList') then begin
        InventarisList.LoadData;
        InventarisList.RefreshList;
      end;
      Close;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Data Aset Inventaris',MB_OK or MB_ICONERROR);
    end;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

end.
