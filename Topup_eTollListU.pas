unit Topup_eTollListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, MD5, ADODB, ZColorStringGrid, WHUnit, Buttons,
  ComCtrls;

type
  TTopup_eTollList = class(TForm)
    Selesai: TButton;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Label2: TLabel;
    Cari: TEdit;
    Label3: TLabel;
    Tanggal: TDateTimePicker;
    Label6: TLabel;
    CekTglSampai: TCheckBox;
    TglSampai: TDateTimePicker;
    btnTombolCari: TSpeedButton;
    Refresh: TButton;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshClick(Sender: TObject);
    procedure btnTombolCariClick(Sender: TObject);
    procedure CekTglSampaiClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    EtollArr:Array of TArrString7;

    FormRequest:String;
    IntRow:Integer;
    procedure Init;
    procedure InitGrid;

    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure Search;

    procedure PopulateStringGrid(Grid: TZColorStringGrid; const FileName: string);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  Topup_eTollList: TTopup_eTollList;
  Row:Integer;
implementation

{$R *.dfm}

Uses MainU,AddUserU,UserFormU, DB, UserSignatureU, EtollFormU, TopUpETollFormU;

constructor TTopup_eTollList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: eTollList='+Form_Request,1);

  inherited Create(AOwner);
end;

procedure TTopup_eTollList.RefreshCombo;
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

