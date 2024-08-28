unit SJBusRubahU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, WHUnit, ADODB;

type
  TSJBusRubah = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    GroupSPJ: TGroupBox;
    Label12: TLabel;
    Panel3: TPanel;
    UnitJalan: TEdit;
    GridSPJ: TStringGrid;
    Cari: TEdit;
    Simpan: TButton;
    Selesai: TButton;
    Bersihkan: TButton;
    Panel1: TPanel;
    NoPolisi: TEdit;
    DriverDisp: TEdit;
    NoReservasi: TEdit;
    Customer: TEdit;
    Hari: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Tanggal: TEdit;
    Jam: TEdit;
    NoSJ: TComboBox;
    Seat: TEdit;
    Route: TEdit;
    Label2: TLabel;
    CetakUlang: TButton;
    GroupDetail: TPanel;
    Driver: TComboBox;
    NoBody: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSPJDblClick(Sender: TObject);
    procedure NoBodyChange(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure NoSJChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure NoSJKeyPress(Sender: TObject; var Key: Char);
    procedure DriverKeyPress(Sender: TObject; var Key: Char);
    procedure NoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshData;
    procedure RefreshGridSJ;
    procedure InitGridSJ;
    procedure Init;
    procedure CheckData;
    procedure DisableInput;
    procedure EnableInput;
    procedure SetDriverMobil;
  public
    { Public declarations }
  end;

var
  SJBusRubah: TSJBusRubah;
  EmplArr,VhcArr,SchArr,SJArr:Array of TArrString20;
  IntRow,MinRowBiaya,BBMPerLiter,SolarPerLiter,GasPerLiter:Integer;
  TransId,EmplId,TelpHP,KMOdo:String;

implementation

uses MainU, AuthorizedFormU, SPJFormBusU, OrderFeeU;

{$R *.dfm}

procedure TSJBusRubah.Init;
var IntCount,IntCount2:Integer;
begin
  TelpHP:='';
  KMOdo:='';
  MinRowBiaya:=0;
  Cari.Text:='';
  NoReservasi.Text:='';
  Customer.Text:='';
  NoBody.Text:='';
  NoBody.Items.Clear;
  NoBody.ItemIndex:=-1;
  NoPolisi.Text:='';
  NoSJ.Items.Clear;
  NoSJ.ItemIndex:=-1;
  NoSJ.Text:='';
  Driver.Text:='';
  Driver.Items.Clear;
  Driver.ItemIndex:=-1;
  DriverDisp.Text:='';
  Tanggal.Text:='';
  Jam.Text:='';
  Hari.Text:='';
  InitGridSJ;
  Seat.Text:='';
  Route.Text:='';
  GroupDetail.Enabled:=False;
end;


procedure TSJBusRubah.InitGridSJ;
begin
  GridSPJ.RowCount:=2;
  GridSPJ.Cells[0,0]:='No SJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='No KPP';
  GridSPJ.Cells[3,0]:='Driver';
  GridSPJ.Cells[4,0]:='Tanggal';
  GridSPJ.Cells[5,0]:='Jam';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
  IntRow:=1;
end;

procedure TSJBusRubah.RefreshData;
var QStr:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
begin
  SetLength(VhcArr,0);
  SetLength(EmplArr,0);
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetDriverList '+LocationId+',2;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(EmplArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      EmplArr[Count][0]:=Qry.FieldValues['employee_id'];
      EmplArr[Count][1]:=Qry.FieldValues['name'];
      EmplArr[Count][2]:=Qry.FieldValues['phone_no'];
      EmplArr[Count][3]:=Qry.FieldValues['cellular_no'];
      if Qry.FieldValues['last_phone_no']<>NULL then EmplArr[Count][4]:=Qry.FieldValues['last_phone_no'];
      if Qry.FieldValues['form_id']<>NULL then EmplArr[Count][5]:=Qry.FieldValues['form_id'];
      if Qry.FieldValues['reason']<>NULL then EmplArr[Count][6]:=Qry.FieldValues['reason'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    QStr:='EXEC GetVhcAvailList '+LocationId+',2 ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(VhcArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[Count][0]:=Qry.FieldValues['vehicle_id'];
      VhcArr[Count][1]:=Qry.FieldValues['body_id'];
      VhcArr[Count][2]:=Qry.FieldValues['license_plate'];
      if Qry.FieldValues['out_ordo_km']<>NULL then VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km']
      else VhcArr[Count][9]:='0';
      if Qry.FieldValues['work_order_id']<>NULL then VhcArr[Count][13]:=Qry.FieldValues['work_order_id']
      else VhcArr[Count][13]:='';
      if Qry.FieldValues['reason']<>NULL then VhcArr[Count][14]:=Qry.FieldValues['reason']
      else VhcArr[Count][14]:='';
      if Qry.FieldValues['seat']<>NULL then VhcArr[Count][16]:=Qry.FieldValues['seat'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    QStr:='SELECT a.*,b.body_id FROM wh_working_schedule AS a '+
          'LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
          'WHERE (location_id='+LocationId+') AND (GETDATE() BETWEEN from_date AND to_date) ;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(SchArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SchArr[Count][0]:=Qry.FieldValues['working_schedule_id'];
      SchArr[Count][1]:=Qry.FieldValues['employee_id'];
      SchArr[Count][2]:=Qry.FieldValues['vehicle_id'];
      SchArr[Count][3]:=Qry.FieldValues['body_id'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    QStr:='EXEC GetVhcOutList '+LocationId+',1,2; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(SJArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SJArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      SJArr[Count][1]:=Qry.FieldValues['body_id'];
      SJArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                   ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
      SJArr[Count][3]:=Qry.FieldValues['employee_id'];
      SJArr[Count][4]:=Qry.FieldValues['name'];
      SJArr[Count][5]:=Qry.FieldValues['out_date'];
      if Qry.FieldValues['out_time']<>NULL then SJArr[Count][6]:=Qry.FieldValues['out_time']
      else SJArr[Count][6]:='';
      if Qry.FieldValues['out_ordo_km']<>NULL then SJArr[Count][7]:=Qry.FieldValues['out_ordo_km'];
      if Qry.FieldValues['fuel_price']<>NULL then SJArr[Count][8]:=Qry.FieldValues['fuel_price']
      else SJArr[Count][8]:='';
      if Qry.FieldValues['gas_price']<>NULL then SJArr[Count][9]:=Qry.FieldValues['gas_price']
      else SJArr[Count][9]:='';
      SJArr[Count][10]:=Qry.FieldValues['order_no'];
      SJArr[Count][11]:=Qry.FieldValues['customer'];
      SJArr[Count][12]:=Qry.FieldValues['day'];
      SJArr[Count][13]:=Qry.FieldValues['date_resv'];
      SJArr[Count][14]:=Qry.FieldValues['time_resv'];
      SJArr[Count][15]:=Qry.FieldValues['seat'];
      SJArr[Count][16]:=Qry.FieldValues['route'];
      SJArr[Count][17]:=Qry.FieldValues['vehicle_id'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  for Count:=0 to Length(EmplArr)-1 do
    Driver.Items.Add(EmplArr[Count][0]);
  for Count:=0 to Length(VhcArr)-1 do
    NoBody.Items.Add(VhcArr[Count][1]);
  Main.M_Normal;
end;

procedure TSJBusRubah.RefreshGridSJ;
var Count,Count2:Integer;
begin
  if Length(SJArr)>0 then begin
    GridSPJ.RowCount:=2;
    for Count2:=0 to 6 do
      GridSPJ.Cells[Count2,1]:='';
    Count2:=1;
    for Count:=0 to Length(SJArr)-1 do begin
      if SJArr[Count][6]='' then begin
        NoSJ.Items.Add(SJArr[Count][0]);
        GridSPJ.RowCount:=Count2+1;
        GridSPJ.Cells[0,Count2]:=SJArr[Count][0];
        GridSPJ.Cells[1,Count2]:=SJArr[Count][1];
        GridSPJ.Cells[2,Count2]:=SJArr[Count][3];
        GridSPJ.Cells[3,Count2]:=SJArr[Count][4];
        GridSPJ.Cells[4,Count2]:=SJArr[Count][13];
        GridSPJ.Cells[5,Count2]:=SJArr[Count][14];
        Inc(Count2);
      end;
    end;
    UnitJalan.Text:=IntToStr(Length(SJArr));
  end else UnitJalan.Text:='0';
end;

procedure TSJBusRubah.CheckData;
begin
  if Trim(NoSJ.Text)<>'' then begin
    TransId:=NoSJ.Text;
    SetLength(EmplArr,Length(EmplArr)+1);
    EmplArr[Length(EmplArr)-1][0]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3];
    EmplArr[Length(EmplArr)-1][1]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4];
    Driver.Items.Add(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3]);
    SetLength(VhcArr,Length(VhcArr)+1);
    VhcArr[Length(VhcArr)-1][0]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][17];
    VhcArr[Length(VhcArr)-1][1]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1];
    VhcArr[Length(VhcArr)-1][2]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][2];
    VhcArr[Length(VhcArr)-1][16]:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][15];
    NoBody.Items.Add(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1]);

    NoBody.ItemIndex:=NoBody.Items.IndexOf(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][1]);
    NoPolisi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][2];
    Driver.ItemIndex:=Driver.Items.IndexOf(SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][3]);
    DriverDisp.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][4];
    NoReservasi.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][10];
    Customer.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][11];
    Hari.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][12];
    Tanggal.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][13];
    Jam.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][14];
    Seat.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][15];
    Route.Text:=SJArr[ArrayIndexOf(SJArr,NoSJ.Text,0)][16];
    GroupDetail.Enabled:=True;
  end;
