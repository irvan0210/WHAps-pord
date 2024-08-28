unit EmployeeHistoryRptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WHUnit, ppDBPipe, ppDB, ADODB, DB, ppDBBDE,
  ppVar, ppSubRpt, ppCtrls, ppReport, ppStrtch, ppParameter, ppBands,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, Jpeg, ppMemo,
  ppModule, raCodMod, Dateutils, ppRichTx;

type
  TEmployeeHistoryRpt = class(TForm)
    ppReport: TppReport;
    ppParameterList1: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppLabel49: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppMemo1: TppMemo;
    ppLabel12: TppLabel;
    ppFoto: TppImage;
    ppLabel1: TppLabel;
    ppLabel13: TppLabel;
    ppLabel3: TppLabel;
    ppLabel14: TppLabel;
    ppLabel5: TppLabel;
    ppLabel15: TppLabel;
    ppLabel7: TppLabel;
    ppLabel16: TppLabel;
    ppLabel9: TppLabel;
    ppLabel17: TppLabel;
    ppLabel11: TppLabel;
    ppNama: TppLabel;
    ppNIK: TppLabel;
    ppBatangan: TppLabel;
    ppTglLahir: TppLabel;
    ppBagian: TppLabel;
    ppTglMasuk: TppLabel;
    Label20: TppLabel;
    ppLabel19: TppLabel;
    ppUsia: TppLabel;
    Label21: TppLabel;
    ppLabel22: TppLabel;
    ppMasaKerja: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppKomplain: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel50: TppLabel;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText3: TppDBText;
    ppLabel33: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel34: TppLabel;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppSubReport1: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel32: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText5: TppDBText;
    ppLabel35: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel36: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppPelatihan: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel51: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppLabel23: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel48: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBRichText1: TppDBRichText;
    ppDBRichText2: TppDBRichText;
    ppDBRichText3: TppDBRichText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    EmplId:String;
    EmplType:String;


    procedure Init;
    procedure Print(Empl_Id:String);
    procedure PreparePrint;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);Overload;
  end;

var
  EmployeeHistoryRpt: TEmployeeHistoryRpt;
  Qry,Qry2,Qry3:TADOQuery;

implementation

uses MainU;

{$R *.dfm}

constructor TEmployeeHistoryRpt.Create(AOwner:TComponent;EmployeeType:String;EmployeeId:String);
begin
  if UpperCase(EmployeeType)='BUS' then begin
    EmplType:='Driver';
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:='Bus Boy';
  end;
  EmplId:=EmployeeId;
  Main.WriteLog('Form Open: EmployeeHistoryRpt='+EmployeeType+','+EmployeeId,1);
  Inherited Create(AOwner);
end;

procedure TEmployeeHistoryRpt.Init;
begin
  if EmplType='Driver' then Caption:='Data Riwayat Driver'
  else if EmplType='Bus Boy' then Caption:='Data Riwayat Karyawan';
  ppTglLahir.Text:='';
  ppTglMasuk.Text:='';
  ppUsia.Text:='';
  ppMasaKerja.Text:='';
end;

procedure TEmployeeHistoryRpt.PreparePrint;
var StrQry:String;
    Qry:TADOQuery;
begin
{
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      if CompanyId='9' then begin
        ppAddress2.Lines.Clear;
        ppCompany2.Caption:=Qry.FieldValues['company_name'];
        ppAddress2.Lines.Add(Qry.FieldValues['address']);
        ppPhone2.Caption:='Telp.'+Qry.FieldValues['phone_no'];
        ppFax2.Caption:='Fax.'+Qry.FieldValues['fax_no'];
        case Qry.FieldValues['logo'] of
          1:ppLogo2.Picture:=Main.LogoWH.Picture;
          2:ppLogo2.Picture:=Main.LogoWHDC.Picture;
          3:ppLogo2.Picture:=Main.LogoWHET.Picture;
          4:ppLogo2.Picture:=Main.LogoDT.Picture;
          5:ppLogo2.Picture:=Main.LogoEUR.Picture;
          6:ppLogo2.Picture:=Main.LogoGL.Picture;
          7:ppLogo2.Picture:=Main.LogoCNR.Picture;
        end;
      end;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
}
end;

(*
EXEC GetEmployeeDetail 'BU13090125'
EXEC GetEmployeeHistoryDetail 'BU13090125'
exec GetEmployeeHold 2,'BU13090125'
exec GetEmployeeHistoryDetail 'BU13090125'
*)
procedure TEmployeeHistoryRpt.Print(Empl_Id:String);
var 
    StrQry:String;
    ppDBPipe:TppDBPipeline;
    ppDataSrc:TDataSource;

    StmImage:TMemoryStream;
    JPG:TJPEGImage;

