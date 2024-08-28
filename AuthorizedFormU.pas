unit AuthorizedFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ADODB, md5, ExtCtrls;

type
  TAuthorizedForm = class(TForm)
    Label1: TLabel;
    Nama: TEdit;
    Label2: TLabel;
    Batal: TButton;
    Otorisasi: TButton;
    Password: TMaskEdit;
    TimerCheck: TTimer;
    Pesan: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure OtorisasiClick(Sender: TObject);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure TimerCheckTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    IsCancel,IsAuth:Boolean;
    procedure Init;
    procedure CloseForm;
  public
    { Public declarations }
    FormId:String;
    StrMessage,CheckValues:String;
    StrListMessage:TStrings;
    Values:Integer;
  end;

var
  AuthorizedForm: TAuthorizedForm;

implementation

uses MainU, WHUnit, CheckerInU;


{$R *.dfm}

procedure TAuthorizedForm.Init;
begin
  Nama.Text:='';
  Password.Text:='';
  IsCancel:=False;
  nama.SetFocus;
  ModalResult:=0;
  Pesan.Lines.Clear;
end;

procedure TAuthorizedForm.CloseForm;
begin
  if (IsCancel) then ModalResult:=2
  else if IsAuth then ModalResult:=1 else ModalResult:=3;
  StrMessage:='';
  AuthorizedForm.Hide;
end;

procedure TAuthorizedForm.FormShow(Sender: TObject);
begin
  Init;
  TimerCheck.Enabled:=True;
  if StrMessage<>'' then Pesan.Lines:=SplitStrings(StrMessage,Chr(13));
end;

procedure TAuthorizedForm.BatalClick(Sender: TObject);
begin
  IsCancel:=True;
  CloseForm;
end;

procedure TAuthorizedForm.OtorisasiClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    MaxDiscPercent,MaxDiscPrice,km_awal:Integer;
begin
  if (Trim(Nama.Text)<>'') AND (Trim(Password.Text)<>'') then begin
    IsAuth:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC Authenticate '+QuotedStr(Nama.Text)+
              ','+QuotedStr(MD5Print(MD5String(Password.Text)))+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['km_awal']='1' then km_awal:=1;

        if Qry.FieldValues['max_discount_percent']<>NULL then MaxDiscPercent:=Qry.FieldValues['max_discount_percent'];
        if Qry.FieldValues['max_discount_price']<>NULL then MaxDiscPrice:=Qry.FieldValues['max_discount_price'];
        IsAuth:=True;
        StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(Nama.Text)+
                ' AND form_id='+QuotedStr(FormId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          IsAuth:=True;
        end else begin
          IsAuth:=False;
        end;

        CloseForm;
      end else begin
        IsAuth:=False;
      end;
      Qry.Close;
    end;
    Main.CloseDb;
    Qry.Destroy;
  end;
  if CheckValues<>'' then begin
    if UpperCase(CheckValues)='DISC-PERCENT' then begin
      if Values>MaxDiscPercent then IsAuth:=False;
    end;
    if UpperCase(CheckValues)='DISC-PRICE' then begin
      if Values>MaxDiscPrice then IsAuth:=False;
    end;
  end;

  if km_awal=1 then
  begin
    CheckerIn.GroupBox1.Enabled:=True;
    IsAuth:=True;
  end;

  Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
  if IsAuth=False then begin
    MessageBox(0,'Username/Password Salah / tidak dapat mengotorisasi','Login',MB_OK or MB_ICONWARNING);
    CloseForm;
  end;

end;

procedure TAuthorizedForm.NamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Password.SetFocus;
end;

procedure TAuthorizedForm.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Otorisasi.Click;
end;

procedure TAuthorizedForm.TimerCheckTimer(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    MaxDiscPercent,MaxDiscPrice:Integer;
begin
  TimerCheck.Enabled:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+
            ' AND form_id='+QuotedStr(FormId)+' AND active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IsAuth:=True;
    end else begin
      IsAuth:=False;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_user_detail WHERE user_id='+QuotedStr(User)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['max_discount_percent']<>NULL then MaxDiscPercent:=Qry.FieldValues['max_discount_percent'];
      if Qry.FieldValues['max_discount_price']<>NULL then MaxDiscPrice:=Qry.FieldValues['max_discount_price'];
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if CheckValues<>'' then begin
    if UpperCase(CheckValues)='DISC-PERCENT' then begin
      if Values>MaxDiscPercent then IsAuth:=False;
    end;
    if UpperCase(CheckValues)='DISC-PRICE' then begin
      if Values>MaxDiscPrice then IsAuth:=False;
    end;
  end;
  Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
  if IsAuth then
    CloseForm;
end;

procedure TAuthorizedForm.FormCreate(Sender: TObject);
begin
  CheckValues:='';
  Values:=0;
end;

end.
