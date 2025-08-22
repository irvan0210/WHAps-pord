unit DailyOrderFeeRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, ADODB, WHUnit,
  ZColorStringGrid, ExtCtrls, ppParameter, ppBands, ppCtrls, ppStrtch,
  ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  Menus,ClipBrd;

type
  TDailyOrderFeeRpt = class(TForm)
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Batch: TComboBox;
    Label3: TLabel;
    Refresh: TButton;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    TotalUnitOperasi: TEdit;
    StrGrid: TZColorStringGrid;
    Panel1: TPanel;
    GroupDisp: TEdit;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    Label6: TLabel;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    isAll: TComboBox;
    Label7: TLabel;
    ppReportReimburse: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppDriver: TppLabel;
    ppJenisUnit: TppLabel;
    ppNoSJ: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppLine4: TppLine;
    ppBudgetLiter: TppLabel;
    ppBudgetNominal: TppLabel;
    ppLabel35: TppLabel;
    ppSPBULiter: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSPBUNominal: TppLabel;
    ppReimburseLiter: TppLabel;
    ppReimburseNominal: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppTotalLiter: TppLabel;
    ppTotalNominal: TppLabel;
    ppKMKeluar: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppKMMasuk: TppLabel;
    ppLabel17: TppLabel;
    ppKMJalan: TppLabel;
    ppLine2: TppLine;
    ppRasio: TppLabel;
    ppLabel16: TppLabel;
    ppLabel20: TppLabel;
    ppRasioStandar: TppLabel;
    ppSelisihRatio: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    lbl1: TLabel;
    edtCari: TEdit;
    btnTombolCari: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    cbCancel: TCheckBox;
    CekTglMasuk: TCheckBox;
    CekBBM: TCheckBox;
    CekTglInput: TCheckBox;
    lbl2: TLabel;
    CustomerName: TEdit;
    Label9: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure edtCariKeyPress(Sender: TObject; var Key: Char);
    procedure edtCariChange(Sender: TObject);
    procedure btnTombolCariClick(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CekTglInputClick(Sender: TObject);
    procedure CekTglMasukClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,GroupArr:Array of TArrString2;
    CompanyArr:Array of TArrString5;
    OrderFeeArr:Array of TArrString97;
    MaxCol:Integer;
    IntRow,IntCol:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    procedure RePrintReimburse(Trans_Id:String);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  DailyOrderFeeRpt: TDailyOrderFeeRpt;

implementation

uses MainU, OrderFormU, VehicleFormU, OrderFeeU, AuthorizedFormU,
  SPJFormBusU, Math, BrowseCustomerU;

{$R *.dfm}

constructor TDailyOrderFeeRpt.Create(AOwner:TComponent);
begin
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TDailyOrderFeeRpt.Init;
var Count,Count2:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  MaxCol:=87;
  cbCancel.Checked:=False;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Batch.Items.Clear;
  Batch.ItemIndex:=0;
  Batch.Text:='';
  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=190505';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
       ToXCel.Enabled:=True;
    end else begin
      ToXCel.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TDailyOrderFeeRpt.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=3;

  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=95;
  StrGrid.ColWidths[2]:=90;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=55;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=85;
  StrGrid.ColWidths[8]:=85;
  StrGrid.ColWidths[9]:=45;

  StrGrid.ColWidths[10]:=50;
  StrGrid.ColWidths[11]:=70;
  StrGrid.ColWidths[12]:=50;
  StrGrid.ColWidths[13]:=70;
  StrGrid.ColWidths[14]:=50;
  StrGrid.ColWidths[15]:=70;

  StrGrid.ColWidths[16]:=60;
  StrGrid.ColWidths[17]:=80;

  StrGrid.ColWidths[18]:=60;
  StrGrid.ColWidths[19]:=60;
  StrGrid.ColWidths[20]:=60;
  StrGrid.ColWidths[21]:=60;
  StrGrid.ColWidths[22]:=60;
  StrGrid.ColWidths[23]:=60;
  StrGrid.ColWidths[24]:=60;
  StrGrid.ColWidths[25]:=60;

  StrGrid.ColWidths[26]:=60;   //Lain-lain

  StrGrid.ColWidths[27]:=60;

  StrGrid.ColWidths[28]:=90;
  StrGrid.ColWidths[29]:=95;
  StrGrid.ColWidths[30]:=80;
  StrGrid.ColWidths[31]:=50;

  StrGrid.ColWidths[32]:=80;
  StrGrid.ColWidths[33]:=50;
  StrGrid.ColWidths[34]:=50;
  StrGrid.ColWidths[35]:=60;
  StrGrid.ColWidths[36]:=50;
  StrGrid.ColWidths[37]:=50;
  StrGrid.ColWidths[38]:=120;
  StrGrid.ColWidths[39]:=200;
  StrGrid.ColWidths[40]:=255;
  StrGrid.ColWidths[41]:=100;
  StrGrid.ColWidths[42]:=120;
  StrGrid.ColWidths[43]:=110;


  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);

  StrGrid.MergeCells.AddRectXY(10,0,11,0);
  StrGrid.MergeCells.AddRectXY(12,0,13,0);
  StrGrid.MergeCells.AddRectXY(14,0,15,0);
  StrGrid.MergeCells.AddRectXY(16,0,17,0);

  StrGrid.MergeCells.AddRectXY(16,0,17,0);
  StrGrid.MergeCells.AddRectXY(18,0,19,0);
  StrGrid.MergeCells.AddRectXY(20,0,21,0);
  StrGrid.MergeCells.AddRectXY(22,0,23,0);
  StrGrid.MergeCells.AddRectXY(24,0,25,0);
  StrGrid.MergeCells.AddRectXY(26,0,26,1);
  StrGrid.MergeCells.AddRectXY(27,0,27,1);
  StrGrid.MergeCells.AddRectXY(28,0,28,1);

  StrGrid.MergeCells.AddRectXY(62,0,74,0);
  StrGrid.MergeCells.AddRectXY(75,0,77,0);
  StrGrid.MergeCells.AddRectXY(78,0,80,0);

  StrGrid.MergeCells.AddRectXY(81,0,81,1);
  StrGrid.MergeCells.AddRectXY(82,0,82,1);

  StrGrid.MergeCells.AddRectXY(83,0,86,0);
  StrGrid.MergeCells.AddRectXY(87,0,87,1);

  //StrGrid.MergeCells.AddRectXY(11,0,11,1);
  IntGeserKolom:=6;
  StrGrid.MergeCells.AddRectXY(16+IntGeserKolom-4,0,16+IntGeserKolom-4,1);
  StrGrid.MergeCells.AddRectXY(17+IntGeserKolom-4,0,17+IntGeserKolom-4,1);
  StrGrid.MergeCells.AddRectXY(18+IntGeserKolom-4,0,18+IntGeserKolom-4,1);
  StrGrid.MergeCells.AddRectXY(19+IntGeserKolom-4,0,19+IntGeserKolom-4,1);
  StrGrid.MergeCells.AddRectXY(20+IntGeserKolom-4,0,20+IntGeserKolom-4,1);
  StrGrid.MergeCells.AddRectXY(21+IntGeserKolom-4,0,21+IntGeserKolom-4,1);

  StrGrid.MergeCells.AddRectXY(22+IntGeserKolom,0,22+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(23+IntGeserKolom,0,23+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(24+IntGeserKolom,0,24+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(25+IntGeserKolom,0,25+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(26+IntGeserKolom,0,26+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(27+IntGeserKolom,0,27+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(28+IntGeserKolom,0,28+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(29+IntGeserKolom,0,29+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(30+IntGeserKolom,0,30+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(31+IntGeserKolom,0,31+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(32+IntGeserKolom,0,32+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(33+IntGeserKolom,0,33+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(34+IntGeserKolom,0,34+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(35+IntGeserKolom,0,35+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(36+IntGeserKolom,0,36+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(37+IntGeserKolom,0,37+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(38+IntGeserKolom,0,39+IntGeserKolom,0);
  StrGrid.MergeCells.AddRectXY(40+IntGeserKolom,0,40+IntGeserKolom,1);

  StrGrid.MergeCells.AddRectXY(41+IntGeserKolom,0,41+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(42+IntGeserKolom,0,42+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(43+IntGeserKolom,0,43+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(44+IntGeserKolom,0,44+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(45+IntGeserKolom,0,45+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(46+IntGeserKolom,0,46+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(47+IntGeserKolom,0,47+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(48+IntGeserKolom,0,48+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(49+IntGeserKolom,0,49+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(50+IntGeserKolom,0,50+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(51+IntGeserKolom,0,51+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(52+IntGeserKolom,0,52+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(53+IntGeserKolom,0,53+IntGeserKolom,1);
  StrGrid.MergeCells.AddRectXY(60,0,60,1);
  StrGrid.MergeCells.AddRectXY(61,0,61,1);
  StrGrid.CellStyle[28,0].WordWrap:=True;       {(Inc Tol&Lain2)}
  StrGrid.CellStyle[29,0].WordWrap:=True;       {(Exc Tol&Lain2)}

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Resv';
  StrGrid.Cells[2,0]:='No SJ';
  StrGrid.Cells[3,0]:='Customer';
  StrGrid.Cells[4,0]:='Rute';
  StrGrid.Cells[5,0]:='No Body';
  StrGrid.Cells[6,0]:='No Polisi';
  StrGrid.Cells[7,0]:='Driver';
  StrGrid.Cells[8,0]:='BusBoy';
  StrGrid.Cells[9,0]:='Standby';

  StrGrid.Cells[10,0]:='BBM Budget';
  StrGrid.Cells[10,1]:='BBM(Ltr)';
  StrGrid.Cells[11,1]:='BBM(Rp)';
  StrGrid.Cells[12,0]:='BBM SPBU';
  StrGrid.Cells[12,1]:='BBM(Ltr)';
  StrGrid.Cells[13,1]:='BBM(Rp)';
  StrGrid.Cells[14,0]:='BBM Reimburse';
  StrGrid.Cells[14,1]:='BBM(Ltr)';
  StrGrid.Cells[15,1]:='BBM(Rp)';
  StrGrid.Cells[16,0]:='Total BBM';
  StrGrid.Cells[16,1]:='Liter';
  StrGrid.Cells[17,1]:='(Rp)';
  {Geser 4 kolom}
  StrGrid.Cells[18,0]:='Fee Driver';
  StrGrid.Cells[18,1]:='Budget';
  StrGrid.Cells[19,1]:='Reimburse';

  StrGrid.Cells[20,0]:='Fee Kenek';
  StrGrid.Cells[20,1]:='Budget';
  StrGrid.Cells[21,1]:='Reimburse';


  StrGrid.Cells[22,0]:='Parkir';
  StrGrid.Cells[22,1]:='Budget';
  StrGrid.Cells[23,1]:='Reimburse';

  StrGrid.Cells[24,0]:='Toll';
  StrGrid.Cells[24,1]:='Budget';
  StrGrid.Cells[25,1]:='Reimburse';


  StrGrid.Cells[26,0]:='Lain2';//No E-Toll   Asal 22
  StrGrid.Cells[27,0]:='Overtime';//No E-Toll
  StrGrid.Cells[28,0]:='Total';//Asal 27
  StrGrid.Cells[29,0]:='Total          (Exc BBM SPBU)';
  StrGrid.Cells[30,0]:='Tgl Klr';
  StrGrid.Cells[31,0]:='Jam Klr';
  StrGrid.Cells[32,0]:='Tgl Msk';
  StrGrid.Cells[33,0]:='Jam Msk';
  StrGrid.Cells[34,0]:='KM Klr';
  StrGrid.Cells[35,0]:='KM Msk';
  StrGrid.Cells[36,0]:='Msk-Klr';
  StrGrid.Cells[37,0]:='R BBM';
  StrGrid.Cells[38,0]:='User Update';
  StrGrid.Cells[39,0]:='Keterangan';
  StrGrid.Cells[40,0]:='No E-Toll';
  StrGrid.Cells[41,0]:='No Rek Driver';
  StrGrid.Cells[42,0]:='Nama di Rek';
  StrGrid.Cells[43,0]:='Keberangkatan';

  StrGrid.Cells[44,0]:='Armada';
  StrGrid.Cells[44,1]:='Jenis';
  StrGrid.Cells[45,1]:='Seat';
  StrGrid.Cells[46,0]:='Jam Selesai Tamu';

  StrGrid.Cells[47,0]:='Tgl Topup';
  StrGrid.Cells[48,0]:='Jam Topup';
  StrGrid.Cells[49,0]:='No E-Toll';
  StrGrid.Cells[50,0]:='No SJ';
  StrGrid.Cells[51,0]:='Topup';
  StrGrid.Cells[52,0]:='Budget E-Toll';
  StrGrid.Cells[53,0]:='Selisih';
  StrGrid.Cells[54,0]:='Status SJ';
  StrGrid.Cells[55,0]:='Jenis Service';
  StrGrid.Cells[56,0]:='Keterangan SJ';
  StrGrid.Cells[57,0]:='KM Estimasi';
  StrGrid.Cells[58,0]:='R BBM Estimasi';
  StrGrid.Cells[59,0]:='SPBU';
  StrGrid.Cells[60,0]:='Tanggal Transfer';
  StrGrid.Cells[61,0]:='Trans ID';

  StrGrid.Cells[62,0]:='Driver 1';
  StrGrid.Cells[62,1]:='No Rekening';
  StrGrid.Cells[63,1]:='Nama';
  StrGrid.Cells[64,1]:='Budget BBM';
  StrGrid.Cells[65,1]:='Fee Order';
  StrGrid.Cells[66,1]:='Parkir';
  StrGrid.Cells[67,1]:='Parkir Tamu';
  StrGrid.Cells[68,1]:='Toll';
  StrGrid.Cells[69,1]:='Toll Tamu';
  StrGrid.Cells[70,1]:='Bermalam';
  StrGrid.Cells[71,1]:='Tips';
  StrGrid.Cells[72,1]:='Biaya Dari Tamu';
  StrGrid.Cells[73,1]:='Overtime';
  StrGrid.Cells[74,1]:='Total Driver 1';

  StrGrid.Cells[75,0]:='Driver 2';
  StrGrid.Cells[75,1]:='No Rekening';
  StrGrid.Cells[76,1]:='Nama';
  StrGrid.Cells[77,1]:='Fee Order';

  StrGrid.Cells[78,0]:='Helper';
  StrGrid.Cells[78,1]:='No Rekening';
  StrGrid.Cells[79,1]:='Nama';
  StrGrid.Cells[80,1]:='Fee Order';

  StrGrid.Cells[81,0]:='Total';
  StrGrid.Cells[82,0]:='Selisih';

  StrGrid.Cells[83,0]:='Check Crew';
  StrGrid.Cells[83,1]:='Driver 1';
  StrGrid.Cells[84,1]:='Driver 2';
  StrGrid.Cells[85,1]:='Helper';
  StrGrid.Cells[86,1]:='Catatan';
  StrGrid.Cells[87,0]:='Reprint Terakhir';


  StrGrid.ColWidths[44]:=120;
  StrGrid.ColWidths[45]:=35;
  StrGrid.ColWidths[46]:=55;

  StrGrid.ColWidths[47]:=65;
  StrGrid.ColWidths[48]:=60;
  StrGrid.ColWidths[49]:=0;
  StrGrid.ColWidths[50]:=0;
  StrGrid.ColWidths[51]:=60;
  StrGrid.ColWidths[52]:=60;
  StrGrid.ColWidths[53]:=60;
  StrGrid.ColWidths[54]:=80;
  StrGrid.ColWidths[55]:=120;
  StrGrid.ColWidths[59]:=300;
  StrGrid.ColWidths[60]:=82;
  StrGrid.ColWidths[61]:=90;

  StrGrid.ColWidths[62]:=100;
  StrGrid.ColWidths[63]:=130;
  StrGrid.ColWidths[64]:=80;
  StrGrid.ColWidths[65]:=60;
  StrGrid.ColWidths[66]:=60;

  StrGrid.ColWidths[67]:=80;
  StrGrid.ColWidths[68]:=60;
  StrGrid.ColWidths[69]:=80;
  StrGrid.ColWidths[70]:=60;
  StrGrid.ColWidths[71]:=60;

  StrGrid.ColWidths[72]:=100;
  StrGrid.ColWidths[73]:=60;
  StrGrid.ColWidths[74]:=100;
  StrGrid.ColWidths[75]:=100;
  StrGrid.ColWidths[76]:=130;
  StrGrid.ColWidths[77]:=60;
  StrGrid.ColWidths[78]:=100;
  StrGrid.ColWidths[79]:=130;
  StrGrid.ColWidths[80]:=60;
  StrGrid.ColWidths[81]:=100;
  StrGrid.ColWidths[82]:=100;
  StrGrid.ColWidths[83]:=50;
  StrGrid.ColWidths[84]:=50;
  StrGrid.ColWidths[85]:=50;
  StrGrid.ColWidths[86]:=400;
  StrGrid.ColWidths[87]:=500;


  for IntCount:=0 to MaxCol do begin
    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[IntCount,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,1].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,2]:='';
  end;
end;


procedure TDailyOrderFeeRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if main.OpenDb then begin
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
  StrQry:='EXEC GetGroup 2';
  Qry.SQL.Clear;
  Qry.SQL.Add(StrQry);
  Qry.Open;
  SetLength(GroupArr,Qry.RecordCount+1);
  GroupArr[0][0]:='All';
  GroupArr[0][1]:='All';
  IntCount:=1;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
    GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
    GroupArr[IntCount][1]:=Qry.FieldValues['name'];
    Inc(IntCount);
    Qry.Next;
  end;
  Qry.Close;
  end;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(GroupArr)-1 do
    Batch.Items.Add(GroupArr[IntCount][0]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TDailyOrderFeeRpt.RefreshGrid;
var
    IntCount,IntCount2,IntCount3:Integer;
    Count,Count2,Count3,Total1,Total2,Total3,Total4,Total5,Total6,Total7,TotalOperasi,IntDiscount:Integer;
    BBMRp,GasRp:Integer;
    BBMLiter,GasLiter:Single;
    BBMLiterSingle:Single;

    BBMRp_Budget,BBMRp_SPBU,BBMRp_Reimburse:Integer;
    BBMLiter_Budget,BBMLiter_SPBU,BBMLiter_Reimburse:Single;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All,TotalFeeDriver,TotalFeeBusBoy,TotalTolParkir,TotalTol,
    TotalLain,TotalOvertime,TotalBiaya,TotalBiayaExc,IntBiaya, TotalTopupBudget, TotalETollBudget, TotalSelisih,
    TotalBBMBudget,TotalFeeDriver1,TotalFeeDriver2,TotalBusboy,TotalParkir,TotalParkirTamu,TotalTol2,TotalTolTamu,TotalTips,TotalBiayaDariTamu,TotalLain2,
    TotalTotalDriver1,TotalTotalDriver1_Driver2_Helper,TotalSelisih2:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse,IntBiayaReimburse,TotalDriver1,TotalDriver1_Driver2_Helper,Selisih :Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;

begin

  for Count:=0 to MaxCol do begin
    for Count2:=2 to StrGrid.RowCount do begin    // reset baris ke 3
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
    end;
  end;

  TotalBBMBudget :=0;
  TotalFeeDriver1 :=0;
  TotalFeeDriver2 :=0;
  TotalBusboy :=0;
  TotalParkir :=0;
  TotalParkirTamu := 0;
  TotalTol2 :=0;
  TotalTolTamu := 0;
  TotalLain2 :=0;
  TotalTips := 0;
  TotalBiayaDariTamu := 0;
  TotalTotalDriver1 :=0;
  TotalTotalDriver1_Driver2_Helper :=0;
  TotalSelisih2 :=0;

  if Length(OrderFeeArr)>0 then StrGrid.RowCount:=Length(OrderFeeArr)+1
  else begin
    StrGrid.RowCount:=3;
  end;

  TotalOperasi:=0;
  Count:=2;
  for IntCount:=0 to Length(OrderFeeArr)-1 do begin

//  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    for Count2:=0 to MaxCol do begin
      StrGrid.Cells[Count2,Count]:='';
      StrGrid.CellStyle[Count2,Count].HorizontalAlignment:=taLeftJustify;
    end;
    IntDiscount:=0;
    IntBiaya:=0;
    IntBiayaReimburse:=0;

    StrGrid.Cells[0,Count]:=IntToStr(Count-1);
    StrGrid.Cells[1,Count]:=OrderFeeArr[IntCount][0];
    StrGrid.Cells[2,Count]:=OrderFeeArr[IntCount][1];
    StrGrid.Cells[3,Count]:=OrderFeeArr[IntCount][2];
    StrGrid.Cells[4,Count]:=OrderFeeArr[IntCount][3];
    StrGrid.Cells[5,Count]:=OrderFeeArr[IntCount][4];


    if (OrderFeeArr[IntCount][44]<>NULL) or (OrderFeeArr[IntCount][44]<>'') then begin  {employee_id}
      Inc(TotalOperasi);
      StrGrid.Cells[6,Count]:=OrderFeeArr[IntCount][5];
      StrGrid.Cells[7,Count]:=OrderFeeArr[IntCount][6];
      StrGrid.Cells[8,Count]:=OrderFeeArr[IntCount][7];
      StrGrid.Cells[9,Count]:=OrderFeeArr[IntCount][8];
      //Budget
      if OrderFeeArr[IntCount][9]<>'0' then begin
        BBMLiter_Budget       :=StrToFloat(OrderFeeArr[IntCount][9]);
        BBMLiterSingle_Budget :=StrToFloat(OrderFeeArr[IntCount][9]);
      end else begin
        BBMLiter_Budget:=0; BBMLiterSingle_Budget:=0;
        OrderFeeArr[IntCount][9]:='0';
      end;


      if OrderFeeArr[IntCount][10]<>'0' then begin
        BBMRp_Budget:=StrToInt(OrderFeeArr[IntCount][10]);
      end else begin
         BBMRp_Budget:=0;
      end;
      //SPBU
      if OrderFeeArr[IntCount][11]<>'0' then begin//StoInt(OrderFeeArr[IntCount][11])<>NULL then begin
        BBMLiter_SPBU       :=StrToFloat(OrderFeeArr[IntCount][11]);
        BBMLiterSingle_SPBU :=StrToFloat(OrderFeeArr[IntCount][11]);
      end else begin
        BBMLiter_SPBU:=0; BBMLiterSingle_SPBU:=0;
      end;
      if OrderFeeArr[IntCount][12]<>'0' then begin
        BBMRp_SPBU:=SToInt(OrderFeeArr[IntCount][12]);
      end else begin
        BBMRp_SPBU:=0;
      end;
      //Reimburse
      if OrderFeeArr[IntCount][13]<>'0' then begin
        BBMLiter_Reimburse       :=StrToFloat(OrderFeeArr[IntCount][13]);
        BBMLiterSingle_Reimburse :=StrToFloat(OrderFeeArr[IntCount][13]);
      end else begin
        BBMLiter_Reimburse:=0; BBMLiterSingle_Reimburse:=0;
      end;
      if OrderFeeArr[IntCount][14]<>'0' then begin
        BBMRp_Reimburse:=SToInt(OrderFeeArr[IntCount][14]);
      end else begin
        BBMRp_Reimburse:=0;
      end;

      BBMLiter:=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
      BBMLiterSingle:=BBMLiterSingle_Budget+BBMLiterSingle_SPBU+BBMLiterSingle_Reimburse;
      BBMRp:=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;

      TotalBBMRp_Budget:=TotalBBMRp_Budget+BBMRp_Budget;
      TotalBBMLiter_Budget:=TotalBBMLiter_Budget+BBMLiter_Budget;
      TotalBBMRp_SPBU:=TotalBBMRp_SPBU+BBMRp_SPBU;
      TotalBBMLiter_SPBU:=TotalBBMLiter_SPBU+BBMLiter_SPBU;
      TotalBBMRp_Reimburse:=TotalBBMRp_Reimburse+BBMRp_Reimburse;
      TotalBBMLiter_Reimburse:=TotalBBMLiter_Reimburse+BBMLiter_Reimburse;

      TotalBBMRp    :=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;
      TotalBBMRp_All:=TotalBBMRp_All+TotalBBMRp;

      TotalBBMLiter :=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
      TotalBBMLiter_All :=TotalBBMLiter_All+TotalBBMLiter;

      TotalFeeDriver:=TotalFeeDriver+(StrToint(OrderFeeArr[IntCount][16])*StoInt(OrderFeeArr[IntCount][15]));
      TotalFeeBusBoy:=TotalFeeBusBoy+(SToInt(OrderFeeArr[IntCount][17])*StoInt(OrderFeeArr[IntCount][15]));
      TotalTolParkir:=TotalTolParkir+StoInt(OrderFeeArr[IntCount][18])+ StoInt(OrderFeeArr[IntCount][78]);
      TotalTol:=TotalTol+StoInt(OrderFeeArr[IntCount][19])+ StoInt(OrderFeeArr[IntCount][79]);

      TotalFeeDriverReimburse:=TotalFeeDriverReimburse+(StoInt(OrderFeeArr[IntCount][20])); //*StoInt(OrderFeeArr[IntCount][15])
      TotalFeeBusBoyReimburse:=TotalFeeBusBoyReimburse+(StoInt(OrderFeeArr[IntCount][21])); //*StoInt(OrderFeeArr[IntCount][15])
      TotalTolParkirReimburse:=TotalTolParkirReimburse+StoInt(OrderFeeArr[IntCount][22]);
      TotalTolReimburse:=TotalTolReimburse+StoInt(OrderFeeArr[IntCount][23]);

      TotalLain:=TotalLain+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81]);
      TotalOvertime:=TotalOvertime+StoInt(OrderFeeArr[IntCount][25]);

      IntBiaya:=BBMRp+(StoInt(OrderFeeArr[IntCount][16])*StoInt(OrderFeeArr[IntCount][15]))+(StoInt(OrderFeeArr[IntCount][17])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][18])+StoInt(OrderFeeArr[IntCount][78]);
      IntBiayaReimburse:=(StoInt(OrderFeeArr[IntCount][20])) + (StoInt(OrderFeeArr[IntCount][21])) + //*StoInt(OrderFeeArr[IntCount][15])
                         StoInt(OrderFeeArr[IntCount][22]) + StoInt(OrderFeeArr[IntCount][23]);
      TotalBiaya:=TotalBiaya+IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][25])
                  +StoInt(OrderFeeArr[IntCount][79])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81]);

      TotalBiayaExc:=TotalBiayaExc+IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])
                      +StoInt(OrderFeeArr[IntCount][79])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81])-BBMRp_SPBU+StoInt(OrderFeeArr[IntCount][25]);

      TotalTopupBudget := TotalTopupBudget+StoInt(OrderFeeArr[IntCount][50]);
      TotalETollBudget := TotalETollBudget+StoInt(OrderFeeArr[IntCount][51]);
      TotalSelisih := TotalSelisih+(StoInt(OrderFeeArr[IntCount][51])-StoInt(OrderFeeArr[IntCount][50]));

//      StrGrid.CellStyle[9,Count].HorizontalAlignment:=taCenter;
//      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[11,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[12,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[13,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[14,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[15,Count].HorizontalAlignment:=taRightJustify;
      {geser 4 kolom}
//      StrGrid.CellStyle[16,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[17,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[18,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[19,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[20,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[21,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[22,Count].WordWrap:=True;
//      StrGrid.CellStyle[22,Count].HorizontalAlignment:=taRightJustify;
//
//      StrGrid.CellStyle[23,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[24,Count].WordWrap:=True;
//      StrGrid.CellStyle[24,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[25,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[26,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[27,Count].HorizontalAlignment:=taRightJustify;
//
//      StrGrid.CellStyle[28,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[29,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[30,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[31,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[32,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[33,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[34,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[41,Count].HorizontalAlignment:=taCenter;
//
//      StrGrid.CellStyle[47,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[48,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[49,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[50,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[51,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[52,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[53,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[54,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[57,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[58,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[60,Count].HorizontalAlignment:=taLeftJustify;
//      StrGrid.CellStyle[61,Count].HorizontalAlignment:=taLeftJustify;

//      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[11,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[12,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[13,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[14,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[15,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[16,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[17,Count].HorizontalAlignment:=taRightJustify;
      {Geser 6 kolom}
//      StrGrid.CellStyle[18,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[19,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[20,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[21,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[22,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[23,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[24,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[25,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[26,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[27,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[28,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[29,Count].HorizontalAlignment:=taRightJustify;
//
//      StrGrid.CellStyle[39,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[57,Count].HorizontalAlignment:=taRightJustify;


//      StrGrid.CellStyle[64,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[65,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[66,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[67,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[68,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[69,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[70,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[73,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[76,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[77,Count].HorizontalAlignment:=taRightJustify;
//      StrGrid.CellStyle[78,Count].HorizontalAlignment:=taRightJustify;


      if (BBMLiterSingle_Budget=0) then StrGrid.Cells[10,Count]:= '0'
      else StrGrid.Cells[10,Count]:=SToCurr(FloatToStr(BBMLiterSingle_Budget),2);
      StrGrid.Cells[11,Count]:=IToCurr(BBMRp_Budget);
      if (BBMLiterSingle_SPBU=0) then StrGrid.Cells[12,Count]:= '0'
      else StrGrid.Cells[12,Count]:=SToCurr(FloatToStr(BBMLiterSingle_SPBU),2);
      StrGrid.Cells[13,Count]:=IToCurr(BBMRp_SPBU);
      if (BBMLiterSingle_Reimburse=0) then StrGrid.Cells[14,Count]:= '0'
      else StrGrid.Cells[14,Count]:=SToCurr(FloatToStr(BBMLiterSingle_Reimburse),2);
      StrGrid.Cells[15,Count]:=IToCurr(BBMRp_Reimburse);

      if (BBMLiterSingle=0) then StrGrid.Cells[16,Count]:= '0'
      else StrGrid.Cells[16,Count]:=SToCurr(FloatToStr(BBMLiterSingle),2);
      StrGrid.Cells[17,Count]:=IToCurr(BBMRp);

      {Geser 6 kolom}
      StrGrid.Cells[18,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][16])*StoInt(OrderFeeArr[IntCount][15]));
      StrGrid.Cells[19,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][20]));//*StoInt(OrderFeeArr[IntCount][15])

      StrGrid.Cells[20,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][17])*StoInt(OrderFeeArr[IntCount][15]));
      StrGrid.Cells[21,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][21]));//*StoInt(OrderFeeArr[IntCount][15])

      StrGrid.Cells[22,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][18])+StoInt(OrderFeeArr[IntCount][78]));
      StrGrid.Cells[23,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][22]));

      StrGrid.Cells[24,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][79]));
      StrGrid.Cells[25,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][23]));

      //if OrderFeeArr[IntCount][37]<>NULL then StrGrid.Cells[16,Count]:='';//eToll(OrderFeeArr[IntCount][37]);
      StrGrid.Cells[26,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81]));
      StrGrid.Cells[27,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][25]));
      StrGrid.Cells[28,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][25])
                                +StoInt(OrderFeeArr[IntCount][79])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81]));
      StrGrid.Cells[29,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])
                                +StoInt(OrderFeeArr[IntCount][79])+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81])-BBMRp_SPBU+StoInt(OrderFeeArr[IntCount][25]));
      StrGrid.Cells[30,Count]:=OrderFeeArr[IntCount][26];

      if (OrderFeeArr[IntCount][55]='') or (OrderFeeArr[IntCount][55]='0') then begin
        StrGrid.Cells[57,Count]:='0';
        StrGrid.Cells[58,Count]:='0';
      end else begin
        //StrGrid.Cells[58,Count]:=FloatToStrF(StoInt(OrderFeeArr[IntCount][55])/TotalBBMLiter,ffNumber,6,2);
        StrGrid.Cells[57,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][55]));
      end;
      StrGrid.Cells[59,Count]:=OrderFeeArr[IntCount][56];
      StrGrid.Cells[60,Count]:=OrderFeeArr[IntCount][57];
      StrGrid.Cells[61,Count]:=OrderFeeArr[IntCount][58];

      StrGrid.Cells[62,Count]:=OrderFeeArr[IntCount][68];
      StrGrid.Cells[63,Count]:=OrderFeeArr[IntCount][65];
      TotalBBMBudget:=TotalBBMBudget+BBMRp_Budget+BBMRp_Reimburse ;
      StrGrid.Cells[64,Count]:=IToCurr(BBMRp_Budget+BBMRp_Reimburse);
      TotalFeeDriver1:=TotalFeeDriver1+((StoInt(OrderFeeArr[IntCount][59])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][75]));
      StrGrid.Cells[65,Count]:=IToCurr((StoInt(OrderFeeArr[IntCount][59])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][75]));
      TotalParkir:= TotalParkir+(StoInt(OrderFeeArr[IntCount][18])+StoInt(OrderFeeArr[IntCount][22]));
      StrGrid.Cells[66,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][18])+StoInt(OrderFeeArr[IntCount][22]));
      TotalTol2:= TotalTol2+(StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][23]));
      StrGrid.Cells[67,Count]:= IToCurr(StoInt(OrderFeeArr[IntCount][78]));      //Parkir Tamu
      TotalParkirTamu := TotalParkirTamu+(StoInt(OrderFeeArr[IntCount][78]));  //Total
      StrGrid.Cells[68,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][23]));
      StrGrid.Cells[69,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][79]));      //Tol Tamu
      TotalTolTamu := TotalTolTamu +(StoInt(OrderFeeArr[IntCount][79]));
      //StrGrid.Cells[70,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][25]));
      TotalLain2:= TotalLain2+(StoInt(OrderFeeArr[IntCount][24]));//+StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81]));
      StrGrid.Cells[70,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][24]));  //bermalam
      TotalTips := TotalTips+ (StoInt(OrderFeeArr[IntCount][80]));
      StrGrid.Cells[71,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][80])); //Tips
      TotalBiayaDariTamu := TotalBiayaDariTamu+(StoInt(OrderFeeArr[IntCount][81]));
      StrGrid.Cells[72,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][81])); //Biaya Dari Tamu
      TotalOvertime:=TotalOvertime+(StoInt(OrderFeeArr[IntCount][25]));
      StrGrid.Cells[73,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][25]));

      TotalDriver1:=BBMRp_Budget+BBMRp_Reimburse+((StoInt(OrderFeeArr[IntCount][59])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][75]))
                                  + (StoInt(OrderFeeArr[IntCount][18])+StoInt(OrderFeeArr[IntCount][22]))
                                  + (StoInt(OrderFeeArr[IntCount][19])+StoInt(OrderFeeArr[IntCount][23]))
                                  +  (StoInt(OrderFeeArr[IntCount][24])) + (StoInt(OrderFeeArr[IntCount][25]))
                                  + (StoInt(OrderFeeArr[IntCount][78])) + (StoInt(OrderFeeArr[IntCount][79]))
                                  + (StoInt(OrderFeeArr[IntCount][80])) + (StoInt(OrderFeeArr[IntCount][81]));
      TotalTotalDriver1:=TotalTotalDriver1+ TotalDriver1;
      StrGrid.Cells[74,Count]:=IToCurr(TotalDriver1);

      StrGrid.Cells[75,Count]:=OrderFeeArr[IntCount][69];
      StrGrid.Cells[76,Count]:=OrderFeeArr[IntCount][66];
      TotalFeeDriver2:=TotalFeeDriver2+((StoInt(OrderFeeArr[IntCount][60])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][76]));
      StrGrid.Cells[77,Count]:=IToCurr((StoInt(OrderFeeArr[IntCount][60])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][76]));


      StrGrid.Cells[78,Count]:=OrderFeeArr[IntCount][70];
      StrGrid.Cells[79,Count]:=OrderFeeArr[IntCount][67];
      TotalBusboy:=TotalBusboy+((StoInt(OrderFeeArr[IntCount][61])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][21]));
      StrGrid.Cells[80,Count]:=IToCurr((StoInt(OrderFeeArr[IntCount][61])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][21]));

      TotalDriver1_Driver2_Helper:= (((StoInt(OrderFeeArr[IntCount][61])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][21]))+((StoInt(OrderFeeArr[IntCount][60])*StoInt(OrderFeeArr[IntCount][15]))+StoInt(OrderFeeArr[IntCount][76]))
                                    +TotalDriver1);
      TotalTotalDriver1_Driver2_Helper:=TotalTotalDriver1_Driver2_Helper+TotalDriver1_Driver2_Helper;
      StrGrid.Cells[81,Count]:= IToCurr(TotalDriver1_Driver2_Helper);
      TotalSelisih2:=TotalSelisih2+((IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])
                    +StoInt(OrderFeeArr[IntCount][79])
                    +StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81])
                    -BBMRp_SPBU+StoInt(OrderFeeArr[IntCount][25]))-(TotalDriver1_Driver2_Helper));
      StrGrid.Cells[82,Count]:= IToCurr((IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[IntCount][24])+StoInt(OrderFeeArr[IntCount][19])
                                +StoInt(OrderFeeArr[IntCount][79])
                                +StoInt(OrderFeeArr[IntCount][80])+StoInt(OrderFeeArr[IntCount][81])
                                -BBMRp_SPBU+StoInt(OrderFeeArr[IntCount][25]))-(TotalDriver1_Driver2_Helper));

      StrGrid.Cells[83,Count]:= OrderFeeArr[IntCount][71];
      StrGrid.Cells[84,Count]:= OrderFeeArr[IntCount][72];
      StrGrid.Cells[85,Count]:= OrderFeeArr[IntCount][73];
      StrGrid.Cells[86,Count]:= OrderFeeArr[IntCount][74];
      StrGrid.Cells[87,Count]:= OrderFeeArr[IntCount][77];

