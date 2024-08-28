unit PartGroupFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit;

type
  TPartGroupForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupId: TEdit;
    GroupName: TEdit;
    PartType: TComboBox;
    VehicleGroup: TComboBox;
    Simpan: TButton;
    Selesai: TButton;
    Label5: TLabel;
    GPReferenceId: TEdit;
    Bersihkan: TButton;
    Label6: TLabel;
    VehicleModule: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure GroupIdKeyPress(Sender: TObject; var Key: Char);
    procedure GroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure PartTypeKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleGroupKeyPress(Sender: TObject; var Key: Char);
    procedure GPReferenceIdKeyPress(Sender: TObject; var Key: Char);
    procedure PartTypeChange(Sender: TObject);
    procedure VehicleModuleKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
    procedure MoveFooter(IntHeight:Integer);
    { Private declarations }
  public
    Constructor Create(AOwner:TComponent;Part_Group_Id:String='';IsRead_Only:Boolean=True);Overload;
    { Public declarations }
  end;

var
  PartGroupForm: TPartGroupForm;
  TypeArr,VehicleGroupArr:Array of TArrString5;
  PartGroupId:String;
  IsReadOnly:Boolean;

implementation

uses MainU, ADODB, PartGroupListU, StrUtils;

{$R *.dfm}

Constructor TPartGroupForm.Create(AOwner:TComponent;Part_Group_Id:String='';IsRead_Only:Boolean=True);
begin
  IsReadOnly:=IsRead_Only;
  PartGroupId:=Part_Group_Id;
  Inherited Create(AOwner);
end;

procedure TPartGroupForm.Init;
begin
  GroupId.Text:='';
  GroupName.Text:='';
  PartType.Text:='';
  PartType.Items.Clear;
  PartType.ItemIndex:=-1;
  VehicleGroup.Text:='';
  VehicleGroup.Items.Clear;
  VehicleGroup.ItemIndex:=-1;
  GPReferenceId.Text:='';
  VehicleModule.Checked:=False;
end;

