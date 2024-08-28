unit DepositFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Mask, ADODB, ExtCtrls, Math, WHUnit, QuickRpt,
  QRCtrls, DB, jpeg, AppEvnts, ComCtrls, ZColorStringGrid;

type
  TDepositForm = class(TForm)
    Selesai: TButton;
    NoBodi: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Driver: TComboBox;
    GroupSPJ: TGroupBox;
    GridSPJ: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    GroupAkhir: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    KMOrdoAwal: TMaskEdit;
    GroupBox6: TGroupBox;
    RitTotal: TMaskEdit;
    DropTotal: TMaskEdit;
    KMArgoTotal: TMaskEdit;
    KMOrdoTotal: TMaskEdit;
    GroupBiaya: TGroupBox;
    Simpan: TButton;
    Bersihkan: TButton;
    Report: TQuickRep;
    QRBand2: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QLabelTunai: TQRLabel;
    QTandaMitra: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTandaKasir: TQRLabel;
    QLabelKurang: TQRLabel;
    QDisetorkanRp: TQRLabel;
    QKurangSetorRp: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QDisetorkan: TQRLabel;
    QKurangSetor: TQRLabel;
    QShapeDisetorkan: TQRShape;
    QHutangMitra: TQRLabel;
    QRShape4: TQRShape;
    Label12: TLabel;
    GroupKeterangan: TGroupBox;
    Keterangan: TMemo;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRBand3: TQRBand;
    QAmount: TQRDBText;
    QNama: TQRDBText;
    RitAkhir: TEdit;
    DropAkhir: TEdit;
    KMArgoAkhir: TEdit;
    KMOrdoAkhir: TEdit;
    CetakUlang: TButton;
    QLabelTabungan: TQRLabel;
    QLebihSetorRp: TQRLabel;
    QLebihSetor: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QImageExecutive: TQRImage;
    QLabelNoBody: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QLabelBBM: TQRLabel;
    QLabelGas: TQRLabel;
    QLabelBBMRp: TQRLabel;
    QLabelGasRp: TQRLabel;
    QLabelBBM1: TQRLabel;
    QLabelGas1: TQRLabel;
    QLabelBBM3: TQRLabel;
    QLabelGas3: TQRLabel;
    QLabelArgo: TQRLabel;
    QLabelArgoRp: TQRLabel;
    QLabelArgoBersih: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QLabelBagiHasil: TQRLabel;
    QRLabel33: TQRLabel;
    QNoSlip: TQRLabel;
    QNoBody: TQRLabel;
    QNoKPP: TQRLabel;
    QMitra: TQRLabel;
    QNoPolisi: TQRLabel;
    QTanggal: TQRLabel;
    QJam: TQRLabel;
    QRit: TQRLabel;
    QDrop: TQRLabel;
    QDummy: TQRLabel;
    QArgoKotor: TQRLabel;
    QBBMRupiah: TQRLabel;
    QGasRupiah: TQRLabel;
    QArgoBersih: TQRLabel;
    QKomisi: TQRLabel;
    QBBMLiter: TQRLabel;
    QGasLiter: TQRLabel;
    QKomisiPersen: TQRLabel;
    QRLabel46: TQRLabel;
    QLocation: TQRLabel;
    QAlamat: TQRLabel;
    KMArgoIsiAkhir: TEdit;
    KMArgoIsiTotal: TMaskEdit;
    Label18: TLabel;
    RitAwal: TEdit;
    DropAwal: TEdit;
    KMArgoAwal: TEdit;
    KMArgoIsiAwal: TEdit;
    QRLabelTabungan: TQRLabel;
    QRpHutangOR: TQRLabel;
    QTabunganMitra: TQRLabel;
    QLabelBagi: TQRLabel;
    QTotalHarusSetorRp: TQRLabel;
    QShapeTotalSetor: TQRShape;
    QTotalHarusSetor: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QTanggalSPJ: TQRLabel;
    QMark: TQRDBText;
    QRShape9: TQRShape;
    QRatio: TQRLabel;
    QNama2: TQRDBText;
    QAmount2: TQRDBText;
    QMark2: TQRDBText;
    QRupiah: TQRDBText;
    Cari: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    Label22: TLabel;
    UnitJalanPagi: TEdit;
    Label21: TLabel;
    UnitJalanMalam: TEdit;
    QImageReguler: TQRImage;
    QLabelReguler: TQRLabel;
    QLabelPengeluaranBBM: TQRLabel;
    QLabelPengeluaranBBMRp: TQRLabel;
    QPengeluaranBBM: TQRLabel;
    QPenghasilan: TQRLabel;
    QLabelPenghasilan: TQRLabel;
    QLabelPenghasilanRp: TQRLabel;
    QRLabelHutangOR: TQRLabel;
    QRpTabungan: TQRLabel;
    QJaminan: TQRLabel;
    QInsentifBBM: TQRLabel;
    QRupiah1: TQRDBText;
    QRLabelJaminan: TQRLabel;
    QRpHutangLaka: TQRLabel;
    QHutangOnRisk: TQRLabel;
    GroupKlik: TPanel;
    BBMTunai: TCheckBox;
    SPJBatalJalan: TCheckBox;
    QRLabelHutangLaka: TQRLabel;
    QRpJaminan: TQRLabel;
    QLaka: TQRLabel;
    QRLabelHutangTilang: TQRLabel;
    QRpHutangTilang: TQRLabel;
    QTilang: TQRLabel;
    Label30: TLabel;
    PanelWaktu: TPanel;
    WaktuBaru: TMaskEdit;
    ApplicationEvnt: TApplicationEvents;
    Label31: TLabel;
    PanelTanggal: TPanel;
    TanggalBaru: TMaskEdit;
    QBBMTunai: TQRLabel;
    QRLabelSeragam: TQRLabel;
    QRpHutangSeragam: TQRLabel;
    QSeragam: TQRLabel;
    GridBiaya: TZColorStringGrid;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    QPinjamanKhusus: TQRLabel;
    Label34: TLabel;
    Label35: TLabel;
    LabelRasio: TLabel;
    QRitDrop: TQRLabel;
    QRLabel35: TQRLabel;
    Panel1: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBBMGas: TGroupBox;
    BBMRupiah: TEdit;
    GasRupiah: TEdit;
    GroupBox5: TGroupBox;
    BBMLiter: TEdit;
    GasLiter: TEdit;
    GroupBox7: TGroupBox;
    BBMGasTotal: TMaskEdit;
    Biaya: TComboBox;
    JumlahBiaya: TEdit;
    Panel6: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    GroupBox1: TGroupBox;
    v29Awal: TEdit;
    v30Awal: TEdit;
    v31Awal: TEdit;
    v32Awal: TEdit;
    GroupAkhir2: TGroupBox;
    v29Akhir: TEdit;
    v30Akhir: TEdit;
    v31Akhir: TEdit;
    v32Akhir: TEdit;
    GroupBox4: TGroupBox;
    v29Total: TEdit;
    v30Total: TEdit;
    v31Total: TEdit;
    v32Total: TEdit;
    Panel7: TPanel;
    GroupRupiah: TGroupBox;
    ArgoKotor: TMaskEdit;
    ArgoBersih: TMaskEdit;
    Komisi: TMaskEdit;
    TotalSetor: TMaskEdit;
    RitDrop: TMaskEdit;
    LebihSetor: TEdit;
    KurangSetor: TEdit;
    TotalSetorTunai: TMaskEdit;
    TotalSetorNonTunai: TMaskEdit;
    PenghasilanMitra: TEdit;
    Disetor: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    KomisiPersen: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    LabelKomisi: TLabel;
    v33Awal: TEdit;
    v34Awal: TEdit;
    v33Akhir: TEdit;
    v34Akhir: TEdit;
    v33Total: TEdit;
    v34Total: TEdit;
    Panel8: TPanel;
    NoPolisi: TEdit;
    DriverDisp: TEdit;
    PanelForm21: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    PanelForm22: TPanel;
    GroupBox3: TGroupBox;
    GroupBox8: TGroupBox;
    Panel2: TPanel;
    Label23: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label43: TLabel;
    Hutang: TEdit;
    OnRisk: TEdit;
    LaKa: TEdit;
    PKhusus: TEdit;
    InsentifA: TEdit;
    Panel4: TPanel;
    Label29: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label32: TLabel;
    Label42: TLabel;
    Tabungan: TEdit;
    Jaminan: TEdit;
    Tilang: TEdit;
    Seragam: TEdit;
    TLaka: TEdit;
    PanelForm23: TPanel;
    QImageBlank: TQRImage;
    QImageBlank2: TQRImage;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RitAkhirExit(Sender: TObject);
    procedure DropAkhirExit(Sender: TObject);
    procedure KMArgoAkhirExit(Sender: TObject);
    procedure RitAkhirEnter(Sender: TObject);
    procedure DropAkhirEnter(Sender: TObject);
    procedure KMArgoAkhirEnter(Sender: TObject);
    procedure KMOrdoAkhirExit(Sender: TObject);
    procedure KMOrdoAkhirEnter(Sender: TObject);
    procedure BiayaChange(Sender: TObject);
    procedure GridBiayaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JumlahBiayaExit(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NoBodiChange(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure DriverKeyPress(Sender: TObject; var Key: Char);
    procedure NoBodiKeyPress(Sender: TObject; var Key: Char);
    procedure RitAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure KMArgoAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure KMOrdoAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure BBMRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure GasRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure BBMRupiahEnter(Sender: TObject);
    procedure GasRupiahEnter(Sender: TObject);
    procedure BBMRupiahExit(Sender: TObject);
    procedure GasRupiahExit(Sender: TObject);
    procedure DropAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure DisetorExit(Sender: TObject);
    procedure DisetorEnter(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure DisetorKeyPress(Sender: TObject; var Key: Char);
    procedure CetakUlangClick(Sender: TObject);
    procedure KMArgoIsiAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure KMArgoIsiAkhirEnter(Sender: TObject);
    procedure KMArgoIsiAkhirExit(Sender: TObject);
    procedure BiayaKeyPress(Sender: TObject; var Key: Char);
    procedure SPJBatalJalanKeyPress(Sender: TObject; var Key: Char);
    procedure KeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure SPJBatalJalanClick(Sender: TObject);
    procedure BBMTunaiClick(Sender: TObject);
    procedure GridSPJClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure GridSPJKeyPress(Sender: TObject; var Key: Char);
    procedure WaktuBaruKeyPress(Sender: TObject; var Key: Char);
    procedure ApplicationEvntShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure TanggalBaruKeyPress(Sender: TObject; var Key: Char);
    procedure v29AkhirEnter(Sender: TObject);
    procedure v30AkhirEnter(Sender: TObject);
    procedure v31AkhirEnter(Sender: TObject);
    procedure v32AkhirEnter(Sender: TObject);
    procedure v33AkhirEnter(Sender: TObject);
    procedure v34AkhirEnter(Sender: TObject);
    procedure v29AkhirExit(Sender: TObject);
    procedure v30AkhirExit(Sender: TObject);
    procedure v29AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v30AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v31AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v32AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v33AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v34AkhirKeyPress(Sender: TObject; var Key: Char);
    procedure v31AkhirExit(Sender: TObject);
    procedure v32AkhirExit(Sender: TObject);
    procedure v33AkhirExit(Sender: TObject);
    procedure v34AkhirExit(Sender: TObject);
  private
    { Private declarations }
    BiayaArr:Array of TArrString14;
    BatchTransArr,CommTransArr:Array of TArrString30;
    SPJArr:Array of TArrString97;
    ParamBatchTransArr:Array of Real;
    MinRowBiaya,BBMPerLiter,GasPerLiter,PerRit,PerDrop,SelisihFR,IntRow,IntReguler,Max_Commission:Integer;
    TransId,EmplId,Tanggal,Jam,Late_Fee_Id,Payment_KS_Id,Payment_Shirt_Id,Subsidi_Id,Batch_Param:String;
    Work_Time_Start_1,Work_Time_Start_2,Work_Time_End_1,Work_Time_End_2,Work_Time_End_3,Work_Time_End_4:String;
    DOW,Hour_Late_Fee,Day_Night:Integer;
    Subs_BBM1,Subs_BBM2,Subs_BBM3,Subs_BBM4,Subs_BBM5,Subs_BBM6,Subs_BBM7,Subs_BBM8:Integer;
    Gross_Subs_BBM2,Gross_Subs_BBM3,Gross_Subs_BBM4,Gross_Subs_BBM5,Gross_Subs_BBM6,Gross_Subs_BBM7,Gross_Subs_BBM8:Integer;
    Gross_KS2,Gross_KS3,Gross_KS4,Gross_KS5:Integer;
    Payment_KS1,Payment_KS2,Payment_KS3,Payment_KS4,Payment_KS5:Integer;
    Gross_Shirt2,Gross_Shirt3,Gross_Shirt4,Gross_Shirt5:Integer;
    Shirt1,Shirt2,Shirt3,Shirt4,Shirt5:Integer;
    Komisi1,Komisi2,Komisi3,Komisi4,Komisi5,Komisi6,Gross_Argo1,Gross_Argo2,Gross_Argo3,Gross_Argo4,Gross_Argo5,Gross_Argo6,Progressif:Integer;
    Gross_Commission,Percent_Commission1,Percent_Commission2:Integer;
    Saving_Deposit_Min,Argo_Hold_Min,Differ_Fixed_Rate,FormNumber:Integer;
//  Gross_Saving2,Gross_Saving3,Gross_Saving4,Gross_Saving5:Integer;
//  Saving1,Saving2,Saving3,Saving4,Saving5:Integer;
    procedure Init;
    procedure InitGridBiaya;
    procedure InitGridSPJ;
    procedure RefreshGridSPJ;
    procedure Calculate;
    procedure CheckData;
    procedure PreparePrint;
    procedure DisableInput;
    procedure EnableInput;
    procedure SetReguler(Reguler:Integer=0);
    procedure SetGridData(Row_Grid,BiayaArr_RowNum:Integer);
  public
    { Public declarations }
    procedure RefreshCombo;
    procedure Reprint(NoDeposit:String);
    constructor Create(AOwner:TComponent);overload;
  end;

var
  DepositForm: TDepositForm;

implementation

uses MaskUtils, MainU, DepositReprintU, RePrintFormU,
  AuthorizedFormU, StrUtils, DateUtils;

{$R *.dfm}

constructor TDepositForm.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: DepositForm=',1);
  inherited Create(AOwner);
end;

procedure TDepositForm.SelesaiClick(Sender: TObject);
begin
  DepositForm.Close;
end;

procedure TDepositForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Main.StatusUpdate('','');
  Action:=caFree;
end;

procedure TDepositForm.Init;
var Count:Integer;
begin
  FormNumber:=1;
  PanelForm21.Visible:=False;
  PanelForm22.Visible:=False;
  PanelForm23.Visible:=False;
  KomisiPersen.Caption:='';
  NoBodi.Items.Clear;
  NoBodi.ItemIndex:=0;
  NoPolisi.Text:='';
  Driver.Items.Clear;
  Driver.ItemIndex:=0;
  DriverDisp.Text:='';
  Biaya.Clear;
  Biaya.Visible:=False;
  Biaya.Text:='Pilih Biaya';
  Biaya.ItemIndex:=0;
  JumlahBiaya.Text:='';
  JumlahBiaya.Visible:=False;
  RitDrop.Text:='0';
  ArgoKotor.Text:='0';
  ArgoBersih.Text:='0';
  TotalSetorNonTunai.Text:='0';
  Komisi.Text:='0';
  RitAwal.Text:='0';
  DropAwal.Text:='0';
  KMArgoAwal.Text:='0';
  KMArgoIsiAwal.Text:='0';
  KMOrdoAwal.Text:='0';
  v29Awal.Text:='0';
  v30Awal.Text:='0';
  v31Awal.Text:='0';
  v32Awal.Text:='0';
  v33Awal.Text:='0';
  v34Awal.Text:='0';
  RitAkhir.Text:='';
  DropAkhir.Text:='';
  KMArgoAkhir.Text:='';
  KMArgoIsiAkhir.Text:='';
  KMOrdoAkhir.Text:='';
  RitTotal.Text:='0';
  DropTotal.Text:='0';
  KMArgoTotal.Text:='0';
  KMArgoIsiTotal.Text:='0';
  KMOrdoTotal.Text:='0';
  v29Total.Text:='0';
  v30Total.Text:='0';
  v31Total.Text:='0';
  v32Total.Text:='0';
  v33Total.Text:='0';
  v34Total.Text:='0';
  BBMRupiah.Text:='0';
  GasRupiah.Text:='0';
  BBMLiter.Text:='0';
  GasLiter.Text:='0';
  BBMGasTotal.Text:='0';
  TotalSetor.Text:='0';
  TotalSetorTunai.Text:='0';
  Disetor.Text:='0';
  KurangSetor.Text:='0';
  LebihSetor.Text:='0';
  PenghasilanMitra.Text:='0';
  RitTotal.Font.Color:=clBlack;
  DropTotal.Font.Color:=clBlack;
  KMArgoTotal.Font.Color:=clBlack;
  KMOrdoTotal.Font.Color:=clBlack;
  KMArgoIsiTotal.Font.Color:=clBlack;
  v29Total.Font.Color:=clBlack;
  v30Total.Font.Color:=clBlack;
  v31Total.Font.Color:=clBlack;
  v32Total.Font.Color:=clBlack;
  v33Total.Font.Color:=clBlack;
  v34Total.Font.Color:=clBlack;
  NoBodi.Enabled:=True;
  Driver.Enabled:=True;
  Keterangan.Text:='';
  IntReguler:=0;
  QTabunganMitra.Caption:='0';
  QKomisiPersen.Caption:='0';
  SetReguler(IntReguler);
  QPengeluaranBBM.Caption:='0';
  QPenghasilan.Caption:='0';
  QJaminan.Caption:='';
  QLaka.Caption:='';
  QHutangOnRisk.Caption:='';
  QPinjamanKhusus.Caption:='';
  QInsentifBBM.Caption:='';
  QBBMTunai.Caption:='';
  QTilang.Caption:='';
  QSeragam.Caption:='';
  QRitDrop.Caption:='';
  Hutang.Text:='';
  OnRisk.Text:='';
  LaKa.Text:='';
  Tilang.Text:='';
  Tabungan.Text:='';
  Seragam.Text:='';
  PKhusus.Text:='';
  Jaminan.Text:='';
  WaktuBaru.Text:='';
  TanggalBaru.Text:='';
  Late_Fee_Id:='';
  SetLength(ParamBatchTransArr,0);
  LabelRasio.Caption:='';
  Argo_Hold_Min:=0;
  Differ_Fixed_Rate:=0;
  InitGridBiaya;
  InitGridSPJ;
  Cari.SetFocus;
  GroupAkhir.Enabled:=False;
  GroupAkhir2.Enabled:=False;
  GroupBiaya.Enabled:=False;
  GroupBBMGas.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  Disetor.Enabled:=False;
  GroupSPJ.Enabled:=True;
  GroupKlik.Enabled:=False;
  Simpan.Enabled:=True;
  SPJBatalJalan.Checked:=False;
  BBMTunai.Checked:=False;
end;

procedure TDepositForm.InitGridBiaya;
var IntCount,IntCount2:Integer;
begin
  GroupBiaya.Enabled:=True;
  for IntCount:=1 to GridBiaya.RowCount-1 do
    for IntCount2:=0 to GridBiaya.ColCount-1 do
      GridBiaya.Cells[IntCount2,IntCount]:='';
  MinRowBiaya:=0;
  GridBiaya.ColCount:=9;
  GridBiaya.RowCount:=2;
  GridBiaya.Cells[0,0]:='Jenis Biaya';
  GridBiaya.Cells[1,0]:='Jumlah';
  GridBiaya.CellStyle[0,0].HorizontalAlignment:=taCenter;
  GridBiaya.CellStyle[1,0].HorizontalAlignment:=taCenter;
  GridBiaya.CellStyle[1,1].HorizontalAlignment:=taRightJustify;
  GridBiaya.ColWidths[0]:=180;
  GridBiaya.ColWidths[1]:=60;
  for IntCount:=2 to 8 do
    GridBiaya.ColWidths[IntCount]:=0;
  for IntCount:=1 to GridSPJ.RowCount-1 do
    for IntCount2:=0 to GridSPJ.ColCount-1 do
      GridBiaya.Cells[IntCount2,IntCount]:='';
end;

procedure TDepositForm.InitGridSPJ;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No SPJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='No KPP';
  GridSPJ.Cells[3,0]:='Mitra';
  GridSPJ.Cells[4,0]:='Tanggal';
  GridSPJ.Cells[5,0]:='Jam';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  IntRow:=1;
end;

procedure TDepositForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCountPagi,IntCountMalam:Integer;
begin
  SetLength(SPJArr,0);
  SetLength(BiayaArr,0);
  SetLength(BatchTransArr,0);
  SetLength(CommTransArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionType '+Chr(39)+'SSM'+Chr(39)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=1;
    SetLength(BiayaArr,Qry.RecordCount+1);
    BiayaArr[0][0]:='0';
    BiayaArr[0][1]:=' ';
    BiayaArr[0][2]:='';
    BiayaArr[0][3]:='';
    BiayaArr[0][4]:='';
    BiayaArr[0][5]:='';
    BiayaArr[0][6]:='0';
    BiayaArr[0][7]:='';
    BiayaArr[0][8]:='1';
    BiayaArr[0][9]:='0';
    BiayaArr[0][10]:='0';
    BiayaArr[0][11]:='0';
    BiayaArr[0][12]:='0';
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      BiayaArr[Count][0]:=Qry.FieldValues['transaction_type_id'];
      if Qry.FieldValues['details']<>NULL then
        BiayaArr[Count][1]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else
        BiayaArr[Count][1]:=Qry.FieldValues['name'];
      BiayaArr[Count][2]:=Qry.FieldValues['amount'];
      BiayaArr[Count][3]:=Qry.FieldValues['discount'];
      BiayaArr[Count][4]:=Qry.FieldValues['discount_percent'];
      BiayaArr[Count][5]:=Qry.FieldValues['tax'];
      BiayaArr[Count][6]:=Qry.FieldValues['transaction_obj_id'];
      BiayaArr[Count][7]:=Qry.FieldValues['value'];
      BiayaArr[Count][8]:=Qry.FieldValues['display'];
      BiayaArr[Count][9]:=Qry.FieldValues['non_cash'];
      BiayaArr[Count][10]:=Qry.FieldValues['calculate_total'];
      BiayaArr[Count][11]:=Qry.FieldValues['t_in'];
      BiayaArr[Count][12]:=Qry.FieldValues['t_out'];
      BiayaArr[Count][13]:=Qry.FieldValues['insert_empl_trans'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetBatchTransList;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    SetLength(BatchTransArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      BatchTransArr[Count][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchTransArr[Count][1]:=Qry.FieldValues['transaction_type_id'];
      BatchTransArr[Count][2]:=Qry.FieldValues['vhc_batch_trans_id'];
      if Qry.FieldValues['array_row']<>NULL then BatchTransArr[Count][3]:=Qry.FieldValues['array_row'];
      if Qry.FieldValues['array_num']<>NULL then BatchTransArr[Count][4]:=Qry.FieldValues['array_num'];
      if Qry.FieldValues['param_array_num']<>NULL then BatchTransArr[Count][5]:=Qry.FieldValues['param_array_num'];
      if Qry.FieldValues['value1']<>NULL then BatchTransArr[Count][10]:=Qry.FieldValues['value1'];
      if Qry.FieldValues['value2']<>NULL then BatchTransArr[Count][11]:=Qry.FieldValues['value2'];
      if Qry.FieldValues['value3']<>NULL then BatchTransArr[Count][12]:=Qry.FieldValues['value3'];
      if Qry.FieldValues['value4']<>NULL then BatchTransArr[Count][13]:=Qry.FieldValues['value4'];
      if Qry.FieldValues['value5']<>NULL then BatchTransArr[Count][14]:=Qry.FieldValues['value5'];
      if Qry.FieldValues['value6']<>NULL then BatchTransArr[Count][15]:=Qry.FieldValues['value6'];
      if Qry.FieldValues['gross1']<>NULL then BatchTransArr[Count][20]:=Qry.FieldValues['gross1'];
      if Qry.FieldValues['gross2']<>NULL then BatchTransArr[Count][21]:=Qry.FieldValues['gross2'];
      if Qry.FieldValues['gross3']<>NULL then BatchTransArr[Count][22]:=Qry.FieldValues['gross3'];
      if Qry.FieldValues['gross4']<>NULL then BatchTransArr[Count][23]:=Qry.FieldValues['gross4'];
      if Qry.FieldValues['gross5']<>NULL then BatchTransArr[Count][24]:=Qry.FieldValues['gross5'];
      if Qry.FieldValues['grossmin']<>NULL then BatchTransArr[Count][25]:=Qry.FieldValues['grossmin'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetCommissionTransList;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    SetLength(CommTransArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      CommTransArr[Count][0]:=Qry.FieldValues['empl_commission_id'];
      CommTransArr[Count][1]:=Qry.FieldValues['transaction_type_id'];
      CommTransArr[Count][2]:=Qry.FieldValues['empl_commission_trans_id'];
      if Qry.FieldValues['array_num']<>NULL then CommTransArr[Count][4]:=Qry.FieldValues['array_num'];
      CommTransArr[Count][10]:=Qry.FieldValues['value1'];
      if Qry.FieldValues['value2']<>NULL then CommTransArr[Count][11]:=Qry.FieldValues['value2'];
      if Qry.FieldValues['value3']<>NULL then CommTransArr[Count][12]:=Qry.FieldValues['value3'];
      if Qry.FieldValues['value4']<>NULL then CommTransArr[Count][13]:=Qry.FieldValues['value4'];
      if Qry.FieldValues['value5']<>NULL then CommTransArr[Count][14]:=Qry.FieldValues['value5'];
      if Qry.FieldValues['value6']<>NULL then CommTransArr[Count][15]:=Qry.FieldValues['value6'];
      CommTransArr[Count][20]:=Qry.FieldValues['gross1'];
      if Qry.FieldValues['gross2']<>NULL then CommTransArr[Count][21]:=Qry.FieldValues['gross2'];
      if Qry.FieldValues['gross3']<>NULL then CommTransArr[Count][22]:=Qry.FieldValues['gross3'];
      if Qry.FieldValues['gross4']<>NULL then CommTransArr[Count][23]:=Qry.FieldValues['gross4'];
      if Qry.FieldValues['gross5']<>NULL then CommTransArr[Count][24]:=Qry.FieldValues['gross5'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT dbo.DateOfWeek(GETDATE()) AS dow; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then DOW:=Qry.FieldValues['dow'];
    Qry.Close;
    StrQry:='EXEC GetVhcOutList2 '+LocationId+',1,3; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    SetLength(SPJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SPJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      SPJArr[Count][1]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        SPJArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        SPJArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      SPJArr[Count][3]:=Qry.FieldValues['employee_id'];
      SPJArr[Count][4]:=Qry.FieldValues['name'];
      SPJArr[Count][5]:=Qry.FieldValues['out_date'];
      SPJArr[Count][6]:=Qry.FieldValues['out_time'];
      SPJArr[Count][7]:=Qry.FieldValues['day_night'];
      SPJArr[Count][8]:=Qry.FieldValues['vhc_batch_id'];
      if Qry.FieldValues['empl_commission_id']<>NULL then SPJArr[Count][9]:=Qry.FieldValues['empl_commission_id'] else SPJArr[Count][9]:='' ;
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetPrice;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      BBMPerLiter:=Qry.FieldValues['fuel_price_litre'];
      GasPerLiter:=Qry.FieldValues['gas_price_litre'];
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('SPJ_Form_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      FormNumber:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(BiayaArr)-1 do
    if StrToInt(BiayaArr[Count][8])>0 then
      Biaya.Items.Add(BiayaArr[Count][1]);
  RefreshGridSPJ;
  Main.StatusUpdate('Premium : '+IntToStr(BBMPerLiter)+'/Ltr, Gas : '+IntToStr(GasPerLiter)+'/Ltr','');
  IntCountPagi:=0;
  IntCountMalam:=0;
  for Count:=0 to Length(SPJArr)-1 do begin
    if SPJArr[Count][7]='1' then Inc(IntCountPagi);
    if SPJArr[Count][7]='2' then Inc(IntCountMalam);
  end;
  UnitJalanPagi.Text:=IToCurr(IntCountPagi);
  UnitJalanMalam.Text:=IToCurr(IntCountMalam);
  Case FormNumber of
    1:begin
        PanelForm21.Visible:=False;
        PanelForm22.Visible:=False;
        PanelForm23.Visible:=False;
      end;
    2:begin
        PanelForm21.Visible:=True;
        PanelForm22.Visible:=True;
        PanelForm23.Visible:=True;
      end;
  end;
  Main.M_Normal;
end;

procedure TDepositForm.RefreshGridSPJ;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to GridSPJ.ColCount-1 do
    for IntCount2:=1 to GridSPJ.RowCount-1 do
      GridSPJ.Cells[IntCount,IntCount2]:='';
  if Length(SPJArr)>0 then GridSPJ.RowCount:=Length(SPJArr)+1
  else GridSPJ.RowCount:=2;
  for IntCount:=0 to Length(SPJArr)-1 do begin
    NoBodi.Items.Add(SPJArr[IntCount][2]);
    Driver.Items.Add(SPJArr[IntCount][3]);
    GridSPJ.Cells[0,IntCount+1]:=SPJArr[IntCount][0];
    GridSPJ.Cells[1,IntCount+1]:=SPJArr[IntCount][2];
    GridSPJ.Cells[2,IntCount+1]:=SPJArr[IntCount][3];
    GridSPJ.Cells[3,IntCount+1]:=SPJArr[IntCount][4];
    GridSPJ.Cells[4,IntCount+1]:=SPJArr[IntCount][5];
    GridSPJ.Cells[5,IntCount+1]:=SPJArr[IntCount][6];
  end;
end;

procedure TDepositForm.SetReguler(Reguler:Integer=0);
begin
  if Reguler=0 then begin
    QImageReguler.SendToBack;
    QImageBlank.SendToBack;
    QImageBlank2.SendToBack;
    QLabelReguler.Caption:='';
    QLabelArgo.Caption:='Argo Kotor + Voucher';
    QLabelArgoRp.Caption:=': Rp.';
    QLabelBBM.Caption:='BBM';
    QLabelBBM1.Caption:='=';
    QLabelBBM3.Caption:='Ltr';
    QBBMLiter.Top:=120;
    QRatio.Top:=120;
    QRatio.Left:=656;
    QLabelBBMRp.Left:=472;
    QLabelGas.Caption:='Gas';
    QLabelGas1.Caption:='=';
    QLabelGas3.Caption:='Ltr';
    QLabelGasRp.Caption:=': Rp.';
    QLabelArgoBersih.Caption:='Argo Bersih';
    QLabelBagiHasil.Caption:='Bagi Hasil';
    QPengeluaranBBM.Caption:='';
    QLabelPengeluaranBBM.Caption:='';
    QLabelPengeluaranBBMRp.Caption:='';
    QLabelPenghasilan.Caption:='';
    QLabelPenghasilanRp.Caption:='';
    QRLabelHutangLaka.Caption:='Hutang Laka';
    QRLabelJaminan.Caption:='Jaminan';
    QRLabelTabungan.Caption:='Tabungan';
    QRpJaminan.Caption:=': Rp.';
    QRpHutangLaka.Caption:=': Rp.';
    QBBMRupiah.Top:=120;
    QKomisi.Top:=168;
    QKomisi.Left:=504;
    QArgoKotor.Left:=176;
    QArgoKotor.Top:=168;
    QPenghasilan.Left:=504;
    QTotalHarusSetor.Left:=504;
    QDisetorkan.Left:=504;
    QKurangSetor.Left:=504;
    QLebihSetor.Left:=504;
    QLabelPenghasilanRp.Left:=472;
    QTotalHarusSetorRp.Left:=472;
    QDisetorkanRp.Left:=472;
    QKurangSetorRp.Left:=472;
    QLebihSetorRp.Left:=472;
    QLabelBagi.Left:=296;
    QLabelTunai.Left:=296;
    QLabelKurang.Left:=296;
    QLabelTabungan.Left:=296;
    QLabelBBM.Left:=344;
    QLabelGas.Left:=344;
    QLabelArgoBersih.Left:=344;
    QLabelBagiHasil.Left:=344;
    QShapeTotalSetor.Left:=472;
    QShapeDisetorkan.Left:=472;
    QLabelGasRp.Left:=472;
    QLabelBagi.Top:=0;
    QLabelTunai.Top:=24;
    QLabelTabungan.Top:=48;
    QLabelKurang.Top:=72;
    QTotalHarusSetorRp.Top:=0;
    QDisetorkanRp.Top:=24;
    QLebihSetorRp.Top:=48;
    QKurangSetorRp.Top:=72;
    QTotalHarusSetor.Top:=0;
    QDisetorkan.Top:=24;
    QLebihSetor.Top:=48;
    QKurangSetor.Top:=72;
    QShapeTotalSetor.Top:=16;
    QShapeDisetorkan.Top:=40;
    QNama2.Left:=348;
  end else if Reguler=1 then begin
    QImageExecutive.SendToBack;
    QImageBlank.SendToBack;
    QImageBlank2.SendToBack;
    QLabelReguler.Caption:='REGULER';
    QLabelArgo.Caption:='';
    QLabelArgoRp.Caption:='';
    QLabelBBM.Caption:='Argo';
    QLabelBBM1.Caption:='';
    QLabelBBM3.Caption:='';
    QBBMLiter.Top:=152;
    QRatio.Top:=152;
    QRatio.Left:=300;
    QLabelBBMRp.Left:=584;
    QLabelGas.Caption:='Komisi';
    QLabelGas1.Caption:=': Rp.';
    QLabelGas3.Caption:='';
    QLabelGasRp.Caption:='';
    QGasLiter.Caption:='';
    QGasRupiah.Caption:='';
    QLabelArgoBersih.Caption:='BBM';
    QLabelBagiHasil.Caption:='Subsidi BBM';
    QLabelPengeluaranBBM.Caption:='Pengeluaran BBM';
    QLabelPengeluaranBBMRp.Caption:=': Rp.';
    QLabelPenghasilan.Caption:='Penghasilan Pengemudi';
    QLabelPenghasilanRp.Caption:=': Rp.';
    QRLabelHutangLaka.Caption:='Tabungan Laka';
    QRLabelTabungan.Caption:='Insentif Argo';
    QRLabelJaminan.Caption:='';
    QRpHutangLaka.Caption:=': Rp.';
    QRpTabungan.Caption:=': Rp.';
    QRpJaminan.Caption:='';
    QBBMRupiah.Top:=152;
    QKomisi.Top:=136;
    QKomisi.Left:=616;
    QArgoKotor.Left:=616;
    QArgoKotor.Top:=120;
    QPenghasilan.Left:=616;
    QTotalHarusSetor.Left:=616;
    QDisetorkan.Left:=616;
    QKurangSetor.Left:=616;
    QLebihSetor.Left:=616;
    QLabelPenghasilanRp.Left:=584;
    QTotalHarusSetorRp.Left:=584;
    QDisetorkanRp.Left:=584;
    QKurangSetorRp.Left:=584;
    QLebihSetorRp.Left:=584;
    QLabelBagi.Left:=368;
    QLabelTunai.Left:=368;
    QLabelKurang.Left:=368;
    QLabelTabungan.Left:=368;
    QLabelBBM.Left:=368;
    QLabelGas.Left:=368;
    QLabelArgoBersih.Left:=368;
    QShapeTotalSetor.Left:=584;
    QShapeDisetorkan.Left:=584;
    QLabelGasRp.Left:=584;
    QLabelBagiHasil.Left:=368;
    QLabelBagi.Top:=24;
    QLabelTunai.Top:=48;
    QLabelTabungan.Top:=72;
    QLabelKurang.Top:=96;
    QTotalHarusSetorRp.Top:=24;
    QDisetorkanRp.Top:=48;
    QLebihSetorRp.Top:=72;
    QKurangSetorRp.Top:=96;
    QTotalHarusSetor.Top:=24;
    QDisetorkan.Top:=48;
    QLebihSetor.Top:=72;
    QKurangSetor.Top:=96;
    QShapeTotalSetor.Top:=40;
    QShapeDisetorkan.Top:=64;
    QNama2.Left:=368;
  end;
end;

procedure TDepositForm.Calculate;
var Count,IntCount2,Row_Trans,Array_Num,Array_Row,Array_Val:Integer;
    TotalBiaya,TotalArgoKotor,TotalArgoBersih,TotalBBM,TotalRitDrop,TotalKomisi,TotalSetoran,Selisih,TotalSetoranNonTunai:Integer;
    SisaArgoKotor,TotalDropFR,TotalRitFR:Integer;
    Subs_BBM,TotalPenghasilanMitra,BasicComissionGrossArgo,BasicComissionNetArgo:Integer;
    HourLateFee,DayNight,LateFee,Row_Denda:Integer;
    Row_Payment_KS,Row_Subs_BBM,Row_Shirt,Row_Saving:Integer;
    OutDate,OutTime,NowDateTime,LateTime,LateFeeId:String;
    WorkTimeStart,WorkTimeEnd,WorkDateStart,WorkDateEnd:String;
    IntHour,IntMinutes:Word;
    Payment1,Payment2,Payment3,Payment4,Payment5,Payment6,Gross1,Gross2,Gross3,Gross4,Gross5,Gross6,GrossMin:Integer;
    StrList:TStringList;
    BBM,TotalValue:Real;
begin
  TotalRitDrop:=0;
  TotalArgoKotor:=0;
  TotalArgoBersih:=0;
  TotalBBM:=0;
  TotalBiaya:=0;
  TotalKomisi:=0;
  TotalSetoran:=0;
  TotalSetoranNonTunai:=0;
  Subs_BBM:=0;
  Selisih:=0;
  TotalPenghasilanMitra:=0;

  {rit & drop}
  TotalRitFR:=SToInt(v29Total.Text)+SToInt(v31Total.Text)+SToInt(v33Total.Text);
  TotalDropFR:=SToInt(v30Total.Text)+SToInt(v32Total.Text)+SToInt(v34Total.Text);
  if SToInt(RitTotal.Text)>0 then
    TotalRitDrop:=(SToInt(RitTotal.Text)-TotalRitFR)*PerRit;
  if SToInt(DropTotal.Text)>0 then
    TotalRitDrop:=TotalRitDrop+((SToInt(DropTotal.Text)-TotalDropFR)*PerDrop);
  {bbm & gas}
  if (ToString(BBMRupiah.Text)<>'') then
    TotalBBM:=SToInt(BBMRupiah.Text);
  if ToString(GasRupiah.Text)<>'' then
    TotalBBM:=TotalBBM+SToInt(GasRupiah.Text);
  {kolom biaya}
  for Count:=1 to GridBiaya.RowCount do begin
    if ((GridBiaya.Cells[2,Count]='1101') AND (GridBiaya.Cells[1,Count]<>'')) then begin
      TotalArgoKotor:=TotalArgoKotor+SToInt(GridBiaya.Cells[1,Count]);
//      if (GridBiaya.Cells[5,Count]='1') then
//        TotalSetoranNonTunai:=TotalSetoranNonTunai+SToInt(GridBiaya.Cells[1,Count]);
    end;
    if (GridBiaya.Cells[2,Count]='1103')  AND (GridBiaya.Cells[1,Count]<>'') then begin
      if (GridBiaya.Cells[5,Count]='1') then
        TotalSetoranNonTunai:=TotalSetoranNonTunai+SToInt(GridBiaya.Cells[1,Count]);
    end;
    if  (GridBiaya.Cells[2,Count]<>'1103') AND (GridBiaya.Cells[2,Count]<>'')  AND (GridBiaya.Cells[1,Count]<>'') then begin
      if (GridBiaya.Cells[5,Count]='1') then
        TotalSetoranNonTunai:=TotalSetoranNonTunai+SToInt(GridBiaya.Cells[1,Count]);
    end;
    if ( (GridBiaya.Cells[2,Count]='1103') AND (GridBiaya.Cells[1,Count]<>'') )then begin
      if (GridBiaya.Cells[3,Count]<>'') and (SToInt(GridBiaya.Cells[3,Count])>0) and (SToInt(GridBiaya.Cells[1,Count])>0) then
        Selisih:=Selisih+(SToInt(GridBiaya.Cells[3,Count])- SToInt(GridBiaya.Cells[1,Count]));
    end;
  end;
  {rasio BBM}
  if (TotalBBM>0) and (KMOrdoTotal.Text<>'') then begin
    if SToInt(KMOrdoTotal.Text)>0 then begin
      BBM:=SToInt(KMOrdoTotal.Text)/StrToFloat(BBMLiter.Text);
      LabelRasio.Caption:='R 1:'+FloatToStrF(BBM,ffNumber,4,2);
      ParamBatchTransArr[0]:=BBM;
    end;
  end else LabelRasio.Caption:='';

  if (Selisih<0) and (Differ_Fixed_Rate>0)  then begin
    TotalArgoKotor:=TotalArgoKotor+Selisih+TotalRitDrop;
    TotalSetoranNonTunai:=TotalSetoranNonTunai+Selisih;
  end else begin
    TotalArgoKotor:=TotalArgoKotor+TotalRitDrop;
  end;

  if NoBodi.ItemIndex>-1 then begin
//    if StrToInt(SPJArr[NoBodi.ItemIndex][30])=1 then begin
    if BBMTunai.Enabled=True then begin
      TotalArgoBersih:=TotalArgoKotor-TotalBBM;
    end else begin
      TotalArgoBersih:=TotalArgoKotor;
    end;
    {Denda keterlambatan}
    if Late_Fee_Id<>'' then begin
      for Count:=0 to GridBiaya.RowCount-1 do
        if GridBiaya.Cells[4,Count]=Late_Fee_Id then Row_Denda:=Count;
      LateFee:=0;
      HourLateFee:=Hour_Late_Fee;
      OutDate:=SPJArr[NoBodi.ItemIndex][5];
      OutTime:=SPJArr[NoBodi.ItemIndex][6];
      DayNight:=StrToInt(SPJArr[NoBodi.ItemIndex][7]);
      if Trim(TanggalBaru.Text)='-  -' then
        NowDateTime:=Main.Status.Panels.Items[0].Text
      else
        NowDateTime:=StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll]);
      if Trim(WaktuBaru.Text)=':  :' then
        NowDateTime:=NowDateTime+' '+Main.Status.Panels.Items[1].Text
      else
        NowDateTime:=NowDateTime+' '+WaktuBaru.Text;
{      if SPJArr[NoBodi.ItemIndex][81]<>'' then DayWorkTimeStart:=SPJArr[NoBodi.ItemIndex][81] else DayWorkTimeStart:='';
      if SPJArr[NoBodi.ItemIndex][82]<>'' then DayWorkTimeEnd:=SPJArr[NoBodi.ItemIndex][82] else DayWorkTimeEnd:='';
      if SPJArr[NoBodi.ItemIndex][83]<>'' then DayWorkTimeEndWeekEnd:= else DayWorkTimeEndWeekEnd:='';
      if SPJArr[NoBodi.ItemIndex][84]<>'' then NightWorkTimeStart:=SPJArr[NoBodi.ItemIndex][84] else NightWorkTimeStart:='';
      if SPJArr[NoBodi.ItemIndex][85]<>'' then NightWorkTimeEnd:=SPJArr[NoBodi.ItemIndex][85] else NightWorkTimeEnd:='';
}      {jumat, sabtu, minggu, libur}
      DOW:=DayOfWeek(StrToDate(OutDate));
      if DOW in [1,6,7,8] then begin
        {shift pagi}
        if DayNight=1 then begin
//          WorkTimeStart:=SPJArr[NoBodi.ItemIndex][81];
//          WorkTimeEnd:=SPJArr[NoBodi.ItemIndex][83];
          WorkTimeStart:=Work_Time_Start_1;
          WorkTimeEnd:=Work_Time_End_3;
        end else begin
//          WorkTimeStart:=SPJArr[NoBodi.ItemIndex][84];
//          WorkTimeEnd:=SPJArr[NoBodi.ItemIndex][85];
          WorkTimeStart:=Work_Time_Start_2;
          WorkTimeEnd:=Work_Time_End_4;
       end;
      end else begin
        if DayNight=1 then begin
          WorkTimeStart:=Work_Time_Start_1;
          WorkTimeEnd:=Work_Time_End_1;
        end else begin
          WorkTimeStart:=Work_Time_Start_2;
          WorkTimeEnd:=Work_Time_End_2;
        end;
      end;
      if CompareTime(StrToTime(WorkTimeStart),StrToTime(WorkTimeEnd))=-1 then WorkDateEnd:=OutDate+' '+WorkTimeEnd
      else WorkDateEnd:=DateToStr(IncDay(StrToDate(OutDate)))+' '+WorkTimeEnd;
      if CompareDateTime(StrToDateTime(WorkDateEnd),StrToDateTime(NowDateTime))=-1 then begin
        if MinutesBetween(StrToDateTime(NowDateTime),StrToDateTime(WorkDateEnd))<30 then begin
          LateFee:=Round(HourLateFee/2);
        end else begin
          if HoursBetween(StrToDateTime(NowDateTime),StrToDateTime(WorkDateEnd))<1 then LateFee:=HourLateFee
          else begin
//            LateFee:=HourLateFee*HoursBetween(StrToDateTime(NowDateTime),StrToDateTime(WorkDateEnd));
            DivMod(MinutesBetween(StrToDateTime(NowDateTime),StrToDateTime(WorkDateEnd)),60,IntHour,IntMinutes);
            LateFee:=(IntHour*HourLateFee);
            if IntMinutes<30 then LateFee:=LateFee+Round(HourLateFee/2)
            else LateFee:=LateFee+HourLateFee;
          end;
        end;
       end;
      if Row_Denda>0 then
        if LateFee>0 then GridBiaya.Cells[1,Row_Denda]:=IToCurr(LateFee) else GridBiaya.Cells[1,Row_Denda]:='0';
    end;
    {subsidi BBM}
    if Subsidi_Id<>'' then begin
      for Count:=0 to GridBiaya.RowCount-1 do
        if GridBiaya.Cells[4,Count]=Subsidi_Id then Row_Subs_BBM:=Count;
      if Row_Subs_BBM>0 then begin
        if (TotalArgoKotor>=Gross_Subs_BBM2) then begin
          if (Subs_BBM3>0) then begin
            if (TotalArgoKotor>=Gross_Subs_BBM3) then begin
              if (Subs_BBM4>0) then begin
                if (TotalArgoKotor>=Gross_Subs_BBM4) then begin
                  if (Subs_BBM5>0) then begin
                    if (TotalArgoKotor>=Gross_Subs_BBM5) then begin
                      if (Subs_BBM6>0) then begin
                        if (TotalArgoKotor>=Gross_Subs_BBM6) then begin
                          if (Subs_BBM7>0) then begin
                            if (TotalArgoKotor>=Gross_Subs_BBM7) then begin
                              if (Subs_BBM8>0) then begin
                                if (TotalArgoKotor>=Gross_Subs_BBM8) then begin
                                  GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM8);
                                end else begin
                                  GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM7);
                                end;
                              end else begin
                                GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM7);
                              end;
                            end else begin
                              GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM6);
                            end;
                          end else begin
                            GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM6);
                          end;
                        end else begin
                          GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM5);
                        end;
                      end else begin
                        GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM5);
                      end;
                    end else begin
                      GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM4);
                    end;
                  end else begin
                    GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM4);
                  end;
                end else begin
                  GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM3);
                end;
              end else begin
                GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM3);
              end;
            end else begin
              GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM2);
           end;
          end else begin
            GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM2);
          end;
        end else begin
          GridBiaya.Cells[1,Row_Subs_BBM]:=IToCurr(Subs_BBM1);
        end;
      end;
    end;
    { Potongan/Tunjangan Lain }
    for IntCount2:=0 to Length(BatchTransArr)-1 do begin
      if SPJArr[NoBodi.ItemIndex][8]=BatchTransArr[IntCount2][0] then begin
        if BatchTransArr[IntCount2][1]<>'0' then begin
          Row_Trans:=0;
          TotalValue:=TotalArgoKotor;
          if (BatchTransArr[IntCount2][3]<>'') then begin
            Array_Row:=StrToInt(BatchTransArr[IntCount2][3]);
            Array_Num:=StrToInt(BatchTransArr[IntCount2][4]);
          end else begin
            Array_Row:=0;
            Array_Num:=0;
          end;
          for Count:=0 to GridBiaya.RowCount-1 do if GridBiaya.Cells[4,Count]=BatchTransArr[IntCount2][1] then Row_Trans:=Count;
          if BatchTransArr[IntCount2][5]<>'' then begin
            if Length(ParamBatchTransArr)>0 then begin
              if ParamBatchTransArr[StrToInt(BatchTransArr[IntCount2][5])]>0 then begin
                TotalValue:=ParamBatchTransArr[StrToInt(BatchTransArr[IntCount2][5])];
              end else Row_Trans:=0
            end else Row_Trans:=0
          end;
          if (Array_Row>0) then begin
            if (Batch_Param='') then Row_Trans:=0;
            StrList:=TStringList.Create;
            StrList:=SplitStrings(Batch_Param,'##');
            if (StrList.Strings[Array_Num])<>'' then Array_Val:=StrToInt(StrList.Strings[Array_Num]);
            StrList.Free;
          end;
          if (Row_Trans>0) then begin
            if BatchTransArr[IntCount2][10]<>'' then Payment1:=StrToInt(BatchTransArr[IntCount2][10]) else Payment1:=-1;
            if BatchTransArr[IntCount2][11]<>'' then Payment2:=StrToInt(BatchTransArr[IntCount2][11]) else Payment2:=-1;
            if BatchTransArr[IntCount2][12]<>'' then Payment3:=StrToInt(BatchTransArr[IntCount2][12]) else Payment3:=-1;
            if BatchTransArr[IntCount2][13]<>'' then Payment4:=StrToInt(BatchTransArr[IntCount2][13]) else Payment4:=-1;
            if BatchTransArr[IntCount2][14]<>'' then Payment5:=StrToInt(BatchTransArr[IntCount2][14]) else Payment5:=-1;
            if BatchTransArr[IntCount2][15]<>'' then Payment6:=StrToInt(BatchTransArr[IntCount2][15]) else Payment6:=-1;
            if BatchTransArr[IntCount2][20]<>'' then Gross1:=StrToInt(BatchTransArr[IntCount2][20]) else Gross1:=0;
            if BatchTransArr[IntCount2][21]<>'' then Gross2:=StrToInt(BatchTransArr[IntCount2][21]) else Gross2:=0;
            if BatchTransArr[IntCount2][22]<>'' then Gross3:=StrToInt(BatchTransArr[IntCount2][22]) else Gross3:=0;
            if BatchTransArr[IntCount2][23]<>'' then Gross4:=StrToInt(BatchTransArr[IntCount2][23]) else Gross4:=0;
            if BatchTransArr[IntCount2][24]<>'' then Gross5:=StrToInt(BatchTransArr[IntCount2][24]) else Gross5:=0;
            if BatchTransArr[IntCount2][25]<>'' then GrossMin:=StrToInt(BatchTransArr[IntCount2][25]) else GrossMin:=0;
            if GrossMin>0 then begin
              if TotalValue>=GrossMin then GridBiaya.Cells[1,Row_Trans]:=IToCurr(TotalValue-GrossMin)
              else GridBiaya.Cells[1,Row_Trans]:='0';
            end else if (TotalValue>Gross1) then begin
              if (Payment2>=0) then begin
                if (TotalValue>Gross2) and (Gross2>0) then begin
                  if (Payment3>=0) then begin
                    if (TotalValue>Gross3) and (Gross3>0) then begin
                      if (Payment4>=0) then begin
                        if (TotalValue>Gross4) and (Gross4>0) then begin
                          if Payment5>=0 then begin
                            if (TotalValue>Gross5) and (Gross5>0) then begin
                              if Array_Val>Payment6 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment6)
                              else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                            end else begin
                              if Array_Row>0 then begin
                                if Array_Val>0 then begin
                                  if Array_Val>Payment5 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5)
                                  else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                                end;
                              end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5);
                            end;
                          end else begin
                            if Array_Row>0 then begin
                              if Array_Val>0 then begin
                                if Array_Val>Payment5 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5)
                                else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                              end;
                            end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5);
                          end;
                        end else begin
                          if Array_Row>0 then begin
                            if Array_Val>0 then begin
                              if Array_Val>Payment4 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4)
                              else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                            end;
                          end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4);
                        end;
                      end else begin
                        if Array_Row>0 then begin
                          if Array_Val>0 then begin
                            if Array_Val>Payment4 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4)
                            else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                          end;
                        end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4);
                      end;
                    end else begin
                      if Array_Row>0 then begin
                        if Array_Val>0 then begin
                          if Array_Val>Payment3 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3)
                          else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                        end;
                      end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3);
                    end;
                  end else begin
                    if Array_Row>0 then begin
                      if Array_Val>0 then begin
                        if Array_Val>Payment3 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3)
                        else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                      end;
                    end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3);
                  end;
                end else begin
                  if Array_Row>0 then begin
                    if Array_Val>0 then begin
                      if Array_Val>Payment2 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2)
                      else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                    end;
                  end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2);
               end;
              end else begin
                if Array_Row>0 then begin
                  if Array_Val>0 then begin
                    if Array_Val>Payment2 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2)
                    else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                  end;
                end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2);
              end;
            end else begin
              if Array_Row>0 then begin
                if Array_Val>0 then begin
                  if Array_Val>Payment1 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment1)
                  else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                end;
              end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment1);
            end;
          end;
        end;
      end;
    end;
    {potongan/Tunjangan lain per mitra}
    for IntCount2:=0 to Length(CommTransArr)-1 do begin
      if SPJArr[NoBodi.ItemIndex][9]=CommTransArr[IntCount2][0] then begin
        if CommTransArr[IntCount2][1]<>'0' then begin
          TotalValue:=TotalArgoKotor;
          Row_Trans:=0;
          if (CommTransArr[IntCount2][3]<>'') then begin
            Array_Num:=StrToInt(CommTransArr[IntCount2][4]);
          end else begin
            Array_Num:=0;
          end;
          for Count:=0 to GridBiaya.RowCount-1 do if GridBiaya.Cells[4,Count]=CommTransArr[IntCount2][1] then Row_Trans:=Count;
          if (Array_Num>0) then begin
            if (Batch_Param='') then Row_Trans:=0;
            StrList:=TStringList.Create;
            StrList:=SplitStrings(Batch_Param,'##');
            if (StrList.Strings[Array_Num])<>'' then Array_Val:=StrToInt(StrList.Strings[Array_Num]);
            StrList.Free;
          end;
          if (Row_Trans>0) then begin
            Payment1:=StrToInt(CommTransArr[IntCount2][10]);
            if CommTransArr[IntCount2][11]<>'' then Payment2:=StrToInt(CommTransArr[IntCount2][11]) else Payment2:=-1;
            if CommTransArr[IntCount2][12]<>'' then Payment3:=StrToInt(CommTransArr[IntCount2][12]) else Payment3:=-1;
            if CommTransArr[IntCount2][13]<>'' then Payment4:=StrToInt(CommTransArr[IntCount2][13]) else Payment4:=-1;
            if CommTransArr[IntCount2][14]<>'' then Payment5:=StrToInt(CommTransArr[IntCount2][14]) else Payment5:=-1;
            if CommTransArr[IntCount2][15]<>'' then Payment6:=StrToInt(CommTransArr[IntCount2][15]) else Payment6:=-1;
            Gross1:=StrToInt(CommTransArr[IntCount2][20]);
            if CommTransArr[IntCount2][21]<>'' then Gross2:=StrToInt(CommTransArr[IntCount2][21]) else Gross2:=0;
            if CommTransArr[IntCount2][22]<>'' then Gross3:=StrToInt(CommTransArr[IntCount2][22]) else Gross3:=0;
            if CommTransArr[IntCount2][23]<>'' then Gross4:=StrToInt(CommTransArr[IntCount2][23]) else Gross4:=0;
            if CommTransArr[IntCount2][24]<>'' then Gross5:=StrToInt(CommTransArr[IntCount2][24]) else Gross5:=0;
            if (TotalValue>Gross1) then begin
              if (Payment2>=0) then begin
                if (TotalValue>Gross2) and (Gross2>0) then begin
                  if (Payment3>=0) then begin
                    if (TotalValue>Gross3) and (Gross3>0) then begin
                      if (Payment4>=0) then begin
                        if (TotalValue>Gross4) and (Gross4>0) then begin
                          if Payment5>=0 then begin
                            if (TotalValue>Gross5) and (Gross5>0) then begin
                              if Array_Val>Payment6 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment6)
                              else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                            end else begin
                              if Array_Val>0 then begin
                                if Array_Val>Payment5 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5)
                                else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                              end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5);
                            end;
                          end else begin
                            if Array_Val>0 then begin
                              if Array_Val>Payment5 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5)
                              else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                            end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment5);
                          end;
                        end else begin
                          if Array_Val>0 then begin
                            if Array_Val>Payment4 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4)
                            else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                          end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4);
                        end;
                      end else begin
                        if Array_Val>0 then begin
                          if Array_Val>Payment4 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4)
                          else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                        end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment4);
                      end;
                    end else begin
                      if Array_Val>0 then begin
                        if Array_Val>Payment3 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3)
                        else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                      end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3);
                    end;
                  end else begin
                    if Array_Val>0 then begin
                      if Array_Val>Payment3 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3)
                      else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                    end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment3);
                  end;
                end else begin
                  if Array_Val>0 then begin
                    if Array_Val>Payment2 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2)
                    else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                  end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2);
               end;
              end else begin
                if Array_Val>0 then begin
                  if Array_Val>Payment2 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2)
                  else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
                end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment2);
              end;
            end else begin
              if Array_Val>0 then begin
                if Array_Val>Payment1 then GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment1)
                else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Array_Val);
              end else GridBiaya.Cells[1,Row_Trans]:=IToCurr(Payment1);
            end;
          end;
        end;
      end;
    end;
    {Potongan KS}
    if (Payment_KS_Id<>'') and (SToInt(Hutang.Text)>0) then begin
      for Count:=0 to GridBiaya.RowCount-1 do
        if GridBiaya.Cells[4,Count]=Payment_KS_Id then Row_Payment_KS:=Count;
      if Row_Payment_KS>0 then begin
        if (TotalArgoKotor>=Gross_KS2) then begin
          if (Payment_KS3>0) then begin
            if (TotalArgoKotor>=Gross_KS3) then begin
              if (Payment_KS4>0) then begin
                if (TotalArgoKotor>=Gross_KS4) then begin
                  if (Payment_KS5>0) then begin
                    if (TotalArgoKotor>=Gross_KS5) then begin
                      if SToInt(Hutang.Text)>Payment_KS5 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS5)
                      else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
                    end else begin
                      if SToInt(Hutang.Text)>Payment_KS4 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS4)
                      else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
                    end;
                  end else begin
                    if SToInt(Hutang.Text)>Payment_KS4 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS4)
                    else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
                  end;
                end else begin
                  if SToInt(Hutang.Text)>Payment_KS3 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS3)
                  else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
                end;
              end else begin
                if SToInt(Hutang.Text)>Payment_KS3 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS3)
                else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
              end;
            end else begin
              if SToInt(Hutang.Text)>Payment_KS2 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS2)
              else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
           end;
          end else begin
            if SToInt(Hutang.Text)>Payment_KS2 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS2)
            else GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(SToInt(Hutang.Text));
          end;
        end else begin
          if SToInt(Hutang.Text)>Payment_KS1 then GridBiaya.Cells[1,Row_Payment_KS]:=IToCurr(Payment_KS1)
          else IToCurr(SToInt(Hutang.Text));
        end;
      end;
    end;
    {cicilan seragam}
    if (Payment_Shirt_Id<>'') then begin
      for Count:=0 to GridBiaya.RowCount-1 do
        if GridBiaya.Cells[4,Count]=Payment_Shirt_Id then Row_Shirt:=Count;
      if (Row_Shirt>0) and (SToInt(Seragam.Text)>0) then begin
        if (TotalArgoKotor>=Gross_Shirt2) then begin
          if (Shirt3>0) then begin
            if (TotalArgoKotor>=Gross_Shirt3) then begin
              if (Shirt4>0) then begin
                if (TotalArgoKotor>=Gross_Shirt4) then begin
                  if (Shirt5>0) then begin
                    if (TotalArgoKotor>=Gross_Shirt5) then begin
                      if SToInt(Seragam.Text)>Shirt5 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt5)
                      else IToCurr(SToInt(Seragam.Text));
                    end else begin
                      if SToInt(Seragam.Text)>Shirt4 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt4)
                      else IToCurr(SToInt(Seragam.Text));
                    end;
                  end else begin
                    if SToInt(Seragam.Text)>Shirt4 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt4)
                    else IToCurr(SToInt(Seragam.Text));
                  end;
                end else begin
                  if SToInt(Seragam.Text)>Shirt3 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt3)
                  else IToCurr(SToInt(Seragam.Text));
                end;
              end else begin
                if SToInt(Seragam.Text)>Shirt3 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt3)
                else IToCurr(SToInt(Seragam.Text));
              end;
            end else begin
              if SToInt(Seragam.Text)>Shirt2 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt2)
              else IToCurr(SToInt(Seragam.Text));
           end;
          end else begin
            if SToInt(Seragam.Text)>Shirt2 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt2)
            else IToCurr(SToInt(Seragam.Text));
          end;
        end else begin
          if SToInt(Seragam.Text)>Shirt1 then GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Shirt1)
          else IToCurr(SToInt(Seragam.Text));
        end;
      end;
    end;
    {tabungan }
{   if (StrToInt(SPJArr[NoBodi.ItemIndex][65])>0) then begin
      for Count:=0 to GridBiaya.RowCount-1 do
        if GridBiaya.Cells[4,Count]=SPJArr[NoBodi.ItemIndex][65] then Row_Saving:=Count;
      if Row_Saving>0 then begin
        Saving1:=StrToInt(SPJArr[NoBodi.ItemIndex][70]);
        if SPJArr[NoBodi.ItemIndex][71]<>'' then Saving2:=StrToInt(SPJArr[NoBodi.ItemIndex][71]) else Saving2:=0;
        if SPJArr[NoBodi.ItemIndex][72]<>'' then Saving3:=StrToInt(SPJArr[NoBodi.ItemIndex][72]) else Saving3:=0;
        if SPJArr[NoBodi.ItemIndex][73]<>'' then Saving4:=StrToInt(SPJArr[NoBodi.ItemIndex][73]) else Saving4:=0;
        if SPJArr[NoBodi.ItemIndex][74]<>'' then Saving5:=StrToInt(SPJArr[NoBodi.ItemIndex][74]) else Saving5:=0;
        Gross_Saving2:=StrToInt(SPJArr[NoBodi.ItemIndex][66]);
        if SPJArr[NoBodi.ItemIndex][67]<>'' then Gross_Saving3:=StrToInt(SPJArr[NoBodi.ItemIndex][67]) else Gross_Saving3:=0;
        if SPJArr[NoBodi.ItemIndex][68]<>'' then Gross_Saving4:=StrToInt(SPJArr[NoBodi.ItemIndex][68]) else Gross_Saving4:=0;
        if SPJArr[NoBodi.ItemIndex][69]<>'' then Gross_Saving5:=StrToInt(SPJArr[NoBodi.ItemIndex][69]) else Gross_Saving5:=0;
        if (TotalArgoKotor>=Gross_Saving2) then begin
          if (Saving3>0) then begin
            if (TotalArgoKotor>=Gross_Saving3) then begin
              if (Saving4>0) then begin
                if (TotalArgoKotor>=Gross_Saving4) then begin
                  if (Saving5>0) then begin
                    if (TotalArgoKotor>=Gross_Saving5) then begin
                      GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving5);
                    end else begin
                      GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving4);
                    end;
                  end else begin
                    GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving4);
                  end;
                end else begin
                  GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving3);
                end;
              end else begin
                GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving3);
              end;
            end else begin
              GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving2);
           end;
          end else begin
            GridBiaya.Cells[1,Row_Saving]:=IToCurr(Saving2);
          end;
        end else begin
          GridBiaya.Cells[1,Row_Shirt]:=IToCurr(Saving1);
        end;
      end;
    end;
}
  end;
  {kolom biaya/akumulasi total biaya}
  for Count:=1 to GridBiaya.RowCount do begin
    if (GridBiaya.Cells[2,Count]='1102')  AND (GridBiaya.Cells[1,Count]<>'') AND (SPJBatalJalan.Checked=False)  then begin
      TotalBiaya:=TotalBiaya+SToInt(GridBiaya.Cells[1,Count]);
    end;
    if (GridBiaya.Cells[2,Count]='1104') AND (GridBiaya.Cells[1,Count]<>'') AND (GridBiaya.Cells[5,Count]<>'1') then
      TotalBiaya:=TotalBiaya-SToInt(GridBiaya.Cells[1,Count]);
  end;
