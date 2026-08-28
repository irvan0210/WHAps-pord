unit MemoryU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TMemory = class(TForm)
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
    Memory: TEdit;
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
  MemoryForm: TMemory;
  MemArr:Array of TArrString4;
  IntRow:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TMemory.SelesaiClick(Sender: TObject);
begin
  MemoryForm.Close;
end;

procedure TMemory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMemory.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=250;
  StrGrid.ColWidths[2]:=70;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Memory';
  StrGrid.Cells[2,0]:='Status';

  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
end;

procedure TMemory.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_inv_memory WHERE status=1 ORDER BY memory;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MemArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MemArr[IntCount][0]:=Qry.FieldValues['memory_id'];
      MemArr[IntCount][1]:=Qry.FieldValues['memory'];
      if Qry.FieldValues['status']=1 then MemArr[IntCount][2]:='Active'
      else MemArr[IntCount][2]:='Non Active';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
end;

procedure TMemory.RefreshList;
var IntCount:Integer;
begin
  if Length(MemArr)>0 then StrGrid.RowCount:=Length(MemArr)+1
  else begin
    StrGrid.RowCount:=2;
    StrGrid.Cells[0,1]:='';
    StrGrid.Cells[1,1]:='';
    StrGrid.Cells[2,1]:='';
  end;
  for IntCount:=0 to Length(MemArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=MemArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=MemArr[IntCount][2];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TMemory.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
  PanelInput.Visible:=False;
end;

procedure TMemory.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMemory.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then
    EditClick(Sender);
end;

procedure TMemory.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    StrGrid.RowCount:=2;
    Count2:=1;
    for Count:=0 to Length(MemArr)-1 do begin
      IsTrue:=False;
      for Count3:=1 to 2 do
        if (StrPos(PChar(UpperCase(MemArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=IntToStr(Count2);
        StrGrid.Cells[1,Count2]:=MemArr[Count][1];
        StrGrid.Cells[2,Count2]:=MemArr[Count][2];
        Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMemory.add_newClick(Sender: TObject);
begin
  StrEditId:='';
  Memory.Text:='';
  Active.Checked:=True;
  PanelInput.Visible:=True;
  Memory.SetFocus;
end;

procedure TMemory.EditClick(Sender: TObject);
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEditId:=MemArr[IntRow-1][0];
    Memory.Text:=MemArr[IntRow-1][1];
    Active.Checked:=(MemArr[IntRow-1][2]='Active');
    PanelInput.Visible:=True;
    Memory.SetFocus;
  end;
end;

procedure TMemory.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (IntRow>0) and (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    if MessageBox(0,PChar('Memory '+StrGrid.Cells[1,IntRow]+' mau dihapus?'),'Memory',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
      IsOk:=True;
      StrEMsg:='';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_inv_memory SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE memory_id='+MemArr[IntRow-1][0]+';';
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
          MessageBox(0,'Berhasil dihapus','Memory',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Gagal menghapus'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Memory',MB_OK or MB_ICONERROR);
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

procedure TMemory.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMemory.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TMemory.BatalClick(Sender: TObject);
begin
  Memory.Text:='';
  Active.Checked:=False;
  PanelInput.Visible:=False;
end;

procedure TMemory.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrActive:String;
    IsOk,IsExist:Boolean;
begin
  if (Trim(Memory.Text)<>'') then begin
    IsOk:=True;
    IsExist:=False;
    StrEMsg:='';
    if Active.Checked then StrActive:='1' else StrActive:='0';
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      if StrEditId='' then begin
        StrQry:='SELECT * FROM wh_inv_memory WHERE memory='+QuotedStr(Trim(Memory.Text))+' AND status=1;';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then IsExist:=True;
        Qry.Close;
        if Not(IsExist) then
          StrQry:='INSERT INTO wh_inv_memory (memory,status,create_date,create_user,update_time,update_user) VALUES ('+
                  QuotedStr(Trim(Memory.Text))+','+StrActive+
                  ',GETDATE(),'+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+');';
      end else begin
        StrQry:='UPDATE wh_inv_memory SET memory='+QuotedStr(Trim(Memory.Text))+
                ',status='+StrActive+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE memory_id='+StrEditId+';';
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
        MessageBox(0,'Memory sudah ada, silahkan pakai yang lain','Memory',MB_OK or MB_ICONWARNING);
      end else if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil disimpan','Memory',MB_OK or MB_ICONINFORMATION);
        PanelInput.Visible:=False;
        LoadData;
        RefreshList;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal menyimpan'+Chr(13)+Chr(13)+'Kesalahan: '+StrEMsg),'Memory',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
    FreeAndNil(Qry);
  end else
    MessageBox(0,'Silahkan lengkapi Memory','Memory',MB_OK or MB_ICONWARNING);
end;

end.
