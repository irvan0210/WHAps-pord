unit VehicleListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TVehicleList = class(TForm)
    Cari: TEdit;
    Label1: TLabel;
    Keluar: TButton;
    ToXCel: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Total: TEdit;
    Group: TComboBox;
    Label4: TLabel;
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
    VehicleArr:Array of TArrString32;
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
  VehicleList: TVehicleList;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleFormU, WorkOrderFormU,
  VehicleEquipmentFormU, VehicleEquipmentCheckU, ServiceRequestFormU,
  MaintenanceServiceFormU, BlockUnitFormU, VehicleTopUpKuotaFormU, 
  EmployeeHistoryLakaFormU, RekapPergantianPartperArmadaU;

{$R *.dfm}

constructor TVehicleList.Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');
begin
  if UpperCase(VehicleType)='TAXI' then begin
    VhcType:=1;
    MaxCol:=16;
    VhcCompanyId:=3;
  end else if UpperCase(VehicleType)='BUS' then begin
    VhcType:=2;
    MaxCol:=32;
    VhcCompanyId:=2;
  end else if UpperCase(VehicleType)='GRAYLINE' then begin
    VhcType:=3;
    MaxCol:=15;
    VhcCompanyId:=7;
  end else begin
    if (CompanyId='2') or (CompanyId='9') or (CompanyId='11') then begin
      VhcType:=2;
      MaxCol:=32;
    end else if (CompanyId='3') then begin
      VhcType:=1;
      MaxCol:=16;
    end;
    VhcCompanyId:=StrToInt(CompanyId);
  end;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: VehicleList='+VehicleType+',FormRequest='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TVehicleList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleList.Init;
var IntCount:Integer;
begin
  case VhcType of
    1:Caption:='Data Armada Taxi';
    2:Caption:='Data Armada Bus';
    3:Caption:='Data Armada GrayLine';
  end;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='KIR';
  StrGrid.Cells[1,0]:='STNK';
  StrGrid.Cells[2,0]:='KPS';
  StrGrid.Cells[3,0]:='Id';
  StrGrid.Cells[4,0]:='Lokasi';
  StrGrid.Cells[5,0]:='No Bodi';
  StrGrid.Cells[6,0]:='No Mesin';
  StrGrid.Cells[7,0]:='No Rangka';
  StrGrid.Cells[8,0]:='No Polisi';
  StrGrid.Cells[9,0]:='Tahun';
  StrGrid.Cells[10,0]:='STNK s/d';
  StrGrid.Cells[11,0]:='KIR S/d';
  StrGrid.Cells[12,0]:='KIU S/d';
  StrGrid.Cells[13,0]:='KP S/d';
  case VhcType of
    1:begin
        StrGrid.Cells[14,0]:='Tera S/d';
        StrGrid.Cells[15,0]:='Exc/Reg';
        StrGrid.ColWidths[14]:=65;
        StrGrid.ColWidths[15]:=70;
      end;
    2:begin
        StrGrid.Cells[14,0]:='Pajak S/d';
        StrGrid.Cells[15,0]:='Seat';
        StrGrid.ColWidths[14]:=65;
        StrGrid.Cells[16,0]:='Facelift';
        StrGrid.Cells[17,0]:='No Uji KIR';
        StrGrid.Cells[18,0]:='No EToll';
        StrGrid.Cells[19,0]:='No KP';
        StrGrid.Cells[20,0]:='STNK Pemilik';

        StrGrid.Cells[21,0]:='No SIM Card';
        StrGrid.Cells[22,0]:='SSID';
        StrGrid.Cells[23,0]:='No Asset';
        StrGrid.Cells[24,0]:='Router';

        StrGrid.Cells[26,0]:='No Polis';
        StrGrid.Cells[27,0]:='Penerbit Polis';
        StrGrid.Cells[28,0]:='Tanggal Awal';
        StrGrid.Cells[29,0]:='Tanggal Akhir';
        StrGrid.Cells[30,0]:='Nilai Asuransi';
        StrGrid.Cells[31,0]:='Armada';

        StrGrid.ColWidths[16]:=50;
        StrGrid.ColWidths[17]:=130;
        StrGrid.ColWidths[18]:=150;
        StrGrid.ColWidths[19]:=100;
        StrGrid.ColWidths[20]:=150;

        StrGrid.ColWidths[21]:=80;
        StrGrid.ColWidths[22]:=80;
        StrGrid.ColWidths[23]:=100;
        StrGrid.ColWidths[24]:=150;
        StrGrid.ColWidths[25]:=0;

        StrGrid.ColWidths[26]:=200;
        StrGrid.ColWidths[27]:=200;
        StrGrid.ColWidths[28]:=200;
        StrGrid.ColWidths[29]:=200;
        StrGrid.ColWidths[30]:=100;
        StrGrid.ColWidths[31]:=0;
        //StrGrid.ColWidths[12]:=40;
      end;
  end;

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=30;
  StrGrid.ColWidths[2]:=30;

  if VhcType=1 then begin
  end;
  StrGrid.ColWidths[3]:=0;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=50;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=130;
  StrGrid.ColWidths[8]:=65;
  StrGrid.ColWidths[9]:=40;
  StrGrid.ColWidths[10]:=65;
  StrGrid.ColWidths[11]:=65;
  StrGrid.ColWidths[12]:=65;
  StrGrid.ColWidths[13]:=65;

  if VhcType=1 then begin
  end;
  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';

  for IntCount:=0 to StrGrid.ColCount-1 do
  begin
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleList.RefreshCombo;
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
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);
end;

