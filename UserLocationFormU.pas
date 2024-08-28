unit UserLocationFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid;

type
  TUserLocationForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    LabelStatus: TLabel;
    Label5: TLabel;
    GroupId: TPanel;
    UserLocId: TEdit;
    GroupInput: TPanel;
    Active: TCheckBox;
    CompanyLocation: TComboBox;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    StrGrid: TZColorStringGrid;
    GroupInput1: TPanel;
    Username: TComboBox;
    Label1: TLabel;
    btnClear: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UsernameChange(Sender: TObject);
    procedure CompanyLocationChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameKeyPress(Sender: TObject; var Key: Char);
    procedure CompanyLocationKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    StrUserLocationId,FormRequest:String;
    IsInput:Boolean;
    UserArr,CompanyLocationArr,UserLocationArr:Array of TArrString8;
    procedure Init;
    procedure InitGrid;
    procedure RefreshUser;
    procedure RefreshCompanyLocation;
    procedure LoadDataGrid;
    procedure RefreshGrid;
    procedure LoadData;
    procedure EnableInput;
    procedure DisableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;UserLocationId:String='';Form_Request:String='';Is_Input:Boolean=False);Overload;
  end;

var
  UserLocationForm: TUserLocationForm;

implementation

uses MainU, ADODB, StrUtils, TreeMenuListU, UserLocationListU;

{$R *.dfm}

constructor TUserLocationForm.Create(AOwner:TComponent;UserLocationId:String='';Form_Request:String='';Is_Input:Boolean=False);
begin
  StrUserLocationId:=UserLocationId;
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Inherited Create(AOwner);
end;

procedure TUserLocationForm.Init;
begin
  GroupId.Enabled:=False;
  CompanyLocation.Clear;
  CompanyLocation.Text:='';
  CompanyLocation.ItemIndex:=-1;
  Username.Items.Clear;
  Username.Text:='';
  Username.ItemIndex:=-1;
  Active.Checked:=False;
  GroupId.Visible:=False;
  LabelStatus.Visible:=False;
  Active.Visible:=False;
end;

