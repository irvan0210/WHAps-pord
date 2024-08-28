unit BengkelEksternalFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, WHUnit,ADODB;

type
  TBengkelEksternalForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupInput: TPanel;
    Nama: TEdit;
    Alamat: TEdit;
    NoTelp1: TMaskEdit;
    NoTelp2: TMaskEdit;
    NoFax: TMaskEdit;
    NamaPIC: TEdit;
    NoHP: TEdit;
    BU: TComboBox;
    BUDisp: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BUChange(Sender: TObject);
    procedure BUKeyPress(Sender: TObject; var Key: Char);
    procedure NamaKeyPress(Sender: TObject; var Key: Char);
    procedure AlamatKeyPress(Sender: TObject; var Key: Char);
    procedure NoTelp1KeyPress(Sender: TObject; var Key: Char);
    procedure NoTelp2KeyPress(Sender: TObject; var Key: Char);
    procedure NoFaxKeyPress(Sender: TObject; var Key: Char);
    procedure NamaPICKeyPress(Sender: TObject; var Key: Char);
    procedure NoHPKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure LoadData;
  public
    { Public declarations }
    //Constructor Create(AOwner:TComponent;Bengkel_Id:String);Overload;
    //18 juni 2013
    constructor Create(AOwner:TComponent;Bengkel_Id,StatusEvent:String;IsViewOnly:Boolean=False);

  end;

var
  BengkelEksternalForm: TBengkelEksternalForm;
  BengkelId,Event:String;
  BUArr:Array of TArrString2;
  IsView:Boolean;

implementation

uses MainU, StrUtils, DB, BengkelEksternalListU;

{$R *.dfm}

//18 Juni 2013
{
Constructor TBengkelEksternalForm.Create(AOwner:TComponent;Bengkel_Id:String);
begin
  BengkelId:=Bengkel_Id;
  Inherited Create(AOwner);
end;
}


//18 Juni 2013
constructor TBengkelEksternalForm.Create(AOwner:TComponent;Bengkel_Id,StatusEvent:String;IsViewOnly:Boolean=False);
begin

  BengkelId:=Bengkel_Id;
  IsView:=IsViewOnly;
  Event:=StatusEvent;
  Inherited Create(AOwner);
end;


procedure TBengkelEksternalForm.Init;
begin
  BU.Items.Clear;
  BU.ItemIndex:=0;
  BUDisp.Text:='';
  Nama.Text:='';
  Alamat.Text:='';
  NoTelp1.Text:='';
  NoTelp2.Text:='';
  NoFax.Text:='';
  NamaPIC.Text:='';
  NoHP.Text:='';
end;

procedure TBengkelEksternalForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;

begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='';


    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TBengkelEksternalForm.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_company WHERE active=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(BUArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      BUArr[IntCount][0]:=Qry.FieldValues['company_id'];
      BUArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for IntCount:=0 to Length(BUArr)-1 do
    BU.Items.Add(BUArr[IntCount][0]);  
end;

procedure TBengkelEksternalForm.SelesaiClick(Sender: TObject);
begin
  BengkelEksternalForm.Close;
end;

procedure TBengkelEksternalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBengkelEksternalForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrMaxId:String;
    StrNamaPIC,StrNoTelp1,StrNoTelp2,StrNoHP,StrNoFax:String;
    IsOk:Boolean;
begin
  if ( (Trim(BU.Text)<>'') AND (Trim(Nama.Text)<>'') AND (Trim(Alamat.Text)<>'') ) then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT RIGHT(MAX(service_location_id),2) AS max_id '+
              'FROM wh_service_location WHERE UPPER(name) LIKE '
              +Chr(39)+LeftStr(UpperCase(Nama.Text),3)+'%'+Chr(39)+';';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then begin
        StrMaxId:=Qry.FieldValues['max_id'];
        StrMaxId:=Format('%.*d',[2,StrToInt(StrMaxId)+1]);
      end else
        StrMaxId:='01';

      if NoTelp1.Text<>'' then StrNoTelp1:=Chr(39)+Trim(NoTelp1.Text)+Chr(39) else StrNoTelp1:='NULL';
      if NoTelp2.Text<>'' then StrNoTelp2:=Chr(39)+Trim(NoTelp2.Text)+Chr(39) else StrNoTelp2:='NULL';
      if NoFax.Text<>'' then StrNoFax:=Chr(39)+Trim(NoFax.Text)+Chr(39) else StrNoFax:='NULL';
      if NamaPIC.Text<>'' then StrNamaPIC:=Chr(39)+Trim(NamaPIC.Text)+Chr(39) else StrNamaPIC:='NULL';
      if NoHP.Text<>'' then StrNoHP:=Chr(39)+Trim(NoHP.Text)+Chr(39) else StrNoHP:='NULL';


      //18 juni 2013
      if Event='T' then begin
        StrQry:='INSERT INTO wh_service_location (service_location_id,company_id,name'+
                ',address,phone_no1,phone_no2,fax_no,contact,cellular_no,update_time,update_user)'+
                ' VALUES ('+Chr(39)+LeftStr(UpperCase(Nama.Text),3)+StrMaxId+Chr(39)+
                ','+BU.Text+','+Chr(39)+Nama.Text+Chr(39)+','+Chr(39)+Alamat.Text+Chr(39)+
                ','+StrNoTelp1+','+StrNoTelp2+','+StrNoFax+','+StrNamaPIC+','+StrNoHP+
                ',GETDATE(),'+Chr(39)+User+Chr(39)+' );';
      end else
      if Event='U' then
      begin
        if NoTelp1.Text<>'' then
        StrNoTelp1:=QuotedStr(Trim(NoTelp1.Text))
        else StrNoTelp1:='NULL';

        if NoTelp2.Text<>'' then
        StrNoTelp2:=QuotedStr(Trim(NoTelp2.Text))
        else StrNoTelp2:='NULL';

        if NoFax.Text<>'' then
        StrNoFax:=QuotedStr(Trim(NoFax.Text))
        else StrNoFax:='NULL';

        if NamaPIC.Text<>'' then
        StrNamaPIC:=QuotedStr(Trim(NamaPIC.Text))
        else StrNamaPIC:='NULL';

        if NoHP.Text<>'' then
        StrNoHP:=QuotedStr(Trim(NoHP.Text))
        else StrNoHP:='NULL';

        StrQry:=' UPDATE wh_service_location '+
                ' SET company_id ='+QuotedStr(BU.Text)+', '+
                ' name ='+QuotedStr(Nama.Text)+', '+
                ' address ='+QuotedStr(Alamat.Text)+', '+
                ' phone_no1 ='+StrNoTelp1+', '+
                ' phone_no2 ='+StrNoTelp2+', '+
                ' fax_no ='+StrNoFax+', '+
                ' contact ='+StrNamaPIC+', '+
                ' cellular_no ='+StrNoHP+', '+
                ' update_time =GETDATE(), update_user= '+QuotedStr(User)+' '+
                ' WHERE service_location_id ='+QuotedStr(BengkelId);   


      end;

      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
           IsOk:=False;
           StrMsg:='Tidak dapat Menyimpan data';
           StrEMsg:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
        MessageBox(0,'Berhasil menyimpan data','Bengkel Eksternal',MB_OK or MB_ICONINFORMATION);
        //18 JUNI 2013
        if Event='U' then begin
          StrQry:=' SELECT service_location_id,name,address,phone_no1,contact,cellular_no FROM wh_service_location ';
          ViewData2(StrQry,BengkelEksternalList.StrGrid);
        end;

      Init;
      RefreshCombo;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg),'Bengkel Eksternal',MB_OK or MB_ICONERROR);
    end;
  end else
    MessageBox(0,'Silahkan periksa kembali Data','Bengkel Eksternal',MB_OK or MB_ICONERROR);

