unit ContractListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons;

type
  TContractList = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    ContractArr,CompanyArr:Array of TArrString14;
    IntRow,IntCol:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  ContractList: TContractList;

implementation

uses MainU, ADODB, StrUtils, ContractU, OfferingFormU, OrderFormU;

{$R *.dfm}

constructor TContractList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TContractList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='');
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: Contract='+Company_Id+','+Form_Request+','+Customer_Id,1);
  inherited Create(AOwner);
end;

procedure TContractList.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=130904';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
       ToXCel.Enabled:=True;
    end else begin
      ToXCel.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
//  if UserLevel<69 then ToXCel.Enabled:=False;
end;

procedure TContractList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=12;
  StrGrid.ColWidths[0]:=180;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=250;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=270;
  StrGrid.ColWidths[6]:=70;
  StrGrid.ColWidths[7]:=30;
  StrGrid.ColWidths[8]:=70;
  StrGrid.ColWidths[9]:=70;
  StrGrid.ColWidths[10]:=250;
  StrGrid.ColWidths[11]:=50;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,9,0);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.Cells[0,0]:='No Kontrak';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='Telephone';
  StrGrid.Cells[4,0]:='Handphone';
  StrGrid.Cells[5,0]:='Paket Kontrak';
  StrGrid.Cells[6,0]:='Discount';
  StrGrid.Cells[8,0]:='Periode Kontrak';
  StrGrid.Cells[10,0]:='Keterangan';
  StrGrid.Cells[11,0]:='Status';
  StrGrid.Cells[6,1]:='Rupiah';
  StrGrid.Cells[7,1]:='%';
  StrGrid.Cells[8,1]:='Mulai';
  StrGrid.Cells[9,1]:='Selesai';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 10 do
    StrGrid.Cells[IntCount,2]:='';
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taRightJustify;
end;

procedure TContractList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TContractList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCustomer,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ContractArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if CustId='' then StrCustomer:=',@All=1' else StrCustomer:=',@CustomerId='+QuotedStr(CustId);
    StrQry:='EXEC GetContractList '+StrCompanyId+StrCustomer+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ContractArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ContractArr[IntCount][0]:=Qry.FieldValues['cust_contract_id'];
      ContractArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['title']<>NULL then ContractArr[IntCount][1]:=Qry.FieldValues['title']+' '+ContractArr[IntCount][1];
      if Qry.FieldValues['alias']<>NULL then ContractArr[IntCount][1]:=ContractArr[IntCount][1]+' ('+Qry.FieldValues['alias']+')';
      if (Qry.FieldValues['zip']<>NULL) and Qry.FieldValues['zip']<>'0' then ContractArr[IntCount][2]:=Qry.FieldValues['address']+', '+ToString(Qry.FieldValues['zip'])
      else if Qry.FieldValues['address']<>NULL then ContractArr[IntCount][2]:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone_no']<>NULL then ContractArr[IntCount][3]:=Qry.FieldValues['phone_no'];
      if Qry.FieldValues['cellular_no']<>NULL then ContractArr[IntCount][4]:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['contract_detail_resume']<>NULL then ContractArr[IntCount][5]:=Qry.FieldValues['contract_detail_resume'];
      if Qry.FieldValues['discount_price']<>NULL then ContractArr[IntCount][6]:=Qry.FieldValues['discount_price'];
      if Qry.FieldValues['discount_percent']<>NULL then ContractArr[IntCount][7]:=Qry.FieldValues['discount_percent'];
      ContractArr[IntCount][8]:=Qry.FieldValues['from_date'];
      ContractArr[IntCount][9]:=Qry.FieldValues['to_date'];
      if Qry.FieldValues['remark']<>NULL then  ContractArr[IntCount][10]:=Qry.FieldValues['remark'];
      if Qry.FieldValues['status']='1' then  ContractArr[IntCount][11]:='Berlaku' else ContractArr[IntCount][11]:='Tidak Aktif';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TContractList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(ContractArr)>0 then StrGrid.RowCount:=Length(ContractArr)+2
  else begin
    StrGrid.RowCount:=3;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,2]:='';
      StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(ContractArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=ContractArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=ContractArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=ContractArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=ContractArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=ContractArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=ContractArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=ContractArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=ContractArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=ContractArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=ContractArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=ContractArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=ContractArr[IntCount][11];
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
   end;
end;

procedure TContractList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TContractList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TContractList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(ContractArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 11 do
      if (StrPos(PChar(UpperCase(ContractArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 11 do
          StrGrid.Cells[Count4,Count2]:=ContractArr[Count][Count4];
          StrGrid.CellStyle[6,Count2].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[7,Count2].HorizontalAlignment:=taRightJustify;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TContractList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TContractList.StrGridDblClick(Sender: TObject);
begin
  if FormRequest='' then begin
    if Main.IsFormOpen('Contract')=False then if CompId=2 then Contract:=TContract.Create(Self,StrGrid.Cells[0,IntRow],False)
    else Contract:=TContract.Create(Self,StrGrid.Cells[0,IntRow],False)
  end else begin
    if UpperCase(FormRequest)='MAIN-CHANGE' then if Main.IsFormOpen('Contract')=False then begin
      Contract:=TContract.Create(nil,StrGrid.Cells[0,IntRow],True);
      ContractList.Close;
    end;
    if UpperCase(FormRequest)='OFFERING-CREATE' then  begin
      OfferingForm.SetContractId(StrGrid.Cells[0,IntRow]);
      ContractList.Close;
    end;
    if UpperCase(FormRequest)='ORDER-CREATE' then  begin
      OrderForm.SetContractId(StrGrid.Cells[0,IntRow]);
      ContractList.Close;
    end;
  end;
end;

procedure TContractList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TContractList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TContractList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

end.
