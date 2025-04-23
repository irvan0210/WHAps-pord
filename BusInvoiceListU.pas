unit BusInvoiceListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TBusInvoiceList = class(TForm)
    Label2: TLabel;
    ToXCel: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    PanelLegend: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Semua: TCheckBox;
    Last3Months: TCheckBox;
    CariOffering: TSpeedButton;
    GroupBox1: TGroupBox;
    Tunai: TRadioButton;
    Transfer: TRadioButton;
    All: TRadioButton;
    va: TRadioButton;
    CreditLimit: TRadioButton;
    Label5: TLabel;
    Tanggal: TDateTimePicker;
    TanggalSampai: TDateTimePicker;
    Label6: TLabel;
    Button1: TButton;
    NoOrder: TEdit;
    ChkNoOrder: TCheckBox;
    procedure ToXCelClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SemuaClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure Last3MonthsClick(Sender: TObject);
    procedure CariOfferingClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure TunaiClick(Sender: TObject);
    procedure TanggalSampaiChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChkNoOrderClick(Sender: TObject);
    procedure NoOrderKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    TransArr,CompanyArr:Array of TArrString14;
    IntRow,IntCol,IsAll,TransType,MinRowGrid:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Trans_Type:Integer=1);Overload;
    procedure RefreshDisplay;
  end;

var
  BusInvoiceList: TBusInvoiceList;

implementation

uses MainU, ADODB, BusInvoiceU, BusReceivePaymentFormU;

{$R *.dfm}

constructor TBusInvoiceList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  TransType:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TBusInvoiceList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Trans_Type:Integer=1);
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
  TransType:=Trans_Type;
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBusInvoiceList.Init;
begin
  Cari.Text:='';
  ChkNoOrder.Checked:=False;
  NoOrder.Text:='';
  NoOrder.Enabled:=False;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  TanggalSampai.Date:=Now();
//  Tanggal.Enabled:=False;
  Last3Months.Checked:=True;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  Semua.Checked:=False;
  if Semua.Checked then Tanggal.Enabled:=False
  else Tanggal.Enabled:=True;

  All.Checked := True;
  GroupBox1.enabled := False;
  
  if UpperCase(FormRequest)='MAIN-PAYMENT' then begin
    GroupBox1.Visible := True;
    GroupBox1.enabled := True;
  end else if UpperCase(FormRequest)='PAYMENT-RECEIVE' then begin
    GroupBox1.Visible := True;
    //Transfer.Checked := True;
    //GroupBox1.enabled := False;
  end else if UpperCase(FormRequest)='VERIFY-PAYMENT' then begin

  end else GroupBox1.Visible := False;

  if UserLevel<69 then ToXCel.Enabled:=False;
end;

procedure TBusInvoiceList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=14;
  StrGrid.ColWidths[0]:=130;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=110;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=250;
  StrGrid.ColWidths[5]:=180;
  StrGrid.ColWidths[6]:=70;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=120;
  StrGrid.ColWidths[11]:=0;
  StrGrid.ColWidths[12]:=0;
  StrGrid.ColWidths[13]:=0;
  //col 9=status
  //col 10=transaction_id
  StrGrid.Cells[1,0]:='Tgl Invoice';
  StrGrid.Cells[2,0]:='No Pesanan';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Alamat';
  StrGrid.Cells[5,0]:='Produk';
  StrGrid.Cells[6,0]:='Total Invoice';
  StrGrid.Cells[8,0]:='PPH';
  StrGrid.Cells[9,0]:='Total Invoice - PPH';
//  StrGrid.Cells[8,0]:='Jenis Pembayaran';
  StrGrid.Cells[10,0]:='Sales';
  if TransType=1 then begin
    StrGrid.Cells[0,0]:='No Invoice';
//    StrGrid.Cells[7,0]:='Sisa Invoice';
  end else begin
    StrGrid.Cells[0,0]:='No Payment';
    StrGrid.Cells[7,0]:='Pembayaran';
  end;

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
//  StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
//  StrGrid.CellStyle[7,1].HorizontalAlignment:=taRightJustify;
end;

procedure TBusInvoiceList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
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

procedure TBusInvoiceList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrLastPeriode,StrLocationId,StrCompanyId,StrPaymentId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(TransArr,0);
    Qry.CommandTimeout:=3600;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
