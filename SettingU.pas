unit SettingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, Mask, ExtCtrls;

type
  TSetting = class(TForm)
    Label1: TLabel;
    Username: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Simpan: TButton;
    Batal: TButton;
    Database: TEdit;
    Label4: TLabel;
    Host: TEdit;
    Password: TMaskEdit;
    Cek: TButton;
    Label5: TLabel;
    Provider: TEdit;
    ChangeProvider: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CekClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure HostKeyPress(Sender: TObject; var Key: Char);
    procedure DatabaseKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure ChangeProviderClick(Sender: TObject);
    procedure LogLevelsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  Setting: TSetting;

implementation

{$R *.dfm}

Uses MainU,WHUnit;

constructor TSetting.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: Setting',1);
  Inherited Create(AOwner);
end;

procedure TSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSetting.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TSetting.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TSetting.Init;
begin
  //MessageBox(0,PChar(Main.DbName),'Setting',MB_OK or MB_ICONINFORMATION);
  Simpan.Enabled:=False;
  Host.Text:=Main.DbHost;
  Database.Text:=Main.Db;
  Username.Text:=Main.DbUser;
  Password.Text:=Main.DbPass;
  Provider.Text:=Main.Provider;
  ChangeProvider.Checked:=True;
  Provider.Enabled:=False;
end;

procedure TSetting.CekClick(Sender: TObject);
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

procedure TSetting.SimpanClick(Sender: TObject);
var
  Regs:TRegistry;
  StrMsg:String;
  RegHost,RegDb,RegUser,RegPass,RegProvider,RegLogLevel,RegChatHost,RegChatPort:String;
begin
  StrMsg:='';
  if (Trim(Host.Text)<>'') and (Trim(Database.Text)<>'') and (Trim(Username.Text)<>'') then begin
    RegHost:=Host.Text;
    RegDb:=Database.Text;
    RegUser:=Username.Text;
    RegPass:=Password.Text;
    RegProvider:=Provider.Text;
    try
      Main.WriteLog('Registry Write: '+RegHost+','+RegDb+','+RegUser+','+RegProvider,1);
      Regs:=TRegistry.Create;
      Regs.RootKey:=HKEY_LOCAL_MACHINE;
      try
        if Regs.OpenKey(RegPath,True) then begin
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
      FreeAndNil(Regs)
    end;
    Main.InitReg;
    StrMsg:='Setting Telah Tersimpan';
    if Logged then StrMsg:=StrMsg+Chr(13)+'Silahkan Login Kembali';
    MessageBox(0,PChar(StrMsg),'Setting',MB_OK or MB_ICONINFORMATION);
    if Logged then Main.LogOut;
    Close;
  end;
end;

procedure TSetting.HostKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Database.SetFocus;
  if Key = #27 then Setting.Close;
end;

procedure TSetting.DatabaseKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Username.SetFocus;
  if Key = #27 then Setting.Close;
end;

procedure TSetting.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Password.SetFocus;
  if Key = #27 then Setting.Close;
end;

procedure TSetting.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Provider.Enabled then Provider.SetFocus
  else Cek.SetFocus;
  if Key = #27 then Setting.Close;
end;

procedure TSetting.ChangeProviderClick(Sender: TObject);
begin
  if ChangeProvider.Checked=True then Provider.Enabled:=False
  else Provider.Enabled:=True;
end;

procedure TSetting.LogLevelsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Cek.SetFocus;
  if Key = #27 then Setting.Close;
end;

end.
