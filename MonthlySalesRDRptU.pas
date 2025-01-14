unit MonthlySalesRDRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TMonthlySalesRDRpt = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Label3: TLabel;
    Bulan: TComboBox;
    Tahun: TEdit;
    Lihat: TButton;
    Label4: TLabel;
    Label5: TLabel;
    AllSales: TCheckBox;
    SalesPerson: TComboBox;
    Segment: TComboBox;
    AllSegment: TCheckBox;
    ProgressBar: TProgressBar;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    StrGridRecap: TZColorStringGrid;
    StrGridSummary: TZColorStringGrid;
    Button1: TButton;
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
    procedure StrGridSummarySelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StrGridRecapSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    CompId,Month:Integer;
    FormRequest,CustId:String;
    OrderArr,CompanyArr:Array of TArrString35;
    SegmentArr:Array of TArrString10;
    ResumeArr:Array of TArrString4;
    IntRow,IntCol,IsAll,MinRowGrid,CustomerSegment,isSummary:Integer;
    IntTotalSum,IntTotalSumA,IntTotalSumB,IntTotalProjection,IntTotalSumPPN,IntTotalSumPPH,IntTotalSumPayment:Int64;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshGridRecap;
    procedure RefreshGridSummary;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Months:Integer=0;Customer_Segment:Integer=0;is_Summary:Integer=0);Overload;
    procedure RefreshDisplay;
  end;

var
  MonthlySalesRDRpt: TMonthlySalesRDRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, DateUtils;

{$R *.dfm}

constructor TMonthlySalesRDRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TMonthlySalesRDRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Months:Integer=0;Customer_segment:Integer=0;is_Summary:Integer=0);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  isSummary:=is_Summary;
  CustId:=Customer_Id;
  Month:=Months;
  CustomerSegment:=Customer_Segment;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: MonthlySalesRDRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+IntToStr(Months)+','+IntToStr(Customer_Segment)+','+IntToStr(is_Summary),1);
  inherited Create(AOwner);
end;

procedure TMonthlySalesRDRpt.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  StrGridRecap.Visible:=False;
  StrGridSummary.Visible:=False;
  if isSummary=1 Then begin
    Caption:=Caption+' [Rekap]';
    StrGridRecap.Visible:=True;
    StrGridSummary.Visible:=False;
  end else if isSummary=2 Then begin
    Caption:=Caption+' [Summary]';
    StrGridRecap.Visible:=False;
    StrGridSummary.Visible:=True;
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
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=190605';
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

procedure TMonthlySalesRDRpt.InitGrid;
var IntCount,IntCount2:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=34;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=110;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=160;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=180;

  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=35;
  StrGrid.ColWidths[10]:=50;
  StrGrid.ColWidths[11]:=60;
  StrGrid.ColWidths[12]:=40;
  StrGrid.ColWidths[13]:=160;
  StrGrid.ColWidths[14]:=70;
  StrGrid.ColWidths[15]:=60;
  StrGrid.ColWidths[19]:=80;
  StrGrid.ColWidths[20]:=80;
  StrGrid.ColWidths[21]:=80;
  StrGrid.ColWidths[22]:=110;
  StrGrid.ColWidths[27]:=80;
  StrGrid.ColWidths[28]:=100;
  StrGrid.ColWidths[29]:=120;
  StrGrid.ColWidths[30]:=120;
  StrGrid.ColWidths[31]:=180;
  StrGrid.ColWidths[32]:=180;
  StrGrid.ColWidths[33]:=0;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,12,0);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,18,1);
  StrGrid.MergeCells.AddRectXY(19,0,19,1);
  StrGrid.MergeCells.AddRectXY(20,0,20,1);
  StrGrid.MergeCells.AddRectXY(21,0,21,1);
  StrGrid.MergeCells.AddRectXY(22,0,22,1);
//  StrGrid.MergeCells.AddRectXY(23,0,23,1);
  StrGrid.MergeCells.AddRectXY(23,0,28,0);
  StrGrid.MergeCells.AddRectXY(29,0,29,1);
  StrGrid.MergeCells.AddRectXY(30,0,30,1);
  StrGrid.MergeCells.AddRectXY(31,0,31,1);
  StrGrid.MergeCells.AddRectXY(32,0,32,1);
