unit AppsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ppParameter, ppBands, ppReport,
  ppSubRpt, ppMemo, ppCtrls, jpeg, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd;

type
  TApps = class(TForm)
    Tutup: TButton;
    Memo: TMemo;
    Sets: TPanel;
    HotkeyList: TMemo;
    AppHotKey: TApplicationEvents;
    Perubahan: TMemo;
    Sets2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TutupClick(Sender: TObject);
    procedure SetsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AppHotKeyShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    {
     Private declarations }
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Override;
  end;

var
  Apps: TApps;

implementation

uses MainU, SettingU, WHUnit;

{$R *.dfm}

constructor TApps.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: Apps='+GetFileVersion(ParamStr(0)),1);
  inherited Create(AOwner);
end;

procedure TApps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TApps.TutupClick(Sender: TObject);
begin
  Apps.Close;
end;

procedure TApps.SetsDblClick(Sender: TObject);
begin
  Setting:=TSetting.Create(Main);
  Close;
end;

procedure TApps.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TApps.Init;
begin
  Memo.Lines.Text:='Aplikasi White Horse Group'+Chr(13)+'Versi '+Main.AppVersion+Chr(13)+Chr(13)+Memo.Text+'Last Update:'+GetFileDate(ParamStr(0));
  
end;                                                                   

procedure TApps.AppHotKeyShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode=VK_ESCAPE then Close;
end;

end.
