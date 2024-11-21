unit SerahTerimaBarangU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ppParameter, ppStrtch, ppMemo, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, ppDB, ppDBBDE, Grids,
  ZColorStringGrid, ADODB, WHUnit;

type
  TSerahTerimaBarang = class(TForm)
    StrGrid: TZColorStringGrid;
    Qty: TEdit;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel7: TppLabel;
    ppLabel13: TppLabel;
    ppLabel5: TppLabel;
    ppLabel11: TppLabel;
    ppLine12: TppLine;
    ppLogo: TppImage;
    ppTypeKendaraan: TppLabel;
    ppTanggal: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppNoPol: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppNoTerima: TppLabel;
    ppLine13: TppLine;
    ppLine6: TppLine;
    ppLine10: TppLine;
    pln1: TppLine;
    pln2: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine11: TppLine;
    ppLine14: TppLine;
    pln5: TppLine;
    plbl1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppItemService: TppDBText;
    ppNo: TppDBText;
    ppQty: TppDBText;
    pln3: TppLine;
    pln4: TppLine;
    ppLine15: TppLine;
    pln6: TppLine;
    ppKodePart: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine3: TppLine;
    ppPengirim: TppLabel;
    ppinventory: TppLabel;
    ppLabel18: TppLabel;
    ppPenerima: TppLabel;
    ppParameterList1: TppParameterList;
    Panel1: TPanel;
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    Keterangan: TEdit;
    ItemDetail: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    CariItemReq: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DiterimaOleh: TEdit;
    NoTandaTerima: TEdit;
    NoItemRequest: TEdit;
    Tanggal: TEdit;
    NoPol: TEdit;
    TipeKendaraan: TEdit;
    Catatan: TMemo;
    ppKet: TppDBText;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure ItemDetailExit(Sender: TObject);
    procedure ItemDetailChange(Sender: TObject);
    procedure CariItemReqClick(Sender: TObject);
    procedure KeteranganExit(Sender: TObject);
    procedure KeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure NoTandaTerimaChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoItemRequestChange(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    IntRow, IntCol: Integer;
    PartArr:Array of TArrString16;
    procedure InitGrid;
    procedure Calculate;
    procedure Reprint;
    procedure PreparePrint;
  public
    { Public declarations }
    procedure Clear;
    procedure RefreshPart;
    procedure getByID ;
  end;

var
  SerahTerimaBarang: TSerahTerimaBarang;
  TandaTerimaId,NoRequest:String;
  IntRow,IntCol,MinRowGrid,IntMaxRow:Integer;
  DepartmentArr:Array of TArrString5;
  IsInputGrid,IsReadOnly:Boolean;

implementation

uses MainU, ListTerimaBarangU, RePrintFormU, DB, ListSerahTerimaBarangU;

{$R *.dfm}

procedure TSerahTerimaBarang.getByID;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if (NoTandaTerima.Text<>'') then
    begin
      StrQry:='select * from wh_tanda_terima_detail where tanda_terima_id='+QuotedStr(NoTandaTerima.Text)+' and status=1 ' ;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;

      Count:=1;
      if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=0;

      if Qry.RecordCount>0 then while not (Qry.Eof) do begin

        StrGrid.Cells[0,Count]:=IntToStr(Count);
        StrGrid.Cells[1,Count]:=Qry.FieldValues['item_detail'];
        StrGrid.Cells[2,Count]:=Qry.FieldValues['qty'];
        StrGrid.Cells[3,Count]:=Qry.FieldValues['kode_part_gp'];
        StrGrid.Cells[4,Count]:=Qry.FieldValues['keterangan'];

        StrGrid.CellStyle[0,Count].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[1,Count].HorizontalAlignment:=taLeftJustify;
        StrGrid.CellStyle[2,Count].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[4,Count].HorizontalAlignment:=taLeftJustify;
        Qry.Next;
        Inc(Count);
      end;
      Qry.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TSerahTerimaBarang.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=450;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=0;
  StrGrid.ColWidths[4]:=150;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Item Detail';
  StrGrid.Cells[2,0]:='Jumlah';
  StrGrid.Cells[3,0]:='Kode Part GP';
  StrGrid.Cells[4,0]:='Keterangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 4 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
end;

procedure TSerahTerimaBarang.Calculate;
var IntCount,IntNum:Integer;
begin
  StrGrid.CellStyle[0,IntRow].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taCenter;
  IntNum:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do
    if (Trim(StrGrid.Cells[1,IntCount])<>'') and (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
    end else
      StrGrid.Cells[0,IntCount]:='';
end;

procedure TSerahTerimaBarang.RefreshPart;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if (NoItemRequest.Text<>'') then
    begin
      StrQry:='SELECT aa.* FROM (SELECT DISTINCT a.item_request_detail_id,a.item_detail,a.quantity qty,a.kode_part_gp, (a.quantity-case when c.qty IS NULL THEN 0 ELSE c.qty end) sisa from wh_item_request_detail a '+
              'LEFT JOIN wh_tanda_terima b ON a.item_request_id=b.item_request_id AND b.status=1 '+
              'LEFT JOIN wh_tanda_terima_detail c ON b.tanda_terima_id=c.tanda_terima_id AND a.kode_part_gp=c.kode_part_gp AND c.status=1 '+
              'where a.item_request_id='+QuotedStr(NoItemRequest.Text) +' AND '+
              '(a.cancel<> 1 or a.cancel is NULL) AND a.isAvailable=1) aa WHERE aa.sisa>0';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;

      IntCount:=0;
      if Qry.RecordCount>0 then StrGrid.RowCount:=2 else StrGrid.RowCount:=2;
      IntCount:=0;
      SetLength(PartArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PartArr[IntCount][0]:=Qry.FieldValues['item_request_detail_id'];
        PartArr[IntCount][1]:=Qry.FieldValues['item_detail'];
        PartArr[IntCount][2]:=Qry.FieldValues['qty'];
        PartArr[IntCount][3]:=Qry.FieldValues['kode_part_gp'];
        PartArr[IntCount][4]:=Qry.FieldValues['sisa'];
        Qry.Next;
        Inc(IntCount)
    end;
      Qry.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
  ItemDetail.Items.Clear;
  for IntCount:=0 to Length(PartArr)-1 do
    ItemDetail.Items.Add(PartArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TSerahTerimaBarang.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  ppLogo.Picture:=Main.LogoWHDC.Picture;
end;

procedure TSerahTerimaBarang.Reprint;
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Tanda Terima';
  RePrintForm.ReportId:=NoTandaTerima.Text;

  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT a.*,b.name,CONVERT(VARCHAR(10),a.submit_time,103) tgl, e.license_plate,f.name tipe_kendaraan '+
              'FROM wh_tanda_terima a '+
              'LEFT JOIN wh_user b ON a.submit_user=b.username '+
              'LEFT JOIN wh_item_request c on a.item_request_id=c.item_request_id '+
              'LEFT JOIN wh_service_request d on c.no_request=d.service_request_id '+
              'LEFT JOIN wh_vehicle e on d.vehicle_id=e.vehicle_id '+
              'LEFT JOIN wh_vhc_batch f on e.vhc_batch_id=f.vhc_batch_id '+
              ' where a.tanda_terima_id= '+QuotedStr(NoTandaTerima.Text)+' and a.status=1';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppNoTerima.Caption:=Qry.FieldValues['tanda_terima_id'];
        ppTanggal.Caption:=Qry.FieldValues['tgl'];
        ppPengirim.Caption:='( '+Qry.FieldValues['name']+' )';
        ppPenerima.Caption:='( '+Qry.FieldValues['diterima']+' )';
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          ppNoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                         ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          ppNoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        ppTypeKendaraan.Caption:=Qry.FieldValues['tipe_kendaraan'];
      end;
      Qry.Close;               
      StrQry:='	With BlankRow(a,b,c,d,e) AS ( '+
              'SELECT CAST(NULL AS INT) '+
              ', CAST(NULL AS VARCHAR(1)) '+
              ', CAST(NULL AS VARCHAR(1)) '+
              ', CAST(NULL AS VARCHAR(1)) '+
              ', CAST(NULL AS VARCHAR(1)) '+
              ' UNION ALL '+
              'SELECT * FROM BlankRow	) '+
              'SELECT TOP 10 * FROM ( '+
              'SELECT ROW_NUMBER() OVER (ORDER BY tanda_terima_id) AS no, item_detail, qty,kode_part_gp,keterangan '+
              'from wh_tanda_terima_detail '+
              'WHERE (tanda_terima_id='+QuotedStr(NoTandaTerima.Text)+' AND status=1) UNION ALL '+
              'SELECT * FROM BlankRow) AS Result';
//      StrQry:='select ROW_NUMBER() OVER (ORDER BY tanda_terima_id) AS no, a.item_detail, a.qty from wh_tanda_terima_detail a '+
//              'where a.tanda_terima_id='+QuotedStr(NoTandaTerima.Text);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;

procedure TSerahTerimaBarang.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TSerahTerimaBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSerahTerimaBarang.Clear;
begin
  Tanggal.Text:=DateToStr(Now());
  NoTandaTerima.Text:='';
  DiterimaOleh.Text:='';
  NoItemRequest.Text:='';
  TipeKendaraan.Text:='';
  NoPol.Text:='';
  Catatan.Text:='';
end;

procedure TSerahTerimaBarang.FormShow(Sender: TObject);
begin
  Clear;
  InitGrid;
  if NoTandaTerima.Text<>'' then
    CetakUlang.Enabled:=True
  else
    CetakUlang.Enabled:=False;
end;

procedure TSerahTerimaBarang.QtyExit(Sender: TObject);
begin
  if (StrGrid.Cells[1,IntRow]='') then
  begin
    MessageBox(0,PChar('Silahkan pilih part dahulu!!'+Chr(13)+Chr(13)),'Serah Terima Barang',MB_OK or MB_ICONERROR);
  end else
  begin
    if Trim(Qty.Text)<>'' then begin
//      if (PartArr[ItemDetail.ItemIndex][2])
//      StrGrid.Cells[2,IntRow]:=PartArr[ItemDetail.ItemIndex][2];


      StrGrid.Cells[2,IntRow]:=Qty.Text;
      Calculate;
    end;
    Qty.Text:='';
    Qty.Visible := False;
  end;
end;

procedure TSerahTerimaBarang.QtyKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    Calculate;
    QtyExit(nil);
  end;
end;

procedure TSerahTerimaBarang.ItemDetailExit(Sender: TObject);
begin
  if Trim(ItemDetail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=ItemDetail.Text;
    Calculate;
    StrGrid.CellStyle[0,IntRow].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taCenter;
  end;
  ItemDetail.Text:='';
  ItemDetail.Visible := False;
end;

procedure TSerahTerimaBarang.ItemDetailChange(Sender: TObject);
begin
  StrGrid.Cells[2,IntRow]:=PartArr[ItemDetail.ItemIndex][2];
  StrGrid.Cells[3,IntRow]:=PartArr[ItemDetail.ItemIndex][3];
end;

procedure TSerahTerimaBarang.CariItemReqClick(Sender: TObject);
begin
  ListItemRequest:=TListItemRequest.Create(self);
end;

procedure TSerahTerimaBarang.KeteranganExit(Sender: TObject);
begin
  if Trim(Keterangan.Text)<>'' then begin
    StrGrid.Cells[4,IntRow]:=Keterangan.Text;
    Calculate;
    StrGrid.CellStyle[0,IntRow].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taCenter;
  end;
  Keterangan.Text:='';
  Keterangan.Visible := False;
end;

procedure TSerahTerimaBarang.KeteranganKeyPress(Sender: TObject;
  var Key: Char);
  var IntCount:Integer;
begin
  if (Key=#13) then begin
    Calculate;

    if (StrGrid.Row=StrGrid.RowCount-1)  then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    end;
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:=1;
  end;
end;

procedure TSerahTerimaBarang.NoTandaTerimaChange(Sender: TObject);
begin
  if NoTandaTerima.Text<>'' then
    CetakUlang.Enabled:=True
  else
    CetakUlang.Enabled:=False;
end;

procedure TSerahTerimaBarang.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;

      with ItemDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 2) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
     if (ACol = 4) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Keterangan do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
end;

procedure TSerahTerimaBarang.BersihkanClick(Sender: TObject);
begin
  Clear;
  InitGrid;
end;

procedure TSerahTerimaBarang.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(StrGrid.Cells[2,1])<>'') and (DiterimaOleh.Text<>'') and (NoItemRequest.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyId;
      StrLocationId:=LocationId;

      if NoTandaTerima.Text='' then begin
        StrQry:='SELECT RIGHT(MAX(tanda_terima_id),4) AS tanda_terima_id FROM wh_tanda_terima WHERE tanda_terima_id '+
                'LIKE '+Chr(39)+'TDT'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['tanda_terima_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['tanda_terima_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
        StrTransId:='0001';
        StrTransId:='TDT'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;

        StrQry:='INSERT INTO wh_tanda_terima (tanda_terima_id,company_id,location_id,item_request_id'+
                ',diterima,submit_user,submit_time,update_user,status) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+QuotedStr(NoItemRequest.Text)+
                ','+QuotedStr(DiterimaOleh.Text)+','+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+',1);';
      end else begin
        StrTransId:=NoTandaTerima.Text;
        StrQry:='UPDATE wh_tanda_terima SET item_request_id='+QuotedStr(NoItemRequest.Text)+' '+
                ',diterima='+QuotedStr(DiterimaOleh.Text)+',update_user='+QuotedStr(User)+' '+
                ',update_time=GETDATE() WHERE '+
                'tanda_terima_id='+QuotedStr(StrTransId);
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      StrQry:='';
//      if Batal.Checked=False then begin
      if Trim(NoTandaTerima.Text)<>'' then begin

        StrQry:='UPDATE wh_tanda_terima_detail SET status=0 WHERE tanda_terima_id='+QuotedStr(StrTransId)+';';
      end;
      for IntCount:=1 to StrGrid.RowCount-1 do begin

        StrQry:=StrQry+' INSERT INTO wh_tanda_terima_detail (tanda_terima_id'+
                ',item_detail,qty,status,kode_part_gp,keterangan) '+
                ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrGrid.Cells[1,IntCount])+
                ','+StrGrid.Cells[2,IntCount]+',1,'+QuotedStr(StrGrid.Cells[3,IntCount])+','+QuotedStr(StrGrid.Cells[4,IntCount])+');';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=StrEMessage+' '+E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        NoTandaTerima.Text:=StrTransId;
        CetakUlang.Enabled:=True;
        if MessageBox(0,PChar('Tanda Terima Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Retur',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
            Reprint();
        end;

      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Tanda Terima Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK or MB_ICONERROR);
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Service Request',MB_OK or MB_ICONERROR);
  end;
end;

procedure TSerahTerimaBarang.NoItemRequestChange(Sender: TObject);
begin
  InitGrid;
  RefreshPart;
end;

procedure TSerahTerimaBarang.CetakUlangClick(Sender: TObject);
begin
  if NoTandaTerima.Text<>'' then
  Reprint();
end;

procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;
end;

procedure TSerahTerimaBarang.StrGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if IntRow>0 then begin
    if Key=VK_DELETE then begin
      if MessageBox(Handle,'Mau Menghapus Baris ini ?','Tanda Terima',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
        DeleteRow(StrGrid,IntRow);
      end;
    end;
  end;
end;

end.
