unit PurchaseOrderListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit;

type
  TPurchaseOrderList = class(TForm)
    Label3: TLabel;
    GroupDetail: TGroupBox;
    Label2: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
    Cari: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Year: TEdit;
    Month: TComboBox;
    Label1: TLabel;
    Location: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LocationChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    CompanyArr,DepartmentArr,LocationArr:Array of TArrString4;
    PurchaseRArr:Array of TArrString8;
    IntRow:Integer;
    ListType:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';List_Type:Integer=9);Overload;
  end;

var
  PurchaseOrderList: TPurchaseOrderList;

implementation

uses MainU, PurchaseOrderU, StrUtils, GoodReceiveingU;

{$R *.dfm}

constructor TPurchaseOrderList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';List_Type:Integer=9);
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  ListType:=List_Type;
  Inherited Create(AOwner);
end;


procedure TPurchaseOrderList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Year.Text:='';
  IntRow:=0;
end;

procedure TPurchaseOrderList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=120;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No PO';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Vendor';
  StrGrid.Cells[4,0]:='Dept Origin';
  StrGrid.Cells[5,0]:='Requestor';
  StrGrid.Cells[6,0]:='Total';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 6 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseOrderList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount+1);
    DepartmentArr[0][0]:='00';
    DepartmentArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do
    SBU.Items.Add(CompanyArr[IntCount][1]);
  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
  for IntCount:=0 to Length(CompanyArr)-1 do
    if CompanyId=CompanyArr[IntCount][0] then SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  RefreshLocation;
  Main.M_Normal;
end;

procedure TPurchaseOrderList.RefreshLocation;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
  Location.Text:='';
  Location.Items.Clear;
  Location.ItemIndex:=-1;
  if SBU.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrQry:='EXEC GetLocation '+StrCompanyId+';';
      StrQry:='EXEC GetLocation '+CompanyId+';';

      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(LocationArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then begin
        IntCount:=0;
        while not(Qry.Eof) do begin
          LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
          LocationArr[IntCount][1]:=Qry.FieldValues['location'];
          Qry.Next;
          Inc(IntCount);
        end;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(LocationArr)-1 do begin
      Location.Items.Add(LocationArr[IntCount][1]);
      if LocationArr[IntCount][0]=LocationId then Location.ItemIndex:= Location.Items.IndexOf(LocationArr[IntCount][1]);
    end;
    Main.M_Normal;
  end;
end;

procedure TPurchaseOrderList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
    StrLocationId:=LocationArr[Location.ItemIndex][0];
    AwalBulan:='1/'+Month.Text+'/'+Year.Text;
    StrQry:='EXEC GetPurchaseOrderList '+StrCompanyId+','+StrLocationId+','+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+','+IntToStr(ListType)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PurchaseRArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PurchaseRArr[IntCount][0]:=Qry.FieldValues['purchase_order_id'];
      PurchaseRArr[IntCount][1]:=Qry.FieldValues['order_dates'];
      PurchaseRArr[IntCount][2]:=Qry.FieldValues['vendor_name'];
      PurchaseRArr[IntCount][3]:=Qry.FieldValues['department_name'];
      PurchaseRArr[IntCount][4]:=Qry.FieldValues['user_name'];
      PurchaseRArr[IntCount][5]:=SToCurr(Qry.FieldValues['total']);
      if Qry.FieldValues['cancel']<>NULL then PurchaseRArr[IntCount][6]:=Qry.FieldValues['cancel'] else PurchaseRArr[IntCount][6]:='';
      if Qry.FieldValues['complete']<>NULL then PurchaseRArr[IntCount][7]:=Qry.FieldValues['complete'] else PurchaseRArr[IntCount][7]:='';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPurchaseOrderList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PurchaseRArr)>0 then StrGrid.RowCount:=Length(PurchaseRArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(PurchaseRArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PurchaseRArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PurchaseRArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PurchaseRArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PurchaseRArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PurchaseRArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=PurchaseRArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=PurchaseRArr[IntCount][7];
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
    if PurchaseRArr[IntCount][6]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clRed;
    end else if PurchaseRArr[IntCount][7]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clGreen;
    end else begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clWindowText;
    end;
  end;
end;

procedure TPurchaseOrderList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Year.Text:=FormatDateTime('yyyy',Now());
  Month.ItemIndex:=StrToInt(FormatDateTime('mm',Now()))-1;
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPurchaseOrderList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseOrderList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TPurchaseOrderList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then PurchaseOrder:=TPurchaseOrder.Create(Self,StrGrid.Cells[1,IntRow],False)
      else PurchaseOrder:=TPurchaseOrder.Create(Self,StrGrid.Cells[1,IntRow],True);
//    end else if UpperCase(FormRequest)='PURCHASEORDER' then begin
//        PurchaseOrder.SetPRNo(StrGrid.Cells[1,IntRow]);
//        Close;
    end else if UpperCase(FormRequest)='PURCHASEORDER' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
          PurchaseOrder.Reprint(StrGrid.Cells[1,IntRow]);
      end;
      Close;
    end else if UpperCase(FormRequest)='GOODRECEIVING' then begin
      if StrGrid.Cells[7,IntRow]='' then begin
        GoodReceiving.SetPRNo(StrGrid.Cells[1,IntRow]);
        Close;
      end else MessageBox(0,'P.O Sudah Diterima Lengkap','List Purchase Order',MB_OK or MB_ICONWARNING);
    end;
  end;
end;

procedure TPurchaseOrderList.SBUChange(Sender: TObject);
begin
  RefreshLocation;
end;

procedure TPurchaseOrderList.LocationChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(PurchaseRArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
        if (StrPos(PChar(UpperCase(PurchaseRArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          StrGrid.CellStyle[6,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4+1,Count2]:=PurchaseRArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

end.
