unit PaymentFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit, ExtCtrls, QRCtrls, QuickRpt, Grids;

type
  TPaymentForm = class(TForm)
    Pengeluaran: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Simpan: TButton;
    Batal: TButton;
    Bersihkan: TButton;
    GroupJumlah: TPanel;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel31: TQRLabel;
    QNoSlip: TQRLabel;
    QTanggal: TQRLabel;
    QJam: TQRLabel;
    QSejumlah: TQRLabel;
    QKeterangan: TQRLabel;
    QRLabel46: TQRLabel;
    QLocation: TQRLabel;
    QAlamat: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape8: TQRShape;
    QRBand2: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QTandaPenerima: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTandaKasir: TQRLabel;
    QRShape4: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QTanggal2: TQRLabel;
    QRLabel8: TQRLabel;
    QPenerima: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QTerbilang: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QPengeluaran: TQRLabel;
    CetakUlang: TButton;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QLabelLaka: TQRLabel;
    QLabelTabungan: TQRLabel;
    QLabelJaminan: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRpTabungan: TQRLabel;
    QRpJaminan: TQRLabel;
    QRpLaka: TQRLabel;
    QHutang: TQRLabel;
    QOnRisk: TQRLabel;
    QLaKa: TQRLabel;
    QTabungan: TQRLabel;
    QJaminan: TQRLabel;
    Label5: TLabel;
    GroupDetail: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Nama: TEdit;
    Cari: TEdit;
    GroupKaryawan: TGroupBox;
    StrGrid: TStringGrid;
    GroupKeterangan: TGroupBox;
    Keterangan: TMemo;
    GroupPenerima: TPanel;
    Internal: TRadioButton;
    Eksternal: TRadioButton;
    Label1: TLabel;
    NamaEksternal: TEdit;
    Label4: TLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QTilang: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel39: TQRLabel;
    QSeragam: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QPinjamanKhusus: TQRLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Hutang: TMemo;
    OnRisk: TMemo;
    Laka: TMemo;
    Tilang: TMemo;
    Label12: TLabel;
    Tabungan: TMemo;
    Jaminan: TMemo;
    Label13: TLabel;
    NoNIK: TEdit;
    Jumlah: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    InsentifA: TMemo;
    TabunganL: TMemo;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure PengeluaranChange(Sender: TObject);
    procedure JumlahEnter(Sender: TObject);
    procedure JumlahExit(Sender: TObject);
    procedure PenerimaKeyPress(Sender: TObject; var Key: Char);
    procedure PengeluaranKeyPress(Sender: TObject; var Key: Char);
    procedure JumlahKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure NoNIKChange(Sender: TObject);
    procedure NoNIKKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure InternalClick(Sender: TObject);
    procedure NamaEksternalKeyPress(Sender: TObject; var Key: Char);
    procedure EksternalClick(Sender: TObject);
    procedure InternalKeyPress(Sender: TObject; var Key: Char);
    procedure EksternalKeyPress(Sender: TObject; var Key: Char);
    procedure NamaEksternalChange(Sender: TObject);
  private
    { Private declarations }
    EmplId,EmplCode,TransId:String;
    EmplType,RowSelect,IntReguler:Integer;
    BiayaArr,EmplArr:Array of TArrString10;
    TransAccuGroupId:Integer;
    procedure Init;
    procedure InitCombo;
    procedure RefreshData;
    procedure RefreshCombo;
    procedure PreparePrint;
    procedure PreparePrintData;
    procedure DisableInput;
    procedure EnableInput;
    procedure SetEmpl;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='');Overload;
  end;

var
  PaymentForm: TPaymentForm;

implementation

uses MainU, StrUtils, PaymentReprintU;

{$R *.dfm}

constructor TPaymentForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String='');
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

procedure TPaymentForm.Init;
begin
  Internal.Checked;
  TransId:='';
  NamaEksternal.Text:='';
  NamaEksternal.Enabled:=False;
  NoNIK.Text:='';
  Nama.Text:='';
  Hutang.Text:='';
  Tabungan.Text:='';
  OnRisk.Text:='';
  Laka.Text:='';
  Tilang.Text:='';
  Jaminan.Text:='';  
  Keterangan.Lines.Clear;
  QHutang.Caption:='';
  QLaKa.Caption:='';
  QOnRisk.Caption:='';
  QTabungan.Caption:='';
  QJaminan.Caption:='';
  QTilang.Caption:='';
  QSeragam.Caption:='';
  QPinjamanKhusus.Caption:='';
  Pengeluaran.Enabled:=False;
  IntReguler:=0;
