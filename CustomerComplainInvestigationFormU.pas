unit CustomerComplainInvestigationFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ADODB,
  Dialogs, WHUnit, Buttons, StdCtrls,
  ComCtrls, ExtCtrls, Grids, ZColorStringGrid;

type
  TCustomerComplainInvestigationForm = class(TForm)
    LabelKeluhan: TLabel;
    KomplainGrid: TStringGrid;
    KomplainGridSebelum: TStringGrid;
    GroupNo: TGroupBox;
    Label3: TLabel;
    KomplainDetail: TEdit;
    Label5: TLabel;
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
    NoResvDetId: TEdit;
    NoResvDetPkgId: TEdit;
    DriverDisp: TEdit;
    NoPolisi: TEdit;
    NoCCP: TEdit;
    Label4: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    grpClosed: TGroupBox;
    chkClosed: TCheckBox;
    ClosedReason: TMemo;
    GbKategori: TPanel;
    Label19: TLabel;
    cbKebersihan: TCheckBox;
    cbFasilitas: TCheckBox;
    cbPelayanan: TCheckBox;
    cbPenjemputan: TCheckBox;
    cbMogok: TCheckBox;
    BitBtn1: TBitBtn;
    grpinvestigasi: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Panel2: TPanel;
    Label23: TLabel;
    Investigasi: TMemo;
    Penanganan: TMemo;
    eStaff: TEdit;
    eTeknikal: TEdit;
    Label20: TLabel;
    Panel3: TPanel;
    StrGrid3: TZColorStringGrid;
    ListEmpl: TListBox;
    PIC: TEdit;
    grpperbaikn: TGroupBox;
    Perbaikan: TMemo;
    Label24: TLabel;
    Label25: TLabel;
    StrGrid4: TZColorStringGrid;
    PIC2: TEdit;
    ListEmpl2: TListBox;
    Label26: TLabel;
    Panel4: TPanel;
    Selesai: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    grprencanatindakanperbaikan: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    RencanaTindakanPerbaikan: TMemo;
    PIC3: TEdit;
    ListEmpl3: TListBox;
    Label30: TLabel;
    StrGrid5: TZColorStringGrid;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    TglRencTindPerbaikan: TDateTimePicker;
    TglPerbaikan: TDateTimePicker;
    TglInvestigasi: TDateTimePicker;
    Label34: TLabel;
    Tanggal: TEdit;
    Label35: TLabel;
    PanelKesalahan: TPanel;
    ChkTeknikal: TCheckBox;
    ChkStaf: TCheckBox;
    ChkCrew: TCheckBox;
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
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NoSJChange(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure chkClosedClick(Sender: TObject);
    procedure StrGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PICExit(Sender: TObject);
    procedure PICKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListEmplDblClick(Sender: TObject);
  private

    GridLArr,GridRArr,GridFArr,GridBArr:Array of TArrString2;
    SJArr:Array of TArrString30;
    WOArr:Array of TArrString10;
    EmplArr:Array of TArrString5;
    IntRow,CompId,MaxComponent,TotalDays,IntCol:Integer;

    TransId,EmplId,ComplainId,CCPId,ReservedOrderDetId,FormRequest,CustcomplainInvestigationID:String;
    Initiation:Boolean;
    StateStatus, IsClosed: Byte;
    { Private declarations }
    procedure Init;
    procedure InitPIC;
    procedure InitPIC2;
    procedure InitPIC3;
    procedure DisableInput;
    procedure EnableInput;
    procedure Calculate2;
    procedure RefreshEmployee;
    procedure InitGridEmpl;
  public
    { Public declarations }

    constructor Create(AOwner:TComponent;SJ_Id:String='';CCP_Id:String='';State_Status:Byte=0;Reserved_Order_DetId:String=''; Is_Closed:Byte=0;Form_Request:String='');Overload;
    procedure CheckData(SJDetail_Id:String;ResvDetId:String;ResvDetPkgId:String;CustomerId:String);
    procedure LoadData(CCP_Id:String);
    procedure SetData(CCP_Id:String);

  end;

var
  CustomerComplainInvestigationForm: TCustomerComplainInvestigationForm;
  MinRowGrid,IntMaxRow : Integer ;

implementation

uses MainU, SPJBusListU, CustomerComplainSJListU, Math,
  CustomerComplainListU, CustomerComplainInvestigationListU, EmployeeListU, 
  CustomerComplainCorrection;


{$R *.dfm}
constructor TCustomerComplainInvestigationForm.Create(AOwner:TComponent;
SJ_Id:String='';
CCP_Id:String='';State_Status:Byte=0;
Reserved_Order_DetId:String='';  Is_Closed:Byte=0;Form_Request:String='');
begin
  {StateStatus=> 0:View; 1:Input; 2:Edit;3 Investigation-Closed}
  FormRequest:=Form_Request;
  CCPId:=CCP_Id;
  StateStatus:=State_Status;
  ReservedOrderDetId:=Reserved_Order_DetId;
  IsClosed:=Is_Closed;
  Main.WriteLog('Form Open: CustomerComplainInvestigationForm='+''''+','+CCP_Id+IntToStr(StateStatus),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainInvestigationForm.InitGridEmpl;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=2;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=250;
  StrGrid3.ColWidths[2]:=0;
  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Nama';
  StrGrid3.Cells[2,0]:='';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[2,0].HorizontalAlignment:=taCenter;



  for IntCount:=0 to 2 do begin
    StrGrid3.Cells[IntCount,1]:='';
    StrGrid3.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid3.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[2,1].HorizontalAlignment:=taCenter;
end;

procedure TCustomerComplainInvestigationForm.InitPIC;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=3;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=328;
  StrGrid3.ColWidths[2]:=0;

  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Nama';
  StrGrid3.Cells[2,0]:='Empoyee ID';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid3.Cells[IntCount,2]:='';
    StrGrid3.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
  StrGrid3.Cells[0,1]:='1';
  StrGrid3.Cells[1,1]:=UpperCase(FullName);
end;

procedure TCustomerComplainInvestigationForm.InitPIC2;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid4.RowCount-1 do
    for IntCount2:=0 to StrGrid4.ColCount-1 do
      StrGrid4.Cells[IntCount2,IntCount]:='';

  StrGrid4.RowCount:=3;
  StrGrid4.ColWidths[0]:=20;
  StrGrid4.ColWidths[1]:=328;
  StrGrid4.ColWidths[2]:=0;

  StrGrid4.Cells[0,0]:='No';
  StrGrid4.Cells[1,0]:='Nama';
  StrGrid4.Cells[2,0]:='Empoyee ID';
  StrGrid4.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid4.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid4.Cells[IntCount,2]:='';
    StrGrid4.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
  StrGrid4.Cells[0,1]:='1';
  StrGrid4.Cells[1,1]:=UpperCase(FullName);
end;

procedure TCustomerComplainInvestigationForm.InitPIC3;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid5.RowCount-1 do
    for IntCount2:=0 to StrGrid5.ColCount-1 do
      StrGrid5.Cells[IntCount2,IntCount]:='';

  StrGrid5.RowCount:=3;
  StrGrid5.ColWidths[0]:=20;
  StrGrid5.ColWidths[1]:=328;
  StrGrid5.ColWidths[2]:=0;

  StrGrid5.Cells[0,0]:='No';
  StrGrid5.Cells[1,0]:='Nama';
  StrGrid5.Cells[2,0]:='Empoyee ID';
  StrGrid5.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid5.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid5.Cells[IntCount,2]:='';
    StrGrid5.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
  StrGrid5.Cells[0,1]:='1';
  StrGrid5.Cells[1,1]:=UpperCase(FullName);
end;

procedure TCustomerComplainInvestigationForm.Calculate2;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid3.RowCount-1 do
    if (Trim(StrGrid3.Cells[1,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid3.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGrid3.Cells[0,IntCount]:='';
end;

procedure TCustomerComplainInvestigationForm.DisableInput;
begin
  GbKategori.Enabled:=False;
  //KomplainGrid.Enabled:=False;
  KomplainDetail.ReadOnly := True;
  Simpan.Enabled:=False;
  Bersihkan.Enabled:=True;
  CariOrder.Enabled:=False;

  PanelKesalahan.Enabled:=False;

  NoPolisi.ReadOnly  := True;
  DriverDisp.ReadOnly:= True;

  Investigasi.ReadOnly := True;
//  eCrew.ReadOnly := True;
  eStaff.ReadOnly := True;
  eTeknikal.ReadOnly := True;
  Penanganan.ReadOnly := True;

end;

procedure TCustomerComplainInvestigationForm.EnableInput;
begin
  GbKategori.Enabled:=False;
  //KomplainGrid.Enabled:=True;
  KomplainDetail.ReadOnly := True;
  Simpan.Enabled:=True;
  PanelKesalahan.Enabled:=True;
  if StateStatus < 3 then Begin
    Bersihkan.Enabled:=True;
    CariOrder.Enabled:=True;

    Investigasi.ReadOnly := False;
//    eCrew.ReadOnly := False;
    eStaff.ReadOnly := False;
    eTeknikal.ReadOnly := False;
    Penanganan.ReadOnly := False;
  end else begin
    Bersihkan.Enabled:=False;
    CariOrder.Enabled:=False;

    Investigasi.ReadOnly := True;
//    eCrew.ReadOnly := True;
    eStaff.ReadOnly := True;
    eTeknikal.ReadOnly := True;
    Penanganan.ReadOnly := True;
  end;
end;

procedure TCustomerComplainInvestigationForm.Init;
var IntCount:Integer;
begin
//  if (FormRequest='Investigasi') then
//  begin
//    CustomerComplainInvestigationForm.Height:=432;
//    Panel4.Top:=353;
//    grpperbaikn.Visible:=False;
//    grprencanatindakanperbaikan.Visible:=False;
//  end;
  CariOrder.Enabled:=True;
  CustcomplainInvestigationID:='';
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
  Investigasi.Clear;
//  eCrew.Clear;
  eStaff.Clear;
  eTeknikal.Clear;
  Penanganan.Clear;
  Perbaikan.Clear;
  RencanaTindakanPerbaikan.Clear;
  DriverDisp.ReadOnly:=True;
  NoPolisi.ReadOnly:=True;
  TglInvestigasi.Date:=Now;
  ChkCrew.Checked:=False;
  ChkStaf.Checked:=False;
  ChkTeknikal.Checked:=False;
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

  Tanggal.Text:='';
  Jam.Text:=FormatDateTime('HH:NN', Now);
  IntMaxRow:=10;


end;

procedure TCustomerComplainInvestigationForm.LoadData(CCP_Id:String);
var StrQry:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(CCP_Id)+',@TypeData=2 ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      if Qry.FieldValues['is_closed']=1 then DisableInput else EnableInput;

      CustcomplainInvestigationID:=Qry.FieldValues['cust_complain_investigation_id'];
      NoCCP.Text:= Qry.FieldValues['cust_complain_id'];
      //UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
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

      if (Qry.FieldValues['iscrew'])=1 then ChkCrew.Checked:=True else ChkCrew.Checked:=False;
      if (Qry.FieldValues['isstaf'])=1 then ChkStaf.Checked:=True else ChkStaf.Checked:=False;
      if (Qry.FieldValues['isteknikal'])=1 then ChkTeknikal.Checked:=True else ChkTeknikal.Checked:=False;

      Investigasi.Text:=Qry.FieldValues['investigation'];
      TglInvestigasi.Date:=Qry.FieldValues['investigation_date'];
//      eCrew.Text:=VarToStr(Qry.FieldValues['crew']);
//      eStaff.Text:=VarToStr(Qry.FieldValues['staff']);
//      eTeknikal.Text:=VarToStr(Qry.FieldValues['technical']);
//      Penanganan.Text:=Qry.FieldValues['handling'];
//      if Qry.FieldValues['is_closed']=1 then chkClosed.Checked := True
//      else chkClosed.Checked:=False;
//      ClosedReason.Text:=VarToStr(Qry.FieldValues['closed_reason']);
      Qry.Next;
      Inc(IntCount);


      StrQry:='';
      StrQry:='select DISTINCT b.name from wh_cust_complain_investigation_pic a '+
              'left join wh_employee b on a.employee_id=b.employee_id '+
              'where cust_complain_investigation_id='+QuotedStr(Qry.FieldValues['cust_complain_investigation_id'])+' AND '+
              'status=1 and type=1;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
        StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid3.Cells[1,IntCount]:= UpperCase(Qry2.FieldValues['name']);
        StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        StrGrid3.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;

        Qry2.Next;
        Inc(IntCount);

      end;
      Qry2.Close;
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainInvestigationForm.SetData(CCP_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Init;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_cust_complain_investigation WHERE cust_complain_id= '+QuotedStr(CCP_Id)+' and status=1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if (Qry.RecordCount>0)  then
    begin
      Qry.Close;
      MessageBox(0,PChar('Complain sudah di Investigasi'),'Customer Complai Investigasi',MB_OK or MB_ICONWARNING);
    end else
    begin

      StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(CCP_Id)+',@TypeData=0 ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Close;
      Qry.Open;
      IntCount:=0;
      SetLength(WOArr,Qry.RecordCount);
      if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
        NoCCP.Text:= Qry.FieldValues['cust_complain_id'];
        //UserName.Text:= Qry.FieldValues['UpdateUser'];
        NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
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

        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
      CustomerComplainList.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainInvestigationForm.CheckData(SJDetail_Id:String;ResvDetId:String;ResvDetPkgId:String;CustomerId:String);
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
      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
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

procedure TCustomerComplainInvestigationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TCustomerComplainInvestigationForm.FormShow(Sender: TObject);
begin
  Init;
  InitPIC;
  MaxComponent:=Self.ComponentCount;

  Case StateStatus Of
  0   : begin
          DisableInput;
          grpClosed.Visible:=True;
          chkClosed.Enabled:=False;
          grpClosed.Enabled:=False;
          chkClosedClick(Nil);
        end;
  1,2 : Begin
          EnableInput;
          grpClosed.Visible:=True;
          chkClosed.Enabled:=False;
          chkClosedClick(Nil);
        end;
  3   : Begin
          EnableInput;
          grpClosed.Visible:=True;
          chkClosed.Enabled:=True;
          chkClosedClick(Nil);
        end;
  End;


  if CCPId<>'' then begin

      LoadData(CCPId);
      Jam.Text:=FormatDateTime('HH:NN', Now);
      CariOrder.Enabled:=False;
      //if not(IsInput) then DisableInput;
      Bersihkan.Enabled:=False;
      UserName.Text := User;
  end else begin
    Tanggal.Text:=Main.Status.Panels.Items[0].Text;
    Jam.Text:=FormatDateTime('HH:NN', Now);
    UserName.Text := User;
  end;
end;

procedure TCustomerComplainInvestigationForm.SimpanClick(Sender: TObject);
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrQry2,StrQry3,StrMaxId,
    StrMsg,StrEMsg,StrTransId,
    StrStartDate,StrFinishDate,
    StrInvestigasi,StrHandling,StrCrew,StrStaff,StrTeknikal,StrRencanaTindakanPerbaikan:String;
    StrClosedReason,StrEmployeeID : String;
    IntCount,IntJobInEx,IntCrew,IntStaf,IntTeknikal:Integer;
    IsOk,IsCetak:Boolean;
begin
  Main.M_Busy;
  for IntCount:=0 to Length(EmplArr)-1 do
    StrEmployeeID:=EmplArr[IntCount][0];

  StrQry := '';
        StrInvestigasi:=QuotedStr(Investigasi.Text);
        StrStaff:=QuotedStr(eStaff.Text);
        StrTeknikal:=QuotedStr(eTeknikal.Text);
        StrHandling:=QuotedStr(Perbaikan.Text);
        StrRencanaTindakanPerbaikan:=QuotedStr(RencanaTindakanPerbaikan.Text);

  if (NoCCP.Text<>'') AND (Trim(Investigasi.Text)<>'') then begin
      IsOk:=True;
      IsCetak:=False;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry2:=TADOQuery.Create(Self);
      Qry2.Connection:=Main.MyConnection;
      Qry3:=TADOQuery.Create(Self);
      Qry3.Connection:=Main.MyConnection;
      Main.WriteLog('Form Save:CustomerComplainInvestigationForm',1);
      if Main.OpenDb then begin
        StrQry := '';
        StrInvestigasi:=QuotedStr(Investigasi.Text);
        StrStaff:=QuotedStr(eStaff.Text);
        StrTeknikal:=QuotedStr(eTeknikal.Text);
        StrHandling:=QuotedStr(Perbaikan.Text);
        StrRencanaTindakanPerbaikan:=QuotedStr(RencanaTindakanPerbaikan.Text);

        if ChkCrew.Checked=True then IntCrew:=1 else  IntCrew:=0;
        if ChkStaf.Checked=True then IntStaf:=1 else  IntStaf:=0;
        if ChkTeknikal.Checked=True then IntTeknikal:=1 else  IntTeknikal:=0;
        Main.TransStart;
        if (CustcomplainInvestigationID='')  then begin
//          INSERT

          StrTransId:=NoCCP.Text;

          StrQry:='INSERT INTO wh_cust_complain_investigation (cust_complain_id, update_user, '+
                  'investigation, Status, investigation_date,iscrew,isstaf,isteknikal)'+
                  ' VALUES ('+Chr(39)+StrTransId+Chr(39)+
                  ','+Chr(39)+User+Chr(39)+','+StrInvestigasi+',1,'+QuotedStr(FormatDateTime('yyyy-mm-dd',TglInvestigasi.Date))+','+
                  ''+IntToStr(IntCrew)+','+IntToStr(IntStaf)+','+IntToStr(IntTeknikal)+');';
          Qry2.SQL.Clear;
          Qry2.SQL.Add(StrQry);
          try
            Qry2.ExecSQL;
            IsOk:=True;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Update Investigasi Customer Complain';
              StrEMsg:=E.Message;
            end;
          end;

          StrQry2:='SELECT TOP 1 cust_complain_investigation_id from wh_cust_complain_investigation Order By cust_complain_investigation_id DESC';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry2);
          Qry.Open;
          CustcomplainInvestigationID:=Qry.FieldValues['cust_complain_investigation_id'];
        end else begin
//        UPDATE
          StrMsg:='';
          StrEMsg:='';
          StrQry:='UPDATE wh_cust_complain_investigation SET cust_complain_id='+QuotedStr(NoCCP.Text)+', update_user='+Chr(39)+User+Chr(39)+', '+
                  'investigation='+StrInvestigasi+', investigation_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglInvestigasi.Date))+', '+
                  'iscrew='+IntToStr(IntCrew)+',isstaf='+IntToStr(IntStaf)+',isteknikal='+IntToStr(IntTeknikal)+' '+
                  'WHERE cust_complain_investigation_id='+CustcomplainInvestigationID+' and status=1';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
            IsOk:=True;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Investigasi Customer Complain';
              StrEMsg:=E.Message;
            end;
          end;
        end;

        StrQry:='';
        if (NoCCP.Text<>'') AND  (IsOk=True) then begin
          StrQry:='UPDATE wh_cust_complain_investigation_pic SET status=0 '+
                  'WHERE cust_complain_investigation_id='+QuotedStr(CustcomplainInvestigationID)+' AND type=1;';
          Qry3.SQL.Clear;
          Qry3.SQL.Add(StrQry);
          try
            Qry3.ExecSQL;
            IsOk:=True;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:=E.Message;
            end;
          end;
          StrQry3:='';
          for IntCount:=1 to StrGrid3.RowCount do begin
            if Trim(StrGrid3.Cells[1,IntCount])<>'' then
            begin
              StrQry2:='SELECT DISTINCT a.employee_id,a.name FROM wh_employee AS a '+
              'LEFT JOIN wh_empl_detail b ON b.empl_detail_id= '+
              '(SELECT MAX(empl_detail_id) FROM wh_empl_detail where employee_id=a.employee_id)  '+
              'LEFT JOIN wh_license_type c ON c.license_type_id=b.license_type_id '+
              'LEFT JOIN wh_empl_mutation d ON d.empl_mutation_id= '+
              '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation  WHERE (employee_id=a.employee_id) AND '+
              '((from_date<=DATEADD(dd, 1,GETDATE())) OR (GETDATE() BETWEEN from_date AND to_date) OR '+
              '(to_date BETWEEN GETDATE() AND DATEADD(dd, 1,GETDATE())))) '+
              'LEFT JOIN wh_employee j ON j.employee_id=a.reference '+
              'WHERE (d.employment_type_id=3) AND '+
              '(d.location_id=6) AND a.name = '+QuotedStr(StrGrid3.Cells[1,IntCount])+' and a.active=1 ';
              Qry2.SQL.Clear;
              Qry2.SQL.Add(StrQry2);
              Qry2.Open;

              StrQry3:='INSERT INTO wh_cust_complain_investigation_pic (cust_complain_investigation_id,'+
                      'employee_id,status,submit_date,submit_user,update_user,type)'+
                      ' VALUES ('+QuotedStr(CustcomplainInvestigationID)+','+QuotedStr(Qry2.FieldValues['employee_id'])+',1,'+
                      'getdate(),'+QuotedStr(User)+','+ QuotedStr(User)+',1); ';

              Qry3.SQL.Clear;
              Qry3.SQL.Add(StrQry3);
              try
                Qry3.ExecSQL;
                IsOk:=True;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrMsg:=E.Message;
                end;
              end;
            end;
          end;
        end;

        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Investigasi Customer Complain berhasil disimpan.','Buka CCP',MB_OK or MB_ICONINFORMATION);
//          DisableInput;
          Close;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CCP',MB_OK or MB_ICONERROR);
          Main.M_Normal;
        end;
        FreeAndNil(Qry);
        FreeAndNil(Qry3);
        FreeAndNil(Qry2);
        Qry3.Destroy;
        Qry2.Destroy;
        Qry.Destroy;
        Main.CloseDb;

      end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Buka CCP',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;

//  if (NoCCP.Text<>'')  then begin
//    CustomerComplainInvestigationList.Show;
//    Close;
//  end;

end;

procedure TCustomerComplainInvestigationForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  if KomplainGridSebelum.Visible then begin
    KomplainGrid.Height:=KomplainGrid.Height+KomplainGridSebelum.Height;
    KomplainGrid.Top:=KomplainGrid.Top-KomplainGridSebelum.Height;
  end;
  EnableInput;
  Init;
  InitPIC;
  InitPIC2;
  InitPIC3;
  Jam.Text:=FormatDateTime('HH:NN', Now);
  Main.M_Normal;
end;

procedure TCustomerComplainInvestigationForm.CetakUlangClick(Sender: TObject);
begin
  {
  if NoCCP.Text<>'' then RePrint(ReservedId.Text) else
  if Main.IsFormOpen('BookingList')=False then BookingList:=TBookingList.Create(nil,'Bus','Booking-Reprint');
  }
end;

procedure TCustomerComplainInvestigationForm.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TCustomerComplainInvestigationForm.KomplainGridSelectCell(Sender: TObject;
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

procedure TCustomerComplainInvestigationForm.KomplainDetailExit(Sender: TObject);
begin
  if Trim(KomplainDetail.Text)<>'' then  KomplainGrid.Cells[KomplainGrid.Col, KomplainGrid.Row]:=KomplainDetail.Text;
  KomplainDetail.Visible := False;
  KomplainDetail.Text:='';
  KomplainGrid.SetFocus;
end;

procedure TCustomerComplainInvestigationForm.KomplainDetailKeyDown(Sender: TObject;
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

procedure TCustomerComplainInvestigationForm.KomplainDetailKeyPress(Sender: TObject;
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

procedure TCustomerComplainInvestigationForm.KomplainGridSebelumSelectCell(
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

procedure TCustomerComplainInvestigationForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerComplainInvestigationForm.NoSJChange(Sender: TObject);
begin
  (*
  Main.M_Busy;
  CheckData;
  Main.M_Normal;
  *)
end;

procedure TCustomerComplainInvestigationForm.CariOrderClick(Sender: TObject);
begin
  if Main.IsFormOpen('CustomerComplainList')=False then CustomerComplainList:=TCustomerComplainList.Create(Self, 'INVESTIGATION-CREATE');
end;

procedure TCustomerComplainInvestigationForm.chkClosedClick(
  Sender: TObject);
begin
    if chkClosed.Checked then ClosedReason.Enabled:=True
    else if not chkClosed.Checked then ClosedReason.Enabled:=False
end;

procedure TCustomerComplainInvestigationForm.StrGrid3SelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) then begin
    R := StrGrid3.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid3.Left;
    R.Right := R.Right + StrGrid3.Left;
    R.Top := R.Top + StrGrid3.Top;
    R.Bottom := R.Bottom + StrGrid3.Top;
    with PIC do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid3.Cells[ACol,ARow])<>'' then Text:=StrGrid3.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

procedure TCustomerComplainInvestigationForm.PICExit(Sender: TObject);
begin
  if Trim(PIC.Text)<>'' then begin
    StrGrid3.Cells[IntCol,IntRow]:=PIC.Text;
    Calculate2;
  end;
  PIC.Text:='';
  PIC.Visible := False;
  StrGrid3.SetFocus;
end;

procedure TCustomerComplainInvestigationForm.RefreshEmployee;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(EmplArr,0);
    StrQry:='SELECT a.employee_id,a.name FROM wh_employee AS a '+
    'LEFT JOIN wh_empl_detail b ON b.empl_detail_id= '+
    '(SELECT MAX(empl_detail_id) FROM wh_empl_detail where employee_id=a.employee_id)  '+
    'LEFT JOIN wh_license_type c ON c.license_type_id=b.license_type_id '+
    'LEFT JOIN wh_empl_mutation d ON d.empl_mutation_id= '+
    '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation  WHERE (employee_id=a.employee_id) AND '+
    '((from_date<=DATEADD(dd, 1,GETDATE())) OR (GETDATE() BETWEEN from_date AND to_date) OR '+
    '(to_date BETWEEN GETDATE() AND DATEADD(dd, 1,GETDATE())))) '+
    'LEFT JOIN wh_employee j ON j.employee_id=a.reference '+
    'WHERE (d.employment_type_id=3) AND '+
    '(d.location_id=6) AND a.name like ''%'+PIC.Text+'%'' and a.active=1 ORDER BY a.name ';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(EmplArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      EmplArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      EmplArr[IntCount][1]:=Qry.FieldValues['name'];
//      EmplArr[IntCount][2]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ListEmpl.Items.Clear;
  for IntCount:=0 to Length(EmplArr)-1  do begin
    ListEmpl.Items.Add(EmplArr[IntCount][1]);
  end;
  Main.M_Normal;
end;

procedure TCustomerComplainInvestigationForm.PICKeyPress(
  Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if Key=#13 then begin
    if PIC.Text<>'' then begin
      with ListEmpl do begin
        Left:=PIC.Left;
        Top := PIC.Top+25;
        Visible:= True;
        BringToFront;
      end;
      RefreshEmployee;
    end else begin
      ListEmpl.Visible:=False;
    end;
    PICExit(nil);
    Calculate2;
  end;
  if (Key=#27) then begin
    PICExit(nil);
  end;
end;

procedure TCustomerComplainInvestigationForm.BitBtn1Click(Sender: TObject);
begin
  if Main.IsFormOpen ('EmployeeList')=False then EmployeeList:=TEmployeeList.Create(Self,'Office',9,0,'CustCompInvestigation');
end;

procedure TCustomerComplainInvestigationForm.ListEmplDblClick(
  Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
//  Qry:=TADOQuery.Create(Self);
//  Qry.Connection:=Main.MyConnection;
//  if Main.OpenDb then begin
//    SetLength(PartArr,0);
//    StrQry:='select kode_part_gp from wh_part where name ='+QuotedStr(ListPart.Items.Strings[ListPart.ItemIndex]);
//    Main.WriteLog('SQL :'+StrQry,2);
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
//  end;

//  StrGrid3.Cells[2,IntRow]:= Qry.FieldValues['employee_id'];
  StrGrid3.Cells[IntCol,IntRow]:=UpperCase(ListEmpl.Items.Strings[ListEmpl.ItemIndex]);
  ListEmpl.Visible:=False;
  StrGrid3.RowCount:=StrGrid3.RowCount+1;
//  Qry.Close;
end;

end.
