unit WorkOrderListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons;

type
  TWorkOrderList = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString9;
    IntRow,IsAll,IsBlok:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);Overload;
    { Public declarations }
  end;

var
  WorkOrderList: TWorkOrderList;

implementation

uses MainU, GoodAssignmentU, ServiceRequestFormU, WorkOrderFormU, StrUtils,
  BlockUnitFormU;

{$R *.dfm}

constructor TWorkOrderList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Initiation:=True;
  IsAll:=Is_All;
  IsBlok:=Is_Blok;
  Main.WriteLog('Form Open: WorkOrderList='+Form_Request+','+Form_Function+','+IntToStr(Is_All)+','+IntToStr(Is_Blok),1);
  Inherited Create(AOwner);
end;

procedure TWorkOrderList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  IntRow:=0;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TWorkOrderList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=110;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=300;
  StrGrid.ColWidths[7]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Pool';
  if IsBlok=0 then StrGrid.Cells[2,0]:='No WO'
  else StrGrid.Cells[2,0]:='No Blok';
  StrGrid.Cells[3,0]:='Tanggal';
  StrGrid.Cells[4,0]:='No Bodi/No Polisi';
  StrGrid.Cells[5,0]:='Jenis Pekerjaan';
  StrGrid.Cells[6,0]:='Detail';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 7 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
end;

procedure TWorkOrderList.RefreshCombo;
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

procedure TWorkOrderList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrIsAll,StrIsBlok:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if IsAll<>9 then StrIsAll:=',@Status='+IntToStr(IsAll) else StrIsAll:='';
    if IsBlok in [1,2] then StrIsBlok:=',@flag='+IntToStr(IsBlok) else StrIsBlok:='';
    StrQry:='EXEC GetWorkOrderLists '+StrCompanyId+','+StrLocationId+StrIsAll+StrIsBlok+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(WorkOrderArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WorkOrderArr[IntCount][0]:=Qry.FieldValues['location'];
      WorkOrderArr[IntCount][1]:=Qry.FieldValues['work_order_id'];
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['date_in'];
      WorkOrderArr[IntCount][3]:=Qry.FieldValues['body_id']+' / ';
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WorkOrderArr[IntCount][3]:=WorkOrderArr[IntCount][3]+Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WorkOrderArr[IntCount][3]:=WorkOrderArr[IntCount][3]+Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if IsBlok=0 then begin
        WorkOrderArr[IntCount][4]:=Qry.FieldValues['job_inout']+'-';
        if Qry.FieldValues['general_repair']='1' then WorkOrderArr[IntCount][4]:=WorkOrderArr[IntCount][4]+'General,';
        if Qry.FieldValues['body_repair']='1' then WorkOrderArr[IntCount][4]:=WorkOrderArr[IntCount][4]+'Body,' ;
        if Qry.FieldValues['insurance']='1' then WorkOrderArr[IntCount][4]:=WorkOrderArr[IntCount][4]+'Insurance';
      end else begin
        WorkOrderArr[IntCount][4]:='-';
      end;
      WorkOrderArr[IntCount][5]:=Qry.FieldValues['description_resume'];
      if Qry.FieldValues['time_out']<>NULL then WorkOrderArr[IntCount][6]:=Qry.FieldValues['time_out'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TWorkOrderList.RefreshGrid;
var IntCount,IntCount2:Integer;
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
    StrGrid.Cells[4,IntCount+1]:=WorkOrderArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=WorkOrderArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=WorkOrderArr[IntCount][5];
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;



procedure TWorkOrderList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TWorkOrderList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if LowerCase(LeftStr(StrGrid.Cells[2,IntRow],3))='pkb' then begin
        if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[2,IntRow],True);
      end else begin
        if IsBlok=1 then begin
          if Main.IsFormOpen('BlockUnitForm')=False then BlockUnitForm:=TBlockUnitForm.Create(nil,StrGrid.Cells[2,IntRow],True);
        end
        else begin
          if Main.IsFormOpen('BlockUnitForm')=False then BlockUnitForm:=TBlockUnitForm.Create(nil,StrGrid.Cells[2,IntRow],False);
        end;
      end;

    end else if UpperCase(FormRequest)='WORKORDER' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
        WorkOrderForm.RePrint(StrGrid.Cells[2,IntRow]);
      end;
      //Close;
    end else if UpperCase(FormRequest)='GOODASSIGNMENT' then begin
      GoodAssignment.SetPKBNo(StrGrid.Cells[2,IntRow]);
      Close;
    end else if UpperCase(FormRequest)='SERVICEREQUEST-CREATE' then begin
      ServiceRequestForm.SetWorkOrderId(StrGrid.Cells[2,IntRow]);
      Close;
    end else begin
      if Main.IsFormOpen('WorkOrderForm')=False then WorkOrderForm:=TWorkOrderForm.Create(nil,StrGrid.Cells[2,IntRow],True,FormRequest);
    end;
  end;
end;

procedure TWorkOrderList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TWorkOrderList.LocationChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TWorkOrderList.LihatClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TWorkOrderList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TWorkOrderList.Search;
var IntCount,IntCount2,IntCount3,IntCount4,IntMaxCol,IntStartRow:Integer;
    IsTrue:Boolean;
begin
  IntMaxCol:=9;
  IntStartRow:=1;
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    IntCount2:=IntStartRow;
    for IntCount:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      IntCount3:=0;
      repeat
        if (StrPos(PChar(UpperCase(WorkOrderArr[IntCount][IntCount3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
        Inc(IntCount3);
      until (IntCount3>IntMaxCol) or (IsTrue);
      if IsTrue then begin
        StrGrid.RowCount:=IntCount2+1;
        StrGrid.Cells[0,IntCount2]:=IntToStr(IntCount2);
        for IntCount4:=1 to IntMaxCol do StrGrid.Cells[IntCount4,IntCount2]:=WorkOrderArr[IntCount][IntCount4-1];
        StrGrid.CellStyle[1,IntCount2].HorizontalAlignment:=taCenter;
        Inc(IntCount2);
      end;
    end;
    Main.M_Normal;
  end;
end;


procedure TWorkOrderList.TombolCariClick(Sender: TObject);
begin
  Search;
end;

procedure TWorkOrderList.CariChange(Sender: TObject);
begin
  if Cari.Text='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TWorkOrderList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TombolCari.Click;
end;

end.
