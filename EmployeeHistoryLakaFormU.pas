unit EmployeeHistoryLakaFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, frxClass, frxDBSet, StdCtrls, ExtCtrls, Mask, Spin,
  ComCtrls, WHUnit;

type
  TEmployeeHistoryLakaForm = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Lokasi: TEdit;
    Tgl: TEdit;
    pnl1: TPanel;
    labelAccident: TLabel;
    LabelKet: TLabel;
    lblSaranAtasan: TLabel;
    lblSaranQHSE: TLabel;
    lblSaranDireaksi: TLabel;
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
    con1: TADOConnection;
    lblJamkejadian: TLabel;
    Jam: TMaskEdit;
    Kerusakan: TMemo;
    NamaKorban: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    UmurKorban: TSpinEdit;
    AlatTerlibat: TEdit;
    lblTools: TLabel;
    lblProsess: TLabel;
    Proses: TEdit;
    lblAbsent: TLabel;
    lblMateriSejumlah: TLabel;
    lblKet_materi: TLabel;
    AmountDesc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Pelapor: TEdit;
    Amount: TMemo;
    TdkMasukKerja: TSpinEdit;
    Label12: TLabel;
    Label13: TLabel;
    LamaBekerjaTahun: TMemo;
    LamaBekerjaBulan: TMemo;
    Label14: TLabel;
    Label15: TLabel;
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
  private
    { Private declarations }
    StrQry,StrQry2,UnsafeAction,UnsafeCondition,PersonalFactor,JobFactor,EmplHistoryID,FormReq:String;
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
  EmplId:string;

implementation

uses
  MainU, EmployeeHistoryLakaListU;

{$R *.dfm}

constructor TEmployeeHistoryLakaForm.Create(AOwner:TComponent;Empl_ID,Empl_HistoryID,Form_Req:String);
begin
  if Empl_ID<>'' then EmplId:=Empl_ID else EmplId:='';
  if Empl_HistoryID<>'' then EmplHistoryID:=Empl_HistoryID else EmplHistoryID:='';
  if Form_Req<>'' then FormReq:=Form_Req;
  inherited Create(AOwner);
end;

procedure TEmployeeHistoryLakaForm.Init;
begin
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
begin
  Init;
  if EmplId<>'' then begin
    GetEmployee;
  end;
  if FormReq='EMPLOYEEHISTORYLAKA-LIST' then
  begin
    Cetak.Enabled:=True;
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
  if (Trim(Pelapor.Text)<>'') AND (Trim(Lokasi.Text)<>'') AND (Kerusakan.Text<>'') then begin
    Main.M_Busy;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
//    EmplId;

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
        ' job_factor, create_date, create_user,update_user,work_period_year,work_period_month,empl_history_id) VALUES (getdate(),'+
         QuotedStr(EmplId)+','+QuotedStr(Lokasi.Text)+','+QuotedStr(Jam.Text)+','+QuotedStr(Kerusakan.Text)+
         ','+QuotedStr(NamaKorban.Text)+
        ','+QuotedStr(UmurKorban.Text)+','+QuotedStr(AlatTerlibat.Text)+
        ','+QuotedStr(Proses.Text)+','+ToString(Amount.Text)+','+QuotedStr(AmountDesc.Text)+','+QuotedStr(TdkMasukKerja.Text)+
        ','+QuotedStr(Kronologi.Text)+','+QuotedStr(SebabLangsung.Text)+','+QuotedStr(SebabDasar.Text)+
        ','+QuotedStr(NoteSpv.Text)+','+QuotedStr(NoteMR.Text)+','+QuotedStr(NoteDir.Text)+
        ','+QuotedStr(UnsafeAction)+','+QuotedStr(UnsafeCondition)+','+QuotedStr(PersonalFactor)+','+QuotedStr(JobFactor)+
      //  ','+QuotedStr(UnsafeAction)+','+UnsafeCondition+','+PersonalFactor+','+JobFactor+',getdate(),'+ +'
        ',getdate(),'+QuotedStr(User)+','+QuotedStr(User)+','+QuotedStr(LamaBekerjaTahun.Text)+','+QuotedStr(LamaBekerjaBulan.Text)+
        ','+QuotedStr(EmplHistoryID)+');';

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
        StrQry:='UPDATE wh_empl_history_laka SET employee_id='+QuotedStr(EmplId)+',location='+QuotedStr(Lokasi.Text)+',time='+QuotedStr(Jam.Text)+','+
        'damage='+QuotedStr(Kerusakan.Text)+',victims_name='+QuotedStr(NamaKorban.Text)+',victims_age='+QuotedStr(UmurKorban.Text)+','+
        'tools='+QuotedStr(AlatTerlibat.Text)+',activity='+QuotedStr(Proses.Text)+',amount='+ToString(Amount.Text)+','+
        'amount_desc='+QuotedStr(AmountDesc.Text)+',absent='+QuotedStr(TdkMasukKerja.Text)+', '+
        ' chronology='+QuotedStr(Kronologi.Text)+',incident1='+QuotedStr(SebabLangsung.Text)+','+
        'incident2='+QuotedStr(SebabDasar.Text)+',note_spv='+QuotedStr(NoteSpv.Text)+', note_mr='+QuotedStr(NoteMR.Text)+','+
        'note_direktur='+QuotedStr(NoteDir.Text)+', unsafe_action='+QuotedStr(UnsafeAction)+','+
        'unsafe_condition='+QuotedStr(UnsafeCondition)+', personal_factor='+QuotedStr(PersonalFactor)+','+
        'job_factor='+QuotedStr(JobFactor)+',update_user='+QuotedStr(User)+' WHERE '+
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
      end else begin
        MessageBox(0,PChar('Data LaKa Berhasil Diubah'),'History Laka Driver',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('EmployeeHistoryLakaList')=True then EmployeeHistoryLakaList.LihatDataClick(self);
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

end.