//  if (StrToInt(SPJArr[NoBodi.ItemIndex][30])=1) AND (StrToInt(SPJArr[NoBodi.ItemIndex][31])>0) then TotalBiaya:=TotalBiaya+TotalBBM;
  if (BBMTunai.Enabled=True) AND (Subsidi_Id<>'') then TotalBiaya:=TotalBiaya+TotalBBM;
  TotalSetoran:=TotalArgoKotor+TotalBiaya;
  {perhitungan argo}
  if (TotalArgoBersih>0) AND (NoBodi.ItemIndex>-1)  then begin
//    if StrToInt(SPJArr[NoBodi.ItemIndex][94])=1 then FaktorArgoPengkali:=TotalArgoKotor
//    else FaktorArgoPengkali:=TotalArgoBersih;
//    if (SPJArr[NoBodi.ItemIndex][14])<>'' then begin
    {komisi 2 tingkat }
    if (Gross_Commission>0) then begin
      if (TotalArgoKotor>=Gross_Commission) then begin
        KomisiPersen.Caption:=IntToStr(Percent_Commission2)+'%';
        TotalKomisi:=Round(TotalArgoBersih*(Percent_Commission2/100))
      end else begin
       KomisiPersen.Caption:=IntToStr(Percent_Commission1)+'%';
       TotalKomisi:=Round(TotalArgoBersih*(Percent_Commission1/100));
      end;
      TotalPenghasilanMitra:=TotalKomisi-TotalBiaya;
      if Max_Commission>0 then if TotalKomisi>Max_Commission then TotalKomisi:=Max_Commission;
    end else begin
      {bertingkat progressif}
      if Progressif>0 then begin
        TotalKomisi:=0;
        SisaArgoKotor:=TotalArgoKotor;
        KomisiPersen.Caption:='';
        if (SisaArgoKotor>0) then begin
          if (Komisi1>0) and (TotalArgoKotor>=Gross_Argo2) then begin
            if (Komisi2>0) then begin
              TotalKomisi:=TotalKomisi+Round(Gross_Argo2*(Komisi1/100));
              SisaArgoKotor:=SisaArgoKotor-Gross_Argo2;
            end else begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi1/100));
              SisaArgoKotor:=0;
            end;
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi1/100));
            SisaArgoKotor:=0;
          end;
        end;
        if (SisaArgoKotor>0) then begin
          if (Komisi2>0) and  (TotalArgoKotor>Gross_Argo3) then begin
            if (Komisi3>0) then begin
              TotalKomisi:=TotalKomisi+Round((Gross_Argo3-Gross_Argo2)*(Komisi2/100));
              SisaArgoKotor:=SisaArgoKotor-(Gross_Argo3-Gross_Argo2);
            end else begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi2/100));
              SisaArgoKotor:=0;
            end;
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi2/100));
            SisaArgoKotor:=0;
          end;
        end;
        if (SisaArgoKotor>0) then begin
          if (Komisi3>0) and (TotalArgoKotor>Gross_Argo4) then begin
            if (Komisi4>0) then begin
              TotalKomisi:=TotalKomisi+Round(((Gross_Argo4-Gross_Argo3)-Gross_Argo2)*(Komisi3/100));
              SisaArgoKotor:=SisaArgoKotor-((Gross_Argo4-Gross_Argo3)-Gross_Argo2);
            end else begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi3/100));
              SisaArgoKotor:=0;
            end;
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi3/100));
            SisaArgoKotor:=0;
          end;
        end;
        if (SisaArgoKotor>0) then begin
          if (Komisi4>0) and (TotalArgoKotor>Gross_Argo5) then begin
            if (Komisi5>0) then begin
              TotalKomisi:=TotalKomisi+Round((((Gross_Argo5-Gross_Argo4)-Gross_Argo3)-Gross_Argo2)*(Komisi4/100));
              SisaArgoKotor:=SisaArgoKotor-(((Gross_Argo5-Gross_Argo4)-Gross_Argo3)-Gross_Argo2);
            end else begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi4/100));
              SisaArgoKotor:=0;
            end;
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi4/100));
            SisaArgoKotor:=0;
          end;
        end;
        if (SisaArgoKotor>0) then begin
          if (Komisi5>0) and (TotalArgoKotor>Gross_Argo6) then begin
            if (Komisi6>0) then begin
              TotalKomisi:=TotalKomisi+Round(((((Gross_Argo6-Gross_Argo5)-Gross_Argo4)-Gross_Argo3)-Gross_Argo2)*(Komisi5/100));
              SisaArgoKotor:=SisaArgoKotor-((((Gross_Argo6-Gross_Argo5)-Gross_Argo4)-Gross_Argo3)-Gross_Argo2);
            end else begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi5/100));
              SisaArgoKotor:=0;
            end;
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi5/100));
            SisaArgoKotor:=0;
          end;
        end;
        if (SisaArgoKotor>0) then begin
          if (Komisi6>0) then begin
              TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi6/100));
          end else begin
            TotalKomisi:=TotalKomisi+Round(SisaArgoKotor*(Komisi6/100));
          end;
        end;
        if Max_Commission>0 then if TotalKomisi>Max_Commission then TotalKomisi:=Max_Commission;
      end else begin
      {bertingkat normal}
        if (Gross_Argo2>0) and (TotalArgoKotor>=Gross_Argo2) then begin
          if (Gross_Argo3>0) and (TotalArgoKotor>=Gross_Argo3) then begin
            if (Gross_Argo4>0) and (TotalArgoKotor>=Gross_Argo4) then begin
              if (Gross_Argo5>0) and (TotalArgoKotor>=Gross_Argo5) then begin
                if (Gross_Argo6>0) and (TotalArgoKotor>=Gross_Argo6) then begin
                  KomisiPersen.Caption:=IntToStr(Komisi6)+' %';;
                  TotalKomisi:=Round(TotalArgoKotor*(Komisi6/100));
                end else begin
                  KomisiPersen.Caption:=IntToStr(Komisi5)+' %';;
                  TotalKomisi:=Round(TotalArgoKotor*(Komisi5/100));
                end;
              end else begin
                KomisiPersen.Caption:=IntToStr(Komisi4)+' %';;
                TotalKomisi:=Round(TotalArgoKotor*(Komisi4/100));
              end;
            end else begin
              KomisiPersen.Caption:=IntToStr(Komisi3)+' %';
              TotalKomisi:=Round(TotalArgoKotor*(Komisi3/100));
            end;
          end else begin
            KomisiPersen.Caption:=IntToStr(Komisi2)+' %';
            TotalKomisi:=Round(TotalArgoKotor*(Komisi2/100));
          end;
        end else begin
            KomisiPersen.Caption:=IntToStr(Komisi1)+' %';
            TotalKomisi:=Round(TotalArgoKotor*(Komisi1/100));
        end;
      end;
      if Max_Commission>0 then if TotalKomisi>Max_Commission then TotalKomisi:=Max_Commission;
      TotalPenghasilanMitra:=TotalKomisi-TotalBiaya;
    end;
  end;
  SelisihFR:=Selisih;
  if BBMTunai.Checked then begin
    TotalSetoran:=(TotalSetoran-TotalKomisi)-(TotalBBM);
  end else begin
    TotalSetoran:=TotalSetoran-TotalKomisi;
  end;
  BBMGasTotal.Text:=IToCurr(TotalBBM);
  RitDrop.Text:=IToCurr(TotalRitDrop);
  ArgoKotor.Text:=IToCurr(TotalArgoKotor);
  ArgoBersih.Text:=IToCurr(TotalArgoBersih);
  Komisi.Text:=IToCurr(TotalKomisi);
  TotalSetor.Text:=IToCurr(TotalSetoran);
  TotalSetorNonTunai.Text:=IToCurr(TotalSetoranNonTunai);
  TotalSetorTunai.Text:=IToCurr(TotalSetoran-TotalSetoranNonTunai);
  PenghasilanMitra.Text:=IToCurr(TotalPenghasilanMitra);
  if (SToInt(DropTotal.Text)>0) or (FormNumber=2) then
    if (SToInt(TotalSetorTunai.Text)-SToInt(Disetor.Text)>0) then begin
      KurangSetor.Text:=IToCurr(SToInt(TotalSetorTunai.Text)-SToInt(Disetor.Text));
      LebihSetor.Text:='0';
    end else begin
      LebihSetor.Text:=IToCurr(SToInt(Disetor.Text)-SToInt(TotalSetorTunai.Text));
      KurangSetor.Text:='0';
      if (Saving_Deposit_Min>0) then
        if (SToInt(ToString(LebihSetor.Text))<Saving_Deposit_Min) then begin
          MessageBox(0,PChar('Minimal Tabungan Rp. '+IToCurr(Saving_Deposit_Min)),'Setoran Mitra',MB_OK or MB_ICONWARNING);
          Disetor.SetFocus;
        end;
    end;
  if ToString(KurangSetor.Text)='' then KurangSetor.Text:='0';
  if ToString(LebihSetor.Text)='' then LebihSetor.Text:='0';
