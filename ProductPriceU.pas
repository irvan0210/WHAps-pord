unit ProductPriceU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TProductPrice = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    LabelAktif: TLabel;
    Label18: TLabel;
    Label9: TLabel;
    GroupInput: TPanel;
    Label4: TLabel;
    Name: TEdit;
    ProductId: TComboBox;
    Fuel: TEdit;
    Status: TCheckBox;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    Label17: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ProductPriceId: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PriceWeekday: TMemo;
    PriceWeekend: TMemo;
    PriceOvertime: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ContractOnly: TCheckBox;
    Label16: TLabel;
    ShortName: TMemo;
    Label19: TLabel;
    PriceWeekday2: TMemo;
    PriceWeekend2: TMemo;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    AllContract: TCheckBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    PriceOverday: TMemo;
    Label27: TLabel;
    PackageDay: TEdit;
    Label28: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FuelKeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekdayKeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekdayExit(Sender: TObject);
    procedure PriceWeekdayEnter(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure ProductIdKeyPress(Sender: TObject; var Key: Char);
    procedure WeekdayKeyPress(Sender: TObject; var Key: Char);
    procedure WeekendKeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekendEnter(Sender: TObject);
    procedure PriceWeekendExit(Sender: TObject);
    procedure PriceWeekendKeyPress(Sender: TObject; var Key: Char);
    procedure PriceOvertimeEnter(Sender: TObject);
    procedure PriceOvertimeExit(Sender: TObject);
    procedure PriceOvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure StatusKeyPress(Sender: TObject; var Key: Char);
    procedure ContractOnlyKeyPress(Sender: TObject; var Key: Char);
    procedure ShortNameKeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekday2KeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekday2Enter(Sender: TObject);
    procedure PriceWeekday2Exit(Sender: TObject);
    procedure PriceWeekend2KeyPress(Sender: TObject; var Key: Char);
    procedure PriceWeekend2Exit(Sender: TObject);
    procedure PriceWeekend2Enter(Sender: TObject);
    procedure AllContractKeyPress(Sender: TObject; var Key: Char);
    procedure PriceOverdayEnter(Sender: TObject);
    procedure PriceOverdayExit(Sender: TObject);
    procedure PriceOverdayKeyPress(Sender: TObject; var Key: Char);
    procedure PackageDayExit(Sender: TObject);
  private
    { Private declarations }
    ProdPriceId:String;
    IsInput:Boolean;
    ProductArr:Array of TArrString8;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ProductPrice_Id:String='';Input_Only:Boolean=False);Overload;
  end;

var
  ProductPrice: TProductPrice;

implementation

uses MainU, ADODB, StrUtils, ProductPriceListU;

{$R *.dfm}


constructor TProductPrice.Create(AOwner:TComponent;ProductPrice_Id:String='';Input_Only:Boolean=False);
begin
  ProdPriceId:=ProductPrice_Id;
  IsInput:=not(Input_Only);
  Main.WriteLog('Form Open: ProductPrice='+ProductPrice_Id+','+BoolToStr(Input_Only),1);
  inherited Create(AOwner);
end;

procedure TProductPrice.Init;
begin
  ProductPriceId.Text:='';
  Name.Text:='';
  Fuel.Text:='';
  PriceWeekday.Text:='0';
  PriceWeekDay2.Text:='0';
  PriceWeekend2.Text:='0';
  PriceWeekend.Text:='0';
  PriceOvertime.Text:='0';
  PriceOverday.Text:='0';
  Status.Checked:=False;
  ShortName.Text:='';
  PackageDay.Text:='0';
  ContractOnly.Checked:=False;
  AllContract.Checked:=False;
  if ProdPriceId='' then begin
    Status.Visible:=False;
    LabelAktif.Visible:=False;
    Bersihkan.Enabled:=True;
  end else begin
    Status.Visible:=True;
    LabelAktif.Visible:=True;
    Bersihkan.Enabled:=False;
  end;
end;

procedure TProductPrice.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  ProductId.Text:='';
  ProductId.Clear;
  ProductId.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ProductArr,0);
    StrCompanyId:=CompanyId;
    StrLocationId:=',@LocationId='+LocationId;  
    StrQry:='EXEC GetProductList '+StrCompanyId+StrLocationId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ProductArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductArr[IntCount][0]:=Qry.FieldValues['product_id'];
      ProductArr[IntCount][1]:=Qry.FieldValues['name'] ;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(ProductArr)-1 do
    ProductId.Items.Add(ProductArr[IntCount][1]);
  Main.M_Normal;
end;


