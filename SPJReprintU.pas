unit SPJReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit;

type
  TSPJReprint = class(TForm)
    GridSPJ: TStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
  end;

var
  SPJReprint:TSPJReprint;
  SPJArr:Array of TArrString14;
  Row:Integer;

implementation

uses MainU, SPJFormU;

{$R *.dfm}

procedure TSPJReprint.Init;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  GridSPJ.Cells[0,0]:='No SPJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='No KPP';
  GridSPJ.Cells[3,0]:='Mitra';
  GridSPJ.Cells[4,0]:='Tanggal';
  GridSPJ.Cells[5,0]:='Jam';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  QStr:='EXEC GetVhcOutList2 '+LocationId+',1; ';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(SPJArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SPJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
    SPJArr[Count][1]:=Qry.FieldValues['body_id'];
    SPJArr[Count][2]:=Qry.FieldValues['license_plate'];
    SPJArr[Count][3]:=Qry.FieldValues['employee_id'];
    SPJArr[Count][4]:=Qry.FieldValues['name'];
    SPJArr[Count][5]:=Qry.FieldValues['out_date'];
    SPJArr[Count][6]:=Qry.FieldValues['out_time'];
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  GridSPJ.RowCount:=Length(SPJArr)+1;
  for Count:=0 to Length(SPJArr)-1 do begin
    GridSPJ.Cells[0,Count+1]:=SPJArr[Count][0];
    GridSPJ.Cells[1,Count+1]:=SPJArr[Count][1];
    GridSPJ.Cells[2,Count+1]:=SPJArr[Count][3];
    GridSPJ.Cells[3,Count+1]:=SPJArr[Count][4];
    GridSPJ.Cells[4,Count+1]:=SPJArr[Count][5];
    GridSPJ.Cells[5,Count+1]:=SPJArr[Count][6];
  end;
  Main.MyConnection.Close;
end;

procedure TSPJReprint.SelesaiClick(Sender: TObject);
begin
  SPJReprint.Close;
end;

procedure TSPJReprint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJReprint.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TSPJReprint.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Row:=ARow;
end;

procedure TSPJReprint.GridSPJDblClick(Sender: TObject);
begin
  SPJForm.Reprint(GridSPJ.Cells[0,Row]);
  SPJReprint.Close;
end;

end.
