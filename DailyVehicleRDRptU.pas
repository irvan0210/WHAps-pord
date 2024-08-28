unit DailyVehicleRDRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TDailyVehicleRDRpt = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    IncludeOnTrip: TCheckBox;
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure IncludeOnTripClick(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    OrderArr,CompanyArr:Array of TArrString30;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);Overload;
    procedure RefreshDisplay;
  end;

var
  DailyVehicleRDRpt: TDailyVehicleRDRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU;

{$R *.dfm}

constructor TDailyVehicleRDRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TDailyVehicleRDRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);
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
  Initiation:=True;
  Main.WriteLog('Form Open: DailyVehicleRDRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All),1);
  inherited Create(AOwner);
end;

procedure TDailyVehicleRDRpt.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TDailyVehicleRDRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=18;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=120;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=120;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=35;
  StrGrid.ColWidths[8]:=50;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=40;
  StrGrid.ColWidths[11]:=160;
  StrGrid.ColWidths[13]:=50;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,18,1);
  StrGrid.Cells[0,0]:='Tanggal';
  StrGrid.Cells[1,0]:='No Pesanan';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Group';
  StrGrid.Cells[4,0]:='Contact Person';
  StrGrid.Cells[5,0]:='SC';
  StrGrid.Cells[6,0]:='Keberangkatan';
  StrGrid.Cells[7,0]:='Unit';
  StrGrid.Cells[8,0]:='Armada';
  StrGrid.Cells[11,0]:='Rute';
  StrGrid.Cells[12,0]:='Gross';
  StrGrid.Cells[13,0]:='Discount';
  StrGrid.Cells[14,0]:='CN (%)';
  StrGrid.Cells[15,0]:='Tol Parkir';
  StrGrid.Cells[16,0]:='Biaya Lain';
  StrGrid.Cells[17,0]:='Keterangan';
  StrGrid.Cells[8,1]:='Seat';
  StrGrid.Cells[9,1]:='Jenis';
  StrGrid.Cells[10,1]:='Brand';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TDailyVehicleRDRpt.RefreshCombo;
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

procedure TDailyVehicleRDRpt.RefreshData;
var Qry,Qry2:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,StrIncludeOnTrip,StrLocationId,StrCompanyId:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);
    StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if IncludeOnTrip.Checked=True then StrIncludeOnTrip:=',@IncludeOnTrip=1' else StrIncludeOnTrip:='';
    StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+',@ListType=1'+StrIncludeOnTrip+',@PaymentDetail=2;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(OrderArr,IntCount+1);
      StrQry:='SELECT * FROM wh_customer_order_service_detail '+
              'WHERE (transaction_type_id='+QuotedStr('150202')+') AND (status=1) '+
              'AND (customer_order_id='+QuotedStr(Qry.FieldValues['customer_order_id'])+');';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntTolParkir:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        IntTolParkir:=IntTolParkir+Qry2.FieldValues['amount'];
        Qry2.Next;
      end;
      Qry2.Close;
      StrQry:='SELECT * FROM wh_customer_order_service_detail '+
              'WHERE (transaction_type_id<>'+QuotedStr('150202')+') AND (amount>1) AND (status=1) '+
              'AND (customer_order_id='+QuotedStr(Qry.FieldValues['customer_order_id'])+');';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntBiayaLain:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        IntBiayaLain:=IntBiayaLain+Qry2.FieldValues['amount'];
        Qry2.Next;
      end;
      Qry2.Close;

