unit PaymentReceivedListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, ADODB, WHUnit, StrUtils;

type
  TPaymentReceivedList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure edtCariKeyPress(Sender: TObject; var Key: Char);
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

    procedure LoadDataHeader;
    procedure RefreshList;
    procedure ClearDataGrid;



  public
    { Public declarations }
  end;

var
  PaymentReceivedList: TPaymentReceivedList;
  PaymentRecArr:Array of TArrString9;
  IntRow:Integer;

implementation

uses MainU, PaymentReceivedU;

{$R *.dfm}

procedure TPaymentReceivedList.LoadDataHeader;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXECUTE GetPaymentReceivedMany';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(PaymentRecArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin

      PaymentRecArr[Count][0]:=Qry.FieldValues['payment_recv_id'];

      if Qry.FieldValues['nama_company']<>NULL then
      PaymentRecArr[Count][1]:=Qry.FieldValues['nama_company'];

      if Qry.FieldValues['date']<>NULL then
      PaymentRecArr[Count][2]:=Qry.FieldValues['date'];

      if Qry.FieldValues['jum_data']<>NULL then
      PaymentRecArr[Count][3]:=Qry.FieldValues['jum_data'];

      if Qry.FieldValues['total']<>NULL then
      PaymentRecArr[Count][4]:=Qry.FieldValues['total'];


      Inc(Count);
      Qry.Next;
    end;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TPaymentReceivedList.RefreshList;
var
  IntCount:Integer;
begin

  if Length(PaymentRecArr)>0 then
  StrGridH.RowCount:=Length(PaymentRecArr)+1;
  for IntCount:=0 to Length(PaymentRecArr)-1 do begin
    StrGridH.Cells[0,IntCount+1]:=PaymentRecArr[IntCount][0];
    StrGridH.Cells[1,IntCount+1]:=PaymentRecArr[IntCount][1];
    StrGridH.Cells[2,IntCount+1]:=PaymentRecArr[IntCount][2];
    StrGridH.Cells[3,IntCount+1]:=PaymentRecArr[IntCount][3];
    StrGridH.Cells[4,IntCount+1]:= SToCurr(ToString(PaymentRecArr[IntCount][4]));
        
  end;

end;

procedure TPaymentReceivedList.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGridH.RowCount:=2;

  for Count2:=0 to 4 do
  StrGridH.Cells[Count2,1]:='';


end;




procedure TPaymentReceivedList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPaymentReceivedList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPaymentReceivedList.edtCariKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #27 then
   PaymentReceivedList.Close;
end;

procedure TPaymentReceivedList.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGridH.Cells[0,0]:='ID ';
  StrGridH.Cells[1,0]:='Nama Company';
  StrGridH.Cells[2,0]:='Tgl. Pembayaran';
  StrGridH.Cells[3,0]:='Jumlah Data';
  StrGridH.Cells[4,0]:='Total';

  StrGridH.ColWidths[0]:=80;
  StrGridH.ColWidths[1]:=200;
  StrGridH.ColWidths[2]:=100;
  StrGridH.ColWidths[3]:=70;
  StrGridH.ColWidths[4]:=70;

end;

procedure TPaymentReceivedList.FormShow(Sender: TObject);
begin
  LoadDataHeader;
  RefreshList;
end;

procedure TPaymentReceivedList.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin

  if Trim(edtCari.Text)<>'' then begin
    //Init;
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(PaymentRecArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(PaymentRecArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGridH.RowCount:=Count2;
          for Count4:=0 to 4 do
          StrGridH.Cells[Count4,Count2-1]:=PaymentRecArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

procedure TPaymentReceivedList.StrGridHDblClick(Sender: TObject);
begin
  //ShowMessage(RightStr(IntToStr(TreeTag),2));
  //ShowMessage(StrGridH.Cells[0,IntRow]);

  //UPDATE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
    PaymentReceived:=TPaymentReceived.Create(Self,StrGridH.Cells[0,IntRow],'','U',True);

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
    PaymentReceived:=TPaymentReceived.Create(Self,StrGridH.Cells[0,IntRow],'','L',True);

  end;

end;

procedure TPaymentReceivedList.StrGridHSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TPaymentReceivedList.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  Close;
  
end;

end.
