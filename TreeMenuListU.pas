unit TreeMenuListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit;

type
  TTreeMenuList = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AskDelete(TreeMenuId:String);
  public
    { Public declarations }
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  TreeMenuList: TTreeMenuList;
  TreeMenuArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, ADODB, StrUtils, TreeMenuFormU;

{$R *.dfm}

procedure TTreeMenuList.Init;
begin
  Cari.Text:=''; 
  InitGrid;
end;

procedure TTreeMenuList.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=250;
  StrGrid.ColWidths[3]:=180;
  StrGrid.Cells[0,0]:='Tree Menu Id';
  StrGrid.Cells[1,0]:='Sub Menu';
  StrGrid.Cells[2,0]:='Tree Menu';
  StrGrid.Cells[3,0]:='Description';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
end;

procedure TTreeMenuList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_tree_sub_menu a INNER JOIN wh_sub_menu b ON b.sub_menu_id=a.sub_menu_id';
    Main.WriteLog('SQL :'+StrQry,4);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(TreeMenuArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      TreeMenuArr[IntCount][0]:=Qry.FieldValues['tree_sub_menu_id'];
      TreeMenuArr[IntCount][1]:=Qry.FieldValues['sub_menu'];
      TreeMenuArr[IntCount][2]:=Qry.FieldValues['tree_menu'];
      if Qry.FieldValues['tree_menu_description']<>NULL then
      TreeMenuArr[IntCount][3]:=Qry.FieldValues['tree_menu_description'];
      if Qry.FieldValues['active']=1 then TreeMenuArr[IntCount][4]:='Active' else TreeMenuArr[IntCount][4]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TTreeMenuList.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(TreeMenuArr)>0 then StrGrid.RowCount:=Length(TreeMenuArr)+1;
  for IntCount:=0 to Length(TreeMenuArr)-1 do begin
    for IntCount2:=0 to 4 do StrGrid.Cells[IntCount2,IntCount+1]:=TreeMenuArr[IntCount][IntCount2];
  end;
end;

procedure TTreeMenuList.AskDelete(TreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(TreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Tree Menu Id '+TreeMenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        StrQry:='DELETE FROM wh_user_grp_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        StrQry:='DELETE FROM wh_user_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
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
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','Tree Sub Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Tree Sub Menu',MB_OK or MB_ICONERROR);
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


procedure TTreeMenuList.SelesaiClick(Sender: TObject);
begin
  TreeMenuList.Close;
end;

procedure TTreeMenuList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTreeMenuList.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshList;
end;

procedure TTreeMenuList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(TreeMenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(TreeMenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=TreeMenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TTreeMenuList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TTreeMenuList.StrGridDblClick(Sender: TObject);
begin
  if (RightStr(IntToStr(TreeTag),2)='04') then TreeMenuForm:=TTreeMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
  else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
  else TreeMenuForm:=TTreeMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;


end.
