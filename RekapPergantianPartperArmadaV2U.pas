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
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    TypeKendaraan: TComboBox;
    Simpan: TButton;
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
    procedure SpeedButton2Click(Sender: TObject);
    procedure SeatChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure TypeKendaraanChange(Sender: TObject);
  private
    { Private declarations }
    MinRowGrid, MinRowGridTemp,IntRowTemp,IntColTemp:Integer;
    VehicleArr:Array of TArrString9;
    RekapArr:Array of TArrString11;
    DailyArr:array of TArrString31;
    CompanyArr:Array of TArrString7;
    BatchArr,SeatArr,TypeKendaraanArr:Array of TArrString2;
    FormRequest,KMOdoSekarang,ApiTransTrack,StatusApiTransTrack: String;
    procedure RefreshCombo;
    procedure RefreshSeat;
    procedure RefreshJenis;
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

uses MainU, PartU, ListPartsU, BrowsePartU, StrUtils;

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

procedure TRekapPergantianPartperArmadaV2.RefreshJenis;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrBatch:String;
    IntCount:Integer;
begin
  TypeKendaraan.Items.Clear;
  TypeKendaraan.Text:='';

  Main.M_Busy;
  if Batch.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrBatch:=BatchArr[Batch.ItemIndex][0];
      QStr:='SELECT b.vhc_type_detail_id,a.brand,a.type,b.seat FROM wh_vehicle_type a '+
            'LEFT JOIN wh_vhc_type_detail b ON (b.vehicle_type_id=a.vehicle_type_id) '+
            'WHERE b.active=1 AND  b.company_id='+StrCompanyId+' AND '+
            'a.vhc_batch_id='+StrBatch+' AND b.seat='+QuotedStr(Seat.Text)+' '+
            'GROUP BY b.vhc_type_detail_id,a.brand,a.type,b.seat ;';

      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(TypeKendaraanArr,IntCount+1);
        TypeKendaraanArr[IntCount][0]:=Qry.FieldValues['vhc_type_detail_id'];
        TypeKendaraanArr[IntCount][1]:=ToString(Qry.FieldValues['brand'])+' '+ToString(Qry.FieldValues['type']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;


    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(TypeKendaraanArr)-1 do
    TypeKendaraan.Items.Add(TypeKendaraanArr[IntCount][1]);

  Main.M_Normal;
end;

procedure TRekapPergantianPartperArmadaV2.BatchChange(Sender: TObject);
begin
  RefreshSeat;
  TypeKendaraan.Clear;
end;

procedure TRekapPergantianPartperArmadaV2.LihatClick(Sender: TObject);
begin
  if (Seat.Text='') OR (Batch.Text='') OR (StrGridTemp.RowCount=1) then
  begin
    MessageBox(0,PChar('Lengkapi data..!'),'Rekap History Armada Pergantian Part V2',MB_OK or MB_ICONERROR);
  end else
  begin
    RefreshGrid;
  end;
  if StrGrid.RowCount>4 then StrGrid.FixedRows:=3;
end;

procedure TRekapPergantianPartperArmadaV2.RefreshGrid;
var
StrPart,StrLocationId,StrCompanyId,StrBatchId,StrBatchName,StrSeat,StrVehicleID,StrKodePart,StrCategorized,StrTanggal,StrQry:string;
Qry,Qry2,Qry3:TADOQuery;
IntCountVhc, IntCountVhc2, IntCount, IntCount2,IntJmlUnit,IntTotal,Count : Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;

  StrGrid.Cells[1,0]:=Batch.Text+' '+Seat.Text+' Seat';


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
  SetLength(VehicleArr,Qry.RecordCount);
  IntCountVhc:=0;

  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VehicleArr[IntCountVhc][0]:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[IntCountVhc][1]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)+' - '+
                              ' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type']
      else
        VehicleArr[IntCountVhc][1]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1)+' - '+
                            ' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
      Qry.Next;
      Inc(IntCountVhc);
  end;
  Qry.Close;

  for IntCount:=0 to StrGrid.ColCount-1 do
  for IntCount2:=3 to StrGrid.RowCount-1 do begin
    IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
    if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
  for IntCount2:=3 to StrGrid.RowCount-1 do begin
    StrGrid.Cells[IntCount,IntCount2]:='';
    StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  Count:=StrGridTemp.RowCount-1;
  StrGrid.RowCount:=3;
  StrVehicleID:='';

  for IntCount:=0 to Length(VehicleArr)-1  do
  begin
    StrGrid.RowCount:=StrGrid.RowCount+1;
    StrGrid.Cells[0,StrGrid.RowCount-1]:=VehicleArr[IntCount][1];
    StrGrid.MergeCells.AddRectXY(1,StrGrid.RowCount-1,8,StrGrid.RowCount-1);


    StrVehicleID:= VehicleArr[IntCount][0];
    StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[0,StrGrid.RowCount-1].BGColor:=clSkyBlue;
