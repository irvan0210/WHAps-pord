unit ListKetidakSesuaianCrewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, Buttons, WHUnit, ADODB;

type
  TListKetidakSesuaianCrew = class(TForm)
    lbl2: TLabel;
    lbl4: TLabel;
    ToXCel: TSpeedButton;
    Label1: TLabel;
    GroupTotal: TGroupBox;
    lbl5: TLabel;
    TotalData: TEdit;
    Tanggal: TDateTimePicker;
    Refresh: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    lbl6: TLabel;
    SBU: TComboBox;
    TglSampai: TDateTimePicker;
    Button1: TButton;
    Cari: TEdit;
    Label2: TLabel;
    Status: TComboBox;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    StatusSJ: TComboBox;
    Label5: TLabel;
    StatusPerubahanCrew: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    CompanyArr:Array of TArrString7;
    RekapArr:Array of TArrString18;
    MinRowGrid,IntRow,IntCol:Integer;
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
  ListKetidakSesuaianCrew: TListKetidakSesuaianCrew;

implementation

uses
  MainU, SPJFormBusU;

{$R *.dfm}

constructor TListKetidakSesuaianCrew.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TListKetidakSesuaianCrew.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
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

end;

procedure TListKetidakSesuaianCrew.Init;
var IntCount:Integer;
begin
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  Cari.Text:='';
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;
  Status.ItemIndex:=1;
  StatusSJ.ItemIndex:=0;
  StatusPerubahanCrew.ItemIndex:=0;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TListKetidakSesuaianCrew.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=2;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=19;
  StrGrid.ColWidths[0]:=90;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=0;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=0;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=130;
  StrGrid.ColWidths[7]:=130;
  StrGrid.ColWidths[8]:=130;
  StrGrid.ColWidths[9]:=50;
  StrGrid.ColWidths[10]:=50;
  StrGrid.ColWidths[11]:=50;
  StrGrid.ColWidths[12]:=250;
  StrGrid.ColWidths[13]:=130;
  StrGrid.ColWidths[14]:=130;
  StrGrid.ColWidths[15]:=130;
  StrGrid.ColWidths[16]:=130;
  StrGrid.ColWidths[17]:=80;
  StrGrid.ColWidths[18]:=80;

  StrGrid.Cells[0,0]:='No Surat Jalan';
  StrGrid.Cells[1,0]:='Customer';
  StrGrid.Cells[2,0]:='Rute';
  StrGrid.Cells[3,0]:='Tanggal Keluar';
  StrGrid.Cells[4,0]:='Jenis Unit';
  StrGrid.Cells[5,0]:='No Polisi';
  StrGrid.Cells[6,0]:='Driver1';
  StrGrid.Cells[7,0]:='Driver2';
  StrGrid.Cells[8,0]:='BusBoy';

  StrGrid.Cells[9,0]:='Check Crew';
  StrGrid.Cells[9,1]:='Driver1';
  StrGrid.Cells[10,1]:='Driver2';
  StrGrid.Cells[11,1]:='Busboy';
  StrGrid.Cells[12,1]:='Catatan';
  StrGrid.Cells[13,0]:='Crew Sebelum Diubah';
  StrGrid.Cells[13,1]:='Driver1';
  StrGrid.Cells[14,1]:='Driver2';
  StrGrid.Cells[15,1]:='Busboy';
  StrGrid.Cells[16,0]:='Update Crew By';
  StrGrid.Cells[17,0]:='Update Crew Date';
  StrGrid.Cells[18,0]:='Status';

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1);
  StrGrid.MergeCells.AddRectXY(8,0,8,1);

  StrGrid.MergeCells.AddRectXY(9,0,12,0);
  StrGrid.MergeCells.AddRectXY(13,0,15,0);

  StrGrid.MergeCells.AddRectXY(16,0,16,1);
  StrGrid.MergeCells.AddRectXY(17,0,17,1);
  StrGrid.MergeCells.AddRectXY(18,0,18,1);

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[12,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[13,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[14,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[15,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[16,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[17,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[18,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,3]:='';
end;

procedure TListKetidakSesuaianCrew.RefreshData;
var Qry:TADOQuery;
    StrQry,StrStatusSJ:String;
    IntCount,StatusKetidaksesuaian,PerubahanCrew:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(RekapArr,0);

    if Status.Text='Sesuai' then
    begin
      StatusKetidaksesuaian:=1;
    end else if Status.Text='Tidak Sesuai' then
    begin
      StatusKetidaksesuaian:=2;
    end else
    begin
      StatusKetidaksesuaian:=0;
    end;

    PerubahanCrew:= StatusPerubahanCrew.ItemIndex;

    StrQry:='EXEC GetKetidakSesuaianCrew 6,'+QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date))+','+
            ''+QuotedStr(FormatDateTime('dd-mm-yyyy',TglSampai.Date))+','+IntToStr(StatusKetidaksesuaian)+','+
            QuotedStr(UpperCase(StatusSJ.Text))+','+IntToStr(PerubahanCrew);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(RekapArr,IntCount+1);
      RekapArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
      RekapArr[IntCount][1]:=Qry.FieldValues['customer'];
      if Qry.FieldValues['route']<>null then
      RekapArr[IntCount][2]:=Qry.FieldValues['route'];
      RekapArr[IntCount][3]:=Qry.FieldValues['from_date'];
      RekapArr[IntCount][4]:=Qry.FieldValues['batch_name'];

      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          RekapArr[IntCount][5]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          RekapArr[IntCount][5]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);

      RekapArr[IntCount][6]:=Qry.FieldValues['driver1'];
      if Qry.FieldValues['driver2']<> NULL then
      RekapArr[IntCount][7]:=Qry.FieldValues['driver2'];
      if Qry.FieldValues['busboy']<> NULL then
      RekapArr[IntCount][8]:=Qry.FieldValues['busboy'];

      if Qry.FieldValues['is_employee_id_matched']=True then
      begin
        RekapArr[IntCount][9]:='V';
      end
      else if Qry.FieldValues['is_employee_id_matched']=False then
      begin
        RekapArr[IntCount][9]:='X';
      end;

      if Qry.FieldValues['is_employee_id2_matched']=True then
      begin
        RekapArr[IntCount][10]:='V';
      end
      else if Qry.FieldValues['is_employee_id2_matched']=False then
      begin
        RekapArr[IntCount][10]:='X';
      end;


      if Qry.FieldValues['is_employee_id3_matched']=True then
      begin
        RekapArr[IntCount][11]:='V';
      end
      else if Qry.FieldValues['is_employee_id3_matched']=False then
      begin
        RekapArr[IntCount][11]:='X';
      end;


      if Qry.FieldValues['checked_note']<> NULL then
      RekapArr[IntCount][12]:=Qry.FieldValues['checked_note'];

      if Qry.FieldValues['driver1_old']<> NULL then
      RekapArr[IntCount][13]:=Qry.FieldValues['driver1_old'];
      if Qry.FieldValues['driver2_old']<> NULL then
      RekapArr[IntCount][14]:=Qry.FieldValues['driver2_old'];
      if Qry.FieldValues['busboy_old']<> NULL then
      RekapArr[IntCount][15]:=Qry.FieldValues['busboy_old'];

      if (Qry.FieldValues['driver1_old']<>Qry.FieldValues['driver1']) or
      (Qry.FieldValues['driver2_old']<>Qry.FieldValues['driver2']) or
      (Qry.FieldValues['busboy_old']<>Qry.FieldValues['busboy']) then
      begin
        if (Qry.FieldValues['update_user']<> NULL) then
        RekapArr[IntCount][16]:=Qry.FieldValues['update_user'];
        if (Qry.FieldValues['update_date']<> NULL)  then
        RekapArr[IntCount][17]:=Qry.FieldValues['update_date'];
      end;

      if Qry.FieldValues['status_sj']<>NULL then
      RekapArr[IntCount][18]:=Qry.FieldValues['status_sj'];

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

end;

procedure TListKetidakSesuaianCrew.RefreshGrid;
var IntCount,IntCount2,IntCountID,IntTotalData:Integer;
begin
  if Length(RekapArr)>0 then StrGrid.RowCount:=Length(RekapArr)+2
  else begin
    StrGrid.RowCount:=3;
  end;
  for IntCount:=2 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  IntCountID:=0;
  IntTotalData:=0;
  for IntCount:=0 to Length(RekapArr)-1 do begin

    StrGrid.Cells[0,IntCount+2]:=RekapArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=RekapArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=RekapArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=RekapArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=RekapArr[IntCount][4];
    StrGrid.Cells[5,IntCount+2]:=RekapArr[IntCount][5];
    StrGrid.Cells[6,IntCount+2]:=RekapArr[IntCount][6];
    StrGrid.Cells[7,IntCount+2]:=RekapArr[IntCount][7];
    StrGrid.Cells[8,IntCount+2]:=RekapArr[IntCount][8];
    StrGrid.Cells[9,IntCount+2]:=RekapArr[IntCount][9];
    StrGrid.Cells[10,IntCount+2]:=RekapArr[IntCount][10];
    StrGrid.Cells[11,IntCount+2]:=RekapArr[IntCount][11];
    StrGrid.Cells[12,IntCount+2]:=RekapArr[IntCount][12];
    StrGrid.Cells[13,IntCount+2]:=RekapArr[IntCount][13];
    StrGrid.Cells[14,IntCount+2]:=RekapArr[IntCount][14];
    StrGrid.Cells[15,IntCount+2]:=RekapArr[IntCount][15];
    StrGrid.Cells[16,IntCount+2]:=RekapArr[IntCount][16];
    StrGrid.Cells[17,IntCount+2]:=RekapArr[IntCount][17];
    StrGrid.Cells[18,IntCount+2]:=RekapArr[IntCount][18];

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[5,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[7,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[8,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[9,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[10,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[11,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[12,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[13,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[14,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[15,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[16,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[17,IntCount+2].HorizontalAlignment:=taCenter;



    if RekapArr[IntCount][9]='X' then
    begin
      StrGrid.CellStyle[9,IntCount+2].Font.Color:=clRed;
    end else if RekapArr[IntCount][9]='V' then
    begin
      StrGrid.CellStyle[9,IntCount+2].Font.Color:=clGreen;
    end;

    if RekapArr[IntCount][10]='X' then
    begin
      StrGrid.CellStyle[10,IntCount+2].Font.Color:=clRed;
    end else if RekapArr[IntCount][10]='V' then
    begin
      StrGrid.CellStyle[10,IntCount+2].Font.Color:=clGreen;
    end;

    if RekapArr[IntCount][11]='X' then
    begin
      StrGrid.CellStyle[11,IntCount+2].Font.Color:=clRed;
    end else if RekapArr[IntCount][11]='V' then
    begin
      StrGrid.CellStyle[11,IntCount+2].Font.Color:=clGreen;
    end;

    if RekapArr[IntCount][6]<>RekapArr[IntCount][13] then
    begin
      StrGrid.CellStyle[6,IntCount+2].Font.Color:=clBlue;
    end;

    if RekapArr[IntCount][7]<>RekapArr[IntCount][14] then
    begin
      StrGrid.CellStyle[7,IntCount+2].Font.Color:=clBlue;
    end;

    if RekapArr[IntCount][8]<>RekapArr[IntCount][15] then
    begin
      StrGrid.CellStyle[8,IntCount+2].Font.Color:=clBlue;
    end;
    Inc(IntTotalData);
  end;
  TotalData.Text:= IntToStr(IntTotalData);
end;

procedure TListKetidakSesuaianCrew.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TListKetidakSesuaianCrew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TListKetidakSesuaianCrew.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  InitGrid;
end;

procedure TListKetidakSesuaianCrew.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then begin
    TglSampai.Date:=Tanggal.Date;
  end;
end;

procedure TListKetidakSesuaianCrew.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then begin
    Tanggal.Date:= TglSampai.Date;
  end;
end;

procedure TListKetidakSesuaianCrew.RefreshClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TListKetidakSesuaianCrew.StrGridDblClick(Sender: TObject);
begin
  if IntRow>0 then begin
    Case IntCol of
    6,17: begin
            if (Main.IsFormOpen('SPJFormBus')=False) then
            begin
              if StrGrid.Cells[18,IntRow]='COMPLETED' then
              begin
                SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[0,IntRow],False,'KetidakSesuaianCrew');
              end else begin
                SPJFormBus:=TSPJFormBus.Create(nil,StrGrid.Cells[0,IntRow],True,'KetidakSesuaianCrew');
              end;
              SPJFormBus.pnl2.Enabled:=False;
            end;
          end;
    end;
  end;
end;

procedure TListKetidakSesuaianCrew.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TListKetidakSesuaianCrew.SpeedButton1Click(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

procedure TListKetidakSesuaianCrew.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
if (Trim(Cari.Text)<>'')  then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(RekapArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 9 do
      if (StrPos(PChar(UpperCase(RekapArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 18 do
          StrGrid.Cells[Count4,Count2]:=RekapArr[Count][Count4];

          if RekapArr[Count][9]='X' then
          begin
            StrGrid.CellStyle[9,Count2].Font.Color:=clRed;
          end else if RekapArr[Count][9]='V' then
          begin
            StrGrid.CellStyle[9,Count2].Font.Color:=clGreen;
          end;

          if RekapArr[Count][10]='X' then
          begin
            StrGrid.CellStyle[10,Count2].Font.Color:=clRed;
          end else if RekapArr[Count][10]='V' then
          begin
            StrGrid.CellStyle[10,Count2].Font.Color:=clGreen;
          end;

          if RekapArr[Count][11]='X' then
          begin
            StrGrid.CellStyle[11,Count2].Font.Color:=clRed;
          end else if RekapArr[Count][11]='V' then
          begin
            StrGrid.CellStyle[11,Count2].Font.Color:=clGreen;
          end;

          if RekapArr[Count][6]<>RekapArr[Count][13] then
          begin
            StrGrid.CellStyle[6,Count2].Font.Color:=clBlue;
          end else
          begin
            StrGrid.CellStyle[6,Count2].Font.Color:=clWindowText;
          end;

          if RekapArr[Count][7]<>RekapArr[Count][14] then
          begin
            StrGrid.CellStyle[7,Count2].Font.Color:=clBlue;
          end else
          begin
            StrGrid.CellStyle[7,Count2].Font.Color:=clWindowText;
          end;

          if RekapArr[Count][8]<>RekapArr[Count][15] then
          begin
            StrGrid.CellStyle[8,Count2].Font.Color:=clBlue;
          end else
          begin
            StrGrid.CellStyle[8,Count2].Font.Color:=clWindowText;
          end;

          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

end.
