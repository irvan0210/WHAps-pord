unit BatchSearchU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls,  WHUnit, ADODB;

type
  TBatchSearch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    btnBatal: TButton;
    Panel2: TPanel;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnBatalClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    procedure ClearDataGrid;
    procedure LoadData;
    procedure RefreshList;


  public
    { Public declarations }

    PDataCompanyID,FormDari:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;vDataCompanyID,FormFrom:String;IsViewOnly:Boolean=False);
  end;

var
  BatchSearch: TBatchSearch;
  BatchArr:Array of TArrString7;
  IntRow:Integer;


implementation

uses MainU, ProductU;

{$R *.dfm}

constructor TBatchSearch.Create(AOwner:TComponent;vDataCompanyID,FormFrom:String;IsViewOnly:Boolean=False);
begin
  PDataCompanyID:=vDataCompanyID;
  FormDari:=FormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TBatchSearch.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGrid.RowCount:=2;     

  for Count2:=0 to 5 do
  StrGrid.Cells[Count2,1]:='';  


end;


procedure TBatchSearch.LoadData;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXECUTE GetVehicleTypeWHDCSearch ';

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(BatchArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      //if Qry.FieldValues['vhc_type_detail_id']<>NULL then
      //BatchArr[Count][0]:=Qry.FieldValues['vhc_type_detail_id'];
      if Qry.FieldValues['vehicle_id']<>NULL then
      BatchArr[Count][0]:=Qry.FieldValues['vehicle_id'];

      if Qry.FieldValues['body_id']<>NULL then
      BatchArr[Count][1]:=Qry.FieldValues['body_id'];

      if Qry.FieldValues['license_plate']<>NULL then
      BatchArr[Count][2]:=Qry.FieldValues['license_plate'];

      if Qry.FieldValues['seat_vehicle']<>NULL then
      BatchArr[Count][3]:=Qry.FieldValues['seat_vehicle'];

      Inc(Count);
      Qry.Next;
    end;

    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TBatchSearch.RefreshList;
var
  IntCount:Integer;
begin

  if Length(BatchArr)>0 then
  StrGrid.RowCount:=Length(BatchArr)+1;
  for IntCount:=0 to Length(BatchArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=BatchArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=BatchArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=BatchArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=BatchArr[IntCount][3];
  end;

end;




procedure TBatchSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBatchSearch.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBatchSearch.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Body ID';
  StrGrid.Cells[2,0]:='No Plat';
  StrGrid.Cells[3,0]:='Seat';


  StrGrid.ColWidths[0]:=80;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=70;


end;

procedure TBatchSearch.FormShow(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TBatchSearch.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    //Init;
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(BatchArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(BatchArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=BatchArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

procedure TBatchSearch.StrGridDblClick(Sender: TObject);
begin
  if FormDari='ProductU' then begin

//     Product.edtVehicleID.Text:=StrGrid.Cells[0,IntRow];
//     Product.edtPlat.Text:=StrGrid.Cells[2,IntRow];

  end;
  Close;
end;

procedure TBatchSearch.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   IntRow:=ARow;
end;

procedure TBatchSearch.btnBatalClick(Sender: TObject);
begin
  if FormDari='ProductU' then begin
//     Product.edtPlat.Clear;
//     Product.edtVehicleID.Clear;
  end;
  Close;
end;

procedure TBatchSearch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

end.
