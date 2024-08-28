unit MonthlyCommissionRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, ADODB, WHUnit, DateUtils,
  ZColorStringGrid;

type
  TMonthlyCommissionRpt = class(TForm)
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
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  MonthlyCommissionRpt: TMonthlyCommissionRpt;
  LokasiArr:Array of TArrString2;
  Days,ColumnWidth,IntRow,IntCol:Integer;


implementation

uses MainU, EmployeeFormU;

{$R *.dfm}

procedure TMonthlyCommissionRpt.Init;
begin
  ColumnWidth:=60;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
end;

procedure TMonthlyCommissionRpt.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=35;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=40;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Batangan';
  for Count:=0 to 4 do begin
    StrGrid.CellStyle[Count,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  end;
  for Count:=1 to 31 do begin
    StrGrid.Cells[3+Count,0]:=IntToStr(Count);
    StrGrid.CellStyle[3+Count,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[3+Count,0].HorizontalAlignment:=taCenter;
  end;
  for Count:=0 to 34 do
    StrGrid.Cells[Count,1]:='';
  for Count:=4 to 31 do
    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TMonthlyCommissionRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Eksekutif');
  Jenis.Items.Add('Reguler');
  Jenis.ItemIndex:=0;
end;

procedure TMonthlyCommissionRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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

procedure TMonthlyCommissionRpt.RefreshData;
var StrQry,StrLokasi,AkhirBulan,AwalBulan,StrJenis:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,IntTotal:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=32+(Days-28)+1;
  for Count:=32 to (32+Days-29) do
    StrGrid.ColWidths[Count]:=ColumnWidth;
  StrGrid.Cells[32+(Days-28),0]:='Total';
  StrGrid.CellStyle[32+(Days-28),0].Font.Style:=[fsBold];
  StrGrid.CellStyle[32+(Days-28),0].HorizontalAlignment:=taCenter;

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
    StrQry:='EXEC GetEmployeeListDate 1,'+StrLokasi+',1,'+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+','+StrJenis+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=1;
    for Count2:=0 to Qry.RecordCount do begin
      for Count3:=0 to 32+(Days-29) do StrGrid.Cells[Count3,Count2+1]:='';
    end;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,Count]:=IntToStr(Count);
      StrGrid.Cells[1,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[2,Count]:=Qry.FieldValues['name'];
      if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
      StrQry:='SELECT CONVERT(VARCHAR(2),out_date,103) AS tgl,dbo.FormatMoney(commission) AS commission '+
            ' FROM wh_vhc_trans '+
            ' WHERE employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+' AND (out_date BETWEEN'+
            Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+' AND '+
            Chr(39)+FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AwalBulan)))+Chr(39)+') AND (in_date IS NOT NULL)'+
            ' AND (cancel IS NULL);';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntTotal:=0;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['commission'];
        IntTotal:=IntTotal+SToInt(Qry2.FieldValues['commission']);
        Qry2.Next;
      end;
      Qry2.Close;
      StrGrid.Cells[32+(Days-28),Count]:=IToCurr(IntTotal);
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TMonthlyCommissionRpt.SelesaiClick(Sender: TObject);
begin
  MonthlyCommissionRpt.Close;
end;

procedure TMonthlyCommissionRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlyCommissionRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
  RefreshData;
end;

procedure TMonthlyCommissionRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TMonthlyCommissionRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TMonthlyCommissionRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TMonthlyCommissionRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then if Main.IsFormOpen('EmployeeForm')=False then
  EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[1,IntRow]);
end;

procedure TMonthlyCommissionRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

end.
