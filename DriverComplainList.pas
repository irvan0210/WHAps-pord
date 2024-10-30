unit DriverComplainList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, Buttons, ADODB, WHUnit, ExtCtrls;

type
  TFDriverComplainList = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    ToXCel: TSpeedButton;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalUnitOperasi: TEdit;
    Tanggal: TDateTimePicker;
    Refresh: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    CheckSelect: TCheckBox;
    Button1: TButton;
    Cari: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   // LokasiArr,GroupArr:Array of TArrString2;
    OrderArr,CompanyArr:Array of TArrString30;
    MaxCol:Integer;
    IntRow,IntCol,IsIntegrate,MinRowGrid:Integer;
    IsInput,Initiation:Boolean;
    StrTitel,FormRequest:String;


    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  FDriverComplainList: TFDriverComplainList;

implementation

uses MainU, ServiceRequestFormU, DriverComplainListDetail, 
  FResponsDriverComplaint;

{$R *.dfm}

constructor TFDriverComplainList.Create(AOwner:TComponent;Form_Request:String='');
begin
  Initiation:=True;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TFDriverComplainList.Init;
var Count,Count2:Integer;
begin
  MaxCol:=6;
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();

//  CekTglSampai.Checked:=False;

  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;

end;

procedure TFDriverComplainList.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=8;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=160;
  StrGrid.ColWidths[3]:=70;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=440;
  StrGrid.ColWidths[6]:=150;
  StrGrid.ColWidths[7]:=100;
  //StrGrid.ColWidths[8]:=160;
 // StrGrid.ColWidths[9]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Keluhan Driver';
  StrGrid.Cells[2,0]:='Pengemudi';
  StrGrid.Cells[3,0]:='No Polisi';
  StrGrid.Cells[4,0]:='Tanggal Pengajuan';
  StrGrid.Cells[5,0]:='Keluhan';
  StrGrid.Cells[6,0]:='Respon';
  StrGrid.Cells[7,0]:='No SR';
  //StrGrid.Cells[8,0]:='Respon';
  //StrGrid.Cells[9,0]:='No SR';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
 // StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
 // StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;


procedure TFDriverComplainList.RefreshData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrTanggal,StrDepositDate1,StrDepositDate2,
    StrBatch,StrSeat,StrCompanyId,StrLocationId,StrToDates,StrChkSewaLuar,StrPaid,StrRequest:String;
    IntCount,IntCount2,IntCount3,IntRows,StartRow,IntTotal,IntTolParkir,IntBiayaLain, IntTotalUnit,No:Integer;
    IntPayment:Array [0..2] of Integer;
    StrPayment:Array [0..2] of String;
    StrList,StrList2:TStringList;