end;

procedure TSJBusRubah.DisableInput;
begin
  NoSJ.Enabled:=False;
  Hari.Enabled:=False;
  GroupSPJ.Enabled:=False;
  Simpan.Enabled:=False;
  GroupDetail.Enabled:=False;
end;

procedure TSJBusRubah.EnableInput;
begin
  NoSJ.Enabled:=True;
  Hari.Enabled:=True;
  GroupSPJ.Enabled:=True;
  Simpan.Enabled:=True;
end;


procedure TSJBusRubah.SelesaiClick(Sender: TObject);
begin
  SJBusRubah.Close;
end;

procedure TSJBusRubah.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSJBusRubah.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGridSJ;
  RefreshData;
  RefreshGridSJ;
  Main.M_Normal;
end;

procedure TSJBusRubah.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TSJBusRubah.GridSPJDblClick(Sender: TObject);
begin
  if (NoBody.Text='') AND (Trim(GridSPJ.Cells[1,IntRow])<>'') then begin
    Main.M_Busy;
    NoSJ.ItemIndex:=NoSJ.Items.IndexOf(GridSPJ.Cells[0,IntRow]);
    CheckData;
    Main.M_Normal;
  end;
end;

procedure TSJBusRubah.NoBodyChange(Sender: TObject);
begin
  if (NoBody.Text)<>'' then begin
    if Driver.Text='' then begin
        if ArrayIndexOf(SchArr,NoBody.Text,3)>=0 then begin
              Driver.ItemIndex:=Driver.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,NoBody.Text,3)][1]);
              DriverDisp.Text:=EmplArr[Driver.ItemIndex][1];
            end;
    end;
    SetDriverMobil;
  end;
