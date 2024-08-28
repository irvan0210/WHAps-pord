unit ServiceRequestAnalizeFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppStrtch, ppMemo, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, ppDB, ppDBBDE;

type
  TServiceRequestAnalizeForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    GroupNo: TGroupBox;
    NoSR: TEdit;
    Label3: TLabel;
    Tanggal: TEdit;
    Label5: TLabel;
    GroupRight: TGroupBox;
    ImageRight: TImage;
    GroupLeft: TGroupBox;
    ImageLeft: TImage;
    GroupFront: TGroupBox;
    ImageFront: TImage;
    GroupBack: TGroupBox;
    ImageBack: TImage;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Group1: TPanel;
    StartDate: TDateTimePicker;
    FinishDate: TDateTimePicker;
    Label11: TLabel;
    ppReport: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLogo: TppImage;
    ppLabel91: TppLabel;
    ppShape2: TppShape;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppReprinted: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppShape1: TppShape;
    ppLine39: TppLine;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppDetail: TppMemo;
    ppLine3: TppLine;
    ppParameterList4: TppParameterList;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLine7: TppLine;
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
    FinishUnknown: TCheckBox;
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
    ppName11: TppLabel;
    ppName12: TppLabel;
    ppName13: TppLabel;
    Label10: TLabel;
    ppDetail3: TppMemo;
    ppLabel29: TppLabel;
    ppBodyId: TppLabel;
    Label2: TLabel;
    Request: TEdit;
    LabelKeluhan: TLabel;
    StrGrid: TStringGrid;
    StrGridAnalize: TStringGrid;
    AnalizeDetail: TEdit;
    Label12: TLabel;
    GroupInput: TGroupBox;
    Panel1: TPanel;
    Label7: TLabel;
    NoPolisi: TEdit;
    KMOdo: TEdit;
    NoBody: TEdit;
    NoSB: TEdit;
    NoPKB: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    PanelSR: TPanel;
    CariSR: TSpeedButton;
    ppTglMulai: TppLabel;
    ppTglSelesai: TppLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TambahDetailClick(Sender: TObject);
    procedure SimpanDetailClick(Sender: TObject);
    procedure FinishUnknownClick(Sender: TObject);
    procedure RequestKeyPress(Sender: TObject; var Key: Char);
    procedure FinishUnknownKeyPress(Sender: TObject; var Key: Char);
    procedure StartDateKeyPress(Sender: TObject; var Key: Char);
    procedure FinishDateKeyPress(Sender: TObject; var Key: Char);
    procedure CariSRClick(Sender: TObject);
    procedure StrGridAnalizeSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure AnalizeDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AnalizeDetailExit(Sender: TObject);
    procedure AnalizeDetailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    VhcArr:Array of TArrString7;
    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    IntRow,IntCol,CompId,MaxComponent:Integer;
    FormRequest,ServiceRequestId,VehicleId:String;
    Initiation,IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);overload;
    procedure RePrint(No_SR:String);
    procedure SetServiceRequestId(ServiceRequest_Id:String);
  end;

var
  ServiceRequestAnalizeForm: TServiceRequestAnalizeForm;

implementation

uses MainU, RePrintFormU, WorkOrderReprintU, AuthorizedFormU, DateUtils,
  VehicleListU, DB, ServiceRequestListU, MaintenanceServiceFormU,
  MaintenanceServiceListU, WorkOrderListU;

{$R *.dfm}

constructor TServiceRequestAnalizeForm.Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);
begin
  ServiceRequestId:=ServiceRequest_Id;
  FormRequest:=Form_Request;
  Initiation:=True;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: ServiceRequestForm='+ServiceRequest_Id+','+Form_Request+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TServiceRequestAnalizeForm.Init;
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
  Request.Text:='';
  FinishUnknown.Checked:=False;
  Simpan.Enabled:=True;
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
  AnalizeDetail.Visible:=False;
end;

procedure TServiceRequestAnalizeForm.InitGrid;
var IntCount,IntCount2:Integer;
begin
  StrGrid.ColCount:=1;
  StrGridAnalize.ColCount:=2;
  StrGrid.ColWidths[0]:=270;
  StrGridAnalize.ColWidths[0]:=270;
  StrGridAnalize.ColWidths[1]:=0;
  for IntCount:=0 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount2,IntCount]:='';
  for IntCount:=0 to StrGridAnalize.RowCount-1 do
    for IntCount2:=0 to StrGridAnalize.ColCount-1 do
      StrGridAnalize.Cells[IntCount2,IntCount]:='';
  StrGridAnalize.RowCount:=1;
end;

procedure TServiceRequestAnalizeForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Main.M_Normal;
end;

