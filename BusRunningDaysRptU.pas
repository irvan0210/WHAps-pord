unit BusRunningDaysRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TBusRunningDaysRpt = class(TForm)
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
    Label5: TLabel;
    Seat: TComboBox;
    PanelLegend: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    Panel1: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    ProgressBar: TProgressBar;
    Pilihan: TRadioGroup;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
  private
    { Private declarations }
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr:Array of TArrString10;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid,CompId:Integer;
    FormRequest:String;
    Initiation,IsInput:Boolean;
    RunDaysArr: array of TArrString40;
    OrderNumber : array of array of string;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshSeat;
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);Overload;
  end;

var
  BusRunningDaysRpt: TBusRunningDaysRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU, StrUtils,
  WorkOrderFormU, BookingFormU, BlockUnitFormU;

{$R *.dfm}

 {
constructor TBusRunningDaysRpt.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=1;
  IsInput:=False;
  inherited Create(AOwner);
end;
 }
constructor TBusRunningDaysRpt.Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);
begin
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: BusRunningDaysRpt='+Form_Request+','+BoolToStr(Is_Input),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBusRunningDaysRpt.Init;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  StrGrid.WordWrap:=True;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=-1;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=31+4;
  StrGrid.ColWidths[0]:=35;
  StrGrid.ColWidths[1]:=65;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=120;
  StrGrid.RowHeights[0]:=45;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='Id Pengemudi';
  StrGrid.Cells[3,0]:='Batangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=1 to 31 do begin
    StrGrid.Cells[3+IntCount,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[3+IntCount,0].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=4 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;
  ProgressBar.Visible:=False;
end;

procedure TBusRunningDaysRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND (company_id='+CompanyArr[SBU.ItemIndex][1]+');';
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
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TBusRunningDaysRpt.RefreshSeat;
var QStr,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',1;';
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
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

procedure TBusRunningDaysRpt.RefreshGrid;
var IntCount,IntCountA:Integer;
begin
//  for IntCount:=1 to StrGrid.ColCount do begin
//    for IntCountA:=0 to StrGrid.RowCount-1 do begin
//      StrGrid.Cells[IntCount,IntCountA]:='';
//      StrGrid.CellStyle[IntCount,IntCountA].BGColor:=clBtnFace;
//    end;
//  end;
end;

procedure TBusRunningDaysRpt.RefreshData;
var StrQry,QAddParam,AkhirBulan,AwalBulan,StrBodyId,StrLicensePlate,StrLocationId,StrCompanyId,StrBatchId,StrSeat,StrIsFacelift,StrIsSafetyBelt:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3,IntCount4,IntTotal,IntBroken,IntRunning,IntTotalAll,IntAvg:Integer;
    IntUsage,IntRepair:Array[1..31] of Integer;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  SetLength(RunDaysArr,0); 
  QAddParam:='';
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=Days+4;
  for IntCount:=1 to Days do begin
    Application.ProcessMessages;
    StrGrid.Cells[IntCount+3,0]:=LongDayNames[DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))]+' / '+IntToStr(IntCount);
    StrGrid.ColWidths[IntCount+3]:=IntColumnWidth;
    if DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[IntCount+3,0].BGColor:=clRed
    else
      StrGrid.CellStyle[IntCount+3,0].BGColor:=clBtnFace;
  end;
{  StrGrid.Cells[Days+4,0]:='Total Jalan PerUnit';
  StrGrid.Cells[Days+5,0]:='Total Perbaikan PerUnit';
  StrGrid.Cells[Days+6,0]:='Total Tersedia PerUnit';
  StrGrid.Cells[Days+7,0]:='Persen Utilisasi PerUnit';
  StrGrid.ColWidths[Days+4]:=50;
  StrGrid.ColWidths[Days+5]:=55;
  StrGrid.ColWidths[Days+6]:=50;
  StrGrid.ColWidths[Days+7]:=60;
  StrGrid.CellStyle[Days+4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+4,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+5,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+6,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+7,0].BGColor:=clBtnFace;
}
  For IntCount:=1 to 31 do IntUsage[IntCount]:=0;
  For IntCount:=1 to 31 do IntRepair[IntCount]:=0;
  IntTotal:=0;
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
    StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    IntCount4:=1;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    for IntCount2:=0 to Qry.RecordCount-1 do begin
      for IntCount3:=0 to Days+4 do StrGrid.Cells[3+IntCount3,IntCount2+1]:='';
      Application.ProcessMessages;
    end;
    IntTotal:=Qry.RecordCount;
    ProgressBar.Position:=5;
    SetLength(OrderNumber, 0, 0);

    SetLength(OrderNumber, Days+5, Qry.RecordCount+20);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ProgressBar.Position:=10+Round((90/Qry.RecordCount)*IntCount4);
      Application.ProcessMessages;
      SetLength(RunDaysArr,IntCount);
      StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[3,IntCount].BGColor:=clWindow;
      StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
      StrGrid.RowHeights[IntCount]:=62;
      StrBodyId:=Qry.FieldValues['body_id'];
      if Length(StrBodyId)<5 then StrBodyId:=StrBodyId+'  ';
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        StrLicensePlate:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

      if (Qry.FieldValues['is_facelift']=1) then StrIsFacelift:='*' else StrIsFacelift:='';
      if (Qry.FieldValues['is_safetybelt']=1) then StrIsSafetyBelt:='<>' else StrIsSafetyBelt:='';

      StrGrid.Cells[1,IntCount]:=StrBodyId+'         '+StrLicensePlate+StrIsFacelift+StrIsSafetyBelt;
      if Qry.FieldValues['employee_id']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['employee_id'] else StrGrid.Cells[2,IntCount]:='';
      if Qry.FieldValues['name']<>NULL then  StrGrid.Cells[3,IntCount]:=Qry.FieldValues['name'] else StrGrid.Cells[3,IntCount]:='';
      for IntCount2:=1 to Days do begin
        Application.ProcessMessages;
        StrGrid.Cells[IntCount2+3,IntCount]:='';
        StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clWindowText;
      end;
      IntRunning:=0;
      IntBroken:=0;
      StrQry:='EXEC GetRunningDaysDetail '+QuotedStr(Qry.FieldValues['vehicle_id'])+',@FromDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+',@ToDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',IncDay(IncMonth(VarToDateTime(AwalBulan)),-1)))+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;

      //ShowMessage(IntToStr(IntCount2+3)+#13#10+IntToStr(Qry2.RecordCount+2));
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        for IntCount2:=Qry2.FieldValues['from_date'] to Qry2.FieldValues['to_date'] do begin
          Application.ProcessMessages;
          if Qry2.FieldValues['customer_order_id']<>NULL then RunDaysArr[IntCount-1][IntCount2]:=Qry2.FieldValues['customer_order_id']
          else RunDaysArr[IntCount-1][IntCount2]:='             ';

          if Trim(StrGrid.Cells[IntCount2+3,IntCount])='' then begin
            if Qry2.FieldValues['out_type']='0' then begin
              StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clPurple;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  := Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= Qry2.FieldValues['customer_order_id'];
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                end;
              end else begin
                OrderNumber[IntCount2+3,IntCount]:='             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='             ';
              end;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
            end else if Qry2.FieldValues['out_type']='7' then begin
              StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clOlive;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  := Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= Qry2.FieldValues['customer_order_id'];
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                end;
              end else begin
                OrderNumber[IntCount2+3,IntCount]:='             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='             ';
              end;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
            end else if Qry2.FieldValues['out_type']='1' then begin
              if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clGreen
              else
                StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clBlue;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  := Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= Qry2.FieldValues['customer_order_id'];
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:= '['+Qry2.FieldValues['customer_name']+']';
                   end;
                end;
              end else begin
                OrderNumber[IntCount2+3,IntCount]:='             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='             ';
              end;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
            end else if Qry2.FieldValues['out_type']='2' then begin
              StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clRed;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  := 'Out Of Order   '+Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_order_id'];
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                   end;
                end;

              end else begin
                OrderNumber[IntCount2+3,IntCount]  := 'Out Of Order   '+'             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+'             ';
              end;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='3' then begin
              StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clRed;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  :='Out Of Order   '+Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_order_id'];
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+Qry2.FieldValues['customer_name'];
                   end;
                end;
              end else begin
                OrderNumber[IntCount2+3,IntCount]  :='Out Of Order   '+'             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='Out Of Order   '+'             ';
              end;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='5' then begin
              StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clBlue;
              if Qry2.FieldValues['customer_order_id']<>NULL then begin
                OrderNumber[IntCount2+3,IntCount]  :=Qry2.FieldValues['customer_order_id'];
                StrGrid.Cells[IntCount2+3,IntCount]:='Blok Unit    '+Qry2.FieldValues['customer_order_id'];
              end else begin
                OrderNumber[IntCount2+3,IntCount]  :='Blok Unit'+'             ';
                StrGrid.Cells[IntCount2+3,IntCount]:='Blok Unit    '+'             ';
              end;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end
          end else begin
            if Qry2.FieldValues['out_type']='0' then begin
              if StrGrid.CellStyle[IntCount2+2,IntCount].BGColor=clRed then begin
                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGray;
                OrderNumber[IntCount2+3,IntCount]  :=OrderNumber[IntCount2+3,IntCount]+'  '+Qry2.FieldValues['customer_order_id'];
                //StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_name']+']';
                case Pilihan.ItemIndex of
                0: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_name']+']';
                   end;
                1: begin
                    StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_order_id']+']';
                   end;
                else begin
                    StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_name']+']';
                   end;
                end;

              end;
            end else if Qry2.FieldValues['out_type']='1' then begin
              if StrGrid.CellStyle[IntCount2+2,IntCount].BGColor=clRed then begin
                if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clGreen
                else StrGrid.CellStyle[IntCount2+3,IntCount].Font.Color:=clBlue;
                Inc(IntUsage[IntCount2]);
                Inc(IntRunning);
                Dec(IntRepair[IntCount2]);
                Dec(IntBroken);
              end;
            end else if Qry2.FieldValues['out_type']='4' then begin
              if StrGrid.CellStyle[IntCount2+2,IntCount].BGColor=clPurple then begin
                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGray;
                Inc(IntRepair[IntCount2]);
                Inc(IntBroken);
                Dec(IntUsage[IntCount2]);
                Dec(IntRunning);
              end;
            end;
            if Qry2.FieldValues['customer_order_id']<>NULL then begin
              OrderNumber[IntCount2+3,IntCount]  :=OrderNumber[IntCount2+3,IntCount]+'  '+Qry2.FieldValues['customer_order_id'];
              case Pilihan.ItemIndex of
              0: begin
                  StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_name']+']';
                 end;
              1: begin
                  StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  '+Qry2.FieldValues['customer_order_id'];
                 end;
              else begin
                  StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  ['+Qry2.FieldValues['customer_name']+']';
                 end;
              end;
            end else begin
              OrderNumber[IntCount2+3,IntCount]  :=OrderNumber[IntCount2+3,IntCount]+'  '+'             ';
              StrGrid.Cells[IntCount2+3,IntCount]:=StrGrid.Cells[IntCount2+3,IntCount]+'  '+'             ';
            end;

          end;
        end;
        Qry2.Next;
      end;