end;


procedure TSJBusRubah.SetDriverMobil;
begin
  if (Driver.Text<>'') then begin
    DriverDisp.Text:=EmplArr[Driver.ItemIndex][1];
    if EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]<>'' then TelpHP:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][4]
    else TelpHP:=EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][2]+','+EmplArr[ArrayIndexOf(EmplArr,Driver.Text,0)][3];
  end;
  if (NoBody.Text='') AND (Driver.Items.Count>0) AND (NoBody.Items.Count>0) then begin
    if ArrayIndexOf(SchArr,Driver.Text,1)>=0 then begin
      if NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Driver.Text,1)][3])>=0 then begin
        NoBody.ItemIndex:=NoBody.Items.IndexOf(SchArr[ArrayIndexOf(SchArr,Driver.Text,1)][3]);
      end;
    end;
  end;
  if NoBody.Text<>'' then begin
    NoPolisi.Text:=VhcArr[NoBody.ItemIndex][2];
    Seat.Text:=VhcArr[NoBody.ItemIndex][16];
    KMOdo:=VhcArr[NoBody.ItemIndex][10];
  end;
end;

procedure TSJBusRubah.DriverChange(Sender: TObject);
begin
  if (Driver.Text<>'') then SetDriverMobil;
end;

procedure TSJBusRubah.NoSJChange(Sender: TObject);
begin
  if Trim(NoSJ.Text)<>'' then CheckData;
