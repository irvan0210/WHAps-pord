unit BlockUnitFinishU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB, WHUnit, Buttons, Mask, ComCtrls,
  ExtCtrls, ppParameter, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TBlockUnitFinish = class(TForm)
    NoPKB: TComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupDetail: TGroupBox;
    StrGrid: TStringGrid;
    Cari: TEdit;
    Label7: TLabel;
    TombolCari: TSpeedButton;
    Label1: TLabel;
    Panel1: TPanel;
    Tanggal: TEdit;
    Jam: TEdit;
    Label3: TLabel;
    NoBody: TEdit;
    NoPolisi: TEdit;
    Label5: TLabel;
    CetakUlang: TButton;
    ppReport: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel387: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppNoBody: TppLabel;
    ppNoMesin: TppLabel;
    ppOdometer: TppLabel;
    ppTglKeluar: TppLabel;
    ppTglMasuk: TppLabel;
    ppLabel110: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine35: TppLine;
    ppLabel114: TppLabel;
    ppLine37: TppLine;
    ppReprinted: TppLabel;
    ppNoPKB: TppLabel;
    ppLogo: TppImage;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppTipeKendaraan: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppJenisPekerjaan: TppLabel;
    ppLabel115: TppLabel;
    ppLine33: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppShape6: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppKeluhan: TppMemo;
    ppParts: TppMemo;
    ppPekerjaan: TppMemo;
    ppRekomendasi: TppMemo;
    ppWaktu: TppMemo;
    ppTeknisi: TppMemo;
    ppKeterangan: TppMemo;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel17: TppLabel;
    ppAdminBengkel: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppParameterList4: TppParameterList;
    Label6: TLabel;
    TanggalSelesai: TDateTimePicker;
    Memo1: TMemo;
    Label8: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NoPKBChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure TombolCariClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure PartsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CetakUlangClick(Sender: TObject);
  private
    { Private declarations }
    WOArr:Array of TArrString10;
    WorkOrderId,FormRequest:String;
    IsReadOnly,Initiation:Boolean;
    IntArow,IntPCol,IntPRow:Integer;
    procedure Init;
    procedure RefreshCombo;
    procedure RefreshData;
    procedure RefreshList;
    procedure EnableInput;
    procedure DisableInput;
    procedure LoadData;
    procedure Search;
    procedure PreparePrint;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);
    procedure SetWODetail(WorkOrderId:String);
  end;

var
  BlockUnitFinish: TBlockUnitFinish;

implementation

uses MainU, DateUtils, RePrintFormU;

{$R *.dfm}

