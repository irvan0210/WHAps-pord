unit VehicleInsuranceListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TVehicleInsuranceList = class(TForm)
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
    procedure StrGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VhcInsArr:Array of TArrString10;
    CompanyArr,GroupArr:Array of TArrString5;
    OrderBy,Sorted:String;
    IntRow,IntCol,IntColPrev:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    VhcType:Integer;
    constructor Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');Overload;
    procedure RefreshList;
    procedure ClearCari;
  end;

var
  VehicleInsuranceList: TVehicleInsuranceList;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleFormU, WorkOrderFormU,
  VehicleEquipmentFormU, VehicleEquipmentCheckU, ServiceRequestFormU,
  MaintenanceServiceFormU, BlockUnitFormU, VehicleTopUpKuotaFormU, 
  VehicleInsuranceU;

{$R *.dfm}

constructor TVehicleInsuranceList.Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');
begin

  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: VehicleInsuranceList='+VehicleType+',FormRequest='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TVehicleInsuranceList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleInsuranceList.Init;
var IntCount:Integer;
begin

  MaxCol:=7;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='No Polis';
  StrGrid.Cells[2,0]:='Penerbit Polis';
  StrGrid.Cells[3,0]:='Tanggal Awal';
  StrGrid.Cells[4,0]:='Tanggal Akhir';
  StrGrid.Cells[5,0]:='Nilai Asuransi';
  StrGrid.Cells[6,0]:='No Polisi';


  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=200;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=80;


  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleInsuranceList.RefreshCombo;
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
    StrQry:='EXEC GetGroup '+CompanyId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+1);
    GroupArr[0][0]:='All';
    GroupArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      GroupArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
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

procedure TVehicleInsuranceList.RefreshList;
var Count,Count2:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy:String;
    QVhc:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(VhcInsArr)-1 do begin
    for Count2:=0 to 12 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(VhcInsArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];

  QVhc:=TADOQuery.Create(Self);
  QVhc.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetInsuranceList '+StrLocation+','+StrCompany+';';
    Main.WriteLog('SQL :'+StrQry,2);
    QVhc.SQL.Add(StrQry);
    QVhc.Open;
    Count:=0;

    if (QVhc.RecordCount>0) then while not(QVhc.Eof) do begin
      SetLength(VhcInsArr,Count+1);
        VhcInsArr[Count][0]:=QVhc.FieldValues['vhc_insurance_id'];
        VhcInsArr[Count][1]:=QVhc.FieldValues['insurance_number'];
        VhcInsArr[Count][2]:=QVhc.FieldValues['insurance_name'];


        if QVhc.FieldValues['insurance_from_date']<>NULL then
          VhcInsArr[Count][3]:=QVhc.FieldValues['insurance_from_date'];

        if QVhc.FieldValues['insurance_to_date']<>NULL then
          VhcInsArr[Count][4]:=QVhc.FieldValues['insurance_to_date'];
        if QVhc.FieldValues['insurance_amount']<>NULL then
          VhcInsArr[Count][5]:=SToCurr(QVhc.FieldValues['insurance_amount']);

        VhcInsArr[Count][6]:=QVhc.FieldValues['license_plate'];


        QVhc.Next;
        Inc(Count);
    end;
    QVhc.Close;
  end;
  Main.CloseDb;
  QVhc.Destroy;
  if Length(VhcInsArr)>0 then StrGrid.RowCount:=Length(VhcInsArr)+1
  else StrGrid.RowCount:=2;

  For Count:=0 to Length(VhcInsArr)-1 do begin
    for Count2:=0 to 6 do
      StrGrid.Cells[Count2,Count+1]:=VhcInsArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(VhcInsArr));
  Main.M_Normal;
end;

procedure TVehicleInsuranceList.KeluarClick(Sender: TObject);
begin
  VehicleInsuranceList.Close;
end;

procedure TVehicleInsuranceList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleInsuranceList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VhcInsArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(VhcInsArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 6 do
          StrGrid.Cells[Count4,Count2-1]:=VhcInsArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end else
    RefreshList;
end;

procedure TVehicleInsuranceList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleInsuranceList.StrGridDblClick(Sender: TObject);
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
      VehicleInsurance:=TVehicleInsurance.Create(Self, 'BUS', StrGrid.Cells[0,IntRow]);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        VehicleInsurance:=TVehicleInsurance.Create(Self, 'BUS', StrGrid.Cells[0,IntRow], 'MAIN-CHANGE', False);
      end;
    end;
  end;
end;

procedure TVehicleInsuranceList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleInsuranceList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TVehicleInsuranceList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleInsuranceList.StrGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StrGrid.MouseToCell(X,Y,IntCol,IntRow);
  if (Button=mbRight) and (IntRow=0) then begin
    if (IntCol = IntColPrev) and (Sorted='') then Sorted:=',@Sorted='+QuotedStr('DESC') else Sorted:='';
    IntColPrev:=IntCol;
    case IntCol of
      0:OrderBy:=',@OrderBy='+QuotedStr('vehicle_id');
      1:OrderBy:=',@OrderBy='+QuotedStr('location');
      2:OrderBy:='';
      3:OrderBy:=',@OrderBy='+QuotedStr('engine_id');
      4:OrderBy:=',@OrderBy='+QuotedStr('chasis_id');
      5:OrderBy:=',@OrderBy='+QuotedStr('license_plate');
      6:OrderBy:=',@OrderBy='+QuotedStr('year');
      7:OrderBy:=',@OrderBy='+QuotedStr('chasis_id');
      8:OrderBy:=',@OrderBy='+QuotedStr('stnk');
      9:OrderBy:=',@OrderBy='+QuotedStr('kir');
      10:OrderBy:=',@OrderBy='+QuotedStr('kiu');
      11:OrderBy:=',@OrderBy='+QuotedStr('kio');
    end;
    RefreshList;
  end;
end;

procedure TVehicleInsuranceList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
