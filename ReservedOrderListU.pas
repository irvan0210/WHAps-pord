unit ReservedOrderListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TReservedOrderList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    btnRefresh: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridHDblClick(Sender: TObject);
    procedure StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCariChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    ReservedOrderArr:Array of TArrString5;
    IntRow:integer;


    procedure ClearDataGrid;
    procedure LoadDataHeader;
    procedure RefreshList;


  public
    { Public declarations }
  end;

var
  ReservedOrderList: TReservedOrderList;


implementation

uses MainU, ReservedOrderU;

{$R *.dfm}

procedure TReservedOrderList.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGridH.RowCount:=2;

  for Count2:=0 to 3 do
  StrGridH.Cells[Count2,1]:='';


end;


procedure TReservedOrderList.LoadDataHeader;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXECUTE GetReservedOrderWHDCMany ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(ReservedOrderArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
      while Not(Qry.Eof) do begin

      if Qry.FieldValues['reserved_order_id']<>NULL then
      ReservedOrderArr[Count][0]:=Qry.FieldValues['reserved_order_id'];

      if Qry.FieldValues['nama_customer']<>NULL then
      ReservedOrderArr[Count][1]:=Qry.FieldValues['nama_customer'];

      if Qry.FieldValues['date_use']<>NULL then
      ReservedOrderArr[Count][2]:=Qry.FieldValues['date_use'];
      
      if Qry.FieldValues['sales_id']<>NULL then
      ReservedOrderArr[Count][3]:=Qry.FieldValues['sales_id'];

      Inc(Count);
      
      Qry.Next;
      end;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TReservedOrderList.RefreshList;
var
  IntCount:Integer;
begin

  if Length(ReservedOrderArr)>0 then
  StrGridH.RowCount:=Length(ReservedOrderArr)+1;
  for IntCount:=0 to Length(ReservedOrderArr)-1 do begin
    StrGridH.Cells[0,IntCount+1]:=ReservedOrderArr[IntCount][0];
    StrGridH.Cells[1,IntCount+1]:=ReservedOrderArr[IntCount][1];
    StrGridH.Cells[2,IntCount+1]:=ReservedOrderArr[IntCount][2];
    StrGridH.Cells[3,IntCount+1]:=ReservedOrderArr[IntCount][3];
  end;

end;




procedure TReservedOrderList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReservedOrderList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TReservedOrderList.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGridH.Cells[0,0]:='ID';
  StrGridH.Cells[1,0]:='Nama Pelanggan';
  StrGridH.Cells[2,0]:='Tgl. Pesan';
  StrGridH.Cells[3,0]:='Sales';

  StrGridH.ColWidths[0]:=120;
  StrGridH.ColWidths[1]:=200;
  StrGridH.ColWidths[2]:=100;
  StrGridH.ColWidths[3]:=100;
end;

procedure TReservedOrderList.FormShow(Sender: TObject);
begin
  LoadDataHeader;
  RefreshList;
end;

procedure TReservedOrderList.StrGridHDblClick(Sender: TObject);
begin
  //ShowMessage(RightStr(IntToStr(TreeTag),2));
  //ShowMessage(StrGridH.Cells[0,IntRow]);

  //UPDATE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
    ReservedOrder:=TReservedOrder.Create(Self,StrGridH.Cells[0,IntRow],'','U',True);

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
    ReservedOrder:=TReservedOrder.Create(Self,StrGridH.Cells[0,IntRow],'','L',True);

  end;
  

end;

procedure TReservedOrderList.StrGridHSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TReservedOrderList.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
  Close;
end;

procedure TReservedOrderList.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    //Init;
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(ReservedOrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
      if (StrPos(PChar(UpperCase(ReservedOrderArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGridH.RowCount:=Count2;
          for Count4:=0 to 5 do
          StrGridH.Cells[Count4,Count2-1]:=ReservedOrderArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

procedure TReservedOrderList.btnRefreshClick(Sender: TObject);
begin
  LoadDataHeader;
  RefreshList;
end;

end.
