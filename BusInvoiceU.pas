unit BusInvoiceU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppParameter, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls, Grids,
  ZColorStringGrid, Buttons, ExtCtrls, WHUnit, ppDBPipe, ppDB, DB, ppDBBDE,
  ppVar, ppSubRpt, AdoDb;

type
  TBusInvoice = class(TForm)
    Label19: TLabel;
    GroupOrder: TGroupBox;
    Label14: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SubTotal: TMemo;
    Discount: TMemo;
    Total: TMemo;
    GroupBatal: TPanel;
    Status: TCheckBox;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Panel3: TPanel;
    Address: TMemo;
    HeaderRemark: TMemo;
    GroupHeader: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LabelSegment1: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    ContactDisp: TEdit;
    CustomerId: TEdit;
    ContactId: TEdit;
    OrderId: TEdit;
    CustomerDisp: TEdit;
    PanelCariOrder: TPanel;
    CariOrder: TSpeedButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    InvoiceId: TEdit;
    InvoiceDate: TEdit;
    SalesPerson: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    GroupDetail: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    PanelDetail: TPanel;
    PanelDiscount: TPanel;
    Label7: TLabel;
    DiscountPrice: TEdit;
    DiscountPercent: TEdit;
    Remark: TMemo;
    GroupService: TGroupBox;
    GridService: TZColorStringGrid;
    StrGrid: TZColorStringGrid;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppCustomer: TppMemo;
    ppInvoiceId: TppLabel;
    ppNPWP: TppLabel;
    ppGroupName: TppLabel;
    ppDates: TppLabel;
    ppSales: TppLabel;
    ppOrderId: TppLabel;
    ppDateUse: TppDBText;
    ppDescription: TppDBText;
    ppDBText1: TppDBText;
    ppReprinted: TppLabel;
    Label13: TLabel;
    ContractId: TEdit;
    ppCustomerName: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppParameterList1: TppParameterList;
    ppSummaryBand1: TppSummaryBand;
    ppService: TppLabel;
    ppServiceTotal: TppLabel;
    Panel4: TPanel;
    FixedInvoice: TCheckBox;
    pp2Report: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pp2Customer: TppMemo;
    pp2InvoiceId: TppLabel;
    pp2NPWP: TppLabel;
    pp2GroupName: TppLabel;
    pp2Dates: TppLabel;
    pp2Sales: TppLabel;
    pp2OrderId: TppLabel;
    pp2Reprinted: TppLabel;
    pp2CustomerName: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand2: TppFooterBand;
    pp2Remark: TppLabel;
    pp2Total: TppLabel;
    pp2Signature: TppLabel;
    pp2AmountSaid: TppLabel;
    pp2Discount: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    pp2Service: TppLabel;
    pp2ServiceTotal: TppLabel;
    ppParameterList2: TppParameterList;
    pp2SubTotal: TppLabel;
    pp2PageNumber: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSysPageNo: TppSystemVariable;
    ppLabel3: TppLabel;
    ppSysPageCount: TppSystemVariable;
    NPWP: TCheckBox;
    pp2DueDate: TppLabel;
    ppDueDate: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppRemark: TppLabel;
    ppTotal: TppLabel;
    ppSignature: TppLabel;
    ppAmountSaid: TppLabel;
    ppDiscount: TppLabel;
    ppLabelDiscount: TppLabel;
    NoPageFooter: TCheckBox;
    ppDescription4: TppDBText;
    MultiOrder: TCheckBox;
    pp3Report: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppCustomer3: TppMemo;
    ppInvoiceId3: TppLabel;
    ppNPWP3: TppLabel;
    ppGroupName3: TppLabel;
    ppDates3: TppLabel;
    ppSales3: TppLabel;
    ppOrderId3: TppLabel;
    ppReprinted3: TppLabel;
    ppCustomerName3: TppLabel;
    ppSysPageNo3: TppSystemVariable;
    ppLabel11: TppLabel;
    ppSysPageCount3: TppSystemVariable;
    ppDueDate3: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppRemark3: TppLabel;
    ppTotal3: TppLabel;
    ppSignature3: TppLabel;
    ppAmountSaid3: TppLabel;
    ppDiscount3: TppLabel;
    ppLabelDiscount3: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppService3: TppLabel;
    ppServiceTotal3: TppLabel;
    ppParameterList3: TppParameterList;
    ppLogo3: TppImage;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape1: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine1: TppLine;
    ppLabel22: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppShape2: TppShape;
    ppLine11: TppLine;
    ppPageNo: TppLabel;
    ppPageCount: TppLabel;
    ppPageNo3: TppLabel;
    ppPageCount3: TppLabel;
    ppCompany3: TppLabel;
    ppAddress3: TppMemo;
    ppMemoFooter3: TppMemo;
    ppDBText16: TppDBText;
    PphPercen: TMemo;
    PphDeduction: TMemo;
    ppPph: TppLabel;
    ppPphDeduction: TppLabel;
    PpnAddition: TMemo;
    Label15: TLabel;
    PPNPercen: TMemo;
    ppPPNLabel: TppLabel;
    ppPPNAddition: TppLabel;
    PPHLabel: TLabel;
    Label18: TLabel;
    TotInvoice_PPH: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure TotalKeyPress(Sender: TObject; var Key: Char);
    procedure SubTotalKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountKeyPress(Sender: TObject; var Key: Char);
    procedure SubTotalEnter(Sender: TObject);
    procedure DiscountEnter(Sender: TObject);
    procedure TotalEnter(Sender: TObject);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid,CompId,IntRowGrid,FormNumber:Integer;
    ProductArr,ServiceArr:Array of TArrString16;
    IsInputGrid,IsInput:Boolean;
    InvcId,RefCustomerOrderId,StrInvId:String;
    Revision,MinRowService,IntRowService,IntColService:Integer;
    WOConnection:TADOConnection;
    DbWO,DbHostWO,DbUserWO,DbPassWO,ProviderWO :String;
    procedure Init;
    procedure InitGrid;
    procedure InitGridService;
    procedure RefreshCombo;
    procedure LoadData;
    procedure RefreshGrid;
    procedure CalculateOrder;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure PreparePrint2;
//    procedure GenerateInvoice;

    procedure InitDB_WO;
    function OpenDb_WO:Boolean;
  public
    { Public declarations }
    procedure SetOrderId(Order_Id:String);
    procedure RePrint(Invoice_Id:String);
    procedure RePrint2(Invoice_Id:String);
    constructor Create(AOwner:TComponent;Invoice_Id:String='';Is_Input:Boolean=True);Overload;
  end;

var
  BusInvoice: TBusInvoice;

implementation

uses MainU, RePrintFormU, OrderListU, BusInvoiceListU, StrUtils,
  DateUtils, Math;

{$R *.dfm}

constructor TBusInvoice.Create(AOwner:TComponent;Invoice_Id:String='';Is_Input:Boolean=True);
begin
  CompId:=2;
  InvcId:=Invoice_Id;
  IsInputGrid:=Is_Input;
  IsInput:=Is_Input;
  inherited Create(AOwner);
end;

procedure TBusInvoice.Init;
begin
  DbWO      :='WHOnline';
  DbHostWO  :='192.168.8.102';
  DbUserWO  :='sa';
  DbPassWO  :='sadbserver18#';//'admin@sql2013#';
  ProviderWO:=Main.Provider;//'SQLNCLI11';

  IntRowGrid:=2;
  IntRowService:=1;
  StrInvId:='';
  OrderId.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  ContactId.Text:='';
  ContactDisp.Text:='';
  Address.Text:='';
  HeaderRemark.Text:='';
  DiscountPrice.Text:='0';
  DiscountPercent.Text:='0';
  Remark.Text:='';
  SubTotal.Text:='';
  Discount.Text:='';
  Total.Text:='';
  TotInvoice_PPH.Text:='';
  PphPercen.Text:='';
  PphDeduction.Text:='';
  Panel2.Enabled:=False;
  PanelCariOrder.Enabled:=True;
  Status.Checked:=False;
  DiscountPrice.Enabled:=True;
  DiscountPercent.Enabled:=True;
  if InvcId<>'' then Status.Visible:=True
  else Status.Visible:=False;
  FixedInvoice.Checked:=False;
  FormNumber:=2;
end;

procedure TBusInvoice.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=11;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=220;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=50;
  StrGrid.ColWidths[4]:=30;
  StrGrid.ColWidths[5]:=70;
  StrGrid.ColWidths[6]:=30;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=140;
  //col 9=product_price_id
  //col 10=total_addDays
  for IntCount:=9 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,3,0);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,6,0);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.RowHeights[0]:=22;
  StrGrid.RowHeights[1]:=22;
  StrGrid.Cells[0,0]:='Product';
  StrGrid.Cells[1,0]:='Acara Perjalanan';
  StrGrid.Cells[2,0]:='Tgl Penggunaan';
  StrGrid.Cells[4,0]:='Unit';
  StrGrid.Cells[5,0]:='Discount';
  StrGrid.Cells[7,0]:='Total Biaya';
  StrGrid.Cells[8,0]:='Keterangan';
  StrGrid.Cells[2,1]:='Dari';
  StrGrid.Cells[3,1]:='Sampai';
  StrGrid.Cells[5,1]:='Rp';
  StrGrid.Cells[6,1]:='%';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1  do begin
    StrGrid.Cells[IntCount,2]:='';
  end;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taRightJustify;
end;

procedure TBusInvoice.InitGridService;
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

