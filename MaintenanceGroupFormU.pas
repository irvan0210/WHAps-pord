unit MaintenanceGroupFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TMaintenanceGroupForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    LabelActive: TLabel;
    PanelGroup: TPanel;
    GroupId: TEdit;
    GroupInput: TPanel;
    GroupName: TEdit;
    Description: TEdit;
    Active: TCheckBox;
    Label5: TLabel;
    Panel1: TPanel;
    SetHours: TRadioButton;
    Hours: TEdit;
    SetDays: TRadioButton;
    Days: TEdit;
    Label6: TLabel;
    Panel2: TPanel;
    SetUseKM: TRadioButton;
    UseKM: TEdit;
    SetUseDays: TRadioButton;
    UseDays: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure GroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure SetHoursClick(Sender: TObject);
    procedure SetDaysClick(Sender: TObject);
    procedure DaysKeyPress(Sender: TObject; var Key: Char);
    procedure HoursKeyPress(Sender: TObject; var Key: Char);
    procedure SetDaysKeyPress(Sender: TObject; var Key: Char);
    procedure SetHoursKeyPress(Sender: TObject; var Key: Char);
    procedure SetUseKMKeyPress(Sender: TObject; var Key: Char);
    procedure SetUseDaysKeyPress(Sender: TObject; var Key: Char);
    procedure SetUseKMClick(Sender: TObject);
    procedure SetUseDaysClick(Sender: TObject);
    procedure UseKMKeyPress(Sender: TObject; var Key: Char);
    procedure UseDaysKeyPress(Sender: TObject; var Key: Char);
    procedure UseKMEnter(Sender: TObject);
    procedure UseKMExit(Sender: TObject);
    procedure UseDaysEnter(Sender: TObject);
    procedure UseDaysExit(Sender: TObject);
  private
    { Private declarations }
    GrpId:String;
    IsView,Initiation:Boolean;
    MenuArr:Array of TArrString4;
    procedure Init;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Group_Id:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  MaintenanceGroupForm: TMaintenanceGroupForm;

implementation

uses MainU, ADODB, SubMenuListU, MaintenanceGroupListU,
  MaintenanceGroupJobFormU;

{$R *.dfm}

constructor TMaintenanceGroupForm.Create(AOwner:TComponent;Group_Id:String;IsViewOnly:Boolean=False);
begin
  GrpId:=Group_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TMaintenanceGroupForm.Init;
begin
  GroupId.Text:='';
  GroupName.Text:='';
  UseKM.Text:='';
  UseDays.Text:='';
  Hours.Text:='';
  Days.Text:='';
  Description.Text:='';
  Active.Checked:=False;
  Initiation:=True;
  PanelGroup.Visible:=False;
  Active.Visible:=False;
  LabelActive.Visible:=False;
end;

procedure TMaintenanceGroupForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
   // StrQry:='SELECT * FROM wh_sub_menu a INNER JOIN wh_menu b ON b.menu_id=a.menu_id WHERE sub_menu_id='+GrpId+';';
    StrQry:='SELECT * FROM wh_maintenance_group WHERE maintenance_group_id='+QuotedStr(GrpId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      GroupId.Text:=Qry.FieldValues['maintenance_group_id'];
      GroupName.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['use_kilometer']<> NULL then
       begin
         UseKM.Text := Qry.FieldValues['use_kilometer'];
         SetUseKM.Checked := True;
       end;
       if Qry.FieldValues['use_days']<> NULL then
       begin
         UseDays.Text := Qry.FieldValues['use_days'];
         SetUseDays.Checked := True;
       end;
       if Qry.FieldValues['hours']<> NULL then
       begin
         Hours.Text := Qry.FieldValues['hours'];
         SetHours.Checked := True;
       end;
       if Qry.FieldValues['days']<> NULL then
       begin
         Days.Text := Qry.FieldValues['days'];
         SetDays.Checked := True;
       end;

      if Qry.FieldValues['status']= '1' then Active.Checked:=True else Active.Checked:=False;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
end;

procedure TMaintenanceGroupForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;


procedure TMaintenanceGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TMaintenanceGroupForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceGroupForm.FormShow(Sender: TObject);
begin
  Init;
  if GrpId<>'' then begin
    PanelGroup.Visible:=True;
    Active.Visible:=True;
    LabelActive.Visible:=True;
    LoadData;
  end;
  if IsView then Input(False)
  else Input(True);
  Initiation:=False;
end;

procedure TMaintenanceGroupForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrGroupId,StrGroupName,StrTransId,StrDays,StrHours,StrUseKM,StrUseDays:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(GroupName.Text)<>'') then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    if Main.OpenDb then begin
      StrGroupId:=Trim(GroupId.Text);
      StrGroupName:=Trim(GroupName.Text);
      if (SetUseKM.Checked=True) and (Trim(UseKM.Text)<>'') then StrUseKM:=QuotedStr(ToString(UseKM.Text)) else StrUseKM:='NULL';
      if (SetUseDays.Checked=True) and (Trim(UseDays.Text)<>'') then StrUseDays:=QuotedStr(ToString(UseDays.Text)) else StrUseDays:='NULL';
      if (SetHours.Checked=True) and (Trim(Hours.Text)<>'') then StrHours:=QuotedStr(ToString(Hours.Text)) else StrHours:='NULL';
      if (SetDays.Checked=True) and (Trim(Days.Text)<>'') then StrDays:=QuotedStr(ToString(Days.Text)) else StrDays:='NULL';
      StrQry:='SELECT RIGHT(MAX(maintenance_group_id),3) AS max_id FROM wh_maintenance_group WHERE (company_id='+QuotedStr(CompanyId)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        StrTransId:=Qry.FieldValues['max_id'];
        StrTransId:=Format('%.*d',[3,StrToInt(StrTransId)+1]);
      end else
        StrTransId:='001';
      StrTransId:='MG'+CompanyId+StrTransId;

      StrQry:='select * from wh_maintenance_group WHERE company_id='+QuotedStr(CompanyId)+' AND use_kilometer ='+StrUseKM+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount > 0 then
        begin
          MessageBox(0,PChar('Group Pemeliharaan '+UseKM.Text+' Sudah Ada.'),'Group Pemeliharaan',MB_OK or MB_ICONWARNING);
          IsOk:=False;
          StrMsg:='Gagal Menambah Group Pemeliharaan';
        end
      else
      begin
        if StrGroupId<>'' then
          StrQry:='UPDATE wh_maintenance_group SET maintenance_group_id='+QuotedStr(StrGroupId)+',name='+QuotedStr(StrGroupName)+
                  ',use_kilometer ='+StrUseKM+',use_days='+StrUseDays+',hours='+StrHours+',days='+StrDays+',status='+IntToStr(IntActive)+
                  ' WHERE maintenance_group_id='+QuotedStr(GrpId)+';'
        else
          StrQry:='INSERT INTO wh_maintenance_group (maintenance_group_id,company_id,name,use_kilometer,use_days'+
                  ',hours,days,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(CompanyId)+','+QuotedStr(StrGroupName)+
                  ','+StrUseKM+','+StrUseDays+','+StrHours+','+StrDays+','+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menambah Group Pemeliharaan';
            StrException:=E.Message;
          end;
        end;
        Qry.Close;
        Main.CloseDb;
      end;
    end;

    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan Group Pemeliharaan','Group Pemeliharaan',MB_OK or MB_ICONINFORMATION);
      Init;
      if StrGroupId<>'' then
      begin
        MaintenanceGroupList.LoadData;
        MaintenanceGroupList.RefreshList;
      end;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Group Pemeliharaan',MB_OK or MB_ICONERROR);
    end;
    //end;
  end;

  if Main.IsFormOpen('MaintenanceGroupList') then begin
