unit MemoListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, frxpngimage, ExtCtrls, Buttons;

type
  TMemoList = class(TForm)
    StrGrid: TStringGrid;
    Panel1: TPanel;
    delete: TBitBtn;
    add_new: TBitBtn;
    preview: TBitBtn;
    Selesai: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Cari: TEdit;
    Image1: TImage;
    StaticText1: TStaticText;
    btn_cari: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure add_newClick(Sender: TObject);
  private
    { Private declarations }
    procedure AskDelete(MenuId:String);
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  MemoList: TMemoList;
  MenuArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU, MenuFormU, StrUtils, MemoFormU;

{$R *.dfm}

procedure TMemoList.SelesaiClick(Sender: TObject);
begin
  MemoList.Close;
end;

procedure TMemoList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMemoList.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Menu';
  StrGrid.Cells[2,0]:='Description';
  StrGrid.Cells[3,0]:='Status';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
end;

procedure TMemoList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MenuArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MenuArr[IntCount][0]:=Qry.FieldValues['menu_id'];
      MenuArr[IntCount][1]:=Qry.FieldValues['menu'];
      MenuArr[IntCount][2]:=Qry.FieldValues['menu_description'];
      if Qry.FieldValues['menu_id'] then MenuArr[IntCount][3]:='Active' else MenuArr[IntCount][3]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TMemoList.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(MenuArr)>0 then StrGrid.RowCount:=Length(MenuArr)+1;
  for IntCount:=0 to Length(MenuArr)-1 do begin
    for IntCount2:=0 to 3 do StrGrid.Cells[IntCount2,IntCount+1]:=MenuArr[IntCount][IntCount2];
  end;
end;

procedure TMemoList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TMemoList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TMemoList.StrGridDblClick(Sender: TObject);
begin
  if (RightStr(IntToStr(TreeTag),2)='04') then MenuForm:=TMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
  else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
  else MenuForm:=TMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

procedure TMemoList.AskDelete(MenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(MenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Menu Id '+MenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_menu WHERE menu_id='+Chr(39)+MenuId+Chr(39)+';';
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
          MessageBox(0,'Berhasil Menghapus Menu','Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Menu',MB_OK or MB_ICONERROR);
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


procedure TMemoList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(MenuArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 3 do
      if (StrPos(PChar(UpperCase(MenuArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 3 do
          StrGrid.Cells[Count4,Count2-1]:=MenuArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMemoList.add_newClick(Sender: TObject);
begin
  MemoForm:=TMemoForm.Create(Self,'');
end;

end.
