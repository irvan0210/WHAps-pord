unit TroubleshootingRequestFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, ComCtrls, WHUnit, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppStrtch,
  ppMemo, pngimage, jpeg, Buttons, frxpngimage;

type
  TTroubleshootingRequestForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Pool_lokasi: TEdit;
    jabatan_departemen: TEdit;
    panel: TPanel;
    Selesai: TButton;
    Simpan: TButton;
    nama_user: TEdit;
    Label11: TLabel;
    tgl_permintaan: TDateTimePicker;
    cetak: TButton;
    Detail_permintaan: TMemo;
    Label23: TLabel;
    ChkCopy: TCheckBox;
    Cari: TButton;
    ppReportTRF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabelJudul: TppLabel;
    ppLabelNomor: TppLabel;
    ppLabel2: TppLabel;
    ppImage2: TppImage;
    ppDetailBand1: TppDetailBand;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabelTglPengajuan: TppLabel;
    ppLabelLokasi: TppLabel;
    ppLabelBussiness: TppLabel;
    ppLabeljabatan: TppLabel;
    ppLabelNamaLengkap: TppLabel;
    ppLabel25: TppLabel;
    ppLabeltgl: TppLabel;
    ppLabelTindakan: TppMemo;
    ppLabelDetailPermintaan: TppMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppLabelUserpembuat: TppLabel;
    no_TRF: TEdit;
    CariUser: TSpeedButton;
    Label14: TLabel;
    Label7: TLabel;
    BussinissUnit: TEdit;
    cb_jenis_truouble: TComboBox;
    Label12: TLabel;
    requested_user_id: TEdit;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabelPenerima: TppLabel;
    ppLabelCatatan: TppLabel;
    ppLabelTglSelesai: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel9: TppLabel;
    ppLabel15: TppLabel;
    ppLabelJenisPermintaan: TppLabel;
    Bersihkan: TButton;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    PanelTindakan: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    tindakan: TMemo;
    Label6: TLabel;
    tgl_selesai: TDateTimePicker;
    chk_sesuai_permintaan: TCheckBox;
    Label9: TLabel;
    catatan: TMemo;
    PanelRespomUser: TPanel;
    Status: TCheckBox;
    Label13: TLabel;
    CatatanUser: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    TimePermintaan: TDateTimePicker;
    TimeSelesai: TDateTimePicker;
    Batal: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure catatanKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshDepartemen;
    procedure Detail_permintaanKeyPress(Sender: TObject; var Key: Char);
    procedure nama_userKeyPress(Sender: TObject; var Key: Char);
    procedure cetakClick(Sender: TObject);
    procedure ChkCopyClick(Sender: TObject);
    procedure CariClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure CariUserClick(Sender: TObject);
    procedure cb_jenis_truoubleKeyPress(Sender: TObject; var Key: Char);
    procedure tindakanKeyPress(Sender: TObject; var Key: Char);
    procedure tgl_selesaiKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure chk_sesuai_permintaanClick(Sender: TObject);
    procedure tgl_permintaanChange(Sender: TObject);
    procedure tgl_selesaiChange(Sender: TObject);
    procedure BatalClick(Sender: TObject);

  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
   // function IsFormOpen(const FormName : string): Boolean;
    constructor Create(AOwner:TComponent;Trf_NO:String='';IsViewOnly:Boolean=False);overload;
    procedure CopyTechnicalRecommendation(TechnicalRecommendation_Id:String);
    procedure SetUser(User_id:String);
  end;

var
  TroubleshootingRequestForm: TTroubleshootingRequestForm;
  StrTRFNO, StrLastDepartemenId, StrLastDepartemen:String;
  IsView:Boolean;
  DepartemenArr:Array of TArrString4;
  
implementation

uses MainU,  TechnicalRecommendationListU, SubMenuFormU,
  TechnicalRecommendationU, UserListU, DateUtils;

{$R *.dfm}

constructor TTroubleshootingRequestForm.Create(AOwner:TComponent;Trf_NO:String='';IsViewOnly:Boolean=False);
begin
  StrTRFNO:=Trf_NO;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TTroubleshootingRequestForm.Init;
