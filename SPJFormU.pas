unit SPJFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Grids, ADODB, QRCtrls, QuickRpt, WHUnit,
  jpeg;

type
  TSPJForm = class(TForm)
    VehicleLabel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    NoBody: TComboBox;
    Catatan: TMemo;
    Mitra: TComboBox;
    MitraDisp: TEdit;
    Simpan: TButton;
    Keluar: TButton;
    Bersihkan: TButton;
    GroupMitra: TGroupBox;
    GridMitra: TStringGrid;
    NoPolisi: TEdit;
    Petugas: TEdit;
    CetakUlang: TButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QImageExecutive: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QNoSPJ: TQRLabel;
    QTanggal: TQRLabel;
    QJam: TQRLabel;
    QNoKPP: TQRLabel;
    QNama: TQRLabel;
    QNoBody: TQRLabel;
    QNoPolisi: TQRLabel;
    QPetugas: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRShape2: TQRShape;
    QRLabel21: TQRLabel;
    QLabelRit: TQRLabel;
    QLabelDrop: TQRLabel;
    QLabelKMArgo: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRit: TQRLabel;
    QDrop: TQRLabel;
    QKMArgo: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QLabelVoucher: TQRLabel;
    QLabelVoucher1: TQRLabel;
    QLabelVoucher2: TQRLabel;
    QLabelVoucher3: TQRLabel;
    QRShape11: TQRShape;
    QLabelVoucher4: TQRLabel;
    QLabelVoucher5: TQRLabel;
    QRBand3: TQRBand;
    QRLabel26: TQRLabel;
    QLabelSPBU: TQRLabel;
    QRLabel28: TQRLabel;
    QTandaPetugas: TQRLabel;
    QTandaSPBU: TQRLabel;
    QTandaMitra: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel30: TQRLabel;
    QLabelNoBody: TQRLabel;
    QRShape12: TQRShape;
    Label15: TLabel;
    QRLabel34: TQRLabel;
    QLocation: TQRLabel;
    QAddress: TQRLabel;
    QRLabel35: TQRLabel;
    QMessage: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTelpHP: TQRLabel;
    QRLabel39: TQRLabel;
    QKMOrdo: TQRLabel;
    QCatatan: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    TelpHP: TEdit;
    GroupBox1: TGroupBox;
    Tanggal: TEdit;
    NoSPJ: TEdit;
    Jam: TEdit;
    Label14: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    QRLabel44: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QLabelKMArgoIsi: TQRLabel;
    QKMArgoIsi: TQRLabel;
    QRShape13: TQRShape;
    QRLabel45: TQRLabel;
    QPKB: TQRLabel;
    Cari: TEdit;
    Label12: TLabel;
    Label16: TLabel;
    Panel1: TPanel;
    Sisa: TEdit;
    QImageReguler: TQRImage;
    QLabelReguler: TQRLabel;
    QRShape14: TQRShape;
    QLabel29: TQRLabel;
    QRShape15: TQRShape;
    QLabel2: TQRLabel;
    QLabel1: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QLabel30: TQRLabel;
    QLabel31: TQRLabel;
    QLabel32: TQRLabel;
    QRShape21: TQRShape;
    QLabel33: TQRLabel;
    QLabel34: TQRLabel;
    Q29: TQRLabel;
    Q30: TQRLabel;
    Q31: TQRLabel;
    Q32: TQRLabel;
    Q33: TQRLabel;
    Q34: TQRLabel;
    PanelForm1: TPanel;
    Label5: TLabel;
    Shift: TPanel;
    Pagi: TRadioButton;
    Malam: TRadioButton;
    GroupDetail: TGroupBox;
    PanelForm11: TPanel;
    KMOrdo: TEdit;
    Label6: TLabel;
    Rit: TEdit;
    v29: TEdit;
    Label17: TLabel;
    v30: TEdit;
    Label18: TLabel;
    Label7: TLabel;
    Drop: TEdit;
    Label19: TLabel;
    v31: TEdit;
    Label8: TLabel;
    KMArgo: TEdit;
    Label11: TLabel;
    KMArgoIsi: TEdit;
    Label20: TLabel;
    v32: TEdit;
    Label21: TLabel;
    v33: TEdit;
    v34: TEdit;
    Label22: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    QImageBlank: TQRImage;
    QImageVoucher: TQRImage;
    QImage2934: TQRImage;
    QImage2935: TQRImage;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridMitraSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure MitraChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure MitraKeyPress(Sender: TObject; var Key: Char);
    procedure PagiKeyPress(Sender: TObject; var Key: Char);
    procedure MalamKeyPress(Sender: TObject; var Key: Char);
    procedure RitKeyPress(Sender: TObject; var Key: Char);
    procedure DropKeyPress(Sender: TObject; var Key: Char);
    procedure KMArgoKeyPress(Sender: TObject; var Key: Char);
    procedure KMOrdoKeyPress(Sender: TObject; var Key: Char);
    procedure CatatanKeyPress(Sender: TObject; var Key: Char);
    procedure TelpHPKeyPress(Sender: TObject; var Key: Char);
    procedure CetakUlangClick(Sender: TObject);
    procedure KMArgoIsiKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure RitChange(Sender: TObject);
    procedure GridMitraKeyPress(Sender: TObject; var Key: Char);
    procedure v34KeyPress(Sender: TObject; var Key: Char);
    procedure v29KeyPress(Sender: TObject; var Key: Char);
    procedure v30KeyPress(Sender: TObject; var Key: Char);
    procedure v31KeyPress(Sender: TObject; var Key: Char);
    procedure v32KeyPress(Sender: TObject; var Key: Char);
    procedure v33KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EmplArr,VhcArr,SchArr:Array of TArrString30;
    InputStatus:Boolean;
    IntReguler,FormNumber:Integer;
    procedure InitGrid;
    procedure Init;
    procedure SetMitraMobil;
    procedure PreparePrint;
    procedure PreparePrintData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure Reprint(NoSPJ:String);
  end;