//      StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(Qry.FieldValues['customer_order_id'])+StrTanggal+';';
//      Qry2.SQL.Clear;
//      Qry2.SQL.Add(StrQry);
//      Qry2.Open;
//      if Qry2.RecordCount>0 then begin
        SetLength(OrderArr,IntCount+1);
        OrderArr[IntCount][0]:=Qry.FieldValues['submit_dates'];
        OrderArr[IntCount][1]:=Qry.FieldValues['customer_order_id'];
        OrderArr[IntCount][2]:=Qry.FieldValues['names'];
        OrderArr[IntCount][3]:=Qry.FieldValues['segment_name'];
        if Qry.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][4]:=Qry.FieldValues['contact_person_name'];
        OrderArr[IntCount][5]:=Qry.FieldValues['initial_name'];
        OrderArr[IntCount][6]:=Qry.FieldValues['from_to_dates2'];
        OrderArr[IntCount][7]:=Qry.FieldValues['units'];
        OrderArr[IntCount][8]:=IntToStr(Qry.FieldValues['seat'])+' Seats';
        OrderArr[IntCount][9]:=Qry.FieldValues['batch_name'];
        OrderArr[IntCount][10]:='WH';
        OrderArr[IntCount][11]:=Qry.FieldValues['route'];
        if IntTolParkir>0 then OrderArr[IntCount][15]:=IToCurr(IntTolParkir);
        if IntBiayaLain>0 then OrderArr[IntCount][16]:=IToCurr(IntBiayaLain);
        if Qry.FieldValues['cust_contract_id']<>NULL then OrderArr[IntCount][17]:='Kontrak';
        if Qry.FieldValues['inv_later']='1' then OrderArr[IntCount][17]:='Otorisasi';
        if Qry.FieldValues['total_order']<=Qry.FieldValues['total_payment'] then
          if OrderArr[IntCount][17]<>'' then OrderArr[IntCount][17]:=OrderArr[IntCount][17]+' Lunas'
          else OrderArr[IntCount][17]:='Lunas';
        if FinanceDetail=True then begin
          OrderArr[IntCount][12]:=IToCurr(Qry.FieldValues['total']);
          IntTotal:=Qry.FieldValues['total'];
          if Qry.FieldValues['discount_price']>0 then begin
            OrderArr[IntCount][13]:=IToCurr(Qry.FieldValues['discount_price']);
          end else if Qry.FieldValues['discount_percent']>0 then begin
            OrderArr[IntCount][13]:=IntToStr(Qry.FieldValues['discount_percent'])+' %';
          end;
        end;
//      end;
//      Qry2.Close;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
//  FreeAndNil(Qry2);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TDailyVehicleRDRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal:Integer;
    StrOrderId:String;
    IsDrawRect:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    if StrOrderId<>OrderArr[IntCount][1] then begin
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
      StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
      StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
      StrGrid.Cells[15,IntCount+2]:=OrderArr[IntCount][15];
      StrGrid.Cells[16,IntCount+2]:=OrderArr[IntCount][16];
      StrGrid.Cells[17,IntCount+2]:=OrderArr[IntCount][17];
      IsDrawRect:=False;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][1]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+2,3,IntCount+2);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+2,4,IntCount+2);
      StrGrid.MergeCells.AddRectXY(5,IntStartRow+2,5,IntCount+2);
      StrGrid.MergeCells.AddRectXY(13,IntStartRow+2,13,IntCount+2);
      StrGrid.MergeCells.AddRectXY(14,IntStartRow+2,14,IntCount+2);
      StrGrid.MergeCells.AddRectXY(15,IntStartRow+2,15,IntCount+2);
      StrGrid.MergeCells.AddRectXY(16,IntStartRow+2,16,IntCount+2);
      StrGrid.MergeCells.AddRectXY(17,IntStartRow+2,17,IntCount+2);
    end;
    StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TDailyVehicleRDRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TDailyVehicleRDRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TDailyVehicleRDRpt.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(OrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(OrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do
          StrGrid.Cells[Count4,Count2]:=OrderArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailyVehicleRDRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TDailyVehicleRDRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False)
    end;
  end;
end;

procedure TDailyVehicleRDRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TDailyVehicleRDRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDailyVehicleRDRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TDailyVehicleRDRpt.TanggalChange(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailyVehicleRDRpt.IncludeOnTripClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailyVehicleRDRpt.SBUChange(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
