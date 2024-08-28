unit LeadListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid ,WHUnit;

type
  TLeadList = class(TForm)
    GroupCompany: TGroupBox;
    Label1: TLabel;
    SBU: TComboBox;
    Cari: TEdit;
    Label2: TLabel;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
  private
    { Private declarations }
    CompId:Integer;
    FormRequest:String;
    LeadArr,CompanyArr:Array of TArrString16;
    IntRow,IntCol:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
    constructor Create(AOwner:TComponent;List_Type:String;Form_Request:String='');Overload;
    procedure RefreshDisplay;
  end;

var
  LeadList: TLeadList;

implementation

uses MainU, ADODB, LeadU, OfferingFormU, CustomerU;

{$R *.dfm}

constructor TLeadList.Create(AOwner:TComponent);
begin
  FormRequest:='';
  CompId:=1;
  inherited Create(AOwner);
end;

constructor TLeadList.Create(AOwner:TComponent;List_Type:String;Form_Request:String='');
begin
  if UpperCase(List_Type)='TAXI' then begin
    CompId:=3;
  end else if UpperCase(List_Type)='BUS' then begin
    CompId:=2;
  end else begin
    CompId:=1;
  end;
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TLeadList.Init;
begin
  Cari.Text:='';
  SBU.Text:='';
  SBU.Items.Clear;
  SBU.ItemIndex:=-1;
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TLeadList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=False;
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=12;
  StrGrid.ColWidths[0]:=60;
  StrGrid.ColWidths[1]:=180;
  StrGrid.ColWidths[2]:=250;
  StrGrid.ColWidths[3]:=80;
  StrGrid.ColWidths[4]:=90;
  StrGrid.ColWidths[5]:=80;
  StrGrid.ColWidths[6]:=120;
  StrGrid.ColWidths[7]:=250;
  StrGrid.ColWidths[8]:=80;
  StrGrid.ColWidths[9]:=90;
  StrGrid.ColWidths[10]:=120;
  StrGrid.ColWidths[11]:=70;
  StrGrid.Cells[0,0]:='Id Prospek';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='Telephone';
  StrGrid.Cells[4,0]:='Handphone';
  StrGrid.Cells[5,0]:='Fax';
  StrGrid.Cells[6,0]:='Nama Kontak';
  StrGrid.Cells[7,0]:='Alamat';
  StrGrid.Cells[8,0]:='Telephone';
  StrGrid.Cells[9,0]:='Handphone';
  StrGrid.Cells[10,0]:='e-mail';
  StrGrid.Cells[11,0]:='Dept';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[8,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[9,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[10,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[11,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 11 do
    StrGrid.Cells[IntCount,1]:='';
end;

procedure TLeadList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
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

procedure TLeadList.RefreshData;
var Qry:TADOQuery;
    StrQry,StrCustomerLink,StrCompanyId:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(LeadArr,0);
    StrCompanyId:=CompanyArr[SBU.ItemIndex][1];
//    if UpperCase(FormRequest)='CUSTOMERFORM' then StrCustomerLink:=',@CustomerLink=1' else StrCustomerLink:='';
//    StrQry:='EXEC GetLeadList 2'+StrCustomerLink+';';
    StrQry:='EXEC GetLeadList '+StrCompanyId+',@CustomerLink=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(LeadArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      LeadArr[IntCount][0]:=Qry.FieldValues['lead_id'];
      if Qry.FieldValues['title']<>NULL then  LeadArr[IntCount][1]:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
      else LeadArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['zip']<>NULL then LeadArr[IntCount][2]:=Qry.FieldValues['address']+', '+Qry.FieldValues['zip']
      else LeadArr[IntCount][2]:=Qry.FieldValues['address'];
      LeadArr[IntCount][3]:=Qry.FieldValues['phone_no'];
      if Qry.FieldValues['cellular_no']<>NULL then LeadArr[IntCount][4]:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['fax_no']<>NULL then LeadArr[IntCount][5]:=Qry.FieldValues['fax_no'];
      if Qry.FieldValues['contact_person']<>NULL then
        if Qry.FieldValues['contact_title']<>NULL then LeadArr[IntCount][6]:=Qry.FieldValues['contact_title']+' '+Qry.FieldValues['contact_person']
        else LeadArr[IntCount][6]:=Qry.FieldValues['contact_person'];
      if Qry.FieldValues['contact_address']<>NULL then
        if Qry.FieldValues['contact_zip']<>NULL then LeadArr[IntCount][7]:=Qry.FieldValues['contact_address']+', '+Qry.FieldValues['contact_zip']
        else LeadArr[IntCount][7]:=Qry.FieldValues['contact_address'];
      if Qry.FieldValues['contact_cellular_no']<>NULL then LeadArr[IntCount][8]:=Qry.FieldValues['contact_cellular_no'];
      if Qry.FieldValues['contact_phone_no']<>NULL then LeadArr[IntCount][9]:=Qry.FieldValues['contact_phone_no'];
      if Qry.FieldValues['email']<>NULL then LeadArr[IntCount][10]:=Qry.FieldValues['email'];
      if Qry.FieldValues['department']<>NULL then LeadArr[IntCount][11]:=Qry.FieldValues['department'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TLeadList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(LeadArr)>0 then StrGrid.RowCount:=Length(LeadArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do begin
      StrGrid.Cells[IntCount,1]:='';
      StrGrid.CellStyle[IntCount,1].Font.Color:=clWindowText;
    end;
  end;
  for IntCount:=0 to Length(LeadArr)-1 do begin
    StrGrid.CellStyle[0,IntCount+1].WordWrap:=False;
    StrGrid.Cells[0,IntCount+1]:=LeadArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=LeadArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=LeadArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=LeadArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=LeadArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=LeadArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=LeadArr[IntCount][6];
    StrGrid.Cells[7,IntCount+1]:=LeadArr[IntCount][7];
    StrGrid.Cells[8,IntCount+1]:=LeadArr[IntCount][8];
    StrGrid.Cells[9,IntCount+1]:=LeadArr[IntCount][9];
    StrGrid.Cells[10,IntCount+1]:=LeadArr[IntCount][10];
    StrGrid.Cells[11,IntCount+1]:=LeadArr[IntCount][11];
   end;
end;

procedure TLeadList.FormShow(Sender: TObject);
begin
  RefreshDisplay;
end;

procedure TLeadList.RefreshDisplay;
begin
  Init;
  InitGrid;
  RefreshCombo;
  RefreshData;
  RefreshGrid;
end;

procedure TLeadList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TLeadList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLeadList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TLeadList.StrGridDblClick(Sender: TObject);
begin
  if FormRequest='' then begin
    if Main.IsFormOpen('Lead')=False then Lead:=TLead.Create(Self,StrGrid.Cells[0,IntRow],False);
  end else begin
    if UpperCase(FormRequest)='MAIN-CHANGE' then if Main.IsFormOpen('Lead')=False then begin
      Lead:=TLead.Create(nil,StrGrid.Cells[0,IntRow],True);
      LeadList.Close;
    end;
    if UpperCase(FormRequest)='OFFERINGFORM' then  begin
      OfferingForm.SetLeadId(StrGrid.Cells[0,IntRow]);
      LeadList.Close;
    end;
    if UpperCase(FormRequest)='CUSTOMERFORM' then  begin
      Customer.SetLeadId(StrGrid.Cells[0,IntRow]);
      LeadList.Close;
    end;
  end;
end;

procedure TLeadList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(LeadArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 11 do
      if (StrPos(PChar(UpperCase(LeadArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 11 do
          StrGrid.Cells[Count4,Count2-1]:=LeadArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TLeadList.SBUChange(Sender: TObject);
begin
  RefreshData;
  RefreshGrid;
end;

end.
