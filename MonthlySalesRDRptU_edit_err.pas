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
    Edit1: TEdit;
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
    CompId,Month:Integer;
    FormRequest,CustId:String;
    OrderArr,DataOrderArr,CompanyArr:Array of TArrString30;
    SegmentArr:Array of TArrString10;
    ResumeArr:Array of TArrString4;
    IntRow,IntCol,IsAll,MinRowGrid,CustomerSegment:Integer;
    IntTotalSum:Int64;
    //OrderArr:Array of TArrString8;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Months:Integer=0;Customer_Segment:Integer=0);Overload;
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

constructor TMonthlySalesRDRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6;Months:Integer=0;Customer_segment:Integer=0);
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
  Month:=Months;
  CustomerSegment:=Customer_Segment;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: MonthlySalesRDRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+IntToStr(Months)+','+IntToStr(Customer_Segment),1);
  inherited Create(AOwner);
end;

procedure TMonthlySalesRDRpt.Init;
begin
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Bulan.Text:='';
  Tahun.Text:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  if UserLevel<69 then ToXCel.Enabled:=False;
  ProgressBar.Visible:=False;
end;

procedure TMonthlySalesRDRpt.InitGrid;
var IntCount,IntCount2:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=28;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=110;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=160;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=180;

  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=40;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=35;
  StrGrid.ColWidths[10]:=50;
  StrGrid.ColWidths[11]:=60;
  StrGrid.ColWidths[12]:=40;
  StrGrid.ColWidths[13]:=160;
  StrGrid.ColWidths[14]:=70;
  StrGrid.ColWidths[15]:=60;
  StrGrid.ColWidths[19]:=80;
  StrGrid.ColWidths[27]:=140;
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
  StrGrid.MergeCells.AddRectXY(26,0,26,1);
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
  StrGrid.Cells[13,0]:='Rute';
  StrGrid.Cells[14,0]:='Gross';
  StrGrid.Cells[15,0]:='Discount';
  StrGrid.Cells[16,0]:='CN (%)';
  StrGrid.Cells[17,0]:='Tol Parkir';
  StrGrid.Cells[18,0]:='Biaya Lain';
  StrGrid.Cells[19,0]:='Nett';
  StrGrid.Cells[20,0]:='Pembayaran';
  StrGrid.Cells[26,0]:='Keterangan';
  StrGrid.Cells[27,0]:='No Invoice';
  StrGrid.Cells[10,1]:='Seat';
  StrGrid.Cells[11,1]:='Jenis';
  StrGrid.Cells[12,1]:='Brand';
  StrGrid.Cells[20,1]:='Tgl';
  StrGrid.Cells[21,1]:='DP 1';
  StrGrid.Cells[22,1]:='Tgl';
  StrGrid.Cells[23,1]:='DP 2';
  StrGrid.Cells[24,1]:='Tgl';
  StrGrid.Cells[25,1]:='Pelunasan';
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

procedure TMonthlySalesRDRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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

