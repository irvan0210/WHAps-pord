unit ScheduleFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, CheckLst, Grids, ADODB, WHUnit;

type
  TScheduleForm = class(TForm)
    Driver: TComboBox;
    LabelName: TLabel;
    Label2: TLabel;
    Vechile: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Batal: TButton;
    Simpan: TButton;
    GroupMinggu: TGroupBox;
    JadwalHarian: TCheckListBox;
    GroupBulan: TGroupBox;
    Panel1: TPanel;
    Harian: TRadioButton;
    Bulanan: TRadioButton;
    Label5: TLabel;
    TglDari: TDateTimePicker;
    TglSampai: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    CariDriver: TEdit;
    CariArmada: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    NameDisp: TEdit;
    VehicleDisp: TEdit;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BulananClick(Sender: TObject);
    procedure HarianClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CariDriverChange(Sender: TObject);
    procedure CariArmadaChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure VechileChange(Sender: TObject);
    procedure CariDriverKeyPress(Sender: TObject; var Key: Char);
    procedure CariArmadaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EmplArr:Array of TArrString8;
    VhcArr:Array of TArrString8;
    SchArr:Array of TArrString7;
    EmplType:Integer;
    VhcType:Integer;
    is_Helper,is_ReadOnly:Boolean;
    SchId,StrCompanyId:String;
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;ScheduleId:String='';isHelper:Boolean=false;isReadOnly:Boolean=True)Overload;
    procedure RefreshDriver(isActive:Integer=1);
    procedure RefreshVehicle;
    procedure LoadData;
  end;

var
  ScheduleForm: TScheduleForm;


implementation

uses MainU, DB;

{$R *.dfm}

constructor TScheduleForm.Create(AOwner:TComponent;EmployeeType:String;ScheduleId:String='';isHelper:Boolean=false;isReadOnly:Boolean=True);
begin
  is_Helper:=isHelper;
  is_ReadOnly:=isReadOnly;
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    VhcType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    VhcType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
    VhcType:=2;
  end else if UpperCase(EmployeeType)='GRAYLINE' then begin
    EmplType:=2;
    VhcType:=2;
  end else begin
    EmplType:=3;
    VhcType:=3;
  end;
  SchId:=ScheduleId;
  Inherited Create(AOwner);
end;


procedure TScheduleForm.Init;
begin
  case EmplType of
    1:begin
        LabelName.Caption:='Mitra';
      end;
    2:begin
        LabelName.Caption:='Driver';
      end;
    3:begin
        LabelName.Caption:='Karyawan';
      end;
    4:begin
        LabelName.Caption:='BusBoy';
      end;
  end;
  CariDriver.Text:='';
  CariArmada.Text:='';
  Driver.ItemIndex:=0;
  Driver.Clear;
  Vechile.ItemIndex:=0;
  Vechile.Clear;

  NameDisp.Text:='';
  VehicleDisp.Text:='';
  //belum difungsikan
  Harian.Enabled:=False;
  Bulanan.Enabled:=False;
  GroupMinggu.Enabled:=False;
  GroupBulan.Enabled:=False;
  {
  Harian.Checked:=True;
  GroupMinggu.Enabled:=True;
  GroupBulan.Enabled:=False;
  }
end;

procedure TScheduleForm.RefreshVehicle;
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  QStr:='EXEC GetVhcList '+LocationId+',0,'+CompanyId+';';
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  SetLength(VhcArr,Qry.RecordCount);
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    VhcArr[Count][0]:=Qry.FieldValues['vehicle_id'];
    VhcArr[Count][1]:=Qry.FieldValues['body_id'];

    if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
      VhcArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                        ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
    else
      VhcArr[Count][2]:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                        ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  For Count:=0 to Length(VhcArr)-1 do begin
    Vechile.Items.Add(VhcArr[Count][1]);
  end;
end;


