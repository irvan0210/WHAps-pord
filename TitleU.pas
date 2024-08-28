unit TitleU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, WHUnit, ADODB, StrUtils;

type
  TTitle = class(TForm)
    pnlDisplay: TPanel;
    btnSimpanH: TButton;
    btnBersih: TButton;
    Panel2: TPanel;
    btnSelesai: TButton;
    Label1: TLabel;
    edtTitle: TEdit;
    Label2: TLabel;
    edtKeterangan: TEdit;
    Label4: TLabel;
    cbkActivasi: TCheckBox;
    procedure btnSimpanHClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure cbkActivasiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTitleKeyPress(Sender: TObject; var Key: Char);
    procedure btnBersihClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure cbkActivasiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataActivasiH:integer;

    procedure qActExecuteMessage(Query,PesanError:string);

    procedure ButtonSimpanDataHeder;
    procedure EnableDataFalseHeader;
    procedure EnableDataTrueHeader;

    procedure ClearDataHeader;    
    procedure ButtonBersihData;



  public
    { Public declarations }

    DataTitleIDH,DataTitleIDD,Event:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;TitleIDH,TitleIDD,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  Title: TTitle;
  TitleArr:Array of TArrString2;
  BankArr:Array of TArrString2;
  IntRow:integer;

implementation

uses MainU, TitleListU;



{$R *.dfm}

constructor TTitle.Create(AOwner:TComponent;TitleIDH,TitleIDD,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  DataTitleIDH:=TitleIDH;
  DataTitleIDD:=TitleIDD;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);

end;

procedure TTitle.qActExecuteMessage(Query,PesanError:string);
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


procedure TTitle.ButtonSimpanDataHeder;
begin
  btnSimpanH.Enabled:=False;
  btnBersih.Enabled:=True;

  EnableDataFalseHeader;
end;

procedure TTitle.EnableDataFalseHeader;
begin

  edtTitle.Enabled:=False;
  edtKeterangan.Enabled:=False;
  cbkActivasi.Enabled:=False;
  
end;

procedure TTitle.ButtonBersihData;
begin

  if Event='T' then begin
    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=False;


    EnableDataTrueHeader;
    ClearDataHeader;

  end else
  if Event='U' then begin


  end;



end;

procedure TTitle.ClearDataHeader;
begin
  edtTitle.Clear;
  edtKeterangan.Clear;
  cbkActivasi.Checked:=True;
  
end;


procedure TTitle.EnableDataTrueHeader;
begin
  edtTitle.Enabled:=True;
  edtKeterangan.Enabled:=True;
  cbkActivasi.Enabled:=True;
  
end;






procedure TTitle.btnSimpanHClick(Sender: TObject);
begin

  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    if Event='T' then begin

      StrQry:=' INSERT INTO  wh_title(title, '+
              ' remark '+
              ' status, '+
              ' update_time, '+
              ' update_user) '+
              ' VALUES('+QuotedStr(edtTitle.Text)+', '+
              QuotedStr(edtKeterangan.Text)+', '+
              QuotedStr(IntToStr(DataActivasiH))+', GETDATE(), '+
              QuotedStr(User)+')';
              qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Title');

      end else
    if Event='U' then begin
        StrQry:=' UPDATE wh_title '+
                ' SET title ='+QuotedStr(edtTitle.Text)+', '+
                ' remark ='+QuotedStr(edtKeterangan.Text)+', '+
                ' status ='+QuotedStr(IntToStr(DataActivasiH))+', '+
                ' update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                ' WHERE title_id='+QuotedStr(DataTitleIDH);
                qActExecuteMessage(StrQry,'Data Tidak Bisa Di Update Di Title');

    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin
        
        ButtonSimpanDataHeder;

      end else
      if Event='U' then begin

        StrQry:=' SELECT title_id, title, remark, status FROM wh_title ';
        ViewData1(StrQry,TitleList.StrGridH);

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

procedure TTitle.FormCreate(Sender: TObject);
var
  Qry:TADOQuery;

begin
  KeyPreview := true;

  if Event='T' then begin
    DataActivasiH:=1;
    cbkActivasi.Checked:=True;
    
  end else
  if (Event='U') or (Event='L') then begin
  
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:=' SELECT title, status FROM wh_title WHERE title_id ='+QuotedStr(DataTitleIDH);
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      edtTitle.Text:=Qry.FieldValues['title'];

      DataActivasiH:=Qry.FieldValues['status'];

      if DataActivasiH =1 then

        cbkActivasi.Checked:=True
      else
        cbkActivasi.Checked:=False;

    end;

    Main.CloseDb;
    FreeAndNil(Qry);


  end;

end;

procedure TTitle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTitle.btnSelesaiClick(Sender: TObject);
begin

  Close;
  
end;

procedure TTitle.cbkActivasiClick(Sender: TObject);
begin
  if cbkActivasi.Checked=True then
    DataActivasiH:=1
  else
    DataActivasiH:=2;

  //Edit1.Text:=IntToStr(vActivasiH);
end;

procedure TTitle.FormShow(Sender: TObject);
begin
   if Event='T' then begin

    btnBersih.Enabled:=False;

  end else
  if Event='U' then begin

    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=False;


  end;
  if Event='L' then begin

    //btnSimpanH.Enabled:=False;
    //btnBersih.Enabled:=False;
    //EnableDataFalseHeader;
    pnlDisplay.Enabled:=False;


  end;
end;

procedure TTitle.edtTitleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  edtKeterangan.SetFocus;
end;

procedure TTitle.btnBersihClick(Sender: TObject);
begin
  ClearDataHeader;
  EnableDataTrueHeader;
  
  btnSimpanH.Enabled:=True;
  btnBersih.Enabled:=False;
end;

procedure TTitle.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TTitle.edtKeteranganKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  cbkActivasi.SetFocus;
end;

procedure TTitle.cbkActivasiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  btnSimpanH.SetFocus;
end;

end.
