unit ServiceRequestFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppStrtch, ppMemo, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, ppDB, ppDBBDE,
  ZColorStringGrid;

type
  TServiceRequestForm = class(TForm)
    Label14: TLabel;
    GroupRight: TGroupBox;
    ImageRight: TImage;
    Selesai: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    GroupLeft: TGroupBox;
    ImageLeft: TImage;
    GroupFront: TGroupBox;
    ImageFront: TImage;
    GroupBack: TGroupBox;
    ImageBack: TImage;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label10: TLabel;
    GroupInput: TPanel;
    Label11: TLabel;
    StartDate: TDateTimePicker;
    FinishDate: TDateTimePicker;
    FinishUnknown: TCheckBox;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    NoPolisi: TEdit;
    KMOdo: TEdit;
    NoBody: TEdit;
    NoSB: TEdit;
    NoPKB: TEdit;
    NoKeluhan: TEdit;
    MemoKhusus: TCheckBox;
    PanelArmada: TPanel;
    CariArmada: TSpeedButton;
    PanelSB: TPanel;
    CariSB: TSpeedButton;
    PanelPKB: TPanel;
    CariPKB: TSpeedButton;
    Panel3: TPanel;
    CariKeluhan: TSpeedButton;
    GroupNo: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    LabStat: TLabel;
    Status: TLabel;
    NoSR: TEdit;
    Tanggal: TEdit;
    grp2: TGroupBox;
    Label13: TLabel;
    StrGrid2: TZColorStringGrid;
    ItemDetail: TEdit;
    Detail: TEdit;
    Qty: TEdit;
    chkPermintaanBarang: TCheckBox;
    ListPart: TListBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    StrGrid: TStringGrid;
    KeluhanGridSebelum: TStringGrid;
    KeluhanDetail: TEdit;
    Request: TEdit;
    DibutuhkanBarangDate: TDateTimePicker;
    CetakFormulirBarang: TButton;
    Approve: TButton;
    Reject: TButton;
    MemNotes: TMemo;
    GroupSIM: TGroupBox;
    Foto: TImage;
    Attachment: TSpeedButton;
    GroupBox4: TGroupBox;
    StrGrid3: TZColorStringGrid;
    Analisa: TEdit;
    GroupBox5: TGroupBox;
    StrGridMekanik: TZColorStringGrid;
    Mekanik: TEdit;
    ListMekanik: TListBox;
    StatusMekanik: TComboBox;
    ppReport: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLogo: TppImage;
    ppLabel30: TppLabel;
    ppShape2: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppReprinted: TppLabel;
    ppLabel1: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDetail: TppMemo;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine39: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel11: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel12: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel18: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel21: TppLabel;
    ppLine27: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine10: TppLine;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLine32: TppLine;
    ppLine36: TppLine;
    ppLine38: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppDetail2: TppMemo;
    ppTanggal: TppLabel;
    ppOdo: TppLabel;
    ppNoPolisi: TppLabel;
    ppNoSR: TppLabel;
    ppLabel28: TppLabel;
    ppShape5: TppShape;
    ppNewServiceRequest: TppLabel;
    ppOldWorkOrder: TppLabel;
    ppNewMaintenaceService: TppLabel;
    ppName1: TppLabel;
    ppName2: TppLabel;
    ppName4: TppLabel;
    ppName3: TppLabel;
    ppName5: TppLabel;
    ppName6: TppLabel;
    ppName7: TppLabel;
    ppName8: TppLabel;
    ppName9: TppLabel;
    ppName10: TppLabel;
    ppDetail3: TppMemo;
    ppLabel29: TppLabel;
    ppBodyId: TppLabel;
    ppTglMulai: TppLabel;
    ppTglSelesai: TppLabel;
    ppDetail4: TppMemo;
    ppDetail5: TppMemo;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLine7: TppLine;
    ppName11: TppLabel;
    ppName12: TppLabel;
    ppName13: TppLabel;
    ppParameterList2: TppParameterList;
    ppReport2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape6: TppShape;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    pp2Company: TppLabel;
    ppShape7: TppShape;
    plbl11: TppLabel;
    plbl13: TppLabel;
    plbl14: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    plbl17: TppLabel;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    pp2Logo: TppImage;
    pp2DepartmentTo: TppLabel;
    pp2Tanggal: TppLabel;
    pp2Requestor: TppLabel;
    pp2DepartmentOrigin: TppLabel;
    pp2Normal: TppLabel;
    pp2Mendesak: TppLabel;
    plbl19: TppLabel;
    plbl20: TppLabel;
    plbl21: TppLabel;
    pp2PBJNo: TppLabel;
    pp2TanggalPerlu: TppLabel;
    plbl10: TppLabel;
    plbl12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppItemService: TppDBText;
    ppNo: TppDBText;
    ppQty: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    plbl22: TppLabel;
    pp2Catatan: TppMemo;
    plbl23: TppLabel;
    plbl24: TppLabel;
    plbl25: TppLabel;
    plbl26: TppLabel;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    pp2RequestorSign: TppLabel;
    pp2Superior1Sign: TppLabel;
    pp2Superior2Sign: TppLabel;
    ppParameterList1: TppParameterList;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
    procedure TambahDetailClick(Sender: TObject);
    procedure SimpanDetailClick(Sender: TObject);
    procedure FinishUnknownClick(Sender: TObject);
    procedure RequestKeyPress(Sender: TObject; var Key: Char);
    procedure FinishUnknownKeyPress(Sender: TObject; var Key: Char);
    procedure StartDateKeyPress(Sender: TObject; var Key: Char);
    procedure FinishDateKeyPress(Sender: TObject; var Key: Char);
    procedure CariSBClick(Sender: TObject);
    procedure CariArmadaClick(Sender: TObject);
    procedure CariPKBClick(Sender: TObject);
    procedure ApproveClick(Sender: TObject);
    procedure StartDateChange(Sender: TObject);
    procedure AttachmentClick(Sender: TObject);
    procedure FotoDblClick(Sender: TObject);
    procedure CetakFormulirBarangClick(Sender: TObject);
    procedure StrGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ListPartDblClick(Sender: TObject);
    procedure ItemDetailExit(Sender: TObject);
    procedure ItemDetailKeyPress(Sender: TObject; var Key: Char);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AnalisaExit(Sender: TObject);
    procedure AnalisaKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridMekanikSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StatusMekanikExit(Sender: TObject);
    procedure MekanikExit(Sender: TObject);
    procedure MekanikKeyPress(Sender: TObject; var Key: Char);
    procedure RejectClick(Sender: TObject);
    procedure CariKeluhanClick(Sender: TObject);
    procedure chkPermintaanBarangClick(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString7;
    PartArr:Array of TArrString5;
    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    IntRow,CompId,MaxComponent,IntCol,MinRow2:Integer;
    FormRequest,ServiceRequestId,StrItemReqID:String;
    Initiation,IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure InitGrid2;
    procedure InitGrid3;
    procedure InitGrid4;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure CheckGrid;
    procedure Calculate;
    procedure Calculate2;
    procedure Calculate4;
    procedure Otorisasi;
    procedure CekOtorisasi;
    procedure RefreshMekanik;

    procedure PreparePrint2;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);overload;
    procedure RePrint(No_SR:String);
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetMaintenanceServiceId(MaintenanceService_Id:String);
    procedure SetWorkOrderId(WorkOrder_Id:String);
    procedure SetDriverComplainId(DriverComplainId:String);
    procedure Reprint2(ItemServiceRequest_Id:String);
  end;

var
  ServiceRequestForm: TServiceRequestForm;
  VehicleId : string;
  MinRowGrid,IntMaxRow,IntOtorisasi : Integer ;

implementation

uses MainU, RePrintFormU, WorkOrderReprintU, AuthorizedFormU, DateUtils,
  VehicleListU, DB, ServiceRequestListU, MaintenanceServiceFormU,
  MaintenanceServiceListU, WorkOrderListU, DriverComplainList, Math, 
  ItemServiceRequestU, NotRejectU, ImageViewerU;

{$R *.dfm}

