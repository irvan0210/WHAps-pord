unit PaymentReceivedU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, WHUnit, ADODB, Grids;

type
  TPaymentReceived = class(TForm)
    pnlDisplayH: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtTotalH: TEdit;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dtpTglPembayaran: TDateTimePicker;
    dtpWaktuPembayaran: TDateTimePicker;
    cmbNamaCompany: TComboBox;
    pnlDisplayD: TPanel;
    GroupNamaProduct: TGroupBox;
    GridNamaProduct: TStringGrid;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label13: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cmbNamaTypeID: TComboBox;
    edtTypeID: TEdit;
    edtNoAccount: TEdit;
    edtAmount: TEdit;
    edtDiscRupiahDetail: TEdit;
    edtDiscPercentDetail: TEdit;
    edtPajakDetail: TEdit;
    edtTotalD: TEdit;
    dtpTglDiterima: TDateTimePicker;
    dtpWaktuDiterima: TDateTimePicker;
    mKeteranganD: TMemo;
    cmbNamaBankH: TComboBox;
    edtBankID: TEdit;
    Label7: TLabel;
    Panel3: TPanel;
    btnSimpanH: TButton;
    btnBersih: TButton;
    btnSelesai: TButton;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure btnSimpanHClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbNamaCompanyChange(Sender: TObject);
    procedure cmbNamaCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure dtpWaktuPembayaranKeyPress(Sender: TObject; var Key: Char);
    procedure dtpTglPembayaranKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalHKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalHExit(Sender: TObject);
    procedure GridNamaProductSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cmbNamaTypeIDChange(Sender: TObject);
    procedure cmbNamaTypeIDExit(Sender: TObject);
    procedure edtNoAccountEnter(Sender: TObject);
    procedure edtNoAccountExit(Sender: TObject);
    procedure edtNoAccountKeyPress(Sender: TObject; var Key: Char);
    procedure edtAmountEnter(Sender: TObject);
    procedure edtAmountExit(Sender: TObject);
    procedure edtAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiscRupiahDetailEnter(Sender: TObject);
    procedure edtDiscRupiahDetailExit(Sender: TObject);
    procedure edtDiscRupiahDetailKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiscPercentDetailEnter(Sender: TObject);
    procedure edtDiscPercentDetailExit(Sender: TObject);
    procedure edtDiscPercentDetailKeyPress(Sender: TObject; var Key: Char);
    procedure edtPajakDetailEnter(Sender: TObject);
    procedure edtPajakDetailExit(Sender: TObject);
    procedure edtPajakDetailKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalDEnter(Sender: TObject);
    procedure edtTotalDExit(Sender: TObject);
    procedure edtTotalDKeyPress(Sender: TObject; var Key: Char);
    procedure dtpTglDiterimaExit(Sender: TObject);
    procedure dtpTglDiterimaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpWaktuDiterimaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpWaktuDiterimaExit(Sender: TObject);
    procedure mKeteranganDEnter(Sender: TObject);
    procedure mKeteranganDExit(Sender: TObject);
    procedure mKeteranganDKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNamaBankHExit(Sender: TObject);
    procedure cmbNamaBankHChange(Sender: TObject);
    procedure btnBersihClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;


    DataCompanyID:variant;
    DataActivasiH,DataActivasiD:integer;
    DataCount:string;

    procedure qActExecuteMessage(Query,PesanError:string);


    procedure RefreshCompany;

    procedure RefreshDataNamaTypeID;
    procedure RefreshCmbDataNamaTypeID;

    procedure RefreshDataBankID;
    procedure RefreshCmbDataBankID;

    procedure CmbNamaTypeIDTambah;
    procedure CmbNamaTypeIDUbah;
    procedure CmbNamaDataBankIDH;

    procedure ButtonSimpanDataHeder;
    procedure EnableDataFalseHeader;
    procedure EnableDataTrueHeader;
    procedure ClearDataHeader;

    procedure EnableDataFalseDetail;
    procedure EnableDataTrueDetail;
    procedure ClearDataDetail;



  public
    { Public declarations }

    DataPaymentRecvIDH,DataPaymentRecvIDD,Event:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;PaymentRecvIDH,PaymentRecvIDD,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  PaymentReceived: TPaymentReceived;
  IntCount:Integer;
  CompanyArr:Array of TArrString5;
  NamaTypeArr:Array of TArrString5;
  BankArr:Array of TArrString5;
  CustORDTArr:Array of TArrString9;


implementation

uses MainU;

{$R *.dfm}

constructor TPaymentReceived.Create(AOwner:TComponent;PaymentRecvIDH,PaymentRecvIDD,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  DataPaymentRecvIDH:=PaymentRecvIDH;
  DataPaymentRecvIDD:=PaymentRecvIDD;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);

end;

procedure TPaymentReceived.qActExecuteMessage(Query,PesanError:string);
var
  qQuery:TADOQuery;