procedure TBusInvoice.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('Invoice_Form_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      FormNumber:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

//procedure TBusInvoice.GenerateInvoice;
//var
//  Qry:TADOQuery;
//  StrQry:String;
//begin
//
//  StrQry:='UPDATE wh_transaction set total='+ToString(Total.Text)+','+
//          'discount='+ToString(Discount.Text)+' '+
//          'WHERE transaction_id='+QuotedStr(InvcId)+' AND status=1;';
//
//  Qry.SQL.Clear;
//  Main.WriteLog('SQL :'+StrQry,4);
//  Qry.SQL.Add(StrQry);
//  try
//    Qry.ExecSQL;
//  except
//    on E:Exception do begin
//      IsOk:=False;
//      StrMsg:=E.Message;
//    end;
//  end;
//
//  StrQry:='UPDATE wh_transaction_detail set status=1 '+
//          'WHERE transaction_id='+QuotedStr(InvcId)+' AND status=1;';
//
//  Qry.SQL.Clear;
//  Main.WriteLog('SQL :'+StrQry,4);
//  Qry.SQL.Add(StrQry);
//  try
//    Qry.ExecSQL;
//  except
//    on E:Exception do begin
//      IsOk:=False;
//      StrMsg:=E.Message;
//    end;
//  end;
//
//  StrQry:='INSERT INTO wh_transaction_detail (transaction_id,transaction_type_id,'+
//          'product_price_id,submit_date,submit_time,from_date,to_date,units,detail,'+
//          'amount,amount_addday,discount_price,discount_percent,deposit,remark,'+
//          'status,update_time,update_user) VALUES(SELECT '+QuotedStr(InvcId)+',160101,) ;'+;
//
//  Qry.SQL.Clear;
//  Main.WriteLog('SQL :'+StrQry,4);
//  Qry.SQL.Add(StrQry);
//  try
//    Qry.ExecSQL;
//  except
//    on E:Exception do begin
//      IsOk:=False;                        
//      StrMsg:=E.Message;
//    end;
//  end;
//
//  if IsOk then begin
//    Main.TransCommit;
//  end else begin
//    Main.TransRollback;
//    MessageBox(0,PChar('Tidak dapat membuka invoice'+Chr(13)+Chr(13)+StrMsg),'Invoice',MB_OK or MB_ICONERROR);
//  end;
//
//end;

procedure TBusInvoice.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionDetail '+QuotedStr(InvcId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      InvcId:=Qry.FieldValues['transaction_id'];
      InvoiceId.Text:=Qry.FieldValues['invoice_id'];
      OrderId.Text:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      InvoiceDate.Text:=Qry.FieldValues['dates'];
      CustomerDisp.Text:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      if Qry.FieldValues['cust_contract_id']<>NULL then ContractId.Text:=Qry.FieldValues['cust_contract_id'];
      SalesPerson.Text:=Qry.FieldValues['sales_name'];
      if Qry.FieldValues['PphDeduction']>0 then
      begin
        Panel2.Height:=145;
        PphPercen.Text:=IToCurr(Qry.FieldValues['PphPercentage'])+'%';
        PphDeduction.Text:=IToCurr(Qry.FieldValues['PphDeduction']);
        TotInvoice_PPH.Text:= IToCurr(Qry.FieldValues['total']-Qry.FieldValues['PphDeduction']+Qry.FieldValues['PpnAddition']);
      end else begin
        Panel2.Height:=94;
//        PPHLabel.Caption:='';
        PphPercen.Text:='';
        PphDeduction.Text:='';
        TotInvoice_PPH.Text:='';
      end;
      Total.Text:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['PpnAddition']);
      if Qry.FieldValues['PpnAddition']<> null then
      PpnAddition.Text:=IToCurr(Qry.FieldValues['PpnAddition']);
      if Qry.FieldValues['PpnPercentage']<> null then
      PPNPercen.Text:=IntToStr(Qry.FieldValues['PpnPercentage'])+'%';
//      PPNPercen.Text:='%';

      if Qry.FieldValues['discount_price']<>NULL then DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']) else DiscountPrice.Text:='0';
      if Qry.FieldValues['discount_percent']<>NULL then DiscountPercent.Text:=Qry.FieldValues['discount_percent'] else DiscountPercent.Text:='0';
      if Qry.FieldValues['discount_amount']>0 then Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']) else Discount.Text:='0';
      if (Qry.FieldValues['contract_discount_price']<>'0') OR (Qry.FieldValues['contract_discount_percent']<>'0') then PanelDiscount.Enabled:=False;
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];

      if Qry.FieldValues['fixed_invoice']<>NULL then begin
        FixedInvoice.Checked:=True;
        Panel2.Enabled:=True;
        SubTotal.SetFocus;
      end else Simpan.SetFocus;
      if Qry.FieldValues['ref_customer_order_id']<>NULL then RefCustomerOrderId:=Qry.FieldValues['ref_customer_order_id'];
      if Qry.FieldValues['join_inv']<>0 then MultiOrder.Checked:=True;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoice.RefreshGrid;
var Qry:TADOQuery;
    StrQry,StrOrderId:String;
    IntCount,IntCount2:Integer;
    StrList:TStringList;
    IsFinish:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  StrList:=TStringList.Create;
  if Main.OpenDb then begin
//    if MultiOrder.Checked=True then begin
      StrList:=SplitStrings(OrderId.Text,',');
//      IsFinish:=False;
//    end else begin
//      StrOrderId:=OrderId.Text;
//      IsFinish:=True;
//    end;
    IntCount2:=0;
    repeat
//      if MultiOrder.Checked then begin
      StrOrderId:=StrList.Strings[IntCount2];
//      end;
      StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(StrOrderId)+';';
