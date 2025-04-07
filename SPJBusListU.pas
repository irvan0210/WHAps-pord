unit SPJBusListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ZColorStringGrid, Buttons,
  ComCtrls;

type
  TSPJBusList = class(TForm)
    Selesai: TButton;
    GridSPJ: TZColorStringGrid;
    Label2: TLabel;
    Cari: TEdit;
    ToXCel: TSpeedButton;
    GroupBox1: TGroupBox;
    Foward: TRadioButton;
    Backward: TRadioButton;
    All: TCheckBox;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Label3: TLabel;
    Tanggal: TDateTimePicker;
    TglSampai: TDateTimePicker;
    Label4: TLabel;
    Button1: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure ToXCelClick(Sender: TObject);
    procedure AllFowardClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure FowardClick(Sender: TObject);
    procedure BackwardClick(Sender: TObject);
    procedure TanggalChange(Sender: TObject);
    procedure TglSampaiChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    SPJArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid,InOut:Integer;
    FormRequest:String;
    Initiation,IsFoward:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Is_All:Integer=0;Is_Foward:Boolean=True;In_Out:Integer=0);Overload;

  end;

var
  SPJBusList:TSPJBusList;

implementation

uses MainU, SPJFormBusU, OrderFeeAddU, TopUpETollFormU,
  SplitBusSJU;

{$R *.dfm}

constructor TSPJBusList.Create(AOwner:TComponent;Form_Request:String='';Is_All:Integer=0;Is_Foward:Boolean=True;In_Out:Integer=0);
begin
  IsAll:=Is_All;
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: ProductPriceList='+Form_Request+','+IntToStr(Is_All)+','+BoolToStr(Is_Foward)+','+IntToStr(In_Out),1);
  Initiation:=True;
  IsFoward:=Is_Foward;
  InOut:=In_Out;
  inherited Create(AOwner);
end;

procedure TSPJBusList.Init;
begin
  Cari.Text:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TSPJBusList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridSPJ.ColCount:=14;
  GridSPJ.WordWrap:=False;
  GridSPJ.ColWidths[0]:=100;
  GridSPJ.ColWidths[1]:=45;
  GridSPJ.ColWidths[2]:=60;
  GridSPJ.ColWidths[3]:=70;
  GridSPJ.ColWidths[4]:=160;
  GridSPJ.ColWidths[5]:=70;
  GridSPJ.ColWidths[6]:=40;
  GridSPJ.ColWidths[7]:=100;
  GridSPJ.ColWidths[8]:=180;
  GridSPJ.ColWidths[9]:=320;
  GridSPJ.ColWidths[10]:=0;
  GridSPJ.ColWidths[11]:=0;
  GridSPJ.ColWidths[12]:=0;
  GridSPJ.ColWidths[13]:=0;

  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='No Polisi';
  GridSPJ.Cells[3,0]:='ID Pengemudi';
  GridSPJ.Cells[4,0]:='Pengemudi';
  GridSPJ.Cells[5,0]:='Tanggal';
  GridSPJ.Cells[6,0]:='Jam';
  GridSPJ.Cells[7,0]:='No Pesanan';
  GridSPJ.Cells[8,0]:='Customer';
  GridSPJ.Cells[9,0]:='Rute';

  GridSPJ.Cells[11,0]:='Odo Keluar';
  GridSPJ.Cells[12,0]:='Odo Masuk';
  GridSPJ.Cells[12,0]:='KM Estimasi';

  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.Cells[IntCount,1]:='';
end;

procedure TSPJBusList.RefreshCombo;
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

