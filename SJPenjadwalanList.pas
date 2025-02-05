unit SJPenjadwalanList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, ZColorStringGrid, Buttons, WHUnit;

type
  TFSJPenjadwalanList = class(TForm)
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btnCariOffering: TSpeedButton;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    btnSelesai: TButton;
    Tanggal: TDateTimePicker;
    All: TCheckBox;
    Total: TMemo;
    lbl1: TLabel;
    Tanggal2: TDateTimePicker;
    pnlLegend: TPanel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure btnCariOfferingClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Tanggal2Change(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    ResvArr,CompanyArr:Array of TArrString18;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    OrderBy:String;
    Initiation:Boolean;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
  public
    { Public declarations }
   constructor Create(AOwner:TComponent);Overload;
   constructor Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);Overload;
   procedure RefreshDisplay;
  end;

var
  FSJPenjadwalanList: TFSJPenjadwalanList;

implementation

uses MainU, ADODB, StrUtils, VarUtils, SPJFormBusU;

{$R *.dfm}


constructor TFSJPenjadwalanList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TFSJPenjadwalanList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);
begin
  if UpperCase(Company_Id)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(Company_Id)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  IsAll:=Is_All;
  CustId:=Customer_Id;
  FormRequest:=Form_Request;
  OrderBy:=Order_By;
  Range:=Range_M;
  Main.WriteLog('Form Open: FSJPenjadwalanList='+Company_Id+','+Customer_Id+','+Form_Request+','+IntToStr(Is_All)+','+Order_By+','+IntToStr(Range_M),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TFSJPenjadwalanList.RefreshDisplay;
begin
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;

end;

procedure TFSJPenjadwalanList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=14;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=0;
  StrGrid.ColWidths[2]:=110;
  StrGrid.ColWidths[3]:=90;
  StrGrid.ColWidths[4]:=50;
  StrGrid.ColWidths[5]:=150;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=65;
  StrGrid.ColWidths[8]:=200;
  StrGrid.ColWidths[9]:=180;
  //col 10=vhc_trans_id
  //col 11=status
  //col 12=package
  //col 13=total
  //col 14=total_payment
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,7,0);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);
  StrGrid.MergeCells.AddRectXY(9,0,9,1);
  StrGrid.Cells[2,0]:='No Pesanan';
  StrGrid.Cells[3,0]:='Armada';
  StrGrid.Cells[4,0]:='No Bodi';
  StrGrid.Cells[5,0]:='Driver';
  StrGrid.Cells[6,0]:='Penggunaan';
  StrGrid.Cells[8,0]:='Rute';
  StrGrid.Cells[9,0]:='Pelanggan';
  StrGrid.Cells[6,1]:='Tgl';
  StrGrid.Cells[7,1]:='Jam';
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
  for IntCount:=10 to StrGrid.ColCount-1 do StrGrid.ColWidths[IntCount]:=0;
end;

procedure TFSJPenjadwalanList.RefreshCombo;
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
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
end;

procedure TFSJPenjadwalanList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrOrder,StrRange,StrTanggal,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Main.M_Busy;
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    SetLength(ResvArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=',@LocationId='+CompanyArr[SBU.ItemIndex][2];
    if OrderBy<>'' then StrOrder:=',@OrderBy='+QuotedStr(OrderBy) else StrOrder:='';
    if Range>0 then StrRange:=',@Range='+IntToStr(Range) else StrRange:='';
    if All.Checked=False then
    begin
      if (Tanggal2.Date>Tanggal.Date) then
      StrTanggal:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal2.Date))
      else
      StrTanggal:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    end
    else begin
      StrTanggal:='';
    end;
