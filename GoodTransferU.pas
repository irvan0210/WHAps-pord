unit GoodTransferU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit, Buttons, Grids,
  ZColorStringGrid, ComCtrls, ppParameter, ppStrtch, ppMemo, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB;

type
  TGoodTransfer = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    GroupOrigin: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    SBU: TComboBox;
    Location: TComboBox;
    GroupDest: TGroupBox;
    Bersihkan: TButton;
    Label9: TLabel;
    SBUDest: TComboBox;
    LocationDest: TComboBox;
    Label10: TLabel;
    Label12: TLabel;
    GroupDepartment: TPanel;
    Departement: TComboBox;
    Label13: TLabel;
    DepartementDest: TComboBox;
    GroupBox3: TGroupBox;
    Tanggal: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    MutasiNo: TEdit;
    GroupDetail: TGroupBox;
    Label17: TLabel;
    PanelCari: TPanel;
    Cari: TSpeedButton;
    Label19: TLabel;
    Remark: TMemo;
    Batal: TCheckBox;
    Qty: TEdit;
    Detail: TEdit;
    TanggalKirim: TDateTimePicker;
    Label1: TLabel;
    StrGridPBJ: TZColorStringGrid;
    Panel1: TPanel;
    PBJNo: TEdit;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    ppLabel11: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLogo: TppImage;
    ppTanggal: TppLabel;
    ppGudangAsal: TppLabel;
    ppGudangTujuan: TppLabel;
    ppLabel19: TppLabel;
    ppNMSNo: TppLabel;
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
    ppFooterBand1: TppFooterBand;
    ppLabel20: TppLabel;
    ppCatatan: TppMemo;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine3: TppLine;
    ppRequestorSign: TppLabel;
    ppParameterList1: TppParameterList;
    ppCompany: TppLabel;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppAddress: TppMemo;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    CetakUlang: TButton;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppTransQty: TppDBText;
    ppFinalQty: TppDBText;
    ppLine15: TppLine;
    ppPartDetailId: TppDBText;
    Complete: TCheckBox;
    StrGrid: TZColorStringGrid;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure PartDetailChange(Sender: TObject);
    procedure SBUDestChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure QtyEnter(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure DetailExit(Sender: TObject);
    procedure DetailKeyPress(Sender: TObject; var Key: Char);
    procedure CariClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure InitGridPBJ;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshLocationDest;
    procedure RefreshPart;
    procedure LoadData;
    procedure LoadDataPBJ;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure Calculate;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;GoodTransfer_Id:String='';IsRead_Only:Boolean=False);
    procedure GridCell(Str:String);
    procedure SetPBJNo(Str:String);
    procedure Reprint(GoodTransfer_id:String);
    { Public declarations }
  end;

var
  GoodTransfer: TGoodTransfer;
  CompanyArr,LocationArr,PartTypeArr,PartGroupArr,PartDetailArr,DepartementArr,InventoryArr:Array of TArrString7;
  CompanyDestArr,LocationDestArr,DepartementDestArr:Array of TArrString7;
  MinRowGrid,IntRow,IntCol,IntMaxRow:Integer;
  IsInputGrid:Boolean;
  GoodTransferId:String;

implementation

uses MainU, PartSelectFormU, ItemServiceRequestListU, RePrintFormU;

{$R *.dfm}

constructor TGoodTransfer.Create(AOwner:TComponent;GoodTransfer_Id:String='';IsRead_Only:Boolean=False);
begin
  GoodTransferId:=GoodTransfer_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;

procedure TGoodTransfer.Init;
begin
  IntMaxRow:=8;
  MinRowGrid:=1;
  IntRow:=0;
  IntCol:=0;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBUDest.Text:='';
  SBUDest.Items.Clear;
  SBUDest.ItemIndex:=-1;
  Departement.Text:='';
  Departement.Items.Clear;
  Departement.ItemIndex:=-1;
  DepartementDest.Text:='';
  DepartementDest.Items.Clear;
  DepartementDest.ItemIndex:=-1;
  MutasiNo.Text:='';
  PBJNo.Text:='';
  Tanggal.Text:='';
  TanggalKirim.Date:=Now();
  Batal.Checked:=False;
  Complete.Checked:=False;
end;

