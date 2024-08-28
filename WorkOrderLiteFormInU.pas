unit WorkOrderLiteFormInU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, Mask, ComCtrls,
  ExtCtrls;

type
  TWorkOrderLiteFormIn = class(TForm)
    NoPKB: TComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupDetail: TGroupBox;
    StrGrid: TStringGrid;
    Cari: TEdit;
    Label7: TLabel;
    KeluhanGrid: TStringGrid;
    Label8: TLabel;
    GroupPekerjaan: TGroupBox;
    PekerjaanGrid: TStringGrid;
    PekerjaanDetail: TEdit;
    Teknisi: TEdit;
    TombolCari: TSpeedButton;
    Label6: TLabel;
    Label9: TLabel;
    TanggalSelesai: TDateTimePicker;
    JamSelesai: TMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Tanggal: TEdit;
    Jam: TEdit;
    Label3: TLabel;
    NoBody: TEdit;
    NoPolisi: TEdit;
    Label5: TLabel;
    GroupParts: TGroupBox;
    PartsGrid: TStringGrid;
    PartsDetail: TEdit;
    PartsName: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NoPKBChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridClick(Sender: TObject);
    procedure PekerjaanGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PekerjaanDetailExit(Sender: TObject);
    procedure PekerjaanDetailKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SimpanClick(Sender: TObject);
    procedure TeknisiExit(Sender: TObject);
    procedure TeknisiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TeknisiKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure PartsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    WOArr:Array of TArrString7;
    WorkOrderId,FormRequest:String;
    IsReadOnly,Initiation:Boolean;
    IntArow,IntPCol,IntPRow:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshList;
    procedure EnableInput;
    procedure DisableInput;
    procedure LoadData;
    procedure Search;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure SetWODetail(WorkOrderId:String);
  end;

var
  WorkOrderLiteFormIn: TWorkOrderLiteFormIn;

implementation

uses MainU, DateUtils;

{$R *.dfm}

constructor TWorkOrderLiteFormIn.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TWorkOrderLiteFormIn.Init;
begin
  NoPKB.Text:='';
  NoPKB.Items.Clear;
  NoPKB.ItemIndex:=0;
  Tanggal.Text:='';
  TanggalSelesai.Date:=Now();
  Jam.Text:='';
  JamSelesai.Text:=FormatDateTime('hh:nn',Now());
  NoBody.Text:='';
  NoPolisi.Text:='';
  KeluhanGrid.RowCount:=1;
  KeluhanGrid.Cells[0,0]:='';
  PekerjaanDetail.Text:='';
  PekerjaanDetail.Visible:=False;
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Odo Msk';
  StrGrid.Cells[4,0]:='Tanggal Msk';
  StrGrid.Cells[5,0]:='Pekerjaan';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  PekerjaanGrid.RowCount:=2;
  PekerjaanGrid.Cells[0,0]:='           Pekerjaan';
  PekerjaanGrid.Cells[1,0]:='    Teknisi';
  PekerjaanGrid.Cells[0,1]:='';
  PekerjaanGrid.Cells[1,1]:='';
  NoPKB.SetFocus;
end;

procedure TWorkOrderLiteFormIn.RefreshCombo;
var IntCount:Integer;
begin
end;

procedure TWorkOrderLiteFormIn.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then begin
      NoPKB.Items.Add(Qry.FieldValues['work_order_id']);
      NoPKB.ItemIndex:=NoPKB.Items.IndexOf(Qry.FieldValues['work_order_id']);
      NoBody.Text:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      Tanggal.Text:=Qry.FieldValues['date_in'];
      Jam.Text:=Qry.FieldValues['time_in'];
      TanggalSelesai.Date:=StrToDate(Qry.FieldValues['date_out']);
      if Qry.FieldValues['time_out']<>NULL then JamSelesai.Text:=Qry.FieldValues['time_out'];
    end;
    Qry.Close;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+',1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
      KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if PekerjaanGrid.RowCount<IntCount+1 then PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,IntCount+1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TWorkOrderLiteFormIn.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      WOArr[IntCount][3]:=Qry.FieldValues['odo_in'];
      WOArr[IntCount][4]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][5]:=Qry.FieldValues['time_in'];
      WOArr[IntCount][6]:=Qry.FieldValues['job_inout'];
      WOArr[IntCount][7]:=Qry.FieldValues['vehicle_id'];
      Qry.Next;
      Inc(IntCount);
    end;
{    StrQry:='SELECT a.work_order_id,b.description FROM wh_work_order_lite a '+
            ' LEFT JOIN wh_work_order_lite_detail b ON b.work_order_id=a.work_order_id'+
            ' WHERE (a.time_out IS NULL) AND (a.date_out IS NULL) AND (b.description_id=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WODetArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WODetArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WODetArr[IntCount][1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
}
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TWorkOrderLiteFormIn.RefreshList;
var IntCount:Integer;
begin
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=WOArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=WOArr[IntCount][6];
  end;
  for IntCount:=0 to Length(WOArr)-1 do NoPKB.Items.Add(WOArr[IntCount][0]);
