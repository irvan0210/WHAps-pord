unit VehicleAdminCheckListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ADODB,
  ExtCtrls, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB, ppDB,
  ComCtrls;

type
  TVehicleAdminCheckList = class(TForm)
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
    Detail: TGroupBox;
    StrGrid: TZColorStringGrid;
    Tanggal: TEdit;
    CheckSelect: TCheckBox;
    Label3: TLabel;
    NoAdministrasi: TEdit;
    TanggalStatus: TDateTimePicker;
    PanelUpdateSurat: TPanel;
    VehicleUpdate: TCheckBox;
    PanelExport: TPanel;
    ToXCel: TSpeedButton;
    TanggalBayar: TDateTimePicker;
    Description: TEdit;
    CheckPaid: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariAdminClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TambahArmadaClick(Sender: TObject);
    procedure HapusArmadaClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure CheckSelectClick(Sender: TObject);
    procedure TanggalStatusExit(Sender: TObject);
    procedure TanggalStatusKeyPress(Sender: TObject; var Key: Char);
    procedure ToXCelClick(Sender: TObject);
    procedure TanggalBayarExit(Sender: TObject);
    procedure TanggalBayarKeyPress(Sender: TObject; var Key: Char);
    procedure CheckPaidExit(Sender: TObject);
    procedure DescriptionExit(Sender: TObject);
  private
    { Private declarations }
    IsInput,Initiation,IsInputGrid,IsDirectUpdate:Boolean;
    IntRow,IntCol,MinRowGrid,MaxRow:Integer;
    AdmId,FormRequest,StatType:String;
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
    procedure Reprint(GoodReceive_Id:String);
    constructor Create(AOwner:TComponent;Admin_Id:String='';Form_Request:String='';Is_Input:Boolean=True);Overload;
  end;

var
  VehicleAdminCheckList: TVehicleAdminCheckList;

implementation

uses MainU, Math, RePrintFormU, VehicleList2U, VehicleForm2U,
  VehicleAdminListU;

{$R *.dfm}
constructor TVehicleAdminCheckList.Create(AOwner:TComponent;Admin_Id:String='';Form_Request:String='';Is_Input:Boolean=True);
begin
  AdmId:=Admin_Id;
  IsInput:=Is_Input;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: OrderForm='+Admin_Id+','+BoolToStr(Is_Input)+','+Form_Request,1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TVehicleAdminCheckList.Init;
begin
  NoAdmin.Text:='';
  Nama.Text:='';
  Tanggal.Text:='';
  TanggalStatus.Date:=Now();
  CheckSelect.Checked:=False;
  CheckPaid.Checked:=False;
  Description.Text:='';
  Tujuan.Text:='';
  Catatan.Text:='';
  NoAdministrasi.Text:='';
  MinRowGrid:=0;
  MaxRow:=1;
  IsDirectUpdate:=False;
  VehicleUpdate.Checked:=False;
  StatType:='';
  PanelUpdateSurat.Visible:=False;
end;

procedure TVehicleAdminCheckList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=15;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=35;
  StrGrid.ColWidths[8]:=20;
  StrGrid.ColWidths[9]:=75;
  StrGrid.ColWidths[10]:=20;
  StrGrid.ColWidths[11]:=20;
  StrGrid.ColWidths[12]:=75;
  StrGrid.ColWidths[13]:=100;
  StrGrid.ColWidths[14]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama STNK';
  StrGrid.Cells[2,0]:='Nama';
  StrGrid.Cells[3,0]:='Handphone';
  StrGrid.Cells[4,0]:='No Polisi';
  StrGrid.Cells[5,0]:='Kendaraan';
  StrGrid.Cells[6,0]:='Batch';
  StrGrid.Cells[7,0]:='Tahun';
  StrGrid.Cells[8,0]:='Byr';
  StrGrid.Cells[9,0]:='Tgl Bayar';
  StrGrid.Cells[10,0]:='Ok';
  StrGrid.Cells[11,0]:='Tdk';
  StrGrid.Cells[12,0]:='Tgl Lulus';
  StrGrid.Cells[13,0]:='Keterangan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount -1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVehicleAdminCheckList.SortGrid;
var IntCount,IntCount2,IntCount3,LastRow:Integer;
    IsEmpty:Boolean;
