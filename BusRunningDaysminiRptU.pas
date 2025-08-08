unit BusRunningDaysminiRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TBusRunningDaysminiRpt = class(TForm)
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
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    NotCategorized: TRadioButton;
    Categorized: TRadioButton;
    ProgressBar: TProgressBar;
    isSimple: TCheckBox;
    Label10: TLabel;
    Label14: TLabel;
    Memo1: TMemo;
    isOutsideRent: TCheckBox;
    SBUtemp: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
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
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    BatchArr,SeatArr:Array of TArrString2;
    CompanyLocationArr,CompanyArr,CompanyArrTemp:Array of TArrString8;

    VehicleArr:Array of TArrString9;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    DailyArr:array of TArrString31;
    FormRequest:String;
    IsInput,Initiation,IsSBasPKB:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshSeat;
    procedure SetProgressBar(IsVisible:Boolean=True;IntPosition:Integer=0);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);Overload;
  end;

var
  BusRunningDaysminiRpt: TBusRunningDaysminiRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU, WorkOrderFormU, StrUtils,
  BookingFormU, MaintenanceServiceFormU, BlockUnitFormU;

{$R *.dfm}

constructor TBusRunningDaysminiRpt.Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);
begin
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: BusRunningDaysMiniRpt='+Form_Request+','+BoolToStr(Is_Input),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBusRunningDaysminiRpt.Init;
begin
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  isOutsideRent.Checked:=False;
  Categorized.Checked:=True;
  ProgressBar.Visible:=False;
end;

