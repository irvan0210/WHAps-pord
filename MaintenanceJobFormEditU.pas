unit MaintenanceJobFormEditU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, Buttons, WhUnit;

type
  TMaintenanceJobFormEdit = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    LabelActive: TLabel;
    GroupInput: TPanel;
    Active: TCheckBox;
    Description: TEdit;
    MaintenanceJob: TComboBox;
    Label5: TLabel;
    MaintenanceJobDetailId: TEdit;
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
    JobTypeArr, MaintenanceJobArr:array of TArrString5;
    StrMaintenanceJobId:String;
    IsView:Boolean;
    procedure Init;
    procedure LoadData;
    procedure RefreshCombo;
    procedure RefreshJob;
    procedure Input(IsEnable:Boolean);
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MaintenanceJob_Id:String;IsViewOnly:Boolean=False);Overload;
    procedure SetPartDetail(PartDetail_Id:String);
  end;

var
  MaintenanceJobFormEdit: TMaintenanceJobFormEdit;

implementation

uses MainU, PartDetailListU, MaintenanceJobListU, MaintenanceGroupJobFormU, 
  MaintenanceGroupJobListU;

{$R *.dfm}

constructor TMaintenanceJobFormEdit.Create(AOwner:TComponent;MaintenanceJob_Id:String;IsViewOnly:Boolean=False);
begin
  StrMaintenanceJobId:=MaintenanceJob_Id;
  IsView:=IsViewOnly;
  Main.WriteLog('Form Open: MaintenanceJobFormEdit='+MaintenanceJob_Id+','+BoolToStr(IsViewOnly),1);
  Inherited Create(AOwner);
end;

procedure TMaintenanceJobFormEdit.Init;
begin
  //GroupId.Visible:=False;
 // MaintenanceJobId.Text:='';
 // Description.Text:='';
 // Active.Checked:=False;
 // PartDetailId.Text:='';
  Active.Visible:=False;
  LabelActive.Visible:=False;
end;

