unit KontrakKaryawanFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, WHUnit, ExtCtrls;

type
  TEmployeeContractForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Nama: TEdit;
    MutasiDari: TEdit;
    Label2: TLabel;
    EmployeeId: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    StarDate: TDateTimePicker;
    Label6: TLabel;
    Alamat: TEdit;
    Label7: TLabel;
    TglGabung: TEdit;
    MutasiDariTanggal: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Status: TEdit;
    Label11: TLabel;
    Description: TMemo;
    Reguler: TEdit;
    Label4: TLabel;
    EndDate: TDateTimePicker;
    chk_status_kontrak: TCheckBox;
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
    EmplId, StrEmplId, StrContrctId,StrIsAktif:String;
    EmplType,MutationType:Integer;
    CompanyArr:array of TArrString8;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure CekStatus;
    procedure CekNext(Key:Char);
   // procedure UpdateContract(StrEmplId:String);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String;Contrct_id:String;IsAktif:String);Overload;
 //  function IsFormOpen(const FormName : string): Boolean;
  end;

var
  EmployeeContractForm: TEmployeeContractForm;
  StrStarDate,StrEndDate :string;

implementation

uses MainU, MutasiKaryawanFormU, EmployeeContractListU;

{$R *.dfm}

constructor TEmployeeContractForm.Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String;Contrct_id:String;IsAktif:String);
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
  StrIsAktif :=IsAktif;
  StrContrctId := Contrct_id;
  inherited Create(AOwner);
end;


procedure TEmployeeContractForm.Init;
begin
  Case EmplType of
    1:begin
        Caption:='Kontrak Mitra';
       // StatusReguler.Visible:=True;
        //StatusEksekutif.Visible:=True;
       Reguler.Visible:=True;
      end;
    2:begin
        Caption:='Kontrak Driver';
       // StatusReguler.Visible:=False;
       // StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
    3:begin
        Caption:='Kontrak Karyawan';
        //StatusReguler.Visible:=False;
       // StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
    4:begin
        Caption:='Kontrak BusBoy';
       // StatusReguler.Visible:=False;
       // StatusEksekutif.Visible:=False;
        Reguler.Visible:=False;
      end;
  end;
  EmployeeId.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
 // SBU.Text:='';
 // SBU.ItemIndex:=-1;
  MutasiDari.Text:='';
  StarDate.Date:=Now();
  EndDate.Date:=Now();
  GroupBox1.Enabled:=False;
  Simpan.Enabled:=True;
  Reguler.Text:='';
  chk_status_kontrak.Checked := True;
end;