//    if AllData.Checked then IsAll:=6;
    StrQry:='EXEC GetReservedOrderList '+StrCompanyId+StrLocationId+',@Finish='+IntToStr(IsAll)+StrTanggal+',@PaymentDetail=2'+StrOrder+StrRange+',@Formname='+QuotedStr('SJ');
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(ResvArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ResvArr[IntCount][0]:=Qry.FieldValues['reserved_order_id'];
      ResvArr[IntCount][1]:=Qry.FieldValues['reserved_order_detail_id'];
      ResvArr[IntCount][2]:=Qry.FieldValues['customer_order_id'];
      if Qry.FieldValues['vehicle_name']<>NULL then
      ResvArr[IntCount][3]:=Qry.FieldValues['vehicle_name']+' '+IntToStr(Qry.FieldValues['seat'])+' Seat';
      if Qry.FieldValues['body_id']<>NULL then
        ResvArr[IntCount][4]:=LeftStr(Qry.FieldValues['body_id'],Length(Qry.FieldValues['body_id'])-1);
      ResvArr[IntCount][5]:=Qry.FieldValues['drivers_name'];
      ResvArr[IntCount][6]:=Qry.FieldValues['from_to_dates'];
      ResvArr[IntCount][7]:=Qry.FieldValues['from_to_times'];
      ResvArr[IntCount][8]:=Qry.FieldValues['route'];
      ResvArr[IntCount][9]:=Qry.FieldValues['customer_name'];
//      if Qry.FieldValues['vhc_trans_id']<>NULL then ResvArr[IntCount][10]:=Qry.FieldValues['vhc_trans_id'];
//      if (Qry.FieldValues['status']='0') OR (Qry.FieldValues['detail_status']='0') then
//        ResvArr[IntCount][11]:='0'
//      else ResvArr[IntCount][11]:='1';
//      if Qry.FieldValues['daily_package']<>NULL then ResvArr[IntCount][12]:='1' else ResvArr[IntCount][12]:='0';
//      if Qry.FieldValues['total']<>NULL then
      ResvArr[IntCount][13]:=Qry.FieldValues['total'];
      if Qry.FieldValues['total_payment']<>NULL then
        ResvArr[IntCount][14]:=Qry.FieldValues['total_payment'];
      if Qry.FieldValues['cust_contract_id']<>NULL then
      ResvArr[IntCount][15]:=Qry.FieldValues['cust_contract_id'];
      ResvArr[IntCount][16]:=vartoStr(Qry.FieldValues['isFix']);
      ResvArr[IntCount][17]:=vartoStr(Qry.FieldValues['isAuth']);
      ResvArr[IntCount][18]:=vartoStr(Qry.FieldValues['isOnline']);
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TFSJPenjadwalanList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  if Length(ResvArr)>0 then StrGrid.RowCount:=Length(ResvArr)+2
  else begin
    StrGrid.RowCount:=3;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,2]:='';
      StrGrid.CellStyle[IntCount,2].Font.Color:=clWindowText;
      StrGrid.CellStyle[IntCount,2].BGColor:=clWhite;
    end;
  end;
  for IntCount:=0 to Length(ResvArr)-1 do begin
    StrGrid.Cells[0,IntCount+2]:=ResvArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=ResvArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=ResvArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=ResvArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=ResvArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=ResvArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=ResvArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=ResvArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=ResvArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=ResvArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=ResvArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=ResvArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=ResvArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=ResvArr[IntCount][18];
    for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clWindowText;

    if ResvArr[IntCount][16]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].BGColor:=clSilver;

    if ResvArr[IntCount][17]='1' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].BGColor:=$0040FF00;

    if ResvArr[IntCount][15]<>'' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=$00004080;
    if ResvArr[IntCount][10]<>'' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clBlue;
    if ResvArr[IntCount][14]<>'' then
      if StrToInt(ResvArr[IntCount][14])>=StrToInt(ResvArr[IntCount][13]) then
        if ResvArr[IntCount][10]<>'' then
          for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clPurple
        else
          for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    if ResvArr[IntCount][11]='0' then
      for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clRed;

  end;
  Total.Text:=IntToStr(Length(ResvArr));
  Main.M_Normal;
end;

