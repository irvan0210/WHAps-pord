unit WorkOrderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppBands, ppReport, ppSubRpt,
  ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ZColorStringGrid;

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
    Label2: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    GroupExternal: TGroupBox;
    GeneralRepair: TCheckBox;
    BodyRepair: TCheckBox;
    Asuransi: TCheckBox;
    GroupDetail: TGroupBox;
    StrGrid: TStringGrid;
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
    GroupNo: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    NoPKB: TEdit;
    Jam: TEdit;
    GroupInput: TPanel;
    StartDate: TDateTimePicker;
    FinishDate: TDateTimePicker;
    FinishUnknown: TCheckBox;
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
    PanelInOut: TPanel;
    Internal: TRadioButton;
    Eksternal: TRadioButton;
    GroupBox3: TGroupBox;
    StrGrid3: TZColorStringGrid;
    Analisa: TEdit;
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
    Selesai: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    PanelMemoKhusus: TPanel;
    MemoKhusus: TCheckBox;
    Memo1: TMemo;
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
  private
    { Private declarations }
    VhcArr:Array of TArrString7;
    WOArr:Array of TArrString10;
    WODetArr:Array of TArrString2;
    IntRow,IntCol,CompId,MinRow:Integer;
    FormRequest,WorkOrderId,VehicleId:String;
    Initiation,IsReadOnly,IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure InitGrid2;
    procedure InitGrid3;
    procedure InitGrid4;
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
    procedure Calculate4;
    procedure SetOdo(License_plate:String);
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);overload;
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetServiceRequestId(ServiceRequest_Id:String);
  end;

var
  WorkOrderForm: TWorkOrderForm;
  IntRow,IntCol,MinRowGrid,IntMaxRow,MinRow2:Integer;

implementation

uses MainU, RePrintFormU, AuthorizedFormU, DateUtils,
  VehicleListU, ServiceRequestListU, WorkOrderListU, IdHTTP, IdException, 
  IdStack, uLkJSON;

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
 url:='http://api.whitehorse.co.id/api_transtrack/vehicle.php?plate='+License_plate;
// url:='http://api.whitehorse.co.id/api_transtrack/vehicle.php?plate=B7265PGA';
 IdHTTP.Get(url, resp);
 resp.Position := 0;
 Memo1.Lines.LoadFromStream(resp);
  js := TlkJSON.ParseText(Memo1.Text);
  if Assigned(js) then
  begin
    js := js.Field['kmodo'];
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

procedure TWorkOrderForm.Init;
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
  StrGrid3.ColWidths[1]:=260;

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
        SetOdo(Qry.FieldValues['license_plate']);
        if KMOdo.Text='0' then
        begin
          if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
        end;
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
        SetOdo(Qry.FieldValues['license_plate']);
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
    StrQry:='select description from wh_work_order_detail where work_order_id='+QuotedStr(WorkOrderId)+' AND '+
    'description_id=1 and status=1 ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
      KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
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
    end;
end;

procedure TWorkOrderForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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
  if FormRequest<>'Buka PKB' then
  begin
//    WorkOrderForm.Width:='1059';
    GroupDetail.Visible:=True;
    RefreshCombo;
    RefreshGrid;
  end else
  begin
//    WorkOrderForm.Width:='678';
    GroupDetail.Visible:=False;
  end;
  if WorkOrderId<>'' then begin
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
    StrQry,StrMaxId,StrKMOdo,StrGenRep,StrBodRep,StrAnalisa,StrAnsur,StrMsg,StrEMsg,StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrFinishDates,StrDescription,StrServiceRequestId,StrPart,StrQty,StrKodePart,StrMekanik,StrStatusMekanik:String;
    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
    ADate,AMonth,AYear:Word;
    TglMulai, TglSelesai:TDateTime;
begin
  Main.M_Busy;
  if (NoBody.Text<>'') AND ((Internal.Checked) OR (Eksternal.Checked)) AND
  (Trim(KeluhanGrid.Cells[0,0])<>'')  then begin
    IsOk:=True;
    IsCetak:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

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
                  ',time_in,date_out,general_repair,body_repair,insurance,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+StrServiceRequestId+
                  ','+StrVhcId+','+IntToStr(IntJobInEx)+','+StrKMOdo+','+StrStartDate+',GETDATE()'+
                  ','+StrFinishDate+','+StrGenRep+','+StrBodRep+','+StrAnsur+','+Chr(39)+User+Chr(39)+');';
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
          if Trim(KeluhanGrid.Cells[0,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,update_user,isdone)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrDescription+
                    ','+QuotedStr(User)+',0); ';
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
          if StrTransId<>'' then
            if MessageBox(0,'PKB berhasil disimpan, Mau Dicetak ?','Buka PKB',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then IsCetak:=True;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka PKB',MB_OK or MB_ICONERROR);
        end;
        if IsOk AND IsCetak then begin
          RePrint(StrTransId);
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
  RefreshCombo;
  RefreshGrid;
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
    StrQry:String;
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
    StrGridMekanik.Cells[2,IntRow]:=Mekanik.Text;
    StrGridMekanik.CellStyle[2,IntRow].HorizontalAlignment:=taLeftJustify;
  end;
  Mekanik.Text:='';
  Mekanik.Visible := False;
  Calculate4;
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

    MekanikExit(nil);
    if (StrGridMekanik.Row=StrGridMekanik.RowCount-1) AND (StrGridMekanik.RowCount<=IntMaxRow)  then begin
      StrGridMekanik.RowCount:=StrGridMekanik.RowCount+1;
      for IntCount:=0 to 4 do StrGridMekanik.Cells[IntCount,StrGridMekanik.RowCount-1]:='';
      StrGridMekanik.CellStyle[0,StrGridMekanik.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGridMekanik.Col:=0;
    StrGridMekanik.Row:=StrGridMekanik.Row+1;
    StrGridMekanik.Col:=1;

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

end.
