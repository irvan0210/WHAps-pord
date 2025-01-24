unit ListSerahTerimaBarangU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TListSerahTerimaBarang = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    Tanggal: TDateTimePicker;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    Button1: TButton;
    Lihat: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    DataArr:Array of TArrString14;
    IntRow,IsAll,IsBlok,MaxCol,MinRowGrid:Integer;
    Initiation:Boolean;

    procedure RefreshCombo;
  public
    { Public declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);Overload;
  end;

var
  ListSerahTerimaBarang: TListSerahTerimaBarang;

implementation

uses
  MainU, SerahTerimaBarangU;

{$R *.dfm}

constructor TListSerahTerimaBarang.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListTerimaBarang='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TListSerahTerimaBarang.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

end;


procedure TListSerahTerimaBarang.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=12;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=400;
  StrGrid.ColWidths[6]:=50;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=120;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=100;
  StrGrid.ColWidths[11]:=220;


  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='No Tanda Terima';
  StrGrid.Cells[3,0]:='Diterima Oleh';
  StrGrid.Cells[4,0]:='NO PBJ';
  StrGrid.Cells[5,0]:='Item';
  StrGrid.Cells[6,0]:='Qty';
  StrGrid.Cells[7,0]:='No Polisi';
  StrGrid.Cells[8,0]:='Tipe Kendaraan';
  StrGrid.Cells[9,0]:='Tanggal Pengajuan';
  StrGrid.Cells[10,0]:='Tanggal Dibutuhkan';
  StrGrid.Cells[11,0]:='Catatan';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TListSerahTerimaBarang.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit,No:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;
  Main.M_Busy;

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(DataArr,0);

    StrQry:='SELECT a.tanda_terima_id,CONVERT(VARCHAR(10),a.submit_time,103) tgl,'+
            'a.item_request_id,a.diterima,d.license_plate,e.name tipe_kendaraan,'+
            'CONVERT(VARCHAR(10),b.request_date,103) tgl_pengajuan,CONVERT(VARCHAR(10),b.requested_date,103) tgl_dibutuhkan,a.notes '+
            'FROM wh_tanda_terima a '+
            'LEFT JOIN wh_item_request b ON a.item_request_id=b.item_request_id '+
            'LEFT JOIN wh_service_request c ON b.no_request=c.service_request_id '+
            'LEFT JOIN wh_vehicle d ON c.vehicle_id=d.vehicle_id '+
            'LEFT JOIN wh_vhc_batch e ON d.vhc_batch_id=e.vhc_batch_id '+
            'WHERE (a.submit_time BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' AND '+
            ''+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date+1))+') AND '+
            'a.company_id='+StrCompanyId+' AND a.location_id='+StrLocationId+' and a.status=1 order by a.submit_time DESC';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(DataArr,IntCount+1);
      DataArr[IntCount][0]:=IntToStr(No);
      DataArr[IntCount][1]:= Qry.FieldValues['tgl'] ;
      DataArr[IntCount][2]:=Qry.FieldValues['tanda_terima_id'];
      DataArr[IntCount][3]:=Qry.FieldValues['diterima'];
      DataArr[IntCount][4]:=Qry.FieldValues['item_request_id'];
      DataArr[IntCount][7]:=Qry.FieldValues['license_plate'];
      DataArr[IntCount][8]:=Qry.FieldValues['tipe_kendaraan'];
      DataArr[IntCount][9]:=Qry.FieldValues['tgl_pengajuan'];
      DataArr[IntCount][10]:=Qry.FieldValues['tgl_dibutuhkan'];
      DataArr[IntCount][11]:=Qry.FieldValues['notes'];

      StrQry:='select * from wh_tanda_terima_detail where '+
            'tanda_terima_id='+QuotedStr(Qry.FieldValues['tanda_terima_id'])+' and status=1';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(DataArr,IntCount+1);
          DataArr[IntCount][0]:=IntToStr(No);
          DataArr[IntCount][1]:= Qry.FieldValues['tgl'] ;
          DataArr[IntCount][2]:=Qry.FieldValues['tanda_terima_id'];
          DataArr[IntCount][3]:=Qry.FieldValues['diterima'];
          DataArr[IntCount][4]:=Qry.FieldValues['item_request_id'];
          DataArr[IntCount][7]:=Qry.FieldValues['license_plate'];
          DataArr[IntCount][8]:=Qry.FieldValues['tipe_kendaraan'];
          DataArr[IntCount][9]:=Qry.FieldValues['tgl_pengajuan'];
          DataArr[IntCount][10]:=Qry.FieldValues['tgl_dibutuhkan'];

        end;
        if Qry2.FieldValues['item_detail']<>NULL then DataArr[IntCount][5]:=Qry2.FieldValues['item_detail'];
        if Qry2.FieldValues['qty']<>NULL then DataArr[IntCount][6]:=Qry2.FieldValues['qty'];

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TListSerahTerimaBarang.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin

  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=3 to StrGrid.RowCount-1 do begin
      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
    end;
  if Length(DataArr)>0 then StrGrid.RowCount:=Length(DataArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,3]:='';
    StrGrid.CellStyle[IntCount,3].Font.Color:=clWindowText;
  end;

