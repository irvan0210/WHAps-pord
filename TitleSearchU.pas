unit TitleSearchU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ExtCtrls,  WHUnit, ADODB;

type
  TTitleSearch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnSelesai: TButton;
    btnBatal: TButton;
    Panel2: TPanel;
    StrGrid: TZColorStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    procedure LoadData;
    procedure RefreshList;


  public
    { Public declarations }

    DataTitleID,FormDari:String;
    IsView:Boolean;

    constructor Create(AOwner:TComponent;TitleID,FormFrom:String;IsViewOnly:Boolean=False);
  end;

var
  TitleSearch: TTitleSearch;
  TitleArr:Array of TArrString7;
  IntRow:Integer;

implementation

uses MainU, BankU;

{$R *.dfm}

constructor TTitleSearch.Create(AOwner:TComponent;TitleID,FormFrom:String;IsViewOnly:Boolean=False);
begin
  DataTitleID:=TitleID;
  FormDari:=FormFrom;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TTitleSearch.LoadData;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT title_id, title FROM wh_title WHERE status=1 ';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(TitleArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['title_id']<>NULL then
      TitleArr[Count][0]:=Qry.FieldValues['title_id'];

      if Qry.FieldValues['title']<>NULL then
      TitleArr[Count][1]:=Qry.FieldValues['title'];  

      Inc(Count);
      Qry.Next;
    end;
    
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TTitleSearch.RefreshList;
var
  IntCount:Integer;
begin

  if Length(TitleArr)>0 then
  StrGrid.RowCount:=Length(TitleArr)+1;
  for IntCount:=0 to Length(TitleArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=TitleArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=TitleArr[IntCount][1];

  end;

end;




procedure TTitleSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTitleSearch.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TTitleSearch.FormCreate(Sender: TObject);
begin
  KeyPreview :=True;
  
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Title';

  StrGrid.ColWidths[0]:=80;
  StrGrid.ColWidths[1]:=100;
  
end;

procedure TTitleSearch.FormShow(Sender: TObject);
begin
  LoadData;
  RefreshList;
end;

procedure TTitleSearch.edtCariChange(Sender: TObject);
var
  Count,Count2,Count3,Count4:Integer;
  IsTrue:Boolean;
begin
  if Trim(edtCari.Text)<>'' then begin
    //Init;
    Count2:=2;
    for Count:=0 to Length(TitleArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 1 do
      if (StrPos(PChar(UpperCase(TitleArr[Count][Count3])),PChar(UpperCase(edtCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 1 do
          StrGrid.Cells[Count4,Count2-1]:=TitleArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;



end;

procedure TTitleSearch.StrGridDblClick(Sender: TObject);
begin
  if FormDari='BankU' then begin
//     Bank.edtTitleID.Text:=StrGrid.Cells[0,IntRow];
//     Bank.edtTitle.Text:=StrGrid.Cells[1,IntRow];
  end;
  Close;
end;

procedure TTitleSearch.btnBatalClick(Sender: TObject);
begin
//  Bank.edtTitleID.Clear;
//  Bank.edtTitle.Clear;
end;

procedure TTitleSearch.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TTitleSearch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

end.