//      StrGrid.Cells[Days+4,IntCount]:=IntToStr(IntRunning);
//      StrGrid.Cells[Days+5,IntCount]:=IntToStr(IntBroken);
//      StrGrid.Cells[Days+6,IntCount]:=IntToStr(Days-IntRunning-IntBroken);
//      StrGrid.Cells[Days+7,IntCount]:=IntToStr(Round((IntRunning/Days)*100))+' %';
//      StrGrid.CellStyle[Days+4,IntCount].HorizontalAlignment:=taCenter;
//      StrGrid.CellStyle[Days+5,IntCount].HorizontalAlignment:=taCenter;
//      StrGrid.CellStyle[Days+6,IntCount].HorizontalAlignment:=taCenter;
//      StrGrid.CellStyle[Days+7,IntCount].HorizontalAlignment:=taCenter;
//      StrGrid.CellStyle[Days+4,IntCount].Font.Color:=clBlack;
//      StrGrid.CellStyle[Days+5,IntCount].Font.Color:=clBlack;
//      StrGrid.CellStyle[Days+6,IntCount].Font.Color:=clBlack;
//      StrGrid.CellStyle[Days+7,IntCount].Font.Color:=clBlack;
      Qry2.Close;
      Inc(IntCount);
      Inc(IntCount4);
      If Qry.RecNo >= 8 then
        StrGrid.TopRow:= Qry.RecNo-6;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ProgressBar.Position:=95;
{  if IntTotal>0 then begin
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+7 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[3,StrGrid.RowCount-1]:=' Total Jalan PerHari';
    for IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(IntUsage[IntCount]);
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+IntUsage[IntCount];
    end;
    StrGrid.Cells[Days+4,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+4,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+7 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[3,StrGrid.RowCount-1]:=' Perbaikan PerHari';
    For IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(IntRepair[IntCount]);
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].Font.Color:=clBlack;
    end;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+7 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[3,StrGrid.RowCount-1]:=' Total Tersedia PerHari';
    For IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]);
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]);
    end;
    StrGrid.Cells[Days+6,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+6,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    IntAvg:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+7 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[3,StrGrid.RowCount-1]:=' Persen Jalan PerHari';
    For IntCount:=1 to Days do begin
      if IntUsage[IntCount]>0 then StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))+' %'
      else StrGrid.Cells[IntCount+3,StrGrid.RowCount-1]:='0 %';
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+3,StrGrid.RowCount-1].Font.Color:=clBlack;
      if IntUsage[IntCount]>0 then begin
        IntTotalAll:=IntTotalAll+Round((IntUsage[IntCount]/IntTotal)*100);
        Inc(IntAvg)
      end;
    end;
    if (IntTotalAll>0) then
      StrGrid.Cells[Days+7,StrGrid.RowCount-1]:=IntToStr(Round(IntTotalAll/IntAvg))+' %'
    else
      StrGrid.Cells[Days+7,StrGrid.RowCount-1]:='0 %';
    StrGrid.CellStyle[Days+7,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end;
}
  if StrGrid.RowCount>=6 then
    StrGrid.TopRow:= StrGrid.RowCount-6;
  Main.M_Normal;
  ProgressBar.Visible:=False;