procedure TSPJBusList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrInOut,StrDate:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  SetLength(SPJArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    if Foward.Checked=True then if All.Checked=True then StrAllFoward:=',@AllFoward=1'
        else StrAllFoward:=',@AllFoward=2'
    else if Backward.Checked=True then if All.Checked=True then StrAllFoward:=',@AllFoward=-1'
        else StrAllFoward:=',@AllFoward=-2';
    if InOut=0 then StrInOut:='' else StrInOut:=',@InOut='+IntToStr(InOut);
    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    StrDate:=',@OutDate='+QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date))+', '+
    '@OutDate2='+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+' ';
    //StrQry:='EXEC GetVhcOutList2 '+StrLocation+',1,'+StrCompany+StrAllFoward+StrInOut+';';
    StrQry:='EXEC GetVhcOutList2 '+StrLocation+',1,'+StrCompany+StrDate+StrInOut+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(SPJArr,IntCount+1);
       SPJArr[IntCount][0]:=Qry.FieldValues['vhc_trans_id'];
       SPJArr[IntCount][1]:=Qry.FieldValues['body_id'];
       if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
         SPJArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
       else
         SPJArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                          ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
       SPJArr[IntCount][3]:=Qry.FieldValues['employee_id'];
       SPJArr[IntCount][4]:=Qry.FieldValues['name'];
       SPJArr[IntCount][5]:=Qry.FieldValues['from_dates'];
       SPJArr[IntCount][6]:=Qry.FieldValues['from_time'];
       if Qry.FieldValues['customer_order_id']<>NULL then SPJArr[IntCount][7]:=Qry.FieldValues['customer_order_id'];
       if Qry.FieldValues['customer_name']<>NULL then SPJArr[IntCount][8]:=Qry.FieldValues['customer_name'];
       if Qry.FieldValues['route']<>NULL then SPJArr[IntCount][9]:=Qry.FieldValues['route'];
       if Qry.FieldValues['out_time']<>NULL then SPJArr[IntCount][10]:=Qry.FieldValues['out_time'];

       if Qry.FieldValues['out_ordo_km']<>NULL then SPJArr[IntCount][11]:=Qry.FieldValues['out_ordo_km'];
       if Qry.FieldValues['in_ordo_km']<>NULL  then SPJArr[IntCount][12]:=Qry.FieldValues['in_ordo_km'];
       if Qry.FieldValues['km_estimasi']<>NULL  then SPJArr[IntCount][13]:=Qry.FieldValues['km_estimasi'];

       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TSPJBusList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(SPJArr)>1 then GridSPJ.RowCount:=Length(SPJArr)+1
  else GridSPJ.RowCount:=2;
  for IntCount:=0 to Length(SPJArr)-1 do begin
    GridSPJ.Cells[0,IntCount+1]:=SPJArr[IntCount][0];
    GridSPJ.Cells[1,IntCount+1]:=SPJArr[IntCount][1];
    GridSPJ.Cells[2,IntCount+1]:=SPJArr[IntCount][2];
    GridSPJ.Cells[3,IntCount+1]:=SPJArr[IntCount][3];
    GridSPJ.Cells[4,IntCount+1]:=SPJArr[IntCount][4];
    GridSPJ.Cells[5,IntCount+1]:=SPJArr[IntCount][5];
    GridSPJ.Cells[6,IntCount+1]:=SPJArr[IntCount][6];
    GridSPJ.Cells[7,IntCount+1]:=SPJArr[IntCount][7];
    GridSPJ.Cells[8,IntCount+1]:=SPJArr[IntCount][8];
    GridSPJ.Cells[9,IntCount+1]:=SPJArr[IntCount][9];
    GridSPJ.Cells[10,IntCount+1]:=SPJArr[IntCount][10];
    GridSPJ.Cells[11,IntCount+1]:=SPJArr[IntCount][11];
    GridSPJ.Cells[12,IntCount+1]:=SPJArr[IntCount][12];
    GridSPJ.CellStyle[9,IntCount+1].WordWrap:=False;
  end;
end;

