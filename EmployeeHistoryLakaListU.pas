unit EmployeeHistoryLakaListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHUnit,
  AdoDB,DateUtils;

type
  TEmployeeHistoryLakaList = class(TForm)
    ToXCel: TSpeedButton;
    Label2: TLabel;
    LihatData: TButton;
    GridHistLaka: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    Tanggal: TDateTimePicker;
    Panel1: TPanel;
    Driver: TEdit;
    RadSemuaDriver: TRadioButton;
    RadPilihDriver: TRadioButton;
    CariDriver: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure GridHistLakaDblClick(Sender: TObject);
    procedure GridHistLakaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LihatDataClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure RadPilihDriverClick(Sender: TObject);
    procedure RadSemuaDriverClick(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,BatchArr,SeatArr:Array of TArrString2;
    CCPArr:Array of TArrString25;
    OrderArr:Array of TArrString30;
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    FormRequest:string;
    Initiation:Boolean;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
//    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:string);Overload;
  end;

var
  EmployeeHistoryLakaList: TEmployeeHistoryLakaList;
  DriverIDHistoryLaka:string;

implementation

uses MainU, EmployeeListU, EmployeeHistoryLakaFormU;

{$R *.dfm}

constructor TEmployeeHistoryLakaList.Create(AOwner:TComponent;Form_Request:string);
begin

  FormRequest:=Form_Request;

  inherited Create(AOwner);
end;

procedure TEmployeeHistoryLakaList.Init;
var IntCount:Integer;
myYear,myMonth,myDay : Word;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  DriverIDHistoryLaka:='';
  Driver.Text:='';
  Driver.Visible:=False;
  CariDriver.Visible:=False;
  RadSemuaDriver.Checked:=True;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmployeeHistoryLakaList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridHistLaka.ColCount:=8;
  GridHistLaka.RowCount:=1;
  GridHistLaka.WordWrap:=True;
  GridHistLaka.ColWidths[0]:=30;
  GridHistLaka.ColWidths[1]:=70;
  GridHistLaka.ColWidths[2]:=170;
  GridHistLaka.ColWidths[3]:=250;
  GridHistLaka.ColWidths[4]:=50;
  GridHistLaka.ColWidths[5]:=80;
  GridHistLaka.ColWidths[6]:=170;
  GridHistLaka.ColWidths[7]:=0;

  GridHistLaka.Cells[0,0]:='No.';
  GridHistLaka.Cells[1,0]:='Tanggal';
  GridHistLaka.Cells[2,0]:='Pelapor/Driver';
  GridHistLaka.Cells[3,0]:='Lokasi';
  GridHistLaka.Cells[4,0]:='Jam Kejadian';
  GridHistLaka.Cells[5,0]:='Nilai Materi';
  GridHistLaka.Cells[6,0]:='Keterangan Materi';
  GridHistLaka.Cells[7,0]:='';


  for IntCount:=0 to GridHistLaka.ColCount-1 do
  begin
    GridHistLaka.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to GridHistLaka.ColCount-1 do
    GridHistLaka.Cells[IntCount,2]:='';


end;

procedure TEmployeeHistoryLakaList.RefreshCombo;
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

procedure TEmployeeHistoryLakaList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId,StrDriverID:String;
    IntCount,No:Integer;
    Count,Count2:Integer;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];

  if DriverIDHistoryLaka<>'' then
  begin
    StrDriverID:=' AND (a.employee_id='+QuotedStr(DriverIDHistoryLaka)+')';
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
    SetLength(OrderArr,0);

    StrQry:='SELECT b.name,a.* FROM wh_empl_history_laka a '+
            'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
            'LEFT JOIN wh_empl_mutation c ON c.empl_mutation_id= '+
            '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation  '+
            'WHERE (employee_id=a.employee_id) AND ((from_date<=DATEADD(dd, 1,GETDATE())) '+
            'OR (GETDATE() BETWEEN from_date AND to_date) OR (to_date BETWEEN GETDATE() '+
            'AND DATEADD(dd, 1,GETDATE())))) '+
            'WHERE date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+
            ''+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+StrDriverID+' AND c.location_id='+StrLocationId+' '+
            'ORDER BY a.empl_history_laka_id DESC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(OrderArr,IntCount+1);
      OrderArr[IntCount][0]:=IntToStr(No);
      OrderArr[IntCount][1]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['date']);
      if Qry.FieldValues['name']<>NULL then
      OrderArr[IntCount][2]:=Qry.FieldValues['name'] else
      OrderArr[IntCount][2]:='';

      if Qry.FieldValues['location']<>NULL then
      OrderArr[IntCount][3]:=Qry.FieldValues['location'] else OrderArr[IntCount][3]:='';

      if Qry.FieldValues['time']<>NULL then
      OrderArr[IntCount][4]:=Qry.FieldValues['time'] else OrderArr[IntCount][4]:='';
      if Qry.FieldValues['amount']<>NULL then
      OrderArr[IntCount][5]:=SToCurr(Qry.FieldValues['amount']) else OrderArr[IntCount][5]:='0';

      if Qry.FieldValues['amount_desc']<>NULL then
      OrderArr[IntCount][6]:=Qry.FieldValues['amount_desc']
      else OrderArr[IntCount][6]:='';
      OrderArr[IntCount][7]:=Qry.FieldValues['empl_history_id'];

      if Qry.FieldValues['damage']<>NULL then
      OrderArr[IntCount][8]:=Qry.FieldValues['damage']
      else OrderArr[IntCount][8]:='';
      if Qry.FieldValues['victims_name']<>NULL then
      OrderArr[IntCount][9]:=Qry.FieldValues['victims_name']
      else OrderArr[IntCount][9]:='';
      if Qry.FieldValues['victims_age']<>NULL then
      OrderArr[IntCount][10]:=Qry.FieldValues['victims_age']
      else OrderArr[IntCount][10]:='';
      if Qry.FieldValues['tools']<>NULL then
      OrderArr[IntCount][11]:=Qry.FieldValues['tools']
      else OrderArr[IntCount][11]:='';
      if Qry.FieldValues['activity']<>NULL then
      OrderArr[IntCount][12]:=Qry.FieldValues['activity']
      else OrderArr[IntCount][12]:='';
      if Qry.FieldValues['absent']<>NULL then
      OrderArr[IntCount][13]:=Qry.FieldValues['absent']
      else OrderArr[IntCount][13]:='';
      if Qry.FieldValues['chronology']<>NULL then
      OrderArr[IntCount][14]:=Qry.FieldValues['chronology']
      else OrderArr[IntCount][14]:='';
      if Qry.FieldValues['incident1']<>NULL then
      OrderArr[IntCount][15]:=Qry.FieldValues['incident1']
      else OrderArr[IntCount][15]:='';
      if Qry.FieldValues['incident2']<>NULL then
      OrderArr[IntCount][16]:=Qry.FieldValues['incident2']
      else OrderArr[IntCount][16]:='';
      if Qry.FieldValues['note_spv']<>NULL then
      OrderArr[IntCount][17]:=Qry.FieldValues['note_spv']
      else OrderArr[IntCount][17]:='';
      if Qry.FieldValues['note_mr']<>NULL then
      OrderArr[IntCount][18]:=Qry.FieldValues['note_mr']
      else OrderArr[IntCount][18]:='';
      if Qry.FieldValues['note_direktur']<>NULL then
      OrderArr[IntCount][19]:=Qry.FieldValues['note_direktur']
      else OrderArr[IntCount][19]:='';
      if Qry.FieldValues['work_period_year']<>NULL then
      OrderArr[IntCount][20]:=Qry.FieldValues['work_period_year']
      else OrderArr[IntCount][20]:='0';
      if Qry.FieldValues['work_period_month']<>NULL then
      OrderArr[IntCount][21]:=Qry.FieldValues['work_period_month']
      else OrderArr[IntCount][21]:='0';
      if Qry.FieldValues['unsafe_action']<>NULL then
      OrderArr[IntCount][22]:=Qry.FieldValues['unsafe_action']
      else OrderArr[IntCount][22]:='0';
      if Qry.FieldValues['unsafe_condition']<>NULL then
      OrderArr[IntCount][23]:=Qry.FieldValues['unsafe_condition']
      else OrderArr[IntCount][23]:='0';
      if Qry.FieldValues['personal_factor']<>NULL then
      OrderArr[IntCount][24]:=Qry.FieldValues['personal_factor']
      else OrderArr[IntCount][24]:='0';
      if Qry.FieldValues['job_factor']<>NULL then
      OrderArr[IntCount][25]:=Qry.FieldValues['job_factor']
      else OrderArr[IntCount][25]:='0';
      if Qry.FieldValues['employee_id']<>NULL then
      OrderArr[IntCount][26]:=Qry.FieldValues['employee_id'] else
      OrderArr[IntCount][26]:='';

      Inc(IntCount);
      Qry.Next;
    end;