procedure TBusRunningDaysminiRpt.InitGrid;
var IntCount,IntCountA:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  StrGrid.WordWrap:=True;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=22;//25
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=31+7;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=75;
  StrGrid.ColWidths[2]:=137;
  StrGrid.ColWidths[3]:=122;
  StrGrid.RowHeights[0]:=24;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Driver Batangan';
  StrGrid.Cells[3,0]:='Helper Batangan';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  
  for IntCount:=1 to 31 do begin
    for IntCountA:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCountA,IntCount]:='';
    StrGrid.Cells[3+IntCount,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[3+IntCount,0].HorizontalAlignment:=taCenter;
    Application.ProcessMessages;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
  Application.ProcessMessages;
  for IntCount:=4 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[IntCount]:=IntColumnWidth;
  Application.ProcessMessages;
end;

procedure TBusRunningDaysminiRpt.RefreshGrid;
var IntCount,IntCountA:Integer;
    StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('ServiceBerkala_as_PKB_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['value_string']=1 then IsSBasPKB:=True Else IsSBasPKB:=False;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Main.M_Normal;

  for IntCount:=1 to StrGrid.ColCount do begin
    for IntCountA:=0 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCountA]:='';
      StrGrid.CellStyle[IntCount,IntCountA].BGColor:=clBtnFace;
      StrGrid.CellStyle[IntCount,IntCountA].Font.Color := clWindowText;
    end;
  end;
end;

procedure TBusRunningDaysminiRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    isFound:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
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
      Inc(IntCount);
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;

    {Init data from User RD Location}
    StrQry:='EXEC GetUserRDLocationList @UserName='+QuotedStr(User)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    isFound := False;
    if Qry.RecordCount>0 then begin
      SetLength(CompanyArrTemp,0);
      SetLength(CompanyArrTemp,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        CompanyArrTemp[IntCount][0]:=Qry.FieldValues['company_location_id'];
        CompanyArrTemp[IntCount][1]:=Qry.FieldValues['company_id'];
        CompanyArrTemp[IntCount][2]:=Qry.FieldValues['location_id'];
        CompanyArrTemp[IntCount][3]:=Qry.FieldValues['name'];
        CompanyArrTemp[IntCount][4]:=Qry.FieldValues['location'];
        CompanyArrTemp[IntCount][5]:=Qry.FieldValues['company_code'];
        Inc(IntCount);
        Qry.Next;
      end;
      SBUtemp.Items.Clear;
      for IntCount:=0 to Length(CompanyArrTemp)-1  do begin
        SBUtemp.Items.Add(CompanyArrTemp[IntCount][3]+' ('+CompanyArrTemp[IntCount][4]+')');
        if (CompanyId=CompanyArrTemp[IntCount][1]) and  (LocationId=CompanyArrTemp[IntCount][2]) then begin
          SBUtemp.ItemIndex:=IntCount;
          isFound:= True;
        end;
      end;
      if isFound then begin
        GroupCompany.Enabled:=True;
        SBU.Items.Clear;
        SBU.Items := SBUtemp.Items;
        SetLength(CompanyArr,0);
        CompanyArr := CompanyArrTemp;
        SBU.ItemIndex := SBUtemp.ItemIndex;
      end;
    end;


//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
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
  //if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TBusRunningDaysminiRpt.RefreshSeat;
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

procedure TBusRunningDaysminiRpt.SetProgressBar(IsVisible:Boolean=True;IntPosition:Integer=0);
begin
  ProgressBar.Visible:=IsVisible;
  ProgressBar.Position:=IntPosition;
end;


procedure TBusRunningDaysminiRpt.RefreshData;
var StrQry,StrQry3,QAddParam,AkhirBulan,AwalBulan,StrBodyId,StrLicensePlate,StrCompanyId,StrLocationId,StrSeat,StrBatchId,StrCategorized,StrBatchName,StrIsFacelift,
    StrIsSafetyBelt,StrTanggal,StrBulan,StrTgl:String;
    Qry,Qry2,Qry3:TADOQuery;
    IntCount,IntCount2,IntCount3,IntCount4, IntCountVhc, IntCountVhc2, IntTotal,
    IntBroken,IntRunning,IntTotalAll,IntAvg,IntGeserKolom,IntGsrKlm,IntJmlUnit,IntTotalAllSub,IntAvgSub, IntPersenUtilisasiHari,recordcount:Integer;
    IntUsage,IntRepair,IntCategory,IntTotalBatch,IntUsageBatch,IntRepairBatch,IntTotalSewaLuar:Array[1..31] of Integer;
    StrList:TStringList;
    PersenUtilisasi:String;
    IsMatch:Boolean;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  SetLength(DailyArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout:=3600;

  QAddParam:='';
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;

  IntGeserKolom   :=1;
  IntGsrKlm       :=IntGeserKolom;

  StrGrid.ColCount:=Days+8+IntGsrKlm;

  for IntCount:=1 to Days do begin
//    StrGrid.Cells[IntCount+3,0]:=LongDayNames[DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))]+' / '+IntToStr(IntCount);
    StrGrid.ColWidths[IntCount+2+IntGsrKlm]:=IntColumnWidth;
    StrGrid.Cells[IntCount+2+IntGsrKlm,0]:=IntToStr(IntCount);
    if DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,0].BGColor:=clRed
    else
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,0].BGColor:=clBtnFace;
  end;
  for IntCount:=3+IntGsrKlm to StrGrid.ColCount-1 do
    for IntCount2:=1 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  StrGrid.Cells[Days+3+IntGsrKlm,0]:='Total Jalan';
  StrGrid.Cells[Days+4+IntGsrKlm,0]:='Total Perbaikan';
  StrGrid.Cells[Days+5+IntGsrKlm,0]:='Total Tersedia';
  StrGrid.Cells[Days+6+IntGsrKlm,0]:='Persen Utilisasi';
  StrGrid.Cells[Days+7+IntGsrKlm,0]:='Body ID';
  StrGrid.ColWidths[Days+3+IntGsrKlm]:=45;
  StrGrid.ColWidths[Days+4+IntGsrKlm]:=50;
  StrGrid.ColWidths[Days+5+IntGsrKlm]:=45;
  StrGrid.ColWidths[Days+6+IntGsrKlm]:=45;
  StrGrid.ColWidths[Days+7+IntGsrKlm]:=75;
  StrGrid.CellStyle[Days+3+IntGsrKlm,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+4+IntGsrKlm,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+5+IntGsrKlm,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+6+IntGsrKlm,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+3+IntGsrKlm,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+4+IntGsrKlm,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+5+IntGsrKlm,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+6+IntGsrKlm,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+7+IntGsrKlm,0].BGColor:=clBtnFace;
  For IntCount:=1 to 31 do IntUsage[IntCount]:=0;
  For IntCount:=1 to 31 do IntRepair[IntCount]:=0;
  for IntCount:=1 to 31 do IntCategory[IntCount]:=0;
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
    if Categorized.Checked then StrCategorized:=',@OrderBy='+QuotedStr('category, category_sequence_number,h.vhc_batch_id,seat,license_plate')+',@ShowBatch=1'
    else StrCategorized:=',@OrderBy='+QuotedStr('category, category_sequence_number,h.vhc_batch_id,seat,license_plate');

    if isOutsideRent.Checked then StrCategorized:=StrCategorized+',@isOutsideRent=1'
    else StrCategorized:=StrCategorized+',@isOutsideRent=0';

    For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
      for IntCountVhc2:=0 to 12 do
      StrGrid.Cells[IntCountVhc2,IntCountVhc+1]:='';
    end;
    SetLength(VehicleArr,0);
    StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime(AkhirBulan)));

    StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+StrCategorized+StrTanggal+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCountVhc:=0;

    memo1.Lines.Clear;
    
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
        SetLength(VehicleArr,IntCountVhc+1);
        VehicleArr[IntCountVhc][0]:=Qry.FieldValues['vehicle_id'];
        VehicleArr[IntCountVhc][1]:=Qry.FieldValues['batch_name'];
        VehicleArr[IntCountVhc][2]:=IntToStr(Qry.FieldValues['seat']);
        VehicleArr[IntCountVhc][3]:=VarToStr(Qry.FieldValues['name']);
        VehicleArr[IntCountVhc][4]:=Qry.FieldValues['body_id'];
        VehicleArr[IntCountVhc][5]:=Qry.FieldValues['license_plate'];
        VehicleArr[IntCountVhc][6]:=Qry.FieldValues['is_facelift'];
        VehicleArr[IntCountVhc][7]:=VarToStr(Qry.FieldValues['busboy_name']);
        VehicleArr[IntCountVhc][8]:=Qry.FieldValues['is_safetybelt'];
        Qry.Next;
        Inc(IntCountVhc);
    end;
    Qry.Close;

    IntCount:=1;
    IntCount4:=1;
    IntJmlUnit:=0;
    (* CEK *)
    //if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+2 else StrGrid.RowCount:=2;

    StrGrid.HandleNeeded;
    for IntCount2:=0 to Length(VehicleArr)-1 do begin
      for IntCount3:=0 to Days+4 do StrGrid.Cells[3+IntCount3+IntGsrKlm,IntCount2+1]:='';
    end;
    IntTotal:=Length(VehicleArr);//Qry.RecordCount;
    StrBatchName:='';
    ProgressBar.Position:=10;

    StrGrid.MergeCells.Clear;

    (*ProsesRD*)
    //if (Qry.RecordCount>0) then while Not(Qry.Eof) do begin
    For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
      try
        ProgressBar.Position:=10+Round((90/Length(VehicleArr))*IntCount4);
      except on Exception do
        ProgressBar.Position := 0;
      end;
      Application.ProcessMessages;
      SetLength(DailyArr,Length(DailyArr)+1);

      Application.ProcessMessages;
      if Categorized.Checked then begin
        if StrBatchName<>VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2] then begin
          if StrBatchName<>'' then begin
            StrGrid.RowCount:=StrGrid.RowCount+1;
            for IntCount2:=3+IntGsrKlm to Days+2 do begin
              StrGrid.Cells[IntCount2,IntCount]:='';
              StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
            end;
            StrGrid.CellStyle[2,IntCount].BGColor:=clSilver;
            for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=IntToStr(IntCategory[IntCount2]);

            (*Tambah*)
            Inc(IntCount);
            StrGrid.RowCount:=StrGrid.RowCount+1;

            for IntCount2:=0 to Days+6 do StrGrid.Cells[IntCount2,StrGrid.RowCount-1]:='';
            StrGrid.Cells[2, IntCount]:=' Persen Jalan PerHari (%)';

            for IntCount2:=3+IntGsrKlm to Days+2 do begin
              StrGrid.Cells[IntCount2,IntCount]:='';
            end;
            IntTotalAllSub:=0;
            IntAvgSub:=0;
            for IntCount2:=1 to Days do begin
              //IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))
              StrGrid.Cells[IntCount2+2+IntGsrKlm, IntCount]:=IntToStr(Round((IntCategory[IntCount2]/IntJmlUnit)*100));
              if (Round((IntCategory[IntCount2]/IntJmlUnit)*100) > 0) then Inc(IntAvgSub);
              IntTotalAllSub := IntTotalAllSub + Round((IntCategory[IntCount2]/IntJmlUnit)*100);
            end;

            StrGrid.CellStyle[Days+6+IntGsrKlm, IntCount].HorizontalAlignment:=taCenter;
            if IntTotalAllSub>0 then StrGrid.Cells[Days+6+IntGsrKlm, IntCount]:=IntToStr(Round(IntTotalAllSub/IntAvgSub))+' %';

            SetLength(DailyArr,Length(DailyArr)+1);
            (*end tambah*)

            for IntCount2:=1 to 31 do IntCategory[IntCount2]:=0;
            SetLength(DailyArr,Length(DailyArr)+1);
            Inc(IntCount);
          end;
          StrBatchName:=VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2];
          {Cek}
          for IntCount2:=0 to Days+3 do begin
            StrGrid.Cells[IntCount2,IntCount]:='';
            StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
            //Application.ProcessMessages;
          end;
          StrGrid.RowCount:=StrGrid.RowCount+1;
          StrGrid.CellStyle[2,IntCount].BGColor:=clSkyBlue;
          StrGrid.CellStyle[2,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[2,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[3,IntCount].BGColor:=clSkyBlue;
          StrGrid.MergeCells.AddRectXY(3+IntGsrKlm,IntCount,Days+6+IntGsrKlm,IntCount);
          StrGrid.MergeCells.AddRectXY(2,IntCount,3,IntCount);
          StrGrid.Cells[2,IntCount]:=StrBatchName;
          Inc(IntCount);
          SetLength(DailyArr,Length(DailyArr)+1);

          IntJmlUnit := 0;
          Application.ProcessMessages;
        end;
      end;

      Inc(IntJmlUnit);

      StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
      //nomor urut
      if Categorized.Checked then StrGrid.Cells[0,IntCount]:=IntToStr(IntJmlUnit)
      else StrGrid.Cells[0,IntCount]:=IntToStr(IntCount4);

      StrGrid.RowHeights[IntCount]:=20;
      if IsCharAlpha(PChar(Copy(VehicleArr[IntCountVhc][5],2,1))^)=False then
        StrLicensePlate:=Copy(VehicleArr[IntCountVhc][5],1,1)+' '+Copy(VehicleArr[IntCountVhc][5],2,4)+
              ' '+Copy(VehicleArr[IntCountVhc][5],6,Length(VehicleArr[IntCountVhc][5])+1)
      else
        StrLicensePlate:=Copy(VehicleArr[IntCountVhc][5],1,2)+' '+Copy(VehicleArr[IntCountVhc][5],3,4)+
              ' '+Copy(VehicleArr[IntCountVhc][5],7,Length(VehicleArr[IntCountVhc][5])+1);
      if (VehicleArr[IntCountVhc][6]='1') then StrIsFacelift:='*' else StrIsFacelift:='';
      if (VehicleArr[IntCountVhc][8]='1') then StrIsSafetyBelt:='<>' else StrIsSafetyBelt:='';
      StrGrid.Cells[1,IntCount]:=StrLicensePlate+StrIsFacelift+StrIsSafetyBelt;
      {Driver Name}
      if VehicleArr[IntCountVhc][3]<>NULL then
        StrGrid.Cells[2,IntCount]:=VehicleArr[IntCountVhc][3]
      else
        StrGrid.Cells[2,IntCount]:='';
      {Helper Name}
      if VehicleArr[IntCountVhc][7]<>NULL then
        StrGrid.Cells[3,IntCount]:=VehicleArr[IntCountVhc][7]
      else
        StrGrid.Cells[3,IntCount]:='';

      for IntCount2:=1 to Days do begin
        StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='';
        StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clWindowText;
        StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Style:=[];
        StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clGreen;
        //Application.ProcessMessages;
      end;
      IntRunning:=0;
      IntBroken:=0;
      StrQry:='EXEC GetRunningDaysDetail '+QuotedStr(VehicleArr[IntCountVhc][0])+',@FromDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+',@ToDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',IncDay(IncMonth(VarToDateTime(AwalBulan)),-1)))+', @CompanyId='+CompanyId+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        //Application.ProcessMessages; //detail
        for IntCount2:=Qry2.FieldValues['from_date'] to Qry2.FieldValues['to_date'] do begin
          if DailyArr[Length(DailyArr)-1][IntCount2-1]<>'' then begin
            IsMatch:=False;
            StrList:=TStringList.Create;
            StrList:=SplitStrings(DailyArr[Length(DailyArr)-1][IntCount2-1],'  ');
          end;
          if Qry2.FieldValues['customer_order_id']<>NULL then
            if DailyArr[Length(DailyArr)-1][IntCount2-1]='' then
              DailyArr[Length(DailyArr)-1][IntCount2-1]:=Qry2.FieldValues['customer_order_id']
            else
              DailyArr[Length(DailyArr)-1][IntCount2-1]:=DailyArr[Length(DailyArr)-1][IntCount2-1]+'  '+Qry2.FieldValues['customer_order_id'];

          if Trim(StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount])='' then begin
            if Qry2.FieldValues['out_type']='0' then begin


              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clPurple;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' @';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              if (Qry2.FieldValues['isRepeatOrder']='1') and (Qry2.FieldValues['daily_package']<>'1') then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clAqua;
              end else if Qry2.FieldValues['daily_package']='1' then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clLime;
              end else
              begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
              end;


              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
              Inc(IntCategory[IntCount2]);
            end else if Qry2.FieldValues['out_type']='1' then begin
              if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
              else
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' @';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              if (Qry2.FieldValues['isRepeatOrder']='1') AND (Qry2.FieldValues['daily_package']<>'1') then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clAqua;
              end else if Qry2.FieldValues['daily_package']='1' then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clLime;
              end else
              begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
              end;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
              Inc(IntCategory[IntCount2]);
            end else if Qry2.FieldValues['out_type']='2' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clRed;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='3' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clRed;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='4' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clYellow;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);//pram
              if (IsSBasPKB) Then begin
                Inc(IntRepair[IntCount2]);
                Inc(IntBroken);
                Inc(IntRepairBatch[IntCount2]);
              end;
            end else if Qry2.FieldValues['out_type']='5' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clBlue;
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clWhite;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' B';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
//              Inc(IntRepair[IntCount2]);
//              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='6' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clFuchsia;
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clWhite;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' M';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end else if Qry2.FieldValues['out_type']='7' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clOlive;
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clWhite;
              StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' W';
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
            end;
          end else begin
            if Qry2.FieldValues['out_type']='0' then begin
              if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' @') or (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]='@2') then begin
