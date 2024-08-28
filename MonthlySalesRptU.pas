unit MonthlySalesRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TMonthlySalesRpt = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Bulan: TComboBox;
    Label3: TLabel;
    Lihat: TButton;
    Tahun: TEdit;
    Label4: TLabel;
    AllSales: TCheckBox;
    SalesPerson: TComboBox;
    Label5: TLabel;
    Segment: TComboBox;
    AllSegment: TCheckBox;
    ProgressBar: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure AllSalesClick(Sender: TObject);
    procedure AllSegmentClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    OrderArr,CompanyArr:Array of TArrString30;
    SegmentArr:Array of TArrString2;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    IntTotalSum:Int64;
    Initiation,UpdateTime:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Update_Time:Boolean=False);Overload;
    procedure RefreshDisplay;
  end;

var
  MonthlySalesRpt: TMonthlySalesRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, DateUtils;

{$R *.dfm}

constructor TMonthlySalesRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  UpdateTime:=False;
  inherited Create(AOwner);
end;

constructor TMonthlySalesRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Update_Time:Boolean=False);
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
  UpdateTime:=Update_Time;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: MonthlySalesRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+BoolToStr(Update_Time),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TMonthlySalesRpt.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Case IsAll of
    8:Caption:='Laporan Pesanan Bulanan Batal';
    else Caption:='Laporan Pesanan Bulanan';
  end;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Bulan.Text:='';
  Tahun.Text:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=190604';
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
//  if UserLevel<69 then ToXCel.Enabled:=False;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=26;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=70;

  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=160;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=120;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=35;
  StrGrid.ColWidths[9]:=50;
  StrGrid.ColWidths[10]:=60;
  StrGrid.ColWidths[11]:=40;
  StrGrid.ColWidths[12]:=160;
  StrGrid.ColWidths[14]:=50;
  StrGrid.ColWidths[18]:=80;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);

  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,11,0);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,18,1);
  StrGrid.MergeCells.AddRectXY(19,0,24,0);
  StrGrid.MergeCells.AddRectXY(25,0,25,1);
  if UpdateTime=False then StrGrid.Cells[0,0]:='Tanggal'
  else StrGrid.Cells[0,0]:='Tanggal Batal';
  StrGrid.Cells[1,0]:='Tanggal Buat';

  StrGrid.Cells[2,0]:='No Pesanan';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Group';
  StrGrid.Cells[5,0]:='Contact Person';
  StrGrid.Cells[6,0]:='SC';
  StrGrid.Cells[7,0]:='Keberangkatan';
  StrGrid.Cells[8,0]:='Unit';
  StrGrid.Cells[9,0]:='Armada';
  StrGrid.Cells[10,0]:='Rute';
  StrGrid.Cells[13,0]:='Gross';
  StrGrid.Cells[14,0]:='Discount';
  StrGrid.Cells[15,0]:='CN (%)';
  StrGrid.Cells[16,0]:='Tol Parkir';
  StrGrid.Cells[17,0]:='Biaya Lain';
  StrGrid.Cells[18,0]:='Nett';
  StrGrid.Cells[19,0]:='Pembayaran';
  StrGrid.Cells[25,0]:='Keterangan';
  StrGrid.Cells[9,1]:='Seat';
  StrGrid.Cells[10,1]:='Jenis';
  StrGrid.Cells[11,1]:='Brand';
  StrGrid.Cells[19,1]:='Tgl';
  StrGrid.Cells[20,1]:='DP 1';
  StrGrid.Cells[21,1]:='Tgl';
  StrGrid.Cells[22,1]:='DP 2';
  StrGrid.Cells[23,1]:='Tgl';
  StrGrid.Cells[24,1]:='Pelunasan';
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
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[25,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[22,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[23,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[24,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TMonthlySalesRpt.RefreshCombo;
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
    SetLength(SegmentArr,1);
    SegmentArr[0][0]:= ' ';
    SegmentArr[0][1]:= ' ';
    StrQry:='EXEC GetCustomerSegment;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(SegmentArr,Qry.RecordCount+1);
    IntCount:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SegmentArr[IntCount][0]:=Qry.FieldValues['name']+' - '+Qry.FieldValues['level2_name'] ;
      SegmentArr[IntCount][1]:=Qry.FieldValues['level2_id'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    SalesPerson.Items.Add(' ');
    StrQry:='SELECT dbo.GetUsername(username) AS sales FROM wh_user a '+
            'LEFT JOIN wh_user_detail b ON b.user_id=a.username WHERE b.department_id=14 ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SalesPerson.Items.Add(Qry.FieldValues['sales']);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SegmentArr)-1 do
    Segment.Items.Add(SegmentArr[IntCount][0]);
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=1 to 12 do
    Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(FormatDateTime('mmm',Now));
  Tahun.Text:=FormatDateTime('yyyy',Now);
  Main.M_Normal;
end;

procedure TMonthlySalesRpt.RefreshData;
var Qry,Qry2:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,StrSales,StrSegment,StrLocationId,StrCompanyId:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  ProgressBar.Visible:=True;
  if (Bulan.Text<>'') and (Tahun.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Qry2.CommandTimeout := 3600;
    Main.M_Busy;
    if Main.OpenDb then begin
      SetLength(OrderArr,0);
      IntTotalSum:=0;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      if AllSales.Checked=True then StrSales:=''
      else StrSales:=',@SalesId='+QuotedStr(SalesPerson.Text);
      if AllSegment.Checked=True then StrSegment:=''
      else StrSegment:=',@SegmentId='+QuotedStr(SegmentArr[Segment.ItemIndex][1]);
      StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)))+
                 ',@DatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',IncDay(IncMonth(VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)),-1)));
      StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
      StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+StrSales+StrSegment+',@PaymentDetail=1 ;';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      try
        Qry.Open;
        IntCount:=0;
        ProgressBar.Position:=10;
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
          if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
            SetLength(OrderArr,IntCount+1);
            if UpdateTime=False then begin
              OrderArr[IntCount][0]:=Qry.FieldValues['submit_dates'];
            end else begin
              OrderArr[IntCount][0]:=Qry.FieldValues['update_time'];
            end;
            OrderArr[IntCount][1]:=Qry.FieldValues['submit_dates'];

            OrderArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
            OrderArr[IntCount][3]:=Qry.FieldValues['names'];
            OrderArr[IntCount][4]:=Qry.FieldValues['segment_name'];
            if Qry.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][5]:=Qry.FieldValues['contact_person_name'];
            OrderArr[IntCount][6]:=Qry.FieldValues['initial_name'];
            OrderArr[IntCount][7]:=Qry2.FieldValues['from_to_dates2'];
            OrderArr[IntCount][8]:=Qry2.FieldValues['units'];
            OrderArr[IntCount][9]:=IntToStr(Qry2.FieldValues['seat'])+' Seats';
            OrderArr[IntCount][10]:=Qry2.FieldValues['batch_name'];
            OrderArr[IntCount][11]:='WH';
            OrderArr[IntCount][12]:=Qry2.FieldValues['route'];
            OrderArr[IntCount][13]:=IToCurr(Qry2.FieldValues['total']+Qry2.FieldValues['total_addday']);
            if Qry.FieldValues['cust_contract_id']<>NULL then OrderArr[IntCount][25]:='Kontrak ('+Qry.FieldValues['cust_contract_id']+')';
            if Qry.FieldValues['inv_later']='1' then OrderArr[IntCount][25]:='Otorisasi';
            IntTotal:=Qry.FieldValues['total'];
            if IntTolParkir>0 then OrderArr[IntCount][16]:=IToCurr(Qry.FieldValues['tol_parkir']);
            if IntBiayaLain>0 then OrderArr[IntCount][17]:=IToCurr(Qry.FieldValues['biaya_lain']);
            if Qry.FieldValues['discount_price']>0 then begin
              OrderArr[IntCount][14]:=IToCurr(Qry.FieldValues['discount_price']);
