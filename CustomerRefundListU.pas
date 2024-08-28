unit CustomerRefundListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ZColorStringGrid, Buttons;

type
  TCustomerRefundList = class(TForm)
    Selesai: TButton;
    GridCCP: TZColorStringGrid;
    Label2: TLabel;
    Cari: TEdit;
    ToXCel: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCCPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridCCPDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure AllFowardClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure FowardClick(Sender: TObject);
    procedure BackwardClick(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    CCPArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid:Integer;
    FormRequest,CustomerId:String;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='');Overload;

  end;

var
  CustomerRefundList:TCustomerRefundList;

implementation

uses MainU, SPJFormBusU, CustomerRefundFormU ;

{$R *.dfm}

constructor TCustomerRefundList.Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='');
begin
  CustomerId :=QuotedStr(Customer_Id);
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: CustomerRefundList='+Form_Request+','+Customer_Id,1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerRefundList.Init;
begin
  Cari.Text:='';
end;

procedure TCustomerRefundList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  {
  GridCCP.ColCount:=11;
  GridCCP.WordWrap:=False;
  GridCCP.ColWidths[0]:=90;
  GridCCP.ColWidths[1]:=45;
  GridCCP.ColWidths[2]:=60;
  GridCCP.ColWidths[3]:=70;
  GridCCP.ColWidths[4]:=160;
  GridCCP.ColWidths[5]:=70;
  GridCCP.ColWidths[6]:=40;
  GridCCP.ColWidths[7]:=100;
  GridCCP.ColWidths[8]:=180;
  GridCCP.ColWidths[9]:=320;
  GridCCP.ColWidths[10]:=0;
  GridCCP.Cells[0,0]:='No SJ';
  GridCCP.Cells[1,0]:='No Body';
  GridCCP.Cells[2,0]:='No Polisi';
  GridCCP.Cells[3,0]:='ID Pengemudi';
  GridCCP.Cells[4,0]:='Pengemudi';
  GridCCP.Cells[5,0]:='Tanggal';
  GridCCP.Cells[6,0]:='Jam';
  GridCCP.Cells[7,0]:='No Pesanan';
  GridCCP.Cells[8,0]:='Customer';
  GridCCP.Cells[9,0]:='Rute';
  }

  GridCCP.ColCount:=13;
  GridCCP.WordWrap:=False;
  GridCCP.ColWidths[0]:=90;
  GridCCP.ColWidths[1]:=90;
  GridCCP.ColWidths[2]:=90;
  GridCCP.ColWidths[3]:=200;
  GridCCP.ColWidths[4]:=100;
  GridCCP.ColWidths[5]:=45;
  GridCCP.ColWidths[6]:=60;
  GridCCP.ColWidths[7]:=70;
  GridCCP.ColWidths[8]:=160;
  GridCCP.ColWidths[9]:=70;
  GridCCP.ColWidths[10]:=40;
  GridCCP.ColWidths[11]:=320;
  GridCCP.ColWidths[12]:=0;
  GridCCP.Cells[0,0]:='No Keluhan';
  GridCCP.Cells[1,0]:='No Refund';
  GridCCP.Cells[2,0]:='No SJ';
  GridCCP.Cells[3,0]:='Customer';
  GridCCP.Cells[4,0]:='No Pesanan';
  GridCCP.Cells[5,0]:='No Body';
  GridCCP.Cells[6,0]:='No Polisi';
  GridCCP.Cells[7,0]:='ID Pengemudi';
  GridCCP.Cells[8,0]:='Pengemudi';
  GridCCP.Cells[9,0]:='Tanggal';
  GridCCP.Cells[10,0]:='Jam';
  GridCCP.Cells[11,0]:='Rute';


  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.Cells[IntCount,1]:='';
end;

procedure TCustomerRefundList.RefreshCombo;
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

procedure TCustomerRefundList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrCompanyId,StrCustomerId:String;
    Qry:TADOQuery;
    IntCount:Integer;
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
    {StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrAllFoward+',@List=1; ';}
    StrQry:='EXEC GetCustomerComplainRefundList '+LocationId+',1,'+StrCompanyId+StrCustomerId+',@TypeData=1; ';

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(CCPArr,IntCount+1);
       {
       CCPArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
       CCPArr[IntCount][1]:=Qry.FieldValues['body_id'];
       CCPArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       CCPArr[IntCount][3]:=Qry.FieldValues['employee_id'];
       CCPArr[IntCount][4]:=Qry.FieldValues['name'];
       CCPArr[IntCount][5]:=Qry.FieldValues['from_dates'];
       CCPArr[IntCount][6]:=Qry.FieldValues['from_time'];
       CCPArr[IntCount][7]:=Qry.FieldValues['customer_order_id'];
       CCPArr[IntCount][8]:=Qry.FieldValues['customer_name'];
       CCPArr[IntCount][9]:=Qry.FieldValues['route'];
       if Qry.FieldValues['out_time']<>NULL then CCPArr[IntCount][10]:=Qry.FieldValues['out_time'];
       CCPArr[IntCount][11]:=Qry.FieldValues['route'];
       }
       CCPArr[IntCount][0]:=Qry.FieldValues['cust_complain_id'];
       CCPArr[IntCount][1]:=Qry.FieldValues['cust_refund_id'];
       CCPArr[IntCount][2]:=Qry.FieldValues['vhc_trans_id'];
       CCPArr[IntCount][3]:=Qry.FieldValues['customer_name'];
       CCPArr[IntCount][4]:=Qry.FieldValues['customer_order_id'];
       CCPArr[IntCount][5]:=Qry.FieldValues['body_id'];
       CCPArr[IntCount][6]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       CCPArr[IntCount][7]:=Qry.FieldValues['employee_id'];
       CCPArr[IntCount][8]:=Qry.FieldValues['name'];
       CCPArr[IntCount][9]:=Qry.FieldValues['from_dates'];
       CCPArr[IntCount][10]:=Qry.FieldValues['from_time'];
       CCPArr[IntCount][11]:=Qry.FieldValues['route'];
       if Qry.FieldValues['out_time']<>NULL then CCPArr[IntCount][12]:=Qry.FieldValues['out_time'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerRefundList.RefreshGrid;
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
    GridCCP.CellStyle[9,IntCount+1].WordWrap:=False;
  end;
end;

procedure TCustomerRefundList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerRefundList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustomerRefundList.GridCCPSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerRefundList.GridCCPDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridCCP.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('CustomerRefundForm')=False then CustomerRefundForm:=TCustomerRefundForm.Create(nil,'Customer Refund',GridCCP.Cells[2,IntRow],'',0);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('CustomerRefundForm')=False) then
            CustomerRefundForm:=TCustomerRefundForm.Create(nil,'Customer Refund',GridCCP.Cells[2,IntRow],'',2);
        Close;
      end;


    end;
  end;
end;

procedure TCustomerRefundList.FormShow(Sender: TObject);
begin
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TCustomerRefundList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(CCPArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(CCPArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridCCP.RowCount:=Count2+1;
          for Count4:=0 to 10 do begin
            GridCCP.Cells[Count4,Count2]:=CCPArr[Count][Count4];
          end;
          GridCCP.CellStyle[8,Count2].WordWrap:=False;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TCustomerRefundList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridCCP) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TCustomerRefundList.AllFowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TCustomerRefundList.AllClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerRefundList.FowardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerRefundList.BackwardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerRefundList.SBUChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;

end;

end.
