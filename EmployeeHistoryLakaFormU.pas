unit EmployeeHistoryLakaFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, frxClass, frxDBSet, StdCtrls, ExtCtrls, Mask, Spin, Jpeg,
  ComCtrls, WHUnit;

type
  TEmployeeHistoryLakaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ts1: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    lblJamkejadian: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lblTools: TLabel;
    lblProsess: TLabel;
    lblAbsent: TLabel;
    lblMateriSejumlah: TLabel;
    lblKet_materi: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Pelapor: TEdit;
    Lokasi: TEdit;
    Tgl: TEdit;
    Jam: TMaskEdit;
    Kerusakan: TMemo;
    NamaKorban: TEdit;
    UmurKorban: TSpinEdit;
    AlatTerlibat: TEdit;
    Proses: TEdit;
    AmountDesc: TEdit;
    Amount: TMemo;
    TdkMasukKerja: TSpinEdit;
    LamaBekerjaTahun: TMemo;
    LamaBekerjaBulan: TMemo;
    Armada: TEdit;
    CariArmada: TButton;
    TglKejadian: TDateTimePicker;
    JenisKecelakaan: TComboBox;
    pnl1: TPanel;
    labelAccident: TLabel;
    LabelKet: TLabel;
    lblSaranAtasan: TLabel;
    lblSaranQHSE: TLabel;
    lblSaranDireaksi: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SebabDasar: TMemo;
    SebabLangsung: TMemo;
    Kronologi: TMemo;
    NoteSpv: TMemo;
    NoteMR: TMemo;
    NoteDir: TMemo;
    pnlunsafe: TPanel;
    chkUnsafeAction: TCheckBox;
    chkUnsafeCondition: TCheckBox;
    pnlfactor: TPanel;
    chkPersonalFactor: TCheckBox;
    chkJobFactor: TCheckBox;
    Panel1: TPanel;
    Simpan: TButton;
    Selesai: TButton;
    Cetak: TButton;
    Bersihkan: TButton;
    frxrprt: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    qryHistLaka: TADOQuery;
    GroupBox4: TGroupBox;
    GroupFoto: TGroupBox;
    Foto: TImage;
    GroupBox2: TGroupBox;
    FotoKronologi: TImage;
    GroupBox3: TGroupBox;
    FotoSanksi: TImage;
    GroupSIM: TGroupBox;
    FotoTindakanPerbaikan: TImage;
    UploadFileFoto: TButton;
    UploadFileKronologi: TButton;
    UploadFileSanksi: TButton;
    UploadFileTindakanPerbaikan: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AmountExit(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure AmountChange(Sender: TObject);
    procedure AmountEnter(Sender: TObject);
    procedure AmountKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiKeyPress(Sender: TObject; var Key: Char);
    procedure JamKeyPress(Sender: TObject; var Key: Char);
    procedure PelaporKeyPress(Sender: TObject; var Key: Char);
    procedure KerusakanKeyPress(Sender: TObject; var Key: Char);
    procedure NamaKorbanKeyPress(Sender: TObject; var Key: Char);
    procedure UmurKorbanKeyPress(Sender: TObject; var Key: Char);
    procedure AlatTerlibatKeyPress(Sender: TObject; var Key: Char);
    procedure ProsesKeyPress(Sender: TObject; var Key: Char);
    procedure CetakClick(Sender: TObject);
    procedure frxrprtBeforePrint(Sender: TfrxReportComponent);
    procedure AmountDescKeyPress(Sender: TObject; var Key: Char);
    procedure CariArmadaClick(Sender: TObject);
    procedure FotoDblClick(Sender: TObject);
    procedure UploadFileFotoClick(Sender: TObject);
    procedure FotoKronologiDblClick(Sender: TObject);
    procedure FotoSanksiDblClick(Sender: TObject);
    procedure FotoTindakanPerbaikanDblClick(Sender: TObject);
    procedure UploadFileKronologiClick(Sender: TObject);
    procedure UploadFileSanksiClick(Sender: TObject);
    procedure UploadFileTindakanPerbaikanClick(Sender: TObject);
  private
    { Private declarations }
    StrQry,StrQry2,UnsafeAction,UnsafeCondition,PersonalFactor,JobFactor,EmplHistoryID,FormReq:String;
    JenisKecelakaanArr:Array of TArrString2 ;
    procedure Init;
    procedure Save;
    procedure Update;
    procedure GetEmployee;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Empl_ID,Empl_HistoryID,Form_Req:String);Overload;
