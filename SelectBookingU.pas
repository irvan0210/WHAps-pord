unit SelectBookingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, WHUnit, AppEvnts;

type
  TSelectBooking = class(TForm)
    StrGrid: TZColorStringGrid;
    AppHotKey: TApplicationEvents;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FormRequest,OrderList:String;
    IntRow,IntCol:Integer;
    IsInput:Boolean;
    procedure InitGrid;
    procedure RefreshGrid;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;Order_List:String='';Form_Request:String='';Is_Input:Boolean=False);Overload;
  end;

var
  SelectBooking: TSelectBooking;

implementation

uses OrderFormU, MainU, StrUtils, WorkOrderFormU, BookingFormU,
  MaintenanceServiceFormU, BlockUnitFormU;

{$R *.dfm}

Constructor TSelectBooking.Create(AOwner:TComponent;Order_List:String='';Form_Request:String='';Is_Input:Boolean=False);
begin
  OrderList:=Order_List;
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Main.WriteLog('Form Open: SelectBooking='+Order_List+',FormRequest='+Form_Request+','+BoolToStr(Is_Input),1);
  inherited Create(AOwner);
end;

procedure TSelectBooking.InitGrid;  
var IntCount:Integer;
    StrList:TStringList;
begin
  StrGrid.ColCount:=1;
  StrGrid.Cells[0,0]:='Pesanan/Perbaikan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrList:=SplitStrings(OrderList,'  ');
  for IntCount:=1 to StrList.Count do begin
    StrGrid.Cells[0,IntCount]:='';
    StrGrid.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
  end;
end;

procedure TSelectBooking.RefreshGrid;
var IntCount,IntCount2:Integer;
    StrList:TStringList;
begin
  StrList:=SplitStrings(OrderList,'  ');
  IntCount2:=0;
  StrGrid.RowCount := StrList.Count+1;
  for IntCount:=0 to StrList.Count-1 do begin
    if LeftStr(StrList.Strings[IntCount],3)<>'Out' then begin
      StrGrid.Cells[0,IntCount2+1]:=StrList.Strings[IntCount];
      Inc(IntCount2);
    end;
  end;
end;



procedure TSelectBooking.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSelectBooking.FormShow(Sender: TObject);
begin
  InitGrid;
  RefreshGrid;
end;

procedure TSelectBooking.StrGridDblClick(Sender: TObject);
begin

  if FormRequest='' then begin
    if (LeftStr(StrGrid.Cells[IntCol,IntRow],2)='CO') OR (LeftStr(StrGrid.Cells[IntCol,IntRow],2)='WL') then begin
      if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[IntCol,IntRow],IsInput);
    end else if (LeftStr(StrGrid.Cells[IntCol,IntRow],3)='MSR') then begin
      if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,StrGrid.Cells[IntCol,IntRow],'',False);
    end else if (LeftStr(StrGrid.Cells[IntCol,IntRow],3)='BLC') then begin
      if Main.IsFormOpen('BlockUnitForm')=False then BlockUnitForm:=TBlockUnitForm.Create(nil,Trim(StrGrid.Cells[IntCol,IntRow]),True)
    end else begin
      if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,Trim(StrGrid.Cells[IntCol,IntRow]),True)
    end;
  end else begin
    If UpperCase(FormRequest)='MAIN-CHANGE' then begin
      if (LeftStr(StrGrid.Cells[IntCol,IntRow],2)='CO') then begin
        if Main.IsFormOpen('BookingForm')=False then BookingForm:=TBookingForm.Create(nil,'',IsInput,FormRequest,StrGrid.Cells[IntCol,IntRow]);
      end;
    end;
  end;
  //SelectBooking.Close;
end;

procedure TSelectBooking.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TSelectBooking.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

end.
