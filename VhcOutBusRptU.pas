unit VhcOutBusRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, ComCtrls, WHUnit,
  ZColorStringGrid;


type
  TVhcOutBusRpt = class(TForm)
    Selesai: TButton;
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
    procedure Init;
    procedure InitGrid;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshList;
  public
    { Public declarations }
  end;

var
  VhcOutBusRpt: TVhcOutBusRpt;
  LokasiArr:Array of TArrString2;

implementation

uses MainU, Math;

{$R *.dfm}

procedure TVhcOutBusRpt.Init;
begin
  DariTanggal.Date:=Now();
  SampaiTanggal.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  Total.Text:='';
  Jenis.Text:='';
  jenis.Items.Clear;
end;

procedure TVhcOutBusRpt.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No SJ';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Batch';
  StrGrid.Cells[3,0]:='Pool';
  StrGrid.Cells[4,0]:='No Body';
  StrGrid.Cells[5,0]:='No Telp';
  StrGrid.Cells[6,0]:='NIP';
  StrGrid.Cells[7,0]:='Driver';
  StrGrid.Cells[8,0]:='Shift';
  StrGrid.Cells[9,0]:='KM Out';
  StrGrid.Cells[10,0]:='KM In';
  StrGrid.Cells[11,0]:='KM Tempuh';
  StrGrid.Cells[12,0]:='BBM';
  StrGrid.Cells[13,0]:='Rasio BBM';
  StrGrid.Cells[14,0]:='Jam Out';
  StrGrid.Cells[15,0]:='Jam In';
//  StrGrid.Cells[16,0]:='Argo';
//  StrGrid.Cells[17,0]:='Rit';
end;

procedure TVhcOutBusRpt.RefreshJenis;
begin
  Jenis.Items.Add('All');
  Jenis.Items.Add('Big');
  Jenis.Items.Add('Medium');
  Jenis.Items.Add('Elf');
  Jenis.ItemIndex:=0;
end;

procedure TVhcOutBusRpt.RefreshList;
var BBM:Real;
    BBMStr,QStr,StrLokasi,StrJenis:String;
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
    if (Jenis.Text<>'All') then
      if Jenis.Text='Big' then StrJenis:=',@BatchId=5'
      else if Jenis.Text='Medium' then StrJenis:=',@BatchId=6'
      else if Jenis.Text='Elf' then StrJenis:=',@BatchId=7';
    QStr:='EXEC GetVhcOutRpt '+StrLokasi+','+
      Chr(39)+FormatDateTime('dd-mm-yyyy',DariTanggal.Date)+Chr(39)+','+
      Chr(39)+FormatDateTime('dd-mm-yyyy',SampaiTanggal.Date)+Chr(39)+
      ',@CompanyId=2'+StrJenis+';';
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
      if Qry.FieldValues['out_time']<>NULL then StrGrid.Cells[14,Count+1]:=Qry.FieldValues['out_time'];
      if Qry.FieldValues['in_time']<>NULL then StrGrid.Cells[15,Count+1]:=Qry.FieldValues['in_time'];
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

procedure TVhcOutBusRpt.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
  Main.MyConnection.Close;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
end;

procedure TVhcOutBusRpt.SelesaiClick(Sender: TObject);
begin
  VhcOutBusRpt.Close;
end;

procedure TVhcOutBusRpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVhcOutBusRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVhcOutBusRpt.LihatDataClick(Sender: TObject);
begin
  RefreshList;
end;

procedure TVhcOutBusRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TVhcOutBusRpt.DariTanggalChange(Sender: TObject);
begin
  if DariTanggal.Date>SampaiTanggal.Date then SampaiTanggal.Date:=DariTanggal.Date; 
end;

procedure TVhcOutBusRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshJenis;
  RefreshCombo;
  RefreshList;
end;

end.