//    edtTotalUnitOperasi.Text := IToCurr(IntTotalUnit);

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

  if Length(OrderArr)>0 then GridHistLaka.RowCount:=Length(OrderArr)+1
  else GridHistLaka.RowCount:=2;
  for Count:=0 to 7 do begin
    for Count2:=1 to GridHistLaka.RowCount do begin    // reset baris ke 3
      GridHistLaka.Cells[Count,Count2]:='';
    end;
  end;
  For Count:=0 to Length(OrderArr)-1 do begin
    for Count2:=0 to 7 do
    GridHistLaka.Cells[Count2,Count+1]:=OrderArr[Count][Count2];
    GridHistLaka.CellStyle[0,Count+1].HorizontalAlignment:=taRightJustify;
    GridHistLaka.CellStyle[4,Count+1].HorizontalAlignment:=taCenter;
    GridHistLaka.CellStyle[5,Count+1].HorizontalAlignment:=taRightJustify;
  end;


end;

procedure TEmployeeHistoryLakaList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
end;

procedure TEmployeeHistoryLakaList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryLakaList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryLakaList.GridHistLakaDblClick(Sender: TObject);
var
pelapor: String ;
begin
  pelapor:=OrderArr[IntRow-1][2];

  if Main.IsFormOpen('EmployeeHistoryLakaForm')=False then EmployeeHistoryLakaForm:=TEmployeeHistoryLakaForm.Create(Self,'',GridHistLaka.Cells[7,IntRow],'EMPLOYEEHISTORYLAKA-LIST');

  with EmployeeHistoryLakaForm do
  begin
    EmplID:=OrderArr[IntRow-1][26];
    Tgl.Text:=OrderArr[IntRow-1][1];
    Pelapor.Text:=OrderArr[IntRow-1][2];
    Lokasi.Text:=OrderArr[IntRow-1][3];
    Jam.Text:=OrderArr[IntRow-1][4];
    Amount.Text:=OrderArr[IntRow-1][5];
    AmountDesc.Text:=OrderArr[IntRow-1][6];
    Kerusakan.Text:=OrderArr[IntRow-1][8];
    NamaKorban.Text:=OrderArr[IntRow-1][9];
    UmurKorban.Text:=OrderArr[IntRow-1][10];
    AlatTerlibat.Text:=OrderArr[IntRow-1][11];
    Proses.Text:=OrderArr[IntRow-1][12];
    TdkMasukKerja.Text:=OrderArr[IntRow-1][13];
    Kronologi.Text:=OrderArr[IntRow-1][14];
    SebabLangsung.Text:=OrderArr[IntRow-1][15];
    SebabDasar.Text:=OrderArr[IntRow-1][16];
    NoteSpv.Text:=OrderArr[IntRow-1][17];
    NoteMR.Text:=OrderArr[IntRow-1][18];
    NoteDir.Text:=OrderArr[IntRow-1][19];
    LamaBekerjaTahun.Text:=OrderArr[IntRow-1][20];
    LamaBekerjaBulan.Text:=OrderArr[IntRow-1][21];
    if (OrderArr[IntRow-1][22]='1') then chkUnsafeAction.Checked:=True else chkUnsafeAction.Checked:=False;
    if (OrderArr[IntRow-1][23]='1') then chkUnsafeCondition.Checked:=True else chkUnsafeCondition.Checked:=False;
    if (OrderArr[IntRow-1][24]='1') then chkPersonalFactor.Checked:=True else chkPersonalFactor.Checked:=False;
    if (OrderArr[IntRow-1][25]='1') then chkJobFactor.Checked:=True else chkJobFactor.Checked:=False;
  end;
end;

procedure TEmployeeHistoryLakaList.GridHistLakaSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeHistoryLakaList.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TEmployeeHistoryLakaList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date > TglSampai.Date then TglSampai.Date:=Tanggal.Date;
end;

procedure TEmployeeHistoryLakaList.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date < Tanggal.Date then Tanggal.Date:=TglSampai.Date;
end;

procedure TEmployeeHistoryLakaList.RadPilihDriverClick(Sender: TObject);
begin
  if RadPilihDriver.Checked=True then begin
    CariDriver.Visible:=True;
    Driver.Visible:=True;
    Driver.Text:='';
    DriverIDHistoryLaka:='';
  end;
end;

procedure TEmployeeHistoryLakaList.RadSemuaDriverClick(Sender: TObject);
begin
  if RadSemuaDriver.Checked=True then begin
    CariDriver.Visible:=False;
    Driver.Visible:=False;
    Driver.Text:='';
    DriverIDHistoryLaka:='';
  end;
end;

procedure TEmployeeHistoryLakaList.CariDriverClick(Sender: TObject);
begin
  if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',1,0,'HISTORYLAKALIST');
end;

end.
