unit LogViewerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB;

type
  TLogViewer = class(TForm)
    GroupLog: TGroupBox;
    Cari: TEdit;
    Label1: TLabel;
    StrGrid: TStringGrid;
    Selesai: TButton;
    Hapus: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  LogViewer: TLogViewer;

implementation

{$R *.dfm}

procedure TLogViewer.Init;
begin
  Cari.Text:='';
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:=' Log Id';
  StrGrid.Cells[0,1]:=' Form';
  StrGrid.Cells[0,2]:=' Form Id';
  StrGrid.Cells[0,3]:=' Status';
  StrGrid.Cells[0,4]:=' Time';
  StrGrid.Cells[0,5]:=' User';
  StrGrid.Cells[1,0]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[1,2]:='';
  StrGrid.Cells[1,3]:='';
  StrGrid.Cells[1,4]:='';
  StrGrid.Cells[1,5]:='';
end;

procedure TLogViewer.RefreshData;
begin

end;

procedure TLogViewer.FormCreate(Sender: TObject);
begin
  Init;
  RefreshData;
end;

end.
