unit TitleListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB, StrUtils;


type
  TTitleList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridHDblClick(Sender: TObject);
    procedure StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    procedure ClearDataGrid;
    procedure LoadDataHeader;
    procedure RefreshList;



  public
    { Public declarations }
  end;

var
  TitleList: TTitleList;
  TitleArr:Array of TArrString5;

implementation

uses MainU, TitleU;

{$R *.dfm}


procedure TTitleList.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGridH.RowCount:=2;


  for Count2:=0 to 3 do
  StrGridH.Cells[Count2,1]:='';



end;


procedure TTitleList.LoadDataHeader;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT title_id, title, remark, status FROM wh_title ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(TitleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
      while Not(Qry.Eof) do begin
      if Qry.FieldValues['title_id']<>NULL then
      TitleArr[Count][0]:=Qry.FieldValues['title_id'];
      if Qry.FieldValues['title']<>NULL then
      TitleArr[Count][1]:=Qry.FieldValues['title'];
      if Qry.FieldValues['remark']<>NULL then
      TitleArr[Count][2]:=Qry.FieldValues['remark'];
      if Qry.FieldValues['status']<>NULL then
      TitleArr[Count][3]:=Qry.FieldValues['status'];

      Inc(Count);

      Qry.Next;
      end;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TTitleList.RefreshList;
var
  IntCount:Integer;
begin

  if Length(TitleArr)>0 then
  StrGridH.RowCount:=Length(TitleArr)+1;
  for IntCount:=0 to Length(TitleArr)-1 do begin
    StrGridH.Cells[0,IntCount+1]:=TitleArr[IntCount][0];
    StrGridH.Cells[1,IntCount+1]:=TitleArr[IntCount][1];
    StrGridH.Cells[2,IntCount+1]:=TitleArr[IntCount][2];
    StrGridH.Cells[3,IntCount+1]:=TitleArr[IntCount][3];
  end;

end;



procedure TTitleList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTitleList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TTitleList.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGridH.Cells[0,0]:='ID';
  StrGridH.Cells[1,0]:='Title';
  StrGridH.Cells[2,0]:='Keterangan';
  StrGridH.Cells[3,0]:='Activasi';

  StrGridH.ColWidths[0]:=50;
  StrGridH.ColWidths[1]:=50;
  StrGridH.ColWidths[2]:=200;
  StrGridH.ColWidths[3]:=50;

end;

procedure TTitleList.FormShow(Sender: TObject);
begin
  LoadDataHeader;
  RefreshList;
end;

procedure TTitleList.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    ClearDataGrid;  
    Count2:=2;
    for Count:=0 to Length(TitleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(TitleArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGridH.RowCount:=Count2;
          for Count4:=0 to 2 do
          StrGridH.Cells[Count4,Count2-1]:=TitleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

procedure TTitleList.StrGridHDblClick(Sender: TObject);
begin
  //ShowMessage(RightStr(IntToStr(TreeTag),2));
  //ShowMessage(StrGridH.Cells[4,IntRow]);

  //UPDATE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
    Title:=TTitle.Create(Self,StrGridH.Cells[0,IntRow],'','U',True);

  end
  else
  //DELETE DATA
  if (RightStr(IntToStr(TreeTag),2)='03') then begin
  //AskDelete(StrGrid.Cells[0,IntRow],StrGrid.Cells[1,IntRow]);
  //Lead:=TLead.Create(Self,StrGridH.Cells[6,IntRow],StrGridH.Cells[7,IntRow],'H',True);
  end
  else
  //LEAD LIST
  if (RightStr(IntToStr(TreeTag),2)='04') then begin
    Title:=TTitle.Create(Self,StrGridH.Cells[0,IntRow],'','L',True);

  end;

end;

procedure TTitleList.StrGridHSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TTitleList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

end.