end;

procedure TPaymentForm.RefreshData;
var StrQry,StrLocation:String;
    Qry:TADOQuery;
    IntCount,IntCountPagi,IntCountMalam:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(EmplArr,0);
  if Main.OpenDb then begin
    if (StrToInt(LocationId)>1) then StrLocation:=','+LocationId else StrLocation:=',0';
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+';';
//    StrQry:='EXEC GetEmployeeListPlus '+IntToStr(EmplType)+StrLocation+';';
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
//      EmplArr[IntCount][6]:=Qry.FieldValues['debt'];
//      EmplArr[IntCount][7]:=Qry.FieldValues['saving'];
      EmplArr[IntCount][8]:=Qry.FieldValues['reguler'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetTransactionType '+Chr(39)+'Expense'+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(BiayaArr,Qry.RecordCount+1);
    BiayaArr[0][0]:='0';
    BiayaArr[0][1]:=' ';
    BiayaArr[0][2]:='';
    BiayaArr[0][3]:='';
    BiayaArr[0][4]:='';
    BiayaArr[0][5]:='';
    BiayaArr[0][6]:='0';
    BiayaArr[0][7]:='';
    BiayaArr[0][8]:='1';
    BiayaArr[0][9]:='0';
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      BiayaArr[IntCount][0]:=Qry.FieldValues['transaction_type_id'];
      if Qry.FieldValues['details']<>NULL then
        BiayaArr[IntCount][1]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else
        BiayaArr[IntCount][1]:=Qry.FieldValues['name'];
      BiayaArr[IntCount][2]:=Qry.FieldValues['amount'];
      BiayaArr[IntCount][3]:=Qry.FieldValues['discount'];
      BiayaArr[IntCount][4]:=Qry.FieldValues['discount_percent'];
      BiayaArr[IntCount][5]:=Qry.FieldValues['tax'];
      BiayaArr[IntCount][6]:=Qry.FieldValues['transaction_obj_id'];
      BiayaArr[IntCount][7]:=Qry.FieldValues['value'];
      BiayaArr[IntCount][8]:=Qry.FieldValues['display'];
      BiayaArr[IntCount][9]:=Qry.FieldValues['non_cash'];
      if Qry.FieldValues['transaction_accu_group_id']<>NULL then BiayaArr[IntCount][10]:=Qry.FieldValues['transaction_accu_group_id'] else BiayaArr[IntCount][10]:='0';
      Inc(INtCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPaymentForm.RefreshCombo;
var IntCount:Integer;
begin
  Cari.Text:='';
  if Length(EmplArr)>0 then StrGrid.RowCount:=Length(EmplArr)+1;
  for IntCount:=0 to Length(EmplArr)-1 do begin
//    NoNIK.Items.Add(EmplArr[IntCount][0]);
    StrGrid.Cells[0,IntCount+1]:=EmplArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=EmplArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=EmplArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=EmplArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=EmplArr[IntCount][5];
  end;
  for IntCount:=0 to Length(BiayaArr)-1 do
    if StrToInt(BiayaArr[IntCount][8])>0 then
      Pengeluaran.Items.Add(BiayaArr[IntCount][1]);
end;


procedure TPaymentForm.BatalClick(Sender: TObject);
begin
  PaymentForm.Close;
end;

procedure TPaymentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPaymentForm.FormShow(Sender: TObject);
begin
  Init;
  InitCombo;
  Internal.Checked;
  RefreshData;
  RefreshCombo;
  Internal.SetFocus;
end;

procedure TPaymentForm.InitCombo;
begin
  Pengeluaran.Text:='';
  Pengeluaran.Items.Clear;
  Pengeluaran.ItemIndex:=-1;
  Jumlah.Text:='';
end;

procedure TPaymentForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitCombo;
  RefreshData;
  RefreshCombo;
  EnableInput;
  GroupPenerima.SetFocus;
end;

procedure TPaymentForm.PengeluaranChange(Sender: TObject);
begin
  if Trim(Pengeluaran.Text)<>'' then begin
    if SToInt(BiayaArr[ArrayIndexOf(BiayaArr,Pengeluaran.Text,1)][2])>0 then begin
      Jumlah.Text:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Pengeluaran.Text,1)][2]);
      GroupJumlah.Enabled:=False;
    end else begin
      Jumlah.Text:='';
      GroupJumlah.Enabled:=True;
    end;
    TransAccuGroupId:=StrToInt(BiayaArr[ArrayIndexOf(BiayaArr,Pengeluaran.Text,1)][10]);
  end;
  if (TransAccuGroupId=2) and (SToInt(Tabungan.Text)<=0) then GroupJumlah.Enabled:=False;   
