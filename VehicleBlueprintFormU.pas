unit VehicleBlueprintFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls;

type
  TVehicleBlueprintForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Label3: TLabel;
    LabelStatus: TLabel;
    LabelID: TLabel;
    GroupId: TPanel;
    BlueprintId: TEdit;
    GroupInput: TPanel;
    Name: TEdit;
    Description: TEdit;
    Active: TCheckBox;
    Bersihkan: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure DescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    StrBlueprintId:String;
    IsView:Boolean;
    procedure Init;
    procedure LoadData;
    procedure Input(IsEnable:Boolean);
    procedure EnableInput;
    procedure DisableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Blueprint_Id:String;IsViewOnly:Boolean=False);Overload;
  end;

var
  VehicleBlueprintForm: TVehicleBlueprintForm;

implementation

uses MainU;

{$R *.dfm}

constructor TVehicleBlueprintForm.Create(AOwner:TComponent;Blueprint_Id:String;IsViewOnly:Boolean=False);
begin
  StrBlueprintId:=Blueprint_Id;
  IsView:=IsViewOnly;
  Inherited Create(AOwner);
end;

procedure TVehicleBlueprintForm.Init;
begin
  GroupId.Enabled:=False;
  BlueprintId.Text:='';
  Name.Text:='';
  Description.Text:='';
  Active.Checked:=False;
  if StrBlueprintId<>'' then begin
    BlueprintId.Visible:=True;
    LabelID.Visible:=True;
    Active.Visible:=True;
    LabelStatus.Visible:=True;
  end else begin
    BlueprintId.Visible:=False;
    LabelID.Visible:=False;
    Active.Visible:=False;
    LabelStatus.Visible:=False;
  end;
end;

procedure TVehicleBlueprintForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_vhc_type_detail_image_type WHERE vhc_type_detail_image_type_id='+StrBlueprintId+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      BlueprintId.Text:=Qry.FieldValues['vhc_type_detail_image_type_id'];
      Name.Text:=Qry.FieldValues['name'];
      Description.Text:=Qry.FieldValues['description'];
      if Qry.FieldValues['active'] then Active.Checked:=True else Active.Checked:=False;;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TVehicleBlueprintForm.Input(IsEnable:Boolean);
begin
  GroupInput.Enabled:=IsEnable;
  Simpan.Visible:=IsEnable; 
end;

procedure TVehicleBlueprintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleBlueprintForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleBlueprintForm.FormShow(Sender: TObject);
begin
  Init;
  if StrBlueprintId<>'' then begin
    LoadData;
  end;
  if IsView then DisableInput
  else EnableInput;

end;

procedure TVehicleBlueprintForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrEMsg,StrDescription:String;
    IntActive:Integer;
    IsOk:Boolean;
begin
  if Trim(Name.Text)<>'' then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Active.Checked then IntActive:=1 else IntActive:=0;
    if Main.OpenDb then begin
      DisableInput;
      if Description.Text<>'' then StrDescription:=QuotedStr(Description.Text) else StrDescription:='NULL';
      if StrBlueprintId<>'' then
        StrQry:='UPDATE wh_vhc_type_detail_image_type SET name='+QuotedStr(Name.Text)+',remark='+StrDescription+
                ',status='+IntToStr(IntActive)+',update_time=GETDATE(),update_user='+QuotedStr(user)+
                ' WHERE vhc_type_detail_image_type_id='+QuotedStr(BlueprintId.Text)+';'
      else
        StrQry:='INSERT INTO wh_vhc_type_detail_image_type (name,remark,update_time,update_user) '+
                'VALUES ('+QuotedStr(Name.Text)+','+StrDescription+',GETDATE(),'+QuotedStr(user)+');';
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
      Qry.Close;
      Main.CloseDb;
    end;
    if IsOk then begin
      MessageBox(0,'Berhasil menyimpan Blueprint Armada','Blueprint Armada',MB_OK or MB_ICONINFORMATION);
    end else begin
      EnableInput;
      MessageBox(0,PChar('Gagal Menambah Blueprint Armada'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg),'Blueprint Armada',MB_OK or MB_ICONERROR);
    end;
  end;
  if (IsOk) and (StrBlueprintId<>'') then Close;
end;

procedure TVehicleBlueprintForm.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

procedure TVehicleBlueprintForm.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TVehicleBlueprintForm.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Description.SetFocus;
end;

procedure TVehicleBlueprintForm.DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Active.SetFocus;
end;

procedure TVehicleBlueprintForm.ActiveKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Simpan.Click;
end;

procedure TVehicleBlueprintForm.BersihkanClick(Sender: TObject);
begin
  Init;
  EnableInput;
end;

end.
