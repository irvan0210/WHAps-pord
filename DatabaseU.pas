unit DatabaseU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDatabase = class(TForm)
    Label1: TLabel;
    Username: TEdit;
    Label2: TLabel;
    Password: TEdit;
    Label3: TLabel;
    Simpan: TButton;
    Batal: TButton;
    Database: TEdit;
    Label4: TLabel;
    Server: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Database: TDatabase;

implementation

{$R *.dfm}

procedure TDatabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
