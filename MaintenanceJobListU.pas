unit MaintenanceJobListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TMaintenanceJobList = class(TForm)
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
    SelectedRow,MaxCol:Integer;
    MaintenanceJobArr:Array of TArrString14;
    CompanyArr:Array of TArrString5;
    OrderBy,Sorted:String;
    IntRow,IntCol,IntColPrev:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    procedure RefreshList;
    procedure ClearCari;
  end;

var
  MaintenanceJobList: TMaintenanceJobList;

implementation

uses MainU, StrUtils, MaintenanceJobFormU;

{$R *.dfm}

constructor TMaintenanceJobList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: MaintenanceJobList=FormRequest='+FormRequest,1);
  inherited Create(AOwner);
end;

procedure TMaintenanceJobList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TMaintenanceJobList.Init;
var IntCount:Integer;
begin
  MaxCol:=4;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Pekerjaan';
  StrGrid.Cells[1,0]:='Inventory';
  StrGrid.Cells[2,0]:='Status';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=310;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=60;
  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  for IntCount:=3 to MaxCol-1 do
    StrGrid.ColWidths[IntCount]:=0;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TMaintenanceJobList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TMaintenanceJobList.RefreshList;
var IntCount:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  SetLength(MaintenanceJobArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:=CompanyArr[SBU.ItemIndex][1];
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceJobList '+StrCompany+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(MaintenanceJobArr,IntCount+1);
        MaintenanceJobArr[IntCount][0]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['name'];
        if Qry.FieldValues['part_type_name']<>NULL then MaintenanceJobArr[IntCount][1]:=Qry.FieldValues['part_type_name'];
        if Qry.FieldValues['status']=1 then MaintenanceJobArr[IntCount][2]:='Active' else MaintenanceJobArr[IntCount][3]:='NonAktif';
        MaintenanceJobArr[IntCount][3]:=Qry.FieldValues['maintenance_job_id'];
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

procedure TMaintenanceJobList.RefreshGrid;
var IntCount,IntCount2: Integer;
begin
  For IntCount:=1 to StrGrid.RowCount-1 do begin
    for IntCount2:=0 to StrGrid.ColCount-1  do
    StrGrid.Cells[IntCount2,IntCount]:='';
  end;
  if Length(MaintenanceJobArr)>0 then StrGrid.RowCount:=Length(MaintenanceJobArr)+1
  else StrGrid.RowCount:=2;
  For IntCount:=0 to Length(MaintenanceJobArr)-1 do begin
    for IntCount2:=0 to MaxCol do
    StrGrid.Cells[IntCount2,IntCount+1]:=MaintenanceJobArr[IntCount][IntCount2];
  end;
end;

procedure TMaintenanceJobList.KeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceJobList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceJobList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(MaintenanceJobArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(MaintenanceJobArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2-1]:=MaintenanceJobArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMaintenanceJobList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TMaintenanceJobList.StrGridDblClick(Sender: TObject);
var StrIn:String;
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
      MaintenanceJobForm:=TMaintenanceJobForm.Create(Self,StrGrid.Cells[5,IntRow]);
    end else begin
      if UpperCase(FormRequest)='UPDATE-DETAIL' then begin
        if Main.IsFormOpen('MaintenanceJobForm')=False then MaintenanceJobForm:=TMaintenanceJobForm.Create(Self,StrGrid.Cells[4,IntRow],False);
      end;
    end;
  end;
end;

procedure TMaintenanceJobList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMaintenanceJobList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TMaintenanceJobList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TMaintenanceJobList.StrGridMouseDown(Sender: TObject;
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

procedure TMaintenanceJobList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