constructor TServiceRequestForm.Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);
begin
  ServiceRequestId:=ServiceRequest_Id;
  FormRequest:=Form_Request;
  Initiation:=True;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: ServiceRequestForm='+ServiceRequest_Id+','+Form_Request+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TServiceRequestForm.Init;
var IntCount:Integer;
begin
  NoSR.Text:='';
  Tanggal.Text:='';
  NoBody.Text:='';
  NoSB.Text:='';
  NoPKB.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  KMOdo.Text:='';
  Mekanik.Text:='';
  Request.Text:='';
  NoKeluhan.Text:='';
  KeluhanDetail.Text:='';
  MemNotes.Text:='';
  VehicleId:='';
  MemoKhusus.Checked:=False;
  LabStat.Visible:=False;
  Status.Visible:=False;
  MemNotes.Visible:=False;
  Label14.Visible:=False;
  FinishUnknown.Checked:=False;
  Simpan.Enabled:=True;
  KeluhanDetail.Visible:=False;
  KeluhanGridSebelum.Visible:=False;
  DisableInput;
  SetLength(GridRArr,0);
  SetLength(GridLArr,0);
  SetLength(GridFArr,0);
  SetLength(GridBArr,0);
  ImageRight.Picture.Assign(nil);
  ImageLeft.Picture.Assign(nil);
  ImageFront.Picture.Assign(nil);
  ImageBack.Picture.Assign(nil);
  StartDate.Date:=Now;
  FinishDate.DateTime:=Now+1;
  IntMaxRow:=10;
  IntCol:=0;
  IntRow:=0;
  MinRow2:=0;
  DibutuhkanBarangDate.Date:=StartDate.Date-1;
  StrGrid2.Enabled:=False;
  chkPermintaanBarang.Checked:=False;
  DibutuhkanBarangDate.Enabled:=False;
  Approve.Enabled:=False;
  Reject.Enabled:=False;
  CetakUlang.Enabled:=False;
  CetakFormulirBarang.Enabled:=False;
  FinishUnknown.Enabled:=True;
  Simpan.Enabled:=True;
end;


procedure TServiceRequestForm.SetDriverComplainId(DriverComplainId:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntLastRow:Integer;
    IsLastRow:Boolean;
begin
  if DriverComplainId<>'' then begin
    EnableInput;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    SetLength(GridLArr,0);
    SetLength(GridRArr,0);
    SetLength(GridFArr,0);
    SetLength(GridBArr,0);
    IntCount:=0;
    repeat
      if StrGrid.Cells[0,IntCount]='' then begin
        IntLastRow:=IntCount;
        IsLastRow:=True;
      end;
      Inc(IntCount);
    until (IntCount>StrGrid.RowCount-1) or (IsLastRow);
    if IntCount>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
    if Main.OpenDb then begin
      StrQry:='select a.*,b.license_plate,b.body_id from wh_driver_complain a left join wh_vehicle b on a.vehicle_id=b.vehicle_id where driver_complain_id='+QuotedStr(DriverComplainId)+' and status=1;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        NoKeluhan.Text:=Qry.FieldValues['driver_complain_id'];
        VehicleId:=Qry.FieldValues['vehicle_id'];
        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        if Qry.FieldValues['odo_in']<>NULL then KMOdo.Text:=Qry.FieldValues['odo_in'] else KMOdo.Text:='0';
        Request.Text:=Qry.FieldValues['request'];
      end;
      Qry.Close;
      StrQry:='SELECT description FROM wh_driver_complain_detail where driver_complain_id='+QuotedStr(DriverComplainId)+'and status=1;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntLastRow;
      if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
        if IntCount>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  CheckGrid;
end;

procedure TServiceRequestForm.Calculate;
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



procedure TServiceRequestForm.Calculate2;
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

procedure TServiceRequestForm.Calculate4;
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

procedure TServiceRequestForm.InitGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount2,IntCount]:='';
  for IntCount:=0 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do
      KeluhanGridSebelum.Cells[IntCount2,IntCount]:='';
  StrGrid.RowCount:=1;
  KeluhanGridSebelum.RowCount:=1;
  StrGrid.ColWidths[1]:=0;
end;

