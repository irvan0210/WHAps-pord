unit ArgoAllowanceFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit;

type
  TArgoAllowanceForm = class(TForm)
    GroupBox2: TGroupBox;
    LabelId: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    IdKaryawan: TEdit;
    KPPExpired: TEdit;
    Name: TEdit;
    Address: TEdit;
    Birth: TEdit;
    JoinDate: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Year: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
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
  ArgoAllowanceForm: TArgoAllowanceForm;
  EmplId:String;
  IntRow,IntCol:Integer;

implementation

uses MainU,DateUtils;

{$R *.dfm}

constructor TArgoAllowanceForm.Create(AOwner:TComponent;EmployeeId:String);
begin
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;

procedure TArgoAllowanceForm.Init;
begin
  IdKaryawan.Text:='';
  Name.Text:='';
  JoinDate.Text:='';
  KPPExpired.Text:='';
  Birth.Text:='';
  Address.Text:='';
  Year.Text:=FormatDateTime('yyyy',Now());
end;

procedure TArgoAllowanceForm.InitGrid;
var IntCount:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=120;
  StrGrid.ColWidths[13]:=80;
  StrGrid.ColWidths[14]:=80;
  StrGrid.Cells[0,1]:='Argo perBulan';
  StrGrid.Cells[0,2]:='Pendapatan perBulan';
  StrGrid.Cells[13,0]:='Total';
  StrGrid.Cells[14,0]:='Rata-rata';
  StrGrid.CellStyle[0,1].HorizontalAlignment:=taLeftJustify;
  StrGrid.CellStyle[0,2].HorizontalAlignment:=taLeftJustify;
  for IntCount:=1 to 14 do begin
    StrGrid.ColWidths[IntCount]:=70;
    if (IntCount>0) and (IntCount<13) then StrGrid.Cells[IntCount,0]:=LongMonthNames[IntCount];
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[IntCount,1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[IntCount,2].HorizontalAlignment:=taRightJustify;
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.Cells[IntCount,2]:='';
  end;
end;

procedure TArgoAllowanceForm.LoadData;
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
      if Qry.FieldValues['kpp_expired']<>NULL then
        KPPExpired.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['kpp_expired']));
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

procedure TArgoAllowanceForm.LoadDetail;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntTotal,IntDivide:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetYearlyArgo '+QuotedStr(Trim(IdKaryawan.Text))+','+Trim(Year.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntTotal:=0;
    IntDivide:=Qry.RecordCount;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[Qry.FieldValues['months'],1]:=Qry.FieldValues['gross_argo'];
      IntTotal:=IntTotal+SToInt(Qry.FieldValues['gross_argo']);
      Qry.Next;
    end;
    Qry.Close;
    StrGrid.Cells[13,1]:=IToCurr(IntTotal);
    if IntTotal>0 then StrGrid.Cells[14,1]:=IToCurr(Round(IntTotal/IntDivide))
    else StrGrid.Cells[14,1]:='0';
    StrQry:='EXEC GetYearlyCommission '+QuotedStr(Trim(IdKaryawan.Text))+','+Trim(Year.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntTotal:=0;
    IntDivide:=Qry.RecordCount;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[Qry.FieldValues['months'],2]:=Qry.FieldValues['commission'];
      IntTotal:=IntTotal+SToInt(Qry.FieldValues['commission']);
      Qry.Next;
    end;
    Qry.Close;
    StrGrid.Cells[13,2]:=IToCurr(IntTotal);
    if IntTotal>0 then StrGrid.Cells[14,2]:=IToCurr(Round(IntTotal/IntDivide))
    else StrGrid.Cells[14,2]:='0';
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TArgoAllowanceForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TArgoAllowanceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TArgoAllowanceForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  LoadData;
  LoadDetail;
end;

procedure TArgoAllowanceForm.LihatClick(Sender: TObject);
begin
  InitGrid;
  LoadDetail;
end;

end.
