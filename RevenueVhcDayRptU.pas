unit RevenueVhcDayRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, ADODB, WHUnit,
  ZColorStringGrid, ExtCtrls;

type
  TRevenueVhcDayRpt = class(TForm)
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Batch: TComboBox;
    Label3: TLabel;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    LokasiDisp: TEdit;
    Refresh: TButton;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    TotalUnitOperasi: TEdit;
    StrGrid: TZColorStringGrid;
    Lokasi: TComboBox;
    Panel1: TPanel;
    GroupDisp: TEdit;
    Day_Night: TComboBox;
    Label5: TLabel;
    PanelLegend: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  RevenueVhcDayRpt: TRevenueVhcDayRpt;
  LokasiArr,GroupArr:Array of TArrString2;
  MaxCol,IntRow,IntCol:Integer;

implementation

uses MainU, DepositFormU;

{$R *.dfm}

procedure TRevenueVhcDayRpt.Init;
var Count,Count2:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  MaxCol:=54;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  Tanggal.Date:=Now();
  Batch.Items.Clear;
  Batch.ItemIndex:=0;
  Batch.Text:='';
//  Batch.Items.Add('All');
//  Batch.Text:='All';
  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='No';
  StrGrid.Cells[2,0]:='Lokasi';
  StrGrid.Cells[3,0]:='No Body';
  StrGrid.Cells[4,0]:='Jam Klr';
  StrGrid.Cells[5,0]:='Jam Msk';
  StrGrid.Cells[6,0]:='Batangan';
  StrGrid.Cells[7,0]:='No KPP';
  StrGrid.Cells[8,0]:='Mitra';
  StrGrid.Cells[9,0]:='Svc';
  StrGrid.Cells[10,0]:='Rit';
  StrGrid.Cells[11,0]:='Rit Rp';
  StrGrid.Cells[12,0]:='Drop';
  StrGrid.Cells[13,0]:='Drop Rp';
  StrGrid.Cells[14,0]:='Total';
  StrGrid.Cells[15,0]:='Dummy';
  StrGrid.Cells[16,0]:='Argo+Dummy';
  StrGrid.Cells[17,0]:='Slsh FR';
  StrGrid.Cells[18,0]:='Argo+Dummy+FR';
  StrGrid.Cells[19,0]:='BBM(Ltr)';
  StrGrid.Cells[20,0]:='BBM(Rp)';
  StrGrid.Cells[21,0]:='BBG(Ltr)';
  StrGrid.Cells[22,0]:='BBG(Rp)';
  StrGrid.Cells[23,0]:='BBM+BBG(Rp)';
  StrGrid.Cells[24,0]:='Net Argo';
  StrGrid.Cells[25,0]:='Komisi';
  StrGrid.Cells[26,0]:='Toll';
  StrGrid.Cells[27,0]:='Park SHIA';
  StrGrid.Cells[28,0]:='Reimb Toll';
  StrGrid.Cells[29,0]:='Svc Fee';
  StrGrid.Cells[30,0]:='Subsidi BBM';
  StrGrid.Cells[31,0]:='Tabungan';
  StrGrid.Cells[32,0]:='Jaminan';
  StrGrid.Cells[33,0]:='KS';
  StrGrid.Cells[34,0]:='OR';
  StrGrid.Cells[35,0]:='Tilang';
  StrGrid.Cells[36,0]:='Denda';
  StrGrid.Cells[37,0]:='Denda Argo';
  StrGrid.Cells[38,0]:='Strn KS';
  StrGrid.Cells[39,0]:='Seragam';
  StrGrid.Cells[40,0]:='Cicilan PK';
  StrGrid.Cells[41,0]:='Diterima Persh';
  StrGrid.Cells[42,0]:='Diterima Mitra';
  StrGrid.Cells[43,0]:='KM Out';
  StrGrid.Cells[44,0]:='KM In';
  StrGrid.Cells[45,0]:='KM Run';
  StrGrid.Cells[46,0]:='R KM';
  StrGrid.Cells[47,0]:='R BBM';
  StrGrid.Cells[48,0]:='KM Argo Out';
  StrGrid.Cells[49,0]:='KM Argo In';
  StrGrid.Cells[50,0]:='R KM Argo';
  StrGrid.Cells[51,0]:='Ins R BBM';
  StrGrid.Cells[52,0]:='Ins Argo';
  StrGrid.Cells[53,0]:='Ins Argo*';
  StrGrid.Cells[54,0]:='Tabungan Laka';
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=25;
  StrGrid.ColWidths[2]:=85;
  StrGrid.ColWidths[3]:=55;
  StrGrid.ColWidths[4]:=45;
  StrGrid.ColWidths[5]:=45;
  StrGrid.ColWidths[6]:=150;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=150;
  StrGrid.ColWidths[9]:=40;
  StrGrid.ColWidths[10]:=25;
  StrGrid.ColWidths[19]:=40;
  StrGrid.ColWidths[21]:=40;
  StrGrid.ColWidths[43]:=55;
  StrGrid.ColWidths[44]:=55;
  StrGrid.ColWidths[45]:=40;
  StrGrid.ColWidths[46]:=40;
  StrGrid.ColWidths[47]:=40;
  StrGrid.ColWidths[54]:=100;
  for Count:=0 to MaxCol do
    StrGrid.Cells[Count,1]:='';
