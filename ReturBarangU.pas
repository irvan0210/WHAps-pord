unit ReturBarangU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, Buttons, ADODB, WHUnit;

type
  TReturBarang = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    CariPKB: TSpeedButton;
    Label2: TLabel;
    Selesai: TButton;
    Tanggal: TDateTimePicker;
    StrGrid: TZColorStringGrid;
    Qty: TEdit;
    Detail: TEdit;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    CheckSelect: TCheckBox;
    NoRetur: TEdit;
    NoPKB: TEdit;
    ItemDetail: TComboBox;
    Ket: TMemo;
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ItemDetailChange(Sender: TObject);
    procedure ItemDetailExit(Sender: TObject);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CariPKBClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
  private
    { Private declarations }
    IntRow, IntCol: Integer;
    PartArr:Array of TArrString16;

    procedure InitGrid;
    procedure RefreshPart;
    procedure Calculate;
  public
    { Public declarations }
    procedure Clear;
    constructor Create(AOwner:TComponent;ReturBarang_id:String='');Overload;
  end;

var
  ReturBarang: TReturBarang;
  var ReturBarangID : string;

implementation

uses MainU, WorkOrderListReturU;

{$R *.dfm}

constructor TReturBarang.Create(AOwner:TComponent;ReturBarang_id:String='');
begin
  ReturBarangID:=ReturBarang_id;
  Inherited Create(AOwner);
end;

procedure TReturBarang.Clear;
begin
  NoRetur.Text:='';
  Tanggal.Date:=Now();
  NoPKB.Text:='';
  Ket.Text:='';
  InitGrid;
end;

procedure TReturBarang.Calculate;
var IntCount,IntNum:Integer;
begin
  StrGrid.CellStyle[0,IntRow].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taCenter;
  IntNum:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do
    if (Trim(StrGrid.Cells[1,IntCount])<>'') and (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
    end else
      StrGrid.Cells[0,IntCount]:='';
end;

procedure TReturBarang.RefreshPart;
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntCount2:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    if NoPKB.Text<>'' then
    begin
      StrQry:='select id,part_name,qty from wh_work_order_part where work_order_id='+QuotedStr(NoPKB.Text)+' and status=1';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=1;
      SetLength(PartArr,Qry.RecordCount+1);
      for IntCount2:=0 to 8 do PartArr[0][IntCount2]:=' ';
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PartArr[IntCount][0]:=Qry.FieldValues['id'];
        PartArr[IntCount][1]:=Qry.FieldValues['part_name'];
        PartArr[IntCount][2]:=Qry.FieldValues['qty'];
        Qry.Next;
        Inc(IntCount)
      end;
      Qry.Close;
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ItemDetail.Items.Clear;
  for IntCount:=0 to Length(PartArr)-1 do
    ItemDetail.Items.Add(PartArr[IntCount][1]);
  Main.M_Normal;
end;


procedure TReturBarang.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=400;
  StrGrid.ColWidths[2]:=49;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Item';
  StrGrid.Cells[2,0]:='Qty';

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to 2 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;

end;


procedure TReturBarang.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
    if (ACol = 1) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;

      with ItemDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 2) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 4) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Detail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
end;

procedure TReturBarang.ItemDetailChange(Sender: TObject);
begin
  StrGrid.Cells[2,IntRow]:=PartArr[ItemDetail.ItemIndex][2];
end;

procedure TReturBarang.ItemDetailExit(Sender: TObject);
begin
  if Trim(ItemDetail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=ItemDetail.Text;
    Calculate;
    StrGrid.CellStyle[0,IntRow].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[2,IntRow].HorizontalAlignment:=taCenter;
  end;
  ItemDetail.Text:='';
  ItemDetail.Visible := False;
end;

procedure TReturBarang.QtyExit(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then begin
    StrGrid.Cells[2,IntRow]:=Qty.Text;
    Calculate;
  end;
  Qty.Text:='';
  Qty.Visible := False;
end;

procedure TReturBarang.QtyKeyPress(Sender: TObject; var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    Calculate;
    if (StrGrid.Row=StrGrid.RowCount-1)  then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
    end;
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:=1;
  end;
end;

procedure TReturBarang.BersihkanClick(Sender: TObject);
begin
  Clear;
end;

procedure TReturBarang.FormShow(Sender: TObject);
begin
  Clear;
end;

procedure TReturBarang.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(StrGrid.Cells[2,1])<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyId;
      StrLocationId:=LocationId;

      if NoRetur.Text='' then begin
        StrQry:='SELECT RIGHT(MAX(retur_part_id),4) AS retur_part_id FROM wh_retur_part WHERE retur_part_id '+
                'LIKE '+Chr(39)+'RTR'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['retur_part_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['retur_part_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
        StrTransId:='0001';
        StrTransId:='RTR'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;

        StrQry:='INSERT INTO wh_retur_part (retur_part_id,company_id,location_id,work_order_id'+
                ',note,submit_user,submit_date,update_user,status) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+QuotedStr(NoPKB.Text)+
                ','+QuotedStr(Ket.Text)+','+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+',1);';
      end else begin
        StrTransId:=NoRetur.Text;
//        if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
//        StrQry:='UPDATE wh_retur_part SET status=0 '+
//                ' WHERE wh_retur_part='+QuotedStr(NoRetur.Text)+';';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      StrQry:='';
//      if Batal.Checked=False then begin
        if Trim(NoRetur.Text)<>'' then begin

          StrQry:='UPDATE wh_retur_part_detail SET status=0 WHERE retur_part_id='+QuotedStr(StrTransId)+';';
        end;
        for IntCount:=1 to StrGrid.RowCount-1 do begin

          StrQry:=StrQry+' INSERT INTO wh_retur_part_detail (retur_part_id'+
                  ',part_name,qty) '+
                  ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrGrid.Cells[1,IntCount])+
                  ','+StrGrid.Cells[2,IntCount]+');';

        end;
//      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=StrEMessage+' '+E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        NoRetur.Text:=StrTransId;
        if MessageBox(0,PChar('Retur Berhasil Disimpan'+Chr(13)+Chr(13)+'Mau Dicetak ?'),'Retur',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
//            Reprint(StrTransId);
        end;

      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Retur Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Retur',MB_OK or MB_ICONERROR);
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TReturBarang.CariPKBClick(Sender: TObject);
begin
  WorkOrderListRetur:=TWorkOrderListRetur.Create(self);
end;

procedure TReturBarang.SelesaiClick(Sender: TObject);
begin
  Close;
end;

end.
