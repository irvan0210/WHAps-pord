unit CetakKetidaksesuaianDanPerbaikanU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, WHUnit, ADODB, DB,
  frxExportPDF, frxClass, frxDBSet, frxExportXLS;

type
  TCetakKetidaksesuaianDanPerbaikan = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Selesai: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    Label1: TLabel;
    NoKetidaksesuaianPerbaikan: TEdit;
    Kepada: TEdit;
    NoKomplain: TEdit;
    CariOrder: TSpeedButton;
    Tgl: TDateTimePicker;
    lbl1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RujukanStandard: TEdit;
    GroupBox1: TGroupBox;
    ChkDiterimaVerifikasiHasilPerbaikan: TCheckBox;
    ChkPerluVerifikasiUlangHasilPerbaikan: TCheckBox;
    TglPerluVerifikasiHasilPerbaikan: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    VerifikasiHasilPerbaikanVerifikasiOleh: TEdit;
    Label7: TLabel;
    TglVerifikasiHasilPerbaikan: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ChkDiterimaVerifikasiTindakanPerbaikan: TCheckBox;
    ChkPerluVerifikasiUlangTindakanPerbaikan: TCheckBox;
    TglPerluVerifikasiTindakanPerbaikan: TDateTimePicker;
    VerifikasiTindakanPerbaikanVerikasiOleh: TEdit;
    TglVerifikasiTindakanPerbaikan: TDateTimePicker;
    KomentarVerifikasiHasilPerbaikan: TMemo;
    Label11: TLabel;
    KomentarVerifikasiTindakanPerbaikan: TMemo;
    Label12: TLabel;
    Cetak: TButton;
    frxdbdtst1: TfrxDBDataset;
    con1: TADOConnection;
    qryComplainCust: TADOQuery;
    frxrprt2: TfrxReport;
    grp1: TGroupBox;
    chkobservasi: TCheckBox;
    chkminor: TCheckBox;
    chkmajor: TCheckBox;
    GroupBox3: TGroupBox;
    chktemuan_saranpersonilper: TCheckBox;
    chktemuanauditint: TCheckBox;
    GroupBox4: TGroupBox;
    chkkeluhanpelanggan: TCheckBox;
    chktemuanauditsert: TCheckBox;
    frxdbdtst2: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure ChkPerluVerifikasiUlangHasilPerbaikanClick(Sender: TObject);
    procedure ChkPerluVerifikasiUlangTindakanPerbaikanClick(
      Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CetakClick(Sender: TObject);
    procedure frxrprt2BeforePrint(Sender: TfrxReportComponent);
    procedure chkobservasiClick(Sender: TObject);
    procedure chkminorClick(Sender: TObject);
    procedure chkmajorClick(Sender: TObject);
    procedure chktemuan_saranpersonilperClick(Sender: TObject);
    procedure chktemuanauditintClick(Sender: TObject);
    procedure chkkeluhanpelangganClick(Sender: TObject);
    procedure chktemuanauditsertClick(Sender: TObject);
    procedure ChkDiterimaVerifikasiHasilPerbaikanClick(Sender: TObject);
    procedure ChkDiterimaVerifikasiTindakanPerbaikanClick(Sender: TObject);
    procedure TglPerluVerifikasiHasilPerbaikanChange(Sender: TObject);
    procedure TglPerluVerifikasiTindakanPerbaikanChange(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    IntVerifikasiHasilPerbaikan,IntVerifikasiTindakanPerbaikaN :Integer;
    observasi,minor,major,temuan_pesonil_per,temuan_audit_intern,
    keluhan_pelanggan,temuan_audit_sertifikasi,int_diterima_verifikasi_hasil_perbaikan,
    int_diterima_verifikasi_tindakan_perbaikan :Integer;
    StrTglVerifikasiHasilPerbaikan,StrTglPerluVerifikasiHasilPerbaikan,StrTglVerifikasiTindakanPerbaikan,StrTglPerluVerifikasiTindakanPerbaikan,NoKomplain2,StatusForm,StrPicInvest,StrPicPerbaikan,StrPicRencPerbaikan :String;
    procedure Init;
    procedure Save;
    procedure Update;
    procedure Autocode;
    procedure GetDetail;
    procedure GetPicInvestigasi;
    procedure GetPicPerbaikan;
    procedure GetPicRencPerbaikan;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Status_Form:String='';No_Komplain:String='');Overload;
  end;

var
  CetakKetidaksesuaianDanPerbaikan: TCetakKetidaksesuaianDanPerbaikan;
  CustComplainInvestigationId,IsClose: Integer;
  StrTransId:string;



implementation

uses MainU, CustomerComplainCorrectiveActionPlanListU, Math;

{$R *.dfm}
constructor TCetakKetidaksesuaianDanPerbaikan.Create(AOwner:TComponent;
Status_Form:String='';No_Komplain:String='');
begin
  StatusForm:=Status_Form;
  NoKomplain2:=No_Komplain;
  if Status_Form='CREATE' then
  begin
    StrTransId:='';
    IsClose:=0;
  end;
//  Main.WriteLog('Form Open: CustomerComplainInvestigationForm='+''''+','+CCP_Id+IntToStr(StateStatus),1);
//  Initiation:=True;
  inherited Create(AOwner);
end;

function ArrayToString(const a: array of Char): string;
begin
  if Length(a)>0 then
    SetString(Result, PChar(@a[0]), Length(a))
  else
    Result := '';
end;

procedure TCetakKetidaksesuaianDanPerbaikan.GetPicInvestigasi;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);

    StrQry:='SELECT DISTINCT b.name FROM wh_cust_complain_investigation_pic a '+
            'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
            'LEFT JOIN wh_cust_complain_investigation c ON '+
            'a.cust_complain_investigation_id=c.cust_complain_investigation_id and c.status=1 '+
            'WHERE c.cust_complain_id='+QuotedStr(NoKomplain.Text)+' AND a.type=1 AND a.status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    StrPicInvest:='';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Inc(IntCount);
      if (IntCount=1) and (Qry.RecordCount>1) then
      begin
        StrPicInvest:=Qry.FieldValues['name']+ ',';
      end
      else if (IntCount=1) and (Qry.RecordCount=1) then
      begin
      StrPicInvest:=Qry.FieldValues['name'];
      end else if (IntCount>1) and (Qry.RecordCount>IntCount) then
      begin
        StrPicInvest:= StrPicInvest+Qry.FieldValues['name']+',';
      end else if (IntCount>1) and (Qry.RecordCount=IntCount) then
      begin
         StrPicInvest:= StrPicInvest+Qry.FieldValues['name'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
end;

procedure TCetakKetidaksesuaianDanPerbaikan.GetPicPerbaikan;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);

    StrQry:='SELECT DISTINCT b.name FROM wh_cust_complain_investigation_pic a '+
            'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
            'LEFT JOIN wh_cust_complain_investigation c ON '+
            'a.cust_complain_investigation_id=c.cust_complain_investigation_id and c.status=1 '+
            'WHERE c.cust_complain_id='+QuotedStr(NoKomplain.Text)+' AND a.type=2 AND a.status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    StrPicPerbaikan:='';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Inc(IntCount);
      if (IntCount=1) and (Qry.RecordCount>1) then
      begin
        StrPicPerbaikan:=Qry.FieldValues['name']+ ',';
      end
      else if (IntCount=1) and (Qry.RecordCount=1) then
      begin
      StrPicPerbaikan:=Qry.FieldValues['name'];
      end else if (IntCount>1) and (Qry.RecordCount>IntCount) then
      begin
        StrPicPerbaikan:= StrPicPerbaikan+Qry.FieldValues['name']+',';
      end else if (IntCount>1) and (Qry.RecordCount=IntCount) then
      begin
         StrPicPerbaikan:= StrPicPerbaikan+Qry.FieldValues['name'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
end;


procedure TCetakKetidaksesuaianDanPerbaikan.GetPicRencPerbaikan;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);

    StrQry:='SELECT DISTINCT b.name FROM wh_cust_complain_investigation_pic a '+
            'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
            'LEFT JOIN wh_cust_complain_investigation c ON '+
            'a.cust_complain_investigation_id=c.cust_complain_investigation_id and c.status=1 '+
            'WHERE c.cust_complain_id='+QuotedStr(NoKomplain.Text)+' AND a.type=3 AND a.status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    StrPicRencPerbaikan:='';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Inc(IntCount);
      if (IntCount=1) and (Qry.RecordCount>1) then
      begin
        StrPicRencPerbaikan:=Qry.FieldValues['name']+ ',';
      end
      else if (IntCount=1) and (Qry.RecordCount=1) then
      begin
      StrPicRencPerbaikan:=Qry.FieldValues['name'];
      end else if (IntCount>1) and (Qry.RecordCount>IntCount) then
      begin
        StrPicRencPerbaikan:= StrPicRencPerbaikan+Qry.FieldValues['name']+',';
      end else if (IntCount>1) and (Qry.RecordCount=IntCount) then
      begin
         StrPicRencPerbaikan:= StrPicRencPerbaikan+Qry.FieldValues['name'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
end;

procedure TCetakKetidaksesuaianDanPerbaikan.Autocode;
var Qry,Qry2:TADOQuery;
    StrQry,StrQryDet,StrMaxId,StrKMOdo,StrMsg,StrVhcId,StrStartDate,StrFinishDate,StrRequest,StrTglDibutuhkanBarang,StrItem,StrQty,StrKodePartGP:String;
    StrMaintenanceService,StrWorkOrder,StrKeluhan,StrAnalisa,StrMekanik,StrStatusMekanik,StrItemRequestID,StrLocationCode:String;
    IntCount,IntJobInEx,IntMemoKhusus:Integer;
    IsOk,IsCetak:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if LocationCode='RB' then
  begin
    StrLocationCode:='WHJKT'
  end else if LocationCode='DPS' then
  begin
    StrLocationCode:='WHBL'
  end else if LocationCode='YG' then
  begin
    StrLocationCode:='WHJGJ'
  end;

  if Main.OpenDb then begin
    StrMsg:='';
    StrQry:='SELECT RIGHT(MAX(no_ketidaksesuaian_perbaikan),3) AS max_id FROM wh_cust_complain_ketidaksesuaian_perbaikan WHERE no_ketidaksesuaian_perbaikan '+
            'LIKE '+Chr(39)+'%KP/'+StrLocationCode+'/MK/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'%'+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['max_id']<>NULL then begin
      StrMaxId:=Qry.FieldValues['max_id'];
      StrMaxId:=Format('%.*d',[3,StrToInt(StrMaxId)+1]);
    end else
      StrMaxId:='001';

    StrTransId:='KP/'+StrLocationCode+'/MK/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
              FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
  end;
  Main.M_Normal;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.GetDetail;
var Qry,Qry2:TADOQuery;
    StrQry,StrQryDet:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  if Main.OpenDb then begin
    StrQry:='SELECT a.*,b.*,CONVERT(VARCHAR(10), a.tgl,103) tgl_buat FROM wh_cust_complain_ketidaksesuaian_perbaikan a '+
            'LEFT JOIN wh_cust_complain_ketidaksesuaian_perbaikan_kategori b on a.no_ketidaksesuaian_perbaikan=b.no_ketidaksesuaian_perbaikan and b.status=1 '+
            'WHERE a.no_ketidaksesuaian_perbaikan='+QuotedStr(StrTransId)+' and a.status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      NoKetidaksesuaianPerbaikan.Text:=StrTransId;
      NoKomplain.Text:=Qry.FieldValues['cust_complain_id'];;
      Tgl.Date:=Qry.FieldValues['tgl'];;
      Kepada.Text:=Qry.FieldValues['kepada'];
      KomentarVerifikasiHasilPerbaikan.Text:=Qry.FieldValues['komentar_verfikasi_ulang_hasil_perbaikan'];
      KomentarVerifikasiTindakanPerbaikan.Text:=Qry.FieldValues['komentar_verfikasi_ulang_tindakan_perbaikan'];
      if Qry.FieldValues['tgl_verfikasi_ulang_hasil_perbaikan']<>null then begin
        TglVerifikasiHasilPerbaikan.Date:= Qry.FieldValues['tgl_verfikasi_ulang_hasil_perbaikan'];
        TglVerifikasiHasilPerbaikan.Visible:=True;
        StrTglVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiHasilPerbaikan.Date));
      end else begin
        TglVerifikasiHasilPerbaikan.Visible:=False;
        StrTglVerifikasiHasilPerbaikan:='NULL';
      end;

      if Qry.FieldValues['tgl_verfikasi_ulang_tindakan_perbaikan']<>null then begin
        TglVerifikasiTindakanPerbaikan.Date:= Qry.FieldValues['tgl_verfikasi_ulang_tindakan_perbaikan'];
        TglVerifikasiTindakanPerbaikan.Visible:=True;
        StrTglVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiHasilPerbaikan.Date));
      end else begin
        TglVerifikasiTindakanPerbaikan.Visible:=False;
        StrTglVerifikasiTindakanPerbaikan:='NULL';
      end;

      VerifikasiHasilPerbaikanVerifikasiOleh.Text:= Qry.FieldValues['verfikasi_ulang_hasil_perbaikan_oleh'];
      VerifikasiTindakanPerbaikanVerikasiOleh.Text:= Qry.FieldValues['verfikasi_ulang_tindakan_perbaikan_oleh'];
      if Qry.FieldValues['verfikasi_ulang_hasil_perbaikan']=1 then
      begin
        ChkPerluVerifikasiUlangHasilPerbaikan.Checked:=True;
        IntVerifikasiHasilPerbaikan:=1;
        TglPerluVerifikasiHasilPerbaikan.Visible:=True;
        TglPerluVerifikasiHasilPerbaikan.Date:=  Qry.FieldValues['tgl_perlu_verifikasi_ulang_hasil'];
        StrTglPerluVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiHasilPerbaikan.Date));
      end else begin
        ChkPerluVerifikasiUlangHasilPerbaikan.Checked:=False;
        IntVerifikasiHasilPerbaikan:=0;
        TglPerluVerifikasiHasilPerbaikan.Visible:=False;
        StrTglPerluVerifikasiHasilPerbaikan:='NULL';
      end;

      if (Qry.FieldValues['diterima_verifikasi_hasil_perbaikan']=1) then
      begin
        ChkDiterimaVerifikasiHasilPerbaikan.Checked:=True;
      end else begin
        ChkDiterimaVerifikasiHasilPerbaikan.Checked:=False;
      end;

      if Qry.FieldValues['verfikasi_ulang_tindakan_perbaikan']=1 then
      begin
        ChkPerluVerifikasiUlangTindakanPerbaikan.Checked:=True;
        TglPerluVerifikasiTindakanPerbaikan.Visible:=True;
        TglPerluVerifikasiTindakanPerbaikan.Date:=  Qry.FieldValues['tgl_perlu_verifikasi_ulang_tindakan'];
        StrTglPerluVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiTindakanPerbaikan.Date));
      end else begin
        ChkPerluVerifikasiUlangTindakanPerbaikan.Checked:=False;
        TglPerluVerifikasiTindakanPerbaikan.Visible:=False;
        StrTglPerluVerifikasiTindakanPerbaikan:='NULL';
      end;

      if (Qry.FieldValues['diterima_verifikasi_tindakan_perbaikan']=1) then
      begin
        ChkDiterimaVerifikasiTindakanPerbaikan.Checked:=True;
      end else begin
        ChkDiterimaVerifikasiTindakanPerbaikan.Checked:=False;
      end;

      if (Qry.FieldValues['observasi']=1) then
      begin
        observasi:=1;
        chkobservasi.Checked:=True;
      end;
      if (Qry.FieldValues['minor']=1) then
      begin
        chkminor.Checked:=True;
        minor:=1;
      end;
      if (Qry.FieldValues['major']=1) then
      begin
        chkmajor.Checked:=True;
        major:=1
      end;
      if (Qry.FieldValues['temuan_personil_per']=1) then
      begin
        chktemuan_saranpersonilper.Checked:=True;
        temuan_pesonil_per:=1;
      end;
      if (Qry.FieldValues['temuan_audit_intern']=1) then
      begin
        chktemuanauditint.Checked:=True;
        temuan_audit_intern:=1;
      end;
      if (Qry.FieldValues['keluhan_pelanggan']=1) then
      begin
        chkkeluhanpelanggan.Checked:=True;
        keluhan_pelanggan:=1;
      end;
      if (Qry.FieldValues['temuan_audit_sertifikasi']=1) then
      begin
        chktemuanauditsert.Checked:=True;
        temuan_audit_sertifikasi:=1;
      end;

    end;

  end;
  Main.M_Normal;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.Init;