end;

procedure TDepositForm.BiayaChange(Sender: TObject);
begin
  GridBiaya.Cells[GridBiaya.Col,GridBiaya.Row]:=Biaya.Items[Biaya.ItemIndex];
  if (Biaya.ItemIndex>0) {AND (BiayaArr[Biaya.ItemIndex][2]<>'0')} then begin
//      if BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][2]<>'0' then
//          GridBiaya.Cells[1,GridBiaya.Row]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][2])
//      else
//        if (GridBiaya.Cells[1,GridBiaya.Row]='0') OR (GridBiaya.Cells[1,GridBiaya.Row]='') then
    GridBiaya.Cells[1,GridBiaya.Row]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][2]);
    GridBiaya.Cells[2,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][6];
    GridBiaya.Cells[3,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][7];
    GridBiaya.Cells[4,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][0];
    GridBiaya.Cells[5,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][9];
    GridBiaya.Cells[6,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][11];
    GridBiaya.Cells[7,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][12];
    GridBiaya.Cells[8,GridBiaya.Row]:=BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][13];
  end else begin
    GridBiaya.Cells[1,GridBiaya.Row]:='';
    GridBiaya.Cells[2,GridBiaya.Row]:='';
    GridBiaya.Cells[3,GridBiaya.Row]:='';
    GridBiaya.Cells[4,GridBiaya.Row]:='';
    GridBiaya.Cells[5,GridBiaya.Row]:='';
    GridBiaya.Cells[6,GridBiaya.Row]:='';
    GridBiaya.Cells[7,GridBiaya.Row]:='';
    GridBiaya.Cells[8,GridBiaya.Row]:='';
  end;
  Biaya.Visible := False;
  Biaya.Text:='';
  Biaya.ItemIndex:=-1;
  Calculate;
  GridBiaya.SetFocus;
  if GridBiaya.Row=GridBiaya.RowCount-1 then begin
    GridBiaya.RowCount:=GridBiaya.RowCount+1;
    GridBiaya.CellStyle[1,GridBiaya.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TDepositForm.GridBiayaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) and (ARow > MinRowBiaya) then begin
    R := GridBiaya.CellRect(ACol, ARow);
    R.Left := R.Left + GridBiaya.Left;
    R.Right := R.Right + GridBiaya.Left;
    R.Top := R.Top + GridBiaya.Top;
    R.Bottom := R.Bottom + GridBiaya.Top;
    with Biaya do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(GridBiaya.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(GridBiaya.Cells[ACol,ARow]);
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
  if (ACol = 1) and (ARow > MinRowBiaya) then begin
    if ( (GridBiaya.Cells[1,ARow]='') OR (GridBiaya.Cells[1,ARow]='0') ) then begin
      R := GridBiaya.CellRect(ACol, ARow);
      R.Left := R.Left + GridBiaya.Left;
      R.Right := R.Right + GridBiaya.Left;
      R.Top := R.Top + GridBiaya.Top;
      R.Bottom := R.Bottom + GridBiaya.Top;
      with JumlahBiaya do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(GridBiaya.Cells[ACol,ARow])<>'' then Text:=ToString(GridBiaya.Cells[ACol,ARow]);
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end else begin
      GroupBiaya.SetFocus;
    end;
  end;
  CanSelect := True;
end;

procedure TDepositForm.JumlahBiayaExit(Sender: TObject);
begin
  if ToString(JumlahBiaya.Text)<>'' then begin
    JumlahBiaya.Text:=SToCurr(ToString(JumlahBiaya.Text));
    GridBiaya.Cells[GridBiaya.Col,GridBiaya.Row]:= JumlahBiaya.Text;
    Calculate;
  end;
  JumlahBiaya.Visible := False;
  JumlahBiaya.Text:='';
  GridBiaya.SetFocus;
end;

procedure TDepositForm.RitAkhirExit(Sender: TObject);
begin
  if ToString(RitAkhir.Text)='' then RitAkhir.Text:='0';
  RitAkhir.Text:=SToCurr(ToString(RitAkhir.Text));
  if ((Trim(RitAwal.Text)<>'') AND (Trim(RitAkhir.Text)<>'')) then begin
    RitTotal.Text:=IToCurr(SToInt(RitAkhir.Text)-SToInt(RitAwal.Text));
    if StrToInt(ToString(RitTotal.Text))<=0 then begin
      RitTotal.Font.Color:=clRed;
    end else begin
      RitTotal.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.DropAkhirExit(Sender: TObject);
begin
  if ToString(DropAkhir.Text)='' then DropAkhir.Text:='0';
  DropAkhir.Text:=SToCurr(ToString(DropAkhir.Text));
  if ((Trim(DropAwal.Text)<>'') AND (Trim(DropAkhir.Text)<>'')) then begin
    DropTotal.Text:=IToCurr(SToInt(DropAkhir.Text)-SToInt(DropAwal.Text));
    if StrToInt(ToString(DropTotal.Text))<0 then begin
      DropTotal.Font.Color:=clRed;
      DropAkhir.SetFocus;
    end else begin
      DropTotal.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.KMArgoAkhirExit(Sender: TObject);
begin
  if ToString(KMArgoAkhir.Text)='' then KMArgoAkhir.Text:='0';
  KMArgoAkhir.Text:=SToCurr(ToString(KMArgoAkhir.Text));
  if ((Trim(KMArgoAwal.Text)<>'') AND (Trim(KMArgoAkhir.Text)<>'')) then
    KMArgoTotal.Text:=IToCurr(SToInt(KMArgoAkhir.Text)-SToInt(KMArgoAwal.Text));
    if StrToInt(ToString(KMArgoTotal.Text))<0 then KMArgoTotal.Font.Color:=clRed else KMArgoTotal.Font.Color:=clBlack;
end;

procedure TDepositForm.KMOrdoAkhirExit(Sender: TObject);
begin
  if ToString(KMOrdoAkhir.Text)='' then KMOrdoAkhir.Text:='0';
  KMOrdoAkhir.Text:=SToCurr(ToString(KMOrdoAkhir.Text));
  if ((Trim(KMOrdoAwal.Text)<>'') AND (Trim(KMOrdoAkhir.Text)<>'')) then
    KMOrdoTotal.Text:=IToCurr(SToInt(KMOrdoAkhir.Text)-SToInt(KMOrdoAwal.Text) );
  if StrToInt(ToString(KMOrdoTotal.Text))<0 then KMOrdoTotal.Font.Color:=clRed else KMOrdoTotal.Font.Color:=clBlack;
  Calculate;
end;

procedure TDepositForm.RitAkhirEnter(Sender: TObject);
begin
  RitAkhir.Text:=ToString(RitAkhir.Text);
end;

procedure TDepositForm.DropAkhirEnter(Sender: TObject);
begin
  DropAkhir.Text:=ToString(DropAkhir.Text);
end;

procedure TDepositForm.KMArgoAkhirEnter(Sender: TObject);
begin
  KMArgoAkhir.Text:=ToString(KMArgoAkhir.Text);
end;

procedure TDepositForm.KMOrdoAkhirEnter(Sender: TObject);
begin
  KMOrdoAkhir.Text:=ToString(KMOrdoAkhir.Text);
end;

procedure TDepositForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TDepositForm.NoBodiChange(Sender: TObject);
begin
  if NoBodi.Text<>'' then begin
    Driver.ItemIndex:=Driver.Items.IndexOf(SPJArr[NoBodi.ItemIndex][3]);
    CheckData;
  end;
end;

procedure TDepositForm.DriverChange(Sender: TObject);
begin
  if Driver.Text<>'' then begin
    NoBodi.ItemIndex:=NoBodi.Items.IndexOf(SPJArr[Driver.ItemIndex][1]);
    CheckData;
  end;
end;

procedure TDepositForm.CheckData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    Jaminan_Id,Trans_Mitra_Id,Tabungan_Id:String;
begin
  if NoBodi.ItemIndex>=0 then begin
    if (Trim(NoBodi.Text)<>'') and (Trim(Driver.Text)<>'') then begin
      EnableInput;
      TransId:=SPJArr[NoBodi.ItemIndex][0];
      EmplId:=SPJArr[Driver.ItemIndex][3];
      DriverDisp.Text:=SPJArr[Driver.ItemIndex][4];
      NoPolisi.Text:=SPJArr[NoBodi.ItemIndex][2];
      SetLength(ParamBatchTransArr,1);
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.M_Busy;
      if Main.OpenDb then begin
        StrQry:='EXEC GetVhcOutDetail '+QuotedStr(TransId)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if Qry.FieldValues['out_rits']<>NULL then RitAwal.Text:=SToCurr(Qry.FieldValues['out_rits']);
          if Qry.FieldValues['out_drops']<>NULL then DropAwal.Text:=SToCurr(Qry.FieldValues['out_drops']);
          if Qry.FieldValues['out_argo_km']<>NULL then KMArgoAwal.Text:=SToCurr(Qry.FieldValues['out_argo_km']);
          if Qry.FieldValues['out_ordo_km']<>NULL then KMOrdoAwal.Text:=SToCurr(Qry.FieldValues['out_ordo_km']);
          if Qry.FieldValues['rits']<>NULL then PerRit:=StrToInt(Qry.FieldValues['rits']);
          if Qry.FieldValues['drops']<>NULL then PerDrop:=StrToInt(Qry.FieldValues['drops']);
          if Qry.FieldValues['out_hired_km']<>NULL then KMArgoIsiAwal.Text:=SToCurr(Qry.FieldValues['out_hired_km']);
          IntReguler:=StrToInt(Qry.FieldValues['reguler']);
          if (Qry.FieldValues['amount']>=0) then Hutang.Text:=IToCurr(Qry.FieldValues['amount'])  else Hutang.Text:='('+IToCurr(0-Qry.FieldValues['amount'])+')';
          if (Qry.FieldValues['onrisk']>=0) then OnRisk.Text:=IToCurr(Qry.FieldValues['onrisk'])
          else OnRisk.Text:='('+IToCurr(0-Qry.FieldValues['onrisk'])+')';
          if (Qry.FieldValues['laka']>=0) then LaKa.Text:=IToCurr(Qry.FieldValues['laka'])
          else LaKa.Text:='('+IToCurr(0-Qry.FieldValues['laka'])+')';
          if (Qry.FieldValues['tilang']>=0) then Tilang.Text:=IToCurr(Qry.FieldValues['tilang'])
          else Tilang.Text:='('+IToCurr(0-Qry.FieldValues['tilang'])+')';
          if (Qry.FieldValues['saving']<0) then Tabungan.Text:=IToCurr(0-Qry.FieldValues['saving']) else Tabungan.Text:='0';
          if (Qry.FieldValues['trans_type_id2_total']<0) then Jaminan.Text:=IToCurr(0-Qry.FieldValues['trans_type_id2_total']) else Jaminan.Text:='0';
          if (Qry.FieldValues['shirtdebt']>0) then Seragam.Text:=SToCurr(Qry.FieldValues['shirtdebt']) else Seragam.Text:='0';
          if (Qry.FieldValues['loan']<>NULL) then if (Qry.FieldValues['loan']>0) then PKhusus.Text:=IToCurr(Qry.FieldValues['loan']) else PKhusus.Text:='0';
          if (Qry.FieldValues['tlaka']<>NULL) then if (Qry.FieldValues['tlaka']>0) then TLaka.Text:=IToCurr(Qry.FieldValues['tlaka']) else TLaka.Text:='0';
          if (Qry.FieldValues['insentifa']<>NULL) then if (Qry.FieldValues['insentifa']>0) then InsentifA.Text:=IToCurr(Qry.FieldValues['insentifa']) else InsentifA.Text:='0';
          if (Qry.FieldValues['batch_param']<>NULL) then Batch_Param:=Qry.FieldValues['batch_param'] else Batch_Param:='';
          if (Qry.FieldValues['min_argo_hold']<>NULL) then Argo_Hold_Min:=Qry.FieldValues['min_argo_hold'];
          if (Qry.FieldValues['differs_fixed_rate']<>NULL) then Differ_Fixed_Rate:=Qry.FieldValues['differs_fixed_rate'];
          Saving_Deposit_Min:=Qry.FieldValues['saving_deposit_min'];
          {komisi 2 tingkat}
          if Qry.FieldValues['gross_commission']<>NULL then Gross_Commission:=Qry.FieldValues['gross_commission'] else Gross_Commission:=0;
          if Qry.FieldValues['percent_commission1']<>NULL then Percent_Commission1:=Qry.FieldValues['percent_commission1'] else Percent_Commission1:=0;
          if Qry.FieldValues['percent_commission2']<>NULL then Percent_Commission2:=Qry.FieldValues['percent_commission2'] else Percent_Commission2:=0;
          {komisi bertingkat}
          if Qry.FieldValues['percent1']<>NULL then Komisi1:=Qry.FieldValues['percent1'] else Komisi1:=0;
          if Qry.FieldValues['percent2']<>NULL then Komisi2:=Qry.FieldValues['percent2'] else Komisi2:=0;
          if Qry.FieldValues['percent3']<>NULL then Komisi3:=Qry.FieldValues['percent3'] else Komisi3:=0;
          if Qry.FieldValues['percent4']<>NULL then Komisi4:=Qry.FieldValues['percent4'] else Komisi4:=0;
          if Qry.FieldValues['percent5']<>NULL then Komisi5:=Qry.FieldValues['percent5'] else Komisi5:=0;
          if Qry.FieldValues['percent6']<>NULL then Komisi6:=Qry.FieldValues['percent6'] else Komisi6:=0;
          if Qry.FieldValues['gross_argo2']<>NULL then Gross_Argo2:=Qry.FieldValues['gross_argo2'] else Gross_Argo2:=0;
          if Qry.FieldValues['gross_argo3']<>NULL then Gross_Argo3:=Qry.FieldValues['gross_argo3'] else Gross_Argo3:=0;
          if Qry.FieldValues['gross_argo4']<>NULL then Gross_Argo4:=Qry.FieldValues['gross_argo4'] else Gross_Argo4:=0;
          if Qry.FieldValues['gross_argo5']<>NULL then Gross_Argo5:=Qry.FieldValues['gross_argo5'] else Gross_Argo5:=0;
          if Qry.FieldValues['gross_argo6']<>NULL then Gross_Argo6:=Qry.FieldValues['gross_argo6'] else Gross_Argo6:=0;
          if Qry.FieldValues['progressif']<>NULL then Progressif:=Qry.FieldValues['progressif'] else Progressif:=0;
          if (Qry.FieldValues['bbm_subsidize']>0) then Subsidi_Id:=Qry.FieldValues['bbm_subsidize'] else Subsidi_Id:='';
          if (Qry.FieldValues['max_commission']<>NULL) then Max_Commission:=Qry.FieldValues['max_commission'] else Max_Commission:=0;
          if (Subsidi_Id<>'') then begin
            MinRowBiaya:=MinRowBiaya+1;
            if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
            GridBiaya.Cells[0,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][1];
            GridBiaya.Cells[2,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][6];
            GridBiaya.Cells[3,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][7];
            GridBiaya.Cells[4,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][0];
            GridBiaya.Cells[5,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][9];
            GridBiaya.Cells[6,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][11];
            GridBiaya.Cells[7,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][12];
            GridBiaya.Cells[8,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Subsidi_Id,0)][13];
            if Qry.FieldValues['subs_rp1']<>NULL then Subs_BBM1:=Qry.FieldValues['subs_rp1'] else Subs_BBM1:=0;
            if Qry.FieldValues['subs_rp2']<>NULL then Subs_BBM2:=Qry.FieldValues['subs_rp2'] else Subs_BBM2:=0;
            if Qry.FieldValues['subs_rp3']<>NULL then Subs_BBM3:=Qry.FieldValues['subs_rp3'] else Subs_BBM3:=0;
            if Qry.FieldValues['subs_rp4']<>NULL then Subs_BBM4:=Qry.FieldValues['subs_rp4'] else Subs_BBM4:=0;
            if Qry.FieldValues['subs_rp5']<>NULL then Subs_BBM5:=Qry.FieldValues['subs_rp5'] else Subs_BBM5:=0;
            if Qry.FieldValues['subs_rp6']<>NULL then Subs_BBM6:=Qry.FieldValues['subs_rp6'] else Subs_BBM6:=0;
            if Qry.FieldValues['subs_rp7']<>NULL then Subs_BBM7:=Qry.FieldValues['subs_rp7'] else Subs_BBM7:=0;
            if Qry.FieldValues['subs_rp8']<>NULL then Subs_BBM8:=Qry.FieldValues['subs_rp8'] else Subs_BBM8:=0;
            if Qry.FieldValues['subs_gross_argo2']<>NULL then Gross_Subs_BBM2:=Qry.FieldValues['subs_gross_argo2'] else Gross_Subs_BBM2:=0;
            if Qry.FieldValues['subs_gross_argo3']<>NULL then Gross_Subs_BBM3:=Qry.FieldValues['subs_gross_argo3'] else Gross_Subs_BBM3:=0;
            if Qry.FieldValues['subs_gross_argo4']<>NULL then Gross_Subs_BBM4:=Qry.FieldValues['subs_gross_argo4'] else Gross_Subs_BBM4:=0;
            if Qry.FieldValues['subs_gross_argo5']<>NULL then Gross_Subs_BBM5:=Qry.FieldValues['subs_gross_argo5'] else Gross_Subs_BBM5:=0;
            if Qry.FieldValues['subs_gross_argo6']<>NULL then Gross_Subs_BBM6:=Qry.FieldValues['subs_gross_argo6'] else Gross_Subs_BBM6:=0;
            if Qry.FieldValues['subs_gross_argo7']<>NULL then Gross_Subs_BBM7:=Qry.FieldValues['subs_gross_argo7'] else Gross_Subs_BBM7:=0;
            if Qry.FieldValues['subs_gross_argo8']<>NULL then Gross_Subs_BBM8:=Qry.FieldValues['subs_gross_argo8'] else Gross_Subs_BBM8:=0;
          end;
          {BBM tunai harus selalu aktif karena tidak kerjasama dengan SPBU}
{          if Qry.FieldValues['bbm_cut']=0 then begin
            BBMTunai.Enabled:=False;
          end else begin
            BBMTunai.Enabled:=True;
          end;
}
          if (Qry.FieldValues['transaction_type_id']<>NULL) then Trans_Mitra_Id:=Qry.FieldValues['transaction_type_id'] else Trans_Mitra_Id:='';
          if (Trans_Mitra_Id<>'') then begin
            MinRowBiaya:=MinRowBiaya+1;
            if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
            GridBiaya.Cells[0,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][1];
            GridBiaya.Cells[1,MinRowBiaya]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][2]);
            GridBiaya.Cells[2,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][6];
            GridBiaya.Cells[3,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][7];
            GridBiaya.Cells[4,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][0];
            GridBiaya.Cells[5,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][9];
            GridBiaya.Cells[6,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][11];
            GridBiaya.Cells[7,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][12];
            GridBiaya.Cells[8,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Trans_Mitra_Id,0)][13];
          end;
          if (Qry.FieldValues['trans_type_id2']<>NULL) then Jaminan_Id:=Qry.FieldValues['trans_type_id2'] else Jaminan_Id:='';
          if (Jaminan_Id<>'') then begin
            if (Qry.FieldValues['trans_type_id2_amount']+Qry.FieldValues['trans_type_id2_total'])>0 then begin
              MinRowBiaya:=MinRowBiaya+1;
              if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
              GridBiaya.Cells[0,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][1];
              GridBiaya.Cells[1,MinRowBiaya]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][2]);
              GridBiaya.Cells[2,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][6];
              GridBiaya.Cells[3,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][7];
              GridBiaya.Cells[4,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][0];
              GridBiaya.Cells[5,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][9];
              GridBiaya.Cells[6,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][11];
              GridBiaya.Cells[7,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][12];
              GridBiaya.Cells[8,MinRowBiaya]:=BiayaArr[ArrayIndexOf(BiayaArr,Jaminan_Id,0)][13];
            end;
          end;
          if Qry.FieldValues['payment_ks_id']<>NULL then Payment_KS_Id:=Qry.FieldValues['payment_ks_id'] else Payment_KS_Id:='';
          if Payment_KS_Id<>'' then begin
              MinRowBiaya:=MinRowBiaya+1;
              if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
              SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,Payment_KS_Id,0));
              if Qry.FieldValues['payment_ks1']<>NULL then Payment_KS1:=Qry.FieldValues['payment_ks1'] else Payment_KS1:=0;
              if Qry.FieldValues['payment_ks2']<>NULL then Payment_KS2:=Qry.FieldValues['payment_ks2'] else Payment_KS2:=0;
              if Qry.FieldValues['payment_ks3']<>NULL then Payment_KS3:=Qry.FieldValues['payment_ks3'] else Payment_KS3:=0;
              if Qry.FieldValues['payment_ks4']<>NULL then Payment_KS4:=Qry.FieldValues['payment_ks4'] else Payment_KS4:=0;
              if Qry.FieldValues['payment_ks5']<>NULL then Payment_KS5:=Qry.FieldValues['payment_ks5'] else Payment_KS5:=0;
              if Qry.FieldValues['gross_argo_ks2']<>NULL then Gross_KS2:=Qry.FieldValues['gross_argo_ks2'] else Gross_KS2:=0;
              if Qry.FieldValues['gross_argo_ks3']<>NULL then Gross_KS3:=Qry.FieldValues['gross_argo_ks3'] else Gross_KS3:=0;
              if Qry.FieldValues['gross_argo_ks4']<>NULL then Gross_KS4:=Qry.FieldValues['gross_argo_ks4'] else Gross_KS4:=0;
              if Qry.FieldValues['gross_argo_ks5']<>NULL then Gross_KS5:=Qry.FieldValues['gross_argo_ks5'] else Gross_KS5:=0;
          end;
          if Qry.FieldValues['payment_shirt_id']<>NULL then Payment_Shirt_Id:=Qry.FieldValues['payment_shirt_id'] else Payment_Shirt_Id:='';
          if Payment_Shirt_Id<>'' then begin
              MinRowBiaya:=MinRowBiaya+1;
              if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
              SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,Payment_Shirt_Id,0));
              if Qry.FieldValues['payment_shirt1']<>NULL then Shirt1:=Qry.FieldValues['payment_shirt1'] else Shirt1:=0;
              if Qry.FieldValues['payment_shirt2']<>NULL then Shirt2:=Qry.FieldValues['payment_shirt2'] else Shirt2:=0;
              if Qry.FieldValues['payment_shirt3']<>NULL then Shirt3:=Qry.FieldValues['payment_shirt3'] else Shirt3:=0;
              if Qry.FieldValues['payment_shirt4']<>NULL then Shirt4:=Qry.FieldValues['payment_shirt4'] else Shirt4:=0;
              if Qry.FieldValues['payment_shirt5']<>NULL then Shirt5:=Qry.FieldValues['payment_shirt5'] else Shirt5:=0;
              if Qry.FieldValues['gross_argo_shirt2']<>NULL then Gross_Shirt2:=Qry.FieldValues['gross_argo_shirt2'] else Gross_Shirt2:=0;
              if Qry.FieldValues['gross_argo_shirt3']<>NULL then Gross_Shirt3:=Qry.FieldValues['gross_argo_shirt3'] else Gross_Shirt3:=0;
              if Qry.FieldValues['gross_argo_shirt4']<>NULL then Gross_Shirt4:=Qry.FieldValues['gross_argo_shirt4'] else Gross_Shirt4:=0;
              if Qry.FieldValues['gross_argo_shirt5']<>NULL then Gross_Shirt5:=Qry.FieldValues['gross_argo_shirt5'] else Gross_Shirt5:=0;
          end;
{        if Qry.FieldValues['saving_id']<>NULL then Tabungan_Id:=Qry.FieldValues['saving_id'] else Tabungan_Id:='';
        if Tabungan_Id<>'' then begin
            MinRowBiaya:=MinRowBiaya+1;
            if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
            SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,Tabungan_Id,0));


      if Qry.FieldValues['gross_argo_saving2']<>NULL then SPJArr[Count][66]:=Qry.FieldValues['gross_argo_saving2'] else SPJArr[Count][66]:='0';
      if Qry.FieldValues['gross_argo_saving3']<>NULL then SPJArr[Count][67]:=Qry.FieldValues['gross_argo_saving3'] else SPJArr[Count][67]:='0';
      if Qry.FieldValues['gross_argo_saving4']<>NULL then SPJArr[Count][68]:=Qry.FieldValues['gross_argo_saving4'] else SPJArr[Count][68]:='0';
      if Qry.FieldValues['gross_argo_saving5']<>NULL then SPJArr[Count][69]:=Qry.FieldValues['gross_argo_saving5'] else SPJArr[Count][69]:='0';
      if Qry.FieldValues['saving_add1']<>NULL then SPJArr[Count][70]:=Qry.FieldValues['saving_add1'] else SPJArr[Count][70]:='0';
      if Qry.FieldValues['saving_add2']<>NULL then SPJArr[Count][71]:=Qry.FieldValues['saving_add2'] else SPJArr[Count][71]:='0';
      if Qry.FieldValues['saving_add3']<>NULL then SPJArr[Count][72]:=Qry.FieldValues['saving_add3'] else SPJArr[Count][72]:='0';
      if Qry.FieldValues['saving_add4']<>NULL then SPJArr[Count][73]:=Qry.FieldValues['saving_add4'] else SPJArr[Count][73]:='0';
      if Qry.FieldValues['saving_add5']<>NULL then SPJArr[Count][74]:=Qry.FieldValues['saving_add5'] else SPJArr[Count][74]:='0';
        end;
}
          if Qry.FieldValues['late_fee_id']<>NULL then Late_Fee_Id:=Qry.FieldValues['late_fee_id'] else Late_Fee_Id:='';
          if Late_Fee_Id<>'' then begin
              MinRowBiaya:=MinRowBiaya+1;
              if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
              SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,Late_Fee_Id,0));
              Hour_Late_Fee:=Qry.FieldValues['hour_late_fee'];
              if Qry.FieldValues['day_worktime_start']<>NULL then Work_Time_Start_1:=Qry.FieldValues['day_worktime_start'] else Work_Time_Start_1:='';
              if Qry.FieldValues['night_worktime_start']<>NULL then Work_Time_Start_2:=Qry.FieldValues['night_worktime_start'] else Work_Time_Start_2:='';
              if Qry.FieldValues['day_worktime_end']<>NULL then Work_Time_End_1:=Qry.FieldValues['day_worktime_end'] else Work_Time_End_1:='';
              if Qry.FieldValues['night_worktime_end']<>NULL then Work_Time_End_2:=Qry.FieldValues['night_worktime_end'] else Work_Time_End_2:='';
              if Qry.FieldValues['day_worktime_end_weekend']<>NULL then Work_Time_End_3:=Qry.FieldValues['day_worktime_end_weekend'] else Work_Time_End_3:='';
              if Qry.FieldValues['night_worktime_end_weekend']<>NULL then Work_Time_End_4:=Qry.FieldValues['night_worktime_end_weekend'] else Work_Time_End_4:='';
          end;
          { Potongan Lain }
          for IntCount:=0 to Length(BatchTransArr)-1 do begin
            if Qry.FieldValues['vhc_batch_id']=BatchTransArr[IntCount][0] then begin
              if BatchTransArr[IntCount][1]<>'0' then begin
                MinRowBiaya:=MinRowBiaya+1;
                if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
                SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,BatchTransArr[IntCount][1],0));
              end;
            end;
          end;
          for IntCount:=0 to Length(CommTransArr)-1 do begin
            if Qry.FieldValues['empl_commission_id']=CommTransArr[IntCount][0] then begin
              if CommTransArr[IntCount][1]<>'0' then begin
                MinRowBiaya:=MinRowBiaya+1;
                if GridBiaya.RowCount<=MinRowBiaya+1 then GridBiaya.RowCount:=MinRowBiaya+2;
                SetGridData(MinRowBiaya,ArrayIndexOf(BiayaArr,CommTransArr[IntCount][1],0));
              end;
            end;
          end;
          for IntCount:=1 to GridBiaya.RowCount-1 do GridBiaya.CellStyle[1,IntCount].HorizontalAlignment:=taRightJustify;
        end;
        Qry.Close;
        FreeAndNil(Qry);
        Main.CloseDb;
      end;
      case FormNumber of
        1:RitAkhir.SetFocus;
        2:KMOrdoAkhir.SetFocus;
      end;
    end;
  end;
