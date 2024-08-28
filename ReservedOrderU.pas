unit ReservedOrderU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WHUnit, ADODB, StrUtils, Grids,
  ZColorStringGrid, ComCtrls;

type
  TReservedOrder = class(TForm)
    pnlDisplayD: TPanel;
    pnlDisplayH: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtIDCustOrder: TEdit;
    btnCariCustomerID: TSpeedButton;
    edtNamaCustomer: TEdit;
    Label9: TLabel;
    edtPICID: TEdit;
    edtNamaPIC: TEdit;
    Label25: TLabel;
    cbkKontrak: TCheckBox;
    Label19: TLabel;
    edtKontrakID: TEdit;
    GroupNamaProduct: TGroupBox;
    GridNamaProduct: TZColorStringGrid;
    edtCustomerID: TEdit;
    Label3: TLabel;
    edtCariSopir1: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    edtCariArmada: TEdit;
    edtIDWilayahKota: TEdit;
    dtpWaktuDari: TDateTimePicker;
    dtpWaktuSampai: TDateTimePicker;
    Label2: TLabel;
    Label5: TLabel;
    Label23: TLabel;
    dtpJamStanBy: TDateTimePicker;
    Label6: TLabel;
    mJumlahData: TMemo;
    Label4: TLabel;
    edtSales: TEdit;
    grpboxBiayaTambahanCustomer: TGroupBox;
    strgridBiayaTambahanCustomer: TZColorStringGrid;
    cbServicePerusahaan: TCheckBox;
    lLain2Ke1: TLabel;
    edtLain1: TEdit;
    lLain2Ke2: TLabel;
    edtLain2: TEdit;
    Label7: TLabel;
    edtCariSopir2: TEdit;
    btnSelesai: TButton;
    btnBersih: TButton;
    btnRefresh: TButton;
    btnSimpanH: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure btnSimpanHClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBersihClick(Sender: TObject);
    procedure btnCariCustomerIDClick(Sender: TObject);
    procedure edtCariSopir1Exit(Sender: TObject);
    procedure edtCariSopir1Enter(Sender: TObject);
    procedure edtCariSopir1KeyPress(Sender: TObject; var Key: Char);
    procedure GridNamaProductSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure edtCariArmadaEnter(Sender: TObject);
    procedure edtCariArmadaExit(Sender: TObject);
    procedure edtCariArmadaKeyPress(Sender: TObject; var Key: Char);
    procedure edtIDCustOrderChange(Sender: TObject);
    procedure edtIDWilayahKotaChange(Sender: TObject);
    procedure edtCariSopir2Enter(Sender: TObject);
    procedure edtCariSopir2Exit(Sender: TObject);
    procedure edtCariSopir2KeyPress(Sender: TObject; var Key: Char);
  private
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataActivasiH,DataActivasiD:integer;
    DataUser,DataCount:string;
    DataIDDuaDriver,DtStatusKontrak:string;


    WilayahKotaArr:Array of TArrString5;


    procedure qActExecuteMessage(Query,PesanError:string);

    procedure ButtonSimpanDataHeder;
    procedure ButtonBersihData;

    procedure EnableDataFalseHeader;
    procedure EnableDataTrueHeader;
    procedure ClearDataHeader;
    procedure ClearDataHeaderGridBiayaTambahanCustomer;

    procedure ClearDataDetail;


    procedure RefreshDataIDWilayahKota;

    procedure TambahDanUbahDataSatuDriver;
    procedure TambahDanUbahDataDuaDriver;





    { Private declarations }
  public
    { Public declarations }

    DataReservedOrderIDH,DataReservedOrderIDD,Event:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;ReservedOrderIDH,ReservedOrderIDD,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  ReservedOrder: TReservedOrder;

implementation

uses MainU, CustomerOrderSearchU, VehicleSearchU,
  ReservedOrderListU, EmployeeSearchU1;

{$R *.dfm}

constructor TReservedOrder.Create(AOwner:TComponent;ReservedOrderIDH,ReservedOrderIDD,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  DataReservedOrderIDH:=ReservedOrderIDH;
  DataReservedOrderIDD:=ReservedOrderIDD;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);

end;

procedure TReservedOrder.qActExecuteMessage(Query,PesanError:string);
var
  qQuery:TADOQuery;

begin
  qQuery:=TADOQuery.Create(nil);
  qQuery.Connection:=Main.MyConnection;
  qQuery.Close;
  qQuery.SQL.Clear;
  qQuery.SQL.Add(Query);

  try
          qQuery.ExecSQL;
  except
    on E:Exception do begin
       StrMsg:=PesanError;
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;

 FreeAndNil(qQuery);

end;


procedure TReservedOrder.ButtonSimpanDataHeder;
begin
  //btnSimpanH.Enabled:=False;
  //btnBersih.Enabled:=True;

  EnableDataFalseHeader;
end;

procedure TReservedOrder.EnableDataFalseHeader;
begin

  //btnCariIDOrderPelanggan.Enabled:=False;
  //btnCariIDPegawai.Enabled:=False;
  //btnCariIDkendaraan.Enabled:=False;
end;

procedure TReservedOrder.EnableDataTrueHeader;
begin

  //btnCariIDOrderPelanggan.Enabled:=True;
  //btnCariIDPegawai.Enabled:=True;
  //btnCariIDkendaraan.Enabled:=True;
end;

procedure TReservedOrder.ClearDataHeaderGridBiayaTambahanCustomer;
var
  Count:integer;
