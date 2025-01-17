unit TechnicalRecommendationU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, ComCtrls, WHUnit, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppStrtch,
  ppMemo, pngimage;

type
  TTechnicalRecommendation = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    GroupId: TPanel;
    TechnicalRekomNO: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    AlasanPengadaan: TEdit;
    NoPerangkatLama: TEdit;
    Requestor: TEdit;
    panel: TPanel;
    Selesai: TButton;
    Simpan: TButton;
    RecomExpired: TDateTimePicker;
    PerkiraanHarga: TMemo;
    Departemen: TComboBox;
    JenisBarang: TEdit;
    Jumlah: TMemo;
    Label11: TLabel;
    tgl_rekomendasi: TDateTimePicker;
    status: TCheckBox;
    cetak: TButton;
    ppReportRekomendasiTknis: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabelJudul: TppLabel;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabelNomor: TppLabel;
    ppLabel9: TppLabel;
    ppLabelTanggalBuat: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabelJenisBarang: TppLabel;
    ppLabelDepartemen: TppLabel;
    ppLabelRequestor: TppLabel;
    ppLabelQTY: TppLabel;
    ppLabelNoPerangkatLama: TppLabel;
    ppLabelAlasanPengadaan: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabelPerkiraanHarga: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabelRecomExpired: TppLabel;
    ppMemo1: TppMemo;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    MerkdanSpesifikasi: TMemo;
    ppImage1: TppImage;
    ppLabelUser: TppLabel;
    ppLabelMerkdanSpek: TppMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NoPerangkatLamaKeyPress(Sender: TObject; var Key: Char);
    procedure PerkiraanHargaChange(Sender: TObject);
    procedure PerkiraanHargaEnter(Sender: TObject);
    procedure PerkiraanHargaExit(Sender: TObject);
    procedure PerkiraanHargaKeyPress(Sender: TObject; var Key: Char);
    procedure JumlahChange(Sender: TObject);
    procedure JumlahKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshDepartemen;
    procedure RecomExpiredKeyPress(Sender: TObject; var Key: Char);
    procedure AlasanPengadaanKeyPress(Sender: TObject; var Key: Char);
    procedure DepartemenKeyPress(Sender: TObject; var Key: Char);
    procedure RequestorKeyPress(Sender: TObject; var Key: Char);
    procedure MerkdanSpesifikasiKeyPress(Sender: TObject; var Key: Char);
    procedure JenisBarangKeyPress(Sender: TObject; var Key: Char);
    procedure cetakClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;RekomNO:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  TechnicalRecommendation: TTechnicalRecommendation;
  StrRekomNO, StrLastDepartemenId, StrLastDepartemen:String;
  IsView:Boolean;
  DepartemenArr:Array of TArrString4;
  
implementation

uses MainU,  TechnicalRecommendationListU, SubMenuFormU;

{$R *.dfm}

constructor TTechnicalRecommendation.Create(AOwner:TComponent;RekomNO:String ;IsViewOnly:Boolean=False);
begin
  StrRekomNO:=RekomNO;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TTechnicalRecommendation.Init;
begin
  GroupId.Enabled:=False;
  TechnicalRekomNO.Clear;
  JenisBarang.Clear;
  Departemen.Clear;
  AlasanPengadaan.Clear;
  NoPerangkatLama.Clear;
  Requestor.Clear;
  Jumlah.Clear;
  MerkdanSpesifikasi.Clear;
  PerkiraanHarga.Clear;
  RecomExpired.Date := Now;
  tgl_rekomendasi.Date := Now;
  tgl_rekomendasi.Enabled := False;
  status.Checked := True;
  status.Enabled := False;
end;

procedure TTechnicalRecommendation.LoadData;
var Qry:TADOQuery;
    StrQry, StrDepartement:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:= 'EXEC GetTechnicalRecommendationList '+QuotedStr(StrRekomNO)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      tgl_rekomendasi.Date:=StrToDateTime(Qry.FieldValues['date']);
      TechnicalRekomNO.Text:=Qry.FieldValues['technical_recommendation_no'];
      JenisBarang.Text:=Qry.FieldValues['type_of_good'];
      AlasanPengadaan.Text:=Qry.FieldValues['reason_for_procurement'];
      NoPerangkatLama.Text:=Qry.FieldValues['old_device_no'];
      //Departemen.ItemIndex:= Qry.FieldValues['department_id'];
      StrDepartement:= Qry.FieldValues['departement_name'];
      Requestor.Text:=Qry.FieldValues['user_requestor'];
      Jumlah.Text:=SToCurr(Qry.FieldValues['qty']);
      MerkdanSpesifikasi.Text:=Qry.FieldValues['brand_and_specification'];
      PerkiraanHarga.Text:=SToCurr(Qry.FieldValues['price_forecasts']);
      RecomExpired.Date:=StrToDateTime(Qry.FieldValues['recommendation_expired']);
      if Qry.FieldValues['status'] then status.Checked:=True else status.Checked:=False;;
    end;
    Qry.Close;
    Main.CloseDb;
    Departemen.ItemIndex:= Departemen.Items.IndexOf(StrDepartement);
  end;