procedure TServiceRequestForm.RefreshMekanik;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    StrQry:='select id_part,kode_part_gp,UPPER(name) name from wh_part where name like ''%'+ItemDetail.Text+'%'' ';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(PartArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartArr[IntCount][0]:=Qry.FieldValues['id_part'];
      PartArr[IntCount][1]:=Qry.FieldValues['kode_part_gp'];
      PartArr[IntCount][2]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ListPart.Items.Clear;
  for IntCount:=0 to Length(PartArr)-1  do begin
    ListPart.Items.Add(PartArr[IntCount][2]);
  end;
  Main.M_Normal;
end;

procedure TServiceRequestForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    StrQry:='select id_part,kode_part_gp,UPPER(name) name from wh_part where name like ''%'+ItemDetail.Text+'%'' ';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(PartArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartArr[IntCount][0]:=Qry.FieldValues['id_part'];
      PartArr[IntCount][1]:=Qry.FieldValues['kode_part_gp'];
      PartArr[IntCount][2]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ListPart.Items.Clear;
  for IntCount:=0 to Length(PartArr)-1  do begin
    ListPart.Items.Add(PartArr[IntCount][2]);
  end;
  Main.M_Normal;
end;

procedure TServiceRequestForm.CheckGrid;
var IntCount,X,Y:Integer;
    Chk:TCheckBox;
begin
  Main.M_Busy;
  IntCount:=MaxComponent-1;
  repeat
    if Self.Components[IntCount] is TCheckBox then Self.Components[IntCount].Free
    else Inc(IntCount);
  until IntCount>=Self.ComponentCount;
  for IntCount:=0 to Length(GridRArr)-1 do begin
    Chk:=TCheckBox.Create(Self);
    Chk.Parent:=GroupRight;
    Chk.Caption:=GridRArr[IntCount][0]+','+GridRArr[IntCount][1];
    X:=StrToInt(GridRArr[IntCount][0]);
    Y:=StrToInt(GridRArr[IntCount][1]);
    Chk.Left:=((X*16)-16)+8;
    Chk.Top:=Y*16;
    Chk.Width:=16;
    Chk.Color:=clRed;
  end;
  for IntCount:=0 to Length(GridLArr)-1 do begin
    Chk:=TCheckBox.Create(Self);
    Chk.Parent:=GroupLeft;
    Chk.Caption:=GridLArr[IntCount][0]+','+GridLArr[IntCount][1];
    X:=StrToInt(GridLArr[IntCount][0]);
    Y:=StrToInt(GridLArr[IntCount][1]);
    Chk.Left:=((X*16)-16)+8;
    Chk.Top:=Y*16;
    Chk.Width:=16;
    Chk.Color:=clRed;
  end;
  for IntCount:=0 to Length(GridFArr)-1 do begin
    Chk:=TCheckBox.Create(Self);
    Chk.Parent:=GroupFront;
    Chk.Caption:=GridFArr[IntCount][0]+','+GridFArr[IntCount][1];
    X:=StrToInt(GridFArr[IntCount][0]);
    Y:=StrToInt(GridFArr[IntCount][1]);
    Chk.Left:=((X*16)-16)+8;
    Chk.Top:=Y*16;
    Chk.Width:=16;
    Chk.Color:=clRed;
  end;
  for IntCount:=0 to Length(GridBArr)-1 do begin
    Chk:=TCheckBox.Create(Self);
    Chk.Parent:=GroupBack;
    Chk.Caption:=GridBArr[IntCount][0]+','+GridBArr[IntCount][1];
    X:=StrToInt(GridBArr[IntCount][0]);
    Y:=StrToInt(GridBArr[IntCount][1]);
    Chk.Left:=((X*16)-16)+8;
    Chk.Top:=Y*16;
    Chk.Width:=16;
    Chk.Color:=clRed;
  end;
  Main.M_Normal;
end;

procedure TServiceRequestForm.SetVehicleId(Vehicle_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  if Vehicle_Id<>'' then begin
    EnableInput;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    SetLength(GridLArr,0);
    SetLength(GridRArr,0);
    SetLength(GridFArr,0);
    SetLength(GridBArr,0);
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        VehicleId:=Vehicle_Id;
        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        if Qry.FieldValues['in_ordo_km']<>NULL then KMOdo.Text:=Qry.FieldValues['in_ordo_km'] else KMOdo.Text:='0';
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_image_id,c.vhc_image '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_image c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(Vehicle_Id)+') AND (c.vhc_image_type_id=2) ORDER BY c.vhc_type_detail_image_id DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          ImageRight.Picture.Assign(JPG);
          ImageRight.Stretch:=True;
          ImageRight.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_grid_id,c.grid_x,c.grid_y '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_grid c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(VehicleId)+') AND (vhc_image_type_id=2);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      SetLength(GridRArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        GridRArr[IntCount][0]:=Qry.FieldValues['grid_x'];
        GridRArr[IntCount][1]:=Qry.FieldValues['grid_y'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_image_id,c.vhc_image '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_image c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(Vehicle_Id)+') AND (vhc_image_type_id=3) ORDER BY vhc_type_detail_image_id DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          ImageLeft.Picture.Assign(JPG);
          ImageLeft.Stretch:=True;
          ImageLeft.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_grid_id,c.grid_x,c.grid_y '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_grid c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(VehicleId)+') AND (vhc_image_type_id=3);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      SetLength(GridLArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        GridLArr[IntCount][0]:=Qry.FieldValues['grid_x'];
        GridLArr[IntCount][1]:=Qry.FieldValues['grid_y'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_image_id,c.vhc_image '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_image c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(Vehicle_Id)+') AND (vhc_image_type_id=4) ORDER BY vhc_type_detail_image_id DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          ImageFront.Picture.Assign(JPG);
          ImageFront.Stretch:=True;
          ImageFront.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_grid_id,c.grid_x,c.grid_y '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_grid c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(VehicleId)+') AND (vhc_image_type_id=4);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      SetLength(GridFArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        GridFArr[IntCount][0]:=Qry.FieldValues['grid_x'];
        GridFArr[IntCount][1]:=Qry.FieldValues['grid_y'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_image_id,c.vhc_image '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_image c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(Vehicle_Id)+') AND (vhc_image_type_id=5) ORDER BY vhc_type_detail_image_id DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          ImageBack.Picture.Assign(JPG);
          ImageBack.Stretch:=True;
          ImageBack.Center:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
      Qry.Close;
      StrQry:='SELECT c.vhc_type_detail_grid_id,c.grid_x,c.grid_y '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_type_detail b ON b.vhc_type_detail_id=a.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_type_detail_grid c ON c.vhc_type_detail_image_type_id=b.vhc_type_detail_image_type_id '+
              'WHERE (a.vehicle_id='+QuotedStr(VehicleId)+') AND (vhc_image_type_id=5);';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      SetLength(GridBArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        GridBArr[IntCount][0]:=Qry.FieldValues['grid_x'];
        GridBArr[IntCount][1]:=Qry.FieldValues['grid_y'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  CheckGrid;
end;

procedure TServiceRequestForm.SetMaintenanceServiceId(MaintenanceService_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntLastRow:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
    IsLastRow:Boolean;
begin
  if MaintenanceService_Id<>'' then begin
    EnableInput;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    SetLength(GridLArr,0);
    SetLength(GridRArr,0);
    SetLength(GridFArr,0);
    SetLength(GridBArr,0);
    IntCount:=0;
    repeat
      if StrGrid.Cells[0,IntCount]='' then begin
        IntLastRow:=IntCount;
        IsLastRow:=True;
      end;
      Inc(IntCount);
    until (IntCount>StrGrid.RowCount-1) or (IsLastRow);
    if IntCount>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
    if Main.OpenDb then begin
      StrQry:='EXEC GetMaintenanceServiceDetail '+QuotedStr(MaintenanceService_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        VehicleId:=Qry.FieldValues['vehicle_id'];
        NoSB.Text:=Qry.FieldValues['maintenance_service_id'];
        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
        if  NoPolisi.Text='' then
        begin
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        end;
        if Qry.FieldValues['odo_in']<>NULL then KMOdo.Text:=Qry.FieldValues['odo_in'] else KMOdo.Text:='0';
        if Qry.FieldValues['from_date']<>NULL then StartDate.Date:=StrToDate(Qry.FieldValues['from_date']);
        if Qry.FieldValues['to_date']<>NULL then FinishDate.Date:=StrToDate(Qry.FieldValues['to_date'])
        else FinishUnknown.Checked:=True;
        if Request.Text='' then
        begin
           Request.Text:=Qry.FieldValues['request_name'];
        end;
        //KeluhanDetail.Text:=  Qry.FieldValues['group_name'];
        if (StrGrid.Cells[0,0]<>'') and (StrGrid.Cells[0,1]='') then
        begin
          StrGrid.Cells[0,1]:=Qry.FieldValues['group_name'];
        end else if (StrGrid.Cells[0,1]<>'') and (StrGrid.Cells[0,2]='') then
        begin
          StrGrid.Cells[0,2]:=Qry.FieldValues['group_name'];
        end else if (StrGrid.Cells[0,2]<>'') and (StrGrid.Cells[0,3]='') then
        begin
          StrGrid.Cells[0,3]:=Qry.FieldValues['group_name'];
        end else if (StrGrid.Cells[0,3]<>'') and (StrGrid.Cells[0,4]='') then
        begin
          StrGrid.Cells[0,4]:=Qry.FieldValues['group_name'];
        end else if (StrGrid.Cells[0,4]<>'') and (StrGrid.Cells[0,5]='') then
        begin
          StrGrid.Cells[0,5]:=Qry.FieldValues['group_name'];
        end else if (StrGrid.Cells[0,5]<>'') and (StrGrid.Cells[0,6]='') then
        begin
          StrGrid.Cells[0,6]:=Qry.FieldValues['group_name'];
        end else
        begin
          StrGrid.Cells[0,IntLastRow]:=Qry.FieldValues['group_name'];
        end;

       // StrGrid.Cells[0,1]:=Qry.FieldValues['group_name'];

       // StrGrid.Cells[0,1]:=Qry.FieldValues['group_name'];
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  CheckGrid;
end;

procedure TServiceRequestForm.SetWorkOrderId(WorkOrder_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntLastRow:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
    IsLastRow:Boolean;
begin
  if WorkOrder_Id<>'' then begin
    EnableInput;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    SetLength(GridLArr,0);
    SetLength(GridRArr,0);
    SetLength(GridFArr,0);
    SetLength(GridBArr,0);
    IntCount:=0;
    repeat
      if StrGrid.Cells[0,IntCount]='' then begin
        IntLastRow:=IntCount;
        IsLastRow:=True;
      end;
      Inc(IntCount);
    until (IntCount>StrGrid.RowCount-1) or (IsLastRow);
    if IntCount>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
    if Main.OpenDb then begin
      StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(WorkOrder_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        NoPKB.Text:=Qry.FieldValues['work_order_id'];
        VehicleId:=Qry.FieldValues['vehicle_id'];
        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        if Qry.FieldValues['odo_in']<>NULL then KMOdo.Text:=Qry.FieldValues['odo_in'] else KMOdo.Text:='0';
        Request.Text:=Qry.FieldValues['request_name'];
      end;
      Qry.Close;
      StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrder_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntLastRow;
      if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
        if IntCount>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  CheckGrid;
end;

procedure TServiceRequestForm.LoadData;
var StrQry:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetServiceRequestDetail '+QuotedStr(ServiceRequestId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then begin
      
      if (Qry.FieldValues['approve']=2) then
      begin
        LabStat.Visible:=True;
        Status.Visible:=True;
        MemNotes.Visible:=True;
        Label14.Visible:=True;
        Status.Caption:='DITOLAK';
        Status.Font.Color:=clRed;
        MemNotes.Text:=Qry.FieldValues['notes'];
        CetakUlang.Enabled:=False;
        CetakFormulirBarang.Enabled:=False;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        Simpan.Enabled:=False;
        Attachment.Enabled:=False;
        grp2.Enabled:=False;
        GroupBox2.Enabled:=False;
        GroupBox3.Enabled:=False;
        GroupBox4.Enabled:=False;
        Panel1.Enabled:=False;
      end else if (Qry.FieldValues['approve']=1) then
      begin
        LabStat.Visible:=True;
        Status.Visible:=True;
        MemNotes.Visible:=False;
        Label14.Visible:=False;
        Status.Caption:='DISETUJUI';
        Status.Font.Color:=clGreen;
        CetakUlang.Enabled:=True;
        CetakFormulirBarang.Enabled:=True;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        Simpan.Enabled:=False;
        Attachment.Enabled:=False;
        grp2.Enabled:=False;
        GroupBox2.Enabled:=False;
        GroupBox3.Enabled:=False;
        GroupBox4.Enabled:=False;
        Panel1.Enabled:=False;
      end else if (IntOtorisasi=1) then
      begin
        LabStat.Visible:=True;
        Status.Visible:=True;
        Status.Caption:='DIAJUKAN';
        Status.Font.Color:=clBlack;
        Simpan.Enabled:=True;
        Attachment.Enabled:=True;
        Reject.Enabled:=True;
        Approve.Enabled:=True;
        CetakUlang.Enabled:=False;
        CetakFormulirBarang.Enabled:=False;
        grp2.Enabled:=True;
        GroupBox2.Enabled:=True;
        GroupBox3.Enabled:=True;
        GroupBox4.Enabled:=True;
        Panel1.Enabled:=True;
      end else begin
        LabStat.Visible:=True;
        Status.Visible:=True;
        Status.Caption:='DIAJUKAN';
        Status.Font.Color:=clBlack;
        Simpan.Enabled:=True;
        Attachment.Enabled:=True;
        Reject.Enabled:=False;
        Approve.Enabled:=False;
        CetakUlang.Enabled:=False;
        CetakFormulirBarang.Enabled:=False;
        grp2.Enabled:=True;
        GroupBox2.Enabled:=True;
        GroupBox3.Enabled:=True;
        GroupBox4.Enabled:=True;
        Panel1.Enabled:=True;
      end;

      if Qry.FieldValues['ismemo_khusus']=1 then MemoKhusus.Checked:=True else MemoKhusus.Checked:=False;

      if (Qry.FieldValues['tanda_terima_id']=NULL) AND (IntOtorisasi=1) AND (Qry.FieldValues['approve']<>2) then  Reject.Enabled:=True;

      if Qry.FieldValues['item_request_id']<>null then begin
        StrItemReqID:= Qry.FieldValues['item_request_id'];
        StrQry:='select * from wh_service_request_part where '+
        'service_request_id= '+QuotedStr(ServiceRequestId)+' and status=1 ;';
        Qry2.SQL.Clear;
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        IntCount:=1;
        if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

          if StrGrid2.RowCount<IntCount+1 then StrGrid2.RowCount:=StrGrid2.RowCount+1;
          StrGrid2.Cells[0,IntCount]:= IntToStr(IntCount);
          StrGrid2.Cells[1,IntCount]:=Qry2.FieldValues['part_name'];
          StrGrid2.Cells[2,IntCount]:=Qry2.FieldValues['qty'];
          StrGrid2.Cells[3,IntCount]:=Qry2.FieldValues['kode_part_gp'];
          StrGrid2.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
          StrGrid2.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
          Qry2.Next;
          Inc(IntCount);

        end;
        Qry2.Close;
        chkPermintaanBarang.Checked:=True;
      end else begin
        StrItemReqID:='';
        chkPermintaanBarang.Checked:=False;
      end;

      //ANALISA
      StrQry:='';
      StrQry:='select description from wh_service_request_detail where service_request_id='+QuotedStr(ServiceRequestId)+' AND '+
      'service_description_id=3 and status=1 ;';
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

      //Mekanik
      StrQry:='';
      StrQry:='select * from wh_service_request_mekanik where service_request_id='+QuotedStr(ServiceRequestId)+' AND '+
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

      PanelArmada.Enabled:=False;
      PanelPKB.Enabled:=False;
      PanelSB.Enabled:=True;
      NoSR.Text:=Qry.FieldValues['service_request_id'];
      if Qry.FieldValues['requested_date']<>NULL then DibutuhkanBarangDate.DateTime:=StrToDate(Qry.FieldValues['requested_date']);
      if Qry.FieldValues['maintenance_service_id']<>NULL then NoSB.Text:=Qry.FieldValues['maintenance_service_id'];
      if Qry.FieldValues['work_order_id']<>NULL then NoPKB.Text:=Qry.FieldValues['work_order_id'];
      if Qry.FieldValues['driver_complain_id']<>NULL then NoKeluhan.Text:=Qry.FieldValues['driver_complain_id'];
      Tanggal.Text:=Qry.FieldValues['submit_date'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      NoBody.Text:=Qry.FieldValues['body_id'];
      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
//      if Qry.FieldValues['mekanik']<>NULL then Mekanik.Text:=Qry.FieldValues['mekanik'];
      if (Qry.FieldValues['from_date']<>NULL) and (Qry.FieldValues['from_date']<>'') then begin
        StartDate.DateTime:=StrToDate(Qry.FieldValues['from_date']);
        if Qry.FieldValues['to_date']<> NULL then FinishDate.DateTime:=StrToDate(Qry.FieldValues['to_date']);
      end else begin
        FinishUnknown.Checked:=True;
        StartDate.Enabled:=False;
        FinishDate.Enabled:=False;
      end;
      Request.Text:=Qry.FieldValues['request'];
    end;
    Qry.Close;
    StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequestId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGrid.RowCount<IntCount+2 then StrGrid.RowCount:=StrGrid.RowCount+1;
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;

    StrQry:='SELECT * FROM wh_service_request_image WHERE service_request_image_id='+
          '(SELECT MAX(service_request_image_id) FROM wh_service_request_image '+
          ' WHERE service_request_id='+QuotedStr(ServiceRequestId)+');';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      try
        StmImage:=TMemoryStream.Create;
        TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
        if StmImage.Size > 0 then begin
          JPG:=TJPEGImage.Create;
          StmImage.Position := 0;
          JPG.LoadFromStream(StmImage);
          Foto.Picture.Assign(JPG);
          Foto.Stretch:=True;
        end;
      except
        on E: EInvalidGraphic do begin
          ShowMessage('Image file is corrupted.')
        end;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TServiceRequestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TServiceRequestForm.CekOtorisasi;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select * from wh_user_auth_form '+
            'where form_id= ''150902'' and user_id='+QuotedStr(User)+' and active=1';
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

procedure TServiceRequestForm.Otorisasi;
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

procedure TServiceRequestForm.InitGrid3;
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

procedure TServiceRequestForm.InitGrid4;
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

procedure TServiceRequestForm.InitGrid2;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid2.Cells[IntCount2,IntCount]:='';

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



  for IntCount:=0 to 2 do begin
    StrGrid2.Cells[IntCount,1]:='';
    StrGrid2.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid2.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGrid2.CellStyle[2,1].HorizontalAlignment:=taCenter;
end;

procedure TServiceRequestForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGrid2;
  InitGrid3;
  InitGrid4;
  StrGrid2.Enabled:=False;
  DibutuhkanBarangDate.Enabled:=False;
  MaxComponent:=Self.ComponentCount;
//  RefreshCombo;
  Bersihkan.Visible:=True;
  CekOtorisasi;
  if IsInput then begin
    EnableInput;
  end;
  if ServiceRequestId<>'' then
  begin
    Bersihkan.Visible:=False;
    Otorisasi;
    LoadData;
  end;
  Initiation:=False;
end;

procedure TServiceRequestForm.KeluhanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) then begin
    R := StrGrid.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid.Left;
    R.Right := R.Right + StrGrid.Left;
    R.Top := R.Top + StrGrid.Top;
    R.Bottom := R.Bottom + StrGrid.Top;
    with KeluhanDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(StrGrid.Cells[ACol,ARow])<>'' then KeluhanDetail.Text:=StrGrid.Cells[ACol,ARow];
    end;
  end;

end;

procedure TServiceRequestForm.KeluhanDetailExit(Sender: TObject);
begin
  if Trim(KeluhanDetail.Text)<>StrGrid.Cells[StrGrid.Col,StrGrid.Row] then StrGrid.Cells[StrGrid.Col,StrGrid.Row]:=KeluhanDetail.Text;
  KeluhanDetail.Visible := False;
  KeluhanDetail.Text:='';
  StrGrid.SetFocus;
end;

procedure TServiceRequestForm.KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    KeluhanDetailExit(nil);
    if StrGrid.Row=StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1; 
    StrGrid.Row:=StrGrid.Row+1;
  end;
  if (Key=#27) then begin
    KeluhanDetailExit(nil);
  end;
end;

procedure TServiceRequestForm.SimpanClick(Sender: TObject);
var Qry,Qry2:TADOQuery;
    StrQry,StrQryDet,StrMaxId,StrKMOdo,StrMsg,StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrRequest,StrTglDibutuhkanBarang,StrItem,StrQty,StrKodePartGP:String;
    StrMaintenanceService,StrWorkOrder,StrKeluhan,StrAnalisa,StrMekanik,StrStatusMekanik,StrItemRequestID:String;
    IntCount,IntJobInEx,IntMemoKhusus:Integer;
    IsOk,IsCetak:Boolean;
begin
  IsCetak:=False;
  Main.M_Busy;
  if (NoPolisi.Text<>'') AND
      (Trim(StrGrid.Cells[0,0])<>'') then begin
      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry2:=TADOQuery.Create(Self);
      Qry2.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:ServiceRequestForm',1);
      if Main.OpenDb then begin
        StrMsg:='';
        StrQry:='SELECT RIGHT(MAX(service_request_id),4) AS max_id FROM wh_service_request WHERE service_request_id '+
                'LIKE '+Chr(39)+'SRQ'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrMaxId:=Qry.FieldValues['max_id'];
          StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
        end else
          StrMaxId:='0001';
        StrVhcId:=QuotedStr(VehicleId);
        StrKMOdo:=ToString(KMOdo.Text);
        if Trim(NoSB.Text)<>'' then StrMaintenanceService:=QuotedStr(Trim(NoSB.Text)) else StrMaintenanceService:='NULL';
        if Trim(NoPKB.Text)<>'' then StrWorkOrder:=QuotedStr(Trim(NoPKB.Text)) else StrWorkOrder:='NULL';
        if Trim(Request.Text)<>'' then StrRequest:=QuotedStr(Request.Text) else StrRequest:='NULL';
        if FinishUnknown.Checked=False then begin
          StrStartDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StartDate.Date));
          StrFinishDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date));
        end else begin
          StrStartDate:='NULL';
          StrFinishDate:='NULL';
        end;

        if chkPermintaanBarang.Checked=True then
        begin
           StrTglDibutuhkanBarang:= QuotedStr(FormatDateTime('yyyy/mm/dd',DibutuhkanBarangDate.Date));
        end else
        begin
           StrTglDibutuhkanBarang:='NULL';
        end;

        if MemoKhusus.Checked=True then IntMemoKhusus:=1 else IntMemoKhusus:=0;

        Main.TransStart;
        if NoSR.Text<>'' then begin
          StrTransId:=ServiceRequestId;
          StrQry:='UPDATE wh_service_request SET maintenance_service_id='+StrMaintenanceService+', from_date='+StrStartDate+',to_date='+StrFinishDate+
                  ',request='+StrRequest+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ',ismemo_khusus='+QuotedStr(IntToStr(IntMemoKhusus))+' WHERE service_request_id='+QuotedStr(StrTransId)+';';
          StrQryDet:=StrQry+'UPDATE wh_service_request_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE (service_request_id='+QuotedStr(StrTransId)+') AND (status=1);';
        end else begin
          StrTransId:='SRQ'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
          StrQry:='INSERT INTO wh_service_request (service_request_id,maintenance_service_id,work_order_id,company_id,location_id,vehicle_id,odo_in'+
                  ',from_date,to_date,request,input_user,update_user,driver_complain_id,approve,ismemo_khusus)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+StrMaintenanceService+','+StrWorkOrder+','+CompanyId+
                  ','+LocationId+','+StrVhcId+','+StrKMOdo+
                  ','+StrStartDate+','+StrFinishDate+','+StrRequest+','+QuotedStr(User)+','+QuotedStr(User)+
                  ','+QuotedStr(NoKeluhan.Text)+',0,'+QuotedStr(IntToStr(IntMemoKhusus))+');';
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


        for IntCount:=0 to StrGrid.RowCount-1 do begin
          StrKeluhan:= StrGrid.Cells[0,IntCount];
          if Trim(StrGrid.Cells[0,IntCount])<>'' then
            StrQryDet:=StrQryDet+' INSERT INTO wh_service_request_detail (service_request_id,service_description_id,description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1,'+QuotedStr(StrKeluhan)+
                    ','+QuotedStr(User)+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQryDet,4);
        Qry.SQL.Add(StrQryDet);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;
        StrQry:='';

        //Analisa
        StrQryDet:='';
        StrAnalisa:='';
        for IntCount:=1 to StrGrid3.RowCount-1 do begin
          StrAnalisa:= StrGrid3.Cells[1,IntCount];
          if Trim(StrGrid3.Cells[1,IntCount])<>'' then
            StrQryDet:=StrQryDet+' INSERT INTO wh_service_request_detail (service_request_id,service_description_id,description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',3,'+QuotedStr(StrAnalisa)+
                    ','+QuotedStr(User)+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQryDet,4);
        Qry.SQL.Add(StrQryDet);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;
        StrQryDet:='';

        //Mekanik
        StrQryDet:='';
        StrMekanik:='';
        StrStatusMekanik:='';
        if NoSR.Text<>'' then begin
        StrQryDet:='UPDATE wh_service_request_mekanik SET status=0 '+
                ' WHERE service_request_id='+QuotedStr(StrTransId)+';';
        end;
        for IntCount:=1 to StrGridMekanik.RowCount-1 do begin
          StrStatusMekanik := StrGridMekanik.Cells[1,IntCount];
          StrMekanik:= StrGridMekanik.Cells[2,IntCount];
          if Trim(StrGridMekanik.Cells[2,IntCount])<>'' then
            StrQryDet:=StrQryDet+' INSERT INTO wh_service_request_mekanik (service_request_id,name,status_mekanik,status)'+
                    ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrMekanik)+','+QuotedStr(StrStatusMekanik)+
                    ',1); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQryDet,4);
        Qry.SQL.Add(StrQryDet);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;
        StrQryDet:='';


        //PART
        if chkPermintaanBarang.Checked=True then
        begin
          StrQryDet:='SELECT * from wh_item_request where no_request='+QuotedStr(StrTransId)+' and cancel is NULL';
          Qry2.SQL.Add(StrQryDet);
          Qry2.Open;
          StrItemRequestID:='';
        if Qry2.RecordCount>0 then begin
          StrItemRequestID:= Qry2.FieldValues['item_request_id'];
        end;
        if Qry2.RecordCount=0 then begin
          StrQryDet:='SELECT RIGHT(MAX(item_request_id),4) AS item_request_id FROM wh_item_request '+
                  'WHERE item_request_id  LIKE '+Chr(39)+'R'+CompanyCode+LocationCode+DepartmentCode+
                  FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                  '____'+Chr(39)+';';
          Qry2.Close;
          Qry2.SQL.Clear;
          Qry2.SQL.Add(StrQryDet);
          Qry2.Open;
          if Qry2.FieldValues['item_request_id']<>NULL then begin
            StrItemReqID:=Qry2.FieldValues['item_request_id'];
            StrItemReqID:=Format('%.*d',[4,StrToInt(StrItemReqID)+1]);
            Qry2.Close;
            Qry2.SQL.Clear;
          end else
//            StrMaxId:='0001';
//
//          StrItemReqID:='IRWH'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
//                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
            StrItemReqID:='0001';
          StrItemReqID:='R'+CompanyCode+LocationCode+DepartmentCode+
                      FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrItemReqID;

          StrQry:='INSERT INTO wh_item_request (item_request_id,company_id,location_id,origin_department_id'+
                ',to_department_id,request_date,requester_id,requested_date,importance,update_user,no_request) VALUES '+
                '('+QuotedStr(StrItemReqID)+','+CompanyId+','+LocationId+',12'+
                ',24,GETDATE(),'+QuotedStr(User)+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DibutuhkanBarangDate.Date))+',0'+
                ','+QuotedStr(User)+','+QuotedStr(StrTransId)+');';
        end else begin
          StrQry:='UPDATE wh_item_request SET requested_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',DibutuhkanBarangDate.Date))+
                  ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE no_request='+QuotedStr(StrTransId)+';';
        end;
