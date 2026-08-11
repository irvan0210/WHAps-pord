unit CheckerInU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, WHUnit, ADODB, ZColorStringGrid, Mask,
  ComCtrls, InvokeRegistry, Rio, SOAPHTTPClient,StrUtils, ppParameter,
  ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport;

type
  TCheckerIn = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    GroupSPJ: TGroupBox;
    Label12: TLabel;
    Panel3: TPanel;
    UnitJalan: TEdit;
    Cari: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    Bersihkan: TButton;
    Panel1: TPanel;
    NoPolisi: TEdit;
    DriverDisp: TEdit;
    NoBodi: TEdit;
    Driver: TEdit;
    NoReservasi: TEdit;
    Customer: TEdit;
    Hari: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Tanggal: TEdit;
    NoSJ: TComboBox;
    GroupInput: TGroupBox;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    KMOdoTotal: TEdit;
    GroupDetail: TGroupBox;
    KmOdoAkhir: TEdit;
    GroupBox1: TGroupBox;
    KMOdoAwal: TEdit;
    Label8: TLabel;
    InTime: TMaskEdit;
    RemarkOut: TMemo;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    Seat: TEdit;
    Label10: TLabel;
    FromDate: TEdit;
    ToDate: TEdit;
    Label16: TLabel;
    Label22: TLabel;
    Remark: TMemo;
    PickupPoint: TMemo;
    Route: TMemo;
    Label5: TLabel;
    Label17: TLabel;
    Group: TEdit;
    Guide: TEdit;
    GuideCellular: TEdit;
    Label20: TLabel;
    InDate: TDateTimePicker;
    Label21: TLabel;
    GroupBBMLiter: TGroupBox;
    BBMLiter: TEdit;
    GroupBBMPrice: TGroupBox;
    BBMPrice: TEdit;
    All: TCheckBox;
    CheckList: TButton;
    Label23: TLabel;
    TolParkir: TEdit;
    WebService: THTTPRIO;
    FuelConsRate: TEdit;
    GroupBox3: TGroupBox;
    BBMPriceReimburse: TEdit;
    Label24: TLabel;
    GroupBox5: TGroupBox;
    BBMLiterReimburse: TEdit;
    Label25: TLabel;
    DriverReimburse: TEdit;
    StandBy: TMaskEdit;
    Label26: TLabel;
    lbl1: TLabel;
    eOvertime: TEdit;
    ppReportReimburse: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppLabel58: TppLabel;
    ppLine4: TppLine;
    ppDetailBand2: TppDetailBand;
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
    ppFooterBand2: TppFooterBand;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    GridSPJ: TZColorStringGrid;
    btn1: TButton;
    Label18: TLabel;
    GroupBox6: TGroupBox;
    KMOdoTansTrackAwal: TEdit;
    GroupBox7: TGroupBox;
    KMOdoTansTrackTotal: TEdit;
    Label27: TLabel;
    GroupBox8: TGroupBox;
    KMOdoTansTrackAkhir: TEdit;
    LabelStatus: TLabel;
    Label29: TLabel;
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KMOdoKeyPress(Sender: TObject; var Key: Char);
    procedure NoSJChange(Sender: TObject);
    procedure KmOdoAkhirEnter(Sender: TObject);
    procedure KmOdoAkhirExit(Sender: TObject);
    procedure KmOdoAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure InTimeKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkOutKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure InDateKeyPress(Sender: TObject; var Key: Char);
    procedure BBMPriceKeyPress(Sender: TObject; var Key: Char);
    procedure BBMPriceExit(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure CheckListClick(Sender: TObject);
    procedure TolParkirEnter(Sender: TObject);
    procedure BBMPriceEnter(Sender: TObject);
    procedure BBMLiterEnter(Sender: TObject);
    procedure BBMLiterExit(Sender: TObject);
    procedure TolParkirKeyPress(Sender: TObject; var Key: Char);
    procedure TolParkirExit(Sender: TObject);
    procedure BBMLiterKeyPress(Sender: TObject; var Key: Char);
    procedure BBMPriceReimburseEnter(Sender: TObject);
    procedure BBMPriceReimburseExit(Sender: TObject);
    procedure BBMPriceReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure BBMLiterReimburseEnter(Sender: TObject);
    procedure BBMLiterReimburseExit(Sender: TObject);
    procedure BBMLiterReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure DriverReimburseExit(Sender: TObject);
    procedure DriverReimburseEnter(Sender: TObject);
    procedure DriverReimburseKeyPress(Sender: TObject; var Key: Char);
    procedure eOvertimeChange(Sender: TObject);
    procedure eOvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure eOvertimeEnter(Sender: TObject);
    procedure eOvertimeExit(Sender: TObject);
    procedure ZColorStringGrid1DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure KMOdoAwalEnter(Sender: TObject);
    procedure KMOdoAwalExit(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    SJArr:Array of TArrString30;
    IntRow,MinRowService,SolarPerLiter,BBMPerLiter,GasPerLiter:Integer;
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
    procedure RePrintReimburse(Trans_Id:String);
  end;

var
  CheckerIn: TCheckerIn;
  StrDriverCellNo : String;

implementation

uses MainU, Math, DateUtils, VehicleEquipmentCheckU
  , IntersysAPI_New
  , AuthorizedFormU, LoginU, DB
  , IdHTTP, uLkJSON;


{$R *.dfm}

procedure TCheckerIn.RefreshHeader;
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

procedure TCheckerIn.Init;
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
  Group.Text:='';
  Guide.Text:='';
  GuideCellular.Text:='';
  Customer.Text:='';
  Tanggal.Text:='';
  KmOdoAwal.Text:='';
  KmOdoAkhir.Text:='';
  KMOdoTotal.Text:='';
  KMOdoTansTrackAwal.Text:='';
  KMOdoTansTrackAkhir.Text:='';
  KMOdoTansTrackTotal.Text:='';
  KMOdoTansTrackAwal.Enabled:=False;
  KMOdoTansTrackAkhir.Enabled:=False;
  KMOdoTansTrackTotal.Enabled:=False;
  InitGridSJ;
  InDate.Date:=Now();
  BBMLiter.Text:='0';
  BBMPrice.Text:='0';
  BBMLiterReimburse.Text:='0';
  BBMPriceReimburse.Text:='0';
  FromDate.Text:='';
  ToDate.Text:='';
  Route.Text:='';
  PickupPoint.Text:='';
  Remark.Text:='';
  VehicleId:='';
  TolParkir.Text:='0';
  DriverReimburse.Text:='0';
  eOvertime.Text:='0';
  StandBy.Clear;
  Seat.Clear;
end;

procedure TCheckerIn.InitGridSJ;
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

procedure TCheckerIn.InitGridService;
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

procedure TCheckerIn.RefreshData;
var StrQry,StrAllFoward:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(SJArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  if Main.OpenDb then begin
    if All.Checked=True then StrAllFoward:=',@AllFoward=-1' else StrAllFoward:=',@AllFoward=-2';
    {testing}
    //StrAllFoward:=',@AllFoward=1';

    StrQry:='EXEC GetVhcOutList2_K '+LocationId+',1,'+CompanyId+StrAllFoward+',@InOut=3,@Quick=1; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      if (Qry.FieldValues['driver_fee']<>NULL)  then begin
        SetLength(SJArr,IntCount+1);
        SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
        SJArr[IntCount][1]:=Qry.FieldValues['body_id'];
        SJArr[IntCount][2]:=LicensePlate(Qry.FieldValues['license_plate']);
        SJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
        SJArr[IntCount][4]:=Qry.FieldValues['name'];
        SJArr[IntCount][5]:=Qry.FieldValues['out_date'];
        if Qry.FieldValues['out_time']<>NULL then SJArr[IntCount][6]:=Qry.FieldValues['out_time']
        else SJArr[IntCount][6]:='';
        SJArr[IntCount][13]:=Qry.FieldValues['from_dates'];
        SJArr[IntCount][14]:=Qry.FieldValues['from_time'];
        SJArr[IntCount][15]:=Qry.FieldValues['isfinish'];
        Inc(IntCount);
      end;
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetPrice;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      SolarPerLiter:=Qry.FieldValues['diesel_price_litre'];
      BBMPerLiter:=Qry.FieldValues['fuel_price_litre'];
      GasPerLiter:=Qry.FieldValues['gas_price_litre'];
    end;
    Qry.Close;
  end;
  Main.StatusUpdate('Premium : '+IntToStr(BBMPerLiter)+'/Ltr, Solar : '+IntToStr(SolarPerLiter)+'/Ltr, Gas : '+IntToStr(GasPerLiter)+'/Ltr','');
  FreeAndNil(Qry);
  Main.CloseDb;
  RefreshGridSJ;
  Main.M_Normal;
end;

procedure TCheckerIn.RefreshGridSJ;
var IntCount,IntCount2,IntCount3:Integer;
begin
  if Length(SJArr)>0 then begin
    UnitJalan.Text:=IntToStr(Length(SJArr));
    GridSPJ.RowCount:=2;
    IntCount2:=1;
    for IntCount:=0 to Length(SJArr)-1 do begin
      for IntCount3:=0 to GridSPJ.ColCount-1 do begin
        GridSPJ.CellStyle[IntCount3,IntCount2].Font.Color:=clBlack;
      end;

      if SJArr[IntCount][6]<>'' then begin
        GridSPJ.RowCount:=IntCount2+1;
        NoSJ.Items.Add(SJArr[IntCount][0]);
        if (SJArr[IntCount][15]='0') then begin
          for IntCount3:=0 to GridSPJ.ColCount-1 do begin
            GridSPJ.CellStyle[IntCount3,IntCount2].Font.Color:=clRed;
          end;
        end;
        GridSPJ.Cells[0,IntCount2]:=SJArr[IntCount][0];
        GridSPJ.Cells[1,IntCount2]:=SJArr[IntCount][1];
        GridSPJ.Cells[2,IntCount2]:=SJArr[IntCount][3];
        GridSPJ.Cells[3,IntCount2]:=SJArr[IntCount][4];
        GridSPJ.Cells[4,IntCount2]:=SJArr[IntCount][13];
        GridSPJ.Cells[5,IntCount2]:=SJArr[IntCount][14];

        Inc(IntCount2);
      end;
    end;
  end else
    UnitJalan.Text:='0';
end;

procedure TCheckerIn.CheckData;
var StrQry,stanby:String;
    Qry:TADOQuery;
    IntCount:Integer;
    StrOdoAkhirTT:String;
begin
  Main.M_Busy;
  if Trim(NoSJ.Text)<>'' then begin
    TransId:=NoSJ.Text;
{
    VehicleId:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][24];
    NoBodi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1];
    NoPolisi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][2];
    Driver.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3];
    DriverDisp.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4];
    Hari.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12];
    Tanggal.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][5];
    NoReservasi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][10];
    Customer.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][11];
    KMOdoAwal.Text:=SToCurr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][7]);
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
    FuelConsRate.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][26];
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
        NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
        Customer.Text:=Qry.FieldValues['customer_name'];
        KMOdoAwal.Text:=SToCurr(Qry.FieldValues['out_ordo_km']);
        {Ubah}
        KmOdoAkhir.Text:=SToCurr(Qry.FieldValues['kmMasuk']);

        if Qry.FieldValues['transtrack_odo_out_km']<>NULL then
          KMOdoTansTrackAwal.Text:=SToCurr(Qry.FieldValues['transtrack_odo_out_km'])
        else
          KMOdoTansTrackAwal.Text:='0';

        StrOdoAkhirTT:=GetOdoTransTrack(StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]));
        if Trim(StrOdoAkhirTT)<>'' then
          KMOdoTansTrackAkhir.Text:=SToCurr(Trim(ToString(StrOdoAkhirTT)))
        else
          KMOdoTansTrackAkhir.Text:='0';

        KMOdoTansTrackTotal.Text:=IToCurr(SToInt(KMOdoTansTrackAkhir.Text)-SToInt(KMOdoTansTrackAwal.Text));

        BBMPrice.Text:=SToCurr(Qry.FieldValues['bbmSPBU']);
        BBMLiter.Text:=SToCurr(Qry.FieldValues['literSPBU']);
        BBMPriceReimburse.Text:=SToCurr(Qry.FieldValues['bbmReimburse']);
        BBMLiterReimburse.Text:=SToCurr(Qry.FieldValues['literReimburse']);

        Seat.Text:=Qry.FieldValues['seat'];
        FromDate.Text:=Qry.FieldValues['from_dates_l'];
        ToDate.Text:=Qry.FieldValues['to_dates_l'];