procedure TSPJBusList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TSPJBusList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TSPJBusList.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSPJBusList.GridSPJDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridSPJ.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('SPJFormBus')=False then SPJFormBus:=TSPJFormBus.Create(nil,GridSPJ.Cells[0,IntRow],False);
    end else begin

      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('SPJFormBus')=False) then
          //if (GridSPJ.Cells[10,IntRow]='') then begin
            SPJFormBus:=TSPJFormBus.Create(nil,GridSPJ.Cells[0,IntRow],True);
            SPJFormBus.pnl2.Enabled:=False;
            Close;
         // end else MessageBox(0,'Kendaraan Sudah Keluar','Surat Jalan',MB_OK or MB_ICONERROR);
      end;
      if UpperCase(FormRequest)='MAIN-CHANGEVEHICLE' then  begin
        if (Main.IsFormOpen('SPJFormBus')=False) then SPJFormBus:=TSPJFormBus.Create(nil,GridSPJ.Cells[0,IntRow],False,'',True);
        SPJFormBus.pnl2.Enabled:=False;
        Close;
      end;
      if UpperCase(FormRequest)='SJ-CREATE' then  begin
        SPJFormBus.RePrint(GridSPJ.Cells[0,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='ORDERFEE-ADDITIONAL' then  begin
        OrderFeeAdd.SetSJId(GridSPJ.Cells[0,IntRow]);
        Close;
      end;
      if UpperCase(FormRequest)='TOPUPETOLL-ADD' then  begin
        TopUpETollForm.NoSJ.Text:=GridSPJ.Cells[0,IntRow];
        Close;
      end;

      if UpperCase(FormRequest)='SPLITSJ' then  begin
        with SplitBusSJ do begin
          NoSJ.Text:=GridSPJ.Cells[0,IntRow];
          CustomerName.Text:=GridSPJ.Cells[8,IntRow];
          TglJalan.Text:=GridSPJ.Cells[5,IntRow];
          out_odo.Text :=IToCurr(StrToInt(GridSPJ.Cells[11,IntRow]));
          firstOutOdo := StrToInt(GridSPJ.Cells[11,IntRow]);

          in_odo.Text:=IToCurr(StrToInt(GridSPJ.Cells[12,IntRow]));
          firstInOdo := StrToInt(GridSPJ.Cells[12,IntRow]);

          jarak.Text:=IToCurr(StrToInt(GridSPJ.Cells[12,IntRow]) - StrToInt(GridSPJ.Cells[11,IntRow]));
        end;
        Close;
      end;

      if UpperCase(FormRequest)='SPLITSJ-SJADD' then  begin
        with SplitBusSJ do begin
          SJLIST.Items.add(GridSPJ.Cells[0,IntRow]+' - '+GridSPJ.Cells[11,IntRow]+'-'+GridSPJ.Cells[12,IntRow]);
        end;
        Close;
      end;
    end;
  end;
end;

procedure TSPJBusList.FormShow(Sender: TObject);
begin
  Tanggal.Date:=Now();
  TglSampai.Date:=Now();
  InitGrid;
  if IsFoward then Foward.Checked:=True else Backward.Checked:=True;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TSPJBusList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(SPJArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 12 do
      if (StrPos(PChar(UpperCase(SPJArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2+1;
          for Count4:=0 to 12 do begin
            GridSPJ.Cells[Count4,Count2]:=SPJArr[Count][Count4];
          end;
          GridSPJ.CellStyle[8,Count2].WordWrap:=False;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TSPJBusList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(GridSPJ) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;


procedure TSPJBusList.AllFowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TSPJBusList.AllClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TSPJBusList.FowardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TSPJBusList.BackwardClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TSPJBusList.TanggalChange(Sender: TObject);
begin
  if Tanggal.Date>TglSampai.Date then
  TglSampai.Date:=Tanggal.Date;
end;

procedure TSPJBusList.TglSampaiChange(Sender: TObject);
begin
  if TglSampai.Date<Tanggal.Date then
  Tanggal.Date:=TglSampai.Date;
end;

procedure TSPJBusList.Button1Click(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

end.
