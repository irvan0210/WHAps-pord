unit COAAddU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB;

type
  TCOAAdd = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    Label1: TLabel;
    Label2: TLabel;
    coa: TEdit;
    Nama: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure coaKeyPress(Sender: TObject; var Key: Char);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;COA_Id:String);Overload;
  end;

var
  COAAdd: TCOAAdd;
  COAId:String;

implementation

uses MainU, COAListU;

{$R *.dfm}

constructor TCOAAdd.Create(AOwner:TComponent;COA_Id:String);
begin
  COAId:=COA_Id;
  Inherited Create(AOwner);
end;

procedure TCOAAdd.Init;
begin
  coa.Text:='';
  Nama.Text:='';
end;

procedure TCOAAdd.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCOAList ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount> 0 then while not (Qry.Eof) do begin
      if Qry.FieldValues['coa_id']=COAId then begin
        coa.Text:=Qry.FieldValues['coa_id'];
        Nama.Text:=Qry.FieldValues['name'];
      end;
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
end;

procedure TCOAAdd.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCOAAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCOAAdd.FormShow(Sender: TObject);
begin
  Init;
  if COAId<>'' then RefreshData;
end;

procedure TCOAAdd.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrException,StrMsg:String;
    IsOk:Boolean;
    Info:Cardinal;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;
    if COAId='' then begin
      StrQry:='INSERT INTO wh_coa (coa_id,name,update_user) VALUES ('+QuotedStr(Trim(coa.Text))+
              ','+QuotedStr(Trim(Nama.Text))+','+QuotedStr(User)+');';
    end else begin
      StrQry:='UPDATE wh_coa set coa_id='+QuotedStr(Trim(coa.Text))+',name='
              +QuotedStr(Trim(Nama.Text))+',update_time=GETDATE(),update_user='
              +QuotedStr(User)+' WHERE coa_id='+QuotedStr(COAId)+';';
    end;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
      on E:Exception do begin
        IsOk:=False;
        StrException:=E.Message;
      end;
    end;
    if IsOk then begin
      StrMsg:='Berhasil di simpan';
      Main.TransCommit;
      Info:=MB_OK or MB_ICONINFORMATION;
      Init;
      coa.SetFocus;
    end else begin
      StrMsg:='Gagal Menyimpan'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg;
      Main.TransRollback;
      Info:=MB_OK or MB_ICONWARNING;
    end;
    if Main.IsFormOpen('COAList')=True then COAList.Refresh;
    MessageBox(0,PChar(StrMsg),'Tambah/Ubah C.O.A',Info);
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;

end;

procedure TCOAAdd.coaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Nama.SetFocus;
  if Key = #27 then Close;
end;

procedure TCOAAdd.NamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
