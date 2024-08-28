unit ProductU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TProduct = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    LabelAktif: TLabel;
    PanelId: TPanel;
    ProductId: TEdit;
    Label5: TLabel;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupInput: TPanel;
    Name: TEdit;
    VehicleType: TComboBox;
    Hours: TEdit;
    Label4: TLabel;
    OneDay: TCheckBox;
    Status: TCheckBox;
    Overland: TCheckBox;
    Label18: TLabel;
    Label6: TLabel;
    Seat: TComboBox;
    Label9: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleTypeKeyPress(Sender: TObject; var Key: Char);
    procedure HoursKeyPress(Sender: TObject; var Key: Char);
    procedure OneDayKeyPress(Sender: TObject; var Key: Char);
    procedure HoursExit(Sender: TObject);
    procedure OverlandKeyPress(Sender: TObject; var Key: Char);
    procedure VehicleTypeChange(Sender: TObject);
    procedure SeatKeyPress(Sender: TObject; var Key: Char);
    procedure OneDayClick(Sender: TObject);
    procedure OverlandClick(Sender: TObject);
    procedure HoursChange(Sender: TObject);
  private
    { Private declarations }
    ProdId:String;
    IsInput:Boolean;
    VhcTypeArr,SeatArr:Array of TArrString8;
    procedure Init;
    procedure RefreshJenis;
    procedure RefreshSeat;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Product_Id:String='';Input_Only:Boolean=False);Overload;
  end;

var
  Product: TProduct;

implementation

uses MainU, ADODB, ProductListU;

{$R *.dfm}

constructor TProduct.Create(AOwner:TComponent;Product_Id:String='';Input_Only:Boolean=False);
begin
  ProdId:=Product_Id;
  IsInput:=not(Input_Only);
  inherited Create(AOwner);
end;

procedure TProduct.Init;
begin
  ProductId.Text:='';
  Name.Text:='';
  Hours.Text:='';
  OneDay.Checked:=False;
  Overland.Checked:=False;
  Status.Checked:=False;
  Hours.Enabled:=True;
  OneDay.Enabled:=True;
  Overland.Enabled:=True;
  Seat.Text:='';
  Seat.Clear;
  Seat.ItemIndex:=-1;
  if ProdId='' then begin
    Status.Visible:=False;
    LabelAktif.Visible:=False;
    Bersihkan.Enabled:=True;
  end else begin
    Status.Visible:=True;
    LabelAktif.Visible:=True;
    Bersihkan.Enabled:=False;
  end;
end;

