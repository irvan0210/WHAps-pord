unit ListPartsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, WHUnit, StdCtrls, Grids, ZColorStringGrid, Buttons, ExtCtrls;

type
  TListParts = class(TForm)
    btnTombolCari: TSpeedButton;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    Button1: TButton;
    Cari: TEdit;
    ToXCel: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnTombolCariClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest,FormFunction:String;
    DepartmentArr,LocationArr:Array of TArrString4;
    CompanyArr:Array of TArrString7;
    WorkOrderArr:Array of TArrString10;
    IntRow,IsAll,IsBlok,MinRowGrid:Integer;
    Initiation:Boolean; 
  public
    { Public declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);Overload;
  end;

var
  ListParts: TListParts;

implementation

uses
  MainU, PartU, RekapHistoryArmadaPergantianPartU, 
  RekapPergantianPartperArmadaV2U, PurchaseRequestU;

{$R *.dfm}

constructor TListParts.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='';Is_All:Integer=9;Is_Blok:Byte=0);
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TListParts.Init;
begin
  Cari.Text:='';
end;

procedure TListParts.InitGrid;
var IntCount,IntGeserKolom:Integer;
begin
  MinRowGrid:=3;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=5;
  StrGrid.ColWidths[0]:=28;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=450;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=0;

  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Part GP';
  StrGrid.Cells[2,0]:='Nama Part';
  StrGrid.Cells[3,0]:='KM Standard Pergantian';

  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,4,1);

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TListParts.RefreshData;
var Qry:TADOQuery;
    StrQry,StrReq:String;
    IntCount,No:Integer;
begin

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;

  if Main.OpenDb then begin
    SetLength(WorkOrderArr,0);

    if Cari.Text<>'' then begin
      StrReq:='  AND (name LIKE ''%'+Cari.Text+'%'') '
    end else begin
      StrReq:='';
    end;

    StrQry:='SELECT * from wh_part where status=1 '+StrReq;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(WorkOrderArr,IntCount+1);
      No:=No+1;
      WorkOrderArr[IntCount][0]:=IntToStr(No);
      WorkOrderArr[IntCount][1]:= Qry.FieldValues['kode_part_gp'] ;
      WorkOrderArr[IntCount][2]:=Qry.FieldValues['name'];
      if Qry.FieldValues['standard_km_replacement']<> NULL then
      WorkOrderArr[IntCount][3]:=SToCurr(Qry.FieldValues['standard_km_replacement']) else WorkOrderArr[IntCount][3]:='0';
      WorkOrderArr[IntCount][4]:=Qry.FieldValues['id_part'];

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TListParts.RefreshGrid;
var IntCount,IntCount2,IntStartRow,IntTotal,IntStartRow2,lengt:Integer;
    StrOrderId,StrCustOrderDetailId:String;
    IsDrawRect,IsDrawRect2:Boolean;
begin
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+1
  else begin
    StrGrid.RowCount:=2;
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
  for IntCount2:=2 to StrGrid.RowCount-1 do begin
    IntTotal:=StrGrid.MergeCells.InMergeRange(IntCount,IntCount2);
    if IntTotal>=0 then StrGrid.MergeCells.DeleteItem(IntTotal);
  end;
  for IntCount:=0 to StrGrid.ColCount-1 do
  for IntCount2:=1 to StrGrid.RowCount-1 do begin
    StrGrid.Cells[IntCount,IntCount2]:='';
    StrGrid.CellStyle[IntCount,IntCount2].Font.Color:=clWindowText;
  end;
  if Length(WorkOrderArr)>0 then StrGrid.RowCount:=Length(WorkOrderArr)+2
  else begin
    StrGrid.RowCount:=2;
  end;

  IntTotal:=0;
  lengt:= Length(WorkOrderArr)-1;
  for IntCount:=0 to Length(WorkOrderArr)-1 do begin

    StrGrid.Cells[0,IntCount+2]:=WorkOrderArr[IntCount][0];
    StrGrid.Cells[1,IntCount+2]:=WorkOrderArr[IntCount][1];
    StrGrid.Cells[2,IntCount+2]:=WorkOrderArr[IntCount][2];
    StrGrid.Cells[3,IntCount+2]:=WorkOrderArr[IntCount][3];
    StrGrid.Cells[4,IntCount+2]:=WorkOrderArr[IntCount][4];

    StrGrid.CellStyle[0,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1,IntCount+2].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntCount+2].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[3,IntCount+2].HorizontalAlignment:=taRightJustify;
    StrGrid.CellStyle[4,IntCount+2].HorizontalAlignment:=taLeftJustify;
  end;
end;

