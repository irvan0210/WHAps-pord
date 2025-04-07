unit DetailOrderEstimasiBudgetFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit;

type
  TDetailOrderEstimasiBudgetForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    NoOrder: TEdit;
    Tanggal: TEdit;
    Customer: TEdit;
    Rute: TMemo;
    JenisArmada: TEdit;
    Label9: TLabel;
    Seat: TEdit;
    NoPol: TEdit;
    Driver: TEdit;
    Keterangan: TMemo;
    Label10: TLabel;
    Hari: TEdit;
    Label11: TLabel;
    TripType: TComboBox;
    Panel1: TPanel;
    btn1: TButton;
    Button1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    CustomerOrderDetailID :string;
    TripTypeArr:Array of TArrString8;

  public
    { Public declarations }
    procedure Trip_Type;
    procedure Init;
    constructor Create(AOwner:TComponent;Customer_Order_Detail_Id:String='');Overload;
  end;

var
  DetailOrderEstimasiBudgetForm: TDetailOrderEstimasiBudgetForm;


implementation

uses
  MainU, CustomerU, BudgetListU;

{$R *.dfm}
constructor TDetailOrderEstimasiBudgetForm.Create(AOwner:TComponent;Customer_Order_Detail_Id:String='');
begin
  CustomerOrderDetailID:=Customer_Order_Detail_Id;
  inherited Create(AOwner);
end;

procedure TDetailOrderEstimasiBudgetForm.Init;
begin
  NoOrder.Text:='';
  Tanggal.Text:='';
  Customer.Text:='';
  Hari.Text:='';
  Rute.Text:='';
  JenisArmada.Text:='';
  Seat.Text:='';
  NoPol.Text:='';
  Driver.Text:='';
  Keterangan.Text:='';
  TripType.ItemIndex:=-1;
end;

procedure TDetailOrderEstimasiBudgetForm.Trip_Type;
  var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  QStr:='SELECT trip_type_id,trip_type_name from wh_trip_type where status=1' ;

  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(TripTypeArr,Count+1);
    TripTypeArr[Count][0]:=Qry.FieldValues['trip_type_id'];
    TripTypeArr[Count][1]:=Qry.FieldValues['trip_type_name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  TripType.Clear;
  For Count:=0 to Length(TripTypeArr)-1 do begin
    TripType.Items.Add(TripTypeArr[Count][1]);
  end;
end;

procedure TDetailOrderEstimasiBudgetForm.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TDetailOrderEstimasiBudgetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDetailOrderEstimasiBudgetForm.Button1Click(Sender: TObject);
var StrQry,StrEMessage,StrMsg,StrTripType:String;
    Qry:TADOQuery;
    IsOk: Boolean;
begin
  if TripType.Text='Luar Kota' then
  begin
    StrTripType :='LuarKota'
  end else if TripType.Text='Fullday' then
  begin
    StrTripType:='FullDay'
  end else  if TripType.Text='Luar Kota Jauh' then
  begin
    StrTripType:='LuarKotaJauh'
  end else if TripType.Text='Halfday' then
  begin
    StrTripType:='HalfDay'
  end else begin
    StrTripType:=TripType.Text;
  end;
  IsOk:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    StrQry:='UPDATE wh_customer_order_detail SET trip_type='+QuotedStr(StrTripType)+' WHERE customer_order_detail_id='+QuotedStr(CustomerOrderDetailID)+' AND status=1; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,4);
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
      on E:Exception do begin
        MessageBox(0,'Gagal Ubah Trip Type','',MB_OK or MB_ICONWARNING);
        IsOk:=False;
      end;
    end;
  end;

  if IsOk then begin
    Main.TransCommit;
    MessageBox(0,'Trip Type Berhasil Disimpan','Detail Perjalanan Order',MB_OK or MB_ICONINFORMATION);
    if Main.IsFormOpen('BudgetListRpt')=True then
    begin
      BudgetListRpt.RefreshData;
      BudgetListRpt.RefreshGrid;
    end;
  end;
  Qry.Close;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  Close;
end;

end.
