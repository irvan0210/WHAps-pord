unit IntegrateGPCommissionTaxiU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TIntegrateGPCommissionTaxi = class(TForm)
    StrGrid1: TZColorStringGrid;
    ToXCel1: TSpeedButton;
    Selesai: TButton;
    Label2: TLabel;
    FromDates: TDateTimePicker;
    GroupLokasi: TGroupBox;
    Label1: TLabel;
    LokasiDisp: TEdit;
    Lokasi: TComboBox;
    StrGrid2: TZColorStringGrid;
    ToXcel2: TSpeedButton;
    Process: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    GPIndex: TEdit;
    Label4: TLabel;
    GPLastGL: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure ToXCel1Click(Sender: TObject);
    procedure ToXcel2Click(Sender: TObject);
    procedure ProcessClick(Sender: TObject);
    procedure GPLastGLKeyPress(Sender: TObject; var Key: Char);
    procedure LokasiChange(Sender: TObject);
  private
    { Private declarations }
    JenisArr,LokasiArr:Array of TArrString7;
    procedure Init;
    procedure InitGrid1;
    procedure InitGrid2;
    procedure RefreshJenis;
    procedure RefreshCombo;
    procedure RefreshData1;
    procedure RefreshData2;
    procedure ProcessData;
  public
    { Public declarations }
  end;

var
  IntegrateGPCommissionTaxi: TIntegrateGPCommissionTaxi;

implementation

uses MainU, DB;

{$R *.dfm}

procedure TIntegrateGPCommissionTaxi.Init;
begin
  FromDates.Date:=Now();
  Lokasi.ItemIndex:=-1;
  LokasiDisp.Text:='';
  GPIndex.Text:='';
  if UserLevel<59 then begin
    ToXCel1.Enabled:=False;
    ToXCel2.Enabled:=False;
  end;
end;

procedure TIntegrateGPCommissionTaxi.InitGrid1;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid1.Cells[IntCount2,IntCount]:='';
  StrGrid1.RowCount:=8;
  StrGrid1.ColCount:=11;
  StrGrid1.Cells[0,1]:='HEADER BANK';
  StrGrid1.Cells[0,2]:='OPTION_ID';
  StrGrid1.Cells[1,2]:='TYPE_ID';
  StrGrid1.Cells[2,2]:='DATE';
  StrGrid1.Cells[3,2]:='CHECKBOOK_ID';
  StrGrid1.Cells[4,2]:='CURRENCY_ID';
  StrGrid1.Cells[5,2]:='NUMBER';
  StrGrid1.Cells[6,2]:='PAID_TO';
  StrGrid1.Cells[7,2]:='RECEIVED_FROM';
  StrGrid1.Cells[8,2]:='DESCRIPTION';
  StrGrid1.Cells[9,2]:='AMOUNT';
  StrGrid1.Cells[10,2]:='INDEX_NUMBER';
  StrGrid1.Cells[0,5]:='DETAIL BANK';
  StrGrid1.Cells[0,6]:='NUMBER';
  StrGrid1.Cells[1,6]:='COA';
  StrGrid1.Cells[2,6]:='DEBIT_AMOUNT';
  StrGrid1.Cells[3,6]:='CREDIT_AMOUNT';
  StrGrid1.Cells[4,6]:='DISTRIBUTION_REFERRENCE';
  StrGrid1.Cells[5,6]:='INDEX_NUMBER';
end;


