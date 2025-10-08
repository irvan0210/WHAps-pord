unit ChartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ppParameter, ppBands, ppReport,
  ppSubRpt, ppMemo, ppCtrls, jpeg, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, TeeProcs, TeEngine, Chart, Series, ComCtrls, ADODB, WHUnit,
  Buttons;

type
  TChartBus = class(TForm)
    Sets: TPanel;
    Sets2: TPanel;
    Chart1: TChart;
    Series1: TPieSeries;
    ChartYogya: TChart;
    PieSeries2: TPieSeries;
    ChartMedan: TChart;
    PieSeries3: TPieSeries;
    ChartSemarang: TChart;
    PieSeries4: TPieSeries;
    ChartJakarta: TChart;
    PieSeries5: TPieSeries;
    Tutup: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Tanggal: TDateTimePicker;
    Lihat: TSpeedButton;
    ChartBali: TChart;
    PieSeries1: TPieSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ChartJakartaClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChartBaliClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChartYogyaClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChartMedanClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChartSemarangClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    {
     Private declarations }
    procedure Init;
    function GetRandomColorNotRed: TColor;
   // procedure RefreshCombo;
  public
    BatchArr,SeatArr:Array of TArrString2;
    CompanyLocationArr,CompanyArr,CompanyArrTemp:Array of TArrString8;
    { Public declarations }
    constructor Create(AOwner:TComponent);Override;
    procedure LoadData;
    procedure LoadDataJakarta;
    procedure LoadDataBali;
    procedure LoadDataYogyakarta;
    procedure LoadDataMedan;
    procedure LoadDataSemarang;
  end;

var
  ChartBus: TChartBus;
  Strcategory, StrWarna, StrOutDatesJkt, StrOutDatesBli, StrOutDatesYogya,
  StrOutDatesMdn,StrOutDatesSmg,
  StrLokasiJkt,StrLokasiBli, StrLokasiYogya, StrLokasiMdn, StrLokasiSmg : string;
  ListCategoryJkt,ListCategoryBli, ListCategoryYogya, ListCategoryMdn, ListCategorySmg, ListWarna: TStringList;
  Warna: TColor;

implementation

uses MainU, SettingU, ChartBusDetailU;

{$R *.dfm}

constructor TChartBus.Create(AOwner:TComponent);
begin
  //Main.WriteLog('Form Open: Apps='+GetFileVersion(ParamStr(0)),1);
  inherited Create(AOwner);
end;

procedure TChartBus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TChartBus.TutupClick(Sender: TObject);
begin
  ChartBus.Close;
end;

procedure TChartBus.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TChartBus.Init;
begin
  Tanggal.Date := Now;
end;

function TChartBus.GetRandomColorNotRed: TColor;
var
  c: TColor;
  r, g, b: Byte;
 const Colors: array[0..7] of
 TColor = ( clBlue,clLime, clYellow, clAqua, clFuchsia,clSkyBlue, clMoneyGreen,clWhite );
begin
 { repeat
    c := RGB(Random(256), Random(256), Random(256));
  until c <> clRed;  // ulangi kalau kebetulan merah
  Result := c;}
 { repeat
    r := 220 + Random(36);
    g := 220 + Random(36);
    b := 220 + Random(36);// Pastikan tidak merah dominan
  until not ((r > 240) and (g < 210) and (b < 210)); // hindari merah dominan
  Result := RGB(r, g, b);  }

  Result := Colors[Random(Length(Colors))];
end;

procedure TChartBus.LoadData;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    Pie: TPieSeries;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  Chart1.SeriesList.Clear;

  // Buat series baru bertipe Pie
  Pie := TPieSeries.Create(Self);
  Chart1.AddSeries(Pie);
  //Main.M_Busy;
  if Main.OpenDb then begin
    //StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    //StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := '@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    //if Chk_All.Checked = True then StrALL := ',@GroupBatch=1'
   //   else StrALL := ',@GroupBatch=0';
   // if Batch.Text<>'All' then begin
   //   StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
   // end else StrBatchId:='';

   // Unit ALL Cabang
    StrQry:='EXEC GetTotalUnitChart '+StrOutDates;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      if Qry.FieldByName('lokasi').AsString ='Jakarta' then begin
        Pie.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('lokasi').AsString, // Label
              clGreen         // Warna otomatis
            );
      end else begin
        Pie.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('lokasi').AsString, // Label
              GetRandomColorNotRed         // Warna otomatis
            );
      end;
      Chart1.Title.Text.Text := 'ALL Cabang';
      Pie.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LoadDataJakarta;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    PieJakarta: TPieSeries;
