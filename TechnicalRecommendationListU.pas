unit TechnicalRecommendationListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, WHUnit;

type
  TTechnicalRecommendationList = class(TForm)
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    Selesai: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
  private
    { Private declarations }

    procedure AskDelete(UserGrpTreeMenuId:String);
  public
    { Public declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshList;
  end;

var
  TechnicalRecommendationList: TTechnicalRecommendationList;
  TechnicalRecomArr:Array of TArrString14;
  IntRow, IntCol:Integer;

implementation

uses MainU, ADODB, UserGroupTreeMenuU, StrUtils, TechnicalRecommendationU;

{$R *.dfm}

procedure TTechnicalRecommendationList.Init;
var IntCount:Integer;
begin
  StrGrid.RowCount:=7;
  StrGrid.ColWidths[0]:=150;
  StrGrid.ColWidths[1]:=100;
  StrGrid.ColWidths[2]:=150;
  StrGrid.ColWidths[3]:=300;
  StrGrid.ColWidths[4]:=50;
  StrGrid.ColWidths[5]:=175;
  StrGrid.ColWidths[6]:=175;
  StrGrid.Cells[0,0]:='Nomor';
  StrGrid.Cells[1,0]:='Tanggal';
  StrGrid.Cells[2,0]:='Jenis Barang';
  StrGrid.Cells[3,0]:='Alasan Pengadaan';
  StrGrid.Cells[4,0]:='Jumlah';
  StrGrid.Cells[5,0]:='Departemen';
  StrGrid.Cells[6,0]:='User / Requestor';
  StrGrid.CellStyle[0,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment := taCenter;
  StrGrid.CellStyle[0,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[1,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[2,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[3,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[4,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[5,0].BGColor:=clSkyBlue;
  StrGrid.CellStyle[6,0].BGColor:=clSkyBlue;


  StrGrid.WordWrap:=True;
  for IntCount:=0 to 6 do
    StrGrid.Cells[IntCount,1]:='';

end;

procedure TTechnicalRecommendationList.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:= 'EXEC GetTechnicalRecommendationList'+QuotedStr(CompanyId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(TechnicalRecomArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        TechnicalRecomArr[IntCount][0]:=Qry.FieldValues['technical_recommendation_no'];
        TechnicalRecomArr[IntCount][1]:=Qry.FieldValues['date'];
        TechnicalRecomArr[IntCount][2]:=Qry.FieldValues['type_of_good'];
        TechnicalRecomArr[IntCount][3]:=Qry.FieldValues['reason_for_procurement'];
        TechnicalRecomArr[IntCount][4]:=Qry.FieldValues['qty'];
        TechnicalRecomArr[IntCount][5]:=Qry.FieldValues['departement_name'];
        TechnicalRecomArr[IntCount][6]:=Qry.FieldValues['user_requestor'];
       // if Qry.FieldValues['active']=1 then TechnicalRecomArr[IntCount][4]:='Active'
      //  else TechnicalRecomArr[IntCount][4]:='Disable';
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

end;

procedure TTechnicalRecommendationList.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(TechnicalRecomArr)+1;
  for IntCount:=0 to Length(TechnicalRecomArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=TechnicalRecomArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=TechnicalRecomArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=TechnicalRecomArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=TechnicalRecomArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=TechnicalRecomArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=TechnicalRecomArr[IntCount][5];
    StrGrid.Cells[6,IntCount+1]:=TechnicalRecomArr[IntCount][6];

    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment :=taCenter;
    StrGrid.CellStyle[1,IntCount+1].HorizontalAlignment :=taCenter;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment :=taRightJustify;
  end;
end;

procedure TTechnicalRecommendationList.AskDelete(UserGrpTreeMenuId:String);
var Qry:TADOQuery;
    StrQry,StrEMsg:String;
    IsOk:Boolean;
begin
 { if (Trim(UserGrpTreeMenuId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('User Group Tree Menu Id '+UserGrpTreeMenuId+' Mau Dihapus ?') ,'User Group Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        StrQry:='DELETE FROM wh_user_grp_tree_sub_menu WHERE user_grp_tree_sub_menu_id='+Chr(39)+UserGrpTreeMenuId+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Tree Sub Menu','User Group Tree Menu',MB_OK or MB_ICONINFORMATION);
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghanpus Tree Sub Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'User Group Tree Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      RefreshList;
    end;
  end;  }
end;


procedure TTechnicalRecommendationList.SelesaiClick(Sender: TObject);
begin
  TechnicalRecommendationList.Close;
end;

procedure TTechnicalRecommendationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTechnicalRecommendationList.FormShow(Sender: TObject);
begin
  Cari.Text:='';
  Init;
  LoadData;
  RefreshList;
end;

procedure TTechnicalRecommendationList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(TechnicalRecomArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(TechnicalRecomArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 6 do
          StrGrid.Cells[Count4,Count2-1]:=TechnicalRecomArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TTechnicalRecommendationList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TTechnicalRecommendationList.StrGridDblClick(Sender: TObject);
begin
   if Main.IsFormOpen('TechnicalRecommendation')=False then
   TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow]);
   { if (RightStr(IntToStr(TreeTag),2)='04') then TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow],True)
    else if (RightStr(IntToStr(TreeTag),2)='03') then AskDelete(StrGrid.Cells[0,IntRow])
    else TechnicalRecommendation:=TTechnicalRecommendation.Create(Self,StrGrid.Cells[0,IntRow]); }
end;

end.
