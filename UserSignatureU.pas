unit UserSignatureU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, WHUnit;

type
  TUserSignature = class(TForm)
    GroupFoto: TGroupBox;
    Signature: TImage;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SignatureDblClick(Sender: TObject);
  private
    { Private declarations }
    UserId:String;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;User_Id:String);Overload;
  end;

var
  UserSignature: TUserSignature;

implementation

uses MainU, ADODB, DB;

{$R *.dfm}

constructor TUserSignature.Create(AOwner:TComponent;User_Id:String);
begin
  UserId:=User_Id;
  inherited Create(AOwner);
end;

procedure TUserSignature.LoadData;
var StmImage:TMemoryStream;
    JPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_signature WHERE (user_id='+QuotedStr(UserId)+') AND (company_id='+CompanyId+') ORDER BY user_signature_id DESC;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('signature')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        Signature.Picture.Assign(JPG);
        Signature.Stretch:=True;
        Signature.Center:=True; 
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TUserSignature.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TUserSignature.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TUserSignature.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUserSignature.SignatureDblClick(Sender: TObject);
var StmImage:TMemoryStream;
    ImgJPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    StrPath:String;
begin
  StrPath:=GetImgFile;
  Main.M_Busy;
  if Trim(StrPath)<>'' then begin
    ImgJPG:=TJPEGImage.Create;
    Signature.Picture:=nil;
    Signature.Stretch:=True;
    Signature.Center:=True;
    ImgJPG.LoadFromFile(StrPath);
    StmImage:=TMemoryStream.Create;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    try
      Signature.Picture.Assign(ImgJPG);
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    if Main.OpenDb then begin
      ImgJPG.SaveToStream(StmImage);
      StmImage.Position:=0;
      StrQry:='SELECT Top 1 * FROM wh_user_signature ORDER BY update_time DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Qry.Append;
      TBlobField(Qry.FieldByName('user_id')).Value:=UserId;
      TBlobField(Qry.FieldByName('company_id')).Value:=CompanyId;
      TBlobField(Qry.FieldByName('signature')).LoadFromStream(StmImage);
      TBlobField(Qry.FieldByName('update_user')).Value:=User;
      Qry.Post;
    end;
    Qry.Close;
    FreeAndNil(Qry);
    Main.CloseDb;
    FreeAndNil(ImgJPG);
    FreeAndNil(StmImage);
  end;
  Main.M_Normal;
end;

end.
