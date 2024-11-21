unit RekapHistoryArmadaPergantianPartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Grids, ZColorStringGrid, Buttons;

type
  TRekapHistoryArmadaPergantianPart = class(TForm)
    ToXCel: TSpeedButton;
    Label3: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Button1: TButton;
    grpGroupTotal: TGroupBox;
    lbl1: TLabel;
    edtTotalUnitOperasi: TEdit;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Batch: TComboBox;
    Seat: TComboBox;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Part: TEdit;
    Label6: TLabel;
    Label2: TLabel;
    Tanggal: TDateTimePicker;
    TglSampai: TDateTimePicker;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FormRequest:String;
    MinRowGrid:Integer;
    procedure Init;
    procedure InitGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  RekapHistoryArmadaPergantianPart: TRekapHistoryArmadaPergantianPart;

implementation

uses MainU;

{$R *.dfm}
constructor TRekapHistoryArmadaPergantianPart.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TRekapHistoryArmadaPergantianPart.Init;
begin
  Part.Text:='';
end;

procedure TRekapHistoryArmadaPergantianPart.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=7;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=450;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=80;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Part GP';
  StrGrid.Cells[2,0]:='Nama Part';
  StrGrid.Cells[3,0]:='KM Standard Pergantian';
  StrGrid.Cells[4,0]:='KM Terakhir Ganti';
  StrGrid.Cells[5,0]:='Tanggal Terakhir Ganti';

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TRekapHistoryArmadaPergantianPart.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TRekapHistoryArmadaPergantianPart.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
end;

procedure TRekapHistoryArmadaPergantianPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
