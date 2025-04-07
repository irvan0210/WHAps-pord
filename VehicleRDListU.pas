unit VehicleRDListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, Buttons, WHUnit, ZColorStringGrid,
  ExtCtrls;

type
  TVehicleRDList = class(TForm)
    Cari: TEdit;
    Label1: TLabel;
    Keluar: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Total: TEdit;
    StrGrid: TZColorStringGrid;
    Group: TComboBox;
    Label4: TLabel;
    GroupCompany: TGroupBox;
    Label5: TLabel;
    SBU: TComboBox;
    Panel1: TPanel;
    cbGeserArmada: TCheckBox;
    procedure KeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupChange(Sender: TObject);
    procedure StrGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    SelectedRow,MaxCol,VhcCompanyId:Integer;
    VehicleArr:Array of TArrString16;
    GroupArr,CompanyArr:Array of TArrString8;
    OrderBy,Sorted,VhcBatchId,FormRequest,FromDate,ToDate,FromTime,VehicleSeat,VhcBatchId_Old:String;
    VhcType:Integer;
    IntRow,IntCol,IntColPrev:Integer;
    IsAuth, IsMoveUnit:Boolean;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleType:String;Vhc_Batch_Id:String='';Vehicle_Seat:String='';Form_Request:String='';From_Date:String='';To_Date:String='';From_Time:String='';Is_Auth:Boolean=False;Is_Move_Unit:Boolean=False;Vhc_Batch_Id_Old:String='';Is_Move_Driver:Boolean=False);Overload;
    procedure RefreshList;
    procedure ClearCari;
  end;

var
  VehicleRDList: TVehicleRDList;

implementation

uses MainU, VehicleMutationU, StrUtils, VehicleFormU, BookingFormU,
  OrderFormU, SPJFormBusU;

{$R *.dfm}

constructor TVehicleRDList.Create(AOwner:TComponent;VehicleType:String;Vhc_Batch_Id:String='';Vehicle_Seat:String='';Form_Request:String='';From_Date:String='';To_Date:String='';From_Time:String='';Is_Auth:Boolean=False;Is_Move_Unit:Boolean=False;Vhc_Batch_Id_Old:String='';Is_Move_Driver:Boolean=False);
begin
  if UpperCase(VehicleType)='TAXI' then begin
    VhcType:=1;
    VhcCompanyId:=3;
  end else if UpperCase(VehicleType)='BUS' then begin
    VhcType:=2;
    VhcCompanyId:=2;
  end;
  VhcBatchId:=Vhc_Batch_Id;
  VhcBatchId_Old:=Vhc_Batch_Id_Old;
  FormRequest:=Form_Request;
  FromDate:=From_Date;
  ToDate:=To_Date;
  FromTime:=From_Time;
  VehicleSeat:=Vehicle_Seat;
  IsAuth:=Is_Auth;
  IsMoveUnit:=Is_Move_Unit;
  Main.WriteLog('Form Open: VehicleRDList='+VehicleType+','+Vhc_Batch_Id+','+Vehicle_Seat+','+','+Form_Request+','+From_Date+','+To_Date+','+From_Time+','+BoolToStr(Is_Auth),1);
  inherited Create(AOwner);
end;

procedure TVehicleRDList.ClearCari;
begin
  Cari.Text:='';
end;