begin
  
  Count:=1;
  while (strgridBiayaTambahanCustomer.RowCount>Count) do
  begin
    strgridBiayaTambahanCustomer.Cells[0,Count]:='';
    strgridBiayaTambahanCustomer.Cells[1,Count]:='';
    strgridBiayaTambahanCustomer.Cells[2,Count]:='';
    strgridBiayaTambahanCustomer.Cells[3,Count]:='';
    strgridBiayaTambahanCustomer.Cells[4,Count]:='';


    Inc(Count);
  end;
  strgridBiayaTambahanCustomer.RowCount:=2;



end;


procedure TReservedOrder.ClearDataHeader;
begin

  cbServicePerusahaan.Checked:=False;

  ClearDataHeaderGridBiayaTambahanCustomer;

  edtSales.Clear;

  edtIDCustOrder.Clear;


  edtCustomerID.Clear;
  edtNamaCustomer.Clear;

  edtPICID.Clear;
  edtNamaPIC.Clear;

  //cbkKontrak.Checked:=False;
  edtKontrakID.Clear;

end;

procedure TReservedOrder.ClearDataDetail;
var
  Count:integer;
begin

  Count:=2;
  while (GridNamaProduct.RowCount>Count) do
  begin
    GridNamaProduct.Cells[0,Count]:='';
    GridNamaProduct.Cells[1,Count]:='';
    GridNamaProduct.Cells[2,Count]:='';
    GridNamaProduct.Cells[3,Count]:='';
    GridNamaProduct.Cells[4,Count]:='';
    GridNamaProduct.Cells[5,Count]:='';
    GridNamaProduct.Cells[6,Count]:='';
    GridNamaProduct.Cells[7,Count]:='';
    GridNamaProduct.Cells[8,Count]:='';
    GridNamaProduct.Cells[9,Count]:='';
    GridNamaProduct.Cells[10,Count]:='';
    GridNamaProduct.Cells[11,Count]:='';
    GridNamaProduct.Cells[12,Count]:='';
    Inc(Count);
  end;

  GridNamaProduct.RowCount:=3;


end;

procedure TReservedOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReservedOrder.TambahDanUbahDataSatuDriver;
var
  Qry:TADOQuery;
  vDataRevBO,VPrefix,vDataCount:string;
  Count:integer;

begin
  {
  if edtIDOrderPelanggan.Text='' then
  begin
      MessageDlg('Data ID ORDER Tidak Boleh Kosong',mtError,[mbOK],0);
      Exit;
  end;
  }

  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=Main.MyConnection;
        StrQry:='select count(*) as nilai from wh_reserved_order ';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
    try
        Qry.Open;

    except
      on E:Exception do begin
         StrMsg:='Tabel Lead Tidak Dapat Di Buka';
         StrEMessage:=E.Message;
         IsOk:=False;
         end
    end;


    StrQry:=' SELECT right(max(reserved_order_id),4) as nilai FROM wh_reserved_order '+
            ' WHERE LEFT(reserved_order_id,11) ='+QuotedStr('REVBO'+DataNilaiTahun+DataNilaiBulan+DataNilaiHari);
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;

          vPrefix:=DataNilaiTahun+DataNilaiBulan+DataNilaiHari;
          if Qry.FieldValues['nilai']=NULL then begin
             vDataRevBO:=Trim('REVBO'+vPrefix+'0001');
          end else begin
             DataCount:=Qry.FieldValues['nilai'];
             vDataCount:='0000'+DataCount;
             vDataCount:=Format('%.*d',[4,StrToInt(vDataCount)+1]);
             vDataRevBO:=Trim('REVBO'+vPrefix+vDataCount);
          end;


    if Event='T' then begin

       StrQry:=' INSERT INTO wh_reserved_order(reserved_order_id, '+
               ' customer_order_id, '+
               ' update_time, '+
               ' update_user ) '+
               ' VALUES('+QuotedStr(vDataRevBO)+', '+
               QuotedStr(edtIDCustOrder.Text)+', GETDATE(), '+
               QuotedStr(User)+')';
       qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Reserved Order');

       StrQry:=' UPDATE wh_customer_order '+
               ' SET reserved_order_id ='+QuotedStr(vDataRevBO) +','+
               ' status_armada_id_or_an ='+QuotedStr('1')+', '+
               ' status_armada_id_or_u ='+QuotedStr('0')+', '+
               ' is_proses_reserved_or ='+QuotedStr('1') +', '+
               ' update_time_reserved_or =GETDATE(), '+
               ' update_user_reserved_or ='+QuotedStr(User) +' '+
               ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text);

        qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order');




       Count:=2;
       while (GridNamaProduct.RowCount>=Count) do begin
       if GridNamaProduct.Cells[0,Count]<>'' then begin
           StrQry:=' UPDATE wh_customer_order_detail '+
                   ' SET reserved_order_id ='+QuotedStr(vDataRevBO) +','+
                   ' status_armada_id_or_an ='+QuotedStr('1')+', '+
                   ' status_armada_id_or_u ='+QuotedStr('0')+', '+
                   ' vehicle_id ='+QuotedStr(GridNamaProduct.Cells[10,Count]) +', '+
                   ' employee_id1 ='+QuotedStr(GridNamaProduct.Cells[11,Count]) +', '+
                   //' employee_id2 ='+QuotedStr(GridNamaProduct.Cells[12,Count]) +', '+
                   ' is_road_or ='+QuotedStr('1') +', '+
                   ' is_driver1_or ='+QuotedStr('1') +', '+
                   //' is_driver2_or ='+QuotedStr('1') +', '+
                   ' update_time_rev_or =GETDATE(), '+
                   ' update_user_rev_or ='+QuotedStr(User) +' '+
                   ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text) +' '+
                   ' AND customer_order_detail_id ='+QuotedStr(GridNamaProduct.Cells[13,Count]) ;
           qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order Detail');

         end;
         Inc(Count);
       end;



    end else
    if Event='U' then begin

       Count:=2;
       while (GridNamaProduct.RowCount>=Count) do begin
       if GridNamaProduct.Cells[0,Count]<>'' then begin
           StrQry:=' UPDATE wh_customer_order_detail '+
                   ' SET  vehicle_id ='+QuotedStr(GridNamaProduct.Cells[10,Count]) +', '+ 
                   ' employee_id1 ='+QuotedStr(GridNamaProduct.Cells[11,Count]) +', '+
                   //' employee_id2 ='+QuotedStr(GridNamaProduct.Cells[12,Count]) +', '+
                   ' update_time_rev_or =GETDATE(), '+
                   ' update_user_rev_or ='+QuotedStr(User) +' '+
                   ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text) +' '+
                   ' AND customer_order_detail_id ='+QuotedStr(GridNamaProduct.Cells[13,Count]) ;

           qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order Detail');

         end;
         Inc(Count);
       end;


    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin
         pnlDisplayH.Enabled:=False;
         pnlDisplayD.Enabled:=False;
         btnSimpanH.Enabled:=False;

        //ButtonSimpanDataHeder;

      end else
      if Event='U' then begin
         pnlDisplayH.Enabled:=False;
         pnlDisplayD.Enabled:=False;
         btnSimpanH.Enabled:=False;

        //edtIDOrderPelanggan.Enabled:=True;
        //edtnamaPelanggan.Enabled:=True;

        //edtIDPegeawai.Enabled:=True;
        //edtNamaPegawai.Enabled:=True;

        //edtIDKendaraan.Enabled:=True;
        //edtNamaKendaraan.Enabled:=True;

        //btnBersih.Enabled:=True;
        //pnlDisplayH.Enabled:=False;

        //StrQry:=' EXECUTE GetReservedOrderWHDCRefresh';
        //ViewData1(StrQry,ReservedOrderList.StrGridH);


      end;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Gagal Simpan',MB_OK or MB_ICONERROR);
    end;

  end;

  Main.CloseDb;
  Main.M_Normal;


