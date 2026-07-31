unit MemoListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB, frxpngimage, ExtCtrls, Buttons,
  ZColorStringGrid;

type
  TMemoList = class(TForm)
    Panel1: TPanel;
    delete: TBitBtn;
    add_new: TBitBtn;
    preview: TBitBtn;
    Selesai: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Cari: TEdit;
    Image1: TImage;
    StaticText1: TStaticText;
    btn_cari: TSpeedButton;
    StrGrid: TZColorStringGrid;
    Edit: TBitBtn;
    Label5: TLabel;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure add_newClick(Sender: TObject);
    procedure previewClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure btn_cariClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
    procedure CekOtorisasi;
  end;

var
  MemoList: TMemoList;
  MemoArr:Array of TArrString10;
  IntRow:Integer;

implementation

uses MainU, MenuFormU, StrUtils, MemoFormU, PreviewDocumentU;

{$R *.dfm}

procedure TMemoList.SelesaiClick(Sender: TObject);
begin
  MemoList.Close;
end;

procedure TMemoList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMemoList.Init;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=300;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=450;
  StrGrid.ColWidths[8]:=120;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nomor Dokumen';
  StrGrid.Cells[2,0]:='Nomor Memo';
  StrGrid.Cells[3,0]:='Customer';
  StrGrid.Cells[4,0]:='Judul';
  StrGrid.Cells[5,0]:='Tanggal Effektif';
  StrGrid.Cells[6,0]:='Tanggal Berahir';
  StrGrid.Cells[7,0]:='Deskripsi';
  StrGrid.Cells[8,0]:='Tanggal Upload';

  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  StrGrid.Cells[6,1]:='';
  StrGrid.Cells[7,1]:='';
  StrGrid.Cells[8,1]:='';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
end;

procedure TMemoList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetDocument '+CompanyId+';';

    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(MemoArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      MemoArr[IntCount][0]:=Qry.FieldValues['doc_id'];
      MemoArr[IntCount][1]:=Qry.FieldValues['doc_number'];
      MemoArr[IntCount][2]:=Qry.FieldValues['name'];
      MemoArr[IntCount][3]:=Qry.FieldValues['doc_title'];
      MemoArr[IntCount][4]:=Qry.FieldValues['effective_date'];
      MemoArr[IntCount][5]:=Qry.FieldValues['expired_date'];
      MemoArr[IntCount][6]:=Qry.FieldValues['description'];
      if Qry.FieldValues['status']=1then  MemoArr[IntCount][7]:='Aktif'
      else MemoArr[IntCount][7]:='Tidak Aktif';
      MemoArr[IntCount][8]:=Qry.FieldValues['create_date'];
      //MenuArr[IntCount][4]:=Qry.FieldValues['effective_date'];
      //if Qry.FieldValues['menu_id'] then MenuArr[IntCount][3]:='Active' else MenuArr[IntCount][3]:='Disable';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TMemoList.RefreshList;
var
IntCount, IntCount2:Integer;
begin
  {if Length(MemoArr)>0 then StrGrid.RowCount:=Length(MemoArr)+1;
  for IntCount:=0 to Length(MemoArr)-1 do begin
    for IntCount2:=0 to 5 do StrGrid.Cells[IntCount2,IntCount+1]:=MemoArr[IntCount][IntCount2];
  end;}
  if Length(MemoArr)>0 then StrGrid.RowCount:=Length(MemoArr)+1;
  for IntCount:=0 to Length(MemoArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=MemoArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=MemoArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=MemoArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=MemoArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=MemoArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=MemoArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=MemoArr[IntCount][6];
    StrGrid.Cells[8,IntCount+1]:=MemoArr[IntCount][8];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[8,IntCount+1].HorizontalAlignment:=taCenter;

    if MemoArr[IntCount][7]='Tidak Aktif' then
    begin
     for IntCount2:=0 to StrGrid.ColCount-1 do
     StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clRed;
    end;

  end;
end;

procedure TMemoList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  CekOtorisasi;
  LoadData;
  RefreshList;
end;

procedure TMemoList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TMemoList.StrGridDblClick(Sender: TObject);
begin
 { if (RightStr(IntToStr(TreeTag),2)='04') then MenuForm:=TMenuForm.Create(Self,StrGrid.Cells[0,IntRow],True)
  else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
  else MenuForm:=TMenuForm.Create(Self,StrGrid.Cells[0,IntRow]);}
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if Main.IsFormOpen('MemoForm')=False then MemoForm:=TMemoForm.Create(Self, StrGrid.Cells[1,IntRow],True);
  end;
end;

procedure TMemoList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(MemoArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(MemoArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[0,Count2-1]:=IntToStr(Count+1);;
          StrGrid.Cells[1,Count2-1]:=MemoArr[Count][0];
          StrGrid.Cells[2,Count2-1]:=MemoArr[Count][1];
          StrGrid.Cells[3,Count2-1]:=MemoArr[Count][2];
          StrGrid.Cells[4,Count2-1]:=MemoArr[Count][3];
          StrGrid.Cells[5,Count2-1]:=MemoArr[Count][4];
          StrGrid.Cells[6,Count2-1]:=MemoArr[Count][5];
          StrGrid.Cells[7,Count2-1]:=MemoArr[Count][6];
         { for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2-1]:=MemoArr[Count][Count4]; }
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TMemoList.add_newClick(Sender: TObject);
begin
  MemoForm:=TMemoForm.Create(Self,'');
end;

procedure TMemoList.previewClick(Sender: TObject);
var
  StrAID : String;
begin
  StrAID := StrGrid.Cells[1,IntRow];
  PreviewDocument:=TPreviewDocument.Create(Self);
  PreviewDocument.LoadData(StrAID);
end;

procedure TMemoList.EditClick(Sender: TObject);
var
  StrAID : String;
begin
  StrAID := StrGrid.Cells[1,IntRow];
 // MemoForm:=TMemoForm.Create(Self);
 // MemoForm.LoadData;
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if Main.IsFormOpen('MemoForm')=False then MemoForm:=TMemoForm.Create(Self, StrGrid.Cells[1,IntRow]);
  end;
end;

procedure TMemoList.deleteClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
   // IntAID : Integer;
begin
  //IntAID := StrToInt(StrGrid.Cells[5,IntRow]);
  if (Trim(StrGrid.Cells[1,IntRow])<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Memo '+StrGrid.Cells[2,IntRow]+' Mau Dihapus ?') ,'Memo',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='UPDATE wh_document SET status = 0 WHERE doc_id = '+Chr(39)+StrGrid.Cells[1,IntRow]+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Memo','Memo',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Memo'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Memo',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;
end;

procedure TMemoList.CekOtorisasi;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select * from wh_user_auth_form '+
            'where form_id= ''190519'' and user_id='+QuotedStr(User)+' and active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0  then begin
      delete.Visible := True;
      Edit.Visible := True;
    end else begin
      delete.Visible := False;
      Edit.Visible := False;
    end;
    Qry.Close;

  end;
  Qry.Destroy;
  Main.CloseDb;
end;

procedure TMemoList.ToXCelClick(Sender: TObject);
begin
 if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMemoList.btn_cariClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

end.
