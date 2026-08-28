unit SubJenisU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TSubJenis = class(TForm)
    Panel1: TPanel;
    delete: TBitBtn;
    add_new: TBitBtn;
    Selesai: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Edit: TBitBtn;
    PanelInput: TPanel;
    Label2: TLabel;
    Nama: TEdit;
    Active: TCheckBox;
    Label4: TLabel;
    Batal: TButton;
    Simpan: TButton;
    Jenis: TComboBox;
    Label3: TLabel;
    btn_cari: TSpeedButton;
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
    procedure RefreshJenisCombo;
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  SubJenis: TSubJenis;
  SJArr:Array of TArrString5;
  JenisArr:Array of TArrString2;
  IntRow:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TSubJenis.SelesaiClick(Sender: TObject);
begin
  SubJenis.Close;
end;

procedure TSubJenis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSubJenis.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Jenis';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Status';

  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
end;

procedure TSubJenis.RefreshJenisCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Jenis.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_jenis WHERE status=1 ORDER BY nama;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(JenisArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      JenisArr[IntCount][0]:=Qry.FieldValues['jenis_id'];
      JenisArr[IntCount][1]:=Qry.FieldValues['nama'];
      Jenis.Items.Add(Qry.FieldValues['nama']);
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TSubJenis.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.*,b.nama AS jenis_nama FROM wh_inv_subjenis a '+
            'LEFT JOIN wh_inv_jenis b ON b.jenis_id=a.jenis_id '+
            'WHERE a.status=1 ORDER BY b.nama,a.nama;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SJArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SJArr[IntCount][0]:=Qry.FieldValues['subjenis_id'];
      SJArr[IntCount][1]:=Qry.FieldValues['jenis_id'];
      SJArr[IntCount][2]:=Qry.FieldValues['jenis_nama'];
      SJArr[IntCount][3]:=Qry.FieldValues['nama'];
      if Qry.FieldValues['status']=1 then SJArr[IntCount][4]:='Active'
      else SJArr[IntCount][4]:='Non Active';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TSubJenis.RefreshList;
var IntCount:Integer;
begin
  if Length(SJArr)>0 then StrGrid.RowCount:=Length(SJArr)+1
  else begin
    StrGrid.RowCount:=2;
    StrGrid.Cells[0,1]:='';
    StrGrid.Cells[1,1]:='';
    StrGrid.Cells[2,1]:='';
    StrGrid.Cells[3,1]:='';
  end;
  for IntCount:=0 to Length(SJArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=SJArr[IntCount][2];
    StrGrid.Cells[2,IntCount+1]:=SJArr[IntCount][3];
    StrGrid.Cells[3,IntCount+1]:=SJArr[IntCount][4];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TSubJenis.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  RefreshJenisCombo;
  LoadData;
  RefreshList;
  PanelInput.Visible:=False;
end;

procedure TSubJenis.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSubJenis.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TSubJenis.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 4 do
        if (StrPos(PChar(UpperCase(SJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=SJArr[Count][2];
        StrGrid.Cells[2,Count2]:=SJArr[Count][3];
        StrGrid.Cells[3,Count2]:=SJArr[Count][4];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TSubJenis.add_newClick(Sender: TObject);
begin
  StrEditId:='';
  Jenis.ItemIndex:=-1;
  Nama.Text:='';
  Active.Checked:=True;
  PanelInput.Visible:=True;
  Jenis.SetFocus;
end;

procedure TSubJenis.EditClick(Sender: TObject);
var IntCount:Integer;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEditId:=SJArr[IntRow-1][0];
    Jenis.ItemIndex:=-1;
    for IntCount:=0 to Length(JenisArr)-1 do
      if JenisArr[IntCount][0]=SJArr[IntRow-1][1] then Jenis.ItemIndex:=IntCount;
    Nama.Text:=SJArr[IntRow-1][3];
    Active.Checked:=(SJArr[IntRow-1][4]='Active');
    PanelInput.Visible:=True;
    Nama.SetFocus;
  end;
end;

procedure TSubJenis.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('SubJenis '+StrGrid.Cells[2,IntRow]+' mau dihapus?'),'Group SubJenis Inventaris',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inv_subjenis SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE subjenis_id='+SJArr[IntRow-1][0]+';';
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
          MessageBox(0,'Berhasil dihapus','Group SubJenis Inventaris',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Group SubJenis Inventaris',MB_OK or MB_ICONERROR);
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

procedure TSubJenis.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TSubJenis.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TSubJenis.BatalClick(Sender: TObject);
begin
  Jenis.ItemIndex:=-1;
  Nama.Text:='';
  Active.Checked:=False;
  PanelInput.Visible:=False;
end;

procedure TSubJenis.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive,StrJenisId:String;
    IsOk,IsExist:Boolean;
begin
  if (Jenis.ItemIndex<>-1) and (Trim(Nama.Text)<>'') then begin
    IsOk:=True;
    IsExist:=False;
    StrEMsg:='';
    StrJenisId:=JenisArr[Jenis.ItemIndex][0];
    if Active.Checked then StrActive:='1' else StrActive:='0';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      if StrEditId='' then begin
        StrQry:='SELECT * FROM wh_inv_subjenis WHERE jenis_id='+StrJenisId+' AND nama='+QuotedStr(Trim(Nama.Text))+' AND status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IsExist:=True;
        Qry.Close;
        if Not(IsExist) then
          StrQry:='INSERT INTO wh_inv_subjenis (jenis_id,nama,status,create_date,create_user,update_time,update_user) VALUES ('+
                  StrJenisId+','+QuotedStr(Trim(Nama.Text))+','+StrActive+
                  ',GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
      end else begin
        StrQry:='UPDATE wh_inv_subjenis SET jenis_id='+StrJenisId+',nama='+QuotedStr(Trim(Nama.Text))+
                ',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE subjenis_id='+StrEditId+';';
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
        MessageBox(0,'Nama sudah ada untuk Jenis ini, silahkan pakai nama lain','Group SubJenis Inventaris',MB_OK or MB_ICONWARNING);
      end else if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Group SubJenis Inventaris',MB_OK or MB_ICONINFORMATION);
        PanelInput.Visible:=False;
        LoadData;
        RefreshList;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Group SubJenis Inventaris',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    FreeAndNil(Qry);
  end else
    MessageBox(0,'Silahkan lengkapi Jenis dan Nama','Group SubJenis Inventaris',MB_OK or MB_ICONWARNING);
end;

end.
