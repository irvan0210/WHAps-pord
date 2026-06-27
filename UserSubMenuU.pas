unit UserSubMenuU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit;

type
  TUserSubMenuForm = class(TForm)
    Batal: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    cb_username: TComboBox;
    cb_menu: TComboBox;
    UserMenuId: TEdit;
    is_active: TCheckBox;
    Simpan: TButton;
    btnClear: TButton;
    Label1: TLabel;
    cb_submenu: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure RefreshUser;
    procedure RefreshMenu;
    procedure RefreshSubMenu;
    procedure FormShow(Sender: TObject);
    procedure cb_usernameChange(Sender: TObject);
    procedure cb_usernameKeyPress(Sender: TObject; var Key: Char);
    procedure cb_menuKeyPress(Sender: TObject; var Key: Char);
    procedure cb_menuChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;UserSubMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserSubMenuForm: TUserSubMenuForm;
  StrUserMenuId,StrLastMenuId,StrLastMenu,
  StrUserSubMenuId,StrLastSubMenuId,StrLastSubMenu,
  cUsername,cMenu :String;
  IsView:Boolean;
  UserArr,MenuArr, SubMenuArr:Array of TArrString4;

implementation

uses MainU, ADODB;

{$R *.dfm}

Constructor TUserSubMenuForm.Create(AOwner:TComponent;UserSubMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  StrUserSubMenuId:=UserSubMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;


procedure TUserSubMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TUserSubMenuForm.BatalClick(Sender: TObject);
begin
close;
end;

procedure TUserSubMenuForm.RefreshUser;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(UserArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT USER_ID, username, name FROM dbo.wh_user WHERE active= 1  ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        UserArr[IntCount][0]:=Qry.FieldValues['USER_ID'];
        UserArr[IntCount][1]:=Qry.FieldValues['username'];
        UserArr[IntCount][2]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  cb_username.Clear;
  for IntCount:=0 to Length(UserArr)-1 do
  begin
  cb_username.items.Add(UserArr[IntCount] [2]);

  end;
end;

procedure TUserSubMenuForm.RefreshMenu;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MenuArr,0);
   for IntCount:=0 to Length(UserArr)-1 do
    if UserArr[IntCount][2]=cb_username.Text then cUsername:=UserArr[IntCount][1];

  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu WHERE active= 1 ORDER BY menu_id ;';
           // ' AND menu_id NOT IN(SELECT menu_id FROM wh_user_menu  '+
           //     ' WHERE  USER_ID ='+Chr(39)+cUsername+Chr(39)+
           //     ') ORDER BY menu_id ;';
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
  cb_menu.Clear;
  if StrUserSubMenuId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenu;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  for IntCount:=0 to Length(MenuArr)-1 do
  cb_menu.items.Add(MenuArr[IntCount] [1]);
end;


procedure TUserSubMenuForm.RefreshSubMenu;
var Qry:TADOQuery;
    StrQry, TempStr:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(SubMenuArr,0);
   for IntCount:=0 to Length(MenuArr)-1 do
    if MenuArr[IntCount][1]=cb_menu.Text then cMenu:=MenuArr[IntCount][0];
   for IntCount:=0 to Length(UserArr)-1 do
    if UserArr[IntCount][2]=cb_username.Text then cUsername:=UserArr[IntCount][1];
  // cMenu := '11';
   TempStr := '-';
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_sub_menu WHERE active= 1 '+
            'AND sub_menu <> '+Chr(39)+TempStr+Chr(39)+
            ' AND menu_id ='+Chr(39)+cMenu+Chr(39)+
            ' AND sub_menu_id NOT IN(SELECT sub_menu_id FROM wh_user_sub_menu  '+
                ' WHERE  user_id ='+Chr(39)+cUsername+Chr(39)+') '+
                ' ORDER BY menu_id ;';
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
  cb_submenu.Clear;
  if StrUserSubMenuId<>'' then begin
    SetLength(SubMenuArr,Length(SubMenuArr)+1);
    SubMenuArr[Length(SubMenuArr)-1][0]:=StrLastSubMenuId;
    SubMenuArr[Length(SubMenuArr)-1][1]:=StrLastSubMenu;
  end;
  for IntCount:=0 to Length(SubMenuArr)-1 do
  cb_submenu.items.Add(SubMenuArr[IntCount] [1]);
end;



procedure TUserSubMenuForm.FormShow(Sender: TObject);
begin
RefreshUser;
is_active.Enabled := False;
is_active.Checked := True;
end;

procedure TUserSubMenuForm.cb_usernameChange(Sender: TObject);
begin
 cb_menu.Clear;
  if cb_username.ItemIndex <> -1 then
    RefreshMenu
  else
    cb_menu.Clear;
end;

procedure TUserSubMenuForm.cb_usernameKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then cb_menu.SetFocus;
end;

procedure TUserSubMenuForm.cb_menuKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then cb_submenu.SetFocus;
end;

procedure TUserSubMenuForm.cb_menuChange(Sender: TObject);
begin
 cb_submenu.Clear;
  if cb_menu.ItemIndex <> -1 then
    RefreshSubMenu
  else
    cb_submenu.Clear;
end;

procedure TUserSubMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry, StrUserId,StrMenuId,StrSubMenuId, StrQryTemp, StrMsg,StrException:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
if (cb_username.Text ='') or (cb_menu.Text ='') or (cb_submenu.Text ='') then
  begin
     MessageBox(0,'Username dan menu tidak boleh kosong..!','User Sub Menu',MB_OK or MB_ICONWARNING);
  end
 else
  begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IntActive:=1;
    for IntCount:=0 to Length(UserArr)-1 do
      if UserArr[IntCount][2]=cb_username.Text then StrUserId:=UserArr[IntCount][1];
   // for IntCount:=0 to Length(MenuArr)-1 do
   //   if MenuArr[IntCount][1]=cb_menu.Text then StrMenuId:=MenuArr[IntCount][0];
    for IntCount:=0 to Length(SubMenuArr)-1 do
      if SubMenuArr[IntCount][1]=cb_submenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
    if Main.OpenDb then
      begin
      StrQryTemp := 'SELECT * FROM wh_user_sub_menu WHERE User_id ='
                    +Chr(39)+StrUserId+Chr(39)+' AND sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+
                    //'AND '+
                    ' ;';
      Qry.SQL.Add(StrQryTemp);
      Qry.Open;
      if Qry.RecordCount>0 then
          begin
            StrQry:='UPDATE wh_user_sub_menu SET active= 1 '+
                    //'SET USER_ID='+Chr(39)+StrUserId+Chr(39)+
                    //',sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+',active= 1'+//IntToStr(IntActive)+
                    ' WHERE user_sub_menu_id='+Qry.FieldValues['user_sub_menu_id']+';'
          end
        else

        //  begin
            StrQry:='INSERT INTO dbo.wh_user_sub_menu (USER_ID, sub_menu_id, active) VALUES'+
                    ' ('+Chr(39)+StrUserId+Chr(39)+','+Chr(39)+StrSubMenuId+Chr(39)+
                    ','+IntToStr(IntActive)+');';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menambah User Sub Menu';
              StrException:=E.Message;
            end;
           end;
          if IsOk then
          begin
           MessageBox(0,'Berhasil menyimpan User Sub Menu','User Sub Menu',MB_OK or MB_ICONINFORMATION);
          end
          else
            begin
              MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'User Sub Menu',MB_OK or MB_ICONERROR);
            end;
        Qry.Close;
        Main.CloseDb;
        //end;
     cb_username.Clear;
     cb_menu.Clear;
     cb_submenu.Clear;
     RefreshUser;
     end;
  end;
end;
procedure TUserSubMenuForm.btnClearClick(Sender: TObject);
begin
cb_username.Items.Clear;
cb_menu.Items.Clear;
cb_submenu.Items.Clear;
RefreshUser;
RefreshMenu;
RefreshSubMenu;
end;

end.
