unit KonditeMitraRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, ComCtrls, WHUnit,
  ZColorStringGrid;


type
  TKonditeMitraRpt = class(TForm)
    Selesai: TButton;
    Label2: TLabel;
    Label3: TLabel;
    DariTanggal: TDateTimePicker;
    SampaiTanggal: TDateTimePicker;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    ToXCel: TSpeedButton;
    LihatData: TButton;
    Lokasi: TComboBox;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure DariTanggalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LokasiArr:Array of TArrString2;
    ReportArr:Array of TArrString10;
    MaxCol:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshList;
  public
    { Public declarations }
  end;

var
  KonditeMitraRpt: TKonditeMitraRpt;

implementation

uses MainU, Math, DB;

{$R *.dfm}

procedure TKonditeMitraRpt.Init;
begin
  DariTanggal.Date:=Now();
  SampaiTanggal.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
end;

procedure TKonditeMitraRpt.InitGrid;
var IntCount:Integer;
begin
  MaxCol:=7;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=MaxCol;
  StrGrid.WordWrap:=True;
  StrGrid.RowHeights[0]:=40;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=250;
  StrGrid.ColWidths[3]:=40;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=70;
  StrGrid.ColWidths[6]:=50;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='NIP';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Hari Operasi';
  StrGrid.Cells[4,0]:='Total Argo';
  StrGrid.Cells[5,0]:='Rata2 Argo';
  StrGrid.Cells[6,0]:='Rata2 KM Produktif';
  for IntCount:=0 to MaxCol-1 do
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
end;

procedure TKonditeMitraRpt.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
{  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetGroup 3';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(JenisArr,Qry.RecordCount+1);
    JenisArr[0][0]:='All';
    JenisArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      JenisArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      JenisArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.MyConnection.Close;
  for IntCount:=0 to Length(JenisArr)-1 do
    Jenis.Items.Add(JenisArr[IntCount][1]);
  Jenis.ItemIndex:=Jenis.Items.IndexOf('All');
  Main.M_Normal;
}
end;

procedure TKonditeMitraRpt.RefreshData;
var BBM:Real;
    BBMStr,StrQry,StrLokasi,StrJenis,StrDayNight:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrLokasi:='';
    StrJenis:='';
    if Lokasi.Text='All' then begin
      StrLokasi:='0';
    end else begin
      StrLokasi:=Lokasi.Text;
    end;
    StrQry:='EXEC GetEmployeeList 1,'+StrLokasi+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ReportArr,0);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SetLength(ReportArr,Length(ReportArr)+1);
      ReportArr[IntCount][0]:=IntToStr(IntCount+1);
      ReportArr[IntCount][1]:=Qry.FieldValues['employee_id'];
      ReportArr[IntCount][2]:=Qry.FieldValues['name'];
      StrQry:='EXEC GetKonditeMitra '+QuotedStr(Qry.FieldValues['employee_id'])+','+QuotedStr(FormatDateTime('yyyy/mm/dd',DariTanggal.Date))+
              ','+QuotedStr(FormatDateTime('yyyy/mm/dd',SampaiTanggal.Date))+';';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then begin
        ReportArr[IntCount][3]:=Qry2.FieldValues['operate_day'];
        ReportArr[IntCount][4]:=IToCurr(Qry2.FieldValues['total_argo']);
        ReportArr[IntCount][5]:=IToCurr(Qry2.FieldValues['average_argo']);
//        StrGrid.CellStyle[IntCount,4].HorizontalAlignment:=taRightJustify;
//        StrGrid.CellStyle[IntCount,5].HorizontalAlignment:=taRightJustify;
      end;
      Qry2.Close;
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry2);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TKonditeMitraRpt.RefreshCombo;
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
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Normal;
end;

procedure TKonditeMitraRpt.RefreshList;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=1 to StrGrid.RowCount-1 do
    for IntCount2:=0 to MaxCol do StrGrid.Cells[IntCount2,IntCount]:='';
  StrGrid.RowCount:=2; 
  for IntCount:=0 to Length(ReportArr)-1 do begin
    StrGrid.RowCount:=StrGrid.RowCount+1;   
    StrGrid.Cells[0,IntCount+1]:=ReportArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=ReportArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=ReportArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=ReportArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=ReportArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=ReportArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=ReportArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=ReportArr[IntCount][7];
  end;
end;

procedure TKonditeMitraRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TKonditeMitraRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TKonditeMitraRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TKonditeMitraRpt.LihatDataClick(Sender: TObject);
begin
  RefreshData;
  RefreshList;
end;

procedure TKonditeMitraRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TKonditeMitraRpt.DariTanggalChange(Sender: TObject);
begin
  if DariTanggal.Date>SampaiTanggal.Date then SampaiTanggal.Date:=DariTanggal.Date;
end;

procedure TKonditeMitraRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
  RefreshData;
  RefreshList;
end;

end.
