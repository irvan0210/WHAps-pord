unit EmployeeHistoryTrainingListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, AdoDB, DateUtils;

type
  TEmployeeHistoryTrainingList = class(TForm)
    ToXCel: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    LihatData: TButton;
    GridHistTraining: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label3: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    Tanggal: TDateTimePicker;
    Panel1: TPanel;
    Driver: TEdit;
    RadSemuaDriver: TRadioButton;
    RadPilihDriver: TRadioButton;
    CariDriver: TButton;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure GridHistTrainingSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure GridHistTrainingDblClick(Sender: TObject);
  private
    { Private declarations }
    LokasiArr:Array of TArrString2;
    TrainingArr:Array of TArrString14;
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    FormRequest:string;
    Initiation:Boolean;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmplType:String);Overload;
  end;

var
  EmployeeHistoryTrainingList: TEmployeeHistoryTrainingList;
  FormRequest,Employee_Name,DriverIDHistTrainingList,Role: string;

implementation

uses MainU, EmployeeHistoryTrainingFormU, StrUtils;

{$R *.dfm}

constructor TEmployeeHistoryTrainingList.Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmplType:String);
begin

  if FormReq<>'' then FormRequest:=FormReq else FormRequest:='';
  if FormReq='DRIVERFORM' then
  begin
    Employee_Name:=EmployeeName;
  end;
  if EmplType<>'' then Role:=EmplType else Role:='';
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TEmployeeHistoryTrainingList.Init;
var IntCount:Integer;
myYear,myMonth,myDay : Word;
begin
  if Role='DRIVER' then
  Caption:='Training List - Driver'
  else
  Caption:='Training List - Co-Driver';
  Total.Text:='0';
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
//  Tanggal.Date:=Now();
  TglSampai.Date:=Now();


  if FormRequest='DRIVERFORM' then
  begin
    RadSemuaDriver.Visible:=False;
    RadPilihDriver.Visible:=False;
    RadPilihDriver.Checked:=True;
    Driver.Text:=Employee_Name;
    Driver.Top:=9;
    Panel1.Height:=33;
    DecodeDate(TglSampai.Date,myYear,myMonth,myDay);
    Tanggal.Date:=EncodeDate(myYear, 1, 1);
    Driver.Visible:=True;

  end
  else
  begin
    RadSemuaDriver.Visible:=True;
    RadPilihDriver.Visible:=True;
    RadSemuaDriver.Checked:=True;
    Driver.Text:='';
    Tanggal.Date:=Now();

//    CustomerComplainRpt.Caption:='Laporan Complain Customer';
    Driver.Top:=29;
    Panel1.Height:=57;
    Driver.Visible:=False;
  end;
  CariDriver.Visible:=False;

  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmployeeHistoryTrainingList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridHistTraining.ColCount:=9;
  GridHistTraining.RowCount:=1;
  GridHistTraining.WordWrap:=True;
  GridHistTraining.ColWidths[0]:=30;
  GridHistTraining.ColWidths[1]:=70;
  GridHistTraining.ColWidths[2]:=60;
  GridHistTraining.ColWidths[3]:=60;
  GridHistTraining.ColWidths[4]:=90;
  GridHistTraining.ColWidths[5]:=400;
  GridHistTraining.ColWidths[6]:=250;
  GridHistTraining.ColWidths[7]:=80;
  GridHistTraining.ColWidths[8]:=80;

  GridHistTraining.Cells[0,0]:='No.';
  GridHistTraining.Cells[1,0]:='Tanggal';
  GridHistTraining.Cells[2,0]:='Jam Mulai';
  GridHistTraining.Cells[3,0]:='Jam Selesai';
  GridHistTraining.Cells[4,0]:='Durasi';
  GridHistTraining.Cells[5,0]:='Materi';
  GridHistTraining.Cells[6,0]:='Lokasi';
  GridHistTraining.Cells[7,0]:='Trainer';
  GridHistTraining.Cells[8,0]:='Type';

  for IntCount:=0 to GridHistTraining.ColCount-1 do
  begin
    GridHistTraining.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to GridHistTraining.ColCount-1 do
    GridHistTraining.Cells[IntCount,2]:='';


end;

procedure TEmployeeHistoryTrainingList.RefreshCombo;
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

procedure TEmployeeHistoryTrainingList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId,StrDriverID,time2:String;
    IntCount,No:Integer;
    Count,Count2:Integer;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];

  if DriverIDHistTrainingList<>'' then
  begin
    StrDriverID:=' AND (a.employee_id='+QuotedStr(DriverIDHistTrainingList)+')';
  end
  else
  begin
    StrDriverID:='';
  end;

//  if Cari.Text<>'' then
//  begin
//    StrRequest:=' AND ((request LIKE ''%'+Cari.Text+'%'') OR (license_plate LIKE ''%'+Cari.Text+'%'') ) ';
//  end else
//  begin
//    StrRequest:='';
//  end;
//  Main.M_Busy;

