unit BudgetVehicleFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB, ComCtrls, WHUnit, ExtCtrls, Grids,
  ZColorStringGrid, Jpeg, Buttons, Math;

type
  TBudgetVehicleForm = class(TForm)
    Simpan: TButton;
    Selesai: TButton;
    Bersihkan: TButton;
    GroupInput: TGroupBox;
    Panel2: TPanel;
    GroupNoUjiKir: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    GroupRupiah: TGroupBox;
    BusBoyFee: TMemo;
    TollParking: TMemo;
    StayNightDriver: TMemo;
    DriverFee: TMemo;
    BBMRupiah: TMemo;
    Toll: TMemo;
    GroupLiter: TGroupBox;
    BBMLiter: TEdit;
    SBU: TComboBox;
    Label16: TLabel;
    Label13: TLabel;
    PanelKategori: TPanel;
    Label14: TLabel;
    Label24: TLabel;
    Category: TComboBox;
    TripType: TComboBox;
    Label22: TLabel;
    Label12: TLabel;
    StayNightHelper: TMemo;
    lbl1: TLabel;
    Seat: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    isActive: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure TripTypeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TripTypeChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure BBMRupiahEnter(Sender: TObject);
    procedure BBMRupiahExit(Sender: TObject);
    procedure BBMRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure BBMLiterEnter(Sender: TObject);
    procedure BBMLiterExit(Sender: TObject);
    procedure BBMLiterKeyPress(Sender: TObject; var Key: Char);
    procedure DriverFeeEnter(Sender: TObject);
    procedure DriverFeeExit(Sender: TObject);
    procedure DriverFeeKeyPress(Sender: TObject; var Key: Char);
    procedure BusBoyFeeEnter(Sender: TObject);
    procedure BusBoyFeeExit(Sender: TObject);
    procedure BusBoyFeeKeyPress(Sender: TObject; var Key: Char);
    procedure TollEnter(Sender: TObject);
    procedure TollExit(Sender: TObject);
    procedure TollKeyPress(Sender: TObject; var Key: Char);
    procedure TollParkingEnter(Sender: TObject);
    procedure TollParkingExit(Sender: TObject);
    procedure TollParkingKeyPress(Sender: TObject; var Key: Char);
    procedure StayNightDriverEnter(Sender: TObject);
    procedure StayNightDriverExit(Sender: TObject);
    procedure StayNightDriverKeyPress(Sender: TObject; var Key: Char);
    procedure Calculate;
    procedure StayNightHelperKeyPress(Sender: TObject; var Key: Char);
    procedure StayNightHelperEnter(Sender: TObject);
    procedure StayNightHelperExit(Sender: TObject);
    procedure CategoryChange(Sender: TObject);
  private
    { Private declarations }
    CategoryArr,TripArr,SeatArr:Array of TArrString2;
    CompanyArr:array of TArrString8;
    IsReadOnly:Boolean;
    VhcDetailId,BodyId:String;
    CompId:Integer;
    VhcType:Integer;
    SolarPerLiter,BBMPerLiter,GasPerLiter:Integer;
    BudgetId:String;
    BudgetCode:String;
    IsInput,Initiation:Boolean;
    procedure Init;
    procedure RefreshCompany;

    procedure RefreshJenis;
    procedure RefreshCategory;
    procedure LoadData;

    procedure DisableInput;
    procedure EnableInput;
    procedure RefreshSeat;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Budget_Id:String;IsRead_Only:Boolean=True);Overload;
  end;

var
  BudgetVehicleForm: TBudgetVehicleForm;

implementation

{$R *.dfm}

Uses MainU, VehicleEquipmentCheckU, DB, ImageViewerU, EmployeeFormU;

constructor TBudgetVehicleForm.Create(AOwner:TComponent;Budget_Id:String;IsRead_Only:Boolean=True);
begin
  BudgetCode:='BDG';
  BudgetId:=Budget_Id;
  if BudgetId='' then IsReadOnly:=False
  else IsReadOnly:=IsRead_Only;
  inherited Create(AOwner);
end;

procedure TBudgetVehicleForm.Init;
begin
  BBMRupiah.Text:='';
  BBMLiter.Text:='';
  DriverFee.Text:='';
  BusBoyFee.Text:='';
  Toll.Text:='';
  TollParking.Text:='';
  StayNightDriver.Text:='';
  StayNightHelper.Text:='0';
  isActive.Checked:=False;
  PanelKategori.Enabled:=True;

  Category.Items.Clear;
  Category.Text:='';
  SolarPerLiter:=0;
