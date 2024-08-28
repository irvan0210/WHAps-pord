unit ReceivePaymentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, QRCtrls, QuickRpt, ExtCtrls;

type
  TPaymentReceiveForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    GroupKaryawan: TGroupBox;
    StrGrid: TStringGrid;
    GroupDetail: TGroupBox;
    Nama: TEdit;
    Label1: TLabel;
    Hutang: TEdit;
    Label5: TLabel;
    Report: TQuickRep;
    QRBand2: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QLabelKaryawan: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTandaKasir: TQRLabel;
    QLabelHutangMitra: TQRLabel;
    QLabelHutangMitra2: TQRLabel;
    QDiterima: TQRLabel;
    QRShape5: TQRShape;
    QHutang: TQRLabel;
    QRShape4: TQRShape;
    QLabelForm: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel40: TQRLabel;
    QLabelTabungan: TQRLabel;
    QRpTabungan: TQRLabel;
    QTabungan: TQRLabel;
    QRBand3: TQRBand;
    QAmount: TQRDBText;
    QRLabel45: TQRLabel;
    QNama: TQRDBText;
    QRBand1: TQRBand;
    QJudul: TQRLabel;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QLabelNoNIK: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QNoSlip: TQRLabel;
    QNoNIK: TQRLabel;
    QKaryawan: TQRLabel;
    QTanggal: TQRLabel;
    QJam: TQRLabel;
    QLabelLokasi: TQRLabel;
    QLocation: TQRLabel;
    QAlamat: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QPenerima: TQRLabel;
    GroupPembayaran: TGroupBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    TotalDiterima: TEdit;
    Cari: TEdit;
    Label4: TLabel;
    Tabungan: TEdit;
    Label6: TLabel;
    NoNIK: TComboBox;
    LabelNIK: TLabel;
    GridBiaya: TStringGrid;
    JenisPembayaran: TComboBox;
    Jumlah: TEdit;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QOnRisk: TQRLabel;
    QLabelJaminan: TQRLabel;
    QLabelLaka: TQRLabel;
    QRpLaka: TQRLabel;
    QLaka: TQRLabel;
    QRpJaminan: TQRLabel;
    QJaminan: TQRLabel;
    GroupKeterangan: TGroupBox;
    Keterangan: TMemo;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QTilang: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QKeterangan: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QSeragam: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QPinjamanKhusus: TQRLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumlahKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NoNIKChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure JenisPembayaranChange(Sender: TObject);
    procedure JumlahEnter(Sender: TObject);
    procedure JumlahExit(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure GridBiayaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JenisPembayaranKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure NoNIKKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EmplId,EmplCode,TransId:String;
    EmplType,RowSelect:Integer;
    EmplArr,BiayaArr:Array of TArrString10;
    IntReguler:Integer;
    procedure Init;
    procedure InitCombo;
    procedure RefreshData;
    procedure RefreshCombo;
    procedure SetEmpl;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure PreparePrintData;
    procedure Calculate;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='');Overload;
  end;

var
  PaymentReceiveForm: TPaymentReceiveForm;

implementation

uses MainU, RePrintFormU, DB;

{$R *.dfm}

constructor TPaymentReceiveForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='');
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    EmplCode:='BS';
  end else begin
    EmplType:=3;
    EmplCode:='';
  end;
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;

