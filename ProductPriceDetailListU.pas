unit ProductPriceDetailListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid,WHUnit;

type
  TProductPriceDetailList = class(TForm)
    Label2: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    CompId,IntRow,IntCol:Integer;
    FormRequest:String;
    ProductArr:Array of TArrString9;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;List_Type:String;Form_Request:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  ProductPriceDetailList: TProductPriceDetailList;

implementation

uses MainU, ProductPriceU, ADODB, StrUtils, ProductPriceDetailU;

{$R *.dfm}

constructor TProductPriceDetailList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=2;
  inherited Create(AOwner);
end;

constructor TProductPriceDetailList.Create(AOwner:TComponent;List_Type:String;Form_Request:String='');
begin
  if UpperCase(List_Type)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(List_Type)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ProductPriceList='+List_Type+','+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TProductPriceDetailList.Init;
begin

end;

procedure TProductPriceDetailList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=True;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=6;
  StrGrid.RowHeights[0]:=35;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=35;
  StrGrid.ColWidths[3]:=280;
  StrGrid.ColWidths[4]:=40;
  StrGrid.ColWidths[5]:=40;
  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='Jenis Armada';
  StrGrid.Cells[2,0]:='Seat';
  StrGrid.Cells[3,0]:='Tujuan';
  StrGrid.Cells[4,0]:='Bahan Bakar';
  StrGrid.Cells[5,0]:='Status';
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,1]:='';
  end;
end;

procedure TProductPriceDetailList.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrQry:='EXEC GetProductVehicleDetailList 2;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ProductArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['product_vehicle_detail_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'];
      ProductArr[IntCount][2]:=Qry.FieldValues['seat'];
      ProductArr[IntCount][3]:=Qry.FieldValues['destination'];
      if Qry.FieldValues['fuel']<>NULL then ProductArr[IntCount][4]:=Qry.FieldValues['fuel'];
      if Qry.FieldValues['status']='1' then ProductArr[IntCount][5]:='Aktif' else ProductArr[IntCount][5]:='Non Aktif';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TProductPriceDetailList.RefreshGrid;
var IntCount:Integer;
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
    StrGrid.Cells[0,IntCount+1]:=ProductArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=ProductArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=ProductArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=ProductArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=ProductArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=ProductArr[IntCount][5];
   end;
end;

procedure TProductPriceDetailList.RefreshDisplay;
begin
  Cari.Text:='';
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TProductPriceDetailList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TProductPriceDetailList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TProductPriceDetailList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TProductPriceDetailList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TProductPriceDetailList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='12') then ProductPriceDetail:=TProductPriceDetail.Create(Self,StrGrid.Cells[0,IntRow],False)
      else ProductPriceDetail:=TProductPriceDetail.Create(Self,StrGrid.Cells[0,IntRow],True);
    end;
  end;
end;




procedure TProductPriceDetailList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  Init;
  RefreshData;
  if Trim(Cari.Text)<>'' then begin
    Count2:=2;
    for Count:=0 to Length(ProductArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
        if (StrPos(PChar(UpperCase(ProductArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2-1]:=ProductArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

end.
