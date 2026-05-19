unit CustomerComplainCorrectiveActionPlanU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ZColorStringGrid, Grids, ExtCtrls, Buttons, WHUnit,
  ADODB;

type
  TCustComplainCorrectiveActionPlan = class(TForm)
    LabelKeluhan: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CariOrder: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    NoBody: TEdit;
    Customer: TEdit;
    Route: TMemo;
    Seat: TEdit;
    FromDate: TEdit;
    ToDate: TEdit;
    Customer_Id: TEdit;
    NoSJ: TEdit;
    NoResvDetId: TEdit;
    NoResvDetPkgId: TEdit;
    KomplainGrid: TStringGrid;
    DriverDisp: TEdit;
    NoPolisi: TEdit;
    NoCCP: TEdit;
    GbKategori: TPanel;
    cbKebersihan: TCheckBox;
    cbFasilitas: TCheckBox;
    cbPelayanan: TCheckBox;
    cbPenjemputan: TCheckBox;
    cbMogok: TCheckBox;
    grpinvestigasi: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel2: TPanel;
    Label16: TLabel;
    Investigasi: TMemo;
    Penanganan: TMemo;
    eStaff: TEdit;
    eTeknikal: TEdit;
    Panel3: TPanel;
    StrGrid3: TZColorStringGrid;
    TglInvestigasi: TDateTimePicker;
    grpperbaikn: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Perbaikan: TMemo;
    StrGrid4: TZColorStringGrid;
    TglPerbaikan: TDateTimePicker;
    Panel4: TPanel;
    Selesai: TButton;
    Bersihkan: TButton;
    Simpan: TButton;
    Tanggal: TEdit;
    grprencana: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    RencanaTindakanPerbaikan: TMemo;
    StrGrid5: TZColorStringGrid;
    PIC: TEdit;
    ListEmpl: TListBox;
    TglRencanaTindakanPerbaikan: TDateTimePicker;
    Label21: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lbl1: TLabel;
    Label27: TLabel;
    Panel5: TPanel;
    ChkCrew: TCheckBox;
    ChkStaf: TCheckBox;
    ChkTeknikal: TCheckBox;
    cbDriverBermasalah: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure PICExit(Sender: TObject);
    procedure PICKeyPress(Sender: TObject; var Key: Char);
    procedure ListEmplDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariOrderClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure StrGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    EmplArr:Array of TArrString5;
    WOArr:Array of TArrString10;
    IntRow,CompId,MaxComponent,TotalDays,IntCol:Integer;
    CCPID,StatusForm:String;
    procedure InitPICRencanaTindakan;
    procedure InitPICPerbaikan;
    procedure InitPICInvestigasi;
    procedure Init;
    procedure RefreshEmployee;
    procedure Calculate2;
    procedure Update;
    procedure InputDisabled;
    procedure InputEnabled;
    procedure LoadData;
  public
    { Public declarations }
    procedure SetData2(CCP_Id:String);
  constructor Create(AOwner:TComponent;CCP_Id:String='';Status_Form:String='');Overload;end;
var
  CustComplainCorrectiveActionPlan: TCustComplainCorrectiveActionPlan;
  MinRowGrid,IntMaxRow,CustComplainCorrectiveActionPlanID : Integer ;
  StrTransId: string;

implementation

uses
  MainU, CustomerComplainCorrectionListU;

{$R *.dfm}
constructor TCustComplainCorrectiveActionPlan.Create(AOwner:TComponent;
CCP_Id:String='';Status_Form:String='');
begin
  CCPId:=CCP_Id;
  StatusForm:=Status_Form;
