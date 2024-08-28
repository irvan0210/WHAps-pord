unit LocationChangeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, WHUnit;

type
  TLocationChange = class(TForm)
    Pindah: TButton;
    Selesai: TButton;
    NewLocation: TComboBox;
    Label1: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PindahClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
  end;

var
  LocationChange: TLocationChange;
  LocationArr:Array of TArrString7;

implementation

uses MainU;

{$R *.dfm}

procedure TLocationChange.Init;
begin
  NewLocation.Text:='';
  NewLocation.Items.Clear;
  NewLocation.ItemIndex:=-1;
end;

procedure TLocationChange.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
//    StrQry:='SELECT *,c.code AS location_code,d.name AS company_name,d.code AS company_code,c.location AS location_name '+
//            ' FROM wh_user_company_location a '+
//            ' INNER JOIN wh_company_location b on b.company_location_id=a.company_location_id '+
//            ' INNER JOIN wh_location c ON c.location_id=b.location_id '+
//            ' INNER JOIN wh_company d on d.company_id=b.company_id '+
//            ' WHERE a.user_id='+QuotedStr(User)+' AND a.active=1';
    StrQry:='EXEC GetUserCompanyLocationList '+QuotedStr(User)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(LocationArr,Qry.RecordCount);
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      LocationArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      LocationArr[IntCount][1]:=Qry.FieldValues['company_name'];
      LocationArr[IntCount][2]:=Qry.FieldValues['location'];
      LocationArr[IntCount][3]:=Qry.FieldValues['location_id'];
      LocationArr[IntCount][4]:=Qry.FieldValues['location_code'];
      LocationArr[IntCount][5]:=Qry.FieldValues['company_id'];
      LocationArr[IntCount][6]:=Qry.FieldValues['company_code'];
      LocationArr[IntCount][7]:=Qry.FieldValues['location_name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  for IntCount:=0 to Length(LocationArr)-1 do
    NewLocation.Items.Add(LocationArr[IntCount][1]+' '+LocationArr[IntCount][2]);
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TLocationChange.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TLocationChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLocationChange.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TLocationChange.PindahClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyLocation,StrEMessage:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  Main.M_Busy;
  if NewLocation.Text<>'' then begin
    Main.deInitMenu;
    //Main.InitMenu;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    StrCompanyLocation:=LocationArr[NewLocation.ItemIndex][0];
    if Main.OpenDb then begin
      Main.TransStart;
      StrQry:='UPDATE wh_user SET company_location_id='+StrCompanyLocation+' WHERE username='+QuotedStr(User)+';';
      Main.WriteLog('SQL :'+StrQry,2);
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
      if IsOk then begin
        Main.TransCommit;
        Main.WriteLog('Location change to'+CompanyId+'-'+LocationId);
        LocationId:=LocationArr[NewLocation.ItemIndex][3];
        LocationCode:=LocationArr[NewLocation.ItemIndex][4];
        CompanyId:=LocationArr[NewLocation.ItemIndex][5];
        CompanyCode:=LocationArr[NewLocation.ItemIndex][6];
        Main.StatusLocation(LocationArr[NewLocation.ItemIndex][1]+'-'+LocationArr[NewLocation.ItemIndex][7]);
        Main.InitMenu;
        MessageBox(0,PChar('Berhasil merubah lokasi'),'Pindah Lokasi',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Gagal merubah lokasi'+Chr(13)+Chr(13)+StrEMessage),'Pindah Lokasi',MB_OK or MB_ICONERROR);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
  end;
  if IsOk then Close;
end;

end.