begin
  NoKetidaksesuaianPerbaikan.Text:='';
  Tgl.Date:=Now;
  Kepada.Text:='Dept. Operasional';
  RujukanStandard.Text:='PPOKP';
  NoKomplain.Text:='';
  VerifikasiHasilPerbaikanVerifikasiOleh.Text:='';
  VerifikasiTindakanPerbaikanVerikasiOleh.Text:='';
  TglPerluVerifikasiHasilPerbaikan.Date:=Now;
  TglPerluVerifikasiTindakanPerbaikan.Date:=Now;
  TglVerifikasiHasilPerbaikan.Date:=Now;
  TglVerifikasiTindakanPerbaikan.Date:=Now;
  KomentarVerifikasiHasilPerbaikan.Text:='';
  KomentarVerifikasiTindakanPerbaikan.Text:='';
  TglPerluVerifikasiHasilPerbaikan.Visible:=False;
  TglPerluVerifikasiTindakanPerbaikan.Visible:=False;
  TglVerifikasiHasilPerbaikan.Visible:=False;
  TglVerifikasiTindakanPerbaikan.Visible:=False;
  Label5.Visible:=False;
  Label8.Visible:=False;
  StrTglVerifikasiHasilPerbaikan:='NULL';
  StrTglVerifikasiTindakanPerbaikan:='NULL';
  StrTglPerluVerifikasiHasilPerbaikan:='NULL';
  StrTglPerluVerifikasiTindakanPerbaikan:='NULL';
  ChkDiterimaVerifikasiHasilPerbaikan.Checked:=False;
  ChkPerluVerifikasiUlangHasilPerbaikan.Checked:=False;
  ChkDiterimaVerifikasiTindakanPerbaikan.Checked:=False;
  ChkPerluVerifikasiUlangTindakanPerbaikan.Checked:=False;
  Simpan.Enabled:=True;
  Cetak.Visible:=False;
  observasi:=0;
  minor:=0;
  major:=0;
  temuan_pesonil_per:=0;
  temuan_audit_intern:=0;
  keluhan_pelanggan:=0;
  temuan_audit_sertifikasi:=0;
  chkobservasi.Checked:=False;
  chkminor.Checked:=False;
  chkmajor.Checked:=False;
  chktemuan_saranpersonilper.Checked:=False;
  chktemuanauditint.Checked:=False;
  chkkeluhanpelanggan.Checked:=False;
  chktemuanauditsert.Checked:=False;
  int_diterima_verifikasi_hasil_perbaikan:=0;
  int_diterima_verifikasi_tindakan_perbaikan:=0;
  CariOrder.Visible:=True;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.Save;
