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
    Lihat: TButton;
    PilihPart: TButton;
    Bersihkan: TButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Batch: TComboBox;
    Label3: TLabel;
    Seat: TComboBox;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    GroupBox1: TGroupBox;
    StrGridTemp: TZColorStringGrid;
    Selesai: TButton;
    BersihkanPart: TButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    TotalTemp: TEdit;
    procedure BatchChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PilihPartClick(Sender: TObject);
    procedure InitGridTemp;
    procedure StrGridTempKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StrGridTempSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    MinRowGrid, MinRowGridTemp,IntRowTemp,IntColTemp:Integer;
    VehicleArr:Array of TArrString9;
    RekapArr:Array of TArrString11;
    DailyArr:array of TArrString31;
    CompanyArr:Array of TArrString7;
    BatchArr,SeatArr:Array of TArrString2;
    FormRequest,KMOdoSekarang,ApiTransTrack,StatusApiTransTrack: String;
    procedure RefreshCombo;
    procedure RefreshSeat;
    procedure RefreshGrid;
    procedure InitGrid;
    procedure Init;
   // procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
  public
    { Public declarations }
  end;

var
  RekapPergantianPartperArmadaV2: TRekapPergantianPartperArmadaV2;
  StrVehicleIDRekapPergantianPart : string;

implementation

uses MainU, PartU, ListPartsU, BrowsePartU;

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

procedure TRekapPergantianPartperArmadaV2.LihatClick(Sender: TObject);
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
StrLocationId,StrCompanyId,StrBatchId,StrBatchName,StrSeat,StrCategorized,StrTanggal,StrQry:string;
Qry,Qry2,Qry3:TADOQuery;
IntCountVhc, IntCountVhc2, IntCount, IntCount4,IntJmlUnit : Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;

  For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
    for IntCountVhc2:=0 to 12 do
    StrGrid.Cells[IntCountVhc2,IntCountVhc+1]:='';
  end;
  SetLength(VehicleArr,0);
  StrBatchName:='';
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

  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(VehicleArr,IntCountVhc+1);
      VehicleArr[IntCountVhc][0]:=Qry.FieldValues['vehicle_id'];
      VehicleArr[IntCountVhc][1]:=Qry.FieldValues['batch_name'];
      VehicleArr[IntCountVhc][2]:=IntToStr(Qry.FieldValues['seat']);
      VehicleArr[IntCountVhc][3]:=VarToStr(Qry.FieldValues['name']);
      VehicleArr[IntCountVhc][4]:=Qry.FieldValues['body_id'];
      VehicleArr[IntCountVhc][5]:=Qry.FieldValues['license_plate'];
      VehicleArr[IntCountVhc][6]:=Qry.FieldValues['is_facelift'];
      VehicleArr[IntCountVhc][7]:=VarToStr(Qry.FieldValues['busboy_name']);
      VehicleArr[IntCountVhc][8]:=Qry.FieldValues['is_safetybelt'];
      Qry.Next;
      Inc(IntCountVhc);
  end;
  Qry.Close;

  IntCount:=1;
  IntCount4:=1;
  IntJmlUnit:=0;


  For IntCountVhc:=0 to Length(VehicleArr)-1 do begin
   { try
      ProgressBar.Position:=10+Round((90/Length(VehicleArr))*IntCount4);
    except on Exception do
      ProgressBar.Position := 0;
    end;}
    Application.ProcessMessages;
    SetLength(DailyArr,Length(DailyArr)+1);


    if StrBatchName<>VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2] then begin
   { if StrBatchName<>'' then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount2:=3+IntGsrKlm to Days+2 do begin
        StrGrid.Cells[IntCount2,IntCount]:='';
        StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
      end;
      StrGrid.CellStyle[2,IntCount].BGColor:=clSilver;
      for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2+IntGsrKlm,IntCount]:=IntToStr(IntCategory[IntCount2]);

      (*Tambah*)
      Inc(IntCount);
      StrGrid.RowCount:=StrGrid.RowCount+1;

      for IntCount2:=0 to Days+6 do StrGrid.Cells[IntCount2,StrGrid.RowCount-1]:='';
      StrGrid.Cells[2, IntCount]:=' Persen Jalan PerHari (%)';

      for IntCount2:=3+IntGsrKlm to Days+2 do begin
        StrGrid.Cells[IntCount2,IntCount]:='';
      end;
      IntTotalAllSub:=0;
      IntAvgSub:=0;
      for IntCount2:=1 to Days do begin
        //IntToStr(Round((IntUsage[IntCount]/IntTotal)*100))
        StrGrid.Cells[IntCount2+2+IntGsrKlm, IntCount]:=IntToStr(Round((IntCategory[IntCount2]/IntJmlUnit)*100));
        if (Round((IntCategory[IntCount2]/IntJmlUnit)*100) > 0) then Inc(IntAvgSub);
        IntTotalAllSub := IntTotalAllSub + Round((IntCategory[IntCount2]/IntJmlUnit)*100);
      end;

      StrGrid.CellStyle[Days+6+IntGsrKlm, IntCount].HorizontalAlignment:=taCenter;
      if IntTotalAllSub>0 then StrGrid.Cells[Days+6+IntGsrKlm, IntCount]:=IntToStr(Round(IntTotalAllSub/IntAvgSub))+' %';

      SetLength(DailyArr,Length(DailyArr)+1);
      (*end tambah*)

      for IntCount2:=1 to 31 do IntCategory[IntCount2]:=0;
      SetLength(DailyArr,Length(DailyArr)+1);
      Inc(IntCount);
    end;   }
      StrBatchName:=VehicleArr[IntCountVhc][1]+' '+VehicleArr[IntCountVhc][2];
    {Cek}
   { for IntCount2:=0 to Days+3 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
      //Application.ProcessMessages;
    end; }
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.CellStyle[2,IntCount].BGColor:=clSkyBlue;
    StrGrid.CellStyle[2,IntCount].Font.Color:=clWindowText;
    StrGrid.CellStyle[2,IntCount].Font.Style:=[fsBold];
    StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount].BGColor:=clSkyBlue;
    //StrGrid.MergeCells.AddRectXY(3+IntGsrKlm,IntCount,Days+6+IntGsrKlm,IntCount);
    //StrGrid.MergeCells.AddRectXY(2,IntCount,3,IntCount);
    StrGrid.Cells[2,IntCount]:=StrBatchName;
    Inc(IntCount);
    SetLength(RekapArr,Length(RekapArr)+1);

    IntJmlUnit := 0;

    FreeAndNil(Qry);
    Main.CloseDb;
    Application.ProcessMessages;
    end;
  end;