end;

procedure TWorkOrderLiteFormIn.EnableInput;
begin
  NoPKB.Enabled:=True;
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;
  GroupPekerjaan.Enabled:=True;
end;

procedure TWorkOrderLiteFormIn.DisableInput;
begin
  NoPKB.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
  GroupPekerjaan.Enabled:=False;
end;

procedure TWorkOrderLiteFormIn.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TWorkOrderLiteFormIn.FormShow(Sender: TObject);
begin
  Init;
  Cari.Text:=''; 
  EnableInput;
  if IsReadOnly then begin
    LoadData;
    DisableInput;
  end else begin
    RefreshCombo;
    RefreshData;
    RefreshList;
  end;
end;

procedure TWorkOrderLiteFormIn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TWorkOrderLiteFormIn.SetWODetail(WorkOrderId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntRow:Integer;
begin
  if WorkOrderId<>'' then begin
    {
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    NoBody.Text:=WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=WOArr[NoPKB.ItemIndex][5];
    }
    NoBody.Text:=StrGrid.Cells[1,IntARow];//WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=StrGrid.Cells[2,IntARow];//WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=StrGrid.Cells[4,IntARow];//WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=StrGrid.Cells[5,IntARow];//WOArr[NoPKB.ItemIndex][5];

    KeluhanGrid.RowCount:=1;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if KeluhanGrid.RowCount<IntCount+1 then KeluhanGrid.RowCount:=KeluhanGrid.RowCount+1;
        KeluhanGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;



end;

procedure TWorkOrderLiteFormIn.NoPKBChange(Sender: TObject);
begin
  SetWODetail(NoPKB.Text);
end;

procedure TWorkOrderLiteFormIn.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntArow:=Arow;
end;

procedure TWorkOrderLiteFormIn.StrGridClick(Sender: TObject);
begin
  NoPKB.ItemIndex:=NoPKB.Items.IndexOf(StrGrid.Cells[0,IntARow]);
  SetWODetail(StrGrid.Cells[0,IntARow]);
end;

procedure TWorkOrderLiteFormIn.PekerjaanGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ARow>0) and not(IsReadOnly) then begin
    if (ACol = 0) then begin
      R := PekerjaanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PekerjaanGrid.Left;
      R.Right := R.Right + PekerjaanGrid.Left;
      R.Top := R.Top + PekerjaanGrid.Top;
      R.Bottom := R.Bottom + PekerjaanGrid.Top;
      with PekerjaanDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        BringToFront;
        SetFocus;
        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then PekerjaanDetail.Text:=PekerjaanGrid.Cells[ACol,ARow];
      end;
    end;
    if (ACol = 1) then begin
      R := PekerjaanGrid.CellRect(ACol, ARow);
      R.Left := R.Left + PekerjaanGrid.Left;
      R.Right := R.Right + PekerjaanGrid.Left;
      R.Top := R.Top + PekerjaanGrid.Top;
      R.Bottom := R.Bottom + PekerjaanGrid.Top;
      with Teknisi do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        BringToFront;
        SetFocus;
        if Trim(PekerjaanGrid.Cells[ACol,ARow])<>'' then Teknisi.Text:=PekerjaanGrid.Cells[ACol,ARow];
      end;
    end;
  end;
end;