var
StrQry,StrMsg,StrEMsg:string;
Qry:TADOQuery;
IsOk: Boolean;
IntCount:Integer;
begin
  if Main.OpenDb then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.TransStart;

    StrQry:='INSERT INTO wh_cust_complain_ketidaksesuaian_perbaikan (no_ketidaksesuaian_perbaikan,tgl,kepada,'+
            'verfikasi_ulang_hasil_perbaikan,tgl_verfikasi_ulang_hasil_perbaikan,verfikasi_ulang_tindakan_perbaikan,'+
            'tgl_verfikasi_ulang_tindakan_perbaikan,verfikasi_ulang_hasil_perbaikan_oleh,'+
            'verfikasi_ulang_tindakan_perbaikan_oleh,komentar_verfikasi_ulang_hasil_perbaikan,'+
            'komentar_verfikasi_ulang_tindakan_perbaikan,'+
            'cust_complain_investigation_id,created_by,created_date,modified_by,cust_complain_id,'+
            'status,rujukan_standard,diterima_verifikasi_hasil_perbaikan,diterima_verifikasi_tindakan_perbaikan,'+
            'tgl_perlu_verifikasi_ulang_hasil,tgl_perlu_verifikasi_ulang_tindakan) VALUES '+
            '('+QuotedStr(StrTransId)+','+QuotedStr(FormatDateTime('yyyy-mm-dd',Tgl.Date))+','+
            ''+QuotedStr(Kepada.Text)+','+IntToStr(IntVerifikasiHasilPerbaikan)+','+StrTglVerifikasiHasilPerbaikan+','+
            ''+IntToStr(IntVerifikasiTindakanPerbaikan)+','+StrTglVerifikasiTindakanPerbaikan+','+
            ''+QuotedStr(VerifikasiHasilPerbaikanVerifikasiOleh.Text)+','+QuotedStr(VerifikasiTindakanPerbaikanVerikasiOleh.Text)+','+
            ''+QuotedStr(KomentarVerifikasiHasilPerbaikan.Text)+','+QuotedStr(KomentarVerifikasiTindakanPerbaikan.Text)+','+
            ''+IntToStr(CustComplainInvestigationId)+','+QuotedStr(User)+',getdate(),'+QuotedStr(User)+','+QuotedStr(NoKomplain.Text)+',1'+
            ','+QuotedStr(RujukanStandard.Text)+','+IntToStr(int_diterima_verifikasi_hasil_perbaikan)+','+
            ''+IntToStr(int_diterima_verifikasi_tindakan_perbaikan)+','+StrTglPerluVerifikasiHasilPerbaikan+','+
            ''+StrTglPerluVerifikasiTindakanPerbaikan+');';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
      IsOk:=True;
    except
      on E:Exception do begin
        IsOk:=False;
        StrMsg:='Gagal Simpan Perbaikan Customer Complain';
        StrEMsg:=E.Message;
      end;
    end;
    StrQry:='';
    if IsOk=True then
    begin
      StrQry:='INSERT INTO wh_cust_complain_ketidaksesuaian_perbaikan_kategori (no_ketidaksesuaian_perbaikan,observasi,'+
              'minor,major,temuan_personil_per,temuan_audit_intern,keluhan_pelanggan,'+
              'temuan_audit_sertifikasi,status,'+
              'modified_by) VALUES '+
              '('+QuotedStr(StrTransId)+','+IntToStr(observasi)+','+IntToStr(minor)+','+IntToStr(major)+','+
              ''+IntToStr(temuan_pesonil_per)+','+IntToStr(temuan_audit_intern)+','+IntToStr(keluhan_pelanggan)+','+
              ''+IntToStr(temuan_audit_sertifikasi)+',1,'+QuotedStr(User)+');';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        IsOk:=True;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Simpan Perbaikan Customer Complain';
          StrEMsg:=E.Message;
        end;
      end;
    end;

    if IsOk then begin
      Main.TransCommit;
      Main.M_Normal;
      MessageBox(0,'Cetak Ketidaksesuaian Dan Perbaikan berhasil disimpan','Cetak Ketidaksesuaian Dan Perbaikan',MB_OK );
      NoKetidaksesuaianPerbaikan.Text:=StrTransId;
      Simpan.Enabled:=False;
      Cetak.Visible:=True;
      CetakClick(self);
    end else begin
      Main.TransRollback;
      Main.M_Normal;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CCP',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.Update;
