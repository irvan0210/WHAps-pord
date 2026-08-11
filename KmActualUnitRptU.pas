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
    Label5: TLabel;
    Seat: TComboBox;
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
    VehicleArr:Array of TArrString14;
    BatchArr,SeatArr:Array of TArrString2;
    IntRow:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshSeat;
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
  StrGrid.ColCount:=14;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  //StrGrid.MergeCells.AddRectXY(13,0,13,1);
  //StrGrid.MergeCells.AddRectXY(14,0,14,1);
  //StrGrid.MergeCells.AddRectXY(15,0,15,1);
  //StrGrid.MergeCells.AddRectXY(16,0,16,1);
  //StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(4,0,10,0);
  StrGrid.MergeCells.AddRectXY(11,0,13,0);
  for Count:=0 to 14 do
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  for Count:=4 to 9 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  for Count:=10 to 13 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=170;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=60;
  StrGrid.ColWidths[10]:=100;
  StrGrid.ColWidths[11]:=80;
  StrGrid.ColWidths[12]:=80;
  StrGrid.ColWidths[13]:=100;
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
  StrGrid.Cells[7,1]:='Odo In (Transtrack)';
  StrGrid.Cells[8,1]:='Selisih Odo';
  StrGrid.Cells[9,1]:='BBM (L)';
  StrGrid.Cells[10,1]:='No SJ';
  StrGrid.Cells[11,0]:='Servis Terahir';
  StrGrid.Cells[11,1]:='Tanggal';
  StrGrid.Cells[12,1]:='Odometer(Km)';
  StrGrid.Cells[13,1]:='No PKB';

  for Count:=0 to 13 do
    StrGrid.Cells[Count,2]:='';
//  for Count:=4 to 31 do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TKmActualUnitRpt.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    CompanyArrTemp:Array of TArrString5;
    SBUTempItems:TStringList;
    IsFound:Boolean;
    TempItemIndex:Integer;
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

  if SBU.ItemIndex<0 then begin
    {company/location user tidak ada di GetCompanyLocationList, cek lewat GetUserRDLocationList}
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetUserRDLocationList @UserName='+QuotedStr(User)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IsFound:=False;
      if Qry.RecordCount>0 then begin
        SetLength(CompanyArrTemp,Qry.RecordCount);
        SBUTempItems:=TStringList.Create;
        TempItemIndex:=-1;
        IntCount:=0;
        while Not(Qry.Eof) do begin
          CompanyArrTemp[IntCount][0]:=Qry.FieldValues['company_location_id'];
          CompanyArrTemp[IntCount][1]:=Qry.FieldValues['company_id'];
          CompanyArrTemp[IntCount][2]:=Qry.FieldValues['location_id'];
          CompanyArrTemp[IntCount][3]:=Qry.FieldValues['name'];
          CompanyArrTemp[IntCount][4]:=Qry.FieldValues['location'];
          CompanyArrTemp[IntCount][5]:=Qry.FieldValues['company_code'];
          SBUTempItems.Add(CompanyArrTemp[IntCount][3]+' ('+CompanyArrTemp[IntCount][4]+')');
          if (CompanyId=CompanyArrTemp[IntCount][1]) and (LocationId=CompanyArrTemp[IntCount][2]) then begin
            TempItemIndex:=IntCount;
            IsFound:=True;
          end;
          Inc(IntCount);
          Qry.Next;
        end;
        if IsFound then begin
          SBU.Items.Clear;
          SBU.Items:=SBUTempItems;
          SetLength(CompanyArr,Length(CompanyArrTemp));
          for IntCount:=0 to Length(CompanyArrTemp)-1 do
            CompanyArr[IntCount]:=CompanyArrTemp[IntCount];
          SBU.ItemIndex:=TempItemIndex;
        end;
        SBUTempItems.Free;
      end;
      Qry.Close;
    end;
    Main.CloseDb;
    Qry.Destroy;
  end;

  if (SBU.ItemIndex<0) and (Length(CompanyArr)>0) then SBU.ItemIndex:=0;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);
  Group.ItemIndex:=Group.Items.IndexOf('All');
  Main.M_Normal;
end;

