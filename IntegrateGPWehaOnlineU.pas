unit IntegrateGPWehaOnlineU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TIntegrateGPWehaOnline = class(TForm)
    StrGrid: TZColorStringGrid;
    ToXCel1: TSpeedButton;
    Selesai: TButton;
    Label2: TLabel;
    FromDates: TDateTimePicker;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    Lokasi: TComboBox;
    Process: TButton;
    Label3: TLabel;
    ToDates: TDateTimePicker;
    ToDate: TCheckBox;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCel1Click(Sender: TObject);
    procedure ProcessClick(Sender: TObject);
    procedure GPLastGLKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiChange(Sender: TObject);
    procedure ToDateClick(Sender: TObject);
  private
    { Private declarations }
    JenisArr,LokasiArr:Array of TArrString7;
    SyncOrderArr,CompanyArr:Array of TArrString9;

    WOConnection:TADOConnection;
    Query:TADOQuery;
    StrQuery:String;
    DbWO,DbHostWO,DbUserWO,DbPassWO,ProviderWO :String;
    procedure Init;
    procedure InitGrid1;
    procedure InitDB_WO;

    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData1;
    procedure RefreshGrid;
    procedure ProcessData;
  public
    { Public declarations }
  end;

var
  IntegrateGPWehaOnline: TIntegrateGPWehaOnline;

implementation

uses MainU, DB, StrUtils;

{$R *.dfm}

procedure TIntegrateGPWehaOnline.Init;
begin
  DbWO      :='WHOnline';
  DbHostWO  :='192.168.8.102';
  DbUserWO  :='weha';
  DbPassWO  :='password2018';//'admin@sql2013#';
(*
  DbHostGP  :='localhost';
  DbUserGP  :='sa';
  DbPassGP  :='Pram080707**';//'admin@sql2013#';
*)
  ProviderWO:=Main.Provider;//'SQLNCLI11';
  //posting.Enabled:=False;

  FromDates.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  ToDates.Enabled:=True;
  ToDates.Date:=Now();
  ToDates.Enabled:=False;
  if UserLevel<20 then begin
    ToXCel1.Enabled:=False;
  end;
end;

procedure TIntegrateGPWehaOnline.InitGrid1;
var IntCount,IntCount2:Integer;
begin

  StrGrid.RowCount:=2;
  StrGrid.ColCount:=10;

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=65;
  StrGrid.ColWidths[2]:=65;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=120;
  StrGrid.ColWidths[5]:=250;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=150;

  StrGrid.Cells[0,0]:='No.';
  StrGrid.Cells[1,0]:='Source Area';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='No Order';
  StrGrid.Cells[4,0]:='No Invoice';
  StrGrid.Cells[5,0]:='Customer';
  StrGrid.Cells[6,0]:='Segmen';
  StrGrid.Cells[7,0]:='Nilai Order';
  StrGrid.Cells[8,0]:='Perjalanan';

//  for IntCount:=0 to 8 do
//    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
end;

procedure TIntegrateGPWehaOnline.InitDB_WO;
var IsOk:Boolean;
begin
  StrConnection:='Provider='+ProviderWO+';Password='+DbPassWO+';Persist Security Info=True;User ID='+DbUserWO+';Initial Catalog='+DbWO+';Data Source='+DbHostWO;
  WOConnection:=TADOConnection.Create(Self);
  WOConnection.Connected:=False;
  WOConnection.KeepConnection:=False;
  WOConnection.CursorLocation:=clUseClient;
  WOConnection.LoginPrompt:=False;
  WOConnection.CommandTimeout:=3600;
  WOConnection.ConnectionTimeout:=3600;
  Main.WriteLog('Init DB WehaOnline');
  IsOk:=True;
  try
    //CreateDbConnection;
    WOConnection.ConnectionString:=StrConnection;
  except
    on E:Exception do begin
      Main.WriteLog('Error Create DB Connection Weha Online');
      IsOk:=False;
      //SetManual:=MessageBox(Handle,PChar('Error Create DB Connection'+e.Message+Chr(13)+Chr(13)+' Set Connection Manually ?'),'Database',MB_OKCANCEL or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
    end;
  end;

  if IsOk then Main.WriteLog('Finish Init DB Weha Online')
  else Main.WriteLog('Error Init DB Weha Online');
end;

procedure TIntegrateGPWehaOnline.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
end;