end;



procedure TReservedOrder.TambahDanUbahDataDuaDriver;
var
  Qry:TADOQuery;
  vDataRevBO,VPrefix,vDataCount:string;
  Count:integer;

begin
  {
  if edtIDOrderPelanggan.Text='' then
  begin
      MessageDlg('Data ID ORDER Tidak Boleh Kosong',mtError,[mbOK],0);
      Exit;
  end;
  }

  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=Main.MyConnection;
        StrQry:='select count(*) as nilai from wh_reserved_order ';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
    try
        Qry.Open;

    except
      on E:Exception do begin
         StrMsg:='Tabel Lead Tidak Dapat Di Buka';
         StrEMessage:=E.Message;
         IsOk:=False;
         end
    end;


    StrQry:=' SELECT right(max(reserved_order_id),4) as nilai FROM wh_reserved_order '+
            ' WHERE LEFT(reserved_order_id,11) ='+QuotedStr('REVBO'+DataNilaiTahun+DataNilaiBulan+DataNilaiHari);
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;

          vPrefix:=DataNilaiTahun+DataNilaiBulan+DataNilaiHari;
          if Qry.FieldValues['nilai']=NULL then begin
             vDataRevBO:=Trim('REVBO'+vPrefix+'0001');
          end else begin
             DataCount:=Qry.FieldValues['nilai'];
             vDataCount:='0000'+DataCount;
             vDataCount:=Format('%.*d',[4,StrToInt(vDataCount)+1]);
             vDataRevBO:=Trim('REVBO'+vPrefix+vDataCount);
          end;


    if Event='T' then begin

       StrQry:=' INSERT INTO wh_reserved_order(reserved_order_id, '+
               ' customer_order_id, '+
               ' update_time, '+
               ' update_user ) '+
               ' VALUES('+QuotedStr(vDataRevBO)+', '+
               QuotedStr(edtIDCustOrder.Text)+', GETDATE(), '+
               QuotedStr(User)+')';
       qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Reserved Order');

       StrQry:=' UPDATE wh_customer_order '+
               ' SET reserved_order_id ='+QuotedStr(vDataRevBO) +','+
               ' status_armada_id_or_an ='+QuotedStr('1')+', '+
               ' status_armada_id_or_u ='+QuotedStr('0')+', '+
               ' is_proses_reserved_or ='+QuotedStr('1') +', '+
               ' update_time_reserved_or =GETDATE(), '+
               ' update_user_reserved_or ='+QuotedStr(User) +' '+
               ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text);
        qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order');

       Count:=2;
       while (GridNamaProduct.RowCount>=Count) do begin
       if GridNamaProduct.Cells[0,Count]<>'' then begin
           StrQry:=' UPDATE wh_customer_order_detail '+
                   ' SET reserved_order_id ='+QuotedStr(vDataRevBO) +','+
                   ' status_armada_id_or_an ='+QuotedStr('1')+', '+
                   ' status_armada_id_or_u ='+QuotedStr('0')+', '+
                   ' vehicle_id ='+QuotedStr(GridNamaProduct.Cells[10,Count]) +', '+
                   ' employee_id1 ='+QuotedStr(GridNamaProduct.Cells[11,Count]) +', '+
                   ' employee_id2 ='+QuotedStr(GridNamaProduct.Cells[12,Count]) +', '+
                   ' is_road_or ='+QuotedStr('1') +', '+
                   ' is_driver1_or ='+QuotedStr('1') +', '+
                   ' is_driver2_or ='+QuotedStr('1') +', '+
                   ' update_time_rev_or =GETDATE(), '+
                   ' update_user_rev_or ='+QuotedStr(User) +' '+
                   ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text) +' '+
                   ' AND customer_order_detail_id ='+QuotedStr(GridNamaProduct.Cells[13,Count]) ;
           qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order Detail');

         end;
         Inc(Count);
       end;



    end else
    if Event='U' then begin

       StrQry:=' UPDATE wh_customer_order '+
               ' SET is_proses_reserved_or ='+QuotedStr('1') +', '+
               ' update_time_reserved_or =GETDATE(), '+
               ' update_user_reserved_or ='+QuotedStr(User) +' '+
               ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text);
      qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order');

       Count:=2;
       while (GridNamaProduct.RowCount>=Count) do begin
       if GridNamaProduct.Cells[0,Count]<>'' then begin
           StrQry:=' UPDATE wh_customer_order_detail '+
                   ' SET  vehicle_id ='+QuotedStr(GridNamaProduct.Cells[10,Count]) +', '+
                   ' employee_id1 ='+QuotedStr(GridNamaProduct.Cells[11,Count]) +', '+
                   ' employee_id2 ='+QuotedStr(GridNamaProduct.Cells[12,Count]) +', '+
                   ' update_time_rev_or =GETDATE(), '+
                   ' update_user_rev_or ='+QuotedStr(User) +' '+
                   ' WHERE customer_order_id ='+QuotedStr(edtIDCustOrder.Text) +' '+
                   ' AND customer_order_detail_id ='+QuotedStr(GridNamaProduct.Cells[13,Count]) ;

           qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Customer Order Detail');

         end;
         Inc(Count);
       end;


    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin
      
         btnSimpanH.Enabled:=False;
         pnlDisplayH.Enabled:=False;
         pnlDisplayD.Enabled:=False;

         //ButtonSimpanDataHeder;

      end else
      if Event='U' then begin

         btnSimpanH.Enabled:=False;
         pnlDisplayH.Enabled:=False;
         pnlDisplayD.Enabled:=False;

        //edtIDOrderPelanggan.Enabled:=True;
        //edtnamaPelanggan.Enabled:=True;

        //edtIDPegeawai.Enabled:=True;
        //edtNamaPegawai.Enabled:=True;

        //edtIDKendaraan.Enabled:=True;
        //edtNamaKendaraan.Enabled:=True;

        //btnBersih.Enabled:=True;
        //pnlDisplayH.Enabled:=False;

        //StrQry:=' EXECUTE GetReservedOrderWHDCRefresh';
        //ViewData1(StrQry,ReservedOrderList.StrGridH);


      end;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Gagal Simpan',MB_OK or MB_ICONERROR);
    end;

  end;

  Main.CloseDb;
  Main.M_Normal;


