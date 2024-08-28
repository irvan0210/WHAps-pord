unit IntegrateGPSaleBusU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TIntegrateGPSaleBus = class(TForm)
    StrGrid1: TZColorStringGrid;
    ToXCel1: TSpeedButton;
    Selesai: TButton;
    Label2: TLabel;
    FromDates: TDateTimePicker;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    Lokasi: TComboBox;
    StrGrid2: TZColorStringGrid;
    Process: TButton;
    StrGrid3: TZColorStringGrid;
    Label3: TLabel;
    ToDates: TDateTimePicker;
    ToDate: TCheckBox;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCel1Click(Sender: TObject);
    procedure ToXcel2Click(Sender: TObject);
    procedure ProcessClick(Sender: TObject);
    procedure GPLastGLKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToDateClick(Sender: TObject);
  private
    { Private declarations }
    JenisArr,LokasiArr:Array of TArrString7;
    CompanyArr:Array of TArrString8;
    procedure Init;
    procedure InitGrid1;
    procedure InitGrid2;
    procedure InitGrid3;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData1;
    procedure ProcessData;
  public
    { Public declarations }
  end;

var
  IntegrateGPSaleBus: TIntegrateGPSaleBus;

implementation

uses MainU, DB, StrUtils;

{$R *.dfm}

procedure TIntegrateGPSaleBus.Init;
begin
  FromDates.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  ToDates.Enabled:=True;
  ToDates.Date:=Now();
  ToDates.Enabled:=False;
  if UserLevel<59 then begin
    ToXCel1.Enabled:=False;
  end;
end;

procedure TIntegrateGPSaleBus.InitGrid1;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid1.Cells[IntCount2,IntCount]:='';
  StrGrid1.RowCount:=5;
  StrGrid1.ColCount:=12;
  StrGrid1.Cells[0,0]:='HEADER';
  StrGrid1.Cells[0,1]:='TYPE';
  StrGrid1.Cells[1,1]:='TYPE_ID';
  StrGrid1.Cells[2,1]:='DOC_NUMBER';
  StrGrid1.Cells[3,1]:='DATE';
  StrGrid1.Cells[4,1]:='BATCH_ID';
  StrGrid1.Cells[5,1]:='CUSTOMER_ID';
  StrGrid1.Cells[6,1]:='SITE_ID';
  StrGrid1.Cells[7,1]:='CURRENCY_ID';
  StrGrid1.Cells[8,1]:='CUSTOMER_NAME';
  StrGrid1.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 7 do
    StrGrid1.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;


procedure TIntegrateGPSaleBus.InitGrid2;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid2.Cells[IntCount2,IntCount]:='';
  StrGrid2.RowCount:=5;
  StrGrid2.ColCount:=14;
  StrGrid2.Cells[0,0]:='DETAIL';
  StrGrid2.Cells[0,1]:='DOC_NUMBER';
  StrGrid2.Cells[1,1]:='ITEM_NUMBER';
  StrGrid2.Cells[2,1]:='ITEM_DESCRIPTION';
  StrGrid2.Cells[3,1]:='QUANTITY';
  StrGrid2.Cells[4,1]:='UOFM';
  StrGrid2.Cells[5,1]:='UNIT_PRICE';
  StrGrid2.Cells[6,1]:='MARK_DOWN_AMOUNT';
  StrGrid2.Cells[7,1]:='COA_SALES';
  StrGrid2.Cells[8,1]:='COA_MARK_DOWN';
  StrGrid2.Cells[9,1]:='SITE_ID';
  StrGrid2.Cells[10,1]:='PRICE_LEVEL';
  StrGrid2.Cells[11,1]:='SEQUENCE_LINE';
  StrGrid2.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 11 do
    StrGrid2.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;

procedure TIntegrateGPSaleBus.InitGrid3;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';
  StrGrid3.RowCount:=5;
  StrGrid3.ColCount:=7;
  StrGrid3.Cells[0,0]:='DETAIL_DIMENSION';
  StrGrid3.Cells[0,1]:='DOC_NUMBER';
  StrGrid3.Cells[1,1]:='COA';
  StrGrid3.Cells[2,1]:='DEBIT_AMOUNT';
  StrGrid3.Cells[3,1]:='KREDIT_AMOUNT';
  StrGrid3.Cells[4,1]:='DISTRIBUTION_TYPE';
  StrGrid3.Cells[5,1]:='DISTRIBUTION_REFERENCE';
  StrGrid3.Cells[6,1]:='SEQUENCE_LINE';
  StrGrid3.CellStyle[0,0].Font.Style:=[fsBold];
  for IntCount:=0 to 6 do
    StrGrid3.CellStyle[IntCount,1].Font.Style:=[fsBold];
end;

