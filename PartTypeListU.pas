unit PartTypeListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB , WHUnit;

type
  TPartTypeList = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
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
  PartTypeList: TPartTypeList;
  PartTypeArr:Array of TArrString5;
  IntRow,IntCol:Integer;

implementation

uses MainU, PartTypeFormU, StrUtils;

{$R *.dfm}

procedure TPartTypeList.Init;
begin
  Cari.Text:='';
end;

procedure TPartTypeList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Type';
  StrGrid.Cells[2,0]:='Nama Type';
  StrGrid.Cells[3,0]:='Vhc Mod';
  StrGrid.Cells[4,0]:='GP Reference';
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=45;
  StrGrid.ColWidths[4]:=120;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
end;

procedure TPartTypeList.RefreshCombo;
begin

end;

procedure TPartTypeList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_part_type WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartTypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartTypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
      PartTypeArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['vehicle_module']='1' then PartTypeArr[IntCount][2]:='v' else PartTypeArr[IntCount][2]:='' ;
      if Qry.FieldValues['gp_reference_id']<>NULL then PartTypeArr[IntCount][3]:=Qry.FieldValues['gp_reference_id']
      else PartTypeArr[IntCount][3]:='';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPartTypeList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PartTypeArr)>0 then StrGrid.RowCount:=Length(PartTypeArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(PartTypeArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PartTypeArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PartTypeArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PartTypeArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PartTypeArr[IntCount][3];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TPartTypeList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartTypeList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartTypeList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  LoadData;
  RefreshGrid;
end;

procedure TPartTypeList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(PartTypeArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(PartTypeArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[Count4,Count2-1]:=IntToStr(Count2);
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4+1,Count2-1]:=PartTypeArr[Count][Count4];
          StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taCenter;
          Inc(Count2);
      end;
    end;
  end else begin
    LoadData;
    RefreshGrid;
  end;

end;

procedure TPartTypeList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TPartTypeList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then begin
          if Main.IsFormOpen('PartTypeForm')=False then PartTypeForm:=TPartTypeForm.Create(Self,StrGrid.Cells[1,IntRow],False)
          else MessageBox(0,'Tutup Part Type terlebih dahulu','List Part Type',MB_OK or MB_ICONERROR);
      end else begin
          if Main.IsFormOpen('PartTypeForm')=False then PartTypeForm:=TPartTypeForm.Create(Self,StrGrid.Cells[1,IntRow])
          else MessageBox(0,'Tutup Part Type terlebih dahulu','List Part Type',MB_OK or MB_ICONERROR);
      end;
  end;
end;

procedure TPartTypeList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then StrGridDblClick(Nil); 
end;

procedure TPartTypeList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close; 
end;

end.
