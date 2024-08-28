unit ContractU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, ZColorStringGrid, Buttons, ExtCtrls, WHUnit;

type
  TContract = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ContractId: TEdit;
    GroupHeader: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    CustomerDisp: TEdit;
    CustomerId: TEdit;
    PanelCariCustomer: TPanel;
    CariCustomer: TSpeedButton;
    GroupDiscount: TGroupBox;
    Label6: TLabel;
    GroupOrder: TGroupBox;
    StrGrid: TZColorStringGrid;
    Product: TComboBox;
    DiscountDetailPrice: TMemo;
    DiscountDetailPercent: TMemo;
    DetailRemark: TMemo;
    FixedPriceWeekday: TMemo;
    Panel2: TPanel;
    DiscountPrice: TEdit;
    DiscountPercent: TEdit;
    Label7: TLabel;
    Label1: TLabel;
    DateStart: TDateTimePicker;
    Label5: TLabel;
    DateFinish: TDateTimePicker;
    Label8: TLabel;
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    Label9: TLabel;
    FixedPriceWeekend: TMemo;
    FixedPriceOvertime: TMemo;
    LabelSegment1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBatal: TPanel;
    Batal: TCheckBox;
    Label12: TLabel;
    PaymentTerm: TComboBox;
    Label13: TLabel;
    CreditLimit: TMemo;
    ContactId: TEdit;
    ContactDisp: TEdit;
    PanelCariKontak: TPanel;
    CariKontak: TSpeedButton;
    Label14: TLabel;
    Remark: TMemo;
    Address: TMemo;
    HeaderRemark: TMemo;
    Label15: TLabel;
    FixedInvoice: TCheckBox;
    FixedPriceOverday: TMemo;
    AllCustomer: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CariCustomerClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DiscountDetailPriceExit(Sender: TObject);
    procedure DiscountDetailPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountDetailPercentExit(Sender: TObject);
    procedure DiscountDetailPercentKeyPress(Sender: TObject;
      var Key: Char);
    procedure DetailRemarkExit(Sender: TObject);
    procedure DetailRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProductExit(Sender: TObject);
    procedure ProductKeyPress(Sender: TObject; var Key: Char);
    procedure ProductChange(Sender: TObject);
    procedure FixedPriceWeekdayExit(Sender: TObject);
    procedure FixedPriceWeekdayKeyPress(Sender: TObject; var Key: Char);
    procedure FixedPriceWeekendExit(Sender: TObject);
    procedure FixedPriceWeekendKeyPress(Sender: TObject; var Key: Char);
    procedure FixedPriceOvertimeExit(Sender: TObject);
    procedure FixedPriceOvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure DiscountPriceEnter(Sender: TObject);
    procedure DiscountPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPercentKeyPress(Sender: TObject; var Key: Char);
    procedure DiscountPriceExit(Sender: TObject);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartKeyPress(Sender: TObject; var Key: Char);
    procedure DateFinishKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CreditLimitKeyPress(Sender: TObject; var Key: Char);
    procedure PaymentTermKeyPress(Sender: TObject; var Key: Char);
    procedure CreditLimitEnter(Sender: TObject);
    procedure CreditLimitExit(Sender: TObject);
    procedure ProductKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FixedPriceWeekdayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FixedPriceWeekendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FixedPriceOvertimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiscountDetailPercentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CariKontakClick(Sender: TObject);
    procedure FixedPriceOverdayExit(Sender: TObject);
    procedure FixedPriceOverdayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FixedPriceOverdayKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    IntRow,IntCol,MinRowGrid:Integer;
    ProductArr,PaymentTermArr:Array of TArrString10;
    IsInputGrid,IsInput:Boolean;
    ContrtId:String;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshProduct;
    procedure LoadData;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure CheckProduct;
  public
    { Public declarations }
    procedure SetCustomerId(Customer_Id:String);
    procedure SetContactId(Contact_Id:String);
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Contract_Id:String;Is_Input:Boolean=True);Overload;
  end;

var
  Contract: TContract;

implementation

uses MainU, DateUtils, ADODB, CustomerListU, Math, CustomerU;

{$R *.dfm}