end;



procedure TBudgetVehicleForm.RefreshCompany;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  SetLength(CompanyArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Qry.SQL.Add(StrQry);
    Main.WriteLog('SQL :'+StrQry,2);
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
  if StrToInt(CompanyId)>1 then SBU.Enabled:=False;
  Main.M_Normal;
end;

procedure TBudgetVehicleForm.RefreshJenis;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrGroup:String;
    IntCount:Integer;
begin
  SetLength(CategoryArr,0);
  SetLength(TripArr,0);
  TripType.Items.Clear;
  TripType.Text:='';
  Category.Items.Clear;
  Category.Text:='';

  Main.M_Busy;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];

      Qry.SQL.Clear;
      QStr:='exec GetTripType;';
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(TripArr,IntCount+1);
        TripArr[IntCount][0]:=Qry.FieldValues['trip_type_id'];
        TripArr[IntCount][1]:=ToString(Qry.FieldValues['trip_type_name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
      QStr:='EXEC GetPrice;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+QStr,2);
      Qry.SQL.Add(QStr);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        SolarPerLiter:=Qry.FieldValues['diesel_price_litre'];
        BBMPerLiter:=Qry.FieldValues['fuel_price_litre'];
        GasPerLiter:=Qry.FieldValues['gas_price_litre'];
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;

  for IntCount:=0 to Length(TripArr)-1 do
    TripType.Items.Add(TripArr[IntCount][1]);

  Main.M_Normal;

end;

procedure TBudgetVehicleForm.RefreshSeat;
var QStr,StrCompanyId,StrCategoryID:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Category.Text<>'All') then begin
    StrCategoryID:=CategoryArr[Category.ItemIndex][0];
    QStr:='select DISTINCT seat from wh_vhc_type_detail where '+
          'category_seg2='+QuotedStr(StrCategoryID)+' AND company_id='+CompanyId+' AND active=1 ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TBudgetVehicleForm.RefreshCategory;
var Qry:TADOQuery;
    QStr,StrCompanyId,StrLocationId,StrJenis:String;
    IntCount:Integer;
begin
    SetLength(CategoryArr,0);
    Category.Items.Clear;
    Category.Text:='';

    Main.M_Busy;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Qry.SQL.Clear;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
      StrLocationId:=CompanyArr[SBU.ItemIndex][2];
      //StrJenis:=
      Qry.SQL.Clear;
      if BudgetId='' then
      begin
        QStr:='exec GetVehicleCategory '+StrCompanyId+','+StrLocationId+';'
      end;
//      else begin
//        StrJenis := TripArr[TripType.ItemIndex][0];
//        QStr:='exec GetVehicleCategory '+StrCompanyId+','+StrLocationId+','+StrJenis+';';
//      end;
      Qry.SQL.Add(QStr);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        SetLength(CategoryArr,IntCount+1);
        CategoryArr[IntCount][0]:=Qry.FieldValues['category_id'];
        CategoryArr[IntCount][1]:=ToString(Qry.FieldValues['category_name']);
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    End;
    for IntCount:=0 to Length(CategoryArr)-1 do
      Category.Items.Add(CategoryArr[IntCount][1]);

    Main.M_Normal;
end;

procedure TBudgetVehicleForm.FormShow(Sender: TObject);
var Count:Integer;
begin
  Init;
  RefreshCompany;
  RefreshJenis;

  isActive.Visible := False;
  if (BudgetId<>'') then begin
    PanelKategori.Enabled:= False;
    Bersihkan.Enabled:= False;
    isActive.Visible := True;
//    RefreshCategory;
    LoadData;
  end else begin
    RefreshCategory;
  end;
  if IsReadOnly=True then begin
    DisableInput;
  end;

end;

procedure TBudgetVehicleForm.LoadData;
var IntCount:Integer;
    StrQry,VhcTypeDetailImageTypeId,VhcTypeDetailId,VhcOwner,Karoseri,Dealer,GPCode:String;
    Qry:TADOQuery;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleBudgetDetail '+QuotedStr(BudgetId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      TripType.Items.Clear;
      TripType.Items.Add(Qry.FieldValues['trip_type_name']);
      TripType.ItemIndex:=0;
      Category.Items.Clear;
      Category.Items.Add(Qry.FieldValues['category_name']);
      Category.ItemIndex:=0;
      Seat.Items.Clear;
      Seat.Items.Add(Qry.FieldValues['seat']);
      Seat.ItemIndex:=0;
      BBMRupiah.Text:=Qry.FieldValues['fuel_price'];
      BBMLiter.Text:=Qry.FieldValues['fuel_litre'];
      DriverFee.Text:=Qry.FieldValues['driver'];
      BusBoyFee.Text:=Qry.FieldValues['helper'];
      Toll.Text:=Qry.FieldValues['toll'];
      TollParking.Text:=Qry.FieldValues['parkir'];
      StayNightDriver.Text:=Qry.FieldValues['overnight_driver'];
      //StayNightHelper.Text:=Qry.FieldValues['overnight_helper'];
      if Qry.FieldValues['status']='1' then isActive.Checked:=True;
      PanelKategori.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  //Jenis.ItemIndex:=ArrayIndexOf(JenisArr,VhcTypeDetailId,0);
  Main.M_Normal;
end;



procedure TBudgetVehicleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBudgetVehicleForm.SelesaiClick(Sender: TObject);
begin
  BudgetVehicleForm.Close;
end;

procedure TBudgetVehicleForm.SimpanClick(Sender: TObject);
var QVhc:TADOQuery;
    StrQry,StrNewId,StrLocationId,StrCompanyId,StrTripId,StrCategory,StrStatus:String;
    Ok,NoRecord:Boolean;
    NewId,Status:Integer;
begin
  Ok:=True;
  if ( ((Trim(BBMRupiah.Text)<>'') OR (Trim(BBMRupiah.Text)<>'0')) AND
       ((Trim(DriverFee.Text)<>'') OR (Trim(DriverFee.Text)<>'0')) AND
       ((Trim(BusBoyFee.Text)<>'') OR (Trim(BusBoyFee.Text)<>'0'))
     ) then begin
    QVhc:=TADOQuery.Create(Self);
    QVhc.Connection:=Main.MyConnection;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];

    if BudgetId='' then begin
      StrTripId:=tripArr[TripType.ItemIndex][0];
      StrCategory:=CategoryArr[Category.ItemIndex][0];
    end;

    if Main.OpenDb then begin
      Main.TransStart;
      DisableInput;

      StrQry:='SELECT * FROM wh_vhc_budget WHERE (trip_type_id='+QuotedStr(StrTripId)+')'+
              ' AND (category_id='+QuotedStr(StrCategory)+') AND '+
              '(seat='+QuotedStr(Seat.Text)+') AND '+
              ' (location_id='+QuotedStr(StrLocationId)+') AND (company_id='+QuotedStr(StrCompanyId)+') AND (status=1);';

      QVhc.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      QVhc.SQL.Add(StrQry);
      QVhc.Open;
      if QVhc.RecordCount<1 then begin
        NoRecord:=True;
      end else begin
        NoRecord:=False;
      end;
      if (NoRecord=True) OR (BudgetId<>'') then begin
        StrQry:='SELECT RIGHT(MAX(vehicle_budget_id),4) AS vehicle_budget_id FROM wh_vhc_budget '+
              'WHERE company_id='+QuotedStr(StrCompanyId)+' AND vehicle_budget_id LIKE '+Chr(39)+BudgetCode+StrCompanyId+
              FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+'____'+Chr(39)+';';
        QVhc.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        QVhc.SQL.Add(StrQry);
        QVhc.Open;
        if QVhc.FieldValues['vehicle_budget_id']<>NULL then begin
           NewId:=QVhc.FieldValues['vehicle_budget_id'];
           StrNewId:=Format('%.*d',[4,NewId+1]);
        end else begin
           StrNewId:='0001';
        end;
        QVhc.Close;
        StrNewId:=BudgetCode+StrCompanyId+FormatDateTime('yy',Now())+FormatDateTime('mm',Now())+StrNewId;

        if isActive.Visible then if isActive.Checked=True then StrStatus:='1' else StrStatus:='';

        if (BudgetId='') then begin

          StrQry:='INSERT INTO wh_vhc_budget '+
                '(vehicle_budget_id, company_id, location_id, trip_type_id, category_id, '+
                ' fuel_price, fuel_litre, driver, helper, toll, parkir, overnight_driver, overnight_helper, status, update_user,seat)'+
                'VALUES ('+QuotedStr(StrNewId)+','+QuotedStr(StrCompanyId)+','+QuotedStr(StrLocationId)+
                ','+QuotedStr(Trim(StrTripId))+','+QuotedStr(Trim(StrCategory))+
                ','+QuotedStr(ToString(BBMRupiah.Text))+','+QuotedStr(StringReplace(ToString(BBMLiter.Text),',','.',[rfReplaceAll]))+
                ','+QuotedStr(ToString(DriverFee.Text))+','+QuotedStr(ToString(BusBoyFee.Text))+','+QuotedStr(ToString(Toll.Text))+','+QuotedStr(ToString(TollParking.Text))+
                ','+QuotedStr(ToString(StayNightDriver.Text))+
                ','+QuotedStr(ToString(StayNightHelper.Text))+
                ', 1'+
                ','+QuotedStr(User)+','+QuotedStr(Seat.Text)+');';

        end else begin
          StrQry:='UPDATE wh_vhc_budget SET '+
                'fuel_price='+QuotedStr(ToString(BBMRupiah.Text))+
                ',fuel_litre='+QuotedStr(StringReplace(ToString(BBMLiter.Text),',','.',[rfReplaceAll]))+
                ',driver='+QuotedStr(ToString(DriverFee.Text))+
                ',helper='+QuotedStr(ToString(BusBoyFee.Text))+
                ',toll='+QuotedStr(ToString(Toll.Text))+
                ',parkir='+QuotedStr(ToString(TollParking.Text))+
                ',overnight_driver='+QuotedStr(ToString(StayNightDriver.Text))+
                ',overnight_helper='+QuotedStr(ToString(StayNightHelper.Text))+
                ',status='+QuotedStr(StrStatus)+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vehicle_budget_id='+QuotedStr(BudgetId)+';';
        end;
        QVhc.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        QVhc.SQL.Add(StrQry);
        try
          QVhc.ExecSQL;
        except
          on E:Exception do Ok:=False;
        end;

        if Ok then begin
          Main.TransCommit;
          MessageBox(0,'Penambahan/Perubahan Armada Berhasil','Tambah Armada',MB_OK or MB_ICONINFORMATION);
          if BudgetId='' then Bersihkan.SetFocus;
        end else begin
          Main.TransRollback;
          MessageBox(0,'Penambahan/Perubahan Armada Gagal','Rubah Armada',MB_OK or MB_ICONWARNING);
          EnableInput;
        end;
        QVhc.Close;
      end else begin
        MessageBox(0,'Data Budget Sudah Ada','Tambah Armada',MB_OK or MB_ICONWARNING);
      end;
    end;
    QVhc.Destroy;
    Main.CloseDb;
  end;
