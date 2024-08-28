unit ChatClientU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdSync,
  Buttons, StdCtrls, ExtCtrls;

type
  TReadingThread = class(TThread)
  protected
    TCPConn: TIdTCPConnection;
  procedure Execute; override;
  public
    constructor Create(AConn: TIdTCPConnection); reintroduce;
  end;

  TStartThread = class(TThread)
  protected
    TCPConn: TIdTCPConnection;
  procedure Execute; override;
  public
    constructor Create(AConn: TIdTCPConnection); reintroduce;
  end;

  TLog = class(TIdSync)
  protected
    StrMsg: String;
  procedure DoSynchronize; override;
  public
  constructor Create(const AMsg: String);
    class procedure AddMsg(const AMsg: String);
  end;

  TChatClient = class(TForm)
    Client: TIdTCPClient;
    ClientList: TListBox;
    Pesan: TMemo;
    MessageB: TEdit;
    SendMessage: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StartTimer: TTimer;
    Broadcast: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ClientConnected(Sender: TObject);
    procedure ClientDisconnected(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure SendMessageClick(Sender: TObject);
    procedure MessageBKeyPress(Sender: TObject; var Key: Char);
    procedure BroadcastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IntConnectTry:Integer;
    Initiation:Boolean;
    procedure Connect;
    procedure Disconnect;
    procedure AddStatusLine(Str_Message:String);
    procedure AddMessageLine(Str_Message:String);
    procedure AddLine(Str_Message:String;Information_Type:Integer=2);
  end;

var
  ChatClient: TChatClient;
  TCPThread:TReadingThread;
  StartThread:TStartThread;

implementation

{$R *.dfm}

uses WHUnit,MainU;

constructor TReadingThread.Create(AConn: TIdTCPConnection);
begin
  TCPConn := AConn;
  inherited Create(False);
end;

procedure TReadingThread.Execute;
begin
  while not Terminated and TCPConn.Connected do begin
    try
      TLog.AddMsg(TCPConn.ReadLn);
    except
    end;
  end;
end;

constructor TLog.Create(const AMsg: String);
begin
  StrMsg:=AMsg;
  inherited Create;
end;

procedure TLog.DoSynchronize;
var StrPos:integer;
    StrFunc:string;
    FStream,fstream2: TFileStream;
    MStream: TMemoryStream;
begin
  StrPos:=Pos('@##',StrMsg);
  StrFunc:=Copy(StrMsg,1,StrPos-1);
  StrMsg:=Copy(StrMsg,StrPos+3,Length(StrMsg));
  Case CaseStr(StrFunc,['0','1','2','3']) of
    0:begin
        StrPos:=Pos('@##',StrMsg);
        StrFunc:=Copy(StrMsg,1,StrPos-1);
        StrMsg:=Copy(StrMsg,StrPos+3,Length(StrMsg));
        ChatClient.AddMessageLine(StrFunc+'>'+StrMsg);
      end;
    1:begin
        StrMsg:='1@##'+FullName;
        ChatClient.Client.WriteLn(StrMsg);
      end;
    2:begin
        ChatClient.ClientList.Clear;
        repeat
          StrPos:=Pos('@##',StrMsg);
          StrFunc:=Copy(StrMsg,1,StrPos-1);
          ChatClient.ClientList.Items.Add(StrFunc);
          StrMsg:=Copy(StrMsg,StrPos+3,Length(StrMsg));
        until Length(StrMsg)<1;
      end;
    3:begin
      end;
  end;
end;

class procedure TLog.AddMsg(const AMsg: String);
begin
  with Create(AMsg) do try
    Synchronize;
  finally
    Free;
  end;
end;

constructor TStartThread.Create(AConn: TIdTCPConnection);
begin
  TCPConn := AConn;
  inherited Create(False);
end;

procedure TStartThread.Execute;
begin
  while not(TCPConn.Connected) and (ChatClient.IntConnectTry<3) do begin
    try
      ChatClient.Connect;
      Inc(ChatClient.IntConnectTry);
      Sleep(5000);
    except
    end;
  end;
end;

procedure TChatClient.Connect;
var StrMsg:String;
begin
  if (Client.Connected=False) then begin
    try
      Client.Connect;
    except
      on E:Exception do StrMsg:=E.Message;
    end;
     if Client.Connected then begin
        AddStatusLine('Connected');
     end else begin
        AddStatusLine('Tidak dapat melakukan koneksi ke Chat Server, Error:'+StrMsg);
     end;
  end;
end;

procedure TChatClient.Disconnect;
begin
  if (Client.Connected=True) and not(Initiation) then begin
    try
      Client.Disconnect;
    except
      on E:Exception do AddStatusLine(E.Message);
    end;
  end;
  if Client.Connected=False then AddStatusLine('Disconnected');
  ClientList.Clear;
  Close;
end;

procedure TChatClient.AddStatusLine(Str_Message:String);
begin
  AddLine(Str_Message,1);
end;

procedure TChatClient.AddMessageLine(Str_Message:String);
begin
  AddLine(Str_Message,2);
end;

procedure TChatClient.AddLine(Str_Message:String;Information_Type:Integer=2);
begin
  if Str_Message<>'' then begin
    Main.WriteLog(Str_Message);
    Str_Message:='['+FormatDateTime('dd/mm/yy hh:nn:ss',Now)+']: '+Str_Message;
    Case Information_Type of
      1:Pesan.Lines.Add(Str_Message);
      2:Pesan.Lines.Add(Str_Message);
    end;
  end;
end;

procedure TChatClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Client.Connected then Disconnect;
  Action:=caFree;
end;

procedure TChatClient.FormShow(Sender: TObject);
begin
  IntConnectTry:=0;
  Initiation:=True;
  Client.Host:=Main.ChatHost;
  Client.Port:=StrToInt(Main.ChatPort);
  if Main.IsChatAutoStart='1' then StartTimer.Enabled:=True;
end;

procedure TChatClient.ClientConnected(Sender: TObject);
begin
  TCPThread:=TReadingThread.Create(Client);
  Initiation:=False;
end;

procedure TChatClient.ClientDisconnected(Sender: TObject);
begin
  if (TCPThread<>nil) and Not(Initiation) then begin
    TCPThread.Terminate;
    TCPThread.WaitFor;
    FreeAndNil(TCPThread);
  end;
end;

procedure TChatClient.StartTimerTimer(Sender: TObject);
begin
  StartThread:=TStartThread.Create(Client);
  StartTimer.Enabled:=False;
end;

procedure TChatClient.SendMessageClick(Sender: TObject);
var Str:String;
    Nick:String;
begin
  if Client.Connected then begin
    Str:='';
    if ClientList.ItemIndex>-1 then begin
      Nick:=CLientList.Items.Strings[ClientList.ItemIndex];
      Str:='0@##'+Nick+'@##';
      AddMessageLine(Nick+'>'+MessageB.Text);
      Client.WriteLn(Str+MessageB.Text);
      MessageB.Text:='';
    end else begin
      if MessageBox(Handle,PChar('Broadcast ?'),'Message',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then
        Broadcast.Click;
//      Str:='3@##'+Nick+'@##';
//      AddMessageLine('(*)>'+MessageB.Text);
    end;
  end;
end;

procedure TChatClient.MessageBKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SendMessage.Click;
end;

procedure TChatClient.BroadcastClick(Sender: TObject);
var Str:String;
    StrNick:String;
begin
  if Client.Connected then begin
    Str:='';
    Str:='3@##'+StrNick+'@##';
    AddMessageLine('(*)>'+MessageB.Text);
    Client.WriteLn(Str+MessageB.Text);
    MessageB.Text:='';
  end;
end;

end.
