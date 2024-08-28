unit TxRunningDaysU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ADODB, WHUnit, HTTPApp,
  ZColorStringGrid;

type
  TTxRunningDaysRpt = class(TForm)
    Selesai: TButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Label1: TLabel;
    Bulan: TComboBox;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Batch: TComboBox;
    Tahun: TEdit;
    Label4: TLabel;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    LokasiArr:Array of TArrString2;
    Days,IntColumnWidth,IntRow,IntCol:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  TxRunningDaysRpt: TTxRunningDaysRpt;

implementation

uses MainU, DateUtils, EmployeeFormU;

{$R *.dfm}

procedure TTxRunningDaysRpt.Init;
var Count:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=70;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  Batch.Items.Add('All');
  Batch.Text:='All';
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=32;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=50;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=120;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No KPP';
  StrGrid.Cells[3,0]:='Batangan Mitra';
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

procedure TTxRunningDaysRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
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
    QStr:='SELECT * FROM wh_vhc_batch WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      Batch.Items.Add(Qry.FieldValues['vhc_batch_id']);
      Qry.Next;
    end;
    Qry.Close;
      Main.CloseDb;
  end;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
    Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
    LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
end;

procedure TTxRunningDaysRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3:Integer;
begin
  Main.M_Busy;
  QAddParam:='';
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=32+(Days-28);
  for Count:=32 to (32+Days-29) do
    StrGrid.ColWidths[Count]:=IntColumnWidth;
  Main.MyConnection.Open;
  if Lokasi.Text<>'All' then begin
//    if QAddParam<>'' then QAddParam:=QAddParam+' AND';
    QAddParam:=' AND (b.location_id='+Lokasi.Text+')';
  end;
  if Batch.Text<>'All' then begin
//    if QAddParam<>'' then QAddParam:=QAddParam+' AND';
    QAddParam:=' AND (a.vhc_batch_id='+Batch.Text+')';
  end;
//  if QAddParam<>'' then QAddParam:=' WHERE '+QAddParam;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  QStr:='SELECT * FROM wh_vehicle AS a '+
        ' INNER JOIN wh_vhc_detail AS b ON b.vhc_detail_id=(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail '+
        ' WHERE (vehicle_id=a.vehicle_id) AND (from_date<='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_working_schedule AS c ON c.working_schedule_id='+
        '(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE (vehicle_id=a.vehicle_id) AND '+
        '(from_date<'+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+') ) '+
        ' LEFT JOIN wh_employee AS d ON d.employee_id=c.employee_id '+
        ' WHERE (b.production=1) '+QAddParam+' ORDER BY body_id;';
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
    StrGrid.Cells[1,Count]:=Qry.FieldValues['body_id'];
    if Qry.FieldValues['employee_id']<>NULL then StrGrid.Cells[2,Count]:=Qry.FieldValues['employee_id'];
    if Qry.FieldValues['name']<>NULL then  StrGrid.Cells[3,Count]:=Qry.FieldValues['name'];
    QStr:='SELECT a.vhc_trans_id,CONVERT(VARCHAR(2),a.out_date,103) AS tgl,a.employee_id FROM wh_vhc_trans a'+
          ' WHERE a.vehicle_id='+QuotedStr(Qry.FieldValues['vehicle_id'])+' AND (a.out_date BETWEEN'+
          QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+' AND '+
          QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AwalBulan))))+
          ') AND (a.in_date IS NOT NULL)'+' AND (a.cancel IS NULL) AND (a.vhc_trans_type_id=1);';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
//      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=' 1';
      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['employee_id'];
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

procedure TTxRunningDaysRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTxRunningDaysRpt.SelesaiClick(Sender: TObject);
begin
  TxRunningDaysRpt.Close;
end;

procedure TTxRunningDaysRpt.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TTxRunningDaysRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TTxRunningDaysRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TTxRunningDaysRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TTxRunningDaysRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TTxRunningDaysRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTxRunningDaysRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[IntCol,IntRow]<>'' then
    if Main.IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[IntCol,IntRow]);
end;

end.