end;


procedure TBudgetVehicleForm.TripTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Category.SetFocus;
end;

procedure TBudgetVehicleForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

procedure TBudgetVehicleForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TBudgetVehicleForm.TripTypeChange(Sender: TObject);
begin
//  if TripType.Text<>'' then begin
//    RefreshCategory;
//  end;
end;

procedure TBudgetVehicleForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCompany;
  RefreshJenis;
  RefreshCategory;
  Seat.Items.Clear;
  EnableInput;
end;

procedure TBudgetVehicleForm.Calculate;
var TotalBBM,TotalDriverFee,TotalBusBoyFee,TotalTollParking,TotalStayNightDriver,TotalStayNightHelper,TotalBiaya,IntCount,TotalToll:Integer;
begin
  TotalToll:=0;
  TotalBBM:=0;
  TotalBiaya:=0;
  TotalDriverFee:=0;
  TotalBusBoyFee:=0;
  TotalTollParking:=0;
  TotalStayNightDriver:=0;
  //TotalStayNightHelper:=0; //tidak diimplement
  if IsInput then begin
    if (ToString(BBMLiter.Text)<>'') and (IsInput) then begin
      //BBMRupiah.Text:=IToCurr(SolarPerLiter*SToInt(BBMLiter.Text));
      TotalBBM:=SToInt(BBMRupiah.Text);
    end
  end else TotalBBM:=SToInt(BBMRupiah.Text);

    if ToString(DriverFee.Text )<>'' then begin
        TotalDriverFee:=SToInt(DriverFee.Text)
    end;
    if ToString(BusBoyFee.Text )<>'' then begin
        TotalBusBoyFee:=SToInt(BusBoyFee.Text);
    end;
    if ToString(TollParking.Text )<>'' then begin
      TotalTollParking:=SToInt(TollParking.Text);
    end;
    if ToString(Toll.Text )<>'' then begin
      TotalToll:=SToInt(Toll.Text);
    end;
    if ToString(StayNightDriver.Text )<>'' then begin
      TotalStayNightDriver:=SToInt(StayNightDriver.Text);
    end;
    {
    if ToString(StayNightHelper.Text )<>'' then begin
      TotalStayNightHelper:=SToInt(StayNightHelper.Text);
    end;
    }
  TotalBiaya:=TotalDriverFee+TotalBusBoyFee+TotalTollParking+TotalToll+TotalStayNightDriver;//+TotalStayNightHelper;