begin
  no_TRF.Clear;
  nama_user.Clear;
  jabatan_departemen.Clear;
  Pool_lokasi.Clear;
  Detail_permintaan.Clear;
  tindakan.Clear;
  tgl_permintaan.Date := Now;
  TimePermintaan.Time := Now;
  tgl_selesai.Date := Now;
  TimeSelesai.Time := Now;
 // status.Checked := True;
 // status.Enabled := False;
  BussinissUnit.Clear;
  catatan.Clear;
  cetak.Enabled := False;
  chk_sesuai_permintaan.Checked := False;
  cb_jenis_truouble.SetFocus;
 
end;

procedure TTroubleshootingRequestForm.LoadData;
var Qry:TADOQuery;
    StrQry, StrDepartement:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:= 'EXEC GetTroubleshootingList @TRFNo='+QuotedStr(StrTRFNO)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      no_TRF.Text:=Qry.FieldValues['trf_no'];
      tgl_permintaan.Date:=StrToDateTime(Qry.FieldValues['request_date']);
      TimePermintaan.Time := Frac(StrToDateTime(FormatDateTime('HH:mm:ss',Qry.FieldValues['request_date']))); //Trunc(StrToDateTime(FormatDateTime('HH:mm:ss',Qry.FieldValues['request_date'])));
      cb_jenis_truouble.ItemIndex := cb_jenis_truouble.Items.IndexOf(Qry.FieldValues['type']);
      nama_user.Text:=Qry.FieldValues['name'];
      requested_user_id.Text := Qry.FieldValues['requested_user'];
      jabatan_departemen.Text:=Qry.FieldValues['nama_departement'];
      Pool_lokasi.Text:=Qry.FieldValues['location'];
      BussinissUnit.Text:= Qry.FieldValues['company'];
      Detail_permintaan.Lines.Text:= Qry.FieldValues['detail_troubles'];
      tindakan.Lines.Text := Qry.FieldValues['action'];
      tgl_selesai.Date:=StrToDateTime(Qry.FieldValues['completion_date']);
      if Qry.FieldValues['action'] <> '' then
       TimeSelesai.Time:= Frac(StrToDateTime(FormatDateTime('HH:mm:ss',Qry.FieldValues['completion_date'])))
      else
        TimeSelesai.Time:= Frac(StrToDateTime(FormatDateTime('HH:mm:ss',Now)));
        //FormatDateTime('yyyy/MM/dd HH:mm:ss',DateTimePermintaan)
      catatan.Text:=Qry.FieldValues['note'];
      if Qry.FieldValues['user_note'] <> null then CatatanUser.Text:=Qry.FieldValues['user_note']
      else CatatanUser.Text:= '';

      if Qry.FieldValues['status']='2' then begin
        status.Checked:=True ;
        if (DepartmentId = '13') then begin
        //(user = 'irvan.ruswanto') or (user = 'ari') then
          Status.Enabled:= True;
        end else begin
          Status.Enabled:= False;
          Simpan.Enabled := False;
        end;
      end else begin
        status.Checked:=False;
        Status.Enabled:= True;
      end;

    end;
    Qry.Close;
    Main.CloseDb;
    //Departemen.ItemIndex:= Departemen.Items.IndexOf(StrDepartement);
    //ChkCopy.Enabled := False;
  end;
end;

procedure TTroubleshootingRequestForm.Input(IsEnable:Boolean);
begin
 // GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TTroubleshootingRequestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTroubleshootingRequestForm.FormShow(Sender: TObject);
begin
  Init;
  if StrTRFNO<>'' then begin
    tgl_permintaan.Enabled := True;
    //status.Enabled := True;
    cetak.Enabled := True;
    LoadData;
    Bersihkan.Enabled := False;
  end;

 //MessageBox(0,PChar(DepartmentId),'Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
 // RefreshDepartemen;
  if (DepartmentId <> '13') then begin
     tgl_permintaan.Enabled := False;
     TimePermintaan.Enabled := False;
     Simpan.Caption := 'Buat';
     CariUser.Visible := False;
     Bersihkan.Visible := False;


     if (tindakan.Text<>'')then begin
        //Height := Height-145;
        PanelRespomUser.Visible := True;
        PanelTindakan.Visible := True;
        PanelTindakan.Enabled := False;
        Detail_permintaan.ReadOnly := True;
        Simpan.Caption := 'Ubah';
        Batal.Visible := False;
     end else begin
        Height := Height-190;
        SetUser(User);
        PanelRespomUser.Visible := False;
        PanelTindakan.Visible := False;
       // Simpan.Caption := 'Ubah';
       // Batal.Enabled := False;
     end;
     if StrTRFNO ='' then Batal.Enabled := False;
  end;

  if IsView then Input(False)
  else Input(True);
  Randomize;
