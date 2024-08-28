unit EditKMSJBusFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,WHUnit, Mask, Buttons;

const
  WM_SHOWMYOTHERFORM = WM_USER + 0;

type
  TEditKMSJBusForm = class(TForm)
    GroupInput: TPanel;
    Simpan: TButton;
    Batal: TButton;
    out_ordo_km: TEdit;
    Label4: TLabel;
    NoSJ: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    in_ordo_km: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    jarak: TEdit;
    Label14: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure out_ordo_kmEnter(Sender: TObject);
    procedure out_ordo_kmExit(Sender: TObject);

    procedure out_ordo_kmKeyPress(Sender: TObject; var Key: Char);

    procedure NoSJExit(Sender: TObject);
    procedure NoSJKeyPress(Sender: TObject; var Key: Char);
    procedure TopupTimeKeyPress(Sender: TObject; var Key: Char);
    procedure btnTombolCariClick(Sender: TObject);
    procedure in_ordo_kmEnter(Sender: TObject);
    procedure in_ordo_kmExit(Sender: TObject);
    procedure in_ordo_kmKeyPress(Sender: TObject; var Key: Char);
    procedure out_ordo_kmChange(Sender: TObject);
    procedure in_ordo_kmChange(Sender: TObject);

  private
    { Private declarations }
    EtollArr:Array of TArrString5;
    outOrdoKm,InOrdoKm : Integer;
    procedure Init;

    procedure LoadData;
    procedure WMShowMyOtherForm(var Message: TMessage); message WM_SHOWMYOTHERFORM;

  public
    Constructor Create(AOwner:TComponent;VhcTrans_Id:String; isModal: Boolean);Overload;
    { Public declarations }
  end;

var
  EditKMSJBusForm: TEditKMSJBusForm;
  VhcTransId:String;

implementation

uses MainU, ADODB, UserGroupListU, SPJBusListU, AuthorizedFormU;

{$R *.dfm}

Constructor TEditKMSJBusForm.Create(AOwner:TComponent;VhcTrans_Id:String; isModal: Boolean);
begin
  VhcTransId:=VhcTrans_Id;

  inherited Create(AOwner);
(*
  Position := poMainFormCenter;
  if not (isModal) then
  begin
    FormStyle := fsMDIChild;
    Visible := True;
  end else begin
    FormStyle := fsNormal;
    Visible := False;
  end;
*)
  //Inherited Create(AOwner);
end;


procedure TEditKMSJBusForm.Init;
begin

  Simpan.Enabled:=True;

end;



procedure TEditKMSJBusForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,
    StrDate,StrTime,StrNoSJ,StrNilai,StrEMsg:String;
    IsOk,IsNoRecord:Boolean;
    IntCount,isStartTopup:Byte;
    VhcTransIdArr, CustomerOrderArr:Array of TArrString1;
begin
  if (Trim(NoSJ.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    IsNoRecord:=True;
    SetLength(VhcTransIdArr,0);
    SetLength(CustomerOrderArr,0);

    if Main.OpenDb then begin
      Main.TransStart;
      StrNoSJ:=Trim(NoSJ.Text);
      if (CekNoSJ(StrNoSJ)=StrNoSJ) then begin
          if (StrNoSJ<>'')  then begin
            //REVODORB0000
            StrQry:='SELECT RIGHT(MAX(vhc_trans_ordo_rev_id),4) AS max_id FROM wh_vhc_trans_ordo_rev '+
                    'WHERE  vhc_trans_ordo_rev_id  LIKE '+Chr(39)+'REVODO'+LocationCode+
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

            StrMaxId:='REVODO'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;

            Qry.Close;

            StrQry:=' UPDATE wh_vhc_trans SET '+
                    'out_ordo_km='+ToString(out_ordo_km.Text)+
                    ',in_ordo_km='+ToString(in_ordo_km.Text)+
                    ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                    ' WHERE (vhc_trans_id='+QuotedStr(NoSJ.Text)+') ;';

            StrQry:=StrQry+
                    ' INSERT wh_vhc_trans_ordo_rev (vhc_trans_ordo_rev_id,vhc_trans_id, out_ordo_km_before, in_ordo_km_before, out_ordo_km_after, in_ordo_km_after, update_user) '+
                    ' VALUES ( '+
                    QuotedStr(StrMaxId)+','+
                    QuotedStr(NoSJ.Text)+','+IntToStr(outOrdoKm)+','+IntToStr(InOrdoKm)+','+
                    QuotedStr(ToString(out_ordo_km.Text))+','+QuotedStr(ToString(in_ordo_km.Text))+','+
                    QuotedStr(User)+
                    ' ) '+
                    ';';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
                Qry.ExecSQL;
            except on E:Exception do  begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end
            end;
          end;

          (*

          if IsNoRecord Then begin
            //if Active.Checked then StrActive:='1' else StrActive:='0';
            StrQry:='SELECT RIGHT(MAX(id_etoll_trx),4) AS max_id FROM wh_etoll_transaction '+
                    'WHERE  id_etoll_trx  LIKE '+Chr(39)+'TOP'+LocationCode+
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

            StrMaxId:='TOP'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                      FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;

            Qry.Close;
            StrNoEtoll:= CekNoEToll(NoEtoll.Text);
            StrNoSJ:=Trim(NoSJ.Text);
            StrDate:=FormatDateTime('YYYY-MM-DD', TopupDate.Date);
            StrTime:=TopupTime.Text;
            StrNilai:=ToString(Nominal.Text);
            StrQry:=' INSERT INTO wh_etoll_transaction '+
                    ' ( id_etoll_trx, id_etoll_number, trx_date, trx_time, vhc_trans_id, amount, update_user )'+
                    ' VALUES ('+QuotedStr(StrMaxId)+','+QuotedStr(StrNoEtoll)+','+QuotedStr(StrDate)+','+QuotedStr(StrDate+' '+StrTime)+','+QuotedStr(StrNoSJ)+','+QuotedStr(StrNilai)+','+QuotedStr(User)+');';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
                Qry.ExecSQL;
            except on E:Exception do  begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end
            end;
          end else begin
            IsOk:=False;
            StrEMsg:='No Surat Jalan Sudah pernah diinput, Silahkan Periksa Data!!';
          end;
          *)
      end else begin
        IsOk:=False;
        StrEMsg:='No Surat Jalan tidak ditemukan!!!';
      end;

      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data', 'Topup E-Toll',MB_OK or MB_ICONINFORMATION);
        Init;
        Close;
      end else begin
        Main.TransRollback;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg), 'Topup E-Toll',MB_OK or MB_ICONERROR);
      end;
      FreeAndNil(Qry);
    end;
    Main.CloseDb;
  end else begin
    MessageBox(0,'Silahkan Isi semua kolom','Order Fee',MB_OK or MB_ICONWARNING);
  end;
