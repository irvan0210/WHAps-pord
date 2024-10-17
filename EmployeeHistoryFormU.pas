unit EmployeeHistoryFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, StdCtrls, ExtCtrls, WHUnit, ADODB, Spin;

type
  TEmployeeHistoryForm = class(TForm)
    GroupBox2: TGroupBox;
    LabelId: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    IdKaryawan: TEdit;
    Label5: TLabel;
    KPPExpired: TEdit;
    Name: TEdit;
    Address: TEdit;
    Label6: TLabel;
    Birth: TEdit;
    Label7: TLabel;
    JoinDate: TEdit;
    Groupbox_data_korban: TGroupBox;
    Label1: TLabel;
    Detail: TComboBox;
    Label2: TLabel;
    DateStart: TDateTimePicker;
    DateEnd: TDateTimePicker;
    Labelsd: TLabel;
    LabelDept: TLabel;
    Departemen: TEdit;
    lblUsiaKorban: TLabel;
    lblJamkejadian: TLabel;
    lblNamaKorban: TLabel;
    VictimsName: TEdit;
    LabelInstitusi: TLabel;
    Institution: TEdit;
    lblTools: TLabel;
    Tools: TEdit;
    LabelKota: TLabel;
    City: TEdit;
    lblProsess: TLabel;
    Proses: TEdit;
    pnl1: TPanel;
    LabelFollowUp: TLabel;
    FollowUp: TMemo;
    labelAccident: TLabel;
    Accident: TMemo;
    Description: TMemo;
    LabelKet: TLabel;
    AmountOfMaterial: TEdit;
    lblMateriSejumlah: TLabel;
    Absent: TEdit;
    lblAbsent: TLabel;
    lblSaranAtasan: TLabel;
    note_spv: TMemo;
    note_mr: TMemo;
    lblSaranQHSE: TLabel;
    note_direktur: TMemo;
    lblSaranDireaksi: TLabel;
    Panel1: TPanel;
    Simpan: TButton;
    Selesai: TButton;
    victimsaAge: TSpinEdit;
    pnlunsafe: TPanel;
    chkUnsafe_action: TCheckBox;
    chkUnsafe_condition: TCheckBox;
    pnlfactor: TPanel;
    chkPersonal_factor: TCheckBox;
    chkJob_factor: TCheckBox;
    Time: TMaskEdit;
    amount_note: TEdit;
    lblKet_materi: TLabel;
    lblPelapor: TLabel;
    Reporter: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DetailChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure chkUnsafe_actionClick(Sender: TObject);
    procedure chkUnsafe_conditionClick(Sender: TObject);
    procedure chkPersonal_factorClick(Sender: TObject);
    procedure chkJob_factorClick(Sender: TObject);
    procedure AmountOfMaterialKeyPress(Sender: TObject; var Key: Char);
   // procedure chkUnsafe_conditionClick(Sender: TObject);
  //  procedure chkUnsafe_conditionEnter(Sender: TObject);
  private
    { Private declarations }
    HistoryTypeArr:Array of TArrString5;
    EmplId, EmplHistoryID:String;
    EmplType,EmplHistTypeId, EmplHistTypeId2:Integer;
    EmplLocationId,EmplCompanyId:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure LoadDataChange;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String;Empl_HistTypeId:Integer);Overload;
  end;

var
  EmployeeHistoryForm: TEmployeeHistoryForm;

implementation

uses MainU, Math;

{$R *.dfm}

constructor TEmployeeHistoryForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String;Empl_HistTypeId:Integer);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
  end else begin
    EmplType:=3;
  end;

  if Empl_HistTypeId=14 then
    EmplHistTypeId := Empl_HistTypeId
  else EmplHistTypeId:=0;

  EmplHistTypeId2 := Empl_HistTypeId;
  EmplId:=EmployeeId;
  EmplHistoryID := EmployeeType;
  Main.WriteLog('Form Open: EmployeeHistoryForm='+EmployeeType+','+EmployeeId,1);
  Inherited Create(AOwner);
end;

procedure TEmployeeHistoryForm.Init;
begin
  IdKaryawan.Text:='';
  Name.Text:='';
  DateStart.Date:=Now();
  DateEnd.Date:=Now();
  Institution.Text:='';
  City.Text:='';
  Description.Text:='';
  Detail.Text:='';
  Detail.ItemIndex:=-1;
  Detail.Items.Clear;

