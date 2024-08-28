unit CustomerComplainSJListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ZColorStringGrid, Buttons;

type
  TCustomerComplainSJList = class(TForm)
    Selesai: TButton;
    GridSPJ: TZColorStringGrid;
    Label2: TLabel;
    Cari: TEdit;
    ToXCel: TSpeedButton;
    GroupBox1: TGroupBox;
    Foward: TRadioButton;
    Backward: TRadioButton;
    All: TCheckBox;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    BtnCari: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure AllFowardClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure FowardClick(Sender: TObject);
    procedure BackwardClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCariClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    SPJArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid:Integer;
    FormRequest:String;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_All:Integer=0);Overload;

  end;

var
  CustomerComplainSJList:TCustomerComplainSJList;

implementation

uses MainU, SPJFormBusU, CustomerComplainFormU;

{$R *.dfm}

constructor TCustomerComplainSJList.Create(AOwner:TComponent;Form_Request:String='';Is_All:Integer=0);
begin

  IsAll:=Is_All;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: CustomerComplainSJList='+Form_Request+','+IntToStr(Is_All),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TCustomerComplainSJList.Init;
begin
  Cari.Text:='';
end;

procedure TCustomerComplainSJList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridSPJ.ColCount:=14;
  GridSPJ.WordWrap:=False;
  GridSPJ.ColWidths[0]:=180;
  GridSPJ.ColWidths[1]:=70;
  GridSPJ.ColWidths[2]:=40;
  GridSPJ.ColWidths[3]:=100;
  GridSPJ.ColWidths[4]:=90;
  GridSPJ.ColWidths[5]:=45;
  GridSPJ.ColWidths[6]:=60;
  GridSPJ.ColWidths[7]:=70;
  GridSPJ.ColWidths[8]:=160;
  GridSPJ.ColWidths[9]:=320;
  GridSPJ.ColWidths[10]:=0;
  GridSPJ.ColWidths[11]:=0;
  GridSPJ.ColWidths[12]:=0;
  GridSPJ.ColWidths[13]:=0;

  GridSPJ.Cells[0,0]:='Customer';
  GridSPJ.Cells[1,0]:='Tanggal';
  GridSPJ.Cells[2,0]:='Jam';
  GridSPJ.Cells[3,0]:='No Pesanan';
  GridSPJ.Cells[4,0]:='No SJ';
  GridSPJ.Cells[5,0]:='No Body';
  GridSPJ.Cells[6,0]:='No Polisi';
  GridSPJ.Cells[7,0]:='ID Pengemudi';
  GridSPJ.Cells[8,0]:='Pengemudi';
  GridSPJ.Cells[9,0]:='Rute';
  GridSPJ.Cells[11,0]:='Cust. Complain ID';
  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.Cells[IntCount,1]:='';

  
end;

procedure TCustomerComplainSJList.RefreshCombo;
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

