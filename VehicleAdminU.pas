unit VehicleAdminU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ADODB,
  ExtCtrls, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB, ppDB,
  ComCtrls;

type
  TVehicleAdmin = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    GroupDetail: TGroupBox;
    Label1: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Catatan: TEdit;
    Nama: TEdit;
    Tujuan: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Button3: TButton;
    PanelCariAdmin: TPanel;
    CariAdmin: TSpeedButton;
    Panel1: TPanel;
    NoAdmin: TEdit;
    ppReport: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLogo: TppImage;
    ppTanggal: TppLabel;
    ppLabel19: TppLabel;
    ppNomor: TppLabel;
    ppCompany: TppLabel;
    ppLabel8: TppLabel;
    ppLabel29: TppLabel;
    ppLine1: TppLine;
    ppAddress: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppItemService: TppDBText;
    ppNo: TppDBText;
    ppOldQty: TppDBText;
    ppDetail: TppDBText;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppTransQty: TppDBText;
    ppFinalQty: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppReff: TppLabel;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    Tanggal: TDateTimePicker;
    Detail: TGroupBox;
    StrGrid: TZColorStringGrid;
    PanelTambahHapus: TPanel;
    TambahArmada: TSpeedButton;
    HapusArmada: TSpeedButton;
    Group: TComboBox;
    Label12: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariAdminClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure TambahArmadaClick(Sender: TObject);
    procedure HapusArmadaClick(Sender: TObject);
  private
    { Private declarations }
    IsInput,Initiation:Boolean;
    IntRow,IntCol,MinRowGrid,MaxRow:Integer;
    AdmId,FormRequest:String;
    GroupArr:Array of TArrString4;
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure RefreshCombo;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure SortGrid;
  public
    { Public declarations }
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetAdminId(Admin_Id:String);
    procedure Reprint(GoodReceive_Id:String);
    constructor Create(AOwner:TComponent;Admin_Id:String='';Form_Request:String='';Is_Input:Boolean=True);Overload;
  end;

var
  VehicleAdmin: TVehicleAdmin;

implementation

uses MainU, Math, RePrintFormU, VehicleList2U, VehicleForm2U,
  VehicleAdminListU;

{$R *.dfm}
constructor TVehicleAdmin.Create(AOwner:TComponent;Admin_Id:String='';Form_Request:String='';Is_Input:Boolean=True);
begin
  AdmId:=Admin_Id;
  IsInput:=Is_Input;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: OrderForm='+Admin_Id+','+BoolToStr(Is_Input)+','+Form_Request,1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TVehicleAdmin.Init;
begin
  NoAdmin.Text:='';
  Nama.Text:='';
  Tanggal.Date:=Now;
  Tujuan.Text:='';
  Catatan.Text:='';
  MinRowGrid:=1;
  MaxRow:=1;
end;

procedure TVehicleAdmin.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=11;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=140;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=70;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=40;
  StrGrid.ColWidths[9]:=70;
  StrGrid.ColWidths[10]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama STNK';
  StrGrid.Cells[2,0]:='Nama Pengemudi';
  StrGrid.Cells[3,0]:='Handphone';
  StrGrid.Cells[4,0]:='No Polisi';
  StrGrid.Cells[5,0]:='Merk Type';
  StrGrid.Cells[6,0]:='Type';
  StrGrid.Cells[7,0]:='Batch';
  StrGrid.Cells[8,0]:='Tahun';
  StrGrid.Cells[9,0]:='Tgl Bayar';
  for IntCount:=0 to StrGrid.ColCount -1 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;
end;

procedure TVehicleAdmin.SortGrid;
var IntCount,IntCount2,IntCount3,LastRow:Integer;
    IsEmpty:Boolean;
