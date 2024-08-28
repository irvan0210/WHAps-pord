unit VehicleList2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TVehicleList2 = class(TForm)
    Cari: TEdit;
    Label1: TLabel;
    Keluar: TButton;
    ToXCel: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Total: TEdit;
    StrGrid: TZColorStringGrid;
    Group: TComboBox;
    Label4: TLabel;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    CariOffering: TSpeedButton;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure StrGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SBUChange(Sender: TObject);
    procedure CariOfferingClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VehicleArr:Array of TArrString14;
    CompanyArr,GroupArr:Array of TArrString5;
    OrderBy,Sorted:String;
    VhcGroupId:Integer;
    IntRow,IntCol,IntColPrev:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    VhcType:Integer;
    constructor Create(AOwner:TComponent;Form_Request:String='';VhcGroup_Id:Integer=0);Overload;
    procedure RefreshList;
    procedure Search;
    procedure ClearCari;
  end;

var
  VehicleList2: TVehicleList2;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleForm2U, WorkOrderFormU,
  VehicleEquipmentFormU, VehicleEquipmentCheckU, ServiceRequestFormU,
  MaintenanceServiceFormU, VehicleAdminU;

{$R *.dfm}

constructor TVehicleList2.Create(AOwner:TComponent;Form_Request:String='';VhcGroup_Id:Integer=0);
begin
  FormRequest:=Form_Request;
  VhcGroupId:=VhcGroup_Id;
  Main.WriteLog('Form Open: VehicleList2=FormRequest='+Form_Request+','+IntToStr(VhcGroup_Id),1);
  inherited Create(AOwner);
end;

procedure TVehicleList2.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleList2.Init;
var IntCount:Integer;
begin
  MaxCol:=12;
  VhcCompanyId:=StrToInt(CompanyId);
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='No Bodi';
  StrGrid.Cells[3,0]:='No Mesin';
  StrGrid.Cells[4,0]:='No Rangka';
  StrGrid.Cells[5,0]:='No Polisi';
  StrGrid.Cells[6,0]:='Tahun';
  StrGrid.Cells[7,0]:='STNK s/d';
  StrGrid.Cells[8,0]:='KIR S/d';
  StrGrid.Cells[9,0]:='KIU S/d';
  StrGrid.Cells[10,0]:='KIO S/d';
  StrGrid.Cells[11,0]:='Tera S/d';
  StrGrid.ColWidths[11]:=65;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=120;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=65;
  StrGrid.ColWidths[6]:=40;
  StrGrid.ColWidths[7]:=65;
  StrGrid.ColWidths[8]:=65;
  StrGrid.ColWidths[9]:=65;
  StrGrid.ColWidths[10]:=65;
  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleList2.RefreshCombo;
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
//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND (company_id='+CompanyId+');';
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
  for IntCount:=0 to Length(GroupArr)-1 do begin
    Group.Items.Add(GroupArr[IntCount][1]);
    if GroupArr[IntCount][0]=IntToStr(VhcGroupId) then Group.ItemIndex:=IntCount;
  end;
end;

procedure TVehicleList2.RefreshList;
var Count,Count2:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy:String;
    QVhc:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(VehicleArr)-1 do begin
    for Count2:=0 to 12 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(VehicleArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];
  if (Group.Text<>'All') then StrGroup:=',@BatchId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
  QVhc:=TADOQuery.Create(Self);
  QVhc.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcList '+StrLocation+',0,'+StrCompany+StrGroup+OrderBy+Sorted+';';
    Main.WriteLog('SQL :'+StrQry,2);
    QVhc.SQL.Add(StrQry);
    QVhc.Open;
    Count:=0;
    if (QVhc.RecordCount>0) then while not(QVhc.Eof) do begin
      SetLength(VehicleArr,Count+1);
        VehicleArr[Count][0]:=QVhc.FieldValues['vehicle_id'];
        VehicleArr[Count][1]:=QVhc.FieldValues['location'];
        if QVhc.FieldValues['body_id']<>NULL then
          VehicleArr[Count][2]:=QVhc.FieldValues['body_id'];
        if QVhc.FieldValues['engine_id']<>NULL then
          VehicleArr[Count][3]:=QVhc.FieldValues['engine_id'];
        if QVhc.FieldValues['chasis_id']<>NULL then
        VehicleArr[Count][4]:=QVhc.FieldValues['chasis_id'];
        if IsCharAlpha(PChar(Copy(QVhc.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[Count][5]:=Copy(QVhc.FieldValues['license_plate'],1,1)+' '+Copy(QVhc.FieldValues['license_plate'],2,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],6,Length(QVhc.FieldValues['license_plate'])+1)
        else
          VehicleArr[Count][5]:=Copy(QVhc.FieldValues['license_plate'],1,2)+' '+Copy(QVhc.FieldValues['license_plate'],3,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],7,Length(QVhc.FieldValues['license_plate'])+1);
        if QVhc.FieldValues['year']<>NULL then
          VehicleArr[Count][6]:=QVhc.FieldValues['year'];
//        VehicleArr[Count][7]:=QVhc.FieldValues['vhc_batch_id'];
        if QVhc.FieldValues['stnk']<>NULL then
          VehicleArr[Count][7]:=QVhc.FieldValues['stnk'];
        if QVhc.FieldValues['kir']<>NULL then
          VehicleArr[Count][8]:=QVhc.FieldValues['kir'];
        if QVhc.FieldValues['kiu']<>NULL then
          VehicleArr[Count][9]:=QVhc.FieldValues['kiu'];
        if QVhc.FieldValues['kio']<>NULL then
          VehicleArr[Count][10]:=QVhc.FieldValues['kio'];
        if QVhc.FieldValues['tera']<>NULL then VehicleArr[Count][11]:=QVhc.FieldValues['tera'];
        QVhc.Next;
        Inc(Count);
    end;
    QVhc.Close;
  end;
  Main.CloseDb;
  QVhc.Destroy;
  if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+1
  else StrGrid.RowCount:=2;
  For Count:=0 to Length(VehicleArr)-1 do begin
    for Count2:=0 to 13 do
    StrGrid.Cells[Count2,Count+1]:=VehicleArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(VehicleArr));
  Main.M_Normal;
end;

procedure TVehicleList2.KeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleList2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleList2.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 13 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2-1]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end;// else
    //RefreshList;
end;

procedure TVehicleList2.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleList2.StrGridDblClick(Sender: TObject);
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
        if Main.IsFormOpen('VehicleForm2')=False then VehicleForm2:=TVehicleForm2.Create(Self,StrGrid.Cells[0,IntRow],True);
    end else begin
      if UpperCase(FormRequest)='ADMIN-VEHICLEADD' then begin
        VehicleAdmin.SetVehicleId(StrGrid.Cells[0,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        VehicleForm2:=TVehicleForm2.Create(nil,StrGrid.Cells[0,IntRow],False);
        Close;
      end;
      if UpperCase(FormRequest)='UPDATE-IMAGE' then begin
        VehicleForm2:=TVehicleForm2.Create(nil,StrGrid.Cells[0,IntRow],False,'',True);
        Close;
      end;
    end;
  end;
end;

procedure TVehicleList2.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleList2.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if VhcGroupId=0 then Group.ItemIndex:=Group.Items.IndexOf('All');
  RefreshList;
end;

procedure TVehicleList2.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleList2.StrGridMouseDown(Sender: TObject;
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

procedure TVehicleList2.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleList2.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TVehicleList2.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

end.
