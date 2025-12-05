unit ItemServiceRequestListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, ExtCtrls,
  ComCtrls;

type
  TItemServiceRequestList = class(TForm)
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    GroupCombo: TPanel;
    SBU: TComboBox;
    Location: TComboBox;
    ToDepartmentDisp: TEdit;
    DepartmentDisp: TEdit;
    Department: TComboBox;
    ToDepartment: TComboBox;
    Year: TEdit;
    Month: TComboBox;
    Lihat: TButton;
    Cari: TEdit;
    Tanggal: TDateTimePicker;
    SampaiTgl: TDateTimePicker;
    Status: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Label9: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LocationChange(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure ToDepartmentChange(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure SampaiTglChange(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshDept;
    procedure RefreshToDept;
    procedure ClearCombo;
    procedure RefreshLocation;
    procedure RefreshData;
    procedure RefreshGrid;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Dept_Id:String='');Overload;
    { Public declarations }
  end;

var
  ItemServiceRequestList: TItemServiceRequestList;
  FormRequest,FormFunction,DeptId:String;
  CompanyArr,DepartmentArr,LocationArr:Array of TArrString4;
  ItemRequestArr:Array of TArrString14;
  IntRow:Integer;

implementation

uses MainU, StrUtils, ItemServiceRequestU, PurchaseRequestU, GoodTransferU,
  GoodAssignmentU;

{$R *.dfm}

constructor TItemServiceRequestList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Dept_Id:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  DeptId:=Dept_Id;
  Inherited Create(AOwner);
end;


procedure TItemServiceRequestList.Init;
begin
  Tanggal.Date:=Now;
  SampaiTgl.Date:=Now;
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  Location.Text:='';
  Location.Items.Clear;
  Location.ItemIndex:=-1;
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Year.Text:='';
  IntRow:=0;
  GroupCombo.Visible:=True;
 //  if FormRequest='' then GroupDetail.Enabled:=False;
end;

procedure TItemServiceRequestList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=120;
  StrGrid.ColWidths[2]:=72;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=150;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=0;
  StrGrid.ColWidths[10]:=120;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No PBJ';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Tanggal Dibutuhkan';
  StrGrid.Cells[4,0]:='Departmen Asal';
  StrGrid.Cells[5,0]:='Departemen Tujuan';
  StrGrid.Cells[6,0]:='Requestor';
  StrGrid.Cells[10,0]:='No Ref';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 7 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
end;

procedure TItemServiceRequestList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1;' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyArr[IntCount][1]:=Qry.FieldValues['name'];
        Qry.Next;
        Inc(IntCount);
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount+1);
    DepartmentArr[0][0]:='00';
    DepartmentArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then SBU.ItemIndex:=IntCount;
  end;

  {for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  end; }

  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
//  if CompanyId<>'1' then
//    if UpperCase(FormRequest)<>'PURCHASEORDER' then

//  GroupDetail.Enabled:=False;
  RefreshLocation;
  Main.M_Normal;
end;

procedure TItemServiceRequestList.RefreshDept;
var IntCount:Integer;
begin
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  for IntCount:=0 to Length(DepartmentArr)-1 do begin
    Department.Items.Add(DepartmentArr[IntCount][1]);
  end;
  Department.ItemIndex:=Department.Items.IndexOf(DepartmentName);
  DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
end;

procedure TItemServiceRequestList.RefreshToDept;
var IntCount:Integer;
begin
  ToDepartment.Items.Clear;
  ToDepartment.Text:='';
  ToDepartment.ItemIndex:=-1;
  for IntCount:=0 to Length(DepartmentArr)-1 do begin
    ToDepartment.Items.Add(DepartmentArr[IntCount][1]);
  end;
  ToDepartment.ItemIndex:=0;
  ToDepartmentDisp.Text:=DepartmentArr[ToDepartment.ItemIndex][1];
end;

procedure TItemServiceRequestList.ClearCombo;
begin

end;

procedure TItemServiceRequestList.RefreshLocation;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
  Location.Text:='';
  Location.Items.Clear;
  Location.ItemIndex:=-1;
  if SBU.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrQry:='EXEC GetLocation '+CompanyId+';';
      StrQry:='EXEC GetLocation '+CompanyId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(LocationArr,Qry.RecordCount);
      if Qry.RecordCount>0 then begin
        IntCount:=0;
        while not(Qry.Eof) do begin
          LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
          LocationArr[IntCount][1]:=Qry.FieldValues['location'];
          Qry.Next;
          Inc(IntCount);
        end;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(LocationArr)-1 do begin
      Location.Items.Add(LocationArr[IntCount][1]);
      if LocationArr[IntCount][0]=LocationId then Location.ItemIndex:= Location.Items.IndexOf(LocationArr[IntCount][1]);
    end;
    Main.M_Normal;
  end;
end;

procedure TItemServiceRequestList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrLocationId,StrCompanyId,StrDepartmentID,StrDepartmentToID:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    AwalBulan:='1/'+Month.Text+'/'+Year.Text;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
   // MessageBox(0,PChar(StrCompanyId+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)),'List barang',MB_OK or MB_ICONERROR);
    StrLocationId:=LocationArr[Location.ItemIndex][0];
    StrDepartmentID:=DepartmentArr[Department.ItemIndex][0];
    StrDepartmentToID:=DepartmentArr[ToDepartment.ItemIndex][0];
    StrQry:='EXEC GetItemRequestList '+StrCompanyId+','+StrLocationId+','+StrDepartmentID+','+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+','+StrDepartmentToID+','+QuotedStr(FormatDateTime('yyyy-mm-dd',SampaiTgl.Date+1))+','+QuotedStr(Status.Text)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(ItemRequestArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ItemRequestArr[IntCount][0]:=Qry.FieldValues['item_request_id'];
      ItemRequestArr[IntCount][1]:=Qry.FieldValues['request_dates'];
      ItemRequestArr[IntCount][2]:=Qry.FieldValues['origin_department_name'];
      ItemRequestArr[IntCount][3]:=Qry.FieldValues['to_department_name'];
      ItemRequestArr[IntCount][4]:=Qry.FieldValues['user_name'];
      if Qry.FieldValues['purchase_request_id']<> NULL then ItemRequestArr[IntCount][5]:=Qry.FieldValues['purchase_request_id']
      else ItemRequestArr[IntCount][5]:='';
      if Qry.FieldValues['complete']='1' then ItemRequestArr[IntCount][6]:=Qry.FieldValues['complete']
      else ItemRequestArr[IntCount][6]:='';
      if Qry.FieldValues['part_transfer_id']<>NULL then ItemRequestArr[IntCount][7]:=Qry.FieldValues['part_transfer_id']
      else ItemRequestArr[IntCount][7]:='';
      if Qry.FieldValues['part_allocation_id']<>NULL then ItemRequestArr[IntCount][8]:=Qry.FieldValues['part_allocation_id']
      else ItemRequestArr[IntCount][8]:='';
      if Qry.FieldValues['complete2']<>NULL then ItemRequestArr[IntCount][9]:=Qry.FieldValues['complete2']
      else ItemRequestArr[IntCount][9]:='';
      if Qry.FieldValues['service_request_id']<>NULL then ItemRequestArr[IntCount][10]:=Qry.FieldValues['service_request_id']
      else ItemRequestArr[IntCount][10]:='';
      ItemRequestArr[IntCount][11]:=Qry.FieldValues['requested_dates'];
      if Qry.FieldValues['posting']='1' then
      ItemRequestArr[IntCount][12]:=Qry.FieldValues['posting']
      else ItemRequestArr[IntCount][12]:='0';

      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TItemServiceRequestList.RefreshGrid;
var IntCount,Count,Count2:Integer;
    IsMark:Boolean;
begin
  if Length(ItemRequestArr)>0 then
  begin
    StrGrid.RowCount:=Length(ItemRequestArr)+1;
    for IntCount:=0 to Length(ItemRequestArr)-1 do begin
      StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
      StrGrid.Cells[1,IntCount+1]:=ItemRequestArr[IntCount][0];
      StrGrid.Cells[2,IntCount+1]:=ItemRequestArr[IntCount][1];
      StrGrid.Cells[3,IntCount+1]:=ItemRequestArr[IntCount][11];
      StrGrid.Cells[4,IntCount+1]:=ItemRequestArr[IntCount][2];
      StrGrid.Cells[5,IntCount+1]:=ItemRequestArr[IntCount][3];
      StrGrid.Cells[6,IntCount+1]:=ItemRequestArr[IntCount][4];
      StrGrid.Cells[7,IntCount+1]:=ItemRequestArr[IntCount][9];
      StrGrid.Cells[10,IntCount+1]:=ItemRequestArr[IntCount][10];
      IsMark:=False;
//      if UpperCase(FormRequest)='GOODTRANSFER' then begin
//        if ItemRequestArr[IntCount][7]<>'' then IsMark:=True;
//      end else if UpperCase(FormRequest)='GOODASSIGNMENT' then begin
//        if ItemRequestArr[IntCount][8]<>'' then IsMark:=True;
//      end else begin if ItemRequestArr[IntCount][6]<>'' then IsMark:=True;
//      end;
//      if IsMark=True then begin
//        StrGrid.CellStyle[0,IntCount+1].Font.Color:=clGreen;
//        StrGrid.CellStyle[1,IntCount+1].Font.Color:=clGreen;
//        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clGreen;
//        StrGrid.CellStyle[3,IntCount+1].Font.Color:=clGreen;
//        StrGrid.CellStyle[4,IntCount+1].Font.Color:=clGreen;
//        StrGrid.CellStyle[5,IntCount+1].Font.Color:=clGreen;
//      end else begin


//      for Count:=0 to 11 do begin
//        for Count2:=0 to StrGrid.RowCount do begin
//          if ItemRequestArr[IntCount][12]='0' then
//            StrGrid.CellStyle[Count,Count2+1].Font.Color:=clWindowText
//          else
//            StrGrid.CellStyle[Count,Count2+1].Font.Color:=clGreen;
//        end;
//      end;


      if ItemRequestArr[IntCount][12]='0' then begin
        for Count2:=0 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,IntCount+1].Font.Color:=clWindowText;
        end;

      end else begin
        for Count2:=0 to StrGrid.ColCount-1 do
        begin
          StrGrid.CellStyle[Count2,IntCount+1].Font.Color:=clGreen;
        end;
      end;

//        StrGrid.CellStyle[0,IntCount+1].Font.Color:=clWindowText;
//        StrGrid.CellStyle[1,IntCount+1].Font.Color:=clWindowText;
//        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWindowText;
//        StrGrid.CellStyle[3,IntCount+1].Font.Color:=clWindowText;
//        StrGrid.CellStyle[4,IntCount+1].Font.Color:=clWindowText;
//        StrGrid.CellStyle[5,IntCount+1].Font.Color:=clWindowText;
    end;
  end
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
end;

procedure TItemServiceRequestList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshDept;
  RefreshToDept;
  if DepartmentId<>'' then begin
    Department.ItemIndex:=0;
//    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
    ToDepartment.ItemIndex:=ToDepartment.Items.IndexOf(DepartmentName);
//    ToDepartmentDisp.Text:=DepartmentArr[ToDepartment.ItemIndex][1];
  end;
  Year.Text:=FormatDateTime('yyyy',Now());
  Month.ItemIndex:=StrToInt(FormatDateTime('mm',Now()))-1;
  RefreshData;
  RefreshGrid;
end;

procedure TItemServiceRequestList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TItemServiceRequestList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TItemServiceRequestList.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[1,IntRow]<>'') and (IntRow>MinRowGrid) then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then begin
//        if (StrGrid.Cells[5,IntRow]='') then begin
          if Main.IsFormOpen('ItemServiceRequest')=False then ItemServiceRequest:=TItemServiceRequest.Create(Self,StrGrid.Cells[1,IntRow],False)
          else MessageBox(0,'Tutup Form Permintaan Barang/Jasa terlebih dahulu','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
//        end else begin
//          MessageBox(0,'Batalkan Purchase Request Dahulu','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
//        end;
      end else begin
        if Main.IsFormOpen('ItemServiceRequest')=False then ItemServiceRequest:=TItemServiceRequest.Create(Self,StrGrid.Cells[1,IntRow],True)
        else MessageBox(0,'Tutup Permintaan Barang/Jasa terlebih dahulu','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
      end;
    end else if UpperCase(FormRequest)='PURCHASEREQUEST' then begin
      if StrGrid.Cells[6,IntRow]='' then begin
        PurchaseRequest.PBJNo.Text:=(StrGrid.Cells[1,IntRow]);
        Close;
      end else begin
        MessageBox(0,'Permintaan Barang/Jasa Sudah Dipenuhi','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
      end;
    end else if UpperCase(FormRequest)='ITEMREQUEST' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
        ItemServiceRequest.Reprint(StrGrid.Cells[1,IntRow]);
      end;
      Close;
    end else if UpperCase(FormRequest)='GOODTRANSFER' then begin
      if StrGrid.Cells[7,IntRow]='' then begin
        GoodTransfer.SetPBJNo(StrGrid.Cells[1,IntRow]);
        Close;
      end else
        MessageBox(0,'Permintaan Barang/Jasa Sudah Dipenuhi','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
    end else if UpperCase(FormRequest)='GOODASSIGNMENT' then begin
      if StrGrid.Cells[7,IntRow]='' then begin
        GoodAssignment.SetPBJNo(StrGrid.Cells[1,IntRow]);
        Close;
      end else
        MessageBox(0,'Permintaan Barang/Jasa Sudah Dipenuhi','List Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TItemServiceRequestList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(ItemRequestArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
        if (StrPos(PChar(UpperCase(ItemRequestArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          StrGrid.CellStyle[5,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4+1,Count2]:=ItemRequestArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TItemServiceRequestList.SBUChange(Sender: TObject);
begin
  if SBU.Text<>'' then begin
    RefreshLocation;
  end;
end;

procedure TItemServiceRequestList.LocationChange(Sender: TObject);
begin
  if Department.Text<>'' then
    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
end;

procedure TItemServiceRequestList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TItemServiceRequestList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TItemServiceRequestList.DepartmentChange(Sender: TObject);
begin
//  DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
//  if Department.Text<>'00' then begin
//    GroupCombo.Visible:=True;
//    ToDepartment.ItemIndex:=ToDepartment.Items.IndexOf('00');
//    ToDepartmentDisp.Text:=DepartmentArr[ToDepartment.ItemIndex][1];
//  end;
end;

procedure TItemServiceRequestList.ToDepartmentChange(Sender: TObject);
begin
//  ToDepartmentDisp.Text:=DepartmentArr[ToDepartment.ItemIndex][1];
//  if ToDepartment.Text<>'00' then begin
//    GroupCombo.Visible:=False;
//    Department.ItemIndex:=Department.Items.IndexOf('00');
//    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
//  end else begin
//    GroupCombo.Visible:=True;
//  end;
end;

procedure TItemServiceRequestList.TanggalChange(Sender: TObject);
begin
  if SampaiTgl.Date<Tanggal.Date then SampaiTgl.Date:= Tanggal.Date;
end;

procedure TItemServiceRequestList.SampaiTglChange(Sender: TObject);
begin
  if SampaiTgl.Date<Tanggal.Date then Tanggal.Date:= SampaiTgl.Date;
end;

end.
