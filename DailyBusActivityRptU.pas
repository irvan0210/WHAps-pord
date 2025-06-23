unit DailyBusActivityRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ExtCtrls,
  ComCtrls, Menus,ClipBrd;

type
  TDailyBusActivityRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Selesai: TButton;
    Batch: TComboBox;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    Label5: TLabel;
    Seat: TComboBox;
    Tanggal: TDateTimePicker;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    Total: TEdit;
    Label2: TLabel;
    JenisAktifitas: TComboBox;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Copy1Click(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,BatchArr,SeatArr:Array of TArrString2;
    DataArr:Array of TArrString25;
    CompanyArr:Array of TArrString7;
    Days,IntColumnWidth,IntRow,IntCol,MinRowGrid,MinColGrid:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshSeat;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  DailyBusActivityRpt: TDailyBusActivityRpt;

implementation

uses MainU, DateUtils, ADODB, OrderFormU, SelectBookingU;

{$R *.dfm}

constructor TDailyBusActivityRpt.Create(AOwner:TComponent);
begin
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TDailyBusActivityRpt.Init;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  MinColGrid:=3;
  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=95;
  Tanggal.Date:=Now();
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Batch.Text:='';
  Batch.Items.Clear;
  Batch.ItemIndex:=1;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;


procedure TDailyBusActivityRpt.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=23;

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=60;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=35;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=90;

  StrGrid.ColWidths[6]:=130;
  StrGrid.ColWidths[7]:=90;

  StrGrid.ColWidths[8]:=70;
  StrGrid.ColWidths[9]:=90;

  StrGrid.ColWidths[10]:=65;
  StrGrid.ColWidths[11]:=30;
  StrGrid.ColWidths[12]:=130;
  StrGrid.ColWidths[13]:=90;
  StrGrid.ColWidths[14]:=130;
  StrGrid.ColWidths[15]:=90;
  StrGrid.ColWidths[16]:=130;
  StrGrid.ColWidths[17]:=90;
  StrGrid.ColWidths[18]:=150;
  StrGrid.ColWidths[19]:=170;
  StrGrid.ColWidths[20]:=220;
  StrGrid.ColWidths[21]:=220;
  StrGrid.ColWidths[22]:=150;
  //col 14 = customer_order_id
  StrGrid.RowHeights[0]:=20;
  StrGrid.RowHeights[1]:=20;


  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,7,0);
  StrGrid.MergeCells.AddRectXY(1,1,1,2);
  StrGrid.MergeCells.AddRectXY(2,1,2,2);
  StrGrid.MergeCells.AddRectXY(3,1,3,2);
  StrGrid.MergeCells.AddRectXY(4,1,5,1);
  StrGrid.MergeCells.AddRectXY(6,1,7,1);

  StrGrid.MergeCells.AddRectXY(8,0,8,2);
  StrGrid.MergeCells.AddRectXY(9,0,9,2);

  StrGrid.MergeCells.AddRectXY(10,0,17,0);
  StrGrid.MergeCells.AddRectXY(10,1,10,2);
  StrGrid.MergeCells.AddRectXY(11,1,11,2);
  StrGrid.MergeCells.AddRectXY(12,1,13,1);
  StrGrid.MergeCells.AddRectXY(14,1,15,1);
  StrGrid.MergeCells.AddRectXY(16,1,17,1);

  StrGrid.MergeCells.AddRectXY(18,0,22,0);
  StrGrid.MergeCells.AddRectXY(18,1,18,2);
  StrGrid.MergeCells.AddRectXY(19,1,19,2);
  StrGrid.MergeCells.AddRectXY(20,1,20,2);
  StrGrid.MergeCells.AddRectXY(21,1,21,2);
  StrGrid.MergeCells.AddRectXY(22,1,22,2);

  StrGrid.WordWrap:=True;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='BATANGAN';
  StrGrid.Cells[1,1]:='No Body';
  StrGrid.Cells[2,1]:='No Polisi';
  StrGrid.Cells[3,1]:='Seat';
  StrGrid.Cells[4,1]:='Pengemudi';
  StrGrid.Cells[4,2]:='Nama';
  StrGrid.Cells[5,2]:='No Handphone';
  StrGrid.Cells[6,1]:='Kenek';
  StrGrid.Cells[6,2]:='Nama';
  StrGrid.Cells[7,2]:='No Handphone';

  StrGrid.Cells[8,0]:='Jenis Aktifitas';
  StrGrid.Cells[9,0]:='No Aktifitas';
  StrGrid.Cells[10,0]:='PENJADWALAN';
  StrGrid.Cells[10,1]:='Berangkat';
  StrGrid.Cells[11,1]:='Jam';
  StrGrid.Cells[12,1]:='Pengemudi';
  StrGrid.Cells[12,2]:='Nama';
  StrGrid.Cells[13,2]:='No Handphone';
  StrGrid.Cells[14,1]:='Kenek';
  StrGrid.Cells[14,2]:='Nama';
  StrGrid.Cells[15,2]:='No Handphone';
  StrGrid.Cells[16,1]:='Pengemudi 2';
  StrGrid.Cells[16,2]:='Nama';
  StrGrid.Cells[17,2]:='No Handphone';

  StrGrid.Cells[18,0]:='PEMESANAN';
  StrGrid.Cells[18,1]:='Tanggal';
  StrGrid.Cells[19,1]:='Pemakai/Group';
  StrGrid.Cells[20,1]:='Lokasi Standby';
  StrGrid.Cells[21,1]:='Rute';
  StrGrid.Cells[22,1]:='Keterangan';

 // StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,2].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[19,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[20,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[21,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[22,1].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TDailyBusActivityRpt.RefreshCombo;
