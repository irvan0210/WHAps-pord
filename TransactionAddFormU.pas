unit TransactionAddFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ADODB;

type
  TTransactionAddForm = class(TForm)
    Selesai: TButton;
    Label2: TLabel;
    Cari: TEdit;
    Biaya: TComboBox;
    JumlahBiaya: TEdit;
    Simpan: TButton;
    GroupKaryawan: TGroupBox;
    StrGrid: TStringGrid;
    Bersihkan: TButton;
    GroupBox1: TGroupBox;
    Nama: TEdit;
    Label5: TLabel;
    TotalHutang: TEdit;
    Label6: TLabel;
    GroupBiaya: TGroupBox;
    GridBiaya: TStringGrid;
    GroupKeterangan: TGroupBox;
    Keterangan: TMemo;
    NIK: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    TotalTabungan: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridBiayaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure JumlahBiayaKeyPress(Sender: TObject; var Key: Char);
    procedure JumlahBiayaExit(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BiayaChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure NIKChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
 private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure Calculate;
    procedure SetEmpl;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure PreparePrintData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);Overload;
  end;

var
  TransactionAddForm: TTransactionAddForm;
  EmplId,EmplCode,TransId:String;
  EmplType,MinRowBiaya,IntRow:Integer;
  BiayaArr:Array of TArrString10;
  EmplArr:Array of TArrString14;

implementation

uses MainU, RePrintFormU, StrUtils;

{$R *.dfm}

constructor TTransactionAddForm.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    EmplCode:='TX';
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    EmplCode:='BS';
  end else begin
    EmplType:=3;
    EmplCode:='';
  end;
  EmplId:=EmployeeId;
  Inherited Create(AOwner);
end;

procedure TTransactionAddForm.Init;
var Count:Integer;
begin
  Nama.Text:='';
  TotalHutang.Text:='';
  TotalTabungan.Text:='';
  Biaya.Clear;
  Biaya.Visible:=False;
  Biaya.Text:='Pilih Biaya';
  Biaya.ItemIndex:=0;
  JumlahBiaya.Text:='';
  JumlahBiaya.Visible:=False;
  InitGrid;
  GroupKaryawan.Enabled:=True;
  GroupKeterangan.Enabled:=False;
  GroupBiaya.Enabled:=False;
end;

procedure TTransactionAddForm.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='NIK';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[3,0]:='Alamat';
  StrGrid.Cells[4,0]:='Telp';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  GridBiaya.Cells[0,0]:='            Jenis Biaya';
  GridBiaya.Cells[1,0]:='        Jumlah';
  for IntCount:=0 to StrGrid.RowCount-1 do
    StrGrid.Cells[1,IntCount]:='';  
  for IntCount:=2 to 5  do
    GridBiaya.ColWidths[IntCount]:=0;
  for IntCount:=1 to GridBiaya.RowCount-1  do begin
    GridBiaya.Cells[0,IntCount]:='';
    GridBiaya.Cells[1,IntCount]:='';
    GridBiaya.Cells[2,IntCount]:='';
    GridBiaya.Cells[3,IntCount]:='';
    GridBiaya.Cells[4,IntCount]:='';
    GridBiaya.Cells[5,IntCount]:='';
  end;
  GridBiaya.RowCount:=3;
end;

procedure TTransactionAddForm.SetEmpl;
begin
  if Trim(NIK.Text)<>'' then begin
     Nama.Text:=EmplArr[ArrayIndexOf(EmplArr,NIK.Text,0)][1];
     GroupKeterangan.Enabled:=True;
     GroupBiaya.Enabled:=True;
     TotalHutang.Text:=SToCurr(EmplArr[ArrayIndexOf(EmplArr,NIK.Text,0)][6]);
     TotalTabungan.Text:=IToCurr(0-StrToInt(EmplArr[ArrayIndexOf(EmplArr,NIK.Text,0)][7]));
     if SToInt(TotalHutang.Text)<0 then TotalHutang.Text:='('+SToCurr(RightStr(ToString(TotalHutang.Text),Length(ToString(TotalHutang.Text))-1))+')';
  end;
end;

