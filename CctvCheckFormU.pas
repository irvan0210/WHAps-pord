unit CctvCheckFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid, Buttons,
  ComCtrls;

type
  TCctvCheckForm = class(TForm)
    GroupHeader: TPanel;
    Label1: TLabel;
    Tanggal: TDateTimePicker;
    CekOtomatis: TButton;
    Simpan: TButton;
    Riwayat: TButton;
    Bersihkan: TButton;
    Batal: TButton;
    StrGrid: TZColorStringGrid;
    CheckSelect: TCheckBox;
    Keterangan: TMemo;
    // Label2, lblKeterangan: tidak dipakai (tidak ada object-nya di .dfm), dikomentari saja bukan dihapus
    // Label2: TLabel;
    // lblKeterangan: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure CekOtomatisClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure RiwayatClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckSelectClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure KeteranganExit(Sender: TObject);
  private
    { Private declarations }
    CctvArr: Array of TArrString8;
    IntRow, IntCol: Integer;
    StrCheckDate: String;
    procedure InitGrid;
    procedure LoadDataGrid;
    procedure RefreshGrid;
    procedure UpdateRowStyle(ARow: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; CheckDate: String = ''); Overload;
  end;

var
  CctvCheckForm: TCctvCheckForm;

implementation

uses MainU, ADODB, StrUtils, CctvCheckListU;

{$R *.dfm}

constructor TCctvCheckForm.Create(AOwner: TComponent; CheckDate: String = '');
begin
  StrCheckDate := CheckDate;
  inherited Create(AOwner);
end;

procedure TCctvCheckForm.InitGrid;
begin
  StrGrid.ColCount := 9;
  StrGrid.RowCount := 2;
  StrGrid.ColWidths[0] := 0;
  StrGrid.ColWidths[1] := 160;
  StrGrid.ColWidths[2] := 130;
  StrGrid.ColWidths[3] := 55;
  StrGrid.ColWidths[4] := 55;
  StrGrid.ColWidths[5] := 70;
  StrGrid.ColWidths[6] := 220;
  StrGrid.ColWidths[7] := 0;
  StrGrid.ColWidths[8] := 0;
  StrGrid.Cells[0, 0] := 'ID';
  StrGrid.Cells[1, 0] := 'Nama Kamera';
  StrGrid.Cells[2, 0] := 'Lokasi';
  StrGrid.Cells[3, 0] := 'Hidup';
  StrGrid.Cells[4, 0] := 'Mati';
  StrGrid.Cells[5, 0] := 'Sumber';
  StrGrid.Cells[6, 0] := 'Keterangan';
  StrGrid.Cells[7, 0] := 'IP';
  StrGrid.Cells[8, 0] := 'Port';
end;

procedure TCctvCheckForm.LoadDataGrid;
var
  Qry: TADOQuery;
  StrQry: String;
  IntCount: Integer;
begin
  Main.M_Busy;
  Qry := TADOQuery.Create(Self);
  Qry.Connection := Main.MyConnection;
  SetLength(CctvArr, 0);
  if Main.OpenDb then begin
    StrQry := 'EXEC GetCctvCheckListByDate ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Tanggal.Date)) + ',' +
      QuotedStr(CompanyId) + ',' + QuotedStr(LocationId) + ';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :' + StrQry, 2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount := 0;
    SetLength(CctvArr, Qry.RecordCount);
    if Qry.RecordCount > 0 then while not (Qry.Eof) do begin
      CctvArr[IntCount][0] := Qry.FieldValues['camera_id'];
      CctvArr[IntCount][1] := Qry.FieldValues['nama_kamera'];
      CctvArr[IntCount][2] := Qry.FieldValues['lokasi'];
      if Qry.FieldValues['kondisi'] = '1' then CctvArr[IntCount][3] := 'v' else CctvArr[IntCount][3] := '';
      if Qry.FieldValues['kondisi'] = '0' then CctvArr[IntCount][4] := 'v' else CctvArr[IntCount][4] := '';
      if Qry.FieldValues['sumber_cek'] <> NULL then CctvArr[IntCount][5] := Qry.FieldValues['sumber_cek'] else CctvArr[IntCount][5] := '';
      if Qry.FieldValues['keterangan'] <> NULL then CctvArr[IntCount][6] := Qry.FieldValues['keterangan'] else CctvArr[IntCount][6] := '';
      if Qry.FieldValues['ip_address'] <> NULL then CctvArr[IntCount][7] := Qry.FieldValues['ip_address'] else CctvArr[IntCount][7] := '';
      if Qry.FieldValues['port'] <> NULL then CctvArr[IntCount][8] := Qry.FieldValues['port'] else CctvArr[IntCount][8] := '';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TCctvCheckForm.UpdateRowStyle(ARow: Integer);