constructor TContract.Create(AOwner:TComponent);
begin
  IsInput:=True;
  IsInputGrid:=True;
  inherited Create(AOwner);
end;

constructor TContract.Create(AOwner:TComponent;Contract_Id:String;Is_Input:Boolean=True);
begin
  ContrtId:=Contract_Id;
  IsInput:=Is_Input;
  IsInputGrid:=Is_Input;
  Main.WriteLog('Form Open: Contract='+Contract_Id+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TContract.Init;
begin
  ContractId.Text:='';
  CustomerId.Text:='';
  CustomerDisp.Text:='';
  Address.Text:='';
  DiscountPrice.Text:='0';
  DiscountPercent.Text:='0';
  Remark.Text:='';
  DateStart.Date:=Now();
  DateFinish.Date:=IncYear(Now());
  PaymentTerm.ItemIndex:=-1;
  PaymentTerm.Clear;
  PaymentTerm.Text:='';
  CreditLimit.Text:='';
  FixedPriceWeekday.Text:='';
  FixedPriceWeekend.Text:='';
  FixedPriceOvertime.Text:='';
  DiscountDetailPrice.Text:='';
  DiscountDetailPercent.Text:='';
  DetailRemark.Text:='';
  PanelCariCustomer.Enabled:=True;
  Batal.Checked:=False;
  AllCustomer.Checked:=False;
  if ContrtId<>'' then Batal.Visible:=True
  else Batal.Visible:=False;
  Bersihkan.Enabled:=True;
  FixedInvoice.Checked:=False; 
end;

procedure TContract.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=16;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=240;
  StrGrid.ColWidths[1]:=60;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=60;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=40;
  StrGrid.ColWidths[11]:=210;
  StrGrid.ColWidths[12]:=0;
  StrGrid.ColWidths[13]:=0;
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,8,0);
  StrGrid.MergeCells.AddRectXY(9,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.RowHeights[0]:=22;
  StrGrid.RowHeights[1]:=22;
  StrGrid.Cells[0,0]:='Product';
  StrGrid.Cells[1,0]:='Harga Publish';
  StrGrid.Cells[4,0]:='Harga Tetap';
  StrGrid.Cells[9,0]:='Discount';
  StrGrid.Cells[11,0]:='Keterangan';
  StrGrid.Cells[1,1]:='Weekday';
  StrGrid.Cells[2,1]:='Weekend';
  StrGrid.Cells[3,1]:='Overtime';
  StrGrid.Cells[4,1]:='Overday';
  StrGrid.Cells[5,1]:='Weekday';
  StrGrid.Cells[6,1]:='Weekend';
  StrGrid.Cells[7,1]:='Overtime';
  StrGrid.Cells[8,1]:='Overday';
  StrGrid.Cells[9,1]:='Rp';
  StrGrid.Cells[10,1]:='%';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1  do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TContract.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_payment_term WHERE active=1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PaymentTermArr,Qry.RecordCount+1);
    PaymentTermArr[0][0]:=' ';
    PaymentTermArr[0][1]:=' ';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PaymentTermArr[IntCount][0]:=Qry.FieldValues['payment_term_id'];
      PaymentTermArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(PaymentTermArr)-1 do
    PaymentTerm.Items.Add(PaymentTermArr[IntCount][1]);
  Main.M_Normal;
  RefreshProduct;
end;

