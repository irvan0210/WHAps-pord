unit WorkOrderRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons,
  ComCtrls;

type
  TWorkOrderRpt = class(TForm)
    Selesai: TButton;
    Label3: TLabel;
    Lihat: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    ToXCel: TSpeedButton;
    TombolCari: TSpeedButton;
    Label2: TLabel;
    Tanggal: TDateTimePicker;
    Status: TComboBox;
    Label4: TLabel;
    ToDates: TCheckBox;
    TanggalSampai: TDateTimePicker;
    lbl1: TLabel;
    edtnopol: TEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure ToDatesClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TanggalSampaiChange(Sender: TObject);
  private
    FormRequest,FormFunction:String;
    StatusArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString14;
    IntRow, IntCol:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshGrid2;
    procedure Search;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');Overload;
    { Public declarations }
  end;

var
  WorkOrderRpt: TWorkOrderRpt;

implementation

uses MainU, GoodAssignmentU, ServiceRequestFormU, WorkOrderFormU, StrUtils,
  WorkOrderFormInU, OrderFormU, AuthorizedFormU, SPJFormBusU, OrderFeeU,
  MaintenanceServiceFormU;

{$R *.dfm}

constructor TWorkOrderRpt.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Initiation:=True;
  Inherited Create(AOwner);
end;

procedure TWorkOrderRpt.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Tanggal.Date:=Now();
  TanggalSampai.Date:=Now();
  ToDates.Checked:=False;
  TanggalSampai.Enabled:=False;
  //IntRow:=0;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TWorkOrderRpt.InitGrid;
 var IntCount : Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=12;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=90;
  StrGrid.ColWidths[2]:=90;
  StrGrid.ColWidths[3]:=105;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=110;
  StrGrid.ColWidths[6]:=150;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=90;
  StrGrid.ColWidths[9]:=400;
  StrGrid.ColWidths[10]:=250;
  StrGrid.ColWidths[11]:=150;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,5,0);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
 // StrGrid.MergeCells.AddRectXY(12,0,12,1);
  //StrGrid.MergeCells.AddRectXY(13,0,13,1);
  //StrGrid.Cells[0,0]:='No';
 // StrGrid.Cells[0,0]:='Pool';
  StrGrid.Cells[1,0]:='No PKB';
  StrGrid.Cells[2,0]:='No SR';
  StrGrid.Cells[3,0]:='No SB';
  StrGrid.Cells[4,0]:='Tanggal';
  StrGrid.Cells[6,0]:='No Bodi/No Polisi';
  StrGrid.Cells[7,0]:='KM Odo';
  StrGrid.Cells[8,0]:='Jenis Pekerjaan';
  StrGrid.Cells[9,0]:='Detail Permintaan/Keluhan';
  StrGrid.Cells[10,0]:='Pekerjaan';
  StrGrid.Cells[11,0]:='Spare Part';
  StrGrid.Cells[4,1]:='Masuk';
  StrGrid.Cells[5,1]:='Selesai';
  //StrGrid.Cells[12,0]:='No Polisi';
  //StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  //StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    //StrGrid.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderRpt.RefreshCombo;
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
  SetLength(StatusArr,3);
  StatusArr[0][0]:='9';
  StatusArr[0][1]:='Semua';
  StatusArr[1][0]:='2';
  StatusArr[1][1]:='Selesai';
  StatusArr[2][0]:='1';
  StatusArr[2][1]:='Perbaikan';
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(StatusArr)-1 do
    Status.Items.Add(StatusArr[IntCount][1]);
  Status.ItemIndex:=Status.Items.IndexOf('Semua');
  Main.M_Normal;
end;