procedure TPaymentReceiveForm.Init;
begin
  if StrToInt(CompanyId)=1 then begin
    LabelNIK.Caption:='No NIK';
    QLabelNoNIK.Caption:='No NIK';
    QJudul.Caption:='SLIP PEMBAYARAN KARYAWAN';
    QLabelLokasi.Caption:='Office';
    QLabelHutangMitra.Caption:='';
    QLabelHutangMitra2.Caption:='';
    QLabelTabungan.Caption:='';
    QLabelJaminan.Caption:='';
    QHutang.Caption:='';
    QTabungan.Caption:='';
    QLabelForm.Caption:='No Form : FR/WHG/001';
  end else if StrToInt(CompanyId)=2 then begin
    LabelNIK.Caption:='No Id Driver';
    QLabelNoNIK.Caption:='No NIK';
    QJudul.Caption:='SLIP PEMBAYARAN KARYAWAN';
    QLabelLokasi.Caption:='Pool';
    QLabelHutangMitra.Caption:='';
    QLabelHutangMitra2.Caption:='';
    QLabelTabungan.Caption:='';
    QLabelJaminan.Caption:='';
    QHutang.Caption:='';
    QTabungan.Caption:='';
    QLabelForm.Caption:='No Form : FR/WHDC/001';
  end else if StrToInt(CompanyId)=3 then begin
    QLabelNoNIK.Caption:='No KPP';
    QJudul.Caption:='SLIP PEMBAYARAN MITRA';
    QLabelLokasi.Caption:='Pool';
    QLabelForm.Caption:='No Form : FR/WHET/003';
  end;
  NoNIK.Text:='';
  NoNIK.ItemIndex:=-1;
  NoNIK.Items.Clear;
  TransId:='';
  Nama.Text:='';
  Hutang.Text:='';
  Tabungan.Text:='';
  TotalDiterima.Text:='';
  RowSelect:=0;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='NIK';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[3,0]:='Alamat';
  StrGrid.Cells[4,0]:='Telp';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
//  GridBiaya.RowCount:=2;
  GridBiaya.Cells[0,0]:='            Jenis Pembayaran';
  GridBiaya.Cells[1,0]:='      Jumlah';
  GridBiaya.Cells[0,1]:='';
  GridBiaya.Cells[1,1]:='';
  GroupPembayaran.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  QHutang.Caption:='';
  QTabungan.Caption:='';
  QJaminan.Caption:='';
  QLaka.Caption:='';
  QOnRisk.Caption:='';
  QTilang.Caption:='';
  QSeragam.Caption:='';
  QPinjamanKhusus.Caption:='';
  IntReguler:=0;
end;

procedure TPaymentReceiveForm.InitCombo;
begin
  JenisPembayaran.Clear;
  JenisPembayaran.Visible:=False;
  JenisPembayaran.Text:='Pilih Pembayaran';
  Jumlah.Text:='';
  Jumlah.Visible:=False;
end;

