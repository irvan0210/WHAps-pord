unit BudgetListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TBudgetListRpt = class(TForm)
    Label2: TLabel;
    ToXCel: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    PanelLegend: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    All: TCheckBox;
    AllData: TCheckBox;
    Total: TMemo;
    Label7: TLabel;
    CariOffering: TSpeedButton;
    Label8: TLabel;
    lbl1: TLabel;
    Tanggal: TDateTimePicker;
    procedure ToXCelClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure AllDataClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariOfferingClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    ResvArr,CompanyArr:Array of TArrString22;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    OrderBy:String;
    Initiation,ValidDate:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;

    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);Overload;
    procedure RefreshDisplay;
    procedure RefreshData;
    procedure RefreshGrid;
  end;

var
  BudgetListRpt: TBudgetListRpt;

implementation

uses MainU, ADODB, BusInvoiceU, BookingFormU, SPJFormBusU, StrUtils,
  AuthorizedFormU, VarUtils, DetailOrderEstimasiBudgetFormU;

{$R *.dfm}

constructor TBudgetListRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TBudgetListRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);
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
  OrderBy:=Order_By;
  Range:=Range_M;
  Main.WriteLog('Form Open: BudgetList='+Company_Id+','+Customer_Id+','+Form_Request+','+IntToStr(Is_All)+','+Order_By+','+IntToStr(Range_M),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBudgetListRpt.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  Tanggal.Enabled:=True;
  All.Checked:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

//  Tanggal.MinDate := Now;
end;

procedure TBudgetListRpt.InitGrid;
var IntCount,IntCount2:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=22;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Hari';
  StrGrid.Cells[3,0]:='Trip Type';
  StrGrid.Cells[4,0]:='No Resv';
  StrGrid.Cells[5,0]:='Customer';
  StrGrid.Cells[6,0]:='Rute';
  StrGrid.Cells[7,0]:='No Polisi';
  StrGrid.Cells[8,0]:='Driver';
  StrGrid.Cells[9,0]:='Armada';
  StrGrid.Cells[9,1]:='Jenis Armada';
  StrGrid.Cells[10,1]:='Seat';
  StrGrid.Cells[11,0] :='BBM Budget';
  StrGrid.Cells[11,1] :='BBM(Ltr)';
  StrGrid.Cells[12,1] :='BBM(Rp)';
  StrGrid.Cells[13,0] :='Fee Driver';
  StrGrid.Cells[14,0]:='Fee Kenek';
  StrGrid.Cells[15,0]:='Parkir';
  StrGrid.Cells[16,0]:='Tol';
  StrGrid.Cells[17,0]:='Lain2';
  StrGrid.Cells[18,0]:='Overtime';
  StrGrid.Cells[19,0]:='Total';
  StrGrid.Cells[20,0]:='Keterangan';

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=30;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=170;
  StrGrid.ColWidths[6]:=300;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=130;
  StrGrid.ColWidths[9]:=160;
  StrGrid.ColWidths[10]:=60;

  StrGrid.ColWidths[11]:=50;
  StrGrid.ColWidths[12]:=80;
  StrGrid.ColWidths[13]:=90;
  StrGrid.ColWidths[14]:=90;
  StrGrid.ColWidths[15]:=90;
  StrGrid.ColWidths[16]:=90;
  StrGrid.ColWidths[17]:=90;
  StrGrid.ColWidths[18]:=90;
  StrGrid.ColWidths[19]:=90;
  StrGrid.ColWidths[20]:=300;
  StrGrid.ColWidths[21]:=0;


  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,10,0);

  StrGrid.MergeCells.AddRectXY(11,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,18,1);
  StrGrid.MergeCells.AddRectXY(19,0,19,1);
  StrGrid.MergeCells.AddRectXY(20,0,20,1);


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
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount, 2].Font.Style:= [];
  end;

  //for IntCount:=10 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
end;

procedure TBudgetListRpt.RefreshCombo;
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