var StrQry,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
{    QStr:='EXEC GetLocation 2,1';
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
}
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
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
      Inc(IntCount)
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;              
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];

    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
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
{  for IntCount:=0 to Length(LokasiArr)-1 do Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
}
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
 // Batch.ItemIndex:=-1;
  Main.M_Normal;
end;

procedure TDailyBusActivityRpt.RefreshSeat;
var StrQry,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    StrQry:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
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
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TDailyBusActivityRpt.RefreshData;
var StrQry,StrBodyId,StrLicensePlate,StrCompanyId,StrSeat,StrCategorized,StrTanggal,
    StrLocationId,StrToDates,StrOrder,StrBatch, StrBatchId,StrVehicleID, StrAktifitas:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3, IntCountVhc:Integer;
    IntUsage:Array[1..31] of Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(DataArr,0);
    StrCompanyId:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';

    if (Seat.Text ='All') or (Seat.Text ='') then begin
      StrSeat:='';
    end else StrSeat:=',@Seat='+Seat.Text;

   // if JenisAktifitas.Text<>'All' then begin
      StrAktifitas:=',@Aktifitas='+QuotedStr(JenisAktifitas.Text);
    //end else StrAktifitas:='';

    StrCategorized:=',@OrderBy='+QuotedStr('category, category_sequence_number,h.vhc_batch_id,seat,license_plate');

    StrTanggal:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime(Tanggal.Date)));
    //StrQry:='EXEC GetVhcList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat+StrCategorized+StrTanggal+';';
    StrQry:='EXEC GetActivityList '+StrCompanyId+StrLocationId+StrTanggal+StrBatchId+StrSeat+StrAktifitas+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCountVhc:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SetLength(DataArr,IntCountVhc+1);

      StrBodyId:=Qry.FieldValues['body_id'];
      if Length(StrBodyId)<5 then StrBodyId:=StrBodyId;
      if Qry.FieldValues['license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        DataArr[IntCountVhc][1]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          DataArr[IntCountVhc][1]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

      DataArr[IntCountVhc,0]:=StrBodyId;
     // DataArr[IntCountVhc,1]:=StrLicensePlate;
      DataArr[IntCountVhc,2]:=Qry.FieldValues['seat'];
      if Qry.FieldValues['driver_batangan']<>NULL then
      DataArr[IntCountVhc,3]:=Qry.FieldValues['driver_batangan'];
      if Qry.FieldValues['cellular_no_driver_batangan']<>NULL then
      DataArr[IntCountVhc,4]:=Qry.FieldValues['cellular_no_driver_batangan'];
      if Qry.FieldValues['helper_batangan']<>NULL then
      DataArr[IntCountVhc,5]:=Qry.FieldValues['helper_batangan'];
      if Qry.FieldValues['cellular_no_helper_batangan']<>NULL then
      DataArr[IntCountVhc,6]:=Qry.FieldValues['cellular_no_helper_batangan'];

      if Qry.FieldValues['jenis_aktivitas']<>NULL then
      DataArr[IntCountVhc,7]:=Qry.FieldValues['jenis_aktivitas'];
      DataArr[IntCountVhc,8]:=Qry.FieldValues['no_aktivitas'];
      if Qry.FieldValues['from_date']<>NULL then
      DataArr[IntCountVhc,9]:=Qry.FieldValues['from_date'];
      DataArr[IntCountVhc,10]:=Qry.FieldValues['standby_time'];
      DataArr[IntCountVhc,11]:=Qry.FieldValues['driver1'];
      DataArr[IntCountVhc,12]:=Qry.FieldValues['phone_driver'];
      if Qry.FieldValues['helper']<>NULL then
      DataArr[IntCountVhc,13]:=Qry.FieldValues['helper'];
      if Qry.FieldValues['phone_helper']<>NULL then
      DataArr[IntCountVhc,14]:=Qry.FieldValues['phone_helper'];
      if Qry.FieldValues['driver2']<>NULL then
      DataArr[IntCountVhc,15]:=Qry.FieldValues['driver2'];
      if Qry.FieldValues['phone_driver2']<>NULL then
      DataArr[IntCountVhc,16]:=Qry.FieldValues['phone_driver2'];
      if Qry.FieldValues['tanggal']<>NULL then
      DataArr[IntCountVhc,17]:=Qry.FieldValues['tanggal'];
      DataArr[IntCountVhc,18]:=Qry.FieldValues['customer_name'];
      DataArr[IntCountVhc,19]:=Qry.FieldValues['pickup_point'];
      DataArr[IntCountVhc,20]:=Qry.FieldValues['route'];
      DataArr[IntCountVhc,21]:=Qry.FieldValues['remark'];
      DataArr[IntCountVhc,22]:=Qry.FieldValues['batch_name']+' '+IntToStr(Qry.FieldValues['seat']);
      if Qry.FieldValues['status_aktivitas']<>NULL then
      DataArr[IntCountVhc,23]:=Qry.FieldValues['status_aktivitas'];

      Inc(IntCountVhc);
      Qry.Next;
    end;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TDailyBusActivityRpt.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntStartRow2,IntTotal,Count2:Integer;
    StrBodyId,StrPlate:String;
    IsDrawRect:Boolean;
begin
  Total.Text:='0';
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    for IntCount2:=3 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].BGColor:=clWindow;
    end;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    for IntCount2:=3 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  end;
  if Length(DataArr)>0 then StrGrid.RowCount:=Length(DataArr)+3 else StrGrid.RowCount:=4;
  if Length(DataArr)>0 then begin
    IntCount2:=0;
    StrPlate:='';
    for IntCount:=0 to Length(DataArr)-1 do begin
      if (StrPlate<>DataArr[IntCount][1])  then begin
        IntCount2:=IntCount2+1;
        StrPlate:=DataArr[IntCount][1];
        IntStartRow:=IntCount;
        IntStartRow2:=IntCount;
