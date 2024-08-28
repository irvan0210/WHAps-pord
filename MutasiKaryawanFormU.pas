unit MutasiKaryawanFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, WHUnit, ExtCtrls;

type
  TEmployeeMutationForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Nama: TEdit;
    MutasiDari: TEdit;
    Label2: TLabel;
    EmployeeId: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MutasiKeTanggal: TDateTimePicker;
    Label6: TLabel;
    Alamat: TEdit;
    Label7: TLabel;
    TglGabung: TEdit;
    MutasiDariTanggal: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    PanelStatus: TPanel;
    StatusMutasi: TRadioButton;
    StatusNonAktif: TRadioButton;
    StatusKeluar: TRadioButton;
    Label10: TLabel;
    Status: TEdit;
    StatusAktif: TRadioButton;
    Label11: TLabel;
    Keterangan: TMemo;
    StatusReguler: TRadioButton;
    StatusEksekutif: TRadioButton;
    Reguler: TEdit;
    SBU: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure StatusNonAktifClick(Sender: TObject);
    procedure StatusMutasiClick(Sender: TObject);
    procedure StatusKeluarClick(Sender: TObject);
    procedure StatusAktifClick(Sender: TObject);
    procedure StatusMutasiKeyPress(Sender: TObject; var Key: Char);
    procedure StatusNonAktifKeyPress(Sender: TObject; var Key: Char);
    procedure StatusAktifKeyPress(Sender: TObject; var Key: Char);
    procedure StatusKeluarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    EmplId:String;
    EmplType,MutationType:Integer;
    CompanyArr:array of TArrString8;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure CekStatus;
    procedure CekNext(Key:Char);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String;Mutation_Type:Integer=9);Overload;
  end;

var
  EmployeeMutationForm: TEmployeeMutationForm;

implementation

uses MainU;

{$R *.dfm}

constructor TEmployeeMutationForm.Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String;Mutation_Type:Integer=9);
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
  EmplId:=EmployeeId;
  MutationType:=Mutation_Type;
  inherited Create(AOwner);
end;


procedure TEmployeeMutationForm.Init;
begin
  Case EmplType of
    1:begin
        Caption:='Mutasi Mitra';
        StatusReguler.Visible:=True;
        StatusEksekutif.Visible:=True;
        Reguler.Visible:=True;
      end;
    2:begin
        Caption:='Mutasi Driver';
        StatusReguler.Visible:=False;
        StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
    3:begin
        Caption:='Mutasi Karyawan';
        StatusReguler.Visible:=False;
        StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
    4:begin
        Caption:='Mutasi BusBoy';
        StatusReguler.Visible:=False;
        StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
  end;
  EmployeeId.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  SBU.Text:='';
  SBU.ItemIndex:=-1;
  MutasiDari.Text:='';
  MutasiKeTanggal.Date:=Now();
  GroupBox1.Enabled:=False;
  Simpan.Enabled:=True;
  Reguler.Text:='';
end;

procedure TEmployeeMutationForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeResume '+Chr(39)+EmplId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Nama.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['address']<>NULL then
      Alamat.Text:=Qry.FieldValues['address'];
      TglGabung.Text:=Qry.FieldValues['join_date'];
      MutasiDari.Text:=Qry.FieldValues['location'];
      MutasiDariTanggal.Text:=Qry.FieldValues['from_date'];
      if Qry.FieldValues['reguler']=1 then Reguler.Text:='Reguler' else Reguler.Text:='Eksekutif';
      case Qry.FieldValues['active'] of
        1:begin
            Status.Text:='Aktif';
            StatusAktif.Enabled:=False;
            StatusMutasi.Checked:=True;
            StatusReguler.Enabled:=True;
            StatusEksekutif.Enabled:=True;
          end;
        2:begin
            Status.Text:='NonAktif';
            StatusMutasi.Enabled:=False;
            StatusAktif.Checked:=True;
            StatusReguler.Enabled:=False;
            StatusEksekutif.Enabled:=False;
          end;
        0:begin
            Status.Text:='Keluar';
            StatusMutasi.Enabled:=False;
            StatusAktif.Enabled:=True;
            StatusNonAktif.Enabled:=True;
            StatusKeluar.Enabled:=False;
            StatusReguler.Enabled:=False;
            StatusEksekutif.Enabled:=False;
            SBU.Enabled:=False;
          end;
      end
    end;
{    StrQry:='SELECT * FROM wh_location WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if Qry.FieldValues['location_id']<>LocationId then begin
        SetLength(LocationArr,IntCount+1);
        LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
        LocationArr[IntCount][1]:=Qry.FieldValues['location'];
        Inc(IntCount);
      end;
      Qry.Next;
    end;
}
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TEmployeeMutationForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  SBU.Text:='';
  SBU.ItemIndex:=-1;
  SBU.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TEmployeeMutationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeMutationForm.BatalClick(Sender: TObject);