//        try
//          StrToTime(Qry.FieldValues['standby_time']);
//          StandBy.Text:=Qry.FieldValues['standby_time'];
stanby:=  StringReplace(Qry.FieldValues['standby_time'],'.',':', []);
          StandBy.Text:=stanby;
//        except
//          StandBy.Text:=Qry.FieldValues['from_Time'];
//        end;

        if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
        if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
        if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];
        StrDriverCellNo:=Qry.FieldValues['phone_no'];
        Route.Text:=Qry.FieldValues['route'];
        PickupPoint.Text:=Qry.FieldValues['pickup_point'];
        if Qry.FieldValues['remark']<>NULL then begin
          Remark.Text:=Qry.FieldValues['remark'];
        end;
        FuelConsRate.Text:=Qry.FieldValues['fuel_cons_rate'];
        Try
//            RemarkOut.Text :=VarToStr(Qry.FieldValues['description']);
//            InDate.Date:=(Qry.FieldValues['in_date']);
//            InTime.Text:=FormatDateTime('HH:NN:SS',Qry.FieldValues['in_time']);
            KmOdoAkhirExit(nil);
          except on E:Exception do
            KmOdoAkhirExit(nil);
        End;

      end;
      Qry.Close;


      StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][20])+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
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
    KmOdoAkhir.SetFocus;
  end;
  Main.M_Normal;