end;

procedure TDepositForm.SetGridData(Row_Grid,BiayaArr_RowNum:Integer);
begin
  GridBiaya.Cells[0,Row_Grid]:=BiayaArr[BiayaArr_RowNum][1];
  GridBiaya.Cells[1,Row_Grid]:=SToCurr(BiayaArr[BiayaArr_RowNum][2]);
  GridBiaya.Cells[2,Row_Grid]:=BiayaArr[BiayaArr_RowNum][6];
  GridBiaya.Cells[3,Row_Grid]:=BiayaArr[BiayaArr_RowNum][7];
  GridBiaya.Cells[4,Row_Grid]:=BiayaArr[BiayaArr_RowNum][0];
  GridBiaya.Cells[5,Row_Grid]:=BiayaArr[BiayaArr_RowNum][9];
  GridBiaya.Cells[6,Row_Grid]:=BiayaArr[BiayaArr_RowNum][11];
  GridBiaya.Cells[7,Row_Grid]:=BiayaArr[BiayaArr_RowNum][12];
  GridBiaya.Cells[8,Row_Grid]:=BiayaArr[BiayaArr_RowNum][13];
end;

procedure TDepositForm.DriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then RitAkhir.SetFocus;
  if Key = #27 then DepositForm.Close;
end;

