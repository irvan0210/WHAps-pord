unit MateriTrainingFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit;

type
  TMateriTrainingForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Materi: TEdit;
    Label1: TLabel;
    Simpan: TButton;
    Selesai: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure MateriKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FormRequest:String;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String)Overload;
  end;

var
  MateriTrainingForm: TMateriTrainingForm;
  MateriTrainingIDFORM:String;

implementation

uses MainU, MateriTrainingListU;

{$R *.dfm}


constructor TMateriTrainingForm.Create(AOwner:TComponent;Form_Request:String);
begin
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TMateriTrainingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMateriTrainingForm.FormShow(Sender: TObject);
begin
  Materi.Text:='';
  Materi.SetFocus;
end;

procedure TMateriTrainingForm.SimpanClick(Sender: TObject);
var QStr,StrNum:String;
    Qry:TADOQuery;
    IsOk: Boolean;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  isOk:=True;
  if FormRequest='ADD-MATERITRAINING' then
  begin
    QStr:='INSERT INTO wh_materi_training (materi,update_user,status)'+
          ' VALUES ('+QuotedStr(Materi.Text) +','+Chr(39)+User+Chr(39)+',1);';
  end else begin
    QStr:='UPDATE wh_materi_training SET materi='+QuotedStr(Materi.Text) +' WHERE '+
          'materi_training_id='+MateriTrainingIDFORM+';'
  end;
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  try
    Qry.ExecSQL;
  except
    on E:Exception do begin
      IsOk:=False;
    end;
  end;
  if IsOk then begin
    MessageBox(0,'Penambahan/Perubahan Materi berhasil','Materi Training Form',MB_OK or MB_ICONINFORMATION);
    if Main.IsFormOpen('MateriTrainingList')=True then begin
      MateriTrainingList.RefreshData;
      MateriTrainingList.RefreshGrid;
    end;
  end else
    MessageBox(0,'Penambahan/Perubahan Materi Gagal','Materi Training Form',MB_OK or MB_ICONWARNING);
  Qry.Close;
  Main.MyConnection.Close;
  Close;
end;

procedure TMateriTrainingForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMateriTrainingForm.MateriKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key=#13 then begin
    SimpanClick(Sender);
 end;
end;

end.
