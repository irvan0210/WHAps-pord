unit AbsensiDrvRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TAbsensiDrvRpt = class(TForm)
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
    CompanyArr, EmplTypeArr,EmplArr:Array of TArrString7;
    DailyArr:array of TArrString31;
    Days,IntColumnWidth,IntRow,IntCol,EmplType,IntCompanyId:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure PrintTotalGroup;
    procedure RefreshDataIrvan;
   // procedure BuildGridFull(Grid: TStringGrid; Qry: TFDQuery);
    procedure RefreshSeat;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String='TAXI';Form_Request:String='');Overload;
  end;

var
  AbsensiDrvRpt: TAbsensiDrvRpt;

implementation

{$R *.dfm}

Uses MainU, VehicleFormU, EmployeeFormU;


constructor TAbsensiDrvRpt.Create(AOwner:TComponent;EmployeeType:String='TAXI';Form_Request:String='');
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

procedure TAbsensiDrvRpt.Init;
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

procedure TAbsensiDrvRpt.RefreshCombo;
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

procedure TAbsensiDrvRpt.RefreshSeat;
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

procedure TAbsensiDrvRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan,StrLocationId,StrCompanyId, StrBatchId, StrSeat, StrMitra, StrHelper, StrBatchName:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,Count4,Ijin,Sakit,Cuti,Hadir,tgl,IntCount, IntCount2,
    IntGeserKolom,IntGsrKlm:Integer;
    IntCategory:Array[1..31] of Integer;

