unit KoneksiDatabaseU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,IniFiles,Registry;

type
  TKoneksiDatabase = class(TForm)
    Cek: TButton;
    Simpan: TButton;
    Button2: TButton;
    cmbName: TComboBox;
    Tambah: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Host: TEdit;
    Database: TEdit;
    Username: TEdit;
    Password: TMaskEdit;
    Provider: TEdit;
    Name: TEdit;
    Label7: TLabel;
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure cmbNameChange(Sender: TObject);
    procedure TambahClick(Sender: TObject);
    procedure CekClick(Sender: TObject);
    procedure NameChange(Sender: TObject);
  private
    { Private declarations }
    FOldConnectionName: string;
    //Function Encrypt(const Text, Key: string): string;
    //Function Decrypt(const Text, Key: string): string;
    Function IniPath: string;
    procedure LoadConnectionNames;
    procedure Init;
    procedure LoadConnectionDetail;
  public
    { Public declarations }
  end;

var
  KoneksiDatabase: TKoneksiDatabase;

implementation

uses MainU, WHUnit;

{$R *.dfm}

function DecryptFromHex(const HexText, Key: string): string;
var
  i, v: Integer;
begin
  Result := '';
  i := 1;
  while i < Length(HexText) do
  begin
    v := StrToInt('$' + Copy(HexText, i, 2));
    Result := Result +
      Chr(v xor Ord(Key[(Length(Result) mod Length(Key)) + 1]));
    Inc(i, 2);
  end;
end;

function EncryptToHex(const Text, Key: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Text) do
    Result := Result +
      IntToHex(
        Ord(Text[i]) xor Ord(Key[(i - 1) mod Length(Key) + 1]),
        2
      );
end;

Function TKoneksiDatabase.IniPath: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'dbconfig.ini';
end;

procedure TKoneksiDatabase.SimpanClick(Sender: TObject);
var
  Ini: TIniFile;
  NewName, StrMsg: string;
  Regs:TRegistry;
  RegName, RegHost,RegDb,RegUser,RegPass,RegProvider,RegLogLevel,RegChatHost,RegChatPort:String;
const
  ENC_KEY = 'DB-CONFIG-KEY';
begin
 NewName := Trim(Name.Text);
  if NewName = '' then
  begin
    ShowMessage('Name koneksi wajib diisi');
    Exit;
  end;

  StrMsg:='';
  Ini := TIniFile.Create(IniPath);
  if (Trim(Name.Text)<>'') and (Trim(Host.Text)<>'') and (Trim(Database.Text)<>'') and (Trim(Username.Text)<>'') then begin
    RegName:=Name.Text;
    RegHost:=Host.Text;
    RegDb:=Database.Text;
    RegUser:=Username.Text;
    RegPass:=Password.Text;
    RegProvider:=Provider.Text;
    try
      // Jika rename koneksi
      if (FOldConnectionName <> '') and
         (FOldConnectionName <> NewName) then
      begin
        Ini.EraseSection(FOldConnectionName);
        if cmbName.Items.IndexOf(FOldConnectionName) <> -1 then
          cmbName.Items.Delete(cmbName.Items.IndexOf(FOldConnectionName));
      end;

      // Update / simpan data
      Ini.WriteString(NewName, 'Name', Name.Text);
      Ini.WriteString(NewName, 'Host', Host.Text);
      Ini.WriteString(NewName, 'Database', Database.Text);
      Ini.WriteString(NewName, 'Username', Username.Text);
      Ini.WriteString(NewName, 'Password', EncryptToHex(Password.Text, ENC_KEY));
      Ini.WriteString(NewName, 'Provider', Provider.Text);

      Main.WriteLog('Registry Write: '+RegName+','+RegHost+','+RegDb+','+RegUser+','+RegProvider,1);
      Regs:=TRegistry.Create;
      Regs.RootKey:=HKEY_LOCAL_MACHINE;
      try
        if Regs.OpenKey(RegPath,True) then begin
          Regs.WriteString('Name',RegName);
          Regs.WriteString('Host',RegHost);
          Regs.WriteString('Db',Encrypt(RegDb,3));
          Regs.WriteString('Username',Encrypt(RegUser,4));
          Regs.WriteString('Password',Encrypt(RegPass,5));
          Regs.WriteString('Provider',RegProvider);
        end;

      except
        on E:Exception do begin
          Main.WriteLog('Registry Save:Fail'+E.Message,1); 
        end;
      end;
    finally
      Regs.CloseKey;
      FreeAndNil(Regs);
      Ini.Free;
    end;

    // Update ComboBox
    if cmbName.Items.IndexOf(NewName) = -1 then
      cmbName.Items.Add(NewName);

    cmbName.ItemIndex := cmbName.Items.IndexOf(NewName);
    FOldConnectionName := NewName;

    Main.InitReg;
    StrMsg:='Setting Telah Tersimpan';
    Init;
    if Logged then StrMsg:=StrMsg+Chr(13)+'Silahkan Login Kembali';
    MessageBox(0,PChar(StrMsg),'Setting',MB_OK or MB_ICONINFORMATION);
    if Logged then Main.LogOut;
    Close;
  end;
end;

procedure TKoneksiDatabase.LoadConnectionNames;
var
  Ini: TIniFile;
  Sections: TStringList;
  i: Integer;
  StrDBName : string;
