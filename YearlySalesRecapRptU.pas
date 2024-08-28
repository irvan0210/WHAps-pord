unit YearlySalesRecapRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;

type
  TYearlySalesRecapRpt = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Lihat: TButton;
    Tahun: TEdit;
    Label5: TLabel;
    Segment: TComboBox;
    AllSegment: TCheckBox;
    ProgressBar: TProgressBar;
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure AllSegmentClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    CustomerArr,CompanyArr:Array of TArrString30;
    SegmentArr:Array of TArrString2;
    IntRow,IntCol,IsAll,MinRowGrid:Integer;
    IntTotalSum:Int64;
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
  YearlySalesRecapRpt: TYearlySalesRecapRpt;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, DateUtils,
  MonthlySalesRDRptU;

{$R *.dfm}

constructor TYearlySalesRecapRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TYearlySalesRecapRpt.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=6);
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
  Main.WriteLog('Form Open: YearlySalesRecapRpt='+Company_Id+','+Form_Request+','+Customer_Id+','+IntToStr(Is_All),1);
  inherited Create(AOwner);
end;

procedure TYearlySalesRecapRpt.Init;
begin
  Case IsAll of
    8:Caption:='Laporan Penjualan perTahun Rekap Batal';
    else Caption:='Laporan Penjualan perTahun Rekap';
  end;
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tahun.Text:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  if UserLevel<59 then ToXCel.Enabled:=False;
end;

procedure TYearlySalesRecapRpt.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=18;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=90;
  StrGrid.ColWidths[2]:=200;
  for IntCount:=17 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[IntCount]:=0; 
  //col 18=customer_id
  for IntCount:=1 to 12 do
    StrGrid.ColWidths[2+IntCount]:=80;
  StrGrid.ColWidths[15]:=80;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,14,0);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Customer Id';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Bulan';
  for IntCount:=1 to 12 do
    StrGrid.Cells[2+IntCount,1]:=LongMonthNames[IntCount];
  StrGrid.Cells[15,0]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TYearlySalesRecapRpt.RefreshCombo;
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SegmentArr)-1 do
    Segment.Items.Add(SegmentArr[IntCount][0]);
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Tahun.Text:=FormatDateTime('yyyy',Now);
  Main.M_Normal;
end;

procedure TYearlySalesRecapRpt.RefreshData;
var Qry,Qry2:TADOQuery;
    StrQry,StrSegment:String;
    IntCount,IntCount2,IntMonth:Integer;
    IntTotal,IntValue:Int64;
