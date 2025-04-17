unit RePrintFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, WHUnit;

type
  TRePrintForm = class(TForm)
    Alasan: TComboBox;
    Label3: TLabel;
    GroupHeader: TGroupBox;
    NomorLaporan: TEdit;
    Label1: TLabel;
    NamaLaporan: TEdit;
    Label2: TLabel;
    TimerCheck: TTimer;
    LabelNumerator: TLabel;
    NomorNumerator: TEdit;
    Panel1: TPanel;
    Cetak: TButton;
    Batal: TButton;
    Catatan: TMemo;
    Label4: TLabel;
    procedure BatalClick(Sender: TObject);
    procedure CetakClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
    procedure AlasanChange(Sender: TObject);
  private
    { Private declarations }
    AlasanArr:Array of TArrString5;
    procedure Init;
    procedure PrepareData;
    procedure AddData;
    procedure CloseForm;
  public
    { Public declarations }
    ReportName,ReportId,StrNumerator:String;
    Copy:Integer;
  end;

var
  RePrintForm: TRePrintForm;
  ReportName:String;
  ReportId:String;
  Reprint,Cancel:Boolean;
  ReprintStatus:Integer;

implementation

uses MainU;

{$R *.dfm}


procedure TRePrintForm.Init;
begin
  NomorLaporan.Text:='';
  NamaLaporan.Text:='';
  Alasan.Items.Clear;
  Alasan.Text:='';
  Alasan.ItemIndex:=0;
  Reprint:=True;
  ReprintStatus:=99;
  Cancel:=False;
  Height:=200;
  Label4.Visible:=False;
  Catatan.Visible:=False;
end;

procedure TRePrintForm.PrepareData;
var QStr:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  NamaLaporan.Text:=ReportName;
  NomorLaporan.Text:=ReportId;
  if Trim(StrNumerator)<>'' then begin
    NomorNumerator.Visible:=True;
    LabelNumerator.Visible:=True; 
    NomorNumerator.Text:=StrNumerator;
  end else begin
    NomorNumerator.Visible:=False;
    LabelNumerator.Visible:=False;
  end;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='SELECT * FROM wh_print_status WHERE active=1;';
  Qry.SQL.Add(QStr);
  Qry.Open;
  SetLength(AlasanArr,Qry.RecordCount);
  IntCount:=0;
  if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
//    Alasan.Items.Add(Qry.FieldValues['status']);
    AlasanArr[IntCount][0]:=Qry.FieldValues['report_status_id'];
    AlasanArr[IntCount][1]:=Qry.FieldValues['status'];
    Qry.Next;
    Inc(IntCount);
  end;
  for IntCount:=0 to Length(AlasanArr)-1 do
    Alasan.Items.Add(AlasanArr[IntCount][1]);
  QStr:='SELECT * FROM wh_report_print WHERE report_name='+Chr(39)+ReportName+Chr(39)+' AND report_id='+Chr(39)+ReportId+Chr(39)+' ;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  if Qry.RecordCount>0 then begin
    Reprint:=True;
    Copy:=Qry.RecordCount;
  end else begin
    Reprint:=False;
    Copy:=0;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  if Not Reprint then begin
    RePrintStatus:=0;
    AddData;
    TimerCheck.Enabled:=True;
  end else begin
//    AddData;
  end;
end;

procedure TRePrintForm.AddData;
var QStr,StrNum:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if StrNumerator<>'' then StrNum:=QuotedStr(StrNumerator) else StrNum:='NULL';
  QStr:='INSERT INTO wh_report_print (report_name,report_id,print_status_id,numerator,update_time,update_user,note)'+
        ' VALUES ('+Chr(39)+ReportName+Chr(39)+','+Chr(39)+ReportId+Chr(39)+
        ','+IntToStr(RePrintStatus)+','+StrNum+',GETDATE(),'+Chr(39)+User+Chr(39)+','+QuotedStr(Catatan.Text)+');';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  try
    Qry.ExecSQL;
  except
    on E:Exception do MessageBox(0,'Gagal Membuka Form Printing','Reprint',MB_OK or MB_ICONERROR);
  end;
  Qry.Close;
  Main.MyConnection.Close;
end;

procedure TRePrintForm.BatalClick(Sender: TObject);
begin
  Cancel:=True;
  CloseForm;
  StrNumerator:='';
end;

procedure TRePrintForm.CetakClick(Sender: TObject);
begin
  if (ReprintStatus>0) and (ReprintStatus<>99) then begin
    if ((Alasan.Text='Perubahan Data') OR (Alasan.Text='Cetak Ulang')) AND (Catatan.Text='') then
    begin
      MessageBox(0,PChar('Catatan wajib diis !!'),'Cetak Ulang',MB_OK or MB_ICONWARNING);
      Exit;
    end else begin
      AddData;
      StrNumerator:='';
      CloseForm;
    end;
  end;
end;

procedure TRePrintForm.FormShow(Sender: TObject);
begin
  Init;
  PrepareData;
end;

procedure TRePrintForm.TimerCheckTimer(Sender: TObject);
begin
  if Not Reprint Then begin
    CloseForm;
  end;
  TimerCheck.Enabled:=False;
end;

procedure TRePrintForm.AlasanChange(Sender: TObject);
begin
//  RePrintStatus:=Alasan.ItemIndex+1;
  ReprintStatus:=StrToInt(AlasanArr[Alasan.ItemIndex][0]);
  if (Alasan.Text='Perubahan Data') OR (Alasan.Text='Cetak Ulang')  then
  begin
    Height:=313;
    Label4.Visible:=True;
    Catatan.Visible:=True;
    Catatan.Text:='';
  end else begin
    Height:=200;
    Label4.Visible:=False;
    Catatan.Visible:=False;
    Catatan.Text:='';
  end;
end;

procedure TRePrintForm.CloseForm;
begin
  if Cancel then ModalResult:=2 else ModalResult:=1;
  RePrintForm.Hide;
end;


end.
