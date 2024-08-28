unit MaintenanceTrackingBodyU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, Buttons, ExtCtrls;

type
  TMaintenanceTrackingBody = class(TForm)
    Label1: TLabel;
    Body: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label4: TLabel;
    SBU: TComboBox;
    Label2: TLabel;
    NoPolisi: TComboBox;
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Cari: TEdit;
    CariArmada: TSpeedButton;
    Panel1: TPanel;
    NoRangka: TEdit;
    NoMesin: TEdit;
    NoBody: TEdit;
    Label13: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NoPolisiChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariArmadaClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FormRequest:String;
    ColumnWidth:Integer;
    IntRow:Integer;
    CompanyArr:Array of TArrString5;
    BodyArr:Array of TArrString30;
    WorkOrderArr:Array of TArrString10;
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
  MaintenanceTrackingBody: TMaintenanceTrackingBody;

implementation

uses MainU, ADODB, WorkOrderFormInU, WorkOrderFormU;

{$R *.dfm}

procedure TMaintenanceTrackingBody.Init;
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

procedure TMaintenanceTrackingBody.InitGrid;
var IntCount:Integer;
begin
  NoBody.Text:='';
  NoRangka.Text:='';
  NoMesin.Text:='';
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=12;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,8,0);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);


  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=0;  {No Body}
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=0;
  StrGrid.ColWidths[4]:=250;
  StrGrid.ColWidths[5]:=250;
  StrGrid.ColWidths[6]:=70;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=90;

  StrGrid.ColWidths[9]:=0;
  StrGrid.ColWidths[10]:=90;
  StrGrid.ColWidths[11]:=0;


  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Bodi/No Polisi';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Jenis Pekerjaan';
  StrGrid.Cells[4,0]:='Jenis Service';
  StrGrid.Cells[5,0]:='Perbaikan';
  StrGrid.Cells[6,0]:='KM Odo';
  StrGrid.Cells[7,0]:='Tanggal';
  StrGrid.Cells[7,1]:='Masuk';
  StrGrid.Cells[8,1]:='Selesai';
  StrGrid.Cells[9,0]:='Pool';
  StrGrid.Cells[10,0]:='No PKB';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].BGColor:=clWindow;
  end;
end;

procedure TMaintenanceTrackingBody.RefreshCombo;
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
    StrQry:='EXEC GetBody '+CompanyId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BodyArr,Qry.RecordCount+1);
    BodyArr[0][0]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BodyArr[IntCount][0]:=Qry.FieldValues['vehicle_id'];
      BodyArr[IntCount][1]:=Qry.FieldValues['body_id'];
      BodyArr[IntCount][2]:=LicensePlate(Qry.FieldValues['license_plate']);
      if Qry.FieldValues['engine_id']<>NULL then BodyArr[IntCount][3]:=Qry.FieldValues['engine_id'];
      if Qry.FieldValues['chasis_id']<>NULL then BodyArr[IntCount][4]:=Qry.FieldValues['chasis_id'];

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
  NoPolisi.Items.Clear;
  for IntCount:=0 to Length(BodyArr)-1 do
    NoPolisi.Items.Add(BodyArr[IntCount][2]);
  Main.M_Normal;
end;

