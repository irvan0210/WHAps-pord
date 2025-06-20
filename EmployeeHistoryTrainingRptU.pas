unit EmployeeHistoryTrainingRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons,
  WHUnit, AdoDB, DateUtils;

type
  TEmplHistoryTrainingRpt = class(TForm)
    ToXCel: TSpeedButton;
    Label2: TLabel;
    LihatData: TButton;
    GridHistTraining: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    Periode: TRadioGroup;
    TglSampai: TDateTimePicker;
    Tanggal: TDateTimePicker;
    Panel1: TPanel;
    Driver: TEdit;
    CariDriver: TButton;
    GroupTotal: TGroupBox;
    Label1: TLabel;
    Total: TMemo;
    Label3: TLabel;
    RadTypeEmpl: TRadioGroup;
    GroupBox1: TGroupBox;
    Materi: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure PeriodeClick(Sender: TObject);
    procedure RadTypeEmplClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    LokasiArr:Array of TArrString2;
    TrainingArr:Array of TArrString14;
    CompanyArr,CompanyLocationArr:Array of TArrString8;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
     constructor Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmployeeID:string;EmpType:String);Overload;
  end;

var
  EmplHistoryTrainingRpt: TEmplHistoryTrainingRpt;
  DriverIDHistTrainingRpt,FormRequest,Employee_Name,Role:String;
implementation

uses MainU, EmployeeListU, MateriTrainingListU;

{$R *.dfm}

constructor TEmplHistoryTrainingRpt.Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmployeeID:string;EmpType:String);
begin

  if FormReq<>'' then FormRequest:=FormReq else FormRequest:='';
  if FormReq='DRIVERFORM' then
  begin
    DriverIDHistTrainingRpt:=EmployeeID;
    Employee_Name:=EmployeeName;
  end;
  if EmpType<>'' then Role:=EmpType else Role:='';

  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TEmplHistoryTrainingRpt.RefreshCombo;
var StrQry,StrCompanyId:String;
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
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
{  for IntCount:=0 to Length(LokasiArr)-1 do Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
}

  Main.M_Normal;
end;

procedure TEmplHistoryTrainingRpt.Init;
var IntCount:Integer;
myYear,myMonth,myDay : Word;
begin

  Total.Text:='0';
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
//  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Materi.Text:='';

  if FormRequest='DRIVERFORM' then
  begin
    Driver.Text:=Employee_Name;
    DecodeDate(TglSampai.Date,myYear,myMonth,myDay);
    Tanggal.Date:=EncodeDate(myYear, 1, 1);
//    CekTglSampai.Checked:=True;
    TglSampai.Enabled:=True;
//    Bulan.Enabled:=False;
    Driver.Visible:=True;
    CariDriver.Visible:=False;
    RadTypeEmpl.Enabled:=False;

    if Role='DRIVER' then
    begin
      RadTypeEmpl.ItemIndex:=1;
    end else if Role='HELPER' then
    begin
      RadTypeEmpl.ItemIndex:=2;
    end else
    begin
      RadTypeEmpl.ItemIndex:=0;
    end;
  end
  else
  begin
    Driver.Text:='';
    Tanggal.Date:=Now();
//    CekTglSampai.Checked:=False;
    TglSampai.Enabled:=True;
