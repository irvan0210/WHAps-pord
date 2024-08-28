unit KPPPrintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, QRCtrls, Jpeg, QuickRpt, ExtCtrls, ADODB, DB, ppCtrls,
  ppParameter, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv,
  ppProd, ppReport;

type
  TKPPPrint = class(TForm)
    QRKPP: TQuickRep;
    QRBand1: TQRBand;
    QImageExecutive: TQRImage;
    QFoto: TQRImage;
    QKNama: TQRLabel;
    QPool: TQRLabel;
    QExpired: TQRLabel;
    QPoolManager: TQRLabel;
    Cetak: TButton;
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Nama: TEdit;
    NoKPP: TEdit;
    QKNoKPP: TQRLabel;
    Label3: TLabel;
    TglBerakhir: TEdit;
    QBarcode: TQRLabel;
    QImageReguler: TQRImage;
    GroupBox2: TGroupBox;
    KPPPrinted: TRadioButton;
    IdCardPrinted: TRadioButton;
    QRIdCard: TQuickRep;
    QRBand2: TQRBand;
    QRImageFront: TQRImage;
    QIFoto: TQRImage;
    QINama: TQRLabel;
    QINoKPP: TQRLabel;
    QRImageBack: TQRImage;
    QRShape1: TQRShape;
    QIDept: TQRLabel;
    QLogo: TQRImage;
    ImageBackPortrait: TImage;
    Flip: TCheckBox;
    ImageFPortraitExec: TImage;
    ImageFPortraitReg: TImage;
    ImageFLandscape: TImage;
    ImageBackLandscape: TImage;
    QImageName: TQRImage;
    QImageNoKPP: TQRImage;
    QImageDept: TQRImage;
    Image1: TImage;
    QRImage1: TQRImage;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CetakClick(Sender: TObject);
    procedure IdCardPrintedClick(Sender: TObject);
    procedure KPPPrintedClick(Sender: TObject);
  private
    { Private declarations }
    EmplType:Integer;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    EmplId:String;
    constructor Create(AOwner:TComponent;EmployeeId:String);Overload;
  end;

var
  KPPPrint: TKPPPrint;
  Bulan:Array [0..11] of  String;

implementation

uses MainU, WHUnit;

{$R *.dfm}

constructor TKPPPrint.Create(AOwner:TComponent;EmployeeId:String);
begin
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;


procedure TKPPPrint.Init;
begin
  Flip.Enabled:=False;
  if CompanyId<>'3' then KPPPrinted.Visible:=False;
  if KPPPrinted.Visible=True then KPPPrinted.Checked:=True
  else IdCardPrinted.Checked:=True;
  NoKPP.Text:='';
  Nama.Text:='';
  QImageName.Visible:=False;
  QImageNoKPP.Visible:=False;
  QImageDept.Visible:=False;
  Bulan[0]:='Januari';
  Bulan[1]:='Februari';
  Bulan[2]:='Maret';
  Bulan[3]:='April';
  Bulan[4]:='Mei';
  Bulan[5]:='Juni';
  Bulan[6]:='Juli';
  Bulan[7]:='Agustus';
  Bulan[8]:='September';
  Bulan[9]:='Oktober';
  Bulan[10]:='November';
  Bulan[11]:='Desember';
  QImageReguler.SendToBack;
  QLogo.SendToBack;
end;

