unit OfferingListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons, ExtCtrls,
  ComCtrls;

type
  TOfferingList = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    PanelLegend: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Tanggal: TDateTimePicker;
    Semua: TCheckBox;
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure SemuaClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    OfferingArr,CompanyArr:Array of TArrString16;
    IntRow,IntCol,MinRowGrid:Integer;
    IsAll:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0);Overload;
    procedure RefreshDisplay;
  end;

var
  OfferingList: TOfferingList;

implementation

uses MainU, ADODB, OfferingFormU, OrderFormU;

{$R *.dfm}

constructor TOfferingList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TOfferingList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  CustId:=Customer_Id;
  IsAll:=Is_All;
  FormRequest:=Form_Request;
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TOfferingList.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  Semua.Checked:=True;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TOfferingList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=16;
  StrGrid.ColWidths[0]:=160;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=180;
  StrGrid.ColWidths[6]:=180;
  StrGrid.ColWidths[7]:=140;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=100;
  StrGrid.ColWidths[11]:=120;
  StrGrid.ColWidths[12]:=0;
  StrGrid.ColWidths[13]:=0;
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  //col 12=department_id
  //col 13=null
  //col 14=customer_order_id
  //col 15=status
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,9,0);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.Cells[0,0]:='No Penawaran';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='No Kontrak';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Alamat';
  StrGrid.Cells[5,0]:='Penggunaan';
  StrGrid.Cells[10,0]:='Sales';
  StrGrid.Cells[11,0]:='Keterangan';
  StrGrid.Cells[5,1]:='Produk';
  StrGrid.Cells[6,1]:='Perjalanan';
  StrGrid.Cells[7,1]:='Tgl';
  StrGrid.Cells[8,1]:='';
  StrGrid.Cells[9,1]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TOfferingList.RefreshCombo;
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

procedure TOfferingList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrLocationId,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(OfferingArr,0);
    if Semua.Checked=False then StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date)) else StrTanggal:='';
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetLeadOrderList '+StrCompanyId+StrTanggal+StrLocationId+',@Finish='+IntToStr(IsAll)+' ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(OfferingArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      OfferingArr[IntCount][0]:=Qry.FieldValues['lead_order_id'];
      OfferingArr[IntCount][1]:=Qry.FieldValues['submit_dates'];
      if Qry.FieldValues['cust_contract_id']<>NULL then  OfferingArr[IntCount][2]:=Qry.FieldValues['cust_contract_id'];
      if Qry.FieldValues['names']<>NULL then OfferingArr[IntCount][3]:=Qry.FieldValues['names'];
      if Qry.FieldValues['customer_id']<>NULL then
      if (Qry.FieldValues['zip']<>NULL) and Qry.FieldValues['zip']<>'0' then OfferingArr[IntCount][4]:=Qry.FieldValues['address']+', '+ToString(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then OfferingArr[IntCount][4]:=Qry.FieldValues['address'];
      OfferingArr[IntCount][5]:=Qry.FieldValues['product_detail_resume'];
      OfferingArr[IntCount][6]:=Qry.FieldValues['route_detail_resume'];
      OfferingArr[IntCount][7]:=Qry.FieldValues['from_date_detail_resume'];
      OfferingArr[IntCount][9]:=IToCurr(Qry.FieldValues['total']);
      OfferingArr[IntCount][10]:=Qry.FieldValues['sales_name'];
      if Qry.FieldValues['remark']<>NULL then OfferingArr[IntCount][11]:=Qry.FieldValues['remark'];
      if Qry.FieldValues['department_id']<>NULL then OfferingArr[IntCount][12]:=Qry.FieldValues['department_id'];
//      if Qry.FieldValues['superior_user_id2']<>NULL then OfferingArr[IntCount][12]:=Qry.FieldValues['superior_user_id2'];
      if Qry.FieldValues['customer_order_id']<>NULL then OfferingArr[IntCount][14]:=Qry.FieldValues['customer_order_id'] else OfferingArr[IntCount][14]:='0';
      if Qry.FieldValues['status']='1' then OfferingArr[IntCount][15]:='1' else OfferingArr[IntCount][15]:='0';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOfferingList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(OfferingArr)>0 then StrGrid.RowCount:=Length(OfferingArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  for IntCount:=0 to Length(OfferingArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=OfferingArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=OfferingArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=OfferingArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=OfferingArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=OfferingArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=OfferingArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=OfferingArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=OfferingArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=OfferingArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=OfferingArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=OfferingArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=OfferingArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=OfferingArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=OfferingArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=OfferingArr[IntCount][14];
    StrGrid.Cells[15,IntCount+2]:=OfferingArr[IntCount][15];
    if OfferingArr[IntCount][14]<>'0' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    if OfferingArr[IntCount][15]='0' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed;
   end;
end;

procedure TOfferingList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TOfferingList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TOfferingList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(OfferingArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(OfferingArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 15 do begin
            StrGrid.Cells[Count4,Count2]:=OfferingArr[Count][Count4];
            StrGrid.CellStyle[Count4,Count2].Font.Color:=clWindowText;
          end;
          if OfferingArr[Count][14]<>'0' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clGreen;
          if OfferingArr[Count][15]='0' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clRed;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOfferingList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TOfferingList.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('OfferingForm')=False then OfferingForm:=TOfferingForm.Create(Self,StrGrid.Cells[0,IntRow],False)
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then if Main.IsFormOpen('OfferingForm')=False then begin
        if (DepartmentId=StrGrid.Cells[12,IntRow]) or (DepartmentId='13')  then
          OfferingForm:=TOfferingForm.Create(nil,StrGrid.Cells[0,IntRow],True)
        else
          MessageBox(0,PChar('Hanya Departement yang bersangkutan '+Chr(13)+'atau Atasannya yg berhak merevisi'),'Surat Penawaran',MB_OK or MB_ICONWARNING);
        OfferingList.Close;
      end;
      if UpperCase(FormRequest)='OFFERING-REPRINT' then  begin
        OfferingForm.RePrint(StrGrid.Cells[0,IntRow]);
        OfferingList.Close;
      end;
      if UpperCase(FormRequest)='ORDER-CREATE' then  begin
        OrderForm.SetOfferingId(StrGrid.Cells[0,IntRow]);
        OfferingList.Close;
      end;
    end;
  end;
end;


procedure TOfferingList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOfferingList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TOfferingList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TOfferingList.SemuaClick(Sender: TObject);
begin
  if Semua.Checked then Tanggal.Enabled:=False
  else Tanggal.Enabled:=True;
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOfferingList.TanggalChange(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOfferingList.SBUChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
