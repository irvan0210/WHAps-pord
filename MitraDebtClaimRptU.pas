unit MitraDebtClaimRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, Buttons, ADODB, WHUnit, DateUtils;

type
  TMitraDebtClaimRpt = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    ToXCel: TSpeedButton;
    Panel1: TPanel;
    Selesai: TButton;
    Bulan: TComboBox;
    Tahun: TEdit;
    Lihat: TButton;
    StrGrid: TZColorStringGrid;
    GroupLokasi: TGroupBox;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Label4: TLabel;
    Jenis: TComboBox;
    Label1: TLabel;
    ToPrinter: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    ColMul,IntCol:Integer;
    EmplType,EmplStatus:Integer;
    LokasiArr:Array of TArrString4;
    Days:Integer;
    ColumnWidth:Integer;
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
  MitraDebtClaimRpt: TMitraDebtClaimRpt;

implementation

uses MainU;

{$R *.dfm}

constructor TMitraDebtClaimRpt.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);
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

procedure TMitraDebtClaimRpt.Init;
begin
  ColumnWidth:=40;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  case EmplType of
    1: if EmplStatus=1 then Caption:='Laporan Hutang Piutang Mitra'
         else Caption:='Laporan Hutang Piutang exMitra';
  end;
end;

procedure TMitraDebtClaimRpt.InitGrid;
var IntCount:Integer;
begin
  IntCol:=1;
  ColMul:=17;         {kol 1bln} {kol sawal dan sakhir}   {No,Nokpp,Mitra}
  {StrGrid.ColCount:=(ColMul*31*IntCol) + (ColMul*2) + 3;}
  StrGrid.ColCount:=(ColMul*31*IntCol) + ((ColMul-8)*2) + 3;
  StrGrid.RowCount:=4;

  StrGrid.MergeCells.Clear;
  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,1,2);
  StrGrid.MergeCells.AddRectXY(2,0,2,2);
  StrGrid.MergeCells.AddRectXY(3,0,11,1);
//  StrGrid.MergeCells.AddRectXY(8,0,12,0);
//  StrGrid.MergeCells.AddRectXY(13,0,17,0);
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Saldo Sebelumnya';

  StrGrid.Cells[3,2]:='     KS';
  StrGrid.Cells[4,2]:='  OnRisk';
  StrGrid.Cells[5,2]:='   Laka';
  StrGrid.Cells[6,2]:=' Tilang';
  StrGrid.Cells[7,2]:='Tabungan';
  StrGrid.Cells[8,2]:=' Jaminan';
  StrGrid.Cells[9,2]:=' Seragam';
  StrGrid.Cells[10,2]:=' Ins. Argo*';
  StrGrid.Cells[11,2]:=' Talaka';

  for IntCount:=0 to 31 do begin
    StrGrid.Cells[(IntCount*ColMul*IntCol)+(ColMul-8)+3, 0]:=IntToStr(IntCount+1);
  end;

  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=180;
  for IntCount:=0 to ((ColMul*31*IntCol)+(ColMul-8)+3) do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TMitraDebtClaimRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:=' EXEC GetLocation 3,1;';
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
  if EmplStatus<>0 then begin
    if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  end;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TMitraDebtClaimRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Eksekutif');
  Jenis.Items.Add('Reguler');
  Jenis.ItemIndex:=0;
end;