procedure TKPPPrint.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+QuotedStr(EmplId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Nama.Text:=Qry.FieldValues['name'];
      NoKPP.Text:=Qry.FieldValues['employee_id'];
      if Qry.FieldValues['kpp_expired_month']<>NULL then
        TglBerakhir.Text:=Bulan[StrToInt(Qry.FieldValues['kpp_expired_month'])-1]+' '+Qry.FieldValues['kpp_expired_year'];
      EmplType:=Qry.FieldValues['employment_type_id'];
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Main.M_Normal;
end;

procedure TKPPPrint.SelesaiClick(Sender: TObject);
begin
  KPPPrint.Close;
end;

procedure TKPPPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TKPPPrint.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
end;

procedure TKPPPrint.CetakClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
    Images:TBitmap;
    ROut,RIn:TRect;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if KPPPrinted.Checked=True then begin
      QKNama.Caption:=Nama.Text;
      QKNoKPP.Caption:=NoKPP.Text;
      StrQry:='EXEC GetEmployeeDetail '+QuotedStr(EmplId)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QPool.Caption:=Qry.FieldValues['location'];
        TglBerakhir.Text:=Bulan[StrToInt(Qry.FieldValues['kpp_expired_month'])-1]+' '+Qry.FieldValues['kpp_expired_year'];
        QExpired.Caption:=Bulan[StrToInt(Qry.FieldValues['kpp_expired_month'])-1]+' '+Qry.FieldValues['kpp_expired_year'];
        QBarcode.Caption:='*'+NoKPP.Text+'*';
        if Qry.FieldValues['reguler']=1 then begin
          QImageExecutive.SendToBack;
        end else begin
          QImageReguler.SendToBack;
        end;
      end;
      Qry.Close;
      StrQry:='EXEC GetLocationHead '+LocationId+','+CompanyId+',17;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QPoolManager.Caption:=Qry.FieldValues['name'];
      end;
      Qry.Close;
      StrQry:='SELECT a.empl_image_id,a.image,a.employee_id FROM wh_empl_image a WHERE empl_image_id='+
              '(SELECT MAX(empl_image_id) FROM wh_empl_image  '+
              ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=1);';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_image_id']<>NULL then begin
        try
          StmImage:=TMemoryStream.Create;
          TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
          if StmImage.Size > 0 then begin
            JPG:=TJPEGImage.Create;
            StmImage.Position := 0;
            JPG.LoadFromStream(StmImage);
            QFoto.Picture.Assign(JPG);
            QFoto.Stretch:=True;
          end;
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
      end;
      Qry.Close;
    end;
    if IdCardPrinted.Checked=True then begin
      Images:=TBitmap.Create;
      Images.Assign(ImageBackPortrait.Picture.Graphic);
      QRImageBack.Picture.Graphic:=FlipReverseScanLine(Images,False,Flip.Checked);
      Images.free;
      QINama.Caption:=Nama.Text;
      QINoKPP.Caption:=NoKPP.Text;
      Case EmplType of
        1:begin
          QIDept.Caption:='Mitra';
          StrQry:='EXEC GetEmployeeDetail '+QuotedStr(EmplId)+';';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            TglBerakhir.Text:=Bulan[StrToInt(Qry.FieldValues['kpp_expired_month'])-1]+' '+Qry.FieldValues['kpp_expired_year'];
            Images:=TBitmap.Create;
            if Qry.FieldValues['reguler']=1 then begin
              Images.Assign(ImageFPortraitReg.Picture.Graphic);
            end else begin
              Images.Assign(ImageFPortraitExec.Picture.Graphic);
            end;
            QRImageFront.Picture.Graphic:=FlipReverseScanLine(Images,False,Flip.Checked);
            Images.free;
          end;
          Qry.Close;
        end;
        2:begin
            QIDept.Caption:='Driver';
            StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.RecordCount>0 then begin
              case Qry.FieldValues['logo'] of
                1:QLogo.Picture:=Main.LogoWH.Picture;
                2:QLogo.Picture:=Main.LogoWHDC.Picture;
                3:QLogo.Picture:=Main.LogoWHET.Picture;
                4:QLogo.Picture:=Main.LogoDT.Picture;
                5:QLogo.Picture:=Main.LogoEUR.Picture;
                6:QLogo.Picture:=Main.LogoGL.Picture;
                7:QLogo.Picture:=Main.LogoCNR.Picture;
                8:QLogo.Picture:=Main.logoDTN.Picture;
              end;
              QLogo.BringToFront;
            end;
            Qry.Close;
          end;
        3:begin
          Images:=TBitmap.Create;
          Images.Assign(ImageBackLandscape.Picture.Graphic);
          RotateImage(Images,-90,True,clWhite);
          QRImageBack.Picture.Graphic:=FlipReverseScanLine(Images,False,Flip.Checked);
          Images.Assign(ImageFLandscape.Picture.Graphic);
          RotateImage(Images,-90,True,clWhite);
          QRImageFront.Picture.Graphic:=FlipReverseScanLine(Images,False,Flip.Checked);
          Images.Free;
          end;
        4:QIDept.Caption:='BusBoy';
      end;
      StrQry:='SELECT a.empl_image_id,a.image,a.employee_id FROM wh_empl_image a WHERE empl_image_id='+
              '(SELECT MAX(empl_image_id) FROM wh_empl_image  '+
              ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=1);';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_image_id']<>NULL then begin
        try
          StmImage:=TMemoryStream.Create;
          TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
          if StmImage.Size > 0 then begin
            JPG:=TJPEGImage.Create;
            StmImage.Position := 0;
            JPG.LoadFromStream(StmImage);
            Images:=TBitmap.Create;
            Images.Assign(JPG);
            Images:=FlipReverseScanLine(Images,False,Flip.Checked);
            JPG.Assign(Images);
            Images.Free;
            Case EmplType of
              1:begin
                  QIFoto.Picture.Assign(JPG);
                  QIFoto.Stretch:=True;
                end;
              2:begin
                  QIFoto.Picture.Assign(JPG);
                  QIFoto.Stretch:=True;
                end;
              4:begin
                  QIFoto.Picture.Assign(JPG);
                  QIFoto.Stretch:=True;
                end;
            end;
          end;
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
      end;
      Qry.Close;
      if Flip.Checked=True then begin
        Mirror(QINama.Caption,Image1,QINama.Font,QImageName.Height,QImageName.Width);
        QImageName.Picture.Graphic:=Image1.Picture.Graphic;
        QRImage1.Picture.Graphic:=Image1.Picture.Graphic;
