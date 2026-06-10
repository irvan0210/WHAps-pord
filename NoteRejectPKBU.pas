unit NoteRejectPKBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit;

type
  TNoteRejectPKB = class(TForm)
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
  NoteRejectPKB: TNoteRejectPKB;
  StrNoPKB: String;

implementation

uses MainU, ServiceRequestFormU, WorkOrderFormU;

{$R *.dfm}

constructor TNoteRejectPKB.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

procedure TNoteRejectPKB.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TNoteRejectPKB.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
    if MessageBox(0,'Apakah anda yakin ingin Tolak','PKB',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin

      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;

      if Main.OpenDb then begin
        Main.TransStart;

        StrQry:=' UPDATE wh_work_order SET approve=2,notes='+QuotedStr(NoteReject.Text)+','+
                ' update_user='+QuotedStr(User)+' '+
                ' WHERE work_order_id='+QuotedStr(StrNoPKB)+';';
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
          MessageBox(0,'Berhasil Tolak PKB','PKB',MB_OK or MB_ICONINFORMATION);
          WorkOrderForm.LabStat.Visible:=True;
          WorkOrderForm.Status.Visible:=True;
        //  WorkOrderForm.MemNotes.Visible:=True;
          WorkOrderForm.Status.Caption:='DITOLAK' ;
          WorkOrderForm.Status.Font.Color:=clRed;
          WorkOrderForm.CetakUlang.Enabled:=False;

         // WorkOrderForm.MemNotes.Text:=NoteReject.Text;
          WorkOrderForm.Approve.Enabled:=False;
          WorkOrderForm.Reject.Enabled:=False;
          WorkOrderForm.Simpan.Enabled:=False;
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

procedure TNoteRejectPKB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