procedure TServiceRequestAnalizeForm.SetServiceRequestId(ServiceRequest_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
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
      if Qry.FieldValues['maintenance_service_id']<>NULL then NoSB.Text:=Qry.FieldValues['maintenance_service_id'];
      if Qry.FieldValues['work_order_id']<>NULL then NoPKB.Text:=Qry.FieldValues['work_order_id'];
      Tanggal.Text:=Qry.FieldValues['submit_date'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      NoBody.Text:=Qry.FieldValues['body_id'];
      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
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
    StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequest_Id)+';';
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
    StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequest_Id)+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGridAnalize.RowCount<IntCount+2 then StrGridAnalize.RowCount:=StrGridAnalize.RowCount+1;
      StrGridAnalize.Cells[0,IntCount]:=Qry.FieldValues['description'];
      StrGridAnalize.Cells[1,IntCount]:='2';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestAnalizeForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetServiceRequestDetail '+QuotedStr(ServiceRequestId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then begin
      NoSR.Text:=Qry.FieldValues['service_request_id'];
      if Qry.FieldValues['maintenance_service_id']<>NULL then NoSB.Text:=Qry.FieldValues['maintenance_service_id'];
      if Qry.FieldValues['work_order_id']<>NULL then NoPKB.Text:=Qry.FieldValues['work_order_id'];
      Tanggal.Text:=Qry.FieldValues['submit_date'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      NoBody.Text:=Qry.FieldValues['body_id'];
      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
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
    StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequestId)+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGridAnalize.RowCount<IntCount+2 then StrGridAnalize.RowCount:=StrGridAnalize.RowCount+1;
      StrGridAnalize.Cells[0,IntCount]:=Qry.FieldValues['description'];
      StrGridAnalize.Cells[1,IntCount]:='2';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(ServiceRequestId)+',3;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGridAnalize.RowCount<IntCount+2 then StrGridAnalize.RowCount:=StrGridAnalize.RowCount+1;
      StrGridAnalize.Cells[0,IntCount]:=Qry.FieldValues['description'];
      StrGridAnalize.Cells[1,IntCount]:='3';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestAnalizeForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TServiceRequestAnalizeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TServiceRequestAnalizeForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  MaxComponent:=Self.ComponentCount;
  RefreshCombo;
  if IsInput then begin
    EnableInput;
{    PanelArmada.Enabled:=True;
    PanelSB.Enabled:=True;
    PanelPKB.Enabled:=True;
    StrGrid.Enabled:=True;
}  end;
  if ServiceRequestId<>'' then LoadData;
  Initiation:=False;
end;

procedure TServiceRequestAnalizeForm.SimpanClick(Sender: TObject);
var Qry,Qry2:TADOQuery;
    StrQry,StrMsg,StrTransId,StrAnalize,StrDescriptionId:String;
    IntCount:Integer;
    IsOk,IsCetak:Boolean;
begin
  IsCetak:=False;
  Main.M_Busy;
  if (NoSR.Text<>'') AND
      (Trim(StrGridAnalize.Cells[0,0])<>'') or (Trim(StrGridAnalize.Cells[0,1])<>'') then begin
      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.WriteLog('Form Save:ServiceRequestForm',1);
      if Main.OpenDb then begin
        StrTransId:=NoSR.Text;
        StrMsg:='';
        Main.TransStart;
{        StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(StrTransId)+',2;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        StrQry:='';
        if Qry.RecordCount>0 then begin
}
        StrQry:='UPDATE wh_service_request_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(user)+
                ' WHERE service_request_id='+QuotedStr(StrTransId)+'AND(service_description_id=2)AND(status=1);';
        StrQry:=StrQry+'UPDATE wh_service_request_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(user)+
                ' WHERE service_request_id='+QuotedStr(StrTransId)+'AND(service_description_id=3)AND(status=1);';
