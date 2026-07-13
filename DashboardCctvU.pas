unit DashboardCctvU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, Series, ComCtrls,
  ADODB, WHUnit, Buttons;

type
  TDashboardCctv = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    TglFrom: TDateTimePicker;
    Label2: TLabel;
    TglTo: TDateTimePicker;
    Tampilkan: TButton;
    Tutup: TButton;
    PanelSummary: TPanel;
    PanelFooter: TPanel;
    PanelTotal: TPanel;
    LabelTotal: TLabel;
    lblTotal: TLabel;
    PanelHidup: TPanel;
    LabelHidup: TLabel;
    lblHidup: TLabel;
    PanelMati: TPanel;
    LabelMati: TLabel;
    lblMati: TLabel;
    PanelPctMati: TPanel;
    LabelPctMati: TLabel;
    lblPctMati: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TampilkanClick(Sender: TObject);
    procedure TutupClick(Sender: TObject);
    procedure TglFromChange(Sender: TObject);
    procedure TglToChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadDashboard;
  public
    { Public declarations }
  end;

var
  DashboardCctv: TDashboardCctv;

implementation

uses MainU;

{$R *.dfm}

procedure TDashboardCctv.Init;
begin
  TglFrom.Date := Now();
  TglTo.Date := Now();
end;

procedure TDashboardCctv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDashboardCctv.FormShow(Sender: TObject);
begin
  Init;
  LoadDashboard;
end;

procedure TDashboardCctv.TampilkanClick(Sender: TObject);
begin
  LoadDashboard;
end;

procedure TDashboardCctv.TutupClick(Sender: TObject);
begin
  Close;
end;

procedure TDashboardCctv.TglFromChange(Sender: TObject);
begin
  if TglFrom.Date > TglTo.Date then TglTo.Date := TglFrom.Date;
end;

procedure TDashboardCctv.TglToChange(Sender: TObject);
begin
  if TglTo.Date < TglFrom.Date then TglFrom.Date := TglTo.Date;
end;

procedure TDashboardCctv.LoadDashboard;
var
  Qry: TADOQuery;
  StrQry, StrLokasi: String;
  BarTotal, BarHidup, BarMati: TBarSeries;
  TotalAll, HidupAll, MatiAll: Integer;
  PctMati: Double;
begin
  TotalAll := 0;
  HidupAll := 0;
  MatiAll := 0;

  Main.M_Busy;

  Chart1.RemoveAllSeries;
  Chart1.View3D := False;
  Chart1.Legend.Visible := True;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Rekap Kondisi CCTV Per Lokasi');
  Chart1.Title.Font.Size := 14;
  Chart1.Title.Font.Style := [fsBold];
  Chart1.Title.Font.Color := clBlue;
  Chart1.LeftAxis.Title.Caption := 'Jumlah Kamera-Hari';
  Chart1.LeftAxis.Title.Font.Style := [fsBold];
  Chart1.BottomAxis.LabelsAngle := 0;
  Chart1.BottomAxis.LabelsFont.Size := 8;
  Chart1.BottomAxis.LabelStyle := talText;
  Chart1.MarginBottom := 10;
  Chart1.MarginLeft := 5;
  Chart1.MarginRight := 10;

  BarTotal := TBarSeries.Create(Self);
  BarTotal.Title := 'Total';
  BarTotal.SeriesColor := clBlue;
  BarTotal.Marks.Visible := True;
  BarTotal.Marks.Style := smsValue;
  Chart1.AddSeries(BarTotal);

  BarHidup := TBarSeries.Create(Self);
  BarHidup.Title := 'Hidup';
  BarHidup.SeriesColor := clGreen;
  BarHidup.Marks.Visible := True;
  BarHidup.Marks.Style := smsValue;
  Chart1.AddSeries(BarHidup);

  BarMati := TBarSeries.Create(Self);
  BarMati.Title := 'Mati';
  BarMati.SeriesColor := clRed;
  BarMati.Marks.Visible := True;
  BarMati.Marks.Style := smsValue;
  Chart1.AddSeries(BarMati);

  Qry := TADOQuery.Create(nil);
  try
    Qry.Connection := Main.MyConnection;
    if Main.OpenDb then begin
      StrQry := 'EXEC dbo.GetDashboardCctvByLokasi ' +
        '@FromDate=' + QuotedStr(FormatDateTime('yyyy-mm-dd', TglFrom.Date)) + ',' +
        '@ToDate=' + QuotedStr(FormatDateTime('yyyy-mm-dd', TglTo.Date)) + ',' +
        '@CompanyId=' + QuotedStr(CompanyId) + ',@LocationId=' + QuotedStr(LocationId) + ';';
      Main.WriteLog('SQL :' + StrQry, 2);
      Qry.SQL.Text := StrQry;
      Qry.Open;

      while not Qry.Eof do begin
        StrLokasi := Qry.FieldByName('lokasi').AsString;

        BarTotal.Add(Qry.FieldByName('total').AsInteger, StrLokasi);
        BarHidup.Add(Qry.FieldByName('hidup').AsInteger, StrLokasi);
        BarMati.Add(Qry.FieldByName('mati').AsInteger, StrLokasi);

        TotalAll := TotalAll + Qry.FieldByName('total').AsInteger;
        HidupAll := HidupAll + Qry.FieldByName('hidup').AsInteger;
        MatiAll := MatiAll + Qry.FieldByName('mati').AsInteger;

        Qry.Next;
      end;
      Qry.Close;
    end;
  finally
    Qry.Free;
  end;
  Main.CloseDb;

  if TotalAll > 0 then
    PctMati := (MatiAll / TotalAll) * 100
  else
    PctMati := 0;

  lblTotal.Caption := IntToStr(TotalAll);
  lblHidup.Caption := IntToStr(HidupAll);
  lblMati.Caption := IntToStr(MatiAll);
  lblPctMati.Caption := FormatFloat('0.00', PctMati) + ' %';

  Main.M_Normal;
end;

end.