//  Main.WriteLog('Form Open: CustomerComplainInvestigationForm='+''''+','+CCP_Id+IntToStr(StateStatus),1);
//  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustComplainCorrectiveActionPlan.SetData2(CCP_Id:String);
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
    StrQry:='SELECT * FROM wh_cust_complain_investigation WHERE cust_complain_id= '+QuotedStr(CCP_Id)+' AND '+
            'status=1 AND renc_tindakan_perbaikan is NOT NULL;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    StrQry:='SELECT * FROM wh_cust_complain_investigation WHERE cust_complain_id= '+QuotedStr(CCP_Id)+' AND '+
            'status=1 AND handling is NULL;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;

    if (Qry.RecordCount>0)  then
    begin
      Qry.Close;
      MessageBox(0,PChar('Complain sudah dilakukan Rencana Tindakan Perbaikan'),'Customer Complain, Correction',MB_OK or MB_ICONWARNING);
    end else if (Qry2.RecordCount>0) then
    begin
      Qry2.Close;
      MessageBox(0,PChar('Complain belum dilakukan Perbaikan'),'Customer Complain, Correction',MB_OK or MB_ICONWARNING);
    end else
    begin

      StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(CCP_Id)+',@TypeData=2 ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Close;
      Qry.Open;
      IntCount:=0;
      SetLength(WOArr,Qry.RecordCount);
      if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
        StrTransId:=Qry.FieldValues['cust_complain_investigation_id'];

        NoCCP.Text:= Qry.FieldValues['cust_complain_id'];
        //UserName.Text:= Qry.FieldValues['UpdateUser'];
        NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

        NoBody.Text:=Qry.FieldValues['body_id'];
        NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
        DriverDisp.Text:=Qry.FieldValues['name'];
        Customer.Text:=Qry.FieldValues['customer_name'];
        Customer_Id.Text:=Qry.FieldValues['customer_id'];
        TotalDays:=Qry.FieldValues['day'];

        NoResvDetId.Text:=Qry.FieldValues['reserved_order_detail_id'];

        Tanggal.Text:=FormatDateTime('DD/MM/YYYY',VarToDateTime(Qry.FieldValues['UpdateDate']));
        Seat.Text:=Qry.FieldValues['seat'];
        Route.Text:=Qry.FieldValues['route'];
        FromDate.Text:=Qry.FieldValues['from_dates'];
        ToDate.Text:=Qry.FieldValues['to_dates'];
        if KomplainGrid.RowCount<IntCount+1 then KomplainGrid.RowCount:=KomplainGrid.RowCount+1;
        KomplainGrid.Cells[0,IntCount]:=Qry.FieldValues['complain_desc'];
        Investigasi.Text:=Qry.FieldValues['investigation'];
        TglInvestigasi.Date:=Qry.FieldValues['investigation_date'];
        Perbaikan.Text:=Qry.FieldValues['handling'];
        TglPerbaikan.Date:=Qry.FieldValues['handling_date'];


        if (Qry.FieldValues['kebersihan_status'])=1 then cbKebersihan.Checked:=True else cbKebersihan.Checked:=False;
        if (Qry.FieldValues['fasilitas_status'])=1 then cbFasilitas.Checked:=True else cbFasilitas.Checked:=False;
        if (Qry.FieldValues['pelayanan_status'])=1 then cbPelayanan.Checked:=True else cbPelayanan.Checked:=False;
        if (Qry.FieldValues['penjemputan_status'])=1 then cbPenjemputan.Checked:=True else cbPenjemputan.Checked:=False;
        if (Qry.FieldValues['mogok_status'])=1 then cbMogok.Checked:=True else cbMogok.Checked:=False;
        if (Qry.FieldValues['driver_bermasalah_status'])=1 then cbDriverBermasalah.Checked:=True else cbDriverBermasalah.Checked:=False;

        if (Qry.FieldValues['iscrew'])=1 then ChkCrew.Checked:=True else ChkCrew.Checked:=False;
        if (Qry.FieldValues['isstaf'])=1 then ChkStaf.Checked:=True else ChkStaf.Checked:=False;
        if (Qry.FieldValues['isteknikal'])=1 then ChkTeknikal.Checked:=True else ChkTeknikal.Checked:=False;



        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;

      StrQry:='select b.name from wh_cust_complain_investigation_pic a '+
              'left join wh_employee b on a.employee_id=b.employee_id  where '+
      'cust_complain_investigation_id= '+QuotedStr(StrTransId)+' and status=1 and type=2;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGrid4.RowCount<IntCount+1 then StrGrid4.RowCount:=StrGrid4.RowCount+1;
        StrGrid4.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid4.Cells[1,IntCount]:=UpperCase(Qry2.FieldValues['name']);
        StrGrid4.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        Qry2.Next;
        Inc(IntCount);

      end;
      Qry2.Close;

      StrQry:='select b.name from wh_cust_complain_investigation_pic a '+
              'left join wh_employee b on a.employee_id=b.employee_id  where '+
      'cust_complain_investigation_id= '+QuotedStr(StrTransId)+' and status=1 and type=1;';
      Qry2.SQL.Clear;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount:=1;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

        if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
        StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
        StrGrid3.Cells[1,IntCount]:=UpperCase(Qry2.FieldValues['name']);
        StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
        Qry2.Next;
        Inc(IntCount);

      end;
      Qry2.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustComplainCorrectiveActionPlan.LoadData;
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
    StrQry:='EXEC GetCustomerComplainRefundDetail '+QuotedStr(CCPID)+',@TypeData=2 ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Close;
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not (Qry.Eof) do begin
      StrTransId:=Qry.FieldValues['cust_complain_investigation_id'];

      NoCCP.Text:= Qry.FieldValues['cust_complain_id'];
      //UserName.Text:= Qry.FieldValues['UpdateUser'];
      NoSJ.Text:=(Qry.FieldValues['vhc_trans_id']);

      NoBody.Text:=Qry.FieldValues['body_id'];
      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      DriverDisp.Text:=Qry.FieldValues['name'];
      Customer.Text:=Qry.FieldValues['customer_name'];
      Customer_Id.Text:=Qry.FieldValues['customer_id'];
      TotalDays:=Qry.FieldValues['day'];

      NoResvDetId.Text:=Qry.FieldValues['reserved_order_detail_id'];

      Tanggal.Text:=FormatDateTime('DD/MM/YYYY',VarToDateTime(Qry.FieldValues['UpdateDate']));
      Seat.Text:=Qry.FieldValues['seat'];
      Route.Text:=Qry.FieldValues['route'];
      FromDate.Text:=Qry.FieldValues['from_dates'];
      ToDate.Text:=Qry.FieldValues['to_dates'];
      if KomplainGrid.RowCount<IntCount+1 then KomplainGrid.RowCount:=KomplainGrid.RowCount+1;
      KomplainGrid.Cells[0,IntCount]:=Qry.FieldValues['complain_desc'];
      Investigasi.Text:=Qry.FieldValues['investigation'];
      TglInvestigasi.Date:=Qry.FieldValues['investigation_date'];
      Perbaikan.Text:= Qry.FieldValues['handling'];
      TglPerbaikan.Date:=Qry.FieldValues['handling_date'];
      RencanaTindakanPerbaikan.Text:=Qry.FieldValues['renc_tindakan_perbaikan'];
      TglRencanaTindakanPerbaikan.Date:=Qry.FieldValues['renc_tindakan_perbaikan_date'];

      if (Qry.FieldValues['kebersihan_status'])=1 then cbKebersihan.Checked:=True else cbKebersihan.Checked:=False;
      if (Qry.FieldValues['fasilitas_status'])=1 then cbFasilitas.Checked:=True else cbFasilitas.Checked:=False;
      if (Qry.FieldValues['pelayanan_status'])=1 then cbPelayanan.Checked:=True else cbPelayanan.Checked:=False;
      if (Qry.FieldValues['penjemputan_status'])=1 then cbPenjemputan.Checked:=True else cbPenjemputan.Checked:=False;
      if (Qry.FieldValues['mogok_status'])=1 then cbMogok.Checked:=True else cbMogok.Checked:=False;

      if (Qry.FieldValues['iscrew'])=1 then ChkCrew.Checked:=True else ChkCrew.Checked:=False;
      if (Qry.FieldValues['isstaf'])=1 then ChkStaf.Checked:=True else ChkStaf.Checked:=False;
      if (Qry.FieldValues['isteknikal'])=1 then ChkTeknikal.Checked:=True else ChkTeknikal.Checked:=False;

      if (Qry.FieldValues['is_closed'])=1 then begin
        Simpan.Enabled:=False;
        Bersihkan.Enabled:=False;
        grpperbaikn.Enabled:=False;
        CariOrder.Enabled:=False;
      end;

      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;

    StrQry:='select b.name from wh_cust_complain_investigation_pic a '+
            'left join wh_employee b on a.employee_id=b.employee_id  where '+
    'cust_complain_investigation_id= '+QuotedStr(StrTransId)+' and status=1 and type=1;';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGrid3.RowCount<IntCount+1 then StrGrid3.RowCount:=StrGrid3.RowCount+1;
      StrGrid3.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid3.Cells[1,IntCount]:=UpperCase(Qry2.FieldValues['name']);
      StrGrid3.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      Qry2.Next;
      Inc(IntCount);
    end;

    StrQry:='select b.name from wh_cust_complain_investigation_pic a '+
            'left join wh_employee b on a.employee_id=b.employee_id  where '+
    'cust_complain_investigation_id= '+QuotedStr(StrTransId)+' and status=1 and type=2;';
    Qry2.Close;
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGrid4.RowCount<IntCount+1 then StrGrid4.RowCount:=StrGrid4.RowCount+1;
      StrGrid4.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid4.Cells[1,IntCount]:=UpperCase(Qry2.FieldValues['name']);
      StrGrid4.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;

    StrQry:='select b.name from wh_cust_complain_investigation_pic a '+
            'left join wh_employee b on a.employee_id=b.employee_id  where '+
    'cust_complain_investigation_id= '+QuotedStr(StrTransId)+' and status=1 and type=3;';
    Qry2.Close;
    Qry2.SQL.Clear;
    Qry2.SQL.Add(StrQry);
    Qry2.Open;
    IntCount:=1;
    if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin

      if StrGrid5.RowCount<IntCount+1 then StrGrid5.RowCount:=StrGrid5.RowCount+1;
      StrGrid5.Cells[0,IntCount]:= IntToStr(IntCount);
      StrGrid5.Cells[1,IntCount]:=UpperCase(Qry2.FieldValues['name']);
      StrGrid5.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
      Qry2.Next;
      Inc(IntCount);

    end;
    Qry2.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustComplainCorrectiveActionPlan.InputDisabled;
