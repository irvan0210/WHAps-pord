unit MasterBatanganListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, ZColorStringGrid;

type
  TMasterBatanganList = class(TForm)
    Label1: TLabel;
    Cari: TEdit;
    Selesai: TButton;
    ToXCel: TSpeedButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label11: TLabel;
    Label3: TLabel;
    Batch: TComboBox;
    Label5: TLabel;
    Seat: TComboBox;
    LihatData: TButton;
    SBUtemp: TComboBox;
    SBU: TComboBox;
    grpGroupTotal: TGroupBox;
    lbl1: TLabel;
    TotalUnit: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure BatchChange(Sender: TObject);
    procedure LihatDataClick(Sender: TObject);
  private
    { Private declarations }
    SelectedRow:Integer;
    SchArr:Array of TArrString10;
    LokasiArr:Array of TArrString2;
    IntRow:Integer;
    is_Helper,is_ReadOnly:Boolean;
    CompanyLocationArr,CompanyArr,CompanyArrTemp:Array of TArrString8;
    BatchArr,SeatArr:Array of TArrString2;

    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    EmplType:Integer;
    Employee_Type:String;
    constructor Create(AOwner:TComponent;EmployeeType:String;isHelper:Boolean=False;isReadOnly:Boolean=True);Overload;
    procedure RefreshSeat;
    procedure RefreshList;
    procedure RefreshData;
  end;

var
  MasterBatanganList: TMasterBatanganList;

implementation

uses MainU, MasterBatanganFormU;//, ScheduleFormU;

{$R *.dfm}

constructor TMasterBatanganList.Create(AOwner:TComponent;EmployeeType:String;isHelper:Boolean=False;isReadOnly:Boolean=True);
begin
  //is_Helper:=isHelper;
  is_ReadOnly:=isReadOnly;
 { Employee_Type:=EmployeeType;
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
  end else begin
    EmplType:=3;
  end;  }
  Inherited Create(AOwner);
end;

procedure TMasterBatanganList.Init;
var IntCount:Integer;
begin
  StrGrid.ColCount:=10;
  SelectedRow:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColWidths[0]:=200;
  StrGrid.ColWidths[1]:=80;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[3]:=180;
  StrGrid.ColWidths[4]:=70;
  StrGrid.ColWidths[5]:=70;
  StrGrid.ColWidths[6]:=200;
  StrGrid.ColWidths[6]:=180;
  StrGrid.ColWidths[7]:=70;
  StrGrid.ColWidths[8]:=70;
  StrGrid.ColWidths[9]:=0;

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,5,0);
  //StrGrid.MergeCells.AddRectXY(3,0,5,0);
  StrGrid.MergeCells.AddRectXY(6,0,8,0);
 // StrGrid.MergeCells.AddRectXY(6,0,8,0);
  //StrGrid.MergeCells.AddRectXY(7,0,7,1);

  StrGrid.Cells[0,0]:='Jenis Armada';
  StrGrid.Cells[1,0]:='No Bodi';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Driver Batangan';
  StrGrid.Cells[3,1]:='Nama';
  StrGrid.Cells[4,1]:='Dari Tgl';
  StrGrid.Cells[5,1]:='s/d Tgl';
  StrGrid.Cells[6,0]:='Helper Batangan';
  StrGrid.Cells[6,1]:='Nama';
  StrGrid.Cells[7,1]:='Dari Tgl';
  StrGrid.Cells[8,1]:='s/d Tgl';
  StrGrid.Cells[9,1]:='Vhc_id';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

{procedure TMasterBatanganList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
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
    Main.CloseDb;
  end;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
    Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
    LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
end; }

