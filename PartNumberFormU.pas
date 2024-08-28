unit PartNumberFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPartNumberForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    PartNumberId: TEdit;
    PartDescription: TComboBox;
    Description: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    Label4: TLabel;
    Scale: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Init;
    procedure RefreshCombo;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  PartNumberForm: TPartNumberForm;

implementation

{$R *.dfm}

procedure TPartNumberForm.Init;
begin
  PartNumberId.Text:='';
  PartDescription.Text:='';
  PartDescription.Items.Clear;
  PartDescription.ItemIndex:=-1;
  Description.Text:='';
end;

procedure TPartNumberForm.RefreshCombo;
begin

end;

procedure TPartNumberForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartNumberForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
