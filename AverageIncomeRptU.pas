unit AverageIncomeRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ADODB, WHUnit, DateUtils,
  ZColorStringGrid;


type
  TAverageIncomeRpt = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    ToXCel: TSpeedButton;
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
  AverageIncomeRpt: TAverageIncomeRpt;
  LokasiArr:Array of TArrString2;
  Days:Integer;
  ColumnWidth:Integer;

implementation

uses MainU, StrUtils, Math;

{$R *.dfm}

procedure TAverageIncomeRpt.Init;
begin
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  ColumnWidth:=60;
end;

procedure TAverageIncomeRpt.InitGrid;
var IntCount,IntCount2:Integer;
begin
  StrGrid.ColCount:=17;
  for IntCount:=3 to StrGrid.RowCount do
    for IntCount2:=1 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount2,IntCount]:='';
  StrGrid.RowCount:=4;
  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,8,0);
  StrGrid.MergeCells.AddRectXY(9,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,16,0);
  StrGrid.MergeCells.AddRectXY(1,1,2,1);
  StrGrid.MergeCells.AddRectXY(3,1,4,1);
  StrGrid.MergeCells.AddRectXY(5,1,6,1);
  StrGrid.MergeCells.AddRectXY(7,1,8,1);
  StrGrid.MergeCells.AddRectXY(9,1,10,1);
  StrGrid.MergeCells.AddRectXY(11,1,12,1);
  StrGrid.MergeCells.AddRectXY(13,1,14,1);
  StrGrid.MergeCells.AddRectXY(15,1,16,1);
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[0,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[5,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[9,0].Font.Style:=[fsBold];
  StrGrid.CellStyle[13,0].Font.Style:=[fsBold];
  StrGrid.Cells[1,0]:='Sonata Lama';
  StrGrid.Cells[5,0]:='Sonata Baru';
  StrGrid.Cells[9,0]:='Reguler Hyundai';
  StrGrid.Cells[13,0]:='Reguler Limo';
  StrGrid.Cells[1,1]:='Pagi';
  StrGrid.Cells[3,1]:='Malam';
  StrGrid.Cells[5,1]:='Pagi';
  StrGrid.Cells[7,1]:='Malam';
  StrGrid.Cells[9,1]:='Pagi';
  StrGrid.Cells[11,1]:='Malam';
  StrGrid.Cells[13,1]:='Pagi';
  StrGrid.Cells[15,1]:='Malam';
  StrGrid.Cells[0,0]:='Tgl';
  for IntCount:=1 to StrGrid.ColCount-1 do
  StrGrid.ColWidths[0]:=50;
  for IntCount:=1 to StrGrid.ColCount-1 do begin
    if (IntCount Mod 2)=0 then StrGrid.Cells[IntCount,2]:='Argo Bersih'
    else StrGrid.Cells[IntCount,2]:='Argo Kotor';
    StrGrid.ColWidths[IntCount]:=ColumnWidth;
    StrGrid.CellStyle[IntCount,2].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to 4 do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TAverageIncomeRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
{    QStr:='SELECT * FROM wh_location a '+
          ' INNER JOIN wh_company_location b ON b.location_id=a.location_id '+
          ' WHERE b.company_id='+Chr(39)+CompanyId+Chr(39)+' AND a.active=1;';
}
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

procedure TAverageIncomeRpt.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan:String;
    Qry:TADOQuery;
    Count,IntTotalKotor,IntTotalBersih:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.RowCount:=(Days+4);
  for Count:=1 to Days do begin
    StrGrid.Cells[0,2+Count]:=Format('%.*d',[2,Count])+'-'+Bulan.Text;
    StrGrid.CellStyle[0,2+Count].HorizontalAlignment:=taCenter; 
  end;
  StrGrid.Cells[0,Days+3]:='Average';
  StrGrid.CellStyle[0,Days+3].Font.Style:=[fsBold];
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    QAddParam:='';
    if Lokasi.Text<>'All' then begin
      QAddParam:=' AND (d.location_id='+Lokasi.Text+')';
    end;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=1) AND (a.day_night=1)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[1,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[2,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[1,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[2,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[1,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[2,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[1,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[2,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=1) AND (a.day_night=2)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[3,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[4,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[3,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[4,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[3,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[4,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[3,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[4,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=2) AND (a.day_night=1)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[5,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[6,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[5,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[6,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[5,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[6,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[5,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[6,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=2) AND (a.day_night=2)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[7,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[8,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[7,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[8,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[7,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[8,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[7,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[8,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=3) AND (a.day_night=1)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[9,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[10,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[9,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[10,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[9,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[10,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[9,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[10,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=3) AND (a.day_night=2)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[11,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[12,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[11,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[12,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[11,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[12,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[11,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[12,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=8) AND (a.day_night=1)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[13,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[14,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[13,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[14,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[13,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[14,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[13,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[14,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
    QStr:='SELECT CONVERT(VARCHAR(10),a.out_date,105) AS out_date'+
	  	    ' ,AVG(a.gross_argo) AS sum_gross_argo '+
		      ' ,AVG(a.gross_argo-(a.fuel_price-a.gas_price)) AS sum_net_argo'+
		      ' FROM wh_vhc_trans AS a '+
          ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
          ' LEFT JOIN wh_vhc_detail AS d ON d.vhc_detail_id='+
          ' (SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=c.vehicle_id)'+
          ' AND ((a.out_date>=from_date) OR  (a.out_date BETWEEN from_date AND to_date)) ) '+
          ' WHERE (a.out_date BETWEEN (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan) )+Chr(39)+
          ',105)) AND (CONVERT(datetime,'+
          Chr(39)+FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan))+Chr(39)+
          ',105)+1) ) AND (a.cancel IS NULL)'+
          ' AND ( a.gross_argo IS NOT NULL) AND (c.vhc_batch_id=8) AND (a.day_night=2)'+QAddParam+
          ' GROUP BY CONVERT(VARCHAR(10),a.out_date,105); ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=1;
    IntTotalKotor:=0;
    IntTotalBersih:=0;
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        StrGrid.CellStyle[15,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.CellStyle[16,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))].HorizontalAlignment:=taRightJustify;
        StrGrid.Cells[15,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_gross_argo']);
        StrGrid.Cells[16,(2+StrToInt(LeftStr(Qry.FieldValues['out_date'],2)))]:=SToCurr(Qry.FieldValues['sum_net_argo']);
        IntTotalKotor:=IntTotalKotor+Qry.FieldValues['sum_gross_argo'];
        IntTotalBersih:=IntTotalBersih+Qry.FieldValues['sum_net_argo'];
        Qry.Next;
      end;
      StrGrid.CellStyle[15,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[16,Days+3].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[15,Days+3]:=IToCurr(RoundTo(IntTotalKotor/Qry.RecordCount,0));
      StrGrid.Cells[16,Days+3]:=IToCurr(RoundTo(IntTotalBersih/Qry.RecordCount,0));
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TAverageIncomeRpt.SelesaiClick(Sender: TObject);
begin
  AverageIncomeRpt.Close;
end;

procedure TAverageIncomeRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAverageIncomeRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
end;

procedure TAverageIncomeRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TAverageIncomeRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TAverageIncomeRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

end.
