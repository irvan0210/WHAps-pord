unit GoodAssignmentU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, WHUnit, Buttons, Grids,
  ZColorStringGrid, ComCtrls, ppParameter, ppStrtch, ppMemo, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB;

type
  TGoodAssignment = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    GroupOrigin: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    SBU: TComboBox;
    Location: TComboBox;
    Bersihkan: TButton;
    Label12: TLabel;
    GroupDepartment: TPanel;
    Departement: TComboBox;
    StrGrid: TZColorStringGrid;
    GroupBox3: TGroupBox;
    Tanggal: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    MutasiNo: TEdit;
    GroupDetail: TGroupBox;
    Label17: TLabel;
    PanelCariPBJ: TPanel;
    CariPBJ: TSpeedButton;
    Label19: TLabel;
    Remark: TMemo;
    Batal: TCheckBox;
    Qty: TEdit;
    Detail: TEdit;
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
    ppTipeKendaraan: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel19: TppLabel;
    ppNPBNo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppPartDetailName: TppDBText;
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
    Label2: TLabel;
    Panel2: TPanel;
    PKBNo: TEdit;
    ppLine16: TppLine;
    ppLine18: TppLine;
    GroupDetailPKB: TGroupBox;
    Label3: TLabel;
    TanggalPKB: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    BodyId: TEdit;
    Label8: TLabel;
    KMOdo: TEdit;
    GeneralRepair: TCheckBox;
    BodyRepair: TCheckBox;
    Insurance: TCheckBox;
    Complete: TCheckBox;
    StrGridPKB: TZColorStringGrid;
    PanelCariPKB: TPanel;
    CariPKB: TSpeedButton;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppReferenceNo: TppLabel;
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
    procedure CariPBJClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure CariPKBClick(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure InitGridPBJ;
    procedure InitGridPKB;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshLocationDest;
    procedure RefreshPart;
    procedure LoadData;
    procedure LoadDataPBJ;
    procedure LoadDataPKB;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure Calculate;
    procedure SetFooter(Int:Integer);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;GoodAssignment_Id:String='';IsRead_Only:Boolean=False);
    procedure GridCell(Str:String);
    procedure SetPBJNo(Str:String);
    procedure SetPKBNo(Str:String);
    procedure Reprint(GoodAssignment_id:String);
    { Public declarations }
  end;

var
  GoodAssignment: TGoodAssignment;
  CompanyArr,LocationArr,PartDetailArr,DepartementArr,InventoryArr:Array of TArrString7;
  CompanyDestArr,LocationDestArr,DepartementDestArr:Array of TArrString7;
  MinRowGrid,IntRow,IntCol,IntMaxRow,SelectFormTop:Integer;
  IsInputGrid:Boolean;
  GoodAssignmentId:String;

implementation

uses MainU, PartSelectFormU, ItemServiceRequestListU, RePrintFormU,
  WorkOrderListU;

{$R *.dfm}

constructor TGoodAssignment.Create(AOwner:TComponent;GoodAssignment_Id:String='';IsRead_Only:Boolean=False);
begin
  GoodAssignmentId:=GoodAssignment_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;

procedure TGoodAssignment.Init;
begin
  SelectFormTop:=120;
  IntMaxRow:=8;
  MinRowGrid:=1;
  IntRow:=0;
  IntCol:=0;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Departement.Text:='';
  Departement.Items.Clear;
  Departement.ItemIndex:=-1;
  MutasiNo.Text:='';
  PBJNo.Text:='';
  PKBNo.Text:='';
  Tanggal.Text:='';
  Batal.Checked:=False;
  Complete.Checked:=False;
  TanggalPKB.Text:='';
  BodyId.Text:='';
  KMOdo.Text:='';
  GeneralRepair.Checked:=False;
  BodyRepair.Checked:=False;
  Insurance.Checked:=False;
  StrGridPBJ.Visible:=False;
  GroupDetail.Enabled:=True;
  GroupDetailPKB.Visible:=False;
  StrGridPKB.Visible:=False;
  if ClientHeight>347 then SetFooter(-(StrGridPBJ.Height+10));
//  ClientHeight:=386;
  PanelCariPBJ.Enabled:=True;
  PanelCariPKB.Enabled:=True;
//  Top:=Round((Main.ClientHeight-(ClientHeight+StrGridPBJ.Height+10))/2);
  ppLabel5.Caption:='Tipe Kendaraan';
  ppLabel6.Caption:='No Polisi';
  ppLabel11.Caption:=':';
  ppLabel12.Caption:=':';
end;

procedure TGoodAssignment.InitGrid;
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

procedure TGoodAssignment.InitGridPBJ;
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