begin
  qQuery:=TADOQuery.Create(nil);
  qQuery.Connection:=Main.MyConnection;
  qQuery.Close;
  qQuery.SQL.Clear;
  qQuery.SQL.Add(Query);

  try
          qQuery.ExecSQL;
  except
    on E:Exception do begin
       StrMsg:=PesanError;
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;

 FreeAndNil(qQuery);

end;


procedure TPaymentReceived.RefreshCompany;
var
  Qry:TADOQuery;
  Count:Integer;
begin
    SetLength(CompanyArr,0);
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin

      StrQry:=' SELECT company_id, name FROM wh_company ';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Count:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(CompanyArr,Count+1);
        cmbNamaCompany.Items.Add(Qry.FieldValues['name']);
        CompanyArr[Count][0]:=Qry.FieldValues['company_id'];
        CompanyArr[Count][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(Count);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;


end;

procedure TPaymentReceived.RefreshDataNamaTypeID;
var
  Qry:TADOQuery;
  Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT transaction_type_id, name FROM wh_transaction_type ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(NamaTypeArr,1);
      NamaTypeArr[0][0]:='';
      NamaTypeArr[0][1]:='';
      IntCount:=1;
      while Not(Qry.Eof) do begin
        //if Qry.FieldValues['display']=1 then begin
          SetLength(NamaTypeArr,Length(NamaTypeArr)+1);
          NamaTypeArr[IntCount][0]:=Qry.FieldValues['transaction_type_id'];
          NamaTypeArr[IntCount][1]:=Qry.FieldValues['name'];

          Inc(IntCount);
        //end;
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TPaymentReceived.RefreshCmbDataNamaTypeID;
var IntCount:Integer;
begin

  cmbNamaTypeID.Items.Clear;
  for IntCount:=0 to Length(NamaTypeArr)-1 do
  cmbNamaTypeID.Items.Add(NamaTypeArr[IntCount][1]);

end;


procedure TPaymentReceived.RefreshDataBankID;
var
  Qry:TADOQuery;
  Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT bank_id, name FROM wh_bank ';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(BankArr,1);
      BankArr[0][0]:='';
      BankArr[0][1]:='';
      IntCount:=1;
      while Not(Qry.Eof) do begin
        //if Qry.FieldValues['display']=1 then begin
          SetLength(BankArr,Length(BankArr)+1);
          BankArr[IntCount][0]:=Qry.FieldValues['bank_id'];
          BankArr[IntCount][1]:=Qry.FieldValues['name'];

          Inc(IntCount);
        //end;
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TPaymentReceived.RefreshCmbDataBankID;
var IntCount:Integer;
begin

  cmbNamaBankH.Items.Clear;
  for IntCount:=0 to Length(BankArr)-1 do
  cmbNamaBankH.Items.Add(BankArr[IntCount][1]);

end;


procedure TPaymentReceived.CmbNamaTypeIDTambah;
begin

  GridNamaProduct.Cells[0,GridNamaProduct.Row]:=cmbNamaTypeID.Items[cmbNamaTypeID.ItemIndex];

  if cmbNamaTypeID.ItemIndex>0 then begin
    GridNamaProduct.Cells[3,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[4,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[5,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[6,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[7,GridNamaProduct.Row]:='0';

    GridNamaProduct.Cells[8,GridNamaProduct.Row]:= FormatDateTime('dd/mm/yyyy',Now);
    GridNamaProduct.Cells[9,GridNamaProduct.Row]:= FormatDateTime('hh:mm:ss',Now);

    edtTypeID.Text:=NamaTypeArr[cmbNamaTypeID.ItemIndex][0];
    GridNamaProduct.Cells[11,GridNamaProduct.Row]:= edtTypeID.Text;

    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then begin
      GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
    end;

  end else if cmbNamaTypeID.ItemIndex=0 then GridNamaProduct.Cells[1,GridNamaProduct.Row]:='';

  cmbNamaTypeID.Visible:= False;
  cmbNamaTypeID.Text:='';
  cmbNamaTypeID.ItemIndex:=0;
  GridNamaProduct.SetFocus;

end;

procedure TPaymentReceived.CmbNamaTypeIDUbah;
begin

  GridNamaProduct.Cells[0,GridNamaProduct.Row]:=cmbNamaTypeID.Items[cmbNamaTypeID.ItemIndex];
  if cmbNamaTypeID.ItemIndex>0 then begin

    {
    GridNamaProduct.Cells[3,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[4,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[5,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[6,GridNamaProduct.Row]:='0';
    GridNamaProduct.Cells[7,GridNamaProduct.Row]:='0';

    GridNamaProduct.Cells[8,GridNamaProduct.Row]:= FormatDateTime('dd/mm/yyyy',Now);
    GridNamaProduct.Cells[9,GridNamaProduct.Row]:= FormatDateTime('hh:mm:ss',Now);
    } 

    edtTypeID.Text:=NamaTypeArr[cmbNamaTypeID.ItemIndex][0];
    GridNamaProduct.Cells[11,GridNamaProduct.Row]:= edtTypeID.Text;

    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then begin
      GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
    end;

  end else if cmbNamaTypeID.ItemIndex=0 then GridNamaProduct.Cells[1,GridNamaProduct.Row]:='';

  cmbNamaTypeID.Visible:= False;
  cmbNamaTypeID.Text:='';
  cmbNamaTypeID.ItemIndex:=0;
  GridNamaProduct.SetFocus;

end;

procedure TPaymentReceived.CmbNamaDataBankIDH;
begin

  GridNamaProduct.Cells[1,GridNamaProduct.Row]:=cmbNamaBankH.Items[cmbNamaBankH.ItemIndex];

  edtBankID.Text:=BankArr[cmbNamaBankH.ItemIndex][0];
  GridNamaProduct.Cells[12,GridNamaProduct.Row]:=edtBankID.Text;

  cmbNamaBankH.Visible:= False;
  cmbNamaBankH.Text:='';
  cmbNamaBankH.ItemIndex:=0;
  GridNamaProduct.SetFocus;


end;

procedure TPaymentReceived.ButtonSimpanDataHeder;
begin
  btnSimpanH.Enabled:=False;
  btnBersih.Enabled:=True;

  EnableDataFalseHeader;
end;

procedure TPaymentReceived.EnableDataFalseHeader;
begin

  cmbNamaCompany.Enabled:=False;
  dtpTglPembayaran.Enabled:=False;
  dtpWaktuPembayaran.Enabled:=False;
  edtTotalH.Enabled:=False;

end;

procedure TPaymentReceived.EnableDataTrueHeader;
begin

  cmbNamaCompany.Enabled:=True;
  dtpTglPembayaran.Enabled:=True;
  dtpWaktuPembayaran.Enabled:=True;
  edtTotalH.Enabled:=True;

end;


procedure TPaymentReceived.EnableDataFalseDetail;
begin

  GridNamaProduct.Enabled:=False;

end;

procedure TPaymentReceived.EnableDataTrueDetail;
begin

  GridNamaProduct.Enabled:=True;

end;


procedure TPaymentReceived.ClearDataDetail;
var
  Count:integer;
begin
  Count:=1;
  while (GridNamaProduct.RowCount>Count) do
  begin
    GridNamaProduct.Cells[0,Count]:='';
    GridNamaProduct.Cells[1,Count]:='';
    GridNamaProduct.Cells[2,Count]:='';
    GridNamaProduct.Cells[3,Count]:='';
    GridNamaProduct.Cells[4,Count]:='';
    GridNamaProduct.Cells[5,Count]:='';
    GridNamaProduct.Cells[6,Count]:='';
    GridNamaProduct.Cells[7,Count]:='';
    GridNamaProduct.Cells[8,Count]:='';
    GridNamaProduct.Cells[9,Count]:='';
    GridNamaProduct.Cells[10,Count]:='';

    Inc(Count);
  end;

  GridNamaProduct.RowCount:=2;

end;


procedure TPaymentReceived.ClearDataHeader;
begin
  cmbNamaCompany.Text:='';
  edtTotalH.Text:='0';
  
end;


procedure TPaymentReceived.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPaymentReceived.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPaymentReceived.btnSimpanHClick(Sender: TObject);
var
  Qry:TADOQuery;
  VPrefix,vDataCount,vPaymentIDH,vNilaiDataTotalH,vNilaiDataTotalD,
  vNilaiDataDiscRpD,vNilaiDataAmountD:string;
  Count:integer;

begin

  if cmbNamaCompany.Text='' then
  begin
      MessageDlg('Nama Perusahaan Tidak Boleh Kosong',mtError,[mbOK],0);
      Exit;
  end;

  Count:=1;
  while (GridNamaProduct.RowCount>=Count) do
  begin
    if ((GridNamaProduct.Cells[3,Count])>'0') and ((GridNamaProduct.Cells[4,Count])>'0') then
    begin
      MessageDlg('Data Discount Detail Harus Pilih Satu',mtError,[mbOK],0);
      Exit;
    end;

    Inc(Count);
  end;

  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=Main.MyConnection;
        StrQry:='select count(*) as nilai from wh_payment_received';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
    try
        Qry.Open;

    except
      on E:Exception do begin
         StrMsg:='Tabel Payment Received Tidak Dapat Di Buka';
         StrEMessage:=E.Message;
         IsOk:=False;
         end
    end;

    if edtTotalH.Text>'0' then
    vNilaiDataTotalH:=ToString(IToCurr(SToInt(edtTotalH.Text)));
    DataCount:=Qry.FieldValues['nilai'];

    vDataCount:='00'+DataCount;
    vDataCount:=Format('%.*d',[8,StrToInt(vDataCount)+1]);
    VPrefix:='PY';
    vPaymentIDH:=VPrefix+vDataCount;

    if Event='T' then begin

      StrQry:=' INSERT INTO wh_payment_received( payment_recv_id, '+
              ' company_id, '+
              ' date, '+
              ' time, '+
              ' form_id, '+
              ' total, '+
              ' update_time, '+
              ' update_user) '+
              ' VALUES('+QuotedStr(vPaymentIDH)+', '+
              QuotedStr(DataCompanyID)+', '+
              QuotedStr(FormatDateTime('yyyy-mm-dd',dtpTglPembayaran.Date))+', '+
              QuotedStr(TimeToStr(dtpWaktuPembayaran.Time))+', '+
              QuotedStr(vPaymentIDH)+', '+
              QuotedStr(vNilaiDataTotalH)+', GETDATE(), '+
              QuotedStr(User)+')';
              qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Payment Received');


      Count:=1;
      while (GridNamaProduct.RowCount>=Count) do
      begin
        if GridNamaProduct.Cells[3,Count]>'0' then
        vNilaiDataAmountD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[3,Count])));
        if GridNamaProduct.Cells[4,Count]>'0' then
        vNilaiDataDiscRpD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[4,Count])));
        if GridNamaProduct.Cells[7,Count]>'0' then
        vNilaiDataTotalD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[7,Count])));
        if (GridNamaProduct.Cells[11,Count]<>'') and (GridNamaProduct.Cells[0,Count]<>'') then

        begin

          StrQry:=' INSERT INTO wh_payment_received_detail( payment_recv_id, '+
                  ' transaction_type_id, '+
                  ' bank_id, '+

                  ' account_no, '+
                  ' amount, '+
                  ' discount, '+

                  ' discount_percent, '+
                  ' tax, '+
                  ' total, '+

                  ' recived_date, '+
                  ' received_time, '+
                  ' remark, '+

                  ' update_time, '+
                  ' update_user )'+
                  ' VALUES('+QuotedStr(vPaymentIDH)+', '+
                  QuotedStr(GridNamaProduct.Cells[11,Count])+', '+
                  QuotedStr(GridNamaProduct.Cells[12,Count])+', '+

                  QuotedStr(GridNamaProduct.Cells[2,Count])+', '+
                  QuotedStr(vNilaiDataAmountD)+', '+
                  QuotedStr(vNilaiDataDiscRpD)+', '+

                  QuotedStr(GridNamaProduct.Cells[5,Count])+', '+
                  QuotedStr(GridNamaProduct.Cells[6,Count])+', '+
                  QuotedStr(vNilaiDataTotalD)+', '+     

                  QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(GridNamaProduct.Cells[8,Count])))+', '+
                  QuotedStr(FormatDateTime('hh:mm:ss',StrToTime(GridNamaProduct.Cells[9,Count])))+', '+
                  QuotedStr(GridNamaProduct.Cells[10,Count])+', GETDATE(), '+
                  QuotedStr(User)+')';
          qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan di Payment Received Detail');
        end;
        Inc(Count);
        
      end;
        

      end else
    if Event='U' then begin

        StrQry:=' UPDATE wh_payment_received '+
                ' SET company_id ='+QuotedStr(DataCompanyID)+', '+
                ' date ='+QuotedStr(FormatDateTime('yyyy-mm-dd',dtpTglPembayaran.Date))+', '+
                ' time ='+QuotedStr(TimeToStr(dtpWaktuPembayaran.Time))+', '+
                ' form_id ='+QuotedStr(DataPaymentRecvIDH)+', '+
                ' total ='+QuotedStr(vNilaiDataTotalH)+', '+
                ' update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                ' WHERE payment_recv_id='+QuotedStr(DataPaymentRecvIDH);
        qActExecuteMessage(StrQry,'Data Tidak Bisa Di Update Di Payment Received');

        Count:=1;
        while (GridNamaProduct.RowCount>=Count) do
        begin  

          begin

            if GridNamaProduct.Cells[3,Count]>'0' then
            vNilaiDataAmountD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[3,Count])));
            if GridNamaProduct.Cells[4,Count]>'0' then
            vNilaiDataDiscRpD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[4,Count])));
            if GridNamaProduct.Cells[7,Count]>'0' then
            vNilaiDataTotalD:=ToString(IToCurr(SToInt(GridNamaProduct.Cells[7,Count])));
            if GridNamaProduct.Cells[0,Count]<>'' then

            StrQry:=' UPDATE wh_payment_received_detail '+
                    ' SET  transaction_type_id='+QuotedStr(GridNamaProduct.Cells[11,Count])+', '+
                    ' bank_id ='+QuotedStr(GridNamaProduct.Cells[12,Count])+', '+
                    ' account_no ='+QuotedStr(GridNamaProduct.Cells[2,Count])+', '+
                    ' amount ='+QuotedStr(vNilaiDataAmountD)+', '+
                    ' discount ='+QuotedStr(vNilaiDataDiscRpD)+', '+
                    ' discount_percent ='+QuotedStr(GridNamaProduct.Cells[5,Count])+', '+
                    ' tax ='+QuotedStr(GridNamaProduct.Cells[6,Count])+', '+
                    ' total ='+QuotedStr(vNilaiDataTotalD)+', '+
                    ' recived_date ='+QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(GridNamaProduct.Cells[8,Count])))+', '+
                    ' received_time ='+QuotedStr(FormatDateTime('hh:mm:ss',StrToTime(GridNamaProduct.Cells[9,Count])))+', '+
                    ' remark ='+QuotedStr(GridNamaProduct.Cells[10,Count])+', '+
                    ' update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                    ' WHERE payment_recv_detail_id='+QuotedStr(GridNamaProduct.Cells[13,Count])+' '+'AND payment_recv_id ='+QuotedStr(DataPaymentRecvIDH);
            qActExecuteMessage(StrQry,'Data Tidak Bisa Di Update di Payment Received Detail');


          end;

          Inc(Count);
        end;



    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin

        ButtonSimpanDataHeder;
        EnableDataFalseDetail;


      end else
      if Event='U' then begin
        
        ButtonSimpanDataHeder;
        EnableDataFalseDetail;
        btnBersih.Enabled:=False;


      end;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Gagal Simpan',MB_OK or MB_ICONERROR);
    end;
  
  end;

  Main.CloseDb;
  Main.M_Normal;