//        if DataArr[IntCount][22]<>StrGrid.Cells[0,IntCount+4-1] then
//        StrGrid.Cells[0,IntCount+3]:=DataArr[IntCount][22];

        StrGrid.Cells[0,IntCount+3]:=IntToStr(IntCount2);
        StrGrid.Cells[1,IntCount+3]:=DataArr[IntCount][0];
        StrGrid.Cells[2,IntCount+3]:=DataArr[IntCount][1];
        StrGrid.Cells[3,IntCount+3]:=DataArr[IntCount][2];
        StrGrid.Cells[4,IntCount+3]:=DataArr[IntCount][3];
        StrGrid.Cells[5,IntCount+3]:=DataArr[IntCount][4];
        StrGrid.Cells[6,IntCount+3]:=DataArr[IntCount][5];
        StrGrid.Cells[7,IntCount+3]:=DataArr[IntCount][6];
        IsDrawRect:=False;
      end else if (IntCount<Length(DataArr)-1) then begin
        if (StrPlate<>DataArr[IntCount+1][1]) then IsDrawRect:=True;
      end else IsDrawRect:=True;

      if IsDrawRect=True then begin
        StrGrid.MergeCells.AddRectXY(0,IntStartRow+3,0,IntCount+3);
        StrGrid.MergeCells.AddRectXY(1,IntStartRow+3,1,IntCount+3);
        StrGrid.MergeCells.AddRectXY(2,IntStartRow+3,2,IntCount+3);
        StrGrid.MergeCells.AddRectXY(3,IntStartRow+3,3,IntCount+3);
        StrGrid.MergeCells.AddRectXY(4,IntStartRow+3,4,IntCount+3);
        StrGrid.MergeCells.AddRectXY(5,IntStartRow+3,5,IntCount+3);
        StrGrid.MergeCells.AddRectXY(6,IntStartRow+3,6,IntCount+3);
        StrGrid.MergeCells.AddRectXY(7,IntStartRow+3,7,IntCount+3);
      end;


      StrGrid.Cells[8,IntCount+3]:=DataArr[IntCount][7];
      StrGrid.Cells[9,IntCount+3]:=DataArr[IntCount][8];
      StrGrid.Cells[10,IntCount+3]:=DataArr[IntCount][9];
      StrGrid.Cells[11,IntCount+3]:=DataArr[IntCount][10];
      StrGrid.Cells[12,IntCount+3]:=DataArr[IntCount][11];
      StrGrid.Cells[13,IntCount+3]:=DataArr[IntCount][12];
      StrGrid.Cells[14,IntCount+3]:=DataArr[IntCount][13];
      StrGrid.Cells[15,IntCount+3]:=DataArr[IntCount][14];
      StrGrid.Cells[16,IntCount+3]:=DataArr[IntCount][15];
      StrGrid.Cells[17,IntCount+3]:=DataArr[IntCount][16];
      StrGrid.Cells[18,IntCount+3]:=DataArr[IntCount][17];
      StrGrid.Cells[19,IntCount+3]:=DataArr[IntCount][18];
      StrGrid.Cells[20,IntCount+3]:=DataArr[IntCount][19];
      StrGrid.Cells[21,IntCount+3]:=DataArr[IntCount][20];
      StrGrid.Cells[22,IntCount+3]:=DataArr[IntCount][21];
      if LowerCase(Trim( DataArr[IntCount][23] ))='completed' then begin
        for Count2:=8 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,IntCount+3].Font.Color:=clGreen;
        end;
      end else begin
        for Count2:=0 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,IntCount+3].Font.Color:=clWindowText;
        end;
      end;
    end;
    Total.Text:=IntToStr(IntCount2);
  end;

