unit DashboardTroublesootingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ppParameter, ppBands, ppReport,
  ppSubRpt, ppMemo, ppCtrls, jpeg, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, TeeProcs, TeEngine, Chart, Series, ComCtrls, ADODB, WHUnit,
  Buttons, frxpngimage;

type
  TDashboardTroublesooting = class(TForm)
    Sets: TPanel;
    Sets2: TPanel;
    Tutup: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Tanggal: TDateTimePicker;
    Lihat: TSpeedButton;
    Chart1: TChart;
    Series2: TBarSeries;
    LoadChart: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    TglFrom: TDateTimePicker;
    TglTo: TDateTimePicker;
    Label3: TLabel;
    PTotalKasus: TPanel;
    lblTotal: TLabel;
    ImageDone: TImage;
    Panel1: TPanel;
    Label5: TLabel;
    lblSelesai: TLabel;
    Image2: TImage;
    Panel2: TPanel;
    Label7: TLabel;
    lblOpen: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    Label9: TLabel;
    lblAchievement: TLabel;
    Image4: TImage;
    Panel4: TPanel;
    Label11: TLabel;
    lblRespon15: TLabel;
    Image5: TImage;
    Panel5: TPanel;
    Label13: TLabel;
    lblResponOver15: TLabel;
    Image6: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure LoadChartClick(Sender: TObject);
  private
    {
     Private declarations }
    procedure Init;
   // procedure RefreshCombo;
  public
    BatchArr,SeatArr:Array of TArrString2;
    CompanyLocationArr,CompanyArr,CompanyArrTemp:Array of TArrString8;
    { Public declarations }
   // constructor Create(AOwner:TComponent;Category:String='');Override;
    constructor Create(AOwner:TComponent;Date:String='';Lokasi:String='';Category:String='');overload;
    procedure LoadData;
    procedure LoadChartByType;
    procedure LoadDashboard;
    procedure LoadKPIResponse;
  end;

var
  DashboardTroublesooting: TDashboardTroublesooting;
  StrDate,StrCategory,StrWarna, StrTittle, StrLokasi :string;

implementation

uses MainU, SettingU, ChartU;

{$R *.dfm}

constructor TDashboardTroublesooting.Create(AOwner:TComponent;Date:String='';Lokasi:String='';Category:String='');
begin
  StrDate := Date+Lokasi;
  StrCategory := Category;
 // StrLokasi := Cabang;
 // StrWarna :=  Warna;
  //Main.WriteLog('Form Open: Apps='+GetFileVersion(ParamStr(0)),1);
  if Category = '1' then StrTittle :='Big Bus'
  else if Category = '2' then StrTittle :='Medium Bus'
  else if Category = '3' then StrTittle :='Mini Van'
  else StrTittle :='Sewa Luar';

 //ShowMessage('Anda klik Lokasi: ' +Lokasi);

  if Lokasi =',6,2' then StrLokasi :=' Jakarta'
  else if Lokasi =',14,9' then StrLokasi :=' Bali'
  else if Lokasi =',22,11' then StrLokasi :=' Yogyakarta'
  else if Lokasi =',24,13' then StrLokasi :=' Medan'
  else if Lokasi =',25,14' then StrLokasi :=' Semarang';
  inherited Create(AOwner);
end;

procedure TDashboardTroublesooting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TDashboardTroublesooting.TutupClick(Sender: TObject);
begin
  DashboardTroublesooting.Close;
end;

procedure TDashboardTroublesooting.FormShow(Sender: TObject);
begin
  Init;
  //LoadData;
end;

procedure TDashboardTroublesooting.Init;
begin
  Tanggal.Date := Now;
  TglFrom.Date := Now;
  TglTo.Date := Now;
  //StrCategory
end;                                                                   

{procedure TDashboardTroublesooting.LoadData;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates,
     StrLastdates, StrALL:String;
    IntCount:Integer;
    Bar: TBarSeries;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  Chart1.SeriesList.Clear;
  // Buat series baru bertipe Pie
  Bar := TBarSeries.Create(Self);
  Chart1.AddSeries(Bar);
  //Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTotalUnitPerBatchPerCabang '+StrDate+', '+StrCategory+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      if StrCategory= '1' then begin
        Bar.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('batch').AsString, // Label    ,25,14
              clGreen                        // Warna otomatis
            );
      end else if StrCategory= '2' then begin
        Bar.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('batch').AsString, // Label    ,25,14
              clYellow                        // Warna otomatis
            );
      end else begin
        Bar.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('batch').AsString, // Label    ,25,14
              clBlue                        // Warna otomatis
            );
      end;

      Chart1.Title.Text.Text := StrTittle+StrLokasi;
      Bar.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;}
procedure TDashboardTroublesooting.LoadData;
var 
  Qry: TADOQuery;
  StrQry: String;
  BarInProgress, BarSelesai: TBarSeries;
  StrBulan, StrTahun: String;