begin
  StrCompanyId:=QuotedStr(CompanyArr[SBU.ItemIndex][1]);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;

  if Cari.Text<>'' then
  begin
    StrRequest:=' AND ((request LIKE ''%'+Cari.Text+'%'') OR (license_plate LIKE ''%'+Cari.Text+'%'') ) ';
  end else
  begin
    StrRequest:='';
  end;
  Main.M_Busy;

  IntTotalUnit:=0;
  if Main.OpenDb then begin
    SetLength(OrderArr,0);

    StrQry:='select a.*,b.license_plate, '+
            ' IIF(a.response IS NULL,'''', a.response) AS respons,'+
            ' IIF(c.service_request_id IS NULL,'''', c.service_request_id) AS service_request_id from wh_driver_complain a '+
            ' left join wh_vehicle b on a.vehicle_id=b.vehicle_id ' +
            ' LEFT JOIN (SELECT * FROM wh_service_request WHERE approve <>2) c ON a.driver_complain_id=c.driver_complain_id '+
            'where '+
            '(a.submit_date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+' and '+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date+1))+' ) '+
            'and a.company_id='+StrCompanyId+' and a.status=1 '+StrRequest+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      No:=No+1;

      SetLength(OrderArr,IntCount+1);
      OrderArr[IntCount][0]:=IntToStr(No);
      OrderArr[IntCount][1]:=Qry.FieldValues['driver_complain_id'];
      OrderArr[IntCount][2]:=Qry.FieldValues['request'];
      if Qry.FieldValues['license_plate']<>NULL then if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        OrderArr[IntCount][3]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        OrderArr[IntCount][3]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      OrderArr[IntCount][4]:= FormatDateTime('dd/MM/YYYY', Qry.FieldValues['submit_date']) ;
      OrderArr[IntCount][6]:=Qry.FieldValues['vehicle_id'];
      if Qry.FieldValues['odo_in']<>NULL then OrderArr[IntCount][7]:= Qry.FieldValues['odo_in'] else OrderArr[IntCount][7]:='0';
      StrQry:='select description from wh_driver_complain_detail where '+
              'driver_complain_id='+QuotedStr(Qry.FieldValues['driver_complain_id'])+' and status=1 and (description IS NOT NULL AND description<>'''');';
      OrderArr[IntCount][8]:=Qry.FieldValues['respons'];
      OrderArr[IntCount][9]:=Qry.FieldValues['service_request_id'];
      Qry2.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      IntCount2:=0;
      if Qry2.RecordCount>0 then while not(Qry2.Eof) do begin
        if IntCount2>0 then begin
          Inc(IntCount);
          SetLength(OrderArr,IntCount+1);
          OrderArr[IntCount][0]:=  IntToStr(No);
          OrderArr[IntCount][1]:=Qry.FieldValues['driver_complain_id'];
          OrderArr[IntCount][2]:=Qry.FieldValues['request'];
          OrderArr[IntCount][3]:=Qry.FieldValues['license_plate'];
          OrderArr[IntCount][4]:=FormatDateTime('dd/MM/YYYY', Qry.FieldValues['submit_date']);
        end;
        OrderArr[IntCount][5]:=Qry2.FieldValues['description'];

        Inc(IntCount2);
        Application.ProcessMessages;
        Qry2.Next;
      end;
      Qry2.Close;
      Inc(IntCount);
      Qry.Next;
    end;
//    edtTotalUnitOperasi.Text := IToCurr(IntTotalUnit);

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TFDriverComplainList.RefreshCombo;
var Qry:TADOQuery;
    StrQry,StrCompanyId:String;
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

  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];


  FreeAndNil(Qry);
  Main.CloseDb;


  Main.M_Normal;
end;


procedure TFDriverComplainList.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  if Length(OrderArr)>0 then
  begin
    StrGrid.RowCount:=Length(OrderArr)+1;
  end
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;

  IntStartRow:=0;
  StrOrderId:='';
  IntTotal:=0;
  for IntCount:=0 to Length(OrderArr)-1 do begin
    Application.ProcessMessages;
    if (StrOrderId<>OrderArr[IntCount][1])  then begin
      StrOrderId:=OrderArr[IntCount][1];
      IntStartRow:=IntCount;
      IntStartRow2:=IntCount;
      StrGrid.Cells[0,IntCount+1]:=OrderArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=OrderArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=OrderArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=OrderArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=OrderArr[IntCount][4];
      StrGrid.Cells[6,IntCount+1]:=OrderArr[IntCount][8];
      StrGrid.Cells[7,IntCount+1]:=OrderArr[IntCount][9];
      //StrGrid.Cells[9,IntCount+1]:=OrderArr[IntCount][9];
      IsDrawRect:=False;
    end else if (IntCount<Length(OrderArr)-1) then begin
      if (StrOrderId<>OrderArr[IntCount+1][1]) then IsDrawRect:=True;
    end else IsDrawRect:=True;

    if IsDrawRect=True then begin
      StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,IntCount+1);
      StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,IntCount+1);
      StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,IntCount+1);
      StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,IntCount+1);
      StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,IntCount+1);
      StrGrid.MergeCells.AddRectXY(6,IntStartRow+1,6,IntCount+1);
      StrGrid.MergeCells.AddRectXY(7,IntStartRow+1,7,IntCount+1);
    end;
    StrGrid.Cells[5,IntCount+1]:=OrderArr[IntCount][5];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;

  end;
end;

procedure TFDriverComplainList.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFDriverComplainList.FormShow(Sender: TObject);
begin
  if FormRequest='Laporan Keluhan Driver' then
  begin
    Caption:='Laporan Keluhan Driver' ;
  end else if FormRequest='Service Request' then
  begin
    Caption:='Data Keluhan Driver' ;
  end;

  Init;
  InitGrid;
  RefreshCombo;
  Initiation:=False;
  RefreshData;
  RefreshGrid;
end;

procedure TFDriverComplainList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFDriverComplainList.RefreshClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TFDriverComplainList.StrGridDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrDriveComplainID,StrRequest,StrVehicle_ID,StrLicensePlate,StrKmOdo,StrResponse,StrNoSR :String;
begin
  //Service Request
  StrResponse:= StrGrid.Cells[6,IntRow];
  StrNoSR := StrGrid.Cells[7,IntRow];
  StrDriveComplainID:=StrGrid.Cells[1,IntRow];
  StrRequest:=StrGrid.Cells[2,IntRow];
  StrVehicle_ID:=StrGrid.Cells[6,IntRow];
  StrLicensePlate:=StrGrid.Cells[3,IntRow];
  StrKmOdo:=StrGrid.Cells[7,IntRow];
  if (Main.IsFormOpen('ServiceRequestForm')=True) AND (FormRequest='Service Request') then
  begin
  //  MessageBox(0,PChar(StrResponse),'Respon 1',MB_OK or MB_ICONERROR);
   // MessageBox(0,PChar(StrNoSR),'Respon 2',MB_OK or MB_ICONERROR);
   if (StrResponse='') and (StrNoSR='') then
    begin
      MessageBox(0,PChar('Keluhan Belum Direspon..!'),'Keluhan Driver',MB_OK or MB_ICONERROR);
      if Main.IsFormOpen('ResponsDriverComplaint')=False then begin
        ResponsDriverComplaint :=TResponsDriverComplaint.Create(Self,StrGrid.Cells[1,IntRow]);
        StrDriveComplainID:=StrGrid.Cells[1,IntRow];
        ResponsDriverComplaint.NoKeluhan.Text :=StrGrid.Cells[1,IntRow];
        ResponsDriverComplaint.Driver.Text := StrGrid.Cells[2,IntRow];
        ResponsDriverComplaint.NoPolisi.Text :=StrGrid.Cells[3,IntRow];
        ResponsDriverComplaint.tgl_request.Text := StrGrid.Cells[4,IntRow];
        //MessageBox(0,PChar(StrDriveComplainID),'User Group Tree Menu',MB_OK or MB_ICONERROR);
        ResponsDriverComplaint.SetDriverComplainId(StrDriveComplainID);
      end;
    end
    else if (StrNoSR <> '') then
      begin
        MessageBox(0,PChar('Keluhan Sudah Direquest!'),'Keluhan Driver',MB_OK or MB_ICONERROR);
      end
    else if (StrNoSR = '') and (StrResponse<>'') then
    begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.CommandTimeout := 3600;
      Main.M_Busy;
      if Main.OpenDb then begin
        SetLength(CompanyArr,0);
        StrQry:='SELECT * FROM wh_driver_complain_detail where driver_complain_id='+QuotedStr(StrGrid.Cells[1,IntRow])+'and status=1 and (description IS NOT NULL AND description<>'''');';
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
      end;
      if Qry.RecordCount=1 then begin
         ServiceRequestForm.SetDriverComplainId(StrDriveComplainID);
         Close;
      end else if Qry.RecordCount>1 then begin
        with FDriverComplainListDetail do
        begin
          DriverComplainID:=StrDriveComplainID;
          RequestName:=StrRequest;
          LicensePlate:=StrLicensePlate;
          StrOdoIn:=StrKmOdo;
          StrVehicleID2 :=StrVehicle_ID;
        end;
        if Main.IsFormOpen('FDriverComplainListDetail')=False then FDriverComplainListDetail:=TFDriverComplainListDetail.Create(Self);
      end;
      Qry.Destroy;
      Main.CloseDb;
      Main.M_Normal;
    end;
  end else if (FormRequest='Laporan Keluhan Driver') and (StrResponse='') and (StrNoSR='') then
  begin
    if Main.IsFormOpen('ResponsDriverComplaint')=False then
    begin
      ResponsDriverComplaint :=TResponsDriverComplaint.Create(Self,StrGrid.Cells[1,IntRow]);
      StrDriveComplainID:=StrGrid.Cells[1,IntRow];
      ResponsDriverComplaint.NoKeluhan.Text :=StrGrid.Cells[1,IntRow];
      ResponsDriverComplaint.Driver.Text := StrGrid.Cells[2,IntRow];
      ResponsDriverComplaint.NoPolisi.Text :=StrGrid.Cells[3,IntRow];
      ResponsDriverComplaint.tgl_request.Text := StrGrid.Cells[4,IntRow];
      //MessageBox(0,PChar(StrDriveComplainID),'User Group Tree Menu',MB_OK or MB_ICONERROR);
      ResponsDriverComplaint.SetDriverComplainId(StrDriveComplainID);
    end;
  end;
