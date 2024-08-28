unit ProductPriceDetailU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TProductPriceDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LabelAktif: TLabel;
    Label18: TLabel;
    GroupInput: TPanel;
    Label4: TLabel;
    Destination: TEdit;
    VehicleGroup: TComboBox;
    Fuel: TEdit;
    Status: TCheckBox;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    Label17: TLabel;
    ProductDetailId: TEdit;
    Label19: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Seat: TComboBox;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FuelKeyPress(Sender: TObject; var Key: Char);
    procedure DestinationKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleGroupKeyPress(Sender: TObject; var Key: Char);
    procedure StatusKeyPress(Sender: TObject; var Key: Char);
    procedure SeatKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleGroupChange(Sender: TObject);
  private
    { Private declarations }
    ProdVehicleId:String;
    IsInput:Boolean;
    VehicleGroupArr:Array of TArrString8;
    SeatArr:Array of TArrString4;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshSeat;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ProductVehicle_Id:String='';Input_Only:Boolean=False);Overload;
  end;

var
  ProductPriceDetail: TProductPriceDetail;

implementation

uses MainU, ADODB, StrUtils, ProductPriceListU, ProductPriceDetailListU;

{$R *.dfm}


constructor TProductPriceDetail.Create(AOwner:TComponent;ProductVehicle_Id:String='';Input_Only:Boolean=False);
begin
  ProdVehicleId:=ProductVehicle_Id;
  IsInput:=not(Input_Only);
  Main.WriteLog('Form Open: ProductPriceDetail='+ProductVehicle_Id+','+BoolToStr(Input_Only),1);
  inherited Create(AOwner);
end;

procedure TProductPriceDetail.Init;
begin
  VehicleGroup.Text:='';
  Destination.Text:='';
  Fuel.Text:='';
  Status.Checked:=False;
  if ProdVehicleId='' then begin
    Status.Visible:=False;
    LabelAktif.Visible:=False;
    Bersihkan.Enabled:=True;
  end else begin
    Status.Visible:=True;
    LabelAktif.Visible:=True;
    Bersihkan.Enabled:=False;
  end;
end;

procedure TProductPriceDetail.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  VehicleGroup.Text:='';
  VehicleGroup.Clear;
  VehicleGroup.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(VehicleGroupArr,0);
    StrQry:='EXEC GetVehicleGroup 2;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VehicleGroupArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      VehicleGroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      VehicleGroupArr[IntCount][1]:=Qry.FieldValues['name'] ;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(VehicleGroupArr)-1 do
    VehicleGroup.Items.Add(VehicleGroupArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TProductPriceDetail.RefreshSeat;
var Qry:TADOQuery;
    StrQry,StrJenis:String;
    IntCount:Integer;
begin
  Seat.Text:='';
  Seat.Clear;
  Seat.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(SeatArr,0);
    StrJenis:=VehicleGroupArr[VehicleGroup.ItemIndex][0];
    StrQry:='EXEC GetVehicleTypeDetail 2,'+StrJenis+',@GroupBy=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(SeatArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do
    Seat.Items.Add(SeatArr[IntCount][0]);
  Main.M_Normal;
end;

procedure TProductPriceDetail.LoadData;
var Qry:TADOQuery;
    StrQry,StrSeat:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetProductVehicleDetailDetail '+QuotedStr(ProdVehicleId)+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductDetailId.Text:=Qry.FieldValues['product_vehicle_detail_id'];
      Destination.Text:=Qry.FieldValues['destination'];
      VehicleGroup.ItemIndex:=VehicleGroup.Items.IndexOf(Qry.FieldValues['name']);
      if Qry.FieldValues['fuel']<>NULL then Fuel.Text:=Qry.FieldValues['fuel'];
      if Qry.FieldValues['status']=1 then Status.Checked:=True;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TProductPriceDetail.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TProductPriceDetail.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;



procedure TProductPriceDetail.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if not(IsInput) then DisableInput;
  if ProdVehicleId<>'' then LoadData;
end;

procedure TProductPriceDetail.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrDestination,StrVehicleGroup,StrFuel,StrStatus:String;
    StrTransId,StrEMsg:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Destination.Text)<>'') and (VehicleGroup.Text<>'') and (Fuel.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:='2';
      StrVehicleGroup:=QuotedStr(VehicleGroupArr[VehicleGroup.ItemIndex][0]);
      StrDestination:=QuotedStr(Trim(Destination.Text));
      if Trim(Fuel.Text)<>'' then StrFuel:=Fuel.Text else StrFuel:='NULL';
      if Status.Visible=True then if Status.Checked=True then StrStatus:='1' else StrStatus:='0';
      if (ProdVehicleId<>'')  then begin
        StrTransId:=ProdVehicleId;
        StrQry:='UPDATE wh_product_vehicle_detail SET destination='+StrDestination+',vhc_batch_id='+StrVehicleGroup+
                ',fuel='+StrFuel+',status='+StrStatus+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE product_vehicle_detail_id='+QuotedStr(StrTransId)+';';
      end else begin
        StrQry:='SELECT RIGHT(MAX(product_vehicle_detail_id),4) AS max_id FROM wh_product_vehicle_detail '+
                'WHERE product_vehicle_detail_id  LIKE '+QuotedStr('PVD'+ FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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
        StrTransId:='PVD'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_product_vehicle_detail (product_vehicle_detail_id,vhc_batch_id,destination'+
                ',fuel,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrVehicleGroup+','+StrDestination+
                ','+StrFuel+','+QuotedStr(User)+');';
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
        VehicleGroup.Text:=StrTransId;
        MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Produk',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('ProductPriceDetailList') then ProductPriceDetailList.RefreshDisplay;
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

procedure TProductPriceDetail.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TProductPriceDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TProductPriceDetail.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
  EnableInput;
  VehicleGroup.SetFocus;
end;





procedure TProductPriceDetail.FuelKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then if Status.Visible then Status.SetFocus else Simpan.SetFocus;
end;

procedure TProductPriceDetail.DestinationKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Fuel.SetFocus;
end;

procedure TProductPriceDetail.VehicleGroupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Seat.SetFocus;
end;


procedure TProductPriceDetail.StatusKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TProductPriceDetail.SeatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Destination.SetFocus;
end;

procedure TProductPriceDetail.VehicleGroupChange(Sender: TObject);
begin
  RefreshSeat;
end;

end.