var
StrQry,StrMsg,StrEMsg:string;
Qry:TADOQuery;
IsOk: Boolean;
IntCount:Integer;
begin
  if Main.OpenDb then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.TransStart;

    StrQry:='UPDATE wh_cust_complain_ketidaksesuaian_perbaikan SET tgl='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tgl.Date))+',kepada='+QuotedStr(Kepada.Text)+','+
            'verfikasi_ulang_hasil_perbaikan='+IntToStr(IntVerifikasiHasilPerbaikan)+',tgl_verfikasi_ulang_hasil_perbaikan='+StrTglVerifikasiHasilPerbaikan+','+
            'verfikasi_ulang_tindakan_perbaikan='+IntToStr(IntVerifikasiTindakanPerbaikan)+','+
            'tgl_verfikasi_ulang_tindakan_perbaikan='+StrTglVerifikasiTindakanPerbaikan+',verfikasi_ulang_hasil_perbaikan_oleh='+QuotedStr(VerifikasiHasilPerbaikanVerifikasiOleh.Text)+','+
            'verfikasi_ulang_tindakan_perbaikan_oleh='+QuotedStr(VerifikasiTindakanPerbaikanVerikasiOleh.Text)+',komentar_verfikasi_ulang_hasil_perbaikan='+QuotedStr(KomentarVerifikasiHasilPerbaikan.Text)+','+
            'komentar_verfikasi_ulang_tindakan_perbaikan='+QuotedStr(KomentarVerifikasiTindakanPerbaikan.Text)+','+
            'modified_by='+QuotedStr(User)+',modified_date=getdate(),'+
            'rujukan_standard='+QuotedStr(RujukanStandard.Text)+',diterima_verifikasi_hasil_perbaikan='+IntToStr(int_diterima_verifikasi_hasil_perbaikan)+','+
            'diterima_verifikasi_tindakan_perbaikan='+IntToStr(int_diterima_verifikasi_tindakan_perbaikan)+', '+
            'tgl_perlu_verifikasi_ulang_hasil='+StrTglPerluVerifikasiHasilPerbaikan+','+
            'tgl_perlu_verifikasi_ulang_tindakan='+StrTglPerluVerifikasiTindakanPerbaikan+' '+
            'WHERE no_ketidaksesuaian_perbaikan='+QuotedStr(NoKetidaksesuaianPerbaikan.Text)+' and status=1;';

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
      IsOk:=True;
    except
      on E:Exception do begin
        IsOk:=False;
        StrMsg:='Gagal Simpan Perbaikan Customer Complain';
        StrEMsg:=E.Message;
      end;
    end;
    StrQry:='';

    if IsOk=True then
    begin
      StrQry:='UPDATE wh_cust_complain_ketidaksesuaian_perbaikan_kategori SET status=0,'+
              'modified_date=getdate(),modified_by='+QuotedStr(User)+' '+
              'WHERE no_ketidaksesuaian_perbaikan='+QuotedStr(NoKetidaksesuaianPerbaikan.Text)+';';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        IsOk:=True;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Simpan Perbaikan Customer Complain';
          StrEMsg:=E.Message;
        end;
      end;

      if IsOk=True then
      begin

        StrQry:='INSERT INTO wh_cust_complain_ketidaksesuaian_perbaikan_kategori (no_ketidaksesuaian_perbaikan,observasi,'+
                'minor,major,temuan_personil_per,temuan_audit_intern,keluhan_pelanggan,'+
                'temuan_audit_sertifikasi,status,'+
                'modified_by) VALUES '+
                '('+QuotedStr(StrTransId)+','+IntToStr(observasi)+','+IntToStr(minor)+','+IntToStr(major)+','+
                ''+IntToStr(temuan_pesonil_per)+','+IntToStr(temuan_audit_intern)+','+IntToStr(keluhan_pelanggan)+','+
                ''+IntToStr(temuan_audit_sertifikasi)+',1,'+QuotedStr(User)+');';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          IsOk:=True;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Simpan Perbaikan Customer Complain';
            StrEMsg:=E.Message;
          end;
        end;
      end;
    end;

    if IsOk then begin
      Main.TransCommit;
      Main.M_Normal;
      MessageBox(0,'Cetak Ketidaksesuaian Dan Perbaikan berhasil disimpan','Cetak Ketidaksesuaian Dan Perbaikan',MB_OK );
      NoKetidaksesuaianPerbaikan.Text:=StrTransId;
      Simpan.Enabled:=False;
    end else begin
      Main.TransRollback;
      Main.M_Normal;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CCP',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.SelesaiClick(Sender: TObject);
