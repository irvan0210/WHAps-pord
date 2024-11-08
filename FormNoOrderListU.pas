unit FormNoOrderListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit, ADODB;

type
  TFormNoOrderList = class(TForm)
    StrGrid: TZColorStringGrid;
    Keluar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormShow(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
  private
    { Private declarations }
    VhcId:String;
    procedure Init;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleId:String);Overload;
    procedure LoadData;
    procedure RefreshList;

  end;

var
  FormNoOrderList: TFormNoOrderList;
  NoOrderArr:Array of TArrString4;

implementation

uses MainU;

{$R *.dfm}

constructor TFormNoOrderList.Create(AOwner:TComponent;VehicleId:String);
begin
  VhcId:=VehicleId;
  inherited Create(AOwner);
end;


procedure TFormNoOrderList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormNoOrderList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=4;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=250;
  StrGrid.ColWidths[4]:=200;
  StrGrid.Cells[0,0]:='No Order';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Rute Perjalanan';
  StrGrid.Cells[4,0]:='Tanggal Perjalanan';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;

end;

procedure TFormNoOrderList.FormShow(Sender: TObject);
begin
Init;
LoadData;
RefreshList;
end;

procedure TFormNoOrderList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry :=' EXEC GetNoOrderList '+Chr(39)+VhcId+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(NoOrderArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        NoOrderArr[IntCount][0]:=Qry.FieldValues['customer_order_id'];
        NoOrderArr[IntCount][1]:=Qry.FieldValues['submit_dates'];
        NoOrderArr[IntCount][2]:=Qry.FieldValues['names'];
        NoOrderArr[IntCount][3]:=Qry.FieldValues['route_detail_resume'];
        NoOrderArr[IntCount][4]:=Qry.FieldValues['from_datetime_detail_resume'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;

procedure TFormNoOrderList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(NoOrderArr)+1;
  for IntCount:=0 to Length(NoOrderArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=NoOrderArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=NoOrderArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=NoOrderArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=NoOrderArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=NoOrderArr[IntCount][4];
  end;
end;

procedure TFormNoOrderList.KeluarClick(Sender: TObject);
begin
  close;
end;

end.