procedure TTopup_eTollList.Search;
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    Count5 := 1;
    for Count:=0 to Length(EtollArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do begin
          if (StrPos(PChar(UpperCase(EtollArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      end;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=1 to 7 do begin
            StrGrid.Cells[0, Count2]:=IntToStr(Count5);
            StrGrid.Cells[Count4,Count2]:=EtollArr[Count][Count4];
          end;
          //StrGrid.CellStyle[8,Count2].WordWrap:=False;
          Inc(Count2);
          StrGrid.CellStyle[1, Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[2, Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[3, Count2-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[1, Count2-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[6, Count2-1].HorizontalAlignment:=taRightJustify;
          Inc(Count5);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TTopup_eTollList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=8;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Etoll';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Jam';
  StrGrid.Cells[4,0]:='No Surat Jalan';
  StrGrid.Cells[5,0]:='Driver';
  StrGrid.Cells[6,0]:='Nilai Topup';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=115;
  StrGrid.ColWidths[2]:=65;
  StrGrid.ColWidths[3]:=55;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=125;
  StrGrid.ColWidths[6]:=65;
  StrGrid.ColWidths[7]:=0;

  for IntCount:=0 to 7 do StrGrid.Cells[IntCount,1]:='';
end;

procedure TTopup_eTollList.RefreshData;
var StrQry,StrTanggal,StrLocation,StrCompany,StrToDates:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  SetLength(EtollArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;

    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    StrTanggal := ','+QuotedStr(FormatDateTime('dd-mm-yyyy',Tanggal.Date));
    if CekTglSampai.Checked=True then StrToDates:=',@ToDates='+QuotedStr(FormatDateTime('dd-mm-yyyy',TglSampai.Date));

    StrQry:='EXEC GetEtollTopupList '+StrLocation+','+StrCompany+StrTanggal+StrToDates+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(EtollArr,IntCount+1);
       EtollArr[IntCount][1]:=Qry.FieldValues['etoll_number'];
       EtollArr[IntCount][2]:=Qry.FieldValues['trx_date'];
       EtollArr[IntCount][3]:=Qry.FieldValues['trx_time'];
       EtollArr[IntCount][4]:=VarToStr(Qry.FieldValues['vhc_trans_id']);
       EtollArr[IntCount][5]:=VarToStr(Qry.FieldValues['employee_name']);
       EtollArr[IntCount][6]:=Qry.FieldValues['amount'];
       EtollArr[IntCount][7]:=VarToStr(Qry.FieldValues['id_etoll_trx']);
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TTopup_eTollList.RefreshGrid;
var Count,Count2:Integer;
begin
  StrGrid.RowCount:=Length(EtollArr)+1;
  for Count:=0 to Length(EtollArr)-1 do begin
    StrGrid.Cells[0,Count+1]:=IntToStr(Count+1);
    StrGrid.Cells[1,Count+1]:=eToll(EtollArr[Count][1]);
    StrGrid.Cells[2,Count+1]:=EtollArr[Count][2];
    StrGrid.Cells[3,Count+1]:=EtollArr[Count][3];
    StrGrid.Cells[4,Count+1]:=EtollArr[Count][4];
    StrGrid.Cells[5,Count+1]:=EtollArr[Count][5];
    StrGrid.Cells[6,Count+1]:=SToCurr(EtollArr[Count][6]);
    StrGrid.Cells[7,Count+1]:=EtollArr[Count][7];
    StrGrid.CellStyle[2, Count+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[3, Count+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[1, Count+1].HorizontalAlignment:=taLeftJustify;
    StrGrid.CellStyle[6, Count+1].HorizontalAlignment:=taRightJustify;
  end;
end;

procedure TTopup_eTollList.Init;
begin
  Cari.Text:='';
  InitGrid;
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();  
  SBU.Items.Clear;
  SBU.Text:='';
  SBU.ItemIndex:=0;

  CekTglSampai.Checked:=False;
  TglSampai.Enabled:=False;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TTopup_eTollList.SelesaiClick(Sender: TObject);
begin
  Topup_eTollList.Close;
end;

procedure TTopup_eTollList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTopup_eTollList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Row:=ARow;
  IntRow:=ARow;
end;

procedure TTopup_eTollList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Topup_eTollList.Close;

end;

procedure TTopup_eTollList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin

end;

procedure TTopup_eTollList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;

end;

procedure TTopup_eTollList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

procedure TTopup_eTollList.PopulateStringGrid(Grid: TZColorStringGrid; const FileName: string);
var
  TextFile, Line: TStringList;
  Row,Col: Integer;
begin
  Grid.RowCount := 0;//clear any previous data
  TextFile := TStringList.Create;
  try
    Line := TStringList.Create;
    try
      SetLength(EtollArr, 0);
      Line.Delimiter := ',';
      TextFile.LoadFromFile(FileName);
      Grid.RowCount := TextFile.Count;

      SetLength(EtollArr, Grid.RowCount);

      for Row := 1 to TextFile.Count-1 do
      begin
        Grid.CellStyle[1, Row].Font.Color:=clBlack;
        if Row>0 Then Grid.Cells[0, Row] := IntToStr(Row);
        Line.DelimitedText := TextFile[Row];
        Grid.ColCount:= Line.Count+1;
        for Col := 0 to Grid.ColCount-1 do begin
          if Col<Line.Count then begin
            Grid.Cells[Col+1, Row] := Line[Col];
            //EtollArr[Row-1][Col]:=Line[Col];
          end else begin
            Grid.Cells[Col+1, Row] := '0';
            //EtollArr[Row-1][Col]:='0';
          end;

          if (Col=0) then begin
            if CekNoEToll(Line[Col])='x' then begin
              Grid.CellStyle[1, Row].Font.Color:=clRed;
            end;
          end;
        end;
      end;
    finally
      Line.Free;
    end;
  finally
    TextFile.Free;
  end;
end;

procedure TTopup_eTollList.RefreshClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TTopup_eTollList.btnTombolCariClick(Sender: TObject);
begin
  if Trim(Cari.Text)<>'' then begin
    Search;
  end;
end;

procedure TTopup_eTollList.CekTglSampaiClick(Sender: TObject);
begin
    if CekTglSampai.Checked=True then TglSampai.Enabled:=True
    else TglSampai.Enabled:=False;
end;

procedure TTopup_eTollList.StrGridDblClick(Sender: TObject);
begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('TopUpETollForm')=False) then
            TopUpETollForm:=TTopUpETollForm.Create(nil,StrGrid.Cells[7,IntRow],True);
            
         // end else MessageBox(0,'Kendaraan Sudah Keluar','Surat Jalan',MB_OK or MB_ICONERROR);
      end;
end;

procedure TTopup_eTollList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

end.
