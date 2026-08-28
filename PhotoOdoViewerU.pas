unit PhotoOdoViewerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UrlMon, Math;

type
  TPhotoOdoViewer = class(TForm)
    ScrollBox1: TScrollBox;
    Gambar: TImage;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    StrPhotoUrl:String;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Photo_Url:String);overload;
  end;

var
  PhotoOdoViewer: TPhotoOdoViewer;

implementation

{$R *.dfm}

constructor TPhotoOdoViewer.Create(AOwner:TComponent;Photo_Url:String);
begin
  StrPhotoUrl:=Photo_Url;
  Inherited Create(AOwner);
end;

procedure TPhotoOdoViewer.LoadData;
var
  StrTempFolder,StrTempWebp,StrTempBmp,StrDwebpExe,StrCmd:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  DblScale:Double;
begin
  if Trim(StrPhotoUrl)='' then begin
    ShowMessage('Foto belum tersedia');
    Exit;
  end;

  StrTempFolder:=ExtractFilePath(Application.ExeName)+'Temp\';
  ForceDirectories(StrTempFolder);
  StrTempWebp:=StrTempFolder+'odo_'+FormatDateTime('yyyymmddhhnnsszzz',Now)+'.webp';
  StrTempBmp:=ChangeFileExt(StrTempWebp,'.bmp');

  if URLDownloadToFile(nil,PChar(StrPhotoUrl),PChar(StrTempWebp),0,nil)<>0 then begin
    ShowMessage('Gagal mengambil foto dari server');
    Exit;
  end;

  StrDwebpExe:=ExtractFilePath(Application.ExeName)+'libwebp\bin\dwebp.exe';
  if not FileExists(StrDwebpExe) then begin
    ShowMessage('dwebp.exe tidak ditemukan di: '+StrDwebpExe);
    Exit;
  end;

  StrCmd:='"'+StrDwebpExe+'" "'+StrTempWebp+'" -bmp -o "'+StrTempBmp+'"';

  FillChar(StartupInfo,SizeOf(StartupInfo),0);
  StartupInfo.cb:=SizeOf(StartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=SW_HIDE;
  FillChar(ProcessInfo,SizeOf(ProcessInfo),0);

  if CreateProcess(nil,PChar(StrCmd),nil,nil,False,0,nil,nil,StartupInfo,ProcessInfo) then begin
    WaitForSingleObject(ProcessInfo.hProcess,10000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end else begin
    ShowMessage('Gagal menjalankan dwebp.exe');
    Exit;
  end;

  if FileExists(StrTempBmp) then begin
    Gambar.AutoSize:=False;
    Gambar.Picture.Bitmap.LoadFromFile(StrTempBmp);
    DblScale:=Min(1, Min(ScrollBox1.ClientWidth/Gambar.Picture.Width, ScrollBox1.ClientHeight/Gambar.Picture.Height));
    Gambar.Width:=Round(Gambar.Picture.Width*DblScale);
    Gambar.Height:=Round(Gambar.Picture.Height*DblScale);
    Gambar.Stretch:=True;
  end else
    ShowMessage('Gagal decode foto (format WebP tidak dikenali)');

  if FileExists(StrTempWebp) then DeleteFile(StrTempWebp);
  if FileExists(StrTempBmp) then DeleteFile(StrTempBmp);
end;

procedure TPhotoOdoViewer.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TPhotoOdoViewer.SelesaiClick(Sender: TObject);
begin
  PhotoOdoViewer.Close;
end;

procedure TPhotoOdoViewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
