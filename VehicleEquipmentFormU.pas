unit VehicleEquipmentFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid, Buttons;

type
  TVehicleEquipmentForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupInput: TPanel;
    Active: TCheckBox;
    Equipment: TComboBox;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    StrGrid: TZColorStringGrid;
    GroupInput1: TPanel;
    Vehicle: TEdit;
    Details: TMemo;
    PanelCari: TPanel;
    Cari: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    NoBody: TEdit;
    NoPolisi: TEdit;
    Bersihkan: TButton;
    Label17: TLabel;
    Label8: TLabel;
    LabelInput: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    All: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EquipmentChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure EquipmentKeyPress(Sender: TObject; var Key: Char);
    procedure DetailsKeyPress(Sender: TObject; var Key: Char);
    procedure CariClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BersihkanClick(Sender: TObject);
    procedure AllClick(Sender: TObject);

  private
    { Private declarations }
    StrVehicleEquipmentId,FormRequest,StrVehicleId:String;
    IsInput:Boolean;
    IntRow:Integer;
    VhcEquipmentArr,VhcEquipmentDetailArr:Array of TArrString8;
    procedure Init;
    procedure InitGrid;
    procedure RefreshEquipment(Equipment_Id:String='');
    procedure LoadDataGrid;
    procedure RefreshGrid;
    procedure LoadData;
    procedure EnableInput;
    procedure DisableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Vehicle_Id:String='';Is_Input:Boolean=False);Overload;
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetVehicleEquipment(VehicleEquipment_Id:String);
  end;

var
  VehicleEquipmentForm: TVehicleEquipmentForm;

implementation

uses MainU, ADODB, StrUtils, TreeMenuListU, UserLocationListU,
  VehicleListU;

{$R *.dfm}

constructor TVehicleEquipmentForm.Create(AOwner:TComponent;Form_Request:String='';Vehicle_Id:String='';Is_Input:Boolean=False);
begin
  StrVehicleId:=Vehicle_Id;
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Inherited Create(AOwner);
end;

procedure TVehicleEquipmentForm.Init;
begin
  Equipment.Clear;
  Equipment.Text:='';
  Equipment.ItemIndex:=-1;
  Vehicle.Text:='';
  Active.Checked:=False;
  NoBody.Text:='';
  NoPolisi.Text:='';
  if StrVehicleId<>'' then PanelCari.Enabled:=False
  else PanelCari.Enabled:=True;
  All.Enabled:=False;
end;

procedure TVehicleEquipmentForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrCompanyLocation,StrUsername,StrEquipment:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_vehicle a '+
            'WHERE a.vehicle_id='+QuotedStr(StrVehicleId)+';';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Vehicle.Text:=Qry.FieldValues['vehicle_id'];
      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Qry.FieldValues['license_plate'];
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  LoadDataGrid;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TVehicleEquipmentForm.RefreshEquipment(Equipment_Id:String);
var Qry:TADOQuery;
    StrQry,StrUserCompanyLocation,StrEquipmentId:String;
    IntCount:Integer;
