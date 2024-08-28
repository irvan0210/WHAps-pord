unit SubMenuFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TSubMenuForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    GroupId: TPanel;
    SubMenuId: TEdit;
    GroupInput: TPanel;
    SubMenuName: TEdit;
    Description: TEdit;
    Active: TCheckBox;
    Label5: TLabel;
    Menu: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure SubMenuNameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshMenu;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;SubMenuId:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  SubMenuForm: TSubMenuForm;
  StrSubMenuId:String;
  StrLastMenuId,StrLastMenu:String;
  IsView:Boolean;
  MenuArr:Array of TArrString4;

implementation

uses MainU, ADODB, SubMenuListU;

{$R *.dfm}

constructor TSubMenuForm.Create(AOwner:TComponent;SubMenuId:String;IsViewOnly:Boolean=False);
begin
  StrSubMenuId:=SubMenuId;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TSubMenuForm.Init;
begin
  GroupId.Enabled:=False;
  Menu.Clear;
  Menu.Text:='';
  SubMenuId.Text:='';
  SubMenuName.Text:='';
  Description.Text:='';
  Active.Checked:=False;
end;

procedure TSubMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_sub_menu a INNER JOIN wh_menu b ON b.menu_id=a.menu_id WHERE sub_menu_id='+StrSubMenuId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SubMenuId.Text:=Qry.FieldValues['sub_menu_id'];
      SubMenuName.Text:=Qry.FieldValues['sub_menu'];
      if Qry.FieldValues['sub_menu_description']<> NULL then
        Description.Text:=Qry.FieldValues['sub_menu_description'];
      StrLastMenuId:=Qry.FieldValues['menu_id'];
      StrLastMenu:=Qry.FieldValues['menu'];
      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
    Main.CloseDb;
    RefreshMenu;
    Menu.ItemIndex:=Menu.Items.IndexOf(StrLastMenu);
  end;
  Qry.Destroy;
end;

procedure TSubMenuForm.RefreshMenu;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
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
  if StrSubMenuId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenuId;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  for IntCount:=0 to Length(MenuArr)-1 do
    Menu.Items.Add(MenuArr[IntCount][1]);
end;

procedure TSubMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;


procedure TSubMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TSubMenuForm.BatalClick(Sender: TObject);
begin
  SubMenuForm.Close;
end;

procedure TSubMenuForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshMenu;
  if StrSubMenuId<>'' then LoadData;
  if IsView then Input(False)
  else Input(True);
end;

procedure TSubMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrMenuId,StrMaxId:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(SubMenuName.Text)<>'') and (Trim(Menu.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    for IntCount:=0 to Length(MenuArr)-1 do
      if MenuArr[IntCount][1]=Menu.Text then StrMenuId:=MenuArr[IntCount][0];
    if Main.OpenDb then begin
      if StrMenuId='19' then
        StrQry:='SELECT RIGHT(MAX(sub_menu_id),2) AS max_id FROM wh_sub_menu WHERE (menu_id='+Chr(39)+StrMenuId+Chr(39)+');'
      else
        StrQry:='SELECT RIGHT(MAX(sub_menu_id),2) AS max_id FROM wh_sub_menu WHERE (menu_id='+Chr(39)+StrMenuId+Chr(39)+') AND (sub_menu_id<1900);';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        StrMaxId:=Qry.FieldValues['max_id'];
        StrMaxId:=Format('%.*d',[2,StrToInt(StrMaxId)+1]);
      end else
        StrMaxId:='01';
      if StrSubMenuId<>'' then
        StrQry:='UPDATE wh_sub_menu SET menu_id='+Chr(39)+StrMenuId+Chr(39)+',sub_menu='+Chr(39)+SubMenuName.Text+Chr(39)+
                ',sub_menu_description='+Chr(39)+Description.Text+Chr(39)+',active='+IntToStr(IntActive)+
                ' WHERE sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+';'
      else
        StrQry:='INSERT INTO wh_sub_menu (sub_menu_id,menu_id,sub_menu,sub_menu_description,active)'+
                ' VALUES ('+Chr(39)+StrMenuId+StrMaxId+Chr(39)+','+Chr(39)+StrMenuId+Chr(39)+
                ','+Chr(39)+SubMenuName.Text+Chr(39)+','+Chr(39)+Description.Text+Chr(39)+','+IntToStr(IntActive)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Sub Menu';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan Sub Menu','Sub Menu',MB_OK or MB_ICONINFORMATION);
      Init;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Sub Menu',MB_OK or MB_ICONERROR);
    end;
  end;
  if Main.IsFormOpen('SubMenuList') then begin
    SubMenuList.Init;
    SubMenuList.LoadData;
    SubMenuList.RefreshList;
  end;
  if IsOk then SubMenuForm.Close;
end;

procedure TSubMenuForm.MenuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SubMenuName.SetFocus;
end;

procedure TSubMenuForm.SubMenuNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TSubMenuForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TSubMenuForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