end;


procedure TEditKMSJBusForm.BatalClick(Sender: TObject);
begin
  EditKMSJBusForm.Close;
end;

procedure TEditKMSJBusForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TEditKMSJBusForm.FormShow(Sender: TObject);
begin
  Init;

  NoSJ.Text := VhcTransId;

  if VhcTransId<>'' then begin
    LoadData;
    //PostMessage(Handle, WM_SHOWMYOTHERFORM, 0, 0);
  end;

end;

procedure TEditKMSJBusForm.WMShowMyOtherForm(var Message: TMessage);
begin
  inherited;
  with TEditKMSJBusForm.Create(nil,'', True) do begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TEditKMSJBusForm.out_ordo_kmEnter(Sender: TObject);
begin
  out_ordo_km.Text:=ToString(out_ordo_km.Text);
end;

procedure TEditKMSJBusForm.out_ordo_kmExit(Sender: TObject);
begin
  if ToString(out_ordo_km.Text)='' then out_ordo_km.Text:='0';
  out_ordo_km.Text:=SToCurr(out_ordo_km.Text);
end;


procedure TEditKMSJBusForm.out_ordo_kmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    out_ordo_km.SetFocus;
  end;
end;



procedure TEditKMSJBusForm.NoSJExit(Sender: TObject);
begin
    if (CekNoSJ(NoSJ.Text)<>NoSJ.Text) then begin
      MessageBox(0,PChar('No Surat Jalan tidak ditemukan!!!'), 'Topup E-Toll',MB_OK or MB_ICONERROR);
    end;
end;

procedure TEditKMSJBusForm.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then out_ordo_km.SetFocus;
end;

procedure TEditKMSJBusForm.TopupTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TEditKMSJBusForm.btnTombolCariClick(Sender: TObject);
begin
    if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'TopupEtoll-Add',0,True, 1);
end;

procedure TEditKMSJBusForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntDiscount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcOutDetail '+QuotedStr(VhcTransId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin

      NoSJ.Text:=VarToStr(Qry.FieldValues['vhc_trans_id']);
      if Qry.FieldValues['out_ordo_km']<>NULL then
        outOrdoKm := Qry.FieldValues['out_ordo_km']
      else outOrdoKm:=0;

      if Qry.FieldValues['in_ordo_km']<>NULL then
        InOrdoKm := Qry.FieldValues['in_ordo_km']
      else InOrdoKm:=0;

      out_ordo_km.Text:=IToCurr(outOrdoKm);
      in_ordo_km.Text:=IToCurr(InOrdoKm);

      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;


procedure TEditKMSJBusForm.in_ordo_kmEnter(Sender: TObject);
begin
  in_ordo_km.Text:=ToString(in_ordo_km.Text);
end;

procedure TEditKMSJBusForm.in_ordo_kmExit(Sender: TObject);
begin
  if ToString(in_ordo_km.Text)='' then in_ordo_km.Text:='0';
  in_ordo_km.Text:=SToCurr(in_ordo_km.Text);
end;

procedure TEditKMSJBusForm.in_ordo_kmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    jarak.SetFocus;
  end;
end;

procedure TEditKMSJBusForm.out_ordo_kmChange(Sender: TObject);
begin
    try
      jarak.Text:=IToCurr(
                      StrToInt(StringReplace(in_ordo_km.Text, '.', '', [rfReplaceAll]))
                       - StrToInt(StringReplace(out_ordo_km.Text, '.', '', [rfReplaceAll])) );
    except
      on Exception do
        jarak.Text:='';
    end;
end;

procedure TEditKMSJBusForm.in_ordo_kmChange(Sender: TObject);
begin
    try
      jarak.Text:=IToCurr( StrToInt(in_ordo_km.Text) - StrToInt(ToString(out_ordo_km.Text)) );
    except
      on Exception do
        jarak.Text:='';
    end;
end;

end.