procedure TMitraDebtClaimRpt.RefreshData;
var StrQry,StrLokasi,StrJenis,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    IntCount,Count2,Count3,IntTotal1,IntTotal2,IntTotal3,IntTotal4,IntTotal5,IntTotal6,IntTotal7
    ,IntTotal8,IntTotal9:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  //AwalBulan := DateToStr(EncodeDate(StrToInt(Tahun.Text), Bulan.ItemIndex-1, 1));
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=(ColMul*Days)+((ColMul-8)*2)+3;
  for IntCount:=3 to (ColMul*Days)+((ColMul-8)*2)+2 do
    StrGrid.ColWidths[IntCount]:=60;
  {formatting column}
  for IntCount:=0 to Days do begin
    If IntCount<>Days Then begin
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+3, 0, (ColMul*IntCount)+(ColMul-8)+19, 0);
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+3,0].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+4,1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+8,1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+10,1].HorizontalAlignment:=taCenter;
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+3,1]:='Hutang Mitra';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+7,1]:='Titipan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+11,1]:='Hutang';
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+3,1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+7,1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+9,1].HorizontalAlignment:=taCenter;
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+3, 1, (ColMul*IntCount)+(ColMul-8)+6, 1);
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+7, 1, (ColMul*IntCount)+(ColMul-8)+10, 1);
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+3,2]:='KS';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+4,2]:='OnRisk';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+5,2]:='Laka';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+6,2]:='Tilang';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+7,2]:='Tabungan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+8,2]:='Jaminan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+9,2]:='Ins. Argo*';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+10,2]:='Talaka';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+11,2]:='Seragam';
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+3,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+4,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+5,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+6,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+7,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+8,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+9,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+10,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+11,2].HorizontalAlignment:=taCenter;

        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+12,1]:='Pembayaran Hutang Mitra';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+16,1]:='Titipan';
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+12,1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+16,1].HorizontalAlignment:=taCenter;
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+12, 1, (ColMul*IntCount)+(ColMul-8)+15, 1);
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+16, 1, (ColMul*IntCount)+(ColMul-8)+19, 1);
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+12,2]:='KS';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+13,2]:='OnRisk';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+14,2]:='Laka';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+15,2]:='Tilang';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+16,2]:='Tabungan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+17,2]:='Jaminan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+18,2]:='Ins. Argo*';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+19,2]:='Talaka';
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+12,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+13,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+14,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+15,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+16,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+17,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+18,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+19,2].HorizontalAlignment:=taCenter;
        
    End
    Else
    Begin

        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+3,2]:='KS';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+4,2]:='OnRisk';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+5,2]:='Laka';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+6,2]:='Tilang';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+7,2]:='Tabungan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+8,2]:='Jaminan';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+9,2]:='Seragam';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+10,2]:='Ins Argo*';
        StrGrid.Cells[(ColMul*IntCount)+(ColMul-8)+11,2]:='Talaka';
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+3,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+4,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+5,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+6,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+7,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+8,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+9,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+10,2].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[(ColMul*IntCount)+(ColMul-8)+11,2].HorizontalAlignment:=taCenter;
        StrGrid.MergeCells.AddRectXY((ColMul*IntCount)+(ColMul-8)+3, 0, (ColMul*IntCount)+(ColMul-8)+11, 1);

    End;

  end;


//  for Count:=32 to (32+Days-29) do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
  StrGrid.Cells[(ColMul*Days)+(ColMul-8)+3,0]:='Total ('+Bulan.Text+')';
  StrGrid.CellStyle[(ColMul*Days)+(ColMul-8)+3,0].HorizontalAlignment:=taCenter;
