unit TransferUangHarianDriverU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ZColorStringGrid, StdCtrls, ComCtrls, Buttons, ADODB, WHUnit,
  Menus;

type
  TTransferUangHarianDriver = class(TForm)
    lbl2: TLabel;
    ToXCel: TSpeedButton;
    lbl3: TLabel;
    lbl4: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    chk1: TCheckBox;
    Tanggal: TDateTimePicker;
    Selesai: TButton;
    Batch: TComboBox;
    Refresh: TButton;
    StrGrid: TZColorStringGrid;
    pnl1: TPanel;
    GroupDisp: TEdit;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    grp1: TGroupBox;
    lbl7: TLabel;
    isAll: TComboBox;
    Simpan: TButton;
    CheckSelect: TCheckBox;
    lbl1: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckSelectExit(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,GroupArr:Array of TArrString2;
    CompanyArr:Array of TArrString5;
    MaxCol:Integer;
    IntRow,IntCol,IsIntegrate:Integer;
    IsInput,Initiation:Boolean;
    StrTitel:String;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Is_Input:Boolean=False;Is_Integrate:Smallint=-1; Titel:String='');Overload;
  end;

var
  TransferUangHarianDriver: TTransferUangHarianDriver;

implementation

uses
  MainU;

{$R *.dfm}

constructor TTransferUangHarianDriver.Create(AOwner:TComponent;Is_Input:Boolean=False;Is_Integrate:Smallint=-1; Titel:String='');
begin
  Initiation:=True;
  IsInput:=Is_Input;
  IsIntegrate:=Is_Integrate;
  StrTitel:=Titel;

  inherited Create(AOwner);
end;

procedure TTransferUangHarianDriver.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TTransferUangHarianDriver.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTransferUangHarianDriver.Init;
var Count,Count2:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  MaxCol:=26;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Batch.Items.Clear;
  Batch.ItemIndex:=0;
  Batch.Text:='';
  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  if IsIntegrate=-1 then Simpan.Visible:=True
  else Simpan.Visible:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
  if StrTitel<>'' Then  Caption:=StrTitel;

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=191301';
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
end;

procedure TTransferUangHarianDriver.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=3;

  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=35;
  StrGrid.ColWidths[2]:=95;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=82;
  StrGrid.ColWidths[5]:=200;
  StrGrid.ColWidths[6]:=250;
  StrGrid.ColWidths[7]:=55;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=85;
  StrGrid.ColWidths[10]:=95;
  StrGrid.ColWidths[11]:=130;
  StrGrid.ColWidths[12]:=70;
  StrGrid.ColWidths[13]:=130;
  StrGrid.ColWidths[14]:=130;
  StrGrid.ColWidths[15]:=60;
  StrGrid.ColWidths[16]:=60;
  StrGrid.ColWidths[17]:=60;
  StrGrid.ColWidths[18]:=60;
  StrGrid.ColWidths[19]:=60;
  StrGrid.ColWidths[20]:=60;
  StrGrid.ColWidths[21]:=60;
  StrGrid.ColWidths[22]:=60;
  StrGrid.ColWidths[23]:=60;
  StrGrid.ColWidths[24]:=90;
  StrGrid.ColWidths[25]:=90;
  StrGrid.ColWidths[26]:=95;



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
  StrGrid.MergeCells.AddRectXY(11,0,11,0);

  StrGrid.MergeCells.AddRectXY(12,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,13,0);
  StrGrid.MergeCells.AddRectXY(14,0,14,0);
  StrGrid.MergeCells.AddRectXY(15,0,16,0);

  StrGrid.MergeCells.AddRectXY(17,0,18,0);
  StrGrid.MergeCells.AddRectXY(19,0,20,0);
  StrGrid.MergeCells.AddRectXY(21,0,22,0);
  StrGrid.MergeCells.AddRectXY(23,0,23,1);
  StrGrid.MergeCells.AddRectXY(24,0,24,1);

  StrGrid.MergeCells.AddRectXY(25,0,25,1);
  StrGrid.MergeCells.AddRectXY(26,0,26,1);



  StrGrid.CellStyle[25,0].WordWrap:=True;       {(Inc Tol&Lain2)}
  StrGrid.CellStyle[26,0].WordWrap:=True;       {(Exc Tol&Lain2)}

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Cek';
  StrGrid.Cells[2,0]:='No Resv';
  StrGrid.Cells[3,0]:='No SJ';
  StrGrid.Cells[4,0]:='Tanggal Transfer';
  StrGrid.Cells[5,0]:='Customer';
  StrGrid.Cells[6,0]:='Rute';
  StrGrid.Cells[7,0]:='No Body';
  StrGrid.Cells[8,0]:='No Polisi';
  StrGrid.Cells[9,0]:='Driver';
  StrGrid.Cells[10,0]:='Keberangkatan';
