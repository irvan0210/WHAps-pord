unit CustomerComplainListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ZColorStringGrid, Buttons,
  ComCtrls, DateUtils;

type
  TCustomerComplainList = class(TForm)
    Selesai: TButton;
    GridCCP: TZColorStringGrid;
    Label2: TLabel;
    Cari: TEdit;
    ToXCel: TSpeedButton;
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
    procedure TanggalChange(Sender: TObject);
    procedure TanggalSampaiChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    CCPArr:Array of TArrString20;
    IntRow,MinRowGrid,TipeData:Integer;
    FormRequest,CustomerId:String;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Tipe_Data:Integer=0);Overload;
  end;

var
  CustomerComplainList:TCustomerComplainList;

implementation

uses MainU, SPJFormBusU, CustomerComplainFormU,
  CustomerComplainInvestigationFormU;

{$R *.dfm}

constructor TCustomerComplainList.Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Tipe_Data:Integer=0);
begin
  FormRequest:=Form_Request;
  CustomerId :=QuotedStr(Customer_Id);
  TipeData:=Tipe_Data;
  Main.WriteLog('Form Open: CustomerComplainList='+Form_Request+','+Customer_Id+','+IntToStr(Tipe_Data),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainList.Init;
begin
  Cari.Text:='';
end;

procedure TCustomerComplainList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridCCP.ColCount:=20;
  GridCCP.WordWrap:=False;
  GridCCP.ColWidths[0]:=70;
  GridCCP.ColWidths[1]:=90;
  GridCCP.ColWidths[2]:=90;
  GridCCP.ColWidths[3]:=45;
  GridCCP.ColWidths[4]:=60;
  //GridCCP.ColWidths[5]:=70;
  GridCCP.ColWidths[5]:=65;
  GridCCP.ColWidths[6]:=65;
  GridCCP.ColWidths[7]:=65;
  GridCCP.ColWidths[8]:=65;
  GridCCP.ColWidths[9]:=65;
  GridCCP.ColWidths[10]:=90;
  GridCCP.ColWidths[11]:=500;
  GridCCP.ColWidths[12]:=160;
  GridCCP.ColWidths[13]:=70;
  GridCCP.ColWidths[14]:=40;
  GridCCP.ColWidths[15]:=100;
  GridCCP.ColWidths[16]:=180;
  GridCCP.ColWidths[17]:=320;
  GridCCP.ColWidths[18]:=0;
  GridCCP.ColWidths[19]:=0;
  GridCCP.SizingHeight:=True;

  GridCCP.Cells[0,0]:='Tanggal';
  GridCCP.Cells[1,0]:='No Komplain';
  GridCCP.Cells[2,0]:='No SJ';
  GridCCP.Cells[3,0]:='No Body';
  GridCCP.Cells[4,0]:='No Polisi';
  //GridCCP.Cells[5,0]:='ID Pengemudi';
  GridCCP.Cells[5,0]:='Kebersihan';
  GridCCP.Cells[6,0]:='Fasilitas';
  GridCCP.Cells[7,0]:='Pelayanan';
  GridCCP.Cells[8,0]:='Penjemputan';
  GridCCP.Cells[9,0]:='Mogok';
  GridCCP.Cells[10,0]:='Driver Bermasalah';

  GridCCP.Cells[11,0]:='Detail Komplain';

  GridCCP.Cells[12,0]:='Pengemudi';
  GridCCP.Cells[13,0]:='Tanggal';
  GridCCP.Cells[14,0]:='Jam';
  GridCCP.Cells[15,0]:='No Pesanan';
  GridCCP.Cells[16,0]:='Customer';
  GridCCP.Cells[17,0]:='Rute';
  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridCCP.ColCount-1 do
    GridCCP.Cells[IntCount,1]:='';
end;

procedure TCustomerComplainList.RefreshCombo;
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

procedure TCustomerComplainList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrCompanyId,StrCustomerId,StrTipeData,StrDate,StrFilterBy:String;
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
    StrTipeData:=',@TypeData='+IntToStr(TipeData);
    {StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrAllFoward+',@List=1; ';}
    StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@DatesTo='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.Date));
    StrFilterBy:=',@FilterBy='+QuotedStr(CBFilterBy.Text);


    StrQry:='EXEC GetCustomerComplainRefundList '+LocationId+',1,'+StrCompanyId+StrCustomerId+StrTipeData+StrDate+StrFilterBy+'; ';

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(CCPArr,IntCount+1);
       CCPArr[IntCount][0]:=Qry.FieldValues['updatedate'];
       CCPArr[IntCount][1]:=Qry.FieldValues['cust_complain_id'];
       CCPArr[IntCount][2]:=Qry.FieldValues['vhc_trans_id'];
       CCPArr[IntCount][3]:=Qry.FieldValues['body_id'];
       CCPArr[IntCount][4]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       //CCPArr[IntCount][5]:=Qry.FieldValues['employee_id'];
       if Qry.FieldValues['kebersihan_status']<>'0' then CCPArr[IntCount][5]:='v';//Qry.FieldValues['kebersihan_status'];
       if Qry.FieldValues['fasilitas_status']<>'0' then CCPArr[IntCount][6]:='v';//Qry.FieldValues['fasilitas_status'];
       if Qry.FieldValues['pelayanan_status']<>'0' then CCPArr[IntCount][7]:='v';//Qry.FieldValues['pelayanan_status'];
       if Qry.FieldValues['penjemputan_status']<>'0' then CCPArr[IntCount][8]:='v';//Qry.FieldValues['penjemputan_status'];
       if Qry.FieldValues['mogok_status']<>'0' then CCPArr[IntCount][9]:='v';//Qry.FieldValues['penjemputan_status'];
       if Qry.FieldValues['driver_bermasalah_status']<>'0' then CCPArr[IntCount][10]:='v';

       CCPArr[IntCount][11]:=Qry.FieldValues['ComplainInDetail'];

       CCPArr[IntCount][12]:=Qry.FieldValues['name'];
       CCPArr[IntCount][13]:=Qry.FieldValues['from_dates'];
       CCPArr[IntCount][14]:=Qry.FieldValues['from_time'];
       CCPArr[IntCount][15]:=Qry.FieldValues['customer_order_id'];
       CCPArr[IntCount][16]:=Qry.FieldValues['customer_name'];
       CCPArr[IntCount][17]:=Qry.FieldValues['route'];
       //if Qry.FieldValues['out_time']<>NULL then CCPArr[IntCount][10]:=Qry.FieldValues['out_time'];
       CCPArr[IntCount][18]:=Qry.FieldValues['route'];
       CCPArr[IntCount][19]:=Qry.FieldValues['reserved_order_detail_id'];
       CCPArr[IntCount][20]:=Qry.FieldValues['is_closed'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainList.RefreshGrid;
var IntCount,Count2:Integer;
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
    GridCCP.CellStyle[10,IntCount+1].WordWrap:=True;

    GridCCP.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[7,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[8,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
    GridCCP.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;

    if (CCPArr[IntCount][20]='1') then begin
      for Count2:=0 to GridCCP.ColCount do GridCCP.CellStyle[Count2,IntCount+1].Font.Color:=clGreen;
    end else begin
      for Count2:=0 to GridCCP.ColCount do GridCCP.CellStyle[Count2,IntCount+1].Font.Color:=clWindowText;
    end;

  end;
end;

procedure TCustomerComplainList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerComplainList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustomerComplainList.GridCCPSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerComplainList.GridCCPDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridCCP.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('CustomerComplainForm')=False then CustomerComplainForm:=TCustomerComplainForm.Create(nil,GridCCP.Cells[2,IntRow],'',0);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('CustomerComplainForm')=False) then
            CustomerComplainForm:=TCustomerComplainForm.Create(nil,GridCCP.Cells[2,IntRow],'',2,GridCCP.Cells[17,IntRow]);
        Close;
      end else if UpperCase(FormRequest)='INVESTIGATION-CREATE' then  begin
        if (Main.IsFormOpen('CustomerComplainInvestigationForm')=True) then
            CustomerComplainInvestigationForm.SetData(GridCCP.Cells[1,IntRow]);//,GridCCP.Cells[1,IntRow],2
      end;
    end;
  end;
end;

procedure TCustomerComplainList.FormShow(Sender: TObject);
begin
  Tanggal.Date:= StartOfTheMonth(NOW);
  TanggalSampai.Date:=Now;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TCustomerComplainList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(CCPArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 16 do
      if (StrPos(PChar(UpperCase(CCPArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridCCP.RowCount:=Count2+1;
          for Count4:=0 to 16 do begin
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

procedure TCustomerComplainList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridCCP) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TCustomerComplainList.AllFowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TCustomerComplainList.AllClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainList.FowardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainList.BackwardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainList.SBUChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;

end;

procedure TCustomerComplainList.TanggalChange(Sender: TObject);
begin
  if(Tanggal.Date>TanggalSampai.Date) then begin
    TanggalSampai.Date:=Tanggal.Date;
  end;
end;

procedure TCustomerComplainList.TanggalSampaiChange(Sender: TObject);
begin
  if(TanggalSampai.Date<Tanggal.Date) then begin
    Tanggal.Date:=TanggalSampai.Date;
  end;
end;

procedure TCustomerComplainList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

end.
