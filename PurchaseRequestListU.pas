unit PurchaseRequestListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ADODB;

type
  TPurchaseRequestList = class(TForm)
    GroupDetail: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    SBU: TComboBox;
    Department: TComboBox;
    DepartmentDisp: TEdit;
    Year: TEdit;
    Label5: TLabel;
    Month: TComboBox;
    Label4: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Lihat: TButton;
    Label3: TLabel;
    Cari: TEdit;
    Label6: TLabel;
    Location: TComboBox;
    Label7: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LihatClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure MonthChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LocationChange(Sender: TObject);
  private
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshLocation;
    procedure RefreshData;
    procedure RefreshGrid;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');Overload;
  end;

var
  PurchaseRequestList: TPurchaseRequestList;
  FormRequest,FormFunction:String;
  CompanyArr,DepartmentArr,LocationArr:Array of TArrString4;
  PurchaseRArr:Array of TArrString8;
  IntRow:Integer;
  PurchaseExpiredDay,PurchaseExpiredMonth:Integer;


implementation

uses MainU, PurchaseRequestU, StrUtils, PurchaseOrderU, DateUtils;

{$R *.dfm}

constructor TPurchaseRequestList.Create(AOwner:TComponent;Form_Request:String='';Form_Function:String='');
begin
  FormRequest:=Form_Request;
  FormFunction:=Form_Function;
  Inherited Create(AOwner);
end;


procedure TPurchaseRequestList.Init;
begin
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  SBU.Text:='';
  Department.Items.Clear;
  Department.Text:='';
  Department.ItemIndex:=-1;
  Month.Items.Clear;
  Month.Text:='';
  Month.ItemIndex:=-1;
  Year.Text:='';
  IntRow:=0;
  if FormRequest='' then begin
     if FullName='Irvan Ruswanto' then
      GroupDetail.Enabled:=True
     else GroupDetail.Enabled:=False;
  end;

end;

procedure TPurchaseRequestList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=350;
  StrGrid.ColWidths[5]:=120;
  StrGrid.ColWidths[6]:=90;
  StrGrid.ColWidths[7]:=0;
  StrGrid.ColWidths[8]:=60;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No PR';
  StrGrid.Cells[2,0]:='Tanggal';
  StrGrid.Cells[3,0]:='Vendor';
  StrGrid.Cells[4,0]:='Budget';
  StrGrid.Cells[5,0]:='Requestor';
  StrGrid.Cells[6,0]:='Total';
  StrGrid.Cells[8,0]:='Status';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 8 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
  end;
  StrGrid.CellStyle[6,1].HorizontalAlignment:=taRightJustify;
end;

