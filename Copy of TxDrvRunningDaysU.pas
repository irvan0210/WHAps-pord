unit TxDrvRunningDaysU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TTxDrvRunningDaysRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    Selesai: TButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  TxDrvRunningDaysRpt: TTxDrvRunningDaysRpt;
  LokasiArr:Array of TArrString2;
  Days,IntColumnWidth,IntRow,IntCol:Integer;

implementation

{$R *.dfm}

Uses MainU, VehicleFormU;

procedure TTxDrvRunningDaysRpt.Init;
var Count:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=50;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=32;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=70;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Body Batangan';
  StrGrid.Cells[4,0]:='1';
  StrGrid.Cells[5,0]:='2';
  StrGrid.Cells[6,0]:='3';
  StrGrid.Cells[7,0]:='4';
  StrGrid.Cells[8,0]:='5';
  StrGrid.Cells[9,0]:='6';
  StrGrid.Cells[10,0]:='7';
  StrGrid.Cells[11,0]:='8';
  StrGrid.Cells[12,0]:='9';
  StrGrid.Cells[13,0]:='10';
  StrGrid.Cells[14,0]:='11';
  StrGrid.Cells[15,0]:='12';
  StrGrid.Cells[16,0]:='13';
  StrGrid.Cells[17,0]:='14';
  StrGrid.Cells[18,0]:='15';
  StrGrid.Cells[19,0]:='16';
  StrGrid.Cells[20,0]:='17';
  StrGrid.Cells[21,0]:='18';
  StrGrid.Cells[22,0]:='19';
  StrGrid.Cells[23,0]:='20';
  StrGrid.Cells[24,0]:='21';
  StrGrid.Cells[25,0]:='22';
  StrGrid.Cells[26,0]:='23';
  StrGrid.Cells[27,0]:='24';
  StrGrid.Cells[28,0]:='25';
  StrGrid.Cells[29,0]:='26';
  StrGrid.Cells[30,0]:='27';
  StrGrid.Cells[31,0]:='28';
  StrGrid.Cells[32,0]:='29';
  StrGrid.Cells[33,0]:='30';
  StrGrid.Cells[34,0]:='31';
  for Count:=0 to 34 do
    StrGrid.Cells[Count,1]:='';
  for Count:=4 to 31 do
    StrGrid.ColWidths[Count]:=IntColumnWidth;
end;

procedure TTxDrvRunningDaysRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetLocation 3,1';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  SetLength(LokasiArr,Qry.RecordCount+1);
  LokasiArr[0][0]:='All';
  LokasiArr[0][1]:='All';
  Count:=1;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
    LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
    LokasiArr[Count][1]:=Qry.FieldValues['location'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
end;

procedure TTxDrvRunningDaysRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=32+(Days-28);
  for Count:=32 to (32+Days-29) do
    StrGrid.ColWidths[Count]:=IntColumnWidth;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  QAddParam:='';
  if Lokasi.Text<>'All' then begin
    QAddParam:=' AND (b.location_id='+Lokasi.Text+')';
  end;
  QStr:='SELECT * FROM wh_employee AS a '+
        ' INNER JOIN wh_empl_mutation AS b ON b.empl_mutation_id=(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation '+
        ' WHERE (employee_id=a.employee_id) AND (from_date<='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_working_schedule AS c ON c.working_schedule_id='+
        '(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE (employee_id=a.employee_id) AND '+
        '(from_date<'+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_vehicle AS d ON d.vehicle_id=c.vehicle_id '+
        ' WHERE (b.employment_type_id=1) AND (a.active=1) '+QAddParam+' ORDER BY name;';
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
    if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
    QStr:='SELECT CONVERT(VARCHAR(2),a.out_date,103) AS tgl,b.body_id FROM wh_vhc_trans a'+
          ' LEFT JOIN wh_vehicle b ON b.vehicle_id=a.vehicle_id '+
          ' WHERE employee_id='+QuotedStr(Qry.FieldValues['employee_id'])+' AND (out_date BETWEEN'+
          QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+' AND '+
          QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AkhirBulan))))+
          ') AND (a.in_date IS NOT NULL) AND (a.cancel IS NULL);';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
//      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:='1';
      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['body_id'];
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


procedure TTxDrvRunningDaysRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTxDrvRunningDaysRpt.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TTxDrvRunningDaysRpt.SelesaiClick(Sender: TObject);
begin
  TxDrvRunningDaysRpt.Close;
end;

procedure TTxDrvRunningDaysRpt.TahunKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TTxDrvRunningDaysRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TTxDrvRunningDaysRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TTxDrvRunningDaysRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TTxDrvRunningDaysRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTxDrvRunningDaysRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (StrGrid.Cells[IntCol,IntRow]<>'') then
    if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Taxi','',True,StrGrid.Cells[IntCol,IntRow]);
end;

end.
