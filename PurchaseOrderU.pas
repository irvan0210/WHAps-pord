unit PurchaseOrderU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ZColorStringGrid, Buttons, ADODB, WHUnit,
  ComCtrls, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppParameter,
  ppModule, raCodMod, ppBands, ppCtrls, ppStrtch, ppMemo, jpeg, ppPrnabl,
  ppCache, ppDBPipe, ppDB, DB, ppDBBDE;

type
  TPurchaseOrder = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PRTanggal: TEdit;
    RequestedByPR: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    BudgetDisp: TEdit;
    VendorName: TEdit;
    Attn: TEdit;
    Referensi: TEdit;
    StrGridPR: TZColorStringGrid;
    StrGrid: TZColorStringGrid;
    Panel2: TPanel;
    SubTotal: TMemo;
    Tax: TMemo;
    Total: TMemo;
    Panel3: TPanel;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BudgetTotal: TMemo;
    BudgetTerpakai: TMemo;
    BudgetSisa: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    Tanggal: TEdit;
    PONo: TEdit;
    Label6: TLabel;
    Qty: TEdit;
    PriceUnit: TEdit;
    CreatePO: TSpeedButton;
    PartDescription: TComboBox;
    PartNumber: TComboBox;
    Label22: TLabel;
    RequestedBy: TEdit;
    SBU: TEdit;
    Label23: TLabel;
    SBUCode: TEdit;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppCompany: TppLabel;
    ppAddress: TppMemo;
    ppPhone: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppFax: TppLabel;
    ppLabel11: TppLabel;
    ppVendorName: TppLabel;
    ppVendorAddress: TppMemo;
    ppLabel13: TppLabel;
    ppVendorPhone: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppPONo: TppLabel;
    ppLabel5: TppLabel;
    ppDate: TppLabel;
    ppPRNo: TppLabel;
    ppDeliveryCompany: TppLabel;
    ppDeliveryAddress: TppMemo;
    ppLabel30: TppLabel;
    ppDeliveryPhone: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape2: TppShape;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppPaymentTerm: TppLabel;
    ppLabel14: TppLabel;
    ppDeliveryDate: TppLabel;
    ppLabel18: TppLabel;
    ppNotes: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppOrderBy: TppLabel;
    ppApprovedBy: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppParameterList2: TppParameterList;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppNo: TppDBText;
    ppItem: TppDBText;
    ppQty: TppDBText;
    ppUnitPrice: TppDBText;
    ppTotalLine: TppDBText;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel15: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine18: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppSubTotal: TppLabel;
    ppTax: TppLabel;
    ppTotal: TppLabel;
    PanelCari: TPanel;
    Cari: TSpeedButton;
    GroupPO: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel1: TPanel;
    VendorDisp: TEdit;
    Lokasi: TComboBox;
    Vendor: TComboBox;
    TanggalKirim: TDateTimePicker;
    PaymentTerm: TComboBox;
    GroupFooter: TPanel;
    Batal: TCheckBox;
    TaxCheck: TCheckBox;
    Label5: TLabel;
    Label4: TLabel;
    ppLogo: TppImage;
    Panel4: TPanel;
    PRNo: TEdit;
    Label3: TLabel;
    Label10: TLabel;
    Rev: TEdit;
    VendorID_Disp: TEdit;
    CariVendor: TSpeedButton;
    Chk_Pembelian: TCheckBox;
    Remark: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VendorChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PartDescriptionExit(Sender: TObject);
    procedure PartNumberExit(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure PriceUnitExit(Sender: TObject);
    procedure PriceUnitKeyPress(Sender: TObject; var Key: Char);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure PriceUnitEnter(Sender: TObject);
    procedure QtyEnter(Sender: TObject);
    procedure PartDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure PartNumberKeyPress(Sender: TObject; var Key: Char);
    procedure CreatePOClick(Sender: TObject);
    procedure StrGridPRSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridPRDblClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure VendorEnter(Sender: TObject);
    procedure TaxCheckClick(Sender: TObject);
    procedure PRNoKeyPress(Sender: TObject; var Key: Char);
    procedure VendorKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure TanggalKirimKeyPress(Sender: TObject; var Key: Char);
    procedure PaymentTermKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure CetakUlangClick(Sender: TObject);
    procedure CariVendorClick(Sender: TObject);
    procedure VendorID_DispChange(Sender: TObject);
    procedure Chk_PembelianClick(Sender: TObject);
  private
    { Private declarations }
    PurchaseOrderId,VendorId:String;
    MinRowGrid,IntCol,IntRow,IntUpRow,IntUpCol:Integer;
    VendorArr,PartDetailArr,LocationArr,PaymentTermArr:Array of TArrString5;
    IsInputGrid,isLock:Boolean;
    procedure Init;
    procedure InitVendor;
    procedure InitLokasi;
    procedure InitPaymentTerm;
    procedure InitGrid;
    procedure LoadDataPurchaseRequest;
    procedure Calculate;
    procedure RefreshCombo;
    procedure RefreshPart;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure LoadData;
  public
    { Public declarations }
    procedure Reprint(Purchase_Id:String);
    procedure GridCell(Str:String);
    procedure SetPRNo(Str:String);
    constructor Create(AOwner:TComponent;PurchaseOrder_Id:String='';IsRead_Only:Boolean=False);Overload;
  end;

var
  PurchaseOrder: TPurchaseOrder;

implementation

uses PurchaseOrderPickListU, PurchaseRequestListU, MainU, PartSelectFormU,
  DateUtils, StrUtils, RePrintFormU, PurchaseOrderListU, VendorListU, 
  PartSelectFormGridU;

{$R *.dfm}

constructor TPurchaseOrder.Create(AOwner:TComponent;PurchaseOrder_Id:String='';IsRead_Only:Boolean=False);
begin
  PurchaseOrderId:=PurchaseOrder_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;


procedure TPurchaseOrder.Init;
begin
  TanggalKirim.Date:=IncDay(Now());
  RequestedBy.Text:=FullName;
  PRTanggal.Text:='';
  PRNo.Text:='';
  PONo.Text:='';
  RequestedByPR.Text:='';
  BudgetDisp.Text:='';
  PaymentTerm.Text:='';
  SBU.Text:='';
  SBUCode.Text:='';
  VendorName.Text:='';
  Attn.Text:='';
  Referensi.Text:='';
  MinRowGrid:=0;
  IntCol:=0;
  IntRow:=0;
  IntUpRow:=0;
  IntUpCol:=0;
  Tanggal.Text:='';
  TaxCheck.Checked:=True;
  SubTotal.Text:='';
  Tax.Text:='';
  Total.Text:='';
  BudgetTotal.Text:='';
  BudgetTerpakai.Text:='';
  BudgetSisa.Text:='';
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
  Lokasi.Items.Clear;
  Remark.Text:='';
  rev.Text:='0';
  InitVendor;
  InitLokasi;
  InitPaymentTerm;
end;

procedure TPurchaseOrder.InitVendor;
begin
  Vendor.Text:='';
  Vendor.ItemIndex:=-1;
  Vendor.Items.Clear;
  VendorDisp.Text:='';
end;

procedure TPurchaseOrder.InitLokasi;
begin
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
  Lokasi.Items.Clear;
end;

procedure TPurchaseOrder.InitPaymentTerm;
begin
  PaymentTerm.Text:='';
  PaymentTerm.ItemIndex:=-1;
  PaymentTerm.Items.Clear;
end;

procedure TPurchaseOrder.InitGrid;
var IntCount:Integer;
begin
  StrGridPR.RowCount:=2;
  StrGridPR.ColWidths[0]:=20;
  StrGridPR.ColWidths[1]:=350;
  StrGridPR.ColWidths[2]:=60;
  StrGridPR.ColWidths[3]:=100;
  StrGridPR.ColWidths[4]:=100;
  StrGridPR.ColWidths[5]:=0;
  StrGridPR.ColWidths[6]:=0;
  StrGridPR.ColWidths[7]:=0;
  StrGridPR.Cells[0,0]:='No';
  StrGridPR.Cells[1,0]:='Barang/Jasa';
  StrGridPR.Cells[2,0]:='Qty';
  StrGridPR.Cells[3,0]:='Harga Satuan';
  StrGridPR.Cells[4,0]:='Total';
  StrGridPR.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridPR.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridPR.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGridPR.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGridPR.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 4 do begin
    StrGridPR.Cells[IntCount,1]:='';
    StrGridPR.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGridPR.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGridPR.CellStyle[3,1].HorizontalAlignment:=taRightJustify;
  StrGridPR.CellStyle[4,1].HorizontalAlignment:=taRightJustify;
  //
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=320;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=150;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=50;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Barang/Jasa';
  StrGrid.Cells[2,0]:='Qty';
  StrGrid.Cells[3,0]:='Harga Satuan';
  StrGrid.Cells[4,0]:='Total';
  StrGrid.Cells[5,0]:='Part Detail ID';
  StrGrid.Cells[6,0]:='PR Detail ID';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 6 do
    StrGrid.Cells[IntCount,1]:='';
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseOrder.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  InitVendor;
  InitLokasi;
  InitPaymentTerm;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVendorList '+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(VendorArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        VendorArr[IntCount][0]:=Qry.FieldValues['vendor_id'];
        VendorArr[IntCount][1]:=Qry.FieldValues['name'];
        if Qry.FieldValues['payment_term_name']<>NULL then VendorArr[IntCount][2]:=Qry.FieldValues['payment_term_name'] else
        VendorArr[IntCount][2]:=''; 
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_company_location a '+
            ' LEFT JOIN wh_company b ON b.company_id=a.company_id '+
            ' LEFT JOIN wh_location c ON c.location_id=a.location_id '+
            ' WHERE a.active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(LocationArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        LocationArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
        LocationArr[IntCount][1]:=Qry.FieldValues['name'];
        LocationArr[IntCount][2]:=Qry.FieldValues['location'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_payment_term WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PaymentTermArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PaymentTermArr[IntCount][0]:=Qry.FieldValues['payment_term_id'];
      PaymentTermArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(VendorArr)-1  do
    Vendor.Items.Add(VendorArr[IntCount][0]);
  for IntCount:=0 to Length(LocationArr)-1  do
    Lokasi.Items.Add(LocationArr[IntCount][1]+' ('+LocationArr[IntCount][2]+')');
  for IntCount:=0 to Length(PaymentTermArr)-1  do
    PaymentTerm.Items.Add(PaymentTermArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TPurchaseOrder.RefreshPart;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
//    StrQry:='SELECT * FROM wh_part_detail a '+
//            ' INNER JOIN wh_uom b ON b.uom_id=a.uom_id WHERE active=1;';
    StrQry:='EXEC GetpartDetailList';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartDetailArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      while not(Qry.Eof) do begin
        PartDetailArr[IntCount][0]:=Qry.FieldValues['part_detail_id'];
        PartDetailArr[IntCount][1]:=Qry.FieldValues['name'];
        PartDetailArr[IntCount][2]:=Qry.FieldValues['uom'];
        if Qry.FieldValues['price_list']<>NULL then PartDetailArr[IntCount][3]:=Qry.FieldValues['price_list']
          else PartDetailArr[IntCount][3]:='';
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;

    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('LockRealisasiPO_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then isLock:=True;
      if Qry.FieldValues['value_string']=0 then isLock:=False;
    end else isLock:=True;
    Qry.Close;

  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseOrder.LoadDataPurchaseRequest;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    IsOk :Boolean;
begin
  if Trim(PRNo.Text)<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrQry:='EXEC GetPurchaseRequestResume '+QuotedStr(PRNo.Text)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PRTanggal.Text:=Qry.FieldValues['request_dates'];
        BudgetDisp.Text:=Qry.FieldValues['coa_id']+' '+Qry.FieldValues['name'];
        VendorName.Text:=Qry.FieldValues['vendor_name'];
        VendorID_Disp.Text:=Qry.FieldValues['vendor_id'];
        VendorDisp.Text:=Qry.FieldValues['vendor_name'];
        Attn.Text:=Qry.FieldValues['attn'];
        Referensi.Text:=Qry.FieldValues['referensi'];
        RequestedByPR.Text:=Qry.FieldValues['user_name'];
        if Qry.FieldValues['tax']>0 then TaxCheck.Checked:=True else TaxCheck.Checked:=False;
        BudgetTotal.Text:=SToCurr(Qry.FieldValues['value']);
        BudgetTerpakai.Text:=IToCurr(Qry.FieldValues['budget_used']);
        BudgetSisa.Text:=IToCurr(Qry.FieldValues['value']-Qry.FieldValues['budget_used']);
        if PONo.Text='' then if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
        SBU.Text:=Qry.FieldValues['company_name'];
        SBUCode.Text:=Qry.FieldValues['company_code'];
        StrQry:='EXEC GetPurchaseRequestDetail '+QuotedStr(Qry.FieldValues['purchase_request_id'])+';';
        IntCount:=0;
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        if Qry2.RecordCount>0 then begin
          //StrGridPR.RowCount:=Qry2.RecordCount+1;
          StrGrid.RowCount:=Qry2.RecordCount+1;
          while not(Qry2.Eof) do begin
           { StrGridPR.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
            StrGridPR.Cells[1,IntCount+1]:=Qry2.FieldValues['item_detail'];
            StrGridPR.Cells[2,IntCount+1]:=Qry2.FieldValues['quantity'];
            StrGridPR.Cells[3,IntCount+1]:=SToCurr(Qry2.FieldValues['price_unit']);
            StrGridPR.Cells[4,IntCount+1]:=SToCurr(Qry2.FieldValues['total']);
            StrGridPR.Cells[5,IntCount+1]:=Qry2.FieldValues['item_detail_id'];
            StrGridPR.Cells[6,IntCount+1]:=Qry2.FieldValues['purchase_order_detail_id'];
            if Qry2.FieldValues['purchase_order_detail_id']<>NULL then begin
              StrGridPR.Cells[6,IntCount+1]:='R';
              StrGridPR.CellStyle[0,IntCount+1].BGColor:=clGreen;
              StrGridPR.CellStyle[1,IntCount+1].BGColor:=clGreen;
              StrGridPR.CellStyle[2,IntCount+1].BGColor:=clGreen;
              StrGridPR.CellStyle[3,IntCount+1].BGColor:=clGreen;
              StrGridPR.CellStyle[4,IntCount+1].BGColor:=clGreen;
            end else begin
              StrGridPR.Cells[6,IntCount+1]:='';
              StrGridPR.CellStyle[0,IntCount+1].BGColor:=clWindow;
              StrGridPR.CellStyle[1,IntCount+1].BGColor:=clWindow;
              StrGridPR.CellStyle[2,IntCount+1].BGColor:=clWindow;
              StrGridPR.CellStyle[3,IntCount+1].BGColor:=clWindow;
              StrGridPR.CellStyle[4,IntCount+1].BGColor:=clWindow;
            end;
            StrGridPR.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
            StrGridPR.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
            StrGridPR.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;  }

            //PO
            StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
            StrGrid.Cells[1,IntCount+1]:=Qry2.FieldValues['item_detail'];
            StrGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['quantity'];
            StrGrid.Cells[3,IntCount+1]:=SToCurr(Qry2.FieldValues['price_unit']);
            StrGrid.Cells[4,IntCount+1]:=SToCurr(Qry2.FieldValues['total']);
            StrGrid.Cells[5,IntCount+1]:=Qry2.FieldValues['item_detail_id'];
            StrGrid.Cells[6,IntCount+1]:=Qry2.FieldValues['purchase_request_detail_id'];
            if Qry2.FieldValues['purchase_order_detail_id']<>NULL then begin
              StrGrid.Cells[7,IntCount+1]:='R';
              StrGrid.CellStyle[0,IntCount+1].BGColor:=clGreen;
              StrGrid.CellStyle[1,IntCount+1].BGColor:=clGreen;
              StrGrid.CellStyle[2,IntCount+1].BGColor:=clGreen;
              StrGrid.CellStyle[3,IntCount+1].BGColor:=clGreen;
              StrGrid.CellStyle[4,IntCount+1].BGColor:=clGreen;
              StrGrid.CellStyle[5,IntCount+1].BGColor:=clGreen;
            end else begin
              StrGrid.Cells[7,IntCount+1]:='';
              StrGrid.CellStyle[0,IntCount+1].BGColor:=clWindow;
              StrGrid.CellStyle[1,IntCount+1].BGColor:=clWindow;
              StrGrid.CellStyle[2,IntCount+1].BGColor:=clWindow;
              StrGrid.CellStyle[3,IntCount+1].BGColor:=clWindow;
              StrGrid.CellStyle[4,IntCount+1].BGColor:=clWindow;
              StrGrid.CellStyle[5,IntCount+1].BGColor:=clWindow;
            end;
            StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
           // IsOk:=True;
             // if Trim(Qty.Text)<>'' then begin
            //    StrGrid.Cells[2,IntRow]:=SToCurr(Qty.Text);
                Calculate;
             //   if StrToInt(StrGrid.Cells[2,IntRow])>0 then begin
              //    if isLock Then begin
              //      if (StrToInt(StrGrid.Cells[2,IntRow])>StrToInt(StrGrid.Cells[7,IntRow])) then begin
              //        MessageBox(0,'Jumlah Quantity tidak boleh lebih besar dari PR','Purchase Order',MB_OK or MB_ICONERROR);
                      //Qty.Text:=StrGrid.Cells[2,IntRow];
                     // Qty.SetFocus;
                     // IsOk:=False;
               //     end;
               //   end;
             //   end;
            //  end;
            //  if IsOk then begin
            //    Qty.Visible:=False;
            //    StrGrid.SetFocus;
            //  end;


            Inc(IntCount);
            Qry2.Next;
          end;
        end;
        Qry2.Close;
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
    RefreshPart;
  end;
end;

procedure TPurchaseOrder.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPurchaseOrderResume '+QuotedStr(PurchaseOrderId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Tanggal.Text:=Qry.FieldValues['order_dates'];
      PONo.Text:=PurchaseOrderId;
      PRNo.Text:=Qry.FieldValues['purchase_request_id'];
      Vendor.ItemIndex:=Vendor.Items.IndexOf(Qry.FieldValues['vendor_id']);
      PaymentTerm.ItemIndex:=PaymentTerm.Items.IndexOf(Qry.FieldValues['payment_term_name']);
      VendorId:=Qry.FieldValues['vendor_id'];
      VendorID_Disp.Text:=Qry.FieldValues['vendor_id'];
      VendorDisp.Text:=Qry.FieldValues['vendor_name'];
      Lokasi.ItemIndex:=Lokasi.Items.IndexOf(Qry.FieldValues['delivery_company_name']+' ('+Qry.FieldValues['delivery_location']+')');
      RequestedBy.Text:=Qry.FieldValues['user_name'];
      TanggalKirim.Date:=StrToDate(Qry.FieldValues['delivery_dates']);
      Rev.Text:=Qry.FieldValues['rev']+1;
      if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
      if Qry.FieldValues['tax']>0 then begin
        TaxCheck.Checked:=True;
        Tax.Text:=SToCurr(Qry.FieldValues['tax']);
      end else begin
        TaxCheck.Checked:=False;
        Tax.Text:='0';
      end;
      SubTotal.Text:=SToCurr(Qry.FieldValues['total']);
      Total.Text:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['tax']);
      if Qry.FieldValues['cancel']<>NULL then
        if Qry.FieldValues['cancel']=1 then begin
          DisableInput;
          Batal.Checked:=True;
        end;
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetPurchaseOrderDetail '+QuotedStr(PurchaseOrderId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    StrGrid.RowCount:=Qry.RecordCount+2;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['no'];
      StrGrid.Cells[1,IntCount]:=Qry.FieldValues['part_detail_name'];
      StrGrid.Cells[2,IntCount]:=Qry.FieldValues['quantity'];
     // StrGrid.Cells[3,IntCount]:=Qry.FieldValues['uom'];
      StrGrid.Cells[3,IntCount]:=SToCurr(Qry.FieldValues['price_unit']);
      StrGrid.Cells[4,IntCount]:=SToCurr(Qry.FieldValues['total']);
      StrGrid.Cells[5,IntCount]:=Qry.FieldValues['purchase_request_detail_id'];
     // StrGrid.Cells[6,IntCount]:=Qry.FieldValues['item_detail'];
      StrGrid.Cells[7,IntCount]:=Qry.FieldValues['purchase_request_quantity'];
      StrGrid.Cells[8,IntCount]:=Qry.FieldValues['purchase_request_price_unit'];
      StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  LoadDataPurchaseRequest;
  if not (IsInputGrid) then begin
    StrGridPR.Enabled:=False;
    PanelCari.Enabled:=False;
  end;
  Main.M_Normal;
end;

procedure TPurchaseOrder.Calculate;
var IntCount,IntNum,IntTotal,IntSubTotal,IntTax:Integer;
begin
    IntNum:=0;
    for IntCount:=1 to StrGrid.RowCount-1 do
      if (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
        Inc(IntNum);
        StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
      end else
        StrGrid.Cells[0,IntCount]:='';
  IntSubTotal:=0;
  IntTax:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do begin
    if (Trim(StrGrid.Cells[1,IntCount])<>'') AND (Trim(StrGrid.Cells[2,IntCount])<>'') AND (Trim(StrGrid.Cells[3,IntCount])<>'') then
      if (Trim(StrGrid.Cells[2,IntCount])<>'0') AND (Trim(StrGrid.Cells[4,IntCount])<>'0') then begin
        IntTotal:=SToInt(ToString(StrGrid.Cells[2,IntCount]))*SToInt(ToString(StrGrid.Cells[3,IntCount]));
        IntSubTotal:=IntSubTotal+IntTotal;
        StrGrid.Cells[4,IntCount]:=IToCurr(IntTotal);
    end;
  end;
  SubTotal.Text:=IToCurr(IntSubTotal);
  if (TaxCheck.Checked)  then
    if IntTotal>0 then IntTax:=Integer(Round((IntSubTotal*11)/100));
  Tax.Text:=IToCurr(IntTax);
  Total.Text:=IToCurr(IntSubTotal+IntTax);
end;

procedure TPurchaseOrder.PreparePrint;
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
      ppCompany.Caption:=Qry.FieldValues['company_name'];
      ppAddress.Caption:=Qry.FieldValues['address'];
      ppPhone.Caption:=Qry.FieldValues['phone_no'];
      ppFax.Caption:=Qry.FieldValues['fax_no'];
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWHDC.Picture;
        2:ppLogo.Picture:=Main.LogoWH.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
    StrQry:='SELECT dbo.GetUsername('+QuotedStr(User)+') AS username;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppOrderBy.Caption:=Qry.FieldValues['username'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseOrder.Reprint(Purchase_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Purchase Order';
  RePrintForm.ReportId:=Purchase_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetPurchaseOrderResume  '+QuotedStr(Purchase_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if (Qry.FieldValues['rev']>0) then ppPONo.Caption:=Purchase_Id+'R' else ppPONo.Caption:=Purchase_Id;
        ppPRNo.Caption:=Qry.FieldValues['purchase_request_id'];
        ppDate.Caption:=Qry.FieldValues['order_dates'];
        ppCompany.Caption:=Qry.FieldValues['company_name'];
        ppAddress.Lines.Add(Qry.FieldValues['company_address']);
        ppPhone.Caption:=LeftStr(Qry.FieldValues['company_phone_no'],3)+'-'+RightStr(Qry.FieldValues['company_phone_no'],Length(Qry.FieldValues['company_phone_no'])-3) ;
        ppFax.Caption:=LeftStr(Qry.FieldValues['company_fax_no'],3)+'-'+RightStr(Qry.FieldValues['company_fax_no'],Length(Qry.FieldValues['company_fax_no'])-3) ;
        ppFax.Caption:=Qry.FieldValues['company_fax_no'];
        ppVendorName.Caption:=Qry.FieldValues['vendor_name'];
        if (Qry.FieldValues['vendor_address']<>NULL) then ppVendorAddress.Lines.Add(Qry.FieldValues['vendor_address']);
        if (Qry.FieldValues['vendor_phone_no']<>NULL) then ppVendorPhone.Caption:=LeftStr(Qry.FieldValues['vendor_phone_no'],3)+'-'+RightStr(Qry.FieldValues['vendor_phone_no'],Length(Qry.FieldValues['vendor_phone_no'])-3) ;
        ppPaymentTerm.Caption:=Qry.FieldValues['payment_term_name'];
        ppSubTotal.Caption:=SToCurr(Qry.FieldValues['total']);
        ppTax.Caption:=SToCurr(Qry.FieldValues['tax']);
        ppTotal.Caption:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['tax']);
        ppDeliveryDate.Caption:=Qry.FieldValues['delivery_dates'];
        ppDeliveryCompany.Caption:=Qry.FieldValues['delivery_company'];
        ppDeliveryAddress.Lines.Add(Qry.FieldValues['delivery_address']);
        ppDeliveryPhone.Caption:=LeftStr(Qry.FieldValues['delivery_phone_no'],3)+'-'+RightStr(Qry.FieldValues['delivery_phone_no'],Length(Qry.FieldValues['delivery_phone_no'])-3);
        ppOrderBy.Caption:=Qry.FieldValues['user_name'];
        ppApprovedBy.Caption:=Qry.FieldValues['user_superior'];
        if Qry.FieldValues['description']<>NULL then ppNotes.Caption:=Qry.FieldValues['description']
        else ppNotes.Caption:='';
      end;
      Qry.Close;
      StrQry:='EXEC GetPurchaseOrderDetailPrint  '+QuotedStr(Purchase_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;


procedure TPurchaseOrder.CariClick(Sender: TObject);
begin
  PurchaseRequestList:=TPurchaseRequestList.Create(Self,'PurchaseOrder');
end;

procedure TPurchaseOrder.SelesaiClick(Sender: TObject);
begin
  PurchaseOrder.Close;
end;

procedure TPurchaseOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseOrder.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshPart;
  if PurchaseOrderId<>'' then LoadData;
  if not(IsInputGrid) then DisableInput; 
end;

procedure TPurchaseOrder.VendorChange(Sender: TObject);
begin
  if Trim(Vendor.Text)<>'' then begin
    VendorDisp.Text:=VendorArr[Vendor.ItemIndex][1];
    if VendorArr[Vendor.ItemIndex][2]<>'' then PaymentTerm.ItemIndex:=PaymentTerm.Items.IndexOf(VendorArr[Vendor.ItemIndex][2])
    else PaymentTerm.ItemIndex:=-1; 
  end;
end;

procedure TPurchaseOrder.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
 { IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) and (StrGrid.Cells[5,IntRow]<>'')  then begin
{    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with PartDescription do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(StrGrid.Cells[ACol,ARow]);
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
}
 {   if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      //PartSelectForm:=TPartSelectForm.Create(Self,StrGrid.Cells[ACol,ARow],'PurchaseOrder');
      //PartSelectForm.Left:=R.Left+Left+5;
      //PartSelectForm.Top:=R.Top+Top+20;
       PartSelectFormGrid:=TPartSelectFormGrid.Create(Self,StrGrid.Cells[ACol,ARow],'PurchaseOrder');
    end;
    if (ACol = 2) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 4) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with PriceUnit do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
  end; }
end;

procedure TPurchaseOrder.GridCell(Str:String);
var IntCount:Integer;
begin
  RefreshPart;
 // MessageBox(0,PChar(Str),'Kiriman',MB_OK or MB_ICONERROR);
  for IntCount:=0 to Length(PartDetailArr)-1 do
    if Str=PartDetailArr[IntCount][0] then begin
      StrGrid.Cells[1,IntRow]:=PartDetailArr[IntCount][1];
      StrGrid.Cells[3,IntRow]:=PartDetailArr[IntCount][2];
      if PartDetailArr[IntCount][3]<>'' then StrGrid.Cells[4,IntRow]:=SToCurr(PartDetailArr[IntCount][3]);
      Calculate;
    end;
end;

procedure TPurchaseOrder.PartDescriptionExit(Sender: TObject);
begin
  if Trim(PartDescription.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=PartDescription.Text;
    Calculate;
  end;
  PartDescription.ItemIndex:=-1;
  PartDescription.Text:='';
  PartDescription.Visible:= False;
  StrGrid.SetFocus;
end;

procedure TPurchaseOrder.PartNumberExit(Sender: TObject);
begin
  if Trim(PartNumber.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=PartNumber.Text;
    Calculate;
  end;
  PartNumber.ItemIndex:=-1;
  PartNumber.Text:='';
  PartNumber.Visible:= False;
  StrGrid.SetFocus;
end;

procedure TPurchaseOrder.QtyExit(Sender: TObject);
var IsOk:Boolean;
begin
  IsOk:=True;
  if Trim(Qty.Text)<>'' then begin
    StrGrid.Cells[2,IntRow]:=SToCurr(Qty.Text);
    Calculate;
    if StrToInt(StrGrid.Cells[7,IntRow])>0 then begin
      if isLock Then begin
        if (StrToInt(StrGrid.Cells[2,IntRow])>StrToInt(StrGrid.Cells[7,IntRow])) then begin
          MessageBox(0,'Jumlah Quantity tidak boleh lebih besar dari PR','Purchase Order',MB_OK or MB_ICONERROR);
          Qty.Text:=StrGrid.Cells[2,IntRow];
          Qty.SetFocus;
          IsOk:=False;
        end;
      end;
    end;
  end;
  if IsOk then begin
    Qty.Visible:=False;
    StrGrid.SetFocus;
  end
end;

procedure TPurchaseOrder.PriceUnitExit(Sender: TObject);
var IsOk:Boolean;
begin
  IsOk:=True;
  if Trim(PriceUnit.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(PriceUnit.Text);
    Calculate;
    if StrToInt(StrGrid.Cells[8,IntRow])>0 then begin
      if isLock Then begin
        if StrToInt(Trim(PriceUnit.Text))>StrToInt(StrGrid.Cells[8,IntRow]) then begin
          MessageBox(0,'Harga satuan tidak boleh lebih besar dari PR','Purchase Order',MB_OK or MB_ICONERROR);
          PriceUnit.SetFocus;
          IsOk:=False;
        end;
      end;
    end;
  end;
  if IsOk then begin
    PriceUnit.Visible := False;
    StrGrid.SetFocus;
  end;
end;

procedure TPurchaseOrder.PriceUnitKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    PriceUnitExit(nil);
{    if StrGrid.Row=StrGrid.RowCount-1 then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[5,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:=1;
}
  end;
  if (Key=#27) then begin
    PriceUnitExit(nil);
  end;
end;

procedure TPurchaseOrder.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
  end;
  StrGrid.Col:=3;
end;

procedure TPurchaseOrder.PriceUnitEnter(Sender: TObject);
begin
  if Trim(PriceUnit.Text)<>'' then PriceUnit.Text:=ToString(PriceUnit.Text);
end;

procedure TPurchaseOrder.QtyEnter(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then Qty.Text:=ToString(Qty.Text);
end;

procedure TPurchaseOrder.PartDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    PartDescriptionExit(nil);
    StrGrid.Col:=2;
  end;
end;

procedure TPurchaseOrder.PartNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    PartNumberExit(nil);
    StrGrid.Col:=3;
  end;
end;

procedure TPurchaseOrder.SetPRNo(Str:String);
begin
  PRNo.Text:=Str;
  LoadData;
end;

procedure TPurchaseOrder.CreatePOClick(Sender: TObject);
var IntCount,IntCount2:Integer;
    IsEmpty:Boolean;
begin
  if (StrGridPR.Cells[5,IntUpRow]<>'') and (StrGridPR.Cells[6,IntUpRow]='') then begin
    IntCount:=1;
    IsEmpty:=False;
    repeat
      Inc(IntCount);
      if (StrGrid.Cells[6,IntCount-1]='') then IsEmpty:=True;
    until (IntCount>StrGrid.RowCount-1) or (IsEmpty);
    if (IntCount>StrGrid.RowCount-1) then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount2:=0 to 4 do StrGrid.Cells[IntCount2,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[5,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    StrGridPR.Cells[6,IntUpRow]:='R';
    StrGridPR.CellStyle[0,IntUpRow].BGColor:=clGreen;
    StrGridPR.CellStyle[1,IntUpRow].BGColor:=clGreen;
    StrGridPR.CellStyle[2,IntUpRow].BGColor:=clGreen;
    StrGridPR.CellStyle[3,IntUpRow].BGColor:=clGreen;
    StrGridPR.CellStyle[4,IntUpRow].BGColor:=clGreen;
    StrGrid.Cells[2,IntCount-1]:=StrGridPR.Cells[2,IntUpRow];
    if StrGridPR.Cells[3,IntUpRow]<>'' then StrGrid.Cells[4,IntCount-1]:=StrGridPR.Cells[3,IntUpRow];
    StrGrid.Cells[6,IntCount-1]:=StrGridPR.Cells[5,IntUpRow];
    StrGrid.Cells[7,IntCount-1]:=ToString(StrGridPR.Cells[2,IntUpRow]);
    StrGrid.Cells[8,IntCount-1]:=ToString(StrGridPR.Cells[3,IntUpRow]);

    StrGrid.CellStyle[2,IntCount-1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount-1].HorizontalAlignment:=taRightJustify;
    Calculate;
  end;
end;

procedure TPurchaseOrder.StrGridPRSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntUpRow:=ARow;
  IntUpCol:=ACol;
end;

procedure TPurchaseOrder.StrGridPRDblClick(Sender: TObject);
begin
  CreatePO.Click;
end;

procedure TPurchaseOrder.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshPart;
end;

procedure TPurchaseOrder.VendorEnter(Sender: TObject);
begin
  RefreshCombo;
end;

procedure TPurchaseOrder.TaxCheckClick(Sender: TObject);
begin
  Calculate;
end;

procedure TPurchaseOrder.PRNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Vendor.SetFocus;
end;

procedure TPurchaseOrder.VendorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Lokasi.SetFocus;
end;

procedure TPurchaseOrder.LokasiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PaymentTerm.SetFocus;
end;

procedure TPurchaseOrder.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrVendorId,StrPaymentId,StrPRNo,StrLocationId,StrPartDetailId,StrCompanyCode:String;
    StrCancel,StrRemark:String;
    IntCount,IntCount2:Integer;
    IsOk,IsComplete:Boolean;
begin
  if (Trim(PRNo.Text)<>'') AND (Trim(VendorID_Disp.Text)<>'') AND (Trim(Lokasi.Text)<>'') and (Trim(PaymentTerm.Text)<>'')then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrPRNo:=Trim(PRNo.Text);
//      for IntCount:=0 to Length(LocationArr)-1 do
//        if Lokasi.Text=LocationArr[IntCount][1] then StrLocationId:=LocationArr[IntCount][0];
      StrLocationId:=LocationArr[Lokasi.ItemIndex][0];
//      for IntCount:=0 to Length(VendorArr)-1 do
//        if Vendor.Text=VendorArr[IntCount][1] then StrVendorId:=VendorArr[IntCount][0];
      StrVendorId:= VendorID_Disp.Text; //Vendor.Text;
      StrCompanyCode:=SBUCode.Text;
      StrPaymentId:=PaymentTermArr[PaymentTerm.ItemIndex][0];
      if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
      if ((PONo.Text<>'') and (VendorId<>StrVendorId)) then begin
        StrQry:='UPDATE wh_purchase_order SET cancel=1 WHERE purchase_order_id='+QuotedStr(PONo.Text)+' ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=E.Message;
          end;
        end;
      end;
      if ( (PONo.Text='') or ((PONo.Text<>'') and (VendorId<>StrVendorId)) ) and (IsOk) then begin
        StrQry:='SELECT RIGHT(MAX(purchase_order_id),4) AS purchase_order_id FROM wh_purchase_order '+
                'WHERE purchase_order_id  LIKE '+Chr(39)+'POD'+CompanyCode+LocationCode+DepartmentCode+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['purchase_order_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['purchase_order_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='POD'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_purchase_order (purchase_order_id,purchase_request_id,vendor_id'+
                ',orderer_id,order_date,payment_term_id,delivery_date,delivery_company_location_id'+
                ',tax,description,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+QuotedStr(StrPRNo)+','+QuotedStr(StrVendorId)+
                ',dbo.GetUserId('+QuotedStr(RequestedBy.Text)+'),GETDATE(),'+StrPaymentId+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalKirim.Date))+
                ','+StrLocationId+','+ToString(Tax.Text)+','+StrRemark+','+QuotedStr(User)+');';
      end else begin
          StrTransId:=PONo.Text;
          if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
          StrQry:='UPDATE wh_purchase_order SET vendor_id='+QuotedStr(StrVendorId)+',payment_term_id='+StrPaymentId+
                  ',delivery_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalKirim.Date))+
                  ',delivery_company_location_id='+StrLocationId+',tax='+ToString(Tax.Text)+',cancel='+StrCancel+
                  ',description='+StrRemark+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE purchase_order_id='+QuotedStr(StrTransId)+' ;';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try

        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      if Batal.Checked=False then begin
        if (PONo.Text<>'') and (VendorId=StrVendorId)  then begin
          StrQry:='UPDATE wh_purchase_order_detail SET cancel=1 '+
                  ' WHERE purchase_order_id='+QuotedStr(PONo.Text)+' ;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMessage:=E.Message;
            end;
          end;
          StrQry:='';
        end;
        StrQry:='';
        for IntCount:=1 to StrGrid.RowCount-1 do begin
          if (Trim(StrGrid.Cells[1,IntCount])<>'') AND (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
           // for IntCount2:=0 to Length(PartDetailArr)-1 do
           //   if StrGrid.Cells[1,IntCount]=PartDetailArr[IntCount2][1] then StrPartDetailId:=PartDetailArr[IntCount2][0];

            StrQry:=StrQry+' INSERT INTO wh_purchase_order_detail (purchase_order_id,purchase_request_detail_id'+
                    ',part_detail_id,quantity,price_unit,total,update_user) '+
                    ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrGrid.Cells[6,IntCount])+
                    ','+QuotedStr(StrGrid.Cells[5,IntCount])+','+StrGrid.Cells[2,IntCount]+
                    ','+ToString(StrGrid.Cells[3,IntCount])+','+ToString(StrGrid.Cells[4,IntCount])+
                    ','+QuotedStr(User)+');';
          end;
        end;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=StrEMessage+' '+E.Message;
          end;
        end;
       // IsComplete:=True;
       // for IntCount:=1 to StrGridPR.RowCount-1 do
       // if StrGridPR.Cells[6,IntCount]<>'R' then IsComplete:=False;
       // if IsComplete=True then begin
          StrQry:='UPDATE wh_purchase_request SET complete=1 WHERE purchase_request_id='+QuotedStr(StrPRNo)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMessage:=StrEMessage+' '+E.Message;
            end;
          end;
       // end;
      end;

      if IsOk then begin
        Main.TransCommit;
        PONo.Text:=StrTransId;
        Tanggal.Text:=Main.WhatDate;
        if Batal.Checked=False then
          if MessageBox(0,PChar('PR Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Purchase Request',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
            Reprint(StrTransId);
          end;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('PR Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Purchase Request',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else
    if SToInt(BudgetSisa.Text)-SToInt(Total.Text)<0 then
      MessageBox(0,'Dana Budget Kurang, Silahkan Tambah Budget','Purchase Request',MB_OK or MB_ICONERROR)
    else MessageBox(0,'Silahkan Lengkapi Kolom Yang kosong','Purchase Request',MB_OK or MB_ICONERROR);
end;

procedure TPurchaseOrder.DisableInput;
begin
  PRNo.Enabled:=False;
  PanelCari.Enabled:=False;
  GroupPO.Enabled:=False;
  GroupFooter.Enabled:=False;
  CreatePO.Enabled:=False;
  IsInputGrid:=False;
  Simpan.Enabled:=False;
end;

procedure TPurchaseOrder.EnableInput;
begin
  PRNo.Enabled:=True;
  PanelCari.Enabled:=True;
  GroupPO.Enabled:=True;
  GroupFooter.Enabled:=True; 
  CreatePO.Enabled:=True;
  IsInputGrid:=True;
  Simpan.Enabled:=True;
end;

procedure TPurchaseOrder.TanggalKirimKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Remark.SetFocus;
end;

procedure TPurchaseOrder.PaymentTermKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TanggalKirim.SetFocus;
end;

procedure TPurchaseOrder.RemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TPurchaseOrder.CetakUlangClick(Sender: TObject);
begin
  Reprint(PONo.Text);
//  if Main.IsFormOpen('PurchaseOrderList')=False then PurchaseOrderList:=TPurchaseOrderList.Create(Self,'PurchaseOrder','Reprint',1)
//  else MessageBox(0,PChar('Silahkan Tutup Jendela List Purchase Order dahulu'),'Purchase Order',MB_OK or MB_ICONERROR);
//  PreparePrint;
//  Reprint('');
end;

procedure TPurchaseOrder.CariVendorClick(Sender: TObject);
begin
  VendorList:=TVendorList.Create(Self,'PO Create',True);
end;

procedure TPurchaseOrder.VendorID_DispChange(Sender: TObject);
begin
  if Trim(VendorID_Disp.Text)<>'' then begin
   // PaymentTerm.ItemIndex:=PaymentTerm.Items.IndexOf(VendorArr[Vendor.ItemIndex][2])
   { VendorDisp.Text:=VendorArr[Vendor.ItemIndex][1];
    if VendorArr[Vendor.ItemIndex][2]<>'' then PaymentTerm.ItemIndex:=PaymentTerm.Items.IndexOf(VendorArr[Vendor.ItemIndex][2])
    else PaymentTerm.ItemIndex:=-1;  }
  end;

end;

procedure TPurchaseOrder.Chk_PembelianClick(Sender: TObject);
begin
 if Chk_Pembelian.Checked then begin
   Remark.Text := 'Lampirkan uji emisi ' + #13#10 +
                  'dan vendor memenuhi perundang-undagan yang berlaku';
 end else Remark.Text := '';
end;

end.