//    List.Init;
//    SubMenuList.LoadData;
//    SubMenuList.RefreshList;
  end;
  if IsOk then Close;
end;

procedure TMaintenanceGroupForm.GroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SetUseKM.SetFocus;
end;

procedure TMaintenanceGroupForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Active.Visible=True then Active.SetFocus else Simpan.SetFocus;
end;

procedure TMaintenanceGroupForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TMaintenanceGroupForm.SetHoursClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if SetHours.Checked=True then begin
      Hours.Enabled:=True;
      Days.Enabled:=False;
    end;
  end;
end;

procedure TMaintenanceGroupForm.SetDaysClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if SetDays.Checked=True then begin
      Days.Enabled:=True;
      Hours.Enabled:=False;
    end;
  end;
end;

procedure TMaintenanceGroupForm.DaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Description.SetFocus;
end;

procedure TMaintenanceGroupForm.HoursKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Description.SetFocus;
end;

procedure TMaintenanceGroupForm.SetDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Days.SetFocus;
end;

procedure TMaintenanceGroupForm.SetHoursKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Hours.SetFocus;
end;

procedure TMaintenanceGroupForm.SetUseKMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then UseKM.SetFocus;
end;

procedure TMaintenanceGroupForm.SetUseDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then SetUseDays.SetFocus;
end;

procedure TMaintenanceGroupForm.SetUseKMClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if SetUseKM.Checked=True then begin
      UseKM.Enabled:=True;
      UseDays.Enabled:=False;
    end;
  end;
end;

procedure TMaintenanceGroupForm.SetUseDaysClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if SetUseDays.Checked=True then begin
      UseDays.Enabled:=True;
      UseKM.Enabled:=False;
    end;
  end;
end;

procedure TMaintenanceGroupForm.UseKMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then SetHours.SetFocus;
end;

procedure TMaintenanceGroupForm.UseDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then SetHours.SetFocus;
end;

procedure TMaintenanceGroupForm.UseKMEnter(Sender: TObject);
begin
  UseKM.Text:=ToString(UseKM.Text);
end;

procedure TMaintenanceGroupForm.UseKMExit(Sender: TObject);
var
  Qry : TADOQuery;
   IsOk:Boolean;
   StrQry : string;
begin
  if UseKM.Text<>'' then
  begin
    UseKM.Text:=SToCurr(ToString(UseKM.Text));
  end;
  //if IsOk then Close;
end;

procedure TMaintenanceGroupForm.UseDaysEnter(Sender: TObject);
begin
  UseDays.Text:=ToString(UseDays.Text);
end;

procedure TMaintenanceGroupForm.UseDaysExit(Sender: TObject);
begin
  if UseDays.Text<>'' then
  UseDays.Text:=SToCurr(ToString(UseDays.Text));
end;

end.
