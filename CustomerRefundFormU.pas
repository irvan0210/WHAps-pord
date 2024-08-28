unit CustomerRefundFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ADODB,
  Dialogs, WHUnit, Buttons, StdCtrls,
  ComCtrls, ExtCtrls, Grids;

type
  TCustomerRefundForm = class(TForm)
    Selesai: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    GroupNo: TGroupBox;
    Label3: TLabel;
    NoCRF: TEdit;
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
    NoComplain: TEdit;
    Panel2: TPanel;
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
    LabelKeluhan: TLabel;
    KomplainGrid: TStringGrid;
    Label24: TLabel;
    GbKategori: TGroupBox;
    cbKebersihan: TCheckBox;
    cbFasilitas: TCheckBox;
    cbPelayanan: TCheckBox;
    cbPenjemputan: TCheckBox;
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
    procedure NilaiRefundKeyPress(Sender: TObject; var Key: Char);
  private

    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    SJArr:Array of TArrString30;
    WOArr:Array of TArrString10;
    IntRow,CompId,MaxComponent,TotalDays:Integer;

    TransId,EmplId,OrderId,SJId,CCPId,StrCustomerId,StrCustomerOrderId:String;
    Initiation:Boolean;
    StateStatus: Byte;
    { Private declarations }
    procedure Init;

    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Name:String;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0);Overload;
    procedure CheckData(SJDetail_Id:String);
    procedure LoadData(SJ_Id:String);
  end;

var
  CustomerRefundForm: TCustomerRefundForm;

implementation

uses MainU, SPJBusListU, CustomerRefundSJListU, LoginU;


{$R *.dfm}
constructor TCustomerRefundForm.Create(AOwner:TComponent;Form_Name:String;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0);
begin
  {StateStatus=> 0:View; 1:Input; 2:Edit}
  SJId:=SJ_Id;
  CCPId:=CCP_Id;
  StateStatus:=State_Status;

  if CCPId<>'' then StateStatus:=2;
  Main.WriteLog('Form Open: CustomerRefundForm='+SJId+','+IntToStr(StateStatus),1);
  Initiation:=True;
  inherited Create(AOwner);
end;


procedure TCustomerRefundForm.DisableInput;
begin
  Simpan.Enabled:=False;
  CariOrder.Enabled:=False;
  Panel2.Enabled:=False;
end;

procedure TCustomerRefundForm.EnableInput;
begin
  Simpan.Enabled:=True;
  CariOrder.Enabled:=True;
  Panel2.Enabled:=True;
end;

procedure TCustomerRefundForm.Init;
var IntCount:Integer;
begin
  NoCRF.Text:='';

  NoComplain.Text:='';
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

  for IntCount:=0 to KomplainGrid.RowCount-1 do
    KomplainGrid.Cells[0,IntCount]:='';
  KomplainGrid.RowCount:=1;

  cbKebersihan.Checked:=False;
  cbFasilitas.Checked:=False;
  cbPelayanan.Checked:=False;
  cbPenjemputan.Checked:=False;

  NilaiRefundExit(Nil);
  Tanggal.Text:=Main.Status.Panels.Items[0].Text;
  Jam.Text:=FormatDateTime('HH:NN', Now);
end;

