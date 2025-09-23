unit EmployeeContractListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, WHUnit, Buttons, ComCtrls;

type
  TEmployeeContractList = class(TForm)
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label6: TLabel;
    SBU: TComboBox;
    CariUser: TSpeedButton;
    Label4: TLabel;
    Jenis: TComboBox;
    chk_status_kontrak: TCheckBox;
    GroupTgl: TGroupBox;
    Label2: TLabel;
    Bulan: TComboBox;
    Label3: TLabel;
    Tahun: TEdit;
    chk_Aktif_Sampaidengan: TCheckBox;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariUserClick(Sender: TObject);
    procedure chk_Aktif_SampaidenganClick(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString30;
    procedure AskDelete(TreeMenuId:String);
  public
    { Public declarations }

    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure RefreshList;
    procedure RefreshCombo;
  end;

var
  EmployeeContractList: TEmployeeContractList;
  ContractArr:Array of TArrString10;
  IntRow, IntCol:Integer;

implementation

uses MainU, ADODB, StrUtils, TreeMenuFormU, KontrakKaryawanFormU;

{$R *.dfm}

procedure TEmployeeContractList.Init;
begin
  Cari.Text:=''; 
  InitGrid;
  chk_Aktif_Sampaidengan.Checked := True;
  chk_status_kontrak.Checked := True;
end;

procedure TEmployeeContractList.InitGrid;
 var IntCount : Integer;
begin
  //MinRowGrid:=1;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=70;
  StrGrid.ColWidths[1]:=130;
  StrGrid.ColWidths[2]:=100;
  StrGrid.ColWidths[3]:=85;
  StrGrid.ColWidths[4]:=85;
  StrGrid.ColWidths[5]:=170;
  StrGrid.ColWidths[6]:=60;

  StrGrid.Cells[0,0]:='Employee Id';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Jabatan';
  //StrGrid.Cells[3,0]:='Periode Kontrak';
  StrGrid.Cells[3,0]:='Dari Tanggal';
  StrGrid.Cells[4,0]:='Sampai Tanggal';
  StrGrid.Cells[5,0]:='Deskripsi';
  StrGrid.Cells[6,0]:='Status';
  StrGrid.Cells[7,0]:='Kontrak Id';

 { StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,4,0);
  StrGrid.MergeCells.AddRectXY(5,0,5,1);
  StrGrid.MergeCells.AddRectXY(6,0,6,1);
  StrGrid.MergeCells.AddRectXY(7,0,7,1); }

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
 // StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  
  For IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount+2,2]:='';
  end;
end;

procedure TEmployeeContractList.LoadData;
var Qry:TADOQuery;
    StrQry, StrJenis,StrEndDate,StrStatusContract, StrLocationId:String;
    IntCount:Integer;
