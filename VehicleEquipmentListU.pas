unit VehicleEquipmentListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TVehicleEquipmentList = class(TForm)
    Label2: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompId,IntRow,IntCol:Integer;
    FormRequest:String;
    ProductArr,CompanyArr:Array of TArrString5;
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
  VehicleEquipmentList: TVehicleEquipmentList;

implementation

uses MainU, ADODB, VehicleEquipmentU, StrUtils;

{$R *.dfm}

constructor TVehicleEquipmentList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=2;
  inherited Create(AOwner);
end;

constructor TVehicleEquipmentList.Create(AOwner:TComponent;List_Type:String;Form_Request:String='');
begin
  if UpperCase(List_Type)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(List_Type)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TVehicleEquipmentList.Init;
begin
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
  Initiation:=True;
end;

procedure TVehicleEquipmentList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=True;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=5;
  StrGrid.RowHeights[0]:=40;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=50;
  StrGrid.Cells[0,0]:='Id Perlengkapan';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Prioritas';
  StrGrid.Cells[3,0]:='Detail';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVehicleEquipmentList.RefreshCombo;
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

procedure TVehicleEquipmentList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrLocationId,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetVhcEquipmentList '+StrCompanyId+StrLocationId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ProductArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'];
      case Qry.FieldValues['priority'] of
        0:ProductArr[IntCount][2]:='Rendah';
        1:ProductArr[IntCount][2]:='Tinggi';
        2:ProductArr[IntCount][2]:='Biasa';
      end;
      ProductArr[IntCount][3]:=Qry.FieldValues['remark'];
      if Qry.FieldValues['status']='1' then ProductArr[IntCount][4]:='Aktif' else ProductArr[IntCount][4]:='Non Aktif';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleEquipmentList.RefreshGrid;
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
    for IntCount2:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount2,IntCount+1]:=ProductArr[IntCount][IntCount2];
   end;
end;

procedure TVehicleEquipmentList.RefreshDisplay;
begin
  Cari.Text:='';
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TVehicleEquipmentList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipmentList.FormShow(Sender: TObject);
begin
  RefreshCombo;
  RefreshDisplay;
  Initiation:=False;
end;

procedure TVehicleEquipmentList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipmentList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleEquipmentList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('VehicleEquipment')=False then VehicleEquipment:=TVehicleEquipment.Create(nil,StrGrid.Cells[0,IntRow],False)
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        VehicleEquipment:=TVehicleEquipment.Create(nil,StrGrid.Cells[0,IntRow],False);
      end;
    end;
  end;
end;

procedure TVehicleEquipmentList.CariChange(Sender: TObject);
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
          StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taRightJustify;
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TVehicleEquipmentList.SBUChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