//              OrderArr[IntCount][18]:=IToCurr(IntTotal-(Qry.FieldValues['discount_price'])+IntTolParkir+IntBiayaLain);
            end else if Qry.FieldValues['discount_percent']>0 then begin
              OrderArr[IntCount][14]:=IntToStr(Qry.FieldValues['discount_percent'])+' %';
//              OrderArr[IntCount][18]:=IToCurr(IntTotal-((IntTotal*Qry.FieldValues['discount_percent'])/100)+IntTolParkir+IntBiayaLain);
            end else begin
//              OrderArr[IntCount][18]:=IToCurr(IntTotal+IntTolParkir+IntBiayaLain);
            end;
            OrderArr[IntCount][18]:=IToCurr(Qry.FieldValues['total_order']);
            for IntCount2:=0 to 1 do begin
              if (IntPayment[IntCount2]>0) then begin
                OrderArr[IntCount][19+(IntCount2*2)]:=StrPayment[IntCount2];
                OrderArr[IntCount][20+(IntCount2*2)]:=IToCurr(IntPayment[IntCount2]);
                if IntPayment[IntCount2]<SToInt(OrderArr[IntCount][18]) then begin
                  OrderArr[IntCount][25]:='DP';
                end;
              end;
            end;
            if SToInt(OrderArr[IntCount][18])<=(IntPayment[0]+IntPayment[1]+IntPayment[2]) then OrderArr[IntCount][25]:='Lunas';
            Qry2.Next;
            if not(Qry2.Eof) then Inc(IntCount);
          end;
          Qry2.Close;
          IntTotalSum:=IntTotalSum+StrToInt(ToString(OrderArr[IntCount][18]));
          Qry.Next;
          Inc(IntCount)
        end;
        Qry.Close;
      except
        on E:Exception do
          MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+E.Message),'Laporan Pesanan Bulanan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end;
    end;
    FreeAndNil(Qry2);
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TMonthlySalesRpt.RefreshGrid;
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
  ProgressBar.Position:=80;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    ProgressBar.Position:=80+Round((10/Length(OrderArr))*IntCount);
    if StrOrderId<>OrderArr[IntCount][2] then begin
      StrOrderId:=OrderArr[IntCount][2];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];

      StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
      StrGrid.Cells[15,IntCount+2]:=OrderArr[IntCount][15];
      StrGrid.Cells[16,IntCount+2]:=OrderArr[IntCount][16];
      StrGrid.Cells[17,IntCount+2]:=OrderArr[IntCount][17];
      StrGrid.Cells[18,IntCount+2]:=OrderArr[IntCount][18];
      StrGrid.Cells[19,IntCount+2]:=OrderArr[IntCount][19];
      StrGrid.Cells[20,IntCount+2]:=OrderArr[IntCount][20];
      StrGrid.Cells[21,IntCount+2]:=OrderArr[IntCount][21];
      StrGrid.Cells[22,IntCount+2]:=OrderArr[IntCount][22];
      StrGrid.Cells[23,IntCount+2]:=OrderArr[IntCount][23];
      StrGrid.Cells[24,IntCount+2]:=OrderArr[IntCount][24];
      StrGrid.Cells[25,IntCount+2]:=OrderArr[IntCount][25];


      IsDrawRect:=False;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);

      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+2,3,IntCount+2);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+2,4,IntCount+2);
      StrGrid.MergeCells.AddRectXY(5,IntStartRow+2,5,IntCount+2);
      StrGrid.MergeCells.AddRectXY(6,IntStartRow+2,6,IntCount+2);
	  
      StrGrid.MergeCells.AddRectXY(14,IntStartRow+2,14,IntCount+2);
      StrGrid.MergeCells.AddRectXY(15,IntStartRow+2,15,IntCount+2);
      StrGrid.MergeCells.AddRectXY(16,IntStartRow+2,16,IntCount+2);
      StrGrid.MergeCells.AddRectXY(17,IntStartRow+2,17,IntCount+2);
      StrGrid.MergeCells.AddRectXY(18,IntStartRow+2,18,IntCount+2);
      StrGrid.MergeCells.AddRectXY(19,IntStartRow+2,19,IntCount+2);
      StrGrid.MergeCells.AddRectXY(20,IntStartRow+2,20,IntCount+2);
      StrGrid.MergeCells.AddRectXY(21,IntStartRow+2,21,IntCount+2);
      StrGrid.MergeCells.AddRectXY(22,IntStartRow+2,22,IntCount+2);
      StrGrid.MergeCells.AddRectXY(23,IntStartRow+2,23,IntCount+2);
      StrGrid.MergeCells.AddRectXY(24,IntStartRow+2,24,IntCount+2);
      StrGrid.MergeCells.AddRectXY(25,IntStartRow+2,25,IntCount+2);
    end;
    StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[18,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[20,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[22,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[24,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
  ProgressBar.Position:=100;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[17,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(IntTotalSum);
  StrGrid.CellStyle[18,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
  Initiation:=False;
end;

procedure TMonthlySalesRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
//  RefreshData;
//  RefreshGrid;
end;

{
procedure TMonthlySalesRpt.CariChange(Sender: TObject);
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
}

procedure TMonthlySalesRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlySalesRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False)
    end;
  end;
end;

procedure TMonthlySalesRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMonthlySalesRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlySalesRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TMonthlySalesRpt.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TMonthlySalesRpt.AllSalesClick(Sender: TObject);
begin
  if AllSales.Checked=True then begin
    SalesPerson.Enabled:=False;
  end else SalesPerson.Enabled:=True;
end;

procedure TMonthlySalesRpt.AllSegmentClick(Sender: TObject);
begin
  if AllSegment.Checked=True then begin
    Segment.Enabled:=False;
  end else Segment.Enabled:=True;
end;

end.