procedure TIntegrateGPCommissionTaxi.InitGrid2;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid2.RowCount-1 do
    for IntCount2:=0 to StrGrid2.ColCount-1 do
      StrGrid2.Cells[IntCount2,IntCount]:='';
  StrGrid2.RowCount:=23;
  StrGrid2.ColCount:=12;
  StrGrid2.Cells[0,1]:='HEADER GL';
  StrGrid2.Cells[0,2]:='BATCH_ID';
  StrGrid2.Cells[1,2]:='INDEX_NUMBER';
  StrGrid2.Cells[2,2]:='LAST_GL_NUMBER_GP';
  StrGrid2.Cells[3,2]:='GL_NUMBER_GP';
  StrGrid2.Cells[4,2]:='DATE';
  StrGrid2.Cells[5,2]:='TYPE';
  StrGrid2.Cells[6,2]:='SOURCE_DOCUMENT';
  StrGrid2.Cells[7,2]:='REFERRENCE';
  StrGrid2.Cells[8,2]:='CURRENCY_ID';
  StrGrid2.Cells[0,5]:='DETAIL GL';
  StrGrid2.Cells[0,6]:='BATCH_ID';
  StrGrid2.Cells[1,6]:='INDEX_NUMBER';
  StrGrid2.Cells[2,6]:='LAST_GL_NUMBER_GP';
  StrGrid2.Cells[3,6]:='GL_NUMBER_GP';
  StrGrid2.Cells[4,6]:='DATE';
  StrGrid2.Cells[5,6]:='COA';
  StrGrid2.Cells[6,6]:='DEBIT_AMOUNT';
  StrGrid2.Cells[7,6]:='CREDIT_AMOUNT';
  StrGrid2.Cells[8,6]:='DISTRIBUTION_REFERENCE';
  StrGrid2.Cells[9,6]:='SEQUENCE_LINE';

  StrGrid2.Cells[0,21]:='DETAIL DIMENSION GL';
  StrGrid2.Cells[0,22]:='INDEX_NUMBER';
  StrGrid2.Cells[1,22]:='LAST_GL_NUMBER_GP';
  StrGrid2.Cells[2,22]:='GL_NUMBER_GP';
  StrGrid2.Cells[3,22]:='COA';
  StrGrid2.Cells[4,22]:='DEBIT_AMOUNT';
  StrGrid2.Cells[5,22]:='CREDIT_AMOUNT';
  StrGrid2.Cells[6,22]:='ASSIGN_ID';
  StrGrid2.Cells[7,22]:='TRX_DIMENSION_AMOUNT';
  StrGrid2.Cells[8,22]:='TRX_DIMENSION';
  StrGrid2.Cells[9,22]:='TRX_DIMENSION_ALPHANUMERIC';
  StrGrid2.Cells[10,22]:='DISTRIBUTION_REFERENCE';
  StrGrid2.Cells[11,22]:='SEQUENCE_LINE';
end;

procedure TIntegrateGPCommissionTaxi.RefreshJenis;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
end;

procedure TIntegrateGPCommissionTaxi.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetLocation 3,1';
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