procedure TGoodAssignment.InitGridPKB;
var IntCount:Integer;
begin
  StrGridPKB.RowCount:=2;
  StrGridPKB.ColWidths[0]:=20;
  StrGridPKB.ColWidths[1]:=200;
  StrGridPKB.ColWidths[2]:=20;
  StrGridPKB.ColWidths[3]:=200;
  StrGridPKB.ColWidths[4]:=120;
  StrGridPKB.Cells[0,0]:='No';
  StrGridPKB.Cells[1,0]:='Keluhan';
  StrGridPKB.Cells[2,0]:='No';
  StrGridPKB.Cells[3,0]:='Pekerjaan';
  StrGridPKB.Cells[4,0]:='Teknisi';
  StrGridPKB.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGridPKB.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGridPKB.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGridPKB.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGridPKB.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 4 do begin
    StrGridPKB.Cells[IntCount,1]:='';
    StrGridPKB.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGridPKB.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGridPKB.CellStyle[2,1].HorizontalAlignment:=taCenter;
end;

procedure TGoodAssignment.RefreshCombo;
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
        CompanyArr[IntCount][1]:=Qry.FieldValues['name'];
        CompanyDestArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyDestArr[IntCount][1]:=Qry.FieldValues['name'];
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
  Main.M_Normal;
  if CompanyArr[SBU.ItemIndex][0]='1' then GroupOrigin.Enabled:=True else GroupOrigin.Enabled:=False;
  RefreshLocation;
  RefreshLocationDest;
end;

procedure TGoodAssignment.RefreshLocation;
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

procedure TGoodAssignment.RefreshLocationDest;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
{  LocationDest.Text:='';
  LocationDest.Items.Clear;
  LocationDest.ItemIndex:=-1;
  if SBUDest.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyDestArr[SBUDest.ItemIndex][0];
      StrQry:='EXEC GetLocation '+StrCompanyId+';';
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
    LoadData;
  end;
}
end;

procedure TGoodAssignment.RefreshPart;
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

procedure TGoodAssignment.LoadData;
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
{      SetLength(InventoryArr,Qry.RecordCount);
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        QtyTotal.Text:=Qry.FieldValues['total_qty'];
        AveragePrice.Text:=Qry.FieldValues['average_price'];
        UoMId.Text:=Qry.FieldValues['uom_id'];
        UoMTotal.Text:=Qry.FieldValues['uom'];
        UoMTransfer.Text:=Qry.FieldValues['uom'];
        Qry.Next;
      end;
}
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TGoodAssignment.RefreshGrid;
begin

end;

procedure TGoodAssignment.DisableInput;
begin
  GroupDetail.Enabled:=False;
  IsInputGrid:=False;
  Simpan.Enabled:=False;
end;

procedure TGoodAssignment.EnableInput;
begin
  GroupDetail.Enabled:=False;
  IsInputGrid:=True;
  Simpan.Enabled:=False;
end;


procedure TGoodAssignment.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TGoodAssignment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TGoodAssignment.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  InitGridPBJ;
  InitGridPKB;
  RefreshCombo;
end;

procedure TGoodAssignment.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshPart;
end;

procedure TGoodAssignment.PartDetailChange(Sender: TObject);
begin
  LoadData;
end;

procedure TGoodAssignment.SBUDestChange(Sender: TObject);
begin
  RefreshLocationDest;
end;

procedure TGoodAssignment.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMessage,StrLocationId,StrCompanyId,StrDepartementId,StrPBJNo,StrPKBNo,StrTransId,StrCancel:String;
    StrPartDetailId,StrQty,StrRemark,StrRemarkDetail,StrAvgPrice,StrUomId:String;
    IntCount,IntCount2:Integer;
    IsOk,IsValid:Boolean;
