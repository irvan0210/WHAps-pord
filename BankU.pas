unit BankU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TBank = class(TForm)
    pnlDisplay: TPanel;
    btnSimpanH: TButton;
    btnBersih: TButton;
    Panel2: TPanel;
    btnSelesai: TButton;
    Label1: TLabel;
    cmbTitleID: TComboBox;
    edtNamaBank: TEdit;
    Label3: TLabel;
    edtAlamat: TEdit;
    Label4: TLabel;
    edtKodePos: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure edtKodePosKeyPress(Sender: TObject; var Key: Char);
    procedure edtTitleIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtAlamatKeyPress(Sender: TObject; var Key: Char);
    procedure btnSimpanHClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBersihClick(Sender: TObject);
    procedure cmbTitleIDChange(Sender: TObject);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    vDiscHeader,DataActivasiH,DataActivasiD:integer;
    DataCount,NilaiHarga:string;
    DataTitleID :variant;

    procedure qActExecuteMessage(Query,PesanError:string);
    procedure RefreshTitle;


    procedure ButtonSimpanDataHeder;
    procedure EnableDataFalseHeader;
    procedure ClearDataHeader;
    procedure EnableDataTrueHeader;   

  public
    { Public declarations }

    DataBankIDH,DataBankIDD,Event:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;BankIDH,BankIDD,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  Bank: TBank;
  TitleArr:Array of TArrString2;
  

implementation

uses MainU, BankListU;

{$R *.dfm}

constructor TBank.Create(AOwner:TComponent;BankIDH,BankIDD,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  DataBankIDH:=BankIDH;
  DataBankIDD:=BankIDD;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);

end;

procedure TBank.qActExecuteMessage(Query,PesanError:string);
var
  qQuery:TADOQuery;

begin
  qQuery:=TADOQuery.Create(nil);
  qQuery.Connection:=Main.MyConnection;
  qQuery.Close;
  qQuery.SQL.Clear;
  qQuery.SQL.Add(Query);

  try
          qQuery.ExecSQL;
  except
    on E:Exception do begin
       StrMsg:=PesanError;
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;

 FreeAndNil(qQuery);

end;

procedure TBank.RefreshTitle;
var
  Qry:TADOQuery;
  Count:Integer;
begin
    SetLength(TitleArr,0);
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin

      StrQry:=' SELECT title_id, title FROM wh_title WHERE title_id=8 ';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Count:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(TitleArr,Count+1);
        cmbTitleID.Items.Add(Qry.FieldValues['title']);
        TitleArr[Count][0]:=Qry.FieldValues['title_id'];
        TitleArr[Count][1]:=Qry.FieldValues['title'];
        Qry.Next;
        Inc(Count);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;


end;



procedure TBank.ButtonSimpanDataHeder;
begin
  btnSimpanH.Enabled:=False;
  btnBersih.Enabled:=True;

  EnableDataFalseHeader;
end;

procedure TBank.EnableDataFalseHeader;
begin

  edtNamaBank.Enabled:=False;
  cmbTitleID.Enabled:=False;

  edtAlamat.Enabled:=False;
  edtKodePos.Enabled:=False;

end;

procedure TBank.ClearDataHeader;
begin
  edtNamaBank.Clear;

  cmbTitleID.Text:='';


  edtAlamat.Clear;
  edtKodePos.Clear;


end;

procedure TBank.EnableDataTrueHeader;
begin

  edtNamaBank.Enabled:=True;
  cmbTitleID.Enabled:=True;

  edtAlamat.Enabled:=True;
  edtKodePos.Enabled:=True;


end;


procedure TBank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBank.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBank.edtKodePosKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;

  if Key=#13 then
  btnSimpanH.SetFocus;

  
end;

procedure TBank.edtTitleIDKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key=#13) then
  edtAlamat.SetFocus;
end;

procedure TBank.edtAlamatKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key=#13) then
  edtKodePos.SetFocus;
end;

procedure TBank.btnSimpanHClick(Sender: TObject);
var
  Qry:TADOQuery;
  vBankIDH,vDataCount,VPrefix:string;
  Count:integer;