//          StrQry:='INSERT INTO wh_warehouse_item_request (warehouse_item_request_id,request_id,company_id,location_id,'+
//                      'service_request_id,status,update_user,request_date,tgl_dibutuhkan)'+
//                      ' VALUES ('+QuotedStr(StrItemReqID)+','+QuotedStr(User)+','+CompanyId+
//                      ','+LocationId+','+QuotedStr(StrTransId)+',1,'+QuotedStr(User)+',GETDATE(),'+StrTglDibutuhkanBarang+' );';
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
          //          if (NoSR.Text<>'') then
          StrQry:='';
          StrQry:='UPDATE wh_item_request_detail SET cancel=1 WHERE item_request_id='+QuotedStr(StrItemRequestID)+';';

          for IntCount:=1 to StrGrid2.RowCount-1 do begin
            StrItem:= StrGrid2.Cells[1,IntCount];
            StrQty:=StrGrid2.Cells[2,IntCount];
            StrKodePartGP:=StrGrid2.Cells[3,IntCount];
            if Trim(StrGrid2.Cells[2,IntCount])<>'' then
//            if Trim(StrGrid2.Cells[2,IntCount])<>'' then
//              StrQry:='INSERT INTO wh_warehouse_item_request_detail (warehouse_item_request_id,item_detail'+
//                      ',qty,status)'+
//                      ' VALUES ('+QuotedStr(StrItemReqID)+
//                      ','+QuotedStr(StrGrid2.Cells[1,IntCount])+
//                      ','+QuotedStr(StrGrid2.Cells[2,IntCount])+',1); ';

              StrQry:=StrQry+' INSERT INTO wh_item_request_detail (item_request_id'+
                      ',item_detail,quantity,kode_part_gp,update_user) '+
                      ' VALUES ('+QuotedStr(StrItemReqID)+','+QuotedStr(StrItem)+
                      ','+QuotedStr(StrQty)+','+QuotedStr(StrKodePartGP) +
                      ','+QuotedStr(User)+');';
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
          if NoSR.Text<>'' then begin
          StrQry:='UPDATE wh_service_request_part SET status=0 '+
                  ' WHERE service_request_id='+QuotedStr(StrTransId)+';';
          end;
          for IntCount:=1 to StrGrid2.RowCount-1 do begin

            if chkPermintaanBarang.Checked=TRUE then
              StrQry:=StrQry+' INSERT INTO wh_service_request_part (service_request_id,part_name'+
                      ',qty,kode_part_gp,status)'+
                      ' VALUES ('+QuotedStr(StrTransId)+
                      ','+QuotedStr(StrGrid2.Cells[1,IntCount])+
                      ','+QuotedStr(StrGrid2.Cells[2,IntCount])+','+QuotedStr(StrGrid2.Cells[3,IntCount])+',1); ';
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
        end;
