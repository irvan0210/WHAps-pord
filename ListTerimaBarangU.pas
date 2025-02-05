unit ListTerimaBarangU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, WHUnit, StdCtrls, Grids, ZColorStringGrid, ComCtrls;

type
  TListItemRequest = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    Tanggal: TDateTimePicker;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    Button1: TButton;
    Lihat: TButton;
    StrGrid: TZColorStringGrid;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString10;
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
  ListItemRequest: TListItemRequest;

implementation

uses
  MainU, SerahTerimaBarangU;

{$R *.dfm}

constructor TListItemRequest.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListTerimaBarang='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TListItemRequest.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

end;


procedure TListItemRequest.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=11;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=130;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=400;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=400;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=0;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);


  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='Tanggal Pengajuan';
  StrGrid.Cells[2,0]:='No PBJ';
  StrGrid.Cells[3,0]:='Tanggal Dibutuhkan';
  StrGrid.Cells[4,0]:='Diajukan Oleh';
  StrGrid.Cells[5,0]:='Item';
  StrGrid.Cells[6,0]:='Qty Permintaan';
  StrGrid.Cells[7,0]:='Qty Diterima';
  StrGrid.Cells[8,0]:='Detail';
  StrGrid.Cells[9,0]:='No Polisi';
  StrGrid.Cells[10,0]:='Type Kendaraan';


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
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TListItemRequest.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid,StrToDepartment:String;
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
  if DepartmentId<>'13' then begin
    StrToDepartment:=' AND a.to_department_id='+QuotedStr(DepartmentId);
  end else begin
    StrToDepartment:='';
  end;

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(WorkOrderArr,0);

//    StrQry:='SELECT a.item_request_id,CONVERT(VARCHAR(10),a.request_date,103) request_date,'+
//            'CONVERT(VARCHAR(10),a.requested_date,103) requested_date,b.name,a.no_request,d.license_plate,e.name tipe_kendaraan '+
//            'FROM wh_item_request a '+
//            'LEFT JOIN wh_user b ON a.requester_id=b.username '+
//            'LEFT JOIN wh_service_request c on a.no_request=c.service_request_id '+
//            'LEFT JOIN wh_vehicle d on c.vehicle_id=d.vehicle_id '+
//            'LEFT JOIN wh_vhc_batch e on d.vhc_batch_id=e.vhc_batch_id '+
//            'WHERE (a.requested_date BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+
//            ''+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date+1))+') AND a.company_id='+StrCompanyId+' AND a.location_id='+StrLocationId+' '+
//            ''+StrToDepartment+' AND (a.cancel<>1 or a.cancel IS NULL) and a.posting=1 order by a.request_date ASC' ;
    StrQry:='EXEC GetItemRequest @CompanyID='+StrCompanyId+',@LocationID='+StrLocationId+','+
    '@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(WorkOrderArr,IntCount+1);
      WorkOrderArr[IntCount][0]:=IntToStr(No);
      WorkOrderArr[IntCount][1]:= Qry.FieldValues['request_date'] ;
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['item_request_id'];
      WorkOrderArr[IntCount][3]:=Qry.FieldValues['requested_date'];
      WorkOrderArr[IntCount][4]:=Qry.FieldValues['name'];
      if Qry.FieldValues['license_plate']<>NULL then WorkOrderArr[IntCount][9]:=Qry.FieldValues['license_plate'];
      if Qry.FieldValues['tipe_kendaraan']<>NULL then WorkOrderArr[IntCount][10]:=Qry.FieldValues['tipe_kendaraan'];

