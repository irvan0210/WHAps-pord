unit KoneksiDatabaseU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,IniFiles;

type
  TKoneksiDatabase = class(TForm)
    Cek: TButton;
    Simpan: TButton;
    Button2: TButton;
    Label1: TLabel;
    Host: TEdit;
    Database: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    Username: TEdit;
    Label3: TLabel;
    Password: TMaskEdit;
    Label5: TLabel;
    Provider: TEdit;
    Label6: TLabel;
    Name: TEdit;
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    //Function Encrypt(const Text, Key: string): string;
    //Function Decrypt(const Text, Key: string): string;
    Function IniPath: string;
  public
    { Public declarations }
  end;

var
  KoneksiDatabase: TKoneksiDatabase;

implementation

{$R *.dfm}

Function Encrypt(const Text, Key: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Text) do
    Result := Result +
      Chr(Ord(Text[i]) xor Ord(Key[(i - 1) mod Length(Key) + 1]));
end;

Function Decrypt(const Text, Key: string): string;
begin
  Result := Encrypt(Text, Key); // XOR reversible
end;

Function TKoneksiDatabase.IniPath: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'dbconfig.ini';
end;

procedure TKoneksiDatabase.SimpanClick(Sender: TObject);
var
  Ini: TIniFile;
  Section: string;
const
  ENC_KEY = 'DB-CONFIG-KEY';
begin
  if Trim(Name.Text) = '' then
  begin
    ShowMessage('Name wajib diisi');
    Exit;
  end;

  Section := Trim(Name.Text);

  Ini := TIniFile.Create(IniPath);
  try
    Ini.WriteString(Section, 'Provider', Provider.Text);
    Ini.WriteString(Section, 'Server', Host.Text);
    Ini.WriteString(Section, 'Database', Database.Text);
    Ini.WriteString(Section, 'User', Username.Text);
    Ini.WriteString(Section, 'Password', Encrypt(Password.Text, ENC_KEY));
    Ini.WriteString(Section, 'Provider', Provider.Text);
  finally
    Ini.Free;
  end;

  ShowMessage('Koneksi berhasil disimpan');
end;

end.