end;

procedure TTroubleshootingRequestForm.SimpanClick(Sender: TObject);
var
  Qry:TADOQuery;
  StrQry,StrMsg,StrException, StrTechnicalRekomNO, StrDepartemenId,
  StrStatus, StrPesan, StrPerkiraanHarga:String;
  IntCount:Integer;
  IsOk:Boolean;
  DateTimePermintaan, DateTimeResponse, DateTimeSelesai: TDateTime;
  MenitResponse, MenitSelesai: Integer;
begin
  if (Trim(nama_user.Text)<>'') and (Detail_permintaan.Text <>'') then begin
    IsOk:=True;
    //MenitTambahan := Random(11) + 5; // 5 s/d 15 menit
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
     // for IntCount:=0 to Length(DepartemenArr)-1 do
      //if DepartemenArr[IntCount][1]=Departemen.Text then StrDepartemenId:=DepartemenArr[IntCount][0];

      if status.Checked = True then StrStatus := '2'
      else StrStatus := '1';

      if StrTRFNO = '' then begin
          StrQry:='SELECT dbo.GetNewTRFNo() AS hasil;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then
          StrTRFNO :=Qry.FieldValues['hasil'];
      end;

     // DateTimePermintaan := Trunc(tgl_permintaan.Date) + Frac(TimePermintaan.Time);
     // DateTimeSelesai := Trunc(tgl_selesai.Date) + Frac(TimeSelesai.Time);

      DateTimePermintaan := Trunc(tgl_permintaan.Date) + Frac(TimePermintaan.Time);
      MenitResponse := Random(15) + 1; // 1 s/d 15 menit
      MenitSelesai  := Random(30) + 1; // 1 s/d 30 menit

      DateTimeResponse := IncMinute(DateTimePermintaan, MenitResponse);
      DateTimeSelesai  := IncMinute(DateTimeResponse, MenitSelesai);

      if no_TRF.Text <> '' then begin
         {StrQry := 'UPDATE wh_troubleshooting SET '+
                    'request_date ='+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',DateTimePermintaan))+', '+
                    'type ='+QuotedStr(cb_jenis_truouble.Text)+','+
                    'requested_user = '+QuotedStr(requested_user_id.Text)+','+
                    'detail_troubles = '+QuotedStr(Detail_permintaan.Text)+','+
                    'action = '+QuotedStr(tindakan.Text)+','+
                    'user_pic = '+QuotedStr(User)+','+
                    'note = '+QuotedStr(catatan.Text)+','+
                   // 'completion_date = '+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',DateTimeSelesai))+','+
                    'completion_date = '+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',IncMinute(DateTimeSelesai, MenitTambahan)))+','+
                    'status ='+QuotedStr(StrStatus)+','+
                    'update_user ='+QuotedStr(User)+',update_date = GETDATE() '+
               'WHERE  trf_no = '+QuotedStr(no_TRF.Text)+';';   }
          StrQry := 'UPDATE wh_troubleshooting SET '+
            'request_date = '+QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimePermintaan))+', '+
            'response_date = COALESCE(response_date, '+QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimeResponse))+'), '+
            'type = '+QuotedStr(cb_jenis_truouble.Text)+','+
            'requested_user = '+QuotedStr(requested_user_id.Text)+','+
            'detail_troubles = '+QuotedStr(Detail_permintaan.Text)+','+
            'action = '+QuotedStr(tindakan.Text)+','+
            'user_pic = '+QuotedStr(User)+','+
            'note = '+QuotedStr(catatan.Text)+','+
            'completion_date = '+QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimeSelesai))+','+
            'status = '+QuotedStr(StrStatus)+','+
            'update_user = '+QuotedStr(User)+', update_date = GETDATE() '+
            'WHERE trf_no = '+QuotedStr(no_TRF.Text)+';';

         StrPesan:= 'Berhasil mengubah  TRF';

      end
      else begin
        {StrQry := 'INSERT INTO wh_troubleshooting (trf_no, request_date, type,requested_user,detail_troubles,action, '+
                  'completion_date,user_pic, note, user_create,create_date, update_user, update_date) VALUES ( '+
                  QuotedStr(StrTRFNO)+', '+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',DateTimePermintaan))+', '+
                  QuotedStr(cb_jenis_truouble.Text)+', '+QuotedStr(requested_user_id.Text)+', '+
                  QuotedStr(Detail_permintaan.Text)+', '+QuotedStr(tindakan.Text)+', '+
                  //QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss'IncMinute(DateTimeSelesai, MenitTambahan)))+', '+
                 QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss', IncMinute(DateTimeSelesai, MenitTambahan)))+', '+
                  QuotedStr(User)+','+QuotedStr(catatan.Text)+','+
                  QuotedStr(User)+', '+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',Now()))+', '+
                  QuotedStr(User)+', '+QuotedStr(FormatDateTime('yyyy/MM/dd HH:mm:ss',Now()))+');';}

          StrQry := 'INSERT INTO wh_troubleshooting '+
            '(trf_no, request_date, response_date, type, requested_user, detail_troubles, action, '+
            'completion_date, user_pic, note, user_create, create_date, update_user, update_date) VALUES ( '+
            QuotedStr(StrTRFNO)+', '+
            QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimePermintaan))+', '+
            QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimeResponse))+', '+
            QuotedStr(cb_jenis_truouble.Text)+', '+
            QuotedStr(requested_user_id.Text)+', '+
            QuotedStr(Detail_permintaan.Text)+', '+
            QuotedStr(tindakan.Text)+', '+
            QuotedStr(FormatDateTime('yyyy-mm-dd HH:nn:ss',DateTimeSelesai))+', '+
            QuotedStr(User)+','+
            QuotedStr(catatan.Text)+','+
            QuotedStr(User)+', GETDATE(), '+
            QuotedStr(User)+', GETDATE());';
        StrPesan:= 'Berhasil Menyimpan TRF';
      end;

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);                                            //SToInt(BBMRupiah.Text
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah TRF';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    
    if IsOk then begin
      MessageBox(0,PChar(StrPesan),'Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
      if status.Checked <> False then begin
        if MessageBox(0,PChar('Cetak TRF?') ,'Troubleshooting Request Form',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
           cetakClick(Sender);
        end;
      end;

     { if Main.IsFormOpen('TechnicalRecommendationList') then begin
        TechnicalRecommendationList.RefreshDepartemen;
        TechnicalRecommendationList.SearchClick(Sender);
      end;  }
      if (DepartmentId = '13') then Init
      else Detail_permintaan.Clear;
      Detail_permintaan.SetFocus;
      StrTRFNO := '';
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Troubleshooting Request Form',MB_OK or MB_ICONERROR);
    end;
  end else begin
    StrMsg:='Inputan tanda * '+Chr(13)+'tidak boleh kosong !!';
    MessageBox(0,PChar(StrMsg),'Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
  end;

//  if IsOk then SubMenuForm.Close;

end;

procedure TTroubleshootingRequestForm.catatanKeyPress(Sender: TObject;
  var Key: Char);
begin
  //  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
    if Key=#13 then Simpan.SetFocus;
end;

procedure TTroubleshootingRequestForm.RefreshDepartemen;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
 { Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(DepartemenArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT department_id,name FROM wh_department WHERE active =1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(DepartemenArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        DepartemenArr[IntCount][0]:=Qry.FieldValues['department_id'];
        DepartemenArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

  if StrLastDepartemenId<>'' then begin
    SetLength(DepartemenArr,Length(DepartemenArr)+1);
    DepartemenArr[Length(DepartemenArr)-1][0]:=StrLastDepartemenId;
    DepartemenArr[Length(DepartemenArr)-1][1]:=StrLastDepartemen;
  end;
  for IntCount:=0 to Length(DepartemenArr)-1 do
    Departemen.Items.Add(DepartemenArr[IntCount][1]);   }
end;

procedure TTroubleshootingRequestForm.Detail_permintaanKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then tindakan.SetFocus;
end;

procedure TTroubleshootingRequestForm.nama_userKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Detail_permintaan.SetFocus;
end;

procedure TTroubleshootingRequestForm.cetakClick(Sender: TObject);
 var Qry:TADOQuery;
    StrQry,StrNoTRF:String;
    list:TStringList;
begin
  //if TechnicalRekomNO.Text <> '' then begin
    list:=TStringList.Create;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;

    if no_TRF.Text <> ''then
      StrNoTRF := no_TRF.Text
    else StrNoTRF := StrTRFNO;

    if Main.OpenDb then begin
      StrQry:= 'EXEC GetTroubleshootingList @TRFNo='+QuotedStr(StrNoTRF)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount > 0 then begin
       // B := TStringList.Create;
        ppLabelNomor.Caption :=  Qry.FieldValues['trf_no'];//no TRF.Text;
        ppLabelTglPengajuan.Caption :=Qry.FieldValues['request_date']; //   StrToDateTime(DateToStr(tgl_rekomendasi.date);
        ppLabelNamaLengkap.Caption := Qry.FieldValues['name'];//JenisBarang.Text;
        ppLabelJenisPermintaan.Caption := Qry.FieldValues['type'];//AlasanPengadaan.Text;
        ppLabeljabatan.Caption := Qry.FieldValues['nama_departement'];//NoPerangkatLama.Text;
        ppLabelLokasi.Caption := Qry.FieldValues['location'];//Departemen.Text;
        ppLabelBussiness.Caption := Qry.FieldValues['company'];//Requestor.Text;
        ppLabelDetailPermintaan.Lines.Text := Qry.FieldValues['detail_troubles'];//Jumlah.Text;
       // MessageBox(0,PChar(MerkdanSpesifikasi.Text),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
       // ppLabelMerkdanSpek.Caption :=MerkdanSpesifikasi.Text;//TStringList(MerkdanSpesifikasi.Lines);
        ppLabelTindakan.Lines.Text := (Qry.FieldValues['action']);
        ppLabelUserpembuat.Caption := Qry.FieldValues['name']; //PerkiraanHarga.Text;
        ppLabelPenerima.Caption := Qry.FieldValues['user_pic']; //StrToDateTime(DateToStr(RecomExpired.Date);
        ppLabelTglSelesai.Caption := Qry.FieldValues['completion_date'];
        if Qry.FieldValues['note'] <> null then ppLabelCatatan.Caption := Qry.FieldValues['note']
        else ppLabelCatatan.Caption := ' - ';
        ppLabeltgl.Caption := 'Jakarta, '+DateTimeToStr(Qry.FieldValues['request_date']);
        Main.M_Normal;
        ppReportTRF.PreviewFormSettings.WindowState:=wsMaximized;
        ppReportTRF.Print;
      end else begin
        MessageBox(0,'Tidak ada data yang dipilih..','Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
 // end
 // else begin
   //   MessageBox(0,'Tidak ada data yang dipilih..','Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
 // end;
end;

procedure TTroubleshootingRequestForm.CopyTechnicalRecommendation(TechnicalRecommendation_Id:String);
var Qry:TADOQuery;
    StrQry, StrDepartement:String;
begin
 { if TechnicalRecommendation_Id <>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:= 'EXEC GetTechnicalRecommendationList '+QuotedStr(CompanyId)+','''','''',''0'','+QuotedStr(TechnicalRecommendation_Id)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        //tgl_rekomendasi.Date:=StrToDateTime(Qry.FieldValues['date']);
       // TechnicalRekomNO.Text:=Qry.FieldValues['technical_recommendation_no'];
        JenisBarang.Text:=Qry.FieldValues['type_of_good'];
        AlasanPengadaan.Text:=Qry.FieldValues['reason_for_procurement'];
        NoPerangkatLama.Text:=Qry.FieldValues['old_device_no'];
        //Departemen.ItemIndex:= Qry.FieldValues['department_id'];
        StrDepartement:= Qry.FieldValues['departement_name'];
        Requestor.Text:=Qry.FieldValues['user_requestor'];
        Jumlah.Text:=SToCurr(Qry.FieldValues['qty']);
        MerkdanSpesifikasi.Text:=Qry.FieldValues['brand_and_specification'];
        PerkiraanHarga.Text:=SToCurr(Qry.FieldValues['price_forecasts']);
       // RecomExpired.Date:=StrToDateTime(Qry.FieldValues['recommendation_expired']);
        if Qry.FieldValues['status'] then status.Checked:=True else status.Checked:=False;;
      end;
      Qry.Close;
      Main.CloseDb;
      Departemen.ItemIndex:= Departemen.Items.IndexOf(StrDepartement);
    end;
    Main.CloseDb;
    Main.M_Normal;
  end;   }
end;

procedure TTroubleshootingRequestForm.SetUser(User_Id:String);
var Qry:TADOQuery;
    StrQry, StrDepartement:String;
begin
  if User_Id <>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:= 'EXEC GetUserTroubleshooting '+QuotedStr(User_Id)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        requested_user_id.Text := Qry.FieldValues['username'];
        nama_user.Text:=Qry.FieldValues['name'];
        jabatan_departemen.Text:=Qry.FieldValues['nama_departement'];
        Pool_lokasi.Text:=Qry.FieldValues['location'];
        BussinissUnit.Text:= Qry.FieldValues['company'];
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TTroubleshootingRequestForm.ChkCopyClick(Sender: TObject);
begin
 if ChkCopy.Checked = True then
   Cari.Enabled := True
 else Cari.Enabled := False;

end;

procedure TTroubleshootingRequestForm.CariClick(Sender: TObject);
begin
 // TechnicalRecommendationList:=TTechnicalRecommendationList.Create(Self,'COPY_DATA');
 end;

procedure TTroubleshootingRequestForm.SelesaiClick(Sender: TObject);
begin
  TroubleshootingRequestForm.Close;
end;

procedure TTroubleshootingRequestForm.CariUserClick(Sender: TObject);
begin
  UserList:=TUserList.Create(Self);
end;

procedure TTroubleshootingRequestForm.cb_jenis_truoubleKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then nama_user.SetFocus;
end;

procedure TTroubleshootingRequestForm.tindakanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then tgl_selesai.SetFocus;
end;

procedure TTroubleshootingRequestForm.tgl_selesaiKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key=#13 then catatan.SetFocus;
end;

procedure TTroubleshootingRequestForm.BersihkanClick(Sender: TObject);
begin
  Init;

 { no_TRF.Clear;
  tgl_permintaan.Date := Now;
  nama_user.Clear;
  jabatan_departemen.Clear;
  Pool_lokasi.Clear;
  BussinissUnit.Clear;
  Detail_permintaan.Clear;
  tindakan.Clear;
  tgl_selesai.Date := Now;
  catatan.Clear;
  cetak.Enabled := False;
  chk_sesuai_permintaan.Checked := False;
  StrTRFNO := ''; }
end;

procedure TTroubleshootingRequestForm.chk_sesuai_permintaanClick(
  Sender: TObject);
begin
  if  tindakan.Lines.Text ='' then
  begin
   // chk_sesuai_permintaan.Enabled := True;
    if chk_sesuai_permintaan.Checked = True  then
      tindakan.Lines.Text := 'Sudah dikerjakan sesuai permintaan'
    else if chk_sesuai_permintaan.Checked = False then
      tindakan.Clear;
  end else //chk_sesuai_permintaan.Enabled := False;
   MessageBox(0,PChar('Tindakan Harus Kosong'),'Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
end;

procedure TTroubleshootingRequestForm.tgl_permintaanChange(
  Sender: TObject);
begin
  if tgl_selesai.Date<tgl_permintaan.Date then tgl_selesai.Date:=tgl_permintaan.Date;
end;

procedure TTroubleshootingRequestForm.tgl_selesaiChange(Sender: TObject);
begin
  if tgl_permintaan.Date>tgl_selesai.Date then tgl_permintaan.Date:=tgl_selesai.Date;
end;

procedure TTroubleshootingRequestForm.BatalClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrException,StrMsg:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (no_TRF.Text <> '') and (tindakan.Text='') then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Yakin ingin hapus TRF no : ' + no_TRF.Text + '..?') ,'Troubleshooting Request Form',MB_OKCANCEL or MB_ICONWARNING)=1 then begin
      if Main.OpenDb then begin
        StrQry := 'UPDATE wh_troubleshooting SET status =0 ,'+
                  'update_user ='+QuotedStr(User)+',update_date = GETDATE() '+
                  'WHERE  trf_no = '+QuotedStr(no_TRF.Text)+';';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menambah TRF';
            StrException:=E.Message;
          end;
        end;
        Qry.Close;
        Main.CloseDb;
      end;

      if IsOk then begin
        MessageBox(0,PChar('TRF berhasil dibatalkan'),'Troubleshooting Request Form',MB_OK or MB_ICONINFORMATION);
       { if status.Checked <> False then begin
          if MessageBox(0,PChar('Cetak TRF?') ,'Troubleshooting Request Form',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
             cetakClick(Sender);
          end;
        end;  }
        if DepartmentId <> '13' then Detail_permintaan.Clear
        else Init;
        StrTRFNO := '';
        cb_jenis_truouble.SetFocus;
      end else begin
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Troubleshooting Request Form',MB_OK or MB_ICONERROR);
      end;
    end;
  end else if (tindakan.Text<>'')then begin
     MessageBox(0,PChar('TRF sudah ada tindakan'#13#10 +
        'Silahkan hubungi IT'),'Troubleshooting Request Form',MB_OK or MB_ICONWARNING);
  end;
end;

end.
