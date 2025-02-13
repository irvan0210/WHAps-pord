unit PrintSettingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ADODB, Registry;

type
  TPrintSetting = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    AddPoint: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    CBSuratJalan: TComboBox;
    Label5: TLabel;
    TopSJ: TEdit;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    CBInvoice: TComboBox;
    Label4: TLabel;
    Label7: TLabel;
    TopInv: TEdit;
    Label8: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure AddPointKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure Init;
    procedure LoadData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintSetting: TPrintSetting;

implementation

uses MainU;

{$R *.dfm}

procedure TPrintSetting.Init;
begin
  AddPoint.Text:='';
  TopSJ.Text:='0';
  TopInv.Text:='0';
  CBSuratJalan.ItemIndex:=0;
  CBInvoice.ItemIndex:=0;
end;

procedure TPrintSetting.LoadData;
begin
  AddPoint.Text:=IntToStr(PrintAddPoint); 
end;

procedure TPrintSetting.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPrintSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPrintSetting.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMessage,RegSuratJalan,RegInvoice,RegTambahanTopSJ,RegTambahanTopInv:String;
    IntCount:Integer;
    IsOk:Boolean;
    Regs:TRegistry;
//    Regs:TRegistry;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    Main.TransStart;
    StrQry:='UPDATE wh_user_detail SET print_line_add_width='+AddPoint.Text+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
      on E:Exception do begin
        IsOk:=False;
        StrEMessage:=StrEMessage+' '+E.Message;
      end;
    end;


//      WriteReg('Print Surat Jalan',’ini_passwordku’);
//      Main.WriteLog('Print Surat jalam'+CBSuratJalan.Text);
    RegSuratJalan:=CBSuratJalan.Text;
    RegInvoice:=CBInvoice.Text;
    if TopSJ.Text<>'' then RegTambahanTopSJ:=TopSJ.Text else RegTambahanTopSJ:='0';
    if TopInv.Text<>'' then RegTambahanTopInv:=TopInv.Text else RegTambahanTopInv:='0';
    try
      Regs:=TRegistry.Create;
      Regs.RootKey:=HKEY_LOCAL_MACHINE;
      try
        if Regs.OpenKey(RegPath,True) then begin
          Regs.WriteString('SetPrinterSJ',RegSuratJalan);
          Regs.WriteString('SetPrinterINV',RegInvoice);
          Regs.WriteString('SetTambahanTopSJ',RegTambahanTopSJ);
          Regs.WriteString('SetTambahanTopInv',RegTambahanTopInv);
          SetPrinterINV:=RegInvoice;
          SetPrinterSJ:=RegSuratJalan;
          SetTambahanTopSJ:=RegTambahanTopSJ;
          SetTambahanTopInv:=RegTambahanTopInv;
        end;
        IsOk:=True;
      except
        on E:Exception do begin
          Main.WriteLog('Registry Save:Fail'+E.Message,1);
          IsOk:=False;
        end;
      end;
    finally
      Regs.CloseKey;
      FreeAndNil(Regs)
    end;
    Main.InitReg;

    if IsOk then begin
      Main.TransCommit;
      PrintAddPoint:=StrToInt(AddPoint.Text);
      MessageBox(0,PChar('Settingan Tersimpan'),'Pengaturan Pencetakan',MB_OK or MB_ICONINFORMATION);
      Close;
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar('Gagal menyimpan'),'Pengaturan Pencetakan',MB_OK or MB_ICONERROR);
    end;
  end;
  Qry.Destroy;
  Main.CloseDb;


  Main.M_Normal;
end;

procedure TPrintSetting.AddPointKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TPrintSetting.FormShow(Sender: TObject);
var
  Regs:TRegistry;
begin
  Init;
  LoadData;


  Regs:=TRegistry.Create(KEY_READ or $0100);
  Regs.RootKey:=HKEY_LOCAL_MACHINE;
//
  if Regs.OpenKeyReadOnly(RegPath) then begin
    SetPrinterSJ:=Regs.ReadString('SetPrinterSJ');
    SetPrinterINV:=Regs.ReadString('SetPrinterINV');
    SetTambahanTopSJ:=Regs.ReadString('SetTambahanTopSJ');
    SetTambahanTopInv:=Regs.ReadString('SetTambahanTopInv');
    if SetPrinterSJ='EPSON LX-310' then
    CBSuratJalan.ItemIndex:=1
    else CBSuratJalan.ItemIndex:=0;

    if SetPrinterINV='EPSON LX-310' then
    CBInvoice.ItemIndex:=1
    else CBInvoice.ItemIndex:=0;

    if SetTambahanTopSJ='' then TopSJ.Text:='0' else TopSJ.Text:=SetTambahanTopSJ;
    if SetTambahanTopInv='' then TopInv.Text:='0' else TopInv.Text:=SetTambahanTopInv;
  end;
  Regs.CloseKey;
  FreeAndNil(Regs);

end;

end.
