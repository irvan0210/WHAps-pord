unit EmployeeHistoryLakaRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHUnit,
  AdoDB, DateUtils;

type
  TEmployeeHistoryLakaRpt = class(TForm)
    ToXCel: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    LihatData: TButton;
    GridHistLaka: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    Periode: TRadioGroup;
    Bulan: TDateTimePicker;
    TglSampai: TDateTimePicker;
    CekTglSampai: TCheckBox;
    Tanggal: TDateTimePicker;
    Panel1: TPanel;
    Label5: TLabel;
    Driver: TEdit;
    RadSemuaDriver: TRadioButton;
    RadPilihDriver: TRadioButton;
    CariDriver: TButton;
    GroupTotal: TGroupBox;
    Label1: TLabel;
    Total: TMemo;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Batch: TComboBox;
    Label7: TLabel;
    Seat: TComboBox;
    SBUtemp: TComboBox;
    Label8: TLabel;
    JenisKecelakaan: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure RadSemuaDriverClick(Sender: TObject);
    procedure RadPilihDriverClick(Sender: TObject);
    procedure PeriodeClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure GridHistLakaDblClick(Sender: TObject);
    procedure GridHistLakaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,BatchArr,SeatArr,JenisKecelakaanArr:Array of TArrString2;
    EmplHistLaKaArr:Array of TArrString35;
    CompanyArr,CompanyArrTemp,CompanyLocationArr:Array of TArrString8;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    Initiation:Boolean;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshSeat;
  public
    { Public declarations }
     constructor Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmployeeID:string);Overload;
  end;

var
  EmployeeHistoryLakaRpt: TEmployeeHistoryLakaRpt;
  FormRequest,Employee_Name,DriverIDHistLakaRpt: string;

implementation

uses MainU, EmployeeListU, EmployeeHistoryLakaFormU;

{$R *.dfm}

constructor TEmployeeHistoryLakaRpt.Create(AOwner:TComponent;FormReq:String;EmployeeName:string;EmployeeID:string);
begin

  if FormReq<>'' then FormRequest:=FormReq else FormRequest:='';
  if FormReq='DRIVERFORM' then
  begin
    DriverIDHistLakaRpt:=EmployeeID;
    Employee_Name:=EmployeeName;
  end;

  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TEmployeeHistoryLakaRpt.RefreshSeat;
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
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
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

procedure TEmployeeHistoryLakaRpt.Init;
var IntCount:Integer;
myYear,myMonth,myDay : Word;
begin
  if FormRequest='LAKA-LIST' then
  Caption:='Data History LaKa'
  else Caption:='Laporan History LaKa' ;
  Total.Text:='0';
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
//  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Bulan.Date:=Now();
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;

  if FormRequest='DRIVERFORM' then
  begin
    Label5.Visible:=True;
    RadSemuaDriver.Visible:=False;
    RadPilihDriver.Visible:=False;
    RadPilihDriver.Checked:=True;
    Driver.Text:=Employee_Name;
    Label5.Left:=8;
    Label5.Top:=9;
    Driver.Top:=9;
    Panel1.Height:=33;
    DecodeDate(TglSampai.Date,myYear,myMonth,myDay);
    Tanggal.Date:=EncodeDate(myYear, 1, 1);
    CekTglSampai.Checked:=True;
    TglSampai.Enabled:=True;
    Bulan.Enabled:=False;
    Driver.Visible:=True;

  end
  else
  begin
    Label5.Visible:=False;
    RadSemuaDriver.Visible:=True;
    RadPilihDriver.Visible:=True;
    RadSemuaDriver.Checked:=True;
    Driver.Text:='';
    Tanggal.Date:=Now();

//    CustomerComplainRpt.Caption:='Laporan Complain Customer';
    Driver.Top:=29;
    Panel1.Height:=57;
    CekTglSampai.Checked:=False;
    TglSampai.Enabled:=False;
    Bulan.Enabled:=False;
    Driver.Visible:=False;
  end;
  CariDriver.Visible:=False;

  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmployeeHistoryLakaRpt.RefreshCombo;
