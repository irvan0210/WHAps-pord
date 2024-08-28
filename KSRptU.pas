unit KSRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ADODB, WHUnit, Buttons, QuickRpt,
  QRCtrls, ZColorStringGrid;

type
  TKSRpt = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Selesai: TButton;
    Label2: TLabel;
    Bulan: TComboBox;
    Label3: TLabel;
    Tahun: TEdit;
    Lihat: TButton;
    ToXCel: TSpeedButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QTanggal: TQRLabel;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QNo: TQRDBText;
    QNoKPP: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QNama: TQRDBText;
    QSaldoAwal: TQRDBText;
    QKS: TQRDBText;
    QTabungan: TQRDBText;
    QCicilanKS: TQRDBText;
    QSaldoAkhir: TQRDBText;
    QRShape9: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    StrGrid: TZColorStringGrid;
    ToPrinter: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure ToPrinterClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure PreparePrint;
  public
    { Public declarations }
  end;

var
  KSRpt: TKSRpt;
  LokasiArr: Array of TArrString2;
  DataArr:Array of TArrString20;
  BulanArr:Array [1..12] Of String=
  ('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember');
  StrQry:String;

implementation

uses MainU;

{$R *.dfm}

procedure TKSRpt.Init;
var WrBulan,WrTahun,WrTanggal:Word;
    IntCount:Integer;
begin
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
  Bulan.Items.Clear;
  Bulan.Text:='';
  Bulan.ItemIndex:=-1;
  SetLength(DataArr,0);
  for IntCount:=1 to 12 do
    Bulan.Items.Add(BulanArr[IntCount]);
  DecodeDate(Now(),WrTahun,WrBulan,WrTanggal);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(BulanArr[WrBulan]);
  Tahun.Text:=IntToStr(WrTahun);
end;

procedure TKSRpt.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,17,0);
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Saldo Sebelumnya';
  StrGrid.Cells[8,0]:='Transaksi';
  StrGrid.Cells[13,0]:='Saldo Akhir';
  StrGrid.Cells[3,1]:='KS';
  StrGrid.Cells[4,1]:='OnRisk';
  StrGrid.Cells[5,1]:='LaKa';
  StrGrid.Cells[6,1]:='Tabungan';
  StrGrid.Cells[7,1]:='Jaminan';
  StrGrid.Cells[8,1]:='KS';
  StrGrid.Cells[9,1]:='OnRisk';
  StrGrid.Cells[10,1]:='LaKa';
  StrGrid.Cells[11,1]:='Lbh Str';
  StrGrid.Cells[12,1]:='Jaminan';
  StrGrid.Cells[13,1]:='KS';
  StrGrid.Cells[14,1]:='OR';
  StrGrid.Cells[15,1]:='LaKa';
  StrGrid.Cells[16,1]:='Tabungan';
  StrGrid.Cells[17,1]:='Jaminan';
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=120;

  for IntCount:=0 to 17 do
    StrGrid.Cells[IntCount,2]:='';
  for IntCount:=3 to 17 do
    StrGrid.ColWidths[IntCount]:=60;
end;

