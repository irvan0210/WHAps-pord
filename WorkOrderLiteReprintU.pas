unit WorkOrderLiteReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit;

type
  TWorkOrderLiteReprint = class(TForm)
    StrGrid: TStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  WorkOrderLiteReprint: TWorkOrderLiteReprint;
  WOArr:Array of TArrString7;

implementation

uses MainU, WorkOrderFormU;

var IntRow:Integer;

{$R *.dfm}

procedure TWorkOrderLiteReprint.SelesaiClick(Sender: TObject);
begin
  WorkOrderLiteReprint.Close;
end;

procedure TWorkOrderLiteReprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderLiteReprint.Init;
begin
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Tanggal';
  StrGrid.Cells[4,0]:='Jam';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
end;

procedure TWorkOrderLiteReprint.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT a.work_order_id,CONVERT(VARCHAR(10),a.date_in,103) AS date_in'+
          ',CONVERT(VARCHAR(5),a.date_in,108) AS time_in'+
          ',REPLACE(REPLACE(a.job_inex_id,1,'+Chr(39)+'Internal'+Chr(39)+'),2,'+
          Chr(39)+'Internal'+Chr(39)+') AS job_inout'+
          ',b.* FROM wh_work_order a'+
          ' LEFT JOIN wh_vehicle b ON b.vehicle_id=a.vehicle_id'+
          ' WHERE date_out IS NULL ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      WOArr[IntCount][3]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][4]:=Qry.FieldValues['time_in'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TWorkOrderLiteReprint.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=1 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount2,IntCount]:='';
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1
  else StrGrid.RowCount:=2;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=Copy(WOArr[IntCount][2],1,1)+' '+Copy(WOArr[IntCount][2],2,4)+
                                ' '+Copy(WOArr[IntCount][2],6,Length(WOArr[IntCount][2])+1);
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][4];
  end;
end;

procedure TWorkOrderLiteReprint.FormShow(Sender: TObject);
begin
  Init;
  RefreshData;
  RefreshGrid;
end;

procedure TWorkOrderLiteReprint.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TWorkOrderLiteReprint.StrGridDblClick(Sender: TObject);
begin
  WorkOrderForm.RePrint(StrGrid.Cells[0,IntRow]);
end;

end.
