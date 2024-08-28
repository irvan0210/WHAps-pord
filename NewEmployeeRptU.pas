unit NewEmployeeRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, ADODB, WHUnit,
  ExtCtrls;

type
  TNewEmployeeRpt = class(TForm)
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
    Panel1: TPanel;
    Label3: TLabel;
    Total: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String);Overload;
  end;

var
  NewEmployeeRpt: TNewEmployeeRpt;
  ColumnWidth,Days,IntCompanyId:Integer;
  LokasiArr:Array of TArrString2;
  IntRow,IntCol:Integer;

implementation

uses MainU, DateUtils, StrUtils, Math, EmployeeFormU, ReferensiMitraListU;

{$R *.dfm}

constructor TNewEmployeeRpt.Create(AOwner:TComponent;EmployeeType:String);
begin
  IntCompanyId:=1;
  if UpperCase(EmployeeType)='TAXI' then begin
    IntCompanyId:=3;
  end  else if UpperCase(EmployeeType)='BUS' then IntCompanyId:=2;
  Inherited Create(AOwner);
end;

procedure TNewEmployeeRpt.Init;
begin
  IntRow:=0;
  IntCol:=0;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  ColumnWidth:=70;
end;

procedure TNewEmployeeRpt.InitGrid;
var Count,Count2:Integer;
 begin
  for Count:=StrGrid.RowCount downto 4 do
    for Count2:=1 to 13 do
      StrGrid.Cells[Count2,Count]:='';
  StrGrid.RowCount:=2;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.Cells[0,0]:='No KPP';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='Aktif';
  StrGrid.Cells[3,0]:='Mitra';
  StrGrid.Cells[4,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[5,0]:='Alamat';
  StrGrid.Cells[6,0]:='Telp/HP';
  StrGrid.Cells[7,0]:='Pendidikan';
  StrGrid.Cells[8,0]:='No KTP';
  StrGrid.Cells[9,0]:='SIM/No SIM';
  StrGrid.Cells[10,0]:='Tgl Gabung';
  StrGrid.Cells[11,0]:='Status';
  StrGrid.Cells[12,0]:='KPP Referensi';
  StrGrid.Cells[13,0]:='Referensi';
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[3]:=150;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=220;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=130;
  StrGrid.ColWidths[11]:=50;
  StrGrid.ColWidths[12]:=70;
  StrGrid.ColWidths[13]:=120;
end;

procedure TNewEmployeeRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='SELECT * FROM wh_location WHERE active=1';
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

procedure TNewEmployeeRpt.RefreshData;
var QStr,StrLokasi,AkhirBulan,AwalBulan:String;
    Qry:TADOQuery;
    IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  StrLokasi:='';
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  for IntCount:=1 to StrGrid.RowCount do
    for IntCount2:=0 to StrGrid.ColCount do
      StrGrid.Cells[IntCount2,IntCount]:='';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  IntCount:=0;
  if Main.OpenDb then begin
    if Lokasi.Text<>'All' then begin
      StrLokasi:=',@LocationId='+Lokasi.Text;
    end;
    QStr:='EXEC GetNewEmployeeList '+QuotedStr(FormatDateTime('dd-mm-yyyy',VarToDateTime(AwalBulan)))+','+QuotedStr(FormatDateTime('dd-mm-yyyy',VarToDateTime(AkhirBulan)))+','+IntToStr(IntCompanyId)+StrLokasi;
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=1;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+1;
      while Not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['employee_id'];
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['location'];
        if Qry.FieldValues['active']=1 then StrGrid.Cells[2,IntCount]:='Aktif'
        else if Qry.FieldValues['active']=0 then StrGrid.Cells[2,IntCount]:='Keluar'
        else if Qry.FieldValues['active']=2 then StrGrid.Cells[2,IntCount]:='Non Aktif';
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['name'];
        if Qry.FieldValues['tempat_tgl_lahir']<>NULL then StrGrid.Cells[4,IntCount]:=Qry.FieldValues['tempat_tgl_lahir'];
        if Qry.FieldValues['address']<> NULL then StrGrid.Cells[5,IntCount]:=Qry.FieldValues['address'];
        StrGrid.Cells[6,IntCount]:=Qry.FieldValues['telp_hp'];
        if Qry.FieldValues['education']<> NULL then StrGrid.Cells[7,IntCount]:=Qry.FieldValues['education'];
        if Qry.FieldValues['id_number']<> NULL then StrGrid.Cells[8,IntCount]:=Qry.FieldValues['id_number'];
        if Qry.FieldValues['license']<> NULL then StrGrid.Cells[9,IntCount]:=Qry.FieldValues['license'];
        StrGrid.Cells[10,IntCount]:=Qry.FieldValues['join_date'];
        if Qry.FieldValues['status']<> NULL then StrGrid.Cells[11,IntCount]:=Qry.FieldValues['status'];
        if Qry.FieldValues['reference_id']<> NULL then StrGrid.Cells[12,IntCount]:=Qry.FieldValues['reference_id']
        else StrGrid.Cells[12,IntCount]:='';
        if Qry.FieldValues['reference']<> NULL then StrGrid.Cells[13,IntCount]:=Qry.FieldValues['reference']
        else StrGrid.Cells[13,IntCount]:='';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  Total.Text:=IntToStr(IntCount-1); 
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TNewEmployeeRpt.SelesaiClick(Sender: TObject);
begin
  NewEmployeeRpt.Close;
end;

procedure TNewEmployeeRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TNewEmployeeRpt.FormShow(Sender: TObject);
begin
  Case IntCompanyId of
    1:Caption:='Laporan Karyawan Baru perBulan';
    2:Caption:='Laporan Driver Baru perBulan';
    3:Caption:='Laporan Mitra Baru perBulan';
  end;
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
end;

procedure TNewEmployeeRpt.LihatDataClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
end;

procedure TNewEmployeeRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TNewEmployeeRpt.StrGridDblClick(Sender: TObject);
begin
  if IntCol in [12..13] then begin
    if (StrGrid.Cells[11,IntRow]<>'') and (Main.IsFormOpen('ReferensiMitraList')=False) then ReferensiMitraList:=TReferensiMitraList.Create(Self,'Taxi',StrGrid.Cells[12,IntRow],StrGrid.Cells[13,IntRow],1);
  end else if Not(Main.IsFormOpen('EmployeeForm')) then EmployeeForm:=TEmployeeForm.Create(Self,'Taxi',StrGrid.Cells[0,IntRow]);
end;

procedure TNewEmployeeRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
end;

procedure TNewEmployeeRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

end.