var
  SPJForm: TSPJForm;

implementation

{$R *.dfm}

Uses MainU, MaskUtils, DateUtils, StrUtils, SPJReprintU, RePrintFormU,
  AuthorizedFormU;

procedure TSPJForm.InitGrid;
begin
  SetLength(SPJArr,0);
  GridMitra.RowCount:=2;
  GridMitra.Cells[0,0]:='No KPP';
  GridMitra.Cells[1,0]:='Nama';
  GridMitra.Cells[2,0]:='Telphone';
  GridMitra.Cells[3,0]:='Handphone';
  GridMitra.Cells[0,1]:='';
  GridMitra.Cells[1,1]:='';
  GridMitra.Cells[2,1]:='';
  GridMitra.Cells[3,1]:='';
end;

procedure TSPJForm.Init;
begin
  FormNumber:=1;
  NoBody.Items.Clear;
  NoBody.ItemIndex:=0;
  NoBody.Text:='';
  Mitra.Items.Clear;
  Mitra.ItemIndex:=0;
  Mitra.Text:='';
  Tanggal.Text:='';
  Jam.Text:='';
  NoSPJ.Text:='';
  NoPolisi.Text:='';
  MitraDisp.Text:='';
  TelpHP.Text:='';
  Pagi.Checked:=True;
  Petugas.Text:=User;
  Rit.Text:='';
  Drop.Text:='';
  KMArgo.Text:='';
  KMArgoIsi.Text:='';
  KMOrdo.Text:='';
  Catatan.Text:='';
  EnableInput;
  InitGrid;
  QPKB.Caption:='';
  Cari.Text:='';
  IntReguler:=0;
  QImageReguler.SendToBack;
  QLabelReguler.Caption:='';
//  QLabelLayananPrima.Caption:='';
  Q29.Caption:='';
  Q30.Caption:='';
  Q31.Caption:='';
  Q32.Caption:='';
  Q33.Caption:='';
  Q34.Caption:='';
  v29.Text:='';
  v30.Text:='';
  v31.Text:='';
  v32.Text:='';
  v33.Text:='';
  v34.Text:='';
end;

procedure TSPJForm.RefreshGrid;
var Count:Integer;
begin
  if Length(EmplArr)>0 then GridMitra.RowCount:=Length(EmplArr)+1;
  for Count:=0 to Length(EmplArr)-1 do begin
     GridMitra.Cells[0,Count+1]:=EmplArr[Count][0];
     GridMitra.Cells[1,Count+1]:=EmplArr[Count][1];
     GridMitra.Cells[2,Count+1]:=EmplArr[Count][2];
     GridMitra.Cells[3,Count+1]:=EmplArr[Count][3];
  end;
end;

