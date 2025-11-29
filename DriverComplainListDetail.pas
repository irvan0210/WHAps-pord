unit DriverComplainListDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ADODB, WHUnit;

type
  TFDriverComplainListDetail = class(TForm)
    GroupTotal: TGroupBox;
    chk1: TCheckBox;
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    Simpan: TButton;
    CheckSelect: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LokasiArr,GroupArr:Array of TArrString2;
    CompanyArr:Array of TArrString5;
    MaxCol:Integer;
    IntRow,IntCol,IsIntegrate:Integer;
    IsInput,Initiation:Boolean;
    StrTitel:String;

    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  FDriverComplainListDetail: TFDriverComplainListDetail;
  DriverComplainID,RequestName,StrVehicleID2,LicensePlate,StrOdoIn: String;

implementation

uses ServiceRequestFormU, DriverComplainList, MainU;

{$R *.dfm}
constructor TFDriverComplainListDetail.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

procedure TFDriverComplainListDetail.Init;
var Count,Count2:Integer;
begin
  MaxCol:=5;
end;

procedure TFDriverComplainListDetail.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  StrGrid.ColCount:=MaxCol+1;
  StrGrid.RowCount:=2;

  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=35;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=440;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=300;
  //StrGrid.ColWidths[6]:=100;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Cek';
  StrGrid.Cells[2,0]:='ID Keluhan Detail';
  StrGrid.Cells[3,0]:='Keluhan';
  StrGrid.Cells[4,0]:='Status';
  StrGrid.Cells[5,0]:='Respon';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;

end;

procedure TFDriverComplainListDetail.RefreshData;
var QStr,StrBatch,StrLocationId,StrCompanyId,StrToDates,StrisAll:String;
    StrIsIntegrate:string;
    Qry, Qry2, QryCek:TADOQuery;
    Count,Count2,Total1,Total2,Total3,Total4,Total5,
    Total6,Total7,TotalOperasi,IntDiscount,IntCount, IntCount2:Integer;

begin

  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;

  Qry.CursorLocation:=clUseClient;

  Main.M_Busy;
  QStr:='select * from wh_driver_complain_detail where driver_complain_id='+QuotedStr(DriverComplainID)+' and status=1';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1 else StrGrid.RowCount:=0;
  for Count:=0 to MaxCol do begin
    for Count2:=2 to StrGrid.RowCount do begin    // reset baris ke 3
      StrGrid.Cells[Count,Count2]:='';
      StrGrid.CellStyle[Count,Count2].BGColor:=clWindow;
      StrGrid.CellStyle[Count,Count2].Font.Color:=clWindowText;
    end;
  end;

  Count:=1;
  if Qry.RecordCount>0 then while not (Qry.Eof) do begin
    for Count2:=0 to MaxCol do begin
      StrGrid.Cells[Count2,Count]:='';
      StrGrid.CellStyle[Count2,Count].HorizontalAlignment:=taLeftJustify;
    end;

    StrGrid.Cells[0,Count]:=IntToStr(Count);
    StrGrid.Cells[2,Count]:=Qry.FieldValues['driver_complain_detail_id'];
    StrGrid.Cells[3,Count]:=Qry.FieldValues['description'];

    if Qry.FieldValues['status_respons']= 1 then StrGrid.Cells[4,Count]:='DISETUJUI'
    else StrGrid.Cells[4,Count]:='DITOLAK';
    StrGrid.Cells[5,Count]:=Qry.FieldValues['note_respons'];
   // StrGrid.Cells[5,Count]:=Qry.FieldValues['status_respons'];

    StrGrid.CellStyle[0,Count].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[1,Count].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[2,Count].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,Count].HorizontalAlignment:=taLeftJustify;
    //StrGrid.CellStyle[4,Count].HorizontalAlignment:=taRightJustify;

    if (StrGrid.Cells[4,Count]='DITOLAK') then begin
        //for IntCount:=1 to StrGrid.RowCount-1 do begin
          for IntCount2:=0 to StrGrid.ColCount-1 do
            StrGrid.CellStyle[IntCount2,Count].font.Color := clRed;
      //end;
     end;

    //if WorkOrderArr[IntCount][12]<>'' then
    //begin
   //  for IntCount2:=0 to StrGrid.ColCount-1 do
    // StrGrid.CellStyle[IntCount2,IntCount+2].Font.Color:=clGreen;
    //end;

    Inc(Count);
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;

  Main.M_Normal;
end;

procedure TFDriverComplainListDetail.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TFDriverComplainListDetail.chk1Click(Sender: TObject);
var
  intCount3, intCount4:Integer;
begin
    //StrGrid.Cells[IntCol,IntRow]:='v';
    for intCount4:=1 to StrGrid.RowCount-1 do begin
      if (StrGrid.Cells[4,intCount4])='DITOLAK' then begin
         MessageBox(0,PChar('Keluhan sudah ada yang ditolak'+#13#10+'Silahkan pilih satu-satu..'),'Keluhan driver',MB_OK or MB_ICONWARNING);
         chk1.Checked := False;
         Break;
      end else begin

        if chk1.Checked=false then begin
          for intCount3:= 1 to StrGrid.RowCount-1 do begin
            StrGrid.Cells[1,intCount3]:='';
          end;
        end else begin
          for intCount3:=1 to StrGrid.RowCount-1 do begin
            if (StrGrid.Cells[26,intCount3])<>'Sudah Transfer' then begin
              StrGrid.Cells[1,intCount3]:='v';
            end;
          end;
        end;
      end;
    end;
end;

procedure TFDriverComplainListDetail.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
    if (StrGrid.Cells[4,ARow]<>'DITOLAK')  then begin
     //if StrGrid.Cells[5,ARow]='DITOLAK' then
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        1 :with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end else begin
       MessageBox(0,PChar('Keluhan sudah ditolak'),'Keluhan driver',MB_OK or MB_ICONWARNING);
    end;
//  end;

end;

procedure TFDriverComplainListDetail.SimpanClick(Sender: TObject);
var
IntCount,IntCount2:Integer;
description,IdKeluhanDetail: string;
begin
  IntCount2:=0;
//  ServiceRequestForm.IntCount:=ServiceRequestForm.IntLastRow;
  for IntCount:=1 to StrGrid.RowCount do begin
    description:=StrGrid.Cells[3,IntCount];
    IdKeluhanDetail := StrGrid.Cells[2,IntCount];
    if StrGrid.Cells[1,IntCount]='v' then begin
      IntCount2:= IntCount2+1;
      with  ServiceRequestForm do
      begin
        if (IntCount2-1)>StrGrid.RowCount-1 then StrGrid.RowCount:=StrGrid.RowCount+1;
        StrGrid.Cells[0,IntCount2-1]:=description;
        StrGrid.Cells[2,IntCount2-1]:=IdKeluhanDetail;
//        Inc(IntCount);
      end;
      with  ServiceRequestForm do
      begin
        Request.Text:=RequestName;
        NoKeluhan.Text:=DriverComplainID;
        NoPolisi.Text:=LicensePlate;
        KMOdo.Text:=StrOdoIn;
        VehicleId:= StrVehicleID2;
        StartDate.Enabled:=True;
      end;
//      ServiceRequestForm.VehicleId:=StrVehicleID;
    end;
  end;
  FDriverComplainList.Close;
  Close;
end;

procedure TFDriverComplainListDetail.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TFDriverComplainListDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFDriverComplainListDetail.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  Initiation:=False;
  RefreshData;
end;

end.
