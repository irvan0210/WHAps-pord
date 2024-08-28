unit WorkOrderLiteFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppBands, ppReport, ppSubRpt,
  ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd;

type
  TWorkOrderLiteForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Label2: TLabel;
    GroupNo: TGroupBox;
    NoPKB: TEdit;
    Label3: TLabel;
    LabelKeluhan: TLabel;
    GroupExternal: TGroupBox;
    GeneralRepair: TCheckBox;
    BodyRepair: TCheckBox;
    Asuransi: TCheckBox;
    Report: TQuickRep;
    QRBand3: TQRBand;
    Label6: TLabel;
    Jam: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    KeluhanGrid: TStringGrid;
    KeluhanDetail: TEdit;
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
    GroupDetail: TGroupBox;
    StrGrid: TStringGrid;
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
    Label11: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    NoPolisi: TEdit;
    Label7: TLabel;
    KMOdo: TEdit;
    Panel2: TPanel;
    GroupInput: TPanel;
    StartDate: TDateTimePicker;
    FinishDate: TDateTimePicker;
    FinishUnknown: TCheckBox;
    PanelInOut: TPanel;
    Internal: TRadioButton;
    Eksternal: TRadioButton;
    Label5: TLabel;
    PanelCariSR: TPanel;
    CariSR: TSpeedButton;
    PanelCari: TPanel;
    TombolCari: TSpeedButton;
    ppReport: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLogo: TppImage;
    ppLabel387: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppNoBody: TppLabel;
    ppNoMesin: TppLabel;
    ppOdometer: TppLabel;
    ppTglKeluar: TppLabel;
    ppTglMasuk: TppLabel;
    ppShape2: TppShape;
    ppLabel110: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine33: TppLine;
    ppLine35: TppLine;
    ppLabel114: TppLabel;
    ppLine37: TppLine;
    ppReprinted: TppLabel;
    ppNoPKB: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppShape1: TppShape;
    ppShape6: TppShape;
    ppLabel115: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppParameterList4: TppParameterList;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppTipeKendaraan: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppJenisPekerjaan: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
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
    NoBody: TEdit;
    NoSR: TEdit;
    ppAdminBengkel: TppLabel;
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
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);overload;
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetServiceRequestId(ServiceRequest_Id:String);
  end;

var
  WorkOrderLiteForm: TWorkOrderLiteForm;

implementation

uses MainU, RePrintFormU, AuthorizedFormU, DateUtils,
  VehicleListU, ServiceRequestListU, WorkOrderListU;

{$R *.dfm}

constructor TWorkOrderLiteForm.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderLiteForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TWorkOrderLiteForm.Init;
begin
  NoPKB.Text:='';
  Jam.Text:='';
  NoBody.Text:='';
  NoSR.Text:='';
  NoPolisi.Text:='';
  KMOdo.Text:='';
  KeluhanDetail.Text:='';
  Eksternal.Checked:=True;
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
  KeluhanGridSebelum.Visible:=False;
  FinishDate.Date:=IncDay(Now,1);
  StartDate.Date:=Now();
end;

procedure TWorkOrderLiteForm.InitGrid;
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