begin
  StrGrid.CellStyle[3, ARow].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[4, ARow].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[5, ARow].HorizontalAlignment := taCenter;
  if StrGrid.Cells[4, ARow] = 'v' then
    StrGrid.CellStyle[1, ARow].Font.Color := clRed
  else
    StrGrid.CellStyle[1, ARow].Font.Color := clWindowText;
end;

procedure TCctvCheckForm.RefreshGrid;
var
  IntCount, IntCount2: Integer;
begin
  if Length(CctvArr) > 0 then StrGrid.RowCount := Length(CctvArr) + 1
  else StrGrid.RowCount := 2;
  for IntCount := 0 to Length(CctvArr) - 1 do begin
    for IntCount2 := 0 to 8 do
      StrGrid.Cells[IntCount2, IntCount + 1] := CctvArr[IntCount][IntCount2];
    UpdateRowStyle(IntCount + 1);
  end;
end;

procedure TCctvCheckForm.FormShow(Sender: TObject);
begin
  InitGrid;
  if Trim(StrCheckDate) <> '' then
    Tanggal.Date := StrToDate(StrCheckDate)
  else
    Tanggal.Date := Now();
  LoadDataGrid;
  RefreshGrid;
end;

procedure TCctvCheckForm.TanggalChange(Sender: TObject);
begin
  LoadDataGrid;
  RefreshGrid;
end;

procedure TCctvCheckForm.CekOtomatisClick(Sender: TObject);
var
  IntCount, IntPort: Integer;
  IsHidup: Boolean;
begin
  Main.M_Busy;
  Screen.Cursor := crHourGlass;
  try
    for IntCount := 1 to StrGrid.RowCount - 1 do begin
      if (StrGrid.Cells[0, IntCount] <> '') and (Trim(StrGrid.Cells[7, IntCount]) <> '') then begin
        if Trim(StrGrid.Cells[8, IntCount]) <> '' then IntPort := StrToInt(Trim(StrGrid.Cells[8, IntCount])) else IntPort := 80;
        IsHidup := IsPortOpened(Trim(StrGrid.Cells[7, IntCount]), IntPort);
        if IsHidup then begin
          StrGrid.Cells[3, IntCount] := 'v';
          StrGrid.Cells[4, IntCount] := '';
        end else begin
          StrGrid.Cells[3, IntCount] := '';
          StrGrid.Cells[4, IntCount] := 'v';
        end;
        StrGrid.Cells[5, IntCount] := 'AUTO';
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  // Catatan: sengaja TIDAK panggil RefreshGrid di sini karena RefreshGrid menulis ulang
  // sel dari CctvArr (data lama hasil LoadDataGrid) sehingga akan menimpa balik hasil
  // cek otomatis di atas. Cukup update style/warna baris berdasarkan isi StrGrid saat ini.
  for IntCount := 1 to StrGrid.RowCount - 1 do
    if StrGrid.Cells[0, IntCount] <> '' then UpdateRowStyle(IntCount);
  Main.M_Normal;
  MessageBox(0, 'Cek otomatis selesai. Kamera tanpa IP Address harus dicek manual.', 'Checklist CCTV', MB_OK or MB_ICONINFORMATION);
end;

procedure TCctvCheckForm.SimpanClick(Sender: TObject);
var
  Qry: TADOQuery;
  StrQry, StrMsg, StrException, StrCameraId, StrKondisi, StrSumber, StrKeterangan, StrDate: String;
  IntCount: Integer;
  IsOk, IsAnyChecked: Boolean;
