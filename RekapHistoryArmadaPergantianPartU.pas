unit RekapHistoryArmadaPergantianPartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit,
  ADODB, ExtCtrls;

type
  TRekapHistoryArmadaPergantianPart = class(TForm)
    ToXCel: TSpeedButton;
    Label3: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Button1: TButton;
    ProgressBar: TProgressBar;
    Memo1: TMemo;
    Label2: TLabel;
    Batch: TComboBox;
    Label4: TLabel;
    Seat: TComboBox;
    Part: TEdit;
    Button2: TButton;
    Label5: TLabel;
    Button3: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure PartChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    MinRowGrid:Integer;
    RekapArr:Array of TArrString11;
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr:Array of TArrString7;
    KMOdoSekarang,ApiTransTrack,StatusApiTransTrack: String;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshSeat;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure SetOdo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;

  end;

var
  RekapHistoryArmadaPergantianPart: TRekapHistoryArmadaPergantianPart;
  kode_part_rekap_armada_id:String;

implementation

uses MainU, ListPartsU, BrowsePartU, IdHTTP, IdException, IdStack, uLkJSON,
  StrUtils;

{$R *.dfm}
constructor TRekapHistoryArmadaPergantianPart.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TRekapHistoryArmadaPergantianPart.SetOdo;
var
  js : TlkJSONbase;
  IdHTTP: TIdHTTP;
  resp: TMemoryStream;
  url,respon,StrQry: String;
  Qry,Qry2:TADOQuery;
begin
  Main.M_Busy;
  IdHTTP := TIdHTTP.Create(Self);
  resp := TMemoryStream.Create;

  url:='http://'+ApiTransTrack+'/api_transtrack/vehicle_get_all.php';
//  url:='https://order-tracking.transtrack.id/api/v1/vehicles?api_key=key-XOkLrV88kwBPw0hr9ESqtv6nCGp3m4lk%20XAps5GFcpEk374Cwm1H4RwZkgMAelznP&search=AB7494JN';
  IdHTTP.Get(url, resp);
  resp.Position := 0;
  Memo1.Lines.LoadFromStream(resp);
  js := TlkJSON.ParseText(Memo1.Text);
  if Assigned(js) then
  begin
    if (VarToStr(js.Value))='Success' then
    begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='INSERT INTO wh_log_get_odo (username)'+
                  ' VALUES ('+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.ExecSQL;
      end;
      Qry.Close;
      Main.CloseDb;

      MessageBox(0,'Berhasil mengambil Odo','Rekap Armada Pergantian Part',MB_OK);
      Main.M_Normal;
    end else begin
      MessageBox(0,'Gagal mengambil Odo','Rekap Armada Pergantian Part',MB_OK or MB_ICONERROR );
      Main.M_Normal;
    end;
  end;
end;

procedure TRekapHistoryArmadaPergantianPart.RefreshGrid;
var IntCount,IntCount2,IntCountID:Integer;
begin
  if Length(RekapArr)>0 then StrGrid.RowCount:=Length(RekapArr)+3
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=3 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  IntCountID:=0;
  ProgressBar.Position:=80;
  for IntCount:=0 to Length(RekapArr)-1 do begin
    ProgressBar.Position:=80+Round((15/Length(RekapArr))*IntCount);

    StrGrid.Cells[0,IntCount+3]:=RekapArr[IntCount][0];
    StrGrid.Cells[1,IntCount+3]:=RekapArr[IntCount][1];
    StrGrid.Cells[2,IntCount+3]:=RekapArr[IntCount][2];
    StrGrid.Cells[3,IntCount+3]:=RekapArr[IntCount][3];
    StrGrid.Cells[4,IntCount+3]:=RekapArr[IntCount][4];
    StrGrid.Cells[5,IntCount+3]:=RekapArr[IntCount][5];
    StrGrid.Cells[6,IntCount+3]:=RekapArr[IntCount][6];
    StrGrid.Cells[7,IntCount+3]:=RekapArr[IntCount][7];
    StrGrid.Cells[8,IntCount+3]:=RekapArr[IntCount][8];
    StrGrid.Cells[9,IntCount+3]:=RekapArr[IntCount][9];
    StrGrid.Cells[10,IntCount+3]:=RekapArr[IntCount][10];
    
    StrGrid.CellStyle[0,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[8,IntCount+3].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+3].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount+3].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+3].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+3].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+3].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntCount+3].HorizontalAlignment:=taRightJustify;

    if LeftStr(RekapArr[IntCount][10],1)<>'-' then
    begin
      StrGrid.CellStyle[10,IntCount+3].Font.Color:=clRed;
    end;

  end;
  ProgressBar.Position:=100;
  ProgressBar.Visible:=False;
end;