//  StrGrid.MergeCells.AddRectXY(32,0,32,1);
  StrGrid.Cells[0,0]:='Tanggal';
  StrGrid.Cells[1,0]:='No Pesanan';
  StrGrid.Cells[2,0]:='Customer ID GP';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Segment';
  StrGrid.Cells[5,0]:='Group';

  StrGrid.Cells[6,0]:='Contact Person';
  StrGrid.Cells[7,0]:='SC';
  StrGrid.Cells[8,0]:='Keberangkatan';
  StrGrid.Cells[9,0]:='Unit';
  StrGrid.Cells[10,0]:='Armada';
  StrGrid.Cells[10,1]:='Seat';
  StrGrid.Cells[11,1]:='Jenis';
  StrGrid.Cells[12,1]:='Brand';

  StrGrid.Cells[13,0]:='Rute';
  StrGrid.Cells[14,0]:='Gross';
  StrGrid.Cells[15,0]:='Discount';
  StrGrid.Cells[16,0]:='CN (%)';
  StrGrid.Cells[17,0]:='Tol Parkir';
  StrGrid.Cells[18,0]:='Biaya Lain';
  StrGrid.Cells[19,0]:='Nett';
  StrGrid.Cells[20,0]:='PPN';
  StrGrid.Cells[21,0]:='PPH';
  StrGrid.Cells[22,0]:='Total Payment';

  StrGrid.Cells[23,0]:='Pembayaran';
  StrGrid.Cells[23,1]:='Tgl';
  StrGrid.Cells[24,1]:='DP 1';
  StrGrid.Cells[25,1]:='Tgl';
  StrGrid.Cells[26,1]:='DP 2';
  StrGrid.Cells[27,1]:='Tgl';
  StrGrid.Cells[28,1]:='Pelunasan';
  StrGrid.Cells[29,0]:='Keterangan';
  StrGrid.Cells[30,0]:='No Invoice';
  StrGrid.Cells[31,0]:='NPWP';
  StrGrid.Cells[32,0]:='NIK';
  StrGrid.Cells[33,0]:='Discount/Unit';

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

  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[25,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[22,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[23,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[24,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[22,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[23,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[24,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[25,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[26,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[27,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[28,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[29,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[28,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[29,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[30,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[31,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[32,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';

  //InitGridRekap
  MinRowGrid:=1;
  StrGridRecap.RowCount:=2;
  StrGridRecap.ColCount:=4;
  StrGridRecap.ColWidths[0]:=30;
  StrGridRecap.ColWidths[1]:=300;
  StrGridRecap.ColWidths[2]:=150;
  StrGridRecap.ColWidths[3]:=100;

  StrGridRecap.Cells[0,0]:='No.';
  StrGridRecap.Cells[1,0]:='Nama';
  StrGridRecap.Cells[2,0]:='Group';
  StrGridRecap.Cells[3,0]:='Nett';

  StrGridRecap.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridRecap.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridRecap.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGridRecap.CellStyle[3,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGridRecap.ColCount-1 do
    StrGridRecap.Cells[IntCount,2]:='';

  //InitGridSummary
  MinRowGrid:=1;
  StrGridSummary.RowCount:=3;
  StrGridSummary.ColCount:=5;
  StrGridSummary.ColWidths[0]:=30;
  StrGridSummary.ColWidths[1]:=300;
  StrGridSummary.ColWidths[2]:=300;
  StrGridSummary.ColWidths[3]:=120;
  StrGridSummary.ColWidths[4]:=120;

  StrGridSummary.Cells[0,0]:='No.';
  StrGridSummary.Cells[1,0]:='Sales Segment';
  StrGridSummary.Cells[3,0]:='Bulan';
  StrGridSummary.Cells[3,1]:='Thn. Sblm';
  StrGridSummary.Cells[4,1]:='Thn. Saat ini';
  StrGridSummary.MergeCells.AddRectXY(0,0,0,1);
  StrGridSummary.MergeCells.AddRectXY(1,0,2,1);
  StrGridSummary.MergeCells.AddRectXY(3,0,4,0);
  StrGridSummary.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridSummary.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridSummary.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGridSummary.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGridSummary.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGridSummary.CellStyle[4,1].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGridSummary.ColCount-1 do
    StrGridSummary.Cells[IntCount,2]:='';
end;

procedure TMonthlySalesRDRpt.RefreshCombo;
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

    SetLength(SegmentArr,1);
    SetLength(ResumeArr,0);
    SegmentArr[0][0]:= ' ';
    SegmentArr[0][1]:= ' ';
    StrQry:='EXEC GetCustomerSegment;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(SegmentArr,Qry.RecordCount+1);
    SetLength(ResumeArr,Qry.RecordCount);
    IntCount:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SegmentArr[IntCount][0]:=Qry.FieldValues['name']+' - '+Qry.FieldValues['level2_name'] ;
      SegmentArr[IntCount][1]:=Qry.FieldValues['level2_id'];
      ResumeArr[IntCount-1][0]:=Qry.FieldValues['name'];
      ResumeArr[IntCount-1][1]:=Qry.FieldValues['level2_name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    SalesPerson.Items.Add(' ');
    StrQry:='EXEC GetSales '+CompanyArr[SBU.ItemIndex][2]+';';
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

  for IntCount:=1 to 12 do
    Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(FormatDateTime('mmm',Now));
  Tahun.Text:=FormatDateTime('yyyy',Now);
  Main.M_Normal;
end;

procedure TMonthlySalesRDRpt.RefreshData;
var QryOrder,Qry2:TADOQuery;
    StrQry,StrTanggal,StrTanggalBefore,StrDepositDate1,StrDepositDate2,StrCustomerId,StrLocationId,StrCompanyId,StrCustomerSegment,StrSales:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTolParkir,IntBiayaLain, IntResume, IntWehaMart:Integer;
    IntTotal : Int64;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  QryOrder:=TADOQuery.Create(Self);
  QryOrder.Connection:=Main.MyConnection;
  QryOrder.CommandTimeout:=3600;

  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;
  if Main.OpenDb then begin
    {refresh total}
    for IntResume:=0 to High(ResumeArr) do begin
      ResumeArr[IntResume][2]:='';
    end;
    SetLength(OrderArr,0);
    IntTotalSum:=0;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    if Segment.ItemIndex>0 then StrCustomerSegment:=',@SegmentId='+(SegmentArr[Segment.ItemIndex][1]);
    StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)))+
                ',@OutDatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',IncDay(IncMonth(VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)),-1)));
    StrTanggalBefore:='';
    StrSales:='';
    if (SalesPerson.ItemIndex>0) and (AllSales.Checked=False) then
    begin
       StrSales:= ',@SalesId='+QuotedStr(SalesPerson.Text);
    end;

    if CustId<>'' then StrCustomerId:=',@CustomerId='+QuotedStr(CustId);
    //StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+',@PaymentDetail=1'+StrCustomerId+' ;';
    //if isSummary=0 then StrQry:='EXEC GetCustomerOrderList_P '+StrCompanyId+StrTanggal+StrLocationId+StrCustomerId+' ;'
    //else StrQry:='EXEC GetCustomerOrderList_P '+StrCompanyId+StrTanggal+StrLocationId+StrCustomerId+',@isSummary=1 ;';

    if isSummary=2 then
      StrTanggalBefore:=',@OutDatesBefore='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime('1/'+Bulan.Text+'/'+IntToStr(StrToInt(Tahun.Text)-1)) ))+
                        ',@OutDatesToBefore='+QuotedStr(FormatDateTime('yyyy/mm/dd',IncDay(IncMonth(VarToDateTime('1/'+Bulan.Text+'/'+IntToStr(StrToInt(Tahun.Text)-1))),-1)));
    StrQry:='EXEC GetCustomerOrderList_P '+StrCompanyId+StrTanggal+StrTanggalBefore+StrLocationId+StrCustomerId+StrCustomerSegment+StrSales+',@isSummary='+IntToStr(isSummary)+' ;';

    Main.WriteLog('SQL :'+StrQry);
    ProgressBar.Position:=10;
    QryOrder.SQL.Clear;
    QryOrder.SQL.Add(StrQry);
    try
      QryOrder.Open;
      IntCount:=0;
      Label8.Caption := '=>'+Label8.Caption;
      if QryOrder.RecordCount>0 then while not(QryOrder.Eof) do begin
        Application.ProcessMessages;
        ProgressBar.Position:=10+Round((60/QryOrder.RecordCount)*IntCount);
        Label2.Caption := IntToStr(QryOrder.RecNo)+' dari '+IntToStr(QryOrder.RecordCount);

        if isSummary=0 then begin
          SetLength(OrderArr,IntCount+1);
          for IntCount2:=0 to 2 do begin
            IntPayment[IntCount2]:=0;
            StrPayment[IntCount2]:='';
          end;
          StrList:=TStringList.Create;
          StrList:=SplitStrings(QryOrder.FieldValues['payment'],'##');
          if (StrList.Count>=1) and (StrList.Strings[0]<>'') then begin
            StrList2:=TStringList.Create;
            for IntCount2:=0 to StrList.Count-1 do begin
              if IntCount2<2 then IntCount3:=IntCount2 else IntCount3:=2;
              if StrList.Strings[IntCount2]<>'' then begin
                StrList2:=SplitStrings(StrList.Strings[IntCount2],'**');
                StrPayment[IntCount3]:=StrList2.Strings[0];
                IntPayment[IntCount3]:=IntPayment[IntCount3]+StrToInt(StrList2.Strings[1]) ;
              end;
              Application.ProcessMessages;
            end;
            FreeAndNil(StrList2);
          end;
          FreeAndNil(StrList);

          {
          StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(QryOrder.FieldValues['customer_order_id'])+';';
          Main.WriteLog('SQL :'+StrQry);
          Qry2.SQL.Clear;
          Qry2.SQL.Add(StrQry);
          }
          try
          OrderArr[IntCount][0]:=QryOrder.FieldValues['submit_dates'];
          //Qry2.Open;
          //if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
            Application.ProcessMessages;
            SetLength(OrderArr,IntCount+1);

            //OrderArr[IntCount][0]:=Qry.FieldValues['submit_dates'];
            OrderArr[IntCount][1]:=QryOrder.FieldValues['customer_order_id'];
            if QryOrder.FieldValues['gp_customer_number']<>NULL then OrderArr[IntCount][2]:=QryOrder.FieldValues['gp_customer_number'];
            OrderArr[IntCount][3]:=QryOrder.FieldValues['names'];
            OrderArr[IntCount][4]:=QryOrder.FieldValues['segment_name'];
            if QryOrder.FieldValues['group_name']<>NULL then OrderArr[IntCount][5]:=QryOrder.FieldValues['group_name'];

            if QryOrder.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][6]:=QryOrder.FieldValues['contact_person_name'];
            OrderArr[IntCount][7]:=QryOrder.FieldValues['initial_name'];
            OrderArr[IntCount][8]:=QryOrder.FieldValues['from_to_dates2'];
            OrderArr[IntCount][9]:=QryOrder.FieldValues['units'];
            OrderArr[IntCount][10]:=IntToStr(QryOrder.FieldValues['seat'])+' Seats';
            OrderArr[IntCount][11]:=QryOrder.FieldValues['batch_name'];
            OrderArr[IntCount][12]:='WH';
            OrderArr[IntCount][13]:=QryOrder.FieldValues['route'];
            OrderArr[IntCount][14]:=IToCurr(QryOrder.FieldValues['total']);
            if QryOrder.FieldValues['cust_contract_id']<>NULL then OrderArr[IntCount][26]:='Kontrak ('+QryOrder.FieldValues['cust_contract_id']+')';
            if QryOrder.FieldValues['inv_later']='1' then OrderArr[IntCount][26]:='Otorisasi';
            IntTotal:=QryOrder.FieldValues['total'];
            if IntTolParkir>0 then OrderArr[IntCount][17]:=IToCurr(IntTolParkir);

            IntBiayaLain := QryOrder.FieldValues['wehamart']+QryOrder.FieldValues['biaya_lain_lain'];
            if IntBiayaLain>0 then OrderArr[IntCount][18]:=IToCurr(IntBiayaLain);
            if QryOrder.FieldValues['discount_price']>0 then begin
              OrderArr[IntCount][15]:=IToCurr(QryOrder.FieldValues['discount_price']);
              OrderArr[IntCount][19]:=IToCurr(IntTotal-(QryOrder.FieldValues['discount_price'])+IntTolParkir+IntBiayaLain);
            end else if QryOrder.FieldValues['discount_percent']>0 then begin
              OrderArr[IntCount][15]:=IntToStr(QryOrder.FieldValues['discount_percent'])+' %';
            end else begin

            end;
            OrderArr[IntCount][19]:=IToCurr(QryOrder.FieldValues['total_order']);

            if (QryOrder.FieldValues['PphDeduction']>0) then begin
              OrderArr[IntCount][30]:=IToCurr(QryOrder.FieldValues['PphDeduction']);
              OrderArr[IntCount][31]:=IToCurr(QryOrder.FieldValues['total_order']-QryOrder.FieldValues['PphDeduction']+QryOrder.FieldValues['PpnAddition']);
            end else begin
              OrderArr[IntCount][30]:='0';
              OrderArr[IntCount][31]:=IToCurr(QryOrder.FieldValues['total_order']+QryOrder.FieldValues['PpnAddition']);
            end;

            OrderArr[IntCount][32]:=IToCurr(QryOrder.FieldValues['PpnAddition']);
            if QryOrder.FieldValues['PpnAddition']=0 then
            begin
              if QryOrder.FieldValues['npwp']<>NULL then OrderArr[IntCount][33]:=QryOrder.FieldValues['npwp'];
              if QryOrder.FieldValues['nik_number']<>NULL then OrderArr[IntCount][34]:=QryOrder.FieldValues['nik_number'];
            end;
//            OrderArr[IntCount][33]:=IToCurr(QryOrder.FieldValues['total_order']+QryOrder.FieldValues['PpnAddition']);


            {
            if QryOrder.FieldValues['discount_percent']>0 then
              OrderArr[IntCount][19]:=IToCurr( QryOrder.FieldValues['total_order']-(QryOrder.FieldValues['total_order']*QryOrder.FieldValues['discount_percent']/100) )
            else
              OrderArr[IntCount][19]:=IToCurr( QryOrder.FieldValues['total_order']-(QryOrder.FieldValues['discount_price']*QryOrder.FieldValues['jumlah_unit_jalan']/QryOrder.FieldValues['jumlah_unit_jalan']) );
            }
            for IntCount2:=0 to 1 do begin
              if (IntPayment[IntCount2]>0) then begin
                OrderArr[IntCount][20+(IntCount2*2)]:=StrPayment[IntCount2];
                OrderArr[IntCount][21+(IntCount2*2)]:=IToCurr(IntPayment[IntCount2]);
                if IntPayment[IntCount2]<SToInt(OrderArr[IntCount][19]) then begin
                  OrderArr[IntCount][26]:='DP';
                end;
              end;
            end;
            if QryOrder.FieldValues['invoice_no']<>NULL then OrderArr[IntCount][27]:=QryOrder.FieldValues['invoice_no'];
            if SToInt(OrderArr[IntCount][19])<=(IntPayment[0]+IntPayment[1]+IntPayment[2]) then OrderArr[IntCount][26]:='Lunas';
              if QryOrder.FieldValues['discount_per_unit']<>NULL then OrderArr[IntCount][28]:=QryOrder.FieldValues['discount_per_unit'];
            //Qry2.Next;
          //if not(Qry2.Eof) then Inc(IntCount);
          //end;
          //Qry2.Close;

            Except on E:Exception do
              Label7.Caption := E.Message+StrQry;
          End;
          QryOrder.Next;
          Inc(IntCount);
        end
        else if isSummary=1 then begin //proses recap
          SetLength(OrderArr,IntCount+1);
          try
            OrderArr[IntCount][0]:='';//QryOrder.FieldValues['customer_id'];
            Application.ProcessMessages;
            SetLength(OrderArr,IntCount+1);
            OrderArr[IntCount][1]:=QryOrder.FieldValues['names'];
            OrderArr[IntCount][2]:=QryOrder.FieldValues['segment_name'];
            OrderArr[IntCount][3]:=QryOrder.FieldValues['total_order'];
            Except on E:Exception do
              Label7.Caption := E.Message+StrQry;
          End;
          QryOrder.Next;
          Inc(IntCount);
        end else if isSummary=2 then begin //proses summary
          SetLength(OrderArr,IntCount+1);
          try
            Application.ProcessMessages;
            SetLength(OrderArr,IntCount+1);
            OrderArr[IntCount][0]:=QryOrder.FieldValues['name'];
            OrderArr[IntCount][1]:=QryOrder.FieldValues['level2_name'];
            OrderArr[IntCount][2]:=QryOrder.FieldValues['level2_code'];
            OrderArr[IntCount][3]:=QryOrder.FieldValues['level2_id'];
            OrderArr[IntCount][4]:=QryOrder.FieldValues['before'];
            OrderArr[IntCount][5]:=QryOrder.FieldValues['now'];
            Except on E:Exception do
              Label7.Caption := E.Message+StrQry;
          End;
          QryOrder.Next;
          Inc(IntCount);
        end
      end;
    except
      on E:Exception do
        MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+E.Message+Chr(13)+Chr(13)+StrQry),'Laporan Pesanan Bulanan perArmada Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
    {Get Projection}
    if isSummary=2 then begin
      StrQry:='EXEC GetValueProjection '+StrCompanyId+StrLocationId+',@Periode='+Tahun.Text+',@Month='+IntToStr(Bulan.ItemIndex+1);
      Main.WriteLog('SQL :'+StrQry);
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then
        while not(Qry2.Eof) do begin
          IntTotalProjection:=Qry2.FieldValues['total'];
          Qry2.Next;
        end;

    end;
  end;  {if Main.OpenDb then begin}

  FreeAndNil(QryOrder);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMonthlySalesRDRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntResume,IntCount3:Integer;
    IntTotal : Int64;
    StrOrderId:String;
    IsDrawRect,IsResumeMatch:Boolean;
    Qry:TADOQuery;
    StrQry:String;
begin
  ProgressBar.Position:=80;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGrid.CellStyle[4,StrGrid.RowCount-1].BGColor:=clWindow;
    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  IntTotalSum:=0;
  IntTotalSumPPN:=0;
  IntTotalSumPPH:=0;
  IntTotalSumPayment:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    ProgressBar.Position:=80+Round((20/Length(OrderArr))*IntCount);
    if StrOrderId<>OrderArr[IntCount][1] then begin
      Application.ProcessMessages;
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=OrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=OrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+2]:=OrderArr[IntCount][6];
      StrGrid.Cells[7,IntCount+2]:=OrderArr[IntCount][7];
      StrGrid.Cells[15,IntCount+2]:=OrderArr[IntCount][15];
      StrGrid.Cells[16,IntCount+2]:=OrderArr[IntCount][16];
      StrGrid.Cells[17,IntCount+2]:=OrderArr[IntCount][17];
      StrGrid.Cells[18,IntCount+2]:=OrderArr[IntCount][18];
      StrGrid.Cells[19,IntCount+2]:=OrderArr[IntCount][19];
      StrGrid.Cells[23,IntCount+2]:=OrderArr[IntCount][20];
      StrGrid.Cells[24,IntCount+2]:=OrderArr[IntCount][21];
      StrGrid.Cells[25,IntCount+2]:=OrderArr[IntCount][22];
      StrGrid.Cells[26,IntCount+2]:=OrderArr[IntCount][23];
      StrGrid.Cells[27,IntCount+2]:=OrderArr[IntCount][24];
      StrGrid.Cells[28,IntCount+2]:=OrderArr[IntCount][25];
      StrGrid.Cells[29,IntCount+2]:=OrderArr[IntCount][26];
      StrGrid.Cells[30,IntCount+2]:=OrderArr[IntCount][27];
      StrGrid.Cells[31,IntCount+2]:=OrderArr[IntCount][33];
      StrGrid.Cells[32,IntCount+2]:=OrderArr[IntCount][34];

      StrGrid.Cells[22,IntCount+2]:=OrderArr[IntCount][31];

      StrGrid.Cells[20,IntCount+2]:=OrderArr[IntCount][32];
      StrGrid.Cells[21,IntCount+2]:=OrderArr[IntCount][30];

      IntTotalSum:=IntTotalSum+StrToInt64(ToString(OrderArr[IntCount][19]));
      IntTotalSumPPN:=IntTotalSumPPN+StrToInt64(ToString(OrderArr[IntCount][32]));
      IntTotalSumPPH:=IntTotalSumPPH+StrToInt64(ToString(OrderArr[IntCount][30]));
      IntTotalSumPayment:=IntTotalSumPayment+StrToInt64(ToString(OrderArr[IntCount][31]));
      IsDrawRect:=False;
      IsResumeMatch:=False;
      IntResume:=0;
      if StrToInt64(ToString(OrderArr[IntCount][19]))>9 then begin
        for IntCount3:=0 to Length(ResumeArr)-1 do begin
          if ResumeArr[IntCount3][1]=OrderArr[IntCount][4] then begin
            IsResumeMatch:=True;
            IntResume:=IntCount3;
          end;
        end;
        if ResumeArr[IntResume][2]='' then ResumeArr[IntResume][2]:='0';
        ResumeArr[IntResume][2]:=IToCurr(StrToInt64(ToString(ResumeArr[IntResume][2]))+StrToInt64(ToString(OrderArr[IntCount][19])));
      end;
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
      StrGrid.MergeCells.AddRectXY(6,IntStartRow+2,6,IntCount+2);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow+2,7,IntCount+2);
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
      StrGrid.MergeCells.AddRectXY(26,IntStartRow+2,26,IntCount+2);
      StrGrid.MergeCells.AddRectXY(27,IntStartRow+2,27,IntCount+2);
      StrGrid.MergeCells.AddRectXY(28,IntStartRow+2,28,IntCount+2);
      StrGrid.MergeCells.AddRectXY(29,IntStartRow+2,29,IntCount+2);
      StrGrid.MergeCells.AddRectXY(30,IntStartRow+2,30,IntCount+2);
      StrGrid.MergeCells.AddRectXY(31,IntStartRow+2,31,IntCount+2);
      StrGrid.MergeCells.AddRectXY(32,IntStartRow+2,32,IntCount+2);
      IntTotal:=IntTotal+SToInt(StrGrid.Cells[19,IntStartRow+2]);
    end;
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
//    StrGrid.Cells[26,IntCount+2]:=OrderArr[IntCount][26];
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[18,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[20,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[21,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[22,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[23,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[24,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[26,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[28,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
  ProgressBar.Position:=100;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[18,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(IntTotalSum);
  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(IntTotalSumPPN);
  StrGrid.CellStyle[20,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(IntTotalSumPPH);
  StrGrid.CellStyle[21,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(IntTotalSumPayment);
  StrGrid.CellStyle[22,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount2:=0 to Length(ResumeArr)-1 do begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=ResumeArr[IntCount2][0];
    StrGrid.Cells[3,StrGrid.RowCount-1]:=ResumeArr[IntCount2][1];
    StrGrid.Cells[4,StrGrid.RowCount-1]:=ResumeArr[IntCount2][2];
    StrGrid.CellStyle[4,StrGrid.RowCount-1].BGColor:=clGray;
    StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;

  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('total_sales')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+')AND(year='+Tahun.Text+');';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then
      StrQry:='UPDATE wh_dashboard SET value='+QuotedStr(IntToStr(IntTotalSum))+',update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE (name='+QuotedStr('total_sales')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+') AND (year='+Tahun.Text+');'
    else
      StrQry:='INSERT INTO wh_dashboard (name,company_id,location_id,month,year,value,update_user)'+
              'VALUES ('+QuotedStr('total_sales')+','+CompanyId+','+LocationId+','+IntToStr(Bulan.ItemIndex+1)+','+Tahun.Text+
              ','+QuotedStr(IntToStr(IntTotalSum))+','+QuotedStr(User)+')';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,4);
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
      except on E:Exception do begin
          Main.WriteLog('Tidak dapat menyimpan nilai pesanan bulanan-Laporan Pesanan Bulanan perArmada jalan');
          MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Laporan Pesanan Bulanan perArmada Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
        end;
    end;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRDRpt.RefreshGridRecap;
var IntCount,IntCount2,IntCount3,IntStartRow,IntResume,IntCount4:Integer;
    IntTotal : Int64;
    StrOrderId:String;
    IsDrawRect,IsResumeMatch:Boolean;
    Qry:TADOQuery;
    StrQry,StrSegment:String;
begin
  ProgressBar.Position:=80;

  for IntCount:=0 to StrGridRecap.ColCount-1 do
    for IntCount2:=1 to StrGridRecap.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGridRecap.MergeCells.DeleteItem(IntTotal);
    end;
  {reset grid}
  for IntCount:=0 to StrGridRecap.ColCount-1 do
    for IntCount2:=1 to StrGridRecap.RowCount-1 do begin
      StrGridRecap.Cells[IntCount,IntCount2]:='';
      StrGridRecap.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGridRecap.CellStyle[4,StrGrid.RowCount-1].BGColor:=clWindow;
      StrGridRecap.CellStyle[IntCount,IntCount2].Font.Style:= [];
      StrGridRecap.CellStyle[IntCount,IntCount2].HorizontalAlignment:=taLeftJustify;
    end;

  if Length(OrderArr)>0 then StrGridRecap.RowCount:=Length(OrderArr)+2
  else begin
    StrGridRecap.RowCount:=3;
  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  IntTotalSum:=0;
  StrSegment:='';
  IntCount3:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
      ProgressBar.Position:=80+Round((20/Length(OrderArr))*IntCount);
      Application.ProcessMessages;
      try
        StrSegment:=OrderArr[IntCount-1][2];
        except on e:exception do
        StrSegment:='';
      end;
      IntStartRow:=IntCount;
      If (StrSegment<>OrderArr[IntCount][2]) and (IntCount>0) then begin
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Subtotal';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:=IToCurr(IntTotal);
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Target';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Selisih';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Variance';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        IntCount3:=IntCount3+2;
        IntTotal:=0;

        StrGridRecap.RowCount:=StrGridRecap.RowCount+5;
      end;

      StrGridRecap.Cells[0,IntCount+StrGridRecap.FixedRows+IntCount3]:=IntToStr(IntCount+1);
      StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:=OrderArr[IntCount][1];
      StrGridRecap.Cells[2,IntCount+StrGridRecap.FixedRows+IntCount3]:=OrderArr[IntCount][2];
      StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:=IToCurr(StrToInt64(OrderArr[IntCount][3]));
      StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
      IntTotal:=IntTotal+StrToInt64(ToString(OrderArr[IntCount][3]));
      IntTotalSum:=IntTotalSum+StrToInt64(ToString(OrderArr[IntCount][3]));

      If (IntCount=Length(OrderArr)-1) then begin
        StrGridRecap.CellStyle[0,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taLeftJustify;
        StrGridRecap.CellStyle[0,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [];
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taLeftJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [];
        StrGridRecap.CellStyle[2,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taLeftJustify;
        StrGridRecap.CellStyle[2,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Subtotal';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:=IToCurr(IntTotal);
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Target';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Selisih';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];

        IntCount3:=IntCount3+1;
        StrGridRecap.Cells[1,IntCount+StrGridRecap.FixedRows+IntCount3]:='Variance';
        StrGridRecap.Cells[3,IntCount+StrGridRecap.FixedRows+IntCount3]:='0';
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[1,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;
        StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].Font.Style:= [fsBold];
        IntTotal:=0;
        StrGridRecap.RowCount:=StrGridRecap.RowCount+5;
      end;
      StrGridRecap.CellStyle[3,IntCount+StrGridRecap.FixedRows+IntCount3].HorizontalAlignment:=taRightJustify;

  end;

  ProgressBar.Position:=100;
  StrGridRecap.RowCount:=StrGridRecap.RowCount+1;
  //for IntCount:=0 to StrGridRecap.ColCount-1 do StrGridRecap.Cells[IntCount,StrGrid.RowCount-1]:='';

  StrGridRecap.Cells[1,StrGridRecap.RowCount-1]:='Total';
  StrGridRecap.Cells[3,StrGridRecap.RowCount-1]:=IToCurr(IntTotalSum);
  //StrGridRecap.CellStyle[3,StrGridRecap.RowCount-1].HorizontalAlignment:=taRightJustify;
(*
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount2:=0 to Length(ResumeArr)-1 do begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=ResumeArr[IntCount2][0];
    StrGrid.Cells[3,StrGrid.RowCount-1]:=ResumeArr[IntCount2][1];
    StrGrid.Cells[4,StrGrid.RowCount-1]:=ResumeArr[IntCount2][2];
    StrGrid.CellStyle[4,StrGrid.RowCount-1].BGColor:=clGray;
    StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  end;
*)

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRDRpt.RefreshGridSummary;
var IntCount,IntCount2,IntCount3,IntStartRow,IntResume:Integer;
    IntTotal : Int64;
    StrOrderId:String;
    IsDrawRect,IsResumeMatch:Boolean;
    Qry:TADOQuery;
    StrQry,StrSegment:String;
begin
  ProgressBar.Position:=80;
  if Length(OrderArr)>0 then StrGridSummary.RowCount:=Length(OrderArr)+3
  else begin
    StrGridSummary.RowCount:=3;
  end;

  for IntCount:=0 to StrGridSummary.ColCount-1 do
    for IntCount2:=1 to StrGridSummary.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGridSummary.MergeCells.DeleteItem(IntTotal);
    end;
  for IntCount:=0 to StrGridSummary.ColCount-1 do
    for IntCount2:=1 to StrGridSummary.RowCount-1 do begin
      StrGridSummary.Cells[IntCount,IntCount2]:='';
      StrGridSummary.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGridSummary.CellStyle[4,StrGrid.RowCount-1].BGColor:=clWindow;
      StrGridSummary.CellStyle[IntCount,IntCount2].Font.Style:= [];
    end;

  StrGridSummary.Cells[3,0]:=LongMonthNames[Bulan.ItemIndex+1];
  StrGridSummary.Cells[3,1]:=IntToStr(StrToInt(Tahun.Text)-1);
  StrGridSummary.Cells[4,1]:=Tahun.Text;
  StrGridSummary.MergeCells.AddRectXY(0,0,0,1);
  StrGridSummary.MergeCells.AddRectXY(1,0,2,1);
  StrGridSummary.MergeCells.AddRectXY(3,0,4,0);

  IntStartRow:=0;
  IntTotal:=0;
  IntTotalSumA:=0;
  IntTotalSumB:=0;
  StrSegment:='';
  IntCount3:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
      ProgressBar.Position:=80+Round((20/Length(OrderArr))*IntCount);
      Application.ProcessMessages;
      IntTotalSumA:=IntTotalSumA+StrToInt64(ToString(OrderArr[IntCount][4]));
      IntTotalSumB:=IntTotalSumB+StrToInt64(ToString(OrderArr[IntCount][5]));
      StrGridSummary.CellStyle[3, IntCount+2].HorizontalAlignment:=taRightJustify;
      StrGridSummary.CellStyle[4, IntCount+2].HorizontalAlignment:=taRightJustify;
      if StrSegment<>OrderArr[IntCount][0] then begin
        Application.ProcessMessages;
        StrSegment:=OrderArr[IntCount][0];
        IntStartRow:=IntCount;
        Inc(IntCount3);
        StrGridSummary.Cells[0,IntCount+2]:=IntToStr(IntCount3);
        StrGridSummary.Cells[1,IntCount+2]:=OrderArr[IntCount][0];
        IsDrawRect:=False;
      end else if (IntCount<Length(OrderArr)-1) then begin
        if (StrSegment<>OrderArr[IntCount+1][0]) then IsDrawRect:=True;
      end else IsDrawRect:=True;

      if IsDrawRect=True then begin
        StrGridSummary.MergeCells.AddRectXY(0,IntStartRow+2, 0,IntCount+2);
        StrGridSummary.MergeCells.AddRectXY(1,IntStartRow+2, 1,IntCount+2);
        Application.ProcessMessages;
      end;
      StrGridSummary.Cells[2,IntCount+2]:=OrderArr[IntCount][1];
      StrGridSummary.Cells[3,IntCount+2]:=IToCurr(StrToInt64(OrderArr[IntCount][4]));
      StrGridSummary.Cells[4,IntCount+2]:=IToCurr(StrToInt64(OrderArr[IntCount][5]));
  End;

  ProgressBar.Position:=100;
  StrGridSummary.RowCount:=StrGridSummary.RowCount+1;
  StrGridSummary.CellStyle[2, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[3, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[4, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[2,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.CellStyle[3,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.CellStyle[4,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.Cells[2,StrGridSummary.RowCount-1]:='Total';
  StrGridSummary.Cells[3,StrGridSummary.RowCount-1]:=IToCurr(IntTotalSumA);
  StrGridSummary.Cells[4,StrGridSummary.RowCount-1]:=IToCurr(IntTotalSumB);

  StrGridSummary.RowCount:=StrGridSummary.RowCount+1;

  StrGridSummary.RowCount:=StrGridSummary.RowCount+1;
  StrGridSummary.CellStyle[2, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[4, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[2,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.CellStyle[4,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.Cells[2,StrGridSummary.RowCount-1]:='Target';
  StrGridSummary.Cells[4,StrGridSummary.RowCount-1]:=IToCurr(IntTotalProjection);

  StrGridSummary.RowCount:=StrGridSummary.RowCount+1;
  StrGridSummary.CellStyle[2, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[4, StrGridSummary.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGridSummary.CellStyle[2,StrGridSummary.RowCount-1].Font.Style:= [fsBold];
  StrGridSummary.CellStyle[4,StrGridSummary.RowCount-1].Font.Style:= [fsBold];  
  StrGridSummary.Cells[2,StrGridSummary.RowCount-1]:='Selisih';
  if IntTotalSumB-IntTotalProjection<0 then
    StrGridSummary.Cells[4,StrGridSummary.RowCount-1]:='('+IToCurr(IntTotalSumB-IntTotalProjection)+')'
  else
    StrGridSummary.Cells[4,StrGridSummary.RowCount-1]:=IToCurr(IntTotalSumB-IntTotalProjection);

  for IntCount:=0 to StrGridSummary.ColCount-1 do
    for IntCount2:=1 to StrGridSummary.RowCount-1 do begin
      StrGridSummary.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      //StrGridSummary.CellStyle[IntCount,IntCount2].Font.Style:= [];
    end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRDRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TMonthlySalesRDRpt.RefreshDisplay ;
begin
  Init;
  InitGrid;
  RefreshCombo;
  if Month>0 then Bulan.ItemIndex:=Month-1;
  if CustId<>'' then Begin
    RefreshData;
    if isSummary=0 then RefreshGrid
    else if isSummary=1 then RefreshGridRecap
    else if isSummary=2 then RefreshGridSummary;
  end;
end;

procedure TMonthlySalesRDRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlySalesRDRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False)
    end;
  end;
end;

procedure TMonthlySalesRDRpt.SelesaiClick(Sender: TObject);
begin
  Main.M_Normal;
  Close;
end;

procedure TMonthlySalesRDRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlySalesRDRpt.ToXCelClick(Sender: TObject);
begin
  if isSummary=0 then begin
    if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
  end else if isSummary=1 then begin
    if ToExcel4(StrGridRecap) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
  end else if isSummary=2 then begin
    if ToExcel4(StrGridSummary) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
  end;
end;

procedure TMonthlySalesRDRpt.LihatClick(Sender: TObject);
begin
//  RefreshDisplay;
  RefreshData;
  if isSummary=0 then RefreshGrid
  else if isSummary=1 then RefreshGridRecap
  else if isSummary=2 then RefreshGridSummary;
end;

procedure TMonthlySalesRDRpt.AllSalesClick(Sender: TObject);
begin
  if AllSales.Checked=True then begin
    SalesPerson.Enabled:=False;
  end else SalesPerson.Enabled:=True;
end;

procedure TMonthlySalesRDRpt.AllSegmentClick(Sender: TObject);
begin
  if AllSegment.Checked=True then begin
    Segment.Enabled:=False;
  end else Segment.Enabled:=True;
end;

procedure TMonthlySalesRDRpt.StrGridSummarySelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlySalesRDRpt.StrGridRecapSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlySalesRDRpt.Button1Click(Sender: TObject);
Var
  IntCount,IntCount2:Integer;
begin
  {reset grid}
  for IntCount:=0 to StrGridRecap.ColCount-1 do
    for IntCount2:=1 to StrGridRecap.RowCount-1 do begin
      StrGridRecap.Cells[IntCount,IntCount2]:='';
      StrGridRecap.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGridRecap.CellStyle[4,StrGrid.RowCount-1].BGColor:=clWindow;
      StrGridRecap.CellStyle[IntCount,IntCount2].Font.Style:= [];
      StrGridRecap.CellStyle[IntCount,IntCount2].HorizontalAlignment:=taLeftJustify;
    end;
end;

end.