begin
  Main.M_Normal;
  Close;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.BersihkanClick(
  Sender: TObject);
begin
  Init;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.ChkPerluVerifikasiUlangHasilPerbaikanClick(
  Sender: TObject);
begin
  if ChkPerluVerifikasiUlangHasilPerbaikan.Checked=True then
  begin
    TglPerluVerifikasiHasilPerbaikan.Visible:=True;
    TglVerifikasiHasilPerbaikan.Visible:=True;
    Label5.Visible:=True;
    IntVerifikasiHasilPerbaikan:=1;
    StrTglVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiHasilPerbaikan.Date));
    StrTglPerluVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiHasilPerbaikan.Date));
  end else
  begin
    IntVerifikasiHasilPerbaikan:=0;
    Label5.Visible:=False;
    TglPerluVerifikasiHasilPerbaikan.Visible:=False;
    StrTglPerluVerifikasiHasilPerbaikan:='NULL';
  end;

  if (ChkDiterimaVerifikasiHasilPerbaikan.Checked=False) AND (ChkPerluVerifikasiUlangHasilPerbaikan.Checked=False) then begin
    TglVerifikasiHasilPerbaikan.Visible:=False;
    StrTglVerifikasiHasilPerbaikan:='NULL';
    VerifikasiHasilPerbaikanVerifikasiOleh.Text:='';
    KomentarVerifikasiHasilPerbaikan.Text:='';
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.ChkPerluVerifikasiUlangTindakanPerbaikanClick(
  Sender: TObject);
