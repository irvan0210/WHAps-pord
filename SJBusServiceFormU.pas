unit SJBusServiceFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit, ExtCtrls, QRCtrls, QuickRpt, StrUtils,
  Grids;

type
  TSJBusServiceForm = class(TForm)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label1: TLabel;
    Tanggal: TEdit;
    NoSPJ: TEdit;
    Label2: TLabel;
    NoBody: TComboBox;
    Label15: TLabel;
    TelpHP: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    GroupTujuan: TPanel;
    Service: TRadioButton;
    KEUR: TRadioButton;
    Tujuan: TComboBox;
    LabelLokasi: TLabel;
    TujuanDisp: TEdit;
    Label16: TLabel;
    GroupPanel: TPanel;
    Label10: TLabel;
    Catatan: TMemo;
    Panel1: TPanel;
    NoPKB: TEdit;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    Selesai: TButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QNoOrder: TQRLabel;
    QCopy: TQRLabel;
    QRBand3: TQRBand;
    QTandaPetugas: TQRLabel;
    QMessage: TQRLabel;
    QCatatan: TQRLabel;
    QTanggal: TQRLabel;
    QRBand2: TQRBand;
    QJamReservasi: TQRLabel;
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
    QNoSPJ: TQRLabel;
    Label4: TLabel;
    Cari: TEdit;
    BBM: TRadioButton;
    GroupDriver: TPanel;
    DriverCheck: TRadioButton;
    NonDriverCheck: TRadioButton;
    Pengemudi: TComboBox;
    NoPolisi: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure NamaPengemudiKeyPress(Sender: TObject; var Key: Char);
    procedure TelpHPKeyPress(Sender: TObject; var Key: Char);
    procedure ServiceKeyPress(Sender: TObject; var Key: Char);
    procedure KEURKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure TujuanChange(Sender: TObject);
    procedure TujuanKeyPress(Sender: TObject; var Key: Char);
    procedure KEURClick(Sender: TObject);
    procedure ServiceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DriverCheckClick(Sender: TObject);
    procedure NonDriverCheckClick(Sender: TObject);
    procedure BBMClick(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString14;
    TujuanArr,DriverArr:Array of TArrString4;
    KMOrdo:String;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure RefreshDriver;
    procedure SetMobil;
    procedure EnableInput;
    procedure DisableInput;
    procedure PreparePrint;
    procedure PreparePrintData;
    procedure PopOut(Height:Integer);
    procedure PopIn(Height:Integer);
  public
    { Public declarations }
    procedure CetakUlangSPJ(NoSPJ:String);
  end;

var
  SJBusServiceForm: TSJBusServiceForm;

implementation

{$R *.dfm}

Uses MainU, RePrintFormU, SPJServReprintU;

procedure TSJBusServiceForm.Init;
begin
  EnableInput;
  NoBody.Enabled:=True;
  Catatan.Enabled:=True;
  TelpHP.Enabled:=True;
  NoBody.Items.Clear;
  NoBody.ItemIndex:=0;
  NoBody.Text:='';
  NoPKB.Text:='';
  Tanggal.Text:='';
  NoSPJ.Text:='';
  NoPolisi.Text:='';
  Tujuan.Text:='';
  Tujuan.ItemIndex:=0;
  Tujuan.Items.Clear;
  TujuanDisp.Text:='';
  Pengemudi.Text:='';
  TelpHP.Text:='';
  Service.Checked:=True;
  Catatan.Text:='';
  DriverCheck.Checked:=True;
  Pengemudi.Style:=csDropDownList;
  KMOrdo:='';
end;

procedure TSJBusServiceForm.InitGrid;
begin
{  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=0;
  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='STNK';
  StrGrid.Cells[4,0]:='';
  StrGrid.Cells[5,0]:='Jam';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
}
end;

procedure TSJBusServiceForm.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    QStr:='EXEC GetVhcAvailList '+LocationId+',2 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(VhcArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[Count][0]:=Qry.FieldValues['vehicle_id'];
      VhcArr[Count][1]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        VhcArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        VhcArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['out_ordo_km']<>NULL then VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km']
      else VhcArr[Count][9]:='0';
      if Qry.FieldValues['work_order_id']<>NULL then VhcArr[Count][13]:=Qry.FieldValues['work_order_id']
      else VhcArr[Count][13]:='';
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    QStr:='SELECT * FROM wh_service_location WHERE active=1 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(TujuanArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       TujuanArr[Count][0]:=Qry.FieldValues['service_location_id'];
       TujuanArr[Count][1]:=Qry.FieldValues['name'];
       TujuanArr[Count][2]:=Qry.FieldValues['address'];
       Inc(Count);
       Qry.Next;
    end;
    Qry.Close;
    QStr:='EXEC GetDriverList 6,2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(DriverArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       DriverArr[Count][0]:=Qry.FieldValues['employee_id'];
       DriverArr[Count][1]:=Qry.FieldValues['name'];
       Inc(Count);
       Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(VhcArr)-1 do
    NoBody.Items.Add(VhcArr[Count][1]);
  for Count:=0 to Length(TujuanArr)-1 do
    Tujuan.Items.Add(TujuanArr[Count][0]);
  RefreshDriver;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TSJBusServiceForm.RefreshDriver;
var Count:Integer;
begin
  Pengemudi.Items.Clear;
  Pengemudi.ItemIndex:=-1;
  Pengemudi.Text:='';
  for Count:=0 to Length(DriverArr)-1 do
    Pengemudi.Items.Add(DriverArr[Count][1]);
end;

procedure TSJBusServiceForm.SetMobil;
begin
  if NoBody.Text<>'' then begin
    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
    NoPKB.Text:=VhcArr[NoBody.ItemIndex][13];
    KMOrdo:=VhcArr[NoBody.ItemIndex][9];
    if VhcArr[NoBody.ItemIndex][13]<>'' then Service.Checked:=True;
  end;
end;

procedure TSJBusServiceForm.RefreshGrid;
var Count:Integer;
begin
{  if Length(VhcArr)>0 then StrGrid.RowCount:=Length(VhcArr)+1;
  for Count:=0 to Length(VhcArr)-1 do begin
     StrGrid.Cells[0,Count+1]:=VhcArr[Count][0];
     StrGrid.Cells[1,Count+1]:=VhcArr[Count][1];
     StrGrid.Cells[2,Count+1]:=VhcArr[Count][2];
     StrGrid.Cells[3,Count+1]:=VhcArr[Count][3];
  end;
}
end;

procedure TSJBusServiceForm.DisableInput;
begin
  Simpan.Enabled:=False;
  NoBody.Enabled:=False;
  Pengemudi.Enabled:=False;
  TelpHP.Enabled:=False;
  Tujuan.Enabled:=False;
  GroupTujuan.Enabled:=False;
  Catatan.Enabled:=False;
end;

procedure TSJBusServiceForm.EnableInput;
begin
  Simpan.Enabled:=True;
  NoBody.Enabled:=True;
  Pengemudi.Enabled:=True;
  TelpHP.Enabled:=True;
  Tujuan.Enabled:=True;
  GroupTujuan.Enabled:=True;
  Catatan.Enabled:=True;
end;


procedure TSJBusServiceForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TSJBusServiceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSJBusServiceForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TSJBusServiceForm.NoBodyChange(Sender: TObject);
begin
  SetMobil;
end;

procedure TSJBusServiceForm.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Service.SetFocus;
end;

procedure TSJBusServiceForm.NamaPengemudiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TelpHP.SetFocus;
end;

procedure TSJBusServiceForm.TelpHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Tujuan.SetFocus;
end;

procedure TSJBusServiceForm.ServiceKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Pengemudi.SetFocus;
end;

procedure TSJBusServiceForm.KEURKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Pengemudi.SetFocus;
end;

procedure TSJBusServiceForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    QStr,VhcId,TransId,StrTransType,StrPKB,StrTujuan,StrPengemudi,StrNama:String;
    Count,TransOldId:Integer;
    IsOk:Boolean;
begin
  IsOk:=True;
  if (NoBody.Text<>'') AND (Pengemudi.Text<>'') AND ((KEUR.Checked) OR (Service.Checked) OR (BBM.Checked) )
  then begin
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      for Count:=0 to Length(VhcArr)-1 do begin
        if ArrayIndexOf(VhcArr,NoBody.Text,1)>=0 then begin
          VhcId:=VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][0];
        end;
      end;
      if Service.Checked=True then StrTujuan:=QuotedStr(Tujuan.Text) else StrTujuan:='NULL';
      StrNama:=QuotedStr(Trim(Pengemudi.Text));
      StrPengemudi:='';
      if DriverCheck.Checked=True then begin
        for Count:=0 to Length(DriverArr)-1 do
          if DriverArr[Count][1]=Trim(Pengemudi.Text) then StrPengemudi:=QuotedStr(DriverArr[Count][0]);
      end else begin
        StrPengemudi:='NULL'
      end;
      QStr:='SELECT RIGHT(MAX(vhc_trans_id),4) AS vhc_trans_id FROM wh_vhc_trans '+
            'WHERE vhc_trans_id  LIKE '+Chr(39)+'SBB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      Qry.Open;
      if Qry.FieldValues['vhc_trans_id']<>NULL then begin
        TransOldId:=Qry.FieldValues['vhc_trans_id'];
        TransId:=Format('%.*d',[4,TransOldId+1]);
        Qry.Close;
        Qry.SQL.Clear;
      end else
        TransId:='0001';
      TransId:='SBB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
               FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      QStr:='INSERT INTO wh_vhc_trans (vhc_trans_id,vehicle_id,employee_id,vhc_trans_type_id,'+
            'phone_no,location_id,day_night,out_date,out_time,out_user'+
            ',out_ordo_km,description,update_time,update_user) '+
            'VALUES ('+QuotedStr(TransId)+','+QuotedStr(VhcId)+','+StrPengemudi+',2,'+QuotedStr(TelpHP.Text)+
            ','+LocationId+',1,GETDATE(),GETDATE(),'+QuotedStr(User)+','+KMOrdo+
            ','+QuotedStr(Catatan.Lines.Text)+',GETDATE(),'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      try
        Qry.ExecSQL;
      except
        on E:Exception do IsOk:=False;
      end;
      if Service.Checked=True then StrTransType:='1'
      else if KEUR.Checked=True then StrTransType:='3'
      else if BBM.Checked=True then StrTransType:='4';
      if Trim(NoPKB.Text)<>'' then StrPKB:=Chr(39)+Trim(NoPKB.Text)+Chr(39) else StrPKB:='NULL';
      QStr:='INSERT INTO wh_vhc_trans_detail_eng (vhc_trans_id,work_order_id,service_location_id,vhc_out_reason_id,driver_id'+
            ',update_time,update_user) VALUES '+
            '('+QuotedStr(TransId)+','+StrPKB+','+StrTujuan+','+StrTransType+
            ','+StrNama+',GETDATE(),'+QuotedStr(User)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      try
        Qry.ExecSQL;
      except
        on E:Exception do IsOk:=False;
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        NoSPJ.Text:=TransId;
        QStr:='SELECT CONVERT(VARCHAR(10),out_date,103) AS out_date,CONVERT(VARCHAR(5),out_time,108) AS out_time '+
              'FROM wh_vhc_trans WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        Qry.Open;
        Tanggal.Text:=Qry.FieldValues['out_date'];
        Qry.Close;
        if MessageBox(0,'SJ Service Berhasil Disimpan' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
          RePrintForm.ReportName:='SPB Service';
          RePrintForm.ReportId:=TransId;
          if RePrintForm.ShowModal=1 then begin
            PreparePrint;
            PreparePrintData;
            Report.Preview;
          end;
        end;
      end else begin
        Main.TransRollback;
        MessageBox(0,'    SJ Service Gagal DiSimpan'+Chr(13)+'Periksa Kembali Kolom isian'+Chr(13)+'     Atau Hubungi IT','SPJ',MB_OK or MB_ICONWARNING);
      end;
      Main.CloseDb;
    end;
    Main.M_Normal;
  end else begin
    MessageBox(0,'Periksa Kembali Kolom isian','SPJ',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TSJBusServiceForm.PreparePrint;
var QStr:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocationDetail '+Chr(39)+LocationId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
//      QLocation.Caption:=Qry.FieldValues['location'];
//      QAddress.Caption:=Qry.FieldValues['address']+' Telp.'+LeftStr(Qry.FieldValues['phone_no'],3)+'-'+RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-3);
    end;
    Qry.Close;
    QStr:='SELECT * FROM wh_message WHERE (location_id='+Chr(39)+LocationId+Chr(39)+
          ') AND (GETDATE() BETWEEN from_date AND to_date) AND (active=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QMessage.Caption:=Qry.FieldValues['message'];
    end;
    Qry.Close;
    Main.CloseDb;
  end
end;

procedure TSJBusServiceForm.PreparePrintData;
begin
{  QNoSPJ.Caption:=NoSPJ.Text;
  QTanggal.Caption:=Tanggal.Text;
  QJam.Caption:=Jam.Text;
  QNama.Caption:=Pengemudi.Text;
  QNoBody.Caption:=NoBody.Text;
  QNoPolisi.Caption:=NoPolisi.Text;
  QTelpHP.Caption:=TelpHP.Text;
  QLokasiTujuan.Caption:=TujuanDisp.Text;
  if Service.Checked then QTujuan.Caption:='Service' else QTujuan.Caption:='Drive Test';
  QNoPKB.Caption:=NoPKB.Text;
  QRit.Caption:=Rit.Text;
  QDrop.Caption:=Drop.Text;
  QKMArgo.Caption:=KMArgo.Text;
  QKMOrdo.Caption:=KMOrdo.Text;
  QKMArgoIsi.Caption:=KMArgoIsi.Text;
  QTandaPetugas.Caption:=UpperCase(User);
  QTandaPengemudi.Caption:=Pengemudi.Text;
  QCatatan.Caption:=Catatan.Text;
}
end;

procedure TSJBusServiceForm.CetakUlangSPJ(NoSPJ:String);
var Qry:TADOQuery;
    QStr:String;
begin
  if NoSPJ<>'' then begin
    Init;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
{    if Main.OpenDb then begin
      QStr:='SELECT a.vhc_trans_id,CONVERT(VARCHAR(10),a.out_date,103) AS out_date,CONVERT(VARCHAR(5),a.out_time,108) AS out_time'+
            ',a.employee_id,b.name,c.body_id,c.license_plate,a.phone_no,a.out_rits,a.out_drops,a.out_argo_km,a.out_ordo_km'+
            ',a.out_hired_km,a.description,d.driver_id,d.vhc_out_reason_id,e.name as service_location,d.work_order_id FROM wh_vhc_trans AS a '+
            ' LEFT JOIN wh_employee AS b ON b.employee_id=a.employee_id '+
            ' INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
            ' INNER JOIN wh_vhc_trans_detail_eng AS d ON d.vhc_trans_id=a.vhc_trans_id '+
            ' LEFT JOIN wh_service_location AS e ON e.service_location_id=d.service_location_id'+
            ' WHERE a.vhc_trans_id='+Chr(39)+NoSPJ+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QNoSPJ.Caption:=Qry.FieldValues['vhc_trans_id'];
        QTanggal.Caption:=Qry.FieldValues['out_date'];
        QJam.Caption:=Qry.FieldValues['out_time'];
        if Qry.FieldValues['name']<>NULL then begin
          QNama.Caption:=Qry.FieldValues['name'];
          QTandaPengemudi.Caption:=Qry.FieldValues['name'];
        end else if Qry.FieldValues['driver_id']<>NULL then begin
          QNama.Caption:=Qry.FieldValues['driver_id'];
          QTandaPengemudi.Caption:=Qry.FieldValues['driver_id'];
        end;
        QNoBody.Caption:=Qry.FieldValues['body_id'];
        QNoPolisi.Caption:=Qry.FieldValues['license_plate'];
        QTelpHP.Caption:=Qry.FieldValues['phone_no'];
        QLokasiTujuan.Caption:=Qry.FieldValues['service_location'];
        if Qry.FieldValues['vhc_out_reason_id']=1 then QTujuan.Caption:='Service' else QTujuan.Caption:='Drive Test';
        if Qry.FieldValues['work_order_id']<>NULL then QNoPKB.Caption:=Qry.FieldValues['work_order_id'] else QNoPKB.Caption:='';
        QRit.Caption:=Qry.FieldValues['out_rits'];
        QDrop.Caption:=Qry.FieldValues['out_drops'];
        QKMArgo.Caption:=Qry.FieldValues['out_argo_km'];
        QKMArgoIsi.Caption:=Qry.FieldValues['out_hired_km'];
        QKMOrdo.Caption:=Qry.FieldValues['out_ordo_km'];
        QTandaPetugas.Caption:=UpperCase(User);
        if Qry.FieldValues['description']<>NULL then QCatatan.Caption:=Qry.FieldValues['description']
        else QCatatan.Caption:='';
        RePrintForm.ReportName:='SPB Service';
        RePrintForm.ReportId:=QNoSPJ.Caption;
        if RePrintForm.ShowModal=1 then begin
          PreparePrint;
          Report.Preview;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
}    RefreshCombo;
  end;
end;

procedure TSJBusServiceForm.CetakUlangClick(Sender: TObject);
begin
  SPJServReprint:=TSPJServReprint.Create(Self);
end;

procedure TSJBusServiceForm.TujuanChange(Sender: TObject);
begin
  TujuanDisp.Text:=TujuanArr[Tujuan.ItemIndex][1];
end;

procedure TSJBusServiceForm.TujuanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Catatan.SetFocus;
end;

procedure TSJBusServiceForm.PopOut(Height:Integer);
begin
  GroupPanel.Top:=GroupPanel.Top+Height;
end;

procedure TSJBusServiceForm.PopIn(Height:Integer);
begin
  GroupPanel.Top:=GroupPanel.Top-Height;
end;


procedure TSJBusServiceForm.KEURClick(Sender: TObject);
begin
  if KEUR.Checked=True then begin
    if Tujuan.Visible=True then begin
      LabelLokasi.Visible:=False;
      Tujuan.Visible:=False;
      TujuanDisp.Visible:=False;
      PopIn(Tujuan.Height+3);
    end;
  end;
end;

procedure TSJBusServiceForm.ServiceClick(Sender: TObject);
begin
  if Service.Checked=True then begin
    if Tujuan.Visible=False then begin
      LabelLokasi.Visible:=True;
      Tujuan.Visible:=True;
      TujuanDisp.Visible:=True;
      PopOut(Tujuan.Height+3);
    end;
  end;
end;

procedure TSJBusServiceForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TSJBusServiceForm.DriverCheckClick(Sender: TObject);
begin
  if DriverCheck.Checked=True then begin
    Pengemudi.Style:=csDropDownList;
    RefreshDriver;
  end;
end;

procedure TSJBusServiceForm.NonDriverCheckClick(Sender: TObject);
begin
  if NonDriverCheck.Checked=True then begin
    Pengemudi.Style:=csSimple;
    Pengemudi.Text:='';
  end;
end;

procedure TSJBusServiceForm.BBMClick(Sender: TObject);
begin
  if BBM.Checked=True then begin
    if Tujuan.Visible=True then begin
      LabelLokasi.Visible:=False;
      Tujuan.Visible:=False;
      TujuanDisp.Visible:=False;
      PopIn(Tujuan.Height+3);
    end;
  end;
end;

end.
