unit WorkOrderFormInU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, Mask, ComCtrls,
  ExtCtrls, ppParameter, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ZColorStringGrid;

type
  TWorkOrderFormIn = class(TForm)
    PanelMemoKhusus: TPanel;
    MemoKhusus: TCheckBox;
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
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppNoSR: TppLabel;
    PageControl1: TPageControl;
    TabDetail: TTabSheet;
    TabLampiran: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    NoBody: TEdit;
    NoPolisi: TEdit;
    KeluhanGrid: TZColorStringGrid;
    chkkeluhan: TCheckBox;
    NoSB: TEdit;
    NoPKB: TComboBox;
    GroupDetail: TGroupBox;
    Label7: TLabel;
    TombolCari: TSpeedButton;
    StrGrid: TStringGrid;
    Cari: TEdit;
    GroupPekerjaan: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    TanggalSelesai: TDateTimePicker;
    JamSelesai: TMaskEdit;
    chkClose: TCheckBox;
    PekerjaanGrid: TZColorStringGrid;
    Teknisi: TEdit;
    PekerjaanDetail: TEdit;
    chkPekerjaan: TCheckBox;
    GroupParts: TGroupBox;
    PartsGrid: TZColorStringGrid;
    CheckSelect: TCheckBox;
    Keterangan: TEdit;
    GroupBox3: TGroupBox;
    StrGridMekanik: TZColorStringGrid;
    Mekanik: TEdit;
    ListMekanik: TListBox;
    StatusMekanik: TComboBox;
    GroupBox2: TGroupBox;
    StrGrid3: TZColorStringGrid;
    Analisa: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    Selesai: TButton;
    ScrollBox1: TScrollBox;
    OpenPictureDialog1: TOpenDialog;
    Grupinputfoto: TGroupBox;
    TambahFoto: TButton;
    HapusSemuaFoto: TButton;
    SimpanFoto: TButton;
    chkSBSelanjutnya: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NoPKBChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridClick(Sender: TObject);
    procedure PekerjaanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PekerjaanDetailExit(Sender: TObject);
    procedure PekerjaanDetailKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SimpanClick(Sender: TObject);
    procedure TeknisiExit(Sender: TObject);
    procedure TeknisiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TeknisiKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure PartsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CetakUlangClick(Sender: TObject);
    procedure MekanikExit(Sender: TObject);
    procedure MekanikKeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AnalisaExit(Sender: TObject);
    procedure AnalisaKeyPress(Sender: TObject; var Key: Char);
    procedure KeteranganExit(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure KeluhanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridMekanikSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StatusMekanikExit(Sender: TObject);
    procedure chkCloseClick(Sender: TObject);
    procedure chkkeluhanExit(Sender: TObject);
    procedure chkPekerjaanExit(Sender: TObject);
    procedure TambahFotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HapusSemuaFotoClick(Sender: TObject);
    procedure SimpanFotoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    WOArr:Array of TArrString9;
    KeluhanArr:Array of TArrString4;
    WorkOrderId,FormRequest:String;
    IsReadOnly,Initiation:Boolean;
    IntArow,IntPCol,IntPRow,IntRow,IntCol,IntRow2,IntCol2, IntRow3,IntCol3:Integer;
    ListGambar, ListDeskripsi: TStringList;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshList;
    procedure EnableInput;
    procedure DisableInput;
    procedure LoadData;
    procedure Search;
    procedure PreparePrint;
    procedure InitPartsGrid;
    procedure InitKeluhanGrid;
    procedure InitGrid3;
    procedure InitGrid4;
    procedure InitPekerjaan;
    procedure Calculate2;
    procedure Calculate4;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetWODetail(WorkOrderId:String);
    procedure ReLayoutImages;
    procedure ShowSavedImage(const FilePath, Deskripsi: string);
   // procedure LoadAllImages;
   // procedure CompressAndSaveImage(const SrcFile, DestFile: string;MaxWidth, MaxHeight, JpegQuality: Integer);
    procedure ImageRightClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CompressImageToStream(const SrcFile: string;Stream: TMemoryStream;MaxWidth, MaxHeight, Quality: Integer);
   // procedure CompressImageToJpeg(const SrcFile, DestFile: string; MaxWidth, MaxHeight, Quality: Integer);
    Function CompressImageToTemp(const SrcFile: string): string;
    procedure SaveImagesToDB;
    procedure LoadImagesForEdit(WorkOrderId:String);
    procedure ShowImageOnScrollBox(const FilePath, Desc: string);
  end;

var
  WorkOrderFormIn: TWorkOrderFormIn;
  MinRowGrid, IntMaxRow: Integer;
  Deskripsi : string;
  

implementation

uses MainU, DateUtils, RePrintFormU, Math, pngimage, jpeg, DB;

{$R *.dfm}

constructor TWorkOrderFormIn.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TWorkOrderFormIn.Calculate2;
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

procedure TWorkOrderFormIn.Calculate4;
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

procedure TWorkOrderFormIn.InitGrid4;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGridMekanik.RowCount-1 do
    for IntCount2:=0 to StrGridMekanik.ColCount-1 do
      StrGridMekanik.Cells[IntCount2,IntCount]:='';

  StrGridMekanik.RowCount:=2;
  StrGridMekanik.ColWidths[0]:=20;
  StrGridMekanik.ColWidths[1]:=80;
  StrGridMekanik.ColWidths[2]:=200;

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

procedure TWorkOrderFormIn.InitPekerjaan;
var IntCount,IntCount2:Integer;
begin
 { for IntCount:=0 to PekerjaanGrid.RowCount-1 do
    for IntCount2:=0 to PekerjaanGrid.ColCount-1 do
      PekerjaanGrid.Cells[IntCount2,IntCount]:='';
   PekerjaanGrid.RowCount:=2;
  PekerjaanGrid.Cells[0,0]:='           Pekerjaan';
//  PekerjaanGrid.Cells[1,0]:='    Teknisi';
  PekerjaanGrid.Cells[0,1]:='Check';
//  PekerjaanGrid.Cells[1,1]:=''; }

  PekerjaanGrid.RowCount:=2;
  PekerjaanGrid.ColWidths[0]:=330;
  PekerjaanGrid.ColWidths[1]:=45;
  PekerjaanGrid.ColWidths[2]:= 0;

  PekerjaanGrid.Cells[0,0]:='Deskripsi';
  PekerjaanGrid.Cells[1,0]:='Check';
  PekerjaanGrid.Cells[2,0]:='';

  PekerjaanGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  PekerjaanGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 2 do begin
    PekerjaanGrid.Cells[IntCount,1]:='';
    PekerjaanGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
 // PekerjaanGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderFormIn.Init;
begin
  NoPKB.Text:='';
  NoPKB.Items.Clear;
  NoPKB.ItemIndex:=0;
  Tanggal.Text:='';
  TanggalSelesai.Date:=Now();
  Jam.Text:='';
  JamSelesai.Text:=FormatDateTime('hh:nn',Now());
  NoBody.Text:='';
  NoPolisi.Text:='';
  KeluhanGrid.RowCount:=1;
  KeluhanGrid.Cells[0,0]:='';
  PekerjaanDetail.Text:='';
  PekerjaanDetail.Visible:=False;
  Label6.Visible:=False;
  TanggalSelesai.Visible:=False;
  Label9.Visible:=False;
  JamSelesai.Visible:=False;
  chkClose.Checked:=False;
  chkSBSelanjutnya.Visible := False;
  chkSBSelanjutnya.Checked := False;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Odo Msk';
  StrGrid.Cells[4,0]:='Tanggal Msk';
  StrGrid.Cells[5,0]:='Pekerjaan';
  StrGrid.Cells[6,0]:='No SB';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  StrGrid.Cells[6,1]:='';
//  PekerjaanGrid.RowCount:=2;
//  PekerjaanGrid.Cells[0,0]:='           Pekerjaan';
//  PekerjaanGrid.Cells[1,0]:='    Teknisi';
//  PekerjaanGrid.Cells[0,1]:='';
//  PekerjaanGrid.Cells[1,1]:='';
  PageControl1.ActivePage := TabDetail;
  //NoPKB.SetFocus;
end;

procedure TWorkOrderFormIn.InitPartsGrid;
var IntCount:Integer;
begin
  PartsGrid.RowCount:=2;
  PartsGrid.ColWidths[0]:=20;
  PartsGrid.ColWidths[1]:=45;
  PartsGrid.ColWidths[2]:=330;
  PartsGrid.ColWidths[3]:=50;
  PartsGrid.ColWidths[4]:=0;

  PartsGrid.Cells[0,0]:='No';
  PartsGrid.Cells[1,0]:='Check';
  PartsGrid.Cells[2,0]:='Part';
  PartsGrid.Cells[3,0]:='Qty';
  PartsGrid.Cells[4,0]:='Kode Part GP';

  PartsGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 3 do begin
    PartsGrid.Cells[IntCount,1]:='';
    PartsGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  PartsGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
  PartsGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderFormIn.InitKeluhanGrid;
var IntCount:Integer;
begin
  KeluhanGrid.RowCount:=2;
  KeluhanGrid.ColWidths[0]:=45;
  KeluhanGrid.ColWidths[1]:=318;
  KeluhanGrid.ColWidths[2]:= 0;

  KeluhanGrid.Cells[0,0]:='Check';
  KeluhanGrid.Cells[1,0]:='Deskripsi';
  KeluhanGrid.Cells[2,0]:='ID';

  KeluhanGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  KeluhanGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 2 do begin
    KeluhanGrid.Cells[IntCount,1]:='';
    KeluhanGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  KeluhanGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
end;

procedure TWorkOrderFormIn.InitGrid3;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=2;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=300;

  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Analisa';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid3.Cells[IntCount,1]:='';
    StrGrid3.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderFormIn.RefreshCombo;
var IntCount:Integer;
begin
end;

procedure TWorkOrderFormIn.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry,ServiceRequestId:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (WorkOrderId<>'') then
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@WorkOrderId='+QuotedStr(WorkOrderId)+';'
    else
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['status']=2 then
      begin
        chkClose.Checked:= True;
        chkClose.Enabled:=False;
        label6.Visible:=True;
        TanggalSelesai.Visible:=True;
        label9.Visible:=True;
        JamSelesai.Visible:=True;
      end else
      begin
        chkClose.Checked:= False;
        chkClose.Enabled:=True;
        label6.Visible:=False;
        TanggalSelesai.Visible:=False;
        label9.Visible:=False;
        JamSelesai.Visible:=False;
      end;
      NoPKB.Items.Add(Qry.FieldValues['work_order_id']);
      NoPKB.ItemIndex:=NoPKB.Items.IndexOf(Qry.FieldValues['work_order_id']);
      NoBody.Text:=Qry.FieldValues['body_id'];

      if Qry.FieldValues['service_request_id']<>NULL then begin
        ServiceRequestId:= Qry.FieldValues['service_request_id'];
      end else begin
        ServiceRequestId:='';
      end;

      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      Tanggal.Text:=Qry.FieldValues['date_in'];
      Jam.Text:=Qry.FieldValues['time_in'];
      TanggalSelesai.Date:=StrToDate(Qry.FieldValues['date_out']);
      if Qry.FieldValues['time_out']<>NULL then JamSelesai.Text:=Qry.FieldValues['time_out'];

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
    StrQry:='select work_order_detail_id,description,isdone,driver_complain_detail_id from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=1 and status=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
//    KeluhanGrid.Cell[0,0].Width:='45';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      KeluhanGrid.RowCount:=Qry.RecordCount+1;
      if Qry.FieldValues['isdone']=1 then  begin
        KeluhanGrid.Cells[0,IntCount+1]:='v' ;
        KeluhanGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      end else KeluhanGrid.Cells[0,IntCount+1]:='';
      KeluhanGrid.Cells[1,IntCount+1]:=Qry.FieldValues['description'];
      if Qry.FieldValues['driver_complain_detail_id']<> null then
        KeluhanGrid.Cells[2,IntCount+1]:=Qry.FieldValues['driver_complain_detail_id']
      else KeluhanGrid.Cells[2,IntCount+1]:='';
      Qry.Next;
      Inc(IntCount);
    end;

    //Pekerjaan
    Qry.Close;
    StrQry:='select description,isdone from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=2 and status=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if PekerjaanGrid.RowCount<IntCount+1 then PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      if Qry.FieldValues['description'] <> null then
        PekerjaanGrid.Cells[0,IntCount+1]:=Qry.FieldValues['description']
      else PekerjaanGrid.Cells[0,IntCount+1]:='';

      if Qry.FieldValues['isdone']= 1 then PekerjaanGrid.Cells[1,IntCount+1]:='v'
      else PekerjaanGrid.Cells[1,IntCount+1]:='';

      PekerjaanGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      Qry.Next;
      Inc(IntCount);
    end;

    StrQry:='';
    StrQry:='select service_request_id from wh_work_order where work_order_id='+QuotedStr(WorkOrderId)+'  ;';
    Qry2.SQL.Clear;
    Qry2.Close;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;


    if Qry2.FieldValues['service_request_id']<>NULL then begin
       ServiceRequestId:=Qry2.FieldValues['service_request_id'];
    end else begin
       ServiceRequestId:='';
    end;

    StrQry:='';
    StrQry:='EXEC GetWorkOrderPart @ServiceRequest ='+QuotedStr(ServiceRequestId)+';';


    IntCount:=0;
    Qry2.SQL.Clear;
    Qry2.Close;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;

    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
      PartsGrid.RowCount:=Qry2.RecordCount+1;
        PartsGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        if Qry2.FieldValues['isUsed']='1' then
          PartsGrid.Cells[1,IntCount+1]:='v'
        else
          PartsGrid.Cells[1,IntCount+1]:='';
        PartsGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['item_detail'];
        PartsGrid.Cells[3,IntCount+1]:=Qry2.FieldValues['qty'];
        if Qry2.FieldValues['kode_part_gp']<>NULL then
          PartsGrid.Cells[4,IntCount+1]:=Qry2.FieldValues['kode_part_gp']
        else PartsGrid.Cells[4,IntCount+1]:='';

        PartsGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
        PartsGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
        PartsGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
        Qry2.Next;
        Inc(IntCount);
    end;

    //Mekanik
    StrQry:='';
    StrQry:='select * from wh_work_order_mekanik where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'status=1 ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGridMekanik.Cells[1,IntCount]:= Qry2.FieldValues['status_mekanik'];
      StrGridMekanik.Cells[2,IntCount]:= Qry2.FieldValues['name'];
      StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
      StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;

    //ANALISA
    StrQry:='';
    StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=3 and status=1 ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
      StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid3.Cells[1,IntCount]:= Qry2.FieldValues['description'];
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;

    //Gambar
    StrQry:='';
    StrQry:='select count(*) from wh_work_order_image where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=2 and status=1 ;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then begin
       LoadImagesForEdit(WorkOrderId);
    end;
    Qry2.Close;

//    Qry.Next;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TWorkOrderFormIn.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.M_Busy;
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@Status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      WOArr[IntCount][3]:=Qry.FieldValues['odo_in'];
      WOArr[IntCount][4]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][5]:=Qry.FieldValues['time_in'];
      WOArr[IntCount][6]:=Qry.FieldValues['job_inout'];
      WOArr[IntCount][7]:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['ismemo_khusus']='1' then
      WOArr[IntCount][8]:=Qry.FieldValues['ismemo_khusus']
      else WOArr[IntCount][8]:='';
      if Qry.FieldValues['maintenance_service_id']<> null then
        WOArr[IntCount][9]:= Qry.FieldValues['maintenance_service_id']
      else WOArr[IntCount][9]:= '';

      Qry.Next;
      Inc(IntCount);
    end;
{    StrQry:='SELECT a.work_order_id,b.description FROM wh_work_order a '+
            ' LEFT JOIN wh_work_order_detail b ON b.work_order_id=a.work_order_id'+
            ' WHERE (a.time_out IS NULL) AND (a.date_out IS NULL) AND (b.description_id=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WODetArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WODetArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WODetArr[IntCount][1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
}
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderFormIn.RefreshList;
var IntCount:Integer;
begin
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=WOArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=WOArr[IntCount][6];
    StrGrid.Cells[6,IntCount+1]:=WOArr[IntCount][9];
  end;
  for IntCount:=0 to Length(WOArr)-1 do NoPKB.Items.Add(WOArr[IntCount][0]);
end;

procedure TWorkOrderFormIn.EnableInput;
begin
  NoPKB.Enabled:=True;
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;
  GroupPekerjaan.Enabled:=True;
  Grupinputfoto.Enabled := True;
end;

procedure TWorkOrderFormIn.DisableInput;
begin
  NoPKB.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
  GroupPekerjaan.Enabled:=False;
  Grupinputfoto.Enabled := False;
end;

procedure TWorkOrderFormIn.SelesaiClick(Sender: TObject);
begin
//  ListGambar.Free;
 // ListDeskripsi.Free;
  WorkOrderFormIn.Close;
end;

procedure TWorkOrderFormIn.FormShow(Sender: TObject);
begin
  Init;
  InitPekerjaan;
  InitPartsGrid;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  Cari.Text:='';
  EnableInput;
  if WorkOrderId<>'' then CetakUlang.Visible:=true
  else CetakUlang.Visible:=false;

  if IsReadOnly then begin
    LoadData;
    DisableInput;
  end else begin
    RefreshCombo;
    RefreshData;
    RefreshList;
  end;
end;

procedure TWorkOrderFormIn.FormClose(Sender: TObject;
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

procedure TWorkOrderFormIn.PreparePrint;
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

procedure TWorkOrderFormIn.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry,StrServiceReqID:String;
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
          if  Qry.FieldValues['service_request_id']<>NULL then
          StrServiceReqID:= Qry.FieldValues['service_request_id']
          else StrServiceReqID:='';
          ppNoSR.Caption:=Qry.FieldValues['service_request_id'];
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
//            ppTeknisi.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['technician']);
            Inc(IntCount);
            Qry.Next;
          end;

          //ANALISA
//          Qry.Close;
//          StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(No_PKB)+' AND '+
//                  'description_id=3 and status=1;';
//          ppParts.Lines.Clear;
//          Qry.SQL.Clear;
//          Main.WriteLog('SQL :'+StrQry,2);
//          Qry.SQL.Add(StrQry);
//          Qry.Open;
//          IntCount:=1;
//          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
//            Inc(IntCount);
//            Qry.Next;
//          end;


//          PARTS
          Qry.Close;
          StrQry:='SELECT a.* FROM wh_tanda_terima_detail a '+
                  'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
                  'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
                  'WHERE c.no_request='+QuotedStr(StrServiceReqID)+' AND a.status=1;';

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
          StrQry:='SELECT name,status_mekanik FROM wh_work_order_mekanik '+
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

procedure TWorkOrderFormIn.SetWODetail(WorkOrderId:String);
var Qry,Qry2:TADOQuery;
    StrQry,ServiceRequestId:String;
    IntCount,IntRow:Integer;
begin
  if WorkOrderId<>'' then begin
    {
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    NoBody.Text:=WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=WOArr[NoPKB.ItemIndex][5];
    }
    NoBody.Text:=StrGrid.Cells[1,IntARow];//WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=StrGrid.Cells[2,IntARow];//WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=StrGrid.Cells[4,IntARow];//WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=StrGrid.Cells[5,IntARow];//WOArr[NoPKB.ItemIndex][5];

    if StrGrid.Cells[6,IntARow]='1' then begin
      PanelMemoKhusus.Visible:=True;
      MemoKhusus.Visible:=True;
      MemoKhusus.Checked:=True;
    end else
    begin
      PanelMemoKhusus.Visible:=False;
      MemoKhusus.Checked:=False;
    end;
//    KeluhanGrid.RowCount:=1;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='select work_order_detail_id,description,isdone,driver_complain_detail_id from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=1 and status=1 ';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(KeluhanArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        { SetLength(KeluhanArr,IntCount+1);
          if (Qry.FieldValues['isdone']<>NULL) then
            KeluhanArr[IntCount][0]:=Qry.FieldValues['isdone'];

          KeluhanArr[IntCount][1]:=Qry.FieldValues['description'];
          KeluhanArr[IntCount][2]:=Qry.FieldValues['work_order_detail_id'];

          if (KeluhanArr[IntCount][0]='1') then
            KeluhanGrid.Cells[0,IntCount+1]:='v'
          else
            KeluhanGrid.Cells[0,IntCount+1]:='';
          KeluhanGrid.Cells[1,IntCount+1]:=KeluhanArr[IntCount][1];
          KeluhanGrid.Cells[2,IntCount+1]:=KeluhanArr[IntCount][2];}

          KeluhanGrid.RowCount:=Qry.RecordCount+1;
          if (Qry.FieldValues['isdone']=1) then
            KeluhanGrid.Cells[0,IntCount+1]:='v'
          else
            KeluhanGrid.Cells[0,IntCount+1]:='';
          KeluhanGrid.Cells[1,IntCount+1]:=Qry.FieldValues['description'];
          if Qry.FieldValues['driver_complain_detail_id']<> Null then
             KeluhanGrid.Cells[2,IntCount+1]:=Qry.FieldValues['driver_complain_detail_id']
          else KeluhanGrid.Cells[2,IntCount+1]:='';
          KeluhanGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
          Qry.Next;
          Inc(IntCount);
      end;
//      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
//        if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
//        KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
//        Qry.Next;
//        Inc(IntCount);
//      end;

      //CEK SERVICE REQUEST
      Qry.Close;
      StrQry:='';
      StrQry:='select service_request_id from wh_work_order where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;


      if Qry2.FieldValues['service_request_id']<>NULL then begin
         ServiceRequestId:=Qry2.FieldValues['service_request_id'];
      end else begin
         ServiceRequestId:='';
      end;

//      CEK PART
      StrQry:='EXEC GetPartDiterima '+QuotedStr(ServiceRequestId)+' ;';
//      StrQry:='SELECT a.*,d.IsUsed FROM wh_tanda_terima_detail a '+
//            'LEFT JOIN wh_tanda_terima b ON a.tanda_terima_id=b.tanda_terima_id '+
//            'LEFT JOIN wh_item_request c ON b.item_request_id=c.item_request_id '+
//            'LEFT JOIN wh_work_order_part d on a.kode_part_gp=d.kode_part_gp and d.status=1 '+
//            'WHERE c.no_request='+QuotedStr(ServiceRequestId)+' AND a.status=1;';
      IntCount:=0;
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;

      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        PartsGrid.RowCount:=Qry2.RecordCount+1;
          PartsGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
          if Qry2.FieldValues['isUsed']='1' then
            PartsGrid.Cells[1,IntCount+1]:='v'
          else
            PartsGrid.Cells[1,IntCount+1]:='';
          PartsGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['item_detail'];
          PartsGrid.Cells[3,IntCount+1]:=Qry2.FieldValues['qty'];
          if Qry2.FieldValues['kode_part_gp']<>NULL then
          PartsGrid.Cells[4,IntCount+1]:=Qry2.FieldValues['kode_part_gp']
          else PartsGrid.Cells[4,IntCount+1]:='';

          PartsGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
          PartsGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
          PartsGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
          Qry2.Next;
          Inc(IntCount);
      end;

      //Mekanik
      StrQry:='';
      StrQry:='select * from wh_work_order_mekanik where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'status=1 ;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGridMekanik.RowCount<IntCount+1 then StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
        StrGridMekanik.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGridMekanik.Cells[1,IntCount]:= Qry2.FieldValues['status_mekanik'];
        StrGridMekanik.Cells[2,IntCount]:= Qry2.FieldValues['name'];
        StrGridMekanik.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGridMekanik.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGridMekanik.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry2.Next;
        Inc(IntCount);

      end;
      Qry2.Close;

      //ANALISA
      StrQry:='';
      StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=3 and status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
        StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid3.Cells[1,IntCount]:= Qry2.FieldValues['description'];
        StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
        
        Qry2.Next;
        Inc(IntCount);

      end;

       //PEKERJAAN
      StrQry:='';
      StrQry:='select * from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=2 and status=1 ;';
      Qry2.SQL.Clear;
      Qry2.Close;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if PekerjaanGrid.RowCount<IntCount+1 then PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;

        if Qry2.FieldValues['description'] <> null then
          PekerjaanGrid.Cells[0,IntCount]:= Qry2.FieldValues['description']
        else PekerjaanGrid.Cells[0,IntCount]:='';

        if Qry2.FieldValues['isdone'] =1 then PekerjaanGrid.Cells[1,IntCount]:='v'
        else PekerjaanGrid.Cells[1,IntCount]:='';
//        PekerjaanGrid.CellStyle[0,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry2.Next;
        Inc(IntCount);

      end;

       //Gambar
      StrQry:='';
      StrQry:='select count(*) from wh_work_order_image where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
      'description_id=2 and status=1 ;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then begin
         LoadImagesForEdit(WorkOrderId);
      end;
      //Qry2.Close;

    end;
    FreeAndNil(Qry);
    FreeAndNil(Qry2);
    Main.CloseDb;
  end;
end;

procedure TWorkOrderFormIn.NoPKBChange(Sender: TObject);
begin
  SetWODetail(NoPKB.Text);
end;

procedure TWorkOrderFormIn.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntArow:=Arow;
end;

procedure TWorkOrderFormIn.StrGridClick(Sender: TObject);
begin
  InitPekerjaan;
  InitPartsGrid;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  NoPKB.ItemIndex:=NoPKB.Items.IndexOf(StrGrid.Cells[0,IntARow]);
  SetWODetail(StrGrid.Cells[0,IntARow]);
  NoSB.Text := StrGrid.Cells[6,IntARow];
  
end;

procedure TWorkOrderFormIn.PekerjaanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow3:=ARow;
  IntCol3:=ACol;
  MinRowGrid:=0;
  if (ARow>0) and not(IsReadOnly) AND (NoPKB.Text<>'') then begin
    if (ACol = 0) then begin
      R := PekerjaanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PekerjaanGrid.Left;
      R.Right := R.Right + PekerjaanGrid.Left;
      R.Top := R.Top + PekerjaanGrid.Top;
      R.Bottom := R.Bottom + PekerjaanGrid.Top;
      with PekerjaanDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then Text:=PekerjaanGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;

      end;
    end;
    if (ACol = 1) then begin
      R := PekerjaanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PekerjaanGrid.Left;
      R.Right := R.Right + PekerjaanGrid.Left;
      R.Top := R.Top + PekerjaanGrid.Top;
      R.Bottom := R.Bottom + PekerjaanGrid.Top;
      with chkPekerjaan do begin
        Left:=R.Left + 9;
        Top := R.Top + 1;
        Width :=17;
        Height :=17;
        if PekerjaanGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
//    if (ACol = 1) then begin
//      R := PekerjaanGrid.CellRect(ACol, ARow);
//      R.Left := R.Left + PekerjaanGrid.Left;
//      R.Right := R.Right + PekerjaanGrid.Left;
//      R.Top := R.Top + PekerjaanGrid.Top;
//      R.Bottom := R.Bottom + PekerjaanGrid.Top;
//      with Teknisi do begin
//        Left:=R.Left + 1;
//        Top := R.Top + 1;
//        Width := (R.Right + 1) - R.Left;
//        Height := (R.Bottom + 1) - R.Top;
//        Visible:= True;
//        BringToFront;
//        SetFocus;
//        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then Teknisi.Text:=PekerjaanGrid.Cells[ACol,ARow];
//      end;
//    end;
  end;
end;

procedure TWorkOrderFormIn.PekerjaanDetailExit(Sender: TObject);
begin
  if Trim(PekerjaanDetail.Text)<>'' then PekerjaanGrid.Cells[0,PekerjaanGrid.Row]:=PekerjaanDetail.Text;
  PekerjaanDetail.Text:='';
  PekerjaanDetail.Visible := False;
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderFormIn.PekerjaanDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if (Key=#13) then begin
//    PekerjaanDetailExit(nil);
//
//    if PekerjaanGrid.Cells[2,IntRow]<>'' then begin
//
//      if (PekerjaanGrid.Row=StrGrid2.RowCount-1)  then begin
//        PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
//        PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
//      end;
//      PekerjaanGrid.Col:=0;
//      PekerjaanGrid.Row:=StrGrid2.Row+1;
//      PekerjaanGrid.Col:=1;
//    end;
//  end;


  if (Key=#13) then begin
    PekerjaanDetailExit(nil);
    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
  end;
//  if (Key=#27) then begin
//    PekerjaanDetailExit(nil);
//  end;
end;

procedure TWorkOrderFormIn.BersihkanClick(Sender: TObject);
begin
  EnableInput;
  Init;
  InitPartsGrid;
  InitPekerjaan;
  InitKeluhanGrid;
  InitGrid3;
  InitGrid4;
  RefreshData;
  RefreshList;
  RefreshCombo;
end;

procedure TWorkOrderFormIn.PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key=38 then begin
//    if PekerjaanGrid.Row>0 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
//    end;
//  end;
//  if Key=39 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Col:=1;
//  end;
//  if Key=40 then begin
//    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
//      PekerjaanDetailExit(nil);
//      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
//    end;
//  end
end;

procedure TWorkOrderFormIn.TeknisiExit(Sender: TObject);
begin
  if Trim(Teknisi.Text)<>'' then PekerjaanGrid.Cells[1,PekerjaanGrid.Row]:=Teknisi.Text;
  Teknisi.Visible := False;
  Teknisi.Text:='';
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderFormIn.TeknisiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=37 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=0;
      PekerjaanGrid.Row:=PekerjaanGrid.Row;  
  end;
  if Key=38 then begin
    if PekerjaanGrid.Row>0 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=1;
      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    end;
  end
end;

procedure TWorkOrderFormIn.TeknisiKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    TeknisiExit(nil);
    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
    PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    PekerjaanGrid.Col:=0;
    PekerjaanDetail.SetFocus;
  end;
  if (Key=#27) then begin
    TeknisiExit(nil);
  end;
end;

procedure TWorkOrderFormIn.SimpanClick(Sender: TObject);
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrQry3,StrStatus,StrMsg,StrEMsg,StrTransId,
    StrVhcId,StrKeluhan,StrAnalisa,StrDone,StrIsUsed,
    StrMekanik,StrStatusMekanik,StrPart,StrQty,StrKodePart,
    StrTanggalSelesai,StrJamSelesai, StrSRDetailID, StrIsdone,
    ImageName,StrException, CompressedFile, FilePath:String;
    IntCount,IntStatus, I:Integer;
    IsOk, IsOK2, IsOK3:Boolean;
    StmImage: TMemoryStream;
begin
  if (NoPKB.Text<>'') AND (Trim(PekerjaanGrid.Cells[0,0])<>'') then begin
    StrTransId:=NoPKB.Text;
    StrVhcId:=WOArr[ArrayIndexOf(WOArr,NoPKB.Text,0)][7];
    IsOk:=True;

    if chkClose.Checked = True then
    begin
      StrStatus:=',status=2';
      StrTanggalSelesai:='='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalSelesai.Date));
      StrJamSelesai:='='+QuotedStr(JamSelesai.Text+':00');

    end else
    begin
      StrStatus:='';
      StrTanggalSelesai:=' = NULL';
      StrJamSelesai:=' = NULL';
    end;

    IsOK2 := False;
    for IntCount :=1 to KeluhanGrid.RowCount-1 do begin
     // MessageBox(0,PChar(KeluhanGrid.Cells[0,IntCount]) ,'Keluhan',MB_OK or MB_ICONWARNING);
       if KeluhanGrid.Cells[0,IntCount] = 'v' then begin
        IsOK2 := True;
        Break;
       end else IsOK2 := FALSE;
    end;

    IsOK3 := False;
    for IntCount :=1 to PekerjaanGrid.RowCount-1 do begin
     // MessageBox(0,PChar(KeluhanGrid.Cells[0,IntCount]) ,'Keluhan',MB_OK or MB_ICONWARNING);
       if PekerjaanGrid.Cells[1,IntCount] = 'v' then begin
        IsOK3 := True;
        Break;
       end else IsOK3 := FALSE;
    end;


    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Qry3:=TADOQuery.Create(Self);
    Qry3.Connection:=Main.MyConnection;
    StmImage := TMemoryStream.Create;
   // if IsOK2 = False then begin
    //  if MessageBox(0,PChar('Keluhan Belum ada yang diceklist,'+#13#10+'Yakin mau melanjutkan..?') ,'Keluhan',MB_OKCANCEL or MB_ICONWARNING)=1 then begin
        if Main.OpenDb then begin
          StrMsg:='';
          StrEMsg:='';
          StrQry:='';
          Main.TransStart;
          if chkClose.Checked = True then
          begin

            if IsOK2 = False then begin
              if MessageBox(0,PChar('Keluhan Belum ada yang diceklist,'+#13#10+'Yakin mau melanjutkan..?') ,'Keluhan',MB_OKCANCEL or MB_ICONWARNING)=1 then begin
                if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
                  IsOk:=False;
                  StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk'
                end;
                StrQry:='UPDATE wh_work_order SET date_out'+StrTanggalSelesai+
                      ',time_out'+StrJamSelesai+StrStatus+', user_close='+QuotedStr(User)+' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
              end
               else begin
                IsOk:=False;
                IsOK2 := False;
                StrEMsg:='Silahkan Ceklis Keluhan';
              end;
            end else if IsOK3 = False then begin
              if MessageBox(0,PChar('Pekerjaan Belum ada yang diceklist,'+#13#10+'Yakin mau melanjutkan..?') ,'Keluhan',MB_OKCANCEL or MB_ICONWARNING)=1 then begin
                if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
                  IsOk:=False;
                  StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk'
                end;
                StrQry:='UPDATE wh_work_order SET date_out'+StrTanggalSelesai+
                      ',time_out'+StrJamSelesai+StrStatus+', user_close='+QuotedStr(User)+' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
              end
               else begin
                IsOk:=False;
                IsOK3 := False;
                StrEMsg:='Pekerjaan Ceklis Keluhan';
              end;

            end else  begin
              if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
                  IsOk:=False;
                  StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk' ;
              end;
                StrQry:='UPDATE wh_work_order SET date_out'+StrTanggalSelesai+
                      ',time_out'+StrJamSelesai+StrStatus+', user_close='+QuotedStr(User)+' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';

              //Penambahan KM Prediksi
              if NoSB.Text <> '' then begin

                StrQry3:='';
                StrQry3:=' UPDATE wh_maintenance_service SET odo_predict = (odo_in + 10000) '+
                        ' WHERE maintenance_service_id ='+QuotedStr(NoSB.Text)+';';
                Qry3.SQL.Add(StrQry3);
                try
                  Qry3.ExecSQL;
                except
                  on E:Exception do begin
                    IsOk:=False;
                    StrMsg:='Gagal Menambah Odo prediksi';
                    StrEMsg:=E.Message;
                  end;
                end;
              end;
            end;

          end else begin
            StrQry:='UPDATE wh_work_order SET update_user='+QuotedStr(User)+
                    ' WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
          end;

          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Pekerjaan';
              StrEMsg:=E.Message;
            end;
          end;

          StrQry:='';
          StrQry:='UPDATE wh_work_order_detail SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+' and description_id=2;';
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

          //Pekerjaan
          for IntCount:=1 to PekerjaanGrid.RowCount-1 do begin
            //StrSRDetailID := QuotedStr(KeluhanGrid.Cells[2,IntCount]);
            if PekerjaanGrid.Cells[1,IntCount]= 'v' then StrIsdone := '1'
            else StrIsdone := '(NULL)';
            if Trim(PekerjaanGrid.Cells[0,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,isdone,update_user)'+
                    ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',2'+
                    ','+Chr(39)+PekerjaanGrid.Cells[0,IntCount]+Chr(39)+
                    ','+Chr(39)+StrIsdone+Chr(39)+
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

          //KELUHAN
          StrQry:='';
          StrQry:='UPDATE wh_work_order_detail SET status=0 WHERE work_order_id='+QuotedStr(StrTransId)+' and description_id=1;';
          Qry2.SQL.Add(StrQry);
          try
            Qry2.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Keluhan';
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
              StrQry:= StrQry+' INSERT INTO wh_work_order_mekanik (work_order_id,name,status_mekanik,status)'+
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
          for IntCount:=1 to KeluhanGrid.RowCount-1 do begin
              StrKeluhan:=QuotedStr(KeluhanGrid.Cells[1,IntCount]);
              StrSRDetailID := QuotedStr(KeluhanGrid.Cells[2,IntCount]);
    //          StrDone:=QuotedStr(KeluhanGrid.Cells[0,IntCount]);
              if (KeluhanGrid.Cells[0,IntCount])='v' then
              StrDone:='1' else StrDone:='0';
              if Trim(KeluhanGrid.Cells[1,IntCount])<>'' then
                StrQry:= StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                        ',description,update_user,isdone,driver_complain_detail_id)'+
                        ' VALUES ('+QuotedStr(StrTransId)+',1'+
                        ','+StrKeluhan+
                        ','+QuotedStr(User)+', '+
                        ''+QuotedStr(StrDone)+', '+StrSRDetailID+'); ';
          end;
          Qry2.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry2.SQL.Add(StrQry);
          try
            Qry2.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Keluhan';
              StrEMsg:=E.Message;
            end;
          end;

          //PARTS
          StrQry:='';
          StrQry:='UPDATE wh_work_order_part SET status=0 WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
          Qry3.SQL.Add(StrQry);
          try
            Qry3.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Keluhan';
              StrEMsg:=E.Message;
            end;
          end;

          StrQry:='';
          for IntCount:=1 to PartsGrid.RowCount-1 do begin
            StrPart:=QuotedStr(PartsGrid.Cells[2,IntCount]);
            StrQty:=QuotedStr(PartsGrid.Cells[3,IntCount]);
            StrKodePart:=QuotedStr(PartsGrid.Cells[4,IntCount]);
            if (PartsGrid.Cells[1,IntCount])='v' then
              StrIsUsed:='1' else StrIsUsed:='0';
            if PartsGrid.Cells[2,1]<>'' then
              StrQry:=StrQry+' INSERT INTO wh_work_order_part (work_order_id,part_name'+
                      ',qty,status,IsUsed,kode_part_gp)'+
                      ' VALUES ('+QuotedStr(StrTransId)+
                      ','+StrPart+
                      ','+StrQty+',1,'+QuotedStr(StrIsUsed)+','+StrKodePart+'); ';
          end;
          Qry3.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry3.SQL.Add(StrQry);
          try
            Qry3.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Parts';
              StrEMsg:=E.Message;
            end;
          end;

          //Analisa
          StrQry:='Update wh_work_order_detail set status=0 where work_order_id='+QuotedStr(StrTransId)+
                  ' and description_id=3';
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

          StrQry:='DELETE wh_vhc_hold WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Pekerjaan';
              StrEMsg:=E.Message;
            end;
          end;

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
              'VALUES ('+QuotedStr(StrTransId)+', 2, :p_name, :p_img, :p_desc, 1, GETDATE(), :usr)';

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
            if chkClose.Checked= True then
             MessageBox(0,'PKB berhasil ditutup','Tutup PKB',MB_OK or MB_ICONINFORMATION)
            else MessageBox(0,'PKB berhasil diSimpan','Tutup PKB',MB_OK or MB_ICONINFORMATION)
          end else begin
            Main.TransRollback;
            if StrMsg<>'' then StrMsg:=StrMsg+Chr(13)+Chr(13);
            if IsOK2 = False then begin
              MessageBox(0,PChar(StrEMsg),'Tutup PKB',MB_OK or MB_ICONINFORMATION);
            end else
            MessageBox(0,PChar(StrMsg+'Kesalahan'+Chr(13)+StrEMsg),'Tutup PKB',MB_OK or MB_ICONERROR);
          end;
          Main.CloseDb;
        end;
     // end;
    //end;
  end else
    MessageBox(0,'Silahkan isi kolom data yg kosong','Tutup PKB',MB_OK or MB_ICONERROR);
end;

procedure TWorkOrderFormIn.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(WOArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(WOArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[0,Count2-1]:=WOArr[Count][0];
          StrGrid.Cells[1,Count2-1]:=WOArr[Count][1];
          StrGrid.Cells[2,Count2-1]:=WOArr[Count][2];
          StrGrid.Cells[3,Count2-1]:=WOArr[Count][3];
          StrGrid.Cells[4,Count2-1]:=WOArr[Count][4];
          StrGrid.Cells[5,Count2-1]:=WOArr[Count][6];
          StrGrid.Cells[6,Count2-1]:=WOArr[Count][9];
          NoPKB.Items.Add(WOArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TWorkOrderFormIn.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search; 
end;

procedure TWorkOrderFormIn.TombolCariClick(Sender: TObject);
begin
  Search;
  RefreshCombo;
end;

procedure TWorkOrderFormIn.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshList;
    RefreshCombo;
  end;
end;

procedure TWorkOrderFormIn.PartsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
//    if (PartsGrid.Cells[5,ARow]='')  then begin
      R := PartsGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PartsGrid.Left;
      R.Right := R.Right + PartsGrid.Left;
      R.Top := R.Top + PartsGrid.Top;
      R.Bottom := R.Bottom + PartsGrid.Top;
      case ACol of
        1 :with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if PartsGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;

      end;
end;

procedure TWorkOrderFormIn.CetakUlangClick(Sender: TObject);
begin
  if WorkOrderId<>'' then RePrint(WorkOrderId)
end;

procedure TWorkOrderFormIn.MekanikExit(Sender: TObject);
begin

  if Trim(Mekanik.Text)<>'' then begin
    StrGridMekanik.Cells[2,IntRow]:=Mekanik.Text;
    StrGridMekanik.CellStyle[2,IntRow].HorizontalAlignment:=taLeftJustify;
  end;
  Mekanik.Text:='';
  Mekanik.Visible := False;
  Calculate4;
end;

procedure TWorkOrderFormIn.MekanikKeyPress(Sender: TObject; var Key: Char);
 var
  IntCount: Integer;
begin
  if (Key=#13) then begin
    MekanikExit(nil);
    if (StrGridMekanik.Row=StrGridMekanik.RowCount-1) AND (StrGridMekanik.RowCount<=IntMaxRow)  then begin
      StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      for IntCount:=0 to 4 do StrGridMekanik.Cells[IntCount,StrGridMekanik.RowCount-1]:='';
      StrGridMekanik.CellStyle[0,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGridMekanik.Col:=0;
    StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
    StrGridMekanik.Col:=1;

  end;
  if (Key=#27) then begin
    MekanikExit(nil);
  end;
end;

procedure TWorkOrderFormIn.StrGrid3SelectCell(Sender: TObject; ACol,
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

procedure TWorkOrderFormIn.AnalisaExit(Sender: TObject);
begin
  if Trim(Analisa.Text)<>'' then begin
    StrGrid3.Cells[IntCol,IntRow]:=Analisa.Text;
    Calculate2;
  end;
  Analisa.Text:='';
  Analisa.Visible := False;
  StrGrid3.SetFocus;
end;

procedure TWorkOrderFormIn.AnalisaKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    AnalisaExit(nil);
    Calculate2;
    if (StrGrid3.RowCount=StrGrid3.RowCount-1) AND (StrGrid3.RowCount<=IntMaxRow)  then begin
      StrGrid3.RowCount:=StrGrid3.RowCount+1;
      for IntCount:=0 to 1 do StrGrid3.Cells[IntCount,StrGrid3.RowCount-1]:='';
      StrGrid3.CellStyle[0,StrGrid3.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid3.CellStyle[1,StrGrid3.RowCount-1].HorizontalAlignment:=taLeftJustify;
    end;
//    StrGrid3.Col:=0;
    StrGrid3.RowCount:=StrGrid3.RowCount+1;
//    StrGrid3.Col:=1;
  end;
  if (Key=#27) then begin
    AnalisaExit(nil);
  end;
end;

procedure TWorkOrderFormIn.KeteranganExit(Sender: TObject);
begin
  if Trim(Keterangan.Text)<>'' then PartsGrid.Cells[4,PartsGrid.Row]:=Keterangan.Text;
  Keterangan.Visible := False;
  Keterangan.Text:='';
  PartsGrid.SetFocus;
end;

procedure TWorkOrderFormIn.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    PartsGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    PartsGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  PartsGrid.SetFocus;
end;

procedure TWorkOrderFormIn.KeluhanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow2:=ARow;
  IntCol2:=ACol;
  MinRowGrid:=0;
      R := KeluhanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + KeluhanGrid.Left;
      R.Right := R.Right + KeluhanGrid.Left;
      R.Top := R.Top + KeluhanGrid.Top;
      R.Bottom := R.Bottom + KeluhanGrid.Top;
      case ACol of
        0 :with chkkeluhan do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if KeluhanGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;

      end;


//  if (IsInput) then begin
 {   if (KeluhanGrid.Cells[4,ARow]='')  then begin
      R := KeluhanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + KeluhanGrid.Left;
      R.Right := R.Right + KeluhanGrid.Left;
      R.Top := R.Top + KeluhanGrid.Top;
      R.Bottom := R.Bottom + KeluhanGrid.Top;
      case ACol of
        0 :with chkkeluhan do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if KeluhanGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;}
end;

procedure TWorkOrderFormIn.StrGridMekanikSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) and (NoPKB.Text<>'') then begin
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
  if (ACol = 2) and (ARow > MinRowGrid) and (NoPKB.Text<>'') then begin
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

procedure TWorkOrderFormIn.StatusMekanikExit(Sender: TObject);
begin
  if Trim(StatusMekanik.Text)<>'' then begin
    StrGridMekanik.Cells[IntCol,IntRow]:=StatusMekanik.Text;
  end;
  StatusMekanik.Text:='';
  StatusMekanik.Visible := False;
  StrGridMekanik.SetFocus;
end;

procedure TWorkOrderFormIn.chkCloseClick(Sender: TObject);
begin
  if chkClose.Checked=True then
  begin
    Label6.Visible:=True;
    TanggalSelesai.Visible:=True;
    Label9.Visible:=True;
    JamSelesai.Visible:=True;
    chkSBSelanjutnya.Visible := True;
  end else
  begin
    Label6.Visible:=False;
    TanggalSelesai.Visible:=False;
    Label9.Visible:=False;
    JamSelesai.Visible:=False;
    chkSBSelanjutnya.Visible := False;
  end;
end;

procedure TWorkOrderFormIn.chkkeluhanExit(Sender: TObject);
var
  IntCount : Integer;
begin
  if chkkeluhan.Checked=True then begin
    KeluhanGrid.Cells[IntCol2,IntRow2]:='v';
    //MessageBox(0,PChar(KeluhanArr[IntCount][0]),'Service Request',MB_OK or MB_ICONERROR);

    //KeluhanGrid.Cells[2,IntCount+1]

  end else begin
    KeluhanGrid.Cells[IntCol2,IntRow2]:='';
  end;
  chkkeluhan.Checked:=False;
  chkkeluhan.Visible:=False;
  KeluhanGrid.SetFocus;


  { for IntCount:=1 to KeluhanGrid.RowCount-1 do begin
          StrKeluhan:=QuotedStr(KeluhanGrid.Cells[1,IntCount]);
//          StrDone:=QuotedStr(KeluhanGrid.Cells[0,IntCount]);
          if (KeluhanGrid.Cells[0,IntCount])='v' then
          StrDone:='1' else StrDone:='0';
          if Trim(KeluhanGrid.Cells[1,IntCount])<>'' then
            StrQry:= StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,update_user,isdone)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrKeluhan+
                    ','+QuotedStr(User)+', '+
                    ''+QuotedStr(StrDone)+'); ';
      end;
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry2.SQL.Add(StrQry);
      try
        Qry2.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Keluhan';
          StrEMsg:=E.Message;
        end;
      end; }



end;

procedure TWorkOrderFormIn.chkPekerjaanExit(Sender: TObject);
begin
  if chkPekerjaan.Checked=True then begin
    PekerjaanGrid.Cells[IntCol3,IntRow3]:='v';
  end else begin
    PekerjaanGrid.Cells[IntCol3,IntRow3]:='';
  end;
  chkPekerjaan.Checked:=False;
  chkPekerjaan.Visible:=False;
  PekerjaanGrid.SetFocus;

end;

procedure TWorkOrderFormIn.TambahFotoClick(Sender: TObject);
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
  Pic: TPicture;
  FileInfo: TSearchRec;
  FileSizeInBytes: Int64;
begin
  // Pilih gambar
  if not OpenPictureDialog1.Execute then Exit;
  FilePath := OpenPictureDialog1.FileName;

  // Cek ukuran file (max 3MB)
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

  // Minta deskripsi
  Deskripsi := InputBox('Deskripsi Gambar', 'Masukkan keterangan gambar:', '');

  // Simpan ke list
  ListGambar.Add(FilePath);
  ListDeskripsi.Add(Deskripsi);

  // === BUAT IMAGE ===
  NewImage := TImage.Create(ScrollBox1);
  NewImage.Parent := ScrollBox1;
  NewImage.Width := 250;
  NewImage.Height := 180;
  NewImage.Stretch := True;
  NewImage.Proportional := True;
  NewImage.OnMouseDown := ImageRightClick;

  // Load gambar AMAN (PNG/JPG)
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FilePath);
    NewImage.Picture.Assign(Pic.Graphic);
  finally
    Pic.Free;
  end;

  // === LABEL DESKRIPSI ===
  NewLabel := TLabel.Create(ScrollBox1);
  NewLabel.Parent := ScrollBox1;
  NewLabel.Caption := 'Keterangan: ' + Deskripsi;
  NewLabel.WordWrap := True;
  NewLabel.Width := 200;

  // Pair image <-> label
  NewImage.Tag := NativeInt(NewLabel);

  // Rapikan ulang layout
  ReLayoutImages;
end; }


procedure TWorkOrderFormIn.ReLayoutImages;
var
  i, Margin, Spacing, Row: Integer;
  Img: TImage;
  Lbl: TLabel;
begin
  Margin := 10;
  Spacing := 20;
  Row := 0;

  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
    if ScrollBox1.Controls[i] is TImage then
    begin
      Img := TImage(ScrollBox1.Controls[i]);

      Img.Left := Margin;
      Img.Top := Margin + (Row * (Img.Height + Spacing));

      // Geser label pasangannya
      if (Img.Tag <> 0) and (TObject(Img.Tag) is TLabel) then
      begin
        Lbl := TLabel(Img.Tag);
        Lbl.Left := Img.Left + Img.Width + 15;
        Lbl.Top := Img.Top + (Img.Height div 2) - 10;
      end;

      Inc(Row);
    end;
  end;

  ScrollBox1.Repaint;
end;

procedure TWorkOrderFormIn.FormCreate(Sender: TObject);
begin
  ListGambar := TStringList.Create;
  ListDeskripsi := TStringList.Create;
end;

procedure TWorkOrderFormIn.ImageRightClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
  end ELSE  MessageBox(0,'Gambar tidak bisa dihapus','Tutup PKB',MB_OK or MB_ICONWARNING);
end;

procedure TWorkOrderFormIn.HapusSemuaFotoClick(Sender: TObject);
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

procedure TWorkOrderFormIn.ShowSavedImage(const FilePath, Deskripsi: string);
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
end;

{procedure TWorkOrderFormIn.LoadAllImages;
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
    StrQry:='SELECT * FROM wh_work_order_image'+
            ' WHERE status = 1 AND description_id = 2 AND work_order_id ='+QuotedStr(WorkOrderId);
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

{procedure TWorkOrderFormIn.CompressAndSaveImage(const SrcFile, DestFile: string;
MaxWidth, MaxHeight, JpegQuality: Integer);
var
  SrcPic: TPicture;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  Scale: Double;
  NewW, NewH: Integer;
begin
  SrcPic := TPicture.Create;
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    // Load gambar (jpg / png / bmp)
    SrcPic.LoadFromFile(SrcFile);

    // Convert ke Bitmap (AMAN)
    Bmp.Assign(SrcPic.Graphic);

    // Hitung skala resize
    Scale := Min(MaxWidth / Bmp.Width, MaxHeight / Bmp.Height);
    if Scale > 1 then Scale := 1; // jangan diperbesar

    NewW := Round(Bmp.Width * Scale);
    NewH := Round(Bmp.Height * Scale);

    // Resize
    Bmp.Width  := NewW;
    Bmp.Height := NewH;
    Bmp.Canvas.StretchDraw(
      Rect(0, 0, NewW, NewH),
      SrcPic.Graphic
    );

    // Simpan sebagai JPEG terkompres
    Jpg.Assign(Bmp);
    Jpg.CompressionQuality := JpegQuality; // 60–80 recommended
    Jpg.SaveToFile(DestFile);

  finally
    SrcPic.Free;
    Bmp.Free;
    Jpg.Free;
  end;
end;}

procedure TWorkOrderFormIn.SimpanFotoClick(Sender: TObject);
begin
  SaveImagesToDB;
end;

procedure TWorkOrderFormIn.CompressImageToStream(const SrcFile: string;Stream: TMemoryStream;
  MaxWidth, MaxHeight, Quality: Integer);
var
 SrcBmp, DstBmp: TBitmap;
  Jpg: TJPEGImage;
  Scale: Double;
  NewW, NewH: Integer;

begin
  SrcBmp := TBitmap.Create;
  DstBmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    SrcBmp.LoadFromFile(SrcFile);

    Scale := MaxWidth / SrcBmp.Width;
    if (SrcBmp.Height * Scale) > MaxHeight then
      Scale := MaxHeight / SrcBmp.Height;
    if Scale > 1 then Scale := 1;

    NewW := Round(SrcBmp.Width * Scale);
    NewH := Round(SrcBmp.Height * Scale);

    DstBmp.PixelFormat := pf24bit;
    DstBmp.Width := NewW;
    DstBmp.Height := NewH;

    SetStretchBltMode(DstBmp.Canvas.Handle, HALFTONE);
    DstBmp.Canvas.StretchDraw(Rect(0, 0, NewW, NewH), SrcBmp);

    Jpg.Assign(DstBmp);
    Jpg.CompressionQuality := Quality; // 60–80 ideal
    Jpg.Compress;

    Stream.Clear;
    Jpg.SaveToStream(Stream);
    Stream.Position := 0;
  finally
    SrcBmp.Free;
    DstBmp.Free;
    Jpg.Free;
  end;
end;

{procedure TWorkOrderFormIn.CompressImageToJpeg(const SrcFile, DestFile: string; MaxWidth, MaxHeight, Quality: Integer);
var
  Pic: TPicture;
  SrcBmp, DstBmp: TBitmap;
  JPG: TJPEGImage;
  Scale: Double;
  NewW, NewH: Integer;
begin
  Pic := TPicture.Create;
  SrcBmp := TBitmap.Create;
  DstBmp := TBitmap.Create;
  JPG := TJPEGImage.Create;
  try
    // LOAD GAMBAR (JPG / PNG / BMP)
    Pic.LoadFromFile(SrcFile);

    // CONVERT KE BITMAP
    SrcBmp.Assign(Pic.Graphic);

    // VALIDASI (INI PENTING!)
    if (SrcBmp.Width = 0) or (SrcBmp.Height = 0) then
      raise Exception.Create('Bitmap image is not valid');

    // HITUNG SKALA
    Scale := MaxWidth / SrcBmp.Width;
    if SrcBmp.Height * Scale > MaxHeight then
      Scale := MaxHeight / SrcBmp.Height;

    if Scale > 1 then Scale := 1;

    NewW := Round(SrcBmp.Width * Scale);
    NewH := Round(SrcBmp.Height * Scale);

    // RESIZE
    DstBmp.Width := NewW;
    DstBmp.Height := NewH;
    DstBmp.Canvas.StretchDraw(Rect(0,0,NewW,NewH), SrcBmp);

    // SIMPAN KE JPEG
    JPG.Assign(DstBmp);
    JPG.CompressionQuality := Quality; // 60–80 ideal
    JPG.SaveToFile(DestFile);

  finally
    Pic.Free;
    SrcBmp.Free;
    DstBmp.Free;
    JPG.Free;
  end;
end;  }

Function TWorkOrderFormIn.CompressImageToTemp(const SrcFile: string): string;
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

procedure TWorkOrderFormIn.SaveImagesToDB;
var
  I: Integer;
  StmImage: TMemoryStream;
  Qry: TADOQuery;
  ImageName, StrQry, StrTransId, StrMsg, StrException: string;
  IsOk:Boolean;
begin
  if (NoPKB.Text <>'') then begin
    StrTransId:=NoPKB.Text;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StmImage := TMemoryStream.Create;
    if Main.OpenDb then begin
      for I := 0 to ListGambar.Count - 1 do
      begin
         StmImage.LoadFromFile(ListGambar[I]);
         StmImage.Position := 0;
      // Compress otomatis
       // CompressImageToStream(ListGambar[I],StmImage,1280,1280,70);
        ImageName := ExtractFileName(ListGambar[I]);
        StrQry :=
          'INSERT INTO wh_work_order_image '+
          '(work_order_id, description_id, image_name, image, description, status, update_time, update_user) '+
          'VALUES ('+QuotedStr(StrTransId)+', 2, :p_name, :p_img, :p_desc, 1, GETDATE(), :usr)';

        Qry.SQL.Clear;
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
      Qry.Close;
      Main.CloseDb;
    end;

    if IsOk then begin
      MessageBox(0,'Berhasil enambah Gambar','Tutup PKB',MB_OK or MB_ICONINFORMATION);
      Init;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Tutup PKB',MB_OK or MB_ICONERROR);
    end;

 end else
    MessageBox(0,'PKB belum dipilih','Tutup PKB',MB_OK or MB_ICONERROR);
end;

procedure TWorkOrderFormIn.FormDestroy(Sender: TObject);
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

procedure TWorkOrderFormIn.LoadImagesForEdit;
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
        'WHERE work_order_id = :id AND status = 1 AND description_id = 2';

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

{Var
  Qry: TADOQuery;
  TmpFile: string;
  Stm: TMemoryStream;
begin
// Bersihkan tampilan lama
  ScrollBox1.DestroyComponents;
  ListGambar.Clear;
  ListDeskripsi.Clear;


  Qry := TADOQuery.Create(nil);
  try
    Qry.Connection := Main.MyConnection;
    Qry.SQL.Text :=
      'SELECT image_name, image, description '+
      'FROM wh_work_order_image '+
      'WHERE work_order_id = :id AND status = 1 AND description_id = 2';

    Qry.Parameters.ParamByName('id').Value := WorkOrderId;
    Qry.Open;

    while not Qry.Eof do
    begin
      // === Simpan BLOB ke file sementara ===
      TmpFile :=SafeTempDir+FormatDateTime('yyyymmddhhnnsszzz', Now) + '_' +Qry.FieldByName('image_name').AsString;

      Stm := TMemoryStream.Create;
      try
        TBlobField(Qry.FieldByName('image')).SaveToStream(Stm);
        Stm.Position := 0;
        Stm.SaveToFile(TmpFile);
      finally
        Stm.Free;
      end;

      // === Simpan ke list ===
      ListGambar.Add(TmpFile);
      ListDeskripsi.Add(Qry.FieldByName('description').AsString);

      // === Tampilkan ke ScrollBox ===
      ShowImageOnScrollBox(
        TmpFile,
        Qry.FieldByName('description').AsString
      );

      Qry.Next;
    end;

  finally
    Qry.Free;
  end;
end;}


procedure TWorkOrderFormIn.ShowImageOnScrollBox(
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

{procedure TWorkOrderFormIn.ShowImageOnScrollBox(
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
    Pic.LoadFromFile(FilePath);
    Img.Picture.Assign(Pic.Graphic);
  finally
    Pic.Free;
  end;

  Lbl := TLabel.Create(ScrollBox1);
  Lbl.Parent := ScrollBox1;
  Lbl.Caption := 'Keterangan: ' + Desc;
  Lbl.WordWrap := True;
  Lbl.Width := 200;

  Img.Tag := NativeInt(Lbl);

  ReLayoutImages;
end;}



end.