procedure TDepositForm.NoBodiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Driver.SetFocus;
  if Key = #27 then DepositForm.Close;
end;

procedure TDepositForm.RitAkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DropAkhir.SetFocus;
end;

procedure TDepositForm.KMArgoAkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgoIsiAkhir.SetFocus;
end;

procedure TDepositForm.KMOrdoAkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then
    case FormNumber of
      1:RitAkhir.SetFocus;
      2:Disetor.SetFocus;
    end;
end;

procedure TDepositForm.BBMRupiahKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then GasRupiah.SetFocus;
end;

procedure TDepositForm.GasRupiahKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then GridBiaya.SetFocus;
end;

procedure TDepositForm.BBMRupiahEnter(Sender: TObject);
begin
  BBMRupiah.Text:=ToString(BBMRupiah.Text);
end;

procedure TDepositForm.GasRupiahEnter(Sender: TObject);
begin
  GasRupiah.Text:=ToString(GasRupiah.Text);
end;

procedure TDepositForm.BBMRupiahExit(Sender: TObject);
begin
  if ToString(BBMRupiah.Text)='' then BBMRupiah.Text:='0';
  BBMRupiah.Text:=SToCurr(BBMRupiah.Text);
  if ToString(BBMRupiah.Text)<>'' then begin
    BBMLiter.Text:=IToCurr(RoundTo(SToInt(BBMRupiah.Text)/BBMPerLiter,-2));
    Calculate;
  end;
