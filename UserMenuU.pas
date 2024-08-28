unit UserMenuU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit;

type
  TUserMenuForm = class(TForm)
    Batal: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    cb_username: TComboBox;
    cb_menu: TComboBox;
    UserMenuId: TEdit;
    Simpan: TButton;
    btnClear: TButton;
    is_active: TCheckBox;
    Label3: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshUser;
    procedure cb_usernameChange(Sender: TObject);
    procedure cb_usernameKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshMenu;
    procedure FormShow(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Constructor Create(AOwner:TComponent;UserMenu_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserMenuForm: TUserMenuForm;
  StrUserMenuId,StrLastMenuId, StrLastMenu, cUsername:String;
  IsView:Boolean;
  UserArr,MenuArr:Array of TArrString4;

implementation

uses MainU, ADODB;

{$R *.dfm}

Constructor TUserMenuForm.Create(AOwner:TComponent;UserMenu_Id:String='';IsViewOnly:Boolean=False);
begin
  StrUserMenuId:=UserMenu_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserMenuForm.BatalClick(Sender: TObject);
begin
 close;
end;

procedure TUserMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserMenuForm.RefreshUser;
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
 { if StrUserExportId<>'' then begin
    SetLength(UserArr,Length(UserArr)+1);
    UserArr[Length(UserArr)-1][0]:=StrLastMenuId;
    UserArr[Length(UserArr)-1][1]:=StrLastMenu;
  end;  }
  for IntCount:=0 to Length(UserArr)-1 do
  begin
  cb_username.items.Add(UserArr[IntCount] [2]);
  //cUsername :=UserArr[IntCount][1];

  end;
end;

procedure TUserMenuForm.cb_usernameChange(Sender: TObject);
begin
  cb_menu.Clear;
  if cb_username.ItemIndex <> -1 then
    RefreshMenu
  else
    cb_menu.Clear;
end;

procedure TUserMenuForm.cb_usernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then cb_menu.SetFocus;
end;

procedure TUserMenuForm.RefreshMenu;
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
    StrQry:='SELECT * FROM wh_menu WHERE active= 1 '+
            ' AND menu_id NOT IN(SELECT menu_id FROM wh_user_menu  '+
                ' WHERE  USER_ID ='+Chr(39)+cUsername+Chr(39)+
                ') ORDER BY menu_id ;';
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
  if StrUserMenuId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenuId;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  for IntCount:=0 to Length(MenuArr)-1 do
  cb_menu.items.Add(MenuArr[IntCount] [1]);
end;

procedure TUserMenuForm.FormShow(Sender: TObject);
begin
RefreshUser;
is_active.Checked := True;
end;

procedure TUserMenuForm.btnClearClick(Sender: TObject);
begin
//cb_username.claer;
cb_username.Items.Clear;
cb_menu.Items.Clear;
RefreshUser;
RefreshMenu;
end;

procedure TUserMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry, StrUserId,StrMenuId, StrQryTemp, StrMsg,StrException:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
if (cb_username.Text ='') or (cb_menu.Text ='') then
  begin
     MessageBox(0,'Username dan menu tidak boleh kosong..!','User Menu',MB_OK or MB_ICONWARNING);
  end
 else
  begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IntActive:=1;
    for IntCount:=0 to Length(MenuArr)-1 do
      if MenuArr[IntCount][1]=cb_menu.Text then StrMenuId:=MenuArr[IntCount][0];
    for IntCount:=0 to Length(UserArr)-1 do
      if UserArr[IntCount][2]=cb_username.Text then StrUserId:=UserArr[IntCount][1];
    if Main.OpenDb then
      begin
      StrQryTemp := 'SELECT * FROM wh_user_menu WHERE User_id ='
                    +Chr(39)+StrUserId+Chr(39)+' AND menu_id='+Chr(39)+StrMenuId+Chr(39)+' ;';
      Qry.SQL.Add(StrQryTemp);
      Qry.Open;
      if Qry.RecordCount>0 then
          begin
            StrQry:='UPDATE wh_user_menu SET USER_ID='+Chr(39)+StrUserId+Chr(39)+
                    ',menu_id='+Chr(39)+StrMenuId+Chr(39)+',active='+IntToStr(IntActive)+
                    ' WHERE menu_id='+Qry.FieldValues['user_menu_id']+';'
          end
        else

        //  begin
            StrQry:='INSERT INTO dbo.wh_user_menu (USER_ID, menu_id, active) VALUES'+
                    ' ('+Chr(39)+StrUserId+Chr(39)+','+Chr(39)+StrMenuId+Chr(39)+
                    ','+IntToStr(IntActive)+');';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menambah User Menu';
              StrException:=E.Message;
            end;
           end;
          if IsOk then
          begin
           MessageBox(0,'Berhasil menyimpan User Menu','User Menu',MB_OK or MB_ICONINFORMATION);
          end
          else
            begin
              MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'User Menu',MB_OK or MB_ICONERROR);
            end;
        Qry.Close;
        Main.CloseDb;
        //end;
     cb_username.Clear;
     cb_menu.Clear;
     RefreshUser;
     end;
  end;
end;

end.
