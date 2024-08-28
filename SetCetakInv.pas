unit SetCetakInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFsetcetakinv = class(TForm)
    lbl1: TLabel;
    edtheight: TEdit;
    btn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsetcetakinv: TFsetcetakinv;

implementation

uses
  MainU;

{$R *.dfm}

procedure TFsetcetakinv.btn1Click(Sender: TObject);
begin
//  SetHeightInv:=edtheight.Text;
end;

end.
