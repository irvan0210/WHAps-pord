unit BudgetCreateU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ADODB, ExtCtrls;

type
  TBudgetCreate = class(TForm)
    Selesai: TButton;
    GroupDetail: TGroupBox;
    Label2: TLabel;
    SBU: TComboBox;
    COAId: TComboBox;
    Simpan: TButton;
    Proyeksi: TEdit;
    GridCOA: TZColorStringGrid;
    Label1: TLabel;
    Department: TComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Bersihkan: TButton;
    Label4: TLabel;
    Month: TComboBox;
    Rubah: TButton;
    Year: TEdit;
    Label5: TLabel;
    Total: TMemo;
    Panel1: TPanel;
    DepartmentDisp: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridCOASelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure COAIdExit(Sender: TObject);
    procedure ProyeksiKeyPress(Sender: TObject; var Key: Char);
    procedure ProyeksiExit(Sender: TObject);
    procedure ProyeksiEnter(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure COAIdChange(Sender: TObject);
    procedure COAIdKeyPress(Sender: TObject; var Key: Char);
    procedure DepartmentChange(Sender: TObject);
    procedure GridCOAKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure MonthChange(Sender: TObject);
    procedure RubahClick(Sender: TObject);
    procedure YearKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;IsView_Only:Boolean=True);Overload;
  end;

var
  BudgetCreate: TBudgetCreate;
  MinRowGrid,IntRow,IntCol,MaxCol:Integer;
  CompanyArr,DepartmentArr,COAArr:Array of TArrString5;
  IsChange,IsChangeEnable,IsViewOnly:Boolean;

implementation

uses MainU, StrUtils;

{$R *.dfm}

constructor TBudgetCreate.Create(AOwner:TComponent;IsView_Only:Boolean=True);
begin
  IsViewOnly:=IsView_Only;
  inherited Create(AOwner);
end;

procedure TBudgetCreate.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  MinRowGrid:=0;
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  DepartmentDisp.Text:='';
  COAId.Items.Clear;
  COAId.Text:='';
  COAId.ItemIndex:=-1;
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Rubah.Enabled:=False;
  Simpan.Enabled:=False;

  IsChange:=False;
//  if (RightStr(IntToStr(TreeTag),2)='02') then IsChangeEnable:=True else IsChangeEnable:=False;
  if (RightStr(IntToStr(TreeTag),2)='04') then begin
    //IsViewOnly:=True;
    MaxCol:=5;
  end else begin
    //IsViewOnly:=False;
    MaxCol:=5;
  end;
  Year.Text:='';
  Total.Text:='';
  Year.Text:=FormatDateTime('yyyy',Now());
end;

procedure TBudgetCreate.InitGrid;
var IntCount:Integer;
begin
  GridCOA.RowCount:=2;
  GridCOA.ColCount:=MaxCol;
  GridCOA.ColWidths[0]:=20;
  GridCOA.ColWidths[1]:=200;
  GridCOA.ColWidths[2]:=400;
  GridCOA.ColWidths[3]:=100;
  GridCOA.Cells[0,0]:='No';
  GridCOA.Cells[1,0]:='COA';
  GridCOA.Cells[2,0]:='Keterangan';
  GridCOA.Cells[3,0]:='Proyeksi';
  GridCOA.CellStyle[0,0].HorizontalAlignment:=taCenter;
  GridCOA.CellStyle[1,0].HorizontalAlignment:=taCenter;
  GridCOA.CellStyle[2,0].HorizontalAlignment:=taCenter;
  GridCOA.CellStyle[3,0].HorizontalAlignment:=taCenter;
  //if IsViewOnly then begin
    GridCOA.ColWidths[4]:=100;
    GridCOA.Cells[4,0]:='Actual';
    GridCOA.CellStyle[4,0].HorizontalAlignment:=taCenter;
    GridCOA.CellStyle[4,1].HorizontalAlignment:=taRightJustify;
  //end;
  for IntCount:=0 to MaxCol do
    GridCOA.Cells[IntCount,1]:='';
  GridCOA.CellStyle[3,1].HorizontalAlignment:=taRightJustify;
end;

procedure TBudgetCreate.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
//    StrQry:='SELECT * FROM wh_company WHERE active=1';
    StrQry:='EXEC GetCompanyLocationList;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_id'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount+1);
    DepartmentArr[0][0]:='00';
    DepartmentArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_coa WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(COAArr,Qry.RecordCount+1);
    COAArr[0][0]:=' ';
    COAArr[0][1]:='';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      COAArr[IntCount][0]:=Qry.FieldValues['coa_id'];
      COAArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
  for IntCount:=0 to Length(DepartmentArr)-1 do
    Department.Items.Add(DepartmentArr[IntCount][0]);
  for IntCount:=0 to Length(COAArr)-1 do
    COAId.Items.Add(COAArr[IntCount][0]);
  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
  Main.M_Normal;
end;

