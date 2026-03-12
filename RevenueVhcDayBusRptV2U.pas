unit RevenueVhcDayBusRptV2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, ADODB, WHUnit,
  ZColorStringGrid, ExtCtrls, Menus, ClipBrd;

type
  TRevenueVhcDayBusRptV2 = class(TForm)
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Batch: TComboBox;
    Label3: TLabel;
    Refresh: TButton;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    TotalUnitOperasi: TEdit;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    SBU: TComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    isAll: TComboBox;
    Panel1: TPanel;
    GroupDisp: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    Customer: TEdit;
    Label5: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure StrGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustomerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    GroupArr:Array of TArrString2;
    CompanyArr:Array of TArrString8;
    MaxCol:Integer;
    IntRow,IntCol:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  RevenueVhcDayBusRptV2: TRevenueVhcDayBusRptV2;

implementation

uses MainU, OrderFormU, VehicleFormU, OrderFeeU, SPJFormBusU,
  AuthorizedFormU, RevenueVhcDayBusRptU;

{$R *.dfm}

procedure TRevenueVhcDayBusRptV2.Init;
var Count,Count2:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  MaxCol:=48;
  Customer.Text:='';
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Batch.Items.Clear;
  Batch.ItemIndex:=0;
  Batch.Text:='';

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=190401';
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

  isAll.ItemIndex:=0;

  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