begin
  All.Enabled:=False;
  
  Equipment.Text:='';
  Equipment.ItemIndex:=-1;
  Equipment.Items.Clear;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(VhcEquipmentArr,0);
  if Main.OpenDb then begin
    if Equipment_Id<>'' then StrEquipmentId:=',@VhcEquipmentId='+Equipment_Id;
    StrQry:='EXEC GetVhcEquipmentDetailList '+QuotedStr(Vehicle.Text)+StrEquipmentId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      All.Enabled:=True;
      SetLength(VhcEquipmentArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        VhcEquipmentArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_id'];
        VhcEquipmentArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(VhcEquipmentArr)-1 do
    Equipment.Items.Add(VhcEquipmentArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TVehicleEquipmentForm.EnableInput;
begin
  Bersihkan.Visible:=True;
  GroupInput.Enabled:=True;
  Simpan.Visible:=True;
end;

procedure TVehicleEquipmentForm.DisableInput;
begin
  Bersihkan.Visible:=False;
  GroupInput.Enabled:=False;
  Simpan.Visible:=False;
end;


procedure TVehicleEquipmentForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  if StrVehicleId<>'' then LoadData;
  if IsInput then begin
    EnableInput;
    GroupInput.Visible:=True;
    LabelInput.Visible:=True;
  end else begin
    DisableInput;
    GroupInput.Visible:=False;
    LabelInput.Visible:=False;
  end;
end;

procedure TVehicleEquipmentForm.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=5;
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=0;
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Name';
  StrGrid.Cells[2,0]:='Keterangan';
  StrGrid.Cells[3,0]:='Status';
  StrGrid.Cells[4,0]:='';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
end;

procedure TVehicleEquipmentForm.SetVehicleEquipment(VehicleEquipment_Id:String);
var StrQry,StrEquipment,StrEquipmentId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if VehicleEquipment_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrEquipmentId:='';
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleEquipmentDetail '+QuotedStr(VehicleEquipment_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        StrVehicleEquipmentId:=Qry.FieldValues['vhc_equipment_detail_id'];
        Vehicle.Text:=Qry.FieldValues['vehicle_id'];
        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
        StrEquipment:=Qry.FieldValues['name'];
        StrEquipmentId:=Qry.FieldValues['vhc_equipment_id'];
        Details.Text:=Qry.FieldValues['remark'];
        if Qry.FieldValues['status']=1 then Active.Checked:=True else Active.Checked:=False;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
    RefreshEquipment(StrEquipmentId);
    Equipment.ItemIndex:=Equipment.Items.IndexOf(StrEquipment);
//    InitGrid;
//    LoadDataGrid;
//    RefreshGrid;
  end;
end;

procedure TVehicleEquipmentForm.SetVehicleId(Vehicle_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Vehicle_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        Vehicle.Text:=Vehicle_Id;
        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
    RefreshEquipment;
    InitGrid;
    LoadDataGrid;
    RefreshGrid;
  end;
end;

procedure TVehicleEquipmentForm.LoadDataGrid;
var Qry:TADOQuery;
    StrQry,StrSubMenuId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(VhcEquipmentDetailArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleEquipmentDetailList '+QuotedStr(Vehicle.Text)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VhcEquipmentDetailArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VhcEquipmentDetailArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_id'];
      VhcEquipmentDetailArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['remark']<>NULL then VhcEquipmentDetailArr[IntCount][2]:=Qry.FieldValues['remark'] else VhcEquipmentDetailArr[IntCount][2]:='';
      if Qry.FieldValues['active']=1 then VhcEquipmentDetailArr[IntCount][3]:='Digunakan' else VhcEquipmentDetailArr[IntCount][3]:='Dilepas';
      VhcEquipmentDetailArr[IntCount][4]:=Qry.FieldValues['vhc_equipment_detail_id'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TVehicleEquipmentForm.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(VhcEquipmentDetailArr)>0 then StrGrid.RowCount:=Length(VhcEquipmentDetailArr)+1;
  for IntCount:=0 to Length(VhcEquipmentDetailArr)-1 do begin
    for IntCount2:=0 to StrGrid.ColCount do StrGrid.Cells[IntCount2,IntCount+1]:=VhcEquipmentDetailArr[IntCount][IntCount2];
  end;
end;

procedure TVehicleEquipmentForm.EquipmentChange(Sender: TObject);
begin
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
  Active.Checked:=True;
end;

procedure TVehicleEquipmentForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrVehicleId,StrEquipmentId,StrRemark,StrEndTime,StrTransId:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Equipment.Text)<>'') and (Trim(Vehicle.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then begin
      IntActive:=1;
      StrEndTime:='';
    end else begin
      IntActive:=0;
      StrEndTime:=',to_date=GETDATE()'
    end;
    StrVehicleId:=Vehicle.Text;
    StrEquipmentId:=VhcEquipmentArr[Equipment.ItemIndex][0];
    if Trim(Details.Text)<>'' then StrRemark:=QuotedStr(Details.Text) else StrRemark:='NULL';
    if Main.OpenDb then begin
      StrQry:='SELECT RIGHT(MAX(vhc_equipment_detail_id),2) AS max_id FROM wh_vhc_equipment_detail '+
              'WHERE vhc_equipment_detail_id  LIKE '+QuotedStr(StrVehicleId+StrEquipmentId+'__')+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        StrTransId:=Qry.FieldValues['max_id'];
        StrTransId:=Format('%.*d',[2,StrToInt(StrTransId)+1]);
        Qry.Close;
        Qry.SQL.Clear;
      end else
        StrTransId:='01';
      StrTransId:=StrVehicleId+StrEquipmentId+StrTransId;
      StrVehicleId:=QuotedStr(StrVehicleId);
      StrEquipmentId:=QuotedStr(StrEquipmentId);
      if StrVehicleEquipmentId<>'' then
        StrQry:='UPDATE wh_vhc_equipment_detail SET remark='+StrRemark+StrEndTime+
                ',status='+IntToStr(IntActive)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vhc_equipment_detail_id='+QuotedStr(StrVehicleEquipmentId)+';'
      else
        StrQry:='INSERT INTO wh_vhc_equipment_detail (vhc_equipment_detail_id,vhc_equipment_id,company_id,location_id,vehicle_id,remark,from_date,update_time,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+StrEquipmentId+','+CompanyId+','+LocationId+','+StrVehicleId+','+StrRemark+',GETDATE()'+
                ',GETDATE(),'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Perlengkapan Armada';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan Perlengkapan','Perlengkapan Armada',MB_OK or MB_ICONINFORMATION);
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Perlengkapan Armada',MB_OK or MB_ICONERROR);
    end;
  end;
  if IsOk then begin
    Active.Checked:=False;
    InitGrid;
    LoadDataGrid;
    RefreshGrid;
    RefreshEquipment;
    Details.Text:='';
  end;
end;

procedure TVehicleEquipmentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipmentForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipmentForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TVehicleEquipmentForm.EquipmentKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Details.SetFocus;
end;

procedure TVehicleEquipmentForm.DetailsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TVehicleEquipmentForm.CariClick(Sender: TObject);
begin
  VehicleList:=TVehicleList.Create(nil,'','VehicleEquipment-Add')
end;

procedure TVehicleEquipmentForm.StrGridDblClick(Sender: TObject);
begin
  if UpperCase(FormRequest)='VEHICLEEQUIPMENT-CHANGE' then
    SetVehicleEquipment(StrGrid.Cells[4,IntRow]);
end;

procedure TVehicleEquipmentForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TVehicleEquipmentForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
end;

procedure TVehicleEquipmentForm.AllClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrVehicleId,StrEquipmentId,StrRemark,StrEndTime,StrTransId:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if Trim(Vehicle.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then begin
      IntActive:=1;
      StrEndTime:='';
    end else begin
      IntActive:=0;
      StrEndTime:=',to_date=GETDATE()'
    end;
    
    for IntCount:=1 to Equipment.Items.Count do begin
        StrVehicleId:=Vehicle.Text;
        StrEquipmentId:=VhcEquipmentArr[IntCount-1][0];
        if Trim(Details.Text)<>'' then StrRemark:=QuotedStr(Details.Text) else StrRemark:='NULL';
        if Main.OpenDb then begin
          StrQry:='SELECT RIGHT(MAX(vhc_equipment_detail_id),2) AS max_id FROM wh_vhc_equipment_detail '+
                  'WHERE vhc_equipment_detail_id  LIKE '+QuotedStr(StrVehicleId+StrEquipmentId+'__')+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrTransId:=Qry.FieldValues['max_id'];
            StrTransId:=Format('%.*d',[2,StrToInt(StrTransId)+1]);
            Qry.Close;
            Qry.SQL.Clear;
          end else
            StrTransId:='01';
          StrTransId:=StrVehicleId+StrEquipmentId+StrTransId;
          StrVehicleId:=QuotedStr(StrVehicleId);
          StrEquipmentId:=QuotedStr(StrEquipmentId);
          if StrVehicleEquipmentId<>'' then
            StrQry:='UPDATE wh_vhc_equipment_detail SET remark='+StrRemark+StrEndTime+
                    ',status='+IntToStr(IntActive)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE vhc_equipment_detail_id='+QuotedStr(StrVehicleEquipmentId)+';'
          else
            StrQry:='INSERT INTO wh_vhc_equipment_detail (vhc_equipment_detail_id,vhc_equipment_id,company_id,location_id,vehicle_id,remark,from_date,update_time,update_user)'+
                    ' VALUES ('+QuotedStr(StrTransId)+','+StrEquipmentId+','+CompanyId+','+LocationId+','+StrVehicleId+','+StrRemark+',GETDATE()'+
                    ',GETDATE(),'+QuotedStr(User)+');';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menambah Perlengkapan Armada';
              StrException:=E.Message;
            end;
          end;
          Qry.Close;
        end;
    end;

    FreeAndNil(Qry);
    Main.CloseDb;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan Perlengkapan','Perlengkapan Armada',MB_OK or MB_ICONINFORMATION);
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Perlengkapan Armada',MB_OK or MB_ICONERROR);
    end;
  end;
  if IsOk then begin
    Active.Checked:=False;
    InitGrid;
    LoadDataGrid;
    RefreshGrid;
    RefreshEquipment;
    Details.Text:='';
  end;

end;

end.procedure TVehicleEquipmentForm.AllClick(Sender: TObject);
begin

end;