var StrQry,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
    isFound:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
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
      Inc(IntCount);
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;

    {Init data from User RD Location}
    StrQry:='EXEC GetUserRDLocationList @UserName='+QuotedStr(User)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    isFound := False;
    if Qry.RecordCount>0 then begin
      SetLength(CompanyArrTemp,0);
      SetLength(CompanyArrTemp,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        CompanyArrTemp[IntCount][0]:=Qry.FieldValues['company_location_id'];
        CompanyArrTemp[IntCount][1]:=Qry.FieldValues['company_id'];
        CompanyArrTemp[IntCount][2]:=Qry.FieldValues['location_id'];
        CompanyArrTemp[IntCount][3]:=Qry.FieldValues['name'];
        CompanyArrTemp[IntCount][4]:=Qry.FieldValues['location'];
        CompanyArrTemp[IntCount][5]:=Qry.FieldValues['company_code'];
        Inc(IntCount);
        Qry.Next;
      end;
      SBUtemp.Items.Clear;
      for IntCount:=0 to Length(CompanyArrTemp)-1  do begin
        SBUtemp.Items.Add(CompanyArrTemp[IntCount][3]+' ('+CompanyArrTemp[IntCount][4]+')');
        if (CompanyId=CompanyArrTemp[IntCount][1]) and  (LocationId=CompanyArrTemp[IntCount][2]) then begin
          SBUtemp.ItemIndex:=IntCount;
          isFound:= True;
        end;
      end;
      if isFound then begin
        GroupCompany.Enabled:=True;
        SBU.Items.Clear;
        SBU.Items := SBUtemp.Items;
        SetLength(CompanyArr,0);
        CompanyArr := CompanyArrTemp;
        SBU.ItemIndex := SBUtemp.ItemIndex;
      end;
    end;


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

    JenisKecelakaan.Clear;

    Qry.Close;
    StrQry:='SELECT * FROM wh_accident_type WHERE status=1';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(JenisKecelakaanArr,IntCount+1);
      JenisKecelakaanArr[IntCount][0]:=Qry.FieldValues['accident_type_id'];
      JenisKecelakaanArr[IntCount][1]:=Qry.FieldValues['accident_type'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;

    JenisKecelakaan.Text:='';
    JenisKecelakaan.Items.Clear;
    JenisKecelakaan.ItemIndex:=-1;
    JenisKecelakaan.Items.Add('Semua');
    for IntCount:=0 to Length(JenisKecelakaanArr)-1 do
      JenisKecelakaan.Items.Add(JenisKecelakaanArr[IntCount][1]);
    JenisKecelakaan.ItemIndex:=0;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  //if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;

  Main.M_Normal;
end;

procedure TEmployeeHistoryLakaRpt.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompanyId,StrCustomerId,StrDate,StrDatesTo,StrOrder,StrJenisKecelakaan,
StrJenisFilterTgl,StrClose,StrDriverID,StrBatchId,StrSeat:String;
    Qry:TADOQuery;
    IntCount:Integer;
    myYear, myMonth, myDay : Word;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(EmplHistLaKaArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;

    If Periode.ItemIndex=0 Then Begin
      if CekTglSampai.Checked then begin
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date));
      end else begin
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
      end;
    End
    Else Begin
        DecodeDate(Bulan.Date, myYear, myMonth, myDay);
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))));
    End;

    StrLocation:=LocationId;

    if DriverIDHistLakaRpt<>'' then
    begin
      StrDriverID:=',@DriverID='+QuotedStr(DriverIDHistLakaRpt);
    end
    else
    begin
      StrDriverID:='';
    end;

    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchID='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';
    if Seat.Text<>'All' then begin
      StrSeat:=',@Seat='+Seat.Text;
    end else StrSeat:='';

    if (JenisKecelakaan.Text<>'Semua') then
    begin
      StrJenisKecelakaan:=',@JenisKecelakaan='+JenisKecelakaanArr[JenisKecelakaan.ItemIndex-1][0];
    end else StrJenisKecelakaan:='';

    {StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrAllFoward+',@List=1; ';}
    StrQry:='EXEC GetEmployeeHistoryLakaList '+StrLocation+StrDate+StrDatesTo+StrJenisFilterTgl+StrDriverID+StrBatchId+StrSeat+StrJenisKecelakaan;

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(EmplHistLaKaArr,IntCount+1);
       EmplHistLaKaArr[IntCount][0]:=IntToStr(IntCount+1);
       EmplHistLaKaArr[IntCount][1]:=Qry.FieldValues['date'];
       if Qry.FieldValues['name']<>NULL then EmplHistLaKaArr[IntCount][2]:=Qry.FieldValues['name'];
       if Qry.FieldValues['location']<>NULL then EmplHistLaKaArr[IntCount][3]:=Qry.FieldValues['location'];
       if Qry.FieldValues['time']<>NULL then EmplHistLaKaArr[IntCount][4]:=Qry.FieldValues['time'];
       if Qry.FieldValues['damage']<>NULL then EmplHistLaKaArr[IntCount][5]:=Qry.FieldValues['damage'];
       if Qry.FieldValues['victims_name']<>NULL then EmplHistLaKaArr[IntCount][6]:=Qry.FieldValues['victims_name'];
       if Qry.FieldValues['victims_age']<>NULL then EmplHistLaKaArr[IntCount][7]:=Qry.FieldValues['victims_age'];
       if Qry.FieldValues['work_period_year']<>NULL then EmplHistLaKaArr[IntCount][8]:=Qry.FieldValues['work_period_year'];
       if Qry.FieldValues['tools']<>NULL then EmplHistLaKaArr[IntCount][9]:=Qry.FieldValues['tools'];
       if Qry.FieldValues['activity']<>NULL then EmplHistLaKaArr[IntCount][10]:=Qry.FieldValues['activity'];
       if Qry.FieldValues['amount']<>NULL then EmplHistLaKaArr[IntCount][11]:=SToCurr(Qry.FieldValues['amount']);
       if Qry.FieldValues['amount_desc']<>NULL then EmplHistLaKaArr[IntCount][12]:=Qry.FieldValues['amount_desc'];
       if Qry.FieldValues['absent']<>NULL then EmplHistLaKaArr[IntCount][13]:=Qry.FieldValues['absent'];
       if Qry.FieldValues['chronology']<>NULL then EmplHistLaKaArr[IntCount][14]:=Qry.FieldValues['chronology'];
       if Qry.FieldValues['incident1']<>NULL then EmplHistLaKaArr[IntCount][15]:=Qry.FieldValues['incident1'];
       if Qry.FieldValues['incident2']<>NULL then EmplHistLaKaArr[IntCount][16]:=Qry.FieldValues['incident2'];
       if Qry.FieldValues['note_spv']<>NULL then EmplHistLaKaArr[IntCount][17]:=Qry.FieldValues['note_spv'];
       if Qry.FieldValues['note_mr']<>NULL then EmplHistLaKaArr[IntCount][18]:=Qry.FieldValues['note_mr'];
       if Qry.FieldValues['note_direktur']<>NULL then EmplHistLaKaArr[IntCount][19]:=Qry.FieldValues['note_direktur'];
       if Qry.FieldValues['unsafe_action']<>NULL then EmplHistLaKaArr[IntCount][20]:=Qry.FieldValues['unsafe_action'];
       if Qry.FieldValues['unsafe_condition']<>NULL then EmplHistLaKaArr[IntCount][21]:=Qry.FieldValues['unsafe_condition'];
       if Qry.FieldValues['personal_factor']<>NULL then EmplHistLaKaArr[IntCount][22]:=Qry.FieldValues['personal_factor'];
       if Qry.FieldValues['job_factor']<>NULL then EmplHistLaKaArr[IntCount][23]:=Qry.FieldValues['job_factor'];
       if Qry.FieldValues['work_period_month']<>NULL then EmplHistLaKaArr[IntCount][24]:=Qry.FieldValues['work_period_month'];
       EmplHistLaKaArr[IntCount][25]:=Qry.FieldValues['employee_id'];
       EmplHistLaKaArr[IntCount][26]:=Qry.FieldValues['empl_history_laka_id'];
       EmplHistLaKaArr[IntCount][27]:=Qry.FieldValues['empl_history_id'];
       if Qry.FieldValues['vehicle_id'] <> NULL then EmplHistLaKaArr[IntCount][28]:=Qry.FieldValues['vehicle_id'];

       if Qry.FieldValues['license_plate'] <> NULL then begin
         if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            EmplHistLaKaArr[IntCount][29]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
         else
            EmplHistLaKaArr[IntCount][29]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
       end;
       
       if Qry.FieldValues['batch_name'] <> NULL then EmplHistLaKaArr[IntCount][30]:=Qry.FieldValues['batch_name'];
       if Qry.FieldValues['seat'] <> NULL then EmplHistLaKaArr[IntCount][31]:=Qry.FieldValues['seat'];
       if Qry.FieldValues['create_date'] <> NULL then EmplHistLaKaArr[IntCount][32]:=Qry.FieldValues['create_date'];
       if Qry.FieldValues['accident_type_id'] <> NULL then EmplHistLaKaArr[IntCount][33]:=Qry.FieldValues['accident_type_id'];
       if Qry.FieldValues['accident_type'] <> NULL then EmplHistLaKaArr[IntCount][34]:=Qry.FieldValues['accident_type'];
       Inc(IntCount);
      Qry.Next;
    end;
    Total.Text:=IntToStr(Qry.RecordCount);
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryLakaRpt.RefreshGrid;
var IntCount,Count2,Count:Integer;
IntTotalSum : Int64;
begin
  for Count:=0 to 24 do begin
    for Count2:=1 to GridHistLaka.RowCount do begin  
      GridHistLaka.Cells[Count,Count2]:='';
      GridHistLaka.CellStyle[Count,Count2].BGColor:=clWindow;
    end;
  end;
  GridHistLaka.RowCount:=Length(EmplHistLaKaArr)+1;
  IntTotalSum:=0;
  for IntCount:=0 to Length(EmplHistLaKaArr)-1 do begin
    GridHistLaka.Cells[0,IntCount+1]:=EmplHistLaKaArr[IntCount][0];
    GridHistLaka.Cells[1,IntCount+1]:=EmplHistLaKaArr[IntCount][1];
    GridHistLaka.Cells[2,IntCount+1]:=EmplHistLaKaArr[IntCount][2];
    GridHistLaka.Cells[3,IntCount+1]:=EmplHistLaKaArr[IntCount][3];
    GridHistLaka.Cells[4,IntCount+1]:=EmplHistLaKaArr[IntCount][4];
    GridHistLaka.Cells[5,IntCount+1]:=EmplHistLaKaArr[IntCount][34];
    GridHistLaka.Cells[6,IntCount+1]:=EmplHistLaKaArr[IntCount][5];
    GridHistLaka.Cells[7,IntCount+1]:=EmplHistLaKaArr[IntCount][6];
    GridHistLaka.Cells[8,IntCount+1]:=EmplHistLaKaArr[IntCount][7]+' Tahun';
    GridHistLaka.Cells[9,IntCount+1]:=EmplHistLaKaArr[IntCount][8]+' Tahun '+EmplHistLaKaArr[IntCount][24]+' Bulan';
    GridHistLaka.Cells[10,IntCount+1]:=EmplHistLaKaArr[IntCount][9];
    GridHistLaka.Cells[11,IntCount+1]:=EmplHistLaKaArr[IntCount][10];
    GridHistLaka.Cells[12,IntCount+1]:=EmplHistLaKaArr[IntCount][11];
    GridHistLaka.Cells[13,IntCount+1]:=EmplHistLaKaArr[IntCount][12];

    GridHistLaka.Cells[14,IntCount+1]:=EmplHistLaKaArr[IntCount][13];
    GridHistLaka.Cells[15,IntCount+1]:=EmplHistLaKaArr[IntCount][14];
    GridHistLaka.Cells[16,IntCount+1]:=EmplHistLaKaArr[IntCount][15];
    GridHistLaka.Cells[17,IntCount+1]:=EmplHistLaKaArr[IntCount][16];
    GridHistLaka.Cells[18,IntCount+1]:=EmplHistLaKaArr[IntCount][17];

    GridHistLaka.Cells[19,IntCount+1]:=EmplHistLaKaArr[IntCount][18];
    GridHistLaka.Cells[20,IntCount+1]:=EmplHistLaKaArr[IntCount][19];
    GridHistLaka.Cells[21,IntCount+1]:=EmplHistLaKaArr[IntCount][20];
    GridHistLaka.Cells[22,IntCount+1]:=EmplHistLaKaArr[IntCount][21];
    GridHistLaka.Cells[23,IntCount+1]:=EmplHistLaKaArr[IntCount][22];
    GridHistLaka.Cells[24,IntCount+1]:=EmplHistLaKaArr[IntCount][23];

    IntTotalSum:=IntTotalSum+StrToInt64(ToString(EmplHistLaKaArr[IntCount][11]));

    GridHistLaka.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    GridHistLaka.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
    GridHistLaka.CellStyle[12,IntCount+1].HorizontalAlignment:=taRightJustify;
    GridHistLaka.CellStyle[14,IntCount+1].HorizontalAlignment:=taRightJustify;


    if (GridHistLaka.Cells[22,IntCount+1])='v' then begin
      for Count2:=0 to GridHistLaka.ColCount do GridHistLaka.CellStyle[Count2,IntCount+1].Font.Color:=clGreen;
    end else begin
      for Count2:=0 to GridHistLaka.ColCount do GridHistLaka.CellStyle[Count2,IntCount+1].Font.Color:=clWindowText;
    end;
  end;
  GridHistLaka.RowCount:=GridHistLaka.RowCount+1;
  GridHistLaka.Cells[11,GridHistLaka.RowCount-1]:='TOTAL';
  GridHistLaka.Cells[12,GridHistLaka.RowCount-1]:=IToCurr(IntTotalSum);
  GridHistLaka.CellStyle[11,GridHistLaka.RowCount-1].HorizontalAlignment:=taRightJustify;
  GridHistLaka.CellStyle[12,GridHistLaka.RowCount-1].HorizontalAlignment:=taRightJustify;