begin
  if ChkPerluVerifikasiUlangTindakanPerbaikan.Checked=True then
  begin
    TglPerluVerifikasiTindakanPerbaikan.Visible:=True;
    Label8.Visible:=True;
    IntVerifikasiTindakanPerbaikan:=1;
    StrTglPerluVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiTindakanPerbaikan.Date));
    TglVerifikasiTindakanPerbaikan.Visible:=True;
    StrTglVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiTindakanPerbaikan.Date));
  end else
  begin
    IntVerifikasiTindakanPerbaikan:=0;
    Label8.Visible:=False;
    TglPerluVerifikasiTindakanPerbaikan.Visible:=False;
    StrTglPerluVerifikasiTindakanPerbaikan:='NULL';
  end;

  if (ChkDiterimaVerifikasiTindakanPerbaikan.Checked=False) AND (ChkPerluVerifikasiUlangTindakanPerbaikan.Checked=False)then
  begin
    TglVerifikasiTindakanPerbaikan.Visible:=False;
    StrTglVerifikasiTindakanPerbaikan:='NULL';
    VerifikasiTindakanPerbaikanVerikasiOleh.Text:='';
    KomentarVerifikasiTindakanPerbaikan.Text:='';
  end
end;

procedure TCetakKetidaksesuaianDanPerbaikan.CariOrderClick(
  Sender: TObject);
begin
  if Main.IsFormOpen('CustomerComplainCorrectiveActionPlanList')=False then CustomerComplainCorrectiveActionPlanList:=TCustomerComplainCorrectiveActionPlanList.Create(Self,'CREATE-KETIDAKSESUAIAN','',5);
end;

procedure TCetakKetidaksesuaianDanPerbaikan.FormShow(Sender: TObject);
begin
  Init;
  if StrTransId<>'' then
  begin
    NoKetidaksesuaianPerbaikan.Text:=StrTransId;
    GetDetail;
    CariOrder.Visible:=False;
    Cetak.Visible:=True;
    if IsClose=1 then
    begin
      Simpan.Visible:=False;
      Bersihkan.Visible:=False;
    end else
    begin
      Simpan.Visible:=True;
      Bersihkan.Visible:=True;
    end;
  end;
//  NoKomplain.Text:=NoKomplain2;

end;

procedure TCetakKetidaksesuaianDanPerbaikan.SimpanClick(Sender: TObject);
begin
  if Kepada.Text='' then
  begin
    MessageBox(0,PChar('Kepada wajib diisi !!'),'Cetak Ketidaksesuaian Dan Perbaikan]',MB_OK or MB_ICONERROR);
  end else if RujukanStandard.Text='' then
  begin
    MessageBox(0,PChar('Rujukan Standard wajib diisi !!'),'Cetak Ketidaksesuaian Dan Perbaikan]',MB_OK or MB_ICONERROR);
  end else if NoKomplain.Text='' then
  begin
    MessageBox(0,PChar('No Komplain wajib diisi !!'),'Cetak Ketidaksesuaian Dan Perbaikan]',MB_OK or MB_ICONERROR);
  end else
  begin
    if NoKetidaksesuaianPerbaikan.Text='' then
    begin
      Autocode;
      Save;
    end else begin
      Update;
    end;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.CetakClick(Sender: TObject);
var
  Qry:TADOQuery;
  StrQry,StrPICInvest:String;
  IntCount:Integer;
