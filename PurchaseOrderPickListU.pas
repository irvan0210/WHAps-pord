unit PurchaseOrderPickListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ADODB;

type
  TPurchaseOrderPickList = class(TForm)
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    SBU: TComboBox;
    SBUDisp: TEdit;
    Department: TComboBox;
    DepartmentDisp: TEdit;
    Year: TEdit;
    Label5: TLabel;
    Month: TComboBox;
    Label4: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
    Label3: TLabel;
    Cari: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PurchaseOrderPickList: TPurchaseOrderPickList;
  CompanyArr,DepartmentArr:Array of TArrString4;
  PurchaseRArr:Array of TArrString8;
  IntRow:Integer;

implementation

uses MainU, {PurchaseRequestU,} StrUtils, PurchaseRequestU;

{$R *.dfm}

procedure TPurchaseOrderPickList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Year.Text:='';
  IntRow:=0;
end;

procedure TPurchaseOrderPickList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=400;
  StrGrid.ColWidths[5]:=100;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No PR';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Vendor';
  StrGrid.Cells[4,0]:='Budget';
  StrGrid.Cells[5,0]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 5 do
    StrGrid.Cells[IntCount,1]:='';
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseOrderPickList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['name'];
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
    SBU.Items.Add(CompanyArr[IntCount][0]);
  for IntCount:=0 to Length(DepartmentArr)-1 do
    Department.Items.Add(DepartmentArr[IntCount][0]);
  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
  SBU.ItemIndex:=SBU.Items.IndexOf(CompanyId);
  SBUDisp.Text:=CompanyArr[SBU.ItemIndex][1];
  Department.ItemIndex:=Department.Items.IndexOf(DepartmentId);
  DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
  Main.M_Normal;
end;

procedure TPurchaseOrderPickList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    AwalBulan:='1/'+Month.Text+'/'+Year.Text;
    StrQry:='EXEC GetPurchaseRequestList '+SBU.Text+','+Department.Text+','+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PurchaseRArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PurchaseRArr[IntCount][0]:=Qry.FieldValues['purchase_request_id'];
      PurchaseRArr[IntCount][1]:=Qry.FieldValues['request_dates'];
      PurchaseRArr[IntCount][2]:=Qry.FieldValues['vendor_name'];
      PurchaseRArr[IntCount][3]:=Qry.FieldValues['name'];
      PurchaseRArr[IntCount][4]:=SToCurr(Qry.FieldValues['total']);
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseOrderPickList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PurchaseRArr)>0 then StrGrid.RowCount:=Length(PurchaseRArr)+1;
  for IntCount:=0 to Length(PurchaseRArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PurchaseRArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PurchaseRArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PurchaseRArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PurchaseRArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PurchaseRArr[IntCount][4];
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
  end;

end;


procedure TPurchaseOrderPickList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPurchaseOrderPickList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseOrderPickList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Year.Text:=FormatDateTime('yyyy',Now());
  Month.ItemIndex:=StrToInt(FormatDateTime('mm',Now()))-1;
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderPickList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderPickList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TPurchaseOrderPickList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if (RightStr(IntToStr(TreeTag),2)='02') then PurchaseRequest:=TPurchaseRequest.Create(Self,StrGrid.Cells[1,IntRow],False)
    else PurchaseRequest:=TPurchaseRequest.Create(Self,StrGrid.Cells[1,IntRow],True);
  end;
end;

procedure TPurchaseOrderPickList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(PurchaseRArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
        if (StrPos(PChar(UpperCase(PurchaseRArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          StrGrid.CellStyle[5,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4+1,Count2]:=PurchaseRArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

end.
