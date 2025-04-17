unit HistoryPrintOrderFeeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB, Grids, ZColorStringGrid;

type
  THistoryPrintOrderFee = class(TForm)
    HistoryList: TListBox;
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SJId:String;
    HistoryArr: Array of TArrString2;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;SJ_Id:String='');Overload;
  end;

var
  HistoryPrintOrderFee: THistoryPrintOrderFee;

implementation

uses MainU;

{$R *.dfm}
constructor THistoryPrintOrderFee.Create(AOwner:TComponent;SJ_Id:String='');
begin
  SJId:=SJ_Id;
  inherited Create(AOwner);
end;

procedure THistoryPrintOrderFee.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=1;
  StrGrid.ColWidths[0]:=850;


  StrGrid.Cells[0,0]:='Riwayat Cetak';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure THistoryPrintOrderFee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure THistoryPrintOrderFee.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure THistoryPrintOrderFee.RefreshData;
var
  QStr:String;
  IntCount:Integer;
  Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;

  QStr:='SELECT rr.* FROM ( '+
        'SELECT CONCAT(''Cetak Pertama dilakukan oleh '', b.name,'' pada tanggal '',CONVERT(VARCHAR(10),a.update_time,103)) history, 0 urut '+
        'FROM wh_report_print a '+
        'LEFT JOIN wh_user b ON a.update_user=b.username '+
        'WHERE report_id='+QuotedStr(SJId)+' AND report_name=''Order Fee'' '+
        'AND print_status_id=0 '+
        'UNION ALL '+
        'SELECT  CASE WHEN zz.status=''Perubahan Data'' THEN (CONCAT(''Copy '',CAST(zz.urut AS VARCHAR),'' Alasan '' +(CHAR(13) + CHAR(10)) '+
        ',zz.notes,(CHAR(13) + CHAR(10))+ ''dilakukan oleh '',zz.name,'' pada tanggal '',zz.update_time) ) '+
        'ELSE (CONCAT(''Copy '',CAST(zz.urut AS VARCHAR),'' Alasan '',zz.notes, '' dilakukan oleh '',zz.name,'' pada tanggal '',zz.update_time)) '+
        'END history '+
        ',CAST(zz.urut AS VARCHAR) FROM '+
        '(SELECT ROW_NUMBER() over (partition BY a.report_id order by report_reprint_id ASC) urut , '+
        'case when a.print_status_id=7 then ''Perubahan Data ''+ a.note else b.status end notes, c.name,b.status,CONVERT(VARCHAR(10),a.update_time,103) update_time '+
        'FROM wh_report_print a LEFT JOIN wh_print_status b on a.print_status_id=b.report_status_id '+
        'LEFT JOIN wh_user c ON a.update_user=c.username '+
        'where report_id='+QuotedStr(SJId)+' AND report_name=''Order Fee'' '+
        'AND a.print_status_id<>0)zz)rr ORDER BY rr.urut DESC;';


  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  HistoryList.Clear;
  IntCount:=0;
  if Qry.RecordCount>0 then while not(Qry.Eof) do begin
    SetLength(HistoryArr,IntCount+1);
    HistoryArr[IntCount][0]:=Qry.FieldValues['history'];
    Qry.Next;
    Inc(IntCount);
  end;

//  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
//    HistoryList.Items.Add(Qry.FieldValues['history']);
//    Qry.Next;
//  end;
  Qry.Close;
  Main.MyConnection.Close;

end;

procedure THistoryPrintOrderFee.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  if Length(HistoryArr)>0 then StrGrid.RowCount:=Length(HistoryArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(HistoryArr)-1;
  for IntCount:=0 to Length(HistoryArr)-1 do begin
    Application.ProcessMessages;
    StrGrid.Cells[0,IntCount+1]:=HistoryArr[IntCount][0];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taLeftJustify;
  end;
end;

procedure THistoryPrintOrderFee.FormShow(Sender: TObject);
begin
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

end.
