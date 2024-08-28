unit OrderListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls, ppParameter, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TOrderList = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    PanelLegend: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    Semua: TCheckBox;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppOrderId: TppLabel;
    ppLabelTo: TppLabel;
    ppLabel14: TppLabel;
    ppLine15: TppLine;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppCustomerName: TppLabel;
    ppGroupName: TppLabel;
    ppContactName: TppLabel;
    ppLabel3: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppCelularNo: TppLabel;
    ppPhoneNo: TppLabel;
    ppFaxNo: TppLabel;
    ppLabel26: TppLabel;
    ppLabel16: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppSalesName: TppLabel;
    ppSubmitDate: TppLabel;
    ppSubmitTime: TppLabel;
    ppLabel32: TppLabel;
    ppShape3: TppShape;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine1: TppLine;
    ppCompany: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppService1: TppLabel;
    ppService2: TppLabel;
    ppService3: TppLabel;
    ppService4: TppLabel;
    ppService5: TppLabel;
    ppService6: TppLabel;
    ppService7: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppContract: TppLabel;
    ppTotal: TppLabel;
    ppDiscount: TppLabel;
    ppNameCN: TppLabel;
    ppTimeLimit: TppLabel;
    ppPayment1: TppLabel;
    ppPayment2: TppLabel;
    ppFullPayment: TppLabel;
    ppDiscountCN: TppLabel;
    ppNoRekCN: TppLabel;
    ppDatePayment1: TppLabel;
    ppDatePayment2: TppLabel;
    ppDatePayment3: TppLabel;
    ppLine2: TppLine;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppGuideName: TppLabel;
    ppGuideCellular: TppLabel;
    ppShape1: TppShape;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLine3: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine14: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppReprinted: TppLabel;
    ppInvoiceNo: TppLabel;
    ppLogo: TppImage;
    ppWhiteMiniVan: TppLabel;
    ppWhiteMicroBus: TppLabel;
    ppWhiteBigBus: TppLabel;
    ppSilverBigBus: TppLabel;
    ppSilverMicroBus: TppLabel;
    ppSilverMiniVan: TppLabel;
    ppLabel1: TppLabel;
    ppLine31: TppLine;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppemail: TppLabel;
    ppSilverBigBusSeat: TppLabel;
    ppSilverMicroBusSeat: TppLabel;
    ppSilverMiniVanSeat: TppLabel;
    ppWhiteBigBusSeat: TppLabel;
    ppWhiteMcroBusSeat: TppLabel;
    ppWhiteMiniVanSeat: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppTanggal: TppDBText;
    ppBodyId: TppDBText;
    ppLine28: TppLine;
    ppLine5: TppLine;
    ppDriver: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine12: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppSeat: TppDBText;
    ppStandByTIme: TppDBText;
    ppRoute: TppDBMemo;
    ppPickupPoint: TppDBMemo;
    ppRemark: TppDBMemo;
    ppLine32: TppLine;
    ppUnits: TppDBText;
    ppLine13: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    Label7: TLabel;
    OutDates: TCheckBox;
    CariOffering: TSpeedButton;
    Proses: TButton;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure SemuaClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure OutDatesClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariOfferingClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure ProsesClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId,OrderBy:String;
    OrderArr,CompanyArr:Array of TArrString20;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    OutDate,Initiation,IncludeAdditional:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0;Out_Date:Integer=0;Include_Additional:Boolean=False);Overload;
    procedure RefreshDisplay;
  end;

var
  OrderList: TOrderList;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, AuthorizedFormU,
  AdditionalFeeOrderFormU;

{$R *.dfm}