//                StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clPurple;
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='@2';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                if (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clRed) and (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clBlue)
                    and (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clFuchsia) then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;

                if (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor=clAqua) then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clAqua;
                end;
              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' X') then begin
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' @';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                Inc(IntUsage[IntCount2]);
                Inc(IntCategory[IntCount2]); // pram ubah .
                Inc(IntRunning);
                Dec(IntRepair[IntCount2]);
                Dec(IntBroken);

              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' B') then begin
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' @';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;

                if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;

              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' W') then begin
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=' @';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;

                if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clOlive;

              end;
            end else if Qry2.FieldValues['out_type']='1' then begin
              if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' @') or (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]='@2') then begin
               if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='@2';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                if (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clRed) AND (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clBlue)
                   and (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor<>clFuchsia) then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;

                if (StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor=clAqua) then begin
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clAqua;
                end;
              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' X') then begin
                if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='@';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;
                Inc(IntUsage[IntCount2]);
                Inc(IntCategory[IntCount2]); // pram ubah .
                Inc(IntRunning);
                Dec(IntRepair[IntCount2]);
                Dec(IntBroken);
                //StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGray;
                //StrGrid.Cells[IntCount2+2,IntCount]:=' @';
                //StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' B') then begin
               if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='@';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clWindow;

                Inc(IntUsage[IntCount2]);
                Inc(IntCategory[IntCount2]); // pram ubah .
                Inc(IntRunning);
                Dec(IntRepair[IntCount2]);
                Dec(IntBroken);

              end else if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' W') then begin
               if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='@';
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clOlive;

                Inc(IntUsage[IntCount2]);
                Inc(IntCategory[IntCount2]); // pram ubah .
                Inc(IntRunning);
                Dec(IntRepair[IntCount2]);
                Dec(IntBroken);

              end;
            end else if Qry2.FieldValues['out_type']='3' then begin
              if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' @') or (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]='@2') then begin
