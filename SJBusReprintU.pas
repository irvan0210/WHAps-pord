unit SJBusReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit;

type
  TSJBusReprint = class(TForm)
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
    SPJArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid:Integer;
    FormRequest:String;
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Is_All:Integer=0);Overload;

  end;

var
  SJBusReprint:TSJBusReprint;

implementation

uses MainU, SPJFormBusU;

{$R *.dfm}

constructor TSJBusReprint.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Is_All:Integer=0);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TSJBusReprint.Init;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  MinRowGrid:=0; 
  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='ID Pengemudi';
  GridSPJ.Cells[3,0]:='Pengemudi';
  GridSPJ.Cells[4,0]:='Tanggal';
  GridSPJ.Cells[5,0]:='Jam';
  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.Cells[IntCount,1]:='';
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetVhcOutList '+LocationId+',1,2; ';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  IntCount:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
     SetLength(SPJArr,IntCount+1);
     SPJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
     SPJArr[IntCount][1]:=Qry.FieldValues['body_id'];
     SPJArr[IntCount][2]:=Qry.FieldValues['license_plate'];
     SPJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
     SPJArr[IntCount][4]:=Qry.FieldValues['name'];
     SPJArr[IntCount][5]:=Qry.FieldValues['from_dates'];
     SPJArr[IntCount][6]:=Qry.FieldValues['from_time'];
     Inc(IntCount);
    Qry.Next;
  end;
  Qry.Close;
  GridSPJ.RowCount:=Length(SPJArr)+1;
  for IntCount:=0 to Length(SPJArr)-1 do begin
    GridSPJ.Cells[0,IntCount+1]:=SPJArr[IntCount][0];
    GridSPJ.Cells[1,IntCount+1]:=SPJArr[IntCount][1];
    GridSPJ.Cells[2,IntCount+1]:=SPJArr[IntCount][3];
    GridSPJ.Cells[3,IntCount+1]:=SPJArr[IntCount][4];
    GridSPJ.Cells[4,IntCount+1]:=SPJArr[IntCount][5];
    GridSPJ.Cells[5,IntCount+1]:=SPJArr[IntCount][6];
  end;
  Main.MyConnection.Close;
end;

procedure TSJBusReprint.SelesaiClick(Sender: TObject);
begin
  SJBusReprint.Close;
end;

procedure TSJBusReprint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSJBusReprint.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TSJBusReprint.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSJBusReprint.GridSPJDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridSPJ.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,GridSPJ.Cells[0,IntRow],False);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,GridSPJ.Cells[0,IntRow],True);
        Close;
      end;
      if UpperCase(FormRequest)='SJ-CREATE' then  begin
        SPJFormBus.RePrint(GridSPJ.Cells[0,IntRow]);
        Close;
      end;
//    if UpperCase(FormRequest)='RESERVED-CREATE' then  begin
//      BookingForm.SetOrderId(StrGrid.Cells[0,IntRow]);
//      OrderList.Close;
//    end;
    end;
  end;
end;

end.
