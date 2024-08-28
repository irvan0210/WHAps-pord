unit VendorFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB, WHUnit, Buttons;

type
  TVendorForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupVendorId: TPanel;
    VId: TEdit;
    Label8: TLabel;
    Selesai: TButton;
    GroupInput: TPanel;
    Nama: TEdit;
    Alamat: TEdit;
    NoFax: TEdit;
    Label5: TLabel;
    ContactPerson: TEdit;
    NoHP: TEdit;
    NoTelp1: TMaskEdit;
    NoTelp2: TMaskEdit;
    Title: TComboBox;
    Label9: TLabel;
    GPReference: TEdit;
    Label10: TLabel;
    TermOfPayment: TComboBox;
    Label11: TLabel;
    Status: TCheckBox;
    Simpan: TButton;
    Cari: TSpeedButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure AlamatKeyPress(Sender: TObject; var Key: Char);
    procedure NoTelp1KeyPress(Sender: TObject; var Key: Char);
    procedure NoTelp2KeyPress(Sender: TObject; var Key: Char);
    procedure ContactPersonKeyPress(Sender: TObject; var Key: Char);
    procedure NoFaxKeyPress(Sender: TObject; var Key: Char);
    procedure NoHPKeyPress(Sender: TObject; var Key: Char);
    procedure CariClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData(VId:String='');
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;Vendor_Id:String='';IsRead_Only:Boolean=True);Overload;
    procedure SetVendorId(Vendor_Id:String);
  end;

var
  VendorForm: TVendorForm;
  VendorId,VenId:String;
  TitleArr,PaymentTermArr:Array of TArrString4;
  IsReadOnly:Boolean;

implementation

uses MainU, StrUtils, VendorListU;

{$R *.dfm}

Constructor TVendorForm.Create(AOwner:TComponent;Vendor_Id:String='';IsRead_Only:Boolean=True);
begin
  IsReadOnly:=IsRead_Only;
  VendorId:=Vendor_Id;
  Inherited Create(AOwner);
end;

procedure TVendorForm.Init;
begin
  VenId:='';
  VId.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  NoTelp1.Text:='';
  NoTelp2.Text:='';
  NoFax.Text:='';
  ContactPerson.Text:='';
  NoHP.Text:='';
  Title.Text:='';
  Title.Items.Clear;
  Title.ItemIndex:=-1;
  TermOfPayment.Text:='';
  TermOfPayment.Items.Clear;
  TermOfPayment.ItemIndex:=-1;
  Status.Checked:=True;
  EnableInput;
end;