end;



procedure TCheckerIn.BersihkanClick(Sender: TObject);
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

procedure TCheckerIn.FormShow(Sender: TObject);
begin
  Init;
  InitGridService;
  RefreshHeader;
  RefreshData;
  Tanggal.Text:=Main.Status.Panels.Items[0].Text;
  Cari.SetFocus;
end;

procedure TCheckerIn.DisableInput;
begin
  NoSJ.Enabled:=False;
  GroupSPJ.Enabled:=False;
  GroupInput.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TCheckerIn.EnableInput;
begin
  NoSJ.Enabled:=True;
  GroupSPJ.Enabled:=True;
  GroupInput.Enabled:=True;
  Simpan.Enabled:=True;
end;

function TCheckerIn.GetOdoTransTrack(License_Plate:String):String;
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

procedure TCheckerIn.SelesaiClick(Sender: TObject);
begin
  Main.StatusUpdate('','');
  CheckerIn.Close;
end;

procedure TCheckerIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCheckerIn.KMOdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TCheckerIn.NoSJChange(Sender: TObject);
begin
  Main.M_Busy;
  CheckData;
  Main.M_Normal;
end;

procedure TCheckerIn.KmOdoAkhirEnter(Sender: TObject);
begin
  KmOdoAkhir.Text:=ToString(KmOdoAkhir.Text);
