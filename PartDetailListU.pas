unit PartDetailListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ADODB, WHUnit, Buttons;

type
  TPartDetailList = class(TForm)
    Selesai: TButton;
    Label1: TLabel;
    Cari: TEdit;
    StrGrid: TZColorStringGrid;
    ToXCel: TSpeedButton;
    btn_cari: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure ToXCelClick(Sender: TObject);
    procedure btn_cariClick(Sender: TObject);
  private
    PartDetailArr:Array of TArrString7;
    IntRow,IntCol:Integer;
    FormRequest:String;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    { Private declarations }
  public
    procedure LoadData(Str:String);
    procedure RefreshGrid;
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
    { Public declarations }
  end;

var
  PartDetailList: TPartDetailList;

implementation

uses MainU, PartDetailFormU, StrUtils, MaintenanceJobFormU,
  PurchaseRequestU, PurchaseRequestRptU, PurchaseOrderRptU;

{$R *.dfm}

constructor TPartDetailList.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: PartDetailList=FormRequest='+FormRequest,1);
  inherited Create(AOwner);
end;


procedure TPartDetailList.Init;
begin
  Cari.Text:='';
end;

procedure TPartDetailList.InitGrid;
var IntCount:Integer;
begin
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Kode Detail';
  StrGrid.Cells[2,0]:='Tipe';
  StrGrid.Cells[3,0]:='Group';
  StrGrid.Cells[4,0]:='Nama Detail';
  StrGrid.Cells[5,0]:='Group Armada';
  StrGrid.Cells[6,0]:='Non Inv';
  StrGrid.Cells[7,0]:='GP Reference';
  StrGrid.ColWidths[0]:=25;
  StrGrid.ColWidths[1]:=70;
  StrGrid.ColWidths[2]:=140;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=250;
  StrGrid.ColWidths[5]:=140;
  StrGrid.ColWidths[6]:=40;
  StrGrid.ColWidths[7]:=120;
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[5,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[6,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[7,0].HorizontalAlignment:=taCenter;
end;

procedure TPartDetailList.RefreshCombo;
begin

end;

procedure TPartDetailList.LoadData(Str:String);
var Qry:TADOQuery;
    StrQry, StrWhere:String;
    IntCount:Integer;
begin
  if Str <> '' then StrWhere := QuotedStr(Str)
  else  StrWhere := '';

  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPartDetailList'+StrWhere+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PartDetailArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartDetailArr[IntCount][0]:=Qry.FieldValues['part_detail_id'];
      PartDetailArr[IntCount][1]:=Qry.FieldValues['type_name'];
      PartDetailArr[IntCount][2]:=Qry.FieldValues['group_name'];
      PartDetailArr[IntCount][3]:=Qry.FieldValues['detail_name'];
      if Qry.FieldValues['brand']<>NULL then PartDetailArr[IntCount][4]:=Qry.FieldValues['brand']+' '+Qry.FieldValues['type']
      else PartDetailArr[IntCount][4]:='';
      if Qry.FieldValues['non_inventory']='1' then PartDetailArr[IntCount][5]:='v' else PartDetailArr[IntCount][5]:='' ;
      if Qry.FieldValues['detail_gp_reference_id']<>NULL then PartDetailArr[IntCount][6]:=Qry.FieldValues['detail_gp_reference_id']
      else PartDetailArr[IntCount][6]:='';
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPartDetailList.RefreshGrid;
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
    StrGrid.Cells[1,IntCount+1]:=PartDetailArr[IntCount][0];
    StrGrid.Cells[2,IntCount+1]:=PartDetailArr[IntCount][1];
    StrGrid.Cells[3,IntCount+1]:=PartDetailArr[IntCount][2];
    StrGrid.Cells[4,IntCount+1]:=PartDetailArr[IntCount][3];
    StrGrid.Cells[5,IntCount+1]:=PartDetailArr[IntCount][4];
    StrGrid.Cells[6,IntCount+1]:=PartDetailArr[IntCount][5];
    StrGrid.Cells[7,IntCount+1]:=PartDetailArr[IntCount][6];
    StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[6,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;


procedure TPartDetailList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin

{  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(PartDetailArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(PartDetailArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[Count4,Count2-1]:=IntToStr(Count2);
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4+1,Count2-1]:=PartDetailArr[Count][Count4];
          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
          Inc(Count2);
      end;
    end;
  end else begin
    LoadData;
    RefreshGrid;
  end;   }
end;


procedure TPartDetailList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TPartDetailList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartDetailList.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
 // LoadData;
 // RefreshGrid;
end;

procedure TPartDetailList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TPartDetailList.StrGridDblClick(Sender: TObject);
var
StrPartName, kode_part_gp, kd_part_datail : string;
IntCount,IntRowCount,rowcount2:Integer;
begin
  if StrGrid.Cells[1,IntRow]<>'' then begin
    if FormRequest='' then begin
      if (RightStr(IntToStr(TreeTag),2)='02') then begin
          if Main.IsFormOpen('PartDetailForm')=False then PartDetailForm:=TPartDetailForm.Create(Self,StrGrid.Cells[1,IntRow],False)
          else MessageBox(0,'Tutup Part Detail terlebih dahulu','List Part Detail',MB_OK or MB_ICONERROR);
      end else begin
          if Main.IsFormOpen('PartDetailForm')=False then PartDetailForm:=TPartDetailForm.Create(Self,StrGrid.Cells[1,IntRow])
          else MessageBox(0,'Tutup Part Detail terlebih dahulu','List Part Detail',MB_OK or MB_ICONERROR);
      end;
    end else if UpperCase(FormRequest)='MAINTENANCE-JOB' then begin
        MaintenanceJobForm.SetPartDetail(StrGrid.Cells[1,IntRow]);
        Close;
    end else begin
      if UpperCase(FormRequest)='PURCHESREQUSEST' then begin
        MessageBox(0,'Pastikan part sudah terdaftar di GP','List Part Detail',MB_OK or MB_ICONWARNING);
        StrPartName := PartDetailList.StrGrid.Cells[4,IntRow];
        kode_part_gp := PartDetailList.StrGrid.Cells[7,IntRow];
        kd_part_datail := PartDetailList.StrGrid.Cells[1,IntRow];
        if Trim(StrPartName)<>'' then
          begin
            for IntCount:=2 to PurchaseRequest.StrGrid.RowCount do begin
              if Trim(StrPartName)=PurchaseRequest.StrGrid.Cells[1,IntCount-1] then
              begin
                MessageBox(0,PChar('Item sudah dipilih'),'List Item',MB_OK or MB_ICONWARNING);
                Exit;
              end;
            end;
          end;
        IntRowCount:=PurchaseRequest.StrGrid.RowCount;
        PurchaseRequest.StrGrid.RowCount:=IntRowCount;
        {with PurchaseRequest do begin
          rowcount2:=StrGrid.RowCount;
          // 1. Cek dulu, apakah baris data pertama (Index 1) masih benar-benar kosong?
          if (StrGrid.RowCount = 2) and (StrGrid.Cells[1, 1] = '') then
          begin
            // Jika masih kosong (data pertama kali), JANGAN tambah RowCount.
            // Kita pakai saja baris index 1 yang sudah tersedia bawaan Grid.
            rowcount2 := StrGrid.RowCount; 
          end 
          else 
          begin
            // Jika baris pertama sudah ada isinya, baru kita tambah baris baru di bawahnya
            rowcount2 := StrGrid.RowCount;
            StrGrid.RowCount := StrGrid.RowCount + 1;
          end;
          StrGrid.Cells[0,StrGrid.RowCount-1]:=IntToStr(StrGrid.RowCount-1);
          StrGrid.Cells[1,StrGrid.RowCount-1]:=StrPartName;
          StrGrid.Cells[2,StrGrid.RowCount-1]:='1';
          StrGrid.Cells[5,StrGrid.RowCount-1]:=kode_part_gp;
          StrGrid.Cells[6,StrGrid.RowCount-1]:=kd_part_datail;
          StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[1,StrGrid.RowCount-1].HorizontalAlignment:=taLeftJustify;
          StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
          //ItemDetailExit(nil);
          StrGrid.Col := 3;                   // Pilih Kolom Harga Satuan
          StrGrid.Row := StrGrid.RowCount - 1; // Pilih Baris Terakhir (yang baru masuk)
          StrGrid.SetFocus;
        
          StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
          //StrGrid.RowCount := StrGrid.RowCount+1
         end;}
        with PurchaseRequest do begin
        with StrGrid do 
        begin
          // 1. Logika Baris: Cek apakah baris terakhir kosong. 
          // Jika baris terakhir (index RowCount-1) belum ada isinya, kita pakai itu saja.
          // Jika sudah ada isinya, baru kita tambah baris baru.
          if (Cells[1, RowCount - 1] <> '') then 
          begin
            RowCount := RowCount + 1;
          end;

          // 2. Isi data pada baris yang aktif (sekarang RowCount-1)
          Cells[0, RowCount - 1] := IntToStr(RowCount - 1);
          Cells[1, RowCount - 1] := StrPartName;
          Cells[2, RowCount - 1] := '1';
          Cells[5, RowCount - 1] := kode_part_gp;
          Cells[6, RowCount - 1] := kd_part_datail;

          // 3. Pengaturan Alignment (Opsional: sesuaikan dengan kebutuhan)
          CellStyle[0, RowCount - 1].HorizontalAlignment := taCenter;
          CellStyle[1, RowCount - 1].HorizontalAlignment := taLeftJustify;
          CellStyle[2, RowCount - 1].HorizontalAlignment := taCenter;

          // 4. Set Fokus
          Col := 3;
          Row := RowCount - 1;
          SetFocus;
        end;
        end;
        close;
      end else if UpperCase(FormRequest)='PURCHESREQUSESTRPT' then begin
        PurchaseRequestRpt.PartID.Text := PartDetailList.StrGrid.Cells[1,IntRow];;
        PurchaseRequestRpt.PartName.Text := PartDetailList.StrGrid.Cells[4,IntRow];;
        Close;
      end else if UpperCase(FormRequest)='PURCHESORDERRPT' then begin
        PurchaseOrderRpt.PartID.Text := PartDetailList.StrGrid.Cells[1,IntRow];;
        PurchaseOrderRpt.PartName.Text := PartDetailList.StrGrid.Cells[4,IntRow];;
        Close;
      end;
    end;
  end;
end;
procedure TPartDetailList.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then StrGridDblClick(Nil); 
end;

procedure TPartDetailList.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

procedure TPartDetailList.ToXCelClick(Sender: TObject);
begin
  if ToExcel2(StrGrid) then ShowMessage('Export ke Excel Berhasil');
end;

procedure TPartDetailList.btn_cariClick(Sender: TObject);
begin
 if Trim(Cari.Text)<>'' then begin
    LoadData(Cari.Text) ;
    RefreshGrid;
  end else
  MessageBox(0,'Silahkan Lengkapi Kolom Yang kosong','Purchase Request',MB_OK or MB_ICONERROR);
 {  else begin

    InitGrid;
    Count2:=2;
    for Count:=0 to Length(PartDetailArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 4 do
      if (StrPos(PChar(UpperCase(PartDetailArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[Count4,Count2-1]:=IntToStr(Count2);
          for Count4:=0 to 4 do
          StrGrid.Cells[Count4+1,Count2-1]:=PartDetailArr[Count][Count4];
          StrGrid.CellStyle[0,Count2-1].HorizontalAlignment:=taCenter;
          Inc(Count2);
      end;
    end;
  end; }
end;

end.
