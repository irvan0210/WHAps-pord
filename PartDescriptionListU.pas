unit PartDescriptionListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPartDescriptionList = class(TForm)
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PartDescriptionList: TPartDescriptionList;

implementation

{$R *.dfm}

procedure TPartDescriptionList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartDescriptionList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