procedure TTransactionAddForm.RefreshCombo;
var StrQry,StrLocation:String;
    Qry:TADOQuery;
    IntCount,IntCountPagi,IntCountMalam:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetTransactionType '+Chr(39)+'Mitra'+Chr(39)+',@TInOut=2;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(BiayaArr,Qry.RecordCount+1);
    BiayaArr[0][0]:='0';
    BiayaArr[0][1]:=' ';
    BiayaArr[0][2]:='';
    BiayaArr[0][3]:='';
    BiayaArr[0][4]:='';
    BiayaArr[0][5]:='';
    BiayaArr[0][6]:='0';
    BiayaArr[0][7]:='';
    BiayaArr[0][8]:='1';
    BiayaArr[0][9]:='0';
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      BiayaArr[IntCount][0]:=Qry.FieldValues['transaction_type_id'];
      if Qry.FieldValues['details']<>NULL then
        BiayaArr[IntCount][1]:=Qry.FieldValues['name']+' '+Qry.FieldValues['details']
      else
        BiayaArr[IntCount][1]:=Qry.FieldValues['name'];
      BiayaArr[IntCount][2]:=Qry.FieldValues['amount'];
      BiayaArr[IntCount][3]:=Qry.FieldValues['discount'];
      BiayaArr[IntCount][4]:=Qry.FieldValues['discount_percent'];
      BiayaArr[IntCount][5]:=Qry.FieldValues['tax'];
      BiayaArr[IntCount][6]:=Qry.FieldValues['transaction_obj_id'];
      BiayaArr[IntCount][7]:=Qry.FieldValues['value'];
      BiayaArr[IntCount][8]:=Qry.FieldValues['display'];
      BiayaArr[IntCount][9]:=Qry.FieldValues['non_cash'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    if (StrToInt(LocationId)>1) then StrLocation:=','+LocationId else StrLocation:=',0';
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then SetLength(EmplArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      EmplArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      EmplArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['birth']<>NULL then
        EmplArr[IntCount][2]:=Qry.FieldValues['birth'];
      if Qry.FieldValues['address']<>NULL then
        EmplArr[IntCount][3]:=Qry.FieldValues['address'];
      EmplArr[IntCount][4]:=Qry.FieldValues['join_date'];
      if Qry.FieldValues['phone']<>NULL then
      EmplArr[IntCount][5]:=Qry.FieldValues['phone'];
      EmplArr[IntCount][6]:=Qry.FieldValues['debt'];
      EmplArr[IntCount][7]:=Qry.FieldValues['saving'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TTransactionAddForm.RefreshData;
var IntCount:Integer;
begin
  Biaya.Items.Clear;
  for IntCount:=0 to Length(BiayaArr)-1 do
    if StrToInt(BiayaArr[IntCount][8])>0 then
      Biaya.Items.Add(BiayaArr[IntCount][1]);
  if Length(EmplArr)>0 then StrGrid.RowCount:=Length(EmplArr)+1;
  NIK.Items.Clear;
  for IntCount:=0 to Length(EmplArr)-1 do begin
    NIK.Items.Add(EmplArr[IntCount][0]);
    StrGrid.Cells[0,IntCount+1]:=EmplArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=EmplArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=EmplArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=EmplArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=EmplArr[IntCount][5];
  end;
end;

procedure TTransactionAddForm.Calculate;
begin

end;

procedure TTransactionAddForm.SelesaiClick(Sender: TObject);
begin
  TransactionAddForm.Close;
end;

procedure TTransactionAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTransactionAddForm.GridBiayaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 0) and (ARow > MinRowBiaya) then begin
    R := GridBiaya.CellRect(ACol, ARow);
    R.Left := R.Left + GridBiaya.Left + GroupBiaya.Left;
    R.Right := R.Right + GridBiaya.Left + GroupBiaya.Left;
    R.Top := R.Top + GridBiaya.Top + GroupBiaya.Top;
    R.Bottom := R.Bottom + GridBiaya.Top + GroupBiaya.Top;
    with Biaya do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(GridBiaya.Cells[ACol,ARow])<>'' then ItemIndex:=Items.IndexOf(GridBiaya.Cells[ACol,ARow]) else
      ItemIndex:=-1;
    end;
  end;
  if (ACol = 1) and (ARow > MinRowBiaya) then begin
      R := GridBiaya.CellRect(ACol, ARow);
      R.Left := R.Left + GridBiaya.Left + GroupBiaya.Left;
      R.Right := R.Right + GridBiaya.Left + GroupBiaya.Left;
      R.Top := R.Top + GridBiaya.Top+ GroupBiaya.Top;
      R.Bottom := R.Bottom + GridBiaya.Top + GroupBiaya.Top;
      with JumlahBiaya do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        Visible:= True;
        if Trim(GridBiaya.Cells[ACol,ARow])<>'' then Text:=ToString(GridBiaya.Cells[ACol,ARow]);
        BringToFront;
        SetFocus;
      end;
  end;
end;

procedure TTransactionAddForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshData;
end;

procedure TTransactionAddForm.JumlahBiayaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then begin
    JumlahBiayaExit(nil);
    if GridBiaya.Row=GridBiaya.RowCount-1 then GridBiaya.RowCount:=GridBiaya.RowCount+1;
    GridBiaya.Row:=GridBiaya.Row+1;
    GridBiaya.Col:=GridBiaya.Col-1;
  end;
  if (Key=#27) then begin
    JumlahBiayaExit(nil);
  end;

end;

procedure TTransactionAddForm.JumlahBiayaExit(Sender: TObject);
begin
  if ToString(JumlahBiaya.Text)<>'' then begin
    JumlahBiaya.Text:=SToCurr(ToString(JumlahBiaya.Text));
    GridBiaya.Cells[GridBiaya.Col,GridBiaya.Row]:= JumlahBiaya.Text;
//    Calculate;
  end;
  JumlahBiaya.Visible := False;
  JumlahBiaya.Text:='';
  GridBiaya.SetFocus;
end;

procedure TTransactionAddForm.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    NIK.Items.Clear;
    Count2:=2;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 8 do
      if (StrPos(PChar(UpperCase(EmplArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 8 do
          StrGrid.Cells[Count4,Count2-1]:=EmplArr[Count][Count4];
          Inc(Count2);
          NIK.Items.Add(EmplArr[Count][0])
      end;
    end;
  end else begin
    RefreshCombo;
    RefreshData;
  end;
end;

procedure TTransactionAddForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TTransactionAddForm.BiayaChange(Sender: TObject);
begin
  GridBiaya.Cells[0,GridBiaya.Row]:=Biaya.Items[Biaya.ItemIndex];
  if Biaya.ItemIndex>0 then begin
     GridBiaya.Cells[1,GridBiaya.Row]:=SToCurr(BiayaArr[ArrayIndexOf(BiayaArr,Biaya.Text,1)][2]);
    if GridBiaya.Row=GridBiaya.RowCount-1 then begin
      GridBiaya.RowCount:=GridBiaya.RowCount+1;
    end;
  end else if Biaya.ItemIndex=0 then GridBiaya.Cells[1,GridBiaya.Row]:='';
  Biaya.Visible:= False;
  Biaya.Text:='';
  Biaya.ItemIndex:=0;
  GridBiaya.SetFocus;
  Calculate;
end;

procedure TTransactionAddForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransCode,StrTotal,StrMsg,StrEMsg,Amount,StrDebt:String;
    IntCount:Integer;
    IsOk,IsPrint:Boolean;
begin
  if (Trim(NIK.Text)<>'') AND (Trim(GridBiaya.Cells[0,1])<>'')  then begin
    Main.M_Busy;
    StrEMsg:='';
    IsOk:=True;
    IsPrint:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='SELECT dbo.GetAmount('+Chr(39)+NIK.Text+Chr(39)+') AS amount;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      StrDebt:=Qry.FieldValues['amount'];
      Qry.Close;
      StrQry:='SELECT RIGHT(MAX(empl_transaction_id),4) AS empl_transaction_id FROM wh_empl_transaction '+
            'WHERE empl_transaction_id  LIKE '+Chr(39)+'SPM'+LocationCode+
            FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
            FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
            '____'+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['empl_transaction_id']<>NULL then begin
        TransId:=Qry.FieldValues['empl_transaction_id'];
        TransId:=Format('%.*d',[4,StrToInt(TransId)+1]);
      end else
        TransId:='0001';
      Qry.Close;
      Qry.SQL.Clear;
      TransId:='SPM'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+TransId;
      StrQry:='INSERT INTO wh_empl_transaction (empl_transaction_id,employee_id,form_id,date,update_user)'+
              ' VALUES ('+Chr(39)+TransId+Chr(39)+','+Chr(39)+NIK.Text+Chr(39)+','+Chr(39)+TransId+Chr(39)+
              ',GETDATE(),'+Chr(39)+User+Chr(39)+');';
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        On E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      StrQry:='';
      IntCount:=1;
      repeat
        StrTransCode:=BiayaArr[ArrayIndexOf(BiayaArr,GridBiaya.Cells[0,IntCount],1)][0];
        Amount:=ToString(GridBiaya.Cells[1,IntCount]);
        if (BiayaArr[ArrayIndexOf(BiayaArr,GridBiaya.Cells[0,IntCount],1)][10])='1' then
          StrTotal:=IntToStr(SToInt(StrDebt)+SToInt(Amount))
        else
          StrTotal:=StrDebt;
        StrQry:=StrQry+'INSERT INTO wh_empl_transaction_detail (empl_transaction_id,transaction_type_id,amount,total,update_user)'+
              ' VALUES ('+Chr(39)+TransId+Chr(39)+','+StrTransCode+','+Amount+
              ','+StrTotal+','+Chr(39)+User+Chr(39)+');';
        Inc(IntCount);
      until (IntCount>GridBiaya.RowCount) OR (GridBiaya.Cells[1,IntCount]='');
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrMsg:='Tidak Dapat Menyimpan SPJ transaksi Detail';
          StrEMsg:=E.Message;
          IsOk:=False;
        end
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        MessageBox(0,'Transaksi Berhasil Disimpan'+Chr(13)+Chr(13),'Pembayaran',MB_OKCANCEL or MB_ICONQUESTION);
//        if MessageBox(0,'Transaksi Berhasil Disimpan'+Chr(13)+Chr(13)+'    Cetak Slip ?','Pembayaran',MB_OKCANCEL or MB_ICONQUESTION)=1 then IsPrint:=True;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal Menyimpan Transaksi'+StrEMsg),'Pembayaran',MB_OK or MB_ICONERROR)
      end;
{      if IsPrint then begin
        RePrintForm.ReportName:='Slip Setoran/Pembayaran';
        RePrintForm.ReportId:=TransId;
        if RePrintForm.ShowModal=1 then begin
          PreparePrint;
          PreparePrintData;
          StrQry:='SELECT REPLACE(REPLACE(PARSENAME(CONVERT(VARCHAR,CONVERT(money,a.amount),1),2),'+
                  Chr(39)+','+Chr(39)+','+Chr(39)+'.'+Chr(39)+'),'+Chr(39)+'-'+Chr(39)+','+Chr(39)+''+Chr(39)+') AS amount'+
                  ',(b.name)+COALESCE(b.details,'+Chr(39)+Chr(39)+') AS name '+
                  ' FROM  wh_empl_transaction_detail a'+
                  ' INNER JOIN wh_transaction_type b ON b.transaction_type_id=a.transaction_type_id'+
                  ' WHERE a.empl_transaction_id='+Chr(39)+TransId+Chr(39)+';';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
//          Report.DataSet:=Qry;
//          QNama.DataSet:=Qry;
//          QAmount.DataSet:=Qry;
//          Report.Prepare;
//          Report.Preview;
          Qry.Close;
        end;
      end;
}
      Qry.Destroy;
      Main.CloseDb;
    end;
    Main.M_Normal;
  end else
    if Trim(NIK.Text)='' then
      MessageBox(0,PChar('Silahkan Input Mitra/Karyawan'),'Pembayaran',MB_OK or MB_ICONWARNING)
    else
      MessageBox(0,PChar('Silahkan Masukkan Transaksi'),'Pembayaran',MB_OK or MB_ICONWARNING)
end;

procedure TTransactionAddForm.EnableInput;
begin
  NIK.Enabled:=True;
  GroupBiaya.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  GroupKaryawan.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TTransactionAddForm.DisableInput;
begin
  NIK.Enabled:=False;
  GroupBiaya.Enabled:=False;
  GroupKaryawan.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TTransactionAddForm.PreparePrint;
begin
end;

procedure TTransactionAddForm.PreparePrintData;
begin

end;

procedure TTransactionAddForm.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGrid;
  RefreshData;
  RefreshCombo;
  EnableInput;
  Main.M_Normal;
end;

procedure TTransactionAddForm.NIKChange(Sender: TObject);
begin
  SetEmpl;
end;

procedure TTransactionAddForm.StrGridDblClick(Sender: TObject);
begin
  NIK.ItemIndex:=NIK.Items.IndexOf(StrGrid.Cells[0,IntRow]);
  SetEmpl;
end;

end.