procedure TCustomerRefundForm.LoadData(SJ_Id:String);
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
      NoCRF.Text:= Qry.FieldValues['cust_refund_id'];
      UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      DriverDisp.Text:=Qry.FieldValues['name'];
      NoComplain.Text:=Qry.FieldValues['cust_complain_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      StrCustomerId:=Qry.FieldValues['customer_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
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

      if (Qry.FieldValues['kebersihan_status'])=1 then cbKebersihan.Checked:=True else cbKebersihan.Checked:=False;
      if (Qry.FieldValues['fasilitas_status'])=1 then cbFasilitas.Checked:=True else cbFasilitas.Checked:=False;
      if (Qry.FieldValues['pelayanan_status'])=1 then cbPelayanan.Checked:=True else cbPelayanan.Checked:=False;
      if (Qry.FieldValues['penjemputan_status'])=1 then cbPenjemputan.Checked:=True else cbPenjemputan.Checked:=False;

      Qry.Next;
      Inc(IntCount);
    end;
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
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerRefundForm.CheckData(SJDetail_Id:String);
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
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(SJDetail_Id)+';';
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
      NoComplain.Text:=Qry.FieldValues['cust_complain_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      StrCustomerId:=Qry.FieldValues['customer_id'];
      CustomerId.Text:=Qry.FieldValues['customer_id'];
      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];

      if (Qry.FieldValues['kebersihan_status'])=1 then cbKebersihan.Checked:=True else cbKebersihan.Checked:=False;
      if (Qry.FieldValues['fasilitas_status'])=1 then cbFasilitas.Checked:=True else cbFasilitas.Checked:=False;
      if (Qry.FieldValues['pelayanan_status'])=1 then cbPelayanan.Checked:=True else cbPelayanan.Checked:=False;
      if (Qry.FieldValues['penjemputan_status'])=1 then cbPenjemputan.Checked:=True else cbPenjemputan.Checked:=False;

    end;
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

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerRefundForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TCustomerRefundForm.FormShow(Sender: TObject);
begin
  Init;
  MaxComponent:=Self.ComponentCount;

  Case StateStatus Of
  0   : DisableInput;
  1,2 : Begin
        EnableInput;
        end;
  End;

  //if CCPId<>'' then LoadData;

  if SJId<>'' then begin

      LoadData(SJId);
      Tanggal.Text:=Main.Status.Panels.Items[0].Text;
      Jam.Text:=FormatDateTime('HH:NN', Now);
      //if not(IsInput) then DisableInput;
      Bersihkan.Enabled:=False;

  end else begin
    Tanggal.Text:=Main.Status.Panels.Items[0].Text;
    Jam.Text:=FormatDateTime('HH:NN', Now);
    UserName.Text := User;
    //TransferDates.Date := Now;
    Init;
  end;

end;

procedure TCustomerRefundForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,
    StrMsg,StrEMsg,StrTransId, StrStartDate,StrFinishDate,
    StrCompanyId,StrLocationId,StrPaymentDate,StrPaymentOption:String;

    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
begin
  Main.M_Busy;
  
  if (NoSJ.Text<>'') AND (SToInt(NilaiRefund.Text)>0) and (trim(bank_name.Text)<>'') and (trim(acc_number.Text)<>'')
     and (trim(acc_name.Text)<>'') then begin
      IsOk:=True;
      IsCetak:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:CustomerRefundForm',1);
      if Main.OpenDb then begin
        StrQry := '';

            if (NoCRF.Text<>'')  then begin
                StrTransId:=NoCRF.Text;
                Main.TransStart;
                StrQry:=' UPDATE wh_cust_refund_detail SET status=0 '+//,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (cust_refund_id='+QuotedStr(StrTransId)+') AND (status=1);';

                StrQry:=StrQry+' INSERT INTO wh_cust_refund_detail (cust_refund_id,status '+
                                ',bank_name,acc_number,acc_name,nominal,update_user)'+
                                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                                ','+QuotedStr(bank_name.Text)+
                                ','+QuotedStr(acc_number.Text)+
                                ','+QuotedStr(acc_name.Text)+
                                ','+ToString(NilaiRefund.Text)+
                                ','+Chr(39)+User+Chr(39)+'); ';

                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,4);
                Qry.SQL.Add(StrQry);
                try
                  Qry.ExecSQL;
                except
                  on E:Exception do begin
                    IsOk:=False;
                    StrMsg:='Gagal Menyimpan Detail Customer Refund';
                    StrEMsg:=E.Message;
                  end;
                end;

            end else begin
                StrMsg:='';
                StrEMsg:='';
                StrQry:='SELECT RIGHT(MAX(cust_refund_id),4) AS max_id FROM wh_cust_refund WHERE cust_refund_id '+
                        'LIKE '+Chr(39)+'CRF'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                        FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
                Qry.SQL.Add(StrQry);
                Qry.Open;
                if Qry.FieldValues['max_id']<>NULL then begin
                  StrMaxId:=Qry.FieldValues['max_id'];
                  StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
                end else
                  StrMaxId:='0001';

                Main.TransStart;
                StrTransId:='CRF'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                        FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
                StrQry:='INSERT INTO wh_cust_refund (cust_refund_id, company_id, location_id, vhc_trans_id, customer_id'+
                        ',update_user)'+
                        ' VALUES ('+Chr(39)+StrTransId+Chr(39)+
                        ','+CompanyId+','+LocationId+','+Chr(39)+NoSJ.Text+Chr(39)+','+Chr(39)+StrCustomerId+Chr(39)+
                        ','+Chr(39)+User+Chr(39)+');';
                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,4);
                Qry.SQL.Add(StrQry);
                try
                  Qry.ExecSQL;
                except
                  on E:Exception do begin
                    IsOk:=False;
                    StrMsg:='Gagal Menyimpan Customer Refund';
                    StrEMsg:=E.Message;
                  end;
                end;

                StrQry:=' UPDATE wh_cust_refund_detail SET status=0 '+//,update_time=GETDATE(),update_user='+QuotedStr(User)+
                        ' WHERE (cust_refund_id='+QuotedStr(StrTransId)+') AND (status=1);';
                StrQry:=StrQry+' INSERT INTO wh_cust_refund_detail (cust_refund_id,status '+
                                    ',bank_name,acc_number,acc_name,nominal,update_user)'+
                                    ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                                    ','+QuotedStr(bank_name.Text)+
                                    ','+QuotedStr(acc_number.Text)+
                                    ','+QuotedStr(acc_name.Text)+
                                    ','+IntToStr(SToInt(NilaiRefund.Text))+
                                    ','+Chr(39)+User+Chr(39)+'); ';

                Qry.SQL.Clear;
                Main.WriteLog('SQL :'+StrQry,4);
                Qry.SQL.Add(StrQry);
                try
                      Qry.ExecSQL;
                except
                  on E:Exception do begin
                    IsOk:=False;
                    StrMsg:='Gagal Menyimpan Detail Customer Refund';
                    StrEMsg:=E.Message;
                  end;
                end;

            End;
            if IsOk then begin
              Main.TransCommit;
              DisableInput;
              StrQry:='SELECT CONVERT(VARCHAR(5),update_time,108) AS update_time FROM wh_cust_refund WHERE cust_refund_id='+Chr(39)+StrTransId+Chr(39)+';';
              Qry.Close;
              Qry.SQL.Clear;
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Add(StrQry);
              Qry.Open;
              if Qry.RecordCount>0 then begin
                NoCRF.Text:=StrTransId;
                Jam.Text:=Qry.FieldValues['update_time'];
                MessageBox(0,'Customer Refund berhasil disimpan.','Buka CCP',MB_OK or MB_ICONINFORMATION);
              end;
              Qry.Close;
            end else begin
              Main.TransRollback;
              MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CRF',MB_OK or MB_ICONERROR);
            end;


        Qry.Destroy;
        Main.CloseDb;
      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Buka CRF',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TCustomerRefundForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  EnableInput;
  Init;
  Jam.Text:=FormatDateTime('HH:NN', Now);
  Main.M_Normal;

