unit KmActualUnitRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons;

type
  TKmActualUnitRpt = class(TForm)
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
    LiatData: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariArmadaClick(Sender: TObject);
    procedure LiatDataClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    ColumnWidth:Integer;
    CompanyArr,GroupArr:Array of TArrString5;
    VehicleArr:Array of TArrString11;
    IntRow:Integer;
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
  KmActualUnitRpt: TKmActualUnitRpt;
   IntRow,IntCol:Integer;

implementation

uses MainU, ADODB, MaintenanceTrackingLastUpdateU, WorkOrderFormInU,
  WorkOrderFormU, ArmadaJalanTerakhirU;

{$R *.dfm}

procedure TKmActualUnitRpt.Init;
begin
  ColumnWidth:=60;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Body.Items.Clear;
  Body.Text:='';
  Body.ItemIndex:=0;
  IntRow:=0;
  InitGrid;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TKmActualUnitRpt.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=13;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  //StrGrid.MergeCells.AddRectXY(13,0,13,1);
  //StrGrid.MergeCells.AddRectXY(14,0,14,1);
  //StrGrid.MergeCells.AddRectXY(15,0,15,1);
  //StrGrid.MergeCells.AddRectXY(16,0,16,1);
  //StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(4,0,9,0);
  StrGrid.MergeCells.AddRectXY(10,0,12,0);
  for Count:=0 to 13 do
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  for Count:=4 to 8 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  for Count:=9 to 12 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=170;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=80;
  StrGrid.ColWidths[11]:=80;
  StrGrid.ColWidths[12]:=100;
 // StrGrid.ColWidths[12]:=0;
  //StrGrid.ColWidths[14]:=0;
  //StrGrid.ColWidths[15]:=0;
  //StrGrid.ColWidths[16]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Type Kendaraan';
  StrGrid.Cells[4,0]:='Perjalanan Terakhir';
  StrGrid.Cells[4,1]:='Tanggal';
  StrGrid.Cells[5,1]:='Odometer(Km) Out';
  StrGrid.Cells[6,1]:='Odometer(Km) In';
  StrGrid.Cells[7,1]:='Selisih';
  StrGrid.Cells[8,1]:='BBM (L)';
  StrGrid.Cells[9,1]:='No SJ';
  StrGrid.Cells[10,0]:='Servis Terahir';
  StrGrid.Cells[10,1]:='Tanggal';
  StrGrid.Cells[11,1]:='Odometer(Km)';
  StrGrid.Cells[12,1]:='No PKB';
 // StrGrid.Cells[12,1]:='Sisa hari';
  //StrGrid.Cells[13,0]:='Jenis Pekerjaan';
  //StrGrid.Cells[14,0]:='Interval';
  //StrGrid.Cells[15,0]:='Part Description';
  //StrGrid.Cells[16,0]:='Part Number';
  //StrGrid.Cells[17,0]:='Qty';
  for Count:=0 to 12 do
    StrGrid.Cells[Count,2]:='';
//  for Count:=4 to 31 do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TKmActualUnitRpt.RefreshCombo;
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

procedure TKmActualUnitRpt.RefreshData;
var StrQry,StrQry2,StrQry3,StrCompanyId,StrLocationId,StrGroup:String;
    Qry,Qry2,Qry3:TADOQuery;
    IntCount,IntTotal:Integer;   //IntCount2,IntCount3,
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout:=3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout:=3600;
  SetLength(VehicleArr,0);
  if Main.OpenDb then begin
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if (Group.Text<>'All') then StrGroup:=',@BatchId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
    StrQry:='EXEC GetVhcListMini '+StrLocationId+',0,'+StrCompanyId+StrGroup+',@LastOdo=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VehicleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VehicleArr[IntCount][0]:=Qry.FieldValues['body_id'];
     // VehicleArr[IntCount][1]:=LicensePlate(Qry.FieldValues['license_plate']);

       if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[IntCount][1]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          VehicleArr[IntCount][1]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

      VehicleArr[IntCount][2]:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
      //if Qry.FieldValues['last_repair_odo']<>NULL then VehicleArr[IntCount][3]:=IToCurr(Qry.FieldValues['last_repair_odo']);
      //if Qry.FieldValues['last_odo']<>NULL then VehicleArr[IntCount][4]:=IToCurr(Qry.FieldValues['last_odo']);
