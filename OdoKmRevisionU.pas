unit OdoKmRevisionU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, ZColorStringGrid, AdoDB, WHUnit;

type
  TOdoKmRevision = class(TForm)
    Label2: TLabel;
    Tanggal: TDateTimePicker;
    ToDates: TCheckBox;
    TanggalSampai: TDateTimePicker;
    lbl1: TLabel;
    edtnopol: TEdit;
    TombolCari: TSpeedButton;
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    GridSPJ: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure ToDatesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSPJDblClick(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }

    CompanyArr:Array of TArrString5;
    SPJArr:Array of TArrString14;

    IntRow,CompId,IsAll,MinRowGrid,InOut:Integer;
    FormRequest:String;
    Initiation,IsFoward:Boolean;

    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;In_Out:Integer);Overload;
  end;

var
  OdoKmRevision: TOdoKmRevision;

implementation


uses MainU, EditKMSJBusFormU;{$R *.dfm}

constructor TOdoKmRevision.Create(AOwner:TComponent;In_Out:Integer);
begin
  Main.WriteLog('Form Open: OdoRevision,'+IntToStr(In_Out),1);
  Initiation:=True;
  InOut:=In_Out;
  inherited Create(AOwner);
end;

procedure TOdoKmRevision.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Tanggal.Date:=Now();
  TanggalSampai.Date:=Now();
  ToDates.Checked:=False;
  TanggalSampai.Enabled:=False;
  IntRow:=0;
  if StrToInt(CompanyId)=1 then GroupCompany.Enabled:=True else GroupCompany.Enabled:=False;
end;

procedure TOdoKmRevision.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany,StrInOut
    ,StrNoPol,StrTanggal,StrToDates:String;
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

    StrTanggal:=',@OutDate='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal.Date));

    if ToDates.Checked=True then StrToDates:=',@OutDate2='+QuotedStr(FormatDateTime('yyyy/mm/dd',TanggalSampai.date)) else StrToDates:='';

    StrAllFoward:=',@AllFoward=3';
    if InOut=0 then StrInOut:='' else StrInOut:=',@InOut='+IntToStr(InOut);
    if Trim(edtnopol.Text)<>'' then begin
      StrNoPol := ',@LicensePlate='+QuotedStr(edtnopol.Text);
    end else
      StrNoPol := '';
    StrLocation:=CompanyArr[SBU.ItemIndex][2];
    StrCompany:=CompanyArr[SBU.ItemIndex][1];
    StrQry:='EXEC GetVhcOutList2 '+StrLocation+',1,'+StrCompany+StrAllFoward+StrInOut+',@Quick=0,@isFinish=1'+StrTanggal+StrToDates+StrNoPol+',@Order='+QuotedStr('tgl_keluar desc')+';';
    //EXEC GetVhcOutList2 6,1,2,@AllFoward=-2 ,@InOut=1,@LicensePlate='7748',@Quick=1,@Order=' tgl_keluar desc'
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

       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TOdoKmRevision.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridSPJ.ColCount:=13;
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

  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridSPJ.ColCount-1 do
    GridSPJ.Cells[IntCount,1]:='';
end;

procedure TOdoKmRevision.RefreshCombo;
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

procedure TOdoKmRevision.RefreshGrid;
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

procedure TOdoKmRevision.SelesaiClick(Sender: TObject);
begin
    Close;
end;

procedure TOdoKmRevision.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;

  RefreshCombo;
  RefreshData;
  RefreshGrid;
  Initiation:=False;
end;

procedure TOdoKmRevision.TombolCariClick(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TOdoKmRevision.ToDatesClick(Sender: TObject);
begin
  if Not(Initiation) then begin
    if ToDates.Checked=True then TanggalSampai.Enabled:=True
    else TanggalSampai.Enabled:=False;
  end;
end;

procedure TOdoKmRevision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Main.M_Normal;
  Action:=caFree;
end;

procedure TOdoKmRevision.GridSPJDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid) and (GridSPJ.Cells[0,IntRow]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('EditKMSJBusForm')=False then EditKMSJBusForm:=TEditKMSJBusForm.Create(nil,GridSPJ.Cells[0,IntRow],False);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('SPJFormBus')=False) then
          //if (GridSPJ.Cells[10,IntRow]='') then begin
            EditKMSJBusForm:=TEditKMSJBusForm.Create(nil,GridSPJ.Cells[0,IntRow],True);
            Close;
         // end else MessageBox(0,'Kendaraan Sudah Keluar','Surat Jalan',MB_OK or MB_ICONERROR);
      end;

      end;
  end;


end;

procedure TOdoKmRevision.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

end.
