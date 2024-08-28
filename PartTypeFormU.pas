unit PartTypeFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB;

type
  TPartTypeForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    TypeId: TEdit;
    TypeName: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    GPReferenceId: TEdit;
    Bersihkan: TButton;
    Label3: TLabel;
    VehicleModule: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SimpanClick(Sender: TObject);
    procedure TypeIdKeyPress(Sender: TObject; var Key: Char);
    procedure TypeNameKeyPress(Sender: TObject; var Key: Char);
    procedure GPReferenceIdKeyPress(Sender: TObject; var Key: Char);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
  public
    Constructor Create(AOwner:TComponent;Part_Type_Id:String='';IsRead_Only:Boolean=True);Overload;
    { Public declarations }
  end;

var
  PartTypeForm: TPartTypeForm;
  PartTypeId:String;
  IsReadOnly:Boolean;

implementation

uses MainU, PartTypeListU;

{$R *.dfm}

Constructor TPartTypeForm.Create(AOwner:TComponent;Part_Type_Id:String='';IsRead_Only:Boolean=True);
begin
  IsReadOnly:=IsRead_Only;
  PartTypeId:=Part_Type_Id;
  Inherited Create(AOwner);
end;

procedure TPartTypeForm.Init;
begin
  TypeId.Text:='';
  TypeName.Text:='';
  GPReferenceId.Text:='';
  VehicleModule.Checked:=False;
  EnableInput;
end;

procedure TPartTypeForm.DisableInput;
begin
  TypeId.Enabled:=False;
  TypeName.Enabled:=False;
  GPReferenceId.Enabled:=False;
  VehicleModule.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TPartTypeForm.EnableInput;
begin
  TypeId.Enabled:=True;
  TypeName.Enabled:=True;
  GPReferenceId.Enabled:=True;
  VehicleModule.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TPartTypeForm.FormShow(Sender: TObject);
begin
  Init;
  if PartTypeId<>'' then begin
    TypeId.Text:=PartTypeId;
    LoadData;
    if IsReadOnly then DisableInput;
  end;
end;

procedure TPartTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPartTypeForm.SimpanClick(Sender: TObject);
var StrQry,StrGPRef,StrVhcMod:String;
    Qry:TADOQuery;
    IntCount:Integer;
    IsOk,IsExist:Boolean;
begin
  if (TypeId.Text<>'') and (TypeName.Text<>'') then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      DisableInput;
      IsOk:=True;
      IsExist:=False;
      Main.TransStart;
      if Trim(GPReferenceId.Text)<>'' then StrGPRef:=QuotedStr(GPReferenceId.Text) else StrGPRef:='NULL';
      if VehicleModule.Checked then StrVhcMod:='1' else StrVhcMod:='0';
      if PartTypeId='' then begin
        StrQry:='SELECT * FROM wh_part_type WHERE part_type_id='+QuotedStr(TypeId.Text)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount<1 then begin
          Qry.Close;
          StrQry:='INSERT INTO wh_part_type (part_type_id,name,vehicle_module,gp_reference_id,update_user)'+
                  ' VALUES ('+QuotedStr(Trim(TypeId.Text))+','+QuotedStr(Trim(TypeName.Text))+','+StrVhcMod+
                  ','+StrGPRef+','+QuotedStr(user)+' );';
        end else begin
          Qry.Close;
          IsExist:=True;
        end;
      end else begin
          StrQry:='UPDATE wh_part_type SET name='+QuotedStr(Trim(TypeName.Text))+',vehicle_module='+StrVhcMod+
                  ',gp_reference_id='+StrGPRef+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                  ' WHERE part_type_id='+QuotedStr(Trim(TypeId.Text))+';';
      end;
      if Not(IsExist) then begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do IsOk:=False;
        end;
        if IsOk=True then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Disimpan','Part Type',MB_OKCANCEL or MB_ICONINFORMATION);
          if Main.IsFormOpen('PartTypeList') then begin
            PartTypeList.LoadData;
            PartTypeList.RefreshGrid;
          end;
          if Not(IsReadOnly) then begin
            Close;
          end;
        end else begin
          Main.TransRollback;
          EnableInput;
          MessageBox(0,'Gagal Menyimpan' +Chr(13)+Chr(13)+'Silahkan Coba Lagi','Part Type',MB_OK or MB_ICONERROR)
        end;
      end else begin
        Main.TransRollback;
        EnableInput;
        MessageBox(0,'Part Type Id Sudah ada '+Chr(13)+'    Gagal Menyimpan','Part Type',MB_OK or MB_ICONERROR)
      end;
    end;
    Qry.Destroy;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TPartTypeForm.BersihkanClick(Sender: TObject);
begin
  Init;
  EnableInput;
end;

procedure TPartTypeForm.LoadData;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='EXEC GetPartTypeDetail '+QuotedStr(PartTypeId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      TypeName.Text:=Qry.FieldValues['name'];
      if Qry.FieldValues['vehicle_module']='1' then VehicleModule.Checked:=True else VehicleModule.Checked:=False;
      if Qry.FieldValues['gp_reference_id']<>NULL then GPReferenceId.Text:=Qry.FieldValues['gp_reference_id'];
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TPartTypeForm.TypeIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then TypeName.SetFocus;
end;

procedure TPartTypeForm.TypeNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GPReferenceId.SetFocus;
end;

procedure TPartTypeForm.GPReferenceIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TPartTypeForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;


end.
