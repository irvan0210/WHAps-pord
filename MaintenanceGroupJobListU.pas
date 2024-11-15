unit MaintenanceGroupJobListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid;

type
  TMaintenanceGroupJobList = class(TForm)
    Label5: TLabel;
    GroupBox1: TGroupBox;
    StrGrid: TZColorStringGrid;
    Bersihkan: TButton;
    MaintenanceGroup: TComboBox;
    Batal: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaintenanceJobChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    StrMaintenanceGrpId:String;
    IsView:Boolean;
    MaintenanceGroupArr,MaintenanceJobArr,MaintenanceGroupListArr:Array of TArrString4;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshJob;
    procedure LoadDataGrid;
    procedure RefreshGrid;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MaintenenceGroup_Id:String='';IsViewOnly:Boolean=False);Overload;
  end;

var
  MaintenanceGroupJobList: TMaintenanceGroupJobList;

implementation

uses MainU, ADODB, StrUtils, TreeMenuListU, MaintenanceJobFormEditU;

{$R *.dfm}

constructor TMaintenanceGroupJobList.Create(AOwner:TComponent;MaintenenceGroup_Id:String='';IsViewOnly:Boolean=False);
begin
  StrMaintenanceGrpId:=MaintenenceGroup_Id;
  IsView:=IsViewOnly;
  Initiation:=True;
  Main.WriteLog('Form Open: MaintenanceGroupForm='+MaintenenceGroup_Id+','+BoolToStr(IsViewOnly),1);
  Inherited Create(AOwner);
end;

procedure TMaintenanceGroupJobList.Init;
begin
   MaintenanceGroup.SetFocus;
 // GroupId.Enabled:=False;
 // MaintenanceGroupId.Text:='';
  //Description.Text:='';
 // Active.Checked:=False;
 // Active.Visible:=False;
end;

procedure TMaintenanceGroupJobList.LoadData;
var Qry:TADOQuery;
    StrQry,StrMaintenanceGroupId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
{  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
    if MaintenanceGroupArr[IntCount][1]=MaintenanceGroup.Text then StrMaintenanceGroupId:=MaintenanceGroupArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupDetailList '+QuotedStr(StrMaintenanceGroupId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      MaintenanceGroupId.Text:=Qry.FieldValues['tree_sub_menu_id'];
      GroupName.Text:=Qry.FieldValues['tree_menu'];
      if Qry.FieldValues['tree_menu_description']<> NULL then
        Description.Text:=Qry.FieldValues['tree_menu_description'];
      StrMaintenanceId:=Qry.FieldValues['sub_menu'];

      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
      Qry.Close;
    end;
  end;
  }FreeAndNil(Qry);
  Main.CloseDb;
end;


procedure TMaintenanceGroupJobList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  MaintenanceGroup.Text:='';
  MaintenanceGroup.ItemIndex:=-1;
  MaintenanceGroup.Clear;
 // MaintenanceJob.Text:='';
  //MaintenanceJob.ItemIndex:=-1;
 // MaintenanceJob.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MaintenanceGroupArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupList '+CompanyId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(MaintenanceGroupArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        MaintenanceGroupArr[IntCount][0]:=Qry.FieldValues['maintenance_group_id'];
        MaintenanceGroupArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
    MaintenanceGroup.Items.Add(MaintenanceGroupArr[IntCount][1]);
end;

procedure TMaintenanceGroupJobList.RefreshJob;
var Qry:TADOQuery;
    StrQry,StrMaintenanceGrpId:String;
    IntCount:Integer;
begin
{  MaintenanceJob.Text:='';
  MaintenanceJob.ItemIndex:=-1;
  MaintenanceJob.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MaintenanceJobArr,0);
  if Main.OpenDb then begin
    StrMaintenanceGrpId:=MaintenanceGroupArr[MaintenanceGroup.ItemIndex][0];
    StrQry:='EXEC GetMaintenanceJobList '+CompanyId+',@MaintenanceGroupId='+StrMaintenanceGrpId+';';
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
    MaintenanceJob.Items.Add(MaintenanceJobArr[IntCount][1]); }
end;

procedure TMaintenanceGroupJobList.Input(IsEnable:Boolean);
begin
 // GroupInput.Enabled:=IsEnable;
 // Simpan.Visible:=IsEnable;
end;

procedure TMaintenanceGroupJobList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceGroupJobList.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceGroupJobList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if StrMaintenanceGrpId<>'' then begin
   // Active.Visible:=True;
    LoadData;
  end;
  if IsView then Input(False)
  else Input(True);
  Initiation:=False;
end;

