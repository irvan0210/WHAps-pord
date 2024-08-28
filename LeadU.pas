unit LeadU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, WHUnit;

type
  TLead = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupContact: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ContactName: TEdit;
    ContactAddress: TMemo;
    Label12: TLabel;
    Label15: TLabel;
    ContactZip: TEdit;
    Label16: TLabel;
    ContactCellular: TMaskEdit;
    ContactPhone: TMaskEdit;
    ContactTitle: TComboBox;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupLead: TPanel;
    Title: TComboBox;
    Name: TEdit;
    Address: TMemo;
    PhoneNo1: TMaskEdit;
    PhoneNo2: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    FaxNo: TMaskEdit;
    Label6: TLabel;
    Zip: TEdit;
    CellularNo: TMaskEdit;
    Reference: TComboBox;
    PanelCariReferensi: TPanel;
    CariReferensi: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Remark: TMemo;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    LeadId: TEdit;
    Label21: TLabel;
    email: TEdit;
    Label22: TLabel;
    Dept: TEdit;
    Panel1: TPanel;
    ReferenceId: TEdit;
    ReferenceName: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBatal: TPanel;
    Status: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure AddressKeyPress(Sender: TObject; var Key: Char);
    procedure ZipKeyPress(Sender: TObject; var Key: Char);
    procedure PhoneNo1KeyPress(Sender: TObject; var Key: Char);
    procedure PhoneNo2KeyPress(Sender: TObject; var Key: Char);
    procedure FaxNoKeyPress(Sender: TObject; var Key: Char);
    procedure CellularNoKeyPress(Sender: TObject; var Key: Char);
    procedure ReferenceKeyPress(Sender: TObject; var Key: Char);
    procedure RemarkKeyPress(Sender: TObject; var Key: Char);
    procedure ContactTitleKeyPress(Sender: TObject; var Key: Char);
    procedure ContactNameKeyPress(Sender: TObject; var Key: Char);
    procedure ContactAddressKeyPress(Sender: TObject; var Key: Char);
    procedure ContactZipKeyPress(Sender: TObject; var Key: Char);
    procedure ContactCellularKeyPress(Sender: TObject; var Key: Char);
    procedure ContactPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure emailKeyPress(Sender: TObject; var Key: Char);
    procedure DeptKeyPress(Sender: TObject; var Key: Char);
    procedure TitleKeyPress(Sender: TObject; var Key: Char);
    procedure ReferenceChange(Sender: TObject);
  private
    { Private declarations }
    LId:String;
    IsInput:Boolean;
    TitleArr,TitlePersonalArr,ReferenceArr:Array of TArrString4;
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
    procedure EnableInput;
    procedure DisableInput;
    procedure SetReferenceId(Reference_Customer_Id:String);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Lead_Id:String='';Is_Input:Boolean=True);Overload;
  end;

var
  Lead: TLead;

implementation

uses MainU, ADODB, StrUtils, LeadListU;

{$R *.dfm}

constructor TLead.Create(AOwner:TComponent;Lead_Id:String='';Is_Input:Boolean=True);
begin
  LId:=Lead_Id;
  IsInput:=Is_Input;
  inherited Create(AOwner);
end;

procedure TLead.Init;
begin
  LeadId.Text:='';
  Title.Text:='';
  Title.Items.Clear;
  Title.ItemIndex:=-1;
  Name.Text:='';
  Address.Text:='';
  Zip.Text:='';
  PhoneNo1.Text:='';
  PhoneNo2.Text:='';
  FaxNo.Text:='';
  CellularNo.Text:='';
  Reference.Text:='';
  Reference.Items.Clear;
  Reference.ItemIndex:=-1;
  ReferenceId.Text:='';
  Remark.Text:='';
  ContactTitle.Text:='';
  ContactTitle.Items.Clear;
  ContactTitle.ItemIndex:=-1;
  ContactName.Text:='';
  ContactAddress.Text:='';
  ContactZip.Text:='';
  ContactPhone.Text:='';
  ContactCellular.Text:='';
  email.Text:='';
  Dept.Text:='';
  PanelCariReferensi.Enabled:=False;
  Bersihkan.Enabled:=True;
  if IsInput=True then if LId<>'' then GroupBatal.Visible:=True  else GroupBatal.Visible:=False
  else GroupBatal.Visible:=False;
end;