procedure TSPJForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
begin
  SetLength(VhcArr,0);
  SetLength(EmplArr,0);
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetMitraList '+LocationId+' ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
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
      if Qry.FieldValues['license_expired']<>'' then EmplArr[Count][7]:=Qry.FieldValues['license_expired'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetVhcAvailList '+LocationId+',3 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
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
      if Qry.FieldValues['out_rits']<>NULL then VhcArr[Count][3]:=Qry.FieldValues['out_rits']
      else VhcArr[Count][3]:='0';
      if Qry.FieldValues['in_rits']<>NULL then VhcArr[Count][4]:=Qry.FieldValues['in_rits']
      else VhcArr[Count][4]:='0';
      if Qry.FieldValues['out_drops']<>NULL then VhcArr[Count][5]:=Qry.FieldValues['out_drops']
      else VhcArr[Count][5]:='0';
      if Qry.FieldValues['in_drops']<>NULL then VhcArr[Count][6]:=Qry.FieldValues['in_drops']
      else VhcArr[Count][6]:='0';
      if Qry.FieldValues['out_argo_km']<>NULL then VhcArr[Count][7]:=Qry.FieldValues['out_argo_km']
      else VhcArr[Count][7]:='0';
      if Qry.FieldValues['in_argo_km']<>NULL then VhcArr[Count][8]:=Qry.FieldValues['in_argo_km']
      else VhcArr[Count][8]:='0';
      if Qry.FieldValues['out_ordo_km']<>NULL then VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km']
      else VhcArr[Count][9]:='0';
      if Qry.FieldValues['in_ordo_km']<>NULL then VhcArr[Count][10]:=Qry.FieldValues['in_ordo_km']
      else VhcArr[Count][10]:='0';
      if Qry.FieldValues['out_hired_km']<>NULL then VhcArr[Count][11]:=Qry.FieldValues['out_hired_km']
      else VhcArr[Count][11]:='0';
      if Qry.FieldValues['in_hired_km']<>NULL then VhcArr[Count][12]:=Qry.FieldValues['in_hired_km']
      else VhcArr[Count][12]:='0';
      if Qry.FieldValues['work_order_id']<>NULL then VhcArr[Count][13]:=Qry.FieldValues['work_order_id']
      else VhcArr[Count][13]:='';
      if Qry.FieldValues['reason']<>NULL then VhcArr[Count][14]:=Qry.FieldValues['reason']
      else VhcArr[Count][14]:='';
      if Qry.FieldValues['reguler']<>NULL then VhcArr[Count][15]:=Qry.FieldValues['reguler'];
      if Qry.FieldValues['v29']<>NULL then VhcArr[Count][16]:=Qry.FieldValues['v29']
      else VhcArr[Count][16]:='0';
      if Qry.FieldValues['v30']<>NULL then VhcArr[Count][17]:=Qry.FieldValues['v30']
      else VhcArr[Count][17]:='0';
      if Qry.FieldValues['v31']<>NULL then VhcArr[Count][18]:=Qry.FieldValues['v31']
      else VhcArr[Count][18]:='0';
      if Qry.FieldValues['v32']<>NULL then VhcArr[Count][19]:=Qry.FieldValues['v32']
      else VhcArr[Count][19]:='0';
      if Qry.FieldValues['v33']<>NULL then VhcArr[Count][20]:=Qry.FieldValues['v33']
      else VhcArr[Count][20]:='0';
      if Qry.FieldValues['v34']<>NULL then VhcArr[Count][21]:=Qry.FieldValues['v34']
      else VhcArr[Count][21]:='0';
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT a.*,b.body_id FROM wh_working_schedule AS a '+
          'LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
          'WHERE (location_id='+LocationId+') AND (GETDATE() BETWEEN from_date AND to_date) ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
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
    Qry.Close;
    StrQry:='SELECT * FROM wh_setting WHERE (setting_name='+QuotedStr('SPJ_Form_CompanyId_'+CompanyId)+') AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      FormNumber:=Qry.FieldValues['value_string'];
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  IntCount2:=0;
  Case FormNumber of
    1:begin
        VehicleLabel.Caption:='No Body';
        for Count:=0 to Length(VhcArr)-1 do begin
          Inc(IntCount2);
          NoBody.Items.Add(VhcArr[Count][1]);
        end;
        PanelForm1.Visible:=True;
        PanelForm11.Visible:=True;
      end;
    2:begin
        VehicleLabel.Caption:='No Polisi';
        for Count:=0 to Length(VhcArr)-1 do begin
          Inc(IntCount2);
          NoBody.Items.Add(VhcArr[Count][2]);
        end;
        PanelForm1.Visible:=False;
        PanelForm11.Visible:=False;
      end;
  end;
  Sisa.Text:=IntToStr(IntCount2);
  for Count:=0 to Length(EmplArr)-1 do
    Mitra.Items.Add(EmplArr[Count][0]);
  Main.M_Normal;
end;

procedure TSPJForm.DisableInput;
begin
  Mitra.Enabled:=False;
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

procedure TSPJForm.EnableInput;
begin
  NoBody.Enabled:=True;
  Mitra.Enabled:=True;
  Shift.Enabled:=True;
  Catatan.Enabled:=True;
  TelpHP.Enabled:=True;
  GroupDetail.Enabled:=False;
  InputStatus:=True;
  Simpan.Enabled:=True;
  GroupMitra.Enabled:=True;
  Cari.Enabled:=True;
end;

procedure TSPJForm.KeluarClick(Sender: TObject);
begin
  SPJForm.Close;
end;

procedure TSPJForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJForm.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshGrid;
end;

procedure TSPJForm.GridMitraSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if InputStatus then begin
    if Length(EmplArr)>0 then begin
      Mitra.ItemIndex:=Mitra.Items.IndexOf(GridMitra.Cells[0,ARow]);
      SetMitraMobil;
    end;
  end;
end;

procedure TSPJForm.MitraChange(Sender: TObject);
begin
  if (Mitra.Text<>'') then SetMitraMobil;
end;

procedure TSPJForm.SetMitraMobil;
var Count:Integer;
//    IsTrue:Boolean;
begin
  if (Mitra.Text<>'') then begin
    MitraDisp.Text:=EmplArr[Mitra.ItemIndex][1];
    if EmplArr[ArrayIndexOf(EmplArr,Mitra.Text,0)][4]<>'' then TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Mitra.Text,0)][4]
    else TelpHP.Text:=EmplArr[ArrayIndexOf(EmplArr,Mitra.Text,0)][2]+','+EmplArr[ArrayIndexOf(EmplArr,Mitra.Text,0)][3];
  end;
