unit RubahInvoiceFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, Buttons, ComCtrls;

type
  TRubahInvoiceForm = class(TForm)
    Selesai: TButton;
    Label5: TLabel;
    NoOrder: TEdit;
    Cari: TSpeedButton;
    Data: TGroupBox;
    Label2: TLabel;
    Data_NoOrder: TEdit;
    Label3: TLabel;
    Data_NamaCustomer: TEdit;
    Label1: TLabel;
    Data_TglJalan: TDateTimePicker;
    GroupBox2: TGroupBox;
    Before: TLabel;
    Label12: TLabel;
    Before_NoInvoice: TEdit;
    Before_TglInvoice: TDateTimePicker;
    Prosses: TButton;
    After: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    After_NoInvoice: TEdit;
    After_TglInvoice: TDateTimePicker;
    btnClear: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ProssesClick(Sender: TObject);
    procedure CariClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure LoadDataNew;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MenuId:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  RubahInvoiceForm: TRubahInvoiceForm;
  StrMenuId:String;
  IsView:Boolean;
  
implementation

uses MainU, DateUtils;

{$R *.dfm}

constructor TRubahInvoiceForm.Create(AOwner:TComponent;MenuId:String;IsViewOnly:Boolean=False);
begin
  StrMenuId:=MenuId;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TRubahInvoiceForm.Init;
begin
  NoOrder.Text :='';
  After_TglInvoice.Date := Now;
  Before_TglInvoice.Date := Now;
  Data_TglJalan.Date := Now;
  Data_NoOrder.Text := '';
  Data_NamaCustomer.Text := '';
  Before_NoInvoice.Text := '';
  After_NoInvoice.Text := '';
  Prosses.Enabled := True;
end;

procedure TRubahInvoiceForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.customer_order_id,b.name, a.invoice_id, a.invoice_date,od.from_date '+
            ' FROM wh_customer_order a  '+
            ' LEFT JOIN wh_customer b ON b.customer_id=a.customer_id  '+
            ' LEFT JOIN wh_customer_order_detail od ON  od.customer_order_id=a.customer_order_id AND od.status =1 '+
            ' WHERE a.customer_order_id ='+QuotedStr(Trim(NoOrder.Text))+' AND a.status=1;';

    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Data_NoOrder.Text:=Qry.FieldValues['customer_order_id'];
      Data_NamaCustomer.Text:=Qry.FieldValues['name'];
      Data_TglJalan.Date:=Qry.FieldValues['from_date'];
      if Qry.FieldValues['invoice_id']<> null then begin
        if Qry.FieldValues['invoice_id']<> null then Before_NoInvoice.Text:=Qry.FieldValues['invoice_id']
        else Before_NoInvoice.Text:= '';
        if Qry.FieldValues['invoice_date']<>null then Before_TglInvoice.Date:=Qry.FieldValues['invoice_date']
        else Before_TglInvoice.Date:= Now;
      end else
       MessageBox(0,PChar('Orderan '+NoOrder.Text+Chr(13)+Chr(13)+' Belum Memiliki Invoice'),'Invoice',MB_OK or MB_ICONWARNING);
    end else
    MessageBox(0,PChar('No Orderan '+NoOrder.Text+' Tidak Ditemukan'+Chr(13)+Chr(13)+'Silahkan Cek Kembali'),'Invoice',MB_OK or MB_ICONWARNING);
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TRubahInvoiceForm.Input(IsEnable:Boolean);
begin
 // GroupInput.Enabled:=IsEnable;
 //Simpan.Visible:=IsEnable;
end;

procedure TRubahInvoiceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRubahInvoiceForm.SelesaiClick(Sender: TObject);
begin
  RubahInvoiceForm.Close;
end;

procedure TRubahInvoiceForm.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TRubahInvoiceForm.ProssesClick(Sender: TObject);
var Qry,Qry2, QryWehaOnline,QryWehaOnline2:TADOQuery;
    StrQry,StrMsg,StrException, StrBulan,StrNoInvoice,
    StrQryWehaOnline,StrQryCek, StrTglINV:String;
    IntActive,IntNoInvoice:Integer;
    IsOk:Boolean;
    Bulan: Word;
   // StrTglINV : TDateTime;
