unit DailyCheckRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls, Menus,ClipBrd;

type
  TDailyCheckRpt = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    Button1: TButton;
    Label2: TLabel;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    Label3: TLabel;
    grpGroupTotal: TGroupBox;
    lbl1: TLabel;
    edtTotalUnitOperasi: TEdit;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    Batch: TComboBox;
    Seat: TComboBox;
    ChkSewaLuar: TCheckBox;
    Label7: TLabel;
    Paid: TComboBox;
    chkStandby: TCheckBox;
    chkLuarkota: TCheckBox;
    Customer: TEdit;
    Label8: TLabel;
    procedure Tan(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Copy1Click(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure ShowPelangganClick(Sender: TObject);
    procedure CustomerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest:String;
    OrderArr,CompanyArr:Array of TArrString30;
    BatchArr,SeatArr:Array of TArrString2;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshSeat;
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String='BUS';Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);Overload;
    procedure RefreshDisplay;

  end;

var
  DailyCheckRpt: TDailyCheckRpt;
  CustId: String;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, SPJFormBusU, 
  CustomerListU;

{$R *.dfm}
{
constructor TDailyCheckRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;
}
constructor TDailyCheckRpt.Create(AOwner:TComponent;Company_Id:String='BUS';Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);
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
  Main.WriteLog('Form Open: DailyCheckRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All),1);
  inherited Create(AOwner);
end;

procedure TDailyCheckRpt.Init;
begin
  Customer.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TDailyCheckRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=28;
  StrGrid.ColWidths[0]:=95;
  StrGrid.ColWidths[1]:=160;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=30;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=25;
  StrGrid.ColWidths[6]:=50;
  StrGrid.ColWidths[7]:=110;
  StrGrid.ColWidths[8]:=220;
  StrGrid.ColWidths[9]:=80;
  StrGrid.ColWidths[10]:=40;
  StrGrid.ColWidths[11]:=45;
  StrGrid.ColWidths[12]:=65;
  StrGrid.ColWidths[13]:=100;
  StrGrid.ColWidths[14]:=100;
  StrGrid.ColWidths[15]:=95;
  StrGrid.ColWidths[16]:=80;
  StrGrid.ColWidths[17]:=45;
  StrGrid.ColWidths[18]:=65;
  StrGrid.ColWidths[19]:=100;
  StrGrid.ColWidths[20]:=120;
  StrGrid.ColWidths[21]:=100;
  StrGrid.ColWidths[24]:=340;
  StrGrid.ColWidths[22]:=0;
  StrGrid.ColWidths[23]:=0;
  StrGrid.ColWidths[25]:=340;
  StrGrid.ColWidths[26]:=100;
  StrGrid.ColWidths[27]:=70;

  //col 18=customer_order_detail_id
  //col 19=reserved_order_id
  StrGrid.MergeCells.AddRectXY(0,0,8,0);
  StrGrid.MergeCells.AddRectXY(9,0,14,0);
  StrGrid.MergeCells.AddRectXY(15,0,27,0);
  StrGrid.MergeCells.AddRectXY(6,1,7,1);
  StrGrid.MergeCells.AddRectXY(13,1,14,1);
  StrGrid.MergeCells.AddRectXY(0,1,0,2);
  StrGrid.MergeCells.AddRectXY(1,1,1,2);
  StrGrid.MergeCells.AddRectXY(2,1,2,2);
  StrGrid.MergeCells.AddRectXY(3,1,3,2);
  StrGrid.MergeCells.AddRectXY(4,1,4,2);
  StrGrid.MergeCells.AddRectXY(5,1,5,2);
  StrGrid.MergeCells.AddRectXY(8,1,8,2);
  StrGrid.MergeCells.AddRectXY(9,1,9,2);

  StrGrid.MergeCells.AddRectXY(10,1,10,2);
  StrGrid.MergeCells.AddRectXY(11,1,11,2);
  StrGrid.MergeCells.AddRectXY(12,1,12,2);
  StrGrid.MergeCells.AddRectXY(15,1,15,2);
  StrGrid.MergeCells.AddRectXY(16,1,16,2);
  StrGrid.MergeCells.AddRectXY(17,1,17,2);
  StrGrid.MergeCells.AddRectXY(18,1,18,2);
  StrGrid.MergeCells.AddRectXY(19,1,19,2);
  StrGrid.MergeCells.AddRectXY(20,1,20,2);
  StrGrid.MergeCells.AddRectXY(21,1,21,2);
  StrGrid.MergeCells.AddRectXY(24,1,24,2);
  StrGrid.MergeCells.AddRectXY(25,1,25,2);
  StrGrid.MergeCells.AddRectXY(26,1,26,2);
  StrGrid.MergeCells.AddRectXY(27,1,27,2);

  StrGrid.Cells[0,0]:='Pesanan';
  StrGrid.Cells[9,0]:='Penjadwalan';
  StrGrid.Cells[15,0]:='Surat Jalan';
  StrGrid.Cells[0,1]:='No Pesanan';
  StrGrid.Cells[1,1]:='Nama';
  StrGrid.Cells[2,1]:='Contact Person';
  StrGrid.Cells[3,1]:='Sales';
  StrGrid.Cells[4,1]:='Keberangkatan';
  StrGrid.Cells[5,1]:='Unit';
  StrGrid.Cells[6,1]:='Armada';
  StrGrid.Cells[8,1]:='Rute';
  StrGrid.Cells[9,1]:='Berangkat';
  StrGrid.Cells[10,1]:='Standby';
  StrGrid.Cells[11,1]:='No Body';
  StrGrid.Cells[12,1]:='No Polisi';
  StrGrid.Cells[13,1]:='Pengemudi';
  StrGrid.Cells[15,1]:='No SJ';
  StrGrid.Cells[16,1]:='Tanggal';
  StrGrid.Cells[17,1]:='No Body';
  StrGrid.Cells[18,1]:='No Polisi';
  StrGrid.Cells[19,1]:='Pengemudi';
  StrGrid.Cells[20,1]:='No Telp Pengemudi';
  StrGrid.Cells[21,1]:='Kenek';
  StrGrid.Cells[24,1]:='Keterangan';
  StrGrid.Cells[25,1]:='Lokasi Standby';
  StrGrid.Cells[26,1]:='Status Kirim WA';
  StrGrid.Cells[27,1]:='Customer ID';

  StrGrid.Cells[6,2]:='Seat';
  StrGrid.Cells[7,2]:='Jenis';
  StrGrid.Cells[13,2]:='Pertama';
  StrGrid.Cells[14,2]:='Kedua';
  StrGrid.CellStyle[0,0].BGColor:=clLtGray;
  StrGrid.CellStyle[9,0].BGColor:=clLtGray;
  StrGrid.CellStyle[15,0].BGColor:=clLtGray;
  StrGrid.CellStyle[0,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[9,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[15,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[24,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[25,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[26,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[27,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,2].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TDailyCheckRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
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

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id='+StrCompanyId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
    
  Main.M_Normal;
end;

procedure TDailyCheckRpt.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid,StrStandBy,StrLuarKota,StrCustomerName:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit:Integer;
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
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;
  Main.M_Busy;
  Label3.Caption:= '';
  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);
    StrTanggal:=',@OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    if CekTglSampai.Checked=True then StrToDates:=',@OutDatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglSampai.Date));
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];

    if Batch.Text='All' then begin
      StrBatch:='';
    end else begin
      StrBatch:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end;

    if ChkSewaLuar.Checked=True then begin
      StrChkSewaLuar:=',@SewaLuar=''1'' ';
    end else begin
      StrChkSewaLuar:='';
    end;

    if Paid.Text='Paid' then
    begin
      StrPaid:=',@Paid=''PAID'' ';
    end
    else if Paid.Text='Belum Paid' then
    begin
      StrPaid:=',@Paid=''BELUM PAID'' ';
    end else begin
      StrPaid:='';
    end;

    if chkStandby.Checked=True then begin
      StrStandBy:=',@StandByTime=''00:00'' ';
    end else begin
      StrStandBy:='';
    end;

    if chkLuarkota.Checked=True then begin
      StrLuarKota:=',@IsLuarKota=''LUAR KOTA'' ';
    end else begin
      StrLuarKota:='';
    end;

    if Customer.Text<>'' then
    begin
      StrCustomerName:=',@CustomerName='+QuotedStr(Customer.Text);
    end else begin
      StrCustomerName:='';
    end;

    StrQry:='EXEC GetCustomerOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+',@ListType=1'+StrToDates+',@isQuick=1'+StrBatch+StrChkSewaLuar+StrPaid+StrStandBy+StrLuarKota+StrCustomerName+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Label3.Caption:= IntToStr(Qry.RecNo)+' dari '+IntToStr(Qry.RecordCount);
      SetLength(OrderArr,IntCount+1);
      OrderArr[IntCount][0]:=Qry.FieldValues['customer_order_id'];
      OrderArr[IntCount][1]:=Qry.FieldValues['names'];
      if Qry.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][2]:=Qry.FieldValues['contact_person_name'];
      OrderArr[IntCount][3]:=Qry.FieldValues['initial_name'];
      OrderArr[IntCount][4]:=Qry.FieldValues['from_to_dates2'];
      OrderArr[IntCount][5]:=Qry.FieldValues['units'];
      IntTotalUnit := IntTotalUnit+ Qry.FieldValues['units'];

      OrderArr[IntCount][6]:=IntToStr(Qry.FieldValues['seat'])+' Seats';
      OrderArr[IntCount][7]:=Qry.FieldValues['batch_name'];
      OrderArr[IntCount][8]:=Qry.FieldValues['route'];

      StrQry:='EXEC GetReservedOrderDetailDetail @CustomerOrderDetailId='+QuotedStr(Qry.FieldValues['customer_order_detail_id'])+',@SJDetail=1'+StrChkSewaLuar+StrStandBy+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(OrderArr,IntCount+1);
          OrderArr[IntCount][0]:=Qry.FieldValues['customer_order_id'];
          OrderArr[IntCount][1]:=Qry.FieldValues['names'];
          if Qry.FieldValues['contact_person_name']<>NULL then OrderArr[IntCount][2]:=Qry.FieldValues['contact_person_name'];
          OrderArr[IntCount][3]:=Qry.FieldValues['initial_name'];
          OrderArr[IntCount][4]:=Qry.FieldValues['from_to_dates2'];
          OrderArr[IntCount][5]:=Qry.FieldValues['units'];
          OrderArr[IntCount][6]:=IntToStr(Qry.FieldValues['seat'])+' Seats';
          OrderArr[IntCount][7]:=Qry.FieldValues['batch_name'];
          OrderArr[IntCount][8]:=Qry.FieldValues['route'];
        end;
        OrderArr[IntCount][9]:=Qry2.FieldValues['from_dates'];
        if Qry2.FieldValues['standby_time']<>NULL then OrderArr[IntCount][10]:=Qry2.FieldValues['standby_time'];
        if Qry2.FieldValues['body_id']<>NULL then OrderArr[IntCount][11]:=Qry2.FieldValues['body_id'];
        if Qry2.FieldValues['license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry2.FieldValues['license_plate'],2,1))^)=False then
          OrderArr[IntCount][12]:=Copy(Qry2.FieldValues['license_plate'],1,1)+' '+Copy(Qry2.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry2.FieldValues['license_plate'],6,Length(Qry2.FieldValues['license_plate'])+1)
        else
          OrderArr[IntCount][12]:=Copy(Qry2.FieldValues['license_plate'],1,2)+' '+Copy(Qry2.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry2.FieldValues['license_plate'],7,Length(Qry2.FieldValues['license_plate'])+1);
        if Qry2.FieldValues['driver_name']<>NULL then OrderArr[IntCount][13]:=Qry2.FieldValues['driver_name'];
        if Qry2.FieldValues['driver_name2']<>NULL then OrderArr[IntCount][14]:=Qry2.FieldValues['driver_name2'];
        if Qry2.FieldValues['vhc_trans_id']<>NULL then OrderArr[IntCount][15]:=Qry2.FieldValues['vhc_trans_id'];
        if Qry2.FieldValues['trans_date']<>NULL then OrderArr[IntCount][16]:=Qry2.FieldValues['trans_date'];
        if Qry2.FieldValues['trans_body_id']<>NULL then OrderArr[IntCount][17]:=Qry2.FieldValues['trans_body_id'];
        if Qry2.FieldValues['trans_license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry2.FieldValues['trans_license_plate'],2,1))^)=False then
          OrderArr[IntCount][18]:=Copy(Qry2.FieldValues['trans_license_plate'],1,1)+' '+Copy(Qry2.FieldValues['trans_license_plate'],2,4)+
                              ' '+Copy(Qry2.FieldValues['trans_license_plate'],6,Length(Qry2.FieldValues['trans_license_plate'])+1)
        else
          OrderArr[IntCount][18]:=Copy(Qry2.FieldValues['trans_license_plate'],1,2)+' '+Copy(Qry2.FieldValues['trans_license_plate'],3,4)+
                              ' '+Copy(Qry2.FieldValues['trans_license_plate'],7,Length(Qry2.FieldValues['trans_license_plate'])+1);
        if Qry2.FieldValues['trans_name']<>NULL then OrderArr[IntCount][19]:=Qry2.FieldValues['trans_name'];

        if Qry2.FieldValues['trans_codriver_name']<>NULL then OrderArr[IntCount][20]:=Qry2.FieldValues['trans_codriver_name'];

        if Qry2.FieldValues['ket_order']<>NULL then OrderArr[IntCount][21]:=Qry2.FieldValues['ket_order'];
        if Qry2.FieldValues['status_wa']<>NULL then OrderArr[IntCount][24]:=Qry2.FieldValues['status_wa'];

        OrderArr[IntCount][22]:=Qry.FieldValues['customer_order_detail_id'];
        if Qry2.FieldValues['reserved_order_id']<>NULL then OrderArr[IntCount][23]:=Qry2.FieldValues['reserved_order_id'];
        if Qry2.FieldValues['no_driver']<>NULL then OrderArr[IntCount][25]:=Qry2.FieldValues['no_driver'];
        if Qry2.FieldValues['pickup_point']<>NULL then OrderArr[IntCount][26]:=Qry2.FieldValues['pickup_point'];
        if Qry2.FieldValues['customer_id']<>NULL then OrderArr[IntCount][27]:=Qry2.FieldValues['customer_id'];
        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
    edtTotalUnitOperasi.Text := IToCurr(IntTotalUnit);
    Label3.Caption:= '';
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TDailyCheckRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=3 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+3
  else begin
    StrGrid.RowCount:=4;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,3]:='';
    StrGrid.CellStyle[IntCount,3].Font.Color:=clWindowText;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>OrderArr[IntCount][0])  then begin
      StrOrderId:=OrderArr[IntCount][0];
      IntStartRow:=IntCount;
      IntStartRow2:=IntCount;
      StrGrid.Cells[0,IntCount+3]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+3]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+3]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+3]:=OrderArr[IntCount][3];
      StrGrid.Cells[27,IntCount+3]:=OrderArr[IntCount][27];
      IsDrawRect:=False;
      IsDrawRect2:=False;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][0]) then IsDrawRect:=True;
    end else IsDrawRect:=True;

    if (StrCustOrderDetailId<>OrderArr[IntCount][21]+' '+OrderArr[IntCount][6]) then begin
      IntStartRow2:=IntCount;
      if (OrderArr[IntCount][21]+' '+OrderArr[IntCount][6]<>'') then begin
        StrCustOrderDetailId:=OrderArr[IntCount][21]+' '+OrderArr[IntCount][6];
        IsDrawRect2:=False;
      end;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrCustOrderDetailId<>OrderArr[IntCount+1][21]+' '+OrderArr[IntCount][6]) and (OrderArr[IntCount][21]+' '+OrderArr[IntCount][6]<>'') then IsDrawRect2:=True;
    end else if OrderArr[IntCount][21]+' '+OrderArr[IntCount][6]<>'' then IsDrawRect2:=True;

    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+3,0,IntCount+3);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+3,1,IntCount+3);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+3,2,IntCount+3);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+3,3,IntCount+3);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+3,4,IntCount+3);
      StrGrid.MergeCells.AddRectXY(27,IntStartRow+3,27,IntCount+3);
    end;
    if IsDrawRect2=True then begin
      StrGrid.MergeCells.AddRectXY(5,IntStartRow2+3,5,IntCount+3);
      StrGrid.MergeCells.AddRectXY(6,IntStartRow2+3,6,IntCount+3);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow2+3,7,IntCount+3);
    end;
    StrGrid.Cells[4,IntCount+3]:=OrderArr[IntCount][4];
    StrGrid.Cells[5,IntCount+3]:=OrderArr[IntCount][5];
    StrGrid.Cells[6,IntCount+3]:=OrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+3]:=OrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+3]:=OrderArr[IntCount][8];
    StrGrid.Cells[9,IntCount+3]:=OrderArr[IntCount][9];
    StrGrid.Cells[10,IntCount+3]:=OrderArr[IntCount][10];
    StrGrid.Cells[11,IntCount+3]:=OrderArr[IntCount][11];
    StrGrid.Cells[12,IntCount+3]:=OrderArr[IntCount][12];
    StrGrid.Cells[13,IntCount+3]:=OrderArr[IntCount][13];
    StrGrid.Cells[14,IntCount+3]:=OrderArr[IntCount][14];
    StrGrid.Cells[15,IntCount+3]:=OrderArr[IntCount][15];
    StrGrid.Cells[16,IntCount+3]:=OrderArr[IntCount][16];
    StrGrid.Cells[17,IntCount+3]:=OrderArr[IntCount][17];
    StrGrid.Cells[18,IntCount+3]:=OrderArr[IntCount][18];
    StrGrid.Cells[19,IntCount+3]:=OrderArr[IntCount][19];
    StrGrid.Cells[20,IntCount+3]:=OrderArr[IntCount][25];
    StrGrid.Cells[21,IntCount+3]:=OrderArr[IntCount][20];
    StrGrid.Cells[24,IntCount+3]:=OrderArr[IntCount][21];
    StrGrid.Cells[22,IntCount+3]:=OrderArr[IntCount][22];
    StrGrid.Cells[23,IntCount+3]:=OrderArr[IntCount][23];
    StrGrid.Cells[25,IntCount+3]:=OrderArr[IntCount][26];
    StrGrid.Cells[26,IntCount+3]:=OrderArr[IntCount][24];


    StrGrid.CellStyle[3,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[6,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[10,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[26,IntCount+3].HorizontalAlignment:=taCenter;
  end;
end;

procedure TDailyCheckRpt.RefreshSeat;
var StrQry,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    StrQry:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TDailyCheckRpt.Tan(Sender: TObject);
begin
  RefreshDisplay;

end;

procedure TDailyCheckRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshSeat;
  Paid.ItemIndex:=0;
  ChkSewaLuar.Checked:=False;
end;

procedure TDailyCheckRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TDailyCheckRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if IsAll<>7 then begin
      if (IntCol<=8) then begin
        if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[0,IntRow],False)
      end;
      if (IntCol>=9) and (IntCol<=13) then begin
        if Main.IsFormOpen('BookingForm')=False then BookingForm:=TBookingForm.Create(Self,StrGrid.Cells[21,IntRow],False)
      end;
      if (IntCol>=15) and (IntCol<20) then begin
        if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[15,IntRow],False);
      end else if (IntCol=21) then begin
        ShowMessage(StrGrid.Cells[21,IntRow]);
      end;
    end else begin
      if (IntCol>=14) and (IntCol<20) then begin
        if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[14,IntRow],False);
      end else if (IntCol=21) then begin
        ShowMessage(StrGrid.Cells[21,IntRow]);
      end;
    end;
  end else begin
    if (IntRow>MinRowGrid) and (StrGrid.Cells[15,IntRow]<>'') then begin
      if (IntCol>=14) and (IntCol<20)  then begin
        if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[15,IntRow],False);
      end else if (IntCol=21) then begin
        ShowMessage(StrGrid.Cells[21,IntRow]);
      end;
    end;
  end;