end;

procedure TPaymentReceived.FormShow(Sender: TObject);
begin

   if Event='T' then begin
    {
    btnTambahD.Enabled:=False;
    btnSimpanD.Enabled:=False;
    btnBersih.Enabled:=False;
     }

    ClearDataHeader;
    ClearDataDetail;
    
    RefreshCompany;
    
    RefreshDataNamaTypeID;
    RefreshCmbDataNamaTypeID;

    RefreshDataBankID;
    RefreshCmbDataBankID;

    dtpTglPembayaran.Date:=Now;
    dtpWaktuPembayaran.Time:=Now;

  end else
  if Event='U' then begin

    RefreshCompany;
    
    RefreshDataNamaTypeID;
    RefreshCmbDataNamaTypeID;

    RefreshDataBankID;
    RefreshCmbDataBankID;

    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=False;



  end;
  if Event='L' then begin

    btnSimpanH.Enabled:=False;
    btnBersih.Enabled:=False;

    EnableDataFalseHeader;
    EnableDataFalseDetail;


  end;

end;

procedure TPaymentReceived.cmbNamaCompanyChange(Sender: TObject);
begin

   DataCompanyID:=CompanyArr[cmbNamaCompany.ItemIndex][0];
   //edtProductID.Text:=DataCompanyID;
   
