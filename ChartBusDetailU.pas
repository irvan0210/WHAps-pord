unit ChartBusDetailU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ppParameter, ppBands, ppReport,
  ppSubRpt, ppMemo, ppCtrls, jpeg, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, TeeProcs, TeEngine, Chart, Series, ComCtrls, ADODB, WHUnit,
  Buttons;

type
  TChartBusDetail = class(TForm)
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
  ChartBusDetail: TChartBusDetail;
  StrDate,StrCategory,StrWarna, StrTittle, StrLokasi :string;

implementation

uses MainU, SettingU, ChartU;

{$R *.dfm}

constructor TChartBusDetail.Create(AOwner:TComponent;Date:String='';Lokasi:String='';Category:String='');
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

procedure TChartBusDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TChartBusDetail.TutupClick(Sender: TObject);
begin
  ChartBusDetail.Close;
end;

procedure TChartBusDetail.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
end;

procedure TChartBusDetail.Init;
begin
  Tanggal.Date := Now;
  //StrCategory
end;                                                                   

procedure TChartBusDetail.LoadData;
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
end;

procedure TChartBusDetail.LihatClick(Sender: TObject);
begin
  LoadData;
end;

end.
