unit BrowseEmployeeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WHUnit, StdCtrls, ExtCtrls, Grids, ZColorStringGrid, ADODB;

type
  TBrowseEmployee = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    KolomCari: TEdit;
    StrGrid: TZColorStringGrid;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TEdit;
    PanelJenis: TPanel;
    Label3: TLabel;
    Jenis: TComboBox;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    CheckSelect: TCheckBox;
    Label2: TLabel;
    MemDriverdiPilih: TMemo;
    Submit: TButton;
    chk1: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KolomCariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure SubmitClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    EmployeeArr:Array of TArrString30;
    CompanyArr,JenisArr:Array of TArrString5;
    IntRow,IntCol,IntMinRow:Integer;
    EmplType,StrCompanyId:Integer;
    Stat:Integer;
    Expd:Integer;
    IsInput,Initiation:Boolean;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='');Overload;
    procedure RefreshList;
  end;

var
  BrowseEmployee: TBrowseEmployee;

implementation

uses MainU, EmployeeHistoryTrainingFormU;

{$R *.dfm}
constructor TBrowseEmployee.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='');
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
  end else if UpperCase(EmployeeType)='GRAYLINE' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='OFFICE' then begin
    EmplType:=3;
  end;
  Stat:=Status;
  Expd:=Expired;
  Initiation:=True;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TBrowseEmployee.Init;
var IntCount:Integer;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  IntMinRow:=1;

  Case EmplType of
    1:begin
        Caption:='Data Mitra';
        PanelJenis.Visible:=True;
      end;
    2:begin
        Caption:='Data Driver';
        PanelJenis.Visible:=False;

      end;
    3:begin
        Caption:='Data Karyawan';
        PanelJenis.Visible:=False;
      end;
    4:begin
        Caption:='Data Busboy';
        PanelJenis.Visible:=False;
      end;
  end;
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=75;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=300;
  StrGrid.ColWidths[5]:=90;

  StrGrid.Cells[0,0]:='Cek';
  StrGrid.Cells[1,0]:='NIP';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Tanggal Lahir';
  StrGrid.Cells[4,0]:='Alamat';
  StrGrid.Cells[5,0]:='No Telpon';
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 6 do
    StrGrid.Cells[IntCount,1]:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TBrowseEmployee.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
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
  Main.M_Normal;
{  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
}
end;

procedure TBrowseEmployee.RefreshList;
var Count,Count2:Integer;
    StrQry,StrLocationId,StrStat,StrExpd,StrReguler:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 16 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(EmployeeArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrLocationId:=','+CompanyArr[SBU.ItemIndex][2];
    StrStat:=','+IntToStr(Stat);
    if Expd>0 then StrExpd:=','+IntToStr(Expd) else StrExpd:='';
    if PanelJenis.Visible then begin
      if Jenis.Text<>'2' then StrReguler:=',@Reguler='+JenisArr[Jenis.ItemIndex][0] else StrReguler:='';
    end else StrReguler:='';
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocationId+StrStat+StrExpd+StrReguler+',@CompanyId='+CompanyId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(EmployeeArr,Count+1);
      EmployeeArr[Count][0]:='';
      EmployeeArr[Count][1]:=Qry.FieldValues['employee_id'];
      EmployeeArr[Count][2]:=Qry.FieldValues['name'];
      if Qry.FieldValues['birth']<>NULL then
        EmployeeArr[Count][3]:=Qry.FieldValues['birth'];
      if Qry.FieldValues['address']<>NULL then
        EmployeeArr[Count][4]:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone']<>NULL then
        EmployeeArr[Count][5]:=Qry.FieldValues['phone'];


      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if Length(EmployeeArr)>0 then
    StrGrid.RowCount:=Length(EmployeeArr)+1
  else
    StrGrid.RowCount:=2;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 24 do
      StrGrid.Cells[Count2,Count+1]:=EmployeeArr[Count][Count2];
    if EmployeeArr[Count][23]<>'' then
      if StrToInt(EmployeeArr[Count][24])>=1 then for Count2:=0 to 24 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clRed
    else for Count2:=0 to 24 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clWindowText;
  end;
  Total.Text:=IntToStr(Length(EmployeeArr));
  Main.M_Normal;
end;


procedure TBrowseEmployee.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBrowseEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBrowseEmployee.KolomCariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(KolomCari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=1 to 3 do
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

procedure TBrowseEmployee.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;

  if (ARow > MinRowGrid) And (StrGrid.Cells[1,ARow]<>'')  then begin
    R := StrGrid.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid.Left;
    R.Right := R.Right + StrGrid.Left;
    R.Top := R.Top + StrGrid.Top;
    R.Bottom := R.Bottom + StrGrid.Top;
    case ACol of
      0 :with CheckSelect do begin
          Left:=R.Left + 9;
          Top := R.Top + 1;
          Width :=17;
          Height :=17;
          if StrGrid.Cells[ACol,ARow]='v' then begin
            Checked:=True;
          end else begin
            Checked:=False;
          end;
          Visible:= True;
          BringToFront;
          SetFocus;
        end;
    end;
  end;

end;

procedure TBrowseEmployee.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
  Initiation:=False;
end;

procedure TBrowseEmployee.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
    MemDriverdiPilih.Text:= StrGrid.Cells[2,IntRow];
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TBrowseEmployee.SubmitClick(Sender: TObject);
var
  IntCount,IntRowCount,rowcount2:Integer;
  EmplName,EmplID : string;
begin
  for IntCount:=1 to StrGrid.RowCount-1 do begin
    if StrGrid.Cells[0,IntCount]='v' then begin
      IntRowCount:=EmployeeHistoryTrainingForm.StrGridPeserta.RowCount+1;
      EmployeeHistoryTrainingForm.StrGridPeserta.RowCount:=IntRowCount;
      with EmployeeHistoryTrainingForm do begin
        EmplName:= StrGrid.Cells[2,IntCount];
        EmplID:= StrGrid.Cells[1,IntCount];
        rowcount2:=StrGridPeserta.RowCount;
        StrGridPeserta.Cells[0,StrGridPeserta.RowCount-1]:=EmplID;
        StrGridPeserta.Cells[1,StrGridPeserta.RowCount-1]:=EmplName;
      end;
    end;
  end;
  EmployeeHistoryTrainingForm.Total.Text:=IntToStr(EmployeeHistoryTrainingForm.StrGridPeserta.RowCount-1);
  Close;
end;

procedure TBrowseEmployee.chk1Click(Sender: TObject);
var
  intCount:Integer;
begin
    if chk1.Checked=false then begin
      for intCount:=1 to StrGrid.RowCount-1 do begin
        StrGrid.Cells[0,intCount]:='';
      end;
    end else begin
      for intCount:=1 to StrGrid.RowCount-1 do begin
          StrGrid.Cells[0,intCount]:='v';
      end;
    end;
end;

end.
