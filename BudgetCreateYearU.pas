unit BudgetCreateYearU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, ExtCtrls, StdCtrls, WHUnit, ADODB;

type
  TBudgetCreateYear = class(TForm)
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    SBU: TComboBox;
    Department: TComboBox;
    Year: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    GroupBulan: TGroupBox;
    Label3: TLabel;
    Jan: TMemo;
    Label4: TLabel;
    Feb: TMemo;
    Mar: TMemo;
    Apr: TMemo;
    Mei: TMemo;
    Jun: TMemo;
    Jul: TMemo;
    Aug: TMemo;
    Sep: TMemo;
    Okt: TMemo;
    Nov: TMemo;
    Des: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    COAId: TComboBox;
    Panel1: TPanel;
    DepartmentDisp: TEdit;
    COADisp: TEdit;
    StrGrid: TZColorStringGrid;
    ActJan: TMemo;
    ActFeb: TMemo;
    ActMar: TMemo;
    ActApr: TMemo;
    ActMei: TMemo;
    ActJun: TMemo;
    ActJul: TMemo;
    ActAug: TMemo;
    ActSep: TMemo;
    ActOkt: TMemo;
    ActNov: TMemo;
    ActDes: TMemo;
    procedure YearKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure COAIdChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure JanEnter(Sender: TObject);
    procedure JanExit(Sender: TObject);
    procedure FebEnter(Sender: TObject);
    procedure MarEnter(Sender: TObject);
    procedure AprEnter(Sender: TObject);
    procedure MeiEnter(Sender: TObject);
    procedure JunEnter(Sender: TObject);
    procedure JulExit(Sender: TObject);
    procedure AugExit(Sender: TObject);
    procedure SepExit(Sender: TObject);
    procedure OktExit(Sender: TObject);
    procedure FebExit(Sender: TObject);
    procedure MarExit(Sender: TObject);
    procedure AprExit(Sender: TObject);
    procedure MeiExit(Sender: TObject);
    procedure JunExit(Sender: TObject);
    procedure JulEnter(Sender: TObject);
    procedure AugEnter(Sender: TObject);
    procedure SepEnter(Sender: TObject);
    procedure OktEnter(Sender: TObject);
    procedure NovEnter(Sender: TObject);
    procedure DesEnter(Sender: TObject);
    procedure NovExit(Sender: TObject);
    procedure DesExit(Sender: TObject);
    procedure JanKeyPress(Sender: TObject; var Key: Char);
    procedure FebKeyPress(Sender: TObject; var Key: Char);
    procedure MarKeyPress(Sender: TObject; var Key: Char);
    procedure AprKeyPress(Sender: TObject; var Key: Char);
    procedure MeiKeyPress(Sender: TObject; var Key: Char);
    procedure JunKeyPress(Sender: TObject; var Key: Char);
    procedure JulKeyPress(Sender: TObject; var Key: Char);
    procedure AugKeyPress(Sender: TObject; var Key: Char);
    procedure SepKeyPress(Sender: TObject; var Key: Char);
    procedure OktKeyPress(Sender: TObject; var Key: Char);
    procedure NovKeyPress(Sender: TObject; var Key: Char);
    procedure DesKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;IsView_Only:Boolean=True);
  end;

var
  BudgetCreateYear: TBudgetCreateYear;
  IsChange,IsChangeEnable,IsViewOnly:Boolean;
  CompanyArr,DepartmentArr,COAArr:Array of TArrString5;
  MinRowGrid,IntRow,IntCol,MaxCol:Integer;

implementation

uses MainU,StrUtils;

{$R *.dfm}
constructor TBudgetCreateYear.Create(AOwner:TComponent;IsView_Only:Boolean=True);
begin
  IsViewOnly:=IsView_Only;
  inherited Create(AOwner);
end;

procedure TBudgetCreateYear.Init;
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
  COADisp.Text:='';
  IsChange:=False;
  //if (RightStr(IntToStr(TreeTag),2)='02') then IsChangeEnable:=True else IsChangeEnable:=False;
  MaxCol:=3;
  Year.Text:='';
  Year.Text:=FormatDateTime('yyyy',Now());
  Jan.Text:='';
  Feb.Text:='';
  Mar.Text:='';
  Apr.Text:='';
  Mei.Text:='';
  Jun.Text:='';
  Jul.Text:='';
  Aug.Text:='';
  Sep.Text:='';
  Okt.Text:='';
  Nov.Text:='';
  Des.Text:='';
  if IsViewOnly then DisableInput
  else EnableInput;
