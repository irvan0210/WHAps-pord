unit UserLocationListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit;

type
  TUserLocationList = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    UserLocationArr:Array of TArrString8;
    IntRow:Integer;
    FormRequest:String;
    IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure AskDelete(TreeMenuId:String);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);Overload;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  UserLocationList: TUserLocationList;

implementation

uses MainU, ADODB, StrUtils, UserLocationFormU;

{$R *.dfm}

constructor TUserLocationList.Create(AOwner:TComponent;Form_Request:String='';Is_Input:Boolean=False);
begin
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Inherited Create(AOwner);
end;

procedure TUserLocationList.Init;
begin
  Cari.Text:=''; 
  InitGrid;
end;

procedure TUserLocationList.InitGrid;
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

procedure TUserLocationList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetUserCompanyLocationList ;';
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

procedure TUserLocationList.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(UserLocationArr)>0 then StrGrid.RowCount:=Length(UserLocationArr)+1;
  for IntCount:=0 to Length(UserLocationArr)-1 do begin
    for IntCount2:=0 to 4 do StrGrid.Cells[IntCount2,IntCount+1]:=UserLocationArr[IntCount][IntCount2];
  end;
end;

procedure TUserLocationList.AskDelete(TreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(TreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Tree Menu Id '+TreeMenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
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
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','Tree Sub Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Tree Sub Menu',MB_OK or MB_ICONERROR);
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


procedure TUserLocationList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TUserLocationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserLocationList.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshList;
end;

procedure TUserLocationList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(UserLocationArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(UserLocationArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=UserLocationArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TUserLocationList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TUserLocationList.StrGridDblClick(Sender: TObject);
begin
  if FormRequest<>'' then begin
    if UpperCase(FormRequest)='MAIN-CHANGE' then begin
      UserLocationForm:=TUserLocationForm.Create(Self,StrGrid.Cells[0,IntRow],'USERLOCATION-CHANGE',True);
    end;
  end else UserLocationForm:=TUserLocationForm.Create(Self,StrGrid.Cells[0,IntRow],'',False);
{
  if (RightStr(IntToStr(TreeTag),2)='08') then
  else if (RightStr(IntToStr(TreeTag),2)='10') then AskDelete(StrGrid.Cells[0,IntRow])
}
end;

end.