procedure TPurchaseRequestList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1;' ;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CompanyArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        CompanyArr[IntCount][0]:=Qry.FieldValues['company_id'];
        CompanyArr[IntCount][1]:=Qry.FieldValues['name']+'('+VarToStr(Qry.FieldValues['company_id'])+')';
        Qry.Next;
        Inc(IntCount);
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
    StrQry:='EXEC GetPurchaseRequestExpired';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PurchaseExpiredDay:=Qry.FieldValues['expired_day'];
      PurchaseExpiredMonth:=Qry.FieldValues['expired_month'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1 do begin
    SBU.Items.Add(CompanyArr[IntCount][1]);
    if CompanyArr[IntCount][0]=CompanyId then
      SBU.ItemIndex:=SBU.Items.IndexOf(CompanyArr[IntCount][1]);
  end;
  for IntCount:=0 to Length(DepartmentArr)-1 do
    Department.Items.Add(DepartmentArr[IntCount][0]);
  for IntCount:=1 to 12 do
    Month.Items.Add(LongMonthNames[IntCount]);
  Department.ItemIndex:=Department.Items.IndexOf(DepartmentId);
  DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
  if CompanyId<>'1' then begin
    if UpperCase(FormRequest)<>'PURCHASEORDER' then begin
      GroupDetail.Enabled:=False;
    end else begin
      if (CompanyId<>'2') and (LocationId<>'6') then GroupDetail.Enabled:= False;
    end;
    if FullName='Irvan Ruswanto' then GroupDetail.Enabled:= True;
  end;
  RefreshLocation;
  Main.M_Normal;
end;

procedure TPurchaseRequestList.RefreshLocation;
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

procedure TPurchaseRequestList.RefreshData;
var Qry:TADOQuery;
    StrQry,AwalBulan,StrLocationId,StrCompanyId:String;
    IntCount:Integer;
begin
  if (SBU.Text<>'') and (Location.Text<>'') and (Department.Text<>'') and (Month.Text<>'') and (Year.Text<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      AwalBulan:='1/'+Month.Text+'/'+Year.Text;
      StrCompanyId:=CompanyArr[SBU.ItemIndex][0];
      StrLocationId:=LocationArr[Location.ItemIndex][0];
      StrQry:='EXEC GetPurchaseRequestList '+StrCompanyId+','+StrLocationId+','+Department.Text+','+QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(AwalBulan)))+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(PurchaseRArr,Qry.RecordCount);
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        PurchaseRArr[IntCount][0]:=Qry.FieldValues['purchase_request_id'];
        PurchaseRArr[IntCount][1]:=Qry.FieldValues['request_dates'];
        PurchaseRArr[IntCount][2]:=Qry.FieldValues['vendor_name'];
        PurchaseRArr[IntCount][3]:=Qry.FieldValues['name'];
        PurchaseRArr[IntCount][4]:=Qry.FieldValues['user_name'];
        PurchaseRArr[IntCount][5]:=SToCurr(Qry.FieldValues['total']);
        if Qry.FieldValues['complete']<>NULL then PurchaseRArr[IntCount][6]:=Qry.FieldValues['complete']
        else PurchaseRArr[IntCount][6]:='';
        if Qry.FieldValues['purchase_order_id']<>NULL then PurchaseRArr[IntCount][7]:=Qry.FieldValues['purchase_order_id']
        else PurchaseRArr[IntCount][7]:='';
        if Qry.FieldValues['cancel']='1' then PurchaseRArr[IntCount][8]:=Qry.FieldValues['cancel']
        else PurchaseRArr[IntCount][8]:='';
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