procedure TEmployeeContractForm.LoadData;
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
          end;
        2:begin
            Status.Text:='NonAktif';
          end;
        0:begin
            Status.Text:='Keluar';
          end;
      end
    end;
    StrQry:='SELECT * FROM wh_empl_contract WHERE status='+QuotedStr(StrIsAktif)+' AND empl_contract_id='+QuotedStr(StrContrctId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then  begin
      if Qry.FieldValues['star_date']<>NULL then
        StarDate.Date:=StrToDate(Qry.FieldValues['star_date']);
      if Qry.FieldValues['end_date']<>NULL then
        EndDate.Date:=StrToDate(Qry.FieldValues['end_date']);
       Description.Text:=Qry.FieldValues['description'];
       if Qry.FieldValues['status']= '1' then
        chk_status_kontrak.Checked := True
        else  chk_status_kontrak.Checked := False;
    end;

    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TEmployeeContractForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  {SBU.Text:='';
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
  Main.M_Normal; }
end;

procedure TEmployeeContractForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeContractForm.BatalClick(Sender: TObject);
begin
  EmployeeContractForm.Close;
end;

procedure TEmployeeContractForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMutationId,StrEmplType,StrCompanyId,
    StrStatusKontrak,StrMsg,StrLocationId,StrNewLocation,StrStatus,StrNewCompany:String;
    StrReguler:String;
    IsOk, IsOk2:Boolean;
begin
  if (EmployeeId.Text <> '') AND (Status.Text ='Aktif') then begin
    StrMsg:='';
    StrStarDate := Chr(39)+FormatDateTime('yyyy-mm-dd',StarDate.Date)+Chr(39);
    StrEndDate := Chr(39)+FormatDateTime('yyyy-mm-dd',EndDate.Date)+Chr(39);
    IsOk2:=False;
    IsOk:=True;
    if chk_status_kontrak.Checked = True then StrStatusKontrak :='1'
    else StrStatusKontrak :='0';
    
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT * FROM wh_empl_contract WHERE (empl_id='+Chr(39)+EmployeeId.Text+Chr(39)+
              ' ) AND (end_date >= CAST(GETDATE() AS DATE))AND status =1;';//+Chr(39)+FormatDateTime('yyyy-mm-dd',StarDate.Date)+Chr(39)');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        MessageBox(0,PChar('Kontrak Masih Aktif'),'Tambah/Update Kontrak',MB_OK or MB_ICONWARNING);
        if MessageBox(0,PChar('Update Kontrak '+nama.Text+'..?') ,'Tambah/Update Kontrak',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
          //UpdateContract(EmplId);
          StrQry:='UPDATE wh_empl_contract SET star_date='+StrStarDate+',end_date='+StrEndDate+
                ',description='+QuotedStr(Description.Text)+
                ',update_user='+Chr(39)+User+Chr(39)+', status='+QuotedStr(StrStatusKontrak)+', update_time= GETDATE()'+
                ' WHERE empl_id='+Chr(39)+EmployeeId.Text+Chr(39)+' AND status = 1'+
                ' AND end_date ='+Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['end_date'])+Chr(39)+';';
        end else begin
          IsOk2:=True;
        end;
      end else begin
        StrQry:='INSERT INTO wh_empl_contract (empl_id,star_date,end_date,description,status,update_time,update_user)'+
                ' VALUES ('+Chr(39)+EmployeeId.Text+Chr(39)+','+StrStarDate+','+StrEndDate+
                ','+QuotedStr(Description.Text)+','+QuotedStr(StrStatusKontrak)+',GETDATE(),'+Chr(39)+User+Chr(39)+');';
      end;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
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
        if IsOk2 then StrMsg:='Batal Merubah Kontrak'
         else  begin
         StrMsg:='Tambah/Update Kontrak Berhasil';
         Simpan.Enabled:=False;
        end;
      end else begin
        Main.TransRollback;
        StrMsg:='Tambah/Update Kontrak Gagal'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg;
      end;
        
      if IsOk then begin
        if IsOk2 then begin
          MessageBox(0,PChar(StrMsg),'Tambah/Update Kontrak',MB_OK or MB_ICONWARNING);
        end else begin
          MessageBox(0,PChar(StrMsg),'Tambah/Update Kontrak',MB_OK or MB_ICONINFORMATION);
         // if IsFormOpen('EmployeeContractList')<>False then
         //     EmployeeContractList.LoadData;
          EmployeeContractForm.Close;
        end;
      end else begin
        MessageBox(0,PChar(StrMsg+'Kesalahan'+Chr(13)+StrMsg),'Tambah/Update Kontrak',MB_OK or MB_ICONERROR);
      end;
      Qry.Destroy;
      Main.CloseDb;
    //end;

    end;
  end;
end;

procedure TEmployeeContractForm.CekStatus;
begin
 { if StatusMutasi.Checked then begin
    SBU.Enabled:=True;
  end else begin
    SBU.Enabled:=False;
  end; }
end;

procedure TEmployeeContractForm.CekNext(Key:Char);
begin

end;

procedure TEmployeeContractForm.StatusNonAktifClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeContractForm.StatusMutasiClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeContractForm.StatusKeluarClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeContractForm.StatusAktifClick(Sender: TObject);
begin
  CekStatus;
end;

procedure TEmployeeContractForm.StatusMutasiKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeContractForm.StatusNonAktifKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeContractForm.StatusAktifKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeContractForm.StatusKeluarKeyPress(Sender: TObject;
  var Key: Char);
begin
  CekNext(Key);
end;

procedure TEmployeeContractForm.FormShow(Sender: TObject);
begin
  Init;
  EmployeeId.Text:=EmplId;
  LoadData;
  RefreshCombo;
  //if MutationType=0 then begin
   // StatusKeluar.Checked:=True;
   // StatusMutasi.Enabled:=False;
   // StatusAktif.Enabled:=False;
   //StatusNonAktif.Enabled:=False;
   // StatusReguler.Enabled:=False;
   // StatusEksekutif.Enabled:=False;
  //end;
end;

{function TEmployeeContractForm.IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
  Result := False;
 // WriteLog('Form Check :'+FormName,1);
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then
    begin
      Result := True;
      Break;
    end;
end;   }


end.
