unit EmployeeIDRenewalU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, WHUnit, ExtCtrls;

type
  TEmployeeIdRenewal = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Nama: TEdit;
    MutasiDari: TEdit;
    EmployeeId: TEdit;
    Alamat: TEdit;
    TglGabung: TEdit;
    MutasiDariTanggal: TEdit;
    Status: TEdit;
    EksekutifReguler: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    MutasiKe: TComboBox;
    MutasiKeDisp: TEdit;
    TanggalMulai: TDateTimePicker;
    Keterangan: TMemo;
    Panel1: TPanel;
    Eksekutif: TRadioButton;
    Reguler: TRadioButton;
    Label9: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MutasiKeChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
  public
    { Public declarations }
    EmplId,EmplCode:String;
    EmplType:Integer;
    constructor Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String);Overload;
  end;

var
  EmployeeIdRenewal: TEmployeeIdRenewal;
  EmplId:String;
  EmplType,CompId:Integer;
  EmplArr:Array of String;
  LocationArr:Array of TArrString5;
  StrKTP,StrNama,StrTempatLahir,StrTglLahir,StrPendidikanTerakhir,StrInstitusi,StrAgama,StrReferensi,StrRefId,StrKPPRef:String;
  StrNoTelp,StrNoHP,StrEmplType,StrCompanyId,StrLocationId,StrAlamat,StrAnak,StrStatusNikah,StrSIMTipe,StrSIMNo:String;
  StrSIMExp,StrDayNight:String;
implementation

uses MainU,DateUtils;

{$R *.dfm}

constructor TEmployeeIdRenewal.Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    CompId:=3;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    CompId:=2;
    EmplCode:='BS';
  end else begin
    EmplType:=3;
    CompId:=1;
    EmplCode:='';
  end;
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;

procedure TEmployeeIdRenewal.Init;
begin
  EmployeeId.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  MutasiKe.Text:='';
  MutasiKe.ItemIndex:=0;
  MutasiDari.Text:='';
  MutasiKeDisp.Text:='';
  TanggalMulai.Date:=Now();
  GroupBox1.Enabled:=False;
  Simpan.Enabled:=True;
  EksekutifReguler.Text:='';
end;

procedure TEmployeeIdRenewal.RefreshCombo;
var IntCount:Integer;
begin
  for IntCount:=0 to Length(LocationArr)-1 do
    MutasiKe.Items.Add(LocationArr[IntCount][0]);
end;

procedure TEmployeeIdRenewal.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+EmplId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Nama.Text:=Qry.FieldValues['name'];
      StrNama:=Qry.FieldValues['name'];
      EmployeeId.Text:=Qry.FieldValues['employee_id'];
      StrKPPRef:=QuotedStr(Qry.FieldValues['employee_id']);
      if Qry.FieldValues['reference_id']<>NULL then StrRefId:=Qry.FieldValues['reference_id'] else StrRefId:='NULL';
      if Qry.FieldValues['reference']<>NULL then StrReferensi:=QuotedStr(Qry.FieldValues['reference']) else StrReferensi:='NULL';
      if Qry.FieldValues['id_number']<>NULL then StrKTP:=QuotedStr(Qry.FieldValues['id_number']) else StrKTP:='NULL';
      if Qry.FieldValues['birth_town']<>NULL then StrTempatLahir:=QuotedStr(Qry.FieldValues['birth_town']) else StrTempatLahir:='NULL';
      if Qry.FieldValues['birth_date']<>NULL then StrTglLahir:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Qry.FieldValues['birth_date']))) else StrTglLahir:='NULL';
      if Qry.FieldValues['address']<>NULL then begin
        Alamat.Text:=Qry.FieldValues['address'];
        StrAlamat:=Qry.FieldValues['address'];
      end else StrAlamat:='NULL';
      TglGabung.Text:=Qry.FieldValues['join_date'];
      MutasiDari.Text:=Qry.FieldValues['location'];
      MutasiDariTanggal.Text:=Qry.FieldValues['to_dates'];
      if Qry.FieldValues['reguler']=1 then begin
        EksekutifReguler.Text:='Reguler';
        Reguler.Checked:=True;
      end else begin
        EksekutifReguler.Text:='Eksekutif';
        Eksekutif.Checked:=True;
      end;
      case Qry.FieldValues['active'] of
        1:begin
            Status.Text:='Aktif';
          end;
        2:begin
            Status.Text:='NonAktif';
          end;
        0:begin
            Status.Text:='Keluar';
          end;
      end;