procedure TKmActualUnitRpt.RefreshSeat;
var QStr,StrCompanyId:String;
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
  SeatArr[0][0]:='All';
  //if SBU.ItemIndex>=0 then StrCompanyId:=CompanyArr[SBU.ItemIndex][1] else StrCompanyId:='';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];

  if (Main.OpenDb) and (Group.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+GroupArr[Group.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
   
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
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

procedure TKmActualUnitRpt.RefreshData;
var StrQry,StrQry2,StrQry3,StrCompanyId,StrLocationId,StrGroup,StrSeat:String;
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
  if (Main.OpenDb) and (SBU.ItemIndex>=0) then begin
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    if (Group.Text<>'All') then StrGroup:=',@BatchId='+GroupArr[Group.ItemIndex][0] else StrGroup:='';
    if (Seat.Text<>'All') then StrSeat:=',@Seat='+Seat.Text else StrSeat:='';
    StrQry:='EXEC GetVhcListMini '+StrLocationId+',0,'+StrCompanyId+StrGroup+StrSeat+',@LastOdo=1;';
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
      VehicleArr[IntCount][13]:=VarToStr(Qry.FieldValues['category'])+' '+IntToStr(Qry.FieldValues['seat']);
      VehicleArr[IntCount][14]:=VarToStr(Qry.FieldValues['vhc_batch_id'])+'_'+IntToStr(Qry.FieldValues['seat']);
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

          if Qry2.FieldValues['transtrack_odo_in_km'] <> NULL then VehicleArr[IntCount][12] :=
          IToCurr(Qry2.FieldValues['transtrack_odo_in_km']);
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
var IntCount,IntCount2,IntMerge,Row,Number,NumGroups,TargetRowCount:Integer;
    StrBatchId,StrBatchName:String;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      IntMerge:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
      if IntMerge>=0 then StrGrid.MergeCells.DeleteItem(IntMerge);
    end;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
      StrGrid.CellStyle[IntCount,IntCount2].Font.Style:=[];
      StrGrid.CellStyle[IntCount,IntCount2].BGColor:=clWindow;
      StrGrid.CellStyle[IntCount,IntCount2].HorizontalAlignment:=taLeftJustify;
    end;

  NumGroups:=0;
  StrBatchId:='';
  for IntCount:=0 to Length(VehicleArr)-1 do begin
    if VehicleArr[IntCount][14]<>StrBatchId then begin
      StrBatchId:=VehicleArr[IntCount][14];
      Inc(NumGroups);
    end;
  end;

  if Length(VehicleArr)>0 then TargetRowCount:=Length(VehicleArr)+NumGroups+2
  else TargetRowCount:=3;
  StrGrid.RowCount:=TargetRowCount;
  StrGrid.HandleNeeded;

  Row:=2;
  Number:=0;
  StrBatchId:='';
  for IntCount:=0 to Length(VehicleArr)-1 do begin
    if VehicleArr[IntCount][14]<>StrBatchId then begin
      StrBatchId:=VehicleArr[IntCount][14];
      StrBatchName:=VehicleArr[IntCount][13];
      StrGrid.CellStyle[1,Row].BGColor:=clSkyBlue;
      StrGrid.CellStyle[1,Row].Font.Style:=[fsBold];
      StrGrid.CellStyle[1,Row].HorizontalAlignment:=taLeftJustify;
      StrGrid.CellStyle[2,Row].BGColor:=clSkyBlue;
      StrGrid.MergeCells.AddRectXY(1,Row,2,Row);
      StrGrid.MergeCells.AddRectXY(3,Row,13,Row);
      StrGrid.Cells[1,Row]:=StrBatchName;
      Inc(Row);
      Number:=0;
    end;
    Inc(Number);
    StrGrid.Cells[0,Row]:=IntToStr(Number);
    StrGrid.Cells[1,Row]:=VehicleArr[IntCount][0];
    StrGrid.Cells[2,Row]:=VehicleArr[IntCount][1];
    StrGrid.Cells[3,Row]:=VehicleArr[IntCount][2];
    StrGrid.Cells[4,Row]:=VehicleArr[IntCount][3];
    StrGrid.Cells[5,Row]:=VehicleArr[IntCount][4];
    StrGrid.Cells[6,Row]:=VehicleArr[IntCount][5];
    StrGrid.Cells[7,Row]:=VehicleArr[IntCount][12];
    StrGrid.Cells[8,Row]:=VehicleArr[IntCount][6];
    StrGrid.Cells[9,Row]:=VehicleArr[IntCount][7];
    StrGrid.Cells[10,Row]:=VehicleArr[IntCount][11];
    StrGrid.Cells[11,Row]:=VehicleArr[IntCount][8];
    StrGrid.Cells[12,Row]:=VehicleArr[IntCount][9];
    StrGrid.Cells[13,Row]:=VehicleArr[IntCount][10];
    StrGrid.CellStyle[4,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,Row].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,Row].HorizontalAlignment:=taRightJustify;
    Inc(Row);
  end;
  StrGrid.Invalidate;
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
  RefreshSeat;
 // RefreshData;
 // RefreshGrid;
end;

procedure TKmActualUnitRpt.GroupChange(Sender: TObject);
begin
  RefreshSeat;
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
