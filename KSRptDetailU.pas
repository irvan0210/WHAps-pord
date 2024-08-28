unit KSRptDetailU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, Buttons, StdCtrls, ExtCtrls, WHUnit,
  ZColorStringGrid;

type
  TKSRptDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    LokasiDisp: TEdit;
    Lokasi: TComboBox;
    Lihat: TButton;
    ToXCel: TSpeedButton;
    Selesai: TButton;
    TglDari: TDateTimePicker;
    Label3: TLabel;
    TglSampai: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    NoKPP: TComboBox;
    Panel2: TPanel;
    Mitra: TEdit;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    ToPrinter: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NoKPPChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshMitra;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure PreparePrint;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);Overload;
  end;

var
  KSRptDetail: TKSRptDetail;
  LokasiArr: Array of TArrString2;
  EmployeeArr,DataArr:Array of TArrString9;
  StrQry:String;
  EmplType,Stat:Integer;

implementation

uses MainU, ADODB;

{$R *.dfm}

Constructor TKSRptDetail.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1);
begin
  if UpperCase(EmployeeType)='TAXI' then EmplType:=1
  else if UpperCase(EmployeeType)='BUS' then EmplType:=2
  else EmplType:=3;
  Stat:=Status;
  Inherited Create(AOwner);
end;

procedure TKSRptDetail.Init;
var WrBulan,WrTahun,WrTanggal:Word;
    IntCount:Integer;
begin
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
  TglDari.Date:=Now();
  TglSampai.Date:=Now();
  SetLength(DataArr,0);
end;

procedure TKSRptDetail.InitGrid;
begin
  StrGrid.RowCount:=3;
  StrGrid.Cells[0,0]:='Tanggal';
  StrGrid.Cells[1,0]:='Nama Transaksi';
  StrGrid.Cells[2,0]:='Jumlah';
  StrGrid.Cells[3,0]:='Keterangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[3]:=100;
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
end;

procedure TKSRptDetail.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 3,1; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[IntCount][0]:=Qry.FieldValues['location_id'];
      LokasiArr[IntCount][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  Main.M_Normal;
end;

procedure TKSRptDetail.RefreshData;
var Qry:TADOQuery;
    IntCount,TotalLast:Integer;
begin
  Main.M_Busy;
  SetLength(DataArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT *,CONVERT(VARCHAR(10),b.date,103) AS date_transaction FROM wh_empl_transaction_detail a'+
            ' INNER JOIN wh_empl_transaction b ON a.empl_transaction_id=b.empl_transaction_id'+
            ' INNER JOIN wh_transaction_type c ON c.transaction_type_id=a.transaction_type_id'+
            ' WHERE b.employee_id='+Chr(39)+NoKPP.Text+Chr(39)+' AND (date BETWEEN CONVERT(datetime,'+Chr(39)+
            FormatDateTime('dd-mm-yyyy',TglDari.Date)+Chr(39)+',105) AND CONVERT(datetime,DATEADD(day,1,'+Chr(39)+
            FormatDateTime('yyyy-mm-dd',TglSampai.Date)+Chr(39)+'),105) );';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    TotalLast:=0;
    if Qry.RecordCount>0 then SetLength(DataArr,Qry.RecordCount+1);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      DataArr[IntCount][0]:=Qry.FieldValues['date_transaction'];
      if Qry.FieldValues['details']<>NULL then DataArr[IntCount][1]:=' '+Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else DataArr[IntCount][1]:=' '+Qry.FieldValues['name'];
      if Qry.FieldValues['amount']>=0 then DataArr[IntCount][2]:=IToCurr(Qry.FieldValues['amount'])
      else DataArr[IntCount][2]:='('+IToCurr(0-Qry.FieldValues['amount'])+')';

//      if Qry.FieldValues['t_in']=1 then DataArr[IntCount][2]:=IToCurr(0-Qry.FieldValues['amount'])
//      else if Qry.FieldValues['t_out']=1 then DataArr[IntCount][2]:=IToCurr(0-Qry.FieldValues['amount'])
//      else DataArr[IntCount][2]:=IToCurr(Qry.FieldValues['amount']);
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TKSRptDetail.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=1 to StrGrid.RowCount do
    for IntCount2:=0 to StrGrid.ColCount do StrGrid.Cells[IntCount2,IntCount]:='';
  if Length(DataArr)>0 then
    StrGrid.RowCount:=Length(DataArr);
  for IntCount:=0 to Length(DataArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=DataArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=DataArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=DataArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=DataArr[IntCount][3];
  end;
end;

procedure TKSRptDetail.RefreshMitra;
var Qry:TADOQuery;
    StrQry,StrLocation,StrStat:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  NoKPP.Text:='';
  NoKPP.Items.Clear;
  SetLength(EmployeeArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (Trim(Lokasi.Text)<>'All') then StrLocation:=','+Lokasi.Text else StrLocation:=',0';
    StrStat:=','+IntToStr(Stat);
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+',9;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(EmployeeArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        EmployeeArr[IntCount][0]:=Qry.FieldValues['employee_id'];
        EmployeeArr[IntCount][1]:=Qry.FieldValues['name'];
        if Qry.FieldValues['join_date']<>NULL then
          EmployeeArr[IntCount][3]:=Qry.FieldValues['join_date'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(EmployeeArr)-1 do
    NoKPP.Items.Add(EmployeeArr[IntCount][0]);
  Main.M_Normal;
end;


procedure TKSRptDetail.PreparePrint;
begin


end;


procedure TKSRptDetail.SelesaiClick(Sender: TObject);
begin
  KSRptDetail.Close;
end;

procedure TKSRptDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TKSRptDetail.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshMitra;
  RefreshData;
  RefreshGrid;
end;

procedure TKSRptDetail.NoKPPChange(Sender: TObject);
var IntCount:Integer;
begin
  for IntCount:=0 to Length(EmployeeArr)-1 do
    if EmployeeArr[IntCount][0]=NoKPP.Text then Mitra.Text:=EmployeeArr[IntCount][1];
end;

procedure TKSRptDetail.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Mitra.Text:='';
    NoKPP.Text:='';
    NoKPP.Clear;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          NoKPP.Items.Add(Employeearr[Count][Count4]);
      end;
    end;
  end else
    RefreshMitra;
end;

procedure TKSRptDetail.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TKSRptDetail.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
  RefreshMitra;
end;

procedure TKSRptDetail.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
