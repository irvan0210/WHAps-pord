unit SJDTrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, Grids, StdCtrls, ExtCtrls, WHUnit;

type
  TSJDTr = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    NoBody: TComboBox;
    Shift: TPanel;
    Pagi: TRadioButton;
    Malam: TRadioButton;
    GroupDetail: TGroupBox;
    KMOrdo: TEdit;
    Catatan: TMemo;
    Driver: TComboBox;
    DriverDisp: TEdit;
    Simpan: TButton;
    Keluar: TButton;
    Bersihkan: TButton;
    GroupMitra: TGroupBox;
    Label16: TLabel;
    GridDriver: TStringGrid;
    Panel1: TPanel;
    Sisa: TEdit;
    NoPolisi: TEdit;
    Petugas: TEdit;
    CetakUlang: TButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QImageExecutive: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QNoSJ: TQRLabel;
    QNoDriver: TQRLabel;
    QNama: TQRLabel;
    QNoBody: TQRLabel;
    QNoPolisi: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel34: TQRLabel;
    QLocation: TQRLabel;
    QAddress: TQRLabel;
    QRLabel38: TQRLabel;
    QTelpHP: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QTanggal: TQRLabel;
    QRLabel13: TQRLabel;
    QJam: TQRLabel;
    QRBand2: TQRBand;
    QCatatan: TQRLabel;
    QRLabel40: TQRLabel;
    QRBand3: TQRBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QTandaPetugas: TQRLabel;
    QRLabel29: TQRLabel;
    QTandaPengemudi: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QMessage: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel45: TQRLabel;
    TelpHP: TEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    Cari: TEdit;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QTujuan: TQRLabel;
    NoSJ: TEdit;
    Label6: TLabel;
    Tujuan: TComboBox;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QKMOrdo: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel59: TQRLabel;
    procedure FormShow(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure NoPolisiKeyPress(Sender: TObject; var Key: Char);
    procedure DriverDispKeyPress(Sender: TObject; var Key: Char);
    procedure TelpHPKeyPress(Sender: TObject; var Key: Char);
    procedure TujuanKeyPress(Sender: TObject; var Key: Char);
    procedure KMOrdoKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure NoSJKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure KMOrdoEnter(Sender: TObject);
    procedure KMOrdoExit(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure GridDriverSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure EnableInput;
    procedure DisableInput;
    procedure SetParam;
    procedure PreparePrint;
    procedure RefreshData;
    procedure SetDriverMobil;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  SJDTr: TSJDTr;
  EmplArr,VhcArr,SchArr:Array of TArrString16;
  InputStatus:Boolean;

implementation

uses MainU, ADODB, StrUtils;

{$R *.dfm}

procedure TSJDTr.Init;
begin
  NoBody.Items.Clear;
  NoBody.ItemIndex:=0;
  NoBody.Text:='';
  Driver.Items.Clear;
  Driver.ItemIndex:=0;
  Driver.Text:='';
  Tanggal.Text:='';
  Jam.Text:='';
  NoSJ.Text:='';
  NoPolisi.Text:='';
  DriverDisp.Text:='';
  TelpHP.Text:='';
  Pagi.Checked:=True;
  Petugas.Text:=User;
  KMOrdo.Text:='';
  Catatan.Text:='';
  EnableInput;
  InitGrid;
//  QPKB.Caption:='';
  Cari.Text:='';
  NoSJ.SetFocus;
  GroupDetail.Enabled:=True;
end;

procedure TSJDTr.InitGrid;
begin
  GridDriver.RowCount:=2;
  GridDriver.Cells[0,0]:='NIP';
  GridDriver.Cells[1,0]:='Nama';
  GridDriver.Cells[2,0]:='Telphone';
  GridDriver.Cells[3,0]:='Handphone';
  GridDriver.Cells[0,1]:='';
  GridDriver.Cells[1,1]:='';
  GridDriver.Cells[2,1]:='';
  GridDriver.Cells[3,1]:='';
end;

procedure TSJDTr.EnableInput;
begin
  NoBody.Enabled:=True;
  Driver.Enabled:=True;
  Shift.Enabled:=True;
  Catatan.Enabled:=True;
  TelpHP.Enabled:=True;
  GroupDetail.Enabled:=False;
  InputStatus:=True;
  Simpan.Enabled:=True;
  GroupMitra.Enabled:=True;
  Cari.Enabled:=True;
end;

procedure TSJDTr.DisableInput;
begin
  Driver.Enabled:=False;
  NoBody.Enabled:=False;
  TelpHP.Enabled:=False;
  Catatan.Enabled:=False;
  Shift.Enabled:=False;
  GroupDetail.Enabled:=False;
  InputStatus:=False;
  Simpan.Enabled:=False;
  GroupMitra.Enabled:=False;
  Cari.Enabled:=False;
end;

procedure TSJDTr.SetParam;
begin
  Tanggal.Text:=Main.Status.Panels.Items[0].Text;
  Jam.Text:=Main.Status.Panels.Items[1].Text;
end;

procedure TSJDTr.RefreshData;
var QStr:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
begin
  SetLength(VhcArr,0);
  SetLength(EmplArr,0);
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetDriverList '+LocationId+',4 ;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(EmplArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    EmplArr[Count][0]:=Qry.FieldValues['employee_id'];
    EmplArr[Count][1]:=Qry.FieldValues['name'];
    EmplArr[Count][2]:=Qry.FieldValues['phone_no'];
    EmplArr[Count][3]:=Qry.FieldValues['cellular_no'];
    if Qry.FieldValues['last_phone_no']<>NULL then EmplArr[Count][4]:=Qry.FieldValues['last_phone_no'];
    if Qry.FieldValues['form_id']<>NULL then EmplArr[Count][5]:=Qry.FieldValues['form_id'];
    if Qry.FieldValues['reason']<>NULL then EmplArr[Count][6]:=Qry.FieldValues['reason'];
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  QStr:='EXEC GetVhcAvailList '+LocationId+',4 ;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(VhcArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    VhcArr[Count][0]:=Qry.FieldValues['vehicle_id'];
    VhcArr[Count][1]:=Qry.FieldValues['body_id'];
    VhcArr[Count][2]:=Qry.FieldValues['license_plate'];
    if Qry.FieldValues['out_rits']<>NULL then VhcArr[Count][3]:=Qry.FieldValues['out_rits']
    else VhcArr[Count][3]:='0';
    if Qry.FieldValues['out_ordo_km']<>NULL then VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km']
    else VhcArr[Count][9]:='0';
    if Qry.FieldValues['in_ordo_km']<>NULL then VhcArr[Count][10]:=Qry.FieldValues['in_ordo_km']
    else VhcArr[Count][10]:='0';
    if Qry.FieldValues['work_order_id']<>NULL then VhcArr[Count][13]:=Qry.FieldValues['work_order_id']
    else VhcArr[Count][13]:='';
    if Qry.FieldValues['reason']<>NULL then VhcArr[Count][14]:=Qry.FieldValues['reason']
    else VhcArr[Count][14]:='';
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
{  QStr:='SELECT a.*,b.body_id FROM wh_working_schedule AS a '+
        'LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
        'WHERE (location_id='+LocationId+') AND (GETDATE() BETWEEN from_date AND to_date) ;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(SchArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SchArr[Count][0]:=Qry.FieldValues['working_schedule_id'];
    SchArr[Count][1]:=Qry.FieldValues['employee_id'];
    SchArr[Count][2]:=Qry.FieldValues['vehicle_id'];
    SchArr[Count][3]:=Qry.FieldValues['body_id'];
    Inc(Count);
    Qry.Next;
  end;
}  Qry.Close;
  Main.MyConnection.Close;
  for Count:=0 to Length(EmplArr)-1 do
    Driver.Items.Add(EmplArr[Count][0]);
  IntCount2:=0;
  for Count:=0 to Length(VhcArr)-1 do begin
    Inc(IntCount2);
    NoBody.Items.Add(VhcArr[Count][1]);
  end;
  Sisa.Text:=IntToStr(IntCount2);

end;

procedure TSJDTr.FormShow(Sender: TObject);
begin
  Init;
  SetParam;
  RefreshData;
  RefreshGrid;
end;

procedure TSJDTr.PreparePrint;
var QStr:String;
    Qry:TADOQuery;

begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='SELECT * FROM wh_location WHERE location_id='+Chr(39)+LocationId+Chr(39)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QLocation.Caption:=Qry.FieldValues['location'];
      QAddress.Caption:=Qry.FieldValues['address']+' Telp.'+LeftStr(Qry.FieldValues['phone_no'],3)+'-'+RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-3);
    end;
    Qry.Close;
    QStr:='SELECT * FROM wh_message WHERE (location_id='+Chr(39)+LocationId+Chr(39)+
          ') AND (GETDATE() BETWEEN from_date AND to_date) AND (active=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QMessage.Caption:=Qry.FieldValues['message'];
    end else
      QMessage.Caption:='';
    Qry.Close;
  end;
  Main.CloseDb;
  Qry.Destroy;
  QNoSJ.Caption:=NoSJ.Text;
  QNoDriver.Caption:=Driver.Text;
  QNama.Caption:=DriverDisp.Text;
  QNoBody.Caption:=NoBody.Text;
  QNoPolisi.Caption:=NoPolisi.Text;
  QTelpHP.Caption:=TelpHP.Text;
  QKMOrdo.Caption:=SToCurr(ToString(KMOrdo.Text));
//  QPetugas.Caption:=Petugas.Text;
  QTujuan.Caption:=Tujuan.Text;
  QCatatan.Caption:=Catatan.Text;
  QTanggal.Caption:=Tanggal.Text;
  QJam.Caption:=Jam.Text;
  QTandaPetugas.Caption:=UpperCase(Petugas.Text);
  QTandaPengemudi.Caption:=UpperCase(DriverDisp.Text);
end;

procedure TSJDTr.SetDriverMobil;
var Count:Integer;
//    IsTrue:Boolean;
begin
  if (Driver.Text<>'') then begin
    DriverDisp.Text:=EmplArr[Driver.ItemIndex][1];
    if EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]<>'' then TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]
    else TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][2]+','+EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3];
  end;
