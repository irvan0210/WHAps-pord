unit CustomerComplainCorrectiveActionPlanListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, ADODB, WHUnit,
  ComCtrls, DateUtils;

type
  TCustomerComplainCorrectiveActionPlanList = class(TForm)
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Selesai: TButton;
    GridCCP: TZColorStringGrid;
    Cari: TEdit;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    CBFilterBy: TComboBox;
    Tanggal: TDateTimePicker;
    TanggalSampai: TDateTimePicker;
    Lihat: TButton;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCCPDblClick(Sender: TObject);
    procedure GridCCPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LihatClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    CCPArr:Array of TArrString21;
    IntRow,MinRowGrid,TipeData,IsClosed:Byte;
    FormRequest,CustomerId:String;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Tipe_Data:Integer=0;Is_Closed:Byte=0);Overload;
  end;

var
  CustomerComplainCorrectiveActionPlanList: TCustomerComplainCorrectiveActionPlanList;

implementation

uses MainU, CustomerComplainCorrectiveActionPlanU, 
  CetakKetidaksesuaianDanPerbaikanU;

{$R *.dfm}
constructor TCustomerComplainCorrectiveActionPlanList.Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Tipe_Data:Integer=0;Is_Closed:Byte=0);
begin
  FormRequest:=Form_Request;
  CustomerId :=QuotedStr(Customer_Id);
  TipeData:=Tipe_Data;
  IsClosed:=Is_Closed;
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainCorrectiveActionPlanList.Init;
begin
  Cari.Text:='';
end;

procedure TCustomerComplainCorrectiveActionPlanList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridCCP.ColCount:=22;
  GridCCP.WordWrap:=False;
  GridCCP.ColWidths[0]:=120;
  GridCCP.ColWidths[1]:=90;
  GridCCP.ColWidths[2]:=90;
  GridCCP.ColWidths[3]:=90;
  GridCCP.ColWidths[4]:=60;
  //GridCCP.ColWidths[5]:=70;
  GridCCP.ColWidths[5]:=65;
  GridCCP.ColWidths[6]:=65;
  GridCCP.ColWidths[7]:=65;
  GridCCP.ColWidths[8]:=65;
  GridCCP.ColWidths[9]:=65;
  GridCCP.ColWidths[10]:=500;
  GridCCP.ColWidths[11]:=160;
  GridCCP.ColWidths[12]:=70;
  GridCCP.ColWidths[13]:=40;
  GridCCP.ColWidths[14]:=100;
  GridCCP.ColWidths[15]:=50;
  GridCCP.ColWidths[16]:=150;


  GridCCP.SizingHeight:=True;

  GridCCP.Cells[0,0]:='Tanggal Rencana TIndakan Perbaikan';
  GridCCP.Cells[1,0]:='No Komplain';
  GridCCP.Cells[2,0]:='Tanggal Kompalin';
  GridCCP.Cells[3,0]:='No SJ';
  GridCCP.Cells[4,0]:='No Polisi';
  //GridCCP.Cells[5,0]:='ID Pengemudi';
  GridCCP.Cells[5,0]:='Kebersihan';
  GridCCP.Cells[6,0]:='Fasilitas';
  GridCCP.Cells[7,0]:='Pelayanan';
  GridCCP.Cells[8,0]:='Penjemputan';
  GridCCP.Cells[9,0]:='Mogok';
  GridCCP.Cells[10,0]:='Detail Komplain';
  GridCCP.Cells[11,0]:='Investigasi';
  GridCCP.Cells[12,0]:='Perbaikan';
  GridCCP.Cells[13,0]:='Pengemudi';
  GridCCP.Cells[14,0]:='Tanggal';
  GridCCP.Cells[15,0]:='Jam';
  GridCCP.Cells[16,0]:='No Pesanan';
  GridCCP.Cells[17,0]:='';
  GridCCP.Cells[18,0]:='';

  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.Cells[IntCount,1]:='';
end;