//

        StrQry:='';
        if (NoPKB.Text<>'') or (NoKeluhan.Text<>'')  then begin


        end else if NoSB.Text<>'' then begin
          StrQry:=' EXEC GetMaintenanceServiceDetailList '+QuotedStr(NoSB.Text)+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=0;
          StrQry:='';
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            StrQry:=StrQry+' INSERT INTO wh_service_request_detail (service_request_id,service_description_id,description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',2,'+QuotedStr(Qry.FieldValues['type_name']+' '+Qry.FieldValues['name'])+
                    ','+QuotedStr(User)+'); ';

            Inc(IntCount);
            Qry.Next;
          end;
        end;
        if StrQry<>'' then begin
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
        end;

        if IsOk then begin
          Main.TransCommit;
          DisableInput;

          NoSR.Text:=StrTransId;
          ServiceRequestId:=StrTransId;
          Otorisasi;
          MessageBox(0,'Berhasil menyimpan Service Request','',MB_OK );
          Simpan.Enabled:=True;
//          if MessageBox(0,'Berhasil menyimpan Service Request, Mau Dicetak ?','Service Request',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then begin
//            IsCetak:=True;
//
//          end;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Tidak dapat menyimpan Service Request'+Chr(13)+Chr(13)+StrMsg),'Service Request',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Service Request',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
  if IsCetak=True then RePrint(StrTransId);
