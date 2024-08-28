unit EmployeeSearchU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, Grids, ZColorStringGrid;

type
  TEmployeeSearch = class(TForm)
    Batal: TButton;
    Label1: TLabel;
    KolomCari: TEdit;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    StrGrid: TZColorStringGrid;
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure KolomCariChange(Sender: TObject);
  private
    { Private declarations }
    procedure CloseForm;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshList;
  public
    { Public declarations }
    procedure SetParam(EmployeeType:String;Status:Integer=1);
  end;

var
  EmployeeSearch: TEmployeeSearch;
  EmployeeArr:Array of TArrString20;
  LokasiArr:Array of TArrString4;
  IntRow,EmplType,Stat,ReturnResult:Integer;
  Cancel:Boolean;

implementation

uses MainU, ADODB, StrUtils;

{$R *.dfm}

procedure TEmployeeSearch.Init;
var IntCount:Integer;
begin
  Cancel:=False;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=68;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=130;
  StrGrid.ColWidths[3]:=280;
  StrGrid.ColWidths[4]:=100;
  StrGrid.Cells[0,0]:='No KPP';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[3,0]:='Alamat';
  StrGrid.Cells[4,0]:='Telp/HP';
  StrGrid.Cells[5,0]:='Tgl Masuk';
  for IntCount:=0 to 5 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TEmployeeSearch.RefreshCombo;
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
  Qry.Destroy;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
    Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
    LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
end;

procedure TEmployeeSearch.RefreshList;
var Count,Count2:Integer;
    QStr,StrLocation,StrStat:String;
    QEmpl:TADOQuery;
begin
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 16 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(EmployeeArr,0);
  QEmpl:=TADOQuery.Create(Self);
  QEmpl.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (Trim(Lokasi.Text)<>'All') then StrLocation:=','+Lokasi.Text else StrLocation:=',0';
    StrStat:=','+IntToStr(Stat);
    QStr:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+StrStat+',@NoPict=1,@NoHold=1;';
    QEMpl.SQL.Add(QStr);
    QEmpl.Open;
    Count:=0;
    if (QEMpl.RecordCount>0) then while not(QEmpl.Eof) do begin
      SetLength(EmployeeArr,Count+1);
      EmployeeArr[Count][0]:=QEmpl.FieldValues['employee_id'];
      EmployeeArr[Count][1]:=QEmpl.FieldValues['name'];
      if QEmpl.FieldValues['birth']<>NULL then
        EmployeeArr[Count][2]:=QEmpl.FieldValues['birth'];
      if QEmpl.FieldValues['address']<>NULL then
        EmployeeArr[Count][3]:=QEmpl.FieldValues['address'];
      if QEmpl.FieldValues['phone']<>NULL then
        EmployeeArr[Count][4]:=QEmpl.FieldValues['phone'];
      if QEmpl.FieldValues['join_date']<>NULL then
        EmployeeArr[Count][5]:=QEmpl.FieldValues['join_date'];
      QEmpl.Next;
      Inc(Count);
    end;
    QEmpl.Close;
    Main.CloseDb;
  end;
  QEmpl.Destroy;
  if Length(EmployeeArr)>0 then
    StrGrid.RowCount:=Length(EmployeeArr)+1
  else
    StrGrid.RowCount:=2;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 5 do
      StrGrid.Cells[Count2,Count+1]:=EmployeeArr[Count][Count2];
  end;
end;

procedure TEmployeeSearch.BatalClick(Sender: TObject);
begin
  Cancel:=True;
  EmployeeSearch.CloseForm;
end;

procedure TEmployeeSearch.CloseForm;
begin
  if Not(Cancel) then ModalResult:=ReturnResult else ModalResult:=1;
  EmployeeSearch.Hide;
end;

procedure TEmployeeSearch.SetParam(EmployeeType:String;Status:Integer=1);
begin
  if UpperCase(EmployeeType)='TAXI' then EmplType:=1
  else if UpperCase(EmployeeType)='BUS' then EmplType:=2
  else EmplType:=3;
  Stat:=Status;
end;

procedure TEmployeeSearch.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TEmployeeSearch.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  RefreshList;
end;

procedure TEmployeeSearch.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeSearch.StrGridDblClick(Sender: TObject);
begin
  ReturnResult:=StrToInt(RightStr(StrGrid.Cells[0,IntRow],8));
  CloseForm;
end;

procedure TEmployeeSearch.KolomCariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(KolomCari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
        if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(KolomCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2-1]:=EmployeeArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

end.
