unit PartSelectFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit, AppEvnts;

type
  TPartSelectForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PartType: TComboBox;
    PartGroup: TComboBox;
    PartDetail: TComboBox;
    ApplicationEvnt: TApplicationEvents;
    procedure PartTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartGroupChange(Sender: TObject);
    procedure PartDetailChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvntShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshType;
    procedure RefreshGroup;
    procedure RefreshDetail;
    procedure LoadData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Part_Detail_Id:String;Sender_Form:String;MyCompany_Id:String='';MyLocation_Id:String='';MyDepartment_Id:String='');Overload;
    procedure CreateParams(var Params:TCreateParams);Override;
  end;

var
  PartSelectForm: TPartSelectForm;
  PartDetailId,SenderForm:String;
  PartTypeArr,PartGroupArr,PartDetailArr:Array of TArrString4;
  MyCompanyId,MyLocationId,MyDepartmentId:String;

implementation

uses MainU, PurchaseOrderU, GoodTransferU, GoodAssignmentU;

{$R *.dfm}

constructor TPartSelectForm.Create(AOwner:TComponent;Part_Detail_Id:String;Sender_Form:String;MyCompany_Id:String='';MyLocation_Id:String='';MyDepartment_Id:String='');
begin
  PartDetailId:=Part_Detail_Id;
  SenderForm:=Sender_Form;
  MyCompanyId:=MyCompany_Id;
  MyLocationId:=MyLocation_Id;
  MyDepartmentId:=MyDepartment_Id;
  Inherited Create(AOwner);
end;

procedure TPartSelectForm.CreateParams(var Params:TCreateParams);
begin
  inherited;
  Params.style := Params.style and not WS_POPUPWINDOW;
end;


procedure TPartSelectForm.Init;
begin
  PartType.Text:='';
  PartType.Items.Clear;
  PartType.ItemIndex:=-1;
end;

procedure TPartSelectForm.RefreshType;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    if MyCompanyId='' then
      StrQry:='SELECT * FROM wh_part_type WHERE active=1;'
    else
      StrQry:='EXEC GetPartTypebyInventory '+MyCompanyId+','+MyLocationId+','+MyDepartmentId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartTypeArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartTypeArr[IntCount][0]:=Qry.FieldValues['part_type_id'];
      PartTypeArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(PartTypeArr)-1  do
    PartType.Items.Add(PartTypeArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TPartSelectForm.RefreshGroup;
var Qry:TADOQuery;
    StrQry,StrPartType:String;
    IntCount:Integer;
begin
  PartGroup.Text:='';
  PartGroup.Items.Clear;
  PartGroup.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    for IntCount:=0 to Length(PartTypeArr)-1 do
      if PartType.Text=PartTypeArr[IntCount][1] then StrPartType:=PartTypeArr[IntCount][0];
    if MyCompanyId='' then
     StrQry:='SELECT * FROM wh_part_group '+
             'WHERE part_type_id='+QuotedStr(StrPartType)+' ORDER BY name;'
    else
      StrQry:='EXEC GetPartGroupbyInventory '+MyCompanyId+','+MyLocationId+','+MyDepartmentId+
              ','+QuotedStr(StrPartType)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartGroupArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartGroupArr[IntCount][0]:=Qry.FieldValues['part_group_id'];
      PartGroupArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(PartGroupArr)-1  do
    PartGroup.Items.Add(PartGroupArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TPartSelectForm.RefreshDetail;
var Qry:TADOQuery;
    StrQry,StrPartGroup:String;
    IntCount:Integer;
begin
  PartDetail.Text:='';
  PartDetail.Items.Clear;
  PartDetail.ItemIndex:=-1;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    for IntCount:=0 to Length(PartGroupArr)-1 do
      if PartGroup.Text=PartGroupArr[IntCount][1] then StrPartGroup:=PartGroupArr[IntCount][0];
    if MyCompanyId='' then
      StrQry:='SELECT * FROM wh_part_detail WHERE part_group_id='+QuotedStr(StrPartGroup)+';'
    else
      StrQry:='EXEC GetPartDetailbyInventory '+MyCompanyId+','+MyLocationId+','+MyDepartmentId+
              ','+QuotedStr(StrPartGroup)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartDetailArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartDetailArr[IntCount][0]:=Qry.FieldValues['part_detail_id'];
      PartDetailArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(PartDetailArr)-1  do
    PartDetail.Items.Add(PartDetailArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TPartSelectForm.LoadData;
var Qry:TADOQuery;
    StrQry,StrGroup,StrType:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT a.name AS detail_name,b.part_group_id,b.name AS group_name,c.part_type_id,c.name AS type_name '+
            ' FROM wh_part_detail a '+
            ' INNER JOIN wh_part_group b ON b.part_group_id=a.part_group_id '+
            ' INNER JOIN wh_part_type c ON c.part_type_id=b.part_type_id '+
            ' WHERE a.name='+QuotedStr(PartDetailId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      StrType:=Qry.FieldValues['type_name'];
      StrGroup:=Qry.FieldValues['group_name'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  RefreshType;
  PartType.ItemIndex:=PartType.Items.IndexOf(StrType);
  RefreshGroup;
  PartGroup.ItemIndex:=PartGroup.Items.IndexOf(StrGroup);
  RefreshDetail;
  PartDetail.ItemIndex:=PartDetail.Items.IndexOf(PartDetailId);
  Main.CloseDb;
end;

procedure TPartSelectForm.PartTypeChange(Sender: TObject);
begin
  RefreshGroup;
end;

procedure TPartSelectForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshType;
  if PartDetailId<>'' then LoadData;
end;

procedure TPartSelectForm.PartGroupChange(Sender: TObject);
begin
  RefreshDetail;
end;

procedure TPartSelectForm.PartDetailChange(Sender: TObject);
var IntCount:Integer;
    StrPartDetail:String;
begin
  if UpperCase(SenderForm)='PURCHASEORDER' then begin
    for IntCount:=0 to Length(PartDetailArr)-1 do
      if PartDetail.Text=PartDetailArr[IntCount][1] then StrPartDetail:=PartDetailArr[IntCount][0];
    PurchaseOrder.GridCell(StrPartDetail);
    Close;
  end;
  if UpperCase(SenderForm)='GOODTRANSFER' then begin
    for IntCount:=0 to Length(PartDetailArr)-1 do
      if PartDetail.Text=PartDetailArr[IntCount][1] then StrPartDetail:=PartDetailArr[IntCount][0];
    GoodTransfer.GridCell(StrPartDetail);
    Close;
  end;
  if UpperCase(SenderForm)='GOODASSIGNMENT' then begin
    for IntCount:=0 to Length(PartDetailArr)-1 do
      if PartDetail.Text=PartDetailArr[IntCount][1] then StrPartDetail:=PartDetailArr[IntCount][0];
    GoodAssignment.GridCell(StrPartDetail);
    Close;
  end;
end;

procedure TPartSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartSelectForm.ApplicationEvntShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode=VK_ESCAPE then Close;
end;

procedure TPartSelectForm.FormDeactivate(Sender: TObject);
begin
  Close;
end;

end.
