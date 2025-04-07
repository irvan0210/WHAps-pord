unit LaporanWehaMartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ExtCtrls, ADODB;

type
  TLaporanWehaMart = class(TForm)
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Tanggal: TDateTimePicker;
    Button1: TButton;
    TglSampai: TDateTimePicker;
    grpGroupTotal: TGroupBox;
    lbl1: TLabel;
    edtTotalUnitOperasi: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    MinRowGrid: Integer;
    RekapArr,CompanyArr:Array of TArrString30;
    procedure RefreshCombo;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  LaporanWehaMart: TLaporanWehaMart;

implementation

uses MainU;

{$R *.dfm}

constructor TLaporanWehaMart.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: LaporanWehamart');
  inherited Create(AOwner);
end;

procedure TLaporanWehaMart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLaporanWehaMart.Init;
begin                     
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TLaporanWehaMart.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=15;
  StrGrid.ColWidths[0]:=80;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=140;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=60;
  StrGrid.ColWidths[5]:=50;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=90;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=90;
  StrGrid.ColWidths[10]:=100;
  StrGrid.ColWidths[11]:=90;
  StrGrid.ColWidths[12]:=90;
  StrGrid.ColWidths[13]:=100;
  StrGrid.ColWidths[14]:=80;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,8,0);
  StrGrid.MergeCells.AddRectXY(3,1,3,1);
  StrGrid.MergeCells.AddRectXY(4,1,4,1);
  StrGrid.MergeCells.AddRectXY(5,1,5,1);
  StrGrid.MergeCells.AddRectXY(6,1,6,1);
  StrGrid.MergeCells.AddRectXY(7,1,7,1);
  StrGrid.MergeCells.AddRectXY(8,1,8,1);
  StrGrid.MergeCells.AddRectXY(9,1,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);

  StrGrid.Cells[0,0]:='Tanggal Jalan';
  StrGrid.Cells[1,0]:='No Pesananan';
  StrGrid.Cells[2,0]:='Customer';
  StrGrid.Cells[3,0]:='WehaMart';
  StrGrid.Cells[3,1]:='Nama Item';
  StrGrid.Cells[4,1]:='Satuan';
  StrGrid.Cells[5,1]:='Qty Item';
  StrGrid.Cells[6,1]:='Harga Item';
  StrGrid.Cells[7,1]:='Subtotal';
  StrGrid.Cells[8,1]:='Total Wehamart';
  StrGrid.Cells[9,1]:='Biaya Pengiriman';
  StrGrid.Cells[10,0]:='Subtotal Unit';
  StrGrid.Cells[11,0]:='Biaya Tambahan';
  StrGrid.Cells[12,0]:='Discount';
  StrGrid.Cells[13,0]:='Total';
  StrGrid.Cells[14,0]:='Status Order';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TLaporanWehaMart.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry:string;
    IntCount,IntCountOrder:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnectionWehaOnline;
  Qry.CommandTimeout := 3600;

  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(RekapArr,0);

    StrQry:='EXEC GetOrderWehaMart '+QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date))+','+
            QuotedStr(FormatDateTime('dd/mm/yyyy',TglSampai.Date+1))+','+CompanyArr[SBU.ItemIndex][2]+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    IntCountOrder:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(RekapArr,IntCount+1);
      RekapArr[IntCount][0]:=Qry.FieldValues['TglJalan'];
      RekapArr[IntCount][1]:=Qry.FieldValues['OrderNo'];
      RekapArr[IntCount][2]:=Qry.FieldValues['Customer'];
      RekapArr[IntCount][3]:=Qry.FieldValues['ExtraItemName'];
      RekapArr[IntCount][4]:=UpperCase(Qry.FieldValues['UoM']);
      RekapArr[IntCount][5]:=Qry.FieldValues['Qty'];
      RekapArr[IntCount][6]:=Qry.FieldValues['UnitPrice'];
      RekapArr[IntCount][7]:=Qry.FieldValues['Qty']*Qry.FieldValues['UnitPrice'];
      RekapArr[IntCount][8]:=Qry.FieldValues['TotalWehamart'];
      RekapArr[IntCount][9]:=Qry.FieldValues['DeliveryFee'];
      RekapArr[IntCount][10]:=Qry.FieldValues['SubtotalUnit'];
      RekapArr[IntCount][11]:=Qry.FieldValues['BiayaTambahan'];
      RekapArr[IntCount][12]:=Qry.FieldValues['DiscountPrice'];
      RekapArr[IntCount][13]:=Qry.FieldValues['Total'];
      RekapArr[IntCount][14]:=Qry.FieldValues['Status'];

      Inc(IntCount);
      Qry.Next;
    end;

    Qry.Close;
    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TLaporanWehaMart.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,IntCountOrder:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGrid.CellStyle[4,StrGrid.RowCount-1].BGColor:=clWindow;
    end;
  if Length(RekapArr)>0 then StrGrid.RowCount:=Length(RekapArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  IntCountOrder:=0;
  for IntCount:=0 to Length(RekapArr)-1 do begin

    if StrOrderId<>RekapArr[IntCount][1] then begin
      Application.ProcessMessages;
      StrOrderId:=RekapArr[IntCount][1];
      IntStartRow:=IntCount;
      StrGrid.Cells[0,IntCount+2]:=RekapArr[IntCount][0];
      StrGrid.Cells[1,IntCount+2]:=RekapArr[IntCount][1];
      StrGrid.Cells[2,IntCount+2]:=RekapArr[IntCount][2];
      StrGrid.Cells[8,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][8]));
      StrGrid.Cells[9,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][9]));
      StrGrid.Cells[10,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][10]));
      StrGrid.Cells[11,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][11]));
      StrGrid.Cells[12,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][12]));
      StrGrid.Cells[13,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][13]));
      StrGrid.Cells[14,IntCount+2]:=RekapArr[IntCount][14];


      IsDrawRect:=False;


    end else if (IntCount<Length(RekapArr)-1) then begin
      if (StrOrderId<>RekapArr[IntCount+1][1]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+2,0,IntCount+2);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+2,1,IntCount+2);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+2,2,IntCount+2);
      StrGrid.MergeCells.AddRectXY(8,IntStartRow+2,8,IntCount+2);
      StrGrid.MergeCells.AddRectXY(9,IntStartRow+2,9,IntCount+2);
      StrGrid.MergeCells.AddRectXY(10,IntStartRow+2,10,IntCount+2);
      StrGrid.MergeCells.AddRectXY(11,IntStartRow+2,11,IntCount+2);
      StrGrid.MergeCells.AddRectXY(12,IntStartRow+2,12,IntCount+2);
      StrGrid.MergeCells.AddRectXY(13,IntStartRow+2,13,IntCount+2);
      StrGrid.MergeCells.AddRectXY(14,IntStartRow+2,14,IntCount+2);
    end;
    StrGrid.Cells[3,IntCount+2]:=RekapArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=RekapArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][5]));
    StrGrid.Cells[6,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][6]));
    StrGrid.Cells[7,IntCount+2]:=IToCurr(StoInt(RekapArr[IntCount][7]));

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taLeftJustify;

    if (IntCount>0) then
    begin
      if (RekapArr[IntCount][1]<>RekapArr[IntCount-1][1])  then
      IntCountOrder:= IntCountOrder+1;
    end else if IntCount=0 then
    begin
      IntCountOrder:=1;
    end;
  end;

  edtTotalUnitOperasi.Text := IToCurr(IntCountOrder);

end;

procedure TLaporanWehaMart.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;

  Main.M_Normal;
end;

procedure TLaporanWehaMart.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TLaporanWehaMart.FormShow(Sender: TObject);
begin
  init;
  InitGrid;
  RefreshCombo;
end;

procedure TLaporanWehaMart.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then
  TglSampai.Date:=Tanggal.Date;
end;

procedure TLaporanWehaMart.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then
  Tanggal.Date:=TglSampai.Date;
end;

procedure TLaporanWehaMart.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TLaporanWehaMart.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
