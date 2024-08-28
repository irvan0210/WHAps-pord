unit EmplAttedanceMiniU;

interface

uses 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, WHUnit, ADODB, DateUtils, StrUtils,
  ZColorStringGrid, ComCtrls;

type
  TEmplAttedanceMini = class(TForm)
    Label1: TLabel;
    ToXCel: TSpeedButton;
    Label4: TLabel;
    Selesai: TButton;
    Bulan: TComboBox;
    Tahun: TEdit;
    LihatData: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label3: TLabel;
    SBU: TComboBox;
    Label2: TLabel;
    EmplTypeCb: TComboBox;
    ProgressBar: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure TahunKeyPress(Sender: TObject; var Key: Char);
    procedure LihatDataClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr,EmplTypeArr,EmplArr:Array of TArrString7;
    DailyArr:array of TArrString31;
    Days,IntColumnWidth,IntRow,IntCol,EmplType,IntCompanyId:Integer;
    MinRowGrid,MinColGrid:Integer;
    FormRequest:String;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshGrid;
    procedure RefreshData;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  EmplAttedanceMini: TEmplAttedanceMini;

implementation

{$R *.dfm}

Uses MainU, VehicleFormU, AttandanceLeaveFormU, SelectBookingU;


constructor TEmplAttedanceMini.Create(AOwner:TComponent;Form_Request:String='');
begin
  IntCompanyId:=2;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;


procedure TEmplAttedanceMini.Init;
var IntCount:Integer;
begin
//  Case EmplType of
//    1:Caption:='Laporan Running Days(Mitra)';
//    2:Caption:='Laporan Running Days(Driver)';
//    3:Caption:='';
//  end;

  MinRowGrid:=0;
  MinColGrid:=3;

  IntRow:=0;
  IntCol:=0;
  IntColumnWidth:=22;
  Tahun.Text:='';
  Bulan.Text:='';
  Bulan.Items.Clear;
  Bulan.ItemIndex:=0;
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=32;
  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=140;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='ID Karyawan';
  StrGrid.Cells[2,0]:='Nama';
end;

procedure TEmplAttedanceMini.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.MyConnection.Open;
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

    SetLength(EmplTypeArr,0);
    StrQry:='select * from wh_employment_type where status=1;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(EmplTypeArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      EmplTypeArr[IntCount][0]:=Qry.FieldValues['employment_type_id'];
      EmplTypeArr[IntCount][1]:=Qry.FieldValues['name'];
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

  EmplTypeCb.Clear;
  EmplTypeCb.Items.Add('- Semua -');
  for IntCount:=0 to Length(EmplTypeArr)-1  do begin
    EmplTypeCb.Items.Add(EmplTypeArr[IntCount][1]);
  end;
  EmplTypeCb.ItemIndex:=0;

  for IntCount:=1 to 12 do Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(ShortMonthNames[StrToInt(FormatDateTime('mm',Now))]);
  Tahun.Text:=FormatDateTime('YYYY',Now);
  Main.M_Normal;
end;

procedure TEmplAttedanceMini.RefreshGrid;
var IntCount,IntCountA, Count:Integer;
    AkhirBulan,AwalBulan :String;
begin
  Main.M_Busy;
  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  StrGrid.ColCount:=Days+3;

  for Count:=1 to Days do begin
    StrGrid.ColWidths[Count+2]:=IntColumnWidth;
    StrGrid.Cells[Count+2, 0]:=IntToStr(Count);
    if DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))=1 then
      StrGrid.CellStyle[Count+2, 0].BGColor:=clRed
    else if DayOfWeek(VarToDateTime(IntToStr(Count)+'/'+Bulan.Text+'/'+Tahun.Text))=7 then
      StrGrid.CellStyle[Count+2, 0].BGColor:=clGreen
    else
      StrGrid.CellStyle[Count+2, 0].BGColor:=clBtnFace;
    Application.ProcessMessages;
  end;

  for IntCount:=3 to StrGrid.ColCount do begin
    for IntCountA:=0 to StrGrid.RowCount-1 do begin
      StrGrid.Cells[IntCount,IntCountA]:='';
      StrGrid.CellStyle[IntCount,IntCountA].Font.Color := clWindowText;
    end;
  end;

