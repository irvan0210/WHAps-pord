unit InventarisLabelRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QRCtrls, QuickRpt, ExtCtrls, ADODB, WHUnit,
  DB;

type
  TInventarisLabelRpt = class(TForm)
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QBarcode: TQRDBText;
    QKode: TQRDBText;
    QBarcode2: TQRDBText;
    QKode2: TQRDBText;
    QBarcode3: TQRDBText;
    QKode3: TQRDBText;
    QryLabel: TADOQuery;
    QBarcode4: TQRDBText;
    QKode4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CetakLabelBatch(StrWhereExtra:String);
  end;

var
  InventarisLabelRpt: TInventarisLabelRpt;

implementation

uses MainU;

{$R *.dfm}

procedure TInventarisLabelRpt.CetakLabelBatch(StrWhereExtra:String);
var StrQry:String;
begin
  QryLabel.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    //Data disusun 4-4 per baris cetak (bukan pakai Page.Columns bawaan QuickReport,
    //karena itu selalu isi 1 kolom penuh ke bawah dulu baru pindah kolom -
    //di sini urutannya menyamping dulu: 1,2,3,4 lalu 5,6,7,8, dst).
    StrQry:=';WITH src AS ('+
            '  SELECT kode_label_inventaris, ROW_NUMBER() OVER (ORDER BY inventaris_id) AS rn '+
            '  FROM wh_inventaris '+
            '  WHERE status=1 AND kode_label_inventaris IS NOT NULL AND kode_label_inventaris<>'''' '+
            StrWhereExtra+
            ') '+
            'SELECT ((rn-1)/4)+1 AS group_row,'+
            '  MAX(CASE WHEN ((rn-1)%4)=0 THEN kode_label_inventaris END) AS kode_label,'+
            '  MAX(CASE WHEN ((rn-1)%4)=0 THEN '+QuotedStr('*')+'+kode_label_inventaris+'+QuotedStr('*')+' END) AS barcode_value,'+
            '  MAX(CASE WHEN ((rn-1)%4)=1 THEN kode_label_inventaris END) AS kode_label2,'+
            '  MAX(CASE WHEN ((rn-1)%4)=1 THEN '+QuotedStr('*')+'+kode_label_inventaris+'+QuotedStr('*')+' END) AS barcode_value2,'+
            '  MAX(CASE WHEN ((rn-1)%4)=2 THEN kode_label_inventaris END) AS kode_label3,'+
            '  MAX(CASE WHEN ((rn-1)%4)=2 THEN '+QuotedStr('*')+'+kode_label_inventaris+'+QuotedStr('*')+' END) AS barcode_value3,'+
            '  MAX(CASE WHEN ((rn-1)%4)=3 THEN kode_label_inventaris END) AS kode_label4,'+
            '  MAX(CASE WHEN ((rn-1)%4)=3 THEN '+QuotedStr('*')+'+kode_label_inventaris+'+QuotedStr('*')+' END) AS barcode_value4 '+
            'FROM src GROUP BY ((rn-1)/4)+1 ORDER BY group_row;';
    QryLabel.SQL.Clear;
    QryLabel.SQL.Add(StrQry);
    QryLabel.Open;
    if QryLabel.RecordCount>0 then begin
      QReport.Prepare;
      QReport.Preview;
    end else
      MessageBox(0,'Tidak ada aset dengan Kode Label Inventaris pada data yang sedang ditampilkan','Cetak Label',MB_OK or MB_ICONWARNING);
    QryLabel.Close;
    Main.CloseDb;
  end;
end;

end.
