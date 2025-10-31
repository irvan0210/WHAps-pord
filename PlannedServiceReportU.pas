unit PlannedServiceReportU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons;

type
  TPlannedServiceReport = class(TForm)
    Label1: TLabel;
    Status: TComboBox;
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
    IntRow, IntCol:Integer;
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
  PlannedServiceReport: TPlannedServiceReport;
   IntRow,IntCol:Integer;

implementation

uses MainU, ADODB, MaintenanceTrackingLastUpdateU, WorkOrderFormInU,
  WorkOrderFormU, ArmadaJalanTerakhirU, ServiceRequestFormU,
  MaintenanceServiceFormU;

{$R *.dfm}

procedure TPlannedServiceReport.Init;
begin
  ColumnWidth:=60;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
 // Status.Items.Clear;
 // Status.Text:='';
  Status.ItemIndex:=1;
  IntRow:=0;
  InitGrid;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TPlannedServiceReport.InitGrid;
var Count:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=15;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  //StrGrid.MergeCells.AddRectXY(13,0,13,1);
  //StrGrid.MergeCells.AddRectXY(14,0,14,1);
  //StrGrid.MergeCells.AddRectXY(15,0,15,1);
  //StrGrid.MergeCells.AddRectXY(16,0,16,1);
  //StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(5,0,6,0);
  StrGrid.MergeCells.AddRectXY(7,0,8,0);
  StrGrid.MergeCells.AddRectXY(11,0,14,0);

  for Count:=0 to 14 do
    StrGrid.CellStyle[Count,0].HorizontalAlignment:=taCenter;
  for Count:=0 to 14 do
    StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
 // for Count:=10 to 13 do
 //   StrGrid.CellStyle[Count,1].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=60;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=70;
  StrGrid.ColWidths[10]:=70;
  StrGrid.ColWidths[11]:=80;
  StrGrid.ColWidths[12]:=100;
  StrGrid.ColWidths[13]:=100;
  StrGrid.ColWidths[14]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Status Servis';
  StrGrid.Cells[2,0]:='No Body';
  StrGrid.Cells[3,0]:='No Polisi';
  StrGrid.Cells[4,0]:='Type Kendaraan';
  StrGrid.Cells[5,0]:='Odometer (Km) Saat Ini';
  StrGrid.Cells[5,1]:='Odo Out';
  StrGrid.Cells[6,1]:='Odo In';
  StrGrid.Cells[7,0]:='Odo Transtrack Saat Ini';
  StrGrid.Cells[7,1]:='Odo Out';
  StrGrid.Cells[8,1]:='Odo In';
  StrGrid.Cells[9,0]:='Odo Prediksi';
  StrGrid.Cells[10,0]:='Selsih Odo';
  StrGrid.Cells[11,0]:='Servis Terakhir';
  StrGrid.Cells[11,1]:='Tanggal';
  StrGrid.Cells[12,1]:='No PKB';
  StrGrid.Cells[13,1]:='No SR';
  StrGrid.Cells[14,1]:='No SB';


  for Count:=0 to 14 do
    StrGrid.Cells[Count,2]:='';
//  for Count:=4 to 31 do
//    StrGrid.ColWidths[Count]:=ColumnWidth;
end;

procedure TPlannedServiceReport.RefreshCombo;
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

procedure TPlannedServiceReport.RefreshData;
var StrQry,StrQry2,StrQry3,StrCompanyId,StrLocationId,StrGroup, StrStatus:String;
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
    if (Group.Text<>'All') then StrGroup:=','+GroupArr[Group.ItemIndex][0] else StrGroup:=',0';
    if(Status.Text<>'All') then StrStatus:=','+QuotedStr(Status.Text) else StrStatus:='';
    StrQry:='EXEC GetPlainService '+StrCompanyId+','+StrLocationId+StrGroup+StrStatus+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VehicleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VehicleArr[IntCount][0]:=Qry.FieldValues['status_servis'];
      VehicleArr[IntCount][1]:=Qry.FieldValues['body_id'];
       if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          VehicleArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          VehicleArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

      VehicleArr[IntCount][3]:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';

      if Qry.FieldValues['out_ordo_km'] <> NULL then VehicleArr[IntCount][4] := IToCurr(Qry.FieldValues['out_ordo_km'])
       else VehicleArr[IntCount][4] := '0';
      if Qry.FieldValues['odo_terakhir'] <> NULL then VehicleArr[IntCount][5] := IToCurr(Qry.FieldValues['odo_terakhir'])
       else VehicleArr[IntCount][5] := '0';
      if Qry.FieldValues['transtrack_odo_out_km'] <> NULL then VehicleArr[IntCount][6] := IToCurr(Qry.FieldValues['transtrack_odo_out_km'])
       else VehicleArr[IntCount][6] := '0';
      if Qry.FieldValues['transtrack_odo_in_km'] <> NULL then VehicleArr[IntCount][7] := IToCurr(Qry.FieldValues['transtrack_odo_in_km'])
       else VehicleArr[IntCount][7] := '0';
      if Qry.FieldValues['odo_predict'] <> null then VehicleArr[IntCount][8] := IToCurr(Qry.FieldValues['odo_predict'])
      else VehicleArr[IntCount][8] := '0';
      if Qry.FieldValues['selisih_km'] <> null then VehicleArr[IntCount][9] := IToCurr(Qry.FieldValues['selisih_km'])
      else VehicleArr[IntCount][9] := '0';

      if Qry.FieldValues['servis_berkala_terahir'] <> NULL then VehicleArr[IntCount][10] :=
        FormatDateTime('dd-mm-yyyy', Qry.FieldValues['servis_berkala_terahir'])
      else VehicleArr[IntCount][10] :='';

      if Qry.FieldValues['work_order_id'] <> NULL then VehicleArr[IntCount][11] := Qry.FieldValues['work_order_id']
      else  VehicleArr[IntCount][11] :='';
      if Qry.FieldValues['service_request_id'] <> NULL then VehicleArr[IntCount][12] := Qry.FieldValues['service_request_id']
      else VehicleArr[IntCount][12] :='';
      if Qry.FieldValues['maintenance_service_id'] <> null then VehicleArr[IntCount][13] := Qry.FieldValues['maintenance_service_id']
      else VehicleArr[IntCount][13] := '';


      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPlannedServiceReport.RefreshGrid;