begin
  LastRow:=MinRowGrid;
  for IntCount:=MinRowGrid to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[0,IntCount]='') and (StrGrid.Cells[10,IntCount]='') then begin
      IntCount3:=IntCount+1;
      IsEmpty:=True;
      repeat
        if (StrGrid.Cells[0,IntCount3]<>'') and (StrGrid.Cells[10,IntCount3]<>'') then IsEmpty:=False;
        Inc(IntCount3);
      until (IntCount3>StrGrid.RowCount-1) or (not(IsEmpty));
      if not(IsEmpty) then begin
        for IntCount2:=0 to StrGrid.ColCount-1 do
          StrGrid.Cells[IntCount2,IntCount]:=StrGrid.Cells[IntCount2,IntCount3-1];
      end;
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.Cells[IntCount2,IntCount3-1]:='';
      LastRow:=IntCount;
    end;
    if (StrGrid.Cells[10,IntCount]<>'') then StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
  end;
  for IntCount:=StrGrid.RowCount-1 to LastRow do
    if (StrGrid.Cells[0,IntCount]='') and (StrGrid.Cells[10,IntCount]='') and (StrGrid.RowCount-1>MinRowGrid) then begin
      StrGrid.RowCount:=StrGrid.RowCount-1;
    end;
  MaxRow:=LastRow;
end;