procedure TPartGroupForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_part_type WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(TypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
      TypeArr[IntCount][1]:=Qry.FieldValues['name'];
      TypeArr[IntCount][2]:=Qry.FieldValues['vehicle_module'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vehicle_type a'+
            ' WHERE a.active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(VehicleGroupArr,Qry.RecordCount+1);
    VehicleGroupArr[0][0]:='';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      VehicleGroupArr[IntCount][0]:=Qry.FieldValues['vehicle_type_id'];
      VehicleGroupArr[IntCount][1]:=Qry.FieldValues['brand'];
      VehicleGroupArr[IntCount][2]:=Qry.FieldValues['type'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(TypeArr)-1  do
    PartType.Items.Add(TypeArr[IntCount][1]);
  for IntCount:=0 to Length(VehicleGroupArr)-1  do
    VehicleGroup.Items.Add(VehicleGroupArr[IntCount][1]+' '+VehicleGroupArr[IntCount][2]);
  Main.M_Normal;
end;

procedure TPartGroupForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if PartGroupId<>'' then begin
    GroupId.Text:=PartGroupId;
    LoadData;
    if IsReadOnly then DisableInput;
  end;
end;

procedure TPartGroupForm.SimpanClick(Sender: TObject);
var StrQry,StrTypeId,StrVhcType,StrGPRef,StrVhcMod,StrTransId:String;
    Qry:TADOQuery;
    IntCount:Integer;
    IsOk,IsExist:Boolean;
begin
  if (Trim(GroupName.Text)<>'') and (Trim(PartType.Text)<>'') then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      IsOk:=True;
      IsExist:=False;
      Main.TransStart;
      if Trim(VehicleGroup.Text)<>'' then begin
        for IntCount:=0 to Length(VehicleGroupArr)-1 do
          if VehicleGroup.Text=VehicleGroupArr[IntCount][1] then StrVhcType:=QuotedStr(VehicleGroupArr[IntCount][0]);
      end else StrVhcType:='NULL';
      StrTypeId:=TypeArr[PartType.ItemIndex][0];
      if GPReferenceId.Text<>'' then StrGPRef:=QuotedStr(GPReferenceId.Text) else StrGPRef:='NULL';
      if VehicleModule.Checked then StrVhcMod:='1' else StrVhcMod:='0';
      if PartGroupId='' then begin
        if GroupId.Text='' then begin
            StrQry:='SELECT RIGHT(MAX(part_group_id),2) AS part_group_id FROM wh_part_group '+
                    'WHERE part_group_id  LIKE '+Chr(39)+StrTypeId+'__'+Chr(39)+';';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['part_group_id']<>NULL then begin
              StrTransId:=Qry.FieldValues['part_group_id'];
              StrTransId:=Format('%.*d',[2,StrToInt(StrTransId)+1]);
              Qry.Close;
              Qry.SQL.Clear;
            end else
              StrTransId:='01';
            StrTransId:=StrTypeId+StrTransId;
        end else begin
          StrQry:='SELECT * FROM wh_part_group WHERE part_group_id='+QuotedStr(GroupId.Text)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount<1 then begin
            Qry.Close;
            StrTransId:=Trim(GroupId.Text);
          end else begin
            Qry.Close;
            IsExist:=True;
          end;
        end;
        if Not(IsExist) then begin
          StrQry:='INSERT INTO wh_part_group (part_group_id,name,part_type_id'+
                  ',vehicle_type_id,vehicle_module,gp_reference_id,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+
                  ','+QuotedStr(Trim(GroupName.Text))+
                  ','+QuotedStr(StrTypeId)+','+StrVhcType+','+StrVhcMod+','+StrGPRef+','+QuotedStr(user)+
                  ' );';
        end;
      end else begin
          StrQry:='UPDATE wh_part_group SET name='+QuotedStr(Trim(GroupName.Text))+',part_type_id='+QuotedStr(StrTypeId)+
                  ',vehicle_type_id='+StrVhcType+',vehicle_module='+StrVhcMod+',gp_reference_id='+StrGPRef+
                  ',update_time=GETDATE(),update_user='+QuotedStr(user)+
                  ' WHERE part_group_id='+QuotedStr(Trim(GroupId.Text))+';';
      end;
      if Not(IsExist) then begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do IsOk:=False;
        end;
        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Disimpan','Part Description',MB_OKCANCEL or MB_ICONINFORMATION);
          if Main.IsFormOpen('PartGroupList') then begin
            PartGroupList.LoadData;
            PartGroupList.RefreshGrid;
          end;
          if Not(IsReadOnly) then begin
            Close;
          end;
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'Silahkan Coba Lagi','Part Group',MB_OK or MB_ICONERROR)
        end;
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,'Part Group Id Sudah ada '+Chr(13)+'   Gagal Menyimpan','Part Group',MB_OK or MB_ICONERROR)
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TPartGroupForm.DisableInput;
begin
  GroupId.Enabled:=False;
  GroupName.Enabled:=False;
  PartType.Enabled:=False;
  VehicleGroup.Enabled:=False;
  VehicleModule.Enabled:=False;
  GPReferenceId.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TPartGroupForm.EnableInput;
begin
  GroupId.Enabled:=True;
  GroupName.Enabled:=True;
  PartType.Enabled:=True;
  VehicleGroup.Enabled:=True;
  VehicleModule.Enabled:=True;
  GPReferenceId.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TPartGroupForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
  EnableInput;
end;

procedure TPartGroupForm.MoveFooter(IntHeight:Integer);
begin
  if IntHeight>0 then begin
    VehicleGroup.Visible:=True;
    Label4.Visible:=True;
  end else begin
    VehicleGroup.Visible:=False;
    Label4.Visible:=False;
  end;
  GPReferenceId.Top:=GPReferenceId.Top+IntHeight;
  Label5.Top:=Label5.Top+IntHeight;
end;

procedure TPartGroupForm.PartTypeChange(Sender: TObject);
begin
  if PartType.Text<>'' then begin
    if (TypeArr[PartType.ItemIndex][2]='0') then begin
      if VehicleGroup.Visible=true then MoveFooter(-22);
    end else begin
      if VehicleGroup.Visible=false then MoveFooter(22);
    end;
  end;
end;

procedure TPartGroupForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPartGroupDetail '+QuotedStr(PartGroupId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      GroupName.Text:=Qry.FieldValues['name'];
      PartType.ItemIndex:=PartType.Items.IndexOf(Qry.FieldValues['part_type_name']);
      if Qry.FieldValues['part_type_vehicle_module']='1' then begin
        if Qry.FieldValues['vehicle_type_id']<>NULL then VehicleGroup.Text:=Qry.FieldValues['vehicle_type_id'];
        VehicleGroup.Visible:=True;
      end else VehicleGroup.Visible:=False;
      if Qry.FieldValues['vehicle_module']='1' then VehicleModule.Checked:=True else VehicleModule.Checked:=False;
      if Qry.FieldValues['gp_reference_id']<>NULL then GPReferenceId.Text:=Qry.FieldValues['gp_reference_id'];
      if VehicleGroup.Visible then MoveFooter(22);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPartGroupForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartGroupForm.GroupIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GroupName.SetFocus;
end;

procedure TPartGroupForm.GroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PartType.SetFocus;
end;

procedure TPartGroupForm.PartTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then VehicleModule.SetFocus;
end;

procedure TPartGroupForm.VehicleGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then GPReferenceId.SetFocus;
end;

procedure TPartGroupForm.GPReferenceIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TPartGroupForm.VehicleModuleKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then VehicleGroup.SetFocus;
end;

end.
