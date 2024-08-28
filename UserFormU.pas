unit UserFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB, MD5, WHUnit, ExtCtrls;

type
  TUserForm = class(TForm)
    Change: TButton;
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
    Label7: TLabel;
    Employee: TComboBox;
    Label8: TLabel;
    Location: TComboBox;
    Panel1: TPanel;
    UserGroupDisp: TEdit;
    EmployeeDisp: TEdit;
    LocationDisp: TEdit;
    Label9: TLabel;
    Dept: TComboBox;
    DeptDisp: TEdit;
    Label10: TLabel;
    InitialName: TEdit;
    Label11: TLabel;
    Superior1: TComboBox;
    Label12: TLabel;
    Superior2: TComboBox;
    Label13: TLabel;
    Level: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    DiscountPrice: TEdit;
    DiscountPercent: TEdit;
    lbl1: TLabel;
    Email: TEdit;
    edtkmawal: TEdit;
    lbl2: TLabel;
    procedure CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UserGroupChange(Sender: TObject);
    procedure ChangeClick(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure PassConfKeyPress(Sender: TObject; var Key: Char);
    procedure UserGroupKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure LocationChange(Sender: TObject);
    procedure DeptChange(Sender: TObject);
    procedure LevelKeyPress(Sender: TObject; var Key: Char);
    procedure LocationKeyPress(Sender: TObject; var Key: Char);
    procedure EmployeeKeyPress(Sender: TObject; var Key: Char);
    procedure DeptKeyPress(Sender: TObject; var Key: Char);
    procedure Superior2KeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPercentKeyPress(Sender: TObject; var Key: Char);
    procedure EmailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    UserGroupArr,LocationArr,DeptArr,UserArr:Array of TArrString2;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
  public
    { Public declarations }
    ChgPass:Boolean;
    Usernm:String;
    constructor Create(AOwner:TComponent;User_name:String;ChgPwd:Boolean);Overload;
  end;

var
  UserForm: TUserForm;

implementation

{$R *.dfm}

Uses UserListU,MainU;

constructor TUserForm.Create(AOwner:TComponent;User_name:String;ChgPwd:Boolean);
begin
  ChgPass:=ChgPwd;
  Usernm:=User_name;
  Inherited Create(AOwner);
end;

procedure TUserForm.Init;
begin
  Username.Text:='';
  Name.Text:='';
  Password.Text:='';
  PassConf.Text:='';
  InitialName.Text:='';
  UserGroup.Items.Clear;
  UserGroup.Text:='';
  Employee.Clear;
  Employee.Text:='';
  EmployeeDisp.Text:='';
  Active.Checked:=True;
  Location.Text:='';
  Location.Items.Clear;
  Superior1.Text:='';
  Superior1.ItemIndex:=-1;
  Superior1.Items.Clear;
  Superior2.Text:='';
  Superior2.ItemIndex:=-1;
  Superior2.Items.Clear;
  DiscountPercent.Text:='0';
  DiscountPrice.Text:='0'; 
end;

procedure TUserForm.RefreshCombo;
var QUser:TADOQuery;
    QStr:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  if Main.OpenDb then begin
    QUser:=TADOQuery.Create(Self);
    QUser.Connection:=Main.MyConnection;
    QStr:='SELECT * FROM wh_user_group;';
    QUser.SQL.Add(QStr);
    SetLength(UserGroupArr,1);
    UserGroupArr[0][0]:=' ';
    UserGroupArr[0][1]:=' ';
    IntCount:=0;
    QUser.Open;
    if QUser.RecordCount>0 then while not(QUser.Eof) do begin
      SetLength(UserGroupArr,IntCount+2);
      UserGroupArr[IntCount+1][0]:=QUser.FieldValues['user_group_id'];
      UserGroupArr[IntCount+1][1]:=QUser.FieldValues['group_name'];
      QUser.Next;
      Inc(IntCount);
    end;
    QUser.Close;
    for IntCount:=0 to Length(UserGroupArr)-1 do
      UserGroup.Items.Add(UserGroupArr[IntCount][0]);
    QStr:='SELECT * FROM wh_company_location a'+
          ' INNER JOIN wh_location b ON b.location_id=a.location_id'+
          ' INNER JOIN wh_company c ON c.company_id=a.company_id'+
          ' WHERE b.active=1;';
    QUser.SQL.Clear;
    QUser.SQL.Add(QStr);
    SetLength(LocationArr,1);
    LocationArr[0][0]:=' ';
    LocationArr[0][1]:=' ';
    IntCount:=0;
    QUser.Open;
    if QUser.RecordCount>0 then while not(QUser.Eof) do begin
      SetLength(LocationArr,IntCount+2);
      LocationArr[IntCount+1][0]:=QUser.FieldValues['company_location_id'];
      LocationArr[IntCount+1][1]:=QUser.FieldValues['name']+' '+QUser.FieldValues['location'];
      QUser.Next;
      Inc(IntCount);
    end;
    QUser.Close;
    for IntCount:=0 to Length(LocationArr)-1 do
      Location.Items.Add(LocationArr[IntCount][0]);
    QStr:='SELECT * FROM wh_department WHERE active=1;';
    QUser.SQL.Clear;
    QUser.SQL.Add(QStr);
    SetLength(DeptArr,1);
    DeptArr[0][0]:=' ';
    DeptArr[0][1]:=' ';
    IntCount:=0;
    QUser.Open;
    if QUser.RecordCount>0 then while not(QUser.Eof) do begin
      SetLength(DeptArr,IntCount+2);
      DeptArr[IntCount+1][0]:=QUser.FieldValues['department_id'];
      DeptArr[IntCount+1][1]:=QUser.FieldValues['name'];
      QUser.Next;
      Inc(IntCount);
    end;
    QUser.Close;
    for IntCount:=0 to Length(DeptArr)-1 do
      Dept.Items.Add(DeptArr[IntCount][0]);
    QStr:='SELECT * FROM wh_user WHERE (active=1) AND (username<>'+QuotedStr(Usernm)+') ORDER BY name;';
    QUser.SQL.Clear;
    QUser.SQL.Add(QStr);
    SetLength(UserArr,1);
    UserArr[0][0]:=' ';
    UserArr[0][1]:=' ';
    IntCount:=0;
    QUser.Open;
    if QUser.RecordCount>0 then while not(QUser.Eof) do begin
      SetLength(UserArr,IntCount+2);
      UserArr[IntCount+1][0]:=QUser.FieldValues['username'];
      UserArr[IntCount+1][1]:=QUser.FieldValues['name'];
      QUser.Next;
      Inc(IntCount);
    end;
    QUser.Close;
    for IntCount:=0 to Length(UserArr)-1 do begin
      Superior1.Items.Add(UserArr[IntCount][1]);
      Superior2.Items.Add(UserArr[IntCount][1]);
    end;
  end;
  FreeAndNil(QUser);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TUserForm.LoadData;
var QUser:TADOQuery;
    QStr:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  if Main.OpenDb then begin
    QUser:=TADOQuery.Create(Self);
    QUser.Connection:=Main.MyConnection;
    QUser.SQL.Clear;
    QStr:='SELECT a.*,b.department_id AS dept_id,b.initial_name,b.* '+
          ' FROM wh_user AS a '+
          ' LEFT JOIN wh_user_detail b ON b.user_id=a.username '+
          ' WHERE a.username='+Chr(39)+Usernm+Chr(39)+';' ;
    QUser.SQL.Add(QStr);
    QUser.Open;
    if (QUser.RecordCount>0) then begin
      Name.Text:=QUser.FieldValues['name'];
      Username.Text:=QUser.FieldValues['username'];
      if QUser.FieldValues['initial_name']<>NULL then InitialName.Text:=QUser.FieldValues['initial_name'];
      UserGroup.ItemIndex:=UserGroup.Items.IndexOf(QUser.FieldValues['user_group_id']);
      UserGroupDisp.Text:=UserGroupArr[UserGroup.Items.IndexOf(UserGroup.Text)][1];
      Location.ItemIndex:=Location.Items.IndexOf(Quser.FieldValues['company_location_id']);
      LocationDisp.Text:=LocationArr[Location.Items.IndexOf(Location.Text)][1];
      if Quser.FieldValues['user_level']<>NULL then Level.Text:=Quser.FieldValues['user_level'] else Level.Text:='20';
      if Quser.FieldValues['dept_id']<>NULL then begin
        Dept.ItemIndex:=Dept.Items.IndexOf(Quser.FieldValues['dept_id']);
        DeptDisp.Text:=DeptArr[Dept.ItemIndex][1];
      end;
      if QUser.FieldValues['km_awal']<>NULL then edtkmawal.Text:=QUser.FieldValues['km_awal'];
      if QUser.FieldValues['max_discount_percent']<>NULL then DiscountPercent.Text:=QUser.FieldValues['max_discount_percent'];
      if QUser.FieldValues['max_discount_price']<>NULL then DiscountPrice.Text:=QUser.FieldValues['max_discount_price'];
      if QUser.FieldValues['superior_user_id1']<>NULL then Superior1.ItemIndex:=ArrayIndexOf(UserArr,QUser.FieldValues['superior_user_id1'],1);
      if QUser.FieldValues['superior_user_id2']<>NULL then Superior2.ItemIndex:=ArrayIndexOf(UserArr,QUser.FieldValues['superior_user_id1'],2);
      if QUser.FieldValues['active']=1 then Active.Checked:=True else Active.Checked:=False;
      if QUser.FieldValues['email']<>NULL then Email.Text:=QUser.FieldValues['email'];
    end;
    QUser.Close;
  end;
  FreeAndNil(QUser);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TUserForm.CancelClick(Sender: TObject);
begin
  UserForm.Close;
end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  LoadData;
  if ChgPass then begin
    Username.Enabled:=False;
    Name.Enabled:=False;
    Password.Enabled:=True;
    PassConf.Enabled:=True;
    InitialName.Enabled:=False;
    UserGroup.Enabled:=False;
    Active.Enabled:=False;
  end else begin
    Username.Enabled:=True;
    Name.Enabled:=True;
    Password.Enabled:=False;
    PassConf.Enabled:=False;
    InitialName.Enabled:=True;
    UserGroup.Enabled:=True;
    Active.Enabled:=True;
  end;
end;

procedure TUserForm.UserGroupChange(Sender: TObject);
begin
//  if (Trim(UserGroup.Text)<>'') then
    UserGroupDisp.Text:=UserGroupArr[UserGroup.Items.IndexOf(UserGroup.Text)][1];
end;

procedure TUserForm.ChangeClick(Sender: TObject);
var QUser:TADOQuery;
    QStr,StrDept,StrInitial,StrLevel,StrSuperior1,StrSuperior2,StrMaxDiscPrice,StrMaxDiscPercent:String;
    Actv:Integer;
begin
  QUser:=TADOQuery.Create(Self);
  QUser.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if ChgPass then begin
      if ((Trim(Password.Text)<>'') AND (Password.Text=PassConf.Text) ) then begin
        QStr:='UPDATE wh_user SET password='+Chr(39)+MD5Print(MD5String(Password.Text))+Chr(39)+
              ' WHERE UPPER(username)='+Chr(39)+UpperCase(Username.Text)+Chr(39)+';' ;
        QUser.SQL.Add(QStr);
        QUser.ExecSQL;
        if QUser.RowsAffected<1 then MessageBox(0,'Fail to change password','Change Password',MB_OK or MB_ICONWARNING)
        else UserList.RefreshList;
      end;
    end else begin
      if ((Trim(Username.Text)<>'') AND (Trim(Name.Text)<>'') AND (Trim(UserGroup.Text)<>'')) then begin
        if SToInt(Trim(DiscountPrice.Text))>0 then StrMaxDiscPrice:=Trim(DiscountPrice.Text) else StrMaxDiscPrice:='NULL';
        if StrToInt(Trim(DiscountPercent.Text))>0 then StrMaxDiscPercent:=Trim(DiscountPercent.Text) else StrMaxDiscPercent:='NULL';
        if Superior1.Text<>'' then StrSuperior1:=QuotedStr(UserArr[Superior1.ItemIndex][0]) else StrSuperior1:='NULL';
        if Superior2.Text<>'' then StrSuperior2:=QuotedStr(UserArr[Superior2.ItemIndex][0]) else StrSuperior2:='NULL';
        if Active.Checked then Actv:=1 else Actv:=0;
        if Dept.Text<>'' then StrDept:=Dept.Text else StrDept:='NULL';
        if InitialName.Text<>'' then StrInitial:=QuotedStr(Trim(InitialName.Text)) else StrInitial:='NULL';
        StrLevel:=Level.Text; 
        QStr:='UPDATE wh_user SET name='+Chr(39)+Name.Text+Chr(39)+
              ',username='+Chr(39)+Username.Text+Chr(39)+
              ',email='+QuotedStr(Email.Text)+
              ',user_group_id='+Chr(39)+UserGroup.Text+Chr(39)+',active='+IntToStr(Actv)+
              ',company_location_id='+Location.Text+',update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE username='+Chr(39)+Usernm+Chr(39)+';' ;
        QStr:=QStr+' DELETE FROM wh_user_detail WHERE user_id='+QuotedStr(Usernm)+';'+
              'INSERT INTO wh_user_detail (user_id,department_id,initial_name,user_level,superior_user_id1,superior_user_id2'+
              ',max_discount_price,max_discount_percent,km_awal,update_user) '+
              'VALUES ('+QuotedStr(Usernm)+','+StrDept+','+StrInitial+','+StrLevel+','+StrSuperior1+','+StrSuperior2+
              ','+StrMaxDiscPrice+','+StrMaxDiscPercent+','+QuotedStr(edtkmawal.Text)+','+QuotedStr(User)+');';
        QUser.SQL.Add(QStr);
        QUser.ExecSQL;
        if QUser.RowsAffected<1 then MessageBox(0,'Fail to change user detail','Change Detail',MB_OK or MB_ICONWARNING)
        else UserList.RefreshList;
      end else
        MessageBox(0,'Name/Username/UserGroup Cannot be empty','Change Detail',MB_OK or MB_ICONWARNING);
    end;
    QUser.Close;
  end;
  Main.CloseDb;
  QUser.Destroy;
  Main.M_Normal;
  UserForm.Close;
end;

procedure TUserForm.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#27]) then Key:=#0;
  if Key=#13 then UserGroup.SetFocus;
  if Key=#27 then UserForm.Close;
end;

procedure TUserForm.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then UserGroup.SetFocus;
end;

procedure TUserForm.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PassConf.SetFocus;
  if Key=#27 then UserForm.Close; 
end;

procedure TUserForm.PassConfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Email.SetFocus;
end;

procedure TUserForm.UserGroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Employee.SetFocus;
end;

procedure TUserForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Change.Click;
end;

procedure TUserForm.LocationChange(Sender: TObject);
begin
  LocationDisp.Text:=LocationArr[Location.Items.IndexOf(Location.Text)][1]; 
end;

procedure TUserForm.DeptChange(Sender: TObject);
begin
  DeptDisp.Text:=DeptArr[Dept.ItemIndex][1];
end;

procedure TUserForm.LevelKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#27]) then Key:=#0;
  if Key=#13 then InitialName.SetFocus;
  if Key=#27 then UserForm.Close; 
end;

procedure TUserForm.LocationKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Dept.SetFocus;
end;

procedure TUserForm.EmployeeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Location.SetFocus;
end;

procedure TUserForm.DeptKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Superior1.SetFocus;
end;

procedure TUserForm.Superior2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then DiscountPrice.SetFocus;
end;

procedure TUserForm.DiscountPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPercent.SetFocus;
end;

procedure TUserForm.DiscountPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Active.SetFocus;

end;

procedure TUserForm.EmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Level.SetFocus;
end;

end.