end;

procedure TPaymentForm.JumlahEnter(Sender: TObject);
begin
  Jumlah.Text:=ToString(Jumlah.Text);
end;

procedure TPaymentForm.JumlahExit(Sender: TObject);
begin
  if Jumlah.Text<>'' then begin
    Jumlah.Text:=SToCurr(Jumlah.Text);
  end else
    Jumlah.Text:='0';
  if (TransAccuGroupId=2) then begin
    if SToInt(Jumlah.Text)>SToInt(Tabungan.Text) then begin
      Jumlah.Text:='0';
      MessageBox(0,PChar('  Jumlah tabungan yang diambil,'+Chr(13)+'tidak boleh lebih besar dari tabungan'),'Pengeluaran Kas',MB_OK or MB_ICONWARNING);
      Jumlah.SetFocus;
    end;
  end;
end;


procedure TPaymentForm.SetEmpl;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Trim(NoNIK.Text)<>'' then begin
    Pengeluaran.Enabled:=True;
    Pengeluaran.Text:='';
    Pengeluaran.ItemIndex:=-1;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetEmployeeDetail '+QuotedStr(NoNIK.Text)+' ;';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        Nama.Text:=Qry.FieldValues['name'];
        if Qry.FieldValues['debt']>0 then Hutang.Text:=SToCurr(Qry.FieldValues['debt'])
        else if Qry.FieldValues['debt']<0 then Hutang.Text:='('+IToCurr(0-Qry.FieldValues['debt'])+')'
        else Hutang.Text:='0';
        if Qry.FieldValues['saving']<0 then Tabungan.Text:=IToCurr(0-Qry.FieldValues['saving'])
        else Tabungan.Text:='0';
        if (Qry.FieldValues['onrisk']>=0) then OnRisk.Text:=IToCurr(Qry.FieldValues['onrisk'])
        else OnRisk.Text:='('+IToCurr(0-Qry.FieldValues['onrisk'])+')';
        if (Qry.FieldValues['laka']>=0) then LaKa.Text:=IToCurr(Qry.FieldValues['laka'])
        else LaKa.Text:='('+IToCurr(0-Qry.FieldValues['laka'])+')';
        if (Qry.FieldValues['tilang']>=0) then Tilang.Text:=IToCurr(Qry.FieldValues['tilang'])
        else Tilang.Text:='('+IToCurr(0-Qry.FieldValues['tilang'])+')';
        if Qry.FieldValues['jaminan']<0 then Jaminan.Text:=IToCurr(0-Qry.FieldValues['jaminan'])
        else Jaminan.Text:='0';
        if Qry.FieldValues['tlaka']<0 then TabunganL.Text:=IToCurr(0-Qry.FieldValues['tlaka'])
        else TabunganL.Text:='0';
        if Qry.FieldValues['insentifa']<0 then InsentifA.Text:=IToCurr(0-Qry.FieldValues['insentifa'])
        else InsentifA.Text:='0';
        if Qry.FieldValues['reguler']=1 then IntReguler:=1 else IntReguler:=0;
      end;
      Qry.Close;
    end;
    Main.CloseDb;
    Pengeluaran.Enabled:=True;
    GroupKeterangan.Enabled:=True;
  end else Pengeluaran.Enabled:=False;
  Main.M_Normal;
end;

procedure TPaymentForm.PreparePrint;
var Count:Integer;
    StrQry:String;
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
end;

