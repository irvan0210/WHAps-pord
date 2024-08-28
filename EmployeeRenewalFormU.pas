unit EmployeeRenewalFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ADODB, WHUnit;

type
  TEmployeeRenewalForm = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    NIK: TEdit;
    Nama: TEdit;
    Alamat: TEdit;
    Expired: TEdit;
    Label5: TLabel;
    GroupExtend: TPanel;
    OneYears: TRadioButton;
    SixMonths: TRadioButton;
    ThreeMonths: TRadioButton;
    OneMonth: TRadioButton;
    Free: TRadioButton;
    Tanggal: TDateTimePicker;
    Simpan: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OneMonthClick(Sender: TObject);
    procedure ThreeMonthsClick(Sender: TObject);
    procedure SixMonthsClick(Sender: TObject);
    procedure OneYearsClick(Sender: TObject);
    procedure FreeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshData;
  public
    { Public declarations }
    EmplType,CompanyId:Integer;
    EmplId:String;
    EmplCode:String;
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);Overload;
  end;

var
  EmployeeRenewalForm: TEmployeeRenewalForm;

implementation

uses MainU, DateUtils, EmployeeListU;

{$R *.dfm}

constructor TEmployeeRenewalForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    CompanyId:=3;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    CompanyId:=2;
    EmplCode:='BS';
  end else begin
    EmplType:=3;
    CompanyId:=1;
    EmplCode:='';
  end;
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;


procedure TEmployeeRenewalForm.SelesaiClick(Sender: TObject);
begin
  EmployeeRenewalForm.Close;
end;

procedure TEmployeeRenewalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeRenewalForm.Init;
begin
  NIK.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  Expired.Text:='';
  OneMonth.Checked:=True;
  Tanggal.Enabled:=False;
  Tanggal.Date:=Now();
  GroupExtend.Enabled:=False;
end;

procedure TEmployeeRenewalForm.OneMonthClick(Sender: TObject);
begin
  Tanggal.Enabled:=False;
end;

procedure TEmployeeRenewalForm.ThreeMonthsClick(Sender: TObject);
begin
  Tanggal.Enabled:=False;
end;

procedure TEmployeeRenewalForm.SixMonthsClick(Sender: TObject);
begin
  Tanggal.Enabled:=False;
end;

procedure TEmployeeRenewalForm.OneYearsClick(Sender: TObject);
begin
  Tanggal.Enabled:=False;
end;

procedure TEmployeeRenewalForm.FreeClick(Sender: TObject);
begin
  if Free.Checked then Tanggal.Enabled:=True else Tanggal.Enabled:=False;
end;

procedure TEmployeeRenewalForm.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT *,CONVERT(VARCHAR(10),b.kpp_expired,103) FROM wh_employee a '+
            ' INNER JOIN wh_empl_detail b ON b.empl_detail_id='+
            '(SELECT MAX(empl_detail_id) FROM wh_empl_detail WHERE employee_id=a.employee_id) '+
            ' INNER JOIN wh_empl_mutation c ON c.empl_mutation_id='+
            '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)'+
            'AND ((GETDATE()>=from_date) OR (GETDATE() BETWEEN from_date and to_date) ) )'+
            ' WHERE (a.employee_id='+Chr(39)+EmplId+Chr(39)+');';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      NIK.Text:=Qry.FieldValues['employee_id'];
      Nama.Text:=Qry.FieldValues['name'];
      Alamat.Text:=Qry.FieldValues['address'];
      Expired.Text:=Qry.FieldValues['kpp_expired'];
      if CompareDate(StrToDate(Expired.Text),Now())=-1 then GroupExtend.Enabled:=True;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
end;

procedure TEmployeeRenewalForm.FormShow(Sender: TObject);
begin
  Init;
  if EmplId<>'' then RefreshData;
end;