//    StrGrid.CellStyle[0,StrGrid.RowCount-1].Font.Style:=[fsBold];



    for IntCount2:=1 to StrGridTemp.RowCount-1 do
    begin
      StrGrid.RowCount:=StrGrid.RowCount+1;

      StrGrid.Cells[0,StrGrid.RowCount-1]:=StrGridTemp.Cells[0,IntCount2];
      StrPart:= StrGrid.Cells[0,StrGrid.RowCount-1];
      if StrGrid.Cells[0,StrGrid.RowCount-1]<>'' then
      begin
        StrKodePart:=StrGridTemp.Cells[1,IntCount2];
        StrQry:='EXEC GetRekapPergantianPartPerArmada @KodePartGP='+QuotedStr(StrKodePart)+',@VehicleID='+QuotedStr(StrVehicleID);
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['tgl_terakhir_ganti']<>NULL then
            StrGrid.Cells[1,StrGrid.RowCount-1]:= Qry.FieldValues['tgl_terakhir_ganti']
          else
            StrGrid.Cells[1,StrGrid.RowCount-1]:='';
          if Qry.FieldValues['km_terakhir_ganti']<>NULL then
            StrGrid.Cells[2,StrGrid.RowCount-1]:= SToCurr(Qry.FieldValues['km_terakhir_ganti'])
          else
            StrGrid.Cells[2,StrGrid.RowCount-1]:='';
          StrGrid.Cells[3,StrGrid.RowCount-1]:= Qry.FieldValues['km_hari'];
          if Qry.FieldValues['standard_km_replacement']<>NULL then
            StrGrid.Cells[4,StrGrid.RowCount-1]:= SToCurr(Qry.FieldValues['standard_km_replacement'])
          else
            StrGrid.Cells[4,StrGrid.RowCount-1]:='';
          if Qry.FieldValues['km_estimasi']<>NULL then
            StrGrid.Cells[5,StrGrid.RowCount-1]:= SToCurr(Qry.FieldValues['km_estimasi'])
          else
            StrGrid.Cells[5,StrGrid.RowCount-1]:='';
          if Qry.FieldValues['tgl_estimasi_ganti']<>NULL then
            StrGrid.Cells[6,StrGrid.RowCount-1]:= Qry.FieldValues['tgl_estimasi_ganti']
          else
            StrGrid.Cells[6,StrGrid.RowCount-1]:='';
          if Qry.FieldValues['odo_update_gps']<>NULL then
            StrGrid.Cells[7,StrGrid.RowCount-1]:= SToCurr(Qry.FieldValues['odo_update_gps'])
          else
            StrGrid.Cells[7,StrGrid.RowCount-1]:='';
          if (Qry.FieldValues['odo_update_gps']<>NULL) and (Qry.FieldValues['km_estimasi']<>NULL) then
            StrGrid.Cells[8,StrGrid.RowCount-1]:= SToCurr(Qry.FieldValues['odo_update_gps']-Qry.FieldValues['km_estimasi'])
          else
            StrGrid.Cells[8,StrGrid.RowCount-1]:='';
            StrGrid.CellStyle[1,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[4,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[5,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[6,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[7,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[8,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;

            if StrGrid.Cells[8,StrGrid.RowCount-1]<>'' then
            begin
              if LeftStr(StrGrid.Cells[8,StrGrid.RowCount-1],1)<>'-' then
              begin
                StrGrid.CellStyle[8,StrGrid.RowCount-1].Font.Color:=clRed;
              end;
            end;

        end;
      end;
    end;
    if StrGrid.Cells[0,StrGrid.RowCount-1]='' then
    StrGrid.RowCount:=StrGrid.RowCount-1;

  end;


//  FreeAndNil(Qry);
  Main.CloseDb;
  Application.ProcessMessages;
  Main.M_Normal;
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

  MinRowGrid:=4;
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=9;
  StrGrid.ColWidths[0]:=325;
  StrGrid.ColWidths[1]:=75;
  StrGrid.ColWidths[2]:=75;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=90;

  StrGrid.Cells[0,0]:='Nama Part';
  StrGrid.Cells[1,0]:=Batch.Text+' '+Seat.Text;
  StrGrid.Cells[1,1]:='Pergantian Terakhir';
  StrGrid.Cells[1,2]:='Tanggal';
  StrGrid.Cells[2,2]:='KM';
  StrGrid.Cells[3,1]:='KM';
  StrGrid.Cells[3,2]:='KM/Hari';
  StrGrid.Cells[4,2]:='KM Standard';
  StrGrid.Cells[5,1]:='Estimasi Pergantian';
  StrGrid.Cells[5,2]:='KM Estimasi';
  StrGrid.Cells[6,2]:='Tanggal Estimasi';
  StrGrid.Cells[7,1]:='Update Terakhir '+ UpdateTimeGetOdo;
  StrGrid.Cells[7,2]:='KM Sekarang';
  StrGrid.Cells[8,2]:='KM Pencapaian';

  StrGrid.MergeCells.AddRectXY(0,0,0,2); //Nama part
  StrGrid.MergeCells.AddRectXY(1,0,8,0); //Batch
  StrGrid.MergeCells.AddRectXY(1,1,2,1); //Pergantian Terakhir
  StrGrid.MergeCells.AddRectXY(3,1,4,1); //KM
  StrGrid.MergeCells.AddRectXY(5,1,6,1); //Estimasi Pergantian
  StrGrid.MergeCells.AddRectXY(7,1,8,1); //Update Terakhir

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[1,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[1,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taCenter;
//  for IntCount:=0 to StrGrid.ColCount-1 do
//    StrGrid.Cells[IntCount,4]:='';
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
  StrGridTemp.ColWidths[1]:=0;

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
  IntCount,i:Integer;
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

procedure TRekapPergantianPartperArmadaV2.SpeedButton2Click(
  Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TRekapPergantianPartperArmadaV2.SeatChange(Sender: TObject);
begin
  RefreshJenis;
end;

procedure TRekapPergantianPartperArmadaV2.SimpanClick(Sender: TObject);
var
  Qry:TADOQuery;
  StrQry:String;
  IntCount:Integer;
  IsOk:Boolean;
begin

  if (StrGridTemp.RowCount>1) AND (TypeKendaraan.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='DELETE FROM wh_part_type_vehicle where '+
              'vhc_type_detail_id='+QuotedStr(TypeKendaraanArr[TypeKendaraan.ItemIndex][0])+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
          on E:Exception do IsOk:=False;
      end;
      
      for IntCount:=1 to StrGridTemp.RowCount-1 do
      begin

        StrQry:='INSERT INTO wh_part_type_vehicle (kode_part_gp,vhc_type_detail_id,update_user)'+
              'VALUES ('+QuotedStr(StrGridTemp.Cells[1,IntCount])+','+
              ''+QuotedStr(TypeKendaraanArr[TypeKendaraan.ItemIndex][0])+' '+
              ','+QuotedStr(User)+');';

        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do IsOk:=False;
        end;

      end;

      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Update Part Dipilih',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,'Gagal disimpan','Update Part Dipilih',MB_OK or MB_ICONWARNING);
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end else
  begin
    MessageBox(0,'Silahkan lengkapi kolom!!','Update Part Dipilih',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TRekapPergantianPartperArmadaV2.TypeKendaraanChange(
  Sender: TObject);
var
  Qry:TADOQuery;
  StrQry:String;
  IntCount:Integer;
  IsOk:Boolean;
begin
  if (TypeKendaraan.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT a.part_type_id,a.kode_part_gp,b.name FROM wh_part_type_vehicle a '+
              'LEFT JOIN wh_part b ON a.kode_part_gp=b.kode_part_gp '+
              'WHERE vhc_type_detail_id='+QuotedStr(TypeKendaraanArr[TypeKendaraan.ItemIndex][0])+' ORDER BY a.part_type_id ASC;';

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=1;
      InitGridTemp;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        StrGridTemp.Cells[0,IntCount]:=Qry.FieldValues['name'];
        StrGridTemp.Cells[1,IntCount]:=Qry.FieldValues['kode_part_gp'];
        StrGridTemp.RowCount:=StrGridTemp.RowCount+1;
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
      TotalTemp.Text:= IntToStr(StrGridTemp.RowCount-1);
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;

end;

end.
