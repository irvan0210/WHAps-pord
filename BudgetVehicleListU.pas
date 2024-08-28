unit BudgetVehicleListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ZColorStringGrid, Buttons;

type
  TBudgetVehicleList = class(TForm)
    Selesai: TButton;
    GridVhcBudget: TZColorStringGrid;
    Label2: TLabel;
    Cari: TEdit;
    ToXCel: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Refresh: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridVhcBudgetSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridVhcBudgetDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure AllFowardClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure FowardClick(Sender: TObject);
    procedure BackwardClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    VhcBudgetArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid,InOut:Integer;
    FormRequest:String;
    Initiation,IsFoward:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;

  end;

var
  BudgetVehicleList:TBudgetVehicleList;

implementation

uses MainU, SPJFormBusU, OrderFeeAddU, BudgetVehicleFormU;

{$R *.dfm}

constructor TBudgetVehicleList.Create(AOwner:TComponent;Form_Request:String='');
begin

  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ProductPriceList='+Form_Request,1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBudgetVehicleList.Init;
begin
  Cari.Text:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TBudgetVehicleList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridVhcBudget.ColCount:=10;
  GridVhcBudget.WordWrap:=False;
  GridVhcBudget.ColWidths[0]:=0;
  GridVhcBudget.ColWidths[1]:=100;
  GridVhcBudget.ColWidths[2]:=130;
  GridVhcBudget.ColWidths[3]:=20;
  GridVhcBudget.ColWidths[3]:=40;
  GridVhcBudget.ColWidths[4]:=80;
  GridVhcBudget.ColWidths[5]:=80;
  GridVhcBudget.ColWidths[6]:=80;
  GridVhcBudget.ColWidths[7]:=80;
  GridVhcBudget.ColWidths[8]:=80;
  GridVhcBudget.ColWidths[9]:=80;
  GridVhcBudget.Cells[0,0]:='BudgetVehicleId';
  GridVhcBudget.Cells[1,0]:='Trip Type';
  GridVhcBudget.Cells[2,0]:='Jenis Kendaraan';
  GridVhcBudget.Cells[3,0]:='Seat';
  GridVhcBudget.Cells[4,0]:='BBM';
  GridVhcBudget.Cells[5,0]:='Fee Driver';
  GridVhcBudget.Cells[6,0]:='Fee Co-Driver';
  GridVhcBudget.Cells[7,0]:='Tol';
  GridVhcBudget.Cells[8,0]:='Parkir';
  GridVhcBudget.Cells[9,0]:='Biaya Bermalam';

  for IntCount:=0 to GridVhcBudget.ColCount-1 do
    GridVhcBudget.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridVhcBudget.ColCount-1 do
    GridVhcBudget.Cells[IntCount,1]:='';
end;

