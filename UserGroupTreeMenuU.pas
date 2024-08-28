unit UserGroupTreeMenuU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TUserGroupTreeMenuForm = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    GroupTreeMenuId: TEdit;
    GroupInput: TPanel;
    Active: TCheckBox;
    UserGroup: TComboBox;
    TreeMenu: TComboBox;
    Simpan: TButton;
    Batal: TButton;
    Menu: TComboBox;
    Label5: TLabel;
    SubMenu: TComboBox;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuChange(Sender: TObject);
    procedure SubMenuChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UserGroupChange(Sender: TObject);
    procedure UserGroupKeyPress(Sender: TObject; var Key: Char);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure SubMenuKeyPress(Sender: TObject; var Key: Char);
    procedure TreeMenuKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshUserGroup;
    procedure RefreshMenu;
    procedure RefreshSubMenu;
    procedure RefreshTreeMenu;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;UserGrpTreeMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserGroupTreeMenuForm: TUserGroupTreeMenuForm;
  UserGroupArr,TreeMenuArr,MenuArr,SubMenuArr:Array of TArrString4;
  StrLastTreeMenuId,StrLastTreeMenu,StrLastMenu,StrLastSubMenu:String;
  UserGrpTreeMenuId:String;
  IsView:Boolean;

implementation

uses MainU, ADODB, UserGroupTreeMenuListU;

{$R *.dfm}

Constructor TUserGroupTreeMenuForm.Create(AOwner:TComponent;UserGrpTreeMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  UserGrpTreeMenuId:=UserGrpTreeMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserGroupTreeMenuForm.Init;
begin
  GroupTreeMenuId.Text:='';
  TreeMenu.Text:='';
  TreeMenu.Clear;
  Menu.Text:='';
  Menu.Clear;
  SubMenu.Text:='';
  SubMenu.Clear; 
  Active.Checked:=False;
end;

procedure TUserGroupTreeMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TUserGroupTreeMenuForm.RefreshUserGroup;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  UserGroup.Text:='';
  UserGroup.Clear;
  SetLength(UserGroupArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_group WHERE active=1 ORDER BY group_name';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserGroupArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserGroupArr[IntCount][0]:=Qry.FieldValues['user_group_id'];
        UserGroupArr[IntCount][1]:=Qry.FieldValues['group_name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(UserGroupArr)-1 do
    UserGroup.Items.Add(UserGroupArr[IntCount][1]);
end;

procedure TUserGroupTreeMenuForm.RefreshTreeMenu;
var Qry:TADOQuery;
    StrQry,StrUserGroupId,StrSubMenuId:String;
    IntCount:Integer;
begin
  TreeMenu.Text:='';
  TreeMenu.Clear;
  SetLength(TreeMenuArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(UserGroupArr)-1 do
    if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
  for IntCount:=0 to Length(SubMenuArr)-1 do
    if SubMenuArr[IntCount][1]=SubMenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_tree_sub_menu a LEFT JOIN wh_user_grp_tree_sub_menu b ON ( b.tree_sub_menu_id=a.tree_sub_menu_id AND'+
            ' b.user_group_id='+Chr(39)+StrUserGroupId+Chr(39)+') WHERE (b.user_grp_tree_sub_menu_id IS NULL)'+
            ' AND (sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+');' ;
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
  if UserGrpTreeMenuId<>'' then begin
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

procedure TUserGroupTreeMenuForm.RefreshMenu;
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

procedure TUserGroupTreeMenuForm.RefreshSubMenu;
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

procedure TUserGroupTreeMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrUserGroupId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  GroupTreeMenuId.Text:=UserGrpTreeMenuId;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_grp_tree_sub_menu a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id'+
            ' INNER JOIN wh_tree_sub_menu c ON c.tree_sub_menu_id=a.tree_sub_menu_id'+
            ' INNER JOIN wh_sub_menu d ON d.sub_menu_id=c.sub_menu_id'+
            ' INNER JOIN wh_menu e ON e.menu_id=d.menu_id'+
            ' WHERE user_grp_tree_sub_menu_id='+Chr(39)+UserGrpTreeMenuId+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
       UserGroup.ItemIndex:=UserGroup.Items.IndexOf(Qry.FieldValues['group_name']);
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


procedure TUserGroupTreeMenuForm.FormShow(Sender: TObject);
begin
  Init;
  if UserGrpTreeMenuId<>'' then begin
    RefreshUserGroup;
    LoadData;
  end else
    RefreshUserGroup;
  if IsView then Input(False)
  else Input(True);
end;

procedure TUserGroupTreeMenuForm.BatalClick(Sender: TObject);
begin
  UserGroupTreeMenuForm.Close;
end;

procedure TUserGroupTreeMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupTreeMenuForm.MenuChange(Sender: TObject);
begin
  RefreshSubMenu;
  TreeMenu.Clear;
  TreeMenu.Text:='';
end;

procedure TUserGroupTreeMenuForm.SubMenuChange(Sender: TObject);
begin
  RefreshTreeMenu;
end;

procedure TUserGroupTreeMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrUserGroupId,StrTreeMenuId,StrActive:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(UserGroup.Text)<>'') and (Trim(TreeMenu.Text)<>'') then begin
    StrEMsg:='';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    for IntCount:=0 to Length(UserGroupArr)-1 do
      if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
    for IntCount:=0 to Length(TreeMenuArr)-1 do
      if TreeMenuArr[IntCount][1]=TreeMenu.Text then StrTreeMenuId:=TreeMenuArr[IntCount][0];
    if Active.Checked then StrActive:='1' else StrActive:='0';
    if Main.OpenDb then begin
      Simpan.Enabled:=False;
      Main.TransStart;
      if UserGrpTreeMenuId<>'' then begin
        StrQry:='DELETE FROM wh_user_grp_tree_sub_menu WHERE user_grp_tree_sub_menu_id='+Chr(39)+UserGrpTreeMenuId+Chr(39)+';';
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
      StrQry:='INSERT INTO wh_user_grp_tree_sub_menu (user_grp_tree_sub_menu_id,user_group_id,tree_sub_menu_id,active)'+
              'VALUES ('+Chr(39)+StrUserGroupId+StrTreeMenuId+Chr(39)+','+Chr(39)+StrUserGroupId+Chr(39)+
              ','+Chr(39)+StrTreeMenuId+Chr(39)+','+Chr(39)+StrActive+Chr(39)+');';
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
        Init;
        RefreshUserGroup;
        Simpan.Enabled:=True;
        UserGroup.SetFocus;
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
  if Main.IsFormOpen('UserGroupTreeMenuList') then begin
    //UserGroupTreeMenuList.Cari.Text:=''; 
    UserGroupTreeMenuList.LoadData;
    UserGroupTreeMenuList.RefreshList;
  end;
//  if IsOk then UserGroupTreeMenuForm.Close;
end;

procedure TUserGroupTreeMenuForm.UserGroupChange(Sender: TObject);
begin
  RefreshMenu;
  SubMenu.Clear;
  SubMenu.Text:='';
  TreeMenu.Clear;
  TreeMenu.Text:='';
end;

procedure TUserGroupTreeMenuForm.UserGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Menu.SetFocus;
end;

procedure TUserGroupTreeMenuForm.MenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then SubMenu.SetFocus;
end;

procedure TUserGroupTreeMenuForm.SubMenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TreeMenu.SetFocus;
end;

procedure TUserGroupTreeMenuForm.TreeMenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TUserGroupTreeMenuForm.ActiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