end;

procedure TBudgetCreateYear.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=MaxCol;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=400;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='COA';
  StrGrid.Cells[2,0]:='Keterangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to MaxCol do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TBudgetCreateYear.RefreshCombo;
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
    StrQry:='SELECT ROW_NUMBER() OVER (ORDER BY coa_id) AS no,* FROM wh_coa WHERE active=1';
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
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
  for IntCount:=0 to Length(DepartmentArr)-1 do
    Department.Items.Add(DepartmentArr[IntCount][0]);
  for IntCount:=0 to Length(COAArr)-1 do
    COAId.Items.Add(COAArr[IntCount][0]);
  Main.M_Normal;
end;

procedure TBudgetCreateYear.RefreshGrid;
var IntCount:Integer;
begin
  for IntCount:=1 to Length(COAArr)-1 do begin
    StrGrid.RowCount:=IntCount;
    StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
    StrGrid.Cells[1,IntCount]:=COAArr[IntCount][0];
    StrGrid.Cells[2,IntCount]:=COAArr[IntCount][1];
  end;
end;

procedure TBudgetCreateYear.DisableInput;
begin
  StrGrid.Enabled:=False;
  //GroupDetail.Enabled:=False;
  GroupBulan.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TBudgetCreateYear.EnableInput;
begin
  StrGrid.Enabled:=True;
  //GroupDetail.Enabled:=True;
  GroupBulan.Enabled:=True;
  if Not(IsViewOnly) then Simpan.Enabled:=True;
end;

