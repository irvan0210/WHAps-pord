unit VehicleEquipmentU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit;

type
  TVehicleEquipment = class(TForm)
    Label1: TLabel;
    LabelAktif: TLabel;
    PanelId: TPanel;
    EquipmentId: TEdit;
    Label5: TLabel;
    Simpan: TButton;
    Bersihkan: TButton;
    Selesai: TButton;
    GroupInput: TPanel;
    Name: TEdit;
    Status: TCheckBox;
    Label18: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Detail: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Low: TRadioButton;
    Normal: TRadioButton;
    High: TRadioButton;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BersihkanClick(Sender: TObject);
    procedure NameKeyPress(Sender: TObject; var Key: Char);
    procedure DetailKeyPress(Sender: TObject; var Key: Char);
    procedure LowKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EquipId:String;
    IsInput:Boolean;
    VhcTypeArr,SeatArr:Array of TArrString8;
    IntExt:Integer;
    procedure Init;
    procedure RefreshJenis;
    procedure LoadData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Equipment_Id:String='';Input_Only:Boolean=False;Int_Ext:Integer=1);Overload;
  end;

var
  VehicleEquipment: TVehicleEquipment;

implementation

uses MainU, ADODB, ProductListU, VehicleEquipmentListU;

{$R *.dfm}

constructor TVehicleEquipment.Create(AOwner:TComponent;Equipment_Id:String='';Input_Only:Boolean=False;Int_Ext:Integer=1);
begin
  EquipId:=Equipment_Id;
  IsInput:=not(Input_Only);
  IntExt:=Int_Ext;
  inherited Create(AOwner);
end;

procedure TVehicleEquipment.Init;
begin
  EquipmentId.Text:='';
  Name.Text:='';
  Status.Checked:=False;
  Normal.Checked:=True;
  if EquipId='' then begin
    Label5.Visible:=False;
    EquipmentId.Visible:=False;
    Status.Visible:=False;
    LabelAktif.Visible:=False;
  end else begin
    Status.Visible:=True;
    LabelAktif.Visible:=True;
  end;
end;

procedure TVehicleEquipment.RefreshJenis;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
end;

procedure TVehicleEquipment.LoadData;
var Qry:TADOQuery;
    StrQry,StrSeat:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_vhc_equipment WHERE vhc_equipment_id='+QuotedStr(EquipId)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      EquipmentId.Text:=Qry.FieldValues['vhc_equipment_id'];
      Name.Text:=Qry.FieldValues['name'];
      case Qry.FieldValues['priority'] of
        0:Low.Checked:=True;
        1:High.Checked:=True;
        2:Normal.Checked:=True;
      end;
      Detail.Text:=Qry.FieldValues['remark'];
      if Qry.FieldValues['status']=1 then Status.Checked:=True;
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleEquipment.DisableInput;
begin
  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
end;

procedure TVehicleEquipment.EnableInput;
begin
  Simpan.Enabled:=True;
  GroupInput.Enabled:=True;
end;

procedure TVehicleEquipment.FormShow(Sender: TObject);
begin
  Init;
  RefreshJenis;
  if not(IsInput) then DisableInput;
  if EquipId<>'' then LoadData;
end;

procedure TVehicleEquipment.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrCompanyId,StrName,StrDetails,StrStatus,StrLocationId,StrPriority,StrType:String;
    StrTransId,StrEMsg:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Name.Text)<>'')then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    Main.M_Busy;
    if Main.OpenDb then begin
      DisableInput;
      Main.TransStart;
      IsOk:=True;
      StrCompanyId:=CompanyId;
      StrLocationId:=LocationId;
      StrName:=QuotedStr(Trim(Name.Text));
      StrDetails:=QuotedStr(Trim(Detail.Text));
      if Low.Checked=True then StrPriority:='0'
      else if Normal.Checked=True then StrPriority:='2'
      else if High.Checked=True then StrPriority:='1';
      if IntExt=1 then StrType:='1' else StrType:='2';   
      if Status.Visible=True then if Status.Checked=True then StrStatus:='1' else StrStatus:='0';
      if (EquipId<>'')  then begin
        StrTransId:=EquipId;
        StrQry:='UPDATE wh_vhc_equipment SET name='+StrName+',remark='+StrDetails+',priority='+StrPriority+
                ',status='+StrStatus+',update_time=GETDATE(),update_user='+QuotedStr(User)+
                ' WHERE vhc_equipment_id='+QuotedStr(StrTransId)+';';
      end else begin
        StrQry:='SELECT RIGHT(MAX(vhc_equipment_id),4) AS max_id FROM wh_vhc_equipment '+
                'WHERE vhc_equipment_id  LIKE '+QuotedStr('VQ'+CompanyCode+ FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
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
        StrTransId:='VQ'+CompanyCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrTransId;
        StrQry:='INSERT INTO wh_vhc_equipment (vhc_equipment_id,company_id,location_id,equipment_type,priority,name,details,update_user) VALUES '+
                '('+QuotedStr(StrTransId)+','+StrCompanyId+','+StrLocationId+','+StrType+','+StrPriority+','+StrName+','+StrDetails+','+QuotedStr(User)+');';
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
        EquipmentId.Text:=StrTransId;
        MessageBox(0,PChar('Data Berhasil Disimpan'),'Data Perlengkapan',MB_OK or MB_ICONINFORMATION);
        if Main.IsFormOpen('VehicleEquipmentList') then VehicleEquipmentList.RefreshDisplay;
        Bersihkan.SetFocus;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Data Perlengkapan',MB_OK or MB_ICONERROR);
        EnableInput;
      end;
    end;
    FreeAndNil(Qry)
  end else
    MessageBox(0,PChar('Silahkan Lengkapi Kolom yang harus diisi'),'Data Perlengkapan',MB_OK or MB_ICONWARNING);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleEquipment.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipment.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshJenis;
  EnableInput;
  Name.SetFocus;
end;

procedure TVehicleEquipment.NameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Normal.SetFocus;
end;


procedure TVehicleEquipment.DetailKeyPress(Sender: TObject; var Key: Char);
begin
  //Simpan.Click;
end;

procedure TVehicleEquipment.LowKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Detail.SetFocus;
end;

end.
