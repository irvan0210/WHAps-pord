unit PaymentReprintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit;

type
  TPaymentReprint = class(TForm)
    Label1: TLabel;
    StrGrid: TStringGrid;
    Selesai: TButton;
    Cari: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshList;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  PaymentReprint: TPaymentReprint;
  PaymentArr:Array of TArrString20;
  IntRow:Integer;

implementation

uses MainU, ADODB, StrUtils;

{$R *.dfm}

procedure TPaymentReprint.Init;
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

procedure TPaymentReprint.RefreshList;
var Count:Integer;
begin
  StrGrid.RowCount:=Length(PaymentArr)+1;
  for Count:=0 to Length(PaymentArr)-1 do begin
    StrGrid.Cells[0,Count+1]:=PaymentArr[Count][0];
    StrGrid.Cells[1,Count+1]:=PaymentArr[Count][1];
    StrGrid.Cells[2,Count+1]:=PaymentArr[Count][2];
    StrGrid.Cells[3,Count+1]:=PaymentArr[Count][3];
    StrGrid.Cells[4,Count+1]:=SToCurr(PaymentArr[Count][4]);
    StrGrid.Cells[5,Count+1]:=SToCurr(PaymentArr[Count][5]);
    StrGrid.Cells[6,Count+1]:=PaymentArr[Count][6];
    StrGrid.Cells[7,Count+1]:=PaymentArr[Count][7];
  end;
end;

procedure TPaymentReprint.RefreshData;
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
    SetLength(PaymentArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      PaymentArr[Count][0]:='SSM'+RightStr(Qry.FieldValues['vhc_trans_id'],Length(Qry.FieldValues['vhc_trans_id'])-3);
      PaymentArr[Count][1]:=Qry.FieldValues['body_id'];
      PaymentArr[Count][2]:=Qry.FieldValues['employee_id'];
      PaymentArr[Count][3]:=Qry.FieldValues['name'];
      PaymentArr[Count][4]:=Qry.FieldValues['commission'];
      PaymentArr[Count][5]:=Qry.FieldValues['deposit'];
      PaymentArr[Count][6]:=Qry.FieldValues['in_date'];
      PaymentArr[Count][7]:=Qry.FieldValues['in_time'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;


procedure TPaymentReprint.SelesaiClick(Sender: TObject);
begin
  PaymentReprint.Close;
end;

procedure TPaymentReprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
