unit RevenueBonusRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TRevenueBonusRpt = class(TForm)
    Selesai: TButton;
    StrGrid: TStringGrid;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    LokasiDisp: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    Lokasi: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
  end;

var
  RevenueBonusRpt: TRevenueBonusRpt;

implementation

{$R *.dfm}


procedure TRevenueBonusRpt.Init;
var Count:Integer;
begin
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  Lokasi.Items.Clear;
  Lokasi.Text:='';
  Lokasi.ItemIndex:=0;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Pool';
  StrGrid.Cells[2,0]:='No KPP';
  StrGrid.Cells[3,0]:='Mitra';
  StrGrid.Cells[4,0]:='Hr Kerja';
  StrGrid.Cells[5,0]:='Tdk Hr Kerja';
  StrGrid.Cells[6,0]:='Absen';
  StrGrid.Cells[7,0]:='Tot Argo';
  StrGrid.Cells[8,0]:='Bonus Pendapatan';
  for Count:=0 to 34 do
    StrGrid.Cells[Count,1]:='';
end;

procedure TRevenueBonusRpt.RefreshCombo;
begin
end;


procedure TRevenueBonusRpt.SelesaiClick(Sender: TObject);
begin
  RevenueBonusRpt.Close;
end;

procedure TRevenueBonusRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