//  StrGrid.Cells[9,0]:='BusBoy';

  StrGrid.Cells[11,0]:='BBM Budget';
  StrGrid.Cells[11,1]:='BBM(Rp)';
  StrGrid.Cells[12,0]:='BBM SPBU';
  StrGrid.Cells[12,1]:='BBM(Rp)';
  StrGrid.Cells[13,0]:='BBM Reimburse';
  StrGrid.Cells[13,1]:='BBM(Rp)';
  StrGrid.Cells[14,0]:='Total BBM';
  StrGrid.Cells[14,1]:='(Rp)';
  {Geser 4 kolom}
  StrGrid.Cells[15,0]:='Fee Driver';
  StrGrid.Cells[15,1]:='Budget';
  StrGrid.Cells[16,1]:='Reimburse';

  StrGrid.Cells[17,0]:='Fee Kenek';
  StrGrid.Cells[17,1]:='Budget';
  StrGrid.Cells[18,1]:='Reimburse';


  StrGrid.Cells[19,0]:='Parkir';
  StrGrid.Cells[19,1]:='Budget';
  StrGrid.Cells[20,1]:='Reimburse';

  StrGrid.Cells[21,0]:='Toll';
  StrGrid.Cells[21,1]:='Budget';
  StrGrid.Cells[22,1]:='Reimburse';


  StrGrid.Cells[23,0]:='Lain2';//No E-Toll   Asal 22
  StrGrid.Cells[24,0]:='Overtime';//No E-Toll   Asal 22
  StrGrid.Cells[25,0]:='Total          (Inc Tol&Lain2)';//'Lain2';
  StrGrid.Cells[26,0]:='Total          (Total Inc - BBM SPBU)';


  for IntCount:=0 to MaxCol do begin
    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[IntCount,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,1].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,2]:='';
  end;
end;


