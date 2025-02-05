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
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label3: TLabel;
    SBU: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    Batch: TComboBox;
    Seat: TComboBox;
    lbl3: TLabel;
    Mitra: TComboBox;
    StatusKaryawan: TComboBox;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,EmplType,IntCompanyId:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshSeat;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String='TAXI';Form_Request:String='');Overload;
  end;

var
  TxDrvRunningDaysRpt: TTxDrvRunningDaysRpt;

implementation

{$R *.dfm}

Uses MainU, VehicleFormU, EmployeeFormU;


constructor TTxDrvRunningDaysRpt.Create(AOwner:TComponent;EmployeeType:String='TAXI';Form_Request:String='');
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    IntCompanyId:=3;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    IntCompanyId:=2;
  end else begin
    EmplType:=3;
    IntCompanyId:=1;
  end;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TTxDrvRunningDaysRpt.Init;
var IntCount,day,tgl_akhir:Integer;
begin
  Case EmplType of
    1:Caption:='Laporan Running Days(Mitra)';
    2:Caption:='Laporan Running Days(Driver)';
    3:Caption:='';
  end;
 // tgl_akhir:= TanggalTerakhir(TanggalAcuan.Date)

  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=68;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  SBU.Text:='';
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  StatusKaryawan.ItemIndex:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=32+6;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=68;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Batangan';
  day:=0;
  for IntCount:=1 to 31 do begin
    StrGrid.Cells[IntCount+3,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[IntCount+3,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to 34 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=4 to 31 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;
end;

procedure TTxDrvRunningDaysRpt.RefreshCombo;
var StrQry,StrQry2:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
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

    StrQry2:='EXEC GetGroup '+CompanyId+';';
    Qry2.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry2,3);
    Qry2.SQL.Add(StrQry2);
    Qry2.Open;
    SetLength(BatchArr,Qry2.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
      BatchArr[IntCount][0]:=Qry2.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry2.FieldValues['name'];
      Inc(IntCount);
      Qry2.Next;
    end;
    Qry2.Close;

  end;
  FreeAndNil(Qry);
  FreeAndNil(Qry2);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;

  CompanyId:=CompanyId;

  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TTxDrvRunningDaysRpt.RefreshSeat;
var QStr,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyId;
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
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

procedure TTxDrvRunningDaysRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan,StrLocationId,StrCompanyId, StrBatchId, StrSeat, StrMitra, StrHelper:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,Count4,Ijin,Sakit,Cuti,Hadir,tgl:Integer;
begin

  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;

  StrGrid.ColCount:=32+(Days-28)+4;
  StrGrid.Cells[32+(Days-28),0]:='Total Ijin';
  StrGrid.Cells[32+(Days-28)+1,0]:='Total Cuti';
  StrGrid.Cells[32+(Days-28)+2,0]:='Total Sakit';
  StrGrid.Cells[32+(Days-28)+3,0]:='Total Masuk';
  StrGrid.CellStyle[32+(Days-28),0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[32+(Days-28)+1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[32+(Days-28)+2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[32+(Days-28)+3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[32+(Days-28),0].Font.Color:=clWindowText;
  StrGrid.CellStyle[32+(Days-28),0].Font.Style:=[fsBold];
  StrGrid.CellStyle[32+(Days-28)+1,0].Font.Color:=clWindowText;
  StrGrid.CellStyle[32+(Days-28)+1,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[32+(Days-28)+2,0].Font.Color:=clWindowText;
  StrGrid.CellStyle[32+(Days-28)+2,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[32+(Days-28)+3,0].Font.Color:=clWindowText;
  StrGrid.CellStyle[32+(Days-28)+3,0].Font.Style:=[fsBold];
  for Count:=32 to (32+Days-29) do begin
    StrGrid.ColWidths[Count]:=IntColumnWidth;
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[Count,0].BGColor:=clBtnFace;
  end;
  StrBatchId:='0' ;
  if Batch.Text<>'All' then begin
//      StrBatchId:='and d.vhc_batch_id='+BatchArr[Batch.ItemIndex][0];
      StrBatchId:=BatchArr[Batch.ItemIndex][0];
  end;

  StrSeat:='0';

  if (Seat.Text<>'All') and (Seat.Text<>'') then begin
//      StrSeat:=' and e.seat='+Seat.Text;
      StrSeat:=Seat.Text;
  end;

  StrMitra:='';
  if Mitra.Text='Driver' then begin
      StrMitra:='2';
      StrHelper:=' ';
  end
  else  begin
      StrMitra:='4';
      StrHelper:=' ,@isDriver=0 ' ;
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
//  QStr:='SELECT * FROM wh_employee AS a '+
//        ' INNER JOIN wh_empl_mutation AS b ON b.empl_mutation_id=(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation '+
//        ' WHERE (employee_id=a.employee_id) AND (from_date<='+Chr(39)+
//        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') ) '+
//        ' LEFT JOIN wh_working_schedule AS c ON c.working_schedule_id='+
//        '(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE (employee_id=a.employee_id) AND '+
//        '(from_date<='+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+') ) '+
//        ' LEFT JOIN wh_vehicle AS d ON d.vehicle_id=c.vehicle_id '+
//        ' LEFT JOIN wh_vhc_type_detail e ON d.vhc_type_detail_id=e.vhc_type_detail_id '+
//        ' WHERE (b.employment_type_id='+StrMitra+') AND '+
//        '(a.active=1) '+StrLocationId + StrBatchId + StrSeat +' ORDER BY name;';
  QStr:='EXEC GetEmployeeListRD @FromDate='+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+',@ToDate='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+',@Mitra='+StrMitra+',@BatchID='+StrBatchId+',@Seat='+StrSeat+','+
        '@LocationID='+CompanyArr[SBU.ItemIndex][2]+',@StatusKaryawan='+QuotedStr(StatusKaryawan.Text)+' ';
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
    if Qry.FieldValues['license_plate']<>NULL then
    begin
       if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          StrGrid.Cells[3,Count]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
        StrGrid.Cells[3,Count]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
    end;
//    StrGrid.Cells[3,Count]:=Qry.FieldValues['license_plate'];
    QStr:='EXEC GetEmployeeRunningDays '+QuotedStr(Qry.FieldValues['employee_id'])+
          ',@FromDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
          ',@ToDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan)))+ StrHelper+' ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    Ijin:=0;
    Sakit:=0;
    Cuti:=0;
    Hadir:=0;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
//      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:='1';
      for Count4:=Qry2.FieldValues['tgl'] to Qry2.FieldValues['tgl_selesai'] do
      begin
        if (Qry2.FieldValues['type_absen']='3') then
        begin
          if (StrGrid.Cells[(3+Count4),Count]='') then
          Hadir:=Hadir+1;
        end;
        if(Qry2.FieldValues['license_plate']='IJIN') then
        Ijin:=Ijin+1;

        if(Qry2.FieldValues['license_plate']='SAKIT') then
        Sakit:=Sakit+1;

        if(Qry2.FieldValues['license_plate']='CUTI') then
        Cuti:=Cuti+1;

        if  (Qry2.FieldValues['license_plate']='HADIR') OR (Qry2.FieldValues['license_plate']='IJIN') OR (Qry2.FieldValues['license_plate']='SAKIT') OR (Qry2.FieldValues['license_plate']='CUTI') then
        begin
          StrGrid.CellStyle[(3+Count4),Count].BGColor:=clWindow;
          StrGrid.Cells[(3+Count4),Count]:=Qry2.FieldValues['license_plate'];
          if Qry2.FieldValues['status_approve']='IN PROGRESS' then
          begin
            StrGrid.CellStyle[(3+Count4),Count].BGColor:=clYellow;
          end;
        end
        else
        begin
          if IsCharAlpha(PChar(Copy(Qry2.FieldValues['license_plate'],2,1))^)=False then
            StrGrid.Cells[(3+Count4),Count]:=Copy(Qry2.FieldValues['license_plate'],1,1)+' '+Copy(Qry2.FieldValues['license_plate'],2,4)+
                ' '+Copy(Qry2.FieldValues['license_plate'],6,Length(Qry2.FieldValues['license_plate'])+1)
          else
          StrGrid.Cells[(3+Count4),Count]:=Copy(Qry2.FieldValues['license_plate'],1,2)+' '+Copy(Qry2.FieldValues['license_plate'],3,4)+
                ' '+Copy(Qry2.FieldValues['license_plate'],7,Length(Qry2.FieldValues['license_plate'])+1);
        end;
      end;
      Qry2.Next;
    end;
    StrGrid.Cells[32+(Days-28),Count]:=IntToStr(Ijin);
    StrGrid.Cells[32+(Days-28)+1,Count]:=IntToStr(Cuti);
    StrGrid.Cells[32+(Days-28)+2,Count]:=IntToStr(Sakit);
    StrGrid.Cells[32+(Days-28)+3,Count]:=IntToStr(Hadir);
    StrGrid.CellStyle[32+(Days-28),Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[32+(Days-28),Count].Font.Style:=[fsBold];
    StrGrid.CellStyle[32+(Days-28),Count].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[32+(Days-28+1),Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[32+(Days-28+1),Count].Font.Style:=[fsBold];
    StrGrid.CellStyle[32+(Days-28+1),Count].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[32+(Days-28+2),Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[32+(Days-28+2),Count].Font.Style:=[fsBold];
    StrGrid.CellStyle[32+(Days-28+2),Count].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[32+(Days-28+3),Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[32+(Days-28+3),Count].Font.Style:=[fsBold];
    StrGrid.CellStyle[32+(Days-28+3),Count].HorizontalAlignment:=taCenter;
    Qry2.Close;
    Inc(Count);
    Qry.Next;

  end;
//  StrGrid.Cells[32+(Days-28),Count]:=IntToStr(Ijin);
//  StrGrid.Cells[32+(Days-28)+1,Count]:=IntToStr(Cuti);
//  StrGrid.Cells[32+(Days-28)+2,Count]:=IntToStr(Sakit);
//  StrGrid.Cells[32+(Days-28)+3,Count]:=IntToStr(Hadir);

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
//  RefreshData;
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


procedure TTxDrvRunningDaysRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTxDrvRunningDaysRpt.StrGridDblClick(Sender: TObject);
begin
    if IntCol=1 then begin
      if Main.IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Bus',StrGrid.Cells[IntCol,IntRow],False);
    end;
end;

procedure TTxDrvRunningDaysRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
