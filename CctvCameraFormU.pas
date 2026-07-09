unit CctvCameraFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TCctvCameraForm = class(TForm)
    pnlDisplay: TPanel;
    Label1: TLabel;
    edtNamaKamera: TEdit;
    Label2: TLabel;
    edtLokasi: TEdit;
    Label3: TLabel;
    edtIPAddress: TEdit;
    Label4: TLabel;
    edtPort: TEdit;
    Label5: TLabel;
    edtUrutan: TEdit;
    cbActive: TCheckBox;
    btnSimpan: TButton;
    btnBersih: TButton;
    btnSelesai: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnBersihClick(Sender: TObject);
    procedure btnSelesaiClick(Sender: TObject);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
    procedure edtUrutanKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry, StrMsg, StrEMessage: String;
    IsOk: Boolean;
    procedure ClearData;
    procedure EnableData(Value: Boolean);
  public
    { Public declarations }
    DataCameraId, Event: String;
    IsView: Boolean;
    constructor Create(AOwner: TComponent; CameraId, StatusEvent: String; IsViewOnly: Boolean = False);
  end;

var
  CctvCameraForm: TCctvCameraForm;

implementation

uses MainU, CctvCameraListU;

{$R *.dfm}

constructor TCctvCameraForm.Create(AOwner: TComponent; CameraId, StatusEvent: String; IsViewOnly: Boolean = False);
begin
  DataCameraId := CameraId;
  Event := StatusEvent;
  IsView := IsViewOnly;
  inherited Create(AOwner);
end;

procedure TCctvCameraForm.ClearData;
begin
  edtNamaKamera.Clear;
  edtLokasi.Clear;
  edtIPAddress.Clear;
  edtPort.Clear;
  edtUrutan.Text := '0';
  cbActive.Checked := True;
end;

procedure TCctvCameraForm.EnableData(Value: Boolean);
begin
  edtNamaKamera.Enabled := Value;
  edtLokasi.Enabled := Value;
  edtIPAddress.Enabled := Value;
  edtPort.Enabled := Value;
  edtUrutan.Enabled := Value;
  cbActive.Enabled := Value;
end;

procedure TCctvCameraForm.FormCreate(Sender: TObject);
var
  Qry: TADOQuery;
begin
  KeyPreview := True;
  if (Event = 'U') or (Event = 'L') then begin
    Qry := TADOQuery.Create(Self);
    Qry.Connection := Main.MyConnection;
    if Main.OpenDb then begin
      StrQry := 'SELECT * FROM wh_cctv_camera WHERE camera_id=' + QuotedStr(DataCameraId) + ';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :' + StrQry, 2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount > 0 then begin
        if Qry.FieldValues['nama_kamera'] <> NULL then edtNamaKamera.Text := Qry.FieldValues['nama_kamera'];
        if Qry.FieldValues['lokasi'] <> NULL then edtLokasi.Text := Qry.FieldValues['lokasi'];
        if Qry.FieldValues['ip_address'] <> NULL then edtIPAddress.Text := Qry.FieldValues['ip_address'];
        if Qry.FieldValues['port'] <> NULL then edtPort.Text := Qry.FieldValues['port'];
        if Qry.FieldValues['urutan'] <> NULL then edtUrutan.Text := Qry.FieldValues['urutan'];
        cbActive.Checked := (Qry.FieldValues['active'] = True);
      end;
      Qry.Close;
    end;
    Main.CloseDb;
    FreeAndNil(Qry);
  end;
end;

procedure TCctvCameraForm.FormShow(Sender: TObject);
begin
  if Event = 'T' then begin
    ClearData;
    EnableData(True);
  end else if Event = 'U' then begin
    EnableData(True);
  end else if Event = 'L' then begin
    EnableData(False);
    btnSimpan.Visible := False;
    btnBersih.Visible := False;
  end;
end;

procedure TCctvCameraForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCctvCameraForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TCctvCameraForm.edtPortKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then Key := #0;
  if Key = #13 then edtUrutan.SetFocus;
end;

procedure TCctvCameraForm.edtUrutanKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then Key := #0;
  if Key = #13 then btnSimpan.SetFocus;
end;

procedure TCctvCameraForm.btnSimpanClick(Sender: TObject);
var
  Qry: TADOQuery;
  StrCameraId, StrIPAddress, StrPort, StrUrutan, StrActive: String;
  DataCount: String;
