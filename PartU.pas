unit PartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB;

type
  TPart = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Bersihkan: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    KodePart: TEdit;
    PartName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  MainU;

{$R *.dfm}

procedure TPart.Clear;
begin
  KodePart.Text:='';
  PartName.text:='';
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
        StrQry:='INSERT INTO wh_part (kode_part_gp,name,update_user,status) VALUES '+
                    '('+QuotedStr(Kodepart.Text)+','+QuotedStr(PartName.Text)+','+QuotedStr(User)+',1);';
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
                'update_user='+QuotedStr(User)+' WHERE id_part='+IDPart;
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
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Part',MB_OK or MB_ICONERROR);
  end;
end;

procedure TPart.FormShow(Sender: TObject);
begin
  Clear;
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

end.
