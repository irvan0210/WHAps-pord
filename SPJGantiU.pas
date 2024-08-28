unit SPJGantiU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, ADODB;

type
  TSPJGanti = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SPJId: TEdit;
    NoKPP: TEdit;
    Mitra: TEdit;
    NoPolisi: TEdit;
    NoBody: TComboBox;
    Label4: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure LoadData;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;NomorSPJ:String);Overload;
  end;

var
  SPJGanti: TSPJGanti;
  VhcArr:Array of TArrString14;
  NoSPJ,StrBody:String;

implementation

uses MainU;

{$R *.dfm}

constructor TSPJGanti.Create(AOwner:TComponent;NomorSPJ:String);
begin
  NoSPJ:=NomorSPJ;
  Inherited Create(AOwner);
end;


procedure TSPJGanti.SelesaiClick(Sender: TObject);
begin
  SPJGanti.Close;  
end;

procedure TSPJGanti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSPJGanti.Init;
begin
  SPJId.Text:='';
  Mitra.Text:='';
  NoBody.Text:='';
  NoBody.ItemIndex:=-1;
  NoPolisi.Text:='';
end;

procedure TSPJGanti.LoadData;
var Qry:TADOQuery;
    StrQry,StrVhcId,StrMitra,StrLicensePlate:String;
    IntCount:Integer;
begin
  SPJId.Text:=NoSPJ;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT a.vehicle_id,a.employee_id,b.body_id,b.license_plate,c.name,'+
            'CONVERT(VARCHAR(5),a.out_time,108) AS out_time,CONVERT(VARCHAR(10),a.out_date,103) AS out_date'+
            ' FROM wh_vhc_trans a '+
            ' INNER JOIN wh_vehicle b ON b.vehicle_id=a.vehicle_id'+
            ' INNER JOIN wh_employee c ON c.employee_id=a.employee_id'+
            ' WHERE a.vhc_trans_id='+Chr(39)+NoSPJ+Chr(39)+';';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      StrBody:=Qry.FieldValues['body_id'];
      StrVhcId:=Qry.FieldValues['vehicle_id'];
      StrLicensePlate:=Qry.FieldValues['license_plate'];
      Tanggal.Text:=Qry.FieldValues['out_date'];
      Jam.Text:=Qry.FieldValues['out_time'];
      NoKPP.Text:=Qry.FieldValues['employee_id'];
      Mitra.Text:=Qry.FieldValues['name'];
    end;
    Qry.Close;
    StrQry:='EXEC GetVhcAvailList '+LocationId+' ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=1;
    SetLength(VhcArr,Qry.RecordCount+1);
    VhcArr[0][0]:=StrVhcId;
    VhcArr[0][1]:=StrBody;
    VhcArr[0][2]:=Copy(StrLicensePlate,1,1)+' '+Copy(StrLicensePlate,2,4)+' '+Copy(StrLicensePlate,6,Length(StrLicensePlate)+1);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[IntCount][0]:=Qry.FieldValues['vehicle_id'];
      VhcArr[IntCount][1]:=Qry.FieldValues['body_id'];
      VhcArr[IntCount][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+
                            Copy(Qry.FieldValues['license_plate'],2,4)+' '+
                            Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      if Qry.FieldValues['out_rits']<>NULL then VhcArr[IntCount][3]:=Qry.FieldValues['out_rits']
      else VhcArr[IntCount][3]:='0';
      if Qry.FieldValues['in_rits']<>NULL then VhcArr[IntCount][4]:=Qry.FieldValues['in_rits']
      else VhcArr[IntCount][4]:='0';
      if Qry.FieldValues['out_drops']<>NULL then VhcArr[IntCount][5]:=Qry.FieldValues['out_drops']
      else VhcArr[IntCount][5]:='0';
      if Qry.FieldValues['in_drops']<>NULL then VhcArr[IntCount][6]:=Qry.FieldValues['in_drops']
      else VhcArr[IntCount][6]:='0';
      if Qry.FieldValues['out_argo_km']<>NULL then VhcArr[IntCount][7]:=Qry.FieldValues['out_argo_km']
      else VhcArr[IntCount][7]:='0';
      if Qry.FieldValues['in_argo_km']<>NULL then VhcArr[IntCount][8]:=Qry.FieldValues['in_argo_km']
      else VhcArr[IntCount][8]:='0';
      if Qry.FieldValues['out_ordo_km']<>NULL then VhcArr[IntCount][9]:=Qry.FieldValues['out_ordo_km']
      else VhcArr[IntCount][9]:='0';
      if Qry.FieldValues['in_ordo_km']<>NULL then VhcArr[IntCount][10]:=Qry.FieldValues['in_ordo_km']
      else VhcArr[IntCount][10]:='0';
      if Qry.FieldValues['out_hired_km']<>NULL then VhcArr[IntCount][11]:=Qry.FieldValues['out_hired_km']
      else VhcArr[IntCount][11]:='0';
      if Qry.FieldValues['in_hired_km']<>NULL then VhcArr[IntCount][12]:=Qry.FieldValues['in_hired_km']
      else VhcArr[IntCount][12]:='0';
      if Qry.FieldValues['work_order_id']<>NULL then VhcArr[IntCount][13]:=Qry.FieldValues['work_order_id']
      else VhcArr[IntCount][13]:='';
      if Qry.FieldValues['reason']<>NULL then VhcArr[IntCount][14]:=Qry.FieldValues['reason']
      else VhcArr[IntCount][14]:='';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TSPJGanti.RefreshCombo;
var IntCount:Integer;
begin
  for IntCount:=0 to Length(VhcArr)-1 do begin
    NoBody.Items.Add(VhcArr[IntCount][1]);
  end;
  NoBody.ItemIndex:=NoBody.Items.IndexOf(StrBody);
  NoPolisi.Text:=VhcArr[ArrayIndexOf(VhcArr,StrBody,1)][2];
end;

procedure TSPJGanti.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshCombo;
end;

procedure TSPJGanti.NoBodyChange(Sender: TObject);
begin
  NoPolisi.Text:=VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][2];
end;

procedure TSPJGanti.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    IsOk:Boolean;
    StrQry,VhcId,StrEMsg:String;
begin
  if (Trim(NoSPJ)<>'') AND (Trim(NoBody.Text)<>'') then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    VhcId:=VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][0];
    StrEMsg:='';
    if Main.OpenDb then begin
      IsOk:=True;
      Main.TransStart;
      StrQry:='UPDATE wh_vhc_trans SET vehicle_id='+Chr(39)+VhcId+Chr(39)+
              ' WHERE vhc_trans_id='+Chr(39)+NoSPJ+Chr(39)+';';
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        On E:Exception do begin
          IsOk:=False;
          StrEMsg:=E.Message;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Perubahan Armada Berhasil','SPJ Ganti Armada',MB_OK or MB_ICONINFORMATION);
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Perubahan Armada Gagal'+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMsg),'SPJ Ganti Armada',MB_OK or MB_ICONERROR);
      end;
    end;
  end;
  if IsOk then SPJGanti.Close;
end;

end.
