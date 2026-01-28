unit BlockUnitFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppBands, ppReport, ppSubRpt,
  ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd;

type
  TBlockUnitForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    GroupNo: TGroupBox;
    NoPKB: TEdit;
    Label3: TLabel;
    Report: TQuickRep;
    QRBand3: TQRBand;
    Label6: TLabel;
    Jam: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
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
    PanelCariSR: TPanel;
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
    ppAdminBengkel: TppLabel;
    Alasan: TMemo;
    Label2: TLabel;
    BlokUnit: TRadioButton;
    BlokMudik: TRadioButton;
    lbl1: TLabel;
    lbl2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    CreateUser: TEdit;
    Label10: TLabel;
    CreateDate: TEdit;
    Label12: TLabel;
    UpdateUser: TEdit;
    UpdateDate: TEdit;
    Label13: TLabel;
    BlokDaytrans: TRadioButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TombolCariClick(Sender: TObject);
    procedure CariSRClick(Sender: TObject);
    procedure StartDateChange(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString7;
    WOArr:Array of TArrString10;
    WODetArr:Array of TArrString2;
    IntRow,IntCol,CompId,MinRow:Integer;
    FormRequest,WorkOrderId,VehicleId:String;
    Initiation,IsReadOnly,IsInput:Boolean;
    procedure Init;
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
  BlockUnitForm: TBlockUnitForm;

implementation

uses MainU, RePrintFormU, AuthorizedFormU, DateUtils,
  VehicleListU, ServiceRequestListU, WorkOrderListU;

{$R *.dfm}

constructor TBlockUnitForm.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: BlockUnitFormU='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TBlockUnitForm.Init;
begin
  NoPKB.Text:='';
  Jam.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  KMOdo.Text:='';
  Alasan.Text:='';
  CreateUser.Text:='';
  CreateDate.Text:='';
  UpdateUser.Text:='';
  UpdateDate.Text:='';

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
  BlokUnit.Checked := False;
  BlokMudik.Checked := False;
end;


procedure TBlockUnitForm.SetVehicleId(Vehicle_Id:String);
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

procedure TBlockUnitForm.SetServiceRequestId(ServiceRequest_Id:String);
var StrQry,Vehicle_Id:String;
    Qry:TADOQuery;
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
        VehicleId:=Qry.FieldValues['vehicle_id'];

        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);

        NoBody.Text:=Qry.FieldValues['body_id'];
        StartDate.DateTime:=StrToDate(Qry.FieldValues['from_date']);
        if Qry.FieldValues['to_date']<> NULL then FinishDate.DateTime:=StrToDate(Qry.FieldValues['to_date']);
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

    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TBlockUnitForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntAddRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(WorkOrderId)+',@flag=1;';
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
      if (VarToStr(Qry.FieldValues['flag'])='1') then begin
        BlokUnit.Checked:=True;
        BlokMudik.Checked:=False;
        BlokDaytrans.Checked := False;
      end else if (VarToStr(Qry.FieldValues['flag'])='2') then begin
        BlokUnit.Checked:=False;
        BlokMudik.Checked:=True;
        BlokDaytrans.Checked := False;
      end else  begin
        BlokUnit.Checked:=False;
        BlokMudik.Checked:=False;
        BlokDaytrans.Checked := True;
      end;

      if Qry.FieldValues['create_name']<>null then
      begin
        CreateUser.Text:=Qry.FieldValues['create_name'];
        CreateDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['create_date_work_order']));
      end;
      if Qry.FieldValues['create_date_work_order'] <> Qry.FieldValues['update_date_work_order'] then
      begin
        UpdateUser.Text:=Qry.FieldValues['update_name'];
        UpdateDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['update_date_work_order']));
      end else begin
        UpdateUser.Text:='';
        UpdateDate.Text:='';
      end;


      KMOdo.Text:=IToCurr(Qry.FieldValues['odo_in']);
      NoPKB.Text:=Qry.FieldValues['work_order_id'];
      StartDate.Date:=StrToDate(Qry.FieldValues['date_in']);
      Jam.Text:=Qry.FieldValues['time_in'];
      if Qry.FieldValues['date_out']<>NULL then begin
        FinishDate.Date:=StrToDate(Qry.FieldValues['date_out']);
      end
    end;
    Qry.Close;
    IntAddRow:=0;
    Alasan.Text := '';
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+',@flag=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Alasan.Text:=Qry.FieldValues['description'];
      Qry.Next;
    end;
    MinRow:=IntCount;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBlockUnitForm.AddDetail;
