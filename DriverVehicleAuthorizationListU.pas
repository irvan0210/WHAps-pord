unit DriverVehicleAuthorizationListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, ZColorStringGrid;

type
  TDriverVehicleAuthorizationList = class(TForm)
    Label1: TLabel;
    Cari: TEdit;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    SelectedRow:Integer;
    SchArr:Array of TArrString5;
    LokasiArr:Array of TArrString2;
    IntRow:Integer;
    is_Helper,is_ReadOnly:Boolean;

    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    EmplType:Integer;
    Employee_Type:String;
    constructor Create(AOwner:TComponent;EmployeeType:String;isHelper:Boolean=False;isReadOnly:Boolean=True);Overload;
    procedure RefreshList;
  end;

var
  DriverVehicleAuthorizationList: TDriverVehicleAuthorizationList;

implementation

uses MainU, ScheduleFormU, DriverVehicleAuthorizationU;

{$R *.dfm}

constructor TDriverVehicleAuthorizationList.Create(AOwner:TComponent;EmployeeType:String;isHelper:Boolean=False;isReadOnly:Boolean=True);
begin
  is_Helper:=isHelper;
  is_ReadOnly:=isReadOnly;
  Employee_Type:=EmployeeType;
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
  end else begin
    EmplType:=3;
  end;
  Inherited Create(AOwner);
end;

procedure TDriverVehicleAuthorizationList.Init;
var IntCount:Integer;
begin
  StrGrid.ColCount:=5;
  SelectedRow:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=260;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=50;
  StrGrid.ColWidths[4]:=50;
 //StrGrid.ColWidths[5]:=70;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,4,0);
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Nama Driver';
  StrGrid.Cells[2,0]:='Kendaraan';
  StrGrid.Cells[2,1]:='Big Bus';
  StrGrid.Cells[3,1]:='Medium';
  StrGrid.Cells[4,1]:='Hiace';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TDriverVehicleAuthorizationList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
    Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
    LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
end;

procedure TDriverVehicleAuthorizationList.RefreshList;
var Count,Count2:Integer;
    StrLocation,StrCompany,QStr,Nama,StrHelper:String;
    Qry:TADOQuery;

begin
  For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+1]:=''
    end;
  end;
  SetLength(SchArr,0);

  if Trim(Lokasi.Text)<>'All' then
    StrLocation:=LokasiArr[Lokasi.ItemIndex][0]
  else
    StrLocation:='';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if is_Helper then StrHelper:=',@isHelper=1'
    else StrHelper:='';
    QStr :='EXEC GetDriverVehicleAuthorizationList '+StrLocation+';';
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(SchArr,Count+1);
      SchArr[Count][0]:=Qry.FieldValues['authorization_id'];
      SchArr[Count][1]:=Qry.FieldValues['name'];
      if (Qry.FieldValues['big_bus']<> Null) then
        SchArr[Count][2]:='V'
      else SchArr[Count][2]:='' ;
      if (Qry.FieldValues['medium']<> Null) then
        SchArr[Count][3]:='V'
      else SchArr[Count][3]:='' ;
      if (Qry.FieldValues['haice']<> Null) then
        SchArr[Count][4]:='V'
      else SchArr[Count][4]:='' ;
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  if Length(SchArr)>0 then StrGrid.RowCount:=Length(SchArr)+1 else StrGrid.RowCount:=2;
  Nama:='';
  For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+2]:=SchArr[Count][Count2];
        StrGrid.CellStyle[2,Count+2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[3,Count+2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[4,Count+2].HorizontalAlignment:=taCenter;
    end;
  end;
end;

procedure TDriverVehicleAuthorizationList.SelesaiClick(Sender: TObject);
begin
  DriverVehicleAuthorizationList.Close;
end;

procedure TDriverVehicleAuthorizationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDriverVehicleAuthorizationList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'')  then begin
    Init;
    Count2:=3;
    for Count:=0 to Length(SchArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
        if (StrPos(PChar(UpperCase(SchArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2-1]:=SchArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TDriverVehicleAuthorizationList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TDriverVehicleAuthorizationList.StrGridDblClick(Sender: TObject);
begin
  DriverVehicleAuthorization:=TDriverVehicleAuthorization.Create(Self,'BUS',StrGrid.Cells[0,IntRow],is_Helper,is_readonly);
end;

procedure TDriverVehicleAuthorizationList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TDriverVehicleAuthorizationList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TDriverVehicleAuthorizationList.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  RefreshList;
end;

end.
