unit AddUserU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ADODB, MD5, WHUnit, ExtCtrls;

type
  TAddUser = class(TForm)
    Add: TButton;
    Cancel: TButton;
    Name: TEdit;
    Label1: TLabel;
    Username: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    UserGroup: TComboBox;
    Password: TMaskEdit;
    PassConf: TMaskEdit;
    Label5: TLabel;
    Active: TCheckBox;
    Label6: TLabel;
    Employee: TComboBox;
    Label7: TLabel;
    Location: TComboBox;
    Label8: TLabel;
    Panel1: TPanel;
    UserGroupDisp: TEdit;
    EmployeeDisp: TEdit;
    LocationDisp: TEdit;
    lbl1: TLabel;
    Email: TEdit;
    procedure CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddClick(Sender: TObject);
    procedure UserGroupChange(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure PassConfKeyPress(Sender: TObject; var Key: Char);
    procedure UserGroupKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure LocationChange(Sender: TObject);
    procedure LocationKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EmailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    UserGroupArr:Array of string;
    LocationArr:Array of TArrString2;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
  end;

var
  AddUser: TAddUser;

implementation

{$R *.dfm}

Uses MainU;

procedure TAddUser.Init;
begin
  Username.Text:='';
  Name.Text:='';
  Password.Text:='';
  PassConf.Text:='';
  UserGroup.Items.Clear;
  UserGroup.Text:='';
  Employee.Clear;
  Employee.Text:='';
  EmployeeDisp.Text:='';
  Active.Checked:=True;
end;

procedure TAddUser.CancelClick(Sender: TObject);
begin
  AddUser.Close;
end;

procedure TAddUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAddUser.RefreshCombo;
var QUGroup:TADOQuery;
    QStr:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  QUGroup:=TADOQuery.Create(Self);
  QUGroup.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='SELECT * FROM wh_user_group;';
    QUGroup.SQL.Add(QStr);
    QUGroup.Open;
    IntCount:=0;
    if QUGroup.RecordCount>0 then while not(QUGroup.Eof) do begin
      UserGroup.Items.Add(QUGroup.FieldValues['user_group_id']);
      SetLength(UserGroupArr,IntCount+2);
      UserGroupArr[IntCount+1]:=QUGroup.FieldValues['group_name'];
      QUGroup.Next;
      Inc(IntCount);
    end;
    QUGroup.Close;
    QUGroup.SQL.Clear;
    QStr:='SELECT * FROM wh_company_location a'+
          ' INNER JOIN wh_location b ON b.location_id=a.location_id'+
          ' INNER JOIN wh_company c ON c.company_id=a.company_id'+
          ' WHERE b.active=1;';
    QUGroup.SQL.Add(QStr);
    QUGroup.Open;
    IntCount:=0;
    if QUGroup.RecordCount>0 then while not(QUGroup.Eof) do begin
      Location.Items.Add(QUGroup.FieldValues['company_location_id']);
      SetLength(LocationArr,IntCount+2);
      LocationArr[IntCount+1][0]:=QUGroup.FieldValues['company_location_id'];
      LocationArr[IntCount+1][1]:=QUGroup.FieldValues['name']+' '+QUGroup.FieldValues['location'];
      QUGroup.Next;
      Inc(IntCount);
    end;
    QUGroup.Close;
  end;
  FreeAndNil(QUGroup);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAddUser.AddClick(Sender: TObject);
var QUser, QUserApp:TADOQuery;
    QStr, StrPasswordApp, StrContactId:String;
    Activ:Integer;
begin
  if ( (Trim(Username.Text)<>'') AND (Trim(Password.Text)<>'') AND
      (Trim(UserGroup.Text)<>'') AND (Trim(Location.Text)<>'') ) then begin
    if (Password.Text=PassConf.Text) then begin
      Main.M_Busy;
      QUser:=TADOQuery.Create(Self);
      QUser.Connection:=Main.MyConnection;

      QUserApp:= TADOQuery.Create(Self);
      QUserApp.Connection:=Main.MyConnectionWehaOnline;

      if Main.OpenDb then begin
        QStr:='SELECT * FROM wh_user '+
              'WHERE UPPER(username)='+Chr(39)+UpperCase(Username.Text)+Chr(39)+';';
        QUser.SQL.Add(QStr);
        QUser.Open;
        if (QUser.RecordCount<1) then begin
          //User Whaps
          if Active.Checked then Activ:=1 else Activ:=0;
          QStr:='EXEC AddUser '+Chr(39)+Name.Text+Chr(39)+
                ','+QuotedStr(Username.Text)+
                ','+QuotedStr(MD5Print(MD5String(Password.Text)))+','+QuotedStr(UserGroup.Text)+
                ','+Location.Text+','+IntToStr(Activ)+','+QuotedStr(User)+','+QuotedStr(Email.Text)+';';
          QUser.SQL.Clear;
          QUser.SQL.Add(QStr);
          QUser.ExecSQL;
          if QUser.RowsAffected<0 then
            MessageBox(0,'Add User Fail'+Chr(13)+'Please Contact Support','Add User',MB_OK or MB_ICONERROR);

          //User APP
          if (UserGroup.Text = '23') or (UserGroup.Text = '45') then begin
            QStr := 'INSERT INTO Contacts (FUllName,Gender,HP,ViewHisOwnData,Ismain, CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,ViewGroupOnly)'+
                 ' VALUES('+Chr(39)+Name.Text+Chr(39)+',''M'',''08787'',0,0,1,GETDATE(),1,GETDATE(),0);';
             QUserApp.SQL.Clear;
             QUserApp.SQL.Add(QStr);
             QUserApp.ExecSQL;

             QStr := 'SELECT MAX(contactid) AS ContactId FROM Contacts;';
             QUserApp.SQL.Clear;
             QUserApp.SQL.Add(QStr);
             QUserApp.Open;
             StrContactId := QuotedStr(QUserApp.FieldValues['ContactId']);
             StrPasswordApp :=QuotedStr('$2a$10$ng4Qjleghly61YVwe5bMdud1WgJSiTPD5Z/1F7oUdH4wO8xUKGFV/y'); //Pass = 1234

             QStr := 'INSERT INTO Users (ContactID, Email, Password,Role,LoginType,Title, '+
                     ' WehaUserID, ReferencedBy,ReferrerCode,IsActive,FcmToken, '+
                     ' IsHelper,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate)'+
                     ' VALUES('+StrContactId+','+QuotedStr(Email.Text)+','+StrPasswordApp +
                     ',''ADMIN'',''EMAIL'',''Mr.'','+QuotedStr(Username.Text)+','+QuotedStr('NewspaperMagazine')+
                     ','+QuotedStr('RVI3M7')+','+IntToStr(Activ)+','+QuotedStr('7586e21a-deaf-4b7a-8bc0-2be857fc6747')+',0,1,GETDATE(),1,GETDATE());';
             QUserApp.SQL.Clear;
             QUserApp.SQL.Add(QStr);
             QUserApp.ExecSQL;
          end;
        end else begin
          MessageBox(0,'Username already in use'+Chr(13)+'Please try another','Add User',MB_OK or MB_ICONERROR);
        end;
      end;
      QUser.Close;
      QUser.Destroy;
      Main.CloseDb;
      AddUser.Close;
      Main.M_Normal;
    end else begin
        MessageBox(0,'Password and Confirm Password not Match','Add User',MB_OK or MB_ICONERROR);
        PassConf.SetFocus;
    end;
  end else begin
    MessageBox(0,'Username/Password/Group Id/Location Cannot be blank','Add User',MB_OK or MB_ICONERROR);
    Username.SetFocus;
  end;

end;

procedure TAddUser.UserGroupChange(Sender: TObject);
begin
  if (Trim(UserGroup.Text)<>'') then
    UserGroupDisp.Text:=UserGroupArr[StrToInt(UserGroup.Text)];
end;

procedure TAddUser.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Username.SetFocus;
  if Key=#27 then AddUser.Close; 
end;

procedure TAddUser.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Email.SetFocus;
end;

procedure TAddUser.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PassConf.SetFocus;
end;

procedure TAddUser.PassConfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then UserGroup.SetFocus;
end;

procedure TAddUser.UserGroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Location.SetFocus;
end;

procedure TAddUser.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Add.Click;
end;

procedure TAddUser.LocationChange(Sender: TObject);
begin
  if (Trim(Location.Text)<>'') then
    LocationDisp.Text:=LocationArr[ArrayIndexOf(LocationArr,Location.Text,0)][1];
end;

procedure TAddUser.LocationKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TAddUser.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TAddUser.EmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Password.SetFocus;
end;

end.