end;

procedure TEmployeeHistoryForm.RefreshCombo;
var Qry:TADOQuery;
    QStr:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  if Main.OpenDb then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    QStr:='SELECT * FROM wh_empl_history_type';
    Qry.SQL.Add(QStr);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(HistoryTypeArr,IntCount+1);
      HistoryTypeArr[IntCount][0]:=Qry.FieldValues['empl_history_type_id'];
      HistoryTypeArr[IntCount][1]:=Qry.FieldValues['detail'];
      HistoryTypeArr[IntCount][2]:=Qry.FieldValues['promotion'];
      HistoryTypeArr[IntCount][3]:=Qry.FieldValues['period'];
      HistoryTypeArr[IntCount][4]:=Qry.FieldValues['internal'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(HistoryTypeArr)-1 do
    Detail.Items.Add(HistoryTypeArr[IntCount][1]);

  if EmplHistTypeId=14 then begin
    GroupBox2.Visible := False;
    label1.Visible:=False;
    Detail.Visible:=False;
   // LabelKota.Visible:=False;
   // City.Visible:=False;
    labelAccident.Visible:=True;
    Accident.Visible:=True;
    LabelFollowUp.Visible:=True;
    FollowUp.Visible:=True;

    LabelKota.Caption := 'Kerusakan/Cedera' ;
    LabelDept.Caption:='Lokasi';
    LabelInstitusi.Caption:='No Polisi';
    LabelKet.Caption:='Ringkasan Kronologis';
    labelAccident.Caption := 'Sebab Langsung';
    LabelFollowUp.Caption := 'Sebab Dasar';
    Height:= Height - 130;
    Caption:='Riwayat Laka Driver';

    Labelsd.Visible:=False;
    DateEnd.Visible:=False;
    Institution.Enabled:=True;
    City.Enabled:=True;
    Departemen.Enabled:=True;
    Accident.Text:='';
    FollowUp.Text:='';
    Detail.ItemIndex := 13;
    Width := 885;

    note_spv.Visible:=True;
    note_mr.Visible:=True;
    note_direktur.Visible:=True;
    lblSaranQHSE.Visible:=True;
    lblSaranAtasan.Visible:=True;
    lblSaranDireaksi.Visible:=True;
    lblKet_materi.Visible:=True;
    Time.Visible:=True;
    VictimsName.Visible:=True;
    victimsaAge.Visible:=True;
    Tools.Visible:=True;
    Proses.Visible:=True;
    Absent.Visible:=True;
    AmountOfMaterial.Visible := True;
    amount_note.Visible := True;
    lblJamkejadian.Visible:=True;
    lblNamaKorban.Visible:=True;
    lblUsiaKorban.Visible:=True;
    lblTools.Visible := True;
    lblProsess.Visible:=True;
    lblAbsent.Visible:=True;
    lblMateriSejumlah.Visible:=True;
    pnlunsafe.Visible := True;
    pnlfactor.Visible := True;

  end else begin
    GroupBox2.Visible := True;
   // Groupbox_data_korban.Visible := False;
    label1.Visible:=True;
    Detail.Visible:=True;
    LabelKota.Visible:=True;
    labelAccident.Visible:=False;
    Accident.Visible:=False;
    LabelFollowUp.Visible:=False;
    FollowUp.Visible:=False;

    LabelDept.Caption:='Departemen';
    LabelInstitusi.Caption:='Institusi';
    LabelKet.Caption:='Keterangan';
    Groupbox_data_korban.Height := Groupbox_data_korban.Height - AmountOfMaterial.Height ;
    Height:=425;
    Caption:='Latar Karyawan';

    Labelsd.Visible:=True;
    DateEnd.Visible:=True;
    DateEnd.Enabled:=False;
    Institution.Enabled:=False;
    City.Enabled:=False;
    Departemen.Enabled:=False;
    Detail.ItemIndex := 14;

    note_spv.Visible:=False;
    note_mr.Visible:=False;
    note_direktur.Visible:=False;
    lblSaranQHSE.Visible:=False;
    lblSaranAtasan.Visible:=False;
    lblSaranDireaksi.Visible:=False;
    lblKet_materi.Visible:=False;
    Time.Visible:=False;
    VictimsName.Visible:=False;
    victimsaAge.Visible:=False;
    Tools.Visible:=False;
    Proses.Visible:=False;
    Absent.Visible:=False;
    AmountOfMaterial.Visible := False;
    amount_note.Visible := False;
    lblJamkejadian.Visible:=False;
    lblNamaKorban.Visible:=False;
    lblUsiaKorban.Visible:=False;
    lblTools.Visible := False;
    lblProsess.Visible:=False;
    lblAbsent.Visible:=False;
    lblMateriSejumlah.Visible:=False;
    pnlunsafe.Visible := False;
    pnlfactor.Visible := False;
    Width := 565;
  end;

  Main.M_Normal;
end;

procedure TEmployeeHistoryForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+EmplId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IdKaryawan.Text:=Qry.FieldValues['employee_id'];
    if Qry.FieldValues['kpp_expired']<>NULL then
      KPPExpired.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['kpp_expired']));
    Name.Text:=Qry.FieldValues['name'];
    if (Qry.FieldValues['birth_town']<>NULL) and (Qry.FieldValues['birth_date']<>NULL) then
      Birth.Text:=Qry.FieldValues['birth_town']+'/'+FormatDateTime('dd-mm-yyyy',StrToDate(Qry.FieldValues['birth_date']));
    if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
    if Qry.FieldValues['join_date']<>NULL then JoinDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['join_date']));
    EmplLocationId:=Qry.FieldValues['location_id'];
    EmplCompanyId:=Qry.FieldValues['company_id'];
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryForm.LoadDataChange;
var Qry:TADOQuery;
    StrQry, StrIndex:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
   // MessageBox(0,PChar(EmplHistTypeId2),'Tes',MB_OK or MB_ICONINFORMATION);
    StrQry:='SELECT * FROM dbo.wh_empl_history WHERE empl_history_id ='+EmplHistoryID;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    DateStart.Date := StrToDate(FormatDateTime('dd/mm/yyyy',Qry.FieldValues['from_date']));
    if Qry.FieldValues['to_date']<>NULL then DateEnd.Date := StrToDate(FormatDateTime('dd/mm/yyyy',Qry.FieldValues['to_date'])) else DateEnd.Date := StrToDate(FormatDateTime('dd/mm/yyyy',Qry.FieldValues['from_date']));
    StrIndex := Qry.FieldValues['empl_history_type_id'];
    //MessageBox(0,PChar(StrIndex),'Tes',MB_OK or MB_ICONINFORMATION);
    if Qry.FieldValues['empl_history_type_id'] <> NULL then  begin
      Detail.ItemIndex:= StrToInt(StrIndex)-1;
      //Detail.Visible := True;
    end;

   // if Qry.FieldValues['empl_history_type_id']='14' then begin
    //  if Qry.FieldValues['city']<> null then Departemen.Text := Qry.FieldValues['city'];
    //end else

    if Qry.FieldValues['department']<> null then Departemen.Text := Qry.FieldValues['department'];
    if Qry.FieldValues['institution']<> null then Institution.Text := Qry.FieldValues['institution'];
    if Qry.FieldValues['city']<> null then City.Text := Qry.FieldValues['city'];
    if Qry.FieldValues['amount']<> null then AmountOfMaterial.Text := Qry.FieldValues['amount'] else AmountOfMaterial.Text := '0';
    if Qry.FieldValues['amount_note']<> null then amount_note.Text := Qry.FieldValues['amount_note'];
    if Qry.FieldValues['time']<> null then Time.Text := Qry.FieldValues['time'];
    if Qry.FieldValues['reporter']<> null then Reporter.Text := Qry.FieldValues['reporter'];
    if Qry.FieldValues['victims_name']<> null then VictimsName.Text := Qry.FieldValues['victims_name'];
    if Qry.FieldValues['victims_age']<> null then victimsaAge.Text :=  Qry.FieldValues['victims_age'];
    if Qry.FieldValues['tools']<> null then Tools.Text :=  Qry.FieldValues['tools'];
    if Qry.FieldValues['process']<> null then Proses.Text :=  Qry.FieldValues['process'];
    if Qry.FieldValues['absent']<> null then Absent.Text :=  Qry.FieldValues['absent'];
    if Qry.FieldValues['detail']<> null then Description.Text := Qry.FieldValues['detail'];
    if Qry.FieldValues['accident']<> null then Accident.Text := Qry.FieldValues['accident'];
    if Qry.FieldValues['followup']<> null then FollowUp.Text := Qry.FieldValues['followup'];
    if Qry.FieldValues['note_spv']<> null then note_spv.Text :=  Qry.FieldValues['note_spv'];
    if Qry.FieldValues['note_mr']<> null then note_mr.Text := Qry.FieldValues['note_mr'];
    if Qry.FieldValues['note_direktur']<> null then note_direktur.Text := Qry.FieldValues['note_direktur'];
    if Qry.FieldValues['unsafe_action'] = '1' then  chkUnsafe_action.Checked := True else chkUnsafe_action.Checked := False;
    if Qry.FieldValues['unsafe_condition'] = '1' then  chkUnsafe_condition.Checked := True else chkUnsafe_condition.Checked := False;
    if Qry.FieldValues['personal_factor'] = '1' then  chkPersonal_factor.Checked := True else chkPersonal_factor.Checked := False;
    if Qry.FieldValues['job_factor'] = '1' then  chkJob_factor.Checked := True else chkJob_factor.Checked := False;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if EmplId<>'' then LoadData;

  if (EmplHistoryID <> 'Bus') and (EmplHistoryID <> 'TAXI') and (EmplHistoryID <> 'BUS2') then
    begin
      LoadDataChange;
      Detail.Enabled := False;
    end;  

