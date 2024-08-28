unit VehicleListRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid,
  ComCtrls;

type
  TVehicleListRpt = class(TForm)
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
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariArmadaClick(Sender: TObject);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VehicleArr:Array of TArrString25;
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
  VehicleListRpt: TVehicleListRpt;

implementation

uses MainU;

{$R *.dfm}

constructor TVehicleListRpt.Create(AOwner:TComponent;VehicleType:String;Form_Request:String='');
begin
  MaxCol:=22;
  FormRequest:=Form_Request;
  Initiation :=True;
  Main.WriteLog('Form Open: VehicleListRpt=FormRequest='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TVehicleListRpt.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleListRpt.Init;
var IntCount:Integer;
begin
  Caption:='Data Armada Bus';

  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=1;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='No Bodi';
  StrGrid.Cells[3,0]:='No Mesin';
  StrGrid.Cells[4,0]:='No Rangka';
  StrGrid.Cells[5,0]:='No Polisi';
  StrGrid.Cells[6,0]:='Tahun';
  StrGrid.Cells[7,0]:='STNK s/d';
  StrGrid.Cells[8,0]:='KIR S/d';
  StrGrid.Cells[9,0]:='KIU S/d';
  StrGrid.Cells[10,0]:='KP S/d';

        StrGrid.Cells[11,0]:='Pajak S/d';
        StrGrid.Cells[12,0]:='Seat';
        StrGrid.ColWidths[11]:=65;
        StrGrid.Cells[13,0]:='Facelift';
        StrGrid.Cells[14,0]:='No Uji KIR';
        StrGrid.Cells[15,0]:='No EToll';
        StrGrid.Cells[16,0]:='No KP';
        StrGrid.Cells[17,0]:='STNK Pemilik';

        StrGrid.Cells[18,0]:='No SIM Card';
        StrGrid.Cells[19,0]:='SSID';
        StrGrid.Cells[20,0]:='No Asset';
        StrGrid.Cells[21,0]:='Router';
        StrGrid.ColWidths[13]:=50;
        StrGrid.ColWidths[14]:=130;
        StrGrid.ColWidths[15]:=150;
        StrGrid.ColWidths[16]:=100;
        StrGrid.ColWidths[17]:=150;

        StrGrid.ColWidths[18]:=80;
        StrGrid.ColWidths[19]:=80;
        StrGrid.ColWidths[20]:=100;
        StrGrid.ColWidths[21]:=150;


  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=120;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=65;
  StrGrid.ColWidths[6]:=40;
  StrGrid.ColWidths[7]:=65;
  StrGrid.ColWidths[8]:=65;
  StrGrid.ColWidths[9]:=65;
  StrGrid.ColWidths[10]:=65;


  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,1]:='';
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleListRpt.RefreshCombo;
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
    StrQry:='EXEC GetCompanyAssetLocation @AssetCompanyId='+CompanyId+',@isGroup=1;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+1);
    GroupArr[0][0]:='All';
    GroupArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['id'];
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

procedure TVehicleListRpt.KeluarClick(Sender: TObject);
begin
  VehicleListRpt.Close;
end;

procedure TVehicleListRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleListRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
  Initiation:=False;
  RefreshList;
end;