procedure TProductPrice.LoadData;
var Qry:TADOQuery;
    StrQry,StrSeat:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetProductPriceDetail '+QuotedStr(ProdPriceId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductPriceId.Text:=Qry.FieldValues['product_price_id'];
      Name.Text:=Qry.FieldValues['name'];
      ProductId.ItemIndex:=ProductId.Items.IndexOf(Qry.FieldValues['product_name']);
      PriceWeekday.Text:=IToCurr(Qry.FieldValues['price_weekday']);
      PriceWeekend.Text:=IToCurr(Qry.FieldValues['price_weekend']);
      PriceWeekday2.Text:=IToCurr(Qry.FieldValues['price_weekday2']);
      PriceWeekend2.Text:=IToCurr(Qry.FieldValues['price_weekend2']);
      PriceOvertime.Text:=IToCurr(Qry.FieldValues['price_overtime']);
      PriceOverday.Text:=IToCurr(Qry.FieldValues['price_overday']);
      PackageDay.Text:=IToCurr(Qry.FieldValues['package_day']);
      ShortName.Text:=Qry.FieldValues['short_name'];
      if Qry.FieldValues['fuel']<>NULL then Fuel.Text:=Qry.FieldValues['fuel'];
      if Qry.FieldValues['contract']=1 then ContractOnly.Checked:=True;
      if Qry.FieldValues['all_contract']=1 then AllContract.Checked:=True;
      if Qry.FieldValues['status']=1 then Status.Checked:=True;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TProductPrice.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TProductPrice.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;



procedure TProductPrice.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if not(IsInput) then DisableInput;
  if ProdPriceId<>'' then LoadData;
end;

