unit COAListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ADODB;

type
  TCOAList = class(TForm)
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
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    procedure Refresh;
  end;

var
  COAList: TCOAList;
  COAArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, COAAddU, StrUtils;

{$R *.dfm}

procedure TCOAList.Init;
begin
  Cari.Text:='';
  IntRow:=0;
end;

procedure TCOAList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=400;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='COA';
  StrGrid.Cells[2,0]:='Keterangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 3 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TCOAList.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  SetLength(COAArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCOAList ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount> 0 then
      while not (Qry.Eof) do begin
        SetLength(COAArr,IntCount);
        COAArr[IntCount-1][0]:=Qry.FieldValues['coa_id'];
        COAArr[IntCount-1][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount);
      end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCOAList.RefreshGrid;
var IntCount:Integer;
begin
  for IntCount:=0 to Length(COAArr)-1 do begin
    StrGrid.RowCount:=IntCount+2;
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=COAArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=COAArr[IntCount][1];
  end;
end;

procedure TCOAList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCOAList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCOAList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TCOAList.Refresh;
begin
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TCOAList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(COAArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 16 do
        if (StrPos(PChar(UpperCase(COAArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 16 do
          StrGrid.Cells[Count4,Count2-1]:=COAArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TCOAList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCOAList.StrGridDblClick(Sender: TObject);
begin
  if RightStr(IntToStr(TreeTag),2)='02' then if Main.IsFormOpen('COAAdd')=False then
    COAAdd:=TCOAAdd.Create(Self,StrGrid.Cells[1,IntRow]); 
end;

end.
