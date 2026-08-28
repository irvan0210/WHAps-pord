unit InventarisListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TInventarisList = class(TForm)
    Panel1: TPanel;
    delete: TBitBtn;
    add_new: TBitBtn;
    Selesai: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Edit: TBitBtn;
    btn_cari: TSpeedButton;
    ExportExcel: TBitBtn;
    LblFilterCabang: TLabel;
    FilterCabang: TComboBox;
    LblFilterJenis: TLabel;
    FilterJenis: TComboBox;
    CetakLabel: TBitBtn;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure add_newClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure btn_cariClick(Sender: TObject);
    procedure FilterChange(Sender: TObject);
    procedure CetakLabelClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshFilterCombo;
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  InventarisList: TInventarisList;
  FilterCabangArr:Array of TArrString2;
  FilterJenisArr:Array of TArrString2;
  //Layout InvArr per baris:
  //0 inventaris_id,1 kode_integrasi_id,2 ki_display,3 company_id,4 location_id,5 lokasi_display,
  //6 deskripsi_ringkas,7 tanggal_perolehan,8 tanggal_valuta,9 kode_label_inventaris,10 nilai_perolehan,
  //11 usia_pemakaian,12 jenis_id,13 jenis_nama,14 subjenis_id,15 subjenis_nama,16 department_id,17 department_nama,
  //18 merk_id,19 merk_nama,20 type_id,21 type_display,22 sandi_bi_id,23 sandibi_display,24 serial_number,
  //25 memory_id,26 memory_nama,27 storage_id,28 storage_nama,29 user_id,30 user_nama,31 status_aktif,32 keterangan
  InvArr:Array of TArrString40;
  IntRow:Integer;

implementation

uses MainU, InventarisFormU, InventarisLabelRptU;

{$R *.dfm}

procedure TInventarisList.SelesaiClick(Sender: TObject);
begin
  InventarisList.Close;
end;

procedure TInventarisList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TInventarisList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=110;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=180;
  StrGrid.ColWidths[6]:=110;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=80;
  StrGrid.ColWidths[9]:=60;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Inventaris ID';
  StrGrid.Cells[2,0]:='Label Inventaris';
  StrGrid.Cells[3,0]:='Kode Integrasi';
  StrGrid.Cells[4,0]:='Jenis';
  StrGrid.Cells[5,0]:='Deskripsi Ringkas';
  StrGrid.Cells[6,0]:='Lokasi';
  StrGrid.Cells[7,0]:='Merk';
  StrGrid.Cells[8,0]:='Type';
  StrGrid.Cells[9,0]:='Status';

  for IntCount:=0 to 9 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;
end;