procedure TPaymentReceiveForm.RefreshData;
var Qry:TADOQuery;
    StrQry,StrLocation:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (StrToInt(LocationId)>1) then StrLocation:=','+LocationId else StrLocation:=',0';
    StrQry:='EXEC GetEmployeeListPlus '+IntToStr(EmplType)+StrLocation+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then SetLength(EmplArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      EmplArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      EmplArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['birth']<>NULL then
        EmplArr[IntCount][2]:=Qry.FieldValues['birth'];
      if Qry.FieldValues['address']<>NULL then
        EmplArr[IntCount][3]:=Qry.FieldValues['address'];
      EmplArr[IntCount][4]:=Qry.FieldValues['join_date'];
      if Qry.FieldValues['phone']<>NULL then
      EmplArr[IntCount][5]:=Qry.FieldValues['phone'];
      EmplArr[IntCount][6]:=Qry.FieldValues['debt'];
      EmplArr[IntCount][7]:=Qry.FieldValues['saving'];
      EmplArr[IntCount][8]:=Qry.FieldValues['reguler'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetTransactionType Mitra';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(BiayaArr,1);
      BiayaArr[0][0]:='';
      BiayaArr[0][1]:=' ';
      BiayaArr[0][2]:='0';
      BiayaArr[0][3]:='';
      BiayaArr[0][4]:='';
      BiayaArr[0][5]:='';
      BiayaArr[0][6]:='';
      BiayaArr[0][7]:='';
      BiayaArr[0][8]:='';
      BiayaArr[0][9]:='';
      BiayaArr[0][10]:='';
      IntCount:=1;
      while Not(Qry.Eof) do begin
        if Qry.FieldValues['display']=1 then begin
          SetLength(BiayaArr,Length(BiayaArr)+1);
          BiayaArr[IntCount][0]:=Qry.FieldValues['transaction_type_id'];
          BiayaArr[IntCount][1]:=Qry.FieldValues['name_detail'];
          BiayaArr[IntCount][2]:=Qry.FieldValues['amount'];
          BiayaArr[IntCount][3]:=Qry.FieldValues['discount'];
          BiayaArr[IntCount][4]:=Qry.FieldValues['discount_percent'];
          BiayaArr[IntCount][5]:=Qry.FieldValues['tax'];
          BiayaArr[IntCount][6]:=Qry.FieldValues['transaction_obj_id'];
          BiayaArr[IntCount][7]:=Qry.FieldValues['value'];
          BiayaArr[IntCount][8]:=Qry.FieldValues['display'];
          BiayaArr[IntCount][9]:=Qry.FieldValues['non_cash'];
          BiayaArr[IntCount][10]:=Qry.FieldValues['calculate'];
          Inc(IntCount);
        end;
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPaymentReceiveForm.RefreshCombo;
var IntCount:Integer;
begin
  Cari.Text:='';
  if Length(EmplArr)>0 then StrGrid.RowCount:=Length(EmplArr)+1;
  NoNIK.Items.Clear;
  for IntCount:=0 to Length(EmplArr)-1 do begin
    NoNIK.Items.Add(EmplArr[IntCount][0]);
    StrGrid.Cells[0,IntCount+1]:=EmplArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=EmplArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=EmplArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=EmplArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=EmplArr[IntCount][5];
  end;
  JenisPembayaran.Items.Clear;
  for IntCount:=0 to Length(BiayaArr)-1 do
    JenisPembayaran.Items.Add(BiayaArr[IntCount][1]);
end;

procedure TPaymentReceiveForm.SelesaiClick(Sender: TObject);
begin
  PaymentReceiveForm.Close;
end;

procedure TPaymentReceiveForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPaymentReceiveForm.JumlahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    JumlahExit(nil);
    if GridBiaya.Row=GridBiaya.RowCount-1 then GridBiaya.RowCount:=GridBiaya.RowCount+1;
    GridBiaya.Row:=GridBiaya.Row+1;
    GridBiaya.Col:=0;
  end;
  if (Key=#27) then begin
    JumlahExit(nil);
  end;
end;

procedure TPaymentReceiveForm.FormShow(Sender: TObject);
begin
  Init;
  InitCombo;
  RefreshData;
  RefreshCombo;
end;

procedure TPaymentReceiveForm.SetEmpl;
var Count:Integer;
begin
  if Trim(NoNIK.Text)<>'' then begin
    for Count:=1 to StrGrid.RowCount-1 do begin
      GridBiaya.Cells[0,Count]:='';
      GridBiaya.Cells[1,Count]:='';
    end;
    Nama.Text:=EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][1];
    if StrToInt(EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][6])>0 then Hutang.Text:=SToCurr(EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][6])
    else if StrToInt(EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][6])<0 then Hutang.Text:='('+IToCurr(0-StrToInt(EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][6]))+')'
    else Hutang.Text:='0';
    if EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][8]='1' then IntReguler:=1 else IntReguler:=0;
    Tabungan.Text:=IToCurr(0-StrToInt(EmplArr[ArrayIndexOf(EmplArr,NoNIK.Text,0)][7]));
    GroupPembayaran.Enabled:=True;
    GroupKeterangan.Enabled:=True;
    TotalDiterima.Text:='0';
  end;
end;

procedure TPaymentReceiveForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  RowSelect:=ARow;
end;

procedure TPaymentReceiveForm.NoNIKChange(Sender: TObject);
begin
  SetEmpl;
end;

procedure TPaymentReceiveForm.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 8 do
      if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 8 do
          StrGrid.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
          NoNIK.Items.Add(EmplArr[Count][0])
      end;
    end;
  end else
    RefreshCombo;
end;

