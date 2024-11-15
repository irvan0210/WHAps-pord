unit MaintenanceJobFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, Buttons, WhUnit;

type
  TMaintenanceJobForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    LabelActive: TLabel;
    GroupId: TPanel;
    MaintenanceJobId: TEdit;
    GroupInput: TPanel;
    Active: TCheckBox;
    JobType: TComboBox;
    Description: TEdit;
    Bersihkan: TButton;
    Panel1: TPanel;
    PartDetailId: TEdit;
    Label6: TLabel;
    PanelPartDetail: TPanel;
    TombolCari: TSpeedButton;
    Label1: TLabel;
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
    JobTypeArr:array of TArrString5;
    StrMaintenanceJobId:String;
    IsView:Boolean;
    procedure Init;
    procedure LoadData;
    procedure RefreshCombo;
    procedure Input(IsEnable:Boolean);
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MaintenanceJob_Id:String;IsViewOnly:Boolean=False);Overload;
    procedure SetPartDetail(PartDetail_Id:String);
  end;

var
  MaintenanceJobForm: TMaintenanceJobForm;

implementation

uses MainU, PartDetailListU, MaintenanceJobListU;

{$R *.dfm}

constructor TMaintenanceJobForm.Create(AOwner:TComponent;MaintenanceJob_Id:String;IsViewOnly:Boolean=False);
begin
  StrMaintenanceJobId:=MaintenanceJob_Id;
  IsView:=IsViewOnly;
  Main.WriteLog('Form Open: MaintenanceJobForm='+MaintenanceJob_Id+','+BoolToStr(IsViewOnly),1);
  Inherited Create(AOwner);
end;

procedure TMaintenanceJobForm.Init;
begin
  GroupId.Visible:=False;
  MaintenanceJobId.Text:='';
  Description.Text:='';
  Active.Checked:=False;
  PartDetailId.Text:='';
  Active.Visible:=False;
  LabelActive.Visible:=False;
end;

procedure TMaintenanceJobForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  JobType.Text:='';
  JobType.Clear;
  JobType.ItemIndex:=-1;
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
    JobType.Items.Add(JobTypeArr[IntCount][1]);
end;

procedure TMaintenanceJobForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrJobType:String;
begin
 // MessageBox(0,PChar(StrMaintenanceJobId),'Pekerjaan/Perbaikan',MB_OK or MB_ICONERROR);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT b.name AS type_name,* FROM wh_maintenance_job a '+
            'LEFT JOIN wh_maintenance_type b ON b.maintenance_type_id=a.maintenance_type_id '+
            'WHERE a.maintenance_job_id='+QuotedStr(StrMaintenanceJobId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      MaintenanceJobId.Text:=Qry.FieldValues['maintenance_job_id'];
      Description.Text:=Qry.FieldValues['name'];
      StrJobType:=Qry.FieldValues['type_name'];
      if Qry.FieldValues['status']=1 then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  JobType.ItemIndex:=JobType.Items.IndexOf(StrJobType);
end;

procedure TMaintenanceJobForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TMaintenanceJobForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceJobForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceJobForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if StrMaintenanceJobId<>'' then begin
    GroupId.Visible:=True;
    Active.Visible:=True;
    LabelActive.Visible:=True;
    LoadData;
  end;
  if IsView then DisableInput
  else EnableInput;

end;

procedure TMaintenanceJobForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrCompanyId,StrName,StrActive,StrJobType,StrPartDetail,StrTransId:String;
    IsOk:Boolean;
begin
  if Trim(JobType.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      StrCompanyId:=CompanyId;
      StrJobType:=JobTypeArr[JobType.ItemIndex][0];
      StrName:=QuotedStr(Description.Text);
      if Trim(PartDetailId.Text)<>'' then StrPartDetail:=QuotedStr(Trim(PartDetailId.Text)) else StrPartDetail:='NULL';
      if Active.Checked then StrActive:='1' else StrActive:='0';
      StrQry:='SELECT RIGHT(MAX(maintenance_job_id),2) AS max_id FROM wh_maintenance_job '+
              'WHERE maintenance_job_id  LIKE '+QuotedStr('MTJ'+StrJobType+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
               FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'__')+';';
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
      StrTransId:='MTJ'+StrJobType+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
      if StrMaintenanceJobId<>'' then
        StrQry:='UPDATE wh_maintenance_job SET maintenance_type_id='+StrJobType+',name='+StrName+
                ',part_detail_id='+StrPartDetail+',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE maintenance_job_id='+QuotedStr(StrMaintenanceJobId)+';'
      else
        StrQry:='INSERT INTO wh_maintenance_job (maintenance_job_id,company_id,maintenance_type_id,name,part_detail_id,update_time,update_user) '+
                ' VALUES ('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrJobType+','+StrName+','+StrPartDetail+',GETDATE(),'+QuotedStr(User)+');';
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
      MessageBox(0,'Berhasil menyimpan Pekerjaan/Perbaikan','Pekerjaan/Perbaikan',MB_OK or MB_ICONINFORMATION);
      if StrMaintenanceJobId<>'' then MaintenanceJobList.RefreshList;
    end else begin
      EnableInput;
      MessageBox(0,PChar('Gagal menyimpan Pekerjaan/Perbaikan'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg),'Pekerjaan/Perbaikan',MB_OK or MB_ICONERROR);
    end;
  end;
  if IsOk then Close;
end;

procedure TMaintenanceJobForm.SetPartDetail(PartDetail_Id:String);
begin
  PartDetailId.Text:=PartDetail_Id;
end;

procedure TMaintenanceJobForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
  PanelPartDetail.Enabled:=True;
end;

procedure TMaintenanceJobForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelPartDetail.Enabled:=False;
end;

procedure TMaintenanceJobForm.MenuNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TMaintenanceJobForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TMaintenanceJobForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Simpan.Click;
end;

procedure TMaintenanceJobForm.BersihkanClick(Sender: TObject);
begin
  Init;
  EnableInput;
end;

procedure TMaintenanceJobForm.TombolCariClick(Sender: TObject);
begin
  PartDetailList:=TPartDetailList.Create(Self,'Maintenance-Job');
end;

end.
