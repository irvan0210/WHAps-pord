unit EmployeeHoldU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit, Grids, ZColorStringGrid;

type
  TEmployeeHold = class(TForm)
    Driver: TComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    DriverDisp: TEdit;
    Description: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    GroupList: TGroupBox;
    GridMitra: TZColorStringGrid;
    Label3: TLabel;
    Label2: TLabel;
    Cari: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure GridMitraSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridMitraDblClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure DriverKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String);Overload;
  end;

var
  EmployeeHold: TEmployeeHold;
  EmplType,CompanyId,IntRow:Integer;
  EmplCode:String;
  EmplArr:Array of TArrString8;

implementation

uses MainU;

{$R *.dfm}

constructor TEmployeeHold.Create(AOwner:TComponent;EmployeeType:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    CompanyId:=3;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    CompanyId:=2;
    EmplCode:='BS';
  end else begin
    EmplType:=3;
    CompanyId:=1;
    EmplCode:='';
  end;
  Inherited Create(AOwner);
end;

procedure TEmployeeHold.Init;
begin
  case EmplType of
    1:begin
        Caption:='Stop Operasi Mitra';
        GroupList.Caption:='Mitra';
      end;
    2:begin
        Caption:='Stop Operasi Driver';
        GroupList.Caption:='Driver';
      end;
    3:begin
        Caption:='Tahan Karyawan';
        GroupList.Caption:='Karyawan';
      end;
  end;
  IntRow:=0;
  Driver.Text:='';
  Driver.Items.Clear;
  Driver.ItemIndex:=-1;
  DriverDisp.Text:='';
  Description.Text:='';
end;

procedure TEmployeeHold.InitGrid;
begin
  SetLength(EmplArr,0);
  GridMitra.RowCount:=2;
  GridMitra.Cells[0,0]:='No KPP';
  GridMitra.Cells[1,0]:='Nama';
  GridMitra.Cells[2,0]:='Alamat';
  GridMitra.Cells[3,0]:='Telp/Hp';
  GridMitra.ColWidths[0]:=70;
  GridMitra.ColWidths[1]:=120;
  GridMitra.ColWidths[2]:=200;
  GridMitra.ColWidths[3]:=180;
  GridMitra.Cells[0,1]:='';
  GridMitra.Cells[1,1]:='';
  GridMitra.Cells[2,1]:='';
  GridMitra.Cells[3,1]:='';
end;

procedure TEmployeeHold.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  SetLength(EmplArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    QStr:='EXEC GetEmployeeList 1,'+QuotedStr(LocationId)+',1;';
//    QStr:='EXEC GetMitraList '+QuotedStr(LocationId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(EmplArr,IntCount+1);
      if (Qry.FieldValues['form_name']=NULL) and (Qry.FieldValues['reason']=NULL) then begin
        EmplArr[IntCount][0]:=Qry.FieldValues['employee_id'];
        EmplArr[IntCount][1]:=Qry.FieldValues['name'];
        if Qry.FieldValues['address']<>NULL then EmplArr[IntCount][2]:=Qry.FieldValues['address'];
        EmplArr[IntCount][3]:=Qry.FieldValues['phone'];
        if Qry.FieldValues['form_name']<>NULL then EmplArr[IntCount][4]:=Qry.FieldValues['form_name'];
        if Qry.FieldValues['reason']<>NULL then EmplArr[IntCount][5]:=Qry.FieldValues['reason'];
//      EmplArr[IntCount][4]:=Qry.FieldValues['cellular_no'];
//      if Qry.FieldValues['last_phone_no']<>NULL then EmplArr[IntCount][4]:=Qry.FieldValues['last_phone_no'];
        Inc(IntCount);
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(EmplArr)-1 do
    Driver.Items.Add(EmplArr[IntCount][0]);
  Main.M_Normal;
end;

procedure TEmployeeHold.RefreshGrid;
var Count:Integer;
begin
  if Length(EmplArr)>0 then GridMitra.RowCount:=Length(EmplArr)+1;
  for Count:=0 to Length(EmplArr)-1 do begin
     GridMitra.Cells[0,Count+1]:=EmplArr[Count][0];
     GridMitra.Cells[1,Count+1]:=EmplArr[Count][1];
     GridMitra.Cells[2,Count+1]:=EmplArr[Count][2];
     GridMitra.Cells[3,Count+1]:=EmplArr[Count][3];
     GridMitra.Cells[4,Count+1]:=EmplArr[Count][4];
  end;
end;

procedure TEmployeeHold.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
end;

procedure TEmployeeHold.DriverChange(Sender: TObject);
var IntCount:Integer;
begin
  if Driver.Text<>'' then
    for IntCount:=0 to Length(EmplArr)-1 do
    if Driver.Text=EmplArr[IntCount][0] then DriverDisp.Text:=EmplArr[IntCount][1];
end;

procedure TEmployeeHold.GridMitraSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeHold.GridMitraDblClick(Sender: TObject);
var IntCount:Integer;
begin
  Driver.ItemIndex:=Driver.Items.IndexOf(GridMitra.Cells[0,IntRow]);
  if Driver.Text<>'' then
    for IntCount:=0 to Length(EmplArr)-1 do
      if Driver.Text=EmplArr[IntCount][0] then
        DriverDisp.Text:=EmplArr[IntCount][1];
end;

procedure TEmployeeHold.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrDriverId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Driver.Text<>'') then begin
    StrDriverId:=Driver.Text;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      IsOk:=True;
      Main.TransStart;
      StrQry:='SELECT * FROM wh_empl_hold WHERE employee_id='+QuotedStr(StrDriverId)+' AND status=1;';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount<1 then begin
        StrQry:='INSERT INTO wh_empl_hold (employee_id,form_name,form_id,reason,status,update_user) '+
                'VALUES ('+QuotedStr(StrDriverId)+','+QuotedStr('PMO')+','+QuotedStr('PMO')+
                ','+QuotedStr(Description.Text)+',1,'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do IsOk:=False;
        end;
        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Disimpan','Penangguhan Mitra',MB_OKCANCEL or MB_ICONINFORMATION);
          Init;
          InitGrid;
          RefreshCombo;
          RefreshGrid;
        end else begin
          Main.TransRollback;
          MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'   Silahkan Coba Lagi','Penangguhan Mitra',MB_OK or MB_ICONERROR)
        end;
        EnableInput;
      end else Begin
        MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'   Silahkan Coba Lagi','Penangguhan Mitra',MB_OK or MB_ICONERROR)
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TEmployeeHold.DisableInput;
begin
  Simpan.Enabled:=False;
  Driver.Enabled:=False;
  Description.Enabled:=False;
end;

procedure TEmployeeHold.EnableInput;
begin
  Simpan.Enabled:=True;
  Driver.Enabled:=True;
  Description.Enabled:=True;
end;

procedure TEmployeeHold.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then Driver.SetFocus;
end;

procedure TEmployeeHold.DriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TEmployeeHold.DescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TEmployeeHold.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHold.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;



procedure TEmployeeHold.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
        if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridMitra.RowCount:=Count2;
          for Count4:=0 to 7 do
          GridMitra.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Driver.Items.Add(EmplArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

end.
