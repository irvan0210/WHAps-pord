unit CheckListIntegrateHppU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, ADODB, WHUnit,
  ZColorStringGrid, ExtCtrls;

type
  TCheckListIntegrateHpp = class(TForm)
    Tanggal: TDateTimePicker;
    Label1: TLabel;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Batch: TComboBox;
    Label3: TLabel;
    Refresh: TButton;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    TotalUnitOperasi: TEdit;
    StrGrid: TZColorStringGrid;
    Panel1: TPanel;
    GroupDisp: TEdit;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    isAll: TComboBox;
    Label6: TLabel;
    CheckSelect: TCheckBox;
    Simpan: TButton;
    lbl1: TLabel;
    chk1: TCheckBox;
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
    procedure CheckSelectClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
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
    function getCompletedSJ:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Is_Input:Boolean=False;Is_Integrate:Smallint=-1; Titel:String='');Overload;
  end;

var
  CheckListIntegrateHpp: TCheckListIntegrateHpp;

implementation

uses MainU, OrderFormU, VehicleFormU, OrderFeeU, AuthorizedFormU,
  SPJFormBusU;

{$R *.dfm}

constructor TCheckListIntegrateHpp.Create(AOwner:TComponent;Is_Input:Boolean=False;Is_Integrate:Smallint=-1; Titel:String='');
begin
  Initiation:=True;
  IsInput:=Is_Input;
  IsIntegrate:=Is_Integrate;
  StrTitel:=Titel;

  inherited Create(AOwner);
end;

procedure TCheckListIntegrateHpp.Init;
var Count,Count2:Integer;
    Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  MaxCol:=27;
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
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=190505';
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

procedure TCheckListIntegrateHpp.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=3;

  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=35;
  StrGrid.ColWidths[2]:=95;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=200;
  StrGrid.ColWidths[6]:=55;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=85;
  StrGrid.ColWidths[9]:=95;
  StrGrid.ColWidths[10]:=130;
  StrGrid.ColWidths[11]:=130;
  StrGrid.ColWidths[12]:=130;
  StrGrid.ColWidths[13]:=130;
  StrGrid.ColWidths[14]:=60;
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
  StrGrid.ColWidths[25]:=95;
  StrGrid.ColWidths[26]:=80;
  StrGrid.ColWidths[27]:=120;


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
  StrGrid.MergeCells.AddRectXY(10,0,10,0);

  StrGrid.MergeCells.AddRectXY(11,0,11,0);
  StrGrid.MergeCells.AddRectXY(12,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,13,0);
  StrGrid.MergeCells.AddRectXY(14,0,15,0);

  StrGrid.MergeCells.AddRectXY(16,0,17,0);
  StrGrid.MergeCells.AddRectXY(18,0,19,0);
  StrGrid.MergeCells.AddRectXY(20,0,21,0);
  StrGrid.MergeCells.AddRectXY(22,0,22,1);

  StrGrid.MergeCells.AddRectXY(23,0,23,1);
  StrGrid.MergeCells.AddRectXY(24,0,24,1);
  StrGrid.MergeCells.AddRectXY(25,0,25,1);
  StrGrid.MergeCells.AddRectXY(26,0,26,1);
  StrGrid.MergeCells.AddRectXY(27,0,27,1);


  StrGrid.CellStyle[24,0].WordWrap:=True;       {(Inc Tol&Lain2)}
  StrGrid.CellStyle[25,0].WordWrap:=True;       {(Exc Tol&Lain2)}

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Cek';
  StrGrid.Cells[2,0]:='No Resv';
  StrGrid.Cells[3,0]:='No SJ';
  StrGrid.Cells[4,0]:='Customer';
  StrGrid.Cells[5,0]:='Rute';
  StrGrid.Cells[6,0]:='No Body';
  StrGrid.Cells[7,0]:='No Polisi';
  StrGrid.Cells[8,0]:='Driver';
  StrGrid.Cells[9,0]:='Keberangkatan';
