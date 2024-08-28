unit MaintenanceGroupListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit;

type
  TMaintenanceGroupList = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    MaintenanceGroupArr:Array of TArrString7;
    IntRow:Integer;
    procedure AskDelete(SubMenuId:String);
  public
    { Public declarations }
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  MaintenanceGroupList: TMaintenanceGroupList;

implementation

uses MainU, ADODB, StrUtils, SubMenuFormU;

{$R *.dfm}

procedure TMaintenanceGroupList.Init;
begin

end;

procedure TMaintenanceGroupList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.ColCount:=7;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=60;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=40;
  StrGrid.ColWidths[3]:=40;
  StrGrid.ColWidths[4]:=40;
  StrGrid.ColWidths[5]:=40;
  StrGrid.ColWidths[6]:=60;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(2,0,3,0);
  StrGrid.MergeCells.AddRectXY(4,0,5,0);
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Servis Berkala';
  StrGrid.Cells[4,0]:='Lama Pekerjaan';
  StrGrid.Cells[2,1]:='KM';
  StrGrid.Cells[3,1]:='Hari';
  StrGrid.Cells[4,1]:='Jam';
  StrGrid.Cells[5,1]:='Hari';
  StrGrid.Cells[6,0]:='Status';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,2]:='';
end;

procedure TMaintenanceGroupList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupList '+CompanyId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MaintenanceGroupArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MaintenanceGroupArr[IntCount][0]:=Qry.FieldValues['maintenance_group_id'];
      MaintenanceGroupArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['use_kilometer']<>NULL then
        MaintenanceGroupArr[IntCount][2]:=IToCurr(Qry.FieldValues['use_kilometer']);
      if Qry.FieldValues['use_days']<>NULL then
        MaintenanceGroupArr[IntCount][3]:=IToCurr(Qry.FieldValues['use_days']);
      if Qry.FieldValues['hours']<>NULL then
        MaintenanceGroupArr[IntCount][4]:=IToCurr(Qry.FieldValues['hours']);
      if Qry.FieldValues['days']<>NULL then
        MaintenanceGroupArr[IntCount][5]:=IToCurr(Qry.FieldValues['days']);
      if Qry.FieldValues['status']=1 then MaintenanceGroupArr[IntCount][6]:='Active' else MaintenanceGroupArr[IntCount][4]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TMaintenanceGroupList.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(MaintenanceGroupArr)>0 then StrGrid.RowCount:=Length(MaintenanceGroupArr)+1
  else StrGrid.RowCount:=3;
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do begin
    for IntCount2:=0 to 6 do StrGrid.Cells[IntCount2,IntCount+2]:=MaintenanceGroupArr[IntCount][IntCount2];
  end;
end;

procedure TMaintenanceGroupList.AskDelete(SubMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(SubMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Sub Menu Id '+SubMenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_sub_menu WHERE sub_menu_id='+Chr(39)+SubMenuId+Chr(39)+';';
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
          MessageBox(0,'Berhasil Menghapus Sub Menu','Sub Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Sub Menu',MB_OK or MB_ICONERROR);
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

procedure TMaintenanceGroupList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  InitGrid;
  LoadData;
  RefreshList;
end;

procedure TMaintenanceGroupList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceGroupList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceGroupList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(MaintenanceGroupArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(MaintenanceGroupArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=MaintenanceGroupArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMaintenanceGroupList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMaintenanceGroupList.StrGridDblClick(Sender: TObject);
begin
  if (RightStr(IntToStr(TreeTag),2)='04') then SubMenuForm:=TSubMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
  else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
  else SubMenuForm:=TSubMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

end.
