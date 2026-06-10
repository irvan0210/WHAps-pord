unit WorkOrderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppBands, ppReport, ppSubRpt,
  ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ZColorStringGrid, ExtDlgs;

const
  KolomWidth = 3;   // ? TARUH DI SINI

type
  TWorkOrderForm = class(TForm)
    Report: TQuickRep;
    QRBand3: TQRBand;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QNoPKB: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QNoPolisi: TQRLabel;
    QNoBody: TQRLabel;
    QNoMesin: TQRLabel;
    QTipeKendaraan: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QTanggalJamMasuk: TQRLabel;
    QTanggalJamKeluar: TQRLabel;
    QOdometer: TQRLabel;
    QShift: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRImage4: TQRImage;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRShape3: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRShape11: TQRShape;
    QRShape5: TQRShape;
    QRShape31: TQRShape;
    QDeskripsi: TQRDBText;
    QNo: TQRDBText;
    QRLabel91: TQRLabel;
    QRShape15: TQRShape;
    QRLabel92: TQRLabel;
    QRShape20: TQRShape;
    QRLabel93: TQRLabel;
    QRShape16: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape12: TQRShape;
    QRLabel89: TQRLabel;
    QRShape1: TQRShape;
    QRShape22: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape24: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape14: TQRShape;
    QRShape23: TQRShape;
    QRShape28: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRBand4: TQRBand;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel41: TQRLabel;
    KeluhanGridSebelum: TStringGrid;
    QRLabel47: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    GroupDetail: TGroupBox;
    StrGrid: TStringGrid;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppNoBody: TppLabel;
    ppNoMesin: TppLabel;
    ppOdometer: TppLabel;
    ppTglKeluar: TppLabel;
    ppTglMasuk: TppLabel;
    ppLabel31: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine12: TppLine;
    ppLabel32: TppLabel;
    ppLine13: TppLine;
    ppReprinted: TppLabel;
    ppNoPKB: TppLabel;
    ppLogo: TppImage;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppTipeKendaraan: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppJenisPekerjaan: TppLabel;
    ppLabel33: TppLabel;
    ppLine14: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppKeluhan: TppMemo;
    ppParts: TppMemo;
    ppPekerjaan: TppMemo;
    ppRekomendasi: TppMemo;
    ppWaktu: TppMemo;
    ppTeknisi: TppMemo;
    ppKeterangan: TppMemo;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel17: TppLabel;
    ppAdminBengkel: TppLabel;
    ppKepalaBengkel: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    Memo1: TMemo;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppNoSR: TppLabel;
    PageControl1: TPageControl;
    TabDetail: TTabSheet;
    TabLampiran: TTabSheet;
    GroupNo: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    NoPKB: TEdit;
    Jam: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    NoPolisi: TEdit;
    KMOdo: TEdit;
    NoBody: TEdit;
    NoSR: TEdit;
    PanelCariSR: TPanel;
    CariSR: TSpeedButton;
    PanelCari: TPanel;
    TombolCari: TSpeedButton;
    PanelInOut: TPanel;
    Internal: TRadioButton;
    Eksternal: TRadioButton;
    Label2: TLabel;
    GroupInput: TPanel;
    StartDate: TDateTimePicker;
    FinishDate: TDateTimePicker;
    FinishUnknown: TCheckBox;
    Label4: TLabel;
    Label9: TLabel;
    GroupExternal: TGroupBox;
    GeneralRepair: TCheckBox;
    BodyRepair: TCheckBox;
    Asuransi: TCheckBox;
    grp1: TGroupBox;
    KeluhanDetail: TEdit;
    KeluhanGrid: TStringGrid;
    grp2: TGroupBox;
    StrGrid2: TZColorStringGrid;
    ItemDetail: TEdit;
    Detail: TEdit;
    Qty: TEdit;
    GroupBox2: TGroupBox;
    StrGridMekanik: TZColorStringGrid;
    Mekanik: TEdit;
    StatusMekanik: TComboBox;
    GroupBox3: TGroupBox;
    StrGrid3: TZColorStringGrid;
    Analisa: TEdit;
    Panel3: TPanel;
    PanelMemoKhusus: TPanel;
    MemoKhusus: TCheckBox;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    ScrollBox1: TScrollBox;
    OpenPictureDialog1: TOpenDialog;
    GroupPekerjaan: TGroupBox;
    StrGridPekerjaan: TZColorStringGrid;
    Pekerjaan: TEdit;
    ListMekanik: TListBox;
    ppCheklist: TppMemo;
    GroupInputGambar: TGroupBox;
    TambahFoto: TButton;
    HapusSemuaFoto: TButton;
    SimpanFoto: TButton;
    Approve: TButton;
    Reject: TButton;
    LabStat: TLabel;
    Status: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EksternalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure InternalClick(Sender: TObject);
    procedure KeluhanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure KeluhanDetailExit(Sender: TObject);
    procedure KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanDetailClick(Sender: TObject);
    procedure FinishUnknownClick(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure CariSRClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure MekanikExit(Sender: TObject);
    procedure MekanikKeyPress(Sender: TObject; var Key: Char);
    procedure StatusMekanikExit(Sender: TObject);
    procedure StrGridMekanikSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StrGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AnalisaExit(Sender: TObject);
    procedure AnalisaKeyPress(Sender: TObject; var Key: Char);
    procedure TambahFotoClick(Sender: TObject);
    procedure HapusSemuaFotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SimpanFotoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PekerjaanExit(Sender: TObject);
    procedure PekerjaanKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridPekerjaanSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ListMekanikDblClick(Sender: TObject);
    procedure ApproveClick(Sender: TObject);
    procedure RejectClick(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString7;
    WOArr:Array of TArrString10;
    WODetArr:Array of TArrString2;
    MekanikArr:Array of TArrString5;
    IntRow,IntCol,CompId,MinRow:Integer;
    FormRequest,WorkOrderId,VehicleId,ApiTransTrack,StatusApiTransTrack:String;
    Initiation,IsReadOnly,IsInput:Boolean;
    ListGambar, ListDeskripsi: TStringList;
    procedure CekOtorisasi;
    procedure Otorisasi;
    procedure Init;
    procedure InitGrid;
    procedure InitGrid2;
    procedure InitGrid3;
    procedure InitGrid4;
    procedure InitGridPekerjaan;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure LoadData;
    procedure SetMobil;
    procedure PopOut(Height:Integer);
    procedure PopIn(Height:integer);
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrintData;
    procedure PreparePrint;
    procedure AddDetail;
    procedure Calculate;
    procedure Calculate2;
    procedure CalculatePekerjaan;
    procedure Calculate4;
    procedure SetOdo(License_plate:String);
    procedure ImageRightClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Function  CompressImageToTemp(const SrcFile: string): string;
    procedure RepositionImages;
    function GetImgFiles: TStringList;
    function FileSize(const AFileName: string): Int64;
    procedure SaveAllImagesToDB;
  public
  StrTransId:String;
    { Public declarations }
//    constructor Create(AOwner:TComponent);overload;
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetServiceRequestId(ServiceRequest_Id:String);
    procedure CopyFileOld(const SourceFile, DestFile: string);
    //procedure CompressAndSaveImage(const SrcFile, DestFile: string; MaxWidth, MaxHeight, Quality: Integer);
    procedure ReLayoutImages;
   // procedure ShowSavedImage(const FilePath, Deskripsi: string);
    
    procedure LoadImagesForEdit(WorkOrderId:String);
    procedure ShowImageOnScrollBox(const FilePath, Desc: string);
    //procedure LoadAllImages;
    procedure RefreshMekanik;

  end;

var
  WorkOrderForm: TWorkOrderForm;
  IntRow,IntCol,MinRowGrid,IntMaxRow,MinRow2, IntOtorisasi:Integer;
  CountSpaces: Integer;

implementation

uses MainU, RePrintFormU, AuthorizedFormU, DateUtils,DB,
  VehicleListU, ServiceRequestListU, WorkOrderListU, IdHTTP, IdException, 
  IdStack, uLkJSON, StrUtils, ImageViewerU, pngimage, NoteRejectPKBU;

{$R *.dfm}

constructor TWorkOrderForm.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TWorkOrderForm.SetOdo(License_plate:String);
var
  js : TlkJSONbase;
	IdHTTP: TIdHTTP;
 resp: TMemoryStream;
 url: String;
begin
 IdHTTP := TIdHTTP.Create(Self);
 resp := TMemoryStream.Create;
 url:='http://'+ApiTransTrack+'/api_transtrack/vehicle.php?plate='+License_plate;
// url:='http://api.whitehorse.co.id/api_transtrack/vehicle.php?plate=B7265PGA';
 IdHTTP.Get(url, resp);
 resp.Position := 0;
 Memo1.Lines.LoadFromStream(resp);
  js := TlkJSON.ParseText(Memo1.Text);
  if Assigned(js) then
  begin
//    js := js.Field['kmodo'];
//    if Assigned(js) then
//    begin
//      js := js.Field['devices'];
//      if Assigned(js) then
//      begin
//        js := js.Field['view'];
//        if Assigned(js) then
           KMOdo.Text:=(VarToStr(js.Value));
//      end;
//    end;
  end;
end;

procedure TWorkOrderForm.CekOtorisasi;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select * from wh_user_auth_form '+
            'where form_id= ''150311'' and user_id='+QuotedStr(User)+' and active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0  then begin
      IntOtorisasi:=1;
      MemoKhusus.Enabled:=True;
    end else begin
      IntOtorisasi:=0;
      MemoKhusus.Enabled:=False;
    end;
    Qry.Close;

  end;
  Qry.Destroy;
  Main.CloseDb;
end;

procedure TWorkOrderForm.Otorisasi;
var StrQry:String;
    Qry:TADOQuery;
begin
  if IntOtorisasi=1  then begin
    Approve.Enabled:=True;
    Reject.Enabled:=True;
    MemoKhusus.Enabled:=True;
  end else begin
    Approve.Enabled:=False;
    Reject.Enabled:=False;
    MemoKhusus.Enabled:=False;
  end;
end;

procedure TWorkOrderForm.Init;
var StrQry:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  NoPKB.Text:='';
  Jam.Text:='';
  NoBody.Text:='';
  NoSR.Text:='';
  NoPolisi.Text:='';
  KMOdo.Text:='';
  KeluhanDetail.Text:='';
  Eksternal.Checked:=True;
  PanelMemoKhusus.Visible:=False;
//  GroupExternal.Enabled:=True;
  GeneralRepair.Checked:=False;
  BodyRepair.Checked:=False;
  Asuransi.Checked:=False;
  Simpan.Enabled:=True;
  Approve.Enabled:=False;
  Reject.Enabled:=False;
  CetakUlang.Enabled:=False;
  KeluhanDetail.Visible:=False;
  QNoPolisi.Caption:='';
  QNoPKB.Caption:='';
  QNoBody.Caption:='';
  QNoPolisi.Caption:='';
  QTipeKendaraan.Caption:='';
  QTanggalJamMasuk.Caption:='';
  QTanggalJamKeluar.Caption:='';
  QOdometer.Caption:='';
  QShift.Caption:='';
  MinRow:=0;
  MinRow2:=0;
  KeluhanGridSebelum.Visible:=False;
  FinishDate.Date:=IncDay(Now,1);
  StartDate.Date:=Now();
  IntMaxRow:=8;
  IntCol:=0;
  IntRow:=0;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select * FROM wh_api_trans_track;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      ApiTransTrack:=Qry.FieldValues['api_trans_track'];
      StatusApiTransTrack:=Qry.FieldValues['status'];
    end;
  end;
end;

procedure TWorkOrderForm.InitGrid;
var IntCount,IntCount2:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Odo Msk';
  StrGrid.Cells[4,0]:='Pekerjaan';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  for IntCount:=1 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount2,IntCount]:='';
  for IntCount:=0 to KeluhanGrid.RowCount-1 do
    KeluhanGrid.Cells[0,IntCount]:='';
    KeluhanGrid.Cells[1,IntCount]:='';
  KeluhanGrid.RowCount:=MinRow+1;
//  KeluhanGridSebelum.RowCount:=1;
//  KeluhanGridSebelum.Cells[0,0]:='';
end;

procedure TWorkOrderForm.InitGrid2;
var IntCount:Integer;
begin
  StrGrid2.RowCount:=2;
  StrGrid2.ColWidths[0]:=20;
  StrGrid2.ColWidths[1]:=250;
  StrGrid2.ColWidths[2]:=40;
  StrGrid2.ColWidths[3]:=0;
  StrGrid2.Cells[0,0]:='No';
  StrGrid2.Cells[1,0]:='Part';
  StrGrid2.Cells[2,0]:='Jumlah';
  StrGrid2.Cells[3,0]:='Kode Part';
  StrGrid2.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid2.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid2.CellStyle[2,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 3 do begin
    StrGrid2.Cells[IntCount,1]:='';
    StrGrid2.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid2.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGrid2.CellStyle[2,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderForm.InitGrid3;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=2;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=420;

  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Analisa';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid3.Cells[IntCount,1]:='';
    StrGrid3.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderForm.InitGrid4;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGridMekanik.RowCount-1 do
    for IntCount2:=0 to StrGridMekanik.ColCount-1 do
      StrGridMekanik.Cells[IntCount2,IntCount]:='';

  StrGridMekanik.RowCount:=2;
  StrGridMekanik.ColWidths[0]:=20;
  StrGridMekanik.ColWidths[1]:=80;
  StrGridMekanik.ColWidths[2]:=160;

  StrGridMekanik.Cells[0,0]:='No';
  StrGridMekanik.Cells[1,0]:='Status';
  StrGridMekanik.Cells[2,0]:='Mekanik';
  StrGridMekanik.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridMekanik.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridMekanik.CellStyle[2,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGridMekanik.Cells[IntCount,1]:='';
    StrGridMekanik.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderForm.InitGridPekerjaan;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGridPekerjaan.RowCount-1 do
    for IntCount2:=0 to StrGridPekerjaan.ColCount-1 do
      StrGridPekerjaan.Cells[IntCount2,IntCount]:='';

  StrGridPekerjaan.RowCount:=2;
  StrGridPekerjaan.ColWidths[0]:=20;
  StrGridPekerjaan.ColWidths[1]:=420;

  StrGridPekerjaan.Cells[0,0]:='No';
  StrGridPekerjaan.Cells[1,0]:='Perintah Kerja';
  StrGridPekerjaan.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridPekerjaan.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGridPekerjaan.Cells[IntCount,1]:='';
    StrGridPekerjaan.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderForm.Calculate;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid2.RowCount-1 do
    if (Trim(StrGrid2.Cells[1,IntCount])<>'') and (Trim(StrGrid2.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid2.Cells[0,IntCount]:=IntToStr(IntNum);
    end else
      StrGrid2.Cells[0,IntCount]:='';
end;

procedure TWorkOrderForm.Calculate2;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid3.RowCount-1 do
    if (Trim(StrGrid3.Cells[1,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid3.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGrid3.Cells[0,IntCount]:='';
end;

procedure TWorkOrderForm.CalculatePekerjaan;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGridPekerjaan.RowCount-1 do
    if (Trim(StrGridPekerjaan.Cells[1,IntCount])<>'') then begin
      Inc(IntNum);
      StrGridPekerjaan.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGridPekerjaan.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGridPekerjaan.Cells[0,IntCount]:='';
end;

procedure TWorkOrderForm.Calculate4;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGridMekanik.RowCount-1 do
    if (Trim(StrGridMekanik.Cells[1,IntCount])<>'') and (Trim(StrGridMekanik.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGridMekanik.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGridMekanik.Cells[0,IntCount]:='';
end;

procedure TWorkOrderForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      WOArr[IntCount][4]:=Qry.FieldValues['odo_in'];
      WOArr[IntCount][5]:=Qry.FieldValues['job_inout'];
      WOArr[IntCount][6]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][7]:=Qry.FieldValues['time_in'];
      if Qry.FieldValues['date_out']<>NULL then WOArr[IntCount][9]:=Qry.FieldValues['date_out'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderForm.SetVehicleId(Vehicle_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Vehicle_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        VehicleId:=Vehicle_Id;
        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);

       { if (CompanyId='2') AND (StatusApiTransTrack='1') then begin
          SetOdo(Qry.FieldValues['license_plate']);
          if KMOdo.Text='0' then
          begin
            if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
          end;
        end else
        begin
            if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
        end;}

         if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    PanelCariSR.Enabled:=False;
    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TWorkOrderForm.SetServiceRequestId(ServiceRequest_Id:String);
var StrQry,Vehicle_Id:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  if ServiceRequest_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetServiceRequestDetail '+QuotedStr(ServiceRequest_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if (Qry.RecordCount>0) then begin
        NoSR.Text:=Qry.FieldValues['service_request_id'];
        VehicleId:=Qry.FieldValues['vehicle_id'];

        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);

        if (CompanyId='2') AND (StatusApiTransTrack='1') then begin
          SetOdo(Qry.FieldValues['license_plate']);
        end else
        begin
          KMOdo.Text:='0';
        end;
        NoBody.Text:=Qry.FieldValues['body_id'];
        StartDate.DateTime:=StrToDate(Qry.FieldValues['from_date']);
        if Qry.FieldValues['to_date']<> NULL then FinishDate.DateTime:=StrToDate(Qry.FieldValues['to_date']);
        if Qry.FieldValues['ismemo_khusus']=1 then
        begin
          PanelMemoKhusus.Visible:=True;
          MemoKhusus.Checked:=True;
        end else
        begin
          PanelMemoKhusus.Visible:=False;
          MemoKhusus.Checked:=False;
        end;
      end;
      Qry.Close;
      StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequest_Id)+',1;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if KeluhanGrid.RowCount<IntCount+2 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
        KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
        KeluhanGrid.Cells[1,IntCount]:=Qry.FieldValues['driver_complain_detail_id'];
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;


      if KMOdo.Text='0' then
      begin
        StrQry:='EXEC GetVehicleDetail '+QuotedStr(VehicleId)+' ;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if (Qry.RecordCount>0) then begin
          if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
        end;
        Qry.Close;
      end;

      //Mekanik
      StrQry:='';
      StrQry:='select * from wh_service_request_mekanik where service_request_id='+QuotedStr(ServiceRequest_Id)+' AND '+
      'status=1 ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=1;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin

        if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
        StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGridMekanik.Cells[1,IntCount]:= Qry.FieldValues['status_mekanik'];
        StrGridMekanik.Cells[2,IntCount]:= Qry.FieldValues['name'];
        StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry.Next;
        Inc(IntCount);

      end;
      Qry.Close;

      //ANALISA
      StrQry:='';
      StrQry:='select description from wh_service_request_detail where service_request_id='+QuotedStr(ServiceRequest_Id)+' AND '+
      'service_description_id=3 and status=1 ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=1;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin

        if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
        StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid3.Cells[1,IntCount]:= Qry.FieldValues['description'];
        StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry.Next;
        Inc(IntCount);

      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    PanelCari.Enabled:=False;
    Internal.Checked:=True;
    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TWorkOrderForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntAddRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(WorkOrderId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
       //Otorisasi
      if (Qry.FieldValues['approve']=2) then begin
        LabStat.Visible := True;
        Status.Visible:=True;
        Status.Caption:='DITOLAK';
        Status.Font.Color:=clRed;
        CetakUlang.Enabled:=False;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        Simpan.Enabled:=False;
      end else if (Qry.FieldValues['approve']=1) then begin
        LabStat.Visible := True;
        Status.Visible:=True;
        Status.Caption:='DISETUJUI';
        Status.Font.Color:=clGreen;
        CetakUlang.Enabled:=True;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        Simpan.Enabled:=False;
      end else if (IntOtorisasi=1) then begin
        LabStat.Visible := True;
        Status.Visible:=True;
        Status.Caption:='DIAJUKAN';
        Status.Font.Color:=clBlack;
        Simpan.Enabled:=True;
        Reject.Enabled:=True;
        Approve.Enabled:=True;
        CetakUlang.Enabled:=False;
      end else begin
        LabStat.Visible := True;
        Status.Visible:=True;
        Status.Caption:='DIAJUKAN';
        Status.Font.Color:=clBlack;
        Simpan.Enabled:=True;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        CetakUlang.Enabled:=False;
      end;

       //End otorisasi
      VehicleId:=Qry.FieldValues['vehicle_id'];
      NoBody.Text:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
      NoPKB.Text:=Qry.FieldValues['work_order_id'];
      if Qry.FieldValues['service_request_id']=NULL then  NoSR.Text:='' else
      NoSR.Text:= Qry.FieldValues['service_request_id'];
      StartDate.Date:=StrToDate(Qry.FieldValues['date_in']);
      Jam.Text:=Qry.FieldValues['time_in'];
      if Qry.FieldValues['date_out']<>NULL then begin
        FinishDate.Date:=StrToDate(Qry.FieldValues['date_out']);
        FinishUnknown.Checked:=False;
      end else FinishUnknown.Checked:=True;
      if Qry.FieldValues['job_inout']='Internal' then Internal.Checked:=True;
      if Qry.FieldValues['job_inout']='Eksternal' then Eksternal.Checked:=True;
      if Qry.FieldValues['general_repair']=1 then GeneralRepair.Checked:=True;
      if Qry.FieldValues['body_repair']=1 then BodyRepair.Checked:=True;
      if Qry.FieldValues['insurance']=1 then Asuransi.Checked:=True;
      if Qry.FieldValues['ismemo_khusus']=1 then
      begin
        PanelMemoKhusus.Visible:=True;
        MemoKhusus.Checked:=True;
      end else
      begin
        PanelMemoKhusus.Visible:=False;
        MemoKhusus.Checked:=False;
      end;
    end;
    Qry.Close;
//    KeluhanGridSebelum.Visible:=True;
//    KeluhanGrid.Height:=KeluhanGrid.Height-KeluhanGridSebelum.Height;
//    KeluhanGrid.Top:=KeluhanGridSebelum.Top+KeluhanGridSebelum.Height;
//    KeluhanGridSebelum.RowCount:=1;
    IntAddRow:=0;
    StrQry:='select description, driver_complain_detail_id from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=1 and status=1 ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
      KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
      if Qry.FieldValues['driver_complain_detail_id']<> null then
        KeluhanGrid.Cells[1,IntCount]:=Qry.FieldValues['driver_complain_detail_id']
      else  KeluhanGrid.Cells[1,IntCount]:='';
      Qry.Next;
      Inc(IntCount);
    end;
    if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
    MinRow:=IntCount;
    Qry.Close;

    //PARTS
    StrQry:='SELECT a.* FROM wh_tanda_terima_detail a '+
            'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
            'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
            'WHERE c.no_request='+QuotedStr(NoSR.Text)+' AND a.status=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGrid2.RowCount<IntCount+1 then StrGrid2.RowCount:=StrGrid2.RowCount+1;
      StrGrid2.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid2.Cells[1,IntCount]:=Qry.FieldValues['item_detail'];
      StrGrid2.Cells[2,IntCount]:=Qry.FieldValues['qty'];
      StrGrid2.Cells[3,IntCount]:=Qry.FieldValues['kode_part_gp'];
      Qry.Next;
      Inc(IntCount);
    end;
    if StrGrid2.RowCount<IntCount+1 then StrGrid2.RowCount:=StrGrid2.RowCount+1;
    MinRow2:=IntCount;
    Qry.Close;

    //Mekanik
    StrQry:='';
    StrQry:='select * from wh_work_order_mekanik where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'status=1 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin

      if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGridMekanik.Cells[1,IntCount]:= Qry.FieldValues['status_mekanik'];
      StrGridMekanik.Cells[2,IntCount]:= Qry.FieldValues['name'];
      StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
      StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry.Next;
      Inc(IntCount);

    end;
    Qry.Close;

    //ANALISA
    StrQry:='';
    StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=3 and status=1 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin

      if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
      StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid3.Cells[1,IntCount]:= Qry.FieldValues['description'];
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry.Next;
      Inc(IntCount);

    end;

     //Pekerjaan
    StrQry:='';
    StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=2 and status=1 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin

      if StrGridPekerjaan.RowCount<IntCount+1 then StrGridPekerjaan.RowCount:=StrGridPekerjaan.RowCount+1;
      StrGridPekerjaan.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGridPekerjaan.Cells[1,IntCount]:= Qry.FieldValues['description'];
      StrGridPekerjaan.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGridPekerjaan.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry.Next;
      Inc(IntCount);

    end;

    //Gambar
    StrQry:='';
    StrQry:='select count(*) from wh_work_order_image where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=1 and status=1 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then begin
       LoadImagesForEdit(WorkOrderId);
    end;

   // LoadAllImages;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderForm.AddDetail;
begin
    if NoPKB.Text<>'' then begin
      DisableInput;
      IsInput:=True;
      Simpan.Enabled:=True;
      KeluhanGrid.Enabled:=True;
      TambahFoto.Enabled := True;
      HapusSemuaFoto.Enabled := True;
      ScrollBox1.Enabled := True;
    end;
end;

procedure TWorkOrderForm.SelesaiClick(Sender: TObject);
begin
  WorkOrderForm.Close;
end;

procedure TWorkOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
begin
  // Hapus semua image + label
  for i := ScrollBox1.ControlCount - 1 downto 0 do
    ScrollBox1.Controls[i].Free;

  // Kosongkan list (JANGAN Free kalau dibuat di FormCreate)
  ListGambar.Clear;
  ListDeskripsi.Clear;
  Action:=caFree;
end;

procedure TWorkOrderForm.EksternalClick(Sender: TObject);
begin
  if Eksternal.Checked then begin
//    PopOut(GroupExternal.Height);
//    GroupExternal.Enabled:=True;
//    GroupExternal.Visible:=True;
  end;
end;

procedure TWorkOrderForm.InternalClick(Sender: TObject);
begin
  if Internal.Checked then begin
//    GroupExternal.Enabled:=False;
//    GroupExternal.Visible:=False;
//    PopIn(GroupExternal.Height);
  end;
end;

procedure TWorkOrderForm.PopOut(Height:Integer);
begin
  KeluhanGrid.Top:=KeluhanGrid.Top+Height;
//  LabelKeluhan.Top:=LabelKeluhan.Top+Height;
  Simpan.Top:=Simpan.Top+Height;
  Bersihkan.Top:=Bersihkan.Top+Height;
  CetakUlang.Top:=CetakUlang.Top+Height;
  Selesai.Top:=Selesai.Top+Height; 
  Self.Height:=Self.Height+Height;
  GroupDetail.Top:=GroupDetail.Top+Height;
end;

procedure TWorkOrderForm.PopIn(Height:Integer);
begin
  KeluhanGrid.Top:=KeluhanGrid.Top-Height;
//  LabelKeluhan.Top:=LabelKeluhan.Top-Height;
  Simpan.Top:=Simpan.Top-Height;
  Bersihkan.Top:=Bersihkan.Top-Height;
  CetakUlang.Top:=CetakUlang.Top-Height;
  Selesai.Top:=Selesai.Top-Height; 
  Self.Height:=Self.Height-Height;
  GroupDetail.Top:=GroupDetail.Top-Height;  
end;

procedure TWorkOrderForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGrid2;
  InitGrid3;
  InitGrid4;
  InitGridPekerjaan;
  CekOtorisasi;
  if FormRequest<>'Buka PKB' then
  begin
//    WorkOrderForm.Width:='1059';
    GroupDetail.Visible:=True;
//    RefreshCombo;
//    RefreshGrid;
  end else
  begin
//    WorkOrderForm.Width:='678';
    GroupDetail.Visible:=False;
  end;

  if WorkOrderId<>'' then begin
    Otorisasi;
    LoadData;
//    TambahDetail.Enabled:=False;
  end else begin
//StrGrid.Cells[0,IntRow]    TambahDetail.Enabled:=False;
  end;
  if IsReadOnly then begin
    DisableInput;
    IsInput:=False;
  end;
  if UpperCase(FormRequest)='MAIN-ADDDETAIL' then begin
    AddDetail;
  end;
  PageControl1.ActivePage := TabDetail;


end;

procedure TWorkOrderForm.SetMobil;
begin
  if NoBody.Text<>'' then begin
//    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
//    KMOdo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][5]);
  end;
end;

procedure TWorkOrderForm.NoBodyChange(Sender: TObject);
begin
{  if Trim(NoBody.Text)<>'' then begin
    TambahDetail.Enabled:=False;
    SimpanDetail.Enabled:=False;
  end;
}
  SetMobil;
end;

procedure TWorkOrderForm.KeluhanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntCol:=ACol;
  IntRow:=ARow;
  if (ACol = 0) and (IntRow>=MinRow) and (IsInput) then begin
    R := KeluhanGrid.CellRect(IntCol, IntRow);
    R.Left := R.Left + KeluhanGrid.Left;
    R.Right := R.Right + KeluhanGrid.Left;
    R.Top := R.Top + KeluhanGrid.Top;
    R.Bottom := R.Bottom + KeluhanGrid.Top;
    with KeluhanDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(KeluhanGrid.Cells[IntCol,IntRow])<>'' then KeluhanDetail.Text:=KeluhanGrid.Cells[IntCol,IntRow];
    end;
  end;

end;

procedure TWorkOrderForm.KeluhanDetailExit(Sender: TObject);
begin
  if Trim(KeluhanDetail.Text)<>'' then  KeluhanGrid.Cells[KeluhanGrid.Col,KeluhanGrid.Row]:=KeluhanDetail.Text;
  KeluhanDetail.Visible := False;
  KeluhanDetail.Text:='';
  KeluhanGrid.SetFocus;
end;

procedure TWorkOrderForm.KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    KeluhanDetailExit(nil);
    if KeluhanGrid.Row=KeluhanGrid.RowCount-1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1; 
    KeluhanGrid.Row:=KeluhanGrid.Row+1;
  end;
  if (Key=#27) then begin
    KeluhanDetailExit(nil);
  end;
end;

procedure TWorkOrderForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrKMOdo,StrGenRep,StrBodRep,StrAnalisa,StrAnsur,StrMsg,StrEMsg,StrPekerjaan,
    StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrFinishDates,
    StrDescription,StrServiceRequestDetailId,StrServiceRequestId,StrPart,
    StrQty,StrQry2,StrKodePart,StrMekanik,StrStatusMekanik, HexData, FilePath:String;
    IntCount,IntJobInEx,I:Integer;
    IsOk,IsCetak:Boolean;
    ADate,AMonth,AYear:Word;
    TglMulai, TglSelesai:TDateTime;
    ImgJPG: TJPEGImage;
    StmImage: TMemoryStream;
    SrcFile, DestDir, DestFile, FileNameOnly, FileExt, Deskripsi, ServerPath: string;
    ImageName,StrException, CompressedFile :String;
begin

  Main.M_Busy;
  if (NoBody.Text<>'') AND ((Internal.Checked) OR (Eksternal.Checked)) AND
  (Trim(KeluhanGrid.Cells[0,0])<>'')  then begin
    IsOk:=True;
    IsCetak:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    ImgJPG := TJPEGImage.Create;
    StmImage := TMemoryStream.Create;

    TglMulai    := StartDate.Date;
    TglSelesai  := FinishDate.Date;
    if (TglMulai > TglSelesai) then begin
        MessageBox(0,'Tolong perhatikan tanggal mulai dan tanggal selesai yang diinput!!!','Input PKB',MB_OK or MB_ICONWARNING);
        exit;
    end;

    if Main.OpenDb then begin
      Main.TransStart;
      Main.WriteLog('Form Save:WorkOrderForm',1);
      StrMsg:='';
      StrEMsg:='';
      if Trim(NoSR.Text)<>'' then StrServiceRequestId:=QuotedStr(Trim(NoSR.Text)) else StrServiceRequestId:='NULL';
      if Internal.Checked then IntJobInEx:=1 else if Eksternal.Checked then IntJobInEx:=2;
      StrVhcId:=QuotedStr(VehicleId);
      StrKMOdo:=ToString(KMOdo.Text);
      if FinishUnknown.Checked=True then begin
        StrFinishDate:='NULL';
        DecodeDate(StartDate.Date,AYear,AMonth,ADate);
        StrFinishDates:=QuotedStr(FormatDateTime('yyyy/mm/dd',EndOfAMonth(AYear,AMonth)));
      end else begin
        StrFinishDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date));
        StrFinishDates:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date));
      end;
      StrStartDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StartDate.Date));
      if GeneralRepair.Checked then StrGenRep:='1' else StrGenRep:='0';
      if BodyRepair.Checked then StrBodRep:='1' else StrBodRep:='0';
      if Asuransi.Checked then StrAnsur:='1' else StrAnsur:='0';
//      StrQry:='SELECT * FROM wh_reserved_order_detail WHERE (vehicle_id='+StrVhcId+') AND ('+StrStartDate+' BETWEEN from_date AND to_date) AND (status=1)';
      StrQry:='EXEC GetReservedOrderList 2,@Finish=7,@OutDate='+StrStartDate+',@ToDate='+StrFinishDates+',@VehicleId='+StrVhcId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        IsOk:=False;
      end;
      Qry.Close;
      if IsOk then begin
        if WorkOrderId='' then begin
          Qry.SQL.Clear;
          StrQry:='SELECT RIGHT(MAX(work_order_id),4) AS max_id FROM wh_work_order WHERE work_order_id '+
                  'LIKE '+Chr(39)+'PKB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrMaxId:=Qry.FieldValues['max_id'];
            StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
          end else
            StrMaxId:='0001';
          StrTransId:='PKB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
          StrQry:='INSERT INTO wh_work_order (work_order_id,service_request_id,vehicle_id,job_inex_id,odo_in,date_in'+
                  ',time_in,date_out,general_repair,body_repair,insurance,update_user,create_user,create_date)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+StrServiceRequestId+
                  ','+StrVhcId+','+IntToStr(IntJobInEx)+','+StrKMOdo+','+StrStartDate+',GETDATE()'+
                  ','+StrFinishDate+','+StrGenRep+','+StrBodRep+','+StrAnsur+','+Chr(39)+User+Chr(39)+', '+Chr(39)+User+Chr(39)+',GETDATE());';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan PKB';
              StrEMsg:=E.Message;
            end;
          end;
          StrQry:='INSERT INTO wh_vhc_hold (vehicle_id,form_name,form_id,reason,update_user)'+
                  ' VALUES ('+StrVhcId+','+Chr(39)+'PKB'+Chr(39)+
                  ','+Chr(39)+StrTransId+Chr(39)+','+Chr(39)+'Armada Dalam Daftar PKB'+Chr(39)+
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
              StrEMsg:=E.Message;
            end;
          end;
        end else begin
          StrTransId:=WorkOrderId;
         
        end;

        StrQry:='';
        for IntCount:=MinRow to KeluhanGrid.RowCount-1 do begin
          StrDescription:=QuotedStr(KeluhanGrid.Cells[0,IntCount]);
          StrServiceRequestDetailId := QuotedStr(KeluhanGrid.Cells[1,IntCount]);
          if Trim(KeluhanGrid.Cells[0,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,update_user,isdone,driver_complain_detail_id)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrDescription+
                    ','+QuotedStr(User)+',0,'+StrServiceRequestDetailId+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menyimpan Keluhan';
            StrEMsg:=E.Message;
          end;
        end;

        //Analisa
        StrQry:='Update wh_work_order_detail set status=0 where work_order_id='+QuotedStr(StrTransId)+' and description_id=3';
        StrAnalisa:='';
        for IntCount:=1 to StrGrid3.RowCount-1 do begin
          StrAnalisa:= StrGrid3.Cells[1,IntCount];
          if Trim(StrGrid3.Cells[1,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id,description,status,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',3,'+QuotedStr(StrAnalisa)+
                    ',1,'+QuotedStr(User)+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;

      //Pekerjaan
        StrQry:='Update wh_work_order_detail set status=0 where work_order_id='+QuotedStr(StrTransId)+' and description_id=2;';
        //StrPekerjaan:='';
        for IntCount:=1 to StrGridPekerjaan.RowCount-1 do begin
          //StrSRDetailID := QuotedStr(KeluhanGrid.Cells[2,IntCount]);
          if Trim(StrGridPekerjaan.Cells[0,IntCount])<>'' then
          StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                  ',description,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+',2'+
                  //','+Chr(39)+PekerjaanGrid.Cells[0,IntCount]+Chr(39)+
                  ','+Chr(39)+StrGridPekerjaan.Cells[1,IntCount]+Chr(39)+
                  ','+Chr(39)+User+Chr(39)+
                  '); ';
        end;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menyimpan Detail Pekerjaan';
            StrEMsg:=E.Message;
          end;
        end;


        //Mekanik
        StrQry:='';
        StrMekanik:='';
        StrStatusMekanik:='';

         if (StrTransId<>'') then
        StrQry:='UPDATE wh_work_order_mekanik SET status=0 '+
                ' WHERE work_order_id='+QuotedStr(StrTransId)+';';
        for IntCount:=1 to StrGridMekanik.RowCount-1 do begin
          StrStatusMekanik := StrGridMekanik.Cells[1,IntCount];
          StrMekanik:= StrGridMekanik.Cells[2,IntCount];
          if Trim(StrGridMekanik.Cells[2,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_mekanik (work_order_id,name,status_mekanik,status)'+
                    ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrMekanik)+','+QuotedStr(StrStatusMekanik)+
                    ',1); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;
        StrQry:='';


        if (StrTransId<>'') then
        StrQry:='UPDATE wh_work_order_part SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+';';
        for IntCount:=1 to StrGrid2.RowCount-1 do begin
          StrPart:=QuotedStr(StrGrid2.Cells[1,IntCount]);
          StrQty:=QuotedStr(StrGrid2.Cells[2,IntCount]);
          StrKodePart:=QuotedStr(StrGrid2.Cells[3,IntCount]);
          if StrGrid2.Cells[2,1]<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_part (work_order_id,part_name'+
                    ',qty,status,kode_part_gp)'+
                    ' VALUES ('+QuotedStr(StrTransId)+
                    ','+StrPart+
                    ','+StrQty+',1,'+StrKodePart+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menyimpan Keluhan';
            StrEMsg:=E.Message;
          end;
        end;

      {  //FOTO
        if (StrTransId<>'') then
        StrQry:='UPDATE wh_work_order_image_new SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+';';

        //ServerPath := ExtractFilePath(Application.ExeName) + '\\192.168.10.247\WHAps\WorkImages\';
        ServerPath := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'WorkImages\';
        for I := 0 to ListGambar.Count - 1 do
        begin
          SrcFile := ListGambar[I];          // ambil path gambar
          Deskripsi := ListDeskripsi[I]; // ambil deskripsi sesuai urutan
          // Cek apakah file masih ada
          if not FileExists(SrcFile) then
          begin
            ShowMessage('File tidak ditemukan: ' + SrcFile);
            Continue;
          end;

          // Buat nama baru agar unik di folder server
          FileNameOnly := ChangeFileExt(ExtractFileName(SrcFile), '');
          FileExt := ExtractFileExt(SrcFile);
          DestFile := ServerPath+FormatDateTime('yyyymmdd_hhnnss_', Now) + FileNameOnly + FileExt;

          try
            // Salin file ke folder server
            //CopyFileOld(SrcFile, DestFile);
            CompressAndSaveImage(SrcFile, DestFile, 1024, 768, 80);
          except
            on E: Exception do
            begin
              ShowMessage('Gagal menyalin file: ' + E.Message);
              Continue;
            end;
          end;


          // Simpan ke database hanya path + deskripsi
          StrQry:=StrQry+' INSERT INTO wh_work_order_image'+
                          '(work_order_id,image_name, image_path, description, description_id, status, update_time, update_user) ' +
                          'VALUES (' +
                            QuotedStr(StrTransId) + ',' +
                            QuotedStr(DestFile) + ',' +
                            QuotedStr(ServerPath) + ',' +
                            QuotedStr(Deskripsi) + ',1,' +
                            ' 1,GETDATE(), ' +
                            QuotedStr(User) + ');';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,5);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menyimpan Gambar';
            StrEMsg:=E.Message;
          end;
        end;  }

            //simpan gambar
        if (StrTransId<>'') then
        StrQry:='UPDATE wh_work_order_image SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+';';
          //SaveImagesToDB;
       for I := 0 to ListGambar.Count - 1 do
        begin
           StmImage.LoadFromFile(ListGambar[I]);
           StmImage.Position := 0;
        // Compress otomatis
         // CompressImageToStream(ListGambar[I],StmImage,1280,1280,70);
          ImageName := ExtractFileName(ListGambar[I]);
          StrQry := StrQry+'INSERT INTO wh_work_order_image '+
            '(work_order_id, description_id, image_name, image, description, status, update_time, update_user) '+
            'VALUES ('+QuotedStr(StrTransId)+', 1, :p_name, :p_img, :p_desc, 1, GETDATE(), :usr);';

          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
         // Qry.Parameters.ParamByName('wo').Value  := StrTransId;
          Qry.Parameters.ParamByName('p_name').Value := ImageName;
          Qry.Parameters.ParamByName('p_desc').Value := ListDeskripsi[I];
          Qry.Parameters.ParamByName('usr').Value := User;
          Qry.Parameters.ParamByName('p_img').LoadFromStream(StmImage, ftBlob);

          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menambah Memo';
              StrException:=E.Message;
            end;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          DisableInput;
          if WorkOrderId='' then begin
            StrQry:='SELECT CONVERT(VARCHAR(5),time_in,108) AS time_in FROM wh_work_order WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
            Qry.Close;
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.RecordCount>0 then begin
              NoPKB.Text:=StrTransId;
              Jam.Text:=Qry.FieldValues['time_in'];
            end;
            Qry.Close;
          end;
          if StrTransId<>'' then  begin
            Otorisasi;
            MessageBox(0,PChar('Berhasil menyimpan PKB'),'Buka PKB',MB_OK );
            Simpan.Enabled := False;
            IsCetak:=True;
          end;

           // if MessageBox(0,'PKB berhasil disimpan, Mau Dicetak ?','Buka PKB',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then IsCetak:=True;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka PKB',MB_OK or MB_ICONERROR);
        end;
        if IsOk AND IsCetak then begin
         // RePrint(StrTransId);
          Qry.Close;
        end;
        FreeAndNil(Qry);
      end else begin
        Main.TransRollback;
        MessageBox(0,'PKB tidak dapat disimpan'+Chr(13)+'Benturan dengan jadwal Pesanan,'+Chr(13)+'Silahkan Cek dengan reservasi','Buka PKB',MB_OK or MB_ICONWARNING);
      end;
      Main.CloseDb;
    end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Buka PKB',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TWorkOrderForm.DisableInput;
begin
//  KeluhanGrid.Enabled:=False;
  GroupExternal.Enabled:=False;
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelCari.Enabled:=False;
  PanelCariSR.Enabled:=False;
  GroupInputGambar.Enabled := False;
  //ScrollBox1.Enabled := False;
  //TambahFoto.Enabled := False;
 // HapusSemuaFoto.Enabled := False;
 Approve.Enabled := False;
 Reject.Enabled := False;
end;

procedure TWorkOrderForm.EnableInput;
begin
//  KeluhanGrid.Enabled:=True;
  GroupExternal.Enabled:=True;
  Simpan.Enabled:=True;
//  TambahDetail.Enabled:=True;
//  SimpanDetail.Enabled:=True;
  GroupInput.Enabled:=True;
  PanelCari.Enabled:=True;
  PanelCariSR.Enabled:=True;
  ScrollBox1.Enabled := True;
  GroupInputGambar.Enabled := True;
end;

procedure TWorkOrderForm.BersihkanClick(Sender: TObject);
begin
{  if KeluhanGridSebelum.Visible then begin
    KeluhanGrid.Height:=KeluhanGrid.Height+KeluhanGridSebelum.Height;
    KeluhanGrid.Top:=KeluhanGrid.Top-KeluhanGridSebelum.Height;
  end;
}
  EnableInput;
  Init;
  InitGrid;
  InitGrid2;
  InitGrid3;
  InitGrid4;
  HapusSemuaFotoClick(Sender);
//  RefreshCombo;
//  RefreshGrid;
end;

procedure TWorkOrderForm.PreparePrintData;
var StrQry:String;
    Qry:TADOQuery;
begin
{  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
}
  QNoPKB.Caption:=NoPKB.Text;
  QTanggalJamMasuk.Caption:=FormatDateTime('dd/mm/yyyy',StartDate.Date)+' '+Jam.Text;
  QTanggalJamKeluar.Caption:='';
  QNoBody.Caption:=NoBody.Text;
  QNoPolisi.Caption:=NoPolisi.Text;
  QOdometer.Caption:=KMOdo.Text;
  QTipeKendaraan.Caption:='';
  Main.M_Normal;
end;

procedure TWorkOrderForm.CetakUlangClick(Sender: TObject);
begin

  if WorkOrderId<>'' then RePrint(WorkOrderId)
  else WorkOrderList:=TWorkOrderList.Create(self,'WorkOrder','RePrint');
end;

{
procedure TWorkOrderForm.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry:String;
begin
  if No_PKB<>'' then begin
    Init;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT a.work_order_id,b.body_id,b.license_plate,b.engine_id,a.odo_in'+
            ',REPLACE(REPLACE(a.job_inex_id,1,'+Chr(39)+'Internal'+Chr(39)+'),2,'+
            Chr(39)+'Internal'+Chr(39)+') AS job_inout,CONVERT(VARCHAR(10),a.date_in,103) AS date_in'+
            ',CONVERT(VARCHAR(5),a.time_in,108) AS time_in FROM wh_work_order AS a '+
            ' LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
            ' WHERE work_order_id='+Chr(39)+No_PKB+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QNoPKB.Caption:=Qry.FieldValues['work_order_id'];
        QTanggalJamMasuk.Caption:=Qry.FieldValues['date_in']+' '+Qry.FieldValues['time_in'];
        QNoBody.Caption:=Qry.FieldValues['body_id'];
        QNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+
                           Copy(Qry.FieldValues['license_plate'],2,4)+' '+
                           Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        Qry.FieldValues['license_plate'];
        QNoMesin.Caption:=Qry.FieldValues['engine_id'];
        QOdometer.Caption:=Qry.FieldValues['odo_in'];
        RePrintForm.ReportName:='PKB';
        RePrintForm.ReportId:=QNoPKB.Caption;
        if RePrintForm.ShowModal=1 then begin
          StrQry:='SELECT ROW_NUMBER() OVER (ORDER BY work_order_detail_id DESC) AS no'+
                  ',description FROM wh_work_order_detail'+
                  ' WHERE work_order_id='+Chr(39)+QNoPKB.Caption+Chr(39)+' AND description_id=1;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            Report.DataSet:=Qry;
            QNo.DataSet:=Qry;
            QNo.DataField:='no';
            QDeskripsi.DataSet:=Qry;
            QDeskripsi.DataField:='description';
            Report.Prepare;
            Report.Preview;
          end;
        end;
      end;
      Qry.Close;
      Main.MyConnection.Close;
    end;
  end;
end;
}

procedure TWorkOrderForm.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderForm.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry, StrDes, StrSpaces :String;
    IntCount:Integer;
begin
  if No_PKB<>'' then begin
  //  Init;
    RePrintForm.ReportName:='PKB';
    RePrintForm.ReportId:=No_PKB;
    if RePrintForm.ShowModal=1 then begin
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      PreparePrint;
      if Main.OpenDb then begin
        StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(No_PKB)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          ppNoPKB.Caption:=Qry.FieldValues['work_order_id'];
          if Qry.FieldValues['service_request_id']<> null then ppNoSR.Caption:=Qry.FieldValues['service_request_id']
          else ppNoSR.Caption:= '-';
          ppTglMasuk.Caption:=Qry.FieldValues['date_in'];
          if Qry.FieldValues['time_in']<>NULL then ppTglMasuk.Caption:=ppTglMasuk.Caption+' '+Qry.FieldValues['time_in'];
          if Qry.FieldValues['date_out']<>NULL then ppTglKeluar.Caption:=Qry.FieldValues['date_out'];
          if Qry.FieldValues['time_out']<>NULL then ppTglKeluar.Caption:=ppTglKeluar.Caption+' '+Qry.FieldValues['time_out'];
          ppNoBody.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          ppNoMesin.Caption:=Qry.FieldValues['engine_id'];
          ppOdometer.Caption:=IToCurr(Qry.FieldValues['odo_in']);
          ppTipeKendaraan.Caption:=Qry.FieldValues['batch_name']+' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
          ppJenisPekerjaan.Caption:=Qry.FieldValues['job_inout']+'-';
          if Qry.FieldValues['general_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'General,';
          if Qry.FieldValues['body_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Body,';
          if Qry.FieldValues['insurance']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Asuransi';
          ppAdminBengkel.Caption:=Qry.FieldValues['user_admin'];
          if Qry.FieldValues['user_close_name']<>NULL then ppKepalaBengkel.Caption:=Qry.FieldValues['user_close_name'];
//          if Qry.FieldValues['approve']=1 then ppKepalaBengkel.Caption:=Qry.FieldValues['approve_user_name'];

          if Qry.FieldValues['remark']<>NULL then ppRekomendasi.Lines.Add(Qry.FieldValues['remark']);

          //KELUHAN
          Qry.Close;
          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
                  'description_id=1 and status=1;';

          ppKeluhan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
              ppKeluhan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;

          //PEKERJAAN
          Qry.Close;
          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
                  'description_id=2 and status=1;';
          ppPekerjaan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppPekerjaan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            ppCheklist.Lines.Add(' [  ]');
            Inc(IntCount);
            Qry.Next;
          end;

          //PARTS
          Qry.Close;
          StrQry:='SELECT a.* FROM wh_tanda_terima_detail a '+
                  'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
                  'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
                  'WHERE c.no_request='+QuotedStr(NoSR.Text)+' AND a.status=1;';

          ppParts.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['item_detail']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;

          //Mekanik
          StrQry:='SELECT name FROM wh_work_order_mekanik '+
                  'WHERE work_order_id='+QuotedStr(No_PKB)+' AND status=1;';

          ppTeknisi.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppTeknisi.Lines.Add(IntToStr(IntCount)+'. '+Qry.FieldValues['name']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
        end;
        ppReport.PreviewFormSettings.WindowState:=wsMaximized;
        ppReport.Print;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
    end;
  end;
end;

procedure TWorkOrderForm.RefreshGrid;
var IntCount:Integer;
begin
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=Copy(WOArr[IntCount][2],1,1)+' '+
                           Copy(WOArr[IntCount][2],2,4)+' '+
                           Copy(WOArr[IntCount][2],6,Length(WOArr[IntCount][2])+1);
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][4];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][5];
  end;
end;


procedure TWorkOrderForm.KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=38 then begin
    if KeluhanGrid.Row>0 then begin
      KeluhanDetailExit(nil);
      KeluhanGrid.Row:=KeluhanGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  KeluhanGrid.Row<KeluhanGrid.RowCount-1 then begin
      KeluhanDetailExit(nil);
      KeluhanGrid.Row:=KeluhanGrid.Row+1;
    end;
  end
end;

procedure TWorkOrderForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;


procedure TWorkOrderForm.SimpanDetailClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if KeluhanDetail.Focused=True then KeluhanDetail.OnExit(nil);
  KeluhanDetail.Visible:=True;
  if (NoBody.Text='') AND (KeluhanGrid.Cells[0,0]='') then
  begin
    MessageBox(0,'Silahkan isi keluhan','Buka PKB',MB_OK or MB_ICONERROR);
    Exit;
  end;
  IsOk:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    StrTransId:=NoPKB.Text;
    StrQry:='';
    for IntCount:=0 to KeluhanGrid.RowCount-1 do begin
      if Trim(KeluhanGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                ',description,update_time,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                ','+Chr(39)+KeluhanGrid.Cells[0,IntCount]+Chr(39)+
                ',GETDATE(),'+Chr(39)+User+Chr(39)+'); ';
    end;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
    on E:Exception do begin
         IsOk:=False;
         StrMsg:='Gagal Menyimpan Keluhan';
         StrEMsg:=E.Message;
    end;
  end;

  if IsOk then begin
    Main.TransCommit;
//    SimpanDetail.Enabled:=False;
    DisableInput;
    MessageBox(0,'Tambahan PKB berhasil disimpan','Buka PKB',MB_OK or MB_ICONINFORMATION);
    Qry.Close;
  end else begin
    Main.TransRollback;
    MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka PKB',MB_OK or MB_ICONERROR);
  end;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  KeluhanDetail.Visible:=True;
  KeluhanDetail.Enabled:=False;
end;

procedure TWorkOrderForm.FinishUnknownClick(Sender: TObject);
begin
  if FinishUnknown.Checked=True then FinishDate.Enabled:=False
  else FinishDate.Enabled:=True;
end;

procedure TWorkOrderForm.TombolCariClick(Sender: TObject);
begin
  VehicleList:=TVehicleList.Create(nil,'Bus','WorkOrder-Create')
end;

procedure TWorkOrderForm.CariSRClick(Sender: TObject);
begin
  ServiceRequestList:=TServiceRequestList.Create(Self,'WorkOrder-Create','',2);
end;

procedure TWorkOrderForm.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    WorkOrderId:=StrGrid.Cells[0,IntRow];
    LoadData;
    DisableInput;
    IsInput:=False;
  end;
end;

procedure TWorkOrderForm.MekanikExit(Sender: TObject);
var IntCount: Integer;
begin
    if Trim(Mekanik.Text)<>'' then begin
    StrGridMekanik.Cells[IntCol,IntRow]:=Mekanik.Text;
    Calculate4;
  end;
  Mekanik.Text:='';
  Mekanik.Visible := False;
  StrGridMekanik.SetFocus;

 { if Trim(Mekanik.Text)<>'' then begin
    StrGridMekanik.Cells[2,IntRow]:=Mekanik.Text;
    StrGridMekanik.CellStyle[2,IntRow].HorizontalAlignment:=taLeftJustify;
  end;
  Mekanik.Text:='';
  Mekanik.Visible := False;
  Calculate4; }
end;

procedure TWorkOrderForm.MekanikKeyPress(Sender: TObject; var Key: Char);
  var
  IntCount: Integer;
begin
  if (Key=#13) then begin
//     MekanikExit(sender);
//    MekanikExit(nil);
//    Calculate4;
//    if (StrGridMekanik.Row=StrGridMekanik.RowCount-1) AND (StrGridMekanik.RowCount<=IntMaxRow)  then begin
//      StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
//      for IntCount:=0 to 3 do StrGridMekanik.Cells[IntCount,StrGridMekanik.RowCount-1]:='';
//      StrGridMekanik.CellStyle[0,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
//      StrGridMekanik.CellStyle[2,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
//    end;
//    StrGridMekanik.Row:=StrGridMekanik.Row+1;
//    StrGridMekanik.Col:=1;

      if Mekanik.Text<>'' then begin
        with ListMekanik do begin
          //Left:=Mekanik.Left;
          Top := Mekanik.Top+25;
          Visible:= True;
          BringToFront;
        end;
        RefreshMekanik;
      end else begin
        ListMekanik.Visible:=False;
      end;

      MekanikExit(nil);
      Calculate4;
     { if (StrGridMekanik.Row=StrGridMekanik.RowCount-1) AND (StrGridMekanik.RowCount<=IntMaxRow)  then begin
        StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
        for IntCount:=0 to 4 do StrGridMekanik.Cells[IntCount,StrGridMekanik.RowCount-1]:='';
        StrGridMekanik.CellStyle[0,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
      end;
      StrGridMekanik.Col:=0;
      StrGridMekanik.Row:=StrGridMekanik.Row+1;
      StrGridMekanik.Col:=1;}

  end;
  if (Key=#27) then begin
    MekanikExit(nil);
  end;
end;

procedure TWorkOrderForm.StatusMekanikExit(Sender: TObject);
begin
  if Trim(StatusMekanik.Text)<>'' then begin
    StrGridMekanik.Cells[IntCol,IntRow]:=StatusMekanik.Text;
  end;
  StatusMekanik.Text:='';
  StatusMekanik.Visible := False;
  StrGridMekanik.SetFocus;
end;

procedure TWorkOrderForm.StrGridMekanikSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPolisi.Text<>'') then begin
    R := StrGridMekanik.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridMekanik.Left;
    R.Right := R.Right + StrGridMekanik.Left;
    R.Top := R.Top + StrGridMekanik.Top;
    R.Bottom := R.Bottom + StrGridMekanik.Top;
    with StatusMekanik do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGridMekanik.Cells[ACol,ARow])<>'' then Text:=StrGridMekanik.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
  if (ACol = 2) and (ARow > MinRowGrid) and (NoPolisi.Text<>'') then begin
    R := StrGridMekanik.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridMekanik.Left;
    R.Right := R.Right + StrGridMekanik.Left;
    R.Top := R.Top + StrGridMekanik.Top;
    R.Bottom := R.Bottom + StrGridMekanik.Top;
    with Mekanik do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGridMekanik.Cells[ACol,ARow])<>'' then Text:=StrGridMekanik.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TWorkOrderForm.StrGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPolisi.Text<>'') then begin
    R := StrGrid3.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid3.Left;
    R.Right := R.Right + StrGrid3.Left;
    R.Top := R.Top + StrGrid3.Top;
    R.Bottom := R.Bottom + StrGrid3.Top;
    with Analisa do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid3.Cells[ACol,ARow])<>'' then Text:=StrGrid3.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TWorkOrderForm.AnalisaExit(Sender: TObject);
begin
  if Trim(Analisa.Text)<>'' then begin
    StrGrid3.Cells[IntCol,IntRow]:=Analisa.Text;
    Calculate2;
  end;
  Analisa.Text:='';
  Analisa.Visible := False;
  StrGrid3.SetFocus;
end;

procedure TWorkOrderForm.AnalisaKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    AnalisaExit(nil);
    Calculate2;
    if (StrGrid3.Row=StrGrid3.RowCount-1) AND (StrGrid3.RowCount<=IntMaxRow)  then begin
      StrGrid3.RowCount:=StrGrid3.RowCount+1;
      for IntCount:=0 to 1 do StrGrid3.Cells[IntCount,StrGrid3.RowCount-1]:='';
      StrGrid3.CellStyle[0,StrGrid3.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,StrGrid3.RowCount-1].HorizontalAlignment:=taLeftJustify;
    end;
    StrGrid3.Col:=0;
    StrGrid3.Row:=StrGrid3.Row+1;
    StrGrid3.Col:=1;
  end;
  if (Key=#27) then begin
    AnalisaExit(nil);
  end;
end;

procedure TWorkOrderForm.TambahFotoClick(Sender: TObject);
var
  FilePath, Deskripsi, CompressedFile: string;
  NewImage: TImage;
  NewLabel: TLabel;
  Pic: TPicture;
  FileInfo: TSearchRec;
  FileSizeInBytes: Int64;
begin
  if not OpenPictureDialog1.Execute then Exit;
  FilePath := OpenPictureDialog1.FileName;

  // Cek ukuran file asli
  if FindFirst(FilePath, faAnyFile, FileInfo) = 0 then
  begin
    FileSizeInBytes := FileInfo.Size;
    FindClose(FileInfo);

    if FileSizeInBytes > 3 * 1024 * 1024 then
    begin
      ShowMessage(
        Format('Ukuran gambar terlalu besar (%.2f MB). Maksimal 3 MB.',
        [FileSizeInBytes / 1024 / 1024])
      );
      Exit;
    end;
  end;

  // === COMPRESS DI SINI ===
  CompressedFile := CompressImageToTemp(FilePath);
  if CompressedFile = '' then
  begin
    ShowMessage('Gagal memproses gambar.');
    Exit;
  end;

  // Deskripsi
  Deskripsi := InputBox('Deskripsi Gambar', 'Masukkan keterangan gambar:', '');

  // ?? SIMPAN YANG SUDAH COMPRESS
  ListGambar.Add(CompressedFile);
  ListDeskripsi.Add(Deskripsi);

  // === IMAGE ===
  NewImage := TImage.Create(ScrollBox1);
  NewImage.Parent := ScrollBox1;
  NewImage.Width := 250;
  NewImage.Height := 180;
  NewImage.Stretch := True;
  NewImage.Proportional := True;
  NewImage.OnMouseDown := ImageRightClick;
  NewImage.Tag := ListGambar.Count - 1;       // index
  NewLabel.Name := 'LBL_' + IntToStr(NewImage.Tag);
  NewImage.Hint := NewLabel.Name;             // simpan nama label

  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(CompressedFile);
    NewImage.Picture.Assign(Pic.Graphic);
  finally
    Pic.Free;
  end;

  // === LABEL ===
  NewLabel := TLabel.Create(ScrollBox1);
  NewLabel.Parent := ScrollBox1;
  NewLabel.Caption := 'Keterangan: ' + Deskripsi;
  NewLabel.WordWrap := True;
  NewLabel.Width := 200;

  NewImage.Tag := NativeInt(NewLabel);

  ReLayoutImages;
end;
{var
  FilePath, Deskripsi: string;
  NewImage: TImage;
  NewLabel: TLabel;
  Margin, Spacing, Row: Integer;
  FileInfo: TSearchRec;
  FileSizeInBytes: Int64;
begin
  // Pilih gambar
  if not OpenPictureDialog1.Execute then Exit;
  FilePath := OpenPictureDialog1.FileName;

  // ?? Cek ukuran file (lebih dari 3MB)
  if FindFirst(FilePath, faAnyFile, FileInfo) = 0 then
  begin
    FileSizeInBytes := FileInfo.Size;
    FindClose(FileInfo);

    if FileSizeInBytes > 3 * 1024 * 1024 then
    begin
      ShowMessage(Format('Ukuran gambar terlalu besar (%.2f MB). Maksimal 3 MB.',
        [FileSizeInBytes / 1024 / 1024]));
      Exit; // batal
    end;
  end;

  // Minta deskripsi
  Deskripsi := InputBox('Deskripsi Gambar', 'Masukkan keterangan gambar:', '');

  // Simpan ke dua list terpisah
  ListGambar.Add(FilePath);
  ListDeskripsi.Add(Deskripsi);

  // Tampilkan di ScrollBox
  Margin := 10;
  Spacing := 20;

  Row := ListGambar.Count - 1;
  // --- Gambar ---
  NewImage := TImage.Create(Self);
  NewImage.Parent := ScrollBox1;
  NewImage.Width := 250;
  NewImage.Height := 180;
  NewImage.Stretch := True;
  NewImage.Proportional := True;
  NewImage.Top := 0;
  NewImage.Left := 0;

  //NewImage.Left := Margin;
  //NewImage.Top := Margin + (Row * (NewImage.Height + Spacing));
  NewImage.Picture.LoadFromFile(FilePath);
  NewImage.OnMouseDown := ImageRightClick;

// --- Label Deskripsi ---
  NewLabel := TLabel.Create(Self);
  NewLabel.Parent := ScrollBox1;
  NewLabel.Caption := 'Keterangan: ' + Deskripsi;
  NewLabel.Left := NewImage.Left + NewImage.Width + 15; // di kanan gambar
  NewLabel.Top := NewImage.Top + (NewImage.Height div 2) - 10;
  NewLabel.WordWrap := True;
  NewLabel.Width := 200;
  NewImage.Tag := NativeInt(NewLabel);

  ReLayoutImages;
end;  }

{procedure TWorkOrderForm.TambahFotoClick(Sender: TObject);
var
  FilePath, Deskripsi: string;
  NewImage: TImage;
  NewLabel: TLabel;
  Margin, Row: Integer;
begin
  // Pilih gambar
  if not OpenPictureDialog1.Execute then Exit;
  FilePath := OpenPictureDialog1.FileName;

  // Minta deskripsi
  Deskripsi := InputBox('Deskripsi Gambar', 'Masukkan keterangan gambar:', '');

  // Simpan path dan deskripsi ke list
  ListGambar.Add(FilePath + '|' + Deskripsi); // pisahkan dengan "|"

  // Tampilkan di ScrollBox
  Margin := 10;
  Row := ScrollBox1.ControlCount div 2; // tiap gambar + label
  NewImage := TImage.Create(Self);
  NewImage.Parent := ScrollBox1;
  NewImage.Width := 350;
  NewImage.Height := 250;
  NewImage.Stretch := True;
  NewImage.Proportional := True;
  NewImage.Top := Margin + (Row * 300);
  NewImage.Left := Margin;
  NewImage.Picture.LoadFromFile(FilePath);

  // Tambahkan label deskripsi
  NewLabel := TLabel.Create(Self);
  NewLabel.Parent := ScrollBox1;
  NewLabel.Caption := Deskripsi;
  NewLabel.Left := Margin;
  NewLabel.Top := NewImage.Top + NewImage.Height + 5;
end;}



{var
  I: Integer;
  FilePath: string;
  NewImage: TImage;
  Margin, Col, Row: Integer;
begin
  // Ambil semua file gambar yang dipilih
  ListGambar := GetImgFiles;
  if ListGambar.Count = 0 then Exit;

  Margin := 10;

  for I := 0 to ListGambar.Count - 1 do
  begin
    FilePath := ListGambar[I];

    Col := 0;
    Row := ScrollBox1.ControlCount; // satu kolom

    NewImage := TImage.Create(Self);
    NewImage.Parent := ScrollBox1;
    NewImage.Width := 350;
    NewImage.Height := 250;
    NewImage.Stretch := True;
    NewImage.Proportional := True;
    NewImage.Left := Margin + (Col * (NewImage.Width + Margin));
    NewImage.Top := Margin + (Row * (NewImage.Height + Margin));

    try
      NewImage.Picture.LoadFromFile(FilePath);
    except
      on E: EInvalidGraphic do
      begin
        ShowMessage('File rusak atau format tidak didukung: ' + FilePath);
        NewImage.Free;
        Continue;
      end;
    end;

    NewImage.Hint := FilePath; // simpan path
  end;
end;}

Function TWorkOrderForm.CompressImageToTemp(const SrcFile: string): string;
var
  SrcPic: TPicture;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  MaxW, NewW, NewH: Integer;
  Scale: Double;
begin
  Result := '';

  SrcPic := TPicture.Create;
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    SrcPic.LoadFromFile(SrcFile);

    // copy ke bitmap (AMAN utk PNG/JPG)
    Bmp.Assign(SrcPic.Graphic);

    if (Bmp.Width = 0) or (Bmp.Height = 0) then
      Exit;

    MaxW := 1280;
    if Bmp.Width > MaxW then
    begin
      Scale := MaxW / Bmp.Width;
      NewW := MaxW;
      NewH := Round(Bmp.Height * Scale);
    end
    else
    begin
      NewW := Bmp.Width;
      NewH := Bmp.Height;
    end;

    // resize bitmap (Delphi 7 way)
    Bmp.Width  := NewW;
    Bmp.Height := NewH;

    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(Rect(0, 0, NewW, NewH));

    Bmp.Canvas.StretchDraw(
      Rect(0, 0, NewW, NewH),
      SrcPic.Graphic
    );


    // simpan ke JPEG
    Jpg.Assign(Bmp);
    Jpg.CompressionQuality := 75; // 70–80 ideal
    Jpg.Compress;

    Result :=
      IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
      'TutupPKB_' + FormatDateTime('yyyymmddhhnnsszzz', Now) + '.jpg';

    Jpg.SaveToFile(Result);
  finally
    SrcPic.Free;
    Bmp.Free;
    Jpg.Free;
  end;
end;

procedure TWorkOrderForm.ImageRightClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Img: TImage;
  Lbl: TLabel;
  idx: Integer;
begin
  if Simpan.Enabled = True then
  begin
    if Button = mbRight then
    begin
      Img := Sender as TImage;
      if MessageDlg('Hapus gambar ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        // Hapus label jika ada
        if (Img.Tag <> 0) and (TObject(Img.Tag) is TLabel) then
        begin
          Lbl := TLabel(Img.Tag);
          Lbl.Free;
        end;

        // Hapus dari list
        idx := ListGambar.IndexOf(Img.Hint);
        if idx >= 0 then
        begin
          ListGambar.Delete(idx);
          if (idx < ListDeskripsi.Count) then
            ListDeskripsi.Delete(idx);
        end;

        // Hapus gambar
        Img.Free;

        // Relayout ulang
        ReLayoutImages;
      end;
    end;
  end;
end;
procedure TWorkOrderForm.RepositionImages;
var
  i, Col, Row, Margin: Integer;
  img: TImage;
begin
  Margin := 10;
  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
    if ScrollBox1.Controls[i] is TImage then
    begin
      img := TImage(ScrollBox1.Controls[i]);
      Col := i mod 1;
      Row := i div 1;
      img.Left := Margin + (Col * (img.Width + Margin));
      img.Top := Margin + (Row * (img.Height + Margin));
    end;
  end;
end;

procedure TWorkOrderForm.ReLayoutImages;
var
  i, Row, Margin, Spacing: Integer;
  Img: TImage;
  Lbl: TLabel;
begin
  Margin := 10;
  Spacing := 20;
  Row := 0;  // hitung baris gambar sesungguhnya, bukan ControlCount

  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
    if ScrollBox1.Controls[i] is TImage then
    begin
      Img := TImage(ScrollBox1.Controls[i]);

      Img.Left := Margin;
      Img.Top  := Margin + (Row * (Img.Height + Spacing));

      // update label
      if TObject(Img.Tag) is TLabel then
      begin
        Lbl := TLabel(Img.Tag);
        Lbl.Left := Img.Left + Img.Width + 15;
        Lbl.Top := Img.Top + (Img.Height div 2) - 10;
      end;

      Inc(Row);  // pindah ke baris gambar berikutnya
    end;
  end;
end;



procedure TWorkOrderForm.HapusSemuaFotoClick(Sender: TObject);
var
  i: Integer;
begin
// Hapus semua image & label di ScrollBox
  for i := ScrollBox1.ControlCount - 1 downto 0 do
    ScrollBox1.Controls[i].Free;

  // Kosongkan list yang menyimpan file dan deskripsi
  ListGambar.Clear;
  ListDeskripsi.Clear;

  // Refresh tampilan ScrollBox
  ScrollBox1.Repaint;
end;

procedure TWorkOrderForm.FormCreate(Sender: TObject);
begin
  ListGambar := TStringList.Create;
  ListDeskripsi := TStringList.Create;
end;

procedure TWorkOrderForm.SimpanFotoClick(Sender: TObject);
var
  I: Integer;
  SrcFile, DestDir, DestFile, FileNameOnly, FileExt, Deskripsi: string;
  Qry: TADOQuery;
  ServerPath: string;
begin
  if ListGambar.Count = 0 then
  begin
    ShowMessage('Belum ada gambar yang ditambahkan!');
    Exit;
  end;

    ServerPath := ExtractFilePath(Application.ExeName) + '\\192.168.10.247\WHAps\WorkImages\';

    // Pastikan folder tersedia
    if not DirectoryExists(ServerPath) then
      CreateDir(ServerPath);

    // Loop semua gambar
    for I := 0 to ListGambar.Count - 1 do
    begin
      SrcFile := ListGambar[I];

      // Cek apakah file masih ada
      if not FileExists(SrcFile) then
      begin
        ShowMessage('File tidak ditemukan: ' + SrcFile);
        Continue;
      end;

      // Buat nama baru agar unik di folder server
      FileNameOnly := ChangeFileExt(ExtractFileName(SrcFile), '');
      FileExt := ExtractFileExt(SrcFile);
      DestFile := ServerPath + FormatDateTime('yyyymmdd_hhnnss_', Now) + FileNameOnly + FileExt;

      try
        // Salin file ke folder server
        CopyFileOld(SrcFile, DestFile);
      except
        on E: Exception do
        begin
          ShowMessage('Gagal menyalin file: ' + E.Message);
          Continue;
        end;
      end;

      // Minta deskripsi (atau bisa ambil dari edit box kalau kamu mau otomatis)
      Deskripsi := InputBox('Deskripsi Gambar', 'Masukkan keterangan untuk gambar:', '');

      // Simpan ke database hanya path + deskripsi
      Qry := TADOQuery.Create(Self);
      try
        Qry.Connection := Main.MyConnection;
        Qry.SQL.Text :=
          'INSERT INTO wh_work_order_image_new (work_order_id, image_path, deskripsi, update_time, update_user) ' +
          'VALUES (' +
          QuotedStr(StrTransId) + ',' +
          QuotedStr(DestFile) + ',' +
          QuotedStr(Deskripsi) + ',' +
          'GETDATE(),' +
          QuotedStr(User) + ')';
        Qry.ExecSQL;
      finally
        Qry.Free;
      end;
    end;

    ShowMessage('Semua gambar berhasil disimpan ke server dan database.');
  //end;
    //  Main.CloseDb;
 // end;
 // Qry.Free;
end;

procedure TWorkOrderForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
 // FreeAndNil(ListGambar);
  //FreeAndNil(ListDeskripsi);

  // Bebaskan semua gambar dulu
  for i := 0 to ListGambar.Count - 1 do
    TImage(ListGambar[i]).Free;
  ListGambar.Free;
  for i := 0 to ListDeskripsi.Count - 1 do
  TImage(ListDeskripsi[i]).Free;
  ListDeskripsi.Free;
end;

function TWorkOrderForm.GetImgFiles: TStringList;
var
  openDialog: TOpenDialog;
begin
  Result := TStringList.Create;
  openDialog := TOpenDialog.Create(nil);
  try
    openDialog.InitialDir := GetMyDocuments;
    openDialog.Options := [ofAllowMultiSelect, ofFileMustExist];
    openDialog.Filter := 'Image File |*.jpg;*.jpeg;*.bmp;*.png;*.gif';
    openDialog.FilterIndex := 1;
    if openDialog.Execute then
      Result.Assign(openDialog.Files); // salin semua file ke result
  finally
    openDialog.Free;
  end;
end;

// --- Tambahkan fungsi bantu untuk cek ukuran file ---
function TWorkOrderForm.FileSize(const AFileName: string): Int64;
var
  SR: TSearchRec;
begin
  if FindFirst(AFileName, faAnyFile, SR) = 0 then
  begin
    Result := SR.Size;
    SysUtils.FindClose(SR);
  end
  else
    Result := 0;
end;

// --- Prosedur utama untuk simpan semua gambar di ListGambar ---
procedure TWorkOrderForm.SaveAllImagesToDB;
var
  I: Integer;
  Qry: TADOQuery;
  StmImage: TMemoryStream;
  Pic: TPicture;
  FilePath: string;
begin
  if (ListGambar = nil) or (ListGambar.Count = 0) then
  begin
    ShowMessage('Tidak ada gambar yang dipilih untuk disimpan.');
    Exit;
  end;

  Qry := TADOQuery.Create(nil);
  StmImage := TMemoryStream.Create;
  Pic := TPicture.Create;
  try
    Qry.Connection := Main.MyConnection;

    for I := 0 to ListGambar.Count - 1 do
    begin
      FilePath := ListGambar[I];

      // --- Validasi file ---
      if not FileExists(FilePath) then
      begin
        ShowMessage('File tidak ditemukan: ' + FilePath);
        Continue;
      end;
      if FileSize(FilePath) = 0 then
      begin
        ShowMessage('File kosong: ' + FilePath);
        Continue;
      end;

      try
        // Load gambar (otomatis deteksi format: jpg/png/bmp/gif)
        Pic.LoadFromFile(FilePath);

        // Simpan gambar ke stream
        StmImage.Clear;
        Pic.Graphic.SaveToStream(StmImage);
        StmImage.Position := 0;

        // Insert ke tabel wh_work_order_image
        Qry.SQL.Clear;
        Qry.SQL.Add('INSERT INTO wh_work_order_image ');
        Qry.SQL.Add('(work_order_id, image_id, image, update_time, update_user)');
        Qry.SQL.Add('VALUES (:work_order_id, :image_id, :image, GETDATE(), :update_user)');

        Qry.Parameters.ParamByName('work_order_id').Value := '123456';//StrTransId;
        Qry.Parameters.ParamByName('image_id').Value := I + 1; // nomor urut gambar
        Qry.Parameters.ParamByName('image').LoadFromStream(StmImage, ftBlob);
        Qry.Parameters.ParamByName('update_user').Value := User;

        Qry.ExecSQL;

      except
        on E: EInvalidGraphic do
        begin
          ShowMessage('Format gambar tidak didukung atau rusak: ' + FilePath);
          Continue;
        end;
        on E: Exception do
        begin
          ShowMessage('Gagal menyimpan gambar ' + IntToStr(I + 1) + ': ' + E.Message);
          Continue;
        end;
      end;
    end;

    ShowMessage('Semua gambar berhasil disimpan ke database.');
  finally
    Qry.Free;
    StmImage.Free;
    Pic.Free;
  end;
end;


procedure TWorkOrderForm.CopyFileOld(const SourceFile, DestFile: string);
var
  DestDir: string;
begin
  DestDir := ExtractFilePath(DestFile);

  // Pastikan folder tujuan sudah ada
  if not DirectoryExists(DestDir) then
    ForceDirectories(DestDir);  // buat semua folder jika belum ada

  // Lanjut menyalin file
  if not CopyFile(PChar(SourceFile), PChar(DestFile), False) then
    raise Exception.CreateFmt('Gagal menyalin file: %s', [SysErrorMessage(GetLastError)]);
end;

{procedure TWorkOrderForm.CompressAndSaveImage(const SrcFile, DestFile: string; MaxWidth, MaxHeight, Quality: Integer);
var
  Bitmap, Resized: TBitmap;
  JPEGImage: TJPEGImage;
  Scale: Double;
begin
  Bitmap := TBitmap.Create;
  Resized := TBitmap.Create;
  JPEGImage := TJPEGImage.Create;
  try
    // Load gambar apapun (jpg/png/bmp)
    Bitmap.LoadFromFile(SrcFile);

    // Hitung skala perbandingan untuk resize
    Scale := Min(MaxWidth / Bitmap.Width, MaxHeight / Bitmap.Height);
    if Scale > 1 then
      Scale := 1; // Jangan perbesar, hanya perkecil

    // Ukuran baru
    Resized.Width := Round(Bitmap.Width * Scale);
    Resized.Height := Round(Bitmap.Height * Scale);

    // Resize gambar
    Resized.Canvas.StretchDraw(Rect(0, 0, Resized.Width, Resized.Height), Bitmap);

    // Simpan sebagai JPEG dengan kualitas tertentu (lebih kecil = lebih ringan)
    JPEGImage.Assign(Resized);
    JPEGImage.CompressionQuality := Quality; // 1..100
    JPEGImage.SaveToFile(DestFile);
  finally
    Bitmap.Free;
    Resized.Free;
    JPEGImage.Free;
  end;
end;  }
procedure TWorkOrderForm.LoadImagesForEdit(WorkOrderId:String);
var
  Qry: TADOQuery;
  TmpFile: string;
  Stm: TMemoryStream;
begin
  // Bersihkan tampilan lama
  ScrollBox1.DisableAlign;
  try
    ScrollBox1.DestroyComponents;
    ListGambar.Clear;
    ListDeskripsi.Clear;

    Qry := TADOQuery.Create(nil);
    try
      Qry.Connection := Main.MyConnection;
      Qry.SQL.Text :=
        'SELECT image_name, image, description ' +
        'FROM wh_work_order_image ' +
        'WHERE work_order_id = :id AND status = 1 AND description_id = 1';

      Qry.Parameters.ParamByName('id').Value := WorkOrderId;
      Qry.Open;

      while not Qry.Eof do
      begin
        TmpFile :=
          SafeTempDir +
          FormatDateTime('yyyymmddhhnnsszzz', Now) + '_' +
          Qry.FieldByName('image_name').AsString;

        Stm := TMemoryStream.Create;
        try
          TBlobField(Qry.FieldByName('image')).SaveToStream(Stm);

          if Stm.Size > 0 then
          begin
            Stm.Position := 0;
            Stm.SaveToFile(TmpFile);

            ListGambar.Add(TmpFile);
            ListDeskripsi.Add(Qry.FieldByName('description').AsString);

            ShowImageOnScrollBox(
              TmpFile,
              Qry.FieldByName('description').AsString
            );
          end;
        finally
          Stm.Free;
        end;

        Qry.Next;
      end;
    finally
      Qry.Free;
    end;

  finally
    ScrollBox1.EnableAlign;
    ReLayoutImages; // ?? cukup SEKALI
  end;
end;

procedure TWorkOrderForm.ShowImageOnScrollBox(
  const FilePath, Desc: string);
var
  Img: TImage;
  Lbl: TLabel;
  Pic: TPicture;
begin
  Img := TImage.Create(ScrollBox1);
  Img.Parent := ScrollBox1;
  Img.Width := 250;
  Img.Height := 180;
  Img.Stretch := True;
  Img.Proportional := True;
  Img.OnMouseDown := ImageRightClick;

  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FilePath);     // AUTO PNG / JPG
    Img.Picture.Assign(Pic);
  finally
    Pic.Free;
  end;

  Lbl := TLabel.Create(ScrollBox1);
  Lbl.Parent := ScrollBox1;
  Lbl.Caption := 'Keterangan: ' + Desc;
  Lbl.WordWrap := True;
  Lbl.Width := 200;

  Img.Tag := NativeInt(Lbl);
end;
{procedure TWorkOrderForm.ShowSavedImage(const FilePath, Deskripsi: string);
var
  NewImage: TImage;
  NewLabel: TLabel;
  Margin, Spacing, Row: Integer;
  Pic: TPicture;
begin
  Margin := 10;
  Spacing := 20;

  // INI YANG BENAR
  Row := ListGambar.Count - 1;

  NewImage := TImage.Create(Self);
  NewImage.Parent := ScrollBox1;
  NewImage.Width := 250;
  NewImage.Height := 180;
  NewImage.Stretch := True;
  NewImage.Proportional := True;
  NewImage.Left := Margin;
  NewImage.Top := Margin + (Row * (NewImage.Height + Spacing));
  NewImage.Top := 0;
  NewImage.Left := 0;

  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FilePath);
    NewImage.Picture.Assign(Pic.Graphic);
  finally
    Pic.Free;
  end;

  NewLabel := TLabel.Create(Self);
  NewLabel.Parent := ScrollBox1;
  NewLabel.Caption := 'Keterangan: ' + Deskripsi;
  NewLabel.Left := NewImage.Left + NewImage.Width + 15;
  NewLabel.Top := NewImage.Top + (NewImage.Height div 2) - 10;
  NewLabel.WordWrap := True;
  NewLabel.Width := 200;

  NewImage.Tag := NativeInt(NewLabel);
  NewImage.OnMouseDown := ImageRightClick;

  ReLayoutImages;
end;}

{procedure TWorkOrderForm.LoadAllImages;
var
    Qry: TADOQuery;
    StrQry : string;
    FilePath, Desk: string;
begin
  // Clear Lists
  ListGambar.Clear;
  ListDeskripsi.Clear;

  // Clear UI
  while ScrollBox1.ControlCount > 0 do
    ScrollBox1.Controls[0].Free;


  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  // Bersihkan ScrollBox dulu
 // ScrollBox1.DestroyComponents;

  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_work_order_image '+
            ' WHERE status = 1 AND description_id =1 AND work_order_id ='+QuotedStr(WorkOrderId);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount >0 then begin
     while not Qry.Eof do
      begin

        FilePath := Qry.FieldByName('image_name').AsString;
        Desk := Qry.FieldByName('description').AsString;
          // simpan ke list (WAJIB!)
        ListGambar.Add(FilePath);
        ListDeskripsi.Add(Desk);

        ShowSavedImage(FilePath, Desk);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
end; }

procedure TWorkOrderForm.PekerjaanExit(Sender: TObject);
begin
  if Trim(Pekerjaan.Text)<>'' then begin
    StrGridPekerjaan.Cells[IntCol,IntRow]:=Pekerjaan.Text;
    CalculatePekerjaan;
  end;
  Pekerjaan.Text:='';
  Pekerjaan.Visible := False;
  StrGridPekerjaan.SetFocus;
end;

procedure TWorkOrderForm.PekerjaanKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    PekerjaanExit(nil);
    CalculatePekerjaan;
    if (StrGridPekerjaan.Row=StrGridPekerjaan.RowCount-1) AND (StrGridPekerjaan.RowCount<=IntMaxRow)  then begin
      StrGridPekerjaan.RowCount:=StrGridPekerjaan.RowCount+1;
      for IntCount:=0 to 1 do StrGridPekerjaan.Cells[IntCount,StrGridPekerjaan.RowCount-1]:='';
      StrGridPekerjaan.CellStyle[0,StrGridPekerjaan.RowCount-1].HorizontalAlignment:=taCenter;
      StrGridPekerjaan.CellStyle[1,StrGridPekerjaan.RowCount-1].HorizontalAlignment:=taLeftJustify;
    end;
    StrGridPekerjaan.Col:=0;
    StrGridPekerjaan.Row:=StrGridPekerjaan.Row+1;
    StrGridPekerjaan.Col:=1;
  end;
  if (Key=#27) then begin
    PekerjaanExit(nil);
  end;
end;

procedure TWorkOrderForm.StrGridPekerjaanSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPolisi.Text<>'') then begin
    R := StrGridPekerjaan.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridPekerjaan.Left;
    R.Right := R.Right + StrGridPekerjaan.Left;
    R.Top := R.Top + StrGridPekerjaan.Top;
    R.Bottom := R.Bottom + StrGridPekerjaan.Top;
    with Pekerjaan do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGridPekerjaan.Cells[ACol,ARow])<>'' then Text:=StrGridPekerjaan.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TWorkOrderForm.ListMekanikDblClick(Sender: TObject);
begin
  StrGridMekanik.Cells[IntCol,IntRow]:=UpperCase(ListMekanik.Items.Strings[ListMekanik.ItemIndex]);
  ListMekanik.Visible:=False;
  StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
 // StrGridMekanik.Col := 1;           // fokus ke kolom 1
  //StrGridMekanik.Row := IntRow + 1;  // ke baris berikutnya
  //SetFocus;
end;

procedure TWorkOrderForm.RefreshMekanik;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(MekanikArr,0);
    StrQry:='SELECT a.employee_id,a.name FROM wh_employee AS a '+
    'LEFT JOIN wh_empl_detail b ON b.empl_detail_id= '+
    '(SELECT MAX(empl_detail_id) FROM wh_empl_detail where employee_id=a.employee_id)  '+
    'LEFT JOIN wh_license_type c ON c.license_type_id=b.license_type_id '+
    'LEFT JOIN wh_empl_mutation d ON d.empl_mutation_id= '+
    '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation  WHERE (employee_id=a.employee_id) AND '+
    '((from_date<=DATEADD(dd, 1,GETDATE())) OR (GETDATE() BETWEEN from_date AND to_date) OR '+
    '(to_date BETWEEN GETDATE() AND DATEADD(dd, 1,GETDATE())))) '+
    'LEFT JOIN wh_employee j ON j.employee_id=a.reference '+
    'WHERE (d.employment_type_id=3) AND '+
    '(d.location_id=6) AND a.name like ''%'+Mekanik.Text+'%'' and a.active=1 ORDER BY a.name ';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MekanikArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      MekanikArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      MekanikArr[IntCount][1]:=Qry.FieldValues['name'];
//      EmplArr[IntCount][2]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ListMekanik.Items.Clear;
  for IntCount:=0 to Length(MekanikArr)-1  do begin
    ListMekanik.Items.Add(MekanikArr[IntCount][1]);
  end;
  Main.M_Normal;
end;

procedure TWorkOrderForm.ApproveClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if MessageBox(0,'Apakah anda yakin ingin Setujui ','Buat PKB',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin

    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    if Main.OpenDb then begin
      Main.TransStart;

      StrQry:=' UPDATE wh_work_order SET approve=1,update_user='+QuotedStr(User)+' '+
              ' WHERE work_order_id='+QuotedStr(NoPKB.Text)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Setujui Buat PKB!!';
          StrException:=E.Message;
        end;
      end;

      if IsOk then begin
        Main.TransCommit;
        //LabStat.Visible:=True;
        Status.Visible:=True;
        Status.Caption:='DISETUJUI' ;
        Status.Font.Color:=clGreen;
        CetakUlang.Enabled:=True;
       // CetakFormulirBarang.Enabled:=True;
        Approve.Enabled:=False;
        Reject.Enabled:=False;
        Simpan.Enabled:=False;
        MessageBox(0,'Berhasil Setujui PKB','',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Checklist Integrate',MB_OK or MB_ICONERROR);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TWorkOrderForm.RejectClick(Sender: TObject);
begin
  if Main.IsFormOpen('NoteRejectPKB')=False then begin
    NoteRejectPKB:=TNoteRejectPKB.Create(Self);
    StrNoPKB:=NoPKB.Text;
  end;
end;

end.