procedure TLead.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    SetLength(TitleArr,0);
    StrQry:='SELECT * FROM wh_title WHERE status=1';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(TitleArr,Qry.RecordCount+1);
    TitleArr[0][0]:=' ';
    TitleArr[0][1]:=' ';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TitleArr[IntCount][0]:=Qry.FieldValues['title_id'];
      TitleArr[IntCount][1]:=Qry.FieldValues['title'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    SetLength(TitlePersonalArr,0);
    StrQry:='SELECT * FROM wh_title WHERE (personal=1) and (status=1)';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(TitlePersonalArr,Qry.RecordCount+1);
    TitlePersonalArr[0][0]:=' ';
    TitlePersonalArr[0][1]:=' ';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TitlePersonalArr[IntCount][0]:=Qry.FieldValues['title_id'];
      TitlePersonalArr[IntCount][1]:=Qry.FieldValues['title'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_reference WHERE company_id=2';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(ReferenceArr,Qry.RecordCount+1);
    ReferenceArr[0][0]:=' ';
    ReferenceArr[0][1]:=' ';
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      ReferenceArr[IntCount][0]:=Qry.FieldValues['reference_id'];
      ReferenceArr[IntCount][1]:=Qry.FieldValues['reference'];
      ReferenceArr[IntCount][2]:=Qry.FieldValues['local'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(TitleArr)-1 do
    Title.Items.Add(TitleArr[IntCount][1]);
  for IntCount:=0 to Length(TitlePersonalArr)-1 do
    ContactTitle.Items.Add(TitlePersonalArr[IntCount][1]);
  for IntCount:=0 to Length(ReferenceArr)-1 do
    Reference.Items.Add(ReferenceArr[IntCount][1]);
  Main.M_Normal;
end;

procedure TLead.LoadData;
var Qry:TADOQuery;
    StrQry,StrReferenceCustomerId:String;
    IntCount:Integer;
begin
  if Trim(LId)<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrQry:='EXEC GetLeadDetail '+LId+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['title']<>NULL then Title.ItemIndex:=Title.Items.IndexOf(Qry.FieldValues['title']);
        Name.Text:=Qry.FieldValues['name'];
        Address.Text:=Qry.FieldValues['address'];
        if Qry.FieldValues['zip']<>NULL then Zip.Text:=Qry.FieldValues['zip'];
        if Pos(',',Qry.FieldValues['phone_no'])>0 then begin
          PhoneNo1.Text:=LeftStr(Qry.FieldValues['phone_no'],Pos(',',Qry.FieldValues['phone_no'])-1);
          PhoneNo2.Text:=RightStr(Qry.FieldValues['phone_no'],Length(Qry.FieldValues['phone_no'])-Pos(',',Qry.FieldValues['phone_no']))
        end else PhoneNo1.Text:=Qry.FieldValues['phone_no'];
        if Qry.FieldValues['cellular_no']<>NULL then CellularNo.Text:=Qry.FieldValues['cellular_no'];
        if Qry.FieldValues['fax_no']<>NULL then FaxNo.Text:=Qry.FieldValues['fax_no'];
        if Qry.FieldValues['contact_person']<>NULL then ContactName.Text:=Qry.FieldValues['contact_person'];
        if Qry.FieldValues['contact_title']<>NULL then ContactTitle.ItemIndex:=ContactTitle.Items.IndexOf(Qry.FieldValues['contact_title']);
        if Qry.FieldValues['contact_address']<>NULL then ContactAddress.Text:=Qry.FieldValues['contact_address'];
        if Qry.FieldValues['contact_zip']<>NULL then ContactZip.Text:=Qry.FieldValues['contact_zip'];
        if Qry.FieldValues['contact_cellular_no']<>NULL then ContactCellular.Text:=Qry.FieldValues['contact_cellular_no'];
        if Qry.FieldValues['contact_phone_no']<>NULL then ContactPhone.Text:=Qry.FieldValues['contact_phone_no'];
        if Qry.FieldValues['email']<>NULL then email.Text:=Qry.FieldValues['email'];
        if Qry.FieldValues['department']<>NULL then Dept.Text:=Qry.FieldValues['department'];
        if Qry.FieldValues['reference']<>NULL then Reference.ItemIndex:=Reference.Items.IndexOf(Qry.FieldValues['reference']);
        if Qry.FieldValues['reference_customer_id']<>NULL then StrReferenceCustomerId:=Qry.FieldValues['reference_customer_id'];
        if Qry.FieldValues['remark']<>NULL then Remark.Text:=Qry.FieldValues['remark'];
        Qry.Next;
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
    if Trim(StrReferenceCustomerId)<>'' then SetReferenceId(StrReferenceCustomerId);
  end;
end;

procedure TLead.EnableInput;
begin
  Simpan.Enabled:=True;
  PanelCariReferensi.Enabled:=True;
  GroupContact.Enabled:=True;
  GroupLead.Enabled:=True;
end;

procedure TLead.DisableInput;
begin
  Simpan.Enabled:=False;
  PanelCariReferensi.Enabled:=False;
  GroupContact.Enabled:=False;
  GroupLead.Enabled:=False;
end;

procedure TLead.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrTitle,StrName,StrAddress,StrZip,StrPhoneNo,StrFaxNo,StrCellularNo,StrReference,StrReferenceId:String;
    StrRemark,StrContactTitle,StrContactName,StrContactAddress,StrContactZip,StrContactCellularNo,StrContactPhoneNo,Stremail,StrDept:String;
    StrTransId,StrEMsg,StrStatus,StrCompanyId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Name.Text)<>'') AND (Trim(Address.Text)<>'') AND ((Trim(PhoneNo1.Text)<>'') OR (Trim(CellularNo.Text)<>'')) then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      if CompanyId='6' then StrCompanyId:='2' else StrCompanyId:=CompanyId;
      if Trim(Title.Text)<>'' then StrTitle:=TitleArr[Title.ItemIndex][0] else StrTitle:='NULL';
      StrContactTitle:=TitlePersonalArr[ContactTitle.ItemIndex][0];
      StrName:=QuotedStr(Trim(Name.Text));
      StrAddress:=QuotedStr(Trim(Address.Text));
      StrPhoneNo:=Trim(PhoneNo1.Text);
      if Trim(Zip.Text)<>'' then StrZip:=QuotedStr(Trim(Zip.Text)) else StrZip:='NULL';
      if Trim(PhoneNo2.Text)<>'' then StrPhoneNo:=QuotedStr(StrPhoneNo+','+Trim(PhoneNo2.Text)) else StrPhoneNo:=QuotedStr(StrPhoneNo);
      if Trim(FaxNo.Text)<>'' then StrFaxNo:=QuotedStr(Trim(FaxNo.Text)) else StrFaxNo:='NULL';
      if Trim(CellularNo.Text)<>'' then StrCellularNo:=QuotedStr(Trim(CellularNo.Text)) else StrCellularNo:='NULL';
      if Reference.Text<>'' then StrReference:=ReferenceArr[Reference.ItemIndex][0] else StrReference:='NULL';
      if ReferenceId.Text<>'' then StrReferenceId:=QuotedStr(ReferenceId.Text) else StrReferenceId:='NULL';
      if Remark.Text<>'' then StrRemark:=QuotedStr(Trim(Remark.Text)) else StrRemark:='NULL';
      if Trim(ContactTitle.Text)<>'' then StrContactTitle:=TitlePersonalArr[ContactTitle.ItemIndex][0] else StrContactTitle:='NULL';
      if Trim(ContactName.Text)<>'' then StrContactName:=QuotedStr(Trim(ContactName.Text)) else StrContactName:='NULL';
      if Trim(ContactAddress.Text)<>'' then StrContactAddress:=QuotedStr(Trim(ContactAddress.Text)) else StrContactAddress:='NULL';
      if Trim(ContactPhone.Text)<>'' then StrContactPhoneNo:=QuotedStr(Trim(ContactPhone.Text)) else StrContactPhoneNo:='NULL';
      if Trim(ContactZip.Text)<>'' then StrContactZip:=QuotedStr(ContactZip.Text) else StrContactZip:='NULL';
      if Trim(ContactCellular.Text)<>'' then StrContactCellularNo:=QuotedStr(StringReplace(ContactCellular.Text,' ','',[rfReplaceAll])) else StrContactCellularNo:='NULL';
      if Trim(email.Text)<>'' then Stremail:=QuotedStr(email.Text) else Stremail:='NULL';
      if Trim(Dept.Text)<>'' then StrDept:=QuotedStr(Dept.Text) else StrDept:='NULL';
      if Status.Visible=True then if Status.Checked=True then StrStatus:='0' else StrStatus:='1'
      else StrStatus:='1';
      if (LeadId.Text<>'')  then begin
        StrTransId:=LId;
        StrQry:='UPDATE wh_lead SET name='+StrName+',title_id='+StrTitle+',address='+StrAddress+',zip='+StrZip+
                ',phone_no='+StrPhoneNo+',fax_no='+StrFaxNo+',cellular_no='+StrCellularNo+
                ',reference_id='+StrReference+',reference_customer_id='+StrReferenceId+',status='+StrStatus+
                ',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE lead_id='+QuotedStr(StrTransId)+';';
        StrQry:=StrQry+' UPDATE wh_lead_detail SET status=0,update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE lead_detail_id='+
                '(SELECT MAX(lead_detail_id) FROM wh_lead_detail WHERE (lead_id='+QuotedStr(StrTransId)+') AND (status=1));';
      end else begin
        StrQry:='SELECT RIGHT(MAX(lead_id),4) AS max_id FROM wh_lead '+
                'WHERE lead_id  LIKE '+QuotedStr('L'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                '____')+';';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.FieldValues['max_id']<>NULL then begin
          StrTransId:=Qry.FieldValues['max_id'];
          StrTransId:=Format('%.*d',[4,StrToInt(StrTransId)+1]);
          Qry.Close;
          Qry.SQL.Clear;
        end else
          StrTransId:='0001';
        StrTransId:='L'+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_lead (lead_id,company_id,name,title_id,address,zip,phone_no,fax_no'+
                ',cellular_no,reference_id,reference_customer_id,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrName+','+StrTitle+','+StrAddress+','+StrZip+','+StrPhoneNo+','+StrFaxNo+
                ','+StrCellularNo+','+StrReference+','+StrReferenceId+','+QuotedStr(User)+');';
      end;
      if StrStatus='1' then begin
        StrQry:=StrQry+'INSERT INTO wh_lead_detail (lead_id,company_id,contact_person,title_id,department,address,zip,phone_no'+
                ',cellular_no,email,sales_id,remark,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+CompanyId+','+StrContactName+','+StrContactTitle+','+StrDept+
                ','+StrContactAddress+','+StrContactZip+','+StrContactPhoneNo+','+StrContactCellularNo+','+Stremail+
                ','+QuotedStr(User)+','+StrRemark+','+QuotedStr(User)+');';
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
      if IsOk then begin
        Main.TransCommit;
        LeadId.Text:=StrTransId;
        MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Prospek',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('LeadList') then LeadList.RefreshDisplay;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Data Prospek',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    FreeAndNil(Qry)
  end else
    MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Data Prospek',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TLead.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  if LId<>'' then begin
    LeadId.Text:=LId;
    LoadData;
    Bersihkan.Enabled:=False;
  end;
  if not(IsInput) then DisableInput;
end;

procedure TLead.SetReferenceId(Reference_Customer_Id:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  if Trim(Reference_Customer_Id)<>'' then begin
    ReferenceId.Text:=Reference_Customer_Id;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      StrQry:='EXEC GetCustomerDetail '+Reference_Customer_Id+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        if Qry.FieldValues['title']<>NULL then ReferenceName.Text:=Qry.FieldValues['title']+' '+Qry.FieldValues['name']
        else ReferenceName.Text:=Qry.FieldValues['name'];
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TLead.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLead.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TLead.SelesaiClick(Sender: TObject);
begin
  Close;
end;


procedure TLead.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Address.SetFocus;
end;

procedure TLead.AddressKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Zip.SetFocus;
end;

procedure TLead.ZipKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then PhoneNo1.SetFocus;
end;

procedure TLead.PhoneNo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then PhoneNo2.SetFocus;
end;

procedure TLead.PhoneNo2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then FaxNo.SetFocus;
end;

procedure TLead.FaxNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CellularNo.SetFocus;
end;

procedure TLead.CellularNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Reference.SetFocus;
end;

procedure TLead.ReferenceKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then if PanelCariReferensi.Enabled then PanelCariReferensi.SetFocus else Remark.SetFocus;
end;

procedure TLead.RemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ContactTitle.SetFocus;
end;

procedure TLead.ContactTitleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ContactName.SetFocus;
end;

procedure TLead.ContactNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ContactAddress.SetFocus;
end;

procedure TLead.ContactAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ContactZip.SetFocus;
end;

procedure TLead.ContactZipKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then ContactCellular.SetFocus;
end;

procedure TLead.ContactCellularKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ContactPhone.SetFocus;
end;

procedure TLead.ContactPhoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then email.SetFocus;
end;

procedure TLead.emailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Dept.SetFocus;
end;

procedure TLead.DeptKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TLead.TitleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Name.SetFocus;
end;

procedure TLead.ReferenceChange(Sender: TObject);
begin
  if Reference.Text<>'' then begin
    if ReferenceArr[Reference.ItemIndex][2]='1' then PanelCariReferensi.Enabled:=True
    else PanelCariReferensi.Enabled:=False;
  end;
end;

end.
