unit CheckerOutU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, WHUnit, ADODB, ZColorStringGrid, Mask,
  InvokeRegistry, Rio, SOAPHTTPClient, strUtils, Clipbrd;

type
  TCheckerOut = class(TForm)
    GroupSPJ: TGroupBox;
    Label12: TLabel;
    Panel3: TPanel;
    UnitJalan: TEdit;
    GridSPJ: TStringGrid;
    Label1: TLabel;
    Label3: TLabel;
    Cari: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    Bersihkan: TButton;
    GroupDetail: TGroupBox;
    Panel1: TPanel;
    NoPolisi: TEdit;
    Label2: TLabel;
    KMOdo: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Tanggal: TEdit;
    Label5: TLabel;
    Jam: TEdit;
    DriverDisp: TEdit;
    Label6: TLabel;
    Label13: TLabel;
    NoSJ: TComboBox;
    NoBodi: TEdit;
    Driver: TEdit;
    NoReservasi: TEdit;
    Customer: TEdit;
    Label11: TLabel;
    Label7: TLabel;
    Hari: TEdit;
    Label8: TLabel;
    OutTime: TMaskEdit;
    Label9: TLabel;
    FromDate: TEdit;
    Label22: TLabel;
    Seat: TEdit;
    ToDate: TEdit;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    Label16: TLabel;
    RemarkOut: TMemo;
    Remark: TMemo;
    PickupPoint: TMemo;
    Route: TMemo;
    Label17: TLabel;
    Label18: TLabel;
    Group: TEdit;
    Guide: TEdit;
    Label20: TLabel;
    GuideCellular: TEdit;
    Previous: TCheckBox;
    CheckList: TButton;
    WebService: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJKeyPress(Sender: TObject; var Key: Char);
    procedure GridSPJDblClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoSJChange(Sender: TObject);
    procedure KMOdoKeyPress(Sender: TObject; var Key: Char);
    procedure KMOdoEnter(Sender: TObject);
    procedure KMOdoExit(Sender: TObject);
    procedure OutTimeKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkOutKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure PreviousClick(Sender: TObject);
    procedure CheckListClick(Sender: TObject);
  private
    { Private declarations }
    SJArr:Array of TArrString30;
    IntRow,MinRowService:Integer;
    TransId,EmplId,VehicleId,StrIsOnline:String;
    IsDataFound:Boolean;
    procedure RefreshData;
    procedure RefreshGridSJ;
    procedure InitGridSJ;
    procedure Init;
    procedure InitGridService;
    procedure CheckData;
    procedure EnableInput;
    procedure DisableInput;
    procedure RefreshHeader;
    function GetOdoTransTrack(License_Plate:String):String;
  public
    { Public declarations }
  end;

var
  CheckerOut: TCheckerOut;
  StrDriverCellNo : String;

implementation

uses MainU, VehicleEquipmentCheckU

  , IntersysAPI_New
  , IdHTTP, uLkJSON
  ;


{$R *.dfm}