begin
  if (Trim(Data_NoOrder.Text)<>'') AND (Before_NoInvoice.Text<>'') then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;

    QryWehaOnline:=TADOQuery.Create(Self);
    QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
    QryWehaOnline.CommandTimeout := 360000;
    QryWehaOnline.ParamCheck:=False;
    
    if Main.OpenDb then begin

      StrQry := 'SELECT DISTINCT DATEFROMPARTS(YEAR(od.from_date),MONTH(od.from_date), 1) as tgl_bulan, '+
                  QuotedStr('INV')+'+lo.code+'+QuotedStr('/') +
                  '+FORMAT(od.from_date, '+QuotedStr('yyMM')+')+'+QuotedStr('/')+'  AS bulan_inv '+
                  'FROM wh_customer_order a  '+
                  'LEFT JOIN wh_customer_order_detail od ON  od.customer_order_id=a.customer_order_id AND od.status=1 '+
                  'LEFT JOIN wh_customer b ON b.customer_id=a.customer_id  '+
                  'LEFT JOIN wh_location lo ON lo.location_id=a.location_id '+
                  'WHERE a.customer_order_id='+QuotedStr(Trim(NoOrder.Text))+' AND a.status=1;';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount >0 then begin
         StrBulan := Qry.FieldValues['bulan_inv'];
         //IntLen := Qry.FieldValues['len'];
         //IntLen2 := Qry.FieldValues['len2'];
         StrTglINV := QuotedStr(Qry.FieldValues['tgl_bulan']);

         {StrQryCek := 'SELECT TOP 1 substring(invoice_id,'+IntLen+',5) AS invoice_id FROM wh_transaction '+
                      ' WHERE substring(invoice_id,1,'+IntLen2+')='+QuotedStr(StrBulan) +
                      ' ORDER BY invoice_id DESC;'; }
         StrQryCek := 'SELECT dbo.GetRevisiNoInvoice('+QuotedStr(StrBulan)+') AS InvoiceNew ;';
          Qry2.Close;
          Qry2.SQL.Clear;
          Qry2.SQL.Add(StrQryCek);
          Qry2.Open;
           if Qry2.RecordCount >0 then begin
            //StrNoInvoice :=StrBulan+ IntToStr(StrToInt(Qry2.FieldValues['InvoiceNew'])+1);
            //MessageBox(0,PChar('Invoice '+Chr(13)+Chr(13)+StrNoInvoice),'Invoice',MB_OK or MB_ICONINFORMATION);
             StrQry :='';
             StrQry:='UPDATE wh_customer_order SET invoice_id ='+QuotedStr(Qry2.FieldValues['InvoiceNew'])+
                     ', invoice_date= CONVERT(DATE, '+StrTglINV+', 103)'+
                     ' WHERE customer_order_id ='+QuotedStr(Trim(NoOrder.Text))+'; '+Chr(13)+Chr(13)+
                     ' UPDATE wh_transaction SET invoice_id ='+QuotedStr(Qry2.FieldValues['InvoiceNew'])+
                     ' WHERE form_id ='+QuotedStr(Trim(NoOrder.Text))+';';
              Qry.Close;
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrMsg:='Gagal Update Invoice';
                  StrException:=E.Message;
                end;
              end;

              StrQryWehaOnline := '';
              StrQryWehaOnline := 'UPDATE Orders SET WEHAInvoiceId ='+QuotedStr(Qry2.FieldValues['InvoiceNew'])+
                               ',WEHAInvoiceDate = CONVERT(DATE, '+StrTglINV+', 103) '+
                               ' WHERE OrderNo IN ('+QuotedStr(Trim(NoOrder.Text))+');';

              QryWehaOnline.Close;
              QryWehaOnline.SQL.Clear;
              QryWehaOnline.SQL.Add(StrQryWehaOnline);
              try
                QryWehaOnline.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrMsg:='Gagal Update Invoice';
                  StrException:=E.Message;
                end;
              end;
           end;
        end;
        
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(0,'Berhasil merubah invoice','Invoice',MB_OK or MB_ICONINFORMATION);
      LoadDataNew;
      //Init;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Invoice',MB_OK or MB_ICONERROR);
    end;
  end else
 MessageBox(0,PChar('No Orderan Tidak Ditemukan '+Chr(13)+Chr(13)+' Silahkan Cek Kembali'),'Invoice',MB_OK or MB_ICONWARNING);
end;

procedure TRubahInvoiceForm.CariClick(Sender: TObject);
begin
  if NoOrder.Text <>'' then LoadData
  else
  MessageBox(0,PChar('No Order Masih Kosong'),'Rubah Invoice',MB_OK or MB_ICONWARNING);

end;

procedure TRubahInvoiceForm.btnClearClick(Sender: TObject);
begin
  init;
end;

procedure TRubahInvoiceForm.LoadDataNew;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.customer_order_id,b.name, a.invoice_id, a.invoice_date,od.from_date '+
            ' FROM wh_customer_order a  '+
            ' LEFT JOIN wh_customer b ON b.customer_id=a.customer_id  '+
            ' LEFT JOIN wh_customer_order_detail od ON  od.customer_order_id=a.customer_order_id AND od.status =1 '+
            ' WHERE a.customer_order_id ='+QuotedStr(Trim(NoOrder.Text))+' AND a.status=1;';

    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      Data_NoOrder.Text:=Qry.FieldValues['customer_order_id'];
      Data_NamaCustomer.Text:=Qry.FieldValues['name'];
      Data_TglJalan.Date:=Qry.FieldValues['from_date'];
      if Qry.FieldValues['invoice_id']<> null then begin
        if Qry.FieldValues['invoice_id']<> null then After_NoInvoice.Text:=Qry.FieldValues['invoice_id']
        else After_NoInvoice.Text:= '';
        if Qry.FieldValues['invoice_date']<>null then After_TglInvoice.Date:=Qry.FieldValues['invoice_date']
        else After_TglInvoice.Date:= Now;
      end else
      Prosses.Enabled := False;
      // MessageBox(0,PChar('Orderan '+Data_NoOrder.Text+Chr(13)+Chr(13)+'Belum Memiliki Invoice'),'Invoice',MB_OK or MB_ICONWARNING);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

end.
