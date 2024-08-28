unit EmplAttedanceInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, AdoDb, DB;

type
  TEmplAttedanceInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LabelNama: TLabel;
    Tanggal: TDateTimePicker;
    TglSampai: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelCuti: TLabel;
    LabelSakit: TLabel;
    LabelIjin: TLabel;
    Selesai: TButton;
    Preview: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    EmplId :String;
    procedure Init;
    procedure LoadData;
  public
    constructor Create(AOwner:TComponent;Employee_Id:String='');overload;
    { Public declarations }
  end;

var
  EmplAttedanceInfo: TEmplAttedanceInfo;

implementation

uses MainU;


{$R *.dfm}

constructor TEmplAttedanceInfo.Create(AOwner:TComponent;Employee_Id:String='');
begin
  EmplId := Employee_Id;
  inherited Create(AOwner);
end;

procedure TEmplAttedanceInfo.Init;
var
    Year,Month,Day : Word;
    D: TdateTime;
begin
  DecodeDate(Now, Year, Month, Day);
  D:=EncodeDate(Year,Month,1);
  Tanggal.Date:=D;
  TglSampai.Date:=Now;
end;

procedure TEmplAttedanceInfo.LoadData;
var StrQry,StrDateLeave:String;
    Qry:TADOQuery;
    IntCount,IntAddRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetAttandanceInfo '+
            QuotedStr(EmplId)+
            ','+QuotedStr(FormatDateTime('YYYY-MM-DD',Tanggal.Date))+
            ','+QuotedStr(FormatDateTime('YYYY-MM-DD',TglSampai.Date))+' ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then begin
      LabelNama.Caption := VarToStr(Qry.FieldValues['NamaKaryawan']);
      LabelCuti.Caption := ' '+VarToStr(Qry.FieldValues['Cuti'])+' Hari';
      LabelIjin.Caption := ' '+VarToStr(Qry.FieldValues['Ijin'])+' Hari';
      LabelSakit.Caption := ' '+VarToStr(Qry.FieldValues['Sakit'])+' Hari';
    end;
    Qry.Close;

  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmplAttedanceInfo.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TEmplAttedanceInfo.FormShow(Sender: TObject);
begin
  init;
  LoadData;
end;

procedure TEmplAttedanceInfo.PreviewClick(Sender: TObject);
begin
    LoadData;
end;

procedure TEmplAttedanceInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
