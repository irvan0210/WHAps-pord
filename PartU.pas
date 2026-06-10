unit PartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit;

type
  TPart = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    KodePart: TEdit;
    PartName: TEdit;
    Label3: TLabel;
    KmStandardPergantian: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KmStandardPergantianExit(Sender: TObject);
    procedure KmStandardPergantianKeyPress(Sender: TObject; var Key: Char);
    procedure KmRata2perHariKeyPress(Sender: TObject; var Key: Char);
    procedure KmStandardPergantianChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Clear;
    procedure Save;
    procedure Update;
  end;

var
  Part: TPart;
  StatusPart : String;
  IDPart : string;

implementation

uses
  MainU, ListPartsU;

{$R *.dfm}

procedure TPart.Clear;
begin
  KodePart.Text:='';
  PartName.text:='';
  KmStandardPergantian.Text:='0';
end;

procedure TPart.Save;
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin

  if (KodePart.Text<>'') AND (PartName.Text<>'') then
  begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT * FROM wh_part WHERE kode_part_gp='+QuotedStr(KodePart.Text)+' AND status=1';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then
      begin
        MessageBox(0,'Kode Part GP sudah ada !!','Part',MB_OK or MB_ICONERROR);
      end else
      begin
        IsOk:=True;
        StrQry:='INSERT INTO wh_part (kode_part_gp,name,update_user,status,standard_km_replacement) VALUES '+
                    '('+QuotedStr(Kodepart.Text)+','+QuotedStr(PartName.Text)+','+QuotedStr(User)+',1,'+
                    ''+QuotedStr(ToString(KmStandardPergantian.Text))+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=E.Message;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,PChar('Part Berhasil Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK );

        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Part Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK or MB_ICONERROR);
        end;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Part',MB_OK or MB_ICONERROR);
  end;
end;

procedure TPart.Update;
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin

  if (KodePart.Text<>'') AND (PartName.Text<>'') then
  begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT * FROM wh_part WHERE kode_part_gp='+QuotedStr(KodePart.Text)+' AND '+
              'status=1 AND id_part<>'+IDPart;
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;

      if Qry.RecordCount>0 then
      begin
        MessageBox(0,'Kode Part GP sudah ada !!','Part',MB_OK or MB_ICONERROR);
      end else
      begin
        IsOk:=True;
        StrQry:='Update wh_part SET kode_part_gp='+QuotedStr(KodePart.Text)+',name='+QuotedStr(PartName.Text)+','+
                'update_user='+QuotedStr(User)+',standard_km_replacement='+QuotedStr(ToString(KmStandardPergantian.Text))+' '+
                'WHERE id_part='+IDPart;
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=E.Message;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,PChar('Part Berhasil Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK );

        end else begin
          Main.TransRollback;
          MessageBox(0,PChar('Part Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK or MB_ICONERROR);
        end;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
    if IsOk then begin
      ListParts.RefreshData;
      ListParts.RefreshGrid;
      Clear;
      Close;
    end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Part',MB_OK or MB_ICONERROR);
  end;
end;

procedure TPart.FormShow(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Clear;


  if (DepartmentId='24') or (DepartmentId='13') then
  begin
    PartName.Enabled:=True;
    KodePart.Enabled:=True;
  end else
  begin
    PartName.Enabled:=False;
    KodePart.Enabled:=False;
  end;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_auth_form where user_id='+QuotedStr(User)+' and active=1 and form_id=162301';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
      KmStandardPergantian.Enabled:=True;
    end else begin
      KmStandardPergantian.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPart.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPart.BersihkanClick(Sender: TObject);
begin
  Clear;
  StatusPart:='INSERT';
end;

procedure TPart.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if StatusPart='INSERT' then Save else Update;
end;

procedure TPart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPart.KmStandardPergantianExit(Sender: TObject);
begin
  KmStandardPergantian.Text:=ToString(KmStandardPergantian.Text);
  if ToString(KmStandardPergantian.Text)='' then KmStandardPergantian.Text:='0';
  KmStandardPergantian.Text:=SToCurr(KmStandardPergantian.Text);
end;

procedure TPart.KmStandardPergantianKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;
end;

procedure TPart.KmRata2perHariKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13,#3,#22]) then Key:=#0;
end;

procedure TPart.KmStandardPergantianChange(Sender: TObject);
begin
  if KmStandardPergantian.Text='' then KmStandardPergantian.Text:='0';
end;

end.