end;

procedure TCustomerRefundForm.CetakUlangClick(Sender: TObject);
begin
  {
  if NoCCP.Text<>'' then RePrint(ReservedId.Text) else
  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(nil,'Bus','Booking-Reprint');
  }
end;

procedure TCustomerRefundForm.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TCustomerRefundForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerRefundForm.CariOrderClick(Sender: TObject);
begin
      if Main.IsFormOpen('CustomerRefundSJList')=False then CustomerRefundSJList:=TCustomerRefundSJList.Create(Self)
end;

procedure TCustomerRefundForm.NilaiRefundEnter(Sender: TObject);
begin
      NilaiRefund.Text:=ToString(NilaiRefund.Text);
end;

procedure TCustomerRefundForm.NilaiRefundExit(Sender: TObject);
begin
  if ToString(NilaiRefund.Text)='' then NilaiRefund.Text:='0';
  try
    NilaiRefund.Text:=SToCurr(NilaiRefund.Text);
  except
    on e:exception do
      NilaiRefund.Text:='0';
  end;
end;

procedure TCustomerRefundForm.bank_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then acc_number.SetFocus;
end;

procedure TCustomerRefundForm.acc_numberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key = #13 then acc_name.SetFocus;
end;

procedure TCustomerRefundForm.acc_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (Key In ['0'..'9']) then Key:=#0;
      if Key = #13 then NilaiRefund.SetFocus;
end;

procedure TCustomerRefundForm.NilaiRefundKeyPress(Sender: TObject;
  var Key: Char);
begin
      if Key = #13 then Simpan.SetFocus;
end;

end.
