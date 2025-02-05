unit CustomerComplainRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, AdoDB,DateUtils,
  ExtCtrls;

type
  TCustomerComplainRpt = class(TForm)
    ToXCel: TSpeedButton;
    LihatData: TButton;
    GridCCP: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    Periode: TRadioGroup;
    Label2: TLabel;
    Bulan: TDateTimePicker;
    TglSampai: TDateTimePicker;
    CekTglSampai: TCheckBox;
    Tanggal: TDateTimePicker;
    GroupBox1: TGroupBox;
    NotCategorized: TRadioButton;
    Categorized: TRadioButton;
    CBStatus: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Driver: TEdit;
    RadSemuaDriver: TRadioButton;
    RadPilihDriver: TRadioButton;
    CariDriver: TButton;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    CBKategory: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure PeriodeClick(Sender: TObject);
    procedure GridCCPDblClick(Sender: TObject);
    procedure GridCCPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BersihkanClick(Sender: TObject);
    procedure CariDriverClick(Sender: TObject);
    procedure RadSemuaDriverClick(Sender: TObject);
    procedure RadPilihDriverClick(Sender: TObject);

  private
    { Private declarations }
    LokasiArr,BatchArr,SeatArr:Array of TArrString2;
    CCPArr:Array of TArrString25;
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    Initiation:Boolean;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeId:String='';EmployeeName:String='';FormReq:String='');Overload;

  end;

var
  CustomerComplainRpt: TCustomerComplainRpt;
  DriverIDCustComplain,Employee_Name,FormRequest: string;


implementation

uses MainU, CustomerComplainFormU, CustomerComplainInvestigationFormU, 
  EmployeeListU, Math;

{$R *.dfm}

constructor TCustomerComplainRpt.Create(AOwner:TComponent;EmployeeId:String='';EmployeeName:String='';FormReq:String='');
begin
  if FormReq='DRIVERFORM' then
  begin
    FormRequest:=FormReq;
    DriverIDCustComplain:=EmployeeId;
    Employee_Name:=EmployeeName;
  end else
  begin
    FormRequest:='';
    DriverIDCustComplain:='';
    Employee_Name:='';
  end;
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustomerComplainRpt.Init;
var IntCount:Integer;
myYear,myMonth,myDay : Word;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
//  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Bulan.Date:=Now();

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

//    CustomerComplainRpt.Caption:='History Complain Customer';
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
  Categorized.Checked:=True;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TCustomerComplainRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridCCP.ColCount:=23;
  GridCCP.RowCount:=1;
  GridCCP.WordWrap:=True;
  GridCCP.ColWidths[0]:=30;
  GridCCP.ColWidths[1]:=70;
  GridCCP.ColWidths[2]:=150;
  GridCCP.ColWidths[3]:=80;
  GridCCP.ColWidths[4]:=150;
  GridCCP.ColWidths[5]:=65;
  GridCCP.ColWidths[6]:=65;
  GridCCP.ColWidths[7]:=65;
  GridCCP.ColWidths[8]:=65;
  GridCCP.ColWidths[9]:=65;
  GridCCP.ColWidths[10]:=90;

  GridCCP.ColWidths[11]:=150;
  GridCCP.ColWidths[12]:=0;
  GridCCP.ColWidths[13]:=150;
  GridCCP.ColWidths[14]:=150;
  GridCCP.ColWidths[15]:=150;
  GridCCP.ColWidths[16]:=50;
  GridCCP.ColWidths[17]:=50;
  GridCCP.ColWidths[18]:=50;
  GridCCP.ColWidths[19]:=150;
  GridCCP.ColWidths[20]:=150;
  GridCCP.ColWidths[21]:=180;
  GridCCP.ColWidths[22]:=50;

  GridCCP.SizingHeight:=True;

  GridCCP.Cells[0,0]:='No.';
  GridCCP.Cells[1,0]:='Tanggal';
  GridCCP.Cells[2,0]:='Customer/Sales';
  GridCCP.Cells[3,0]:='Tgl. Pemakaian';
  GridCCP.Cells[4,0]:='No Pol/Type/Driver';
  GridCCP.Cells[5,0]:='Kebersihan';
  GridCCP.Cells[6,0]:='Fasilitas';
  GridCCP.Cells[7,0]:='Pelayanan';
  GridCCP.Cells[8,0]:='Penjemputan';
  GridCCP.Cells[9,0]:='Mogok';
  GridCCP.Cells[10,0]:='Driver Bermasalah';

  GridCCP.Cells[11,0]:='Detail Komplain';
  GridCCP.Cells[13,0]:='Analisa';
  GridCCP.Cells[14,0]:='Perbaikan';
  GridCCP.Cells[15,0]:='Rencana Perbaikan';
  GridCCP.Cells[16,0]:='Crew';
  GridCCP.Cells[17,0]:='Staf';
  GridCCP.Cells[18,0]:='Teknikal';
  GridCCP.Cells[19,0]:='Verifikasi Hasil Perbaikan';
  GridCCP.Cells[20,0]:='Verifikasi Tindakan Perbaikan';
  GridCCP.Cells[21,0]:='Ketidaksesuaian';
  GridCCP.Cells[22,0]:='Closed';


  for IntCount:=0 to GridCCP.ColCount-1 do
  begin
    GridCCP.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.Cells[IntCount,2]:='';
