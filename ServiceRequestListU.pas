unit ServiceRequestListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons,
  ComCtrls, ExtCtrls, DateUtils;

type
  TServiceRequestList = class(TForm)
    StrGrid: TZColorStringGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Lihat: TButton;
    Cari: TEdit;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Periode: TRadioGroup;
    Tanggal: TDateTimePicker;
    Bulan: TDateTimePicker;
    TglSampai: TDateTimePicker;
    GroupBox1: TGroupBox;
    chkInput: TRadioButton;
    chkPerbaikan: TRadioButton;
    Label2: TLabel;
    Status: TComboBox;
    Panel2: TPanel;
    ToXCel: TSpeedButton;
    Selesai: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    ServiceRequestArr:Array of TArrString10;
    IntRow,IsAll,IntMaxCol:Integer;
    Initiation:Boolean;
    myYear, myMonth, myDay : Word;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=1);Overload;
    { Public declarations }
  end;

var
  ServiceRequestList: TServiceRequestList;

implementation

uses MainU, GoodAssignmentU, ServiceRequestFormU, WorkOrderFormU,
  ServiceRequestAnalizeFormU;

{$R *.dfm}

constructor TServiceRequestList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=1);
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  IsAll:=Is_All;
  Initiation:=True;
  Inherited Create(AOwner);
end;

procedure TServiceRequestList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Bulan.Date:=Now();
  chkPerbaikan.Checked:=True;
  Periode.ItemIndex:=0;
  IntRow:=0;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TServiceRequestList.InitGrid;
var IntCount:Integer;
begin
  IntMaxCol:=10;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=IntMaxCol+1;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=132;
  StrGrid.ColWidths[7]:=400;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Pool';
  StrGrid.Cells[2,0]:='No SR';
  StrGrid.Cells[3,0]:='Ref SB/PKB/Driver Complain';
  StrGrid.Cells[4,0]:='Tanggal';
  StrGrid.Cells[5,0]:='Tanggal Perbaikan';
  StrGrid.Cells[6,0]:='No Bodi/No Polisi';
  StrGrid.Cells[7,0]:='Detail';
  StrGrid.Cells[8,0]:='';
  StrGrid.Cells[9,0]:='Status';
  StrGrid.Cells[10,0]:='Memo Khusus';
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
  for IntCount:=0 to 8 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TServiceRequestList.RefreshCombo;
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

  if FormRequest ='WorkOrder-Create' then begin
    Status.ItemIndex:=2;
    Status.Enabled:=False;
  end else begin
    Status.Enabled:=True;
    Status.ItemIndex:=1;
  end;

  Main.M_Normal;
end;