procedure TListParts.Search;
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    Init;
    Count2:=1;
    for Count:=0 to Length(WorkOrderArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 3 do
        if (StrPos(PChar(UpperCase(WorkOrderArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
          if IsTrue= True then begin


            StrGrid.RowCount:=Count2;
            for Count4:=0 to 1 do begin
              StrGrid.Cells[Count4,Count2-1]:=WorkOrderArr[Count][Count4];
              StrGrid.CellStyle[0,Count2+1].HorizontalAlignment:=taCenter;
              StrGrid.CellStyle[1,Count2+1].HorizontalAlignment:=taCenter;
              StrGrid.CellStyle[2,Count2+1].HorizontalAlignment:=taLeftJustify;
              StrGrid.CellStyle[3,Count2+1].HorizontalAlignment:=taRightJustify;
            end;

            Inc(Count2);
          end;
//      end;
    end;

    Main.M_Normal;
  end;
end;

procedure TListParts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TListParts.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TListParts.btnTombolCariClick(Sender: TObject);
begin
//  if Trim(Cari.Text)<>'' then begin
//    Search;
//  end else begin
//    Init;
//    InitGrid;
  RefreshData;
  RefreshGrid;
//  end;
end;

procedure TListParts.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TListParts.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TListParts.StrGridDblClick(Sender: TObject);
var
StrPartName, kode_part_gp : string;
IntCount,IntRowCount,rowcount2:Integer;
begin
  if IntRow>1 then begin
    if FormRequest='REKAPHISTORYARMADAPERGANTIANPART' then
    begin
      with RekapHistoryArmadaPergantianPart do begin
        kode_part_rekap_armada_id:=ListParts.StrGrid.Cells[1,IntRow];
        Part.Text:=ListParts.StrGrid.Cells[2,IntRow];
      end;
      Close;
    end else if FormRequest='REKAPPERGANTIANPARTPERARMADA-V2' then begin
      StrPartName := ListParts.StrGrid.Cells[2,IntRow];
       for IntCount:=2 to RekapPergantianPartperArmadaV2.StrGridTemp.RowCount do begin
      // MessageBox(0,PChar(EmployeeHistoryTrainingForm.StrGridPeserta.Cells[1,IntCount-1]),'Daftar Peserta',MB_OK or MB_ICONWARNING);
        if StrPartName=RekapPergantianPartperArmadaV2.StrGridTemp.Cells[0,IntCount-1] then begin
          MessageBox(0,PChar('Part Sudah Dipilih..!'),'Daftar Part',MB_OK or MB_ICONWARNING);
          Exit;
        end ;
      end;

      RekapPergantianPartperArmadaV2.StrGridTemp.RowCount := RekapPergantianPartperArmadaV2.StrGridTemp.RowCount+1;
      RekapPergantianPartperArmadaV2.StrGridTemp.Cells[0,RekapPergantianPartperArmadaV2.StrGridTemp.RowCount-1]:=ListParts.StrGrid.Cells[2,IntRow];
      RekapPergantianPartperArmadaV2.StrGridTemp.Cells[1,RekapPergantianPartperArmadaV2.StrGridTemp.RowCount-1]:=ListParts.StrGrid.Cells[1,IntRow];

      RekapPergantianPartperArmadaV2.TotalTemp.Text:= IntToStr(RekapPergantianPartperArmadaV2.StrGridTemp.RowCount-1);
    end else if FormRequest='PURCHESREQUSEST' then begin
      StrPartName := ListParts.StrGrid.Cells[2,IntRow];
      kode_part_gp := ListParts.StrGrid.Cells[1,IntRow];
      if Trim(StrPartName)<>'' then
        begin
          for IntCount:=2 to PurchaseRequest.StrGrid.RowCount do begin
            if Trim(StrPartName)=PurchaseRequest.StrGrid.Cells[1,IntCount-1] then
            begin
              MessageBox(0,PChar('Item sudah dipilih'),'List Item',MB_OK or MB_ICONWARNING);
              Exit;
            end;
          end;
        end;
      IntRowCount:=PurchaseRequest.StrGrid.RowCount;
      PurchaseRequest.StrGrid.RowCount:=IntRowCount;
      with PurchaseRequest do begin
        rowcount2:=StrGrid.RowCount;
        StrGrid.Cells[0,StrGrid.RowCount-1]:=IntToStr(StrGrid.RowCount-1);
        StrGrid.Cells[1,StrGrid.RowCount-1]:=StrPartName;
        StrGrid.Cells[2,StrGrid.RowCount-1]:='1';
        StrGrid.Cells[5,StrGrid.RowCount-1]:=kode_part_gp;
        StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
        StrGrid.CellStyle[1,StrGrid.RowCount-1].HorizontalAlignment:=taLeftJustify;
        StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
        //ItemDetailExit(nil);
        StrGrid.Col:=3;
        StrGrid.RowCount := StrGrid.RowCount+1
       end;
      close;
    end else begin
      if Main.IsFormOpen('Part')=False then
        begin
          Part:=TPart.Create(Self);
          Part.KodePart.Text:=StrGrid.Cells[1,IntRow];
          Part.PartName.Text:=StrGrid.Cells[2,IntRow];
          Part.KmStandardPergantian.Text:=StrGrid.Cells[3,IntRow];
          IDPart :=StrGrid.Cells[4,IntRow];
          StatusPart:='UPDATE';
        end;
      end;
  end;
end;

procedure TListParts.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TListParts.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

end.