//
  for IntCount:=0 to 1 do begin
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;
  for IntCount:=1 to 31 do begin
    StrGrid.Cells[IntCount+2,0]:=IntToStr(IntCount);
    StrGrid.CellStyle[IntCount+2,0].HorizontalAlignment:=taCenter;
    Application.ProcessMessages;
  end;

  for IntCount:=0 to 34 do
    StrGrid.Cells[IntCount,1]:='';

  Main.M_Normal;
end;

procedure TEmplAttedanceMini.RefreshData;
var QStr,QAddParam,AkhirBulan,AwalBulan,StrLocationId,StrCompanyId,StrEmplType:String;
    StrJenisKaryawan : string;
    Qry,Qry2:TADOQuery;
    Count,Count2,Count3,Count4,IntTotal,IntCountEmpl:Integer;
    IntCount,IntCount2,IntCount3, IntCount4 : Integer;
    IntJenis,IntStatusMasuk, IntStatusSakit, IntStatusIjin, IntStatusCuti : array [1..31] of integer;
    IntMasuk,IntSakit, IntIjin, IntCuti : Integer;
    StrList:TStringList;
begin
  Main.M_Busy;

  AwalBulan:='1/'+Bulan.Text+'/'+Tahun.Text;
  Days:=DaysInMonth(VarToDateTime(AwalBulan));
  AkhirBulan:=IntToStr(Days)+'/'+Bulan.Text+'/'+Tahun.Text;
  StrGrid.ColCount:=Days+3+4; {nilai 2 untuk menampilkan total hadir}

  SetLength(DailyArr,0);

  StrGrid.Cells[Days+3,0]:='Total Masuk';
  StrGrid.Cells[Days+4,0]:='Total Sakit';
  StrGrid.Cells[Days+5,0]:='Total Ijin';
  StrGrid.Cells[Days+6,0]:='Total Cuti';

  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 7200;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 7200;

  StrLocationId:=CompanyArr[SBU.ItemIndex][2];

  case EmplTypeCb.ItemIndex of
  0 : begin
        for Count:=0 to Length(EmplTypeArr)-1  do begin
          if (Count=0) then StrEmplType := EmplTypeArr[Count][0]
          else StrEmplType := StrEmplType+','+EmplTypeArr[Count][0];
          Application.ProcessMessages;
        end;

      end;
  else StrEmplType := EmplTypeArr[EmplTypeCb.ItemIndex-1][0];
  end;

  if Main.OpenDb then begin
    StrGrid.TopRow := 1;
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
    Qry.SQL.Clear;
    QStr := 'EXEC GetEmployeeAttedanceList @EmploymentTypeId='+QuotedStr(StrEmplType)+
            ',@LocationId='+StrLocationId+
            ',@FromDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime(AwalBulan)))+
            ',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',VarToDateTime(AkhirBulan)));
    Qry.SQL.Add(QStr);
    Qry.Open;

    Count:=0;
    SetLength(EmplArr, Qry.RecordCount);

    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=2;

    if (Qry.RecordCount>0) then begin
      while not(Qry.Eof) do begin

          EmplArr[Count][0]:=VartoStr(Qry.FieldValues['employee_id']);
          EmplArr[Count][1]:=VartoStr(Qry.FieldValues['name']);
          EmplArr[Count][2]:=VartoStr(Qry.FieldValues['TipeKaryawan']);
          EmplArr[Count][3]:=VartoStr(Qry.FieldValues['JenisRD']);
          Qry.Next;
          Inc(Count);
      end;
    end;

    Count:=1;

    IntTotal:=Length(EmplArr);//Qry.RecordCount;
    StrJenisKaryawan:='';

    IntCount:=1;
    IntCount4:=1;
    For IntCountEmpl:=0 to Length(EmplArr)-1 do begin
        IntMasuk := 0;
        IntSakit := 0;
        IntIjin  := 0;
        IntCuti  := 0;

        SetLength(DailyArr,Length(DailyArr)+1);

        for IntCount2:=0 to Days+4 do begin
          StrGrid.Cells[IntCount2,IntCount]:='';
        end;

        if StrJenisKaryawan<>EmplArr[IntCountEmpl][2] then begin
            if StrJenisKaryawan<>'' then begin
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=2 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Masuk';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusMasuk[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

              for IntCount2:=2 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Sakit';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

              for IntCount2:=2 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Ijin';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusIjin[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

              for IntCount2:=2 to Days+3 do begin
                StrGrid.Cells[IntCount2,IntCount]:='';
                StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
              end;
              StrGrid.RowCount:=StrGrid.RowCount+1;
              for IntCount2:=1 to Days do begin
                StrGrid.Cells[2,IntCount]:='Total Cuti';
                StrGrid.Cells[IntCount2+3, IntCount]:=IntToStr(IntStatusCuti[IntCount2]);
              end;
              Inc(IntCount);
              SetLength(DailyArr,Length(DailyArr)+1);

            end;
            {Reset}
            For IntCount3:=1 to 31 do IntStatusMasuk[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusSakit[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusIjin[IntCount3]:=0;
            For IntCount3:=1 to 31 do IntStatusCuti[IntCount3]:=0;

            IntCount4:=1;
            StrJenisKaryawan:=EmplArr[IntCountEmpl][2];

            {Cek}
            for IntCount2:=0 to Days+4 do begin
              StrGrid.Cells[IntCount2,IntCount]:='';
              StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clWindow;
            end;

            StrGrid.RowCount:=StrGrid.RowCount+1;
            StrGrid.CellStyle[1,IntCount].BGColor:=clSkyBlue;
            StrGrid.CellStyle[1,IntCount].Font.Color:=clWindowText;
            StrGrid.CellStyle[1,IntCount].Font.Style:=[fsBold];
            StrGrid.CellStyle[1,IntCount].HorizontalAlignment:=taLeftJustify;
            StrGrid.CellStyle[1,IntCount].BGColor:=clSkyBlue;
            //StrGrid.MergeCells.AddRectXY(3,IntCount, Days+7, IntCount);
            StrGrid.MergeCells.AddRectXY(1,IntCount, Days+6,      IntCount);
            StrGrid.Cells[1,IntCount]:=StrJenisKaryawan;
            Inc(IntCount);
            SetLength(DailyArr,Length(DailyArr)+1);

        end;

        StrGrid.Cells[0, IntCount]:=IntToStr(IntCount4);
        StrGrid.Cells[1, IntCount]:=EmplArr[IntCountEmpl][0];

        StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taLeftJustify;
        StrGrid.Cells[2, IntCount]:=EmplArr[IntCountEmpl][1];

        QStr:='EXEC GetEmployeeRunningDays '+QuotedStr(EmplArr[IntCountEmpl][0])+
                ',@FromDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+
                ',@ToDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AkhirBulan)))+
                ',@isDriver='+VarToStr(EmplArr[IntCountEmpl][3])+
                ',@isAbsen=1'+
                ';';
        Qry2.Close;
        Qry2.SQL.Clear;
        Qry2.SQL.Add(QStr);
        Qry2.Open;

        if Qry2.RecordCount>0 then begin
          while Not(Qry2.Eof) do begin
            for Count4:=StrToInt(VarToStr(Qry2.FieldValues['tgl'])) to StrToInt(VarToStr(Qry2.FieldValues['tgl'])) do begin
//              Count4:=StrToInt(VarToStr(Qry2.FieldValues['tgl']));
              StrGrid.Cells[(2+Count4),IntCount]:=VarToStr(Qry2.FieldValues['body_id']);


              if DailyArr[Length(DailyArr)-1][Count4-2]<>'' then begin
                StrList:=TStringList.Create;
                StrList:=SplitStrings(DailyArr[Length(DailyArr)-1][Count4-2],'  ');
              end;

              if (Qry2.FieldValues['kode']<>NULL) or (Qry2.FieldValues['kode']<>'') then begin
                if DailyArr[Length(DailyArr)-1][Count4-2]='' then
                  DailyArr[Length(DailyArr)-1][Count4-2]:=Qry2.FieldValues['kode']
                else
                  DailyArr[Length(DailyArr)-1][Count4-2]:=DailyArr[Length(DailyArr)-1][Count4-2]+'  '+Qry2.FieldValues['kode'];
              end;

              if Qry2.FieldValues['body_id']='1' then begin
                  StrGrid.CellStyle[(2+Count4), IntCount].Font.Color:=clGreen;
                  Inc(IntStatusMasuk[Count4]);
                  Inc(IntMasuk);
              end else if Qry2.FieldValues['body_id']='S' then begin
                  StrGrid.CellStyle[(2+Count4), IntCount].Font.Color:=clFuchsia;
                  Inc(IntStatusSakit[Count4]);
                  Inc(IntSakit);
              end else if Qry2.FieldValues['body_id']='I' then begin
                  StrGrid.CellStyle[(2+Count4), IntCount].Font.Color:=$000080FF;
                  Inc(IntStatusIjin[Count4]);
                  Inc(IntIjin);
              end else if Qry2.FieldValues['body_id']='C' then begin
                  StrGrid.CellStyle[(2+Count4), IntCount].Font.Color:=clBlue;
                  Inc(IntStatusCuti[Count4]);
                  Inc(IntCuti);
              end else
                StrGrid.CellStyle[(2+Count4), IntCount].Font.Color:=clGreen;
            end;
            Qry2.Next;
          end;

        end;

        StrGrid.Cells[Days+3, IntCount] := IntToStr(IntMasuk);
        StrGrid.Cells[Days+4, IntCount] := IntToStr(IntSakit);
        StrGrid.Cells[Days+5, IntCount] := IntToStr(IntIjin);
        StrGrid.Cells[Days+6, IntCount] := IntToStr(IntCuti);
        ProgressBar.Position:=1+Round((99/Length(EmplArr))*IntCount4);
        Qry2.Close;
        Inc(IntCount);
        Inc(IntCount4);

        If (IntCountEmpl-1) >= 13 then//If Qry.RecNo >= 21 then
        StrGrid.TopRow:= IntCountEmpl-12;//Qry.RecNo-20;

        Application.ProcessMessages;
    end;

    StrGrid.RowCount:=StrGrid.RowCount+4;

    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days do begin
      StrGrid.Cells[2,IntCount]:='Total Masuk';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusMasuk[IntCount2]);
    end;

    Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days do begin
      StrGrid.Cells[2,IntCount]:='Total Sakit';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusSakit[IntCount2]);
    end;

    Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days do begin
      StrGrid.Cells[2,IntCount]:='Total Ijin';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusIjin[IntCount2]);
    end;

    Inc(IntCount);
    for IntCount2:=2 to Days+2 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].BGColor:=clSilver;
    end;
    for IntCount2:=1 to Days do begin
      StrGrid.Cells[2,IntCount]:='Total Cuti';
      StrGrid.Cells[IntCount2+2, IntCount]:=IntToStr(IntStatusCuti[IntCount2]);
    end;

