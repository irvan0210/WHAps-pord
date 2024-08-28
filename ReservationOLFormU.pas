unit ReservationOLFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Grids, ADODB, QRCtrls, WHUnit,
  jpeg, ComCtrls, DB, DBTables, Buttons, QuickRpt;

type
  TReservationOLForm = class(TForm)
    Keluar: TButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QTandaPetugas: TQRLabel;
    QMessage: TQRLabel;
    GroupPemakaian: TGroupBox;
    Label6: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    QRBand2: TQRBand;
    QCatatan: TQRLabel;
    QJamReservasi: TQRLabel;
    QTanggal: TQRLabel;
    QNama: TQRLabel;
    QNoPolisi: TQRLabel;
    QNoBody: TQRLabel;
    QTelpHP: TQRLabel;
    QAcara: TQRMemo;
    QAlamat: TQRMemo;
    QTanggalReservasi: TQRLabel;
    QSeat: TQRLabel;
    QGuide: TQRLabel;
    QGuidePhone: TQRLabel;
    QCustomer: TQRLabel;
    QNoOrder: TQRLabel;
    QNoSPJ: TQRLabel;
    Label18: TLabel;
    QCopy: TQRLabel;
    GroupOrder: TPanel;
    customer_name: TEdit;
    customer_phone: TEdit;
    customer_hp: TEdit;
    Label22: TLabel;
    customer_email: TEdit;
    Label1: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    bMark: TButton;
    transaction_id: TEdit;
    status: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Label14: TLabel;
    product: TEdit;
    Itinerary: TMemo;
    FromDate: TEdit;
    ToDate: TEdit;
    PanelJam: TPanel;
    Label20: TLabel;
    StandbyTime: TMaskEdit;
    PickupPoint: TMemo;
    followup: TEdit;
    customer_addr: TMemo;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bMarkClick(Sender: TObject);

  private
    { Private declarations }
    WebOrderArr:Array of TArrString16;
    IsUpdate:Boolean;
    IntRow:Integer;
    WebOrderId:String;

    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;WebOrder_Id:String='';Is_Update:Boolean=True);
  end;

var
  ReservationOLForm: TReservationOLForm;

implementation

{$R *.dfm}

Uses MainU, ReservationOLListU;

constructor TReservationOLForm.Create(AOwner:TComponent;WebOrder_Id:String='';Is_Update:Boolean=True);
begin
  WebOrderId:=WebOrder_Id;
  IsUpdate:=Is_Update;
  inherited Create(AOwner);
end;

procedure TReservationOLForm.KeluarClick(Sender: TObject);
begin
  ReservationOLForm.Close;
end;

procedure TReservationOLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReservationOLForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerOrderFromWebDetail '+QuotedStr(WebOrderId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      customer_name.Text:=Qry.FieldValues['customer_name'];
      customer_addr.Text:=AdjustLineBreaks(Qry.FieldValues['customer_address']);
      customer_phone.Text:=Qry.FieldValues['customer_phone'];
      customer_hp.Text:=Qry.FieldValues['customer_cellphone'];

      product.Text:=Qry.FieldValues['bus_type']+' - '+Qry.FieldValues['package'];
      Itinerary.Text:=AdjustLineBreaks(Qry.FieldValues['itinerary']);
      FromDate.Text:=Qry.FieldValues['from_date'];
      ToDate.Text:=Qry.FieldValues['to_date'];
      StandbyTime.Text:=Qry.FieldValues['standby_time'];
      PickupPoint.Text:=AdjustLineBreaks(Qry.FieldValues['pickup_point']);
      Status.Text:=Qry.FieldValues['status'];
      followup.Text:=Qry.FieldValues['update_user'];
      if trim(status.Text)='1' then bMark.Enabled:=false
      else bMark.Enabled:=true;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TReservationOLForm.FormShow(Sender: TObject);
begin
    if IsUpdate then bMark.Visible:=true
    else bMark.Visible:=false;
    LoadData;
end;

procedure TReservationOLForm.bMarkClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMessage:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  IsOk:=True;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    Main.TransStart;
    StrQry:='UPDATE wh_customer_weborder SET status=1,update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE transaction_id='+QuotedStr(WebOrderId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
     on e:exception do begin
        StrMsg:='Tidak Dapat Mengupdate data';
        StrEMessage:=E.Message;
        IsOk:=False;
     end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);

  if IsOk=True then begin
    Main.TransCommit;
    MessageBox(0,PChar('Data Berhasil Diupdate' +Chr(13)),'Pesanan via Web',MB_OK or MB_ICONINFORMATION)
  end else begin
    Main.TransRollback;
    MessageBox(0,PChar('Data Tidak Dapat Diupdate' +Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMessage),'Pesanan via Web',MB_OK or MB_ICONERROR)
  end;
  Main.CloseDb;
  if Main.IsFormOpen('ReservationOLList')=True then ReservationOLList.CariChange(Nil);
  ReservationOLForm.OnShow(Nil);
  bMark.Enabled := False;
  Main.M_Normal;
end;
end.