end;

procedure TEmployeeHistoryLakaRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryLakaRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryLakaRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshSeat;
  Initiation:=False;
  LihatDataClick(Self);
end;

procedure TEmployeeHistoryLakaRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridHistLaka.ColCount:=21;
  GridHistLaka.RowCount:=1;
  GridHistLaka.WordWrap:=True;
  GridHistLaka.ColWidths[0]:=30;
  GridHistLaka.ColWidths[1]:=70;
  GridHistLaka.ColWidths[2]:=150;
  GridHistLaka.ColWidths[3]:=150;
  GridHistLaka.ColWidths[4]:=50;
  GridHistLaka.ColWidths[5]:=150;
  GridHistLaka.ColWidths[6]:=150;
  GridHistLaka.ColWidths[7]:=150;
  GridHistLaka.ColWidths[8]:=70;
  GridHistLaka.ColWidths[9]:=90;
  GridHistLaka.ColWidths[10]:=180;
  GridHistLaka.ColWidths[11]:=150;
  GridHistLaka.ColWidths[12]:=100;
  GridHistLaka.ColWidths[13]:=100;
  GridHistLaka.ColWidths[14]:=70;
  GridHistLaka.ColWidths[15]:=450;
  GridHistLaka.ColWidths[16]:=450;
  GridHistLaka.ColWidths[17]:=450;
  GridHistLaka.ColWidths[18]:=450;
  GridHistLaka.ColWidths[19]:=450;
  GridHistLaka.ColWidths[20]:=450;

  GridHistLaka.SizingHeight:=True;

  GridHistLaka.Cells[0,0]:='No.';
  GridHistLaka.Cells[1,0]:='Tanggal';
  GridHistLaka.Cells[2,0]:='Pelapor/Driver';
  GridHistLaka.Cells[3,0]:='Lokasi';
  GridHistLaka.Cells[4,0]:='Jam';
  GridHistLaka.Cells[5,0]:='Jenis Kecelakaan';

  GridHistLaka.Cells[6,0]:='Kerusakan/Cedera';
  GridHistLaka.Cells[7,0]:='Nama Korban';
  GridHistLaka.Cells[8,0]:='Umur Korban';
  GridHistLaka.Cells[9,0]:='Lama Bekerja';
  GridHistLaka.Cells[10,0]:='Alat Yang Terlibat';
  GridHistLaka.Cells[11,0]:='Proses/Aktifitas';
  GridHistLaka.Cells[12,0]:='Materi Sejumlah';
  GridHistLaka.Cells[13,0]:='Keterangan Materi';
  GridHistLaka.Cells[14,0]:='Tidak Masuk Kerja';
  GridHistLaka.Cells[15,0]:='Kronologi';
  GridHistLaka.Cells[16,0]:='Penyebab (Sebab Langsung)';
  GridHistLaka.Cells[17,0]:='Penyebab (Sebab Dasar)';
  GridHistLaka.Cells[18,0]:='Saran Head of Crew';
  GridHistLaka.Cells[19,0]:='Saran QHSE/MR';
  GridHistLaka.Cells[20,0]:='Saran Direktur Operasional';
  GridHistLaka.Cells[21,0]:='Unsafe Action';
  GridHistLaka.Cells[22,0]:='Unsafe Condition';
  GridHistLaka.Cells[23,0]:='Personal Factor';
  GridHistLaka.Cells[24,0]:='Job Factor';

  for IntCount:=0 to GridHistLaka.ColCount-1 do
  begin
    GridHistLaka.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to GridHistLaka.ColCount-1 do
    GridHistLaka.Cells[IntCount,2]:='';
