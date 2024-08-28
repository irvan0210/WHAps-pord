unit VehicleEquipmentCheckListRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TVehicleEquipmentCheckListRpt = class(TForm)
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Selesai: TButton;
    Batch: TComboBox;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    Label5: TLabel;
    Seat: TComboBox;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr,VhcEquipmentArr:Array of TArrString8;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid,IntBasicCol:Integer;
    DailyArr:array of TArrString40;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshSeat;
  public
    { Public declarations }
  end;

var
  VehicleEquipmentCheckListRpt: TVehicleEquipmentCheckListRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU;

{$R *.dfm}


procedure TVehicleEquipmentCheckListRpt.Init;
var IntCount:Integer;
begin
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  Tanggal.Date:=Now();
end;

procedure TVehicleEquipmentCheckListRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  IntBasicCol:=5;
  StrGrid.WordWrap:=True;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=60;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=IntBasicCol;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=170;
  StrGrid.ColWidths[3]:=40;
  StrGrid.ColWidths[4]:=40;
  StrGrid.RowHeights[0]:=40;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Batangan';
  StrGrid.Cells[3,0]:='Odo Out';
  StrGrid.Cells[4,0]:='Odo In';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVehicleEquipmentCheckListRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
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
    StrQry:='SELECT * FROM wh_vhc_equipment WHERE (status=1) AND (equipment_type=1) AND (company_id='+
            CompanyArr[SBU.ItemIndex][1]+') AND (location_id='+CompanyArr[SBU.ItemIndex][2]+');';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(VhcEquipmentArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VhcEquipmentArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_id'];
      VhcEquipmentArr[IntCount][1]:=Qry.FieldValues['name'];
      VhcEquipmentArr[IntCount][2]:=Qry.FieldValues['remark'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
  StrGrid.ColCount:=Length(VhcEquipmentArr)+IntBasicCol;
  for IntCount:=0 to Length(VhcEquipmentArr)-1 do begin
    StrGrid.Cells[IntCount+IntBasicCol,0]:=VhcEquipmentArr[IntCount][1];
    StrGrid.CellStyle[IntCount+IntBasicCol,0].HorizontalAlignment:=taCenter;
    StrGrid.ColWidths[IntCount+IntBasicCol]:=IntColumnWidth;
  end;
  Main.M_Normal;
end;

procedure TVehicleEquipmentCheckListRpt.RefreshSeat;
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

procedure TVehicleEquipmentCheckListRpt.RefreshData;
var StrQry,QAddParam,AkhirBulan,AwalBulan,StrBodyId,StrLicensePlate,StrCompanyId,StrLocationId,StrSeat,StrBatchId:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3:Integer;
    IntUsage,IntRepair:Array[1..31] of Integer;
begin
  Main.M_Busy;
  SetLength(DailyArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  QAddParam:='';
{  for IntCount:=1 to Days do begin
//    StrGrid.Cells[IntCount+3,0]:=LongDayNames[DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))]+' / '+IntToStr(IntCount);
    StrGrid.ColWidths[IntCount+2]:=IntColumnWidth;
    StrGrid.Cells[IntCount+2,0]:=IntToStr(IntCount);
    if DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[IntCount+2,0].BGColor:=clRed
    else
      StrGrid.CellStyle[IntCount+2,0].BGColor:=clBtnFace;
  end;

  StrGrid.Cells[Days+3,0]:='Total Jalan';
  StrGrid.Cells[Days+4,0]:='Total Perbaikan';
  StrGrid.Cells[Days+5,0]:='Total Tersedia';
  StrGrid.Cells[Days+6,0]:='Persen Utilisasi';
  StrGrid.ColWidths[Days+3]:=45;
  StrGrid.ColWidths[Days+4]:=50;
  StrGrid.ColWidths[Days+5]:=45;
  StrGrid.ColWidths[Days+6]:=45;
  StrGrid.CellStyle[Days+3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+3,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+4,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+5,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+6,0].BGColor:=clBtnFace;
  For IntCount:=1 to 31 do IntUsage[IntCount]:=0;
  For IntCount:=1 to 31 do IntRepair[IntCount]:=0;
}
  if Main.OpenDb then begin
    StrCompanyId:=',@CompanyId='+CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';
    if Seat.Text<>'All' then begin
      StrSeat:=',@Seat='+Seat.Text;
    end else StrSeat:='';
    StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    for IntCount2:=0 to Qry.RecordCount-1 do begin
      for IntCount3:=0 to Days+4 do StrGrid.Cells[3+IntCount3,IntCount2+1]:='';
    end;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
      StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
      StrGrid.RowHeights[IntCount]:=20;
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      StrGrid.Cells[1,IntCount]:=StrLicensePlate;
      if Qry.FieldValues['name']<>NULL then  StrGrid.Cells[2,IntCount]:=Qry.FieldValues['name'] else StrGrid.Cells[2,IntCount]:='';
      for IntCount2:=1 to Days do begin
        StrGrid.Cells[IntCount2+2,IntCount]:='';
        StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clWindowText;
        StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGreen;
      end;
      StrQry:='SELECT * FROM wh_vhc_trans WHERE (vehicle_id='+QuotedStr(Qry.FieldValues['vehicle_id'])+
              ') AND (CONVERT(VARCHAR(10),out_date,103)='+QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date))+');';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then begin
        if Qry2.FieldValues['out_ordo_km']<>NULL then StrGrid.Cells[3,IntCount]:=Qry2.FieldValues['out_ordo_km'];
        if Qry2.FieldValues['in_ordo_km']<>NULL then StrGrid.Cells[4,IntCount]:=Qry2.FieldValues['in_ordo_km'];
      end;
      Qry2.Close;
      StrQry:='EXEC GetVehicleEquipmentCheck '+QuotedStr(Qry.FieldValues['vehicle_id'])+','+
              QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date))+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        if Qry2.FieldValues['remark']<>NULL then StrGrid.Cells[IntCount2+IntBasicCol,IntCount]:=Qry2.FieldValues['remark']
        else begin
          if Qry2.FieldValues['checks']='1' then StrGrid.Cells[IntCount2+IntBasicCol,IntCount]:='v';
          if Qry2.FieldValues['checks']='0' then StrGrid.Cells[IntCount2+IntBasicCol,IntCount]:='x';
          //StrGrid.CellStyle[IntCount2+IntBasicCol,IntCount].Font.Style:=[fsBold];
        end;
        StrGrid.CellStyle[IntCount2+IntBasicCol,IntCount].HorizontalAlignment:=taCenter;
        Inc(IntCount2);
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TVehicleEquipmentCheckListRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipmentCheckListRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipmentCheckListRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TVehicleEquipmentCheckListRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TVehicleEquipmentCheckListRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleEquipmentCheckListRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleEquipmentCheckListRpt.StrGridDblClick(Sender: TObject);
begin
//  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
//    if Main.IsFormOpen('OrderForm')=False then
//      if StrPos(PChar(StrGrid.Cells[IntCol,IntRow]),PChar('  '))=nil then
//        OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[IntCol,IntRow],False)
//      else
//        SelectBooking:=TSelectBooking.Create(Self,StrGrid.Cells[IntCol,IntRow]);
end;

procedure TVehicleEquipmentCheckListRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshSeat;
//  RefreshData;
end;

procedure TVehicleEquipmentCheckListRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