begin
    if NoPKB.Text<>'' then begin
      DisableInput;
      IsInput:=True;
      Simpan.Enabled:=True;
    end;
end;

procedure TBlockUnitForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBlockUnitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBlockUnitForm.PopOut(Height:Integer);
begin
end;

procedure TBlockUnitForm.PopIn(Height:Integer);
begin

end;

procedure TBlockUnitForm.FormShow(Sender: TObject);
begin
  Init;
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
end;

procedure TBlockUnitForm.SetMobil;
begin
  if NoBody.Text<>'' then begin
//    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
//    KMOdo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][5]);
  end;
end;

procedure TBlockUnitForm.NoBodyChange(Sender: TObject);
begin
{  if Trim(NoBody.Text)<>'' then begin
    TambahDetail.Enabled:=False;
    SimpanDetail.Enabled:=False;
  end;
}
  SetMobil;
end;

procedure TBlockUnitForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrKMOdo,StrGenRep,StrBodRep,StrAnsur,StrMsg,StrEMsg,StrTransId,StrVhcId,StrStartDate,StrFinishDate,StrFinishDates,StrDescription,StrServiceRequestId:String;
    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
    ADate,AMonth,AYear:Word;
    StrFlag:String;
    TglMulai, TglSelesai:TDateTime;
begin
  Main.M_Busy;
  if (NoBody.Text<>'') AND (Alasan.Text<>'') AND (BlokUnit.Checked or BlokMudik.Checked or BlokDaytrans.Checked) then begin
    IsOk:=True;
    IsCetak:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    TglMulai    := StartDate.Date;
    TglSelesai  := FinishDate.Date;
    if (TglMulai > TglSelesai) then begin
        MessageBox(0,'Tolong perhatikan tanggal mulai dan tanggal selesai yang diinput!!!','Input Blok Unit',MB_OK or MB_ICONWARNING);
        exit;
    end;

    if Main.OpenDb then begin
      Main.TransStart;
      Main.WriteLog('Form Save:BlockUnitFormU',1);
      StrMsg:='';
      StrEMsg:='';

      StrVhcId:=QuotedStr(VehicleId);
      StrKMOdo:=ToString(KMOdo.Text);

      StrFinishDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date));
      StrFinishDates:=QuotedStr(FormatDateTime('yyyy/mm/dd',FinishDate.Date));

      StrStartDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StartDate.Date));