//        Image1.Picture.Assign(nil);
//        Mirror(QINoKPP.Caption,Image1,QINoKPP.Font,QINoKPP.Height,QINoKPP.Width);
//        QImageNoKPP.Picture.Graphic:=Image1.Picture.Graphic;
{        MemoTemp.Lines.Clear;
        MemoTemp.Lines.Add(QINoKPP.Caption);
        MemoTemp.Font.Name:=QINoKPP.Font.Name;
        MemoTemp.Font.Size:=QINoKPP.Font.Size;
        MemoTemp.Font.Style:=QINoKPP.Font.Style;
        Image1.Canvas.Font.Name:=MemoTemp.Font.Name;
        Image1.Canvas.Font.Size:=MemoTemp.Font.Size;
        Image1.Canvas.Font.Style:=MemoTemp.Font.Style;
        Mirror(MemoTemp,Image1,PixelsPerInch);
        QImageNoKPP.Picture.Bitmap:=Image1.Picture.Bitmap;

}        QINama.Caption:='';
        QINoKPP.Caption:='';
        QIDept.Caption:='';
        Image1.Free;
      end;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if KPPPrinted.Checked=True then begin
    QRKPP.Prepare;
    QRKPP.Preview;
  end;
  if IdCardPrinted.Checked=True then begin
    QRIdCard.Prepare;
    QRIdCard.Preview;
  end;
  Main.M_Normal;
end;



procedure TKPPPrint.IdCardPrintedClick(Sender: TObject);
begin
  if IdCardPrinted.Checked=True then Flip.Enabled:=True else Flip.Enabled:=False;
end;

procedure TKPPPrint.KPPPrintedClick(Sender: TObject);
begin
  if IdCardPrinted.Checked=False then Flip.Enabled:=False;
end;

end.
