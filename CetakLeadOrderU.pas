unit CetakLeadOrderU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ZColorStringGrid,WHUnit, ADODB;

type
  TCetakLeadOrder = class(TForm)
    Panel1: TPanel;
    StrGrid: TZColorStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    btnCetak: TButton;
    btnSelesai: TButton;
    edtDataID: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    edtCari: TEdit;
    btnBatal: TButton;
    rgBahasa: TRadioGroup;
    rgCetak: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelesaiClick(Sender: TObject);
    procedure btnSelesaiKeyPress(Sender: TObject; var Key: Char);
    procedure btnCetakClick(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }

    StrQry,StrMsg,StrEMessage:string;
    IsOk:boolean;

    DataArr:Array of TArrString7;
    IntRow:Integer;
    vCetakData,vPilihBahasa:integer;

    procedure LoadDataLeadOrder;
    procedure RefreshDataList;



  public
    { Public declarations }

    DataID,FormDari:String;
    IsView:Boolean;

    

  end;

var
  CetakLeadOrder: TCetakLeadOrder;

implementation

uses MainU, LeadOrderU;

{$R *.dfm}

procedure TCetakLeadOrder.LoadDataLeadOrder;
var
  Qry:TADOQuery;
  Count:Integer;

begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:=' SELECT t1.lead_order_id, t1.no_lead_order, UPPER(t1.sales_id) AS sales_id, '+
            '        t3.name as nama_lead  '+
            ' FROM wh_lead_order t1 '+
            ' LEFT JOIN wh_lead t3 '+
            ' ON t3.lead_id=t1.lead_id  '+
            ' WHERE t1.status=1 '+
            ' AND is_cetak_or=1 '+
            ' ORDER BY date_order DESC ';
            //' AND (CONVERT(VARCHAR(10),t1.update_time,20)) BETWEEN (CONVERT(VARCHAR(10),GETDATE()-2,20)) AND (CONVERT(VARCHAR(10),GETDATE(),20))';



    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    Count:=0;
    SetLength(DataArr,Qry.RecordCount);
    if Qry.RecordCount>0 then
    while Not(Qry.Eof) do begin
      if Qry.FieldValues['lead_order_id']<>NULL then
      DataArr[Count][0]:=Qry.FieldValues['lead_order_id'];

      if Qry.FieldValues['no_lead_order']<>NULL then
      DataArr[Count][1]:=Qry.FieldValues['no_lead_order'];

      if Qry.FieldValues['nama_lead']<>NULL then
      DataArr[Count][2]:=Qry.FieldValues['nama_lead'];

      if Qry.FieldValues['sales_id']<>NULL then
      DataArr[Count][3]:=Qry.FieldValues['sales_id'];

      Inc(Count);
      Qry.Next;
    end;

    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  Main.M_Normal;

end;

procedure TCetakLeadOrder.RefreshDataList;
var
  IntCount:Integer;
begin

  if Length(DataArr)>0 then
  StrGrid.RowCount:=Length(DataArr)+1;
  for IntCount:=0 to Length(DataArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=DataArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=DataArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=DataArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=DataArr[IntCount][3];
    
  end;

end;



procedure TCetakLeadOrder.FormCreate(Sender: TObject);
begin
    KeyPreview :=True;

    StrGrid.Cells[0,0]:='ID';
    StrGrid.Cells[1,0]:='No Lead Order ';
    StrGrid.Cells[2,0]:='Nama';
    StrGrid.Cells[3,0]:='Sales';

    StrGrid.ColWidths[0]:=150;
    StrGrid.ColWidths[1]:=170;
    StrGrid.ColWidths[2]:=300;
    StrGrid.ColWidths[3]:=100;

end;

procedure TCetakLeadOrder.FormShow(Sender: TObject);
begin
  vCetakData:=0;
  vPilihBahasa:=0;
  rgBahasa.ItemIndex:=0;
  rgCetak.ItemIndex:=0;
  
  LoadDataLeadOrder;
  RefreshDataList;
end;

procedure TCetakLeadOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TCetakLeadOrder.btnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TCetakLeadOrder.btnSelesaiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close;
end;

procedure TCetakLeadOrder.btnCetakClick(Sender: TObject);

begin
   {
   if rgCetak.ItemIndex=-1 then begin
     MessageDlg('Cetak Data Belum Di Pilih ',mtError,[mbOK],0);
     Exit;
   end else
   }
   if edtDataID.Text='' then begin
     MessageDlg('Data ID Belum Dipilih, Mohon Diisi Dulu ',mtConfirmation,[mbOK],0);
     Exit;
   end else begin

       if rgBahasa.ItemIndex=0 then begin
         //bhsInd
         vPilihBahasa:=0;
       end else
       if rgBahasa.ItemIndex=1 then begin
         //bhsIng
         vPilihBahasa:=1;
       end;

       if rgCetak.ItemIndex=0 then begin
         //Dukumentasi
         vCetakData:=0;
       end else
       if rgCetak.ItemIndex=1 then begin
         //Email
         vCetakData:=1;
       end;

       LeadOrder.CetakDataLeadOrder(vCetakData,vPilihBahasa,edtDataID.Text);

   end;



end;

procedure TCetakLeadOrder.StrGridDblClick(Sender: TObject);
begin
   edtDataID.Text:=StrGrid.Cells[0,IntRow];
end;

procedure TCetakLeadOrder.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   IntRow:=ARow;
end;

procedure TCetakLeadOrder.btnBatalClick(Sender: TObject);
begin
  edtDataID.Clear;
end;

end.
