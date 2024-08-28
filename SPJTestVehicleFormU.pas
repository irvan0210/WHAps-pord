unit SPJTestVehicleFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSPJTestVehicleForm = class(TForm)
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Tanggal: TEdit;
    NoSPJ: TEdit;
    Jam: TEdit;
    Label2: TLabel;
    NoBody: TComboBox;
    NoPolisi: TEdit;
    Label4: TLabel;
    Label15: TLabel;
    Petugas: TEdit;
    TelpHP: TEdit;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupDetail: TGroupBox;
    Rit: TEdit;
    Drop: TEdit;
    KMArgo: TEdit;
    KMOrdo: TEdit;
    Catatan: TMemo;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SPJTestVehicleForm: TSPJTestVehicleForm;

implementation

{$R *.dfm}

procedure TSPJTestVehicleForm.SelesaiClick(Sender: TObject);
begin
  SPJTestVehicleForm.Close;
end;

procedure TSPJTestVehicleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
