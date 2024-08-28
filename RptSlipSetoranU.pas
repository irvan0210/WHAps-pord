unit RptSlipSetoranU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ADODB, DB;

type
  TRptSlipSetoran = class(TForm)
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape3: TQRShape;
    QNoSlip: TQRLabel;
    QNoBody: TQRLabel;
    QNoKPP: TQRLabel;
    QMitra: TQRLabel;
    QNoPolisi: TQRLabel;
    QTanggal: TQRLabel;
    QJam: TQRLabel;
    QRit: TQRLabel;
    QDrop: TQRLabel;
    QDummy: TQRLabel;
    QArgoKotor: TQRLabel;
    QBBMRupiah: TQRLabel;
    QGasRupiah: TQRLabel;
    QArgoBersih: TQRLabel;
    QKomisi: TQRLabel;
    QBBMLiter: TQRLabel;
    QGasLiter: TQRLabel;
    QKomisiPersen: TQRLabel;
    QRLabel46: TQRLabel;
    QLocation: TQRLabel;
    QRBand2: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QTandaMitra: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTandaKasir: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QDisetorkan: TQRLabel;
    QKurangSetor: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QHutangMitra: TQRLabel;
    QRShape4: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QDetailBand: TQRBand;
    QRLabel44: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRBand3: TQRBand;
    QAmount: TQRDBText;
    QRLabel45: TQRLabel;
    QNama: TQRDBText;
    Qry: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
  end;

var
  RptSlipSetoran: TRptSlipSetoran;

implementation

{$R *.dfm}

Uses MainU,DepositFormU;

procedure TRptSlipSetoran.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TRptSlipSetoran.Init;
var QStr:String;
begin
  Main.MyConnection.Open;
  QStr:='SELECT a.*,b.name,b.details FROM wh_vhc_trans_detail AS a '+
        ' INNER JOIN wh_transaction_type AS b ON b.transaction_type_id=a.transaction_type_id '+
        ' WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+' AND ((b.transaction_obj_id=2) OR (b.transaction_obj_id=3));';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;

  Report.Prepare;
  Report.Preview;
  Main.MyConnection.Close;
//  RptSlipSetoran.Close;
end;


procedure TRptSlipSetoran.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
