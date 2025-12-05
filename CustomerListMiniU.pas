unit CustomerListMiniU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons, ComCtrls,
  ExtCtrls;

type
  TRefreshThread = class(TThread)
  procedure Execute; override;
  public
    constructor Create; reintroduce;
  end;

  TCustomerListMini = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    Label2: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    TotalCustID: TMemo;
    Total: TMemo;
    CariOffering: TSpeedButton;
    ProgressBar: TProgressBar;
    KillThread: TTimer;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariOfferingClick(Sender: TObject);
    procedure KillThreadTimer(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest:String;
    CustomerArr,CompanyArr:Array of TArrString16;
    IntRow,IntCol:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  CustomerListMini: TCustomerListMini;
  RefreshThread:TRefreshThread;

implementation

uses CustomerU, MainU, ADODB, StrUtils, OfferingFormU, ContractU,
  OrderFormU, MemoFormU;

{$R *.dfm}

constructor TRefreshThread.Create;
begin
  inherited Create(False);
end;

constructor TCustomerListMini.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TCustomerListMini.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='');
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TRefreshThread.Execute;
begin
  Sleep(1000);
  CustomerListMini.RefreshData;
  CustomerListMini.RefreshGrid;
  CustomerListMini.KillThread.Enabled:=True;
end;

procedure TCustomerListMini.Init;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Total.Text:='0';
  TotalCustID.Text:='0';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=120704';
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

//  if UserLevel<80 then ToXCel.Enabled:=False;
  ProgressBar.Visible:=False;
end;

procedure TCustomerListMini.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=4;
  StrGrid.RowHeights[0]:=15;
  StrGrid.ColWidths[0]:=80;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=300;
  StrGrid.ColWidths[3]:=120;
  StrGrid.Cells[0,0]:='No Pelanggan';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='Last Update';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 4 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TCustomerListMini.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
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

procedure TCustomerListMini.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
    IntCount:Integer;
begin
  ProgressBar.Visible:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    ProgressBar.Position:=5;
    SetLength(CustomerArr,0);
//    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];

    StrQry:='EXEC GetCustomerListMini '+CompanyId+',@Like='+QuotedStr(Cari.Text)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CustomerArr,Qry.RecordCount);
    ProgressBar.Position:=10;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProgressBar.Position:=10+Round((70/Qry.RecordCount)*IntCount);
      CustomerArr[IntCount][0]:=Qry.FieldValues['customer_id'];
      CustomerArr[IntCount][1]:=Qry.FieldValues['name'];
     if Qry.FieldValues['address']<>NULL then CustomerArr[IntCount][2]:=Qry.FieldValues['address']
     else CustomerArr[IntCount][2]:= '';
     if Qry.FieldValues['update_user']<>NULL then CustomerArr[IntCount][3]:=Qry.FieldValues['update_user']
     else CustomerArr[IntCount][3]:='';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerListMini.RefreshGrid;
var IntCount,IntCount2,IntCountID:Integer;
begin
  if Length(CustomerArr)>0 then StrGrid.RowCount:=Length(CustomerArr)+1
  else begin
    StrGrid.RowCount:=2;
  end;
  for IntCount:=1 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  IntCountID:=0;
  ProgressBar.Position:=80;
  for IntCount:=0 to Length(CustomerArr)-1 do begin
    ProgressBar.Position:=80+Round((15/Length(CustomerArr))*IntCount);
    if CustomerArr[IntCount][1]<>'' then Inc(IntCountID);
    StrGrid.Cells[0,IntCount+1]:=CustomerArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=CustomerArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=CustomerArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=CustomerArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=CustomerArr[IntCount][4];
    if CustomerArr[IntCount][15]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clRed;
  end;
  ProgressBar.Position:=100;
  if Length(CustomerArr)>0 then Total.Text:=IntToStr(IntCount);
  TotalCustID.Text:=IntToStr(IntCountID);
  ProgressBar.Visible:=False;
end;

procedure TCustomerListMini.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TCustomerListMini.RefreshDisplay;
begin
  Init;
  InitGrid;
//  RefreshCombo;
//  RefreshThread:=TRefreshThread.Create;
end;

procedure TCustomerListMini.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TCustomerListMini.Search;
var Count,Count2,Count3,Count4,Count5,IntCountID:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    IntCountID:=0;
    for Count:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[Count,1]:='';
      StrGrid.CellStyle[Count,1].Font.Color:=clWindowText;
    end;
    for Count:=0 to Length(CustomerArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 13 do
      if (StrPos(PChar(UpperCase(CustomerArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          if CustomerArr[Count][1]<>'' then Inc(IntCountID);
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2-1]:=CustomerArr[Count][Count4];
          if CustomerArr[Count][15]='1' then
            for Count5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count5,Count2-1].Font.Color:=clRed;
          Inc(Count2);
      end;
    end;
   Total.Text:=IntToStr(Count2-2);
   TotalCustID.Text:=IntToStr(IntCountID);
  end;
end;

procedure TCustomerListMini.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerListMini.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TCustomerListMini.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TCustomerListMini.StrGridDblClick(Sender: TObject);
var Company_Id:String;
begin
  Case CompId of
    1:Company_Id:='GROUP';
    2:Company_Id:='BUS';
    3:Company_Id:='TAXI';
  end;
  if FormRequest='' then begin
    if Main.IsFormOpen('Customer')=False then Customer:=TCustomer.Create(Self,StrGrid.Cells[0,IntRow],Company_Id,False)
  end else begin
   { if UpperCase(FormRequest)='MAIN-CHANGE' then if Main.IsFormOpen('Customer')=False then begin
      Customer:=TCustomer.Create(nil,StrGrid.Cells[0,IntRow],Company_Id);
//      CustomerList.Close;
    end;
    if UpperCase(FormRequest)='CUSTOMER-CREATE' then  begin
      Customer.SetReferenceId(StrGrid.Cells[0,IntRow]);
      CustomerList.Close;
    end;
    if UpperCase(FormRequest)='OFFERING-CREATE' then  begin
      OfferingForm.SetCustomerId(StrGrid.Cells[0,IntRow]);
      CustomerList.Close;
    end;
    if UpperCase(FormRequest)='ORDER-CREATE' then  begin
      OrderForm.SetCustomerId(StrGrid.Cells[0,IntRow]);
      CustomerList.Close;
    end;
    if UpperCase(FormRequest)='CONTRACT-CREATE' then  begin
      Contract.SetCustomerId(StrGrid.Cells[0,IntRow]);
      CustomerList.Close;
    end;}
    if UpperCase(FormRequest)='MEMO-CREATE' then  begin
      MemoForm.CustomerID.text := (StrGrid.Cells[0,IntRow]);
      MemoForm.CustomerName.Text := (StrGrid.Cells[1,IntRow]);
      CustomerListMini.Close;
    end;
  end;
end;

procedure TCustomerListMini.SBUChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerListMini.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TCustomerListMini.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TCustomerListMini.CariOfferingClick(Sender: TObject);
begin
 // if Cari.Text <> ''then begin
     RefreshData;
     RefreshGrid;
  //end else ;
 // Search;
end;

procedure TCustomerListMini.KillThreadTimer(Sender: TObject);
begin
  KillThread.Enabled:=False;
  try
    RefreshThread.Terminate;
    RefreshThread.WaitFor;
    FreeAndNil(RefreshThread);
  except
  end;
end;

end.
