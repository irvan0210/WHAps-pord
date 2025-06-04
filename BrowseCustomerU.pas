unit BrowseCustomerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons;

type
  TBrowseCustomer = class(TForm)
    StrGrid: TZColorStringGrid;
    Button1: TButton;
    Label1: TLabel;
    CariOffering: TSpeedButton;
    Cari: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CariOfferingClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    CustomerArr:Array of TArrString2;
    MaxCol:Integer;
    IntRow,IntCol:Integer;
    FormRequest:String;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  BrowseCustomer: TBrowseCustomer;

implementation

uses MainU, DailyOrderFeeRptU;

{$R *.dfm}
constructor TBrowseCustomer.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TBrowseCustomer.Search;
var Count,Count2,Count3,Count4,Count5,IntCountID:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    IntCountID:=0;
    for Count:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[Count,1]:='';
      StrGrid.CellStyle[Count,1].Font.Color:=clWindowText;
    end;
    for Count:=0 to Length(CustomerArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 1 do
      if (StrPos(PChar(UpperCase(CustomerArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          if CustomerArr[Count][1]<>'' then Inc(IntCountID);
          for Count4:=0 to 1 do
          begin
            StrGrid.Cells[Count4,Count2-1]:=CustomerArr[Count][Count4];
            StrGrid.Cells[Count4,Count2-1]:=CustomerArr[Count][Count4];
          end;

          Inc(Count2);
      end;
    end;
  end else
  begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBrowseCustomer.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=2;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=400;

  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='Customer Name';


  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TBrowseCustomer.RefreshGrid;
var IntCount,IntCount2,IntTotal:Integer;
begin
  for IntCount:=1 to StrGrid.RowCount-1 do begin
    StrGrid.Cells[0,IntCount]:='';
    StrGrid.Cells[1,IntCount]:='';
    StrGrid.CellStyle[0,IntCount].Font.Color:=clWindowText;
    StrGrid.CellStyle[1,IntCount].Font.Color:=clWindowText;
  end;
  if Length(CustomerArr)>0 then StrGrid.RowCount:=Length(CustomerArr)+1
  else begin
    StrGrid.RowCount:=2;
  end;
  
  for IntCount:=0 to Length(CustomerArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=CustomerArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=CustomerArr[IntCount][1];
  end;
end;

procedure TBrowseCustomer.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,  StrDate, StrToDate,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid,StrRequest:String;
    IntCount,IntRows:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  
  if Main.OpenDb then begin
    SetLength(CustomerArr,0);

    StrQry := 'SELECT a.customer_id,COALESCE(b.title,'''') '+
              '+a.name+COALESCE('' (''+a.alias+'')'','''') AS customer_name '+
              'FROM  wh_customer a '+
              'LEFT JOIN wh_title b ON b.title_id=a.title_id '+
              'WHERE a.status=1;';

    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CustomerArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CustomerArr[IntCount][0]:=Qry.FieldValues['customer_id'];
      CustomerArr[IntCount][1]:=Qry.FieldValues['customer_name'];

      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TBrowseCustomer.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Cari.SetFocus;
  Main.M_Busy;
  InitGrid;
  RefreshData;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TBrowseCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBrowseCustomer.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TBrowseCustomer.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TBrowseCustomer.StrGridDblClick(Sender: TObject);
begin
  if FormRequest='LaporanUangOrderHarian' then
  begin
    DailyOrderFeeRpt.CustomerName.Text:= StrGrid.Cells[1,IntRow] ;
  end;
  Close;
end;

procedure TBrowseCustomer.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

end.
