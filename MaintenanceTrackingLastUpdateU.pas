unit MaintenanceTrackingLastUpdateU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons;

type
  TMaintenanceTrackingLastUpdate = class(TForm)
    Label1: TLabel;
    Body: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    Label2: TLabel;
    Group: TComboBox;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Cari: TEdit;
    CariArmada: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariArmadaClick(Sender: TObject);
  private
    { Private declarations }
    ColumnWidth:Integer;
    CompanyArr,GroupArr:Array of TArrString5;
    VehicleArr:Array of TArrString10;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
//    procedure RefreshBody;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  MaintenanceTrackingLastUpdate: TMaintenanceTrackingLastUpdate;

implementation

uses MainU, ADODB;

{$R *.dfm}

procedure TMaintenanceTrackingLastUpdate.Init;
begin
  ColumnWidth:=60;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Body.Items.Clear;
  Body.Text:='';
  Body.ItemIndex:=0;
  InitGrid;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TMaintenanceTrackingLastUpdate.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=17;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(12,0,12,1);
  StrGrid.MergeCells.AddRectXY(13,0,13,1);
  StrGrid.MergeCells.AddRectXY(14,0,14,1);
  StrGrid.MergeCells.AddRectXY(15,0,15,1);
  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(4,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,11,0);
  for Count:=0 to 16 do
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  for Count:=4 to 7 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  for Count:=8 to 11 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=50;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=60;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=50;
  StrGrid.ColWidths[7]:=50;
  StrGrid.ColWidths[11]:=40;
  StrGrid.ColWidths[12]:=100;
  StrGrid.ColWidths[14]:=100;
  StrGrid.ColWidths[15]:=100;
  StrGrid.ColWidths[16]:=50;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='No Rangka';
  StrGrid.Cells[4,0]:='Posisi Odometer (Km)';
  StrGrid.Cells[4,1]:='Lalu';
  StrGrid.Cells[5,1]:='Sekarang';
  StrGrid.Cells[6,1]:='Berikutnya';
  StrGrid.Cells[7,1]:='Sisa Km';
  StrGrid.Cells[8,0]:='Tanggal';
  StrGrid.Cells[8,1]:='Lalu';
  StrGrid.Cells[9,1]:='Sekarang';
  StrGrid.Cells[10,1]:='Berikut';
  StrGrid.Cells[11,1]:='Sisa hari';
  StrGrid.Cells[12,0]:='Jenis Pekerjaan';
  StrGrid.Cells[13,0]:='Interval';
  StrGrid.Cells[14,0]:='Part Description';
  StrGrid.Cells[15,0]:='Part Number';
  StrGrid.Cells[16,0]:='Qty';
  for Count:=0 to 17 do
    StrGrid.Cells[Count,2]:='';
//  for Count:=4 to 31 do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TMaintenanceTrackingLastUpdate.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
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
  Main.CloseDb;
  Qry.Destroy;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TMaintenanceTrackingLastUpdate.RefreshData;
var StrQry,StrCompanyId,StrLocationId,StrGroup:String;
    Qry,Qry2:TADOQuery;
    IntCount,IntCount2,IntCount3,IntTotal:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  SetLength(VehicleArr,0);
  if Main.OpenDb then begin
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if (Group.Text<>'All') then StrGroup:=',@BatchId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
    StrQry:='EXEC GetVhcList '+StrLocationId+',0,'+StrCompanyId+StrGroup+',@LastOdo=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VehicleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VehicleArr[IntCount][0]:=Qry.FieldValues['body_id'];
      VehicleArr[IntCount][1]:=LicensePlate(Qry.FieldValues['license_plate']);

      if Qry.FieldValues['chasis_id']<>NULL then VehicleArr[IntCount][2]:=Qry.FieldValues['chasis_id'];
      if Qry.FieldValues['last_repair_odo']<>NULL then VehicleArr[IntCount][3]:=IToCurr(Qry.FieldValues['last_repair_odo']);
      if Qry.FieldValues['last_odo']<>NULL then VehicleArr[IntCount][4]:=IToCurr(Qry.FieldValues['last_odo']);
//      StrQry='EXEC GetLastOdo '+
{    if Qry.FieldValues['body_id']<>NULL then StrGrid.Cells[3,Count]:=Qry.FieldValues['body_id'];
    QStr:='SELECT CONVERT(VARCHAR(2),out_date,103) AS tgl,dbo.FormatMoney(gross_argo) AS gross_argo '+
          ' FROM wh_vhc_trans '+
          ' WHERE employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+' AND (out_date BETWEEN'+
          Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan))+Chr(39)+' AND '+
          Chr(39)+FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan))+Chr(39)+') AND (in_date IS NOT NULL) AND'+
          ' (cancel IS NULL);';
    Qry2.SQL.Clear;
    Qry2.SQL.Add(QStr);
    Qry2.Open;
    IntTotal:=0;
    if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
      StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['gross_argo'];
      IntTotal:=IntTotal+SToInt(Qry2.FieldValues['gross_argo']);
      Qry2.Next;
    end;
    Qry2.Close;
}
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceTrackingLastUpdate.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to Length(VehicleArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+2]:=VehicleArr[IntCount][0];
    StrGrid.Cells[2,IntCount+2]:=VehicleArr[IntCount][1];
    StrGrid.Cells[3,IntCount+2]:=VehicleArr[IntCount][2];
    StrGrid.Cells[4,IntCount+2]:=VehicleArr[IntCount][3];
    StrGrid.Cells[5,IntCount+2]:=VehicleArr[IntCount][4];
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TMaintenanceTrackingLastUpdate.SelesaiClick(Sender: TObject);
begin
  MaintenanceTrackingLastUpdate.Close;
end;

procedure TMaintenanceTrackingLastUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceTrackingLastUpdate.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
  RefreshData;
  RefreshGrid;
end;

procedure TMaintenanceTrackingLastUpdate.GroupChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TMaintenanceTrackingLastUpdate.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TMaintenanceTrackingLastUpdate.CariArmadaClick(Sender: TObject);
var IntCount,IntCount2,IntCount3,IntCount4:Integer;
    IsTrue:Boolean;
begin
  if Cari.Text<>'' then begin
    for IntCount:=0 to StrGrid.ColCount-1 do
      for IntCount2:=2 to StrGrid.RowCount-1 do begin
        StrGrid.Cells[IntCount,IntCount2]:='';
        StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      end;
    IntCount2:=2;
    for IntCount:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for IntCount3:=0 to 5 do
      if (StrPos(PChar(UpperCase(VehicleArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=IntCount2+1;
          StrGrid.Cells[0,IntCount2]:=IntToStr(IntCount2-1);
          for IntCount4:=1 to 5 do
            StrGrid.Cells[IntCount4,IntCount2]:=VehicleArr[IntCount][IntCount4-1];
          StrGrid.CellStyle[4,IntCount2].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[5,IntCount2].HorizontalAlignment:=taRightJustify;
          Inc(IntCount2);
      end;
    end;

  end else RefreshGrid;
end;

end.
