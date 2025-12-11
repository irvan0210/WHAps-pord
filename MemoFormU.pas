unit MemoFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, ComCtrls, Buttons;

type
  TMemoForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    GroupId: TPanel;
    DocId: TEdit;
    GroupInput: TPanel;
    DocTitle: TEdit;
    Label5: TLabel;
    DocNumber: TEdit;
    Active: TCheckBox;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StartDate: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    Description: TMemo;
    OpenDialog1: TOpenDialog;
    Label30: TLabel;
    Label13: TLabel;
    GroupUpload: TGroupBox;
    Label10: TLabel;
    Label14: TLabel;
    EditFileName: TEdit;
    Upload: TButton;
    Preview: TButton;
    EditFileExt: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    EditFileSize: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel1: TPanel;
    Label20: TLabel;
    CustomerName: TEdit;
    Label21: TLabel;
    CariCustomer: TSpeedButton;
    CustomerID: TEdit;
    Label22: TLabel;
    EndDate: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure MenuKeyPress(Sender: TObject; var Key: Char);
    procedure DocTitleKeyPress(Sender: TObject; var Key: Char);
    procedure EditFileNameKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure UploadClick(Sender: TObject);
    procedure PreviewClick(Sender: TObject);
    procedure CariCustomerClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshMenu;
    procedure Input(IsEnable:Boolean);
    procedure UpdateDocument(DocID: Integer);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MemoId:String;IsViewOnly:Boolean=False);Overload;
    procedure LoadData;
  end;

var
  MemoForm: TMemoForm;
  StrMemoId:String;
  //StrLastMenuId,StrLastMenu:String;
  IsView:Boolean;
  MenuArr:Array of TArrString4;
  FileByte: TMemoryStream;
  IsNewFileUploaded: Boolean;
  FileExt, FileNameOnly , TempPreviewFile: string;
implementation

uses MainU, ADODB, SubMenuListU, MemoListU, DB, PreviewDocumentU,
  CustomerListMiniU;

{$R *.dfm}

constructor TMemoForm.Create(AOwner:TComponent;MemoId:String;IsViewOnly:Boolean=False);
begin
  StrMemoId:=MemoId;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TMemoForm.Init;
begin
  GroupId.Enabled:=False;
  Active.Checked:=True;
  DocId.Clear;
  DocTitle.Text:='';
  DocNumber.Text:='';
  StartDate.Date := Now;
  EndDate.Date := Now;
  Description.Text:='';
  EditFileName.Text:='';
  EditFileExt.Text:='';
  EditFileSize.Text:='';
end;

procedure TMemoForm.LoadData;
var Qry, Qry2:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_document WHERE doc_id='+QuotedStr(StrMemoId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      DocId.Text:=Qry.FieldValues['doc_id'];
      DocNumber.Text:=Qry.FieldValues['doc_number'];
      if Qry.FieldValues['doc_title']<> NULL then
        DocTitle.Text:=Qry.FieldValues['doc_title'];
      if Qry.FieldValues['description']<> NULL then
        description.Text:=Qry.FieldValues['description'];
      StartDate.Date:=StrToDate(Qry.FieldValues['effective_date']);
      EndDate.Date:=StrToDate(Qry.FieldValues['expired_date']);
      FileNameOnly :=Qry.FieldValues['file_name'];
      FileExt := Qry.FieldValues['file_ext'];
      EditFileName.Text := Qry.FieldValues['file_name'];
      EditFileSize.Text := Qry.FieldValues['file_sizekb'];
      EditFileExt.Text := Qry.FieldValues['file_ext'];
      IsNewFileUploaded := False;
      if Qry.FieldValues['status']=1 then Active.Checked:=True else Active.Checked:=False;
      if Qry.FieldValues['customer_id']<> '' then begin
        //StrCustID:= Qry.FieldValues['customer_id'];
        StrQry:='SELECT customer_id, name FROM wh_customer WHERE customer_id ='+QuotedStr(Qry.FieldValues['customer_id'])+';';
        Qry2.SQL.Clear;
        Qry2.SQL.Add(StrQry);
        Qry2.Open;
        if Qry2.RecordCount>0 then begin
         CustomerID.Text := Qry2.FieldValues['customer_id'];
         CustomerName.Text := Qry2.FieldValues['name'];
        end;
        Qry2.Close;
      end;

    end;
    Qry.Close;
    Main.CloseDb;
   // RefreshMenu;
  end;
  Qry.Destroy;
