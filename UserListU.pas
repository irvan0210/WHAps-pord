unit UserListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, MD5, ADODB, ZColorStringGrid, WHUnit;

type
  TUserList = class(TForm)
    Selesai: TButton;
    Cari: TEdit;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshGrid;
    procedure DoAction;
  public
    { Public declarations }
    procedure RefreshList;
  end;

var
  UserList: TUserList;
  Row:Integer;
  EmplArr:Array of TArrString7;
implementation

{$R *.dfm}

Uses MainU,AddUserU,UserFormU, DB, UserSignatureU,
  TroubleshootingRequestFormU;

procedure TUserList.DoAction;
var Result:Integer;
    Str,QStr:String;
    QUser:TADOQuery;
begin
  Case TreeTag of
    110102:begin
        Str:='User '+StrGrid.Cells[1,Row]+'('+StrGrid.Cells[2,Row]+') akan dihapus?';
        Result:=MessageBox(0,PChar(Str),'Delete User',MB_OKCANCEL or MB_ICONQUESTION);
        if Result=1 then begin
          Main.M_Busy;
          if Main.OpenDb then begin
            QUser:=TADOQuery.Create(Self);
            QUser.Connection:=Main.MyConnection;
            QStr:='DELETE FROM wh_user WHERE username='+Chr(39)+StrGrid.Cells[0,Row]+Chr(39)+';';
            QUser.SQL.Add(QStr);
            QUser.ExecSQL;
            if QUser.RowsAffected>0 then begin
              MessageBox(0,'User successfully Deleted','Delete User',MB_OK or MB_ICONINFORMATION);
            end;
            QUser.Close;
          end;
          QUser.Destroy;
          Main.CloseDb;
          Main.M_Normal;
          RefreshList;
        end;
    end;
    110103:begin
          UserForm:=TUserForm.Create(Self,StrGrid.Cells[0,Row],True);
    end;
    110104:begin
          UserForm:=TUserForm.Create(Self,StrGrid.Cells[0,Row],False);
    end;
    110106:begin
        UserSignature:=TUserSignature.Create(Self,StrGrid.Cells[0,Row]);
    end;
    //User Toubleshooting
    162601:begin
      TroubleshootingRequestForm.SetUser(StrGrid.Cells[0,Row]);
      Close;
    end;
  end;
end;

procedure TUserList.RefreshList;
var QUser:TADOQuery;
    QStr:String;
    Count:Integer;
begin
  Main.MyConnection.Open;
  QUser:=TADOQuery.Create(Self);
  QUser.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if GroupId<>'01' then begin
      QStr:='SELECT a.*,b.group_name,d.location,e.name AS company,g.name AS department_name '+
            ' FROM wh_user a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id '+
            ' INNER JOIN wh_company_location c ON c.company_location_id=a.company_location_id'+
            ' LEFT JOIN wh_location d ON d.location_id=c.location_id'+
            ' LEFT JOIN wh_company e ON e.company_id=c.company_id'+
            ' LEFT JOIN wh_user_detail f ON f.user_id=a.username'+
            ' LEFT JOIN wh_department g ON g.department_id=f.department_id'+
            ' WHERE UPPER(a.username)<>'+Chr(39)+User+Chr(39)+';';
    end else begin
      QStr:='SELECT a.*,b.group_name,d.location,e.name AS company,g.name AS department_name '+
            ' FROM wh_user a '+
            ' INNER JOIN wh_user_group b ON a.user_group_id=b.user_group_id '+
            ' INNER JOIN wh_company_location c ON c.company_location_id=a.company_location_id'+
            ' LEFT JOIN wh_location d ON d.location_id=c.location_id'+
            ' LEFT JOIN wh_company e ON e.company_id=c.company_id'+
            ' LEFT JOIN wh_user_detail f ON f.user_id=a.username'+
            ' LEFT JOIN wh_department g ON g.department_id=f.department_id;'
    end;
    QUser.SQL.Add(QStr);
    QUser.Open;
    Count:=0;
    SetLength(EmplArr,QUser.RecordCount);
    if (QUser.RecordCount>0) then while not(QUser.Eof) do begin
      EmplArr[Count][0]:=QUser.FieldValues['username'];
      if QUser.FieldValues['name']<>null then EmplArr[Count][1]:=QUser.FieldValues['name'];
      EmplArr[Count][2]:=QUser.FieldValues['group_name'];
      if QUser.FieldValues['employee_id']<>null then EmplArr[Count][3]:=QUser.FieldValues['employee_id'];
      if QUser.FieldValues['company']<>NULL then EmplArr[Count][4]:=QUser.FieldValues['company'];
      if QUser.FieldValues['location']<>NULL then EmplArr[Count][5]:=QUser.FieldValues['location'];
      if QUser.FieldValues['department_name']<>NULL then EmplArr[Count][6]:=QUser.FieldValues['department_name'];
      if QUser.FieldValues['active']=1 then EmplArr[Count][7]:=' Active' else EmplArr[Count][7]:=' Disable';
      QUser.Next;
      Inc(Count);
    end;
    QUser.Close;
  end;
  QUser.Destroy;
  Main.CloseDb;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TUserList.RefreshGrid;
var Count,Count2:Integer;
begin
  StrGrid.RowCount:=Length(EmplArr)+1;
  for Count:=0 to Length(EmplArr)-1 do
    for Count2:=0 to 7 do
      StrGrid.Cells[Count2,Count+1]:=EmplArr[Count][Count2];

end;

procedure TUserList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=8;
  StrGrid.Cells[0,0]:='Username';
  StrGrid.Cells[1,0]:='Name';
  StrGrid.Cells[2,0]:='User Group Id';
  StrGrid.Cells[3,0]:='Employee Id';
  StrGrid.Cells[4,0]:='Company';
  StrGrid.Cells[5,0]:='Location';
  StrGrid.Cells[6,0]:='Department';
  StrGrid.Cells[7,0]:='Status';
  StrGrid.ColWidths[0]:=100;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=50;
  for IntCount:=0 to 6 do StrGrid.Cells[IntCount,1]:='';
  RefreshList;
end;

procedure TUserList.Init;
begin
  Cari.Text:='';
  InitGrid;
  RefreshGrid;
end;

procedure TUserList.SelesaiClick(Sender: TObject);
begin
  UserList.Close;
end;

procedure TUserList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserList.StrGridDblClick(Sender: TObject);
begin
  DoAction;
end;

procedure TUserList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Row:=ARow;
end;

procedure TUserList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then DoAction;
  if Key=#27 then UserList.Close; 

end;

procedure TUserList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
        if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TUserList.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TUserList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

end.
