unit UserSubMenuListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TUserSubMenuList = class(TForm)
    StrGrid: TZColorStringGrid;
    Cari: TEdit;
    Selesai: TButton;
    Label1: TLabel;
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure AskDelete(UserMenulistId:String);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Edit_Type:Integer=0);Overload;
  end;

var
  UserSubMenuList: TUserSubMenuList;
  EditType,IntRow:Integer;
  UserMenuArr:Array of TArrString4;

implementation

uses MainU, ADODB, DB;

{$R *.dfm}
constructor TUserSubMenuList.Create(AOwner:TComponent;Edit_Type:Integer=0);
begin
  EditType:=Edit_Type;
  Inherited Create(AOwner);
end;


procedure TUserSubMenuList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TUserSubMenuList.SelesaiClick(Sender: TObject);
begin
close;
end;

procedure TUserSubMenuList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserSubMenuList.Init;
var IntCount:Integer;
begin
 // IntRow:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=50;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=150;
  StrGrid.ColWidths[4]:=60;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Nama User';
  StrGrid.Cells[2,0]:='Menu';
  StrGrid.Cells[3,0]:='Sub Menu';
  StrGrid.Cells[4,0]:='Status';
  for IntCount:=0 to 4 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserSubMenuList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT um.user_sub_menu_id,um.user_id, us.name,sb.menu_id, m.menu, um.sub_menu_id,  sb.sub_menu,  um.active '+
            'FROM wh_user_sub_menu um  '+
            'LEFT JOIN wh_sub_menu sb ON sb.sub_menu_id=um.sub_menu_id   '+
            'LEFT JOIN wh_menu m ON m.menu_id=sb.menu_id  '+
            'LEFT JOIN wh_user us ON us.username=um.user_id   '+
            'WHERE sb.sub_menu IS not NULL  AND sb.sub_menu <>  '+QuotedStr('-')+
            'ORDER BY us.name, m.menu_id, sb.sub_menu;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
   if Qry.RecordCount>0 then begin
      SetLength(UserMenuArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserMenuArr[IntCount][0]:=Qry.FieldValues['user_sub_menu_id'];
        UserMenuArr[IntCount][1]:=Qry.FieldValues['name'];
        UserMenuArr[IntCount][2]:=Qry.FieldValues['menu'];
        UserMenuArr[IntCount][3]:=Qry.FieldValues['sub_menu'];
        if Qry.FieldValues['active']=1 then UserMenuArr[IntCount][4]:='Active'
        else UserMenuArr[IntCount][4]:='Non Active';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
end;

procedure TUserSubMenuList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(UserMenuArr)+1;
  for IntCount:=0 to Length(UserMenuArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=UserMenuArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=UserMenuArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=UserMenuArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=UserMenuArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=UserMenuArr[IntCount][4];
  end;
end;

procedure TUserSubMenuList.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshList;
end;

procedure TUserSubMenuList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(UserMenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(UserMenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=UserMenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TUserSubMenuList.AskDelete(UserMenulistId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg, cKet:String;
    IsOk:Boolean;
begin
  if (Trim(UserMenulistId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    If StrGrid.Cells[4,IntRow]='Active' then
     cKet := 'Yakin Mau Menonaktifkan ID '
     else
     cKet := 'Yakin Mau Mengaktifkan ID ';
    if MessageBox(0,PChar(cKet+' '+UserMenulistId+' ini ?') ,'User Sub Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        If StrGrid.Cells[4,IntRow]='Non Active' then
          StrQry:='UPDATE wh_user_sub_menu SET  active = 1 WHERE user_sub_menu_id='+Chr(39)+UserMenulistId+Chr(39)+';'
        else
          StrQry:='UPDATE wh_user_sub_menu SET  active = 0 WHERE user_sub_menu_id='+Chr(39)+UserMenulistId+Chr(39)+';';
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
          MessageBox(0,'Berhasil diubah','User Menu',MB_OK or MB_ICONINFORMATION);
          LoadData;
          RefreshList;
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Merubah User Sub Menu '+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Menu',MB_OK or MB_ICONERROR);
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

procedure TUserSubMenuList.StrGridDblClick(Sender: TObject);
begin
 AskDelete(StrGrid.Cells[0,IntRow]);
end;

end.