begin
  LastRow:=MinRowGrid;
  for IntCount:=MinRowGrid to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[0,IntCount]='') and (StrGrid.Cells[14,IntCount]='') then begin
      IntCount3:=IntCount;
      IsEmpty:=True;
      repeat
        if (StrGrid.Cells[0,IntCount3]<>'') and (StrGrid.Cells[14,IntCount3]<>'') then IsEmpty:=False;
        Inc(IntCount3);
      until (IntCount3>StrGrid.RowCount-1) or (not(IsEmpty));
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.Cells[IntCount2,IntCount]:=StrGrid.Cells[IntCount2,IntCount3-1];
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.Cells[IntCount2,IntCount3-1]:='';
      LastRow:=IntCount;
    end;
    if (StrGrid.Cells[14,IntCount]<>'') then StrGrid.Cells[0,IntCount]:=IntToStr(IntCount);
  end;
  for IntCount:=StrGrid.RowCount-1 to LastRow do
    if (StrGrid.Cells[0,IntCount]='') and (StrGrid.Cells[14,IntCount]='') then begin
      StrGrid.RowCount:=StrGrid.RowCount-1;
      Dec(MaxRow);
    end;
end;

procedure TVehicleAdminCheckList.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleAdminDetail '+QuotedStr(AdmId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then begin
      NoAdministrasi.Text:=Qry.FieldValues['admin_id'];
      Nama.Text:=Qry.FieldValues['name'];
      Tanggal.Text:=Qry.FieldValues['publish_date'];
      Tujuan.Text:=Qry.FieldValues['details'];
      if Qry.FieldValues['ref_admin_id']<>NULL then NoAdmin.Text:=Qry.FieldValues['ref_admin_id'];
      if Qry.FieldValues['remark']<>NULL then Catatan.Text:=Qry.FieldValues['remark'];
      if Qry.FieldValues['stat_type']<>NULL then StatType:=Qry.FieldValues['stat_type'];
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
      if Qry.FieldValues['license_plate']<>NULL then
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                     ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          StrGrid.Cells[4,IntCount]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                     ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['brand']<>NULL then
        StrGrid.Cells[5,IntCount]:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
      if Qry.FieldValues['batch_name']<>NULL then
        StrGrid.Cells[6,IntCount]:=Qry.FieldValues['batch_name'];
      if Qry.FieldValues['year']<>NULL then
      StrGrid.Cells[7,IntCount]:=Qry.FieldValues['year'];
      StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[9,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[10,IntCount].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[11,IntCount].HorizontalAlignment:=taCenter;
      if Qry.FieldValues['stat_paid']=1 then StrGrid.Cells[8,IntCount]:='v';
      if Qry.FieldValues['date_paid']<>NULL then StrGrid.Cells[9,IntCount]:=Qry.FieldValues['date_paid'];
      if Qry.FieldValues['stat']<2 then begin
        if Qry.FieldValues['stat']=1 then StrGrid.Cells[10,IntCount]:='v'
        else if Qry.FieldValues['stat']=0 then StrGrid.Cells[11,IntCount]:='v';
      end;
      if Qry.FieldValues['date_stat']<>NULL then StrGrid.Cells[12,IntCount]:=Qry.FieldValues['date_stat'];
      if Qry.FieldValues['remark']<>NULL then StrGrid.Cells[13,IntCount]:=Qry.FieldValues['remark'];
      StrGrid.Cells[14,IntCount]:=Qry.FieldValues['vehicle_id'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdminCheckList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('VehicleAdminChecklist_Form_CompanyId_'+CompanyId)+') and (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      if Qry.FieldValues['value_string']<>NULL then if Qry.FieldValues['value_string']=1 then VehicleUpdate.Checked:=True;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdminCheckList.Calculate;
begin

end;

procedure TVehicleAdminCheckList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if AdmId<>'' then begin
    LoadData;
  end;
  if IsInput then begin
    PanelUpdateSurat.Visible:=True;
    PanelExport.Visible:=False;
  end else begin
    DisableInput;
    PanelExport.Visible:=True;
  end;
  IsInputGrid:=IsInput;
end;

procedure TVehicleAdminCheckList.CariAdminClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleAdminList')=False then VehicleAdminList:=TVehicleAdminList.Create(Self,'','Admin-AddId');
end;

procedure TVehicleAdminCheckList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleAdminCheckList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleAdminCheckList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) and (NoAdministrasi.Text<>'') then begin
    if (ARow > MinRowGrid) then begin
      case ACol Of
        8:begin
            R := StrGrid.CellRect(ACol, ARow);
            R.Left := R.Left + StrGrid.Left;
            R.Right := R.Right + StrGrid.Left;
            R.Top := R.Top + StrGrid.Top;
            R.Bottom := R.Bottom + StrGrid.Top;
            with CheckPaid do begin
              Left:=R.Left + 5;
              Top := R.Top + 1;
              Width := 18;
              Height := 18;
              if StrGrid.Cells[ACol,ARow]='v' then CheckPaid.Checked:=True else CheckPaid.Checked:=False;
              Visible:= True;
              BringToFront;
              SetFocus;
            end;
          end;
        9:begin
            R := StrGrid.CellRect(ACol, ARow);
            R.Left := R.Left + StrGrid.Left;
            R.Right := R.Right + StrGrid.Left;
            R.Top := R.Top + StrGrid.Top;
            R.Bottom := R.Bottom + StrGrid.Top;
            with TanggalBayar do begin
              Left:=R.Left + 1 ;
              Top := R.Top + 1;
              Width := (R.Right + 1) - R.Left;
              Height := (R.Bottom + 1) - R.Top;
              if StrGrid.Cells[ACol,ARow]<>'' then TanggalBayar.Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
              Visible:= True;
              BringToFront;
              SetFocus;
            end;
          end;
        10,11:begin
              R := StrGrid.CellRect(ACol, ARow);
              R.Left := R.Left + StrGrid.Left;
              R.Right := R.Right + StrGrid.Left;
              R.Top := R.Top + StrGrid.Top;
              R.Bottom := R.Bottom + StrGrid.Top;
              with CheckSelect do begin
                Left:=R.Left + 5;
                Top := R.Top + 1;
                Width := 18;
                Height := 18;
                if StrGrid.Cells[ACol,ARow]='v' then CheckSelect.Checked:=True else CheckSelect.Checked:=False;
                Visible:= True;
                BringToFront;
                SetFocus;
              end;
            end;
        12:begin
            if StrGrid.Cells[ACol-2,ARow]='v' then begin
              R := StrGrid.CellRect(ACol, ARow);
              R.Left := R.Left + StrGrid.Left;
              R.Right := R.Right + StrGrid.Left;
              R.Top := R.Top + StrGrid.Top;
              R.Bottom := R.Bottom + StrGrid.Top;
              with TanggalStatus do begin
                Left:=R.Left + 1 ;
                Top := R.Top + 1;
                Width := (R.Right + 1) - R.Left;
                Height := (R.Bottom + 1) - R.Top;
                if StrGrid.Cells[ACol,ARow]<>'' then TanggalStatus.Date:=StrToDate(StrGrid.Cells[ACol,ARow]);
                Visible:= True;
                BringToFront;
                SetFocus;
              end;
            end;
          end;
       13:begin
            R := StrGrid.CellRect(ACol, ARow);
            R.Left := R.Left + StrGrid.Left;
            R.Right := R.Right + StrGrid.Left;
            R.Top := R.Top + StrGrid.Top;
            R.Bottom := R.Bottom + StrGrid.Top;
            with Description do begin
              Left:=R.Left + 1 ;
              Top := R.Top + 1;
              Width := (R.Right + 1) - R.Left;
              Height := (R.Bottom + 1) - R.Top;
              if StrGrid.Cells[ACol,ARow]<>'' then Text:=StrGrid.Cells[ACol,ARow];
              Visible:= True;
              BringToFront;
              SetFocus;
            end;
          end;
      end;
    end;
  end;
end;

procedure TVehicleAdminCheckList.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCheck,StrTanggal,StrTglBayar,StrSetStat,StrSetStatPaid,StrRemark:String;
    StrVhcId:String;
    IntCount,IntCount2,IntUpdate:Integer;
    IsOk:Boolean;
begin
  if (Nama.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    Main.M_Busy;
    IsOk:=True;
    for IntCount:=1 to StrGrid.RowCount-1 do begin
      if (StrGrid.Cells[4,IntCount]<>'') then
        if StrGrid.Cells[14,IntCount]='' then IsOk:=False;
    end;
    StrTransId:=NoAdministrasi.Text;
    if VehicleUpdate.Checked then begin
      if StatType='' then begin
        IntUpdate:=Main.MyMessageDlg('Data yang di update?',mtInformation,[mbYes,mbNo,mbCancel,mbAbort],['STNK','KIR','KIU','KIO'],'Update');
        case IntUpdate of
          {mbCancel}
          2:StrSetStat:='kiu';
          {mbAbort}
          3:StrSetStat:='kio';
          {mbYes}
          6:StrSetStat:='stnk';
          {mbNo}
          7:StrSetStat:='kir';
        end;
      end else StrSetStat:=StatType;
      for IntCount:=1 to StrGrid.RowCount-1 do begin
        if StrGrid.Cells[4,IntCount]<>'' then begin
          if StrGrid.Cells[9,IntCount]='v' then
            if StrGrid.Cells[12,IntCount]='' then IsOk:=False;
        end;
      end;
    end;
    if (Main.OpenDb) and (IsOk) then begin
      DisableInput;
      Main.TransStart;
      if StatType='' then begin
        StrQry:='UPDATE wh_admin SET stat_type='+QuotedStr(StrSetStat)+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                'WHERE (admin_id='+QuotedStr(StrTransId)+');';
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
      StrQry:='UPDATE wh_admin_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
              ' WHERE (admin_id='+QuotedStr(StrTransId)+') AND (status=1);';
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
          StrVhcId:=StrGrid.Cells[14,IntCount];
          StrCheck:='2';
          StrTanggal:='NULL';
          if StrGrid.Cells[8,IntCount]='v' then StrSetStatPaid:='1' else StrSetStatPaid:='0';
          if StrGrid.Cells[9,IntCount]<>'' then StrTglBayar:=QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[9,IntCount])))
          else StrTglBayar:='NULL';
          if StrGrid.Cells[10,IntCount]='v' then begin
            StrCheck:='1';
            StrTanggal:=QuotedStr(FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[12,IntCount])));
          end;
          if StrGrid.Cells[11,IntCount]='v' then StrCheck:='0';
          if StrGrid.Cells[13,IntCount]<>'' then StrRemark:=QuotedStr(StrGrid.Cells[13,IntCount]) else StrRemark:='NULL';
          StrQry:=StrQry+'INSERT INTO wh_admin_detail (admin_id,vehicle_id,stat,date_stat,stat_paid,date_paid,remark,update_user) VALUES ('+
                  QuotedStr(StrTransId)+','+QuotedStr(StrVhcId)+','+StrCheck+','+StrTanggal+','+StrSetStatPaid+','+StrTglBayar+','+StrRemark+','+QuotedStr(User)+');';
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
      if VehicleUpdate.Checked=True then begin
        StrQry:='';
        for IntCount:=1 to StrGrid.RowCount-1 do begin
          if StrGrid.Cells[4,IntCount]<>'' then begin
            StrVhcId:=StrGrid.Cells[14,IntCount];
            if (StrGrid.Cells[10,IntCount]='v') then begin
                StrTanggal:=FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[12,IntCount]));
                StrQry:=StrQry+'UPDATE wh_vhc_detail SET '+StrSetStat+'='+QuotedStr(StrTanggal)+
                        ',update_time=GETDATE(),update_user='+QuotedStr(User)+' WHERE vhc_detail_id='+
                        '(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE vehicle_id='+QuotedStr(StrVhcId)+');';
            end;
          end;
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
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,PChar('Data Berhasil disimpan'),'Administrasi Armada',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Data Gagal disimpan'+Chr(13)+Chr(13)+StrEMessage),'Administrasi Armada',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end else begin
      MessageBox(0,PChar('Data tidak boleh kosong'+Chr(13)+Chr(13)+'Silahkan periksa data anda'),'Administrasi Armada',MB_OK or MB_ICONERROR);
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TVehicleAdminCheckList.DisableInput;
begin
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TVehicleAdminCheckList.EnableInput;
begin
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TVehicleAdminCheckList.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TVehicleAdminCheckList.Reprint(GoodReceive_Id:String);
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
    Qry.CommandTimeout := 3600;
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