//                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clRed;
              end else
                StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clRed;
            end else if Qry2.FieldValues['out_type']='4' then begin
              if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' @') or (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]='@2') then begin
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clYellow;
              end else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clYellow;
            end else if Qry2.FieldValues['out_type']='5' then begin
              StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].Font.Color:=clWhite;
              if (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]=' @') or (StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]='@2') then begin
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clBlue;
              end else
                  StrGrid.CellStyle[IntCount2+2+IntGsrKlm,IntCount].BGColor:=clBlue;
            end;
          end;

        end;
        Qry2.Next;
      end;

      StrGrid.Cells[Days+3+IntGsrKlm,IntCount]:=IntToStr(IntRunning);
      if(IntBroken<=0) then
      begin
        StrGrid.Cells[Days+4+IntGsrKlm,IntCount]:='0';
      end
      else begin
        StrGrid.Cells[Days+4+IntGsrKlm,IntCount]:=IntToStr(IntBroken);
      end;

      StrGrid.Cells[Days+5+IntGsrKlm,IntCount]:=IntToStr(Days-IntRunning-IntBroken);
      StrGrid.Cells[Days+6+IntGsrKlm,IntCount]:=IntToStr(Round((IntRunning/Days)*100))+' %';
      StrGrid.Cells[Days+7+IntGsrKlm,IntCount]:=VehicleArr[IntCountVhc][4];
      StrGrid.CellStyle[Days+3+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+4+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+5+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+6+IntGsrKlm,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+3+IntGsrKlm,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+4+IntGsrKlm,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+5+IntGsrKlm,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+6+IntGsrKlm,IntCount].Font.Color:=clBlack;
      Qry2.Close;
      Inc(IntCount);
      Inc(IntCount4);
      If (IntCountVhc-1) >= 21 then//If Qry.RecNo >= 21 then
        StrGrid.TopRow:= IntCountVhc-20;//Qry.RecNo-20;
      //Qry.Next;
    end; (* end for *)
    //Qry.Close;

    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount2:=3+IntGsrKlm to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    StrGrid.CellStyle[2+IntGsrKlm,IntCount].BGColor:=clSilver;
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=IntToStr(IntCategory[IntCount2]);

    (*Tambah*)
    Inc(IntCount);
    StrGrid.RowCount:=StrGrid.RowCount+1;

    for IntCount2:=0 to Days+6 do StrGrid.Cells[IntCount2,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2, IntCount]:=' Persen Jalan PerHari (%)';

    for IntCount2:=3+IntGsrKlm to Days+3 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      //StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;

    IntTotalAllSub:=0;
    IntAvgSub:=0;
    for IntCount2:=1 to Days do begin
      //IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))
      try
        StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=IntToStr(Round((IntCategory[IntCount2]/IntJmlUnit)*100));
        if (Round((IntCategory[IntCount2]/IntJmlUnit)*100) > 0) then Inc(IntAvgSub);
        IntTotalAllSub := IntTotalAllSub + Round((IntCategory[IntCount2]/IntJmlUnit)*100);
      except on Exception do begin
          StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:='0';
          IntTotalAllSub:=0;
        end;
      end;

    end;
    StrGrid.CellStyle[Days+6+IntGsrKlm, IntCount].HorizontalAlignment:=taCenter;
    if IntTotalAllSub>0 then begin
      //cari error
      StrGrid.Cells[Days+6+IntGsrKlm, IntCount]:=IntToStr(Round(IntTotalAllSub/IntAvgSub))+' %';
    end;


    SetLength(DailyArr,Length(DailyArr)+1);

    (*end tambah*)

  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  ProgressBar.Position:=95;
  if IntTotal>0 then begin
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Total Jalan PerHari';
    for IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(IntUsage[IntCount]);
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+IntUsage[IntCount];//pram
    end;
    StrGrid.Cells[Days+3+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+3+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    StrBulan:=IntToStr(Bulan.ItemIndex+1);
    for IntCount:=0 to Days+6+IntGsrKlm do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Perbaikan PerHari';
    For IntCount:=1 to Days do begin
      if ((IntRepair[IntCount]) <= 0) then
      begin
        StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:='0';
      end
      else begin
         StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(IntRepair[IntCount]);
      end;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].Font.Color:=clBlack;

      StrTgl:= Tahun.Text+'/'+StrBulan+'/'+IntToStr(IntCount);
      if (Seat.Text<>'All') AND (Batch.Text<>'All') AND (FullName='Irvan Ruswanto') then
      begin
        Qry3:=TADOQuery.Create(Self);
        Qry3.Connection:=Main.MyConnection;
        Qry3.CommandTimeout := 3600;
        if Main.OpenDb then begin
          StrQry3:='select id from wh_dashboard_persentase_day where company_id='+CompanyId+' and '+
                   'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+' and seat='+Seat.Text+' and date='+QuotedStr(StrTgl);
          Qry3.SQL.Clear;
          Qry3.Close;
          Qry3.SQL.Add(StrQry3);
          Qry3.Open;
          recordcount:= Qry3.RecordCount;
          if Qry3.RecordCount>0 then
            StrQry3:='UPDATE wh_dashboard_persentase_day SET date='+QuotedStr(StrTgl)+',company_id='+CompanyId+','+
                      'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+',seat='+Seat.Text+','+
                      'tot_perbaikan='+IntToStr(IntRepair[IntCount])+',created_date=GETDATE() '+
                      'WHERE company_id='+CompanyId+' and '+
                      'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+' and seat='+Seat.Text+' and date='+QuotedStr(StrTgl)
          else
            StrQry3:='INSERT INTO wh_dashboard_persentase_day (date,company_id,vhc_batch_id,seat,tot_perbaikan,created_date)'+
                    'VALUES ('+QuotedStr(StrTgl)+','+CompanyId+','+BatchArr[Batch.ItemIndex][0]+','+Seat.Text+','+IntToStr(IntRepair[IntCount])+',GETDATE())';
          Qry3.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry3,4);
          Qry3.SQL.Add(StrQry3);
          try
            Qry3.ExecSQL;
            except on E:Exception do begin
                Main.WriteLog('Tidak dapat menyimpan nilai utilisasi-Bus Running Days Mini');
                MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Bus Running Days Mini',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
          end;
        end;
        FreeAndNil(Qry3);
        Main.CloseDb;
      end;
      //Application.ProcessMessages;
    end;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6+IntGsrKlm do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Total Tersedia PerHari';
    For IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]);
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]);
    end;
    StrGrid.Cells[Days+5,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+5,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    IntAvg:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Persen Jalan PerHari (%)';
    For IntCount:=1 to Days do begin
      //Application.ProcessMessages;
      if IntUsage[IntCount]>0 then StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))
      else StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:='0';
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].Font.Color:=clBlack;
      if IntUsage[IntCount]>0 then begin
        IntTotalAll:=IntTotalAll+Round((IntUsage[IntCount]/IntTotal)*100);
      end;
      Inc(IntAvg)
    end;
    StrBulan:=IntToStr(Bulan.ItemIndex+1);

    if IntTotalAll>0 then StrGrid.Cells[Days+6+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(Round(IntTotalAll/IntAvg))+' %'

    else StrGrid.Cells[Days+6+IntGsrKlm,StrGrid.RowCount-1]:='0 %';
    StrGrid.CellStyle[Days+6+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    IntAvg:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6+IntGsrKlm do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Persen Utilisasi PerHari (%)';
    For IntCount:=1 to Days do begin
      IntPersenUtilisasiHari:=0;
      StrTgl:= Tahun.Text+'/'+StrBulan+'/'+IntToStr(IntCount);

      if (IntUsage[IntCount]>0) then
      IntPersenUtilisasiHari:=Round((IntUsage[IntCount]/(IntTotal-IntRepair[IntCount]))*100);
     // StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/(IntTotal-IntRepair[IntCount]))*100))
    //  else

      StrGrid.Cells[IntCount+2+IntGsrKlm,StrGrid.RowCount-1]:=IntToStr(IntPersenUtilisasiHari);

      if (Seat.Text<>'All') AND (Batch.Text<>'All') AND (FullName='Irvan Ruswanto') then
      begin
        Qry3:=TADOQuery.Create(Self);
        Qry3.Connection:=Main.MyConnection;
        Qry3.CommandTimeout := 3600;
        if Main.OpenDb then begin
          StrQry3:='select id from wh_dashboard_persentase_day where company_id='+CompanyId+' and '+
                   'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+' and seat='+Seat.Text+' and date='+QuotedStr(StrTgl);
          Qry3.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry3,2);
          Qry3.SQL.Add(StrQry3);
          Qry3.Open;
          if Qry3.RecordCount>0 then
            StrQry3:='UPDATE wh_dashboard_persentase_day SET date='+QuotedStr(StrTgl)+',company_id='+CompanyId+','+
                      'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+',seat='+Seat.Text+','+
                      'persentase_jalan='+IntToStr(IntPersenUtilisasiHari)+',created_date=GETDATE() '+
                      'WHERE company_id='+CompanyId+' and '+
                      'vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+' and seat='+Seat.Text+' and date='+QuotedStr(StrTgl)
          else
            StrQry3:='INSERT INTO wh_dashboard_persentase_day (date,company_id,vhc_batch_id,seat,persentase_jalan,created_date)'+
                    'VALUES ('+QuotedStr(StrTgl)+','+CompanyId+','+BatchArr[Batch.ItemIndex][0]+','+Seat.Text+','+IntToStr(IntPersenUtilisasiHari)+',GETDATE())';
          Qry3.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry3,4);
          Qry3.SQL.Add(StrQry3);
          try
            Qry3.ExecSQL;
            except on E:Exception do begin
                Main.WriteLog('Tidak dapat menyimpan nilai utilisasi-Bus Running Days Mini');
                MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Bus Running Days Mini',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
          end;
        end;
        FreeAndNil(Qry3);
        Main.CloseDb;
      end;

      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2+IntGsrKlm,StrGrid.RowCount-1].Font.Color:=clBlack;
      if IntUsage[IntCount]>0 then begin
        IntTotalAll:=IntTotalAll+Round((IntUsage[IntCount]/(IntTotal-IntRepair[IntCount]))*100);
      end;
      Inc(IntAvg)
    end;
    if IntTotalAll>0 then begin
      StrGrid.Cells[Days+6,StrGrid.RowCount-1]:=IntToStr(Round(IntTotalAll/IntAvg))+' %';
      PersenUtilisasi:=IntToStr(Round(IntTotalAll/IntAvg))+' %';

    end else begin
      StrGrid.Cells[Days+6,StrGrid.RowCount-1]:='0 %';
      PersenUtilisasi:='0 %';
    end;
    StrGrid.CellStyle[Days+6,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end; (*end if Total*)

  if StrGrid.RowCount>= 18 then StrGrid.TopRow:= StrGrid.RowCount-18;
  if Batch.Text='All' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('persen_utilisasi')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+')AND(year='+Tahun.Text+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then
        StrQry:='UPDATE wh_dashboard SET value='+QuotedStr(PersenUtilisasi)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE (name='+QuotedStr('persen_utilisasi')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+') AND (year='+Tahun.Text+');'
      else
        StrQry:='INSERT INTO wh_dashboard (name,company_id,location_id,month,year,value,update_user)'+
                'VALUES ('+QuotedStr('persen_utilisasi')+','+CompanyId+','+LocationId+','+IntToStr(Bulan.ItemIndex+1)+','+Tahun.Text+
                ','+QuotedStr(PersenUtilisasi)+','+QuotedStr(User)+')';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        except on E:Exception do begin
            Main.WriteLog('Tidak dapat menyimpan nilai utilisasi-Bus Running Days Mini');
            MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Bus Running Days Mini',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          end;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  ProgressBar.Visible:=False;
  Main.M_Normal;
  //Showmessage('Proses Selesai');
end;

{
procedure TBusRunningDaysminiRpt.RefreshData;
var StrQry,QAddParam,AkhirBulan,AwalBulan,StrBodyId,StrLicensePlate,StrCompanyId,StrLocationId,StrSeat,StrBatchId,StrCategorized,StrBatchName,StrIsFacelift,StrBatchName2,StrCompact,StrTanggal,StrSimple:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3,IntCount4,IntCountA,IntCountVhc, IntCountVhc2, IntTotal,IntBroken,IntRunning,IntTotalAll,IntAvg:Integer;
    IntUsage,IntRepair,IntCategory,IntTotalBatch,IntUsageBatch,IntRepairBatch,IntTotalSewaLuar:Array[1..31] of Integer;
    IntRowDel:Array[1..300] of byte;
    StrList:TStringList;
    PersenUtilisasi:String;
    IsMatch:Boolean;
begin
  Main.M_Busy;
  ProgressBar.Visible:=True;
  SetLength(DailyArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;
  QAddParam:='';
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=Days+7;
  for IntCount:=1 to Days do begin
//    StrGrid.Cells[IntCount+3,0]:=LongDayNames[DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))]+' / '+IntToStr(IntCount);
    StrGrid.ColWidths[IntCount+2]:=IntColumnWidth;
    StrGrid.Cells[IntCount+2,0]:=IntToStr(IntCount);
    if DayOfWeek(VarToDateTime(IntToStr(IntCount)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[IntCount+2,0].BGColor:=clRed
    else
      StrGrid.CellStyle[IntCount+2,0].BGColor:=clBtnFace;
  end;
  for IntCount:=3 to StrGrid.ColCount-1 do
    for IntCount2:=1 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;

  if isSimple.Checked then StrSimple:='1' else StrSimple:='0';
  
  StrGrid.Cells[Days+3,0]:='Total Jalan';
  StrGrid.Cells[Days+4,0]:='Total Perbaikan';
  StrGrid.Cells[Days+5,0]:='Total Tersedia';
  StrGrid.Cells[Days+6,0]:='Persen Utilisasi';
  StrGrid.ColWidths[Days+3]:=45;
  StrGrid.ColWidths[Days+4]:=50;
  StrGrid.ColWidths[Days+5]:=45;
  StrGrid.ColWidths[Days+6]:=45;
  StrGrid.CellStyle[Days+3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[Days+3,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+4,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+5,0].BGColor:=clBtnFace;
  StrGrid.CellStyle[Days+6,0].BGColor:=clBtnFace;
  For IntCount:=1 to 31 do IntUsage[IntCount]:=0;
  For IntCount:=1 to 31 do IntRepair[IntCount]:=0;
  for IntCount:=1 to 31 do IntCategory[IntCount]:=0;
  for IntCount:=1 to 31 do IntTotalBatch[IntCount]:=0;
  for IntCount:=1 to 31 do IntUsageBatch[IntCount]:=0;
  for IntCount:=1 to 31 do IntRepairBatch[IntCount]:=0;
  for IntCount:=1 to 31 do IntTotalSewaLuar[IntCount]:=0;

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
    if Categorized.Checked then StrCategorized:=',@OrderBy='+QuotedStr('h.vhc_batch_id,seat')+',@ShowBatch=1'
    else StrCategorized:='';

    For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
      for IntCountVhc2:=0 to 12 do
      StrGrid.Cells[IntCountVhc2,IntCountVhc+1]:='';
    end;
    SetLength(VehicleArr,0);
    StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime(AwalBulan)));

    StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+StrCategorized+StrTanggal+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCountVhc:=0;

    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
        SetLength(VehicleArr,IntCountVhc+1);
        VehicleArr[IntCountVhc][0]:=Qry.FieldValues['vehicle_id'];
        VehicleArr[IntCountVhc][1]:=Qry.FieldValues['batch_name'];
        VehicleArr[IntCountVhc][2]:=IntToStr(Qry.FieldValues['seat']);
        VehicleArr[IntCountVhc][3]:=VarToStr(Qry.FieldValues['name']);
        VehicleArr[IntCountVhc][4]:=Qry.FieldValues['body_id'];
        VehicleArr[IntCountVhc][5]:=Qry.FieldValues['license_plate'];
        VehicleArr[IntCountVhc][6]:=Qry.FieldValues['is_facelift'];
        VehicleArr[IntCountVhc][7]:=Qry.FieldValues['category'];
        Qry.Next;
        Inc(IntCountVhc);
    end;
    Qry.Close;

    IntCount:=1;
    IntCount4:=1;
    (* CEK *)
    //if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    if Batch.Text='All' then
      if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+2+(Batch.Items.Count-3) else StrGrid.RowCount:=2
    else
      if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+2 else StrGrid.RowCount:=2;

    StrGrid.HandleNeeded;
    for IntCount2:=0 to Length(VehicleArr)-1 do begin
      for IntCount3:=0 to Days+4 do StrGrid.Cells[3+IntCount3,IntCount2+1]:='';
    end;
    IntTotal:=Length(VehicleArr);//Qry.RecordCount;
    StrBatchName:='';
    StrBatchName2:='';
    ProgressBar.Position:=10;
    IntCountA:=0;
    for IntCount3:=1 to high(IntRowDel) do IntRowDel[IntCount3]:=0;

    (*ProsesRD*)
    //if (Qry.RecordCount>0) then while Not(Qry.Eof) do begin
    For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
      ProgressBar.Position:=10+Round((90/Length(VehicleArr))*IntCount4);
      Application.ProcessMessages;
      SetLength(DailyArr,Length(DailyArr)+1);
      Inc(IntCountA);

      if Categorized.Checked then begin
        if StrBatchName<>VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2] then begin
          if StrBatchName<>'' then begin
            StrGrid.RowCount:=StrGrid.RowCount+1;
            for IntCount2:=3 to Days+2 do begin
              StrGrid.Cells[IntCount2,IntCount]:='';
              StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
            end;
            StrGrid.CellStyle[2,IntCount].BGColor:=clSilver;
            for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2,IntCount]:=IntToStr(IntCategory[IntCount2]);
            for IntCount2:=1 to Days do IntCategory[IntCount2]:=0;
            IntRowDel[IntCountA]:=IntCount; //GetRowCount
            SetLength(DailyArr,Length(DailyArr)+1);
            Inc(IntCount);
//Pram
            if StrBatchName2<>VehicleArr[IntCountVhc][1] Then Begin
              if Batch.Text='All' then begin
                for IntCount2:=3 to Days+2 do begin
                  StrGrid.Cells[IntCount2,IntCount]:='';
                  StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
                end;
                for IntCount2:=0 to Days+3 do begin
                  StrGrid.Cells[IntCount2,IntCount]:='';
                  StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
                end;
                StrGrid.Cells[2, IntCount]:=' Persen Utilisasi (Batch) PerHari (%)';
                For IntCount2:=1 to Days do begin
                  try
                      StrGrid.Cells[IntCount2+2,IntCount]:= IntToStr(Round((IntUsageBatch[IntCount2]/(IntTotalBatch[IntCount2]-IntRepairBatch[IntCount2]))*100));
                                                        //IntToStr(IntUsageBatch[IntCount2])+'|'+IntToStr(IntRepairBatch[IntCount2])+'|'+IntToStr(IntTotalBatch[IntCount2]);
                    except
                      on E:Exception Do begin
                        StrGrid.Cells[IntCount2+2,IntCount]:= IntToStr(Round(((IntUsageBatch[IntCount2]+IntRepairBatch[IntCount2])/IntTotalBatch[IntCount2])*100));
                      end;
                  End;
                end;
              end;
              Inc(IntCount);
              for IntCount2:=1 to Days do IntTotalBatch[IntCount2]:=0;
              for IntCount2:=1 to Days do IntUsageBatch[IntCount2]:=0;
              for IntCount2:=1 to Days do IntRepairBatch[IntCount2]:=0;
            end;
//End Pram
          end;
          StrBatchName:=VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2];
          StrBatchName2:=VehicleArr[IntCountVhc][1];

          for IntCount2:=0 to Days+3 do begin
            StrGrid.Cells[IntCount2,IntCount]:='';
            StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
            //Application.ProcessMessages;
          end;
          StrGrid.RowCount:=StrGrid.RowCount+1;
          StrGrid.CellStyle[2,IntCount].BGColor:=clSkyBlue;
          StrGrid.CellStyle[2,IntCount].Font.Color:=clWindowText;
          StrGrid.CellStyle[2,IntCount].Font.Style:=[fsBold];
          StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[3,IntCount].BGColor:=clSkyBlue;
          StrGrid.MergeCells.AddRectXY(3,IntCount,Days+6,IntCount);
          StrGrid.Cells[2,IntCount]:=StrBatchName;
          IntRowDel[IntCountA]:=IntCount; //GetRowCount
          Inc(IntCount);
          SetLength(DailyArr,Length(DailyArr)+1);
        end;
      end;

      for IntCount2:=1 to Days do Inc(IntTotalBatch[IntCount2]);

      StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
      StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
      StrGrid.Cells[0,IntCount]:=IntToStr(IntCount4);
      StrGrid.RowHeights[IntCount]:=20;
      StrLicensePlate:=LicensePlate(VehicleArr[IntCountVhc][5]);
      if (VehicleArr[IntCountVhc][6]='1') then StrIsFacelift:='*' else StrIsFacelift:='';
      StrGrid.Cells[1,IntCount]:=StrLicensePlate+StrIsFacelift;

      if VehicleArr[IntCountVhc][3]<>NULL then  StrGrid.Cells[2,IntCount]:=VehicleArr[IntCountVhc][3] else StrGrid.Cells[2,IntCount]:='';
      for IntCount2:=1 to Days do begin
        StrGrid.Cells[IntCount2+2,IntCount]:='';
        StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clWindowText;
        StrGrid.CellStyle[IntCount2+2,IntCount].Font.Style:=[];
        StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGreen;
        //Application.ProcessMessages;
      end;

      IntRunning:=0;
      IntBroken:=0;
      StrQry:='EXEC GetRunningDaysDetail '+QuotedStr(VehicleArr[IntCountVhc][0])+',@FromDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+',@ToDate='+
            QuotedStr(FormatDateTime('yyyy-mm-dd',IncDay(IncMonth(VarToDateTime(AwalBulan)),-1)))+';';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;

      If VehicleArr[IntCountVhc][7]='4' then begin
        for IntCount:=1 to 31 do Inc(IntTotalSewaLuar[IntCount]);
      end;

      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        //Application.ProcessMessages; //detail
        for IntCount2:=Qry2.FieldValues['from_date'] to Qry2.FieldValues['to_date'] do begin



          if DailyArr[Length(DailyArr)-1][IntCount2-1]<>'' then begin
            IsMatch:=False;
            StrList:=TStringList.Create;
            StrList:=SplitStrings(DailyArr[Length(DailyArr)-1][IntCount2-1],'  ');
          end;
          if Qry2.FieldValues['customer_order_id']<>NULL then
            if DailyArr[Length(DailyArr)-1][IntCount2-1]='' then
              DailyArr[Length(DailyArr)-1][IntCount2-1]:=Qry2.FieldValues['customer_order_id']
            else
              DailyArr[Length(DailyArr)-1][IntCount2-1]:=DailyArr[Length(DailyArr)-1][IntCount2-1]+'  '+Qry2.FieldValues['customer_order_id'];
          if Trim(StrGrid.Cells[IntCount2+2,IntCount])='' then begin
            if Qry2.FieldValues['out_type']='0' then begin
              StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clPurple;
              StrGrid.Cells[IntCount2+2,IntCount]:=' @';
              StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
              Inc(IntCategory[IntCount2]);
              Inc(IntUsageBatch[IntCount2]);
            end else if Qry2.FieldValues['out_type']='1' then begin
              if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clGreen
              else
                StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clBlue;
              StrGrid.Cells[IntCount2+2,IntCount]:=' @';
              StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
              Inc(IntUsage[IntCount2]);
              Inc(IntRunning);
              Inc(IntCategory[IntCount2]);
              Inc(IntUsageBatch[IntCount2]);
            end else if Qry2.FieldValues['out_type']='2' then begin
              StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clRed;
              StrGrid.Cells[IntCount2+2,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
              Inc(IntRepairBatch[IntCount2])
            end else if Qry2.FieldValues['out_type']='3' then begin
              StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clRed;
              StrGrid.Cells[IntCount2+2,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);
              Inc(IntBroken);
              Inc(IntRepairBatch[IntCount2]);
            end else if Qry2.FieldValues['out_type']='4' then begin
              StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clYellow;
              StrGrid.Cells[IntCount2+2,IntCount]:=' X';
              StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              Inc(IntRepair[IntCount2]);//pram
              if (IsSBasPKB) Then begin
                Inc(IntRepair[IntCount2]);
                Inc(IntBroken);
                Inc(IntRepairBatch[IntCount2]);
              end;
            end;
          end else begin
            if Qry2.FieldValues['out_type']='0' then begin
              if (StrGrid.Cells[IntCount2+2,IntCount]=' @') or (StrGrid.Cells[IntCount2+2,IntCount]='@2') then begin
//                StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clPurple;
                StrGrid.Cells[IntCount2+2,IntCount]:='@2';
                StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
                if StrGrid.CellStyle[IntCount2+2,IntCount].BGColor<>clRed then
                  StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
              end else if (StrGrid.Cells[IntCount2+2,IntCount]=' X') then begin
                StrGrid.Cells[IntCount2+2,IntCount]:=' @';
                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
                StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              end;
            end else if Qry2.FieldValues['out_type']='1' then begin
              if (StrGrid.Cells[IntCount2+2,IntCount]=' @') or (StrGrid.Cells[IntCount2+2,IntCount]='@2') then begin
               if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2,IntCount]:='@2';
                StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
                if StrGrid.CellStyle[IntCount2+2,IntCount].BGColor<>clRed then
                  StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
              end else if (StrGrid.Cells[IntCount2+2,IntCount]=' X') then begin
               if Qry2.FieldValues['total']<=Qry2.FieldValues['total_payment'] then
                  StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clGreen
                else
                  StrGrid.CellStyle[IntCount2+2,IntCount].Font.Color:=clBlue;
                StrGrid.Cells[IntCount2+2,IntCount]:='@';
                StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clWindow;
                Inc(IntUsage[IntCount2]);
                Inc(IntCategory[IntCount2]); // pram ubah .
                Inc(IntRunning);
                Inc(IntUsageBatch[IntCount2]);

                Dec(IntRepair[IntCount2]);
                Dec(IntRepairBatch[IntCount2]);
                Dec(IntBroken);
                //StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clGray;
                //StrGrid.Cells[IntCount2+2,IntCount]:=' @';
                //StrGrid.CellStyle[IntCount2+2,IntCount].HorizontalAlignment:=taCenter;
              end;
            end else if Qry2.FieldValues['out_type']='3' then begin
              if (StrGrid.Cells[IntCount2+2,IntCount]=' @') or (StrGrid.Cells[IntCount2+2,IntCount]='@2') then begin
//                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clRed;
              end else
                StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clRed;
            end else if Qry2.FieldValues['out_type']='4' then begin
              if (StrGrid.Cells[IntCount2+2,IntCount]=' @') or (StrGrid.Cells[IntCount2+2,IntCount]='@2') then begin
                  StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clYellow;
              end else
                  StrGrid.CellStyle[IntCount2+2,IntCount].BGColor:=clYellow;
            end;
          end;
        end;

        if (StrSimple='0') then StrGrid.RowHeights[IntCount]:=20
        else begin
          IntRowDel[IntCountA]:=IntCount;
          //StrGrid.RowHeights[IntCount]:=0;
        end;
                
        Qry2.Next;
      end;

      StrGrid.Cells[Days+3,IntCount]:=IntToStr(IntRunning);
      StrGrid.Cells[Days+4,IntCount]:=IntToStr(IntBroken);
      StrGrid.Cells[Days+5,IntCount]:=IntToStr(Days-IntRunning-IntBroken);
      StrGrid.Cells[Days+6,IntCount]:=IntToStr(Round((IntRunning/Days)*100))+' %';
      StrGrid.CellStyle[Days+3,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+4,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+5,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+6,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[Days+3,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+4,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+5,IntCount].Font.Color:=clBlack;
      StrGrid.CellStyle[Days+6,IntCount].Font.Color:=clBlack;
      Qry2.Close;
      Inc(IntCount);
      Inc(IntCount4);
      If (IntCountVhc-1) >= 21 then//If Qry.RecNo >= 21 then
        StrGrid.TopRow:= IntCountVhc-20;//Qry.RecNo-20;
      //Qry.Next;
    end; (* end for *)
    //Qry.Close;
    
    StrGrid.RowCount:=StrGrid.RowCount+1;
    for IntCount2:=3 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    StrGrid.CellStyle[2,IntCount].BGColor:=clSilver;
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2,IntCount]:=IntToStr(IntCategory[IntCount2]); //Cek Inih
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ProgressBar.Position:=95;
  if IntTotal>0 then begin
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Total Jalan PerHari';
    for IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:=IntToStr(IntUsage[IntCount]);
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+IntUsage[IntCount];//pram
    end;
    StrGrid.Cells[Days+3,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Perbaikan PerHari';
    For IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:=IntToStr(IntRepair[IntCount]);
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].Font.Color:=clBlack;
      //Application.ProcessMessages;
    end;
    IntTotalAll:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Total Tersedia PerHari';
    For IntCount:=1 to Days do begin
      StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:=IntToStr(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]-IntTotalSewaLuar[IntCount])+'|'+IntToStr(IntTotalSewaLuar[IntCount]);
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].Font.Color:=clBlack;
      IntTotalAll:=IntTotalAll+(IntTotal-IntUsage[IntCount]-IntRepair[IntCount]-IntTotalSewaLuar[IntCount]);
    end;
    StrGrid.Cells[Days+5,StrGrid.RowCount-1]:=IntToStr(IntTotalAll);
    StrGrid.CellStyle[Days+5,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    IntAvg:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Persen Jalan PerHari (%)';
    For IntCount:=1 to Days do begin
      //Application.ProcessMessages;
      if IntUsage[IntCount]>0 then StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))
      else StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:='0';
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].Font.Color:=clBlack;
      if IntUsage[IntCount]>0 then begin
        IntTotalAll:=IntTotalAll+Round((IntUsage[IntCount]/IntTotal)*100);
      end;
      Inc(IntAvg)
    end;
    if IntTotalAll>0 then StrGrid.Cells[Days+6,StrGrid.RowCount-1]:=IntToStr(Round(IntTotalAll/IntAvg))+' %'
    else StrGrid.Cells[Days+6,StrGrid.RowCount-1]:='0 %';
    StrGrid.CellStyle[Days+6,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    IntTotalAll:=0;
    IntAvg:=0;
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.RowHeights[StrGrid.RowCount-1]:=20;
    for IntCount:=0 to Days+6 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    StrGrid.Cells[2,StrGrid.RowCount-1]:=' Persen Utilisasi PerHari (%)';
    For IntCount:=1 to Days do begin
      if IntUsage[IntCount]>0 then StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:=IntToStr(Round((IntUsage[IntCount]/(IntTotal-IntRepair[IntCount]))*100))
      else StrGrid.Cells[IntCount+2,StrGrid.RowCount-1]:='0';
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[IntCount+2,StrGrid.RowCount-1].Font.Color:=clBlack;
      if IntUsage[IntCount]>0 then begin
        IntTotalAll:=IntTotalAll+Round((IntUsage[IntCount]/(IntTotal-IntRepair[IntCount]))*100);
      end;
      Inc(IntAvg)
    end;
    if IntTotalAll>0 then begin
      StrGrid.Cells[Days+6,StrGrid.RowCount-1]:=IntToStr(Round(IntTotalAll/IntAvg))+' %';
      PersenUtilisasi:=IntToStr(Round(IntTotalAll/IntAvg))+' %';
    end else begin
      StrGrid.Cells[Days+6,StrGrid.RowCount-1]:='0 %';
      PersenUtilisasi:='0 %';
    end;
    StrGrid.CellStyle[Days+6,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
  end; (*end if Total*)

  if StrGrid.RowCount>= 20 then StrGrid.TopRow:= StrGrid.RowCount-20;
  //CEk
  if isSimple.Checked then begin
    for IntCount3:=high(IntRowDel) downto 1 do begin
      if IntRowDel[IntCount3]>0 then  begin
        StrGrid.DeleteRow(IntRowDel[IntCount3]);
      end;
    end;
  end;
    
  if Batch.Text='All' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('persen_utilisasi')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+')AND(year='+Tahun.Text+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then
        StrQry:='UPDATE wh_dashboard SET value='+QuotedStr(PersenUtilisasi)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE (name='+QuotedStr('persen_utilisasi')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+IntToStr(Bulan.ItemIndex+1)+') AND (year='+Tahun.Text+');'
      else
        StrQry:='INSERT INTO wh_dashboard (name,company_id,location_id,month,year,value,update_user)'+
                'VALUES ('+QuotedStr('persen_utilisasi')+','+CompanyId+','+LocationId+','+IntToStr(Bulan.ItemIndex+1)+','+Tahun.Text+
                ','+QuotedStr(PersenUtilisasi)+','+QuotedStr(User)+')';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        except on E:Exception do begin
            Main.WriteLog('Tidak dapat menyimpan nilai utilisasi-Bus Running Days Mini');
            MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Bus Running Days Mini',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          end;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  ProgressBar.Visible:=False;
  Main.M_Normal;
  //Showmessage('Proses Selesai');  
end;
}

procedure TBusRunningDaysminiRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBusRunningDaysminiRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBusRunningDaysminiRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TBusRunningDaysminiRpt.LihatDataClick(Sender: TObject);
begin
  RefreshGrid;
  InitGrid;
  RefreshData;
end;

procedure TBusRunningDaysminiRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid,'RD '+Bulan.Text+'-'+Tahun.Text) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TBusRunningDaysminiRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TBusRunningDaysminiRpt.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
    if not(IsInput) then begin
      if (Main.IsFormOpen('OrderForm')=False) and (DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]<>'')then
        if StrPos(PChar(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]),PChar('  '))=nil then begin
          //ShowMessage(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]);
          if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],2)='CO') OR (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],2)='WL') then
            OrderForm:=TOrderForm.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],False)
          else if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],3)='MSR') then begin
            if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],'',False);
          end else if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],3)='PKB') then begin
            if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],True);
          end else if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],3)='BLC') then begin
            if Main.IsFormOpen('BlockUnitForm')=False then BlockUnitForm:=TBlockUnitForm.Create(nil,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],True);
          end
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

procedure TBusRunningDaysminiRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshSeat;
  Initiation:=False;
end;

procedure TBusRunningDaysminiRpt.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TBusRunningDaysminiRpt.SBUChange(Sender: TObject);
var StrQry:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  if Main.OpenDb then begin
//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
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
  Main.CloseDb;
  FreeAndNil(Qry);
  Batch.Items.Clear;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  {
  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  }
  RefreshGrid;
  InitGrid;
    
  Main.M_Normal;
end;

end.