procedure TBudgetListRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,StrOrder,StrRange,StrTanggal,StrCompanyId,StrLocationId:String;
    IntCount,IntBBM,IntDriverFee,IntHelperFee,IntTollFee,
    IntParkirFee,IntOvernightFee,IntTotalFee,IntDays:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Main.M_Busy;
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    SetLength(ResvArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];

    StrQry:='EXEC GetCustomerOrderList2 '+StrCompanyId+StrLocationId+', @OutDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ResvArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ResvArr[IntCount][0]:=Qry.FieldValues['from_to_dates'];
      ResvArr[IntCount][1]:=Qry.FieldValues['day'];
      ResvArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['customer']<>NULL then
      ResvArr[IntCount][3]:=Qry.FieldValues['customer'];
      if Qry.FieldValues['route']<>NULL then
      ResvArr[IntCount][4]:=Qry.FieldValues['route'];
      if Qry.FieldValues['license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        ResvArr[IntCount][5]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        ResvArr[IntCount][5]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['driver']<>NULL then
      ResvArr[IntCount][6]:=Qry.FieldValues['driver'];
      if Qry.FieldValues['batch_name']<>NULL then
      ResvArr[IntCount][7]:=Qry.FieldValues['batch_name'];
      if Qry.FieldValues['seat']<>NULL then
      ResvArr[IntCount][8]:=Qry.FieldValues['seat'];
      if Qry.FieldValues['bbm_ltr']<>NULL then
      ResvArr[IntCount][9]:=Qry.FieldValues['bbm_ltr']
      else ResvArr[IntCount][9]:='0';
      if Qry.FieldValues['fuel_price']<>NULL then
      begin
        ResvArr[IntCount][10]:=Qry.FieldValues['fuel_price'];
        IntBBM:=Qry.FieldValues['fuel_price'];
      end else
      begin
        ResvArr[IntCount][10]:='0';
        IntBBM:=0;
      end;
      if Qry.FieldValues['fee_driver']<>NULL then
      begin
        ResvArr[IntCount][11]:=Qry.FieldValues['fee_driver'];
        IntDriverFee:= Qry.FieldValues['fee_driver'];
      end else
      begin
        ResvArr[IntCount][11]:='0';
        IntDriverFee:=0;
      end;
      if Qry.FieldValues['fee_helper']<>NULL then
      begin
        ResvArr[IntCount][12]:=Qry.FieldValues['fee_helper'];
        IntHelperFee:=Qry.FieldValues['fee_helper'];
      end else
      begin
         ResvArr[IntCount][12]:='0';
        IntHelperFee:=0;
      end;
      if Qry.FieldValues['parkir']<>NULL then
      begin
        ResvArr[IntCount][13]:=Qry.FieldValues['parkir'];
        IntParkirFee:=Qry.FieldValues['parkir'];
      end else
      begin
        ResvArr[IntCount][13]:='0';
        IntParkirFee:=0;
      end;
      if Qry.FieldValues['toll']<>NULL then
      begin
        ResvArr[IntCount][14]:=Qry.FieldValues['toll'];
        IntTollFee:=Qry.FieldValues['toll'];
      end else
      begin
        ResvArr[IntCount][14]:='0';
        IntTollFee:=0;
      end;

      if Qry.FieldValues['overnight']<>NULL then
      begin
        ResvArr[IntCount][15]:=Qry.FieldValues['overnight'];
        IntOvernightFee:=Qry.FieldValues['overnight'];
      end else
      begin
        ResvArr[IntCount][15]:='0';
        IntOvernightFee:=0;
      end;

      ResvArr[IntCount][16]:='0';

      IntTotalFee:=IntBBM+IntDriverFee+IntHelperFee+IntTollFee+IntParkirFee+IntOvernightFee;

      ResvArr[IntCount][17]:= IntToStr(IntTotalFee);

      if Qry.FieldValues['remark']<>NULL then ResvArr[IntCount][18]:=Qry.FieldValues['remark'];
      ResvArr[IntCount][19]:=  Qry.FieldValues['customer_order_detail_id'];
      if Qry.FieldValues['trip_type']<>NULL then ResvArr[IntCount][20]:= Qry.FieldValues['trip_type'];


      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBudgetListRpt.RefreshGrid;
var IntCount,IntCount2,IntCountID,IntTotalData,IntTotalBBMLtr,IntTotalBBM,IntTotalFeeDriver,IntTotalFeeHelper,IntTotalParkir,
IntTotalToll,IntTotalLain2,IntTotalOvertime,IntGrandTotal:Integer;
begin
  if Length(ResvArr)>0 then StrGrid.RowCount:=Length(ResvArr)+3
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=3 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  IntTotalBBMLtr:=0;
  IntTotalBBM:=0;
  IntTotalFeeDriver:=0;
  IntTotalFeeHelper:=0;
  IntTotalParkir:=0;
  IntTotalToll:=0;
  IntTotalLain2:=0;
  IntTotalOvertime:=0;
  IntGrandTotal:=0;
  IntCountID:=0;
  IntTotalData:=0;
  for IntCount:=0 to Length(ResvArr)-1 do begin

    StrGrid.Cells[0,IntCount+2]:=IntToStr(IntTotalData+1);
    StrGrid.Cells[1,IntCount+2]:=ResvArr[IntCount][0];
    StrGrid.Cells[2,IntCount+2]:=ResvArr[IntCount][1];
    StrGrid.Cells[3,IntCount+2]:=ResvArr[IntCount][20];
    StrGrid.Cells[4,IntCount+2]:=ResvArr[IntCount][2];
    StrGrid.Cells[5,IntCount+2]:=ResvArr[IntCount][3];
    StrGrid.Cells[6,IntCount+2]:=ResvArr[IntCount][4];
    StrGrid.Cells[7,IntCount+2]:=ResvArr[IntCount][5];
    StrGrid.Cells[8,IntCount+2]:=ResvArr[IntCount][6];
    StrGrid.Cells[9,IntCount+2]:=ResvArr[IntCount][7];
    StrGrid.Cells[10,IntCount+2]:=ResvArr[IntCount][8];

    StrGrid.Cells[11,IntCount+2]:=SToCurr(ResvArr[IntCount][9]);
    StrGrid.Cells[12,IntCount+2]:=SToCurr(ResvArr[IntCount][10]);
    StrGrid.Cells[13,IntCount+2]:=SToCurr(ResvArr[IntCount][11]);
    StrGrid.Cells[14,IntCount+2]:=SToCurr(ResvArr[IntCount][12]);
    StrGrid.Cells[15,IntCount+2]:=SToCurr(ResvArr[IntCount][13]);
    StrGrid.Cells[16,IntCount+2]:=SToCurr(ResvArr[IntCount][14]);
    StrGrid.Cells[17,IntCount+2]:=SToCurr(ResvArr[IntCount][15]);
    StrGrid.Cells[18,IntCount+2]:=SToCurr(ResvArr[IntCount][16]);
    StrGrid.Cells[19,IntCount+2]:=SToCurr(ResvArr[IntCount][17]);
    StrGrid.Cells[20,IntCount+2]:=ResvArr[IntCount][18];
    StrGrid.Cells[21,IntCount+2]:=ResvArr[IntCount][19];

    if ResvArr[IntCount][9]<>'0' then
    IntTotalBBMLtr:=IntTotalBBMLtr+StrToInt(ResvArr[IntCount][9]);

    if ResvArr[IntCount][10]<>'0' then
    IntTotalBBM:=IntTotalBBM+StrToInt(ResvArr[IntCount][10]);

    if ResvArr[IntCount][11]<>'0' then
    IntTotalFeeDriver:=IntTotalFeeDriver+StrToInt(ResvArr[IntCount][11]);

    if ResvArr[IntCount][12]<>'0' then
    IntTotalFeeHelper:=IntTotalFeeHelper+StrToInt(ResvArr[IntCount][12]);

    if ResvArr[IntCount][14]<>'0' then
    IntTotalParkir:=IntTotalParkir+StrToInt(ResvArr[IntCount][13]);

    if ResvArr[IntCount][14]<>'0' then
    IntTotalToll:=IntTotalToll+StrToInt(ResvArr[IntCount][14]);

    if ResvArr[IntCount][15]<>'0' then
    IntTotalLain2:=IntTotalLain2+StrToInt(ResvArr[IntCount][15]);

    if ResvArr[IntCount][16]<>'0' then
    IntTotalOvertime:=IntTotalOvertime+StrToInt(ResvArr[IntCount][16]);

    if ResvArr[IntCount][17]<>'0' then
    IntGrandTotal:=IntGrandTotal+StrToInt(ResvArr[IntCount][17]);




    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taCenter;

    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[18,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[19,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[20,IntCount+2].HorizontalAlignment:=taLeftJustify;
    Inc(IntTotalData);
  end;
  Total.Text:= IntToStr(IntTotalData);
  StrGrid.Cells[10,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(IntTotalBBMLtr);
  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(IntTotalBBM);
  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(IntTotalFeeDriver);
  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(IntTotalFeeHelper);
  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(IntTotalParkir);
  StrGrid.Cells[16,StrGrid.RowCount-1]:=IToCurr(IntTotalToll);
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(IntTotalLain2);
  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(IntTotalOvertime);
  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(IntGrandTotal);


  for IntCount:=10 to 19 do begin
    StrGrid.CellStyle[IntCount,StrGrid.RowCount-1].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[IntCount,StrGrid.RowCount-1].BGColor:=clSilver;
  end;
end;

procedure TBudgetListRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
  Initiation:=False;
end;

procedure TBudgetListRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TBudgetListRpt.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetListRpt.Search;
var Count,Count2,Count3,Count4,IntCount5,IntTotalData,IntTotalBBMLtr,IntTotalBBM,IntTotalFeeDriver,IntTotalFeeHelper,IntTotalParkir,
    IntTotalToll,IntTotalLain2,IntTotalOvertime,IntGrandTotal,IntCountID:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=3;
    IntTotalBBMLtr:=0;
    IntTotalBBM:=0;
    IntTotalFeeDriver:=0;
    IntTotalFeeHelper:=0;
    IntTotalParkir:=0;
    IntTotalToll:=0;
    IntTotalLain2:=0;
    IntTotalOvertime:=0;
    IntGrandTotal:=0;
    IntCountID:=0;
    IntTotalData:=0;
    for Count:=0 to Length(ResvArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 20 do
      if (StrPos(PChar(UpperCase(ResvArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;

          StrGrid.Cells[0,Count2-1]:=IntToStr(IntTotalData+1);
          StrGrid.Cells[1,Count2-1]:=ResvArr[Count][0];
          StrGrid.Cells[2,Count2-1]:=ResvArr[Count][1];
          StrGrid.Cells[3,Count2-1]:=ResvArr[Count][20];
          StrGrid.Cells[4,Count2-1]:=ResvArr[Count][2];
          StrGrid.Cells[5,Count2-1]:=ResvArr[Count][3];
          StrGrid.Cells[6,Count2-1]:=ResvArr[Count][4];
          StrGrid.Cells[7,Count2-1]:=ResvArr[Count][5];
          StrGrid.Cells[8,Count2-1]:=ResvArr[Count][6];
          StrGrid.Cells[9,Count2-1]:=ResvArr[Count][7];
          StrGrid.Cells[10,Count2-1]:=ResvArr[Count][8];

          StrGrid.Cells[11,Count2-1]:=SToCurr(ResvArr[Count][9]);
          StrGrid.Cells[12,Count2-1]:=SToCurr(ResvArr[Count][10]);
          StrGrid.Cells[13,Count2-1]:=SToCurr(ResvArr[Count][11]);
          StrGrid.Cells[14,Count2-1]:=SToCurr(ResvArr[Count][12]);
          StrGrid.Cells[15,Count2-1]:=SToCurr(ResvArr[Count][13]);
          StrGrid.Cells[16,Count2-1]:=SToCurr(ResvArr[Count][14]);
          StrGrid.Cells[17,Count2-1]:=SToCurr(ResvArr[Count][15]);
          StrGrid.Cells[18,Count2-1]:=SToCurr(ResvArr[Count][16]);
          StrGrid.Cells[19,Count2-1]:=SToCurr(ResvArr[Count][17]);
          StrGrid.Cells[20,Count2-1]:=ResvArr[Count][18];
          StrGrid.Cells[21,Count2-1]:=ResvArr[Count][19];

          if ResvArr[Count][9]<>'0' then
          IntTotalBBMLtr:=IntTotalBBMLtr+StrToInt(ResvArr[Count][9]);

          if ResvArr[Count][10]<>'0' then
          IntTotalBBM:=IntTotalBBM+StrToInt(ResvArr[Count][10]);

          if ResvArr[Count][11]<>'0' then
          IntTotalFeeDriver:=IntTotalFeeDriver+StrToInt(ResvArr[Count][11]);

          if ResvArr[Count][12]<>'0' then
          IntTotalFeeHelper:=IntTotalFeeHelper+StrToInt(ResvArr[Count][12]);

          if ResvArr[Count][14]<>'0' then
          IntTotalParkir:=IntTotalParkir+StrToInt(ResvArr[Count][13]);

          if ResvArr[Count][14]<>'0' then
          IntTotalToll:=IntTotalToll+StrToInt(ResvArr[Count][14]);

          if ResvArr[Count][15]<>'0' then
          IntTotalLain2:=IntTotalLain2+StrToInt(ResvArr[Count][15]);

          if ResvArr[Count][16]<>'0' then
          IntTotalOvertime:=IntTotalOvertime+StrToInt(ResvArr[Count][16]);

          if ResvArr[Count][17]<>'0' then
          IntGrandTotal:=IntGrandTotal+StrToInt(ResvArr[Count][17]);




          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[1,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[2,Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[4,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[5,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[6,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[7,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[8,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[9,Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[10,Count2-1].HorizontalAlignment:=taCenter;

          StrGrid.CellStyle[11,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[12,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[13,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[14,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[15,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[16,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[17,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[18,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[19,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[20,Count2-1].HorizontalAlignment:=taLeftJustify;
          Inc(IntTotalData);
          Inc(Count2);

//          GridCCP.Cells[0,Count2+1]:=CCPArr[Count][0];
//          GridCCP.Cells[1,Count2+1]:=CCPArr[Count][1];
//          GridCCP.Cells[2,Count2+1]:=CCPArr[Count][2];
//          GridCCP.Cells[3,Count2+1]:=CCPArr[Count][3];
//          GridCCP.Cells[4,Count2+1]:=CCPArr[Count][4];
//          GridCCP.Cells[5,Count2+1]:=CCPArr[Count][5];
//          GridCCP.Cells[6,Count2+1]:=CCPArr[Count][6];
//          GridCCP.Cells[7,Count2+1]:=CCPArr[Count][7];
//          GridCCP.Cells[8,Count2+1]:=CCPArr[Count][8];
//          GridCCP.Cells[9,Count2+1]:=CCPArr[Count][9];
//          GridCCP.Cells[10,Count2+1]:=CCPArr[Count][10];
//          GridCCP.Cells[11,Count2+1]:=CCPArr[Count][11];
//          GridCCP.Cells[12,Count2+1]:=CCPArr[Count][12];
//          GridCCP.Cells[13,Count2+1]:=CCPArr[Count][13];
//
//          GridCCP.Cells[14,Count2+1]:=CCPArr[Count][14];
//          GridCCP.Cells[15,Count2+1]:=CCPArr[Count][15];
//          GridCCP.Cells[16,Count2+1]:=CCPArr[Count][16];
//          GridCCP.Cells[17,Count2+1]:=CCPArr[Count][17];
//          GridCCP.Cells[18,Count2+1]:=CCPArr[Count][18];
//          GridCCP.Cells[21,Count2+1]:=CCPArr[Count][21];
//          GridCCP.Cells[22,Count2+1]:=CCPArr[Count][22];
//
//          GridCCP.CellStyle[9,Count2+1].WordWrap:=True;
//
//          GridCCP.CellStyle[5,Count2+1].HorizontalAlignment:=taCenter;
//          GridCCP.CellStyle[6,Count2+1].HorizontalAlignment:=taCenter;
//          GridCCP.CellStyle[7,Count2+1].HorizontalAlignment:=taCenter;
//          GridCCP.CellStyle[8,Count2+1].HorizontalAlignment:=taCenter;
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetListRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBudgetListRpt.StrGridDblClick(Sender: TObject);
var IsAuth:Boolean;
  Qry:TADOQuery;
  StrQry: string;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+
            ' AND form_id=''190406'' and active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IsAuth:=True;
    end else begin
      IsAuth:=False;
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;


  if IsAuth=True then
  begin
    if Main.IsFormOpen('DetailOrderEstimasiBudgetForm')=False then
    begin
      DetailOrderEstimasiBudgetForm:=TDetailOrderEstimasiBudgetForm.Create(Self,StrGrid.Cells[21,IntRow]);
      DetailOrderEstimasiBudgetForm.Init;
      DetailOrderEstimasiBudgetForm.Trip_Type;
      with DetailOrderEstimasiBudgetForm do
      begin

        NoOrder.Text:=StrGrid.Cells[4,IntRow];
        Customer.Text:=StrGrid.Cells[5,IntRow];
        Tanggal.Text:=StrGrid.Cells[1,IntRow];
        Hari.Text:=StrGrid.Cells[2,IntRow];
        Rute.Text:=StrGrid.Cells[6,IntRow];
        JenisArmada.Text:=StrGrid.Cells[9,IntRow];
        Seat.Text:=StrGrid.Cells[10,IntRow];
        NoPol.Text:=StrGrid.Cells[7,IntRow];
        Driver.Text:=StrGrid.Cells[8,IntRow];
        Keterangan.Text:=StrGrid.Cells[20,IntRow];

        if StrGrid.Cells[10,IntRow]<> '' then
          TripType.ItemIndex:=TripType.Items.IndexOf(StrGrid.Cells[3,IntRow])
          else  TripType.ItemIndex:=-1;
      end;
    end;
  end;

//  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'')  then begin
//    if FormRequest='' then begin
//      if Main.IsFormOpen('BookingForm')=False then BookingForm:=TBookingForm.Create(Self,StrGrid.Cells[0,IntRow],False)
//    end else begin
//      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
//        if Main.IsFormOpen('BookingForm')=False then begin
//          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True);
//          Close;
//        end;
//      end else
//      if UpperCase(FormRequest)='BOOKING-REPRINT' then  begin
//        BookingForm.RePrint(StrGrid.Cells[0,IntRow]);
//        Close;
//      end else
//      if UpperCase(FormRequest)='SJBUS-CREATE' then  begin
//        if StrGrid.Cells[10,IntRow]='' then begin
//          if StrGrid.Cells[12,IntRow]='0' then begin
//            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow]);
//            Close;
//          end else begin
//            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow],StrToBool(StrGrid.Cells[12,IntRow]),StrGrid.Cells[6,IntRow]);
//            Close;
//          end;
//        end else MessageBox(Handle,PChar('     Surat Jalan sudah dibuat'+Chr(13)+Chr(13)+'Klik `Cetak Ulang` untuk mencetak Ulang'),'Surat Jalan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
//      end else
//      if UpperCase(FormRequest)='MAIN-FORCEADD' then  begin
//        IsAuth:=True;
//        AuthorizedForm.FormId:='131101';
//        AuthorizedForm.StrMessage:='Otorisasi Penambahan Armada';
//        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
//        Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
//        if IsAuth then begin
//          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,'Main-ForceAdd');
//          Close;
//        end else
//          MessageBox(Handle,'Tidak dapat melakukan Penambahan','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
//      end else
//      begin
//        BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,FormRequest);
//        Close;
//      end;
//    end;
//  end;
end;

procedure TBudgetListRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetListRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TBudgetListRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TBudgetListRpt.AllClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if All.Checked=True then Tanggal.Enabled:=False
    else Tanggal.Enabled:=True;
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetListRpt.TanggalChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TBudgetListRpt.AllDataClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetListRpt.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TBudgetListRpt.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

end.