procedure TContract.RefreshProduct;
var Qry:TADOQuery;
    StrQry,StrContractId,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrCompanyId:=CompanyId;
    StrLocationId:=',@LocationId='+LocationId;
    if Trim(ContractId.Text)<>'' then StrContractId:=',@ContractId='+QuotedStr(Trim(ContractId.Text)) else StrContractId:='';
    StrQry:='EXEC GetProductPriceList '+StrCompanyId+StrLocationId+',@FullList=1'+StrContractId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(ProductArr,Qry.RecordCount+1);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['product_price_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'];
      ProductArr[IntCount][2]:=Qry.FieldValues['price_weekday'];
      ProductArr[IntCount][3]:=Qry.FieldValues['price_weekend'];
      ProductArr[IntCount][4]:=Qry.FieldValues['price_overtime'];
      ProductArr[IntCount][5]:=Qry.FieldValues['seat'];
      ProductArr[IntCount][6]:=Qry.FieldValues['full_day'];
      ProductArr[IntCount][7]:=Qry.FieldValues['price_overday'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Product.Items.Clear;
  for IntCount:=0 to Length(ProductArr)-1 do
    Product.Items.Add(ProductArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TContract.CheckProduct;
begin
  if Product.Text<>'' then begin
  if ProductArr[Product.ItemIndex][1]<>'' then begin
    StrGrid.Cells[1,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][2]);
    StrGrid.Cells[2,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][3]);
    StrGrid.Cells[3,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][4]);
    StrGrid.Cells[4,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][7]);
    StrGrid.Cells[7,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][4]);
    StrGrid.Cells[8,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][7]);
    if StrGrid.Cells[9,IntRow]='' then StrGrid.Cells[9,IntRow]:='0';
    if StrGrid.Cells[10,IntRow]='' then StrGrid.Cells[10,IntRow]:='0';
    StrGrid.Cells[12,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][2]);
    StrGrid.Cells[13,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][3]);
    StrGrid.Cells[14,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][4]);
    StrGrid.Cells[15,IntRow]:=SToCurr(ProductArr[Product.ItemIndex][6]);
    StrGrid.CellStyle[1,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[3,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntRow].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntRow].HorizontalAlignment:=taRightJustify;
  end;
  end;
end;