//    Bulan.Enabled:=False;
    CariDriver.Visible:=True;
    RadTypeEmpl.ItemIndex:=0;
    Role:='SEMUA';
    RadTypeEmpl.Enabled:=True;
  end;

  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmplHistoryTrainingRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridHistTraining.ColCount:=9;
  GridHistTraining.RowCount:=1;
  GridHistTraining.WordWrap:=True;
  GridHistTraining.ColWidths[0]:=30;
  GridHistTraining.ColWidths[1]:=70;
  GridHistTraining.ColWidths[2]:=50;
  GridHistTraining.ColWidths[3]:=150;
  GridHistTraining.ColWidths[4]:=400;
  GridHistTraining.ColWidths[5]:=200;
  GridHistTraining.ColWidths[6]:=80;
  GridHistTraining.ColWidths[7]:=60;
  GridHistTraining.ColWidths[8]:=40;

  GridHistTraining.Cells[0,0]:='No.';
  GridHistTraining.Cells[1,0]:='Tanggal';
  GridHistTraining.Cells[2,0]:='Jam ';
  GridHistTraining.Cells[3,0]:='Nama Peserta ';
  GridHistTraining.Cells[4,0]:='Materi';
  GridHistTraining.Cells[5,0]:='Lokasi';
  GridHistTraining.Cells[6,0]:='Trainer';
  GridHistTraining.Cells[7,0]:='Type';
  GridHistTraining.Cells[8,0]:='Score';

  for IntCount:=0 to GridHistTraining.ColCount-1 do
  begin
    GridHistTraining.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to GridHistTraining.ColCount-1 do
    GridHistTraining.Cells[IntCount,2]:='';
end;

procedure TEmplHistoryTrainingRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId,StrDriverID,StrDate,StrDatesTo,StrMateri,StrTypeEmpl:String;
    IntCount,No:Integer;
    Count,Count2:Integer;
    myYear, myMonth, myDay : Word;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];

  if RadTypeEmpl.ItemIndex=0 then
  begin
    StrTypeEmpl:='';
  end else if RadTypeEmpl.ItemIndex=1 then
  begin
    StrTypeEmpl:=',@EmploymentTypeId=2 ';
  end else if RadTypeEmpl.ItemIndex=2 then
  begin
    StrTypeEmpl:=',@EmploymentTypeId=4 ';
  end;

  if DriverIDHistTrainingRpt<>'' then
  begin
    StrDriverID:=',@DriverID='+QuotedStr(DriverIDHistTrainingRpt);
  end
  else
  begin
    StrDriverID:='';
  end;

//  if Periode.ItemIndex=0 then Begin
//    if CekTglSampai.Checked then begin
//      StrDate:=' @Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
//      StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date));
//    end else begin
      StrDate:=' @Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
      StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date));
//    end;
//  end
//  else begin
//      DecodeDate(Bulan.Date, myYear, myMonth, myDay);
//      StrDate:=' @Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)));
//      StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))));
//  end;

  if TRIM(Materi.Text)<>'' then
  begin
    StrMateri:=',@Materi='+QuotedStr(Materi.Text)+' ';
  end else
  begin
    StrMateri:='';
  end;

  if Main.OpenDb then begin
    SetLength(TrainingArr,0);

    StrQry:='EXEC GetEmployeeHistoryTrainingDetail '+StrDate+StrDatesTo+StrDriverID+StrMateri+StrTypeEmpl;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(TrainingArr,IntCount+1);
      TrainingArr[IntCount][0]:=IntToStr(No);
      TrainingArr[IntCount][1]:=FormatDateTime('dd/mm/yyyy', Qry.FieldValues['date']);
       if Qry.FieldValues['time']<>NULL then
      TrainingArr[IntCount][2]:=Qry.FieldValues['time'] else TrainingArr[IntCount][2]:='';

      if Qry.FieldValues['name']<>NULL then
      TrainingArr[IntCount][3]:=Qry.FieldValues['name'] else
      TrainingArr[IntCount][3]:='';

      if Qry.FieldValues['materi']<>NULL then
      TrainingArr[IntCount][4]:=Qry.FieldValues['materi'] else
      TrainingArr[IntCount][4]:='';

      if Qry.FieldValues['location']<>NULL then
      TrainingArr[IntCount][5]:=Qry.FieldValues['location'] else TrainingArr[IntCount][5]:='';


      if Qry.FieldValues['trainer']<>NULL then
      TrainingArr[IntCount][6]:=Qry.FieldValues['trainer'] else TrainingArr[IntCount][6]:='';

      if Qry.FieldValues['type']<>NULL then
      TrainingArr[IntCount][7]:=Qry.FieldValues['type'] else TrainingArr[IntCount][7]:='';
      TrainingArr[IntCount][8]:=Qry.FieldValues['score'];
      TrainingArr[IntCount][9]:=Qry.FieldValues['empl_history_training_id'];

      Inc(IntCount);
      Qry.Next;
    end;
    Total.Text:=IntToStr(No);

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

  if Length(TrainingArr)>0 then GridHistTraining.RowCount:=Length(TrainingArr)+1
  else GridHistTraining.RowCount:=2;
  for Count:=0 to 8 do begin
    for Count2:=1 to GridHistTraining.RowCount do begin    // reset baris ke 3
      GridHistTraining.Cells[Count,Count2]:='';
    end;
  end;
  For Count:=0 to Length(TrainingArr)-1 do begin
    for Count2:=0 to 8 do
    GridHistTraining.Cells[Count2,Count+1]:=TrainingArr[Count][Count2];
    GridHistTraining.CellStyle[0,Count+1].HorizontalAlignment:=taRightJustify;
    GridHistTraining.CellStyle[8,Count+1].HorizontalAlignment:=taRightJustify;
    GridHistTraining.CellStyle[1,Count+1].HorizontalAlignment:=taCenter;
    GridHistTraining.CellStyle[2,Count+1].HorizontalAlignment:=taCenter;
  end;
