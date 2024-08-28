unit DailySalesRecapRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TDailySalesRecapRpt = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    ProgressBar: TProgressBar;
    Lihat: TButton;
    Label2: TLabel;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    GroupBox1: TGroupBox;
    rbpil1: TRadioButton;
    rbpil2: TRadioButton;
    rbpil3: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);

    procedure SalesPersonChange(Sender: TObject);
    procedure SegmentChange(Sender: TObject);

    procedure SeatChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId,StrFormat:String;
    OrderArr,CompanyArr:Array of TArrString30;
    SegmentArr:Array of TArrString2;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    IntTotalSum:Int64;
    Initiation,UpdateTime,NoSum:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Update_Time:Boolean=False;No_Sum:Boolean=False);Overload;
    procedure RefreshDisplay;
  end;

var
  DailySalesRecapRpt: TDailySalesRecapRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, StrUtils;

{$R *.dfm}

constructor TDailySalesRecapRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  UpdateTime:=False;
  inherited Create(AOwner);
end;

constructor TDailySalesRecapRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Update_Time:Boolean=False;No_Sum:Boolean=False);
begin
{  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
}
  IsAll:=Is_All;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  UpdateTime:=Update_Time;
  NoSum:=No_Sum;
  Main.WriteLog('Form Open: OrderForm='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+BoolToStr(Update_Time),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TDailySalesRecapRpt.Init;
begin
  {
  Case IsAll of
    8:Caption:='Laporan Pesanan Harian Batal perArmada Jalan';
    else Caption:='Laporan Pesanan Harian perArmada Jalan';
  end;
  }
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  rbpil3.Checked:=True;

  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;

  if UserLevel<59 then ToXCel.Enabled:=False;
  ProgressBar.Visible:=False;
end;

procedure TDailySalesRecapRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=19;

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=40;
  StrGrid.ColWidths[5]:=50;
  StrGrid.ColWidths[6]:=350;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=80;
  StrGrid.ColWidths[9]:=70;
  StrGrid.ColWidths[10]:=80;
  StrGrid.ColWidths[11]:=80;
  StrGrid.ColWidths[12]:=550;
  StrGrid.ColWidths[13]:=200;
  StrGrid.ColWidths[14]:=80;
  StrGrid.ColWidths[15]:=80;
  
  StrGrid.ColWidths[16]:=0;
  StrGrid.ColWidths[17]:=0;
  StrGrid.ColWidths[18]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Pesanan';
  StrGrid.Cells[2,0]:='Segment';
  StrGrid.Cells[3,0]:='Client Name';
  StrGrid.Cells[4,0]:='Unit';
  StrGrid.Cells[5,0]:='Seats';
  StrGrid.Cells[6,0]:='Agent';
  StrGrid.Cells[7,0]:='Start';
  StrGrid.Cells[8,0]:='End';
  StrGrid.Cells[9,0]:='Day';
  StrGrid.Cells[10,0]:='Type';
  StrGrid.Cells[11,0]:='Jenis';
  StrGrid.Cells[12,0]:='Program';
  StrGrid.Cells[13,0]:='Dept';
  StrGrid.Cells[14,0]:='Net';
  StrGrid.Cells[15,0]:='Booking';

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
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TDailySalesRecapRpt.RefreshCombo;
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
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
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

    (*
    Seat.Items.Clear;
    Seat.ItemHeight:=-1;
    Seat.Text:=''; 
    StrQry:='SELECT a.seat FROM wh_product a GROUP BY seat ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      Seat.Items.Add(Qry.FieldValues['seat']);
      Qry.Next;
    end;
    Qry.Close;
    *)
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TDailySalesRecapRpt.RefreshData;
var Qry,Qry2,Qry3,Qry4:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,StrSeat,StrLocationId,StrCompanyId,StrType,StrToDates:String;
    StrCustomerId,StrProductPrice,StrFrom_date,StrTo_date,StrCancelDate:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain,IntTotalTrip,IntPotongan,IntFull_Day:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=36000;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=36000;

  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout:=36000;

  Qry4:=TADOQuery.Create(Self);
  Qry4.Connection:=Main.MyConnection;
  Qry4.CommandTimeout:=36000;

  Main.M_Busy;
  ProgressBar.Visible:=True;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);
    IntTotalSum:=0;
    ProgressBar.Position:=5;
    StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    if CekTglSampai.Checked=True then StrToDates:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglSampai.Date));

    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrQry:='EXEC GetCustomerOrderList_SentSales '+StrCompanyId+StrLocationId+StrTanggal+StrToDates+',@Finish='+IntToStr(IsAll)+',@PaymentDetail=1,@OrderBy='+QuotedStr('a.customer_order_id')+' ;';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.Open;
    IntCount:=0;
    ProgressBar.Position:=10;
    //Memo1.Lines.Clear;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProgressBar.Position:=10+Round((70/Qry.RecordCount)*IntCount);
      SetLength(OrderArr,IntCount+1);
      for IntCount2:=0 to 2 do begin
        IntPayment[IntCount2]:=0;
        StrPayment[IntCount2]:='';
      end;
      StrList:=TStringList.Create;
      StrList:=SplitStrings(Qry.FieldValues['payment'],'##');
      if (StrList.Count>=1) and (StrList.Strings[0]<>'') then begin
        StrList2:=TStringList.Create;
        for IntCount2:=0 to StrList.Count-1 do begin
          if IntCount2<2 then IntCount3:=IntCount2 else IntCount3:=2;
          if StrList.Strings[IntCount2]<>'' then begin
            StrList2:=SplitStrings(StrList.Strings[IntCount2],'**');
            StrPayment[IntCount3]:=StrList2.Strings[0];
            IntPayment[IntCount3]:=IntPayment[IntCount3]+StrToInt(StrList2.Strings[1]) ;
          end;
        end;
        FreeAndNil(StrList2);
      end;
      FreeAndNil(StrList);

      StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(Qry.FieldValues['customer_order_id'])+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if rbpil1.Checked then StrFormat:=rbpil1.Caption
      else if rbpil2.Checked then StrFormat:=rbpil2.Caption
      else if rbpil3.Checked then StrFormat:=rbpil3.Caption
      else StrFormat:=rbpil3.Caption;

      if Qry2.RecordCount>0 then begin
        while not(Qry2.Eof) do begin
          SetLength(OrderArr,IntCount+1);
          {
          StrProductPrice := QuotedStr(Qry2.FieldValues['product_price_id']);
          StrFrom_date  := QuotedStr(Qry2.FieldValues['from_date']);
          StrTo_date    := QuotedStr(Qry2.FieldValues['to_date']);
          StrCustomerId := QuotedStr(Qry.FieldValues['customer_id']);
          StrCancelDate:= ' CONVERT(VARCHAR(10),b.update_time,103)='+QuotedStr(FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['submit_dates'])));
          StrQry:='SELECT A.* '+
                  'FROM wh_customer_order_detail A inner join wh_customer_order B ON A.customer_order_id=B.customer_order_id '+
                  'WHERE A.product_price_id='+StrProductPrice+' AND '+
                  'CONVERT(VARCHAR(10),A.from_date,103)='+StrFrom_date+' AND CONVERT(VARCHAR(10),A.to_date,103)='+StrTo_date+' AND '+
                  'A.status=1 AND B.Status=0 AND '+StrCancelDate+' AND B.customer_id='+StrCustomerId;
          Qry3.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry3.SQL.Add(StrQry);
          Qry3.Open;
          if Qry3.RecordCount>0 Then begin
            Memo1.Lines.Add(StrCustomerId+' | '+StrProductPrice+' | '+StrFrom_date+' | '+StrTo_date);
            Qry3.Close;
            break;
          end;
          }
          OrderArr[IntCount][15]:=FormatDateTime(StrFormat, StrToDate(Qry.FieldValues['submit_dates']));

          OrderArr[IntCount][1]:=Qry.FieldValues['customer_order_id'];
          OrderArr[IntCount][2]:=Qry.FieldValues['segment_name'];//->1
          if Qry.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][3]:=Qry.FieldValues['contact_person_name'];
          OrderArr[IntCount][4]:=Qry2.FieldValues['units'];
          OrderArr[IntCount][5]:=IntToStr(Qry2.FieldValues['seat']);
          OrderArr[IntCount][6]:=Qry.FieldValues['names'];
          OrderArr[IntCount][7]:=FormatDateTime(StrFormat, StrToDate(Qry2.FieldValues['from_dates']));
          OrderArr[IntCount][8]:=FormatDateTime(StrFormat, StrToDate(Qry2.FieldValues['to_dates']));
          OrderArr[IntCount][9]:=Qry2.FieldValues['day_type'];
          if Qry2.FieldValues['trip_type']<>NULL Then begin
            OrderArr[IntCount][10]:=Qry2.FieldValues['trip_type'];
          end else begin
            try
              IntFull_Day := Round(StrToInt(Qry2.FieldValues['fullday'])/StrToInt(Qry.FieldValues['trip_count']));
            except
              on E:Exception Do
                IntFull_Day:=0;
            End;
            Case IntFull_Day Of
            0 : begin
              Try
                if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [10,27] then {Bigbus Premiere} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 1750000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [5,28] then {Bigbus Deluxe} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 1500000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [6] then {Mediun} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 1000000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end  else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [25] then {Mediun Premiere} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 1300000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [7] then {Elf} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 600000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [26] then {Elf} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 900000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [18] then {Weha One} begin
                    OrderArr[IntCount][10]:='Fullday'
                end else if StrToInt(Qry2.FieldValues['vhc_batch_id']) in [29] then {SHD} begin
                  if StrToInt(Qry2.FieldValues['total'])/StrToInt(Qry2.FieldValues['units']) > 2000000 then
                    OrderArr[IntCount][10]:='Fullday'
                  else
                    OrderArr[IntCount][10]:='Transfer'
                end;

                if Pos('FDT', VarToStr(Qry2.FieldValues['route'])) > 0 Then
                  OrderArr[IntCount][10]:='Fullday';

                if Pos('TFO', VarToStr(Qry2.FieldValues['route'])) > 0 Then
                  OrderArr[IntCount][10]:='Transfer';
                if Pos('TFI', VarToStr(Qry2.FieldValues['route'])) > 0 Then
                  OrderArr[IntCount][10]:='Transfer';
                  
                if OrderArr[IntCount][7]<>OrderArr[IntCount][7] then
                  OrderArr[IntCount][10]:='OverNight';
              except
                on E:Exception do
                  OrderArr[IntCount][10]:='Fullday';
              end;
              end;
            1 : begin
                if OrderArr[IntCount][7]=OrderArr[IntCount][7] then
                  OrderArr[IntCount][10]:='FullDay'
                else
                  OrderArr[IntCount][10]:='OverNight';
              end;
           2 : begin
                if OrderArr[IntCount][7]=OrderArr[IntCount][7] then
                  OrderArr[IntCount][10]:='FullDay'
                else
                  OrderArr[IntCount][10]:='OverNight';
              end;
            End;
          End;
          OrderArr[IntCount][11]:=Qry2.FieldValues['batch_name'];
          OrderArr[IntCount][12]:=RightStr('000'+Qry2.FieldValues['units'],2)+' Unit '+Qry2.FieldValues['batch_name']+'  '+IntToStr(Qry2.FieldValues['seat'])+' Seats / '+Qry2.FieldValues['route'];
          OrderArr[IntCount][13]:=Qry.FieldValues['sales_name'];

          IntTotal:=Qry.FieldValues['total'];
          IntTotalTrip:=Qry2.FieldValues['total'];
          if Qry.FieldValues['discount_price']>0 then begin
            IntPotongan := Round(Qry.FieldValues['discount_price']/Qry.FieldValues['unit_count']*Qry2.FieldValues['units']);
            OrderArr[IntCount][16]:=IntToStr(Qry.FieldValues['trip_count'])+' <> '+IToCurr(Qry.FieldValues['discount_price']);

            OrderArr[IntCount][14]:=IntToStr(IntTotalTrip-IntPotongan);
          end else if Qry.FieldValues['discount_percent']>0 then begin
            IntPotongan := Round(Qry.FieldValues['discount_amount']/Qry.FieldValues['unit_count']*Qry2.FieldValues['units']);
            OrderArr[IntCount][16]:=IntToStr(Qry.FieldValues['trip_count'])+' <> '+IToCurr(Qry.FieldValues['discount_amount']);

            //OrderArr[IntCount][18]:=IToCurr(IntTotalTrip-(Qry.FieldValues['discount_amount']/100(IntPotongan));
            OrderArr[IntCount][14]:=IntToStr(IntTotalTrip-((IntTotalTrip*Qry.FieldValues['discount_percent'])/100));
          end else begin