procedure TMasterBatanganList.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
    isFound:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
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
      Inc(IntCount);
    end;
    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
    end;
    if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;

    {Init data from User RD Location}
    StrQry:='EXEC GetUserRDLocationList @UserName='+QuotedStr(User)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    isFound := False;
    if Qry.RecordCount>0 then begin
      SetLength(CompanyArrTemp,0);
      SetLength(CompanyArrTemp,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        CompanyArrTemp[IntCount][0]:=Qry.FieldValues['company_location_id'];
        CompanyArrTemp[IntCount][1]:=Qry.FieldValues['company_id'];
        CompanyArrTemp[IntCount][2]:=Qry.FieldValues['location_id'];
        CompanyArrTemp[IntCount][3]:=Qry.FieldValues['name'];
        CompanyArrTemp[IntCount][4]:=Qry.FieldValues['location'];
        CompanyArrTemp[IntCount][5]:=Qry.FieldValues['company_code'];
        Inc(IntCount);
        Qry.Next;
      end;
      SBUtemp.Items.Clear;
      for IntCount:=0 to Length(CompanyArrTemp)-1  do begin
        SBUtemp.Items.Add(CompanyArrTemp[IntCount][3]+' ('+CompanyArrTemp[IntCount][4]+')');
        if (CompanyId=CompanyArrTemp[IntCount][1]) and  (LocationId=CompanyArrTemp[IntCount][2]) then begin
          SBUtemp.ItemIndex:=IntCount;
          isFound:= True;
        end;
      end;
      if isFound then begin
        GroupCompany.Enabled:=True;
        SBU.Items.Clear;
        SBU.Items := SBUtemp.Items;
        SetLength(CompanyArr,0);
        CompanyArr := CompanyArrTemp;
        SBU.ItemIndex := SBUtemp.ItemIndex;
      end;
    end;


//    StrQry:='SELECT * FROM wh_vhc_batch WHERE (active=1) AND company_id=2';
    StrQry:='EXEC GetGroup '+CompanyArr[SBU.ItemIndex][1]+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(BatchArr,Qry.RecordCount+1);
    BatchArr[0][0]:='All';
    BatchArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BatchArr[IntCount][0]:=Qry.FieldValues['vhc_batch_id'];
      BatchArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(BatchArr)-1 do Batch.Items.Add(BatchArr[IntCount][1]);
  Batch.ItemIndex:=Batch.Items.IndexOf('All');
  //if StrToInt(CompanyId)>1 then GroupCompany.Enabled:=False;
 // for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
 // Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
 // Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TMasterBatanganList.RefreshSeat;
var QStr,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Seat.Text:='';
  Seat.Items.Clear;
  Seat.ItemIndex:=1;
  SetLength(SeatArr,1);
  SeatArr[0][0]:='All';
  StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
  if (Main.OpenDb) and (Batch.Text<>'All') then begin
    QStr:='EXEC GetVehicleTypeDetail '+StrCompanyId+','+BatchArr[Batch.ItemIndex][0]+',@FieldSelect='+QuotedStr('seat')+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(SeatArr,Qry.RecordCount+1);
    IntCount:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SeatArr[IntCount][0]:=Qry.FieldValues['seat'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(SeatArr)-1 do Seat.Items.Add(SeatArr[IntCount][0]);
  Seat.ItemIndex:=Seat.Items.IndexOf('All');
  Main.M_Normal;
end;


procedure TMasterBatanganList.RefreshList;
var Count,Count2:Integer;
    StrLocation,StrCompany,QStr,Nama,StrHelper:String;
    Qry:TADOQuery;

begin
  For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+1]:=''
    end;
  end;
  SetLength(SchArr,0);
 // if Trim(Lokasi.Text)<>'All' then
  //  StrLocation:=','+Lokasi.Text
 // else
 //   StrLocation:='';
//  if EmplType=1 then StrCompany:='3'
//  else if EmplType=2 then StrCompany:='2'
//  else StrCompany:='1';
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if is_Helper then StrHelper:=',@isHelper=1'
    else StrHelper:='';
    QStr:='EXEC GetScheduleList '+CompanyId+','+LocationId+StrHelper+';';
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(SchArr,Count+1);
      SchArr[Count][0]:=Qry.FieldValues['working_schedule_id'];
      SchArr[Count][1]:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      SchArr[Count][3]:=Qry.FieldValues['name'];
      SchArr[Count][4]:=Qry.FieldValues['from_date'];
      SchArr[Count][5]:=Qry.FieldValues['to_date'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  if Length(SchArr)>0 then StrGrid.RowCount:=Length(SchArr)+1 else StrGrid.RowCount:=2;
  Nama:='';
  For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+2]:=SchArr[Count][Count2]
    end;
  end;
end;

procedure TMasterBatanganList.SelesaiClick(Sender: TObject);
begin
  MasterBatanganList.Close;
end;

procedure TMasterBatanganList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMasterBatanganList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'')  then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(SchArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
      if (StrPos(PChar(UpperCase(SchArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 9 do
          StrGrid.Cells[Count4,Count2]:=SchArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
  end;

end;

procedure TMasterBatanganList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TMasterBatanganList.StrGridDblClick(Sender: TObject);
begin
   MasterBatanganForm:=TMasterBatanganForm.Create(Self,Employee_Type,StrGrid.Cells[9,IntRow],is_Helper,is_readonly);
end;

procedure TMasterBatanganList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TMasterBatanganList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshSeat;
 // RefreshList;
end;

procedure TMasterBatanganList.LokasiChange(Sender: TObject);
begin
 // LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
 // RefreshList;
end;

procedure TMasterBatanganList.BatchChange(Sender: TObject);
begin
  RefreshSeat;
end;

procedure TMasterBatanganList.LihatDataClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TMasterBatanganList.RefreshData;
var Count,Count2, IntCount, IntCount2, IntTotalUnit:Integer;
    StrLocation,StrCompany,QStr,Nama,StrHelper, StrBatchName,
    StrCompanyId,StrLocationId,StrBatchId,StrSeat:String;
    Qry:TADOQuery;
    IntCategory :Array[1..31] of Integer;

begin
 { For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+1]:=''
    end;
  end;}
  IntTotalUnit:=0;
  IntCount:=1;
  SetLength(SchArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
 if Main.OpenDb then begin
    StrCompanyId:=', @CompanyId='+CompanyArr[SBU.ItemIndex][1];
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    if Batch.Text<>'All' then begin
      StrBatchId:=',@BatchId='+BatchArr[Batch.ItemIndex][0];
    end else StrBatchId:='';
    if Seat.Text<>'All' then begin
      StrSeat:=',@Seat='+Seat.Text;
    end else StrSeat:='';

   QStr := 'EXEC dbo.GetBarVehicleList '+StrLocationId+StrCompanyId+StrBatchId+StrSeat;
   Qry.SQL.Add(QStr);
   Qry.Open;
   Count := 0;
   if Qry.RecordCount > 0 then while not(Qry.Eof) do begin
     SetLength(SchArr,Count+1);
     StrBatchName:=Qry.FieldValues['jenis_armada']+' '+IntToStr(Qry.FieldValues['seat']);
     SchArr[Count][0]:=StrBatchName;
     SchArr[Count][1]:=Qry.FieldValues['body_id'];
     if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
        ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        SchArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
        ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['driver_name']<> null then
        SchArr[Count][3]:=Qry.FieldValues['driver_name']
      else SchArr[Count][3]:='';
      if Qry.FieldValues['from_date_driver']<> null then
        SchArr[Count][4]:=Qry.FieldValues['from_date_driver']
      else SchArr[Count][4]:='';

      if Qry.FieldValues['to_date_driver']<> null then
        SchArr[Count][5]:=Qry.FieldValues['to_date_driver']
      else SchArr[Count][5]:='';

      if Qry.FieldValues['busboy_name']<> null then
        SchArr[Count][6]:=Qry.FieldValues['busboy_name']
      else SchArr[Count][6]:='';

      if Qry.FieldValues['from_date_busboy']<> null  then
        SchArr[Count][7]:=Qry.FieldValues['from_date_busboy']
      else SchArr[Count][7]:= '';

      if Qry.FieldValues['to_date_busboy'] <> null then
        SchArr[Count][8]:=Qry.FieldValues['to_date_busboy']
      else
      SchArr[Count][8]:='';

      if Qry.FieldValues['vehicle_id'] <> null then
        SchArr[Count][9]:=Qry.FieldValues['vehicle_id']
      else
      SchArr[Count][9]:='';
      StrBatchName:='';
      Qry.Next;
      Inc(Count);
   end;
   //edtTotalUnitOperasi.Text := IToCurr(IntTotalUnit);
    Qry.Close;
    Main.CloseDb;
 end;

  if Length(SchArr)>0 then StrGrid.RowCount:=Length(SchArr)+1
  else StrGrid.RowCount:=2;
  Nama:='';

  For Count:=0 to Length(SchArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do begin
        StrGrid.Cells[Count2,Count+2]:=SchArr[Count][Count2];
    end;
  end;

  TotalUnit.Text :=IntToStr(Length(SchArr)-1);
 

  { For Count:=0 to Length(SchArr)-1 do begin
    if StrBatchName<>SchArr[Count][0] then begin
      if StrBatchName<>'' then begin
        StrGrid.RowCount:=StrGrid.RowCount+1;
        for Count2:= 0 to Length(SchArr)-1 do begin
          StrGrid.Cells[Count2,Count]:='';//SchArr[Count][Count2];
          StrGrid.CellStyle[Count2,Count].BGColor:=clSilver;
        end;
        StrGrid.CellStyle[0,Count].BGColor:=clSilver;
       // for Count2:=1 to 10 do StrGrid.Cells[0,Count+2]:=IntToStr(IntCategory[Count2]);

        (*Tambah*)
        //Inc(Count);
        StrGrid.RowCount:=StrGrid.RowCount+1;
        SetLength(SchArr,Length(SchArr)+1);

        (*end tambah*)
        //for Count2:=1 to 31 do IntCategory[Count2]:=0;
        //SetLength(SchArr,Length(SchArr)+1);
        //Inc(IntCount);
      end;

      StrBatchName:=SchArr[Count][0];
      //Cek
        for Count2:=0 to StrGrid.RowCount-1 do begin
          StrGrid.Cells[Count2,Count+2]:='';
          StrGrid.CellStyle[Count2,Count+2].BGColor:=clWindow;
          //Application.ProcessMessages;
        end;
        //StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.CellStyle[0,Count+2].BGColor:=clSkyBlue;
        StrGrid.CellStyle[0,Count+2].Font.Color:=clWindowText;
        StrGrid.CellStyle[0,Count+2].Font.Style:=[fsBold];
        StrGrid.CellStyle[0,Count+2].HorizontalAlignment:=taLeftJustify;
        StrGrid.CellStyle[1,Count+2].BGColor:=clSkyBlue;
        StrGrid.MergeCells.AddRectXY(3,Count+2,10,Count+2);
        StrGrid.MergeCells.AddRectXY(0,Count+2,2,Count+2);
        StrGrid.Cells[0,Count+2]:=StrBatchName;
        //Inc(Count);
        //SetLength(SchArr,Length(SchArr)+1);

     end; 
   end;  }


end;

end.