procedure TBudgetCreate.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TBudgetCreate.GridCOASelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if Not(IsViewOnly) then begin
    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := GridCOA.CellRect(ACol, ARow);
      R.Left := R.Left + GridCOA.Left;
      R.Right := R.Right + GridCOA.Left;
      R.Top := R.Top + GridCOA.Top;
      R.Bottom := R.Bottom + GridCOA.Top;
      with COAId do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(GridCOA.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(GridCOA.Cells[ACol,ARow]);
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 3) and (ARow > MinRowGrid) then begin
      R := GridCOA.CellRect(ACol, ARow);
      R.Left := R.Left + GridCOA.Left;
      R.Right := R.Right + GridCOA.Left;
      R.Top := R.Top + GridCOA.Top;
      R.Bottom := R.Bottom + GridCOA.Top;
      with Proyeksi do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(GridCOA.Cells[ACol,ARow])<>'' then Proyeksi.Text:=ToString(GridCOA.Cells[ACol,ARow]);
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
  end;
end;

procedure TBudgetCreate.COAIdExit(Sender: TObject);
begin
  if (COAId.Text<>'') then begin
    GridCOA.Cells[IntCol,IntRow]:=COAId.Text;
  end;
  if COAId.Text=' ' then begin
    GridCOA.Cells[3,IntRow]:='';
  end;
  COAId.Visible := False;
  COAId.Text:='';
  COAId.ItemIndex:=-1;
  GridCOA.SetFocus;
end;

procedure TBudgetCreate.ProyeksiKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    ProyeksiExit(nil);
    if GridCOA.Row=GridCOA.RowCount-1 then begin
      GridCOA.RowCount:=GridCOA.RowCount+1;
      for IntCount:=0 to 3 do GridCOA.Cells[IntCount,GridCOA.RowCount-1]:='';
      GridCOA.CellStyle[3,GridCOA.RowCount-1].HorizontalAlignment:=taRightJustify;
    end;
    GridCOA.Row:=GridCOA.Row+1;
    GridCOA.Col:=1;
  end;
  if (Key=#27) then begin
    ProyeksiExit(nil);
  end;
end;

procedure TBudgetCreate.ProyeksiExit(Sender: TObject);
begin
  if Trim(Proyeksi.Text)<>'' then begin
    Proyeksi.Text:=SToCurr(ToString(Proyeksi.Text));
    GridCOA.Cells[IntCol,IntRow]:=Proyeksi.Text;
    Calculate;
  end;
  Proyeksi.Text:='';
  Proyeksi.Visible := False;
  GridCOA.SetFocus;
end;

procedure TBudgetCreate.ProyeksiEnter(Sender: TObject);
begin
  if Trim(Proyeksi.Text)<>'' then Proyeksi.Text:=ToString(Proyeksi.Text);
end;

procedure TBudgetCreate.SBUChange(Sender: TObject);
begin
  if (Trim(SBU.Text)<>'') then begin
    RefreshGrid;
  end;
end;

procedure TBudgetCreate.DepartmentChange(Sender: TObject);
begin
  if Trim(Department.Text)<>'' then begin
    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
    RefreshGrid;
  end;
end;

procedure TBudgetCreate.COAIdChange(Sender: TObject);
begin
  if (COAId.Text<>'') then begin
    GridCOA.Cells[2,IntRow]:=COAArr[COAId.ItemIndex][1];
  end;
  Calculate;
end;

procedure TBudgetCreate.Calculate;
var IntCount,IntNum,IntTotal:Integer;
begin
//  if (Trim(GridCOA.Cells[2,IntRow])<>'') then begin
    IntNum:=0;
    for IntCount:=1 to GridCOA.RowCount-1 do
      if (Trim(GridCOA.Cells[2,IntCount])<>'') then begin
        Inc(IntNum);
        GridCOA.Cells[0,IntCount]:=IntToStr(IntNum);
      end else
        GridCOA.Cells[0,IntCount]:='';
//    GridCOA.Cells[0,IntRow]:=IntToStr(IntNum);
//  end;
  IntTotal:=0;
  for IntCount:=1 to GridCOA.RowCount-1 do
    if (Trim(GridCOA.Cells[3,IntCount])<>'') AND (Trim(GridCOA.Cells[3,IntCount])<>'0') then
      IntTotal:=IntTotal+SToInt(ToString(GridCOA.Cells[3,IntCount]));
  Total.Text:=IToCurr(IntTotal);
end;

procedure TBudgetCreate.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetCreate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TBudgetCreate.COAIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    COAIdExit(nil);
    GridCOA.Col:=2;
  end;
end;

procedure TBudgetCreate.GridCOAKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and (GridCOA.Col=2) then GridCOA.Col:=3;
end;

procedure TBudgetCreate.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrDepartmentId,StrEMessage,StrMonth,StrYear,StrLocationId,StrLocationIds:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(SBU.Text)<>'') AND (Trim(Department.Text)<>'') AND (Trim(Month.Text)<>'') AND (Trim(Year.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      IsOk:=True;
      StrQry:='';
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrDepartmentId:=Department.Text;
      StrLocationId:=CompanyArr[SBU.ItemIndex][2];
      StrMonth:=Format('%.*d',[2,Month.ItemIndex+1]);
      StrLocationIds:=Format('%.*d',[2,StrToInt(StrLocationId)]);
      StrYear:=Year.Text;
      if IsChange then begin
        StrQry:='DELETE FROM wh_budget WHERE company_id='+QuotedStr(StrCompanyId)+' AND location_id='+QuotedStr(StrLocationId)+
        ' AND department_id='+QuotedStr(StrDepartmentId)+' AND month='+StrMonth+';';
      end;
      for IntCount:=1 to GridCOA.RowCount-1 do begin
        if Trim(GridCOA.Cells[2,IntCount])<>'' then begin
          StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                  ' ,year,coa_id,value,update_user) '+
                  ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+GridCOA.Cells[1,IntCount])+
                  ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                  ','+StrMonth+','+StrYear+','+QuotedStr(GridCOA.Cells[1,IntCount])+
                  ','+ToString(GridCOA.Cells[3,IntCount])+','+QuotedStr(User)+');';
        end;
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,PChar('Budget Berhasil Disimpan'),'Pembuatan Budget',MB_OK or MB_ICONINFORMATION);
        DisableInput;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Budget Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Pembuatan Budget',MB_OK or MB_ICONERROR);
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else
    MessageBox(0,'Silahkan Lengkapi Kolom Yang kosong','Pembuatan Budget',MB_OK or MB_ICONERROR);
