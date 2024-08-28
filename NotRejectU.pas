unit NotRejectU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit;

type
  TNoteReject = class(TForm)
    Label1: TLabel;
    NoteReject: TMemo;
    Simpan: TButton;
    Batal: TButton;
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  NoteReject: TNoteReject;
  NoSRReject: String;

implementation

uses MainU, ServiceRequestFormU;

{$R *.dfm}

constructor TNoteReject.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

procedure TNoteReject.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TNoteReject.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
    if MessageBox(0,'Apakah anda yakin ingin Tolak','Service Request',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin

      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;

      if Main.OpenDb then begin
        Main.TransStart;


        StrQry:=' UPDATE wh_service_request SET approve=2,notes='+QuotedStr(NoteReject.Text)+','+
                ' update_user='+QuotedStr(User)+' '+
                ' WHERE service_request_id='+QuotedStr(NoSRReject)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Tolak Service Request!!';
            StrException:=E.Message;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Tolak Service Request','',MB_OK or MB_ICONINFORMATION);
          ServiceRequestForm.LabStat.Visible:=True;
          ServiceRequestForm.Status.Visible:=True;
          ServiceRequestForm.MemNotes.Visible:=True;
          ServiceRequestForm.Status.Caption:='DITOLAK' ;
          ServiceRequestForm.Status.Font.Color:=clRed;
          ServiceRequestForm.CetakUlang.Enabled:=False;
          ServiceRequestForm.CetakFormulirBarang.Enabled:=False;
          ServiceRequestForm.MemNotes.Text:=NoteReject.Text;
          ServiceRequestForm.Approve.Enabled:=False;
          ServiceRequestForm.Reject.Enabled:=False;
          ServiceRequestForm.Simpan.Enabled:=False;
          Close;

        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Checklist Integrate',MB_OK or MB_ICONERROR);
        end;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end;
end;

procedure TNoteReject.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