end;


procedure TRevenueVhcDayRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  StrQry:='EXEC GetLocation 3,1';
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
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
  StrQry:='EXEC GetGroup 3';
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  SetLength(GroupArr,Qry.RecordCount+1);
  GroupArr[0][0]:='All';
  GroupArr[0][1]:='All';
  Count:=1;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
    GroupArr[Count][0]:=Qry.FieldValues['vhc_batch_id'];
    GroupArr[Count][1]:=Qry.FieldValues['name'];
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then
    GroupLokasi.Enabled:=False;
  for Count:=0 to Length(GroupArr)-1 do
    Batch.Items.Add(GroupArr[Count][0]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
  Day_Night.Items.Clear;
  Day_Night.Items.Add('All');
  Day_Night.Items.Add('Pagi');
  Day_Night.Items.Add('Malam');
  Day_Night.ItemIndex:=Day_Night.Items.IndexOf('All');
end;

procedure TRevenueVhcDayRpt.RefreshData;
var StrQry,StrBatch,StrLokasi,StrDayNight:String;
    Qry:TADOQuery;
    Qry2:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,Total8,Total9,OnRisk,Denda,Seragam,KS,Tabungan,CicilanKS,ArgoKotor:Integer;
    Rits,Drops,BBMLiter,GasLiter,BBMRp,GasRp,Komisi:Integer;
    TotalRits,TotalRitsRp,TotalDrops,TotalDropsRp,TotalBBMRp,TotalBBMLiter,TotalGasRp,TotalGasLiter:Integer;
    TotalTotal1,TotalArgoKotor,TotalArgoBersih,TotalKS,TotalCicilanKS,TotalOperasi,TotalTabungan,TotalKomisi,TotalInsentifArgo,TotalTaLaKa:Integer;
    TotalServiceFee,TotalReimburseToll,TotalDenda,TotalSubsidiBBM,TotalParkir,TotalDiterimaPers,TotalJaminan,TotalSeragam,TotalOR:Integer;
    DendaArgo,TotalDendaArgo,TotalCicilanPK,CicilanPK,TotalInsRBBM,TotalInsArgo,
    InsentifArgo,TaLaKa:Integer;
begin
  TotalRits:=0;
  TotalRitsRp:=0;
  TotalDrops:=0;
  TotalDropsRp:=0;
  TotalBBMRp:=0;
  TotalBBMLiter:=0;
  TotalGasRp:=0;
  TotalGasLiter:=0;
  TotalArgoKotor:=0;
  TotalArgoBersih:=0;
  TotalKomisi:=0;
  TotalKS:=0;
  TotalCicilanKS:=0;
  TotalTotal1:=0;
  TotalOperasi:=0;
  TotalTabungan:=0;
  TotalServiceFee:=0;
  TotalReimburseToll:=0;
  TotalOR:=0;
  TotalDenda:=0;
  TotalSeragam:=0;
  TotalSubsidiBBM:=0;
  TotalParkir:=0;
  TotalDiterimaPers:=0;
  TotalJaminan:=0;
  TotalDendaArgo:=0;
  TotalCicilanPK:=0;
  TotalInsRBBM:=0;
  TotalInsArgo:=0;
  TotalInsentifArgo:=0;
  TotalTaLaKa:=0;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry2:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  if Lokasi.Text='All' then begin
    StrLokasi:='0';
  end else begin
    StrLokasi:=Lokasi.Text;
  end;
  if Batch.Text='All' then begin
    StrBatch:='0';
  end else begin
    StrBatch:=Batch.Text;
  end;
  if Day_Night.Text<>'All' then
    if Day_Night.Text='Pagi' then StrDayNight:=',@DayNight=1'
    else StrDayNight:=',@DayNight=2'
  else StrDayNight:='';
  Main.M_Busy;
  StrQry:='EXEC GetRevenueVhcDayRpt '+StrLokasi+','+
        Chr(39)+FormatDateTime('dd-mm-yyyy',Tanggal.Date)+Chr(39)+','+
        Chr(39)+StrBatch+Chr(39)+',1,@CompanyId=3'+StrDayNight+';';
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
  for Count:=0 to MaxCol do begin
    for Count2:=1 to StrGrid.RowCount do begin
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
      StrGrid.CellStyle[Count,Count2].Font.Color:=clWindowText;
    end;
  end;
  Count:=1;
  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    for Count2:=0 to MaxCol do StrGrid.Cells[Count2,Count]:='';
    ArgoKotor:=0;
    if Qry.FieldValues['vhc_trans_id']<>NULL then StrGrid.Cells[0,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[1,Count]:=IntToStr(Count);
    StrGrid.Cells[2,Count]:=Qry.FieldValues['location'];
    StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
    StrGrid.Cells[6,Count]:=Qry.FieldValues['schedule_name'];
    if Qry.FieldValues['day_night']=1 then for Count2:=1 to StrGrid.RowCount do StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
    if Qry.FieldValues['day_night']=2 then for Count2:=1 to StrGrid.RowCount do StrGrid.CellStyle[Count2,Count].Font.Color:=clBlue;
    if Qry.FieldValues['job_inex_id']>0 then begin
      if Qry.FieldValues['job_inex_id']=1 then StrGrid.Cells[9,Count]:='In' else
      if Qry.FieldValues['job_inex_id']=2 then StrGrid.Cells[9,Count]:='Out';
    end;
    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      if Qry.FieldValues['rits']<>NULL then Rits:=Qry.FieldValues['rits'] else Rits:=0;
      if Qry.FieldValues['drops']<>NULL then Drops:=Qry.FieldValues['drops'] else Drops:=0;
      if Qry.FieldValues['fuel_litre']<>NULL then BBMLiter:=Qry.FieldValues['fuel_litre'] else BBMLiter:=0;
      if Qry.FieldValues['fuel_price']<>NULL then BBMRp:=Qry.FieldValues['fuel_price'] else BBMRp:=0;
      if Qry.FieldValues['gas_litre']<>NULL then GasLiter:=Qry.FieldValues['gas_litre'] else GasLiter:=0;
      if Qry.FieldValues['gas_price']<>NULL then GasRp:=Qry.FieldValues['gas_price'] else GasRp:=0;
      if Qry.FieldValues['commission']<>NULL then Komisi:=Qry.FieldValues['commission'] else Komisi:=0;
      ArgoKotor:=(Rits*Qry.FieldValues['ritsatuan'])+(Drops*Qry.FieldValues['dropsatuan']);
      TotalRits:=TotalRits+Rits;
      TotalRitsRp:=TotalRitsRp+Rits*Qry.FieldValues['ritsatuan'];
      TotalDrops:=TotalDrops+Drops;
      TotalDropsRp:=TotalDropsRp+Drops*Qry.FieldValues['dropsatuan'];
      TotalArgoKotor:=TotalArgoKotor+ArgoKotor;
      StrGrid.Cells[7,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[8,Count]:=Qry.FieldValues['name'];
      StrGrid.CellStyle[4,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[5,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taCenter;
      if Qry.FieldValues['out_time']<>NULL then StrGrid.Cells[4,Count]:=Qry.FieldValues['out_time'];
      if Qry.FieldValues['in_time']<>NULL then StrGrid.Cells[5,Count]:=Qry.FieldValues['in_time'];
      StrGrid.Cells[10,Count]:=IToCurr(Rits);
      StrGrid.Cells[11,Count]:=IToCurr(Rits*Qry.FieldValues['ritsatuan']);
      StrGrid.Cells[12,Count]:=IToCurr(Drops);
      StrGrid.Cells[13,Count]:=IToCurr(Drops*Qry.FieldValues['dropsatuan']);
      StrGrid.Cells[14,Count]:=IToCurr(ArgoKotor);
      StrGrid.Cells[42,Count]:=IToCurr(Qry.FieldValues['partner_income']);
      StrGrid.Cells[43,Count]:=IToCurr(Qry.FieldValues['out_ordo_km']);
      if Qry.FieldValues['in_ordo_km']<>NULL then begin
        StrGrid.Cells[44,Count]:=IToCurr(Qry.FieldValues['in_ordo_km']);
        StrGrid.Cells[45,Count]:=IToCurr(Qry.FieldValues['distance']);
        StrGrid.Cells[46,Count]:=IntToStr(Qry.FieldValues['hired_ratio'])+' %';
        if (Qry.FieldValues['fuel_litre']<>NULL) and (Qry.FieldValues['fuel_litre']<>0) then
          StrGrid.Cells[47,Count]:=FloatToStrF(Qry.FieldValues['distance']/StrToFloat(Qry.FieldValues['fuel_litre']),ffNumber,6,2)
        else
          StrGrid.Cells[47,Count]:='0';
      end else begin
        StrGrid.Cells[44,Count]:='0';
        StrGrid.Cells[45,Count]:='0';
        StrGrid.Cells[46,Count]:='0';
      end;
      StrGrid.Cells[48,Count]:=IToCurr(Qry.FieldValues['out_argo_km']);
      if Qry.FieldValues['in_argo_km']<>NULL then begin
        StrGrid.Cells[49,Count]:=IToCurr(Qry.FieldValues['in_argo_km']);
        StrGrid.Cells[50,Count]:=IToCurr(Qry.FieldValues['hired_argo_ratio'])+' %';
      end else begin
        StrGrid.Cells[49,Count]:='0';
        StrGrid.Cells[50,Count]:='0';
      end;
      if Qry.FieldValues['day_night']=1 then for Count2:=1 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
      if Qry.FieldValues['day_night']=2 then for Count2:=1 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clBlue;
      StrQry:='SELECT b.transaction_obj_id,b.value,a.* FROM wh_vhc_trans_detail AS a '+
            ' INNER JOIN wh_transaction_type AS b ON b.transaction_type_id=a.transaction_type_id '+
            ' WHERE a.vhc_trans_id='+Chr(39)+Qry.FieldValues['vhc_trans_id']+Chr(39)+' ;';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      Total1:=0;
      Total2:=0;
      Total3:=0;
      Total4:=0;
      Total5:=0;
      Total6:=0;
      Total7:=0;
      Total8:=0;
      Total9:=0;
      OnRisk:=0;
      Denda:=0;
      Seragam:=0;
      DendaArgo:=0;
      CicilanPK:=0;
      InsentifArgo:=0;
      TaLaKa:=0;
      if Qry2.RecordCount>0 then while not (Qry2.Eof) do begin
        if Qry2.FieldValues['transaction_obj_id']=1101 then Total1:=Total1+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110201 then Total2:=Total2+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110202 then Total2:=Total2+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110215 then Total2:=Total2+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110206 then Total2:=Total2+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_obj_id']=1103 then Total4:=Total4+(Qry2.FieldValues['value']-Qry2.FieldValues['amount']);
        if Qry2.FieldValues['transaction_type_id']=110401 then Total3:=Total3+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110345 then Total3:=Total3+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110402 then Total6:=Total6+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110403 then Total5:=Total5+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110203 then Denda:=Denda+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110205 then Total7:=Total7+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110208 then Denda:=Denda+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110211 then DendaArgo:=DendaArgo+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110411 then Total8:=Total8+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110409 then Total9:=Total9+Qry2.FieldValues['amount'];
        Qry2.Next;
      end;
      Qry2.Close;
      StrQry:='SELECT a.transaction_type_id,a.amount FROM wh_empl_transaction_detail AS a '+
            ' INNER JOIN wh_empl_transaction b ON b.empl_transaction_id=a.empl_transaction_id'+
            ' WHERE b.employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+
            ' AND b.form_id='+Chr(39)+Qry.FieldValues['vhc_trans_id']+Chr(39)+
            ' AND ((a.transaction_type_id=110204) OR (a.transaction_type_id=120101) OR (a.transaction_type_id=120102) OR (a.transaction_type_id=120103)'+
            ' OR (a.transaction_type_id=110207) OR (a.transaction_type_id=110209) OR (a.transaction_type_id=110212)'+
            ' OR (a.transaction_type_id=110503) OR (a.transaction_type_id=120121) OR (a.transaction_type_id=110217) OR (a.transaction_type_id=120120) OR (a.transaction_type_id=130125)  ) ;';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      KS:=0;
      Tabungan:=0;
      CicilanKS:=0;
      if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
        if Qry2.FieldValues['transaction_type_id']=120101 then KS:=KS+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=120102 then Tabungan:=Tabungan-(Qry2.FieldValues['amount']);
        if (Qry2.FieldValues['transaction_type_id']=120103) OR (Qry2.FieldValues['transaction_type_id']=110204) then CicilanKS:=CicilanKS-Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110207 then Seragam:=Seragam+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110209 then OnRisk:=OnRisk+Qry2.FieldValues['amount'];
        if Qry2.FieldValues['transaction_type_id']=110212 then CicilanPK:=CicilanPK+Qry2.FieldValues['amount'];
        if (Qry2.FieldValues['transaction_type_id']=110503) or (Qry2.FieldValues['transaction_type_id']=120121) then InsentifArgo:=InsentifArgo+Qry2.FieldValues['amount']; {Insentif Argo*}
        if (Qry2.FieldValues['transaction_type_id']=110217) OR (Qry2.FieldValues['transaction_type_id']=120120) OR (Qry2.FieldValues['transaction_type_id']=130125) then TaLaKa:=TaLaKa+Qry2.FieldValues['amount']; {Tabungan Laka}
        Qry2.Next;
      end;
      StrGrid.Cells[15,Count]:=IToCurr(Total1);
      StrGrid.Cells[16,Count]:=IToCurr(ArgoKotor+Total1);
      StrGrid.Cells[17,Count]:=IToCurr(Total4);
      StrGrid.Cells[18,Count]:=IToCurr(Total4+ArgoKotor+Total1);
      StrGrid.Cells[19,Count]:=IToCurr(BBMLiter);
      StrGrid.Cells[20,Count]:=IToCurr(BBMRp);
      StrGrid.Cells[21,Count]:=IToCurr(GasLiter);
      StrGrid.Cells[22,Count]:=IToCurr(GasRp);
      StrGrid.Cells[23,Count]:=IToCurr(BBMRp+GasRp);
      StrGrid.Cells[24,Count]:=IToCurr((Total4+ArgoKotor+Total1)-(BBMRp+GasRp));
      StrGrid.Cells[25,Count]:=IToCurr(Komisi);
      StrGrid.Cells[26,Count]:=IToCurr(Total3);
      StrGrid.Cells[27,Count]:=IToCurr(Total6);
      StrGrid.Cells[28,Count]:=IToCurr(Total3);
      StrGrid.Cells[29,Count]:=IToCurr(Total2);
      StrGrid.Cells[30,Count]:=IToCurr(Total5);
      StrGrid.Cells[31,Count]:=IToCurr(Tabungan);
      StrGrid.Cells[32,Count]:=IToCurr(Total7);
      StrGrid.Cells[33,Count]:=IToCurr(KS);
      StrGrid.Cells[34,Count]:=IToCurr(0-OnRisk);
      StrGrid.Cells[36,Count]:=IToCurr(Denda);
      StrGrid.Cells[37,Count]:=IToCurr(DendaArgo);
      StrGrid.Cells[38,Count]:=IToCurr(CicilanKS);
      StrGrid.Cells[39,Count]:=IToCurr(0-Seragam);
      StrGrid.Cells[40,Count]:=IToCurr(0-CicilanPK);
      StrGrid.Cells[51,Count]:=IToCurr(Total8);
      StrGrid.Cells[52,Count]:=IToCurr(Total9);
      StrGrid.Cells[53,Count]:=IToCurr(0-InsentifArgo);
      StrGrid.Cells[54,Count]:=IToCurr(0-TaLaKa);
      if Qry.FieldValues['reguler']=0 then begin
        StrGrid.Cells[41,Count]:=IToCurr(((Total4+ArgoKotor+Total1)-(BBMRp+GasRp))-Komisi-Total3-Total5-Total6);
      end else begin
        StrGrid.Cells[41,Count]:=IToCurr((Total4+ArgoKotor+Total1)-Komisi-Total3-Total5-Total6);
      end;
      TotalTotal1:=TotalTotal1+Total1;
      TotalArgoBersih:=TotalArgoBersih+((Total4+ArgoKotor+Total1)-(BBMRp+GasRp));
      TotalKomisi:=TotalKomisi+Komisi;
      TotalKS:=TotalKS+KS;
      TotalCicilanKS:=TotalCicilanKS+CicilanKS;
      TotalTabungan:=TotalTabungan+Tabungan;
      TotalJaminan:=TotalJaminan+Total7;
      TotalBBMRp:=TotalBBMRp+BBMRp;
      TotalServiceFee:=TotalServiceFee+Total2;
      TotalReimburseToll:=TotalReimburseToll+Total3;
      TotalDenda:=TotalDenda+Denda;
      TotalDendaArgo:=TotalDendaArgo+DendaArgo;
      TotalSeragam:=TotalSeragam+Seragam;
      TotalOR:=TotalOR+OnRisk;
      TotalSubsidiBBM:=TotalSubsidiBBM+Total5;
      TotalParkir:=TotalParkir+Total6;
      TotalCicilanPK:=TotalCicilanPK+CicilanPK;
      TotalInsRBBM:=TotalInsRBBM+Total8;
      TotalInsArgo:=TotalInsArgo+Total9;
      TotalInsentifArgo:=TotalInsentifArgo+InsentifArgo;
      TotalTaLaKa:=TotalTaLaKa+TaLaKa;  
      if Qry.FieldValues['reguler']=0 then begin
        TotalDiterimaPers:=TotalDiterimaPers+(((Total4+ArgoKotor+Total1)-(BBMRp+GasRp))-Komisi-Total3-Total5-Total6);
      end else begin
        TotalDiterimaPers:=TotalDiterimaPers+((Total4+ArgoKotor+Total1)-Komisi-Total3-Total5-Total6);
      end;
    end;
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for Count:=0 to 33 do StrGrid.Cells[Count,StrGrid.RowCount-1]:='';
//  for Count:=5 to 32 do StrGrid.CellStyle[Count,StrGrid.RowCount-1].BGColor:=clBlue;
  StrGrid.Cells[9,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[10,StrGrid.RowCount-1]:=IToCurr(TotalRits);
  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(TotalRitsRp);
  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(TotalDrops);
  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(TotalDropsRp);
  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(TotalArgoKotor);
  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(TotalTotal1);
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp);
  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalArgoBersih);
  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalKomisi);
  StrGrid.Cells[27,StrGrid.RowCount-1]:=IToCurr(TotalParkir);
  StrGrid.Cells[28,StrGrid.RowCount-1]:=IToCurr(TotalReimburseToll);
  StrGrid.Cells[29,StrGrid.RowCount-1]:=IToCurr(TotalServiceFee);
  StrGrid.Cells[30,StrGrid.RowCount-1]:=IToCurr(TotalSubsidiBBM);
  StrGrid.Cells[31,StrGrid.RowCount-1]:=IToCurr(TotalTabungan);
  StrGrid.Cells[32,StrGrid.RowCount-1]:=IToCurr(TotalJaminan);
  StrGrid.Cells[33,StrGrid.RowCount-1]:=IToCurr(TotalKS);
  StrGrid.Cells[34,StrGrid.RowCount-1]:=IToCurr(0-TotalOR);
  StrGrid.Cells[36,StrGrid.RowCount-1]:=IToCurr(TotalDenda);
  StrGrid.Cells[37,StrGrid.RowCount-1]:=IToCurr(TotalDendaArgo);
  StrGrid.Cells[38,StrGrid.RowCount-1]:=IToCurr(TotalCicilanKS);
  StrGrid.Cells[39,StrGrid.RowCount-1]:=IToCurr(0-TotalSeragam);
  StrGrid.Cells[40,StrGrid.RowCount-1]:=IToCurr(0-TotalCicilanPK);
  StrGrid.Cells[41,StrGrid.RowCount-1]:=IToCurr(TotalDiterimaPers);
  StrGrid.Cells[51,StrGrid.RowCount-1]:=IToCurr(TotalInsRBBM);
  StrGrid.Cells[52,StrGrid.RowCount-1]:=IToCurr(TotalInsArgo);
  StrGrid.Cells[53,StrGrid.RowCount-1]:=IToCurr(0-TotalInsentifArgo);
  StrGrid.Cells[54,StrGrid.RowCount-1]:=IToCurr(0-TotalTaLaKa);
  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  StrGrid.CellStyle[9,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[10,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[11,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[12,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[13,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[14,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[15,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[25,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[27,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[28,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[29,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[30,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[31,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[33,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[36,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[37,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[38,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[39,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[40,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[41,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[51,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[52,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[53,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[55,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.ColWidths[0]:=0;
  Main.M_Normal;
end;

procedure TRevenueVhcDayRpt.SelesaiClick(Sender: TObject);
begin
  RevenueVhcDayRpt.Close;
end;

procedure TRevenueVhcDayRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRevenueVhcDayRpt.RefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TRevenueVhcDayRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TRevenueVhcDayRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TRevenueVhcDayRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TRevenueVhcDayRpt.BatchChange(Sender: TObject);
begin
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TRevenueVhcDayRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TRevenueVhcDayRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) then begin
    DepositForm:=TDepositForm.Create(Self);
    DepositForm.Reprint(StrGrid.Cells[0,IntRow]);
    DepositForm.Close;
  end;
end;

end.
