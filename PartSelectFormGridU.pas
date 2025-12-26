unit PartSelectFormGridU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit, AppEvnts, Grids, ZColorStringGrid;

type
  TPartSelectFormGrid = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PartType: TComboBox;
    PartGroup: TComboBox;
    PartDetail: TComboBox;
    ApplicationEvnt: TApplicationEvents;
    StrGrid: TZColorStringGrid;
    Label4: TLabel;
    Cari: TEdit;
    Selesai: TButton;
    procedure PartTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartGroupChange(Sender: TObject);
    procedure PartDetailChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvntShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure FormDeactivate(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshType;
    procedure RefreshGroup;
    procedure RefreshDetail;
    procedure LoadData;
    procedure InitGrid;
    procedure RefreshGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Part_Detail_Id:String;Sender_Form:String;MyCompany_Id:String='';MyLocation_Id:String='';MyDepartment_Id:String='');Overload;
    procedure CreateParams(var Params:TCreateParams);Override;
  end;

var
  PartSelectFormGrid: TPartSelectFormGrid;
  PartDetailId,SenderForm:String;
  PartTypeArr,PartGroupArr,PartDetailArr:Array of TArrString4;
  MyCompanyId,MyLocationId,MyDepartmentId:String;

implementation

uses MainU, PurchaseOrderU, GoodTransferU, GoodAssignmentU;

{$R *.dfm}

constructor TPartSelectFormGrid.Create(AOwner:TComponent;Part_Detail_Id:String;Sender_Form:String;MyCompany_Id:String='';MyLocation_Id:String='';MyDepartment_Id:String='');
begin
  PartDetailId:=Part_Detail_Id;
  SenderForm:=Sender_Form;
  MyCompanyId:=MyCompany_Id;
  MyLocationId:=MyLocation_Id;
  MyDepartmentId:=MyDepartment_Id;
  Inherited Create(AOwner);
end;

procedure TPartSelectFormGrid.CreateParams(var Params:TCreateParams);
begin
  inherited;
  Params.style := Params.style and not WS_POPUPWINDOW;
end;


procedure TPartSelectFormGrid.Init;
begin
  PartType.Text:='';
  PartType.Items.Clear;
  PartType.ItemIndex:=-1;
end;

procedure TPartSelectFormGrid.RefreshType;
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

procedure TPartSelectFormGrid.RefreshGroup;
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

procedure TPartSelectFormGrid.RefreshDetail;
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
  RefreshGrid;
 { for IntCount:=0 to Length(PartDetailArr)-1  do
    PartDetail.Items.Add(PartDetailArr[IntCount][1]); }
  Main.M_Normal;
end;

procedure TPartSelectFormGrid.LoadData;
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
  //RefreshDetail;
  //PartDetail.ItemIndex:=PartDetail.Items.IndexOf(PartDetailId);
  Main.CloseDb;
end;

procedure TPartSelectFormGrid.PartTypeChange(Sender: TObject);
begin
  RefreshGroup;
end;

procedure TPartSelectFormGrid.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshType;
  if PartDetailId<>'' then LoadData;
end;

procedure TPartSelectFormGrid.PartGroupChange(Sender: TObject);
begin
  RefreshDetail;
end;

procedure TPartSelectFormGrid.PartDetailChange(Sender: TObject);
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

procedure TPartSelectFormGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartSelectFormGrid.ApplicationEvntShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode=VK_ESCAPE then Close;
end;

procedure TPartSelectFormGrid.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TPartSelectFormGrid.InitGrid;
var IntCount:Integer;
begin
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Nama Detail';
  StrGrid.Cells[2,0]:='ID Part';

  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=250;
  StrGrid.ColWidths[2]:=80;

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
 // StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
end;

procedure TPartSelectFormGrid.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PartDetailArr)>0 then StrGrid.RowCount:=Length(PartDetailArr)+1
  else begin
    StrGrid.RowCount:=2;
    for IntCount:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[IntCount,1]:='';
  end;
  for IntCount:=0 to Length(PartDetailArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
    StrGrid.Cells[1,IntCount+1]:=PartDetailArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=PartDetailArr[IntCount][0];
   { StrGrid.Cells[3,IntCount+1]:=PartDetailArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PartDetailArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PartDetailArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=PartDetailArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=PartDetailArr[IntCount][6];}
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    //StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TPartSelectFormGrid.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(PartDetailArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(PartDetailArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[Count4,Count2-1]:=IntToStr(Count2);
          for Count4:=0 to 2 do
          StrGrid.Cells[Count4+1,Count2-1]:=PartDetailArr[Count][Count4];
          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
          Inc(Count2);
      end;
    end;
  end else begin
    PartDetailChange(Sender);
   // LoadData;
   // RefreshGrid;
  end;
end;

procedure TPartSelectFormGrid.StrGridDblClick(Sender: TObject);
var IntCount:Integer;
    StrPartDetail, part:String;
    IntRowCount, rowcount2:Integer;
begin
 //if StrGrid.Cells[1,IntRow]<>'' then begin
  if UpperCase(SenderForm)='PURCHASEORDER' then begin
    part := StrGrid.Cells[1,IntRow];
    if Trim(part)<>'' then
      begin
        for IntCount:=2 to PurchaseOrder.StrGrid.RowCount do begin
          if Trim(part)=PurchaseOrder.StrGrid.Cells[1,IntCount-1] then
          begin
            MessageBox(0,PChar('Item sudah dipilih'),'List Item',MB_OK or MB_ICONWARNING);
            Exit;
          end;
        end;
      end;
      //MessageBox(0,PChar(StrGrid.Cells[1,IntRow]),'Kolom klik',MB_OK or MB_ICONERROR);
      StrPartDetail:= StrGrid.Cells[2,IntRow];
      PurchaseOrder.GridCell(StrPartDetail);
      Close;

    //for IntCount:=0 to Length(PartDetailArr)-1 do
    //  if PartDetail.Text=PartDetailArr[IntCount][1] then StrPartDetail:=PartDetailArr[IntCount][0];
   // PartDetail.Text := StrGrid.Cells[1,IntRow];

  end;
end;

procedure TPartSelectFormGrid.SelesaiClick(Sender: TObject);
begin
Close;
end;

procedure TPartSelectFormGrid.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

end.