procedure TVehicleListRpt.RefreshList;
var Count,Count2:Integer;
    StrQry,Str,StrLocation,StrGroup,StrCompany,StrOrderBy,StrDate,StrNames:String;
    QVhc:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(VehicleArr)-1 do begin
    for Count2:=0 to MaxCol do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(VehicleArr,0);
  StrLocation:=CompanyArr[SBU.ItemIndex][2];
  StrCompany:='@AssetCompanyId='+CompanyArr[SBU.ItemIndex][1];

  if (Group.Text<>'All') then StrGroup:=',@CompanyId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
  QVhc:=TADOQuery.Create(Self);
  QVhc.Connection:=Main.MyConnection;
  QVhc.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyAssetLocation '+StrCompany+StrGroup+';';
    Main.WriteLog('SQL :'+StrQry,2);
    QVhc.SQL.Add(StrQry);
    QVhc.Open;
    Count:=0;
    Count:=0;
    if (QVhc.RecordCount>0) then while not(QVhc.Eof) do begin
      SetLength(VehicleArr,Count+1);
        VehicleArr[Count][0]:=QVhc.FieldValues['vehicle_id'];
        VehicleArr[Count][1]:=QVhc.FieldValues['location'];
        VehicleArr[Count][2]:=QVhc.FieldValues['body_id'];
        if QVhc.FieldValues['engine_id']<>NULL then
          VehicleArr[Count][3]:=QVhc.FieldValues['engine_id'];
        if QVhc.FieldValues['chasis_id']<>NULL then
        VehicleArr[Count][4]:=QVhc.FieldValues['chasis_id'];
        if IsCharAlpha(PChar(Copy(QVhc.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[Count][5]:=Copy(QVhc.FieldValues['license_plate'],1,1)+' '+Copy(QVhc.FieldValues['license_plate'],2,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],6,Length(QVhc.FieldValues['license_plate'])+1)
        else
          VehicleArr[Count][5]:=Copy(QVhc.FieldValues['license_plate'],1,2)+' '+Copy(QVhc.FieldValues['license_plate'],3,4)+
                              ' '+Copy(QVhc.FieldValues['license_plate'],7,Length(QVhc.FieldValues['license_plate'])+1);
        if QVhc.FieldValues['year']<>NULL then
          VehicleArr[Count][6]:=QVhc.FieldValues['year'];
//        VehicleArr[Count][7]:=QVhc.FieldValues['vhc_batch_id'];
        if QVhc.FieldValues['stnk']<>NULL then
          VehicleArr[Count][7]:=QVhc.FieldValues['stnk'];
        if QVhc.FieldValues['kir']<>NULL then
          VehicleArr[Count][8]:=QVhc.FieldValues['kir'];
        if QVhc.FieldValues['kiu']<>NULL then
          VehicleArr[Count][9]:=QVhc.FieldValues['kiu'];
        if QVhc.FieldValues['kio']<>NULL then
          VehicleArr[Count][10]:=QVhc.FieldValues['kio'];

        if QVhc.FieldValues['tera']<>NULL then VehicleArr[Count][11]:=QVhc.FieldValues['tera'];
        if QVhc.FieldValues['seat']<>NULL then VehicleArr[Count][12]:=QVhc.FieldValues['seat'];
        if QVhc.FieldValues['is_facelift']<>NULL then begin
          if (QVhc.FieldValues['is_facelift']=1) then VehicleArr[Count][13]:='V' else VehicleArr[Count][13]:='';
        end;

        if QVhc.FieldValues['no_uji_kir']<>NULL then VehicleArr[Count][14]:=QVhc.FieldValues['no_uji_kir'];

        if QVhc.FieldValues['etoll_number']<>NULL then VehicleArr[Count][15]:=QVhc.FieldValues['etoll_number'];
        if QVhc.FieldValues['no_kp']<>NULL then VehicleArr[Count][16]:=QVhc.FieldValues['no_kp'];
        if QVhc.FieldValues['stnk_owner_name']<>NULL then VehicleArr[Count][17]:=QVhc.FieldValues['stnk_owner_name'];

        if QVhc.FieldValues['msisdn']<>NULL then VehicleArr[Count][18]:=QVhc.FieldValues['msisdn'];
        if QVhc.FieldValues['ssid']<>NULL then VehicleArr[Count][19]:=QVhc.FieldValues['ssid'];
        if QVhc.FieldValues['asset_no']<>NULL then VehicleArr[Count][20]:=QVhc.FieldValues['asset_no'];
        if QVhc.FieldValues['router']<>NULL then VehicleArr[Count][21]:=QVhc.FieldValues['router'];

        if QVhc.FieldValues['asset_id']<>NULL then VehicleArr[Count][22]:=QVhc.FieldValues['asset_id'];

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
    for Count2:=0 to 22 do
    StrGrid.Cells[Count2,Count+1]:=VehicleArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(VehicleArr));
  Main.M_Normal;
end;

procedure TVehicleListRpt.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleListRpt.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleListRpt.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin

  if (Trim(Cari.Text)='') then
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

procedure TVehicleListRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleListRpt.CariKeyPress(Sender: TObject; var Key: Char);
begin

  if Key=#13 then begin
       CariArmadaClick(Nil);
  end;

end;

procedure TVehicleListRpt.CariArmadaClick(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 21 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 21 do
          StrGrid.Cells[Count4,Count2-1]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
    Total.Text:=IntToStr(Count2-2);
  end else
    RefreshList;
end;

end.
