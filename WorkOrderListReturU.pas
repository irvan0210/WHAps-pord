unit WorkOrderListReturU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TWorkOrderListRetur = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    Tanggal: TDateTimePicker;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    CheckSelect: TCheckBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString9;
    IntRow,IsAll,IsBlok,MaxCol,MinRowGrid:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);Overload;
  end;

var
  WorkOrderListRetur: TWorkOrderListRetur;

implementation

uses MainU, ReturBarangU;

{$R *.dfm}

constructor TWorkOrderListRetur.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: WorkOrderList='+Form_Request+','+Form_Function+','+IntToStr(Is_All)+','+IntToStr(Is_Blok),1);
  Inherited Create(AOwner);
end;

procedure TWorkOrderListRetur.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();

  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

end;


procedure TWorkOrderListRetur.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=7;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=120;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=400;
  StrGrid.ColWidths[6]:=64;


  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='No PKB';
  StrGrid.Cells[3,0]:='No Polisi';
  StrGrid.Cells[4,0]:='Job In Out';
  StrGrid.Cells[5,0]:='Item';
  StrGrid.Cells[6,0]:='Qty';


  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TWorkOrderListRetur.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit,No:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
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

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(WorkOrderArr,0);
    StrQry:='SELECT DISTINCT a.work_order_id,c.license_plate, '+
            'REPLACE(REPLACE(b.job_inex_id,1,''Internal''),2,''Eksternal'') AS job_inout '+
            ',CONVERT(VARCHAR(10),b.date_in,103) AS date_in,'+
            'CONVERT(VARCHAR(10),b.date_out,103) AS date_out '+
            'FROM wh_work_order_part a  '+
            'LEFT JOIN wh_work_order b ON a.work_order_id=b.work_order_id '+
            'LEFT JOIN wh_vehicle c ON b.vehicle_id=c.vehicle_id '+
            'LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id= '+
            '(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=b.vehicle_id) '+
            'AND (GETDATE()>from_date)) '+
            'WHERE c.company_id='+StrCompanyId+' AND d.location_id='+StrLocationId;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(WorkOrderArr,IntCount+1);
      WorkOrderArr[IntCount][0]:=IntToStr(No);
      WorkOrderArr[IntCount][1]:= Qry.FieldValues['date_in'] ;
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['work_order_id'];
      WorkOrderArr[IntCount][3]:=Qry.FieldValues['license_plate'];
      WorkOrderArr[IntCount][4]:=Qry.FieldValues['job_inout'];

      StrQry:='select * from wh_work_order_part where '+
            'work_order_id='+QuotedStr(Qry.FieldValues['work_order_id'])+' and status=1;';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(WorkOrderArr,IntCount+1);
          WorkOrderArr[IntCount][0]:=IntToStr(No);
          WorkOrderArr[IntCount][1]:= Qry.FieldValues['date_in'] ;
          WorkOrderArr[IntCount][2]:=Qry.FieldValues['work_order_id'];
          WorkOrderArr[IntCount][3]:=Qry.FieldValues['license_plate'];
          WorkOrderArr[IntCount][4]:=Qry.FieldValues['job_inout'];

        end;
        WorkOrderArr[IntCount][5]:=Qry2.FieldValues['part_name'];
        WorkOrderArr[IntCount][6]:=Qry2.FieldValues['qty'];

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderListRetur.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
//  for IntCount:=0 to StrGrid.ColCount-1 do
//    for IntCount2:=3 to StrGrid.RowCount-1 do begin
//      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
//      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
//    end;
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;
//  for IntCount:=0 to StrGrid.ColCount-1 do begin
//    StrGrid.Cells[IntCount,3]:='';
//    StrGrid.CellStyle[IntCount,3].Font.Color:=clWindowText;
//  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(WorkOrderArr)-1;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>WorkOrderArr[IntCount][2])  then begin
      StrOrderId:=WorkOrderArr[IntCount][2];
      IntStartRow:=IntCount;
      IntStartRow2:=IntCount;
      StrGrid.Cells[0,IntCount+1]:=WorkOrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=WorkOrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=WorkOrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=WorkOrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=WorkOrderArr[IntCount][4];

      IsDrawRect:=False;
      IsDrawRect2:=False;
      StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taLeftJustify;


    end else if (IntCount<Length(WorkOrderArr)-1) then begin
      if (StrOrderId<>WorkOrderArr[IntCount+1][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,IntCount+1);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,IntCount+1);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,IntCount+1);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,IntCount+1);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,IntCount+1);

    end;
    StrGrid.Cells[5,IntCount+1]:=WorkOrderArr[IntCount][5];;
    StrGrid.Cells[6,IntCount+1]:=WorkOrderArr[IntCount][6];
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;



  end;
end;

procedure TWorkOrderListRetur.RefreshCombo;
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
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TWorkOrderListRetur.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TWorkOrderListRetur.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TWorkOrderListRetur.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderListRetur.StrGridDblClick(Sender: TObject);
begin
  ReturBarang.Clear;
  ReturBarang.NoPKB.Text:=StrGrid.Cells[2,IntRow];
  Close;
end;

procedure TWorkOrderListRetur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