begin

  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  Qry2.CommandTimeout := 3600;
  Qry3:=TADOQuery.Create(Self);
  Qry3.Connection:=Main.MyConnection;
  Qry3.CommandTimeout := 3600;

  //ppReport.Template.FileName := ExtractFilePath(ParamStr(0)) + 'ReportCrew_font8.rtm';
  //ppReport.Template.LoadFromFile;
  ppLabel49.Caption := 'Raport '+EmplType+' WHDC';

  if Main.OpenDb then begin
    StrQry:='EXEC GetEmployeeDetail '+QuotedStr(Empl_Id);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if (Qry.FieldValues['old_id_reference']<>NULL) then
        ppNIK.Text:=Qry.FieldValues['old_id_reference']
      else
        ppNIK.Text:=Qry.FieldValues['employee_id'];
      if (Qry.FieldValues['cellular_no']<>NULL) then
        ppNama.Text:=Qry.FieldValues['name']+' - '+Qry.FieldValues['cellular_no']
      else
        ppNama.Text:=Qry.FieldValues['name'];
      if (Qry.FieldValues['license_plate']<>NULL) then ppBatangan.Text:=LicensePlate(Qry.FieldValues['license_plate'])
      else ppBatangan.Text:='';
      if (Qry.FieldValues['birth_town']<>NULL) and (Qry.FieldValues['birth_date']<>NULL) then begin
        ppTglLahir.Text:=Qry.FieldValues['birth_town']+' '+FormatDateTime('dd mmm yyyy',StrToDate(Qry.FieldValues['birth_date']));
        ppUsia.Text:= IntToStr(YearsBetween(StrToDate(Qry.FieldValues['birth_date']),Now));
      end;
      if Qry.FieldValues['join_date']<>NULL then begin
        ppTglMasuk.Text:=FormatDateTime('dd mmm yyyy',StrToDate(Qry.FieldValues['join_date']));
        ppMasaKerja.Text:= IntToStr(YearsBetween(StrToDate(Qry.FieldValues['join_date']),Now));
      end;
      ppBagian.Text:=EmplType;
      Qry.Next;
    end;
    Qry.Close;
  end;

  {Empl_Image}
  Qry.Close;
  StrQry:='SELECT * FROM wh_empl_image WHERE empl_image_id='+
          '(SELECT MAX(empl_image_id) FROM wh_empl_image '+
          ' WHERE employee_id='+Chr(39)+EmplId+Chr(39)+' AND image_id=1);';
  Main.WriteLog('SQL :'+StrQry);
  Qry.SQL.Clear;
  Qry.SQL.Add(StrQry);
  Qry.Open;
  try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        ppFoto.Picture.Assign(JPG);
        ppFoto.Stretch:=True;
        ppFoto.Center:=True;
      end;
  except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
  end;
  Qry.Close;
  StrQry:='EXEC GetCustomerComplainRefundDetail @EmployeeId='+QuotedStr(Empl_Id)+'; ';
  Qry.SQL.Clear;
  Qry.SQL.Add(StrQry);
  ppDataSrc:=TDataSource.Create(Self);
  ppDataSrc.DataSet:=Qry;
  ppDBPipe:=TppDBPipeline.Create(Self);
  ppDBPipe.DataSource:=ppDataSrc;
  Qry.Open;
  If Qry.RecordCount>0 Then Begin
    ppKomplain.DataPipeline:=ppDBPipe;
    ppLabel33.Visible := True;
  End Else Begin
    ppDataSrc.Destroy;
    ppLabel33.Visible := False;
  End;

  {Laka}
  Qry2.Close;
  StrQry:='EXEC GetEmployeeHistoryDetail '+QuotedStr(EmplId)+', 14;';
  Qry2.SQL.Clear;
  Qry2.SQL.Add(StrQry);
  ppDataSrc:=TDataSource.Create(Self);
  ppDataSrc.DataSet:=Qry2;
  ppDBPipe:=TppDBPipeline.Create(Self);
  ppDBPipe.DataSource:=ppDataSrc;
  Qry2.Open;
  If Qry2.RecordCount>0 Then begin
    ppSubReport1.DataPipeline:=ppDBPipe;
    ppLabel35.Visible := True;
  end Else begin
    ppDataSrc.Destroy;
    ppLabel35.Visible := False;
  end;

  {Training}
  Qry3.Close;
  StrQry:='EXEC GetEmployeeHistoryDetail '+QuotedStr(EmplId)+';';
  Qry3.SQL.Clear;
  Qry3.SQL.Add(StrQry);
  ppDataSrc:=TDataSource.Create(Self);
  ppDataSrc.DataSet:=Qry3;
  ppDBPipe:=TppDBPipeline.Create(Self);
  ppDBPipe.DataSource:=ppDataSrc;
  Qry3.Open;
  If Qry3.RecordCount>0 Then Begin
    ppPelatihan.DataPipeline:=ppDBPipe;
    ppLabel23.Visible := True;
  End Else Begin
    ppDataSrc.Destroy;
    ppLabel23.Visible := False
  End;
  ppReport.PreviewFormSettings.WindowState:=wsMaximized;

  ppReport.Print;
  Qry.Close;
  Qry2.Close;
  Qry3.Close;
  Qry.Destroy;
  Qry2.Destroy;
  Qry3.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  Close;
end;



procedure TEmployeeHistoryRpt.FormShow(Sender: TObject);
begin
      Init;
      Print(EmplId);
end;

procedure TEmployeeHistoryRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