procedure TProductPrice.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrName,StrProductId,StrFuel,StrPriceWeekday,StrPriceWeekend,StrOvertime,StrStatus:String;
    StrTransId,StrEMsg,StrContractOnly,StrShortName,StrPriceWeekend2,StrPriceWeekday2,StrAllContract,StrPackageDay,StrOverday:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Name.Text)<>'') and (ProductId.Text<>'') and  (Trim(PriceWeekday.Text)<>'') and (Trim(PriceWeekend.Text)<>'')
    and (Trim(PriceOvertime.Text)<>'') and (ShortName.Text<>'') and (PriceWeekday2.Text<>'') and (PriceWeekend2.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:='2';
      StrProductId:=QuotedStr(ProductArr[ProductId.ItemIndex][0]);
      StrName:=QuotedStr(Trim(Name.Text));
      StrPriceWeekday:=ToString(PriceWeekday.Text);
      StrPriceWeekend:=ToString(PriceWeekend.Text);
      StrPriceWeekday2:=ToString(PriceWeekday2.Text);
      StrPriceWeekend2:=ToString(PriceWeekend2.Text);
      StrOvertime:=ToString(PriceOvertime.Text);
      StrOverday:=ToString(PriceOverday.Text);
      StrPackageDay:=PackageDay.Text;
      StrShortName:=QuotedStr(ShortName.Text);
      if Trim(Fuel.Text)<>'' then StrFuel:=Fuel.Text else StrFuel:='NULL';
      if ContractOnly.Checked=True then StrContractOnly:='1' else StrContractOnly:='0';
      if Status.Visible=True then if Status.Checked=True then StrStatus:='1' else StrStatus:='0';
      if AllContract.Checked then StrAllContract:='1' else StrAllContract:='0';
      if (ProdPriceId<>'')  then begin
        StrTransId:=ProdPriceId;
        StrQry:='UPDATE wh_product_price SET name='+StrName+',product_id='+StrProductId+',price_weekday='+StrPriceWeekday+
                ',price_weekday2='+StrPriceWeekday2+',price_weekend='+StrPriceWeekend+',price_weekend2='+StrPriceWeekend2+
                ',price_overtime='+StrOvertime+',price_overday='+StrOverday+',fuel='+StrFuel+
                ',package_day='+StrPackageDay+',short_name='+StrShortName+
                ',status='+StrStatus+',contract='+StrContractOnly+',all_contract='+StrAllContract+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE product_price_id='+QuotedStr(StrTransId)+';';
      end else begin
        StrQry:='SELECT RIGHT(MAX(product_price_id),4) AS max_id FROM wh_product_price '+
                'WHERE product_price_id  LIKE '+QuotedStr('PP'+ FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____')+';';

        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='PP'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_product_price (product_price_id,product_id,name,price_weekday,price_weekend'+
                ',price_weekday2,price_weekend2,price_overtime,price_overday,package_day,fuel,contract,all_contract'+
                ',short_name,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrProductId+','+StrName+','+StrPriceWeekday+','+StrPriceWeekend+
                ','+StrPriceWeekday2+','+StrPriceWeekend2+','+StrOvertime+','+StrOverday+','+StrPackageDay+
                ','+StrFuel+','+StrContractOnly+','+StrAllContract+','+StrShortName+','+QuotedStr(User)+');';
      end;
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        ProductPriceId.Text:=StrTransId;
        MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Produk',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('ProductPriceList') then ProductPriceList.RefreshDisplay;
      end else begin
        Main.TransRollback;
        Main.WriteLog('Form Save: Fail'+StrEMsg,1);
        MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Data Produk',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    FreeAndNil(Qry)
  end else
    MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Data Produk',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TProductPrice.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TProductPrice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TProductPrice.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
  EnableInput;
  Name.SetFocus;
end;





procedure TProductPrice.FuelKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Fuel.SetFocus;
end;

procedure TProductPrice.PriceWeekdayKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PriceWeekDay2.SetFocus;
end;

procedure TProductPrice.PriceWeekdayExit(Sender: TObject);
begin
  if PriceWeekday.Text<>'' then PriceWeekday.Text:=SToCurr(PriceWeekday.Text);
end;

procedure TProductPrice.PriceWeekdayEnter(Sender: TObject);
begin
  if PriceWeekday.Text<>'' then PriceWeekday.Text:=ToString(PriceWeekday.Text);
end;

procedure TProductPrice.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ProductId.SetFocus;
end;

procedure TProductPrice.ProductIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ShortName.SetFocus;
end;

procedure TProductPrice.WeekdayKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Fuel.SetFocus;
end;

procedure TProductPrice.WeekendKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Fuel.SetFocus;
end;

procedure TProductPrice.PriceWeekendEnter(Sender: TObject);
begin
  if PriceWeekend.Text<>'' then PriceWeekend.Text:=ToString(PriceWeekend.Text);
end;

procedure TProductPrice.PriceWeekendExit(Sender: TObject);
begin
  if PriceWeekend.Text<>'' then PriceWeekend.Text:=SToCurr(PriceWeekend.Text);
end;

procedure TProductPrice.PriceWeekendKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PriceWeekend2.SetFocus;
end;

procedure TProductPrice.PriceOvertimeEnter(Sender: TObject);
begin
  if PriceOvertime.Text<>'' then PriceOvertime.Text:=ToString(PriceOvertime.Text);
end;

procedure TProductPrice.PriceOvertimeExit(Sender: TObject);
begin
  if PriceOvertime.Text<>'' then PriceOvertime.Text:=SToCurr(PriceOvertime.Text);
  if Trim(PriceOvertime.Text)='' then PriceOvertime.Text:='0';  
end;

procedure TProductPrice.PriceOvertimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PriceOverday.SetFocus;
end;

procedure TProductPrice.StatusKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TProductPrice.ContractOnlyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Status.Visible then AllContract.SetFocus;
end;

procedure TProductPrice.ShortNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PriceWeekday.SetFocus;
end;

procedure TProductPrice.PriceWeekday2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PriceWeekend.SetFocus;
end;

procedure TProductPrice.PriceWeekday2Enter(Sender: TObject);
begin
  if PriceWeekDay2.Text<>'' then PriceWeekday2.Text:=ToString(PriceWeekday2.Text);
end;

procedure TProductPrice.PriceWeekday2Exit(Sender: TObject);
begin
  if PriceWeekday2.Text<>'' then PriceWeekday2.Text:=SToCurr(PriceWeekday2.Text);
  if Trim(PriceWeekday2.Text)='' then PriceWeekday2.Text:='0';
end;

procedure TProductPrice.PriceWeekend2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PriceOvertime.SetFocus;
end;

procedure TProductPrice.PriceWeekend2Exit(Sender: TObject);
begin
  if PriceWeekend2.Text<>'' then PriceWeekend2.Text:=SToCurr(PriceWeekend2.Text);
  if Trim(PriceWeekend2.Text)='' then PriceWeekend2.Text:='0';
end;

procedure TProductPrice.PriceWeekend2Enter(Sender: TObject);
begin
  if PriceWeekend2.Text<>'' then PriceWeekend2.Text:=ToString(PriceWeekend2.Text);
end;

procedure TProductPrice.AllContractKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then if Status.Visible then Status.SetFocus else Simpan.SetFocus;
end;

procedure TProductPrice.PriceOverdayEnter(Sender: TObject);
begin
  if PriceOverday.Text<>'' then PriceOverday.Text:=ToString(PriceOverday.Text);
end;

procedure TProductPrice.PriceOverdayExit(Sender: TObject);
begin
  if PriceOverday.Text<>'' then PriceOverday.Text:=SToCurr(PriceOverday.Text);
  if Trim(PriceOverday.Text)='' then PriceOverday.Text:='0';
end;

procedure TProductPrice.PriceOverdayKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PackageDay.SetFocus;
end;

procedure TProductPrice.PackageDayExit(Sender: TObject);
begin
  if Trim(PackageDay.Text)='' then PackageDay.Text:='0'; 
end;

end.
