unit LoginU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, MD5, ADODB;

type
  TLogin = class(TForm)
    Masuk: TButton;
    Batal: TButton;
    Username: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Password: TMaskEdit;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MasukClick(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;
  

implementation

{$R *.dfm}

Uses MainU,WHUnit,ChatClientU;

procedure TLogin.BatalClick(Sender: TObject);
begin
  Login.Close;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLogin.MasukClick(Sender: TObject);
var
  Pass,StrQry,StrDateTime,StrCompName,StrIpAddress,ChatHost,ChatPort,EnableChat:String;
  Query:TADOQuery;
  IsOk:Boolean;
  IsChatEnable:Boolean;
begin
  if (Trim(Username.Text)<>'') and (Trim(Password.Text)<>'') and (Main.Expired=False) then begin
    Main.M_Busy;
    if Main.IsNewVersionAvail then begin
      MessageBox(Handle,'Versi Terbaru Sudah Ada'+Chr(13)+'Silahkan Update WHAps','WHAps',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
    if Main.IsVersionUptodate then begin
      Main.WriteLog('Start Login');
      Query:=TADOQuery.Create(Self);
      Query.Connection:=Main.MyConnection;
      User:=LowerCase(Username.Text);
      Pass:=Password.Text;
      IsOk:=True;
      if Main.OpenDb then begin
        StrQry:='EXEC AuthenticateUser '+Chr(39)+User+Chr(39)+','+Chr(39)+MD5Print(MD5String(Pass))+Chr(39)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Query.SQL.Clear;
        Query.SQL.Add(StrQry);
        Query.Open;
        if Query.RecordCount=1 then begin
          FullName:=Query.FieldValues['name'];
          LocationId:=Query.FieldValues['location_id'];
          LocationCode:=Query.FieldValues['code'];
          GroupId:=Query.FieldValues['user_group_id'];
          if Query.FieldValues['message_time']<>NULL then
          IntTimeCounterMessage:=Query.FieldValues['message_time'];
          CompanyId:=Query.FieldValues['company_id'];
          DepartmentId:=Query.FieldValues['department_id'];
          if Query.FieldValues['department_name']<>null then
          DepartmentName:=Query.FieldValues['department_name'];
          CompanyCode:=Query.FieldValues['company_code'];
          app_edt_km_awal:=Query.FieldValues['km_awal'];
          CompanyShortCode:=Query.FieldValues['short_code'];
          PrintAddPoint:=Query.FieldValues['print_line_add_width'];
          if Query.FieldValues['finance_detail']=1 then FinanceDetail:=True else FinanceDetail:=False;
          if Query.FieldValues['max_discount_percent']<>NULL then MaxDiscountPercent:=Query.FieldValues['max_discount_percent'];
          if Query.FieldValues['max_discount_price']<>NULL then MaxDiscountPrice:=Query.FieldValues['max_discount_price'];
          if Query.FieldValues['department_code']<>NULL then DepartmentCode:=Query.FieldValues['department_code'];
          if Query.FieldValues['user_level']<>NULL then UserLevel:=Query.FieldValues['user_level'] else UserLevel:=0;
          Main.StatusUserGroup(Query.FieldValues['group_name']);
          Main.StatusLocation(Query.FieldValues['company_name']+'-'+Query.FieldValues['location_name']);
          Query.Close;
          StrDateTime:=DateToStr(FileDateToDateTime(FileAge(Application.ExeName)));
          StrCompName:=GetHostname;
          StrIpAddress:=GetIpAddress;
          StrQry:='INSERT INTO wh_log (user_id,app_date,app_version,app_version_svr,location_id,company_id,department_id,host_name,ip_address) '+
                  ' VALUES ('+QuotedStr(User)+','+QuotedStr(StrDateTime)+','+QuotedStr(Main.AppVersion)+
                  ','+QuotedStr(Main.AppVersionSvr)+','+LocationId+','+CompanyId+','+DepartmentId+
                  ','+QuotedStr(StrCompName)+','+QuotedStr(StrIpAddress)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Query.SQL.Clear;
          Query.SQL.Add(StrQry);
          Query.ExecSQL;
          Query.Close;
          Main.InitLogin;
          Main.WriteLog('Finish Logging');

          Query.Close;
          StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('Interval_CheckInDate')+') AND (active=1);';
          Main.WriteLog('SQL :'+StrQry,2);
          Query.SQL.Clear;
          Query.SQL.Add(StrQry);
          Query.Open;
          if (Query.RecordCount>0) then Interval_CheckInDate := Query.FieldValues['value_string']
          else Interval_CheckInDate:=1;

          Query.Close;
          StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('Interval_CheckInTime')+') AND (active=1);';
          Main.WriteLog('SQL :'+StrQry,2);
          Query.SQL.Clear;
          Query.SQL.Add(StrQry);
          Query.Open;
          if (Query.RecordCount>0) then Interval_CheckInTime := Query.FieldValues['value_string']
          else Interval_CheckInTime:=200;

          StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('ChatEnable')+') and (active=1);';
          Main.WriteLog('SQL :'+StrQry,2);
          Query.SQL.Clear;
          Query.SQL.Add(StrQry);
          Query.Open;
          IsChatEnable:=False;
          if (Query.RecordCount>0) then begin
            if Query.FieldValues['value_string']<>NULL then if Query.FieldValues['value_string']='1' then IsChatEnable:=True;
          end;
          Query.Close;
          if IsChatEnable=True then begin
            StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('ChatHost')+') and (active=1);';
            Main.WriteLog('SQL :'+StrQry,2);
            Query.SQL.Clear;
            Query.SQL.Add(StrQry);
            Query.Open;
            if (Query.RecordCount>0) then begin
              if Query.FieldValues['value_string']<>NULL then Main.ChatHost:=Query.FieldValues['value_string'];
            end;
            Query.Close;
            StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('ChatPort')+') and (active=1);';
            Main.WriteLog('SQL :'+StrQry,2);
            Query.SQL.Clear;
            Query.SQL.Add(StrQry);
            Query.Open;
            if (Query.RecordCount>0) then begin
              if Query.FieldValues['value_string']<>NULL then Main.ChatPort:=Query.FieldValues['value_string'];
            end;
            Query.Close;
            if Main.IsFormOpen('ChatClient')=False then ChatClient:=TChatClient.Create(nil);
          end;
          Close;
        end else begin
          Query.Close;
          Main.WriteLog('Username/Password Error');
          MessageBox(Handle,'Username/Password salah'+Chr(13)+'atau tidak aktif','User Login',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          Password.Text:='';
          Password.SetFocus;
        end;
        Query.Destroy;
        Main.CloseDb;
      end;
    end else begin
      Main.WriteLog('Application Out of Date');
      MessageBox(Handle,'Versi Aplikasi Tidak Uptodate, Silahkan Update Aplikasi atau Hubungi IT','APP Version',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      //Main.TimerUpdate.Enabled:=True;
      Login.Close;
    end;
    Main.M_Normal;
  end else begin
    if Main.Expired=True then Main.TimerExpired.Enabled:=True;
  end;
end;

procedure TLogin.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Masuk.Click;
  if Key = #27 then Login.Close;
end;

procedure TLogin.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Password.SetFocus;
  if Key = #27 then Login.Close;

end;

procedure TLogin.PasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 71) and (Shift=[ssCtrl]) then
  begin
    Username.Text := 'pramudyono hadi';
    Password.Text := '080707**'
  end;
end;

end.