procedure TCustomerComplainSJList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(SPJArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    if Foward.Checked=True then if All.Checked=True then StrAllFoward:=',@AllFoward=1'
        else StrAllFoward:=',@AllFoward=2'
    else if Backward.Checked=True then if All.Checked=True then StrAllFoward:=',@AllFoward=-1'
        else StrAllFoward:=',@AllFoward=-2';
    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    {StrQry:='EXEC GetVhcOutList2 '+StrLocation+',1,'+StrCompany+StrAllFoward+';'; }

    StrAllFoward := ',@AllFoward=-1';
    StrQry:='EXEC GetVhcOutComplainRefundList '+StrLocation+','+StrCompany+'; ';

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;

  GridSPJ.Cells[0,0]:='Customer';
  GridSPJ.Cells[1,0]:='Tanggal';
  GridSPJ.Cells[2,0]:='Jam';
  GridSPJ.Cells[3,0]:='No Pesanan';
  GridSPJ.Cells[4,0]:='No SJ';
  GridSPJ.Cells[5,0]:='No Body';
  GridSPJ.Cells[6,0]:='No Polisi';
  GridSPJ.Cells[7,0]:='ID Pengemudi';
  GridSPJ.Cells[8,0]:='Pengemudi';
  GridSPJ.Cells[9,0]:='Rute';
  SetLength(SPJArr,Qry.RecordCount+1);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin

       SPJArr[IntCount][0]:=Qry.FieldValues['customer_name'];
       SPJArr[IntCount][1]:=Qry.FieldValues['from_dates'];
       SPJArr[IntCount][2]:=Qry.FieldValues['from_time'];
       SPJArr[IntCount][3]:=Qry.FieldValues['customer_order_id'];
       SPJArr[IntCount][4]:=Qry.FieldValues['vhc_trans_id'];
       SPJArr[IntCount][5]:=Qry.FieldValues['body_id'];
       SPJArr[IntCount][6]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       SPJArr[IntCount][7]:=Qry.FieldValues['employee_id'];
       SPJArr[IntCount][8]:=Qry.FieldValues['name'];



       SPJArr[IntCount][9]:=Qry.FieldValues['route'];
       SPJArr[IntCount][10]:=Qry.FieldValues['reserved_order_detail_id'];
       SPJArr[IntCount][11]:=Qry.FieldValues['cust_complain_id'];
       SPJArr[IntCount][12]:=Qry.FieldValues['reserved_order_detail_package_id'];
       SPJArr[IntCount][13]:=Qry.FieldValues['customer_id'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TCustomerComplainSJList.RefreshGrid;
var IntCount:Integer;
begin
  GridSPJ.RowCount:=Length(SPJArr)+1;
  for IntCount:=0 to Length(SPJArr)-1 do begin
    GridSPJ.Cells[0,IntCount+1]:=SPJArr[IntCount][0];
    GridSPJ.Cells[1,IntCount+1]:=SPJArr[IntCount][1];
    GridSPJ.Cells[2,IntCount+1]:=SPJArr[IntCount][2];
    GridSPJ.Cells[3,IntCount+1]:=SPJArr[IntCount][3];
    GridSPJ.Cells[4,IntCount+1]:=SPJArr[IntCount][4];
    GridSPJ.Cells[5,IntCount+1]:=SPJArr[IntCount][5];
    GridSPJ.Cells[6,IntCount+1]:=SPJArr[IntCount][6];
    GridSPJ.Cells[7,IntCount+1]:=SPJArr[IntCount][7];
    GridSPJ.Cells[8,IntCount+1]:=SPJArr[IntCount][8];
    GridSPJ.Cells[9,IntCount+1]:=SPJArr[IntCount][9];
    GridSPJ.Cells[10,IntCount+1]:=SPJArr[IntCount][10];
    GridSPJ.Cells[11,IntCount+1]:=SPJArr[IntCount][11];
    GridSPJ.Cells[12,IntCount+1]:=SPJArr[IntCount][12];
    GridSPJ.Cells[13,IntCount+1]:=SPJArr[IntCount][13];
    GridSPJ.CellStyle[9,IntCount+1].WordWrap:=False;
  end;
end;

procedure TCustomerComplainSJList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerComplainSJList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCustomerComplainSJList.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TCustomerComplainSJList.GridSPJDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridSPJ.Cells[0,IntRow]<>'') then begin
    //ShowMessage(GridSPJ.Cells[10,IntRow]+' -- '+GridSPJ.Cells[11,IntRow]);
    if FormRequest='' then begin
      if GridSPJ.Cells[11,IntRow]='' then  begin
        //if Main.IsFormOpen('SPJFormBus')=False then CustomerComplainForm:=TCustomerComplainForm.Create(nil,GridSPJ.Cells[0,IntRow],'',1)
        CustomerComplainForm.CheckData(GridSPJ.Cells[4,IntRow], GridSPJ.Cells[10,IntRow], GridSPJ.Cells[12,IntRow], GridSPJ.Cells[13,IntRow]);
      end
      else begin
        //if Main.IsFormOpen('SPJFormBus')=False then CustomerComplainForm:=TCustomerComplainForm.Create(nil,GridSPJ.Cells[0,IntRow],GridSPJ.Cells[11,IntRow],2);
        CustomerComplainForm.LoadData(GridSPJ.Cells[11,IntRow]);
      end;
    end;
    Close;
  end;
end;

procedure TCustomerComplainSJList.FormShow(Sender: TObject);
begin
  if (Main.IsFormOpen('CustomerComplainSJList')=True) then
  begin
     Label2.Caption:='No Order';
     BtnCari.Visible:=True;
     InitGrid;
     RefreshCombo;
     Initiation:=False;
  end
  else
  begin
    Label2.Caption:='Cari';
    BtnCari.Visible:=False;
    InitGrid;
    RefreshCombo;
    RefreshData;
    RefreshGrid;
    Initiation:=False;
  end;
  
end;

procedure TCustomerComplainSJList.CariChange(Sender: TObject);
begin
  if (Main.IsFormOpen('CustomerComplainSJList')=False) then
  begin
    if Trim(Cari.Text)='' then begin
      RefreshData;
      RefreshGrid;
    end;
  end;
end;

procedure TCustomerComplainSJList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridSPJ) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TCustomerComplainSJList.AllFowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TCustomerComplainSJList.AllClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainSJList.FowardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainSJList.BackwardClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TCustomerComplainSJList.CariKeyPress(Sender: TObject;
  var Key: Char);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;  
