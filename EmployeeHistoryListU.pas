unit EmployeeHistoryListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ZColorStringGrid, WHUnit, ADODB,
  Buttons;

type
  TEmployeeHistoryList = class(TForm)
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Name: TEdit;
    Address: TEdit;
    Birth: TEdit;
    JoinDate: TEdit;
    IdKaryawan: TEdit;
    Cetak: TButton;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CetakClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure LoadDetail;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);Overload;
  end;

var
  EmployeeHistoryList: TEmployeeHistoryList;
  EmplId:String;
  IntRow,IntCol:Integer;
  EmplType:Integer;
  HistoryListArr:Array of TArrString16;

implementation

uses MainU, EmployeeHistoryRptU, EmployeeHistoryLakaFormU;

{$R *.dfm}

constructor TEmployeeHistoryList.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else begin
    EmplType:=3;
  end;
  EmplId:=EmployeeId;
  Main.WriteLog('Form Open: EmployeeHistoryList='+EmployeeType+','+EmployeeId,1);
  Inherited Create(AOwner);
end;

procedure TEmployeeHistoryList.Init;
begin
  Case EmplType of
    1:Caption:='Data Riwayat Mitra';
    2:Caption:='Data Riwayat Driver';
    3:Caption:='Data Riwayat Karyawan';
  end;
  IdKaryawan.Text:='';
  Name.Text:='';
  JoinDate.Text:='';
  Birth.Text:='';
  Address.Text:=''
end;