begin

  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;

  IntGeserKolom   :=1;
  IntGsrKlm       :=IntGeserKolom;

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
  for IntCount:=1 to 31 do IntCategory[IntCount]:=0;
  StrBatchName := '';
  
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

  QStr:='EXEC GetEmployeeListRD_irvan @FromDate='+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+',@ToDate='+Chr(39)+
        FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+',@Mitra='+StrMitra+',@BatchID='+StrBatchId+',@Seat='+StrSeat+','+
        '@LocationID='+CompanyArr[SBU.ItemIndex][2]+',@StatusKaryawan='+QuotedStr(StatusKaryawan.Text)+' ';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=1;
  SetLength(EmplArr, Qry.RecordCount);
  StrBatchName := '';

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

    // BATCH

    if StrBatchName <> Qry.FieldValues['name']+' '+IntToStr(Qry.FieldValues['seat'])then begin
      //IntCount4:=1;
        StrBatchName:=Qry.FieldValues['name']+' '+FloatToStr(Qry.FieldValues['seat']);
        {Cek}
        for IntCount2:=0 to Days+4 do begin
          StrGrid.Cells[IntCount2,IntCount]:='';
          StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
        end;

        StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.CellStyle[1,IntCount].BGColor:=clSkyBlue;
        StrGrid.CellStyle[1,IntCount].Font.Color:=clWindowText;
        StrGrid.CellStyle[1,IntCount].Font.Style:=[fsBold];
        StrGrid.CellStyle[1,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[1,IntCount].BGColor:=clSkyBlue;
        //StrGrid.MergeCells.AddRectXY(3,IntCount, Days+7, IntCount);
        StrGrid.MergeCells.AddRectXY(1,IntCount, Days+6,IntCount);
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['name']+' '+IntToStr(Qry.FieldValues['seat']);
        Inc(IntCount);
        SetLength(DailyArr,Length(DailyArr)+1);

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

procedure TAbsensiDrvRpt.PrintTotalGroup;
var i, IntCount,IntCount4 : Integer;
    IntJenis,IntStatusMasuk, IntStatusSakit, IntStatusIjin, IntStatusCuti : array [1..31] of integer;

  procedure SetRowSilver(Row: Integer);
  var C: Integer;
  begin
    for C := 0 to StrGrid.ColCount-1 do
      StrGrid.CellStyle[C,Row].BGColor := clSilver;
  end;

begin

  { TOTAL HADIR }
  StrGrid.RowCount := StrGrid.RowCount + 1;
  StrGrid.Cells[2,IntCount] := 'Total Hadir';

  for i := 1 to Days do
    StrGrid.Cells[i+3,IntCount] :=
      IntToStr(IntStatusMasuk[i]);

  SetRowSilver(IntCount);
  Inc(IntCount);


  { TOTAL SAKIT }
  StrGrid.RowCount := StrGrid.RowCount + 1;
  StrGrid.Cells[2,IntCount] := 'Total Sakit';

  for i := 1 to Days do
    StrGrid.Cells[i+3,IntCount] :=
      IntToStr(IntStatusSakit[i]);

  SetRowSilver(IntCount);
  Inc(IntCount);


  { TOTAL IJIN }
  StrGrid.RowCount := StrGrid.RowCount + 1;
  StrGrid.Cells[2,IntCount] := 'Total Ijin';

  for i := 1 to Days do
    StrGrid.Cells[i+3,IntCount] :=
      IntToStr(IntStatusIjin[i]);

  SetRowSilver(IntCount);
  Inc(IntCount);


  { TOTAL CUTI }
  StrGrid.RowCount := StrGrid.RowCount + 1;
  StrGrid.Cells[2,IntCount] := 'Total Cuti';

  for i := 1 to Days do
    StrGrid.Cells[i+3,IntCount] :=
      IntToStr(IntStatusCuti[i]);

  SetRowSilver(IntCount);
  Inc(IntCount);


  { PERSEN JALAN }
  StrGrid.RowCount := StrGrid.RowCount + 1;
  StrGrid.Cells[2,IntCount] := 'Persen Jalan PerHari (%)';

  for i := 1 to Days do
  begin
    if IntCount4-1 > 0 then
      StrGrid.Cells[i+3,IntCount] :=
        FormatFloat('0',
          (IntStatusMasuk[i] / (IntCount4-1))*100)
    else
      StrGrid.Cells[i+3,IntCount] := '0';
  end;

  SetRowSilver(IntCount);
  Inc(IntCount);

end;

procedure TAbsensiDrvRpt.RefreshDataIrvan;
var QStr,QAddParam,AkhirBulan,AwalBulan,StrLocationId,StrCompanyId,StrEmplType, StrMitra, StrHelper:String;
    StrJenisKaryawan, StrBatchId, StrSeat, StrBatchName : string;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,Count4,IntTotal,IntCountEmpl:Integer;
    IntCount,IntCount2,IntCount3, IntCount4 : Integer;
    IntJenis,IntStatusMasuk, IntStatusSakit, IntStatusIjin, IntStatusCuti : array [1..31] of integer;
    IntMasuk,IntSakit, IntIjin, IntCuti, IntUangMakan : Integer;
    StrList:TStringList;
begin
  Main.M_Busy;

  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=Days+3+5; {nilai 2 untuk menampilkan total hadir}

  // kolom awal
  StrGrid.ColWidths[0] := 30;
  StrGrid.ColWidths[1] := 75;
  StrGrid.ColWidths[2] := 185;

  StrBatchId:='0' ;
  if Batch.Text<>'All' then begin
//      StrBatchId:='and d.vhc_batch_id='+BatchArr[Batch.ItemIndex][0];
      StrBatchId:=BatchArr[Batch.ItemIndex][0];
  end;

   StrSeat:='0';
  //for IntCount:=1 to 31 do IntCategory[IntCount]:=0;
  StrBatchName := '';
  
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


  // RESET WARNA DULU
  for Count := 1 to 31 do
  begin
    StrGrid.CellStyle[Count+3,0].BGColor := clBtnFace;
  end;
  //warna hari sabtu minggu
  for Count:=1 to Days do begin
    StrGrid.ColWidths[Count+3]:=IntColumnWidth;
    StrGrid.Cells[Count+3, 0]:=IntToStr(Count);
    if DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[Count+3, 0].BGColor:=clRed
    else if DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))=7 then
      StrGrid.CellStyle[Count+3, 0].BGColor:=clGreen
    else
      StrGrid.CellStyle[Count+3, 0].BGColor:=clBtnFace;
    Application.ProcessMessages;
  end;

  StrGrid.Cells[Days+3,0]:='Total Masuk';
  StrGrid.Cells[Days+4,0]:='Total Sakit';
  StrGrid.Cells[Days+5,0]:='Total Ijin';
  StrGrid.Cells[Days+6,0]:='Total Cuti';
  StrGrid.Cells[Days+7,0]:='Uang Makan';
    // kolom total
  StrGrid.ColWidths[Days+3] := 70;
  StrGrid.ColWidths[Days+4] := 65;
  StrGrid.ColWidths[Days+5] := 55;
  StrGrid.ColWidths[Days+6] := 55;
  StrGrid.ColWidths[Days+7] := 75;

  SetLength(DailyArr,0);

  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 7200;

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];

  if Main.OpenDb then begin
    StrGrid.TopRow := 1;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    Qry.SQL.Clear;
    StrLocationId:=' AND (b.location_id='+CompanyArr[SBU.ItemIndex][2]+')';

    QStr:='EXEC GetEmployeeListRD_irvan @FromDate='+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+',@ToDate='+Chr(39)+
          FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+',@Mitra='+StrMitra+',@BatchID='+StrBatchId+',@Seat='+StrSeat+','+
          '@LocationID='+CompanyArr[SBU.ItemIndex][2]+',@StatusKaryawan='+QuotedStr(StatusKaryawan.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;

    Count:=0;
    SetLength(EmplArr, Qry.RecordCount);

    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;

    if (Qry.RecordCount>0) then begin
      while not(Qry.Eof) do begin

          EmplArr[Count][0]:=VartoStr(Qry.FieldValues['employee_id']);
          EmplArr[Count][1]:=VartoStr(Qry.FieldValues['name']);
          if Qry.FieldValues['license_plate']<>NULL then
          begin
           if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
              EmplArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                  ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
            else
            EmplArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                  ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          end;
          EmplArr[Count][3]:=VartoStr(Qry.FieldValues['batch_name'])+' '+VartoStr(Qry.FieldValues['seat']) ;
          Qry.Next;
          Inc(Count);
      end;
    end;

    Count:=1;

    IntTotal:=Length(EmplArr);//Qry.RecordCount;
    StrJenisKaryawan:='';

    IntCount:=1;
    IntCount4:=1;
    For IntCountEmpl:=0 to Length(EmplArr)-1 do begin
        IntMasuk := 0;
        IntSakit := 0;
        IntIjin  := 0;
        IntCuti  := 0;
        SetLength(DailyArr,Length(DailyArr)+1);

        for IntCount2:=0 to Days+4 do begin
          StrGrid.Cells[IntCount2,IntCount]:='';
        end;

        if StrJenisKaryawan<>EmplArr[IntCountEmpl][3] then begin
           { if StrJenisKaryawan<>'' then begin
              StrGrid.RowCount:=StrGrid.RowCount+1;
              //Total Masuk
              for IntCount2:=1 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Masuk';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusMasuk[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

               //Total Sakit
              for IntCount2:=1 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Sakit';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

               //Total Ijin
              for IntCount2:=1 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Ijin';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusIjin[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

               //Total Cuti
              for IntCount2:=1 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Cuti';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusCuti[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);
            end; }


          { ============ Kode AI ================= }
            { CETAK TOTAL GROUP SEBELUMNYA }
            { ============================= }
            if StrJenisKaryawan<>'' then
            begin
             // PrintTotalGroup;
               //Total Masuk
              for IntCount2:=1 to Days+2 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount := StrGrid.RowCount + 1;
              StrGrid.Cells[2,IntCount] := 'Total Masuk';
              for IntCount2 := 1 to Days do
                StrGrid.Cells[IntCount2+3,IntCount] :=IntToStr(IntStatusMasuk[IntCount2]);
              Inc(IntCount);

              //Total Sakit
              for IntCount2:=1 to Days+2 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;

              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Sakit';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
              end;
              Inc(IntCount);
             // SetLength(DailyArr,Length(DailyArr)+1);


              StrGrid.RowCount := StrGrid.RowCount + 1;
              //Total Persen Jalan PerHari 
              for IntCount2:=1 to Days+2 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.Cells[2,IntCount] := 'Persen Jalan PerHari (%)';
              for IntCount2 := 1 to Days do
              begin
                if IntCount4-1 > 0 then
                  StrGrid.Cells[IntCount2+3,IntCount] :=FormatFloat('0',(IntStatusMasuk[IntCount2] /(IntCount4-1))*100)
                else
                  StrGrid.Cells[IntCount2+3,IntCount] := '0';
              end;
              Inc(IntCount);
            end;
            //END Kode AI

            {Reset}
            For IntCount3:=1 to 31 do IntStatusMasuk[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusSakit[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusIjin[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusCuti[IntCount3]:=0;

            IntCount4:=1;
            StrJenisKaryawan:=EmplArr[IntCountEmpl][3];

            {Cek}
            for IntCount2:=0 to Days+4 do begin
              StrGrid.Cells[IntCount2,IntCount]:='';
              StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
            end;

            StrGrid.RowCount:=StrGrid.RowCount+1;
            StrGrid.CellStyle[1,IntCount].BGColor:=clSkyBlue;
            StrGrid.CellStyle[2,IntCount].Font.Color:=clWindowText;
            StrGrid.CellStyle[1,IntCount].Font.Style:=[fsBold];
            StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
           // StrGrid.CellStyle[4,IntCount].BGColor:=clSkyBlue;
            //StrGrid.MergeCells.AddRectXY(3,IntCount, Days+7, IntCount);
            StrGrid.MergeCells.AddRectXY(4,IntCount, Days+6,IntCount);
            StrGrid.MergeCells.AddRectXY(1,IntCount, 3,IntCount);
            StrGrid.Cells[1,IntCount]:=StrJenisKaryawan;
            Inc(IntCount);
            SetLength(DailyArr,Length(DailyArr)+1);

        end;

        StrGrid.Cells[0, IntCount]:=IntToStr(IntCount4);
        StrGrid.Cells[1, IntCount]:=EmplArr[IntCountEmpl][0];
        StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGrid.Cells[2, IntCount]:=EmplArr[IntCountEmpl][1];
        StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGrid.Cells[3, IntCount]:=EmplArr[IntCountEmpl][2];

        QStr:='EXEC GetEmployeeRunningDays '+QuotedStr(EmplArr[IntCountEmpl][0])+
                ',@FromDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
                ',@ToDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan)))+StrHelper+',@isAbsen=1;';
        Qry2.Close;
        Qry2.SQL.Clear;
        Qry2.SQL.Add(QStr);
        Qry2.Open;

        if Qry2.RecordCount>0 then begin
          while Not(Qry2.Eof) do begin
            for Count4:=StrToInt(VarToStr(Qry2.FieldValues['tgl'])) to StrToInt(VarToStr(Qry2.FieldValues['tgl'])) do begin
//              Count4:=StrToInt(VarToStr(Qry2.FieldValues['tgl']));
              StrGrid.Cells[(3+Count4),IntCount]:=VarToStr(Qry2.FieldValues['body_id']);

              if DailyArr[Length(DailyArr)-1][Count4-2]<>'' then begin
                StrList:=TStringList.Create;
                StrList:=SplitStrings(DailyArr[Length(DailyArr)-1][Count4-2],'  ');
              end;

              if (Qry2.FieldValues['kode']<>NULL) or (Qry2.FieldValues['kode']<>'') then begin
                if DailyArr[Length(DailyArr)-1][Count4-2]='' then
                  DailyArr[Length(DailyArr)-1][Count4-2]:=Qry2.FieldValues['kode']
                else
                  DailyArr[Length(DailyArr)-1][Count4-2]:=DailyArr[Length(DailyArr)-1][Count4-2]+'  '+Qry2.FieldValues['kode'];
              end;

              if Qry2.FieldValues['body_id']='Hadir' then begin
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Color:=clGreen;
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Style:=[fsBold];
                  Inc(IntStatusMasuk[Count4]);
                  Inc(IntMasuk);
              end else if Qry2.FieldValues['body_id']='Sakit' then begin
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Color:=clFuchsia;
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Style:=[fsBold];
                  Inc(IntStatusSakit[Count4]);
                  Inc(IntSakit);
              end else if Qry2.FieldValues['body_id']='Ijin' then begin
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Color:=$000080FF;
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Style:=[fsBold];
                  Inc(IntStatusIjin[Count4]);
                  Inc(IntIjin);
              end else if Qry2.FieldValues['body_id']='Cuti' then begin
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Color:=clBlue;
                  StrGrid.CellStyle[(3+Count4), IntCount].Font.Style:=[fsBold];
                  Inc(IntStatusCuti[Count4]);
                  Inc(IntCuti);
              end else
                StrGrid.CellStyle[(3+Count4), IntCount].Font.Color:=clGreen;
            end;
            Qry2.Next;
          end;

        end;

        IntUangMakan := IntMasuk * 15000;
        StrGrid.Cells[Days+3, IntCount] := IntToStr(IntMasuk);
        StrGrid.Cells[Days+4, IntCount] := IntToStr(IntSakit);
        StrGrid.Cells[Days+5, IntCount] := IntToStr(IntIjin);
        StrGrid.Cells[Days+6, IntCount] := IntToStr(IntCuti);
        StrGrid.Cells[Days+7, IntCount] := IToCurr(IntUangMakan);
        StrGrid.CellStyle[Days+7, IntCount].HorizontalAlignment:=taRightJustify;
       // ProgressBar.Position:=1+Round((99/Length(EmplArr))*IntCount4);
        Qry2.Close;
        Inc(IntCount);
        Inc(IntCount4);

        If (IntCountEmpl-1) >= 13 then//If Qry.RecNo >= 21 then
        StrGrid.TopRow:= IntCountEmpl-12;//Qry.RecNo-20;
    end;

    //row dibawah

    //Inc(IntCount);
   { StrGrid.RowCount:=StrGrid.RowCount+2;
   // Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days do begin
      StrGrid.Cells[2,IntCount]:='Total Masuk';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusMasuk[IntCount2]);
    end;
    Inc(IntCount);  }

    {for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days+1 do begin
      StrGrid.Cells[2,IntCount]:='Total Sakit';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
    end;  }

    {Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days+1 do begin
      StrGrid.Cells[2,IntCount]:='Total Ijin';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusIjin[IntCount2]);
    end;

    Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days+1 do begin
      StrGrid.Cells[2,IntCount]:='Total Cuti';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusCuti[IntCount2]);
    end; }
   // SetLength(DailyArr,Length(DailyArr)+1);
(*
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2,IntCount]:=IntToStr(IntStatusMasuk[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+3,IntCount]:=IntToStr(IntStatusSakit[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+4,IntCount]:=IntToStr(IntStatusIjin[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+5,IntCount]:=IntToStr(IntStatusCuti[IntCount2]); {cek nih}
*)
   // ProgressBar.Position := 0;

    { ============= KOde AI ================ }
      { CETAK TOTAL GROUP TERAKHIR }
      { ============================= }
      
  //Total Masuk
      StrGrid.RowCount := StrGrid.RowCount + 1;
      for IntCount2:=1 to Days+2 do begin
        StrGrid.Cells[IntCount2,IntCount]:='';
        StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
      end;

      StrGrid.Cells[2,IntCount] := 'Total Masuk';
      for IntCount2 :=1 to Days do
        StrGrid.Cells[IntCount2+3,IntCount] :=IntToStr(IntStatusMasuk[IntCount2]);
      Inc(IntCount);

      //Total Sakit
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount2:=1 to Days+2 do begin
        StrGrid.Cells[IntCount2,IntCount]:='';
        StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
      end;

      for IntCount2:=1 to Days do begin
        StrGrid.Cells[2,IntCount]:='Total Sakit';
        StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
      end;
      Inc(IntCount);


      StrGrid.RowCount := StrGrid.RowCount + 1;
      for IntCount2:=1 to Days+2 do begin
        StrGrid.Cells[IntCount2,IntCount]:='';
        StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
      end;

      StrGrid.Cells[2,IntCount] :='Persen Jalan PerHari (%)';
      for IntCount2 := 1 to Days do
      begin
        if IntCount4-1 > 0 then
          StrGrid.Cells[IntCount2+3,IntCount] :=
            FormatFloat('0',
              (IntStatusMasuk[IntCount2] /(IntCount4-1))*100)
        else
          StrGrid.Cells[IntCount2+3,IntCount] := '0';
      end;

    //PrintTotalGroup;
       { ============= END KOde AI ================ }

    Qry.Close;
    FreeAndNil(Qry2);
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  
end;


procedure TAbsensiDrvRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAbsensiDrvRpt.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
//  RefreshData;
end;

procedure TAbsensiDrvRpt.SelesaiClick(Sender: TObject);
begin
  AbsensiDrvRpt.Close;
end;

procedure TAbsensiDrvRpt.TahunKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TAbsensiDrvRpt.LihatDataClick(Sender: TObject);
begin
  //RefreshData;
  RefreshDataIrvan;
end;

procedure TAbsensiDrvRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;


procedure TAbsensiDrvRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TAbsensiDrvRpt.StrGridDblClick(Sender: TObject);
begin
    if IntCol=1 then begin
      if Main.IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'Bus',StrGrid.Cells[IntCol,IntRow],False);
    end;
end;

procedure TAbsensiDrvRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