//  StrGrid.Cells[9,0]:='BusBoy';

  StrGrid.Cells[10,0]:='BBM Budget';
  StrGrid.Cells[10,1]:='BBM(Rp)';
  StrGrid.Cells[11,0]:='BBM SPBU';
  StrGrid.Cells[11,1]:='BBM(Rp)';
  StrGrid.Cells[12,0]:='BBM Reimburse';
  StrGrid.Cells[12,1]:='BBM(Rp)';
  StrGrid.Cells[13,0]:='Total BBM';
  StrGrid.Cells[13,1]:='(Rp)';
  {Geser 4 kolom}
  StrGrid.Cells[14,0]:='Fee Driver';
  StrGrid.Cells[14,1]:='Budget';
  StrGrid.Cells[15,1]:='Reimburse';

  StrGrid.Cells[16,0]:='Fee Kenek';
  StrGrid.Cells[16,1]:='Budget';
  StrGrid.Cells[17,1]:='Reimburse';


  StrGrid.Cells[18,0]:='Parkir';
  StrGrid.Cells[18,1]:='Budget';
  StrGrid.Cells[19,1]:='Reimburse';

  StrGrid.Cells[20,0]:='Toll';
  StrGrid.Cells[20,1]:='Budget';
  StrGrid.Cells[21,1]:='Reimburse';


  StrGrid.Cells[22,0]:='Lain2';//No E-Toll   Asal 22
  StrGrid.Cells[23,0]:='Overtime';//No E-Toll   Asal 22
  StrGrid.Cells[24,0]:='Total';//'Lain2';
  StrGrid.Cells[25,0]:='Total          (Exc BBM SPBU)';
  StrGrid.Cells[26,0]:='Status SJ';//'No E-Toll';
  StrGrid.Cells[27,0]:='Jenis Service';



  for IntCount:=0 to MaxCol do begin
    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[IntCount,1].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,1].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,2]:='';
  end;
end;


procedure TCheckListIntegrateHpp.RefreshCombo;
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