procedure TPaymentReceiveForm.JenisPembayaranChange(Sender: TObject);
begin
    GridBiaya.Cells[0,GridBiaya.Row]:=JenisPembayaran.Items[JenisPembayaran.ItemIndex];
    if JenisPembayaran.ItemIndex>0 then begin
       GridBiaya.Cells[1,GridBiaya.Row]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,JenisPembayaran.Text,1)][2]);
      if GridBiaya.Row=GridBiaya.RowCount-1 then begin
        GridBiaya.RowCount:=GridBiaya.RowCount+1;
      end;
    end else if JenisPembayaran.ItemIndex=0 then GridBiaya.Cells[1,GridBiaya.Row]:='';
    JenisPembayaran.Visible:= False;
    JenisPembayaran.Text:='';
    JenisPembayaran.ItemIndex:=0;
    GridBiaya.SetFocus;
    Calculate;
end;

procedure TPaymentReceiveForm.JumlahEnter(Sender: TObject);
begin
  if Trim(Jumlah.Text)<>'' then ToString(Jumlah.Text);
end;

procedure TPaymentReceiveForm.JumlahExit(Sender: TObject);
begin
  if ToString(Jumlah.Text)<>'' then begin
    Jumlah.Text:=SToCurr(ToString(Jumlah.Text));
    GridBiaya.Cells[1,GridBiaya.Row]:= Jumlah.Text;
    if GridBiaya.Row=GridBiaya.RowCount-1 then GridBiaya.RowCount:=GridBiaya.RowCount+1;
  end;
  Jumlah.Visible := False;
  Jumlah.Text:='';
  GridBiaya.SetFocus;
  Calculate;
end;

procedure TPaymentReceiveForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransCode,StrTotal,StrMsg,StrEMsg,Amount,StrDebt,StrEmplHoldId,StrTransHold,StrRemark:String;
    IntCount,TotalHoldDebt:Integer;
    IsOk,IsPrint:Boolean;