begin
  qryComplainCust.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.*,b.investigation,b.handling,b.renc_tindakan_perbaikan, '+
            'b.investigation_date,b.handling_date,b.renc_tindakan_perbaikan_date, '+
            'CONVERT(VARCHAR(10), e.out_date,103) out_date,'+
            'CONVERT(VARCHAR(10), c.update_time,103) complain_date,'+
            'CONVERT(VARCHAR(10), b.investigation_date,103) analisa_date, '+
            'CONVERT(VARCHAR(10), b.handling_date,103) perbaikan_date, '+
            'CONVERT(VARCHAR(10), b.renc_tindakan_perbaikan_date,103) renc_tindakan_perbaikan_date, '+
            'd.name user_complain,f.name driver,g.license_plate,'+
            'CONCAT(Substring(g.license_plate,1,1)+'' ''+Substring(g.license_plate,2,4)+'' ''+Substring(g.license_plate,6,Len(g.license_plate)+1)+'''','' / '',h.name,'' '',i.seat,'' Seat'') armada, '+
            '( SELECT ''- ''+Description +CHAR(10) '+
            'FROM wh_cust_complain_detail p2 '+
            'WHERE p2.cust_complain_id = a.cust_complain_id and status=1 '+
            'ORDER BY cust_complain_detail_id FOR XML PATH('''') )ComplainDetail '+
            'FROM wh_cust_complain_ketidaksesuaian_perbaikan a '+
            'LEFT JOIN wh_cust_complain_investigation b ON a.cust_complain_investigation_id=b.cust_complain_investigation_id AND b.status=1 '+
            'LEFT JOIN wh_cust_complain c ON b.cust_complain_id=c.cust_complain_id AND c.status=1 '+
            'LEFT JOIN wh_user d ON c.update_user=d.username '+
            'LEFT JOIN wh_vhc_trans e ON c.vhc_trans_id=e.vhc_trans_id '+
            'LEFT JOIN wh_employee f ON e.employee_id=f.employee_id '+
            'LEFT JOIN wh_vehicle g ON e.vehicle_id=g.vehicle_id '+
            'LEFT JOIN wh_vhc_batch h ON g.vhc_batch_id=h.vhc_batch_id '+
            'LEFT JOIN wh_vhc_type_detail i ON g.vhc_type_detail_id=i.vhc_type_detail_id '+
            'WHERE a.status=1 AND a.no_ketidaksesuaian_perbaikan='+QuotedStr(StrTransId)+'; ';
    qryComplainCust.SQL.Clear;
    qryComplainCust.SQL.Add(StrQry);
    qryComplainCust.Open;

    if qryComplainCust.RecordCount>0 then
    begin

      if qryComplainCust.FieldValues['diterima_verifikasi_hasil_perbaikan']=1 then
      begin
        int_diterima_verifikasi_hasil_perbaikan:=1;
      end else begin
        int_diterima_verifikasi_hasil_perbaikan:=0;
      end;
      if qryComplainCust.FieldValues['diterima_verifikasi_tindakan_perbaikan']=1 then
      begin
        int_diterima_verifikasi_tindakan_perbaikan:=1;
      end else begin
        int_diterima_verifikasi_tindakan_perbaikan:=0;
      end;

      if qryComplainCust.FieldValues['verfikasi_ulang_hasil_perbaikan']=1 then
      begin
        IntVerifikasiHasilPerbaikan:=1;
      end else begin
        IntVerifikasiHasilPerbaikan:=0;
      end;

      if qryComplainCust.FieldValues['verfikasi_ulang_tindakan_perbaikan']=1 then
      begin
        IntVerifikasiTindakanPerbaikaN:=1;
      end else begin
        IntVerifikasiTindakanPerbaikaN:=0;
      end;
      GetPicInvestigasi;
      GetPicPerbaikan;
      GetPicRencPerbaikan;
      frxrprt2.ShowReport();
    end;
  end;
//  Main.CloseDb;

end;

procedure TCetakKetidaksesuaianDanPerbaikan.frxrprt2BeforePrint(
  Sender: TfrxReportComponent);
begin
  if observasi=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('CheckObservasi')).Visible := True;
  end;
  if minor=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('CheckMinor')).Visible := True;
  end;
  if major=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('CheckMajor')).Visible := True;
  end;
  if temuan_pesonil_per=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('CheckInterSaran')).Visible := True;
  end;
  if temuan_audit_intern =1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('CheckInterAudit')).Visible := True;
  end;
  if keluhan_pelanggan=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkExtPelanggan')).Visible := True;
  end;
  if temuan_audit_sertifikasi=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkExtAudit')).Visible := True;
  end;

  if int_diterima_verifikasi_hasil_perbaikan=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkVerifHasilPerbaikanDiterima')).Visible := True;
  end;
  if int_diterima_verifikasi_tindakan_perbaikan=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkVerifTindPerbaikanDiterima')).Visible := True;
  end;

  if IntVerifikasiHasilPerbaikan=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkVerifHasilPerbaikanVerivikasiUlang')).Visible := True;
  end;
  if IntVerifikasiTindakanPerbaikaN=1 then
  begin
     TfrxPictureView(frxrprt2.FindObject('ChkVerifTindPerbaikanVerivikasiUlang')).Visible := True;
  end;

  if qryComplainCust.FieldValues['tgl_perlu_verifikasi_ulang_hasil']<>NULL then
  begin
    TfrxMemoView(frxrprt2.FindObject('MemoTglPerluVerifHasil')).Visible:=True;
  end else
  begin
     TfrxMemoView(frxrprt2.FindObject('MemoTglPerluVerifHasil')).Visible:=False;
  end;


  if qryComplainCust.FieldValues['tgl_perlu_verifikasi_ulang_tindakan']<>NULL then
  begin
     TfrxMemoView(frxrprt2.FindObject('MemoTglPerluVerifTindakan')).Visible:=True;
  end else
  begin
     TfrxMemoView(frxrprt2.FindObject('MemoTglPerluVerifTindakan')).Visible:=False;
  end;

  if qryComplainCust.FieldValues['tgl_verfikasi_ulang_hasil_perbaikan']<>NULL then
  begin
    TfrxMemoView(frxrprt2.FindObject('MemoTglVerifHasil')).Visible:=True;
  end else
  begin
     TfrxMemoView(frxrprt2.FindObject('MemoTglVerifHasil')).Visible:=False;
  end;

  if qryComplainCust.FieldValues['tgl_verfikasi_ulang_tindakan_perbaikan']<>NULL then
  begin
    TfrxMemoView(frxrprt2.FindObject('MemoTglVerifTindakan')).Visible:=True;
  end else
  begin
     TfrxMemoView(frxrprt2.FindObject('MemoTglVerifTindakan')).Visible:=False;
  end;

  TfrxMemoView(frxrprt2.FindObject('personil_analisa')).Text := StrPicInvest;
  TfrxMemoView(frxrprt2.FindObject('personil_perbaikan')).Text := StrPicPerbaikan;
  TfrxMemoView(frxrprt2.FindObject('personil_renc_perbaikan')).Text := StrPicRencPerbaikan;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chkobservasiClick(
  Sender: TObject);
