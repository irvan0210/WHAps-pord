unit SPJServiceFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit, ExtCtrls, QRCtrls, QuickRpt, StrUtils;

type
  TSPJServiceForm = class(TForm)
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Tanggal: TEdit;
    NoSPJ: TEdit;
    Jam: TEdit;
    Label2: TLabel;
    NoBody: TComboBox;
    NoPolisi: TEdit;
    Label15: TLabel;
    TelpHP: TEdit;
    Pengemudi: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    GroupTujuan: TPanel;
    Service: TRadioButton;
    TestDrive: TRadioButton;
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
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
    QNama: TQRLabel;
    QNoBody: TQRLabel;
    QNoPolisi: TQRLabel;
    QNoPKB: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel34: TQRLabel;
    QLocation: TQRLabel;
    QAddress: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QTelpHP: TQRLabel;
    QRBand2: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QKMOrdo: TQRLabel;
    QCatatan: TQRLabel;
    QKMArgo: TQRLabel;
    QDrop: TQRLabel;
    QRit: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel50: TQRLabel;
    QKMArgoIsi: TQRLabel;
    QRShape13: TQRShape;
    QRLabel25: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
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
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QLokasiTujuan: TQRLabel;
    Tujuan: TComboBox;
    LabelLokasi: TLabel;
    TujuanDisp: TEdit;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QTujuan: TQRLabel;
    Label16: TLabel;
    GroupPanel: TPanel;
    Label10: TLabel;
    GroupDetail: TGroupBox;
    Rit: TEdit;
    Drop: TEdit;
    KMArgo: TEdit;
    KMOrdo: TEdit;
    KMArgoIsi: TEdit;
    Catatan: TMemo;
    Label4: TLabel;
    Petugas: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    Panel1: TPanel;
    NoPKB: TEdit;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape16: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    v29: TEdit;
    v30: TEdit;
    v31: TEdit;
    v32: TEdit;
    v33: TEdit;
    v34: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure PengemudiKeyPress(Sender: TObject; var Key: Char);
    procedure TelpHPKeyPress(Sender: TObject; var Key: Char);
    procedure ServiceKeyPress(Sender: TObject; var Key: Char);
    procedure TestDriveKeyPress(Sender: TObject; var Key: Char);
    procedure RitKeyPress(Sender: TObject; var Key: Char);
    procedure DropKeyPress(Sender: TObject; var Key: Char);
    procedure KMArgoKeyPress(Sender: TObject; var Key: Char);
    procedure KMOrdoKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure KMArgoIsiKeyPress(Sender: TObject; var Key: Char);
    procedure TujuanChange(Sender: TObject);
    procedure TujuanKeyPress(Sender: TObject; var Key: Char);
    procedure TestDriveClick(Sender: TObject);
    procedure ServiceClick(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString30;
    TujuanArr:Array of TArrString4;
    procedure Init;
    procedure RefreshCombo;
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
  SPJServiceForm: TSPJServiceForm;

implementation

{$R *.dfm}

Uses MainU, RePrintFormU, SPJServReprintU;

procedure TSPJServiceForm.Init;
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
  Jam.Text:='';
  NoSPJ.Text:='';
  NoPolisi.Text:='';
  Tujuan.Text:='';
  Tujuan.ItemIndex:=0;
  Tujuan.Items.Clear;
  TujuanDisp.Text:='';
  Pengemudi.Text:='';
  TelpHP.Text:='';
  Petugas.Text:=User;
  Service.Checked:=False;
  TestDrive.Checked:=True;
  Rit.Text:='';
  Drop.Text:='';
  KMArgo.Text:='';
  KMOrdo.Text:='';
  Catatan.Text:='';
  GroupDetail.Enabled:=False;
end;

procedure TSPJServiceForm.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetVhcAvailList '+LocationId+' ;';
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
    Main.CloseDb;
  end;
  for Count:=0 to Length(VhcArr)-1 do
    NoBody.Items.Add(VhcArr[Count][1]);
  for Count:=0 to Length(TujuanArr)-1 do
    Tujuan.Items.Add(TujuanArr[Count][0]);
  Main.M_Normal;
end;

procedure TSPJServiceForm.SetMobil;
begin
  if NoBody.Text<>'' then begin
    NoPolisi.Text:=Copy(VhcArr[NoBody.ItemIndex][2],1,1)+' '+Copy(VhcArr[NoBody.ItemIndex][2],2,4)+
                   ' '+Copy(VhcArr[NoBody.ItemIndex][2],6,Length(VhcArr[NoBody.ItemIndex][2])+1);
    Rit.Text:=VhcArr[NoBody.ItemIndex][4];
    Drop.Text:=VhcArr[NoBody.ItemIndex][6];
    KMArgo.Text:=VhcArr[NoBody.ItemIndex][8];
    KMArgoIsi.Text:=VhcArr[NoBody.ItemIndex][12];
    KMOrdo.Text:=VhcArr[NoBody.ItemIndex][10];
    NoPKB.Text:=VhcArr[NoBody.ItemIndex][13];
    if VhcArr[NoBody.ItemIndex][13]<>'' then Service.Checked:=True;
    v29.Text:=SToCurr(VhcArr[NoBody.ItemIndex][16]);
    v30.Text:=SToCurr(VhcArr[NoBody.ItemIndex][17]);
    v31.Text:=SToCurr(VhcArr[NoBody.ItemIndex][18]);
    v32.Text:=SToCurr(VhcArr[NoBody.ItemIndex][19]);
    v33.Text:=SToCurr(VhcArr[NoBody.ItemIndex][20]);
    v34.Text:=SToCurr(VhcArr[NoBody.ItemIndex][21]);
    if (StrToInt(Trim(KMArgo.Text))<1) AND (StrToInt(Trim(KMOrdo.Text))<1) then begin
      GroupDetail.Enabled:=True;
    end else
      GroupDetail.Enabled:=False;
  end;
end;

procedure TSPJServiceForm.DisableInput;
begin
  Simpan.Enabled:=False;
  NoBody.Enabled:=False;
  Pengemudi.Enabled:=False;
  TelpHP.Enabled:=False;
  Tujuan.Enabled:=False;
  GroupTujuan.Enabled:=False;
  GroupDetail.Enabled:=False;
  Catatan.Enabled:=False;
end;

procedure TSPJServiceForm.EnableInput;
begin
  Simpan.Enabled:=True;
  NoBody.Enabled:=True;
  Pengemudi.Enabled:=True;
  TelpHP.Enabled:=True;
  Tujuan.Enabled:=True;
  GroupTujuan.Enabled:=True;
  GroupDetail.Enabled:=True;
  Catatan.Enabled:=True;
end;


procedure TSPJServiceForm.SelesaiClick(Sender: TObject);
begin
  SPJServiceForm.Close;
end;

procedure TSPJServiceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJServiceForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TSPJServiceForm.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TSPJServiceForm.NoBodyChange(Sender: TObject);
begin
  SetMobil;
end;

procedure TSPJServiceForm.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Service.SetFocus;
end;

procedure TSPJServiceForm.PengemudiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TelpHP.SetFocus;
end;

procedure TSPJServiceForm.TelpHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Tujuan.SetFocus;
end;

procedure TSPJServiceForm.ServiceKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Pengemudi.SetFocus;
end;

procedure TSPJServiceForm.TestDriveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Pengemudi.SetFocus;
end;

procedure TSPJServiceForm.RitKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Drop.SetFocus;
end;

procedure TSPJServiceForm.DropKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgo.SetFocus;
end;

procedure TSPJServiceForm.KMArgoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgoIsi.SetFocus;
end;

procedure TSPJServiceForm.KMOrdoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Catatan.SetFocus;
end;

procedure TSPJServiceForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,VhcId,TransId,TransType,StrPKB,StrMsg:String;
    Count,TransOldId:Integer;
    IsOk:Boolean;
begin
  IsOk:=True;
  if ((NoBody.Text<>'') AND (Pengemudi.Text<>'') AND (TestDrive.Checked) AND
    (TelpHP.Text<>'') ) OR ( (NoBody.Text<>'') AND (Pengemudi.Text<>'') AND (Service.Checked) AND
    (TelpHP.Text<>'') AND (Tujuan.Text<>'')) then begin
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      for Count:=0 to Length(VhcArr)-1 do begin
        if ArrayIndexOf(VhcArr,NoBody.Text,1)>=0 then begin
          VhcId:=VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][0];
        end;
      end;
      StrQry:='SELECT RIGHT(MAX(vhc_trans_id),4) AS vhc_trans_id FROM wh_vhc_trans '+
            'WHERE vhc_trans_id  LIKE '+Chr(39)+'SPB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['vhc_trans_id']<>NULL then begin
        TransOldId:=Qry.FieldValues['vhc_trans_id'];
        TransId:=Format('%.*d',[4,TransOldId+1]);
        Qry.Close;
        Qry.SQL.Clear;
      end else
        TransId:='0001';
      TransId:='SPB'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
               FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      StrQry:='INSERT INTO wh_vhc_trans (vhc_trans_id,vehicle_id,vhc_trans_type_id,'+
            'phone_no,location_id,day_night,out_date,out_time,out_user,out_rits,out_drops'+
            ',out_argo_km,out_hired_km,out_ordo_km,description,update_time,update_user) '+
            'VALUES ('+Chr(39)+TransId+Chr(39)+','+Chr(39)+VhcId+Chr(39)+',2,'+
            Chr(39)+TelpHP.Text+Chr(39)+','+LocationId+',1,GETDATE(),GETDATE(),'+
            Chr(39)+User+Chr(39)+','+Trim(Rit.Text)+','+Trim(Drop.Text)+','+Trim(KMArgo.Text)+
            ','+Trim(KMArgoIsi.Text)+','+Trim(KMOrdo.Text)+','+Chr(39)+
            Catatan.Lines.Text+Chr(39)+',GETDATE(),'+Chr(39)+User+Chr(39)+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do IsOk:=False;
      end;
      if Service.Checked then TransType:='1' else TransType:='2';
      if Trim(NoPKB.Text)<>'' then StrPKB:=Chr(39)+Trim(NoPKB.Text)+Chr(39) else StrPKB:='NULL';
      StrQry:='INSERT INTO wh_vhc_trans_detail_eng (vhc_trans_id,work_order_id,service_location_id,vhc_out_reason_id,driver_id'+
            ',update_time,update_user) VALUES '+
            '('+Chr(39)+TransId+Chr(39)+','+StrPKB+','+Chr(39)+Tujuan.Text+Chr(39)+','+Chr(39)+TransType+Chr(39)+
            ','+Chr(39)+Pengemudi.Text+Chr(39)+',GETDATE(),'+Chr(39)+User+Chr(39)+');';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do IsOk:=False;
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
        DisableInput;
        NoSPJ.Text:=TransId;
        StrQry:='SELECT CONVERT(VARCHAR(10),out_date,103) AS out_date,CONVERT(VARCHAR(5),out_time,108) AS out_time '+
              'FROM wh_vhc_trans WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        Tanggal.Text:=Qry.FieldValues['out_date'];
        Jam.Text:=Qry.FieldValues['out_time'];
        Qry.Close;
        if MessageBox(0,'SPJ Berhasil Disimpan' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
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
        MessageBox(0,'    SPJ Gagal DiSimpan'+Chr(13)+'Periksa Kembali Kolom isian'+Chr(13)+'     Atau Hubungi IT','SPJ',MB_OK or MB_ICONWARNING);
      end;
      Main.CloseDb;
    end;
    Main.M_Normal;
  end else begin
    MessageBox(0,'Periksa Kembali Kolom isian','SPJ',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TSPJServiceForm.PreparePrint;
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
    end;
    Qry.Close;
    Main.CloseDb;
  end
end;

procedure TSPJServiceForm.PreparePrintData;
begin
  QNoSPJ.Caption:=NoSPJ.Text;
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
end;

procedure TSPJServiceForm.CetakUlangSPJ(NoSPJ:String);
var Qry:TADOQuery;
    QStr:String;
begin
  if NoSPJ<>'' then begin
    Init;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
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
        QMessage.Caption:='';
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
    RefreshCombo;
  end;
end;

procedure TSPJServiceForm.CetakUlangClick(Sender: TObject);
begin
  SPJServReprint:=TSPJServReprint.Create(Self);
end;

procedure TSPJServiceForm.KMArgoIsiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMOrdo.SetFocus;
end;

procedure TSPJServiceForm.TujuanChange(Sender: TObject);
begin
  TujuanDisp.Text:=TujuanArr[Tujuan.ItemIndex][1];
end;

procedure TSPJServiceForm.TujuanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    if GroupDetail.Enabled then Rit.SetFocus
    else Catatan.SetFocus;
end;

procedure TSPJServiceForm.PopOut(Height:Integer);
begin
  GroupPanel.Top:=GroupPanel.Top+Height;
end;

procedure TSPJServiceForm.PopIn(Height:Integer);
begin
  GroupPanel.Top:=GroupPanel.Top-Height;
end;


procedure TSPJServiceForm.TestDriveClick(Sender: TObject);
begin
  if TestDrive.Checked=True then begin
    LabelLokasi.Visible:=False;
    Tujuan.Visible:=False;
    TujuanDisp.Visible:=False;
    PopIn(Tujuan.Height+3);
  end;
end;

procedure TSPJServiceForm.ServiceClick(Sender: TObject);
begin
  if Service.Checked=True then begin
    LabelLokasi.Visible:=True;
    Tujuan.Visible:=True;
    TujuanDisp.Visible:=True;
    PopOut(Tujuan.Height+3);
  end;
end;

end.
