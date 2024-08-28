unit CetakCreateSPJU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ExtCtrls;

type
  TCetakCreateSPJ = class(TForm)
    Panel1: TPanel;
    StrGrid: TZColorStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    btnCetak: TButton;
    edtDataID: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnBatal: TButton;
    rdgDalamKota: TRadioGroup;
    rdgLuarKota: TRadioGroup;
    Panel4: TPanel;
    btnSelesai: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataID,FormDari:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;vDataID,vFormFrom:String;IsViewOnly:Boolean=False);

  end;

var
  CetakCreateSPJ: TCetakCreateSPJ;

implementation

{$R *.dfm}

constructor TCetakCreateSPJ.Create(AOwner:TComponent;vDataID,vFormFrom:String;IsViewOnly:Boolean=False);
begin
  DataID:=vDataID;
  FormDari:=vFormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;


procedure TCetakCreateSPJ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCetakCreateSPJ.FormCreate(Sender: TObject);
begin
   KeyPreview :=True;

  if FormDari='CreateSPJWHDCNormalU' then begin
    StrGrid.Cells[0,0]:='ID Booking';
    StrGrid.Cells[1,0]:='ID Customer Order';
    StrGrid.Cells[2,0]:='Nama Customer';

    StrGrid.ColWidths[0]:=80;
    StrGrid.ColWidths[1]:=250;
    StrGrid.ColWidths[2]:=250;

    //LoadDataCustomerOrder;
    //RefreshDataList;


  end;
end;

procedure TCetakCreateSPJ.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCetakCreateSPJ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
  
end;

procedure TCetakCreateSPJ.btnBatalClick(Sender: TObject);
begin
   if FormDari='CreateSPJWHDCNormalU' then begin
    StrGrid.Cells[0,0]:='ID Booking';
    StrGrid.Cells[1,0]:='ID Customer Order';
    StrGrid.Cells[2,0]:='Nama Customer';

    StrGrid.ColWidths[0]:=80;
    StrGrid.ColWidths[1]:=250;
    StrGrid.ColWidths[2]:=250;

    //LoadDataCustomerOrder;
    //RefreshDataList;


  end;
end;

end.
