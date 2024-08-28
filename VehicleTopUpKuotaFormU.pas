unit VehicleTopUpKuotaFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,WHUnit;

type
  TVehicleTopUpKuotaForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Group: TPanel;
    GroupInput: TPanel;
    kuota: TEdit;
    Simpan: TButton;
    Batal: TButton;
    Label6: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    NoMsisdn: TEdit;
    Label21: TLabel;
    NoPolisi: TEdit;
    Label11: TLabel;
    NoPolisi2: TEdit;
    TopupDate: TDateTimePicker;
    VehicleId: TEdit;
    Label3: TLabel;
    harga: TEdit;
    Label4: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hargaEnter(Sender: TObject);
    procedure hargaExit(Sender: TObject);
    procedure kuotaKeyPress(Sender: TObject; var Key: Char);
    procedure hargaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
  public
    Constructor Create(AOwner:TComponent;VehicleId:String);Overload;
    { Public declarations }
  end;

var
  VehicleTopUpKuotaForm: TVehicleTopUpKuotaForm;
  VhcId:String;

implementation

uses MainU, ADODB, UserGroupListU;

{$R *.dfm}

Constructor TVehicleTopUpKuotaForm.Create(AOwner:TComponent;VehicleId:String);
begin
  VhcId:=VehicleId;
  Inherited Create(AOwner);
end;


procedure TVehicleTopUpKuotaForm.Init;
begin
  Simpan.Enabled:=True;
  kuota.Text:='';
  TopupDate.Date:=Now;
end;

procedure TVehicleTopUpKuotaForm.LoadData;
var IntCount:Integer;
    StrQry,VhcTypeDetailImageTypeId,VhcTypeDetailId,VhcOwner,Karoseri,Dealer,GPCode:String;
    Qry:TADOQuery;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin

    StrQry:='EXEC GetVehicleDetail '+QuotedStr(VhcId)+';';

    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      VhcTypeDetailImageTypeId:='';
      VhcId:=Qry.FieldValues['vehicle_id'];

      NoPolisi.Text:=LicensePlate(Qry.FieldValues['license_plate']);
      if Qry.FieldValues['license_plate2']<>NULL then LicensePlate(Qry.FieldValues['license_plate2']);
      NoMsisdn.Text:=VarToStr(Qry.FieldValues['msisdn']);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleTopUpKuotaForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrActive,StrEMsg,
    StrDateTopup,StrDateNow,StrDateBefore,
    StrVhcTransId,StrCustomerOrder:String;
    IsOk:Boolean;
    IntCount,isStartTopup:Byte;
    VhcTransIdArr, CustomerOrderArr:Array of TArrString1;
