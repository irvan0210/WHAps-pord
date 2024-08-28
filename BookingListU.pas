unit BookingListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit, ExtCtrls,
  ComCtrls;

type
  TBookingList = class(TForm)
    Label2: TLabel;
    ToXCel: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    PanelLegend: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    All: TCheckBox;
    AllData: TCheckBox;
    Total: TMemo;
    Label7: TLabel;
    CariOffering: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Label14: TLabel;
    lbl1: TLabel;
    Tanggal2: TDateTimePicker;
    procedure ToXCelClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure AllDataClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure CariOfferingClick(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest,CustId:String;
    ResvArr,CompanyArr:Array of TArrString17;
    IntRow,IntCol,IsAll,MinRowGrid,Range:Integer;
    OrderBy:String;
    Initiation:Boolean;
    procedure Init;
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
  BookingList: TBookingList;

implementation

uses MainU, ADODB, BusInvoiceU, BookingFormU, SPJFormBusU, StrUtils,
  AuthorizedFormU, VarUtils;

{$R *.dfm}

constructor TBookingList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CustId:='';
  CompId:=1;
  Initiation:=True;
  inherited Create(AOwner);
end;

constructor TBookingList.Create(AOwner:TComponent;Company_Id:String;Form_Request:String='';Customer_Id:String='';Is_All:Integer=0;Order_By:String='';Range_M:Integer=0);
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
  Main.WriteLog('Form Open: BookingList='+Company_Id+','+Customer_Id+','+Form_Request+','+IntToStr(Is_All)+','+Order_By+','+IntToStr(Range_M),1);
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TBookingList.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  Tanggal.Date:=Now();
//  Tanggal2.Date:=Now();
  Tanggal.Enabled:=False;
//  Tanggal2.Enabled:=False;
  if IsAll=8 then begin
    All.Checked:=FAlse;
    Tanggal.Enabled := False;
    All.Enabled := False;
    AllData.Enabled := False;
  end else begin
    All.Checked:=True;
    Tanggal.Enabled := True;
    Tanggal.Enabled := False;
    All.Enabled := True;
    AllData.Enabled := True;
  end;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TBookingList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=1;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=13;
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

procedure TBookingList.RefreshCombo;
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

procedure TBookingList.RefreshData;
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
    if AllData.Checked then IsAll:=6;
    StrQry:='EXEC GetReservedOrderList '+StrCompanyId+StrLocationId+',@Finish='+IntToStr(IsAll)+StrTanggal+',@PaymentDetail=2'+StrOrder+StrRange+';';
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
      ResvArr[IntCount][5]:=LeftStr(Qry.FieldValues['drivers_name'],Length(Qry.FieldValues['drivers_name'])-1);
      ResvArr[IntCount][6]:=Qry.FieldValues['from_to_dates'];
      ResvArr[IntCount][7]:=Qry.FieldValues['from_to_times'];
      ResvArr[IntCount][8]:=Qry.FieldValues['route'];
      ResvArr[IntCount][9]:=Qry.FieldValues['customer_name'];
      if Qry.FieldValues['vhc_trans_id']<>NULL then ResvArr[IntCount][10]:=Qry.FieldValues['vhc_trans_id'];
      if (Qry.FieldValues['status']='0') OR (Qry.FieldValues['detail_status']='0') then
        ResvArr[IntCount][11]:='0'
      else ResvArr[IntCount][11]:='1';
      if Qry.FieldValues['daily_package']<>NULL then ResvArr[IntCount][12]:='1' else ResvArr[IntCount][12]:='0';
      if Qry.FieldValues['total']<>NULL then
      ResvArr[IntCount][13]:=Qry.FieldValues['total'];
      if Qry.FieldValues['total_payment']<>NULL then
        ResvArr[IntCount][14]:=Qry.FieldValues['total_payment'];
      if Qry.FieldValues['cust_contract_id']<>NULL then
      ResvArr[IntCount][15]:=Qry.FieldValues['cust_contract_id'];
      ResvArr[IntCount][16]:=vartoStr(Qry.FieldValues['isFix']);
      ResvArr[IntCount][17]:=vartoStr(Qry.FieldValues['isAuth']);
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBookingList.RefreshGrid;
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

procedure TBookingList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
  Initiation:=False;
end;

procedure TBookingList.RefreshDisplay;
begin
  Init;
  InitGrid;
  if UpperCase(FormRequest)='SJBUS-CREATE' then
  begin
    AllData.Visible:=False;
    Tanggal2.date:=NOW()+30;
    All.Checked:=False;
  end;

  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TBookingList.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBookingList.Search;
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

procedure TBookingList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TBookingList.StrGridDblClick(Sender: TObject);
var
  Qry:TADOQuery;
  IsAuth, isOk:Boolean;
  StrRemark,StrQry,StrEMsg:string;

begin
  if (IntRow>MinRowGrid) and (StrGrid.Cells[0,IntRow]<>'')  then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('BookingForm')=False then BookingForm:=TBookingForm.Create(Self,StrGrid.Cells[0,IntRow],False)
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then begin
        if Main.IsFormOpen('BookingForm')=False then begin
          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True);
          Close;
        end;
      end else
      if UpperCase(FormRequest)='BOOKING-REPRINT' then  begin
        BookingForm.RePrint(StrGrid.Cells[0,IntRow]);
        Close;
      end else
      if UpperCase(FormRequest)='SJBUS-CREATE' then  begin
        if StrGrid.Cells[10,IntRow]='' then begin
          if StrGrid.Cells[12,IntRow]='0' then begin
            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow]);
            Close;
          end else begin
            SPJFormBus.SetBookedDetailId(StrGrid.Cells[1,IntRow],StrToBool(StrGrid.Cells[12,IntRow]),StrGrid.Cells[6,IntRow]);
            Close;
          end;
        end else MessageBox(Handle,PChar('     Surat Jalan sudah dibuat'+Chr(13)+Chr(13)+'Klik `Cetak Ulang` untuk mencetak Ulang'),'Surat Jalan',MB_OK or MB_ICONWARNING or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
      if UpperCase(FormRequest)='MAIN-FORCEADD' then  begin
        IsAuth:=True;
        AuthorizedForm.FormId:='131101';
        AuthorizedForm.StrMessage:='Otorisasi Penambahan Armada';
        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
        if IsAuth then begin
          BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,'Main-ForceAdd');
          Close;
        end else
          MessageBox(Handle,'Tidak dapat melakukan Penambahan','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
      if UpperCase(FormRequest)='MAIN-BOOKINGAUTH' then begin
        IsAuth:=True;
        AuthorizedForm.FormId:='131111';
        AuthorizedForm.StrMessage:='Otorisasi Penjadwalan SJ';
        if (AuthorizedForm.ShowModal<>1) then IsAuth:=False;
        Main.WriteLog('Auth Form:'+AuthorizedForm.FormId+' '+BoolToStr(IsAuth),1);
        if IsAuth then begin
          StrRemark:=InputBox('Otorisasi Penjadwalan [SJ]','Sebab Otorisasi ?','');
          if StrRemark<>'' then begin
              //BookingForm.SetVehicleId(StrGrid.Cells[0,IntRow], StrRemark, IsMoveUnit, VhcBatchId_Old, StrGrid.Cells[13,IntRow]+'-'+StrGrid.Cells[14,IntRow]);
              //Set isAuth=1 untuk table wh_reserved_order dan wh_reserved_order_detail
            if Main.OpenDb Then begin
              Main.TransStart;
              isOk:=True;
              Qry:=TADOQuery.Create(Self);
              Qry.Connection:=Main.MyConnection;
              //ResvArr[IntCount][0]:=Qry.FieldValues['reserved_order_id'];
              //ResvArr[IntCount][1]
              StrQry:='UPDATE wh_reserved_order SET isAuth=1 WHERE reserved_order_id='+QuotedStr(StrGrid.Cells[0,IntRow])+';';
              StrQry:=StrQry+'UPDATE wh_reserved_order_detail SET isAuth=1, isAuthReason='+QuotedStr(StrRemark)+' WHERE reserved_order_detail_id='+QuotedStr(StrGrid.Cells[1,IntRow])+';';
              Main.WriteLog('SQL :'+StrQry,2);
              Qry.SQL.Add(StrQry);
              Qry.CommandTimeout := 3600;
              try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=StrEMsg+E.Message;
                end;
              end;

              if (IsOk) then begin
                Main.TransCommit;
                MessageBox(Handle,PChar('Penjadwalan Berhasil Diotorisasi'+Chr(13)+Chr(13)+'Silahkan lanjut untuk cetak Surat Jalan'),'Otorisasi Penjadwalan [SJ]',MB_OK or MB_ICONINFORMATION or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end else begin
                Main.TransRollback;
                MessageBox(Handle,PChar('Penjadwalan Gagal Diotorisasi'+Chr(13)+Chr(13)+StrEMsg),'Otorisasi Penjadwalan [SJ]',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
              end;
            end;

          end;

          Close;
        end else
          MessageBox(Handle,'Tidak dapat melakukan Otorisasi Penjadwalan [SJ]','Penjadwalan',MB_OK or MB_ICONERROR or MB_SYSTEMMODAL or MB_SETFOREGROUND);
      end else
      begin
        BookingForm:=TBookingForm.Create(nil,StrGrid.Cells[0,IntRow],True,FormRequest);
        Close;
      end;
    end;
  end;
end;

procedure TBookingList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBookingList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TBookingList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TBookingList.AllClick(Sender: TObject);
begin
  if not(Initiation) then begin
    if All.Checked=True then Tanggal.Enabled:=False
    else Tanggal.Enabled:=True;
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBookingList.TanggalChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBookingList.AllDataClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TBookingList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search;
end;

procedure TBookingList.CariOfferingClick(Sender: TObject);
begin
  Search;
end;

end.