procedure TMaintenanceGroupJobList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=110;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=70;
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Pekerjaan';
  StrGrid.Cells[2,0]:='Keterangan';
  StrGrid.Cells[3,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
end;

procedure TMaintenanceGroupJobList.LoadDataGrid;
var Qry:TADOQuery;
    StrQry,StrMaintenanceGroupId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
    if MaintenanceGroupArr[IntCount][1]=MaintenanceGroup.Text then StrMaintenanceGroupId:=MaintenanceGroupArr[IntCount][0];
  if Main.OpenDb then begin
    StrQry:='EXEC GetMaintenanceGroupDetailList '+QuotedStr(StrMaintenanceGroupId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MaintenanceGroupListArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MaintenanceGroupListArr[IntCount][0]:=Qry.FieldValues['maintenance_group_detail_id'];
      MaintenanceGroupListArr[IntCount][1]:=Qry.FieldValues['type_name']+' '+Qry.FieldValues['job_name'];
      if Qry.FieldValues['description']<>NULL then
      MaintenanceGroupListArr[IntCount][2]:=Qry.FieldValues['description'];
      if Qry.FieldValues['status']=1 then MaintenanceGroupListArr[IntCount][3]:='Active' else MaintenanceGroupListArr[IntCount][3]:='Non Aktif';
      Inc(IntCount);
      Qry.Next;
    end;
  end;
  Qry.Close;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TMaintenanceGroupJobList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(MaintenanceGroupListArr)>0 then StrGrid.RowCount:=Length(MaintenanceGroupListArr)+1
  else StrGrid.RowCount:=2;
  for IntCount:=0 to Length(MaintenanceGroupListArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=MaintenanceGroupListArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=MaintenanceGroupListArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=MaintenanceGroupListArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=MaintenanceGroupListArr[IntCount][3];
  end;
end;


procedure TMaintenanceGroupJobList.MaintenanceJobChange(Sender: TObject);
begin
  RefreshJob;
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
end;

procedure TMaintenanceGroupJobList.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrTransId,StrMaintenanceGroupId,StrMaintenanceJobId,StrDescription:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
 { if (Trim(MaintenanceGroup.Text)<>'') and (Trim(MaintenanceJob.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
   // if Active.Checked then IntActive:=1 else IntActive:=0;
   // if Trim(StrDescription)<>'' then StrDescription:=QuotedStr(Trim(Description.Text)) else StrDescription:='NULL';
    for IntCount:=0 to Length(MaintenanceGroupArr)-1 do
      if MaintenanceGroupArr[IntCount][1]=MaintenanceGroup.Text then StrMaintenanceGroupId:=MaintenanceGroupArr[IntCount][0];
    for IntCount:=0 to Length(MaintenanceJobArr)-1 do
      if MaintenanceJobArr[IntCount][1]=MaintenanceJob.Text then StrMaintenanceJobId:=MaintenanceJobArr[IntCount][0];
    if Main.OpenDb then begin
      DisableInput;
      if StrMaintenanceGrpId<>'' then
        StrQry:='UPDATE wh_maintenance_group_detail SET decription='+StrDescription+',status='+IntToStr(IntActive)+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE maintenance_group_id='+QuotedStr(MaintenanceGroupId.Text)+';'
      else
        StrTransId:=StrMaintenanceGroupId+StrMaintenanceJobId;
      {  StrQry:='INSERT INTO wh_maintenance_group_detail (maintenance_group_detail_id,maintenance_group_id,maintenance_job_id,description,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrMaintenanceGroupId)+
                ','+QuotedStr(StrMaintenanceJobId)+','+QuotedStr(Description.Text)+','+QuotedStr(User)+');';

      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Group Maintenance';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(Handle,'Berhasil menyimpan Group Maintenance','Group Maintenance',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      LoadDataGrid;
      RefreshGrid;
      Bersihkan.SetFocus;
    end else begin
      EnableInput;
      MessageBox(Handle,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Group Maintenance',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;  } 
end;

procedure TMaintenanceGroupJobList.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  EnableInput;
  MaintenanceGroup.SetFocus;
end;

procedure TMaintenanceGroupJobList.DisableInput;
begin

end;

procedure TMaintenanceGroupJobList.EnableInput;
begin
end;

procedure TMaintenanceGroupJobList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMaintenanceGroupJobList.StrGridDblClick(Sender: TObject);
begin
 if Main.IsFormOpen('MaintenanceJobFormEdit')=False then
  MaintenanceJobFormEdit:=TMaintenanceJobFormEdit.Create(Self,StrGrid.Cells[0,IntRow]);
end;

end.