procedure TIntegrateGPSaleBus.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
end;

procedure TIntegrateGPSaleBus.RefreshCombo;
var QStr,StrQry:String;
    Qry:TADOQuery;
    Count,IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;


    QStr:='EXEC GetLocation 2,1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      LokasiArr[Count][2]:=Qry.FieldValues['code'];
      if Qry.FieldValues['coa_disposisi']<>NULL then LokasiArr[Count][3]:=Qry.FieldValues['coa_disposisi'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Normal;
end;

procedure TIntegrateGPSaleBus.RefreshData1;
var Qry,Qry2:TADOQuery;
    StrQry,StrDiscount,StrOrderId,StrDates,StrCompanyId:String;
    IntCount,IntCount2,IntCount3,IntCount4,IntDiscount,IntTotalDetail,IntQty,IntDay:Integer;
    IsNewLine:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
//    StrQry:='EXEC GetCustomerOrderList 2,@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+',@Finish=6,@PaymentDetail=1,@Integrate=1;';
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if ToDates.Enabled=False then StrDates:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))
    else StrDates:=',@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',ToDates.Date));
    StrQry:='EXEC GetTransactionList '+StrCompanyId+StrDates+',@Integrate=1;';
    Qry.SQL.Add(StrQry);
    IntCount:=0;
    IntCount2:=0;
    IntCount3:=0;
    StrOrderId:='';
    IsNewLine:=False;
    Qry.Open;
    IntCount4:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      {Grid 1}
      if StrOrderId<>Qry.FieldValues['customer_order_id'] then begin
        if StrGrid1.RowCount<IntCount+4 then StrGrid1.RowCount:=IntCount+4;
        StrOrderId:=Qry.FieldValues['customer_order_id'];
        IsNewLine:=True;
        StrGrid1.Cells[0,IntCount+2]:='3';
        StrGrid1.Cells[1,IntCount+2]:='INVDCIM';
//        StrGrid1.Cells[2,IntCount+2]:=Qry.FieldValues['invoice_no'];
//        StrGrid1.Cells[3,IntCount+2]:=Qry.FieldValues['from_dates'];
        StrGrid1.Cells[2,IntCount+2]:=Qry.FieldValues['invoice_id'];
        StrGrid1.Cells[3,IntCount+2]:=Qry.FieldValues['submit_dates'];
        StrGrid1.Cells[4,IntCount+2]:='INVOICE-'+FormatDateTime('ddmmm',FromDates.Date);
        if Qry.FieldValues['gp_customer_number']<>NULL then
          StrGrid1.Cells[5,IntCount+2]:=Qry.FieldValues['gp_customer_number'];
        StrGrid1.Cells[6,IntCount+2]:='JKT';
        StrGrid1.Cells[7,IntCount+2]:='IDR';
        StrGrid1.Cells[8,IntCount+2]:=Qry.FieldValues['name'];
        IntCount4:=0;
        Inc(IntCount);
        Inc(IntCount3);
      end else begin
        IsNewLine:=False;
      end;

      {Grid2}
      if StrGrid2.RowCount<IntCount2+4 then StrGrid2.RowCount:=IntCount2+4;
      IntDiscount:=0;
      StrQry:='EXEC GetCustomerOrderDetailList '+Qry.FieldValues['customer_order_id']+';';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        Inc(IntCount2);
        IntDiscount:=0;
        if StrGrid2.RowCount<IntCount+4 then StrGrid2.RowCount:=IntCount+4;
        IntTotalDetail:=Qry2.FieldValues['total'];
        IntQty:=Qry2.FieldValues['day']*Qry2.FieldValues['units'];
        StrGrid2.Cells[0,IntCount2+1]:=Qry.FieldValues['invoice_id'];
        if Qry2.FieldValues['short_name']<>NULL then
          StrGrid2.Cells[1,IntCount2+1]:=Qry2.FieldValues['short_name'];
        StrGrid2.Cells[2,IntCount2+1]:=Qry2.FieldValues['product_price_name'];
        StrGrid2.Cells[3,IntCount2+1]:=IntToStr(IntQty);
        StrGrid2.Cells[4,IntCount2+1]:='days';
        if IntQty>0 then StrGrid2.Cells[5,IntCount2+1]:=IntToStr(Round(IntTotalDetail/IntQty))+'.00';
