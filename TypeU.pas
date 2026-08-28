unit TypeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TTypeMdl = class(TForm)
    Panel1: TPanel;
    delete: TBitBtn;
    add_new: TBitBtn;
    Selesai: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Cari: TEdit;
    btn_cari: TSpeedButton;
    StrGrid: TZColorStringGrid;
    Edit: TBitBtn;
    PanelInput: TPanel;
    Label2: TLabel;
    Nama: TEdit;
    Active: TCheckBox;
    Label4: TLabel;
    Batal: TButton;
    Simpan: TButton;
    Merk: TComboBox;
    Label3: TLabel;
    Kode: TEdit;
    Label5: TLabel;
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
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    StrEditId:String;
    procedure RefreshMerkCombo;
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  TypeForm: TTypeMdl;
  TypArr:Array of TArrString7;
  MerkArr:Array of TArrString2;
  IntRow:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TTypeMdl.SelesaiClick(Sender: TObject);
begin
  TypeForm.Close;
end;

procedure TTypeMdl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTypeMdl.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=130;
  StrGrid.ColWidths[4]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Merk';
  StrGrid.Cells[2,0]:='Kode';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Status';

  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
end;

procedure TTypeMdl.RefreshMerkCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Merk.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_merk WHERE status=1 ORDER BY nama;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MerkArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MerkArr[IntCount][0]:=Qry.FieldValues['merk_id'];
      MerkArr[IntCount][1]:=Qry.FieldValues['nama'];
      Merk.Items.Add(Qry.FieldValues['nama']);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TTypeMdl.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.*,b.nama AS merk_nama FROM wh_inv_type a '+
            'LEFT JOIN wh_inv_merk b ON b.merk_id=a.merk_id '+
            'WHERE a.status=1 ORDER BY b.nama,a.kode;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(TypArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      TypArr[IntCount][0]:=Qry.FieldValues['type_id'];
      TypArr[IntCount][1]:=Qry.FieldValues['merk_id'];
      TypArr[IntCount][2]:=Qry.FieldValues['merk_nama'];
      TypArr[IntCount][3]:=Qry.FieldValues['kode'];
      TypArr[IntCount][4]:=Qry.FieldValues['nama'];
      if Qry.FieldValues['status']=1 then TypArr[IntCount][5]:='Active'
      else TypArr[IntCount][5]:='Non Active';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TTypeMdl.RefreshList;
var IntCount:Integer;
begin
  if Length(TypArr)>0 then StrGrid.RowCount:=Length(TypArr)+1
  else begin
    StrGrid.RowCount:=2;
    StrGrid.Cells[0,1]:='';
    StrGrid.Cells[1,1]:='';
    StrGrid.Cells[2,1]:='';
    StrGrid.Cells[3,1]:='';
    StrGrid.Cells[4,1]:='';
  end;
  for IntCount:=0 to Length(TypArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=TypArr[IntCount][2];
    StrGrid.Cells[2,IntCount+1]:=TypArr[IntCount][3];
    StrGrid.Cells[3,IntCount+1]:=TypArr[IntCount][4];
    StrGrid.Cells[4,IntCount+1]:=TypArr[IntCount][5];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TTypeMdl.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  RefreshMerkCombo;
  LoadData;
  RefreshList;
  PanelInput.Visible:=False;
end;

procedure TTypeMdl.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TTypeMdl.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TTypeMdl.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(TypArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 5 do
        if (StrPos(PChar(UpperCase(TypArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=TypArr[Count][2];
        StrGrid.Cells[2,Count2]:=TypArr[Count][3];
        StrGrid.Cells[3,Count2]:=TypArr[Count][4];
        StrGrid.Cells[4,Count2]:=TypArr[Count][5];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TTypeMdl.add_newClick(Sender: TObject);
begin
  StrEditId:='';
  Merk.ItemIndex:=-1;
  Kode.Text:='';
  Nama.Text:='';
  Active.Checked:=True;
  PanelInput.Visible:=True;
  Merk.SetFocus;
end;

procedure TTypeMdl.EditClick(Sender: TObject);
var IntCount:Integer;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEditId:=TypArr[IntRow-1][0];
    Merk.ItemIndex:=-1;
    for IntCount:=0 to Length(MerkArr)-1 do
      if MerkArr[IntCount][0]=TypArr[IntRow-1][1] then Merk.ItemIndex:=IntCount;
    Kode.Text:=TypArr[IntRow-1][3];
    Nama.Text:=TypArr[IntRow-1][4];
    Active.Checked:=(TypArr[IntRow-1][5]='Active');
    PanelInput.Visible:=True;
    Kode.SetFocus;
  end;
end;

procedure TTypeMdl.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('Type '+StrGrid.Cells[2,IntRow]+' mau dihapus?'),'Type / Model',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inv_type SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE type_id='+TypArr[IntRow-1][0]+';';
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
          MessageBox(0,'Berhasil dihapus','Type / Model',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Type / Model',MB_OK or MB_ICONERROR);
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

procedure TTypeMdl.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TTypeMdl.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TTypeMdl.BatalClick(Sender: TObject);
begin
  Merk.ItemIndex:=-1;
  Kode.Text:='';
  Nama.Text:='';
  Active.Checked:=False;
  PanelInput.Visible:=False;
end;

procedure TTypeMdl.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive,StrMerkId,StrNama:String;
    IsOk,IsExist:Boolean;
begin
  if (Merk.ItemIndex<>-1) and (Trim(Kode.Text)<>'') then begin
    IsOk:=True;
    IsExist:=False;
    StrEMsg:='';
    StrMerkId:=MerkArr[Merk.ItemIndex][0];
    if Active.Checked then StrActive:='1' else StrActive:='0';
    if Trim(Nama.Text)='' then StrNama:='NULL' else StrNama:=QuotedStr(Trim(Nama.Text));
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      if StrEditId='' then begin
        StrQry:='SELECT * FROM wh_inv_type WHERE merk_id='+StrMerkId+' AND kode='+QuotedStr(Trim(Kode.Text))+' AND status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IsExist:=True;
        Qry.Close;
        if Not(IsExist) then
          StrQry:='INSERT INTO wh_inv_type (merk_id,kode,nama,status,create_date,create_user,update_time,update_user) VALUES ('+
                  StrMerkId+','+QuotedStr(Trim(Kode.Text))+','+StrNama+','+StrActive+
                  ',GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
      end else begin
        StrQry:='UPDATE wh_inv_type SET merk_id='+StrMerkId+',kode='+QuotedStr(Trim(Kode.Text))+',nama='+StrNama+
                ',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE type_id='+StrEditId+';';
      end;
      if Not(IsExist) then begin
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
      if IsExist then begin
        Main.TransRollback;
        MessageBox(0,'Kode sudah ada untuk Merk ini, silahkan pakai kode lain','Type / Model',MB_OK or MB_ICONWARNING);
      end else if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Type / Model',MB_OK or MB_ICONINFORMATION);
        PanelInput.Visible:=False;
        LoadData;
        RefreshList;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Type / Model',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    FreeAndNil(Qry);
  end else
    MessageBox(0,'Silahkan lengkapi Merk dan Kode','Type / Model',MB_OK or MB_ICONWARNING);
end;

end.