end;


procedure TEmplHistoryTrainingRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmplHistoryTrainingRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmplHistoryTrainingRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridHistTraining) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TEmplHistoryTrainingRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
  if FormRequest='DRIVERFORM' then
  begin
    LihatDataClick(Self);
  end;
end;

procedure TEmplHistoryTrainingRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TEmplHistoryTrainingRpt.CariDriverClick(Sender: TObject);
begin
  if RadTypeEmpl.ItemIndex<>0 then
  begin
    if Role='DRIVER' then
    begin
      if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',1,0,'LAPORANHISTORYTRAINING');
    end else if Role='HELPER' then
    begin
      if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus2',1,0,'LAPORANHISTORYTRAINING');
    end else begin
      if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'',1,0,'LAPORANHISTORYTRAINING');
    end;
  end else begin
    MessageBox(0,PChar('Pilih dahulu tipe karyawan'),'Laporan History Training',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TEmplHistoryTrainingRpt.CekTglSampaiClick(Sender: TObject);
begin
//  if not(Initiation) then begin
//    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
//    else TglSampai.Enabled:=False;
//  end;
end;

procedure TEmplHistoryTrainingRpt.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then
  begin
    TglSampai.Date:=Tanggal.Date;
  end;
end;

procedure TEmplHistoryTrainingRpt.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then
  begin
    Tanggal.Date:=TglSampai.Date;
  end;
end;

procedure TEmplHistoryTrainingRpt.PeriodeClick(Sender: TObject);
begin
    Case Periode.ItemIndex Of
    0 : Begin
          Tanggal.Enabled:=True;
//          CekTglSampai.Enabled:=True;
          CekTglSampaiClick(Nil);
//          Bulan.Enabled:=False;
        End;
    1 : Begin
          Tanggal.Enabled:=False;
          TglSampai.Enabled:=False;
//          CekTglSampai.Enabled:=False;
//          Bulan.Enabled:=True;
        End;
    End;
end;

procedure TEmplHistoryTrainingRpt.RadTypeEmplClick(Sender: TObject);
begin
  if FormRequest<>'DRIVERFORM' then begin
    if RadTypeEmpl.ItemIndex=1 then
    begin
      Role:='DRIVER'
    end
    else if RadTypeEmpl.ItemIndex=2 then Role:='HELPER'
    else begin
       Role:='SEMUA'
    end;
    DriverIDHistTrainingRpt:='';
    Employee_Name:='';
    Driver.Text:='';
  end;
end;

procedure TEmplHistoryTrainingRpt.Button1Click(Sender: TObject);
begin
  if Main.IsFormOpen('MateriTrainingList')=False then MateriTrainingList:=TMateriTrainingList.Create(Self,'EMPLOYETRAININGRPT');
end;

procedure TEmplHistoryTrainingRpt.Button2Click(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

end.