procedure TWorkOrderRpt.RefreshData;
var Qry, Qry2:TADOQuery;
    StrQry,StrQry2,AwalBulan,StrCompanyId,StrLocationId,STrTanggal,StrStatus,StrToDates:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    //SetLength(WorkOrderArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    if Status.Text<>'Semua' then StrStatus:=',@Status='+StatusArr[Status.ItemIndex][0] else StrStatus:='';
    if ToDates.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.date)) else StrToDates:='';
    StrQry:='EXEC GetWorkOrderLists '+StrCompanyId+','+StrLocationId+StrTanggal+StrToDates+StrStatus+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(WorkOrderArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(WorkOrderArr,IntCount+1);
      WorkOrderArr[IntCount][0]:=Qry.FieldValues['location'];
      WorkOrderArr[IntCount][1]:=Qry.FieldValues['work_order_id'];
      if (Qry.FieldValues['service_request_id']<>NULL) then WorkOrderArr[IntCount][2]:=Qry.FieldValues['service_request_id']
      else WorkOrderArr[IntCount][2]:='';
      if (Qry.FieldValues['maintenance_service_id']<>NULL) then WorkOrderArr[IntCount][3]:=Qry.FieldValues['maintenance_service_id']
      else WorkOrderArr[IntCount][3]:='';
      WorkOrderArr[IntCount][4]:=Qry.FieldValues['date_in'];
//      if Qry.FieldValues['time_out']<>NULL then WorkOrderArr[IntCount][5]:=Qry.FieldValues['date_out']+' '+Qry.FieldValues['time_out']
//      else WorkOrderArr[IntCount][5]:='';

      WorkOrderArr[IntCount][5]:=Qry.FieldValues['date_out'];
      WorkOrderArr[IntCount][6]:=Qry.FieldValues['body_id']+' / '+LicensePlate(Qry.FieldValues['license_plate']);
      WorkOrderArr[IntCount][7]:=Qry.FieldValues['odo_in'];
      WorkOrderArr[IntCount][8]:=Qry.FieldValues['job_inout']+'-';
      if Qry.FieldValues['general_repair']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][7]+'General,';
      if Qry.FieldValues['body_repair']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][8]+'Body,' ;
      if Qry.FieldValues['insurance']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][8]+'Insurance';
      WorkOrderArr[IntCount][9]:=Qry.FieldValues['description_resume'];
      WorkOrderArr[IntCount][10]:=Qry.FieldValues['work_resume'];
      WorkOrderArr[IntCount][11]:=Qry.FieldValues['part_name'];
      //WorkOrderArr[IntCount][12]:=Qry.FieldValues['time_out'];
      if Qry.FieldValues['time_out']<>NULL then
        WorkOrderArr[IntCount][12]:=Qry.FieldValues['time_out']
      else WorkOrderArr[IntCount][12]:='';
      WorkOrderArr[IntCount][13] := Qry.FieldValues['description_id'];

      Inc(IntCount);
      Qry.Next;

    {  StrQry :='EXEc GetWorkOrderDetail @WorkOrderId='+QuotedStr(Qry.FieldValues['work_order_id'])+',@DescriptionId=1; ';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2 > 0 then begin
          Inc(IntCount);
          SetLength(WorkOrderArr,IntCount+1);
          WorkOrderArr[IntCount][0]:=Qry.FieldValues['location'];
          WorkOrderArr[IntCount][1]:=Qry.FieldValues['work_order_id'];
          if (Qry.FieldValues['service_request_id']<>NULL) then WorkOrderArr[IntCount][2]:=Qry.FieldValues['service_request_id']
          else WorkOrderArr[IntCount][2]:='';
          if (Qry.FieldValues['maintenance_service_id']<>NULL) then WorkOrderArr[IntCount][3]:=Qry.FieldValues['maintenance_service_id']
          else WorkOrderArr[IntCount][3]:='';
          WorkOrderArr[IntCount][4]:=Qry.FieldValues['date_in'];
    //      if Qry.FieldValues['time_out']<>NULL then WorkOrderArr[IntCount][5]:=Qry.FieldValues['date_out']+' '+Qry.FieldValues['time_out']
    //      else WorkOrderArr[IntCount][5]:='';

          WorkOrderArr[IntCount][5]:=Qry.FieldValues['date_out'];
          WorkOrderArr[IntCount][6]:=Qry.FieldValues['body_id']+' / '+LicensePlate(Qry.FieldValues['license_plate']);
          WorkOrderArr[IntCount][7]:=Qry.FieldValues['odo_in'];
          WorkOrderArr[IntCount][8]:=Qry.FieldValues['job_inout']+'-';
          if Qry.FieldValues['general_repair']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][7]+'General,';
          if Qry.FieldValues['body_repair']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][8]+'Body,' ;
          if Qry.FieldValues['insurance']='1' then WorkOrderArr[IntCount][8]:=WorkOrderArr[IntCount][8]+'Insurance';
          WorkOrderArr[IntCount][10]:=Qry.FieldValues['work_resume'];
          WorkOrderArr[IntCount][11]:=Qry.FieldValues['part_name'];
        end;
        WorkOrderArr[IntCount][9]:=Qry2.FieldValues['description'];

       // WorkOrderArr[IntCount][11]:=LicensePlate(Qry.FieldValues['license_plate']);
        //WorkOrderArr[IntCount][12]:=Qry.FieldValues['part_name'];
        if Qry.FieldValues['time_out']<>NULL then
          WorkOrderArr[IntCount][12]:=Qry.FieldValues['time_out']
        else WorkOrderArr[IntCount][12]:='';


        WorkOrderArr[IntCount][13] := Qry.FieldValues['description_id'];

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;


     // Qry2.Close;
      Inc(IntCount);
      Qry.Next; }
    end;

    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderRpt.RefreshGrid;
