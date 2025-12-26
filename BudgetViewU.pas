unit BudgetViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ADODB;

type
  TBudgetView = class(TForm)
    GroupLokasi: TGroupBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Label1: TLabel;
    Cari: TEdit;
    btnTombolCari: TSpeedButton;
    SBU: TComboBox;
    Label17: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    BudgetArr,PaymentTermArr,CompanyArr:Array of TArrString5;
    IntRow,MinRowGrid:Integer;
    procedure RefreshCombo;
    Function FormatRupiah(Value: Int64): string;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;

  end;

var
  BudgetView: TBudgetView;

implementation

uses MainU, PurchaseOrderU, PurchaseRequestU;

{$R *.dfm}
constructor TBudgetView.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TBudgetView.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBudgetView.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if CompanyId='1' then
      StrQry:='EXEC GetCompanyLocationList ;' 
    else
      StrQry:='EXEC GetCompanyLocationList '+CompanyId+','+LocationId+';' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
   { StrQry:='SELECT * FROM wh_payment_term WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PaymentTermArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PaymentTermArr[IntCount][0]:=Qry.FieldValues['payment_term_id'];
      PaymentTermArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close; }
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
 // for IntCount:=0 to Length(PaymentTermArr)-1  do
 //   PaymentTerm.Items.Add(PaymentTermArr[IntCount][1]);
  SBU.ItemIndex := 0;
  Main.M_Normal;
end;

procedure TBudgetView.FormShow(Sender: TObject);
begin
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TBudgetView.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
 // TPurchaseRequest.InitBudget;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrQry:='EXEC GetUserBudget '+QuotedStr(User)+','+FormatDateTime('mm',Now())+','+FormatDateTime('yyyy',Now())+','+StrCompanyId+','+StrLocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BudgetArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(BudgetArr,IntCount+1);
      BudgetArr[IntCount][0]:=IntToStr(IntCount+1);
      BudgetArr[IntCount][1]:=Qry.FieldValues['coa_id'];
      BudgetArr[IntCount][2]:=Qry.FieldValues['name'];
      BudgetArr[IntCount][3]:=Qry.FieldValues['value'];
      BudgetArr[IntCount][4]:=Qry.FieldValues['budget_used'];
      BudgetArr[IntCount][5]:=Qry.FieldValues['budget_id'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
 // for IntCount:=0 to Length(BudgetArr)-1  do
 //   Budget.Items.Add(BudgetArr[IntCount][0]);
  Main.M_Normal;
end;

procedure TBudgetView.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=6;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=130;
  StrGrid.ColWidths[2]:=450;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='COA';
  StrGrid.Cells[2,0]:='Name';
  StrGrid.Cells[3,0]:='Budget Used';
  StrGrid.Cells[4,0]:='Value';
  StrGrid.Cells[5,0]:='Budget ID';

 // StrGrid.MergeCells.AddRectXY(0,0,0,1);
 // StrGrid.MergeCells.AddRectXY(1,0,1,1);
 // StrGrid.MergeCells.AddRectXY(2,0,2,1);
 // StrGrid.MergeCells.AddRectXY(3,0,3,1);
 // StrGrid.MergeCells.AddRectXY(4,0,4,1);
 // StrGrid.MergeCells.AddRectXY(5,0,5,1);
 // StrGrid.MergeCells.AddRectXY(6,0,6,1);

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TBudgetView.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBudgetView.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,IntRowCount,lengt:Integer;
//    StrOrderId,StrCustOrderDetailId:String;
  //  IsDrawRect,IsDrawRect2:Boolean;
begin
  if Length(BudgetArr)>0 then StrGrid.RowCount:=Length(BudgetArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;

  IntStartRow:=0;
 // StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(BudgetArr)-1;
  for IntCount:=0 to Length(BudgetArr)-1 do begin
    Application.ProcessMessages;

    StrGrid.Cells[0,IntCount+1]:=BudgetArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=BudgetArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=BudgetArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=FormatRupiah(StrToInt64(BudgetArr[IntCount][4]));
    StrGrid.Cells[4,IntCount+1]:=FormatRupiah(StrToInt64(BudgetArr[IntCount][3]));
    StrGrid.Cells[5,IntCount+1]:=BudgetArr[IntCount][5];
   // StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][6];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify;
    //StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
  end;
end;

procedure TBudgetView.StrGridDblClick(Sender: TObject);
var
  StrCOA,StrBudget,StrBudgetID, StrBgtTotal,StrBgtTerpakai: string;
begin
  StrCOA := StrGrid.Cells[1,IntRow];
  StrBudget :=StrGrid.Cells[2,intRow];
  StrBudgetID := StrGrid.Cells[5,intRow];
  StrBgtTotal:=StringReplace(StrGrid.Cells[4,IntRow], '.', '', [rfReplaceAll]);
  StrBgtTerpakai := StringReplace(StrGrid.Cells[3,IntRow], '.', '', [rfReplaceAll]);
 // StrBudgetSisa := ;
  if (StrCOA <> '') AND (StrBudget <> '')then begin
   with PurchaseRequest do begin
    BudgetCoa.Text := StrCOA;
    BudgetDisp.Text := StrBudget;
    BudgetId.Text:= StrBudgetID;
      if Trim(BudgetCoa.Text)<>'' then begin
        //BudgetDisp.Text:=BudgetArr[Budget.ItemIndex][1];
        BudgetTotal.Text:=SToCurr(StrBgtTotal);
        BudgetTerpakai.Text:=SToCurr(StrBgtTerpakai);
        BudgetSisa.Text:=IToCurr(SToInt(StrBgtTotal)-SToInt(StrBgtTerpakai));
        IsInputGrid:=True;
      end else begin
        BudgetId.Text :='';
        BudgetTotal.Text:='0';
        BudgetTerpakai.Text:='0';
        BudgetSisa.Text:='0';
        IsInputGrid:=False;
      end;
   end;
   Close;
  end;
end;

function TBudgetView.FormatRupiah(Value: Int64): string;
begin
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  Result := FormatFloat('#,##0', Value);
end;

end.