//    StrQry:='EXEC GetTransactionDetailList '+QuotedStr(InvcId)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntRowGrid;
      if Qry.FieldValues['product_price_name']<> NULL then while not(Qry.Eof) do begin
        StrGrid.RowCount:=IntCount+1;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['product_price_name'];
        if Qry.FieldValues['route']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['from_dates'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['to_dates'];
        StrGrid.Cells[4,IntCount]:=Qry.FieldValues['units'];
        if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[5,IntCount]:=IToCurr(Qry.FieldValues['discount_price'])
        else StrGrid.Cells[5,IntCount]:='0';
        if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[6,IntCount]:=Qry.FieldValues['discount_percent']
        else StrGrid.Cells[6,IntCount]:='0';
        StrGrid.Cells[7,IntCount]:=IToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[8,IntCount]:=Qry.FieldValues['remark'];
        StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['product_price_id'];
        StrGrid.Cells[10,IntCount]:=Qry.FieldValues['total_addday'];
        Qry.Next;
        Inc(IntCount)
      end;
      IntRowGrid:=IntCount;
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(StrOrderId)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntRowService;
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
      IntRowService:=IntCount;
      Qry.Close;
      Inc(IntCount2);
    until (IntCount2>(StrList.Count-1));
    CalculateOrder;
  end;
  FreeAndNil(Qry);
  FreeAndNil(StrList);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoice.CalculateOrder;
var IntCount,IntTotal,IntTotalAll,IntPrice,IntDiscPrice,IntDiscPerc,IntMonths,IntDates,IntYears,IntUnit:Integer;
    IntDays,IntTotalService,Intservice,IntMultiply,IntTotalAddDays:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IsWeekday,IsWeekend:Boolean;
begin
  Main.M_Busy;
  IntTotalAll:=0;
  IntTotalAddDays:=0;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if StrGrid.Cells[0,IntCount]<>'' then begin
      IntTotalAll:=IntTotalAll+SToInt(StrGrid.Cells[7,IntCount]);
//      IntTotalAddDays:=IntTotalAddDays+SToInt(StrGrid.Cells[10,IntCount]);
    end;
  end;
  IntTotalService:=0;
  for IntCount:=MinRowService+1 to GridService.RowCount-1 do
    if (Trim(GridService.Cells[5,IntCount])<>'1') then
      if (Trim(GridService.Cells[1,IntCount])<>'') then begin
        IntTotalService:=IntTotalService+(SToInt(GridService.Cells[1,IntCount])*SToInt(GridService.Cells[2,IntCount]));
      end else if (Trim(GridService.Cells[2,IntCount])<>'') then begin
        IntTotalService:=IntTotalService+SToInt(GridService.Cells[2,IntCount]);
      end;
  SubTotal.Text:=IToCurr(IntTotalAll);
  if (Discount.Text='0') or (Discount.Text='') then begin
    IntDiscPrice:=SToInt(DiscountPrice.Text);
    IntDiscPerc:=SToInt(DiscountPercent.Text);
    Discount.Text:=IToCurr(IntDiscPrice+(IntTotalAll*(IntDiscPerc/100)));
  end;
  Main.M_Normal;
end;

procedure TBusInvoice.SetOrderId(Order_Id:String);
var Qry:TADOQuery;
    StrQry,StrContactId:String;
    IntCount:Integer;
    IsContactSingle,IsInsertDetails,IsOk:Boolean;
    StrList:TStringList;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  IsOk:=True;
  StrList:=TStringList.Create;
  StrList:=SplitStrings(OrderId.Text,',');
  for IntCount:=0 to StrList.Count-1 do
    if StrList.Strings[IntCount]=Order_Id then IsOk:=False;
  FreeAndNil(StrList);
  if (Main.OpenDb) and (IsOk) then begin
    StrQry:='EXEC GetCustomerOrderDetail '+QuotedStr(Order_Id)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    IsInsertDetails:=True;
    if (MultiOrder.Checked=True) then begin
      if (OrderId.Text<>'') then IsInsertDetails:=False;
      if (Qry.FieldValues['invoice_id']<>NULL) then begin
        if (Qry.FieldValues['join_inv']=0) then IsOk:=False;
        if (StrInvId<>'') then
          if (Qry.FieldValues['invoice_id']<>StrInvId) then IsOk:=False;
        if not(IsOk) then MessageBox(0,PChar('Pesanan sudah ada nomor Invoice'+Chr(13)+'Tidak dapat digabungkan lagi'),'Invoice',MB_OK or MB_ICONWARNING);
      end;
    end;
    if (Qry.RecordCount>0) and (IsOk) then begin
      if not(IsInsertDetails) then begin
        OrderId.Text:=OrderId.Text+','+Qry.FieldValues['customer_order_id'];
        Total.Text:=IToCurr(SToInt(Total.Text)+Qry.FieldValues['total']);
        Discount.Text:=IToCurr(SToInt(Discount.Text)+Qry.FieldValues['discount_amount']);
      end else begin
        if Qry.FieldValues['invoice_id']<>NULL then StrInvId:=Qry.FieldValues['invoice_id'];
        OrderId.Text:=Qry.FieldValues['customer_order_id'];
        CustomerId.Text:=Qry.FieldValues['customer_id'];
//      InvoiceDate.Text:=Qry.FieldValues['dates'];
        CustomerDisp.Text:=Qry.FieldValues['customer_name'];
        if Qry.FieldValues['customer_address']<>NULL then Address.Text:=Qry.FieldValues['customer_address'];
        if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
        if Qry.FieldValues['contact_person_id']<>NULL then begin
          ContactId.Text:=Qry.FieldValues['contact_person_id'];
          if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
        end;
        if Qry.FieldValues['cust_contract_id']<>NULL then ContractId.Text:=Qry.FieldValues['cust_contract_id'];
        SalesPerson.Text:=Qry.FieldValues['sales_name'];
        if Qry.FieldValues['discount_price']<>NULL then DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']);
        if Qry.FieldValues['discount_percent']<>NULL then DiscountPercent.Text:=Qry.FieldValues['discount_percent'];
        if (Qry.FieldValues['contract_discount_price']<>'0') OR (Qry.FieldValues['contract_discount_percent']<>'0') then PanelDiscount.Enabled:=False;
        if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
        if Qry.FieldValues['fixed_invoice']<>NULL then begin
          FixedInvoice.Checked:=True;
          Panel2.Enabled:=True;
          SubTotal.SetFocus;
        end else Simpan.SetFocus;
        Total.Text:=IToCurr(Qry.FieldValues['total']);
        Discount.Text:=IToCurr(Qry.FieldValues['discount_amount']);
        if Qry.FieldValues['ref_customer_order_id']<>NULL then RefCustomerOrderId:=Qry.FieldValues['ref_customer_order_id'];
      end;
    end;
    Qry.Close;
    if IsOk then begin
      StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntRowGrid;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['product_price_name']<> NULL then begin
          StrGrid.RowCount:=IntCount+1;
          StrGrid.Cells[0,IntCount]:=Qry.FieldValues['product_price_name'];
          if Qry.FieldValues['route']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['route'];
          StrGrid.Cells[2,IntCount]:=Qry.FieldValues['from_dates'];
          StrGrid.Cells[3,IntCount]:=Qry.FieldValues['to_dates'];
          StrGrid.Cells[4,IntCount]:=Qry.FieldValues['units'];
          if Qry.FieldValues['discount_price']<>NULL then StrGrid.Cells[5,IntCount]:=IToCurr(Qry.FieldValues['discount_price'])
          else StrGrid.Cells[5,IntCount]:='0';
          if Qry.FieldValues['discount_percent']<>NULL then StrGrid.Cells[6,IntCount]:=Qry.FieldValues['discount_percent']
          else StrGrid.Cells[6,IntCount]:='0';
          StrGrid.Cells[7,IntCount]:=IToCurr(Qry.FieldValues['total']);
          if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[8,IntCount]:=Qry.FieldValues['remark'];
          StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[9,IntCount]:=Qry.FieldValues['product_price_id'];
          StrGrid.Cells[10,IntCount]:=Qry.FieldValues['total_addday'];
        end;
        Qry.Next;
        Inc(IntCount);
      end;
      IntRowGrid:=IntCount;
      Qry.Close;
      StrQry:='EXEC GetCustomerOrderServiceList '+QuotedStr(Order_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=IntRowService;
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
      IntRowService:=IntCount;
      Qry.Close;
      CalculateOrder;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoice.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TBusInvoice.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrOrderId,StrCustomerId,StrContactId,StrDiscountPrice,StrDiscountPercent,StrRemark:String;
    StrProductPriceId,StrDateStart,StrDateFinish,StrContractId,StrMonth,StrYear,StrYearL,StrTransDate:String;
    StrTotal,StrStatus,StrUnits,StrRevision,StrQuantity,StrAmount,StrInvoiceId,StrDetail,StrDiscount,StrAmountAddDay:String;
    StrTransId,StrEMsg,StrCompanyId,StrLocationId:String;
    IntCount,DiscPercent,DiscPrice,InvoiceSelect,IntRev:Integer;
    IsOk,IsAuth:Boolean;
    StrList:TStringList;
begin
  if (CustomerId.Text<>'') and (OrderId.Text<>'') and ((Total.Text<>'') and (Total.Text<>'0')) then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 7200;
      Main.M_Busy;
      if Main.OpenDb then begin
        StrRevision:='';
        DisableInput;
        Main.TransStart;
        IsOk:=True;
        StrCompanyId:=CompanyId;
        StrLocationId:=LocationId;
        StrList:=TStringList.Create;
        if MultiOrder.Checked then begin
          StrList:=SplitStrings(OrderId.Text,',');
          StrOrderId:=QuotedStr(StrList.Strings[0]);
        end else StrOrderId:=QuotedStr(OrderId.Text);
        StrCustomerId:=QuotedStr(CustomerId.Text);
        StrContractId:=QuotedStr(ContractId.Text);
        if ContactId.Text<>'' then StrContactId:=QuotedStr(ContactId.Text) else StrContactId:='NULL';
        if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
        if FixedInvoice.Checked=True then begin
          if SToInt(Discount.Text)>0 then StrDiscountPrice:=ToString(Discount.Text)
          else if DiscountPrice.Text<>'' then StrDiscountPrice:=ToString(DiscountPrice.Text) else StrDiscountPrice:='NULL';
        end else begin
          if DiscountPrice.Text<>'' then StrDiscountPrice:=ToString(DiscountPrice.Text) else StrDiscountPrice:='NULL';
        end;
        if DiscountPercent.Text<>'' then StrDiscountPercent:=DiscountPercent.Text else StrDiscountPercent:='NULL';
        StrDiscount:=ToString(Discount.Text);
        if Status.Visible then if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';
        StrRevision:=IntToStr(Revision);
        StrTotal:=ToString(Total.Text);
        if RefCustomerOrderId='' then StrQry:='EXEC GetFirstDayRun '+StrOrderId+';'
        else StrQry:='EXEC GetFirstDayRun '+RefCustomerOrderId+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          StrMonth:=Qry.FieldValues['months'];
          StrYear:=Qry.FieldValues['years'];
          StrYearL:=Qry.FieldValues['yearsl'];
        end else IsOk:=False;
        IntRev:=0;
        if (InvoiceId.Text<>'')  then begin
          StrTransId:=InvcId;
          StrInvoiceId:=InvoiceId.Text;
          if StrStatus='1' then begin
            StrQry:='SELECT invoice_id,inv_rev,CONVERT(VARCHAR(10),invoice_date,111) AS invoice_date FROM wh_customer_order WHERE customer_order_id='+StrOrderId+';';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if (Qry.FieldValues['invoice_id']<>NULL) then begin
              StrInvoiceId:=Qry.FieldValues['invoice_id'];
              if Qry.FieldValues['inv_rev']<>NULL then IntRev:=Qry.FieldValues['inv_rev']+1;
              if Qry.FieldValues['invoice_date']<>NULL then
                StrTransDate:=QuotedStr(Qry.FieldValues['invoice_date'])
              else if StrToInt(FormatDateTime('yymm',Now))<StrToInt(StrYear+StrMonth) then
                StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate('01'+'/'+StrMonth+'/'+StrYearL)))
              else if StrToInt(FormatDateTime('yymm',Now))>StrToInt(StrYear+StrMonth) then
                StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',EndOfAMonth(StrToInt(StrYearL),StrToInt(StrMonth))))
              else StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',Now));
              Qry.Close;
            end;
            StrQry:='UPDATE wh_transaction SET total='+StrTotal+',discount='+StrDiscount+',status='+StrStatus+',rev='+StrRevision+',remark='+StrRemark+
                  ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE transaction_id='+QuotedStr(StrTransId)+';';
            StrQry:=StrQry+' UPDATE wh_transaction_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (transaction_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end else begin
            StrQry:=StrQry+' UPDATE wh_transaction SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (transaction_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end;
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=StrEMsg+E.Message;
            end;
          end;
        end else begin
          StrQry:='SELECT RIGHT(MAX(transaction_id),4) AS max_id FROM wh_transaction '+
                  'WHERE transaction_id  LIKE '+QuotedStr('PTRANS/'+
                  FormatDateTime('yymm',Now) +'/INV/'+'____')+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrTransId:=Qry.FieldValues['max_id'];
            StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          end else
            StrTransId:='0001';
          Qry.Close;
          StrTransId:='PTRANS/'+FormatDateTime('yymm',Now)+'/INV/'+StrTransId;
          StrQry:='SELECT invoice_id,inv_rev,CONVERT(VARCHAR(10),invoice_date,111) AS invoice_date FROM wh_customer_order WHERE customer_order_id='+StrOrderId+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if (Qry.FieldValues['invoice_id']<>NULL) then begin
            StrInvoiceId:=Qry.FieldValues['invoice_id'];
            if Qry.FieldValues['inv_rev']<>NULL then IntRev:=Qry.FieldValues['inv_rev']+1;
            if Qry.FieldValues['invoice_date']<>NULL then
                StrTransDate:=QuotedStr(Qry.FieldValues['invoice_date'])
            else
              if StrToInt(FormatDateTime('yymm',Now))<StrToInt(StrYear+StrMonth) then
                StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate('01'+'/'+StrMonth+'/'+StrYearL)))
              else if StrToInt(FormatDateTime('yymm',Now))>StrToInt(StrYear+StrMonth) then
                StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',EndOfAMonth(StrToInt(StrYearL),StrToInt(StrMonth))))
              else StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',Now));
            Qry.Close;
          end else begin
            Qry.Close;
            if StrToInt(FormatDateTime('yymm',Now))=StrToInt(StrYear+StrMonth) then begin
              StrQry:='SELECT RIGHT(MAX(invoice_id),4) AS max_id FROM wh_transaction '+
                      'WHERE invoice_id  LIKE '+QuotedStr('INV'+LocationCode+'/'+FormatDateTime('yymm',Now)+'/____')+';';
            end else begin
              StrQry:='SELECT RIGHT(MAX(invoice_id),4) AS max_id FROM wh_transaction '+
                      'WHERE invoice_id  LIKE '+QuotedStr('INV'+LocationCode+'/'+StrYear+StrMonth+'/____')+';';
            end;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['max_id']<>NULL then begin
              StrInvoiceId:=Qry.FieldValues['max_id'];
              StrInvoiceId:=Format('%.*d',[4,StrToInt(StrInvoiceId)+1]);
            end else
              StrInvoiceId:='0001';
            IntRev:=0;
            if StrToInt(FormatDateTime('yymm',Now))<StrToInt(StrYear+StrMonth) then begin
              StrInvoiceId:='INV'+LocationCode+'/'+StrYear+StrMonth+'/'+StrInvoiceId;
              StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate('01'+'/'+StrMonth+'/'+StrYearL)));
            end else if StrToInt(FormatDateTime('yymm',Now))>StrToInt(StrYear+StrMonth) then begin
              StrInvoiceId:='INV'+LocationCode+'/'+StrYear+StrMonth+'/'+StrInvoiceId;
              StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',EndOfAMonth(StrToInt(StrYearL),StrToInt(StrMonth))));
            end else begin
              StrInvoiceId:='INV'+LocationCode+'/'+FormatDateTime('yymm',Now)+'/'+StrInvoiceId;
              StrTransDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',Now));
            end;
          end;
        end;
        if StrStatus='1' then begin
          StrQry:='INSERT INTO wh_transaction (transaction_id,invoice_id,company_id,location_id,submit_date,customer_id,form_id'+
                  ',cust_contract_id,total,discount,remark,update_user)'+
                  ' VALUES '+
                  '('+QuotedStr(StrTransId)+','+QuotedStr(StrInvoiceId)+','+StrCompanyId+','+StrLocationId+
                  ','+StrTransDate+','+StrCustomerId+
                  ','+StrOrderId+','+StrContractId+','+StrTotal+','+StrDiscount+','+StrRemark+','+QuotedStr(User)+');';
          if MultiOrder.Checked then begin
            for IntCount:=0 to StrList.Count-1 do
              StrQry:=StrQry+'UPDATE wh_customer_order SET join_inv=1,invoice_id='+QuotedStr(StrInvoiceId)+
                      ',inv_rev='+IntToStr(IntRev)+',invoice_date='+StrTransDate+' WHERE customer_order_id='+QuotedStr(StrList.Strings[IntCount])+';';
          end else begin
            StrQry:=StrQry+'UPDATE wh_customer_order SET invoice_id='+QuotedStr(StrInvoiceId)+
                  ',inv_rev='+IntToStr(IntRev)+',invoice_date='+StrTransDate+' WHERE customer_order_id='+StrOrderId+';';
          end;
          if FixedInvoice.Checked then begin
            StrQry:=StrQry+'UPDATE wh_customer_order SET discount_price='+StrDiscountPrice+',total='+StrTotal+
                    ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE customer_order_id='+StrOrderId+';';
          end;
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=StrEMsg+E.Message;
            end;
          end;
          if MultiOrder.Checked then begin
            StrQry:='';
            for IntCount:=0 to StrList.Count-1 do begin
              StrQry:=StrQry+'INSERT INTO wh_transaction_detail_detail (transaction_id,form_id,update_user) VALUES '+
                      '('+QuotedStr(StrTransId)+','+QuotedStr(StrList.Strings[IntCount])+','+QuotedStr(User)+');';
            end;
            if StrQry<>'' then begin
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=StrEMsg+E.Message;
                end;
              end;
            end;
          end;
        end;
        StrQry:='';
        if StrStatus='1' then begin
          for IntCount:=2 to StrGrid.RowCount-1 do
            if (StrGrid.Cells[0,IntCount]<>'') and (StrGrid.Cells[2,IntCount]<>'') and (StrGrid.Cells[3,IntCount]<>'')
            and (StrGrid.Cells[4,IntCount]<>'') and (StrGrid.Cells[7,IntCount]<>'') then begin
              StrDetail:=QuotedStr(StrGrid.Cells[1,IntCount]);
              StrProductPriceId:=QuotedStr(StrGrid.Cells[9,IntCount]);
              StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[2,IntCount])));
              StrDateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(StrGrid.Cells[3,IntCount])));
              StrUnits:=StrGrid.Cells[4,IntCount];
              if Trim(StrGrid.Cells[5,IntCount])<>'' then StrDiscountPrice:=QuotedStr(ToString(StrGrid.Cells[5,IntCount])) else StrDiscountPrice:='0';
              if Trim(StrGrid.Cells[6,IntCount])<>'' then StrDiscountPercent:=QuotedStr(StrGrid.Cells[6,IntCount]) else StrDiscountPercent:='0';
              if Trim(StrGrid.Cells[8,IntCount])<>'' then StrRemark:=QuotedStr(StrGrid.Cells[8,IntCount]) else StrRemark:='NULL';
              StrTotal:=QuotedStr(ToString(StrGrid.Cells[7,IntCount]));
              StrAmountAddDay:=StrGrid.Cells[10,IntCount];
              StrQry:='INSERT INTO wh_transaction_detail (transaction_id,transaction_type_id'+
                             ',product_price_id,from_date,to_date,units,detail,amount,amount_addday,discount_price,discount_percent'+
                             ',remark,update_user) VALUES '+
                             '('+QuotedStr(StrTransId)+',160101,'+StrProductPriceId+','+StrDateStart+','+StrDateFinish+
                             ','+StrUnits+','+StrDetail+','+StrTotal+','+StrAmountAddDay+','+StrDiscountPrice+
                             ','+StrDiscountPercent+','+StrRemark+','+QuotedStr(User)+');';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=StrEMsg+E.Message;
                end;
              end;
          end;
          if RefCustomerOrderId<>'' then begin
            StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',Now));
            StrDateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',Now));
            StrTotal:=ToString(Total.Text);
            StrQry:='INSERT INTO wh_transaction_detail (transaction_id,transaction_type_id'+
                    ',product_price_id,from_date,to_date,units,detail,amount,amount_addday,discount_price,discount_percent'+
                    ',remark,update_user) VALUES '+
                    '('+QuotedStr(StrTransId)+',160103,NULL,'+StrDateStart+','+StrDateFinish+
                    ',NULL,NULL,'+StrTotal+',0,0,0,NULL,'+QuotedStr(User)+');';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrEMsg:=StrEMsg+E.Message;
              end;
            end;
          end;
        end;
        if (IsOk) then begin
          Main.TransCommit;
          InvcId:=StrTransId;
          if StrStatus='1' then begin
            InvoiceId.Text:=StrInvoiceId;
            MessageBox(0,PChar('Invoice Berhasil Disimpan'),'Invoice',MB_OK or MB_ICONINFORMATION);
          end else begin
              MessageBox(0,'Invoice Berhasil Dibatalkan','Invoice',MB_OK or MB_ICONINFORMATION);
              CetakUlang.Enabled:=False;
          end;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Invoice Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Invoice',MB_OK or MB_ICONERROR);
          EnableInput;
        end;
      end;
      FreeAndNil(StrList);
      FreeAndNil(Qry)
  end else
    MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Invoice',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoice.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  if InvcId<>'' then begin
    LoadData;
    RefreshGrid;
    if not(IsInput) then DisableInput;
    Simpan.Caption:='Simpan';
    Bersihkan.Enabled:=False;
  end else begin
    InvoiceDate.Text:=Main.Status.Panels.Items[0].Text;
    SalesPerson.Text:=FullName;
    Simpan.Caption:='Buat Invoice'; 
  end;
