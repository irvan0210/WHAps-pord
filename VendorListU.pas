unit VendorListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit, ExtCtrls;

type
  TVendorList = class(TForm)
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    Label1: TLabel;
    SBU: TComboBox;
    Panel1: TPanel;
    SBUDisp: TEdit;
    LokasiDisp: TEdit;
    Label6: TLabel;
    Cari: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SBUChange(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshGrid;
  public
    procedure RefreshList;
    constructor Create(AOwner:TComponent;Form_Request:String='';Full_List:Boolean=False);Overload;
    { Public declarations }
  end;

var
  VendorList: TVendorList;
  LokasiArr,PersArr: Array of TArrString4;
  VendorArr: Array of TArrString10;
  IntRow:Integer;
  FullList:Boolean;
  FormRequest:String;

implementation

uses MainU, ADODB, VendorFormU, StrUtils, PurchaseRequestU, PurchaseOrderU, 
  PurchaseRequestRptU;

{$R *.dfm}

constructor TVendorList.Create(AOwner:TComponent;Form_Request:String='';Full_List:Boolean=False);
begin
  FormRequest:=Form_Request;
  FullList:=Full_List;
  Inherited Create(AOwner);
end;



procedure TVendorList.Init;
var IntCount:Integer;
begin
  IntRow:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[1]:=150;
  StrGrid.ColWidths[2]:=300;
  StrGrid.ColWidths[3]:=150;
  StrGrid.ColWidths[4]:=150;
  StrGrid.ColWidths[5]:=100;
  StrGrid.Cells[0,0]:='Vendor Id';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='Telp';
  StrGrid.Cells[4,0]:='Contact';
  StrGrid.Cells[5,0]:='No HP';
  for IntCount:=0 to 5 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TVendorList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      LokasiArr[Count][2]:=Qry.FieldValues['company_id'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_company ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(PersArr,Qry.RecordCount);
      Count:=0;
      while not(Qry.Eof) do begin
         PersArr[Count][0]:=Qry.FieldValues['company_id'];
         PersArr[Count][1]:=Qry.FieldValues['name'];
         Qry.Next;
         Inc(Count);
      end;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Qry.Destroy;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
  for Count:=0 to Length(PersArr)-1 do
    SBU.Items.Add(PersArr[Count][0]);
  SBU.ItemIndex:=SBU.Items.IndexOf(CompanyId);
  SBUDisp.Text:=PersArr[SBU.ItemIndex][1];
  Main.M_Normal;
end;

procedure TVendorList.RefreshList;
var IntCount,IntCount2:Integer;
    StrQry,StrLocation,StrStat:String;
    Qry:TADOQuery;
begin
  For IntCount:=0 to Length(VendorArr)-1 do begin
    for IntCount2:=0 to 5 do
    StrGrid.Cells[IntCount2,IntCount+1]:='';
  end;
  SetLength(VendorArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (Trim(Lokasi.Text)<>'All') then StrLocation:=Lokasi.Text else StrLocation:='0';
{    StrQry:='SELECT *,COALESCE(a.phone_no1,'+Chr(39)+Chr(39)+')'+Chr(39)+','+Chr(39)+
            'COALESCE(a.phone_no2,'+Chr(39)+Chr(39)+') AS phone_no FROM wh_vendor a'+
            ' INNER JOIN wh_company b ON b.company_id=a.company_id '+
            ' INNER JOIN wh_location c ON c.location_id=a.location_id'+
            ' WHERE location_id='+Chr(39)+StrLocation+Chr(39)+
            ' AND company_id='+Chr(39)+SBU.Text+Chr(39)+';';
}
    StrQry:='EXEC GetVendorList '+SBU.Text+','+StrLocation+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(VendorArr,IntCount+1);
      VendorArr[IntCount][0]:=Qry.FieldValues['vendor_id'];
      VendorArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['address']<>NULL then VendorArr[IntCount][2]:=Qry.FieldValues['address'] else VendorArr[IntCount][2]:='';
      if Qry.FieldValues['vendor_phone_no']<>NULL then VendorArr[IntCount][3]:=Qry.FieldValues['vendor_phone_no'] else VendorArr[IntCount][3]:='';
      if Qry.FieldValues['contact']<>NULL then VendorArr[IntCount][4]:=Qry.FieldValues['contact'];
      if Qry.FieldValues['cellular_no']<>NULL then
        VendorArr[IntCount][5]:=Qry.FieldValues['cellular_no'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  RefreshGrid;
end;

procedure TVendorList.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(VendorArr)>0 then
    StrGrid.RowCount:=Length(VendorArr)+1
  else
    StrGrid.RowCount:=2;
  for IntCount:=0 to Length(VendorArr)-1 do begin
    for IntCount2:=0 to 5 do
      StrGrid.Cells[IntCount2,IntCount+1]:=VendorArr[IntCount][IntCount2];
  end;
end;

procedure TVendorList.SelesaiClick(Sender: TObject);
begin
  VendorList.Close;
end;

procedure TVendorList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVendorList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

procedure TVendorList.SBUChange(Sender: TObject);
begin
  SBUDisp.Text:=PersArr[SBU.ItemIndex][1];
  RefreshList;
end;

procedure TVendorList.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[ArrayIndexOf(LokasiArr,Lokasi.Text,0)][1];
  RefreshList;
end;

procedure TVendorList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TVendorList.StrGridDblClick(Sender: TObject);
begin
  if StrGrid.Cells[0,IntRow]<>'' then begin
    if UpperCase(FormRequest)='VENDOR FORM' then begin
      VendorForm.SetVendorId(StrGrid.Cells[0,IntRow]);
      Close;
    end else if UpperCase(FormRequest)='PR CREATE' then begin
      PurchaseRequest.VendorID.Text :=(StrGrid.Cells[0,IntRow]);
      PurchaseRequest.VendorName.Text := (StrGrid.Cells[1,IntRow]);
      Close;
    end else if UpperCase(FormRequest)='REPORT PR' then begin
      PurchaseRequestRpt.VendorID.Text :=(StrGrid.Cells[0,IntRow]);
      PurchaseRequestRpt.VendorName.Text := (StrGrid.Cells[1,IntRow]);
      Close;
    end else if UpperCase(FormRequest)='PO CREATE' then begin
      PurchaseOrder.VendorID_Disp.Text :=(StrGrid.Cells[0,IntRow]);
      PurchaseOrder.VendorDisp.Text := (StrGrid.Cells[1,IntRow]);
      Close;
    end else begin
      if (RightStr(IntToStr(TreeTag),2)='02') then VendorForm:=TVendorForm.Create(Self,StrGrid.Cells[0,IntRow],False)
      else VendorForm:=TVendorForm.Create(Self,StrGrid.Cells[0,IntRow],True);
    end;
  end;
end;

procedure TVendorList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;

begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=1;
    for Count:=0 to Length(VendorArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
      if (StrPos(PChar(UpperCase(VendorArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          StrGrid.Cells[0,Count2]:=IntToStr(Count2);
          for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2]:=VendorArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshList;;
    RefreshGrid;
  end;
end;

end.
