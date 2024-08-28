unit MessageSendFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,ADODB, WHUnit, Buttons, Jpeg;

type
  TMessageSendForm = class(TForm)
    Tujuan: TLabel;
    ToUser: TComboBox;
    Label1: TLabel;
    Pesan: TMemo;
    Kirim: TBitBtn;
    Selesai: TBitBtn;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure KirimClick(Sender: TObject);
    procedure ToUserKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ToId,MsgId,MsgType:String;
    UserArr:Array of TArrString5;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;SendToId,MessageId,MessageType:String);Overload;
  end;

var
  MessageSendForm: TMessageSendForm;

implementation

uses Math, MainU, StrUtils, LihatPesanFormU, MessageFormU;

{$R *.dfm}

constructor TMessageSendForm.Create(AOwner:TComponent;SendToId,MessageId,MessageType:String);
begin
  ToId:=SendToId;
  MsgId:=MessageId;
  MsgType:=MessageType;
  Inherited Create(AOwner);
end;

procedure TMessageSendForm.SelesaiClick(Sender: TObject);
begin
  MessageSendForm.Close;
end;

procedure TMessageSendForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMessageSendForm.Init;
begin
  ToUser.Text:='';
  ToUser.Items.Clear;
  ToUser.ItemIndex:=-1;
end;

procedure TMessageSendForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;  
begin
  SetLength(UserArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user WHERE active=1 ORDER BY name; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(UserArr,Qry.RecordCount);
    If Qry.RecordCount>0 then while not(Qry.Eof) do begin
      UserArr[IntCount][0]:=Qry.FieldValues['username'];
      UserArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(UserArr)-1 do
    ToUser.Items.Add(UserArr[IntCount][1]);
end;

procedure TMessageSendForm.FormShow(Sender: TObject);
var IntCount:Integer;
begin
  Init;
  RefreshCombo;
  if ToId<>'' then begin
//    for IntCount:=0 to Length(UserArr)-1 do
//      if UserArr[IntCount][0]=ToId then
    ToUser.ItemIndex:=ToUser.Items.IndexOf(ToId);
  end;
end;

procedure TMessageSendForm.KirimClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrUsername:String;
    IsOk:Boolean;
    StrParam,StrFieldName,StrTableName:String;
begin
  if (ToUser.Text<>'') AND (Trim(Pesan.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrUsername:=UserArr[ToUser.ItemIndex][0];
    if Main.OpenDb then begin
      IsOk:=True;
      StrQry:='';
      if MsgType='G' then begin
        StrParam:=',ack_user='+Chr(39)+User+Chr(39);
        StrTableName:='wh_message_group';
        StrFieldName:='message_group_id';
      end else begin
        StrParam:='';
        StrTableName:='wh_message_user';
        StrFieldName:='message_user_id';
      end;
      if MsgId='' then begin
        StrQry:='INSERT INTO wh_message_user (user_id,sender_user_id,message,update_user) '+
                ' VALUES ('+QuotedStr(StrUsername)+','+QuotedStr(User)+','+QuotedStr(Pesan.Text)+','+QuotedStr(User)+');';
      end else begin
        StrQry:='INSERT INTO wh_message_user (user_id,sender_user_id,message,message_id_reference,update_user) '+
                ' VALUES ('+QuotedStr(StrUsername)+','+QuotedStr(User)+','+QuotedStr(Pesan.Text)+
                ','+QuotedStr(MsgId)+','+QuotedStr(User)+');';
        StrQry:=StrQry+' UPDATE '+StrTableName+' SET ack=1'+StrParam+' WHERE '+StrFieldName+'='+RightStr(MsgId,Length(MsgId)-1)+';';
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
        MessageBox(0,'Pesan Sudah Terkirim','Kirim Pesan',MB_OK or MB_ICONINFORMATION);
        Main.CloseDb;
        if Main.IsFormOpen('LihatPesanForm')=True then begin
          if Main.IsFormOpen('MessageForm')=True then MessageForm.Refresh;
          LihatPesanForm.Close;
        end;// else
        Close;
      end else begin
        Main.Closedb;
        MessageBox(0,PChar('Gagal Mengirimkan Pesan'+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Kirim Pesan',MB_OK or MB_ICONERROR);
      end;
    end;
    if Main.IsFormOpen('MessageForm')=True then MessageForm.RefreshForm;
  end;
end;

procedure TMessageSendForm.ToUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Pesan.SetFocus;
end;

end.