constructor TOrderList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TOrderList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0;Out_Date:Integer=0;Include_Additional:Boolean=False);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  OrderBy:=Order_By;
  Range:=Range_M;
  if Out_Date=1 then OutDate:=True else OutDate:=False;
  IncludeAdditional:=Include_Additional;
  Main.WriteLog('Form Open: OrderList='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+Order_By+','+IntToStr(Range_M)+','+IntToStr(Out_Date)+','+BoolToStr(Include_Additional),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TOrderList.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  Tanggal.Enabled:=False; 
  Semua.Checked:=True;
  if OutDate then begin
    OutDates.Checked:=True;
    Semua.Checked:=False;
    Tanggal.Enabled:=True; 
    Tanggal.Date:=Now+1;
  end;
  if IsAll>19 then begin
    Caption:='Daftar Tunggu';
    PanelLegend.Visible:=False;
  end else begin
    Caption:='Daftar Pesanan';
    PanelLegend.Visible:=True;
  end;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=130809';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
       ToXCel.Enabled:=True;
    end else begin
      ToXCel.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
//  if UserLevel<59 then ToXCel.Enabled:=False;
end;

procedure TOrderList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=17;
  StrGrid.ColWidths[0]:=150;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=230;
  StrGrid.ColWidths[5]:=180;
  StrGrid.ColWidths[6]:=180;
  StrGrid.ColWidths[7]:=140;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=100;
  StrGrid.ColWidths[11]:=120;
  StrGrid.ColWidths[12]:=0;
  StrGrid.ColWidths[13]:=0;
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  StrGrid.ColWidths[16]:=0;
  //col 12=departement_id
  //col 13=superior_id1
  //col 14=transaction_id
  //col 15=complete
  //col 16=status
  //col 17=superior_id2
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,9,0);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  if IsAll>19 then begin
    StrGrid.Cells[0,0]:='No Tunggu';
    StrGrid.Cells[1,0]:='Tanggal';
    StrGrid.Cells[2,0]:='';
    StrGrid.ColWidths[2]:=0;
  end else begin
    StrGrid.Cells[0,0]:='No Pesanan';
    StrGrid.Cells[1,0]:='Tanggal';
    StrGrid.Cells[2,0]:='No Kontrak';
  end;
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Alamat';
  StrGrid.Cells[5,0]:='Penggunaan';
  StrGrid.Cells[10,0]:='Sales';
  StrGrid.Cells[11,0]:='Keterangan';
  StrGrid.Cells[5,1]:='Produk';
  StrGrid.Cells[6,1]:='Perjalanan';
  StrGrid.Cells[7,1]:='Tgl';
  StrGrid.Cells[9,1]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[9,2].HorizontalAlignment:=taRightJustify;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TOrderList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TOrderList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrOrder,StrRange,StrLocationId,StrCompanyId,StrIncludeAdditional,StrCustomerId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);
    if Semua.Checked=False then begin
      if OutDates.Checked=True then begin
        StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
      end else begin
        StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
      end
    end else StrTanggal:='';
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if CustId<>'' then StrCustomerId:=',@CustomerId='+QuotedStr(CustId) else StrCustomerId:='';
    if OrderBy<>'' then StrOrder:=',@OrderBy='+OrderBy;

    if Range>0 then StrRange:=',@Range='+IntToStr(Range) else StrRange:='';
    if IncludeAdditional=True then StrIncludeAdditional:=',@IncludeAdditional=1' else StrIncludeAdditional:='';
    StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+StrCustomerId+',@Finish='+IntToStr(IsAll)+StrOrder+StrRange+StrIncludeAdditional+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(OrderArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      OrderArr[IntCount][0]:=Qry.FieldValues['customer_order_id'];
      OrderArr[IntCount][1]:=Qry.FieldValues['submit_dates'];
      if Qry.FieldValues['cust_contract_id']<>NULL then  OrderArr[IntCount][2]:=Qry.FieldValues['cust_contract_id'];
      if Qry.FieldValues['names']<>NULL then OrderArr[IntCount][3]:=Qry.FieldValues['names'];
      if Qry.FieldValues['customer_id']<>NULL then
      if (Qry.FieldValues['zip']<>NULL) and Qry.FieldValues['zip']<>'0' then OrderArr[IntCount][4]:=Qry.FieldValues['address']+', '+ToString(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then OrderArr[IntCount][4]:=Qry.FieldValues['address'];
      OrderArr[IntCount][5]:=Qry.FieldValues['product_detail_resume'];
      OrderArr[IntCount][6]:=Qry.FieldValues['route_detail_resume'];
      OrderArr[IntCount][7]:=Qry.FieldValues['from_datetime_detail_resume'];
      OrderArr[IntCount][9]:=IToCurr(Qry.FieldValues['total']);
      OrderArr[IntCount][10]:=Qry.FieldValues['sales_name'];
      if Qry.FieldValues['remark']<>NULL then OrderArr[IntCount][11]:=Qry.FieldValues['remark'];
      if Qry.FieldValues['department_id']<>NULL then OrderArr[IntCount][12]:=Qry.FieldValues['department_id'];
      if Qry.FieldValues['superior_user_id1']<>NULL then OrderArr[IntCount][13]:=Qry.FieldValues['superior_user_id1'];
      if Qry.FieldValues['transaction_id']<>NULL then OrderArr[IntCount][14]:='1' else OrderArr[IntCount][14]:='0';
      if Qry.FieldValues['complete']<>NULL then OrderArr[IntCount][15]:='1' else OrderArr[IntCount][15]:='0';
      //if Qry.FieldValues['statusorder']='1' then OrderArr[IntCount][16]:=Qry.FieldValues['statusorder'];
      OrderArr[IntCount][16]:=vartostr(Qry.FieldValues['statusorder']);

      if Qry.FieldValues['superior_user_id2']<>NULL then OrderArr[IntCount][17]:=Qry.FieldValues['superior_user_id2'];
      OrderArr[IntCount][18]:=Qry.FieldValues['is_booking'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOrderList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  for IntCount:=0 to Length(OrderArr)-1 do begin
//    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
//    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
    StrGrid.Cells[15,IntCount+2]:=OrderArr[IntCount][15];
    StrGrid.Cells[16,IntCount+2]:=OrderArr[IntCount][16];
    StrGrid.Cells[17,IntCount+2]:=OrderArr[IntCount][17];
    if OrderArr[IntCount][14]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clMaroon;
    if OrderArr[IntCount][15]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clBlue;
    if (OrderArr[IntCount][14]='1') and (OrderArr[IntCount][15]='1') then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    if (OrderArr[IntCount][16]='0') then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed;
    if (OrderArr[IntCount][18]='1') then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clFuchsia;
   end;
  Main.M_Normal;
end;

procedure TOrderList.FormShow(Sender: TObject);
begin
  //RefreshDisplay;
  Init;
  InitGrid;
  RefreshCombo;  
  Initiation:=False;
end;

procedure TOrderList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TOrderList.Search;
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(OrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(OrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do begin
            StrGrid.Cells[Count4,Count2]:=OrderArr[Count][Count4];
            StrGrid.CellStyle[Count4,2].Font.Color:=clWindowText;
          end;
          if OrderArr[Count][14]='1' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clMaroon;
          if OrderArr[Count][15]='1' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clBlue;
          if (OrderArr[Count][14]='1') and (OrderArr[Count][15]='1') then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clGreen;
          if (OrderArr[Count][16]='0') then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clRed;
          if (OrderArr[Count][18]='1') then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clFuchsia;

          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TOrderList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TOrderList.StrGridDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrOrder,StrBookedId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      //if Main.IsFormOpen('OrderForm')=False then
      OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[0,IntRow],False);
    end else begin
      if (UpperCase(FormRequest)='MAIN-CHANGE') then {if Main.IsFormOpen('OrderForm')=False then} begin
        if (DepartmentId=StrGrid.Cells[12,IntRow]) or (DepartmentId='13') or (StrGrid.Cells[13,IntRow]=User) or (StrGrid.Cells[17,IntRow]=User)  then begin
          OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[0,IntRow],True);
          Close;
        end else begin
          MessageBox(Handle,PChar('Hanya Departemen yang bersangkutan '+Chr(13)+'atau Atasannya yg berhak merevisi'),'Pesanan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
        end;
      end;
      if (UpperCase(FormRequest)='PRICE-REVISED') then {if Main.IsFormOpen('OrderForm')=False then} begin
        OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[0,IntRow],True,'Price-Revised');
        Close;
      end;
      if UpperCase(FormRequest)='ORDER-REPRINT' then  begin
        OrderForm.RePrint(StrGrid.Cells[0,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='INVOICE-CREATE' then  begin
        BusInvoice.SetOrderId(StrGrid.Cells[0,IntRow]);
        OrderList.Close;
      end;
      if UpperCase(FormRequest)='RESERVED-CREATE' then  begin
        BookingForm.SetOrderId(StrGrid.Cells[0,IntRow]);
        OrderList.Close;
      end;
      if UpperCase(FormRequest)='INVOICE-AUTH' then  begin
        StrOrder:=StrGrid.Cells[0,IntRow];
        AuthorizedForm.FormId:=IntToStr(TreeTag);
        AuthorizedForm.StrMessage:=' Otorisasi, Invoice Setelah Penggunaan ';
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        Qry.CommandTimeout := 3600;
        if (AuthorizedForm.ShowModal=1) then begin
          IsOk:=True;
          if Main.OpenDb then begin
            StrQry:=' UPDATE wh_customer_order set inv_later=1 '+
                    ' WHERE customer_order_id='+QuotedStr(StrOrder)+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
              end;
            end;
            if IsOk then
                MessageBox(Handle,'Otorisasi Invoice Berhasil','Otorisasi Invoice',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND)
            else
                MessageBox(Handle,'Data Gagal Disimpan','Otorisasi Invoice',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          end;
          FreeAndNil(Qry);
          Main.CloseDb;
        end;
      end;
      if UpperCase(FormRequest)='REACTIVATED-REVISED' then  begin
        StrOrder:=StrGrid.Cells[0,IntRow];
        if MessageBox(Handle,'Mau Mengaktifkan Kembali Pesanan ini?','Pesanan',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1  then begin
          AuthorizedForm.FormId:=IntToStr(TreeTag);
          AuthorizedForm.StrMessage:=' Otorisasi Pengaktifan Pesanan '+StrOrder;
          Qry:=TADOQuery.Create(Self);
          Qry.Connection:=Main.MyConnection;
          Qry.CommandTimeout := 3600;
          if (AuthorizedForm.ShowModal=1) then begin
            IsOk:=True;
            if Main.OpenDb then begin
              StrQry:=' UPDATE wh_customer_order set status=1 '+
                      ' WHERE customer_order_id='+QuotedStr(StrOrder)+';';
              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                end;
              end;
              if IsOk then
                  MessageBox(Handle,'Berhasil Mengaktifkan kembali Pesanan','Pesanan',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND)
              else
                  MessageBox(Handle,'Gagal Mengaktifkan kembali Pesanan','Pesanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
            end;
            FreeAndNil(Qry);
            Main.CloseDb;
          end;
        end;
      end;
      if UpperCase(FormRequest)='ADDITIONALFEEORDER' then  begin
        AdditionalFeeOrderForm.SetOrderId(StrGrid.Cells[0,IntRow]);
        Close;
      end;
      if (UpperCase(FormRequest)='WAITINGLIST-ALLOCATE') then begin
        BookingForm:=TBookingForm.Create(nil,'',True,'WAITINGLIST-ALLOCATE');
        BookingForm.SetOrderId(StrGrid.Cells[0,IntRow]);
        Close;
      end;
      if (UpperCase(FormRequest)='WAITINGLIST-CHANGE') then begin
        //BookingForm.Create(nil);
        //EXEC GetCustomerOrderDetail StrGrid.Cells[0,IntRow];
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        Qry.CommandTimeout := 3600;
        StrQry:='EXEC GetCustomerOrderDetail '+QuotedStr(StrGrid.Cells[0,IntRow]);
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        IntCount:=0;
        if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            StrBookedId:=Qry.FieldValues['reserved_order_id'];
            Qry.Next;
          end;
        Qry.Close;
        FreeAndNil(Qry);
        Main.CloseDb;

        BookingForm:=TBookingForm.Create(nil,StrBookedId,True,'WAITINGLIST-CHANGE');
        BookingForm.SetOrderId(StrGrid.Cells[0,IntRow]);
        Close;
      end;
      if (UpperCase(FormRequest)='WAITINGLIST') then begin
        OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[0,IntRow],False,'WaitingList');
        Close;
      end;
    end;
  end;
end;

procedure TOrderList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOrderList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TOrderList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TOrderList.SemuaClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if (Semua.Checked) then Tanggal.Enabled:=False
    else Tanggal.Enabled:=True;
//    RefreshData;
//    RefreshGrid;
  end;
end;

procedure TOrderList.TanggalChange(Sender: TObject);
begin
{
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
  }
end;

procedure TOrderList.OutDatesClick(Sender: TObject);
begin
  if not(Initiation) then begin
//    RefreshData;
//    RefreshGrid;
  end;
end;

procedure TOrderList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TOrderList.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TOrderList.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOrderList.SBUChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOrderList.ProsesClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
