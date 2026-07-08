unit TroubleshootingRequestFormListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ComCtrls, Buttons;

type
  TTroubleshootingRequestFormList = class(TForm)
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    GroupCompany: TGroupBox;
    Label2: TLabel;
    Departemen: TComboBox;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    lbl1: TLabel;
    Tanggal2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Cari: TEdit;
    Search: TSpeedButton;
    ToXCel: TSpeedButton;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    cb_jenis_truouble: TComboBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    cb_status: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure RefreshDepartemen;
    procedure SearchClick(Sender: TObject);
    procedure DepartemenChange(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure Tanggal2Change(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;

    procedure AskDelete(UserGrpTreeMenuId:String);
    procedure AutoSizeStringGridRows(Grid: TZColorStringGrid);
    procedure SesuaikanTinggiBaris(Grid: TZColorStringGrid);
    procedure AktifkanWordWrap(Grid: TZColorStringGrid);
   

  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;

    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  TroubleshootingRequestFormList: TTroubleshootingRequestFormList;
  TRFArr:Array of TArrString14;
  IntRow, IntCol:Integer;

implementation

uses MainU, ADODB, UserGroupTreeMenuU, StrUtils, TechnicalRecommendationU,
  TechnicalRecommendationListU, TroubleshootingRequestFormU;

{$R *.dfm}
constructor TTroubleshootingRequestFormList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;


procedure TTroubleshootingRequestFormList.Init;
var IntCount:Integer;
begin
  //StrGrid.RowCount:=7;
  StrGrid.ColWidths[0]:=110;
  StrGrid.ColWidths[1]:=130;
  StrGrid.ColWidths[2]:=130;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=400;
  StrGrid.ColWidths[6]:=200;
  StrGrid.ColWidths[7]:=100;

  StrGrid.Cells[0,0]:='Nomor';
  StrGrid.Cells[1,0]:='Tanggal Permintaan';
  StrGrid.Cells[2,0]:='Tanggal Selesai';
  StrGrid.Cells[3,0]:='Jenis Permintaan';
  StrGrid.Cells[4,0]:='User / Requestor';
  StrGrid.Cells[5,0]:='Detail';
  StrGrid.Cells[7,0]:='Tindakan';
  StrGrid.Cells[7,0]:='PIC';

  StrGrid.CellStyle[0,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment := taCenter;

  StrGrid.CellStyle[0,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[1,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[2,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[3,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[4,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[5,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[6,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[7,0].BGColor:=clSkyBlue;
  
  StrGrid.WordWrap:=True;
  for IntCount:=0 to 7 do
    StrGrid.Cells[IntCount,1]:='';

end;

procedure TTroubleshootingRequestFormList.LoadData;
var Qry:TADOQuery;
    StrQry, StrTgl,StrDepartemenId, StrType,StrStatus:String;
    IntCount:Integer;
    TanggalSaja, WaktuSaja: TDateTime;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrTgl := QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date))+',@ToDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal2.Date));

    for IntCount:=0 to Length(DepartemenArr)-1 do
      if DepartemenArr[IntCount][1]=Departemen.Text then StrDepartemenId:=DepartemenArr[IntCount][0];

    // MessageBox(0,PChar(StrDepartemenId),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
      if cb_jenis_truouble.Text <> 'ALL' then begin
         StrType := ',@Type ='+QuotedStr(cb_jenis_truouble.Text);
      end else  StrType := '';

  // MessageBox(0,PChar(StrDepartemenId),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
      if cb_status.Text <> 'ALL' then begin
         StrStatus := ',@Status ='+QuotedStr(cb_status.Text);
      end else  StrStatus := '';

    StrQry:= 'EXEC GetTroubleshootingList  @FromDate='+StrTgl+StrType+StrStatus+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    //if Qry.RecordCount>0 then begin
      SetLength(TRFArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        TRFArr[IntCount][0]:=Qry.FieldValues['trf_no'];
        TRFArr[IntCount][1]:=FormatDateTime('dd/MM/yyyy HH:mm',Qry.FieldValues['request_date']);
        TRFArr[IntCount][2]:=FormatDateTime('dd/MM/yyyy HH:mm',Qry.FieldValues['completion_date']);
        //TRFArr[IntCount][1]:=Qry.FieldValues['request_date'];
        //TRFArr[IntCount][2]:=Qry.FieldValues['completion_date'];
        TRFArr[IntCount][3]:=Qry.FieldValues['type'];
        TRFArr[IntCount][4]:=Qry.FieldValues['name'];
        TRFArr[IntCount][5]:=Qry.FieldValues['detail_troubles'];
        TRFArr[IntCount][6]:=Qry.FieldValues['action'];
        TRFArr[IntCount][7]:=Qry.FieldValues['nama_pic'];
        TRFArr[IntCount][8]:=Qry.FieldValues['status'];
        Inc(IntCount);
        Qry.Next;
      end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;

procedure TTroubleshootingRequestFormList.RefreshList;
var IntCount, IntCount2:Integer;
begin
  StrGrid.RowCount:=Length(TRFArr)+1;
  for IntCount:=0 to Length(TRFArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=TRFArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=TRFArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=TRFArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=TRFArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=TRFArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=TRFArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=TRFArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=TRFArr[IntCount][7];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment :=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment :=taCenter;
    StrGrid.CellStyle[2,IntCount+1].HorizontalAlignment :=taCenter;


    if TRFArr[IntCount][8]='2' then
    //if StrTimeOut <> '' then begin
    begin
     for IntCount2:=0 to StrGrid.ColCount-1 do
     StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clGreen;
    end else begin
      for IntCount2:=0 to StrGrid.ColCount-1 do
      StrGrid.CellStyle[IntCount2,IntCount+1].Font.Color:=clWindowText;
    end;

    AktifkanWordWrap(StrGrid);
    SesuaikanTinggiBaris(StrGrid);

   // for IntCount2:=0 to StrGrid.ColCount-1 do
   //     StrGrid.CellStyle[IntCount2,IntCount+1].WordWrap := True;

   // for c := 0 to StrGrid.ColCount - 1 do
    //  StrGrid.CellStyle[c, r].WordWrap := True;

    //StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment :=taRightJustify;
     // StrGrid.DefaultRowHeight := 45;
  end;



end;

procedure TTroubleshootingRequestFormList.AutoSizeStringGridRows(Grid: TZColorStringGrid);
var
  Row, Col, H: Integer;
  TempHeight: Integer;
begin
  for Row := 0 to Grid.RowCount - 1 do
  begin
    TempHeight := Grid.DefaultRowHeight;
    for Col := 0 to Grid.ColCount - 1 do
    begin
      H := Grid.Canvas.TextHeight(Grid.Cells[Col, Row]) + 6;
      if H > TempHeight then
        TempHeight := H;
    end;
    Grid.RowHeights[Row] := TempHeight;
  end;
end;

procedure TTroubleshootingRequestFormList.AktifkanWordWrap(Grid: TZColorStringGrid);
var
  c, r: Integer;
begin
  for r := 0 to Grid.RowCount - 1 do
    for c := 0 to Grid.ColCount - 1 do
      Grid.CellStyle[c, r].WordWrap := True;
end;

procedure TTroubleshootingRequestFormList.SesuaikanTinggiBaris(Grid: TZColorStringGrid);
var
  c, IntR, MaxHeight, TextH: Integer;
  S: string;
  R: TRect;             // gunakan nama lain, bukan "Rect"
  SaveFont: TFont;
begin
  // Pastikan canvas pakai font yang sama dengan sel (jika perlu)
  SaveFont := TFont.Create;
  try
    SaveFont.Assign(Grid.Canvas.Font);

    for IntR := 0 to Grid.RowCount - 1 do
    begin
      MaxHeight := Grid.DefaultRowHeight;
      for c := 0 to Grid.ColCount - 1 do
      begin
        S := Grid.Cells[c, IntR];

        // siapkan rect untuk lebar kolom - sedikit margin
        R := Rect(0, 0, Grid.ColWidths[c] - 6, 0);

        // jika tiap sel punya style font berbeda, set Canvas.Font sesuai style di sini
        // Grid.Canvas.Font.Assign(Grid.CellStyle[c, r].Font); // uncomment kalau perlu

        // hitung tinggi teks multiline tanpa menggambar
        TextH := DrawText(Grid.Canvas.Handle, PChar(S), Length(S), R,
                          DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);

        // tambahkan sedikit padding vertikal
        if TextH + 2 > MaxHeight then
          MaxHeight := TextH + 2;
      end;

      // atur tinggi baris
      Grid.RowHeights[IntR] := MaxHeight;
    end;

  finally
    SaveFont.Free;
  end;
end;

procedure TTroubleshootingRequestFormList.AskDelete(UserGrpTreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
 { if (Trim(UserGrpTreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('User Group Tree Menu Id '+UserGrpTreeMenuId+' Mau Dihapus ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_user_grp_tree_sub_menu WHERE user_grp_tree_sub_menu_id='+Chr(39)+UserGrpTreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','User Group Tree Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Group Tree Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;  }
end;


procedure TTroubleshootingRequestFormList.SelesaiClick(Sender: TObject);
begin
  TroubleshootingRequestFormList.Close;
end;

procedure TTroubleshootingRequestFormList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTroubleshootingRequestFormList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  RefreshDepartemen;
  Departemen.ItemIndex := 0;
  Tanggal.date:=NOW();
  Tanggal2.date:=NOW();
  Init;
  LoadData;
  RefreshList;
end;

procedure TTroubleshootingRequestFormList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(TechnicalRecomArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(TechnicalRecomArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 6 do
          StrGrid.Cells[Count4,Count2-1]:=TechnicalRecomArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TTroubleshootingRequestFormList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTroubleshootingRequestFormList.StrGridDblClick(Sender: TObject);
var
  StrTRFID : string;
begin
  if StrGrid.Cells[0,IntRow]<>'' then
  begin
    StrTRFID := StrGrid.Cells[0,IntRow];
    if Main.IsFormOpen('TroubleshootingRequestForm')=False then
      TroubleshootingRequestForm:=TTroubleshootingRequestForm.Create(Self,StrTRFID);
   // MessageBox(0,PChar(FormRequest),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
  {  if FormRequest='' then begin
       if Main.IsFormOpen('TechnicalRecommendation')=False then
      TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow]);
    end else if FormRequest='COPY_DATA' then
    begin
      TechnicalRecommendation.CopyTechnicalRecommendation(StrTechnicalID);
      Close;
     end; }
  end;
   { if (RightStr(IntToStr(TreeTag),2)='04') then TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow],True)
    else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
    else TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow]); }
end;

procedure TTroubleshootingRequestFormList.RefreshDepartemen;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(DepartemenArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT 0 AS department_id, ''All'' AS name UNION ALL SELECT department_id,name FROM wh_department WHERE active =1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(DepartemenArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        DepartemenArr[IntCount][0]:=Qry.FieldValues['department_id'];
        DepartemenArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

  if StrLastDepartemenId<>'' then begin
    SetLength(DepartemenArr,Length(DepartemenArr)+1);
    DepartemenArr[Length(DepartemenArr)-1][0]:=StrLastDepartemenId;
    DepartemenArr[Length(DepartemenArr)-1][1]:=StrLastDepartemen;
  end;
  for IntCount:=0 to Length(DepartemenArr)-1 do
    Departemen.Items.Add(DepartemenArr[IntCount][1]);
end;

procedure TTroubleshootingRequestFormList.SearchClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TTroubleshootingRequestFormList.DepartemenChange(Sender: TObject);
begin
  //LoadData;
 // RefreshList;
end;

procedure TTroubleshootingRequestFormList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date > Tanggal2.Date then
    Tanggal2.Date := Tanggal.Date;
  //LoadData;
  //RefreshList;
end;

procedure TTroubleshootingRequestFormList.Tanggal2Change(Sender: TObject);
begin
    if Tanggal2.DateTime < Tanggal.DateTime then
    Tanggal.Date := Tanggal2.Date;
end;

procedure TTroubleshootingRequestFormList.ToXCelClick(Sender: TObject);
begin
 if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

end.