//  IsTrue:=False;
  if (NoBody.Text='') AND (Driver.Items.Count>0) AND (NoBody.Items.Count>0) then begin
{    if ArrayIndexOf(SchArr,Driver.Text,1)>=0 then begin
      if NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,.Text,1)][3])>=0 then begin
        NoBody.ItemIndex:=NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Mitra.Text,1)][3]);
      end;
    end;
}  end;
  if NoBody.Text<>'' then begin
    NoPolisi.Text:=Copy(VhcArr[NoBody.ItemIndex][2],1,1)+' '+Copy(VhcArr[NoBody.ItemIndex][2],2,4)+
                   ' '+Copy(VhcArr[NoBody.ItemIndex][2],6,Length(VhcArr[NoBody.ItemIndex][2])+1);
//    Rit.Text:=SToCurr(VhcArr[NoBody.ItemIndex][4]);
//    Drop.Text:=SToCurr(VhcArr[NoBody.ItemIndex][6]);
//    KMArgo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][8]);
    KMOrdo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][10]);
//    KMArgoIsi.Text:=SToCurr(VhcArr[NoBody.ItemIndex][12]);
//    IntReguler:=StrToInt(VhcArr[NoBody.ItemIndex][15]);
    if (SToInt(KMOrdo.Text)<1) AND (SToInt(KMOrdo.Text)<1) then begin
      GroupDetail.Enabled:=True;
    end else
      GroupDetail.Enabled:=False;
  end;