//    StrKTP,StrNama,StrTempatLahir,StrTglLahir,StrPendidikanTerakhir,StrInstitusi,StrAgama,StrReferensi,StrRefId,StrKPPRef
      if Qry.FieldValues['phone_no']<>NULL then StrNoTelp:=QuotedStr(Qry.FieldValues['phone_no']) else StrNoTelp:='NULL';
      if Qry.FieldValues['cellular_no']<>NULL then StrNoHP:=QuotedStr(Qry.FieldValues['cellular_no']) else StrNoHP:='NULL';
      if Qry.FieldValues['education_institution']<>NULL then StrInstitusi:=QuotedStr(Qry.FieldValues['education_institution']) else StrInstitusi:='NULL' ;
      if Qry.FieldValues['education_id']<>NULL then StrPendidikanTerakhir:=Qry.FieldValues['education_id'] else StrPendidikanTerakhir:='NULL';
      if Qry.FieldValues['religion_id']<>NULL then StrAgama:=Qry.FieldValues['religion_id'] else StrAgama:='NULL';
      StrEmplType:=Qry.FieldValues['employment_type_id'];
      StrCompanyId:=Qry.FieldValues['company_id'];
      StrLocationId:=Qry.FieldValues['location_id'];
      if Qry.FieldValues['marital_status_id']<>NULL then StrStatusNikah:=Qry.FieldValues['marital_status_id'] else StrStatusNikah:='NULL';
      if Qry.FieldValues['children']<>NULL then StrAnak:=Qry.FieldValues['children'] else StrAnak:='NULL';
      if Qry.FieldValues['religion_id']<>NULL then StrAgama:=Qry.FieldValues['religion_id'] else StrAgama:='NULL';
      if Qry.FieldValues['license_type_id']<>NULL then StrSIMTipe:=Qry.FieldValues['license_type_id'] else StrSIMTipe:='NULL';
      if Qry.FieldValues['license_id']<>NULL then StrSIMNo:=QuotedStr(Qry.FieldValues['license_id']) else StrSIMNo:='NULL' ;
      if Qry.FieldValues['license_expired']<>NULL then StrSIMExp:=QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(Qry.FieldValues['license_expired']))) else StrSIMExp:='NULL';
      StrDayNight:=Qry.FieldValues['day_night'];
{
    StrQry:='EXEC GetEmployeeResume '+Chr(39)+EmplId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
    end;
}
      StrQry:='SELECT * FROM wh_location WHERE active=1;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(LocationArr,IntCount+1);
        LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
        LocationArr[IntCount][1]:=Qry.FieldValues['location'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Destroy;
    end;
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TEmployeeIdRenewal.BatalClick(Sender: TObject);
begin
  EmployeeIdRenewal.Close;
end;

procedure TEmployeeIdRenewal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeIdRenewal.FormShow(Sender: TObject);
begin
  Init;
  EmployeeId.Text:=EmplId;
  LoadData;
  RefreshCombo;
end;

procedure TEmployeeIdRenewal.MutasiKeChange(Sender: TObject);
begin
  if MutasiKe.Text<>'' then MutasiKeDisp.Text:=LocationArr[MutasiKe.ItemIndex][1];
end;

procedure TEmployeeIdRenewal.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrQry2,StrCompanyId,StrMsg,StrLocationId,StrNewLocation,StrStatus:String;
    StrReguler,NewId,StrDebt,StrSaving,StrKS,StrLaka,StrJaminan,StrAmount,TransId,TransId2,StrTransType:String;
    IsOk:Boolean;
begin
  Main.M_Busy;
  StrMsg:='';
  if (MutasiKe.Text<>'') AND (StrToDate(MutasiDariTanggal.Text)<(TanggalMulai.DateTime)) then begin
    Simpan.Enabled:=False;
    StrNewLocation:=MutasiKe.Text;
    StrCompanyId:=IntToStr(CompId);
    StrLocationId:=LocationArr[MutasiKe.ItemIndex][0];
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT RIGHT(MAX(employee_id),4) AS employee_id FROM wh_employee '+
              'WHERE employee_id LIKE '+Chr(39)+EmplCode+FormatDateTime('yy',TanggalMulai.Date)+
              FormatDateTime('mm',TanggalMulai.Date)+'____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['employee_id']<>NULL then begin
        NewId:=Qry.FieldValues['employee_id'];
        NewId:=Format('%.*d',[4,StrToInt(NewId)+1]);
      end else
        NewId:='0001';
      Qry.Close;
      Qry.SQL.Clear;
      NewId:=EmplCode+FormatDateTime('yy',TanggalMulai.Date)+FormatDateTime('mm',TanggalMulai.Date)+NewId;
      StrQry:='INSERT INTO wh_employee '+
              '(employee_id,id_number,name,birth_town,birth_date,'+
              'education_id,education_institution,religion_id,join_date,'+
              'reference_id,reference,old_id_reference,update_user) '+
              'VALUES ('+QuotedStr(NewId)+','+StrKTP+
              ','+QuotedStr(StrNama)+','+StrTempatLahir+
              ','+StrTglLahir+
              ','+StrPendidikanTerakhir+','+StrInstitusi+','+StrAgama+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalMulai.Date))+
              ','+StrRefId+','+StrReferensi+','+StrKPPRef+','+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=StrMsg+E.Message;
        end;
      end;
      StrQry:='INSERT INTO wh_empl_detail (employee_id,address,phone_no,cellular_no,'+
                'marital_status_id,children,kpp_expired,license_type_id,license_id,'+
                'license_expired,day_night,update_user) '+
                'VALUES ('+QuotedStr(NewId)+','+QuotedStr(StrAlamat)+
                ','+StrNoTelp+','+StrNoHP+','+StrStatusNikah+','+StrAnak+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',IncYear(TanggalMulai.Date,1)))+
                ','+StrSIMTipe+','+StrSIMNo+','+StrSIMExp+','+StrDayNight+','+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=StrMsg+E.Message;
        end;
      end;
      if Eksekutif.Checked=True then StrReguler:='0' else if Reguler.Checked=True then StrReguler:='1';
      StrStatus:='1';
      StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id'+
              ',from_date,status_id,reguler,update_user)'+
              ' VALUES ('+QuotedStr(NewId)+','+StrEmplType+','+StrCompanyId+','+StrLocationId+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalMulai.Date))+','+StrStatus+
              ','+StrReguler+','+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=StrMsg+E.Message;
        end
      end;
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
        TransId2:=Format('%.*d',[4,StrToInt(TransId)+1]);
        Qry.Close;
        Qry.SQL.Clear;
      end else begin
        TransId:='0001';
        TransId2:='0002';
      end;
      TransId:='SPM'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
               FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      TransId2:='SPM'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
               FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId2;
      StrQry:='';
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',1) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        StrTransType:='120108';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',2) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        if Qry.FieldValues['amount']>0 then StrTransType:='130109'
        else StrTransType:='120110';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',3) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        StrTransType:='120109';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',4) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        StrTransType:='120111';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',5) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        if Qry.FieldValues['amount']>0 then StrTransType:='130122'
        else StrTransType:='120113';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',6) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        StrTransType:='120118';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      StrQry2:='SELECT dbo.GetTotalAmount('+StrKPPRef+',7) AS amount ;'  ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry2);
      Qry.Open;
      if (Qry.FieldValues['amount']<>0) then begin
        StrTransType:='120114';
        StrAmount:=Qry.FieldValues['amount'];
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId)+','+QuotedStr(StrTransType)+
                ','+IntToStr(0-StrToInt(StrAmount))+','+IntToStr(0-StrToInt(StrAmount))+','+QuotedStr(User)+');';
        StrQry:=StrQry+' INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id'+
                ',amount,total,update_user) VALUES ('+QuotedStr(TransId2)+','+QuotedStr(StrTransType)+','+StrAmount+
                ','+StrAmount+','+QuotedStr(User)+');';
      end;
      Qry.Close;
      if StrQry<>'' then begin
        StrQry:=StrQry+'INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,update_user)'+
                ' VALUES ('+QuotedStr(TransId)+','+StrKPPRef+','+QuotedStr(TransId2)+',GETDATE(),'+QuotedStr(User)+');';
        StrQry:=StrQry+'INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,update_user)'+
                ' VALUES ('+QuotedStr(TransId2)+','+QuotedStr(NewId)+','+QuotedStr(TransId)+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=StrMsg+E.Message;
          end
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,PChar('Berhasil Disimpan'),'Karyawan/Mitra/Driver Masuk Kembali',MB_OK or MB_ICONINFORMATION);
        Close;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal Disimpan'+Chr(13)+Chr(13)+StrMsg),'Karyawan/Mitra/Driver Masuk Kembali',MB_OK or MB_ICONERROR);
        Simpan.Enabled:=True;
      end;
      Qry.Destroy;
      Main.CloseDb;
    end;
  end else begin
    StrMsg:='Lokasi tidak boleh kosong';
    IsOk:=False;
  end;
  Main.M_Normal;
end;

end.