constructor TBlockUnitFinish.Create(AOwner:TComponent;WorkOrder_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  WorkOrderId:=WorkOrder_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: WorkOrderForm='+WorkOrder_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TBlockUnitFinish.Init;
begin
  NoPKB.Text:='';
  NoPKB.Items.Clear;
  NoPKB.ItemIndex:=0;
  Tanggal.Text:='';
  TanggalSelesai.Date:=Now();
  Jam.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
  StrGrid.RowCount:=2;
  Memo1.Lines.Clear;
  StrGrid.Cells[0,0]:='No PKB';
  StrGrid.Cells[1,0]:='No Body';
  StrGrid.Cells[2,0]:='No Polisi';
  StrGrid.Cells[3,0]:='Odo Msk';
  StrGrid.Cells[4,0]:='Tanggal Msk';
  StrGrid.Cells[5,0]:='Tanggal Selesai';
  StrGrid.Cells[6,0]:='Jam';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  StrGrid.Cells[6,1]:='';

  NoPKB.SetFocus;
end;

procedure TBlockUnitFinish.RefreshCombo;
var IntCount:Integer;
begin
end;

procedure TBlockUnitFinish.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if (WorkOrderId<>'') then
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@WorkOrderId='+QuotedStr(WorkOrderId)+',@flag=1,@Status=1;'
    else
      StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@flag=1,@Status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then begin
      NoPKB.Items.Add(Qry.FieldValues['work_order_id']);
      NoPKB.ItemIndex:=NoPKB.Items.IndexOf(Qry.FieldValues['work_order_id']);
      NoBody.Text:=Qry.FieldValues['body_id'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      Tanggal.Text:=Qry.FieldValues['date_in'];
      Jam.Text:=Qry.FieldValues['time_in'];
      TanggalSelesai.Date:=StrToDate(Qry.FieldValues['date_out']);

    end;
    Qry.Close;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+',1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Memo1.Lines.Text:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TBlockUnitFinish.RefreshData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetWorkOrderLists '+CompanyId+','+LocationId+',@flag=1,@Status=1,@FlgHapusBlok=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WOArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WOArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WOArr[IntCount][1]:=Qry.FieldValues['body_id'];
      WOArr[IntCount][2]:=Qry.FieldValues['license_plate'];
      if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
      else
        WOArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                            ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      WOArr[IntCount][3]:=Qry.FieldValues['odo_in'];
      WOArr[IntCount][4]:=Qry.FieldValues['date_in'];
      WOArr[IntCount][5]:=Qry.FieldValues['time_in'];
      WOArr[IntCount][6]:=Qry.FieldValues['job_inout'];
      WOArr[IntCount][7]:=Qry.FieldValues['vehicle_id'];
      WOArr[IntCount][8]:=Qry.FieldValues['date_out'];
      Qry.Next;
      Inc(IntCount);
    end;
{    StrQry:='SELECT a.work_order_id,b.description FROM wh_work_order a '+
            ' LEFT JOIN wh_work_order_detail b ON b.work_order_id=a.work_order_id'+
            ' WHERE (a.time_out IS NULL) AND (a.date_out IS NULL) AND (b.description_id=1);';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(WODetArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      WODetArr[IntCount][0]:=Qry.FieldValues['work_order_id'];
      WODetArr[IntCount][1]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
}
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
end;

procedure TBlockUnitFinish.RefreshList;
var IntCount:Integer;
begin
  if Length(WOArr)>0 then StrGrid.RowCount:=Length(WOArr)+1;
  for IntCount:=0 to Length(WOArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=WOArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=WOArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=WOArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=WOArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=WOArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=WOArr[IntCount][8];
    StrGrid.Cells[6,IntCount+1]:=WOArr[IntCount][5];
  end;
  for IntCount:=0 to Length(WOArr)-1 do NoPKB.Items.Add(WOArr[IntCount][0]);
end;

procedure TBlockUnitFinish.EnableInput;
begin
  NoPKB.Enabled:=True;
  GroupDetail.Enabled:=True;
  Simpan.Enabled:=True;

end;

procedure TBlockUnitFinish.DisableInput;
begin
  NoPKB.Enabled:=False;
  GroupDetail.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TBlockUnitFinish.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TBlockUnitFinish.FormShow(Sender: TObject);
begin
  Init;
  Cari.Text:=''; 
  EnableInput;
  if WorkOrderId<>'' then CetakUlang.Visible:=true
  else CetakUlang.Visible:=false;
    
  if IsReadOnly then begin
    LoadData;
    DisableInput;
  end else begin
    RefreshCombo;
    RefreshData;
    RefreshList;
  end;
end;

procedure TBlockUnitFinish.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBlockUnitFinish.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TBlockUnitFinish.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  if No_PKB<>'' then begin
  //  Init;
    RePrintForm.ReportName:='PKB';
    RePrintForm.ReportId:=No_PKB;
    if RePrintForm.ShowModal=1 then begin
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      PreparePrint;
      if Main.OpenDb then begin
        StrQry:='EXEC GetWorkOrderLists @WorkOrderId='+QuotedStr(No_PKB)+',@Status=1;';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          ppNoPKB.Caption:=Qry.FieldValues['work_order_id'];
          ppTglMasuk.Caption:=Qry.FieldValues['date_in'];
          if Qry.FieldValues['time_in']<>NULL then ppTglMasuk.Caption:=ppTglMasuk.Caption+' '+Qry.FieldValues['time_in'];
          if Qry.FieldValues['date_out']<>NULL then ppTglKeluar.Caption:=Qry.FieldValues['date_out'];
          if Qry.FieldValues['time_out']<>NULL then ppTglKeluar.Caption:=ppTglKeluar.Caption+' '+Qry.FieldValues['time_out'];
          ppNoBody.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          ppNoMesin.Caption:=Qry.FieldValues['engine_id'];
          ppOdometer.Caption:=IToCurr(Qry.FieldValues['odo_in']);
          ppTipeKendaraan.Caption:=Qry.FieldValues['batch_name']+' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
          ppJenisPekerjaan.Caption:=Qry.FieldValues['job_inout']+'-';
          if Qry.FieldValues['general_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'General,';
          if Qry.FieldValues['body_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Body,';
          if Qry.FieldValues['insurance']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Asuransi';
          ppAdminBengkel.Caption:=Qry.FieldValues['user_admin'];
          if Qry.FieldValues['remark']<>NULL then ppRekomendasi.Lines.Add(Qry.FieldValues['remark']);
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=1;';
          ppKeluhan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppKeluhan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=2;';
          ppPekerjaan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppPekerjaan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            ppTeknisi.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['technician']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=3;';
          ppParts.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
        end;
        ppReport.PreviewFormSettings.WindowState:=wsMaximized;
        ppReport.Print;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
    end;
  end;
end;

procedure TBlockUnitFinish.SetWODetail(WorkOrderId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount,IntRow:Integer;
begin
  if WorkOrderId<>'' then begin
    {
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    NoBody.Text:=WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=WOArr[NoPKB.ItemIndex][4];
    Jam.Text:=WOArr[NoPKB.ItemIndex][5];
    }
    NoBody.Text:=StrGrid.Cells[1,IntARow];//WOArr[NoPKB.ItemIndex][1];
    NoPolisi.Text:=StrGrid.Cells[2,IntARow];//WOArr[NoPKB.ItemIndex][2];
    Tanggal.Text:=StrGrid.Cells[4,IntARow];//WOArr[NoPKB.ItemIndex][4];
    TanggalSelesai.Date:=StrToDate(StrGrid.Cells[5,IntARow]);//WOArr[NoPKB.ItemIndex][8];
    Jam.Text:=StrGrid.Cells[6,IntARow];//WOArr[NoPKB.ItemIndex][5];
    Memo1.Lines.Clear;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(WorkOrderId)+',@flag=1;';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      IntCount:=0;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        Memo1.Lines.Text:=Qry.FieldValues['description'];
        Qry.Next;
        Inc(IntCount);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;



end;

procedure TBlockUnitFinish.NoPKBChange(Sender: TObject);
begin
  SetWODetail(NoPKB.Text);
end;

procedure TBlockUnitFinish.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntArow:=Arow;
end;

procedure TBlockUnitFinish.StrGridClick(Sender: TObject);
begin
  NoPKB.ItemIndex:=NoPKB.Items.IndexOf(StrGrid.Cells[0,IntARow]);
  SetWODetail(StrGrid.Cells[0,IntARow]);
end;

procedure TBlockUnitFinish.BersihkanClick(Sender: TObject);
begin
  EnableInput;
  Init;
  RefreshData;
  RefreshList;
  RefreshCombo;
end;

procedure TBlockUnitFinish.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId,StrVhcId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (NoPKB.Text<>'') then begin
    StrTransId:=NoPKB.Text;
    StrVhcId:=WOArr[ArrayIndexOf(WOArr,NoPKB.Text,0)][7];
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrMsg:='';
      StrEMsg:='';
      StrQry:='';
      if CompareDate(StrToDate(Tanggal.Text),TanggalSelesai.Date)=1 then begin
        IsOk:=False;
        StrEMsg:='Tanggal selesai lebih kecil dari tanggal masuk'
      end;
      Main.TransStart;
      StrQry:='UPDATE wh_work_order SET date_out='+QuotedStr(FormatDateTime('yyyy-mm-dd',TanggalSelesai.Date))+
              ',time_out='+QuotedStr('00:00')+',status=0 WHERE work_order_id='+Chr(39)+StrTransId+Chr(39)+' and flag in (1,2,3);';
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;

      StrQry:='DELETE wh_vhc_hold WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+' And form_id='+QuotedStr(NoPKB.Text)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menyimpan Pekerjaan';
          StrEMsg:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        DisableInput;
        MessageBox(0,'Blok Unit berhasil ditutup','Tutup Blok Unit',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        if StrMsg<>'' then StrMsg:=StrMsg+Chr(13)+Chr(13);
        MessageBox(0,PChar(StrMsg+'Kesalahan'+Chr(13)+StrEMsg),'Tutup Blok Unit',MB_OK or MB_ICONERROR);
      end;
      Main.CloseDb;
    end;
  end else
    MessageBox(0,'Silahkan isi kolom data yg kosong','Tutup Blok Unit',MB_OK or MB_ICONERROR);
end;

procedure TBlockUnitFinish.Search;
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(WOArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 6 do
      if (StrPos(PChar(UpperCase(WOArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          StrGrid.Cells[0,Count2-1]:=WOArr[Count][0];
          StrGrid.Cells[1,Count2-1]:=WOArr[Count][1];
          StrGrid.Cells[2,Count2-1]:=WOArr[Count][2];
          StrGrid.Cells[3,Count2-1]:=WOArr[Count][3];
          StrGrid.Cells[4,Count2-1]:=WOArr[Count][4];
          StrGrid.Cells[5,Count2-1]:=WOArr[Count][8];
          StrGrid.Cells[6,Count2-1]:=WOArr[Count][5];
          NoPKB.Items.Add(WOArr[Count][0]);
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TBlockUnitFinish.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Search; 
end;

procedure TBlockUnitFinish.TombolCariClick(Sender: TObject);
begin
  Search;
  RefreshCombo;
end;

procedure TBlockUnitFinish.CariChange(Sender: TObject);
begin
  if Trim(Cari.Text)='' then begin
    RefreshList;
    RefreshCombo;
  end;
end;

procedure TBlockUnitFinish.PartsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntPRow:=ARow;
  IntPCOl:=ACol;
end;

procedure TBlockUnitFinish.CetakUlangClick(Sender: TObject);
begin
  if WorkOrderId<>'' then RePrint(WorkOrderId)
end;

end.