procedure TKSRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 3,1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[IntCount][0]:=Qry.FieldValues['location_id'];
      LokasiArr[IntCount][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Normal;
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
end;

procedure TKSRpt.RefreshData;
var Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(DataArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMitraTransList '+Lokasi.Text+','+Chr(39)+Tahun.Text+'-'+Format('%.*d',[2,Bulan.ItemIndex+1])+'-01'+Chr(39)+';';
    Qry.CommandTimeout:=500;
    Qry.SQL.Clear;             
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then SetLength(DataArr,Qry.RecordCount+1);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      DataArr[IntCount][0]:=Qry.FieldValues['num'];
      DataArr[IntCount][1]:=Qry.FieldValues['employee_id'];
      DataArr[IntCount][2]:=Qry.FieldValues['name'];
      if Qry.FieldValues['kurang_setor']>=0 then
        DataArr[IntCount][3]:=IToCurr(Qry.FieldValues['kurang_setor'])
      else
        DataArr[IntCount][3]:='('+IToCurr(0-StrToInt(Qry.FieldValues['kurang_setor']))+')';
      if Qry.FieldValues['onrisk']>=0 then
        DataArr[IntCount][4]:=IToCurr(Qry.FieldValues['onrisk'])
      else
        DataArr[IntCount][4]:='('+IToCurr(0-StrToInt(Qry.FieldValues['onrisk']))+')';
      if Qry.FieldValues['laka']>=0 then
        DataArr[IntCount][5]:=IToCurr(Qry.FieldValues['laka'])
      else
        DataArr[IntCount][5]:='('+IToCurr(0-StrToInt(Qry.FieldValues['laka']))+')';
      DataArr[IntCount][6]:=IToCurr(0-StrToInt(Qry.FieldValues['tabungan']));
      DataArr[IntCount][7]:=IToCurr(0-StrToInt(Qry.FieldValues['jaminan']));

      if Qry.FieldValues['trans_kurang_setor']>=0 then
        DataArr[IntCount][8]:=IToCurr(Qry.FieldValues['trans_kurang_setor'])
      else
        DataArr[IntCount][8]:='('+IToCurr(0-StrToInt(Qry.FieldValues['trans_kurang_setor']))+')';
      if Qry.FieldValues['trans_onrisk']>=0 then
        DataArr[IntCount][9]:=IToCurr(Qry.FieldValues['trans_onrisk'])
      else
        DataArr[IntCount][9]:='('+IToCurr(0-StrToInt(Qry.FieldValues['trans_onrisk']))+')';
      if Qry.FieldValues['trans_laka']>=0 then
        DataArr[IntCount][10]:=IToCurr(Qry.FieldValues['trans_laka'])
      else
        DataArr[IntCount][10]:='('+IToCurr(0-StrToInt(Qry.FieldValues['trans_laka']))+')';
      if Qry.FieldValues['trans_tabungan']<=0 then
        DataArr[IntCount][11]:=IToCurr(0-StrToInt(Qry.FieldValues['trans_tabungan']))
      else
        DataArr[IntCount][11]:='('+IToCurr(Qry.FieldValues['trans_tabungan'])+')';
      if Qry.FieldValues['trans_jaminan']<=0 then
        DataArr[IntCount][12]:=IToCurr(0-StrToInt(Qry.FieldValues['trans_jaminan']))
      else
        DataArr[IntCount][12]:='('+IToCurr(Qry.FieldValues['trans_jaminan'])+')';
      if Qry.FieldValues['total_kurang_setor']>=0 then
        DataArr[IntCount][13]:=IToCurr(Qry.FieldValues['total_kurang_setor'])
      else
        DataArr[IntCount][13]:='('+IToCurr(0-StrToInt(Qry.FieldValues['total_kurang_setor']))+')';

      DataArr[IntCount][14]:=IToCurr(Qry.FieldValues['total_onrisk']);
      DataArr[IntCount][15]:=IToCurr(Qry.FieldValues['total_laka']);
      DataArr[IntCount][16]:=IToCurr(0-StrToInt(Qry.FieldValues['total_tabungan']));
      DataArr[IntCount][17]:=IToCurr(0-StrToInt(Qry.FieldValues['total_jaminan']));
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TKSRpt.RefreshGrid;
var IntCount:Integer;
begin
  if Length(DataArr)>0 then
    StrGrid.RowCount:=Length(DataArr)+1;
  for IntCount:=0 to Length(DataArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=DataArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=DataArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=DataArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=DataArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=DataArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=DataArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=DataArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=DataArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=DataArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=DataArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=DataArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=DataArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=DataArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=DataArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=DataArr[IntCount][14];
    StrGrid.Cells[15,IntCount+2]:=DataArr[IntCount][15];
    StrGrid.Cells[16,IntCount+2]:=DataArr[IntCount][16];
    StrGrid.Cells[17,IntCount+2]:=DataArr[IntCount][17];
  end;
end;


procedure TKSRpt.SelesaiClick(Sender: TObject);
begin
  KSRpt.Close;
end;

procedure TKSRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TKSRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TKSRpt.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TKSRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TKSRpt.ToPrinterClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry2:String;
begin
  PreparePrint;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry2:='SELECT CONVERT(VARCHAR(12),GETDATE(),106) AS tanggal;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry2);
    Qry.Open;
    QTanggal.Caption:=Qry.FieldValues['tanggal'];
    Qry.Close; 
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Report.DataSet:=Qry;
    QNo.DataSet:=Qry;
    QNoKPP.DataSet:=Qry;
    QNama.DataSet:=Qry;
    QSaldoAwal.DataSet:=Qry;
    QKS.DataSet:=Qry;
    QTabungan.DataSet:=Qry;
    QCicilanKS.DataSet:=Qry;
    QSaldoAkhir.DataSet:=Qry;
    Report.Prepare;
    Report.Preview;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TKSRpt.PreparePrint;
begin
end;

procedure TKSRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

end.
