unit SplitBusSJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupInput: TPanel;
    btnTombolCari: TSpeedButton;
    Nominal: TEdit;
    NoSJ: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Simpan: TButton;
    Batal: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Edit6: TEdit;
    Label11: TLabel;
    ListBox1: TListBox;
    procedure btnTombolCariClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses MainU, SPJBusListU;

{$R *.dfm}

procedure TForm1.btnTombolCariClick(Sender: TObject);
begin
    if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'SplitSJ',0,True, 1);
end;

end.