procedure TCheckListIntegrateHpp.RefreshData;
var QStr,StrBatch,StrLocationId,StrCompanyId,StrToDates,StrisAll:String;
    StrIsIntegrate:string;
    Qry, Qry2, QryCek:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,Total6,Total7,TotalOperasi,IntDiscount:Integer;
    BBMLiter,GasLiter,BBMRp,GasRp:Integer;
    BBMLiterSingle:Single;

    BBMLiter_Budget,BBMRp_Budget,BBMLiter_SPBU,BBMRp_SPBU,BBMLiter_Reimburse,BBMRp_Reimburse:Integer;
    BBMLiterSingle_Budget,BBMLiterSingle_SPBU,BBMLiterSingle_Reimburse:Single;

    TotalBBMRp,TotalBBMRp_Budget,TotalBBMRp_SPBU,TotalBBMRp_Reimburse,TotalBBMRp_All,TotalFeeDriver,TotalFeeBusBoy,TotalTolParkir,TotalTol,TotalLain,TotalBiaya,TotalBiayaExc,IntBiaya:Int64;
    TotalFeeDriverReimburse,TotalFeeBusBoyReimburse,TotalTolParkirReimburse,TotalTolReimburse,IntBiayaReimburse,TotalOvertime :Int64;
    TotalBBMLiter, TotalBBMLiter_Budget,TotalBBMLiter_SPBU,TotalBBMLiter_Reimburse,TotalBBMLiter_All:Double;
    Tolparkir_All,Tol_All,LainLain_All:Int64;
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

  Tolparkir_All :=0;
  Tol_All:=0;
  LainLain_All:=0;

  TotalFeeDriver:=0;
  TotalFeeBusBoy:=0;
  TotalTolParkir:=0;
  TotalLain:=0;
  TotalOvertime:=0;
  TotalOperasi:=0;
  TotalBiaya:=0;
  TotalBiayaExc:=0;

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
        QuotedStr(StrBatch)+','+StrCompanyId+StrToDates+',@Ordered=vhc_trans_id,@isAll='+StrisAll+StrIsIntegrate+';';
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
    Try
      StrGrid.Cells[2,Count]:=Qry.FieldValues['customer_order_id'];
    Except On E:Exception do Begin
          Main.WriteTableLog('Lap Uang Harian Driver', VarToStr(Qry.FieldValues['vhc_trans_id']), 'Error Muncul NULL');
          QStr := 'SELECT Count(*) as JML FROM wh_reserved_order_detail WHERE vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
          QryCek.SQL.Clear;
          QryCek.SQL.Add(QStr);
          QryCek.Open;
          If (QryCek.Fields.FieldByName('jml').AsInteger)=0 Then begin
            QStr := 'UPDATE wh_vhc_trans SET cancel=1 WHERE Coalesce(cancel, 0)=0 AND vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
            QryCek.SQL.Clear;
            QryCek.SQL.Add(QStr);
            QryCek.ExecSQL;
          end else begin
            QStr := 'UPDATE wh_reserved_order_detail SET Status=1 WHERE Status=0 AND vhc_trans_id='+QuotedStr(Qry.FieldValues['vhc_trans_id']);
            QryCek.SQL.Clear;
            QryCek.SQL.Add(QStr);
            QryCek.ExecSQL;
          end;
      end;
    End;
    StrGrid.Cells[3,Count]:=Qry.FieldValues['vhc_trans_id'];
    StrGrid.Cells[4,Count]:=Qry.FieldValues['customer_name'];
    StrGrid.Cells[5,Count]:=Qry.FieldValues['route'];
    StrGrid.Cells[6,Count]:=Qry.FieldValues['body_id'];
    StrGrid.Cells[9,Count]:=VartoStr(Qry.FieldValues['from_to_dates2']); //Qry.FieldValues['helper'];
    if Qry.FieldValues['employee_id']<>NULL then begin
      Inc(TotalOperasi);
      StrGrid.Cells[7,Count]:=LicensePlate(Qry.FieldValues['license_plate']);
      StrGrid.Cells[8,Count]:=Qry.FieldValues['name'];

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

      Tolparkir_All := Qry.FieldValues['tol_parkir']+Qry.FieldValues['tol_parkir_tamu'];
      TotalTolParkir:=TotalTolParkir+Tolparkir_All;

      Tol_All := Qry.FieldValues['tol']+Qry.FieldValues['tol_tamu'];
      TotalTol:=TotalTol+Tol_All;

      TotalOvertime:=TotalOvertime+Qry.FieldValues['overtime'];

      TotalFeeDriverReimburse:=TotalFeeDriverReimburse+(Qry.FieldValues['fee_driver_reimburse']); //*Qry.FieldValues['day']
      TotalFeeBusBoyReimburse:=TotalFeeBusBoyReimburse+(Qry.FieldValues['fee_busboy_reimburse']); //*Qry.FieldValues['day']
      TotalTolParkirReimburse:=TotalTolParkirReimburse+Qry.FieldValues['parkir_reimburse'];
      TotalTolReimburse:=TotalTolReimburse+Qry.FieldValues['tol_reimburse'];

      LainLain_All :=Qry.FieldValues['lain_lain']+Qry.FieldValues['tips']
                    +Qry.FieldValues['biaya_dari_tamu']+Qry.FieldValues['insentif']
                    +Qry.FieldValues['uang_joss']+Qry.FieldValues['uang_tuslah'];
      TotalLain:=TotalLain+LainLain_All;

      IntBiaya:=BBMRp+(Qry.FieldValues['fee_driver']*Qry.FieldValues['day'])+(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day'])+Tolparkir_All;
      IntBiayaReimburse:=(Qry.FieldValues['fee_driver_reimburse']) + (Qry.FieldValues['fee_busboy_reimburse']) + //*Qry.FieldValues['day']
                         Qry.FieldValues['parkir_reimburse'] + Qry.FieldValues['tol_reimburse'];
      TotalBiaya:=TotalBiaya+IntBiaya+IntBiayaReimburse+LainLain_All+Tol_All+Qry.FieldValues['overtime'];
      TotalBiayaExc:=TotalBiayaExc+IntBiaya+IntBiayaReimburse;

      StrGrid.CellStyle[9,Count].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[10,Count].HorizontalAlignment:=taRightJustify;
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
      StrGrid.CellStyle[22,Count].WordWrap:=True;
      StrGrid.CellStyle[22,Count].HorizontalAlignment:=taRightJustify;

      StrGrid.CellStyle[23,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[24,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[25,Count].HorizontalAlignment:=taRightJustify;
      StrGrid.CellStyle[26,Count].WordWrap:=True;
//      StrGrid.CellStyle[27,Count].HorizontalAlignment:=taRightJustify;

      StrGrid.Cells[10,Count]:=IToCurr(BBMRp_Budget);
      StrGrid.Cells[11,Count]:=IToCurr(BBMRp_SPBU);
      StrGrid.Cells[12,Count]:=IToCurr(BBMRp_Reimburse);
      StrGrid.Cells[13,Count]:=IToCurr(BBMRp);

      StrGrid.Cells[14,Count]:=IToCurr(Qry.FieldValues['fee_driver']*Qry.FieldValues['day']);
      StrGrid.Cells[15,Count]:=IToCurr(Qry.FieldValues['fee_driver_reimburse']);//*Qry.FieldValues['day']

      StrGrid.Cells[16,Count]:=IToCurr(Qry.FieldValues['fee_busboy']*Qry.FieldValues['day']);
      StrGrid.Cells[17,Count]:=IToCurr(Qry.FieldValues['fee_busboy_reimburse']);//*Qry.FieldValues['day']

      StrGrid.Cells[18,Count]:=IToCurr(Tolparkir_All);//IToCurr(Qry.FieldValues['tol_parkir']);
      StrGrid.Cells[19,Count]:=IToCurr(Qry.FieldValues['parkir_reimburse']);

      StrGrid.Cells[20,Count]:=IToCurr(Tol_All);//IToCurr(Qry.FieldValues['tol']);
      StrGrid.Cells[21,Count]:=IToCurr(Qry.FieldValues['tol_reimburse']);
      StrGrid.Cells[22,Count]:=IToCurr(LainLain_All);//IToCurr(Qry.FieldValues['lain_lain']);
      StrGrid.Cells[23,Count]:=IToCurr(Qry.FieldValues['overtime']);


      StrGrid.Cells[24,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+LainLain_All+Tol_All+Qry.FieldValues['overtime']);
      StrGrid.Cells[25,Count]:=IToCurr(IntBiaya+IntBiayaReimburse+LainLain_All+Tol_All+Qry.FieldValues['overtime']-BBMRp_SPBU);
//      if Qry.FieldValues['etoll_number']<>NULL then StrGrid.Cells[25,Count]:=eToll(Qry.FieldValues['etoll_number']);

      StrGrid.Cells[26,Count]:=VarToStr(Qry.FieldValues['status_sj']);
  {    if LowerCase(Trim(StrGrid.Cells[26,Count]))<>'completed' then begin
        for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clRed;
      end else begin
        for Count2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
      end; }

      if Qry.FieldValues['JenisService']<>NULL then StrGrid.Cells[27,Count]:=VartoStr(Qry.FieldValues['JenisService']);

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
    StrGrid.CellStyle[9,StrGrid.RowCount-2].HorizontalAlignment:=taCenter;


  end;
  TotalUnitOperasi.Text:=IntToStr(TotalOperasi);
  StrGrid.Cells[9,StrGrid.RowCount-1]:='Total';
  StrGrid.Cells[10,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Budget);
  StrGrid.Cells[11,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_SPBU);
  StrGrid.Cells[12,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_Reimburse);
  StrGrid.Cells[13,StrGrid.RowCount-1]:=IToCurr(TotalBBMRp_All);

  {Geser 4 kolom}
  StrGrid.Cells[14,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriver);
  StrGrid.Cells[15,StrGrid.RowCount-1]:=IToCurr(TotalFeeDriverReimburse);
  StrGrid.Cells[16,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoy);
  StrGrid.Cells[17,StrGrid.RowCount-1]:=IToCurr(TotalFeeBusBoyReimburse);

  StrGrid.Cells[18,StrGrid.RowCount-1]:=IToCurr(TotalTolParkir);
  StrGrid.Cells[19,StrGrid.RowCount-1]:=IToCurr(TotalTolParkirReimburse);
  StrGrid.Cells[20,StrGrid.RowCount-1]:=IToCurr(TotalTol);
  StrGrid.Cells[21,StrGrid.RowCount-1]:=IToCurr(TotalTolReimburse);

  StrGrid.Cells[22,StrGrid.RowCount-1]:=IToCurr(TotalLain);
  StrGrid.Cells[23,StrGrid.RowCount-1]:=IToCurr(TotalOvertime);
  StrGrid.Cells[24,StrGrid.RowCount-1]:=IToCurr(TotalBiaya);
  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalBiaya-TotalBBMRp_SPBU);
//  StrGrid.Cells[25,StrGrid.RowCount-1]:=IToCurr(TotalBiayaExc+TotalOvertime);

  StrGrid.CellStyle[9,StrGrid.RowCount-1].BGColor:=clSilver;
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

  StrGrid.CellStyle[10,StrGrid.RowCount-1].HorizontalAlignment:=taRightJustify;
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

  {if LowerCase(Trim( StrGrid.Cells[26,Count] ))<>'completed' then begin
    for Count2:=0 to StrGrid.ColCount-1 do
    begin
      StrGrid.CellStyle[Count2,Count].Font.Color:=clRed;
    end;

  end else begin
    for Count2:=0 to StrGrid.ColCount-1 do
    begin
      StrGrid.CellStyle[Count2,Count].Font.Color:=clWindowText;
    end;
  end; }
  for Count:=2 to StrGrid.RowCount-1 do
  begin
    if LowerCase(Trim(StrGrid.Cells[26,Count]))<>'completed' then
    begin
     if Count = StrGrid.RowCount - 1 then Continue;
     for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.CellStyle[Count2,Count].font.Color := clRed;
      end;
    end;
  end;

  Main.M_Normal;
end;

procedure TCheckListIntegrateHpp.SelesaiClick(Sender: TObject);
begin
   Close;
end;

procedure TCheckListIntegrateHpp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCheckListIntegrateHpp.RefreshClick(Sender: TObject);
begin
  RefreshData;
  StrGrid.Enabled:=True;
end;

procedure TCheckListIntegrateHpp.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

procedure TCheckListIntegrateHpp.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TCheckListIntegrateHpp.BatchChange(Sender: TObject);
begin
  GroupDisp.Text:=GroupArr[Batch.ItemIndex][1];
end;

procedure TCheckListIntegrateHpp.StrGridDblClick(Sender: TObject);
var IsAuth:Boolean;
begin
{
  if IntRow>0 then begin
    Case IntCol of
      0,1:if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False);
      2:begin
          IsAuth:=True;
          AuthorizedForm.FormId:='19040101';
          AuthorizedForm.StrMessage:=' Pencetakan Surat Jalan Kembali ';
          if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
          Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
          if IsAuth=True then begin
            if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(Self,StrGrid.Cells[2,IntRow],False)
          end else if Main.IsFormOpen('OrderFee')=False then OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],False);
        end;
      3..15:if Main.IsFormOpen('OrderFee')=False then OrderFee:=TOrderFee.Create(Self,StrGrid.Cells[2,IntRow],False);
    end;
  end;
}  
end;