//      StrQry:='SELECT * FROM wh_reserved_order_detail WHERE (vehicle_id='+StrVhcId+') AND ('+StrStartDate+' BETWEEN from_date AND to_date) AND (status=1)';
      StrQry:='EXEC GetReservedOrderList 2,@Finish=7,@OutDate='+StrStartDate+',@ToDate='+StrFinishDates+',@VehicleId='+StrVhcId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        IsOk:=False;
      end;
      Qry.Close;
      if IsOk then begin
        if BlokUnit.Checked=True then StrFlag:='1'
        else if BlokMudik.Checked=True then StrFlag:='2'
        else StrFlag:='3';

        if WorkOrderId='' then begin

          Qry.SQL.Clear;
          StrQry:='SELECT RIGHT(MAX(work_order_id),4) AS max_id FROM wh_work_order WHERE work_order_id '+
                  'LIKE '+Chr(39)+'BLC'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+' AND (flag=1 OR flag=2 OR flag=3);';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrMaxId:=Qry.FieldValues['max_id'];
            StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
          end else
            StrMaxId:='0001';
          StrTransId:='BLC'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
          StrQry:='INSERT INTO wh_work_order (work_order_id,vehicle_id,job_inex_id,odo_in,date_in'+
                  ',time_in,date_out, flag, update_user,create_user,create_date)'+
                  ' VALUES ('+QuotedStr(StrTransId)+
                  ','+StrVhcId+','+IntToStr(IntJobInEx)+','+StrKMOdo+','+StrStartDate+',GETDATE()'+
                  ','+StrFinishDate+', '+StrFlag+', '+Chr(39)+User+Chr(39)+', '+Chr(39)+User+Chr(39)+',GETDATE());';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Block Unit';
              StrEMsg:=E.Message;
            end;
          end;
          StrQry:='INSERT INTO wh_vhc_hold (vehicle_id,form_name,form_id,reason,update_user)'+
                  ' VALUES ('+StrVhcId+','+Chr(39)+'BLC'+Chr(39)+
                  ','+Chr(39)+StrTransId+Chr(39)+','+Chr(39)+'Armada Dalam Daftar Block Unit'+Chr(39)+
                  ','+Chr(39)+User+Chr(39)+');';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Daftar Block';
              StrEMsg:=E.Message;
            end;
          end;
        end else begin
          StrTransId:=WorkOrderId;
          StrQry:='UPDATE wh_work_order SET '+
                  ' date_in='+StrStartDate+', date_out='+StrFinishDate+
                  ',flag='+StrFlag+', update_user='+QuotedStr(User)+' WHERE work_order_id='+QuotedStr(StrTransId)+'; '+
                  'UPDATE wh_work_order_detail SET Status=0 WHERE work_order_id='+QuotedStr(StrTransId)+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Update Block Unit';
              StrEMsg:=E.Message;
            end;
          end;
        end;

        StrQry:='';
        StrDescription:=QuotedStr(Alasan.Text);
        StrQry:=StrQry+' INSERT INTO wh_work_order_detail (work_order_id,description_id'+
                    ',description,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+',1'+
                    ','+StrDescription+
                    ','+QuotedStr(User)+'); ';
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
            StrQry:='SELECT CONVERT(VARCHAR(5),a.time_in,108) AS time_in,k.name create_name,l.name update_name,CONVERT(VARCHAR(10),a.create_date,103) create_date_work_order '+
                    'FROM wh_work_order a '+
                    'LEFT JOIN wh_user k on a.create_user=k.username '+
			              'LEFT JOIN wh_user l on a.update_user=l.username '+
                    'WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
            Qry.Close;
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.RecordCount>0 then begin
              NoPKB.Text:=StrTransId;
              Jam.Text:=Qry.FieldValues['time_in'];
              CreateUser.Text:=Qry.FieldValues['create_name'];
              CreateDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['create_date_work_order']));
            end;
            Qry.Close;
          end;
          if StrTransId<>'' then
            MessageBox(0,'Blok Unit berhasil disimpan','Blok Unit',MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Blok Unit',MB_OK or MB_ICONERROR);
        end;
        FreeAndNil(Qry);
      end else begin
        Main.TransRollback;
        MessageBox(0,'Blok unit tidak dapat disimpan'+Chr(13)+'Benturan dengan jadwal Pesanan,'+Chr(13)+'Silahkan Cek dengan reservasi','Buka PKB',MB_OK or MB_ICONWARNING);
      end;
      Main.CloseDb;
    end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Blok unit',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TBlockUnitForm.DisableInput;
begin
//  KeluhanGrid.Enabled:=False;

  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelCari.Enabled:=False;
  PanelCariSR.Enabled:=False;
  Alasan.Enabled:=False;
end;

procedure TBlockUnitForm.EnableInput;
begin
//  KeluhanGrid.Enabled:=True;
  Simpan.Enabled:=True;
//  TambahDetail.Enabled:=True;
//  SimpanDetail.Enabled:=True;
  GroupInput.Enabled:=True;
  PanelCari.Enabled:=True;
  PanelCariSR.Enabled:=True;
  Alasan.Enabled:=True;
end;

procedure TBlockUnitForm.BersihkanClick(Sender: TObject);
begin
  EnableInput;
  Init;
end;

procedure TBlockUnitForm.PreparePrintData;
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

procedure TBlockUnitForm.PreparePrint;
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

procedure TBlockUnitForm.RePrint(No_PKB:String);
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
        StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(No_PKB)+',@flag=1;';
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



procedure TBlockUnitForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;


procedure TBlockUnitForm.TombolCariClick(Sender: TObject);
begin
  VehicleList:=TVehicleList.Create(nil,'Bus','Block-Create')
end;

procedure TBlockUnitForm.CariSRClick(Sender: TObject);
begin
  ServiceRequestList:=TServiceRequestList.Create(Self,'Block-Create','',2);
end;

procedure TBlockUnitForm.StartDateChange(Sender: TObject);
begin
    FinishDate.Date:=IncDay(StartDate.Date,1);
end;

end.