end;

procedure TBudgetVehicleForm.BBMRupiahEnter(Sender: TObject);
begin
BBMRupiah.Text:=ToString(BBMRupiah.Text); 
end;

procedure TBudgetVehicleForm.BBMRupiahExit(Sender: TObject);
begin
  if ToString(BBMRupiah.Text)='' then BBMRupiah.Text:='0';
  BBMRupiah.Text:=SToCurr(BBMRupiah.Text);
  if ToString(BBMRupiah.Text)<>'' then begin
    BBMLiter.Text:=IToCurr(RoundTo(SToInt(BBMRupiah.Text)/SolarPerLiter,-2));
//    Calculate;
  end;
end;

procedure TBudgetVehicleForm.BBMRupiahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DriverFee.SetFocus;
end;

procedure TBudgetVehicleForm.BBMLiterEnter(Sender: TObject);
begin
  BBMRupiah.Text:=ToString(BBMRupiah.Text);
end;

procedure TBudgetVehicleForm.BBMLiterExit(Sender: TObject);
begin
  if ToString(BBMLiter.Text)='' then BBMLiter.Text:='0';
  BBMLiter.Text:=SToCurr(BBMLiter.Text);
  if ToString(BBMLiter.Text)<>'' then begin
    BBMRupiah.Text:=IToCurr(SToInt(BBMLiter.Text)*SolarPerLiter);
    Calculate;
  end;