procedure TPaymentForm.PreparePrintData;
var Count:Integer;
    StrQry,StrTransType:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT CONVERT(VARCHAR(10),date,103) AS date,CONVERT(VARCHAR(5),date,108) AS time '+
            'FROM wh_payment WHERE payment_id='+Chr(39)+TransId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QTanggal.Caption:=Qry.FieldValues['date'];
      QJam.Caption:=Qry.FieldValues['time'];
    end;
    if (StrToInt(CompanyId)=3) AND (Internal.Checked) then begin
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
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',4) AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']>0 then QLaka.Caption:=SToCurr(Qry.FieldValues['total'])
          else QLaka.Caption:='0';
        end;
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+QuotedStr(NoNIK.Text)+',2) AS total ;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['total']<>0 then QTabungan.Caption:=IToCurr(0-StrToInt(Qry.FieldValues['total']))
          else QTabungan.Caption:='0';
        end;
        Qry.Close;
        StrQry:='SELECT dbo.GetTotalAmount('+Chr(39)+NoNIK.Text+Chr(39)+',5) AS total;';
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
    Main.CloseDb;
    Qry.Destroy;
    QTanggal2.Caption:=FormatDateTime('dd',StrToDate(Main.Status.Panels.Items[0].Text))+' '+
                       LongMonthNames[StrToInt(FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text)))]+' '+
                       FormatDateTime('yyyy',StrToDate(Main.Status.Panels.Items[0].Text));
    QPengeluaran.Caption:=Pengeluaran.Text;
    QSejumlah.Caption:=Jumlah.Text;
    QTerbilang.Caption:=Terbilang(SToInt(Jumlah.Text))+' Rupiah';
    QKeterangan.Caption:=Keterangan.Text;
    if Internal.Checked then begin
      QPenerima.Caption:=Nama.Text;
      QTandaPenerima.Caption:=UpperCase(Nama.Text);
    end else begin
      NamaEksternal.Text;
      QTandaPenerima.Caption:=UpperCase(NamaEksternal.Text);
    end;
    QTandaKasir.Caption:=UpperCase(User);
    Report.Preview;
  end;
end;

procedure TPaymentForm.SimpanClick(Sender: TObject);
var IsOk,IsPrint:Boolean;
    Qry:TADOQuery;
    StrQry,StrEMsg,StrTrans,TransId2,Amount,StrEmployee,StrRemark:String;
    IntCount:Integer;
begin
  if (Trim(Pengeluaran.Text)<>'') AND (ToString(Jumlah.Text)<>'') then begin
    Main.M_Busy;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    for IntCount:=0 to Length(BiayaArr)-1 do
      if BiayaArr[IntCount][1]=Pengeluaran.Text then StrTrans:=BiayaArr[IntCount][0];
    StrEmployee:=QuotedStr(NoNIK.Text);
    if Trim(Keterangan.Text)<>'' then StrRemark:=QuotedStr(Keterangan.Text) else StrRemark:='NULL';
    if Main.OpenDb then begin
      Amount:=ToString(Jumlah.Text);
      Main.TransStart;
      StrQry:='SELECT RIGHT(MAX(empl_transaction_id),4) AS empl_transaction_id FROM wh_empl_transaction '+
            'WHERE empl_transaction_id  LIKE '+Chr(39)+'SPM'+LocationCode+CompanyId+
            FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
            '____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_transaction_id']<>NULL then begin
        TransId2:=Qry.FieldValues['empl_transaction_id'];
        TransId2:=Format('%.*d',[4,StrToInt(TransId2)+1]);
      end else
        TransId2:='0001';
      TransId2:='SPM'+LocationCode+CompanyId+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId2;
      Qry.Close;
      StrQry:='SELECT RIGHT(MAX(payment_id),4) AS max_id FROM wh_payment '+
                'WHERE payment_id  LIKE '+Chr(39)+'SPU'+LocationCode+CompanyId+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        TransId:=Format('%.*d',[4,StrToInt(Qry.FieldValues['max_id'])+1]);
        Qry.Close;
        Qry.SQL.Clear;
      end else
        TransId:='0001';
      Qry.Close;
      TransId:='SPU'+LocationCode+CompanyId+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
              FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      if Internal.Checked then begin
        StrQry:='INSERT INTO wh_payment (payment_id,company_id,employee_id,date,form_id,total,remark,update_user) '+
                ' VALUES ('+Chr(39)+TransId+Chr(39)+','+CompanyId+','+StrEmployee+',GETDATE(),'+
                Chr(39)+TransId2+Chr(39)+','+Amount+','+StrRemark+','+Chr(39)+User+Chr(39)+');';
      end else begin
        StrQry:='INSERT INTO wh_payment (payment_id,company_id,recipient_name,date,total,description,update_user) '+
                ' VALUES ('+Chr(39)+TransId+Chr(39)+','+CompanyId+','+QuotedStr(NamaEksternal.Text)+',GETDATE(),'+Amount+','+
                StrRemark+','+Chr(39)+User+Chr(39)+');';
      end;
      StrQry:=StrQry+'INSERT INTO wh_payment_detail (payment_id,transaction_type_id,amount,update_user) '+
              ' VALUES ('+Chr(39)+TransId+Chr(39)+','+Chr(39)+StrTrans+Chr(39)+','+Amount+','+Chr(39)+User+Chr(39)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
        end;
      end;
      StrQry:='';
      if Internal.Checked then begin
        StrQry:='INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,update_user)'+
                ' VALUES ('+Chr(39)+TransId2+Chr(39)+','+StrEmployee+','+Chr(39)+TransId+Chr(39)+
                ',GETDATE(),'+Chr(39)+User+Chr(39)+');';
        StrQry:=StrQry+'INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id,amount,total,update_user)'+
              ' VALUES ('+Chr(39)+TransId2+Chr(39)+','+StrTrans+','+Amount+
              ','+Amount+','+Chr(39)+User+Chr(39)+');';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
        end;
      end;
      Main.M_Normal;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        if MessageBox(0,'Pengeluaran sudah disimpan, mau dicetak ?','Pengeluaran Kas',MB_OKCANCEL or MB_ICONQUESTION)=1 then IsPrint:=True
        else IsPrint:=False;
      end else begin
        MessageBox(0,'Gagal Menyimpan data','Pengeluaran Kas',MB_OK or MB_ICONERROR);
        Main.TransRollback;
      end;
      Main.CloseDb;
    end;
    Qry.Destroy;
    if (IsOk) AND (IsPrint) then begin
      PreparePrint;
      PreparePrintData;
    end;
  end;
