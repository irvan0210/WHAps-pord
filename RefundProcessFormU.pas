unit RefundProcessFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ADODB,
  Dialogs, WHUnit, Buttons, StdCtrls,
  ComCtrls, ExtCtrls, Grids;

type
  TRefundProcessForm = class(TForm)
    Selesai: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    GroupNo: TGroupBox;
    Label9: TLabel;
    Jam: TEdit;
    Label5: TLabel;
    Tanggal: TEdit;
    UserName: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    NoBody: TEdit;
    Customer: TEdit;
    Route: TMemo;
    NoPolisi: TEdit;
    Seat: TEdit;
    DriverDisp: TEdit;
    FromDate: TEdit;
    ToDate: TEdit;
    CustomerId: TEdit;
    Label2: TLabel;
    CariOrder: TSpeedButton;
    NoSJ: TEdit;
    NoRefund: TEdit;
    PanelRefund: TPanel;
    Label4: TLabel;
    NilaiRefund: TEdit;
    bank_name: TEdit;
    acc_number: TEdit;
    acc_name: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    gbTransfer: TGroupBox;
    TransferValue: TEdit;
    Label12: TLabel;
    Label23: TLabel;
    TransferDates: TDateTimePicker;
    Label26: TLabel;
    Label24: TLabel;
    Status: TCheckBox;
    TransactionId: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CariOrderClick(Sender: TObject);
    procedure NilaiRefundEnter(Sender: TObject);
    procedure NilaiRefundExit(Sender: TObject);
    procedure bank_nameKeyPress(Sender: TObject; var Key: Char);
    procedure acc_numberKeyPress(Sender: TObject; var Key: Char);
    procedure acc_nameKeyPress(Sender: TObject; var Key: Char);
    procedure TransferValueEnter(Sender: TObject);
    procedure TransferValueExit(Sender: TObject);
    procedure TransferValueKeyPress(Sender: TObject; var Key: Char);
  private

    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    SJArr:Array of TArrString30;
    WOArr:Array of TArrString10;
    IntRow,CompId,MaxComponent,TotalDays:Integer;

    TransId,EmplId,OrderId,SJId,CCPId,StrCustomerId,StrCustomerOrderId:String;
    Initiation,IsCancel:Boolean;
    StateStatus: Byte;
    { Private declarations }
    procedure Init;

    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Name:String;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0;Is_Cancel:Boolean=False);Overload;
    procedure CheckData(SJDetail_Id:String);
    procedure LoadData(SJ_Id:String);
  end;

var
  RefundProcessForm: TRefundProcessForm;

implementation

uses MainU, SPJBusListU, CustomerRefundSJListU, LoginU,
  RefundProcessSJListU;


{$R *.dfm}
constructor TRefundProcessForm.Create(AOwner:TComponent;Form_Name:String;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0;Is_Cancel:Boolean=False);
begin
  {StateStatus=> 0:View; 1:Input; 2:Edit}
  SJId:=SJ_Id;
  CCPId:=CCP_Id;
  StateStatus:=State_Status;
  IsCancel:=Is_Cancel;
  if CCPId<>'' then StateStatus:=2;
  Main.WriteLog('Form Open: RefundProcessForm='+SJId+','+CCP_Id+','+IntToStr(StateStatus)+','+BoolToStr(Is_Cancel));
  Initiation:=True;
  inherited Create(AOwner);
end;


procedure TRefundProcessForm.DisableInput;
begin
  Simpan.Enabled:=False;
  CariOrder.Enabled:=False;
  gbTransfer.Enabled:=False;
  Status.Enabled:=False;
end;

procedure TRefundProcessForm.EnableInput;
begin
  Simpan.Enabled:=True;
  CariOrder.Enabled:=True;
  gbTransfer.Enabled:=True;
  Status.Enabled:=True;
end;

procedure TRefundProcessForm.Init;
var IntCount:Integer;
begin

  if IsCancel then begin
    Status.Visible:= True;
    gbTransfer.Enabled:=False;
  end
  else begin
    Status.Visible:= False;
    gbTransfer.Enabled:=True;
  end;

  NoRefund.Text:='';
  Customer.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  NoSJ.Text:='';
  NoSJ.Text:='';
  DriverDisp.Text:='';
  FromDate.Text:='';
  ToDate.Text:='';
  Route.Text:='';
  Seat.Text:='';
  bank_name.Text:='';
  acc_number.Text:='';
  acc_name.Text:='';
  TransferValue.Text:='0';
  TransferDates.Date := Now;
  {
  for IntCount:=0 to KomplainGrid.RowCount-1 do
    KomplainGrid.Cells[0,IntCount]:='';
  KomplainGrid.RowCount:=1;
  }
  NilaiRefundExit(Nil);
  Tanggal.Text:=Main.Status.Panels.Items[0].Text;
  Jam.Text:=FormatDateTime('HH:NN', Now);
end;