//      if (OrderFeeArr[IntCount][57]<>'') AND (OrderFeeArr[IntCount][57]<>NULL) then begin
//        StrGrid.CellStyle[2,Count].Font.Color:=clGreen;
//      end else begin
//        StrGrid.CellStyle[2,Count].Font.Color:=clBlack;
//      end;

      if OrderFeeArr[IntCount][27]<>'' then begin
        StrGrid.CellStyle[30,Count].Font.Color:=clBlue;
        StrGrid.CellStyle[31,Count].Font.Color:=clBlue;
      end else begin
        StrGrid.CellStyle[30,Count].Font.Color:=clBlack;
        StrGrid.CellStyle[31,Count].Font.Color:=clBlack;
      end;

      if OrderFeeArr[IntCount][28]<>'' then StrGrid.Cells[31,Count]:=OrderFeeArr[IntCount][28];

      if OrderFeeArr[IntCount][29]<>'' then begin
        StrGrid.CellStyle[32,Count].Font.Color:=clBlue;
        StrGrid.CellStyle[33,Count].Font.Color:=clBlue;
      end else begin
        StrGrid.CellStyle[32,Count].Font.Color:=clBlack;
        StrGrid.CellStyle[33,Count].Font.Color:=clBlack;
      end;
      if OrderFeeArr[IntCount][30]<>'' then StrGrid.Cells[32,Count]:=OrderFeeArr[IntCount][30];
      if OrderFeeArr[IntCount][31]<>'' then StrGrid.Cells[33,Count]:=OrderFeeArr[IntCount][31];
      if OrderFeeArr[IntCount][32]<>'' then StrGrid.Cells[34,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][32]));
      if OrderFeeArr[IntCount][33]<>'' then begin
        StrGrid.Cells[35,Count]:=IToCurr(SToInt(OrderFeeArr[IntCount][33]));
        StrGrid.Cells[36,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][34]));
        if (SToFloat(OrderFeeArr[IntCount][9]))+(SToFloat(OrderFeeArr[IntCount][45]))+(SToFloat(OrderFeeArr[IntCount][11])) >0 then
        begin
          if (SToFloat(OrderFeeArr[IntCount][55])>0) then
          begin
            StrGrid.Cells[58,Count]:=FloatToStrF(StoInt(OrderFeeArr[IntCount][55])/TotalBBMLiter,ffNumber,6,2);
          end;
          //StrGrid.Cells[32,Count]:=FloatToStrF(StoInt(OrderFeeArr[IntCount][34])/StrToFloat(StoInt(OrderFeeArr[IntCount][45])),ffNumber,6,2)
          StrGrid.Cells[37,Count]:=FloatToStrF(StoInt(OrderFeeArr[IntCount][34])/TotalBBMLiter,ffNumber,6,2);
        end
        else
        begin
          StrGrid.Cells[37,Count]:='0';
          StrGrid.Cells[58,Count]:='0';
        end;
        
      end else begin
        StrGrid.Cells[35,Count]:='';
        StrGrid.Cells[36,Count]:='0';
        StrGrid.Cells[37,Count]:='0';
      end;


      StrGrid.Cells[38,Count]:=OrderFeeArr[IntCount][35];
    //  if (OrderFeeArr[IntCount][36])<>'' then StrGrid.Cells[39,Count]:=(OrderFeeArr[IntCount][36]) else StrGrid.Cells[38,Count]:='';
      if (OrderFeeArr[IntCount][36])<>'' then StrGrid.Cells[39,Count]:=(OrderFeeArr[IntCount][36]);
      if OrderFeeArr[IntCount][37]<>'' then StrGrid.Cells[40,Count]:=eToll(OrderFeeArr[IntCount][37]);
      if OrderFeeArr[IntCount][38]<>'' then StrGrid.Cells[41,Count]:=OrderFeeArr[IntCount][38];
      if OrderFeeArr[IntCount][39]>'' then StrGrid.Cells[42,Count]:=OrderFeeArr[IntCount][39];
      if OrderFeeArr[IntCount][40]<>'' then StrGrid.Cells[43,Count]:=OrderFeeArr[IntCount][40];

      if OrderFeeArr[IntCount][41]<>'' then StrGrid.Cells[44,Count]:=OrderFeeArr[IntCount][41];
      if OrderFeeArr[IntCount][42]<>'' then StrGrid.Cells[45,Count]:=OrderFeeArr[IntCount][42];
      if OrderFeeArr[IntCount][43]<>'' then StrGrid.Cells[46,Count]:=OrderFeeArr[IntCount][43];

      if OrderFeeArr[IntCount][46]<>'' then StrGrid.Cells[47,Count]:=OrderFeeArr[IntCount][46];
      if OrderFeeArr[IntCount][47]<>'' then StrGrid.Cells[48,Count]:=OrderFeeArr[IntCount][47];
