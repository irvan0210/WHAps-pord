unit ServiceRequestRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons,
  ComCtrls, ExtCtrls, DateUtils;

type
  TServiceRequestRpt = class(TForm)
    Selesai: TButton;
    Label3: TLabel;
    Lihat: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    ToXCel: TSpeedButton;
    TombolCari: TSpeedButton;
    GroupBox1: TGroupBox;
    chkInput: TRadioButton;
    chkPerbaikan: TRadioButton;
    Periode: TRadioGroup;
    Bulan: TDateTimePicker;
    Tanggal: TDateTimePicker;
    TglSampai: TDateTimePicker;
    Label2: TLabel;
    Status: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure ToDatesClick(Sender: TObject);
    procedure TanggalDariChange(Sender: TObject);
    procedure TanggalSampaiChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    ServiceRequestArr:Array of TArrString9;
    myYear, myMonth, myDay : Word;
    IntRow,IsAll,IntMaxCol:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9);Overload;
    { Public declarations }
  end;

var
  ServiceRequestRpt: TServiceRequestRpt;

implementation

uses MainU, GoodAssignmentU, ServiceRequestFormU, WorkOrderFormU;

{$R *.dfm}

constructor TServiceRequestRpt.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9);
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  IsAll:=Is_All;
  Initiation:=True;
  Inherited Create(AOwner);
end;

procedure TServiceRequestRpt.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Bulan.Date:=Now();
  chkPerbaikan.Checked:=True;
  Periode.ItemIndex:=0;
  Status.ItemIndex:=0;
//  IntRow:=0;
//  TanggalDari.Date:=Now;
//  TanggalSampai.Date:=Now;
//  TanggalSampai.Enabled:=False;
//  ToDates.Checked:=False;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TServiceRequestRpt.InitGrid;
var IntCount:Integer;
begin
  IntMaxCol:=8;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=IntMaxCol+1;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=110;
  StrGrid.ColWidths[5]:=55;
  StrGrid.ColWidths[6]:=330;
  StrGrid.ColWidths[7]:=400;
  StrGrid.ColWidths[8]:=170;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Pool';
  StrGrid.Cells[2,0]:='No SR';
  StrGrid.Cells[3,0]:='Tanggal';
  StrGrid.Cells[4,0]:='No Bodi/No Polisi';
  StrGrid.Cells[5,0]:='KM Odo';
  StrGrid.Cells[6,0]:='Detail';
  StrGrid.Cells[7,0]:='Spare Part';
  StrGrid.Cells[8,0]:='Status';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to IntMaxCol do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TServiceRequestRpt.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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

procedure TServiceRequestRpt.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrIsAll,StrFromDates,StrToDates,StrTypeDate,StrDate,StrApprove,StrStatus:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    if chkInput.Checked=True then
      StrTypeDate:=',@TypeDate=''INPUT'' '
    else StrTypeDate:=',@TypeDate=''PERBAIKAN'' ';
    if Periode.ItemIndex=0 then
    begin
      StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' ,@ToDates'+
              '='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+' ';
    end
    else
    begin
      DecodeDate(Bulan.Date, myYear, myMonth, myDay);
      StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)))+' ,@ToDates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))))+' ';
    end;
//    if Status.Text='DISETUJUI BELUM BUAT PKB' then
//    Status:='DISETUJUI' else Status:= Status.Text;
    StrApprove:=',@Approve='+QuotedStr(Status.Text);

    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if IsAll=9 then StrIsAll:='' else StrIsAll:=',@Finish='+IntToStr(IsAll);