end;

procedure TDailyCheckRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TDailyCheckRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDailyCheckRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TDailyCheckRpt.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TDailyCheckRpt.CekTglSampaiClick(Sender: TObject);
begin
  if CekTglSampai.Checked=True then TglSampai.Enabled:=True
  else TglSampai.Enabled:=False;
end;

procedure TDailyCheckRpt.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = 67) or (Key = 99)) and (Shift=[ssCtrl]) then
    Copy1Click(Nil);
end;

procedure TDailyCheckRpt.Copy1Click(Sender: TObject);
var
  S: string;
  GRect: TGridRect;
  C, R: Integer;
begin
  GRect := StrGrid.Selection;
  S  := '';
  for R := GRect.Top to GRect.Bottom do
  begin
    for C := GRect.Left to GRect.Right do
    begin
      if C = GRect.Right then  S := S + (StrGrid.Cells[C, R])
      else
        S := S + StrGrid.Cells[C, R] + #9;
    end;
    S := S + #13#10;
  end;
  ClipBoard.AsText := S;
end;

procedure TDailyCheckRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TDailyCheckRpt.ShowPelangganClick(Sender: TObject);
begin
  if Main.IsFormOpen('CustomerList')=False then CustomerList:=TCustomerList.Create(Self,'BUS','KONTINUITAS');
end;

procedure TDailyCheckRpt.CustomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Button1Click(sender);
end;

end.