//      StrQry='EXEC GetLastOdo '+
      if Qry.FieldValues['vehicle_id']<>NULL then  begin
        StrQry2:='Exec GetVhcTransTerakhir '+ QuotedStr(Qry.FieldValues['vehicle_id'])+';';
        Qry2.SQL.Clear;
        Qry2.SQL.Add(StrQry2);
        Qry2.Open;
       // IntTotal:=0;
        if Qry2.RecordCount>0 then while Not(Qry2.Eof) do begin
          VehicleArr[IntCount][3] := Qry2.FieldValues['tanggal'];
          if Qry2.FieldValues['out_ordo_km'] <> NULL then VehicleArr[IntCount][4] := IToCurr(Qry2.FieldValues['out_ordo_km']);
          if Qry2.FieldValues['in_ordo_km'] <> NULL then VehicleArr[IntCount][5] := IToCurr(Qry2.FieldValues['in_ordo_km']);
           VehicleArr[IntCount][6] := IToCurr(Qry2.FieldValues['in_ordo_km']-Qry2.FieldValues['out_ordo_km']);
          if Qry2.FieldValues['fuel_litre'] <> null then VehicleArr[IntCount][7] := IToCurr(Qry2.FieldValues['fuel_litre'])
          else VehicleArr[IntCount][7] := '0';

          if Qry2.FieldValues['vhc_trans_id'] <> null then VehicleArr[IntCount][11] := Qry2.FieldValues['vhc_trans_id']
          else VehicleArr[IntCount][11] := '0';
         // StrGrid.Cells[(3+Qry2.FieldValues['tgl']),Count]:=Qry2.FieldValues['gross_argo'];
         // IntTotal:=IntTotal+SToInt(Qry2.FieldValues['gross_argo']);
          Qry2.Next;
        end;
        Qry2.Close;

        StrQry3:='SELECT * FROM wh_work_order WHERE work_order_id IN( '+
		            ' SELECT MAX(work_order_id) FROM wh_work_order '+
		            ' WHERE (vehicle_id='+QuotedStr(Qry.FieldValues['vehicle_id'])+') AND (odo_in IS NOT NULL) AND (odo_in>0));';
        Qry3.SQL.Clear;
        Qry3.SQL.Add(StrQry3);
        Qry3.Open;
       // IntTotal:=0;
        if Qry3.RecordCount>0 then while Not(Qry3.Eof) do begin
          VehicleArr[IntCount][8] := Qry3.FieldValues['date_in'];
          if Qry3.FieldValues['odo_in'] <> NULL then VehicleArr[IntCount][9] := IToCurr(Qry3.FieldValues['odo_in']);
          // VehicleArr[IntCount][10] := IToCurr(Qry3.FieldValues['odo_in']-Qry3.FieldValues['odo_in']);
          if Qry3.FieldValues['work_order_id'] <> null then VehicleArr[IntCount][10] := Qry3.FieldValues['work_order_id']
          else VehicleArr[IntCount][10] := '';
          Qry3.Next;
        end;
        Qry3.Close;

      end;

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TKmActualUnitRpt.RefreshGrid;
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
    StrGrid.Cells[6,IntCount+2]:=VehicleArr[IntCount][5];
    StrGrid.Cells[7,IntCount+2]:=VehicleArr[IntCount][6];
    StrGrid.Cells[8,IntCount+2]:=VehicleArr[IntCount][7];
    StrGrid.Cells[9,IntCount+2]:=VehicleArr[IntCount][11];
    StrGrid.Cells[10,IntCount+2]:=VehicleArr[IntCount][8];
    StrGrid.Cells[11,IntCount+2]:=VehicleArr[IntCount][9];
    StrGrid.Cells[12,IntCount+2]:=VehicleArr[IntCount][10];
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TKmActualUnitRpt.SelesaiClick(Sender: TObject);
begin
  KmActualUnitRpt.Close;
end;

procedure TKmActualUnitRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TKmActualUnitRpt.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
 // RefreshData;
 // RefreshGrid;
end;

procedure TKmActualUnitRpt.GroupChange(Sender: TObject);
begin
 // RefreshData;
  //RefreshGrid;
end;

procedure TKmActualUnitRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TKmActualUnitRpt.CariArmadaClick(Sender: TObject);
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
      for IntCount3:=0 to 11 do
      if (StrPos(PChar(UpperCase(VehicleArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=IntCount2+1;
          StrGrid.Cells[0,IntCount2]:=IntToStr(IntCount2-1);
          for IntCount4:=1 to 12 do
            StrGrid.Cells[IntCount4,IntCount2]:=VehicleArr[IntCount][IntCount4-1];
            StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taRightJustify;
          Inc(IntCount2);
      end;
    end;

  end else RefreshGrid;
end;

procedure TKmActualUnitRpt.LiatDataClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TKmActualUnitRpt.StrGridDblClick(Sender: TObject);
begin
  if IntRow>0 then begin
    Case IntCol of
      9:begin
          if StrGrid.Cells[9,IntRow]<>'' then begin
            if FormRequest='' then begin
                if Main.IsFormOpen('ArmadaJalanTerakhir')=False then ArmadaJalanTerakhir:=TArmadaJalanTerakhir.Create(nil,StrGrid.Cells[9,IntRow],True);
             end;
          end
        end;

      12:begin
          if StrGrid.Cells[12,IntRow]<>'' then begin
            if FormRequest='' then begin
              //if StrGrid.Cells[5,IntRow]<>'' then begin
               // if Main.IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(nil,StrGrid.Cells[11,IntRow],True);
             // end else begin
                if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[12,IntRow],True);
             end;
          end
        end;
    end;
  end;
end;

procedure TKmActualUnitRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

end.