procedure TEmployeeHistoryList.InitGrid;
var IntCount:Integer;
begin
  IntRow:=0;
  IntCol:=0;
  StrGrid.WordWrap:=True;
  StrGrid.RowCount:=3;
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);

  StrGrid.MergeCells.AddRectXY(3,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.MergeCells.AddRectXY(10,0,10,1);
  StrGrid.MergeCells.AddRectXY(11,0,11,1);
  StrGrid.RowHeights[0]:=20;
  StrGrid.RowHeights[1]:=20;

  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=0;

  StrGrid.ColWidths[3]:=65;
  StrGrid.ColWidths[4]:=65;
  StrGrid.ColWidths[5]:=140;
  StrGrid.ColWidths[6]:=80;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=150;
  StrGrid.ColWidths[9]:=120;
  StrGrid.ColWidths[10]:=300;
  StrGrid.ColWidths[11]:=100;
  StrGrid.Cells[0,0]:='Nama';
  StrGrid.Cells[1,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[2,0]:='Tgl. Bergabung';
  StrGrid.Cells[3,0]:='Tanggal';
  StrGrid.Cells[5,0]:='Pencapaian/ Kemunduran';
  StrGrid.Cells[6,0]:='Lokasi';
  StrGrid.Cells[7,0]:='Departemen';
  StrGrid.Cells[8,0]:='Institusi';
  StrGrid.Cells[9,0]:='Kota';
  StrGrid.Cells[10,0]:='Keterangan';
  StrGrid.Cells[11,0]:='Pembuat';
  StrGrid.Cells[3,1]:='Mulai';
  StrGrid.Cells[4,1]:='Selesai';

  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.RowCount do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TEmployeeHistoryList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+EmplId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      IdKaryawan.Text:=Qry.FieldValues['employee_id'];
      Name.Text:=Qry.FieldValues['name'];
      if (Qry.FieldValues['birth_town']<>NULL) and (Qry.FieldValues['birth_date']<>NULL) then
        Birth.Text:=Qry.FieldValues['birth_town']+'/'+FormatDateTime('dd-mm-yyyy',StrToDate(Qry.FieldValues['birth_date']));
      if Qry.FieldValues['address']<>NULL then Address.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['join_date']<>NULL then JoinDate.Text:=FormatDateTime('dd/mm/yyyy',StrToDate(Qry.FieldValues['join_date']));
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryList.LoadDetail;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeHistoryDetail '+EmplId;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(HistoryListArr,0);
    if Qry.RecordCount>0 then begin
      SetLength(HistoryListArr,Qry.RecordCount);
      while not(Qry.Eof) do begin
        HistoryListArr[IntCount][0]:=Name.Text;
        HistoryListArr[IntCount][1]:=Birth.Text;
        HistoryListArr[IntCount][2]:=JoinDate.Text;

        if Qry.FieldValues['from_date']<>NULL then HistoryListArr[IntCount][3]:=Qry.FieldValues['from_date'] else HistoryListArr[IntCount][3]:='';
        if Qry.FieldValues['to_date']<>NULL then HistoryListArr[IntCount][4]:=Qry.FieldValues['to_date'] else HistoryListArr[IntCount][4]:='';
        HistoryListArr[IntCount][5]:=Qry.FieldValues['history_type_detail'];
        if Qry.FieldValues['internal']='0' then HistoryListArr[IntCount][6]:=''
        else if Qry.FieldValues['internal']='1' then HistoryListArr[IntCount][6]:='Internal' else HistoryListArr[IntCount][6]:='Eksternal';
        if Qry.FieldValues['department']<>NULL then HistoryListArr[IntCount][7]:=Qry.FieldValues['department'] else HistoryListArr[IntCount][7]:='';
        if Qry.FieldValues['institution']<>NULL then HistoryListArr[IntCount][8]:=Qry.FieldValues['institution'] else HistoryListArr[IntCount][8]:='';
        if Qry.FieldValues['city']<>NULL then HistoryListArr[IntCount][9]:=Qry.FieldValues['city'] else HistoryListArr[IntCount][9]:='';
        if Qry.FieldValues['detail']<>NULL then HistoryListArr[IntCount][10]:=Qry.FieldValues['detail'] else HistoryListArr[IntCount][10]:='';
        if Qry.FieldValues['username']<>NULL then HistoryListArr[IntCount][11]:=Qry.FieldValues['username'] else HistoryListArr[IntCount][11]:='';
        HistoryListArr[IntCount][12]:=Qry.FieldValues['promotion'];
        HistoryListArr[IntCount][13]:=Qry.FieldValues['empl_history_id'];
        HistoryListArr[IntCount][14]:=Qry.FieldValues['employee_id'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,2]:='';
    StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
  end;
  if Length(HistoryListArr)>0 then StrGrid.RowCount:=Length(HistoryListArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to Length(HistoryListArr)-1 do begin
    StrGrid.RowHeights[IntCount+2]:=20;
    StrGrid.Cells[0,IntCount+2]:=HistoryListArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=HistoryListArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=HistoryListArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=HistoryListArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=HistoryListArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=HistoryListArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=HistoryListArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=HistoryListArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=HistoryListArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=HistoryListArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=HistoryListArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=HistoryListArr[IntCount][11];
    if HistoryListArr[IntCount][12]='1' then begin
      for IntCount2:=0 to StrGrid.ColCount-2 do
        StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    end else if HistoryListArr[IntCount][12]='-1' then begin
      for IntCount2:=0 to StrGrid.ColCount-2 do
        StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed;
    end;
  end;
end;

procedure TEmployeeHistoryList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  if EmplId<>'' then begin
    IdKaryawan.Text:=EmplId;
    LoadData;
    LoadDetail;
    RefreshGrid;
  end;
end;

procedure TEmployeeHistoryList.CetakClick(Sender: TObject);
begin
  EmployeeHistoryRpt:=TEmployeeHistoryRpt.Create(Self,IntToStr(EmplType),EmplId);
end;

procedure TEmployeeHistoryList.ToXCelClick(Sender: TObject);
begin
  StrGrid.ColWidths[0]:=150;
  StrGrid.ColWidths[1]:=130;
  StrGrid.ColWidths[2]:=80;
  if ToExcel4(StrGrid) then begin
    StrGrid.ColWidths[0]:=0;
    StrGrid.ColWidths[1]:=0;
    StrGrid.ColWidths[2]:=0;
    ShowMessage('Export ke Excel Berhasil');
  end;

end;

procedure TEmployeeHistoryList.StrGridDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,History_ID,Empl_ID:String;
    IntCount,No:Integer;
    Count,Count2:Integer;
begin
  History_ID:= HistoryListArr[IntRow-2][13];
  Empl_ID:= HistoryListArr[IntRow-2][14];
  if Main.IsFormOpen('EmployeeHistoryLakaForm')=False then EmployeeHistoryLakaForm:=TEmployeeHistoryLakaForm.Create(Self,Empl_ID,History_ID,'EMPLOYEEHISTORYLAKA-LIST');

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  if Main.OpenDb then begin

    StrQry:='SELECT b.name,a.* FROM wh_empl_history_laka a '+
            'LEFT JOIN wh_employee b ON a.employee_id=b.employee_id '+
            'WHERE empl_history_id='+History_ID+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
      with EmployeeHistoryLakaForm do
      begin
        EmplID:=Empl_ID;
        Tgl.Text:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['date']);
        Pelapor.Text:=Qry.FieldValues['name'];
        Lokasi.Text:=Qry.FieldValues['location'];
        Jam.Text:=Qry.FieldValues['time'];
        Amount.Text:=SToCurr(Qry.FieldValues['amount']);
        AmountDesc.Text:=Qry.FieldValues['amount_desc'];
        Kerusakan.Text:=Qry.FieldValues['damage'];
        NamaKorban.Text:=Qry.FieldValues['victims_name'];
        UmurKorban.Text:=Qry.FieldValues['victims_age'];
        AlatTerlibat.Text:=Qry.FieldValues['tools'];
        Proses.Text:=Qry.FieldValues['activity'];
        TdkMasukKerja.Text:=Qry.FieldValues['absent'];
        Kronologi.Text:=Qry.FieldValues['chronology'];
        SebabLangsung.Text:=Qry.FieldValues['incident1'];
        SebabDasar.Text:=Qry.FieldValues['incident2'];
        NoteSpv.Text:=Qry.FieldValues['note_spv'];
        NoteMR.Text:=Qry.FieldValues['note_mr'];
        NoteDir.Text:=Qry.FieldValues['note_direktur'];
        LamaBekerjaTahun.Text:=Qry.FieldValues['work_period_year'];
        LamaBekerjaBulan.Text:=Qry.FieldValues['work_period_month'];
        if (Qry.FieldValues['unsafe_action']='1') then chkUnsafeAction.Checked:=True else chkUnsafeAction.Checked:=False;
        if (Qry.FieldValues['unsafe_condition']='1') then chkUnsafeCondition.Checked:=True else chkUnsafeCondition.Checked:=False;
        if (Qry.FieldValues['personal_factor']='1') then chkPersonalFactor.Checked:=True else chkPersonalFactor.Checked:=False;
        if (Qry.FieldValues['job_factor']) then chkJobFactor.Checked:=True else chkJobFactor.Checked:=False;
      end;
    end;

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;


end;

procedure TEmployeeHistoryList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

end.