//  Batch.Items.Add('All');
//  Batch.Text:='All';


  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=3;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='No Resv';
  StrGrid.Cells[3,0]:='No SJ';
  StrGrid.Cells[4,0]:='No OF';
  StrGrid.Cells[5,0]:='Customer';
  StrGrid.Cells[6,0]:='No Kontrak';
  StrGrid.Cells[7,0]:='Rute';
  StrGrid.Cells[8,0]:='No Body';
  StrGrid.Cells[9,0]:='No Polisi';
  StrGrid.Cells[10,0]:='Driver';
  StrGrid.Cells[11,0]:='BusBoy';
  StrGrid.Cells[12,0]:='Tgl Klr';
  StrGrid.Cells[13,0]:='Jam Klr';
  StrGrid.Cells[14,0]:='Jam Msk';
  StrGrid.Cells[15,0]:='Nilai Inv';
  StrGrid.Cells[16,0]:='BBM(Set)';

  StrGrid.Cells[17,0]:='BBM Budget';
  StrGrid.Cells[17,1]:='(Ltr)';
  StrGrid.Cells[18,1]:='Rp';

  StrGrid.Cells[19,0]:='BBM SPBU';
  StrGrid.Cells[19,1]:='(Ltr)';
  StrGrid.Cells[20,1]:='(Rp)';
  StrGrid.Cells[21,0]:='BBM Reimburse';
  StrGrid.Cells[21,1]:='(Ltr)';
  StrGrid.Cells[22,1]:='(Rp)';
  StrGrid.Cells[23,0]:='Total BBM';
  StrGrid.Cells[23,1]:='(Ltr)';
  StrGrid.Cells[24,1]:='(Rp)';
  {Geser 6 Kolom}
  StrGrid.Cells[25,0]:='Fee Driver';
  StrGrid.Cells[25,1]:='Budget';
  StrGrid.Cells[26,1]:='Reimburse';

  StrGrid.Cells[27,0]:='Fee Kenek';
  StrGrid.Cells[27,1]:='Budget';
  StrGrid.Cells[28,1]:='Reimburse';

  StrGrid.Cells[29,0]:='Parkir';
  StrGrid.Cells[29,1]:='Buget';
  StrGrid.Cells[30,1]:='Reimburse';

  StrGrid.Cells[31,0]:='Toll';
  StrGrid.Cells[31,1]:='Buget';
  StrGrid.Cells[32,1]:='Reimburse';

  StrGrid.Cells[33,0]:='Biaya Lain-Lain'; {29}
  StrGrid.Cells[33,1]:='Bermalam';
  StrGrid.Cells[34,1]:='Tips';
  StrGrid.Cells[35,1]:='Biaya dari Tamu';
  StrGrid.Cells[36,1]:='insentif';

  StrGrid.Cells[37,0]:='Total Biaya';

  StrGrid.Cells[38,0]:='KM Out';
  StrGrid.Cells[39,0]:='KM In';
  StrGrid.Cells[40,0]:='KM Run';
  StrGrid.Cells[41,0]:='R BBM';
  StrGrid.Cells[42,0]:='Inv-Biaya';
  StrGrid.Cells[43,0]:='Keterangan';
  StrGrid.Cells[44,0]:='No E-Toll';
  StrGrid.Cells[45,0]:='Keberangkatan';
  StrGrid.Cells[46,0]:='Jenis Service';
  StrGrid.Cells[47,0]:='Keterangan SJ';
  StrGrid.Cells[48,0]:='Customer ID';


  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=85;
  StrGrid.ColWidths[2]:=95;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=200;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=200;
  StrGrid.ColWidths[8]:=55;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=85;
  StrGrid.ColWidths[11]:=85;
  StrGrid.ColWidths[12]:=60;
  StrGrid.ColWidths[13]:=45;
  StrGrid.ColWidths[14]:=45;
  StrGrid.ColWidths[15]:=60;
  StrGrid.ColWidths[16]:=70;
  StrGrid.ColWidths[17]:=50;
  StrGrid.ColWidths[18]:=60;

  StrGrid.ColWidths[19]:=50;
  StrGrid.ColWidths[20]:=55;
  StrGrid.ColWidths[21]:=50;
  StrGrid.ColWidths[22]:=55;
  StrGrid.ColWidths[23]:=50;
  StrGrid.ColWidths[24]:=55;

  StrGrid.ColWidths[25]:=60;
  StrGrid.ColWidths[26]:=65;
  StrGrid.ColWidths[27]:=60;
  StrGrid.ColWidths[28]:=65;
  StrGrid.ColWidths[29]:=60;
  StrGrid.ColWidths[30]:=65;
  StrGrid.ColWidths[31]:=60;
  StrGrid.ColWidths[32]:=65;


  StrGrid.ColWidths[33]:=70;
  StrGrid.ColWidths[34]:=70;
  StrGrid.ColWidths[35]:=100;
  StrGrid.ColWidths[36]:=70;
  StrGrid.ColWidths[37]:=90;

  StrGrid.ColWidths[38]:=50;
  StrGrid.ColWidths[39]:=50;
  StrGrid.ColWidths[40]:=50;
  StrGrid.ColWidths[41]:=50;
  StrGrid.ColWidths[42]:=70;
  StrGrid.ColWidths[43]:=150;
  StrGrid.ColWidths[44]:=140;
  StrGrid.ColWidths[45]:=100;
  StrGrid.ColWidths[46]:=120;
  StrGrid.ColWidths[47]:=100;
  StrGrid.ColWidths[48]:=70;

  
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);

  StrGrid.MergeCells.AddRectXY(17,0,18,0);
  StrGrid.MergeCells.AddRectXY(19,0,20,0);
  StrGrid.MergeCells.AddRectXY(21,0,22,0);
  StrGrid.MergeCells.AddRectXY(23,0,24,0);

  StrGrid.MergeCells.AddRectXY(25,0,26,0);
  StrGrid.MergeCells.AddRectXY(27,0,28,0);
  StrGrid.MergeCells.AddRectXY(29,0,30,0);
  StrGrid.MergeCells.AddRectXY(31,0,32,0);

  StrGrid.MergeCells.AddRectXY(33,0,36,0);
  StrGrid.MergeCells.AddRectXY(37,0,37,1);
  StrGrid.MergeCells.AddRectXY(38,0,38,1);
  StrGrid.MergeCells.AddRectXY(39,0,39,1);
  StrGrid.MergeCells.AddRectXY(40,0,40,1);
  StrGrid.MergeCells.AddRectXY(41,0,41,1);
  StrGrid.MergeCells.AddRectXY(42,0,42,1);
  StrGrid.MergeCells.AddRectXY(43,0,43,1);
  StrGrid.MergeCells.AddRectXY(44,0,44,1);
  StrGrid.MergeCells.AddRectXY(45,0,45,1);
  StrGrid.MergeCells.AddRectXY(46,0,46,1);
  StrGrid.MergeCells.AddRectXY(47,0,47,1);
  StrGrid.MergeCells.AddRectXY(48,0,48,1);

  for Count:=0 to MaxCol do begin
    StrGrid.CellStyle[Count,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[Count,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
    StrGrid.Cells[Count,2]:='';
  end;
end;


procedure TRevenueVhcDayBusRptV2.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin;
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
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1];
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+1);
    GroupArr[0][0]:='All';
    GroupArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      GroupArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(GroupArr)-1 do
    Batch.Items.Add(GroupArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
  Main.M_Normal;
end;

procedure TRevenueVhcDayBusRptV2.RefreshData;
var StrQry,StrBatch,StrLocationId,StrCompanyId,StrToDates,StrisAll,StrCustomer,StrCustomerName:String;
    Qry:TADOQuery;
    Qry2:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,
    TotalOperasi,IntDiscount,IntFeeDriver,IntFeeBusBoy,IntBiaya,IntBiayaReimburse,BiayaTambahan,BiayaTambahanAll:Integer;
    //IntFeeDriver,IntFeeBusBoy,IntTol
    //BBMLiter,GasLiter,BBMRp,GasRp:Integer;
    //TotalBBMRp,TotalBBMLiter,
    TotalFeeDriver,TotalFeeBusBoy,TotalTolParkir,TotalTol,TotalLain,IntTotalGrossProfit,IntGrossProfit,IntTotalBiaya:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse :Int64;

    BBMLiter,GasLiter,BBMRp,GasRp:Integer;
    BBMLiterSingle:Single;

    BBMLiter_Budget,BBMRp_Budget,BBMLiter_SPBU,BBMRp_SPBU,BBMLiter_Reimburse,BBMRp_Reimburse:Integer;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All:Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;
    Tolparkir_All,Tol_All,LainLain_All, TotalBermalam,TotalTips,TotalInsentif,TotalBiayaDrTamu:Int64;
begin
  TotalBBMRp:=0;
  TotalBBMLiter:=0;
  TotalBBMRp_All:=0;
  TotalBBMLiter_All:=0;

  TotalBBMRp_Budget:=0;
  TotalBBMLiter_Budget:=0;
  TotalBBMRp_SPBU:=0;
  TotalBBMLiter_SPBU:=0;
  TotalBBMRp_Reimburse:=0;
  TotalBBMLiter_Reimburse:=0;

  TotalFeeDriver:=0;
  TotalFeeBusBoy:=0;
  TotalTolParkir:=0;
  TotalTol:=0;

  Tolparkir_All :=0;
  Tol_All:=0;
  LainLain_All:=0;

  TotalFeeDriverReimburse:=0;
  TotalFeeBusBoyReimburse:=0;
  TotalTolParkirReimburse:=0;
  TotalTolReimburse:=0;

  TotalLain:=0;
  TotalBermalam:= 0;
  TotalTips:=0;
  TotalInsentif:= 0;
  TotalBiayaDrTamu:=0;
  TotalOperasi:=0;
  IntTotalGrossProfit:=0;
  IntTotalBiaya:=0;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry2:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry.CursorLocation:=clUseClient;
{  if Lokasi.Text='All' then begin
    StrLokasi:='0';
  end else begin
    StrLokasi:=Lokasi.Text;
  end;
}
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  if Batch.Text='All' then begin
    StrBatch:='0';
  end else begin
    StrBatch:=GroupArr[Batch.ItemIndex][0];//Batch.Text;
  end;
  if CekTglSampai.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy',TglSampai.Date));

  if isAll.Text='All' then begin
    StrisAll:='0';
  end else begin
    StrisAll:=IntToStr(isAll.ItemIndex);
  end;

  if Customer.Text<>'' then
  begin
    StrCustomerName:=',@CustomerName='+QuotedStr(Customer.Text);
  end else begin
    StrCustomerName:='';
  end;

  Main.M_Busy;
  StrQry:='EXEC GetRevenueVhcDayRpt2 '+StrLocationId+','+
        QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date))+','+
        QuotedStr(StrBatch)+',@CompanyId='+StrCompanyId+StrToDates+',@Ordered='+'''from_dates,vhc_trans_id;'', @isAll='+StrisAll+StrCustomerName+';';
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+3 else StrGrid.RowCount:=3;
  for Count:=0 to MaxCol do begin
    for Count2:=2 to StrGrid.RowCount do begin
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
    end;
  end;

  Count:=2;
  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    Application.ProcessMessages;
    for Count2:=0 to MaxCol do StrGrid.Cells[Count2,Count]:='';
    Application.ProcessMessages;
    IntDiscount:=0;
    IntGrossProfit:=0;
    StrGrid.Cells[0,Count]:=IntToStr(Count-1);
    StrGrid.Cells[1,Count]:=Qry.FieldValues['location'];
    StrGrid.Cells[2,Count]:=Qry.FieldValues['customer_order_id'];
    StrGrid.Cells[3,Count]:=Qry.FieldValues['vhc_trans_id'];
//  StrGrid.Cells[4,0]:='No OF';
    StrGrid.Cells[4,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[5,Count]:=Qry.FieldValues['customer_name'];
    if Qry.FieldValues['cust_contract_id']<>NULL then StrGrid.Cells[6,Count]:=Qry.FieldValues['cust_contract_id'];
    StrGrid.Cells[7,Count]:=Qry.FieldValues['route'];
    StrGrid.Cells[8,Count]:=Qry.FieldValues['body_id'];
    if Qry.FieldValues['from_dates']<>NULL then StrGrid.Cells[12,Count]:=Qry.FieldValues['from_dates'];
    if Qry.FieldValues['out_time']<>NULL then StrGrid.Cells[13,Count]:=Qry.FieldValues['out_time'];
    if Qry.FieldValues['in_time']<>NULL then StrGrid.Cells[14,Count]:=Qry.FieldValues['in_time'];
    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      if Qry.FieldValues['fuel_litre']<>NULL then BBMLiter:=Qry.FieldValues['fuel_litre'] else BBMLiter:=0;
      if Qry.FieldValues['fuel_price']<>NULL then BBMRp:=Qry.FieldValues['fuel_price'] else BBMRp:=0;

//Penambahan
    if Qry.FieldValues['biaya_tambahan']=NULL then begin
      BiayaTambahanAll:=0;
      BiayaTambahan:=0 ;
    end else begin
      BiayaTambahanAll:=Qry.FieldValues['biaya_tambahan'];
      BiayaTambahan := Qry.FieldValues['biaya_tambahan']/Qry.FieldValues['total_units'];
    end;
      //Budget
      if Qry.FieldValues['fuel_litre_budget']<>NULL then begin
        BBMLiter_Budget       :=Qry.FieldValues['fuel_litre_budget'];
        BBMLiterSingle_Budget :=Qry.FieldValues['fuel_litre_budget'];
      end else begin
        BBMLiter_Budget:=0; BBMLiterSingle_Budget:=0;
      end;
      if Qry.FieldValues['fuel_price_budget']<>NULL then BBMRp_Budget:=Qry.FieldValues['fuel_price_budget'] else BBMRp_Budget:=0;
      //SPBU
      if Qry.FieldValues['fuel_litre_spbu']<>NULL then begin
        BBMLiter_SPBU       :=Qry.FieldValues['fuel_litre_spbu'];
        BBMLiterSingle_SPBU :=Qry.FieldValues['fuel_litre_spbu'];
      end else begin
        BBMLiter_SPBU:=0; BBMLiterSingle_SPBU:=0;
      end;
      if Qry.FieldValues['fuel_price_spbu']<>NULL then BBMRp_SPBU:=Qry.FieldValues['fuel_price_spbu'] else BBMRp_SPBU:=0;
      //Reimburse
      if Qry.FieldValues['fuel_litre_reimburse']<>NULL then begin
        BBMLiter_Reimburse       :=Qry.FieldValues['fuel_litre_reimburse'];
        BBMLiterSingle_Reimburse :=Qry.FieldValues['fuel_litre_reimburse'];
      end else begin
        BBMLiter_Reimburse:=0; BBMLiterSingle_Reimburse:=0;
      end;
      if Qry.FieldValues['fuel_price_reimburse']<>NULL then BBMRp_Reimburse:=Qry.FieldValues['fuel_price_reimburse'] else BBMRp_Reimburse:=0;

      BBMLiter:=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
      BBMLiterSingle:=BBMLiterSingle_Budget+BBMLiterSingle_SPBU+BBMLiterSingle_Reimburse;
      BBMRp:=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;

      TotalBBMRp_Budget   :=TotalBBMRp_Budget+BBMRp_Budget;
      TotalBBMLiter_Budget:=TotalBBMLiter_Budget+BBMLiter_Budget;
      TotalBBMRp_SPBU     :=TotalBBMRp_SPBU+BBMRp_SPBU;
      TotalBBMLiter_SPBU  :=TotalBBMLiter_SPBU+BBMLiter_SPBU;
      TotalBBMRp_Reimburse:=TotalBBMRp_Reimburse+BBMRp_Reimburse;
      TotalBBMLiter_Reimburse:=TotalBBMLiter_Reimburse+BBMLiter_Reimburse;
//End Penambahan

      //if Qry.FieldValues['discount_detail_price']>0 then IntDiscount:=IntDiscount+Qry.FieldValues['discount_detail_price'];

      if Qry.FieldValues['total']<>NULL then begin
        if Qry.FieldValues['discount_percent']>0 then
        begin
            if  Qry.FieldValues['discount_percent'] = '100' then
            begin
               IntDiscount:=IntDiscount+Qry.FieldValues['total'];
            end
            else
            begin
              if Qry.FieldValues['discount_amount']>0 then
              IntDiscount:= IntDiscount+((Qry.FieldValues['discount_amount']/(Qry.FieldValues['total_order']-BiayaTambahanAll))* (Qry.FieldValues['total']/Qry.FieldValues['units']))
              else
              IntDiscount:=IntDiscount+(Qry.FieldValues['total']*(Qry.FieldValues['discount_percent']/100));
//              IntDiscount:=IntDiscount+(( (Qry.FieldValues['total']/(Qry.FieldValues['total_order']-BiayaTambahan)) *Qry.FieldValues['discount_percent'])/100);
            end;
        end
        else if Qry.FieldValues['discount_price']>0 then
        begin
//          if Qry.FieldValues['total']=Qry.FieldValues['total_order'] then
//          begin
//            IntDiscount:= (Qry.FieldValues['discount_price']/Qry.FieldValues['units']);
//          end else
//          begin
            IntDiscount:= IntDiscount+((Qry.FieldValues['discount_price']/(Qry.FieldValues['total_order']-BiayaTambahanAll))* (Qry.FieldValues['total']/Qry.FieldValues['units']));
//            IntDiscount:= IntDiscount+((Qry.FieldValues['discount_price']/Qry.FieldValues['total_order'])* (Qry.FieldValues['total']/Qry.FieldValues['units']));
//          end;
        end;
      end;

      if Qry.FieldValues['total']<>NULL then
        {StrGrid.Cells[15,Count]:=IToCurr(((Qry.FieldValues['total']-(IntDiscount))+Qry.FieldValues['total_addday'])/Qry.FieldValues['units']) ;}
        //StrGrid.Cells[15,Count]:=IToCurr(((Qry.FieldValues['total']+Qry.FieldValues['total_addday'])/Qry.FieldValues['total_units'])-IntDiscount) ;

        StrGrid.Cells[15,Count]:= IToCurr((( (Qry.FieldValues['total']/Qry.FieldValues['units'])-(IntDiscount))+Qry.FieldValues['total_addday']) +BiayaTambahan);
//                                  IToCurr((( (Qry.FieldValues['total']/Qry.FieldValues['units'])-(IntDiscount))+Qry.FieldValues['total_addday']) ) + ' <> '+
//                                  VarToStr(Qry.FieldValues['total'])+' | '+IntToStr(IntDiscount)+' | '+VarToStr(Qry.FieldValues['total_addday'])+' | '+VartoStr(Qry.FieldValues['units']) ;

      if Qry.FieldValues['fuel']<>NULL then StrGrid.Cells[16,Count]:=IToCurr(Qry.FieldValues['fuel']);
      IntFeeDriver:=Qry.FieldValues['fee_driver']*Qry.FieldValues['day'];
      IntFeeBusBoy:=Qry.FieldValues['fee_busboy']*Qry.FieldValues['day'];

      TotalBBMRp:=TotalBBMRp+BBMRp;
      TotalBBMLiter:=TotalBBMLiter+BBMLiter;

      TotalFeeDriver:=TotalFeeDriver+(Qry.FieldValues['fee_driver']*Qry.FieldValues['day']);
      TotalFeeBusBoy:=TotalFeeBusBoy+(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day']);
      Tolparkir_All := Qry.FieldValues['tol_parkir']+Qry.FieldValues['tol_parkir_tamu'];
      TotalTolParkir:=TotalTolParkir+Tolparkir_All;
      Tol_All := Qry.FieldValues['tol']+Qry.FieldValues['tol_tamu'];
      TotalTol:=TotalTol+Tol_All;

      TotalFeeDriverReimburse:=TotalFeeDriverReimburse+(Qry.FieldValues['fee_driver_reimburse']*Qry.FieldValues['day']);
      TotalFeeBusBoyReimburse:=TotalFeeBusBoyReimburse+(Qry.FieldValues['fee_busboy_reimburse']*Qry.FieldValues['day']);
      TotalTolParkirReimburse:=TotalTolParkirReimburse+Qry.FieldValues['parkir_reimburse'];
      TotalTolReimburse:=TotalTolReimburse+Qry.FieldValues['tol_reimburse'];

      TotalBermalam := TotalBermalam+Qry.FieldValues['lain_lain'];
      TotalTips :=TotalTips+Qry.FieldValues['tips'];
      TotalBiayaDrTamu :=TotalBiayaDrTamu+Qry.FieldValues['biaya_dari_tamu'];
      TotalInsentif :=TotalInsentif+Qry.FieldValues['insentif'];

      LainLain_All := Qry.FieldValues['lain_lain']+Qry.FieldValues['tips']+Qry.FieldValues['biaya_dari_tamu']+Qry.FieldValues['insentif'];
      TotalLain:=TotalLain+LainLain_All;

      IntBiayaReimburse :=Qry.FieldValues['fee_driver_reimburse']+Qry.FieldValues['fee_busboy_reimburse']+
                          Qry.FieldValues['parkir_reimburse']+Qry.FieldValues['tol_reimburse'];
      IntBiaya :=BBMRp+IntFeeDriver+IntFeeBusBoy+Tolparkir_All+Tol_All+LainLain_All+
                 IntBiayaReimburse;

      IntTotalBiaya:=IntTotalBiaya+IntBiaya;

      if Qry.FieldValues['total']>0 then
        //IntGrossProfit:=(((Qry.FieldValues['total']-IntDiscount)+Qry.FieldValues['total_addday'])/Qry.FieldValues['units'])-(IntBiaya);
        IntGrossProfit:= (Qry.FieldValues['total']/Qry.FieldValues['units'])-IntDiscount+Qry.FieldValues['total_addday'] - (IntBiaya);

      IntTotalGrossProfit:=IntTotalGrossProfit+IntGrossProfit;
      StrGrid.Cells[9,Count]:=LicensePlate(Qry.FieldValues['license_plate']);
      StrGrid.Cells[10,Count]:=Qry.FieldValues['name'];
      StrGrid.Cells[11,Count]:=Qry.FieldValues['helper'];

      StrGrid.CellStyle[1,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[2,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[3,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[4,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[5,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[6,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[7,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[8,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[9,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[11,Count].HorizontalAlignment:=taLeftJustify;

      StrGrid.CellStyle[12,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[13,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[14,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[15,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[16,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[17,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[18,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[19,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[20,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[21,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[22,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[23,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[24,Count].HorizontalAlignment:=taRightJustify;
      {Geser 6 kolom}
      StrGrid.CellStyle[25,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[26,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[27,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[28,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[29,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[30,Count].HorizontalAlignment:=taRightJustify;

      StrGrid.CellStyle[31,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[32,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[33,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[34,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[35,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[36,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[37,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[38,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[39,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[42,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[45,Count].HorizontalAlignment:=taCenter;
//      if Qry.FieldValues['out_time']<>NULL then StrGrid.Cells[13,Count]:=Qry.FieldValues['out_time'];
//      if Qry.FieldValues['in_time']<>NULL then StrGrid.Cells[14,Count]:=Qry.FieldValues['in_time'];
      StrGrid.Cells[17,Count]:=IToCurr(BBMLiter_Budget);
      StrGrid.Cells[18,Count]:=IToCurr(BBMRp_Budget);
      StrGrid.Cells[19,Count]:=IToCurr(BBMLiter_SPBU);
      StrGrid.Cells[20,Count]:=IToCurr(BBMRp_SPBU);
      StrGrid.Cells[21,Count]:=IToCurr(BBMLiter_Reimburse);
      StrGrid.Cells[22,Count]:=IToCurr(BBMRp_Reimburse);
      StrGrid.Cells[23,Count]:=IToCurr(BBMLiter);
      StrGrid.Cells[24,Count]:=IToCurr(BBMRp);

      StrGrid.Cells[25,Count]:=IToCurr(IntFeeDriver);
      StrGrid.Cells[26,Count]:=IToCurr(Qry.FieldValues['fee_driver_reimburse']);

      StrGrid.Cells[27,Count]:=IToCurr(IntFeeBusBoy);
      StrGrid.Cells[28,Count]:=IToCurr(Qry.FieldValues['fee_busboy_reimburse']);

      StrGrid.Cells[29,Count]:=IToCurr(Tolparkir_All);
      StrGrid.Cells[30,Count]:=IToCurr(Qry.FieldValues['parkir_reimburse']);

      StrGrid.Cells[31,Count]:=IToCurr(Tol_All);
      StrGrid.Cells[32,Count]:=IToCurr(Qry.FieldValues['tol_reimburse']);

      StrGrid.Cells[33,Count]:=IToCurr(Qry.FieldValues['lain_lain']);
      StrGrid.Cells[34,Count]:=IToCurr(Qry.FieldValues['tips']);
      StrGrid.Cells[35,Count]:=IToCurr(Qry.FieldValues['biaya_dari_tamu']);
      StrGrid.Cells[36,Count]:=IToCurr(Qry.FieldValues['insentif']);
      StrGrid.Cells[37,Count]:=IToCurr(IntBiaya); //Total Biaya

     // TotalLain:=TotalLain+LainLain_All;
      if Qry.FieldValues['out_ordo_km']<>NULL then StrGrid.Cells[38,Count]:=IToCurr(Qry.FieldValues['out_ordo_km']);
      StrGrid.Cells[42,Count]:=IToCurr(IntGrossProfit);
      if Qry.FieldValues['in_ordo_km']<>NULL then begin
        StrGrid.Cells[39,Count]:=IToCurr(Qry.FieldValues['in_ordo_km']);
        StrGrid.Cells[40,Count]:=IToCurr(Qry.FieldValues['distance']);
        if (Qry.FieldValues['fuel_litre']>0) then
          StrGrid.Cells[41,Count]:=FloatToStrF(Qry.FieldValues['distance']/StrToFloat(Qry.FieldValues['fuel_litre']),ffNumber,6,2)
        else
          StrGrid.Cells[41,Count]:='0';
      end else begin
        StrGrid.Cells[39,Count]:='';
        StrGrid.Cells[40,Count]:='0';
        StrGrid.Cells[41,Count]:='0';
      end;
      if Qry.FieldValues['description']<>NULL then StrGrid.Cells[43,Count]:=Qry.FieldValues['description'];
      if Qry.FieldValues['etoll_number']<>NULL then StrGrid.Cells[44,Count]:=eToll(Qry.FieldValues['etoll_number']);
      if Qry.FieldValues['from_to_dates2']<>NULL then StrGrid.Cells[45,Count]:=Qry.FieldValues['from_to_dates2'];
      if Qry.FieldValues['JenisService']<>NULL then StrGrid.Cells[46,Count]:=Qry.FieldValues['JenisService'];
      if Qry.FieldValues['remarkSJ']<>NULL then StrGrid.Cells[47,Count]:=Qry.FieldValues['remarkSJ'];
      if Qry.FieldValues['customer_id']<>NULL then StrGrid.Cells[48,Count]:=Qry.FieldValues['customer_id'];
    end;
    Application.ProcessMessages;
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;

  StrGrid.ColWidths[5]:=200;
  StrGrid.ColWidths[6]:=150;
  StrGrid.ColWidths[7]:=200;

  for Count:=0 to 33 do StrGrid.Cells[Count,StrGrid.RowCount-1]:='';
  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  StrGrid.Cells[14,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Budget);
  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Budget);

  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_SPBU);
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_SPBU);
  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter_Reimburse);
  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Reimburse);
  StrGrid.Cells[23,StrGrid.RowCount-1]:=IToCurr(TotalBBMLiter);
  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp);

  {Geser 6 Kolom}
  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver);
  StrGrid.Cells[26,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriverReimburse);
  StrGrid.Cells[27,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[28,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoyReimburse);
  StrGrid.Cells[29,StrGrid.RowCount-1]:=IToCurr(TotalTolParkir);
  StrGrid.Cells[30,StrGrid.RowCount-1]:=IToCurr(TotalTolParkirReimburse);
  StrGrid.Cells[31,StrGrid.RowCount-1]:=IToCurr(TotalTol);
  StrGrid.Cells[32,StrGrid.RowCount-1]:=IToCurr(TotalTolReimburse);

  StrGrid.Cells[33,StrGrid.RowCount-1]:=IToCurr(TotalBermalam);
  StrGrid.Cells[34,StrGrid.RowCount-1]:=IToCurr(TotalTips);
  StrGrid.Cells[35,StrGrid.RowCount-1]:=IToCurr(TotalBiayaDrTamu);
  StrGrid.Cells[36,StrGrid.RowCount-1]:=IToCurr(TotalInsentif);
  StrGrid.Cells[37,StrGrid.RowCount-1]:=IToCurr(IntTotalBiaya);

  StrGrid.Cells[42,StrGrid.RowCount-1]:=IToCurr(IntTotalGrossProfit);

  StrGrid.CellStyle[14,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[17,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[18,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[19,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[21,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[22,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[23,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].BGColor:=clSilver;


  {geser 6 kolom}
  StrGrid.CellStyle[25,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[26,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[27,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[28,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[29,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[30,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[31,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[32,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[33,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[33,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[34,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[35,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[36,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[37,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[42,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.CellStyle[16,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[18,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[21,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[22,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[23,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  {Geser 6 kolom}
  StrGrid.CellStyle[25,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[26,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[27,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[28,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[29,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[30,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[31,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[32,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[33,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[34,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[35,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[36,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[37,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[42,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  Application.ProcessMessages;


  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('total_bbm_'+FormatDateTime('dd',Tanggal.Date))+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+FormatDateTime('mm',Tanggal.DateTime)+')AND(year='+FormatDateTime('yyyy',Tanggal.Date)+');';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
      if Qry.RecordCount>0 then
        StrQry:='UPDATE wh_dashboard SET value='+QuotedStr(IntToStr(TotalBBMRp))+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE (name='+QuotedStr('total_bbm'+FormatDateTime('dd',Tanggal.Date))+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+FormatDateTime('mm',Tanggal.DateTime)+')AND(year='+FormatDateTime('yyyy',Tanggal.Date)+');'
      else
        StrQry:='INSERT INTO wh_dashboard (name,company_id,location_id,month,year,value,update_user)'+
                'VALUES ('+QuotedStr('total_bbm'+FormatDateTime('dd',Tanggal.Date))+','+CompanyId+','+LocationId+','+FormatDateTime('mm',Tanggal.DateTime)+','+FormatDateTime('yyyy',Tanggal.Date)+
                ','+QuotedStr(IntToStr(TotalBBMRp))+','+QuotedStr(User)+')';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
        except on E:Exception do begin
            Main.WriteLog('Tidak dapat menyimpan nilai utilisasi-Bus Running Days Mini');
            MessageBox(Handle,PChar('Terjadi Kesalahan :'+Chr(13)+Chr(13)+'Tidak dapat menyimpan nilai'),'Bus Running Days Mini',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
          end;
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  Main.M_Normal;
end;

procedure TRevenueVhcDayBusRptV2.SelesaiClick(Sender: TObject);
begin
  RevenueVhcDayBusRptV2.Close;
end;

procedure TRevenueVhcDayBusRptV2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRevenueVhcDayBusRptV2.RefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TRevenueVhcDayBusRptV2.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

procedure TRevenueVhcDayBusRptV2.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Initiation:=False;
end;

procedure TRevenueVhcDayBusRptV2.BatchChange(Sender: TObject);
begin
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TRevenueVhcDayBusRptV2.StrGridDblClick(Sender: TObject);
var IsAuth:Boolean;
begin
  if IntRow>0 then begin
    Case IntCol of
      0..2,5,6:if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[2,IntRow],False);
      3:begin
          IsAuth:=True;
          AuthorizedForm.FormId:='19040101';
          AuthorizedForm.StrMessage:=' Pencetakan Surat Jalan Kembali ';
          if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
          Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
          if IsAuth=True then begin
            if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,StrGrid.Cells[3,IntRow],False)
          end else if Main.IsFormOpen('OrderFee')=False then OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[3,IntRow],False);
        end;
      4,13..19:if Main.IsFormOpen('OrderFee')=False then OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[3,IntRow],False);
    end;
  end;
end;

procedure TRevenueVhcDayBusRptV2.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;  
end;

procedure TRevenueVhcDayBusRptV2.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

procedure TRevenueVhcDayBusRptV2.FormCreate(Sender: TObject);
begin
    Initiation:=True;
end;

procedure TRevenueVhcDayBusRptV2.Copy1Click(Sender: TObject);
var
  S: string;
  GRect: TGridRect;
  C, R: Integer;
begin
  GRect := StrGrid.Selection;
  S  := '';
  for R := GRect.Top to GRect.Bottom do
  begin
    for C := GRect.Left to GRect.Right do
    begin
      if C = GRect.Right then  S := S + (StrGrid.Cells[C, R])
      else
        S := S + StrGrid.Cells[C, R] + #9;
    end;
    S := S + #13#10;
  end;
  ClipBoard.AsText := S;
end;
procedure TRevenueVhcDayBusRptV2.StrGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if ((Key = 67) or (Key = 99)) and (Shift=[ssCtrl]) then
      Copy1Click(Nil);
end;

procedure TRevenueVhcDayBusRptV2.CustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then RefreshClick(sender);
end;

end.