end;


procedure TReservedOrder.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TReservedOrder.btnSimpanHClick(Sender: TObject);

begin
  //edtIDCustOrder.SetFocus dimatikan

  if edtIDCustOrder.Text='' then begin
    MessageDlg('Data ID Tidak Boleh Kosong Mohon Cek Kembali ',mtConfirmation,[mbOK],0);
    Exit;
  end else begin
    if DataIDDuaDriver='212' then begin
      TambahDanUbahDataDuaDriver;
    end else begin
      TambahDanUbahDataSatuDriver;
    end;
  end;
  
end;

procedure TReservedOrder.FormCreate(Sender: TObject);
var
  Qry:TADOQuery;
  vDataJumRecord, Count:integer;
  vCountGridFeeAddCust:integer;


begin
  KeyPreview :=True;

  //BiayaTamBahan
  strGridBiayaTamBahanCustomer.ColWidths[0]:=170;
  strGridBiayaTamBahanCustomer.ColWidths[1]:=80;

  //Biaya Tambahan Customer
  strGridBiayaTamBahanCustomer.Cells[0,0]:='Keterangan';
  strGridBiayaTamBahanCustomer.Cells[1,0]:='Jumlah Armada';
  strGridBiayaTamBahanCustomer.Cells[3,0]:='BiayaTambahanCustomerDataID'; 

  //Nama Product
  GridNamaProduct.MergeCells.AddRectXY(0,0,0,1);
  //Tgl Berangkat
  GridNamaProduct.MergeCells.AddRectXY(1,0,1,1);
  //Acara Perjalanan
  GridNamaProduct.MergeCells.AddRectXY(2,0,2,1);
  //STAND BY
  GridNamaProduct.MergeCells.AddRectXY(3,0,4,0);
   //Hari
  GridNamaProduct.MergeCells.AddRectXY(5,0,5,1);
  //Seat
  GridNamaProduct.MergeCells.AddRectXY(6,0,6,1);
  //No Body
  GridNamaProduct.MergeCells.AddRectXY(7,0,7,1);
  //Nama Sopir Ke 1
  GridNamaProduct.MergeCells.AddRectXY(8,0,8,1);
  //Nama Sopir Ke 2
  GridNamaProduct.MergeCells.AddRectXY(9,0,9,1);

  //Nama Product
  GridNamaProduct.CellStyle[0,0].HorizontalAlignment:=taCenter;
  //Tgl Berangkat
  GridNamaProduct.CellStyle[1,0].HorizontalAlignment:=taCenter;
  // Acara Perjalanan
  GridNamaProduct.CellStyle[2,0].HorizontalAlignment:=taCenter;
  //STAND BY
  GridNamaProduct.CellStyle[3,0].HorizontalAlignment:=taCenter;
   //Hari
  GridNamaProduct.CellStyle[5,0].HorizontalAlignment:=taCenter;
  //Seat
  GridNamaProduct.CellStyle[6,0].HorizontalAlignment:=taCenter;
  //No Body
  GridNamaProduct.CellStyle[7,0].HorizontalAlignment:=taCenter;
  //Nama Sopir Ke1
  GridNamaProduct.CellStyle[8,0].HorizontalAlignment:=taCenter;
  //Nama Sopir Ke2
  GridNamaProduct.CellStyle[9,0].HorizontalAlignment:=taCenter;

  //Nama Product
  GridNamaProduct.ColWidths[0]:=250;
  //Tgl Berangkat
  GridNamaProduct.ColWidths[1]:=80;
  //Acara Perjalanan
  GridNamaProduct.ColWidths[2]:=400;
  //STAND BY
  GridNamaProduct.ColWidths[3]:=300;
  GridNamaProduct.ColWidths[4]:=80;
  //Hari
  GridNamaProduct.ColWidths[5]:=50;
  //Seat
  GridNamaProduct.ColWidths[6]:=50;
  //No Body
  GridNamaProduct.ColWidths[7]:=80;
  //Nama Sopir Ke 1
  GridNamaProduct.ColWidths[8]:=120;
  //Nama Sopir Ke 2
  GridNamaProduct.ColWidths[9]:=120;

  //Nama Product
  GridNamaProduct.Cells[0,0]:='Nama Product';
  //Tgl Berangkat
  GridNamaProduct.Cells[1,0]:='Tgl Berangkat';
  //Acara Perjalanan
  GridNamaProduct.Cells[2,0]:='Acara Perjalanan';
  //STAND BY
  GridNamaProduct.Cells[3,0]:='STAND BY';
  GridNamaProduct.Cells[3,1]:='Tempat';
  GridNamaProduct.Cells[4,1]:='Jam';
  //Hari
  GridNamaProduct.Cells[5,0]:='Hari';
  //Seat
  GridNamaProduct.Cells[6,0]:='Seat';
  //No Body
  GridNamaProduct.Cells[7,0]:='No Body';
  //Nama Sopir Ke 1
  GridNamaProduct.Cells[8,0]:='Nama Sopir Ke 1' ;
  //Nama Sopir Ke 2
  GridNamaProduct.Cells[9,0]:='Nama Sopir Ke 2' ;

  //ID Armada
  GridNamaProduct.Cells[10,0]:='IDArmada';
  //ID Sopir Ke1
  GridNamaProduct.Cells[11,0]:='IDSopir1';
  //ID Sopir Ke2
  GridNamaProduct.Cells[12,0]:='IDSopir2';
  //CustomerOrderDetailID
  GridNamaProduct.Cells[13,0]:='CustomerOrderDetailID';

  if Event='T' then begin
    DataActivasiH:=1; 
    DataActivasiD:=1;
    //cbkActivasi.Checked:=True;

  end else
 if (Event='U') or (Event='L') then begin

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:=' EXECUTE GetReservedOrderWHDCOne @vReservedOrderID ='+QuotedStr(DataReservedOrderIDH);
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      if Qry.FieldValues['customer_order_id']<>NULL then
      edtIDCustOrder.Text:=Qry.FieldValues['customer_order_id'];

      if Qry.FieldValues['sales_id']<>NULL then
      edtSales.Text:=Qry.FieldValues['sales_id'];

      if Qry.FieldValues['customer_id']<>NULL then
      edtCustomerID.Text:=Qry.FieldValues['customer_id'];

      if Qry.FieldValues['nama_customer']<>NULL then
      edtNamaCustomer.Text:=Qry.FieldValues['nama_customer'];

      if Qry.FieldValues['contact_person_id']<>NULL then
      edtPICID.Text:=Qry.FieldValues['contact_person_id'];

      if Qry.FieldValues['nama_pic']<>NULL then
      edtNamaPIC.Text:=Qry.FieldValues['nama_pic'];

      {
      if Qry.FieldValues['contract']<>NULL then
        DtStatusKontrak:=Qry.FieldValues['contract'];
        if DtStatusKontrak='0'  then
        //cmbStatusKontrak.Text:='Tidak' else
        cbkKontrak.Checked:=False else
        if DtStatusKontrak='1' then
        //cmbStatusKontrak.Text:='Ya';
        cbkKontrak.Checked:=True;
      }
      {

      if Qry.FieldValues['status_h']<>NULL then
      DataActivasiH:=Qry.FieldValues['status_h'];

      case DataActivasiH of
      1:begin
          cbkActivasi.Checked:=True;

        end;
      2:begin
           cbkActivasi.Checked:=False;
        end;

      end;
      }

        Count:=2;
        vDataJumRecord:=0;
        if Qry.RecordCount>0 then begin
          GridNamaProduct.RowCount:=Qry.RecordCount+2;
            while Not(Qry.Eof) do begin
              vDataJumRecord:=vDataJumRecord+1;

              if Qry.FieldValues['nama_product']<>NULL then
              GridNamaProduct.Cells[0,Count]:=Qry.FieldValues['nama_product'];

              if Qry.FieldValues['date_form']<>NULL then
              GridNamaProduct.Cells[1,Count]:=Qry.FieldValues['date_form'];

              if Qry.FieldValues['destination']<>NULL then
              GridNamaProduct.Cells[2,Count]:=Qry.FieldValues['destination'];

              if Qry.FieldValues['location_penjemputan']<>NULL then
              GridNamaProduct.Cells[3,Count]:=Qry.FieldValues['location_penjemputan'];

              if Qry.FieldValues['jam_stand_by']<>NULL then
              GridNamaProduct.Cells[4,Count]:=Qry.FieldValues['jam_stand_by'];

              if Qry.FieldValues['long_day_use']<>NULL then
              GridNamaProduct.Cells[5,Count]:=Qry.FieldValues['long_day_use'];

              if Qry.FieldValues['seat']<>NULL then
              GridNamaProduct.Cells[6,Count]:=Qry.FieldValues['seat'];

              if Qry.FieldValues['body_id']<>NULL then
              GridNamaProduct.Cells[7,Count]:=Qry.FieldValues['body_id'];

              //nama sopir1
              if Qry.FieldValues['nama_sopir1']<>NULL then
              GridNamaProduct.Cells[8,Count]:=Qry.FieldValues['nama_sopir1'];
              //nama sopir2
              if Qry.FieldValues['nama_sopir2']<>NULL then
              GridNamaProduct.Cells[9,Count]:=Qry.FieldValues['nama_sopir2'];

              if Qry.FieldValues['vehicle_id']<>NULL then
              GridNamaProduct.Cells[10,Count]:=Qry.FieldValues['vehicle_id'];

              if Qry.FieldValues['employee_id1']<>NULL then
              GridNamaProduct.Cells[11,Count]:=Qry.FieldValues['employee_id1'];

              if Qry.FieldValues['employee_id2']<>NULL then
              GridNamaProduct.Cells[12,Count]:=Qry.FieldValues['employee_id2'];

              if Qry.FieldValues['customer_order_detail_id']<>NULL then
              GridNamaProduct.Cells[13,Count]:=Qry.FieldValues['customer_order_detail_id'];


              Inc(Count);
              Qry.Next;
            end;
        end;

        mJumlahData.Text:=IntToStr(vDataJumRecord);
        if Qry.FieldValues['service_perusahaan_id']<>NULL then begin
          if Qry.FieldValues['service_perusahaan_id']=1 then begin

            cbServicePerusahaan.Checked:=True;
            StrQry:='EXECUTE GetViewBiayaTambahanCustomer @vCustomerOrderID ='+QuotedStr(edtIDCustOrder.Text);
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            vCountGridFeeAddCust:=1;
            Qry.First;
            if Qry.RecordCount>0 then begin
              strgridBiayaTambahanCustomer.RowCount:=Qry.RecordCount+1;
              while Not(Qry.Eof) do begin
                if Qry.FieldValues['remark']<>NULL then
                strgridBiayaTambahanCustomer.Cells[0,vCountGridFeeAddCust]:=Qry.FieldValues['remark'];

                if Qry.FieldValues['jumlah_armada']<>NULL then
                strgridBiayaTambahanCustomer.Cells[1,vCountGridFeeAddCust]:=Qry.FieldValues['jumlah_armada'];

                if Qry.FieldValues['fee_add_customer_data_id']<>NULL then begin

                   if Qry.FieldValues['fee_add_customer_data_id']=215 then begin
                      edtLain1.Text:=Qry.FieldValues['fee_add_customer_data_data1'];
                      edtLain2.Text:=Qry.FieldValues['fee_add_customer_data_data2'];
                   end;

                   if Qry.FieldValues['fee_add_customer_data_id']=212 then begin
                      //edtCariSopir2.Enabled:=True;
                      DataIDDuaDriver:='212';
                   end;// else begin
                       //edtCariSopir2.Enabled:=False;
                       //end;

                  {
                  if Qry.FieldValues['fee_add_customer_data_id']=212 then begin
                    edtCariSopir2.Enabled:=True;
                  end else begin
                    edtCariSopir2.Enabled:=False;
                  end;

                  if Qry.FieldValues['fee_add_customer_data_id']=215 then begin
                    edtLain1.Enabled:=True;
                    edtLain2.Enabled:=True;
                  end else begin
                    edtLain1.Enabled:=False;
                    edtLain2.Enabled:=False;
                  end;
                  }
                end;

                if Qry.FieldValues['fee_add_customer_data_id']<>NULL then
                strgridBiayaTambahanCustomer.Cells[3,vCountGridFeeAddCust]:=Qry.FieldValues['fee_add_customer_data_id'];
                
                Inc(vCountGridFeeAddCust);
                Qry.Next;
              end;
            end;
          end;
        end;



    end;

    Main.CloseDb;
    FreeAndNil(Qry);


  end;

