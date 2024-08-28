unit RevenueVhcMonthlyRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TRevenueVhcMonthlyRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Selesai: TButton;
    Bulan: TComboBox;
    Batch: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    Seat: TComboBox;
    GroupCompany: TGroupBox;
    SBU: TComboBox;
    ProgressBar: TProgressBar;
    Label5: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr:Array of TArrString8;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    DailyArr:array of TArrString31;
    FormRequest,IsAll:String;
    IsInput,Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshSeat;
    procedure SetProgressBar(IsVisible:Boolean=True;IntPosition:Integer=0);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False;Is_All:String='');Overload;
  end;

var
  RevenueVhcMonthlyRpt: TRevenueVhcMonthlyRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU, WorkOrderFormU, StrUtils,
  BookingFormU, Math;

{$R *.dfm}

constructor TRevenueVhcMonthlyRpt.Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False;Is_All:String='');
begin
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: RevenueVhcMonthlyRpt='+Form_Request+','+BoolToStr(Is_Input),1);
  Initiation:=True;
  IsAll:=Is_All;
  inherited Create(AOwner);
end;

procedure TRevenueVhcMonthlyRpt.Init;
begin
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  ProgressBar.Visible:=False;
end;

procedure TRevenueVhcMonthlyRpt.InitGrid;
var IntCount,IntCountA:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=2;
  StrGrid.WordWrap:=True;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=80;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=9;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=170;
  StrGrid.ColWidths[3]:=40;
  StrGrid.ColWidths[4]:=50;
  StrGrid.RowHeights[0]:=24;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Batangan';
  StrGrid.Cells[3,0]:='RD';
  StrGrid.Cells[4,0]:='Utilitas %';
  StrGrid.Cells[5,0]:='Sales';
  StrGrid.Cells[6,0]:='Sales/RD';
  StrGrid.Cells[7,0]:='Bahan Bakar';
  StrGrid.Cells[8,0]:='Uang Order';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  for IntCount:=1 to 6 do begin
    for IntCountA:=1 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCountA,IntCount]:='';
    StrGrid.CellStyle[2+IntCount,0].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=5 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;


end;

procedure TRevenueVhcMonthlyRpt.RefreshGrid;
var IntCount,IntCountA:Integer;
begin
  for IntCount:=1 to StrGrid.ColCount do begin
    for IntCountA:=0 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCountA]:='';
      StrGrid.CellStyle[IntCount,IntCountA].BGColor:=clBtnFace;
    end;
  end;
end;

procedure TRevenueVhcMonthlyRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
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
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TRevenueVhcMonthlyRpt.RefreshSeat;
var QStr:String;
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
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail 2,'+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
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

procedure TRevenueVhcMonthlyRpt.SetProgressBar(IsVisible:Boolean=True;IntPosition:Integer=0);
begin
  ProgressBar.Visible:=IsVisible;
  ProgressBar.Position:=IntPosition;
end;