procedure TVehicleRDList.Init;
var IntCount:Integer;
begin
  case VhcType of
    1:Caption:='Data Armada Taxi';
    2:Caption:='Data Armada Bus';
  end;
  if FormRequest='SJ-Change' then Panel1.Visible:=False else  Panel1.Visible:=True;
  MaxCol:=18;
  StrGrid.ColCount:=MaxCol;
  SelectedRow:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=1;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=50;
  StrGrid.ColWidths[3]:=65;
  StrGrid.ColWidths[4]:=150;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=170;
  StrGrid.ColWidths[7]:=40;
  StrGrid.ColWidths[8]:=60;
  StrGrid.ColWidths[9]:=0;
  StrGrid.ColWidths[10]:=0;
  StrGrid.ColWidths[11]:=0;
  StrGrid.ColWidths[12]:=0;
  StrGrid.ColWidths[13]:=0;
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  StrGrid.ColWidths[16]:=0;


  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='Lokasi';
  StrGrid.Cells[2,0]:='No Bodi';
  StrGrid.Cells[3,0]:='No Polisi';
  StrGrid.Cells[4,0]:='Pengemudi';
  StrGrid.Cells[5,0]:='Kenek';

  StrGrid.Cells[6,0]:='Jenis Kendaraan';
  StrGrid.Cells[7,0]:='Seat';
  StrGrid.Cells[8,0]:='Tahun';

//  StrGrid.Cells[7,0]:='Penggunaan';
//  StrGrid.Cells[7,1]:='1';
//  StrGrid.Cells[9,1]:='2';
//  StrGrid.Cells[11,1]:='3';
//  StrGrid.MergeCells.AddRectXY(0,0,0,1);
//  StrGrid.MergeCells.AddRectXY(1,0,1,1);
//  StrGrid.MergeCells.AddRectXY(2,0,2,1);
//  StrGrid.MergeCells.AddRectXY(3,0,3,1);
//  StrGrid.MergeCells.AddRectXY(4,0,4,1);
//  StrGrid.MergeCells.AddRectXY(5,0,5,1);
//  StrGrid.MergeCells.AddRectXY(6,0,6,1);
//  StrGrid.MergeCells.AddRectXY(7,0,12,0);
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to MaxCol-1 do
    StrGrid.Cells[IntCount,2]:='';
  OrderBy:='';
  Sorted:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TVehicleRDList.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrVhcBatch,StrBatch:String;
    IntCount,AdditionalRow:Integer;
begin
  Group.Items.Clear;
  Group.Text:='';
  Group.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
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
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if VhcBatchId<>'' then begin
      StrVhcBatch:=' AND (vhc_batch_id='+QuotedStr(VhcBatchId)+')';
      AdditionalRow:=0;
    end else begin
      StrVhcBatch:='';
      AdditionalRow:=1;
    end;
    StrQry:='SELECT * FROM wh_vhc_batch WHERE (company_id='+CompanyArr[SBU.ItemIndex][1] +')'+StrVhcBatch+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(GroupArr,Qry.RecordCount+AdditionalRow);
    if VhcBatchId='' then begin
      GroupArr[0][0]:='All';
      GroupArr[0][1]:='All';
    end;
    IntCount:=AdditionalRow;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      GroupArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      GroupArr[IntCount][1]:=Qry.FieldValues['name'];
      StrBatch:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(GroupArr)-1 do
    Group.Items.Add(GroupArr[IntCount][1]);
  if VhcBatchId<>'' then Group.ItemIndex:=Group.Items.IndexOf(StrBatch);
end;

procedure TVehicleRDList.RefreshList;
var IntCount,IntCount2:Integer;
    StrQry,Str,StrLocationId,StrCompanyId,StrGroup,StrOrderBy,StrFromDate,StrToDate,StrSeat,StrDetail:String;
    Qry:TADOQuery;
    StrList,StrList2:TStringList;
