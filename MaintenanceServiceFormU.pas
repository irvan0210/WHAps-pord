unit MaintenanceServiceFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppStrtch, ppMemo, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, ppDB, ppDBBDE;

type
  TMaintenanceServiceForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    GroupNo: TGroupBox;
    NoSB: TEdit;
    Label3: TLabel;
    LabelKeluhan: TLabel;
    Tanggal: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    MaintenanceJobGrid: TStringGrid;
    KeluhanGridSebelum: TStringGrid;
    Panel1: TPanel;
    NoPolisi: TEdit;
    Label7: TLabel;
    KMOdo: TEdit;
    Label5: TLabel;
    GroupRight: TGroupBox;
    ImageRight: TImage;
    GroupLeft: TGroupBox;
    ImageLeft: TImage;
    NoBody: TEdit;
    PanelArmada: TPanel;
    CariArmada: TSpeedButton;
    GroupFront: TGroupBox;
    ImageFront: TImage;
    GroupBack: TGroupBox;
    ImageBack: TImage;
    GroupBox2: TGroupBox;
    GroupInput: TPanel;
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
    ppLabel28: TppLabel;
    ppShape5: TppShape;
    ppTanbggalMulai: TppLabel;
    ppTanggalSelesai: TppLabel;
    Label1: TLabel;
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
    Label6: TLabel;
    Label9: TLabel;
    MaintenanceJob: TComboBox;
    StartDate: TDateTimePicker;
    Label10: TLabel;
    Hours: TEdit;
    FinishDate: TDateTimePicker;
    Label2: TLabel;
    PanelMaintenanceType: TPanel;
    MaintenanceType: TComboBox;
    Tambah: TBitBtn;
    Label4: TLabel;
    PredictOdo: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MaintenanceJobGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TambahDetailClick(Sender: TObject);
    procedure SimpanDetailClick(Sender: TObject);
    procedure CariArmadaClick(Sender: TObject);
    procedure RequestKeyPress(Sender: TObject; var Key: Char);
    procedure StartDateKeyPress(Sender: TObject; var Key: Char);
    procedure FinishDateKeyPress(Sender: TObject; var Key: Char);
    procedure TambahClick(Sender: TObject);
    procedure MaintenanceJobKeyPress(Sender: TObject; var Key: Char);
    procedure MaintenanceJobExit(Sender: TObject);
    procedure MaintenanceJobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StartDateChange(Sender: TObject);
    procedure MaintenanceTypeChange(Sender: TObject);
    procedure PredictOdoKeyPress(Sender: TObject; var Key: Char);
    procedure HoursKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    MaintenanceGroupArr,MaintenanceJobArr:Array of TArrString7;
    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    IntRow,CompId,MaxComponent,IntDays,IntHours:Integer;
    FormRequest,ServiceRequestId,VehicleId:String;
    Initiation,IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshMaintenanceJob;
    procedure LoadData;
    procedure LoadGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure CheckGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);overload;
    procedure RePrint(No_SB:String);
    procedure SetVehicleId(Vehicle_Id:String);
  end;

var
  MaintenanceServiceForm: TMaintenanceServiceForm;

implementation

uses MainU, RePrintFormU, WorkOrderReprintU, AuthorizedFormU, DateUtils,
  VehicleListU, DB, ServiceRequestListU;

{$R *.dfm}

constructor TMaintenanceServiceForm.Create(AOwner:TComponent;ServiceRequest_Id:String='';Form_Request:String='';Is_Input:Boolean=True);
begin
  ServiceRequestId:=ServiceRequest_Id;
  FormRequest:=Form_Request;
  Initiation:=True;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: ServiceRequestForm='+ServiceRequest_Id+','+Form_Request+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TMaintenanceServiceForm.Init;
var IntCount:Integer;
begin
  IntDays:=0;
  IntHours:=0;
  NoSB.Text:='';
  Tanggal.Text:='';
  NoBody.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  KMOdo.Text:='';
  StartDate.Date:=Today;
  FinishDate.Date:=Today;
  MaintenanceJob.Text:='';
  MaintenanceJob.ItemIndex:=-1;
  MaintenanceJob.Items.Clear;
  MaintenanceJob.Visible:=False;
  Simpan.Enabled:=True;
  KeluhanGridSebelum.Visible:=False;
  DisableInput;
  SetLength(GridRArr,0);
  SetLength(GridLArr,0);
  SetLength(GridFArr,0);
  SetLength(GridBArr,0);
  ImageRight.Picture.Assign(nil);
end;

