unit FormTemplateU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit;

type
  TFormTemplate = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AskDelete(SubMenuId:String);
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  FormTemplate: TFormTemplate;
  SubMenuArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, ADODB, StrUtils, SubMenuFormU;

{$R *.dfm}

procedure TFormTemplate.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=120;
  StrGrid.ColWidths[3]:=180;
  StrGrid.Cells[0,0]:='Sub Menu Id';
  StrGrid.Cells[1,0]:='Menu';
  StrGrid.Cells[2,0]:='Sub Menu';
  StrGrid.Cells[3,0]:='Description';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
end;

procedure TFormTemplate.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_sub_menu a INNER JOIN wh_menu b ON b.menu_id=a.menu_id';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SubMenuArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SubMenuArr[IntCount][0]:=Qry.FieldValues['sub_menu_id'];
      SubMenuArr[IntCount][1]:=Qry.FieldValues['menu'];
      SubMenuArr[IntCount][2]:=Qry.FieldValues['sub_menu'];
      if Qry.FieldValues['sub_menu_description']<>NULL then
      SubMenuArr[IntCount][3]:=Qry.FieldValues['sub_menu_description'];
      if Qry.FieldValues['active']=1 then SubMenuArr[IntCount][4]:='Active' else SubMenuArr[IntCount][4]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TFormTemplate.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(SubMenuArr)>0 then StrGrid.RowCount:=Length(SubMenuArr)+1;
  for IntCount:=0 to Length(SubMenuArr)-1 do begin
    for IntCount2:=0 to 4 do StrGrid.Cells[IntCount2,IntCount+1]:=SubMenuArr[IntCount][IntCount2];
  end;
end;

procedure TFormTemplate.AskDelete(SubMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(SubMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Sub Menu Id '+SubMenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_sub_menu WHERE sub_menu_id='+Chr(39)+SubMenuId+Chr(39)+';';
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
          MessageBox(0,'Berhasil Menghapus Sub Menu','Sub Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Sub Menu',MB_OK or MB_ICONERROR);
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

procedure TFormTemplate.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TFormTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormTemplate.SelesaiClick(Sender: TObject);
begin
  SubMenuList.Close;
end;

procedure TFormTemplate.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(SubMenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(SubMenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4,Count2-1]:=SubMenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TFormTemplate.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TFormTemplate.StrGridDblClick(Sender: TObject);
begin
  if (RightStr(IntToStr(TreeTag),2)='04') then SubMenuForm:=TSubMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
  else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
  else SubMenuForm:=TSubMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

end.
