unit BusDailyActivityRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit;

type
  TBusDailyActivityRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Selesai: TButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Bulan: TComboBox;
    Batch: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    Label5: TLabel;
    Seat: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,BatchArr,SeatArr:Array of TArrString2;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshSeat;
  public
    { Public declarations }
  end;

var
  BusDailyActivityRpt: TBusDailyActivityRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU;

{$R *.dfm}


procedure TBusDailyActivityRpt.Init;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  StrGrid.WordWrap:=True;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=31+6;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=60;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=30;
  StrGrid.ColWidths[4]:=120;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=40;
  StrGrid.ColWidths[9]:=200;
  StrGrid.ColWidths[10]:=200;
  StrGrid.ColWidths[11]:=200;
  StrGrid.RowHeights[0]:=40;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Seat';
  StrGrid.Cells[4,0]:='Pengemudi';
  StrGrid.Cells[5,0]:='Kenek';
  StrGrid.Cells[6,0]:='Cadangan';
  StrGrid.Cells[8,0]:='Jam';
  StrGrid.Cells[9,0]:='Pemakai/Group';
  StrGrid.Cells[10,0]:='Stand  By';
  StrGrid.Cells[11,0]:='Keterangan';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=1 to 31 do begin
    StrGrid.Cells[3+IntCount,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[3+IntCount,0].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=4 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;
end;

procedure TBusDailyActivityRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 2,1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[IntCount][0]:=Qry.FieldValues['location_id'];
      LokasiArr[IntCount][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    QStr:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(LokasiArr)-1 do Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TBusDailyActivityRpt.RefreshSeat;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail 2,'+BatchArr[Batch.ItemIndex][0]+',1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TBusDailyActivityRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3,IntTotal,IntRunning:Integer;
    IntUsage:Array[1..31] of Integer;
begin
  Main.M_Busy;
  QAddParam:='';
{  IntTotal:=0;
  Main.MyConnection.Open;
  if Lokasi.Text<>'All' then begin
    QAddParam:=QAddParam+' AND (b.location_id='+Lokasi.Text+')';
  end;
  if Batch.Text<>'All' then begin
    QAddParam:=QAddParam+' AND (a.vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+')';
  end;
  if Seat.Text<>'All' then begin
    QAddParam:=QAddParam+' AND (e.seat='+Seat.Text+')';
  end;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  QStr:='SELECT * FROM wh_vehicle AS a '+
        'INNER JOIN wh_vhc_detail AS b ON b.vhc_detail_id=(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail '+
        'WHERE (vehicle_id=a.vehicle_id) AND (from_date<='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') ) '+
        'LEFT JOIN wh_working_schedule AS c ON c.working_schedule_id= '+
        '(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE (vehicle_id=a.vehicle_id) AND '+
        '(from_date<'+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+') ) '+
        'LEFT JOIN wh_employee AS d ON d.employee_id=c.employee_id '+
        'LEFT JOIN wh_vhc_type_detail e ON e.vhc_type_detail_id=a.vhc_type_detail_id '+
        'WHERE (b.production=1) AND (a.company_id=2) AND (a.active=1) '+
        QAddParam+' ORDER BY body_id;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  IntCount:=1;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
  for IntCount2:=0 to Qry.RecordCount-1 do begin
    for IntCount3:=0 to Days+4 do StrGrid.Cells[3+IntCount3,IntCount2+1]:='';
  end;
  IntTotal:=Qry.RecordCount;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
    StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
    StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
    StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
    StrGrid.CellStyle[3,IntCount].BGColor:=clWindow;
    StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
    StrGrid.RowHeights[IntCount]:=62;
    StrGrid.Cells[1,IntCount]:=Qry.FieldValues['body_id']+'         '+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
    if Qry.FieldValues['employee_id']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['employee_id'];
    if Qry.FieldValues['name']<>NULL then  StrGrid.Cells[3,IntCount]:=Qry.FieldValues['name'];
    IntRunning:=0;
    QStr:='EXEC GetRunningDaysDetail '+QuotedStr(Qry.FieldValues['vehicle_id'])+',@FromDate='+
          QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+',@ToDate='+
          QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AwalBulan))))+';';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
      for IntCount2:=Qry2.FieldValues['from_date'] to Qry2.FieldValues['to_date'] do begin
        if StrGrid.Cells[IntCount2+3,IntCount]='' then begin
          StrGrid.Cells[IntCount2+3,IntCount]:=Qry2.FieldValues['customer_order_id'];
          Inc(IntUsage[IntCount2]);
          Inc(IntRunning);
        end else StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  '+Qry2.FieldValues['customer_order_id'];
      end;
      Qry2.Next;
    end;
    StrGrid.Cells[Days+4,IntCount]:=IntToStr(IntRunning);
    StrGrid.Cells[Days+5,IntCount]:=IntToStr(Days-IntRunning);
    StrGrid.Cells[Days+6,IntCount]:=IntToStr(Round((IntRunning/Days)*100))+' %';
    StrGrid.CellStyle[Days+4,IntCount].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[Days+5,IntCount].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[Days+6,IntCount].HorizontalAlignment:=taCenter;
    Qry2.Close;
    Inc(IntCount);
    Qry.Next;
  end;
  Qry.Close;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
  for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[3,StrGrid.RowCount-1]:=' Total Jalan PerHari';
  for IntCount:=1 to Days do begin
    StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(IntUsage[IntCount]);
    StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
  for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[3,StrGrid.RowCount-1]:=' Total Tersedia PerHari';
  For IntCount:=1 to Days do begin
    StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(IntTotal-IntUsage[IntCount]);
    StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
  for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[3,StrGrid.RowCount-1]:=' Persen Jalan PerHari';
  For IntCount:=1 to Days do begin
    StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))+' %';
    StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end;
  Main.MyConnection.Close;
}
  Main.M_Normal;
end;


procedure TBusDailyActivityRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBusDailyActivityRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusDailyActivityRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TBusDailyActivityRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TBusDailyActivityRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TBusDailyActivityRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TBusDailyActivityRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TBusDailyActivityRpt.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
    if Main.IsFormOpen('OrderForm')=False then
      if StrPos(PChar(StrGrid.Cells[IntCol,IntRow]),PChar('  '))=nil then
        OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[IntCol,IntRow],False)
      else
        SelectBooking:=TSelectBooking.Create(Self,StrGrid.Cells[IntCol,IntRow]);

end;
procedure TBusDailyActivityRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshSeat;
  RefreshData;
end;

procedure TBusDailyActivityRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