begin
  IsOk := True;
  IsAnyChecked := False;
  StrDate := QuotedStr(FormatDateTime('yyyy-mm-dd', Tanggal.Date));
  Qry := TADOQuery.Create(Self);
  Qry.Connection := Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    for IntCount := 1 to StrGrid.RowCount - 1 do begin
      if StrGrid.Cells[0, IntCount] <> '' then begin
        StrCameraId := QuotedStr(StrGrid.Cells[0, IntCount]);
        if StrGrid.Cells[3, IntCount] = 'v' then StrKondisi := '1'
        else if StrGrid.Cells[4, IntCount] = 'v' then StrKondisi := '0'
        else StrKondisi := '';

        if StrKondisi <> '' then begin
          IsAnyChecked := True;
          if Trim(StrGrid.Cells[5, IntCount]) <> '' then StrSumber := Trim(StrGrid.Cells[5, IntCount]) else StrSumber := 'MANUAL';
          if Trim(StrGrid.Cells[6, IntCount]) <> '' then StrKeterangan := QuotedStr(StrGrid.Cells[6, IntCount]) else StrKeterangan := 'NULL';

          StrQry := 'IF EXISTS (SELECT 1 FROM wh_cctv_check WHERE camera_id=' + StrCameraId + ' AND check_date=' + StrDate + ') ' +
            'UPDATE wh_cctv_check SET kondisi=' + QuotedStr(StrKondisi) + ',sumber_cek=' + QuotedStr(StrSumber) +
            ',keterangan=' + StrKeterangan + ',check_time=GETDATE(),update_user=' + QuotedStr(User) + ',update_time=GETDATE() ' +
            'WHERE camera_id=' + StrCameraId + ' AND check_date=' + StrDate + '; ' +
            'ELSE ' +
            'INSERT INTO wh_cctv_check (camera_id,check_date,kondisi,sumber_cek,keterangan,check_time,update_user,update_time) VALUES (' +
            StrCameraId + ',' + StrDate + ',' + QuotedStr(StrKondisi) + ',' + QuotedStr(StrSumber) + ',' + StrKeterangan +
            ',GETDATE(),' + QuotedStr(User) + ',GETDATE());';

          Qry.SQL.Clear;
          Main.WriteLog('SQL :' + StrQry, 4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E: Exception do begin
              IsOk := False;
              StrMsg := 'Gagal menyimpan checklist kamera ' + StrGrid.Cells[1, IntCount];
              StrException := E.Message;
            end;
          end;
        end;
      end;
    end;

    if not IsAnyChecked then begin
      Main.TransRollback;
      MessageBox(0, 'Belum ada kamera yang ditandai Hidup/Mati', 'Checklist CCTV', MB_OK or MB_ICONWARNING);
    end else if IsOk then begin
      Main.TransCommit;
      MessageBox(0, 'Checklist CCTV berhasil disimpan', 'Checklist CCTV', MB_OK or MB_ICONINFORMATION);
      LoadDataGrid;
      RefreshGrid;
    end else begin
      Main.TransRollback;
      MessageBox(0, PChar(StrMsg + Chr(13) + Chr(13) + 'Kesalahan:' + Chr(13) + StrException), 'Checklist CCTV', MB_OK or MB_ICONERROR);
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TCctvCheckForm.RiwayatClick(Sender: TObject);
begin
  if Main.IsFormOpen('CctvCheckList') = False then
    CctvCheckList := TCctvCheckList.Create(Self);
end;

procedure TCctvCheckForm.BersihkanClick(Sender: TObject);
begin
  LoadDataGrid;
  RefreshGrid;
end;

procedure TCctvCheckForm.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TCctvCheckForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCctvCheckForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow := ARow;
  IntCol := ACol;
  if (ARow > 0) and (StrGrid.Cells[0, ARow] <> '') then begin
    R := StrGrid.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid.Left;
    R.Right := R.Right + StrGrid.Left;
    R.Top := R.Top + StrGrid.Top;
    R.Bottom := R.Bottom + StrGrid.Top;
    case ACol of
      3: with CheckSelect do begin
          Left := R.Left + 20;
          Top := R.Top + 1;
          Width := 17;
          Height := 17;
          if StrGrid.Cells[ACol, ARow] = 'v' then Checked := True else Checked := False;
          Visible := True;
          BringToFront;
          SetFocus;
        end;
      4: with CheckSelect do begin
          Left := R.Left + 20;
          Top := R.Top + 1;
          Width := 17;
          Height := 17;
          if StrGrid.Cells[ACol, ARow] = 'v' then Checked := True else Checked := False;
          Visible := True;
          BringToFront;
          SetFocus;
        end;
      6: with Keterangan do begin
          Left := R.Left + 1;
          Top := R.Top + 1;
          Width := (R.Right + 1) - R.Left;
          Height := (R.Bottom + 1) - R.Top;
          Text := StrGrid.Cells[ACol, ARow];
          Visible := True;
          BringToFront;
          SetFocus;
        end;
    end;
  end;
end;

procedure TCctvCheckForm.CheckSelectClick(Sender: TObject);
begin
  if IntCol = 3 then begin
    if StrGrid.Cells[4, IntRow] = 'v' then StrGrid.Cells[4, IntRow] := '';
  end;
  if IntCol = 4 then begin
    if StrGrid.Cells[3, IntRow] = 'v' then StrGrid.Cells[3, IntRow] := '';
  end;
end;

procedure TCctvCheckForm.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked then
    StrGrid.Cells[IntCol, IntRow] := 'v'
  else
    StrGrid.Cells[IntCol, IntRow] := '';
  StrGrid.Cells[5, IntRow] := 'MANUAL';
  CheckSelect.Checked := False;
  CheckSelect.Visible := False;
  UpdateRowStyle(IntRow);
  StrGrid.SetFocus;
end;

procedure TCctvCheckForm.KeteranganExit(Sender: TObject);
begin
  StrGrid.Cells[6, IntRow] := Keterangan.Text;
  Keterangan.Visible := False;
  Keterangan.Text := '';
  StrGrid.SetFocus;
end;

end.