procedure TFSJPenjadwalanList.Search;
var Count,Count2,Count3,Count4,IntCount5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(ResvArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 9 do
      if (StrPos(PChar(UpperCase(ResvArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 12 do
          StrGrid.Cells[Count4,Count2]:=ResvArr[Count][Count4];
          for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clWindowText;
          for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].BGColor:=clWhite;
          if ResvArr[Count][16]='1' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].BGColor:=clSilver;
          if ResvArr[Count][15]<>'' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=$00004080;
          if ResvArr[Count][10]<>'' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clBlue;

          if ResvArr[Count][17]='1' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].BGColor:=$0040FF00;

          if ResvArr[Count][14]<>'' then
            if StrToInt(ResvArr[Count][14])>=StrToInt(ResvArr[Count][13]) then
              if ResvArr[Count][10]<>'' then
                for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clPurple
              else
                for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clGreen;
          if ResvArr[Count][11]='0' then
            for IntCount5:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount5,Count2].Font.Color:=clRed;
          Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TFSJPenjadwalanList.FormShow(Sender: TObject);
begin
  Tanggal.Date:=Now();
  Tanggal2.date:=NOW()+3;

  InitGrid;

  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Cari.SetFocus
end;

procedure TFSJPenjadwalanList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TFSJPenjadwalanList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TFSJPenjadwalanList.btnCariOfferingClick(Sender: TObject);
begin
  Search;
end;

procedure TFSJPenjadwalanList.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TFSJPenjadwalanList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TFSJPenjadwalanList.StrGridDblClick(Sender: TObject);
var Qry,QryWehaOnline:TADOQuery;
    StrQry,StrIsPackage,StrDates,StrNoBody,StrKenek:String;
    IsOk:Boolean;
begin
//  SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  QryWehaOnline:=TADOQuery.Create(Self);
  QryWehaOnline.Connection:=Main.MyConnectionWehaOnline;
  QryWehaOnline.CommandTimeout := 3600;
  IsOk:=True;
  Main.M_Busy;
  if Main.OpenDb then begin
    if StrGrid.Cells[13,IntRow]='1' then
    begin
      StrQry:='SELECT Status FROM Orders WHERE OrderNo='+QuotedStr(StrGrid.Cells[2,IntRow])+';';
      QryWehaOnline.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      QryWehaOnline.SQL.Add(StrQry);
      QryWehaOnline.Open;

      if QryWehaOnline.RecordCount=0 then
      begin
        IsOk:=False;
        MessageBox(0,PChar('Data order tidak ada di Wehaonline '+Chr(13)),'Penjadwalan',MB_OK or MB_ICONWARNING);
        Main.M_Normal;
        QryWehaOnline.Close;
        FreeAndNil(QryWehaOnline);
        Main.CloseDb;
        Exit;
      end else if QryWehaOnline.FieldValues['Status']<>'PAID' then
      begin
        IsOk:=False;
        MessageBox(0,PChar('Status Order belum PAID'+Chr(13)+Chr(13)+'bisa konfirmasi ke Salesnya'),'Penjadwalan',MB_OK or MB_ICONWARNING);
        Main.M_Normal;
        QryWehaOnline.Close;
        FreeAndNil(QryWehaOnline);
        Main.CloseDb;
        Exit;
      end else begin
        IsOk:=True;
      end;
    end;

    if IsOk=True then
    begin
      StrQry:='EXEC GetReservedOrderDetailDetail '+QuotedStr(StrGrid.Cells[1,IntRow])+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then
      begin
        with SPJFormBus do
        begin
          CariPengemudi1.Enabled:=True;
          CariPengemudi2.Enabled:=True;
          Kenek.Enabled:=True ;
          StrIsOnline :=VarToStr(Qry.FieldValues['isOnline']);
          ReservedOrderDetaiId.Text:=Qry.FieldValues['reserved_order_detail_id'];
          OrderId.Text:=Qry.FieldValues['customer_order_id'];
          CustomerId.Text:=Qry.FieldValues['customer_id'];
          CustomerDisp.Text:=Qry.FieldValues['customer_name'];
          FromDate.Text:=Qry.FieldValues['from_dates_l'];
          FromDateApi.Text:=Qry.FieldValues['from_dates_api'];
          ToDate.Text:=Qry.FieldValues['to_dates_l'];
          FromTime.Text:=Qry.FieldValues['from_time'];
          StandbyTime.Text:=Qry.FieldValues['standby_time'];
          DriverDisp.Text:=Qry.FieldValues['driver_name'];
          StrVehicleID:=Qry.FieldValues['vehicle_id'];
          if Qry.FieldValues['driver_name2']<>NULL then
          begin
            StrDriver2:=Qry.FieldValues['employee_id2'];
            DriverDisp2.Text:=Qry.FieldValues['driver_name2'];
            if Qry.FieldValues['cellular_no_driver']<>NULL then
            TelpHP2.Text:=Qry.FieldValues['cellular_no_driver2']
            else
            TelpHP2.Text:='';
          end else
          begin
            DriverDisp2.Text:='';
            TelpHP2.Text:=''
          end;
          DisplayNoBody.Text:=Qry.FieldValues['body_id'];
          if Qry.FieldValues['cellular_no_driver']<>NULL then
          begin
            TelpHP.Text:=Qry.FieldValues['cellular_no_driver'];
          end else
          begin
            TelpHP.Text:='';
          end;

          SeatDisp.Text:=Qry.FieldValues['seat'];
          if Qry.FieldValues['license_plate']<>NULL then
          begin
             if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
                NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                    ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
              else
              NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                    ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          end;

          if Qry.FieldValues['group_name']<>NULL then Group.Text:=Qry.FieldValues['group_name'];
          (* CEK YA *)
          if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
          if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];

          if Qry.FieldValues['field_contact']<>NULL then Guide.Text:=Qry.FieldValues['field_contact'];
          if Qry.FieldValues['field_contact_cellular_no']<>NULL then GuideCellular.Text:=Qry.FieldValues['field_contact_cellular_no'];

          if (Qry.FieldValues['field_contact_cellular_no']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['field_contact_cellular_no']))<>'') then CellularWA.text:=Qry.FieldValues['field_contact_cellular_no']
          else begin
            if (Qry.FieldValues['contact_hp']<>NULL) AND (Trim(VarToStr(Qry.FieldValues['contact_hp']))<>'') then CellularWA.text:=Qry.FieldValues['contact_hp']
            else CellularWA.text:='';
          end;

          StrGroup:=Qry.FieldValues['vehicle_vhc_batch_id'];
          StrNoBody:=Qry.FieldValues['body_id'];
          StrDriver:=Qry.FieldValues['employee_id'];


          StrKenek:=Qry.FieldValues['busboy_name'];
          Route.Text:=Qry.FieldValues['route'];
          PickupPoint.Text:=Qry.FieldValues['pickup_point'];
          if Qry.FieldValues['remark']<>NULL then begin
            Remark.Text:=Qry.FieldValues['remark'];
            Catatan.Text:=Qry.FieldValues['remark'];
          end;
          if Qry.FieldValues['service_resume']<>NULL then begin
            Remark.Text:=Remark.Text+sLineBreak+Qry.FieldValues['service_resume'];
            Catatan.Text:=Catatan.Text+sLineBreak+Qry.FieldValues['service_resume'];
          end;
          if Qry.FieldValues['daily_package']<>NULL then Package.Checked:=True;
          if Qry.FieldValues['short_name']='SV' then OutService.Checked:=True;
          Kenek.ItemIndex:=Kenek.Items.IndexOf(StrKenek);
        end;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
      Close;
    end;

  end;

end;

procedure TFSJPenjadwalanList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TFSJPenjadwalanList.Tanggal2Change(Sender: TObject);
begin
  if Tanggal.Date > Tanggal2.Date then
  begin
    Tanggal.Date:=Tanggal2.Date;
  end;
  RefreshData;
  RefreshGrid;
end;

procedure TFSJPenjadwalanList.TanggalChange(Sender: TObject);
begin
  if Tanggal2.Date < Tanggal.Date then
  begin
    Tanggal2.Date:=Tanggal.Date;
  end;
  RefreshData;
  RefreshGrid;
end;

end.
