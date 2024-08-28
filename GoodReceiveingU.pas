unit GoodReceiveingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, Buttons, WHUnit, ADODB,
  ExtCtrls, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB, ppDB;

type
  TGoodReceiving = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    Label6: TLabel;
    GroupDetail: TGroupBox;
    Label1: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Catatan: TEdit;
    Pengirim: TEdit;
    Tujuan: TEdit;
    TglKirim: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    TglPesan: TEdit;
    Label4: TLabel;
    Pemesan: TEdit;
    Button3: TButton;
    StrGrid: TZColorStringGrid;
    Qty: TEdit;
    PanelCari: TPanel;
    CariPO: TSpeedButton;
    CariGTN: TSpeedButton;
    Label5: TLabel;
    Remark: TEdit;
    UoM: TComboBox;
    Panel1: TPanel;
    PONo: TEdit;
    GTNNo: TEdit;
    PriceUnit: TEdit;
    ppReport: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLogo: TppImage;
    ppTanggal: TppLabel;
    ppLabel19: TppLabel;
    ppNomor: TppLabel;
    ppCompany: TppLabel;
    ppLabel8: TppLabel;
    ppLabel29: TppLabel;
    ppLine1: TppLine;
    ppAddress: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppItemService: TppDBText;
    ppNo: TppDBText;
    ppOldQty: TppDBText;
    ppDetail: TppDBText;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppTransQty: TppDBText;
    ppFinalQty: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppReff: TppLabel;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariPOClick(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure QtyExit(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure QtyEnter(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UoMExit(Sender: TObject);
    procedure PONoKeyPress(Sender: TObject; var Key: Char);
    procedure GTNNoKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariGTNClick(Sender: TObject);
    procedure PriceUnitEnter(Sender: TObject);
    procedure PriceUnitExit(Sender: TObject);
    procedure PriceUnitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure LoadPO;
    procedure LoadPODetail;
    procedure LoadTransfer;
    procedure LoadTransferDetail;
//    procedure RefreshItem;
    procedure RefreshCombo;
    procedure Calculate;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
  public
    { Public declarations }
    procedure SetPRNo(Purchase_Id:String);
    procedure SetGTNNo(Transfer_Id:String);
    procedure Reprint(GoodReceive_Id:String);

  end;

var
  GoodReceiving: TGoodReceiving;
  IsInputGrid:Boolean;
  IntRow,IntCol,MinRowGrid:Integer;
  UoMArr:Array of TArrString4;

implementation

uses PurchaseOrderListU, MainU, GoodReceivingListU, GoodTransferListU,
  Math, RePrintFormU;

{$R *.dfm}

procedure TGoodReceiving.Init;
begin
  PONo.Text:='';
  GTNNo.Text:='';
  Pengirim.Text:='';
  Tujuan.Text:='';
  Catatan.Text:='';
  TglKirim.Text:='';
  TglPesan.Text:='';
  Pemesan.Text:='';
  IsInputGrid:=True;
  MinRowGrid:=1;
  UoM.Text:='';
  UoM.Items.Clear;
  UoM.ItemIndex:=-1;
end;

procedure TGoodReceiving.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=350;
  StrGrid.ColWidths[2]:=35;
  StrGrid.ColWidths[3]:=35;
  StrGrid.ColWidths[4]:=35;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=0;
  StrGrid.ColWidths[10]:=0;
  StrGrid.ColWidths[11]:=0;
  StrGrid.ColWidths[12]:=0;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Barang/Jasa';
  StrGrid.Cells[2,0]:='Quantity';
  StrGrid.Cells[2,1]:='Total';
  StrGrid.Cells[3,1]:='Terima';
  StrGrid.Cells[4,1]:='Masuk';
  StrGrid.Cells[5,0]:='Harga Satuan';
  StrGrid.Cells[6,0]:='Satuan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 12 do
    StrGrid.Cells[IntCount,2]:='';
  StrGrid.CellStyle[2,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[0,2].BGColor:=clWindow;
  StrGrid.CellStyle[1,2].BGColor:=clWindow;
  StrGrid.CellStyle[2,2].BGColor:=clWindow;
  StrGrid.CellStyle[3,2].BGColor:=clWindow;
  StrGrid.CellStyle[4,2].BGColor:=clWindow;
  StrGrid.CellStyle[5,2].BGColor:=clWindow;
  StrGrid.CellStyle[6,2].BGColor:=clWindow;
end;

procedure TGoodReceiving.LoadPO;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPurchaseOrderResume '+QuotedStr(Trim(PONo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TglPesan.Text:=Qry.FieldValues['order_dates'];
      TglKirim.Text:=Qry.FieldValues['delivery_dates'];
      Pengirim.Text:=Qry.FieldValues['vendor_name'];
      Pemesan.Text:=Qry.FieldValues['user_name'];
      Tujuan.Text:=Qry.FieldValues['delivery_company']+' ('+Qry.FieldValues['delivery_address']+')';
      if Qry.FieldValues['description']<>NULL then Catatan.Text:=Qry.FieldValues['description'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  LoadPODetail;
end;

procedure TGoodReceiving.LoadPODetail;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPurchaseOrderDetail '+QuotedStr(Trim(PONo.Text))+','+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+2;
      while not(Qry.Eof) do begin
        StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.Cells[0,IntCount]:=Qry.FieldValues['no'];
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['part_detail_name'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['qty'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['qty_received'];
        StrGrid.Cells[4,IntCount]:='0';
        StrGrid.Cells[5,IntCount]:=SToCurr(Qry.FieldValues['price_unit']);
        StrGrid.Cells[6,IntCount]:=Qry.FieldValues['uom'];
        StrGrid.Cells[7,IntCount]:=Qry.FieldValues['purchase_order_detail_id'];
        StrGrid.Cells[8,IntCount]:=Qry.FieldValues['part_detail_id'];
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['price_unit'];
        StrGrid.Cells[10,IntCount]:=Qry.FieldValues['old_average_price'];
        StrGrid.Cells[11,IntCount]:=Qry.FieldValues['qty_total'];
        StrGrid.Cells[12,IntCount]:=Qry.FieldValues['qty_return'];
        if Qry.FieldValues['qty']=Qry.FieldValues['qty_received'] then begin
          StrGrid.CellStyle[0,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[1,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[2,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[3,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[4,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[5,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[6,IntCount].BGColor:=clGreen;
        end else begin
          StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[3,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[4,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[5,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[6,IntCount].BGColor:=clWindow;
        end;
        Inc(IntCount);
        Qry.Next;
      end;
      StrGrid.Row:=2;
      StrGrid.Col:=4;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodReceiving.LoadTransfer;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetGoodsTransferResume '+QuotedStr(Trim(GTNNo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TglPesan.Text:=Qry.FieldValues['transfer_dates'];
      TglKirim.Text:=Qry.FieldValues['delivery_dates'];
      Pengirim.Text:=Qry.FieldValues['company_name']+' ('+Qry.FieldValues['location']+')';
      Pemesan.Text:=Qry.FieldValues['user_name'];
      Tujuan.Text:=Qry.FieldValues['to_company_name']+' ('+Qry.FieldValues['to_location']+')';
      if Qry.FieldValues['description']<>NULL then Catatan.Text:=Qry.FieldValues['description'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  LoadTransferDetail;
end;

procedure TGoodReceiving.LoadTransferDetail;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetGoodsTransferDetail '+QuotedStr(Trim(GTNNo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=2;
    if Qry.RecordCount>0 then begin
      StrGrid.RowCount:=Qry.RecordCount+2;
      while not(Qry.Eof) do begin
        StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taCenter;
        StrGrid.Cells[0,IntCount]:=IntToStr(IntCount-1);
        StrGrid.Cells[1,IntCount]:=Qry.FieldValues['part_detail_name'];
        StrGrid.Cells[2,IntCount]:=Qry.FieldValues['qty'];
        StrGrid.Cells[3,IntCount]:=Qry.FieldValues['qty_received'];
        StrGrid.Cells[4,IntCount]:='0';
        StrGrid.Cells[5,IntCount]:=Qry.FieldValues['price_unit'];
        StrGrid.Cells[6,IntCount]:=Qry.FieldValues['uom'];
        StrGrid.Cells[7,IntCount]:=Qry.FieldValues['part_transfer_id'];
        StrGrid.Cells[8,IntCount]:=Qry.FieldValues['part_detail_id'];
        StrGrid.Cells[9,IntCount]:=Qry.FieldValues['price_unit'];
        StrGrid.Cells[10,IntCount]:=Qry.FieldValues['old_average_price'];
        StrGrid.Cells[11,IntCount]:=Qry.FieldValues['qty_stock'];
        StrGrid.Cells[12,IntCount]:=Qry.FieldValues['qty_return'];
        if Qry.FieldValues['qty']=Qry.FieldValues['qty_received'] then begin
          StrGrid.CellStyle[0,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[1,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[2,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[3,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[4,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[5,IntCount].BGColor:=clGreen;
          StrGrid.CellStyle[6,IntCount].BGColor:=clGreen;
        end else begin
          StrGrid.CellStyle[0,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[1,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[2,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[3,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[4,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[5,IntCount].BGColor:=clWindow;
          StrGrid.CellStyle[6,IntCount].BGColor:=clWindow;
        end;
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodReceiving.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_uom WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(UoMArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        UoMArr[IntCount][0]:=Qry.FieldValues['uom_id'];
        UoMArr[IntCount][1]:=Qry.FieldValues['uom'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(UoMArr)-1  do
    UoM.Items.Add(UoMArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TGoodReceiving.Calculate;
begin

end;

procedure TGoodReceiving.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
end;

procedure TGoodReceiving.CariPOClick(Sender: TObject);
begin
  if Main.IsFormOpen('PurchaseOrderList')=False then PurchaseOrderList:=TPurchaseOrderList.Create(Self,'GoodReceiving','',1)
  else MessageBox(0,PChar('Silahkan Tutup Jendela List Purchase Order dahulu'),'Penerimaan Barang',MB_OK or MB_ICONERROR);
end;

procedure TGoodReceiving.SetPRNo(Purchase_Id:String);
begin
  if Purchase_Id<>'' then begin
    PONo.Text:=Purchase_Id;
    GTNNo.Text:='';
    LoadPO;
  end;
end;

procedure TGoodReceiving.SetGTNNo(Transfer_Id:String);
begin
  if Transfer_Id<>'' then begin
    GTNNo.Text:=Transfer_Id;
    PONo.Text:='';
    LoadTransfer;
  end;
end;


procedure TGoodReceiving.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TGoodReceiving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TGoodReceiving.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
    StrGrid.Col:=5;
  end;
end;

procedure TGoodReceiving.QtyExit(Sender: TObject);
var IsOk:Boolean;
begin
  IsOk:=True;
  if Trim(Qty.Text)<>'' then begin
    StrGrid.Cells[4,IntRow]:=SToCurr(Qty.Text);
    Calculate;
    if (StrToInt(StrGrid.Cells[4,IntRow])>(StrToInt(StrGrid.Cells[2,IntRow])-StrToInt(StrGrid.Cells[3,IntRow])) ) then begin
      MessageBox(0,'Jumlah Quantity tidak boleh lebih besar dari Order','Penerimaan Barang',MB_OK or MB_ICONERROR);
      Qty.Text:=StrGrid.Cells[4,IntRow];
      Qty.SetFocus;
      IsOk:=False;
    end
  end;
  if IsOk then begin
    Qty.Visible:=False;
    StrGrid.SetFocus;
  end
end;

procedure TGoodReceiving.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) and (StrGrid.Cells[7,IntRow]<>'') and (SToInt(StrGrid.Cells[3,ARow])<SToInt(StrGrid.Cells[2,ARow])) then begin
    if (ACol = 4) and (ARow > MinRowGrid)  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 5) and (ARow > MinRowGrid) and (Trim(PONo.Text)<>'')  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with PriceUnit do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
  end;
end;

procedure TGoodReceiving.QtyEnter(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then Qty.Text:=ToString(Qty.Text);
end;

procedure TGoodReceiving.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrPONo,StrGTNNo,StrLocationId,StrCompanyId,StrModul,StrModulId:String;
    StrPartDetailId,StrQty,StrUomId,StrPurchaseOrderDetailId,StrGoodTransferId,StrRemark,StrDepartmentId,StrUnitPrice,StrFlAvgPrice:String;
    IntOldAvgPrice,IntQtyTotal,IntAvgPrice:Integer;
    FlAvgPrice,FlOldAvgPrice:Extended;
    IntCount,IntCount2:Integer;
    IsOk,IsComplete:Boolean;
begin
  if (Pengirim.Text<>'') AND (TglPesan.Text<>'') AND ((Trim(PONo.Text)<>'') OR (Trim(GTNNo.Text)<>''))   then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrLocationId:=LocationId;
      StrCompanyId:=CompanyId;
      StrDepartmentId:=DepartmentId;
      StrQry:='';
      IsComplete:=True;
      for IntCount:=2 to StrGrid.RowCount-1 do begin
        if (SToInt(StrGrid.Cells[4,IntCount])+SToInt(StrGrid.Cells[3,IntCount]))<=(SToInt(StrGrid.Cells[2,IntCount]) )  then begin
          if (StrGrid.Cells[4,IntCount]<>'0') and (StrGrid.Cells[4,IntCount]<>'') then begin
            StrPartDetailId:=StrGrid.Cells[8,IntCount];
            StrQty:=StrGrid.Cells[4,IntCount];
            for IntCount2:=0 to Length(UoMArr)-1 do
              if UoMArr[IntCount2][1]=StrGrid.Cells[6,IntCount] then StrUomId:=UoMArr[IntCount2][0];
            FlOldAvgPrice:=StrToFloat(StrGrid.Cells[10,IntCount]);
            IntQtyTotal:=SToInt(StrGrid.Cells[11,IntCount]);
            StrUnitPrice:=ToString(StrGrid.Cells[5,IntCount]);
            FlAvgPrice:=RoundTo( (((IntQtyTotal*FlOldAvgPrice)+(SToInt(StrQty)*StrToFloat(StrUnitPrice)))/(IntQtyTotal+SToInt(StrQty))),-2 );
            StrFlAvgPrice := StringReplace(FloatToStr(FlAvgPrice), ',', '.',
                             [rfReplaceAll, rfIgnoreCase]);
            StrPurchaseOrderDetailId:=StrGrid.Cells[7,IntCount];
            StrGoodTransferId:=StrGrid.Cells[7,IntCount];
            if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
            StrQry:='SELECT RIGHT(MAX(part_receive_id),4) AS part_receive_id FROM wh_part_receive '+
                    'WHERE part_receive_id  LIKE '+Chr(39)+'GRN'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                    '____'+Chr(39)+';';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['part_receive_id']<>NULL then begin
              StrTransId:=Qry.FieldValues['part_receive_id'];
              StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
              Qry.Close;
              Qry.SQL.Clear;
            end else
              StrTransId:='0001';
            StrTransId:='GRN'+CompanyCode+LocationCode+DepartmentCode+
                        FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                        FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
            StrQry:='';
            if Trim(PONo.Text)<>'' then begin
              StrQry:=' INSERT INTO wh_part_inventory (part_detail_id,company_id,location_id,department_id'+
                      ',quantity,uom_id,purchase_order_detail_id,unit_price,average_price,part_receive_id'+
                      ',description,update_user) VALUES '+
                      '('+QuotedStr(StrPartDetailId)+','+StrCompanyId+','+StrLocationId+','+StrDepartmentId+
                      ','+StrQty+','+StrUomId+','+QuotedStr(StrPurchaseOrderDetailId)+','+QuotedStr(StrUnitPrice)+
                      ','+QuotedStr(StrFlAvgPrice)+','+QuotedStr(StrTransId)+','+StrRemark+','+QuotedStr(User)+');';
              StrModul:='PurchaseOrder';
              StrModulId:=Trim(PONo.Text);
            end else if Trim(GTNNo.Text)<>'' then begin
              StrQry:=' INSERT INTO wh_part_inventory (part_detail_id,company_id,location_id,department_id'+
                      ',quantity,uom_id,part_transfer_id,unit_price,average_price,part_receive_id,description,update_user) VALUES '+
                      '('+QuotedStr(StrPartDetailId)+','+StrCompanyId+','+StrLocationId+','+StrDepartmentId+
                      ','+StrQty+','+StrUomId+','+QuotedStr(StrGoodTransferId)+','+QuotedStr(StrUnitPrice)+
                      ','+IntToStr(IntAvgPrice)+','+QuotedStr(StrTransId)+','+StrRemark+','+QuotedStr(User)+');';
              StrModul:='GoodTransfer';
              StrModulId:=Trim(GTNNo.Text);
            end;
            if SToInt(StrGrid.Cells[2,IntCount])>(SToInt(StrGrid.Cells[4,IntCount])+SToInt(StrGrid.Cells[3,IntCount])+SToInt(StrGrid.Cells[12,IntCount])) then
              IsComplete:=False;
          end;
        end else begin
          IsOk:=False;
          StrEMessage:='Jumlah yang diterima tidak boleh lebih besar dari P.O';
        end;
      end;
      if IsOk then begin
        StrQry:=StrQry+' INSERT INTO wh_part_receive (part_receive_id,company_id,location_id,department_id'+
                       ',modul_name,modul_id,update_user) VALUES '+
                       '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrDepartmentId+
                       ','+QuotedStr(StrModul)+','+QuotedStr(StrModulId)+','+QuotedStr(User)+');';
      end;
      if (IsComplete=True) then begin
        if (Trim(PONo.Text)<>'') then begin
          StrQry:=StrQry+' UPDATE wh_purchase_order SET complete=1 WHERE purchase_order_id='+QuotedStr(PONo.Text)+';';
        end;
        if (Trim(GTNNo.Text)<>'') then begin
          StrQry:=StrQry+' UPDATE wh_part_transfer SET complete=1 WHERE part_transfer_id='+QuotedStr(GTNNo.Text)+';';
        end;
      end;
      if IsOk then begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMessage:=E.Message;
          end;
        end;
      end;

      if IsOk then begin
        Main.TransCommit;
        if MessageBox(0,PChar('Penerimaan Barang/Jasa Berhasil Disimpan'+Chr(13)+Chr(13)+'             Mau Dicetak ?'),'Penerimaan Barang/Jasa',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
            Reprint(StrTransId);
        end;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Penerimaan Barang/Jasa Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Penerimaan Barang/Jasa',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TGoodReceiving.DisableInput;
begin
  PONo.Enabled:=False;
  GTNNo.Enabled:=False;
  PanelCari.Enabled:=False;
  IsInputGrid:=False;
  Remark.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TGoodReceiving.EnableInput;
begin
  PONo.Enabled:=True;
  GTNNo.Enabled:=True;
  PanelCari.Enabled:=True;
  IsInputGrid:=True;
  Remark.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TGoodReceiving.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      ppCompany.Caption:=Qry.FieldValues['company_name'];
      ppAddress.Lines.Add(Qry.FieldValues['address']);
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodReceiving.Reprint(GoodReceive_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Good Receive Note';
  RePrintForm.ReportId:=GoodReceive_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetGoodsReceiveResume  '+QuotedStr(GoodReceive_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppNo.Caption:=GoodReceive_Id;
        ppTanggal.Caption:=Qry.FieldValues['receive_dates'];
      end;
      Qry.Close;
      StrQry:='EXEC GetGoodsReceiveDetailPrint  '+QuotedStr(GoodReceive_id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;

procedure TGoodReceiving.UoMExit(Sender: TObject);
begin
  if Trim(UoM.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=UoM.Text;
  end;
  UoM.Visible := False;
  StrGrid.SetFocus;
end;

procedure TGoodReceiving.PONoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Trim(PONo.Text)<>'' then StrGrid.SetFocus else GTNNo.SetFocus;
end;

procedure TGoodReceiving.GTNNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then StrGrid.SetFocus;
end;

procedure TGoodReceiving.Button3Click(Sender: TObject);
begin
  Init;
  InitGrid;
  EnableInput;
end;

procedure TGoodReceiving.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (IntCol<4) and (StrGrid.Cells[1,IntRow]<>'') then begin
    GoodReceivingList:=TGoodReceivingList.Create(Self,StrGrid.Cells[8,IntRow]);
  end;
end;

procedure TGoodReceiving.CariGTNClick(Sender: TObject);
begin
  if Main.IsFormOpen('GoodTransferList')=False then GoodTransferList:=TGoodTransferList.Create(Self,'GoodReceiving')
  else MessageBox(0,PChar('Silahkan Tutup Jendela Transfer Barang dahulu'),'Penerimaan Barang',MB_OK or MB_ICONERROR);
end;

procedure TGoodReceiving.PriceUnitEnter(Sender: TObject);
begin
  if Trim(PriceUnit.Text)<>'' then PriceUnit.Text:=ToString(PriceUnit.Text);
end;

procedure TGoodReceiving.PriceUnitExit(Sender: TObject);
begin
  if Trim(PriceUnit.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=SToCurr(PriceUnit.Text);
    Calculate;
  end;
  PriceUnit.Visible := False;
  StrGrid.SetFocus;
end;

procedure TGoodReceiving.PriceUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    PriceUnitExit(nil);
  end;
  if (Key=#27) then begin
    PriceUnitExit(nil);
  end;

end;

end.