var
  IntCount,IntCount2,IntStartRow, IntTotal:Integer;
  StrWorkOrderId : string;
  IsDrawRect:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;

   if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+2
    else begin
      StrGrid.RowCount:=3;
    end;

   for IntCount:=0 to StrGrid.ColCount-1 do begin
     StrGrid.Cells[IntCount,2]:='';
      StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
    end;
  IntStartRow:=0;
  StrWorkOrderId:='';
  IntTotal:=0;

  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    if (StrWorkOrderId<>WorkOrderArr[IntCount][1])  then begin
      StrWorkOrderId:=WorkOrderArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=WorkOrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=WorkOrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][6];
      StrGrid.Cells[7,IntCount+2]:=WorkOrderArr[IntCount][7];
      StrGrid.Cells[8,IntCount+2]:=WorkOrderArr[IntCount][8];
      StrGrid.Cells[10,IntCount+2]:=WorkOrderArr[IntCount][10];
      StrGrid.Cells[11,IntCount+2]:=WorkOrderArr[IntCount][11];
      //StrGrid.Cells[12,IntCount+2]:=WorkOrderArr[IntCount][12];
      IsDrawRect:=False;
    end else if (IntCount<Length(WorkOrderArr)-1) then begin
      if (StrWorkOrderId<>WorkOrderArr[IntCount+1][1]) then IsDrawRect:=True;
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
      StrGrid.MergeCells.AddRectXY(8,IntStartRow+2,8,IntCount+2);
      StrGrid.MergeCells.AddRectXY(10,IntStartRow+2,10,IntCount+2);
      StrGrid.MergeCells.AddRectXY(11,IntStartRow+2,11,IntCount+2);
      //StrGrid.MergeCells.AddRectXY(12,IntStartRow+2,12,IntCount+2);
    end;
    StrGrid.Cells[9,IntCount+2]:=WorkOrderArr[IntCount][9];

    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taCenter;

    if WorkOrderArr[IntCount][12]<>'' then
       for IntCount2:=0 to StrGrid.ColCount-1 do
       StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;

    if WorkOrderArr[IntCount][13]= '1' then begin
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.CellStyle[9,IntCount+2].font.Color := clBlue;
    end;

  end;
  // StrGrid.RowCount:=StrGrid.RowCount+1;
end;

procedure TWorkOrderRpt.RefreshGrid2;
var
  IntCount,IntCount2,IntStartRow, IntTotal:Integer;
  StrWorkOrderId : string;
  IsDrawRect:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;

   if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+2
    else begin
      StrGrid.RowCount:=3;
    end;

   for IntCount:=0 to StrGrid.ColCount-1 do begin
     StrGrid.Cells[IntCount,2]:='';
      StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
    end;
  IntStartRow:=0;
  StrWorkOrderId:='';
  IntTotal:=0;

  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
      StrGrid.Cells[0,IntCount+2]:=WorkOrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][4];
      StrGrid.Cells[5,IntCount+2]:=WorkOrderArr[IntCount][5];
      StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][6];
      StrGrid.Cells[7,IntCount+2]:=WorkOrderArr[IntCount][7];
      StrGrid.Cells[8,IntCount+2]:=WorkOrderArr[IntCount][8];
      StrGrid.Cells[9,IntCount+2]:=WorkOrderArr[IntCount][9];
      StrGrid.Cells[10,IntCount+2]:=WorkOrderArr[IntCount][10];
      StrGrid.Cells[11,IntCount+2]:=WorkOrderArr[IntCount][11];

      StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taCenter;

   { if WorkOrderArr[IntCount][12]<>'' then
       for IntCount2:=0 to StrGrid.ColCount-1 do
       StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;

    if WorkOrderArr[IntCount][13]= '1' then begin
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.CellStyle[9,IntCount+2].font.Color := clBlue;
    end; }

  end;
end;


procedure TWorkOrderRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TWorkOrderRpt.StrGridDblClick(Sender: TObject);
begin
  if IntRow>0 then begin
    Case IntCol of
      0,1:if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False);
      2:begin
          if StrGrid.Cells[1,IntRow]<>'' then begin
            if FormRequest='' then begin
              if StrGrid.Cells[6,IntRow]<>'' then begin
                if Main.IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(nil,StrGrid.Cells[2,IntRow],True);
              end else begin
                if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[2,IntRow],True);
              end;
            end
          end;
        end;
      3:if StrGrid.Cells[3,IntRow]<>'' then begin
          if Main.IsFormOpen('ServiceRequestForm')=False then ServiceRequestForm:=TServiceRequestForm.Create(Self, StrGrid.Cells[3,IntRow],'',False);
        end;
      4:if StrGrid.Cells[4,IntRow]<>'' then begin
          if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,StrGrid.Cells[4,IntRow],'',False);
        end;
    end;
  end;