procedure TGoodTransfer.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,3,0);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=350;
  StrGrid.ColWidths[2]:=35;
  StrGrid.ColWidths[3]:=35;
  StrGrid.ColWidths[4]:=60;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=0;
  StrGrid.ColWidths[7]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Barang';
  StrGrid.Cells[2,0]:='Qty';
  StrGrid.Cells[4,0]:='Satuan';
  StrGrid.Cells[5,0]:='Keterangan';
  StrGrid.Cells[2,1]:='Stock';
  StrGrid.Cells[3,1]:='Trans';
  StrGrid.CellStyle[0,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[1,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[4,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[5,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 7 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
  StrGrid.CellStyle[0,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
end;

procedure TGoodTransfer.InitGridPBJ;
var IntCount:Integer;
begin
  StrGridPBJ.RowCount:=2;
  StrGridPBJ.ColWidths[0]:=20;
  StrGridPBJ.ColWidths[1]:=300;
  StrGridPBJ.ColWidths[2]:=60;
  StrGridPBJ.ColWidths[3]:=120;
  StrGridPBJ.Cells[0,0]:='No';
  StrGridPBJ.Cells[1,0]:='Barang/Jasa';
  StrGridPBJ.Cells[2,0]:='Jumlah';
  StrGridPBJ.Cells[3,0]:='Keterangan';
  StrGridPBJ.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridPBJ.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridPBJ.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGridPBJ.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 3 do begin
    StrGridPBJ.Cells[IntCount,1]:='';
    StrGridPBJ.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGridPBJ.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGridPBJ.CellStyle[2,1].HorizontalAlignment:=taCenter;
end;

procedure TGoodTransfer.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    SetLength(CompanyDestArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';

        CompanyDestArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyDestArr[IntCount][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount);
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_part_type WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartTypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartTypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
      PartTypeArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartementArr,Qry.RecordCount);
    SetLength(DepartementDestArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartementArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartementArr[IntCount][1]:=Qry.FieldValues['name'];
      DepartementDestArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartementDestArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  end;
  for IntCount:=0 to Length(DepartementArr)-1 do begin
    Departement.Items.Add(DepartementArr[IntCount][1]);
    if DepartementArr[IntCount][0]=DepartmentId then begin
      Departement.ItemIndex:=Departement.Items.IndexOf(DepartementArr[IntCount][1]);
    end;
  end;
  for IntCount:=0 to Length(CompanyDestArr)-1 do begin
    SBUDest.Items.Add(CompanyDestArr[IntCount][1]);
  end;
  for IntCount:=0 to Length(DepartementArr)-1 do begin
    DepartementDest.Items.Add(DepartementDestArr[IntCount][1]);
  end;
  Main.M_Normal;
  if CompanyArr[SBU.ItemIndex][0]='1' then GroupOrigin.Enabled:=True else GroupOrigin.Enabled:=False;
  RefreshLocation;
  RefreshLocationDest;
end;

procedure TGoodTransfer.RefreshLocation;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
  Location.Text:='';
  Location.Items.Clear;
  Location.ItemIndex:=-1;
  if SBU.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrQry:='EXEC GetLocation '+StrCompanyId+';';
      StrQry:='EXEC GetLocation '+CompanyId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(LocationArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
          LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
          LocationArr[IntCount][1]:=Qry.FieldValues['location'];
          Qry.Next;
          Inc(IntCount);
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(LocationArr)-1 do begin
      Location.Items.Add(LocationArr[IntCount][1]);
      if LocationArr[IntCount][0]=LocationId then Location.ItemIndex:= Location.Items.IndexOf(LocationArr[IntCount][1]);
    end;
    Main.M_Normal;
    LoadData;
  end;
end;

procedure TGoodTransfer.RefreshLocationDest;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
  LocationDest.Text:='';
  LocationDest.Items.Clear;
  LocationDest.ItemIndex:=-1;
  if SBUDest.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyDestArr[SBUDest.ItemIndex][0];
      StrQry:='EXEC GetLocation '+StrCompanyId+';';
      StrQry:='EXEC GetLocation '+CompanyId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(LocationDestArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        LocationDestArr[IntCount][0]:=Qry.FieldValues['location_id'];
        LocationDestArr[IntCount][1]:=Qry.FieldValues['location'];
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(LocationDestArr)-1 do
      LocationDest.Items.Add(LocationDestArr[IntCount][1]);
    Main.M_Normal;
  end;
end;

procedure TGoodTransfer.RefreshPart;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId,StrDepartmentId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
    StrLocationId:=LocationArr[Location.ItemIndex][0];
    StrDepartmentId:=DepartementArr[Departement.ItemIndex][0];
    StrQry:='EXEC GetInventoryResume '+StrCompanyId+','+StrLocationId+','+StrDepartmentId+',@NonInventory=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartDetailArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      while not(Qry.Eof) do begin
        PartDetailArr[IntCount][0]:=Qry.FieldValues['part_detail_id'];
        PartDetailArr[IntCount][1]:=Qry.FieldValues['name'];
        PartDetailArr[IntCount][2]:=Qry.FieldValues['total_qty'];
        PartDetailArr[IntCount][3]:=Qry.FieldValues['uom'];
        PartDetailArr[IntCount][4]:=Qry.FieldValues['average_price'];
        PartDetailArr[IntCount][5]:=Qry.FieldValues['uom_id'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodTransfer.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    StrCompanyId,StrLocationId,StrPartDetailId:String;
begin
  if (SBU.Text<>'') and (Location.Text<>'') then begin
    InitGrid;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      StrQry:='EXEC GetInventoryResume '+StrCompanyId+','+StrLocationId+','+QuotedStr(StrPartDetailId)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TGoodTransfer.RefreshGrid;
begin

end;

procedure TGoodTransfer.DisableInput;
begin
  GroupDetail.Enabled:=False;
  IsInputGrid:=False;
  Simpan.Enabled:=False;
end;

procedure TGoodTransfer.EnableInput;
begin
  GroupDetail.Enabled:=True;
  IsInputGrid:=True;
  Simpan.Enabled:=True;
end;


procedure TGoodTransfer.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TGoodTransfer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TGoodTransfer.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridPBJ;
  RefreshCombo;
end;

procedure TGoodTransfer.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  InitGridPBJ;
  RefreshPart;
  EnableInput;
end;

procedure TGoodTransfer.PartDetailChange(Sender: TObject);
begin
  LoadData;
end;

procedure TGoodTransfer.SBUDestChange(Sender: TObject);
begin
  RefreshLocationDest;
end;

procedure TGoodTransfer.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMessage,StrLocationId,StrCompanyId,StrDepartementId,StrPBJNo,StrTransId,StrCancel:String;
    StrPartDetailId,StrQty,StrRemark,StrLocationDestId,StrCompanyDestId,StrDepartementDestId,StrAvgPrice,StrUoMId:String;
    IntCount,IntCount2:Integer;
    IsOk,IsValid:Boolean;
begin
  IsValid:=True;
  IntCount2:=0;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[3,IntCount]<>'') then begin
      if (SToInt(StrGrid.Cells[3,IntCount])>SToInt(StrGrid.Cells[2,IntCount])) then IsValid:=False;
      if (StrGrid.Cells[2,IntCount])='0' then IsValid:=False;
      if (StrGrid.Cells[2,IntCount])<>'' then Inc(IntCount2);
    end else begin
      if (StrGrid.Cells[3,IntCount]='') AND (StrGrid.Cells[2,IntCount]<>'') then IsValid:=False
    end;
  end;
  if (IntCount2<1) then IsValid:=False;  
  if (SBUDest.Text<>'') AND (LocationDest.Text<>'') AND (DepartementDest.Text<>'') AND (IsValid) then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrDepartementId:=DepartementArr[Departement.ItemIndex][0];
      StrLocationDestId:=LocationDestArr[LocationDest.ItemIndex][0];
      StrCompanyDestId:=CompanyDestArr[SBUDest.ItemIndex][0];
      StrDepartementDestId:=DepartementDestArr[DepartementDest.ItemIndex][0];
      if Trim(PBJNo.Text)<>'' then StrPBJNo:=QuotedStr(Trim(PBJNo.Text)) else StrPBJNo:='NULL';
      if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text) else StrRemark:='NULL';
      if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
      if MutasiNo.Text='' then begin
        StrQry:='SELECT RIGHT(MAX(part_transfer_id),4) AS part_transfer_id FROM wh_part_transfer '+
                'WHERE part_transfer_id  LIKE '+Chr(39)+'GTN'+CompanyCode+LocationCode+DepartmentCode+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['part_transfer_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['part_transfer_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='GTN'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_part_transfer (part_transfer_id,item_request_id,transfer_date,delivery_date'+
                ',company_id,location_id,department_id,delivery_company_id,delivery_location_id'+
                ',delivery_department_id,description,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrPBJNo+',GETDATE(),'+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalKirim.Date))+
                ','+StrCompanyId+','+StrLocationId+','+StrDepartementId+','+StrCompanyDestId+','+StrLocationDestId+
                ','+StrDepartementId+','+StrRemark+','+QuotedStr(User)+');';
        if Complete.Checked then begin
          StrQry:=StrQry+' UPDATE wh_item_request SET complete2=1 WHERE item_request_id='+StrPBJNo+';';
        end;
      end else begin
        StrTransId:=MutasiNo.Text;
        StrQry:='UPDATE wh_part_transfer SET item_request_id='+StrPBJNo+',delivery_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalKirim.Date))+
                ',delivery_company_id='+StrCompanyDestId+',delivery_location_id='+StrLocationDestId+
                ',delivery_department_id='+StrDepartementId+',description='+StrRemark+',cancel='+StrCancel+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE part_transfer_id='+QuotedStr(StrTransId)+';';
        if Complete.Checked then begin
          StrQry:=StrQry+' UPDATE wh_item_request SET complete2=1 WHERE item_request_id='+StrPBJNo+';';
        end;
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        except on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      StrQry:='';
      for IntCount:=2 to StrGrid.RowCount-1 do begin
        StrPartDetailId:='';
        for IntCount2:=0 to Length(PartDetailArr)-1 do begin
          if PartDetailArr[IntCount2][1]=StrGrid.Cells[1,IntCount] then StrPartDetailId:=PartDetailArr[IntCount2][0];
        end;
        if StrGrid.Cells[1,IntCount]<>'' then begin
          StrQty:=StrGrid.Cells[3,IntCount];
          StrAvgPrice:=StrGrid.Cells[6,IntCount];
          StrUomId:=StrGrid.Cells[7,IntCount];
          StrQry:=StrQry+' INSERT INTO wh_part_transfer_detail (part_transfer_id,part_detail_id,quantity,uom_id'+
                  ',average_price,update_user) VALUES '+
                  '('+QuotedStr(StrTransId)+','+QuotedStr(StrPartDetailId)+','+StrQty+','+StrUomId+','+StrAvgPrice+
                  ','+QuotedStr(User)+');';
          StrQry:=StrQry+' INSERT INTO wh_part_inventory (company_id,location_id,department_id,part_detail_id,quantity'+
                  ',uom_id,average_price,transaction_date,update_user) '+
                  'VALUES ('+StrCompanyId+','+StrLocationId+','+StrDepartementId+','+QuotedStr(StrPartDetailId)+
                  ','+IntToStr(0-StrToInt(StrQty))+','+StrUomId+','+StrAvgPrice+',GETDATE()'+
                  ','+QuotedStr(User)+');';
        end;
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
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
        MutasiNo.Text:=StrTransId;
        Tanggal.Text:=Main.WhatDate;
        if StrCancel<>'1' then
        if MessageBox(0,PChar('Transfer Barang berhasil'+Chr(13)+Chr(13)+'Mau cetak Nota ?'),'Transfer Barang',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
            Reprint(StrTransId);
        end;
      end else begin
        EnableInput;
        Main.TransRollback;
        MessageBox(0,PChar('Transfer Barang Gagal'+Chr(13)+Chr(13)+StrEMessage),'Transfer Barang',MB_OK or MB_ICONERROR);
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else
    MessageBox(0,PChar('Silahkan Masukkan Tujuan Transfer'+Chr(13)+Chr(13)+'Periksa Jumlah barang Transfer'),'Transfer Barang',MB_OK or MB_ICONWARNING);
end;

procedure TGoodTransfer.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if IsInputGrid AND (Trim(PBJNo.Text)<>'') then begin
    if (ACol = 1) and (ARow > MinRowGrid)  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      PartSelectForm:=TPartSelectForm.Create(Self,StrGrid.Cells[ACol,ARow],'GoodTransfer',CompanyId,LocationId,DepartmentId);
      PartSelectForm.Left:=R.Left+Left+5;
      PartSelectForm.Top:=R.Top+Top+20;
    end;
    if (ACol = 3) and (ARow > MinRowGrid) then begin
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
    if (ACol = 5) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Detail do begin
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

procedure TGoodTransfer.GridCell(Str:String);
var IntCount:Integer;
begin
  RefreshPart;
  for IntCount:=0 to Length(PartDetailArr)-1 do
    if Str=PartDetailArr[IntCount][0] then begin
      StrGrid.Cells[1,IntRow]:=PartDetailArr[IntCount][1];
      StrGrid.Cells[2,IntRow]:=PartDetailArr[IntCount][2];
      StrGrid.Cells[4,IntRow]:=PartDetailArr[IntCount][3];
      StrGrid.Cells[6,IntRow]:=PartDetailArr[IntCount][4];
      StrGrid.Cells[7,IntRow]:=PartDetailArr[IntCount][5];
    end;
end;

procedure TGoodTransfer.Calculate;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do
    if (Trim(StrGrid.Cells[1,IntCount])<>'')  and (Trim(StrGrid.Cells[2,IntCount])<>'') and (Trim(StrGrid.Cells[3,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
    end else
      StrGrid.Cells[0,IntCount]:='';
end;

procedure TGoodTransfer.QtyEnter(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then Qty.Text:=ToString(Qty.Text);
end;

procedure TGoodTransfer.QtyExit(Sender: TObject);
var IsOk:Boolean;
begin
  IsOk:=True;
  if Trim(Qty.Text)<>'' then begin
    StrGrid.Cells[3,IntRow]:=SToCurr(Qty.Text);
    Calculate;
    if (StrToInt(StrGrid.Cells[3,IntRow])>StrToInt(StrGrid.Cells[2,IntRow])) then begin
      MessageBox(0,'Jumlah Quantity tidak boleh lebih besar dari Stock','Mutasi Stock',MB_OK or MB_ICONERROR);
      Qty.Text:=StrGrid.Cells[3,IntRow];
      Qty.SetFocus;
      IsOk:=False;
    end
  end;
  if IsOk then begin
    Qty.Visible:=False;
    StrGrid.SetFocus;
  end
end;

procedure TGoodTransfer.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
  end;
  StrGrid.Col:=3;
end;

procedure TGoodTransfer.DetailExit(Sender: TObject);
begin
  if Trim(Detail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=Detail.Text;
    Calculate;
  end;
  Detail.Text:='';
  Detail.Visible := False;
  StrGrid.SetFocus;
end;

procedure TGoodTransfer.DetailKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    DetailExit(nil);
    if (StrGrid.Row=StrGrid.RowCount-1) AND (StrGrid.RowCount<=IntMaxRow)  then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[3,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:=1;
  end;
  if (Key=#27) then begin
    DetailExit(nil);
  end;
end;

procedure TGoodTransfer.SetPBJNo(Str:String);
begin
  PBJNo.Text:=Str;
  LoadDataPBJ;
end;

procedure TGoodTransfer.LoadDataPBJ;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetItemRequestDetail '+QuotedStr(Trim(PBJNo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      StrGridPBJ.RowCount:=Qry.RecordCount+1;
      while not(Qry.Eof) do begin
        StrGridPBJ.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        StrGridPBJ.Cells[1,IntCount+1]:=Qry.FieldValues['item_detail'];
        StrGridPBJ.Cells[2,IntCount+1]:=Qry.FieldValues['quantity'];
        if Qry.FieldValues['detail']<>NULL then StrGridPBJ.Cells[3,IntCount+1]:=Qry.FieldValues['detail']
        else StrGridPBJ.Cells[3,IntCount+1]:='';
        StrGridPBJ.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
        StrGridPBJ.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
        Inc(IntCount);
        Qry.Next;
      end;
      Complete.Checked:=True;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodTransfer.PreparePrint;
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

procedure TGoodTransfer.Reprint(GoodTransfer_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Good Transfer Note';
  RePrintForm.ReportId:=GoodTransfer_id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetGoodsTransferResume  '+QuotedStr(GoodTransfer_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppNMSNo.Caption:=GoodTransfer_Id;
        ppTanggal.Caption:=Qry.FieldValues['transfer_dates'];
        ppGudangAsal.Caption:=Qry.FieldValues['company_name']+' '+Qry.FieldValues['location'];
        ppGudangTujuan.Caption:=Qry.FieldValues['to_company_name']+' '+Qry.FieldValues['to_location'];
        ppRequestorSign.Caption:=Qry.FieldValues['user_name'];
        if Qry.FieldValues['description']<>NULL then ppCatatan.Caption:=Qry.FieldValues['description']
        else ppCatatan.Caption:='';
      end;
      Qry.Close;
      StrQry:='EXEC GetGoodsTransferDetailPrint  '+QuotedStr(GoodTransfer_id)+';';
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

procedure TGoodTransfer.CariClick(Sender: TObject);
begin
  ItemServiceRequestList:=TItemServiceRequestList.Create(Self,'GoodTransfer','',DepartmentId);
end;

procedure TGoodTransfer.CetakUlangClick(Sender: TObject);
begin
  Reprint(''); 
end;

end.