//      if OrderFeeArr[IntCount][48]<>'' then StrGrid.Cells[49,Count]:=eToll(OrderFeeArr[IntCount][48]);
//      if OrderFeeArr[IntCount][49]<>'' then StrGrid.Cells[50,Count]:=OrderFeeArr[IntCount][49];
      if OrderFeeArr[IntCount][50]<>'' then StrGrid.Cells[51,Count]:=SToCurr(OrderFeeArr[IntCount][50]);
      if OrderFeeArr[IntCount][51]<>'' then StrGrid.Cells[52,Count]:=SToCurr(OrderFeeArr[IntCount][51]);

      StrGrid.Cells[53,Count]:=  SToCurr(IntToStr(StrToInt(OrderFeeArr[IntCount][51]) - StrToInt(OrderFeeArr[IntCount][50])));
      StrGrid.Cells[54,Count]:=  OrderFeeArr[IntCount][52];
      StrGrid.Cells[55,Count]:=  OrderFeeArr[IntCount][53];

      if LowerCase(Trim( StrGrid.Cells[54,Count] ))<>'completed' then begin
        for Count2:=0 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,Count].Font.Color:=clRed;
        end;

      end else begin
        for Count2:=0 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
        end;
      end;
    end;
    Inc(Count);

  end;


  StrGrid.RowCount:=StrGrid.RowCount+2;
