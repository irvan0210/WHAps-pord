unit UserGroupTreeMenuListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TUserGroupTreeMenuList = class(TForm)
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure AskDelete(UserGrpTreeMenuId:String);
  public
    { Public declarations }
    procedure LoadData;
    procedure RefreshList;
  end;

var
  UserGroupTreeMenuList: TUserGroupTreeMenuList;
  UserGrpTreeMenuArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, ADODB, UserGroupTreeMenuU, StrUtils;

{$R *.dfm}

procedure TUserGroupTreeMenuList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=60;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=50;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Group Name';
  StrGrid.Cells[2,0]:='Sub Menu';
  StrGrid.Cells[3,0]:='Tree Menu';
  StrGrid.Cells[4,0]:='Status';
  for IntCount:=0 to 4 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserGroupTreeMenuList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_grp_tree_sub_menu a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id'+
            ' INNER JOIN wh_tree_sub_menu c ON c.tree_sub_menu_id=a.tree_sub_menu_id'+
            ' INNER JOIN wh_sub_menu d ON d.sub_menu_id=c.sub_menu_id'+
            ';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserGrpTreeMenuArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserGrpTreeMenuArr[IntCount][0]:=Qry.FieldValues['user_grp_tree_sub_menu_id'];
        UserGrpTreeMenuArr[IntCount][1]:=Qry.FieldValues['group_name'];
        UserGrpTreeMenuArr[IntCount][2]:=Qry.FieldValues['sub_menu'];
        UserGrpTreeMenuArr[IntCount][3]:=Qry.FieldValues['tree_menu'];
        if Qry.FieldValues['active']=1 then UserGrpTreeMenuArr[IntCount][4]:='Active'
        else UserGrpTreeMenuArr[IntCount][4]:='Disable';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;

procedure TUserGroupTreeMenuList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(UserGrpTreeMenuArr)+1;
  for IntCount:=0 to Length(UserGrpTreeMenuArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=UserGrpTreeMenuArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=UserGrpTreeMenuArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=UserGrpTreeMenuArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=UserGrpTreeMenuArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=UserGrpTreeMenuArr[IntCount][4];
  end;
end;

procedure TUserGroupTreeMenuList.AskDelete(UserGrpTreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(UserGrpTreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('User Group Tree Menu Id '+UserGrpTreeMenuId+' Mau Dihapus ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
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
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','User Group Tree Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Group Tree Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;
end;


procedure TUserGroupTreeMenuList.SelesaiClick(Sender: TObject);
begin
  UserGroupTreeMenuList.Close;
end;

procedure TUserGroupTreeMenuList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupTreeMenuList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TUserGroupTreeMenuList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(UserGrpTreeMenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(UserGrpTreeMenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=UserGrpTreeMenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TUserGroupTreeMenuList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TUserGroupTreeMenuList.StrGridDblClick(Sender: TObject);
begin
  if Main.IsFormOpen('UserGroupTreeMenuForm')=False then
    if (RightStr(IntToStr(TreeTag),2)='04') then UserGroupTreeMenuForm:=TUserGroupTreeMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
    else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
    else UserGroupTreeMenuForm:=TUserGroupTreeMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

end.