end;

procedure TBusInvoice.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupDetail.Enabled:=False;
  GroupBatal.Enabled:=False;
  Remark.Enabled:=False;
//  GroupOrder.Enabled:=False;
end;

procedure TBusInvoice.EnableInput;
begin
  Simpan.Enabled:=True;
  CetakUlang.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupDetail.Enabled:=True;
  GroupBatal.Enabled:=True;
  Remark.Enabled:=True;
//  GroupOrder.Enabled:=True;
end;


procedure TBusInvoice.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridService;
  RefreshCombo;
  EnableInput;
  InvoiceDate.Text:=Main.Status.Panels.Items[0].Text;
  SalesPerson.Text:=FullName;
end;

procedure TBusInvoice.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLocationHead '+LocationId+','+CompanyId+',14;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppSignature.Caption:=Qry.FieldValues['name'];
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoice.RePrint(Invoice_Id:String);
var StrQry,StrNumerator:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntTotalDiscount:Integer;
    IsOK:Boolean;
begin
  PreparePrint;
  RePrintForm.ReportName:='Invoice Form';
  RePrintForm.ReportId:=Invoice_Id;
  IsOk:=True;
  repeat
    StrNumerator:=InputBox('Pencetakan','Masukkan Numerator Invoice','')
  until (Length(Trim(StrNumerator))>5) or (Length(Trim(StrNumerator))=0) ;
  if Length(Trim(StrNumerator))=0 then IsOk:=False; 
  RePrintForm.StrNumerator:=StrNumerator;
  if IsOk then if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='EXEC GetTransactionDetail  '+QuotedStr(Invoice_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      ppCustomer.Lines.Clear;
      ppService.Caption:='';
      if Qry.RecordCount>0 then begin
        if RePrintForm.Copy>0 then ppReprinted.Caption:='C-'+IntToStr(RePrintForm.Copy) else ppReprinted.Caption:='C-Asli';
        if Qry.FieldValues['inv_rev']>0 then begin
          if Qry.FieldValues['inv_rev']>1 then ppInvoiceId.Caption:=Qry.FieldValues['invoice_id']+'R'+IntToStr(Qry.FieldValues['inv_rev'])
          else ppInvoiceId.Caption:=Qry.FieldValues['invoice_id']+'R';
        end else ppInvoiceId.Caption:=Qry.FieldValues['invoice_id'];
        if Qry.FieldValues['customer_name']<>NULL then begin
          ppCustomerName.Caption:=Qry.FieldValues['customer_name'];
          if Qry.FieldValues['customer_address']<>NULL then ppCustomer.Lines.Add(Qry.FieldValues['customer_address']);
        end;
        if Qry.FieldValues['contact_person']<>NULL then begin
          ppCustomer.Lines.Add('Attn. '+Qry.FieldValues['contact_person']);
        end;
        if (Qry.FieldValues['contact_cellular']<>NULL) and (Trim(Qry.FieldValues['contact_cellular'])<>'') then ppCustomer.Lines.Add('Hp. '+Qry.FieldValues['contact_cellular']);
        if (Qry.FieldValues['phone_no']<>NULL)  and (Trim(Qry.FieldValues['phone_no'])<>'') then ppCustomer.Lines.Add('Telp. '+Qry.FieldValues['phone_no']);
        if (Qry.FieldValues['fax_no']<>NULL)  and (Trim(Qry.FieldValues['fax_no'])<>'') then ppCustomer.Lines.Add('Fax. '+Qry.FieldValues['fax_no']);
        IntTotal:=Qry.FieldValues['total_gross'];
        if (Qry.FieldValues['discount_price']>0) or (Qry.FieldValues['discount_percent']>0) then begin
          ppLabelDiscount.Caption:='Discount ';
          if (Qry.FieldValues['discount_price']>0) then IntDiscountPrice:=Qry.FieldValues['discount_price'];
          if (Qry.FieldValues['discount_percent']>0) then begin
            ppLabelDiscount.Caption:=ppLabelDiscount.Caption+'  '+IntToStr(Qry.FieldValues['discount_percent'])+'% ';
            IntDiscountPercent:=Qry.FieldValues['discount_percent'];
          end;
          IntTotalDiscount:=IntDiscountPrice+Round(IntTotal*(IntDiscountPercent/100));
          ppDiscount.Caption:=''+IToCurr(IntTotalDiscount);
        end;
        ppDates.Caption:=Qry.FieldValues['invoice_dates'];
        ppOrderId.Caption:=Qry.FieldValues['customer_order_id'];
        ppTotal.Caption:='Rp. '+IToCurr(Qry.FieldValues['total']);

        //        finance
        if GroupId ='26' then
        begin
          ppHeaderBand1.Height:= ppHeaderBand1.Height+0.16;
          ppInvoiceId.Top:= ppInvoiceId.Top+0.1;
          ppOrderId.Top:= ppOrderId.Top+0.1;
          ppSales.Top:= ppSales.Top+0.1;
          ppDueDate.Top:= ppDueDate.Top+0.1;
          ppCustomer.Top:= ppCustomer.Top+0.1;
          ppCustomerName.Top:= ppCustomerName.Top+0.1;
          ppGroupName.Top:= ppGroupName.Top+0.1;
          ppReprinted.Top:= ppReprinted.Top+0.1;
          ppNPWP.Top:= ppNPWP.Top+0.1;
          ppDates.Top:= ppDates.Top+0.1;
          ppPageNo.Top:= ppPageNo.Top+0.1;
          ppSysPageNo.Top:= ppSysPageNo.Top+0.1;
          ppPageCount.Top:= ppPageCount.Top+0.1;
          ppSysPageCount.Top:= ppSysPageCount.Top+0.1;
          ppLabel3.Top:= ppLabel3.Top+0.1;
          ppAmountSaid.Top:= ppAmountSaid.Top+0.08;
          ppSignature.Top:= ppSignature.Top+0.34;
          ppRemark.Top:= ppRemark.Top+0.34;
          ppTotal.Top:= ppTotal.Top+0.02;
          ppFooterBand1.Height:= ppFooterBand1.Height+0.30;
        end
        else
        begin
          ppFooterBand1.Height:= ppFooterBand1.Height+0.34;
          ppSignature.Top:= ppSignature.Top+0.32;
          ppRemark.Top:= ppRemark.Top+0.32;
          ppAmountSaid.Top:= ppAmountSaid.Top+0.03;
        end;

        ppAmountSaid.Caption:=AmountSaid(Qry.FieldValues['total']);
        if Qry.FieldValues['remark']<>NULL then ppRemark.Caption:=Qry.FieldValues['remark'];
        if (Qry.FieldValues['service_resume']<>'') AND (Qry.FieldValues['service_resume']<>NULL) then begin
          ppService.Caption:=LeftStr(Qry.FieldValues['service_resume'],Length(Qry.FieldValues['service_resume'])-1);
          if Qry.FieldValues['service_price']>0 then ppServiceTotal.Caption:=''+Qry.FieldValues['service_price']
          else ppServiceTotal.Caption:='';
        end;
        if (Qry.FieldValues['total_addday']>0) then begin
          if ppService.Caption<>'' then begin
            ppService.Caption:=ppService.Caption+', Additional Day (Rp.'+IToCurr(Qry.FieldValues['total_addday'])+')';
            if ppServiceTotal.Caption='' then ppServiceTotal.Caption:=IToCurr(Qry.FieldValues['total_addday'])
            else ppServiceTotal.Caption:=IToCurr(SToInt(ppServiceTotal.Caption)+Qry.FieldValues['total_addday']);
          end else begin
            ppService.Caption:='Additional Day (Rp.'+IToCurr(Qry.FieldValues['total_addday'])+')';
            ppServiceTotal.Caption:=IToCurr(Qry.FieldValues['total_addday']);
          end;
        end;
        ppSales.Caption:=Qry.FieldValues['initial_name'];
        if Qry.FieldValues['group_name']<>NULL then ppGroupName.Caption:=Qry.FieldValues['group_name'];
        if NPWP.Checked then ppNPWP.Visible:=True else ppNPWP.Visible:=False;
        if Qry.FieldValues['due_days']<>NULL then
          ppDueDate.Caption:=FormatDateTime('dd/mm/yyyy',IncDay(StrToDate(Qry.FieldValues['invoice_dates']),Qry.FieldValues['due_days']));
      end;
      Qry.Close;
      StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      if Qry.RecordCount>4 then ppReport.Footer.PrintOnFirstPage:=False
      else ppReport.Footer.PrintOnFirstPage:=True;
      Main.M_Normal;
      ppReport.PreviewFormSettings.WindowState:=wsMaximized;
      ppReport.Print;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TBusInvoice.PreparePrint2;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetLocationHead '+LocationId+','+CompanyId+',14;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if FormNumber=1 then pp2Signature.Caption:=Qry.FieldValues['name'];
      if FormNumber=2 then ppSignature.Caption:=Qry.FieldValues['name'];
      if FormNumber=3 then ppSignature3.Caption:=Qry.FieldValues['name'];
    end;
    Qry.Close;
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if (FormNumber=3) then begin
        ppAddress3.Lines.Clear;
        ppCompany3.Caption:=Qry.FieldValues['company_name'];
        ppAddress3.Lines.Add(Qry.FieldValues['address']);
//        ppPhone3.Caption:='Telp.'+Qry.FieldValues['phone_no'];
//        ppFax3.Caption:='Fax.'+Qry.FieldValues['fax_no'];
        case Qry.FieldValues['logo'] of
          1:ppLogo3.Picture:=Main.LogoWH.Picture;
          2:ppLogo3.Picture:=Main.LogoWHDC.Picture;
          3:ppLogo3.Picture:=Main.LogoWHET.Picture;
          4:ppLogo3.Picture:=Main.LogoDT.Picture;
          5:ppLogo3.Picture:=Main.LogoEUR.Picture;
          6:ppLogo3.Picture:=Main.LogoGL.Picture;
          7:ppLogo3.Picture:=Main.LogoCNR.Picture;
          8:ppLogo3.Picture:=Main.logoDTN.Picture;
        end;
      end;
    end;
    Qry.Close;
    ppMemoFooter3.Lines.Clear;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TBusInvoice.RePrint2(Invoice_Id:String);
var StrQry,StrNumerator:String;
    Qry,Query:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
    IsLanguage,IsToFile,IntTotal,IntDiscountPrice,IntDiscountPercent,IntTotalDiscount,IntRowNum,IntRowLimit,IntRowCount:Integer;
    StrCopy,StrInvoiceId,StrCustomerName,StrCustomerAddress,StrContactPerson,StrCellularNo,StrPhoneNo,StrFaxNo,StrDates,StrOrderId,StrRemark:String;
    StrService,StrServiceTotal,StrDiscountLabel,StrDiscount,StrDiscountPercent,StrSubTotal,StrTotal,StrAmountSaid,StrSales,StrGroupName,StrDueDate,StrNPWP:String;
    StrCustomerName_WO, StrCustomerAddress_WO, StrGroupName_WO : string;
begin
  InitDB_WO;

  PreparePrint2;
  RePrintForm.ReportName:='Invoice Form';
  RePrintForm.ReportId:=Invoice_Id;
  repeat
    StrNumerator:=InputBox('Pencetakan','Masukkan Numerator Invoice','')
  until StrNumerator<>'';
  RePrintForm.StrNumerator:=StrNumerator;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 7200;

    Query:=TADOQuery.Create(Self);
    Query.Connection := Main.MyConnectionWehaOnline;
    Query.CommandTimeout := 7200;

    if OpenDb_WO and Main.OpenDb then begin

      StrQry:='EXEC GetTransactionDetail  '+QuotedStr(Invoice_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if RePrintForm.Copy>0 then StrCopy:='C-'+IntToStr(RePrintForm.Copy) else StrCopy:='C-Asli';

        StrOrderId:=Qry.FieldValues['customer_order_id'];

        {get data from wehaonline}
        StrQry:='SELECT OrderNo,BillTo, BillAddress, BillPhone, [Group] as grp FROM Orders WHERE '+
                'BillTo is NOT NULL and status in ('+QuotedStr('ordered')+', '+QuotedStr('booked')+', '+QuotedStr('userpaid')+', '+QuotedStr('paid')+', '+QuotedStr('completed')+') '+
                'AND OrderNo='+QuotedStr(StrOrderId);
        Query.SQL.Clear;
        Query.SQL.Add(StrQry);
        Query.Open;
        if Query.RecordCount>0 then begin
          StrCustomerName_WO    := VarToStr(Query.FieldValues['BillTo']);
          StrCustomerAddress_WO := VarToStr(Query.FieldValues['BillAddress'])+#13#10+VarToStr(Query.FieldValues['BillPhone']);
        end;
        Query.Close;
        StrQry:='SELECT [Group] as grp FROM Orders WHERE '+
                'status in ('+QuotedStr('ordered')+', '+QuotedStr('booked')+', '+QuotedStr('userpaid')+', '+QuotedStr('paid')+', '+QuotedStr('completed')+') '+
                'AND OrderNo='+QuotedStr(StrOrderId);
        Query.SQL.Clear;
        Query.SQL.Add(StrQry);
        Query.Open;
        if Query.RecordCount>0 then begin
          StrGroupName_WO       := VarToStr(Query.FieldValues['grp']);
        end;

        {end get data from wehaonline}

        if Qry.FieldValues['inv_rev']>0 then begin
          if Qry.FieldValues['inv_rev']>1 then StrInvoiceId:=Qry.FieldValues['invoice_id']+'R'+IntToStr(Qry.FieldValues['inv_rev'])
          else StrInvoiceId:=Qry.FieldValues['invoice_id']+'R';
        end else StrInvoiceId:=Qry.FieldValues['invoice_id'];
        if Qry.FieldValues['customer_name']<>NULL then begin
          if (trim(StrCustomerName_WO)='') then begin
            StrCustomerName:=Qry.FieldValues['customer_name'];
            if Qry.FieldValues['customer_address']<>NULL then StrCustomerAddress:=Qry.FieldValues['customer_address'];

            if Qry.FieldValues['group_name']<>NULL then StrGroupName:=Qry.FieldValues['group_name'];
          end else begin
            StrCustomerName:=StrCustomerName_WO;
            StrCustomerAddress:=StrCustomerAddress_WO;
            StrGroupName:=StrGroupName_WO;
          end;

          if (trim(StrGroupName_WO)='') then begin
            if Qry.FieldValues['group_name']<>NULL then StrGroupName:=Qry.FieldValues['group_name'];
          end else begin
            StrGroupName:=StrGroupName_WO;
          end;

        end;

        if (Qry.FieldValues['PphDeduction']> '0') then
        begin
          ppPph.Caption:= 'PPH 23 ' +'('+IToCurr(Qry.FieldValues['PphPercentage'])+'%)';
          ppPphDeduction.Caption:=  IToCurr(Qry.FieldValues['PphDeduction']);

        end else begin
          ppPph.Caption:='';
          ppPphDeduction.Caption:='';
        end;

        if (Qry.FieldValues['PpnAddition']> '0')  then
        begin
          ppPPNAddition.Caption:= IToCurr(Qry.FieldValues['PpnAddition']);
          ppPPNLabel.Caption:=  'PPN ('+ IToCurr(Qry.FieldValues['PpnPercentage'])+' %)';
          ppPPNAddition.Visible:=True;
          ppPPNLabel.Visible:=True;
        end else begin
          ppPPNAddition.Caption:='';
          ppPPNLabel.Caption:='';
          ppPPNAddition.Visible:=False;
          ppPPNLabel.Visible:=False;
        end;


        if Qry.FieldValues['no_npwp']<>NULL then begin
          StrNPWP:='NPWP '+Qry.FieldValues['no_npwp'];
        end else StrNPWP:= 'NPWP ';
        pp2NPWP.Caption := StrNPWP;
        ppNPWP.Caption := StrNPWP;
        ppNPWP3.Caption := StrNPWP;
        if Qry.FieldValues['contact_person']<>NULL then begin
          StrContactPerson:='Attn. '+Qry.FieldValues['contact_person'];
        end;
        if (Qry.FieldValues['contact_cellular']<>NULL) and (Trim(Qry.FieldValues['contact_cellular'])<>'') then StrCellularNo:='Hp. '+Qry.FieldValues['contact_cellular'];
        if (Qry.FieldValues['phone_no']<>NULL)  and (Trim(Qry.FieldValues['phone_no'])<>'') then StrPhoneNo:='Telp. '+Qry.FieldValues['phone_no'];
        if (Qry.FieldValues['fax_no']<>NULL)  and (Trim(Qry.FieldValues['fax_no'])<>'') then StrFaxNo:='Fax. '+Qry.FieldValues['fax_no'];
        IntTotal:=Qry.FieldValues['total_gross'];
        IntTotalDiscount:=0;
        if (Qry.FieldValues['discount_price']>0) or (Qry.FieldValues['discount_percent']>0) then begin
          StrDiscountLabel:='Discount ';
          if (Qry.FieldValues['discount_price']>0) then IntDiscountPrice:=Qry.FieldValues['discount_price'];
          if (Qry.FieldValues['discount_percent']>0) then begin
            StrDiscountLabel:=StrDiscountLabel+'  '+IntToStr(Qry.FieldValues['discount_percent'])+'% ';
            IntDiscountPercent:=Qry.FieldValues['discount_percent'];
          end;
          IntTotalDiscount:=IntDiscountPrice+Round(IntTotal*(IntDiscountPercent/100));
        end;
        StrDiscount:=IToCurr(IntTotalDiscount);
        StrDates:=Qry.FieldValues['invoice_dates'];
        StrOrderId:=Qry.FieldValues['customer_order_id'];
        StrSubTotal:=IToCurr(Qry.FieldValues['total']+IntTotalDiscount);
        StrTotal:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['ppnAddition']);

        StrAmountSaid:=AmountSaid(Qry.FieldValues['total']+Qry.FieldValues['ppnAddition']);

        if (Qry.FieldValues['service_resume']<>'') AND (Qry.FieldValues['service_resume']<>NULL) then begin
          StrService:=LeftStr(Qry.FieldValues['service_resume'],Length(Qry.FieldValues['service_resume'])-1);
          if (Qry.FieldValues['service_price']<>'0') then StrServiceTotal:=Qry.FieldValues['service_price']
          else StrServiceTotal:='0';
        end;
        StrSales:=Qry.FieldValues['initial_name'];

        if Qry.FieldValues['due_days']<>NULL then
          StrDueDate:=FormatDateTime('dd/mm/yyyy',IncDay(StrToDate(Qry.FieldValues['invoice_dates']),Qry.FieldValues['due_days']));
        if (Qry.FieldValues['total_addday']>0) then begin
          if StrService<>'' then begin
            StrService:=StrService+', Additional Day (Rp.'+IToCurr(Qry.FieldValues['total_addday'])+')';
            if StrServiceTotal='' then StrServiceTotal:=IToCurr(Qry.FieldValues['total_addday'])
            else StrServiceTotal:=IToCurr(SToInt(StrServiceTotal)+Qry.FieldValues['total_addday']);
          end else begin
            StrService:='Additional Day (Rp.'+IToCurr(Qry.FieldValues['total_addday'])+')';
            StrServiceTotal:=IToCurr(Qry.FieldValues['total_addday']);
          end;
        end;
        if Qry.FieldValues['remark']<>NULL then StrRemark:=Qry.FieldValues['remark'];
      end;
      Qry.Close;
      StrQry:='EXEC GetTransactionDetailPrint_P '+QuotedStr(Invoice_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);

      Qry.Open;
      IntRowNum:=Qry.RecordCount;
      IntRowCount:=Qry.RecordCount;
      Qry.Close;
      if FormNumber=1 then begin
        pp2Customer.Lines.Clear;
        pp2Reprinted.Caption:=StrCopy;
        pp2InvoiceId.Caption:=StrInvoiceId;
        pp2CustomerName.Caption:=StrCustomerName;
        if StrCustomerAddress<>'' then pp2Customer.Lines.Add(StrCustomerAddress);
        if StrContactPerson<>'' then pp2Customer.Lines.Add(StrContactPerson);
        if StrCellularNo<>'' then pp2Customer.Lines.Add(StrCellularNo);
        if StrPhoneNo<>'' then pp2Customer.Lines.Add(StrPhoneNo);
        if StrFaxNo<>'' then pp2Customer.Lines.Add(StrFaxNo);
        pp2Discount.Caption:=StrDiscount+',00';
        pp2Dates.Caption:=StrDates;
        pp2OrderId.Caption:=StrOrderId;
        pp2SubTotal.Caption:=StrSubTotal+',00';
        pp2Total.Caption:=StrTotal+',00';
        pp2AmountSaid.Caption:=StrAmountSaid;
        pp2Service.Caption:=StrService;
        pp2ServiceTotal.Caption:=StrServiceTotal;
        pp2Sales.Caption:=StrSales;
        pp2GroupName.Caption:=StrGroupName;

        if NPWP.Checked then pp2NPWP.Visible:=True else pp2NPWP.Visible:=False;
        pp2DueDate.Caption:=StrDueDate;
        StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+',@TypeId=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        ppDataSrc:=TDataSource.Create(Self);
        ppDataSrc.DataSet:=Qry;
        ppDBPipe:=TppDBPipeline.Create(Self);
        ppDBPipe.DataSource:=ppDataSrc;
        pp2Report.DataPipeline:=ppDBPipe;
        Qry.Open;
        Main.M_Normal;
        if NoPageFooter.Checked=True then pp2Report.Footer.Height:=0;
        pp2Report.PreviewFormSettings.WindowState:=wsMaximized;
        pp2Report.Print;
        Qry.Close;
      end;
      if FormNumber=2 then begin
        ppCustomer.Lines.Clear;
        ppService.Caption:='';
        ppReprinted.Caption:=StrCopy;
        ppInvoiceId.Caption:=StrInvoiceId;
        ppCustomerName.Caption:=StrCustomerName;
        if StrCustomerAddress<>'' then ppCustomer.Lines.Add(StrCustomerAddress);
        if StrContactPerson<>'' then ppCustomer.Lines.Add(StrContactPerson);
        if StrCellularNo<>'' then ppCustomer.Lines.Add(StrCellularNo);
        if StrPhoneNo<>'' then ppCustomer.Lines.Add(StrPhoneNo);
        if StrFaxNo<>'' then ppCustomer.Lines.Add(StrFaxNo);
        ppLabelDiscount.Caption:=StrDiscountLabel;
        if StrDiscountLabel='' then ppDiscount.Caption:=''
        else ppDiscount.Caption:=StrDiscount;

        ppDates.Caption:=StrDates;
        ppOrderId.Caption:=StrOrderId;
        ppTotal.Caption:=StrTotal;

//        finance
//        if (GroupId ='26') or (GroupId ='53') then
        if SetPrinterINV ='EPSON LX-310' then
        begin
          ppHeaderBand1.Height:= ppHeaderBand1.Height+0.10+StrToFloat(SetTambahanTopSJ);
          ppInvoiceId.Top:= ppInvoiceId.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppOrderId.Top:= ppOrderId.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppSales.Top:= ppSales.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppDueDate.Top:= ppDueDate.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppCustomer.Top:= ppCustomer.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppCustomerName.Top:= ppCustomerName.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppGroupName.Top:= ppGroupName.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppReprinted.Top:= ppReprinted.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppNPWP.Top:= ppNPWP.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppDates.Top:= ppDates.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppPageNo.Top:= ppPageNo.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppSysPageNo.Top:= ppSysPageNo.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppPageCount.Top:= ppPageCount.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppSysPageCount.Top:= ppSysPageCount.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppLabel3.Top:= ppLabel3.Top+0.1+StrToFloat(SetTambahanTopSJ);
          ppAmountSaid.Top:= ppAmountSaid.Top+0.08+StrToFloat(SetTambahanTopSJ);
          ppSignature.Top:= ppSignature.Top+0.34+StrToFloat(SetTambahanTopSJ);
          ppRemark.Top:= ppRemark.Top+0.34+StrToFloat(SetTambahanTopSJ);
          ppTotal.Top:= ppTotal.Top+0.02+StrToFloat(SetTambahanTopSJ);
          ppFooterBand1.Height:= ppFooterBand1.Height+0.30+StrToFloat(SetTambahanTopSJ);
        end
        else
        begin
          if IntRowCount=3 then begin
            ppDetailBand1.Height:= ppDetailBand1.Height-0.1;
          end;
          ppInvoiceId.Top:= ppInvoiceId.Top-0.05;
          ppOrderId.Top:= ppOrderId.Top-0.05;
          ppSales.Top:= ppSales.Top-0.05;
          ppDueDate.Top:= ppDueDate.Top-0.05;
          ppCustomer.Top:= ppCustomer.Top-0.05;
          ppCustomerName.Top:= ppCustomerName.Top-0.05;
          ppGroupName.Top:= ppGroupName.Top-0.05;
          ppReprinted.Top:= ppReprinted.Top-0.05;
          ppNPWP.Top:= ppNPWP.Top-0.05;
          ppDates.Top:= ppDates.Top-0.05;
          ppPageNo.Top:= ppPageNo.Top-0.05;
          ppSysPageNo.Top:= ppSysPageNo.Top-0.05;
          ppPageCount.Top:= ppPageCount.Top-0.05;
          ppSysPageCount.Top:= ppSysPageCount.Top-0.05;
          ppLabel3.Top:= ppLabel3.Top-0.05;
          ppSignature.Top:= ppSignature.Top-0.05;

          ppFooterBand1.Height:= ppFooterBand1.Height+0.34;
          ppSignature.Top:= ppSignature.Top+0.32;
          ppRemark.Top:= ppRemark.Top+0.32;
          ppAmountSaid.Top:= ppAmountSaid.Top+0.03;

        end;
        ppAmountSaid.Caption:=StrAmountSaid;
        ppService.Caption:=StrService;
        ppServiceTotal.Caption:=StrServiceTotal;
        ppRemark.Caption:=StrRemark;
        ppSales.Caption:=StrSales;
        ppGroupName.Caption:=StrGroupName;
        if NPWP.Checked then ppNPWP.Visible:=True else ppNPWP.Visible:=False;
        ppDueDate.Caption:=StrDueDate;
        if IntRowNum>3 then begin
          IntRowLimit:=Floor(IntRowNum/3)*3;
          if (IntRowNum mod 3=0) then begin
            ppPageCount .Caption:=IntToStr(IntRowLimit);
            IntRowLimit:=IntRowLimit-3;
          end else begin
            ppPageCount.Caption:=IntToStr(Floor(IntRowNum/3)+1);
          end;
          StrQry:='EXEC GetTransactionDetailPrint_P '+QuotedStr(Invoice_Id)+',@RowLimit='+IntToStr(IntRowLimit)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          ppReport.DataPipeline:=ppDBPipe;
          Qry.Open;
          Main.M_Normal;
          ppLabelDiscount.Visible:=False;
          ppDiscount.Visible:=False;
          ppTotal.Visible:=False;
          ppPPNLabel.Visible:=False;
          ppPPNAddition.Visible:=False;
          ppPph.Visible:=False;
          ppPphDeduction.Visible:=False;
          ppAmountSaid.Visible:=False;
          ppRemark.Visible:=False;
          ppSignature.Visible:=False;
          ppService.Visible:=False;
          ppServiceTotal.Visible:=False;
          ppReport.PreviewFormSettings.WindowState:=wsMaximized;
          ppReport.PageLimit:=Floor(IntRowLimit/3);
          ppSysPageNo.Visible:=True;
          ppSysPageCount.Visible:=False;
          ppPageNo.Visible:=False;
          ppPageCount.Visible:=True;
          ppReport.Print;
          Qry.Close;
          FreeAndNil(ppDBPipe);
          FreeAndNil(ppDataSrc);
          StrQry:='EXEC GetTransactionDetailPrint_P '+QuotedStr(Invoice_Id)+',@RowStart='+IntToStr(IntRowLimit)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          ppReport.DataPipeline:=ppDBPipe;
          Qry.Open;
          Main.M_Normal;
          ppLabelDiscount.Visible:=True;
          ppDiscount.Visible:=True;
          ppTotal.Visible:=True;
          ppPPNLabel.Visible:=True;
          ppPPNAddition.Visible:=True;
          ppPph.Visible:=True;
          ppPphDeduction.Visible:=True;

          ppAmountSaid.Visible:=True;
          ppRemark.Visible:=True;
          ppSignature.Visible:=True;
          ppService.Visible:=True;
          ppServiceTotal.Visible:=True;
          ppReport.Footer.PrintOnFirstPage:=True;
          ppReport.PreviewFormSettings.WindowState:=wsMaximized;
          ppSysPageNo.Visible:=False;
          ppSysPageCount.Visible:=False;
          ppPageNo.Visible:=True;
          ppPageCount.Visible:=True;
          ppPageNo.Caption:=IntToStr(Floor(IntRowLimit/3)+1);
          ppPageCount.Caption:=IntToStr(Floor(IntRowLimit/3)+1);
          ppReport.PageLimit:=1;
          ppReport.Print;
          Qry.Close;
        end else begin
          StrQry:='EXEC GetTransactionDetailPrint_P '+QuotedStr(Invoice_Id)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          ppReport.DataPipeline:=ppDBPipe;
          Qry.Open;
//          if Qry.RecordCount>4 then ppReport.Footer.PrintOnFirstPage:=False
//          else ppReport.Footer.PrintOnFirstPage:=True;
          Main.M_Normal;
          if NoPageFooter.Checked=True then begin
            ppLabelDiscount.Visible:=False;
            ppDiscount.Visible:=False;
            ppTotal.Visible:=False;
            ppAmountSaid.Visible:=False;
            ppRemark.Visible:=False;
            ppSignature.Visible:=False;
            ppPph.Visible:=False;
            ppPphDeduction.Visible:=False;
          end;
          ppReport.PreviewFormSettings.WindowState:=wsMaximized;
          ppReport.PageLimit:=1;
          ppReport.Print;
          Qry.Close;
        end;
      end;
      if FormNumber=3 then begin
        ppCustomer3.Lines.Clear;
        ppService3.Caption:='';
        ppReprinted3.Caption:=StrCopy;
        ppInvoiceId3.Caption:=StrInvoiceId;
        ppCustomerName3.Caption:=StrCustomerName;
        if StrCustomerAddress<>'' then ppCustomer3.Lines.Add(StrCustomerAddress);
        if StrContactPerson<>'' then ppCustomer3.Lines.Add(StrContactPerson);
        if StrCellularNo<>'' then ppCustomer3.Lines.Add(StrCellularNo);
        if StrPhoneNo<>'' then ppCustomer3.Lines.Add(StrPhoneNo);
        if StrFaxNo<>'' then ppCustomer3.Lines.Add(StrFaxNo);
        ppLabelDiscount3.Caption:=StrDiscountLabel;
        ppDiscount3.Caption:=StrDiscount;
        ppDates3.Caption:=StrDates;
        ppOrderId3.Caption:=StrOrderId;
        ppTotal3.Caption:=StrTotal;

//        if GroupId ='26' then
//        begin
//          ppHeaderBand3.Height:= ppHeaderBand3.Height+0.16;
//          ppInvoiceId3.Top:= ppInvoiceId3.Top+0.1;
//          ppOrderId3.Top:= ppOrderId3.Top+0.1;
//          ppSales3.Top:= ppSales3.Top+0.1;
//          ppDueDate3.Top:= ppDueDate3.Top+0.1;
//          ppCustomer3.Top:= ppCustomer3.Top+0.1;
//          ppCustomerName3.Top:= ppCustomerName3.Top+0.1;
//          ppGroupName3.Top:= ppGroupName3.Top+0.1;
//          ppReprinted3.Top:= ppReprinted3.Top+0.1;
//          ppNPWP3.Top:= ppNPWP3.Top+0.1;
//          ppDates3.Top:= ppDates3.Top+0.1;
//          ppPageNo3.Top:= ppPageNo3.Top+0.1;
//          ppSysPageNo3.Top:= ppSysPageNo3.Top+0.1;
//          ppPageCount3.Top:= ppPageCount3.Top+0.1;
//          ppSysPageCount3.Top:= ppSysPageCount3.Top+0.1;
//          ppLabel3.Top:= ppLabel3.Top+0.1;
//          ppAmountSaid3.Top:= ppAmountSaid3.Top+0.08;
//          ppSignature3.Top:= ppSignature3.Top+0.34;
//          ppRemark3.Top:= ppRemark3.Top+0.34;
//          ppTotal3.Top:= ppTotal3.Top+0.02;
//          ppFooterBand3.Height:= ppFooterBand3.Height+0.30;
//        end
//        else
//        begin
//
//          ppFooterBand3.Height:= ppFooterBand3.Height+0.34;
//          ppSignature3.Top:= ppSignature3.Top+0.32;
//          ppRemark3.Top:= ppRemark3.Top+0.32;
//          ppAmountSaid3.Top:= ppAmountSaid3.Top+0.03;
//        end;

        ppAmountSaid3.Caption:=StrAmountSaid;
        ppService3.Caption:=StrService;
        ppServiceTotal3.Caption:=StrServiceTotal;
        ppRemark3.Caption:=StrRemark;
        ppSales3.Caption:=StrSales;
        ppGroupName3.Caption:=StrGroupName;
        if NPWP.Checked then ppNPWP3.Visible:=True else ppNPWP3.Visible:=False;
        ppDueDate3.Caption:=StrDueDate;
        if IntRowNum>3 then begin
          IntRowLimit:=Floor(IntRowNum/3)*3;
          if (IntRowNum mod 3=0) then begin
            ppPageCount3.Caption:=IntToStr(IntRowLimit);
            IntRowLimit:=IntRowLimit-3
          end else begin
            ppPageCount3.Caption:=IntToStr(Floor(IntRowNum/3)+1);
          end;
          StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+',@RowLimit='+IntToStr(IntRowLimit)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          pp3Report.DataPipeline:=ppDBPipe;
          Qry.Open;
          Main.M_Normal;
          ppLabelDiscount3.Visible:=False;
          ppDiscount3.Visible:=False;
          ppTotal3.Visible:=False;
          ppAmountSaid3.Visible:=False;
          ppRemark3.Visible:=False;
          ppService3.Visible:=False;
          ppServiceTotal3.Visible:=False;
          ppSignature3.Visible:=False;
          ppPageNo3.Visible:=False;
          ppPageCount3.Visible:=True;
          ppSysPageNo3.Visible:=True;
          ppSysPageCount3.Visible:=False;
          pp3Report.PreviewFormSettings.WindowState:=wsMaximized;
          pp3Report.PageLimit:=Floor(IntRowLimit/3);
          pp3Report.Print;
          Qry.Close;
          FreeAndNil(ppDBPipe);
          FreeAndNil(ppDataSrc);
          StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+',@RowStart='+IntToStr(IntRowLimit)+',@FullPage=1;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          pp3Report.DataPipeline:=ppDBPipe;
          Qry.Open;
          Main.M_Normal;
          ppLabelDiscount3.Visible:=True;
          ppDiscount3.Visible:=True;
          ppTotal3.Visible:=True;
          ppAmountSaid3.Visible:=True;
          ppRemark3.Visible:=True;
          ppSignature3.Visible:=True;
          ppService3.Visible:=True;
          ppServiceTotal3.Visible:=True;

        ppTotal3.Caption:=StrTotal;
        ppAmountSaid3.Caption:=StrAmountSaid;
        ppService3.Caption:=StrService;
        ppServiceTotal3.Caption:=StrServiceTotal;

          pp3Report.Footer.PrintOnFirstPage:=True;
          pp3Report.PreviewFormSettings.WindowState:=wsMaximized;
          ppSysPageNo3.Visible:=False;
          ppSysPageCount3.Visible:=False;
          ppPageNo3.Visible:=True;
          ppPageCount3.Visible:=True;
          ppPageNo3.Caption:=IntToStr(Floor(IntRowLimit/3)+1);
          ppPageCount3.Caption:=IntToStr(Floor(IntRowLimit/3)+1);
          pp3Report.Print;
          Qry.Close;
        end else begin
          if (IntRowNum mod 3)=0 then
            StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+';'
          else
            StrQry:='EXEC GetTransactionDetailPrint '+QuotedStr(Invoice_Id)+',@FullPage=1;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          ppDataSrc:=TDataSource.Create(Self);
          ppDataSrc.DataSet:=Qry;
          ppDBPipe:=TppDBPipeline.Create(Self);
          ppDBPipe.DataSource:=ppDataSrc;
          pp3Report.DataPipeline:=ppDBPipe;
          Qry.Open;
//          if Qry.RecordCount>4 then ppReport.Footer.PrintOnFirstPage:=False
//          else ppReport.Footer.PrintOnFirstPage:=True;
          Main.M_Normal;
          if NoPageFooter.Checked=True then begin
            ppLabelDiscount3.Visible:=False;
            ppDiscount3.Visible:=False;
            ppTotal3.Visible:=False;
            ppAmountSaid3.Visible:=False;
            ppRemark3.Visible:=False;
            ppSignature3.Visible:=False;
          end;
          pp3Report.PreviewFormSettings.WindowState:=wsMaximized;
          pp3Report.PageLimit:=1;
          pp3Report.Print;
          Qry.Close;
        end;
      end;
    end;
    FreeAndNil(Qry);
    FreeAndNil(Query);
    WOConnection.Close;
    Main.CloseDb;
  end;
end;

procedure TBusInvoice.CariOrderClick(Sender: TObject);
var StrCustomerId:String;
begin
  StrCustomerId:='';
  if MultiOrder.Checked then
    if CustomerId.Text<>'' then StrCustomerId:=CustomerId.Text;
  OrderList:=TOrderList.Create(Self,'Bus','Invoice-Create',StrCustomerId,2,'',0,0,True);
end;

procedure TBusInvoice.CetakUlangClick(Sender: TObject);
var InvoiceSelect:Integer;
begin
  if (InvcId<>'') OR (Trim(InvoiceId.Text)<>'') then begin
    RePrint2(InvcId);
//    InvoiceSelect:=Main.MyMessageDlg('Model Cetak Invoice',mtConfirmation,[mbYes,mbNo],['Invoice Lama','Invoice Baru'],'Pencetakan');
//    if InvoiceSelect=6 then begin
//      RePrint2(InvcId);
//    end else begin
{      case InvoiceForm of
        1:RePrint2(InvcId);
        2:RePrint(InvcId)
      end;
}
//    end;
  end else if Main.IsFormOpen('BusInvoiceList')=False then BusInvoiceList:=TBusInvoiceList.Create(Self,'Bus','Invoice-Reprint');
end;

procedure TBusInvoice.TotalKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then begin
    Total.Text:=SToCurr(Total.Text);
    Simpan.SetFocus;
  end;
end;

procedure TBusInvoice.SubTotalKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then begin
    if SubTotal.Text='' then SubTotal.Text:='0';
    SubTotal.Text:=SToCurr(SubTotal.Text);
    Discount.SetFocus;
  end;
end;

procedure TBusInvoice.DiscountKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#45]) then Key:=#0;
  if Key=#13 then begin
    if Discount.Text='' then Discount.Text:='0';
    Discount.Text:=SToCurr(Discount.Text);
    Total.SetFocus;
  end;
end;

procedure TBusInvoice.SubTotalEnter(Sender: TObject);
begin
  SubTotal.Text:=ToString(SubTotal.Text); 
end;

procedure TBusInvoice.DiscountEnter(Sender: TObject);
begin
  Discount.Text:=ToString(Discount.Text);
end;

procedure TBusInvoice.TotalEnter(Sender: TObject);
begin
  Total.Text:=ToString(Total.Text); 
end;

procedure TBusInvoice.InitDB_WO;
var IsOk:Boolean;
begin
  StrConnection:='Provider='+ProviderWO+';Password='+DbPassWO+';Persist Security Info=True;User ID='+DbUserWO+';Initial Catalog='+DbWO+';Data Source='+DbHostWO;
  WOConnection:=TADOConnection.Create(Self);
  WOConnection.Connected:=False;
  WOConnection.KeepConnection:=False;
  WOConnection.CursorLocation:=clUseClient;
  WOConnection.LoginPrompt:=False;
  WOConnection.CommandTimeout:=3600;
  WOConnection.ConnectionTimeout:=3600;
  Main.WriteLog('Init DB WO');
  IsOk:=True;
  try
    //CreateDbConnection;
    WOConnection.ConnectionString:=StrConnection;
  except
    on E:Exception do begin
      Main.WriteLog('Error Create DB Connection WO');
      IsOk:=False;
      //SetManual:=MessageBox(Handle,PChar('Error Create DB Connection'+e.Message+Chr(13)+Chr(13)+' Set Connection Manually ?'),'Database',MB_OKCANCEL or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;

  if IsOk then Main.WriteLog('Finish Init DB WO')
  else Main.WriteLog('Error Init DB WO');
end;

function TBusInvoice.OpenDb_WO:Boolean;
var IsOk:Boolean;
    StrMsg:String;
begin
  IsOk:=True;
  if IsPortOpened(DbHostWO,1433) then begin
    try
      Main.WriteLog('Open DB Connection');
      WOConnection.Open;
    except
      on E:Exception do begin
        IsOk:=False;
        Main.WriteLog('Error Opening DB Connection');
        StrMsg:='Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message;
        MessageBox(Handle,PChar(StrMsg),'Koneksi Database',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
    end;
  end;
  Result:=IsOk;
end;

end.
