unit RekapPergantianPartperArmadaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, ADODB, WHUnit;

type
  TRekapPergantianPartperArmada = class(TForm)
    ToXCel: TSpeedButton;
    Label3: TLabel;
    Label2: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    PlateNo: TEdit;
    Button3: TButton;
    Bersihkan: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PlateNoChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    MinRowGrid:Integer;
    RekapArr:Array of TArrString14;
    CompanyArr:Array of TArrString7;
//    procedure Init;
    procedure InitGrid;
//    procedure RefreshCombo;
//    procedure RefreshSeat;
    procedure RefreshData;
//    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  RekapPergantianPartperArmada: TRekapPergantianPartperArmada;
  StrVehicleIDRekapPergantianPart : string;

implementation

uses
  MainU, VehicleListU, BrowsePartU, StrUtils;

{$R *.dfm}

constructor TRekapPergantianPartperArmada.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TRekapPergantianPartperArmada.InitGrid;
var IntCount:Integer;
    Qry:TADOQuery;
    StrQry,UpdateTimeGetOdo:string;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='select TOP 1 FORMAT(update_time, ''dd-MM-yy hh:mm'') update_time2 FROM wh_log_get_odo Order By update_time DESC;';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      UpdateTimeGetOdo:= Qry.FieldValues['update_time2'];
    end;
    Qry.Close
  end;
  Main.CloseDb;

  MinRowGrid:=2;
  StrGrid.RowCount:=4;
  StrGrid.ColCount:=11;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=350;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=100;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[7]:=100;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[9]:=100;
  StrGrid.ColWidths[10]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama Part';
  StrGrid.Cells[2,0]:=PlateNo.Text;
  StrGrid.Cells[2,1]:='Pergantian Terakhir';
  StrGrid.Cells[2,2]:='Tanggal';
  StrGrid.Cells[3,2]:='KM';
  StrGrid.Cells[4,1]:='KM';
  StrGrid.Cells[4,2]:='KM/Hari';
  StrGrid.Cells[5,2]:='KM Standard';
  StrGrid.Cells[6,1]:='Estimasi Pergantian';
  StrGrid.Cells[6,2]:='KM Estimasi';
  StrGrid.Cells[7,2]:='Tanggal Estimasi';
  StrGrid.Cells[8,1]:='Update Terakhir '+ UpdateTimeGetOdo;
  StrGrid.Cells[8,2]:='KM Sekarang';
  StrGrid.Cells[9,2]:='KM Pencapaian';

  StrGrid.MergeCells.AddRectXY(0,0,0,2);
  StrGrid.MergeCells.AddRectXY(1,0,1,2);

  StrGrid.MergeCells.AddRectXY(2,0,9,0);
  StrGrid.MergeCells.AddRectXY(2,1,3,1);
  StrGrid.MergeCells.AddRectXY(4,1,5,1);
  StrGrid.MergeCells.AddRectXY(6,1,7,1);
  StrGrid.MergeCells.AddRectXY(8,1,9,1);



  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[2,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;

  StrGrid.CellStyle[2,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,2].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,2].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,4]:='';
end;