procedure TUserLocationForm.RefreshUser;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    //StrQry:='SELECT * FROM wh_user WHERE active=1 order by username ;';
    StrQry:='GetUserList 0, 0, @StatusId=1,@Ordered='+QuotedStr('a.name')+';';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        UserArr[IntCount][0]:=Qry.FieldValues['username'];
        UserArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(UserArr)-1 do
    Username.Items.Add(UserArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TUserLocationForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrCompanyLocation,StrUsername:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT dbo.GetUsername(a.user_id) AS name,c.name AS company,* '+
            'FROM wh_user_company_location a '+
            'INNER JOIN wh_company_location b ON b.company_location_id=a.company_location_id '+
            'INNER JOIN wh_company c ON c.company_id=b.company_id '+
            'INNER JOIN wh_location d ON d.location_id=b.location_id '+
            'WHERE a.user_company_location_id='+QuotedStr(StrUserLocationId)+';';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      UserLocId.Text:=Qry.FieldValues['user_company_location_id'];
      StrUsername:=Qry.FieldValues['name'];
      StrCompanyLocation:=Qry.FieldValues['company']+' '+Qry.FieldValues['location'];
      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Username.ItemIndex:=Username.Items.IndexOf(StrUsername);
  RefreshCompanyLocation;
  CompanyLocation.ItemIndex:=CompanyLocation.Items.IndexOf(StrCompanyLocation);
  LoadDataGrid;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TUserLocationForm.RefreshCompanyLocation;
var Qry:TADOQuery;
    StrQry,StrUserCompanyLocation:String;
    IntCount:Integer;
begin
  CompanyLocation.Items.Clear;
  CompanyLocation.Text:='';
  CompanyLocation.ItemIndex:=-1;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(CompanyLocationArr,0);
  if StrUserLocationId<>'' then StrUserCompanyLocation:='OR (b.user_company_location_id='+StrUserLocationId+') ' else StrUserCompanyLocation:='';
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company_location a '+
            'LEFT JOIN wh_user_company_location b ON (b.company_location_id=a.company_location_id) AND (b.user_id=dbo.GetUserId('+QuotedStr(Username.Text)+')) '+
            'LEFT JOIN wh_company c ON c.company_id=a.company_id '+
            'LEFT JOIN wh_location d ON d.location_id=a.location_id '+
            'WHERE ((b.user_company_location_id IS NULL) '+StrUserCompanyLocation+' ) ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(CompanyLocationArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        CompanyLocationArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
        CompanyLocationArr[IntCount][1]:=Qry.FieldValues['name']+' '+Qry.FieldValues['location'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyLocationArr)-1 do
    CompanyLocation.Items.Add(CompanyLocationArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TUserLocationForm.EnableInput;
begin
  GroupInput1.Enabled:=True;
  GroupInput.Enabled:=True;
  Simpan.Visible:=True;
end;

procedure TUserLocationForm.DisableInput;
begin
  GroupInput1.Enabled:=False;
  GroupInput.Enabled:=False;
  Simpan.Visible:=False;
end;


procedure TUserLocationForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshUser;
  if StrUserLocationId<>'' then begin
    GroupId.Visible:=True;
    Active.Visible:=True;
    LabelStatus.Visible:=True;
    LoadData;
  end;
  if IsInput then EnableInput
  else DisableInput;
end;

procedure TUserLocationForm.UsernameChange(Sender: TObject);
begin
  RefreshCompanyLocation;
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
end;

procedure TUserLocationForm.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=40;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=200;
  StrGrid.ColWidths[3]:=120;
  StrGrid.ColWidths[4]:=55;
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Name';
  StrGrid.Cells[2,0]:='Company';
  StrGrid.Cells[3,0]:='Location';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
end;

procedure TUserLocationForm.LoadDataGrid;
var Qry:TADOQuery;
    StrQry,StrSubMenuId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetUserCompanyLocationList @Name='+QuotedStr(Username.Text)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(UserLocationArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      UserLocationArr[IntCount][0]:=Qry.FieldValues['user_company_location_id'];
      UserLocationArr[IntCount][1]:=Qry.FieldValues['empl_name'];
      UserLocationArr[IntCount][2]:=Qry.FieldValues['corporate_name'];
      UserLocationArr[IntCount][3]:=Qry.FieldValues['location'];
      if Qry.FieldValues['active']=1 then UserLocationArr[IntCount][4]:='Active' else UserLocationArr[IntCount][4]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TUserLocationForm.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(UserLocationArr)>0 then StrGrid.RowCount:=Length(UserLocationArr)+1;
  for IntCount:=0 to Length(UserLocationArr)-1 do begin
    for IntCount2:=0 to 4 do StrGrid.Cells[IntCount2,IntCount+1]:=UserLocationArr[IntCount][IntCount2];
  end;
end;

procedure TUserLocationForm.CompanyLocationChange(Sender: TObject);
begin
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
end;

procedure TUserLocationForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrUsername,StrCompanyLocation:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(CompanyLocation.Text)<>'') and (Trim(Username.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    StrUsername:=UserArr[Username.ItemIndex][0];
    StrCompanyLocation:=CompanyLocationArr[CompanyLocation.ItemIndex][0];
    if Main.OpenDb then begin
      if StrUserLocationId<>'' then
        StrQry:='UPDATE wh_user_company_location SET company_location_id='+QuotedStr(StrCompanyLocation)+
                ',active='+IntToStr(IntActive)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE user_company_location_id='+QuotedStr(StrUserLocationId)+';'
      else
        StrQry:='INSERT INTO wh_user_company_location (user_id,company_location_id,update_time,update_user)'+
                ' VALUES ('+QuotedStr(StrUsername)+','+QuotedStr(StrCompanyLocation)+
                ',GETDATE(),'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah User Location';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;

    end;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan User Location','User Location',MB_OK or MB_ICONINFORMATION);
      Init;
      btnClearClick(Nil);
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'User Location',MB_OK or MB_ICONERROR);
    end;
  end;
  if Main.IsFormOpen('UserLocationList') then begin
    UserLocationList.RefreshList;
  end;
  //if IsOk then Close;
end;

procedure TUserLocationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserLocationForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TUserLocationForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TUserLocationForm.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CompanyLocation.SetFocus;
end;

procedure TUserLocationForm.CompanyLocationKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TUserLocationForm.btnClearClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshUser;
end;

end.