begin
  if Key=#13 then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(SPJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 12 do
      if (StrPos(PChar(UpperCase(SPJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2+1;
          for Count4:=0 to 12 do begin
            GridSPJ.Cells[Count4,Count2]:=SPJArr[Count][Count4];
          end;
          GridSPJ.CellStyle[8,Count2].WordWrap:=False;
          Inc(Count2);
      end;
    end;
  end;
end;

procedure TCustomerComplainSJList.BtnCariClick(Sender: TObject);
var StrQry,StrAllFoward,StrLocation,StrCompany,StrOrder:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(SPJArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;

    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    StrOrder:=Cari.Text;

    StrQry:='EXEC GetVhcOutComplainRefundList '+StrLocation+','+StrCompany+','+StrOrder+'; ';

    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;

  GridSPJ.Cells[0,0]:='Customer';
  GridSPJ.Cells[1,0]:='Tanggal';
  GridSPJ.Cells[2,0]:='Jam';
  GridSPJ.Cells[3,0]:='No Pesanan';
  GridSPJ.Cells[4,0]:='No SJ';
  GridSPJ.Cells[5,0]:='No Body';
  GridSPJ.Cells[6,0]:='No Polisi';
  GridSPJ.Cells[7,0]:='ID Pengemudi';
  GridSPJ.Cells[8,0]:='Pengemudi';
  GridSPJ.Cells[9,0]:='Rute';
  SetLength(SPJArr,Qry.RecordCount+1);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin

       SPJArr[IntCount][0]:=Qry.FieldValues['customer_name'];
       SPJArr[IntCount][1]:=Qry.FieldValues['from_dates'];
       SPJArr[IntCount][2]:=Qry.FieldValues['from_time'];
       SPJArr[IntCount][3]:=Qry.FieldValues['customer_order_id'];
       SPJArr[IntCount][4]:=Qry.FieldValues['vhc_trans_id'];
       SPJArr[IntCount][5]:=Qry.FieldValues['body_id'];
       SPJArr[IntCount][6]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                           ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
       SPJArr[IntCount][7]:=Qry.FieldValues['employee_id'];
       SPJArr[IntCount][8]:=Qry.FieldValues['name'];



       SPJArr[IntCount][9]:=Qry.FieldValues['route'];
       SPJArr[IntCount][10]:=Qry.FieldValues['reserved_order_detail_id'];
       SPJArr[IntCount][11]:=Qry.FieldValues['cust_complain_id'];
       SPJArr[IntCount][12]:=Qry.FieldValues['reserved_order_detail_package_id'];
       SPJArr[IntCount][13]:=Qry.FieldValues['customer_id'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

  RefreshGrid;
end;

end.
