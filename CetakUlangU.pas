unit CetakUlangU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ZColorStringGrid, StdCtrls,WHUnit, ADODB;

type
  TCetakUlang = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCetak: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Label1: TLabel;
    edtCari: TEdit;
    btnBatal: TButton;
    Label2: TLabel;
    edtDataID: TEdit;
    StrGrid: TZColorStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnCetakClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataArr:Array of TArrString7;
    IntRow:Integer;

    procedure LoadDataLeadOrder;
    procedure LoadDataCustomerOrder;
    procedure LoadDataInvoiceBus;



    procedure RefreshDataList;
    procedure ClearDataGrid;



  public
    { Public declarations }

    DataID,FormDari:String;
    IsView:Boolean;
    
    constructor Create(AOwner:TComponent;vDataID,vFormFrom:String;IsViewOnly:Boolean=False);

  end;

var
  CetakUlang: TCetakUlang;

implementation

uses MainU, LeadOrderU, CustomerOrderU, InvoiceBusU, CetakLeadOrderU;

{$R *.dfm}

constructor TCetakUlang.Create(AOwner:TComponent;vDataID,vFormFrom:String;IsViewOnly:Boolean=False);
begin
  DataID:=vDataID;
  FormDari:=vFormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TCetakUlang.LoadDataLeadOrder;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:=' SELECT t1.lead_order_id, t1.no_lead_order, t3.name as nama_lead '+
            ' FROM wh_lead_order t1 '+
            ' LEFT JOIN wh_lead t3 '+
            ' ON t3.lead_id=t1.lead_id  '+
            ' WHERE t1.status=1 ';


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['lead_order_id']<>NULL then
      DataArr[Count][0]:=Qry.FieldValues['lead_order_id'];

       if Qry.FieldValues['no_lead_order']<>NULL then
      DataArr[Count][1]:=Qry.FieldValues['no_lead_order'];

      if Qry.FieldValues['nama_lead']<>NULL then
      DataArr[Count][2]:=Qry.FieldValues['nama_lead'];
      
      Inc(Count);
      Qry.Next;
    end;
    
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;
  
end;

procedure TCetakUlang.LoadDataCustomerOrder;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:=' SELECT t1.customer_order_id, t2.name as nama_customer, t3.name as nama_pic '+
            ' FROM wh_customer_order t1 '+
            ' LEFT JOIN wh_customer t2 '+
            ' ON t2.customer_id=t1.customer_id '+
            ' LEFT JOIN wh_contact_person t3 '+
            ' ON t3.contact_person_id=t1.contact_person_id '+
            ' WHERE t1.status=1 '+
            ' AND is_cetak_or=1 '+
            ' AND (CONVERT(VARCHAR(10),t1.update_time_cus_or,20)) BETWEEN (CONVERT(VARCHAR(10),GETDATE()-2,20)) AND (CONVERT(VARCHAR(10),GETDATE(),20))';   


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['customer_order_id']<>NULL then
      DataArr[Count][0]:=Qry.FieldValues['customer_order_id'];

       if Qry.FieldValues['nama_customer']<>NULL then
      DataArr[Count][1]:=Qry.FieldValues['nama_customer'];

      if Qry.FieldValues['nama_pic']<>NULL then
      DataArr[Count][2]:=Qry.FieldValues['nama_pic'];
      
      Inc(Count);
      Qry.Next;
    end;
    
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;
  
end;

procedure TCetakUlang.LoadDataInvoiceBus;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:=' SELECT t1.invoice_id, t3.name as nama_customer,t4.name as nama_pic '+
            ' FROM wh_invoice t1 '+
            ' LEFT JOIN wh_customer_order t2 '+
            ' ON  t1.customer_order_id=t2.customer_order_id '+
            ' LEFT JOIN wh_customer t3 '+
            ' ON t2.customer_id=t3.customer_id '+
            ' LEFT JOIN wh_contact_person t4 '+
            ' ON t2.contact_person_id=t4.contact_person_id '+
            ' LEFT JOIN wh_customer_contact_person_dtl t5 '+
            ' ON t5.customer_contact_person_dtl_id=(SELECT MAX(customer_contact_person_dtl_id) FROM wh_customer_contact_person_dtl WHERE contact_person_id=t2.contact_person_id) '+
            ' WHERE t1.status=1; ';


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['invoice_id']<>NULL then
      DataArr[Count][0]:=Qry.FieldValues['invoice_id'];

       if Qry.FieldValues['nama_customer']<>NULL then
      DataArr[Count][1]:=Qry.FieldValues['nama_customer'];

      if Qry.FieldValues['nama_pic']<>NULL then
      DataArr[Count][2]:=Qry.FieldValues['nama_pic'];
      
      Inc(Count);
      Qry.Next;
    end;
    
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TCetakUlang.RefreshDataList;
var
  IntCount:Integer;
begin

  if Length(DataArr)>0 then
  StrGrid.RowCount:=Length(DataArr)+1;
  for IntCount:=0 to Length(DataArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=DataArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=DataArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=DataArr[IntCount][2];
    
  end;

end;





procedure TCetakUlang.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;  

  if FormDari='CustomerOrderU' then begin
    StrGrid.Cells[0,0]:='ID';
    StrGrid.Cells[1,0]:='Nama Customer';
    StrGrid.Cells[2,0]:='Nama PIC';

    StrGrid.ColWidths[0]:=120;
    StrGrid.ColWidths[1]:=250;
    StrGrid.ColWidths[2]:=250;

    LoadDataCustomerOrder;
    RefreshDataList;
    Caption:='Customer Order';

  end else
  if FormDari='InvoiceBusU' then begin
    StrGrid.Cells[0,0]:='ID';
    StrGrid.Cells[1,0]:='Nama Customer';
    StrGrid.Cells[2,0]:='Nama PIC';

    StrGrid.ColWidths[0]:=120;
    StrGrid.ColWidths[1]:=250;
    StrGrid.ColWidths[2]:=250;

    LoadDataInvoiceBus;
    RefreshDataList;
    Caption:='Invoice Bus';

  end;
  

end;

procedure TCetakUlang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCetakUlang.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TCetakUlang.Button2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TCetakUlang.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGrid.RowCount:=2;

  for Count2:=0 to 2 do
  StrGrid.Cells[Count2,1]:='';

end;


procedure TCetakUlang.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(DataArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(DataArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 2 do
          StrGrid.Cells[Count4,Count2-1]:=DataArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else  
  RefreshDataList;


end;

procedure TCetakUlang.StrGridDblClick(Sender: TObject);
begin
  if FormDari='LeadOrderU' then begin
    edtDataID.Text:=StrGrid.Cells[0,IntRow];

  end else
  if FormDari='CustomerOrderU' then begin
    edtDataID.Text:=StrGrid.Cells[0,IntRow];

  end else
  if FormDari='InvoiceBusU' then begin
    edtDataID.Text:=StrGrid.Cells[0,IntRow];
    
  end;


end;

procedure TCetakUlang.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   IntRow:=ARow;
end;

procedure TCetakUlang.btnCetakClick(Sender: TObject);
begin
 
  if FormDari='CustomerOrderU' then begin
     CustomerOrder.ReportCustomerOrder(edtDataID.Text);

  end else
  if FormDari='InvoiceBusU' then begin
     InvoiceBus.ReportInvoceBus(edtDataID.Text);
     
  end;


  
end;

procedure TCetakUlang.btnBatalClick(Sender: TObject);
begin

  edtDataID.Clear;

end;

end.