begin

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartJakarta.SeriesList.Clear;
  ListCategoryJkt := TStringList.Create;
  ListCategoryJkt.Clear;
  // Buat series baru bertipe Pie
  PieJakarta := TPieSeries.Create(Self);
  ChartJakarta.AddSeries(PieJakarta);

  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDatesJkt := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLokasiJkt := ',6,2';
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDatesJkt+StrLokasiJkt+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ListCategoryJkt.Add(Qry.FieldByName('category').AsString);
      if Qry.FieldByName('category').AsString = '1' then begin
         PieJakarta.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clGreen                       // clTeeColor Warna otomatis
            );
      end else if Qry.FieldByName('category').AsString = '2' then begin
         PieJakarta.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clYellow                       // clTeeColor Warna otomatis
            );
      end else begin
        PieJakarta.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clBlue                       // clTeeColor Warna otomatis
            );
      end;

     // ListWarna.Add(ColorToString(Warna));
      ChartJakarta.Title.Text.Text := 'Jakarta';
      PieJakarta.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LoadDataBali;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    PieBali: TPieSeries;
    //ListCategoryBli, ListWarnaBli: TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartBali.SeriesList.Clear;
  ListCategoryBli := TStringList.Create;
  ListCategoryBli.Clear;
  // Buat series baru bertipe Pie
  PieBali := TPieSeries.Create(Self);
  ChartBali.AddSeries(PieBali);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDatesBli := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLokasiBli  := ',14,9';
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDatesBli+StrLokasiBli+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ListCategoryBli.Add(Qry.FieldByName('category').AsString);
      if Qry.FieldByName('category').AsString = '1' then begin
         PieBali.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clGreen                       // clTeeColor Warna otomatis
            );
      end else if Qry.FieldByName('category').AsString = '2' then begin
         PieBali.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clYellow                       // clTeeColor Warna otomatis
            );
      end else begin
        PieBali.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clBlue                       // clTeeColor Warna otomatis
            );
      end;
     // ListCategoryBli.Add(Qry.FieldByName('category').AsString);
      ChartBali.Title.Text.Text := 'Bali';
      PieBali.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LoadDataYogyakarta;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    PieYogya: TPieSeries;
   // ListCategoryYogya, ListWarnaBli: TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartYogya.SeriesList.Clear;
  ListCategoryYogya := TStringList.Create;
  ListCategoryYogya.Clear;
  // Buat series baru bertipe Pie
  PieYogya := TPieSeries.Create(Self);
  ChartYogya.AddSeries(PieYogya);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDatesYogya := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLokasiYogya :=',22,11';
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDatesYogya+StrLokasiYogya+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ListCategoryYogya.Add(Qry.FieldByName('category').AsString);
      if Qry.FieldByName('category').AsString = '1' then begin
         PieYogya.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clGreen                       // clTeeColor Warna otomatis
            );
      end else if Qry.FieldByName('category').AsString = '2' then begin
         PieYogya.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clYellow                       // clTeeColor Warna otomatis
            );
      end else begin
        PieYogya.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clBlue                       // clTeeColor Warna otomatis
            );
      end;
      ChartYogya.Title.Text.Text := 'Yogyakarta';
      PieYogya.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LoadDataMedan;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    PieMedan: TPieSeries;
   // ListCategoryMdn, ListWarnaBli: TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartMedan.SeriesList.Clear;
  ListCategoryMdn := TStringList.Create;
  ListCategoryMdn.Clear;
  // Buat series baru bertipe Pie
  PieMedan := TPieSeries.Create(Self);
  ChartMedan.AddSeries(PieMedan);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDatesMdn := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLokasiMdn := ',24,13';
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDatesMdn+StrLokasiMdn+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ListCategoryMdn.Add(Qry.FieldByName('category').AsString);
      if Qry.FieldByName('category').AsString = '1' then begin
         PieMedan.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clGreen                       // clTeeColor Warna otomatis
            );
      end else if Qry.FieldByName('category').AsString = '2' then begin
         PieMedan.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clYellow                       // clTeeColor Warna otomatis
            );
      end else begin
        PieMedan.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clBlue                       // clTeeColor Warna otomatis
            );
      end;
      ChartMedan.Title.Text.Text := 'Medan';
      PieMedan.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LoadDataSemarang;