procedure TContract.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetContractDetail '+QuotedStr(ContrtId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ContractId.Text:=Qry.FieldValues['cust_contract_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      if Qry.FieldValues['contact_person_id']<>NULL then begin
        ContactId.Text:=Qry.FieldValues['contact_person_id'];
        if Qry.FieldValues['contact_person']<>NULL then ContactDisp.Text:=Qry.FieldValues['contact_person'];
      end;
      CustomerDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['title']<>NULL then CustomerDisp.Text:=Qry.FieldValues['title']+' '+CustomerDisp.Text;
      if Qry.FieldValues['alias']<>NULL then CustomerDisp.Text:=CustomerDisp.Text+' ('+Qry.FieldValues['alias']+')';
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+IntToStr(Qry.FieldValues['zip'])
      else Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['customer_remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['customer_remark'];
      DateStart.Date:=StrToDate(Qry.FieldValues['from_date']);
      DateFinish.Date:=StrToDate(Qry.FieldValues['to_date']);
      if Qry.FieldValues['term_name']<>NULL then PaymentTerm.ItemIndex:=PaymentTerm.Items.IndexOf(Qry.FieldValues['term_name']);
      if Qry.FieldValues['credit_limit_total']<>NULL then CreditLimit.Text:=IToCurr(Qry.FieldValues['credit_limit_total']) else CreditLimit.Text:='0' ;
      if Qry.FieldValues['discount_price']<>NULL then DiscountPrice.Text:=IToCurr(Qry.FieldValues['discount_price']) else DiscountPrice.Text:='0';
      if Qry.FieldValues['discount_percent']<>NULL then DiscountPercent.Text:=Qry.FieldValues['discount_percent'] else DiscountPercent.Text:='0';
      if Qry.FieldValues['fixed_invoice']<>NULL then FixedInvoice.Checked:=True;
      if Qry.FieldValues['all_cust']>0 then AllCustomer.Checked:=True;
      if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  RefreshGrid;
end;

procedure TContract.RefreshGrid;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetContractDetailDetail '+QuotedStr(ContrtId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    StrGrid.RowCount:=Qry.RecordCount+3;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['name'];
      StrGrid.Cells[1,IntCount]:=IToCurr(Qry.FieldValues['price_weekday']);
      StrGrid.Cells[2,IntCount]:=IToCurr(Qry.FieldValues['price_weekend']);
      StrGrid.Cells[3,IntCount]:=IToCurr(Qry.FieldValues['price_overtime']);
      StrGrid.Cells[4,IntCount]:=IToCurr(Qry.FieldValues['price_overday']);
      if Qry.FieldValues['fixed_weekday']<>NULL then StrGrid.Cells[5,IntCount]:=IToCurr(Qry.FieldValues['fixed_weekday']);
      if Qry.FieldValues['fixed_weekend']<>NULL then StrGrid.Cells[6,IntCount]:=IToCurr(Qry.FieldValues['fixed_weekend']);
      if Qry.FieldValues['fixed_overtime']<>NULL then StrGrid.Cells[7,IntCount]:=IToCurr(Qry.FieldValues['fixed_overtime']);
      if Qry.FieldValues['fixed_overday']<>NULL then StrGrid.Cells[8,IntCount]:=IToCurr(Qry.FieldValues['fixed_overday']);
      StrGrid.Cells[9,IntCount]:=IToCurr(Qry.FieldValues['discount_price']);
      StrGrid.Cells[10,IntCount]:=Qry.FieldValues['discount_percent'];
      if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[11,IntCount]:=Qry.FieldValues['remark'];
      StrGrid.Cells[12,IntCount]:=Qry.FieldValues['price_weekday'];
      StrGrid.Cells[13,IntCount]:=Qry.FieldValues['price_weekend'];
      StrGrid.Cells[14,IntCount]:=Qry.FieldValues['price_overtime'];
      StrGrid.Cells[15,IntCount]:=Qry.FieldValues['full_day'];
      StrGrid.CellStyle[1,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[9,IntCount].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[10,IntCount].HorizontalAlignment:=taRightJustify;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TContract.SetCustomerId(Customer_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerDetail '+Customer_Id+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      if Qry.FieldValues['title']<>NULL then CustomerDisp.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else CustomerDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+IntToStr(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['remark']<>NULL then HeaderRemark.Text:=Qry.FieldValues['remark'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  DateStart.SetFocus;
end;

procedure TContract.SetContactId(Contact_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetContactPersonDetail '+Contact_Id+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ContactId.Text:=Qry.FieldValues['contact_person_id'];
      if Qry.FieldValues['title']<>NULL then ContactDisp.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else ContactDisp.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then Address.Text:=Qry.FieldValues['address']+','+Qry.FieldValues['zip']
      else if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TContract.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if ContrtId<>'' then begin
    LoadData;
    RefreshGrid;
    Bersihkan.Enabled:=False;
    RefreshProduct;
  end;
  if IsInput=True then begin
    EnableInput;
  end else begin
    DisableInput;
  end;
end;

procedure TContract.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupHeader.Enabled:=False;
  GroupDiscount.Enabled:=False;
  Remark.ReadOnly:=True;
//  GroupOrder.Enabled:=False;
end;

procedure TContract.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupHeader.Enabled:=True;
  GroupDiscount.Enabled:=True;
  Remark.ReadOnly:=False;
//  GroupOrder.Enabled:=True;
end;

procedure TContract.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrCustomerId,StrDateStart,StrdateFinish,StrDiscountPrice,StrDiscountPercent,StrRemark:String;
    StrStatus,StrCreditLimit,StrPaymentTerm,StrFixedWeekday,StrFixedWeekend,StrFixedOvertime,StrProduct,StrContactId,StrFixedInvoice:String;
    StrTransId,StrEMsg,StrFixedOverday,StrAllCustomer:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (CustomerId.Text<>'') then begin
    if MessageBox(0,'Data Kontrak yang diisi sudah benar ?','Data Kontrak',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.M_Busy;
      if Main.OpenDb then begin
        DisableInput;
        Main.TransStart;
        IsOk:=True;
        StrCompanyId:=CompanyId;
        StrCustomerId:=QuotedStr(CustomerId.Text);
        StrDateStart:=QuotedStr(FormatDateTime('yyyy-mm-dd',DateStart.Date));
        StrdateFinish:=QuotedStr(FormatDateTime('yyyy-mm-dd',DateFinish.Date));
        if ContactId.Text<>'' then StrContactId:=QuotedStr(ContactId.Text) else StrContactId:='NULL';
        if Trim(PaymentTerm.Text)<>'' then StrPaymentTerm:=QuotedStr(PaymentTermArr[PaymentTerm.ItemIndex][0])
        else StrPaymentTerm:='NULL';
        if (Trim(CreditLimit.Text)<>'') then StrCreditLimit:=QuotedStr(ToString(CreditLimit.Text))
        else StrCreditLimit:='NULL';
        if (Trim(DiscountPrice.Text)<>'') then StrDiscountPrice:=QuotedStr(ToString(DiscountPrice.Text))
        else StrDiscountPrice:='NULL';
        if (Trim(DiscountPercent.Text)<>'') then StrDiscountPercent:=QuotedStr(ToString(DiscountPercent.Text))
        else StrDiscountPercent:='NULL';
        if FixedInvoice.Checked then StrFixedInvoice:='1' else StrFixedInvoice:='NULL';
        if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
        if AllCustomer.Checked=True then StrAllCustomer:='1' else StrAllCustomer:='0';
        if Batal.Visible=True then if Batal.Checked then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';
        if (ContrtId<>'')  then begin
          StrTransId:=ContrtId;
          StrQry:='UPDATE wh_cust_contract SET contact_person_id='+StrContactId+',from_date='+StrDateStart+
                  ',to_date='+StrdateFinish+',discount_price='+StrDiscountPrice+
                  ',discount_percent='+StrDiscountPercent+',payment_term_id='+StrPaymentTerm+
                  ',fixed_invoice='+StrFixedInvoice+',credit_limit_total='+StrCreditLimit+',status='+StrStatus+
                  ',all_cust='+StrAllCustomer+',remark='+StrRemark+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE cust_contract_id='+QuotedStr(StrTransId)+';';
          if StrStatus='1' then begin
            StrQry:=StrQry+'UPDATE wh_cust_contract_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (cust_contract_id='+QuotedStr(StrTransId)+') AND (status=1);';
          end;
        end else begin
          StrQry:='SELECT RIGHT(MAX(cust_contract_id),3) AS max_id FROM wh_cust_contract '+
                  'WHERE cust_contract_id  LIKE '+QuotedStr(CompanyShortCode+'/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  '.'+FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/MKT/CT'+
                  '___')+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrTransId:=Qry.FieldValues['max_id'];
            StrTransId:=Format('%.*d',[3,StrToInt(StrTransId)+1]);
            Qry.Close;
            Qry.SQL.Clear;
          end else
            StrTransId:='001';
          StrTransId:=CompanyShortCode+'/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      '.'+FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/MKT/CT'+StrTransId;
          StrQry:='INSERT INTO wh_cust_contract (cust_contract_id,company_id,customer_id,contact_person_id'+
                  ',from_date,to_date,discount_price,discount_percent,payment_term_id,credit_limit_total'+
                  ',fixed_invoice,all_cust,remark,update_user) VALUES '+
                  '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrCustomerId+','+StrContactId+','+StrDateStart+
                  ','+StrdateFinish+','+StrDiscountPrice+','+StrDiscountPercent+','+StrPaymentTerm+
                  ','+StrCreditLimit+','+StrFixedInvoice+','+StrAllCustomer+','+StrRemark+','+QuotedStr(User)+');';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end;
        end;
        StrQry:='';
        if StrStatus='1' then
          for IntCount:=1 to StrGrid.RowCount-1 do
            if (Trim(StrGrid.Cells[0,IntCount])<>'') and (Trim(StrGrid.Cells[1,IntCount])<>'') then begin
              StrProduct:=QuotedStr(ProductArr[Product.Items.IndexOf(StrGrid.Cells[0,IntCount])][0]);
              if (Trim(StrGrid.Cells[5,IntCount])<>'') then StrFixedWeekday:=QuotedStr(ToString(StrGrid.Cells[5,IntCount]))
              else StrFixedWeekday:='NULL';
              if (Trim(StrGrid.Cells[6,IntCount])<>'') then StrFixedWeekend:=QuotedStr(ToString(StrGrid.Cells[6,IntCount]))
              else StrFixedWeekend:='NULL';
              if (Trim(StrGrid.Cells[7,IntCount])<>'') then StrFixedOvertime:=QuotedStr(ToString(StrGrid.Cells[7,IntCount]))
              else StrFixedOvertime:='NULL';
              if (Trim(StrGrid.Cells[8,IntCount])<>'') then StrFixedOverday:=QuotedStr(ToString(StrGrid.Cells[8,IntCount]))
              else StrFixedOverday:='NULL';
              if (Trim(StrGrid.Cells[9,IntCount])<>'') then StrDiscountPrice:=QuotedStr(ToString(StrGrid.Cells[9,IntCount]))
              else StrDiscountPrice:='NULL';
              if (Trim(StrGrid.Cells[10,IntCount])<>'') then StrDiscountPercent:=QuotedStr(ToString(StrGrid.Cells[10,IntCount]))
              else StrDiscountPercent:='NULL';
              if Trim(StrGrid.Cells[11,IntCount])<>'' then StrRemark:=QuotedStr(Trim(StrGrid.Cells[11,IntCount])) else StrRemark:='NULL';
              StrQry:=StrQry+'INSERT INTO wh_cust_contract_detail (cust_contract_id,product_price_id,fixed_weekday'+
                      ',fixed_weekend,fixed_overtime,fixed_overday,discount_price,discount_percent,remark,update_user) VALUES '+
                      '('+QuotedStr(StrTransId)+','+StrProduct+','+StrFixedWeekday+','+StrFixedWeekend+
                      ','+StrFixedOvertime+','+StrFixedOverday+','+StrDiscountPrice+','+StrDiscountPercent+','+StrRemark+','+QuotedStr(User)+');';
          end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMsg:=StrEMsg+E.Message;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          ContractId.Text:=StrTransId;
          MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Kontrak',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          Main.WriteLog('Form Save: Fail='+StrEMsg,1);
          MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Data Kontrak',MB_OK or MB_ICONERROR);
          EnableInput;
        end;
      end;
      FreeAndNil(Qry)
    end;
  end else
  MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Data Produk',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TContract.CariCustomerClick(Sender: TObject);
begin
  CustomerList:=TCustomerList.Create(Self,'BUS','Contract-Create');
end;

procedure TContract.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) then begin
    if (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        0:with Product do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left+60;
            Height := (R.Bottom + 1) - R.Top;
            ItemIndex:=Items.IndexOf(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        5:with FixedPriceWeekday do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        6:with FixedPriceWeekend do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        7:with FixedPriceOvertime do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        8:with FixedPriceOverday do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        9:with DiscountDetailPrice do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=ToString(StrGrid.Cells[ACol,ARow]);
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        10:with DiscountDetailPercent do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        11:with DetailRemark do begin
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
    end;
  end;
end;

procedure TContract.DiscountDetailPriceExit(Sender: TObject);
begin
  if DiscountDetailPrice.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(DiscountDetailPrice.Text);
    DiscountDetailPrice.Text:='';
  end;
  DiscountDetailPrice.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.DiscountDetailPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPriceExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.DiscountDetailPercentExit(Sender: TObject);
begin
  if DiscountDetailPercent.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=DiscountDetailPercent.Text;
    DiscountDetailPercent.Text:='';
  end;
  DiscountDetailPercent.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.DiscountDetailPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    DiscountDetailPercentExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.DetailRemarkExit(Sender: TObject);
begin
  if DetailRemark.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=DetailRemark.Text;
    DetailRemark.Text:='';
  end;
  DetailRemark.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.DetailRemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    DetailRemarkExit(nil);
    StrGrid.Col:=0;
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
end;

procedure TContract.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TContract.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TContract.ProductExit(Sender: TObject);
var IntCount:Integer;
begin
  StrGrid.Cells[0,IntRow]:=Product.Text;
  StrGrid.CellStyle[IntCol,IntRow].WordWrap:=False;
  if (StrGrid.Row=StrGrid.RowCount-1) and (StrGrid.RowCount>MinRowGrid+1) and (Product.Text<>'') then begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to 5 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.CellStyle[1,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  Product.Text:='';
  Product.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.ProductKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    ProductExit(nil);
    StrGrid.Col:=1;
  end;
end;

procedure TContract.ProductChange(Sender: TObject);
begin
  CheckProduct;
end;

procedure TContract.FixedPriceWeekdayExit(Sender: TObject);
begin
  if FixedPriceWeekday.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(FixedPriceWeekday.Text);
    FixedPriceWeekday.Text:='';
  end;
  FixedPriceWeekday.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.FixedPriceWeekdayKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    FixedPriceWeekdayExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.FixedPriceWeekendExit(Sender: TObject);
begin
  if FixedPriceWeekend.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(FixedPriceWeekend.Text);
    FixedPriceWeekend.Text:='';
  end;
  FixedPriceWeekend.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.FixedPriceWeekendKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    FixedPriceWeekendExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.FixedPriceOvertimeExit(Sender: TObject);
begin
  if FixedPriceOvertime.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(FixedPriceOvertime.Text);
    FixedPriceOvertime.Text:='';
  end;
  FixedPriceOvertime.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.FixedPriceOvertimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    FixedPriceOvertimeExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.DiscountPriceEnter(Sender: TObject);
begin
  if Trim(DiscountPrice.Text)<>'' then DiscountPrice.Text:=ToString(DiscountPrice.Text);
end;

procedure TContract.DiscountPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPercent.SetFocus;
end;

procedure TContract.DiscountPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Remark.SetFocus;
end;

procedure TContract.DiscountPriceExit(Sender: TObject);
begin
  if Trim(DiscountPrice.Text)<>'' then DiscountPrice.Text:=SToCurr(DiscountPrice.Text)
  else DiscountPrice.Text:='0';
end;

procedure TContract.RemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then StrGrid.SetFocus;
end;

procedure TContract.DateStartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then DateFinish.SetFocus;
end;

procedure TContract.DateFinishKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PaymentTerm.SetFocus;
end;

procedure TContract.DateStartChange(Sender: TObject);
begin
  if DateFinish.Date<=DateStart.Date then
    DateFinish.Date:=IncYear(DateStart.Date);
end;

procedure TContract.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  EnableInput;
end;

procedure TContract.CreditLimitKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DiscountPrice.SetFocus;
end;

procedure TContract.PaymentTermKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CreditLimit.SetFocus;
end;

procedure TContract.CreditLimitEnter(Sender: TObject);
begin
  if Trim(CreditLimit.Text)<>'' then CreditLimit.Text:=ToString(CreditLimit.Text);
end;

procedure TContract.CreditLimitExit(Sender: TObject);
begin
  if Trim(CreditLimit.Text)<>'' then CreditLimit.Text:=SToCurr(CreditLimit.Text)
  else CreditLimit.Text:='0';
end;

procedure TContract.ProductKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RIGHT then begin
    ProductExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

procedure TContract.FixedPriceWeekdayKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    FixedPriceWeekdayExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    FixedPriceWeekdayExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.FixedPriceWeekendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    FixedPriceWeekendExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    FixedPriceWeekendExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.FixedPriceOvertimeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    FixedPriceOvertimeExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    FixedPriceOvertimeExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.DiscountDetailPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DiscountDetailPriceExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DiscountDetailPriceExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.DiscountDetailPercentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DiscountDetailPercentExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DiscountDetailPercentExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.DetailRemarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    DetailRemarkExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    DetailRemarkExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.CariKontakClick(Sender: TObject);
begin
  If CustomerId.Text<>'' then begin
    Customer:=TCustomer.Create(Self,CustomerId.Text,'Bus',False,'Contract-Create')
  end;
end;

procedure TContract.FixedPriceOverdayExit(Sender: TObject);
begin
  if FixedPriceOverday.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(FixedPriceOverday.Text);
    FixedPriceOverday.Text:='';
  end;
  FixedPriceOverday.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TContract.FixedPriceOverdayKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then begin
    FixedPriceOverdayExit(nil);
    if (StrGrid.RowCount-1)>StrGrid.Row then StrGrid.Row:=StrGrid.Row+1;
  end;
  if Key=VK_UP then begin
    FixedPriceOverdayExit(nil);
    if (MinRowGrid+1)<StrGrid.Row then StrGrid.Row:=StrGrid.Row-1;
  end;
end;

procedure TContract.FixedPriceOverdayKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    FixedPriceOverdayExit(nil);
    StrGrid.Col:=StrGrid.Col+1;
  end;
end;

end.
