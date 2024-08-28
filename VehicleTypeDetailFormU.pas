unit VehicleTypeDetailFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, Buttons, WhUnit;

type
  TVehicleTypeDetailForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    GroupId: TPanel;
    VehicleTypeDetailId: TEdit;
    GroupInput: TPanel;
    Description: TEdit;
    Active: TCheckBox;
    VehicleType: TComboBox;
    Label5: TLabel;
    Seat: TEdit;
    Bersihkan: TButton;
    Label6: TLabel;
    Panel1: TPanel;
    BlueprintId: TEdit;
    TombolCari: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure MenuNameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
  private
    { Private declarations }
    VehicleArr:array of TArrString5;
    StrVehicleTypeDetailId:String;
    IsView:Boolean;
    procedure Init;
    procedure LoadData;
    procedure RefreshCombo;
    procedure Input(IsEnable:Boolean);
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleTypeDetail_Id:String;IsViewOnly:Boolean=False);Overload;
    procedure SetBlueprintId(Blueprint_Id:String);
  end;

var
  VehicleTypeDetailForm: TVehicleTypeDetailForm;

implementation

uses MainU, VehicleTypeDetailListU;

{$R *.dfm}

constructor TVehicleTypeDetailForm.Create(AOwner:TComponent;VehicleTypeDetail_Id:String;IsViewOnly:Boolean=False);
begin
  StrVehicleTypeDetailId:=VehicleTypeDetail_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TVehicleTypeDetailForm.Init;
begin
  GroupId.Enabled:=False;
  VehicleTypeDetailId.Text:='';
  Description.Text:='';
  Active.Checked:=False;
  BlueprintId.Text:='';
end;

procedure TVehicleTypeDetailForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  VehicleType.Text:='';
  VehicleType.Clear;
  VehicleType.ItemIndex:=-1;
  SetLength(VehicleArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleType '+CompanyId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VehicleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      VehicleArr[IntCount][0]:=Qry.FieldValues['vehicle_type_id'];
      VehicleArr[IntCount][1]:=Qry.FieldValues['name'];
      VehicleArr[IntCount][2]:=Qry.FieldValues['brand'];
      VehicleArr[IntCount][3]:=Qry.FieldValues['type'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(VehicleArr)-1  do
    VehicleType.Items.Add(VehicleArr[IntCount][1]+' '+VehicleArr[IntCount][2]+' '+VehicleArr[IntCount][3]);
end;

procedure TVehicleTypeDetailForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrVehicleType:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleTypeDetailDetail '+StrVehicleTypeDetailId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      VehicleTypeDetailId.Text:=Qry.FieldValues['vhc_type_detail_id'];
      Seat.Text:=Qry.FieldValues['seat'];
      StrVehicleType:=Qry.FieldValues['name']+' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
//      Description.Text:=Qry.FieldValues['menu_description'];
      if Qry.FieldValues['vhc_type_detail_image_type_id']<>NULL then BlueprintId.Text:=Qry.FieldValues['vhc_type_detail_image_type_id'];
      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  VehicleType.ItemIndex:=VehicleType.Items.IndexOf(StrVehicleType);  
end;

procedure TVehicleTypeDetailForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable; 
end;

procedure TVehicleTypeDetailForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleTypeDetailForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleTypeDetailForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if StrVehicleTypeDetailId<>'' then begin
    LoadData;
  end;
  if IsView then DisableInput
  else EnableInput;

end;

procedure TVehicleTypeDetailForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrCompanyId,StrVehicleTypeId,StrSeat,StrActive,StrVhcDetailImageType,StrVhcType:String;
    IsOk:Boolean;
begin
  if Trim(VehicleType.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      StrCompanyId:=CompanyId;
      StrVhcType:=VehicleArr[VehicleType.ItemIndex][0];
      StrSeat:=Seat.Text;
      if Trim(BlueprintId.Text)<>'' then StrVhcDetailImageType:=QuotedStr(Trim(BlueprintId.Text)) else StrVhcDetailImageType:='NULL';
      if Active.Checked then StrActive:='1' else StrActive:='0';
      if StrVehicleTypeDetailId<>'' then
        StrQry:='UPDATE wh_vhc_type_detail SET vehicle_type_id='+StrVhcType+',seat='+StrSeat+
                ',vhc_type_detail_image_type_id='+StrVhcDetailImageType+',active='+StrActive+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE vhc_type_detail_id='+StrVehicleTypeDetailId+';'
      else StrQry:='INSERT INTO wh_vhc_type_detail (vehicle_type_id,company_id,seat,vhc_type_detail_image_type_id,update_time,update_user) '+
                   ' VALUES ('+StrVehicleTypeDetailId+','+StrCompanyId+','+StrSeat+','+StrVhcDetailImageType+',GETDATE,'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(Handle,'Berhasil menyimpan Jenis Detail Armada','Jenis Detail Armada',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end else begin
      EnableInput;
      MessageBox(Handle,PChar('Gagal menyimpan Jenis Detail Armada'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg),'Jenis Detail Armada',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;
  if IsOk then Close;
end;

procedure TVehicleTypeDetailForm.SetBlueprintId(Blueprint_Id:String);
begin
  BlueprintId.Text:=Blueprint_Id; 
end;

procedure TVehicleTypeDetailForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

procedure TVehicleTypeDetailForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TVehicleTypeDetailForm.MenuNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TVehicleTypeDetailForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TVehicleTypeDetailForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Simpan.Click;
end;

procedure TVehicleTypeDetailForm.BersihkanClick(Sender: TObject);
begin
  Init;
  EnableInput;
end;

procedure TVehicleTypeDetailForm.TombolCariClick(Sender: TObject);
begin
  VehicleTypeDetailList:=TVehicleTypeDetailList.Create(Self,'Update-Detail');
end;

end.