end;

procedure TReservedOrder.RefreshDataIDWilayahKota;
var
  Qry:TADOQuery;
  Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT city_zone_id, remark FROM wh_city_zone';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(WilayahKotaArr,1);
      WilayahKotaArr[0][0]:='';
      WilayahKotaArr[0][1]:='';
      Count:=1;
      while Not(Qry.Eof) do begin
          SetLength(WilayahKotaArr,Length(WilayahKotaArr)+1);
          WilayahKotaArr[Count][0]:=Qry.FieldValues['city_zone_id'];
          WilayahKotaArr[Count][1]:=Qry.FieldValues['remark'];

          Inc(Count);
        //end;
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;


end;


procedure TReservedOrder.FormShow(Sender: TObject);
begin
  if Event='T' then begin

    //btnBersih.Enabled:=False;
    //RefreshDataIDWilayahKota;
    //RefreshCmbDataIDWilayahKota;
    //pnlDisplayH.Enabled:=False;
    //pnlDisplayD.Enabled:=False;


  end else
  if Event='U' then begin

    //btnSimpanH.Enabled:=True;
    //btnBersih.Enabled:=False;
    //pnlDisplayH.Enabled:=False;
    //pnlDisplayD.Enabled:=False;




  end;
  if Event='L' then begin

    //btnSimpanH.Enabled:=False;
    //btnBersih.Enabled:=False;
    //btnCariIDOrderPelanggan.Enabled:=False;
    //btnCariIDPegawai.Enabled:=False;
    //btnCariIDkendaraan.Enabled:=False;
    //cbkActivasi.Enabled:=False;
    //EnableDataFalseHeader;

    //btnSimpanH.Enabled:=True;
    pnlDisplayH.Enabled:=False;
    pnlDisplayD.Enabled:=False;

    btnSimpanH.Enabled:=False;
    btnRefresh.Enabled:=False;
    btnBersih.Enabled:=False;

    //edtIDOrderPelanggan.Enabled:=True;
    //edtnamaPelanggan.Enabled:=True;

    //edtIDKendaraan.Enabled:=True;
    //edtNamaKendaraan.Enabled:=True;

    //cbkActivasi.Enabled:=True;
    //pnlDisplayH.Enabled:=False;

    pnlDisplayH.Enabled:=False;
    pnlDisplayD.Enabled:=False;

    btnSimpanH.Enabled:=False;
    btnRefresh.Enabled:=False;
    btnBersih.Enabled:=False;


  end;