procedure TProduct.RefreshJenis;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  VehicleType.Text:='';
  VehicleType.Clear;
  VehicleType.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(VhcTypeArr,0);
    StrQry:='EXEC GetVehicleGroup '+CompanyId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VhcTypeArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      VhcTypeArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      VhcTypeArr[IntCount][1]:=Qry.FieldValues['name'] ;
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(VhcTypeArr)-1 do
    VehicleType.Items.Add(VhcTypeArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TProduct.RefreshSeat;
var Qry:TADOQuery;
    StrQry,StrJenis,StrCompanyId:String;
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
    StrJenis:=VhcTypeArr[VehicleType.ItemIndex][0];
    StrCompanyId:=CompanyId;
    StrQry:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+StrJenis+',@GroupBy=1;';
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

procedure TProduct.LoadData;
var Qry:TADOQuery;
    StrQry,StrSeat:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetProductDetail '+QuotedStr(ProdId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ProductId.Text:=Qry.FieldValues['product_id'];
      Name.Text:=Qry.FieldValues['name'];
      VehicleType.ItemIndex:=VehicleType.Items.IndexOf(Qry.FieldValues['batch_name']);
      StrSeat:=Qry.FieldValues['seat'];
      Hours.Text:=Qry.FieldValues['hour'];
      if Qry.FieldValues['full_day']=1 then OneDay.Checked:=True;
      if Qry.FieldValues['full_day']=2 then Overland.Checked:=True;
      if Qry.FieldValues['status']=1 then Status.Checked:=True;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  RefreshSeat;
  Seat.ItemIndex:=Seat.Items.IndexOf(StrSeat); 
  Main.M_Normal;
end;

procedure TProduct.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TProduct.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;



procedure TProduct.FormShow(Sender: TObject);
begin
  Init;
  RefreshJenis;
  if not(IsInput) then DisableInput;
  if ProdId<>'' then LoadData;
end;

procedure TProduct.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrName,StrVhcType,StrSeat,StrHours,StrOneDay,StrStatus,StrLocationId:String;
    StrTransId,StrEMsg:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Name.Text)<>'') and (VehicleType.Text<>'') and (Seat.Text<>'') and ((Trim(Hours.Text)<>'') OR (OneDay.Checked=True) OR (Overland.Checked=True) )then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyId;
      StrLocationId:=LocationId;
      StrVhcType:=VhcTypeArr[VehicleType.ItemIndex][0];
      StrName:=QuotedStr(Trim(Name.Text));
      StrSeat:=Seat.Text;
      if Trim(Hours.Text)<>'' then StrHours:=Hours.Text else StrHours:='0';
      StrOneDay:='0';
      if OneDay.Checked=True then StrOneDay:='1';
      if Overland.Checked=True then StrOneDay:='2';
      if Status.Visible=True then if Status.Checked=True then StrStatus:='1' else StrStatus:='0';
      if (ProdId<>'')  then begin
        StrTransId:=ProdId;
        StrQry:='UPDATE wh_product SET name='+StrName+',vhc_batch_id='+StrVhcType+',seat='+StrSeat+',hour='+StrHours+
                ',full_day='+StrOneDay+',status='+StrStatus+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE product_id='+QuotedStr(StrTransId)+';';
      end else begin
        StrQry:='SELECT RIGHT(MAX(product_id),4) AS max_id FROM wh_product '+
                'WHERE product_id  LIKE '+QuotedStr('PD'+CompanyCode+ FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____')+';';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='PD'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_product (product_id,company_id,location_id,name,vhc_batch_id,seat,hour,full_day,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrName+','+StrVhcType+','+StrSeat+','+StrHours+','+StrOneDay+','+QuotedStr(User)+');';
      end;
      Qry.SQL.Clear;
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
        ProductId.Text:=StrTransId;
        MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Produk',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('ProductList') then ProductList.RefreshDisplay;
      end else begin
        Main.TransRollback;
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

procedure TProduct.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TProduct.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshJenis;
  EnableInput;
  Name.SetFocus;
end;

procedure TProduct.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then VehicleType.SetFocus;
end;

procedure TProduct.VehicleTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Seat.SetFocus;
end;

procedure TProduct.HoursKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then if (Hours.Text='0') or (Hours.Text='') then OneDay.SetFocus else Simpan.SetFocus;
end;

procedure TProduct.OneDayKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Overland.Enabled then Overland.SetFocus else if Status.Visible=True then Status.SetFocus else Simpan.SetFocus;
end;

procedure TProduct.HoursExit(Sender: TObject);
begin
  if Trim(Hours.Text)='' then Hours.Text:='0';
end;

procedure TProduct.OverlandKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if Status.Visible=True then Status.SetFocus else Simpan.SetFocus;
end;

procedure TProduct.VehicleTypeChange(Sender: TObject);
begin
  if Trim(VehicleType.Text)<>'' then RefreshSeat; 
end;

procedure TProduct.SeatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Hours.SetFocus;
end;

procedure TProduct.OneDayClick(Sender: TObject);
begin
  if OneDay.Checked=True then begin
    Hours.Text:='0';
    Hours.Enabled:=False;
    Overland.Enabled:=False;
  end else begin
    Hours.Enabled:=True;
    Overland.Enabled:=True;
  end;
end;

procedure TProduct.OverlandClick(Sender: TObject);
begin
  if Overland.Checked=True then begin
    Hours.Text:='0';
    Hours.Enabled:=False;
//    OneDay.Enabled:=False;
  end else begin
    Hours.Enabled:=True;
//    OneDay.Enabled:=True;
  end;
end;

procedure TProduct.HoursChange(Sender: TObject);
begin
  if Trim(Hours.Text)<>'' then begin
    if StrToInt(Trim(Hours.Text))>0 then begin
//      OneDay.Enabled:=False;
      Overland.Enabled:=False;
    end else begin
//      OneDay.Enabled:=True;
      Overland.Enabled:=True;
    end;
  end else begin
//      OneDay.Enabled:=True;
      Overland.Enabled:=True;
  end;
end;

end.