procedure TWorkOrderLiteForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TWorkOrderLiteForm.SetVehicleId(Vehicle_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Vehicle_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
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
    end;
    FreeAndNil(Qry);
    PanelCariSR.Enabled:=False;
    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TWorkOrderLiteForm.SetServiceRequestId(ServiceRequest_Id:String);
var StrQry,Vehicle_Id:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if ServiceRequest_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
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
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                         ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                         ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        NoBody.Text:=Qry.FieldValues['body_id'];
        StartDate.DateTime:=StrToDate(Qry.FieldValues['from_date']);
        if Qry.FieldValues['to_date']<> NULL then FinishDate.DateTime:=StrToDate(Qry.FieldValues['to_date']);
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
    FreeAndNil(Qry);
    PanelCari.Enabled:=False;
    Internal.Checked:=True;
    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TWorkOrderLiteForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntAddRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
    end;
    Qry.Close;
//    KeluhanGridSebelum.Visible:=True;
//    KeluhanGrid.Height:=KeluhanGrid.Height-KeluhanGridSebelum.Height;
//    KeluhanGrid.Top:=KeluhanGridSebelum.Top+KeluhanGridSebelum.Height;
//    KeluhanGridSebelum.RowCount:=1;
    IntAddRow:=0;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
      KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
//      if KeluhanGridSebelum.RowCount<IntCount+1 then KeluhanGridSebelum.RowCount:=KeluhanGridSebelum.RowCount+1;
//      KeluhanGridSebelum.Cells[0,IntCount]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
    if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
    MinRow:=IntCount;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderLiteForm.AddDetail;
begin
    if NoPKB.Text<>'' then begin
      DisableInput;
      IsInput:=True;
      Simpan.Enabled:=True;
      KeluhanGrid.Enabled:=True;
    end;
end;

procedure TWorkOrderLiteForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderLiteForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderLiteForm.EksternalClick(Sender: TObject);
begin
  if Eksternal.Checked then begin
//    PopOut(GroupExternal.Height);
//    GroupExternal.Enabled:=True;
//    GroupExternal.Visible:=True;
  end;
end;

procedure TWorkOrderLiteForm.InternalClick(Sender: TObject);
begin
  if Internal.Checked then begin
//    GroupExternal.Enabled:=False;
//    GroupExternal.Visible:=False;
//    PopIn(GroupExternal.Height);
  end;
end;

procedure TWorkOrderLiteForm.PopOut(Height:Integer);
begin
  KeluhanGrid.Top:=KeluhanGrid.Top+Height;
  LabelKeluhan.Top:=LabelKeluhan.Top+Height;
  Simpan.Top:=Simpan.Top+Height;
  Bersihkan.Top:=Bersihkan.Top+Height;
  CetakUlang.Top:=CetakUlang.Top+Height;
  Selesai.Top:=Selesai.Top+Height; 
  Self.Height:=Self.Height+Height;
  GroupDetail.Top:=GroupDetail.Top+Height;  
end;

procedure TWorkOrderLiteForm.PopIn(Height:Integer);
begin
  KeluhanGrid.Top:=KeluhanGrid.Top-Height;
  LabelKeluhan.Top:=LabelKeluhan.Top-Height;
  Simpan.Top:=Simpan.Top-Height;
  Bersihkan.Top:=Bersihkan.Top-Height;
  CetakUlang.Top:=CetakUlang.Top-Height;
  Selesai.Top:=Selesai.Top-Height; 
  Self.Height:=Self.Height-Height;
  GroupDetail.Top:=GroupDetail.Top-Height;  
end;

procedure TWorkOrderLiteForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
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

procedure TWorkOrderLiteForm.SetMobil;
begin
  if NoBody.Text<>'' then begin
//    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
//    KMOdo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][5]);
  end;
end;

procedure TWorkOrderLiteForm.NoBodyChange(Sender: TObject);
begin
{  if Trim(NoBody.Text)<>'' then begin
    TambahDetail.Enabled:=False;
    SimpanDetail.Enabled:=False;
  end;
}
  SetMobil;
end;

procedure TWorkOrderLiteForm.KeluhanGridSelectCell(Sender: TObject; ACol,
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

procedure TWorkOrderLiteForm.KeluhanDetailExit(Sender: TObject);
begin
  if Trim(KeluhanDetail.Text)<>'' then  KeluhanGrid.Cells[KeluhanGrid.Col,KeluhanGrid.Row]:=KeluhanDetail.Text;
  KeluhanDetail.Visible := False;
  KeluhanDetail.Text:='';
  KeluhanGrid.SetFocus;
end;

procedure TWorkOrderLiteForm.KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
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

procedure TWorkOrderLiteForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrKMOdo,StrGenRep,StrBodRep,StrAnsur,StrMsg,StrEMsg,StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrFinishDates,StrDescription,StrServiceRequestId:String;
    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
    ADate,AMonth,AYear:Word;
begin
  Main.M_Busy;
  if (NoBody.Text<>'') AND ((Internal.Checked) OR (Eksternal.Checked)) AND
  (Trim(KeluhanGrid.Cells[0,0])<>'')  then begin
    IsOk:=True;
    IsCetak:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      Main.TransStart;
      Main.WriteLog('Form Save:WorkOrderLiteForm',1);
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
          StrQry:='SELECT RIGHT(MAX(work_order_id),4) AS max_id FROM wh_work_order_lite WHERE work_order_id '+
                  'LIKE '+Chr(39)+'PKBL'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrMaxId:=Qry.FieldValues['max_id'];
            StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
          end else
            StrMaxId:='0001';
          StrTransId:='PKBL'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
          StrQry:='INSERT INTO wh_work_order_lite (work_order_id,service_request_id,vehicle_id,job_inex_id,odo_in,date_in'+
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
              StrMsg:='Gagal Menyimpan PKB (Ringan)';
              StrEMsg:=E.Message;
            end;
          end;
          {
          StrQry:='INSERT INTO wh_vhc_hold (vehicle_id,form_name,form_id,reason,update_user)'+
                  ' VALUES ('+StrVhcId+','+Chr(39)+'PKBL'+Chr(39)+
                  ','+Chr(39)+StrTransId+Chr(39)+','+Chr(39)+'Armada Dalam Daftar PKBL'+Chr(39)+
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
        }
        end else begin
          StrTransId:=WorkOrderId;
        end;
        
        StrQry:='';
        for IntCount:=MinRow to KeluhanGrid.RowCount-1 do begin
          StrDescription:=QuotedStr(KeluhanGrid.Cells[0,IntCount]);
          if Trim(KeluhanGrid.Cells[0,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_work_order_lite_detail (work_order_id,description_id'+
                    ',description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrDescription+
                    ','+QuotedStr(User)+'); ';
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
            StrQry:='SELECT CONVERT(VARCHAR(5),time_in,108) AS time_in FROM wh_work_order_lite WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
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
            if MessageBox(0,'PKB (Ringan) berhasil disimpan, Mau Dicetak ?','Buka PKB (Ringan)',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then IsCetak:=True;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka PKB (Ringan)',MB_OK or MB_ICONERROR);
        end;
        if IsOk AND IsCetak then begin
          RePrint(StrTransId);
          Qry.Close;
        end;
        FreeAndNil(Qry);
      end else begin
        Main.TransRollback;
        MessageBox(0,'PKB (Ringan) tidak dapat disimpan'+Chr(13)+'Benturan dengan jadwal Pesanan,'+Chr(13)+'Silahkan Cek dengan reservasi','Buka PKB (Ringan)',MB_OK or MB_ICONWARNING);
      end;
      Main.CloseDb;
    end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Buka PKB (Ringan)',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TWorkOrderLiteForm.DisableInput;
begin
//  KeluhanGrid.Enabled:=False;
  GroupExternal.Enabled:=False;
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelCari.Enabled:=False;
  PanelCariSR.Enabled:=False;
end;

procedure TWorkOrderLiteForm.EnableInput;
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

procedure TWorkOrderLiteForm.BersihkanClick(Sender: TObject);
begin
{  if KeluhanGridSebelum.Visible then begin
    KeluhanGrid.Height:=KeluhanGrid.Height+KeluhanGridSebelum.Height;
    KeluhanGrid.Top:=KeluhanGrid.Top-KeluhanGridSebelum.Height;
  end;
}
  EnableInput;
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
end;

procedure TWorkOrderLiteForm.PreparePrintData;
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

procedure TWorkOrderLiteForm.CetakUlangClick(Sender: TObject);
begin
  if WorkOrderId<>'' then RePrint(WorkOrderId)
  else WorkOrderList:=TWorkOrderList.Create(self,'WorkOrder','RePrint');
end;

{
procedure TWorkOrderLiteForm.RePrint(No_PKB:String);
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
            ',CONVERT(VARCHAR(5),a.time_in,108) AS time_in FROM wh_work_order_lite AS a '+
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

procedure TWorkOrderLiteForm.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
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

procedure TWorkOrderLiteForm.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  if No_PKB<>'' then begin
  //  Init;
    RePrintForm.ReportName:='PKBL';
    RePrintForm.ReportId:=No_PKB;
    if RePrintForm.ShowModal=1 then begin
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
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
          if Qry.FieldValues['remark']<>NULL then ppRekomendasi.Lines.Add(Qry.FieldValues['remark']);
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=1;';
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
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=2;';
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
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=3;';
          ppParts.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
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

procedure TWorkOrderLiteForm.RefreshGrid;
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


procedure TWorkOrderLiteForm.KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
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

procedure TWorkOrderLiteForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;


procedure TWorkOrderLiteForm.SimpanDetailClick(Sender: TObject);
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
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    Main.TransStart;
    StrTransId:=NoPKB.Text;
    StrQry:='';
    for IntCount:=0 to KeluhanGrid.RowCount-1 do begin
      if Trim(KeluhanGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_lite_detail (work_order_id,description_id'+
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

procedure TWorkOrderLiteForm.FinishUnknownClick(Sender: TObject);
begin
  if FinishUnknown.Checked=True then FinishDate.Enabled:=False
  else FinishDate.Enabled:=True;
end;

procedure TWorkOrderLiteForm.TombolCariClick(Sender: TObject);
begin
  VehicleList:=TVehicleList.Create(nil,'Bus','WorkOrder-Create')
end;

procedure TWorkOrderLiteForm.CariSRClick(Sender: TObject);
begin
  ServiceRequestList:=TServiceRequestList.Create(Self,'WorkOrder-Create','',2); 
end;

procedure TWorkOrderLiteForm.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    WorkOrderId:=StrGrid.Cells[0,IntRow];
    LoadData;
    DisableInput;
    IsInput:=False;
  end;
end;

end.
