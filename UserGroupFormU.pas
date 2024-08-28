unit UserGroupFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TUserGroupForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Group: TPanel;
    GroupId: TEdit;
    GroupInput: TPanel;
    GroupName: TEdit;
    GroupDetail: TEdit;
    Active: TCheckBox;
    Simpan: TButton;
    Batal: TButton;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
  public
    Constructor Create(AOwner:TComponent;User_Group_Id:String='');Overload;
    { Public declarations }
  end;

var
  UserGroupForm: TUserGroupForm;
  UserGroupId:String;

implementation

uses MainU, ADODB, UserGroupListU;

{$R *.dfm}

Constructor TUserGroupForm.Create(AOwner:TComponent;User_Group_Id:String='');
begin
  UserGroupId:=User_Group_Id;
  Inherited Create(AOwner);
end;


procedure TUserGroupForm.Init;
begin
  GroupId.Text:='';
  GroupName.Text:='';
  GroupDetail.Text:='';
  Active.Checked:=False;
end;

procedure TUserGroupForm.LoadData;
begin

end;

procedure TUserGroupForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrActive,StrEMsg:String;
    IsOk:Boolean;
begin
  if Trim(GroupName.Text)<>'' then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    IsOk:=True;
    if Main.OpenDb then begin
      Main.TransStart;
      if Active.Checked then StrActive:='1' else StrActive:='0';
      StrQry:='SELECT MAX(user_group_id) AS max_id FROM wh_user_group;';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.FieldValues['max_id']<>NULL then
        StrMaxId:=Qry.FieldValues['max_id']
      else
        StrMaxId:='01';
      StrMaxId:=Format('%.*d',[2,StrToInt(StrMaxId)+1]);
      Qry.Close;
      StrQry:='INSERT INTO wh_user_group (user_group_id,group_name,group_detail,active)'+
              'VALUES ('+Chr(39)+StrMaxId+Chr(39)+','+Chr(39)+GroupName.Text+Chr(39)+
              ','+Chr(39)+GroupDetail.Text+Chr(39)+','+StrActive+');';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do  begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan data','User Group',MB_OK or MB_ICONINFORMATION);
        Init;
      end else begin
        Main.TransRollback;
        StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
        MessageBox(0,PChar(StrEMsg),'User Group',MB_OK or MB_ICONERROR);
      end;
      FreeAndNil(Qry);
    end;
    Main.CloseDb;
  end;
end;


procedure TUserGroupForm.BatalClick(Sender: TObject);
begin
  UserGroupForm.Close;
end;

procedure TUserGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TUserGroupForm.FormShow(Sender: TObject);
begin
  Init;
  if UserGroupId<>'' then LoadData;
end;

end.