//        end;
//        Qry.Close;
        if StrQry<>'' then begin
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
        StrQry:='';
        for IntCount:=0 to StrGridAnalize.RowCount-1 do begin
          if Trim(StrGridAnalize.Cells[0,IntCount])<>'' then begin
            StrAnalize:=QuotedStr(StrGridAnalize.Cells[0,IntCount]);
            StrDescriptionId:=StrGridAnalize.Cells[1,IntCount];
            StrQry:=StrQry+' INSERT INTO wh_service_request_detail (service_request_id,service_description_id,description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+','+StrDescriptionId+','+StrAnalize+','+QuotedStr(User)+'); ';
          end;
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
        if IsOk then begin
          Main.TransCommit;
          DisableInput;
          if MessageBox(0,'Berhasil menyimpan Analisa Service Request, Mau Dicetak ?','Analisa Service Request',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then begin
            IsCetak:=True;
          end;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Tidak dapat menyimpan Analisa Service Request'+Chr(13)+Chr(13)+StrMsg),'Analisa Service Request',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Analisa Service Request',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
  if IsCetak=True then RePrint(StrTransId);
end;

procedure TServiceRequestAnalizeForm.DisableInput;
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

procedure TServiceRequestAnalizeForm.EnableInput;
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

procedure TServiceRequestAnalizeForm.BersihkanClick(Sender: TObject);
begin
  DisableInput;
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TServiceRequestAnalizeForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TServiceRequestAnalizeForm.CetakUlangClick(Sender: TObject);
begin
  if Trim(NoSR.Text)<>'' then RePrint(Trim(NoSR.Text))
  else ServiceRequestList:=TServiceRequestList.Create(Self,'ServiceRequest','Reprint');
end;

procedure TServiceRequestAnalizeForm.RePrint(No_SR:String);
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
      Qry.CommandTimeout := 3600;
      if Main.OpenDb then begin
        StrQry:='EXEC GetServiceRequestDetail'+QuotedStr(No_SR)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
          ppNoSR.Caption:=Qry.FieldValues['service_request_id'];
          ppTglMulai.Caption:=Qry.FieldValues['from_date'];
          ppTglSelesai.Caption:=Qry.FieldValues['to_date'];
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
          StrQry:='EXEC GetServicerequestDetailList '+QuotedStr(No_SR)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          ppDetail.Lines.Clear;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppDetail.Lines.Add('- '+Qry.FieldValues['description']);
            Qry.Next;
          end;
          StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(No_SR)+',2;';
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
          StrQry:='EXEC GetServiceRequestDetailList '+QuotedStr(No_SR)+',3;';
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
          Qry.Close;
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

procedure TServiceRequestAnalizeForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TServiceRequestAnalizeForm.TambahDetailClick(Sender: TObject);
var IntCount,IntAddRow:Integer;
    Qry:TADOQuery;
    StrQry:String;
begin
end;

procedure TServiceRequestAnalizeForm.SimpanDetailClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
//  if KeluhanDetail.Focused=True then KeluhanDetail.OnExit(nil);
//  KeluhanDetail.Visible:=True;
  if (NoBody.Text='') AND (StrGrid.Cells[0,0]='') then
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
//  KeluhanDetail.Visible:=True;
//  KeluhanDetail.Enabled:=False;
end;

procedure TServiceRequestAnalizeForm.FinishUnknownClick(Sender: TObject);
begin
  If Not(Initiation) then
    if FinishUnknown.Checked=True then GroupInput.Enabled:=False
    else GroupInput.Enabled:=True;
end;

procedure TServiceRequestAnalizeForm.RequestKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TServiceRequestAnalizeForm.FinishUnknownKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then if FinishUnknown.Checked then Request.SetFocus else StartDate.SetFocus;
end;

procedure TServiceRequestAnalizeForm.StartDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then FinishDate.SetFocus;
end;

procedure TServiceRequestAnalizeForm.FinishDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Request.SetFocus;
end;

procedure TServiceRequestAnalizeForm.CariSRClick(Sender: TObject);
begin
  if Main.IsFormOpen('ServiceRequestList')=False then ServiceRequestList:=TServiceRequestList.Create(Self,'ServiceRequest-Analize','',2);
end;

procedure TServiceRequestAnalizeForm.StrGridAnalizeSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntCol:=ACol;
  IntRow:=ARow;
  if (ACol = 0) and (NoSR.Text<>'') then begin
    R := StrGridAnalize.CellRect(ACol, ARow);
    R.Left := R.Left + StrGridAnalize.Left;
    R.Right := R.Right + StrGridAnalize.Left;
    R.Top := R.Top + StrGridAnalize.Top;
    R.Bottom := R.Bottom + StrGridAnalize.Top;
    with AnalizeDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      if Trim(StrGridAnalize.Cells[IntCol,IntRow])<>'' then AnalizeDetail.Text:=StrGridAnalize.Cells[IntCol,IntRow];
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TServiceRequestAnalizeForm.AnalizeDetailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=38 then begin
    if StrGridAnalize.Row>0 then begin
      AnalizeDetailExit(nil);
      StrGrid.Row:=StrGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  StrGridAnalize.Row<StrGrid.RowCount-1 then begin
      AnalizeDetailExit(nil);
      StrGrid.Row:=StrGrid.Row+1;
    end;
  end
end;

procedure TServiceRequestAnalizeForm.AnalizeDetailExit(Sender: TObject);
begin
  if Trim(AnalizeDetail.Text)<>StrGridAnalize.Cells[0,StrGridAnalize.Row] then begin
    StrGridAnalize.Cells[0,StrGridAnalize.Row]:=AnalizeDetail.Text;
    if StrGridAnalize.Cells[1,StrGridAnalize.Row]='' then StrGridAnalize.Cells[1,StrGridAnalize.Row]:='3';
  end;
  AnalizeDetail.Visible := False;
  AnalizeDetail.Text:='';
  StrGridAnalize.SetFocus;
end;

procedure TServiceRequestAnalizeForm.AnalizeDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    AnalizeDetailExit(nil);
    if StrGridAnalize.Row=StrGridAnalize.RowCount-1 then StrGridAnalize.RowCount:=StrGridAnalize.RowCount+1;
    StrGridAnalize.Row:=StrGridAnalize.Row+1;
  end;
  if (Key=#27) then begin
    AnalizeDetailExit(nil);
  end;
end;

end.