var Qry:TADOQuery;
    StrQry, StrCompanyId,StrLocationId,StrBatchId, StrOutDates, StrLastdates, StrALL:String;
    IntCount:Integer;
    PieSemarang: TPieSeries;
   // ListCategorySmg, ListWarnaBli: TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartSemarang.SeriesList.Clear;
  ListCategorySmg := TStringList.Create;
  ListCategorySmg.Clear;
  // Buat series baru bertipe Pie
  PieSemarang := TPieSeries.Create(Self);
  ChartSemarang.AddSeries(PieSemarang);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDatesSmg := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLokasiSmg  := ',25,14';
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDatesSmg+StrLokasiSmg+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ListCategorySmg.Add(Qry.FieldByName('category').AsString);
      if Qry.FieldByName('category').AsString = '1' then begin
         PieSemarang.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clGreen                       // clTeeColor Warna otomatis
            );
      end else if Qry.FieldByName('category').AsString = '2' then begin
         PieSemarang.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clYellow                       // clTeeColor Warna otomatis
            );
      end else begin
        PieSemarang.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clBlue                       // clTeeColor Warna otomatis
            );
      end;
      ChartSemarang.Title.Text.Text := 'Semarang';
      PieSemarang.Marks.Style := smsValue;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TChartBus.LihatClick(Sender: TObject);
begin
  LoadData;
  LoadDataJakarta;
  LoadDataBali;
  LoadDataYogyakarta;
  LoadDataMedan;
  LoadDataSemarang;
end;

procedure TChartBus.ChartJakartaClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
    StrCategoryJkt : string;
begin
    StrCategoryJkt  := ListCategoryJkt[ValueIndex];
   // StrWarna := ListWarna[ValueIndex];
   // ShowMessage('Anda klik category: ' + StrLokasiJkt);
    if Main.IsFormOpen('ChartBusDetail')=False then
      ChartBusDetail:=TChartBusDetail.Create(Self,StrOutDatesJkt,StrLokasiJkt,StrCategoryJkt);
end;

procedure TChartBus.ChartBaliClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
   StrCategoryBli : string;
begin
    StrCategoryBli  := ListCategoryBli[ValueIndex];
    //StrWarna := ColorToString(warna);
    //ShowMessage('Anda klik category: ' + PieJakarta);
    if Main.IsFormOpen('ChartBusDetail')=False then
      ChartBusDetail:=TChartBusDetail.Create(Self,StrOutDatesBli,StrLokasiBli,StrCategoryBli);
end;

procedure TChartBus.ChartYogyaClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
   StrCategoryYogya : string;
begin
    StrCategoryYogya  := ListCategoryYogya[ValueIndex];
   // StrWarna := ColorToString(warna);
    //ShowMessage('Anda klik category: ' + PieJakarta);
    if Main.IsFormOpen('ChartBusDetail')=False then
      ChartBusDetail:=TChartBusDetail.Create(Self,StrOutDatesYogya,StrLokasiYogya,StrCategoryYogya);
end;

procedure TChartBus.ChartMedanClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
   StrCategoryMdn : string;
begin
    StrCategoryMdn  := ListCategoryMdn[ValueIndex];
   // StrWarna := ColorToString(warna);
    //ShowMessage('Anda klik category: ' + PieJakarta);
    if Main.IsFormOpen('ChartBusDetail')=False then
      ChartBusDetail:=TChartBusDetail.Create(Self,StrOutDatesMdn,StrLokasiMdn,StrCategoryMdn);
end;

procedure TChartBus.ChartSemarangClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    var
   StrCategorySmg : string;
begin
    StrCategorySmg  := ListCategorySmg[ValueIndex];
   // StrWarna := ColorToString(warna);
    //ShowMessage('Anda klik category: ' + PieJakarta);
    if Main.IsFormOpen('ChartBusDetail')=False then
      ChartBusDetail:=TChartBusDetail.Create(Self,StrOutDatesSmg,StrLokasiSmg,StrCategorySmg);
end;

end.
