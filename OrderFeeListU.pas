unit OrderFeeListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ComCtrls;

type
  TOrderFeeList = class(TForm)
    GridSPJ: TStringGrid;
    Selesai: TButton;
    Label6: TLabel;
    Tanggal: TDateTimePicker;
    Label2: TLabel;
    Cari: TEdit;
    All: TCheckBox;
    Button1: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SJArr:Array of TArrString14;
    Row:Integer;
    FormRequest:String;
    ListType:Integer;
    IsView:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure LoadData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';List_Type:Integer=0;Is_View:Boolean=False);Overload;
  end;

var
  OrderFeeList:TOrderFeeList;

implementation

uses MainU, OrderFeeU, OrderFeeAddU;

{$R *.dfm}

constructor TOrderFeeList.Create(AOwner:TComponent;Form_Request:String='';List_Type:Integer=0;Is_View:Boolean=False);
begin
  FormRequest:=Form_Request;
  ListType:=List_Type;
  IsView:=Is_View;
  Main.WriteLog('Form Open: OrderFeeList='+Form_Request,1);
  inherited Create(AOwner);
end;

procedure TOrderFeeList.Init;
begin
  Tanggal.Date:=Now()+1;
  if ListType=1 then all.Enabled:=False; 
end;


procedure TOrderFeeList.InitGrid;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='NIP';
  GridSPJ.Cells[3,0]:='Driver';
  GridSPJ.Cells[4,0]:='Tanggal';
  GridSPJ.Cells[5,0]:='Jam';
  GridSPJ.Cells[6,0]:='Solar';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  GridSPJ.Cells[6,1]:='';
end;

procedure TOrderFeeList.LoadData;
var StrQry,StrTanggalKeluar,StrList:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  SetLength(SJArr,0);
  Main.M_Busy;
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if IsView then StrList:= ',@InOut=1'
  else StrList:= '';
  
  if ListType=1 then begin
    StrQry:='EXEC GetRevenueVhcDayRpt2 '+LocationId+',@Dates='+QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date))+',@CompanyId=2;';
  end else begin
    if all.Checked then StrTanggalKeluar:=',@AllFoward=2' else StrTanggalKeluar:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));
    StrQry:='EXEC GetVhcOutList2_S '+LocationId+',1,'+CompanyId+StrTanggalKeluar+StrList; //+',@Quick=1;';
  end;
  Qry.SQL.Clear;
  Main.WriteLog('SQL :'+StrQry,2);
  Qry.SQL.Add(StrQry);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    if (Qry.FieldValues['driver_fee']<>NULL)  then begin
      SetLength(SJArr,Count+1);
      SJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[Count][1]:=Qry.FieldValues['body_id'];
      SJArr[Count][2]:=Qry.FieldValues['employee_id'];
      SJArr[Count][3]:=Qry.FieldValues['name'];
      SJArr[Count][4]:=Qry.FieldValues['from_dates'];
      SJArr[Count][5]:=Qry.FieldValues['from_time'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        SJArr[Count][6]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                         ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        SJArr[Count][6]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                         ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      Inc(Count);
    end;
    Qry.Next;
  end;
  Qry.Close;
  Main.MyConnection.Close;
  Main.M_Normal;
end;

procedure TOrderFeeList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  Main.M_Busy;
  for IntCount:=1 to GridSPJ.RowCount-1 do
    for IntCount2:=0 to GridSPJ.ColCount-1 do
      GridSPJ.Cells[IntCount2,IntCount]:='';
  if Length(SJArr)>0 then GridSPJ.RowCount:=Length(SJArr)+1
  else GridSPJ.RowCount:=2;
  for IntCount:=0 to Length(SJArr)-1 do begin
    GridSPJ.Cells[0,IntCount+1]:=SJArr[IntCount][0];
    GridSPJ.Cells[1,IntCount+1]:=SJArr[IntCount][1];
    GridSPJ.Cells[2,IntCount+1]:=SJArr[IntCount][2];
    GridSPJ.Cells[3,IntCount+1]:=SJArr[IntCount][3];
    GridSPJ.Cells[4,IntCount+1]:=SJArr[IntCount][4];
    GridSPJ.Cells[5,IntCount+1]:=SJArr[IntCount][5];
    GridSPJ.Cells[6,IntCount+1]:=SJArr[IntCount][6];
  end;
  Main.M_Normal;
end;

procedure TOrderFeeList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TOrderFeeList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TOrderFeeList.FormCreate(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  InitGrid;
  //LoadData;
  //RefreshGrid;
end;

procedure TOrderFeeList.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Row:=ARow;
end;

procedure TOrderFeeList.GridSPJDblClick(Sender: TObject);
begin
  if FormRequest='' then begin
    OrderFee:=TOrderFee.Create(nil,GridSPJ.Cells[0,Row],False);
    Close;
  end;
  if UpperCase(FormRequest)='ORDERFEE-REPRINT' then begin
    OrderFee.RePrint(GridSPJ.Cells[0,Row]);
    Close;
  end;
  if UpperCase(FormRequest)='ORDERFEESPPB-REPRINT' then begin
    OrderFee.RePrintSPPB(GridSPJ.Cells[0,Row]);
    Close;
  end;
  if UpperCase(FormRequest)='MAIN-CHANGE' then begin
    OrderFee:=TOrderFee.Create(Nil,GridSPJ.Cells[0,Row]);
    Close;
  end;
  if UpperCase(FormRequest)='CHANGE-ADD' then begin
    OrderFeeAdd:=TOrderFeeAdd.Create(Nil,GridSPJ.Cells[0,Row],True);
    Close;
  end;
end;

procedure TOrderFeeList.AllClick(Sender: TObject);
begin
  if All.Checked then Tanggal.Enabled:=False else Tanggal.Enabled:=True;
  LoadData;
  RefreshGrid;
end;

procedure TOrderFeeList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(SJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2+1;
          for Count4:=0 to 6 do begin
            GridSPJ.Cells[Count4,Count2]:=SJArr[Count][Count4];
          end;
          Inc(Count2);
      end;
    end;
  end else begin
    LoadData;
    RefreshGrid;
  end;
end;
procedure TOrderFeeList.TanggalChange(Sender: TObject);
begin
  //LoadData;
  //RefreshGrid;
end;

procedure TOrderFeeList.Button1Click(Sender: TObject);
begin
  LoadData;
  RefreshGrid;

end;

end.