begin
  SetLength(ContractArr,0);
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrLocationId:=CompanyArr[SBU.ItemIndex][2];
    StrJenis  := ','+QuotedStr(Jenis.Text);
    if chk_Aktif_Sampaidengan.Checked = True then begin
      StrEndDate:=','+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime('1/'+Bulan.Text+'/'+Tahun.Text)));
    end else begin
      StrEndDate:=','+QuotedStr('F');
    end;

    if chk_status_kontrak.Checked = True then StrStatusContract :=','+QuotedStr('1')
    else  StrStatusContract :=','+QuotedStr('0');

    StrQry:='EXEC GetContractCrewList '+StrLocationId+', '+CompanyId+StrJenis+StrEndDate+StrStatusContract+';';
    Main.WriteLog('SQL :'+StrQry,4);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    SetLength(ContractArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      ContractArr[IntCount][0]:=Qry.FieldValues['employee_id'];
      ContractArr[IntCount][1]:=Qry.FieldValues['name'];
      ContractArr[IntCount][2]:=Qry.FieldValues['jabatan'];
      if Qry.FieldValues['tgl_mulai']<>NULL then
        ContractArr[IntCount][3]:=Qry.FieldValues['tgl_mulai']
      else ContractArr[IntCount][3]:= '';
      if Qry.FieldValues['tgl_berahir']<>NULL then
      ContractArr[IntCount][4]:=Qry.FieldValues['tgl_berahir']
      else ContractArr[IntCount][4]:='';
      if Qry.FieldValues['description']<>NULL then
      ContractArr[IntCount][5]:=Qry.FieldValues['description']
      else ContractArr[IntCount][5]:='';
      if Qry.FieldValues['status']=1 then ContractArr[IntCount][6]:='Active' else ContractArr[IntCount][6]:='Non Active';
      if Qry.FieldValues['empl_contract_id']<>NULL then
        ContractArr[IntCount][7]:=Qry.FieldValues['empl_contract_id']
      else ContractArr[IntCount][7]:='';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
   Qry.Destroy;
   Main.M_Normal;
end;

procedure TEmployeeContractList.RefreshList;
var IntCount,IntCount2, IntStartRow:Integer;
begin
  Main.M_Busy;
 // for IntCount:=1 to StrGrid.RowCount-1 do
  //  for IntCount2:=0 to StrGrid.ColCount-1 do
 //     StrGrid.Cells[IntCount2,IntCount+2]:='';
//  if Length(ContractArr)>0 then StrGrid.RowCount:=Length(ContractArr)+2
 //  else begin
 //   StrGrid.Cells[IntCount+2,1]:='';
 //  end;

  StrGrid.RowCount:=Length(ContractArr)+1;
  for IntCount:=0 to Length(ContractArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=ContractArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=ContractArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=ContractArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=ContractArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=ContractArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=ContractArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=ContractArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=ContractArr[IntCount][7];
    //StrGrid.Cells[7,IntCount+2]:=ContractArr[IntCount][7];
    for IntCount2:=0 to StrGrid.ColCount-1 do begin
      StrGrid.CellStyle[0,IntCount2].HorizontalAlignment :=taCenter;
      StrGrid.CellStyle[1,IntCount2].HorizontalAlignment :=taLeftJustify;
      StrGrid.CellStyle[2,IntCount2].HorizontalAlignment :=taLeftJustify;
      StrGrid.CellStyle[3,IntCount2].HorizontalAlignment :=taCenter;
      StrGrid.CellStyle[4,IntCount2].HorizontalAlignment :=taCenter;
      StrGrid.CellStyle[5,IntCount2].HorizontalAlignment :=taLeftJustify;
      StrGrid.CellStyle[6,IntCount2].HorizontalAlignment :=taCenter;
      StrGrid.CellStyle[7,IntCount2].HorizontalAlignment :=taRightJustify;
    end;
  end;
  Main.M_Normal;
end;

procedure TEmployeeContractList.AskDelete(TreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
  if (Trim(TreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Tree Menu Id '+TreeMenuId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        StrQry:='DELETE FROM wh_user_grp_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        StrQry:='DELETE FROM wh_user_tree_sub_menu WHERE tree_sub_menu_id='+Chr(39)+TreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
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
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','Tree Sub Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Tree Sub Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;
end;


procedure TEmployeeContractList.SelesaiClick(Sender: TObject);
begin
  EmployeeContractList.Close;
end;

procedure TEmployeeContractList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeContractList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  //LoadData;
  //RefreshList;
end;

procedure TEmployeeContractList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(ContractArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
      if (StrPos(PChar(UpperCase(ContractArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4,Count2-1]:=ContractArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TEmployeeContractList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TEmployeeContractList.StrGridDblClick(Sender: TObject);
var
  StrEmplType : string;
begin

  if StrGrid.Cells[2,IntRow] ='Pengemudi' then   StrEmplType := 'Bus'
    else if StrGrid.Cells[2,IntRow] = 'Helper' then  StrEmplType := 'Bus2';
  if StrGrid.Cells[0,IntRow] <> '' then begin
    if StrGrid.Cells[6,IntRow]='Active' then
       EmployeeContractForm:=TEmployeeContractForm.Create(Self,StrGrid.Cells[0,IntRow],StrEmplType,StrGrid.Cells[7,IntRow],'1')
    else //if  StrGrid.Cells[2,IntRow]='Non Active' then
       EmployeeContractForm:=TEmployeeContractForm.Create(Self,StrGrid.Cells[0,IntRow],StrEmplType,StrGrid.Cells[7,IntRow],'0');
   
  end;
end;

procedure TEmployeeContractList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
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

  for IntCount:=1 to 12 do
  Bulan.Items.Add(ShortMonthNames[IntCount]);
  Bulan.ItemIndex:=Bulan.Items.IndexOf(FormatDateTime('mmm',Now));
  Tahun.Text:=FormatDateTime('yyyy',Now);

  Main.M_Normal;
{  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
}
end;


procedure TEmployeeContractList.CariUserClick(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TEmployeeContractList.chk_Aktif_SampaidenganClick(
  Sender: TObject);
begin
  if chk_Aktif_Sampaidengan.Checked = True then begin
    GroupTgl.Enabled := True;
  end else begin
    GroupTgl.Enabled := False;
  end;
end;

procedure TEmployeeContractList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