procedure TVehicleList.RefreshList;
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
        VehicleArr[Count][0]:=QVhc.FieldValues['kir_image'];
        VehicleArr[Count][1]:=QVhc.FieldValues['stnk_image'];
        VehicleArr[Count][2]:=QVhc.FieldValues['ksp_image'];

        VehicleArr[Count][3]:=QVhc.FieldValues['vehicle_id'];
        VehicleArr[Count][4]:=QVhc.FieldValues['location'];
        VehicleArr[Count][5]:=QVhc.FieldValues['body_id'];
        if QVhc.FieldValues['engine_id']<>NULL then
          VehicleArr[Count][6]:=QVhc.FieldValues['engine_id'];
        if QVhc.FieldValues['chasis_id']<>NULL then
        VehicleArr[Count][7]:=QVhc.FieldValues['chasis_id'];
        if IsCharAlpha(PChar(Copy(QVhc.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[Count][8]:=Copy(QVhc.FieldValues['license_plate'],1,1)+' '+Copy(QVhc.FieldValues['license_plate'],2,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],6,Length(QVhc.FieldValues['license_plate'])+1)
        else
          VehicleArr[Count][8]:=Copy(QVhc.FieldValues['license_plate'],1,2)+' '+Copy(QVhc.FieldValues['license_plate'],3,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],7,Length(QVhc.FieldValues['license_plate'])+1);
        if QVhc.FieldValues['year']<>NULL then
          VehicleArr[Count][9]:=QVhc.FieldValues['year'];
//        VehicleArr[Count][7]:=QVhc.FieldValues['vhc_batch_id'];
        if QVhc.FieldValues['stnk']<>NULL then
          VehicleArr[Count][10]:=QVhc.FieldValues['stnk'];
        if QVhc.FieldValues['kir']<>NULL then
          VehicleArr[Count][11]:=QVhc.FieldValues['kir'];
        if QVhc.FieldValues['kiu']<>NULL then
          VehicleArr[Count][12]:=QVhc.FieldValues['kiu'];
        if QVhc.FieldValues['kio']<>NULL then
          VehicleArr[Count][13]:=QVhc.FieldValues['kio'];
        case VhcType of
          1:begin
              if QVhc.FieldValues['tera']<>NULL then VehicleArr[Count][14]:=QVhc.FieldValues['tera'];
              if QVhc.FieldValues['reguler']=1 then VehicleArr[Count][15]:='Reguler' else VehicleArr[Count][16]:='Eksekutif';
            end;
          2:begin
              if QVhc.FieldValues['tera']<>NULL then VehicleArr[Count][14]:=QVhc.FieldValues['tera'];
              if QVhc.FieldValues['seat']<>NULL then VehicleArr[Count][15]:=QVhc.FieldValues['seat'];
              if QVhc.FieldValues['is_facelift']<>NULL then begin
                if (QVhc.FieldValues['is_facelift']=1) then VehicleArr[Count][16]:='V' else VehicleArr[Count][13]:='';
              end;

              if QVhc.FieldValues['no_uji_kir']<>NULL then VehicleArr[Count][17]:=QVhc.FieldValues['no_uji_kir'];
              
              if QVhc.FieldValues['etoll_number']<>NULL then VehicleArr[Count][18]:=QVhc.FieldValues['etoll_number'];
              if QVhc.FieldValues['no_kp']<>NULL then VehicleArr[Count][19]:=QVhc.FieldValues['no_kp'];
              if QVhc.FieldValues['stnk_owner_name']<>NULL then VehicleArr[Count][20]:=QVhc.FieldValues['stnk_owner_name'];

              if QVhc.FieldValues['msisdn']<>NULL then VehicleArr[Count][21]:=QVhc.FieldValues['msisdn'];
              if QVhc.FieldValues['ssid']<>NULL then VehicleArr[Count][22]:=QVhc.FieldValues['ssid'];
              if QVhc.FieldValues['asset_no']<>NULL then VehicleArr[Count][23]:=QVhc.FieldValues['asset_no'];
              if QVhc.FieldValues['router']<>NULL then VehicleArr[Count][24]:=QVhc.FieldValues['router'];

              if QVhc.FieldValues['asset_id']<>NULL then VehicleArr[Count][25]:=QVhc.FieldValues['asset_id'];

              if QVhc.FieldValues['insurance_number']<>NULL then VehicleArr[Count][26]:=QVhc.FieldValues['insurance_number'];
              if QVhc.FieldValues['insurance_name']<>NULL then VehicleArr[Count][27]:=QVhc.FieldValues['insurance_name'];
              if QVhc.FieldValues['insurance_from_date']<>NULL then VehicleArr[Count][28]:=QVhc.FieldValues['insurance_from_date'];
              if QVhc.FieldValues['insurance_to_date']<>NULL then VehicleArr[Count][29]:=QVhc.FieldValues['insurance_to_date'];
              if QVhc.FieldValues['insurance_amount']<>NULL then VehicleArr[Count][30]:= SToCurr(QVhc.FieldValues['insurance_amount']);
              if QVhc.FieldValues['batch_name']<>NULL then VehicleArr[Count][31]:= QVhc.FieldValues['batch_name'];

            end;
        end;
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
    for Count2:=0 to 32 do
    StrGrid.Cells[Count2,Count+1]:=VehicleArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(VehicleArr));
  Main.M_Normal;
