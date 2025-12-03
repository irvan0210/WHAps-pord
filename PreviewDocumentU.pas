unit PreviewDocumentU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit, OleCtrls, SHDocVw,
  Types;

type
  TPreviewDocument = class(TForm)
    Selesai: TButton;
    PdfViewer: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   // procedure AskDelete(SubMenuId:String);
  public
    { Public declarations }
    procedure Init;
   // procedure LoadPdfFromBlob(const AFileName: string; const ABytes: TBytes);
    procedure LoadData(AID: Integer);
    procedure PreviewLocalPDF(AFile: string);
  //  procedure RefreshList;
  end;

var
  PreviewDocument: TPreviewDocument;
  SubMenuArr:Array of TArrString4;
  IntRow, AID:Integer;
  TempFile,FTempFile: string;

implementation

uses MainU, ADODB, StrUtils, SubMenuFormU, ComObj, DB;

{$R *.dfm}

procedure TPreviewDocument.Init;
begin

end;

procedure TPreviewDocument.LoadData(AID: Integer);
var
  MS: TMemoryStream;

  Qry:TADOQuery;
  StrQry:String;
begin
  MS := TMemoryStream.Create;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
   try
      Qry.Close;
      Qry.SQL.Text :='SELECT file_data FROM wh_document WHERE doc_id = :id';
      Qry.Parameters.ParamByName('id').Value := AID;
      Qry.Open;

      if not Qry.Eof then
      begin
        TempFile := GetEnvironmentVariable('TEMP') + '\preview.pdf';

       (Qry.FieldByName('file_data') as TBlobField).SaveToStream(MS);
        MS.SaveToFile(TempFile);

        PdfViewer.Navigate(TempFile);
      end
      else
        ShowMessage('PDF tidak ditemukan!');
    finally
      MS.Free;
    end;
   Main.CloseDb;
  end;
  Qry.Destroy;
end;

procedure TPreviewDocument.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // if Assigned(FileBytes) then
 // FileBytes.Free;

  if FileExists(TempFile) then
    DeleteFile(TempFile);
  Action:=caFree;
end;

procedure TPreviewDocument.SelesaiClick(Sender: TObject);
begin
  PreviewDocument.Close;
end;

procedure TPreviewDocument.FormShow(Sender: TObject);
begin
    if AID > 0 then
    LoadData(AID);
end;

procedure TPreviewDocument.PreviewLocalPDF(AFile: string);
begin
  FTempFile := AFile;
  PdfViewer.Navigate('file:///' + FTempFile);
end;

end.
