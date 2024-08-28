unit VhcOutMonthlyRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, ADODB, WHUnit, DateUtils,
  StrUtils, Math ;

type
  TVhcOutMonthlyRpt = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    ToXCel: TSpeedButton;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  VhcOutMonthlyRpt: TVhcOutMonthlyRpt;
  LokasiArr:Array of TArrString2;
  Days:Integer;
  ColumnWidth:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TVhcOutMonthlyRpt.Init;
begin
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  ColumnWidth:=40;
end;

procedure TVhcOutMonthlyRpt.InitGrid;
var Count,Count2:Integer;
begin
  StrGrid.ColCount:=17;
  for Count:=StrGrid.RowCount downto 4 do
    for Count2:=1 to StrGrid.ColCount-1 do
      StrGrid.Cells[Count2,Count]:='';
  StrGrid.RowCount:=4;
  StrGrid.ColWidths[0]:=50;
  StrGrid.ColWidths[1]:=50;
  StrGrid.ColWidths[14]:=70;
  StrGrid.ColWidths[15]:=70;
  StrGrid.ColWidths[16]:=70;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,13,0);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.CellStyle[0,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[14,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[15,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[5,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[8,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[11,0].Font.Style:=[fsBold];
  StrGrid.Cells[2,0]:='Executive Lama';
  StrGrid.Cells[5,0]:='Executive Baru';
  StrGrid.Cells[8,0]:='Reguler Hyundai';
  StrGrid.Cells[11,0]:='Reguler Limo';
  StrGrid.Cells[0,0]:='Hari';
  StrGrid.Cells[1,0]:='Tgl';
  StrGrid.Cells[2,1]:='Pagi';
  StrGrid.Cells[3,1]:='Malam';
  StrGrid.Cells[4,1]:='Total';
  StrGrid.Cells[5,1]:='Pagi';
  StrGrid.Cells[6,1]:='Malam';
  StrGrid.Cells[7,1]:='Total';
  StrGrid.Cells[8,1]:='Pagi';
  StrGrid.Cells[9,1]:='Malam';
  StrGrid.Cells[10,1]:='Total';
  StrGrid.Cells[11,1]:='Pagi';
  StrGrid.Cells[12,1]:='Malam';
  StrGrid.Cells[13,1]:='Total';
  StrGrid.Cells[14,0]:='Total Operasi';
  StrGrid.Cells[15,0]:='Total Armada';
  StrGrid.Cells[16,0]:='% Operasi';
  for Count:=0 to 4 do
    StrGrid.Cells[Count,3]:='';
  for Count:=1 to 13 do
    StrGrid.ColWidths[Count]:=ColumnWidth;
  for Count:=2 to StrGrid.ColCount-1  do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
end;

procedure TVhcOutMonthlyRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
  Main.MyConnection.Close;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
end;

procedure TVhcOutMonthlyRpt.RefreshData;
var QStr,StrLokasi,AkhirBulan,AwalBulan:String;
    Qry:TADOQuery;
    Count,IntRow,IntTotal:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.RowCount:=(Days+2);
  for Count:=1 to Days do begin
    StrGrid.Cells[0,1+Count]:=LongDayNames[DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))];
    StrGrid.Cells[1,1+Count]:=Format('%.*d',[2,Count])+'-'+Bulan.Text;
    StrGrid.CellStyle[0,1+Count].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,1+Count].HorizontalAlignment:=taCenter;
    if DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then begin
      StrGrid.CellStyle[0,1+Count].BGColor:=clRed;
      StrGrid.CellStyle[1,1+Count].BGColor:=clRed;
    end;
  end;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if Lokasi.Text<>'All' then begin
      StrLokasi:=Lokasi.Text;
    end else
      StrLokasi:='0';
    QStr:='EXEC GetVhcOutDateResume '+StrLokasi+',1,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+','+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        IntTotal:=0;
        IntRow:=1+StrToInt(LeftStr(Qry.FieldValues['out_dates'],2));
        IntTotal:=Qry.FieldValues['total_out1day']+Qry.FieldValues['total_out1night']+
                  Qry.FieldValues['total_out2day']+Qry.FieldValues['total_out2night']+
                  Qry.FieldValues['total_outrday']+Qry.FieldValues['total_outrnight']+
                  Qry.FieldValues['total_outr2day']+Qry.FieldValues['total_outr2night'];
        for Count:=2 to 13 do
          StrGrid.CellStyle[Count,IntRow].HorizontalAlignment:=taCenter;
        StrGrid.Cells[2,IntRow]:=Qry.FieldValues['total_out1day'];
        StrGrid.Cells[3,IntRow]:=Qry.FieldValues['total_out1night'];
        StrGrid.Cells[4,IntRow]:=IntToStr(Qry.FieldValues['total_out1day']+Qry.FieldValues['total_out1night']);
        StrGrid.Cells[5,IntRow]:=Qry.FieldValues['total_out2day'];
        StrGrid.Cells[6,IntRow]:=Qry.FieldValues['total_out2night'];
        StrGrid.Cells[7,IntRow]:=IntToStr(Qry.FieldValues['total_out2day']+Qry.FieldValues['total_out2night']);
        StrGrid.Cells[8,IntRow]:=Qry.FieldValues['total_outrday'];
        StrGrid.Cells[9,IntRow]:=Qry.FieldValues['total_outrnight'];
        StrGrid.Cells[10,IntRow]:=IntToStr(Qry.FieldValues['total_outrday']+Qry.FieldValues['total_outrnight']);
        StrGrid.Cells[11,IntRow]:=Qry.FieldValues['total_outr2day'];
        StrGrid.Cells[12,IntRow]:=Qry.FieldValues['total_outr2night'];
        StrGrid.Cells[13,IntRow]:=IntToStr(Qry.FieldValues['total_outr2day']+Qry.FieldValues['total_outr2night']);
        StrGrid.Cells[14,IntRow]:=IntToStr(IntTotal);
        Qry.Next;
        StrGrid.Cells[15,IntRow]:=Qry.FieldValues['total_vehicle'];
        if IntTotal>0 then
          StrGrid.Cells[16,IntRow]:=IntToStr((IntTotal/Qry.FieldValues['total_vehicle'])*100)+' %';
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;




procedure TVhcOutMonthlyRpt.SelesaiClick(Sender: TObject);
begin
  VhcOutMonthlyRpt.Close;
end;

procedure TVhcOutMonthlyRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVhcOutMonthlyRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
end;

procedure TVhcOutMonthlyRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TVhcOutMonthlyRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TVhcOutMonthlyRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

end.