//  IsTrue:=False;
  if (NoBody.Text='') AND (Mitra.Items.Count>0) AND (NoBody.Items.Count>0) then begin
    if ArrayIndexOf(SchArr,Mitra.Text,1)>=0 then begin
      case FormNumber of
        1:begin
            if NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Mitra.Text,1)][3])>=0 then begin
              NoBody.ItemIndex:=NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Mitra.Text,1)][3]);
            end;
          end;
        2:begin
            if NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Mitra.Text,1)][3])>=0 then begin
              NoBody.ItemIndex:=NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Mitra.Text,1)][3]);
            end;
          end;
//        IsTrue:=True;
      end;
    end;
  end;
  if NoBody.Text<>'' then begin
    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
    KMOrdo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][10]);
    case FormNumber of
      1:begin
          Rit.Text:=SToCurr(VhcArr[NoBody.ItemIndex][4]);
          Drop.Text:=SToCurr(VhcArr[NoBody.ItemIndex][6]);
          KMArgo.Text:=SToCurr(VhcArr[NoBody.ItemIndex][8]);
          KMArgoIsi.Text:=SToCurr(VhcArr[NoBody.ItemIndex][12]);
          IntReguler:=StrToInt(VhcArr[NoBody.ItemIndex][15]);
          v29.Text:=SToCurr(VhcArr[NoBody.ItemIndex][16]);
          v30.Text:=SToCurr(VhcArr[NoBody.ItemIndex][17]);
          v31.Text:=SToCurr(VhcArr[NoBody.ItemIndex][18]);
          v32.Text:=SToCurr(VhcArr[NoBody.ItemIndex][19]);
          v33.Text:=SToCurr(VhcArr[NoBody.ItemIndex][20]);
          v34.Text:=SToCurr(VhcArr[NoBody.ItemIndex][21]);
          if (SToInt(KMArgo.Text)<1) AND (SToInt(KMOrdo.Text)<1) then begin
            GroupDetail.Enabled:=True;
          end else
            GroupDetail.Enabled:=False;
        end;
      2:begin
        end;
    end;
  end;
end;

procedure TSPJForm.CariChange(Sender: TObject);
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
          GridMitra.RowCount:=Count2;
          for Count4:=0 to 8 do
          GridMitra.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TSPJForm.NoBodyChange(Sender: TObject);
var Count:Integer;
begin
  if (NoBody.Text)<>'' then begin
    if Mitra.Text='' then begin
        if ArrayIndexOf(SchArr,NoBody.Text,3)>=0 then begin
              Mitra.ItemIndex:=Mitra.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,NoBody.Text,3)][1]);
              MitraDisp.Text:=EmplArr[Mitra.ItemIndex][1];
            end;
    end;
    SetMitraMobil;
  end;
end;

procedure TSPJForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshGrid;
  Cari.SetFocus;
end;

procedure TSPJForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,VhcId,TransId,StrNoBody,StrMitraId,StrMsg,StrInsert,StrRit,StrDrop,StrKMArgo,StrKMArgoIsi,StrKmOdo:String;
    DayNight,TransOldId,Count,Val,DateBigger,TaxiTransType:Integer;
    IsAuth,IsOk:Boolean;
