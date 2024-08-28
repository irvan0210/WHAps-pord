unit EmployeeDebtClaimU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls;

type
  TEmployeeDebtClaim = class(TForm)
    StrGrid: TZColorStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Tampilkan: TButton;
    NoKPP: TComboBox;
    Panel1: TPanel;
    Mitra: TEdit;
    GroupLokasi: TGroupBox;
    Label3: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    Cari: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeDebtClaim: TEmployeeDebtClaim;

implementation

{$R *.dfm}

end.