end;

procedure TEmployeeHistoryForm.DetailChange(Sender: TObject);
begin
  if Detail.Text<>'' then begin

    if HistoryTypeArr[Detail.ItemIndex][0]='14' then begin
      Caption:='Riwayat Laka Driver';
      GroupBox2.Visible := False;
      Height:= 457;
      Width := 885;
      Groupbox_data_korban.Height :=  159 ;//Groupbox_data_korban.Height - AmountOfMaterial.Height ;
      //label1.Enabled:=False;
      //Detail.Enabled:=False;
      Institution.Enabled:=True;
      City.Enabled:=True;
      Departemen.Enabled:=True;
     // LabelKota.Visible:=False;
     // City.Visible:=False;
      labelAccident.Visible:=True;
      Accident.Visible:=True;
      LabelFollowUp.Visible:=True;
      FollowUp.Visible:=True;

      LabelKota.Caption := 'Kerusakan/Cedera' ;
      LabelDept.Caption:='Lokasi';
      LabelInstitusi.Caption:='No Polisi';
      LabelKet.Caption:='Ringkasan Kronologis';

      Labelsd.Visible:=False;
      DateEnd.Visible:=False;
      Institution.Enabled:=True;
      City.Enabled:=True;
      Departemen.Enabled:=True;
      Accident.Text:='';
      FollowUp.Text:='';
      Detail.ItemIndex := 13;

      note_spv.Visible:=True;
      note_mr.Visible:=True;
      note_direktur.Visible:=True;
      lblSaranQHSE.Visible:=True;
      lblSaranAtasan.Visible:=True;
      lblSaranDireaksi.Visible:=True;
      lblKet_materi.Visible:=True;
      Time.Visible:=True;
      VictimsName.Visible:=True;
      victimsaAge.Visible:=True;
      Tools.Visible:=True;
      Proses.Visible:=True;
      Absent.Visible:=True;
      AmountOfMaterial.Visible := True;
      amount_note.Visible := True;
      lblJamkejadian.Visible:=True;
      lblNamaKorban.Visible:=True;
      lblUsiaKorban.Visible:=True;
      lblTools.Visible := True;
      lblProsess.Visible:=True;
      lblAbsent.Visible:=True;
      lblMateriSejumlah.Visible:=True;
      pnlunsafe.Visible := True;
      pnlfactor.Visible := True;

    end else begin
      GroupBox2.Visible := True;
     // Groupbox_data_korban.Visible := False;
      label1.Visible:=True;
      Detail.Visible:=True;
      LabelKota.Visible:=True;
      labelAccident.Visible:=False;
      Accident.Visible:=False;
      LabelFollowUp.Visible:=False;
      FollowUp.Visible:=False;

      LabelDept.Caption:='Departemen';
      LabelInstitusi.Caption:='Institusi';
      LabelKet.Caption:='Keterangan';
      Groupbox_data_korban.Height := 138;//Groupbox_data_korban.Height - AmountOfMaterial.Height ;
      Height:=425;
      Caption:='Latar Karyawan';

      Labelsd.Visible:=True;
      DateEnd.Visible:=True;
      DateEnd.Enabled:=False;
      Institution.Enabled:=False;
      City.Enabled:=False;
      Departemen.Enabled:=False;
      Detail.ItemIndex := 14;

      note_spv.Visible:=False;
      note_mr.Visible:=False;
      note_direktur.Visible:=False;
      lblSaranQHSE.Visible:=False;
      lblSaranAtasan.Visible:=False;
      lblSaranDireaksi.Visible:=False;
      lblKet_materi.Visible:=False;
      Time.Visible:=False;
      VictimsName.Visible:=False;
      victimsaAge.Visible:=False;
      Tools.Visible:=False;
      Proses.Visible:=False;
      Absent.Visible:=False;
      AmountOfMaterial.Visible := False;
      amount_note.Visible := False;
      lblJamkejadian.Visible:=False;
      lblNamaKorban.Visible:=False;
      lblUsiaKorban.Visible:=False;
      lblTools.Visible := False;
      lblProsess.Visible:=False;
      lblAbsent.Visible:=False;
      lblMateriSejumlah.Visible:=False;
      pnlunsafe.Visible := False;
      pnlfactor.Visible := False;
      Width := 565;
    end;

    if HistoryTypeArr[Detail.ItemIndex][3]='0' then begin
      DateEnd.Enabled:=False;
    end else begin
      DateEnd.Enabled:=True;
    end;

    if HistoryTypeArr[Detail.ItemIndex][4]='1' then begin
      Institution.Enabled:=False;
      City.Enabled:=False;
      Departemen.Enabled:=True;
    end else if HistoryTypeArr[Detail.ItemIndex][4]='2' then begin
      Institution.Enabled:=True;
      City.Enabled:=True;
      Departemen.Enabled:=False;
    end else if HistoryTypeArr[Detail.ItemIndex][0]='14' then begin
      Institution.Enabled:=True;
      City.Enabled:=True;
      Departemen.Enabled:=True;
    end else  begin
      Institution.Enabled:=False;
      City.Enabled:=False;
      Departemen.Enabled:=False;
    end;
  end;
