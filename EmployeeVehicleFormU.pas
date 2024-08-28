unit EmployeeVehicleFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit;

type
  TEmployeeVehicleForm = class(TForm)
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Name: TEdit;
    Address: TEdit;
    Birth: TEdit;
    JoinDate: TEdit;
    Label3: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    IdKaryawan: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure LoadDetail;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeId:String);Overload;
  end;

var
  EmployeeVehicleForm: TEmployeeVehicleForm;
  EmplId:String;
  IntRow,IntCol:Integer;

implementation

uses MainU,DateUtils;

{$R *.dfm}

constructor TEmployeeVehicleForm.Create(AOwner:TComponent;EmployeeId:String);
begin
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;

procedure TEmployeeVehicleForm.Init;
begin
  Name.Text:='';
  JoinDate.Text:='';
  Birth.Text:='';
  Address.Text:='';
end;

procedure TEmployeeVehicleForm.InitGrid;
var IntCount:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=140;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=45;
  StrGrid.ColWidths[4]:=40;
  StrGrid.Cells[0,0]:='Pemilik Kendaraan';
  StrGrid.Cells[1,0]:='Alamat';
  StrGrid.Cells[2,0]:='Jenis';
  StrGrid.Cells[3,0]:='Tahun';
  StrGrid.Cells[4,0]:='Pribadi';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,1]:='';
end;

procedure TEmployeeVehicleForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+EmplId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      IdKaryawan.Text:=Qry.FieldValues['employee_id'];
      Name.Text:=Qry.FieldValues['name'];
      if (Qry.FieldValues['birth_town']<>NULL) and (Qry.FieldValues['birth_date']<>NULL) then
        Birth.Text:=Qry.FieldValues['birth_town']+'/'+FormatDateTime('dd-mm-yyyy',StrToDate(Qry.FieldValues['birth_date']));
      if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['join_date']<>NULL then JoinDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['join_date']));
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeVehicleForm.LoadDetail;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmplVehicleList '+QuotedStr(IdKaryawan.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    IntCount:=1;
    Qry.Open;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['name'];
      StrGrid.Cells[1,IntCount]:=Qry.FieldValues['address'];
      StrGrid.Cells[2,IntCount]:=Qry.FieldValues['vehicle'];
      StrGrid.Cells[3,IntCount]:=Qry.FieldValues['year'];
      if Qry.FieldValues['owner']=1 then StrGrid.Cells[4,IntCount]:='Ya' else StrGrid.Cells[4,IntCount]:='Bukan';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TEmployeeVehicleForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeVehicleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeVehicleForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  LoadData;
  LoadDetail;
end;

procedure TEmployeeVehicleForm.LihatClick(Sender: TObject);
begin
  InitGrid;
  LoadDetail;
end;

end.
