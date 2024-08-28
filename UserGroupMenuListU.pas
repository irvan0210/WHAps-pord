unit UserGroupMenuListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TUserGroupMenuList = class(TForm)
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
    procedure AskDelete(UserGrpMenuId:String);
  public
    { Public declarations }
    procedure LoadData;
    procedure RefreshList;
  end;

var
  UserGroupMenuList: TUserGroupMenuList;
  UserGrpMenuArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, ADODB, Math, UserGroupMenuFormU, StrUtils;

{$R *.dfm}

procedure TUserGroupMenuList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=85;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=50;
  StrGrid.Cells[0,0]:='Usr Grp Menu Id';
  StrGrid.Cells[1,0]:='Group Name';
  StrGrid.Cells[2,0]:='Menu';
  StrGrid.Cells[3,0]:='Status';
  for IntCount:=0 to 3 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserGroupMenuList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_grp_menu a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id'+
            ' INNER JOIN wh_menu c ON c.menu_id=a.menu_id;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserGrpMenuArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserGrpMenuArr[IntCount][0]:=Qry.FieldValues['user_grp_menu_id'];
        UserGrpMenuArr[IntCount][1]:=Qry.FieldValues['group_name'];
        UserGrpMenuArr[IntCount][2]:=Qry.FieldValues['menu'];
        if Qry.FieldValues['active']=1 then UserGrpMenuArr[IntCount][3]:='Active'
        else UserGrpMenuArr[IntCount][3]:='Disable';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;

procedure TUserGroupMenuList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(UserGrpMenuArr)+1;
  for IntCount:=0 to Length(UserGrpMenuArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=UserGrpMenuArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=UserGrpMenuArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=UserGrpMenuArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=UserGrpMenuArr[IntCount][3];
  end;
end;

procedure TUserGroupMenuList.SelesaiClick(Sender: TObject);
begin
  UserGroupMenuList.Close;
end;

procedure TUserGroupMenuList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupMenuList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TUserGroupMenuList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(UserGrpMenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 3 do
      if (StrPos(PChar(UpperCase(UserGrpMenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 3 do
          StrGrid.Cells[Count4,Count2-1]:=UserGrpMenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TUserGroupMenuList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TUserGroupMenuList.StrGridDblClick(Sender: TObject);
begin
  if Main.IsFormOpen('UserGroupMenuForm')=False then
    if (RightStr(IntToStr(TreeTag),2)='04') then UserGroupMenuForm:=TUserGroupMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
    else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
    else UserGroupMenuForm:=TUserGroupMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

procedure TUserGroupMenuList.AskDelete(UserGrpMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(UserGrpMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('User Group Menu Id '+UserGrpMenuId+' Mau Dihapus ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
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
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Menu','User Group Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Group Menu',MB_OK or MB_ICONERROR);
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


end.
