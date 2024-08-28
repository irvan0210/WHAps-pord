unit CekPengajuanBarangListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, ADODB, WHUnit;

type
  TCekPengajuanBarangList = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    Tanggal: TDateTimePicker;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    CheckSelect: TCheckBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,GroupArr:Array of TArrString2;
    OrderArr,CompanyArr:Array of TArrString9;
    MaxCol:Integer;
    IntRow,IntCol,IsIntegrate,MinRowGrid:Integer;
    IsInput,Initiation:Boolean;
    StrTitel:String;


    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    procedure LoadPengajuan;
  end;

var
  CekPengajuanBarangList: TCekPengajuanBarangList;

implementation

uses MainU;

{$R *.dfm}

procedure TCekPengajuanBarangList.LoadPengajuan;
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
  RefreshData;
  RefreshGrid;
end;


procedure TCekPengajuanBarangList.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();

  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

end;


procedure TCekPengajuanBarangList.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=9;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=120;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=400;
  StrGrid.ColWidths[6]:=64;
  StrGrid.ColWidths[7]:=80;
  StrGrid.ColWidths[8]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='No Request';
  StrGrid.Cells[3,0]:='Request';
  StrGrid.Cells[4,0]:='No Service Request';
  StrGrid.Cells[5,0]:='Item Detail';
  StrGrid.Cells[6,0]:='Qty';
  StrGrid.Cells[7,0]:='Tanggal Dibutuhkan';
  StrGrid.Cells[8,0]:='Posting';


  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;


procedure TCekPengajuanBarangList.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit,No:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;
  Main.M_Busy;

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);

    StrQry:='select a.*,b.name,c.tgl_dibutuhkan_barang from wh_warehouse_item_request a '+
            'left join wh_user b on a.request_id=b.username '+
            'left join wh_service_request c on a.service_request_id=c.service_request_id '+
            'where a.company_id='+StrCompanyId+' and a.status=1;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(OrderArr,IntCount+1);
      OrderArr[IntCount][0]:=IntToStr(No);
      OrderArr[IntCount][1]:= FormatDateTime('dd/MM/YYYY', Qry.FieldValues['request_date']) ;
      OrderArr[IntCount][2]:=Qry.FieldValues['warehouse_item_request_id'];
      OrderArr[IntCount][3]:=Qry.FieldValues['name'];
      OrderArr[IntCount][4]:=Qry.FieldValues['service_request_id'];
      OrderArr[IntCount][7]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['tgl_dibutuhkan_barang']) ;
      if  Qry.FieldValues['posting']='1' then begin
        OrderArr[IntCount][9]:='1';
      end else begin
        OrderArr[IntCount][9]:='0';
      end;