end;

procedure TDepositForm.GasRupiahExit(Sender: TObject);
begin
  if ToString(GasRupiah.Text)='' then GasRupiah.Text:='0';
  GasRupiah.Text:=SToCurr(GasRupiah.Text);
  if (Trim(GasRupiah.Text)<>'') then begin
    GasLiter.Text:=IToCurr(RoundTo(SToInt(GasRupiah.Text)/GasPerLiter,-2));
    Calculate;
  end;

end;

procedure TDepositForm.DropAkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgoAkhir.SetFocus;
end;

procedure TDepositForm.DisetorExit(Sender: TObject);
begin
  Disetor.Text:=SToCurr(ToString(Disetor.Text));
  Calculate;
end;


procedure TDepositForm.DisetorEnter(Sender: TObject);
begin
  Disetor.Text:=ToString(Disetor.Text);
end;

procedure TDepositForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Cari.Text:='';
  Init;
  RefreshCombo;
  NoBodi.Enabled:=True;
  Driver.Enabled:=True;
  GroupSPJ.Enabled:=True;
  Main.M_Normal;
end;

procedure TDepositForm.SimpanClick(Sender: TObject);
var StrQry,StrEMessage,StrMsg:String;
    Qry:TADOQuery;
    IsOk,IsCetak,IsAuth,IsCicilan,IsEmplTrans,IsNoRecord:Boolean;
    InRits,InDrops,InArgoKM,InOrdoKM,FuelPrice,FuelLitre,GasPrice,GasLitre,GrossArgo,Commission,Deposit,CashDeposit,TransType,Amount:String;
    DepositMinus,DepositMinusCode,InArgoKMIsi,StrSPJBatalJalan,TransId2,StrDebt,StrCicilanAmount,TotalAmount,NewStrDebt,PartnerIncome:String;
    StrBBMTunai,StrInTime,StrInDate,StrValue,StrRitDrop,StrFixedRateCut,StrNonCash,StrValue1,StrValue2,StrValue3,StrValue4:String;
    Count:Integer;
begin
  IsCetak:=False;
  IsOk:=True;
  IsAuth:=False;
  IsCicilan:=False;
  IsEmplTrans:=False;
  StrCicilanAmount:='';
  AuthorizedForm.FormId:=IntToStr(TreeTag);
  if (SPJBatalJalan.Checked) then begin
    if (MessageBox(0,'Mau Membatalkan SPJ?'+Chr(13)+Chr(13)+' Otorisasi SPJ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1) then
      AuthorizedForm.StrMessage:='Pembatalan SPJ '+TransId;
      AuthorizedForm.CheckValues:='';
      AuthorizedForm.Values:=0;
      if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
  end else begin
      IsAuth:=True;
  end;
  if (  ( (ToString(KMOrdoAkhir.Text)<>'') AND (ToString(BBMRupiah.Text)<>'') AND (ToString(Disetor.Text)<>'0')  AND (SToInt(ToString(TotalSetor.Text))>0) AND (SPJBatalJalan.Checked=False))  )
  OR ( (SPJBatalJalan.Checked) AND (IsAuth))then begin
    Main.M_Busy;
    if SPJBatalJalan.Checked=False then
      StrMsg:='Setoran Tunai Rp.'+Disetor.Text+Chr(13)+Chr(13)+'Sudah dihitung dengan benar ?';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if (Main.OpenDb) AND (MessageBox(0,PChar(StrMsg),'Kasir',MB_OKCANCEL or MB_ICONQUESTION) = 1) then begin
      DisableInput;
      Main.TransStart;
      case FormNumber of
        1:begin
            StrRitDrop:=',rit_drop='+ToString(RitDrop.Text);
            if Differ_Fixed_Rate>0 then StrFixedRateCut:=',fixed_rate_cut=1' else StrFixedRateCut:=',fixed_rate_cut=0';
            InRits:=',in_rits='+ToString(RitAkhir.Text);
            InDrops:=',in_drops='+ToString(DropAkhir.Text);
            InArgoKM:=',in_argo_km='+ToString(KMArgoAkhir.Text);
            InArgoKMIsi:=',in_hired_km='+ToString(KMArgoIsiAkhir.Text);
            Commission:=',commission='+ToString(Komisi.Text);
            if Differ_Fixed_Rate>0 then begin
              GrossArgo:=',gross_argo='+ToString(ArgoKotor.Text);
            end else begin
              GrossArgo:=',gross_argo='+IntToStr(StrToInt(ToString(ArgoKotor.Text))+SelisihFR);
            end;
            PartnerIncome:=',partner_income='+ToString(PenghasilanMitra.Text);
          end;
        2:begin
            StrRitDrop:='';
            StrFixedRateCut:='';
            InRits:='';
            InDrops:='';
            InArgoKM:='';
            InArgoKMIsi:='';
            Commission:='';
            GrossArgo:='';
            PartnerIncome:='';
          end;
      end;
      StrNonCash:=ToString(TotalSetorNonTunai.Text);
      InOrdoKM:=ToString(KMOrdoAkhir.Text);
      if BBMRupiah.Text<>'0' then begin
        FuelPrice:=ToString(BBMRupiah.Text);
        FuelLitre:=StringReplace(ToString(BBMLiter.Text),',','.',[rfReplaceAll]);
        if ToString(GasRupiah.Text)<>'' then GasPrice:=ToString(GasRupiah.Text)
        else GasPrice:='0';
        GasLitre:=StringReplace(ToString(GasLiter.Text),',','.',[rfReplaceAll]);
      end else begin
        FuelPrice:='NULL';
        FuelLitre:='NULL';
        GasPrice:='NULL';
        GasLitre:='NULL';
      end;
      Deposit:=IntToStr(StrToInt(ToString(Disetor.Text))+StrToInt(ToString(TotalSetorNonTunai.Text)));
      CashDeposit:=ToString(Disetor.Text);
      StrQry:='SELECT dbo.GetDebt('+Chr(39)+EmplId+Chr(39)+') AS amount;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      StrDebt:=Qry.FieldValues['amount'];
      Qry.Close;
      if SToInt(KurangSetor.Text)>0 then DepositMinus:=ToString(KurangSetor.Text)
      else DepositMinus:='-'+ToString(LebihSetor.Text);
      if SPJBatalJalan.Checked then StrSPJBatalJalan:=',cancel=1' else StrSPJBatalJalan:='';
      if BBMTunai.Checked then StrBBMTunai:='1' else StrBBMTunai:='0';
      if Trim(TanggalBaru.Text)='-  -' then begin
        if Trim(WaktuBaru.Text)=':  :' then begin
          StrInDate:='GETDATE()';
          StrInTime:='GETDATE()';
        end else begin
          StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Main.Status.Panels.Items[0].Text))+' '+Trim(WaktuBaru.Text));
          StrInTime:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Main.Status.Panels.Items[0].Text))+' '+Trim(WaktuBaru.Text));
        end;
      end else begin
        if Trim(WaktuBaru.Text)=':  :' then begin