procedure TMaintenanceServiceForm.InitGrid;
var IntCount,IntCount2:Integer;
begin
  MaintenanceJobGrid.ColWidths[1]:=0;
  for IntCount:=0 to MaintenanceJobGrid.RowCount-1 do
    for IntCount2:=0 to MaintenanceJobGrid.ColCount-1 do
      MaintenanceJobGrid.Cells[IntCount2,IntCount]:='';
  MaintenanceJobGrid.RowCount:=1;
  KeluhanGridSebelum.RowCount:=1;
end;

procedure TMaintenanceServiceForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  MaintenanceType.ItemIndex:=-1;
  MaintenanceType.Text:='';
  MaintenanceType.Items.Clear;
  SetLength(MaintenanceGroupArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupList '+CompanyId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MaintenanceGroupArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      MaintenanceGroupArr[IntCount][0]:=Qry.FieldValues['maintenance_group_id'];
      MaintenanceGroupArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['hours']<>NULL then MaintenanceGroupArr[IntCount][2]:=Qry.FieldValues['hours'] else MaintenanceGroupArr[IntCount][2]:='0';
      if Qry.FieldValues['days']<>NULL then MaintenanceGroupArr[IntCount][3]:=Qry.FieldValues['days'] else MaintenanceGroupArr[IntCount][3]:='0';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
    MaintenanceType.Items.Add(MaintenanceGroupArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TMaintenanceServiceForm.RefreshMaintenanceJob;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  MaintenanceJob.ItemIndex:=-1;
  MaintenanceJob.Text:='';
  MaintenanceJob.Items.Clear;
  SetLength(MaintenanceJobArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceJobList '+CompanyId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(MaintenanceJobArr,Qry.RecordCount+1);
    MaintenanceJobArr[IntCount][0]:='';
    MaintenanceJobArr[IntCount][1]:=' ';
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      MaintenanceJobArr[IntCount][0]:=Qry.FieldValues['maintenance_job_id'];
      MaintenanceJobArr[IntCount][1]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(MaintenanceJobArr)-1 do
    MaintenanceJob.Items.Add(MaintenanceJobArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TMaintenanceServiceForm.CheckGrid;
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

procedure TMaintenanceServiceForm.SetVehicleId(Vehicle_Id:String);
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


procedure TMaintenanceServiceForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceServiceDetail '+QuotedStr(ServiceRequestId)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      Tanggal.Text:=Qry.FieldValues['submit_date'];
      NoSB.Text:=Qry.FieldValues['maintenance_service_id'];
      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Qry.FieldValues['license_plate'];
      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
      if Qry.FieldValues['odo_predict']<>NULL then PredictOdo.Text:=IToCurr(Qry.FieldValues['odo_predict']);
      if Qry.FieldValues['from_date']<>NULL then StartDate.Date:=StrToDate(Qry.FieldValues['from_date']);
      if Qry.FieldValues['to_date']<>NULL then FinishDate.Date:=StrToDate(Qry.FieldValues['to_date']);
      if Qry.FieldValues['hour']<>NULL then Hours.Text:=Qry.FieldValues['hour'];
      for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
        if MaintenanceGroupArr[IntCount][0]=Qry.FieldValues['maintenance_group_id'] then MaintenanceType.ItemIndex:=MaintenanceType.Items.IndexOf(MaintenanceGroupArr[IntCount][1]);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceServiceForm.LoadGrid;
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntLastRow:Integer;
    IsLastRow:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    IntCount:=0;
    repeat
      if MaintenanceJobGrid.Cells[0,IntCount]='' then begin
        IntLastRow:=IntCount;
        IsLastRow:=True;
      end;
      Inc(IntCount);
    until (IntCount>MaintenanceJobGrid.RowCount-1) or (IsLastRow);
    StrQry:='EXEC GetMaintenanceServiceDetailList '+QuotedStr(ServiceRequestId)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=IntLastRow;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      if IntCount>MaintenanceJobGrid.RowCount-1 then MaintenanceJobGrid.RowCount:=MaintenanceJobGrid.RowCount+1;
      if Qry.FieldValues['maintenance_job_id']<>'' then begin
        MaintenanceJobGrid.Cells[0,IntCount]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['name'];
        MaintenanceJobGrid.Cells[1,IntCount]:=Qry.FieldValues['maintenance_job_id'];
      end;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceServiceForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceServiceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceServiceForm.FormShow(Sender: TObject);
begin
  Init;
  MaxComponent:=Self.ComponentCount;
  RefreshCombo;
  RefreshMaintenanceJob;
  if ServiceRequestId<>'' then begin
    LoadData;
    LoadGrid;
  end;
  if IsInput then begin
    PanelArmada.Enabled:=True;
  end;
  Initiation:=False;
end;

procedure TMaintenanceServiceForm.MaintenanceJobGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) and (IsInput) and (Trim(NoBody.Text)<>'') then begin
    R := MaintenanceJobGrid.CellRect(ACol, ARow);
    R.Left := R.Left + MaintenanceJobGrid.Left;
    R.Right := R.Right + MaintenanceJobGrid.Left;
    R.Top := R.Top + MaintenanceJobGrid.Top;
    R.Bottom := R.Bottom + MaintenanceJobGrid.Top;
    with MaintenanceJob do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(MaintenanceJobGrid.Cells[ACol,ARow])<>'' then MaintenanceJob.ItemIndex:=MaintenanceJob.Items.IndexOf(MaintenanceJobGrid.Cells[ACol,ARow]);
    end;
  end;

end;

procedure TMaintenanceServiceForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrKMOdo,StrMsg,StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrHour,StrMaintenanceType,StrPredictOdo:String;
    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
begin
  IsCetak:=False;
  Main.M_Busy;
  if (NoBody.Text<>'') AND
      (Trim(MaintenanceJobGrid.Cells[0,0])<>'') or (Trim(MaintenanceJobGrid.Cells[0,1])<>'') then begin
      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:MaintenanceService',1);
      if Main.OpenDb then begin
        StrVhcId:=QuotedStr(VehicleId);
        StrKMOdo:=ToString(KMOdo.Text);
        StrStartDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StartDate.Date));
        if (FinishDate.Date>=StartDate.Date) then StrFinishDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date))
        else StrFinishDate:='NULL';
        if (Trim(Hours.Text)<>'') then StrHour:=QuotedStr(Trim(Hours.Text)) else StrHour:='NULL';
        if (Trim(PredictOdo.Text)<>'') then StrPredictOdo:=QuotedStr(ToString(PredictOdo.Text)) else StrPredictOdo:='NULL'; 
        if Trim(MaintenanceType.Text)<>'' then StrMaintenanceType:=QuotedStr(MaintenanceGroupArr[MaintenanceType.ItemIndex][0]) else StrMaintenanceType:='NULL';
        Main.TransStart;
        StrMsg:='';
        StrQry:='SELECT RIGHT(MAX(maintenance_service_id),4) AS max_id FROM wh_maintenance_service WHERE maintenance_service_id '+
                'LIKE '+QuotedStr('MSR'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____')+';';
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
        end else
          StrTransId:='0001';
        StrTransId:='MSR'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_maintenance_service (maintenance_service_id,company_id,location_id,vehicle_id'+
                ',odo_in,odo_predict,hour,from_date,to_date,maintenance_group_id,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+CompanyId+','+LocationId+','+StrVhcId+','+StrKMOdo+','+StrPredictOdo+
                ','+StrHour+','+StrStartDate+','+StrFinishDate+','+StrMaintenanceType+','+QuotedStr(User)+');';
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
        for IntCount:=0 to MaintenanceJobGrid.RowCount-1 do begin
          if Trim(MaintenanceJobGrid.Cells[0,IntCount])<>'' then
            StrQry:=StrQry+' INSERT INTO wh_maintenance_service_detail (maintenance_service_id,maintenance_job_id,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(MaintenanceJobGrid.Cells[1,IntCount])+','+QuotedStr(User)+'); ';
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
          NoSB.Text:=StrTransId;
          //if
          MessageBox(0,'Berhasil menyimpan Servis Berkala, Mau Dicetak ?','Servis Berkala',MB_OK or MB_ICONINFORMATION)
          { = 1 then begin
            IsCetak:=True;
          end;}
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Tidak dapat menyimpan Servis Berkala'+Chr(13)+Chr(13)+StrMsg),'Servis Berkala',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Servis Berkala',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
  if IsCetak=True then RePrint(StrTransId);
end;

procedure TMaintenanceServiceForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupRight.Enabled:=False;
  GroupLeft.Enabled:=False;
  GroupFront.Enabled:=False;
  GroupBack.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelMaintenanceType.Enabled:=False;
end;

procedure TMaintenanceServiceForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupRight.Enabled:=True;
  GroupLeft.Enabled:=True;
  GroupFront.Enabled:=True;
  GroupBack.Enabled:=True;
  GroupInput.Enabled:=True;
  PanelMaintenanceType.Enabled:=True;
end;

procedure TMaintenanceServiceForm.BersihkanClick(Sender: TObject);
begin
  if KeluhanGridSebelum.Visible then begin
    MaintenanceJobGrid.Height:=MaintenanceJobGrid.Height+KeluhanGridSebelum.Height;
    MaintenanceJobGrid.Top:=MaintenanceJobGrid.Top-KeluhanGridSebelum.Height;
  end;
  DisableInput;
  Init;
  InitGrid;
  CheckGrid;
  RefreshCombo;
  RefreshMaintenanceJob;
end;

procedure TMaintenanceServiceForm.PreparePrint;
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

procedure TMaintenanceServiceForm.CetakUlangClick(Sender: TObject);
begin
  if Trim(NoSB.Text)<>'' then RePrint(Trim(NoSB.Text))
  else ServiceRequestList:=TServiceRequestList.Create(Self,'ServiceRequest','Reprint');
end;

procedure TMaintenanceServiceForm.RePrint(No_SB:String);
var Qry:TADOQuery;
    StrQry:String;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  if No_SB<>'' then begin
    PreparePrint;
    RePrintForm.ReportName:='SB';
    RePrintForm.ReportId:=No_SB;
    if (RePrintForm.ShowModal=1) then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='EXEC GetServiceRequestDetail'+QuotedStr(No_SB)+';';
        StrQry:='EXEC GetMaintenanceServiceDetail '+QuotedStr(No_SB)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if RePrintForm.Copy>0 then ppReprinted.Caption:='Copy ke-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='';
          ppNoSR.Caption:=Qry.FieldValues['maintenance_service_id'];
//          QTanggalJamMasuk.Caption:=Qry.FieldValues['date_in']+' '+Qry.FieldValues['time_in'];
//          QNoBody.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          if Qry.FieldValues['odo_in']<>NULL then ppOdo.Caption:=Qry.FieldValues['odo_in'];
          //if Qry.FieldValues['work_order_id']<>NULL then ppOldWorkOrder.Caption:='X';
          //else if Qry.FieldValues['maintenance_service_id']<>NULL then
          ppNewMaintenaceService.Caption:='X';
          //else ppNewServiceRequest.Caption:='X';
          ppTanggal.Caption:=Qry.FieldValues['submit_date'];
          //ppName1.Caption:=Qry.FieldValues['request'];
          //ppName2.Caption:=Qry.FieldValues['input_user'];
          Qry.Close;
          StrQry:='SELECT * FROM wh_service_request_detail WHERE (service_request_id='+QuotedStr(No_SB)+') AND (service_description_id=1) AND (status=1);';
          StrQry:='select A.*,B.name from wh_maintenance_service_detail A inner join wh_maintenance_job B on A.maintenance_job_id=B.maintenance_job_id '+
                  'where A.maintenance_service_id='+QuotedStr(No_SB)+' and A.maintenance_job_id<>'+QuotedStr('')+' AND (A.status=1); ';
          //SELECT * FROM wh_maintenance_service_detail WHERE (maintenance_service_id='+QuotedStr(No_SB)+') AND (status=1);';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          ppDetail.Lines.Clear;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppDetail.Lines.Add('- '+Qry.FieldValues['name']);
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

procedure TMaintenanceServiceForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TMaintenanceServiceForm.TambahDetailClick(Sender: TObject);
var IntCount,IntAddRow:Integer;
    Qry:TADOQuery;
    StrQry:String;
begin
end;

procedure TMaintenanceServiceForm.SimpanDetailClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if MaintenanceJob.Focused=True then MaintenanceJob.OnExit(nil);
  MaintenanceJob.Visible:=True;
  if (NoBody.Text='') AND (MaintenanceJobGrid.Cells[0,0]='') then
  begin
    MessageBox(0,'Silahkan isi keluhan','Buka PKB',MB_OK or MB_ICONERROR);
    Exit;
  end;
  IsOk:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    StrTransId:=NoSB.Text;
    StrQry:='';
    for IntCount:=0 to MaintenanceJobGrid.RowCount-1 do begin
      if Trim(MaintenanceJobGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                ',description,update_time,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                ','+Chr(39)+MaintenanceJobGrid.Cells[0,IntCount]+Chr(39)+
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
  MaintenanceJob.Visible:=True;
  MaintenanceJob.Enabled:=False;
end;

procedure TMaintenanceServiceForm.CariArmadaClick(Sender: TObject);
begin
  VehicleList:=TVehicleList.Create(nil,'','MaintenanceService-Create')
end;

procedure TMaintenanceServiceForm.RequestKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then MaintenanceJobGrid.SetFocus;
end;

procedure TMaintenanceServiceForm.StartDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then FinishDate.SetFocus;
end;

procedure TMaintenanceServiceForm.FinishDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then PredictOdo.SetFocus;
end;

procedure TMaintenanceServiceForm.TambahClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaintenanceGroupId:String;
    IntCount,IntLastRow:Integer;
    IsLastRow:Boolean;
begin
  InitGrid;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
    if MaintenanceGroupArr[IntCount][1]=MaintenanceType.Text then StrMaintenanceGroupId:=MaintenanceGroupArr[IntCount][0];
  IsLastRow:=False;
  IntCount:=0;
  repeat
    if MaintenanceJobGrid.Cells[0,IntCount]='' then begin
      IntLastRow:=IntCount;
      IsLastRow:=True;
    end;
    Inc(IntCount);
  until (IntCount>MaintenanceJobGrid.RowCount-1) or (IsLastRow);
  if Not(IsLastRow) then begin
    MaintenanceJobGrid.RowCount:=MaintenanceJobGrid.RowCount+1;
    IntLastRow:=MaintenanceJobGrid.RowCount-1;
  end;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupDetailList '+QuotedStr(StrMaintenanceGroupId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=IntLastRow;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MaintenanceJobGrid.Cells[1,IntCount]:=Qry.FieldValues['maintenance_job_id'];
      MaintenanceJobGrid.Cells[0,IntCount]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['job_name'];
      Inc(IntCount);
      Qry.Next;
      MaintenanceJobGrid.RowCount:=MaintenanceJobGrid.RowCount+1;
    end;
  end;
  Qry.Close;
end;

procedure TMaintenanceServiceForm.MaintenanceJobKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    MaintenanceJobExit(nil);
    if MaintenanceJobGrid.Row=MaintenanceJobGrid.RowCount-1 then MaintenanceJobGrid.RowCount:=MaintenanceJobGrid.RowCount+1;
    MaintenanceJobGrid.Row:=MaintenanceJobGrid.Row+1;
  end;
  if (Key=#27) then begin
    MaintenanceJobExit(nil);
  end;
end;

procedure TMaintenanceServiceForm.MaintenanceJobExit(Sender: TObject);
begin
  MaintenanceJobGrid.Cells[0,MaintenanceJobGrid.Row]:=MaintenanceJob.Text;
  if MaintenanceJob.Text='' then MaintenanceJobGrid.Cells[1,MaintenanceJobGrid.Row]:='' else
  MaintenanceJobGrid.Cells[1,MaintenanceJobGrid.Row]:=MaintenanceJobArr[MaintenanceJob.ItemIndex][0];
  MaintenanceJob.Visible := False;
  MaintenanceJob.Text:='';
  MaintenanceJob.ItemIndex:=-1;
  MaintenanceJobGrid.SetFocus;
end;

procedure TMaintenanceServiceForm.MaintenanceJobKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=38 then begin
    if MaintenanceJobGrid.Row>0 then begin
      MaintenanceJobExit(nil);
      MaintenanceJobGrid.Row:=MaintenanceJobGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  MaintenanceJobGrid.Row<MaintenanceJobGrid.RowCount-1 then begin
      MaintenanceJobExit(nil);
      MaintenanceJobGrid.Row:=MaintenanceJobGrid.Row+1;
    end;
  end
end;

procedure TMaintenanceServiceForm.StartDateChange(Sender: TObject);
var IntCount:Integer;
begin
  if MaintenanceType.Text='' then begin
    FinishDate.Date:=StartDate.Date;
  end else begin
    if IntDays>0 then FinishDate.Date:=IncDay(StartDate.Date,IntDays);
    if IntHours>0 then begin
      FinishDate.Date:=StartDate.Date;
      Hours.Text:=IntToStr(IntHours);
    end;
  end;
end;

procedure TMaintenanceServiceForm.MaintenanceTypeChange(Sender: TObject);
var IntCount:Integer;
begin
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do begin
    if MaintenanceGroupArr[IntCount][1]=MaintenanceType.Text then begin
      IntHours:=StrToInt(MaintenanceGroupArr[IntCount][2]);
      IntDays:=StrToInt(MaintenanceGroupArr[IntCount][3]);
    end;
  end;
end;

procedure TMaintenanceServiceForm.PredictOdoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then MaintenanceType.SetFocus;
end;

procedure TMaintenanceServiceForm.HoursKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then PredictOdo.SetFocus;
end;

end.
