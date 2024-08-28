unit SegmentListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TSegmentList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure StrGridHDblClick(Sender: TObject);
    procedure StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edtCariChange(Sender: TObject);
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
  SegmentList: TSegmentList;
  SegmentArr:Array of TArrString5;
  IntRow:integer;


implementation

uses MainU, SegmentU;

{$R *.dfm}


procedure TSegmentList.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGridH.RowCount:=2;

  for Count2:=0 to 2 do
  StrGridH.Cells[Count2,1]:='';


end;


procedure TSegmentList.LoadDataHeader;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXECUTE GetCustomerSegementWHDCMany ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(SegmentArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
      while Not(Qry.Eof) do begin

      if Qry.FieldValues['id']<>NULL then
      SegmentArr[Count][0]:=Qry.FieldValues['id'];

      if Qry.FieldValues['name']<>NULL then
      SegmentArr[Count][1]:=Qry.FieldValues['name'];
      
      if Qry.FieldValues['level']<>NULL then
      SegmentArr[Count][2]:=Qry.FieldValues['level'];

      if Qry.FieldValues['segment_id']<>NULL then
      SegmentArr[Count][3]:=Qry.FieldValues['segment_id'];

      Inc(Count);
      
      Qry.Next;
      end;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TSegmentList.RefreshList;
var
  IntCount:Integer;
begin

  if Length(SegmentArr)>0 then
  StrGridH.RowCount:=Length(SegmentArr)+1;
  for IntCount:=0 to Length(SegmentArr)-1 do begin
    StrGridH.Cells[0,IntCount+1]:=SegmentArr[IntCount][0];
    StrGridH.Cells[1,IntCount+1]:=SegmentArr[IntCount][1];
    StrGridH.Cells[2,IntCount+1]:=SegmentArr[IntCount][2];
    StrGridH.Cells[3,IntCount+1]:=SegmentArr[IntCount][3];
  end;

end;



procedure TSegmentList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSegmentList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TSegmentList.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGridH.Cells[0,0]:='ID';
  StrGridH.Cells[1,0]:='Nama Segement';
  StrGridH.Cells[2,0]:='Level';
  StrGridH.Cells[3,0]:='Segment ID';

  StrGridH.ColWidths[0]:=100;
  StrGridH.ColWidths[1]:=200;
  StrGridH.ColWidths[2]:=70;

end;

procedure TSegmentList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TSegmentList.FormShow(Sender: TObject);
begin
  LoadDataHeader;
  RefreshList;
end;

procedure TSegmentList.StrGridHDblClick(Sender: TObject);
begin
  //ShowMessage(RightStr(IntToStr(TreeTag),2));
  //ShowMessage(StrGridH.Cells[0,IntRow]);

  //UPDATE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
    Segment:=TSegment.Create(Self,StrGridH.Cells[3,IntRow],'','U',True);

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
    Segment:=TSegment.Create(Self,StrGridH.Cells[3,IntRow],'','L',True);

  end;


end;

procedure TSegmentList.StrGridHSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSegmentList.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    //Init;
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(SegmentArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(SegmentArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGridH.RowCount:=Count2;
          for Count4:=0 to 2 do
          StrGridH.Cells[Count4,Count2-1]:=SegmentArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;



end;

end.