//  if Length(DataArr)>0 then StrGrid.RowCount:=Length(DataArr)+1
//  else begin
//    StrGrid.RowCount:=1;
//  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(DataArr)-1;
  for IntCount:=0 to Length(DataArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>DataArr[IntCount][2])  then begin
      StrOrderId:=DataArr[IntCount][2];
      IntStartRow:=IntCount;
      IntStartRow2:=IntCount;
      StrGrid.Cells[0,IntCount+1]:=DataArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=DataArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=DataArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=DataArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=DataArr[IntCount][4];
      StrGrid.Cells[7,IntCount+1]:=DataArr[IntCount][7];
      StrGrid.Cells[8,IntCount+1]:=DataArr[IntCount][8];
      StrGrid.Cells[9,IntCount+1]:=DataArr[IntCount][9];
      StrGrid.Cells[10,IntCount+1]:=DataArr[IntCount][10];
      StrGrid.Cells[11,IntCount+1]:=DataArr[IntCount][11];

      IsDrawRect:=False;
      IsDrawRect2:=False;
      StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[8,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[10,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[11,IntCount+1].HorizontalAlignment:=taLeftJustify;

    end else if (IntCount<Length(DataArr)-1) then begin
      if (StrOrderId<>DataArr[IntCount+1][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,IntCount+1);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,IntCount+1);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,IntCount+1);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,IntCount+1);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,IntCount+1);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow+1,7,IntCount+1);
      StrGrid.MergeCells.AddRectXY(8,IntStartRow+1,8,IntCount+1);
      StrGrid.MergeCells.AddRectXY(9,IntStartRow+1,9,IntCount+1);
      StrGrid.MergeCells.AddRectXY(10,IntStartRow+1,10,IntCount+1);
      StrGrid.MergeCells.AddRectXY(11,IntStartRow+1,11,IntCount+1);
    end;
    StrGrid.Cells[5,IntCount+1]:=DataArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=DataArr[IntCount][6];
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TListSerahTerimaBarang.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
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
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TListSerahTerimaBarang.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TListSerahTerimaBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TListSerahTerimaBarang.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TListSerahTerimaBarang.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TListSerahTerimaBarang.StrGridDblClick(Sender: TObject);
begin
  if Main.IsFormOpen('SerahTerimaBarang')=False then
  begin
    SerahTerimaBarang:=TSerahTerimaBarang.Create(Self);
    SerahTerimaBarang.Tanggal.Text:=StrGrid.Cells[1,IntRow];
    SerahTerimaBarang.NoTandaTerima.Text:=StrGrid.Cells[2,IntRow];
    SerahTerimaBarang.DiterimaOleh.Text:=StrGrid.Cells[3,IntRow];
    SerahTerimaBarang.NoItemRequest.Text:=StrGrid.Cells[4,IntRow];
    if IsCharAlpha(PChar(Copy(StrGrid.Cells[7,IntRow],2,1))^)=False then
        SerahTerimaBarang.NoPol.Text:=Copy(StrGrid.Cells[7,IntRow],1,1)+' '+Copy(StrGrid.Cells[7,IntRow],2,4)+
                       ' '+Copy(StrGrid.Cells[7,IntRow],6,Length(StrGrid.Cells[7,IntRow])+1)
      else
        SerahTerimaBarang.NoPol.Text:=Copy(StrGrid.Cells[7,IntRow],1,2)+' '+Copy(StrGrid.Cells[7,IntRow],3,4)+
                       ' '+Copy(StrGrid.Cells[7,IntRow],7,Length(StrGrid.Cells[7,IntRow])+1);
    SerahTerimaBarang.TipeKendaraan.Text:=StrGrid.Cells[8,IntRow];
    SerahTerimaBarang.Catatan.Text:=StrGrid.Cells[11,IntRow];

  end;
  SerahTerimaBarang.Refreshpart;
  SerahTerimaBarang.getByID;
end;

procedure TListSerahTerimaBarang.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TListSerahTerimaBarang.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then begin
    Tanggal.Date:= TglSampai.Date;
  end
end;

procedure TListSerahTerimaBarang.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then begin
    TglSampai.Date:=Tanggal.Date;
  end;
end;

end.