end;

procedure TWorkOrderRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TWorkOrderRpt.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TWorkOrderRpt.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    Cari.Text:='';
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TWorkOrderRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TWorkOrderRpt.Search;
var IntCount,IntCount2,IntCount3,IntCount4,IntMaxCol,IntStartRow, IntTotal:Integer;
    IsTrue, IsDrawRect:Boolean;
    StrWorkOrderId : string;
    Count,Count2,Count3, Count4 : Integer;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 13 do
      if ((StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil )
          OR (StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(edtnopol.Text)))<>nil) )
      then IsTrue:=True;

      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2]:= WorkOrderArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;

 { //if Trim(Cari.Text)<>'' then begin
    InitGrid;
   // IntMaxCol:=13;
    //Main.M_Busy;
    IntCount2:=2;
    for IntCount:=0 to Length(WorkOrderArr)-1 do begin
        IsTrue:=False;
        IntCount3:=0;
        for IntCount4:=0 to 13 do begin
          repeat
            if (trim(edtnopol.Text)<>'') and (Trim(Cari.Text)<>'') then begin
              if ( (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil)
                  AND (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][11])),PChar(UpperCase(edtnopol.Text)))<>nil)  )then IsTrue:=True;
            end else if (trim(edtnopol.Text)<>'') then begin
              if (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][11])),PChar(UpperCase(edtnopol.Text)))<>nil) then IsTrue:=True;
            end else begin
              if (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
            end;
            Inc(IntCount3);
          until (IntCount3>13) or (IsTrue);//(IntCount3>IntMaxCol) or (IsTrue);
        end;

        if IsTrue then begin
          StrGrid.RowCount:=IntCount2+1;
         // StrGrid.Cells[0,IntCount2+1]:=IntToStr(IntCount2);
          for IntCount4:=0 to 13 do
            StrGrid.Cells[IntCount4,IntCount2]:=WorkOrderArr[IntCount][IntCount4];

         // StrGrid.CellStyle[1,IntCount2+1].HorizontalAlignment:=taCenter;
          //if WorkOrderArr[IntCount][5]<>'' then
         // for IntCount4:=0 to 13 do
          // StrGrid.CellStyle[IntCount4,IntCount2].Font.Color:=clGreen;

         // if WorkOrderArr[IntCount][13]= '1' then begin
          // for IntCount4:=0 to IntMaxCol do
          //    StrGrid.CellStyle[9,IntCount2].font.Color := clBlue;
         // end;
          Inc(IntCount2);
        end;

    end;
 // end else begin
 //   RefreshData;
 //   RefreshGrid;
 // end;

 // Main.M_Normal; }
end;


procedure TWorkOrderRpt.TombolCariClick(Sender: TObject);
begin
  Search;
end;

procedure TWorkOrderRpt.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4, IntCount, IntCount2, IntStartRow:Integer;
    IsTrue, IsDrawRect:Boolean;
    StrWorkOrderId : string;
begin
  if Trim(Cari.Text)<>'' then begin
    RefreshGrid2;
    Count2:=2;
    for Count:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
      if ((StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil)
          OR (StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(edtnopol.Text)))<>nil))
      then IsTrue:=True;

      if IsTrue then begin
        StrGrid.RowCount:= Count2+1;
        for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2]:= WorkOrderArr[Count][Count4];
        Inc(Count2);
       // IntStartRow:=0;

        for IntCount:=0 to Length(WorkOrderArr)-1 do begin
          if WorkOrderArr[IntCount][12]<>'' then
             for IntCount2:=0 to StrGrid.ColCount-1 do
             StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;

          if WorkOrderArr[IntCount][13]= '1' then begin
            for IntCount2:=0 to StrGrid.ColCount-1 do
              StrGrid.CellStyle[9,IntCount+2].font.Color := clBlue;
          end;
        end;
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;


// Search;

 { if (Cari.Text='') and (edtnopol.Text='') then begin
    RefreshData;
    RefreshGrid;
  end;  }
end;

procedure TWorkOrderRpt.CariKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key=#13 then TombolCari.Click;
end;

procedure TWorkOrderRpt.ToDatesClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    if ToDates.Checked=True then TanggalSampai.Enabled:=True
    else TanggalSampai.Enabled:=False;
  end;
end;

procedure TWorkOrderRpt.TanggalChange(Sender: TObject);
begin
  if ToDates.Checked=True then begin
    if TanggalSampai.Date<Tanggal.Date then TanggalSampai.Date:=Tanggal.Date;
  end;
end;

procedure TWorkOrderRpt.TanggalSampaiChange(Sender: TObject);
begin
  if Tanggal.Date>TanggalSampai.Date then Tanggal.Date:=TanggalSampai.Date;
end;

end.
