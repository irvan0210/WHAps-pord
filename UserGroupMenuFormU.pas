unit UserGroupMenuFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TUserGroupMenuForm = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    GroupMenuId: TEdit;
    GroupInput: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Active: TCheckBox;
    Label3: TLabel;
    UserGroup: TComboBox;
    Menu: TComboBox;
    Simpan: TButton;
    Batal: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UserGroupChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UserGroupKeyPress(Sender: TObject; var Key: Char);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshUserGroup;
    procedure RefreshMenu;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;UserGrpMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserGroupMenuForm: TUserGroupMenuForm;
  UserGroupArr,MenuArr:Array of TArrString4;
  StrLastMenuId,StrLastMenu:String;
  UserGrpMenuId:String;
  IsView:Boolean;

implementation

uses MainU, ADODB, UserGroupMenuListU;

{$R *.dfm}

Constructor TUserGroupMenuForm.Create(AOwner:TComponent;UserGrpMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  UserGrpMenuId:=UserGrpMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserGroupMenuForm.Init;
begin
  GroupMenuId.Text:='';
  Menu.Text:='';
  Menu.Clear;
  Active.Checked:=False;
end;

procedure TUserGroupMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TUserGroupMenuForm.RefreshUserGroup;
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

procedure TUserGroupMenuForm.RefreshMenu;
var Qry:TADOQuery;
    StrQry,StrUserGroupId:String;
    IntCount:Integer;
begin
  Menu.Text:='';
  Menu.Clear;
  SetLength(MenuArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(UserGroupArr)-1 do
    if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu a LEFT JOIN wh_user_grp_menu b ON ( b.menu_id=a.menu_id AND'+
            ' b.user_group_id='+Chr(39)+StrUserGroupId+Chr(39)+') WHERE (b.user_grp_menu_id IS NULL)'+
            ' ;' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      SetLength(MenuArr,Qry.RecordCount);
      while not(Qry.Eof) do begin
        MenuArr[IntCount][0]:=Qry.FieldValues['menu_id'];
        MenuArr[IntCount][1]:=Qry.FieldValues['menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  if UserGrpMenuId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenuId;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(MenuArr)-1 do
    Menu.Items.Add(MenuArr[IntCount][1]);
end;

procedure TUserGroupMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrUserGroupId:String;
    IntCount:Integer;
begin
  GroupMenuId.Text:=UserGrpMenuId;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_grp_menu a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id'+
            ' INNER JOIN wh_menu c ON c.menu_id=a.menu_id'+
            ' WHERE user_grp_menu_id='+Chr(39)+UserGrpMenuId+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
       UserGroup.ItemIndex:=UserGroup.Items.IndexOf(Qry.FieldValues['group_name']);
       StrLastMenuId:=Qry.FieldValues['menu_id'];
       StrLastMenu:=Qry.FieldValues['menu'];
       Active.Checked:=Qry.FieldValues['active'];
    end;
    Qry.Close;
    Main.CloseDb;
    RefreshMenu;
    Menu.ItemIndex:=Menu.Items.IndexOf(StrLastMenu);
  end;
  Qry.Destroy;

end;

procedure TUserGroupMenuForm.FormShow(Sender: TObject);
begin
  Init;
  if UserGrpMenuId<>'' then begin
    RefreshUserGroup;
    LoadData;
  end else
    RefreshUserGroup;
  if IsView then Input(False)
  else Input(True);
end;

procedure TUserGroupMenuForm.UserGroupChange(Sender: TObject);
begin
  RefreshMenu;
end;

procedure TUserGroupMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrUserGroupId,StrMenuId,StrActive:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(UserGroup.Text)<>'') and (Trim(Menu.Text)<>'') then begin
    StrEMsg:='';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    for IntCount:=0 to Length(UserGroupArr)-1 do
      if UserGroupArr[IntCount][1]=UserGroup.Text then StrUserGroupId:=UserGroupArr[IntCount][0];
    for IntCount:=0 to Length(MenuArr)-1 do
      if MenuArr[IntCount][1]=Menu.Text then StrMenuId:=MenuArr[IntCount][0];
    if Active.Checked then StrActive:='1' else StrActive:='0';
    if Main.OpenDb then begin
      Simpan.Enabled:=False;
      Main.TransStart;
      if UserGrpMenuId<>'' then begin
        StrQry:='DELETE FROM wh_user_grp_menu WHERE user_grp_menu_id='+Chr(39)+UserGrpMenuId+Chr(39)+';';
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
      StrQry:='INSERT INTO wh_user_grp_menu (user_grp_menu_id,user_group_id,menu_id,active)'+
              'VALUES ('+Chr(39)+StrUserGroupId+StrMenuId+Chr(39)+','+Chr(39)+StrUserGroupId+Chr(39)+
              ','+Chr(39)+StrMenuId+Chr(39)+','+Chr(39)+StrActive+Chr(39)+');';
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
        MessageBox(0,'Berhasil menyimpan data','User Group Menu',MB_OK or MB_ICONINFORMATION);
        Init;
        RefreshUserGroup;
        Simpan.Enabled:=True;
      end else begin
        Main.TransRollback;
        Simpan.Enabled:=True;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'User Group Menu',MB_OK or MB_ICONERROR);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  if Main.IsFormOpen('UserGroupMenuList') then begin
    UserGroupMenuList.LoadData;
    UserGroupMenuList.RefreshList;
  end;
//  if IsOk then UserGroupMenuForm.Close;
end;


procedure TUserGroupMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupMenuForm.BatalClick(Sender: TObject);
begin
  UserGroupMenuForm.Close;
end;


procedure TUserGroupMenuForm.UserGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Menu.SetFocus;
end;

procedure TUserGroupMenuForm.MenuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TUserGroupMenuForm.ActiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