end;

procedure TBudgetCreate.DisableInput;
begin
  GridCOA.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TBudgetCreate.EnableInput;
begin
  GridCOA.Enabled:=True;
  GroupDetail.Enabled:=True;
  if Not(IsViewOnly) then Simpan.Enabled:=True;
end;

procedure TBudgetCreate.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  EnableInput;
end;

procedure TBudgetCreate.RefreshGrid;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
    IntCount,IntTotal:Integer;
begin
  if (Trim(SBU.Text)<>'') AND (Trim(Department.Text)<>'') AND (Trim(Month.Text)<>'') AND (Trim(Year.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrLocationId:=CompanyArr[SBU.ItemIndex][2];
      StrQry:='EXEC GetBudget '+StrCompanyId+','+StrLocationId+','+QuotedStr(Department.Text)+','+IntToStr(Month.ItemIndex+1)+','+Year.Text+';';
      Qry.SQL.Add(StrQry);
      IntCount:=1;
      IntTotal:=0;
      Qry.Open;
      InitGrid;
      if Qry.RecordCount>0 then begin
        GridCOA.RowCount:=Qry.RecordCount+1;
        while Not(Qry.Eof) do begin
          GridCOA.Cells[0,IntCount]:=IntToStr(IntCount);
          GridCOA.Cells[1,IntCount]:=Qry.FieldValues['coa_id'];
          GridCOA.Cells[2,IntCount]:=Qry.FieldValues['name'];
          GridCOA.Cells[3,IntCount]:=SToCurr(Qry.FieldValues['value']);
          GridCOA.CellStyle[3,IntCount].HorizontalAlignment:=taRightJustify;
          GridCOA.Cells[4,IntCount]:=SToCurr(Qry.FieldValues['budget_used']);
          GridCOA.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
          IntTotal:=IntTotal+Qry.FieldValues['value'];
          Inc(IntCount);
          Qry.Next;
        end;
        if Not(IsViewOnly) then GridCOA.Enabled:=False;
        Simpan.Enabled:=False;

        if IsViewOnly then Begin
          Rubah.Enabled:=False;
          Simpan.Enabled:=False;
          GridCOA.Enabled:=False;
        end else begin
          Rubah.Enabled:=True;
        end;

        Total.Text:=IToCurr(IntTotal);
      end else begin
        Total.Text:='';
        GridCOA.Enabled:=True;
        if Not(IsViewOnly) then begin
          Simpan.Enabled:=True;
        end else begin
          GridCOA.RowCount:=2;
          for IntCount:=0 to 3 do GridCOA.Cells[IntCount,1]:='';
        end;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TBudgetCreate.MonthChange(Sender: TObject);
begin
  RefreshGrid;
end;

procedure TBudgetCreate.RubahClick(Sender: TObject);
var IntCount:Integer;
begin
  IsChange:=True;
  GridCOA.RowCount:=GridCOA.RowCount+1;
  for IntCount:=0 to 3 do GridCOA.Cells[IntCount,GridCOA.RowCount-1]:='';
  GridCOA.CellStyle[3,GridCOA.RowCount-1].HorizontalAlignment:=taRightJustify;
  GridCOA.Row:=GridCOA.RowCount-1;
  GridCOA.Col:=1;
  GridCOA.Enabled:=True;
  Simpan.Enabled:=True;
  Rubah.Enabled:=False;
end;

procedure TBudgetCreate.YearKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;



end.
