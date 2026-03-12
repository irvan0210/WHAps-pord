unit PartDetailFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB, ComCtrls, ExtCtrls;

type
  TPartDetailForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    PartGroup: TComboBox;
    PartDescription: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    Label4: TLabel;
    Scale: TComboBox;
    Label5: TLabel;
    VehicleGroup: TComboBox;
    Bersihkan: TButton;
    Label6: TLabel;
    GPReferenceId: TEdit;
    Label7: TLabel;
    NonInventory: TCheckBox;
    Label8: TLabel;
    PriceUnit: TEdit;
    Label9: TLabel;
    HargaTglDari: TDateTimePicker;
    HargaTglSampai: TDateTimePicker;
    Label10: TLabel;
    GroupStock: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    StockMin: TEdit;
    StockSafe: TEdit;
    Panel1: TPanel;
    PartNumber: TEdit;
    Label13: TLabel;
    PartType: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartNumberKeyPress(Sender: TObject; var Key: Char);
    procedure PartGroupKeyPress(Sender: TObject; var Key: Char);
    procedure PartDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleGroupKeyPress(Sender: TObject; var Key: Char);
    procedure ScaleKeyPress(Sender: TObject; var Key: Char);
    procedure GPReferenceIdKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PartGroupChange(Sender: TObject);
    procedure PriceUnitKeyPress(Sender: TObject; var Key: Char);
    procedure StockMinKeyPress(Sender: TObject; var Key: Char);
    procedure StockSafeKeyPress(Sender: TObject; var Key: Char);
    procedure StockMinExit(Sender: TObject);
    procedure PriceUnitExit(Sender: TObject);
    procedure StockSafeExit(Sender: TObject);
    procedure PriceUnitEnter(Sender: TObject);
    procedure HargaTglDariKeyPress(Sender: TObject; var Key: Char);
    procedure HargaTglSampaiKeyPress(Sender: TObject; var Key: Char);
    procedure PartTypeChange(Sender: TObject);
  private
    PartGroupArr,VehicleGroupArr,TypeArr,ScaleArr:Array of TArrString4;
    PartDetailId:String;
    IsReadOnly:Boolean;
    procedure Init;
    procedure RefreshGroup;
    procedure RefreshCombo;
    procedure EnableInput;
    procedure DisableInput;
    procedure LoadData;
    procedure MoveFooter(IntHeight:Integer);
    { Private declarations }
  public
    Constructor Create(AOwner:TComponent;Part_Detail_Id:String='';IsRead_Only:Boolean=True);Overload;
    { Public declarations }
  end;

var
  PartDetailForm: TPartDetailForm;
implementation

uses MainU, PartDetailListU;

{$R *.dfm}

Constructor TPartDetailForm.Create(AOwner:TComponent;Part_Detail_Id:String='';IsRead_Only:Boolean=True);
begin
  IsReadOnly:=IsRead_Only;
  PartDetailId:=Part_Detail_Id;
  Inherited Create(AOwner);
end;

procedure TPartDetailForm.Init;
begin
  PartNumber.Text:='';
  PartDescription.Text:='';
  PartType.Text:='';
  PartType.Items.Clear;
  PartType.ItemIndex:=-1;
  PartDescription.Text:='';
  VehicleGroup.Text:='';
  VehicleGroup.Items.Clear;
  VehicleGroup.ItemIndex:=-1;
  Scale.Text:='';
  Scale.Items.Clear;
  Scale.ItemIndex:=-1;
  GPReferenceId.Text:='';
  NonInventory.Checked:=False;
  PriceUnit.Text:='';
  HargaTglDari.Date:=Now();
  HargaTglSampai.Date:=Now();
  StockMin.Text:='';
  StockSafe.Text:='';
end;