begin
  // Asumsi nilai filter diambil dari ComboBox atau DateTimePicker di form kamu
  // Misal: cboBulan.ItemIndex + 1 atau format lainnya. Sesuaikan variabel ini:
  StrBulan := FormatDateTime('m', Tanggal.Date);
  StrTahun := FormatDateTime('yyyy', Tanggal.Date);

  Qry := TADOQuery.Create(Self);
  Qry.Connection := Main.MyConnection;
  
  // 1. Hapus semua series lama agar grafik bersih saat di-refresh
  Chart1.SeriesList.Clear;
  
  // 2. Buat Series ke-1 untuk IN PROGRESS (Batang Merah)
  BarInProgress := TBarSeries.Create(Self);
  BarInProgress.Title := 'In Progress';
  BarInProgress.SeriesColor := clRed;      // Warna batang merah
  BarInProgress.Marks.Style := smsValue;   // Memunculkan angka di atas batang
  Chart1.AddSeries(BarInProgress);
  
  // 3. Buat Series ke-2 untuk SELESAI (Batang Hijau)
  BarSelesai := TBarSeries.Create(Self);
  BarSelesai.Title := 'Selesai';
  BarSelesai.SeriesColor := clGreen;    // Warna batang hijau
  BarSelesai.Marks.Style := smsValue;   // Memunculkan angka di atas batang
  Chart1.AddSeries(BarSelesai);

  if Main.OpenDb then 
  begin
    // 4. Query SQL Server dengan klausa PIVOT/Kondisional + Filter Bulanan
    StrQry := 'SELECT ' +
              '  type AS Bus_Name, ' +
              '  SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) AS In_Progress, ' +
              '  SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) AS Selesai ' +
              'FROM wh_troubleshooting ' +
              'WHERE type IS NOT NULL ' +
              '  AND MONTH(request_date) = ' + StrBulan + ' ' +
              '  AND YEAR(request_date) = ' + StrTahun + ' ' +
              'GROUP BY type ' +
              'ORDER BY type ASC;';
              
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    
    // 5. Looping Data untuk dimasukkan ke masing-masing batang grafik
    if Qry.RecordCount > 0 then 
    begin
      while not Qry.Eof do 
      begin
        // Masukkan data ke Batang Merah (In Progress)
        BarInProgress.Add(
          Qry.FieldByName('In_Progress').AsInteger, 
          Qry.FieldByName('Bus_Name').AsString
        );
        
        // Masukkan data ke Batang Hijau (Selesai)
        BarSelesai.Add(
          Qry.FieldByName('Selesai').AsInteger, 
          Qry.FieldByName('Bus_Name').AsString
        );
        
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  
  // Set Judul Grafik
  Chart1.Title.Text.Text := 'Dashboard Troubleshooting - ' + FormatDateTime('MMMM YYYY', Tanggal.Date);
  
  FreeAndNil(Qry);
  Main.CloseDb;
end;


procedure TDashboardTroublesooting.LoadChartByType;
var
  Qry: TADOQuery;
  BarTotal, BarOpen, BarSelesai: TBarSeries;
  StrQry: string;
begin
  Chart1.RemoveAllSeries;
  Chart1.View3D := False;
  Chart1.Legend.Visible := True;

  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Kasus vs Selesai Per Jenis Permintaan');

  Chart1.LeftAxis.Title.Caption := 'Jumlah TRF';

  Chart1.BottomAxis.LabelsAngle := 90;
  Chart1.BottomAxis.LabelsFont.Size := 9;
  Chart1.BottomAxis.LabelsFont.Style := [];
  Chart1.BottomAxis.LabelStyle := talText;
  Chart1.MarginBottom := 10;
  Chart1.MarginLeft := 5;
  Chart1.MarginRight := 10;
// kalau ingin font
  Chart1.BottomAxis.LabelsFont.Size := 9;
  Chart1.BottomAxis.LabelsFont.Style := [fsItalic];

  BarTotal := TBarSeries.Create(Self);
  BarTotal.Title := 'Total';
  BarTotal.Marks.Visible := True;
  BarTotal.Marks.Style := smsValue;
  Chart1.AddSeries(BarTotal);

  BarOpen := TBarSeries.Create(Self);
  BarOpen.Title := 'Open';
  BarOpen.Marks.Visible := True;
  BarOpen.Marks.Style := smsValue;
  Chart1.AddSeries(BarOpen);

  BarSelesai := TBarSeries.Create(Self);
  BarSelesai.Title := 'Selesai';
  BarSelesai.Marks.Visible := True;
  BarSelesai.Marks.Style := smsValue;
  Chart1.AddSeries(BarSelesai);

  Qry := TADOQuery.Create(nil);
  try
    Qry.Connection := Main.MyConnection;

    StrQry :=
      'EXEC dbo.GetDashboardTroubleshootingByType '+
      '@FromDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglFrom.Date))+', '+
      '@ToDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglTo.Date));

    Qry.SQL.Text := StrQry;
    Qry.Open;

    while not Qry.Eof do
    begin
      BarTotal.Add(
        Qry.FieldByName('total').AsInteger,
        Qry.FieldByName('jenis_permintaan').AsString
      );

      BarOpen.Add(
        Qry.FieldByName('open_ticket').AsInteger,
        Qry.FieldByName('jenis_permintaan').AsString
      );

      BarSelesai.Add(
        Qry.FieldByName('selesai').AsInteger,
        Qry.FieldByName('jenis_permintaan').AsString
      );

      Qry.Next;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TDashboardTroublesooting.LihatClick(Sender: TObject);