end;

procedure TTechnicalRecommendation.Input(IsEnable:Boolean);
begin
 // GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable;
end;

procedure TTechnicalRecommendation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TTechnicalRecommendation.SelesaiClick(Sender: TObject);
begin
  TechnicalRecommendation.Close;
end;

procedure TTechnicalRecommendation.FormShow(Sender: TObject);
begin
  Init;
  RefreshDepartemen;
  if StrRekomNO<>'' then begin
    tgl_rekomendasi.Enabled := True;
    status.Enabled := True;
    cetak.Enabled := True;
    LoadData;
  end;

  if IsView then Input(False)
  else Input(True);

end;

procedure TTechnicalRecommendation.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException, StrTechnicalRekomNO, StrDepartemenId, StrStatus, StrPesan:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if Trim(JenisBarang.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      for IntCount:=0 to Length(DepartemenArr)-1 do
      if DepartemenArr[IntCount][1]=Departemen.Text then StrDepartemenId:=DepartemenArr[IntCount][0];

      if status.Checked = True then StrStatus := '1'
      else StrStatus := '0';

      if StrRekomNO = '' then begin
          StrQry:='SELECT dbo.GetNewTechnicalRecommendationsId('+CompanyId+') AS hasil;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then
            StrRekomNO :=Qry.FieldValues['hasil'];
      end;


      if TechnicalRekomNO.Text <> '' then begin
         StrQry := 'UPDATE wh_technical_recommendations SET date ='+QuotedStr(FormatDateTime('yyyy/mm/dd',tgl_rekomendasi.Date))+', '+
                    'type_of_good ='+QuotedStr(JenisBarang.Text)+','+
                    'reason_for_procurement = '+QuotedStr(AlasanPengadaan.Text)+','+
                    'old_device_no = '+QuotedStr(NoPerangkatLama.Text)+','+
                    'department_id = '+QuotedStr(StrDepartemenId)+','+
                    'user_requestor = '+QuotedStr(Requestor.Text)+','+
                    'qty = '+QuotedStr(Jumlah.Text)+','+
                    'brand_and_specification = '+QuotedStr(MerkdanSpesifikasi.Text)+','+
                    'price_forecasts ='+ToString(PerkiraanHarga.Text)+','+
                    'recommendation_expired ='+QuotedStr(FormatDateTime('yyyy/mm/dd',RecomExpired.Date))+','+
                    'location ='+QuotedStr(CompanyId)+','+
                    'status ='+QuotedStr(StrStatus)+','+
                    'update_user ='+QuotedStr(User)+',update_time = GETDATE() '+
               'WHERE  technical_recommendation_no = '+QuotedStr(TechnicalRekomNO.Text)+';';
        StrPesan:= 'Berhasil mengubah  rekomendasi teknis';

      end
      else begin
        StrQry := 'INSERT INTO wh_technical_recommendations (technical_recommendation_no, date, type_of_good, '+
               'reason_for_procurement, old_device_no, department_id, user_requestor, qty,              '+
               'brand_and_specification, price_forecasts, recommendation_expired,location, status, user_id, create_time,    '+
               'update_user, update_time) VALUES ('+QuotedStr(StrRekomNO)+',GETDATE(),'+//QuotedStr(StrTechnicalRekomNO)+','+  (SELECT dbo.GetNewTechnicalRecommendationsId('+CompanyId+') AS hasil)
                QuotedStr(JenisBarang.Text)+','+QuotedStr(AlasanPengadaan.Text)+','+QuotedStr(NoPerangkatLama.Text)+','+
                QuotedStr(StrDepartemenId)+','+QuotedStr(Requestor.Text)+','+QuotedStr(Jumlah.Text)+','+
                QuotedStr(MerkdanSpesifikasi.Text)+','+ToString(PerkiraanHarga.Text)+','+QuotedStr(FormatDateTime('yyyy/mm/dd',RecomExpired.Date))+', '+
                CompanyId+','+QuotedStr(StrStatus)+', '+QuotedStr(User)+',GETDATE(),'+QuotedStr(User)+',GETDATE());';
        StrPesan:= 'Berhasil menyimpan rekomendasi teknis';
      end;

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);                                            //SToInt(BBMRupiah.Text
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Rekomendasi Teknis';
          StrException:=E.Message;
        end;
      end;
      TechnicalRecommendationList.LoadData;
      Qry.Close;
      Main.CloseDb;
    end;
    
    if IsOk then begin
      MessageBox(0,PChar(StrPesan),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
      if MessageBox(0,PChar('Cetak Rekomendasi Teknis?') ,'Rekomendasi Teknis',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
        cetakClick(Sender);
      end;
      Init;
      close;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Rekomendasi Teknis',MB_OK or MB_ICONERROR);
    end;
  end;

  if Main.IsFormOpen('TechnicalRecommendationList') then begin
    //TechnicalRecommendationList.Init;
    TechnicalRecommendationList.LoadData;
    TechnicalRecommendationList.RefreshList;
  end;

//  if IsOk then SubMenuForm.Close;

end;

procedure TTechnicalRecommendation.NoPerangkatLamaKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Departemen.SetFocus;
end;

procedure TTechnicalRecommendation.PerkiraanHargaChange(Sender: TObject);
begin
  if PerkiraanHarga.Text = '' then PerkiraanHarga.Text := '0';
end;

procedure TTechnicalRecommendation.PerkiraanHargaEnter(Sender: TObject);
begin
  PerkiraanHarga.Text:=ToString(PerkiraanHarga.Text);
end;

procedure TTechnicalRecommendation.PerkiraanHargaExit(Sender: TObject);
begin
    if ToString(PerkiraanHarga.Text)='' then PerkiraanHarga.Text:='0';
    PerkiraanHarga.Text:=SToCurr(PerkiraanHarga.Text);
end;

procedure TTechnicalRecommendation.PerkiraanHargaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
    if Key=#13 then RecomExpired.SetFocus;
end;

procedure TTechnicalRecommendation.JumlahChange(Sender: TObject);
begin
  if Jumlah.Text = '' then Jumlah.Text := '0';
end;

procedure TTechnicalRecommendation.JumlahKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
 if Key=#13 then MerkdanSpesifikasi.SetFocus;

end;

procedure TTechnicalRecommendation.RefreshDepartemen;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(DepartemenArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT department_id,name FROM wh_department WHERE active =1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(DepartemenArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        DepartemenArr[IntCount][0]:=Qry.FieldValues['department_id'];
        DepartemenArr[IntCount][1]:=Qry.FieldValues['name'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;

  if StrLastDepartemenId<>'' then begin
    SetLength(DepartemenArr,Length(DepartemenArr)+1);
    DepartemenArr[Length(DepartemenArr)-1][0]:=StrLastDepartemenId;
    DepartemenArr[Length(DepartemenArr)-1][1]:=StrLastDepartemen;
  end;
  for IntCount:=0 to Length(DepartemenArr)-1 do
    Departemen.Items.Add(DepartemenArr[IntCount][1]);
end;

procedure TTechnicalRecommendation.RecomExpiredKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TTechnicalRecommendation.AlasanPengadaanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoPerangkatLama.SetFocus;
end;

procedure TTechnicalRecommendation.DepartemenKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then Requestor.SetFocus;
end;

procedure TTechnicalRecommendation.RequestorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key=#13 then Jumlah.SetFocus;
end;

procedure TTechnicalRecommendation.MerkdanSpesifikasiKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then PerkiraanHarga.SetFocus;
end;

procedure TTechnicalRecommendation.JenisBarangKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then AlasanPengadaan.SetFocus;
end;

procedure TTechnicalRecommendation.cetakClick(Sender: TObject);
 var Qry:TADOQuery;
    StrQry:String;
    list:TStringList;
begin
  //if TechnicalRekomNO.Text <> '' then begin
    list:=TStringList.Create;
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Qry.CommandTimeout := 3600;
    if Main.OpenDb then begin
      StrQry:= 'EXEC GetTechnicalRecommendationList '+QuotedStr(StrRekomNO)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount > 0 then begin
       // B := TStringList.Create;
        ppLabelNomor.Caption :=  Qry.FieldValues['technical_recommendation_no'];//TechnicalRekomNO.Text;
        ppLabelTanggalBuat.Caption :=Qry.FieldValues['date']; //   StrToDateTime(DateToStr(tgl_rekomendasi.date);
        ppLabelJenisBarang.Caption := Qry.FieldValues['type_of_good'];//JenisBarang.Text;
        ppLabelAlasanPengadaan.Caption := Qry.FieldValues['reason_for_procurement'];//AlasanPengadaan.Text;
        ppLabelNoPerangkatLama.Caption := Qry.FieldValues['old_device_no'];//NoPerangkatLama.Text;
        ppLabelDepartemen.Caption := Qry.FieldValues['departement_name'];//Departemen.Text;
        ppLabelRequestor.Caption := Qry.FieldValues['user_requestor'];//Requestor.Text;
        ppLabelQTY.Caption := SToCurr(Qry.FieldValues['qty']);//Jumlah.Text;
       // MessageBox(0,PChar(MerkdanSpesifikasi.Text),'Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
       // ppLabelMerkdanSpek.Caption :=MerkdanSpesifikasi.Text;//TStringList(MerkdanSpesifikasi.Lines);
        ppLabelMerkdanSpek.Lines := MerkdanSpesifikasi.Lines;
        ppLabelPerkiraanHarga.Caption := SToCurr(Qry.FieldValues['price_forecasts']); //PerkiraanHarga.Text;
        ppLabelRecomExpired.Caption := Qry.FieldValues['recommendation_expired']; //StrToDateTime(DateToStr(RecomExpired.Date);
        ppLabelUser.Caption := user;
        Main.M_Normal;
        ppReportRekomendasiTknis.PreviewFormSettings.WindowState:=wsMaximized;
        ppReportRekomendasiTknis.Print;
      end else begin
        MessageBox(0,'Tidak ada data yang dipilih..','Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
 // end
 // else begin
   //   MessageBox(0,'Tidak ada data yang dipilih..','Rekomendasi Teknis',MB_OK or MB_ICONINFORMATION);
 // end;
end;

end.
