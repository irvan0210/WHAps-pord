unit RekapHistoryArmadaPergantianPartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ADODB;

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
    procedure Button2Click(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure PartChange(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    MinRowGrid:Integer;
    BatchArr,SeatArr:Array of TArrString2;
    CompanyArr:Array of TArrString7;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshSeat;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;

  end;

var
  RekapHistoryArmadaPergantianPart: TRekapHistoryArmadaPergantianPart;
  kode_part_rekap_armada_id:String;

implementation

uses MainU, ListPartsU, BrowsePartU;

{$R *.dfm}
constructor TRekapHistoryArmadaPergantianPart.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TRekapHistoryArmadaPergantianPart.RefreshSeat;
var QStr,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TRekapHistoryArmadaPergantianPart.Init;
begin
  Part.Text:='';
  TglSampai.Date:=Now;
  Tanggal.Date:=Now;
  kode_part_rekap_armada_id:='';
end;

procedure TRekapHistoryArmadaPergantianPart.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=7;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Polisi';
  StrGrid.Cells[2,0]:='Driver Batangan';
  StrGrid.Cells[3,0]:='Nama Part';
  StrGrid.Cells[3,1]:='Pergantian Terakhir';
  StrGrid.Cells[3,2]:='Tanggal';
  StrGrid.Cells[4,2]:='KM';
  StrGrid.Cells[5,1]:='KM Standard';
  StrGrid.Cells[5,2]:='KM/Hari';
  StrGrid.Cells[6,2]:='KM Standard';

  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,1,2);
  StrGrid.MergeCells.AddRectXY(2,0,2,2);
  StrGrid.MergeCells.AddRectXY(3,0,6,0);
//  StrGrid.MergeCells.AddRectXY(3,0,4,1);

//  StrGrid.MergeCells.AddRectXY(5,0,6,1);


  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
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
  RefreshCombo;
end;

procedure TRekapHistoryArmadaPergantianPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRekapHistoryArmadaPergantianPart.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    isFound:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;

//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');

  Main.M_Normal;
end;

procedure TRekapHistoryArmadaPergantianPart.Button2Click(Sender: TObject);
begin
if Main.IsFormOpen('ListPartsU')=False then
  begin
    ListParts:=TListParts.Create(Self,'REKAPHISTORYARMADAPERGANTIANPART');
  end;
end;

procedure TRekapHistoryArmadaPergantianPart.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TRekapHistoryArmadaPergantianPart.PartChange(Sender: TObject);
begin
  StrGrid.Cells[3,0]:=Part.Text;
end;

end.
