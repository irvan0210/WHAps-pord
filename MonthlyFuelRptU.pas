unit MonthlyFuelRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TMonthlyFuelRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    Selesai: TButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    Label3: TLabel;
    Jenis: TComboBox;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);Overload;
  end;

var
  MonthlyFuelRpt: TMonthlyFuelRpt;
  LokasiArr:Array of TArrString2;
  Days,ColumnWidth,IntRow,IntCol:Integer;
  EmplType,EmplStatus,ColMul:Integer;

implementation

uses MainU, EmployeeFormU, DB;

{$R *.dfm}

constructor TMonthlyFuelRpt.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else begin
    EmplType:=3;
  end;
  EmplStatus:=Status;
  Inherited Create(AOwner);
end;

procedure TMonthlyFuelRpt.Init;
begin
  IntRow:=0;
  IntCol:=0;
  ColumnWidth:=60;
  ColMul:=7; 
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  case EmplType of
    1: if EmplStatus=1 then Caption:='Laporan BBM perBulan Mitra '
         else Caption:='Laporan BBM perBulan exMitra';
  end;
end;

procedure TMonthlyFuelRpt.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=4+(31*ColMul)+(ColMul*2);
  StrGrid.ColWidths[0]:=40;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=180;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Batangan';
  for IntCount:=0 to 3 do begin
    StrGrid.MergeCells.AddRectXY(IntCount,0,IntCount,1);
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[IntCount,0].VerticalAlignment:=vaCenter;
    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
  end;
  for IntCount:=0 to 99 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].BGColor:= clWindow;
  end;
  for IntCount:=0 to 30 do begin
    StrGrid.CellStyle[(IntCount*ColMul)+4,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+4,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+5,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+6,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+7,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+8,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+9,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+10,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[(IntCount*ColMul)+4,0].HorizontalAlignment:=taCenter;
    StrGrid.MergeCells.AddRectXY((IntCount*ColMul)+4,0,(IntCount*ColMul)+10,0);
    StrGrid.Cells[(IntCount*ColMul)+4,0]:=IntToStr(IntCount+1);
    StrGrid.CellStyle[(IntCount*ColMul)+4,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+5,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+6,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+7,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+8,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+9,1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[(IntCount*ColMul)+10,1].HorizontalAlignment:=taCenter;
    StrGrid.Cells[(IntCount*ColMul)+4,1]:='Argo';
    StrGrid.Cells[(IntCount*ColMul)+5,1]:='BBM';
    StrGrid.Cells[(IntCount*ColMul)+6,1]:='Komisi';
    StrGrid.Cells[(IntCount*ColMul)+7,1]:='PB (Bersih)';
    StrGrid.Cells[(IntCount*ColMul)+8,1]:='Jaminan';
    StrGrid.Cells[(IntCount*ColMul)+9,1]:='Cicil KS';
    StrGrid.Cells[(IntCount*ColMul)+10,1]:='PB + Pot';
    StrGrid.CellStyle[(IntCount*ColMul)+4,1].BGColor:= clSkyBlue;
    StrGrid.CellStyle[(IntCount*ColMul)+5,1].BGColor:= clWindow;
    StrGrid.CellStyle[(IntCount*ColMul)+6,1].BGColor:= clMoneyGreen;
    StrGrid.CellStyle[(IntCount*ColMul)+7,1].BGColor:= clWindow;
    StrGrid.CellStyle[(IntCount*ColMul)+8,1].BGColor:= clYellow;
    StrGrid.CellStyle[(IntCount*ColMul)+9,1].BGColor:= clWindow;
    StrGrid.CellStyle[(IntCount*ColMul)+10,1].BGColor:= clTeal;
  end;
  for IntCount:=4 to (31*ColMul)+(ColMul*2) do
    StrGrid.ColWidths[IntCount]:=ColumnWidth;
end;

procedure TMonthlyFuelRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Eksekutif');
  Jenis.Items.Add('Reguler');
  Jenis.ItemIndex:=0;
end;

procedure TMonthlyFuelRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 3,1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TMonthlyFuelRpt.RefreshData;
var StrQry,StrLokasi,StrJenis,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,IntTotal,Pembagi:Integer;
    TotalGrossArgo,TotalBBM,TotalKomisi,TotalBersih,TotalJaminan,TotalCicilanKs,TotalAkhir,IntGrossArgo,IntBBM,IntKomisi,IntJaminan,IntCicilanKs:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=(Days*ColMul)+4+ColMul;
//  for Count:=4 to (Days*3)+3 do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
  StrGrid.MergeCells.AddRectXY((Days*ColMul)+4,0,(Days*ColMul)+10,0);
  StrGrid.CellStyle[(Days*ColMul)+4,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+4,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+5,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+6,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+7,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+8,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+9,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+10,1].Font.Style:=[fsBold];
  StrGrid.CellStyle[(Days*ColMul)+4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[(Days*ColMul)+10,1].HorizontalAlignment:=taCenter;
  StrGrid.Cells[(Days*ColMul)+4,0]:='Total';
  StrGrid.Cells[(Days*ColMul)+4,1]:='Argo';
  StrGrid.Cells[(Days*ColMul)+5,1]:='BBM';
  StrGrid.Cells[(Days*ColMul)+6,1]:='Komisi';
  StrGrid.Cells[(Days*ColMul)+7,1]:='PB (Bersih)';
  StrGrid.Cells[(Days*ColMul)+8,1]:='Jaminan';
  StrGrid.Cells[(Days*ColMul)+9,1]:='Cicil KS';
  StrGrid.Cells[(Days*ColMul)+10,1]:='PB + Pot';
  StrGrid.CellStyle[(Days*ColMul)+4,1].BGColor:= clSkyBlue;
  StrGrid.CellStyle[(Days*ColMul)+5,1].BGColor:= clWindow;
  StrGrid.CellStyle[(Days*ColMul)+6,1].BGColor:= clMoneyGreen;
  StrGrid.CellStyle[(Days*ColMul)+7,1].BGColor:= clWindow;
  StrGrid.CellStyle[(Days*ColMul)+8,1].BGColor:= clYellow;
  StrGrid.CellStyle[(Days*ColMul)+9,1].BGColor:= clWindow;
  StrGrid.CellStyle[(Days*ColMul)+10,1].BGColor:= clTeal;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrLokasi:='';
    StrJenis:='';
    if Lokasi.Text<>'All' then StrLokasi:=Lokasi.Text
    else StrLokasi:='0';
    if (Jenis.Text<>'All') then begin
      if Jenis.Text='Eksekutif' then StrJenis:='0'
      else if Jenis.Text='Reguler' then StrJenis:='1';
    end else
      StrJenis:='9';
    StrQry:='EXEC GetEmployeeListDate 1,'+StrLokasi+','+IntToStr(EmplStatus)+','+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+','+StrJenis+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=2;
    for Count2:=0 to Qry.RecordCount-1 do begin
      for Count3:=0 to (Days*ColMul)+ColMul-1 do begin
        StrGrid.Cells[Count3,Count2+2]:='';
        if (Count3>3) then StrGrid.CellStyle[Count3,Count2+2].HorizontalAlignment:=taRightJustify;
//        StrGrid.CellStyle[Count3,Count2+2].BGColor:= clWindow;
      end;
    end;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=3;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,Count]:=IntToStr(Count-1);
      StrGrid.Cells[1,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[2,Count]:=Qry.FieldValues['name'];
      StrGrid.CellStyle[3,Count].HorizontalAlignment:=taLeftJustify;
      if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
      StrGrid.CellStyle[0,Count].BGColor:= clWindow;
      StrGrid.CellStyle[1,Count].BGColor:= clWindow;
      StrGrid.CellStyle[2,Count].BGColor:= clWindow;
      StrGrid.CellStyle[3,Count].BGColor:= clWindow;
      for Count3:=0 to Days-1 do begin
        StrGrid.CellStyle[(Count3*ColMul)+4,Count].BGColor:= clSkyBlue;
        StrGrid.CellStyle[(Count3*ColMul)+5,Count].BGColor:= clWindow;
        StrGrid.CellStyle[(Count3*ColMul)+6,Count].BGColor:= clMoneyGreen;
        StrGrid.CellStyle[(Count3*ColMul)+7,Count].BGColor:= clWindow;
        StrGrid.CellStyle[(Count3*ColMul)+8,Count].BGColor:= clCream;
        StrGrid.CellStyle[(Count3*ColMul)+9,Count].BGColor:= clWindow;
        StrGrid.CellStyle[(Count3*ColMul)+10,Count].BGColor:= clYellow;
      end;
      StrQry:='EXEC GetEmployeeRevenueDetail '+QuotedStr(Qry.FieldValues['employee_id'])+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AwalBulan))))+';';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntTotal:=0;
      Pembagi:=Qry2.RecordCount;
      TotalGrossArgo:=0;
      TotalBBM:=0;
      TotalKomisi:=0;
      TotalBersih:=0;
      TotalJaminan:=0;
      TotalCicilanKs:=0;
      TotalAkhir:=0;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        IntGrossArgo:=Qry2.FieldValues['gross_argo'];
        IntBBM:=Qry2.FieldValues['fuel_price'];
        IntKomisi:=Qry2.FieldValues['commission'];
        IntJaminan:=0-Qry2.FieldValues['jaminan'];
        IntCicilanKs:=0-Qry2.FieldValues['cicilan_ks'];
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+4,Count]:=SToCurr(Qry2.FieldValues['gross_argo']);
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+5,Count]:=SToCurr(Qry2.FieldValues['fuel_price']);
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+6,Count]:=SToCurr(Qry2.FieldValues['commission']);
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+7,Count]:=IToCurr(IntGrossArgo-(IntBBM+IntKomisi));
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+8,Count]:=IToCurr(0-Qry2.FieldValues['jaminan']);
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+9,Count]:=IToCurr(0-Qry2.FieldValues['cicilan_ks']);
        StrGrid.Cells[((Qry2.FieldValues['tgl']-1)*ColMul)+10,Count]:=IToCurr((IntGrossArgo-(IntBBM+IntKomisi))+IntJaminan+IntCicilanKs);
        TotalGrossArgo:=TotalGrossArgo+Qry2.FieldValues['gross_argo'];
        TotalBBM:=TotalBBM+Qry2.FieldValues['fuel_price'];
        TotalKomisi:=TotalKomisi+Qry2.FieldValues['commission'];
        TotalBersih:=TotalBersih+(IntGrossArgo-(IntBBM+IntKomisi));
        TotalJaminan:=TotalJaminan+Qry2.FieldValues['jaminan'];
        TotalCicilanKs:=TotalCicilanKs+Qry2.FieldValues['cicilan_ks'];
        TotalAkhir:=TotalAkhir+((IntGrossArgo-(IntBBM+IntKomisi))+IntJaminan+IntCicilanKs);
        Qry2.Next;
      end;
      StrGrid.Cells[(Days*ColMul)+4,Count]:=IToCurr(TotalGrossArgo);
      StrGrid.Cells[(Days*ColMul)+5,Count]:=IToCurr(TotalBBM);
      StrGrid.Cells[(Days*ColMul)+6,Count]:=IToCurr(TotalKomisi);
      StrGrid.Cells[(Days*ColMul)+7,Count]:=IToCurr(TotalBersih);
      StrGrid.Cells[(Days*ColMul)+8,Count]:=IToCurr(0-TotalJaminan);
      StrGrid.Cells[(Days*ColMul)+9,Count]:=IToCurr(0-TotalCicilanKs);
      StrGrid.Cells[(Days*ColMul)+10,Count]:=IToCurr(TotalAkhir);
      Qry2.Close;
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TMonthlyFuelRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMonthlyFuelRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlyFuelRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
  RefreshData;
end;

procedure TMonthlyFuelRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TMonthlyFuelRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TMonthlyFuelRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMonthlyFuelRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlyFuelRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then if Main.IsFormOpen('EmployeeForm')=False then
  EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[1,IntRow]);
end;

end.