end;

procedure TServiceRequestForm.DisableInput;
begin
  StrGrid.Enabled:=False;
  Simpan.Enabled:=False;
  GroupRight.Enabled:=False;
  GroupLeft.Enabled:=False;
  GroupFront.Enabled:=False;
  GroupBack.Enabled:=False;
  GroupInput.Enabled:=False;
  Request.Enabled:=False;
  FinishUnknown.Enabled:=False;
end;

procedure TServiceRequestForm.EnableInput;
begin
  StrGrid.Enabled:=True;
  Simpan.Enabled:=True;
  GroupRight.Enabled:=True;
  GroupLeft.Enabled:=True;
  GroupFront.Enabled:=True;
  GroupBack.Enabled:=True;
  GroupInput.Enabled:=True;
  Request.Enabled:=True;
  FinishUnknown.Enabled:=True;
end;

procedure TServiceRequestForm.BersihkanClick(Sender: TObject);
begin
  if KeluhanGridSebelum.Visible then begin
    StrGrid.Height:=StrGrid.Height+KeluhanGridSebelum.Height;
    StrGrid.Top:=StrGrid.Top-KeluhanGridSebelum.Height;
  end;
  DisableInput;

  Init;
  InitGrid;
  InitGrid2;
  InitGrid3;
  InitGrid4;
  CheckGrid;
//  RefreshCombo;
  Simpan.Enabled:=True;
end;

procedure TServiceRequestForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
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
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestForm.CetakUlangClick(Sender: TObject);
begin
  if Trim(NoSR.Text)<>'' then RePrint(Trim(NoSR.Text))
  else ServiceRequestList:=TServiceRequestList.Create(Self,'ServiceRequest','Reprint');
end;

procedure TServiceRequestForm.RePrint(No_SR:String);
var Qry:TADOQuery;
    StrQry:String;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IntCount:Integer;
