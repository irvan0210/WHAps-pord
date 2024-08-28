unit CustomerComplainRpt2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, AdoDB,
  Dialogs, Grids, ZColorStringGrid, StdCtrls, ComCtrls, WHUnit, DateUtils, ExtCtrls, DBGrids,
  DB, frxClass, frxDBSet, frxExportXLS, frxExportPDF;

type
  TFCustomerComplainRpt2 = class(TForm)
    pnl1: TPanel;
    cbbSBU: TComboBox;
    lbl2: TLabel;
    dtpBulan: TDateTimePicker;
    dtpTanggal: TDateTimePicker;
    dtpTglSampai: TDateTimePicker;
    pnl2: TPanel;
    btnLihatData: TButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    frxdbdtst1: TfrxDBDataset;
    frxrprt2: TfrxReport;
    qryComplainCust: TADOQuery;
    con1: TADOConnection;
    frxPDFExport1: TfrxPDFExport;
    frxlsxprt1: TfrxXLSExport;
    btn1: TButton;
    grp1: TGroupBox;
    NotCategorized: TRadioButton;
    Categorized: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure frxrprt2BeforePrint(Sender: TfrxReportComponent);
    procedure btnLihatDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString7;
    Initiation:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);Overload;
  end;

var
  FCustomerComplainRpt2: TFCustomerComplainRpt2;
  Periode: String;

implementation

uses
  MainU;

{$R *.dfm}

constructor TFCustomerComplainRpt2.Create(AOwner:TComponent);
begin
  Initiation:=True;
  inherited Create(AOwner);
end;

procedure TFCustomerComplainRpt2.FormShow(Sender: TObject);
var StrQry,StrCompanyId:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Initiation:=False;
  dtpTanggal.Date:=Now;
  dtpTglSampai.Date:=Now;
  dtpBulan.Date:=Now;
  rb2.Checked:=True;
  Categorized.Checked:=True;

  cbbSBU.Items.Clear;
  cbbSBU.Text:='';
  cbbSBU.ItemIndex:=0;
  if StrToInt(CompanyId)=1 then cbbSBU.Enabled:=True else cbbSBU.Enabled:=False;
//  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
//    Qry.Close;
    for IntCount:=0 to Length(CompanyArr)-1  do begin
      cbbSBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
      if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then cbbSBU.ItemIndex:=IntCount;
    end;
  end;
  Qry.Close;
  FreeAndNil(Qry);
//  Qry.Destroy;
  Main.CloseDb;


  Main.M_Normal;

end;

procedure TFCustomerComplainRpt2.frxrprt2BeforePrint(
  Sender: TfrxReportComponent);
begin
  if rb1.Checked = True then
  begin
     TfrxMemoView(frxrprt2.FindObject('Memo6')).Memo.Text := 'Periode: '+ DateToStr(dtpTanggal.Date) +' s/d '+ DateToStr(dtpTglSampai.Date);
  end else
  begin
    TfrxMemoView(frxrprt2.FindObject('Memo6')).Memo.Text := Periode;
  end;


  if qryComplainCust.FieldByName('status_complain').Value= 'kebersihan' then
  begin
     TfrxMemoView(frxrprt2.FindObject('Memo5')).Memo.Text := 'A. KEBERSIHAN';
  end else  if qryComplainCust.FieldByName('status_complain').Value= 'fasilitas' then
  begin
     TfrxMemoView(frxrprt2.FindObject('Memo5')).Memo.Text := 'B. FASILITAS';
  end  else  if qryComplainCust.FieldByName('status_complain').Value= 'penjemputan' then
  begin
     TfrxMemoView(frxrprt2.FindObject('Memo5')).Memo.Text := 'C. PENJEMPUTAN';
  end  else  if qryComplainCust.FieldByName('status_complain').Value= 'mogok' then
  begin
     TfrxMemoView(frxrprt2.FindObject('Memo5')).Memo.Text := 'D. MOGOK';
  end


  else
  begin
    TfrxMemoView(frxrprt2.FindObject('Memo5')).Memo.Text := 'E. PELAYANAN / CREW';
  end;
end;

procedure TFCustomerComplainRpt2.btnLihatDataClick(Sender: TObject);
var
StrQry,StrLocation,StrCompanyId,StrDate,StrDatesTo,StrJenisFilterTgl:string;
myYear, myMonth, myDay : Word;
begin

  if rb1.Checked then begin
    StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd',dtpTanggal.Date));
    StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd',dtpTglSampai.Date));

  end else begin
    DecodeDate(dtpBulan.Date, myYear, myMonth, myDay);
    Periode:= FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)) +' s/d '+ FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth)));
    StrDate:=',@Dates='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, 1)));
    StrDatesTo:=',@DatesTo='+QuotedStr(FormatDateTime('yyyy-mm-dd', EncodeDate(myYear, myMonth, DaysInAMonth(myYear, myMonth))));

  end;

  if NotCategorized.Checked=True then
  begin
    StrJenisFilterTgl:=',@JenisFilterTgl=''1''';
  end
  else begin
     StrJenisFilterTgl:=',@JenisFilterTgl=''2''';
  end;


  StrLocation:=LocationId;
  StrCompanyId:=CompanyArr[cbbSBU.ItemIndex][1];

  StrQry:='EXEC GetCustomerComplainRpt '+StrLocation+',1,'+StrCompanyId+StrDate+StrDatesTo+',@Rpt=''2'''+StrJenisFilterTgl;

  qryComplainCust.Connection:=Main.MyConnection;
  qryComplainCust.SQL.Clear;
  qryComplainCust.Close;
  qryComplainCust.SQL.Add(StrQry);
  qryComplainCust.Open;

  if  qryComplainCust.RecordCount > 0 then
  frxrprt2.ShowReport()
  else
  Application.MessageBox('Tidak ada data di filter yang dipilih','Info', mb_Ok + Mb_ICONINFORMATION);
  qryComplainCust.Close;

  Main.CloseDb;

  Main.M_Normal;
end;

procedure TFCustomerComplainRpt2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFCustomerComplainRpt2.btn1Click(Sender: TObject);
begin
  Close;
end;

end.