procedure TScheduleForm.RefreshDriver(isActive:Integer=1);
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if isActive=1 Then
    QStr:='SELECT a.employee_id,a.name FROM wh_employee AS a '+
          'LEFT JOIN wh_empl_mutation AS b ON (b.empl_mutation_id='+
          '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)))'+
          ' AND (GETDATE()>b.from_date) '+
          'WHERE a.active=1 AND b.employment_type_id='+IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;'
  else
    QStr:='SELECT a.employee_id,a.name FROM wh_employee AS a '+
          'LEFT JOIN wh_empl_mutation AS b ON (b.empl_mutation_id='+
          '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)))'+
          ' AND (GETDATE()>b.from_date) '+
          'WHERE b.employment_type_id='+IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(EmplArr,Count+1);
    EmplArr[Count][0]:=Qry.FieldValues['employee_id'];
    EmplArr[Count][1]:=Qry.FieldValues['Name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  For Count:=0 to Length(EmplArr)-1 do begin
    Driver.Items.Add(EmplArr[Count][0]);
  end;
end;

procedure TScheduleForm.LoadData;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT b.name,a.employee_id,a.vehicle_id,c.body_id,'+
            'CONVERT(VARCHAR(10),a.from_date,103) AS from_date,CONVERT(VARCHAR(10),a.to_date,103) AS to_date'+
            ' FROM wh_working_schedule a'+
            ' INNER JOIN wh_employee b ON b.employee_id=a.employee_id'+
            ' INNER JOIN wh_vehicle c ON c.vehicle_id=a.vehicle_id '+
            ' WHERE a.working_schedule_id='+SchId+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then begin
      Driver.ItemIndex:=Driver.Items.IndexOf(Qry.FieldValues['employee_id']);

      Vechile.ItemIndex:=Vechile.Items.IndexOf(Qry.FieldValues['body_id']);
      TglDari.Date:=StrToDate(Qry.FieldValues['from_date']);
      TglSampai.Date:=StrToDate(Qry.FieldValues['to_date']);

      DriverChange(Nil);
      VechileChange(Nil);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TScheduleForm.BatalClick(Sender: TObject);
begin
  ScheduleForm.Close;
end;

procedure TScheduleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TScheduleForm.BulananClick(Sender: TObject);
begin
  if Bulanan.Checked then begin
    GroupMinggu.Enabled:=False;
    GroupBulan.Enabled:=True;
  end;
end;

procedure TScheduleForm.HarianClick(Sender: TObject);
begin
  if Harian.Checked then begin
    GroupMinggu.Enabled:=True;
    GroupBulan.Enabled:=False;
  end;
end;




procedure TScheduleForm.FormCreate(Sender: TObject);
begin
  Init;
  TglDari.Date:=Now();
  TglSampai.Date:=Now();  
  RefreshDriver;
  RefreshVehicle;
  if SchId<>'' then begin
    if is_ReadOnly then Simpan.Enabled := False
    else Simpan.Enabled := True;
    RefreshDriver(0);
    LoadData;
  end;
end;

procedure TScheduleForm.CariDriverChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
  if Trim(CariDriver.Text)<>'' then begin
    NameDisp.Text:='';
    Driver.ItemIndex:=0;
    Driver.Clear;
    for Count:=0 to Length(EmplArr)-1 do begin
      IsTrue:=False;
      for Count2:=0 to 1 do
        if (StrPos(PChar(UpperCase(EmplArr[Count][Count2])),PChar(UpperCase(CariDriver.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        Driver.Items.Add(EmplArr[Count][0]);
      end;
    end;
  end else begin
    Driver.ItemIndex:=0;
    Driver.Clear;
    RefreshDriver;
  end;
end;

procedure TScheduleForm.CariArmadaChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
  if Trim(CariArmada.Text)<>'' then begin
    Vechile.ItemIndex:=0;
    Vechile.Clear;
    for Count:=0 to Length(VhcArr)-1 do begin
      IsTrue:=False;
      for Count2:=0 to 2 do
        if (StrPos(PChar(UpperCase(VhcArr[Count][Count2])),PChar(UpperCase(CariArmada.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        Vechile.Items.Add(VhcArr[Count][1]);
      end;
    end;
  end else begin
    Vechile.ItemIndex:=0;
    Vechile.Clear;
    RefreshVehicle;
  end;
end;

procedure TScheduleForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    QStr,StrEmplId,StrVhcId,StrWSchdlId:String;
    IsOk:Boolean;
    Count:Integer;
    StrHelper:String;
begin
  if ( (Trim(Driver.Text)<>'') AND (Trim(Vechile.Text)<>'')  ) then begin
    if (EmplType=4) then StrHelper:='1' else StrHelper:='0';

    IsOk:=True;
    Count:=0;
    for Count:=0 to Length(EmplArr)-1 do
      if EmplArr[Count][0]=Driver.Text then StrEmplId:=EmplArr[Count][0];
    for Count:=0 to Length(VhcArr)-1 do
      if VhcArr[Count][1]=Vechile.Text then StrVhcId:=VhcArr[Count][0];
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      if SchId='' then begin
        QStr:='SELECT MAX(working_schedule_id) AS working_schedule_id FROM wh_working_schedule '+
              'WHERE employee_id='+Chr(39)+StrEmplId+Chr(39)+
              ' AND to_date>'+Chr(39)+FormatDateTime('yyyy-mm-dd',TglDari.Date)+Chr(39)+';';
        Qry.SQL.Add(QStr);
        Qry.Open;
        QStr:='';
        if (Qry.RecordCount>0) then
          if ( Qry.FieldValues['working_schedule_id']<>NULL ) then begin
            StrWSchdlId:=Qry.FieldValues['working_schedule_id'];
            QStr:='UPDATE wh_working_schedule SET to_date='+
                  Chr(39)+FormatDateTime('yyyy-mm-dd',TglDari.Date-1)+Chr(39)+
                  ' WHERE working_schedule_id='+Chr(39)+StrWSchdlId+Chr(39)+'; ';
          end;
        QStr:=QStr+' INSERT INTO wh_working_schedule (employee_id,vehicle_id,from_date,to_date,'+
              'location_id,update_user,is_helper)'+
              ' VALUES ('+QuotedStr(StrEmplId)+','+QuotedStr(StrVhcId)+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglDari.Date))+
              ','+QuotedStr(FormatDateTime('yyyy-mm-dd',TglSampai.Date))+
              ','+LocationId+','+QuotedStr(User)+','+StrHelper+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(QStr);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
          end
        end;
//        if Qry.RowsAffected>0 then begin
//            Ok:=True;
//        end
     end else begin
        QStr:='UPDATE wh_working_schedule SET employee_id='+Chr(39)+StrEmplId+Chr(39)+',vehicle_id='+
              Chr(39)+StrVhcId+Chr(39)+',from_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',TglDari.Date)+Chr(39)+
              ',to_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',TglSampai.Date)+Chr(39)+
              ' WHERE working_schedule_id='+SchId+';';
        Qry.SQL.Add(QStr);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
          end
        end;
      end;
      if IsOk then begin
        MessageBox(0,'Penambahan/Perubahan Jadwal Berhasil','Tambah Jadwal',MB_OK or MB_ICONINFORMATION);
        Init;
        RefreshDriver;
        RefreshVehicle;
      end else
        MessageBox(0,'Penambahan/Perubahan Jadwal Gagal','Tambah Jadwal',MB_OK or MB_ICONWARNING);
      Qry.Close;
      Main.CloseDb;
    end;
  end;
end;

procedure TScheduleForm.DriverChange(Sender: TObject);
begin
  NameDisp.Text:=EmplArr[ArrayIndexof(EmplArr,Driver.Text,0)][1];
end;

procedure TScheduleForm.VechileChange(Sender: TObject);
begin
  VehicleDisp.Text:=VhcArr[ArrayIndexof(VhcArr,Vechile.Text,1)][2];
end;

procedure TScheduleForm.CariDriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CariArmada.SetFocus
end;

procedure TScheduleForm.CariArmadaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

end.
