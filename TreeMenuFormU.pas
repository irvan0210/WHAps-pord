unit TreeMenuFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid;

type
  TTreeMenuForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    GroupId: TPanel;
    TreeMenuId: TEdit;
    GroupInput: TPanel;
    TreeMenuName: TEdit;
    Description: TEdit;
    Active: TCheckBox;
    SubMenu: TComboBox;
    Menu: TComboBox;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    StrGrid: TZColorStringGrid;
    Bersihkan: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuChange(Sender: TObject);
    procedure SubMenuChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure SubMenuKeyPress(Sender: TObject; var Key: Char);
    procedure TreeMenuNameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshMenu;
    procedure RefreshSubMenu;
    procedure LoadDataGrid;
    procedure RefreshGrid;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;TreeMenuId:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  TreeMenuForm: TTreeMenuForm;
  StrTreeMenuId:String;
  StrLastMenuId,StrLastMenu,StrLastSubMenuId,StrLastSubMenu:String;
  IsView:Boolean;
  SubMenuArr,MenuArr,TreeMenuArr:Array of TArrString4;

implementation

uses MainU, ADODB, StrUtils, TreeMenuListU;

{$R *.dfm}

constructor TTreeMenuForm.Create(AOwner:TComponent;TreeMenuId:String='';IsViewOnly:Boolean=False);
begin
  StrTreeMenuId:=TreeMenuId;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TTreeMenuForm.Init;
begin
  GroupId.Enabled:=False;
  Menu.Clear;
  Menu.Text:='';
  SubMenu.Clear;
  SubMenu.Text:='';
  TreeMenuId.Text:='';
  TreeMenuName.Text:='';
  Description.Text:='';
  Active.Checked:=False;
end;

procedure TTreeMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_tree_sub_menu a '+
            ' INNER JOIN wh_sub_menu b ON b.sub_menu_id=a.sub_menu_id '+
            ' INNER JOIN wh_menu c ON c.menu_id=b.menu_id'+
            ' WHERE tree_sub_menu_id='+StrTreeMenuId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      TreeMenuId.Text:=Qry.FieldValues['tree_sub_menu_id'];
      TreeMenuName.Text:=Qry.FieldValues['tree_menu'];
      if Qry.FieldValues['tree_menu_description']<> NULL then
        Description.Text:=Qry.FieldValues['tree_menu_description'];
      StrLastMenuId:=Qry.FieldValues['menu_id'];
      StrLastMenu:=Qry.FieldValues['menu'];
      StrLastSubMenuId:=Qry.FieldValues['sub_menu_id'];
      StrLastSubMenu:=Qry.FieldValues['sub_menu'];

      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
    Main.CloseDb;
    RefreshMenu;
    Menu.ItemIndex:=Menu.Items.IndexOf(StrLastMenu);
    RefreshSubMenu;
    SubMenu.ItemIndex:=SubMenu.Items.IndexOf(StrLastSubMenu);
    InitGrid;
    LoadDataGrid;
    RefreshGrid;
  end;
  Qry.Destroy;
end;

procedure TTreeMenuForm.RefreshSubMenu;
var Qry:TADOQuery;
    StrQry,StrMenuId:String;
    IntCount:Integer;
begin
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

procedure TTreeMenuForm.RefreshMenu;
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
  for IntCount:=0 to Length(MenuArr)-1 do
    Menu.Items.Add(MenuArr[IntCount][1]);
end;

procedure TTreeMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TTreeMenuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTreeMenuForm.BatalClick(Sender: TObject);
begin
  TreeMenuForm.Close;
end;

procedure TTreeMenuForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshMenu;
  if StrTreeMenuId<>'' then LoadData;
  if IsView then Input(False)
  else Input(True);
end;

procedure TTreeMenuForm.MenuChange(Sender: TObject);
begin
  SubMenu.Clear;
  SubMenu.Text:='';
  InitGrid;
  RefreshSubMenu;
end;

