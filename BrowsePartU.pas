unit BrowsePartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ADODB;

type
  TBrowsePart = class(TForm)
    btnTombolCari: TSpeedButton;
    Label1: TLabel;
    ToXCel: TSpeedButton;
    StrGrid: TZColorStringGrid;
    Button1: TButton;
    Cari: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure btnTombolCariClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString10;
    IntRow,IsAll,IsBlok,MinRowGrid:Integer;
    Initiation:Boolean;
  public
    { Public declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  BrowsePart: TBrowsePart;
  BrowsePartVehicleId:string;

implementation

uses MainU, ServiceRequestFormU, PartU;

{$R *.dfm}
constructor TBrowsePart.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TBrowsePart.Init;
begin
  Cari.Text:='';
end;

procedure TBrowsePart.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=7;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=450;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Part GP';
  StrGrid.Cells[2,0]:='Nama Part';
  StrGrid.Cells[3,0]:='KM Standard Pergantian';
  StrGrid.Cells[4,0]:='KM Terakhir Ganti';
  StrGrid.Cells[5,0]:='Tanggal Terakhir Ganti';

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TBrowsePart.RefreshData;
var Qry:TADOQuery;
    StrQry,StrReq:String;
    IntCount:Integer;
begin

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;

  if Main.OpenDb then begin
    SetLength(WorkOrderArr,0);

    if Cari.Text<>'' then begin
      StrReq:='  AND (a.name LIKE ''%'+Cari.Text+'%'') '
    end else begin
      StrReq:='';
    end;

    StrQry:='SELECT a.*,(SELECT TOP 1 bb.odo_in  '+
            'FROM wh_work_order_part aa '+
            'LEFT JOIN wh_work_order bb ON aa.work_order_id=bb.work_order_id '+
            'WHERE bb.status=2 AND aa."status"=1 AND aa.IsUsed=1 '+
            'AND aa.kode_part_gp=a.kode_part_gp '+
            'AND bb.vehicle_id='+QuotedStr(BrowsePartVehicleId)+' '+
            'ORDER BY bb.odo_in DESC) km_terakhir_ganti,  '+
            '(SELECT TOP 1 bb.date_out '+
            'FROM wh_work_order_part aa '+
            'LEFT JOIN wh_work_order bb ON aa.work_order_id=bb.work_order_id  '+
            'WHERE bb.status=2 AND aa.status=1 AND aa.IsUsed=1 '+
            'AND aa.kode_part_gp=a.kode_part_gp '+
            'AND bb.vehicle_id='+QuotedStr(BrowsePartVehicleId)+' '+
            'ORDER BY bb.odo_in DESC) tgl_terakhir_ganti '+
            'from wh_part a WHERE a.status=1 '+StrReq+'Order by a.name';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(WorkOrderArr,IntCount+1);
      WorkOrderArr[IntCount][0]:=IntToStr(IntCount+1);
      WorkOrderArr[IntCount][1]:= Qry.FieldValues['kode_part_gp'] ;
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['name'];
      if Qry.FieldValues['standard_km_replacement']<> NULL then
      WorkOrderArr[IntCount][3]:=SToCurr(Qry.FieldValues['standard_km_replacement']) else WorkOrderArr[IntCount][3]:='0';
      if Qry.FieldValues['km_terakhir_ganti']<> NULL then
      WorkOrderArr[IntCount][4]:=SToCurr(Qry.FieldValues['km_terakhir_ganti']) else WorkOrderArr[IntCount][4]:='0';
      if Qry.FieldValues['tgl_terakhir_ganti']<> NULL then
      WorkOrderArr[IntCount][5]:=Qry.FieldValues['tgl_terakhir_ganti'] else WorkOrderArr[IntCount][5]:='';
      WorkOrderArr[IntCount][6]:=Qry.FieldValues['id_part'];

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBrowsePart.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(WorkOrderArr)-1;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    Application.ProcessMessages;

    StrGrid.Cells[0,IntCount+2]:=WorkOrderArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=WorkOrderArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][6];

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
  end;
end;

procedure TBrowsePart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBrowsePart.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TBrowsePart.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TBrowsePart.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBrowsePart.StrGridDblClick(Sender: TObject);
var
  IntRowCount,rowcount2:Integer;
  kode_part_gp,part:string;
begin
  IntRowCount:=ServiceRequestForm.StrGrid2.RowCount+1;
  ServiceRequestForm.StrGrid2.RowCount:=IntRowCount;
  with ServiceRequestForm do begin
    part:= BrowsePart.StrGrid.Cells[2,IntRow];
    kode_part_gp:= BrowsePart.StrGrid.Cells[1,IntRow];
    rowcount2:=StrGrid2.RowCount;
    StrGrid2.Cells[0,StrGrid2.RowCount-1]:=IntToStr(StrGrid2.RowCount-1);
    StrGrid2.Cells[1,StrGrid2.RowCount-1]:=part;
    StrGrid2.Cells[2,StrGrid2.RowCount-1]:='1';
    StrGrid2.Cells[3,StrGrid2.RowCount-1]:=kode_part_gp;
    StrGrid2.CellStyle[0,StrGrid2.RowCount-1].HorizontalAlignment:=taCenter;
    StrGrid2.CellStyle[1,StrGrid2.RowCount-1].HorizontalAlignment:=taLeftJustify;
    StrGrid2.CellStyle[2,StrGrid2.RowCount-1].HorizontalAlignment:=taCenter;
  end;
  Close;
end;

procedure TBrowsePart.btnTombolCariClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TBrowsePart.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    RefreshData;
    RefreshGrid;
  end
end;

end.