end;

procedure TRekapPergantianPartperArmadaV2.BersihkanClick(Sender: TObject);
var IntCount,IntCount2:Integer;
begin
  InitGridTemp;
{  for IntCount:=3 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  StrGrid.RowCount:=4;
  RefreshCombo; }
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
  StrGrid.ColWidths[1]:=325;
  StrGrid.ColWidths[2]:=75;
  StrGrid.ColWidths[3]:=75;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=80;
  StrGrid.ColWidths[9]:=90;
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
  InitGridTemp;
  RefreshCombo;
end;

procedure TRekapPergantianPartperArmadaV2.PilihPartClick(Sender: TObject);
begin
  if (Seat.Text='') OR (Batch.Text='') then begin
    MessageBox(0,PChar('Lengkapi data..!'),'Rekap History Armada Pergantian Part V2',MB_OK or MB_ICONWARNING);
  end else begin
    if Main.IsFormOpen('ListPart')=False then
      begin
        //BrowsePartVehicleId:=StrVehicleIDRekapPergantianPart;
        ListParts:=TListParts.Create(Self,'REKAPPERGANTIANPARTPERARMADA-V2');
      end;
  end;
end;


procedure TRekapPergantianPartperArmadaV2.InitGridTemp;
var IntCount:Integer;
begin
  MinRowGridTemp:=1;
  //IntRowTemp:=0;
  //IntColTemp:=0;
  StrGridTemp.RowCount:=1;
  StrGridTemp.ColWidths[0]:=190;

  StrGridTemp.Cells[0,0]:='Nama';
  for IntCount:=0 to StrGridTemp.ColCount-1 do StrGridTemp.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGridTemp.ColCount-1 do
    StrGridTemp.Cells[IntCount,1]:='';
  TotalTemp.Text:= IntToStr(StrGridTemp.RowCount-1);
end;

procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;
end;


procedure TRekapPergantianPartperArmadaV2.StrGridTempKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
 var
  IntCount:Integer;
  StrNamaPart : string;
begin
  StrNamaPart := StrGridTemp.Cells[0,IntRowTemp];
  if IntRowTemp>0 then begin
    if Key=VK_DELETE then begin
      if MessageBox(Handle,PChar('Mau Menghapus '+QuotedStr(StrNamaPart)+' ?'),'Part Dipilih',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
       // for IntCount:=0 to StrGridTemp.ColCount-1  do
         // StrGridTemp.Cells[IntCount,IntRowTemp]:= '';
       DeleteRow(StrGridTemp,IntRowTemp);
       TotalTemp.Text:= IntToStr(StrGridTemp.RowCount-1);
       MessageBox(0,PChar('Part berhasil dihapus.'),'Part Dipilih',MB_OK or MB_ICONINFORMATION);
      end;
    end;
  end;
end;


procedure TRekapPergantianPartperArmadaV2.StrGridTempSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRowTemp:=ARow;
  IntColTemp:=ACol;
end;

procedure TRekapPergantianPartperArmadaV2.SelesaiClick(Sender: TObject);
begin
Close;
end;

procedure TRekapPergantianPartperArmadaV2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

end.
