unit SpecialSettingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls;

type
  TSpecialSettings = class(TForm)
    Label6: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Simpan: TButton;
    Batal: TButton;
    LogLevels: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure LogLevelsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent);
  end;

var
  SpecialSettings: TSpecialSettings;

implementation

uses MainU, Registry;

{$R *.dfm}

constructor TSpecialSettings.Create(AOwner:TComponent);
begin
  Main.WriteLog('Form Open: SpecialSettings',1);
  inherited Create(AOwner);
end;

procedure TSpecialSettings.Init;
begin
  LogLevels.Text:=IntToStr(LogLevel);
end;

procedure TSpecialSettings.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TSpecialSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree; 
end;

procedure TSpecialSettings.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TSpecialSettings.SimpanClick(Sender: TObject);
var RegLogLevel:String;
    Regs:TRegistry;
    StrEMsg:String;
    IsOk:Boolean;
begin
  RegLogLevel:=LogLevels.Text;
  if (Trim(LogLevels.Text)<>'') then begin
    IsOk:=True;
    try
      Main.WriteLog('Registry Write: LogLevel='+RegLogLevel,1);
      Regs:=TRegistry.Create;
      Regs.RootKey:=HKEY_LOCAL_MACHINE;
      try
        if Regs.OpenKey(RegPath,True) then begin
          Regs.WriteString('LogLevel',RegLogLevel);
        end else IsOk:=False;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
    finally
      Regs.CloseKey;
      FreeAndNil(Regs)
    end;
    if IsOk then begin
      Main.WriteLog('Registry Save: Success',1);
      LogLevel:=StrToInt(LogLevels.Text);
    end else begin
      Main.WriteLog('Registry Save: Fail='+StrEMsg,1);
    end;
  end;
  Close;
end;

procedure TSpecialSettings.LogLevelsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9','-',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.Click;
end;

end.
