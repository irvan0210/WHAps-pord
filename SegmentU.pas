unit SegmentU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, WHUnit, ADODB, StrUtils;

type
  TSegment = class(TForm)
    pnlDisplay: TPanel;
    Panel2: TPanel;
    btnSelesai: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtID: TEdit;
    edtNamaSegment: TEdit;
    edtLevel: TEdit;
    btnSimpanH: TButton;
    btnBersih: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSimpanHClick(Sender: TObject);
    procedure btnBersihClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLevelKeyPress(Sender: TObject; var Key: Char);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtNamaSegmentKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataSegmentID,DataCount:string;



    procedure qActExecuteMessage(Query,PesanError:string);

    procedure ButtonSimpanDataHeder;
    procedure ButtonBersihData;
    procedure EnableDataFalseHeader;  
    procedure EnableDataTrueHeader;
    procedure ClearDataHeader;






  public
    { Public declarations }
    DataCustomerSegmentIDH,DataCustomerSegmentIDD,Event:String;
    IsView:Boolean;


    constructor Create(AOwner:TComponent;CustomerSegmentIDH,CustomerSegmentIDD,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  Segment: TSegment;

implementation

uses MainU, SegmentListU;

{$R *.dfm}

constructor TSegment.Create(AOwner:TComponent;CustomerSegmentIDH,CustomerSegmentIDD,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  DataCustomerSegmentIDH:=CustomerSegmentIDH;
  DataCustomerSegmentIDD:=CustomerSegmentIDD;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);

end;

procedure TSegment.qActExecuteMessage(Query,PesanError:string);
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

procedure TSegment.ButtonSimpanDataHeder;
begin
  btnSimpanH.Enabled:=False;
  btnBersih.Enabled:=True;

  EnableDataFalseHeader;
end;

procedure TSegment.EnableDataFalseHeader;
begin

  edtID.Enabled:=False;
  edtNamaSegment.Enabled:=False;
  edtLevel.Enabled:=False;

end;

procedure TSegment.ButtonBersihData;
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


procedure TSegment.EnableDataTrueHeader;
begin

  edtID.Enabled:=True;
  edtNamaSegment.Enabled:=True;
  edtLevel.Enabled:=True;

end;

procedure TSegment.ClearDataHeader;
begin
  edtID.Clear;
  edtNamaSegment.Clear;
  edtLevel.Clear;
  
end;

procedure TSegment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSegment.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TSegment.FormCreate(Sender: TObject);
var
  Qry:TADOQuery;
begin
  KeyPreview :=True;

  if Event='T' then begin
    //DataActivasiH:=1;
    //DataActivasiD:=1;

  end else
  if (Event='U') or (Event='L') then begin

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:=' EXECUTE GetCustomerSegementWHDCOne @vsegment_id ='+QuotedStr(DataCustomerSegmentIDH);
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      if Qry.FieldValues['id']<>NULL then
      edtID.Text:=Qry.FieldValues['id'];

      if Qry.FieldValues['name']<>NULL then
      edtNamaSegment.Text:=Qry.FieldValues['name'];

      if Qry.FieldValues['level']<>NULL then
      edtLevel.Text:=Qry.FieldValues['level'];

      if Qry.FieldValues['segment_id']<>NULL then
      DataSegmentID:=Qry.FieldValues['segment_id'];


    end;

    Main.CloseDb;
    FreeAndNil(Qry);
    
  end;

end;

procedure TSegment.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TSegment.btnSimpanHClick(Sender: TObject);
var
  Qry:TADOQuery;
  VPrefix,vDataCount, vSegmentID:string;
  
begin

  if edtID.Text='' then begin
    MessageBox(0,'Data ID Tidak Boleh Kosong '+#13+#10+'Silahkan periksa kembali Data','Data Title',MB_OK or MB_ICONERROR);
    edtID.SetFocus;
    Exit;
  end;


  Main.M_Busy;
  IsOk:=True;
  if Main.OpenDb then begin
    Main.TransStart;

    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=Main.MyConnection;

        StrQry:='select count(*) as nilai from wh_customer_segment ';
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        
    try
        Qry.Open;

    except
      on E:Exception do begin
         StrMsg:='Tabel Contact Person Tidak Dapat Di Buka';
         StrEMessage:=E.Message;
         IsOk:=False;
         end
    end;


    DataCount:=Qry.FieldValues['nilai'];

    vDataCount:='00'+DataCount;
    vDataCount:=Format('%.*d',[8,StrToInt(vDataCount)+1]);

    //VPrefix:=DataNilaiTahun+DataNilaiBulan+DataNilaiHari;
    vSegmentID:=Trim('SG'+vDataCount);


    if Event='T' then begin

      StrQry:=' INSERT INTO  wh_customer_segment(segment_id, '+
              ' id, '+
              ' name, '+
              ' [level], '+
              ' update_time, '+
              ' update_user) '+
              ' VALUES('+QuotedStr(vSegmentID)+', '+
              QuotedStr(edtID.Text)+', '+
              QuotedStr(edtNamaSegment.Text)+', '+
              QuotedStr(edtLevel.Text)+', GETDATE(), '+
              QuotedStr(User)+')';
      qActExecuteMessage(StrQry,'Data Tidak Bisa Di Inputkan Di Customer Segment');

      end else
    if Event='U' then begin

        StrQry:=' UPDATE wh_customer_segment '+
                ' SET id ='+QuotedStr(edtID.Text)+', '+
                ' name ='+QuotedStr(edtNamaSegment.Text)+', '+
                ' level ='+QuotedStr(edtLevel.Text)+', '+
                ' update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                ' WHERE segment_id='+QuotedStr(DataSegmentID);
        qActExecuteMessage(StrQry,'Data Tidak Bisa Di Update Di Customer Segment');


    end;

    if IsOk then begin

      Main.TransCommit;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Data Berhasil Disimpan:'+StrEMessage),'Simpan Data',MB_OK or MB_ICONINFORMATION);

      if Event='T' then begin

        ButtonSimpanDataHeder;

      end else
      if Event='U' then begin

        btnSimpanH.Enabled:=False;
        btnBersih.Enabled:=False;

        StrQry:=' EXECUTE GetCustomerSegementWHDCRefresh ';
        ViewData1(StrQry,SegmentList.StrGridH);

        
      end;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Gagal Simpan',MB_OK or MB_ICONERROR);
    end;

  end;
  Main.CloseDb;
  Main.M_Normal;

end;

procedure TSegment.btnBersihClick(Sender: TObject);
begin
  ButtonBersihData;
end;

procedure TSegment.FormShow(Sender: TObject);
begin

  if Event='T' then begin

    ClearDataHeader;
    btnBersih.Enabled:=False;


  end else
  if Event='U' then begin

    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=False;


  end;
  if Event='L' then begin

    btnSimpanH.Enabled:=True;
    btnBersih.Enabled:=True;
    pnlDisplay.Enabled:=False;


  end;

end;

procedure TSegment.edtLevelKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then
  Key:=#0;

  if (Key=#13) then
  btnSimpanH.SetFocus;

end;

procedure TSegment.edtIDKeyPress(Sender: TObject; var Key: Char);
begin

  if (Key=#13) then
  edtNamaSegment.SetFocus;

end;

procedure TSegment.edtNamaSegmentKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
  edtLevel.SetFocus;

end;

end.
