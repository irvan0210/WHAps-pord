unit ScheduleListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, ZColorStringGrid;

type
  TScheduleList = class(TForm)
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
  ScheduleList: TScheduleList;

implementation

uses MainU, ScheduleFormU;

{$R *.dfm}

constructor TScheduleList.Create(AOwner:TComponent;EmployeeType:String;isHelper:Boolean=False;isReadOnly:Boolean=True);
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

procedure TScheduleList.Init;
var IntCount:Integer;
begin
  StrGrid.ColCount:=6;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=70;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='No Bodi';
  StrGrid.Cells[1,0]:='No Polisi';
  case EmplType of
    1:StrGrid.Cells[3,0]:='Mitra';
    2:StrGrid.Cells[3,0]:='Driver';
    3:StrGrid.Cells[3,0]:='Karyawan';
  end;
  StrGrid.Cells[4,0]:='Dari Tgl';
  StrGrid.Cells[5,0]:='s/d Tgl';
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TScheduleList.RefreshCombo;
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

procedure TScheduleList.RefreshList;
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
    StrLocation:=','+Lokasi.Text
  else
    StrLocation:='';
//  if EmplType=1 then StrCompany:='3'
//  else if EmplType=2 then StrCompany:='2'
//  else StrCompany:='1';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if is_Helper then StrHelper:=',@isHelper=1'
    else StrHelper:='';
    QStr:='EXEC GetScheduleList '+CompanyId+','+LocationId+StrHelper+';';
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(SchArr,Count+1);
      SchArr[Count][0]:=Qry.FieldValues['working_schedule_id'];
      SchArr[Count][1]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      SchArr[Count][3]:=Qry.FieldValues['name'];
      SchArr[Count][4]:=Qry.FieldValues['from_date'];
      SchArr[Count][5]:=Qry.FieldValues['to_date'];
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
        StrGrid.Cells[Count2,Count+1]:=SchArr[Count][Count2]
    end;
  end;
end;

procedure TScheduleList.SelesaiClick(Sender: TObject);
begin
  ScheduleList.Close;
end;

procedure TScheduleList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TScheduleList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'')  then begin
    Init;
    Count2:=2;
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

procedure TScheduleList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TScheduleList.StrGridDblClick(Sender: TObject);
begin
    ScheduleForm:=TScheduleForm.Create(Self,Employee_Type,StrGrid.Cells[0,IntRow],is_Helper,is_readonly);
end;

procedure TScheduleList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TScheduleList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TScheduleList.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  RefreshList;
end;

end.
