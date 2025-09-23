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
  private
    {
     Private declarations }
    procedure Init;
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

implementation

uses MainU, SettingU;

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
        Pie.Add(
              Qry.FieldByName('hasil').AsInteger,   // Nilai
              Qry.FieldByName('lokasi').AsString, // Label
              clTeeColor                             // Warna otomatis
            );
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

  // Buat series baru bertipe Pie
  PieJakarta := TPieSeries.Create(Self);
  ChartJakarta.AddSeries(PieJakarta);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDates+',6,2;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        PieJakarta.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clTeeColor                       // Warna otomatis

            );
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
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartBali.SeriesList.Clear;

  // Buat series baru bertipe Pie
  PieBali := TPieSeries.Create(Self);
  ChartBali.AddSeries(PieBali);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDates+',14,9;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        PieBali.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clTeeColor                       // Warna otomatis

            );
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
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartYogya.SeriesList.Clear;

  // Buat series baru bertipe Pie
  PieYogya := TPieSeries.Create(Self);
  ChartYogya.AddSeries(PieYogya);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDates+',22,11;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        PieYogya.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clTeeColor                       // Warna otomatis

            );
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
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartMedan.SeriesList.Clear;

  // Buat series baru bertipe Pie
  PieMedan := TPieSeries.Create(Self);
  ChartMedan.AddSeries(PieMedan);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDates+',24,13;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        PieMedan.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clTeeColor                       // Warna otomatis

            );
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
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Hapus semua series lama
  ChartSemarang.SeriesList.Clear;

  // Buat series baru bertipe Pie
  PieSemarang := TPieSeries.Create(Self);
  ChartSemarang.AddSeries(PieSemarang);
  //Main.M_Busy;
  if Main.OpenDb then begin
   // StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
   // StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrOutDates := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
   // Unit Jakarta
    StrQry:='EXEC GetTotalUnitPerCabang '+StrOutDates+',25,14;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        PieSemarang.Add(
              Qry.FieldByName('hasil').AsInteger, // Nilai
              Qry.FieldByName('name').AsString, // Label
              clTeeColor                       // Warna otomatis

            );
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

end.
