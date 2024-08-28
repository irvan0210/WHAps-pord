unit VehicleImageU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, WHUnit;

type
  TVehicleImage = class(TForm)
    GroupFoto: TGroupBox;
    VhcImage: TImage;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VhcImageDblClick(Sender: TObject);
  private
    { Private declarations }
    VehicleId:String;
    ViewSide:Integer;
    IsReadonly:Boolean;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Vehicle_Id:String;View_Side:Integer;IsRead_Only:Boolean=False);Overload;
  end;

var
  VehicleImage: TVehicleImage;

implementation

uses MainU, ADODB, DB;

{$R *.dfm}

constructor TVehicleImage.Create(AOwner:TComponent;Vehicle_Id:String;View_Side:Integer;IsRead_Only:Boolean=False);
begin
  VehicleId:=Vehicle_Id;
  ViewSide:=View_Side;
  IsReadonly:=IsRead_Only;
  Main.WriteLog('Form Open: VehicleImage='+Vehicle_Id+','+IntToStr(View_Side)+','+BoolToStr(IsRead_Only),1);
  inherited Create(AOwner);
end;

procedure TVehicleImage.Init;
begin
  case ViewSide of
    1:begin
        GroupFoto.Caption:='Blueprint Dalam';
        VhcImage.Width:=265;
        VhcImage.Height:=505;
      end;
    2,3:begin
        if ViewSide=2 then GroupFoto.Caption:='Blueprint Kanan';
        if ViewSide=3 then GroupFoto.Caption:='Blueprint Kiri';
        VhcImage.Width:=529;
        VhcImage.Height:=157;
      end;
    4,5:begin
        if ViewSide=4 then GroupFoto.Caption:='Blueprint Depan';
        if ViewSide=5 then GroupFoto.Caption:='Blueprint Belakang';
        VhcImage.Width:=137;
        VhcImage.Height:=177;
      end;
  end;
end;

procedure TVehicleImage.LoadData;
var StmImage:TMemoryStream;
    JPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT name FROM wh_vhc_type_detail_image_type WHERE vhc_type_detail_image_type_id='+QuotedStr(VehicleId)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      GroupFoto.Caption:=GroupFoto.Caption+' '+Qry.FieldValues['name'];
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_type_detail_image WHERE (vhc_type_detail_image_type_id='+QuotedStr(VehicleId)+') AND (vhc_image_type_id='+IntToStr(ViewSide)+') ORDER BY vhc_type_detail_image_id DESC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        VhcImage.Picture.Assign(JPG);
        VhcImage.Stretch:=True;
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

procedure TVehicleImage.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleImage.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  if IsReadonly then GroupFoto.Enabled:=False;
end;

procedure TVehicleImage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleImage.VhcImageDblClick(Sender: TObject);
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
    VhcImage.Picture:=nil;
    VhcImage.Stretch:=True;
    VhcImage.Center:=True;
    ImgJPG.LoadFromFile(StrPath);
    StmImage:=TMemoryStream.Create;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    try
      VhcImage.Picture.Assign(ImgJPG);
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    if Main.OpenDb then begin
      ImgJPG.SaveToStream(StmImage);
      StmImage.Position:=0;
      StrQry:='SELECT Top 1 * FROM wh_vhc_type_detail_image ORDER BY update_time DESC;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Qry.Append;
      TBlobField(Qry.FieldByName('vhc_type_detail_image_type_id')).Value:=VehicleId;
      TBlobField(Qry.FieldByName('vhc_image_type_id')).Value:=IntToStr(ViewSide);
      TBlobField(Qry.FieldByName('vhc_image')).LoadFromStream(StmImage);
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
