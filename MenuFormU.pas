unit MenuFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls;

type
  TMenuForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    GroupId: TPanel;
    MenuId: TEdit;
    GroupInput: TPanel;
    MenuName: TEdit;
    Description: TEdit;
    Active: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure MenuNameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;MenuId:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  MenuForm: TMenuForm;
  StrMenuId:String;
  IsView:Boolean;
  
implementation

uses MainU;

{$R *.dfm}

constructor TMenuForm.Create(AOwner:TComponent;MenuId:String;IsViewOnly:Boolean=False);
begin
  StrMenuId:=MenuId;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TMenuForm.Init;
begin
  GroupId.Enabled:=False;
  MenuId.Text:='';
  MenuName.Text:='';
  Description.Text:='';
  Active.Checked:=False;
end;

procedure TMenuForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_menu WHERE menu_id='+StrMenuId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      MenuId.Text:=Qry.FieldValues['menu_id'];
      MenuName.Text:=Qry.FieldValues['menu'];
      Description.Text:=Qry.FieldValues['menu_description'];
      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TMenuForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable; 
end;

procedure TMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMenuForm.SelesaiClick(Sender: TObject);
begin
  MenuForm.Close;
end;

procedure TMenuForm.FormShow(Sender: TObject);
begin
  Init;
  if StrMenuId<>'' then begin
    LoadData;
  end;
  if IsView then Input(False)
  else Input(True);

end;

procedure TMenuForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException:String;
    IntActive:Integer;
    IsOk:Boolean;
begin
  if Trim(MenuName.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    if Main.OpenDb then begin
      if StrMenuId<>'' then begin
        StrQry:='DELETE wh_menu WHERE menu_id='+Chr(39)+StrMenuId+Chr(39)+';';
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menambah Menu';
            StrException:=E.Message;
          end;
        end;
      end;
      StrQry:='EXEC AddMenu '+Chr(39)+MenuName.Text+Chr(39)+','+Chr(39)+Description.Text+Chr(39)+','+IntToStr(IntActive)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsOk:=False;
          StrMsg:='Gagal Menambah Menu';
          StrException:=E.Message;
        end;
      end;
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan menu','Menu',MB_OK or MB_ICONINFORMATION);
      Init;
    end else begin
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Menu',MB_OK or MB_ICONERROR);
    end;
  end;
  if IsOk then MenuForm.Close;
end;

procedure TMenuForm.MenuNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TMenuForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TMenuForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Simpan.Click;
end;

end.
