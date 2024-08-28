unit TimeInputFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls;

type
  TTimeInputForm = class(TForm)
    TimeStart: TMaskEdit;
    lbl1: TLabel;
    btnSimpan: TButton;
    btnBatal: TButton;
    procedure TimeStartExit(Sender: TObject);
    procedure TimeStartKeyPress(Sender: TObject; var Key: Char);
    procedure btnBatalClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IsInputs:Boolean;
    procedure CloseForm;
    procedure Init;
  public
    { Public declarations }
  end;

var
  TimeInputForm: TTimeInputForm;

implementation

uses
  OrderFeeAddU, MainU;

{$R *.dfm}

procedure TTimeInputForm.Init;
begin
  TimeStart.Text:='';
  IsInputs:=False;
  TimeStart.SetFocus;
  ModalResult:=0;
end;

procedure TTimeInputForm.TimeStartExit(Sender: TObject);
begin
  if Trim(TimeStart.Text)<>':' then begin
    //StrGrid.Cells[6,IntRow]:=TimeStart.Text;
    //TimeStart.Text:='';
    btnSimpan.Enabled:=True;
    IsInputs:=True;
  end;
end;

procedure TTimeInputForm.TimeStartKeyPress(Sender: TObject; var Key: Char);
var
  fs:TFormatSettings;
  tt:TDateTime;
begin
  fs.TimeSeparator := ':';
  fs.DecimalSeparator:='.';
  fs.ShortTimeFormat := 'hh:nn';

  if (Key=#13) and (Length(Trim(TimeStart.Text))>4) then begin
    if TryStrToTime(TimeStart.Text, tt, fs) then begin
      TimeStartExit(nil);
      btnSimpan.SetFocus;
    end else begin
      MessageBox(0,'Format jam yang diinput salah!!!','Input Jam',MB_OK or MB_ICONWARNING);
    end;
  end;
end;

procedure TTimeInputForm.CloseForm;
begin
  if IsInputs then ModalResult:=1 else ModalResult:=3;
  TimeInputForm.Hide;
end;

procedure TTimeInputForm.btnBatalClick(Sender: TObject);
begin
  IsInputs:=False;
  CloseForm;
end;

procedure TTimeInputForm.btnSimpanClick(Sender: TObject);
var
  fs:TFormatSettings;
  tt:TDateTime;
begin
  fs.TimeSeparator := ':';
  fs.DecimalSeparator:='.';
  fs.ShortTimeFormat := 'hh:nn';

  if TryStrToTime(TimeStart.Text, tt, fs) then begin
    OrderFeeAdd.StrRemark_arrive := TimeStart.Text;
    IsInputs:=True;
    CloseForm;
  end else begin
    MessageBox(0,'Format jam yang diinput salah!!!','Input Jam',MB_OK or MB_ICONWARNING);
  end;

end;

procedure TTimeInputForm.FormShow(Sender: TObject);
begin
  Init;
end;

end.