begin
  Simpan.Enabled:=False;
  grprencana.Enabled:=False;
end;

procedure TCustComplainCorrectiveActionPlan.InputEnabled;
begin
  Simpan.Enabled:=True;
  grprencana.Enabled:=True;
end;

procedure TCustComplainCorrectiveActionPlan.Init;
var IntCount:Integer;
begin
  NoCCP.Text:='';
  Customer.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  DriverDisp.Text:='';
  FromDate.Text:='';
  ToDate.Text:='';
  Route.Text:='';
  Seat.Text:='';
  Investigasi.Clear;
  Perbaikan.Clear;
  DriverDisp.ReadOnly:=True;
  NoPolisi.ReadOnly:=True;
  TglInvestigasi.Date:=Now;
  TglPerbaikan.Date:=Now;
  TglRencanaTindakanPerbaikan.Date:=Now;
  RencanaTindakanPerbaikan.Text:='';
  ChkCrew.Checked:=False;
  ChkStaf.Checked:=False;
  ChkTeknikal.Checked:=False;

  for IntCount:=0 to KomplainGrid.RowCount-1 do
    KomplainGrid.Cells[0,IntCount]:='';
  KomplainGrid.RowCount:=1;

  cbKebersihan.Checked:=False;
  cbFasilitas.Checked:=False;
  cbPelayanan.Checked:=False;
  cbPenjemputan.Checked:=False;

  Tanggal.Text:='';
  IntMaxRow:=10;
