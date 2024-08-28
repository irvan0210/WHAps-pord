unit AttandanceLeaveListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TAttandanceLeaveList = class(TForm)
    Cari: TEdit;
    Label1: TLabel;
    Keluar: TButton;
    ToXCel: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Total: TEdit;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    AttLeaveArr:Array of TArrString10;
    CompanyArr,GroupArr:Array of TArrString5;
    OrderBy,Sorted:String;
    IntRow,IntCol,EmplType:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    VhcType:Integer;
    constructor Create(AOwner:TComponent;Emply_Type:String;Form_Request:String='');Overload;
    procedure RefreshList;
    procedure ClearCari;
  end;

var
  AttandanceLeaveList: TAttandanceLeaveList;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleFormU, WorkOrderFormU,
  VehicleEquipmentFormU, VehicleEquipmentCheckU, ServiceRequestFormU,
  MaintenanceServiceFormU, BlockUnitFormU, VehicleTopUpKuotaFormU, 
  VehicleInsuranceU, AttandanceLeaveFormU;

{$R *.dfm}

constructor TAttandanceLeaveList.Create(AOwner:TComponent;Emply_Type:String;Form_Request:String='');
begin
  if UpperCase(Emply_Type)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(Emply_Type)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(Emply_Type)='BUS2' then begin
    EmplType:=4;
  end else if UpperCase(Emply_Type)='GRAYLINE' then begin
    EmplType:=2;
  end else if UpperCase(Emply_Type)='OFFICE' then begin
    EmplType:=3;
  end;

  FormRequest:=Form_Request;
  //EmplyType:=Emply_Type;
  Main.WriteLog('Form Open: AttandanceLeaveList EmplyType='+Emply_Type+' FormRequest='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TAttandanceLeaveList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TAttandanceLeaveList.Init;
var IntCount:Integer;
begin

  MaxCol:=6;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='No Karyawan';
  StrGrid.Cells[2,0]:='Nama Karyawan';
  StrGrid.Cells[3,0]:='Jenis';
  StrGrid.Cells[4,0]:='Keterangan';
  StrGrid.Cells[5,0]:='Tgl. Cuti';


  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=50;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=300;


  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TAttandanceLeaveList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
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

end;

procedure TAttandanceLeaveList.RefreshList;
var Count,Count2:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy:String;
    QVhc:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(AttLeaveArr)-1 do begin
    for Count2:=0 to 12 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(AttLeaveArr,0);
  StrLocation:='@LocationId='+CompanyArr[SBU.ItemIndex][2];


  QVhc:=TADOQuery.Create(Self);
  QVhc.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetAttandanceLeave '+StrLocation+',@isDetail=0,@EmploymentTypeId='+IntToStr(EmplType)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    QVhc.SQL.Add(StrQry);
    QVhc.Open;
    Count:=0;

    if (QVhc.RecordCount>0) then while not(QVhc.Eof) do begin
      SetLength(AttLeaveArr,Count+1);
        AttLeaveArr[Count][0]:=QVhc.FieldValues['attandance_leave_id'];
        AttLeaveArr[Count][1]:=QVhc.FieldValues['employee_id'];
        AttLeaveArr[Count][2]:=QVhc.FieldValues['NamaKaryawan'];

        AttLeaveArr[Count][3]:=QVhc.FieldValues['jenis'];

        if QVhc.FieldValues['description']<>NULL then
          AttLeaveArr[Count][4]:=QVhc.FieldValues['description'];
        if QVhc.FieldValues['tgl_cuti']<>NULL then
          AttLeaveArr[Count][5]:=QVhc.FieldValues['tgl_cuti'];

        QVhc.Next;
        Inc(Count);
    end;
    QVhc.Close;
  end;
  Main.CloseDb;
  QVhc.Destroy;
  if Length(AttLeaveArr)>0 then StrGrid.RowCount:=Length(AttLeaveArr)+1
  else StrGrid.RowCount:=2;

  For Count:=0 to Length(AttLeaveArr)-1 do begin
    for Count2:=0 to 5 do
      StrGrid.Cells[Count2,Count+1]:=AttLeaveArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(AttLeaveArr));
  Main.M_Normal;
end;

procedure TAttandanceLeaveList.KeluarClick(Sender: TObject);
begin
  AttandanceLeaveList.Close;
end;

procedure TAttandanceLeaveList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAttandanceLeaveList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(AttLeaveArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
      if (StrPos(PChar(UpperCase(AttLeaveArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4,Count2-1]:=AttLeaveArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end else
    RefreshList;
end;

procedure TAttandanceLeaveList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TAttandanceLeaveList.StrGridDblClick(Sender: TObject);
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
      if StrGrid.Cells[0,IntRow]<>'' then
        AttandanceLeaveForm:=TAttandanceLeaveForm.Create(Self, StrGrid.Cells[0,IntRow], True);

    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        if StrGrid.Cells[0,IntRow]<>'' then
          AttandanceLeaveForm:=TAttandanceLeaveForm.Create(Self, StrGrid.Cells[0,IntRow]);
        //AttandanceLeaveForm.SetAttLeaveId(StrGrid.Cells[0,IntRow]);
      end;
    end;
  end;
end;

procedure TAttandanceLeaveList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TAttandanceLeaveList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TAttandanceLeaveList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TAttandanceLeaveList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