procedure TWorkOrderLiteFormIn.PekerjaanDetailExit(Sender: TObject);
begin
  if Trim(PekerjaanDetail.Text)<>'' then PekerjaanGrid.Cells[0,PekerjaanGrid.Row]:=PekerjaanDetail.Text;
  PekerjaanDetail.Visible := False;
  PekerjaanDetail.Text:='';
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderLiteFormIn.PekerjaanDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    PekerjaanDetailExit(nil);
{    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
}    PekerjaanGrid.Col:=1;
//    PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    Teknisi.SetFocus;
  end;
  if (Key=#27) then begin
    PekerjaanDetailExit(nil);
  end;
end;

procedure TWorkOrderLiteFormIn.BersihkanClick(Sender: TObject);
begin
  EnableInput;
  Init;
  RefreshData;
  RefreshList;
  RefreshCombo;
end;

procedure TWorkOrderLiteFormIn.PekerjaanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=38 then begin
    if PekerjaanGrid.Row>0 then begin
      PekerjaanDetailExit(nil);
      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
    end;
  end;
  if Key=39 then begin
      PekerjaanDetailExit(nil);
      PekerjaanGrid.Col:=1;
  end;
  if Key=40 then begin
    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
      PekerjaanDetailExit(nil);
      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    end;
  end
end;

procedure TWorkOrderLiteFormIn.TeknisiExit(Sender: TObject);
begin
  if Trim(Teknisi.Text)<>'' then PekerjaanGrid.Cells[1,PekerjaanGrid.Row]:=Teknisi.Text;
  Teknisi.Visible := False;
  Teknisi.Text:='';
  PekerjaanGrid.SetFocus;
end;

procedure TWorkOrderLiteFormIn.TeknisiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=37 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=0;
      PekerjaanGrid.Row:=PekerjaanGrid.Row;  
  end;
  if Key=38 then begin
    if PekerjaanGrid.Row>0 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Row:=PekerjaanGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if PekerjaanGrid.Row<PekerjaanGrid.RowCount-1 then begin
      TeknisiExit(nil);
      PekerjaanGrid.Col:=1;
      PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    end;
  end
end;

procedure TWorkOrderLiteFormIn.TeknisiKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    TeknisiExit(nil);
    if PekerjaanGrid.Row=PekerjaanGrid.RowCount-1 then begin
      PekerjaanGrid.RowCount:=PekerjaanGrid.RowCount+1;
      PekerjaanGrid.Cells[0,PekerjaanGrid.RowCount]:='';
    end;
    PekerjaanGrid.Row:=PekerjaanGrid.Row+1;
    PekerjaanGrid.Col:=0;
    PekerjaanDetail.SetFocus;
  end;
  if (Key=#27) then begin
    TeknisiExit(nil);
  end;
end;

procedure TWorkOrderLiteFormIn.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId,StrVhcId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (NoPKB.Text<>'') AND (Trim(PekerjaanGrid.Cells[0,0])<>'') then begin
    StrTransId:=NoPKB.Text;
    StrVhcId:=WOArr[ArrayIndexOf(WOArr,NoPKB.Text,0)][7];
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrMsg:='';
      StrEMsg:='';
      StrQry:='';
      if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
        IsOk:=False;
        StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk'
      end;
      Main.TransStart;
      StrQry:='UPDATE wh_work_order_lite SET date_out='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalSelesai.Date))+
              ',time_out='+QuotedStr(JamSelesai.Text+':00')+',status=2 WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+';';
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      for IntCount:=1 to PekerjaanGrid.RowCount-1 do begin
        if Trim(PekerjaanGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_work_order_lite_detail (work_order_id,description_id'+
                ',description,technician,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',2'+
                ','+Chr(39)+PekerjaanGrid.Cells[0,IntCount]+Chr(39)+
                ','+Chr(39)+PekerjaanGrid.Cells[1,IntCount]+Chr(39)+
                ','+Chr(39)+User+Chr(39)+'); ';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Detail Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      StrQry:='DELETE wh_vhc_hold WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        MessageBox(0,'PKB berhasil ditutup','Tutup PKB',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        if StrMsg<>'' then StrMsg:=StrMsg+Chr(13)+Chr(13);
        MessageBox(0,PChar(StrMsg+'Kesalahan'+Chr(13)+StrEMsg),'Tutup PKB',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
  end else
    MessageBox(0,'Silahkan isi kolom data yg kosong','Tutup PKB',MB_OK or MB_ICONERROR);
end;

procedure TWorkOrderLiteFormIn.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(WOArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(WOArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[0,Count2-1]:=WOArr[Count][0];
          StrGrid.Cells[1,Count2-1]:=WOArr[Count][1];
          StrGrid.Cells[2,Count2-1]:=WOArr[Count][2];
          StrGrid.Cells[3,Count2-1]:=WOArr[Count][3];
          StrGrid.Cells[4,Count2-1]:=WOArr[Count][4];
          StrGrid.Cells[5,Count2-1]:=WOArr[Count][6];
          NoPKB.Items.Add(WOArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TWorkOrderLiteFormIn.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search; 
end;

procedure TWorkOrderLiteFormIn.TombolCariClick(Sender: TObject);
begin
  Search;
  RefreshCombo;
end;

procedure TWorkOrderLiteFormIn.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshList;
    RefreshCombo;
  end;
end;

procedure TWorkOrderLiteFormIn.PartsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntPRow:=ARow;
  IntPCOl:=ACol;
end;

end.