begin
  EmployeeMutationForm.Close;
end;

procedure TEmployeeMutationForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMutationId,StrEmplType,StrCompanyId,StrMsg,StrLocationId,StrNewLocation,StrStatus,StrNewCompany:String;
    StrReguler:String;
    IsOk:Boolean;
begin
  Main.M_Busy;
  StrMsg:='';
  if ((SBU.Text<>'') AND (StatusMutasi.Checked)) OR (Not(StatusMutasi.Checked)) then begin
    if (StrToDate(MutasiDariTanggal.Text)<(MutasiKeTanggal.DateTime)) then begin
      StrNewLocation:=CompanyArr[SBU.Items.IndexOf(SBU.Text)][2];
      StrNewCompany:=CompanyArr[SBU.Items.IndexOf(SBU.Text)][1];
      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='SELECT * FROM wh_empl_mutation WHERE (employee_id='+Chr(39)+EmplId+Chr(39)+
                ' ) AND (from_date<='+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date)+Chr(39)+
                ') AND (to_date IS NULL);';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount<1 then begin
          Qry.Close;
          StrQry:='SELECT * FROM wh_empl_mutation WHERE empl_mutation_id='+
                  '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation '+
                  ' WHERE (employee_id='+Chr(39)+EmplId+Chr(39)+')'+
                  ' AND (from_date<='+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date)+Chr(39)+
                  '));';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            StrMutationId:=Qry.FieldValues['empl_mutation_id'];
            StrEmplType:=Qry.FieldValues['employment_type_id'];
            StrCompanyId:=Qry.FieldValues['company_id'];
            StrLocationId:=Qry.FieldValues['location_id'];
            StrReguler:=Qry.FieldValues['reguler'];
            if StatusEksekutif.Checked=True then StrReguler:='0' else if StatusReguler.Checked=True then StrReguler:='1';
            StrStatus:='3';
            Main.TransStart;
            StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id'+
                    ' ,from_date,status_id,reguler,update_user)'+
                    ' VALUES ('+Chr(39)+EmplId+Chr(39)+','+StrEmplType+','+StrCompanyId+','+StrLocationId+
                    ','+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date)+Chr(39)+','+StrStatus+
                    ','+Chr(39)+StrReguler+Chr(39)+','+Chr(39)+User+Chr(39)+');';
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
            if IsOk then begin
              Main.TransCommit;
            end;
            StrQry:='SELECT * FROM wh_empl_mutation WHERE (employee_id='+Chr(39)+EmplId+Chr(39)+
                    ' ) AND (from_date<='+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date)+Chr(39)+
                    ') AND (to_date IS NULL);';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
          end;
        end;
        if Qry.RecordCount>0 then begin
          StrMutationId:=Qry.FieldValues['empl_mutation_id'];
          StrEmplType:=Qry.FieldValues['employment_type_id'];
          StrCompanyId:=Qry.FieldValues['company_id'];
          StrLocationId:=Qry.FieldValues['location_id'];
          StrReguler:=Qry.FieldValues['reguler'];
          if StatusEksekutif.Checked=True then StrReguler:='0' else if StatusReguler.Checked=True then StrReguler:='1';
          if StatusNonAktif.Checked then StrStatus:='2'
          else if StatusKeluar.Checked then StrStatus:='0'
          else StrStatus:='1';
          Main.TransStart;
          StrQry:='UPDATE wh_empl_mutation SET to_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date-1)+Chr(39)+
                  ',update_user='+Chr(39)+User+Chr(39)+',description='+Chr(39)+Keterangan.Text+Chr(39)+
                  ' WHERE empl_mutation_id='+Chr(39)+StrMutationId+Chr(39)+';';
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
          if Not(StatusKeluar.Checked) then begin
            if Not(StatusMutasi.Checked) then StrNewLocation:=StrLocationId;
            StrQry:='INSERT INTO wh_empl_mutation (employee_id,employment_type_id,company_id,location_id'+
                    ' ,from_date,status_id,reguler,update_time,update_user)'+
                    ' VALUES ('+Chr(39)+EmplId+Chr(39)+','+StrEmplType+','+StrNewCompany+','+StrNewLocation+
                    ','+Chr(39)+FormatDateTime('yyyy-mm-dd',MutasiKeTanggal.Date)+Chr(39)+','+StrStatus+
                    ','+Chr(39)+StrReguler+Chr(39)+',GETDATE(),'+Chr(39)+User+Chr(39)+');';
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
          end;
            StrQry:='UPDATE wh_employee SET active='+StrStatus+',update_user='+Chr(39)+User+Chr(39)+
                    ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+';';
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
        end;
        if IsOk then begin
          Main.TransCommit;
          StrMsg:='Mutasi/NonAktif Berhasil';
          Simpan.Enabled:=False;
        end else begin
          Main.TransRollback;
          StrMsg:='Mutasi Gagal, Silahkan Hubungi IT'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg;
        end;
        Qry.Destroy;
        Main.CloseDb;
      end;
    end else begin
      StrMsg:='Tanggal Mutasi tidak boleh lebih kecil tanggal terakhir';
      IsOk:=False;
    end;
  end else begin
    StrMsg:='Lokasi Mutasi tidak boleh kosong';
    IsOk:=False;
  end;
  Main.M_Normal;
  if IsOk then begin
    MessageBox(0,PChar(StrMsg),'Mutasi Karyawan/Mitra',MB_OK or MB_ICONINFORMATION);
    EmployeeMutationForm.Close;
  end else begin
    MessageBox(0,PChar(StrMsg),'Mutasi Karyawan/Mitra',MB_OK or MB_ICONERROR);
  end;
end;



procedure TEmployeeMutationForm.CekStatus;
begin
  if StatusMutasi.Checked then begin
    SBU.Enabled:=True;
  end else begin
    SBU.Enabled:=False;
  end;
end;

procedure TEmployeeMutationForm.CekNext(Key:Char);
begin
  if Key=#13 then if SBU.Enabled=True then
    SBU.SetFocus
  else
    MutasiKeTanggal.SetFocus;
end;

procedure TEmployeeMutationForm.StatusNonAktifClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeMutationForm.StatusMutasiClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeMutationForm.StatusKeluarClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeMutationForm.StatusAktifClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeMutationForm.StatusMutasiKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeMutationForm.StatusNonAktifKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeMutationForm.StatusAktifKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeMutationForm.StatusKeluarKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeMutationForm.FormShow(Sender: TObject);
begin
  Init;
  EmployeeId.Text:=EmplId;
  LoadData;
  RefreshCombo;
  if MutationType=0 then begin
    StatusKeluar.Checked:=True; 
    StatusMutasi.Enabled:=False;
    StatusAktif.Enabled:=False;
    StatusNonAktif.Enabled:=False;
    StatusReguler.Enabled:=False;
    StatusEksekutif.Enabled:=False;
  end;
end;

end.
