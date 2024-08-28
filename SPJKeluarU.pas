unit SPJKeluarU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, ExtCtrls, Buttons;

type
  TSPJKeluar = class(TForm)
    Selesai: TButton;
    GroupSPJ: TGroupBox;
    Label3: TLabel;
    GridSPJ: TStringGrid;
    Cari: TEdit;
    Panel1: TPanel;
    Label12: TLabel;
    UnitJalanPagi: TEdit;
    Label22: TLabel;
    UnitJalanMalam: TEdit;
    Label21: TLabel;
    DayNight: TComboBox;
    ToXCel: TSpeedButton;
    TimerUpdate: TTimer;
    AutoRefresh: TCheckBox;
    Label1: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure DayNightChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure AutoRefreshClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshCombo;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  SPJKeluar: TSPJKeluar;
  SPJArr:Array of TArrString16;
  IntRow:Integer;
  LokasiArr:Array of TArrString2;

implementation

uses MainU, StrUtils, VehicleFormU, SPJGantiU;

{$R *.dfm}

procedure TSPJKeluar.SelesaiClick(Sender: TObject);
begin
  TimerUpdate.Enabled:=False;
  SPJKeluar.Close;
end;

procedure TSPJKeluar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJKeluar.InitGrid;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No';
  GridSPJ.Cells[1,0]:='No SPJ';
  GridSPJ.Cells[2,0]:='No Body';
  GridSPJ.Cells[3,0]:='No KPP';
  GridSPJ.Cells[4,0]:='Mitra';
  GridSPJ.Cells[5,0]:='Tanggal';
  GridSPJ.Cells[6,0]:='Jam';
  GridSPJ.Cells[7,0]:='Shift';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  GridSPJ.Cells[6,1]:='';
  GridSPJ.Cells[7,1]:='';
end;

procedure TSPJKeluar.Init;
begin
  DayNight.Text:='';
  DayNight.Items.Clear;
  DayNight.Items.Add('Semua');
  DayNight.Items.Add('Pagi');
  DayNight.Items.Add('Malam');
  DayNight.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
end;

procedure TSPJKeluar.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 3; ';
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

procedure TSPJKeluar.RefreshData;
var QStr,StrParam:String;
    Qry:TADOQuery;
    Count,IntCountPagi,IntCountMalam:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  StrParam:='';
  if Lokasi.Text='All' then begin
    StrParam:='0';
  end else begin
    StrParam:=Lokasi.Text;
  end;
  if Main.OpenDb then begin
    QStr:='EXEC GetVhcOutList '+StrParam+',1; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(SPJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SPJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      SPJArr[Count][1]:=Qry.FieldValues['body_id'];
      SPJArr[Count][2]:=Qry.FieldValues['license_plate'];
      SPJArr[Count][3]:=Qry.FieldValues['employee_id'];
      SPJArr[Count][4]:=Qry.FieldValues['name'];
      SPJArr[Count][5]:=Qry.FieldValues['out_date'];
      SPJArr[Count][6]:=Qry.FieldValues['out_time'];
      SPJArr[Count][7]:=Qry.FieldValues['out_rits'];
      SPJArr[Count][8]:=Qry.FieldValues['out_drops'];
      SPJArr[Count][9]:=Qry.FieldValues['out_argo_km'];
      SPJArr[Count][10]:=Qry.FieldValues['out_ordo_km'];
      SPJArr[Count][11]:=Qry.FieldValues['rits'];
      SPJArr[Count][12]:=Qry.FieldValues['drops'];
      if Qry.FieldValues['gross_commission']<>NULL then
        SPJArr[Count][14]:=Qry.FieldValues['gross_commission'];
      SPJArr[Count][15]:=Qry.FieldValues['out_hired_km'];
      if Qry.FieldValues['day_night']<>NULL then
        if Qry.FieldValues['day_night']='1' then SPJArr[Count][16]:='Pagi'
        else if Qry.FieldValues['day_night']='2' then SPJArr[Count][16]:='Malam';
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TSPJKeluar.RefreshGrid;
var IntCount,IntCount2,IntCountPagi,IntCountMalam:Integer;
begin
  if Length(SPJArr)>0 then begin
    IntCount2:=0;
    for IntCount:=0 to Length(SPJArr)-1 do begin
      if (DayNight.ItemIndex=0) OR ((DayNight.ItemIndex=1) AND (SPJArr[IntCount][16]='Pagi'))
      OR ((DayNight.ItemIndex=2) AND (SPJArr[IntCount][16]='Malam')) then begin
        GridSPJ.RowCount:=IntCount2+2;
        GridSPJ.Cells[0,IntCount2+1]:=IntToStr(IntCount2+1);
        GridSPJ.Cells[1,IntCount2+1]:=SPJArr[IntCount][0];
        GridSPJ.Cells[2,IntCount2+1]:=SPJArr[IntCount][1];
        GridSPJ.Cells[3,IntCount2+1]:=SPJArr[IntCount][3];
        GridSPJ.Cells[4,IntCount2+1]:=SPJArr[IntCount][4];
        GridSPJ.Cells[5,IntCount2+1]:=SPJArr[IntCount][5];
        GridSPJ.Cells[6,IntCount2+1]:=SPJArr[IntCount][6];
        GridSPJ.Cells[7,IntCount2+1]:=SPJArr[IntCount][16];
        Inc(IntCount2);
      end;
    end;
  end;
  IntCountPagi:=0;
  IntCountMalam:=0;
  for IntCount:=0 to Length(SPJArr)-1 do begin
    if SPJArr[IntCount][16]='Pagi' then Inc(IntCountPagi);
    if SPJArr[IntCount][16]='Malam' then Inc(IntCountMalam);
  end;
  UnitJalanPagi.Text:=IToCurr(IntCountPagi);
  UnitJalanMalam.Text:=IToCurr(IntCountMalam);

end;



procedure TSPJKeluar.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TSPJKeluar.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(SPJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 14 do
        if (StrPos(PChar(UpperCase(SPJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2;
          GridSPJ.Cells[0,Count2-1]:=IntToStr(Count2-1);
          GridSPJ.Cells[1,Count2-1]:=SPJArr[Count][0];
          GridSPJ.Cells[2,Count2-1]:=SPJArr[Count][1];
          GridSPJ.Cells[3,Count2-1]:=SPJArr[Count][3];
          GridSPJ.Cells[4,Count2-1]:=SPJArr[Count][4];
          GridSPJ.Cells[5,Count2-1]:=SPJArr[Count][5];
          GridSPJ.Cells[6,Count2-1]:=SPJArr[Count][6];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;


procedure TSPJKeluar.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSPJKeluar.GridSPJDblClick(Sender: TObject);
begin
  if RightStr(IntToStr(TreeTag),2)='05' then SPJGanti:=TSPJGanti.Create(Self,GridSPJ.Cells[1,IntRow]);  

end;

procedure TSPJKeluar.DayNightChange(Sender: TObject);
begin
  InitGrid;
  RefreshGrid;
end;

procedure TSPJKeluar.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(GridSPJ) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TSPJKeluar.TimerUpdateTimer(Sender: TObject);
begin
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TSPJKeluar.AutoRefreshClick(Sender: TObject);
begin
  if AutoRefresh.Checked=True then TimerUpdate.Enabled:=True
  else TimerUpdate.Enabled:=False;
end;

procedure TSPJKeluar.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  RefreshData;
  InitGrid;
  RefreshGrid;
end;

end.
