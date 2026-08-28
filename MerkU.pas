unit MerkU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TMerk = class(TForm)
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
  Merk: TMerk;
  MrkArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TMerk.SelesaiClick(Sender: TObject);
begin
  Merk.Close;
end;

procedure TMerk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMerk.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=250;
  StrGrid.ColWidths[2]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Status';

  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
end;

procedure TMerk.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_merk WHERE status=1 ORDER BY nama;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MrkArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MrkArr[IntCount][0]:=Qry.FieldValues['merk_id'];
      MrkArr[IntCount][1]:=Qry.FieldValues['nama'];
      if Qry.FieldValues['status']=1 then MrkArr[IntCount][2]:='Active'
      else MrkArr[IntCount][2]:='Non Active';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TMerk.RefreshList;
var IntCount:Integer;
begin
  if Length(MrkArr)>0 then StrGrid.RowCount:=Length(MrkArr)+1
  else begin
    StrGrid.RowCount:=2;
    StrGrid.Cells[0,1]:='';
    StrGrid.Cells[1,1]:='';
    StrGrid.Cells[2,1]:='';
  end;
  for IntCount:=0 to Length(MrkArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=MrkArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=MrkArr[IntCount][2];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TMerk.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
  PanelInput.Visible:=False;
end;

procedure TMerk.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMerk.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TMerk.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(MrkArr)-1 do begin
      IsTrue:=False;
      for Count3:=1 to 2 do
        if (StrPos(PChar(UpperCase(MrkArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=MrkArr[Count][1];
        StrGrid.Cells[2,Count2]:=MrkArr[Count][2];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMerk.add_newClick(Sender: TObject);
begin
  StrEditId:='';
  Nama.Text:='';
  Active.Checked:=True;
  PanelInput.Visible:=True;
  Nama.SetFocus;
end;

procedure TMerk.EditClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEditId:=MrkArr[IntRow-1][0];
    Nama.Text:=MrkArr[IntRow-1][1];
    Active.Checked:=(MrkArr[IntRow-1][2]='Active');
    PanelInput.Visible:=True;
    Nama.SetFocus;
  end;
end;

procedure TMerk.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('Merk '+StrGrid.Cells[1,IntRow]+' mau dihapus?'),'Merk',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inv_merk SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE merk_id='+MrkArr[IntRow-1][0]+';';
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
          MessageBox(0,'Berhasil dihapus','Merk',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Merk',MB_OK or MB_ICONERROR);
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

procedure TMerk.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMerk.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TMerk.BatalClick(Sender: TObject);
begin
  Nama.Text:='';
  Active.Checked:=False;
  PanelInput.Visible:=False;
end;

procedure TMerk.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive:String;
    IsOk,IsExist:Boolean;
begin
  if (Trim(Nama.Text)<>'') then begin
    IsOk:=True;
    IsExist:=False;
    StrEMsg:='';
    if Active.Checked then StrActive:='1' else StrActive:='0';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      if StrEditId='' then begin
        StrQry:='SELECT * FROM wh_inv_merk WHERE nama='+QuotedStr(Trim(Nama.Text))+' AND status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IsExist:=True;
        Qry.Close;
        if Not(IsExist) then
          StrQry:='INSERT INTO wh_inv_merk (nama,status,create_date,create_user,update_time,update_user) VALUES ('+
                  QuotedStr(Trim(Nama.Text))+','+StrActive+
                  ',GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
      end else begin
        StrQry:='UPDATE wh_inv_merk SET nama='+QuotedStr(Trim(Nama.Text))+
                ',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE merk_id='+StrEditId+';';
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
        MessageBox(0,'Nama sudah ada, silahkan pakai nama lain','Merk',MB_OK or MB_ICONWARNING);
      end else if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Merk',MB_OK or MB_ICONINFORMATION);
        PanelInput.Visible:=False;
        LoadData;
        RefreshList;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Merk',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    FreeAndNil(Qry);
  end else
    MessageBox(0,'Silahkan lengkapi Nama','Merk',MB_OK or MB_ICONWARNING);
end;

end.