end;

procedure TEmployeeHistoryForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrEmplId,StrDetail,StrDesc,StrDept,StrInst,StrCity,StrDateStart,StrTime,
    StrPersFactor, StrJobFactor, StrUnAction, StrUnCondition,StrDateEnd,StrAccident,StrFollowUp, Amount:String;
    IsOk:Boolean;

begin
  StrEMsg:='';
  if (Trim(Name.Text)<>'') AND (Trim(IdKaryawan.Text)<>'') AND (Detail.Text<>'') then begin
    Main.M_Busy;
    DisableInput;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrEmplId:=EmplId;
    StrDetail:=HistoryTypeArr[Detail.ItemIndex][0];
    StrDateStart:=QuotedStr(FormatDateTime('yyyy/mm/dd',DateStart.Date));
   // StrDateCreate := QuotedStr(FormatDateTime('yyyy/mm/dd',DateStart.Date));
    if HistoryTypeArr[Detail.ItemIndex][3]='1' then StrDateEnd:=QuotedStr(FormatDateTime('yyyy/mm/dd',DateEnd.Date)) else StrDateEnd:='NULL';

    if HistoryTypeArr[Detail.ItemIndex][4]='2' then begin
      StrInst:=QuotedStr(Trim(Institution.Text));
      StrCity:=QuotedStr(Trim(City.Text));
    end else if HistoryTypeArr[Detail.ItemIndex][0]='14' then begin
      StrInst:=QuotedStr(Trim(Institution.Text));
      StrCity:=QuotedStr(Trim(City.Text));
      StrDept:=QuotedStr(Trim(Departemen.Text));
    //end else if HistoryTypeArr[Detail.ItemIndex][4]='13' then begin
    //  StrInst:=QuotedStr(Trim(Institution.Text));
    //  StrCity:=QuotedStr(Trim(City.Text));
    end else begin
      StrInst:='NULL';
      StrCity:='NULL';
    end;

    if (HistoryTypeArr[Detail.ItemIndex][4]='1')  or (HistoryTypeArr[Detail.ItemIndex][0]='14')then begin
      StrDept:=QuotedStr(Trim(Departemen.Text));
    end else begin
      StrDept:='NULL';
    end;

    if Trim(Description.Text)<>'' then StrDesc:=QuotedStr(Trim(Description.Text)) else StrDesc:='NULL';
    if Trim(Accident.Text)<>'' then StrAccident:=QuotedStr(Trim(Accident.Text)) else StrAccident:='NULL';
    if Trim(FollowUp.Text)<>'' then StrFollowUp:=QuotedStr(Trim(FollowUp.Text)) else StrFollowUp:='NULL';

    if chkUnsafe_action.Checked = True then  StrUnAction := QuotedStr('1') else StrUnAction := QuotedStr('0');
    if chkUnsafe_condition.Checked = True then  StrUnCondition := QuotedStr('1') else StrUnCondition := QuotedStr('0');

    if chkPersonal_factor.Checked = True then  StrPersFactor := QuotedStr('1') else StrPersFactor := QuotedStr('0');
    if chkJob_factor.Checked = True then  StrJobFactor := QuotedStr('1') else StrJobFactor := QuotedStr('0');
      StrTime:=QuotedStr(Time.Text);
      Amount:=ToString(AmountOfMaterial.Text);
     MessageBox(0,PChar(EmplHistoryID),'Tes',MB_OK or MB_ICONINFORMATION);

    if Main.OpenDb then begin
      Main.TransStart;
      if Accident.Visible=False Then begin
        if  (EmplHistoryID <> '') AND (EmplHistoryID <> 'Bus') and (EmplHistoryID <> 'TAXI') and (EmplHistoryID <> 'BUS2') then begin
          //Query Update
           StrQry:=' UPDATE wh_empl_history  SET employee_id ='+QuotedStr(StrEmplId)+', '+
           ' empl_history_type_id ='+StrDetail+','+
           ' company_id= '+IntToStr(EmplCompanyId)+','+
           ' location_id='+IntToStr(EmplLocationId)+','+
           ' from_date='+StrDateStart+', '+
           ' to_datee='+StrDateEnd+', '+
           ' departmente='+StrDept+', '+
           ' institutione='+StrInst+', '+
           ' citye='+StrCity+', '+
           ' detaile='+StrDesc+', '+
           ' update_usere='+QuotedStr(User)+' WHERE empl_history_id='+EmplHistoryID+';';
         end else
         begin
          StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                ',from_date,to_date,department,institution,city,detail,create_date,create_user, ) VALUES ('+
                QuotedStr(StrEmplId)+','+StrDetail+','+IntToStr(EmplCompanyId)+','+IntToStr(EmplLocationId)+','+StrDateStart+
                ','+StrDateEnd+','+StrDept+','+StrInst+','+StrCity+','+StrDesc+','+StrDateStart+','+QuotedStr(User)+');'
         end;
      end  else  begin

        if  (EmplHistoryID <> '') AND (EmplHistoryID <> 'Bus') and (EmplHistoryID <> 'TAXI') and (EmplHistoryID <> 'BUS2') then begin
            StrQry:='UPDATE [dbo].[wh_empl_history]  SET'+
                ' empl_history_type_id = '+StrDetail+','+
                ' company_id ='+IntToStr(EmplCompanyId)+','+
                ' location_id = '+IntToStr(EmplLocationId)+','+
                ' from_date = '+StrDateStart+','+
                ' to_date = '+StrDateStart+','+
                ' department = '+StrDept+','+
                ' institution = '+StrInst+','+
                ' city =  '+StrCity+','+
                ' detail = '+StrDesc+','+
                ' accident = '+StrAccident+','+
                ' followup = '+StrFollowUp+','+
                ' amount = '+QuotedStr(AmountOfMaterial.Text)+','+
                ' amount_note = '+QuotedStr(amount_note.Text)+','+
                ' time =   '+StrTime+','+
                ' reporter =  '+QuotedStr(Reporter.Text)+','+
                ' victims_name = '+QuotedStr(VictimsName.Text)+','+
                ' victims_age = '+QuotedStr(victimsaAge.Text)+','+
                ' tools = '+QuotedStr(Tools.Text)+','+
                ' process = '+QuotedStr(Proses.Text)+','+
                ' absent = '+QuotedStr(Absent.Text)+','+
                ' note_spv = '+QuotedStr(note_spv.Text)+','+
                ' note_mr = '+QuotedStr(note_mr.Text)+','+
                ' note_direktur =  '+QuotedStr(note_direktur.Text)+','+
                ' unsafe_action = '+StrUnAction+','+
                ' unsafe_condition = '+StrUnCondition+','+
                ' personal_factor = '+StrPersFactor+','+
                ' job_factor = '+StrJobFactor+','+
                //' update_time = '+IntToStr()+','+
                ' update_user = '+QuotedStr(User)+' '+
            'WHERE empl_history_id='+EmplHistoryID+';';

        end else
        begin
          StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
          ',from_date,to_date,department,institution,city,detail,accident,followup, '+
          ' amount,amount_note, time,reporter, victims_name, victims_age, tools,process, absent, '+
          ' note_spv, note_mr, note_direktur,unsafe_action,unsafe_condition, '+
          ' personal_factor, job_factor, update_user,cerate_date, cerate_user) VALUES ('+
           QuotedStr(StrEmplId)+','+StrDetail+','+IntToStr(EmplCompanyId)+','+IntToStr(EmplLocationId)+','+StrDateStart+
          ','+StrDateStart+','+StrDept+','+StrInst+','+StrCity+','+StrDesc+','+StrAccident+','+StrFollowUp+
          ','+QuotedStr(AmountOfMaterial.Text)+','+QuotedStr(amount_note.Text)+','+StrTime+','+QuotedStr(Reporter.Text)+
          ','+QuotedStr(VictimsName.Text)+','+QuotedStr(victimsaAge.Text)+','+QuotedStr(Tools.Text)+','+QuotedStr(Proses.Text)+
          ','+QuotedStr(Absent.Text)+','+QuotedStr(note_spv.Text)+','+QuotedStr(note_mr.Text)+
          ','+QuotedStr(note_direktur.Text)+', '+StrUnAction+', '+StrUnCondition+', '+StrPersFactor+
          ', '+StrJobFactor+','+QuotedStr(User)+','+StrDateStart+','+QuotedStr(User)+');';
        end;
      end;

     //StrUnCondition
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
    if IsOk then begin
      Main.TransCommit;
      MessageBox(0,PChar('Data Latar Belakang Berhasil Disimpan'),'Tambah Latar Belakang',MB_OK or MB_ICONINFORMATION);
      
    end else begin
      EnableInput;
      Main.TransRollback;
      MessageBox(0,PChar('Data Latar Belakang Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Tambah Latar Belakang',MB_OK or MB_ICONERROR);
    end;
    Qry.Destroy;
  end else begin
      MessageBox(0,PChar('Silahkan Lengkapi Kolom yang diperlukan'),'Tambah Latar Belakang',MB_OK or MB_ICONERROR);
  end;

  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryForm.DisableInput;
begin
  Detail.Enabled:=False;
  DateStart.Enabled:=False;
  Description.Enabled:=False;
  Departemen.Enabled:=False;
  DateEnd.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TEmployeeHistoryForm.EnableInput;
begin
  Detail.Enabled:=True;
  DateStart.Enabled:=True;
  Description.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TEmployeeHistoryForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryForm.chkUnsafe_actionClick(Sender: TObject);
begin
    if chkUnsafe_action.Checked = True then
    begin
       chkUnsafe_condition.Checked := False;
    end;

end;

procedure TEmployeeHistoryForm.chkUnsafe_conditionClick(Sender: TObject);
begin
      if  chkUnsafe_condition.Checked = True then
    begin
       chkUnsafe_action.Checked := False;
    end;

end;

procedure TEmployeeHistoryForm.chkPersonal_factorClick(Sender: TObject);
begin
  if chkPersonal_factor.Checked = True then begin
      chkJob_factor.Checked := False;
  end;
end;

procedure TEmployeeHistoryForm.chkJob_factorClick(Sender: TObject);
begin
    if chkJob_factor.Checked = True then begin
      chkPersonal_factor.Checked := False;
  end;
end;

procedure TEmployeeHistoryForm.AmountOfMaterialKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    AmountOfMaterial.SetFocus;
    AmountOfMaterial.SelectAll;
  end;
end;

end.