procedure TIntegrateGPCommissionTaxi.RefreshData1;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrGrid1.Cells[0,3]:='2';
    StrGrid1.Cells[1,3]:='2';
    StrGrid1.Cells[2,3]:=FormatDateTime('dd/mm/yyyy',FromDates.Date);
    StrGrid1.Cells[3,3]:='KAS '+UpperCase(LokasiArr[Lokasi.ItemIndex][2]);
    StrGrid1.Cells[4,3]:='IDR';
    StrGrid1.Cells[5,3]:=GPIndex.Text;
    StrGrid1.Cells[7,3]:='Driver';
    StrGrid1.Cells[10,3]:='1';
    StrQry:='EXEC IntegrateGPTX9 '+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+','+QuotedStr(Lokasi.Text)+',@Total=1'+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['total']<>NULL then begin
        StrGrid1.Cells[9,3]:=IntToStr(Qry.FieldValues['total'])+',00';
        StrGrid1.Cells[8,3]:=Qry.FieldValues['details'];
      end;
    end;
    Qry.Close;
    StrQry:='EXEC IntegrateGPTX10 '+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+','+QuotedStr(Lokasi.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrGrid1.RowCount:=StrGrid1.RowCount+1;
      StrGrid1.Cells[0,IntCount+7]:=GPIndex.Text;
      if Qry.FieldValues['coa_disposisi']<>NULL then
        StrGrid1.Cells[1,IntCount+7]:=Qry.FieldValues['coa_disposisi'];
      if Qry.FieldValues['amount_debit']<>NULL then
        StrGrid1.Cells[2,IntCount+7]:=IntToStr(Qry.FieldValues['amount_debit'])+',00';
      if Qry.FieldValues['amount_credit']<>NULL then
        StrGrid1.Cells[3,IntCount+7]:=IntToStr(Qry.FieldValues['amount_credit'])+',00';
      if Qry.FieldValues['details']<>NULL then
      StrGrid1.Cells[4,IntCount+7]:=Qry.FieldValues['details'];
      StrGrid1.Cells[5,IntCount+7]:='1';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPCommissionTaxi.RefreshData2;
var Qry,Qry2:TADOQuery;
    StrQry,StrBatchId,StrGLNum,StrLastIndex1,StrLastIndex2,StrLastIndex:String;
    IntCount,IntCount2,IntLastRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrBatchId:='GP'+UpperCase(LokasiArr[Lokasi.ItemIndex][2])+FormatDateTime('ddmmyy',FromDates.Date)+FormatDateTime('hhnn',Now());
    if GPLastGL.Text<>'' then StrGLNum:=IntToStr(StrToInt(GPLastGL.Text)+1) else StrGLNum:='';
    IntCount:=1;
    StrQry:='EXEC IntegrateGPTX9 '+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+','+QuotedStr(Lokasi.Text)+',@Total=0'+';';    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if Qry.FieldValues['total']<>NULL then begin
        StrGrid2.Cells[0,3]:=StrBatchId;
        StrGrid2.Cells[1,3]:='1';
        StrGrid2.Cells[2,3]:=GPLastGL.Text;
        StrGrid2.Cells[3,3]:=StrGlNum;
        StrGrid2.Cells[4,3]:=FormatDateTime('dd/mm/yyyy',FromDates.Date);
        StrGrid2.Cells[5,3]:='0';
        StrGrid2.Cells[6,3]:='IMGJ';
        if Qry.FieldValues['details']<>NULL then
          StrGrid2.Cells[7,3]:=Qry.FieldValues['details'];
        StrGrid2.Cells[8,3]:='IDR';
      end
    end;
    Qry.Close;
    StrLastIndex1:='';
    StrLastIndex2:='';
    StrQry:='EXEC IntegrateGPTX11 '+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+','+QuotedStr(Lokasi.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrLastIndex2:=StrLastIndex1;
      StrLastIndex1:=IntToStr(IntCount*100);
      StrGrid2.Cells[0,6+IntCount]:=StrBatchId;
      StrGrid2.Cells[1,6+IntCount]:='1';
      StrGrid2.Cells[2,6+IntCount]:=GPLastGL.Text;
      StrGrid2.Cells[3,6+IntCount]:=StrGLNum;
      StrGrid2.Cells[4,6+IntCount]:=FormatDateTime('dd/mm/yyyy',FromDates.Date);
      if Qry.FieldValues['coa']<>NULL then
        StrGrid2.Cells[5,6+IntCount]:=Qry.FieldValues['coa'];
      if Qry.FieldValues['amount_debit']<>NULL then
        StrGrid2.Cells[6,6+IntCount]:=IntToStr(Qry.FieldValues['amount_debit'])+',00';
      if Qry.FieldValues['amount_credit']<>NULL then
        StrGrid2.Cells[7,6+IntCount]:=IntToStr(Qry.FieldValues['amount_credit'])+',00';
      if Qry.FieldValues['details']<>NULL then
        StrGrid2.Cells[8,6+IntCount]:=Qry.FieldValues['details'];
      StrGrid2.Cells[9,6+IntCount]:=StrLastIndex1;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Inc(IntCount);
    StrQry:='EXEC IntegrateGPTX12 '+QuotedStr(FormatDateTime('yyyy/mm/dd',FromDates.Date))+','+QuotedStr(Lokasi.Text)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount2:=1;
    StrLastIndex:=StrLastIndex2;
    IntLastRow:=0;
    if Qry.RecordCount>0 then while not Qry.Eof do begin
      if Qry.FieldValues['row']<IntLastRow then StrLastIndex:=StrLastIndex1;
      StrGrid2.RowCount:=StrGrid2.RowCount+1;
      StrGrid2.Cells[0,15+IntCount+(IntCount2*2)]:=StrBatchId;
      StrGrid2.Cells[1,15+IntCount+(IntCount2*2)]:=GPLastGL.Text;
      StrGrid2.Cells[2,15+IntCount+(IntCount2*2)]:=StrGLNum;
      if Qry.FieldValues['coa_disposisi']<>NULL then
        StrGrid2.Cells[3,15+IntCount+(IntCount2*2)]:=Qry.FieldValues['coa_disposisi'];
      if Qry.FieldValues['amount_debit']<>NULL then
        StrGrid2.Cells[4,15+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_debit'])+',00';
      if Qry.FieldValues['amount_credit']<>NULL then
        StrGrid2.Cells[5,15+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_credit'])+',00';
      if Qry.FieldValues['row']<>NULL then
        StrGrid2.Cells[6,15+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['row']);
      if Qry.FieldValues['amount_dimension']<>NULL then
        StrGrid2.Cells[7,15+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_dimension'])+',00';
      StrGrid2.Cells[8,15+IntCount+(IntCount2*2)]:='BODY';
      StrGrid2.Cells[9,15+IntCount+(IntCount2*2)]:=Qry.FieldValues['body_id'];
      if Qry.FieldValues['details']<>NULL then
        StrGrid2.Cells[10,15+IntCount+(IntCount2*2)]:=Qry.FieldValues['details'];
      StrGrid2.Cells[11,15+IntCount+(IntCount2*2)]:=StrLastIndex;
      StrGrid2.RowCount:=StrGrid2.RowCount+1;
      StrGrid2.Cells[0,16+IntCount+(IntCount2*2)]:=StrBatchId;
      StrGrid2.Cells[1,16+IntCount+(IntCount2*2)]:=GPLastGL.Text;
      StrGrid2.Cells[2,16+IntCount+(IntCount2*2)]:=StrGLNum;
      if Qry.FieldValues['coa_disposisi']<>NULL then
        StrGrid2.Cells[3,16+IntCount+(IntCount2*2)]:=Qry.FieldValues['coa_disposisi'];
      if Qry.FieldValues['amount_debit']<>NULL then
        StrGrid2.Cells[4,16+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_debit'])+',00';
      if Qry.FieldValues['amount_credit']<>NULL then
        StrGrid2.Cells[5,16+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_credit'])+',00';
      if Qry.FieldValues['row']<>NULL then
        StrGrid2.Cells[6,16+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['row']);
      if Qry.FieldValues['amount_dimension']<>NULL then
        StrGrid2.Cells[7,16+IntCount+(IntCount2*2)]:=IntToStr(Qry.FieldValues['amount_dimension'])+',00';
      StrGrid2.Cells[8,16+IntCount+(IntCount2*2)]:='POOL';
      StrGrid2.Cells[9,16+IntCount+(IntCount2*2)]:=Qry.FieldValues['code'];
      if Qry.FieldValues['details']<>NULL then
        StrGrid2.Cells[10,16+IntCount+(IntCount2*2)]:=Qry.FieldValues['details'];
      StrGrid2.Cells[11,16+IntCount+(IntCount2*2)]:=StrLastIndex;
      IntLastRow:=Qry.FieldValues['row'];
      Qry.Next;
      Inc(IntCount2);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TIntegrateGPCommissionTaxi.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshJenis;
end;

procedure TIntegrateGPCommissionTaxi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TIntegrateGPCommissionTaxi.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TIntegrateGPCommissionTaxi.ToXCel1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid1) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TIntegrateGPCommissionTaxi.ToXcel2Click(Sender: TObject);
begin
  if ToExcel4(StrGrid2) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TIntegrateGPCommissionTaxi.ProcessClick(Sender: TObject);
begin
  ProcessData;
end;

procedure TIntegrateGPCommissionTaxi.ProcessData;
begin
  InitGrid1;
  InitGrid2;
  RefreshData1;
  RefreshData2;
end;

procedure TIntegrateGPCommissionTaxi.GPLastGLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TIntegrateGPCommissionTaxi.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];  
end;

end.
