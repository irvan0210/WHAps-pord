unit NumeratorListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls;
type
  TNumeratorList = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    Semua: TCheckBox;
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure SemuaClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure OutDatesClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId,OrderBy:String;
    ListArr,CompanyArr:Array of TArrString20;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Is_All:Integer=0;Order_By:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  NumeratorList: TNumeratorList;

implementation

uses MainU, ADODB, OrderFormU, BusInvoiceU, BookingFormU, AuthorizedFormU;

{$R *.dfm}

constructor TNumeratorList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TNumeratorList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Is_All:Integer=0;Order_By:String='');
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  FormRequest:=Form_Request;
  OrderBy:=Order_By;
  Initiation:=True;
  Main.WriteLog('Form Open: OrderList='+Company_Id+','+Form_Request+','+Form_Request+','+IntToStr(Is_All)+','+Order_By,1);
  inherited Create(AOwner);
end;

procedure TNumeratorList.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  Semua.Checked:=True;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TNumeratorList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=7;
  StrGrid.ColWidths[0]:=40;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=220;
  StrGrid.ColWidths[5]:=85;
  StrGrid.ColWidths[6]:=70;
  StrGrid.Cells[0,0]:='No Urut';
  StrGrid.Cells[1,0]:='Nama Cetakan';
  StrGrid.Cells[2,0]:='Numerator';
  StrGrid.Cells[3,0]:='Nomor Pesanan';
  StrGrid.Cells[4,0]:='Nama Pelanggan';
  StrGrid.Cells[5,0]:='Nominal';
  StrGrid.Cells[6,0]:='Tgl Cetak';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TNumeratorList.RefreshCombo;
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

procedure TNumeratorList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrOrder,StrRange:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ListArr,0);
    if Semua.Checked=False then begin
        StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date));
    end else StrTanggal:='';
    if OrderBy<>'' then StrOrder:=',@OrderBy='+OrderBy;
    StrQry:='EXEC GetNumeratorList '+IntToStr(CompId)+StrTanggal+StrOrder+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ListArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ListArr[IntCount][0]:=Qry.FieldValues['report_name'];
      if Qry.FieldValues['numerator']<>NULL then ListArr[IntCount][1]:=Qry.FieldValues['numerator'];
      if Qry.FieldValues['customer_order_id']<>NULL then  ListArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['name']<>NULL then
        if (Qry.FieldValues['title']<>NULL) then ListArr[IntCount][3]:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else ListArr[IntCount][3]:=Qry.FieldValues['name'];
      ListArr[IntCount][4]:=IToCurr(Qry.FieldValues['total']);
      ListArr[IntCount][5]:=Qry.FieldValues['printed'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TNumeratorList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(ListArr)>0 then StrGrid.RowCount:=Length(ListArr)+1
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  for IntCount:=0 to Length(ListArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=ListArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=ListArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=ListArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=ListArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=ListArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=ListArr[IntCount][5];
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
   end;
end;

procedure TNumeratorList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TNumeratorList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False; 
end;

procedure TNumeratorList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
{    InitGrid;
    Count2:=2;
    for Count:=0 to Length(OrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(OrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do begin
            StrGrid.Cells[Count4,Count2]:=OrderArr[Count][Count4];
            StrGrid.CellStyle[Count4,2].Font.Color:=clWindowText;
          end;
          if OrderArr[Count][14]='1' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clMaroon;
          if OrderArr[Count][15]='1' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clBlue;
          if (OrderArr[Count][14]='1') and (OrderArr[Count][15]='1') then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clGreen;
          if (OrderArr[Count][16]='0') then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2].Font.Color:=clRed;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
}
  end;
end;

procedure TNumeratorList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TNumeratorList.StrGridDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrOrder:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[3,IntRow],False)
    end;
  end;
end;

procedure TNumeratorList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TNumeratorList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TNumeratorList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TNumeratorList.SemuaClick(Sender: TObject);
begin
  if Semua.Checked then Tanggal.Enabled:=False
  else Tanggal.Enabled:=True;
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TNumeratorList.TanggalChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TNumeratorList.OutDatesClick(Sender: TObject);
begin
//  RefreshData;
//  RefreshGrid;
end;

end.
