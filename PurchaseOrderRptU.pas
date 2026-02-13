unit PurchaseOrderRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ADODB, Buttons;

type
  TPurchaseOrderRpt = class(TForm)
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    SBU: TComboBox;
    Department: TComboBox;
    DepartmentDisp: TEdit;
    Year: TEdit;
    Label5: TLabel;
    Month: TComboBox;
    Label4: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
    Label3: TLabel;
    Cari: TEdit;
    Label6: TLabel;
    Location: TComboBox;
    Label7: TLabel;
    VendorID: TEdit;
    VendorName: TEdit;
    CariVendor: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    PartName: TEdit;
    SpeedButton1: TSpeedButton;
    PartID: TEdit;
    ClearVendor: TCheckBox;
    ClearPart: TCheckBox;
    ToXCel: TSpeedButton;
    btn_cari: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure MonthChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LocationChange(Sender: TObject);
    procedure CariVendorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ClearVendorClick(Sender: TObject);
    procedure ClearPartClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure btn_cariClick(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');Overload;
  end;

var
  PurchaseOrderRpt: TPurchaseOrderRpt;
  FormRequest,FormFunction:String;
  CompanyArr,DepartmentArr,LocationArr:Array of TArrString4;
  PurchaseRArr:Array of TArrString16;
  IntRow:Integer;
  PurchaseExpiredDay,PurchaseExpiredMonth, IntMaxCol:Integer;


implementation

uses MainU, PurchaseRequestU, StrUtils, PurchaseOrderU, DateUtils,
  VendorListU, PartDetailListU, GoodReceiveingU;

{$R *.dfm}

constructor TPurchaseOrderRpt.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Inherited Create(AOwner);
end;


procedure TPurchaseOrderRpt.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Year.Text:='';
  IntRow:=0;
  if FormRequest='' then GroupDetail.Enabled:=False;
end;

procedure TPurchaseOrderRpt.InitGrid;
var IntCount:Integer;
begin
  IntMaxCol := 13;
  StrGrid.RowCount:=2;
 // StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[0]:=140;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=220;
  StrGrid.ColWidths[5]:=30;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=90;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=110;
  StrGrid.ColWidths[10]:=70;
  StrGrid.ColWidths[11]:=90;
  StrGrid.ColWidths[12]:=140;
 // StrGrid.ColWidths[8]:=140;
 // StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[0,0]:='No PO';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Departement';
  StrGrid.Cells[3,0]:='Vendor';
  StrGrid.Cells[4,0]:='Item';
  StrGrid.Cells[5,0]:='Qty';
  StrGrid.Cells[6,0]:='Harga';
  StrGrid.Cells[7,0]:='Jumlah Harga';
  StrGrid.Cells[8,0]:='Total';
  StrGrid.Cells[9,0]:='Cara Pembayaran';
  StrGrid.Cells[10,0]:='Tanggal Kirim';
  StrGrid.Cells[11,0]:='Requestor';
  StrGrid.Cells[12,0]:='No PR';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  //StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 12 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
  //StrGrid.CellStyle[7,1].HorizontalAlignment:=taRightJustify;
  //StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseOrderRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1;' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';
        Qry.Next;
        Inc(IntCount);
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
    StrQry:='EXEC GetPurchaseRequestExpired';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PurchaseExpiredDay:=Qry.FieldValues['expired_day'];
      PurchaseExpiredMonth:=Qry.FieldValues['expired_month'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then
      SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  end;
  for IntCount:=0 to Length(DepartmentArr)-1 do
    Department.Items.Add(DepartmentArr[IntCount][0]);
  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
  Department.ItemIndex:=Department.Items.IndexOf(DepartmentId);
  DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
  if CompanyId<>'1' then
    if UpperCase(FormRequest)<>'PURCHASEORDER' then begin
      GroupDetail.Enabled:=False
    end else begin
      if (CompanyId<>'2') and (LocationId<>'6') then GroupDetail.Enabled:=False
    end;
  RefreshLocation;
  Main.M_Normal;
end;

procedure TPurchaseOrderRpt.RefreshLocation;
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

procedure TPurchaseOrderRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrLocationId,StrCompanyId,
    StrVendorID,StrPartID, StrLike:String;
    IntCount:Integer;
begin
  if (SBU.Text<>'') and (Location.Text<>'') and (Month.Text<>'') and (Year.Text<>'') then begin  //(Department.Text<>'') and
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      AwalBulan:='1/'+Month.Text+'/'+Year.Text;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      if VendorID.Text <> '' then StrVendorID := QuotedStr(VendorID.Text)
      else StrVendorID :=QuotedStr('');

      if PartID.Text <>'' then StrPartID := QuotedStr(PartID.Text)
      else StrPartID :=QuotedStr('');

      if cari.Text <>'' then StrLike := QuotedStr(cari.Text)
      else StrLike :=QuotedStr('');

      StrQry:='EXEC GetPurchaseOrderRpt '+StrCompanyId+','+StrLocationId+','+
      QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
      ','+StrVendorID+','+StrPartID+','+StrLike+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(PurchaseRArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PurchaseRArr[IntCount][0]:=Qry.FieldValues['purchase_order_id'];
        PurchaseRArr[IntCount][1]:=FormatDateTime('dd-MM-yyyy', Qry.FieldValues['order_date']);
        PurchaseRArr[IntCount][2]:=Qry.FieldValues['department_name'];
        PurchaseRArr[IntCount][3]:=Qry.FieldValues['vendor_name'];
        PurchaseRArr[IntCount][4]:=Qry.FieldValues['part_name'];
        PurchaseRArr[IntCount][5]:=Qry.FieldValues['quantity'];
        PurchaseRArr[IntCount][6]:=SToCurr(Qry.FieldValues['price_unit']);
        PurchaseRArr[IntCount][7]:=SToCurr(Qry.FieldValues['total']);
        PurchaseRArr[IntCount][8]:=SToCurr(Qry.FieldValues['total_1']);
        PurchaseRArr[IntCount][9]:=Qry.FieldValues['payment_term_name'];
        PurchaseRArr[IntCount][10]:=FormatDateTime('dd-MM-yyyy', Qry.FieldValues['delivery_date']);
        PurchaseRArr[IntCount][11]:=Qry.FieldValues['user_name'];

        if Qry.FieldValues['complete']<>NULL then PurchaseRArr[IntCount][12]:=Qry.FieldValues['complete']
        else PurchaseRArr[IntCount][12]:='';

        if Qry.FieldValues['purchase_request_id']<>NULL then PurchaseRArr[IntCount][13]:=Qry.FieldValues['purchase_request_id']
        else PurchaseRArr[IntCount][13]:='';

        if Qry.FieldValues['purchase_cancel']<>NULL then PurchaseRArr[IntCount][14]:=Qry.FieldValues['purchase_cancel']
        else PurchaseRArr[IntCount][14]:='';
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TPurchaseOrderRpt.RefreshGrid;
var
  IntCount,IntCount2,IntStartRow, IntTotal:Integer;
  StrPRId : string;
  IsDrawRect:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;

  if Length(PurchaseRArr)>0 then StrGrid.RowCount:=Length(PurchaseRArr)+1
  else begin
    StrGrid.RowCount:=2;
   // for IntCount:=0 to StrGrid.ColCount-1 do begin
   //   StrGrid.Cells[IntCount,1]:='';
   //   StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
   // end;
  end;

  for IntCount:=0 to StrGrid.ColCount-1 do begin
     StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
  IntStartRow:=0;
  StrPRId:='';
  IntTotal:=0;

  for IntCount:=0 to Length(PurchaseRArr)-1 do begin
    if (StrPRId<>PurchaseRArr[IntCount][0])  then begin
      StrPRId:=PurchaseRArr[IntCount][0];
      IntStartRow:=IntCount;
   // StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
      StrGrid.Cells[0,IntCount+1]:=PurchaseRArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=PurchaseRArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=PurchaseRArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=PurchaseRArr[IntCount][3];
     // StrGrid.Cells[4,IntCount+1]:=PurchaseRArr[IntCount][4];
     // StrGrid.Cells[5,IntCount+1]:=PurchaseRArr[IntCount][5];
     // StrGrid.Cells[6,IntCount+1]:=PurchaseRArr[IntCount][6];
     // StrGrid.Cells[7,IntCount+1]:=PurchaseRArr[IntCount][7];
      StrGrid.Cells[8,IntCount+1]:=PurchaseRArr[IntCount][8];
      StrGrid.Cells[9,IntCount+1]:=PurchaseRArr[IntCount][9];
      if PurchaseRArr[IntCount][10]<> '' then
        StrGrid.Cells[10,IntCount+1]:=PurchaseRArr[IntCount][10]
      else StrGrid.Cells[10,IntCount+1]:='';
      if PurchaseRArr[IntCount][11]<> '' then
        StrGrid.Cells[11,IntCount+1]:=PurchaseRArr[IntCount][11]
      else StrGrid.Cells[11,IntCount+1]:='';
      if PurchaseRArr[IntCount][13]<> '' then
        StrGrid.Cells[12,IntCount+1]:=PurchaseRArr[IntCount][13]
      else StrGrid.Cells[12,IntCount+1]:='';
     IsDrawRect:=False;
    end else if (IntCount<Length(PurchaseRArr)-1) then begin
      if (StrPRId<>PurchaseRArr[IntCount+1][0]) then IsDrawRect:=True;
    end else IsDrawRect:=True;

    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,IntCount+1);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,IntCount+1);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,IntCount+1);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,IntCount+1);
     // StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,IntCount+1);
      //StrGrid.MergeCells.AddRectXY(5,IntStartRow+1,5,IntCount+1);
     // StrGrid.MergeCells.AddRectXY(6,IntStartRow+1,6,IntCount+1);
     // StrGrid.MergeCells.AddRectXY(7,IntStartRow+1,7,IntCount+1);
      StrGrid.MergeCells.AddRectXY(8,IntStartRow+1,8,IntCount+1);
      StrGrid.MergeCells.AddRectXY(9,IntStartRow+1,9,IntCount+1);
      StrGrid.MergeCells.AddRectXY(10,IntStartRow+1,10,IntCount+1);
      StrGrid.MergeCells.AddRectXY(11,IntStartRow+1,11,IntCount+1);
      StrGrid.MergeCells.AddRectXY(12,IntStartRow+1,12,IntCount+1);
    end;
    StrGrid.Cells[4,IntCount+1]:=PurchaseRArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=PurchaseRArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=PurchaseRArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=PurchaseRArr[IntCount][7];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;
    //StrGrid.CellStyle[10,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+1].HorizontalAlignment:=taRightJustify;

    if PurchaseRArr[IntCount][14]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[7,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[10,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[11,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[12,IntCount+1].Font.Color:=clRed;
  {  end else if PurchaseRArr[IntCount][12]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[7,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[10,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[11,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[12,IntCount+1].Font.Color:=clGreen;}
    end else begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[7,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[9,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[10,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[11,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[12,IntCount+1].Font.Color:=clWindowText;
    end;

  end;
end;


procedure TPurchaseOrderRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPurchaseOrderRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseOrderRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Year.Text:=FormatDateTime('yyyy',Now());
  Month.ItemIndex:=StrToInt(FormatDateTime('mm',Now()))-1;
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderRpt.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TPurchaseOrderRpt.StrGridDblClick(Sender: TObject);
var IntCount:Integer;
begin
   if StrGrid.Cells[0,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then PurchaseOrder:=TPurchaseOrder.Create(Self,StrGrid.Cells[0,IntRow],False)
      else PurchaseOrder:=TPurchaseOrder.Create(Self,StrGrid.Cells[0,IntRow],True);
//    end else if UpperCase(FormRequest)='PURCHASEORDER' then begin
//        PurchaseOrder.SetPRNo(StrGrid.Cells[1,IntRow]);
//        Close;
    end else if UpperCase(FormRequest)='PURCHASEORDER' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
          PurchaseOrder.Reprint(StrGrid.Cells[0,IntRow]);
      end;
      Close;
   { end else if UpperCase(FormRequest)='GOODRECEIVING' then begin
      if PurchaseRArr[IntCount][12]='' then begin
        GoodReceiving.SetPRNo(StrGrid.Cells[0,IntRow]);
        Close;
      end else MessageBox(0,'P.O Sudah Diterima Lengkap','Laporan Purchase Order',MB_OK or MB_ICONWARNING);
      }
    end;
  end;
end;

procedure TPurchaseOrderRpt.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
//  Search;
 { if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(PurchaseRArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 11 do
        if (StrPos(PChar(UpperCase(PurchaseRArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          //StrGrid.RowCount:=Count2+1;
          StrGrid.CellStyle[6,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[7,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[8,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[9,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 11 do
          StrGrid.Cells[Count4+1,Count2]:=PurchaseRArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid; }
end;

procedure TPurchaseOrderRpt.DepartmentChange(Sender: TObject);
begin
  if Department.Text<>'' then
    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
end;

procedure TPurchaseOrderRpt.MonthChange(Sender: TObject);
begin
 // RefreshData;
 // RefreshGrid;
end;

procedure TPurchaseOrderRpt.SBUChange(Sender: TObject);
begin
  RefreshLocation;
end;

procedure TPurchaseOrderRpt.LocationChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseOrderRpt.CariVendorClick(Sender: TObject);
begin
 VendorList:=TVendorList.Create(Self,'REPORT PO',True);
end;

procedure TPurchaseOrderRpt.SpeedButton1Click(Sender: TObject);
begin
  PartDetailList:=TPartDetailList.Create(Self,'PURCHESORDERRPT');
end;

procedure TPurchaseOrderRpt.ClearVendorClick(Sender: TObject);
begin
  if ClearVendor.Checked then begin
     VendorID.Text := '';
     VendorName.Text := '';
  end;
end;

procedure TPurchaseOrderRpt.ClearPartClick(Sender: TObject);
begin
  if ClearPart.Checked then begin
     PartID.Text := '';
     PartName.Text := '';
  end;
end;

procedure TPurchaseOrderRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TPurchaseOrderRpt.Search;
var IntCount,IntCount2,IntCount3,IntCount4,IntStartRow:Integer;
    IsTrue:Boolean;
begin
  IntStartRow:=0;
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    IntCount2:=IntStartRow;
    for IntCount:=0 to Length(PurchaseRArr)-1 do begin
      IsTrue:=False;
      IntCount3:=0;
      repeat
        if (StrPos(PChar(UpperCase(PurchaseRArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
        Inc(IntCount3);
      until (IntCount3>IntMaxCol) or (IsTrue);
      if IsTrue then begin
        //StrGrid.RowCount:=IntCount2+2;
        StrGrid.Cells[0,IntCount2+1]:=IntToStr(IntCount2);
        for IntCount4:=1 to IntMaxCol do
          StrGrid.Cells[IntCount4,IntCount2+1]:=PurchaseRArr[IntCount][IntCount4-1];
        StrGrid.CellStyle[1,IntCount2+1].HorizontalAlignment:=taCenter;
//        StrGrid.CellStyle[5,IntCount2+1].HorizontalAlignment:=taRightJustify;
        //if PurchaseRArr[IntCount][6]<>'' then for IntCount4:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount4,IntCount2+1].Font.Color:=clGreen;
        Inc(IntCount2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TPurchaseOrderRpt.btn_cariClick(Sender: TObject);
begin
 if Cari.Text <> '' then begin
   RefreshData;
   RefreshGrid;
 end;
end;

end.
