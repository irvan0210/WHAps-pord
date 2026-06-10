unit UserTreeMenuU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, ComCtrls;

type
  TUserTreeMenuForm = class(TForm)
    LabelUserTreeMenuId: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelActive: TLabel;
    Panel1: TPanel;
    UserTreeMenuId: TEdit;
    GroupInput: TPanel;
    Active: TCheckBox;
    Username: TComboBox;
    TreeMenu: TComboBox;
    Simpan: TButton;
    Batal: TButton;
    Menu: TComboBox;
    Label5: TLabel;
    SubMenu: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Default: TCheckBox;
    PanelSetTime: TPanel;
    FromDates: TDateTimePicker;
    ToDates: TDateTimePicker;
    Label8: TLabel;
    FromTimes: TDateTimePicker;
    ToTimes: TDateTimePicker;
    Label10: TLabel;
    Mon: TCheckBox;
    Fri: TCheckBox;
    Tue: TCheckBox;
    Sat: TCheckBox;
    Wed: TCheckBox;
    Sun: TCheckBox;
    Thu: TCheckBox;
    Label13: TLabel;
    SBU: TComboBox;
    AllSBU: TCheckBox;
    btnClear: TButton;
    procedure FormShow(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuChange(Sender: TObject);
    procedure SubMenuChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UsernameChange(Sender: TObject);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure SubMenuKeyPress(Sender: TObject; var Key: Char);
    procedure TreeMenuKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure SunKeyPress(Sender: TObject; var Key: Char);
    procedure FromDatesKeyPress(Sender: TObject; var Key: Char);
    procedure ToDatesKeyPress(Sender: TObject; var Key: Char);
    procedure FromTimesKeyPress(Sender: TObject; var Key: Char);
    procedure ToTimesKeyPress(Sender: TObject; var Key: Char);
    procedure MonKeyPress(Sender: TObject; var Key: Char);
    procedure TueKeyPress(Sender: TObject; var Key: Char);
    procedure WedKeyPress(Sender: TObject; var Key: Char);
    procedure ThuKeyPress(Sender: TObject; var Key: Char);
    procedure FriKeyPress(Sender: TObject; var Key: Char);
    procedure SatKeyPress(Sender: TObject; var Key: Char);
    procedure DefaultClick(Sender: TObject);
    procedure AllSBUClick(Sender: TObject);
    procedure SBUKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    UserArr,TreeMenuArr,MenuArr,SubMenuArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    StrLastTreeMenuId,StrLastTreeMenu,StrLastMenu,StrLastSubMenu:String;
    UsrTreeMenuId:String;
    IsView:Boolean;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshUser;
    procedure RefreshMenu;
    procedure RefreshSubMenu;
    procedure RefreshTreeMenu;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;UserTreeMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserTreeMenuForm: TUserTreeMenuForm;

implementation

uses MainU, ADODB, UserTreeMenuListU;

{$R *.dfm}

Constructor TUserTreeMenuForm.Create(AOwner:TComponent;UserTreeMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  UsrTreeMenuId:=UserTreeMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserTreeMenuForm.Init;
begin
  UserTreeMenuId.Text:='';
  TreeMenu.Text:='';
  TreeMenu.Clear;
  FromDates.Date:=Now();
  ToDates.Date:=StrToDate('31/12/2050');
  FromTimes.Time:=StrToTime('00:00:00');
  ToTimes.Time:=StrToTime('23:59:59');
  Mon.Checked:=True;
  Tue.Checked:=True;
  Wed.Checked:=True;
  Thu.Checked:=True;
  Fri.Checked:=True;
  Sat.Checked:=True;
  Sun.Checked:=True;
  Active.Checked:=True;
  PanelSetTime.Enabled:=True;
  Default.Checked:=True;
  AllSBU.Checked:=True;
end;

procedure TUserTreeMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TUserTreeMenuForm.RefreshUser;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Username.Text:='';
  Username.Clear;
  SetLength(UserArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user WHERE active=1 ORDER BY name';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserArr[IntCount][0]:=Qry.FieldValues['username'];
        UserArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(UserArr)-1 do
    Username.Items.Add(UserArr[IntCount][1]);
end;

procedure TUserTreeMenuForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
//    StrQry:='EXEC GetCompanyLocationList @Username='+QuotedStr(UserArr[Username.ItemIndex][0])+';';
    StrQry:='EXEC GetCompanyLocationList ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TUserTreeMenuForm.RefreshTreeMenu;
var Qry:TADOQuery;
    StrQry,StrUserId,StrSubMenuId:String;
    IntCount:Integer;
begin
  TreeMenu.Text:='';
  TreeMenu.Clear;
  SetLength(TreeMenuArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(UserArr)-1 do
    if UserArr[IntCount][1]=Username.Text then StrUserId:=UserArr[IntCount][0];
  for IntCount:=0 to Length(SubMenuArr)-1 do
    if SubMenuArr[IntCount][1]=SubMenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_tree_sub_menu a '+
            'LEFT JOIN wh_user_grp_tree_sub_menu b ON (b.tree_sub_menu_id=a.tree_sub_menu_id) AND'+
            '(b.user_group_id=(SELECT user_group_id FROM wh_user WHERE username='+QuotedStr(StrUserId)+' AND active = 1)) '+
            'LEFT JOIN wh_user_tree_sub_menu c ON (c.tree_sub_menu_id=a.tree_sub_menu_id) AND (c.user_id='+QuotedStr(StrUserId)+')'+
            'WHERE (b.user_grp_tree_sub_menu_id IS NULL) AND (c.user_tree_sub_menu_id IS NULL) AND (sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+');' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      SetLength(TreeMenuArr,Qry.RecordCount);
      while not(Qry.Eof) do begin
        TreeMenuArr[IntCount][0]:=Qry.FieldValues['tree_sub_menu_id'];
        TreeMenuArr[IntCount][1]:=Qry.FieldValues['tree_menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  if UsrTreeMenuId<>'' then begin
    if (Menu.Text=StrLastMenu) and (SubMenu.Text=StrLastSubMenu) then begin
      SetLength(TreeMenuArr,Length(TreeMenuArr)+1);
      TreeMenuArr[Length(TreeMenuArr)-1][0]:=StrLastTreeMenuId;
      TreeMenuArr[Length(TreeMenuArr)-1][1]:=StrLastTreeMenu;
    end;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(TreeMenuArr)-1 do
    TreeMenu.Items.Add(TreeMenuArr[IntCount][1]);
end;

procedure TUserTreeMenuForm.RefreshMenu;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  menu.Text:='';
  Menu.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MenuArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(MenuArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        MenuArr[IntCount][0]:=Qry.FieldValues['menu_id'];
        MenuArr[IntCount][1]:=Qry.FieldValues['menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(MenuArr)-1 do
    Menu.Items.Add(MenuArr[IntCount][1]);
end;

procedure TUserTreeMenuForm.RefreshSubMenu;
var Qry:TADOQuery;
    StrQry,StrMenuId:String;
    IntCount:Integer;
begin
  SubMenu.Clear;
  SubMenu.Text:='';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(SubMenuArr,0);
  for IntCount:=0 to Length(MenuArr)-1 do
    if MenuArr[IntCount][1]=Menu.Text then StrMenuId:=MenuArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_sub_menu WHERE (sub_menu<>'+Chr(39)+'-'+Chr(39)+
            ' AND menu_id='+Chr(39)+StrMenuId+Chr(39)+');';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(SubMenuArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        SubMenuArr[IntCount][0]:=Qry.FieldValues['sub_menu_id'];
        SubMenuArr[IntCount][1]:=Qry.FieldValues['sub_menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(SubMenuArr)-1 do
    SubMenu.Items.Add(SubMenuArr[IntCount][1]);
end;

procedure TUserTreeMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrUserGroupId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  UserTreeMenuId.Text:=UsrTreeMenuId;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_tree_sub_menu a '+
            'LEFT JOIN wh_user b ON b.user_id=b.username '+
            'LEFT JOIN wh_tree_sub_menu c ON c.tree_sub_menu_id=a.tree_sub_menu_id'+
            'LEFT JOIN wh_sub_menu d ON d.sub_menu_id=c.sub_menu_id'+
            'LEFT JOIN wh_menu e ON e.menu_id=d.menu_id'+
            'WHERE user_tree_sub_menu_id='+Chr(39)+UsrTreeMenuId+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
       Username.ItemIndex:=Username.Items.IndexOf(Qry.FieldValues['username']);
       StrLastTreeMenuId:=Qry.FieldValues['tree_sub_menu_id'];
       StrLastTreeMenu:=Qry.FieldValues['tree_menu'];
       StrLastSubMenu:=Qry.FieldValues['sub_menu'];
       StrLastMenu:=Qry.FieldValues['menu'];
       Active.Checked:=Qry.FieldValues['active'];
    end;
    Qry.Close;
    Main.CloseDb;
    RefreshMenu;
    Menu.ItemIndex:=Menu.Items.IndexOf(StrLastMenu); 
    RefreshSubMenu;
    SubMenu.ItemIndex:=SubMenu.Items.IndexOf(StrLastSubMenu);
    RefreshTreeMenu; 
    TreeMenu.ItemIndex:=TreeMenu.Items.IndexOf(StrLastTreeMenu);
  end;
  Qry.Destroy;
  Main.M_Normal;
end;


procedure TUserTreeMenuForm.FormShow(Sender: TObject);
begin
  Init;
  if UsrTreeMenuId<>'' then begin
    RefreshUser;
    LoadData;
  end else begin
    RefreshUser;
    LabelUserTreeMenuId.Visible:=False;
    UserTreeMenuId.Visible:=False;
    Active.Visible:=False;
    LabelActive.Visible:=False;
  end;
  if IsView then Input(False)
  else Input(True);
end;

procedure TUserTreeMenuForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TUserTreeMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserTreeMenuForm.MenuChange(Sender: TObject);
begin
  RefreshSubMenu;
  TreeMenu.Clear;
  TreeMenu.Text:='';
end;

procedure TUserTreeMenuForm.SubMenuChange(Sender: TObject);
begin
  RefreshTreeMenu;
end;

procedure TUserTreeMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrUsername,StrTreeMenuId,StrActive,StrFromDates,StrToDates,StrFromTimes,StrToTimes:String;
    StrMon,StrTue,StrWed,StrThu,StrFri,StrSat,StrSun,StrInsert,StrCompanyId,StrCompanyIdInsert:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Username.Text)<>'') and (Trim(TreeMenu.Text)<>'') then begin
    StrEMsg:='';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    StrUsername:=UserArr[Username.ItemIndex][0];
    StrTreeMenuId:=TreeMenuArr[TreeMenu.ItemIndex][0];
    if AllSBU.Checked=True then begin
      StrCompanyIdInsert:='';
      StrCompanyId:='';
    end else begin
      StrCompanyIdInsert:=',company_id';
      StrCompanyId:=','+CompanyArr[SBU.ItemIndex][1];
    end;
    if Default.Checked=True then begin
      StrFromDates:='GETDATE()';
      StrToDates:='NULL';
      StrFromTimes:=QuotedStr('12:00:00 AM');
      StrToTimes:=QuotedStr('11:59:59 PM');
      StrSun:='';
      StrMon:='';
      StrTue:='';
      StrWed:='';
      StrThu:='';
      StrFri:='';
      StrSat:='';
      StrInsert:='';
    end else begin
      StrFromDates:='GETDATE()';
      StrToDates:='NULL';
      StrFromTimes:=QuotedStr(FormatDateTime('HH:nn:ss',FromTimes.Time));
      StrToTimes:=QuotedStr(FormatDateTime('HH:nn:ss',ToTimes.Time));
      if Sun.Checked then StrSun:=',1' else StrSun:=',0';
      if Mon.Checked then StrMon:=',1' else StrMon:=',0';
      if Tue.Checked then StrTue:=',1' else StrTue:=',0';
      if Wed.Checked then StrWed:=',1' else StrWed:=',0';
      if Thu.Checked then StrThu:=',1' else StrThu:=',0';
      if Fri.Checked then StrFri:=',1' else StrFri:=',0';
      if Sat.Checked then StrSat:=',1' else StrSat:=',0';
      StrInsert:=',[1],[2],[3],[4],[5],[6],[7]';
    end;
    if Active.Checked then StrActive:='1' else StrActive:='0';
    if Main.OpenDb then begin
      Simpan.Enabled:=False;
      Main.TransStart;
      if UsrTreeMenuId<>'' then begin
        StrQry:='DELETE FROM wh_user_tree_sub_menu WHERE user_tree_sub_menu_id='+QuotedStr(StrTreeMenuId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
      end;
      StrQry:='INSERT INTO wh_user_tree_sub_menu (tree_sub_menu_id,user_id'+StrCompanyIdInsert+',active'+
              ',from_date,to_date,from_time,to_time'+StrInsert+',update_time,update_user)'+
              'VALUES ('+QuotedStr(StrTreeMenuId)+','+QuotedStr(StrUsername)+StrCompanyId+','+QuotedStr(StrActive)+
              ','+StrFromDates+','+StrToDates+','+StrFromTimes+','+StrToTimes+StrSun+StrMon+StrTue+StrWed+
              StrThu+StrFri+StrSat+',GETDATE(),'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do  begin
          IsOk:=False;
          StrEMsg:=StrEMsg+E.Message;
        end
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data','User Group Tree Menu',MB_OK or MB_ICONINFORMATION);
        RefreshUser;
      end else begin
        Main.TransRollback;
        Simpan.Enabled:=True;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'User Group Tree Menu',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    Qry.Destroy;
  end;
  Init;
  Input(true);
  if Main.IsFormOpen('UserGroupTreeMenuList') then begin
//    UserGroupTreeMenuList.Cari.Text:='';
//    UserGroupTreeMenuList.LoadData;
//    UserGroupTreeMenuList.RefreshList;
  end;
  //if IsOk then Close;
end;

procedure TUserTreeMenuForm.UsernameChange(Sender: TObject);
begin
  RefreshMenu;
  RefreshCombo;
  SubMenu.Clear;
  SubMenu.Text:='';
  TreeMenu.Clear;
  TreeMenu.Text:='';
end;

procedure TUserTreeMenuForm.UsernameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Menu.SetFocus;
end;

procedure TUserTreeMenuForm.MenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then SubMenu.SetFocus;
end;

procedure TUserTreeMenuForm.SubMenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TreeMenu.SetFocus;
end;

procedure TUserTreeMenuForm.TreeMenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then AllSBU.SetFocus;
end;

procedure TUserTreeMenuForm.ActiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TUserTreeMenuForm.SunKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TUserTreeMenuForm.FromDatesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then ToDates.SetFocus;
end;

procedure TUserTreeMenuForm.ToDatesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then FromTimes.SetFocus;
end;

procedure TUserTreeMenuForm.FromTimesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then ToTimes.SetFocus;
end;

procedure TUserTreeMenuForm.ToTimesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Mon.SetFocus;
end;

procedure TUserTreeMenuForm.MonKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tue.SetFocus;
end;

procedure TUserTreeMenuForm.TueKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Wed.SetFocus;
end;

procedure TUserTreeMenuForm.WedKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Thu.SetFocus;
end;

procedure TUserTreeMenuForm.ThuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Fri.SetFocus;
end;

procedure TUserTreeMenuForm.FriKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Sat.SetFocus;
end;

procedure TUserTreeMenuForm.SatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Sun.SetFocus;
end;

procedure TUserTreeMenuForm.DefaultClick(Sender: TObject);
begin
  if Default.Checked=True then begin
    PanelSetTime.Enabled:=False;
  end else begin
    PanelSetTime.Enabled:=True;
  end;
end;

procedure TUserTreeMenuForm.AllSBUClick(Sender: TObject);
begin
  if AllSBU.Checked then SBU.Enabled:=False
  else SBU.Enabled:=True;
end;

procedure TUserTreeMenuForm.SBUKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Default.SetFocus;
end;

procedure TUserTreeMenuForm.btnClearClick(Sender: TObject);
begin
  Init;
  RefreshUser;
  UsernameChange(Nil);
  RefreshCombo;
  LabelUserTreeMenuId.Visible:=False;
  UserTreeMenuId.Visible:=False;
  Active.Visible:=False;
  LabelActive.Visible:=False;
  Simpan.Enabled:=True;
//  if IsView then Input(False)
//  else Input(True);
end;

end.
