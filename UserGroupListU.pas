unit UserGroupListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TUserGroupList = class(TForm)
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshList;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Edit_Type:Integer=0);Overload;
  end;

var
  UserGroupList: TUserGroupList;
  EditType,IntRow:Integer;

implementation

uses MainU, ADODB, DB, UserGroupFormU;

{$R *.dfm}

constructor TUserGroupList.Create(AOwner:TComponent;Edit_Type:Integer=0);
begin
  EditType:=Edit_Type;
  Inherited Create(AOwner);
end;

procedure TUserGroupList.Init;
var IntCount:Integer;
begin
  IntRow:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=50;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=250;
  StrGrid.ColWidths[3]:=50;
  StrGrid.Cells[0,0]:='Group Id';
  StrGrid.Cells[1,0]:='Group Name';
  StrGrid.Cells[2,0]:='Group Detail';
  StrGrid.Cells[3,0]:='Status';
  for IntCount:=0 to 3 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TUserGroupList.RefreshList;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_group;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+1;
      IntCount:=1;
      while not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['user_group_id'];
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['group_name'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['group_detail'];
        if Qry.FieldValues['active']=1 then StrGrid.Cells[3,IntCount]:='Active'
        else StrGrid.Cells[3,IntCount]:='Disable';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  Qry.Destroy;
end;

procedure TUserGroupList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TUserGroupList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserGroupList.FormShow(Sender: TObject);
begin
  Init;
  RefreshList;
end;

procedure TUserGroupList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TUserGroupList.StrGridDblClick(Sender: TObject);
begin
  if EditType=1 then if Main.IsFormOpen('UserGroupForm')=False then UserGroupForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

procedure TUserGroupList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

end.