end;

procedure TCustComplainCorrectiveActionPlan.Update;
var
StrQry,StrQry2,StrMsg,StrEMsg:string;
Qry,Qry2:TADOQuery;
IsOk: Boolean;
IntCount:Integer;
begin
  Main.M_Busy;
  if Main.OpenDb then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry2:=TADOQuery.Create(Self);
    Qry2.Connection:=Main.MyConnection;
    Main.TransStart;
    StrQry:='UPDATE wh_cust_complain_investigation SET renc_tindakan_perbaikan='+QuotedStr(RencanaTindakanPerbaikan.Text)+', '+
            'renc_tindakan_perbaikan_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglRencanaTindakanPerbaikan.Date))+
            ' WHERE (cust_complain_investigation_id='+QuotedStr(StrTransId)+') AND (status=1);';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
      IsOk:=True;
    except
      on E:Exception do begin
        IsOk:=False;
        StrMsg:='Gagal Simpan Perbaikan Customer Complain';
        StrEMsg:=E.Message;
      end;
    end;

    StrQry:='';
    if NoCCP.Text<>'' then begin
      StrQry:='UPDATE wh_cust_complain_investigation_pic SET status=0 '+
              'WHERE cust_complain_investigation_id='+QuotedStr(StrTransId)+' AND type=3;';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        IsOk:=True;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:=E.Message;
        end;
      end;
    end;
    StrQry:='';

    for IntCount:=1 to StrGrid4.RowCount do begin
      if Trim(StrGrid4.Cells[1,IntCount])<>'' then
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
        '(d.location_id='+LocationId+') AND a.name = '+QuotedStr(StrGrid5.Cells[1,IntCount])+' and a.active=1 ';
        Qry2.Close;
        Qry2.SQL.Clear;
        Qry2.SQL.Add(StrQry2);
        Qry2.Open;

        StrQry:=StrQry+' INSERT INTO wh_cust_complain_investigation_pic (cust_complain_investigation_id,'+
                'employee_id,status,submit_date,submit_user,update_user,type)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(Qry2.FieldValues['employee_id'])+',1,'+
                'getdate(),'+QuotedStr(User)+','+ QuotedStr(User)+',3); ';
      end;
    end;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
      IsOk:=True;
    except
      on E:Exception do begin
        IsOk:=False;
        StrMsg:=E.Message;
      end;
    end;

    if IsOk then begin
      Main.TransCommit;
      Main.M_Normal;
      MessageBox(0,'Perbaikan Customer Complain berhasil disimpan','Customer Complain (Correction)',MB_OK );
      InputDisabled;

    end else begin
      Main.TransRollback;
      Main.M_Normal;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka CCP',MB_OK or MB_ICONERROR);
    end;
  end;