procedure TBudgetCreateYear.LoadData;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
begin
  Jan.Text:='';
  Feb.Text:='';
  Mar.Text:='';
  Apr.Text:='';
  Mei.Text:='';
  Jun.Text:='';
  Jul.Text:='';
  Aug.Text:='';
  Sep.Text:='';
  Okt.Text:='';
  Nov.Text:='';
  Des.Text:='';

  ActJan.Text:='';
  ActFeb.Text:='';
  ActMar.Text:='';
  ActApr.Text:='';
  ActMei.Text:='';
  ActJun.Text:='';
  ActJul.Text:='';
  ActAug.Text:='';
  ActSep.Text:='';
  ActOkt.Text:='';
  ActNov.Text:='';
  ActDes.Text:='';
  if (Trim(SBU.Text)<>'') AND (Trim(Department.Text)<>'') AND (Trim(Year.Text)<>'')  AND (Trim(COAId.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrLocationId:=CompanyArr[SBU.ItemIndex][2];
      StrQry:='EXEC GetBudgetYear '+StrCompanyId+','+StrLocationId+','+QuotedStr(Department.Text)+
              ','+QuotedStr(Year.Text)+','+QuotedStr(COAId.Text) +';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
        case Qry.FieldValues['month'] of
          01:begin
              Jan.Text:=SToCurr(Qry.FieldValues['value']);ActJan.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          02:begin
              Feb.Text:=SToCurr(Qry.FieldValues['value']);ActFeb.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          03:begin
              Mar.Text:=SToCurr(Qry.FieldValues['value']);ActMar.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          04:begin
              Apr.Text:=SToCurr(Qry.FieldValues['value']);ActApr.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          05:begin
              Mei.Text:=SToCurr(Qry.FieldValues['value']);ActMei.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          06:begin
              Jun.Text:=SToCurr(Qry.FieldValues['value']);ActJun.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          07:begin
              Jul.Text:=SToCurr(Qry.FieldValues['value']);ActJul.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          08:begin
              Aug.Text:=SToCurr(Qry.FieldValues['value']);ActAug.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          09:begin
              Sep.Text:=SToCurr(Qry.FieldValues['value']);ActSep.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          10:begin
                Okt.Text:=FormatCurr('#,##0', Qry.FieldByName('value').AsCurrency);ActOkt.Text:= FormatCurr('#,##0', Qry.FieldByName('budget_used').AsCurrency);
               //Okt.Text:=CurrToStr(Qry.FieldByName('value').AsCurrency); ActOkt.Text:= SToCurr(Qry.FieldValues['budget_used']);
              //Okt.Text:=SToCurr(Qry.FieldValues['value']);ActOkt.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          11:begin
              Nov.Text:=SToCurr(Qry.FieldValues['value']);ActNov.Text:=SToCurr(Qry.FieldValues['budget_used']);
             End;
          12:begin
              Des.Text:=SToCurr(Qry.FieldValues['value']);ActDes.Text:=SToCurr(Qry.FieldValues['budget_used']);
             end;
        end;
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TBudgetCreateYear.YearKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then COAId.SetFocus;
end;

procedure TBudgetCreateYear.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
end;

procedure TBudgetCreateYear.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBudgetCreateYear.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetCreateYear.DepartmentChange(Sender: TObject);
begin
  if Trim(Department.Text)<>'' then begin
    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
    LoadData;
  end;
end;

procedure TBudgetCreateYear.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TBudgetCreateYear.StrGridDblClick(Sender: TObject);
begin
  COAId.ItemIndex:=COAId.Items.IndexOf(StrGrid.Cells[1,IntRow]);
  if Trim(COAId.Text)<>'' then begin
    COADisp.Text:=COAArr[COAId.ItemIndex][1];
    LoadData;
  end;
end;

procedure TBudgetCreateYear.COAIdChange(Sender: TObject);
begin
  if Trim(COAId.Text)<>'' then begin
    COADisp.Text:=COAArr[COAId.ItemIndex][1];
    LoadData;
  end;
end;

procedure TBudgetCreateYear.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrDepartmentId,StrEMessage,StrYear,StrLocationId,StrLocationIds,StrMonth:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(SBU.Text)<>'') AND (Trim(Department.Text)<>'') AND (Trim(Year.Text)<>'') AND (Trim(COAId.Text)<>'') then begin
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
      StrLocationIds:=Format('%.*d',[2,StrToInt(StrLocationId)]);
      StrYear:=Year.Text;
      StrQry:='';
      StrQry:='DELETE FROM wh_budget WHERE company_id='+QuotedStr(StrCompanyId)+' AND location_id='+QuotedStr(StrLocationId)+
              ' AND department_id='+QuotedStr(StrDepartmentId)+' AND coa_id='+QuotedStr(COAId.Text)+';';
      if Trim(Jan.Text)<>'' then begin
        StrMonth:='01';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Jan.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Feb.Text)<>'' then begin
        StrMonth:='02';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Feb.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Mar.Text)<>'' then begin
        StrMonth:='03';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Mar.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Apr.Text)<>'' then begin
        StrMonth:='04';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Apr.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Mei.Text)<>'' then begin
        StrMonth:='05';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Mei.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Jun.Text)<>'' then begin
        StrMonth:='06';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Jun.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Jul.Text)<>'' then begin
        StrMonth:='07';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Jul.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Aug.Text)<>'' then begin
        StrMonth:='08';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Aug.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Sep.Text)<>'' then begin
        StrMonth:='09';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Sep.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Okt.Text)<>'' then begin
        StrMonth:='10';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Okt.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Nov.Text)<>'' then begin
        StrMonth:='11';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Nov.Text)+','+QuotedStr(User)+');';
      end;
      if Trim(Des.Text)<>'' then begin
        StrMonth:='12';
        StrQry:=StrQry+' INSERT INTO wh_budget (budget_id,company_id,location_id,department_id,month'+
                    ' ,year,coa_id,value,update_user) '+
                    ' VALUES ('+QuotedStr(StrCompanyId+StrDepartmentId+StrLocationIds+StrMonth+StrYear+COAId.Text)+
                    ','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+','+QuotedStr(StrDepartmentId)+
                    ','+StrMonth+','+StrYear+','+QuotedStr(COAId.Text)+
                    ','+ToString(Des.Text)+','+QuotedStr(User)+');';
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

procedure TBudgetCreateYear.JanEnter(Sender: TObject);
begin
  if Trim(Jan.Text)<>'' then Jan.Text:=ToString(Jan.Text);
end;

procedure TBudgetCreateYear.JanExit(Sender: TObject);
begin
  if Trim(Jan.Text)<>'' then Jan.Text:=SToCurr(Jan.Text);
end;

procedure TBudgetCreateYear.FebEnter(Sender: TObject);
begin
  if Trim(Feb.Text)<>'' then Feb.Text:=ToString(Feb.Text);
end;

procedure TBudgetCreateYear.MarEnter(Sender: TObject);
begin
  if Trim(Mar.Text)<>'' then Mar.Text:=ToString(Mar.Text);
end;

procedure TBudgetCreateYear.AprEnter(Sender: TObject);
begin
  if Trim(Apr.Text)<>'' then Apr.Text:=ToString(Apr.Text);
end;