//        if Qry2.FieldValues['discount_percent']>0 then IntDiscount:=(IntTotalDetail*(Qry2.FieldValues['discount_percent']/100));
//        if Qry2.FieldValues['discount_price']>0 then IntDiscount:=Qry2.FieldValues['discount_price'];
        if Qry.FieldValues['discount_percent']>0 then IntDiscount:=((IntTotalDetail-IntDiscount)*(Qry.FieldValues['discount_percent']/100) )+IntDiscount;
        if Qry.FieldValues['discount_price']>0 then IntDiscount:=Qry.FieldValues['discount_price']+IntDiscount;
        if IntDiscount>0 then StrDiscount:=IntToStr(Round(IntDiscount/IntQty)) else StrDiscount:='0';
        StrGrid2.Cells[6,IntCount2+1]:=StrDiscount+'.00';
        StrGrid2.Cells[7,IntCount2+1]:='631010.301101.000000';
        StrGrid2.Cells[8,IntCount2+1]:='631020.301101.000000';
        StrGrid2.Cells[9,IntCount2+1]:='JKT';
        StrGrid2.Cells[10,IntCount2+1]:='DC';
        StrGrid2.Cells[11,IntCount2+1]:=IntToStr(IntCount4+1);
        StrGrid2.Cells[12,IntCount2+1]:=Qry2.FieldValues['from_dates'];
//        StrGrid2.CellStyle[5,IntCount2+1].HorizontalAlignment:=taRightJustify;
//        StrGrid2.CellStyle[6,IntCount2+1].HorizontalAlignment:=taRightJustify;
        Qry2.Next;
        Inc(IntCount4);
      end;
      Qry2.Close;
      if Qry.FieldValues['total_service']>0 then begin
        Inc(IntCount2);
        if StrGrid2.RowCount<IntCount+4 then StrGrid2.RowCount:=IntCount+4;
        StrGrid2.Cells[0,IntCount2+1]:=Qry.FieldValues['invoice_id'];
        StrGrid2.Cells[1,IntCount2+1]:='TF';
        StrGrid2.Cells[2,IntCount2+1]:=Qry.FieldValues['service_resume'];
        StrGrid2.Cells[3,IntCount2+1]:='1';
        StrGrid2.Cells[4,IntCount2+1]:='days';
        StrGrid2.Cells[5,IntCount2+1]:=IntToStr(Qry.FieldValues['total_service'])+'.00';
        StrGrid2.Cells[6,IntCount2+1]:='0.00';
        StrGrid2.Cells[7,IntCount2+1]:='631010.301101.000000';
        StrGrid2.Cells[8,IntCount2+1]:='631020.301101.000000';
        StrGrid2.Cells[9,IntCount2+1]:='JKT';
        StrGrid2.Cells[10,IntCount2+1]:='DC';
        StrGrid2.Cells[11,IntCount2+1]:=IntToStr(IntCount4+1);
      end;
      {Grid 3}
      if IsNewLine then begin
        IntDiscount:=0;
        //if Qry.FieldValues['total_detail_discount']>0 then IntDiscount:=Qry.FieldValues['total_detail_discount'];
        if Qry.FieldValues['discount_price']>0 then IntDiscount:=IntDiscount+Qry.FieldValues['discount_price'];
        if Qry.FieldValues['discount_percent']>0 then IntDiscount:=IntDiscount+(Qry.FieldValues['discount_percent']/100*Qry.FieldValues['total']);
        if StrGrid3.RowCount<IntCount3+5 then StrGrid3.RowCount:=IntCount3+5;
        StrGrid3.Cells[0,IntCount3+1]:=Qry.FieldValues['invoice_id'];
        StrGrid3.Cells[1,IntCount3+1]:='631010.301101.000000';
        StrGrid3.Cells[2,IntCount3+1]:='0.00';
        if Qry.FieldValues['discount_amount']>0 then
          StrGrid3.Cells[3,IntCount3+1]:=IntToStr(Qry.FieldValues['total']+Qry.FieldValues['total_addday']+Qry.FieldValues['total_service']+Qry.FieldValues['discount_amount'])+'.00'
        else
          if Qry.FieldValues['discount_percent']>0 then StrGrid3.Cells[3,IntCount3+1]:=IntToStr(Qry.FieldValues['total']+Qry.FieldValues['total_addday']+Qry.FieldValues['total_service']+(Qry.FieldValues['total']/((100-Qry.FieldValues['discount_percent'])/100)))+'.00'
          else StrGrid3.Cells[3,IntCount3+1]:=IntToStr(Qry.FieldValues['total']+Qry.FieldValues['total_addday']+Qry.FieldValues['total_service']+Qry.FieldValues['discount_price'])+'.00';
        StrGrid3.Cells[4,IntCount3+1]:='1';
        StrGrid3.Cells[5,IntCount3+1]:=RightStr(Qry.FieldValues['customer_order_id'],8)+'/'+Qry.FieldValues['name'];
        StrGrid3.Cells[6,IntCount3+1]:='100';
