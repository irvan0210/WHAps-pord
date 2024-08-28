unit SplashScreenU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TSplashScreen = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(var Params:TCreateParams);Override;

  end;

var
  SplashScreen: TSplashScreen;

implementation

{$R *.dfm}

procedure TSplashScreen.CreateParams(var Params:TCreateParams);
begin
  inherited;
  Params.style := Params.style and not WS_POPUPWINDOW and WS_EX_TRANSPARENT ;
end;

procedure TSplashScreen.FormShow(Sender: TObject);
begin
  SendToBack;
end;

end.