begin
  if (Tahun.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Qry2.CommandTimeout := 3600;
    ProgressBar.Visible:=True;
    Main.M_Busy;
    if Main.OpenDb then begin
      SetLength(CustomerArr,0);
      IntTotalSum:=0;
      if AllSegment.Checked=True then StrSegment:=''
      else StrSegment:=',@SegmentId='+QuotedStr(SegmentArr[Segment.ItemIndex][1]);
      StrQry:='EXEC GetCustomerList '+IntToStr(CompId)+',@OrderBy='+QuotedStr('h.segment_id,i.segment_id,a.name')+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      ProgressBar.Position:=10;
      IntCount:=0;
//      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      for IntCount:=0 to 4000 do begin
        SetLength(CustomerArr,IntCount+1);
        ProgressBar.Position:=10+Round((60/Qry.RecordCount)*IntCount);
        CustomerArr[IntCount][0]:=Qry.FieldValues['segment_name1'];
        CustomerArr[IntCount][1]:=Qry.FieldValues['segment_name2'];
        CustomerArr[IntCount][18]:=Qry.FieldValues['customer_id'];
        if Qry.FieldValues['gp_customer_number']<>NULL then
          CustomerArr[IntCount][2]:=Qry.FieldValues['gp_customer_number'];
        CustomerArr[IntCount][3]:=Qry.FieldValues['name'];
        StrQry:='EXEC GetCustomerOrderYearResume '+QuotedStr(Qry.FieldValues['customer_id'])+',@Years='+QuotedStr(Tahun.Text)+';';
        Qry2.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        IntTotal:=0;
        if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
          IntMonth:=Qry2.FieldValues['months'];
          IntValue:=Qry2.FieldValues['total'];
          CustomerArr[IntCount][IntMonth+3]:=IToCurr(IntValue) ;
          IntTotal:=IntTotal+IntValue;
          Qry2.Next;
        end;
        //CustomerArr[IntCount][16]:=IToCurr(IntTotal);
        //IntTotalSum:=IntTotalSum+IntTotal;
        Qry2.Close;
        Qry.Next;
       // Inc(IntCount)
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry2);
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TYearlySalesRecapRpt.RefreshGrid;
var IntCount,IntCount2,IntCount3,IntTotal,IntCount4:Integer;
    StrSegmentId1,StrSegmentId2:String;
    IsDrawRect:Boolean;
    IntSum:array[1..12] of Int64;
    IntValue:Int64;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  if Length(CustomerArr)>0 then StrGrid.RowCount:=Length(CustomerArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  StrSegmentId1:='';
  StrSegmentId2:='';
  IntTotal:=0;
  IntCount3:=0;
  IntCount4:=0;
  for IntCount:=0 to Length(CustomerArr)-1 do begin
    if StrSegmentId1<>CustomerArr[IntCount][0] then begin
      if IntCount3>1 then begin
        StrGrid.MergeCells.AddRectXY(0,IntCount3+2,2,IntCount3+2);
        StrGrid.Cells[0,IntCount3+2]:='Total';
        StrGrid.CellStyle[0,IntCount3+2].Font.Style:=[fsBold];
        for IntCount2:=1 to 12 do begin
          StrGrid.Cells[IntCount2+2,IntCount3+2]:=IToCurr(IntSum[IntCount2]);
          StrGrid.CellStyle[IntCount2+2,IntCount3+2].HorizontalAlignment:=taRightJustify;
        end;
        for IntCount2:=1 to 12 do IntSum[IntCount2]:=0;
        Inc(IntCount3);
      end;
      StrSegmentId1:=CustomerArr[IntCount][0];
      StrSegmentId2:=CustomerArr[IntCount][1];
      StrGrid.MergeCells.AddRectXY(0,IntCount3+2,15,IntCount3+2);
      StrGrid.Cells[0,IntCount3+2]:=StrSegmentId1+' '+StrSegmentId2;
      StrGrid.CellStyle[0,IntCount3+2].Font.Style:=[fsBold];
      Inc(IntCount3);
      IntCount4:=0
    end else if StrSegmentId2<>CustomerArr[IntCount][1] then begin
      if IntCount3>1 then begin
        StrGrid.MergeCells.AddRectXY(0,IntCount3+2,2,IntCount3+2);
        StrGrid.Cells[0,IntCount3+2]:='Total';
        StrGrid.CellStyle[0,IntCount3+2].Font.Style:=[fsBold];
        for IntCount2:=1 to 12 do begin
          StrGrid.Cells[IntCount2+2,IntCount3+2]:=IToCurr(IntSum[IntCount2]);
          StrGrid.CellStyle[IntCount2+2,IntCount3+2].HorizontalAlignment:=taRightJustify;
        end;
        for IntCount2:=1 to 12 do IntSum[IntCount2]:=0;
        Inc(IntCount3);
      end;
      StrSegmentId2:=CustomerArr[IntCount][1];
      StrGrid.MergeCells.AddRectXY(0,IntCount3+2,15,IntCount3+2);
      StrGrid.Cells[0,IntCount3+2]:=StrSegmentId1+' '+StrSegmentId2;
      StrGrid.CellStyle[0,IntCount3+2].Font.Style:=[fsBold];
      Inc(IntCount3);
      IntCount4:=0
    end;
    StrGrid.Cells[0,IntCount3+2]:=IntToStr(IntCount4+1);
    StrGrid.Cells[18,IntCount3+2]:=CustomerArr[IntCount][18];
    for IntCount2:=1 to 2 do
      StrGrid.Cells[IntCount2,IntCount3+2]:=CustomerArr[IntCount][IntCount2+1];
    for IntCount2:=3 to 16 do
      if CustomerArr[IntCount][IntCount2+1]<>'' then begin
        IntValue:=0;
        IntValue:=SToInt64(CustomerArr[IntCount][IntCount2+1]);
        IntSum[IntCount2-2]:=IntSum[IntCount2-2]+IntValue;
        StrGrid.Cells[IntCount2,IntCount3+2]:=CustomerArr[IntCount][IntCount2+1];
        StrGrid.CellStyle[IntCount2,IntCount3+2].HorizontalAlignment:=taRightJustify;
    end;
    Inc(IntCount3);
    Inc(IntCount4);
  end;
{  StrGrid.RowCount:=StrGrid.RowCount+1;
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
  StrGrid.Cells[16,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(IntTotalSum);
  StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
}
end;

procedure TYearlySalesRecapRpt.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TYearlySalesRecapRpt.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
//  RefreshData;
//  RefreshGrid;
end;

procedure TYearlySalesRecapRpt.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(CustomerArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(CustomerArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do
          StrGrid.Cells[Count4,Count2]:=CustomerArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TYearlySalesRecapRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TYearlySalesRecapRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('MonthlySalesRDRpt')=False then MonthlySalesRDRpt:=TMonthlySalesRDRpt.Create(Self,'Bus','YEARSALESRECAP',StrGrid.Cells[18,IntRow],6,IntCol-2)
    end;
  end;
end;

procedure TYearlySalesRecapRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TYearlySalesRecapRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TYearlySalesRecapRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TYearlySalesRecapRpt.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;



procedure TYearlySalesRecapRpt.AllSegmentClick(Sender: TObject);
begin
  if AllSegment.Checked=True then begin
    Segment.Enabled:=False;
  end else Segment.Enabled:=True;
end;

end.
