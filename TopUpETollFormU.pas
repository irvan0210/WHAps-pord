unit TopUpETollFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,WHUnit, Mask, Buttons;

const
  WM_SHOWMYOTHERFORM = WM_USER + 0;

type
  TTopUpETollForm = class(TForm)
    Label2: TLabel;
    GroupInput: TPanel;
    Simpan: TButton;
    Batal: TButton;
    TopupDate: TDateTimePicker;
    Nominal: TEdit;
    Label4: TLabel;
    GroupGroupEtoll: TGroupBox;
    lbl1: TLabel;
    CariNoEtoll: TEdit;
    NoEtoll: TComboBox;
    TopupTime: TMaskEdit;
    lbl2: TLabel;
    NoSJ: TEdit;
    Label1: TLabel;
    TrxId: TEdit;
    btnTombolCari: TSpeedButton;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CekEdit: TCheckBox;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NominalEnter(Sender: TObject);
    procedure NominalExit(Sender: TObject);

    procedure NominalKeyPress(Sender: TObject; var Key: Char);
    procedure CariNoEtollChange(Sender: TObject);
    procedure NoSJExit(Sender: TObject);
    procedure NoSJKeyPress(Sender: TObject; var Key: Char);
    procedure TopupTimeKeyPress(Sender: TObject; var Key: Char);
    procedure btnTombolCariClick(Sender: TObject);
    procedure CekEditClick(Sender: TObject);
  private
    { Private declarations }
    EtollArr:Array of TArrString5;
    procedure Init;
    procedure RefreshNoEtoll;
    procedure LoadData;
    procedure WMShowMyOtherForm(var Message: TMessage); message WM_SHOWMYOTHERFORM;

    function isHadInput(noSJ:string;tgl:TDateTime;noEToll:String):Boolean;
  public
    Constructor Create(AOwner:TComponent;eToll_TrxId:String; isModal: Boolean);Overload;
    { Public declarations }
  end;

var
  TopUpETollForm: TTopUpETollForm;
  eTollTrxId:String;

implementation

uses MainU, ADODB, UserGroupListU, SPJBusListU, AuthorizedFormU;

{$R *.dfm}

Constructor TTopUpETollForm.Create(AOwner:TComponent;eToll_TrxId:String; isModal: Boolean);
begin
  eTollTrxId:=eToll_TrxId;

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


procedure TTopUpETollForm.Init;
begin
  CariNoEtoll.Text:='';
  TopupDate.Date:=Now;
  TopupTime.Text:=FormatDateTime('HH:NN', Now);
  
  Simpan.Enabled:=True;
  CekEdit.Enabled:=True;
  CekEdit.Checked := True;
  TopupTime.Enabled:=False;
end;