//
//    for I := 0 to StringGrid1.ColCount - 1 do
//    StringGrid1.Cols[I].Clear;


end;

procedure TEmployeeHistoryLakaRpt.LihatDataClick(Sender: TObject);
begin
  if (RadPilihDriver.Checked=True) and (Driver.Text='') then
  begin
    MessageBox(0,PChar('Silahkan Pilih Driver'),'Laporan Complain Customer',MB_OK or MB_ICONWARNING);
  end else
  begin

    RefreshData;
    RefreshGrid;
  end;
end;

procedure TEmployeeHistoryLakaRpt.RadSemuaDriverClick(Sender: TObject);
begin
  if RadSemuaDriver.Checked=True then
  begin
    CariDriver.Visible:=False;
    Driver.Visible:=False;
    Driver.Text:='';
    DriverIDHistLakaRpt:='';
  end;
end;

procedure TEmployeeHistoryLakaRpt.RadPilihDriverClick(Sender: TObject);
begin
  if RadPilihDriver.Checked=True then
  begin
    CariDriver.Visible:=True;
    Driver.Visible:=True;
    Driver.Text:='';
  end;
end;

procedure TEmployeeHistoryLakaRpt.PeriodeClick(Sender: TObject);
begin
    Case Periode.ItemIndex Of
    0 : Begin
          Tanggal.Enabled:=True;
          CekTglSampai.Enabled:=True;
          CekTglSampaiClick(Nil);
          Bulan.Enabled:=False;
        End;
    1 : Begin
          Tanggal.Enabled:=False;
          TglSampai.Enabled:=False;
          CekTglSampai.Enabled:=False;
          Bulan.Enabled:=True;
        End;
    End;