procedure TBudgetVehicleList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TBudgetVehicleList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrInOut:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  SetLength(VhcBudgetArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetVehicleBudgetList '+StrCompany+','+StrLocation+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    GridVhcBudget.ColCount:=10;
    GridVhcBudget.WordWrap:=False;
    GridVhcBudget.ColWidths[0]:=0;
    GridVhcBudget.ColWidths[1]:=100;
    GridVhcBudget.ColWidths[2]:=130;
    GridVhcBudget.ColWidths[3]:=20;
    GridVhcBudget.ColWidths[3]:=40;
    GridVhcBudget.ColWidths[4]:=80;
    GridVhcBudget.ColWidths[5]:=80;
    GridVhcBudget.ColWidths[6]:=80;
    GridVhcBudget.ColWidths[7]:=80;
    GridVhcBudget.ColWidths[8]:=80;
    GridVhcBudget.ColWidths[9]:=80;

    GridVhcBudget.Cells[0,0]:='BudgetVehicleId';
    GridVhcBudget.Cells[1,0]:='Trip Type';
    GridVhcBudget.Cells[2,0]:='Jenis Kendaraan';
    GridVhcBudget.Cells[3,0]:='Seat';
    GridVhcBudget.Cells[4,0]:='BBM';
    GridVhcBudget.Cells[5,0]:='Fee Driver';
    GridVhcBudget.Cells[6,0]:='Fee Co-Driver';
    GridVhcBudget.Cells[7,0]:='Tol';
    GridVhcBudget.Cells[8,0]:='Parkir';
    GridVhcBudget.Cells[9,0]:='Biaya Bermalam';

    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(VhcBudgetArr,IntCount+1);
       VhcBudgetArr[IntCount][0]:=Qry.FieldValues['vehicle_budget_id'];
       VhcBudgetArr[IntCount][1]:=Qry.FieldValues['trip_type_name'];
       //VhcBudgetArr[IntCount][2]:=Qry.FieldValues['trip_type_id'];
       VhcBudgetArr[IntCount][2]:=Qry.FieldValues['category_name'];
       VhcBudgetArr[IntCount][3]:=Qry.FieldValues['seat'];
       //VhcBudgetArr[IntCount][4]:=Qry.FieldValues['category_id'];
       VhcBudgetArr[IntCount][4]:=Qry.FieldValues['fuel_price'];
       //VhcBudgetArr[IntCount][6]:=Qry.FieldValues['fuel_litre'];
       VhcBudgetArr[IntCount][5]:=Qry.FieldValues['driver'];
       VhcBudgetArr[IntCount][6]:=Qry.FieldValues['helper'];
       VhcBudgetArr[IntCount][7]:=Qry.FieldValues['toll'];
       VhcBudgetArr[IntCount][8]:=Qry.FieldValues['parkir'];
       VhcBudgetArr[IntCount][9]:=Qry.FieldValues['overnight_driver'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBudgetVehicleList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(VhcBudgetArr)>1 then GridVhcBudget.RowCount:=Length(VhcBudgetArr)+1
  else GridVhcBudget.RowCount:=2;
  for IntCount:=0 to Length(VhcBudgetArr)-1 do begin
    GridVhcBudget.Cells[0,IntCount+1]:=VhcBudgetArr[IntCount][0];
    GridVhcBudget.Cells[1,IntCount+1]:=VhcBudgetArr[IntCount][1];
    GridVhcBudget.Cells[2,IntCount+1]:=VhcBudgetArr[IntCount][2];
    GridVhcBudget.Cells[3,IntCount+1]:=VhcBudgetArr[IntCount][3];
    GridVhcBudget.Cells[4,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][4]);
    GridVhcBudget.Cells[5,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][5]);
    GridVhcBudget.Cells[6,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][6]);
    GridVhcBudget.Cells[7,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][7]);
    GridVhcBudget.Cells[8,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][8]);
    GridVhcBudget.Cells[9,IntCount+1]:=SToCurr(VhcBudgetArr[IntCount][9]);

    GridVhcBudget.CellStyle[1,IntCount+1].HorizontalAlignment:=taLeftJustify;
    GridVhcBudget.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
    GridVhcBudget.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
    GridVhcBudget.CellStyle[4,IntCount+1].HorizontalAlignment:=taRightJustify ;
    GridVhcBudget.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
    GridVhcBudget.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
    GridVhcBudget.CellStyle[7,IntCount+1].HorizontalAlignment:=taRightJustify;
    GridVhcBudget.CellStyle[8,IntCount+1].HorizontalAlignment:=taRightJustify;
    GridVhcBudget.CellStyle[9,IntCount+1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TBudgetVehicleList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetVehicleList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TBudgetVehicleList.GridVhcBudgetSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBudgetVehicleList.GridVhcBudgetDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridVhcBudget.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('BudgetVehicleForm')=False then BudgetVehicleForm:=TBudgetVehicleForm.Create(nil,GridVhcBudget.Cells[0,IntRow],True);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('BudgetVehicleForm')=False) then
            if Main.IsFormOpen('BudgetVehicleForm')=False then BudgetVehicleForm:=TBudgetVehicleForm.Create(nil,GridVhcBudget.Cells[0,IntRow],False);
            //Close;
      end;
    end;
  end;
end;

procedure TBudgetVehicleList.FormShow(Sender: TObject);
begin
  InitGrid;

  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TBudgetVehicleList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(VhcBudgetArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(VhcBudgetArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridVhcBudget.RowCount:=Count2+1;
          for Count4:=0 to 10 do begin
            GridVhcBudget.Cells[Count4,Count2]:=VhcBudgetArr[Count][Count4];
          end;
          GridVhcBudget.CellStyle[9,Count2].WordWrap:=False;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetVehicleList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridVhcBudget) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TBudgetVehicleList.AllFowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetVehicleList.AllClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetVehicleList.FowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetVehicleList.BackwardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBudgetVehicleList.RefreshClick(Sender: TObject);
begin
  InitGrid;

  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

end.
