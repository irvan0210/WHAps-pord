unit BankListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls, WHUnit, ADODB, StrUtils;

type
  TBankList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    Panel2: TPanel;
    StrGridH: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridHDblClick(Sender: TObject);
    procedure StrGridHSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    procedure ClearDataGrid;

    procedure LoadDataHeader;
    procedure RefreshList;


  public
    { Public declarations }
  end;

var
  BankList: TBankList;
  BankArr:Array of TArrString5;
  IntRow:integer;

implementation

uses MainU, BankU;

{$R *.dfm}

procedure TBankList.ClearDataGrid;
var
  Count2,Count,IntCount:integer;
begin
  StrGridH.RowCount:=2;

  for Count2:=0 to 2 do
  StrGridH.Cells[Count2,1]:='';


end;


procedure TBankList.LoadDataHeader;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXECUTE GetBankMany ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(BankArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
      while Not(Qry.Eof) do begin

      if Qry.FieldValues['bank_id']<>NULL then
      BankArr[Count][0]:=Qry.FieldValues['bank_id'];

      if Qry.FieldValues['name']<>NULL then
      BankArr[Count][1]:=Qry.FieldValues['name'];
      
      if Qry.FieldValues['address']<>NULL then
      BankArr[Count][2]:=Qry.FieldValues['address'];

      Inc(Count);
      
      Qry.Next;
      end;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TBankList.RefreshList;
var
  IntCount:Integer;
begin

  if Length(BankArr)>0 then
  StrGridH.RowCount:=Length(BankArr)+1;
  for IntCount:=0 to Length(BankArr)-1 do begin
    StrGridH.Cells[0,IntCount+1]:=BankArr[IntCount][0];
    StrGridH.Cells[1,IntCount+1]:=BankArr[IntCount][1];
    StrGridH.Cells[2,IntCount+1]:=BankArr[IntCount][2];
  end;

end;



procedure TBankList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBankList.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBankList.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;

  StrGridH.Cells[0,0]:='ID';
  StrGridH.Cells[1,0]:='Nama Bank';
  StrGridH.Cells[2,0]:='Alamat';

  StrGridH.ColWidths[0]:=100;
  StrGridH.ColWidths[1]:=200;
  StrGridH.ColWidths[2]:=300;
  
end;

procedure TBankList.FormShow(Sender: TObject);
begin

  LoadDataHeader;
  RefreshList;

end;

procedure TBankList.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    //Init;
    ClearDataGrid;
    Count2:=2;
    for Count:=0 to Length(BankArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 2 do
      if (StrPos(PChar(UpperCase(BankArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGridH.RowCount:=Count2;
          for Count4:=0 to 2 do
          StrGridH.Cells[Count4,Count2-1]:=BankArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

procedure TBankList.StrGridHDblClick(Sender: TObject);
begin
  //ShowMessage(RightStr(IntToStr(TreeTag),2));
  //ShowMessage(StrGridH.Cells[0,IntRow]);

  //UPDATE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
    Bank:=TBank.Create(Self,StrGridH.Cells[0,IntRow],'','U',True);

  end
  else
  //DELETE DATA
  if (RightStr(IntToStr(TreeTag),2)='03') then begin
  //AskDelete(StrGrid.Cells[0,IntRow],StrGrid.Cells[1,IntRow]);
  //Lead:=TLead.Create(Self,StrGridH.Cells[6,IntRow],StrGridH.Cells[7,IntRow],'H',True);
  end
  else
  //LEAD LIST
  if (RightStr(IntToStr(TreeTag),2)='04') then begin
    Bank:=TBank.Create(Self,StrGridH.Cells[0,IntRow],'','L',True);

  end;

  
end;

procedure TBankList.StrGridHSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBankList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

end.
