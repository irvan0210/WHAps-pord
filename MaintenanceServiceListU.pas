unit MaintenanceServiceListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons;

type
  TMaintenanceServiceList = class(TForm)
    Selesai: TButton;
    Label3: TLabel;
    Lihat: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    ToXCel: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString9;
    IntRow:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');Overload;
    { Public declarations }
  end;

var
  MaintenanceServiceList: TMaintenanceServiceList;

implementation

uses MainU, GoodAssignmentU, MaintenanceServiceFormU, ServiceRequestFormU;

{$R *.dfm}

constructor TMaintenanceServiceList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Initiation:=True;
  Inherited Create(AOwner);
end;

procedure TMaintenanceServiceList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  IntRow:=0;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TMaintenanceServiceList.InitGrid;
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

procedure TMaintenanceServiceList.RefreshCombo;
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
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TMaintenanceServiceList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrQry:='EXEC GetMaintenanceServiceList '+StrCompanyId+','+StrLocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(WorkOrderArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WorkOrderArr[IntCount][0]:=Qry.FieldValues['location'];
      WorkOrderArr[IntCount][1]:=Qry.FieldValues['maintenance_service_id'];
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['from_date'];
      WorkOrderArr[IntCount][3]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WorkOrderArr[IntCount][4]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WorkOrderArr[IntCount][4]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['odo_in']<>NULL then WorkOrderArr[IntCount][5]:=IToCurr(Qry.FieldValues['odo_in'])
      else WorkOrderArr[IntCount][5]:='';
      if Qry.FieldValues['odo_predict']<>NULL then WorkOrderArr[IntCount][6]:=IToCurr(Qry.FieldValues['odo_predict'])
      else WorkOrderArr[IntCount][6]:='';
      WorkOrderArr[IntCount][7]:=Qry.FieldValues['jenis_service'];
      WorkOrderArr[IntCount][8]:=Qry.FieldValues['maintenance_job'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceServiceList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=WorkOrderArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=WorkOrderArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=WorkOrderArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=WorkOrderArr[IntCount][3]+' / '+WorkOrderArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=WorkOrderArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=WorkOrderArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=WorkOrderArr[IntCount][7];
    StrGrid.Cells[8,IntCount+1]:=WorkOrderArr[IntCount][8];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
  end;
end;



procedure TMaintenanceServiceList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceServiceList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintenanceServiceList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TMaintenanceServiceList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('MaintenanceServiceForm')=False then MaintenanceServiceForm:=TMaintenanceServiceForm.Create(Self,StrGrid.Cells[2,IntRow],'',False);
    end else if UpperCase(FormRequest)='MAINTENANCESERVICE' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
        MaintenanceServiceForm.Reprint(StrGrid.Cells[2,IntRow]);
      end;
      Close;
    end else if UpperCase(FormRequest)='SERVICEREQUEST-CREATE' then begin
      ServiceRequestForm.SetMaintenanceServiceId(StrGrid.Cells[2,IntRow]);
      Close;
    end;
  end;
end;

procedure TMaintenanceServiceList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMaintenanceServiceList.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMaintenanceServiceList.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMaintenanceServiceList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMaintenanceServiceList.CariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TMaintenanceServiceList.Search;
var Count,Count2,Count3,Count4,Count5,IntCount:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
      if (StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;

          //for IntCount:=0 to Length(WorkOrderArr)-1 do begin
            StrGrid.Cells[0,Count2]:=IntToStr(Count2+1);
            StrGrid.Cells[1,Count2]:=WorkOrderArr[Count][0];
            StrGrid.Cells[2,Count2]:=WorkOrderArr[Count][1];
            StrGrid.Cells[3,Count2]:=WorkOrderArr[Count][2];
            StrGrid.Cells[4,Count2]:=WorkOrderArr[Count][3]+' / '+WorkOrderArr[Count][4];
            StrGrid.Cells[5,Count2]:=WorkOrderArr[Count][5];
            StrGrid.Cells[6,Count2]:=WorkOrderArr[Count][6];
            StrGrid.Cells[7,Count2]:=WorkOrderArr[Count][7];
            StrGrid.Cells[8,Count2]:=WorkOrderArr[Count][8];
            StrGrid.CellStyle[0,Count2].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[1,Count2].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[5,Count2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[6,Count2].HorizontalAlignment:=taRightJustify;
          //end;

          {
          for Count4:=0 to 8 do begin
            StrGrid.Cells[Count4,Count2]:=WorkOrderArr[Count][Count4];
            StrGrid.CellStyle[5,Count2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[6,Count2].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[Count4,2].Font.Color:=clWindowText;
          end;
          }
          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end else begin
    LihatClick(Nil);
  end;
end;

end.
