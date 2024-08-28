unit PartGroupListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit;

type
  TPartGroupList = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    { Private declarations }
  public
    procedure LoadData;
    procedure RefreshGrid;
    { Public declarations }
  end;

var
  PartGroupList: TPartGroupList;
  PartGroupArr:Array of TArrString5;
  IntRow,IntCol:Integer;

implementation

uses MainU, PartGroupFormU, StrUtils;

{$R *.dfm}

procedure TPartGroupList.Init;
begin
  Cari.Text:='';
end;

procedure TPartGroupList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Group';
  StrGrid.Cells[2,0]:='Tipe';
  StrGrid.Cells[3,0]:='Nama Group';
  StrGrid.Cells[4,0]:='Group Armada';
  StrGrid.Cells[5,0]:='Vhc Mod';
  StrGrid.Cells[6,0]:='GP Reference';
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=140;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=140;
  StrGrid.ColWidths[5]:=45;
  StrGrid.ColWidths[6]:=120;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
end;

procedure TPartGroupList.RefreshCombo;
begin

end;

procedure TPartGroupList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
{    StrQry:='SELECT a.name AS group_name,b.name AS type_name,a.vehicle_module AS group_vehicle_module'+
            ',a.gp_reference_id AS group_gp_reference_id,* FROM wh_part_group a '+
            ' LEFT JOIN wh_part_type b ON b.part_type_id=a.part_type_id '+
            ' LEFT JOIN wh_vehicle_type c ON c.vehicle_type_id=a.vehicle_type_id '+
            ' WHERE a.active=1;';
}
    StrQry:='EXEC GetPartGroupList;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartGroupArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartGroupArr[IntCount][0]:=Qry.FieldValues['part_group_id'];
      PartGroupArr[IntCount][1]:=Qry.FieldValues['type_name'];
      PartGroupArr[IntCount][2]:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['brand']<>NULL then PartGroupArr[IntCount][3]:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type']
      else PartGroupArr[IntCount][3]:='';
      if Qry.FieldValues['group_vehicle_module']='1' then PartGroupArr[IntCount][4]:='v' else PartGroupArr[IntCount][4]:='' ;
      if Qry.FieldValues['group_gp_reference_id']<>NULL then PartGroupArr[IntCount][5]:=Qry.FieldValues['group_gp_reference_id']
      else PartGroupArr[IntCount][5]:='';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPartGroupList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PartGroupArr)>0 then StrGrid.RowCount:=Length(PartGroupArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(PartGroupArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PartGroupArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PartGroupArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PartGroupArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PartGroupArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PartGroupArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=PartGroupArr[IntCount][5];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;


procedure TPartGroupList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(PartGroupArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(PartGroupArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[Count4,Count2-1]:=IntToStr(Count2);
          for Count4:=0 to 5 do
            StrGrid.Cells[Count4+1,Count2-1]:=PartGroupArr[Count][Count4];
          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[5,Count2-1].HorizontalAlignment:=taCenter;
          Inc(Count2);
      end;
    end;
  end else begin
    LoadData;
    RefreshGrid;
  end;
end;

procedure TPartGroupList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartGroupList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TPartGroupList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  LoadData;
  RefreshGrid;
end;

procedure TPartGroupList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then begin
          if Main.IsFormOpen('PartGroupForm')=False then PartGroupForm:=TPartGroupForm.Create(Self,StrGrid.Cells[1,IntRow],False)
          else MessageBox(0,'Tutup Part Group terlebih dahulu','List Part Group',MB_OK or MB_ICONERROR);
      end else begin
          if Main.IsFormOpen('PartGroupForm')=False then PartGroupForm:=TPartGroupForm.Create(Self,StrGrid.Cells[1,IntRow])
          else MessageBox(0,'Tutup Part Group terlebih dahulu','List Part Group',MB_OK or MB_ICONERROR);
      end;
  end;
end;

procedure TPartGroupList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TPartGroupList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then StrGridDblClick(Nil); 
end;

procedure TPartGroupList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close; 
end;

end.
