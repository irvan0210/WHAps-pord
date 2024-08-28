unit ApplicationU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TApplication = class(TForm)
    Tutup: TButton;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Application: TApplication;

implementation

{$R *.dfm}

procedure TApplication.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TApplication.TutupClick(Sender: TObject);
begin
  Apps.Close;
end;

end.
