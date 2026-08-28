unit SandiBiU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TSandiBi = class(TForm)
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
    Kategori: TComboBox;
    Label3: TLabel;
    Label2: TLabel;
    Nama: TEdit;
    Active: TCheckBox;
    Label4: TLabel;
    Batal: TButton;
    Simpan: TButton;
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
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  SandiBi: TSandiBi;
  SBArr:Array of TArrString5;
  IntRow:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TSandiBi.SelesaiClick(Sender: TObject);
begin
  SandiBi.Close;
end;

procedure TSandiBi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSandiBi.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=50;
  StrGrid.ColWidths[2]:=60;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode';
  StrGrid.Cells[2,0]:='Kategori';
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

procedure TSandiBi.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_sandi_bi WHERE status=1 ORDER BY kode;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SBArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SBArr[IntCount][0]:=Qry.FieldValues['sandi_bi_id'];
      SBArr[IntCount][1]:=Qry.FieldValues['kode'];
      SBArr[IntCount][2]:=Qry.FieldValues['kategori'];
      SBArr[IntCount][3]:=Qry.FieldValues['nama'];
      if Qry.FieldValues['status']=1 then SBArr[IntCount][4]:='Active'
      else SBArr[IntCount][4]:='Non Active';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TSandiBi.RefreshList;
var IntCount:Integer;
begin
  if Length(SBArr)>0 then StrGrid.RowCount:=Length(SBArr)+1
  else begin
    StrGrid.RowCount:=2;
    StrGrid.Cells[0,1]:='';
    StrGrid.Cells[1,1]:='';
    StrGrid.Cells[2,1]:='';
    StrGrid.Cells[3,1]:='';
    StrGrid.Cells[4,1]:='';
  end;
  for IntCount:=0 to Length(SBArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=SBArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=SBArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=SBArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=SBArr[IntCount][4];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TSandiBi.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
  PanelInput.Visible:=False;
end;

procedure TSandiBi.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSandiBi.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TSandiBi.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(SBArr)-1 do begin
      IsTrue:=False;
      for Count3:=1 to 4 do
        if (StrPos(PChar(UpperCase(SBArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=SBArr[Count][1];
        StrGrid.Cells[2,Count2]:=SBArr[Count][2];
        StrGrid.Cells[3,Count2]:=SBArr[Count][3];
        StrGrid.Cells[4,Count2]:=SBArr[Count][4];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TSandiBi.add_newClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    IntNextKode:Integer;
begin
  StrEditId:='';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT MAX(CAST(kode AS INT)) AS max_kode FROM wh_inv_sandi_bi;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.FieldValues['max_kode']<>NULL then
      IntNextKode:=Qry.FieldValues['max_kode']+1
    else
      IntNextKode:=1;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Kode.Text:=Format('%.*d',[2,IntNextKode]);
  Kategori.ItemIndex:=-1;
  Nama.Text:='';
  Active.Checked:=True;
  Kode.Enabled:=False;
  PanelInput.Visible:=True;
  Kategori.SetFocus;
end;

procedure TSandiBi.EditClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEditId:=SBArr[IntRow-1][0];
    Kode.Text:=SBArr[IntRow-1][1];
    Kategori.ItemIndex:=Kategori.Items.IndexOf(SBArr[IntRow-1][2]);
    Nama.Text:=SBArr[IntRow-1][3];
    Active.Checked:=(SBArr[IntRow-1][4]='Active');
    Kode.Enabled:=False;
    PanelInput.Visible:=True;
    Nama.SetFocus;
  end;
end;

procedure TSandiBi.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('Sandi BI '+StrGrid.Cells[1,IntRow]+' - '+StrGrid.Cells[3,IntRow]+' mau dihapus?'),'Sandi BI',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inv_sandi_bi SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE sandi_bi_id='+SBArr[IntRow-1][0]+';';
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
          MessageBox(0,'Berhasil dihapus','Sandi BI',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Sandi BI',MB_OK or MB_ICONERROR);
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

procedure TSandiBi.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TSandiBi.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TSandiBi.BatalClick(Sender: TObject);
begin
  Kode.Text:='';
  Kategori.ItemIndex:=-1;
  Nama.Text:='';
  Active.Checked:=False;
  PanelInput.Visible:=False;
end;

procedure TSandiBi.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive:String;
    IsOk,IsExist:Boolean;
begin
  if (Trim(Kode.Text)<>'') and (Kategori.ItemIndex<>-1) and (Trim(Nama.Text)<>'') then begin
    IsOk:=True;
    IsExist:=False;
    StrEMsg:='';
    if Active.Checked then StrActive:='1' else StrActive:='0';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      if StrEditId='' then begin
        StrQry:='SELECT * FROM wh_inv_sandi_bi WHERE kode='+QuotedStr(Trim(Kode.Text))+' AND status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IsExist:=True;
        Qry.Close;
        if Not(IsExist) then
          StrQry:='INSERT INTO wh_inv_sandi_bi (kode,kategori,nama,status,create_date,create_user,update_time,update_user) VALUES ('+
                  QuotedStr(Trim(Kode.Text))+','+QuotedStr(Kategori.Text)+','+QuotedStr(Trim(Nama.Text))+','+StrActive+
                  ',GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
      end else begin
        StrQry:='UPDATE wh_inv_sandi_bi SET kategori='+QuotedStr(Kategori.Text)+',nama='+QuotedStr(Trim(Nama.Text))+
                ',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE sandi_bi_id='+StrEditId+';';
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
        MessageBox(0,'Kode sudah ada, silahkan pakai kode lain','Sandi BI',MB_OK or MB_ICONWARNING);
      end else if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Sandi BI',MB_OK or MB_ICONINFORMATION);
        PanelInput.Visible:=False;
        LoadData;
        RefreshList;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Sandi BI',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    FreeAndNil(Qry);
  end else
    MessageBox(0,'Silahkan lengkapi Kode, Kategori, dan Nama','Sandi BI',MB_OK or MB_ICONWARNING);
end;

end.