end;

procedure TBengkelEksternalForm.FormShow(Sender: TObject);
begin

  //18 juni 2013
  if Event='T' then begin
    Init;
    RefreshCombo;
    if BengkelId<>'' then begin
      if (RightStr(IntToStr(TreeTag),2)='04') then GroupInput.Enabled:=False
      else GroupInput.Enabled:=True;
      LoadData;
    end;
  end;

end;

procedure TBengkelEksternalForm.BUChange(Sender: TObject);
begin
  if Event='T' then
  begin
  BUDisp.Text:=BUArr[BU.ItemIndex][1];
  end;
end;

procedure TBengkelEksternalForm.BUKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Nama.SetFocus;
end;

procedure TBengkelEksternalForm.NamaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Alamat.SetFocus;
end;

procedure TBengkelEksternalForm.AlamatKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoTelp1.SetFocus;
end;

procedure TBengkelEksternalForm.NoTelp1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoTelp2.SetFocus;
end;

procedure TBengkelEksternalForm.NoTelp2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoFax.SetFocus;
end;

procedure TBengkelEksternalForm.NoFaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NamaPIC.SetFocus;
end;

procedure TBengkelEksternalForm.NamaPICKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then NoHP.SetFocus;
end;

procedure TBengkelEksternalForm.NoHPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TBengkelEksternalForm.FormActivate(Sender: TObject);
var
  QStr,StrMsg,StrEMessage,NoTelpKe1,NoTelpKe2,NoFaxKe1:string;
  VQuery,VQry:TADOQuery;
  IsOk:Boolean;

begin
//18 juni 2013

  if Event='U' then
  begin

    QStr:=' SELECT service_location_id,company_id,name,address,phone_no1,phone_no2,fax_no,contact,cellular_no, '+
          ' active,update_time,update_user FROM wh_service_location '+
          ' WHERE service_location_id='+QuotedStr(BengkelId);
    VQuery:=TADOQuery.Create(nil);
    VQuery.Connection:=Main.MyConnection;
    VQuery.Close;
    VQuery.SQL.Clear;
    VQuery.SQL.Add(QStr);
    try
    VQuery.Open;
    except
    on E:Exception do begin
       StrMsg:='Table Tidak Dapat Dibuka';
       StrEMessage:=E.Message;
       IsOk:=False;
       end
    end;


    QStr:=' SELECT company_id,name,npwp,tdp,active FROM wh_company '+
          ' WHERE company_id='+QuotedStr(VQuery.FieldValues['company_id']);
    VQry:=TADOQuery.Create(nil);
    VQry.Connection:=Main.MyConnection;
    VQry.Close;
    VQry.SQL.Clear;
    VQry.SQL.Add(QStr);
    try
    VQry.Open;
    except
    on E:Exception do begin
       StrMsg:='Table Tidak Dapat Dibuka';
       StrEMessage:=E.Message;
       IsOk:=False;
       end
    end;

    BU.Items.Add(VQuery.FieldValues['company_id']);
    BU.ItemIndex:=0;
    BUDisp.Text:=VQry.FieldValues['name'];
    Nama.Text:=VQuery.FieldValues['name'];
    Alamat.Text:=VQuery.FieldValues['address']; 
    NoTelp1.Text:=VQuery.Fieldbyname('phone_no1').AsString;
    NoTelp2.Text:=VQuery.Fieldbyname('phone_no2').AsString;
    NoFax.Text:=VQuery.Fieldbyname('fax_no').AsString;
    NamaPIC.Text:=VQuery.Fieldbyname('contact').AsString;
    NoHP.Text:=VQuery.Fieldbyname('cellular_no').AsString;

    FreeAndNil(VQuery);
    FreeAndNil(VQry);


  end;

end;

end.