end;

procedure TCheckerIn.KmOdoAkhirExit(Sender: TObject);
begin
  KmOdoAkhir.Text:=ToString(KmOdoAkhir.Text);
  if ToString(KmOdoAkhir.Text)='' then KmOdoAkhir.Text:='0';
  KmOdoAkhir.Text:=SToCurr(KmOdoAkhir.Text);
  if ToString(KmOdoAkhir.Text)<>'' then begin
    KMOdoTotal.Text:=IToCurr(SToInt(KmOdoAkhir.Text)-SToInt(KMOdoAwal.Text));
  end;
end;

procedure TCheckerIn.KmOdoAkhirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;
  if Key=#13 then BBMPrice.SetFocus;
end;

procedure TCheckerIn.SimpanClick(Sender: TObject);
var StrQry,StrEMessage,StrMsg:String;
    Qry,QryWehaOnline:TADOQuery;
    IsOk:Boolean;
    StrKMOdo,StrKMOdoOut,StrInTime,StrInDate,StrRemark,StrBBMLiter,StrBBMPrice,StrTolParkir,StrBBMLiterReimburse,StrBBMPriceReimburse:String;
    StrBBMSPBU, StrBBMReimburse, StrTolParkirReimburse, StrFeeDriverReimburse,StrOvertime:String;
    StrTranstrackOdoIn,StrTranstrackOdo:String;
    Count,IntDay:Integer;

    StrUrl,NameSpace,ParamIn: String;
    JadeAPI: JadeServiceSoap;
    RequestAPI:VehicleInfoModel;
    ResponAPI: ServiceResponse;
    StrResOrdDetailId: String;
    CallApi:Boolean;
    InDate_Vehicle, OutDate_Vehicle:TDateTime;