//

      StrQry:='select item_detail,qty,isAvailable from wh_warehouse_item_request_detail where '+
              'warehouse_item_request_id='+QuotedStr(Qry.FieldValues['warehouse_item_request_id'])+' and status=1;';
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(OrderArr,IntCount+1);
          OrderArr[IntCount][0]:=  IntToStr(No);
          OrderArr[IntCount][1]:= FormatDateTime('dd/MM/YYYY', Qry.FieldValues['request_date']) ;
          OrderArr[IntCount][2]:=Qry.FieldValues['warehouse_item_request_id'];
          OrderArr[IntCount][3]:=Qry.FieldValues['name'];
          OrderArr[IntCount][4]:=Qry.FieldValues['service_request_id'];
          OrderArr[IntCount][7]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['tgl_dibutuhkan_barang']) ;
          if  Qry.FieldValues['posting']='1' then begin
            OrderArr[IntCount][9]:='1';
          end else begin
            OrderArr[IntCount][9]:='0';
          end;

        end;
        OrderArr[IntCount][5]:=Qry2.FieldValues['item_detail'];
        OrderArr[IntCount][6]:=Qry2.FieldValues['qty'];
        if (Qry2.FieldValues['isAvailable']=1)  then
        OrderArr[IntCount][8]:='1'
        else
        OrderArr[IntCount][8]:='0';

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
//    edtTotalUnitOperasi.Text := IToCurr(IntTotalUnit);

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCekPengajuanBarangList.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
//  for IntCount:=0 to StrGrid.ColCount-1 do
//    for IntCount2:=3 to StrGrid.RowCount-1 do begin
//      IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
//      if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
//    end;
  if Length(OrderArr)>0 then StrGrid.RowCount:=Length(OrderArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;
//  for IntCount:=0 to StrGrid.ColCount-1 do begin
//    StrGrid.Cells[IntCount,3]:='';
//    StrGrid.CellStyle[IntCount,3].Font.Color:=clWindowText;
//  end;
  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  lengt:= Length(OrderArr)-1;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>OrderArr[IntCount][2])  then begin
      StrOrderId:=OrderArr[IntCount][2];
      IntStartRow:=IntCount;
      IntStartRow2:=IntCount;
      StrGrid.Cells[0,IntCount+1]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=OrderArr[IntCount][4];
      StrGrid.Cells[7,IntCount+1]:=OrderArr[IntCount][7];
      StrGrid.Cells[8,IntCount+1]:=OrderArr[IntCount][9];

      IsDrawRect:=False;
      IsDrawRect2:=False;
      StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[7,IntCount+1].HorizontalAlignment:=taCenter;

      if OrderArr[IntCount][9]='1' then
      begin
        StrGrid.CellStyle[2,IntCount+1].BGColor:=clMenuHighlight;
        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWhite;
      end
      else begin
        StrGrid.CellStyle[2,IntCount+1].BGColor:=clWindow;
        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clBlack;
      end;

    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][2]) then IsDrawRect:=True;
    end else IsDrawRect:=True;
    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,IntCount+1);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,IntCount+1);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,IntCount+1);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,IntCount+1);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,IntCount+1);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow+1,7,IntCount+1);
      StrGrid.MergeCells.AddRectXY(8,IntStartRow+1,8,IntCount+1);
    end;
    StrGrid.Cells[5,IntCount+1]:=OrderArr[IntCount][5];;
    StrGrid.Cells[6,IntCount+1]:=OrderArr[IntCount][6];
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;

    if OrderArr[IntCount][8]='1' then
    begin
      StrGrid.CellStyle[5,IntCount+1].BGColor:=clMoneyGreen;
      StrGrid.CellStyle[6,IntCount+1].BGColor:=clMoneyGreen;
    end
    else begin
      StrGrid.CellStyle[5,IntCount+1].BGColor:=clWindow;
      StrGrid.CellStyle[6,IntCount+1].BGColor:=clWindow;
    end;

  end;
end;

procedure TCekPengajuanBarangList.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
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
  end;

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];


  FreeAndNil(Qry);
  Main.CloseDb;


  Main.M_Normal;
end;


procedure TCekPengajuanBarangList.FormShow(Sender: TObject);
begin
  LoadPengajuan;
end;

procedure TCekPengajuanBarangList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCekPengajuanBarangList.StrGridDblClick(Sender: TObject);
var
StrWarehouseItemRequestId,StrRequestName,StrNoServiceRequest,StrTglDibutuhkan,StrTglRequest,StrPosting:String;
begin
  StrWarehouseItemRequestId:=StrGrid.Cells[2,IntRow];
  StrRequestName:=StrGrid.Cells[3,IntRow];
  StrNoServiceRequest:=StrGrid.Cells[3,IntRow];
  StrTglDibutuhkan:=StrGrid.Cells[7,IntRow];
  StrTglRequest:=StrGrid.Cells[1,IntRow];
  StrPosting:=StrGrid.Cells[8,IntRow];

//  if Main.IsFormOpen('CekPengajuanBarangDetail')=False then CekPengajuanBarangDetail:=TCekPengajuanBarangDetail.Create(Self);
//  with CekPengajuanBarangDetail do
//  begin
//    Clear;
//    WarehouseItemRequestId:=StrWarehouseItemRequestId;
//    NoReq.Text:=WarehouseItemRequestId;
//    RequestName.Text:=StrRequestName;
//    NoServiceRequest.Text:=StrNoServiceRequest;
//    TglDibutuhkan.Text:=StrTglDibutuhkan;
//    TglRequest.Text:=StrTglRequest;
//    if StrPosting='1' then
//    begin
//      Simpan.Enabled:=False;
//      Posting.Enabled:=False;
//    end else begin
//      Simpan.Enabled:=True;
//      Posting.Enabled:=True;
//    end;
//
//    ShowDetail;
//  end;
end;

procedure TCekPengajuanBarangList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCekPengajuanBarangList.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