procedure TPartDetailForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_part_type WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(TypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
      TypeArr[IntCount][1]:=Qry.FieldValues['name'];
      TypeArr[IntCount][2]:=Qry.FieldValues['vehicle_module'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vehicle_type a'+
            ' WHERE a.active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(VehicleGroupArr,Qry.RecordCount+1);
    VehicleGroupArr[0][0]:='';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      VehicleGroupArr[IntCount][0]:=Qry.FieldValues['vehicle_type_id'];
      VehicleGroupArr[IntCount][1]:=Qry.FieldValues['brand'];
      VehicleGroupArr[IntCount][2]:=Qry.FieldValues['type'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_uom WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(ScaleArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ScaleArr[IntCount][0]:=Qry.FieldValues['uom_id'];
      ScaleArr[IntCount][1]:=Qry.FieldValues['uom'];
      ScaleArr[IntCount][2]:=Qry.FieldValues['uom_short'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(TypeArr)-1  do
    PartType.Items.Add(TypeArr[IntCount][1]);
  for IntCount:=0 to Length(VehicleGroupArr)-1  do
    VehicleGroup.Items.Add(VehicleGroupArr[IntCount][1]+' '+VehicleGroupArr[IntCount][2]);
  for IntCount:=0 to Length(ScaleArr)-1  do
    Scale.Items.Add(ScaleArr[IntCount][1]+' ('+ScaleArr[IntCount][2]+')');
  Main.M_Normal;
end;

procedure TPartDetailForm.RefreshGroup;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  PartGroup.Text:='';
  PartGroup.Items.Clear;
  PartGroup.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPartGroupList @PartTypeId='+QuotedStr(TypeArr[PartType.ItemIndex][0])+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartGroupArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartGroupArr[IntCount][0]:=Qry.FieldValues['part_group_id'];
      PartGroupArr[IntCount][1]:=Qry.FieldValues['name'];
      PartGroupArr[IntCount][2]:=Qry.FieldValues['vehicle_module'];
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

procedure TPartDetailForm.EnableInput;
begin
  PartNumber.Enabled:=True;
  PartType.Enabled:=True;
  PartGroup.Enabled:=True;
  PartDescription.Enabled:=True;
  VehicleGroup.Enabled:=True;
  Scale.Enabled:=True;
  GPReferenceId.Enabled:=True;
  NonInventory.Enabled:=False;
  Simpan.Enabled:=True;
  GroupStock.Enabled:=True;
  PriceUnit.Enabled:=True;
  HargaTglDari.Enabled:=True;
  HargaTglSampai.Enabled:=True;
end;

procedure TPartDetailForm.DisableInput;
begin
  PartNumber.Enabled:=False;
  PartType.Enabled:=False;
  PartGroup.Enabled:=False;
  PartDescription.Enabled:=False;
  VehicleGroup.Enabled:=False;
  Scale.Enabled:=False;
  GPReferenceId.Enabled:=False;
  NonInventory.Enabled:=False;
  Simpan.Enabled:=False;
  GroupStock.Enabled:=False;
  PriceUnit.Enabled:=False;
  HargaTglDari.Enabled:=False;
  HargaTglSampai.Enabled:=False;
end;


procedure TPartDetailForm.SimpanClick(Sender: TObject);
var StrQry,StrPartType,StrPartGroup,StrVhcType,StrGPRef,StrScale,StrNonInventory,StrPriceUnit,StrPriceFromDate,StrPriceToDate:String;
    StrStockMin,StrStockMax,StrTransId:String;
    Qry:TADOQuery;
    IntCount:Integer;
    IsOk,IsExist:Boolean;
begin
  if (Trim(PartGroup.Text)<>'') and (Trim(PartDescription.Text)<>'') and (Trim(Scale.Text)<>'') then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      IsOk:=True;
      IsExist:=False;
      Main.TransStart;
      if VehicleGroup.Text<>'' then begin
        StrVhcType:=QuotedStr(VehicleGroupArr[VehicleGroup.ItemIndex][0]);
      end else StrVhcType:='NULL';
      StrPartGroup:=PartGroupArr[PartGroup.ItemIndex][0];
      StrPartType:= TypeArr[PartType.itemindex][0];
      StrScale:=ScaleArr[Scale.ItemIndex][0];
      if (StockMin.Text<>'') then StrStockMin:=ToString(StockMin.Text) else StrStockMin:='0';
      if (StockSafe.Text<>'') then StrStockMax:=ToString(StockSafe.Text) else StrStockMax:='0';
      if PriceUnit.Text<>'' then begin
        StrPriceUnit:=ToString(PriceUnit.Text);
        StrPriceFromDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',HargaTglDari.Date));
        StrPriceToDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',HargaTglSampai.Date));
      end else begin
        StrPriceUnit:='NULL';
        StrPriceFromDate:='NULL';
        StrPriceToDate:='NULL';
      end;
      if GPReferenceId.Text<>'' then StrGPRef:=QuotedStr(GPReferenceId.Text) else StrGPRef:='NULL';
      if NonInventory.Checked then StrNonInventory:='1' else StrNonInventory:='0';
      if PartDetailId='' then begin
        if PartNumber.Text='' then begin
//          StrQry:='SELECT * FROM wh_part_detail WHERE part_detail_id='+QuotedStr(PartNumber.Text)+';';
//          Qry.SQL.Add(StrQry);
//          Qry.Open;
//          if Qry.RecordCount<1 then begin
//            Qry.Close;
            StrQry:='SELECT RIGHT(MAX(part_detail_id),4) AS part_detail_id FROM wh_part_detail '+
                    'WHERE part_detail_id  LIKE '+Chr(39)+StrPartGroup+'____'+Chr(39)+';';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if Qry.FieldValues['part_detail_id']<>NULL then begin
              StrTransId:=Qry.FieldValues['part_detail_id'];
              StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
              Qry.Close;
              Qry.SQL.Clear;
            end else
              StrTransId:='0001';
            StrTransId:=StrPartGroup+StrTransId;
//          end else begin
//            Qry.Close;
//            IsExist:=True;
//          end;
        end else begin
          StrQry:='SELECT * FROM wh_part_detail WHERE part_detail_id='+QuotedStr(PartNumber.Text)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount<1 then begin
            Qry.Close;
            StrTransId:=PartNumber.Text;
          end else begin
            Qry.Close;
            IsExist:=True;
          end;
        end;
        if Not(IsExist) then begin
          StrQry:='INSERT INTO wh_part_detail (part_detail_id,name,part_group_id'+
                  ',vehicle_type_id,uom_id,non_inventory,qty_min,qty_safe,gp_reference_id,update_user,Part_type_id)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(Trim(PartDescription.Text ))+
                  ','+QuotedStr(StrPartGroup)+','+StrVhcType+','+StrScale+','+StrNonInventory+','+StrStockMin+','+StrStockMax+
                  ','+StrGPRef+','+QuotedStr(User)+','+QuotedStr(StrPartType)+');';
        end;
      end else begin
          StrTransId:=PartNumber.Text;
          StrQry:='UPDATE wh_part_detail SET name='+QuotedStr(Trim(PartDescription.Text))+',part_group_id='+QuotedStr(StrPartGroup)+
                  ',vehicle_type_id='+StrVhcType+',uom_id='+StrScale+',non_inventory='+StrNonInventory+',qty_min='+StrStockMin+
                  ',qty_safe='+StrStockMax+',gp_reference_id='+StrGPRef+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ',Part_type_id='+QuotedStr(StrPartType)+
                  ' WHERE part_detail_id='+QuotedStr(StrTransId)+';';
      end;
      if StrPriceUnit<>'NULL' then begin
        StrQry:=StrQry+'INSERT INTO wh_part_detail_detail (part_detail_id,price_unit,from_date,to_date,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+StrPriceUnit+','+StrPriceFromDate+','+StrPriceToDate+
                ','+QuotedStr(User)+');';
      end;
      if Not(IsExist) then begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do IsOk:=False;
        end;
        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Disimpan','Part Detail',MB_OKCANCEL or MB_ICONINFORMATION);
          if Main.IsFormOpen('PartDetailList')=True then begin
            PartDetailList.LoadData('');
            PartDetailList.RefreshGrid;
          end;
          if Not(IsReadOnly) then begin
            Close;
          end;
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'Silahkan Coba Lagi','Part Detail',MB_OK or MB_ICONERROR)
        end;
      end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,'Part Detail Id Sudah ada '+Chr(13)+'   Gagal Menyimpan','Part Detail',MB_OK or MB_ICONERROR)
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TPartDetailForm.MoveFooter(IntHeight:Integer);
begin
  if IntHeight>0 then begin
    VehicleGroup.Visible:=True;
    Label5.Visible:=True;
  end else begin
    VehicleGroup.Visible:=False;
    Label5.Visible:=False;
  end;
  Label6.Top:=Label6.Top+IntHeight;
  Label4.Top:=Label4.Top+IntHeight;
  Label8.Top:=Label8.Top+IntHeight; 
  Label9.Top:=Label9.Top+IntHeight;
  Label10.Top:=Label10.Top+IntHeight;
  Scale.Top:=Scale.Top+IntHeight;
  GPReferenceId.Top:=GPReferenceId.Top+IntHeight;
  PriceUnit.Top:=PriceUnit.Top+IntHeight;
  HargaTglDari.Top:=HargaTglDari.Top+IntHeight;
  HargaTglSampai.Top:=HargaTglSampai.Top+IntHeight;
  GroupStock.Top:=GroupStock.Top+IntHeight;

end;

procedure TPartDetailForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrPartGroup:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPartDetailDetail '+QuotedStr(PartDetailId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartType.ItemIndex:=PartType.Items.IndexOf(Qry.FieldValues['part_type_name']);
      StrPartGroup:=Qry.FieldValues['part_group_name'];
      PartDescription.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['non_inventory']='1' then NonInventory.Checked:=True else NonInventory.Checked:=False;
      if Qry.FieldValues['vehicle_module']='1' then begin
        if Qry.FieldValues['brand']<>NULL then VehicleGroup.ItemIndex:=VehicleGroup.Items.IndexOf(Qry.FieldValues['brand']+' '+Qry.FieldValues['type']);
        VehicleGroup.Visible:=True;
      end else begin
        VehicleGroup.Visible:=False;
        MoveFooter(-22);
      end;
      Scale.ItemIndex:=Scale.Items.IndexOf(Qry.FieldValues['uom']+' ('+Qry.FieldValues['uom_short']+')');
      if Qry.FieldValues['gp_reference_id']<>NULL then GPReferenceId.Text:=Qry.FieldValues['gp_reference_id'];
      if Qry.FieldValues['price_unit']<>NULL then begin
        PriceUnit.Text:=SToCurr(Qry.FieldValues['price_unit']);
        HargaTglDari.Date:=StrToDate(Qry.FieldValues['price_unit_from_date']);
        HargaTglSampai.Date:=StrToDate(Qry.FieldValues['price_unit_to_date']);
      end;
      StockMin.Text:=Qry.FieldValues['qty_min'];
      StockSafe.Text:=Qry.FieldValues['qty_safe'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  RefreshGroup;
  PartGroup.ItemIndex:=PartGroup.Items.IndexOf(StrPartGroup);
  Main.M_Normal;
end;

procedure TPartDetailForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartDetailForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if PartDetailId<>'' then begin
    PartNumber.Text:=PartDetailId;
    LoadData;
    if IsReadOnly=True then DisableInput; 
  end;
end;

procedure TPartDetailForm.PartNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then PartGroup.SetFocus;
end;

procedure TPartDetailForm.PartGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then PartDescription.SetFocus;
end;

procedure TPartDetailForm.PartDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then if VehicleGroup.Visible then VehicleGroup.SetFocus
    else Scale.SetFocus;
end;

procedure TPartDetailForm.VehicleGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then Scale.SetFocus;
end;

procedure TPartDetailForm.ScaleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then PriceUnit.SetFocus;
end;

procedure TPartDetailForm.GPReferenceIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then Simpan.SetFocus;
end;

procedure TPartDetailForm.BersihkanClick(Sender: TObject);
begin                            
  Init;
  RefreshCombo;
  EnableInput;
end;

procedure TPartDetailForm.PartGroupChange(Sender: TObject);
begin
  if PartGroup.Text<>'' then begin
    if (PartGroupArr[PartGroup.ItemIndex][2]='0') then begin
      if VehicleGroup.Visible=true then MoveFooter(-22);
    end else begin
      if VehicleGroup.Visible=false then MoveFooter(22);
    end;
  end;
end;

procedure TPartDetailForm.PriceUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key =#13 then if PriceUnit.Text<>'' then
    HargaTglDari.SetFocus
  else
    StockMin.SetFocus;
end;

procedure TPartDetailForm.StockMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key =#13 then if (StockMin.Text='') or (StockMin.Text='0') then GPReferenceId.SetFocus else StockSafe.SetFocus;
end;

procedure TPartDetailForm.StockSafeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key =#13 then GPReferenceId.SetFocus;
end;

procedure TPartDetailForm.StockMinExit(Sender: TObject);
begin
  if StockMin.Text='' then StockMin.Text:='0';
end;

procedure TPartDetailForm.PriceUnitExit(Sender: TObject);
begin
  if PriceUnit.Text<>'' then PriceUnit.Text:=SToCurr(PriceUnit.Text);
end;

procedure TPartDetailForm.StockSafeExit(Sender: TObject);
begin
  if StockSafe.Text='' then StockSafe.Text:='0'; 
end;

procedure TPartDetailForm.PriceUnitEnter(Sender: TObject);
begin
  PriceUnit.Text:=ToString(PriceUnit.Text);
end;

procedure TPartDetailForm.HargaTglDariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then HargaTglSampai.SetFocus;

end;

procedure TPartDetailForm.HargaTglSampaiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then   StockMin.SetFocus;
end;

procedure TPartDetailForm.PartTypeChange(Sender: TObject);
begin
  RefreshGroup;
end;

end.