procedure TMaintenanceJobFormEdit.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  //JobType.Text:='';
  //JobType.Clear;
  //JobType.ItemIndex:=-1;
  SetLength(JobTypeArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_maintenance_type WHERE status=1;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(JobTypeArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      JobTypeArr[IntCount][0]:=Qry.FieldValues['maintenance_type_id'];
      JobTypeArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(JobTypeArr)-1  do
    //JobType.Items.Add(JobTypeArr[IntCount][1]);
end;

procedure TMaintenanceJobFormEdit.RefreshJob;
var Qry:TADOQuery;
    StrQry:String;   //,StrMaintenanceGrpId
    IntCount:Integer;
begin
  MaintenanceJob.Text:='';
  MaintenanceJob.ItemIndex:=-1;
  MaintenanceJob.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MaintenanceJobArr,0);
  if Main.OpenDb then begin
   // StrMaintenanceGrpId:=MaintenanceGroupArr[MaintenanceGroup.ItemIndex][0];
    StrQry:='EXEC GetMaintenanceJobList '+CompanyId+';'; //+',@MaintenanceGroupId='+StrMaintenanceGrpId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(MaintenanceJobArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        MaintenanceJobArr[IntCount][0]:=Qry.FieldValues['maintenance_job_id'];
        MaintenanceJobArr[IntCount][1]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(MaintenanceJobArr)-1 do
    MaintenanceJob.Items.Add(MaintenanceJobArr[IntCount][1]);
end;

procedure TMaintenanceJobFormEdit.LoadData;
var Qry:TADOQuery;
    StrQry, StrJobName:String;  //StrJobType,
begin
 // MessageBox(0,PChar(StrMaintenanceJobId),'Pekerjaan/Perbaikan',MB_OK or MB_ICONERROR);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
 // StrMaintenanceJobId
  if Main.OpenDb then begin
    StrQry:='SELECT b.name AS type_name, a.maintenance_type_id,a.name AS job_name,  '+
            'd.name as des_service,c.* FROM wh_maintenance_job a '+
            'LEFT JOIN wh_maintenance_type b ON b.maintenance_type_id=a.maintenance_type_id '+
            'LEFT JOIN dbo.wh_maintenance_group_detail c ON c.maintenance_job_id=a.maintenance_job_id '+
            'LEFT JOIN wh_maintenance_group d ON d.maintenance_group_id=c.maintenance_group_id '+
            'WHERE c.maintenance_group_detail_id='+QuotedStr(StrMaintenanceJobId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      MaintenanceJobDetailId.Text:=Qry.FieldValues['maintenance_group_detail_id'];
      StrJobName :=Qry.FieldValues['type_name']+' '+Qry.FieldValues['job_name'];
      Description.Text:=Qry.FieldValues['des_service'];
     // StrJobType:=Qry.FieldValues['type_name'];
      if Qry.FieldValues['status']=1 then Active.Checked:=True else Active.Checked:=False;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
 // JobType.ItemIndex:=JobType.Items.IndexOf(StrJobType);
  MaintenanceJob.ItemIndex := MaintenanceJob.Items.IndexOf(StrJobName);

end;

procedure TMaintenanceJobFormEdit.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TMaintenanceJobFormEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceJobFormEdit.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceJobFormEdit.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshJob;
  if StrMaintenanceJobId<>'' then begin
   // GroupId.Visible:=True;
    Active.Visible:=True;
    LabelActive.Visible:=True;
    LoadData;
  end;
  if IsView then DisableInput
  else EnableInput;

end;

procedure TMaintenanceJobFormEdit.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrCompanyId,StrName,StrActive,StrTransId:String;
    IsOk:Boolean;
    IntCount : Integer;
begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    //DisableInput;
    StrCompanyId:=CompanyId;
   // StrJobType:=JobTypeArr[JobType.ItemIndex][0];
    StrName:=QuotedStr(MaintenanceJob.Text);
    //StrMaintenanceJobDetailId := MaintenanceJobDetailId.Text;
    if Active.Checked then StrActive:='1' else StrActive:='0';
    for IntCount:=0 to Length(MaintenanceJobArr)-1 do
      if MaintenanceJobArr[IntCount][1]=MaintenanceJob.Text then StrMaintenanceJobId:=MaintenanceJobArr[IntCount][0];
    if Main.OpenDb then begin
        Main.TransStart;
        DisableInput;
        StrQry:='UPDATE wh_maintenance_group_detail SET maintenance_job_id='+QuotedStr(StrMaintenanceJobId)+
                ',description='+StrName+',status='+StrActive+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE maintenance_group_detail_id='+QuotedStr(MaintenanceJobDetailId.Text)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
      //  Qry.Open;
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil menyimpan Pekerjaan/Perbaikan','Pekerjaan/Perbaikan',MB_OK or MB_ICONINFORMATION);
          MaintenanceGroupJobList.MaintenanceJobChange(Sender);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal menyimpan Pekerjaan/Perbaikan'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Group Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
    end;
      Qry.Destroy;
 // end;
  if IsOk then Close;
end;

procedure TMaintenanceJobFormEdit.SetPartDetail(PartDetail_Id:String);
begin
 // PartDetailId.Text:=PartDetail_Id;
end;

procedure TMaintenanceJobFormEdit.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
  //PanelPartDetail.Enabled:=True;
end;

procedure TMaintenanceJobFormEdit.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  //PanelPartDetail.Enabled:=False;
end;

procedure TMaintenanceJobFormEdit.MenuNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TMaintenanceJobFormEdit.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TMaintenanceJobFormEdit.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Simpan.Click;
end;

procedure TMaintenanceJobFormEdit.BersihkanClick(Sender: TObject);
begin
  Init;
  EnableInput;
end;

procedure TMaintenanceJobFormEdit.TombolCariClick(Sender: TObject);
begin
  PartDetailList:=TPartDetailList.Create(Self,'Maintenance-Job');
end;

end.