end;


procedure TDailyBusActivityRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDailyBusActivityRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TDailyBusActivityRpt.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TDailyBusActivityRpt.LihatDataClick(Sender: TObject);
begin
  if (Batch.Text ='') then
  begin
    MessageBox(Handle,PChar('Jenis Armada belum dipilih '),'Laporan Aktifitas Harian',MB_OK or MB_ICONERROR );
  end else if (JenisAktifitas.Text ='')then
  begin
    MessageBox(Handle,PChar('Jenis Aktifitas belum dipilih '),'Laporan Aktifitas Harian',MB_OK or MB_ICONERROR );
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TDailyBusActivityRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TDailyBusActivityRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TDailyBusActivityRpt.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
        if Main.IsFormOpen('OrderForm')=False then
//      if StrPos(PChar(StrGrid.Cells[IntCol,IntRow]),PChar('  '))=nil then
        OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[16,IntRow],False)
//      else
//        SelectBooking:=TSelectBooking.Create(Self,StrGrid.Cells[IntCol,IntRow]);

end;
procedure TDailyBusActivityRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TDailyBusActivityRpt.BatchChange(Sender: TObject);
begin
  if Batch.Text<>'' then RefreshSeat else Seat.Text:='';
end;

procedure TDailyBusActivityRpt.CekTglSampaiClick(Sender: TObject);
begin
 // if not(Initiation) then begin
  //  if CekTglSampai.Checked=True then TglSampai.Enabled:=True
  //  else TglSampai.Enabled:=False;
 // end;
end;

procedure TDailyBusActivityRpt.StrGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if ((Key = 67) or (Key = 99)) and (Shift=[ssCtrl]) then
      Copy1Click(Nil);
end;

procedure TDailyBusActivityRpt.Copy1Click(Sender: TObject);
var
  S: string;
  GRect: TGridRect;
  C, R: Integer;
begin
  GRect := StrGrid.Selection;
  S  := '';
  for R := GRect.Top to GRect.Bottom do
  begin
    for C := GRect.Left to GRect.Right do
    begin
      if C = GRect.Right then  S := S + (StrGrid.Cells[C, R])
      else
        S := S + StrGrid.Cells[C, R] + #9;
    end;
    S := S + #13#10;
  end;
  ClipBoard.AsText := S;
end;

end.
