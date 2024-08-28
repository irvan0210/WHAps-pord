unit RevenueVhcDayCancelRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, ADODB, WHUnit,
  ZColorStringGrid, ExtCtrls;

type
  TRevenueVhcDayCancelRpt = class(TForm)
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Batch: TComboBox;
    Label3: TLabel;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    LokasiDisp: TEdit;
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
    Refresh: TButton;
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
    LokasiArr,GroupArr:Array of TArrString2;
    MaxCol,IntRow,IntCol:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  RevenueVhcDayCancelRpt: TRevenueVhcDayCancelRpt;

implementation

uses MainU, DepositFormU;

{$R *.dfm}

procedure TRevenueVhcDayCancelRpt.Init;
var Count,Count2:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  MaxCol:=9;
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
  StrGrid.Cells[5,0]:='Batangan';
  StrGrid.Cells[6,0]:='No KPP';
  StrGrid.Cells[7,0]:='Mitra';
  StrGrid.Cells[8,0]:='User Update';
  StrGrid.Cells[9,0]:='Waktu Update';
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=35;
  StrGrid.ColWidths[2]:=85;
  StrGrid.ColWidths[3]:=55;
  StrGrid.ColWidths[4]:=45;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=75;
  StrGrid.ColWidths[7]:=150;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=90;
  for Count:=0 to MaxCol do
    StrGrid.Cells[Count,1]:='';
end;


procedure TRevenueVhcDayCancelRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TRevenueVhcDayCancelRpt.RefreshData;
var StrQry,StrBatch,StrLokasi,StrDayNight:String;
    Qry:TADOQuery;
    Qry2:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,Total8,Total9,OnRisk,Denda,Seragam,KS,Tabungan,CicilanKS,ArgoKotor:Integer;
    Rits,Drops,BBMLiter,GasLiter,BBMRp,GasRp,Komisi:Integer;
    TotalRits,TotalRitsRp,TotalDrops,TotalDropsRp,TotalBBMRp,TotalBBMLiter,TotalGasRp,TotalGasLiter:Integer;
    TotalTotal1,TotalArgoKotor,TotalArgoBersih,TotalKS,TotalCicilanKS,TotalOperasi,TotalTabungan,TotalKomisi:Integer;
    TotalServiceFee,TotalReimburseToll,TotalDenda,TotalSubsidiBBM,TotalParkir,TotalDiterimaPers,TotalJaminan,TotalSeragam,TotalOR:Integer;
    DendaArgo,TotalDendaArgo,TotalCicilanPK,CicilanPK,TotalInsRBBM,TotalInsArgo:Integer;
begin
  TotalOperasi:=0;
  
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

  Main.M_Busy;

  StrQry:='EXEC GetRevenueVhcDayCancelRpt '+StrLokasi+','+
        Chr(39)+FormatDateTime('dd-mm-yyyy',Tanggal.Date)+Chr(39)+','+
        Chr(39)+StrBatch+Chr(39)+',@CompanyId=3;';
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
    if Qry.FieldValues['vhc_trans_id']<>NULL then StrGrid.Cells[0,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[1,Count]:=IntToStr(Count);
    StrGrid.Cells[2,Count]:=Qry.FieldValues['location'];
    StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
    StrGrid.Cells[5,Count]:=Qry.FieldValues['schedule_name']; {batangan}
    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      StrGrid.Cells[6,Count]:=Qry.FieldValues['employee_id'];
      StrGrid.Cells[7,Count]:=Qry.FieldValues['name'];
      StrGrid.Cells[8,Count]:=Qry.FieldValues['update_user'];
      StrGrid.Cells[9,Count]:=Qry.FieldValues['update_time'];
      StrGrid.CellStyle[4,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[6,Count].HorizontalAlignment:=taCenter;
      if Qry.FieldValues['out_time']<>NULL then StrGrid.Cells[4,Count]:=Qry.FieldValues['out_time'];
      {
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
            ' OR (a.transaction_type_id=110207) OR (a.transaction_type_id=110209) OR (a.transaction_type_id=110212) ) ;';
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
      if Qry.FieldValues['reguler']=0 then begin
        StrGrid.Cells[41,Count]:=IToCurr(((Total4+ArgoKotor+Total1)-(BBMRp+GasRp))-Komisi-Total3-Total5-Total6);
      end else begin
        StrGrid.Cells[41,Count]:=IToCurr((Total4+ArgoKotor+Total1)-Komisi-Total3-Total5-Total6);
      end;
      }
    end;
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  StrGrid.RowCount:=StrGrid.RowCount+1;
  for Count:=0 to 33 do StrGrid.Cells[Count,StrGrid.RowCount-1]:='';
//  for Count:=5 to 32 do StrGrid.CellStyle[Count,StrGrid.RowCount-1].BGColor:=clBlue;

  //StrGrid.Cells[9,StrGrid.RowCount-1]:='Total';

  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  //StrGrid.CellStyle[9,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.ColWidths[0]:=0;
  Main.M_Normal;
end;

procedure TRevenueVhcDayCancelRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TRevenueVhcDayCancelRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRevenueVhcDayCancelRpt.RefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TRevenueVhcDayCancelRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TRevenueVhcDayCancelRpt.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TRevenueVhcDayCancelRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TRevenueVhcDayCancelRpt.BatchChange(Sender: TObject);
begin
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TRevenueVhcDayCancelRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TRevenueVhcDayCancelRpt.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) then begin
    DepositForm:=TDepositForm.Create(Self);
    DepositForm.Reprint(StrGrid.Cells[0,IntRow]);
    DepositForm.Close;
  end;
end;

end.
