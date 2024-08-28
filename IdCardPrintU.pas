unit IdCardPrintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TIdCardPrint = class(TForm)
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QImageReguler: TQRImage;
    QImageExecutive: TQRImage;
    QFoto: TQRImage;
    QNama: TQRLabel;
    QBarcode: TQRLabel;
    QNoKPP: TQRLabel;
    QPool: TQRLabel;
    QExpired: TQRLabel;
    QPoolManager: TQRLabel;
    Cetak: TButton;
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nama: TEdit;
    NoKPP: TEdit;
    TglBerakhir: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IdCardPrint: TIdCardPrint;

implementation

{$R *.dfm}

end.