//          StrInDate:=QuotedStr(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])+' '+Main.Status.Panels.Items[1].Text);
//          StrInTime:=QuotedStr(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])+' '+Main.Status.Panels.Items[1].Text);
          StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])))+' '+Main.Status.Panels.Items[1].Text);
          StrInTime:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])))+' '+Main.Status.Panels.Items[1].Text);
        end else begin
          StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])))+' '+Trim(WaktuBaru.Text));
          StrInTime:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StringReplace(Trim(TanggalBaru.Text),'-','/',[rfReplaceAll])))+' '+Trim(WaktuBaru.Text));
        end;
      end;
      StrQry:='UPDATE wh_vhc_trans SET in_time='+StrInTime+',in_date='+StrInDate+',in_user='+QuotedStr(User)+
            InRits+InDrops+InArgoKM+InArgoKMIsi+',in_ordo_km='+InOrdoKM+
            ',fuel_price='+FuelPrice+',fuel_litre='+FuelLitre+',gas_price='+GasPrice+
            ',gas_litre='+GasLitre+GrossArgo+Commission+',deposit='+Deposit+
            ',cash_deposit='+CashDeposit+StrSPJBatalJalan+',cash_bbm='+StrBBMTunai+StrRitDrop+
            StrFixedRateCut+',deposit_moreless='+DepositMinus+PartnerIncome+
            ',non_cash='+StrNonCash+',update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
            'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan SPJ';
          StrEMessage:=E.Message;
          IsOk:=False;
        end;
      end;
      Qry.SQL.Clear;
      StrQry:='';
      Count:=1;
      Repeat
        TransType:=GridBiaya.Cells[4,Count];
        Amount:=ToString(GridBiaya.Cells[1,Count]);
        if GridBiaya.Cells[3,Count]<>'0' then StrValue:=GridBiaya.Cells[3,Count] else StrValue:='NULL';
        if TransType='110204' then begin
          TransType:='120103';
          IsEmplTrans:=True;
        end;
        if TransType='110205' then begin
          IsEmplTrans:=True;
        end;
        if TransType='110207' then begin
          TransType:='120106';
          IsEmplTrans:=True;
        end;
        if TransType='110217' then begin
          TransType:='120120';
          IsEmplTrans:=True;
        end;
        if TransType='110503' then begin
          TransType:='120121';
          IsEmplTrans:=True;
        end;
        if (Trim(TransType)<>'') AND (Trim(Amount)<>'') AND (Trim(Amount)<>'0') then
          StrQry:=StrQry+' INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,update_time,update_user)'+
                ' VALUES ('+QuotedStr(TransId)+','+TransType+','+StrValue+','+Amount+',GETDATE(),'+QuotedStr(User)+');';
        Inc(Count);
      Until (Count>GridBiaya.RowCount) OR (GridBiaya.Cells[1,Count]='');
      if Trim(StrQry)<>'' then begin
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan SPJ detail';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
      end;
      if FormNumber=1 then begin
        StrValue1:=ToString(v29Akhir.Text);
        StrValue2:=ToString(v30Akhir.Text);
        StrValue3:=ToString(v29Awal.Text);
        StrValue4:=ToString(v30Awal.Text);
        if ((SToInt(StrValue1)>0) and (SToInt(StrValue2)>0)) or ((SToInt(StrValue3)>0) or (SToInt(StrValue4)>0) ) then begin
          StrQry:='SELECT * FROM wh_vhc_trans_detail_taxi WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=1) AND (status=1);';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['vhc_trans_id']<>NULL then IsNoRecord:=False else IsNoRecord:=True;
          Qry.Close;
          if IsNoRecord then
            StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out,value1_in,value2_in,update_time,update_user) VALUES ('+
                    QuotedStr(TransId)+',1,0,0,'+StrValue1+','+StrValue2+',GETDATE(),'+QuotedStr(User)+');'
          else
            StrQry:='UPDATE wh_vhc_trans_detail_taxi SET value1_in='+StrValue1+',value2_in='+StrValue2+',update_time=GETDATE()'+
                    ',update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=1) AND (status=1);';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan SPJ';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrValue1:=ToString(v31Akhir.Text);
        StrValue2:=ToString(v32Akhir.Text);
        StrValue3:=ToString(v31Awal.Text);
        StrValue4:=ToString(v32Awal.Text);
        if ((SToInt(StrValue1)>0) and (SToInt(StrValue2)>0)) or  ((SToInt(StrValue3)>0) or (SToInt(StrValue4)>0) ) then begin
          StrQry:='SELECT * FROM wh_vhc_trans_detail_taxi WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=2) AND (status=1);';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['vhc_trans_id']<>NULL then IsNoRecord:=False else IsNoRecord:=True;
          Qry.Close;
          if IsNoRecord then
            StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out,value1_in,value2_in,update_time,update_user) VALUES ('+
                    QuotedStr(TransId)+',2,0,0,'+StrValue1+','+StrValue2+',GETDATE(),'+QuotedStr(User)+');'
          else
            StrQry:='UPDATE wh_vhc_trans_detail_taxi SET value1_in='+StrValue1+',value2_in='+StrValue2+',update_time=GETDATE()'+
                    ',update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=2) AND (status=1);';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan SPJ';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        StrValue1:=ToString(v33Akhir.Text);
        StrValue2:=ToString(v34Akhir.Text);
        StrValue3:=ToString(v33Awal.Text);
        StrValue4:=ToString(v34Awal.Text);
        if ((SToInt(StrValue1)>0) and (SToInt(StrValue2)>0)) or  ((SToInt(StrValue3)>0) or (SToInt(StrValue4)>0) ) then begin
          StrQry:='SELECT * FROM wh_vhc_trans_detail_taxi WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=1) AND (status=3);';
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['vhc_trans_id']<>NULL then IsNoRecord:=False else IsNoRecord:=True;
          Qry.Close;
          if IsNoRecord then
            StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out,value1_in,value2_in,update_time,update_user) VALUES ('+
                    QuotedStr(TransId)+',3,0,0,'+StrValue1+','+StrValue2+',GETDATE(),'+QuotedStr(User)+');'
          else
            StrQry:='UPDATE wh_vhc_trans_detail_taxi SET value1_in='+StrValue1+',value2_in='+StrValue2+',update_time=GETDATE()'+
                    ',update_user='+QuotedStr(User)+' WHERE (vhc_trans_id='+QuotedStr(TransId)+') AND (taxi_detail_type_id=3) AND (status=1);';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              StrMsg:='Tidak Dapat Menyimpan SPJ';
              StrEMessage:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
      end;
      if (StrToInt(DepositMinus)<>0) then IsEmplTrans:=True;
      if IsEmplTrans then begin
        StrQry:='SELECT RIGHT(MAX(empl_transaction_id),4) AS empl_transaction_id FROM wh_empl_transaction '+
              'WHERE empl_transaction_id  LIKE '+Chr(39)+'SPM'+LocationCode+CompanyId+
              FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
              FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
              '____'+Chr(39)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['empl_transaction_id']<>NULL then begin
          TransId2:=Qry.FieldValues['empl_transaction_id'];
          TransId2:=Format('%.*d',[4,StrToInt(TransId2)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          TransId2:='0001';
        TransId2:='SPM'+LocationCode+CompanyId+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId2;
        StrQry:='INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,update_user)'+
              ' VALUES ('+Chr(39)+TransId2+Chr(39)+','+Chr(39)+EmplId+Chr(39)+','+Chr(39)+TransId+Chr(39)+
              ',GETDATE(),'+Chr(39)+User+Chr(39)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan SPJ transaksi';
            StrEMessage:=E.Message;
            IsOk:=False;
          end
        end;
        StrQry:='';
        Count:=1;
        NewStrDebt:=StrDebt;
        Repeat
          TransType:=GridBiaya.Cells[4,Count];
          Amount:=ToString(GridBiaya.Cells[1,Count]);
          if GridBiaya.Cells[8,Count]='1' then begin
            if GridBiaya.Cells[6,Count]='1' then StrCicilanAmount:=IntToStr(0-SToInt(Amount)) else StrCicilanAmount:=Amount;
            if StrToInt(StrCicilanAmount)<>0 then begin
              StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id,amount,total,update_user)'+
                    ' VALUES ('+Chr(39)+TransId2+Chr(39)+','+TransType+','+StrCicilanAmount+','+StrCicilanAmount+','+Chr(39)+User+Chr(39)+');';
            end;
          end;
          Inc(Count);
        Until (Count>GridBiaya.RowCount) OR (GridBiaya.Cells[1,Count]='');
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan SPJ transaksi Detail';
            StrEMessage:=E.Message;
            IsOk:=False;
          end
        end;
      end;
      if StrToInt(DepositMinus)<>0 then begin
        if StrToInt(DepositMinus)>0 then DepositMinusCode:='120101'
        else DepositMinusCode:='120102';
        NewStrDebt:=IntToStr(SToInt(NewStrDebt)+SToInt(DepositMinus));
        StrQry:='INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id,amount,total,update_user)'+
              ' VALUES ('+Chr(39)+TransId2+Chr(39)+','+DepositMinusCode+','+DepositMinus+
              ','+NewStrDebt+','+Chr(39)+User+Chr(39)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan SPJ transaksi Detail';
            StrEMessage:=E.Message;
            IsOk:=False;
          end
        end;
        if (DepositMinusCode='120101') AND (HoldLessDeposit=True) AND (MaxLessDeposit>0)  then begin
          if (StrToInt(DepositMinus)>MaxLessDeposit)  then begin
            StrQry:=' INSERT INTO wh_empl_hold (employee_id,form_name,form_id,transaction_type_id,totalvalue,value,reason,update_user)'+
                    ' VALUES ('+Chr(39)+ EmplId+Chr(39)+','+Chr(39)+'SSM'+Chr(39)+
                    ','+Chr(39)+TransId+Chr(39)+','+Chr(39)+'120103'+Chr(39)+','+DepositMinus+','+DepositMinus+
                    ','+Chr(39)+'Mitra KS Rp. '+SToCurr(DepositMinus)+' '+Chr(39)+
                    ','+Chr(39)+User+Chr(39)+');';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Daftar Cekal';
                StrEMessage:=E.Message;
              end;
            end;
          end;
        end;
      end;
      if (Argo_Hold_Min>0) and (SPJBatalJalan.Checked=False) then begin
        if (SToInt(ArgoKotor.Text)<=Argo_Hold_Min) then begin
            StrQry:=' INSERT INTO wh_empl_hold (employee_id,form_name,form_id,reason,update_user)'+
                    ' VALUES ('+QuotedStr(EmplId)+','+QuotedStr('SSM')+
                    ','+QuotedStr(TransId)+','+QuotedStr('Argo Mitra Rp. '+ArgoKotor.Text+' dibawah Rp. '+IToCurr(Argo_Hold_Min)+Chr(13)+'       Silahkan Menghadap Ka Pool')+
                    ','+QuotedStr(User)+');';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Daftar Cekal';
                StrEMessage:=E.Message;
              end;
            end;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        if SPJBatalJalan.Checked=False then begin
          if MessageBox(0,'Setoran Berhasil Disimpan'+Chr(13)+Chr(13)+'    Cetak Slip ?','Setoran Mitra',MB_OKCANCEL or MB_ICONQUESTION) = 1 then
            IsCetak:=True;
        end else MessageBox(0,'SPJ Berhasil Dibatalkan','Setoran Mitra',MB_OKCANCEL or MB_ICONINFORMATION);
      end else begin
        EnableInput;
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Setoran Mitra',MB_OK or MB_ICONWARNING);
      end;
    end else begin
      IsOk:=False;
      StrMsg:='Kolom disetor Tidak boleh Kosong';
    end;
    Qry.Close;
    FreeAndNil(Qry);
    Main.M_Normal;
    Main.CloseDb;
    if (IsCetak) then Reprint(TransId);
  end else
    MessageBox(0,'Silahkan Isi semua kolom','Setoran Mitra',MB_OK or MB_ICONWARNING);
end;

procedure TDepositForm.DisableInput;
begin
  NoBodi.Enabled:=False;
  Driver.Enabled:=False;
  GroupAkhir.Enabled:=False;
  GroupAkhir2.Enabled:=False;
  GroupBiaya.Enabled:=False;
  GroupBBMGas.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  Disetor.Enabled:=False;
  GroupSPJ.Enabled:=False;
  Simpan.Enabled:=False;
  GroupKlik.Enabled:=False;
end;

procedure TDepositForm.EnableInput;
begin
  GroupAkhir.Enabled:=True;
  GroupAkhir2.Enabled:=True;
  GroupBiaya.Enabled:=True;
  GroupBBMGas.Enabled:=True;
  GroupKeterangan.Enabled:=True;
  Disetor.Enabled:=True;
  Simpan.Enabled:=True;
  GroupKlik.Enabled:=True;
end;

procedure TDepositForm.PreparePrint;
var BBM:Real;
    Count,TotalVcr:Integer;
    QStr,StrTransType:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='SELECT CONVERT(VARCHAR(10),out_date,103) AS out_date,CONVERT(VARCHAR(10),in_date,103) AS in_date,CONVERT(VARCHAR(5),in_time,108) AS in_time '+
          'FROM wh_vhc_trans WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QTanggalSPJ.Caption:=Qry.FieldValues['out_date'];
      QTanggal.Caption:=Qry.FieldValues['in_date'];
      QJam.Caption:=Qry.FieldValues['in_time'];
    end;
    Qry.Close;
    QStr:='EXEC GetLocationDetail  '+Chr(39)+LocationId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QLocation.Caption:=Qry.FieldValues['location'];
      QAlamat.Caption:=Qry.FieldValues['address'];
    end;
    Qry.Close;
    QNoSlip.Caption:='SSM'+RightStr(TransId,Length(TransId)-3);
    QNoBody.Caption:=NoBodi.Text;
    QNoPolisi.Caption:=NoPolisi.Text;
    QNoKPP.Caption:=Driver.Text;
    QMitra.Caption:=DriverDisp.Text;
    QRit.Caption:=RitTotal.Text;
    QDrop.Caption:=DropTotal.Text;
    QBBMRupiah.Caption:=BBMRupiah.Text;
    QBBMLiter.Caption:=BBMLiter.Text;
    QGasRupiah.Caption:=GasRupiah.Text;
    QGasLiter.Caption:=GasLiter.Text;
    BBM:= SToInt(KMOrdoTotal.Text)/StrToFloat(QBBMLiter.Caption);
    QRatio.Caption:='R 1:'+FloatToStrF(BBM,ffNumber,4,2);
    QTotalHarusSetor.Caption:=TotalSetor.Text;
    if BBMTunai.Checked then QBBMTunai.Caption:='BBM Tunai' else QBBMTunai.Caption:='';
    TotalVcr:=0;
    StrTransType:='';
    QStr:='EXEC GetTransactionType @TransName='+Chr(39)+'dummy'+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['transaction_type_id']<>NULL then begin
      StrTransType:=Qry.FieldValues['transaction_type_id'];
    end;
    Qry.Close;
    for Count:=1 to GridBiaya.RowCount do begin
       if GridBiaya.Cells[4,Count]=StrTransType then TotalVcr:=TotalVcr+StrToInt(ToString(GridBiaya.Cells[1,Count]));
    end;
    QDummy.Caption:=IToCurr(TotalVcr);
    QKomisiPersen.Caption:=KomisiPersen.Caption;
    QArgoKotor.Caption:=ArgoKotor.Text;
    QArgoBersih.Caption:=ArgoBersih.Text;
    QKomisi.Caption:=Komisi.Text;
    QDisetorkan.Caption:=Disetor.Text;
    QKurangSetor.Caption:=KurangSetor.Text;
    QLebihSetor.Caption:=LebihSetor.Text;
    QStr:='SELECT dbo.GetDebt('+Chr(39)+Driver.Text+Chr(39)+') AS total ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['total']<>0 then begin
        if Qry.FieldValues['total']>=0 then QHutangMitra.Caption:=SToCurr(Qry.FieldValues['total'])
        else QHutangMitra.Caption:='('+SToCurr(0-Qry.FieldValues['total'])+')';
      end else begin
        QHutangMitra.Caption:='0';
      end;
    end;
    Qry.Close;
    QStr:='SELECT dbo.GetSaving('+Chr(39)+Driver.Text+Chr(39)+') AS total ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['total']<0 then QTabunganMitra.Caption:=IToCurr(0-StrToInt(Qry.FieldValues['total']))
      else QTabunganMitra.Caption:='0';
    end;
    Qry.Close;
    QStr:='SELECT amount AS insentif FROM wh_vhc_trans_detail '+
          ' WHERE transaction_type_id='+Chr(39)+'110403'+Chr(39)+' AND vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['insentif']<>NULL then begin
      QInsentifBBM.Caption:=SToCurr(Qry.FieldValues['insentif']);
      QPengeluaranBBM.Caption:=IToCurr(StrToInt(ToString(QBBMRupiah.Caption))-(StrToInt(ToString(QInsentifBBM.Caption))));
      QBBMLiter.Caption:='';
    end;
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',5) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      QJaminan.Caption:=IToCurr(0-Qry.FieldValues['total']);
    end else
      QJaminan.Caption:='0';
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',3) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      if Qry.FieldValues['total']>0 then QHutangOnRisk.Caption:=SToCurr(Qry.FieldValues['total'])
      else QHutangOnRisk.Caption:=SToCurr(Qry.FieldValues['total']);
    end else
      QHutangOnRisk.Caption:='0';
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',4) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      if Qry.FieldValues['total']>0 then QHutangOnRisk.Caption:=SToCurr(Qry.FieldValues['total'])
      else QLaka.Caption:=SToCurr(Qry.FieldValues['total']);
    end else
      QLaka.Caption:='0';
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',7) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      if Qry.FieldValues['total']>0 then QTilang.Caption:=SToCurr(Qry.FieldValues['total'])
      else QTilang.Caption:=SToCurr(Qry.FieldValues['total']);
    end else
      QTilang.Caption:='0';
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',6) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      if Qry.FieldValues['total']>0 then QSeragam.Caption:=SToCurr(Qry.FieldValues['total'])
      else QSeragam.Caption:=SToCurr(Qry.FieldValues['total']);
    end else
      QSeragam.Caption:='0';
    Qry.Close;
    QStr:='SELECT dbo.GetTotalAmount('+Chr(39)+Driver.Text+Chr(39)+',8) AS total;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.FieldValues['total']<>NULL then begin
      if Qry.FieldValues['total']>0 then QPinjamanKhusus.Caption:=SToCurr(Qry.FieldValues['total'])
      else QPinjamanKhusus.Caption:=SToCurr(Qry.FieldValues['total']);
    end else
      QPinjamanKhusus.Caption:='0';
    Qry.Close;
    if IntReguler=1 then QPenghasilan.Caption:=PenghasilanMitra.Text;
    Main.CloseDb;
    QTandaMitra.Caption:=UpperCase(DriverDisp.Text);
    QTandaKasir.Caption:=UpperCase(User);
    SetReguler(IntReguler);
    FreeAndNil(Qry);
  end;
  Main.M_Normal;
end;


procedure TDepositForm.JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    JumlahBiayaExit(nil);
    if GridBiaya.Row=GridBiaya.RowCount-1 then GridBiaya.RowCount:=GridBiaya.RowCount+1;
    GridBiaya.Row:=GridBiaya.Row+1;
    GridBiaya.Col:=GridBiaya.Col-1;
  end;
  if (Key=#27) then begin
    JumlahBiayaExit(nil);
  end;
end;

procedure TDepositForm.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    InitGridSPJ;
    Count2:=2;
    for Count:=0 to Length(SPJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 14 do
        if (StrPos(PChar(UpperCase(SPJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2;
          GridSPJ.Cells[0,Count2-1]:=SPJArr[Count][0];
          GridSPJ.Cells[1,Count2-1]:=SPJArr[Count][1];
          GridSPJ.Cells[2,Count2-1]:=SPJArr[Count][3];
          GridSPJ.Cells[3,Count2-1]:=SPJArr[Count][4];
          GridSPJ.Cells[4,Count2-1]:=SPJArr[Count][5];
          GridSPJ.Cells[5,Count2-1]:=SPJArr[Count][6];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGridSPJ;
end;

procedure TDepositForm.DisetorKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TDepositForm.CetakUlangClick(Sender: TObject);
begin
  DepositReprint:=TDepositReprint.Create(Self);
end;

procedure TDepositForm.Reprint(NoDeposit:String);
var BBM:Real;
    Count,TotalVcr,TotalNonTunai,TotalHarusSetor,IntFixedRateCut:Integer;
    StrQry,StrTransType,StrNonCash:String;
    Qry,Qry2,Qry3:TADOQuery;
begin
  if NoDeposit<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    TotalNonTunai:=0;
    if Main.OpenDb then begin
      Main.M_Busy;
      StrQry:='EXEC GetLocationDetail  '+Chr(39)+LocationId+Chr(39)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QLocation.Caption:=Qry.FieldValues['location'];
        QAlamat.Caption:=Qry.FieldValues['address']+' '+' Telp.'+LeftStr(Qry.FieldValues['phone_no'],3)+'-'+RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-3);
      end;
      Qry.Close;
      IntFixedRateCut:=0;
      StrNonCash:='';
      StrQry:='EXEC GetSlipSetoran '+Chr(39)+Chr(39)+','+NoDeposit;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        SetReguler(IntReguler);
        QTanggalSPJ.Caption:=Qry.FieldValues['out_date'];
        QTanggal.Caption:=Qry.FieldValues['in_date'];
        QJam.Caption:=Qry.FieldValues['in_time'];
        QNoSlip.Caption:='SSM'+RightStr(NoDeposit,Length(NoDeposit)-3);;
        QNoPolisi.Caption:=Qry.FieldValues['license_plate'];
        QNoKPP.Caption:=Qry.FieldValues['employee_id'];
        QMitra.Caption:=Qry.FieldValues['name'];
        case FormNumber of
          1:begin
              QImageBlank2.SendToBack;
              QNoBody.Caption:=Qry.FieldValues['body_id'];
              QRit.Caption:=SToCurr(Qry.FieldValues['rits']);
              QDrop.Caption:=SToCurr(Qry.FieldValues['drops']);
              if Qry.FieldValues['rit_drop']<>NULL then QRitDrop.Caption:=SToCurr(Qry.FieldValues['rit_drop']);
              if Qry.FieldValues['vhc_gross_commission']<>NULL then begin
                if Qry.FieldValues['gross_argo']>=Qry.FieldValues['vhc_gross_commission'] then
                  QKomisiPersen.Caption:='35%' else QKomisiPersen.Caption:='25%';
              end else
                QKomisiPersen.Caption:='';
                QArgoKotor.Caption:=SToCurr(Qry.FieldValues['gross_argo']);
                QArgoBersih.Caption:=SToCurr(Qry.FieldValues['gross_argo']-(Qry.FieldValues['fuel_price']+Qry.FieldValues['gas_price']));
                QKomisi.Caption:=SToCurr(Qry.FieldValues['commission']);
                QLabelNoBody.Caption:='No Body';
            end;
          2:begin
              QImageExecutive.SendToBack;
              QImageReguler.SendToBack;
              QImageBlank.BringToFront;
              QImageBlank2.BringToFront;
              QNoBody.Caption:=Qry.FieldValues['license_plate'];
              QRit.Caption:='';
              QDrop.Caption:='';
              QRitDrop.Caption:='';
              QKomisiPersen.Caption:='';
              QArgoKotor.Caption:='';
              QArgoBersih.Caption:='';
              QKomisi.Caption:='';;
              QLabelNoBody.Caption:='No Polisi';
              QImageExecutive.SendToBack;
              QImageReguler.SendToBack;
            end;
        end;
        if Qry.FieldValues['fuel_price']<>NULL then QBBMRupiah.Caption:=SToCurr(Qry.FieldValues['fuel_price']) else QBBMRupiah.Caption:='';
        if Qry.FieldValues['fuel_litre']<>NULL then QBBMLiter.Caption:=Qry.FieldValues['fuel_litre'] else QBBMLiter.Caption:='';
        if Qry.FieldValues['gas_price']<>NULL then QGasRupiah.Caption:=SToCurr(Qry.FieldValues['gas_price']) else QGasRupiah.Caption:='';
        if Qry.FieldValues['gas_litre']<>NULL then QGasLiter.Caption:=SToCurr(Qry.FieldValues['gas_litre']) else QGasLiter.Caption:='';
        if Qry.FieldValues['cash_bbm']=1 then QBBMTunai.Caption:='BBM Tunai' else QBBMTunai.Caption:='';
        if QBBMLiter.Caption<>'' then begin
          BBM:=Qry.FieldValues['distance']/StrToFloat(QBBMLiter.Caption);
          QRatio.Caption:='R 1:'+FloatToStrF(BBM,ffNumber,6,2);
        end else begin
          QRatio.Caption:='';
        end;
        QDisetorkan.Caption:=SToCurr(Qry.FieldValues['cash_deposit']);
        if Qry.FieldValues['non_cash']<>NULL then StrNonCash:=Qry.FieldValues['non_cash'];
        if Qry.FieldValues['fixed_rate_cut']='1' then IntFixedRateCut:=1;
        TotalHarusSetor:=Qry.FieldValues['cash_deposit']+Qry.FieldValues['deposit_moreless'];
        if Qry.FieldValues['deposit_moreless']<0 then begin
          QKurangSetor.Caption:='0';
          QLebihSetor.Caption:=IToCurr(0-Qry.FieldValues['deposit_moreless']);
        end else begin
          QKurangSetor.Caption:=IToCurr(Qry.FieldValues['deposit_moreless']);
          QLebihSetor.Caption:='0';
        end;
        IntReguler:=Qry.FieldValues['reguler'];
        if (IntReguler=1) and (Qry.FieldValues['partner_income']<>NULL) then QPenghasilan.Caption:=IToCurr(Qry.FieldValues['partner_income'])
        else QPenghasilan.Caption:='';

        QTandaMitra.Caption:=UpperCase(Qry.FieldValues['name']);
        QTandaKasir.Caption:=UpperCase(User);
        if StrNonCash='' then begin
          if IntFixedRateCut=1 then begin
            StrQry:='SELECT SUM(b.value) AS amount FROM wh_vhc_trans_detail a '+
                    'LEFT JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                    'WHERE b.non_cash=1 AND a.vhc_trans_id='+QuotedStr(NoDeposit)+';';
          end else begin
            StrQry:='SELECT SUM(a.amount) AS amount FROM wh_vhc_trans_detail a '+
                    'LEFT JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id '+
                    'WHERE b.non_cash=1 AND a.vhc_trans_id='+QuotedStr(NoDeposit)+';';
          end;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['amount']<>NULL then begin
            TotalNonTunai:=Qry.FieldValues['amount'];
          end;
          Qry.Close;
        end else
          TotalNonTunai:=StrToInt(StrNonCash);
//        QTotalHarusSetor.Caption:=IToCurr(TotalHarusSetor+TotalNonTunai);
        QTotalHarusSetor.Caption:=IToCurr(TotalHarusSetor);
        StrTransType:='';
        StrQry:='EXEC GetTransactionType @TransName='+Chr(39)+'dummy'+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['transaction_type_id']<>NULL then begin
          StrTransType:=Qry.FieldValues['transaction_type_id'];
        end;
        Qry.Close;
        TotalVcr:=0;
        StrQry:='SELECT * FROM wh_vhc_trans_detail WHERE vhc_trans_id='+Chr(39)+NoDeposit+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then while not(Qry.Eof) do begin
          if Qry.FieldValues['transaction_type_id']=StrTransType then TotalVcr:=TotalVcr+StrToInt(ToString(Qry.FieldValues['amount']));
          Qry.Next;
        end;
        Qry.Close;
        QDummy.Caption:=IToCurr(TotalVcr);
        StrQry:='SELECT dbo.GetDebt('+Chr(39)+QNoKPP.Caption+Chr(39)+') AS total ;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']>=0 then QHutangMitra.Caption:=SToCurr(Qry.FieldValues['total'])
          else QHutangMitra.Caption:='('+SToCurr(0-Qry.FieldValues['total'])+')';
        end;
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',8) AS total;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['total']<>NULL then begin
          if Qry.FieldValues['total']>0 then QPinjamanKhusus.Caption:=SToCurr(Qry.FieldValues['total'])
          else QPinjamanKhusus.Caption:=SToCurr(Qry.FieldValues['total']);
        end else
          QPinjamanKhusus.Caption:='0';
        Qry.Close;
        StrQry:='SELECT amount AS insentif FROM wh_vhc_trans_detail '+
              ' WHERE transaction_type_id='+Chr(39)+'110403'+Chr(39)+' AND vhc_trans_id='+Chr(39)+NoDeposit+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['insentif']<>NULL then begin
          QInsentifBBM.Caption:=SToCurr(Qry.FieldValues['insentif']);
          QPengeluaranBBM.Caption:=IToCurr(StrToInt(ToString(QBBMRupiah.Caption))-(StrToInt(ToString(QInsentifBBM.Caption))));
          QBBMLiter.Caption:='';
        end else
          QJaminan.Caption:='';
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',3) AS total;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['total']<>NULL then begin
          if Qry.FieldValues['total']>0 then QHutangOnRisk.Caption:=SToCurr(Qry.FieldValues['total'])
          else QHutangOnRisk.Caption:=SToCurr(Qry.FieldValues['total']);
        end else
          QHutangOnRisk.Caption:='0';
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',7) AS total;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['total']<>NULL then begin
          if Qry.FieldValues['total']>0 then QTilang.Caption:=SToCurr(Qry.FieldValues['total'])
          else QTilang.Caption:=SToCurr(Qry.FieldValues['total']);
        end else
          QTilang.Caption:='0';
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',6) AS total;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['total']<>NULL then begin
          if Qry.FieldValues['total']>0 then QSeragam.Caption:=SToCurr(Qry.FieldValues['total'])
          else QSeragam.Caption:=SToCurr(Qry.FieldValues['total']);
        end else
          QSeragam.Caption:='0';
        Qry.Close;
        if IntReguler=0 then begin
          StrQry:='SELECT dbo.GetSaving('+Chr(39)+QNoKPP.Caption+Chr(39)+') AS total ;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            if Qry.FieldValues['total']<0 then QTabunganMitra.Caption:=IToCurr(0-StrToInt(Qry.FieldValues['total']))
            else QTabunganMitra.Caption:='0';
          end;
          Qry.Close;
          StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',4) AS total;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['total']<>NULL then begin
            if Qry.FieldValues['total']>0 then QLaka.Caption:=SToCurr(Qry.FieldValues['total'])
            else QLaka.Caption:=SToCurr(Qry.FieldValues['total']);
          end else
            QLaka.Caption:='0';
          Qry.Close;
          StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',5) AS total;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['total']<>NULL then begin
            QJaminan.Caption:=IToCurr(0-Qry.FieldValues['total']);
          end else
            QJaminan.Caption:='0';
          Qry.Close;
        end else begin
          StrQry:='SELECT dbo.GetSaving('+QuotedStr(QNoKPP.Caption)+')+dbo.GetTotalAmount('+QuotedStr(QNoKPP.Caption)+',4)+dbo.GetTotalAmount('+QuotedStr(QNoKPP.Caption)+',5)+dbo.GetTotalAmount('+QuotedStr(QNoKPP.Caption)+',9) AS total ;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['total']<>NULL then begin
            QLaka.Caption:=IToCurr(0-Qry.FieldValues['total']);
          end else
            QLaka.Caption:='0';
          Qry.Close;
          StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+QNoKPP.Caption+Chr(39)+',10) AS total ;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['total']<>NULL then begin
            QTabunganMitra.Caption:=IToCurr(0-Qry.FieldValues['total']);
          end else
            QTabunganMitra.Caption:='0';
          Qry.Close;
        end;
        RePrintForm.ReportName:='Slip Setoran';
        RePrintForm.ReportId:=NoDeposit;
        if (RePrintForm.ShowModal=1) then begin
          StrQry:='EXEC GetVhcTransDetail '+Chr(39)+NoDeposit+Chr(39)+',1;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Report.DataSet:=Qry;
          QNama.DataSet:=Qry;
          QRupiah1.DataSet:=Qry;
          QAmount.DataSet:=Qry;
          QMark.DataSet:=Qry;
          QNama2.DataSet:=Qry;
          QAmount2.DataSet:=Qry;
          QRupiah.DataSet:=Qry;
          QMark2.DataSet:=Qry;
          Report.Prepare;
          Main.M_Normal;
          Report.Preview;
        end;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TDepositForm.KMArgoIsiAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v29Akhir.SetFocus;
end;

procedure TDepositForm.KMArgoIsiAkhirEnter(Sender: TObject);
begin
  KMArgoIsiAkhir.Text:=ToString(KMArgoIsiAkhir.Text);
end;

procedure TDepositForm.KMArgoIsiAkhirExit(Sender: TObject);
begin
  if ToString(KMArgoIsiAkhir.Text)='' then KMArgoIsiAkhir.Text:='0';
  KMArgoIsiAkhir.Text:=SToCurr(ToString(KMArgoIsiAkhir.Text));
  if ((Trim(KMArgoIsiAwal.Text)<>'') AND (Trim(KMArgoIsiAkhir.Text)<>'')) then
    KMArgoIsiTotal.Text:=IToCurr(SToInt(KMArgoIsiAkhir.Text)-SToInt(KMArgoIsiAwal.Text));
  if StrToInt(ToString(KMArgoIsiTotal.Text))<0 then KMArgoIsiTotal.Font.Color:=clRed else KMArgoIsiTotal.Font.Color:=clBlack;
end;

procedure TDepositForm.BiayaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Trim(Biaya.Text)='') AND (Key=#13) then SPJBatalJalan.SetFocus;
end;

procedure TDepositForm.SPJBatalJalanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Keterangan.SetFocus;
end;

procedure TDepositForm.KeteranganKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Disetor.SetFocus;
end;

procedure TDepositForm.SPJBatalJalanClick(Sender: TObject);
var IntCount,IntCount2:Integer;
begin
  if SPJBatalJalan.Checked then begin
    RitAkhir.Text:=RitAwal.Text;
    RitTotal.Text:='0';
    DropAkhir.Text:=DropAwal.Text;
    KMArgoAkhir.Text:=KMArgoAwal.Text;
    KMArgoIsiAkhir.Text:=KMArgoIsiAwal.Text;
    KMOrdoAkhir.Text:=KMOrdoAwal.Text;
    v29Akhir.Text:=v29Awal.Text;
    v30Akhir.Text:=v30Awal.Text;
    v31Akhir.Text:=v31Awal.Text;
    v32Akhir.Text:=v32Awal.Text;
    v33Akhir.Text:=v33Awal.Text;
    v34Akhir.Text:=v34Awal.Text;
    BBMRupiah.Text:='0';
    GasRupiah.Text:='0';
    for IntCount:=1 to GridBiaya.RowCount-1 do
      for IntCount2:=0 to GridBiaya.ColCount-1 do
        GridBiaya.Cells[IntCount2,IntCount]:='';
    MinRowBiaya:=0;
  end else begin
    RitAkhir.Text:='';
    DropAkhir.Text:='';
    KMArgoAkhir.Text:='';
    KMArgoIsiAkhir.Text:='';
    KMOrdoAkhir.Text:='';
    v29Akhir.Text:='';
    v30Akhir.Text:='';
    v31Akhir.Text:='';
    v32Akhir.Text:='';
    v33Akhir.Text:='';
    v34Akhir.Text:='';
    BBMRupiah.Text:='';
    GasRupiah.Text:='';
    CheckData;
  end;
  Calculate;
  RitAkhir.SetFocus;
end;

procedure TDepositForm.BBMTunaiClick(Sender: TObject);
begin
  Calculate;
end;

procedure TDepositForm.GridSPJClick(Sender: TObject);
begin
  if (Driver.Text='') AND (Trim(GridSPJ.Cells[1,IntRow])<>'')  then begin
    Main.M_Busy;
    TransId:=GridSPJ.Cells[0,IntRow];
    NoBodi.ItemIndex:=NoBodi.Items.IndexOf(GridSPJ.Cells[1,IntRow]);
    Driver.ItemIndex:=Driver.Items.IndexOf(GridSPJ.Cells[2,IntRow]);
    CheckData;
    RitAkhir.SetFocus;
    Main.M_Normal;
  end;
end;

procedure TDepositForm.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Report.Left:=900;
  Init;
  RefreshCombo;
  Main.M_Normal;
end;

procedure TDepositForm.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then DepositForm.Close;
end;

procedure TDepositForm.GridSPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then DepositForm.Close;
end;

procedure TDepositForm.WaktuBaruKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(WaktuBaru.Text))>7)  then begin
    PanelWaktu.Enabled:=False;
    if GroupAkhir.Enabled=False then NoBodi.SetFocus else begin
      Calculate;
      RitAkhir.SetFocus;
    end;
  end;
  if Key=#27 then begin
    WaktuBaru.Text:='';
    PanelWaktu.Enabled:=False;
    if GroupAkhir.Enabled=False then NoBodi.SetFocus else RitAkhir.SetFocus;
  end;
end;

procedure TDepositForm.ApplicationEvntShortCut(var Msg: TWMKey;
  var Handled: Boolean);
var IsAuth:Boolean;
begin
  if Msg.CharCode=VK_F9 then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='14010101';
    AuthorizedForm.StrMessage:=' Otorisasi Perubahan Tanggal';
    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
    if IsAuth then begin
      PanelTanggal.Enabled:=True;
      if Trim(TanggalBaru.Text)='-  -' then TanggalBaru.Text:=StringReplace(Trim(Main.Status.Panels.Items[0].Text),'/','-',[rfReplaceAll]);
      TanggalBaru.SetFocus;
    end;
  end;
  if Msg.CharCode=VK_F10 then begin
    IsAuth:=True;
    AuthorizedForm.FormId:='14010102';
    AuthorizedForm.StrMessage:=' Otorisasi Perubahan Jam';
    if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
    if IsAuth then begin
      PanelWaktu.Enabled:=True;
//    Waktu.Text:=StringReplace(LeftStr(Trim(Main.Status.Panels.Items[1].Text),5),':','',[rfReplaceAll]);
      if Trim(WaktuBaru.Text)=':  :' then WaktuBaru.Text:=Trim(Main.Status.Panels.Items[1].Text);
      WaktuBaru.SetFocus;
    end;
  end;
end;

procedure TDepositForm.TanggalBaruKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (Length(Trim(TanggalBaru.Text))>9)  then begin
    PanelTanggal.Enabled:=False;
    if GroupAkhir.Enabled=False then NoBodi.SetFocus else begin
      Calculate;
      RitAkhir.SetFocus;
    end;
  end;
  if Key=#27 then begin
    TanggalBaru.Text:='';
    PanelTanggal.Enabled:=False;
    if GroupAkhir.Enabled=False then NoBodi.SetFocus else RitAkhir.SetFocus;
  end;
end;

procedure TDepositForm.v29AkhirEnter(Sender: TObject);
begin
  v29Akhir.Text:=ToString(v29Akhir.Text);
end;

procedure TDepositForm.v30AkhirEnter(Sender: TObject);
begin
  v30Akhir.Text:=ToString(v30Akhir.Text);
end;

procedure TDepositForm.v31AkhirEnter(Sender: TObject);
begin
  v31Akhir.Text:=ToString(v31Akhir.Text);
end;

procedure TDepositForm.v32AkhirEnter(Sender: TObject);
begin
  v32Akhir.Text:=ToString(v32Akhir.Text);
end;

procedure TDepositForm.v33AkhirEnter(Sender: TObject);
begin
  v33Akhir.Text:=ToString(v33Akhir.Text);
end;

procedure TDepositForm.v34AkhirEnter(Sender: TObject);
begin
  v34Akhir.Text:=ToString(v34Akhir.Text);
end;

procedure TDepositForm.v29AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v30Akhir.SetFocus;
end;

procedure TDepositForm.v30AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v31Akhir.SetFocus;
end;

procedure TDepositForm.v31AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v32Akhir.SetFocus;
end;

procedure TDepositForm.v32AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v33Akhir.SetFocus;
end;

procedure TDepositForm.v33AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then v34Akhir.SetFocus;
end;

procedure TDepositForm.v34AkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BBMRupiah.SetFocus;
end;

procedure TDepositForm.v29AkhirExit(Sender: TObject);
begin
  if ToString(v29Akhir.Text)='' then v29Akhir.Text:='0';
  v29Akhir.Text:=SToCurr(ToString(v29Akhir.Text));
  if ((Trim(v29Awal.Text)<>'') AND (Trim(v29Akhir.Text)<>'')) then begin
    v29Total.Text:=IToCurr(SToInt(v29Akhir.Text)-SToInt(v29Awal.Text));
    if StrToInt(ToString(v29Total.Text))<0 then begin
      v29Total.Font.Color:=clRed;
    end else begin
      v29Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.v30AkhirExit(Sender: TObject);
begin
  if ToString(v30Akhir.Text)='' then v30Akhir.Text:='0';
  v30Akhir.Text:=SToCurr(ToString(v30Akhir.Text));
  if ((Trim(v30Awal.Text)<>'') AND (Trim(v30Akhir.Text)<>'')) then begin
    v30Total.Text:=IToCurr(SToInt(v30Akhir.Text)-SToInt(v30Awal.Text));
    if StrToInt(ToString(v30Total.Text))<0 then begin
      v30Total.Font.Color:=clRed;
    end else begin
      v30Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.v31AkhirExit(Sender: TObject);
begin
  if ToString(v31Akhir.Text)='' then v31Akhir.Text:='0';
  v31Akhir.Text:=SToCurr(ToString(v31Akhir.Text));
  if ((Trim(v31Awal.Text)<>'') AND (Trim(v31Akhir.Text)<>'')) then begin
    v31Total.Text:=IToCurr(SToInt(v31Akhir.Text)-SToInt(v31Awal.Text));
    if StrToInt(ToString(v31Total.Text))<0 then begin
      v31Total.Font.Color:=clRed;
    end else begin
      v31Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.v32AkhirExit(Sender: TObject);
begin
  if ToString(v32Akhir.Text)='' then v32Akhir.Text:='0';
  v32Akhir.Text:=SToCurr(ToString(v32Akhir.Text));
  if ((Trim(v32Awal.Text)<>'') AND (Trim(v32Akhir.Text)<>'')) then begin
    v32Total.Text:=IToCurr(SToInt(v32Akhir.Text)-SToInt(v32Awal.Text));
    if StrToInt(ToString(v32Total.Text))<0 then begin
      v32Total.Font.Color:=clRed;
    end else begin
      v32Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.v33AkhirExit(Sender: TObject);
begin
  if ToString(v33Akhir.Text)='' then v33Akhir.Text:='0';
  v33Akhir.Text:=SToCurr(ToString(v33Akhir.Text));
  if ((Trim(v33Awal.Text)<>'') AND (Trim(v33Akhir.Text)<>'')) then begin
    v33Total.Text:=IToCurr(SToInt(v33Akhir.Text)-SToInt(v33Awal.Text));
    if StrToInt(ToString(v33Total.Text))<0 then begin
      v33Total.Font.Color:=clRed;
    end else begin
      v33Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

procedure TDepositForm.v34AkhirExit(Sender: TObject);
begin
  if ToString(v34Akhir.Text)='' then v34Akhir.Text:='0';
  v34Akhir.Text:=SToCurr(ToString(v34Akhir.Text));
  if ((Trim(v34Awal.Text)<>'') AND (Trim(v34Akhir.Text)<>'')) then begin
    v34Total.Text:=IToCurr(SToInt(v34Akhir.Text)-SToInt(v34Awal.Text));
    if StrToInt(ToString(v34Total.Text))<0 then begin
      v34Total.Font.Color:=clRed;
    end else begin
      v34Total.Font.Color:=clBlack;
      Calculate;
    end;
  end;
end;

end.