procedure TVehicleAdminCheckList.Button3Click(Sender: TObject);
begin
  Init;
  InitGrid;
  EnableInput;
end;

procedure TVehicleAdminCheckList.TambahArmadaClick(Sender: TObject);
begin
  if Main.IsFormOpen('VehicleForm2')=False then VehicleList2:=TVehicleList2.Create(Self,'Admin-VehicleAdd');
end;

procedure TVehicleAdminCheckList.HapusArmadaClick(Sender: TObject);
var IntCount:Integer;
begin
  if (IntRow>=MinRowGrid) and (StrGrid.Cells[14,IntRow]<>'') then begin
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,IntRow]:='';
  end;
  SortGrid;
end;

procedure TVehicleAdminCheckList.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;
  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  if (StrGrid.Cells[10,IntRow]='') then StrGrid.Cells[12,IntRow]:='';
  StrGrid.SetFocus;
end;

procedure TVehicleAdminCheckList.CheckSelectClick(Sender: TObject);
begin
  if IntCol=10 then begin
    if StrGrid.Cells[IntCol+1,IntRow]='v' then CheckSelect.Checked:=False;
  end;
  if IntCol=11 then begin
    if StrGrid.Cells[IntCol-1,IntRow]='v' then CheckSelect.Checked:=False;
  end;
