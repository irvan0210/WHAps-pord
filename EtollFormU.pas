unit EtollFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, CheckLst, Grids, ADODB, WHUnit;

type
  TEtollForm = class(TForm)
    LabelName: TLabel;
    Batal: TButton;
    Simpan: TButton;
    GroupMinggu: TGroupBox;
    JadwalHarian: TCheckListBox;
    GroupBulan: TGroupBox;
    Panel1: TPanel;
    Harian: TRadioButton;
    Bulanan: TRadioButton;
    Label5: TLabel;
    MonthCalendar1: TMonthCalendar;
    pnl1: TPanel;
    NoEtoll: TEdit;
    Label1: TLabel;
    cardLimit: TEdit;
    Topupcode: TEdit;
    Label2: TLabel;
    Bersihkan: TButton;
    aktif: TCheckBox;
    Alias: TEdit;
    Label3: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure NoEtollKeyPress(Sender: TObject; var Key: Char);
    procedure cardLimitExit(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cardLimitEnter(Sender: TObject);
  private
    { Private declarations }
    EtollArr:Array of TArrString8;
    VhcArr:Array of TArrString8;
    SchArr:Array of TArrString7;
    EmplType:Integer;
    VhcType:Integer;
    is_Helper,isView:Boolean;
    EtollId,StrCompanyId,StrNoEtoll:String;
    procedure Init;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Etoll_Id:String='';is_view:Boolean=true;No_Etoll:String='')Overload;
    procedure CekNoEtoll(nomor:string);
  end;

var
  EtollForm: TEtollForm;


implementation

uses MainU, DB, eTollNumberListU, TreeMenuListU;

{$R *.dfm}

constructor TEtollForm.Create(AOwner:TComponent;Etoll_Id:String='';is_view:Boolean=true;No_Etoll:String='');
begin
  isView:=is_view;
  EtollId:=Etoll_Id;
  StrNoEtoll:=StringReplace(No_Etoll, ' ', '', [rfReplaceAll]);;
  Inherited Create(AOwner);
end;


procedure TEtollForm.Init;
begin
  NoEtoll.Text:=StrNoEtoll;
  pnl1.Enabled := Not isView;
  Simpan.Enabled := Not isView;
  Bersihkan.Enabled := Not isView;
  if Trim(StrNoEtoll)<>'' then aktif.Visible:= True
  else aktif.Visible:= False;
end;

procedure TEtollForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEtollDetail '+QuotedStr(EtollId)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      NoEtoll.Text:=Qry.FieldValues['etoll_number'];
      Topupcode.Text:=Qry.FieldValues['topup_code'];
      cardLimit.Text:=SToCurr(VarToStr(Qry.FieldValues['card_limit_amount']));
      Alias.Text:=Qry.FieldValues['alias'];
      aktif.Checked := True;
      Qry.Next;
    end;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEtollForm.CekNoEtoll(nomor:string);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT b.name,a.employee_id,a.vehicle_id,c.body_id,'+
            'CONVERT(VARCHAR(10),a.from_date,103) AS from_date,CONVERT(VARCHAR(10),a.to_date,103) AS to_date'+
            ' FROM wh_working_schedule a'+
            ' INNER JOIN wh_employee b ON b.employee_id=a.employee_id'+
            ' INNER JOIN wh_vehicle c ON c.vehicle_id=a.vehicle_id '+
            ' WHERE a.working_schedule_id='+EtollId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then begin

    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TEtollForm.BatalClick(Sender: TObject);
begin
  EtollForm.Close;
end;

procedure TEtollForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;





procedure TEtollForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    QStr,StrEmplId,StrNoEtoll,StrCardLimit,StrTopupCode,StrStatus, StrAlias:String;
    IsOk:Boolean;
    Count:Integer;
    StrHelper:String;
begin
  if (Length(Trim(NoEtoll.Text))>=14) then begin
    IsOk:=True;
    Count:=0;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrNoEtoll:=NoEtoll.Text;
    StrCardLimit:=ToString(cardLimit.Text);
    StrTopupCode:=Topupcode.Text;
    StrAlias:=Alias.Text;
    if aktif.Checked=True then StrStatus:='1' else StrStatus:='0';
    if Main.OpenDb then begin
      if EtollId='' then begin
        QStr:='SELECT * From wh_etoll_number '+
              'WHERE etoll_number='+Chr(39)+Trim(StrNoEtoll)+Chr(39);
        Qry.SQL.Add(QStr);
        Qry.Open;
        if Qry.RecordCount<1 then begin
          QStr:=' INSERT INTO wh_etoll_number (company_id,etoll_number,card_limit_amount,topup_code,alias,update_user)'+
                ' VALUES ('+QuotedStr(CompanyId)+','+QuotedStr(StrNoEtoll)+','+QuotedStr(StrCardLimit)+','+QuotedStr(StrTopupCode)+','+QuotedStr(StrAlias)+','+QuotedStr(User)+');';
          Qry.SQL.Clear;
          Qry.SQL.Add(QStr);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
            end
          end;
        end else begin
          MessageBox(0,'No Etoll tersebut sudah ada!!!','Kelola No EToll',MB_OK or MB_ICONWARNING);
          NoEtoll.SetFocus;
        end;
     end else begin
        QStr:='UPDATE wh_etoll_number SET '+
              'etoll_number='+Chr(39)+StrNoEtoll+Chr(39)+', '+
              'card_limit_amount='+Chr(39)+StrCardLimit+Chr(39)+', '+
              'topup_code='+Chr(39)+StrTopupCode+Chr(39)+', '+
              'status='+Chr(39)+StrStatus+Chr(39)+', '+
              'alias='+Chr(39)+StrAlias+Chr(39)+', '+
              'update_user='+QuotedStr(User)+','+
              'update_time=getDate() '+
              ' WHERE id='+EtollId+';';
        Qry.SQL.Add(QStr);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
          end
        end;
      end;
      if IsOk then begin
        MessageBox(0,'Penambahan/Perubahan Nomor EToll Berhasil','Kelola No EToll',MB_OK or MB_ICONINFORMATION);
        Init;
      end else
        MessageBox(0,'Penambahan/Perubahan Nomor EToll Gagal','Kelola No EToll',MB_OK or MB_ICONWARNING);
      Qry.Close;
      Main.CloseDb;
      if Main.IsFormOpen('eTollNumberList') then begin
        eTollNumberList.RefreshList;
        eTollNumberList.RefreshGrid;
      end;

      if EtollId<>'' then Close;
    end;
  end else begin
    MessageBox(0,'Nomor EToll kurang dari 14 karakter','Kelola No EToll',MB_OK or MB_ICONWARNING);
    NoEtoll.SetFocus;
  end;
end;



procedure TEtollForm.NoEtollKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TEtollForm.cardLimitExit(Sender: TObject);
begin
  if ToString(cardLimit.Text)='' then cardLimit.Text:='0';
  cardLimit.Text:=SToCurr(cardLimit.Text);
end;

procedure TEtollForm.BersihkanClick(Sender: TObject);
begin
  Init;
  NoEtoll.SetFocus;
end;

procedure TEtollForm.FormShow(Sender: TObject);
begin
  Init;
  if EtollId<>'' then LoadData;
end;

procedure TEtollForm.cardLimitEnter(Sender: TObject);
begin
  cardLimit.Text := ToString(cardLimit.Text);
end;

end.