//
//    for I := 0 to StringGrid1.ColCount - 1 do
//    StringGrid1.Cols[I].Clear;


end;

procedure TCustomerComplainRpt.RefreshGrid;
var IntCount,Count2,Count:Integer;
begin
  for Count:=0 to 23 do begin
    for Count2:=1 to GridCCP.RowCount do begin    // reset baris ke 3
      GridCCP.Cells[Count,Count2]:='';
      GridCCP.CellStyle[Count,Count2].BGColor:=clWindow;
    end;
  end;
  GridCCP.RowCount:=Length(CCPArr)+1;
  for IntCount:=0 to Length(CCPArr)-1 do begin
    GridCCP.Cells[0,IntCount+1]:=CCPArr[IntCount][0];
    GridCCP.Cells[1,IntCount+1]:=CCPArr[IntCount][1];
    GridCCP.Cells[2,IntCount+1]:=CCPArr[IntCount][2];
    GridCCP.Cells[3,IntCount+1]:=CCPArr[IntCount][3];
    GridCCP.Cells[4,IntCount+1]:=CCPArr[IntCount][4];
    GridCCP.Cells[5,IntCount+1]:=CCPArr[IntCount][5];
    GridCCP.Cells[6,IntCount+1]:=CCPArr[IntCount][6];
    GridCCP.Cells[7,IntCount+1]:=CCPArr[IntCount][7];
    GridCCP.Cells[8,IntCount+1]:=CCPArr[IntCount][8];
    GridCCP.Cells[9,IntCount+1]:=CCPArr[IntCount][9];
    GridCCP.Cells[10,IntCount+1]:=CCPArr[IntCount][10];
    GridCCP.Cells[11,IntCount+1]:=CCPArr[IntCount][11];
    GridCCP.Cells[12,IntCount+1]:=CCPArr[IntCount][13];

    GridCCP.Cells[13,IntCount+1]:=CCPArr[IntCount][14];
    GridCCP.Cells[14,IntCount+1]:=CCPArr[IntCount][15];
    GridCCP.Cells[15,IntCount+1]:=CCPArr[IntCount][21];
    GridCCP.Cells[16,IntCount+1]:=CCPArr[IntCount][16];
    GridCCP.Cells[17,IntCount+1]:=CCPArr[IntCount][17];

    GridCCP.Cells[18,IntCount+1]:=CCPArr[IntCount][18];
    GridCCP.Cells[19,IntCount+1]:=CCPArr[IntCount][22];
    GridCCP.Cells[20,IntCount+1]:=CCPArr[IntCount][23];
    GridCCP.Cells[22,IntCount+1]:=CCPArr[IntCount][19];
    GridCCP.Cells[21,IntCount+1]:=CCPArr[IntCount][24];
    GridCCP.CellStyle[0,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[1,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[2,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[3,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[4,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[5,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[6,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[7,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[8,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[9,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[10,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[12,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[13,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[14,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[15,IntCount+1].WordWrap:=True;
    GridCCP.CellStyle[16,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[17,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[18,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[19,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[20,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[20,IntCount+1].WordWrap:=False;
    GridCCP.CellStyle[22,IntCount+1].WordWrap:=False;

    GridCCP.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[7,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[8,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[16,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[17,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[18,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[19,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[20,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[21,IntCount+1].HorizontalAlignment:=taLeftJustify;
    GridCCP.CellStyle[22,IntCount+1].HorizontalAlignment:=taCenter;

    if (GridCCP.Cells[22,IntCount+1])='v' then begin
      for Count2:=0 to GridCCP.ColCount do GridCCP.CellStyle[Count2,IntCount+1].Font.Color:=clGreen;
    end else begin
      for Count2:=0 to GridCCP.ColCount do GridCCP.CellStyle[Count2,IntCount+1].Font.Color:=clWindowText;
    end;
//    if LowerCase(Trim(StrGrid.Cells[25,Count]))<>'completed' then begin
//      for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clRed;
//    end else begin
//      for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
//    end;
  end;
end;


procedure TCustomerComplainRpt.RefreshCombo;
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
    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id='+StrCompanyId+';';
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
{  for IntCount:=0 to Length(LokasiArr)-1 do Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
}

  Main.M_Normal;
end;

procedure TCustomerComplainRpt.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompanyId,StrCustomerId,StrDate,StrDatesTo,StrOrder,StrJenisFilterTgl,StrClose,StrDriverID,StrKategory:String;
    Qry:TADOQuery;
    IntCount:Integer;
    myYear, myMonth, myDay : Word;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(CCPArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    if CBStatus.Text<>'Semua' then
    begin
      StrClose:=',@StatusClosed='+QuotedStr(CBStatus.Text);
    end else begin
      StrClose:='';
    end;

    If Periode.ItemIndex=0 Then Begin
      if CekTglSampai.Checked then begin
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date));
        StrOrder:=',@Ordered='+QuotedStr('ccp.update_time, customer_name')
      end else begin
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
        StrOrder:=',@Ordered='+QuotedStr('customer_name');
      end;
    End
    Else Begin
        DecodeDate(Bulan.Date, myYear, myMonth, myDay);
        StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)));
        StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))));
        StrOrder:=',@Ordered='+QuotedStr('ccp.update_time, customer_name')
    End;

    StrAllFoward := ',@AllFoward=-1';
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocation:=LocationId;

    if NotCategorized.Checked=True then
    begin
      StrJenisFilterTgl:=',@JenisFilterTgl=''1''';
    end
    else begin
       StrJenisFilterTgl:=',@JenisFilterTgl=''2''';
    end;

    if DriverIDCustComplain<>'' then
    begin
      StrDriverID:=',@DriverID='+QuotedStr(DriverIDCustComplain);
    end
    else
    begin
      StrDriverID:='';
    end;

    if CBKategory.ItemIndex =1 then
    StrKategory :=', @FilterKategory='+QuotedStr('kebersihan_status')
    else if CBKategory.ItemIndex =2 then
    StrKategory :=', @FilterKategory='+QuotedStr('fasilitas_status')
    else if CBKategory.ItemIndex =3 then
    StrKategory :=', @FilterKategory='+QuotedStr('pelayanan_status')
    else if CBKategory.ItemIndex =4 then
    StrKategory :=', @FilterKategory='+QuotedStr('penjemputan_status')
    else if CBKategory.ItemIndex =5 then
    StrKategory :=', @FilterKategory='+QuotedStr('mogok_status')
    else if CBKategory.ItemIndex =6 then
    StrKategory :=', @FilterKategory='+QuotedStr('driver_bermasalah_status')
    else StrKategory := '';

    {StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrAllFoward+',@List=1; ';}
    StrQry:='EXEC GetCustomerComplainRpt '+StrLocation+',1,'+StrCompanyId+StrDate+StrDatesTo+StrJenisFilterTgl+StrClose+StrDriverID+StrKategory;

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(CCPArr,IntCount+1);
       CCPArr[IntCount][0]:=IntToStr(IntCount+1);
       CCPArr[IntCount][1]:=Qry.FieldValues['updatedate'];
       CCPArr[IntCount][2]:=Qry.FieldValues['customer_name'];//+Chr(13)+Chr(10)+Qry.FieldValues['SalesId'];
       CCPArr[IntCount][3]:=Qry.FieldValues['from_dates_l']+' s/d '+Qry.FieldValues['to_dates_l'];
       CCPArr[IntCount][4]:=Qry.FieldValues['PlatNo_Driver'];
       if Qry.FieldValues['kebersihan_status']<>'0' then CCPArr[IntCount][5]:='v';//Qry.FieldValues['kebersihan_status'];
       if Qry.FieldValues['fasilitas_status']<>'0' then CCPArr[IntCount][6]:='v';//Qry.FieldValues['fasilitas_status'];
       if Qry.FieldValues['pelayanan_status']<>'0' then CCPArr[IntCount][7]:='v';//Qry.FieldValues['pelayanan_status'];
       if Qry.FieldValues['penjemputan_status']<>'0' then CCPArr[IntCount][8]:='v';//Qry.FieldValues['penjemputan_status'];
       if Qry.FieldValues['mogok_status']<>'0' then CCPArr[IntCount][9]:='v';//Qry.FieldValues['penjemputan_status'];
       if Qry.FieldValues['driver_bermasalah_status']<>'0' then CCPArr[IntCount][10]:='v';//Qry.FieldValues['driver_bermasalah_status'];
       CCPArr[IntCount][11]:=Qry.FieldValues['ComplainInDetail'];
       CCPArr[IntCount][12]:=Qry.FieldValues['Cust_Complain_Id'];
       CCPArr[IntCount][13]:=Qry.FieldValues['vhc_trans_id'];

       if Qry.FieldValues['investigation']<>NULL then CCPArr[IntCount][14]:=Qry.FieldValues['investigation'];
       if Qry.FieldValues['handling']<>NULL then CCPArr[IntCount][15]:=Qry.FieldValues['handling'];

       if Qry.FieldValues['iscrew']=1 then CCPArr[IntCount][16]:='v';
       if Qry.FieldValues['isstaf']=1 then CCPArr[IntCount][17]:='v';
       if Qry.FieldValues['isteknikal']=1 then CCPArr[IntCount][18]:='v';
       if Qry.FieldValues['is_closed']<>'0' then CCPArr[IntCount][19]:='v';
       if Qry.FieldValues['closed_reason']<>NULL then CCPArr[IntCount][20]:=Qry.FieldValues['closed_reason'];
       if Qry.FieldValues['renc_tindakan_perbaikan']<>NULL then CCPArr[IntCount][21]:=Qry.FieldValues['renc_tindakan_perbaikan'];
       if Qry.FieldValues['tgl_perlu_verifikasi_ulang_hasil']<>NULL then CCPArr[IntCount][22]:='v';
       if Qry.FieldValues['tgl_perlu_verifikasi_ulang_tindakan']<>NULL then CCPArr[IntCount][23]:='v';
       if Qry.FieldValues['no_ketidaksesuaian_perbaikan']<>NULL then CCPArr[IntCount][24]:=Qry.FieldValues['no_ketidaksesuaian_perbaikan'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainRpt.FormShow(Sender: TObject);
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

procedure TCustomerComplainRpt.LihatDataClick(Sender: TObject);
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

procedure TCustomerComplainRpt.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TCustomerComplainRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridCCP) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TCustomerComplainRpt.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

procedure TCustomerComplainRpt.PeriodeClick(Sender: TObject);
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

procedure TCustomerComplainRpt.GridCCPDblClick(Sender: TObject);
begin
  if (IntCol>0) and (IntCol<=12) and (GridCCP.Cells[0,IntRow]<>'') then begin
      if Main.IsFormOpen('CustomerComplainForm')=False then CustomerComplainForm:=TCustomerComplainForm.Create(nil, CCPArr[IntRow-1][12],'',0);
  end else if (IntCol>12) and (IntCol<=18) and (GridCCP.Cells[0,IntRow]<>'') then begin
      if (Main.IsFormOpen('CustomerComplainInvestigationForm')=False) then
        CustomerComplainInvestigationForm:=TCustomerComplainInvestigationForm.Create(nil, CCPArr[IntRow-1][12], CCPArr[IntRow-1][13], 0, '', 1);
  end;
end;

procedure TCustomerComplainRpt.GridCCPSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    IntRow:=ARow;
    IntCol:=ACol;
end;

procedure TCustomerComplainRpt.BersihkanClick(Sender: TObject);
begin

//  RefreshCombo;
end;

procedure TCustomerComplainRpt.CariDriverClick(Sender: TObject);
begin
  if Main.IsFormOpen('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Bus',1,0,'LAPORANKOMPLAINCUSTOMER');
end;

procedure TCustomerComplainRpt.RadSemuaDriverClick(Sender: TObject);
begin
  if RadSemuaDriver.Checked=True then
  begin
    CariDriver.Visible:=False;
    Driver.Visible:=False;
    Driver.Text:='';
    DriverIDCustComplain:='';
  end;
end;

procedure TCustomerComplainRpt.RadPilihDriverClick(Sender: TObject);
begin
  if RadPilihDriver.Checked=True then
  begin
    CariDriver.Visible:=True;
    Driver.Visible:=True;
    Driver.Text:='';
  end;
end;

End.