begin
  if (Trim(NoNIK.Text)<>'') AND (Trim(GridBiaya.Cells[0,1])<>'')  then begin
    Main.M_Busy;
    StrEMsg:='';
    IsOk:=True;
    IsPrint:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrEmplHoldId:='';
    if Keterangan.Text<>'' then StrRemark:=QuotedStr(Trim(Keterangan.Text)) else StrRemark:='NULL';   
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT dbo.GetDebt('+Chr(39)+NoNIK.Text+Chr(39)+') AS amount;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      StrDebt:=Qry.FieldValues['amount'];
      Qry.Close;
      StrQry:='SELECT * FROM wh_empl_hold WHERE employee_id='+QuotedStr(NoNIK.Text)+' AND form_name='+QuotedStr('SSM')+' and status=1;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_hold_id']<>NULL then begin
        StrEmplHoldId:=Qry.FieldValues['empl_hold_id'];
        if Qry.FieldValues['value']<>NULL then
          TotalHoldDebt:=Qry.FieldValues['value']
        else
          TotalHoldDebt:=0;
        if Qry.FieldValues['transaction_type_id']<>NULL then
          StrTransHold:=Qry.FieldValues['transaction_type_id']
        else
          StrTransHold:='';
      end else begin
        StrEmplHoldId:='';
        TotalHoldDebt:=0;
        StrTransHold:='';
      end;
      Qry.Close;
      StrQry:='SELECT RIGHT(MAX(empl_transaction_id),4) AS empl_transaction_id FROM wh_empl_transaction '+
            'WHERE empl_transaction_id  LIKE '+Chr(39)+'SPM'+LocationCode+
            FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
            '____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_transaction_id']<>NULL then begin
        TransId:=Qry.FieldValues['empl_transaction_id'];
        TransId:=Format('%.*d',[4,StrToInt(TransId)+1]);
      end else
        TransId:='0001';
      Qry.Close;
      Qry.SQL.Clear;
      TransId:='SPM'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      StrQry:='INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,remark,update_user)'+
              ' VALUES ('+Chr(39)+TransId+Chr(39)+','+Chr(39)+NoNIK.Text+Chr(39)+','+Chr(39)+TransId+Chr(39)+
              ',GETDATE(),'+StrRemark+','+QuotedStr(User)+');';
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        On E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      StrQry:='';
      IntCount:=1;
      repeat
        StrTransCode:=BiayaArr[ArrayIndexOf(BiayaArr,GridBiaya.Cells[0,IntCount],1)][0];
        Amount:=ToString(IToCurr(0-SToInt(GridBiaya.Cells[1,IntCount])));
        if (BiayaArr[ArrayIndexOf(BiayaArr,GridBiaya.Cells[0,IntCount],1)][10])='1' then
          StrTotal:=Amount
        else
          StrTotal:=StrDebt;
        StrQry:=StrQry+'INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id,amount,total,update_user)'+
              ' VALUES ('+Chr(39)+TransId+Chr(39)+','+StrTransCode+','+Amount+
              ','+StrTotal+','+Chr(39)+User+Chr(39)+');';
        if (StrEmplHoldId<>'') AND (StrTransHold=StrTransCode) then begin
          if SToInt(Amount)+TotalHoldDebt<=0 then
            StrQry:=StrQry+' UPDATE wh_empl_hold SET value=0,status=0 WHERE empl_hold_id='+Chr(39)+StrEmplHoldId+Chr(39)+'; '
          else
            StrQry:=StrQry+' UPDATE wh_empl_hold SET value='+IntToStr(TotalHoldDebt+SToInt(Amount))+' WHERE empl_hold_id='+Chr(39)+StrEmplHoldId+Chr(39)+'; '
        end;
        Inc(IntCount);
      until (IntCount>GridBiaya.RowCount) OR (GridBiaya.Cells[1,IntCount]='');
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan SPJ transaksi Detail';
          StrEMsg:=E.Message;
          IsOk:=False;
        end
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        if MessageBox(0,'Pembayaran Berhasil Disimpan'+Chr(13)+Chr(13)+'    Cetak Slip ?','Pembayaran',MB_OKCANCEL or MB_ICONQUESTION)=1 then IsPrint:=True;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal Menyimpan Pembayaran'+StrEMsg),'Pembayaran',MB_OK or MB_ICONERROR)
      end;
      Main.M_Normal;
      if IsPrint then begin
        RePrintForm.ReportName:='Slip Setoran/Pembayaran';
        RePrintForm.ReportId:=TransId;
        if RePrintForm.ShowModal=1 then begin
          PreparePrint;
          PreparePrintData;
          StrQry:='SELECT REPLACE(REPLACE(PARSENAME(CONVERT(VARCHAR,CONVERT(money,a.amount),1),2),'+
                  Chr(39)+','+Chr(39)+','+Chr(39)+'.'+Chr(39)+'),'+Chr(39)+'-'+Chr(39)+','+Chr(39)+''+Chr(39)+') AS amount'+
                  ',(b.name)+COALESCE(b.details,'+Chr(39)+Chr(39)+') AS name '+
                  ' FROM  wh_empl_transaction_detail a'+
                  ' INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id'+
                  ' WHERE a.empl_transaction_id='+Chr(39)+TransId+Chr(39)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Report.DataSet:=Qry;
          QNama.DataSet:=Qry;
          QAmount.DataSet:=Qry;
          Report.Prepare;
          Report.Preview;
          Qry.Close;
        end;
      end;
      Main.CloseDb;
    end;
  end else
    if Trim(NoNIK.Text)='' then
      MessageBox(0,PChar('Silahkan Input Mitra/Karyawan'),'Pembayaran',MB_OK or MB_ICONWARNING)
    else
      MessageBox(0,PChar('Silahkan Masukkan Transaksi'),'Pembayaran',MB_OK or MB_ICONWARNING)
end;

procedure TPaymentReceiveForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitCombo;
  RefreshData;
  RefreshCombo;
  EnableInput;
  Cari.SetFocus;
end;