end;

procedure TPaymentForm.CetakUlangClick(Sender: TObject);
begin
  PaymentReprint:=TPaymentReprint.Create(Self);
end;

procedure TPaymentForm.EnableInput;
begin
  NoNIK.Enabled:=True;
  GroupKaryawan.Enabled:=True;
  Simpan.Enabled:=True;
  Jumlah.Enabled:=True;
end;

procedure TPaymentForm.DisableInput;
begin
  NoNIK.Enabled:=False;
  Pengeluaran.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  GroupKaryawan.Enabled:=False;
  Simpan.Enabled:=False;
  Jumlah.Enabled:=False;
end;

procedure TPaymentForm.CariChange(Sender: TObject);
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
      end;
    end;
  end else
    RefreshCombo;
end;

procedure TPaymentForm.PenerimaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Pengeluaran.SetFocus;
end;

procedure TPaymentForm.PengeluaranKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if GroupJumlah.Enabled then Jumlah.SetFocus else Keterangan.SetFocus;
end;

procedure TPaymentForm.JumlahKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Keterangan.SetFocus;
end;


procedure TPaymentForm.NoNIKChange(Sender: TObject);
begin
  SetEmpl;
end;

procedure TPaymentForm.NoNIKKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Pengeluaran.SetFocus;
  if Key = #27 then PaymentForm.Close;
end;


procedure TPaymentForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  RowSelect:=ARow;
end;

procedure TPaymentForm.StrGridDblClick(Sender: TObject);
begin
  NoNIK.Text:=StrGrid.Cells[0,RowSelect];
  SetEmpl;
  Pengeluaran.SetFocus;  
end;

procedure TPaymentForm.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then PaymentForm.Close;
end;

procedure TPaymentForm.InternalClick(Sender: TObject);
begin
  if Internal.Checked=True then begin
    NamaEksternal.Text:='';
    NamaEksternal.Enabled:=False;
    Cari.Enabled:=True;
    NoNIK.Enabled:=True;
    Pengeluaran.Enabled:=False;
  end;
end;

procedure TPaymentForm.NamaEksternalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Pengeluaran.SetFocus;
  if Key = #27 then PaymentForm.Close;
end;

procedure TPaymentForm.EksternalClick(Sender: TObject);
begin
  if Eksternal.Checked=True then begin
    NamaEksternal.Enabled:=True;
    Cari.Enabled:=False;
    Nama.Text:='';
    Hutang.Text:='';
    Tabungan.Text:='';
    Pengeluaran.Enabled:=True;
  end;
end;

procedure TPaymentForm.InternalKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Cari.SetFocus;
  if Key = #27 then PaymentForm.Close;
end;

procedure TPaymentForm.EksternalKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NamaEksternal.SetFocus;
  if Key = #27 then PaymentForm.Close;
end;

procedure TPaymentForm.NamaEksternalChange(Sender: TObject);
begin
  if Trim(NamaEksternal.Text)<>'' then Pengeluaran.Enabled:=True
  else Pengeluaran.Enabled:=False; 
end;

end.