begin
  StrEMessage:='';
  IsOk:=True;
  Count:=MessageBox(0,PChar('Kendaraan '+NoPolisi.Text+' Masuk'+Chr(13)+Chr(13)+'    Sudah dicek ?'),'Armada Kembali',MB_OKCANCEL or MB_ICONQUESTION);
  //Showmessage(IntToStr(CompareDate(InDate.Date,StrToDate(ToDate.Text)))+ ' <> ' +IntToStr(DaysBetween(InDate.Date,StrToDate(ToDate.Text))) );
  if ( (Trim(NoSJ.Text)<>'') and ((NoReservasi.Text)<>'' ) and (Count=1) and (Trim(InTime.Text)<>':') ) then begin

    if ( (StrToDate(ToDate.Text)) > StrToDate(Main.Status.Panels.Items[0].Text) ) then begin
      MessageBox(0,'Unit masih diperjalanan!!!','Armada Kembali',MB_OK or MB_ICONWARNING);
      exit;
    end;

    if (CompareDate(InDate.Date,StrToDate(ToDate.Text))<0)
        OR (DaysBetween(InDate.Date,StrToDate(ToDate.Text))>Interval_CheckInDate) then begin
      MessageBox(0,'Tolong perhatikan tanggal masuk yang diinput!!!','Armada Kembali',MB_OK or MB_ICONWARNING);
      exit;
    end;
    
    IntDay := DaysBetween(StrToDate(FromDate.Text), StrToDate(ToDate.Text));
    if IntDay < 1 then Begin
      OutDate_Vehicle := StrToDateTime( ToDate.Text+' '+StandBy.Text );
      InDate_Vehicle  := StrToDateTime( FormatDateTime('dd/mm/yyyy',InDate.Date)+' '+InTime.Text );
      if (OutDate_Vehicle > InDate_Vehicle) then begin
        MessageBox(0,'Tolong perhatikan tanggal masuk dan Jam Masuk yang diinput!!!','Armada Kembali',MB_OK or MB_ICONWARNING);
        exit;
      end;
    End;

    if (SToInt(KmOdoAkhir.Text)< (SToInt(KMOdoAwal.Text)+SToFloat(ToString(FuelConsRate.Text))) ) then begin
      MessageBox(0,'KM Odo Akhir tidak boleh lebih kecil dengan KM Odo Awal!!!','Armada Kembali',MB_OK or MB_ICONWARNING);
      exit;
    end;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    QryWehaOnline:=TADOQuery.Create(Self);
    QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;

    Main.M_Busy;
    if (Main.OpenDb) AND (Count=1) then begin
      DisableInput;
      Main.TransStart;
      {get url API}
      {StrQry:='exec GetWebServiceURL 3';
      Qry.Close;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Qry.First;
      if (Qry.RecordCount>0) then begin
          StrUrl:=Qry.FieldValues['url_webservice'];
          NameSpace:=Qry.FieldValues['name_space'];
      end;   }

      StrKMOdo:=QuotedStr(ToString(KmOdoAkhir.Text));
      StrKMOdoOut:=QuotedStr(ToString(KMOdoAwal.Text));
      StrInTime:=QuotedStr(FormatDateTime('yyyy-mm-dd',InDate.Date)+' '+InTime.Text);
      {
      if (DaysBetween(InDate.Date,StrToDate(ToDate.Text))>0) then begin
        if (StrToInt(LeftStr(InTime.Text,2)+RightStr(InTime.Text,2))>Interval_CheckInTime) then
          StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',InDate.Date))
        else
          StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',InDate.Date-1));
      end else
      }
      StrInDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',InDate.Date));


      if SToInt(BBMPrice.Text)>0 then begin
        StrBBMPrice:=',fuel_price='+ToString(BBMPrice.Text);
        StrBBMLiter:=',fuel_litre='+QuotedStr(StringReplace(StringReplace(BBMLiter.Text,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]));
      end else begin
        StrBBMPrice:='';
        StrBBMLiter:='';
      end;
      if SToInt(BBMPriceReimburse.Text)>0 then begin
        StrBBMPriceReimburse:=',fuel_reimburse_price='+ToString(BBMPriceReimburse.Text);
        StrBBMLiterReimburse:=',fuel_reimburse_litre='+QuotedStr(StringReplace(StringReplace(BBMLiterReimburse.Text,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]));
      end else begin
        StrBBMPriceReimburse:='';
        StrBBMLiterReimburse:='';
      end;
      if Trim(RemarkOut.Text)<>'' then begin
        if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text+Chr(13)+RemarkOut.Text)
        else StrRemark:=QuotedStr(RemarkOut.Text);
      end else begin
        if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text)
        else StrRemark:='NULL';
      end;
      StrRemark := stringreplace(StrRemark, '"', '*', [rfReplaceAll]);

      StrTranstrackOdo:='NULL';
      StrTranstrackOdoIn:=GetOdoTransTrack(StringReplace(NoPolisi.Text,' ','',[rfReplaceAll]));
      if Trim(StrTranstrackOdoIn)<>'' then StrTranstrackOdo:=QuotedStr(Trim(ToString(StrTranstrackOdoIn)));

      StrQry:='UPDATE wh_vhc_trans SET status_sj='+QuotedStr('COMPLETED')+',out_ordo_km='+StrKMOdoOut+', in_ordo_km='+StrKMOdo+',in_date='+StrInDate+',in_time='+StrInTime+StrBBMLiter+StrBBMPrice+StrBBMLiterReimburse+StrBBMPriceReimburse+
            ',transtrack_odo_in_km='+StrTranstrackOdo+
            ',description='+StrRemark+
            ',update_time=GETDATE(),update_user='+QuotedStr(User)+
            ',in_submit_date=GETDATE(),in_user_update='+QuotedStr(User)+
            ' WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan Armada Kembali';
          StrEMessage:=E.Message;
          IsOk:=False;
          Main.M_Normal;
        end;
      end;
      (*
      if (Trim(TolParkir.Text)<>'0') and (Trim(TolParkir.Text)<>'') then begin
        StrTolParkir:=ToString(TolParkir.Text);
        StrQry:='INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,total_amount,update_time,update_user) '+
                'VALUES ('+QuotedStr(TransId)+',140109,'+StrTolParkir+','+StrTolParkir+','+StrTolParkir+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Armada Kembali (TolParkir)';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
      end;
      *)

      if (Trim(BBMPrice.Text)<>'0') and (Trim(BBMPrice.Text)<>'') then begin
        StrBBMSPBU:=ToString(BBMPrice.Text);
        StrQry:='INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,total_amount,update_time,update_user) '+
                'VALUES ('+QuotedStr(TransId)+',140110,'+StrBBMSPBU+','+StrBBMSPBU+','+StrBBMSPBU+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Armada Kembali (BBMPrice)';
            StrEMessage:=E.Message;
            IsOk:=False;
            Main.M_Normal;
          end;
        end;
      end;

      if (Trim(BBMPriceReimburse.Text)<>'0') and (Trim(BBMPriceReimburse.Text)<>'') then begin
        StrBBMReimburse:=ToString(BBMPriceReimburse.Text);
        StrQry:='INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,total_amount,update_time,update_user) '+
                'VALUES ('+QuotedStr(TransId)+',140107,'+StrBBMReimburse+','+StrBBMReimburse+','+StrBBMReimburse+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Armada Kembali (BBMPriceReimburse)';
            StrEMessage:=E.Message;
            IsOk:=False;
            Main.M_Normal;
          end;
        end;
      end;

      if (Trim(DriverReimburse.Text)<>'0') and (Trim(DriverReimburse.Text)<>'') then begin
        StrFeeDriverReimburse:=ToString(DriverReimburse.Text);
        StrQry:='INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,total_amount,update_time,update_user) '+
                'VALUES ('+QuotedStr(TransId)+',140108,'+StrFeeDriverReimburse+','+StrFeeDriverReimburse+','+StrFeeDriverReimburse+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Armada Kembali (DriverReimburse)';
            StrEMessage:=E.Message;
            IsOk:=False;
            Main.M_Normal;
          end;
        end;
      end;
      {Overtime}
      if (Trim(eOvertime.Text)<>'0') and (Trim(eOvertime.Text)<>'') then begin
        StrOvertime:=ToString(eOvertime.Text);
        StrQry:='INSERT INTO wh_vhc_trans_detail (vhc_trans_id,transaction_type_id,value,amount,total_amount,update_time,update_user) '+
                'VALUES ('+QuotedStr(TransId)+',140113,'+StrOvertime+','+StrOvertime+','+StrOvertime+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan Armada Kembali (Overtime)';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
      end;

      if IsOk then begin
        Qry.Close;
        StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('PostingData_WehaOnline')+') AND (active=1);';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['value_string']=1 then CallApi:=True;
          if Qry.FieldValues['value_string']=0 then CallApi:=False;
        end;
        Qry.Close;
        StrQry:='SELECT rod.reserved_order_detail_id reserved_order_detail_id, co.online online from '+
                  'wh_reserved_order_detail rod '+
                  'left join wh_reserved_order ro on ro.reserved_order_id=rod.reserved_order_id '+
                  'left join wh_customer_order co on co.customer_order_id=ro.customer_order_id '+
                  'where rod.vhc_trans_id='+QuotedStr(TransId)+' and rod.status=1; ';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        StrResOrdDetailId := '';
        StrIsOnline:=VarToStr(Qry.FieldValues['online']);
        if StrIsOnline='0' Then CallApi:=False;
        if StrIsOnline='1' then
        begin

          if Qry.FieldValues['reserved_order_detail_id']<>NULL then
          begin
              StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id'];

              StrQry:='SELECT * FROM OrderDetailVehicleInfos WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
              QryWehaOnline.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,2);
              QryWehaOnline.SQL.Add(StrQry);
              QryWehaOnline.Open;

              if QryWehaOnline.RecordCount>0 then begin

                //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''COMPLETED'' '+
                //        ' WHERE WehaReservedCode='+QuotedStr(StrResOrdDetailId);
                StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''COMPLETED'' ,InKM='+StrKMOdo+',TranstrackOdoInKm='+StrTranstrackOdo+
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
                  //StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''COMPLETED'', '+
                  //        ' WehaReservedCode='+QuotedStr(StrResOrdDetailId) +
                  //        ' WHERE WorkOrderNo='+QuotedStr(NoSJ.Text);
                  StrQry:=' UPDATE OrderDetailVehicleInfos SET Status=''COMPLETED'', '+
                          ' WehaReservedCode='+QuotedStr(StrResOrdDetailId) +
                          ' ,InKM='+StrKMOdo+',TranstrackOdoInKm='+StrTranstrackOdo+
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
                end else begin
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
          if Qry.FieldValues['reserved_order_detail_id']<>NULL then
            StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id']
          else begin

              StrQry:='select reserved_order_detail_id from wh_reserved_order_detail_package '+
                      'where vhc_trans_id='+QuotedStr(TransId)+' and status=1 ;';
              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Add(StrQry);
              Qry.Open;
              if Qry.FieldValues['reserved_order_detail_id']<>NULL then
                StrResOrdDetailId := Qry.FieldValues['reserved_order_detail_id']
              else
                IsOk:=False;
          end;

          //WebService.WSDLLocation := StrUrl;
          WebService.Port := 'JadeServiceSoap';
          WebService.Service := 'JadeService';
          RequestAPI:= VehicleInfoModel.Create;
          With RequestAPI Do Begin
            WehaReservedCode := StrResOrdDetailId;
            WorkOrderNo := NoSJ.Text;
            Status := 'COMPLETED';
            DriverName := DriverDisp.Text;
            DriverPhone:= StrDriverCellNo;
            VehiclePlateNo:=NoPolisi.Text;
          End;
          ParamIn := 'NoOrder='+NoReservasi.Text+'; WehaReservedCode='+RequestAPI.WehaReservedCode+'; WorkOrderNo='+RequestAPI.WorkOrderNo+'; Status='+RequestAPI.Status+
                       '; DriverName='+RequestAPI.DriverName+'; DriverPhone='+RequestAPI.DriverPhone+'; VehiclePlateNo='+RequestAPI.VehiclePlateNo;
          Try
              Main.WriteTableLog('Armada Masuk - ChangeVehicleInfo',ParamIn, 'Mulai');
              if LowerCase(Main.Db)='wh_prod' then
                JadeAPI := GetJadeServiceSoap(True,'',WebService, StrUrl, NameSpace)
              else
                JadeAPI := GetJadeServiceSoap(False,'',WebService, StrUrl, NameSpace);
              ResponAPI := JadeAPI.ChangeVehicleInfo(RequestAPI);
              Main.WriteTableLog('Armada Masuk - ChangeVehicleInfo',ParamIn, (ResponAPI.Status)+#13#10+ResponAPI.Message);
          Except
            On E:Exception Do begin
              Main.WriteTableLog('Armada Masuk - ChangeVehicleInfo',ParamIn, 'Message Exception : '+e.Message);
              if AnsiContainsText(e.message, 'timed out') then
                isOk := true
              else begin
                isOk := False;
                EnableInput;
                ShowMessage('Error API'+#13#10+e.Message);
              end;
            end;
          end;
          //if LowerCase(ResponAPI.Status)='error' then begin
          if (LowerCase(ResponAPI.Status)='error') then begin
              if IsDataFound Then Begin
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

        end;  }


        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Data berhasil Disimpan','Armada Kembali',MB_OK or MB_ICONINFORMATION);
          StrBBMLiterReimburse := StringReplace(StringReplace(BBMLiterReimburse.Text,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
          if SToInt(StrBBMLiterReimburse)>0 then begin
            if MessageBox(0,'Cetak Reimburse?','Uang Order Reimburse',MB_OKCANCEL or MB_ICONQUESTION) = 1 then
              RePrintReimburse(TransId);
          end;
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Armada Kembali',MB_OK or MB_ICONWARNING);
        end;
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Armada Kembali',MB_OK or MB_ICONWARNING);
      end;
    end else begin
      IsOk:=False;
      StrMsg:='Kolom Tidak boleh Kosong';
    end;
    Qry.Close;
  end else
    MessageBox(0,PChar('Silahkan Isi semua kolom dengan benar'+Chr(13)+'Dan cek kembali yang diisi'),'Armada Kembali',MB_OK or MB_ICONWARNING);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCheckerIn.InTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then RemarkOut.SetFocus;
end;

procedure TCheckerIn.RemarkOutKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TCheckerIn.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGridSJ;
    Count2:=1;
    NoSJ.Items.Clear;
    NoSJ.Text:='';
    NoSJ.ItemIndex:=-1; 
    for Count:=0 to Length(SJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(SJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        if SJArr[Count][6]<>'' then begin
          NoSJ.Items.Add(SJArr[Count][0]);
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
    end;
  end else begin
    RefreshData;
    RefreshGridSJ;
  end;
end;

procedure TCheckerIn.InDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then InTime.SetFocus;
end;

procedure TCheckerIn.BBMPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;
  if Key=#13 then BBMPriceReimburse.SetFocus;
end;

procedure TCheckerIn.BBMPriceExit(Sender: TObject);
begin
  if ToString(BBMPrice.Text)='' then BBMPrice.Text:='0';
  BBMPrice.Text:=SToCurr(BBMPrice.Text);
  if ToString(BBMPrice.Text)<>'' then begin
    BBMLiter.Text:=IToCurr(RoundTo(SToInt(BBMPrice.Text)/SolarPerLiter,-2));
  end;
end;

procedure TCheckerIn.AllClick(Sender: TObject);
begin
  RefreshData;
  RefreshGridSJ;
end;

procedure TCheckerIn.CheckListClick(Sender: TObject);
begin
  if VehicleId<>'' then if Main.IsFormOpen('VehicleEquipmentCheck')=False then VehicleEquipmentCheck:=TVehicleEquipmentCheck.Create(nil,'Checker-Out',VehicleId,True); 
end;

procedure TCheckerIn.TolParkirEnter(Sender: TObject);
begin
  TolParkir.Text:=ToString(TolParkir.Text);
end;

procedure TCheckerIn.BBMPriceEnter(Sender: TObject);
begin
  BBMPrice.Text:=ToString(BBMPrice.Text);
end;

procedure TCheckerIn.BBMLiterEnter(Sender: TObject);
begin
  BBMLiter.Text:=ToString(BBMLiter.Text); 
end;

procedure TCheckerIn.BBMLiterExit(Sender: TObject);
begin
  if ToString(BBMLiter.Text)='' then BBMLiter.Text:='0';
  BBMLiter.Text:=SToCurr(BBMLiter.Text);
  if ToString(BBMLiter.Text)<>'' then begin
    BBMPrice.Text:=IToCurr(SToInt(BBMLiter.Text)*SolarPerLiter);
  end;
end;

procedure TCheckerIn.TolParkirKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then eOvertime.SetFocus;
end;

procedure TCheckerIn.TolParkirExit(Sender: TObject);
begin
  if ToString(TolParkir.Text)='' then TolParkir.Text:='0';
  TolParkir.Text:=SToCurr(TolParkir.Text);
end;

procedure TCheckerIn.BBMLiterKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;
  if Key=#13 then BBMPriceReimburse.SetFocus;
end;

procedure TCheckerIn.BBMPriceReimburseEnter(Sender: TObject);
begin
  BBMPriceReimburse.Text:=ToString(BBMPriceReimburse.Text);
end;

procedure TCheckerIn.BBMPriceReimburseExit(Sender: TObject);
begin
  if ToString(BBMPriceReimburse.Text)='' then BBMPriceReimburse.Text:='0';
  BBMPriceReimburse.Text:=SToCurr(BBMPriceReimburse.Text);
  if ToString(BBMPriceReimburse.Text)<>'' then begin
    BBMLiterReimburse.Text:=IToCurr(RoundTo(SToInt(BBMPriceReimburse.Text)/SolarPerLiter,-2));
  end;
end;

procedure TCheckerIn.BBMPriceReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then TolParkir.SetFocus;
end;

procedure TCheckerIn.BBMLiterReimburseEnter(Sender: TObject);
begin
  BBMLiterReimburse.Text:=ToString(BBMLiterReimburse.Text);
end;

procedure TCheckerIn.BBMLiterReimburseExit(Sender: TObject);
begin
  if ToString(BBMLiterReimburse.Text)='' then BBMLiterReimburse.Text:='0';
  BBMLiterReimburse.Text:=SToCurr(BBMLiterReimburse.Text);
  if ToString(BBMLiterReimburse.Text)<>'' then begin
    BBMPriceReimburse.Text:=IToCurr(SToInt(BBMLiterReimburse.Text)*SolarPerLiter);
  end;
end;

procedure TCheckerIn.BBMLiterReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then TolParkir.SetFocus;
end;

procedure TCheckerIn.DriverReimburseExit(Sender: TObject);
begin
  if ToString(DriverReimburse.Text)='' then DriverReimburse.Text:='0';
  DriverReimburse.Text:=SToCurr(DriverReimburse.Text);
end;

procedure TCheckerIn.DriverReimburseEnter(Sender: TObject);
begin
  DriverReimburse.Text:=ToString(DriverReimburse.Text);
end;

procedure TCheckerIn.DriverReimburseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then InDate.SetFocus;
end;

procedure TCheckerIn.eOvertimeChange(Sender: TObject);
begin
//
end;

procedure TCheckerIn.eOvertimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then InDate.SetFocus;
end;

procedure TCheckerIn.eOvertimeEnter(Sender: TObject);
begin
  eOvertime.Text:=ToString(eOvertime.Text);
end;

procedure TCheckerIn.eOvertimeExit(Sender: TObject);
begin
  if ToString(eOvertime.Text)='' then eOvertime.Text:='0';
  eOvertime.Text:=SToCurr(eOvertime.Text);
end;

procedure TCheckerIn.RePrintReimburse(Trans_Id:String);
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

          if Qry.FieldValues['kmMasuk']<>null then begin
            LabelStatus.Caption :='Sudah Foto dengan Customer';
            LabelStatus.Color := clGreen;
          end else begin
            LabelStatus.Caption :='Belum Foto dengan Customer';
            LabelStatus.Color := clRed;
          end;

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

procedure TCheckerIn.ZColorStringGrid1DblClick(Sender: TObject);
begin
  if (NoBodi.Text='') AND (Trim(GridSPJ.Cells[1,IntRow])<>'')  then begin
    Main.M_Busy;
    NoSJ.ItemIndex:=NoSJ.Items.IndexOf(GridSPJ.Cells[0,IntRow]);

    CheckData;

    Main.M_Normal;
  end;
end;

procedure TCheckerIn.btn1Click(Sender: TObject);
begin
  if app_edt_km_awal ='1' then
  begin
     GroupBox1.Enabled:=True;
  end else
  begin
    AuthorizedForm.Show;
  end;
end;

procedure TCheckerIn.KMOdoAwalEnter(Sender: TObject);
begin
  KmOdoAwal.Text:=ToString(KmOdoAwal.Text);
end;

procedure TCheckerIn.KMOdoAwalExit(Sender: TObject);
begin
  KmOdoAwal.Text:=ToString(KmOdoAwal.Text);
  if ToString(KmOdoAwal.Text)='' then KmOdoAwal.Text:='0';
  KmOdoAwal.Text:=SToCurr(KmOdoAwal.Text);
  if ToString(KmOdoAwal.Text)<>'' then begin
    KMOdoTotal.Text:=IToCurr(SToInt(KmOdoAkhir.Text)-SToInt(KMOdoAwal.Text));
  end;
end;

procedure TCheckerIn.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

end.