end;

procedure TPaymentReceived.cmbNamaCompanyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  dtpTglPembayaran.SetFocus;
end;

procedure TPaymentReceived.dtpWaktuPembayaranKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  edtTotalH.SetFocus;
end;

procedure TPaymentReceived.dtpTglPembayaranKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  dtpWaktuPembayaran.SetFocus;
end;

procedure TPaymentReceived.edtTotalHKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;

  if Key=#13 then
  GroupNamaProduct.SetFocus;      

end;

procedure TPaymentReceived.edtTotalHExit(Sender: TObject);
begin
  if edtTotalH.Text<>'' then
  edtTotalH.Text:= SToCurr(ToString(edtTotalH.Text));
end;

procedure TPaymentReceived.GridNamaProductSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin

  if (ACol = 0) and (ARow >0) then begin
    R := GridNamaProduct.CellRect(ACol, ARow);
    R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
    R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
    R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
    R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
    with cmbNamaTypeID do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        ItemIndex:=Items.IndexOf(GridNamaProduct.Cells[ACol,ARow]);
      BringToFront;
      SetFocus;
    end;
  end;

  if (ACol = 1) and (ARow >0) then begin
    R := GridNamaProduct.CellRect(ACol, ARow);
    R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
    R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
    R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
    R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
    with cmbNamaBankH do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        ItemIndex:=Items.IndexOf(GridNamaProduct.Cells[ACol,ARow]);
      BringToFront;
      SetFocus;
    end;
  end;

  if (ACol = 2) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtNoAccount do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 3) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtAmount do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 4) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtDiscRupiahDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 5) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtDiscPercentDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 6) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtPajakDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 7) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with edtTotalD do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 8) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with dtpTglDiterima do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        //if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 9) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with dtpWaktuDiterima do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        //if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        BringToFront;
        SetFocus;
      end;

  end;

  if (ACol = 10) and (ARow > 0) then begin
      R := GridNamaProduct.CellRect(ACol, ARow);
      R.Left := R.Left + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Right := R.Right + GridNamaProduct.Left+GroupNamaProduct.Left;
      R.Top := R.Top + GridNamaProduct.Top+GroupNamaProduct.Top;
      R.Bottom := R.Bottom + GridNamaProduct.Top+GroupNamaProduct.Top;
      with mKeteranganD do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridNamaProduct.Cells[ACol,ARow])<>'' then
        Text:=GridNamaProduct.Cells[ACol,ARow];
        BringToFront;
        SetFocus;
      end;

  end;