procedure TEmployeeRenewalForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrAddress,StrPhoneNo,StrCellNo,StrMaritalStatus,StrChildren,StrLicenseType,StrLicenseId:String;
    StrLicenseExpired,StrDayNight,StrEmplStatusId,StrKppExpired,StrEMessage:String;
    IsOk:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  StrEMessage:='';
  IsOk:=True;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_empl_detail WHERE empl_detail_id='+
            '(SELECT MAX(empl_detail_id) FROM wh_empl_detail WHERE '+
            ' employee_id='+Chr(39)+EmplId+Chr(39)+');';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      StrAddress:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone_no']<>NULL then StrPhoneNo:=Qry.FieldValues['phone_no'];
      if Qry.FieldValues['cellular_no']<>NULL then StrCellNo:=Qry.FieldValues['cellular_no'];
      StrMaritalStatus:=Qry.FieldValues['marital_status_id'];
      if Qry.FieldValues['children']<>NULL then StrChildren:=QuotedStr(Qry.FieldValues['children']) else StrChildren:='NULL';
      StrKppExpired:=Qry.FieldValues['kpp_expired'];
      StrLicenseType:=Qry.FieldValues['license_type_id'];
      StrLicenseId:=Qry.FieldValues['license_id'];
      StrLicenseExpired:=FormatDateTime('yyyy-mm-dd',Qry.FieldValues['license_expired']);
      StrDayNight:=Qry.FieldValues['day_night'];
      StrEmplStatusId:=Qry.FieldValues['empl_status_id'];
    end;
    Qry.Close;
    StrQry:='';
    if Free.Checked then begin
      StrKppExpired:=FormatDateTime('yyyy-mm-dd',Tanggal.Date);
    end else begin
      if OneYears.Checked then begin
        StrKppExpired:=FormatDateTime('yyyy-mm-dd',IncYear(StrToDate(Expired.Text)));
      end else if SixMonths.Checked then begin
        StrKppExpired:=FormatDateTime('yyyy-mm-dd',IncMonth(StrToDate(Expired.Text),6));
      end else if ThreeMonths.Checked then begin
        StrKppExpired:=FormatDateTime('yyyy-mm-dd',IncMonth(StrToDate(Expired.Text),3));
      end else if OneMonth.Checked then begin
        StrKppExpired:=FormatDateTime('yyyy-mm-dd',IncMonth(StrToDate(Expired.Text)));
      end;
    end;
    StrQry:='INSERT INTO wh_empl_detail '+
            '(employee_id,address,phone_no,cellular_no,marital_status_id,children,kpp_expired'+
            ',license_type_id,license_id,license_expired,day_night,empl_status_id,update_user) '+
            ' VALUES ('+QuotedStr(EmplId)+','+QuotedStr(StrAddress)+','+QuotedStr(StrPhoneNo)+
            ','+QuotedStr(StrCellNo)+','+QuotedStr(StrMaritalStatus)+','+StrChildren+
            ','+QuotedStr(StrKppExpired)+','+QuotedStr(StrLicenseType)+','+QuotedStr(StrLicenseId)+
            ','+QuotedStr(StrLicenseExpired)+','+QuotedStr(StrDayNight)+','+QuotedStr(StrEmplStatusId)+
            ','+QuotedStr(User)+')';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
      on E:Exception do begin
        StrEMessage:=E.Message;
        IsOk:=False;
      end;
    end;
    if IsOk then begin
      MessageBox(0,PChar('KPP/NIK Berhasil diperpanjang'),'Perpanjang KPP/NIK',MB_OK or MB_ICONWARNING);
    end else begin
      MessageBox(0,PChar('Tidak dapat Menyimpan data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMessage),'Perpanjang KPP/NIK',MB_OK or MB_ICONWARNING);
    end;
  end;
  Qry.Destroy;
  Main.CloseDb;
  if IsOk then begin
    EmployeeList.RefreshList;
    EmployeeRenewalForm.Close;
  end;
end;

end.