procedure TTopUpETollForm.RefreshNoEtoll;
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetEtollList '+CompanyId+';';
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(EtollArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    EtollArr[Count][0]:=VarToStr(Qry.FieldValues['id']);
    EtollArr[Count][1]:=VarToStr(Qry.FieldValues['etoll_number']);
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  NoEtoll.Items.Clear;
  For Count:=0 to Length(EtollArr)-1 do begin
    NoEtoll.Items.Add(EtollArr[Count][1]);
  end;
end;

function TTopUpETollForm.isHadInput(noSJ:string;tgl:TDateTime;noEToll:String):Boolean;
begin

                                   //

end;

procedure TTopUpETollForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrNoEtoll,
    StrDate,StrTime,StrNoSJ,StrNilai,StrEMsg:String;
    IsOk,IsNoRecord:Boolean;
    IntCount,isStartTopup:Byte;
    VhcTransIdArr, CustomerOrderArr:Array of TArrString1;
begin
  if ((Trim(NoEtoll.Text)<>'')) and //((Trim(Nominal.Text)<>'') and (Trim(Nominal.Text)<>'0')) AND
      (Trim(TopupTime.Text)<>':') AND (Trim(NoSJ.Text)<>'') then begin
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
          if (TrxId.Text<>'')  then begin
            StrQry:=' UPDATE wh_etoll_transaction SET status=0,update_time=GETDATE() '+
                    ' WHERE (id_etoll_trx='+QuotedStr(TrxId.Text)+') AND (status=1);';
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

          if (TrxId.Text='') then begin
            StrQry:='SELECT dbo.EToll_Trx_Exist('+Chr(39)+StrNoSJ+Chr(39)+');';
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.Fields.Fields[0].Value then begin
                IsNoRecord:=False;
                IsOk:=False;
            end;
            Qry.Close;
            Qry.SQL.Clear;
          end;

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


procedure TTopUpETollForm.BatalClick(Sender: TObject);
begin
  TopUpETollForm.Close;
end;

procedure TTopUpETollForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TTopUpETollForm.FormShow(Sender: TObject);
begin
  Init;
  NoEtoll.ItemIndex:=-1;
  TrxId.Text := eTollTrxId;
  RefreshNoEtoll;//if TrxId.Text<>'' then
  if eTollTrxId<>'' then begin
    LoadData;
    //PostMessage(Handle, WM_SHOWMYOTHERFORM, 0, 0);
  end;

end;

procedure TTopUpETollForm.WMShowMyOtherForm(var Message: TMessage);
begin
  inherited;
  with TTopUpETollForm.Create(nil,'', True) do begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TTopUpETollForm.NominalEnter(Sender: TObject);
begin
  Nominal.Text:=ToString(Nominal.Text);
end;

procedure TTopUpETollForm.NominalExit(Sender: TObject);
begin
  if ToString(Nominal.Text)='' then Nominal.Text:='0';
  Nominal.Text:=SToCurr(Nominal.Text);
end;


procedure TTopUpETollForm.NominalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    TopupDate.SetFocus;
  end;
end;

procedure TTopUpETollForm.CariNoEtollChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
  if Trim(CariNoEtoll.Text)<>'' then begin

    NoEtoll.ItemIndex:=0;
    NoEtoll.Clear;
    for Count:=0 to Length(EtollArr)-1 do begin
      IsTrue:=False;
      for Count2:=0 to 1 do
        if (StrPos(PChar(UpperCase(EtollArr[Count][Count2])),PChar(UpperCase(CariNoEtoll.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        NoEtoll.Items.Add(EtollArr[Count][1]);
      end;
    end;
  end else begin
    NoEtoll.ItemIndex:=0;
    NoEtoll.Clear;
    RefreshNoEtoll;
  end;
end;


procedure TTopUpETollForm.NoSJExit(Sender: TObject);
begin
    if (CekNoSJ(NoSJ.Text)<>NoSJ.Text) then begin
      MessageBox(0,PChar('No Surat Jalan tidak ditemukan!!!'), 'Topup E-Toll',MB_OK or MB_ICONERROR);
    end;
end;

procedure TTopUpETollForm.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Nominal.SetFocus;
end;

procedure TTopUpETollForm.TopupTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TTopUpETollForm.btnTombolCariClick(Sender: TObject);
begin
    if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'TopupEtoll-Add',0,True, 1);
end;

procedure TTopUpETollForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntDiscount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTopupETollDetail '+QuotedStr(eTollTrxId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TrxId.Text:=VarToStr(Qry.FieldValues['id_etoll_trx']);
      NoSJ.Text:=VarToStr(Qry.FieldValues['vhc_trans_id']);
      Nominal.Text:=IToCurr(Qry.FieldValues['amount']);
      TopupDate.Date:=VarToDateTime(Qry.FieldValues['trx_date']);
      TopupTime.Text:=VarToStr(Qry.FieldValues['trx_time']);
      NoEtoll.ItemIndex:= NoEtoll.Items.IndexOf(VarToStr(Qry.FieldValues['etoll_number']));
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TTopUpETollForm.CekEditClick(Sender: TObject);
var
    IsAuth:Boolean;
begin
    if Not CekEdit.Checked then begin
      IsAuth:=True;
      AuthorizedForm.FormId:='132105';
      AuthorizedForm.StrMessage:=' Otorisasi Edit Jam Topup E-Tol';
      if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
      if IsAuth then TopupTime.Enabled:= True
      else CekEdit.Checked:=True;
 //     else VehicleRDList:=TVehicleRDList.Create(Self,'Bus',StrGrid.Cells[14,IntRow],StrGrid.Cells[17,IntRow],'Reserved-Create',FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[4,IntRow])),FormatDateTime('yyyy/mm/dd',StrToDate(StrGrid.Cells[5,IntRow])),StrGrid.Cells[6,IntRow]);
    end else begin
      TopupTime.Enabled:= False;
    end;
end;

end.