//      StrQry:='select * from wh_item_request_detail where '+
//            '(item_request_id='+QuotedStr(Qry.FieldValues['item_request_id'])+') and '+
//            '(cancel<> 1 or cancel is NULL)  AND (isAvailable=1)';
      StrQry:='EXEC GetItemRequestDetail2 '+QuotedStr(Qry.FieldValues['item_request_id'])+'';
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
          WorkOrderArr[IntCount][1]:= Qry.FieldValues['request_date'] ;
          WorkOrderArr[IntCount][2]:=Qry.FieldValues['item_request_id'];
          WorkOrderArr[IntCount][3]:=Qry.FieldValues['requested_date'];
          WorkOrderArr[IntCount][4]:=Qry.FieldValues['name'];

          if Qry.FieldValues['license_plate']<>NULL then WorkOrderArr[IntCount][9]:=Qry.FieldValues['license_plate'];
          if Qry.FieldValues['tipe_kendaraan']<>NULL then WorkOrderArr[IntCount][10]:=Qry.FieldValues['tipe_kendaraan'];

        end;
        if Qry2.FieldValues['item_detail']<>NULL then WorkOrderArr[IntCount][5]:=Qry2.FieldValues['item_detail'];
        if Qry2.FieldValues['quantity']<>NULL then WorkOrderArr[IntCount][6]:=Qry2.FieldValues['quantity'];
        if Qry2.FieldValues['qty_diterima']<>NULL then WorkOrderArr[IntCount][7]:=Qry2.FieldValues['qty_diterima'];
        if Qry2.FieldValues['detail']<>NULL then WorkOrderArr[IntCount][8]:=Qry2.FieldValues['detail'];
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
  FreeAndNil(Qry2);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TListItemRequest.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+2
  else begin
    StrGrid.RowCount:=2;
  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(WorkOrderArr)-1;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>WorkOrderArr[IntCount][2])  then begin
      StrOrderId:=WorkOrderArr[IntCount][2];
      IntStartRow:=IntCount;

      StrGrid.Cells[0,IntCount+2]:='';
      StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][4];
      StrGrid.Cells[9,IntCount+2]:=WorkOrderArr[IntCount][9];
      StrGrid.Cells[10,IntCount+2]:=WorkOrderArr[IntCount][10];
      IsDrawRect:=False;

    end else if (IntCount<Length(WorkOrderArr)-1) then begin
      if (StrOrderId<>WorkOrderArr[IntCount+1][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+2,3,IntCount+2);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+2,4,IntCount+2);
      StrGrid.MergeCells.AddRectXY(9,IntStartRow+2,9,IntCount+2);
      StrGrid.MergeCells.AddRectXY(10,IntStartRow+2,10,IntCount+2);
    end;

    StrGrid.Cells[5,IntCount+2]:=WorkOrderArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=WorkOrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=WorkOrderArr[IntCount][8];

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taLeftJustify;


  end;
end;

procedure TListItemRequest.RefreshCombo;
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
      Inc(IntCount);
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

procedure TListItemRequest.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TListItemRequest.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TListItemRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TListItemRequest.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then TglSampai.Date:=Tanggal.Date;
end;

procedure TListItemRequest.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then Tanggal.Date:=TglSampai.Date;
end;

procedure TListItemRequest.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TListItemRequest.StrGridDblClick(Sender: TObject);
begin
  SerahTerimaBarang.Clear;
  SerahTerimaBarang.NoItemRequest.Text:=StrGrid.Cells[2,IntRow];
  SerahTerimaBarang.TipeKendaraan.Text:=StrGrid.Cells[10,IntRow];
  if IsCharAlpha(PChar(Copy(StrGrid.Cells[9,IntRow],2,1))^)=False then
    SerahTerimaBarang.NoPol.Text:=Copy(StrGrid.Cells[8,IntRow],1,1)+' '+Copy(StrGrid.Cells[9,IntRow],2,4)+
    ' '+Copy(StrGrid.Cells[9,IntRow],6,Length(StrGrid.Cells[9,IntRow])+1)
  else
    SerahTerimaBarang.NoPol.Text:=Copy(StrGrid.Cells[9,IntRow],1,2)+' '+Copy(StrGrid.Cells[9,IntRow],3,4)+
    ' '+Copy(StrGrid.Cells[9,IntRow],7,Length(StrGrid.Cells[9,IntRow])+1);

  Close;
end;

procedure TListItemRequest.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 IntRow:=ARow;
end;

procedure TListItemRequest.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TListItemRequest.Button3Click(Sender: TObject);
var
  I,b: Integer;
begin
  for I := 0 to StrGrid.ColCount - 1 do
    StrGrid.Cols[I].Clear;
  StrGrid.RowCount := 2;
  SetLength(WorkOrderArr,0);
  b:=2;
end;

end.
