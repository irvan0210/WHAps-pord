unit BudgetViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid;

type
  TBudgetView = class(TForm)
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BudgetView: TBudgetView;

implementation

{$R *.dfm}

procedure TBudgetView.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBudgetView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
