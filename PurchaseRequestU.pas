unit PurchaseRequestU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ZColorStringGrid, WHUnit, ADODB,
  QRCtrls, jpeg, QuickRpt, Buttons, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, ppDB, DB;

type
  TPurchaseRequest = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Tanggal: TEdit;
    Label2: TLabel;
    RequestedBy: TEdit;
    VendorName: TEdit;
    Label3: TLabel;
    Attn: TEdit;
    Label4: TLabel;
    Referensi: TEdit;
    Label5: TLabel;
    PRNo: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Budget: TComboBox;
    Panel1: TPanel;
    BudgetDisp: TEdit;
    ItemDetail: TEdit;
    Qty: TEdit;
    PriceUnit: TEdit;
    StrGrid: TZColorStringGrid;
    Panel2: TPanel;
    SubTotal: TMemo;
    Tax: TMemo;
    Total: TMemo;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BudgetTotal: TMemo;
    BudgetTerpakai: TMemo;
    BudgetSisa: TMemo;
    Label15: TLabel;
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QLogo: TQRImage;
    QCompany: TQRLabel;
    QPhone: TQRLabel;
    QAddress: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QFax: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QVendorName: TQRLabel;
    QAttn: TQRLabel;
    QBudgetId: TQRLabel;
    QPRNo: TQRLabel;
    QDate: TQRLabel;
    QRef: TQRLabel;
    QRBand2: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QNo: TQRDBText;
    QItemDetail: TQRDBText;
    QQty: TQRDBText;
    QPrice: TQRDBText;
    QTotalLine: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QPaymentTerm: TQRLabel;
    QBudgetRequested: TQRLabel;
    QBudgetValue: TQRLabel;
    QRequestorName: TQRLabel;
    QRShape4: TQRShape;
    QApproveName: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape13: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QSubTotal: TQRLabel;
    QTax: TQRLabel;
    QTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel23: TQRLabel;
    QNotes: TQRLabel;
    Label16: TLabel;
    Label17: TLabel;
    SBU: TComboBox;
    GroupFooter: TPanel;
    Batal: TCheckBox;
    Label18: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TaxCheck: TCheckBox;
    Label8: TLabel;
    PanelCari: TPanel;
    Cari: TSpeedButton;
    Panel4: TPanel;
    PBJNo: TEdit;
    Complete: TCheckBox;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLogo: TppImage;
    ppCompany: TppLabel;
    ppAddress: TppMemo;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppPhone: TppLabel;
    ppFax: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine3: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape1: TppShape;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppBudgetValue: TppLabel;
    ppBudgetRequested: TppLabel;
    ppPaymentTerm: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppRequestorName: TppLabel;
    ppApproveName: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppShape2: TppShape;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel33: TppLabel;
    ppNotes: TppLabel;
    ppVendorName: TppLabel;
    ppAttn: TppLabel;
    ppBudgetId: TppLabel;
    ppPRNo: TppLabel;
    ppDate: TppLabel;
    ppRef: TppLabel;
    ppNo: TppDBText;
    ppItemDetail: TppDBText;
    ppQty: TppDBText;
    ppPrice: TppDBText;
    ppTotalLine: TppDBText;
    ppSubTotal: TppLabel;
    ppTax: TppLabel;
    ppTotal: TppLabel;
    ppLine22: TppLine;
    Label14: TLabel;
    Rev: TEdit;
    CariVendor: TSpeedButton;
    VendorID: TEdit;
    TambahBarang: TButton;
    CariBudget: TSpeedButton;
    BudgetCoa: TEdit;
    BudgetId: TEdit;
    Chk_Pembelian: TCheckBox;
    Remark: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ItemDetailExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure PriceUnitKeyPress(Sender: TObject; var Key: Char);
    procedure PriceUnitExit(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure ItemDetailKeyPress(Sender: TObject; var Key: Char);
    procedure TaxCheckClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure BudgetChange(Sender: TObject);
    procedure BudgetKeyPress(Sender: TObject; var Key: Char);
    procedure VendorNameKeyPress(Sender: TObject; var Key: Char);
    procedure AttnKeyPress(Sender: TObject; var Key: Char);
    procedure ReferensiKeyPress(Sender: TObject; var Key: Char);
    procedure PaymentTermKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PriceUnitEnter(Sender: TObject);
    procedure SBUKeyPress(Sender: TObject; var Key: Char);
    procedure SBUChange(Sender: TObject);
    procedure CariClick(Sender: TObject);
    procedure CariVendorClick(Sender: TObject);
    procedure TambahBarangClick(Sender: TObject);
    procedure CariBudgetClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Chk_PembelianClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitBudget;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshBudget;
    procedure LoadData;
    procedure LoadDataPBJ;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure SetPoint(PointValue:Integer);
    procedure CommitPriceUnit;
       // procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
  public
    { Public declarations }
    procedure SetPBJNo(Str:String);
    procedure Reprint(Purchase_Id:String);
    constructor Create(AOwner:TComponent;PurchaseRequest_Id:String='';IsRead_Only:Boolean=False);Overload;
  end;

var
  PurchaseRequest: TPurchaseRequest;
  PurchaseRequestId:String;
  IntRow,IntCol,MinRowGrid,IntMaxRow:Integer;
  BudgetArr,PaymentTermArr,CompanyArr:Array of TArrString5;
  IsInputGrid,IsReadOnly:Boolean;
  StrBudgetId:String;

implementation

uses MainU, PurchaseRequestListU, RePrintFormU, ItemServiceRequestListU,
  VendorListU, BrowsePartU, BudgetViewU, ListPartsU, PartDetailListU;

{$R *.dfm}

constructor TPurchaseRequest.Create(AOwner:TComponent;PurchaseRequest_Id:String='';IsRead_Only:Boolean=False);
begin
  PurchaseRequestId:=PurchaseRequest_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;


procedure TPurchaseRequest.Init;
begin
  IntMaxRow:=8;
  Tanggal.Text:='';
  PRNo.Text:='';
  RequestedBy.Text:=FullName;
  SBU.Text:='';
  SBU.ItemIndex:=-1;
  SBU.Items.Clear;
  VendorName.Text:='';
  Attn.Text:='';
  Referensi.Text:='';
  MinRowGrid:=0;
  IntCol:=0;
  IntRow:=0;
  TaxCheck.Checked:=True;
  SubTotal.Text:='';
  Tax.Text:='';
  Total.Text:='';
//  PaymentTerm.Items.Clear;
//  PaymentTerm.Text:='';
//  PaymentTerm.ItemIndex:=-1;
  Remark.Text:='';
//  IsInputGrid:=False;
  StrBudgetId:='';
  PBJNo.Text:='';
  Complete.Checked:=False;
  ppCompany.Caption:='';
  ppAddress.Caption:='';
  ppPhone.Caption:='';
  ppFax.Caption:='';
  ppVendorName.Caption:='';
  ppAttn.Caption:='';
  ppBudgetId.Caption:='';
  ppPRNo.Caption:='';
  ppDate.Caption:='';
  ppRef.Caption:='';
  ppSubTotal.Caption:='';
  ppTax.Caption:='';
  ppTotal.Caption:='';
  ppPaymentTerm.Caption:='';
  ppBudgetRequested.Caption:='';
  ppBudgetValue.Caption:='';
  ppRequestorName.Caption:='';
  ppApproveName.Caption:='';
  ppNotes.Caption:='';
  Batal.Checked:=False;
  Rev.Text:='0';
end;

procedure TPurchaseRequest.InitBudget;
begin
  Budget.Items.Clear;
  Budget.Text:='';
  Budget.ItemIndex:=-1;
  BudgetDisp.Text:='';
  BudgetTotal.Text:='';
  BudgetTerpakai.Text:='';
  BudgetSisa.Text:='';
end;

procedure TPurchaseRequest.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=350;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=0;
  StrGrid.ColWidths[6]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Barang/Jasa';
  StrGrid.Cells[2,0]:='Qty';
  StrGrid.Cells[3,0]:='Harga Satuan';
  StrGrid.Cells[4,0]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 6 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseRequest.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if CompanyId='1' then
      StrQry:='EXEC GetCompanyLocationList ;' 
    else
      StrQry:='EXEC GetCompanyLocationList '+CompanyId+','+LocationId+';' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Inc(IntCount);
      Qry.Next;
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
  for IntCount:=0 to Length(CompanyArr)-1  do
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
//  for IntCount:=0 to Length(PaymentTermArr)-1  do
//    PaymentTerm.Items.Add(PaymentTermArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TPurchaseRequest.RefreshBudget;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  InitBudget;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrQry:='EXEC GetUserBudget '+QuotedStr(User)+','+FormatDateTime('mm',Now())+','+FormatDateTime('yyyy',Now())+','+StrCompanyId+','+StrLocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BudgetArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      BudgetArr[IntCount][0]:=Qry.FieldValues['coa_id'];
      BudgetArr[IntCount][1]:=Qry.FieldValues['name'];
      BudgetArr[IntCount][2]:=Qry.FieldValues['value'];
      BudgetArr[IntCount][3]:=Qry.FieldValues['budget_used'];
      BudgetArr[IntCount][4]:=Qry.FieldValues['budget_id'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(BudgetArr)-1  do
    Budget.Items.Add(BudgetArr[IntCount][0]);
  Main.M_Normal;
end;

procedure TPurchaseRequest.Calculate;
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
    if (Trim(StrGrid.Cells[1,IntCount])<>'') AND (Trim(StrGrid.Cells[2,IntCount])<>'') AND (Trim(StrGrid.Cells[3,IntCount])<>'') then begin
      if (Trim(StrGrid.Cells[2,IntCount])<>'0') AND (Trim(StrGrid.Cells[3,IntCount])<>'0') then begin
        IntTotal:=SToInt(ToString(StrGrid.Cells[2,IntCount]))*SToInt(ToString(StrGrid.Cells[3,IntCount]));
        IntSubTotal:=IntSubTotal+IntTotal;
        StrGrid.Cells[4,IntCount]:=IToCurr(IntTotal);
      end
    end else
        StrGrid.Cells[4,IntCount]:='';
  end;
  SubTotal.Text:=IToCurr(IntSubTotal);
  if (TaxCheck.Checked)  then
    if IntTotal>0 then IntTax:=Integer(Round((IntSubTotal*11)/100));
  Tax.Text:=IToCurr(IntTax);
  Total.Text:=IToCurr(IntSubTotal+IntTax);
end;

procedure TPurchaseRequest.SelesaiClick(Sender: TObject);
begin
  PurchaseRequest.Close;
end;

procedure TPurchaseRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseRequest.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if PurchaseRequestId<>'' then begin
    LoadData;
  end;
end;

procedure TPurchaseRequest.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if IsInputGrid then begin
   { if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with ItemDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end; }

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
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;

    if (ACol = 3) and (ARow > MinRowGrid) then begin
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
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
  end;
end;

procedure TPurchaseRequest.ItemDetailExit(Sender: TObject);
begin
  if Trim(ItemDetail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=ItemDetail.Text;
    Calculate;
  end else begin
    StrGrid.Cells[IntCol,IntRow]:=ItemDetail.Text;
    StrGrid.Cells[2,IntRow]:='';
    StrGrid.Cells[3,IntRow]:='';
    Calculate;
  end;
//  ItemDetail.Text:='';
  ItemDetail.Visible := False;
  StrGrid.SetFocus;
end;

procedure TPurchaseRequest.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    ItemDetailExit(nil);
    StrGrid.Col:=3;
  end;
end;

{procedure TPurchaseRequest.PriceUnitKeyPress(Sender: TObject;
  var Key: Char);
var IntCount:Integer;
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    PriceUnitExit(nil);
    if (StrGrid.Row=StrGrid.RowCount-1) AND (StrGrid.RowCount<=IntMaxRow)  then begin
      //StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.Col:=0;
    //StrGrid.Row:=StrGrid.Row+1;
    //StrGrid.Col:=1;
  end;
  if (Key=#27) then begin
    PriceUnitExit(nil);
  end;
end;}

procedure TPurchaseRequest.CommitPriceUnit;
begin
  if Trim(PriceUnit.Text) <> '' then begin
    PriceUnit.Text := SToCurr(ToString(PriceUnit.Text));
    StrGrid.Cells[IntCol, IntRow] := PriceUnit.Text;
    Calculate;
  end;
end;

{procedure TPurchaseRequest.PriceUnitKeyPress(Sender: TObject; var Key: Char);
var 
  IntCount: Integer;
begin
   if StrGrid.Cells[1,IntRow]<>'' then begin
    // Pastikan input hanya angka, backspace, atau enter
      if not (Key in ['0'..'9', #8, #13]) then
      begin
        Key := #0; 
        Exit;
      end;

      if (Key = #13) then 
      begin
        PriceUnitExit(nil);
        // Cek apakah posisi di baris terakhir dan belum mencapai batas maksimal
        if (StrGrid.Row = StrGrid.RowCount - 1) AND (StrGrid.RowCount < IntMaxRow) then 
        begin
          // 1. Tambah baris baru
          StrGrid.RowCount := StrGrid.RowCount + 1;

          // 2. Set format kolom setelah menambah baris [cite: 15]
          StrGrid.CellStyle[2, StrGrid.RowCount - 1].HorizontalAlignment := taCenter;
          StrGrid.CellStyle[3, StrGrid.RowCount - 1].HorizontalAlignment := taRightJustify;
          StrGrid.CellStyle[4, StrGrid.RowCount - 1].HorizontalAlignment := taRightJustify;
      
          // Pindahkan fokus ke baris baru
          StrGrid.Row := StrGrid.RowCount - 1;
          StrGrid.Col := 1; 
        end;

        // Menghilangkan bunyi "bip" sistem saat menekan Enter 
        Key := #0; 
      end else if (Key = #27) then
      begin
        PriceUnitExit(nil);
      end;
    end; 
end;  }

procedure TPurchaseRequest.PriceUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then begin
    Key := #0; Exit;
  end;

  if (Key = #13) then begin
    // 1. Simpan Data (Sama dengan prosedur CommitPriceUnit Anda)
    if Trim(PriceUnit.Text) <> '' then begin
       PriceUnit.Text := SToCurr(ToString(PriceUnit.Text));
       StrGrid.Cells[IntCol, IntRow] := PriceUnit.Text;
       Calculate;
       StrGrid.CellStyle[0, IntRow].HorizontalAlignment := taLeftJustify;
       StrGrid.CellStyle[3, IntRow].HorizontalAlignment := taRightJustify;
       StrGrid.CellStyle[4, IntRow].HorizontalAlignment := taRightJustify;
    end;

    // 2. Tentukan Alur Fokus
    // Jika baris terakhir, tambah baris (Fokus tetap di Grid)
    if (StrGrid.Row = StrGrid.RowCount - 1) AND (StrGrid.RowCount < IntMaxRow) then begin
       StrGrid.RowCount := StrGrid.RowCount + 1;
       StrGrid.Row := StrGrid.RowCount - 1;
       StrGrid.Col := 1;
       // Karena tambah baris, kita tidak pindah ke tombol
    end 
    else begin
       // Jika bukan baris terakhir, pindah ke tombol
       TambahBarang.SetFocus;
    end;

    // 3. Bersihkan editor & Sembunyikan
    PriceUnit.Text := ''; 
    PriceUnit.Visible := False;
    
    Key := #0; // Matikan bunyi "bip"
  end 
  else if (Key = #27) then begin
    PriceUnit.Text := '';
    PriceUnit.Visible := False;
  end;
end;

procedure TPurchaseRequest.PriceUnitExit(Sender: TObject);
begin
  {if StrGrid.Cells[1,IntRow]<>'' then begin
    if Trim(PriceUnit.Text)<>'' then begin
      PriceUnit.Text:=SToCurr(ToString(PriceUnit.Text));
      StrGrid.Cells[IntCol,IntRow]:=PriceUnit.Text;
     Calculate;
    end;
    CommitPriceUnit; // Panggil prosedur simpan
    PriceUnit.Text:='';
    PriceUnit.Visible := False;
    TambahBarang.SetFocus;
  end else
    MessageBox(0,PChar('Item masih kosong'),'Purchase Request',MB_OK or MB_ICONWARNING); }
  // Hanya simpan jika ada nilai
  // FIX: baris ini sebelumnya hilang sehingga harga tidak masuk ke grid saat Tab ditekan (OnExit
  // tidak menulis ke StrGrid). CommitPriceUnit sudah menangani convert+tulis ke grid+Calculate.
  CommitPriceUnit;
  PriceUnit.Text := '';
  PriceUnit.Visible := False;
end;

procedure TPurchaseRequest.QtyExit(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then begin
    Qty.Text:=SToCurr(ToString(Qty.Text));
    StrGrid.Cells[IntCol,IntRow]:=Qty.Text;
    Calculate;
  end;
  Qty.Text:='';
  Qty.Visible := False;
  StrGrid.SetFocus;
end;

procedure TPurchaseRequest.ItemDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    ItemDetailExit(nil);
    StrGrid.Col:=2;
  end;
end;

procedure TPurchaseRequest.TaxCheckClick(Sender: TObject);
begin
  Calculate;
end;

procedure TPurchaseRequest.BersihkanClick(Sender: TObject);
begin
  Init;
  InitBudget;
  InitGrid;
  RefreshCombo;
  EnableInput;
end;

procedure TPurchaseRequest.BudgetChange(Sender: TObject);
begin
  if Trim(Budget.Text)<>'' then begin
    BudgetDisp.Text:=BudgetArr[Budget.ItemIndex][1];
    BudgetTotal.Text:=SToCurr(BudgetArr[Budget.ItemIndex][2]);
    BudgetTerpakai.Text:=SToCurr(BudgetArr[Budget.ItemIndex][3]);
    BudgetSisa.Text:=IToCurr(SToInt(BudgetArr[Budget.ItemIndex][2])-SToInt(BudgetArr[Budget.ItemIndex][3]));
    IsInputGrid:=True;
    StrBudgetId:=BudgetArr[Budget.ItemIndex][4]
  end else begin
    BudgetTotal.Text:='0';
    BudgetTerpakai.Text:='0';
    BudgetSisa.Text:='0';
    IsInputGrid:=False;
  end;
end;

procedure TPurchaseRequest.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId,StrDepartmentId,StrPaymentId,StrRemark,StrCompanyCode:String;
    StrPBJNo,StrCancel,StrItemRequestDetailId,StrPriceUnit,StrTotalPrice, StrItemDetailId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (BudgetId.Text<>'') AND (Trim(BudgetCoa.Text)<>'') AND(SToInt(BudgetSisa.Text)-SToInt(Total.Text)>=0)
  and (Trim(Total.Text)<>'') and (Trim(Total.Text)<>'0')  then begin //(StrBudgetId<>'') AND //(Trim(Budget.Text)<>'') AND
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrCompanyCode:=CompanyArr[SBU.ItemIndex][5];
      StrLocationId:=CompanyArr[SBU.ItemIndex][2];
//      StrPaymentId:=PaymentTermArr[PaymentTerm.ItemIndex][0];
      StrDepartmentId:=DepartmentId;
      if Trim(PBJNo.Text)<>'' then StrPBJNo:=QuotedStr(PBJNo.Text) else StrPBJNo:='NULL';   
      if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';

      if PRNo.Text='' then begin
        StrQry:='SELECT RIGHT(MAX(purchase_request_id),4) AS purchase_request_id FROM wh_purchase_request '+
                'WHERE purchase_request_id  LIKE '+Chr(39)+'PRQ'+CompanyCode+LocationCode+DepartmentCode+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['purchase_request_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['purchase_request_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='PRQ'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrBudgetId := BudgetId.Text;
        StrQry:='INSERT INTO wh_purchase_request (purchase_request_id,item_request_id,budget_id,company_id,location_id'+
                ',department_id,requester_id,request_date,vendor_name,attn,referensi'+
                ',tax,description,update_user, vendor_id) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrPBJNo+','+QuotedStr(StrBudgetId)+','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+
                ','+QuotedStr(DepartmentId)+',dbo.GetUserId('+QuotedStr(RequestedBy.Text)+'),GETDATE(),'+
                QuotedStr(Trim(VendorName.Text))+','+QuotedStr(Trim(Attn.Text))+
                ','+QuotedStr(Trim(Referensi.Text))+','+ToString(Tax.Text)+
                ','+StrRemark+','+QuotedStr(User)+','+QuotedStr(VendorID.Text)+');';
        StrQry:=StrQry+'INSERT INTO wh_budget_detail (budget_id,form_name,form_id,value,update_user) VALUES ('+
                       QuotedStr(Trim(StrBudgetId))+','+QuotedStr('wh_purchase_request')+','+QuotedStr(StrTransId)+
                       ','+IntToStr(0-SToInt(ToString(Total.Text)))+
                       ','+QuotedStr(User)+');';
      end else begin
        StrTransId:=PRNo.Text;
        if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
        StrQry:='UPDATE wh_purchase_request SET budget_id='+QuotedStr(StrBudgetId)+',company_id='+QuotedStr(StrCompanyId)+
                ',location_id='+QuotedStr(StrLocationId)+',department_id='+QuotedStr(DepartmentId)+
                ',requester_id=dbo.GetUserId('+QuotedStr(RequestedBy.Text)+'),vendor_name='+QuotedStr(Trim(VendorName.Text))+
                ',attn='+QuotedStr(Trim(Attn.Text))+',referensi='+QuotedStr(Trim(Referensi.Text))+
                ',tax='+ToString(Tax.Text)+',description='+StrRemark+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+',cancel='+StrCancel+',rev='+Rev.Text+ 
                ',vendor_id='+QuotedStr(VendorID.Text)+
                ' WHERE purchase_request_id='+QuotedStr(StrTransId)+';';
        if Batal.Checked=False then begin
          StrQry:=StrQry+' UPDATE wh_budget_detail SET value=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE form_id='+QuotedStr(StrTransId)+';';
        end;
      end;
        if Complete.Checked then begin
          StrQry:=StrQry+' UPDATE wh_item_request SET complete=1 WHERE item_request_id='+StrPBJNo+';';
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
      StrQry:='';

      if Batal.Checked=False then begin
        if Trim(PRNo.Text)<>'' then begin
          StrQry:='UPDATE wh_purchase_request_detail SET cancel=1 WHERE purchase_request_id='+QuotedStr(StrTransId)+';';
        end;
        for IntCount:=1 to StrGrid.RowCount-1 do begin
          if (Trim(StrGrid.Cells[1,IntCount])<>'') AND (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
            if StrGrid.Cells[5,IntCount]<>'' then StrItemRequestDetailId:=QuotedStr(StrGrid.Cells[5,IntCount])
            else StrItemRequestDetailId:='NULL';

            if StrGrid.Cells[6,IntCount]<>'' then StrItemDetailId:=QuotedStr(StrGrid.Cells[6,IntCount])
            else StrItemDetailId:='NULL';

            if (ToString(StrGrid.Cells[3,IntCount])<>'') then StrPriceUnit:=ToString(StrGrid.Cells[3,IntCount]) else StrPriceUnit:='0';;
            if (ToString(StrGrid.Cells[4,IntCount])<>'') then StrTotalPrice:=ToString(StrGrid.Cells[4,IntCount]) else StrTotalPrice:='0';
            StrQry:=StrQry+' INSERT INTO wh_purchase_request_detail (purchase_request_id'+
                    ',item_request_detail_id,item_detail,quantity,price_unit,total,update_user,item_detail_id) '+
                    ' VALUES ('+QuotedStr(StrTransId)+','+StrItemRequestDetailId+
                    ','+QuotedStr(StrGrid.Cells[1,IntCount])+
                    ','+StrGrid.Cells[2,IntCount]+','+StrPriceUnit+
                    ','+StrTotalPrice+','+QuotedStr(User)+','+StrItemDetailId+');';
          end;
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
      if IsOk then begin
        Main.TransCommit;
        if Batal.Checked=False then begin
          PRNo.Text:=StrTransId;
          Tanggal.Text:=Main.WhatDate;
          if MessageBox(0,PChar('PR Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Purchase Request',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
            Reprint(StrTransId);
          end;
        end;
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,PChar('PR Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Purchase Request',MB_OK or MB_ICONERROR);
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

procedure TPurchaseRequest.DisableInput;
begin
  SBU.Enabled:=False;
  Budget.Enabled:=False;
  VendorName.Enabled:=False;
  Attn.Enabled:=False;
  Referensi.Enabled:=False;
//  PaymentTerm.Enabled:=False;
  Complete.Enabled:=False;
  PanelCari.Enabled:=False;
  GroupFooter.Enabled:=False;
  IsInputGrid:=False;
  Remark.Enabled:=False;
  Simpan.Enabled:=False;
  TambahBarang.Enabled:=False;
end;
procedure TPurchaseRequest.EnableInput;
begin
  SBU.Enabled:=True;
  Budget.Enabled:=True;
  VendorName.Enabled:=True;
  Attn.Enabled:=True;
  Referensi.Enabled:=True;
  PanelCari.Enabled:=True;
//  PaymentTerm.Enabled:=True;
  Complete.Enabled:=True;
  GroupFooter.Enabled:=True;
  Remark.Enabled:=True;
  Simpan.Enabled:=True;
  TambahBarang.Enabled:=True;
end;

procedure TPurchaseRequest.SetPBJNo(Str:String);
begin
  PBJNo.Text:=Str;
  LoadDataPBJ;
end;

procedure TPurchaseRequest.LoadDataPBJ;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetItemRequestDetail '+QuotedStr(Trim(PBJNo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+1;
      while not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        StrGrid.Cells[1,IntCount+1]:=Qry.FieldValues['item_detail'];
        StrGrid.Cells[2,IntCount+1]:=Qry.FieldValues['quantity'];
        StrGrid.Cells[5,IntCount+1]:=Qry.FieldValues['item_request_detail_id'];
        StrGrid.Cells[6,IntCount+1]:=Qry.FieldValues['item_detail_id'];
        StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;
        Inc(IntCount);
        Qry.Next;
      end;
      Complete.Checked:=True; 
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseRequest.LoadData;
var Qry:TADOQuery;
    StrQry,StrBudget,StrBudgetTerpakai,StrBudgetTotal:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPurchaseRequestResume '+QuotedStr(PurchaseRequestId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BudgetArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      //Qry.FieldValues['name']
      Tanggal.Text:=Qry.FieldValues['request_dates'];
      PRNo.Text:=PurchaseRequestId;
      SBU.ItemIndex:=SBU.Items.IndexOf(Qry.FieldValues['company_name']+' ('+Qry.FieldValues['location']+')');
      StrBudget:=Qry.FieldValues['coa_id'];
      StrBudgetId:=Qry.FieldValues['budget_id'];
      BudgetId.Text := Qry.FieldValues['budget_id'];
      BudgetCoa.Text := Qry.FieldValues['coa_id'];
      BudgetDisp.Text := Qry.FieldValues['name'];
      if Qry.FieldValues['vendor_id'] <> Null then VendorID.Text := Qry.FieldValues['vendor_id']
      else VendorID.Text :='';
      VendorName.Text:=Qry.FieldValues['vendor_name'];
      if Qry.FieldValues['attn']<> Null then Attn.Text:=Qry.FieldValues['attn']
      else Attn.Text:= '';
      Referensi.Text:=Qry.FieldValues['referensi'];
      if Qry.FieldValues['description'] <> Null then Remark.Text := Qry.FieldValues['description']
      else Remark.Text := '';
//      PaymentTerm.ItemIndex:=Qry.FieldValues['payment_term_id']-1;
      RequestedBy.Text:=Qry.FieldValues['user_name'];
      if Qry.FieldValues['tax']>0 then TaxCheck.Checked:=True else TaxCheck.Checked:=False;
      SubTotal.Text:=SToCurr(Qry.FieldValues['total']);
      Tax.Text:=SToCurr(Qry.FieldValues['tax']);
      Total.Text:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['tax']);
      StrBudgetTotal:=SToCurr(Qry.FieldValues['value']);
//      BudgetTerpakai.Text:=IToCurr(Qry.FieldValues['budget_used']-(Qry.FieldValues['total']+Qry.FieldValues['tax']));
      StrBudgetTerpakai:=IToCurr(Qry.FieldValues['budget_used']);
//      StrQry:='SELECT * FROM wh_purchase_request_detail WHERE purchase_request_id='+QuotedStr(PurchaseRequestId)+';';
      Rev.Text:=Qry.FieldValues['rev']+1;
      if Qry.FieldValues['cancel']<>NULL then
        if Qry.FieldValues['cancel']=1 then begin
          DisableInput;
          Batal.Checked:=True;
        end;
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetPurchaseRequestDetail '+QuotedStr(PurchaseRequestId)+';';
    IntCount:=0;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+1;
      while not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        StrGrid.Cells[1,IntCount+1]:=Qry.FieldValues['item_detail'];
        StrGrid.Cells[2,IntCount+1]:=Qry.FieldValues['quantity'];
        StrGrid.Cells[3,IntCount+1]:=SToCurr(Qry.FieldValues['price_unit']);
        StrGrid.Cells[4,IntCount+1]:=SToCurr(Qry.FieldValues['total']);
        //StrGrid.Cells[5,IntCount+1]:=Qry.FieldValues['item_request_detail_id'];
        StrGrid.Cells[6,IntCount+1]:=Qry.FieldValues['item_detail_id'];
        StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;
        if Qry.FieldValues['purchase_order_detail_id']<>NULL then begin
          StrGrid.CellStyle[0,IntCount+1].BGColor:=clGreen;
          StrGrid.CellStyle[1,IntCount+1].BGColor:=clGreen;
          StrGrid.CellStyle[2,IntCount+1].BGColor:=clGreen;
          StrGrid.CellStyle[3,IntCount+1].BGColor:=clGreen;
          StrGrid.CellStyle[4,IntCount+1].BGColor:=clGreen;
        end else begin
          StrGrid.CellStyle[0,IntCount+1].BGColor:=clWindow;
          StrGrid.CellStyle[1,IntCount+1].BGColor:=clWindow;
          StrGrid.CellStyle[2,IntCount+1].BGColor:=clWindow;
          StrGrid.CellStyle[3,IntCount+1].BGColor:=clWindow;
          StrGrid.CellStyle[4,IntCount+1].BGColor:=clWindow;
        end;
      Inc(IntCount);
      Qry.Next;
      end;
    end;
  end;
  Qry.Destroy;
  Main.CloseDb;
 // RefreshBudget;
 // Budget.ItemIndex:=Budget.Items.IndexOf(StrBudget);
  BudgetTotal.Text:=StrBudgetTotal;
  BudgetTerpakai.Text:=StrBudgetTerpakai;
  BudgetSisa.Text:=IToCurr(SToInt(StrBudgetTotal)-SToInt(StrBudgetTerpakai));
  if IsInputGrid=False then  DisableInput;
  Main.M_Normal;
end;

procedure TPurchaseRequest.PreparePrint;
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
      ppAddress.Lines.Add(Qry.FieldValues['address']);
      ppPhone.Caption:=Qry.FieldValues['phone_no'];
      ppFax.Caption:=Qry.FieldValues['fax_no'];
      ppCompany.Caption:=Qry.FieldValues['company_name'];
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
    StrQry:='SELECT name FROM wh_user WHERE username='+QuotedStr(User)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppRequestorName.Caption:=Qry.FieldValues['name'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseRequest.Reprint(Purchase_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Purchase Request';
  RePrintForm.ReportId:=Purchase_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetPurchaseRequestResume  '+QuotedStr(Purchase_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppPRNo.Caption:=Purchase_Id;
        ppDate.Caption:=Qry.FieldValues['request_dates'];
        ppBudgetId.Caption:=Qry.FieldValues['coa_id']+'/'+Qry.FieldValues['name'];
        ppVendorName.Caption:=Qry.FieldValues['vendor_name'];
        ppAttn.Caption:=Qry.FieldValues['attn'];
        ppRef.Caption:=Qry.FieldValues['referensi'];
        ppSubTotal.Caption:=SToCurr(Qry.FieldValues['total']);
        ppTax.Caption:=SToCurr(Qry.FieldValues['tax']);
        ppTotal.Caption:=IToCurr(Qry.FieldValues['total']+Qry.FieldValues['tax']);
        ppBudgetValue.Caption:=SToCurr(Qry.FieldValues['value']);
        ppBudgetRequested.Caption:=SToCurr(Qry.FieldValues['total']);
        ppRequestorName.Caption:=Qry.FieldValues['user_name'];
        ppApproveName.Caption:=Qry.FieldValues['user_superior'];
        if Qry.FieldValues['description']<>NULL then ppNotes.Caption:=Qry.FieldValues['description']
        else ppNotes.Caption:='';
      end;
      Qry.Close;
      StrQry:='EXEC GetPurchaseRequestDetailPrint  '+QuotedStr(Purchase_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
{      QReport.DataSet:=Qry;
      QNo.DataSet:=Qry;
      QItemDetail.DataSet:=Qry;
      QQty.DataSet:=Qry;
      QPrice.DataSet:=Qry;
      QTotalLine.DataSet:=Qry;
      Main.M_Normal;
      SetPoint(PrintAddPoint);
      QReport.Prepare;
      QReport.Preview;
      SetPoint(-PrintAddPoint);
}
      Main.M_Normal;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;

procedure TPurchaseRequest.SetPoint(PointValue:Integer);
begin
  QRShape1.Pen.Width:=QRShape1.Pen.Width+PointValue;
  QRShape2.Pen.Width:=QRShape2.Pen.Width+PointValue;
  QRShape3.Pen.Width:=QRShape3.Pen.Width+PointValue;
  QRShape4.Pen.Width:=QRShape4.Pen.Width+PointValue;
  QRShape5.Pen.Width:=QRShape5.Pen.Width+PointValue;
  QRShape6.Pen.Width:=QRShape6.Pen.Width+PointValue;
  QRShape7.Pen.Width:=QRShape7.Pen.Width+PointValue;
  QRShape8.Pen.Width:=QRShape8.Pen.Width+PointValue;
  QRShape9.Pen.Width:=QRShape9.Pen.Width+PointValue;
  QRShape10.Pen.Width:=QRShape10.Pen.Width+PointValue;
  QRShape11.Pen.Width:=QRShape11.Pen.Width+PointValue;
  QRShape12.Pen.Width:=QRShape12.Pen.Width+PointValue;
  QRShape13.Pen.Width:=QRShape13.Pen.Width+PointValue;
  QRShape14.Pen.Width:=QRShape14.Pen.Width+PointValue;
  QRShape15.Pen.Width:=QRShape15.Pen.Width+PointValue;
  QRShape16.Pen.Width:=QRShape16.Pen.Width+PointValue;
  QRShape17.Pen.Width:=QRShape17.Pen.Width+PointValue;
  QRShape18.Pen.Width:=QRShape18.Pen.Width+PointValue;
  QRShape19.Pen.Width:=QRShape19.Pen.Width+PointValue;
  QRShape20.Pen.Width:=QRShape20.Pen.Width+PointValue;
  QRShape21.Pen.Width:=QRShape21.Pen.Width+PointValue;
  QRShape22.Pen.Width:=QRShape22.Pen.Width+PointValue;
  QRShape23.Pen.Width:=QRShape23.Pen.Width+PointValue;
  QRShape24.Pen.Width:=QRShape24.Pen.Width+PointValue;
end;

procedure TPurchaseRequest.BudgetKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then VendorName.SetFocus;
end;

procedure TPurchaseRequest.VendorNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Attn.SetFocus;
end;

procedure TPurchaseRequest.AttnKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Referensi.SetFocus;
end;

procedure TPurchaseRequest.ReferensiKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key = #13 then PaymentTerm.SetFocus;
  if Key = #13 then Remark.SetFocus;
end;

procedure TPurchaseRequest.PaymentTermKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then StrGrid.SetFocus;
end;

procedure TPurchaseRequest.CetakUlangClick(Sender: TObject);
begin
  Reprint(PRNo.Text);
//  if Main.IsFormOpen('PurchaseRequestList')=False then PurchaseRequestList:=TPurchaseRequestList.Create(Self,'PurchaseRequest','Reprint')
 // else MessageBox(0,PChar('Silahkan Tutup Jendela List Purchase Request dahulu'),'Purchase Request',MB_OK or MB_ICONERROR);
end;

procedure TPurchaseRequest.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i: Integer;
begin
  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = 'TQRStandardPreview' then begin
      Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMinimize]; //hides minimize button
      Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMaximize]; //hides maximize button
    end;

end;

procedure TPurchaseRequest.PriceUnitEnter(Sender: TObject);
begin
//  if Trim(PriceUnit.Text)<>'' then PriceUnit.Text:=ToString(PriceUnit.Text);

// Kosongkan agar fresh setiap kali kursor masuk
  // PriceUnit.Text := '';  <-- Pastikan ini dikosongkan jika perlu
  PriceUnit.SelectAll;
end;

procedure TPurchaseRequest.SBUKeyPress(Sender: TObject; var Key: Char);
begin
  //if Key=#13 then Budget.SetFocus;
  //CariBudget.sFocus;
end;

procedure TPurchaseRequest.SBUChange(Sender: TObject);
begin
 // RefreshBudget;
end;

procedure TPurchaseRequest.CariClick(Sender: TObject);
begin
  ItemServiceRequestList:=TItemServiceRequestList.Create(Self,'PurchaseRequest','',DepartmentId);
end;

procedure TPurchaseRequest.CariVendorClick(Sender: TObject);
begin
 VendorList:=TVendorList.Create(Self,'PR Create',True);
end;

procedure TPurchaseRequest.TambahBarangClick(Sender: TObject);
begin
  {if Main.IsFormOpen('BrowsePartU')=False then
  begin
    //BrowsePartVehicleId:=VehicleId;
    BrowsePart:=TBrowsePart.Create(Self,'PURCHESREQUSEST');
  end;}

   if Main.IsFormOpen('PartDetailList')=False then
  begin
    //BrowsePartVehicleId:=VehicleId;
    //ListParts:=TListParts.Create(Self,'PURCHESREQUSEST');
    PartDetailList:=TPartDetailList.Create(Self,'PURCHESREQUSEST');
  end;
end;

procedure TPurchaseRequest.CariBudgetClick(Sender: TObject);
begin
   if Main.IsFormOpen('BudgetViewtU')=False then
  begin
    BudgetView:=TBudgetView.Create(Self,'PURCHESREQUSEST');
  end;
 // CariVendor.SetFocus;
end;

procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;
end;


procedure TPurchaseRequest.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
   var
  IntCount,i:Integer;
  StrNamaPart : string;
begin
  StrNamaPart := StrGrid.Cells[0,IntRow];
  if IntRow>0 then begin
    if Key=VK_DELETE then begin
      if MessageBox(Handle,PChar('Mau Menghapus '+QuotedStr(StrNamaPart)+' ?'),'Item Dipilih',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
       // for IntCount:=0 to StrGridTemp.ColCount-1  do
         // StrGridTemp.Cells[IntCount,IntRowTemp]:= '';
       DeleteRow(StrGrid,IntRow);
       Calculate;
      // TotalTemp.Text:= IntToStr(StrGrid.RowCount-1);
       MessageBox(0,PChar('Item berhasil dihapus.'),'Item Dipilih',MB_OK or MB_ICONINFORMATION);
      end;
    end;
  end;
end;


procedure TPurchaseRequest.Chk_PembelianClick(Sender: TObject);
begin
 if Chk_Pembelian.Checked then begin
   Remark.Text := 'Lampirkan uji emisi ' + #13#10 +
                  'dan vendor harus memenuhi perundang-undagan yang berlaku';
 end else Remark.Text := '';
end;

end.