procedure TInventarisList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetInventarisList ';
    if FilterCabang.ItemIndex>0 then
      StrQry:=StrQry+FilterCabangArr[FilterCabang.ItemIndex-1][0]+','+
              FilterCabangArr[FilterCabang.ItemIndex-1][1]+','
    else
      StrQry:=StrQry+'NULL,NULL,';
    if FilterJenis.ItemIndex>0 then
      StrQry:=StrQry+FilterJenisArr[FilterJenis.ItemIndex-1][0]
    else
      StrQry:=StrQry+'NULL';
    StrQry:=StrQry+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(InvArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      InvArr[IntCount][0]:=Qry.FieldValues['inventaris_id'];
      InvArr[IntCount][1]:=Qry.FieldValues['kode_integrasi_id'];
      InvArr[IntCount][2]:=Qry.FieldValues['ki_kode']+' - '+Qry.FieldValues['ki_nama'];
      InvArr[IntCount][3]:=Qry.FieldValues['company_id'];
      InvArr[IntCount][4]:=Qry.FieldValues['location_id'];
      InvArr[IntCount][5]:=Qry.FieldValues['location_code']+' - '+Qry.FieldValues['location_name'];
      InvArr[IntCount][6]:=Qry.FieldValues['deskripsi_ringkas'];
      if Not(VarIsNull(Qry.FieldValues['tanggal_perolehan'])) then
        InvArr[IntCount][7]:=FormatDateTime('yyyy-mm-dd',Qry.FieldValues['tanggal_perolehan'])
      else InvArr[IntCount][7]:='';
      if Not(VarIsNull(Qry.FieldValues['tanggal_valuta'])) then
        InvArr[IntCount][8]:=FormatDateTime('yyyy-mm-dd',Qry.FieldValues['tanggal_valuta'])
      else InvArr[IntCount][8]:='';
      InvArr[IntCount][9]:=VarToStr(Qry.FieldValues['kode_label_inventaris']);
      InvArr[IntCount][10]:=VarToStr(Qry.FieldValues['nilai_perolehan']);
      InvArr[IntCount][11]:=VarToStr(Qry.FieldValues['usia_pemakaian']);
      InvArr[IntCount][12]:=VarToStr(Qry.FieldValues['jenis_id']);
      InvArr[IntCount][13]:=VarToStr(Qry.FieldValues['jenis_nama']);
      InvArr[IntCount][14]:=VarToStr(Qry.FieldValues['subjenis_id']);
      InvArr[IntCount][15]:=VarToStr(Qry.FieldValues['subjenis_nama']);
      InvArr[IntCount][16]:=VarToStr(Qry.FieldValues['department_id']);
      InvArr[IntCount][17]:=VarToStr(Qry.FieldValues['department_nama']);
      InvArr[IntCount][18]:=VarToStr(Qry.FieldValues['merk_id']);
      InvArr[IntCount][19]:=VarToStr(Qry.FieldValues['merk_nama']);
      InvArr[IntCount][20]:=VarToStr(Qry.FieldValues['type_id']);
      if Trim(VarToStr(Qry.FieldValues['type_nama']))<>'' then
        InvArr[IntCount][21]:=VarToStr(Qry.FieldValues['type_kode'])+' - '+VarToStr(Qry.FieldValues['type_nama'])
      else
        InvArr[IntCount][21]:=VarToStr(Qry.FieldValues['type_kode']);
      InvArr[IntCount][22]:=VarToStr(Qry.FieldValues['sandi_bi_id']);
      InvArr[IntCount][23]:=VarToStr(Qry.FieldValues['sandibi_kode'])+' - '+VarToStr(Qry.FieldValues['sandibi_nama']);
      InvArr[IntCount][24]:=VarToStr(Qry.FieldValues['serial_number']);
      InvArr[IntCount][25]:=VarToStr(Qry.FieldValues['memory_id']);
      InvArr[IntCount][26]:=VarToStr(Qry.FieldValues['memory_nama']);
      InvArr[IntCount][27]:=VarToStr(Qry.FieldValues['storage_id']);
      InvArr[IntCount][28]:=VarToStr(Qry.FieldValues['storage_nama']);
      InvArr[IntCount][29]:=VarToStr(Qry.FieldValues['user_id']);
      InvArr[IntCount][30]:=VarToStr(Qry.FieldValues['user_nama']);
      if Qry.FieldValues['status_aktif']=1 then InvArr[IntCount][31]:='Aktif'
      else InvArr[IntCount][31]:='Non Aktif';
      InvArr[IntCount][32]:=VarToStr(Qry.FieldValues['keterangan']);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TInventarisList.RefreshList;
var IntCount,IntCount2:Integer;
begin
  if Length(InvArr)>0 then StrGrid.RowCount:=Length(InvArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount2:=0 to 9 do StrGrid.Cells[IntCount2,1]:='';
  end;
  for IntCount:=0 to Length(InvArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=InvArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=InvArr[IntCount][9];
    StrGrid.Cells[3,IntCount+1]:=InvArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=InvArr[IntCount][13];
    StrGrid.Cells[5,IntCount+1]:=InvArr[IntCount][6];
    StrGrid.Cells[6,IntCount+1]:=InvArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=InvArr[IntCount][19];
    StrGrid.Cells[8,IntCount+1]:=InvArr[IntCount][21];
    StrGrid.Cells[9,IntCount+1]:=InvArr[IntCount][31];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[9,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TInventarisList.RefreshFilterCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    FilterCabang.Items.Clear;
    FilterCabang.Items.Add('(Semua Cabang)');
    StrQry:='EXEC GetCompanyLocationList 0,0,'+QuotedStr(User)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(FilterCabangArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      FilterCabangArr[IntCount][0]:=Qry.FieldValues['company_id'];
      FilterCabangArr[IntCount][1]:=Qry.FieldValues['location_id'];
      FilterCabang.Items.Add(Qry.FieldValues['location_code']+' - '+Qry.FieldValues['location']);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    FilterCabang.ItemIndex:=0;

    FilterJenis.Items.Clear;
    FilterJenis.Items.Add('(Semua Jenis)');
    StrQry:='SELECT * FROM wh_inv_jenis WHERE status=1 ORDER BY nama;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(FilterJenisArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      FilterJenisArr[IntCount][0]:=Qry.FieldValues['jenis_id'];
      FilterJenis.Items.Add(Qry.FieldValues['nama']);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    FilterJenis.ItemIndex:=0;

    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TInventarisList.FilterChange(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TInventarisList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  RefreshFilterCombo;
  LoadData;
  RefreshList;
end;

procedure TInventarisList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TInventarisList.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TInventarisList.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(InvArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
        if (StrPos(PChar(UpperCase(InvArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=InvArr[Count][0];
        StrGrid.Cells[2,Count2]:=InvArr[Count][9];
        StrGrid.Cells[3,Count2]:=InvArr[Count][2];
        StrGrid.Cells[4,Count2]:=InvArr[Count][13];
        StrGrid.Cells[5,Count2]:=InvArr[Count][6];
        StrGrid.Cells[6,Count2]:=InvArr[Count][5];
        StrGrid.Cells[7,Count2]:=InvArr[Count][19];
        StrGrid.Cells[8,Count2]:=InvArr[Count][21];
        StrGrid.Cells[9,Count2]:=InvArr[Count][31];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TInventarisList.add_newClick(Sender: TObject);
begin
  if Main.IsFormOpen('InventarisForm')=False then
    InventarisForm:=TInventarisForm.Create(Self)
  else
    MessageBox(0,'Tutup form Data Aset Inventaris terlebih dahulu','Daftar Inventaris',MB_OK or MB_ICONERROR);
end;

procedure TInventarisList.EditClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if Main.IsFormOpen('InventarisForm')=False then
      InventarisForm:=TInventarisForm.Create(Self,InvArr[IntRow-1][0])
    else
      MessageBox(0,'Tutup form Data Aset Inventaris terlebih dahulu','Daftar Inventaris',MB_OK or MB_ICONERROR);
  end;
end;

procedure TInventarisList.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('Aset '+StrGrid.Cells[1,IntRow]+' mau dihapus?'),'Daftar Inventaris',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inventaris SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE inventaris_id='+QuotedStr(InvArr[IntRow-1][0])+';';
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
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil dihapus','Daftar Inventaris',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Daftar Inventaris',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      FreeAndNil(Qry);
      if IsOk then begin
        LoadData;
        RefreshList;
      end;
    end;
  end;
end;

procedure TInventarisList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TInventarisList.CetakLabelClick(Sender: TObject);
var StrWhereExtra:String;
begin
  StrWhereExtra:='';
  if FilterCabang.ItemIndex>0 then
    StrWhereExtra:=StrWhereExtra+' AND company_id='+FilterCabangArr[FilterCabang.ItemIndex-1][0]+
                   ' AND location_id='+FilterCabangArr[FilterCabang.ItemIndex-1][1];
  if FilterJenis.ItemIndex>0 then
    StrWhereExtra:=StrWhereExtra+' AND jenis_id='+FilterJenisArr[FilterJenis.ItemIndex-1][0];
  if Trim(Cari.Text)<>'' then
    StrWhereExtra:=StrWhereExtra+' AND (inventaris_id LIKE '+QuotedStr('%'+Trim(Cari.Text)+'%')+
                   ' OR deskripsi_ringkas LIKE '+QuotedStr('%'+Trim(Cari.Text)+'%')+')';
  InventarisLabelRpt:=TInventarisLabelRpt.Create(Self);
  InventarisLabelRpt.CetakLabelBatch(StrWhereExtra);
  FreeAndNil(InventarisLabelRpt);
end;

procedure TInventarisList.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

end.
