unit VehicleAdminListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls,
  ComCtrls, ADODB;

type
  TVehicleAdminList = class(TForm)
    Label2: TLabel;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    CariOffering: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToXCelClick(Sender: TObject);
    procedure SemuaClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure OutDatesClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariOfferingClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
//    CompId:Integer;
    FormRequest,CustId,OrderBy:String;
    ListArr,CompanyArr:Array of TArrString20;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    OutDate,Initiation,IncludeAdditional:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0;Out_Date:Integer=0;Include_Additional:Boolean=False);Overload;
    procedure RefreshDisplay;
  end;

var
  VehicleAdminList: TVehicleAdminList;

implementation

uses MainU, VehicleAdminU, VehicleAdminCheckListU;

{$R *.dfm}
{
constructor TVehicleAdminList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
//  CompId:=1;
  inherited Create(AOwner);
end;
}
constructor TVehicleAdminList.Create(AOwner:TComponent;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0;Out_Date:Integer=0;Include_Additional:Boolean=False);
begin
{  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
}  IsAll:=Is_All;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  OrderBy:=Order_By;
  Range:=Range_M;
  if Out_Date=1 then OutDate:=True else OutDate:=False;
  IncludeAdditional:=Include_Additional;
  Main.WriteLog('Form Open: OrderList='+Form_Request+','+Customer_Id+','+IntToStr(Is_All)+','+Order_By+','+IntToStr(Range_M)+','+IntToStr(Out_Date)+','+BoolToStr(Include_Additional),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TVehicleAdminList.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
  Tanggal.Enabled:=False; 
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleAdminList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=6;
  StrGrid.ColWidths[0]:=40;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=200;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Nomor Admin';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Tujuan';
  StrGrid.Cells[5,0]:='Armada';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVehicleAdminList.RefreshCombo;
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TVehicleAdminList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrTanggal,StrOrder,StrRange,StrLocationId,StrCompanyId,StrIncludeAdditional,StrCustomerId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(ListArr,0);
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetVehicleAdminList '+StrCompanyId+StrLocationId+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ListArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ListArr[IntCount][0]:=Qry.FieldValues['publish_date'];
      ListArr[IntCount][1]:=Qry.FieldValues['admin_id'];
      ListArr[IntCount][2]:=Qry.FieldValues['name'];
      ListArr[IntCount][3]:=Qry.FieldValues['details'];
      ListArr[IntCount][4]:=Qry.FieldValues['vehicle_detail'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleAdminList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  for IntCount:=0 to StrGrid.ColCount-1 do
    for IntCount2:=1 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCount2]:='';
      StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
    end;
  if Length(ListArr)>0 then StrGrid.RowCount:=Length(ListArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=0 to Length(ListArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=ListArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=ListArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=ListArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=ListArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=ListArr[IntCount][4];
  end;
  Main.M_Normal;
end;

procedure TVehicleAdminList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TVehicleAdminList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TVehicleAdminList.Search;
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(ListArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(ListArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 4 do begin
            StrGrid.Cells[Count4+1,Count2]:=ListArr[Count][Count4];
          end;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TVehicleAdminList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TVehicleAdminList.StrGridDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrOrder:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (IntRow>=MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('VehicleAdmin')=False then VehicleAdmin:=TVehicleAdmin.Create(nil,StrGrid.Cells[2,IntRow],'',False);
      Close;
    end else begin
      if (UpperCase(FormRequest)='ADMIN-ADDID') then begin
        VehicleAdmin.SetAdminId(StrGrid.Cells[2,IntRow]);
      end;
      if (UpperCase(FormRequest)='CHECKLIST-UPDATE') then begin
        VehicleAdminCheckList:=TVehicleAdminCheckList.Create(nil,StrGrid.Cells[2,IntRow],FormRequest,True);
      end;
      if (UpperCase(FormRequest)='CHECKLIST-VIEW') then begin
        VehicleAdminCheckList:=TVehicleAdminCheckList.Create(nil,StrGrid.Cells[2,IntRow],FormRequest,False);
      end;
      if (UpperCase(FormRequest)='MAIN-CHANGE') then begin
        VehicleAdmin:=TVehicleAdmin.Create(nil,StrGrid.Cells[2,IntRow],FormRequest,True);
      end;
      Close;
    end;
  end;
end;

procedure TVehicleAdminList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleAdminList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleAdminList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TVehicleAdminList.SemuaClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TVehicleAdminList.TanggalChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TVehicleAdminList.OutDatesClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TVehicleAdminList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TVehicleAdminList.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TVehicleAdminList.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TVehicleAdminList.SBUChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