begin
  if chkobservasi.Checked=True then
  begin
    observasi:=1;
  end else begin
    observasi:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chkminorClick(Sender: TObject);
begin
  if chkminor.Checked=True then
  begin
    minor:=1;
  end else begin
    minor:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chkmajorClick(Sender: TObject);
begin
  if chkmajor.Checked=True then
  begin
    major:=1;
  end else begin
    major:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chktemuan_saranpersonilperClick(
  Sender: TObject);
begin
  if chktemuan_saranpersonilper.Checked=True then
  begin
    temuan_pesonil_per:=1;
  end else begin
    temuan_pesonil_per:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chktemuanauditintClick(
  Sender: TObject);
begin
  if chktemuanauditint.Checked=True then
  begin
    temuan_audit_intern:=1;
  end else begin
    temuan_audit_intern:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chkkeluhanpelangganClick(
  Sender: TObject);
begin
  if chkkeluhanpelanggan.Checked=True then
  begin
    keluhan_pelanggan:=1;
  end else begin
    keluhan_pelanggan:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.chktemuanauditsertClick(
  Sender: TObject);
begin
  if chktemuanauditsert.Checked=True then
  begin
    temuan_audit_sertifikasi:=1;
  end else begin
    temuan_audit_sertifikasi:=0;
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.ChkDiterimaVerifikasiHasilPerbaikanClick(
  Sender: TObject);
begin
  if ChkDiterimaVerifikasiHasilPerbaikan.Checked=True then
  begin
    int_diterima_verifikasi_hasil_perbaikan:=1;
    TglVerifikasiHasilPerbaikan.Visible:=True;
    StrTglVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiHasilPerbaikan.Date));
  end else
  begin
    int_diterima_verifikasi_hasil_perbaikan:=0;
  end;

  if (ChkDiterimaVerifikasiHasilPerbaikan.Checked=False) AND (ChkPerluVerifikasiUlangHasilPerbaikan.Checked=False) then
  begin
    TglVerifikasiHasilPerbaikan.Visible:=False;
    StrTglVerifikasiHasilPerbaikan:='NULL';
    VerifikasiHasilPerbaikanVerifikasiOleh.Text:='';
    KomentarVerifikasiHasilPerbaikan.Text:='';
  end;
end;

procedure TCetakKetidaksesuaianDanPerbaikan.ChkDiterimaVerifikasiTindakanPerbaikanClick(
  Sender: TObject);
begin
  if ChkDiterimaVerifikasiTindakanPerbaikan.Checked=True then
  begin
    int_diterima_verifikasi_tindakan_perbaikan:=1;
    TglVerifikasiTindakanPerbaikan.Visible:=True;
    StrTglVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglVerifikasiTindakanPerbaikan.Date));
  end else
  begin
    int_diterima_verifikasi_tindakan_perbaikan:=0;
    VerifikasiTindakanPerbaikanVerikasiOleh.Text:='';
    KomentarVerifikasiTindakanPerbaikan.Text:='';
  end;

  if (ChkDiterimaVerifikasiTindakanPerbaikan.Checked=False) AND (ChkPerluVerifikasiUlangTindakanPerbaikan.Checked=False) then
  begin
    TglVerifikasiTindakanPerbaikan.Visible:=False;
    StrTglVerifikasiTindakanPerbaikan:='NULL';
  end;

end;

procedure TCetakKetidaksesuaianDanPerbaikan.TglPerluVerifikasiHasilPerbaikanChange(
  Sender: TObject);
begin
  if (ChkPerluVerifikasiUlangHasilPerbaikan.Checked=True) then
  StrTglPerluVerifikasiHasilPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiHasilPerbaikan.Date));
end;

procedure TCetakKetidaksesuaianDanPerbaikan.TglPerluVerifikasiTindakanPerbaikanChange(
  Sender: TObject);
begin
if (ChkPerluVerifikasiUlangTindakanPerbaikan.Checked=True) then
  StrTglPerluVerifikasiTindakanPerbaikan:=QuotedStr(FormatDateTime('yyyy-mm-dd',TglPerluVerifikasiTindakanPerbaikan.Date));
end;

end.