end;

procedure TVehicleList.KeluarClick(Sender: TObject);
begin
  VehicleList.Close;
end;

procedure TVehicleList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 32 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 32 do
          StrGrid.Cells[Count4,Count2-1]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end else
    RefreshList;
end;

procedure TVehicleList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleList.StrGridDblClick(Sender: TObject);
var StrArmada:String;
begin
  if IntRow=0 then begin
  end else begin
    if FormRequest='' then begin
      if (LeftStr(IntToStr(TreeTag),2)='12') then begin
        if (RightStr(IntToStr(TreeTag),2)='02') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Taxi',StrGrid.Cells[3,IntRow],False);
        if (RightStr(IntToStr(TreeTag),2)='04') then if Main.IsFormOpen('VehicleMutation')=False then VehicleMutation:=TVehicleMutation.Create(Self,StrGrid.Cells[3,IntRow]);
        if (RightStr(IntToStr(TreeTag),2)='05') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Taxi',StrGrid.Cells[3,IntRow]);
      end else if (LeftStr(IntToStr(TreeTag),2)='13') then begin
        if (RightStr(IntToStr(TreeTag),2)='02') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Bus',StrGrid.Cells[3,IntRow],False);
        if (RightStr(IntToStr(TreeTag),2)='04') then if Main.IsFormOpen('VehicleMutation')=False then VehicleMutation:=TVehicleMutation.Create(Self,StrGrid.Cells[3,IntRow]);
        if (RightStr(IntToStr(TreeTag),2)='05') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Bus',StrGrid.Cells[3,IntRow]);
        if (RightStr(IntToStr(TreeTag),2)='22') then if Main.IsFormOpen('VehicleTopUpKuotaForm')=False then VehicleTopUpKuotaForm:=TVehicleTopUpKuotaForm.Create(Self,StrGrid.Cells[3,IntRow]);
      end else if (LeftStr(IntToStr(TreeTag),2)='17') then begin
        if (RightStr(IntToStr(TreeTag),2)='02') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'GrayLine',StrGrid.Cells[3,IntRow],False);
        if (RightStr(IntToStr(TreeTag),2)='04') then if Main.IsFormOpen('VehicleMutation')=False then VehicleMutation:=TVehicleMutation.Create(Self,StrGrid.Cells[3,IntRow]);
        if (RightStr(IntToStr(TreeTag),2)='05') then if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'GrayLine',StrGrid.Cells[3,IntRow]);
      end
    end else begin
      if UpperCase(FormRequest)='WORKORDER-CREATE' then begin
        WorkOrderForm.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='VEHICLEEQUIPMENT-ADD' then begin
        VehicleEquipmentForm.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='VEHICLEEQUIPMENT-LIST' then begin
        VehicleEquipmentForm:=TVehicleEquipmentForm.Create(nil,'VehicleList',StrGrid.Cells[3,IntRow]);
      end;
      if UpperCase(FormRequest)='VEHICLEEQUIPMENT-CHANGE' then begin
        VehicleEquipmentForm:=TVehicleEquipmentForm.Create(nil,'VehicleEquipment-Change',StrGrid.Cells[3,IntRow],True);
        Close;
      end;
      if UpperCase(FormRequest)='VEHICLEEQUIPMENTCHECK-INPUT' then begin
        VehicleEquipmentCheck.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='VEHICLEEQUIPMENTCHECK' then begin
        VehicleEquipmentCheck.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='SERVICEREQUEST-CREATE' then begin
        ServiceRequestForm.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='MAINTENANCESERVICE-CREATE' then begin
        MaintenanceServiceForm.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='BLOCK-CREATE' then begin
        BlockUnitForm.SetVehicleId(StrGrid.Cells[3,IntRow]);
        Close;
      end;
      StrArmada:= StrGrid.Cells[8,IntRow] +' ('+StrGrid.Cells[31,IntRow]+' '+StrGrid.Cells[15,IntRow]+' Seat)';
      if UpperCase(FormRequest)='FORM-HISTORY-LAKA' then begin
        VehicleIDHistLaka:=StrGrid.Cells[3,IntRow];
        EmployeeHistoryLakaForm.Armada.Text:=StrArmada;
        Close;
      end;

      if UpperCase(FormRequest)='REKAPPERGANTIANPARTPERARMADA' then begin
        StrVehicleIDRekapPergantianPart:=StrGrid.Cells[3,IntRow];
        RekapPergantianPartperArmada.PlateNo.Text:=StrArmada;
        Close;
      end;
    end;
  end;
end;

procedure TVehicleList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
  RefreshList;
end;

procedure TVehicleList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleList.StrGridMouseDown(Sender: TObject;
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

procedure TVehicleList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
