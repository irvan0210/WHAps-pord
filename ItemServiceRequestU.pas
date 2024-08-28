unit ItemServiceRequestU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ExtCtrls, ComCtrls, ADODB, WHUnit,
  ppParameter, ppStrtch, ppMemo, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDBPipe, DB, Buttons, Jpeg;

type
  TItemServiceRequest = class(TForm)
    Label3: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Selesai: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    RequestedBy: TEdit;
    PBJNo: TEdit;
    NoServiceRequest: TEdit;
    Remark: TEdit;
    TanggalPerlu: TDateTimePicker;
    GroupSifat: TPanel;
    Urgent: TRadioButton;
    Normal: TRadioButton;
    StrGrid: TZColorStringGrid;
    ItemDetail: TEdit;
    Qty: TEdit;
    Detail: TEdit;
    Batal: TCheckBox;
    Department: TComboBox;
    Simpan: TButton;
    Bersihkan: TButton;
    CetakUlang: TButton;
    CheckSelect: TCheckBox;
    Posting: TBitBtn;
    GroupTotal: TGroupBox;
    chk1: TCheckBox;
    GroupFoto: TGroupBox;
    Foto: TImage;
    ListPart: TListBox;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppCompany: TppLabel;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    ppLabel11: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLogo: TppImage;
    ppDepartmentTo: TppLabel;
    ppTanggal: TppLabel;
    ppRequestor: TppLabel;
    ppDepartmentOrigin: TppLabel;
    ppTanggalPerlu: TppLabel;
    ppNormal: TppLabel;
    ppMendesak: TppLabel;
    ppLabel2: TppLabel;
    ppLabel19: TppLabel;
    ppLabel28: TppLabel;
    ppPBJNo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppItemService: TppDBText;
    ppNo: TppDBText;
    ppQty: TppDBText;
    ppDetail: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel20: TppLabel;
    ppCatatan: TppMemo;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine3: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppRequestorSign: TppLabel;
    ppSuperior1Sign: TppLabel;
    ppSuperior2Sign: TppLabel;
    ppParameterList1: TppParameterList;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape3: TppShape;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    pp2Company: TppLabel;
    ppShape4: TppShape;
    plbl11: TppLabel;
    plbl12: TppLabel;
    plbl13: TppLabel;
    plbl14: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    plbl17: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    pp2Logo: TppImage;
    pp2DepartmentTo: TppLabel;
    pp2Tanggal: TppLabel;
    pp2Requestor: TppLabel;
    pp2DepartmentOrigin: TppLabel;
    pp2Normal: TppLabel;
    pp2Mendesak: TppLabel;
    plbl19: TppLabel;
    plbl20: TppLabel;
    plbl21: TppLabel;
    pp2PBJNo: TppLabel;
    pp2TanggalPerlu: TppLabel;
    plbl10: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    plbl22: TppLabel;
    pp2Catatan: TppMemo;
    plbl23: TppLabel;
    plbl24: TppLabel;
    plbl25: TppLabel;
    plbl26: TppLabel;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    pp2RequestorSign: TppLabel;
    pp2Superior1Sign: TppLabel;
    ppParameterList2: TppParameterList;
    pp2Superior2Sign: TppLabel;
    Label9: TLabel;
    NoPol: TEdit;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppNoPol: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    pp2NoPol: TppLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ItemDetailExit(Sender: TObject);
    procedure ItemDetailKeyPress(Sender: TObject; var Key: Char);
    procedure QtyExit(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure DetailExit(Sender: TObject);
    procedure DetailKeyPress(Sender: TObject; var Key: Char);
    procedure TanggalPerluKeyPress(Sender: TObject; var Key: Char);
    procedure DepartmentKeyPress(Sender: TObject; var Key: Char);
    procedure NormalKeyPress(Sender: TObject; var Key: Char);
    procedure UrgentKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure CetakUlangClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CheckSelectExit(Sender: TObject);
    procedure PostingClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure FotoDblClick(Sender: TObject);
    procedure ListPartDblClick(Sender: TObject);
  private
    PartArr:Array of TArrString5;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrint;
    procedure Calculate;
    procedure RefreshPart;
    { Private declarations }
  public
    procedure Reprint(ItemServiceRequest_Id:String);
    constructor Create(AOwner:TComponent;ItemServiceRequest_Id:String='';IsRead_Only:Boolean=False);Overload;
    { Public declarations }
  end;

var
  ItemServiceRequest: TItemServiceRequest;
  ItemServiceRequestId:String;
  IntRow,IntCol,MinRowGrid,IntMaxRow:Integer;
  DepartmentArr:Array of TArrString5;
  IsInputGrid,IsReadOnly:Boolean;

implementation

uses MainU, RePrintFormU, ItemServiceRequestListU, ImageViewerU;

{$R *.dfm}

constructor TItemServiceRequest.Create(AOwner:TComponent;ItemServiceRequest_Id:String='';IsRead_Only:Boolean=False);
begin
  ItemServiceRequestId:=ItemServiceRequest_Id;
  IsInputGrid:=Not(IsRead_Only);
  Inherited Create(AOwner);
end;


procedure TItemServiceRequest.Init;
begin
  IntMaxRow:=8;
  Tanggal.Text:='';
  TanggalPerlu.Date:=Now(); 
  PBJNo.Text:='';
  RequestedBy.Text:=FullName;
  Department.Text:='';
  Department.ItemIndex:=-1;
  department.Items.Clear;
  NoPol.Text:='';
  MinRowGrid:=0;
  IntCol:=0;
  IntRow:=0;
  Normal.Checked:=True;
  Remark.Text:='';
  Posting.Enabled:=False;
  CetakUlang.Enabled:=False;
  Simpan.Enabled:=True;
//  IsInputGrid:=False;
  Batal.Checked:=False;
  ppTanggal.Caption:='';
  ppTanggalPerlu.Caption:='';
  ppDepartmentTo.Caption:='';
  ppDepartmentOrigin.Caption:='';
  ppRequestor.Caption:='';
  ppRequestorSign.Caption:='';
  ppSuperior1Sign.Caption:='';
  ppSuperior2Sign.Caption:='';
  ppNormal.Font.Style:=[];
  NoServiceRequest.Text:='';
end;

procedure TItemServiceRequest.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=20;
  StrGrid.ColWidths[1]:=49;
  StrGrid.ColWidths[2]:=350;
  StrGrid.ColWidths[3]:=60;
  StrGrid.ColWidths[4]:=200;
  StrGrid.ColWidths[5]:=0;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='Check';
  StrGrid.Cells[2,0]:='Barang/Jasa';
  StrGrid.Cells[3,0]:='Jumlah';
  StrGrid.Cells[4,0]:='Keterangan';
  StrGrid.Cells[5,0]:='Kode Part GP';
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 4 do begin
    StrGrid.Cells[IntCount,1]:='';
    StrGrid.CellStyle[IntCount,1].BGColor:=clWindow;
  end;
  StrGrid.CellStyle[0,1].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,1].HorizontalAlignment:=taCenter;