procedure TTransferUangHarianDriver.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if main.OpenDb then begin
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
  StrQry:='EXEC GetGroup 2';
  Qry.SQL.Clear;
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
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(GroupArr)-1 do
    Batch.Items.Add(GroupArr[IntCount][0]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TTransferUangHarianDriver.RefreshData;
var QStr,StrBatch,StrLocationId,StrCompanyId,StrToDates,StrisAll:String;
    StrIsIntegrate:string;
    Qry, Qry2, QryCek:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,TotalOperasi,IntDiscount,TotalOvertime:Integer;
    BBMLiter,GasLiter,BBMRp,GasRp:Integer;
    BBMLiterSingle:Single;

    BBMLiter_Budget,BBMRp_Budget,BBMLiter_SPBU,BBMRp_SPBU,BBMLiter_Reimburse,BBMRp_Reimburse:Integer;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All,TotalFeeDriver,TotalFeeBusBoy,
    TotalTolParkir,Tolparkir_All, TotalTol,Tol_All,TotalLain,LainLain_All,TotalBiaya,TotalBiayaExc,IntBiaya:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse,IntBiayaReimburse :Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;
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
  TotalLain:=0;
  TotalOperasi:=0;
  TotalOvertime:=0;
  TotalBiaya:=0;
  TotalBiayaExc:=0;

  Tolparkir_All :=0;
  Tol_All:=0;
  LainLain_All:=0;

  TotalFeeDriverReimburse:=0;
  TotalFeeBusBoyReimburse:=0;
  TotalTolParkirReimburse:=0;
  TotalTolReimburse:=0;

  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry2:=TADOQuery.Create(Self);
  QryCek:=TADOQuery.Create(Self);

  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;

  QryCek.Connection:=Main.MyConnection;
  QryCek.CommandTimeout:=3600;

  Qry.CursorLocation:=clUseClient;
  if Batch.Text='All' then begin
    StrBatch:='0';
  end else begin
    StrBatch:=Batch.Text;
  end;
  if isAll.Text='All' then begin
    StrisAll:='0';
  end else begin
    StrisAll:=IntToStr(isAll.ItemIndex);
  end;
  Main.M_Busy;
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  StrCompanyId:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];
  if CekTglSampai.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy',TglSampai.Date));

  StrIsIntegrate:=',@isIntegrate='+IntToStr(IsIntegrate);
  QStr:='EXEC GetRevenueVhcDayRpt2 '+StrLocationId+','+
        QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date))+','+
        QuotedStr(StrBatch)+','+StrCompanyId+StrToDates+',@Ordered=vhc_trans_id,@isAll='+StrisAll+';';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;
  for Count:=0 to MaxCol do begin
    for Count2:=2 to StrGrid.RowCount do begin    // reset baris ke 3
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
      StrGrid.CellStyle[Count,Count2].Font.Color:=clWindowText;
    end;
  end;

  Count:=2;
  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    for Count2:=0 to MaxCol do begin
      StrGrid.Cells[Count2,Count]:='';
      StrGrid.CellStyle[Count2,Count].HorizontalAlignment:=taLeftJustify;
    end;
    IntDiscount:=0;
    IntBiaya:=0;
    IntBiayaReimburse:=0;
    StrGrid.Cells[0,Count]:=IntToStr(Count-1);

    StrGrid.Cells[2,Count]:=Qry.FieldValues['customer_order_id'];

    StrGrid.Cells[3,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[4,Count]:=VartoStr(Qry.FieldValues['isTransfer_update_time']);
    StrGrid.Cells[5,Count]:=Qry.FieldValues['customer_name'];
    StrGrid.Cells[6,Count]:=Qry.FieldValues['route'];
    StrGrid.Cells[7,Count]:=Qry.FieldValues['body_id'];
    StrGrid.Cells[10,Count]:=VartoStr(Qry.FieldValues['from_to_dates2']); //Qry.FieldValues['helper'];
    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      StrGrid.Cells[8,Count]:=LicensePlate(Qry.FieldValues['license_plate']);
      StrGrid.Cells[9,Count]:=Qry.FieldValues['name'];

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

      TotalBBMRp_Budget:=TotalBBMRp_Budget+BBMRp_Budget;
      TotalBBMLiter_Budget:=TotalBBMLiter_Budget+BBMLiter_Budget;
      TotalBBMRp_SPBU:=TotalBBMRp_SPBU+BBMRp_SPBU;
      TotalBBMLiter_SPBU:=TotalBBMLiter_SPBU+BBMLiter_SPBU;
      TotalBBMRp_Reimburse:=TotalBBMRp_Reimburse+BBMRp_Reimburse;
      TotalBBMLiter_Reimburse:=TotalBBMLiter_Reimburse+BBMLiter_Reimburse;

      TotalBBMRp    :=BBMRp_Budget+BBMRp_SPBU+BBMRp_Reimburse;
      TotalBBMRp_All:=TotalBBMRp_All+TotalBBMRp;

      TotalBBMLiter :=BBMLiter_Budget+BBMLiter_SPBU+BBMLiter_Reimburse;
      TotalBBMLiter_All :=TotalBBMLiter_All+TotalBBMLiter;

      TotalFeeDriver:=TotalFeeDriver+(Qry.FieldValues['fee_driver']*Qry.FieldValues['day']);
      TotalFeeBusBoy:=TotalFeeBusBoy+(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day']);

      TolParkir_All := Qry.FieldValues['tol_parkir']+Qry.FieldValues['tol_parkir_tamu'];
      TotalTolParkir:=TotalTolParkir+TolParkir_All;

      Tol_All := Qry.FieldValues['tol']+Qry.FieldValues['tol_tamu'];
      TotalTol:=TotalTol+Tol_All;

      TotalFeeDriverReimburse:=TotalFeeDriverReimburse+(Qry.FieldValues['fee_driver_reimburse']); //*Qry.FieldValues['day']
      TotalFeeBusBoyReimburse:=TotalFeeBusBoyReimburse+(Qry.FieldValues['fee_busboy_reimburse']); //*Qry.FieldValues['day']
      TotalTolParkirReimburse:=TotalTolParkirReimburse+Qry.FieldValues['parkir_reimburse'];
      TotalTolReimburse:=TotalTolReimburse+Qry.FieldValues['tol_reimburse'];
      TotalOvertime := TotalOvertime+Qry.FieldValues['overtime'];

      LainLain_All := Qry.FieldValues['lain_lain']+Qry.FieldValues['tips']+Qry.FieldValues['biaya_dari_tamu'];
      TotalLain:=TotalLain+LainLain_All;

      IntBiaya:=BBMRp+(Qry.FieldValues['fee_driver']*Qry.FieldValues['day'])+(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day'])+TolParkir_All;
      IntBiayaReimburse:=(Qry.FieldValues['fee_driver_reimburse']) + (Qry.FieldValues['fee_busboy_reimburse']) + //*Qry.FieldValues['day']
                         Qry.FieldValues['parkir_reimburse'] + Qry.FieldValues['tol_reimburse'];
      TotalBiaya:=TotalBiaya+IntBiaya+IntBiayaReimburse+Tol_All+LainLain_All+Qry.FieldValues['overtime'];
      TotalBiayaExc:=TotalBiayaExc+IntBiaya+IntBiayaReimburse+Tol_All+LainLain_All+Qry.FieldValues['overtime']-BBMRp_SPBU;

      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[11,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[12,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[13,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[14,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[15,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[16,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[17,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[18,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[19,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[20,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[21,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[22,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[23,Count].WordWrap:=True;
      StrGrid.CellStyle[23,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[24,Count].WordWrap:=True;
      StrGrid.CellStyle[24,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[25,Count].WordWrap:=True;
      StrGrid.CellStyle[25,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[26,Count].WordWrap:=True;
      StrGrid.CellStyle[26,Count].HorizontalAlignment:=taRightJustify;

      StrGrid.Cells[11,Count]:=IToCurr(BBMRp_Budget);
      StrGrid.Cells[12,Count]:=IToCurr(BBMRp_SPBU);
      StrGrid.Cells[13,Count]:=IToCurr(BBMRp_Reimburse);
      StrGrid.Cells[14,Count]:=IToCurr(BBMRp);

      StrGrid.Cells[15,Count]:=IToCurr(Qry.FieldValues['fee_driver']*Qry.FieldValues['day']);
      StrGrid.Cells[16,Count]:=IToCurr(Qry.FieldValues['fee_driver_reimburse']);//*Qry.FieldValues['day']

      StrGrid.Cells[17,Count]:=IToCurr(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day']);
      StrGrid.Cells[18,Count]:=IToCurr(Qry.FieldValues['fee_busboy_reimburse']);//*Qry.FieldValues['day']

      StrGrid.Cells[19,Count]:=IToCurr(TolParkir_All);//IToCurr(Qry.FieldValues['tol_parkir']+Qry.FieldValues['tol_parkir_tamu']);
      StrGrid.Cells[20,Count]:=IToCurr(Qry.FieldValues['parkir_reimburse']);

      StrGrid.Cells[21,Count]:=IToCurr(Tol_All);//IToCurr(Qry.FieldValues['tol']+Qry.FieldValues['tol_tamu']);
      StrGrid.Cells[22,Count]:=IToCurr(Qry.FieldValues['tol_reimburse']);
      StrGrid.Cells[23,Count]:=IToCurr(LainLain_All);//IToCurr(Qry.FieldValues['lain_lain']+Qry.FieldValues['tips']+Qry.FieldValues['biaya_dari_tamu']);
      StrGrid.Cells[24,Count]:=IToCurr(Qry.FieldValues['overtime']);
       //StrGrid.Cells[25,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+Qry.FieldValues['lain_lain']+Qry.FieldValues['tol']+TotalOvertime);
      StrGrid.Cells[25,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+Tol_All+LainLain_All+Qry.FieldValues['overtime']);

      //StrGrid.Cells[25,Count]:=IToCurr(TotalOvertime);
      StrGrid.Cells[26,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+Tol_All+LainLain_All+Qry.FieldValues['overtime']-BBMRp_SPBU);
//              Qry.FieldValues['tol']+Qry.FieldValues['tol_tamu']+
//              Qry.FieldValues['lain_lain']+Qry.FieldValues['tips']+Qry.FieldValues['biaya_dari_tamu']
//              Qry.FieldValues['overtime']-BBMRp_SPBU);
//      StrGrid.Cells[25,Count]:=IToCurr(IntBiaya+IntBiayaReimburse);
//      if Qry.FieldValues['etoll_number']<>NULL then StrGrid.Cells[25,Count]:=eToll(Qry.FieldValues['etoll_number']);

     if Qry.FieldValues['isTransfer']=1 then
      begin
        for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clGreen;
      end
      else begin
        for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
      end;

    end;
    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;

  StrGrid.RowCount:=StrGrid.RowCount+2;
  for Count:=0 to 38 do begin
    StrGrid.Cells[Count,StrGrid.RowCount-1]:='';

    StrGrid.CellStyle[0,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[1,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[4,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[7,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[8,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,StrGrid.RowCount-2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[10,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;


  end;
  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  StrGrid.Cells[10,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Budget);
  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_SPBU);
  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Reimburse);
  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_All);

  {Geser 4 kolom}
  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver);
  StrGrid.Cells[16,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriverReimburse);
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoyReimburse);

  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(TotalTolParkir);
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalTolParkirReimburse);
  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(TotalTol);
  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(TotalTolReimburse);

  StrGrid.Cells[23,StrGrid.RowCount-1]:=IToCurr(TotalLain);
  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalOvertime);
  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalBiaya);
  StrGrid.Cells[26,StrGrid.RowCount-1]:=IToCurr(TotalBiayaExc);

  StrGrid.CellStyle[10,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[11,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[12,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[13,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[14,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[15,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[16,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[17,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[18,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[19,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[21,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[22,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[23,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[25,StrGrid.RowCount-1].BGColor:=clSilver;
  StrGrid.CellStyle[26,StrGrid.RowCount-1].BGColor:=clSilver;

  StrGrid.CellStyle[11,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[12,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[13,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[14,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[15,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[16,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[17,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[18,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[19,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[20,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[21,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[22,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[23,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[24,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[25,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  StrGrid.CellStyle[26,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
  Main.M_Normal;
end;

procedure TTransferUangHarianDriver.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TTransferUangHarianDriver.RefreshClick(Sender: TObject);
begin
  RefreshData;
  StrGrid.Enabled:=True;
end;

procedure TTransferUangHarianDriver.chk1Click(Sender: TObject);
var
  intCount:Integer;
begin
    //StrGrid.Cells[IntCol,IntRow]:='v';
    if chk1.Checked=false then begin
      for intCount:=1 to StrGrid.RowCount-1 do begin
        StrGrid.Cells[1,intCount]:='';
      end;
    end else begin
      for intCount:=1 to StrGrid.RowCount-2 do begin
        if (StrGrid.Cells[26,intCount])<>'Sudah Transfer' then begin
          StrGrid.Cells[1,intCount]:='v';
        end;
      end;
    end;
end;

procedure TTransferUangHarianDriver.StrGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
    if (StrGrid.Cells[4,ARow]='')  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        1 :with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;
//  end;

end;

procedure TTransferUangHarianDriver.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;

end;

procedure TTransferUangHarianDriver.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrIsIntegrate,StrVhcTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    if Main.OpenDb then begin
      Main.TransStart;
      for IntCount:=1 to StrGrid.RowCount-1 do begin
        if StrGrid.Cells[1,IntCount]='v' then begin
          StrVhcTransId:=QuotedStr(StrGrid.Cells[3,IntCount]);

          StrQry:=' UPDATE wh_vhc_trans SET isTransfer=1,isTransfer_update_time=GETDATE() '+
                  ' WHERE vhc_trans_id='+StrVhcTransId+';';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Simpan Checklist Integrate';
              StrException:=E.Message;
            end;
          end;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan Ceklist Transfer Uang Harian Driver','',MB_OK or MB_ICONINFORMATION);
        RefreshData;
        //Init;
        //InitGrid;
        //RefreshCombo;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Checklist Integrate',MB_OK or MB_ICONERROR);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
end;

procedure TTransferUangHarianDriver.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

end.