end;

procedure TReservedOrder.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TReservedOrder.ButtonBersihData;
begin

  if Event='T' then begin
    btnSimpanH.Enabled:=True;
    //btnBersih.Enabled:=False;
    //btnTambahD.Enabled:=False;
    //btnSimpanD.Enabled:=False;

    //EnableDataTrueHeader;
    ClearDataHeader;
    ClearDataDetail;


  end else
  if Event='U' then begin
    ClearDataHeader;
    ClearDataDetail;
    //Close;

  end;



end;


procedure TReservedOrder.btnBersihClick(Sender: TObject);
begin
   ButtonBersihData;
   {
   if Event='T' then begin
     ButtonBersihData;
   end else
   if Event='U' then begin
     Close;
   end;
   }

  
end;

procedure TReservedOrder.btnCariCustomerIDClick(Sender: TObject);
begin
  CustomerOrderSearch:=TCustomerOrderSearch.Create(Self,'','ReservedOrderU');
end;

procedure TReservedOrder.edtCariSopir1Exit(Sender: TObject);
begin
  if edtCariSopir1.Text<>'' then begin
    edtCariSopir1.Text:=edtCariSopir1.Text;
    GridNamaProduct.Cells[8,GridNamaProduct.Row]:= edtCariSopir1.Text;
    //if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    //GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtCariSopir1.Visible := False;
  edtCariSopir1.Text:='';
  //GridNamaProduct.SetFocus;
