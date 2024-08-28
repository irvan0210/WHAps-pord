unit Spbu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDataSPBU = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  DataSPBU: TDataSPBU;

implementation

{$R *.dfm}

constructor TDataSPBU.Create(AOwner:TComponent);
begin
//  Initiation:=True;
//  inherited Create(AOwner);
end;

procedure TDataSPBU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