begin
  LoadData;
end;

procedure TDashboardTroublesooting.LoadChartClick(Sender: TObject);
begin
LoadChartByType;
LoadDashboard;
LoadKPIResponse;
end;

procedure TDashboardTroublesooting.LoadDashboard;
var
  Qry: TADOQuery;
  BarTotal, BarOpen, BarSelesai: TBarSeries;
  StrQry, Jenis: string;
  TotalAll, OpenAll, SelesaiAll: Integer;
  Achievement: Double;
begin
  TotalAll := 0;
  OpenAll := 0;
  SelesaiAll := 0;

  Chart1.RemoveAllSeries;
  Chart1.View3D := False;
  Chart1.Legend.Visible := True;

  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Grafik Kasus vs Selesai Per Jenis Permintaan');
  Chart1.Title.Font.Size := 16;
  Chart1.Title.Font.Style := [fsBold];
  Chart1.Title.Font.Color := clBlue;

  Chart1.LeftAxis.Title.Caption := 'Jumlah TRF';
  Chart1.LeftAxis.Title.Font.Style := [fsBold];

  // label bawah mendatar
  Chart1.BottomAxis.LabelsAngle := 0;
  Chart1.BottomAxis.LabelsFont.Size := 8;
  Chart1.BottomAxis.LabelStyle := talText;

  Chart1.MarginBottom := 10;
  Chart1.MarginLeft := 5;
  Chart1.MarginRight := 10;

  BarTotal := TBarSeries.Create(Self);
  BarTotal.Title := 'Total';
  BarTotal.SeriesColor := clBlue;
  //BarTotal.Color := RGB(52,152,219); // biru
  BarTotal.Marks.Visible := True;
  BarTotal.Marks.Style := smsValue;
  Chart1.AddSeries(BarTotal);

  BarOpen := TBarSeries.Create(Self);
  BarOpen.Title := 'Open';
  BarOpen.SeriesColor := clRed;
  //BarOpen.Color := RGB(231,76,60); // merah
  BarOpen.Marks.Visible := True;
  BarOpen.Marks.Style := smsValue;
  Chart1.AddSeries(BarOpen);

  BarSelesai := TBarSeries.Create(Self);
  BarSelesai.Title := 'Selesai';
 // BarSelesai.Color := RGB(46,204,113); // hijau
  BarSelesai.SeriesColor := clGreen;
  BarSelesai.Marks.Visible := True;
  BarSelesai.Marks.Style := smsValue;
  Chart1.AddSeries(BarSelesai);

  Qry := TADOQuery.Create(nil);
  try
    Qry.Connection := Main.MyConnection;

    StrQry :=
      'EXEC dbo.GetDashboardTroubleshootingByType '+
      '@FromDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglFrom.Date))+', '+
      '@ToDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglTo.Date));

    Qry.SQL.Text := StrQry;
    Qry.Open;

    while not Qry.Eof do
    begin
      Jenis := Qry.FieldByName('jenis_permintaan').AsString;

      if Jenis = 'Infrastruktur dan Jaringan' then
        Jenis := 'Infra & Jaringan';

      BarTotal.Add(Qry.FieldByName('total').AsInteger, Jenis);
      BarOpen.Add(Qry.FieldByName('open_ticket').AsInteger, Jenis);
      BarSelesai.Add(Qry.FieldByName('selesai').AsInteger, Jenis);

      TotalAll := TotalAll + Qry.FieldByName('total').AsInteger;
      OpenAll := OpenAll + Qry.FieldByName('open_ticket').AsInteger;
      SelesaiAll := SelesaiAll + Qry.FieldByName('selesai').AsInteger;

      Qry.Next;
    end;

  finally
    Qry.Free;
  end;

  if TotalAll > 0 then
    Achievement := (SelesaiAll / TotalAll) * 100
  else
    Achievement := 0;

  lblTotal.Caption := IntToStr(TotalAll);
  lblSelesai.Caption := IntToStr(SelesaiAll);
  lblOpen.Caption := IntToStr(OpenAll);
  lblAchievement.Caption := FormatFloat('0.00', Achievement) + ' %';
end;

procedure TDashboardTroublesooting.LoadKPIResponse;
var
  Qry: TADOQuery;
  StrQry: string;
begin
  Qry := TADOQuery.Create(nil);
  try
    Qry.Connection := Main.MyConnection;

    StrQry :=
      'EXEC dbo.GetDashboardTroubleshootingResponse '+
      '@FromDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglFrom.Date))+', '+
      '@ToDate = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglTo.Date));

    Qry.SQL.Text := StrQry;
    Qry.Open;

    if not Qry.Eof then
    begin
      lblRespon15.Caption :=
        Qry.FieldByName('respon_15').AsString;

      lblResponOver15.Caption :=
        Qry.FieldByName('respon_over_15').AsString;
    end;

  finally
    Qry.Free;
  end;
end;

end.
