unit ChangePassU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, MD5, ADODB;

type
  TChangePass = class(TForm)
    Ganti: TButton;
    Batal: TButton;
    OldPass: TMaskEdit;
    NewPass: TMaskEdit;
    ConfPass: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure GantiClick(Sender: TObject);
    procedure OldPassKeyPress(Sender: TObject; var Key: Char);
    procedure NewPassKeyPress(Sender: TObject; var Key: Char);
    procedure ConfPassKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePass: TChangePass;

implementation

{$R *.dfm}

uses MainU;

procedure TChangePass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TChangePass.BatalClick(Sender: TObject);
begin
  ChangePass.Close;
end;

procedure TChangePass.GantiClick(Sender: TObject);
var
  Pass,QStr:String;
  Query:TADOQuery;
begin
  if (Trim(OldPass.Text)<>'') and (Trim(NewPass.Text)<>'') then begin
    if NewPass.Text=ConfPass.Text then begin
      Main.M_Busy;
      Query:=TADOQuery.Create(Self);
      Query.Connection:=Main.MyConnection;
      Pass:=OldPass.Text;
      if Main.OpenDb then begin
        Query.SQL.Clear;
        QStr:='SELECT username,name FROM wh_user WHERE UPPER(username)='+Chr(39)+UpperCase(User)+CHR(39)+' AND password ='+Chr(39)+MD5Print(MD5String(Pass))+Chr(39)+' AND active=1;';
        Query.SQL.Add(QStr);
        Query.Open;
        if Query.RecordCount=1 then begin
          QStr:='UPDATE wh_user SET password='+Chr(39)+MD5Print(MD5String(NewPass.Text))+Chr(39)+' WHERE UPPER(username)='+Chr(39)+UpperCase(User)+Chr(39)+';';
          Query.SQL.Add(QStr);
          Query.ExecSQL();
          MessageBox(0,'Ganti Password Berhasil'+Chr(13)+'Silahkan Login Kembali','Ganti Password Sukses',MB_OK or MB_ICONINFORMATION);
          Main.LogOut;
          ChangePass.Close;
        end else begin
          MessageBox(0,'Password Lama Salah','Password Gagal',MB_OK or MB_ICONERROR);
          NewPass.SetFocus;
        end;
        Query.Close;
        Main.CloseDb;
      end;
      Main.M_Normal;
    end else begin
      MessageBox(0,'Password Baru dan Konfirmasi Tidak sama','Ganti Password Gagal',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TChangePass.OldPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then NewPass.SetFocus;
end;

procedure TChangePass.NewPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ConfPass.SetFocus;
end;

procedure TChangePass.ConfPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Ganti.Click;
end;

end.
