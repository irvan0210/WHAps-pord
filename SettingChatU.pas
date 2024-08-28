unit SettingChatU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, Mask, ExtCtrls;

type
  TSettingChat = class(TForm)
    Simpan: TButton;
    Batal: TButton;
    Cek: TButton;
    Label6: TLabel;
    ChatHost: TEdit;
    Label7: TLabel;
    ChatPorts: TEdit;
    AutoConnect: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CekClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure ChatHostKeyPress(Sender: TObject; var Key: Char);
    procedure ChatPortsKeyPress(Sender: TObject; var Key: Char);
    procedure AutoConnectKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  SettingChat: TSettingChat;

implementation

{$R *.dfm}

Uses MainU,WHUnit;

constructor TSettingChat.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: Setting',1);
  Inherited Create(AOwner);
end;

procedure TSettingChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSettingChat.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TSettingChat.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TSettingChat.Init;
begin
  Simpan.Enabled:=False;
  ChatHost.Text:=Main.ChatHost;
  ChatPorts.Text:=Main.ChatPort;
  if Main.IsChatAutoStart='1' then AutoConnect.Checked:=True else AutoConnect.Checked:=False; ;
end;

procedure TSettingChat.CekClick(Sender: TObject);
var
  StrMsg:String;
  IsAvail,IsOk:Boolean;
begin
  StrMsg:='';
  if (Trim(ChatHost.Text)<>'') and (Trim(ChatPorts.Text)<>'') then begin
    IsAvail:=True;
    IsOk:=True;
    if AutoConnect.Checked=True then Main.IsChatAutoStart:='1' else Main.IsChatAutoStart:='0';
    Main.M_Busy;
    Main.WriteLog('Port Check');
    StrMsg:='';
    if IsPortOpened(ChatHost.Text,StrToInt(ChatPorts.Text)) then begin
      Main.WriteLog('Check Chat Server Success');
      StrMsg:=StrMsg+Chr(13)+'Koneksi Chat Server Ok';
    end else begin
      IsOk:=False;
      StrMsg:=StrMsg+Chr(13)+'Chat Server Belum Siap';
    end;
    Main.M_Normal;
    if StrMsg<>'' then
      if IsOk then begin
        StrMsg:=StrMsg+Chr(13)+'Silahkan Simpan Koneksi';
        MessageBox(0,PChar(StrMsg),'Setting Chat',MB_OK or MB_ICONINFORMATION);
        Simpan.Enabled:=True;
        Cek.Enabled:=False;
        Simpan.SetFocus;
      end else begin
        StrMsg:=StrMsg+Chr(13)+'Periksa Kembali Settingan';
        MessageBox(0,PChar(StrMsg),'Setting Chat',MB_OK or MB_ICONERROR);
      end;
  end else begin
    if (Trim(ChatHost.Text)='') then StrMsg:='Host tidak boleh kosong';
    if (Trim(ChatPorts.Text)='') then StrMsg:=StrMsg+Chr(13)+'Port tidak boleh kosong';
    MessageBox(0,PChar(StrMsg),'Setting Chat',MB_OK or MB_ICONERROR);
  end;

end;

procedure TSettingChat.SimpanClick(Sender: TObject);
var
  Regs:TRegistry;
  StrMsg:String;
  RegChatHost,RegChatPort,RegChatAutoStart:String;
begin
  StrMsg:='';
  if (Trim(ChatHost.Text)<>'') and (Trim(ChatPorts.Text)<>'') then begin
    if AutoConnect.Checked then RegChatAutoStart:='1' else RegChatAutoStart:='0';
    RegChatHost:=ChatHost.Text;
    RegChatPort:=ChatPorts.Text;
    try
      Main.WriteLog('Registry Write: '+RegChatHost+','+RegChatPort+','+RegChatAutoStart,1);
      Regs:=TRegistry.Create;
      Regs.RootKey:=HKEY_LOCAL_MACHINE;
      try
        if Regs.OpenKey(RegPath,True) then begin
          Regs.WriteString('ChatAutoStart',RegChatAutoStart);
          Regs.WriteString('ChatHost',RegChatHost);
          Regs.WriteString('ChatPort',RegChatPort);
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
    MessageBox(0,PChar(StrMsg),'Setting Chat',MB_OK or MB_ICONINFORMATION);
    if Logged then Main.LogOut;
    Close;
  end;
end;

procedure TSettingChat.ChatHostKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ChatPorts.SetFocus;
  if Key = #27 then Close;
end;

procedure TSettingChat.ChatPortsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Cek.SetFocus;
  if Key = #27 then Close;
end;

procedure TSettingChat.AutoConnectKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ChatHost.SetFocus;
  if Key = #27 then Close;
end;

end.
