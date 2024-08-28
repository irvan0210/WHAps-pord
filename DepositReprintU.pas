unit DepositReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit;

type
  TDepositReprint = class(TForm)
    StrGrid: TStringGrid;
    Selesai: TButton;
    Cari: TEdit;
    Label1: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshList;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  DepositReprint: TDepositReprint;
  SPJArr:Array of TArrString20;
  IntRow:Integer;
implementation

uses MainU, DepositFormU, StrUtils;

{$R *.dfm}

procedure TDepositReprint.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No Slip';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No KPP';
  StrGrid.Cells[3,0]:='Mitra';
  StrGrid.Cells[4,0]:='Komisi';
  StrGrid.Cells[5,0]:='Total Setor';
  StrGrid.Cells[6,0]:='Tanggal';
  StrGrid.Cells[7,0]:='Jam';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  StrGrid.Cells[6,1]:='';
  StrGrid.Cells[7,1]:='';
end;

procedure TDepositReprint.RefreshList;
var Count:Integer;
begin
  StrGrid.RowCount:=Length(SPJArr)+1;
  for Count:=0 to Length(SPJArr)-1 do begin
    StrGrid.Cells[0,Count+1]:=SPJArr[Count][0];
    StrGrid.Cells[1,Count+1]:=SPJArr[Count][1];
    StrGrid.Cells[2,Count+1]:=SPJArr[Count][2];
    StrGrid.Cells[3,Count+1]:=SPJArr[Count][3];
    StrGrid.Cells[4,Count+1]:=SPJArr[Count][4];
    StrGrid.Cells[5,Count+1]:=SPJArr[Count][5];
    StrGrid.Cells[6,Count+1]:=SPJArr[Count][6];
    StrGrid.Cells[7,Count+1]:=SPJArr[Count][7];
  end;
end;

procedure TDepositReprint.RefreshData;
var Qry:TADOQuery;
    QStr:String;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetSlipSetoran '+LocationId+','+Chr(39)+Chr(39);
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(SPJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SPJArr[Count][0]:='SSM'+RightStr(Qry.FieldValues['vhc_trans_id'],Length(Qry.FieldValues['vhc_trans_id'])-3);
      SPJArr[Count][1]:=Qry.FieldValues['body_id'];
      SPJArr[Count][2]:=Qry.FieldValues['employee_id'];
      SPJArr[Count][3]:=Qry.FieldValues['name'];
      SPJArr[Count][4]:=SToCurr(Qry.FieldValues['commission']);
      SPJArr[Count][5]:=SToCurr(Qry.FieldValues['deposit']);
      SPJArr[Count][6]:=Qry.FieldValues['in_date'];
      SPJArr[Count][7]:=Qry.FieldValues['in_time'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TDepositReprint.SelesaiClick(Sender: TObject);
begin
  DepositReprint.Close;
end;

procedure TDepositReprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDepositReprint.FormCreate(Sender: TObject);
begin
  Init;
  RefreshData;
  RefreshList;
end;

procedure TDepositReprint.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TDepositReprint.StrGridDblClick(Sender: TObject);
begin
  DepositForm.Reprint('SPJ'+RightStr(StrGrid.Cells[0,IntRow],Length(StrGrid.Cells[0,IntRow])-3));
  DepositReprint.Close;
end;

procedure TDepositReprint.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'')  then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(SPJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
        if (StrPos(PChar(UpperCase(SPJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4,Count2-1]:=SPJArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    Init;
    RefreshList;
  end;
end;

end.