procedure TVendorForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_title WHERE status=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(TitleArr,1);
    TitleArr[0][0]:='';
    TitleArr[0][1]:='';
    SetLength(TitleArr,Qry.RecordCount+1);
    if Qry.RecordCount>0 then begin
      while Not(Qry.Eof) do begin
        TitleArr[IntCount][0]:=Qry.FieldValues['title_id'];
        TitleArr[IntCount][1]:=Qry.FieldValues['title'];
        Qry.Next;
        Inc(IntCount);
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_payment_term WHERE active=1;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(PaymentTermArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      PaymentTermArr[IntCount][0]:=Qry.FieldValues['payment_term_id'];
      PaymentTermArr[IntCount][1]:=Qry.FieldValues['name'];
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Qry.Destroy;
  for IntCount:=0 to Length(PaymentTermArr)-1 do
    TermOfPayment.Items.Add(PaymentTermArr[IntCount][1]);
  for IntCount:=0 to Length(TitleArr)-1 do
    Title.Items.Add(TitleArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TVendorForm.LoadData(VId:String='');
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    if VId='' then VId:=VendorId; 
    StrQry:='SELECT a.*,COALESCE(b.title,'+QuotedStr('')+') AS title,COALESCE(c.name,'+QuotedStr('')+') AS payment_term '+
            ' FROM wh_vendor a'+
            ' LEFT JOIN wh_title b ON b.title_id=a.title_id'+
            ' LEFT JOIN wh_payment_term c ON c.payment_term_id=a.payment_term_id'+
            ' WHERE vendor_id='+QuotedStr(VId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      Title.ItemIndex:=Title.Items.IndexOf(Qry.FieldValues['title']);
      Nama.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['address']<>NULL then Alamat.Text:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone_no1']<>NULL then NoTelp1.Text:=Qry.FieldValues['phone_no1'];
      if Qry.FieldValues['phone_no2']<>NULL then NoTelp2.Text:=Qry.FieldValues['phone_no2'];
      if Qry.FieldValues['fax_no']<>NULL then NoFax.Text:=Qry.FieldValues['fax_no'];
      if Qry.FieldValues['contact']<>NULL then ContactPerson.Text:=Qry.FieldValues['contact'];
      if Qry.FieldValues['cellular_no']<>NULL then NoHP.Text:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['gp_reference_id']<>NULL then GPReference.Text:=Qry.FieldValues['gp_reference_id'];
      TermOfPayment.ItemIndex:=TermOfPayment.Items.IndexOf(Qry.FieldValues['payment_term']);
      if Qry.FieldValues['active']=1 then Status.Checked:=True else Status.Checked:=False;
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  Qry.Destroy;
  Main.M_Normal;
end;


procedure TVendorForm.SelesaiClick(Sender: TObject);
begin
  VendorForm.Close;
end;

procedure TVendorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TVendorForm.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if VendorId='' then begin
    VId.Visible:=False;
    Label1.Visible:=False;
  end else begin
    Label1.Visible:=True;
    VId.Visible:=True;
    VId.Text:=VendorId;
    LoadData;
    if IsReadOnly=True then DisableInput;
  end;
end;

procedure TVendorForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrNoTelp1,StrNoTelp2,StrContact,StrNoFax,StrNoHP,StrEMsg,StrTransId,StrTitle,StrGPRef,StrPaymentTerm,StrActive:String;
    IsOk:Boolean;
begin
  if (Trim(Nama.Text)<>'') AND (TermOfPayment.Text<>'')then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrTransId:='';
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      if NoTelp1.Text<>'' then StrNoTelp1:=Chr(39)+Trim(NoTelp1.Text)+Chr(39) else StrNoTelp1:='NULL';
      if NoTelp2.Text<>'' then StrNoTelp2:=Chr(39)+Trim(NoTelp2.Text)+Chr(39) else StrNoTelp2:='NULL';
      if NoFax.Text<>'' then StrNoFax:=Chr(39)+Trim(NoFax.Text)+Chr(39) else StrNoFax:='NULL';
      if ContactPerson.Text<>'' then StrContact:=QuotedStr(Trim(ContactPerson.Text)) else StrContact:='NULL';
      if NoHP.Text<>'' then StrNoHP:=QuotedStr(Trim(NoHP.Text)) else StrNoHP:='NULL';
      if Title.ItemIndex>0 then StrTitle:=IntToStr(Title.ItemIndex) else StrTitle:='NULL';
      if GPReference.Text<>'' then StrGPRef:=QuotedStr(GPReference.Text) else StrGPRef:='NULL';
      StrPaymentTerm:=PaymentTermArr[TermOfPayment.ItemIndex][0];
      if Status.Checked=True then StrActive:='1' else StrActive:='0';
      if (VenId='') then begin
        if (Trim(VId.Text)='') then begin
          StrQry:='SELECT RIGHT(MAX(vendor_id),3) AS max_id '+
                  'FROM wh_vendor WHERE UPPER(name) LIKE '
                  +Chr(39)+LeftStr(UpperCase(Nama.Text),3)+'%'+Chr(39)+';';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrMaxId:=Qry.FieldValues['max_id'];
            StrMaxId:=Format('%.*d',[3,StrToInt(StrMaxId)+1]);
          end else
            StrMaxId:='001';
          StrTransId:=LeftStr(UpperCase(Nama.Text),3)+StrMaxId;
          StrQry:='INSERT INTO wh_vendor (vendor_id,title_id,name,address,phone_no1,phone_no2,fax_no,contact'+
                  ',cellular_no,payment_term_id,gp_reference_id,active,update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+StrTitle+','+QuotedStr(Trim(Nama.Text))+
                  ','+QuotedStr(Trim(Alamat.Text))+','+StrNoTelp1+','+StrNoTelp2+
                  ','+StrNoFax+','+StrContact+','+StrNoHP+','+StrPaymentTerm+','+StrGPRef+','+StrActive+','+QuotedStr(User)+');';
        end else begin
          StrTransId:=VId.Text;
          StrQry:='UPDATE wh_vendor SET title_id='+StrTitle+',name='+QuotedStr(Trim(Nama.Text))+
                  ',address='+QuotedStr(Trim(Alamat.Text))+',phone_no1='+StrNoTelp1+',phone_no2='+StrNoTelp2+
                  ',fax_no='+StrNoFax+',contact='+StrContact+',cellular_no='+StrNoHP+',payment_term_id='+StrPaymentTerm+
                  ',gp_reference_id='+StrGPRef+',active='+StrActive+
                  ',update_user='+QuotedStr(User)+' WHERE vendor_id='+QuotedStr(StrTransId)+';';
        end;
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end;
        end;
      end;
      if (Trim(VId.Text)='') OR (VenId<>'') then begin
        StrQry:='INSERT INTO wh_vendor_detail (vendor_id,company_id,location_id,update_user)'+
                ' VALUES ('+QuotedStr(StrTransId)+','+CompanyId+','+LocationId+','+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data','Vendor',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('VendorList')=True then VendorList.RefreshList;
      end else begin
        Main.TransRollback;
        EnableInput;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'Vendor',MB_OK or MB_ICONERROR);
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    Qry.Destroy;
  end else
    MessageBox(0,'Silahkan Lengkapi Data Vendor','Vendor',MB_OK or MB_ICONERROR);
end;

procedure TVendorForm.SetVendorId(Vendor_Id:String);
begin
  VenId:=Vendor_Id;
  LoadData(VenId);
  GroupInput.Enabled:=False;
end; 

procedure TVendorForm.DisableInput;
begin
  GroupInput.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TVendorForm.EnableInput;
begin
  GroupInput.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TVendorForm.NamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Alamat.SetFocus;
end;

procedure TVendorForm.AlamatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoTelp1.SetFocus;
end;

procedure TVendorForm.NoTelp1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoTelp2.SetFocus;
end;

procedure TVendorForm.NoTelp2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoFax.SetFocus;
end;

procedure TVendorForm.ContactPersonKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoHP.SetFocus;

end;

procedure TVendorForm.NoFaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then ContactPerson.SetFocus;
end;

procedure TVendorForm.NoHPKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then Simpan.SetFocus;
end;

procedure TVendorForm.CariClick(Sender: TObject);
begin
  VendorList:=TVendorList.Create(Self,'Vendor Form',True)
end;

end.