end;

procedure TBudgetVehicleForm.BBMLiterKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DriverFee.SetFocus;
end;

procedure TBudgetVehicleForm.DriverFeeEnter(Sender: TObject);
begin
  DriverFee.Text:=ToString(DriverFee.Text);
end;

procedure TBudgetVehicleForm.DriverFeeExit(Sender: TObject);
begin
  if ToString(DriverFee.Text)='' then DriverFee.Text:='0';
  DriverFee.Text:=SToCurr(DriverFee.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.DriverFeeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BusBoyFee.SetFocus;
end;

procedure TBudgetVehicleForm.BusBoyFeeEnter(Sender: TObject);
begin
  BusBoyFee.Text:=ToString(BusBoyFee.Text);
end;

procedure TBudgetVehicleForm.BusBoyFeeExit(Sender: TObject);
begin
  if ToString(BusBoyFee.Text)='' then BusBoyFee.Text:='0';
  BusBoyFee.Text:=SToCurr(BusBoyFee.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.BusBoyFeeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Toll.SetFocus;
end;

procedure TBudgetVehicleForm.TollEnter(Sender: TObject);
begin
  Toll.Text:=ToString(Toll.Text);
end;

procedure TBudgetVehicleForm.TollExit(Sender: TObject);
begin
  if ToString(Toll.Text)='' then Toll.Text:='0';
  Toll.Text:=SToCurr(Toll.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.TollKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then TollParking.SetFocus;
end;

procedure TBudgetVehicleForm.TollParkingEnter(Sender: TObject);
begin
  TollParking.Text:=ToString(TollParking.Text);
end;

procedure TBudgetVehicleForm.TollParkingExit(Sender: TObject);
begin
  if ToString(TollParking.Text)='' then TollParking.Text:='0';
  TollParking.Text:=SToCurr(TollParking.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.TollParkingKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then StayNightDriver.SetFocus;
end;

procedure TBudgetVehicleForm.StayNightDriverEnter(Sender: TObject);
begin
  StayNightDriver.Text:=ToString(StayNightDriver.Text);
end;

procedure TBudgetVehicleForm.StayNightDriverExit(Sender: TObject);
begin
  if ToString(StayNightDriver.Text)='' then StayNightDriver.Text:='0';
  StayNightDriver.Text:=SToCurr(StayNightDriver.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.StayNightDriverKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TBudgetVehicleForm.StayNightHelperKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TBudgetVehicleForm.StayNightHelperEnter(Sender: TObject);
begin
  StayNightHelper.Text:=ToString(StayNightHelper.Text);
end;

procedure TBudgetVehicleForm.StayNightHelperExit(Sender: TObject);
begin
  if ToString(StayNightHelper.Text)='' then StayNightHelper.Text:='0';
  StayNightHelper.Text:=SToCurr(StayNightHelper.Text);
//  Calculate;
end;

procedure TBudgetVehicleForm.CategoryChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