procedure TRefundProcessForm.LoadData(SJ_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(SJ_Id)+',@TypeData=1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      NoRefund.Text:=Qry.FieldValues['cust_refund_id'];

      UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      DriverDisp.Text:=Qry.FieldValues['name'];

      Customer.Text:=Qry.FieldValues['customer_name'];
      StrCustomerId:=Qry.FieldValues['CustomerId'];
      CustomerId.Text:=Qry.FieldValues['CustomerId'];
      StrCustomerOrderId:=Qry.FieldValues['customer_order_id'];
      TotalDays:=Qry.FieldValues['day'];

      Tanggal.Text:=FormatDateTime('DD/MM/YYYY',VarToDateTime(Qry.FieldValues['UpdateDate']));
      Jam.Text:=FormatDateTime('HH:NN',VarToDateTime(Qry.FieldValues['UpdateDate']));

      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];

      bank_name.Text := Qry.FieldValues['bank_name'];
      acc_number.Text := Qry.FieldValues['acc_number'];
      acc_name.Text := Qry.FieldValues['acc_name'];
      NilaiRefund.Text := SToCurr(Qry.FieldValues['nominal']);

      TransferValue.Text := SToCurr(Qry.FieldValues['total']);
      TransferDates.Date := Qry.FieldValues['payment_date'];
      TransactionId.Text := Qry.FieldValues['transaction_id'];
      Qry.Next;
      Inc(IntCount);
    end;
    {
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(NoSJ.Text)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      if KomplainGrid.RowCount<IntCount+1 then KomplainGrid.RowCount:=KomplainGrid.RowCount+1;
      KomplainGrid.Cells[0,IntCount]:=Qry.FieldValues['complain_desc'];
      Qry.Next;
      Inc(IntCount);
    end;
    }
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TRefundProcessForm.CheckData(SJDetail_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetSJDetail '+QuotedStr(SJDetail_Id)+' ;';
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(SJDetail_Id)+',@TypeData=1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Qry.First;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then begin
      
      //UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      DriverDisp.Text:=Qry.FieldValues['name'];
      NoRefund.Text:=Qry.FieldValues['cust_refund_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      StrCustomerId:=Qry.FieldValues['customer_id'];
      StrCustomerOrderId:=Qry.FieldValues['customer_order_id'];
      CustomerId.Text:=Qry.FieldValues['CustomerId'];
      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];

      bank_name.Text := Qry.FieldValues['bank_name'];
      acc_number.Text := Qry.FieldValues['acc_number'];
      acc_name.Text := Qry.FieldValues['acc_name'];
      NilaiRefund.Text := SToCurr(Qry.FieldValues['nominal']);
            
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TRefundProcessForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TRefundProcessForm.FormShow(Sender: TObject);
begin
  MaxComponent:=Self.ComponentCount;
  Case StateStatus Of
  0   : DisableInput;
  1,2 : Begin
        EnableInput;
        end;
  End;
  Init;

  if SJId<>'' then begin

      LoadData(SJId);
      Tanggal.Text:=Main.Status.Panels.Items[0].Text;
      Jam.Text:=FormatDateTime('HH:NN', Now);
      //if not(IsInput) then DisableInput;
      Bersihkan.Enabled:=False;
      If IsCancel Then CariOrder.Enabled:=False
      Else CariOrder.Enabled:=True;
  end else begin
    Tanggal.Text:=Main.Status.Panels.Items[0].Text;
    Jam.Text:=FormatDateTime('HH:NN', Now);
    UserName.Text := User;
    //TransferDates.Date := Now;
    Init;
  end;

end;

procedure TRefundProcessForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,
    StrMsg,StrEMsg,StrTransId, StrStartDate,StrFinishDate,
    StrCompanyId,StrLocationId,StrPaymentDate,StrTransactionType,
    StrPaymentOption,StrStatus:String;

    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
begin
  Main.M_Busy;
  
  if Status.Visible=false then begin
    if (NoRefund.Text<>'') AND (SToInt(TransferValue.Text)>0) then begin
      IsOk:=True;
      IsCetak:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:RefundProcessForm',1);
      if Main.OpenDb then begin
        StrQry := '';
        Main.TransStart;
        StrCompanyId:=CompanyId;
        StrLocationId:=QuotedStr(LocationId);
        StrCustomerId:=QuotedStr(CustomerId.Text);
        StrPaymentDate:=QuotedStr(FormatDateTime('yyyy/mm/dd',TransferDates.Date));
        StrPaymentOption:='10003'; {Transfer}
        StrQry:='SELECT RIGHT(MAX(transaction_id),4) AS max_id FROM wh_transaction '+
                'WHERE transaction_id  LIKE '+QuotedStr(CompanyShortCode+'/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/REF/'+'____')+';';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        Qry.Close;
        Qry.SQL.Clear;
        StrTransId:=CompanyShortCode+'/'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'/REF/'+StrTransId;
        StrQry:='INSERT INTO wh_transaction (transaction_id,invoice_id,company_id,customer_id,location_id,form_id,submit_date'+
                ',payment_date,transaction_option_id,account_no,account_name,total,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(NoRefund.Text)+','+StrCompanyId+','+StrCustomerId+','+StrLocationId+
                ','+QuotedStr(StrCustomerOrderId)+',GETDATE(),'+StrPaymentDate+','+StrPaymentOption+','+QuotedStr(acc_number.Text)+','+QuotedStr(acc_name.Text)+','+
                QuotedStr(IntToStr(SToInt(TransferValue.Text)))+','+QuotedStr(User)+');';

        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          StrTransactionType:=QuotedStr('170101');
          StrQry:='INSERT INTO wh_transaction_detail (transaction_id,transaction_type_id,submit_date,submit_time'+
                ',amount,status,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+StrTransactionType+',GETDATE(),GETDATE(),'+QuotedStr(ToString(TransferValue.Text))+',1,'+QuotedStr(User)+');';

          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;

          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Transaksi Detail';
              StrEMsg:=E.Message;
            end;
          end;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menyimpan Transaksi';
            StrEMsg:=E.Message;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          DisableInput;
          MessageBox(0,'Proses Refund Berhasil Disimpan','Proses Refund',MB_OKCANCEL or MB_ICONQUESTION);
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,PChar('Gagal Menyimpan Proses Refund'+Chr(13)+Chr(13)+StrEMsg),'Proses Refund',MB_OK or MB_ICONERROR)
        end;

        Qry.Destroy;
        Main.CloseDb;
      end;
    end else begin
      MessageBox(0,'Silahkan isi kolom data yg kosong','Proses Refund',MB_OK or MB_ICONERROR);
    end;
  end
  else begin
    If Not Status.Checked Then begin
      MessageBox(0,'Ceklis batal belum diisi','Proses Refund',MB_OK or MB_ICONERROR);
      Exit;
    End;
    If MessageBox(0,PChar('Transfer Refund Rp. '+TransferValue.Text+' mau dibatalkan ?'),'Proses Refund',MB_OKCANCEL or MB_ICONQUESTION)=1 Then
    Begin
      IsOk:=True;
      IsCetak:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.WriteLog('Form CancelPayment:RefundProcessForm',1);
      if Main.OpenDb then begin
        Main.TransStart;
        StrTransId := TransactionId.Text;
        if Status.Enabled then if Status.Checked then StrStatus:='0' else StrStatus:='1'
        else StrStatus:='1';
        StrQry:='UPDATE wh_transaction SET status='+StrStatus+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE transaction_id='+QuotedStr(StrTransId)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Simpan Transaksi';
            StrEMsg:=E.Message;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          DisableInput;
          MessageBox(0,'Proses Pembatalan Pembayaran Refund Berhasil Disimpan','Proses Refund',MB_OKCANCEL or MB_ICONQUESTION);
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,PChar('Gagal membatalkan Proses Refund'+Chr(13)+Chr(13)+StrEMsg),'Proses Refund',MB_OK or MB_ICONERROR)
        end;
        Qry.Destroy;
        Main.CloseDb;

      end;
    End;
  end;
  Main.M_Normal;