begin
  if No_SR<>'' then begin
    PreparePrint;
    RePrintForm.ReportName:='SR';
    RePrintForm.ReportId:=No_SR;
    if (RePrintForm.ShowModal=1) then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='EXEC GetServiceRequestDetail '+QuotedStr(No_SR)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
          ppNoSR.Caption:=Qry.FieldValues['service_request_id'];
          ppTglSelesai.Caption:=Qry.FieldValues['to_date'];
          ppTglMulai.Caption:=Qry.FieldValues['from_date'];
          ppBodyId.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          if Qry.FieldValues['odo_in']<>NULL then ppOdo.Caption:=Qry.FieldValues['odo_in'];
          if Qry.FieldValues['work_order_id']<>NULL then ppOldWorkOrder.Caption:='X'
          else if Qry.FieldValues['maintenance_service_id']<>NULL then ppNewMaintenaceService.Caption:='X'
          else ppNewServiceRequest.Caption:='X';
          ppTanggal.Caption:=Qry.FieldValues['submit_date'];
          ppName1.Caption:=Qry.FieldValues['request'];
          ppName2.Caption:=Qry.FieldValues['input_user'];
          Qry.Close;
          StrQry:='SELECT * FROM wh_service_request_detail WHERE (service_request_id='+QuotedStr(No_SR)+') AND (service_description_id=1) AND (status=1);';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          ppDetail.Lines.Clear;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppDetail.Lines.Add('- '+Qry.FieldValues['description']);
            Qry.Next;
          end;
          StrQry:='SELECT * FROM wh_service_request_detail WHERE (service_request_id='+QuotedStr(No_SR)+') AND (service_description_id=2) AND (status=1);';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          ppDetail2.Lines.Clear;
          ppDetail3.Lines.Clear;
          IntCount:=0;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            if IntCount<14 then begin
              ppDetail2.Lines.Add('- '+Qry.FieldValues['description']);
            end else begin
              ppDetail3.Lines.Add('- '+Qry.FieldValues['description']);
            end;
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
          StrQry:='SELECT * FROM wh_service_request_detail WHERE (service_request_id='+QuotedStr(No_SR)+') AND (service_description_id=3) AND (status=1);';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            if IntCount<14 then begin
              ppDetail2.Lines.Add('- '+Qry.FieldValues['description']);
            end else begin
              ppDetail3.Lines.Add('- '+Qry.FieldValues['description']);
            end;
            Inc(IntCount);
            Qry.Next;
          end;
          //PARTS
          ppDetail4.Lines.Clear;
          ppDetail5.Lines.Clear;
          Qry.Close;
        
          StrQry:='select CONCAT(part_name,'' ('',qty,'')'') description from wh_service_request_part '+
                  'where service_request_id= '+QuotedStr(No_SR)+' and status=1 ;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            if IntCount<14 then begin
              ppDetail4.Lines.Add('- '+Qry.FieldValues['description']);
            end else begin
              ppDetail5.Lines.Add('- '+Qry.FieldValues['description']);
            end;
            Inc(IntCount);
            Qry.Next;
          end;
          Main.M_Normal;
          ppReport.PreviewFormSettings.WindowState:=wsMaximized;
          ppReport.Print;
        end;
        Qry.Close;
        Main.MyConnection.Close;
      end;
    end;
  end;
end;

procedure TServiceRequestForm.KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=38 then begin
    if StrGrid.Row>0 then begin
      KeluhanDetailExit(nil);
      StrGrid.Row:=StrGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  StrGrid.Row<StrGrid.RowCount-1 then begin
      KeluhanDetailExit(nil);
      StrGrid.Row:=StrGrid.Row+1;
    end;
  end
end;

procedure TServiceRequestForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TServiceRequestForm.TambahDetailClick(Sender: TObject);
var IntCount,IntAddRow:Integer;
    Qry:TADOQuery;
    StrQry:String;
begin
end;

procedure TServiceRequestForm.SimpanDetailClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if KeluhanDetail.Focused=True then KeluhanDetail.OnExit(nil);
  KeluhanDetail.Visible:=True;
  if (NoBody.Text='') AND (StrGrid.Cells[0,0]='') then
  begin
    MessageBox(0,'Silahkan isi keluhan','Buka PKB',MB_OK or MB_ICONERROR);
    Exit;
  end;
  IsOk:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    StrTransId:=NoSR.Text;
    StrQry:='';
    for IntCount:=0 to StrGrid.RowCount-1 do begin
      if Trim(StrGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                ',description,update_time,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                ','+Chr(39)+StrGrid.Cells[0,IntCount]+Chr(39)+
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

procedure TServiceRequestForm.FinishUnknownClick(Sender: TObject);
begin
  If Not(Initiation) then
    if FinishUnknown.Checked=True then GroupInput.Enabled:=False
    else GroupInput.Enabled:=True;
end;

procedure TServiceRequestForm.RequestKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TServiceRequestForm.FinishUnknownKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then if FinishUnknown.Checked then Request.SetFocus else StartDate.SetFocus;
end;

procedure TServiceRequestForm.StartDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then FinishDate.SetFocus;
end;

procedure TServiceRequestForm.FinishDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Request.SetFocus;
end;

procedure TServiceRequestForm.CariSBClick(Sender: TObject);
begin
  if Main.IsFormOpen('MaintenanceServiceList')=False then MaintenanceServiceList:=TMaintenanceServiceList.Create(self,'ServiceRequest-Create');
end;

procedure TServiceRequestForm.CariArmadaClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus','ServiceRequest-Create');
end;

procedure TServiceRequestForm.CariPKBClick(Sender: TObject);
begin
  if Main.IsFormOpen('WorkOrderList')=False then WorkOrderList:=TWorkOrderList.Create(self,'ServiceRequest-Create','',2);
end;

procedure TServiceRequestForm.ApproveClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if MessageBox(0,'Apakah anda yakin ingin Setujui ','Service Request',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin

    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    if Main.OpenDb then begin
      Main.TransStart;

      StrQry:=' UPDATE wh_service_request SET approve=1,update_user='+QuotedStr(User)+' '+
              ' WHERE service_request_id='+QuotedStr(NoSR.Text)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Setujui Service Request!!';
          StrException:=E.Message;
        end;
      end;

      StrQry:=' UPDATE wh_item_request SET approve1=1,approve1_user='+QuotedStr(User)+' '+
              ' WHERE item_request_id='+QuotedStr(StrItemReqID)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Setujui Service Request!!';
          StrException:=E.Message;
        end;
      end;

      if IsOk then begin
        Main.TransCommit;
        LabStat.Visible:=True;
        Status.Visible:=True;
        Status.Caption:='DISETUJUI' ;
        Status.Font.Color:=clGreen;
        CetakUlang.Enabled:=True;
        CetakFormulirBarang.Enabled:=True;
        Approve.Enabled:=False;
        Reject.Enabled:=False;
        Simpan.Enabled:=False;
        MessageBox(0,'Berhasil Setujui Service Request','',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Checklist Integrate',MB_OK or MB_ICONERROR);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TServiceRequestForm.StartDateChange(Sender: TObject);
begin
  DibutuhkanBarangDate.Date:=StartDate.Date-1;
  if StartDate.Date>FinishDate.Date then  FinishDate.Date:=StartDate.Date;
end;

procedure TServiceRequestForm.AttachmentClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if (NoSR.Text<>'') then begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      Foto.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);
      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          Foto.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        Foto.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_service_request_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('service_request_id')).Value:=ServiceRequestId;
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
  end
  else
  begin

    MessageBox(0,PChar('Silahkan buat service request terlebih dahulu!!'+Chr(13)+Chr(13)),'Update Foto',MB_OK or MB_ICONERROR);
  end;
end;

procedure TServiceRequestForm.FotoDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
  if (NoSR.Text<>'') then begin
    if Assigned(Foto.Picture.Graphic) then
    ImageViewer:=TImageViewer.Create(Self,1,NoSR.Text,2);
  end;
end;


procedure TServiceRequestForm.PreparePrint2;
var StrQry:String;
    Qry:TADOQuery;
begin
  pp2Logo.Picture:=Main.LogoWHDC.Picture;
end;

procedure TServiceRequestForm.Reprint2(ItemServiceRequest_Id:String);
var StrQry:String;
    Qry,Qry2:TADOQuery;
    ppDBPipe2:TppDBPipeline;
    ppDataSrc2:TDataSource;
begin
  RePrintForm.ReportName:='ItemService Request';
  RePrintForm.ReportId:=ItemServiceRequest_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint2;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='select a.item_request_id,a.importance,e.name origin_department,d.name to_department,CONVERT(VARCHAR(10),a.request_date,103) request_date,CONVERT(VARCHAR(10),a.requested_date,103) requested_date,'+
              'a.description,b.name,c.name diketahui from wh_item_request a '+
              'left join wh_user b on a.requester_id=b.username '+
              'left join wh_user c on a.approve1_user=c.username '+
              'left join wh_department d on a.to_department_id=d.department_id '+
              'left join wh_department e on a.origin_department_id=e.department_id '+
              'where a.no_request= '+QuotedStr(NoSR.Text)+' and cancel is NULL';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        pp2PBJNo.Caption:=Qry.FieldValues['item_request_id'];
        pp2Tanggal.Caption:=Qry.FieldValues['request_date'];
        pp2TanggalPerlu.Caption:=Qry.FieldValues['requested_date'];
        pp2DepartmentTo.Caption:=Qry.FieldValues['to_department'];
        pp2Requestor.Caption:=Qry.FieldValues['name'];
        if Qry.FieldValues['diketahui']<>NULL then
        begin
          pp2Superior1Sign.Caption:=Qry.FieldValues['diketahui'];
          pp2Superior2Sign.Caption:='Romy Firmangustri';
        end;
        pp2RequestorSign.Caption:=Qry.FieldValues['name'];
        if Qry.FieldValues['importance']=1 then begin
          pp2Normal.Font.Style:=[fsStrikeOut];
          pp2Mendesak.Font.Style:=[];
        end else begin
          pp2Normal.Font.Style:=[];
          pp2Mendesak.Font.Style:=[fsStrikeOut];
        end;
//        if (Qry.FieldValues['user_superior2']<>NULL) and (Qry.FieldValues['user_superior2']<>'') then begin
//          ppSuperior1Sign.Caption:=Qry.FieldValues['user_superior1'];
//          ppSuperior2Sign.Caption:=Qry.FieldValues['user_superior2'];
//        end else begin
//          ppSuperior2Sign.Caption:=Qry.FieldValues['user_superior1'];
//        end;
        if Qry.FieldValues['description']<>NULL then pp2Catatan.Caption:=Qry.FieldValues['description']
        else pp2Catatan.Caption:='';
        pp2DepartmentOrigin.Caption:=Qry.FieldValues['origin_department'];
//        pp2DepartmentOrigin.Caption:='Warehouse';
      end;
      Qry2.Close;
      StrQry:='EXEC GetItemRequestDetailPrint  '+QuotedStr(Qry.FieldValues['item_request_id']);
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      ppDataSrc2:=TDataSource.Create(Self);
      ppDataSrc2.DataSet:=Qry2;
      ppDBPipe2:=TppDBPipeline.Create(Self);
      ppDBPipe2.DataSource:=ppDataSrc2;
      ppReport2.DataPipeline:=ppDBPipe2;
      Qry2.Open;
      Main.M_Normal;
      ppReport2.Print;
      Qry.Close;
      Qry2.Close;
    end;
    Qry.Destroy;
    Qry2.Destroy;
    Main.CloseDb;
  end;
end;


procedure TServiceRequestForm.CetakFormulirBarangClick(Sender: TObject);
begin
  Reprint2(NoSR.Text);
end;

procedure TServiceRequestForm.StrGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid2.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid2.Left;
      R.Right := R.Right + StrGrid2.Left;
      R.Top := R.Top + StrGrid2.Top;
      R.Bottom := R.Bottom + StrGrid2.Top;
      with ItemDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid2.Cells[ACol,ARow])<>'' then Text:=StrGrid2.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 2) and (ARow > MinRowGrid) then begin
      R := StrGrid2.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid2.Left;
      R.Right := R.Right + StrGrid2.Left;
      R.Top := R.Top + StrGrid2.Top;
      R.Bottom := R.Bottom + StrGrid2.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid2.Cells[ACol,ARow])<>'' then Text:=StrGrid2.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
