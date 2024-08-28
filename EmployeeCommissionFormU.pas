unit EmployeeCommissionFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, WHUnit, ExtCtrls;

type
  TEmployeeCommissionForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Nama: TEdit;
    MutasiDari: TEdit;
    Label2: TLabel;
    EmployeeId: TEdit;
    Label3: TLabel;
    KomisiBaru: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    TanggalMulai: TDateTimePicker;
    Label6: TLabel;
    Alamat: TEdit;
    Label7: TLabel;
    TglGabung: TEdit;
    MutasiDariTanggal: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Status: TEdit;
    Reguler: TEdit;
    TanggalSelesai: TDateTimePicker;
    Label9: TLabel;
    Label11: TLabel;
    Komisi: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    EmplId:String;
    EmplType:Integer;
    CommissionArr:Array of TArrString2;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String);Overload;
  end;

var
  EmployeeCommissionForm: TEmployeeCommissionForm;

implementation

uses MainU,DateUtils;

{$R *.dfm}

constructor TEmployeeCommissionForm.Create(AOwner:TComponent;EmployeeId:String;EmployeeType:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else begin
    EmplType:=3;
  end;
  EmplId:=EmployeeId;
  inherited Create(AOwner);
end;


procedure TEmployeeCommissionForm.Init;
begin
  Case EmplType of
    1:Caption:='Komisi Mitra';
    2:Caption:='Komisi Driver';
    3:Caption:='Komisi Karyawan';
  end;
  EmployeeId.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  Komisi.Text:='';
  MutasiDari.Text:='';
  Komisi.Text:='';
  KomisiBaru.Text:='';
  KomisiBaru.ItemIndex:=-1;
  KomisiBaru.Items.Clear;
  TanggalMulai.Date:=Now();
  TanggalSelesai.Date:=IncYear(Now());
  GroupBox1.Enabled:=False;
  Simpan.Enabled:=True;
  Reguler.Text:='';
end;

procedure TEmployeeCommissionForm.LoadData;
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
      end;
      Komisi.Text:=Qry.FieldValues['commission_name']
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TEmployeeCommissionForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_empl_commission WHERE status=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(CommissionArr,Qry.RecordCount+1);
    CommissionArr[0][0]:='0';
    CommissionArr[0][1]:='Mengikuti Armada';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CommissionArr[IntCount][0]:=Qry.FieldValues['empl_commission_id'];
      CommissionArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(CommissionArr)-1 do
    KomisiBaru.Items.Add(CommissionArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TEmployeeCommissionForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeCommissionForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeCommissionForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEmployeeId,StrCommissionId,StrFromDate,StrToDate,StrMsg:String;
    StrReguler:String;
    IsOk:Boolean;
begin
  Main.M_Busy;
  if ((KomisiBaru.Text<>'') AND ((TanggalMulai.Date)<(TanggalSelesai.Date)) ) then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      StrEmployeeId:=QuotedStr(EmployeeId.Text);
      StrCommissionId:=CommissionArr[KomisiBaru.ItemIndex][0];
      StrFromDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalMulai.Date));
      StrToDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSelesai.Date));
      StrQry:='UPDATE wh_empl_mutation_detail SET status=0 WHERE (employee_id='+StrEmployeeId+');';
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
      if StrToInt(StrCommissionId)>0 then begin
        StrQry:='INSERT INTO wh_empl_mutation_detail (employee_id,empl_commission_id,from_date,to_date,update_user) '+
                'VALUES ('+StrEmployeeId+','+StrCommissionId+','+StrFromDate+','+StrToDate+','+QuotedStr(User)+');';
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
        MessageBox(0,PChar('Perubahan Komisi Berhasil'),'Perubahan Komisi',MB_OK or MB_ICONINFORMATION);
        Simpan.Enabled:=False;
        Close;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Perubahan Komisi Gagal, Silahkan Hubungi IT'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg),'Perubahan Komisi',MB_OK or MB_ICONERROR);
      end;
      Qry.Destroy;
      Main.CloseDb;
    end;
  end else begin
    StrMsg:='Tanggal Mutasi tidak boleh lebih kecil tanggal terakhir';
    IsOk:=False;
  end;
  Main.M_Normal;
end;

procedure TEmployeeCommissionForm.FormShow(Sender: TObject);
begin
  Init;
  EmployeeId.Text:=EmplId;
  LoadData;
  RefreshCombo;
end;

end.