procedure TBudgetCreateYear.MeiEnter(Sender: TObject);
begin
  if Trim(Mei.Text)<>'' then Mei.Text:=ToString(Mei.Text);
end;

procedure TBudgetCreateYear.JunEnter(Sender: TObject);
begin
  if Trim(Jun.Text)<>'' then Jun.Text:=ToString(Jun.Text);
end;

procedure TBudgetCreateYear.JulExit(Sender: TObject);
begin
  if Trim(Jul.Text)<>'' then Jul.Text:=SToCurr(Jul.Text);
end;

procedure TBudgetCreateYear.AugExit(Sender: TObject);
begin
  if Trim(Aug.Text)<>'' then Aug.Text:=SToCurr(Aug.Text);
end;

procedure TBudgetCreateYear.SepExit(Sender: TObject);
begin
  if Trim(Sep.Text)<>'' then Sep.Text:=SToCurr(Sep.Text);
end;

procedure TBudgetCreateYear.OktExit(Sender: TObject);
begin

  if Trim(Okt.Text)<>'' then Okt.Text:=SToCurr(Okt.Text);
end;

procedure TBudgetCreateYear.FebExit(Sender: TObject);
begin
  if Trim(Feb.Text)<>'' then Feb.Text:=SToCurr(Feb.Text);
end;

procedure TBudgetCreateYear.MarExit(Sender: TObject);
begin
  if Trim(Mar.Text)<>'' then Mar.Text:=SToCurr(Mar.Text);
end;

procedure TBudgetCreateYear.AprExit(Sender: TObject);
begin
  if Trim(Apr.Text)<>'' then Apr.Text:=SToCurr(Apr.Text);
end;

procedure TBudgetCreateYear.MeiExit(Sender: TObject);
begin
  if Trim(Mei.Text)<>'' then Mei.Text:=SToCurr(Mei.Text);
end;

procedure TBudgetCreateYear.JunExit(Sender: TObject);
begin
  if Trim(Jun.Text)<>'' then Jun.Text:=SToCurr(Jun.Text);
end;

procedure TBudgetCreateYear.JulEnter(Sender: TObject);
begin
  if Trim(Jul.Text)<>'' then Jul.Text:=ToString(Jul.Text);
end;

procedure TBudgetCreateYear.AugEnter(Sender: TObject);
begin
  if Trim(Aug.Text)<>'' then Aug.Text:=ToString(Aug.Text);
end;

procedure TBudgetCreateYear.SepEnter(Sender: TObject);
begin
  if Trim(Sep.Text)<>'' then Sep.Text:=ToString(Sep.Text);
end;

procedure TBudgetCreateYear.OktEnter(Sender: TObject);
begin
  if Trim(Okt.Text)<>'' then Okt.Text:=ToString(Okt.Text);
end;

procedure TBudgetCreateYear.NovEnter(Sender: TObject);
begin
  if Trim(Nov.Text)<>'' then Nov.Text:=ToString(Nov.Text);
end;

procedure TBudgetCreateYear.DesEnter(Sender: TObject);
begin
  if Trim(Des.Text)<>'' then Des.Text:=ToString(Des.Text);
end;

procedure TBudgetCreateYear.NovExit(Sender: TObject);
begin
  if Trim(Nov.Text)<>'' then Nov.Text:=SToCurr(Nov.Text);
end;

procedure TBudgetCreateYear.DesExit(Sender: TObject);
begin
  if Trim(Des.Text)<>'' then Des.Text:=SToCurr(Des.Text);
end;

procedure TBudgetCreateYear.JanKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Feb.SetFocus;
end;

procedure TBudgetCreateYear.FebKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Mar.SetFocus;
end;

procedure TBudgetCreateYear.MarKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Apr.SetFocus;
end;

procedure TBudgetCreateYear.AprKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Mei.SetFocus;
end;

procedure TBudgetCreateYear.MeiKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Jun.SetFocus;
end;

procedure TBudgetCreateYear.JunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Jul.SetFocus;
end;

procedure TBudgetCreateYear.JulKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Aug.SetFocus;
end;

procedure TBudgetCreateYear.AugKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Sep.SetFocus;
end;

procedure TBudgetCreateYear.SepKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Okt.SetFocus;
end;

procedure TBudgetCreateYear.OktKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Nov.SetFocus;
end;

procedure TBudgetCreateYear.NovKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Des.SetFocus;
end;

procedure TBudgetCreateYear.DesKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TBudgetCreateYear.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshGrid;
end;

end.
