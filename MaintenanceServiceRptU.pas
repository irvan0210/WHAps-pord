unit MaintenanceServiceRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons,
  ComCtrls;

type
  TMaintenanceServiceRpt = class(TForm)
    Selesai: TButton;
    Lihat: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    ToXCel: TSpeedButton;
    TglDari: TDateTimePicker;
    TglSampai: TDateTimePicker;
    Label2: TLabel;
    ToDates: TCheckBox;
    Label3: TLabel;
    Batch: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TglDariChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure ToDatesClick(Sender: TObject);
  private
    DepartmentArr,LocationArr:Array of TArrString4;
    BatchArr:Array of TArrString2;
    CompanyArr:Array of TArrString7;
    MaintenanceServiceArr:Array of TArrString10;
    IntRow:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaintenanceServiceRpt: TMaintenanceServiceRpt;

implementation

uses MainU, GoodAssignmentU, MaintenanceServiceFormU, ServiceRequestFormU;

{$R *.dfm}

procedure TMaintenanceServiceRpt.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  IntRow:=0;
  TglDari.Date:=Now;
  TglSampai.Date:=Now;
  ToDates.Checked:=False;
  TglSampai.Enabled:=False;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TMaintenanceServiceRpt.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=9;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=110;
  StrGrid.ColWidths[5]:=60;
  StrGrid.ColWidths[6]:=60;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=350;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Pool';
  StrGrid.Cells[2,0]:='No SB';
  StrGrid.Cells[3,0]:='Tgl Servis';
  StrGrid.Cells[4,0]:='No Bodi/No Polisi';
  StrGrid.Cells[5,0]:='Odo';
  StrGrid.Cells[6,0]:='Odo (P)';
  StrGrid.Cells[7,0]:='Jenis Servis';
  StrGrid.Cells[8,0]:='Pekerjaan';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 8 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TMaintenanceServiceRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
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
  end;

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;

    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Qry.Destroy;
    Main.CloseDb;
      for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');

  Main.M_Normal;
end;

procedure TMaintenanceServiceRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrToDates,StrBatchId:String;
    IntCount,IntCount2,IntCount3:Integer;
    StrList:TStringList;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    for IntCount:=1 to StrGrid.RowCount-1 do
      for IntCount2:=0 to StrGrid.ColCount-1 do
        StrGrid.Cells[IntCount2,IntCount]:='';
    StrGrid.RowCount:=2;    
    StrList:=TStringList.Create;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';

    if ToDates.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglSampai.Date))
    else StrToDates:='';
    StrQry:='EXEC GetMaintenanceServiceList '+StrCompanyId+','+StrLocationId+
            ',@FromDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TglDari.Date))+
            StrToDates+',@OrderBy='+QuotedStr('a.from_date ASC, b.body_id ASC')+StrBatchId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(MaintenanceServiceArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      MaintenanceServiceArr[IntCount][0]:=Qry.FieldValues['location'];
      MaintenanceServiceArr[IntCount][1]:=Qry.FieldValues['maintenance_service_id'];
      MaintenanceServiceArr[IntCount][2]:=Qry.FieldValues['from_date'];
      MaintenanceServiceArr[IntCount][3]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        MaintenanceServiceArr[IntCount][4]:=StrGrid.Cells[4,IntCount2+1]+' / '+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                                      ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        MaintenanceServiceArr[IntCount][4]:=StrGrid.Cells[4,IntCount2+1]+' / '+Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                                      ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['odo_in']<>NULL then MaintenanceServiceArr[IntCount][5]:=IToCurr(Qry.FieldValues['odo_in'])
      else MaintenanceServiceArr[IntCount][5]:='';
      if Qry.FieldValues['odo_predict']<>NULL then MaintenanceServiceArr[IntCount][6]:=IToCurr(Qry.FieldValues['odo_predict'])
      else MaintenanceServiceArr[IntCount][6]:='';
      MaintenanceServiceArr[IntCount][7]:=Qry.FieldValues['jenis_service'];
      MaintenanceServiceArr[IntCount][8]:=Qry.FieldValues['maintenance_job'];

{
      StrList:=SplitStrings(Qry.FieldValues['maintenance_job'],',');
      IntCount3:=0;
      repeat
        if StrGrid.RowCount<IntCount2+1 then StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.Cells[6,IntCount2+1]:=StrList[IntCount3];
        Inc(IntCount3);
        Inc(IntCount2);
      until (IntCount3>StrList.Count-1);
}
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    StrList.Free;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceServiceRpt.RefreshGrid;
var IntCount:Integer;
begin
  if Length(MaintenanceServiceArr)>0 then StrGrid.RowCount:=Length(MaintenanceServiceArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(MaintenanceServiceArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=MaintenanceServiceArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=MaintenanceServiceArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=MaintenanceServiceArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=MaintenanceServiceArr[IntCount][3]+' / '+MaintenanceServiceArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=MaintenanceServiceArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=MaintenanceServiceArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=MaintenanceServiceArr[IntCount][7];
    StrGrid.Cells[8,IntCount+1]:=MaintenanceServiceArr[IntCount][8];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
  end;

end;



procedure TMaintenanceServiceRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceServiceRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceServiceRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TMaintenanceServiceRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,StrGrid.Cells[2,IntRow],'',False);
  end;
end;

procedure TMaintenanceServiceRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMaintenanceServiceRpt.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMaintenanceServiceRpt.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMaintenanceServiceRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMaintenanceServiceRpt.TglDariChange(Sender: TObject);
begin
  if TglDari.Date>TglSampai.Date then TglSampai.Date:=TglDari.Date;
end;

procedure TMaintenanceServiceRpt.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<TglDari.Date then TglDari.Date:=TglSampai.Date;
end;

procedure TMaintenanceServiceRpt.ToDatesClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    if ToDates.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
  end;
end;

end.