end;

procedure TPaymentReceived.FormCreate(Sender: TObject);
var
  Qry:TADOQuery;
  Count:Integer;

begin

  KeyPreview :=True;
  
  GridNamaProduct.Cells[0,0]:='Nama Transaksi';
  GridNamaProduct.Cells[1,0]:='Nama Bank';
  GridNamaProduct.Cells[2,0]:='No Account';
  GridNamaProduct.Cells[3,0]:='Amount ';
  GridNamaProduct.Cells[4,0]:='Disc Rp';
  GridNamaProduct.Cells[5,0]:='Disc %';
  GridNamaProduct.Cells[6,0]:='Pajak %';
  GridNamaProduct.Cells[7,0]:='Total';
  GridNamaProduct.Cells[8,0]:='Tgl Diterima';
  GridNamaProduct.Cells[9,0]:='Waktu Diterima';
  GridNamaProduct.Cells[10,0]:='Keterangan';
  GridNamaProduct.Cells[11,0]:='Type ID ';
  GridNamaProduct.Cells[12,0]:='Bank ID';
  GridNamaProduct.Cells[13,0]:='Payment Rrecv Detail ID';

  GridNamaProduct.ColWidths[0]:=120;
  GridNamaProduct.ColWidths[1]:=120;
  GridNamaProduct.ColWidths[2]:=120;
  GridNamaProduct.ColWidths[3]:=90;
  GridNamaProduct.ColWidths[4]:=60;
  GridNamaProduct.ColWidths[5]:=60;
  GridNamaProduct.ColWidths[6]:=60;
  GridNamaProduct.ColWidths[7]:=90;
  GridNamaProduct.ColWidths[8]:=80;
  GridNamaProduct.ColWidths[9]:=80;
  GridNamaProduct.ColWidths[10]:=300;
  
  //untuk nilai default activasi
  if Event='T' then begin
    DataActivasiH:=1;


  end else
  if (Event='U') or (Event='L') then begin

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:=' EXECUTE GetPaymentReceivedOne @vPaymentRecvID ='+QuotedStr(DataPaymentRecvIDH);
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      cmbNamaCompany.Text:=Qry.FieldValues['nama_company']; 
      //edtProductID.Text:=Qry.FieldValues['company_id'];
      DataCompanyID:=Qry.FieldValues['company_id'];
      dtpTglPembayaran.Date:=Qry.FieldValues['date'];
      dtpWaktuPembayaran.Time:=Qry.FieldValues['time'];
      edtTotalH.Text:=SToCurr(ToString(Qry.FieldValues['totalh']));

      Count:=1;
      if Qry.RecordCount>0 then begin
        GridNamaProduct.RowCount:=Qry.RecordCount+1;
          while Not(Qry.Eof) do begin
            if Qry.FieldValues['nama_type']<>NULL then
            GridNamaProduct.Cells[0,Count]:=Qry.FieldValues['nama_type'];

            if Qry.FieldValues['nama_bank']<>NULL then
            GridNamaProduct.Cells[1,Count]:=Qry.FieldValues['nama_bank'];

            if Qry.FieldValues['account_no']<>NULL then
            GridNamaProduct.Cells[2,Count]:=Qry.FieldValues['account_no'];

            if Qry.FieldValues['amount']<>NULL then
            GridNamaProduct.Cells[3,Count]:=SToCurr(ToString(Qry.FieldValues['amount']));   

            if Qry.FieldValues['discount']<>NULL then
            GridNamaProduct.Cells[4,Count]:=SToCurr(ToString(Qry.FieldValues['discount']));  
            //GridNamaProduct.Cells[4,Count]:=Qry.FieldValues['discount']; 

            if Qry.FieldValues['discount_percent']<>NULL then
            GridNamaProduct.Cells[5,Count]:=Qry.FieldValues['discount_percent'];

            if Qry.FieldValues['tax']<>NULL then
            GridNamaProduct.Cells[6,Count]:=Qry.FieldValues['tax'];

            if Qry.FieldValues['totald']<>NULL then
            GridNamaProduct.Cells[7,Count]:=SToCurr(ToString(Qry.FieldValues['totald']));
            //GridNamaProduct.Cells[7,Count]:=Qry.FieldValues['total'];

            if Qry.FieldValues['recived_date']<>NULL then
            GridNamaProduct.Cells[8,Count]:=Qry.FieldValues['recived_date'];

            if Qry.FieldValues['received_time']<>NULL then 
            dtpWaktuDiterima.Time:=Qry.FieldValues['received_time'];
            GridNamaProduct.Cells[9,Count]:=TimeToStr(dtpWaktuDiterima.Time);

            if Qry.FieldValues['remark']<>NULL then
            GridNamaProduct.Cells[10,Count]:=Qry.FieldValues['remark'];


            if Qry.FieldValues['transaction_type_id']<>NULL then
            GridNamaProduct.Cells[11,Count]:=Qry.FieldValues['transaction_type_id'];

            if Qry.FieldValues['bank_id']<>NULL then
            GridNamaProduct.Cells[12,Count]:=Qry.FieldValues['bank_id'];

            if Qry.FieldValues['payment_recv_detail_id']<>NULL then
            GridNamaProduct.Cells[13,Count]:=Qry.FieldValues['payment_recv_detail_id'];   

            Inc(Count);
            Qry.Next;
          end;
        end;
      end;

    Main.CloseDb;
    FreeAndNil(Qry); 

  end;