(*
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+2,IntCount]:=IntToStr(IntStatusMasuk[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+3,IntCount]:=IntToStr(IntStatusSakit[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+4,IntCount]:=IntToStr(IntStatusIjin[IntCount2]); {cek nih}
    for IntCount2:=1 to Days do StrGrid.Cells[IntCount2+5,IntCount]:=IntToStr(IntStatusCuti[IntCount2]); {cek nih}
*)
    ProgressBar.Position := 0;
    Qry.Close;
    FreeAndNil(Qry2);
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  
end;


procedure TEmplAttedanceMini.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmplAttedanceMini.FormCreate(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshGrid;
//  RefreshData;
end;

procedure TEmplAttedanceMini.SelesaiClick(Sender: TObject);
begin
  EmplAttedanceMini.Close;
end;

procedure TEmplAttedanceMini.TahunKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
end;

procedure TEmplAttedanceMini.LihatDataClick(Sender: TObject);
begin
//  RefreshGrid;
  RefreshData;
end;

procedure TEmplAttedanceMini.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;


procedure TEmplAttedanceMini.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TEmplAttedanceMini.StrGridDblClick(Sender: TObject);
begin
  if (StrGrid.Cells[IntCol,IntRow]<>'') and (IntRow>MinRowGrid) and (IntCol>MinColGrid) then
  begin

      if (Main.IsFormOpen('AttandanceLeaveForm')=False) and (DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]<>'')then begin
        if StrPos(PChar(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]),PChar('  '))=nil then begin
          //ShowMessage(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]);
          if (LeftStr(DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)],3)='ATT') then
            AttandanceLeaveForm:=TAttandanceLeaveForm.Create(Self, DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)], True)
        end else begin
          SelectBooking:=TSelectBooking.Create(Self,DailyArr[IntRow-(MinRowGrid+1)][IntCol-(MinColGrid+1)]);
        end;
      end;
  end;


  if (IntRow>0) and (StrGrid.Cells[IntCol,IntRow]<>'') then begin
//    if ( (StrGrid.Cells[IntCol,IntRow])='S') OR (StrGrid.Cells[IntCol,IntRow])='S') or (StrGrid.Cells[IntCol,IntRow])='S') ) then begin

//    end;
  end;
//    if Main.IsFormOpen('VehicleForm')=False then VehicleForm:=TVehicleForm.Create(Self,'Taxi','',True,StrGrid.Cells[IntCol,IntRow]);
end;

end.