end;

procedure TCustComplainCorrectiveActionPlan.InitPICRencanaTindakan;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid5.RowCount-1 do
    for IntCount2:=0 to StrGrid5.ColCount-1 do
      StrGrid5.Cells[IntCount2,IntCount]:='';

  StrGrid5.RowCount:=3;
  StrGrid5.ColWidths[0]:=20;
  StrGrid5.ColWidths[1]:=328;

  StrGrid5.Cells[0,0]:='No';
  StrGrid5.Cells[1,0]:='Nama';
  StrGrid5.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid5.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid5.Cells[IntCount,2]:='';
    StrGrid5.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
  StrGrid5.Cells[0,1]:='1';
  StrGrid5.Cells[1,1]:=UpperCase(FullName);
end;

procedure TCustComplainCorrectiveActionPlan.InitPICInvestigasi;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid3.RowCount-1 do
    for IntCount2:=0 to StrGrid3.ColCount-1 do
      StrGrid3.Cells[IntCount2,IntCount]:='';

  StrGrid3.RowCount:=2;
  StrGrid3.ColWidths[0]:=20;
  StrGrid3.ColWidths[1]:=328;

  StrGrid3.Cells[0,0]:='No';
  StrGrid3.Cells[1,0]:='Nama';
  StrGrid3.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid3.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid3.Cells[IntCount,2]:='';
    StrGrid3.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
end;