begin
  if ((Trim(kuota.Text)<>'')OR(Trim(kuota.Text)<>'0')) and ((Trim(harga.Text)<>'')OR(Trim(harga.Text)<>'0')) then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    SetLength(VhcTransIdArr,0);
    SetLength(CustomerOrderArr,0);

    if Main.OpenDb then begin
      Main.TransStart;

      Qry.Close;
      StrQry:='SELECT value_string FROM wh_setting WHERE (setting_name='+QuotedStr('StartTopupKuota_CompanyId_'+CompanyId)+') and (active=1);';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        if Qry.FieldValues['value_string']<>NULL then isStartTopup:=Qry.FieldValues['value_string'];
      end;
      Qry.Close;

      //if Active.Checked then StrActive:='1' else StrActive:='0';
      StrQry:='SELECT RIGHT(MAX(msisdn_topup_id),4) AS max_id FROM wh_vhc_msisdn_topup '+
              'WHERE msisdn_topup_id  LIKE '+Chr(39)+'TOPUP'+LocationCode+
                  FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                  '____'+Chr(39)+';';
              ;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then
        StrMaxId:=Qry.FieldValues['max_id']
      else
        StrMaxId:='0000';
      StrMaxId:=Format('%.*d',[4, StrToInt(StrMaxId)+1]);

      StrMaxId:='TOPUP'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;

      {Cek Topup sebelumnya}
      {'(msisdn_topup_id, vehicle_id, msisdn, kuota, date_topup, vhc_trans_id, update_user, status) '+ }
      StrDateTopup:=QuotedStr(FormatDateTime('yyyy-mm-dd', TopupDate.Date));
      Qry.Close;
      StrQry:='SELECT Max(date_topup) as tglTopup FROM wh_vhc_msisdn_topup '+
              'WHERE Status=1 AND vehicle_id='+QuotedStr(VhcId)+'; ';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.FieldValues['tglTopup']<>null) then
        StrDateBefore:=QuotedStr(FormatDateTime('yyyy-mm-dd',Qry.FieldValues['tglTopup']+1))
      else
        StrDateBefore:=QuotedStr(FormatDateTime('yyyy-mm-dd',TopupDate.Date-5));
      StrDateNow:=QuotedStr(FormatDateTime('yyyy-mm-dd', Date));
      StrDateTopup:=QuotedStr(FormatDateTime('yyyy-mm-dd', TopupDate.Date));

      StrQry:=' SELECT a.vhc_trans_id as noSJ, c.customer_order_id '+
              ' FROM wh_vhc_trans a '+
              ' left join wh_reserved_order_detail b on a.vhc_trans_id=b.vhc_trans_id and b.status=1 '+
              ' left join wh_reserved_order c on c.reserved_order_id=b.reserved_order_id and c.status=1 '+
              ' WHERE Coalesce(cancel,0)=0 AND (CAST(out_date as Date) between '+StrDateBefore+' AND '+StrDateTopup+') AND '+
              ' a.Location_Id='+LocationId+' and a.vehicle_id='+QuotedStr(VhcId)+';';

      (*
      if isStartTopup=1 then begin
        StrDateBefore:=QuotedStr(FormatDateTime('yyyy-mm-dd',TopupDate.Date-5));
        StrQry:='SELECT vhc_trans_id as noSJ FROM wh_vhc_trans '+
                'WHERE Coalesce(cancel,0)=0 AND (CAST(out_date as Date) between '+StrDateBefore+' AND '+StrDateTopup+') AND '+
                'Location_Id='+LocationId+' and vehicle_id='+QuotedStr(VhcId)+';';
      end else begin
        if TopupDate<Date then begin
          Qry.Close;
          StrQry:='SELECT Max(date_topup) as tglTopup FROM wh_vhc_msisdn_topup '+
                  'WHERE Status=1 AND vehicle_id='+QuotedStr(VhcId)+'; ';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;

          if (Qry.FieldValues['tglTopup']<>null) then
            StrDateBefore:=QuotedStr(FormatDateTime('yyyy-mm-dd',Qry.FieldValues['tglTopup']+1))
          else
          StrDateBefore:=QuotedStr(FormatDateTime('yyyy-mm-dd',TopupDate.Date-5));
          StrDateNow:=QuotedStr(FormatDateTime('yyyy-mm-dd', Date));
          StrDateTopup:=QuotedStr(FormatDateTime('yyyy-mm-dd', TopupDate.Date));

          StrQry:='SELECT vhc_trans_id as noSJ FROM wh_vhc_trans '+
                  'WHERE Coalesc1e(cancel,0)=0 AND (CAST(out_date as Date) between '+StrDateTopup+' AND '+StrDateNow+') AND '+
                  'Location_Id='+LocationId+' and vehicle_id='+QuotedStr(VhcId)+';';
        end else begin
          StrDateNow:=QuotedStr(FormatDateTime('yyyy-mm-dd', Date));
          StrDateTopup:=QuotedStr(FormatDateTime('yyyy-mm-dd', TopupDate.Date));
          StrQry:='SELECT vhc_trans_id as noSJ FROM wh_vhc_trans '+
                  'WHERE Coalesce(cancel,0)=0 AND (CAST(out_date as Date) between '+StrDateTopup+' AND '+StrDateNow+') AND '+
                  'Location_Id='+LocationId+' and vehicle_id='+QuotedStr(VhcId)+';';
        end;

      end;
      *)
      {Ambil data SJ dari tgl topup s/d tgl Topup sebelumnya}
      Qry.Close;

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      SetLength(VhcTransIdArr,Qry.RecordCount);
      SetLength(CustomerOrderArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while Not Qry.Eof do begin
          VhcTransIdArr[IntCount][0]   :=VarToStr(Qry.FieldValues['noSJ']);
          CustomerOrderArr[IntCount][0]:=VarToStr(Qry.FieldValues['customer_order_id']);
          if IntCount=0 then StrVhcTransId:=VarToStr(Qry.FieldValues['noSJ'])
          else StrVhcTransId:=StrVhcTransId+','+VarToStr(Qry.FieldValues['noSJ']);
          Inc(IntCount);
          Qry.Next;
      end;
      Qry.Close;

      StrQry:='INSERT INTO wh_vhc_msisdn_topup '+
              '(msisdn_topup_id, vehicle_id, msisdn, kuota, date_topup, vhc_trans_id, update_user, status) '+
              'VALUES ('+QuotedStr(StrMaxId)+','+QuotedStr(VhcId)+','+QuotedStr(NoMsisdn.Text)+
              ','+QuotedStr(kuota.Text)+','+StrDateTopup+','+QuotedStr(StrVhcTransId)+','+QuotedStr(User)+',1);';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
          Qry.ExecSQL;
      except on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
      end;
      if Length(VhcTransIdArr)>0 Then begin
        for IntCount:=0 to Length(VhcTransIdArr)-1 do begin
          StrVhcTransId:=QuotedStr(VhcTransIdArr[IntCount][0]);
          StrCustomerOrder:=QuotedStr(CustomerOrderArr[IntCount][0]);

          StrQry:='INSERT INTO wh_vhc_msisdn_topup_vhc_trans '+
                  '(msisdn_topup_id, vhc_trans_id, customer_order_id, update_user, status) '+
                  'VALUES ('+QuotedStr(StrMaxId)+','+StrVhcTransId+','+StrCustomerOrder+','+QuotedStr(User)+',1); ';
          StrQry:=StrQry+'UPDATE  wh_vhc_trans SET topupId='+QuotedStr(StrMaxId)+
                  ' WHERE vhc_trans_id='+StrVhcTransId+'; ';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do  begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end
          end;
        end;
      end;

      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data','Reload Kuota',MB_OK or MB_ICONINFORMATION);
        Init;
        Close;
      end else begin
        Main.TransRollback;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'Reload Kuota',MB_OK or MB_ICONERROR);
      end;
      FreeAndNil(Qry);
    end;
    Main.CloseDb;
  end;
end;


procedure TVehicleTopUpKuotaForm.BatalClick(Sender: TObject);
begin
  VehicleTopUpKuotaForm.Close;
end;

procedure TVehicleTopUpKuotaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TVehicleTopUpKuotaForm.FormShow(Sender: TObject);
begin
  Init;
  VehicleId.Text := VhcId;
  if VehicleId.Text<>'' then LoadData;
  if NoMsisdn.Text<>'' then Simpan.Enabled:=True
  else Simpan.Enabled:=False;
end;

procedure TVehicleTopUpKuotaForm.hargaEnter(Sender: TObject);
begin
  harga.Text:=ToString(harga.Text);
end;

procedure TVehicleTopUpKuotaForm.hargaExit(Sender: TObject);
begin
  if ToString(harga.Text)='' then harga.Text:='0';
  harga.Text:=SToCurr(harga.Text);
end;

procedure TVehicleTopUpKuotaForm.kuotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    harga.SetFocus;
  end;
end;

procedure TVehicleTopUpKuotaForm.hargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    TopupDate.SetFocus;
  end;
end;

end.