procedure TPaymentReceiveForm.GridBiayaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) and (ARow >0) then begin
    R := GridBiaya.CellRect(ACol, ARow);
    R.Left := R.Left + GridBiaya.Left+GroupPembayaran.Left;
    R.Right := R.Right + GridBiaya.Left+GroupPembayaran.Left;
    R.Top := R.Top + GridBiaya.Top+GroupPembayaran.Top;
    R.Bottom := R.Bottom + GridBiaya.Top+GroupPembayaran.Top;
    with JenisPembayaran do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(GridBiaya.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(GridBiaya.Cells[ACol,ARow]);
    end;
  end;
  if (ACol = 1) and (ARow > 0) then begin
    if ( (GridBiaya.Cells[1,ARow]='') OR (GridBiaya.Cells[1,ARow]='0') ) then begin
      R := GridBiaya.CellRect(ACol, ARow);
      R.Left := R.Left + GridBiaya.Left+GroupPembayaran.Left;
      R.Right := R.Right + GridBiaya.Left+GroupPembayaran.Left;
      R.Top := R.Top + GridBiaya.Top+GroupPembayaran.Top;
      R.Bottom := R.Bottom + GridBiaya.Top+GroupPembayaran.Top;
      with Jumlah do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridBiaya.Cells[ACol,ARow])<>'' then Text:=ToString(GridBiaya.Cells[ACol,ARow]);
        BringToFront;
        SetFocus;
      end;
    end else begin
      GroupPembayaran.SetFocus;
    end;
  end;
  CanSelect := True;
end;

procedure TPaymentReceiveForm.Calculate;
var Total,IntCount:Integer;
begin
  Total:=0;
  for IntCount:=1 to GridBiaya.RowCount do begin
    if (Trim(GridBiaya.Cells[0,IntCount])<>'') then begin
      if (GridBiaya.Cells[1,IntCount]<>'0') AND (GridBiaya.Cells[1,IntCount]<>'') then
        Total:=Total+SToInt(GridBiaya.Cells[1,IntCount]);
      if BiayaArr[ArrayIndexOf(BiayaArr,GridBiaya.Cells[0,IntCount],1)][10]='1' then
        if Trim(Hutang.Text)<>'' then
//        SisaHutang.Text:=IToCurr(SToInt(Hutang.Text)-SToInt(GridBiaya.Cells[1,IntCount]));
    end;
  end;
  TotalDiterima.Text:=IToCurr(Total);

end;

procedure TPaymentReceiveForm.JenisPembayaranKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    JenisPembayaranChange(nil);
    GridBiaya.Col:=1; 
  end;
end;

procedure TPaymentReceiveForm.DisableInput;
begin
  NoNIK.Enabled:=False;
  GroupPembayaran.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  GroupKaryawan.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TPaymentReceiveForm.EnableInput;
begin
  NoNIK.Enabled:=True;
//  GroupPembayaran.Enabled:=True;
  GroupKaryawan.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TPaymentReceiveForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE location_id='+Chr(39)+LocationId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QLocation.Caption:=Qry.FieldValues['location'];
      QAlamat.Caption:=Qry.FieldValues['address'];
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  if IntReguler=0 then begin
    QLabelLaka.Caption:='Hutang Laka';
    QLabelTabungan.Caption:='Total Tabungan';
    QLabelJaminan.Caption:='Jaminan';
    QRpLaka.Caption:=': Rp.';
    QRpTabungan.Caption:=': Rp.';
  end else begin
    QLabelLaka.Caption:='Tabungan Laka';
    QLabelTabungan.Caption:='Insentif Argo';
    QLabelJaminan.Caption:='';
    QRpLaka.Caption:=': Rp.';
    QRpTabungan.Caption:=': Rp.';
    QRpJaminan.Caption:='';
  end;
end;

