unit UserExportFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ExtCtrls, WHUnit;

type
  TUserExportForm = class(TForm)
    GroupInput: TGroupBox;
    UserExportId: TEdit;
    cb_username: TComboBox;
    Label6: TLabel;
    Label5: TLabel;
    cb_menu: TComboBox;
    Simpan: TButton;
    Panel1: TPanel;
    Edit: TButton;
    selesai: TButton;
    Panel2: TPanel;
    StrGrid: TZColorStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Cari: TEdit;
    Tambah: TButton;
    batal: TButton;
    Bersihkan: TButton;
    is_active: TCheckBox;
    Label3: TLabel;
    procedure selesaiClick(Sender: TObject);
    procedure InitGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Init;
    //procedure RefreshSubMenu;
    procedure RefreshUser;
    procedure RefreshMenu;
    procedure cb_menuChange(Sender: TObject);
    procedure cb_menuKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure EnableInput;
    procedure SimpanClick(Sender: TObject);
    procedure RefreshList;
    procedure CariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure AskDelete(UserExportlistId:String);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure EditClick(Sender: TObject);
    procedure TambahClick(Sender: TObject);
    procedure batalClick(Sender: TObject);
    procedure is_activeClick(Sender: TObject);
    procedure cb_usernameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Constructor Create(AOwner:TComponent;UserExport_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  UserExportForm: TUserExportForm;
  StrUserExportId, StrLastMenuId, StrLastMenu, cUsername:String;
  IsView:Boolean;
  UserArr,MenuArr:Array of TArrString4;
  IntRow:Integer; //, nActive

implementation

uses MainU, ADODB, SubMenuListU, SubMenuFormU, UserExportFormListU, Math;

{$R *.dfm}
Constructor TUserExportForm.Create(AOwner:TComponent;UserExport_Id:String='';IsViewOnly:Boolean=False);
begin
  StrUserExportId:=UserExport_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TUserExportForm.selesaiClick(Sender: TObject);
begin
 UserExportForm.Close;
end;

procedure TUserExportForm.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=60;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=70;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Nama User';
  StrGrid.Cells[2,0]:='Menu';
  StrGrid.Cells[3,0]:='Status';
  for IntCount:=0 to 3 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserExportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserExportForm.Init;
begin
  UserExportId.Text:='';
  cb_username.Text:='';
  cb_menu.Text:='';
 // Active.Checked:=False;
end;

procedure TUserExportForm.RefreshUser;
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

procedure TUserExportForm.RefreshMenu;
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
    StrQry:='SELECT * FROM wh_tree_sub_menu WHERE active= 1 '+
            ' and tree_menu <>'+Chr(39)+'-'+Chr(39)+
            ' and isexport = 1 '+
            ' AND tree_sub_menu_id NOT IN(SELECT Form_id FROM wh_user_export '+
                ' WHERE  USER_ID ='+Chr(39)+cUsername+Chr(39)+
                ') ORDER BY tree_menu ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(MenuArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        MenuArr[IntCount][0]:=Qry.FieldValues['tree_sub_menu_id'];
        MenuArr[IntCount][1]:=Qry.FieldValues['tree_menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  cb_menu.Clear;
  if StrUserExportId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenuId;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  for IntCount:=0 to Length(MenuArr)-1 do
  cb_menu.items.Add(MenuArr[IntCount] [1]);
end;

procedure TUserExportForm.cb_menuChange(Sender: TObject);
begin
//  RefreshMenu;
end;

procedure TUserExportForm.cb_menuKeyPress(Sender: TObject; var Key: Char);
begin
 // if Key=#13 then Active.SetFocus;
end;

procedure TUserExportForm.FormShow(Sender: TObject);
begin
GroupInput.Enabled := false;
//RefreshMenu;
RefreshUser;
//Active.Checked := True;
Cari.Text:='';
InitGrid;
is_active.Checked := True;
is_activeClick(sender);
RefreshList;
end;

procedure TUserExportForm.BersihkanClick(Sender: TObject);
begin
 // Init;
 // InitGrid;
  cb_username.ItemIndex := -1;
  cb_menu.ItemIndex := -1;
  RefreshMenu;
  RefreshUser;
  EnableInput;
  cb_username.SetFocus;
end;

procedure TUserExportForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

procedure TUserExportForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry, StrUserId,StrMenuId, StrQryTemp, StrMsg,StrException:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    //if Active.Checked then IntActive:=1 else IntActive:=0;
    IntActive:=1;
    for IntCount:=0 to Length(MenuArr)-1 do
      if MenuArr[IntCount][1]=cb_menu.Text then StrMenuId:=MenuArr[IntCount][0];
    for IntCount:=0 to Length(UserArr)-1 do
      if UserArr[IntCount][2]=cb_username.Text then StrUserId:=UserArr[IntCount][1];
    if Main.OpenDb then
      begin
      StrQryTemp := 'SELECT * FROM wh_user_export WHERE User_id ='
                    +Chr(39)+StrUserId+Chr(39)+' AND form_id='+Chr(39)+StrMenuId+Chr(39)+' ;';
      Qry.SQL.Add(StrQryTemp);
      Qry.Open;
      //MessageBox(0,PChar(Qry.RecordCount),'TES',MB_OK or MB_ICONWARNING);
      if Qry.RecordCount>0 then
         // begin
            StrQry:='UPDATE wh_user_export SET USER_ID='+Chr(39)+StrUserId+Chr(39)+
                    ',form_id='+Chr(39)+StrMenuId+Chr(39)+',active='+IntToStr(IntActive)+
                    ' WHERE user_export_id='+StrGrid.Cells[0,IntRow]+';'

           // MessageBox(0,'Data sudah ada','Menu Export',MB_OK or MB_ICONINFORMATION);
         // end
        else
        //  begin
           // MessageBox(0,PChar(StrUserId),'Menu Export',MB_OK or MB_ICONERROR);
            StrQry:='INSERT INTO dbo.wh_user_export (USER_ID, form_id, active) VALUES'+
                    ' ('+Chr(39)+StrUserId+Chr(39)+','+Chr(39)+StrMenuId+Chr(39)+
                    ','+IntToStr(IntActive)+');';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menambah Menu Export';
              StrException:=E.Message;
            end;
           end;
          if IsOk then
          begin
           MessageBox(0,'Berhasil menyimpan Menu Export','Menu Export',MB_OK or MB_ICONINFORMATION);
            //LoadData;
            is_activeClick(sender);
            RefreshList;
          end
          else
            begin
              MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Sub Menu',MB_OK or MB_ICONERROR);
            end;
            is_activeClick(sender);
            RefreshList;
            //LoadData;
      //  end;
        Qry.Close;
        Main.CloseDb;
        //end;
  GroupInput.Enabled := false;
  cb_username.Clear;
  cb_menu.Clear;
  end;
end;

procedure TUserExportForm.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(UserExportArr)+1;
  for IntCount:=0 to Length(UserExportArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=UserExportArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=UserExportArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=UserExportArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=UserExportArr[IntCount][3];
  end;
end;


procedure TUserExportForm.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
 if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(UserExportArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(UserExportArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=UserExportArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TUserExportForm.StrGridDblClick(Sender: TObject);

begin
  // MessageBox(0,PChar('User Export Menu Id '+StrGrid.Cells[3,IntRow]+' Mau Non Aktifkan ?') ,'User Export',MB_OKCANCEL or MB_ICONINFORMATION);
  // cb_username.ItemIndex := StrToInt(StrGrid.Cells[0,IntRow]);
 //EditClick(sender);
 // AskDelete(StrGrid.Cells[0,IntRow]);
 //is_activeClick(sender);
 //RefreshList;
end;

procedure TUserExportForm.AskDelete(UserExportlistId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg, cKet:String;
    IsOk:Boolean;
begin
  if (Trim(UserExportlistId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    If StrGrid.Cells[3,IntRow]='Active' then
     cKet := 'Yakin Mau Menonaktifkan ID '
     else
     cKet := 'Yakin Mau Mengaktifkan ID ';
    if MessageBox(0,PChar(cKet+' '+UserExportlistId+' ini ?') ,'User Export',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        If StrGrid.Cells[3,IntRow]='Non Active' then
          StrQry:='UPDATE wh_user_export SET  active = 1 WHERE user_export_id='+Chr(39)+UserExportlistId+Chr(39)+';'
        else
          StrQry:='UPDATE wh_user_export SET  active = 0 WHERE user_export_id='+Chr(39)+UserExportlistId+Chr(39)+';';
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
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil diubah','User Export Menu',MB_OK or MB_ICONINFORMATION);
          RefreshList;
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Export Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Export Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      RefreshList;
    end;
  end;

end;

procedure TUserExportForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TUserExportForm.EditClick(Sender: TObject);
{var Qry:TADOQuery;
    StrQry,UserExportlistId, cUsername, StrNamaMenu :String;
    nActive,IntCount:Integer; }
begin
  AskDelete(StrGrid.Cells[0,IntRow]);
  is_activeClick(sender);
  RefreshList;

{  GroupInput.Visible := True;
   UserExportlistId := StrGrid.Cells[0,IntRow];
  if (Trim(UserExportlistId)<>'') then begin
   Qry:=TADOQuery.Create(Self);
   Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then
    begin
      StrQry:='SELECT b.USER_ID, username,name, a.active  FROM wh_user_export a'+
              '  LEFT JOIN wh_user b ON b.username=a.user_id '+
              ' WHERE user_export_id='+StrGrid.Cells[0,IntRow]+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        cUsername := Qry.FieldValues['name'];
        nActive := Qry.FieldValues['active'];
      end;
     Qry.Close;
     Main.CloseDb;
     // for IntCount:=0 to Length(MenuArr)-1 do
     //  if MenuArr[IntCount][1]=cb_menu.Text then StrNamaMenu:=MenuArr[IntCount][0];

     MessageBox(0,PChar('Menu  '+StrNamaMenu+'  ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION);
     cb_username.ItemIndex:= cb_username.Items.IndexOf(cUsername);
    // cb_menu.ItemIndex := nMenu;       '+StrGrid.Cells[2,IntRow]+'
    cb_menu.Text := StrGrid.Cells[2,IntRow];//cb_menu.items.indexof(StrGrid.Cells[2,IntRow]);
    // cb_menu.ItemIndex := nMenu;
     If(nActive=1)then
        Active.Checked := True
     else if (nActive=0)then
      Active.Checked := False;

    // Active.Checked:=Qry.FieldValues['active'];
   // cb_username.ItemIndex := ;
  //  cb_menu.ItemIndex := StrToInt(StrGrid.Cells[2,IntRow]);
  end;
 end; }
end;

procedure TUserExportForm.TambahClick(Sender: TObject);
begin
GroupInput.Enabled := True;
//RefreshMenu;
RefreshUser;
//cb_username.Clear;
//cb_menu.Clear;
end;

procedure TUserExportForm.batalClick(Sender: TObject);
begin
cb_menu.ItemIndex := -1;
cb_username.ItemIndex := -1;
GroupInput.visible := False;
end;

procedure TUserExportForm.is_activeClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if is_active.Checked = False then
      StrQry:='SELECT ux.user_export_id,ux.USER_ID, us.name, ts.tree_menu AS menu_name, ux.active '+
              ' FROM dbo.wh_user_export ux '+
              ' LEFT JOIN dbo.wh_tree_sub_menu ts ON ts.tree_sub_menu_id=ux.form_id'+
              ' LEFT JOIN wh_user us ON us.username=ux.user_id'+
              ' WHERE ux.active =0 AND us.active =1'+
              ' ORDER BY ux.user_export_id DESC;'
           // ' ORDER BY ux.user_export_id, ux.user_id, ts.tree_menu ;'

     else
     StrQry:='SELECT ux.user_export_id,ux.USER_ID, us.name, ts.tree_menu AS menu_name, ux.active '+
              ' FROM dbo.wh_user_export ux '+
              ' LEFT JOIN dbo.wh_tree_sub_menu ts ON ts.tree_sub_menu_id=ux.form_id'+
              ' LEFT JOIN wh_user us ON us.username=ux.user_id'+
              ' WHERE ux.active =1 AND us.active =1'+
              ' ORDER BY ux.user_export_id DESC;';
           // ' ORDER BY ux.user_export_id, ux.user_id, ts.tree_menu ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserExportArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserExportArr[IntCount][0]:=Qry.FieldValues['user_export_id'];
        UserExportArr[IntCount][1]:=Qry.FieldValues['name'];
        UserExportArr[IntCount][2]:=Qry.FieldValues['menu_name'];
       // UserExportArr[IntCount][3]:=Qry.FieldValues['active'];
        if Qry.FieldValues['active']=1 then UserExportArr[IntCount][3]:='Active'
        else UserExportArr[IntCount][3]:='Non Active';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  RefreshList;
end;

procedure TUserExportForm.cb_usernameChange(Sender: TObject);
begin
 cb_menu.Clear;
  if cb_username.ItemIndex <> -1 then
    RefreshMenu
  else
    cb_menu.Clear;
end;

end.