//    constructor Create(AOwner:TComponent;Empl_HistLakaId:Integer);Overload;

  end;

var
  EmployeeHistoryLakaForm: TEmployeeHistoryLakaForm;
  EmplId,VehicleIDHistLaka:string;

implementation

uses
  MainU, EmployeeHistoryLakaListU, VehicleListU, EmployeeHistoryLakaRptU,
  ImageViewerU;

{$R *.dfm}

constructor TEmployeeHistoryLakaForm.Create(AOwner:TComponent;Empl_ID,Empl_HistoryID,Form_Req:String);
begin
  if Empl_ID<>'' then EmplId:=Empl_ID else EmplId:='';
  if Empl_HistoryID<>'' then EmplHistoryID:=Empl_HistoryID else EmplHistoryID:='';
  if Form_Req<>'' then FormReq:=Form_Req;
  inherited Create(AOwner);
end;

procedure TEmployeeHistoryLakaForm.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  PageControl1.ActivePage:=TabSheet1;

  Cetak.Enabled:=False;
  Simpan.Enabled:=True;
  Tgl.Text:= '';
  Lokasi.Text:='';
  Jam.Text:='';
  Pelapor.Text:='';
  Kerusakan.Text:='';
  NamaKorban.Text:='';
  UmurKorban.Text:='0';
  LamaBekerjaTahun.Text:='';
  LamaBekerjaBulan.Text:='';
  AlatTerlibat.Text:='';
  Proses.Text:='';
  TdkMasukKerja.Text:='0';
  Amount.Text:='0';
  AmountDesc.Text:='';
  Kronologi.Text:='';
  SebabLangsung.Text:='';
  SebabDasar.Text:='';
  NoteSpv.Text:='';
  NoteMR.Text:='';
  NoteDir.Text:='';
  Armada.Text:='';
  TglKejadian.Date:=Now;
  JenisKecelakaan.Clear;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT * FROM wh_accident_type WHERE status=1';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(JenisKecelakaanArr,IntCount+1);
      JenisKecelakaanArr[IntCount][0]:=Qry.FieldValues['accident_type_id'];
      JenisKecelakaanArr[IntCount][1]:=Qry.FieldValues['accident_type'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;

  JenisKecelakaan.Text:='';
  JenisKecelakaan.Items.Clear;
  JenisKecelakaan.ItemIndex:=-1;
  for IntCount:=0 to Length(JenisKecelakaanArr)-1 do
    JenisKecelakaan.Items.Add(JenisKecelakaanArr[IntCount][1]);


  VehicleIDHistLaka:='';
  chkUnsafeAction.Checked:=False;
  chkUnsafeCondition.Checked:=False;
  chkPersonalFactor.Checked:=False;
  chkJobFactor.Checked:=False;
  Lokasi.SetFocus;
end;

procedure TEmployeeHistoryLakaForm.GetEmployee;
var Qry:TADOQuery;
    QStr:String;
    IntCount:Integer;
begin

  if Main.OpenDb then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    QStr:='SELECT name, datediff(MONTH, join_date, getdate()) /12 work_period_year, '+
          'datediff(MONTH, join_date, getdate()) %12 work_period_month FROM wh_employee where employee_id='+QuotedStr(EmplId)+' AND active=1';
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      Pelapor.Text:=Qry.FieldValues['name'];
      LamaBekerjaTahun.Text:=Qry.FieldValues['work_period_year'];
      LamaBekerjaBulan.Text:=Qry.FieldValues['work_period_month'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
end;

procedure TEmployeeHistoryLakaForm.Save;
begin
  StrQry:='INSERT INTO wh_empl_history_laka (date,employee_id,location,time'+
  ',damage,victims_name,victims_age,tools,activity,amount,amount_desc,absent, '+
  ' chronology,incident1, incident2,note_spv, note_mr, note_direktur, unsafe_action,unsafe_condition, personal_factor, '+
  ' job_factor, create_date, create_user,update_user,work_period_year,work_period_month) VALUES (getdate(),'+
   QuotedStr(EmplId)+','+QuotedStr(Lokasi.Text)+','+QuotedStr(Jam.Text)+','+QuotedStr(Kerusakan.Text)+
   ','+QuotedStr(NamaKorban.Text)+
  ','+QuotedStr(UmurKorban.Text)+','+QuotedStr(AlatTerlibat.Text)+
  ','+QuotedStr(Proses.Text)+','+ToString(Amount.Text)+','+QuotedStr(AmountDesc.Text)+','+QuotedStr(TdkMasukKerja.Text)+
  ','+QuotedStr(Kronologi.Text)+','+QuotedStr(SebabLangsung.Text)+','+QuotedStr(SebabDasar.Text)+
  ','+QuotedStr(NoteSpv.Text)+','+QuotedStr(NoteMR.Text)+','+QuotedStr(NoteDir.Text)+
  ','+QuotedStr(UnsafeAction)+','+QuotedStr(UnsafeCondition)+','+QuotedStr(PersonalFactor)+','+QuotedStr(JobFactor)+
//  ','+QuotedStr(UnsafeAction)+','+UnsafeCondition+','+PersonalFactor+','+JobFactor+',getdate(),'+ +'
  ',getdate(),'+QuotedStr(User)+','+QuotedStr(User)+','+QuotedStr(LamaBekerjaTahun.Text)+','+QuotedStr(LamaBekerjaBulan.Text)+');';
   StrQry:=StrQry+ 'INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id,from_date,to_date,detail)'
end;

procedure TEmployeeHistoryLakaForm.Update;
begin
  StrQry:='UPDATE wh_empl_history_laka SET employee_id='+QuotedStr(EmplId)+',location='+QuotedStr(Lokasi.Text)+',time='+QuotedStr(Jam.Text)+','+
  'damage='+QuotedStr(Kerusakan.Text)+',victims_name='+QuotedStr(NamaKorban.Text)+',victims_age='+QuotedStr(UmurKorban.Text)+','+
  'tools='+QuotedStr(AlatTerlibat.Text)+',activity='+QuotedStr(Proses.Text)+',amount='+ToString(Amount.Text)+','+
  'amount_desc='+QuotedStr(AmountDesc.Text)+',absent='+QuotedStr(TdkMasukKerja.Text)+', '+
  ' chronology='+QuotedStr(Kronologi.Text)+',incident1='+QuotedStr(SebabLangsung.Text)+','+
  'incident2='+QuotedStr(SebabDasar.Text)+',note_spv='+QuotedStr(NoteSpv.Text)+', note_mr='+QuotedStr(NoteMR.Text)+','+
  'note_direktur='+QuotedStr(NoteDir.Text)+', unsafe_action='+QuotedStr(UnsafeAction)+','+
  'unsafe_condition='+QuotedStr(UnsafeCondition)+', personal_factor='+QuotedStr(PersonalFactor)+','+
  'job_factor='+QuotedStr(JobFactor)+',update_user='+QuotedStr(User)+' WHERE '+
  'empl_history_laka_id='+QuotedStr(EmplHistoryID)+';'
end;

procedure TEmployeeHistoryLakaForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryLakaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryLakaForm.BersihkanClick(Sender: TObject);
begin
  Init;
end;

procedure TEmployeeHistoryLakaForm.FormShow(Sender: TObject);
var Qry:TADOQuery;
    QStr:String;
    IntCount:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Init;
  if FormReq='EMPLOYEEHISTORYLAKA-FORM' then
  begin
    GetEmployee;
  end;
  if FormReq='EMPLOYEEHISTORYLAKA-LIST' then
  begin
    Cetak.Enabled:=True;
  end;

  if EmplHistoryID<>'' then
  begin
    UploadFileFoto.Enabled:=True;
    UploadFileKronologi.Enabled:=True;
    UploadFileSanksi.Enabled:=True;
    UploadFileTindakanPerbaikan.Enabled:=True;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    //foto KIR
    StrQry:='SELECT * FROM wh_empl_laka_image WHERE empl_laka_image_id='+
          '(SELECT MAX(empl_laka_image_id) FROM wh_empl_laka_image '+
          ' WHERE empl_history_laka_id='+Chr(39)+EmplHistoryID+Chr(39)+' AND image_id=1);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        Foto.Picture.Assign(JPG);
        Foto.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;

    //foto Kronologi
    StrQry:='SELECT * FROM wh_empl_laka_image WHERE empl_laka_image_id='+
          '(SELECT MAX(empl_laka_image_id) FROM wh_empl_laka_image '+
          ' WHERE empl_history_laka_id='+Chr(39)+EmplHistoryID+Chr(39)+' AND image_id=2);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoKronologi.Picture.Assign(JPG);
        FotoKronologi.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;

    //foto Sanksi
    StrQry:='SELECT * FROM wh_empl_laka_image WHERE empl_laka_image_id='+
          '(SELECT MAX(empl_laka_image_id) FROM wh_empl_laka_image '+
          ' WHERE empl_history_laka_id='+Chr(39)+EmplHistoryID+Chr(39)+' AND image_id=3);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoSanksi.Picture.Assign(JPG);
        FotoSanksi.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;

    //foto Tindakan Perbaikan
    StrQry:='SELECT * FROM wh_empl_laka_image WHERE empl_laka_image_id='+
          '(SELECT MAX(empl_laka_image_id) FROM wh_empl_laka_image '+
          ' WHERE empl_history_laka_id='+Chr(39)+EmplHistoryID+Chr(39)+' AND image_id=4);';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        FotoTindakanPerbaikan.Picture.Assign(JPG);
        FotoTindakanPerbaikan.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end else begin
    UploadFileFoto.Enabled:=False;
    UploadFileKronologi.Enabled:=False;
    UploadFileSanksi.Enabled:=False;
    UploadFileTindakanPerbaikan.Enabled:=False;
  end;
end;

procedure TEmployeeHistoryLakaForm.AmountExit(Sender: TObject);
begin
  if ToString(Amount.Text)='' then Amount.Text:='0';
  Amount.Text:=SToCurr(Amount.Text);

end;

procedure TEmployeeHistoryLakaForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrEMsg:string;
    IsOk:Boolean;
begin
  if chkUnsafeAction.Checked=True then UnsafeAction:='1' else UnsafeAction:='0';
  if chkUnsafeCondition.Checked=True then UnsafeCondition:='1' else UnsafeCondition:='0';
  if chkPersonalFactor.Checked=True then PersonalFactor:='1' else PersonalFactor:='0';
  if chkJobFactor.Checked=True then JobFactor:='1' else JobFactor:='0';
  if (Trim(Pelapor.Text)<>'') AND (Trim(Lokasi.Text)<>'') AND (Kerusakan.Text<>'') and (JenisKecelakaan.Text<>'') then begin
    Main.M_Busy;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    if Main.OpenDb then begin
      Main.TransStart;
      if FormReq='EMPLOYEEHISTORYLAKA-FORM' then
      begin
        StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,'+
                'location_id,from_date,to_date,detail,update_user)VALUES('+QuotedStr(EmplId)+',14,'+CompanyId+','+LocationId+','+
                'getdate(),getdate(),'+QuotedStr(Kronologi.Text)+','+QuotedStr(User)+')';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;

        if IsOk=True then
        begin
          StrQry:='SELECT TOP 1 empl_history_id FROM wh_empl_history order by empl_history_id DESC';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
        end;

        if Qry.RecordCount>0 then begin
           EmplHistoryID:=Qry.FieldValues['empl_history_id'];
        end;

        StrQry2:='INSERT INTO wh_empl_history_laka (date,employee_id,location,time'+
        ',damage,victims_name,victims_age,tools,activity,amount,amount_desc,absent, '+
        ' chronology,incident1, incident2,note_spv, note_mr, note_direktur, unsafe_action,unsafe_condition, personal_factor, '+
        ' job_factor, create_date, create_user,update_user,work_period_year,work_period_month,empl_history_id,vehicle_id,accident_type_id) VALUES ('+QuotedStr(FormatDateTime('yyyy-mm-dd',TglKejadian.Date))+','+
         QuotedStr(EmplId)+','+QuotedStr(Lokasi.Text)+','+QuotedStr(Jam.Text)+','+QuotedStr(Kerusakan.Text)+
         ','+QuotedStr(NamaKorban.Text)+
        ','+QuotedStr(UmurKorban.Text)+','+QuotedStr(AlatTerlibat.Text)+
        ','+QuotedStr(Proses.Text)+','+ToString(Amount.Text)+','+QuotedStr(AmountDesc.Text)+','+QuotedStr(TdkMasukKerja.Text)+
        ','+QuotedStr(Kronologi.Text)+','+QuotedStr(SebabLangsung.Text)+','+QuotedStr(SebabDasar.Text)+
        ','+QuotedStr(NoteSpv.Text)+','+QuotedStr(NoteMR.Text)+','+QuotedStr(NoteDir.Text)+
        ','+QuotedStr(UnsafeAction)+','+QuotedStr(UnsafeCondition)+','+QuotedStr(PersonalFactor)+','+QuotedStr(JobFactor)+
        ',getdate(),'+QuotedStr(User)+','+QuotedStr(User)+','+QuotedStr(LamaBekerjaTahun.Text)+','+QuotedStr(LamaBekerjaBulan.Text)+
        ','+QuotedStr(EmplHistoryID)+','+QuotedStr(VehicleIDHistLaka)+','+QuotedStr(JenisKecelakaanArr[JenisKecelakaan.ItemIndex][0])+');';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry2);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;

      end else
      begin
        StrQry:='UPDATE wh_empl_history_laka SET date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglKejadian.Date))+',employee_id='+QuotedStr(EmplId)+',location='+QuotedStr(Lokasi.Text)+',time='+QuotedStr(Jam.Text)+','+
        'damage='+QuotedStr(Kerusakan.Text)+',victims_name='+QuotedStr(NamaKorban.Text)+',victims_age='+QuotedStr(UmurKorban.Text)+','+
        'tools='+QuotedStr(AlatTerlibat.Text)+',activity='+QuotedStr(Proses.Text)+',amount='+ToString(Amount.Text)+','+
        'amount_desc='+QuotedStr(AmountDesc.Text)+',absent='+QuotedStr(TdkMasukKerja.Text)+', '+
        ' chronology='+QuotedStr(Kronologi.Text)+',incident1='+QuotedStr(SebabLangsung.Text)+','+
        'incident2='+QuotedStr(SebabDasar.Text)+',note_spv='+QuotedStr(NoteSpv.Text)+', note_mr='+QuotedStr(NoteMR.Text)+','+
        'note_direktur='+QuotedStr(NoteDir.Text)+', unsafe_action='+QuotedStr(UnsafeAction)+','+
        'unsafe_condition='+QuotedStr(UnsafeCondition)+', personal_factor='+QuotedStr(PersonalFactor)+','+
        'job_factor='+QuotedStr(JobFactor)+',update_user='+QuotedStr(User)+',vehicle_id='+QuotedStr(VehicleIDHistLaka)+',accident_type_id='+QuotedStr(JenisKecelakaanArr[JenisKecelakaan.ItemIndex][0])+' WHERE '+
        'empl_history_id='+QuotedStr(EmplHistoryID)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;

        StrQry:='UPDATE wh_empl_history SET detail='+QuotedStr(Kronologi.Text)+
                ' WHERE empl_history_id='+QuotedStr(EmplHistoryID)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;
      end;

     //StrUnCondition

    end;
    if IsOk then begin
      Main.TransCommit;
      if FormReq='EMPLOYEEHISTORYLAKA-FORM' then begin
        MessageBox(0,PChar('Data LaKa Berhasil Disimpan'),'History Laka Driver',MB_OK or MB_ICONINFORMATION);
        Cetak.Enabled:=True;
        Simpan.Enabled:=False;
        if EmplHistoryID<>'' then
        begin
          UploadFileFoto.Enabled:=True;
          UploadFileKronologi.Enabled:=True;
          UploadFileSanksi.Enabled:=True;
          UploadFileTindakanPerbaikan.Enabled:=True;
        end;
      end else begin
        MessageBox(0,PChar('Data LaKa Berhasil Diubah'),'History Laka Driver',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('EmployeeHistoryLakaRpt')=True then EmployeeHistoryLakaRpt.LihatDataClick(self);
      end;
    end else begin

      Main.TransRollback;
      MessageBox(0,PChar('Data Latar Belakang Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Tambah Latar Belakang',MB_OK or MB_ICONERROR);
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
    if FormReq<>'EMPLOYEEHISTORYLAKA-FORM' then Close;
  end else begin
      MessageBox(0,PChar('Silahkan Lengkapi Kolom yang diperlukan'),'History Laka Driver',MB_OK or MB_ICONERROR);
  end;
end;

procedure TEmployeeHistoryLakaForm.AmountChange(Sender: TObject);
begin
  if Amount.Text='' then  Amount.Text:='0';
end;

procedure TEmployeeHistoryLakaForm.AmountEnter(Sender: TObject);
begin
  Amount.Text:=ToString(Amount.Text);
end;

procedure TEmployeeHistoryLakaForm.AmountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    AmountDesc.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.LokasiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Jam.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.JamKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Kerusakan.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.PelaporKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Kerusakan.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.KerusakanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    NamaKorban.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.NamaKorbanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    UmurKorban.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.UmurKorbanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    AlatTerlibat.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.AlatTerlibatKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Proses.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.ProsesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    TdkMasukKerja.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.CetakClick(Sender: TObject);
begin
  StrQry:='SELECT b.name,a.* FROM wh_empl_history_laka a '+
          'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
          'WHERE empl_history_id='+QuotedStr(EmplHistoryID);

  qryHistLaka.Connection:=Main.MyConnection;
  qryHistLaka.SQL.Clear;
  qryHistLaka.Close;
  qryHistLaka.SQL.Add(StrQry);
  qryHistLaka.Open;

  if  qryHistLaka.RecordCount > 0 then
  frxrprt.ShowReport()
  else
  Application.MessageBox('Data tidak ada','Info', mb_Ok + Mb_ICONINFORMATION);
  qryHistLaka.Close;

  Main.CloseDb;

  Main.M_Normal;


end;

procedure TEmployeeHistoryLakaForm.frxrprtBeforePrint(
  Sender: TfrxReportComponent);
  var Amount_Desc,Absent_Desc: string;
begin
  if chkUnsafeAction.Checked = True then
  begin
     TfrxPictureView(frxrprt.FindObject('Picture2')).Visible := True;
  end else
  begin
    TfrxPictureView(frxrprt.FindObject('Picture2')).Visible := False;
  end;

  if chkUnsafeCondition.Checked = True then
  begin
     TfrxPictureView(frxrprt.FindObject('Picture3')).Visible := True;
  end else
  begin
    TfrxPictureView(frxrprt.FindObject('Picture3')).Visible := False;
  end;

  if chkPersonalFactor.Checked = True then
  begin
     TfrxPictureView(frxrprt.FindObject('Picture4')).Visible := True;
  end else
  begin
    TfrxPictureView(frxrprt.FindObject('Picture4')).Visible := False;
  end;

  if chkJobFactor.Checked = True then
  begin
     TfrxPictureView(frxrprt.FindObject('Picture5')).Visible := True;
  end else
  begin
    TfrxPictureView(frxrprt.FindObject('Picture5')).Visible := False;
  end;
  if AmountDesc.Text<>'' then Amount_Desc:= ' ('+AmountDesc.Text+')' else Amount_Desc:='';
  TfrxMemoView(frxrprt.FindObject('Memo58')).Memo.Text := 'Rp '+Amount.Text+Amount_Desc;

  if TdkMasukKerja.Text<>'0' then Absent_Desc:=TdkMasukKerja.Text+' Hari' else Absent_Desc:='';
  TfrxMemoView(frxrprt.FindObject('Memo59')).Memo.Text :=Absent_Desc;

end;

procedure TEmployeeHistoryLakaForm.AmountDescKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Kronologi.SetFocus;
  end;
end;

procedure TEmployeeHistoryLakaForm.CariArmadaClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus','FORM-HISTORY-LAKA');
end;

procedure TEmployeeHistoryLakaForm.FotoDblClick(Sender: TObject);
begin
  if Assigned(Foto.Picture.Graphic) then
    ImageViewer:=TImageViewer.Create(Self,1,EmplHistoryID,3);
end;

procedure TEmployeeHistoryLakaForm.UploadFileFotoClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      Foto.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);

      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          Foto.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        Foto.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_laka_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('empl_history_laka_id')).Value:=EmplHistoryID;
          TBlobField(Qry.FieldByName('image_id')).Value:='1';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
        MessageBox(Handle,PChar('Foto Berhasil Disimpan'),'Armada',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
end;

procedure TEmployeeHistoryLakaForm.FotoKronologiDblClick(Sender: TObject);
begin
  if Assigned(Foto.Picture.Graphic) then
    ImageViewer:=TImageViewer.Create(Self,2,EmplHistoryID,3);
end;

procedure TEmployeeHistoryLakaForm.FotoSanksiDblClick(Sender: TObject);
begin
  if Assigned(Foto.Picture.Graphic) then
    ImageViewer:=TImageViewer.Create(Self,3,EmplHistoryID,3);
end;

procedure TEmployeeHistoryLakaForm.FotoTindakanPerbaikanDblClick(Sender: TObject);
begin
  if Assigned(Foto.Picture.Graphic) then
    ImageViewer:=TImageViewer.Create(Self,4,EmplHistoryID,3);
end;

procedure TEmployeeHistoryLakaForm.UploadFileKronologiClick(
  Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      FotoKronologi.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);

      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoKronologi.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoKronologi.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_laka_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('empl_history_laka_id')).Value:=EmplHistoryID;
          TBlobField(Qry.FieldByName('image_id')).Value:='2';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
        MessageBox(Handle,PChar('Foto Berhasil Disimpan'),'Armada',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;

end;

procedure TEmployeeHistoryLakaForm.UploadFileSanksiClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      FotoSanksi.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);

      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoSanksi.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoSanksi.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_laka_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('empl_history_laka_id')).Value:=EmplHistoryID;
          TBlobField(Qry.FieldByName('image_id')).Value:='3';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
        MessageBox(Handle,PChar('Foto Berhasil Disimpan'),'Armada',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
end;

procedure TEmployeeHistoryLakaForm.UploadFileTindakanPerbaikanClick(
  Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
    Width,Height:Word;
begin
    StrPath:=GetImgFile;
    if Trim(StrPath)<>'' then begin
      Main.M_Busy;
      GetJPGSize(StrPath,Width,Height);
      ImgJPG:=TJPEGImage.Create;
      FotoTindakanPerbaikan.Picture:=nil;
      ImgJPG.LoadFromFile(StrPath);

      if ((ImgJPG.Width <2000 ) AND (ImgJPG.Height<2700)) or ((ImgJPG.Width <2700 ) AND (ImgJPG.Height<2000)) then begin
        StmImage:=TMemoryStream.Create;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        try
          FotoTindakanPerbaikan.Picture.Assign(ImgJPG);
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
        FotoTindakanPerbaikan.Stretch:=True;
        if Main.OpenDb then begin
          ImgJPG.SaveToStream(StmImage);
          StmImage.Position:=0;
          StrQry:='SELECT Top 1 * FROM wh_empl_laka_image ORDER BY update_time DESC;';
          Main.WriteLog('SQL :'+StrQry);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Qry.Append;
          TBlobField(Qry.FieldByName('empl_history_laka_id')).Value:=EmplHistoryID;
          TBlobField(Qry.FieldByName('image_id')).Value:='4';
          TBlobField(Qry.FieldByName('image')).LoadFromStream(StmImage);
          TBlobField(Qry.FieldByName('update_user')).Value:=User;
          Qry.Post;
          Qry.Close;
          Main.CloseDb;
          ImgJPG.Free;
          StmImage.Free;
        end;
        MessageBox(Handle,PChar('Foto Berhasil Disimpan'),'Armada',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
        MessageBox(0,'  Tidak Dapat mengupdate Foto,'+Chr(13)+Chr(13)+'Ukuran gambar maksimal 600x800','Update Foto',MB_OK or MB_ICONWARNING);
      Main.M_Normal;
    end;
end;

end.