end;

procedure TVehicleAdminCheckList.TanggalStatusExit(Sender: TObject);
begin
  if (StrGrid.Cells[10,IntRow]<>'') or (StrGrid.Cells[11,IntRow]<>'') then begin
    if StrGrid.Cells[IntCol,IntRow]='' then begin
      StrGrid.Cells[IntCol,IntRow]:=FormatDateTime('dd/mm/yyyy',TanggalStatus.Date);
    end else begin
      if TanggalStatus.Date<>StrToDate(StrGrid.Cells[IntCol,IntRow]) then
        StrGrid.Cells[IntCol,IntRow]:=FormatDateTime('dd/mm/yyyy',TanggalStatus.Date);
    end;
  end else StrGrid.Cells[IntCol,IntRow]:='';
  TanggalStatus.Date:=Now();
  TanggalStatus.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TVehicleAdminCheckList.TanggalStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    TanggalStatusExit(nil);
  end;
end;

procedure TVehicleAdminCheckList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TVehicleAdminCheckList.TanggalBayarExit(Sender: TObject);
begin
  if StrGrid.Cells[IntCol,IntRow]='' then begin
    StrGrid.Cells[IntCol,IntRow]:=FormatDateTime('dd/mm/yyyy',TanggalBayar.Date);
  end else begin
    if TanggalBayar.Date<>StrToDate(StrGrid.Cells[IntCol,IntRow]) then
      StrGrid.Cells[IntCol,IntRow]:=FormatDateTime('dd/mm/yyyy',TanggalBayar.Date);
  end;
  TanggalBayar.Date:=Now();
  TanggalBayar.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TVehicleAdminCheckList.TanggalBayarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    TanggalStatusExit(nil);
  end else if Key=#27 then begin
    TanggalBayar.Date:=Now();
    TanggalBayar.Visible:=False;
    StrGrid.Cells[IntCol,IntRow]:='';
    StrGrid.SetFocus;
  end else if (Key=#46) or (Key=#09) or (Key=#08) then begin
    TanggalBayar.Date:=Now();
    TanggalBayar.Visible:=False;
    StrGrid.Cells[IntCol,IntRow]:='';
    StrGrid.SetFocus;
  end;
end;

procedure TVehicleAdminCheckList.CheckPaidExit(Sender: TObject);
begin
  if CheckPaid.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;
  CheckPaid.Checked:=False;
  CheckPaid.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TVehicleAdminCheckList.DescriptionExit(Sender: TObject);
begin
  if Description.Text<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=Description.Text;
  end else begin
    if Description.Text<>StrGrid.Cells[IntCol,IntRow] then
      StrGrid.Cells[IntCol,IntRow]:='';
  end;
  Description.Text:='';
  Description.Visible:=False;
  StrGrid.SetFocus;
end;

end.
