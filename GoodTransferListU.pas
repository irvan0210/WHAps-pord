unit GoodTransferListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons;

type
  TGoodTransferList = class(TForm)
    Label3: TLabel;
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    SBU: TComboBox;
    Location: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
    Cari: TEdit;
    Label12: TLabel;
    Department: TComboBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ToXCel: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DepartmentChange(Sender: TObject);
    procedure LocationChange(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');Overload;
    { Public declarations }
  end;

var
  GoodTransferList: TGoodTransferList;
  FormRequest,FormFunction:String;
  CompanyArr,DepartmentArr,LocationArr:Array of TArrString4;
  TransferArr:Array of TArrString8;
  IntRow:Integer;

implementation

uses MainU, GoodReceiveingU;

{$R *.dfm}

constructor TGoodTransferList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Inherited Create(AOwner);
end;

procedure TGoodTransferList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  IntRow:=0;
end;

procedure TGoodTransferList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=130;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=200;
  StrGrid.ColWidths[4]:=300;
  StrGrid.ColWidths[5]:=40;
  StrGrid.ColWidths[6]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Transfer';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Asal Transfer';
  StrGrid.Cells[4,0]:='Part Detail';
  StrGrid.Cells[5,0]:='Qty';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 5 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
  StrGrid.CellStyle[5,1].HorizontalAlignment:=taRightJustify;
end;

procedure TGoodTransferList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount+1);
    DepartmentArr[0][0]:='00';
    DepartmentArr[0][1]:='All';
    IntCount:=1;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do
    SBU.Items.Add(CompanyArr[IntCount][1]);
  for IntCount:=0 to Length(CompanyArr)-1 do
    if CompanyId=CompanyArr[IntCount][0] then SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  for IntCount:=0 to Length(DepartmentArr)-1 do begin
    Department.Items.Add(DepartmentArr[IntCount][1]);
    if DepartmentArr[IntCount][0]=DepartmentId then begin
      Department.ItemIndex:=Department.Items.IndexOf(DepartmentArr[IntCount][1]);
    end;
  end;
  RefreshLocation;
  Main.M_Normal;
end;

procedure TGoodTransferList.RefreshLocation;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
    StrCompanyId:String;
begin
  Location.Text:='';
  Location.Items.Clear;
  Location.ItemIndex:=-1;
  if SBU.Text<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrQry:='EXEC GetLocation '+StrCompanyId+';';
      StrQry:='EXEC GetLocation '+CompanyId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(LocationArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then begin
        IntCount:=0;
        while not(Qry.Eof) do begin
          LocationArr[IntCount][0]:=Qry.FieldValues['location_id'];
          LocationArr[IntCount][1]:=Qry.FieldValues['location'];
          Qry.Next;
          Inc(IntCount);
        end;
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    for IntCount:=0 to Length(LocationArr)-1 do begin
      Location.Items.Add(LocationArr[IntCount][1]);
      if LocationArr[IntCount][0]=LocationId then Location.ItemIndex:= Location.Items.IndexOf(LocationArr[IntCount][1]);
    end;
    Main.M_Normal;
  end;
end;

procedure TGoodTransferList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrCompanyId,StrLocationId,StrDepartmentId:String;
    IntCount:Integer;
begin
  if (SBU.Text<>'') and (Location.Text<>'') and (Department.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      StrDepartmentId:=DepartmentArr[Department.ItemIndex][0];
      StrQry:='EXEC GetGoodsTransferList '+StrCompanyId+','+StrLocationId+','+StrDepartmentId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(TransferArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        TransferArr[IntCount][0]:=Qry.FieldValues['part_transfer_id'];
        TransferArr[IntCount][1]:=Qry.FieldValues['transfer_dates'];
        TransferArr[IntCount][2]:=Qry.FieldValues['origin_company_name'];
        TransferArr[IntCount][3]:=Qry.FieldValues['origin_location'];
        TransferArr[IntCount][4]:=Qry.FieldValues['part_detail_resume'];
        TransferArr[IntCount][5]:=SToCurr(Qry.FieldValues['quantity']);
        if Qry.FieldValues['cancel']<>NULL then TransferArr[IntCount][6]:=Qry.FieldValues['cancel'] else TransferArr[IntCount][6]:='';
        if Qry.FieldValues['complete']<>NULL then TransferArr[IntCount][7]:=Qry.FieldValues['complete'] else TransferArr[IntCount][7]:='';
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TGoodTransferList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(TransferArr)>0 then StrGrid.RowCount:=Length(TransferArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(TransferArr)-1 do begin
    if TransferArr[IntCount][7]='' then begin
      StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
      StrGrid.Cells[1,IntCount+1]:=TransferArr[IntCount][0];
      StrGrid.Cells[2,IntCount+1]:=TransferArr[IntCount][1];
      StrGrid.Cells[3,IntCount+1]:=TransferArr[IntCount][2]+' ('+TransferArr[IntCount][3]+')' ;
      StrGrid.Cells[4,IntCount+1]:=TransferArr[IntCount][4];
      StrGrid.Cells[5,IntCount+1]:=TransferArr[IntCount][5];
     StrGrid.CellStyle[5,IntCount+1].HorizontalAlignment:=taRightJustify;
      if TransferArr[IntCount][6]='1' then begin
        StrGrid.CellStyle[0,IntCount+1].Font.Color:=clRed;
        StrGrid.CellStyle[1,IntCount+1].Font.Color:=clRed;
        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clRed;
        StrGrid.CellStyle[3,IntCount+1].Font.Color:=clRed;
        StrGrid.CellStyle[4,IntCount+1].Font.Color:=clRed;
        StrGrid.CellStyle[5,IntCount+1].Font.Color:=clRed;
      end else if TransferArr[IntCount][7]='1' then begin
        StrGrid.CellStyle[0,IntCount+1].Font.Color:=clGreen;
        StrGrid.CellStyle[1,IntCount+1].Font.Color:=clGreen;
        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clGreen;
        StrGrid.CellStyle[3,IntCount+1].Font.Color:=clGreen;
        StrGrid.CellStyle[4,IntCount+1].Font.Color:=clGreen;
        StrGrid.CellStyle[5,IntCount+1].Font.Color:=clGreen;
      end else begin
        StrGrid.CellStyle[0,IntCount+1].Font.Color:=clWindowText;
        StrGrid.CellStyle[1,IntCount+1].Font.Color:=clWindowText;
        StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWindowText;
        StrGrid.CellStyle[3,IntCount+1].Font.Color:=clWindowText;
        StrGrid.CellStyle[4,IntCount+1].Font.Color:=clWindowText;
        StrGrid.CellStyle[5,IntCount+1].Font.Color:=clWindowText;
      end;
    end;
  end;
end;

procedure TGoodTransferList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TGoodTransferList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TGoodTransferList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TGoodTransferList.DepartmentChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TGoodTransferList.LocationChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TGoodTransferList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TGoodTransferList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TGoodTransferList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
    end else if UpperCase(FormRequest)='GOODRECEIVING' then begin
      GoodReceiving.SetGTNNo(StrGrid.Cells[1,IntRow]);
      Close;
    end;
  end;

end;

procedure TGoodTransferList.SBUChange(Sender: TObject);
begin
  RefreshLocation;
end;

procedure TGoodTransferList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

end.