procedure TCheckerOut.RefreshHeader;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('PostingData_API_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then IsDataFound:=True Else IsDataFound:=False;
      //if Qry.FieldValues['value_string']=0 then IsDataFound:=False;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCheckerOut.Init;
begin
  NoSJ.Items.Clear;
  NoSJ.Text:='';
  NoSJ.ItemIndex:=-1;
  Cari.Text:='';
  NoBodi.Text:='';
  NoPolisi.Text:='';
  Driver.Text:='';
  DriverDisp.Text:='';
  Hari.Text:='';
  NoReservasi.Text:='';
  Customer.Text:='';
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  Tanggal.Text:='';
  FromDate.Text:='';
  ToDate.Text:='';
  Jam.Text:='';
  Seat.Text:='';
  Route.Text:='';
  PickupPoint.Text:='';
  Remark.Text:='';
  OutTime.Text:='';
  RemarkOut.Text:='';
  KMOdo.Text:='';
  VehicleId:='';
  InitGridSJ;
end;

procedure TCheckerOut.InitGridSJ;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='NIP';
  GridSPJ.Cells[3,0]:='Driver';
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

procedure TCheckerOut.InitGridService;
var IntCount,IntCount2:Integer;
begin
  MinRowService:=0;
  GridService.ColCount:=5;
  GridService.RowCount:=2;
  GridService.Cells[0,0]:='Jenis Layanan/Biaya';
  GridService.Cells[1,0]:='Qty';
  GridService.Cells[2,0]:='Biaya';
  GridService.CellStyle[0,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[1,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[2,0].HorizontalAlignment:=taCenter;
  GridService.CellStyle[1,1].HorizontalAlignment:=taRightJustify;
  GridService.CellStyle[2,1].HorizontalAlignment:=taRightJustify;
  GridService.ColWidths[0]:=180;
  GridService.ColWidths[1]:=40;
  GridService.ColWidths[2]:=70;
  for IntCount:=3 to GridService.ColCount-1  do
    GridService.ColWidths[IntCount]:=0;
  for IntCount:=MinRowService+1 to GridService.RowCount-1 do
    for IntCount2:=0 to GridService.ColCount-1 do
      GridService.Cells[IntCount2,IntCount]:='';
end;

procedure TCheckerOut.RefreshData;
var StrQry,StrFoward:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(SJArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if Previous.Checked then StrFoward:=',@AllFoward=-1' else StrFoward:=',@AllFoward=2';
    StrQry:='EXEC GetVhcOutList2_K '+LocationId+',1,'+CompanyId+StrFoward+',@Quick=1; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      if (Qry.FieldValues['driver_fee']<>NULL) AND (Qry.FieldValues['out_time']=NULL) then begin
        SetLength(SJArr,IntCount+1);
        SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
        SJArr[IntCount][1]:=Qry.FieldValues['body_id'];
        SJArr[IntCount][2]:=LicensePlate(Qry.FieldValues['license_plate']);
        SJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
        SJArr[IntCount][4]:=Qry.FieldValues['name'];
        SJArr[IntCount][13]:=Qry.FieldValues['from_dates'];
        SJArr[IntCount][14]:=Qry.FieldValues['from_time'];
        Inc(IntCount);
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  RefreshGridSJ;
  Main.M_Normal;
end;

procedure TCheckerOut.RefreshGridSJ;
var IntCount,IntCount2:Integer;
begin
  if Length(SJArr)>0 then begin
    UnitJalan.Text:=IntToStr(Length(SJArr));
    GridSPJ.RowCount:=2;
    IntCount2:=1;
    for IntCount:=0 to Length(SJArr)-1 do begin
//      if ((SJArr[IntCount][6])='') then begin
        GridSPJ.RowCount:=IntCount2+1;
        NoSJ.Items.Add(SJArr[IntCount][0]);
        GridSPJ.Cells[0,IntCount2]:=SJArr[IntCount][0];
        GridSPJ.Cells[1,IntCount2]:=SJArr[IntCount][1];
        GridSPJ.Cells[2,IntCount2]:=SJArr[IntCount][3];
        GridSPJ.Cells[3,IntCount2]:=SJArr[IntCount][4];
        GridSPJ.Cells[4,IntCount2]:=SJArr[IntCount][13];
        GridSPJ.Cells[5,IntCount2]:=SJArr[IntCount][14];
        Inc(IntCount2);
//      end;
    end;
  end else
    UnitJalan.Text:='0';
end;

procedure TCheckerOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCheckerOut.SelesaiClick(Sender: TObject);
begin
  CheckerOut.Close;
end;

procedure TCheckerOut.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGridService;
  RefreshHeader;
  RefreshData;
  Main.M_Normal;
end;

procedure TCheckerOut.GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCheckerOut.CheckData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  if Trim(NoSJ.Text)<>'' then begin
    TransId:=NoSJ.Text;
{    VehicleId:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][24];
    NoBodi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1];
    NoPolisi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][2];
    Driver.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3];
    DriverDisp.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4];
    Hari.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12];
    Tanggal.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][13];
    Jam.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][14];
    NoReservasi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][10];
    Customer.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][11];
    KMOdo.Text:=SToCurr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][7]);
    Seat.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][15];
    Route.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][16];
    PickupPoint.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][17];
    Remark.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][18];
    FromDate.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][13];
    ToDate.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][19];
    Group.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][21];
    Guide.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][22];
    GuideCellular.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][23];
    StrDriverCellNo:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][25];
}
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetSJDetail '+QuotedStr(TransId)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then begin
        VehicleId:=Qry.FieldValues['vehicle_id'];
        NoBodi.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
        Driver.Text:=Qry.FieldValues['employee_id'];
        DriverDisp.Text:=Qry.FieldValues['name'];
        Hari.Text:=Qry.FieldValues['day'];
        Tanggal.Text:=Qry.FieldValues['out_dates'];
        Jam.Text:=Qry.FieldValues['from_time'];
        NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
        Customer.Text:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['out_ordo_km']<>NULL then
        KMOdo.Text:=SToCurr(Qry.FieldValues['out_ordo_km'])
        else KMOdo.Text:='0';
        Seat.Text:=Qry.FieldValues['seat'];
        FromDate.Text:=Qry.FieldValues['from_dates_l'];
        ToDate.Text:=Qry.FieldValues['to_dates_l'];
        if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
        if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        StrDriverCellNo:=Qry.FieldValues['phone_no'];
        Route.Text:=Qry.FieldValues['route'];
        PickupPoint.Text:=Qry.FieldValues['pickup_point'];
        if Qry.FieldValues['remark']<>NULL then begin
          Remark.Text:=Qry.FieldValues['remark'];
        end;
      end;
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][20])+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=1;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        GridService.RowCount:=IntCount+2;
        GridService.CellStyle[1,IntCount+1].HorizontalAlignment:=taRightJustify;
        GridService.CellStyle[2,IntCount+1].HorizontalAlignment:=taRightJustify;
        if Qry.FieldValues['details']<>NULL then
          GridService.Cells[0,IntCount]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
        else GridService.Cells[0,IntCount]:=Qry.FieldValues['name'];
        if Qry.FieldValues['quantity']<>NULL then GridService.Cells[1,IntCount]:=Qry.FieldValues['quantity']
        else GridService.Cells[1,IntCount]:='';
        if Qry.FieldValues['amount']<>0 then GridService.Cells[2,IntCount]:=IToCurr(Qry.FieldValues['amount'])
        else GridService.Cells[2,IntCount]:=Qry.FieldValues['transaction_amount'];
        GridService.Cells[3,IntCount]:=Qry.FieldValues['transaction_obj_id'];
        GridService.Cells[4,IntCount]:=Qry.FieldValues['calculate_total'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    if SToInt(KMOdo.Text)>0 then begin
//      GroupDetail.Enabled:=False;
      Simpan.SetFocus;
    end else
      KMOdo.SetFocus;
  end;
  Main.M_Normal;
end;

procedure TCheckerOut.GridSPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then CheckerOut.Close;
end;

procedure TCheckerOut.GridSPJDblClick(Sender: TObject);
begin
  if (NoBodi.Text='') AND (Trim(GridSPJ.Cells[1,IntRow])<>'')  then begin
    Main.M_Busy;
    NoSJ.ItemIndex:=NoSJ.Items.IndexOf(GridSPJ.Cells[0,IntRow]);
    if NoSJ.ItemIndex<0 then begin

    end; 
    CheckData;
    Main.M_Normal;
  end;
end;

procedure TCheckerOut.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Cari.Text:='';
  Init;
  RefreshHeader;
  RefreshData;
  EnableInput;
  Cari.SetFocus;
  Main.M_Normal;
end;

procedure TCheckerOut.DisableInput;
begin
  NoSJ.Enabled:=False;
  GroupDetail.Enabled:=False;
  GroupSPJ.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TCheckerOut.EnableInput;
begin
  NoSJ.Enabled:=True;
  GroupDetail.Enabled:=True;
  GroupSPJ.Enabled:=True;
  Simpan.Enabled:=True;
end;

function TCheckerOut.GetOdoTransTrack(License_Plate:String):String;
var
  QryApi:TADOQuery;
  StrApiTransTrack,StrStatusApiTransTrack:String;
  IdHTTPHelper:TIdHTTP;
  Resp:TMemoryStream;
  MemoJSON:TStringList;
  js:TlkJSONbase;
begin
  Result:='';
  StrApiTransTrack:='';
  StrStatusApiTransTrack:='';
  QryApi:=TADOQuery.Create(Self);
  QryApi.Connection:=Main.MyConnection;
  try
    QryApi.SQL.Add('SELECT * FROM wh_api_trans_track;');
    QryApi.Open;
    if QryApi.RecordCount>0 then begin
      StrApiTransTrack:=VarToStr(QryApi.FieldValues['api_trans_track']);
      StrStatusApiTransTrack:=VarToStr(QryApi.FieldValues['status']);
    end;
    QryApi.Close;
  finally
    FreeAndNil(QryApi);
  end;

  if (StrStatusApiTransTrack<>'1') or (Trim(StrApiTransTrack)='') or (Trim(License_Plate)='') then Exit;

  try
    IdHTTPHelper:=TIdHTTP.Create(Self);
    Resp:=TMemoryStream.Create;
    try
      IdHTTPHelper.Get('http://'+StrApiTransTrack+'/api_transtrack/vehicle.php?plate='+Trim(License_Plate),Resp);
      Resp.Position:=0;
      MemoJSON:=TStringList.Create;
      try
        MemoJSON.LoadFromStream(Resp);
        js:=TlkJSON.ParseText(MemoJSON.Text);
        if Assigned(js) then Result:=VarToStr(js.Value);
      finally
        MemoJSON.Free;
      end;
    finally
      Resp.Free;
      IdHTTPHelper.Free;
    end;
  except
    on E:Exception do begin
      Main.WriteLog('GetOdoTransTrack Error: '+E.Message,2);
      Result:='';
    end;
  end;
end;


procedure TCheckerOut.SimpanClick(Sender: TObject);
var QStr,StrQry,StrEMessage,StrMsg:String;
    Qry,QryWehaOnline:TADOQuery;
    IsOk:Boolean;
    StrKMOdo,StrOutTime,StrRemark:String;
    StrTranstrackOdoOut,StrTranstrackOdo:String;
    Count:Integer;

    StrUrl,NameSpace,ParamIn: String;
    JadeAPI   : JadeServiceSoap;
    RequestAPI :VehicleInfoModel;
    ResponAPI : ServiceResponse;
    StrResOrdDetailId : String;
    CallApi:Boolean;
begin
  StrEMessage:='';
  IsOk:=True;
  if (Trim(NoSJ.Text)<>'') and ((NoReservasi.Text)<>'' ) and (Trim(OutTime.Text)<>':') then begin
    StrMsg:='Kendaraan '+NoPolisi.Text+' Keluar'+Chr(13)+Chr(13)+'    Sudah dicek ?';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 360000;
    QryWehaOnline:=TADOQuery.Create(Self);
    QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
    QryWehaOnline.CommandTimeout := 360000;
    Main.M_Busy;
    if (Main.OpenDb) AND (MessageBox(0,PChar(StrMsg),'Check-Out',MB_OKCANCEL or MB_ICONQUESTION) = 1) then begin
      DisableInput;
      Main.TransStart;

      {get url API}
     { QStr:='exec GetWebServiceURL 3';
      Qry.Close;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+QStr,2);
      Qry.SQL.Add(QStr);
      Qry.Open;
      Qry.First;
      if (Qry.RecordCount>0) then begin
          StrUrl:=Qry.FieldValues['url_webservice'];
          NameSpace:=Qry.FieldValues['name_space'];
      end;    }

      StrOutTime:=QuotedStr(OutTime.Text);
      if Trim(RemarkOut.Text)<>'' then begin
        if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text+Chr(13)+RemarkOut.Text)
        else StrRemark:=QuotedStr(RemarkOut.Text);
      end else begin
        if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text)
        else StrRemark:='NULL';
      end;

      StrRemark := stringreplace(StrRemark, '"', '*', [rfReplaceAll]);
      
      if Trim(KMOdo.Text)<>'' then StrKMOdo:=QuotedStr(Trim(ToString(KMOdo.Text)));

      StrTranstrackOdo:='NULL';
      StrTranstrackOdoOut:=GetOdoTransTrack(StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]));
      if Trim(StrTranstrackOdoOut)<>'' then StrTranstrackOdo:=QuotedStr(Trim(ToString(StrTranstrackOdoOut)));

      QStr:='UPDATE wh_vhc_trans SET out_ordo_km='+StrKMOdo+',out_time='+StrOutTime+
            ',transtrack_odo_out_km='+StrTranstrackOdo+
            ',description='+StrRemark+
            ',update_time=GETDATE(),update_user='+QuotedStr(User)+
            ',out_submit_date=GETDATE(),out_user_update='+QuotedStr(User)+
            ' WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan Armada Keluar';
          StrEMessage:=E.Message;
          IsOk:=False;
        end;
      end;
      Qry.SQL.Clear;
      QStr:=' UPDATE wh_vhc_trans SET status_sj='+QuotedStr('ONTRIP')+
            ' WHERE (vhc_trans_id='+Chr(39)+TransId+Chr(39)+') AND (COALESCE(status_sj,'+QuotedStr('')+')<>'+QuotedStr('COMPLETED')+') ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan Armada Keluar';
          StrEMessage:=E.Message;
          IsOk:=False;
        end;
      end;


      QStr:='';
      if IsOk then begin
        Qry.Close;
        QStr:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('PostingData_WehaOnline')+') AND (active=1);';
        Main.WriteLog('SQL :'+QStr,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['value_string']=1 then CallApi:=True;
          if Qry.FieldValues['value_string']=0 then CallApi:=False;
        end;
        Qry.Close;

        QStr:='select reserved_order_detail_id from wh_reserved_order_detail '+
                'where vhc_trans_id='+QuotedStr(TransId)+' AND status=1;';
        QStr:='SELECT rod.reserved_order_detail_id reserved_order_detail_id, co.online online from '+
                  'wh_reserved_order_detail rod '+
                  'left join wh_reserved_order ro on ro.reserved_order_id=rod.reserved_order_id '+
                  'left join wh_customer_order co on co.customer_order_id=ro.customer_order_id '+
                  'where rod.vhc_trans_id='+QuotedStr(TransId)+' and rod.status=1; ';

        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+QStr,2);
        Qry.SQL.Add(QStr);
        Qry.Open;
        StrResOrdDetailId := '';
        StrIsOnline:=VarToStr(Qry.FieldValues['online']);
        if StrIsOnline='0' Then CallApi:=False;

        if (StrIsOnline='1') then begin
          if (Qry.FieldValues['reserved_order_detail_id']<>NULL) then
          begin
              StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id'];

              StrQry:='SELECT * FROM OrderDetailVehicleInfos WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
              QryWehaOnline.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,2);
              QryWehaOnline.SQL.Add(StrQry);
              QryWehaOnline.Open;

              if QryWehaOnline.RecordCount>0 then begin

                //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''ONTRIP'' '+
                //        ' WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
                //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''OUT'' '+
                //        ' WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
                StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''OUT'' ,OutKM='+StrKMOdo+',TranstrackOdoOutKm='+StrTranstrackOdo+
                        ' WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
                Main.WriteLog('SQL :'+StrQry,2);
                QryWehaOnline.SQL.Clear;
                QryWehaOnline.SQL.Add(StrQry);
                try
                  QryWehaOnline.ExecSQL;
                  isOk := true ;
                except
                  on E:Exception do begin
                    StrMsg:='Tidak Dapat Menyimpan Detail SJ';
                    StrEMessage:=E.Message;
                    IsOk:=False;
                  end;
                end;
              end else begin
                StrQry:='SELECT * FROM OrderDetailVehicleInfos WHERE WorkOrderNo='+QuotedStr(NoSJ.Text);
                QryWehaOnline.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,2);
                QryWehaOnline.SQL.Add(StrQry);
                QryWehaOnline.Open;

                if QryWehaOnline.RecordCount>0 then begin

                  //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''ONTRIP'' , '+
                  //        ' WehaReservedCode='+QuotedStr(StrResOrdDetailId) +
                  //        ' WHERE WorkOrderNo='+QuotedStr(NoSJ.Text);
                  //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''OUT'' , '+
                  //        ' WehaReservedCode='+QuotedStr(StrResOrdDetailId) +
                  //        ' WHERE WorkOrderNo='+QuotedStr(NoSJ.Text);
                  StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''OUT'' , '+
                          ' WehaReservedCode='+QuotedStr(StrResOrdDetailId) +
                          ' ,OutKM='+StrKMOdo+',TranstrackOdoOutKm='+StrTranstrackOdo+
                          ' WHERE WorkOrderNo='+QuotedStr(NoSJ.Text);
                  Main.WriteLog('SQL :'+StrQry,2);
                  QryWehaOnline.SQL.Clear;
                  QryWehaOnline.SQL.Add(StrQry);
                  try
                    QryWehaOnline.ExecSQL;
                    isOk := true ;
                  except
                    on E:Exception do begin
                      StrMsg:='Tidak Dapat Menyimpan Detail SJ';
                      StrEMessage:=E.Message;
                      IsOk:=False;
                    end;
                  end;
                end
                else begin
                  isOk := False;
                  EnableInput;
                  ShowMessage('Error '+StrResOrdDetailId);
                end;
              end;
          end
          else begin
            isOk := False;
            EnableInput;
            ShowMessage('Error Reserved Order Detail ID tidak ada');
          end;
        end;

        {if CallApi then begin

          //WebService.WSDLLocation := StrUrl;
          WebService.Port := 'JadeServiceSoap';
          WebService.Service := 'JadeService';


          if Qry.FieldValues['reserved_order_detail_id']<>NULL then
              StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id']
          else begin

              QStr:='select reserved_order_detail_id from wh_reserved_order_detail_package '+
                  'where vhc_trans_id='+QuotedStr(TransId)+' and status=1;';
              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+QStr,2);
              Qry.SQL.Add(QStr);
              Qry.Open;
              StrResOrdDetailId := '';
              if Qry.FieldValues['reserved_order_detail_id']<>NULL then
                StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id']
              else
                IsOk:=False;
          end;

          RequestAPI:= VehicleInfoModel.Create;
          With RequestAPI Do Begin
              WehaReservedCode := StrResOrdDetailId;
              WorkOrderNo := NoSJ.Text;
              Status := 'ONTRIP';
              DriverName := DriverDisp.Text;
              DriverPhone:= StrDriverCellNo;
              VehiclePlateNo:=NoPolisi.Text;
          End;
          ParamIn := 'NoOrder='+NoReservasi.Text+'; WehaReservedCode='+RequestAPI.WehaReservedCode+'; WorkOrderNo='+RequestAPI.WorkOrderNo+'; Status='+RequestAPI.Status+
                       '; DriverName='+RequestAPI.DriverName+'; DriverPhone='+RequestAPI.DriverPhone+'; VehiclePlateNo='+RequestAPI.VehiclePlateNo;
          Try
              Main.WriteTableLog('Armada Keluar - ChangeVehicleInfo',ParamIn, 'Mulai');
              if LowerCase(Main.Db)='wh_prod' then
                JadeAPI := GetJadeServiceSoap(True,'',WebService, StrUrl, NameSpace)
              else
                JadeAPI := GetJadeServiceSoap(False,'',WebService, StrUrl, NameSpace);

              ResponAPI := JadeAPI.ChangeVehicleInfo(RequestAPI);
              Main.WriteTableLog('Armada Keluar - ChangeVehicleInfo',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
          Except
            On E:Exception Do begin
              Main.WriteTableLog('Armada Keluar - ChangeVehicleInfo',ParamIn, 'Message Exception : '+e.Message);
              if AnsiContainsText(e.message, 'timed out') then
                isOk := true
              else begin
                isOk := False;
                EnableInput;
                ShowMessage('Error API'+#13#10+e.Message);
              end;

            end;
          end;

          if (LowerCase(ResponAPI.Status)='error') then begin
              if IsDataFound Then Begin
                if (lowercase(Copy(ResponAPI.Message, 1, 15))<>'unable to found') then begin
                  isOk := False;
                  StrEMessage := StrEMessage + Chr(13)+'Error API(0) : '+ResponAPI.Message;
                end;
                
                isOk := False;
                StrEMessage := StrEMessage + Chr(13)+'Error API(1) : '+ResponAPI.Message;
              end else begin                                  //unable to found reserved code
                if (lowercase(Copy(ResponAPI.Message, 1, 15))<>'unable to found') then begin
                  isOk := False;
                  StrEMessage := StrEMessage + Chr(13)+'Error API(0) : '+ResponAPI.Message;
                end;
              end;
          end;
          RequestAPI.Free;

        end; }

        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Data berhasil Disimpan','Armada Keluar',MB_OK or MB_ICONINFORMATION);
          Bersihkan.SetFocus;
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Armada Keluar',MB_OK or MB_ICONWARNING);
        end;
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Armada Keluar',MB_OK or MB_ICONWARNING);
      end;
    end else begin
      IsOk:=False;
      StrMsg:='Kolom Tidak boleh Kosong';
    end;
    Qry.Close;
  end else
    MessageBox(0,'Silahkan Isi semua kolom','Armada Keluar',MB_OK or MB_ICONWARNING);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCheckerOut.NoSJChange(Sender: TObject);
begin
  Main.M_Busy;
  CheckData;
  Main.M_Normal;
end;

procedure TCheckerOut.KMOdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;

  if Key=#13 then OutTime.SetFocus;
end;

procedure TCheckerOut.KMOdoEnter(Sender: TObject);
begin
  KMOdo.Text:=ToString(KMOdo.Text);
end;

procedure TCheckerOut.KMOdoExit(Sender: TObject);
begin
  if ToString(KMOdo.Text)='' then KMOdo.Text:='0';
  KMOdo.Text:=SToCurr(KMOdo.Text);
end;

procedure TCheckerOut.OutTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then RemarkOut.SetFocus;
end;

procedure TCheckerOut.RemarkOutKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TCheckerOut.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGridSJ;
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(SJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if (IsTrue) {and ((SJArr[Count][6])='')} then begin
          GridSPJ.RowCount:=Count2+1;
          GridSPJ.Cells[0,Count2]:=SJArr[Count][0];
          GridSPJ.Cells[1,Count2]:=SJArr[Count][1];
          GridSPJ.Cells[2,Count2]:=SJArr[Count][3];
          GridSPJ.Cells[3,Count2]:=SJArr[Count][4];
          GridSPJ.Cells[4,Count2]:=SJArr[Count][13];
          GridSPJ.Cells[5,Count2]:=SJArr[Count][14];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGridSJ;
  end;
end;

procedure TCheckerOut.PreviousClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TCheckerOut.CheckListClick(Sender: TObject);
begin
  if VehicleId<>'' then if Main.IsFormOpen('VehicleEquipmentCheck')=False then VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'Checker-Out',VehicleId,True);
end;

end.
