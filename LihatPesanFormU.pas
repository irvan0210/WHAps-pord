unit LihatPesanFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls ,ADODB, WHUnit, Buttons;

type
  TLihatPesanForm = class(TForm)
    Panel1: TPanel;
    Dari: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Tanggal: TEdit;
    Label3: TLabel;
    Jam: TEdit;
    Label4: TLabel;
    Pesan: TMemo;
    Reply: TBitBtn;
    Selesai: TBitBtn;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ReplyClick(Sender: TObject);
  private
    { Private declarations }
    MsgId,MsgType:String;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MessageId:String);Overload;
  end;

var
  LihatPesanForm: TLihatPesanForm;


implementation

uses MainU, MessageSendFormU, StrUtils, MessageFormU;

{$R *.dfm}

constructor TLihatPesanForm.Create(AOwner:TComponent;MessageId:String);
begin
  MsgId:=MessageId;
  Inherited Create(AOwner);
end;

procedure TLihatPesanForm.Init;
begin
  Dari.Text:='';
  Tanggal.Text:='';
  Jam.Text:='';
  Pesan.Lines.Clear;
end;

procedure TLihatPesanForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMessageDetail '+QuotedStr(MsgId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Dari.Text:=Qry.FieldValues['sender'];
      Pesan.Lines.Add(Qry.FieldValues['message']);
      Tanggal.Text:=Qry.FieldValues['date'];
      Jam.Text:=Qry.FieldValues['time'];
      MsgType:=Qry.FieldValues['message_type'];
    end;
    Qry.Close;
    if LeftStr(MsgId,1)='P' then
      StrQry:='UPDATE wh_message_user SET ack=1 WHERE message_user_id='+QuotedStr(RightStr(MsgId,Length(MsgId)-1))+';'
    else if LeftStr(MsgId,1)='G' then
      StrQry:='UPDATE wh_message_group SET ack=1 WHERE message_group_id ='+QuotedStr(RightStr(MsgId,Length(MsgId)-1))+';';
    Qry.SQL.Add(StrQry);
    Qry.ExecSQL;
    Main.CloseDb;
  end;
  if Main.IsFormOpen('MessageForm')=True then MessageForm.RefreshForm;
end;

procedure TLihatPesanForm.SelesaiClick(Sender: TObject);
begin
  LihatPesanForm.Close;
end;

procedure TLihatPesanForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLihatPesanForm.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
end;

procedure TLihatPesanForm.ReplyClick(Sender: TObject);
begin
  if Main.IsFormOpen('MessageSendForm')=False then MessageSendForm:=TMessageSendForm.Create(Self,LowerCase(Dari.Text),MsgId,MsgType);
end;

end.