begin
  if Trim(edtNamaKamera.Text) = '' then begin
    MessageDlg('Nama Kamera Tidak Boleh Kosong', mtError, [mbOK], 0);
    Exit;
  end;
  if Trim(edtLokasi.Text) = '' then begin
    MessageDlg('Lokasi Tidak Boleh Kosong', mtError, [mbOK], 0);
    Exit;
  end;

  Main.M_Busy;
  IsOk := True;
  StrMsg := '';
  StrEMessage := '';

  if Trim(edtIPAddress.Text) <> '' then StrIPAddress := QuotedStr(Trim(edtIPAddress.Text)) else StrIPAddress := 'NULL';
  if Trim(edtPort.Text) <> '' then StrPort := Trim(edtPort.Text) else StrPort := 'NULL';
  if Trim(edtUrutan.Text) <> '' then StrUrutan := Trim(edtUrutan.Text) else StrUrutan := '0';
  // active = kolom bit, pakai literal '1'/'0' tanpa quote (bukan BoolToStr 'True'/'False' yang ditolak SQL Server)
  if cbActive.Checked then StrActive := '1' else StrActive := '0';

  if Main.OpenDb then begin
    Main.TransStart;
    Qry := TADOQuery.Create(nil);
    Qry.Connection := Main.MyConnection;

    if Event = 'T' then begin
      StrQry := 'SELECT COUNT(*) AS nilai FROM wh_cctv_camera;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.Open;
      except
        on E: Exception do begin
          StrMsg := 'Tabel Kamera CCTV Tidak Dapat Dibuka';
          StrEMessage := E.Message;
          IsOk := False;
        end;
      end;

      if IsOk then begin
        DataCount := Qry.FieldValues['nilai'];
        DataCount := Format('%.*d', [7, StrToInt(DataCount) + 1]);
        StrCameraId := 'CCT' + DataCount;
        Qry.Close;

        StrQry := 'INSERT INTO wh_cctv_camera (camera_id,nama_kamera,lokasi,ip_address,port,company_id,location_id,urutan,active,update_user,update_time) ' +
          'VALUES (' + QuotedStr(StrCameraId) + ',' + QuotedStr(Trim(edtNamaKamera.Text)) + ',' + QuotedStr(Trim(edtLokasi.Text)) + ',' +
          StrIPAddress + ',' + StrPort + ',' + QuotedStr(CompanyId) + ',' + QuotedStr(LocationId) + ',' + StrUrutan + ',' +
          StrActive + ',' + QuotedStr(User) + ',GETDATE());';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E: Exception do begin
            StrMsg := 'Data Kamera Tidak Bisa Diinputkan';
            StrEMessage := E.Message;
            IsOk := False;
          end;
        end;
      end;
    end else if Event = 'U' then begin
      StrQry := 'UPDATE wh_cctv_camera SET nama_kamera=' + QuotedStr(Trim(edtNamaKamera.Text)) +
        ',lokasi=' + QuotedStr(Trim(edtLokasi.Text)) + ',ip_address=' + StrIPAddress + ',port=' + StrPort +
        ',urutan=' + StrUrutan + ',active=' + StrActive +
        ',update_user=' + QuotedStr(User) + ',update_time=GETDATE() WHERE camera_id=' + QuotedStr(DataCameraId) + ';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E: Exception do begin
          StrMsg := 'Data Kamera Tidak Bisa Diupdate';
          StrEMessage := E.Message;
          IsOk := False;
        end;
      end;
    end;

    if IsOk then begin
      Main.TransCommit;
      MessageBox(0, 'Data Kamera Berhasil Disimpan', 'Master Kamera CCTV', MB_OK or MB_ICONINFORMATION);
      if Main.IsFormOpen('CctvCameraList') then begin
        CctvCameraList.LoadDataHeader;
        CctvCameraList.RefreshList;
      end;
      Close;
    end else begin
      Main.TransRollback;
      MessageBox(0, PChar(StrMsg + Chr(13) + Chr(13) + 'Kesalahan:' + Chr(13) + StrEMessage), 'Gagal Simpan', MB_OK or MB_ICONERROR);
    end;

    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCctvCameraForm.btnBersihClick(Sender: TObject);
begin
  ClearData;
end;

procedure TCctvCameraForm.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

end.
