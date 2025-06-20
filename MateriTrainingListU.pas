unit MateriTrainingListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, AdoDB;

type
  TMateriTrainingList = class(TForm)
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupTotal: TGroupBox;
    Total: TMemo;
    Cari: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Tambah: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TambahClick(Sender: TObject);
  private
    { Private declarations }
    MateriArr:Array of TArrString2;
    FormRequest:String;
    IntCol,IntRow:Integer;

    procedure InitGrid;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    procedure RefreshData;
    procedure RefreshGrid;
  end;

var
  MateriTrainingList: TMateriTrainingList;

implementation

uses MainU, EmployeeHistoryTrainingFormU, EmployeeHistoryTrainingRptU, 
  MateriTrainingFormU;

{$R *.dfm}

constructor TMateriTrainingList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ListParts='+Form_Request);
  Inherited Create(AOwner);
end;

procedure TMateriTrainingList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.ColCount:=2;
  StrGrid.RowCount:=1;
  StrGrid.WordWrap:=True;
  StrGrid.ColWidths[0]:=700;
  StrGrid.ColWidths[1]:=0;

  StrGrid.Cells[0,0]:='Materi';

  for IntCount:=0 to StrGrid.ColCount-1 do
  begin
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  end;

  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TMateriTrainingList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrReq:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Main.M_Busy;

  if Main.OpenDb then begin
    SetLength(MateriArr,0);
    StrQry:='SELECT * from wh_materi_training where status=1 order by materi ASC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(MateriArr,IntCount+1);
      MateriArr[IntCount][0]:= Qry.FieldValues['materi_training_id'] ;
      MateriArr[IntCount][1]:= Qry.FieldValues['materi'] ;
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;

  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TMateriTrainingList.RefreshGrid;
var IntCount,IntTotal,lengt:Integer;
begin
  if Length(MateriArr)>0 then StrGrid.RowCount:=Length(MateriArr)+1
  else begin
    StrGrid.RowCount:=1;
  end;

  IntTotal:=0;
  lengt:= Length(MateriArr)-1;
  for IntCount:=0 to Length(MateriArr)-1 do begin
    Application.ProcessMessages;
    StrGrid.Cells[0,IntCount+1]:=MateriArr[IntCount][1];
    StrGrid.Cells[1,IntCount+1]:=MateriArr[IntCount][0];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taLeftJustify;
    Inc(IntTotal);
  end;
  Total.Text:=IntToStr(IntTotal);
end;


procedure TMateriTrainingList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMateriTrainingList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TMateriTrainingList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  InitGrid;
  RefreshData;
  RefreshGrid;
  Cari.SetFocus;
end;

procedure TMateriTrainingList.Search;
var Count,Count2,Count3,Count4,IntCount5,IntCount2:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Main.M_Busy;
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(MateriArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 1 do
      if (StrPos(PChar(UpperCase(MateriArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        StrGrid.RowCount:=Count2+1;
        StrGrid.Cells[0,Count2]:=MateriArr[Count][1];
        StrGrid.Cells[1,Count2]:=MateriArr[Count][0];
        for IntCount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,Count2].Font.Color:=clWindowText;
        Inc(Count2);
      end;
    end;
    Main.M_Normal;
  end;
end;

procedure TMateriTrainingList.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshData;
    RefreshGrid;
  end else
  begin
    Search;
  end;
end;

procedure TMateriTrainingList.StrGridDblClick(Sender: TObject);
begin
  if (IntRow>0) then
  begin
    if FormRequest='EMPLOYETRAINING' then begin
      EmployeeHistoryTrainingForm.Materi.Text:=StrGrid.Cells[0,IntRow];
      MateriTrainingID:=StrGrid.Cells[1,IntRow];
      Close;
    end else if FormRequest='EMPLOYETRAININGRPT' then begin
      EmplHistoryTrainingRpt.Materi.Text:=StrGrid.Cells[0,IntRow];
      Close;
    end else if FormRequest='LIST-MATERITRAINING' then begin
      if Main.IsFormOpen('MateriTrainingForm')=False then MateriTrainingForm:=TMateriTrainingForm.Create(Self,'UPDATE-MATERITRAINING');
      MateriTrainingForm.Materi.Text:=StrGrid.Cells[0,IntRow];
      MateriTrainingIDFORM:=StrGrid.Cells[1,IntRow];
    end;
  end;
end;

procedure TMateriTrainingList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntCol:=ACol;
  IntRow:=ARow;
end;

procedure TMateriTrainingList.TambahClick(Sender: TObject);
begin
  if Main.IsFormOpen('MateriTrainingForm')=False then MateriTrainingForm:=TMateriTrainingForm.Create(Self,'ADD-MATERITRAINING');
end;

end.