var IntCount,IntCount2, strValue:Integer;
    fs: TFormatSettings;
    nilai: Currency;
begin
 // fs := DefaultFormatSettings;
 // fs.DecimalSeparator := '.';

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
    StrGrid.Cells[9,IntCount+2]:=VehicleArr[IntCount][8];
    StrGrid.Cells[10,IntCount+2]:=VehicleArr[IntCount][9];
    StrGrid.Cells[11,IntCount+2]:=VehicleArr[IntCount][10];
    StrGrid.Cells[12,IntCount+2]:=VehicleArr[IntCount][11];
    StrGrid.Cells[13,IntCount+2]:=VehicleArr[IntCount][12];
    StrGrid.Cells[14,IntCount+2]:=VehicleArr[IntCount][13];
    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taCenter;

    if VehicleArr[IntCount][0]='Mendekati Servis' then
    begin
     //for IntCount2:=0 to StrGrid.ColCount-1 do
     StrGrid.CellStyle[1,IntCount+2].Font.Color:=clBlue;
    end else if VehicleArr[IntCount][0]='Waktunya Servis' then
    begin
     //for IntCount2:=0 to StrGrid.ColCount-1 do
     StrGrid.CellStyle[1,IntCount+2].Font.Color:=clRed;
     StrGrid.CellStyle[10,IntCount+2].Font.Color:=clRed;
    end;
  end;
end;

procedure TPlannedServiceReport.SelesaiClick(Sender: TObject);
begin
  PlannedServiceReport.Close;
end;

procedure TPlannedServiceReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPlannedServiceReport.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  Group.ItemIndex:=Group.Items.IndexOf('All');
 // RefreshData;
 // RefreshGrid;
end;

procedure TPlannedServiceReport.GroupChange(Sender: TObject);
begin
 // RefreshData;
  //RefreshGrid;
end;

procedure TPlannedServiceReport.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TPlannedServiceReport.CariArmadaClick(Sender: TObject);
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
      for IntCount3:=0 to 14 do
      if (StrPos(PChar(UpperCase(VehicleArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=IntCount2+1;
          StrGrid.Cells[0,IntCount2]:=IntToStr(IntCount2-1);
          for IntCount4:=1 to 14 do
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

procedure TPlannedServiceReport.LiatDataClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPlannedServiceReport.StrGridDblClick(Sender: TObject);
begin
  if IntRow>0 then begin
    Case IntCol of
      //0,1:if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(Self,StrGrid.Cells[1,IntRow],False);
      12:begin
         // MessageBox(0,PChar(StrGrid.Cells[1,IntRow]),'Tutup PKB',MB_OK or MB_ICONERROR);
          if StrGrid.Cells[12,IntRow]<>'' then begin
            if FormRequest='' then begin
              if StrGrid.Cells[2,IntRow]<>'' then begin
                if Main.IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(nil,StrGrid.Cells[12,IntRow],True);
              end else begin
                if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[12,IntRow],True);
              end;
            end
          end;
        end;

      13:if StrGrid.Cells[13,IntRow]<>'' then begin
          if Main.IsFormOpen('ServiceRequestForm')=False then ServiceRequestForm:=TServiceRequestForm.Create(Self, StrGrid.Cells[13,IntRow],'',False);
        end;
      14:if StrGrid.Cells[14,IntRow]<>'' then begin
         // MessageBox(0,PChar(StrGrid.Cells[3,IntRow]),'Service Berkala',MB_OK or MB_ICONERROR);
          if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,StrGrid.Cells[14,IntRow],'',False);
        end;
    end;
  end;
end;

procedure TPlannedServiceReport.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

end.
