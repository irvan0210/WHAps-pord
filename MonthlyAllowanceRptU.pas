unit MonthlyAllowanceRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TMonthlyAllowanceRpt = class(TForm)
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
    StrGrid: TZColorStringGrid;
    Label3: TLabel;
    Jenis: TComboBox;
    procedure LokasiChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
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
  end;

var
  MonthlyAllowanceRpt: TMonthlyAllowanceRpt;
  LokasiArr:Array of TArrString2;
  Days,ColumnWidth,IntRow,IntCol:Integer;

implementation

uses MainU, EmployeeFormU;

{$R *.dfm}

procedure TMonthlyAllowanceRpt.Init;
begin
  IntRow:=0;
  IntCol:=0;
  ColumnWidth:=60;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  Jenis.Text:='';
  Jenis.Items.Clear;
end;

procedure TMonthlyAllowanceRpt.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=2;
//  StrGrid.ColCount:=32;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=40;
  StrGrid.ColWidths[5]:=50;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=80;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Body Batangan';
  StrGrid.Cells[4,0]:='Group';
  StrGrid.Cells[5,0]:='Jenis';
  StrGrid.Cells[6,0]:='Total Argo Kotor';
  StrGrid.Cells[7,0]:='Hari Kerja';
  StrGrid.Cells[8,0]:='Tunjangan';
  for Count:=0 to 8 do
    StrGrid.Cells[Count,1]:='';
end;

procedure TMonthlyAllowanceRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Eksekutif');
  Jenis.Items.Add('Reguler');
  Jenis.ItemIndex:=0;
end;

procedure TMonthlyAllowanceRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
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
    Main.CloseDb;
  end;
  Qry.Destroy;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=1 to 12 do Bulan.Items.Add(ShortMonthNames[Count]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
end;

procedure TMonthlyAllowanceRpt.RefreshData;
var StrQry,StrLokasi,StrJenis,AkhirBulan,AwalBulan:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,IntDays,IntTotal,IntWorkDays,TotalGrossArgo:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
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
    TotalGrossArgo:=0;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,Count]:=IntToStr(Count);
      StrGrid.Cells[1,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[2,Count]:=Qry.FieldValues['name'];
      if Qry.FieldValues['reguler']=1 then StrGrid.Cells[5,Count]:='Reguler' else StrGrid.Cells[5,Count]:='Eksekutif';
      if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['vhc_batch_id']<>NULL then StrGrid.Cells[4,Count]:=Qry.FieldValues['vhc_batch_id'];
      StrQry:='SELECT CONVERT(VARCHAR(2),a.out_date,103) AS tgl,dbo.FormatMoney(a.gross_argo) AS gross_argo '+
            ' ,(CASE WHEN (SELECT work_days FROM wh_vhc_batch_detail2 WHERE vhc_batch_detail2_id= '+
            ' (SELECT MAX(vhc_batch_detail2_id) FROM wh_vhc_batch_detail2 WHERE (vhc_batch_id=b.vhc_batch_id) '+
            ' AND (a.out_date BETWEEN work_days_from_date and work_days_to_date) AND (active=1)) )  IS NOT NULL '+
            ' THEN (SELECT work_days FROM wh_vhc_batch_detail2 WHERE vhc_batch_detail2_id= '+
            ' (SELECT MAX(vhc_batch_detail2_id) FROM wh_vhc_batch_detail2 WHERE (vhc_batch_id=b.vhc_batch_id) '+
            ' AND (a.out_date BETWEEN work_days_from_date and work_days_to_date) AND (active=1) ) ) '+
            ' ELSE (SELECT work_days FROM wh_vhc_batch WHERE vhc_batch_id=b.vhc_batch_id) END )  AS work_days '+
            ' FROM wh_vhc_trans a'+
            ' LEFT JOIN wh_vehicle b ON b.vehicle_id=a.vehicle_id '+
            ' LEFT JOIN wh_vhc_batch c ON c.vhc_batch_id=b.vhc_batch_id '+
            ' WHERE a.employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+' AND (a.out_date BETWEEN '+
            Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+' AND ('+
            Chr(39)+FormatDateTime('yyyy-mm-dd',IncDay(VarToDateTime(AkhirBulan)))+Chr(39)+') ) AND (a.in_date IS NOT NULL);';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      TotalGrossArgo:=0;
      IntDays:=0;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        if Qry2.FieldValues['work_days']<>NULL then IntWorkDays:=Qry2.FieldValues['work_days'] else
        IntWorkDays:=Qry2.FieldValues['work_days'];
        if Qry2.FieldValues['gross_argo']<>'' then begin
          if Qry2.FieldValues['gross_argo']>=IntWorkDays then Inc(IntDays);
        end;
        TotalGrossArgo:=TotalGrossArgo+Qry2.FieldValues['gross_argo'];
        Qry2.Next;
      end;
      Qry2.Close;
      StrGrid.CellStyle[6,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.Cells[6,Count]:=IToCurr(TotalGrossArgo);
      StrGrid.Cells[7,Count]:=IntToStr(IntDays)+'  Hari Kerja';
      if (IntDays <15) then begin
        StrGrid.Cells[8,Count]:=SToCurr('0');
      end else if (IntDays in [15..19]) then begin
        StrGrid.Cells[8,Count]:=SToCurr('300000');
      end else if (IntDays in [20..24]) then begin
        StrGrid.Cells[8,Count]:=IToCurr(IntWorkDays);
      end else if (IntDays>24) then begin
        StrGrid.Cells[8,Count]:=SToCurr('750000');
      end;
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TMonthlyAllowanceRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TMonthlyAllowanceRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TMonthlyAllowanceRpt.SelesaiClick(Sender: TObject);
begin
  MonthlyAllowanceRpt.Close;
end;

procedure TMonthlyAllowanceRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlyAllowanceRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshJenis;
  InitGrid;
  RefreshCombo;
  RefreshData;
end;

procedure TMonthlyAllowanceRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TMonthlyAllowanceRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TMonthlyAllowanceRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then if Main.IsFormOpen('EmployeeForm')=False then
  EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[1,IntRow]);
end;

end.
