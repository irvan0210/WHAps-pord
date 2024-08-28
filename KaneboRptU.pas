unit KaneboRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, WHUnit, ADODB,
  QRCtrls, QuickRpt, ZColorStringGrid;

type
  TKaneboRpt = class(TForm)
    ToXCel: TSpeedButton;
    Selesai: TButton;
    GroupSPJ: TGroupBox;
    Panel1: TPanel;
    Label12: TLabel;
    TotalUnitJalan: TEdit;
    DayNight: TComboBox;
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    Lihat: TButton;
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QTanggal: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRBand2: TQRBand;
    QNo: TQRDBText;
    QNama: TQRDBText;
    QBody: TQRDBText;
    QKPP: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    Cetak: TButton;
    QRShape21: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel14: TQRLabel;
    QShift: TQRDBText;
    GridSPJ: TZColorStringGrid;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel15: TQRLabel;
    QPhoneNo: TQRDBText;
    Label3: TLabel;
    Group: TComboBox;
    Label4: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure CetakClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure PreparePrint;
  public
    { Public declarations }
  end;

var
  KaneboRpt: TKaneboRpt;
  SPJArr:Array of TArrString20;
  StrQry:String;
  LokasiArr,GroupArr:Array of TArrString2;

implementation

uses MainU;

{$R *.dfm}

procedure TKaneboRpt.InitGrid;
var IntCount:Integer;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.ColWidths[0]:=25;
  GridSPJ.ColWidths[1]:=90;
  GridSPJ.ColWidths[2]:=45;
  GridSPJ.ColWidths[3]:=70;
  GridSPJ.ColWidths[4]:=120;
  GridSPJ.ColWidths[5]:=80;
  GridSPJ.ColWidths[6]:=65;
  GridSPJ.ColWidths[7]:=40;
  GridSPJ.ColWidths[8]:=40;
  GridSPJ.Cells[0,0]:='No';
  GridSPJ.Cells[1,0]:='No SPJ';
  GridSPJ.Cells[2,0]:='No Body';
  GridSPJ.Cells[3,0]:='No KPP';
  GridSPJ.Cells[4,0]:='Mitra';
  GridSPJ.Cells[5,0]:='No Telp';
  GridSPJ.Cells[6,0]:='Tanggal';
  GridSPJ.Cells[7,0]:='Jam';
  GridSPJ.Cells[8,0]:='Shift';
  for IntCount:=0 to 8 do
    GridSPJ.Cells[IntCount,1]:='';
end;


procedure TKaneboRpt.SelesaiClick(Sender: TObject);
begin
  KaneboRpt.Close;
end;

procedure TKaneboRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TKaneboRpt.Init;
begin
  Tanggal.Date:=Now(); 
  DayNight.Text:='';
  DayNight.Items.Clear;
  DayNight.Items.Add('Semua');
  DayNight.Items.Add('Pagi');
  DayNight.Items.Add('Malam');
  DayNight.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=-1;
  Group.Items.Clear;
  Group.ItemIndex:=-1;
  Group.Text:='';
end;

procedure TKaneboRpt.RefreshData;
var Qry:TADOQuery;
    Count,IntCountPagi,IntCountMalam:Integer;
    StrParam,StrGroup:String;
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
  if Group.Text='All' then begin
    StrGroup:='0';
  end else begin
    StrGroup:=Group.Text;
  end;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcOutDateList '+StrParam+',1,'+
          Chr(39)+FormatDateTime('yyyy-mm-dd',Tanggal.Date)+Chr(39)+','+IntToStr(DayNight.ItemIndex)+','+StrGroup+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
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
      if Qry.FieldValues['gross_commission']<>NULL then SPJArr[Count][14]:=Qry.FieldValues['gross_commission'];
      SPJArr[Count][15]:=Qry.FieldValues['out_hired_km'];
      if Qry.FieldValues['day_night']<> NULL then
        if Qry.FieldValues['day_night']=1 then SPJArr[Count][16]:='Pagi'
        else SPJArr[Count][16]:='Malam';
      SPJArr[Count][17]:=Qry.FieldValues['phone_no'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TKaneboRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
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
    QStr:='SELECT * FROM wh_vhc_batch WHERE company_id=3;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+1);
    GroupArr[0][0]:='All';
    GroupArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Qry.Destroy;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][0]);
  Group.ItemIndex:=0;
end;

procedure TKaneboRpt.RefreshGrid;
var IntCount,IntCount2,IntCountUnit:Integer;
begin
  if Length(SPJArr)>0 then begin
    IntCount2:=0;
    IntCountUnit:=0;
    for IntCount:=0 to Length(SPJArr)-1 do begin
      if (DayNight.ItemIndex=0) OR ((DayNight.ItemIndex=1) AND (SPJArr[IntCount][16]='Pagi'))
      OR ((DayNight.ItemIndex=2) AND (SPJArr[IntCount][16]='Malam')) then begin
        GridSPJ.RowCount:=IntCount2+2;
        GridSPJ.Cells[0,IntCount2+1]:=IntToStr(IntCount2+1);
        GridSPJ.Cells[1,IntCount2+1]:=SPJArr[IntCount][0];
        GridSPJ.Cells[2,IntCount2+1]:=SPJArr[IntCount][1];
        GridSPJ.Cells[3,IntCount2+1]:=SPJArr[IntCount][3];
        GridSPJ.Cells[4,IntCount2+1]:=SPJArr[IntCount][4];
        GridSPJ.Cells[5,IntCount2+1]:=SPJArr[IntCount][17];
        GridSPJ.Cells[6,IntCount2+1]:=SPJArr[IntCount][5];
        GridSPJ.Cells[7,IntCount2+1]:=SPJArr[IntCount][6];
        GridSPJ.Cells[8,IntCount2+1]:=SPJArr[IntCount][16];
        Inc(IntCount2);
        Inc(IntCountUnit);
      end;
    end;
  end;

  TotalUnitJalan.Text:=IToCurr(IntCountUnit);
end;


procedure TKaneboRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TKaneboRpt.LihatClick(Sender: TObject);
begin
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TKaneboRpt.CetakClick(Sender: TObject);
var Qry:TADOQuery;
begin
  PreparePrint;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    QReport.DataSet:=Qry;
    QNo.DataSet:=Qry;
    QNama.DataSet:=Qry;
    QBody.DataSet:=Qry;
    QKPP.DataSet:=Qry;
    QPhoneNo.DataSet:=Qry; 
    QShift.DataSet:=Qry;
    QReport.Prepare;
    QReport.Preview;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TKaneboRpt.PreparePrint;
begin
  QTanggal.Caption:=FormatDateTime('dd-mm-yyyy',Tanggal.Date)
end;

procedure TKaneboRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(GridSPJ) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TKaneboRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

end.