procedure TCustomerComplainCorrectiveActionPlanList.RefreshCombo;
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TCustomerComplainCorrectiveActionPlanList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrCompanyId,StrCustomerId,StrTipeData,StrDate,StrFilterBy:String;
    Qry:TADOQuery;
    IntCount:Integer;
    StrClosed:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(CCPArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    StrAllFoward := ',@AllFoward=-1';
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    If trim(CustomerId)<>'' Then
      StrCustomerId:=',@CustomerId='+CustomerId
    Else
      StrCustomerId:='';
    StrTipeData:=',@TypeData='+IntToStr(TipeData);
    {StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrAllFoward+',@List=1; ';}

    If IsClosed=1 Then StrClosed :=',@IsClosed=1'
    Else StrClosed:='';

    StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@DatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.Date));
    StrFilterBy:=',@FilterBy='+QuotedStr(CBFilterBy.Text);

    StrQry:='EXEC GetCustomerComplainRefundList '+LocationId+',1,'+StrCompanyId+StrCustomerId+StrTipeData+StrDate+StrClosed+StrFilterBy+'; ';

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(CCPArr,IntCount+1);
       if Qry.FieldValues['renc_tindakan_perbaikan_date']<>NULL then
        CCPArr[IntCount][0]:=Qry.FieldValues['renc_tindakan_perbaikan_date']
       else CCPArr[IntCount][0]:='';
       CCPArr[IntCount][1]:=Qry.FieldValues['cust_complain_id'];
       CCPArr[IntCount][2]:=Qry.FieldValues['updatedate'];
       CCPArr[IntCount][3]:=Qry.FieldValues['vhc_trans_id'];
       CCPArr[IntCount][4]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       //CCPArr[IntCount][5]:=Qry.FieldValues['employee_id'];
       if Qry.FieldValues['kebersihan_status']<>'0' then CCPArr[IntCount][5]:='v';//Qry.FieldValues['kebersihan_status'];
       if Qry.FieldValues['fasilitas_status']<>'0' then CCPArr[IntCount][6]:='v';//Qry.FieldValues['fasilitas_status'];
       if Qry.FieldValues['pelayanan_status']<>'0' then CCPArr[IntCount][7]:='v';//Qry.FieldValues['pelayanan_status'];
       if Qry.FieldValues['penjemputan_status']<>'0' then CCPArr[IntCount][8]:='v';//Qry.FieldValues['penjemputan_status'];
       if Qry.FieldValues['mogok_status']<>'0' then CCPArr[IntCount][9]:='v';//Qry.FieldValues['penjemputan_status'];
       CCPArr[IntCount][10]:=Qry.FieldValues['ComplainInDetail'];

       if Qry.FieldValues['Investigation']<>NULL then CCPArr[IntCount][11]:=Qry.FieldValues['Investigation'];
       if Qry.FieldValues['Handling']<>NULL then CCPArr[IntCount][12]:=Qry.FieldValues['Handling'];

       CCPArr[IntCount][13]:=Qry.FieldValues['name'];
       CCPArr[IntCount][14]:=Qry.FieldValues['from_dates'];
       CCPArr[IntCount][15]:=Qry.FieldValues['from_time'];
       CCPArr[IntCount][16]:=Qry.FieldValues['customer_order_id'];
       CCPArr[IntCount][17]:=Qry.FieldValues['customer_name'];
       CCPArr[IntCount][18]:=Qry.FieldValues['route'];
       //if Qry.FieldValues['out_time']<>NULL then CCPArr[IntCount][10]:=Qry.FieldValues['out_time'];
       CCPArr[IntCount][19]:=Qry.FieldValues['route'];
       CCPArr[IntCount][20]:=Qry.FieldValues['reserved_order_detail_id'];
       CCPArr[IntCount][21]:=Qry.FieldValues['cust_complain_investigation_id'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainCorrectiveActionPlanList.RefreshGrid;
var IntCount:Integer;
begin
  GridCCP.RowCount:=Length(CCPArr)+1;
  for IntCount:=0 to Length(CCPArr)-1 do begin
    GridCCP.Cells[0,IntCount+1]:=CCPArr[IntCount][0];
    GridCCP.Cells[1,IntCount+1]:=CCPArr[IntCount][1];
    GridCCP.Cells[2,IntCount+1]:=CCPArr[IntCount][2];
    GridCCP.Cells[3,IntCount+1]:=CCPArr[IntCount][3];
    GridCCP.Cells[4,IntCount+1]:=CCPArr[IntCount][4];
    GridCCP.Cells[5,IntCount+1]:=CCPArr[IntCount][5];
    GridCCP.Cells[6,IntCount+1]:=CCPArr[IntCount][6];
    GridCCP.Cells[7,IntCount+1]:=CCPArr[IntCount][7];
    GridCCP.Cells[8,IntCount+1]:=CCPArr[IntCount][8];
    GridCCP.Cells[9,IntCount+1]:=CCPArr[IntCount][9];
    GridCCP.Cells[10,IntCount+1]:=CCPArr[IntCount][10];
    GridCCP.Cells[11,IntCount+1]:=CCPArr[IntCount][11];
    GridCCP.Cells[12,IntCount+1]:=CCPArr[IntCount][12];
    GridCCP.Cells[13,IntCount+1]:=CCPArr[IntCount][13];

    GridCCP.Cells[14,IntCount+1]:=CCPArr[IntCount][14];
    GridCCP.Cells[15,IntCount+1]:=CCPArr[IntCount][15];
    GridCCP.Cells[16,IntCount+1]:=CCPArr[IntCount][16];
    GridCCP.Cells[17,IntCount+1]:=CCPArr[IntCount][17];
    GridCCP.Cells[18,IntCount+1]:=CCPArr[IntCount][18];
    GridCCP.Cells[21,IntCount+1]:=CCPArr[IntCount][21];

    GridCCP.CellStyle[9,IntCount+1].WordWrap:=True;

    GridCCP.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[7,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[8,IntCount+1].HorizontalAlignment:=taCenter;

  end;
end;

procedure TCustomerComplainCorrectiveActionPlanList.FormShow(
  Sender: TObject);
begin
  Tanggal.Date:= StartOfTheMonth(NOW);
  TanggalSampai.Date:=Now;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;

end;

procedure TCustomerComplainCorrectiveActionPlanList.SelesaiClick(
  Sender: TObject);
begin
  Close;
end;

procedure TCustomerComplainCorrectiveActionPlanList.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustomerComplainCorrectiveActionPlanList.GridCCPDblClick(
  Sender: TObject);
var
  StrQry:string;
  Qry:TADOQuery;
begin
  if (IntRow>MinRowGrid) and (GridCCP.Cells[0,IntRow]<>'') then begin
    if UpperCase(FormRequest)='MAIN-VIEW' then  begin
      if Main.IsFormOpen('CustComplainCorrectiveActionPlan')=False then
        CustComplainCorrectiveActionPlan:=TCustComplainCorrectiveActionPlan.Create(Self,GridCCP.Cells[1,IntRow],'VIEW');
    end else if UpperCase(FormRequest)='MAIN-UPDATE' then begin
      if Main.IsFormOpen('CustComplainCorrectiveActionPlan')=False then
      begin
        CustComplainCorrectiveActionPlan:=TCustComplainCorrectiveActionPlan.Create(Self,GridCCP.Cells[1,IntRow],'UPDATE');
        StrTransId:=GridCCP.Cells[21,IntRow];
      end;
    end else  if UpperCase(FormRequest)='CREATE-KETIDAKSESUAIAN' then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='SELECT cust_complain_id FROM wh_cust_complain_ketidaksesuaian_perbaikan '+
                'WHERE cust_complain_id='+QuotedStr(GridCCP.Cells[1,IntRow])+' and status=1';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
      end;

      if Qry.RecordCount=0 then
      begin
        if Main.IsFormOpen('CetakKetidaksesuaianDanPerbaikan')=True then
        begin
          CustComplainInvestigationId:=StrToInt(GridCCP.Cells[21,IntRow]);
          CetakKetidaksesuaianDanPerbaikan.NoKomplain.Text:= GridCCP.Cells[1,IntRow];
          Close;
        end;
      end else begin
        MessageBox(0,PChar('Komplain Sudah cetak Ketidaksesuaian dan Perbaikan'+Chr(13)),'Customer Complain Corrective Action Plan List',MB_OK or MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TCustomerComplainCorrectiveActionPlanList.GridCCPSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerComplainCorrectiveActionPlanList.LihatClick(
  Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

end.