procedure TTreeMenuForm.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[1]:=250;
  StrGrid.ColWidths[2]:=150;
  StrGrid.Cells[0,0]:='Tree Menu Id';
  StrGrid.Cells[1,0]:='Tree Menu';
  StrGrid.Cells[2,0]:='Description';
  StrGrid.Cells[3,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
end;

procedure TTreeMenuForm.LoadDataGrid;
var Qry:TADOQuery;
    StrQry,StrSubMenuId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(SubMenuArr)-1 do
    if SubMenuArr[IntCount][1]=SubMenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_tree_sub_menu WHERE sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(TreeMenuArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      TreeMenuArr[IntCount][0]:=Qry.FieldValues['tree_sub_menu_id'];
      TreeMenuArr[IntCount][1]:=Qry.FieldValues['tree_menu'];
      if Qry.FieldValues['tree_menu_description']<>NULL then
      TreeMenuArr[IntCount][2]:=Qry.FieldValues['tree_menu_description'];
      if Qry.FieldValues['active']=1 then TreeMenuArr[IntCount][3]:='1' else TreeMenuArr[IntCount][3]:='0';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TTreeMenuForm.RefreshGrid;
var IntCount:Integer;
begin
  if Length(TreeMenuArr)>0 then StrGrid.RowCount:=Length(TreeMenuArr)+1
  else StrGrid.RowCount:=2;
  for IntCount:=0 to Length(TreeMenuArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=TreeMenuArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=TreeMenuArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=TreeMenuArr[IntCount][2];
    if TreeMenuArr[IntCount][3]='1' then StrGrid.Cells[3,IntCount+1]:=' Active' else StrGrid.Cells[3,IntCount+1]:=' Disable';
  end;
end;


procedure TTreeMenuForm.SubMenuChange(Sender: TObject);
begin
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
end;

procedure TTreeMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrSubMenuId,StrMaxId,StrSubMenuChange:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(TreeMenuName.Text)<>'') and (Trim(subMenu.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    StrSubMenuChange:=''; 
    for IntCount:=0 to Length(SubMenuArr)-1 do
      if SubMenuArr[IntCount][1]=SubMenu.Text then StrSubMenuId:=SubMenuArr[IntCount][0];
    if Main.OpenDb then begin
      DisableInput;
      StrQry:='SELECT RIGHT(MAX(tree_sub_menu_id),2) AS max_id FROM wh_tree_sub_menu WHERE sub_menu_id='+Chr(39)+StrSubMenuId+Chr(39)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        StrMaxId:=Qry.FieldValues['max_id'];
        StrMaxId:=Format('%.*d',[2,StrToInt(StrMaxId)+1]);
      end else
        StrMaxId:='01';
      if StrLastSubMenuId<>StrSubMenuId then StrSubMenuChange:='tree_sub_menu_id='+QuotedStr(StrSubMenuId+StrMaxId)+',';
      if StrTreeMenuId<>'' then
        StrQry:='UPDATE wh_tree_sub_menu SET '+StrSubMenuChange+
                'sub_menu_id='+QuotedStr(StrSubMenuId)+',tree_menu='+QuotedStr(TreeMenuName.Text)+
                ',tree_menu_description='+QuotedStr(Description.Text)+
                ',active='+IntToStr(IntActive)+
                ' WHERE tree_sub_menu_id='+QuotedStr(StrTreeMenuId)+';'
      else
        StrQry:='INSERT INTO wh_tree_sub_menu (tree_sub_menu_id,sub_menu_id,tree_menu,tree_menu_description,active)'+
                ' VALUES ('+QuotedStr(StrSubMenuId+StrMaxId)+','+QuotedStr(StrSubMenuId)+
                ','+QuotedStr(TreeMenuName.Text)+','+QuotedStr(Description.Text)+
                ','+IntToStr(IntActive)+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Tree Sub Menu';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(Handle,'Berhasil menyimpan Tree Sub Menu','Tree Sub Menu',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      Bersihkan.SetFocus;
    end else begin
      EnableInput;
      MessageBox(Handle,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Tree Sub Menu',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;
  if Main.IsFormOpen('TreeMenuList') then begin
    TreeMenuList.Init;
    TreeMenuList.LoadData;
    TreeMenuList.RefreshList;
  end;
//  if IsOk then TreeMenuForm.Close;
end;

procedure TTreeMenuForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TTreeMenuForm.MenuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SubMenu.SetFocus;
end;

procedure TTreeMenuForm.SubMenuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TreeMenuName.SetFocus;
end;

procedure TTreeMenuForm.TreeMenuNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TTreeMenuForm.DescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TTreeMenuForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshMenu;
  EnableInput;
  Menu.SetFocus;
end;

procedure TTreeMenuForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TTreeMenuForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

end.