procedure TServiceRequestList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrIsAll,StrTypeDate,StrDate,StrApprove:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    if chkInput.Checked=True then
      StrTypeDate:=',@TypeDate=''INPUT'' '
    else StrTypeDate:=',@TypeDate=''PERBAIKAN'' ';
    if Periode.ItemIndex=0 then
    begin
      StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' ,@ToDates'+
              '='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+' ';
    end
    else
    begin
      DecodeDate(Bulan.Date, myYear, myMonth, myDay);
      StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)))+' ,@ToDates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))))+' ';
    end;


    StrApprove:=',@Approve='+QuotedStr(Status.Text);

    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if IsAll=9 then StrIsAll:='' else StrIsAll:=',@Finish='+IntToStr(IsAll);
    StrQry:='EXEC GetServiceRequestList '+StrCompanyId+','+StrLocationId+StrDate+StrIsAll+StrTypeDate+StrApprove+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(ServiceRequestArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ServiceRequestArr[IntCount][0]:=Qry.FieldValues['location'];
      ServiceRequestArr[IntCount][1]:=Qry.FieldValues['service_request_id'];
      if Qry.FieldValues['maintenance_service_id']<>NULL then ServiceRequestArr[IntCount][2]:=Qry.FieldValues['maintenance_service_id'];
      if Qry.FieldValues['driver_complain_id']<>NULL then ServiceRequestArr[IntCount][2]:= Qry.FieldValues['driver_complain_id']
      else if Qry.FieldValues['ref_work_order_id']<>NULL then ServiceRequestArr[IntCount][2]:=Qry.FieldValues['ref_work_order_id'] else ServiceRequestArr[IntCount][2]:='';
      ServiceRequestArr[IntCount][3]:=Qry.FieldValues['submit_date'];
      ServiceRequestArr[IntCount][5]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        ServiceRequestArr[IntCount][5]:=ServiceRequestArr[IntCount][5]+' / '+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        ServiceRequestArr[IntCount][5]:=ServiceRequestArr[IntCount][5]+' / '+Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      ServiceRequestArr[IntCount][6]:=Qry.FieldValues['description_resume'];
      if Qry.FieldValues['approve']=1 then begin
         ServiceRequestArr[IntCount][8]:='DISETUJUI';
      end else if Qry.FieldValues['approve']=2 then begin
         ServiceRequestArr[IntCount][8]:='DITOLAK';
      end else begin
        ServiceRequestArr[IntCount][8]:='DIAJUKAN';
      end;
      if Qry.FieldValues['ismemo_khusus']=1 then ServiceRequestArr[IntCount][9]:= 'v' else ServiceRequestArr[IntCount][9]:='';
      if Qry.FieldValues['work_order_id']<>NULL then ServiceRequestArr[IntCount][7]:=Qry.FieldValues['work_order_id'];
      ServiceRequestArr[IntCount][4]:=Qry.FieldValues['from_date']+' s/d '+Qry.FieldValues['to_date'];
       if Qry.FieldValues['work_order_id']<>NULL then ServiceRequestArr[IntCount][10]:=Qry.FieldValues['work_order_id'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(ServiceRequestArr)>0 then StrGrid.RowCount:=Length(ServiceRequestArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(ServiceRequestArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=ServiceRequestArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=ServiceRequestArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=ServiceRequestArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=ServiceRequestArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=ServiceRequestArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=ServiceRequestArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=ServiceRequestArr[IntCount][6];
    StrGrid.Cells[8,IntCount+1]:=ServiceRequestArr[IntCount][7];
    StrGrid.Cells[9,IntCount+1]:=ServiceRequestArr[IntCount][8];
    StrGrid.Cells[10,IntCount+1]:=ServiceRequestArr[IntCount][9];

    if ServiceRequestArr[IntCount][8]='DISETUJUI' then
    begin
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clGreen;
    end else if ServiceRequestArr[IntCount][8]='DITOLAK' then
    begin
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clRed;
    end else begin
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clWindowText;
    end;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;

//    if ServiceRequestArr[IntCount][10]<>'' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clGreen;
  end;
end;



procedure TServiceRequestList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TServiceRequestList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TServiceRequestList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TServiceRequestList.StrGridDblClick(Sender: TObject);
var
QStr,ServiceRequesID,StrWarehouseItemRequestId: string;
IntCount: Integer;
Qry:TADOQuery;
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('ServiceRequestAnalizeForm')=False then
      //ServiceRequestForm:=TServiceRequestForm.Create(Self, StrGrid.Cells[2,IntRow],'',False);
      ServiceRequestAnalizeForm:=TServiceRequestAnalizeForm.Create(nil,StrGrid.Cells[2,IntRow]);
    end else if UpperCase(FormRequest)='SERVICEREQUEST' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
       // ServiceRequestForm.RePrint(StrGrid.Cells[2,IntRow]);
        ServiceRequestAnalizeForm.RePrint(StrGrid.Cells[2,IntRow]);
      end;
      Close;
    end else if UpperCase(FormRequest)='MAIN-UPDATE' then begin
      ServiceRequestForm:=TServiceRequestForm.Create(nil,StrGrid.Cells[2,IntRow],FormRequest,True);
      Close;
    end else if UpperCase(FormRequest)='WORKORDER-CREATE' then begin
      ServiceRequesID:=StrGrid.Cells[2,IntRow];
      Main.MyConnection.Open;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;

      Qry.CursorLocation:=clUseClient;

      Main.M_Busy;
      QStr:='SELECT a.* FROM wh_tanda_terima a '+
            'LEFT JOIN wh_item_request b ON a.item_request_id=b.item_request_id '+
            'WHERE b.no_request='+QuotedStr(ServiceRequesID)+' AND a.status=1 ;';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      Qry.Open;

      if (Qry.RecordCount=0) then begin
        WorkOrderForm.SetServiceRequestId(ServiceRequesID);
        Close;
      end
      else if (Qry.RecordCount>0) then begin
        StrWarehouseItemRequestId:=Qry.FieldValues['tanda_terima_id'];
        WorkOrderForm.SetServiceRequestId(ServiceRequesID);
        QStr:='select * from wh_tanda_terima_detail where '+
        'tanda_terima_id= '+QuotedStr(StrWarehouseItemRequestId)+' and status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        Qry.Open;
        IntCount:=1;
        if Qry.RecordCount>0 then while not(Qry.Eof) do begin
          with WorkOrderForm do
          begin
            if StrGrid2.RowCount<IntCount+1 then StrGrid2.RowCount:=StrGrid2.RowCount+1;
            StrGrid2.Cells[0,IntCount]:= IntToStr(IntCount);
            StrGrid2.Cells[1,IntCount]:=Qry.FieldValues['item_detail'];
            StrGrid2.Cells[2,IntCount]:=Qry.FieldValues['qty'];
            StrGrid2.Cells[3,IntCount]:=Qry.FieldValues['kode_part_gp'];
            StrGrid2.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
            StrGrid2.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
          end;
          Qry.Next;
          Inc(IntCount);

        end;
        if WorkOrderForm.StrGrid2.RowCount<IntCount then WorkOrderForm.StrGrid2.RowCount:=WorkOrderForm.StrGrid2.RowCount+1;
        MinRow2:=IntCount;
        Qry.Close;


        Close;
      end;
//      else
//      begin
//        MessageBox(0,PChar('Barang belum ready/diposting'+Chr(13)+Chr(13)),'Service Request',MB_OK or MB_ICONERROR);
//      end;

      Qry.Close;
      Main.MyConnection.Close;
      Main.M_Normal;


    end else if UpperCase(FormRequest)='SERVICEREQUEST-ANALIZE' then begin
      ServiceRequestAnalizeForm.SetServiceRequestId(StrGrid.Cells[2,IntRow]);
      Close;
    end;
  end;
end;

procedure TServiceRequestList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TServiceRequestList.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TServiceRequestList.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TServiceRequestList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TServiceRequestList.CariChange(Sender: TObject);
begin
  if Cari.Text='' then begin
    RefreshData;
    RefreshGrid;
  end else
  begin
    Search;
  end;
end;

procedure TServiceRequestList.Search;
var IntCount,IntCount2,IntCount3,IntCount4,IntStartRow:Integer;
    IsTrue:Boolean;
begin
  IntStartRow:=0;
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    IntCount2:=IntStartRow;
    for IntCount:=0 to Length(ServiceRequestArr)-1 do begin
      IsTrue:=False;
      IntCount3:=0;
      repeat
        if (StrPos(PChar(UpperCase(ServiceRequestArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
        Inc(IntCount3);
      until (IntCount3>IntMaxCol) or (IsTrue);
      if IsTrue then begin
        StrGrid.RowCount:=IntCount2+2;
        StrGrid.Cells[0,IntCount2+2]:=IntToStr(IntCount2);
        for IntCount4:=1 to IntMaxCol do
          StrGrid.Cells[IntCount4,IntCount2+1]:=ServiceRequestArr[IntCount][IntCount4-1];
        StrGrid.CellStyle[1,IntCount2+1].HorizontalAlignment:=taCenter;
//        StrGrid.CellStyle[5,IntCount2+1].HorizontalAlignment:=taRightJustify;
        if ServiceRequestArr[IntCount][7]<>'' then for IntCount4:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount4,IntCount2+1].Font.Color:=clGreen;
        Inc(IntCount2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TServiceRequestList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

end.
