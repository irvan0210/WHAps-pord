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
    Tanggal: TDateTimePicker;
    All: TCheckBox;
    AllData: TCheckBox;
    Total: TMemo;
    Label7: TLabel;
    CariOffering: TSpeedButton;
    Label8: TLabel;
    lbl1: TLabel;
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
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);Overload;
    procedure RefreshDisplay;
  end;

var
  BudgetListRpt: TBudgetListRpt;

implementation

uses MainU, ADODB, BusInvoiceU, BookingFormU, SPJFormBusU, StrUtils,
  AuthorizedFormU, VarUtils;

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

  Tanggal.MinDate := Now;
end;

procedure TBudgetListRpt.InitGrid;
var IntCount,IntCount2:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=14;
  StrGrid.Cells[2,0]:='No Pesanan';
  StrGrid.Cells[3,0]:='Armada';
  StrGrid.Cells[4,0]:='Penggunaan';
  StrGrid.Cells[4,1]:='Tgl';
  StrGrid.Cells[5,1]:='Jam';
  StrGrid.Cells[6,0]:='Rute';
  StrGrid.Cells[7,0]:='Pelanggan';
  StrGrid.Cells[8,0] :='Estimasi Budget';
  StrGrid.Cells[8,1] :='Fee Driver';
  StrGrid.Cells[9,1]:='Fee Kenek';
  StrGrid.Cells[10,1]:='Tol';
  StrGrid.Cells[11,1]:='Parkir';
  StrGrid.Cells[12,1]:='Bermalam';
  StrGrid.Cells[13,0]:='Total';
    
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=150;
  StrGrid.ColWidths[4]:=75;
  StrGrid.ColWidths[5]:=65;

  StrGrid.ColWidths[6]:=200;
  StrGrid.ColWidths[7]:=180;

  StrGrid.ColWidths[8]:=65;
  StrGrid.ColWidths[9]:=65;
  StrGrid.ColWidths[10]:=55;
  StrGrid.ColWidths[11]:=55;
  StrGrid.ColWidths[12]:=65;
  StrGrid.ColWidths[13]:=70;
  //col 10=vhc_trans_id
  //col 11=status
  //col 12=package
  //col 13=total
  //col 14=total_payment
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,5,0);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);


  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;


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
    IntCount,IntDriverFee,IntHelperFee,IntTollFee,IntParkirFee,IntOvernightFee,IntDays:Integer;

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
    if OrderBy<>'' then StrOrder:=',@OrderBy='+QuotedStr(OrderBy) else StrOrder:='';
    if Range>0 then StrRange:=',@Range='+IntToStr(Range) else StrRange:='';
    if All.Checked=False then StrTanggal:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date)) else StrTanggal:='';
    if AllData.Checked then IsAll:=6;
    StrQry:='EXEC GetReservedOrderList_pram '+StrCompanyId+StrLocationId+',@Finish='+IntToStr(IsAll)+StrTanggal+',@PaymentDetail=2'+StrOrder+StrRange+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ResvArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ResvArr[IntCount][0]:=Qry.FieldValues['reserved_order_id'];
      ResvArr[IntCount][1]:=Qry.FieldValues['reserved_order_detail_id'];
      ResvArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['vehicle_name']<>NULL then
      ResvArr[IntCount][3]:=Qry.FieldValues['vehicle_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';

      ResvArr[IntCount][4]:=Qry.FieldValues['from_to_dates'];
      ResvArr[IntCount][5]:=Qry.FieldValues['from_to_times'];
      ResvArr[IntCount][6]:=Qry.FieldValues['route'];
      ResvArr[IntCount][7]:=Qry.FieldValues['customer_name'];
      IntDays := Qry.FieldValues['days'];
      if Qry.FieldValues['driver_fee']<>NULL then IntDriverFee:=Qry.FieldValues['driver_fee']
      else IntDriverFee:=0;
      if Qry.FieldValues['helper_fee']<>NULL then IntHelperFee:=Qry.FieldValues['helper_fee']
      else IntHelperFee:=0;
      if Qry.FieldValues['toll_fee']<>NULL then IntTollFee:=Qry.FieldValues['toll_fee']
      else IntTollFee:=0;
      if Qry.FieldValues['parkir_fee']<>NULL then IntParkirFee:=Qry.FieldValues['parkir_fee']
      else IntParkirFee:=0;
      if Qry.FieldValues['overnight_fee']<>NULL then IntOvernightFee:=Qry.FieldValues['overnight_fee']
      else IntOvernightFee:=0;


      ResvArr[IntCount][8] :=IToCurr(IntDays*IntDriverFee);
      ResvArr[IntCount][9] :=IToCurr(IntDays*IntHelperFee);
      ResvArr[IntCount][10]:=IToCurr(IntTollFee);
      ResvArr[IntCount][11]:=IToCurr(IntParkirFee);
      ResvArr[IntCount][12]:=IToCurr((IntDays-1)*IntOvernightFee);

      ResvArr[IntCount][13]:=IToCurr( (IntDays*IntDriverFee)+(IntDays*IntHelperFee)+IntTollFee+IntParkirFee+((IntDays-1)*IntOvernightFee) );
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
var IntCount,IntCount2,IntJumlah:Integer;
begin
  Main.M_Busy;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.CellStyle[IntCount2, IntCount].Font.Style:= [];
    end;
    StrGrid.MergeCells.DeleteItem(IntCount);
  end;

  if Length(ResvArr)>0 then StrGrid.RowCount:=Length(ResvArr)+3
  else begin
    StrGrid.RowCount:=3;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
      StrGrid.CellStyle[IntCount,1].BGColor:=clWhite;
    end;
  end;
  IntJumlah:=0;
  for IntCount:=0 to Length(ResvArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=ResvArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=ResvArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=ResvArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=ResvArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=ResvArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=ResvArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=ResvArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=ResvArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=ResvArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=ResvArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=ResvArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=ResvArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=ResvArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=ResvArr[IntCount][13];
    IntJumlah:=IntJumlah+SToInt(ToString(ResvArr[IntCount][13]));

    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;

    for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clWindowText;
    (*
    if ResvArr[IntCount][16]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].BGColor:=clSilver;

    if ResvArr[IntCount][15]<>'' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=$00004080;
    if ResvArr[IntCount][10]<>'' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clBlue;
    if ResvArr[IntCount][14]<>'' then
      if StrToInt(ResvArr[IntCount][14])>=StrToInt(ResvArr[IntCount][13]) then
        if ResvArr[IntCount][10]<>'' then
          for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clPurple
        else
          for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    if ResvArr[IntCount][11]='0' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed;
    *)
  end;
  StrGrid.MergeCells.AddRectXY(8,IntCount+2,12,IntCount+2);
  StrGrid.Cells[8,IntCount+2]:='Total : ';
  StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
  StrGrid.Cells[13,IntCount+2]:=IToCurr(IntJumlah);
  StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[13,IntCount+2].Font.Style:= [fsBold];
  Total.Text:=IntToStr(Length(ResvArr));
  Main.M_Normal;
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
var Count,Count2,Count3,Count4,IntCount5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(ResvArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 9 do
      if (StrPos(PChar(UpperCase(ResvArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 12 do
          StrGrid.Cells[Count4,Count2]:=ResvArr[Count][Count4];
          for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clWindowText;
          for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].BGColor:=clWhite;
          if ResvArr[Count][16]='1' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].BGColor:=clSilver;
          if ResvArr[Count][15]<>'' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=$00004080;
          if ResvArr[Count][10]<>'' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clBlue;
          if ResvArr[Count][14]<>'' then
            if StrToInt(ResvArr[Count][14])>=StrToInt(ResvArr[Count][13]) then
              if ResvArr[Count][10]<>'' then
                for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clPurple
              else
                for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clGreen;
          if ResvArr[Count][11]='0' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clRed;
          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TBudgetListRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TBudgetListRpt.StrGridDblClick(Sender: TObject);
var IsAuth:Boolean;
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'')  then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('BookingForm')=False then BookingForm:=TBookingForm.Create(Self,StrGrid.Cells[0,IntRow],False)
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        if Main.IsFormOpen('BookingForm')=False then begin
          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True);
          Close;
        end;
      end else
      if UpperCase(FormRequest)='BOOKING-REPRINT' then  begin
        BookingForm.RePrint(StrGrid.Cells[0,IntRow]);
        Close;
      end else
      if UpperCase(FormRequest)='SJBUS-CREATE' then  begin
        if StrGrid.Cells[10,IntRow]='' then begin
          if StrGrid.Cells[12,IntRow]='0' then begin
            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow]);
            Close;
          end else begin
            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow],StrToBool(StrGrid.Cells[12,IntRow]),StrGrid.Cells[6,IntRow]);
            Close;
          end;
        end else MessageBox(Handle,PChar('     Surat Jalan sudah dibuat'+Chr(13)+Chr(13)+'Klik `Cetak Ulang` untuk mencetak Ulang'),'Surat Jalan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
      if UpperCase(FormRequest)='MAIN-FORCEADD' then  begin
        IsAuth:=True;
        AuthorizedForm.FormId:='131101';
        AuthorizedForm.StrMessage:='Otorisasi Penambahan Armada';
        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
        if IsAuth then begin
          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,'Main-ForceAdd');
          Close;
        end else
          MessageBox(Handle,'Tidak dapat melakukan Penambahan','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
      begin
        BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,FormRequest);
        Close;
      end;
    end;
  end;
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
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
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
