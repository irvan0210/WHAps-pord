unit VehicleTopupRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid,
  ComCtrls;

type
  TVehicleTopupRpt = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Total: TEdit;
    Cari: TEdit;
    Keluar: TButton;
    StrGrid: TZColorStringGrid;
    Group: TComboBox;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    CariArmada: TSpeedButton;
    Label2: TLabel;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariArmadaClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VehicleArr:Array of TArrString40;
    CompanyArr,GroupArr:Array of TArrString5;
    OrderBy,Sorted:String;
    IntRow,IntCol,IntColPrev:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    VhcType:Integer;
    Initiation:Boolean;

    constructor Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');Overload;
    procedure RefreshList;
    procedure ClearCari;
    procedure Search;

  end;

var
  VehicleTopupRpt: TVehicleTopupRpt;

implementation

uses MainU;

{$R *.dfm}

constructor TVehicleTopupRpt.Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Initiation :=True;
  Main.WriteLog('Form Open: VehicleTopupRpt=FormRequest='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TVehicleTopupRpt.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleTopupRpt.Init;
var IntCount:Integer;
begin
  MaxCol:=33;
  VhcCompanyId:=StrToInt(CompanyId);
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='Tgl. Daftar';

  StrGrid.Cells[3,0]:='Nama Driver';
  StrGrid.Cells[4,0]:='No Telp.';
  StrGrid.Cells[5,0]:='Email';
  StrGrid.Cells[6,0]:='Alamat Pengemudi';
  StrGrid.Cells[7,0]:='No Polisi';
  StrGrid.Cells[8,0]:='Nama Pemilik';
  StrGrid.Cells[9,0]:='Alamat STNK';
  StrGrid.Cells[10,0]:='Merk';
  StrGrid.Cells[11,0]:='Type';
  StrGrid.Cells[12,0]:='Cylinder';

  StrGrid.Cells[13,0]:='Jenis';
  StrGrid.Cells[14,0]:='Model';
  StrGrid.Cells[15,0]:='Thn Prod.';
  StrGrid.Cells[16,0]:='Isi Silinder';

  StrGrid.Cells[17,0]:='No BPKB';
  StrGrid.Cells[18,0]:='No Mesin';
  StrGrid.Cells[19,0]:='No Rangka';
  StrGrid.Cells[20,0]:='Warna';
  StrGrid.Cells[21,0]:='Bahan Bakar';
  StrGrid.Cells[22,0]:='Warna TNKB';
  StrGrid.Cells[23,0]:='Thn Reg.';
  StrGrid.Cells[24,0]:='No KTP';
  StrGrid.Cells[25,0]:='TTL';
  StrGrid.Cells[26,0]:='No SIM';
  StrGrid.Cells[27,0]:='Exp SIM';

  StrGrid.Cells[28,0]:='STNK s/d';
  StrGrid.Cells[29,0]:='KIR s/d';
  StrGrid.Cells[30,0]:='KIU s/d';
  StrGrid.Cells[31,0]:='KIO s/d';
  StrGrid.Cells[32,0]:='Tera s/d';

  StrGrid.ColWidths[29]:=65;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=80; {Tgl. Daftar}
  StrGrid.ColWidths[3]:=130;
  StrGrid.ColWidths[4]:=120;
  StrGrid.ColWidths[5]:=140;
  StrGrid.ColWidths[6]:=180;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=160; {alamat}
  StrGrid.ColWidths[10]:=75;
  StrGrid.ColWidths[11]:=200;  {Tipe}
  StrGrid.ColWidths[12]:=60;  {Silinder}

  StrGrid.ColWidths[13]:=100; {Jenis}
  StrGrid.ColWidths[17]:=120;
  StrGrid.ColWidths[18]:=130;
  StrGrid.ColWidths[19]:=130;
  StrGrid.ColWidths[20]:=80;
  StrGrid.ColWidths[21]:=80;
  StrGrid.ColWidths[22]:=80;
  StrGrid.ColWidths[23]:=60;

  StrGrid.ColWidths[24]:=120;
  StrGrid.ColWidths[25]:=80;
  StrGrid.ColWidths[26]:=120;
  StrGrid.ColWidths[27]:=80;


  for IntCount:=0 to MaxCol-1 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleTopupRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND (company_id='+CompanyId+');';
    StrQry:='EXEC GetGroup '+CompanyId+';';
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
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);
end;