end;

procedure TBusRunningDaysRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBusRunningDaysRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusRunningDaysRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TBusRunningDaysRpt.LihatDataClick(Sender: TObject);
begin
  RefreshGrid;
  RefreshData;
end;

procedure TBusRunningDaysRpt.ToXCelClick(Sender: TObject);
begin
  //if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
  if ToExcel4(StrGrid,'RD '+Bulan.Text+'-'+Tahun.Text) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TBusRunningDaysRpt.LokasiChange(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
  end;
end;

procedure TBusRunningDaysRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TBusRunningDaysRpt.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
    if not(IsInput) then begin
      if Main.IsFormOpen('OrderForm')=False then begin
        if StrPos(PChar(StrGrid.Cells[IntCol,IntRow]),PChar('  '))=nil then begin
            //OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[IntCol,IntRow],False)
            OrderForm:=TOrderForm.Create(Self,OrderNumber[IntCol,IntRow],False)
        end else begin
            //SelectBooking:=TSelectBooking.Create(Self,StrGrid.Cells[IntCol,IntRow])
            SelectBooking:=TSelectBooking.Create(Self, OrderNumber[IntCol,IntRow])
        end;
      end;
    end else begin
      If UpperCase(FormRequest)='MAIN-CHANGE' then begin
        if StrPos(PChar(StrGrid.Cells[IntCol,IntRow]),PChar('  '))=nil then
            //BookingForm:=TBookingForm.Create(Self,'',IsInput,FormRequest,StrGrid.Cells[IntCol,IntRow])
            BookingForm:=TBookingForm.Create(Self,'',IsInput,FormRequest, OrderNumber[IntCol,IntRow])
        else begin
            //SelectBooking:=TSelectBooking.Create(Self,StrGrid.Cells[IntCol,IntRow],FormRequest,IsInput);
            SelectBooking:=TSelectBooking.Create(Self, OrderNumber[IntCol,IntRow],FormRequest,IsInput);
        end;
      end;
    end;
end;

procedure TBusRunningDaysRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshSeat;
  //RefreshData;
  Initiation:=False;
end;

procedure TBusRunningDaysRpt.BatchChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshSeat;
  end;
end;

end.