procedure TVehicleAdmin.SetVehicleId(Vehicle_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=MaxRow;
    if Qry.RecordCount>0 then begin
      if StrGrid.RowCount<IntCount+1 then StrGrid.RowCount:=StrGrid.RowCount+1;
      StrGrid.Cells[0,IntCount]:=IntToStr(MaxRow);
      if Qry.FieldValues['reg_name']<> NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['reg_name'];
      if Qry.FieldValues['name']<> NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['name'];
      if Qry.FieldValues['cellular_no']<> NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['cellular_no'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      StrGrid.Cells[5,IntCount]:=Qry.FieldValues['brand'];
      StrGrid.Cells[6,IntCount]:=Qry.FieldValues['type'];
      StrGrid.Cells[7,IntCount]:=Qry.FieldValues['batch_name'];
      StrGrid.Cells[8,IntCount]:=Qry.FieldValues['year'];
      StrGrid.Cells[10,IntCount]:=Qry.FieldValues['vehicle_id'];
      Inc(IntCount);
    end;
    Qry.Close;
    MaxRow:=IntCount;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdmin.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleAdminDetail '+QuotedStr(AdmId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['ref_admin_id']<>NULL then NoAdmin.Text:=Qry.FieldValues['ref_admin_id'];
      Nama.Text:=Qry.FieldValues['name'];
      Tanggal.Date:=StrToDate(Qry.FieldValues['publish_date']);
      Tujuan.Text:=Qry.FieldValues['details'];
      if Qry.FieldValues['remark']<>NULL then Catatan.Text:=Qry.FieldValues['remark'];
    end;
    Qry.Close;
    StrQry:='EXEC GetVehicleAdminDetailList '+QuotedStr(AdmId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=MaxRow;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if StrGrid.RowCount<IntCount+1 then StrGrid.RowCount:=StrGrid.RowCount+1;
      StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
      if Qry.FieldValues['reg_name']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['reg_name'];
      if Qry.FieldValues['name']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['name'];
      if Qry.FieldValues['cellular_no']<>NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['cellular_no'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      StrGrid.Cells[5,IntCount]:=Qry.FieldValues['brand'];
      StrGrid.Cells[6,IntCount]:=Qry.FieldValues['type'];
      StrGrid.Cells[7,IntCount]:=Qry.FieldValues['batch_name'];
      StrGrid.Cells[8,IntCount]:=Qry.FieldValues['year'];
      if Qry.FieldValues['date_paid']<>NULL then StrGrid.Cells[9,IntCount]:=Qry.FieldValues['date_paid'];
      StrGrid.Cells[10,IntCount]:=Qry.FieldValues['vehicle_id'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    MaxRow:=IntCount;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdmin.SetAdminId(Admin_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntCount2,IntRes:Integer;
    IsOkOnly,IsTrue:Boolean;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    IntRes:=Main.MyMessageDlg('Pilihan data',mtInformation,[mbYes,mbNo,mbCancel,mbAbort,mbRetry,mbIgnore],['Yang Ok','Tdk Ok','Semua','Sudah Bayar','Belum Bayar','Tidak Jadi'],'Ambil Data');
    NoAdmin.Text:=Admin_Id;
    if IntRes<>5 then begin
      StrQry:='EXEC GetVehicleAdminDetailList '+QuotedStr(Admin_Id)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=MaxRow;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        IsTrue:=False;
        case IntRes of
            {semua data}
          2:IsTrue:=True;
            {sudah bayar}
          3:if Qry.FieldValues['date_paid']<>NULL then IsTrue:=True;
            {belum bayar}
          4:if Qry.FieldValues['date_paid']=NULL then IsTrue:=True;
            {ok}
          6:if Qry.FieldValues['stat']=1 then IsTrue:=True;
            {tidak ok}
          7:if Qry.FieldValues['stat']=0 then IsTrue:=True;
        end;
        if IsTrue then begin
          if StrGrid.RowCount<IntCount+1 then StrGrid.RowCount:=StrGrid.RowCount+1;
          StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
          if Qry.FieldValues['reg_name']<>NULL then StrGrid.Cells[1,IntCount]:=Qry.FieldValues['reg_name'];
          if Qry.FieldValues['name']<>NULL then StrGrid.Cells[2,IntCount]:=Qry.FieldValues['name'];
          if Qry.FieldValues['cellular_no']<>NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['cellular_no'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          StrGrid.Cells[5,IntCount]:=Qry.FieldValues['brand'];
          StrGrid.Cells[6,IntCount]:=Qry.FieldValues['type'];
          StrGrid.Cells[7,IntCount]:=Qry.FieldValues['batch_name'];
          StrGrid.Cells[8,IntCount]:=Qry.FieldValues['year'];
          if Qry.FieldValues['date_paid']<>NULL then StrGrid.Cells[9,IntCount]:=Qry.FieldValues['date_paid'];
          StrGrid.Cells[10,IntCount]:=Qry.FieldValues['vehicle_id'];
          Inc(IntCount);
        end;
        Qry.Next;
      end;
      Qry.Close;
    end;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdmin.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Group.Items.Clear;
  Group.Text:='';
  SetLength(GroupArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetGroup '+CompanyId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+1);
    GroupArr[0][0]:='0';
    GroupArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      GroupArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(GroupArr)-1 do
   Group.Items.Add(GroupArr[IntCount][1]);
 Group.ItemIndex:=Group.Items.Indexof('All');
end;

procedure TVehicleAdmin.Calculate;
begin

end;

procedure TVehicleAdmin.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if AdmId<>'' then begin
    LoadData;
  end;
  if not(IsInput) then DisableInput;
end;

procedure TVehicleAdmin.CariAdminClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self,'Admin-AddId');
end;

procedure TVehicleAdmin.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleAdmin.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleAdmin.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrRefAdminId,StrLocationId,StrCompanyId,StrDates,StrRemark,StrDetail,StrName:String;
    StrVhcId:String;
    IntCount,IntCount2:Integer;
    IsOk:Boolean;
begin
  if (Nama.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrLocationId:=LocationId;
      StrCompanyId:=CompanyId;
      StrName:=QuotedStr(Trim(Nama.Text));
      if Trim(NoAdmin.Text)<>'' then StrRefAdminId:=QuotedStr(Trim(NoAdmin.Text)) else StrRefAdminId:='NULL';
      StrDates:=QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
      if Trim(Tujuan.Text)<>'' then StrDetail:=QuotedStr(Trim(Tujuan.Text)) else StrDetail:='NULL';
      if Trim(Catatan.Text)<>'' then StrRemark:=QuotedStr(Trim(Catatan.Text)) else StrRemark:='NULL';
      for IntCount:=1 to StrGrid.RowCount-1 do begin
        if (StrGrid.Cells[4,IntCount]<>'') then
          if StrGrid.Cells[10,IntCount]='' then IsOk:=False;
      end;
      if IsOk then begin
        if AdmId<>'' then begin
          StrTransId:=AdmId;
          StrQry:='UPDATE wh_admin SET ref_admin_id='+StrRefAdminId+',name='+StrName+',publish_date='+StrDates+
                         ',details='+StrDetail+',remark='+StrRemark+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                         ' WHERE admin_id='+QuotedStr(StrTransId)+';';
          StrQry:=StrQry+'UPDATE wh_admin_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                         ' WHERE (status=1) and (admin_id='+QuotedStr(StrTransId)+');';
        end else begin
          StrQry:='SELECT RIGHT(MAX(admin_id),4) AS admin_id FROM wh_admin '+
                'WHERE company_id='+StrCompanyId+' AND location_id='+StrLocationId+
                ' AND admin_id LIKE '+QuotedStr('AD'+StrCompanyId+StrLocationId+
                FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+'____')+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['admin_id']<>NULL then begin
             StrTransId:=Qry.FieldValues['admin_id'];
             StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          end else begin
             StrTransId:='0001';
          end;
          Qry.Close;
          StrTransId:='AD'+StrCompanyId+StrLocationId+FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+StrTransId;
          StrQry:='';
          StrQry:='INSERT INTO wh_admin(admin_id,company_id,location_id,ref_admin_id,name,publish_date'+
                         ',details,remark,update_user) VALUES '+
                         '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrRefAdminId+','+StrName+
                         ','+StrDates+','+StrDetail+','+StrRemark+','+QuotedStr(User)+');';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=E.Message;
          end;
        end;
        StrQry:='';
        for IntCount:=1 to StrGrid.RowCount-1 do begin
          if StrGrid.Cells[4,IntCount]<>'' then begin
            StrVhcId:=StrGrid.Cells[10,IntCount];
            StrQry:=StrQry+'INSERT INTO wh_admin_detail (admin_id,vehicle_id,update_user) VALUES ('+
                    QuotedStr(StrTransId)+','+QuotedStr(StrVhcId)+','+QuotedStr(User)+');';
          end
        end;
        if StrQry<>'' then begin
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMessage:=E.Message;
            end;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,PChar('Data Berhasil disimpan'),'Administrasi Armada',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Data Gagal disimpan'+Chr(13)+Chr(13)+StrEMessage),'Administrasi Armada',MB_OK or MB_ICONERROR);
          EnableInput;
        end;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TVehicleAdmin.DisableInput;
begin
  PanelCariAdmin.Enabled:=False;
  PanelTambahHapus.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TVehicleAdmin.EnableInput;
begin
  PanelCariAdmin.Enabled:=True;
  PanelTambahHapus.Enabled:=True;
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TVehicleAdmin.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppCompany.Caption:=Qry.FieldValues['company_name'];
      ppAddress.Lines.Add(Qry.FieldValues['address']);
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdmin.Reprint(GoodReceive_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Good Receive Note';
  RePrintForm.ReportId:=GoodReceive_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetGoodsReceiveResume  '+QuotedStr(GoodReceive_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppNo.Caption:=GoodReceive_Id;
        ppTanggal.Caption:=Qry.FieldValues['receive_dates'];
      end;
      Qry.Close;
      StrQry:='EXEC GetGoodsReceiveDetailPrint  '+QuotedStr(GoodReceive_id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;

procedure TVehicleAdmin.Button3Click(Sender: TObject);
begin
  Init;
  InitGrid;
  EnableInput;
end;

procedure TVehicleAdmin.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[1,IntRow]<>'') then begin
    Vehicleform2:=TVehicleForm2.Create(Self,StrGrid.Cells[10,IntRow]);
  end;
end;

procedure TVehicleAdmin.TambahArmadaClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleForm2')=False then VehicleList2:=TVehicleList2.Create(Self,'Admin-VehicleAdd',StrToInt(GroupArr[Group.ItemIndex][0]));
end;

procedure TVehicleAdmin.HapusArmadaClick(Sender: TObject);
var IntCount:Integer;
begin
  if (IntRow>=MinRowGrid) and (StrGrid.Cells[8,IntRow]<>'') then begin
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,IntRow]:='';
  end;
  SortGrid;
end;

end.