procedure TPurchaseRequestList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PurchaseRArr)>0 then StrGrid.RowCount:=Length(PurchaseRArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
    end;
  end;
  for IntCount:=0 to Length(PurchaseRArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PurchaseRArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PurchaseRArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PurchaseRArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PurchaseRArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PurchaseRArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=PurchaseRArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=PurchaseRArr[IntCount][7];
    if PurchaseRArr[IntCount][6]<> '' then StrGrid.Cells[8,IntCount+1]:='Diproses'
    else StrGrid.Cells[8,IntCount+1]:='';
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taRightJustify;
    if PurchaseRArr[IntCount][8]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].BGColor:=clRed;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clRed;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clRed;
    end else if PurchaseRArr[IntCount][6]='1' then begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clGreen;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clGreen;
    end else begin
      StrGrid.CellStyle[0,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[1,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[2,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[3,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[4,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[5,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[6,IntCount+1].Font.Color:=clWindowText;
      StrGrid.CellStyle[8,IntCount+1].Font.Color:=clWindowText;
    end;
  end;
end;


procedure TPurchaseRequestList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPurchaseRequestList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPurchaseRequestList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  Year.Text:=FormatDateTime('yyyy',Now());
  Month.ItemIndex:=StrToInt(FormatDateTime('mm',Now()))-1;
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseRequestList.LihatClick(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseRequestList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TPurchaseRequestList.StrGridDblClick(Sender: TObject);
var IntCount:Integer;
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then begin
        if (StrGrid.Cells[7,IntRow]='') then begin
          if Main.IsFormOpen('PurchaseRequest')=False then PurchaseRequest:=TPurchaseRequest.Create(Self,StrGrid.Cells[1,IntRow],False)
          else MessageBox(0,'Tutup Form Purchase Request terlebih dahulu','List Purchase Request',MB_OK or MB_ICONERROR);
        end else begin
          MessageBox(0,'Batalkan Purchase Order Dahulu','List Purchase Request',MB_OK or MB_ICONERROR);
        end;
      end else begin
        if Main.IsFormOpen('PurchaseRequest')=False then PurchaseRequest:=TPurchaseRequest.Create(Self,StrGrid.Cells[1,IntRow],True)
        else MessageBox(0,'Tutup Form Purchase Request terlebih dahulu','List Purchase Request',MB_OK or MB_ICONERROR);
      end;
    end else if UpperCase(FormRequest)='PURCHASEORDER' then begin
      if StrGrid.Cells[8,IntRow]='' then begin
        if (PurchaseExpiredDay)>0 then begin
         if DaysBetween(StrToDate(Main.WhatDate),StrToDate(StrGrid.Cells[2,IntRow]))<PurchaseExpiredDay then begin
           PurchaseOrder.SetPRNo(StrGrid.Cells[1,IntRow]);
           Close;
         end else begin
            MessageBox(0,PChar('Purchase Request Sudah Kadaluarsa'+Chr(13)+Chr(13)+' Maksimum PR dapat diproses dibawah '+IntToStr(PurchaseExpiredDay)+' hari'),'List Purchase Request',MB_OK or MB_ICONERROR);
         end;
        end else if (PurchaseExpiredMonth)>0 then begin
          if MonthsBetween(StrToDate(Main.WhatDate),StrToDate(StrGrid.Cells[2,IntRow]))<PurchaseExpiredMonth then begin
             PurchaseOrder.SetPRNo(StrGrid.Cells[1,IntRow]);
             Close;
           end else begin
              MessageBox(0,PChar('Purchase Request Sudah Kadaluarsa'+Chr(13)+Chr(13)+' Maksimum PR dapat diproses PO '+IntToStr(PurchaseExpiredMonth)+' bulan'),'List Purchase Request',MB_OK or MB_ICONERROR);
           end;
        end else begin
          PurchaseOrder.SetPRNo(StrGrid.Cells[1,IntRow]);
          Close;
        end;
      end else begin
          MessageBox(0,PChar('Purchase Request sudah diproses PO'),'List Purchase Request',MB_OK or MB_ICONWARNING);
         // TPurchaseOrder.Create(Self,StrGrid.Cells[1,IntRow],True);  '+Chr(13)+Chr(13)+'
         // PurchaseOrder:=TPurchaseOrder.Create(Self,StrGrid.Cells[1,IntRow],False);
         // TPurchaseOrder.Create(Self,StrGrid.Cells[1,IntRow],True);
         // Close;
      end;
    end else if UpperCase(FormRequest)='PURCHASEREQUEST' then begin
      if UpperCase(FormFunction)='REPRINT' then begin
        if Main.IsFormOpen('PurchaseRequest')=False then PurchaseRequest:=TPurchaseRequest.Create(Self,StrGrid.Cells[1,IntRow],True);
        PurchaseRequest.Reprint(StrGrid.Cells[1,IntRow]);
      end;
      Close;
    end;
  end;
end;

procedure TPurchaseRequestList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(PurchaseRArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 7 do
        if (StrPos(PChar(UpperCase(PurchaseRArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          StrGrid.CellStyle[6,Count2+1].HorizontalAlignment:=taRightJustify;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 7 do
          StrGrid.Cells[Count4+1,Count2]:=PurchaseRArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TPurchaseRequestList.DepartmentChange(Sender: TObject);
begin
  if Department.Text<>'' then
    DepartmentDisp.Text:=DepartmentArr[Department.ItemIndex][1];
end;

procedure TPurchaseRequestList.MonthChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

procedure TPurchaseRequestList.SBUChange(Sender: TObject);
begin
  RefreshLocation;
end;

procedure TPurchaseRequestList.LocationChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

end.