end;

procedure TMemoForm.RefreshMenu;
{var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer; }
begin
  {Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(MenuArr,0);
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(MenuArr,Qry.RecordCount);
      IntCount:=0;
      while Not(Qry.Eof) do begin
        MenuArr[IntCount][0]:=Qry.FieldValues['menu_id'];
        MenuArr[IntCount][1]:=Qry.FieldValues['menu'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  if StrSubMenuId<>'' then begin
    SetLength(MenuArr,Length(MenuArr)+1);
    MenuArr[Length(MenuArr)-1][0]:=StrLastMenuId;
    MenuArr[Length(MenuArr)-1][1]:=StrLastMenu;
  end;
  for IntCount:=0 to Length(MenuArr)-1 do
  //  Menu.Items.Add(MenuArr[IntCount][1]);  }
end;

procedure TMemoForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  GroupUpload.Enabled := IsEnable;
  Active.Enabled := IsEnable;
  Simpan.Visible:=IsEnable;
end;


procedure TMemoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TMemoForm.BatalClick(Sender: TObject);
begin
  MemoForm.Close;
end;

procedure TMemoForm.FormShow(Sender: TObject);
begin
  Init;
  FileByte := nil;
  IsNewFileUploaded := False;
 // RefreshMenu;
  if StrMemoId<>'' then LoadData;
  if IsView then Input(False)
  else Input(True);
end;

procedure TMemoForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrQry2,StrMsg,StrException:String; //,StrMaxId
    IntCount, IntActive:Integer;  // ,
    IsOk:Boolean;
begin
  if (Trim(DocNumber.Text)<>'') AND (DocTitle.Text <>'')
    AND (EditFileName.Text <>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
   // Qry2:=TADOQuery.Create(Self);
   // Qry2.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    if Main.OpenDb then begin
     { if StrMemoId = '' then begin
        StrQry2:='SELECT dbo.GetNewDocumentId('+CompanyId+') AS hasil;';
        Qry2.SQL.Clear;
        Qry2.SQL.Add(StrQry2);
        Qry2.Open;
        if Qry2.RecordCount>0 then StrMemoId :=Qry2.FieldValues['hasil'];
      end; }


      if DocId.Text<>'' then begin
        if IsNewFileUploaded = True then begin
          StrQry := 'UPDATE wh_document SET doc_number = '+QuotedStr(DocNumber.Text)+', '+
              'doc_title = ' +QuotedStr(DocTitle.Text)+', '+
              'effective_date = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate.Date)) + ', ' +
              'expired_date = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', EndDate.Date)) + ', ' +
              'description = ' +QuotedStr(Description.Lines.Text)+', ' +
              'file_ext = ' +QuotedStr(EditFileExt.Text) + ', ' +
              'file_sizekb = '+IntToStr(FileByte.Size div 1024)+', '+
              'file_name = '+QuotedStr(EditFileName.Text)+', '+
              'file_data = :file_data, ' +
              'update_date = GETDATE(), '+
              'update_by = '+QuotedStr(User)+','+
              'status ='+IntToStr(IntActive)+','+
              'customer_id ='+QuotedStr(CustomerID.Text)+', '+
              'company_id ='+QuotedStr(CompanyId)+' '+
              'WHERE doc_id = '+QuotedStr(DocId.text)+';';
        end else begin
           StrQry := 'UPDATE wh_document SET doc_number = '+QuotedStr(DocNumber.Text)+', '+
              'doc_title = ' +QuotedStr(DocTitle.Text)+', '+
              'effective_date = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate.Date)) + ', ' +
              'expired_date = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', EndDate.Date)) + ', ' +
              'description = ' +QuotedStr(Description.Lines.Text)+', ' +
             // 'file_ext = ' +QuotedStr(EditFileExt.Text) + ', ' +
             // 'file_sizekb = '+QuotedStr(EditFileSize.Text)+', '+
             // 'file_sizekb = '+IntToStr(FileByte.Size div 1024)+', '+
             // 'file_name = '+QuotedStr(EditFileName.Text)+', '+
             // 'file_data = :file_data, ' +
              'update_date = GETDATE(), '+
              'update_by = '+QuotedStr(User)+','+
              'status ='+IntToStr(IntActive)+','+
              'customer_id ='+QuotedStr(CustomerID.Text)+', '+
              'company_id ='+QuotedStr(CompanyId)+' '+
              'WHERE doc_id = '+QuotedStr(DocId.text)+';';
        end;

      end else begin
        StrQry := 'INSERT INTO wh_document '+
          '(doc_id,doc_number, doc_title, doc_type, effective_date,expired_date, description,file_ext,file_sizekb,'+
          ' file_name, file_data, create_date, create_by,update_date,update_by, status, customer_id, company_id) '+
          'VALUES ((SELECT dbo.GetNewDocumentId('+CompanyId+') AS hasil), '+ //+QuotedStr(StrMemoId)+', '+
          QuotedStr(DocNumber.Text)+', '+
          QuotedStr(DocTitle.Text)+', '+
          QuotedStr('MEMO')+', '+
          QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate.Date))+ ', ' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', EndDate.Date))+ ', ' +
          QuotedStr(Description.Lines.Text)+ ', '+
          QuotedStr(EditFileExt.Text) + ', '+  //FileExt
          IntToStr(FileByte.Size div 1024)+ ', ' +
          QuotedStr(EditFileName.Text) + ', ' +   //FileNameOnly
          ':file_data, ' +                 // ? parameter untuk BLOB
          'GETDATE(), ' +QuotedStr(User)+
          ',GETDATE(),'+QuotedStr(User)+','+IntToStr(IntActive)+
          ', '+QuotedStr(CustomerID.Text)+', '+CompanyId+')';
      end;
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      if IsNewFileUploaded = True then begin
        Qry.Parameters.ParamByName('file_data').LoadFromStream(FileByte, ftBlob);
      end;

      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Memo';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(0,'Berhasil Menyimpan Memo','Memo',MB_OK or MB_ICONINFORMATION);
      Init;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Memo',MB_OK or MB_ICONERROR);
    end;
  end else begin
    MessageBox(0,PChar('Tanda Bintang Tidak Boleh Kosong'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Memo',MB_OK or MB_ICONWARNING);
  end;
  if Main.IsFormOpen('MemoList') then begin
    MemoList.Init;
    MemoList.LoadData;
    MemoList.RefreshList;
  end;
  if IsOk then MemoForm.Close;
end;

procedure TMemoForm.MenuKeyPress(Sender: TObject; var Key: Char);
begin
  //if Key=#13 then SubMenuName.SetFocus;
end;

procedure TMemoForm.DocTitleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TMemoForm.EditFileNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TMemoForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TMemoForm.UploadClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
  FileStream: TFileStream;
  FileNameOnly, FileExt: string;
begin
  OpenDlg := TOpenDialog.Create(nil);
  try
    OpenDlg.Filter := 'All Files (*.*)|*.*';
    if OpenDlg.Execute then
    begin
      EditFileName.Text := ExtractFileName(OpenDlg.FileName);         // File Name
      FileExt := ExtractFileExt(OpenDlg.FileName);
      EditFileExt.Text := LowerCase(FileExt);                         // .pdf .doc .xlsx

      FileStream := TFileStream.Create(OpenDlg.FileName, fmOpenRead);

      EditFileSize.Text := IntToStr(FileStream.Size div 1024);        // KB

      // Simpan ke stream global utk insert DB nanti
      FileByte := TMemoryStream.Create;
      FileByte.CopyFrom(FileStream, FileStream.Size);
      FileByte.Position := 0;

      FileStream.Free;
      MessageBox(0,'File berhasil di-upload!','Memo',MB_OK or MB_ICONINFORMATION);
     // ShowMessage('File berhasil di-upload!');
     IsNewFileUploaded := True;
    end;
  finally
    OpenDlg.Free;
  end;
end;

{begin
  OpenDialog1.Filter := 'PDF Document|*.pdf';

  if OpenDialog1.Execute then
  begin
    // Load file ke MemoryStream
    if Assigned(FileByte) then FileByte.Free;
    FileByte := TMemoryStream.Create;
    FileByte.LoadFromFile(OpenDialog1.FileName);

    // Ambil nama file dan ekstensi
    FileNameOnly := ExtractFileName(OpenDialog1.FileName);
    FileExt := ExtractFileExt(OpenDialog1.FileName);

    FileNameExt.Text := FileNameOnly; // Tampilkan di Edit component

    ShowMessage('File berhasil dipilih: ' + FileNameOnly);
  end;
end; }
procedure TMemoForm.PreviewClick(Sender: TObject);
var
  TempFile: string;
begin
  if DocId.Text <> '' then begin
    PreviewDocument:=TPreviewDocument.Create(Self);
    PreviewDocument.LoadData(DocId.Text);
  end else begin
       // Jika file belum di-upload
    if FileByte = nil then
    begin
      ShowMessage('Tidak ada file untuk di-preview.');
      Exit;
    end;

    TempFile := GetEnvironmentVariable('TEMP') + '\preview.pdf';
    FileByte.SaveToFile(TempFile);

    PreviewDocument := TPreviewDocument.Create(Self);
    PreviewDocument.PreviewLocalPDF(TempFile);
  end;
end;

procedure TMemoForm.UpdateDocument(DocID: Integer);
var
  StrQry: string;
begin
 { if IsNewFileUploaded then
  begin
    // Jika user upload file baru, update semuanya
    StrQry :=
      'UPDATE wh_document SET ' +
      'doc_number = ' + QuotedStr(DocNumber.Text) + ', ' +
      'doc_title = ' + QuotedStr(DocTitle.Text) + ', ' +
      'effective_date = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate.Date)) + ', ' +
      'description = ' + QuotedStr(Description.Lines.Text) + ', ' +
      'file_ext = ' + QuotedStr(FileExt) + ', ' +
      'file_sizekb = ' + IntToStr(FileByte.Size div 1024) + ', ' +
      'file_name = ' + QuotedStr(FileNameOnly) + ', ' +
      'file_data = :file_data, ' +
      'update_date = GETDATE(), ' +
      'update_by = ' + QuotedStr(User) + ' ' +
      'WHERE doc_id = ' + IntToStr(DocID);

    Qry.SQL.Text := StrQry;
    Qry.Parameters.ParamByName('file_data').LoadFromStream(FileByte, ftBlob);
  end
  else
  begin
    // Jika file tidak diganti ? SET tanpa file_data
    StrQry :=
      'UPDATE wh_document SET ' +
      'doc_number = ' + QuotedStr(DocNumber.Text) + ', ' +
      'doc_title = ' + QuotedStr(DocTitle.Text) + ', ' +
      'effective_date = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate.Date)) + ', ' +
      'description = ' + QuotedStr(Description.Lines.Text) + ', ' +
      'update_date = GETDATE(), ' +
      'update_by = ' + QuotedStr(User) + ' ' +
      'WHERE doc_id = ' + IntToStr(DocID);

    Qry.SQL.Text := StrQry;
  end;

  Qry.ExecSQL;
  ShowMessage('Dokumen berhasil di-update!');   }
end;




procedure TMemoForm.CariCustomerClick(Sender: TObject);
begin
  CustomerListMini:=TCustomerListMini.Create(Self,'BUS','Memo-Create');
end;

end.