end;

procedure TFDriverComplainList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TFDriverComplainList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then
  TglSampai.Date:=Tanggal.Date
end;

procedure TFDriverComplainList.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then
  Tanggal.Date:=TglSampai.Date;
end;

procedure TFDriverComplainList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TFDriverComplainList.CariChange(Sender: TObject);
  var Count,Count2,Count3,Count4,IntStartRow,IntStartRow2:Integer;
      IsTrue,IsDrawRect,IsDrawRect2:Boolean;
//      StrOrderId: string;
begin
{  if Trim(Cari.Text)<>'' then begin

    Count2:=2;
    for Count:=0 to Length(OrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 2 do
        if (StrPos(PChar(UpperCase(OrderArr[Count][Count2])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
        if IsTrue then begin

              StrGrid.RowCount:=Count2+1;

              if (StrOrderId<>OrderArr[Count][1])  then begin
                StrOrderId:=OrderArr[Count][1];
                IntStartRow:=Count;
                IntStartRow2:=Count;

                StrGrid.Cells[0,Count2-1]:=OrderArr[Count][0];
                StrGrid.Cells[1,Count2-1]:=OrderArr[Count][1];
                StrGrid.Cells[2,Count2-1]:=OrderArr[Count][2];
                StrGrid.Cells[3,Count2-1]:=OrderArr[Count][3];
                StrGrid.Cells[4,Count2-1]:=OrderArr[Count][4];
                IsDrawRect:=False;
                IsDrawRect2:=False;
                StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[1,Count2-1].HorizontalAlignment:=taCenter;
                StrGrid.CellStyle[2,Count2-1].HorizontalAlignment:=taLeftJustify;
                StrGrid.CellStyle[3,Count2-1].HorizontalAlignment:=taLeftJustify;
                StrGrid.CellStyle[4,Count2-1].HorizontalAlignment:=taCenter;
              end else if (Count<Length(OrderArr)-1) then begin
                if (StrOrderId<>OrderArr[Count2-1][1]) then IsDrawRect:=True;
              end else IsDrawRect:=True;
              if IsDrawRect=True then begin
                StrGrid.MergeCells.AddRectXY(0,IntStartRow+1,0,Count2-1);
                StrGrid.MergeCells.AddRectXY(1,IntStartRow+1,1,Count2-1);
                StrGrid.MergeCells.AddRectXY(2,IntStartRow+1,2,Count2-1);
                StrGrid.MergeCells.AddRectXY(3,IntStartRow+1,3,Count2-1);
                StrGrid.MergeCells.AddRectXY(4,IntStartRow+1,4,Count2-1);
              end;
              StrGrid.Cells[5,Count2-1]:=OrderArr[Count][5];
              StrGrid.Cells[6,Count2-1]:=OrderArr[Count][6];
              StrGrid.Cells[7,Count2-1]:=OrderArr[Count][7];

              StrGrid.CellStyle[5,Count2-1].HorizontalAlignment:=taLeftJustify;
              StrGrid.CellStyle[6,Count2-1].HorizontalAlignment:=taLeftJustify;
              StrGrid.CellStyle[7,Count2-1].HorizontalAlignment:=taLeftJustify;


//            end;
            Inc(Count2);
        end;
    end;
  end;   }
end;

procedure TFDriverComplainList.CariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then RefreshClick(Sender);
end;

end.