//  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(TrainingArr,0);

    StrQry:='SELECT *,Concat(DATEDIFF(HOUR,time,finish_time) % 24 '+
            ','' Jam '', DATEDIFF(Minute,time,finish_time) % 60 , '' Menit'') duration '+
            'FROM wh_empl_history_training WHERE '+
            'date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+
            ''+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+' '+
            'AND Role='+QuotedStr(Role)+' ORDER BY empl_history_training_id DESC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;
      time2:=Qry.FieldValues['time'];
      SetLength(TrainingArr,IntCount+1);
      TrainingArr[IntCount][0]:=IntToStr(No);
      TrainingArr[IntCount][1]:=FormatDateTime('dd/mm/yyyy', Qry.FieldValues['date']);
      if Qry.FieldValues['time']<>NULL then
      TrainingArr[IntCount][2]:=LeftStr(Qry.FieldValues['time'],5) else TrainingArr[IntCount][2]:='';
      if Qry.FieldValues['finish_time']<>NULL then
      TrainingArr[IntCount][3]:=Qry.FieldValues['finish_time'] else TrainingArr[IntCount][3]:='';
      if Qry.FieldValues['finish_time']<>'  :  ' then
      TrainingArr[IntCount][4]:=Qry.FieldValues['duration'] else TrainingArr[IntCount][4]:='';
      if Qry.FieldValues['materi']<>NULL then
      TrainingArr[IntCount][5]:=Qry.FieldValues['materi'] else
      TrainingArr[IntCount][5]:='';

      if Qry.FieldValues['location']<>NULL then
      TrainingArr[IntCount][6]:=Qry.FieldValues['location'] else TrainingArr[IntCount][6]:='';


      if Qry.FieldValues['trainer']<>NULL then
      TrainingArr[IntCount][7]:=Qry.FieldValues['trainer'] else TrainingArr[IntCount][7]:='';

      if Qry.FieldValues['type']<>NULL then
      TrainingArr[IntCount][8]:=Qry.FieldValues['type'] else TrainingArr[IntCount][8]:='';
      if Qry.FieldValues['note']<>NULL then
      TrainingArr[IntCount][9]:=Qry.FieldValues['note'] else TrainingArr[IntCount][9]:='';
      TrainingArr[IntCount][10]:=Qry.FieldValues['empl_history_training_id'];

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
  for Count:=0 to 6 do begin
    for Count2:=1 to GridHistTraining.RowCount do begin    // reset baris ke 3
      GridHistTraining.Cells[Count,Count2]:='';
    end;
  end;
  For Count:=0 to Length(TrainingArr)-1 do begin
    for Count2:=0 to 6 do
    GridHistTraining.Cells[Count2,Count+1]:=TrainingArr[Count][Count2];
    GridHistTraining.CellStyle[0,Count+1].HorizontalAlignment:=taRightJustify;
    GridHistTraining.CellStyle[1,Count+1].HorizontalAlignment:=taCenter;
    GridHistTraining.CellStyle[2,Count+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TEmployeeHistoryTrainingList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryTrainingList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  Initiation:=False;
end;

procedure TEmployeeHistoryTrainingList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryTrainingList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then TglSampai.Date:=Tanggal.Date;
end;

procedure TEmployeeHistoryTrainingList.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then Tanggal.Date:=TglSampai.Date;
end;

procedure TEmployeeHistoryTrainingList.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TEmployeeHistoryTrainingList.GridHistTrainingSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeHistoryTrainingList.GridHistTrainingDblClick(
  Sender: TObject);
begin

  if (IntRow>0)AND(TrainingArr[IntRow-1][7]<>'') then
  begin
    if Role='DRIVER' then
    begin
      if Main.IsFormOpen('EmployeeHistoryTrainingForm')=False then EmployeeHistoryTrainingForm:=TEmployeeHistoryTrainingForm.Create(Self,TrainingArr[IntRow-1][10],'EMPLOYEEHISTORYTRAINING-LIST','DRIVER');
    end else
    begin
      if Main.IsFormOpen('EmployeeHistoryTrainingForm')=False then EmployeeHistoryTrainingForm:=TEmployeeHistoryTrainingForm.Create(Self,TrainingArr[IntRow-1][10],'EMPLOYEEHISTORYTRAINING-LIST','HELPER');
    end;
    with EmployeeHistoryTrainingForm do
    begin
      Tgl.Date:=StrToDate(TrainingArr[IntRow-1][1]) ;
      Jam.Text:=TrainingArr[IntRow-1][2];
      JamSelesai.Text:=TrainingArr[IntRow-1][3];
      Duration.Text:=TrainingArr[IntRow-1][4];
      Materi.Text:=TrainingArr[IntRow-1][5];
      Lokasi.Text:=TrainingArr[IntRow-1][6];
      Trainer.Text:=TrainingArr[IntRow-1][7];
      if (TrainingArr[IntRow-1][8]='Internal') then RadType.ItemIndex:=0 else RadType.ItemIndex:=1;
      Note.Text:=TrainingArr[IntRow-1][9];
    end;
  end;
end;

end.