end;

procedure TRefundProcessForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  EnableInput;
  Init;
  Jam.Text:=FormatDateTime('HH:NN', Now);
  Main.M_Normal;

end;

procedure TRefundProcessForm.CetakUlangClick(Sender: TObject);
begin
  {
  if NoCCP.Text<>'' then RePrint(ReservedId.Text) else
  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(nil,'Bus','Booking-Reprint');
  }
end;

procedure TRefundProcessForm.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TRefundProcessForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TRefundProcessForm.CariOrderClick(Sender: TObject);
begin
      if Main.IsFormOpen('RefundProcessSJList')=False then RefundProcessSJList:=TRefundProcessSJList.Create(Self)
end;

procedure TRefundProcessForm.NilaiRefundEnter(Sender: TObject);
begin
      NilaiRefund.Text:=ToString(NilaiRefund.Text);
end;

procedure TRefundProcessForm.NilaiRefundExit(Sender: TObject);
begin
  if ToString(NilaiRefund.Text)='' then NilaiRefund.Text:='0';
  try
    NilaiRefund.Text:=SToCurr(NilaiRefund.Text);
  except
    on e:exception do
      NilaiRefund.Text:='0';
  end;
end;

procedure TRefundProcessForm.bank_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then acc_number.SetFocus;
end;

procedure TRefundProcessForm.acc_numberKeyPress(Sender: TObject;
  var Key: Char);
begin
  //if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key = #13 then acc_name.SetFocus;
end;

procedure TRefundProcessForm.acc_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (Key In ['0'..'9']) then Key:=#0;
      if Key = #13 then NilaiRefund.SetFocus;
end;

procedure TRefundProcessForm.TransferValueEnter(Sender: TObject);
begin
      TransferValue.Text:=ToString(TransferValue.Text);
end;

procedure TRefundProcessForm.TransferValueExit(Sender: TObject);
begin
  if ToString(TransferValue.Text)='' then TransferValue.Text:='0';
  try
    TransferValue.Text:=SToCurr(TransferValue.Text);
  except
    on e:exception do
      TransferValue.Text:='0';
  end;
end;

procedure TRefundProcessForm.TransferValueKeyPress(Sender: TObject;
  var Key: Char);
begin
      if Key = #13 then TransferDates.SetFocus;
end;

end.