end;

procedure TItemServiceRequest.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_department WHERE active=1 ;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(DepartmentArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      DepartmentArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DepartmentArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for IntCount:=0 to Length(DepartmentArr)-1  do
    Department.Items.Add(DepartmentArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TItemServiceRequest.RefreshPart;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    StrQry:='select * from wh_part where name like ''%'+ItemDetail.Text+'%'' ';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(PartArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PartArr[IntCount][0]:=Qry.FieldValues['id_part'];
      PartArr[IntCount][1]:=Qry.FieldValues['kode_part_gp'];
      PartArr[IntCount][2]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  ListPart.Items.Clear;
  for IntCount:=0 to Length(PartArr)-1  do begin
    ListPart.Items.Add(PartArr[IntCount][2]);
  end;
  Main.M_Normal;
end;


procedure TItemServiceRequest.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
  MinRowGrid:Integer;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  MinRowGrid:=0;
//  if (IsInput) then begin
//    if (StrGrid.Cells[8,ARow]='')  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
    if PBJNo.Text<>'' then begin
      case ACol of
        1 :with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;
//  end;
//var
//  R: TRect;
//begin
//  IntRow:=ARow;
//  IntCol:=ACol;
//  if IsInputGrid then begin
    if (ACol = 2) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with ItemDetail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 3) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Qty do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
    if (ACol = 4) and (ARow > MinRowGrid) then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      with Detail do begin
        Left:=R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;
        if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
        Visible:= True;
        BringToFront;
        SetFocus;
      end;
    end;
end;

procedure TItemServiceRequest.DisableInput;
begin
  TanggalPerlu.Enabled:=False;
  GroupSifat.Enabled:=False;
  Batal.Enabled:=False;
  IsInputGrid:=False;
  Remark.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TItemServiceRequest.EnableInput;
begin
  Department.Enabled:=True;
  TanggalPerlu.Enabled:=True;
  GroupSifat.Enabled:=True;
  Batal.Enabled:=True;
  Remark.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TItemServiceRequest.Calculate;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do
    if (Trim(StrGrid.Cells[1,IntCount])<>'') and (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
    end else
      StrGrid.Cells[0,IntCount]:='';
end;

procedure TItemServiceRequest.LoadData;
var Qry,Qry2,Qry3:TADOQuery;
    StrQry,StrBudget,StrBudgetTerpakai,StrBudgetTotal:String;
    IntCount:Integer;
    StmImage:TMemoryStream;
    JPG:TJPEGImage;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetItemRequestResume '+QuotedStr(ItemServiceRequestId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Tanggal.Text:=Qry.FieldValues['request_dates'];
      TanggalPerlu.Date:=StrToDate(Qry.FieldValues['requested_dates']);
      if Qry.FieldValues['no_request']<>NULL then NoServiceRequest.Text:=Qry.FieldValues['no_request']
      else NoServiceRequest.Text:='';
      PBJNo.Text:=ItemServiceRequestId;
      Department.ItemIndex:=Department.Items.IndexOf(Qry.FieldValues['to_department_name']);
      RequestedBy.Text:=Qry.FieldValues['user_name'];
      if Qry.FieldValues['importance']='1' then Urgent.Checked:=True else Normal.Checked:=True;
      if Qry.FieldValues['description']<>NULL then Remark.Text:=Qry.FieldValues['description'];
      if Qry.FieldValues['posting']='1' then begin
        Posting.Enabled:=False;
        Simpan.Enabled:=False;
        CetakUlang.Enabled:=True;
      end else begin
        Posting.Enabled:=True;
        Simpan.Enabled:=True;
        CetakUlang.Enabled:=False;
      end;
      if  Qry.FieldValues['license_plate']<>NULL then begin
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPol.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
        NoPol.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      end;
      StrQry:='EXEC GetItemRequestDetail '+QuotedStr(ItemServiceRequestId)+';';
      IntCount:=0;
      Qry2.SQL.Add(StrQry);
      Qry2.Open;
      if Qry2.RecordCount>0 then begin
        StrGrid.RowCount:=Qry2.RecordCount+1;
        while not(Qry2.Eof) do begin
          StrGrid.Cells[0,IntCount+1]:=IntToStr(IntCount+1);
          if Qry2.FieldValues['isAvailable']='1' then
            StrGrid.Cells[1,IntCount+1]:='v'
          else
            StrGrid.Cells[1,IntCount+1]:='';
          StrGrid.Cells[2,IntCount+1]:=Qry2.FieldValues['item_detail'];
          StrGrid.Cells[3,IntCount+1]:=Qry2.FieldValues['quantity'];
          if Qry2.FieldValues['detail']<>NULL then begin
            StrGrid.Cells[4,IntCount+1]:=Qry2.FieldValues['detail'];
          end else begin
            StrGrid.Cells[4,IntCount+1]:='';
          end;
          if Qry2.FieldValues['kode_part_gp']<>NULL then begin
            StrGrid.Cells[5,IntCount+1]:=Qry2.FieldValues['kode_part_gp'];
          end else begin
            StrGrid.Cells[5,IntCount+1]:='';
          end;
          StrGrid.CellStyle[0,IntCount+1].HorizontalAlignment:=taCenter;
          StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
          Inc(IntCount);
          Qry2.Next;
        end;
      end;
      Qry2.Close;
      Qry3.Close;
      StrQry:='SELECT * FROM wh_service_request_image WHERE service_request_image_id='+
            '(SELECT MAX(service_request_image_id) FROM wh_service_request_image '+
            ' WHERE service_request_id='+QuotedStr(Qry.FieldValues['no_request'])+');';
      Main.WriteLog('SQL :'+StrQry);
      Qry3.SQL.Clear;
      Qry3.SQL.Add(StrQry);
      Qry3.Open;
      if Qry3.RecordCount>0 then begin
        try
          StmImage:=TMemoryStream.Create;
          TBlobField(Qry3.FieldByName('image')).SaveToStream(StmImage);
          if StmImage.Size > 0 then begin
            JPG:=TJPEGImage.Create;
            StmImage.Position := 0;
            JPG.LoadFromStream(StmImage);
            Foto.Picture.Assign(JPG);
            Foto.Stretch:=True;
          end;
        except
          on E: EInvalidGraphic do begin
            ShowMessage('Image file is corrupted.')
          end;
        end;
      end;
      Qry3.Close;
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  if IsInputGrid=False then  DisableInput;
  Main.M_Normal;
end;

procedure TItemServiceRequest.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
  pp2Logo.Picture:=Main.LogoWHDC.Picture;
//  Main.M_Busy;
//  Qry:=TADOQuery.Create(Self);
//  Qry.Connection:=Main.MyConnection;
//  if Main.OpenDb then begin
//    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
//    Qry.SQL.Clear;
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
//    if Qry.RecordCount>0 then begin
//      ppCompany.Caption:=Qry.FieldValues['company_name'];
//      case Qry.FieldValues['logo'] of
//        1:ppLogo.Picture:=Main.LogoWH.Picture;
//        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
//        3:ppLogo.Picture:=Main.LogoWHET.Picture;
//        4:ppLogo.Picture:=Main.LogoDT.Picture;
//        5:ppLogo.Picture:=Main.LogoEUR.Picture;
//        6:ppLogo.Picture:=Main.LogoGL.Picture;
//        7:ppLogo.Picture:=Main.LogoCNR.Picture;
//        8:ppLogo.Picture:=Main.logoDTN.Picture;
//      end;
//    end;
//    Qry.Close;
//    StrQry:='SELECT name FROM wh_user WHERE username='+QuotedStr(User)+';';
//    Qry.SQL.Clear;
//    Qry.SQL.Add(StrQry);
//    Qry.Open;
//    if Qry.RecordCount>0 then begin
//      ppRequestorSign.Caption:=Qry.FieldValues['name'];
//    end;
//    Qry.Close;
//  end;
//  Qry.Destroy;
//  Main.CloseDb;
//  Main.M_Normal;
end;

procedure TItemServiceRequest.Reprint(ItemServiceRequest_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;
begin
  RePrintForm.ReportName:='ItemService Request';
  RePrintForm.ReportId:=ItemServiceRequest_Id;
  if (RePrintForm.ShowModal=1) then begin
    Main.M_Busy;
    PreparePrint;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetItemRequestResume  '+QuotedStr(ItemServiceRequest_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        pp2PBJNo.Caption:=ItemServiceRequest_Id;
        pp2Tanggal.Caption:=Qry.FieldValues['request_dates'];
        pp2TanggalPerlu.Caption:=Qry.FieldValues['requested_dates'];
        pp2DepartmentTo.Caption:=Qry.FieldValues['to_department_name'];
        pp2Requestor.Caption:=Qry.FieldValues['user_name'];
        if Qry.FieldValues['importance']=1 then begin
          pp2Normal.Font.Style:=[fsStrikeOut];
          pp2Mendesak.Font.Style:=[];
        end else begin
          pp2Normal.Font.Style:=[];
          pp2Mendesak.Font.Style:=[fsStrikeOut];
        end;
         if Qry.FieldValues['diketahui']<>NULL then
        begin
          pp2Superior1Sign.Caption:=Qry.FieldValues['diketahui'];
          pp2Superior2Sign.Caption:='Romy Firmangustri';
        end;
        pp2RequestorSign.Caption:=Qry.FieldValues['name'];

        if  Qry.FieldValues['license_plate']<>NULL then begin
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        pp2NoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
        pp2NoPol.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                       ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      end;


//        if (Qry.FieldValues['user_superior2']<>NULL) and (Qry.FieldValues['user_superior2']<>'') then begin
//          pp2Superior1Sign.Caption:=Qry.FieldValues['user_superior1'];
//          pp2Superior2Sign.Caption:=Qry.FieldValues['user_superior2'];
//        end else begin
//          pp2Superior2Sign.Caption:=Qry.FieldValues['user_superior1'];
//        end;

        if Qry.FieldValues['description']<>NULL then ppCatatan.Caption:=Qry.FieldValues['description']
        else ppCatatan.Caption:='';
        pp2DepartmentOrigin.Caption:=Qry.FieldValues['origin_department_name'];
      end;
      Qry.Close;
      StrQry:='EXEC GetItemRequestDetailPrint  '+QuotedStr(ItemServiceRequest_Id)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      ppDataSrc:=TDataSource.Create(Self);
      ppDataSrc.DataSet:=Qry;
      ppDBPipe:=TppDBPipeline.Create(Self);
      ppDBPipe.DataSource:=ppDataSrc;
      ppReport2.DataPipeline:=ppDBPipe;
      Qry.Open;
      Main.M_Normal;
      ppReport2.Print;
      Qry.Close;
    end;
    Qry.Destroy;
    Main.CloseDb;
  end;
end;

procedure TItemServiceRequest.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTransId,StrEMessage,StrCompanyId,StrLocationId,StrDepartmentId,StrRemark,StrCancel,StrisAvailable:String;
    StrToDepartmentId,StrImportance:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Department.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyId;
      StrLocationId:=LocationId;
      StrDepartmentId:=DepartmentId;
      StrToDepartmentId:=DepartmentArr[Department.ItemIndex][0];
      if Normal.Checked= True then StrImportance:='0' else if Urgent.Checked=True then StrImportance:='1';
      if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
      if PBJNo.Text='' then begin
        StrQry:='SELECT RIGHT(MAX(item_request_id),4) AS item_request_id FROM wh_item_request '+
                'WHERE item_request_id  LIKE '+Chr(39)+'R'+CompanyCode+LocationCode+DepartmentCode+
                FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____'+Chr(39)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['item_request_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['item_request_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='R'+CompanyCode+LocationCode+DepartmentCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_item_request (item_request_id,company_id,location_id,origin_department_id'+
                ',to_department_id,request_date,requester_id,requested_date,importance,description,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrDepartmentId+
                ','+StrToDepartmentId+',GETDATE(),'+QuotedStr(User)+
                ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalPerlu.Date))+','+StrImportance+
                ','+StrRemark+','+QuotedStr(User)+');';
      end else begin
        StrTransId:=PBJNo.Text;
        if Batal.Checked=True then StrCancel:='1' else StrCancel:='NULL';
        StrQry:='UPDATE wh_item_request SET requested_date='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalPerlu.Date))+
                ',importance='+StrImportance+',description='+StrRemark+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+',cancel='+StrCancel+
                ' WHERE item_request_id='+QuotedStr(StrTransId)+';';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=E.Message;
        end;
      end;
      StrQry:='';
      if Batal.Checked=False then begin
        if Trim(PBJNo.Text)<>'' then begin

          StrQry:='UPDATE wh_item_request_detail SET cancel=1 WHERE item_request_id='+QuotedStr(StrTransId)+';';
        end;
        for IntCount:=1 to StrGrid.RowCount-1 do begin
          if StrGrid.Cells[1,IntCount]='v' then begin
            StrisAvailable:='1';
          end else
          begin
            StrisAvailable:='0';
          end;
          if (Trim(StrGrid.Cells[2,IntCount])<>'') AND (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
            StrQry:=StrQry+' INSERT INTO wh_item_request_detail (item_request_id'+
                    ',item_detail,quantity,detail,update_user,isAvailable,kode_part_gp) '+
                    ' VALUES ('+QuotedStr(StrTransId)+','+QuotedStr(StrGrid.Cells[2,IntCount])+
                    ','+StrGrid.Cells[3,IntCount]+','+QuotedStr(ToString(StrGrid.Cells[4,IntCount]))+
                    ','+QuotedStr(User)+','+StrisAvailable+','+QuotedStr(ToString(StrGrid.Cells[5,IntCount]))+');';
          end;
        end;
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrEMessage:=StrEMessage+' '+E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        if Batal.Checked=False then begin
          PBJNo.Text:=StrTransId;
          Posting.Enabled:=True;
          Tanggal.Text:=Main.WhatDate;
          MessageBox(0,'Permintaan Barang/Jasa Berhasil Disimpan','',MB_OK or MB_ICONINFORMATION);
        end;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Permintaan Barang/Jasa Gagal Disimpan'+Chr(13)+Chr(13)+StrEMessage),'Permintaan Barang/Jasa',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TItemServiceRequest.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TItemServiceRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TItemServiceRequest.ItemDetailExit(Sender: TObject);
begin
  if Trim(ItemDetail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=ItemDetail.Text;
  end;
  ItemDetail.Text:='';
  ItemDetail.Visible := False;
  StrGrid.SetFocus;
end;

procedure TItemServiceRequest.ItemDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key=#13 then begin
//    ItemDetailExit(nil);
//    StrGrid.Col:=2;
//    Calculate;
//  end;
  if Key=#13 then begin
    if ItemDetail.Text<>'' then begin
      with ListPart do begin
        Left:=ItemDetail.Left;
        Top := ItemDetail.Top+25;
        Visible:= True;
        BringToFront;
      end;
      RefreshPart;
    end else begin
      ListPart.Visible:=False;
    end;
    ItemDetailExit(nil);
    Calculate;
  end;
end;

procedure TItemServiceRequest.QtyExit(Sender: TObject);
begin
  if Trim(Qty.Text)<>'' then begin
    Qty.Text:=SToCurr(ToString(Qty.Text));
    StrGrid.Cells[IntCol,IntRow]:=Qty.Text;
  end;
  Qty.Text:='';
  Qty.Visible := False;
  StrGrid.SetFocus;
end;

procedure TItemServiceRequest.QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then begin
    ItemDetailExit(nil);
    StrGrid.Col:=3;
    Calculate;
  end;
end;

procedure TItemServiceRequest.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  if ItemServiceRequestId<>'' then LoadData;
  if PBJNo.Text='' then begin
   chk1.Enabled:=False;
  end else begin
    chk1.Enabled:=True;
  end;

  if NoServiceRequest.Text<>'' then GroupFoto.Visible:=True else GroupFoto.Visible:=False;
end;


procedure TItemServiceRequest.DetailExit(Sender: TObject);
begin
  if Trim(Detail.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=Detail.Text;
    Calculate;
  end;
  Detail.Text:='';
  Detail.Visible := False;
  StrGrid.SetFocus;
end;

procedure TItemServiceRequest.DetailKeyPress(Sender: TObject;
  var Key: Char);
var IntCount:Integer;
begin
  if (Key=#13) then begin
    DetailExit(nil);
    Calculate;
    if (StrGrid.Row=StrGrid.RowCount-1) AND (StrGrid.RowCount<=IntMaxRow)  then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 4 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
      StrGrid.CellStyle[2,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGrid.Col:=0;
    StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:=1;
  end;
  if (Key=#27) then begin
    DetailExit(nil);
  end;
end;

procedure TItemServiceRequest.TanggalPerluKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Department.SetFocus;
end;

procedure TItemServiceRequest.DepartmentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Normal.SetFocus;
end;

procedure TItemServiceRequest.NormalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Remark.SetFocus;
end;

procedure TItemServiceRequest.UrgentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Remark.SetFocus;
end;

procedure TItemServiceRequest.RemarkKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then StrGrid.SetFocus;
end;

procedure TItemServiceRequest.CetakUlangClick(Sender: TObject);
begin
//  ItemServiceRequestList:=TItemServiceRequestList.Create(Self,'ItemRequest','Reprint');
 Reprint(PBJNo.Text);
end;

procedure TItemServiceRequest.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;
  EnableInput;
end;

procedure TItemServiceRequest.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;

  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TItemServiceRequest.PostingClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrisAvailable,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
    if MessageBox(0,'Apakah anda yakin ingin Posting','SJ Bus',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin

      IsOk:=True;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;

      if Main.OpenDb then begin
        Main.TransStart;

        StrTransId:=QuotedStr(PBJNo.Text);

        StrQry:=' UPDATE wh_item_request SET posting=1, update_time=GETDATE(),update_user='+QuotedStr(User)+' '+
                ' WHERE item_request_id='+StrTransId+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Posting Permintaan Barang dan Jasa!!';
            StrException:=E.Message;
          end;
        end;

        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Posting Permintaan Barang dan Jasa','',MB_OK or MB_ICONINFORMATION);
//          CekPengajuanBarangList.LoadPengajuan;
//          Close;
          Posting.Enabled:=False;
          CetakUlang.Enabled:=True;
          Simpan.Enabled:=False;
          //Init;
          //InitGrid;
          //RefreshCombo;
        end else begin
          Main.TransRollback;
          MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Checklist Integrate',MB_OK or MB_ICONERROR);
        end;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
    end;
end;

procedure TItemServiceRequest.chk1Click(Sender: TObject);
var
  intCount3:Integer;
begin
    //StrGrid.Cells[IntCol,IntRow]:='v';
    if chk1.Checked=false then begin
      for intCount3:=1 to StrGrid.RowCount-1 do begin
        StrGrid.Cells[1,intCount3]:='';
      end;
    end else begin
      for intCount3:=1 to StrGrid.RowCount-1 do begin
        if (StrGrid.Cells[5,intCount3])<>'1' then begin
          StrGrid.Cells[1,intCount3]:='v';
        end;
      end;
    end;
end;

procedure TItemServiceRequest.FotoDblClick(Sender: TObject);
begin
  if Assigned(Foto.Picture.Graphic) then
  ImageViewer:=TImageViewer.Create(Self,1,NoServiceRequest.Text,2);
end;

procedure TItemServiceRequest.ListPartDblClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(PartArr,0);
    StrQry:='select kode_part_gp from wh_part where name ='+QuotedStr(ListPart.Items.Strings[ListPart.ItemIndex]);
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
  end;

  StrGrid.Cells[3,IntRow]:= Qry.FieldValues['kode_part_gp'];
  StrGrid.Cells[IntCol,IntRow]:= ListPart.Items.Strings[ListPart.ItemIndex];
  ListPart.Visible:=False;
  Qry.Close;
end;

end.
