unit VehicleTypeListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TVehicleTypeList = class(TForm)
    Cari: TEdit;
    Label1: TLabel;
    Keluar: TButton;
    ToXCel: TSpeedButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure StrGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VehicleArr:Array of TArrString14;
    CompanyArr,GroupArr:Array of TArrString5;
    OrderBy,Sorted:String;
    IntRow,IntCol,IntColPrev:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshGrid;
  public
    { Public declarations }
    VhcType:Integer;
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    procedure RefreshList;
    procedure ClearCari;
  end;

var
  VehicleTypeList: TVehicleTypeList;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleFormU, WorkOrderFormU,
  VehicleEquipmentFormU, VehicleEquipmentCheckU, VehicleImageU,
  VehicleGridU, VehicleTypeDetailFormU;

{$R *.dfm}

constructor TVehicleTypeList.Create(AOwner:TComponent;Form_Request:String='');
begin
{  if UpperCase(VehicleType)='TAXI' then begin
    VhcType:=1;
    MaxCol:=13;
    VhcCompanyId:=3;
  end else if UpperCase(VehicleType)='BUS' then begin
    VhcType:=2;
    MaxCol:=12;
    VhcCompanyId:=2;
  end else begin
    if (CompanyId='2') or (CompanyId='9') then begin
      VhcType:=2;
      MaxCol:=12;
    end else if (CompanyId='3') then begin
      VhcType:=1;
      MaxCol:=13;
    end;
    VhcCompanyId:=StrToInt(CompanyId);
  end;
}
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: VehicleTypeList=FormRequest='+FormRequest,1);
  inherited Create(AOwner);
end;

procedure TVehicleTypeList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleTypeList.Init;
var IntCount:Integer;
begin
{  case VhcType of
    1:Caption:='Data Armada Taxi';
    2:Caption:='Data Armada Bus';
  end;
}
  MaxCol:=5;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Group';
  StrGrid.Cells[1,0]:='Brand';
  StrGrid.Cells[2,0]:='Type';
  StrGrid.Cells[3,0]:='Seat';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=40;
  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=4 to MaxCol-1 do
    StrGrid.ColWidths[IntCount]:=0;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleTypeList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
end;

procedure TVehicleTypeList.RefreshList;
var IntCount:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  SetLength(VehicleArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:=CompanyArr[SBU.ItemIndex][1];
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleTypeDetail '+StrCompany+',@OrderBy='+QuotedStr('c.name')+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(VehicleArr,IntCount+1);
        VehicleArr[IntCount][0]:=Qry.FieldValues['name'];
        VehicleArr[IntCount][1]:=Qry.FieldValues['brand'];
        VehicleArr[IntCount][2]:=Qry.FieldValues['type'];
        VehicleArr[IntCount][3]:=Qry.FieldValues['seat'];
        VehicleArr[IntCount][5]:=Qry.FieldValues['vhc_type_detail_id'];
        Qry.Next;
        Inc(IntCount);
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  RefreshGrid;
  Main.M_Normal;
end;

procedure TVehicleTypeList.RefreshGrid;
var IntCount,IntCount2: Integer;
begin
  For IntCount:=1 to StrGrid.RowCount-1 do begin
    for IntCount2:=0 to StrGrid.ColCount-1  do
    StrGrid.Cells[IntCount2,IntCount]:='';
  end;
  if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+1
  else StrGrid.RowCount:=2;
  For IntCount:=0 to Length(VehicleArr)-1 do begin
    for IntCount2:=0 to MaxCol do
    StrGrid.Cells[IntCount2,IntCount+1]:=VehicleArr[IntCount][IntCount2];
  end;
end;

procedure TVehicleTypeList.KeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleTypeList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleTypeList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 13 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2-1]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TVehicleTypeList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleTypeList.StrGridDblClick(Sender: TObject);
var StrIn:String;
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
      VehicleTypeDetailForm:=TVehicleTypeDetailForm.Create(Self,StrGrid.Cells[5,IntRow],True);
    end else begin
      if UpperCase(FormRequest)='UPDATE-DETAIL' then begin
        if Main.IsFormOpen('VehicleTypeDetailForm')=False then VehicleTypeDetailForm:=TVehicleTypeDetailForm.Create(Self,StrGrid.Cells[5,IntRow],False);
      end;
    end;
  end;
end;

procedure TVehicleTypeList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleTypeList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TVehicleTypeList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleTypeList.StrGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StrGrid.MouseToCell(X,Y,IntCol,IntRow);
  if (Button=mbRight) and (IntRow=0) then begin
    if (IntCol = IntColPrev) and (Sorted='') then Sorted:=',@Sorted='+QuotedStr('DESC') else Sorted:='';
    IntColPrev:=IntCol;
    case IntCol of
      0:OrderBy:=',@OrderBy='+QuotedStr('c.name');
      1:OrderBy:=',@OrderBy='+QuotedStr('brand');
      2:OrderBy:=',@OrderBy='+QuotedStr('type');
      3:OrderBy:=',@OrderBy='+QuotedStr('seat');
    end;
    RefreshList;
  end;
end;

procedure TVehicleTypeList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