begin
  //StrDBName :=QuotedStr(Main.DbName);
  //MessageBox(0,PChar(StrDBName),'Setting',MB_OK or MB_ICONINFORMATION);
  cmbName.Clear;

  if not FileExists(IniPath) then Exit;

  Ini := TIniFile.Create(IniPath);
  Sections := TStringList.Create;
  try
    Ini.ReadSections(Sections);
    for i := 0 to Sections.Count - 1 do
    begin
      // skip section khusus
      if SameText(Sections[i], 'App') then
        Continue;
      cmbName.Items.Add(Sections[i]);
    end;
  finally
    Sections.Free;
    Ini.Free;
  end;

  // auto pilih item pertama
  if cmbName.Items.Count > 0 then
    cmbName.ItemIndex := cmbName.Items.IndexOf('DB PUBLIC');
end;


procedure TKoneksiDatabase.FormShow(Sender: TObject);
begin
  Init;
  LoadConnectionNames;
  cmbNameChange(Sender);
  if cmbName.ItemIndex <> -1 then Simpan.Enabled := False;
end;

procedure TKoneksiDatabase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TKoneksiDatabase.Init;
begin
  Simpan.Enabled:=False;
  Host.Text:='';
  Database.Text:='';
  Username.Text:='';
  Password.Text:='';
  Provider.Text:='';
  //ChangeProvider.Checked:=True;
  Name.Text:='';
end;

procedure TKoneksiDatabase.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TKoneksiDatabase.LoadConnectionDetail;
var
  Ini: TIniFile;
  Section: string;
const
  ENC_KEY = 'DB-CONFIG-KEY';
begin
  if cmbName.ItemIndex = -1 then Exit;

  Section := cmbName.Text;
  FOldConnectionName := Section; // SIMPAN NAME LAMA

  Ini := TIniFile.Create(IniPath);
  try
    Name.Text :=Ini.ReadString(Section, 'Name', '');
    Host.Text :=Ini.ReadString(Section, 'Host', '');
    Database.Text :=Ini.ReadString(Section, 'Database', '');
    Username.Text :=Ini.ReadString(Section, 'Username', '');
    Password.Text :=DecryptFromHex(Ini.ReadString(Section, 'Password', ''), ENC_KEY );
    Provider.Text := Ini.ReadString(Section, 'Provider', '');
  finally
    Ini.Free;
  end;
end;


procedure TKoneksiDatabase.cmbNameChange(Sender: TObject);
begin
  LoadConnectionDetail;
  Cek.Enabled := True;

end;

procedure TKoneksiDatabase.TambahClick(Sender: TObject);
begin
  Init;
  Name.Enabled := True;
  Name.SetFocus;
  cmbName.itemIndex :=-1;
end;

procedure TKoneksiDatabase.CekClick(Sender: TObject);
var
  StrMsg:String;
  IsAvail,IsOk:Boolean;
begin
  StrMsg:='';
  if (Trim(Host.Text)<>'') and (Trim(Database.Text)<>'') and (Trim(Username.Text)<>'') then begin
    IsAvail:=True;
    IsOk:=True;
    Main.DbHost:=Host.Text;
    Main.Db:=Database.Text;
    Main.DbUser:=Username.Text;
    Main.DbPass:=Password.Text;
    Main.Provider:=Provider.Text;
    Main.CloseDb;
    Main.InitDb;
    Main.M_Busy;
    Main.WriteLog('Port Check');
    StrMsg:='';
    if IsPortOpened(Host.Text,1433) then begin
      try
        Main.WriteLog('Connection Check');
        Main.MyConnection.Open;
      except
        on E:Exception do begin
          Main.WriteLog('Check Failed '+E.Message);
          IsAvail:=False;
          IsOk:=False;
          StrMsg:=StrMsg+Chr(13)+'Koneksi Tidak Berhasil, Pesan Error:'+Chr(13)+E.Message;
        end;
      end;
      if IsAvail then begin
        Main.WriteLog('Check Success');
        StrMsg:=StrMsg+Chr(13)+'Koneksi Server Database Sukses';
      end;
    end else begin
      StrMsg:=StrMsg+'Server Belum Siap';
    end;
    Main.M_Normal;
    if StrMsg<>'' then
      if IsOk then begin
        StrMsg:=StrMsg+Chr(13)+'Silahkan Simpan Koneksi';
        MessageBox(0,PChar(StrMsg),'Setting',MB_OK or MB_ICONINFORMATION);
        Simpan.Enabled:=True;
        Cek.Enabled:=False;
        Simpan.SetFocus;
      end else begin
        StrMsg:=StrMsg+Chr(13)+'Periksa Kembali Settingan';
        MessageBox(0,PChar(StrMsg),'Setting',MB_OK or MB_ICONERROR);
      end;
  end else begin
    if (Trim(Host.Text)='') then StrMsg:='Host tidak boleh kosong';
    if (Trim(Database.Text)='') then StrMsg:=StrMsg+Chr(13)+'Database tidak boleh kosong';
    if (Trim(Username.Text)='') then StrMsg:=StrMsg+Chr(13)+'Username tidak boleh kosong';
    MessageBox(0,PChar(StrMsg),'Setting',MB_OK or MB_ICONERROR);
  end;

end;

procedure TKoneksiDatabase.NameChange(Sender: TObject);
begin
  if cmbName.ItemIndex <> -1 then Simpan.Enabled := False
  else Simpan.Enabled := True;
end;

end.
