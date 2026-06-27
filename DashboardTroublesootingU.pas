unit DashboardTroublesootingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ppParameter, ppBands, ppReport,
  ppSubRpt, ppMemo, ppCtrls, jpeg, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, TeeProcs, TeEngine, Chart, Series, ComCtrls, ADODB, WHUnit,
  Buttons;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
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
  LoadData;
end;

procedure TDashboardTroublesooting.Init;
begin
  Tanggal.Date := Now;
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

procedure TDashboardTroublesooting.LihatClick(Sender: TObject);
begin
  LoadData;
end;

end.
