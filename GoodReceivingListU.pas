unit GoodReceivingListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, ExtCtrls,
  Buttons;

type
  TGoodReceivingList = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PartType: TComboBox;
    PartGroup: TComboBox;
    PartDetail: TComboBox;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    SBU: TComboBox;
    Location: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Bulan: TComboBox;
    Tahun: TEdit;
    Lihat: TButton;
    Label8: TLabel;
    GroupDepartment: TPanel;
    Departement: TComboBox;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure SBUChange(Sender: TObject);
    procedure PartTypeChange(Sender: TObject);
    procedure PartGroupChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure PartDetailChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshPartGroup;
    procedure RefreshPartDetail;
    procedure LoadData;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
    procedure SetPartDetailId(Part_Detail_Id:String);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Part_Detail_Id:String='';IsRead_Only:Boolean=False);Overload;
    { Public declarations }
  end;

var
  GoodReceivingList: TGoodReceivingList;
  IntRow,IntCol:Integer;
  PartDetailId:String;
  IsInputGrid:Boolean;
  CompanyArr,LocationArr,DepartementArr,PartTypeArr,PartGroupArr,PartDetailArr,InventoryArr:Array of TArrString7;

implementation

uses MainU;

{$R *.dfm}

constructor TGoodReceivingList.Create(AOwner:TComponent;Part_Detail_Id:String='';IsRead_Only:Boolean=False);
begin
  PartDetailId:=Part_Detail_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;

procedure TGoodReceivingList.Init;
begin
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  PartType.Text:='';
  PartType.Items.Clear;
  PartType.ItemIndex:=-1;
  Departement.Text:='';
  Departement.Items.Clear;
  Departement.ItemIndex:=-1;
end;

procedure TGoodReceivingList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=40;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=80;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='PO #';
  StrGrid.Cells[2,0]:='Tgl Diterima';
  StrGrid.Cells[3,0]:='Vendor';
  StrGrid.Cells[4,0]:='Qty';
  StrGrid.Cells[5,0]:='Harga Satuan';
  StrGrid.Cells[6,0]:='Harga Rata2';
  StrGrid.Cells[7,0]:='Satuan';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 6 do
    StrGrid.Cells[IntCount,1]:='';
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
end;

