unit CctvCheckListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ComCtrls, Buttons,
  ExtCtrls;

type
  TCctvCheckList = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Tanggal: TDateTimePicker;
    Label2: TLabel;
    Tanggal2: TDateTimePicker;
    Search: TSpeedButton;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Cari: TEdit;
    PanelFooter: TPanel;
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure Tanggal2Change(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  public
    { Public declarations }
  end;

var
  CctvCheckList: TCctvCheckList;
  CctvHistoryArr: Array of TArrString7;
  IntRow: Integer;

implementation

uses MainU, ADODB, StrUtils, CctvCheckFormU;

{$R *.dfm}

procedure TCctvCheckList.Init;
begin
  StrGrid.ColWidths[0] := 90;
  StrGrid.ColWidths[1] := 90;
  StrGrid.ColWidths[2] := 150;
  StrGrid.ColWidths[3] := 130;
  StrGrid.ColWidths[4] := 70;
  StrGrid.ColWidths[5] := 70;
  StrGrid.ColWidths[6] := 250;

  StrGrid.Cells[0, 0] := 'Tanggal';
  StrGrid.Cells[1, 0] := 'ID Kamera';
  StrGrid.Cells[2, 0] := 'Nama Kamera';
  StrGrid.Cells[3, 0] := 'Lokasi';
  StrGrid.Cells[4, 0] := 'Kondisi';
  StrGrid.Cells[5, 0] := 'Sumber';
  StrGrid.Cells[6, 0] := 'Keterangan';

  StrGrid.RowCount := 2;
end;

procedure TCctvCheckList.LoadData;
var
  Qry: TADOQuery;
  StrQry: String;
  IntCount: Integer;
begin
  Main.M_Busy;
  Qry := TADOQuery.Create(Self);
  Qry.Connection := Main.MyConnection;
  SetLength(CctvHistoryArr, 0);
  if Main.OpenDb then begin
    StrQry := 'EXEC GetCctvCheckHistory ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Tanggal.Date)) + ',' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', Tanggal2.Date)) + ',' + QuotedStr(CompanyId) + ',' + QuotedStr(LocationId) + ';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :' + StrQry, 2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount := 0;
    SetLength(CctvHistoryArr, Qry.RecordCount);
    if Qry.RecordCount > 0 then while not (Qry.Eof) do begin
      CctvHistoryArr[IntCount][0] := FormatDateTime('dd/mm/yyyy', Qry.FieldValues['check_date']);
      CctvHistoryArr[IntCount][1] := Qry.FieldValues['camera_id'];
      CctvHistoryArr[IntCount][2] := Qry.FieldValues['nama_kamera'];
      CctvHistoryArr[IntCount][3] := Qry.FieldValues['lokasi'];
      if Qry.FieldValues['kondisi'] = '1' then CctvHistoryArr[IntCount][4] := 'Hidup' else CctvHistoryArr[IntCount][4] := 'Mati';
      if Qry.FieldValues['sumber_cek'] <> NULL then CctvHistoryArr[IntCount][5] := Qry.FieldValues['sumber_cek'] else CctvHistoryArr[IntCount][5] := '';
      if Qry.FieldValues['keterangan'] <> NULL then CctvHistoryArr[IntCount][6] := Qry.FieldValues['keterangan'] else CctvHistoryArr[IntCount][6] := '';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TCctvCheckList.RefreshList;
var
  IntCount, IntCount2: Integer;
begin
  if Length(CctvHistoryArr) > 0 then StrGrid.RowCount := Length(CctvHistoryArr) + 1
  else StrGrid.RowCount := 2;
  for IntCount := 0 to Length(CctvHistoryArr) - 1 do begin
    StrGrid.Cells[0, IntCount + 1] := CctvHistoryArr[IntCount][0];
    StrGrid.Cells[1, IntCount + 1] := CctvHistoryArr[IntCount][1];
    StrGrid.Cells[2, IntCount + 1] := CctvHistoryArr[IntCount][2];
    StrGrid.Cells[3, IntCount + 1] := CctvHistoryArr[IntCount][3];
    StrGrid.Cells[4, IntCount + 1] := CctvHistoryArr[IntCount][4];
    StrGrid.Cells[5, IntCount + 1] := CctvHistoryArr[IntCount][5];
    StrGrid.Cells[6, IntCount + 1] := CctvHistoryArr[IntCount][6];

    if CctvHistoryArr[IntCount][4] = 'Mati' then begin
      for IntCount2 := 0 to StrGrid.ColCount - 1 do
        StrGrid.CellStyle[IntCount2, IntCount + 1].Font.Color := clRed;
    end else begin
      for IntCount2 := 0 to StrGrid.ColCount - 1 do
        StrGrid.CellStyle[IntCount2, IntCount + 1].Font.Color := clGreen;
    end;
  end;
end;

procedure TCctvCheckList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCctvCheckList.FormShow(Sender: TObject);
begin
  Cari.Text := '';
  Tanggal.Date := Now();
  Tanggal2.Date := Now();
  Init;
  LoadData;
  RefreshList;
end;

procedure TCctvCheckList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCctvCheckList.SearchClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TCctvCheckList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TCctvCheckList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date > Tanggal2.Date then
    Tanggal2.Date := Tanggal.Date;
end;

procedure TCctvCheckList.Tanggal2Change(Sender: TObject);
begin
  if Tanggal2.Date < Tanggal.Date then
    Tanggal.Date := Tanggal2.Date;
end;

procedure TCctvCheckList.CariChange(Sender: TObject);
var
  Count, Count2, Count3, Count4: Integer;
  IsTrue: Boolean;
begin
  if Trim(Cari.Text) <> '' then begin
    StrGrid.RowCount := 2;
    Count2 := 2;
    for Count := 0 to Length(CctvHistoryArr) - 1 do begin
      IsTrue := False;
      for Count3 := 0 to 3 do
        if (StrPos(PChar(UpperCase(CctvHistoryArr[Count][Count3])), PChar(UpperCase(Cari.Text))) <> nil) then IsTrue := True;
      if IsTrue then begin
        StrGrid.RowCount := Count2;
        for Count4 := 0 to 6 do
          StrGrid.Cells[Count4, Count2 - 1] := CctvHistoryArr[Count][Count4];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TCctvCheckList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow := ARow;
end;

procedure TCctvCheckList.StrGridDblClick(Sender: TObject);
begin
  if (IntRow > 0) and (StrGrid.Cells[0, IntRow] <> '') then begin
    if Main.IsFormOpen('CctvCheckForm') = False then
      CctvCheckForm := TCctvCheckForm.Create(Self, StrGrid.Cells[0, IntRow]);
  end;
end;

end.