end;

procedure TEmployeeHistoryLakaRpt.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

procedure TEmployeeHistoryLakaRpt.CariDriverClick(Sender: TObject);
begin
  if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',1,0,'LAPORANHISTORYLAKA');
end;

procedure TEmployeeHistoryLakaRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridHistLaka) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TEmployeeHistoryLakaRpt.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then
  begin
    TglSampai.Date:=Tanggal.Date;
  end;
end;

procedure TEmployeeHistoryLakaRpt.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then
  begin
    Tanggal.Date:=TglSampai.Date;
  end;
end;

procedure TEmployeeHistoryLakaRpt.GridHistLakaDblClick(Sender: TObject);
var
  EmplHistLaka:string;
begin
  EmplHistLaka:= EmplHistLaKaArr[IntRow-1][27];
  if Main.IsFormOpen('EmployeeHistoryLakaForm')=False then EmployeeHistoryLakaForm:=TEmployeeHistoryLakaForm.Create(Self,'',EmplHistLaka,'EMPLOYEEHISTORYLAKA-LIST');

  with EmployeeHistoryLakaForm do
  begin
    EmplID:=EmplHistLaKaArr[IntRow-1][25];
    TglKejadian.Date:=StrToDate(EmplHistLaKaArr[IntRow-1][1]);
    Tgl.Text:=EmplHistLaKaArr[IntRow-1][32];
    Pelapor.Text:=EmplHistLaKaArr[IntRow-1][2];
    Lokasi.Text:=EmplHistLaKaArr[IntRow-1][3];
    Jam.Text:=EmplHistLaKaArr[IntRow-1][4];
    Amount.Text:=EmplHistLaKaArr[IntRow-1][11];
    AmountDesc.Text:=EmplHistLaKaArr[IntRow-1][12];
    Kerusakan.Text:=EmplHistLaKaArr[IntRow-1][5];
    NamaKorban.Text:=EmplHistLaKaArr[IntRow-1][6];
    UmurKorban.Text:=EmplHistLaKaArr[IntRow-1][7];
    AlatTerlibat.Text:=EmplHistLaKaArr[IntRow-1][9];
    Proses.Text:=EmplHistLaKaArr[IntRow-1][10];
    TdkMasukKerja.Text:=EmplHistLaKaArr[IntRow-1][13];
    Kronologi.Text:=EmplHistLaKaArr[IntRow-1][14];
    SebabLangsung.Text:=EmplHistLaKaArr[IntRow-1][15];
    SebabDasar.Text:=EmplHistLaKaArr[IntRow-1][16];
    NoteSpv.Text:=EmplHistLaKaArr[IntRow-1][17];
    NoteMR.Text:=EmplHistLaKaArr[IntRow-1][18];
    NoteDir.Text:=EmplHistLaKaArr[IntRow-1][19];
    LamaBekerjaTahun.Text:=EmplHistLaKaArr[IntRow-1][8];
    LamaBekerjaBulan.Text:=EmplHistLaKaArr[IntRow-1][24];
    VehicleIDHistLaka:= EmplHistLaKaArr[IntRow-1][28];
    JenisKecelakaan.ItemIndex:=JenisKecelakaan.Items.IndexOf(VarToStr(EmplHistLaKaArr[IntRow-1][34]));
    if VehicleIDHistLaka<>'' then
    Armada.Text:= EmplHistLaKaArr[IntRow-1][29]+' ('+EmplHistLaKaArr[IntRow-1][30]+' '+EmplHistLaKaArr[IntRow-1][31]+' Seat)';
    if (EmplHistLaKaArr[IntRow-1][20]='1') then chkUnsafeAction.Checked:=True else chkUnsafeAction.Checked:=False;
    if (EmplHistLaKaArr[IntRow-1][21]='1') then chkUnsafeCondition.Checked:=True else chkUnsafeCondition.Checked:=False;
    if (EmplHistLaKaArr[IntRow-1][22]='1') then chkPersonalFactor.Checked:=True else chkPersonalFactor.Checked:=False;
    if (EmplHistLaKaArr[IntRow-1][23]='1') then chkJobFactor.Checked:=True else chkJobFactor.Checked:=False;
  end;
end;

procedure TEmployeeHistoryLakaRpt.GridHistLakaSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeHistoryLakaRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