end;

procedure TPaymentReceived.cmbNamaTypeIDChange(Sender: TObject);
begin
  if Event='T' then begin
    CmbNamaTypeIDTambah;
  end else
  if Event='U' then begin
    CmbNamaTypeIDUbah;
  end;

end;

procedure TPaymentReceived.cmbNamaTypeIDExit(Sender: TObject);
begin
  if Event='T' then begin
    CmbNamaTypeIDTambah;
  end else
  if Event='U' then begin
    CmbNamaTypeIDUbah;
  end;
end;

procedure TPaymentReceived.edtNoAccountEnter(Sender: TObject);
begin
   if edtNoAccount.Text<>'' then
   edtNoAccount.Text;
end;

procedure TPaymentReceived.edtNoAccountExit(Sender: TObject);
begin
  if edtNoAccount.Text<>'' then begin
    edtNoAccount.Text:=UpperCase(edtNoAccount.Text);
    GridNamaProduct.Cells[2,GridNamaProduct.Row]:=UpperCase(edtNoAccount.Text);
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtNoAccount.Visible := False;
  edtNoAccount.Text:='';
  GridNamaProduct.SetFocus;

end;

procedure TPaymentReceived.edtNoAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    edtNoAccountExit(nil);
    GridNamaProduct.Col:=3;
  end;

  if (Key=#27) then begin
    edtNoAccountExit(nil);
  end;
end;

procedure TPaymentReceived.edtAmountEnter(Sender: TObject);
begin
  if edtAmount.Text<>'' then
  edtAmount.Text;
end;

procedure TPaymentReceived.edtAmountExit(Sender: TObject);
begin
  if edtAmount.Text<>'' then begin
    //edtAmount.Text:=edtAmount.Text;
    edtAmount.Text:= SToCurr(ToString(edtAmount.Text));
    GridNamaProduct.Cells[3,GridNamaProduct.Row]:= edtAmount.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtAmount.Visible := False;
  edtAmount.Text:='';
  GridNamaProduct.SetFocus;

end;

procedure TPaymentReceived.edtAmountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;
  
  if (Key=#13) then begin
    edtAmountExit(nil);
    GridNamaProduct.Col:=4;
  end;

  if (Key=#27) then begin
    edtAmountExit(nil);
  end;
end;

procedure TPaymentReceived.edtDiscRupiahDetailEnter(Sender: TObject);
begin
  if edtDiscRupiahDetail.Text<>'' then
  edtDiscRupiahDetail.Text;
end;

procedure TPaymentReceived.edtDiscRupiahDetailExit(Sender: TObject);
begin
  if edtDiscRupiahDetail.Text<>'' then begin
    //edtDiscRupiahDetail.Text:=edtDiscRupiahDetail.Text;
    edtDiscRupiahDetail.Text:= SToCurr(ToString(edtDiscRupiahDetail.Text));
    GridNamaProduct.Cells[4,GridNamaProduct.Row]:= edtDiscRupiahDetail.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtDiscRupiahDetail.Visible := False;
  edtDiscRupiahDetail.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.edtDiscRupiahDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;

  
  if (Key=#13) then begin
    edtDiscRupiahDetailExit(nil);
    GridNamaProduct.Col:=5;
  end;

  if (Key=#27) then begin
    edtDiscRupiahDetailExit(nil);
  end;
end;

procedure TPaymentReceived.edtDiscPercentDetailEnter(Sender: TObject);
begin
  if edtDiscPercentDetail.Text<>'' then
  edtDiscPercentDetail.Text;
end;

procedure TPaymentReceived.edtDiscPercentDetailExit(Sender: TObject);
begin
  if edtDiscPercentDetail.Text<>'' then begin
    edtDiscPercentDetail.Text:=edtDiscPercentDetail.Text;
    GridNamaProduct.Cells[5,GridNamaProduct.Row]:= edtDiscPercentDetail.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtDiscPercentDetail.Visible := False;
  edtDiscPercentDetail.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.edtDiscPercentDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;
  
  if (Key=#13) then begin
    edtDiscPercentDetailExit(nil);
    GridNamaProduct.Col:=6;
  end;

  if (Key=#27) then begin
    edtDiscPercentDetailExit(nil);
  end;
end;

procedure TPaymentReceived.edtPajakDetailEnter(Sender: TObject);
begin
  if edtPajakDetail.Text<>'' then
  edtPajakDetail.Text;
end;

procedure TPaymentReceived.edtPajakDetailExit(Sender: TObject);
begin
  if edtPajakDetail.Text<>'' then begin
    edtPajakDetail.Text:=edtPajakDetail.Text;
    GridNamaProduct.Cells[6,GridNamaProduct.Row]:= edtPajakDetail.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtPajakDetail.Visible := False;
  edtPajakDetail.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.edtPajakDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;
  
  if (Key=#13) then begin
    edtPajakDetailExit(nil);
    GridNamaProduct.Col:=7;
  end;

  if (Key=#27) then begin
    edtPajakDetailExit(nil);
  end;
end;

procedure TPaymentReceived.edtTotalDEnter(Sender: TObject);
begin
  if edtTotalD.Text<>'' then
  edtTotalD.Text;
end;

procedure TPaymentReceived.edtTotalDExit(Sender: TObject);
begin
  if edtTotalD.Text<>'' then begin
    //edtTotalD.Text:=edtTotalD.Text;
    edtTotalD.Text:= SToCurr(ToString(edtTotalD.Text));
    GridNamaProduct.Cells[7,GridNamaProduct.Row]:= edtTotalD.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  edtTotalD.Visible := False;
  edtTotalD.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.edtTotalDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;

  
   if (Key=#13) then begin
    edtTotalDExit(nil);
    GridNamaProduct.Col:=8;
  end;

  if (Key=#27) then begin
    edtTotalDExit(nil);
  end;
end;

procedure TPaymentReceived.dtpTglDiterimaExit(Sender: TObject);
begin
   //if edtKeberangkatan.Text<>'' then begin
  dtpTglDiterima.Date:=dtpTglDiterima.Date;
  GridNamaProduct.Cells[8,GridNamaProduct.Row]:=DateToStr(dtpTglDiterima.Date);
  if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
  begin
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  dtpTglDiterima.Visible := False;
  //edtKeberangkatan.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.dtpTglDiterimaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key=#13) then begin
    dtpTglDiterimaExit(nil);
    GridNamaProduct.Col:=9;
  end;

  if (Key=#27) then begin
    dtpTglDiterimaExit(nil);
  end;
end;

procedure TPaymentReceived.dtpWaktuDiterimaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    dtpWaktuDiterimaExit(nil);
    GridNamaProduct.Col:=10;
  end;

  if (Key=#27) then begin
    dtpWaktuDiterimaExit(nil);
  end;
end;

procedure TPaymentReceived.dtpWaktuDiterimaExit(Sender: TObject);
begin
  //if edtKeberangkatan.Text<>'' then begin
  dtpWaktuDiterima.Time:=dtpWaktuDiterima.Time;
  GridNamaProduct.Cells[9,GridNamaProduct.Row]:=TimeToStr(dtpWaktuDiterima.Time);
  if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
  begin
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  dtpWaktuDiterima.Visible := False;
  //edtKeberangkatan.Text:='';
  GridNamaProduct.SetFocus;
  
end;

procedure TPaymentReceived.mKeteranganDEnter(Sender: TObject);
begin
  if mKeteranganD.Text<>'' then
  mKeteranganD.Text;
end;

procedure TPaymentReceived.mKeteranganDExit(Sender: TObject);
begin
  if mKeteranganD.Text<>'' then begin
    mKeteranganD.Text:=mKeteranganD.Text;
    GridNamaProduct.Cells[10,GridNamaProduct.Row]:= mKeteranganD.Text;
    if GridNamaProduct.Row=GridNamaProduct.RowCount-1 then
    GridNamaProduct.RowCount:=GridNamaProduct.RowCount+1;
  end;
  mKeteranganD.Visible := False;
  mKeteranganD.Text:='';
  GridNamaProduct.SetFocus;
end;

procedure TPaymentReceived.mKeteranganDKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key=#13) then begin
    mKeteranganDExit(nil);
    GridNamaProduct.Col:=0;
  end;

  if (Key=#27) then begin
    mKeteranganDExit(nil);
  end;
end;

procedure TPaymentReceived.cmbNamaBankHExit(Sender: TObject);
begin
  CmbNamaDataBankIDH;
end;

procedure TPaymentReceived.cmbNamaBankHChange(Sender: TObject);
begin
  CmbNamaDataBankIDH;
end;

procedure TPaymentReceived.btnBersihClick(Sender: TObject);
begin
  ClearDataHeader;
  ClearDataDetail;

  EnableDataTrueHeader;
  EnableDataTrueDetail;

  btnSimpanH.Enabled:=True;
  btnBersih.Enabled:=False;
end;

procedure TPaymentReceived.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

end.