procedure TGoodReceivingList.RefreshCombo;
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
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_part_type WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartTypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        PartTypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
        PartTypeArr[IntCount][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartementArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      while not(Qry.Eof) do begin
        DepartementArr[IntCount][0]:=Qry.FieldValues['department_id'];
        DepartementArr[IntCount][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  end;
  for IntCount:=0 to Length(PartTypeArr)-1 do
    PartType.Items.Add(PartTypeArr[IntCount][1]);
  for IntCount:=0 to Length(DepartementArr)-1 do begin
    Departement.Items.Add(DepartementArr[IntCount][1]);
    if DepartementArr[IntCount][0]=DepartmentId then Departement.ItemIndex:=Departement.Items.IndexOf(DepartementArr[IntCount][1]);    
  end;
  for IntCount:=1 to 12 do Bulan.Items.Add(LongMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(LongMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
  if CompanyArr[SBU.ItemIndex][0]='1' then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
  Departement.Enabled:=False;
  RefreshLocation;
end;

procedure TGoodReceivingList.RefreshLocation;
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
      if Qry.RecordCount>0 then begin
        IntCount:=0;
        while not(Qry.Eof) do begin
          LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
          LocationArr[IntCount][1]:=Qry.FieldValues['location'];
          Qry.Next;
          Inc(IntCount);
        end;
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

procedure TGoodReceivingList.RefreshPartGroup;
var Qry:TADOQuery;
    StrQry,StrPartType:String;
    IntCount:Integer;
begin
  PartGroup.Text:='';
  PartGroup.Items.Clear;
  PartGroup.ItemIndex:=-1;
  if (PartType.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrPartType:=PartTypeArr[PartType.ItemIndex][0];
      StrQry:='SELECT * FROM wh_part_group WHERE part_type_id='+QuotedStr(StrPartType)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(PartGroupArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PartGroupArr[IntCount][0]:=Qry.FieldValues['part_group_id'];
        PartGroupArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(PartGroupArr)-1  do
      PartGroup.Items.Add(PartGroupArr[IntCount][1]);
    Main.M_Normal;
  end;
end;

procedure TGoodReceivingList.RefreshPartDetail;
var Qry:TADOQuery;
    StrQry,StrPartGroup:String;
    IntCount:Integer;
begin
  PartDetail.Text:='';
  PartDetail.Items.Clear;
  PartDetail.ItemIndex:=-1;
  if (PartGroup.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrPartGroup:=PartGroupArr[PartGroup.ItemIndex][0];
      StrQry:='SELECT * FROM wh_part_detail WHERE part_group_id='+QuotedStr(StrPartGroup)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(PartDetailArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PartDetailArr[IntCount][0]:=Qry.FieldValues['part_detail_id'];
        PartDetailArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(PartDetailArr)-1  do
      PartDetail.Items.Add(PartDetailArr[IntCount][1]);
    Main.M_Normal;
  end;
end;

procedure TGoodReceivingList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId,StrLocationId,StrPartDetailId,AwalBulan,StrTahun,StrDepartmentId :String;
begin
  if (SBU.Text<>'') and (Location.Text<>'') and (PartType.Text<>'') and (PartGroup.Text<>'')
  and (PartDetail.Text<>'') and (Bulan.Text<>'') and (Tahun.Text<>'') then begin
    InitGrid;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      AwalBulan:='01/'+Bulan.Text+'/'+Tahun.Text;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      StrPartDetailId:=PartDetailArr[PartDetail.ItemIndex][0];
      StrDepartmentId:=DepartementArr[Departement.ItemIndex][0];
      StrQry:='EXEC GetReceivingDetail '+StrCompanyId+','+StrLocationId+','+QuotedStr(StrPartDetailId)+','+
              QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan) ))+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(InventoryArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        InventoryArr[IntCount][0]:=Qry.FieldValues['no'];
        InventoryArr[IntCount][1]:=Qry.FieldValues['purchase_order_id'];
        InventoryArr[IntCount][2]:=Qry.FieldValues['transaction_dates'];
        InventoryArr[IntCount][3]:=Qry.FieldValues['vendor_name'];
        InventoryArr[IntCount][4]:=Qry.FieldValues['quantity'];
        InventoryArr[IntCount][5]:=SToCurr(Qry.FieldValues['average_price']);
        InventoryArr[IntCount][6]:=SToCurr(Qry.FieldValues['price_unit']);
        InventoryArr[IntCount][7]:=Qry.FieldValues['uom'];
        Inc(IntCount);
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
    RefreshGrid;
  end;
end;

procedure TGoodReceivingList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(InventoryArr)>0 then StrGrid.RowCount:=Length(InventoryArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(InventoryArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=InventoryArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=InventoryArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=InventoryArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=InventoryArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=InventoryArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=InventoryArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=InventoryArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=InventoryArr[IntCount][7];
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TGoodReceivingList.SetPartDetailId(Part_Detail_Id:String);
var Qry:TADOQuery;
    StrQry,StrPartType,StrPartGroup,StrPartDetail:String;
    IntCount:Integer;
begin
  if Part_Detail_Id<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrQry:='SELECT a.name AS detail_name,b.name AS group_name,c.name AS type_name FROM wh_part_detail a'+
              ' LEFT JOIN wh_part_group b ON b.part_group_id=a.part_group_id '+
              ' LEFT JOIN wh_part_type c ON c.part_type_id=b.part_type_id '+
              ' WHERE part_detail_id='+QuotedStr(Part_Detail_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(PartDetailArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        StrPartType:=Qry.FieldValues['type_name'];
        StrPartGroup:=Qry.FieldValues['group_name'];
        StrPartDetail:=Qry.FieldValues['detail_name'];
        Qry.Next;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    PartType.ItemIndex:=PartType.Items.IndexOf(StrpartType);
    RefreshPartGroup;
    PartGroup.ItemIndex:=PartGroup.Items.IndexOf(StrPartGroup);
    RefreshPartDetail;
    PartDetail.ItemIndex:=PartDetail.Items.IndexOf(StrPartDetail); 
    Main.M_Normal;
  end;
end;

procedure TGoodReceivingList.DisableInput;
begin

end;

procedure TGoodReceivingList.EnableInput;
begin

end;

procedure TGoodReceivingList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if PartDetailId<>'' then begin
    SetPartDetailId(PartDetailId); 
    LoadData;
  end;
end;

procedure TGoodReceivingList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TGoodReceivingList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TGoodReceivingList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TGoodReceivingList.TahunKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PartType.SetFocus;
end;

procedure TGoodReceivingList.SBUChange(Sender: TObject);
begin
  RefreshLocation;
end;

procedure TGoodReceivingList.PartTypeChange(Sender: TObject);
begin
  RefreshPartGroup;
end;

procedure TGoodReceivingList.PartGroupChange(Sender: TObject);
begin
  RefreshPartDetail;
end;

procedure TGoodReceivingList.LihatClick(Sender: TObject);
begin
  LoadData;
end;

procedure TGoodReceivingList.PartDetailChange(Sender: TObject);
begin
  LoadData;
end;

procedure TGoodReceivingList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