//    StrFromDates:=',@Dates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalDari.Date));
//    if ToDates.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.date)) else StrToDates:='';
//    StrQry:='EXEC GetServiceRequestList '+StrCompanyId+','+StrLocationId+StrFromDates+StrToDates+StrIsAll+';';
    StrQry:='EXEC GetServiceRequestList '+StrCompanyId+','+StrLocationId+StrDate+StrIsAll+StrTypeDate+StrApprove+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(ServiceRequestArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ServiceRequestArr[IntCount][0]:=Qry.FieldValues['location'];
      ServiceRequestArr[IntCount][1]:=Qry.FieldValues['service_request_id'];
      ServiceRequestArr[IntCount][2]:=Qry.FieldValues['submit_date'];
      ServiceRequestArr[IntCount][3]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        ServiceRequestArr[IntCount][3]:=ServiceRequestArr[IntCount][3]+' / '+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        ServiceRequestArr[IntCount][3]:=ServiceRequestArr[IntCount][3]+' / '+Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      ServiceRequestArr[IntCount][4]:=IToCurr(Qry.FieldValues['odo_in']);
      ServiceRequestArr[IntCount][5]:=Qry.FieldValues['description_resume'];
      if Qry.FieldValues['work_order_id']<>NULL then ServiceRequestArr[IntCount][6]:=Qry.FieldValues['work_order_id'] else ServiceRequestArr[IntCount][6]:='';
      ServiceRequestArr[IntCount][7]:=Qry.FieldValues['approve'];
      ServiceRequestArr[IntCount][8]:=Qry.FieldValues['part_name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TServiceRequestRpt.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(ServiceRequestArr)>0 then StrGrid.RowCount:=Length(ServiceRequestArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(ServiceRequestArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=ServiceRequestArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=ServiceRequestArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=ServiceRequestArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=ServiceRequestArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=ServiceRequestArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=ServiceRequestArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=ServiceRequestArr[IntCount][8];
    if (ServiceRequestArr[IntCount][7]='1')AND(ServiceRequestArr[IntCount][6]='') then
    begin
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clGreen;
      StrGrid.Cells[8,IntCount+1] := 'DISETUJUI BELUM BUAT PKB';
    end else if (ServiceRequestArr[IntCount][7]='2') AND (ServiceRequestArr[IntCount][6]='')then
    begin
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clRed;
      StrGrid.Cells[8,IntCount+1] := 'DITOLAK';
    end else if ServiceRequestArr[IntCount][6]<>'' then
    begin
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clBlue;
      StrGrid.Cells[8,IntCount+1] := 'SUDAH DIBUAT PKB';
    end else
    begin
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clBtnText;
      StrGrid.Cells[8,IntCount+1] := 'DIAJUKAN';
    end;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;


  end;
end;



procedure TServiceRequestRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TServiceRequestRpt.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TServiceRequestRpt.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
end;

procedure TServiceRequestRpt.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('ServiceRequestForm')=False then ServiceRequestForm:=TServiceRequestForm.Create(Self, StrGrid.Cells[0,IntRow],'',False);
    end else if UpperCase(FormRequest)='SERVICEREQUEST' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
//        ServiceRequestForm.RePrint(StrGrid.Cells[2,IntRow]);
      end;
      Close;
    end else if UpperCase(FormRequest)='WORKORDER-CREATE' then begin
//      WorkOrderForm.SetServiceRequestId(StrGrid.Cells[2,IntRow]);
      Close;
    end;
  end;
end;

procedure TServiceRequestRpt.Search;
var IntCount,IntCount2,IntCount3,IntCount4,IntStartRow:Integer;
    IsTrue:Boolean;
begin
  IntStartRow:=0;
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    IntCount2:=IntStartRow;
    for IntCount:=0 to Length(ServiceRequestArr)-1 do begin
      IsTrue:=False;
      IntCount3:=0;
      repeat
        if (StrPos(PChar(UpperCase(ServiceRequestArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
        Inc(IntCount3);
      until (IntCount3>IntMaxCol) or (IsTrue);
      if IsTrue then begin
        StrGrid.RowCount:=IntCount2+2;
        StrGrid.Cells[0,IntCount2+1]:=IntToStr(IntCount2);
        for IntCount4:=1 to IntMaxCol do
          StrGrid.Cells[IntCount4,IntCount2+1]:=ServiceRequestArr[IntCount][IntCount4-1];
        StrGrid.CellStyle[1,IntCount2+1].HorizontalAlignment:=taCenter;
//        StrGrid.CellStyle[5,IntCount2+1].HorizontalAlignment:=taRightJustify;
        if ServiceRequestArr[IntCount][6]<>'' then for IntCount4:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount4,IntCount2+1].Font.Color:=clGreen;
        Inc(IntCount2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TServiceRequestRpt.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TServiceRequestRpt.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TServiceRequestRpt.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    Cari.Text:='';
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TServiceRequestRpt.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TServiceRequestRpt.ToDatesClick(Sender: TObject);
begin
  if Not(Initiation) then begin
//    if ToDates.Checked=True then TanggalSampai.Enabled:=True
//    else TanggalSampai.Enabled:=False;
  end;
end;

procedure TServiceRequestRpt.TanggalDariChange(Sender: TObject);
begin
//  if ToDates.Checked=True then begin
//    if TanggalSampai.Date<TanggalDari.Date then TanggalSampai.Date:=TanggalDari.Date;
//  end;
end;

procedure TServiceRequestRpt.TanggalSampaiChange(Sender: TObject);
begin
//  if TanggalDari.Date>TanggalSampai.Date then TanggalDari.Date:=TanggalSampai.Date;
end;

procedure TServiceRequestRpt.CariChange(Sender: TObject);
begin
  if Cari.Text='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TServiceRequestRpt.TombolCariClick(Sender: TObject);
begin
  Search;
end;

procedure TServiceRequestRpt.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

end.