//    if Semua.Checked=False then StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date)) else StrTanggal:='';
    StrTanggal:=',@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.Date));

    if Last3Months.Checked=False then StrLastPeriode:=',@AllInvoice=1' else StrLastPeriode:='';

    if Tunai.Checked then StrPaymentId:=',@TransactionId='+QuotedStr('10002')
    else if Transfer.Checked then StrPaymentId:=',@TransactionId='+QuotedStr('10003')
    else if VA.Checked then StrPaymentId:=',@TransactionId='+QuotedStr('10007')
    else if CreditLimit.Checked then StrPaymentId:=',@TransactionId='+QuotedStr('10009')
    else StrPaymentId:='';
    if ChkNoOrder.Checked=True then
    StrQry:= 'EXEC GetTransactionList '+StrCompanyId+',@NoOrder='+QuotedStr(Trim(NoOrder.Text))+';'
    else
    StrQry:='EXEC GetTransactionList '+StrCompanyId+StrTanggal+',@Finish='+IntToStr(IsAll)+',@TransType='+IntToStr(TransType)+StrLastPeriode+StrPaymentId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(TransArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TransArr[IntCount][0]:=Qry.FieldValues['invoice_id'];
      TransArr[IntCount][1]:=Qry.FieldValues['submit_dates'];
      TransArr[IntCount][2]:=Qry.FieldValues['form_id'];
      TransArr[IntCount][3]:=Qry.FieldValues['customer_name'];
      if (Qry.FieldValues['zip']<>NULL) and Qry.FieldValues['zip']<>'0' then TransArr[IntCount][4]:=Qry.FieldValues['address']+', '+ToString(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then TransArr[IntCount][4]:=Qry.FieldValues['address'];
      TransArr[IntCount][5]:=Qry.FieldValues['product_detail_resume'];
      if Qry.FieldValues['total']<>NULL then TransArr[IntCount][6]:=Qry.FieldValues['total'];
      if TransType=1 then begin
        TransArr[IntCount][7]:=IToCurr(Qry.FieldValues['total_sisa']);
      end else begin
        TransArr[IntCount][7]:=IToCurr(Qry.FieldValues['payment']);
      end;
      if (Qry.FieldValues['IsUsingTax']=True) then begin
        TransArr[IntCount][8]:=Qry.FieldValues['PphDeduction'];
        TransArr[IntCount][9]:='0';
      end else begin
        TransArr[IntCount][8]:='0';
        TransArr[IntCount][9]:='0';
      end;
//      TransArr[IntCount][8]:=Qry.FieldValues['JenisPembayaran'];
      TransArr[IntCount][12]:=Qry.FieldValues['sales_name'];
      TransArr[IntCount][10]:=Qry.FieldValues['status'];
      TransArr[IntCount][11]:=Qry.FieldValues['transaction_id'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBusInvoiceList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=1 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  if Length(TransArr)>0 then StrGrid.RowCount:=Length(TransArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to Length(TransArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=TransArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=TransArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=TransArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=TransArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=TransArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=TransArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=IToCurr(StrToInt(TransArr[IntCount][6]));
//    StrGrid.Cells[7,IntCount+1]:=TransArr[IntCount][7];
    StrGrid.Cells[7,IntCount+1]:='';
    StrGrid.Cells[8,IntCount+1]:=IToCurr(StrToInt(TransArr[IntCount][8]));
    if StrToInt(TransArr[IntCount][8])<>0 then
    begin
      StrGrid.Cells[9,IntCount+1]:=IToCurr(StrToInt(TransArr[IntCount][6])-StrToInt(TransArr[IntCount][8]));
    end else begin
      StrGrid.Cells[9,IntCount+1]:=IToCurr(StrToInt(TransArr[IntCount][6]));
    end;
    StrGrid.Cells[10,IntCount+1]:=TransArr[IntCount][12];
    StrGrid.Cells[11,IntCount+1]:=TransArr[IntCount][11];
    StrGrid.Cells[12,IntCount+1]:=TransArr[IntCount][10];
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+1].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
//    StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taRightJustify;
    for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clWindowText;
    if TransArr[IntCount][10]='0' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clRed;
    if TransType=1 then begin
      if TransArr[IntCount][7]='0' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clGreen;
    end;
  end;
  Main.M_Normal;
end;

procedure TBusInvoiceList.FormShow(Sender: TObject);
begin
  Init;
  RefreshDisplay;
end;

procedure TBusInvoiceList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TBusInvoiceList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBusInvoiceList.Search;
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(TransArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
      if (StrPos(PChar(UpperCase(TransArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 11 do begin
            StrGrid.Cells[Count4,Count2-1]:=TransArr[Count][Count4];
            StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clWindowText;
          end;
          if TransArr[Count][10]='0' then for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2-1].Font.Color:=clRed;
          if TransType=1 then begin
            if TransArr[Count][7]='0' then for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2-1].Font.Color:=clGreen;
          end;
          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TBusInvoiceList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TBusInvoiceList.StrGridDblClick(Sender: TObject);
var InvoiceSelect:Integer;
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'')  then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('BusInvoice')=False then BusInvoice:=TBusInvoice.Create(Self,StrGrid.Cells[11,IntRow],False)
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then if Main.IsFormOpen('BusInvoice')=False then begin
          BusInvoice:=TBusInvoice.Create(nil,StrGrid.Cells[11,IntRow],True);
          Close;
      end;
      if UpperCase(FormRequest)='MAIN-CHANGE-PAYMENT' then if (Main.IsFormOpen('BusPaymentReceiveForm')=False) and (StrGrid.Cells[10,IntRow]='1') then begin
          BusPaymentReceiveForm:=TBusPaymentReceiveForm.Create(nil,StrGrid.Cells[11,IntRow],True);
          Close;
      end;
      if UpperCase(FormRequest)='MAIN-PAYMENT' then if Main.IsFormOpen('BusPaymentReceiveForm')=False then begin
          BusPaymentReceiveForm:=TBusPaymentReceiveForm.Create(nil,StrGrid.Cells[11,IntRow],False);
          //Close;
      end;
      if UpperCase(FormRequest)='INVOICE-REPRINT' then  begin
{        InvoiceSelect:=Main.MyMessageDlg('Model Cetak Invoice',mtConfirmation,[mbYes,mbNo],['Invoice Lama','Invoice Baru'],'Pencetakan');
        if InvoiceSelect=6 then begin
          BusInvoice.RePrint2(StrGrid.Cells[11,IntRow]);
        end else begin
          BusInvoice.RePrint(StrGrid.Cells[11,IntRow]);
        end;
        Close;
}
        BusInvoice.RePrint2(StrGrid.Cells[11,IntRow]);
      end;
      if UpperCase(FormRequest)='PAYMENT-RECEIVE' then  begin
        BusPaymentReceiveForm.SetInvoiceId(StrGrid.Cells[11,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='PAYMENT-REPRINT' then  begin
        BusPaymentReceiveForm.RePrint(StrGrid.Cells[11,IntRow]);
        Close;
      end;
    end;
  end;
end;

procedure TBusInvoiceList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusInvoiceList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBusInvoiceList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TBusInvoiceList.SemuaClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if Semua.Checked then Tanggal.Enabled:=False
    else Tanggal.Enabled:=True;
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBusInvoiceList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TanggalSampai.Date then TanggalSampai.Date:=Tanggal.Date;
end;

procedure TBusInvoiceList.Last3MonthsClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBusInvoiceList.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TBusInvoiceList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TBusInvoiceList.TunaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBusInvoiceList.TanggalSampaiChange(Sender: TObject);
begin
  if TanggalSampai.Date<Tanggal.Date then Tanggal.Date:=TanggalSampai.Date;
end;

procedure TBusInvoiceList.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TBusInvoiceList.ChkNoOrderClick(Sender: TObject);
begin
  if ChkNoOrder.Checked=True then
  begin
    Tanggal.Enabled:=False;
    TanggalSampai.Enabled:=False;
    NoOrder.Enabled:=True;
    NoOrder.Text:='';
    Tanggal.Date:=Now();
    TanggalSampai.Date:=Now();
  end else begin
    Tanggal.Enabled:=True;
    TanggalSampai.Enabled:=True;
    Tanggal.Date:=Now();
    TanggalSampai.Date:=Now();
    NoOrder.Text:='';
    NoOrder.Enabled:=False  ;
  end;
end;

procedure TBusInvoiceList.NoOrderKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Button1Click(sender);
end;

end.
