unit MonthlyArgoRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils,
  ZColorStringGrid;

type
  TMonthlyArgoRpt = class(TForm)
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
    IncludeOut: TCheckBox;
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
  MonthlyArgoRpt: TMonthlyArgoRpt;
  LokasiArr:Array of TArrString2;
  Days,ColumnWidth,IntRow,IntCol:Integer;
  EmplType,EmplStatus:Integer;

implementation

uses MainU, EmployeeFormU;

{$R *.dfm}

constructor TMonthlyArgoRpt.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);
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

procedure TMonthlyArgoRpt.Init;
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
  case EmplType of
    1: if EmplStatus=1 then Caption:='Laporan Argo perBulan Mitra '
         else Caption:='Laporan Argo perBulan exMitra';
  end;
end;

procedure TMonthlyArgoRpt.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=37;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No KPP';
  StrGrid.Cells[2,0]:='Mitra';
  StrGrid.Cells[3,0]:='Batangan';
  StrGrid.Cells[35,0]:='Total';
  StrGrid.Cells[36,0]:='Rata-Rata';
  for Count:=1 to 31 do begin
    StrGrid.Cells[3+Count,0]:=IntToStr(Count);
    StrGrid.ColWidths[3+Count]:=60;
  end;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=180;
  StrGrid.ColWidths[3]:=50;
  for Count:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[Count,1]:='';
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[Count,0].Font.Style:=[fsBold];
  end;
  for Count:=4 to StrGrid.ColCount-1 do
    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TMonthlyArgoRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Eksekutif');
  Jenis.Items.Add('Reguler');
  Jenis.ItemIndex:=0;
end;

procedure TMonthlyArgoRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
  FreeAndNil(Qry);
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

procedure TMonthlyArgoRpt.RefreshData;
var StrQry,StrLokasi,StrJenis,AkhirBulan,AwalBulan,StrIncludeOut:String;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,IntTotal,Pembagi:Integer;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=33+(Days-28)+1;
  for Count:=32 to (32+Days-29) do
    StrGrid.ColWidths[Count]:=ColumnWidth;
  StrGrid.Cells[32+(Days-28),0]:='Total';
  StrGrid.Cells[33+(Days-28),0]:='Rata-Rata';
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
    if IncludeOut.Checked then StrIncludeOut:=',@IncludeOut=1' else StrIncludeOut:='';
    StrQry:='EXEC GetEmployeeListDate 1,'+StrLokasi+','+IntToStr(EmplStatus)+','+Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+','+StrJenis+StrIncludeOut+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=1;
    for Count2:=0 to Qry.RecordCount do begin
      for Count3:=0 to 32+(Days-28) do StrGrid.Cells[Count3,Count2+1]:='';
    end;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,Count]:=IntToStr(Count);
      StrGrid.Cells[1,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[2,Count]:=Qry.FieldValues['name'];
      if Qry.FieldValues['active']=1 then begin
        StrGrid.CellStyle[1,Count].Font.Color:=clWindowText;
        StrGrid.CellStyle[2,Count].Font.Color:=clWindowText;
      end else begin
        StrGrid.CellStyle[1,Count].Font.Color:=clRed;
        StrGrid.CellStyle[2,Count].Font.Color:=clRed;
      end;
      if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
      StrQry:='SELECT CONVERT(VARCHAR(2),out_date,103) AS tgl,dbo.FormatMoney(gross_argo) AS gross_argo '+
            ' FROM wh_vhc_trans '+
            ' WHERE employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+' AND (out_date BETWEEN '+
            Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+' AND '+
            Chr(39)+FormatDateTime('yyyy-mm-dd',IncMonth(VarToDateTime(AwalBulan)))+Chr(39)+') AND (in_date IS NOT NULL) AND'+
            ' (cancel IS NULL);';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntTotal:=0;
      Pembagi:=Qry2.RecordCount;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['gross_argo'];
        StrGrid.CellStyle[(3+Qry2.FieldValues['tgl']),Count].HorizontalAlignment:=taRightJustify; 
        IntTotal:=IntTotal+SToInt(Qry2.FieldValues['gross_argo']);
        Qry2.Next;
      end;
      Qry2.Close;
      StrGrid.Cells[32+(Days-28),Count]:=IToCurr(IntTotal);
      if IntTotal>0 then StrGrid.Cells[33+(Days-28),Count]:=IToCurr(Round(IntTotal/Pembagi))
      else StrGrid.Cells[33+(Days-28),Count]:='0';
      StrGrid.CellStyle[32+(Days-28),Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[33+(Days-28),Count].HorizontalAlignment:=taRightJustify;
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TMonthlyArgoRpt.SelesaiClick(Sender: TObject);
begin
  MonthlyArgoRpt.Close;
end;

procedure TMonthlyArgoRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMonthlyArgoRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
end;

procedure TMonthlyArgoRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TMonthlyArgoRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TMonthlyArgoRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMonthlyArgoRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMonthlyArgoRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then if Main.IsFormOpen('EmployeeForm')=False then
  EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[1,IntRow]);
end;

end.
