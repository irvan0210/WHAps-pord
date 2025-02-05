unit ImageViewerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, ADODB, WHUnit, Buttons, ppParameter,
  ppBands, ppReport, ppSubRpt, ppMemo, ppCtrls, ppStrtch, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd;

type
  TImageViewer = class(TForm)
    Selesai: TButton;
    Panel1: TPanel;
    Full: TRadioButton;
    Normal: TRadioButton;
    SimpanGambar: TSpeedButton;
    ScrollBox1: TScrollBox;
    Gambar: TImage;
    ppReportPrint: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand13: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppPhoto: TppImage;
    ppParameterList7: TppParameterList;
    Print: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FullClick(Sender: TObject);
    procedure NormalClick(Sender: TObject);
    procedure GambarDblClick(Sender: TObject);
    procedure SimpanGambarClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
  private
    { Private declarations }
    ImgType:Integer;
    TableId:String;
    ImageType:Integer;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Img_Type:Integer;Table_Id:String;Image_Type:Integer=0);Overload;
  end;

var
  ImageViewer: TImageViewer;

implementation

{$R *.dfm}

Uses DB, MainU;

constructor TImageViewer.Create(AOwner:TComponent;Img_Type:Integer;Table_Id:String;Image_Type:Integer=0);
begin
  ImgType:=Img_Type;
  TableId:=Table_Id;
  ImageType:=Image_Type;
  Inherited Create(AOwner);
end;

procedure TImageViewer.LoadData;
var ImgJPG:TJPEGImage;
    StmImg:TMemoryStream;
    Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    case ImageType of
      0:StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
                '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
                ' WHERE employee_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
      1:StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
                '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
                ' WHERE vehicle_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
      2:StrQry:='SELECT * FROM wh_service_request_image WHERE service_request_image_id='+
                '(SELECT MAX(service_request_image_id) FROM wh_service_request_image '+
                ' WHERE service_request_id='+QuotedStr(TableId)+' );';
      3:StrQry:='SELECT * FROM wh_empl_laka_image WHERE empl_laka_image_id='+
                '(SELECT MAX(empl_laka_image_id) FROM wh_empl_laka_image '+
                ' WHERE empl_history_laka_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+' );';
    end;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImg:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImg);
      if StmImg.Size > 0 then begin
        ImgJPG:=TJPEGImage.Create;
        StmImg.Position := 0;
        ImgJPG.LoadFromStream(StmImg);
        Gambar.Picture:=nil;
        Gambar.Picture.Assign(ImgJPG);
        Gambar.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  FreeAndNil(ImgJPG);
  FreeAndNil(StmImg);
  Main.CloseDb;
end;


procedure TImageViewer.Init;
begin
  Gambar.Picture:=nil;
  Full.Checked:=True;
end;

procedure TImageViewer.SelesaiClick(Sender: TObject);
begin
  ImageViewer.Close;
end;

procedure TImageViewer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TImageViewer.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
end;

procedure TImageViewer.FullClick(Sender: TObject);
begin
  if Full.Checked then begin
    Gambar.AutoSize:=True;
  end;
end;

procedure TImageViewer.NormalClick(Sender: TObject);
begin
  if Normal.Checked then begin
    Gambar.AutoSize:=False;
    Gambar.Height:=395;
    Gambar.Width:=410;
  end;
end;


procedure TImageViewer.GambarDblClick(Sender: TObject);
begin
  Gambar.Picture.LoadFromFile(GetImgFile);
end;

procedure TImageViewer.SimpanGambarClick(Sender: TObject);
var ImgJPG:TJPEGImage;
    StmImg:TMemoryStream;
    Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    case ImageType of
      0:StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
                '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
                ' WHERE employee_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
      1:StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
                '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
                ' WHERE vehicle_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
    end;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImg:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImg);
      if StmImg.Size > 0 then begin
        ImgJPG:=TJPEGImage.Create;
        StmImg.Position := 0;
        ImgJPG.LoadFromStream(StmImg);
        ImgJPG.SaveToFile(SaveToImage);
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  FreeAndNil(ImgJPG);
  FreeAndNil(StmImg);
  Main.CloseDb;
end;

procedure TImageViewer.PrintClick(Sender: TObject);
var ImgJPG:TJPEGImage;
    StmImg:TMemoryStream;
    Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    case ImageType of
      0:StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
                '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
                ' WHERE employee_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
      1:StrQry:='SELECT * FROM wh_vhc_image WHERE vhc_image_id='+
                '(SELECT MAX(vhc_image_id) FROM wh_vhc_image '+
                ' WHERE vehicle_id='+QuotedStr(TableId)+' AND image_id='+IntToStr(ImgType)+');';
    end;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImg:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImg);
      if StmImg.Size > 0 then begin
        ImgJPG:=TJPEGImage.Create;
        StmImg.Position := 0;
        ImgJPG.LoadFromStream(StmImg);
        if ImgJPG.Width>800 then begin
          
        end;
//        ppPhoto.Picture.Width:=Gambar.Width;
//        ppPhoto.Picture.Height:=Gambar.Height;
        ppPhoto.Picture.Assign(ImgJPG);
        ppReportPrint.Print;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  FreeAndNil(ImgJPG);
  FreeAndNil(StmImg);
  Main.CloseDb;
end;

end.