procedure TRevenueVhcMonthlyRpt.RefreshData;
var StrQry,AwalBulan,AkhirBulan,StrCompanyId,StrLocationId,StrBatchId,StrSeat,StrCategorized,StrLicensePlate,StrBatchName:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3,TotalRD,TotalUnit,TotalFuel,TotalCost:Integer;
    TotalGross:Int64;
    StrList:TStringList;
    IsMatch:Boolean;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Driver';
  StrGrid.Cells[3,0]:='RD';
  StrGrid.Cells[4,0]:='Utilitas %';
  StrGrid.Cells[5,0]:='Sales';
  StrGrid.Cells[6,0]:='Sales/RD';
  StrGrid.Cells[7,0]:='Bahan Bakar';
  StrGrid.Cells[8,0]:='Uang Order';
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[6,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[7,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[8,0].BGColor:=clBtnFace;
  Case CaseStr(IsAll,['','Finance','Sales']) of
    1:begin
      end;
    2:begin
        StrGrid.Cells[5,0]:='';
        StrGrid.ColWidths[5]:=0;
        StrGrid.Cells[7,0]:='';
        StrGrid.ColWidths[7]:=0;
        StrGrid.Cells[8,0]:='';
        StrGrid.ColWidths[8]:=0;
      end;
      else begin
      end;
  end;
  if Main.OpenDb then begin
    StrGrid.TopRow := 1;
    StrCompanyId:=',@CompanyId='+CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';
    if Seat.Text<>'All' then begin
      StrSeat:=',@Seat='+Seat.Text;
    end else StrSeat:='';
    StrCategorized:=',@OrderBy='+QuotedStr('h.vhc_batch_id,seat,license_plate');
    StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+StrCategorized+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    IntCount3:=1;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    StrGrid.HandleNeeded;
    ProgressBar.Position:=10;
    StrBatchName:='';
    TotalRD:=0;
    TotalUnit:=0;
    TotalGross:=0;
    TotalCost:=0;
    TotalFuel:=0;
    if (Qry.RecordCount>0) then while Not(Qry.Eof) do begin
      ProgressBar.Position:=10+Round((90/Qry.RecordCount)*IntCount);
      {if Qry.FieldValues['vehicle_id']='BS219060002' then begin
        ShowMessage('OK');
        ShowMessage('OK2');
      end;
      }
      if StrBatchName<>Qry.FieldValues['batch_name']+' '+IntToStr(Qry.FieldValues['seat']) then begin
        StrBatchName:=Qry.FieldValues['batch_name']+' '+IntToStr(Qry.FieldValues['seat']);
        for IntCount2:=0 to Days+3 do begin
          StrGrid.Cells[IntCount2,IntCount]:='';
          StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
        end;
        if IntCount>1 then begin
          StrGrid.RowCount:=StrGrid.RowCount+1;
          StrGrid.CellStyle[3,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[4,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[5,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[6,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[7,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[8,IntCount].BGColor:=clSilver;
          StrGrid.CellStyle[3,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[4,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[5,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[6,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[7,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[8,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[3,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[4,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[5,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[6,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[7,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[8,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[3,IntCount]:=IToCurr(TotalRD);
          try
            StrGrid.Cells[4,IntCount]:=IToCurr(Round((TotalRD/(TotalUnit*Days)*100)));
          except on Exception Do
            StrGrid.Cells[4,IntCount]:='0';
          end;
          if IsAll<>'Sales' then StrGrid.Cells[5,IntCount]:=IToCurr(TotalGross);
          try
            StrGrid.Cells[6,IntCount]:=IToCurr(Round(TotalGross/TotalRD));
          except on Exception do
            StrGrid.Cells[6,IntCount]:='0';
          end;
          if IsAll<>'Sales' then StrGrid.Cells[7,IntCount]:=IToCurr(TotalFuel);
          if IsAll<>'Sales' then StrGrid.Cells[8,IntCount]:=IToCurr(TotalCost);
          StrGrid.MergeCells.AddRectXY(0,IntCount,2,IntCount);
          Inc(IntCount);
        end;
        if (StringReplace(Qry.FieldValues['license_plate'],' ','',[rfReplaceAll])<>'B53WA01') Or (StringReplace(Qry.FieldValues['license_plate'],' ','',[rfReplaceAll])<>'B53WA01') then begin {B53WA01}
          StrGrid.RowCount:=StrGrid.RowCount+1;
          StrGrid.CellStyle[2,IntCount].BGColor:=clSkyBlue;
          StrGrid.CellStyle[2,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[2,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[3,IntCount].BGColor:=clSkyBlue;
          StrGrid.MergeCells.AddRectXY(0,IntCount,1,IntCount);
          StrGrid.MergeCells.AddRectXY(3,IntCount,8,IntCount);
          StrGrid.Cells[2,IntCount]:=StrBatchName;
          TotalRD:=0;
          TotalUnit:=0;
          TotalGross:=0;
          TotalCost:=0;
          TotalFuel:=0;
          Inc(IntCount);
        end else begin
          StrGrid.RowCount:=StrGrid.RowCount-1;
        end;
      end;
      //if StringReplace(Qry.FieldValues['license_plate'],' ','',[rfReplaceAll])<>'B53WA01' then begin
      if (StringReplace(Qry.FieldValues['license_plate'],' ','',[rfReplaceAll])<>'B53WA01') Or (StringReplace(Qry.FieldValues['license_plate'],' ','',[rfReplaceAll])<>'B53WA01') then begin {B53WA01}
        StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
        StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
        StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
        StrGrid.RowHeights[IntCount]:=20;
        StrGrid.Cells[0,IntCount]:=IToCurr(IntCount3);
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        StrGrid.Cells[1,IntCount]:=StrLicensePlate;
        if Qry.FieldValues['name']<>NULL then  StrGrid.Cells[2,IntCount]:=Qry.FieldValues['name'] else StrGrid.Cells[2,IntCount]:='';
        StrQry:='EXEC GetRevenueVhcMonthRpt '+LocationId+',@VehicleId='+QuotedStr(Qry.FieldValues['vehicle_id'])+',@Dates='+
              QuotedStr(FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan)))+',@ToDates='+
              QuotedStr(FormatDateTime('dd-mm-yyyy',IncDay(IncMonth(VarToDateTime(AwalBulan)),-1)))+';';
        Qry2.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        if Qry2.RecordCount>0 then begin
          StrGrid.CellStyle[5,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[6,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[7,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[8,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
          if Qry2.FieldValues['running_days']<>NULL then begin
            StrGrid.Cells[3,IntCount]:=IToCurr(Qry2.FieldValues['running_days']);
            TotalRD:=TotalRD+Qry2.FieldValues['running_days'];
            try
              StrGrid.Cells[4,IntCount]:=IToCurr(round((Qry2.FieldValues['running_days']/days)*100));
            except on Exception Do
              StrGrid.Cells[4,IntCount]:=IToCurr(0);
            end;
          end;
          if (Qry2.FieldValues['total_gross']<>NULL) then begin
            if IsAll<>'Sales' then StrGrid.Cells[5,IntCount]:=IToCurr(Qry2.FieldValues['total_gross']);
            TotalGross:=TotalGross+Qry2.FieldValues['total_gross'];
          end;
          if (Qry2.FieldValues['running_days']<>NULL) AND (Qry2.FieldValues['total_gross']<>NULL) then
            try
              StrGrid.Cells[6,IntCount]:=IToCurr(RoundTo(Qry2.FieldValues['total_gross']/Qry2.FieldValues['running_days'],0));
            Except on E:Exception Do
              StrGrid.Cells[6,IntCount]:='0';
            End;
          if Qry2.FieldValues['total_fuel']<>NULL then begin
            if IsAll<>'Sales' then StrGrid.Cells[7,IntCount]:=IToCurr(Qry2.FieldValues['total_fuel']);
            TotalFuel:=TotalFuel+Qry2.FieldValues['total_fuel'];
          end;
          if Qry2.FieldValues['total_cost']<>NULL then begin
            if IsAll<>'Sales' then StrGrid.Cells[8,IntCount]:=IToCurr(Qry2.FieldValues['total_cost']);
            TotalCost:=TotalCost+Qry2.FieldValues['total_cost'];
          end;
          Inc(TotalUnit);
        end;
        Qry2.Close;
        Inc(IntCount);
        Inc(IntCount3);
      end;
      Application.ProcessMessages;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ProgressBar.Position:=95;
  ProgressBar.Visible:=False;
  Main.M_Normal;
  //Showmessage('Proses Selesai');
end;


procedure TRevenueVhcMonthlyRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRevenueVhcMonthlyRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TRevenueVhcMonthlyRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TRevenueVhcMonthlyRpt.LihatDataClick(Sender: TObject);
begin
  RefreshGrid;
  RefreshData;
end;

procedure TRevenueVhcMonthlyRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TRevenueVhcMonthlyRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TRevenueVhcMonthlyRpt.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
    if not(IsInput) then begin
      if (Main.IsFormOpen('OrderForm')=False) and (DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]<>'')then
        if StrPos(PChar(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]),PChar('  '))=nil then begin
          if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],2)='CO') then
            OrderForm:=TOrderForm.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],False)
          else
            if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],True)
        end else begin
          SelectBooking:=TSelectBooking.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]);
        end;
    end else begin
      If UpperCase(FormRequest)='MAIN-CHANGE' then begin
        if StrPos(PChar(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]),PChar('  '))=nil then
            BookingForm:=TBookingForm.Create(Self,'',IsInput,FormRequest,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)])
        else begin
            SelectBooking:=TSelectBooking.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],FormRequest,IsInput);
        end;
      end;
    end;
end;

procedure TRevenueVhcMonthlyRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshSeat;
  Initiation:=False;
end;

procedure TRevenueVhcMonthlyRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