begin
  IsValid:=True;
  for IntCount:=2 to StrGrid.RowCount-1 do begin
    if (StrGrid.Cells[3,IntCount]<>'') then begin
      if (SToInt(StrGrid.Cells[3,IntCount])>SToInt(StrGrid.Cells[2,IntCount])) then IsValid:=False;
      if (StrGrid.Cells[2,IntCount])='0' then IsValid:=False; 
    end else begin
      if (StrGrid.Cells[3,IntCount]='') AND (StrGrid.Cells[2,IntCount]<>'') then IsValid:=False
    end;
  end;
  if (SBU.Text<>'') AND (Location.Text<>'') AND (Departement.Text<>'') AND ( (Trim(PBJNo.Text)<>'') OR (Trim(PKBNo.Text)<>'')) AND (IsValid)  then begin
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
      if Trim(PBJNo.Text)<>'' then StrPBJNo:=QuotedStr(Trim(PBJNo.Text)) else StrPBJNo:='NULL';
      if Trim(PKBNo.Text)<>'' then StrPKBNo:=QuotedStr(Trim(PKBNo.Text)) else StrPKBNo:='NULL';
      if Trim(Remark.Text)<>'' then StrRemark:=QuotedStr(Remark.Text) else StrRemark:='NULL';
      if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
      if (MutasiNo.Text='')  then begin
        StrQry:='SELECT RIGHT(MAX(part_allocation_id),4) AS part_allocation_id FROM wh_part_allocation '+
                'WHERE part_allocation_id  LIKE '+Chr(39)+'GAN'+CompanyCode+LocationCode+DepartmentCode+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['part_allocation_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['part_allocation_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='GAN'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_part_allocation (part_allocation_id,item_request_id,work_order_id,allocation_date'+
                ',company_id,location_id,department_id,description,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrPBJNo+','+StrPKBNo+',GETDATE()'+
                ','+StrCompanyId+','+StrLocationId+','+StrDepartementId+','+StrRemark+','+QuotedStr(User)+');';
        if StrPBJNo<>'' then begin
          if Complete.Checked then begin
            StrQry:=StrQry+' UPDATE wh_item_request SET complete2=1 WHERE item_request_id='+StrPBJNo+';';
          end;
        end;
      end else begin
        StrTransId:=MutasiNo.Text;
        StrQry:='UPDATE wh_part_allocation SET item_request_id='+StrPBJNo+',work_order_id='+StrPKBNo+
                ',description='+StrRemark+',cancel='+StrCancel+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE part_allocation_id='+QuotedStr(StrTransId)+';';
        if StrPBJNo<>'' then begin
          if Complete.Checked then begin
            StrQry:=StrQry+' UPDATE wh_item_request SET complete2=1 WHERE item_request_id='+StrPBJNo+';';
          end;
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
          StrRemarkDetail:=StrGrid.Cells[5,IntCount];
          StrAvgPrice:=StrGrid.Cells[6,IntCount];
          StrUomId:=StrGrid.Cells[7,IntCount];
          StrQry:=StrQry+' INSERT INTO wh_part_allocation_detail (part_allocation_id,part_detail_id,quantity,uom_id'+
                  ',average_price,detail,update_user) VALUES '+
                  '('+QuotedStr(StrTransId)+','+QuotedStr(StrPartDetailId)+','+StrQty+','+StrUomId+','+StrAvgPrice+
                  ','+QuotedStr(StrRemarkDetail)+','+QuotedStr(User)+');';
          StrQry:=StrQry+' INSERT INTO wh_part_inventory (company_id,location_id,department_id,part_detail_id,quantity'+
                  ',uom_id,average_price,transaction_date,update_user) '+
                  'VALUES ('+StrCompanyId+','+StrLocationId+','+StrDepartementId+','+QuotedStr(StrPartDetailId)+','+IntToStr(0-StrToInt(StrQty))+
                  ','+StrUomId+','+StrAvgPrice+',GETDATE(),'+QuotedStr(User)+');';
        end;
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        except on E:Exception do begin
          IsOk:=False;
          StrEMessage:=StrEMessage+E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MutasiNo.Text:=StrTransId;
        Tanggal.Text:=Main.WhatDate;
        if StrCancel<>'1' then
          if MessageBox(0,PChar('Alokasi Barang berhasil'+Chr(13)+Chr(13)+'   Mau Dicetak ?'),'Alokasi Barang',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
            Reprint(StrTransId);
          end;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Alokasi Barang Gagal'+Chr(13)+Chr(13)+StrEMessage),'Alokasi Barang',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end else begin
    if IsValid=False then MessageBox(0,PChar('   Alokasi Barang Gagal'+Chr(13)+Chr(13)+'Periksa Jumlah Barang yang dialokasi'),'Alokasi Barang',MB_OK or MB_ICONERROR);
  end;
end;

procedure TGoodAssignment.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInputGrid) AND ((PKBNo.Text<>'') OR (PBJNo.Text<>''))  then begin
    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      PartSelectForm:=TPartSelectForm.Create(Self,StrGrid.Cells[ACol,ARow],'GoodAssignment',CompanyId,LocationId,DepartmentId);
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
        //if Trim(StrGrid.Cells[ACol,ARow])<>'' then
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
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
  end;
end;

procedure TGoodAssignment.GridCell(Str:String);
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

procedure TGoodAssignment.Calculate;
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

procedure TGoodAssignment.QtyEnter(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then Qty.Text:=ToString(Qty.Text);
end;

procedure TGoodAssignment.QtyExit(Sender: TObject);
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

procedure TGoodAssignment.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    QtyExit(nil);
  end;
  StrGrid.Col:=3;
end;

procedure TGoodAssignment.DetailExit(Sender: TObject);
begin
  if Trim(Detail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=Detail.Text;
    Calculate;
  end;
  Detail.Text:='';
  Detail.Visible := False;
  StrGrid.SetFocus;
end;

procedure TGoodAssignment.DetailKeyPress(Sender: TObject; var Key: Char);
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

procedure TGoodAssignment.SetPBJNo(Str:String);
begin
  PBJNo.Text:=Str;
  LoadDataPBJ;
end;

procedure TGoodAssignment.LoadDataPBJ;
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
    StrGridPBJ.Visible:=True;
    SetFooter(StrGridPBJ.Height+10);
    PanelCariPKB.Enabled:=False; 
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodAssignment.SetPKBNo(Str:String);
begin
  PKBNo.Text:=Str;
  LoadDataPKB;
end;

procedure TGoodAssignment.LoadDataPKB;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderResume '+QuotedStr(Trim(PKBNo.Text))+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TanggalPKB.Text:=Qry.FieldValues['date_in'];
      BodyId.Text:=Qry.FieldValues['body_id'];
      KMOdo.Text:=SToCurr(Qry.FieldValues['odo_in']);
      if Qry.FieldValues['general_repair']='1' then GeneralRepair.Checked:=True;
      if Qry.FieldValues['body_repair']='1' then BodyRepair.Checked:=True;
      if Qry.FieldValues['insurance']='1' then Insurance.Checked:=True;
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(Trim(PKBNo.Text))+',1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      if IntCount>StrGridPKB.RowCount-1 then StrGridPKB.RowCount:=StrGridPKB.RowCount+1;
      while not(Qry.Eof) do begin
        StrGridPKB.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
        StrGridPKB.Cells[1,IntCount+1]:=Qry.FieldValues['description'];
        StrGridPKB.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(Trim(PKBNo.Text))+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      if IntCount>StrGridPKB.RowCount-1 then StrGridPKB.RowCount:=StrGridPKB.RowCount+1;
      while not(Qry.Eof) do begin
        StrGridPKB.Cells[2,IntCount+1]:=IntToStr(IntCount+1);
        StrGridPKB.Cells[3,IntCount+1]:=Qry.FieldValues['description'];
        StrGridPKB.CellStyle[2,IntCount+1].HorizontalAlignment:=taCenter;
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    GroupDetailPKB.Visible:=True;
    StrGridPKB.Visible:=True;
    SetFooter(GroupDetailPKB.Height+StrGridPKB.Height+10);
    PanelCariPBJ.Enabled:=False;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TGoodAssignment.SetFooter(Int:Integer);
begin
  StrGrid.Top:=StrGrid.Top+Int;
  SelectFormTop:=SelectFormTop+Int;
  ClientHeight:=ClientHeight+Int;
end;

procedure TGoodAssignment.PreparePrint;
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

procedure TGoodAssignment.Reprint(GoodAssignment_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='Good Allocation Note';
  RePrintForm.ReportId:=GoodAssignment_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetPartAllocationResume  '+QuotedStr(GoodAssignment_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        ppTanggal.Caption:=Qry.FieldValues['allocation_dates'];
        ppNPBNo.Caption:=Qry.FieldValues['part_allocation_id'];
        if Qry.FieldValues['item_request_id']<>NULL then ppReferenceNo.Caption:=Qry.FieldValues['item_request_id']
        else if Qry.FieldValues['work_order_id']<>NULL then ppReferenceNo.Caption:=Qry.FieldValues['work_order_id'];
        if Qry.FieldValues['license_plate']<>NULL then begin
          ppTipeKendaraan.Caption:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
          ppNoPolisi.Caption:=Qry.FieldValues['license_plate'];
        end else begin
          ppLabel5.Caption:='';
          ppLabel6.Caption:='';
          ppLabel11.Caption:='';
          ppLabel12.Caption:='';
          ppTipeKendaraan.Caption:='';
          ppNo.Caption:='';
        end;
        ppRequestorSign.Caption:=Qry.FieldValues['user_name'];
        if Qry.FieldValues['description']<>NULL then ppCatatan.Caption:=Qry.FieldValues['description']
        else ppCatatan.Caption:='';
      end;
      Qry.Close;
      StrQry:='EXEC GetPartAllocationDetailPrint  '+QuotedStr(GoodAssignment_Id)+';';
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

procedure TGoodAssignment.CariPBJClick(Sender: TObject);
begin
  ItemServiceRequestList:=TItemServiceRequestList.Create(Self,'GoodAssignment','',DepartmentId);
end;

procedure TGoodAssignment.CetakUlangClick(Sender: TObject);
begin
  Reprint(MutasiNo.Text);
end;

procedure TGoodAssignment.CariPKBClick(Sender: TObject);
begin
  WorkOrderList:=TWorkOrderList.Create(Self,'GoodAssignment','');
end;

end.
