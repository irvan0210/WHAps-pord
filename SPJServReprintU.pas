unit SPJServReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit;

type
  TSPJServReprint = class(TForm)
    GridSPJ: TStringGrid;
    Selesai: TButton;
    procedure FormShow(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSPJDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
  end;

var
  SPJServReprint: TSPJServReprint;
  SPJArr:Array of TArrString14;
  Row:Integer;

implementation

uses MainU,SPJServiceFormU;

{$R *.dfm}

procedure TSPJServReprint.Init;
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
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetVhcOutList '+LocationId+',2; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(SPJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SPJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      SPJArr[Count][1]:=Qry.FieldValues['body_id'];
      SPJArr[Count][2]:=Qry.FieldValues['license_plate'];
      if Qry.FieldValues['employee_id']<>NULL then SPJArr[Count][3]:=Qry.FieldValues['employee_id']
      else if Qry.FieldValues['driver_id']<>NULL then SPJArr[Count][3]:=Qry.FieldValues['driver_id'];
      if Qry.FieldValues['employee_id']<>NULL then SPJArr[Count][4]:=Qry.FieldValues['name'];
      SPJArr[Count][5]:=Qry.FieldValues['out_date'];
      SPJArr[Count][6]:=Qry.FieldValues['out_time'];
      SPJArr[Count][7]:=Qry.FieldValues['out_rits'];
      SPJArr[Count][8]:=Qry.FieldValues['out_drops'];
      SPJArr[Count][9]:=Qry.FieldValues['out_argo_km'];
      SPJArr[Count][10]:=Qry.FieldValues['out_ordo_km'];
      SPJArr[Count][11]:=Qry.FieldValues['rits'];
      SPJArr[Count][12]:=Qry.FieldValues['drops'];
      if Qry.FieldValues['transaction_type_id']<>NULL then SPJArr[Count][13]:=Qry.FieldValues['transaction_type_id'];
      if Qry.FieldValues['gross_commission']<>NULL then SPJArr[Count][14]:=Qry.FieldValues['gross_commission'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  if Length(SPJArr)>0 then GridSPJ.RowCount:=Length(SPJArr)+1 else GridSPJ.RowCount:=2;
  for Count:=0 to Length(SPJArr)-1 do begin
    GridSPJ.Cells[0,Count+1]:=SPJArr[Count][0];
    GridSPJ.Cells[1,Count+1]:=SPJArr[Count][1];
    GridSPJ.Cells[2,Count+1]:=SPJArr[Count][3];
    GridSPJ.Cells[3,Count+1]:=SPJArr[Count][4];
    GridSPJ.Cells[4,Count+1]:=SPJArr[Count][5];
    GridSPJ.Cells[5,Count+1]:=SPJArr[Count][6];
  end;
end;


procedure TSPJServReprint.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TSPJServReprint.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Row:=ARow;
end;

procedure TSPJServReprint.SelesaiClick(Sender: TObject);
begin
  SPJServReprint.Close;
end;

procedure TSPJServReprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJServReprint.GridSPJDblClick(Sender: TObject);
begin
  SPJServiceForm.CetakUlangSPJ(GridSPJ.Cells[0,Row]);
  SPJServReprint.Close;
end;

end.
