unit PartNumberListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPartNumberList = class(TForm)
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PartNumberList: TPartNumberList;

implementation

{$R *.dfm}

procedure TPartNumberList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

end.