procedure TCustComplainCorrectiveActionPlan.InitPICPerbaikan;
//var IntCount:Integer;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid4.RowCount-1 do
    for IntCount2:=0 to StrGrid4.ColCount-1 do
      StrGrid4.Cells[IntCount2,IntCount]:='';

  StrGrid4.RowCount:=3;
  StrGrid4.ColWidths[0]:=20;
  StrGrid4.ColWidths[1]:=328;

  StrGrid4.Cells[0,0]:='No';
  StrGrid4.Cells[1,0]:='Nama';
  StrGrid4.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid4.CellStyle[1,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 1 do begin
    StrGrid4.Cells[IntCount,2]:='';
    StrGrid4.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
end;

procedure TCustComplainCorrectiveActionPlan.Calculate2;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid5.RowCount-1 do
    if (Trim(StrGrid5.Cells[1,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid5.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGrid5.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGrid5.Cells[0,IntCount]:='';
end;

procedure TCustComplainCorrectiveActionPlan.RefreshEmployee;
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
    '(d.location_id='+LocationId+') AND a.name like ''%'+PIC.Text+'%'' and a.active=1 ORDER BY a.name ';
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

procedure TCustComplainCorrectiveActionPlan.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCustComplainCorrectiveActionPlan.BersihkanClick(
  Sender: TObject);
begin
  Init;
  InitPICInvestigasi;
  InitPICPerbaikan;
  Enabled;
end;

procedure TCustComplainCorrectiveActionPlan.PICExit(Sender: TObject);
begin
  if Trim(PIC.Text)<>'' then begin
    StrGrid5.Cells[IntCol,IntRow]:=PIC.Text;
    Calculate2;
  end;
  PIC.Text:='';
  PIC.Visible := False;
  StrGrid5.SetFocus;
end;

procedure TCustComplainCorrectiveActionPlan.PICKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TCustComplainCorrectiveActionPlan.ListEmplDblClick(
  Sender: TObject);
begin
  StrGrid5.Cells[IntCol,IntRow]:=UpperCase(ListEmpl.Items.Strings[ListEmpl.ItemIndex]);
  ListEmpl.Visible:=False;
  //StrGrid5.RowCount:=StrGrid5.RowCount+1;
end;

procedure TCustComplainCorrectiveActionPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustComplainCorrectiveActionPlan.FormShow(Sender: TObject);
begin
  Init;
  InitPICInvestigasi;
  InitPICPerbaikan;
  InitPICRencanaTindakan;
  Simpan.Enabled:=True;
  Bersihkan.Enabled:=True;
  grprencana.Enabled:=True;
  if (StatusForm='VIEW') then
  begin
    Simpan.Enabled:=False;
    Bersihkan.Enabled:=False;
    grprencana.Enabled:=False;
    CariOrder.Enabled:=False;
    LoadData;
  end else if (StatusForm='UPDATE') then
  begin
    Simpan.Enabled:=True;
    Bersihkan.Enabled:=False;
    grprencana.Enabled:=True;
    CariOrder.Enabled:=False;
    LoadData;
  end;
end;

procedure TCustComplainCorrectiveActionPlan.CariOrderClick(
  Sender: TObject);
begin
 if Main.IsFormOpen('CustomerComplainCorrectionList')=False then CustomerComplainCorrectionList:=TCustomerComplainCorrectionList.Create(Self,'CREATE-CORRECTIVE','',4);
end;

procedure TCustComplainCorrectiveActionPlan.SimpanClick(Sender: TObject);
begin
 if RencanaTindakanPerbaikan.Text='' then
  begin
    MessageBox(0,PChar('Rencana TindakanPerbaikan wajib diisi !!'),'Customer Complain [Corrective Action Plan]',MB_OK or MB_ICONERROR);
  end else begin
    Update;
  end;
end;

procedure TCustComplainCorrectiveActionPlan.StrGrid5SelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
//  if IsInputGrid then begin
  if (ACol = 1) and (ARow > MinRowGrid) then begin
    R := StrGrid5.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid5.Left;
    R.Right := R.Right + StrGrid5.Left;
    R.Top := R.Top + StrGrid5.Top;
    R.Bottom := R.Bottom + StrGrid5.Top;
    with PIC do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid5.Cells[ACol,ARow])<>'' then Text:=StrGrid5.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
end;

end.