begin
  Main.M_Busy;
  For IntCount:=0 to Length(VehicleArr)-1 do begin
    for IntCount2:=0 to 12 do
    StrGrid.Cells[IntCount2,IntCount+1]:='';
  end;
  SetLength(VehicleArr,0);
  StrLocationId:=CompanyArr[SBU.ItemIndex][2];
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Group.Text<>'All') and (Group.Text<>'')  then StrGroup:=','+GroupArr[Group.ItemIndex][0]
  else StrGroup:='';
  if VehicleSeat<>'' then StrSeat:=',@Seats='+QuotedStr(VehicleSeat) else StrSeat:='';
  if FromDate<>'' then StrFromDate:=',@FromDate='+QuotedStr(FromDate) else StrFromDate:='';
  if ToDate<>'' then StrToDate:=',@ToDate='+QuotedStr(ToDate) else StrToDate:='';
  StrDetail:=',@Detail=0';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout:=3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetVhcRDList '+StrLocationId+','+StrCompanyId+StrGroup+StrSeat+StrFromDate+StrToDate+OrderBy+Sorted+StrDetail+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(VehicleArr,IntCount+1);
        VehicleArr[IntCount][0]:=Qry.FieldValues['vehicle_id'];
        VehicleArr[IntCount][1]:=Qry.FieldValues['location'];
        VehicleArr[IntCount][2]:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
           VehicleArr[IntCount][3]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
           VehicleArr[IntCount][3]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
        if Qry.FieldValues['driver_name']<>NULL then VehicleArr[IntCount][4]:=Qry.FieldValues['driver_name'];
        if Qry.FieldValues['busboy_name']<>NULL then VehicleArr[IntCount][5]:=Qry.FieldValues['busboy_name'];
        VehicleArr[IntCount][6]:=Qry.FieldValues['batch_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
        if Qry.FieldValues['year']<>NULL then
          VehicleArr[IntCount][7]:=Qry.FieldValues['seat'];
          VehicleArr[IntCount][8]:=Qry.FieldValues['year'];
          VehicleArr[IntCount][9]:='';
          VehicleArr[IntCount][10]:='';
          VehicleArr[IntCount][11]:='';
          VehicleArr[IntCount][12]:='';
          VehicleArr[IntCount][13]:='';
       { StrList:=SplitStrings(Qry.FieldValues['use_time_resume'],'##');
        if StrList.Strings[0]<>'' then begin
          StrList2:=SplitStrings(StrList.Strings[0],'/');
          VehicleArr[IntCount][7]:=StrList2.Strings[0];
          VehicleArr[IntCount][8]:=StrList2.Strings[1];
        end;
        if StrList.Count>1 then
          if StrList.Strings[1]<>'' then begin
            StrList2:=SplitStrings(StrList.Strings[1],'/');
            VehicleArr[IntCount][9]:=StrList2.Strings[0];
            VehicleArr[IntCount][10]:=StrList2.Strings[1];
          end;
        if StrList.Count>2 then
          if StrList.Strings[2]<>'' then begin
            StrList2:=SplitStrings(StrList.Strings[2],'/');
            VehicleArr[IntCount][11]:=StrList2.Strings[0];
            VehicleArr[IntCount][12]:=StrList2.Strings[1];
          end;
        }
        VehicleArr[IntCount][13]:=Qry.FieldValues['vhc_batch_id'];
        VehicleArr[IntCount][14]:=Qry.FieldValues['seat'];
        Qry.Next;
        Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if Length(VehicleArr)>0 then StrGrid.RowCount:=Length(VehicleArr)+2
  else StrGrid.RowCount:=2;

  For IntCount:=0 to Length(VehicleArr)-1 do begin
    for IntCount2:=0 to 16 do
    StrGrid.Cells[IntCount2,IntCount+2]:=VehicleArr[IntCount][IntCount2];
  end;
  Total.Text:=IntToStr(Length(VehicleArr));
  Main.M_Normal;
end;

procedure TVehicleRDList.KeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleRDList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleRDList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(VehicleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(VehicleArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 16 do
          StrGrid.Cells[Count4,Count2]:=VehicleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TVehicleRDList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TVehicleRDList.StrGridDblClick(Sender: TObject);
var StrRemark:String;
begin
  if FormRequest='' then begin
  end else begin
    if UpperCase(FormRequest)='RESERVED-CREATE' then  begin
      Case IntCol of
        0..6:begin
               if IsAuth then begin
                 StrRemark:=InputBox('Perubahan Jenis Kendaraan','Sebab perubahan ?','');
                 if StrRemark<>'' then
                   BookingForm.SetVehicleId(StrGrid.Cells[0,IntRow], StrRemark, IsMoveUnit, VhcBatchId_Old, StrGrid.Cells[15,IntRow]+'-'+StrGrid.Cells[16,IntRow]);
               end else begin
                 BookingForm.SetVehicleId(StrGrid.Cells[0,IntRow], '', IsMoveUnit, VhcBatchId_Old, StrGrid.Cells[15,IntRow]+'-'+StrGrid.Cells[16,IntRow]);
               end;
               Close;
             end;
        7..8:if (StrGrid.Cells[8,IntRow]<>'') and (StrGrid.Cells[10,IntRow]<>'') then begin
               if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[10,IntRow],False);
             end;
        9..10:if (StrGrid.Cells[10,IntRow]<>'') and (StrGrid.Cells[12,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[12,IntRow],False);
              end;
        11..12:if (StrGrid.Cells[12,IntRow]<>'') and (StrGrid.Cells[14,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[13,IntRow],False);
              end;
      end;
    end;
    if UpperCase(FormRequest)='WAITINGLIST-ALLOCATE' then  begin
      Case IntCol of
        0..7:begin
                 BookingForm.SetVehicleId(StrGrid.Cells[0,IntRow]);
             end;
        8..9:if (StrGrid.Cells[9,IntRow]<>'') and (StrGrid.Cells[10,IntRow]<>'') then begin
               if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[10,IntRow],False);
             end;
        10..11:if (StrGrid.Cells[11,IntRow]<>'') and (StrGrid.Cells[12,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[12,IntRow],False);
              end;
        12..13:if (StrGrid.Cells[13,IntRow]<>'') and (StrGrid.Cells[14,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[13,IntRow],False);
              end;
      end;
      Close;
    end;
    if UpperCase(FormRequest)='SJ-CHANGE' then  begin
       StrVehicleID:= StrGrid.Cells[0,IntRow];
       SPJFormBus.DisplayNoBody.Text:=StrGrid.Cells[2,IntRow];
       SPJFormBus.NoPolisi.Text:=StrGrid.Cells[3,IntRow];
       SPJFormBus.SeatDisp.Text:=StrGrid.Cells[8,IntRow];
       Close;
    end;
  end;
end;

procedure TVehicleRDList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TVehicleRDList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if VhcBatchId='' then Group.ItemIndex:=Group.Items.IndexOf('All');
  cbGeserArmada.Checked:=IsMoveUnit;

  RefreshList;
end;

procedure TVehicleRDList.GroupChange(Sender: TObject);
begin
  RefreshList;
end;

procedure TVehicleRDList.StrGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{  StrGrid.MouseToCell(X,Y,IntCol,IntRow);
  if (Button=mbRight) and (IntRow=0) then begin
    if (IntCol = IntColPrev) and (Sorted='') then Sorted:=',@Sorted='+QuotedStr('DESC') else Sorted:='';
    IntColPrev:=IntCol;
    case IntCol of
      0:OrderBy:=',@OrderBy='+QuotedStr('vehicle_id');
      1:OrderBy:=',@OrderBy='+QuotedStr('location');
      2:OrderBy:='';
      3:OrderBy:=',@OrderBy='+QuotedStr('engine_id');
      4:OrderBy:=',@OrderBy='+QuotedStr('chasis_id');
      5:OrderBy:=',@OrderBy='+QuotedStr('license_plate');
      6:OrderBy:=',@OrderBy='+QuotedStr('year');
      7:OrderBy:=',@OrderBy='+QuotedStr('chasis_id');
      8:OrderBy:=',@OrderBy='+QuotedStr('stnk');
      9:OrderBy:=',@OrderBy='+QuotedStr('kir');
      10:OrderBy:=',@OrderBy='+QuotedStr('kiu');
      11:OrderBy:=',@OrderBy='+QuotedStr('kio');
    end;
    RefreshList;
  end;
}
end;

end.