end;

procedure TSJDTr.RefreshGrid;
var Count:Integer;
begin
  if Length(EmplArr)>0 then GridDriver.RowCount:=Length(EmplArr)+1;
  for Count:=0 to Length(EmplArr)-1 do begin
     GridDriver.Cells[0,Count+1]:=EmplArr[Count][0];
     GridDriver.Cells[1,Count+1]:=EmplArr[Count][1];
     GridDriver.Cells[2,Count+1]:=EmplArr[Count][2];
     GridDriver.Cells[3,Count+1]:=EmplArr[Count][3];
  end;
end;

procedure TSJDTr.KeluarClick(Sender: TObject);
begin
  SJDTr.Close;
end;

procedure TSJDTr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSJDTr.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoPolisi.SetFocus;
end;

procedure TSJDTr.NoPolisiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then DriverDisp.SetFocus;
end;

procedure TSJDTr.DriverDispKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TelpHP.SetFocus;
end;

procedure TSJDTr.TelpHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Tujuan.SetFocus;
end;

procedure TSJDTr.TujuanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if GroupDetail.Enabled=True then KMOrdo.SetFocus else Catatan.SetFocus;
end;

procedure TSJDTr.KMOrdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Catatan.SetFocus;
end;

procedure TSJDTr.SimpanClick(Sender: TObject);
begin
  if ((Trim(NoBody.Text)<>'') AND (Trim(NoPolisi.Text)<>'') AND (Trim(DriverDisp.Text)<>'') AND (Trim(Tujuan.Text)<>'') ) then begin
        if MessageBox(0,'SPJ Berhasil Disimpan' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
//          RePrintForm.ReportName:='SPJ Operasi';
//          RePrintForm.ReportId:=TransId;
//          if RePrintForm.ShowModal=1 then begin
            PreparePrint;
//            PreparePrintData;
            Report.Preview;
//          end;
        end;                                                                   
  end else
    MessageBox(0,'Silahkan Lengkapi Data','SJ',MB_OK or MB_ICONERROR);
end;

procedure TSJDTr.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoBody.SetFocus; 
end;

procedure TSJDTr.BersihkanClick(Sender: TObject);
begin
  Init;
  SetParam;
  RefreshData;
  RefreshGrid;
end;

procedure TSJDTr.KMOrdoEnter(Sender: TObject);
begin
  if Trim(KMOrdo.Text)<>'' then begin
    KMOrdo.Text:=ToString(KMOrdo.Text);
  end;
end;

procedure TSJDTr.KMOrdoExit(Sender: TObject);
begin
  if Trim(KMOrdo.Text)<>'' then begin
    KMOrdo.Text:=SToCurr(KMOrdo.Text);
  end;
end;

procedure TSJDTr.DriverChange(Sender: TObject);
begin
  if (Driver.Text<>'') then SetDriverMobil;
end;

procedure TSJDTr.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoBody.SetFocus;
end;

procedure TSJDTr.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') AND (InputStatus)  then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 8 do
        if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridDriver.RowCount:=Count2;
          for Count4:=0 to 8 do
          GridDriver.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TSJDTr.GridDriverSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if InputStatus then begin
    if Length(EmplArr)>0 then begin
      Driver.ItemIndex:=Driver.Items.IndexOf(GridDriver.Cells[0,ARow]);
      SetDriverMobil;
    end;
  end;
end;

end.
