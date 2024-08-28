unit ReferensiMitraListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit;

type
  TReferensiMitraList = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Tampilkan: TButton;
    Cari: TEdit;
    NoKPP: TComboBox;
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    Panel1: TPanel;
    Mitra: TEdit;
    GroupLokasi: TGroupBox;
    Label3: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NoKPPChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure TampilkanClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshMitra;
    procedure RefreshLokasi;
    procedure LoadData;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;EmployeeType:String;Employee_Id:String='';Employee_Name:String='';Status:Integer=1);Overload;
  end;

var
  ReferensiMitraList: TReferensiMitraList;
  LokasiArr,EmployeeArr:Array of TArrString4;
  EmplType,Stat,IntRow,IntCol:Integer;
  EmployeeId,EmployeeName:String;

implementation

uses MainU, ADODB, EmployeeFormU;

{$R *.dfm}

Constructor TReferensiMitraList.Create(AOwner:TComponent;EmployeeType:String;Employee_Id:String='';Employee_Name:String='';Status:Integer=1);
begin
  if UpperCase(EmployeeType)='TAXI' then EmplType:=1
  else if UpperCase(EmployeeType)='BUS' then EmplType:=2
  else EmplType:=3;
  Stat:=Status;
  EmployeeId:=Employee_Id;
  EmployeeName:=Employee_Name; 
  Inherited Create(AOwner);
end;


procedure TReferensiMitraList.Init;
begin
  IntRow:=0;
  IntCol:=0;
  Cari.Text:='';
  NoKPP.Text:='';
  NoKPP.Clear;
  Mitra.Text:='';
end;

procedure TReferensiMitraList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=3;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,32,0);
  StrGrid.CellStyle[0,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[1,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[2,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[3,0].VerticalAlignment:=vaCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.ColWidths[0]:=80;
  StrGrid.ColWidths[1]:=160;
  StrGrid.ColWidths[2]:=65;
  StrGrid.Cells[0,0]:='No KPP';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Tgl Masuk';
  StrGrid.Cells[3,0]:='Pencapaian Hari Kerja';
  for IntCount:=3 to 32 do begin
    StrGrid.ColWidths[IntCount]:=35;
    StrGrid.Cells[IntCount,1]:=IntToStr(IntCount-2);
    StrGrid.CellStyle[IntCount,1].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=0 to 32 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TReferensiMitraList.LoadData;
var Qry,Qry2:TADOQuery;
    StrQry:String;
    IntCount,IntCount2,TotalCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  for IntCount:=2 to StrGrid.RowCount do
    for IntCount2:=0 to StrGrid.ColCount do
      StrGrid.Cells[IntCount2,IntCount]:='';
  if Main.OpenDb then begin
    StrQry:='SELECT a.employee_id,a.name,CONVERT(VARCHAR(10),a.join_date,103) as join_date FROM wh_employee a'+
            ' WHERE a.reference='+Chr(39)+NoKPP.Text+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      IntCount:=0;
      StrGrid.RowCount:=Qry.RecordCount+2;
      while not(Qry.Eof) do begin
        StrGrid.Cells[0,IntCount+2]:=Qry.FieldValues['employee_id'];
        StrGrid.Cells[1,IntCount+2]:=Qry.FieldValues['name'];
        StrGrid.Cells[2,IntCount+2]:=Qry.FieldValues['join_date'];
        Qry2:=TADOQuery.Create(Self);
        Qry2.Connection:=Main.MyConnection;
        StrQry:='SELECT CONVERT(VARCHAR(5),a.out_date,103) AS out_date,a.gross_argo'+
                ',c.work_days FROM wh_vhc_trans a '+
                ' INNER JOIN wh_vehicle b ON b.vehicle_id=a.vehicle_id'+
                ' INNER JOIN wh_vhc_batch c ON c.vhc_batch_id=b.vhc_batch_id'+
                ' WHERE (a.employee_id='+Chr(39)+Qry.FieldValues['employee_id']+Chr(39)+
                ');';
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        if Qry2.RecordCount>0 then begin
          IntCount2:=1;
          while not(Qry2.Eof) do begin
            if Qry2.FieldValues['gross_argo']>=Qry2.FieldValues['work_days'] then begin
              StrGrid.Cells[IntCount2+2,IntCount+2]:=Qry2.FieldValues['out_date'];
              Inc(IntCount2);
            end;
            Qry2.Next;
          end;
        end;
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
  end;
  Qry.Destroy;
  Main.M_Normal;
  Total.Text:=IntToStr(IntCount);
end;

procedure TReferensiMitraList.RefreshMitra;
var Qry:TADOQuery;
    StrQry,StrLocation,StrStat:String;
    IntCount:Integer;
begin
  SetLength(EmployeeArr,0);
  NoKPP.Items.Clear;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if (Trim(Lokasi.Text)<>'All') then StrLocation:=','+Lokasi.Text else StrLocation:=',0';
    StrStat:=','+IntToStr(Stat);
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+StrStat+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(EmployeeArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        EmployeeArr[IntCount][0]:=Qry.FieldValues['employee_id'];
        EmployeeArr[IntCount][1]:=Qry.FieldValues['name'];
        if Qry.FieldValues['join_date']<>NULL then
          EmployeeArr[IntCount][3]:=Qry.FieldValues['join_date'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Main.CloseDb;
    Main.M_Normal;
  end;
  Qry.Destroy;
  for IntCount:=0 to Length(EmployeeArr)-1 do
    NoKPP.Items.Add(EmployeeArr[IntCount][0]);
end;

procedure TReferensiMitraList.RefreshLokasi;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    QStr:='SELECT * FROM wh_location WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  Main.M_Normal;
end;


procedure TReferensiMitraList.SelesaiClick(Sender: TObject);
begin
  ReferensiMitraList.Close;
end;

procedure TReferensiMitraList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReferensiMitraList.FormShow(Sender: TObject);
var IntCount:Integer;
begin
  Init;
  InitGrid;
  RefreshLokasi;
  if EmployeeId<>'' then begin
    NoKPP.Items.Add(EmployeeId); 
    NoKPP.ItemIndex:=NoKPP.Items.IndexOf(EmployeeId);
    Mitra.Text:=EmployeeName;
    LoadData;
  end else
    RefreshMitra;
end;

procedure TReferensiMitraList.NoKPPChange(Sender: TObject);
var IntCount:Integer;
begin
  for IntCount:=0 to Length(EmployeeArr)-1 do
    if EmployeeArr[IntCount][0]=NoKPP.Text then Mitra.Text:=EmployeeArr[IntCount][1];
end;

procedure TReferensiMitraList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Mitra.Text:='';
    NoKPP.Text:='';
    NoKPP.Clear;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          NoKPP.Items.Add(Employeearr[Count][Count4]);
      end;
    end;
  end else
    RefreshMitra;
end;

procedure TReferensiMitraList.TampilkanClick(Sender: TObject);
begin
  LoadData;
end;

procedure TReferensiMitraList.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  Main.M_Busy;
  RefreshMitra;
  Main.M_Normal;  
end;

procedure TReferensiMitraList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TReferensiMitraList.StrGridDblClick(Sender: TObject);
begin
  if Main.IsFormOpen('EmployeeForm')=False then EmployeeForm:=TEmployeeForm.Create(Self,'',StrGrid.Cells[0,IntRow]);
end;

end.