procedure TMaintenanceTrackingBody.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrBody:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  SetLength(WorkOrderArr,0);
  if NoPolisi.Text='' then begin
    Main.M_Normal;
    exit;
  end;

  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrBody:=',@BodyId='+QuotedStr(NoBody.Text);
    StrQry:='EXEC GetWorkOrderLists '+StrCompanyId+','+StrLocationId+StrBody+',@OrderId='+QuotedStr('a.date_in desc')+',@Status=8';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(WorkOrderArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Bodi/No Polisi';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Jenis Pekerjaan';
  StrGrid.Cells[4,0]:='Detail';
  StrGrid.Cells[5,0]:='Pekerjaan';
  StrGrid.Cells[6,0]:='KM Odo';
  StrGrid.Cells[7,0]:='Tanggal';
  StrGrid.Cells[7,1]:='Masuk';
  StrGrid.Cells[8,1]:='Selesai';
  StrGrid.Cells[9,0]:='Pool';
  StrGrid.Cells[10,0]:='No PKB';
      WorkOrderArr[IntCount][0]:=Qry.FieldValues['body_id']+' / ';
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WorkOrderArr[IntCount][0]:=WorkOrderArr[IntCount][0]+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WorkOrderArr[IntCount][0]:=WorkOrderArr[IntCount][0]+Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      WorkOrderArr[IntCount][1]:=Qry.FieldValues['date_in'];
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['job_inout']+'-';
      if Qry.FieldValues['general_repair']='1' then WorkOrderArr[IntCount][2]:=WorkOrderArr[IntCount][5]+'General,';
      if Qry.FieldValues['body_repair']='1' then WorkOrderArr[IntCount][2]:=WorkOrderArr[IntCount][2]+'Body,' ;
      if Qry.FieldValues['insurance']='1' then WorkOrderArr[IntCount][2]:=WorkOrderArr[IntCount][2]+'Insurance';
      WorkOrderArr[IntCount][3]:=Qry.FieldValues['description_resume'];
      WorkOrderArr[IntCount][4]:=Qry.FieldValues['work_resume'];
      WorkOrderArr[IntCount][5]:=Qry.FieldValues['odo_in'];
      WorkOrderArr[IntCount][6]:=Qry.FieldValues['date_in'];
      if Qry.FieldValues['time_out']<>NULL then WorkOrderArr[IntCount][7]:=Qry.FieldValues['date_out']+' '+Qry.FieldValues['time_out']
      else WorkOrderArr[IntCount][7]:='';
      WorkOrderArr[IntCount][8]:=Qry.FieldValues['location'];
      WorkOrderArr[IntCount][9]:=Qry.FieldValues['work_order_id'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    FreeAndNil(Qry);
  end;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMaintenanceTrackingBody.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=2 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][0];
    StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][1];
    StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][2];
    StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][3];
    StrGrid.Cells[5,IntCount+2]:=WorkOrderArr[IntCount][4];
    StrGrid.Cells[6,IntCount+2]:=WorkOrderArr[IntCount][5];
    StrGrid.Cells[7,IntCount+2]:=WorkOrderArr[IntCount][6];
    StrGrid.Cells[8,IntCount+2]:=WorkOrderArr[IntCount][7];
    StrGrid.Cells[9,IntCount+2]:=WorkOrderArr[IntCount][8];
    StrGrid.Cells[10,IntCount+2]:=WorkOrderArr[IntCount][9];
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    if WorkOrderArr[IntCount][7]<>'' then for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
  end;
end;

procedure TMaintenanceTrackingBody.SelesaiClick(Sender: TObject);
begin
  MaintenanceTrackingBody.Close;
end;

procedure TMaintenanceTrackingBody.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMaintenanceTrackingBody.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  NoPolisi.ItemIndex:=NoPolisi.Items.IndexOf('All');
  RefreshData;
  RefreshGrid;
end;

procedure TMaintenanceTrackingBody.NoPolisiChange(Sender: TObject);
begin
  NoBody.Text:=BodyArr[ArrayIndexOf(BodyArr,NoPolisi.Text,2)][1];
  //NoBody.Text:=SJArr  [ArrayIndexOf(SJArr,  NoSJ.Text,    0)][1];
  NoRangka.Text:=BodyArr[ArrayIndexOf(BodyArr,NoPolisi.Text,2)][4];
  NoMesin.Text:=BodyArr[ArrayIndexOf(BodyArr,NoPolisi.Text,2)][3];
  RefreshData;
  RefreshGrid;
end;

procedure TMaintenanceTrackingBody.ToXCelClick(Sender: TObject);
begin
  StrGrid.ColWidths[1]:=100;
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
  StrGrid.ColWidths[1]:=0;
end;

procedure TMaintenanceTrackingBody.CariArmadaClick(Sender: TObject);
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
    for IntCount:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      for IntCount3:=0 to 5 do
      if (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=IntCount2+1;
          StrGrid.Cells[0,IntCount2]:=IntToStr(IntCount2-1);
          for IntCount4:=1 to 5 do
            StrGrid.Cells[IntCount4,IntCount2]:=WorkOrderArr[IntCount][IntCount4-1];
          StrGrid.CellStyle[4,IntCount2].HorizontalAlignment:=taRightJustify;
          StrGrid.CellStyle[5,IntCount2].HorizontalAlignment:=taRightJustify;
          Inc(IntCount2);
      end;
    end;

  end else RefreshGrid;
end;

procedure TMaintenanceTrackingBody.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if StrGrid.Cells[8,IntRow]<>'' then begin
        if Main.IsFormOpen('WorkOrderFormIn')=False then WorkOrderFormIn:=TWorkOrderFormIn.Create(nil,StrGrid.Cells[10,IntRow],True);
      end else begin
        if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[10,IntRow],True);
      end;
    end
  end;
end;

procedure TMaintenanceTrackingBody.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMaintenanceTrackingBody.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    NoPolisi.Items.Clear;
    for Count:=0 to Length(BodyArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(BodyArr[Count][2])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          //NoBody.Items.Count :=Count2+1;
          NoPolisi.Items.Add(BodyArr[Count][2]);
          Inc(Count2);
      end;
    end;
    NoPolisi.ItemIndex:=0;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMaintenanceTrackingBody.CariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoPolisi.SetFocus;
end;

end.
