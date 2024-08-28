unit VehicleMutationU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ADODB, ComCtrls, ExtCtrls, WHUnit;

type
  TDblArr=Array[0..1] of String;
  TVehicleMutation = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label1: TLabel;
    Label2: TLabel;
    SBU: TComboBox;
    Label3: TLabel;
    TglMutasi: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Mutasi: TRadioButton;
    NonAktif: TRadioButton;
    Panel2: TPanel;
    NoBodi: TEdit;
    NoPolisi: TEdit;
    AwalLokasi: TEdit;
    Label6: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure SBUKeyPress(Sender: TObject; var Key: Char);
    procedure TglMutasiKeyPress(Sender: TObject; var Key: Char);
    procedure MutasiClick(Sender: TObject);
    procedure NonAktifClick(Sender: TObject);
    procedure MutasiKeyPress(Sender: TObject; var Key: Char);
    procedure NonAktifKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CompanyArr:array of TArrString5;
    VhcId:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleId:String);Overload;
  end;

var
  VehicleMutation: TVehicleMutation;

implementation

uses MainU, VehicleListU;

{$R *.dfm}

constructor TVehicleMutation.Create(AOwner:TComponent;VehicleId:String);
begin
  VhcId:=VehicleId;
  inherited Create(AOwner);
end;

procedure TVehicleMutation.Init;
begin
  NoBodi.Text:='';
  AwalLokasi.Text:='';
  SBU.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  TglMutasi.Date:=Now();
  Mutasi.Checked:=True;
end;

procedure TVehicleMutation.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TVehicleMutation.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
{    QStr:='SELECT a.vehicle_id,a.body_id,c.location FROM wh_vehicle AS a '+
        'LEFT JOIN wh_vhc_detail AS b ON b.vhc_detail_id='+
        '(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail WHERE vehicle_id=a.vehicle_id) '+
        'LEFT JOIN wh_location AS c ON c.location_id=b.location_id '+
        'WHERE a.vehicle_id='+Chr(39)+VhcId+Chr(39)+';';
}
    StrQry:='EXEC GetVehicleDetail '+QuotedStr(VhcId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    NoBodi.Text:=Qry.FieldValues['body_id'];
    if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
       NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
    else
       NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
    AwalLokasi.Text:=Qry.FieldValues['location'];
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleMutation.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrVhcDetailId,StrSBULocation,StrSBUCompany:String;
    STNK,KIR,KIU,KIO,Tera,Reguler:String;
    Ok:Boolean;
begin
  Ok:=True;
  if (Trim(VhcId)<>'') then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrSBULocation:=CompanyArr[SBU.ItemIndex][2];
    StrSBUCompany:=CompanyArr[SBU.ItemIndex][1];
    if Main.OpenDb then begin
      StrQry:='SELECT * FROM wh_vhc_detail '+
            'WHERE vhc_detail_id=(SELECT MAX(vhc_detail_id) FROM wh_vhc_detail '+
            'WHERE vehicle_id='+Chr(39)+VhcId+Chr(39)+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      StrQry:='';
      STNK:='NULL';
      KIR:='NULL';
      KIU:='NULL';
      KIO:='NULL';
      Tera:='NULL';
      Reguler:='0';
      if Qry.RecordCount>0 then if Qry.FieldValues['vhc_detail_id']<>NULL then begin
        StrVhcDetailId:=Qry.FieldValues['vhc_detail_id'];
        if Qry.FieldValues['stnk']<>NULL then STNK:=Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['stnk'])+Chr(39);
        if Qry.FieldValues['kir']<>NULL then KIR:=Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['kir'])+Chr(39);
        if Qry.FieldValues['kiu']<>NULL then KIU:=Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['kiu'])+Chr(39);
        if Qry.FieldValues['kio']<>NULL then KIO:=Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['kio'])+Chr(39);
        if Qry.FieldValues['tera']<>NULL then Tera:=Chr(39)+FormatDateTime('yyyy-mm-dd',Qry.FieldValues['tera'])+Chr(39);
        if Qry.FieldValues['reguler']<>NULL then Reguler:=Chr(39)+IntToStr(Qry.FieldValues['reguler'])+Chr(39);
        StrQry:=' UPDATE wh_vhc_detail SET to_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglMutasi.Date))+
              ' WHERE vhc_detail_id='+QuotedStr(StrVhcDetailId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            Ok:=False;
          end
        end;
      end;
      if Mutasi.Checked then begin
        StrQry:=' INSERT INTO wh_vhc_detail (vehicle_id,location_id,stnk,kir,kiu,kio,tera,'+
              'from_date,reguler,update_user) '+
              'VALUES ('+QuotedStr(VhcId)+','+StrSBULocation+','+STNK+','+KIR+
              ','+KIU+','+KIO+','+Tera+','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglMutasi.Date))+
              ','+Reguler+','+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            Ok:=False;
          end
        end;
        StrQry:='UPDATE wh_vehicle SET company_id='+StrSBUCompany+',update_user='+QuotedStr(User)+
                ' WHERE vehicle_id='+QuotedStr(VhcId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            Ok:=False;
          end
        end;
      end else begin
        StrQry:='UPDATE wh_vehicle SET active=0, update_user='+QuotedStr(User)+
                ',update_time='+QuotedStr(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now)) +
                ' WHERE vehicle_id='+Chr(39)+VhcId+Chr(39)+';';
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            Ok:=False;
          end
        end;
      end;
      if Ok then begin
        MessageBox(0,'Mutasi Armada Berhasil','Mutasi Armada',MB_OK or MB_ICONWARNING);
        VehicleList.ClearCari;
        VehicleList.RefreshList;
        Close;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TVehicleMutation.BatalClick(Sender: TObject);
begin
  VehicleMutation.Close;
end;

procedure TVehicleMutation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleMutation.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TVehicleMutation.SBUKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then TglMutasi.SetFocus;
end;

procedure TVehicleMutation.TglMutasiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.Click;
end;

procedure TVehicleMutation.MutasiClick(Sender: TObject);
begin
  if Mutasi.Checked then SBU.Enabled:=True;
end;

procedure TVehicleMutation.NonAktifClick(Sender: TObject);
begin
  if NonAktif.Checked then SBU.Enabled:=False;
end;

procedure TVehicleMutation.MutasiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if SBU.Enabled=True then SBU.SetFocus
  else TglMutasi.SetFocus;
end;

procedure TVehicleMutation.NonAktifKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then if SBU.Enabled then SBU.SetFocus
  else TglMutasi.SetFocus;
end;

end.