begin

  if edtNamaBank.Text='' then
  begin
      MessageDlg('Nama Bank Tidak Boleh Kosong',mtError,[mbOK],0);
      Exit;
  end;

  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=Main.MyConnection;
        StrQry:='select count(*) as nilai from wh_bank ';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
    try
        Qry.Open;

    except
      on E:Exception do begin
         StrMsg:='Tabel Bank Tidak Dapat Di Buka';
         StrEMessage:=E.Message;
         IsOk:=False;
         end
    end;

    VPrefix:=LeftStr(edtNamaBank.Text,3);
    VPrefix:=UpperCase(VPrefix);
    DataCount:=Qry.FieldValues['nilai'];

    vDataCount:='00'+DataCount;
    vDataCount:=Format('%.*d',[7,StrToInt(vDataCount)+1]);
    vBankIDH:=VPrefix+vDataCount;

    if Event='T' then begin

      StrQry:=' INSERT INTO  wh_bank( bank_id, '+
              ' name, '+
              ' title_id, '+
              ' address, '+
              ' zip, '+
              ' status, '+
              ' update_time, '+
              ' update_user) '+
              ' VALUES('+QuotedStr(vBankIDH)+', '+
              QuotedStr(edtNamaBank.Text)+', '+
              QuotedStr(DataTitleID)+', '+
              QuotedStr(edtAlamat.Text)+', '+
              QuotedStr(edtKodePos.Text)+', '+
              QuotedStr(IntToStr(DataActivasiH))+', GETDATE(), '+
              QuotedStr(User)+')';
      qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Bank');

      end else
    if Event='U' then begin
        StrQry:=' UPDATE wh_bank '+
                ' SET name ='+QuotedStr(edtNamaBank.Text)+', '+
                ' title_id ='+QuotedStr(DataTitleID) +', '+
                ' address ='+QuotedStr(edtAlamat.Text) +', '+
                ' zip ='+QuotedStr(edtKodePos.Text) +', '+
                ' status ='+QuotedStr(IntToStr(DataActivasiH))+', '+
                ' update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                ' WHERE bank_id='+QuotedStr(DataBankIDH);
        qActExecuteMessage(StrQry,'Data Tidak Bisa Di Update Di Bank');

    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin
        
        ButtonSimpanDataHeder;

      end else
      if Event='U' then begin

        StrQry:=' EXECUTE GetBankWHDCRefresh';

        ViewData1(StrQry,BankList.StrGridH);

        ButtonSimpanDataHeder;
        btnBersih.Enabled:=False;

      end;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Gagal Simpan',MB_OK or MB_ICONERROR);
    end;

  end;
  Main.CloseDb;
  Main.M_Normal;


end;

procedure TBank.FormCreate(Sender: TObject);
var
  Qry:TADOQuery;

begin
  KeyPreview :=True;

  if Event='T' then begin
    DataActivasiH:=1;
    //cbkActivasi.Checked:=True;
    
  end else
  if (Event='U') or (Event='L') then begin

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin

      StrQry:=' EXECUTE GetBankWHDCOne @vBankID='+QuotedStr(DataBankIDH);

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      if Qry.FieldValues['nama_bank']<>NULL then
      edtNamaBank.Text:=Qry.FieldValues['nama_bank'];

      if Qry.FieldValues['title_id']<>NULL then
      DataTitleID:=Qry.FieldValues['title_id'];

      if Qry.FieldValues['title']<>NULL then
      cmbTitleID.Text:=Qry.FieldValues['title'];

      if Qry.FieldValues['address']<>NULL then
      edtAlamat.Text:=Qry.FieldValues['address'];

      if Qry.FieldValues['zip']<>NULL then
      edtKodePos.Text:=Qry.FieldValues['zip'];

      if Qry.FieldValues['status_bank']<>NULL then
      DataActivasiH:=Qry.FieldValues['status_bank'];

    end;

    Main.CloseDb;
    FreeAndNil(Qry);
  end;

end;

procedure TBank.FormShow(Sender: TObject);
begin
  if Event='T' then begin
    RefreshTitle;
    ClearDataHeader;
    btnBersih.Enabled:=False;

  end else
  if Event='U' then begin

    RefreshTitle;
    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=False;


  end;
  if Event='L' then begin

    //btnSimpanH.Enabled:=False;
    //btnBersih.Enabled:=False;
    //btnCariTitleID.Enabled:=False;
    //EnableDataFalseHeader;
    //edtTitleID.Enabled:=True;
    //edtTitle.Enabled:=True;
    pnlDisplay.Enabled:=False;

  end;

end;

procedure TBank.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TBank.btnBersihClick(Sender: TObject);
begin
  ClearDataHeader;
  EnableDataTrueHeader;

  btnSimpanH.Enabled:=True;
  btnBersih.Enabled:=False;
end;

procedure TBank.cmbTitleIDChange(Sender: TObject);
begin
   DataTitleID:=TitleArr[cmbTitleID.ItemIndex][0];
end;

end.
