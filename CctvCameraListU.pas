unit CctvCameraListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TCctvCameraList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnTambah: TButton;
    btnEdit: TButton;
    btnNonaktifkan: TButton;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridHDblClick(Sender: TObject);
    procedure StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNonaktifkanClick(Sender: TObject);
  private
    { Private declarations }
    StrQry, StrMsg, StrEMessage: String;
    IsOk: Boolean;
    procedure ClearDataGrid;
  public
    { Public declarations }
    procedure LoadDataHeader;
    procedure RefreshList;
  end;

var
  CctvCameraList: TCctvCameraList;
  CctvCameraArr: Array of TArrString9;
  IntRow: Integer;

implementation

uses MainU, CctvCameraFormU;

{$R *.dfm}

procedure TCctvCameraList.ClearDataGrid;
var
  Count2: Integer;
begin
  StrGridH.RowCount := 2;
  for Count2 := 0 to 4 do
    StrGridH.Cells[Count2, 1] := '';
end;

procedure TCctvCameraList.LoadDataHeader;
var
  Qry: TADOQuery;
  Count: Integer;
begin
  Main.M_Busy;
  Qry := TADOQuery.Create(Self);
  Qry.Connection := Main.MyConnection;
  SetLength(CctvCameraArr, 0);
  if Main.OpenDb then begin
    StrQry := 'EXEC GetCctvCameraList ' + QuotedStr(CompanyId) + ',' + QuotedStr(LocationId) + ';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :' + StrQry, 2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count := 0;
    SetLength(CctvCameraArr, Qry.RecordCount);
    if Qry.RecordCount > 0 then while not (Qry.Eof) do begin
      CctvCameraArr[Count][0] := Qry.FieldValues['camera_id'];
      CctvCameraArr[Count][1] := Qry.FieldValues['nama_kamera'];
      CctvCameraArr[Count][2] := Qry.FieldValues['lokasi'];
      if Qry.FieldValues['ip_address'] <> NULL then CctvCameraArr[Count][3] := Qry.FieldValues['ip_address'] else CctvCameraArr[Count][3] := '';
      if Qry.FieldValues['port'] <> NULL then CctvCameraArr[Count][4] := Qry.FieldValues['port'] else CctvCameraArr[Count][4] := '';
      if Qry.FieldValues['active'] = True then CctvCameraArr[Count][5] := 'Aktif' else CctvCameraArr[Count][5] := 'Nonaktif';
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TCctvCameraList.RefreshList;
var
  IntCount: Integer;
begin
  if Length(CctvCameraArr) > 0 then StrGridH.RowCount := Length(CctvCameraArr) + 1
  else StrGridH.RowCount := 2;
  for IntCount := 0 to Length(CctvCameraArr) - 1 do begin
    StrGridH.Cells[0, IntCount + 1] := CctvCameraArr[IntCount][0];
    StrGridH.Cells[1, IntCount + 1] := CctvCameraArr[IntCount][1];
    StrGridH.Cells[2, IntCount + 1] := CctvCameraArr[IntCount][2];
    StrGridH.Cells[3, IntCount + 1] := CctvCameraArr[IntCount][3];
    StrGridH.Cells[4, IntCount + 1] := CctvCameraArr[IntCount][4];
    StrGridH.Cells[5, IntCount + 1] := CctvCameraArr[IntCount][5];
  end;
end;

procedure TCctvCameraList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCctvCameraList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCctvCameraList.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
  StrGridH.Cells[0, 0] := 'ID';
  StrGridH.Cells[1, 0] := 'Nama Kamera';
  StrGridH.Cells[2, 0] := 'Lokasi';
  StrGridH.Cells[3, 0] := 'IP Address';
  StrGridH.Cells[4, 0] := 'Port';
  StrGridH.Cells[5, 0] := 'Status';

  StrGridH.ColWidths[0] := 90;
  StrGridH.ColWidths[1] := 150;
  StrGridH.ColWidths[2] := 130;
  StrGridH.ColWidths[3] := 100;
  StrGridH.ColWidths[4] := 60;
  StrGridH.ColWidths[5] := 70;
end;

procedure TCctvCameraList.FormShow(Sender: TObject);
begin
  edtCari.Text := '';
  LoadDataHeader;
  RefreshList;
end;

procedure TCctvCameraList.edtCariChange(Sender: TObject);
var
  Count, Count2, Count3, Count4: Integer;
  IsTrue: Boolean;
begin
  if Trim(edtCari.Text) <> '' then begin
    ClearDataGrid;
    Count2 := 2;
    for Count := 0 to Length(CctvCameraArr) - 1 do begin
      IsTrue := False;
      for Count3 := 0 to 2 do
        if (StrPos(PChar(UpperCase(CctvCameraArr[Count][Count3])), PChar(UpperCase(edtCari.Text))) <> nil) then IsTrue := True;
      if IsTrue then begin
        StrGridH.RowCount := Count2;
        for Count4 := 0 to 5 do
          StrGridH.Cells[Count4, Count2 - 1] := CctvCameraArr[Count][Count4];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TCctvCameraList.StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow := ARow;
end;

procedure TCctvCameraList.StrGridHDblClick(Sender: TObject);
begin
  btnEditClick(nil);
end;

procedure TCctvCameraList.btnTambahClick(Sender: TObject);
begin
  CctvCameraForm := TCctvCameraForm.Create(Self, '', 'T');
end;

procedure TCctvCameraList.btnEditClick(Sender: TObject);
begin
  if (IntRow > 0) and (StrGridH.Cells[0, IntRow] <> '') then
    CctvCameraForm := TCctvCameraForm.Create(Self, StrGridH.Cells[0, IntRow], 'U');
end;

procedure TCctvCameraList.btnNonaktifkanClick(Sender: TObject);
var
  Qry: TADOQuery;
begin
  if (IntRow > 0) and (StrGridH.Cells[0, IntRow] <> '') then begin
    if MessageBox(0, PChar('Nonaktifkan kamera ' + StrGridH.Cells[1, IntRow] + ' ?'), 'Master Kamera CCTV', MB_YESNO or MB_ICONQUESTION) = IDYES then begin
      Main.M_Busy;
      IsOk := True;
      Qry := TADOQuery.Create(Self);
      Qry.Connection := Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry := 'UPDATE wh_cctv_camera SET active=0,update_user=' + QuotedStr(User) + ',update_time=GETDATE() WHERE camera_id=' + QuotedStr(StrGridH.Cells[0, IntRow]) + ';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E: Exception do begin
            IsOk := False;
            StrEMessage := E.Message;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          LoadDataHeader;
          RefreshList;
        end else begin
          Main.TransRollback;
          MessageBox(0, PChar('Gagal menonaktifkan kamera' + Chr(13) + Chr(13) + 'Kesalahan:' + Chr(13) + StrEMessage), 'Master Kamera CCTV', MB_OK or MB_ICONERROR);
        end;
      end;
      Main.CloseDb;
      FreeAndNil(Qry);
      Main.M_Normal;
    end;
  end;
end;

procedure TCctvCameraList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