procedure TCheckListIntegrateHpp.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
  if (IsInput) then begin
    if (ARow > MinRowGrid) And (StrGrid.Cells[0,ARow]<>'')  then begin
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
  end;


end;

procedure TCheckListIntegrateHpp.CekTglSampaiClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

procedure TCheckListIntegrateHpp.CheckSelectClick(Sender: TObject);
begin
{
  if IntCol=1 then begin
    if StrGrid.Cells[1,IntRow]='v' then CheckSelect.Checked:=True
    else CheckSelect.Checked:=False;
  end;
}
end;

Function TCheckListIntegrateHpp.getCompletedSJ:Boolean;
begin

end;

procedure TCheckListIntegrateHpp.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end; 

  if StrGrid.Cells[IntCol,IntRow]='v' then begin
    //ShowMessage(Trim(StrGrid.Cells[25, IntRow]));
    if LowerCase(Trim(StrGrid.Cells[26,IntRow]))<>'completed' then begin
      if StrGrid.Cells[IntCol,IntRow]='v' then begin
        StrGrid.Cells[IntCol,IntRow]:='';
        MessageBox(0,PChar('No SJ '+StrGrid.Cells[3, IntRow]+' Belum COMPLETED (Input Armada Masuk/Keluar) !!! '),'Checklist Integrate',MB_OK or MB_ICONWARNING);
      end;
    end;
  end;
  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;

end;

procedure TCheckListIntegrateHpp.SimpanClick(Sender: TObject);
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

          StrQry:=' UPDATE wh_vhc_trans SET isIntegrate=1, isIntegrate_update_time=GETDATE() '+
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
        MessageBox(0,'Berhasil menyimpan CheckList Integrate','Checklist Integrate',MB_OK or MB_ICONINFORMATION);
        StrGrid.Enabled:=False;
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

procedure TCheckListIntegrateHpp.chk1Click(Sender: TObject);
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
        if LowerCase(Trim(StrGrid.Cells[26,intCount]))='completed' then begin
          StrGrid.Cells[1,intCount]:='v';
        end;
      end;
    end;
end;

end.
