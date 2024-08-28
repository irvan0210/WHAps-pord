unit EmployeeHistoryFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, StdCtrls, ExtCtrls, WHUnit, ADODB;

type
  TEmployeeHistoryForm = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
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
    Label1: TLabel;
    Label2: TLabel;
    LabelInstitusi: TLabel;
    LabelKota: TLabel;
    LabelKet: TLabel;
    Detail: TComboBox;
    DateStart: TDateTimePicker;
    DateEnd: TDateTimePicker;
    Labelsd: TLabel;
    Institution: TEdit;
    City: TEdit;
    Description: TMemo;
    Label7: TLabel;
    JoinDate: TEdit;
    LabelDept: TLabel;
    Departemen: TEdit;
    labelAccident: TLabel;
    Accident: TMemo;
    LabelFollowUp: TLabel;
    FollowUp: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DetailChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    HistoryTypeArr:Array of TArrString5;
    EmplId:String;
    EmplType,EmplHistTypeId:Integer;
    EmplLocationId,EmplCompanyId:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
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

  EmplId:=EmployeeId;
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
    label1.Visible:=False;
    Detail.Visible:=False;
    LabelKota.Visible:=False;
    City.Visible:=False;
    labelAccident.Visible:=True;
    Accident.Visible:=True;
    LabelFollowUp.Visible:=True;
    FollowUp.Visible:=True;

    LabelDept.Caption:='Lokasi';
    LabelInstitusi.Caption:='No Polisi';
    LabelKet.Caption:='Ringkasan Kronologis';
    Height:=513;
    Caption:='Riwayat Laka Driver';

    Labelsd.Visible:=False;
    DateEnd.Visible:=False;
    Institution.Enabled:=True;
    City.Enabled:=True;
    Departemen.Enabled:=True;
    Accident.Text:='';
    FollowUp.Text:='';
    Detail.ItemIndex := 13;
  end else begin
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
    Height:=365;
    Caption:='Latar Karyawan';

    Labelsd.Visible:=True;
    DateEnd.Visible:=True;
    DateEnd.Enabled:=False;
    Institution.Enabled:=False;
    City.Enabled:=False;
    Departemen.Enabled:=False;
    Detail.ItemIndex := 14;

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

procedure TEmployeeHistoryForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if EmplId<>'' then LoadData;
end;

procedure TEmployeeHistoryForm.DetailChange(Sender: TObject);
begin
  if Detail.Text<>'' then begin
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
    end else begin
      Institution.Enabled:=False;
      City.Enabled:=False;
      Departemen.Enabled:=False;
    end;
  end;
end;

procedure TEmployeeHistoryForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrEmplId,StrDetail,StrDesc,StrDept,StrInst,StrCity,StrDateStart,StrDateEnd,StrAccident,StrFollowUp:String;
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
    if HistoryTypeArr[Detail.ItemIndex][3]='1' then StrDateEnd:=QuotedStr(FormatDateTime('yyyy/mm/dd',DateEnd.Date)) else StrDateEnd:='NULL';
    if HistoryTypeArr[Detail.ItemIndex][4]='2' then begin
      StrInst:=QuotedStr(Trim(Institution.Text));
      StrCity:=QuotedStr(Trim(City.Text));
    end else if HistoryTypeArr[Detail.ItemIndex][0]='14' then begin
      StrInst:=QuotedStr(Trim(Institution.Text));
      StrCity:=QuotedStr(Trim(Departemen.Text));
    //end else if HistoryTypeArr[Detail.ItemIndex][4]='13' then begin
    //  StrInst:=QuotedStr(Trim(Institution.Text));
    //  StrCity:=QuotedStr(Trim(City.Text));
    end else begin
      StrInst:='NULL';
      StrCity:='NULL';
    end;
    if HistoryTypeArr[Detail.ItemIndex][4]='1' then begin
      StrDept:=QuotedStr(Trim(Departemen.Text));
    end else begin
      StrDept:='NULL';
    end;
    if Trim(Description.Text)<>'' then StrDesc:=QuotedStr(Trim(Description.Text)) else StrDesc:='NULL';
    if Trim(Accident.Text)<>'' then StrAccident:=QuotedStr(Trim(Accident.Text)) else StrAccident:='NULL';
    if Trim(FollowUp.Text)<>'' then StrFollowUp:=QuotedStr(Trim(FollowUp.Text)) else StrFollowUp:='NULL';

    if Main.OpenDb then begin
      Main.TransStart;
      if Accident.Visible=False Then
        StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                ',from_date,to_date,department,institution,city,detail,update_user) VALUES ('+
                QuotedStr(StrEmplId)+','+StrDetail+','+IntToStr(EmplCompanyId)+','+IntToStr(EmplLocationId)+','+StrDateStart+
                ','+StrDateEnd+','+StrDept+','+StrInst+','+StrCity+','+StrDesc+','+QuotedStr(User)+');'
      else
        StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,location_id'+
                ',from_date,to_date,department,institution,city,detail,accident,followup,update_user) VALUES ('+
                QuotedStr(StrEmplId)+','+StrDetail+','+IntToStr(EmplCompanyId)+','+IntToStr(EmplLocationId)+','+StrDateStart+
                ','+StrDateEnd+','+StrDept+','+StrInst+','+StrCity+','+StrDesc+','+StrAccident+','+StrFollowUp+','+QuotedStr(User)+');';
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

end.
