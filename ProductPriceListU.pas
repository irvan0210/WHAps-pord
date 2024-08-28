unit ProductPriceListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid,WHUnit;

type
  TProductPriceList = class(TForm)
    Label2: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompId,IntRow,IntCol:Integer;
    FormRequest:String;
    ProductArr,CompanyArr:Array of TArrString9;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;List_Type:String;Form_Request:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  ProductPriceList: TProductPriceList;

implementation

uses MainU, ProductPriceU, ADODB, StrUtils;

{$R *.dfm}

constructor TProductPriceList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=2;
  inherited Create(AOwner);
end;

constructor TProductPriceList.Create(AOwner:TComponent;List_Type:String;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Initiation:=True;
  Main.WriteLog('Form Open: ProductPriceList='+List_Type+','+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TProductPriceList.Init;
begin
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TProductPriceList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=True;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=10;
  StrGrid.RowHeights[0]:=35;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=340;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=60;
  StrGrid.ColWidths[5]:=50;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=45;
  StrGrid.ColWidths[8]:=45;
  StrGrid.ColWidths[9]:=50;
  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='Nama Produk';
  StrGrid.Cells[2,0]:='Jenis Produk';
  StrGrid.Cells[3,0]:='Harga Weekday';
  StrGrid.Cells[4,0]:='Harga Weekend';
  StrGrid.Cells[5,0]:='Tambah Jam';
  StrGrid.Cells[6,0]:='Tambah Hari';
  StrGrid.Cells[7,0]:='Paket Hari';
  StrGrid.Cells[8,0]:='Bahan Bakar';
  StrGrid.Cells[9,0]:='Status';
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,1]:='';
  end;
end;

procedure TProductPriceList.RefreshCombo;
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

procedure TProductPriceList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetProductPriceList '+StrCompanyId+StrLocationId+',@FullList=1;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ProductArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['product_price_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'];
      ProductArr[IntCount][2]:=Qry.FieldValues['product_name'];
      ProductArr[IntCount][3]:=IToCurr(Qry.FieldValues['price_weekday']);
      ProductArr[IntCount][4]:=IToCurr(Qry.FieldValues['price_weekend']);
      ProductArr[IntCount][5]:=IToCurr(Qry.FieldValues['price_overtime']);
      ProductArr[IntCount][6]:=IToCurr(Qry.FieldValues['price_overday']);
      ProductArr[IntCount][7]:=IToCurr(Qry.FieldValues['package_day']);
      if Qry.FieldValues['fuel']<>NULL then ProductArr[IntCount][8]:=Qry.FieldValues['fuel'];
      if Qry.FieldValues['status']='1' then ProductArr[IntCount][9]:='Aktif' else ProductArr[IntCount][9]:='Non Aktif';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TProductPriceList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(ProductArr)>0 then StrGrid.RowCount:=Length(ProductArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(ProductArr)-1 do begin
    for IntCount2:=0 to 9 do
      StrGrid.Cells[IntCount2,IntCount+1]:=ProductArr[IntCount][IntCount2];
    StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
   end;
end;

procedure TProductPriceList.RefreshDisplay;
begin
  RefreshData;
  RefreshGrid;
end;

procedure TProductPriceList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TProductPriceList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  InitGrid;
  RefreshCombo;
  RefreshDisplay;
  Initiation:=False;
end;

procedure TProductPriceList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TProductPriceList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TProductPriceList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='07') then ProductPrice:=TProductPrice.Create(Self,StrGrid.Cells[0,IntRow],False)
      else ProductPrice:=TProductPrice.Create(Self,StrGrid.Cells[0,IntRow],True);
    end;
  end;
end;




procedure TProductPriceList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  Init;
  RefreshData;
  if Trim(Cari.Text)<>'' then begin
    Count2:=2;
    for Count:=0 to Length(ProductArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
        if (StrPos(PChar(UpperCase(ProductArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 6 do
          StrGrid.Cells[Count4,Count2-1]:=ProductArr[Count][Count4];
          StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[4,Count2-1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[5,Count2-1].HorizontalAlignment:=taRightJustify;
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TProductPriceList.SBUChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
