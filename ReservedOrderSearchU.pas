unit ReservedOrderSearchU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB;

type
  TReservedOrderSearch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    btnBatal: TButton;
    Panel2: TPanel;
    StrGrid: TZColorStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBatalClick(Sender: TObject);
    procedure btnSelesaiClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
     StrQry,StrMsg,StrEMessage:string;
     IsOk:boolean;

    CustOrderArr:Array of TArrString7;
    IntRow:Integer;

    procedure LoadData;
    procedure RefreshList;


  public
    { Public declarations }
     DataVhcBatchID,FormDari:String;
     IsView:Boolean;

     constructor Create(AOwner:TComponent;VhcBatchID,FormFrom:String;IsViewOnly:Boolean=False);
  end;

var
  ReservedOrderSearch: TReservedOrderSearch;

implementation

uses MainU, CreateSPJWHDCNormalListU, CreateSPJWHDCNormalU;

{$R *.dfm}

constructor TReservedOrderSearch.Create(AOwner:TComponent;VhcBatchID,FormFrom:String;IsViewOnly:Boolean=False);
begin
  DataVhcBatchID:=VhcBatchID;
  FormDari:=FormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;


procedure TReservedOrderSearch.LoadData;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:=' SELECT t1.reserved_order_id, t2.customer_order_id, t3.name as nama_cus '+
            ' FROM wh_reserved_order t1 '+
            ' LEFT JOIN wh_customer_order t2 '+
            ' ON t1.customer_order_id=t2.customer_order_id '+
            ' LEFT JOIN wh_customer t3 '+
            ' ON t2.customer_id=t3.customer_id '+
            ' LEFT JOIN wh_customer_link t4 '+
            ' ON customer_link_id=(SELECT MAX(customer_link_id) FROM wh_customer_link WHERE company_id IN(2,8)) '+
            ' WHERE t2.status=1 AND t2.is_proses_invoice=1 AND t2.is_cetak_invoice=1 AND is_proses_spj_reservation=0 AND is_cetak_spj=0 ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(CustOrderArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['reserved_order_id']<>NULL then
      CustOrderArr[Count][0]:=Qry.FieldValues['reserved_order_id'];

       if Qry.FieldValues['customer_order_id']<>NULL then
      CustOrderArr[Count][1]:=Qry.FieldValues['customer_order_id'];

      if Qry.FieldValues['nama_cus']<>NULL then
      CustOrderArr[Count][2]:=Qry.FieldValues['nama_cus'];



      Inc(Count);
      Qry.Next;
    end;
    
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TReservedOrderSearch.RefreshList;
var
  IntCount:Integer;
begin

  if Length(CustOrderArr)>0 then
  StrGrid.RowCount:=Length(CustOrderArr)+1;
  for IntCount:=0 to Length(CustOrderArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=CustOrderArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=CustOrderArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=CustOrderArr[IntCount][2];
    
  end;

end;



procedure TReservedOrderSearch.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='ID Customer Order ';
  StrGrid.Cells[2,0]:='Nama Pelanggan';

  StrGrid.ColWidths[0]:=120;
  StrGrid.ColWidths[1]:=120;
  StrGrid.ColWidths[2]:=200;
end;

procedure TReservedOrderSearch.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TReservedOrderSearch.FormShow(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TReservedOrderSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReservedOrderSearch.btnBatalClick(Sender: TObject);
begin
  if FormDari='CreateSPJWHDCNormalU' then begin
     CreateSPJWHDCNormal.edtIDBO.Clear;
     CreateSPJWHDCNormal.edtIDCustOrder.Clear;
     
     CreateSPJWHDCNormal.edtIDCustomer.Clear;
     CreateSPJWHDCNormal.edtNamaCustomer.Clear;
     CreateSPJWHDCNormal.edtNoKontrak.Clear;
     CreateSPJWHDCNormal.cbkKontrak.Checked:=False;
  end;
  Close;
end;

procedure TReservedOrderSearch.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TReservedOrderSearch.StrGridDblClick(Sender: TObject);
begin
  if FormDari='CreateSPJWHDCNormalU' then begin
     CreateSPJWHDCNormal.edtIDBO.Text:=StrGrid.Cells[0,IntRow];
     CreateSPJWHDCNormal.edtIDCustOrder.Text:=StrGrid.Cells[1,IntRow];
  end;
  Close;
end;

procedure TReservedOrderSearch.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

end.
