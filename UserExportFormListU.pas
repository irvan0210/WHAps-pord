unit UserExportFormListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
   TUserExportFormList = class(TForm)
    Button1: TButton;
    StrGrid: TZColorStringGrid;
    Cari: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshList;
    procedure FormShow(Sender: TObject);
    procedure LoadData;
    procedure CariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
   procedure AskDelete(UserExportlistId:String);
  private
    { Private declarations }
     procedure Init;
  public
    constructor Create(AOwner:TComponent;Edit_Type:Integer=0);Overload;
    { Public declarations }
  end;

var
  UserExportFormList: TUserExportFormList;
  ListUserExportId : string;
  EditType,IntRow:Integer;
  UserExportArr:Array of TArrString4;
implementation

uses MainU, ADODB,  StrUtils, UserExportFormU;
{$R *.dfm}
constructor TUserExportFormList.Create(AOwner:TComponent;Edit_Type:Integer=0);
begin
  EditType:=Edit_Type;
  Inherited Create(AOwner);
end;


procedure TUserExportFormList.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TUserExportFormList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TUserExportFormList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(UserExportArr)+1;
  for IntCount:=0 to Length(UserExportArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=UserExportArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=UserExportArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=UserExportArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=UserExportArr[IntCount][3];
  end;
end;

procedure TUserExportFormList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TUserExportFormList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=60;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=50;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Userame';
  StrGrid.Cells[2,0]:='Menu';
  StrGrid.Cells[3,0]:='Status';
  for IntCount:=0 to 3 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserExportFormList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT ux.user_export_id,ux.USER_ID, us.name, ts.tree_menu AS menu_name, ux.active  FROM dbo.wh_user_export ux '+
            ' LEFT JOIN dbo.wh_tree_sub_menu ts ON ts.tree_sub_menu_id=ux.form_id'+
            ' LEFT JOIN wh_user us ON us.username=ux.user_id'+
            ' WHERE ux.active =1 AND us.active =1'+
            ' ORDER BY ux.user_id, ts.tree_menu;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(UserExportArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        UserExportArr[IntCount][0]:=Qry.FieldValues['user_export_id'];
        UserExportArr[IntCount][1]:=Qry.FieldValues['name'];
        UserExportArr[IntCount][2]:=Qry.FieldValues['menu_name'];
       // UserExportArr[IntCount][3]:=Qry.FieldValues['active'];
        if Qry.FieldValues['active']=1 then UserExportArr[IntCount][3]:='Active'
        else UserExportArr[IntCount][3]:='Disable';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;


procedure TUserExportFormList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(UserExportArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(UserExportArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=UserExportArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;



procedure TUserExportFormList.StrGridDblClick(Sender: TObject);
begin
if Main.IsFormOpen('UserExportForm')=False then
    if (RightStr(IntToStr(TreeTag),2)='04') then
      UserExportForm:=TUserExportForm.Create(Self,StrGrid.Cells[0,IntRow],True)
    else if (RightStr(IntToStr(TreeTag),2)='03') then
      AskDelete(StrGrid.Cells[0,IntRow])
    else
      UserExportForm:=TUserExportForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

procedure TUserExportFormList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    IntRow:=ARow;
end;

procedure TUserExportFormList.AskDelete(UserExportlistId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(UserExportlistId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('User Export Menu Id '+UserExportlistId+' Mau Dihapus ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE FROM wh_user_export SET  active = 0 WHERE user_export_id='+Chr(39)+UserExportlistId+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
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
          MessageBox(0,'Berhasil Meng Export Menu','User Export Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Export Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Export Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;
end;

end.