procedure TRekapPergantianPartperArmada.RefreshData;
var Qry:TADOQuery;
    IntCount: Integer;
    StrQry,StrKodePart: string;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;
  if Main.OpenDb then begin
    for IntCount:=3 to RekapPergantianPartperArmada.StrGrid.RowCount-1 do begin
      if StrGrid.Cells[10,IntCount]<>'' then
      begin
        StrKodePart:=StrGrid.Cells[10,IntCount];
        StrQry:='EXEC GetRekapPergantianPartPerArmada @KodePartGP='+QuotedStr(StrKodePart)+',@VehicleID='+QuotedStr(StrVehicleIDRekapPergantianPart);
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          if Qry.FieldValues['tgl_terakhir_ganti']<>NULL then
            StrGrid.Cells[2,IntCount]:= Qry.FieldValues['tgl_terakhir_ganti']
          else
            StrGrid.Cells[2,IntCount]:='';
          if Qry.FieldValues['km_terakhir_ganti']<>NULL then
            StrGrid.Cells[3,IntCount]:= SToCurr(Qry.FieldValues['km_terakhir_ganti'])
          else
            StrGrid.Cells[3,IntCount]:='';
          StrGrid.Cells[4,IntCount]:= Qry.FieldValues['km_hari'];
          if Qry.FieldValues['standard_km_replacement']<>NULL then
            StrGrid.Cells[5,IntCount]:= SToCurr(Qry.FieldValues['standard_km_replacement'])
          else
            StrGrid.Cells[5,IntCount]:='';
          if Qry.FieldValues['km_estimasi']<>NULL then
            StrGrid.Cells[6,IntCount]:= SToCurr(Qry.FieldValues['km_estimasi'])
          else
            StrGrid.Cells[6,IntCount]:='';
          if Qry.FieldValues['tgl_estimasi_ganti']<>NULL then
            StrGrid.Cells[7,IntCount]:= Qry.FieldValues['tgl_estimasi_ganti']
          else
            StrGrid.Cells[7,IntCount]:='';
          if Qry.FieldValues['odo_update_gps']<>NULL then
            StrGrid.Cells[8,IntCount]:= SToCurr(Qry.FieldValues['odo_update_gps'])
          else
            StrGrid.Cells[8,IntCount]:='';
          if (Qry.FieldValues['odo_update_gps']<>NULL) and (Qry.FieldValues['km_estimasi']<>NULL) then
            StrGrid.Cells[9,IntCount]:= SToCurr(Qry.FieldValues['odo_update_gps']-Qry.FieldValues['km_estimasi'])
          else
            StrGrid.Cells[9,IntCount]:='';
            StrGrid.CellStyle[2,IntCount].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[3,IntCount].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[4,IntCount].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[5,IntCount].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[6,IntCount].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[7,IntCount].HorizontalAlignment:=taCenter;
            StrGrid.CellStyle[8,IntCount].HorizontalAlignment:=taRightJustify;
            StrGrid.CellStyle[9,IntCount].HorizontalAlignment:=taRightJustify;

            if StrGrid.Cells[9,IntCount]<>'' then
            begin
              if LeftStr(StrGrid.Cells[9,IntCount],1)<>'-' then
              begin
                StrGrid.CellStyle[9,IntCount].Font.Color:=clRed;
              end;
            end;

        end;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TRekapPergantianPartperArmada.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TRekapPergantianPartperArmada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRekapPergantianPartperArmada.Button2Click(Sender: TObject);
begin
   if Main.IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(Self,'Bus','REKAPPERGANTIANPARTPERARMADA');
end;

procedure TRekapPergantianPartperArmada.FormShow(Sender: TObject);
begin
  InitGrid;
end;

procedure TRekapPergantianPartperArmada.PlateNoChange(Sender: TObject);
begin
  StrGrid.Cells[2,0]:=PlateNo.Text;
end;

procedure TRekapPergantianPartperArmada.Button3Click(Sender: TObject);
begin
  if PlateNo.Text='' then begin
    MessageBox(0,PChar('Silahkan pilih kendaraan dulu!!'),'Rekap Pergantian Part perArmada',MB_OK or MB_ICONWARNING);
  end else begin
    if Main.IsFormOpen('BrowsePartU')=False then
    begin
      BrowsePartVehicleId:=StrVehicleIDRekapPergantianPart;
      BrowsePart:=TBrowsePart.Create(Self,'REKAPPERGANTIANPARTPERARMADA');
    end;
  end;
end;

procedure TRekapPergantianPartperArmada.Button1Click(Sender: TObject);
begin
  if (StrGrid.RowCount>4) and (PlateNo.Text<>'') then begin
    RefreshData;
  end else
  begin
     MessageBox(0,PChar('Silahkan pilih part dan kendaraan dulu!!'),'Rekap Pergantian Part perArmada',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TRekapPergantianPartperArmada.BersihkanClick(Sender: TObject);
var IntCount,IntCount2:Integer;
begin
  for IntCount:=3 to StrGrid.RowCount-1 do
    for IntCount2:=0 to StrGrid.ColCount do begin
      StrGrid.Cells[IntCount2,IntCount]:='';
      StrGrid.CellStyle[IntCount2,IntCount].Font.Color:=clWindowText;
    end;
  StrGrid.RowCount:=4;
end;

end.