//  StrGrid.Cells[2+(Days-28),0]:='Total';

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
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
    StrQry:='EXEC GetEmployeeListDateDebt 1,'+StrLokasi+','+IntToStr(EmplStatus)+','+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+','+StrJenis+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+3 else StrGrid.RowCount:=4;
    for Count2:=2 to StrGrid.RowCount-1 do begin
      for Count3:=0 to (ColMul*Days)+(ColMul*2)+2 do StrGrid.Cells[Count3,Count2+1]:='';
    end;

    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,IntCount+2]:=IntToStr(intCount);
      StrGrid.Cells[1,IntCount+2]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[2,IntCount+2]:=Qry.FieldValues['name'];
      if Qry.FieldValues['ks_prev']>0 then StrGrid.Cells[3,IntCount+2]:=IToCurr(Qry.FieldValues['ks_prev'])
      else if Qry.FieldValues['ks_prev']<0 then StrGrid.Cells[3,IntCount+2]:='('+IToCurr(0-Qry.FieldValues['ks_prev'])+')';
      if Qry.FieldValues['onrisk_prev']>0 then StrGrid.Cells[4,IntCount+2]:=SToCurr(Qry.FieldValues['onrisk_prev'])
      else if Qry.FieldValues['onrisk_prev']<0 then StrGrid.Cells[4,IntCount+2]:='('+IToCurr(0-Qry.FieldValues['onrisk_prev'])+')';
      if Qry.FieldValues['laka_prev']>0 then StrGrid.Cells[5,IntCount+2]:=IToCurr(Qry.FieldValues['laka_prev'])
      else if Qry.FieldValues['laka_prev']<0 then StrGrid.Cells[5,IntCount+2]:='('+IToCurr(0-Qry.FieldValues['laka_prev'])+')';
      if Qry.FieldValues['tilang_prev']>0 then StrGrid.Cells[6,IntCount+2]:=IToCurr(Qry.FieldValues['tilang_prev'])
      else if Qry.FieldValues['tilang_prev']<0 then StrGrid.Cells[6,IntCount+2]:='('+IToCurr(0-Qry.FieldValues['tilang_prev'])+')';
      if Qry.FieldValues['tabungan_prev']>0 then StrGrid.Cells[7,IntCount+2]:='('+IToCurr(Qry.FieldValues['tabungan_prev'])+')'
      else if Qry.FieldValues['tabungan_prev']<0 then StrGrid.Cells[7,IntCount+2]:=IToCurr(0-Qry.FieldValues['tabungan_prev']);
      if Qry.FieldValues['jaminan_prev']>0 then StrGrid.Cells[8,IntCount+2]:='('+IToCurr(Qry.FieldValues['jaminan_prev'])+')'
      else if Qry.FieldValues['jaminan_prev']<0 then StrGrid.Cells[8,IntCount+2]:=IToCurr(0-Qry.FieldValues['jaminan_prev']);
      if Qry.FieldValues['seragam_prev']>0 then StrGrid.Cells[9,IntCount+2]:='('+IToCurr(Qry.FieldValues['seragam_prev'])+')'
      else if Qry.FieldValues['seragam_prev']<0 then StrGrid.Cells[9,IntCount+2]:=IToCurr(0-Qry.FieldValues['seragam_prev']);
      If Qry.FindField('InsentifArgo_prev')<>Nil Then Begin
          if Qry.FieldValues['InsentifArgo_prev']>0 then StrGrid.Cells[10,IntCount+2]:='('+IToCurr(Qry.FieldValues['InsentifArgo_prev'])+')'
          else if Qry.FieldValues['InsentifArgo_prev']<0 then StrGrid.Cells[10,IntCount+2]:=IToCurr(0-Qry.FieldValues['InsentifArgo_prev']);
      End Else StrGrid.Cells[10,IntCount+2] := '0';
      If Qry.FindField('InsentifArgo_prev')<>Nil Then Begin
        if Qry.FieldValues['Talaka_prev']>0 then StrGrid.Cells[11,IntCount+2]:='('+IToCurr(Qry.FieldValues['Talaka_prev'])+')'
        else if Qry.FieldValues['Talaka_prev']<0 then StrGrid.Cells[11,IntCount+2]:=IToCurr(0-Qry.FieldValues['Talaka_prev']);
      End Else StrGrid.Cells[11,IntCount+2] := '0';
      StrQry:='SELECT CONVERT(VARCHAR(2),CONVERT(VARCHAR(10),a.date,103)) AS tgl,c.transaction_accu_group_id,SUM(b.amount) AS amount'+
              ' FROM wh_empl_transaction a '+
              ' INNER JOIN wh_empl_transaction_detail b ON b.empl_transaction_id=a.empl_transaction_id '+
              ' INNER JOIN wh_transaction_type c ON c.transaction_type_id=b.transaction_type_id '+
              ' WHERE employee_id='+QuotedStr(Qry.FieldValues['employee_id'])+' AND (a.date BETWEEN '+
              ' dbo.FirstDateOfMonth('+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
              ') AND (DATEADD(month,1,dbo.FirstDateOfMonth('+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+'))) )'+
              ' GROUP BY CONVERT(VARCHAR(10),a.date,103),c.transaction_accu_group_id ORDER BY tgl ';

      StrQry:='SELECT tgl, transaction_accu_group_id, sum(AmountA) AmountA, sum(AmountB) AmountB FROM '+
              '   ( '+
              '     SELECT CONVERT(VARCHAR(2),CONVERT(VARCHAR(10),a.date,103)) AS tgl, c.transaction_accu_group_id, '+
              '     CASE '+
              '   	    WHEN b.amount>0 then b.amount '+
              '	        else 0 '+
              '     END AmountA, '+
              '     CASE '+
              '	        WHEN b.amount>0 then 0 '+
              '	        ELSE b.amount '+
              '     END AmountB '+
              '     FROM wh_empl_transaction a '+
              '     INNER JOIN wh_empl_transaction_detail b ON b.empl_transaction_id=a.empl_transaction_id '+
              '     INNER JOIN wh_transaction_type c ON c.transaction_type_id=b.transaction_type_id '+
              '     WHERE employee_id='+QuotedStr(Qry.FieldValues['employee_id'])+' AND (a.date BETWEEN '+
              '     dbo.FirstDateOfMonth('+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
              '     ) AND (DATEADD(month,1,dbo.FirstDateOfMonth('+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+'))) )'+
              '     GROUP BY b.amount, a.empl_transaction_id, CONVERT(VARCHAR(10),a.date,103),c.transaction_accu_group_id '+
              '   ) AS DATA '+
              '   GROUP BY tgl, transaction_accu_group_id ORDER BY tgl ';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntTotal1:=Qry.FieldValues['ks_prev'];
      IntTotal2:=Qry.FieldValues['onrisk_prev'];
      IntTotal3:=Qry.FieldValues['laka_prev'];
      IntTotal4:=Qry.FieldValues['tilang_prev'];
      IntTotal5:=Qry.FieldValues['tabungan_prev'];
      IntTotal6:=Qry.FieldValues['jaminan_prev'];
      IntTotal7:=Qry.FieldValues['seragam_prev'];
      If Qry.FindField('InsentifArgo_prev')<>Nil Then
        IntTotal8:=Qry.FieldValues['InsentifArgo_prev']
      Else
        IntTotal8:=0;
      If Qry.FindField('Talaka_prev')<>Nil Then
        IntTotal9:=Qry.FieldValues['Talaka_prev']
      Else
        IntTotal9:=0;

      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        if Qry2.FieldValues['transaction_accu_group_id']=1 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+3,IntCount+2]:=IToCurr(Qry2.FieldValues['amountA'])
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+3,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+3,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountA'])+')';

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+3,IntCount+2]:=IToCurr(Qry2.FieldValues['amountB'])
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+3,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+3,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountB'])+')';

          IntTotal1:=IntTotal1+SToInt(Qry2.FieldValues['amountA']) + SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=3 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+4,IntCount+2]:=IToCurr(Qry2.FieldValues['amountA'])
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+4,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+4,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountA'])+')';

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+4,IntCount+2]:=IToCurr(Qry2.FieldValues['amountB'])
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+4,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+4,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountB'])+')';

          IntTotal2:=IntTotal2+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=4 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+5,IntCount+2]:=IToCurr(Qry2.FieldValues['amountA'])
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+5,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+5,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountA'])+')';

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+5,IntCount+2]:=IToCurr(Qry2.FieldValues['amountB'])
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+5,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+5,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountB'])+')';

          IntTotal3:=IntTotal3+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=7 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+6,IntCount+2]:=IToCurr(Qry2.FieldValues['amountA'])
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+6,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+6,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountA'])+')';

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+6,IntCount+2]:=IToCurr(Qry2.FieldValues['amountB'])
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+6,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+6,IntCount+2]:='('+IToCurr(0-Qry2.FieldValues['amountB'])+')';

          IntTotal4:=IntTotal4+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=2 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+7,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountA'])+')'
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+7,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+7,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountA']);

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+7,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountB'])+')'
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+7,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+7,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountB']);

          IntTotal5:=IntTotal5+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=5 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+8,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountA'])+')'
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+8,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+8,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountA']);

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+8,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountB'])+')'
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+8,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+8,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountB']);

          IntTotal6:=IntTotal6+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;

        if Qry2.FieldValues['transaction_accu_group_id']=9 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+9,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountA'])+')'
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+9,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+9,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountA']);

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+9,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountB'])+')'
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+9,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+9,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountB']);

          IntTotal8:=IntTotal8+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        if Qry2.FieldValues['transaction_accu_group_id']=10 then begin
          if Qry2.FieldValues['amountA']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+10,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountA'])+')'
          else if Qry2.FieldValues['amountA']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+10,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+10,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountA']);

          if Qry2.FieldValues['amountB']>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+10,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountB'])+')'
          else if Qry2.FieldValues['amountB']=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+10,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul+1)+10,IntCount+2]:=IToCurr(0-Qry2.FieldValues['amountB']);

          IntTotal8:=IntTotal8+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;
        {seragam}
        if Qry2.FieldValues['transaction_accu_group_id']=6 then begin
          if (Qry2.FieldValues['amountA']+Qry2.FieldValues['amountB'])>0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+11,IntCount+2]:='('+IToCurr(Qry2.FieldValues['amountA']+Qry2.FieldValues['amountB'])+')'
          else if (Qry2.FieldValues['amountA']+Qry2.FieldValues['amountB'])=0 then
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+11,IntCount+2]:=''
          else
            StrGrid.Cells[(ColMul*(Qry2.FieldValues['tgl']-1))+(ColMul-8)+11,IntCount+2]:=IToCurr(0-(Qry2.FieldValues['amountA']+Qry2.FieldValues['amountB']));
          IntTotal7:=IntTotal7+SToInt(Qry2.FieldValues['amountA'])+SToInt(Qry2.FieldValues['amountB']);
        end;

        Qry2.Next;
      end;
      Qry2.Close;

      if IntTotal1>=0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+3,IntCount+2]:=IToCurr(IntTotal1)
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+3,IntCount+2]:='('+IToCurr(0-IntTotal1)+')';
      if IntTotal2>=0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+4,IntCount+2]:=IToCurr(IntTotal2)
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+4,IntCount+2]:='('+IToCurr(0-IntTotal2)+')';
      if IntTotal3>=0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+5,IntCount+2]:=IToCurr(IntTotal3)
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+5,IntCount+2]:='('+IToCurr(0-IntTotal3)+')';
      if IntTotal4>=0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+6,IntCount+2]:=IToCurr(IntTotal4)
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+6,IntCount+2]:='('+IToCurr(0-IntTotal4)+')';
      if IntTotal5>0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+7,IntCount+2]:='('+IToCurr(IntTotal5)+')'
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+7,IntCount+2]:=IToCurr(0-IntTotal5);
      if IntTotal6>0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+8,IntCount+2]:='('+IToCurr(IntTotal6)+')'
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+8,IntCount+2]:=IToCurr(0-IntTotal6);
      if IntTotal7>0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+9,IntCount+2]:='('+IToCurr(IntTotal7)+')'
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+9,IntCount+2]:=IToCurr(0-IntTotal7);

      if IntTotal8>0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+10,IntCount+2]:='('+IToCurr(IntTotal8)+')'
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+10,IntCount+2]:=IToCurr(0-IntTotal8);
      if IntTotal9>0 then StrGrid.Cells[(ColMul*Days)+(ColMul-8)+11,IntCount+2]:='('+IToCurr(IntTotal9)+')'
      else StrGrid.Cells[(ColMul*Days)+(ColMul-8)+11,IntCount+2]:=IToCurr(0-IntTotal9);

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

  end;

  Qry.Destroy;
  Main.CloseDb;
  
  Main.M_Normal;
end;

procedure TMitraDebtClaimRpt.SelesaiClick(Sender: TObject);
begin
  MitraDebtClaimRpt.Close;
end;

procedure TMitraDebtClaimRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMitraDebtClaimRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;

  RefreshJenis;
  RefreshCombo;

  RefreshData;

end;

procedure TMitraDebtClaimRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TMitraDebtClaimRpt.LihatClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TMitraDebtClaimRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