procedure TMonthlySalesRDRpt.RefreshData;
var QryOrder,QryOrderDetail:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,StrCustomerId,StrLocationId,StrCompanyId,StrCustomerSegment:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain,IntResume,IntCountOrder,IntJumlah:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  QryOrder:=TADOQuery.Create(Self);
  QryOrder.Connection:=Main.MyConnection;
  QryOrder.CommandTimeout:=3600;

  QryOrderDetail:=TADOQuery.Create(Self);
  QryOrderDetail.Connection:=Main.MyConnection;
  QryOrderDetail.CommandTimeout:=9000;
  if Main.OpenDb then begin
    {refresh total}
    for IntResume:=0 to High(ResumeArr) do begin
      ResumeArr[IntResume][2]:='';
    end;
    SetLength(OrderArr,0);
    IntTotalSum:=0;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    if CustomerSegment>0 then StrCustomerSegment:=',@Segment='+IntToStr(CustomerSegment);
    StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)))+
                ',@OutDatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',IncDay(IncMonth(VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)),-1)));
    if CustId<>'' then StrCustomerId:=',@CustomerId='+QuotedStr(CustId);
    StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+',@PaymentDetail=1'+StrCustomerId+' ;';
    Main.WriteLog('SQL :'+StrQry);
    ProgressBar.Position:=10;
    QryOrder.SQL.Clear;
    QryOrder.SQL.Add(StrQry);
    try
      QryOrder.Open;

      IntCountOrder:=0;
      SetLength(DataOrderArr, QryOrder.RecordCount);
      if (QryOrder.RecordCount>0) then while not(QryOrder.Eof) do begin
        {
        DataOrderArr[IntCountOrder][0]:=QryOrder.FieldValues['vehicle_id'];
        DataOrderArr[IntCountOrder][1]:=QryOrder.FieldValues['batch_name'];
        DataOrderArr[IntCountOrder][2]:=IntToStr(QryOrder.FieldValues['seat']);
        DataOrderArr[IntCountOrder][3]:=VarToStr(QryOrder.FieldValues['name']);
        DataOrderArr[IntCountOrder][4]:=QryOrder.FieldValues['body_id'];
        DataOrderArr[IntCountOrder][5]:=QryOrder.FieldValues['license_plate'];
        DataOrderArr[IntCountOrder][6]:=QryOrder.FieldValues['is_facelift'];
        }
        DataOrderArr[IntCountOrder][1]:=VarToStr(QryOrder.FieldValues['customer_order_id']);
        DataOrderArr[IntCountOrder][2]:=QryOrder.FieldValues['payment'];
        DataOrderArr[IntCountOrder][3]:=QryOrder.FieldValues['submit_dates'];
        DataOrderArr[IntCountOrder][4]:=VarToStr(QryOrder.FieldValues['gp_customer_number']);
        DataOrderArr[IntCountOrder][5]:=QryOrder.FieldValues['names'];
       	DataOrderArr[IntCountOrder][6]:=QryOrder.FieldValues['segment_name'];
       	DataOrderArr[IntCountOrder][7]:=VarToStr(QryOrder.FieldValues['group_name']);
       	DataOrderArr[IntCountOrder][8]:=VarToStr(QryOrder.FieldValues['contact_person_name']);
       	DataOrderArr[IntCountOrder][9]:=QryOrder.FieldValues['initial_name'];
       	DataOrderArr[IntCountOrder][10]:=VarToStr(QryOrder.FieldValues['cust_contract_id']);
       	DataOrderArr[IntCountOrder][11]:=QryOrder.FieldValues['inv_later'];
       	DataOrderArr[IntCountOrder][12]:=QryOrder.FieldValues['total'];
       	DataOrderArr[IntCountOrder][13]:=QryOrder.FieldValues['discount_price'];
       	DataOrderArr[IntCountOrder][14]:=QryOrder.FieldValues['discount_percent'];
       	DataOrderArr[IntCountOrder][15]:=QryOrder.FieldValues['total_order'];

        QryOrder.Next;
        Inc(IntCountOrder);
      end;
      QryOrder.Close;

      IntCount:=0;
      Label8.Caption := '=>'+Label8.Caption;
      Edit1.Text := '';
      if IntCountOrder>0 then for IntJumlah:=0 to IntCountOrder do begin //QryOrder.RecordCount =  IntCountOrder
        Application.ProcessMessages;
        ProgressBar.Position:=10+Round((60/IntCountOrder)*IntCount);//QryOrder.RecordCount =  IntCountOrder
        Label2.Caption := IntToStr(IntJumlah)+' dari '+IntToStr(IntCountOrder);  //QryOrder.RecNo=
        SetLength(OrderArr,IntCount+1);
        for IntCount2:=0 to 2 do begin
          IntPayment[IntCount2]:=0;
          StrPayment[IntCount2]:='';
        end;
        StrList:=TStringList.Create;
        StrList:=SplitStrings(DataOrderArr[IntJumlah][2],'##');
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
        StrQry:='EXEC GetCustomerOrderDetailList '+QuotedStr(DataOrderArr[IntJumlah][1])+';'; //QryOrder.FieldValues['customer_order_id']
        Main.WriteLog('SQL :'+StrQry);
        QryOrderDetail.SQL.Clear;
        QryOrderDetail.SQL.Add(StrQry);
        OrderArr[IntCount][0]:=DataOrderArr[IntJumlah][3];//QryOrder.FieldValues['submit_dates'];
        QryOrderDetail.Open;
        try
          if QryOrderDetail.RecordCount>0 then while not(QryOrderDetail.Eof) do begin
              Application.ProcessMessages;
              SetLength(OrderArr,IntCount+1);

              //OrderArr[IntCount][0]:=Qry.FieldValues['submit_dates'];
              OrderArr[IntCount][1]:=DataOrderArr[IntJumlah][1];//QryOrder.FieldValues['customer_order_id'];
              if Trim(DataOrderArr[IntJumlah][4])<>'' then OrderArr[IntCount][2]:=DataOrderArr[IntJumlah][4];//QryOrder.FieldValues['gp_customer_number'];
              OrderArr[IntCount][3]:=DataOrderArr[IntJumlah][5];//QryOrder.FieldValues['names'];
              OrderArr[IntCount][4]:=DataOrderArr[IntJumlah][6];//QryOrder.FieldValues['segment_name'];
              if Trim(DataOrderArr[IntJumlah][7])<>'' then OrderArr[IntCount][5]:=DataOrderArr[IntJumlah][7];//QryOrder.FieldValues['group_name'];

              if Trim(DataOrderArr[IntJumlah][8])<>'' then OrderArr[IntCount][6]:=DataOrderArr[IntJumlah][8];//QryOrder.FieldValues['contact_person_name'];
              OrderArr[IntCount][7]:=DataOrderArr[IntJumlah][9];//QryOrder.FieldValues['initial_name'];
              OrderArr[IntCount][8]:=QryOrderDetail.FieldValues['from_to_dates2'];
              OrderArr[IntCount][9]:=QryOrderDetail.FieldValues['units'];
              OrderArr[IntCount][10]:=IntToStr(QryOrderDetail.FieldValues['seat'])+' Seats';
              OrderArr[IntCount][11]:=QryOrderDetail.FieldValues['batch_name'];
              OrderArr[IntCount][12]:='WH';
              OrderArr[IntCount][13]:=QryOrderDetail.FieldValues['route'];
              OrderArr[IntCount][14]:=IToCurr(QryOrderDetail.FieldValues['total']);
              if Trim(DataOrderArr[IntJumlah][10])<>'' then OrderArr[IntCount][26]:='Kontrak ('+DataOrderArr[IntJumlah][10]+')';//QryOrder.FieldValues['cust_contract_id']
              if DataOrderArr[IntJumlah][11]='1' then OrderArr[IntCount][26]:='Otorisasi';//QryOrder.FieldValues['inv_later']
              IntTotal:=StrToInt(DataOrderArr[IntJumlah][12]);//QryOrder.FieldValues['total'];
              if IntTolParkir>0 then OrderArr[IntCount][17]:=IToCurr(IntTolParkir);
              if IntBiayaLain>0 then OrderArr[IntCount][18]:=IToCurr(IntBiayaLain);
              if StrToInt(DataOrderArr[IntJumlah][13])>0 then begin //QryOrder.FieldValues['discount_price']
                OrderArr[IntCount][15]:=IToCurr(StrToInt(DataOrderArr[IntJumlah][13]));//QryOrder.FieldValues['discount_price']
                OrderArr[IntCount][19]:=IToCurr(IntTotal-(StrToInt(DataOrderArr[IntJumlah][13]))+IntTolParkir+IntBiayaLain);//QryOrder.FieldValues['discount_price']
              end else if StrToInt(DataOrderArr[IntJumlah][14])>0 then begin //QryOrder.FieldValues['discount_percent']
                OrderArr[IntCount][15]:=DataOrderArr[IntJumlah][14]+' %'; //QryOrder.FieldValues['discount_percent']
              end else begin

              end;
              OrderArr[IntCount][19]:=IToCurr(StrToInt(DataOrderArr[IntJumlah][15]));//QryOrder.FieldValues['total_order']
              for IntCount2:=0 to 1 do begin
                if (IntPayment[IntCount2]>0) then begin
                  OrderArr[IntCount][20+(IntCount2*2)]:=StrPayment[IntCount2];
                  OrderArr[IntCount][21+(IntCount2*2)]:=IToCurr(IntPayment[IntCount2]);
                  if IntPayment[IntCount2]<SToInt(OrderArr[IntCount][19]) then begin
                    OrderArr[IntCount][26]:='DP';
                  end;
                end;
              end;
              if QryOrderDetail.FieldValues['invoice_no']<>NULL then OrderArr[IntCount][27]:=QryOrderDetail.FieldValues['invoice_no'];
              if SToInt(OrderArr[IntCount][19])<=(IntPayment[0]+IntPayment[1]+IntPayment[2]) then OrderArr[IntCount][26]:='Lunas';
              QryOrderDetail.Next;
              Inc(IntCount);
          end;
        Except on E:Exception do begin
            Label7.Caption := E.Message+StrQry;
            Edit1.Text := Edit1.Text + StrQry;
          end;
        End;
        QryOrderDetail.Close;
        //QryOrder.Next;
        Application.ProcessMessages;
        Inc(IntCount)
      end;

    except
      on E:Exception do
        MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+E.Message+Chr(13)+Chr(13)+StrQry),'Laporan Pesanan Bulanan perArmada Jalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;
  //QryOrder.Close;
  FreeAndNil(QryOrderDetail);
  FreeAndNil(QryOrder);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMonthlySalesRDRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntResume,IntCount3:Integer;
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
      StrGrid.Cells[20,IntCount+2]:=OrderArr[IntCount][20];
      StrGrid.Cells[21,IntCount+2]:=OrderArr[IntCount][21];
      StrGrid.Cells[22,IntCount+2]:=OrderArr[IntCount][22];
      StrGrid.Cells[23,IntCount+2]:=OrderArr[IntCount][23];
      StrGrid.Cells[24,IntCount+2]:=OrderArr[IntCount][24];
      StrGrid.Cells[25,IntCount+2]:=OrderArr[IntCount][25];
      StrGrid.Cells[26,IntCount+2]:=OrderArr[IntCount][26];
      StrGrid.Cells[27,IntCount+2]:=OrderArr[IntCount][27];
      IntTotalSum:=IntTotalSum+StrToInt(ToString(OrderArr[IntCount][19]));
      IsDrawRect:=False;
      IsResumeMatch:=False;
      IntResume:=0;
      if StrToInt(ToString(OrderArr[IntCount][19]))>9 then begin
        for IntCount3:=0 to Length(ResumeArr)-1 do begin
          if ResumeArr[IntCount3][1]=OrderArr[IntCount][4] then begin
            IsResumeMatch:=True;
            IntResume:=IntCount3;
          end;
        end;
        if ResumeArr[IntResume][2]='' then ResumeArr[IntResume][2]:='0';
        ResumeArr[IntResume][2]:=IToCurr(StrToInt(ToString(ResumeArr[IntResume][2]))+StrToInt(ToString(OrderArr[IntCount][19])));
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
      IntTotal:=IntTotal+SToInt(StrGrid.Cells[19,IntStartRow+2]);
    end;
    StrGrid.Cells[8,IntCount+2]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OrderArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=OrderArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=OrderArr[IntCount][14];
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[18,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[21,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[23,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[25,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
  ProgressBar.Position:=100;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[18,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(IntTotalSum);
  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
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

procedure TMonthlySalesRDRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TMonthlySalesRDRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  if Month>0 then Bulan.ItemIndex:=Month-1;
  if CustId<>'' then Begin
    RefreshData;
    RefreshGrid;
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
  Close;
end;

procedure TMonthlySalesRDRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlySalesRDRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TMonthlySalesRDRpt.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
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

end.