end;

procedure TSJBusRubah.BersihkanClick(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGridSJ;
  RefreshData;
  RefreshGridSJ;
  Main.M_Normal;
end;

procedure TSJBusRubah.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoSJ.SetFocus;
end;

procedure TSJBusRubah.NoSJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Driver.SetFocus;
end;

procedure TSJBusRubah.DriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then NoBody.SetFocus;
end;

procedure TSJBusRubah.NoBodyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TSJBusRubah.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    QStr,VhcId,StrDriverId,StrMsg,StrEMessage,StrKMOdo:String;
    DayNight,Count,Val:Integer;
    IsAuth,IsOk:Boolean;
begin
  if (NoBody.ItemIndex>-1) AND (Driver.ItemIndex>-1) then begin
    StrDriverId:=Driver.Text;
    IsAuth:=False;
    IsOk:=True;
    StrMsg:='';
    StrEMessage:='';
    StrKMOdo:='0';
    AuthorizedForm.FormId:=IntToStr(TreeTag);
    if (VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][13]<>'') OR (EmplArr[ArrayIndexOf(EmplArr,StrDriverId,0)][5]<>'') then begin
      if (VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][13]<>'') then begin
        if (MessageBox(0,'Armada ini Memiliki PKB'+Chr(13)+Chr(13)+'Otorisasi Surat Jalan?','Surat Jalan',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
          AuthorizedForm.StrMessage:=' Armada Memiliki PKB No Body :'+NoBody.Text;
          if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
        end;
      end;
{      if (EmplArr[ArrayIndexOf(EmplArr,StrDriverId,0)][5]<>'') then begin
        if (MessageBox(0,PChar('        Driver ini tidak dapat beroperasi '+Chr(13)+'karena KS lebih dari Rp. '+IToCurr(MaxLessDeposit)+' dalam 1 SPJ'+Chr(13)+Chr(13)+' Otorisasi SPJ?'),'SPJ',MB_OKCANCEL or MB_ICONQUESTION)=1) then begin
          AuthorizedForm.StrMessage:=' Mitra KS Lebih dari Rp. '+IToCurr(MaxLessDeposit)+Chr(13)+' Mitra :'+MitraDisp.Text;
          if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
        end;
      end;
}
    end else begin
      IsAuth:=True;
    end;
    if IsAuth then begin
      DisableInput;
      Main.M_Busy;
      VhcId:=VhcArr[ArrayIndexOf(VhcArr,NoBody.Text,1)][0];
      Qry:=TADOQuery.Create(Self);
      if Main.OpenDb then begin
        Qry.Connection:=Main.MyConnection;
        if KMOdo<>'' then StrKMOdo:=KMOdo;
        QStr:='UPDATE wh_vhc_trans set vehicle_id='+QuotedStr(VhcId)+',employee_id='+QuotedStr(Driver.Text)+
              ',out_ordo_km='+StrKMOdo+',update_time=GETDATE(),update_user='+QuotedStr(User)+
              'WHERE vhc_trans_id='+QuotedStr(TransId)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            StrMsg:='Tidak Dapat Menyimpan SJ';
            StrEMessage:=E.Message;
            IsOk:=False;
          end;
        end;
        if IsOk=True then begin
          Bersihkan.SetFocus;
          if MessageBox(0,'SJ Berhasil Dirubah' +Chr(13)+Chr(13)+'   Mau Dicetak ?','SJ Bus',MB_OKCANCEL or MB_ICONQUESTION)=1 then begin
              SPJFormBus:=TSPJFormBus.Create(Self);
              SPJFormBus.RePrint(TransId);
              SPJFormBus.Close;
          end;
        end else begin
          EnableInput;
          MessageBox(0,PChar('SJ Tidak Dapat Disimpan' +Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrEMessage),'SPJ',MB_OK or MB_ICONERROR)
        end;
      end;
      Qry.Destroy;
      Main.CloseDb;
      Main.M_Normal;
    end;
  end;
end;

end.
