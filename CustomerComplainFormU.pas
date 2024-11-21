unit CustomerComplainFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ADODB,
  Dialogs, WHUnit, Buttons, StdCtrls,
  ComCtrls, ExtCtrls, Grids;

type
  TCustomerComplainForm = class(TForm)
    LabelKeluhan: TLabel;
    Selesai: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    KomplainGrid: TStringGrid;
    KomplainGridSebelum: TStringGrid;
    Simpan: TButton;
    GroupNo: TGroupBox;
    Label3: TLabel;
    NoCCP: TEdit;
    KomplainDetail: TEdit;
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
    Seat: TEdit;
    FromDate: TEdit;
    ToDate: TEdit;
    Customer_Id: TEdit;
    Label2: TLabel;
    CariOrder: TSpeedButton;
    NoSJ: TEdit;
    NoReservasi: TEdit;
    Label9: TLabel;
    Jam: TEdit;
    GbKategori: TGroupBox;
    cbKebersihan: TCheckBox;
    cbFasilitas: TCheckBox;
    cbPelayanan: TCheckBox;
    cbPenjemputan: TCheckBox;
    NoResvDetId: TEdit;
    NoResvDetPkgId: TEdit;
    DriverDisp: TEdit;
    NoPolisi: TEdit;
    cbMogok: TCheckBox;
    cbDriverBermasalah: TCheckBox;
    PanelClose: TPanel;
    LabelStatus: TLabel;
    ChkClose: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure KomplainGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure KomplainDetailExit(Sender: TObject);
    procedure KomplainDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KomplainDetailKeyPress(Sender: TObject; var Key: Char);
    procedure KomplainGridSebelumSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure AllClick(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NoSJChange(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
  private

    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    SJArr:Array of TArrString30;
    WOArr:Array of TArrString10;
    IntRow,CompId,MaxComponent,TotalDays:Integer;

    TransId,EmplId,OrderId,SJId,CCPId,ReservedOrderDetId:String;
    Initiation:Boolean;
    StateStatus: Byte;
    { Private declarations }
    procedure Init;
    procedure RefreshData;

    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0;Reserved_Order_DetId:String='');Overload;
    procedure CheckData(SJDetail_Id:String;ResvDetId:String;ResvDetPkgId:String;CustomerId:String);
    procedure LoadData(SJ_Id:String);
  end;

var
  CustomerComplainForm: TCustomerComplainForm;

implementation

uses MainU, SPJBusListU, CustomerComplainSJListU, Math;


{$R *.dfm}
constructor TCustomerComplainForm.Create(AOwner:TComponent;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0;Reserved_Order_DetId:String='');
begin
  {StateStatus=> 0:View; 1:Input; 2:Edit}
  SJId:=SJ_Id;
  CCPId:=CCP_Id;
  StateStatus:=State_Status;
  ReservedOrderDetId:=Reserved_Order_DetId;
  if CCPId<>'' then StateStatus:=2;
  Main.WriteLog('Form Open: CustomerComplainForm='+SJId+','+CCP_Id+IntToStr(StateStatus),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainForm.RefreshData;
var StrQry,StrOrderId,StrFoward:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
(*
  Main.M_Busy;
  SetLength(SJArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    //if All.Checked=True then StrFoward:=',@AllFoward=1' else StrFoward:=',@AllFoward=2';
    StrFoward := ',@AllFoward=-1';
    StrQry:='EXEC GetVhcOutComplainList '+LocationId+',1,'+CompanyId+StrFoward+'; ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[IntCount][1]:=Qry.FieldValues['body_id'];
      SJArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                   ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      SJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
      SJArr[IntCount][4]:=Qry.FieldValues['name'];
      SJArr[IntCount][5]:=Qry.FieldValues['out_date'];
      if Qry.FieldValues['out_ordo_km']<>NULL then SJArr[IntCount][7]:=Qry.FieldValues['out_ordo_km'];
      if Qry.FieldValues['fuel_price']<>NULL then SJArr[IntCount][8]:=Qry.FieldValues['fuel_price']
      else SJArr[IntCount][8]:='';
      if Qry.FieldValues['gas_price']<>NULL then SJArr[IntCount][9]:=Qry.FieldValues['gas_price']
      else SJArr[IntCount][9]:='';
      if Qry.FieldValues['customer_order_id']<>NULL then SJArr[IntCount][10]:=Qry.FieldValues['customer_order_id'];
      SJArr[IntCount][11]:=Qry.FieldValues['customer_name'];
      SJArr[IntCount][12]:=Qry.FieldValues['day'];
      SJArr[IntCount][13]:=Qry.FieldValues['from_dates'];
      SJArr[IntCount][14]:=Qry.FieldValues['from_time'];
      SJArr[IntCount][15]:=Qry.FieldValues['seat'];
      SJArr[IntCount][16]:=Qry.FieldValues['route'];
      if Qry.FieldValues['pickup_point']<>NULL then SJArr[IntCount][17]:=Qry.FieldValues['pickup_point'];
      if Qry.FieldValues['description']<>NULL then SJArr[IntCount][18]:=Qry.FieldValues['description'];
      SJArr[IntCount][19]:=Qry.FieldValues['to_dates'];
      SJArr[IntCount][20]:=Qry.FieldValues['customer_id'];
      if Qry.FieldValues['group_name']<>NULL then SJArr[IntCount][21]:=Qry.FieldValues['group_name'];
      if Qry.FieldValues['field_contact']<>NULL then SJArr[IntCount][22]:=Qry.FieldValues['field_contact'];
      if Qry.FieldValues['field_contact_cellular_no']<>NULL then SJArr[IntCount][23]:=Qry.FieldValues['field_contact_cellular_no'];
      if Qry.FieldValues['daily_package']<>NULL then SJArr[IntCount][24]:='1' else SJArr[IntCount][24]:='0';
      if Qry.FieldValues['driver_fee']<>NULL then SJArr[IntCount][25]:=Qry.FieldValues['driver_fee'] else SJArr[IntCount][25]:='';

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;

  for IntCount:=0 to Length(SJArr)-1 do
    if SJId='' then NoSJ.Items.Add(SJArr[IntCount][0]);
  Main.M_Normal;
*)
end;

procedure TCustomerComplainForm.DisableInput;
begin
  GbKategori.Enabled:=False;
  //KomplainGrid.Enabled:=False;
  KomplainDetail.ReadOnly := True;
  Simpan.Enabled:=False;
  CariOrder.Enabled:=False;

  NoPolisi.ReadOnly  := True;
  DriverDisp.ReadOnly:= True;

end;

procedure TCustomerComplainForm.EnableInput;
begin
  GbKategori.Enabled:=True;
  //KomplainGrid.Enabled:=True;
  KomplainDetail.ReadOnly := False;
  Simpan.Enabled:=True;
  CariOrder.Enabled:=True;
end;

procedure TCustomerComplainForm.Init;
var IntCount:Integer;
begin
  NoCCP.Text:='';

  NoReservasi.Text:='';
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

  DriverDisp.ReadOnly:=True;
  NoPolisi.ReadOnly:=True;
  PanelClose.Visible:=False;
  ChkClose.Checked:=False;

  Simpan.Enabled:=True;

  for IntCount:=0 to KomplainGrid.RowCount-1 do
    KomplainGrid.Cells[0,IntCount]:='';
  KomplainGrid.RowCount:=1;
  KomplainDetail.Text:='';
  //Simpan.Enabled:=True;
  KomplainDetail.Visible:=False;
  KomplainGridSebelum.Visible:=False;
  KomplainGridSebelum.RowCount:=1;
  KomplainGridSebelum.Cells[0,0]:='';

  cbKebersihan.Checked:=False;
  cbFasilitas.Checked:=False;
  cbPelayanan.Checked:=False;
  cbPenjemputan.Checked:=False;

  Tanggal.Text:=Main.Status.Panels.Items[0].Text;
  Jam.Text:=FormatDateTime('HH:NN', Now);
  
end;

procedure TCustomerComplainForm.LoadData(SJ_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount,IntAuth:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin

    StrQry:='select * from wh_user_auth_form where user_id='+Chr(39)+User+Chr(39)+' and form_id=''130824'' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;

    IntAuth:=0;
    if (Qry.RecordCount>0) then
    begin
      IntAuth:=1;
    end;

    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(SJ_Id)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      NoCCP.Text:= Qry.FieldValues['cust_complain_id'];
      UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      DriverDisp.Text:=Qry.FieldValues['name'];
      NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      Customer_Id.Text:=Qry.FieldValues['customer_id'];
      TotalDays:=Qry.FieldValues['day'];

      NoResvDetId.Text:=Qry.FieldValues['reserved_order_detail_id'];

      Tanggal.Text:=FormatDateTime('DD/MM/YYYY',VarToDateTime(Qry.FieldValues['UpdateDate']));
      Jam.Text:=FormatDateTime('HH:NN',VarToDateTime(Qry.FieldValues['UpdateDate']));

      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];
      if KomplainGrid.RowCount<IntCount+1 then KomplainGrid.RowCount:=KomplainGrid.RowCount+1;
      KomplainGrid.Cells[0,IntCount]:=Qry.FieldValues['complain_desc'];

      if (Qry.FieldValues['kebersihan_status'])=1 then cbKebersihan.Checked:=True else cbKebersihan.Checked:=False;
      if (Qry.FieldValues['fasilitas_status'])=1 then cbFasilitas.Checked:=True else cbFasilitas.Checked:=False;
      if (Qry.FieldValues['pelayanan_status'])=1 then cbPelayanan.Checked:=True else cbPelayanan.Checked:=False;
      if (Qry.FieldValues['penjemputan_status'])=1 then cbPenjemputan.Checked:=True else cbPenjemputan.Checked:=False;
      if (Qry.FieldValues['mogok_status'])=1 then cbMogok.Checked:=True else cbMogok.Checked:=False;
      if (Qry.FieldValues['driver_bermasalah_status'])=1 then cbDriverBermasalah.Checked:=True else cbDriverBermasalah.Checked:=False;


      if (Qry.FieldValues['no_ketidaksesuaian_perbaikan']<>NULL) AND (IntAuth=1) then
      begin
        PanelClose.Visible:=True;
        PanelClose.Enabled:=True;
        GbKategori.Enabled:=False;
      end;

      if Qry.FieldValues['is_closed']=1 then
      begin
        PanelClose.Visible:=True;
        PanelClose.Enabled:=False;
        ChkClose.Checked:=True;
        Simpan.Enabled:=False;
      end;

      Qry.Next;
      Inc(IntCount);
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainForm.CheckData(SJDetail_Id:String;ResvDetId:String;ResvDetPkgId:String;CustomerId:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if trim(SJDetail_Id)<>'' then
      StrQry:='EXEC GetSJDetail '+QuotedStr(SJDetail_Id)+' ;'
    else
      StrQry:='EXEC GetReservedOrderDetailDetail '+QuotedStr(ResvDetId)+' ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    DriverDisp.ReadOnly:=False;
    NoPolisi.ReadOnly:=False;
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      
      //UserName.Text:= Qry.FieldValues['UpdateUser'];
      if trim(SJDetail_Id)<>'' then NoSJ.Text:=(Qry.FieldValues['vhc_trans_id'])
      else NoSJ.Text:='';
      NoResvDetId.Text:=ResvDetId;
      NoResvDetPkgId.Text:=ResvDetPkgId;
      Customer_Id.text:=CustomerId;
 
      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      if trim(SJDetail_Id)<>'' then DriverDisp.Text:=Qry.FieldValues['name']
      else DriverDisp.Text:=Qry.FieldValues['driver_name'];
      NoReservasi.Text:=Qry.FieldValues['customer_order_id'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      Customer_Id.Text:=Qry.FieldValues['customer_id'];
      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];
      Qry.Next;
      Inc(IntCount);
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TCustomerComplainForm.FormShow(Sender: TObject);
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
  end;

end;

procedure TCustomerComplainForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,
    StrMsg,StrEMsg,StrTransId,
    StrStartDate,StrFinishDate,
    StrCbKebersihan,StrCbFasilitas,
    StrCbPelayanan,StrCbPenjemputan,StrCbMogok,StrCbDriverBermasalah:String;

    IntCount,IntJobInEx,IntStatus:Integer;
    IsOk,IsCetak:Boolean;
begin
  Main.M_Busy;
  if (NoResvDetId.Text<>'') AND (Trim(KomplainGrid.Cells[0,0])<>'') AND
     (cbKebersihan.Checked OR cbFasilitas.Checked OR cbPelayanan.Checked OR cbPenjemputan.Checked OR cbMogok.Checked or cbDriverBermasalah.Checked) then begin
      IsOk:=True;
      IsCetak:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:CustomerComplainForm',1);
      if Main.OpenDb then begin
        StrQry := '';
        if (NoCCP.Text<>'')  then begin
            StrTransId:=NoCCP.Text;
            Main.TransStart;
            {Kategori}
            If cbKebersihan.Checked Then StrCbKebersihan:='1' Else StrCbKebersihan:='0';
            If cbFasilitas.Checked Then StrCbFasilitas:='1' Else StrCbFasilitas:='0';
            If cbPelayanan.Checked Then StrCbPelayanan:='1' Else StrCbPelayanan:='0';
            If cbPenjemputan.Checked Then StrCbPenjemputan:='1' Else StrCbPenjemputan:='0';
            If cbMogok.Checked Then StrCbMogok:='1' Else StrCbMogok:='0';
            If cbDriverBermasalah.Checked Then StrCbDriverBermasalah:='1' Else StrCbDriverBermasalah:='0';
            if ChkClose.Checked=True then IntStatus:=1 else  IntStatus:=0 ;

            StrQry:=' UPDATE wh_cust_complain SET is_closed='+IntToStr(IntStatus)+' '+
                    ' WHERE (cust_complain_id='+QuotedStr(StrTransId)+') AND (status=1);';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Kategori Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;

            StrQry:=' UPDATE wh_cust_complain_kategory SET status=0 '+//,update_time=GETDATE(),update_user='+QuotedStr(User)+
                           ' WHERE (cust_complain_id='+QuotedStr(StrTransId)+') AND (status=1);';
            StrQry:=StrQry+'INSERT INTO wh_cust_complain_kategory (cust_complain_id, update_user '+
                    ',kebersihan_status,fasilitas_status,pelayanan_status,penjemputan_status, mogok_status, driver_bermasalah_status)'+
                    ' VALUES ('+Chr(39)+StrTransId+Chr(39)+
                    ','+Chr(39)+User+Chr(39)+','+StrCbKebersihan+','+StrCbFasilitas+','+StrCbPelayanan+','+StrCbPenjemputan+','+StrCbMogok+','+StrCbDriverBermasalah+');';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Kategori Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;

            StrQry:=StrQry+' UPDATE wh_cust_complain_detail SET status=0 '+//,update_time=GETDATE(),update_user='+QuotedStr(User)+
                           ' WHERE (cust_complain_id='+QuotedStr(StrTransId)+') AND (status=1);';

            for IntCount:=0 to KomplainGrid.RowCount-1 do begin
                if Trim(KomplainGrid.Cells[0,IntCount])<>'' then
                    StrQry:=StrQry+' INSERT INTO wh_cust_complain_detail (cust_complain_id,status '+
                                   ',description,update_user)'+
                                   ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                                   ','+Chr(39)+KomplainGrid.Cells[0,IntCount]+Chr(39)+
                                   ','+Chr(39)+User+Chr(39)+'); ';
            end;
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Detail Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;

        end else begin
            StrMsg:='';
            StrEMsg:='';
            StrQry:='SELECT RIGHT(MAX(cust_complain_id),4) AS max_id FROM wh_cust_complain WHERE cust_complain_id '+
                    'LIKE '+Chr(39)+'CCP'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['max_id']<>NULL then begin
              StrMaxId:=Qry.FieldValues['max_id'];
              StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
            end else
              StrMaxId:='0001';

            If cbKebersihan.Checked Then StrCbKebersihan:='1' Else StrCbKebersihan:='0';
            If cbFasilitas.Checked Then StrCbFasilitas:='1' Else StrCbFasilitas:='0';
            If cbPelayanan.Checked Then StrCbPelayanan:='1' Else StrCbPelayanan:='0';
            If cbPenjemputan.Checked Then StrCbPenjemputan:='1' Else StrCbPenjemputan:='0';
            If cbMogok.Checked Then StrCbMogok:='1' Else StrCbMogok:='0';
            If cbDriverBermasalah.Checked Then StrCbDriverBermasalah:='1' Else StrCbDriverBermasalah:='0';

            Main.TransStart;
            StrTransId:='CCP'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;
            StrQry:='INSERT INTO wh_cust_complain (cust_complain_id, company_id, location_id, vhc_trans_id, reserved_order_detail_id, reserved_order_detail_package_id, customer_id, customer_order_id '+
                    ',driver,license_plate,route,update_user,created_date,created_user)'+
                    ' VALUES ('+Chr(39)+StrTransId+Chr(39)+
                    ','+CompanyId+','+LocationId+','+Chr(39)+NoSJ.Text+Chr(39)+','+QuotedStr(NoResvDetId.Text)+','+QuotedStr(NoResvDetPkgId.Text)+','+Chr(39)+Customer_Id.Text+Chr(39)+','+QuotedStr(NoReservasi.Text)+
                    ','+QuotedStr(DriverDisp.Text)+','+QuotedStr(NoPolisi.Text)+','+QuotedStr(Route.Text)+','+Chr(39)+User+Chr(39)+',getdate(),'+Chr(39)+User+Chr(39)+');';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;
            {deskripsi komplain}
            StrQry:='';
            for IntCount:=0 to KomplainGrid.RowCount-1 do begin
              if Trim(KomplainGrid.Cells[0,IntCount])<>'' then
                StrQry:=StrQry+' INSERT INTO wh_cust_complain_detail (cust_complain_id,status '+
                        ',description,update_user)'+
                        ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                        ','+Chr(39)+KomplainGrid.Cells[0,IntCount]+Chr(39)+
                        ','+Chr(39)+User+Chr(39)+'); ';
            end;
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Detail Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;
            {Kategori}
            StrQry:='INSERT INTO wh_cust_complain_kategory (cust_complain_id, update_user '+
                    ',kebersihan_status,fasilitas_status,pelayanan_status,penjemputan_status,mogok_status,driver_bermasalah_status)'+
                    ' VALUES ('+Chr(39)+StrTransId+Chr(39)+
                    ','+Chr(39)+User+Chr(39)+','+StrCbKebersihan+','+StrCbFasilitas+','+StrCbPelayanan+','+StrCbPenjemputan+','+StrCbMogok+','+StrCbDriverBermasalah+');';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Kategori Customer Complain';
                StrEMsg:=E.Message;
              end;
            end;

        End;
        if IsOk then begin
          Main.TransCommit;
          DisableInput;
          StrQry:='SELECT CONVERT(VARCHAR(5),update_time,108) AS update_time FROM wh_cust_complain WHERE cust_complain_id='+Chr(39)+StrTransId+Chr(39)+';';
          Qry.Close;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            NoCCP.Text:=StrTransId;
            Jam.Text:=Qry.FieldValues['update_time'];
            //if MessageBox(0,'Customer Complain berhasil disimpan, Mau Dicetak ?','Buka CCP',MB_OKCANCEL or MB_ICONINFORMATION) = 1 then IsCetak:=True;
            MessageBox(0,'Customer Complain berhasil disimpan.','Buka CCP',MB_OK or MB_ICONINFORMATION);
          end;
          Qry.Close;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CCP',MB_OK or MB_ICONERROR);
        end;
        if IsOk AND IsCetak then begin
          (*
          RePrintForm.ReportName:='PKB';
          RePrintForm.ReportId:=StrTransId;
          if RePrintForm.ShowModal=1 then begin
            PreparePrintData;
            StrQry:='SELECT ROW_NUMBER() OVER (ORDER BY cust_complain_detail_id DESC) AS no'+
                    ',description FROM wh_cust_complain_detail'+
                    ' WHERE cust_complain_id='+Chr(39)+StrTransId+Chr(39)+' AND description_id=1;';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            Report.DataSet:=Qry;
            QNo.DataSet:=Qry;
            QDeskripsi.DataSet:=Qry;
            Report.Prepare;
            Report.Preview;
          end;
          Qry.Close;
          *)
        end;
        Qry.Destroy;
        Main.CloseDb;
      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Buka CCP',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TCustomerComplainForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  if KomplainGridSebelum.Visible then begin
    KomplainGrid.Height:=KomplainGrid.Height+KomplainGridSebelum.Height;
    KomplainGrid.Top:=KomplainGrid.Top-KomplainGridSebelum.Height;
  end;
  EnableInput;
  Init;
  RefreshData;
  Jam.Text:=FormatDateTime('HH:NN', Now);
  Main.M_Normal;

end;

procedure TCustomerComplainForm.CetakUlangClick(Sender: TObject);
begin
  {
  if NoCCP.Text<>'' then RePrint(ReservedId.Text) else
  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(nil,'Bus','Booking-Reprint');
  }
end;

procedure TCustomerComplainForm.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TCustomerComplainForm.KomplainGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) then begin
    R := KomplainGrid.CellRect(ACol, ARow);
    R.Left := R.Left + KomplainGrid.Left;
    R.Right := R.Right + KomplainGrid.Left;
    R.Top := R.Top + KomplainGrid.Top;
    R.Bottom := R.Bottom + KomplainGrid.Top;
    with KomplainDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(KomplainGrid.Cells[ACol,ARow])<>'' then KomplainDetail.Text:=KomplainGrid.Cells[ACol,ARow];
    end;
  end;

end;

procedure TCustomerComplainForm.KomplainDetailExit(Sender: TObject);
begin
  if Trim(KomplainDetail.Text)<>'' then  KomplainGrid.Cells[KomplainGrid.Col, KomplainGrid.Row]:=KomplainDetail.Text;
  KomplainDetail.Visible := False;
  KomplainDetail.Text:='';
  KomplainGrid.SetFocus;
end;

procedure TCustomerComplainForm.KomplainDetailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=38 then begin
    if KomplainGrid.Row>0 then begin
      KomplainDetailExit(nil);
      KomplainGrid.Row:=KomplainGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  KomplainGrid.Row<KomplainGrid.RowCount-1 then begin
      KomplainDetailExit(nil);
      KomplainGrid.Row:=KomplainGrid.Row+1;
    end;
  end
end;

procedure TCustomerComplainForm.KomplainDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    KomplainDetailExit(nil);
    if KomplainGrid.Row=KomplainGrid.RowCount-1 then KomplainGrid.RowCount:=KomplainGrid.RowCount+1;
    KomplainGrid.Row:=KomplainGrid.Row+1;
  end;
  if (Key=#27) then begin
    KomplainDetailExit(nil);
  end;
end;

procedure TCustomerComplainForm.KomplainGridSebelumSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) then begin
    R := KomplainGrid.CellRect(ACol, ARow);
    R.Left := R.Left + KomplainGrid.Left;
    R.Right := R.Right + KomplainGrid.Left;
    R.Top := R.Top + KomplainGrid.Top;
    R.Bottom := R.Bottom + KomplainGrid.Top;
    with KomplainDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(KomplainGrid.Cells[ACol,ARow])<>'' then KomplainDetail.Text:=KomplainGrid.Cells[ACol,ARow];
    end;
  end;
end;  

procedure TCustomerComplainForm.AllClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TCustomerComplainForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerComplainForm.NoSJChange(Sender: TObject);
begin
  (*
  Main.M_Busy;
  CheckData;
  Main.M_Normal;
  *)
end;

procedure TCustomerComplainForm.CariOrderClick(Sender: TObject);
begin
  if Main.IsFormOpen('CustomerComplainSJList')=False then CustomerComplainSJList:=TCustomerComplainSJList.Create(Self);
end;

end.
