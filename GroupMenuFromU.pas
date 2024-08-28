unit GroupMenuFromU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TGroupMenuForm = class(TForm)
    Simpan: TButton;
    Batal: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupMenuForm: TGroupMenuForm;

implementation

{$R *.dfm}

end.
