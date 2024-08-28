unit VhcOutRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, ComCtrls, WHUnit;


type
  TVhcOutRpt = class(TForm)
    Selesai: TButton;
    StrGrid: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    DariTanggal: TDateTimePicker;
    SampaiTanggal: TDateTimePicker;
    GroupTotal: TGroupBox;
    Total: TEdit;
    Label4: TLabel;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    ToXCel: TSpeedButton;
    LihatData: TButton;
    Lokasi: TComboBox;
    Label5: TLabel;
    Jenis: TComboBox;
    Day_Night: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure DariTanggalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,JenisArr:Array of TArrString2;
    procedure Init;
    procedure InitGrid;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshList;
  public
    { Public declarations }
  end;

var
  VhcOutRpt: TVhcOutRpt;

implementation

uses MainU, Math;

{$R *.dfm}

procedure TVhcOutRpt.Init;
begin
  DariTanggal.Date:=Now();
  SampaiTanggal.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  Total.Text:='';
  Jenis.Text:='';
  jenis.Items.Clear;
end;

procedure TVhcOutRpt.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No SPJ';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Batch';
  StrGrid.Cells[3,0]:='Pool';
  StrGrid.Cells[4,0]:='No Body';
  StrGrid.Cells[5,0]:='No Telp';
  StrGrid.Cells[6,0]:='No KPP';
  StrGrid.Cells[7,0]:='Mitra';
  StrGrid.Cells[8,0]:='Shift';
  StrGrid.Cells[9,0]:='KM Out';
  StrGrid.Cells[10,0]:='KM In';
  StrGrid.Cells[11,0]:='KM Tempuh';
  StrGrid.Cells[12,0]:='BBM';
  StrGrid.Cells[13,0]:='Rasio BBM';
  StrGrid.Cells[14,0]:='Jam Out';
  StrGrid.Cells[15,0]:='Jam In';
  StrGrid.Cells[16,0]:='Argo';
  StrGrid.Cells[17,0]:='Rit';
  StrGrid.Cells[18,0]:='Drops Out';
  StrGrid.Cells[19,0]:='Drops In';
  StrGrid.Cells[20,0]:='Rit Out';
  StrGrid.Cells[21,0]:='Rit In';
end;

procedure TVhcOutRpt.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
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
end;

procedure TVhcOutRpt.RefreshList;
var BBM:Real;
    BBMStr,QStr,StrLokasi,StrJenis,StrDayNight:String;
    Qry:TADOQuery;
    Count,Count2:Integer;
begin
  Main.M_Busy;
  for Count:=1 to StrGrid.RowCount-1 do
    for Count2:=0 to 17 do
      StrGrid.Cells[Count2,Count]:='';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrLokasi:='';
    StrJenis:='';
    if Lokasi.Text='All' then begin
      StrLokasi:='0';
    end else begin
      StrLokasi:=Lokasi.Text;
    end;
    if Day_Night.Text<>'All' then
      if Day_Night.Text='Pagi' then StrDayNight:=',@DayNight=1'
      else StrDayNight:=',@DayNight=2'
    else StrDayNight:='';
    if (Jenis.Text<>'All') then  StrJenis:=',@BatchId='+JenisArr[Jenis.ItemIndex][0];
    QStr:='EXEC GetVhcOutRpt '+StrLokasi+','+
      Chr(39)+FormatDateTime('dd-mm-yyyy',DariTanggal.Date)+Chr(39)+','+
      Chr(39)+FormatDateTime('dd-mm-yyyy',SampaiTanggal.Date)+Chr(39)+
      StrJenis+',@CompanyId=3'+StrDayNight+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
    for Count:=0 to 15 do StrGrid.Cells[Count,1]:='';
    Count:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,Count+1]:=Qry.FieldValues['vhc_trans_id'];
      StrGrid.Cells[1,Count+1]:=Qry.FieldValues['out_date'];
      StrGrid.Cells[2,Count+1]:=Qry.FieldValues['vhc_batch_id'];
      StrGrid.Cells[3,Count+1]:=Qry.FieldValues['location'];
      StrGrid.Cells[4,Count+1]:=Qry.FieldValues['body_id'];
      if (Qry.FieldValues['phone_no']<>'') OR (Qry.FieldValues['phone_no']<>NULL) then
        StrGrid.Cells[5,Count+1]:=Qry.FieldValues['phone_no'];
      StrGrid.Cells[6,Count+1]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[7,Count+1]:=Qry.FieldValues['name'];
      StrGrid.Cells[8,Count+1]:=Qry.FieldValues['day_night'];
      StrGrid.Cells[9,Count+1]:=SToCurr(Qry.FieldValues['out_ordo_km']);
      if Qry.FieldValues['in_ordo_km']<>NULL then
        StrGrid.Cells[10,Count+1]:=SToCurr(Qry.FieldValues['in_ordo_km']);
      if Qry.FieldValues['distance']<>NULL then
        StrGrid.Cells[11,Count+1]:=SToCurr(Qry.FieldValues['distance']);
      if Qry.FieldValues['fuel_price']<>NULL then StrGrid.Cells[12,Count+1]:=IToCurr(Qry.FieldValues['fuel_price']);
      if (Qry.FieldValues['fuel_litre']<>NULL) AND (Qry.FieldValues['fuel_litre']>0) AND (Qry.FieldValues['distance']<>'0')then begin
        BBMStr:=Qry.FieldValues['fuel_litre'];
        BBM:=Qry.FieldValues['distance']/StrToFloat(BBMStr);
        StrGrid.Cells[13,Count+1]:=FloatToStrF(BBM,ffNumber,6,2);
      end;
      StrGrid.Cells[14,Count+1]:=Qry.FieldValues['out_time'];
      if Qry.FieldValues['in_time']<>NULL then
        StrGrid.Cells[15,Count+1]:=Qry.FieldValues['in_time'];
      if Qry.FieldValues['gross_argo']<>NULL then
        StrGrid.Cells[16,Count+1]:=IToCurr(Qry.FieldValues['gross_argo']);
      if Qry.FieldValues['rits']<>NULL then
        StrGrid.Cells[17,Count+1]:=Qry.FieldValues['rits'];
        StrGrid.Cells[18,Count+1]:=Qry.FieldValues['out_drops'];
        if Qry.FieldValues['in_drops']<>NULL then StrGrid.Cells[19,Count+1]:=Qry.FieldValues['in_drops'];
        StrGrid.Cells[20,Count+1]:=Qry.FieldValues['out_rits'];
        if Qry.FieldValues['in_rits']<>NULL then StrGrid.Cells[21,Count+1]:=Qry.FieldValues['in_rits'];
      Qry.Next;
      Inc(Count);
    end;
    Total.Text:=IntToStr(Count);
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVhcOutRpt.RefreshCombo;
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
  Day_Night.Items.Clear;
  Day_Night.Items.Add('All');
  Day_Night.Items.Add('Pagi');
  Day_Night.Items.Add('Malam');
  Day_Night.ItemIndex:=Day_Night.Items.IndexOf('All');  
  Main.M_Normal;
end;

procedure TVhcOutRpt.SelesaiClick(Sender: TObject);
begin
  VhcOutRpt.Close;
end;

procedure TVhcOutRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVhcOutRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVhcOutRpt.LihatDataClick(Sender: TObject);
begin
  RefreshList;
end;

procedure TVhcOutRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TVhcOutRpt.DariTanggalChange(Sender: TObject);
begin
  if DariTanggal.Date>SampaiTanggal.Date then SampaiTanggal.Date:=DariTanggal.Date; 
end;

procedure TVhcOutRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
  RefreshList;
end;

end.