//        StrGrid3.CellStyle[2,IntCount3+3].HorizontalAlignment:=taRightJustify;
//        StrGrid3.CellStyle[3,IntCount3+3].HorizontalAlignment:=taRightJustify;
        Inc(IntCount3);
        if StrGrid3.RowCount<IntCount3+5 then StrGrid3.RowCount:=IntCount3+5;
        StrGrid3.Cells[0,IntCount3+1]:=Qry.FieldValues['invoice_id'];
        StrGrid3.Cells[1,IntCount3+1]:=Qry.FieldValues['gp_coa_ar'];
        {perubahan}
        //StrGrid3.Cells[2,IntCount3+1]:=IntToStr(Qry.FieldValues['total']+Qry.FieldValues['total_addday']+Qry.FieldValues['total_service'])+'.00';
        //StrGrid3.Cells[3,IntCount3+1]:='0.00';
        StrGrid3.Cells[2,IntCount3+1]:='0.00';
        StrGrid3.Cells[3,IntCount3+1]:='-'+IntToStr(Qry.FieldValues['total']+Qry.FieldValues['total_addday']+Qry.FieldValues['total_service'])+'.00';
        StrGrid3.Cells[4,IntCount3+1]:='2';
        StrGrid3.Cells[5,IntCount3+1]:=RightStr(Qry.FieldValues['customer_order_id'],8)+'/'+Qry.FieldValues['name'];
        StrGrid3.Cells[6,IntCount3+1]:='200';
//        StrGrid3.CellStyle[2,IntCount3+3].HorizontalAlignment:=taRightJustify;
//        StrGrid3.CellStyle[3,IntCount3+3].HorizontalAlignment:=taRightJustify;
        if StrToInt(StrDiscount)>0 then begin
          Inc(IntCount3);
          if StrGrid3.RowCount<IntCount3+5 then StrGrid3.RowCount:=IntCount3+5;
          StrGrid3.Cells[0,IntCount3+1]:=Qry.FieldValues['invoice_id'];
          StrGrid3.Cells[1,IntCount3+1]:='631020.301101.000000';
          {
          if Qry.FieldValues['discount_amount']>0 then
            StrGrid3.Cells[2,IntCount3+1]:=IntToStr(Qry.FieldValues['discount_amount'])+'.00'
          else
            if Qry.FieldValues['discount_percent']>0 then StrGrid3.Cells[2,IntCount3+1]:=IntToStr(Qry.FieldValues['total']/((100-Qry.FieldValues['discount_percent'])/100))
            else StrGrid3.Cells[2,IntCount3+1]:=IntToStr(Qry.FieldValues['discount_price']);
          StrGrid3.Cells[3,IntCount3+1]:='0.00';
          }
          {Perubahan}
          StrGrid3.Cells[2,IntCount3+1]:='0.00';
          if Qry.FieldValues['discount_amount']>0 then
            StrGrid3.Cells[3,IntCount3+1]:='-'+IntToStr(Qry.FieldValues['discount_amount'])+'.00'
          else
            if Qry.FieldValues['discount_percent']>0 then StrGrid3.Cells[2,IntCount3+1]:=IntToStr(Qry.FieldValues['total']/((100-Qry.FieldValues['discount_percent'])/100))
            else StrGrid3.Cells[3,IntCount3+1]:='-'+IntToStr(Qry.FieldValues['discount_price']);

          StrGrid3.Cells[4,IntCount3+1]:='10';
          StrGrid3.Cells[5,IntCount3+1]:=RightStr(Qry.FieldValues['customer_order_id'],8)+'/'+Qry.FieldValues['name'];
          StrGrid3.Cells[6,IntCount3+1]:='300';
//          StrGrid3.CellStyle[2,IntCount3+3].HorizontalAlignment:=taRightJustify;
//          StrGrid3.CellStyle[3,IntCount3+3].HorizontalAlignment:=taRightJustify;
        end;
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPSaleBus.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshJenis;
end;

procedure TIntegrateGPSaleBus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TIntegrateGPSaleBus.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TIntegrateGPSaleBus.ToXCel1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid1,'File Header',StrGrid2,'File Sales Detail',StrGrid3,'File Sales Distribution') then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPSaleBus.ToXcel2Click(Sender: TObject);
begin
  if ToExcel4(StrGrid2) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TIntegrateGPSaleBus.ProcessClick(Sender: TObject);
begin
  ProcessData;
end;

procedure TIntegrateGPSaleBus.ProcessData;
begin
  InitGrid1;
  InitGrid2;
  InitGrid3;
  RefreshData1;
end;

procedure TIntegrateGPSaleBus.GPLastGLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TIntegrateGPSaleBus.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TIntegrateGPSaleBus.SpeedButton1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid3) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPSaleBus.ToDateClick(Sender: TObject);
begin
  if ToDate.Checked=True then begin
    ToDates.Enabled:=True;
  end else begin
    ToDates.Enabled:=False;
  end;
end;

end.