procedure TVehicleTopupRpt.KeluarClick(Sender: TObject);
begin
  VehicleTopupRpt.Close;
end;

procedure TVehicleTopupRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleTopupRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
  Initiation:=False;
  Tanggal.Date := Now;
  TglSampai.Date := Now;
  CekTglSampai.Checked := False;
  CekTglSampaiClick(Nil);
  RefreshList;
end;

procedure TVehicleTopupRpt.RefreshList;
var Count,Count2:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy,StrDate,StrNames:String;
    QVhc:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(VehicleArr)-1 do begin
    for Count2:=0 to 12 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(VehicleArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:='@CompanyId='+CompanyArr[SBU.ItemIndex][1];
  if CekTglSampai.Checked then begin
    StrDate := ',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@ToDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglSampai.Date));
  end else StrDate :='';
  if Trim(Cari.Text)<>'' then begin
    StrNames := ',@Names='+QuotedStr(Cari.Text);
  end else StrNames :='';

  if (Group.Text<>'All') then StrGroup:=',@BatchId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
  QVhc:=TADOQuery.Create(Self);
  QVhc.Connection:=Main.MyConnection;
  QVhc.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcList '+StrLocation+',0,'+StrCompany+StrGroup+StrDate+StrNames+OrderBy+Sorted+';';
    Main.WriteLog('SQL :'+StrQry,2);
    QVhc.SQL.Add(StrQry);
    QVhc.Open;
    Count:=0;
    if (QVhc.RecordCount>0) then while not(QVhc.Eof) do begin
      SetLength(VehicleArr,Count+1);
        VehicleArr[Count][0]:=QVhc.FieldValues['vehicle_id'];
        VehicleArr[Count][1]:=QVhc.FieldValues['location'];
        if QVhc.FieldValues['join_date']<>NULL then
          VehicleArr[Count][2]:=QVhc.FieldValues['join_date'];

        VehicleArr[Count][3]:=QVhc.FieldValues['driver'];
        VehicleArr[Count][4]:=QVhc.FieldValues['phone_no']+'/'+QVhc.FieldValues['cellular_no'];
        if QVhc.FieldValues['email']<>NULL then
          VehicleArr[Count][5]:=QVhc.FieldValues['email'];
        VehicleArr[Count][6]:=QVhc.FieldValues['addr_empl'];
        if IsCharAlpha(PChar(Copy(QVhc.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[Count][7]:=Copy(QVhc.FieldValues['license_plate'],1,1)+' '+Copy(QVhc.FieldValues['license_plate'],2,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],6,Length(QVhc.FieldValues['license_plate'])+1)
        else
          VehicleArr[Count][7]:=LicensePlate(QVhc.FieldValues['license_plate']);
        if QVhc.FieldValues['vhc_owner']<>NULL then
          VehicleArr[Count][8] :=QVhc.FieldValues['vhc_owner'];
        if QVhc.FieldValues['vhc_addr']<>NULL then
          VehicleArr[Count][9] :=QVhc.FieldValues['vhc_addr'];
        if QVhc.FieldValues['brand']<>NULL then
          VehicleArr[Count][10] :=QVhc.FieldValues['brand'];
        if QVhc.FieldValues['type']<>NULL then
          VehicleArr[Count][11]:=QVhc.FieldValues['type'];
        if QVhc.FieldValues['silinder']<>NULL then
          VehicleArr[Count][12]:=QVhc.FieldValues['silinder'];

        if QVhc.FieldValues['jenis']<>NULL then
          VehicleArr[Count][13]:=QVhc.FieldValues['jenis'];
        if QVhc.FieldValues['model']<>NULL then
          VehicleArr[Count][14]:=QVhc.FieldValues['model'];
        if QVhc.FieldValues['year_vhc']<>NULL then
          VehicleArr[Count][15]:=QVhc.FieldValues['year_vhc'];
        if QVhc.FieldValues['cylinder_vol']<>NULL then
          VehicleArr[Count][16]:=QVhc.FieldValues['cylinder_vol'];
        if QVhc.FieldValues['body_id']<>NULL then
          VehicleArr[Count][17]:=QVhc.FieldValues['body_id'];

        if QVhc.FieldValues['engine_id']<>NULL then
          VehicleArr[Count][18]:=QVhc.FieldValues['engine_id'];
        if QVhc.FieldValues['chasis_id']<>NULL then
          VehicleArr[Count][19]:=QVhc.FieldValues['chasis_id'];

        if QVhc.FieldValues['color']<>NULL then
          VehicleArr[Count][20]:=QVhc.FieldValues['color'];
        if QVhc.FieldValues['bahan_bakar']<>NULL then
          VehicleArr[Count][21]:=QVhc.FieldValues['bahan_bakar'];
        if QVhc.FieldValues['warna_tnkb']<>NULL then
          VehicleArr[Count][22]:=QVhc.FieldValues['warna_tnkb'];
        if QVhc.FieldValues['year_reg']<>NULL then
          VehicleArr[Count][23]:=QVhc.FieldValues['year_reg'];
        if QVhc.FieldValues['ktp']<>NULL then
          VehicleArr[Count][24]:=QVhc.FieldValues['ktp'];
        if QVhc.FieldValues['dob_ktp']<>NULL then
          VehicleArr[Count][25]:=QVhc.FieldValues['dob_ktp'];
        if QVhc.FieldValues['sim']<>NULL then
          VehicleArr[Count][26]:=QVhc.FieldValues['sim'];
        if QVhc.FieldValues['sim_exp']<>NULL then
          VehicleArr[Count][27]:=QVhc.FieldValues['sim_exp'];


        if QVhc.FieldValues['stnk']<>NULL then
          VehicleArr[Count][28]:=QVhc.FieldValues['stnk'];
        if QVhc.FieldValues['kir']<>NULL then
          VehicleArr[Count][29]:=QVhc.FieldValues['kir'];
        if QVhc.FieldValues['kiu']<>NULL then
          VehicleArr[Count][30]:=QVhc.FieldValues['kiu'];
        if QVhc.FieldValues['kio']<>NULL then
          VehicleArr[Count][31]:=QVhc.FieldValues['kio'];
        case VhcType of
          1:begin
              if QVhc.FieldValues['tera']<>NULL then VehicleArr[Count][32]:=QVhc.FieldValues['tera'];
              if QVhc.FieldValues['reguler']=1 then VehicleArr[Count][33]:='Reguler' else VehicleArr[Count][33]:='Eksekutif';
            end;
          2:begin
              if QVhc.FieldValues['seat']<>NULL then VehicleArr[Count][32]:=QVhc.FieldValues['seat'];
            end;
        end;
        QVhc.Next;
        Inc(Count);
    end;
    QVhc.Close;
  end;
  Main.CloseDb;
  QVhc.Destroy;
  if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+1
  else StrGrid.RowCount:=2;
  For Count:=0 to Length(VehicleArr)-1 do begin
    for Count2:=0 to 32 do
    StrGrid.Cells[Count2,Count+1]:=VehicleArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(VehicleArr));
  Main.M_Normal;
end;

procedure TVehicleTopupRpt.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleTopupRpt.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleTopupRpt.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin

  if (CekTglSampai.Checked) and (Trim(Cari.Text)<>'') then begin
      RefreshList;
  end else if (Trim(Cari.Text)='') then
      RefreshList
  else if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 13 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 13 do
          StrGrid.Cells[Count4,Count2-1]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end;
end;

procedure TVehicleTopupRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleTopupRpt.CariKeyPress(Sender: TObject; var Key: Char);
begin
{
  if Key=#13 then begin
       CariArmadaClick(Nil);
  end;
}  
end;

procedure TVehicleTopupRpt.CariArmadaClick(Sender: TObject);
begin
{
    if trim(Cari.Text) <> '' Then begin
      Initiation := True;
      Search;
    end else begin
      RefreshList;
      Initiation := False;
    end;
}
      RefreshList;
      Initiation := False;
end;

procedure TVehicleTopupRpt.CekTglSampaiClick(Sender: TObject);
begin
  //if not(Initiation) then begin
    if CekTglSampai.Checked=True then begin
        Tanggal.Enabled:=True;
        TglSampai.Enabled:=True;
        //Cari.Clear;
    end
    else begin
        TglSampai.Enabled:=False;
        Tanggal.Enabled:=False;
    end;
  //end;
end;

end.
