unit eTollNumberListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, MD5, ADODB, ZColorStringGrid, WHUnit, Buttons;

type
  TeTollNumberList = class(TForm)
    Selesai: TButton;
    Cari: TEdit;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    ToXCel: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    IntRow:Integer;
    procedure Init;
    procedure InitGrid;

    procedure DoAction;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    procedure RefreshGrid;
    procedure RefreshList;
  end;

var
  eTollNumberList: TeTollNumberList;
  Row:Integer;
  EtollArr:Array of TArrString4;
implementation

{$R *.dfm}

Uses MainU,AddUserU,UserFormU, DB, UserSignatureU, EtollFormU;

constructor TeTollNumberList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: eTollList='+Form_Request,1);

  inherited Create(AOwner);
end;

procedure TeTollNumberList.DoAction;
begin
  if (Row>0) and (StrGrid.Cells[0,Row]<>'') then begin
    if FormRequest='' then begin
      if Main.IsFormOpen('EtollForm')=False then EtollForm:=TEtollForm.Create(nil,StrGrid.Cells[0,Row],True,StrGrid.Cells[1,Row]);
    end else begin
      if UpperCase(FormRequest)='MAIN-CHANGE' then  begin
        if (Main.IsFormOpen('EtollForm')=False) then
            if Main.IsFormOpen('EtollForm')=False then EtollForm:=TEtollForm.Create(nil,StrGrid.Cells[0,Row],False,StrGrid.Cells[1,Row]);
            //Close;
      end;
    end;
  end;
end;

procedure TeTollNumberList.RefreshList;
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetEtollList '+CompanyId+';';
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(EtollArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    EtollArr[Count][0]:=Qry.FieldValues['id'];
    EtollArr[Count][1]:=eToll(Qry.FieldValues['etoll_number']);
    EtollArr[Count][2]:=(Qry.FieldValues['topup_code']);
    EtollArr[Count][3]:=SToCurr(VarToStr(Qry.FieldValues['card_limit_amount']));
    EtollArr[Count][4]:=(Qry.FieldValues['alias']);
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
end;

procedure TeTollNumberList.RefreshGrid;
var Count,Count2:Integer;
begin
  StrGrid.RowCount:=Length(EtollArr)+1;
  for Count:=0 to Length(EtollArr)-1 do
    for Count2:=0 to 4 do
      StrGrid.Cells[Count2,Count+1]:=EtollArr[Count][Count2];

end;

procedure TeTollNumberList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=5;
  StrGrid.Cells[0,0]:='Id';
  StrGrid.Cells[1,0]:='No Etoll';
  StrGrid.Cells[2,0]:='Kode Topup';
  StrGrid.Cells[3,0]:='Plafon Topup';
  StrGrid.Cells[4,0]:='Alias';

  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=125;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=75;
  StrGrid.ColWidths[4]:=145;
  for IntCount:=0 to 4 do StrGrid.Cells[IntCount,1]:='';
  RefreshList;
end;

procedure TeTollNumberList.Init;
begin
  Cari.Text:='';
  InitGrid;
  RefreshGrid;
end;

procedure TeTollNumberList.SelesaiClick(Sender: TObject);
begin
  eTollNumberList.Close;
end;

procedure TeTollNumberList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TeTollNumberList.StrGridDblClick(Sender: TObject);
begin
  DoAction;
end;

procedure TeTollNumberList.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Row:=ARow;
  IntRow:=ARow;
end;

procedure TeTollNumberList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then DoAction;
  if Key=#27 then eTollNumberList.Close; 

end;

procedure TeTollNumberList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(EtollArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
        if (StrPos(PChar(UpperCase(Trim(EtollArr[Count][Count3]))),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 4 do begin
              StrGrid.Cells[Count4,Count2-1]:=EtollArr[Count][Count4]
          end;
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TeTollNumberList.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TeTollNumberList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

procedure TeTollNumberList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
    else ShowMessage('Export ke Excel Gagal');
end;

end.
