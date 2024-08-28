unit AttendanceTransferU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ADODB;

type
  TAttendanceTransfer = class(TForm)
    Transfer: TButton;
    Selesai: TButton;
    TanggalMulai: TDateTimePicker;
    TanggalSelesai: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TransferClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
  end;

var
  AttendanceTransfer: TAttendanceTransfer;

implementation

uses MainU, DateUtils;

{$R *.dfm}


procedure TAttendanceTransfer.Init;
begin
  TanggalMulai.Date:=Now();
  TanggalSelesai.Date:=Now()+1;
end;

procedure TAttendanceTransfer.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TAttendanceTransfer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree; 
end;

procedure TAttendanceTransfer.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TAttendanceTransfer.TransferClick(Sender: TObject);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.userid,CONVERT(VARCHAR(10),a.checktime,105),CONVERT(VARCHAR(10),a.checktime,108),b.name '+
            'FROM checkinout a '+
            'WHERE (a.checktime BETWEEN '+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalMulai.Date))+
            ' AND '+QuotedStr(FormatDateTime('yyyy/mm/dd',IncDay(TanggalSelesai.Date)))+' ); ';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

end.
