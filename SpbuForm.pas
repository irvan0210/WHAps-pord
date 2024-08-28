unit SpbuForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormSPBU = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    SPBU: TEdit;
    Alamat: TMemo;
    pnl2: TPanel;
    btnSelesai: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
//    CompanyArr:Array of TArrString7;
    Initiation:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  FormSPBU: TFormSPBU;

implementation

{$R *.dfm}

constructor TFormSPBU.Create(AOwner:TComponent);
begin
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TFormSPBU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormSPBU.FormShow(Sender: TObject);
begin
  SPBU.Text:='';
  Alamat.Text:='';
end;

end.                   
