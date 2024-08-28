unit UserGroupSubMenuFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TUserGroupSubMenuForm = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    GroupSubMenuId: TEdit;
    GroupInput: TPanel;
    Active: TCheckBox;
    UserGroup: TComboBox;
    Menu: TComboBox;
    SubMenu: TComboBox;
    Simpan: TButton;
    Batal: TButton;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserGroupChange(Sender: TObject);
    procedure MenuChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UserGroupKeyPress(Sender: TObject; var Key: Char);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure SubMenuKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshUserGroup;
    procedure RefreshMenu;
    procedure RefreshSubMenu;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;UserGrpSubMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserGroupSubMenuForm: TUserGroupSubMenuForm;
  UserGroupArr,MenuArr,SubMenuArr:Array of TArrString4;
  StrLastSubMenuId,StrLastSubMenu,StrLastMenu:String;
  UserGrpSubMenuId:String;
  IsView:Boolean;

implementation

uses MainU, ADODB, UserGroupSubMenuListU;

{$R *.dfm}

Constructor TUserGroupSubMenuForm.Create(AOwner:TComponent;UserGrpSubMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  UserGrpSubMenuId:=UserGrpSubMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserGroupSubMenuForm.Init;
begin
  GroupSubMenuId.Text:='';
  Menu.Text:='';
  Menu.Clear;
  SubMenu.Text:='';
  SubMenu.Clear;
  Active.Checked:=False;
end;

procedure TUserGroupSubMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TUserGroupSubMenuForm.RefreshUserGroup;
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

procedure TUserGroupSubMenuForm.RefreshSubMenu;
var Qry:TADOQuery;
    StrQry,StrUserGroupId,StrMenuId:String;
    IntCount:Integer;
begin
  SubMenu.Text:='';
  SubMenu.Clear;
  SetLength(SubMenuArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(UserGroupArr)-1 do
    if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
  for IntCount:=0 to Length(MenuArr)-1 do
    if MenuArr[IntCount][1]=Menu.Text then StrMenuId:=MenuArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_sub_menu a'+
            ' LEFT JOIN wh_user_grp_sub_menu b ON ( b.sub_menu_id=a.sub_menu_id AND'+
            ' b.user_group_id='+Chr(39)+StrUserGroupId+Chr(39)+')'+
            ' WHERE (menu_id='+Chr(39)+StrMenuId+Chr(39)+') AND (b.user_grp_sub_menu_id IS NULL);';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      SetLength(SubMenuArr,Qry.RecordCount);
      while not(Qry.Eof) do begin
        SubMenuArr[IntCount][0]:=Qry.FieldValues['sub_menu_id'];
        SubMenuArr[IntCount][1]:=Qry.FieldValues['sub_menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  if UserGrpSubMenuId<>'' then begin
    if (Menu.Text=StrLastMenu) then begin
      SetLength(SubMenuArr,Length(SubMenuArr)+1);
      SubMenuArr[Length(SubMenuArr)-1][0]:=StrLastSubMenuId;
      SubMenuArr[Length(SubMenuArr)-1][1]:=StrLastSubMenu;
    end;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(SubMenuArr)-1 do
    SubMenu.Items.Add(SubMenuArr[IntCount][1]);
end;

procedure TUserGroupSubMenuForm.RefreshMenu;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Menu.Text:='';
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

procedure TUserGroupSubMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrUserGroupId:String;
    IntCount:Integer;
begin
  GroupSubMenuId.Text:=UserGrpSubMenuId;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_grp_sub_menu a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id'+
            ' INNER JOIN wh_sub_menu c ON c.sub_menu_id=a.sub_menu_id'+
            ' INNER JOIN wh_menu d ON d.menu_id=c.menu_id'+
            ' WHERE user_grp_sub_menu_id='+Chr(39)+UserGrpSubMenuId+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
       UserGroup.ItemIndex:=UserGroup.Items.IndexOf(Qry.FieldValues['group_name']);
       StrLastSubMenuId:=Qry.FieldValues['sub_menu_id'];
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
  end;
  Qry.Destroy;
end;



procedure TUserGroupSubMenuForm.FormShow(Sender: TObject);
begin
  Init;
  if UserGrpSubMenuId<>'' then begin
    RefreshUserGroup;
    LoadData;
  end else
    RefreshUserGroup;
  if IsView then Input(False)
  else Input(True);
end;

procedure TUserGroupSubMenuForm.BatalClick(Sender: TObject);
begin
  UserGroupSubMenuForm.Close;
end;

procedure TUserGroupSubMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupSubMenuForm.UserGroupChange(Sender: TObject);
begin
  RefreshMenu;
  SubMenu.Text:='';
  SubMenu.Clear;
end;

procedure TUserGroupSubMenuForm.MenuChange(Sender: TObject);
begin
  RefreshSubMenu;
end;

procedure TUserGroupSubMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrUserGroupId,StrSubMenuId,StrActive:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(UserGroup.Text)<>'') and (Trim(SubMenu.Text)<>'') then begin
    StrEMsg:='';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    for IntCount:=0 to Length(UserGroupArr)-1 do
      if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
    for IntCount:=0 to Length(SubMenuArr)-1 do
      if SubMenuArr[IntCount][1]=SubMenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
    if Active.Checked then StrActive:='1' else StrActive:='0';
    if Main.OpenDb then begin
      Simpan.Enabled:=False;
      Main.TransStart;
      if UserGrpSubMenuId<>'' then begin
        StrQry:='UPDATE wh_user_grp_sub_menu SET active='+StrActive+' WHERE user_grp_sub_menu_id='+Chr(39)+UserGrpSubMenuId+Chr(39)+';';
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
      end else begin
        StrQry:='INSERT INTO wh_user_grp_sub_menu (user_grp_sub_menu_id,user_group_id,sub_menu_id,active)'+
                'VALUES ('+Chr(39)+StrUserGroupId+StrSubMenuId+Chr(39)+','+Chr(39)+StrUserGroupId+Chr(39)+
                ','+Chr(39)+StrSubMenuId+Chr(39)+','+Chr(39)+StrActive+Chr(39)+');';
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
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data','User Group Sub Menu',MB_OK or MB_ICONINFORMATION);
        Init;
        RefreshUserGroup;
        Simpan.Enabled:=True;
        UserGroup.SetFocus;
      end else begin
        Main.TransRollback;
        Simpan.Enabled:=True;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'User Group Sub Menu',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    Qry.Destroy;
  end;
  if Main.IsFormOpen('UserGroupSubMenuList') then begin
    UserGroupSubMenuList.LoadData;
    UserGroupSubMenuList.RefreshList;
  end;
  //if IsOk then UserGroupSubMenuForm.Close;
end;

procedure TUserGroupSubMenuForm.UserGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Menu.SetFocus;
end;

procedure TUserGroupSubMenuForm.MenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then SubMenu.SetFocus;
end;

procedure TUserGroupSubMenuForm.SubMenuKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TUserGroupSubMenuForm.ActiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
