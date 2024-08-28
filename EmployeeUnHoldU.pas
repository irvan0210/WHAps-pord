unit EmployeeUnHoldU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, ADODB, WHUnit;

type
  TEmployeeUnHold = class(TForm)
    Driver: TComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    DriverDisp: TEdit;
    Label3: TLabel;
    Cari: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    GroupList: TGroupBox;
    GridMitra: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridMitraSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridMitraDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure DriverChange(Sender: TObject);
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
    constructor Create(AOwner:TComponent;EmployeeType:String);Overload;
    { Public declarations }
  end;

var
  EmployeeUnHold: TEmployeeUnHold;
  EmplType,CompanyId,IntRow:Integer;
  EmplCode,StrCaption,StrList:String;
  EmplArr:Array of TArrString8;

implementation

uses MainU, StrUtils;

{$R *.dfm}

constructor TEmployeeUnHold.Create(AOwner:TComponent;EmployeeType:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    CompanyId:=3;
    EmplCode:='TX';
    StrCaption:='Operasi Kembali Mitra';
    StrList:='Mitra';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    CompanyId:=2;
    EmplCode:='BS';
    StrCaption:='Operasi Kembali Driver';
    StrList:='Driver';
  end else begin
    EmplType:=3;
    CompanyId:=1;
    EmplCode:='';
    StrCaption:='Lepas Tahan Karyawan';
    StrList:='Karyawan';
  end;
  Inherited Create(AOwner);
end;

procedure TEmployeeUnHold.Init;
begin
  case EmplType of
    1:begin
        Caption:=StrCaption;
        GroupList.Caption:=StrList;
      end;
    2:begin
        Caption:=StrCaption;
        GroupList.Caption:=StrList;
      end;
    3:begin
        Caption:=StrCaption;
        GroupList.Caption:=StrList;
      end;
  end;
  IntRow:=0;
  Driver.Text:='';
  Driver.Items.Clear;
  Driver.ItemIndex:=-1;
  DriverDisp.Text:='';
end;

procedure TEmployeeUnHold.InitGrid;
begin
  SetLength(EmplArr,0);
  GridMitra.RowCount:=2;
  GridMitra.Cells[0,0]:='No KPP';
  GridMitra.Cells[1,0]:='Nama';
  GridMitra.Cells[2,0]:='Alamat';
  GridMitra.Cells[3,0]:='Alasan';
  GridMitra.Cells[4,0]:='Lainnya';
  GridMitra.ColWidths[0]:=70;
  GridMitra.ColWidths[1]:=120;
  GridMitra.ColWidths[2]:=250;
  GridMitra.ColWidths[3]:=300;
  GridMitra.ColWidths[4]:=180;
  GridMitra.Cells[0,1]:='';
  GridMitra.Cells[1,1]:='';
  GridMitra.Cells[2,1]:='';
  GridMitra.Cells[3,1]:='';
end;

procedure TEmployeeUnHold.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  SetLength(EmplArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    QStr:='EXEC GetEmployeeHold '+QuotedStr(LocationId)+','+IntToStr(EmplType)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=0;
    SetLength(EmplArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      EmplArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      EmplArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['address']<>NULL then EmplArr[IntCount][2]:=Qry.FieldValues['address'];
      if Qry.FieldValues['reason']<>NULL then EmplArr[IntCount][3]:=Qry.FieldValues['reason'];
      EmplArr[IntCount][4]:=Qry.FieldValues['phone_no'];
      EmplArr[IntCount][5]:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['form_id']<>NULL then EmplArr[IntCount][6]:=Qry.FieldValues['form_id'];
      if Qry.FieldValues['totalvalue']<>NULL then EmplArr[IntCount][7]:='KS :Rp.'+IToCurr(Qry.FieldValues['totalvalue'])+' Sisa : '+IToCurr(Qry.FieldValues['value']);
      Inc(IntCount);
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

procedure TEmployeeUnHold.RefreshGrid;
var Count:Integer;
begin
  if Length(EmplArr)>0 then GridMitra.RowCount:=Length(EmplArr)+1;
  for Count:=0 to Length(EmplArr)-1 do begin
     GridMitra.Cells[0,Count+1]:=EmplArr[Count][0];
     GridMitra.Cells[1,Count+1]:=EmplArr[Count][1];
     GridMitra.Cells[2,Count+1]:=EmplArr[Count][2];
     GridMitra.Cells[3,Count+1]:=EmplArr[Count][3];
     if CompanyId=3 then begin
       GridMitra.Cells[4,Count+1]:=EmplArr[Count][7];
     end;
  end;
end;

procedure TEmployeeUnHold.DisableInput;
begin
  Simpan.Enabled:=False;
  Driver.Enabled:=False;
end;

procedure TEmployeeUnHold.EnableInput;
begin
  Simpan.Enabled:=True;
  Driver.Enabled:=True;
end;

procedure TEmployeeUnHold.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeUnHold.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeUnHold.GridMitraSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeUnHold.GridMitraDblClick(Sender: TObject);
var IntCount:Integer;
begin
  Driver.ItemIndex:=Driver.Items.IndexOf(GridMitra.Cells[0,IntRow]);
  if Driver.Text<>'' then
    for IntCount:=0 to Length(EmplArr)-1 do
      if Driver.Text=EmplArr[IntCount][0] then
          DriverDisp.Text:=EmplArr[IntCount][1];
end;

procedure TEmployeeUnHold.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
end;

procedure TEmployeeUnHold.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrDriverId:String;
    IntCount:Integer;
    IsConfirm,IsOk:Boolean;
begin
  if (Driver.Text<>'') then begin
    StrDriverId:=Driver.Text;
    Main.M_Busy;
    if LeftStr(EmplArr[ArrayIndexOf(EmplArr,StrDriverId,0)][6],3)='SPJ' then begin
      MessageBox(0,PChar('Mitra ini tidak dapat beroperasi '+Chr(13)+Chr(13)+'Sebab: '+EmplArr[ArrayIndexOf(EmplArr,StrDriverId,0)][3]),'Operasi Kembali',MB_OK or MB_ICONWARNING);
      IsConfirm:=False;
    end;
    If MessageBox(0,PChar('Yakin Mau lepaskan '+Chr(13)+EmplArr[ArrayIndexOf(EmplArr,StrDriverId,0)][1]+Chr(13)+'dari daftar penangguhan '+StrList+'?'),PChar(StrCaption),MB_OKCANCEL or MB_ICONQUESTION)=1 then IsConfirm:=True
    else IsConfirm:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if (Main.OpenDb) and (IsConfirm=True) then begin
      IsOk:=True;
      Main.TransStart;
      StrQry:='UPDATE wh_empl_hold SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE employee_id='+QuotedStr(StrDriverId)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do IsOk:=False;
      end;
      if IsOk=True then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil Disimpan',PChar(StrCaption),MB_OKCANCEL or MB_ICONINFORMATION);
        Init;
        InitGrid;
        RefreshCombo;
        RefreshGrid;
      end else begin
        Main.TransRollback;
        MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'   Silahkan Coba Lagi',PChar(StrCaption),MB_OK or MB_ICONERROR)
      end;
      Qry.Destroy;
    end;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TEmployeeUnHold.DriverChange(Sender: TObject);
var IntCount:Integer;
begin
  if Driver.Text<>'' then
    for IntCount:=0 to Length(EmplArr)-1 do
      if Driver.Text=EmplArr[IntCount][0] then
        DriverDisp.Text:=EmplArr[IntCount][1];
end;

procedure TEmployeeUnHold.CariChange(Sender: TObject);
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
          for Count4:=0 to 3 do
          GridMitra.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Driver.Items.Add(EmplArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

end.