procedure TIntegrateGPWehaOnline.RefreshCombo;
var QStr,StrQry:String;
    Qry:TADOQuery;
    Count,IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
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
      Inc(IntCount)
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;


    QStr:='EXEC GetLocation 2,1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      LokasiArr[Count][2]:=Qry.FieldValues['code'];
      if Qry.FieldValues['coa_disposisi']<>NULL then LokasiArr[Count][3]:=Qry.FieldValues['coa_disposisi'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  if StrToInt(LocationId)>1 then
    Lokasi.Enabled:=False;
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Normal;
end;

procedure TIntegrateGPWehaOnline.RefreshData1;
var Query:TADOQuery;
    StrQry,StrDates:String;
    IntCount:Integer;
begin
  InitDB_WO;
  Query:=TADOQuery.Create(Self);
  Query.Connection := WOConnection;
  Query.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(SyncOrderArr, 0);

    if ToDates.Enabled=False then StrDates:='@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))
    else StrDates:='@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',ToDates.Date));
    StrQry:='EXEC GetIsSyncData '+StrDates;
    Query.SQL.Add(StrQry);
    IntCount:=0;
    Query.Open;
    SetLength(SyncOrderArr, Query.RecordCount);
    if Query.RecordCount>0 then while not(Query.Eof) do begin
      SyncOrderArr[IntCount][0]:=Query.FieldValues['TanggalSync'];
      SyncOrderArr[IntCount][1]:=Query.FieldValues['OrderNo'];
      SyncOrderArr[IntCount][2]:=Query.FieldValues['CustomerNo'];
      SyncOrderArr[IntCount][3]:=Query.FieldValues['Customer'];
      SyncOrderArr[IntCount][4]:=Query.FieldValues['Segmen'];
      SyncOrderArr[IntCount][5]:=IToCurr(Query.FieldValues['NilaiOrder']);
      SyncOrderArr[IntCount][6]:=Query.FieldValues['Source'];
      SyncOrderArr[IntCount][7]:=Query.FieldValues['Perjalanan'];
      SyncOrderArr[IntCount][8]:=Query.FieldValues['WEHAInvoiceId'];

      Inc(IntCount);
      Query.Next;
    end;
    Query.Close;
  end;
  FreeAndNil(Query);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPWehaOnline.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=1 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  if Length(SyncOrderArr)>0 then StrGrid.RowCount:=Length(SyncOrderArr)+1
  else begin
    StrGrid.RowCount:=2;
  end;
  for IntCount:=0 to Length(SyncOrderArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=SyncOrderArr[IntCount][6];
    StrGrid.Cells[2,IntCount+1]:=SyncOrderArr[IntCount][0];
    StrGrid.Cells[3,IntCount+1]:=SyncOrderArr[IntCount][1];
    StrGrid.Cells[4,IntCount+1]:=SyncOrderArr[IntCount][8];
    StrGrid.Cells[5,IntCount+1]:=SyncOrderArr[IntCount][3];
    StrGrid.Cells[6,IntCount+1]:=SyncOrderArr[IntCount][4];
    StrGrid.Cells[7,IntCount+1]:=SyncOrderArr[IntCount][5];
    StrGrid.Cells[8,IntCount+1]:=SyncOrderArr[IntCount][7];

    //for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clWindowText;
{
    if SyncOrderArr[IntCount][9]='0' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clRed;
    if TransType=1 then begin
      if SyncOrderArr[IntCount][7]='0' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clGreen;
    end;
}    
  end;
  Main.M_Normal;
end;

procedure TIntegrateGPWehaOnline.FormShow(Sender: TObject);
begin
  Init;
  InitGrid1;
  RefreshCombo;
  RefreshJenis;
end;

procedure TIntegrateGPWehaOnline.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TIntegrateGPWehaOnline.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TIntegrateGPWehaOnline.ToXCel1Click(Sender: TObject);
var
  StrNamasheet : String;
begin
  StrNamasheet := 'Data Sync '+FormatDateTime('ddMMMYY',FromDates.DateTime)+' s/d '+FormatDateTime('ddMMMYY',ToDates.DateTime);
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPWehaOnline.ProcessClick(Sender: TObject);
begin
  ProcessData;
end;

procedure TIntegrateGPWehaOnline.ProcessData;
begin
  InitGrid1;
  RefreshData1;
  RefreshGrid;
end;

procedure TIntegrateGPWehaOnline.GPLastGLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TIntegrateGPWehaOnline.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TIntegrateGPWehaOnline.ToDateClick(Sender: TObject);
begin
  if ToDate.Checked=True then begin
    ToDates.Enabled:=True;
  end else begin
    ToDates.Enabled:=False;
  end;
end;

end.