procedure TRekapHistoryArmadaPergantianPart.RefreshData;
var Qry:TADOQuery;
    StrQry,StrReq,StrBatch,StrSeat:String;
    IntCount:Integer;
begin
  if (Seat.Text='') OR (Part.Text='') OR (Batch.Text='') then
  begin
    MessageBox(0,PChar('Lengkapi data..!'),'Rekap History Armada Pergantian PArt',MB_OK or MB_ICONERROR);
  end else
  begin

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Main.M_Busy;

    if (Batch.Text<>'') then
    StrBatch:=' AND a.vhc_batch_id='+BatchArr[Batch.ItemIndex][0]+' '
    else StrBatch:='';

    if (Seat.Text<>'') then
    StrSeat:=' AND g.seat='+Seat.Text+' '
    else StrSeat:='';

    if Main.OpenDb then begin
      SetLength(RekapArr,0);

      StrQry:='SELECT zz.*, '+
              '(CASE WHEN zz.km_terakhir_ganti IS NOT NULL THEN '+
              'zz.km_terakhir_ganti+zz.standard_km_replacement ELSE NULL END) km_estimasi, '+
              '(CASE WHEN zz.km_terakhir_ganti IS NOT NULL AND zz.standard_km_replacement '+
              'IS NOT NULL THEN ((zz.standard_km_replacement/zz.km_hari)+zz.tgl_terakhir_ganti) ELSE NULL end) tgl_estimasi_ganti '+
              'FROM (SELECT a.vehicle_id,a.license_plate,a.vhc_batch_id,concat(h.name,'' '',g.seat) armada,a.odo_update_gps,coalesce(f.name,'''') as driver,(SELECT TOP 1 bb.odo_in '+
              'FROM wh_work_order_part aa '+
              'LEFT JOIN wh_work_order bb ON aa.work_order_id=bb.work_order_id '+
              'WHERE bb.status=2 AND aa.status=1 AND aa.IsUsed=1 '+
              'AND aa.kode_part_gp='+QuotedStr(kode_part_rekap_armada_id)+' '+
              'AND bb.vehicle_id=a.vehicle_id '+
              'ORDER BY bb.odo_in DESC) km_terakhir_ganti, '+
              '(SELECT TOP 1 bb.date_out '+
              'FROM wh_work_order_part aa  '+
              'LEFT JOIN wh_work_order bb ON aa.work_order_id=bb.work_order_id '+
              'WHERE bb.status=2 AND aa.status=1 AND aa.IsUsed=1 '+
              'AND aa.kode_part_gp='+QuotedStr(kode_part_rekap_armada_id)+' '+
              'AND bb.vehicle_id=a.vehicle_id '+
              'ORDER BY bb.odo_in DESC) tgl_terakhir_ganti,''150'' km_hari, '+
              '(SELECT standard_km_replacement FROM wh_part WHERE kode_part_gp='+QuotedStr(kode_part_rekap_armada_id)+' ) standard_km_replacement '+
              'FROM wh_vehicle a '+
              'LEFT JOIN wh_vhc_detail b ON b.vhc_detail_id=(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail where vehicle_id=a.vehicle_id) AND '+
              '( CONVERT(VARCHAR(10), GETDATE(),111) BETWEEN CONVERT(VARCHAR(10), (Select Min(from_date) from wh_vhc_detail where vehicle_id=a.vehicle_id),111) AND '+
              'CONVERT(datetime, (Select Max(Coalesce(to_date, CONVERT(VARCHAR(10), GETDATE(),111))) from wh_vhc_detail where vehicle_id=a.vehicle_id), 111)) '+
              'LEFT JOIN wh_working_schedule e ON e.working_schedule_id=(SELECT MAX(working_schedule_id) FROM wh_working_schedule WHERE is_helper=0 AND (vehicle_id=a.vehicle_id)  '+
              'AND (e.from_date<=CONVERT(VARCHAR(10), GETDATE(),111)) AND (to_date>=CONVERT(VARCHAR(10), GETDATE(),111))) '+
              'LEFT JOIN wh_employee f ON f.employee_id=e.employee_id '+
              'LEFT JOIN wh_vhc_type_detail g ON a.vhc_type_detail_id=g.vhc_type_detail_id '+
              'LEFT JOIN wh_vhc_batch h on a.vhc_batch_id=h.vhc_batch_id '+
              'WHERE  (a.active=1) AND (a.company_id=2) '+StrBatch+StrSeat+'  AND (a.isOutsideRent is NULL OR a.isOutsideRent=0) AND '+
              '(b.location_id=6) ) zz ORDER BY zz.license_plate ASC;';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(RekapArr,IntCount+1);
        RekapArr[IntCount][0]:=IntToStr(IntCount+1);

        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            RekapArr[IntCount][1]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            RekapArr[IntCount][1]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

        RekapArr[IntCount][2]:=Qry.FieldValues['driver'];
        if Qry.FieldValues['tgl_terakhir_ganti']<> NULL then
        RekapArr[IntCount][3]:=Qry.FieldValues['tgl_terakhir_ganti'] else RekapArr[IntCount][3]:='';
        if Qry.FieldValues['km_terakhir_ganti']<> NULL then
        RekapArr[IntCount][4]:=SToCurr(Qry.FieldValues['km_terakhir_ganti']) else RekapArr[IntCount][4]:='';
        RekapArr[IntCount][5]:=Qry.FieldValues['km_hari'];
        if Qry.FieldValues['standard_km_replacement']<> NULL then
        RekapArr[IntCount][6]:=SToCurr(Qry.FieldValues['standard_km_replacement']) else RekapArr[IntCount][6]:='';
        if Qry.FieldValues['km_estimasi']<> NULL then
        RekapArr[IntCount][7]:=SToCurr(Qry.FieldValues['km_estimasi']) else RekapArr[IntCount][7]:='';
//        SetOdo(Qry.FieldValues['license_plate']);
        if (Qry.FieldValues['tgl_estimasi_ganti']<>NULL) then RekapArr[IntCount][8]:=Qry.FieldValues['tgl_estimasi_ganti'] else RekapArr[IntCount][8]:='';
        if (Qry.FieldValues['odo_update_gps']<>NULL) then RekapArr[IntCount][9]:=SToCurr(Qry.FieldValues['odo_update_gps']) else RekapArr[IntCount][9]:='';

        if (Qry.FieldValues['odo_update_gps']<>NULL) AND (Qry.FieldValues['km_estimasi']<>NULL) then
        begin
          RekapArr[IntCount][10]:= SToCurr(Qry.FieldValues['odo_update_gps']-Qry.FieldValues['km_estimasi']);
        end else begin
          RekapArr[IntCount][10]:='';
        end;
          RekapArr[IntCount][11]:=Qry.FieldValues['armada'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;

    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TRekapHistoryArmadaPergantianPart.RefreshSeat;
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

procedure TRekapHistoryArmadaPergantianPart.Init;
var StrQry:String;
    Qry:TADOQuery;
begin
  Part.Text:='';
  kode_part_rekap_armada_id:='';
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

procedure TRekapHistoryArmadaPergantianPart.InitGrid;
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
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Driver Batangan';
  StrGrid.Cells[3,0]:='Nama Part';
  StrGrid.Cells[3,1]:='Pergantian Terakhir';
  StrGrid.Cells[3,2]:='Tanggal';
  StrGrid.Cells[4,2]:='KM';
  StrGrid.Cells[5,1]:='KM';
  StrGrid.Cells[5,2]:='KM/Hari';
  StrGrid.Cells[6,2]:='KM Standard';
  StrGrid.Cells[7,1]:='Estimasi Pergantian';
  StrGrid.Cells[7,2]:='KM Estimasi';
  StrGrid.Cells[8,2]:='Tanggal Estimasi';
  StrGrid.Cells[9,1]:='Update Terakhir '+ UpdateTimeGetOdo;
  StrGrid.Cells[9,2]:='KM Sekarang';
  StrGrid.Cells[10,2]:='KM Pencapaian';

  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,1,2);
  StrGrid.MergeCells.AddRectXY(2,0,2,2);

  StrGrid.MergeCells.AddRectXY(3,0,10,0);
  StrGrid.MergeCells.AddRectXY(3,1,4,1);
  StrGrid.MergeCells.AddRectXY(5,1,6,1);
  StrGrid.MergeCells.AddRectXY(7,1,8,1);
  StrGrid.MergeCells.AddRectXY(9,1,10,1);



  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,2].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,4]:='';
end;

procedure TRekapHistoryArmadaPergantianPart.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TRekapHistoryArmadaPergantianPart.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TRekapHistoryArmadaPergantianPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRekapHistoryArmadaPergantianPart.RefreshCombo;
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

procedure TRekapHistoryArmadaPergantianPart.Button2Click(Sender: TObject);
begin
if Main.IsFormOpen('ListPartsU')=False then
  begin
    ListParts:=TListParts.Create(Self,'REKAPHISTORYARMADAPERGANTIANPART');
  end;
end;

procedure TRekapHistoryArmadaPergantianPart.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TRekapHistoryArmadaPergantianPart.PartChange(Sender: TObject);
begin
  StrGrid.Cells[3,0]:=Part.Text;
end;

procedure TRekapHistoryArmadaPergantianPart.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TRekapHistoryArmadaPergantianPart.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TRekapHistoryArmadaPergantianPart.Button3Click(Sender: TObject);
begin
  SetOdo;
  InitGrid;
end;

end.
