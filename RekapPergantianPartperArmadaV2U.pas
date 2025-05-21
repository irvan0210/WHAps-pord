unit RekapPergantianPartperArmadaV2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, ADODB, WHUnit;

type
  TRekapPergantianPartperArmadaV2 = class(TForm)
    ToXCel: TSpeedButton;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Button1: TButton;
    Button3: TButton;
    Bersihkan: TButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Batch: TComboBox;
    Label3: TLabel;
    Seat: TComboBox;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    procedure BatchChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
  private
    { Private declarations }
    MinRowGrid:Integer;
    RekapArr:Array of TArrString11;
    CompanyArr:Array of TArrString7;
    BatchArr,SeatArr:Array of TArrString2;
    FormRequest,KMOdoSekarang,ApiTransTrack,StatusApiTransTrack: String;
    procedure RefreshCombo;
    procedure RefreshSeat;
    procedure RefreshGrid;
    procedure InitGrid;
    procedure Init;
  public
    { Public declarations }
  end;

var
  RekapPergantianPartperArmadaV2: TRekapPergantianPartperArmadaV2;

implementation

uses MainU, PartU;

{$R *.dfm}

procedure TRekapPergantianPartperArmadaV2.Init;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  if Main.OpenDb then begin
    StrQry:='select * FROM wh_api_trans_track;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      ApiTransTrack:=Qry.FieldValues['api_trans_track'];
      StatusApiTransTrack:=Qry.FieldValues['status'];
    end;
    Qry.Close
  end;
  Main.CloseDb;

end;

procedure TRekapPergantianPartperArmadaV2.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    isFound:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;

//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='';
    BatchArr[0][1]:='';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('');

  Main.M_Normal;
end;

procedure TRekapPergantianPartperArmadaV2.RefreshSeat;
var QStr,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('');
  Main.M_Normal;
end;

procedure TRekapPergantianPartperArmadaV2.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TRekapPergantianPartperArmadaV2.Button1Click(Sender: TObject);
begin
  if (Seat.Text='') OR (Batch.Text='') then
  begin
    MessageBox(0,PChar('Lengkapi data..!'),'Rekap History Armada Pergantian Part V2',MB_OK or MB_ICONERROR);
  end else
  begin
    RefreshGrid;
  end;
end;

procedure TRekapPergantianPartperArmadaV2.RefreshGrid;
var
StrLocationId,StrCompanyId,StrBatchId,StrSeat,StrCategorized,StrTanggal,StrQry:string;
Qry,Qry2,Qry3:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  StrCompanyId:=',@CompanyId='+CompanyArr[SBU.ItemIndex][1];
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
  StrSeat:=',@Seat='+Seat.Text;
  StrCategorized:=',@OrderBy='+QuotedStr('category, category_sequence_number,h.vhc_batch_id,seat,license_plate');
  StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Now()));
  StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+StrCategorized+StrTanggal+';';
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
end;

procedure TRekapPergantianPartperArmadaV2.BersihkanClick(Sender: TObject);
var IntCount,IntCount2:Integer;
begin
  for IntCount:=3 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  StrGrid.RowCount:=4;
  RefreshCombo;
end;

procedure TRekapPergantianPartperArmadaV2.InitGrid;
var IntCount:Integer;
    Qry:TADOQuery;
    StrQry,UpdateTimeGetOdo:string;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select TOP 1 FORMAT(update_time, ''dd-MM-yy hh:mm'') update_time2 FROM wh_log_get_odo Order By update_time DESC;';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      UpdateTimeGetOdo:= Qry.FieldValues['update_time2'];
    end;
    Qry.Close
  end;
  Main.CloseDb;

  MinRowGrid:=2;
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=11;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=350;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama Part';
  StrGrid.Cells[2,0]:=Batch.Text+' '+Seat.Text;
  StrGrid.Cells[2,1]:='Pergantian Terakhir';
  StrGrid.Cells[2,2]:='Tanggal';
  StrGrid.Cells[3,2]:='KM';
  StrGrid.Cells[4,1]:='KM';
  StrGrid.Cells[4,2]:='KM/Hari';
  StrGrid.Cells[5,2]:='KM Standard';
  StrGrid.Cells[6,1]:='Estimasi Pergantian';
  StrGrid.Cells[6,2]:='KM Estimasi';
  StrGrid.Cells[7,2]:='Tanggal Estimasi';
  StrGrid.Cells[8,1]:='Update Terakhir '+ UpdateTimeGetOdo;
  StrGrid.Cells[8,2]:='KM Sekarang';
  StrGrid.Cells[9,2]:='KM Pencapaian';

  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,1,2);

  StrGrid.MergeCells.AddRectXY(2,0,9,0);
  StrGrid.MergeCells.AddRectXY(2,1,3,1);
  StrGrid.MergeCells.AddRectXY(4,1,5,1);
  StrGrid.MergeCells.AddRectXY(6,1,7,1);
  StrGrid.MergeCells.AddRectXY(8,1,9,1);



  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[2,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,2].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,4]:='';
end;

procedure TRekapPergantianPartperArmadaV2.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TRekapPergantianPartperArmadaV2.SelesaiClick(Sender: TObject);
begin
  Close;
end;

end.
