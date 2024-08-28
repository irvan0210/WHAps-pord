unit TxCoDrvRunningDaysU;

interface

uses 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TTxCoDrvRunningDaysRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    Selesai: TButton;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label3: TLabel;
    SBU: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,EmplType,IntCompanyId:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String='BUS';Form_Request:String='');Overload;
  end;

var
  TxCoDrvRunningDaysRpt: TTxCoDrvRunningDaysRpt;

implementation

{$R *.dfm}

Uses MainU, VehicleFormU, EmployeeFormU;


constructor TTxCoDrvRunningDaysRpt.Create(AOwner:TComponent;EmployeeType:String='BUS';Form_Request:String='');
begin
// if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=4;
    IntCompanyId:=2;
// end else begin

  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;


procedure TTxCoDrvRunningDaysRpt.Init;
var IntCount:Integer;
begin
//  Case EmplType of
//    1:Caption:='Laporan Running Days(Mitra)';
//    2:Caption:='Laporan Running Days(Driver)';
//    3:Caption:='';
//  end;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=55;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=32;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Batangan';
  for IntCount:=1 to 31 do begin
    StrGrid.Cells[IntCount+3,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[IntCount+3,0].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to 34 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=4 to 31 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;
end;

procedure TTxCoDrvRunningDaysRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
end;

procedure TTxCoDrvRunningDaysRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan,StrLocationId,StrCompanyId:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,Count4:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=32+(Days-28);
  for Count:=32 to (32+Days-29) do begin
    StrGrid.ColWidths[Count]:=IntColumnWidth;
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  end;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;

  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 7200;
  QAddParam:='';
  StrLocationId:=' AND (b.location_id='+CompanyArr[SBU.ItemIndex][2]+')';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  QStr:='SELECT * FROM wh_employee AS a '+
        ' INNER JOIN wh_empl_mutation AS b ON b.empl_mutation_id=(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation '+
        ' WHERE (employee_id=a.employee_id) AND (from_date<='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_working_schedule AS c ON c.working_schedule_id='+
        '(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE (employee_id=a.employee_id) AND '+
        '(from_date<='+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_vehicle AS d ON d.vehicle_id=c.vehicle_id '+
        ' WHERE (b.employment_type_id='+IntToStr(EmplType)+') AND (a.active=1) '+StrLocationId+' ORDER BY name;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=1;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
  for Count2:=0 to Qry.RecordCount do begin
    for Count3:=0 to 31 do StrGrid.Cells[3+Count3,Count2+1]:='';
  end;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
    StrGrid.Cells[0,Count]:=IntToStr(Count);
    StrGrid.Cells[1,Count]:=Qry.FieldValues['employee_id'];
    StrGrid.Cells[2,Count]:=Qry.FieldValues['name'];
    if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:='';//Qry.FieldValues['body_id'];
    QStr:='EXEC GetEmployeeRunningDays '+QuotedStr(Qry.FieldValues['employee_id'])+
          ',@FromDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
          ',@ToDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan)))+
          ',@isDriver=0;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
//      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:='1';
      for Count4:=Qry2.FieldValues['tgl'] to Qry2.FieldValues['tgl_selesai'] do
        StrGrid.Cells[(3+Count4),Count]:=Qry2.FieldValues['body_id'];
      Qry2.Next;
    end;
    Qry2.Close;
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  Main.M_Normal;
end;


procedure TTxCoDrvRunningDaysRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTxCoDrvRunningDaysRpt.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TTxCoDrvRunningDaysRpt.SelesaiClick(Sender: TObject);
begin
  TxCoDrvRunningDaysRpt.Close;
end;

procedure TTxCoDrvRunningDaysRpt.TahunKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TTxCoDrvRunningDaysRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TTxCoDrvRunningDaysRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;


procedure TTxCoDrvRunningDaysRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTxCoDrvRunningDaysRpt.StrGridDblClick(Sender: TObject);
begin
    if IntCol=1 then begin
      if Main.IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Bus',StrGrid.Cells[IntCol,IntRow],False);
    end;
end;

end.