end;

procedure TReservedOrder.edtCariSopir1Enter(Sender: TObject);
begin
  if edtCariSopir1.Text<>'' then
  edtCariSopir1.Text;
  
end;

procedure TReservedOrder.edtCariSopir1KeyPress(Sender: TObject;
  var Key: Char);
begin

  if (Key=#13) then begin
    edtCariSopir1Exit(nil);
    EmployeeSearch1:=TEmployeeSearch1.Create(Self,'','ReservedOrderU','');

    //GridNamaProduct.Col:=0;
  end;

  if (Key=#27) then begin
    edtCariSopir1Exit(nil);
  end;

end;

procedure TReservedOrder.GridNamaProductSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin

  //Cari Armada
  if (ACol = 7) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtCariArmada do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        //SetFocus;
      end;

  end;

  //Cari Sopir 1
  if (ACol = 8) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtCariSopir1 do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        //SetFocus;
      end;

  end;

  //Cari Sopir 2
  if (ACol = 9) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtCariSopir2 do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        //SetFocus;
      end;

  end;

  CanSelect := True;



end;


procedure TReservedOrder.edtCariArmadaEnter(Sender: TObject);
begin
  if edtCariArmada.Text<>'' then
  edtCariArmada.Text;
end;

procedure TReservedOrder.edtCariArmadaExit(Sender: TObject);
begin
  if edtCariArmada.Text<>'' then begin
    edtCariArmada.Text:=edtCariArmada.Text;
    GridNamaProduct.Cells[7,GridNamaProduct.Row]:= edtCariArmada.Text;
    //if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    //GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtCariArmada.Visible := False;
  edtCariArmada.Text:='';
  //GridNamaProduct.SetFocus;
end;

procedure TReservedOrder.edtCariArmadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    edtCariArmadaExit(nil);
    VehicleSearch:=TVehicleSearch.Create(Self,'','ReservedOrderU');

    //GridNamaProduct.Col:=0;
  end;

  if (Key=#27) then begin
    edtCariArmadaExit(nil);
  end;

end;


procedure TReservedOrder.edtIDCustOrderChange(Sender: TObject);
var
  Qry:TADOQuery;
  Count,vDataJumRecord:integer;
  vCountGridFeeAddCust:integer;
begin
  if Event='T' then begin
      if Main.OpenDb then begin
        Qry:=TADOQuery.Create(nil);
        Qry.Connection:=Main.MyConnection;

        StrQry:='EXECUTE GetReservedAndCustOrderWHDCOne @vCustomerOrderID ='+QuotedStr(edtIDCustOrder.Text);

        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;

        if Qry.FieldValues['sales_id']<>NULL then
        edtSales.Text:=Qry.FieldValues['sales_id'];

        if Qry.FieldValues['customer_id']<>NULL then
        edtCustomerID.Text:=Qry.FieldValues['customer_id'];

        if Qry.FieldValues['nama_customer']<>NULL then
        edtNamaCustomer.Text:=Qry.FieldValues['nama_customer'];

        if Qry.FieldValues['contact_person_id']<>NULL then
        edtPICID.Text:=Qry.FieldValues['contact_person_id'];

        if Qry.FieldValues['nama_pic']<>NULL then
        edtNamaPIC.Text:=Qry.FieldValues['nama_pic'];

        if Qry.FieldValues['contract']<>NULL then
          DtStatusKontrak:=Qry.FieldValues['contract'];
          if DtStatusKontrak='0'  then
          //cmbStatusKontrak.Text:='Tidak' else
          cbkKontrak.Checked:=False else
          if DtStatusKontrak='1' then
          //cmbStatusKontrak.Text:='Ya';
          cbkKontrak.Checked:=True;

        if Qry.FieldValues['no_contract']<>NULL then
        edtKontrakID.Text:=trim(Qry.FieldValues['no_contract']);

        Count:=2;
        vDataJumRecord:=0;
        if Qry.RecordCount>0 then begin
          GridNamaProduct.RowCount:=Qry.RecordCount+2;
            while Not(Qry.Eof) do begin
              vDataJumRecord:=vDataJumRecord+1;

              if Qry.FieldValues['nama_product']<>NULL then
              GridNamaProduct.Cells[0,Count]:=Qry.FieldValues['nama_product'];

              if Qry.FieldValues['date_form']<>NULL then
              GridNamaProduct.Cells[1,Count]:=Qry.FieldValues['date_form'];

              if Qry.FieldValues['destination']<>NULL then
              GridNamaProduct.Cells[2,Count]:=Qry.FieldValues['destination'];

              if Qry.FieldValues['location_penjemputan']<>NULL then
              GridNamaProduct.Cells[3,Count]:=Qry.FieldValues['location_penjemputan'];

              if Qry.FieldValues['jam_stand_by']<>NULL then
              GridNamaProduct.Cells[4,Count]:=Qry.FieldValues['jam_stand_by'];

              if Qry.FieldValues['long_day_use']<>NULL then
              GridNamaProduct.Cells[5,Count]:=Qry.FieldValues['long_day_use'];

              if Qry.FieldValues['seat']<>NULL then
              GridNamaProduct.Cells[6,Count]:=Qry.FieldValues['seat'];

              if Qry.FieldValues['customer_order_detail_id']<>NULL then
              GridNamaProduct.Cells[13,Count]:=Qry.FieldValues['customer_order_detail_id'];


              Inc(Count);
              Qry.Next;
            end;
        end;

        if Qry.FieldValues['service_perusahaan_id']<>NULL then begin
          if Qry.FieldValues['service_perusahaan_id']=1 then begin

            cbServicePerusahaan.Checked:=True;
            StrQry:='EXECUTE GetViewBiayaTambahanCustomer @vCustomerOrderID ='+QuotedStr(edtIDCustOrder.Text);
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            vCountGridFeeAddCust:=1;
            Qry.First;
            if Qry.RecordCount>0 then begin
              strgridBiayaTambahanCustomer.RowCount:=Qry.RecordCount+1;
              while Not(Qry.Eof) do begin
                if Qry.FieldValues['remark']<>NULL then
                strgridBiayaTambahanCustomer.Cells[0,vCountGridFeeAddCust]:=Qry.FieldValues['remark'];

                if Qry.FieldValues['jumlah_armada']<>NULL then
                strgridBiayaTambahanCustomer.Cells[1,vCountGridFeeAddCust]:=Qry.FieldValues['jumlah_armada'];

                if Qry.FieldValues['fee_add_customer_data_id']<>NULL then begin

                   if Qry.FieldValues['fee_add_customer_data_id']=215 then begin
                      edtLain1.Text:=Qry.FieldValues['fee_add_customer_data_data1'];
                      edtLain2.Text:=Qry.FieldValues['fee_add_customer_data_data2'];
                   end;

                   if Qry.FieldValues['fee_add_customer_data_id']=212 then begin
                      //edtCariSopir2.Enabled:=True;
                      DataIDDuaDriver:='212';
                   end else begin
                      //edtCariSopir2.Enabled:=False;
                  end;

                end;

                if Qry.FieldValues['fee_add_customer_data_id']<>NULL then
                strgridBiayaTambahanCustomer.Cells[3,vCountGridFeeAddCust]:=Qry.FieldValues['fee_add_customer_data_id'];

                Inc(vCountGridFeeAddCust);
                Qry.Next;
              end;

            end;
          end;
        end;



      end;
      mJumlahData.Text:=IntToStr(vDataJumRecord);
      FreeAndNil(Qry);
      Main.CloseDb;
  end;





end;

procedure TReservedOrder.edtIDWilayahKotaChange(Sender: TObject);
begin
  GridNamaProduct.Cells[8,GridNamaProduct.Row]:= edtIDWilayahKota.Text;
end;

procedure TReservedOrder.edtCariSopir2Enter(Sender: TObject);
begin
  if edtCariSopir2.Text<>'' then
  edtCariSopir2.Text;
end;

procedure TReservedOrder.edtCariSopir2Exit(Sender: TObject);
begin
   if edtCariSopir2.Text<>'' then begin
    edtCariSopir2.Text:=edtCariSopir2.Text;
    GridNamaProduct.Cells[9,GridNamaProduct.Row]:= edtCariSopir2.Text;
    //if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    //GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtCariSopir2.Visible := False;
  edtCariSopir2.Text:='';
  //GridNamaProduct.SetFocus;
end;

procedure TReservedOrder.edtCariSopir2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
      edtCariSopir2Exit(nil);

      if  DataIDDuaDriver='212' then begin
        EmployeeSearch1:=TEmployeeSearch1.Create(Self,'','ReservedOrderU',DataIDDuaDriver);
      end else begin
        MessageDlg('Tidak Ada Permintaan Dua Sopir',mtInformation,[mbOK],0);
      end;

    //GridNamaProduct.Col:=0;
  end;

  if (Key=#27) then begin
    edtCariSopir2Exit(nil);
  end;
end;

end.