//  for Count:=0 to 39 do begin
//    StrGrid.Cells[Count,StrGrid.RowCount]:='';
//    StrGrid.Cells[Count,StrGrid.RowCount-1]:='';
//    //StrGrid.Cells[Count,StrGrid.RowCount-2]:='';
//
//    StrGrid.CellStyle[0,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[1,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[2,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[3,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[4,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[5,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[6,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[7,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[8,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[9,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;
//
//    StrGrid.CellStyle[10,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[11,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[12,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[13,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[14,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[15,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[16,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[17,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    {Geser 6 kolom}
//    StrGrid.CellStyle[18,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[19,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[20,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[21,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[22,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[23,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[24,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[25,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[26,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[27,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[28,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[29,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[30,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[31,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[32,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[33,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[34,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[35,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[36,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//
//    StrGrid.CellStyle[37,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[38,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[39,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[40,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[41,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;
//    StrGrid.CellStyle[42,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[43,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[59,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[60,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;
//
//    StrGrid.CellStyle[62,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[63,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[64,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[65,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[66,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[67,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[68,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[69,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[70,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[71,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[72,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[73,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[74,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[75,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[76,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[77,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[78,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;


    //StrGrid.CellStyle[39,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;

    {Geser 4 kolom}
    (*
    StrGrid.CellStyle[27,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[29,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[30,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[31,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[32,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[33,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    *)
//  end;
  for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2, StrGrid.RowCount-1].Font.Color:=clWindowText;

  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  StrGrid.Cells[9,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[10,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Budget);
  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Budget);
  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_SPBU);
  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_SPBU);
  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Reimburse);
  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Reimburse);
  StrGrid.Cells[16,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_All);
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_All);

  {Geser 4 kolom}
  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver);
  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriverReimburse);
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoyReimburse);
  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(TotalTolParkir);
  StrGrid.Cells[23,StrGrid.RowCount-1]:=IToCurr(TotalTolParkirReimburse);
  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalTol);
  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalTolReimburse);

  StrGrid.Cells[26,StrGrid.RowCount-1]:=IToCurr(TotalLain);
  StrGrid.Cells[27,StrGrid.RowCount-1]:=IToCurr(TotalOvertime);

  StrGrid.Cells[28,StrGrid.RowCount-1]:=IToCurr(TotalBiaya);
  StrGrid.Cells[29,StrGrid.RowCount-1]:=IToCurr(TotalBiayaExc);
  StrGrid.Cells[51,StrGrid.RowCount-1]:=IToCurr(TotalTopupBudget);
  StrGrid.Cells[52,StrGrid.RowCount-1]:=IToCurr(TotalETollBudget);
  StrGrid.Cells[53,StrGrid.RowCount-1]:=IToCurr(TotalSelisih);

  StrGrid.Cells[64,StrGrid.RowCount-1]:=IToCurr(TotalBBMBudget);
  StrGrid.Cells[65,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver1);
  StrGrid.Cells[66,StrGrid.RowCount-1]:=IToCurr(TotalParkir);
  StrGrid.Cells[67,StrGrid.RowCount-1]:=IToCurr(TotalParkirTamu); //total parkir tamu
  StrGrid.Cells[68,StrGrid.RowCount-1]:=IToCurr(TotalTol2);
  StrGrid.Cells[69,StrGrid.RowCount-1]:=IToCurr(TotalTolTamu); //total tol tamu
  StrGrid.Cells[70,StrGrid.RowCount-1]:=IToCurr(TotalLain2); //Total bermalam
  StrGrid.Cells[71,StrGrid.RowCount-1]:=IToCurr(TotalTips); //Total tips
  StrGrid.Cells[72,StrGrid.RowCount-1]:=IToCurr(TotalBiayaDariTamu); //Total baiaya dari tamu
  StrGrid.Cells[73,StrGrid.RowCount-1]:=IToCurr(TotalOvertime);
  StrGrid.Cells[74,StrGrid.RowCount-1]:=IToCurr(TotalTotalDriver1);

  //StrGrid.Cells[75,StrGrid.RowCount-1]:=IToCurr(TotalTotalDriver1);
  //StrGrid.Cells[76,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver2);
  StrGrid.Cells[77,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver2); //IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[80,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[81,StrGrid.RowCount-1]:=IToCurr(TotalTotalDriver1_Driver2_Helper);

  StrGrid.Cells[82,StrGrid.RowCount-1]:=IToCurr(TotalSelisih2);

  StrGrid.CellStyle[9,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[10,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[11,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[12,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[13,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[14,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[15,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[16,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[17,StrGrid.RowCount-1].BGColor:=clSilver;
  {Geser 4 kolom}
  StrGrid.CellStyle[18,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[19,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[21,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[22,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[23,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[25,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[26,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[27,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[28,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[29,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.CellStyle[51,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[52,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[53,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.CellStyle[64,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[65,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[66,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[67,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[68,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[69,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[70,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[71,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[72,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[73,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[74,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.CellStyle[77,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[80,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[81,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[82,StrGrid.RowCount-1].BGColor:=clSilver;


  for Count2:=2 to StrGrid.RowCount do
  begin
    StrGrid.CellStyle[0,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[1,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[4,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[7,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[8,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[10,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[12,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[14,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[18,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[20,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[21,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[22,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[23,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[24,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[25,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[26,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[27,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[28,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[29,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[30,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[31,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[32,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[33,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[34,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[35,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[36,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[37,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[38,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[39,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[40,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[41,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[42,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[43,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[44,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[45,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[46,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[47,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[48,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[49,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[50,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[51,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[52,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[53,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[54,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[55,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[56,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[57,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[58,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[59,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[60,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[61,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[62,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[63,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[64,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[65,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[66,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[67,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[68,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[69,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[70,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[71,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[72,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[73,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[74,Count2].HorizontalAlignment:=taRightJustify;

    StrGrid.CellStyle[75,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[76,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[77,Count2].HorizontalAlignment:=taRightJustify;

    StrGrid.CellStyle[78,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[79,Count2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[80,Count2].HorizontalAlignment:=taRightJustify;

    StrGrid.CellStyle[81,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[82,Count2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[83,Count2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[84,Count2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[85,Count2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[86,Count2].HorizontalAlignment:=taLeftJustify;
  end;


//  StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[12,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[13,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[14,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[15,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[16,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  {Geser 6 kolom}
//  StrGrid.CellStyle[18,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[20,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[21,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[22,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[23,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[24,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[25,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[26,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[27,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[28,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[29,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//
//  StrGrid.CellStyle[39,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[57,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//
//
//  StrGrid.CellStyle[64,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[65,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[66,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[67,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[68,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[69,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[70,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[73,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[76,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[77,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[78,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;

  Count3:= Length(OrderFeeArr);
  for Count:=2 to Count3+1 do begin
    if (StrGrid.Cells[60,Count]<>'') then begin
       StrGrid.CellStyle[2,Count].Font.Color:=clGreen;
    end;

    StrGrid.CellStyle[79,Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[80,Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[81,Count].Font.Color:=clWindowText;
    StrGrid.CellStyle[82,Count].Font.Color:=clWindowText;
  end;



end;

procedure TDailyOrderFeeRpt.RefreshData;
var QStr,StrBatch,StrLocationId,StrCompanyId,StrToDates,StrisAll,StrCancel,StrInDate,StrIsFilledFuel,StrInputDate,StrCustomer:String;
    Qry, Qry2, QryCek:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,TotalOperasi,IntDiscount,IntCount:Integer;
    BBMLiter,GasLiter,BBMRp,GasRp:Integer;
    BBMLiterSingle:Single;

    BBMLiter_Budget,BBMRp_Budget,BBMLiter_SPBU,BBMRp_SPBU,BBMLiter_Reimburse,BBMRp_Reimburse:Integer;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All,TotalFeeDriver,TotalFeeBusBoy,TotalTolParkir,TotalTol,
    TotalLain,TotalOvertime,TotalBiaya,TotalBiayaExc,IntBiaya:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse,IntBiayaReimburse :Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;
begin
  TotalBBMRp:=0;
  TotalBBMLiter:=0;
  TotalBBMRp_All:=0;
  TotalBBMLiter_All:=0;

  TotalBBMRp_Budget:=0;
  TotalBBMLiter_Budget:=0;
  TotalBBMRp_SPBU:=0;
  TotalBBMLiter_SPBU:=0;
  TotalBBMRp_Reimburse:=0;
  TotalBBMLiter_Reimburse:=0;

  TotalFeeDriver:=0;
  TotalFeeBusBoy:=0;
  TotalTolParkir:=0;
  TotalLain:=0;
  TotalOvertime:=0;
  TotalOperasi:=0;
  TotalBiaya:=0;
  TotalBiayaExc:=0;

  TotalFeeDriverReimburse:=0;
  TotalFeeBusBoyReimburse:=0;
  TotalTolParkirReimburse:=0;
  TotalTolReimburse:=0;

  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry2:=TADOQuery.Create(Self);
  QryCek:=TADOQuery.Create(Self);

  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;

  QryCek.Connection:=Main.MyConnection;
  QryCek.CommandTimeout:=3600;

  Qry.CursorLocation:=clUseClient;
  if Batch.Text='All' then begin
    StrBatch:='0';
  end else begin
    StrBatch:=Batch.Text;
  end;
  if isAll.Text='All' then begin
    StrisAll:='0';
  end else begin
    StrisAll:=IntToStr(isAll.ItemIndex);
  end;
  if cbCancel.Checked then StrCancel:=',@IsCancel=1';

  if CustomerName.Text<>'' then StrCustomer:=',@CustomerName='+QuotedStr(CustomerName.Text)
  else StrCustomer:='';

  Main.M_Busy;
  SetLength(OrderFeeArr,0);

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  StrCompanyId:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];
  if CekTglSampai.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy',TglSampai.Date));

  if CekTglMasuk.Checked=True then StrInDate:=',@IsInDates=1';
  if CekTglInput.Checked=True then StrInputDate:=',@IsInputDates=1';
  if CekBBM.Checked=True then StrIsFilledFuel:=',@IsFilledFuel=1';


  QStr:='EXEC GetRevenueVhcDayRpt2 '+StrLocationId+','+
        QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date))+','+
        QuotedStr(StrBatch)+','+StrCompanyId+StrToDates+',@Ordered=vhc_trans_id,@isAll='+StrisAll+StrCancel+StrInDate+StrInputDate+StrIsFilledFuel+StrCustomer+';';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;

  SetLength(OrderFeeArr,Qry.RecordCount);

  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
  for Count:=0 to MaxCol do begin
    for Count2:=2 to StrGrid.RowCount do begin    // reset baris ke 3
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
    end;
  end;

  Count:=2;
  IntCount:=0;
  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    for Count2:=0 to MaxCol do begin
      StrGrid.Cells[Count2,Count]:='';
      StrGrid.CellStyle[Count2,Count].HorizontalAlignment:=taLeftJustify;
    end;
    IntDiscount:=0;
    IntBiaya:=0;
    IntBiayaReimburse:=0;
    StrGrid.Cells[0,Count]:=IntToStr(Count-1);
    Try
      //StrGrid.Cells[1,Count]  :=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['customer_order_id']<> NULL then begin
        OrderFeeArr[IntCount][0]:=Qry.FieldValues['customer_order_id'];
      end else begin
        OrderFeeArr[IntCount][0]:='';
      end;
    Except On E:Exception do Begin
          Main.WriteTableLog('Lap Uang Harian Driver', VarToStr(Qry.FieldValues['vhc_trans_id']), 'Error Muncul NULL');
          QStr := 'SELECT Count(*) as JML FROM wh_reserved_order_detail WHERE vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
          QryCek.SQL.Clear;
          QryCek.SQL.Add(QStr);
          QryCek.Open;
          If (QryCek.Fields.FieldByName('jml').AsInteger)=0 Then begin
            QStr := 'UPDATE wh_vhc_trans SET cancel=1 WHERE Coalesce(cancel, 0)=0 AND vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
            QryCek.SQL.Clear;
            QryCek.SQL.Add(QStr);
            QryCek.ExecSQL;
          end else begin
            QStr := 'UPDATE wh_reserved_order_detail SET Status=1 WHERE Status=0 AND vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
            QryCek.SQL.Clear;
            QryCek.SQL.Add(QStr);
            QryCek.ExecSQL;
          end;
      end;
    End;
    {
    StrGrid.Cells[2,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[3,Count]:=Qry.FieldValues['customer_name'];
    StrGrid.Cells[4,Count]:=Qry.FieldValues['route'];
    StrGrid.Cells[5,Count]:=Qry.FieldValues['body_id'];
    }
    OrderFeeArr[IntCount][1]:=Qry.FieldValues['vhc_trans_id'];
    OrderFeeArr[IntCount][2]:=Qry.FieldValues['customer_name'];
    OrderFeeArr[IntCount][3]:=Qry.FieldValues['route'];
    OrderFeeArr[IntCount][4]:=Qry.FieldValues['body_id'];

    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      {
      StrGrid.Cells[6,Count]:=LicensePlate(Qry.FieldValues['license_plate']);
      StrGrid.Cells[7,Count]:=Qry.FieldValues['name'];
      StrGrid.Cells[8,Count]:=Qry.FieldValues['helper'];
      StrGrid.Cells[9,Count]:=Qry.FieldValues['standby_time'];
      }
      OrderFeeArr[IntCount][5]:=LicensePlate(Qry.FieldValues['license_plate']);
      OrderFeeArr[IntCount][6]:=Qry.FieldValues['name'];
      OrderFeeArr[IntCount][7]:=Qry.FieldValues['helper'];
      OrderFeeArr[IntCount][8]:=Qry.FieldValues['standby_time'];
      {
      if Qry.FieldValues['fuel_litre']<>NULL then begin
        BBMLiter:=Qry.FieldValues['fuel_litre'];
        BBMLiterSingle:=Qry.FieldValues['fuel_litre'];
      end else begin
        BBMLiter:=0; BBMLiterSingle:=0;
      end;
      if Qry.FieldValues['fuel_price']<>NULL then BBMRp:=Qry.FieldValues['fuel_price'] else BBMRp:=0;
      }
      //Budget
      if Qry.FieldValues['fuel_litre_budget']<>NULL then begin
        //BBMLiter_Budget       :=Qry.FieldValues['fuel_litre_budget'];
        //BBMLiterSingle_Budget :=Qry.FieldValues['fuel_litre_budget'];
        OrderFeeArr[IntCount][9]:=Qry.FieldValues['fuel_litre_budget'];
      end else begin
        //BBMLiter_Budget:=0; BBMLiterSingle_Budget:=0;
        OrderFeeArr[IntCount][9]:='0';
      end;


      if Qry.FieldValues['fuel_price_budget']<>NULL then begin
        //BBMRp_Budget:=Qry.FieldValues['fuel_price_budget'];
        OrderFeeArr[IntCount][10]:=Qry.FieldValues['fuel_price_budget'];
      end else begin
         BBMRp_Budget:=0;
         OrderFeeArr[IntCount][10]:='0';
      end;
      //SPBU
      if Qry.FieldValues['fuel_litre_spbu']<>NULL then begin
        //BBMLiter_SPBU       :=Qry.FieldValues['fuel_litre_spbu'];
        //BBMLiterSingle_SPBU :=Qry.FieldValues['fuel_litre_spbu'];
        OrderFeeArr[IntCount][11]:=Qry.FieldValues['fuel_litre_spbu'];
      end else begin
        //BBMLiter_SPBU:=0; BBMLiterSingle_SPBU:=0;
        OrderFeeArr[IntCount][11]:='0';
      end;
      if Qry.FieldValues['fuel_price_spbu']<>NULL then begin
        //BBMRp_SPBU:=Qry.FieldValues['fuel_price_spbu'];
        OrderFeeArr[IntCount][12]:=Qry.FieldValues['fuel_price_spbu'];
      end else begin
        //BBMRp_SPBU:=0;
        OrderFeeArr[IntCount][12]:='0';
      end;
      //Reimburse
      if Qry.FieldValues['fuel_litre_reimburse']<>NULL then begin
        //BBMLiter_Reimburse       :=Qry.FieldValues['fuel_litre_reimburse'];
        //BBMLiterSingle_Reimburse :=Qry.FieldValues['fuel_litre_reimburse'];
        OrderFeeArr[IntCount][13]:=Qry.FieldValues['fuel_litre_reimburse'];
      end else begin
        //BBMLiter_Reimburse:=0; BBMLiterSingle_Reimburse:=0;
        OrderFeeArr[IntCount][13]:='0';
      end;
      if Qry.FieldValues['fuel_price_reimburse']<>NULL then begin
        //BBMRp_Reimburse:=Qry.FieldValues['fuel_price_reimburse'];
        OrderFeeArr[IntCount][14]:=Qry.FieldValues['fuel_price_reimburse'];
      end else begin
        //BBMRp_Reimburse:=0;
        OrderFeeArr[IntCount][14]:='0';
      end;

      OrderFeeArr[IntCount][15]:=Qry.FieldValues['day'];
      OrderFeeArr[IntCount][16]:=Qry.FieldValues['fee_driver'];
      OrderFeeArr[IntCount][17]:=Qry.FieldValues['fee_busboy'];
      OrderFeeArr[IntCount][18]:=Qry.FieldValues['tol_parkir'];
      OrderFeeArr[IntCount][19]:=Qry.FieldValues['tol'];

      OrderFeeArr[IntCount][20]:=Qry.FieldValues['fee_driver_reimburse'];
      OrderFeeArr[IntCount][21]:=Qry.FieldValues['fee_busboy_reimburse'];
      OrderFeeArr[IntCount][22]:=Qry.FieldValues['parkir_reimburse'];
      OrderFeeArr[IntCount][23]:=Qry.FieldValues['tol_reimburse'];
      OrderFeeArr[IntCount][24]:=Qry.FieldValues['lain_lain'];
      OrderFeeArr[IntCount][25]:=Qry.FieldValues['overtime'];
      if (Qry.FieldValues['from_dates']<>NULL) then begin
        OrderFeeArr[IntCount][26]:=Qry.FieldValues['from_dates'];
      end
      else begin
        OrderFeeArr[IntCount][26]:='';
      end;

      OrderFeeArr[IntCount][27]:=VartoStr(Qry.FieldValues['out_source']);

      OrderFeeArr[IntCount][28]:=VartoStr(Qry.FieldValues['out_time']);
      OrderFeeArr[IntCount][29]:=VartoStr(Qry.FieldValues['in_source']);
      OrderFeeArr[IntCount][30]:=VartoStr(Qry.FieldValues['in_dates']);
      OrderFeeArr[IntCount][31]:=VartoStr(Qry.FieldValues['in_time']);
      OrderFeeArr[IntCount][32]:=VartoStr(Qry.FieldValues['out_ordo_km']);

      OrderFeeArr[IntCount][33]:=VartoStr(Qry.FieldValues['in_ordo_km']);
      OrderFeeArr[IntCount][34]:=VartoStr(Qry.FieldValues['distance']);
      OrderFeeArr[IntCount][35]:=VartoStr(Qry.FieldValues['UpdateUser']);
      OrderFeeArr[IntCount][36]:=VartoStr(Qry.FieldValues['description']);
      OrderFeeArr[IntCount][37]:=VartoStr(Qry.FieldValues['etoll_number']);
      OrderFeeArr[IntCount][38]:=VartoStr(Qry.FieldValues['account_number']);
      OrderFeeArr[IntCount][39]:=VartoStr(Qry.FieldValues['account_name']);
      OrderFeeArr[IntCount][40]:=VartoStr(Qry.FieldValues['from_to_dates2']);
      OrderFeeArr[IntCount][41]:=VartoStr(Qry.FieldValues['jenisKendaraan']);

      OrderFeeArr[IntCount][42]:=VartoStr(Qry.FieldValues['seat']);
      OrderFeeArr[IntCount][43]:=VartoStr(Qry.FieldValues['JamSelesai']);

      OrderFeeArr[IntCount][44]:=Qry.FieldValues['employee_id'];
      OrderFeeArr[IntCount][45]:=Qry.FieldValues['fuel_litre'];

      OrderFeeArr[IntCount][46]:=VartoStr(Qry.FieldValues['etoll_trx_date']);
      OrderFeeArr[IntCount][47]:=VartoStr(Qry.FieldValues['etoll_trx_time']);
      OrderFeeArr[IntCount][48]:=VartoStr(Qry.FieldValues['etoll_trx_number']);
      OrderFeeArr[IntCount][49]:=OrderFeeArr[IntCount][1];//No SJ
      OrderFeeArr[IntCount][50]:=VartoStr(Qry.FieldValues['etoll_trx_amount']);
      OrderFeeArr[IntCount][51]:=VartoStr(Qry.FieldValues['etoll_trx_budget']);
      OrderFeeArr[IntCount][52]:=VartoStr(Qry.FieldValues['status_sj']);
      OrderFeeArr[IntCount][53]:=VartoStr(Qry.FieldValues['JenisService']);
      OrderFeeArr[IntCount][54]:=VartoStr(Qry.FieldValues['remarkSJ']);
      OrderFeeArr[IntCount][55]:=VartoStr(Qry.FieldValues['km_estimasi']);
      OrderFeeArr[IntCount][56]:=VartoStr(Qry.FieldValues['spbu_name']);
      OrderFeeArr[IntCount][57]:=VartoStr(Qry.FieldValues['isTransfer_update_time']);
      OrderFeeArr[IntCount][58]:=VartoStr(Qry.FieldValues['urut_id']);

      OrderFeeArr[IntCount][59]:=VartoStr(Qry.FieldValues['fee_driver1']);
      OrderFeeArr[IntCount][60]:=VartoStr(Qry.FieldValues['fee_driver2']);
      OrderFeeArr[IntCount][61]:=VartoStr(Qry.FieldValues['fee_busboy']);
      OrderFeeArr[IntCount][62]:=VartoStr(Qry.FieldValues['fee_driver1_reimburse']);
      OrderFeeArr[IntCount][63]:=VartoStr(Qry.FieldValues['fee_driver2_reimburse']);
      OrderFeeArr[IntCount][64]:=VartoStr(Qry.FieldValues['fee_busboy_reimburse']);
      OrderFeeArr[IntCount][65]:=VartoStr(Qry.FieldValues['driver1_name']);
      OrderFeeArr[IntCount][66]:=VartoStr(Qry.FieldValues['driver2_name']);
      OrderFeeArr[IntCount][67]:=VartoStr(Qry.FieldValues['busboy_name']);
      OrderFeeArr[IntCount][68]:=VartoStr(Qry.FieldValues['no_rek_driver1']);
      OrderFeeArr[IntCount][69]:=VartoStr(Qry.FieldValues['no_rek_driver2']);
      OrderFeeArr[IntCount][70]:=VartoStr(Qry.FieldValues['no_rek_busboy']);
      if Qry.FieldValues['is_employee_id_matched']=True then
      begin
        OrderFeeArr[IntCount][71]:='V';
      end else if Qry.FieldValues['is_employee_id_matched']=False then
      begin
        OrderFeeArr[IntCount][71]:='X';
      end else begin
        OrderFeeArr[IntCount][71]:='';
      end;

      if Qry.FieldValues['is_employee_id2_matched']=1 then
      begin
        OrderFeeArr[IntCount][72]:='V';
      end else if Qry.FieldValues['is_employee_id2_matched']=0 then
      begin
        OrderFeeArr[IntCount][72]:='X';
      end else begin
        OrderFeeArr[IntCount][72]:='';
      end;

      if Qry.FieldValues['is_employee_id3_matched']=1 then
      begin
        OrderFeeArr[IntCount][73]:='V';
      end else if Qry.FieldValues['is_employee_id3_matched']=0 then
      begin
        OrderFeeArr[IntCount][73]:='X';
      end else begin
        OrderFeeArr[IntCount][73]:='';
      end;

      if Qry.FieldValues['checked_note']<>NULL then
      OrderFeeArr[IntCount][74]:=VartoStr(Qry.FieldValues['checked_note']);

      if Qry.FieldValues['fee_driver1_reimburse']<>NULL then
      OrderFeeArr[IntCount][75]:=VartoStr(Qry.FieldValues['fee_driver1_reimburse']);
      if Qry.FieldValues['fee_driver2_reimburse']<>NULL then
      OrderFeeArr[IntCount][76]:=VartoStr(Qry.FieldValues['fee_driver2_reimburse']);
      if Qry.FieldValues['alasan_cetak_ulang']<>NULL then
      OrderFeeArr[IntCount][77]:=VartoStr(Qry.FieldValues['alasan_cetak_ulang']);
      if Qry.FieldValues['tol_parkir_tamu']<>NULL then
      OrderFeeArr[IntCount][78]:=VartoStr(Qry.FieldValues['tol_parkir_tamu']);
            if Qry.FieldValues['tol_tamu']<>NULL then
      OrderFeeArr[IntCount][79]:=VartoStr(Qry.FieldValues['tol_tamu']);
            if Qry.FieldValues['tips']<>NULL then
      OrderFeeArr[IntCount][80]:=VartoStr(Qry.FieldValues['tips']);
            if Qry.FieldValues['biaya_dari_tamu']<>NULL then
      OrderFeeArr[IntCount][81]:=VartoStr(Qry.FieldValues['biaya_dari_tamu']);


      StrGrid.Cells[38,Count]:=Qry.FieldValues['UpdateUser'];
      if Qry.FieldValues['description']<>NULL then StrGrid.Cells[39,Count]:=Qry.FieldValues['description'] else StrGrid.Cells[38,Count]:='';
      if Qry.FieldValues['etoll_number']<>NULL then StrGrid.Cells[40,Count]:=eToll(Qry.FieldValues['etoll_number']);
      if Qry.FieldValues['account_number']<>NULL then StrGrid.Cells[41,Count]:=Qry.FieldValues['account_number'];
      if Qry.FieldValues['account_name']<>NULL then StrGrid.Cells[42,Count]:=Qry.FieldValues['account_name'];
      if Qry.FieldValues['from_to_dates2']<>NULL then StrGrid.Cells[43,Count]:=Qry.FieldValues['from_to_dates2'];

      if Qry.FieldValues['jenisKendaraan']<>NULL then StrGrid.Cells[44,Count]:=Qry.FieldValues['jenisKendaraan'];
      if Qry.FieldValues['seat']<>NULL then StrGrid.Cells[45,Count]:=Qry.FieldValues['seat'];
      if Qry.FieldValues['JamSelesai']<>NULL then StrGrid.Cells[46,Count]:=Qry.FieldValues['JamSelesai'];

    end;
    Inc(Count);
    Inc(IntCount);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;

  StrGrid.RowCount:=StrGrid.RowCount+2;
  for Count:=0 to 38 do begin
    StrGrid.Cells[Count,StrGrid.RowCount]:='';
    StrGrid.Cells[Count,StrGrid.RowCount-1]:='';
    //StrGrid.Cells[Count,StrGrid.RowCount-2]:='';


//    StrGrid.CellStyle[0,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[1,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[2,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[3,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[4,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[5,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[6,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[7,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[8,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[9,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;
//
//    StrGrid.CellStyle[10,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[11,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[12,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[13,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[14,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[15,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[16,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[17,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    {Geser 6 kolom}
//    StrGrid.CellStyle[18,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[19,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[20,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[21,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[22,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[23,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[24,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[25,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[26,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[27,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[28,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[29,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[30,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[31,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[32,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[33,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[34,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[35,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[36,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//
//    StrGrid.CellStyle[37,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[38,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[39,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[40,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[41,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;
//    StrGrid.CellStyle[42,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
//    StrGrid.CellStyle[43,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;

    //StrGrid.CellStyle[39,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;

    {Geser 4 kolom}
    (*
    StrGrid.CellStyle[27,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[29,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[30,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[31,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[32,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[33,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    *)
  end;
//  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
//  StrGrid.Cells[9,StrGrid.RowCount-1]:='Total';
//  StrGrid.Cells[10,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Budget);
//  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Budget);
//  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_SPBU);
//  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_SPBU);
//  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Reimburse);
//  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Reimburse);
//  StrGrid.Cells[16,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_All);
//  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_All);

  {Geser 4 kolom}
//  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver);
//  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriverReimburse);
//  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
//  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoyReimburse);
//  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(TotalTolParkir);
//  StrGrid.Cells[23,StrGrid.RowCount-1]:=IToCurr(TotalTolParkirReimburse);
//  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalTol);
//  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalTolReimburse);
//
//  StrGrid.Cells[26,StrGrid.RowCount-1]:=IToCurr(TotalLain);
//  StrGrid.Cells[27,StrGrid.RowCount-1]:=IToCurr(TotalOvertime);
//
//  StrGrid.Cells[28,StrGrid.RowCount-1]:=IToCurr(TotalBiaya);
//  StrGrid.Cells[29,StrGrid.RowCount-1]:=IToCurr(TotalBiayaExc);
//  StrGrid.CellStyle[9,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[10,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[11,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[12,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[13,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[14,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[15,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[16,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[17,StrGrid.RowCount-1].BGColor:=clSilver;
//  {Geser 4 kolom}
//  StrGrid.CellStyle[18,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[19,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[20,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[21,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[22,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[23,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[24,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[25,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[26,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[27,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[28,StrGrid.RowCount-1].BGColor:=clSilver;
//  StrGrid.CellStyle[29,StrGrid.RowCount-1].BGColor:=clSilver;

  //StrGrid.CellStyle[10,StrGrid.RowCount-2].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[12,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[13,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[14,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[15,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[16,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  {Geser 6 kolom}
//  StrGrid.CellStyle[18,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[20,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[21,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[22,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[23,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[24,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[25,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[26,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[27,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[28,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[29,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;

//  StrGrid.CellStyle[39,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  Main.M_Normal;
end;

procedure TDailyOrderFeeRpt.SelesaiClick(Sender: TObject);
begin
   Close;
end;

procedure TDailyOrderFeeRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDailyOrderFeeRpt.RefreshClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TDailyOrderFeeRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

procedure TDailyOrderFeeRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TDailyOrderFeeRpt.BatchChange(Sender: TObject);
begin
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TDailyOrderFeeRpt.StrGridDblClick(Sender: TObject);
var IsAuth:Boolean;
begin
  if IntRow>0 then begin
    Case IntCol of
      0,1:if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False);
      2:begin
          IsAuth:=True;
          AuthorizedForm.FormId:='19040101';
          AuthorizedForm.StrMessage:=' Pencetakan Surat Jalan Kembali ';
          if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
          Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
          if IsAuth=True then begin
            if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,StrGrid.Cells[2,IntRow],False)
          end else if Main.IsFormOpen('OrderFee')=False then
          begin
            if LowerCase(Trim( StrGrid.Cells[60,IntRow] ))<>'' then
                OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],False)
            else OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],True);
          end;
        end;
      3..13:if Main.IsFormOpen('OrderFee')=False then
            begin
              if LowerCase(Trim( StrGrid.Cells[60,IntRow] ))<>'' then
                OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],False)
              else OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],True);
            end;
      14 : RePrintReimburse(StrGrid.Cells[2,IntRow]); {Preview Form Reimbursement}
      55 : ShowMessage(StrGrid.Cells[55,IntRow]);
    end;
  end;
end;

procedure TDailyOrderFeeRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TDailyOrderFeeRpt.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

procedure TDailyOrderFeeRpt.RePrintReimburse(Trans_Id:String);
var Qry:TADOQuery;
    QStr:String;
    IntJmlNominal, IntJmlKMJalan : Integer;
    DJmlLiter,DRasio : Double;
begin
  if Trans_Id<>'' then begin
      //InitReport;
      Main.M_Busy;
      //PreparePrintSPPB;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      if Main.OpenDb then begin
        QStr:='EXEC GetSJDetail '+QuotedStr(Trans_Id)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          ppNoSJ.Caption:=Qry.FieldValues['vhc_trans_id'];
          ppNoPolisi.Caption:=LicensePlate(Qry.FieldValues['license_plate']);
          ppJenisUnit.Caption:=Qry.FieldValues['category_name'];
          ppDriver.Caption:=Qry.FieldValues['driver_name'];

          if Qry.FieldValues['fuel_budget_price']>0 then begin
            ppBudgetLiter.Caption:=SToCurr(Qry.FieldValues['fuel_budget_litre'],2);
            ppBudgetNominal.Caption:=IToCurr(Qry.FieldValues['fuel_budget_price']);
          end else begin
            ppBudgetLiter.Caption:='0';
            ppBudgetNominal.Caption:='0';
          end;

          if Qry.FieldValues['bbmSPBU']>0 then begin
            ppSPBULiter.Caption:=SToCurr(Qry.FieldValues['literSPBU'], 2);
            ppSPBUNominal.Caption:=IToCurr(Qry.FieldValues['bbmSPBU']);
          end else begin
            ppSPBULiter.Caption  :='0';
            ppSPBUNominal.Caption:='0';
          end;

          if Qry.FieldValues['bbmReimburse']>0 then begin
            ppReimburseLiter.Caption  :=SToCurr(Qry.FieldValues['literReimburse'], 2);
            ppReimburseNominal.Caption:=IToCurr(Qry.FieldValues['bbmReimburse']);
          end else begin
            ppReimburseLiter.Caption  :='0';
            ppReimburseNominal.Caption:='0';
          end;
          DJmlLiter :=SToFloat(ToString(ppBudgetLiter.Caption)) + SToFloat(ToString(ppSPBULiter.Caption)) + SToFloat(ToString(ppReimburseLiter.Caption)) ;
          IntJmlNominal:=SToInt(ToString(ppBudgetNominal.Caption))+ SToInt(ToString(ppSPBUNominal.Caption)) + SToInt(ToString(ppReimburseNominal.Caption));
          ppTotalLiter.Caption:=IToCurr(DJmlLiter);
          ppTotalNominal.Caption:=IToCurr(IntJmlNominal);

          if Qry.FieldValues['out_ordo_km']<>null then
            ppKMKeluar.Caption:=IToCurr(Qry.FieldValues['out_ordo_km'])
          else ppKMKeluar.Caption:='';

          if Qry.FieldValues['kmMasuk']<>null then
            ppKMMasuk.Caption:=IToCurr(Qry.FieldValues['kmMasuk'])
          else ppKMMasuk.Caption:='';
          if Qry.FieldValues['kmMasuk']<>null then
            ppKMJalan.Caption:=IToCurr(Qry.FieldValues['kmMasuk']-Qry.FieldValues['out_ordo_km'])
          else
            ppKMJalan.Caption:='0';

          if Qry.FieldValues['kmMasuk']<>null then begin
            DRasio := (Qry.FieldValues['kmMasuk']-Qry.FieldValues['out_ordo_km'])/DJmlLiter;
            ppRasio.Caption:=SToCurr(IToCurr(DRasio), 2)
          end else
            ppRasio.Caption:='0';
          ppRasioStandar.Caption:=VarToStr(Qry.FieldValues['fuel_cons_rate']);
          ppReportReimburse.PreviewFormSettings.WindowState:=wsMaximized;
          ppReportReimburse.Print;
        end;
        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.M_Normal;
      Main.CloseDb;

  end;
end;

procedure TDailyOrderFeeRpt.edtCariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Trim(edtCari.Text)<>'' then begin
    if Key=#13 then Search;
  end;
end;

procedure TDailyOrderFeeRpt.edtCariChange(Sender: TObject);
begin
//  if Trim(edtCari.Text)='' then begin
//    RefreshData;
//    RefreshGrid;
//  end;
end;

procedure TDailyOrderFeeRpt.Search;
var Count,Count2,Count3,Count4,Count5,Urut:Integer;
    IsTrue:Boolean;
    BBMRp,GasRp,totalOperasi:Integer;
    BBMLiter,GasLiter:Single;
    BBMLiterSingle:Single;

    BBMRp_Budget,BBMRp_SPBU,BBMRp_Reimburse:Integer;
    BBMLiter_Budget,BBMLiter_SPBU,BBMLiter_Reimburse:Single;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All,TotalFeeDriver,TotalFeeBusBoy,TotalTolParkir,TotalTol,
    TotalLain,TotalOvertime,TotalBiaya,TotalBiayaExc,IntBiaya:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse,IntBiayaReimburse,
    TotalTopupBudget, TotalETollBudget, TotalSelisih, TotalBBMBudget, TotalFeeDriver1,
    TotalParkir, TotalTol2, TotalLain2, TotalTotalDriver1, TotalFeeDriver2 , TotalBusboy,
    TotalDriver1_Driver2_Helper, TotalSelisih2, TotalDriver1, TotalTotalDriver1_Driver2_Helper  :Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;
begin
  if Trim(edtCari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    StrGrid.ColCount:=MaxCol+1;
    for Count:=0 to MaxCol do begin
      for Count2:=2 to StrGrid.RowCount+1 do begin    // reset baris ke 3
        StrGrid.Cells[Count,Count2]:='';
        StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
        StrGrid.CellStyle[Count,Count2].Font.Color:=clBlack;
        IntToStr(Count-1);
      end;
    end;

    Count2:=3;
    TotalOperasi:=0;

    for Count:=0 to Length(OrderFeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 58 do
      if (StrPos(PChar(UpperCase(OrderFeeArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
//        StrGrid.Cells[0,Count2-1]:=IntToStr(Count2-2);
        StrGrid.Cells[1,Count2-1]:=OrderFeeArr[Count][0];
        StrGrid.Cells[2,Count2-1]:=OrderFeeArr[Count][1];
        StrGrid.Cells[3,Count2-1]:=OrderFeeArr[Count][2];
        StrGrid.Cells[4,Count2-1]:=OrderFeeArr[Count][3];
        StrGrid.Cells[5,Count2-1]:=OrderFeeArr[Count][4];

        if (OrderFeeArr[Count][44]<>NULL) or (OrderFeeArr[Count][44]<>'') then begin  {employee_id}
          Inc(TotalOperasi);
          StrGrid.Cells[6,Count2-1]:=OrderFeeArr[Count][5];
          StrGrid.Cells[7,Count2-1]:=OrderFeeArr[Count][6];
          StrGrid.Cells[8,Count2-1]:=OrderFeeArr[Count][7];
          StrGrid.Cells[9,Count2-1]:=OrderFeeArr[Count][8];

          //Budget
          if OrderFeeArr[Count][9]<>'0' then begin
            BBMLiter_Budget       :=StrToFloat(OrderFeeArr[Count][9]);
            BBMLiterSingle_Budget :=StrToFloat(OrderFeeArr[Count][9]);
          end else begin
            BBMLiter_Budget:=0; BBMLiterSingle_Budget:=0;
            OrderFeeArr[Count][9]:='0';
          end;


          if OrderFeeArr[Count][10]<>'0' then begin
            BBMRp_Budget:=StrToInt(OrderFeeArr[Count][10]);
          end else begin
             BBMRp_Budget:=0;
          end;
          //SPBU
          if OrderFeeArr[Count][11]<>'0' then begin//StoInt(OrderFeeArr[IntCount][11])<>NULL then begin
            BBMLiter_SPBU       :=StrToFloat(OrderFeeArr[Count][11]);
            BBMLiterSingle_SPBU :=StrToFloat(OrderFeeArr[Count][11]);
          end else begin
            BBMLiter_SPBU:=0; BBMLiterSingle_SPBU:=0;
          end;
          if OrderFeeArr[Count][12]<>'0' then begin
            BBMRp_SPBU:=SToInt(OrderFeeArr[Count][12]);
          end else begin
            BBMRp_SPBU:=0;
          end;
          //Reimburse
          if OrderFeeArr[Count][13]<>'0' then begin
            BBMLiter_Reimburse       :=StrToFloat(OrderFeeArr[Count][13]);
            BBMLiterSingle_Reimburse :=StrToFloat(OrderFeeArr[Count][13]);
          end else begin
            BBMLiter_Reimburse:=0; BBMLiterSingle_Reimburse:=0;
          end;
          if OrderFeeArr[Count][14]<>'0' then begin
            BBMRp_Reimburse:=SToInt(OrderFeeArr[Count][14]);
          end else begin
            BBMRp_Reimburse:=0;
          end;

          BBMLiter:=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
          BBMLiterSingle:=BBMLiterSingle_Budget+BBMLiterSingle_SPBU+BBMLiterSingle_Reimburse;
          BBMRp:=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;

          TotalBBMRp_Budget:=TotalBBMRp_Budget+BBMRp_Budget;
          TotalBBMLiter_Budget:=TotalBBMLiter_Budget+BBMLiter_Budget;
          TotalBBMRp_SPBU:=TotalBBMRp_SPBU+BBMRp_SPBU;
          TotalBBMLiter_SPBU:=TotalBBMLiter_SPBU+BBMLiter_SPBU;
          TotalBBMRp_Reimburse:=TotalBBMRp_Reimburse+BBMRp_Reimburse;
          TotalBBMLiter_Reimburse:=TotalBBMLiter_Reimburse+BBMLiter_Reimburse;

          TotalBBMRp    :=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;
          TotalBBMRp_All:=TotalBBMRp_All+TotalBBMRp;

          TotalBBMLiter :=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
          TotalBBMLiter_All :=TotalBBMLiter_All+TotalBBMLiter;

          TotalFeeDriver:=TotalFeeDriver+(StrToint(OrderFeeArr[Count][16])*StoInt(OrderFeeArr[Count][15]));
          TotalFeeBusBoy:=TotalFeeBusBoy+(SToInt(OrderFeeArr[Count][17])*StoInt(OrderFeeArr[Count][15]));
          TotalTolParkir:=TotalTolParkir+StoInt(OrderFeeArr[Count][18])+ StoInt(OrderFeeArr[Count][78]);
          TotalTol:=TotalTol+StoInt(OrderFeeArr[Count][19])+ StoInt(OrderFeeArr[Count][79]);

          TotalFeeDriverReimburse:=TotalFeeDriverReimburse+(StoInt(OrderFeeArr[Count][20])); //*StoInt(OrderFeeArr[IntCount][15])
          TotalFeeBusBoyReimburse:=TotalFeeBusBoyReimburse+(StoInt(OrderFeeArr[Count][21])); //*StoInt(OrderFeeArr[IntCount][15])
          TotalTolParkirReimburse:=TotalTolParkirReimburse+StoInt(OrderFeeArr[Count][22]);
          TotalTolReimburse:=TotalTolReimburse+StoInt(OrderFeeArr[Count][23]);

          TotalLain:=TotalLain+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81]);
          TotalOvertime:=TotalOvertime+StoInt(OrderFeeArr[Count][25]);

          IntBiaya:=BBMRp+(StoInt(OrderFeeArr[Count][16])*StoInt(OrderFeeArr[Count][15]))+(StoInt(OrderFeeArr[Count][17])*StoInt(OrderFeeArr[Count][15]))+StoInt(OrderFeeArr[Count][18])+StoInt(OrderFeeArr[Count][78]);
          IntBiayaReimburse:=(StoInt(OrderFeeArr[Count][20])) + (StoInt(OrderFeeArr[Count][21])) + //*StoInt(OrderFeeArr[IntCount][15])
                             StoInt(OrderFeeArr[Count][22]) + StoInt(OrderFeeArr[Count][23]);
          TotalBiaya:=TotalBiaya+IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                      +StoInt(OrderFeeArr[Count][78])+StoInt(OrderFeeArr[Count][79])
                      +StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81]);

          TotalBiayaExc:=TotalBiayaExc+IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                      +StoInt(OrderFeeArr[Count][78])+StoInt(OrderFeeArr[Count][79])
                      +StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81])-BBMRp_SPBU+StoInt(OrderFeeArr[Count][25]);

          TotalTopupBudget := TotalTopupBudget+StoInt(OrderFeeArr[Count][50]);
          TotalETollBudget := TotalETollBudget+StoInt(OrderFeeArr[Count][51]);
          TotalSelisih := TotalSelisih+(StoInt(OrderFeeArr[Count][51])-StoInt(OrderFeeArr[Count][50]));

          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[1,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[2,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[4,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[5,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[6,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[7,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[8,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[9,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[10,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[11,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[12,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[13,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[14,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[15,Count2-1].HorizontalAlignment:=taRightJustify;
          {geser 4 kolom}
          StrGrid.CellStyle[16,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[17,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[18,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[19,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[20,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[21,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[22,Count2-1].WordWrap:=True;
          StrGrid.CellStyle[22,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[23,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[24,Count2-1].WordWrap:=True;
          StrGrid.CellStyle[24,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[25,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[26,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[27,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[28,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[29,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[30,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[31,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[32,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[33,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[34,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[35,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[36,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[37,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[38,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[39,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[40,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[41,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[42,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[43,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[44,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[45,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[46,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[47,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[48,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[49,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[50,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[51,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[52,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[53,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[54,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[55,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[56,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[57,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[58,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[59,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[60,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[61,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[62,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[63,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[64,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[65,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[66,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[67,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[67,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[68,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[69,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[70,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[71,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[72,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[73,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[74,Count2-1].HorizontalAlignment:=taRightJustify;

          StrGrid.CellStyle[75,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[76,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[77,Count2-1].HorizontalAlignment:=taRightJustify;

          StrGrid.CellStyle[78,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[79,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[80,Count2-1].HorizontalAlignment:=taRightJustify;

          StrGrid.CellStyle[81,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[82,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[83,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[84,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[85,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[86,Count2-1].HorizontalAlignment:=taLeftJustify;

          if (BBMLiterSingle_Budget=0) then StrGrid.Cells[10,Count2-1]:= '0'
          else StrGrid.Cells[10,Count2-1]:=SToCurr(FloatToStr(BBMLiterSingle_Budget),2);
          StrGrid.Cells[11,Count2-1]:=IToCurr(BBMRp_Budget);
          if (BBMLiterSingle_SPBU=0) then StrGrid.Cells[12,Count2-1]:= '0'
          else StrGrid.Cells[12,Count2-1]:=SToCurr(FloatToStr(BBMLiterSingle_SPBU),2);
          StrGrid.Cells[13,Count2-1]:=IToCurr(BBMRp_SPBU);
          if (BBMLiterSingle_Reimburse=0) then StrGrid.Cells[14,Count2-1]:= '0'
          else StrGrid.Cells[14,Count2-1]:=SToCurr(FloatToStr(BBMLiterSingle_Reimburse),2);
          StrGrid.Cells[15,Count2-1]:=IToCurr(BBMRp_Reimburse);

          if (BBMLiterSingle=0) then StrGrid.Cells[16,Count2-1]:= '0'
          else StrGrid.Cells[16,Count2-1]:=SToCurr(FloatToStr(BBMLiterSingle),2);
          StrGrid.Cells[17,Count2-1]:=IToCurr(BBMRp);

          {Geser 6 kolom}
          StrGrid.Cells[18,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][16])*StoInt(OrderFeeArr[Count][15]));
          StrGrid.Cells[19,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][20]));//*StoInt(OrderFeeArr[IntCount][15])

          StrGrid.Cells[20,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][17])*StoInt(OrderFeeArr[Count][15]));
          StrGrid.Cells[21,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][21]));
          StrGrid.Cells[22,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][18])+StoInt(OrderFeeArr[Count][78]));
          StrGrid.Cells[23,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][22]));

          StrGrid.Cells[24,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][19])+StoInt(OrderFeeArr[Count][79]));
          StrGrid.Cells[25,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][23]));


          StrGrid.Cells[26,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81]));
          StrGrid.Cells[27,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][25]));
          StrGrid.Cells[28,Count2-1]:=IToCurr(IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                                      +StoInt(OrderFeeArr[Count][79])+StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81])+StoInt(OrderFeeArr[Count][25]));
          StrGrid.Cells[29,Count2-1]:=IToCurr(IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                                      +StoInt(OrderFeeArr[Count][79])+StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81])-BBMRp_SPBU+StoInt(OrderFeeArr[Count][25]));
          StrGrid.Cells[30,Count2-1]:=OrderFeeArr[Count][26];

          if (OrderFeeArr[Count][55]='') or (OrderFeeArr[Count][55]='0') then begin
            StrGrid.Cells[57,Count2-1]:='0';
            StrGrid.Cells[58,Count2-1]:='0';
          end else begin
            StrGrid.Cells[57,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][55]));
          end;
          StrGrid.Cells[59,Count2-1]:=OrderFeeArr[Count][56];
          StrGrid.Cells[60,Count2-1]:=OrderFeeArr[Count][57];
          StrGrid.Cells[61,Count2-1]:=OrderFeeArr[Count][58];

          StrGrid.Cells[62,Count2-1]:=OrderFeeArr[Count][68];
          StrGrid.Cells[63,Count2-1]:=OrderFeeArr[Count][65];
          TotalBBMBudget:=TotalBBMBudget+BBMRp_Budget ;
          StrGrid.Cells[64,Count2-1]:=IToCurr(BBMRp_Budget);
          TotalFeeDriver1:=TotalFeeDriver1+(StoInt(OrderFeeArr[Count][59])*StoInt(OrderFeeArr[Count][15]));
          StrGrid.Cells[65,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][59])*StoInt(OrderFeeArr[Count][15]));
          TotalParkir:= TotalParkir+(StoInt(OrderFeeArr[Count][18])+StoInt(OrderFeeArr[Count][22]));
          StrGrid.Cells[66,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][18])+StoInt(OrderFeeArr[Count][22]));
          TotalTol2:= TotalTol2+(StoInt(OrderFeeArr[Count][19])+StoInt(OrderFeeArr[Count][23]));
          StrGrid.Cells[67,Count2-1]:= IToCurr(StoInt(OrderFeeArr[Count][78]));      //Parkir Tamu
          StrGrid.Cells[68,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][19])+StoInt(OrderFeeArr[Count][23]));
          StrGrid.Cells[69,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][79]));;      //Tol Tamu
          //StrGrid.Cells[70,Count]:=IToCurr(StoInt(OrderFeeArr[IntCount][25]));
          TotalLain2:= TotalLain2+(StoInt(OrderFeeArr[Count][24]));//+StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81]));
          StrGrid.Cells[70,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][24]));  //bermalam
          StrGrid.Cells[71,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][80])); //Tips
          StrGrid.Cells[72,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][81])); //Biaya Dari Tamu
          TotalOvertime:=TotalOvertime+(StoInt(OrderFeeArr[Count][25]));
          StrGrid.Cells[73,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][25]));

          TotalDriver1:=BBMRp_Budget+(StoInt(OrderFeeArr[Count][59])*StoInt(OrderFeeArr[Count][15]))
                                      + (StoInt(OrderFeeArr[Count][18])+StoInt(OrderFeeArr[Count][22])+ StoInt(OrderFeeArr[Count][78]))
                                      + (StoInt(OrderFeeArr[Count][19])+StoInt(OrderFeeArr[Count][23])+ StoInt(OrderFeeArr[Count][79]))
                                      +  (StoInt(OrderFeeArr[Count][24]))+ StoInt(OrderFeeArr[Count][80])+ StoInt(OrderFeeArr[Count][81])
                                      + (StoInt(OrderFeeArr[Count][25]));
          TotalTotalDriver1:=TotalTotalDriver1+ TotalDriver1;
          StrGrid.Cells[74,Count2-1]:=IToCurr(TotalDriver1);

          StrGrid.Cells[75,Count2-1]:=OrderFeeArr[Count][69];
          StrGrid.Cells[76,Count2-1]:=OrderFeeArr[Count][66];
          TotalFeeDriver2:=TotalFeeDriver2+(StoInt(OrderFeeArr[Count][60])*StoInt(OrderFeeArr[Count][15]));
          StrGrid.Cells[77,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][60])*StoInt(OrderFeeArr[Count][15]));

          StrGrid.Cells[78,Count2-1]:=OrderFeeArr[Count][70];
          StrGrid.Cells[79,Count2-1]:=OrderFeeArr[Count][67];
          TotalBusboy:=TotalBusboy+(StoInt(OrderFeeArr[Count][61])*StoInt(OrderFeeArr[Count][15]));
          StrGrid.Cells[80,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][61])*StoInt(OrderFeeArr[Count][15]));

          TotalDriver1_Driver2_Helper:= ((StoInt(OrderFeeArr[Count][61])*StoInt(OrderFeeArr[Count][15]))+(StoInt(OrderFeeArr[Count][60])*StoInt(OrderFeeArr[Count][15]))
                                        +TotalDriver1);
          TotalTotalDriver1_Driver2_Helper:=TotalTotalDriver1_Driver2_Helper+TotalDriver1_Driver2_Helper;
          StrGrid.Cells[81,Count2-1]:= IToCurr(TotalDriver1_Driver2_Helper);
          TotalSelisih2:=TotalSelisih2+((IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                                        +StoInt(OrderFeeArr[Count][79])
                                        +StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81])
                                        -BBMRp_SPBU+StoInt(OrderFeeArr[Count][25]))-(TotalDriver1_Driver2_Helper));
          StrGrid.Cells[82,Count2-1]:= IToCurr((IntBiaya+IntBiayaReimburse+StoInt(OrderFeeArr[Count][24])+StoInt(OrderFeeArr[Count][19])
                                        +StoInt(OrderFeeArr[Count][79])
                                        +StoInt(OrderFeeArr[Count][80])+StoInt(OrderFeeArr[Count][81])
                                        -BBMRp_SPBU+StoInt(OrderFeeArr[Count][25]))-(TotalDriver1_Driver2_Helper));

          StrGrid.Cells[83,Count2-1]:= OrderFeeArr[Count][71];
          StrGrid.Cells[84,Count2-1]:= OrderFeeArr[Count][72];
          StrGrid.Cells[85,Count2-1]:= OrderFeeArr[Count][73];
          StrGrid.Cells[86,Count2-1]:= OrderFeeArr[Count][74];

          if OrderFeeArr[Count][27]<>'' then begin
            StrGrid.CellStyle[30,Count2-1].Font.Color:=clBlue;
            StrGrid.CellStyle[31,Count2-1].Font.Color:=clBlue;
          end else begin
            StrGrid.CellStyle[30,Count2-1].Font.Color:=clBlack;
            StrGrid.CellStyle[31,Count2-1].Font.Color:=clBlack;
          end;

          if OrderFeeArr[Count][28]<>'' then StrGrid.Cells[31,Count2-1]:=OrderFeeArr[Count][28];

          if OrderFeeArr[Count][29]<>'' then begin
            StrGrid.CellStyle[32,Count2-1].Font.Color:=clBlue;
            StrGrid.CellStyle[33,Count2-1].Font.Color:=clBlue;
          end else begin
            StrGrid.CellStyle[32,Count2-1].Font.Color:=clBlack;
            StrGrid.CellStyle[33,Count2-1].Font.Color:=clBlack;
          end;
          if OrderFeeArr[Count][30]<>'' then StrGrid.Cells[32,Count2-1]:=OrderFeeArr[Count][30];
          if OrderFeeArr[Count][31]<>'' then StrGrid.Cells[33,Count2-1]:=OrderFeeArr[Count][31];
          if OrderFeeArr[Count][32]<>'' then StrGrid.Cells[34,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][32]));
          if OrderFeeArr[Count][33]<>'' then begin
            StrGrid.Cells[35,Count2-1]:=IToCurr(SToInt(OrderFeeArr[Count][33]));
            StrGrid.Cells[36,Count2-1]:=IToCurr(StoInt(OrderFeeArr[Count][34]));
            if (SToFloat(OrderFeeArr[Count][9]))+(SToFloat(OrderFeeArr[Count][45]))+(SToFloat(OrderFeeArr[Count][11])) >0 then
            begin
              if (SToFloat(OrderFeeArr[Count][55])>0) then
              begin
                StrGrid.Cells[58,Count2-1]:=FloatToStrF(StoInt(OrderFeeArr[Count][55])/TotalBBMLiter,ffNumber,6,2);
              end;
              StrGrid.Cells[37,Count2-1]:=FloatToStrF(StoInt(OrderFeeArr[Count][34])/TotalBBMLiter,ffNumber,6,2);
            end
            else
            begin
              StrGrid.Cells[37,Count2-1]:='0';
              StrGrid.Cells[58,Count2-1]:='0';
            end;
        
          end else begin
            StrGrid.Cells[35,Count2-1]:='';
            StrGrid.Cells[36,Count2-1]:='0';
            StrGrid.Cells[37,Count2-1]:='0';
          end;


          StrGrid.Cells[38,Count2-1]:=OrderFeeArr[Count][35];

          if (OrderFeeArr[Count][36])<>'' then StrGrid.Cells[39,Count2-1]:=(OrderFeeArr[Count][36]);
          if OrderFeeArr[Count][37]<>'' then StrGrid.Cells[40,Count2-1]:=eToll(OrderFeeArr[Count][37]);
          if OrderFeeArr[Count][38]<>'' then StrGrid.Cells[41,Count2-1]:=OrderFeeArr[Count][38];
          if OrderFeeArr[Count][39]>'' then StrGrid.Cells[42,Count2-1]:=OrderFeeArr[Count][39];
          if OrderFeeArr[Count][40]<>'' then StrGrid.Cells[43,Count2-1]:=OrderFeeArr[Count][40];

          if OrderFeeArr[Count][41]<>'' then StrGrid.Cells[44,Count2-1]:=OrderFeeArr[Count][41];
          if OrderFeeArr[Count][42]<>'' then StrGrid.Cells[45,Count2-1]:=OrderFeeArr[Count][42];
          if OrderFeeArr[Count][43]<>'' then StrGrid.Cells[46,Count2-1]:=OrderFeeArr[Count][43];

          if OrderFeeArr[Count][46]<>'' then StrGrid.Cells[47,Count2-1]:=OrderFeeArr[Count][46];
          if OrderFeeArr[Count][47]<>'' then StrGrid.Cells[48,Count2-1]:=OrderFeeArr[Count][47];

          if OrderFeeArr[Count][50]<>'' then StrGrid.Cells[51,Count2-1]:=SToCurr(OrderFeeArr[Count][50]);
          if OrderFeeArr[Count][51]<>'' then StrGrid.Cells[52,Count2-1]:=SToCurr(OrderFeeArr[Count][51]);

          StrGrid.Cells[53,Count2-1]:=  SToCurr(IntToStr(StrToInt(OrderFeeArr[Count][51]) - StrToInt(OrderFeeArr[Count][50])));
          StrGrid.Cells[54,Count2-1]:=  OrderFeeArr[Count][52];
          StrGrid.Cells[55,Count2-1]:=  OrderFeeArr[Count][53];

        end;
        for Count4:=0 to MaxCol do begin
          StrGrid.Cells[0,Count2-1]:=IntToStr(Count2-2);
          if LowerCase(Trim( OrderFeeArr[Count][52] ))<>'completed' then begin
              StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clRed;
          end else begin
              StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clWindowText;
          end;

          if (OrderFeeArr[Count][57]<>'') then begin
             StrGrid.CellStyle[2,Count2-1].Font.Color:=clGreen;
          end;

          StrGrid.CellStyle[79,Count2-1].Font.Color:=clWindowText;
          StrGrid.CellStyle[80,Count2-1].Font.Color:=clWindowText;
          StrGrid.CellStyle[81,Count2-1].Font.Color:=clWindowText;
          StrGrid.CellStyle[82,Count2-1].Font.Color:=clWindowText;

//          StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clWindowText;
        end;
        Inc(Count2);
      end;

    end;

    Main.M_Normal;
  end;
end;

procedure TDailyOrderFeeRpt.btnTombolCariClick(Sender: TObject);
begin
  if Trim(edtCari.Text)<>'' then begin
    Search;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailyOrderFeeRpt.Copy1Click(Sender: TObject);
var
  S: string;
  GRect: TGridRect;
  C, R: Integer;
begin
  GRect := StrGrid.Selection;
  S  := '';
  for R := GRect.Top to GRect.Bottom do
  begin
    for C := GRect.Left to GRect.Right do
    begin
      if C = GRect.Right then  S := S + (StrGrid.Cells[C, R])
      else
        S := S + StrGrid.Cells[C, R] + #9;
    end;
    S := S + #13#10;
  end;
  ClipBoard.AsText := S;
end;


procedure TDailyOrderFeeRpt.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ((Key = 67) or (Key = 99)) and (Shift=[ssCtrl]) then
      Copy1Click(Nil);
end;

procedure TDailyOrderFeeRpt.CekTglInputClick(Sender: TObject);
begin
//  if CekTglInput.Checked=True then CekTglMasuk.Checked:=False;
end;

procedure TDailyOrderFeeRpt.CekTglMasukClick(Sender: TObject);
begin
//   if CekTglMasuk.Checked=True then CekTglInput.Checked:=False;
end;

procedure TDailyOrderFeeRpt.Button1Click(Sender: TObject);
begin
  if Main.IsFormOpen('BrowseCustomer')=False then BrowseCustomer:=TBrowseCustomer.Create(Self,'LaporanUangOrderHarian');
end;

procedure TDailyOrderFeeRpt.BitBtn1Click(Sender: TObject);
begin
  CustomerName.Text:='';
end;

end.
