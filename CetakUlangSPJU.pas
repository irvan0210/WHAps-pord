unit CetakUlangSPJU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ExtCtrls,WHUnit, ADODB;

type
  TCetakUlangSPJ = class(TForm)
    Panel1: TPanel;
    StrGrid: TZColorStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    btnCetak: TButton;
    edtDataSPJID: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    edtIReservationID: TEdit;
    btnBatal: TButton;
    btnSelesai: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataArr:Array of TArrString7;
    IntRow:Integer;

    procedure LoadDataCreateSPJWHDCNormal(FReservedOrderID:string);

    procedure RefreshDataList;


  public
    { Public declarations }

    ReservationDataID,FormDari:String;
    IsView:Boolean;
    
    constructor Create(AOwner:TComponent;FReservationDataID,vFormFrom:String;IsViewOnly:Boolean=False);
  end;

var
  CetakUlangSPJ: TCetakUlangSPJ;

implementation

uses MainU, CreateSPJWHDCNormalU;

{$R *.dfm}

constructor TCetakUlangSPJ.Create(AOwner:TComponent;FReservationDataID,vFormFrom:String;IsViewOnly:Boolean=False);
begin
  ReservationDataID:=FReservationDataID;
  FormDari:=vFormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TCetakUlangSPJ.LoadDataCreateSPJWHDCNormal(FReservedOrderID:string);
var
  Qry:TADOQuery;
  Count:Integer;
  vstrSPJReservationID:string;
begin

  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin

    vstrSPJReservationID:=FReservedOrderID;
    StrQry:=' EXECUTE ViewRptSPJReservationWHDCNormal @vSPJReservationID ='+QuotedStr(vstrSPJReservationID);

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['spj_create_id']<>NULL then
      DataArr[Count][0]:=Qry.FieldValues['spj_create_id'];

       if Qry.FieldValues['nama_customer']<>NULL then
      DataArr[Count][1]:=Qry.FieldValues['nama_customer'];

      if Qry.FieldValues['nama_pic']<>NULL then
      DataArr[Count][2]:=Qry.FieldValues['nama_pic'];

      if Qry.FieldValues['body_id']<>NULL then
      DataArr[Count][3]:=Qry.FieldValues['body_id'];

      if Qry.FieldValues['nama_sopir1']<>NULL then
      DataArr[Count][4]:=Qry.FieldValues['nama_sopir1'];

      if Qry.FieldValues['nama_sopir2']<>NULL then
      DataArr[Count][5]:=Qry.FieldValues['nama_sopir2'];

      Inc(Count);
      Qry.Next;
    end;

    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TCetakUlangSPJ.RefreshDataList;
var
  IntCount:Integer;
begin

  if Length(DataArr)>0 then
  StrGrid.RowCount:=Length(DataArr)+1;
  for IntCount:=0 to Length(DataArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=DataArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=DataArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=DataArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=DataArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=DataArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=DataArr[IntCount][5];

  end;

end;




procedure TCetakUlangSPJ.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  if FormDari='CreateSPJWHDCNormalU' then begin

    StrGrid.ColWidths[0]:=150;
    StrGrid.ColWidths[1]:=250;
    StrGrid.ColWidths[2]:=200;
    StrGrid.ColWidths[3]:=70;
    StrGrid.ColWidths[4]:=200;
    StrGrid.ColWidths[5]:=200;

    StrGrid.Cells[0,0]:='ID SPJ';
    StrGrid.Cells[1,0]:='Nama Customer';
    StrGrid.Cells[2,0]:='Nama PIC';
    StrGrid.Cells[3,0]:='Body ID';
    StrGrid.Cells[4,0]:='Nama Supir 1';
    StrGrid.Cells[5,0]:='Nama Supir 2';

    edtIReservationID.Text:=ReservationDataID;
    //LoadDataCreateSPJWHDCNormal(edtIReservationID.Text);
    //RefreshDataList;
    Caption:='Create SPJ WHDC Normal ';

  end;
  
end;

procedure TCetakUlangSPJ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TCetakUlangSPJ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCetakUlangSPJ.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCetakUlangSPJ.btnCetakClick(Sender: TObject);
begin
  if edtDataSPJID.Text='' then begin
    MessageDlg('Data Masih Kosong, Mohon Diisi',mtConfirmation,[mbOK],0);
    Exit;
  end else
   CreateSPJWHDCNormal.CetakDataSPJArmdaNormal(edtDataSPJID.Text);
   
end;

procedure TCetakUlangSPJ.StrGridDblClick(Sender: TObject);
begin
  if FormDari='CreateSPJWHDCNormalU' then begin
    edtDataSPJID.Text:=StrGrid.Cells[0,IntRow];

  end;
end;

procedure TCetakUlangSPJ.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   IntRow:=ARow;
end;

procedure TCetakUlangSPJ.FormShow(Sender: TObject);
begin
   if FormDari='CreateSPJWHDCNormalU' then begin
    LoadDataCreateSPJWHDCNormal(edtIReservationID.Text);
    RefreshDataList;
  end;

end;

procedure TCetakUlangSPJ.btnBatalClick(Sender: TObject);
begin
  edtDataSPJID.Clear;
end;

end.