end;

procedure TServiceRequestForm.ListPartDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    StrQry:='select kode_part_gp from wh_part where name ='+QuotedStr(ListPart.Items.Strings[ListPart.ItemIndex]);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
  end;

  StrGrid2.Cells[3,IntRow]:= Qry.FieldValues['kode_part_gp'];
  StrGrid2.Cells[IntCol,IntRow]:= ListPart.Items.Strings[ListPart.ItemIndex];
  ListPart.Visible:=False;
  Qry.Close;
end;

procedure TServiceRequestForm.ItemDetailExit(Sender: TObject);
begin
  if Trim(ItemDetail.Text)<>'' then begin
    StrGrid2.Cells[IntCol,IntRow]:=ItemDetail.Text;
  end;
  ItemDetail.Text:='';
  ItemDetail.Visible := False;
  StrGrid2.SetFocus;
end;

procedure TServiceRequestForm.ItemDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    if ItemDetail.Text<>'' then begin
      with ListPart do begin
        Left:=ItemDetail.Left;
        Top := ItemDetail.Top+25;
        Visible:= True;
        BringToFront;
      end;
      RefreshCombo;
    end else begin
      ListPart.Visible:=False;
    end;
    ItemDetailExit(nil);
    Calculate;
  end;
end;

procedure TServiceRequestForm.QtyExit(Sender: TObject);
var cel2 : string;
begin
  cel2:=StrGrid2.Cells[1,IntRow];
  if Trim(Qty.Text)<>'' then begin
    if StrGrid2.Cells[3,IntRow]='' then begin
    MessageBox(0,PChar('Silahkan pilih produk terlebih dahulu'),'Service Request',MB_OK or MB_ICONWARNING);
    end else
    begin
      StrGrid2.Cells[IntCol,IntRow]:=Qty.Text;
      Calculate;
    end;
  end;
  Qty.Text:='';
  Qty.Visible := False;
  StrGrid2.SetFocus;
end;

procedure TServiceRequestForm.QtyKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    QtyExit(nil);

    if StrGrid2.Cells[2,IntRow]<>'' then begin
      Calculate;
      if (StrGrid2.Row=StrGrid2.RowCount-1) AND (StrGrid2.RowCount<=IntMaxRow)  then begin
        StrGrid2.RowCount:=StrGrid2.RowCount+1;
        for IntCount:=0 to 4 do StrGrid2.Cells[IntCount,StrGrid2.RowCount-1]:='';
        StrGrid2.CellStyle[0,StrGrid2.RowCount-1].HorizontalAlignment:=taCenter;
        StrGrid2.CellStyle[2,StrGrid2.RowCount-1].HorizontalAlignment:=taCenter;
      end;
      StrGrid2.Col:=0;
      StrGrid2.Row:=StrGrid2.Row+1;
      StrGrid2.Col:=1;
    end;
  end;
  if (Key=#27) then begin
    QtyExit(nil);
  end;
end;

procedure TServiceRequestForm.StrGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) then begin
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

procedure TServiceRequestForm.AnalisaExit(Sender: TObject);
begin
  if Trim(Analisa.Text)<>'' then begin
    StrGrid3.Cells[IntCol,IntRow]:=Analisa.Text;
    Calculate2;
  end;
  Analisa.Text:='';
  Analisa.Visible := False;
  StrGrid3.SetFocus;
end;

procedure TServiceRequestForm.AnalisaKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TServiceRequestForm.StrGridMekanikSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) then begin
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
  if (ACol = 2) and (ARow > MinRowGrid) then begin
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

procedure TServiceRequestForm.StatusMekanikExit(Sender: TObject);
begin
  if Trim(StatusMekanik.Text)<>'' then begin
    StrGridMekanik.Cells[IntCol,IntRow]:=StatusMekanik.Text;
  end;
  StatusMekanik.Text:='';
  StatusMekanik.Visible := False;
  StrGridMekanik.SetFocus;
end;

procedure TServiceRequestForm.MekanikExit(Sender: TObject);
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

procedure TServiceRequestForm.MekanikKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TServiceRequestForm.RejectClick(Sender: TObject);
begin
  if Main.IsFormOpen('NoteReject')=False then begin
    NoteReject:=TNoteReject.Create(Self);
    NoSRReject:=NoSR.Text;
  end;
end;

procedure TServiceRequestForm.CariKeluhanClick(Sender: TObject);
begin
//    if Main.IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus','ServiceRequest-Create');
  if Main.IsFormOpen('FDriverComplainList')=False then FDriverComplainList:=TFDriverComplainList.Create(Self,'Service Request')
end;

procedure TServiceRequestForm.chkPermintaanBarangClick(Sender: TObject);
begin
  if chkPermintaanBarang.Checked=True then
  begin
//    DibutuhkanBarangDate.Date:=Now;
    StrGrid2.Enabled:=True;
    DibutuhkanBarangDate.Enabled:=True
  end else begin
//    DibutuhkanBarangDate.Date:=NOW;
    StrGrid2.Enabled:=False;
    DibutuhkanBarangDate.Enabled:=False;
    InitGrid2;
  end;
end;

end.
