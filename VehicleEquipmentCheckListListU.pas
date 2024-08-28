unit VehicleEquipmentCheckListListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TVehicleEquipmentCheckListList = class(TForm)
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    VehicleId: TComboBox;
    Label3: TLabel;
    NoBody: TEdit;
    Label4: TLabel;
    NoPolisi: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure VehicleIdChange(Sender: TObject);
  private
    { Private declarations }
    CompId,IntRow,IntCol:Integer;
    FormRequest,VhcId:String;
    ProductArr,CompanyArr:Array of TArrString5;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Vehicle_Id:String;Form_Request:String='');Overload;
  end;

var
  VehicleEquipmentCheckListList: TVehicleEquipmentCheckListList;

implementation

uses MainU, ADODB, VehicleEquipmentU, StrUtils, VehicleEquipmentCheckU;

{$R *.dfm}

constructor TVehicleEquipmentCheckListList.Create(AOwner:TComponent;Vehicle_Id:String;Form_Request:String='');
begin
  VhcId:=Vehicle_Id;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TVehicleEquipmentCheckListList.Init;
begin
  VehicleId.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  Initiation:=True;
end;

procedure TVehicleEquipmentCheckListList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=True;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=3;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=200;
  StrGrid.Cells[0,0]:='Tanggal';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Nama Checker';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVehicleEquipmentCheckListList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  if VehicleId.Text<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(VehicleId.Text)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.M_Normal;
  end;
end;

procedure TVehicleEquipmentCheckListList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrLocationId,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrQry:='EXEC GetVhcEquipmentCheckListList '+QuotedStr(VehicleId.Text)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ProductArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['check_dates'];
      ProductArr[IntCount][1]:=Qry.FieldValues['checker'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleEquipmentCheckListList.RefreshGrid;
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
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=ProductArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=ProductArr[IntCount][1];
  end;
end;

procedure TVehicleEquipmentCheckListList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipmentCheckListList.FormShow(Sender: TObject);
begin
  VehicleId.Text:=VhcId;
  RefreshCombo;
  InitGrid;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TVehicleEquipmentCheckListList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipmentCheckListList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleEquipmentCheckListList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    if FormRequest='' then begin
      VehicleEquipmentCheck.SetDates(StrGrid.Cells[1,IntRow]);
      Close;
    end;
  end;
end;

procedure TVehicleEquipmentCheckListList.VehicleIdChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