//            OrderArr[IntCount][17]:=IToCurr(IntTotal+IntTolParkir+IntBiayaLain);
            IntPotongan := 0;
            OrderArr[IntCount][14]:=IntToStr(IntTotalTrip-IntPotongan);
          end;
          //OrderArr[IntCount][14]:=IToCurr(IntTotalTrip);

          OrderArr[IntCount][17]:=IToCurr(IntPotongan);
          //OrderArr[IntCount][18]:=IToCurr(IntTotalTrip-IntPotongan);
          //IntTotalSum:=IntTotalSum+StrToInt(ToString(OrderArr[IntCount][14]));
          Qry2.Next;
          if not(Qry2.Eof) then Inc(IntCount);
        end;
        //IntTotalSum:=IntTotalSum+StrToInt(ToString(OrderArr[IntCount][17]));
      end else begin
        if IntCount>=0 then Inc(IntCount,-1);
      end;
      Qry2.Close;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry4);
  FreeAndNil(Qry3);
  FreeAndNil(Qry2);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TDailySalesRecapRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal:Integer;
    StrOrderId:String;
    IsDrawRect:Boolean;
begin
  ProgressBar.Position:=80;
  {
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
}
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)
  else begin
    StrGrid.RowCount:=2;
  end;

  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    if (trim(OrderArr[IntCount][1])<>'') then begin
      ProgressBar.Position:=80+Round((20/Length(OrderArr))*IntCount);
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
      StrGrid.Cells[1,IntCount+1]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+1]:=OrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+1]:=OrderArr[IntCount][6];
      StrGrid.Cells[7,IntCount+1]:=OrderArr[IntCount][7];
      StrGrid.Cells[8,IntCount+1]:=OrderArr[IntCount][8];
      StrGrid.Cells[9,IntCount+1]:=OrderArr[IntCount][9];
      StrGrid.Cells[10,IntCount+1]:=OrderArr[IntCount][10];
      StrGrid.Cells[11,IntCount+1]:=OrderArr[IntCount][11];
      StrGrid.Cells[12,IntCount+1]:=OrderArr[IntCount][12];
      StrGrid.Cells[13,IntCount+1]:=OrderArr[IntCount][13];
      StrGrid.Cells[14,IntCount+1]:=OrderArr[IntCount][14];
      StrGrid.Cells[15,IntCount+1]:=OrderArr[IntCount][15];
      {
      StrGrid.Cells[16,IntCount+1]:=OrderArr[IntCount][16];
      StrGrid.Cells[17,IntCount+1]:=OrderArr[IntCount][17];
      StrGrid.Cells[18,IntCount+1]:=OrderArr[IntCount][18];
      }
      StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[8,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[11,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[12,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[13,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[14,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[15,IntCount+1].HorizontalAlignment:=taCenter;


      IsDrawRect:=False;
{
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[21,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[23,IntCount+2].HorizontalAlignment:=taRightJustify;

    if OrderArr[IntCount][25]='0' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed
    else if OrderArr[IntCount][25]='2' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clBlue;
}
    end;
  end;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  ProgressBar.Position:=100;
  {
  if Not(NoSum) then begin
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[16,StrGrid.RowCount-1]:='Total';
    StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(IntTotalSum);
    StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
  }
  ProgressBar.Visible:=False;
end;

procedure TDailySalesRecapRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
  Initiation:=False;
end;

procedure TDailySalesRecapRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;

  //RefreshData;
  //RefreshGrid;
end;

procedure TDailySalesRecapRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TDailySalesRecapRpt.StrGridDblClick(Sender: TObject);
begin
{
  if (IntRow>MinRowGrid) and (StrGrid.Cells[1,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False)
    end;
  end;
}  
end;

procedure TDailySalesRecapRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TDailySalesRecapRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDailySalesRecapRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TDailySalesRecapRpt.TanggalChange(Sender: TObject);
begin
  if Not(Initiation) then begin
  end;
end;

procedure TDailySalesRecapRpt.SalesPersonChange(Sender: TObject);
begin
  if Not(Initiation) then begin
//    RefreshData;
//    RefreshGrid;
  end;
end;

procedure TDailySalesRecapRpt.SegmentChange(Sender: TObject);
begin
//  RefreshData;
//  RefreshGrid;
end;

procedure TDailySalesRecapRpt.SeatChange(Sender: TObject);
begin
  if Not(Initiation) then begin
//    RefreshData;
//    RefreshGrid;
  end;
end;

procedure TDailySalesRecapRpt.SBUChange(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailySalesRecapRpt.LihatClick(Sender: TObject);
begin
    RefreshData;
    RefreshGrid;
end;

procedure TDailySalesRecapRpt.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

end.