procedure TPaymentReceiveForm.PreparePrintData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT CONVERT(VARCHAR(10),date,103) AS date,CONVERT(VARCHAR(5),date,108) AS time,remark '+
            'FROM wh_empl_transaction WHERE empl_transaction_id='+Chr(39)+TransId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QTanggal.Caption:=Qry.FieldValues['date'];
      QJam.Caption:=Qry.FieldValues['time'];
      if Qry.FieldValues['remark']<>NULL then QKeterangan.Caption:=Qry.FieldValues['remark']
      else QKeterangan.Caption:='';
    end;
    if StrToInt(CompanyId)=3 then begin
      Qry.Close;
      StrQry:='SELECT dbo.GetDebt('+Chr(39)+NoNIK.Text+Chr(39)+') AS total ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['total']>0 then QHutang.Caption:=SToCurr(Qry.FieldValues['total'])
        else if Qry.FieldValues['total']<0 then QHutang.Caption:='('+IToCurr(0-StrToInt(Qry.FieldValues['total']))+')'
        else QHutang.Caption:='0';
      end;
      Qry.Close;
      StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',3) AS total ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['total']>0 then QOnRisk.Caption:=SToCurr(Qry.FieldValues['total'])
        else QOnRisk.Caption:='0';
      end;
      Qry.Close;
      StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',7) AS total ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['total']>0 then QTilang.Caption:=SToCurr(Qry.FieldValues['total'])
        else QTilang.Caption:='0';
      end;
      Qry.Close;
      StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',6) AS total ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['total']>0 then QSeragam.Caption:=SToCurr(Qry.FieldValues['total'])
        else QSeragam.Caption:='0';
      end;
      Qry.Close;
      StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',8) AS total ;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        if Qry.FieldValues['total']>0 then QPinjamanKhusus.Caption:=SToCurr(Qry.FieldValues['total'])
        else QPinjamanKhusus.Caption:='0';
      end;
      Qry.Close;
      if IntReguler=0 then begin
        StrQry:='SELECT dbo.GetSaving('+Chr(39)+NoNIK.Text+Chr(39)+') AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']<>0 then QTabungan.Caption:=IToCurr(0-StrToInt(Qry.FieldValues['total']))
          else QTabungan.Caption:='0';
        end;
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',4) AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']>0 then QLaka.Caption:=SToCurr(Qry.FieldValues['total'])
          else QLaka.Caption:='0';
        end;
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',5) AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['total']<>NULL then begin
          QJaminan.Caption:=IToCurr(0-Qry.FieldValues['total']);
        end else
          QJaminan.Caption:='0';
        Qry.Close;
      end else begin
        StrQry:='SELECT dbo.GetTotalAmount('+QuotedStr(NoNIK.Text)+',4)+dbo.GetTotalAmount('+QuotedStr(NoNIK.Text)+',5)+dbo.GetSaving('+QuotedStr(NoNIK.Text)+')+dbo.GetTotalAmount('+QuotedStr(NoNIK.Text)+',9) AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']>0 then QLaka.Caption:=SToCurr(Qry.FieldValues['total'])
          else QLaka.Caption:=SToCurr(0-Qry.FieldValues['total']);
        end;
        Qry.Close;
          StrQry:='SELECT dbo.GetTotalAmount('+QuotedStr(NoNIK.Text)+',10) AS total ;';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['total']<>NULL then begin
            QTabungan.Caption:=IToCurr(0-Qry.FieldValues['total']);
          end else
            QTabungan.Caption:='0';
          Qry.Close;
      end;
    end;
    Qry.Close;
    QNoSlip.Caption:=TransId;
    QNoNik.Caption:=NoNIK.Text;
    QKaryawan.Caption:=Nama.Text;
    QTandaKasir.Caption:=User;
    QLabelKaryawan.Caption:=Nama.Text;
    QPenerima.Caption:=User;
    QDiterima.Caption:=TotalDiterima.Text;
    Main.CloseDb;
  end;

end;

procedure TPaymentReceiveForm.StrGridDblClick(Sender: TObject);
begin
  NoNIK.ItemIndex:=NoNIK.Items.IndexOf(StrGrid.Cells[0,RowSelect]);
  SetEmpl;  
end;

procedure TPaymentReceiveForm.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then PaymentReceiveForm.Close;
end;

procedure TPaymentReceiveForm.NoNIKKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then PaymentReceiveForm.Close;
end;

end.