begin
  if (NoBody.ItemIndex>-1) AND (Mitra.ItemIndex>-1) then begin
    StrNoBody:=NoBody.Text;
    StrMitraId:=Mitra.Text;
    IsAuth:=False;
    AuthorizedForm.FormId:=IntToStr(TreeTag);
    if EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][7]<>'' then DateBigger:=CompareDateTime(StrToDate(EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][7]),Now())
    else DateBigger:=1;
{    if (VhcArr[ArrayIndexOf(VhcArr,StrNoBody,1)][13]<>'') OR (EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][5]<>'') then begin
      if (VhcArr[ArrayIndexOf(VhcArr,StrNoBody,1)][13]<>'') then begin
        if (MessageBox(0,'Armada ini Memiliki PKB'+Chr(13)+Chr(13)+' Otorisasi SPJ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
          AuthorizedForm.StrMessage:=' Armada Memiliki PKB No Body :'+StrNoBody;
          AuthorizedForm.CheckValues:='';
          AuthorizedForm.Values:=0;
          if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
        end;
      end;
      if (EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][5]<>'') then begin
        if  (LeftStr(EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][5],3)<>'SPJ') then begin
          if (MessageBox(0,PChar('Mitra ini tidak dapat beroperasi '+Chr(13)+Chr(13)+'Sebab: '+EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][6]+Chr(13)+Chr(13)+' Otorisasi SPJ?'),'SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
            AuthorizedForm.StrMessage:=EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][6]+#13+'Mitra :'+MitraDisp.Text;
            AuthorizedForm.CheckValues:='';
            AuthorizedForm.Values:=0;
            if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
          end;
        end else MessageBox(0,PChar('Mitra ini tidak dapat beroperasi '+Chr(13)+Chr(13)+'Sebab: '+EmplArr[ArrayIndexOf(EmplArr,StrMitraId,0)][6]),'SPJ',MB_OK or MB_ICONWARNING)
      end;
    end else if (DateBigger<1) then begin
        if (MessageBox(0,PChar('Mitra ini tidak dapat beroperasi '+Chr(13)+'   SIM sudah Kadaluarsa'+Chr(13)+Chr(13)+' Otorisasi SPJ?'),'SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
          AuthorizedForm.StrMessage:=' SIM '+MitraDisp.Text+' Kadaluarsa';
          AuthorizedForm.CheckValues:='';
          AuthorizedForm.Values:=0;
          if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
        end;
    end else begin
}      IsAuth:=True;
//    end;
    if IsAuth then begin
     Main.M_Busy;
     if Pagi.Checked then DayNight:=1 else DayNight:=2;
      case FormNumber of
        1:VhcId:=VhcArr[NoBody.ItemIndex][0];
        2:VhcId:=VhcArr[NoBody.ItemIndex][0];
      end;
      Qry:=TADOQuery.Create(Self);
      IsOk:=True;
      if Main.OpenDb then begin
        Main.TransStart;
        DisableInput;
        Qry.Connection:=Main.MyConnection;
        StrQry:='SELECT RIGHT(MAX(vhc_trans_id),4) AS vhc_trans_id FROM wh_vhc_trans '+
                  'WHERE vhc_trans_id  LIKE '+Chr(39)+'SPJ'+LocationCode+
                  FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                  '____'+Chr(39)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['vhc_trans_id']<>NULL then begin
          TransOldId:=Qry.FieldValues['vhc_trans_id'];
          TransId:=Format('%.*d',[4,TransOldId+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          TransId:='0001';
        TransId:='SPJ'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
        case FormNumber of
          1:begin
              StrInsert:=',out_rits,out_drops,out_argo_km,out_hired_km';
              StrRit:=','+ToString(Rit.Text);
              StrDrop:=','+ToString(Drop.Text);
              StrKMArgo:=','+ToString(KMArgo.Text);
              StrKMArgoIsi:=','+ToString(KMArgoIsi.Text);
              StrKmOdo:=','+ToString(KMOrdo.Text);
            end;
          2:begin
              StrInsert:='';
              StrRit:='';
              StrDrop:='';
              StrKMArgo:='';
              StrKMArgoIsi:='';
              StrKmOdo:=','+ToString(KMOrdo.Text);
            end;
        end;
        StrQry:='INSERT INTO wh_vhc_trans (vhc_trans_id,vehicle_id,vhc_trans_type_id,employee_id,'+
              'phone_no,location_id,day_night,out_date,out_time,out_user'+StrInsert+
              ',out_ordo_km,description,update_user) '+
              'VALUES ('+QuotedStr(TransId)+','+QuotedStr(VhcId)+',1,'+QuotedStr(Mitra.Text)+
              ','+QuotedStr(TelpHP.Text)+','+LocationId+','+IntToStr(DayNight)+',GETDATE(),GETDATE(),'+QuotedStr(User)+
              StrRit+StrDrop+StrKMArgo+StrKMArgoIsi+StrKmOdo+','+QuotedStr(Catatan.Lines.Text)+','+QuotedStr(User)+');';
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          On E:Exception do begin
            StrMsg:=E.Message;
            IsOk:=False;
          end;
        end;
        if (v29.Text<>'0') and (v29.Text<>'') and (v30.Text<>'0') and (v30.Text<>'') then begin
          StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out'+
                  ',update_time,update_user) VALUES('+
                  QuotedStr(TransId)+',1,'+ToString(v29.Text)+','+ToString(v30.Text)+',GETDATE(),'+QuotedStr(User)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            On E:Exception do begin
              StrMsg:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        if (v31.Text<>'0') and (v31.Text<>'') and (v32.Text<>'0') and (v32.Text<>'') then begin
          StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out'+
                  ',update_time,update_user) VALUES('+
                  QuotedStr(TransId)+',2,'+ToString(v31.Text)+','+ToString(v32.Text)+',GETDATE(),'+QuotedStr(User)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            On E:Exception do begin
              StrMsg:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        if (v33.Text<>'0') and (v33.Text<>'') and (v34.Text<>'0') and (v34.Text<>'') then begin
          StrQry:='INSERT INTO wh_vhc_trans_detail_taxi (vhc_trans_id,taxi_detail_type_id,value1_out,value2_out'+
                  ',update_time,update_user) VALUES('+
                  QuotedStr(TransId)+',2,'+ToString(v33.Text)+','+ToString(v34.Text)+',GETDATE(),'+QuotedStr(User)+');';
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            On E:Exception do begin
              StrMsg:=E.Message;
              IsOk:=False;
            end;
          end;
        end;
        if IsOk then begin
          Main.TransCommit;
          NoSPJ.Text:=TransId;
          StrQry:='SELECT CONVERT(VARCHAR(10),out_date,103) AS out_date,CONVERT(VARCHAR(5),out_time,108) AS out_time '+
                'FROM wh_vhc_trans WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          Tanggal.Text:=Qry.FieldValues['out_date'];
          Jam.Text:=Qry.FieldValues['out_time'];
          Bersihkan.SetFocus;
          Qry.Close;
          if MessageBox(0,'SPJ Berhasil Disimpan' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
            Reprint(TransId);
          end;
        end else Begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,PChar('SPJ Gagal Disimpan'+Chr(13)+Chr(13)+StrMsg),'SPJ',MB_OK or MB_ICONERROR)
        end;
      end;
      Qry.Destroy;
      Main.CloseDb;
      Main.M_Normal;
    end else begin

    end;
  end;
end;

procedure TSPJForm.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE location_id='+Chr(39)+LocationId+Chr(39)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QLocation.Caption:=Qry.FieldValues['location'];
      QAddress.Caption:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone_no']<>NULL then
        QAddress.Caption:=QAddress.Caption+' Telp.'+LeftStr(Qry.FieldValues['phone_no'],3)+'-'+RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-3);
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_message WHERE (location_id='+Chr(39)+LocationId+Chr(39)+
          ') AND (GETDATE() BETWEEN from_date AND to_date) AND (active=1);';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      QMessage.Caption:=Qry.FieldValues['message'];
    end else
      QMessage.Caption:='';
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  case FormNumber of
    1:begin
        if IntReguler=1 then begin
          QImageBlank.SendToBack;
          QImageExecutive.SendToBack;
          QLabelReguler.Caption:='REGULER';
        end else begin
          QImageBlank.SendToBack;
          QImageReguler.SendToBack;
          QLabelReguler.Caption:='';
        end;
      end;
    2:begin
        QLabelReguler.Caption:='';
        QImageExecutive.SendToBack;
        QImageReguler.SendToBack;
      end;
  end;
  Main.M_Normal;
end;

procedure TSPJForm.PreparePrintData;
var StrNoBody:String;
begin
  QNoSPJ.Caption:=NoSPJ.Text;
  QTanggal.Caption:=Tanggal.Text;
  QJam.Caption:=Jam.Text;
  QNoKPP.Caption:=Mitra.Text;
  QNama.Caption:=MitraDisp.Text;
  QNoBody.Caption:=NoBody.Text;
  QNoPolisi.Caption:=NoPolisi.Text;
  QTelpHP.Caption:=TelpHP.Text;
  QPetugas.Caption:=User;
  QRit.Caption:=Rit.Text;
  QDrop.Caption:=Drop.Text;
  QKMArgo.Caption:=KMArgo.Text;
  QKMArgoIsi.Caption:=KMArgoIsi.Text;
  QKMOrdo.Caption:=KMOrdo.Text;
  Q29.Caption:=v29.Text;
  Q30.Caption:=v30.Text;
  Q31.Caption:=v31.Text;
  Q32.Caption:=v32.Text;
  Q33.Caption:=v33.Text;
  Q34.Caption:=v34.Text;
  QTandaPetugas.Caption:=UpperCase(User);
  QTandaMitra.Caption:=MitraDisp.Text;
  QCatatan.Caption:=Catatan.Text;
  StrNoBody:=NoBody.Text;
  if (VhcArr[ArrayIndexOf(VhcArr,StrNoBody,1)][13]<>'')
    then QPKB.Caption:='No PKB   : '+VhcArr[ArrayIndexOf(VhcArr,StrNoBody,1)][13];
end;

procedure TSPJForm.RePrint(NoSPJ:String);
var Qry:TADOQuery;
    StrQry:String;
begin
  if NoSPJ<>'' then begin
    RePrintForm.ReportName:='SPJ Operasi';
    RePrintForm.ReportId:=NoSPJ;
    if RePrintForm.ShowModal=1 then begin
      PreparePrint;
      Main.M_Busy;
//      Init;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      if Main.OpenDb then begin
        StrQry:='SELECT a.vhc_trans_id,CONVERT(VARCHAR(10),a.out_date,103) AS out_date,CONVERT(VARCHAR(5),a.out_time,108) AS out_time'+
              ',a.employee_id,b.name,c.body_id,COALESCE(c.license_plate2,c.license_plate) AS license_plate,a.phone_no,a.out_rits,a.out_drops,a.out_argo_km,a.out_ordo_km'+
              ',a.out_hired_km,a.description,d.reguler,e.empl_history_id,CONVERT(VARCHAR(10),e.from_date,103) AS training_date,f.work_order_id'+
      			  ',COALESCE(h.value1_out,''0'') AS v29,COALESCE(h.value2_out,''0'') AS v30,COALESCE(i.value1_out,''0'') AS v31,COALESCE(i.value2_out,''0'') AS v32'+
			        ',COALESCE(j.value1_out,''0'') AS v33,COALESCE(j.value2_out,''0'') AS v34 '+
              'FROM wh_vhc_trans AS a '+
              'INNER JOIN wh_employee AS b ON b.employee_id=a.employee_id '+
              'INNER JOIN wh_vehicle AS c ON c.vehicle_id=a.vehicle_id '+
              'INNER JOIN wh_vhc_detail AS d ON (d.vhc_detail_id='+
              '(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE (vehicle_id=a.vehicle_id))) AND (GETDATE()>d.from_date) '+
              'LEFT JOIN wh_empl_history e ON e.empl_history_id='+
              '(SELECT empl_history_id FROM wh_empl_history WHERE (employee_id=a.employee_id) AND (company_id=3) AND (empl_history_type_id=9)) '+
      			  'LEFT JOIN wh_work_order f ON f.work_order_id=(SELECT MAX(work_order_id) FROM wh_work_order WHERE (vehicle_id=a.vehicle_id) AND (date_out IS NULL)) '+
      			  'LEFT JOIN wh_vhc_trans_detail_taxi h ON (h.vhc_trans_id=a.vhc_trans_id) AND (h.status=1) AND (h.taxi_detail_type_id=1) '+
			        'LEFT JOIN wh_vhc_trans_detail_taxi i ON (i.vhc_trans_id=a.vhc_trans_id) AND (i.status=1) AND (i.taxi_detail_type_id=2) '+
      			  'LEFT JOIN wh_vhc_trans_detail_taxi j ON (j.vhc_trans_id=a.vhc_trans_id) AND (j.status=1) AND (j.taxi_detail_type_id=3) '+
              'WHERE a.vhc_trans_id='+QuotedStr(NoSPJ)+';';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          QNoSPJ.Caption:=Qry.FieldValues['vhc_trans_id'];
          QTanggal.Caption:=Qry.FieldValues['out_date'];
          QJam.Caption:=Qry.FieldValues['out_time'];
          QNoKPP.Caption:=Qry.FieldValues['employee_id'];
          QNama.Caption:=Qry.FieldValues['name'];
          case FormNumber of
            1:begin
                QNoBody.Caption:=Qry.FieldValues['body_id'];
                QLabelNoBody.Caption:='No Body';
                QImageVoucher.SendToBack;
                QImage2934.SendToBack;
                QImage2935.SendToBack;
                QLabelSPBU.Caption:='Petugas SPBU,';
                QTandaSPBU.Caption:='(.........................)';
                if Qry.FieldValues['description']<>NULL then QCatatan.Caption:=Qry.FieldValues['description']
                else QCatatan.Caption:='';
              end;
            2:begin
                QNoBody.Caption:='';
                QLabelNoBody.Caption:='No Polisi';
                QImageVoucher.BringToFront;
                QImage2934.BringToFront;
                QImage2935.BringToFront;
                QLabelSPBU.Caption:='';
                QTandaSPBU.Caption:='';
                QCatatan.Caption:='Waktu kembali adalah pukul '+FormatDateTime('HH:nn',IncHour(StrToTime(Qry.FieldValues['out_time']+':00'),18));
              end;
          end;
          QNoPolisi.Caption:=Qry.FieldValues['license_plate'];
          QTelpHP.Caption:=Qry.FieldValues['phone_no'];
          QPetugas.Caption:=TitleCase(FullName);
          QKMOrdo.Caption:=SToCurr(Qry.FieldValues['out_ordo_km']);
          if Qry.FieldValues['out_rits']<>NULL then begin
            QLabelRit.Caption:='Rit';
            QRit.Caption:=SToCurr(Qry.FieldValues['out_rits'])
          end else begin
            QLabelRit.Caption:='';
            QRit.Caption:='';
          end;
          if Qry.FieldValues['out_drops']<>NULL then begin
            QLabelDrop.Caption:='Drop';
            QDrop.Caption:=SToCurr(Qry.FieldValues['out_drops']);
          end else begin
            QLabelDrop.Caption:='';
            QDrop.Caption:='';
          end;
          if Qry.FieldValues['out_argo_km']<>NULL then begin
            QLabelKMArgo.Caption:='KM Argo';
            QKMArgo.Caption:=SToCurr(Qry.FieldValues['out_argo_km']);
          end else begin
            QLabelKMArgo.Caption:='';
            QKMArgo.Caption:='';
          end;
          if Qry.FieldValues['out_hired_km']<>NULL then begin
            QLabelKMArgoIsi.Caption:='KM Argo Isi';
            QKMArgoIsi.Caption:=SToCurr(Qry.FieldValues['out_hired_km']);
          end else begin
            QLabelKMArgoIsi.Caption:='';
            QKMArgoIsi.Caption:='';
          end;
          if Qry.FieldValues['v29']<>'0' then begin
            Q29.Caption:='29';
            Q29.Caption:=SToCurr(Qry.FieldValues['v29']);
          end else begin
            QLabel29.Caption:='';
            Q29.Caption:='';
          end;
          if Qry.FieldValues['v30']<>'0' then begin
            QLabel30.Caption:='30';
            Q30.Caption:=SToCurr(Qry.FieldValues['v30']);
          end else begin
            QLabel30.Caption:='';
            Q30.Caption:='';
          end;
          if Qry.FieldValues['v31']<>'0' then begin
            QLabel31.Caption:='31';
            Q31.Caption:=SToCurr(Qry.FieldValues['v31']);
          end else begin
            QLabel31.Caption:='';
            Q31.Caption:='';
          end;
          if Qry.FieldValues['v32']<>'0' then begin
            QLabel32.Caption:='32';
            Q32.Caption:=SToCurr(Qry.FieldValues['v32']);
          end else begin
            QLabel32.Caption:='';
            Q32.Caption:='';
          end;
          if Qry.FieldValues['v33']<>'0' then begin
            QLabel33.Caption:='33';
            Q33.Caption:=SToCurr(Qry.FieldValues['v33']);
          end else begin
            QLabel33.Caption:='';
            Q33.Caption:='';
          end;
          if Qry.FieldValues['v34']<>'0' then begin
            QLabel34.Caption:='34';
            Q34.Caption:=SToCurr(Qry.FieldValues['v34']);
          end else begin
            QLabel34.Caption:='';
            Q34.Caption:='';
          end;
          QTandaPetugas.Caption:=TitleCase(FullName);
          QTandaMitra.Caption:=Qry.FieldValues['name'];
          if (Qry.FieldValues['work_order_id']<>NULL) then QPKB.Caption:='No PKB   : '+Qry.FieldValues['work_order_id'];
          IntReguler:=Qry.FieldValues['reguler'];
//          if Qry.FieldValues['empl_history_id']<>NULL then begin
//            QLabelLayananPrima.Caption:='Training Pelayanan Prima ('+Qry.FieldValues['training_date']+')';
//          end else QLabelLayananPrima.Caption:='';
          Main.M_Normal;
          Report.Preview;
        end;
        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end;
    RefreshGrid;
    RefreshCombo;
  end;
end;

procedure TSPJForm.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Mitra.SetFocus;
  if Key = #27 then SPJForm.Close;
end;

procedure TSPJForm.MitraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TelpHP.SetFocus;
  if Key = #27 then SPJForm.Close;
end;

procedure TSPJForm.TelpHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Pagi.SetFocus;
end;

procedure TSPJForm.PagiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if GroupDetail.Enabled then Rit.SetFocus else Catatan.SetFocus;
end;

procedure TSPJForm.MalamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Rit.Enabled then Rit.SetFocus else Catatan.SetFocus;
end;

procedure TSPJForm.RitKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Drop.SetFocus;
end;

procedure TSPJForm.DropKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgo.SetFocus;
end;

procedure TSPJForm.KMArgoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgoIsi.SetFocus;
end;

procedure TSPJForm.KMOrdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then
    case FormNumber of
      1:Rit.SetFocus;
      2:Catatan.SetFocus;
    end;
end;

procedure TSPJForm.CatatanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TSPJForm.CetakUlangClick(Sender: TObject);
begin
  SPJReprint:=TSPJReprint.Create(Self);
end;


procedure TSPJForm.KMArgoIsiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then v29.SetFocus;
end;

procedure TSPJForm.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoBody.SetFocus;
  if Key = #27 then SPJForm.Close;
end;

procedure TSPJForm.RitChange(Sender: TObject);
begin
{  if ((Rit.Text='0') OR (Trim(Rit.Text)='')) AND
      ((Drop.Text='0') OR (Trim(Drop.Text)=''))
    then GroupDetail.Enabled:=True else
    GroupDetail.Enabled:=False
}
end;

procedure TSPJForm.GridMitraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then SPJForm.Close;
end;

procedure TSPJForm.v34KeyPress(Sender: TObject; var Key: Char);
begin
  Catatan.SetFocus;
end;

procedure TSPJForm.v29KeyPress(Sender: TObject; var Key: Char);
begin
  v30.SetFocus;
end;

procedure TSPJForm.v30KeyPress(Sender: TObject; var Key: Char);
begin
  v31.SetFocus;
end;

procedure TSPJForm.v31KeyPress(Sender: TObject; var Key: Char);
begin
  v32.SetFocus;
end;

procedure TSPJForm.v32KeyPress(Sender: TObject; var Key: Char);
begin
  v33.SetFocus;
end;

procedure TSPJForm.v33KeyPress(Sender: TObject; var Key: Char);
begin
  v34.SetFocus;
end;

end.
