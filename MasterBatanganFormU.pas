unit MasterBatanganFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, CheckLst, Grids, ADODB, WHUnit;

type
  TMasterBatanganForm = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    GroupMinggu: TGroupBox;
    JadwalHarian: TCheckListBox;
    GroupBulan: TGroupBox;
    Panel1: TPanel;
    Harian: TRadioButton;
    Bulanan: TRadioButton;
    Label5: TLabel;
    MonthCalendar1: TMonthCalendar;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    driver_tgldari: TDateTimePicker;
    Label4: TLabel;
    driver_tglsampai: TDateTimePicker;
    DriverNameDisp: TEdit;
    LabelName: TLabel;
    Driver: TComboBox;
    Label7: TLabel;
    CariDriver: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Helper: TComboBox;
    Label9: TLabel;
    helper_tgldari: TDateTimePicker;
    Label10: TLabel;
    helper_tglsampai: TDateTimePicker;
    HelperNameDisp: TEdit;
    Label8: TLabel;
    CariHelper: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Vechile: TComboBox;
    VehicleDisp: TEdit;
    Label6: TLabel;
    CariArmada: TEdit;
    procedure BatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BulananClick(Sender: TObject);
    procedure HarianClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CariArmadaChange(Sender: TObject);
    procedure CariDriverChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure DriverChange(Sender: TObject);
    procedure VechileChange(Sender: TObject);
    procedure CariArmadaKeyPress(Sender: TObject; var Key: Char);
    procedure CariDriverKeyPress(Sender: TObject; var Key: Char);
    procedure CariHelperKeyPress(Sender: TObject; var Key: Char);
    procedure CariHelperChange(Sender: TObject);
    procedure HelperChange(Sender: TObject);
  private
    { Private declarations }
    VhcArr:Array of TArrString8;
    DriverArr:Array of TArrString8;
    HelperArr:Array of TArrString8;

    SchArr:Array of TArrString7;
    EmplType:Integer;
    VhcType:Integer;
    is_Helper,is_ReadOnly:Boolean;
    SchId,StrCompanyId:String;
    procedure Init;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;ScheduleId:String='';isHelper:Boolean=false;isReadOnly:Boolean=True)Overload;
    procedure RefreshVehicle;
    procedure RefreshDriver(isActive:Integer=1);
    procedure RefreshHelper(isActive:Integer=1);
    procedure LoadData;
  end;

var
  MasterBatanganForm: TMasterBatanganForm;


implementation

uses MainU, DB;

{$R *.dfm}

constructor TMasterBatanganForm.Create(AOwner:TComponent;EmployeeType:String;ScheduleId:String='';isHelper:Boolean=false;isReadOnly:Boolean=True);
begin
  //is_Helper:=isHelper;
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


procedure TMasterBatanganForm.Init;
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

  CariArmada.Text:='';
  CariDriver.Text:='';
  CariHelper.Text:='';
  Vechile.ItemIndex:=0;
  Vechile.Clear;
  Driver.ItemIndex:=0;
  Driver.Clear;
  Helper.ItemIndex:=0;
  Helper.Clear;

  VehicleDisp.Text:='';
  DriverNameDisp.Text:='';
  HelperNameDisp.Text:='';

  
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

procedure TMasterBatanganForm.RefreshVehicle;
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

procedure TMasterBatanganForm.RefreshDriver(isActive:Integer=1);
var Count:Integer;
    QStr:String;
    Qry:TADOQuery;
begin
  Main.MyConnection.Open;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if isActive=1 Then
    QStr:='SELECT a.employee_id as driver_id,a.name FROM wh_employee AS a '+
          'LEFT JOIN wh_empl_mutation AS b ON (b.empl_mutation_id='+
          '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)))'+
          ' AND (GETDATE()>b.from_date) '+
          'WHERE a.active=1 AND b.employment_type_id= 2 '+ //'+IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;'
  else
    QStr:='SELECT a.employee_id as driver_id,a.name FROM wh_employee AS a '+
          'LEFT JOIN wh_empl_mutation AS b ON (b.empl_mutation_id='+
          '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)))'+
          ' AND (GETDATE()>b.from_date) '+
          'WHERE b.employment_type_id= 2 '+//IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(DriverArr,Count+1);
    DriverArr[Count][0]:=Qry.FieldValues['driver_id'];
    DriverArr[Count][1]:=Qry.FieldValues['Name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  For Count:=0 to Length(DriverArr)-1 do begin
    Driver.Items.Add(DriverArr[Count][0]);
  end;
end;

procedure TMasterBatanganForm.RefreshHelper(isActive:Integer=1);
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
          'WHERE a.active=1 AND b.employment_type_id= 4 '+ //'+IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;'
  else
    QStr:='SELECT a.employee_id,a.name FROM wh_employee AS a '+
          'LEFT JOIN wh_empl_mutation AS b ON (b.empl_mutation_id='+
          '(SELECT MAX(empl_mutation_id) FROM wh_empl_mutation WHERE (employee_id=a.employee_id)))'+
          ' AND (GETDATE()>b.from_date) '+
          'WHERE b.employment_type_id= 4 '+//IntToStr(EmplType)+
          ' AND location_id='+LocationId+' ORDER BY name;';
  Qry.SQL.Clear;
  Qry.SQL.Add(QStr);
  Qry.Open;
  Count:=0;
  if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
    SetLength(HelperArr,Count+1);
    HelperArr[Count][0]:=Qry.FieldValues['employee_id'];
    HelperArr[Count][1]:=Qry.FieldValues['Name'];
    Qry.Next;
    Inc(Count);
  end;
  Qry.Close;
  Main.MyConnection.Close;
  For Count:=0 to Length(HelperArr)-1 do begin
    Helper.Items.Add(HelperArr[Count][0]);
  end;
end;


procedure TMasterBatanganForm.LoadData;
var StrQry, StrDriverID, StrHelperID:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    {StrQry:='SELECT b.name,a.employee_id,a.vehicle_id,c.body_id,'+
            'CONVERT(VARCHAR(10),a.from_date,103) AS from_date,CONVERT(VARCHAR(10),a.to_date,103) AS to_date'+
            ' FROM wh_working_schedule a'+
            ' INNER JOIN wh_employee b ON b.employee_id=a.employee_id'+
            ' INNER JOIN wh_vehicle c ON c.vehicle_id=a.vehicle_id '+
            ' WHERE a.working_schedule_id='+SchId+';';}
    StrQry:=' EXEC dbo.GetBarVehicleList @Vhc='+QuotedStr(SchId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then begin
      Vechile.ItemIndex:=Vechile.Items.IndexOf(Qry.FieldValues['body_id']);

      if ((Qry.FieldValues['driver_id']<> null))then begin
        Driver.ItemIndex:=Driver.Items.IndexOf(Qry.FieldValues['driver_id']);
      end else
      //StrDriverID :='';
      Driver.ItemIndex:= -1; //Driver.Items.IndexOf(StrDriverID);

      if Qry.FieldValues['from_date_driver'] <> null then
        driver_tgldari.Date:=StrToDate(Qry.FieldValues['from_date_driver']);

      if Qry.FieldValues['to_date_driver'] <> null then
        driver_tglsampai.Date:=StrToDate(Qry.FieldValues['to_date_driver']);

      if (Qry.FieldValues['busboy_id']<> null) or (Qry.FieldValues['busboy_id']<>'') then begin
          StrHelperID := Qry.FieldValues['busboy_id'] ;
         Helper.ItemIndex:=Helper.Items.IndexOf(StrHelperID);
      end else
       Helper.ItemIndex:=-1;


      if Qry.FieldValues['from_date_busboy'] <> null then
        helper_tgldari.Date := StrToDate(Qry.FieldValues['from_date_busboy']);

      if Qry.FieldValues['to_date_busboy'] <> null then
        helper_tglsampai.Date:=StrToDate(Qry.FieldValues['to_date_busboy']);

      VechileChange(Nil);
      DriverChange(Nil);
      HelperChange(Nil);

    end;
    Qry.Close;
    Main.CloseDb;
  end;
end;

procedure TMasterBatanganForm.BatalClick(Sender: TObject);
begin
  MasterBatanganForm.Close;
end;

procedure TMasterBatanganForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMasterBatanganForm.BulananClick(Sender: TObject);
begin
  if Bulanan.Checked then begin
    GroupMinggu.Enabled:=False;
    GroupBulan.Enabled:=True;
  end;
end;

procedure TMasterBatanganForm.HarianClick(Sender: TObject);
begin
  if Harian.Checked then begin
    GroupMinggu.Enabled:=True;
    GroupBulan.Enabled:=False;
  end;
end;

procedure TMasterBatanganForm.FormCreate(Sender: TObject);
begin
  Init;
  driver_tgldari.Date:=Now();
  driver_tglsampai.Date:=Now();
  helper_tgldari.Date:= Now();
  helper_tglsampai.Date:=Now();

  RefreshVehicle;
  RefreshDriver;
  RefreshHelper;
  if SchId<>'' then begin
   // if is_ReadOnly then Simpan.Enabled := False
   // else Simpan.Enabled := True;
   RefreshDriver(0);
   RefreshHelper(0);
   LoadData;
  end;
end;

procedure TMasterBatanganForm.CariArmadaChange(Sender: TObject);
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

procedure TMasterBatanganForm.CariDriverChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
  if Trim(CariDriver.Text)<>'' then begin
    DriverNameDisp.Text:='';
    Driver.ItemIndex:=0;
    Driver.Clear;
    for Count:=0 to Length(DriverArr)-1 do begin
      IsTrue:=False;
      for Count2:=0 to 1 do
        if (StrPos(PChar(UpperCase(DriverArr[Count][Count2])),PChar(UpperCase(CariDriver.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
        Driver.Items.Add(DriverArr[Count][0]);
      end;
    end;
  end else begin
    Driver.ItemIndex:=0;
    Driver.Clear;
    RefreshDriver;
  end;
end;

procedure TMasterBatanganForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    QStr,StrDriverId,StrHelperId,StrVhcId,StrWSchdlId:String;
    IsOk:Boolean;
    Count:Integer;
    StrHelper:String;
begin
  if (Trim(Vechile.Text)<>'') then begin
    IsOk:=True;
    Count:=0;
    for Count:=0 to Length(VhcArr)-1 do
      if VhcArr[Count][1]=Vechile.Text then StrVhcId:=VhcArr[Count][0];

    for Count:=0 to Length(DriverArr)-1 do
      if DriverArr[Count][0]=Driver.Text then StrDriverId:=DriverArr[Count][0];

    for Count:=0 to Length(HelperArr)-1 do
      if HelperArr[Count][0]=Helper.Text then StrHelperId:=HelperArr[Count][0];

    if (Trim(Driver.Text)<>'') then begin
        StrHelper:='0' ;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        if Main.OpenDb then begin
          if SchId='' then  begin
            QStr:='SELECT MAX(working_schedule_id) AS working_schedule_id FROM wh_working_schedule '+
              'WHERE employee_id='+Chr(39)+StrDriverId+Chr(39)+ ' AND is_helper= '+StrHelper+
              ' AND to_date>'+Chr(39)+FormatDateTime('yyyy-mm-dd',driver_tgldari.Date)+Chr(39)+';';
            Qry.SQL.Add(QStr);
            Qry.Open;
            QStr:='';
            if (Qry.RecordCount>0) then
            if ( Qry.FieldValues['working_schedule_id']<>NULL ) then begin
              QStr:=QStr+' INSERT INTO wh_working_schedule (employee_id,vehicle_id,from_date,to_date,'+
                        'location_id,update_user,is_helper)'+
                        ' VALUES ('+QuotedStr(StrDriverId)+','+QuotedStr(StrVhcId)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',driver_tgldari.Date))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',driver_tglsampai.Date))+
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
           // end;
            end;

         end else begin
          QStr:='SELECT MAX(working_schedule_id) AS working_schedule_id FROM wh_working_schedule '+
              'WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+' AND is_helper= '+StrHelper+' ;';
          Qry.SQL.Add(QStr);
          Qry.Open;
          QStr:='';
            if (Qry.RecordCount>0)  AND (Qry.FieldValues['working_schedule_id']<>NULL )  then begin
              //Qry.FieldValues['working_schedule_id'];
              QStr:='UPDATE wh_working_schedule SET employee_id='+Chr(39)+StrDriverId+Chr(39)+',vehicle_id='+
                    Chr(39)+StrVhcId+Chr(39)+',from_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',driver_tgldari.Date)+Chr(39)+
                    ',to_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',driver_tglsampai.Date)+Chr(39)+
                    ' WHERE working_schedule_id='+QuotedStr(Qry.FieldValues['working_schedule_id'])+
                    ' AND vehicle_id='+Chr(39)+StrVhcId+Chr(39)+';';
             end else begin
               QStr:=' INSERT INTO wh_working_schedule (employee_id,vehicle_id,from_date,to_date,'+
                        'location_id,update_user,is_helper)'+
                        ' VALUES ('+QuotedStr(StrDriverId)+','+QuotedStr(StrVhcId)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',driver_tgldari.Date))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',driver_tglsampai.Date))+
                        ','+LocationId+','+QuotedStr(User)+','+StrHelper+');';
             end;
            Qry.SQL.Clear;
            Qry.SQL.Add(QStr);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
              end
            end;

         end;

       end;
    end;

    //HELPER

    if (Trim(Helper.Text)<>'') then begin
        StrHelper:='1' ;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        if Main.OpenDb then begin
        // MessageBox(0,PChar(SchId),'VHC',MB_OK or MB_ICONINFORMATION);
        //end;
          if SchId='' then  begin
            QStr:='SELECT MAX(working_schedule_id) AS working_schedule_id FROM wh_working_schedule '+
              'WHERE employee_id='+Chr(39)+StrHelperId+Chr(39)+' AND is_helper ='+StrHelper+
              ' AND to_date>'+Chr(39)+FormatDateTime('yyyy-mm-dd',helper_tgldari.Date)+Chr(39)+';';
            Qry.SQL.Add(QStr);
            Qry.Open;
            QStr:='';
            if (Qry.RecordCount>0) then
            if ( Qry.FieldValues['working_schedule_id']<>NULL ) then begin
              QStr:=QStr+' INSERT INTO wh_working_schedule (employee_id,vehicle_id,from_date,to_date,'+
                        'location_id,update_user,is_helper)'+
                        ' VALUES ('+QuotedStr(StrHelperId)+','+QuotedStr(StrVhcId)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',helper_tgldari.Date))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',helper_tglsampai.Date))+
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
           // end;
            end;

         end else begin

          QStr:='SELECT MAX(working_schedule_id) AS working_schedule_id FROM wh_working_schedule '+
              'WHERE vehicle_id='+Chr(39)+StrVhcId+Chr(39)+' AND is_helper='+StrHelper+';';
          Qry.SQL.Add(QStr);
          Qry.Open;
          QStr:='';
          //MessageBox(0,PChar(StrVhcId),'VHC',MB_OK or MB_ICONINFORMATION);
          //MessageBox(0,PChar(StrHelperId),'VHC',MB_OK or MB_ICONINFORMATION);
         // StrVhcId

            if (Qry.RecordCount>0) AND (Qry.FieldValues['working_schedule_id']<>NULL ) then begin
              QStr:='UPDATE wh_working_schedule SET employee_id='+Chr(39)+StrHelperId+Chr(39)+',vehicle_id='+
                    Chr(39)+StrVhcId+Chr(39)+',from_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',helper_tgldari.Date)+Chr(39)+
                    ',to_date='+Chr(39)+FormatDateTime('yyyy-mm-dd',helper_tglsampai.Date)+Chr(39)+
                    ' WHERE working_schedule_id='+QuotedStr(Qry.FieldValues['working_schedule_id'])+
                    ' AND vehicle_id='+Chr(39)+StrVhcId+Chr(39)+';';
             end else begin
               QStr:=' INSERT INTO wh_working_schedule (employee_id,vehicle_id,from_date,to_date,'+
                        'location_id,update_user,is_helper)'+
                        ' VALUES ('+QuotedStr(StrHelperId)+','+QuotedStr(StrVhcId)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',helper_tgldari.Date))+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',helper_tglsampai.Date))+
                        ','+LocationId+','+QuotedStr(User)+','+StrHelper+');';
             end;
            Qry.SQL.Clear;
            Qry.SQL.Add(QStr);
            try
              Qry.ExecSQL;
            except
              on E:Exception do begin
                IsOk:=False;
              end
            end;
         end;

       end;
     end;
     
    if IsOk then begin
          MessageBox(0,'Penambahan/Perubahan Jadwal Berhasil','Tambah Jadwal',MB_OK or MB_ICONINFORMATION);
          Init;
          RefreshDriver;
          RefreshVehicle;
    end else  begin
    MessageBox(0,'Penambahan/Perubahan Jadwal Gagal','Tambah Jadwal',MB_OK or MB_ICONWARNING);
      Qry.Close;
      Main.CloseDb;
      end;

  end;
 { if ( (Trim(Driver.Text)<>'') AND (Trim(Vechile.Text)<>'')  ) then begin
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
  end; }
end;

procedure TMasterBatanganForm.VechileChange(Sender: TObject);
begin
  VehicleDisp.Text:=VhcArr[ArrayIndexof(VhcArr,Vechile.Text,1)][2];
end;

procedure TMasterBatanganForm.DriverChange(Sender: TObject);
begin
  if  (Driver.Text <> '') then
    DriverNameDisp.Text:=DriverArr[ArrayIndexof(DriverArr,Driver.Text,0)][1];
end;

procedure TMasterBatanganForm.HelperChange(Sender: TObject);
begin
 if (Helper.Text <> '') then
  HelperNameDisp.Text:=HelperArr[ArrayIndexof(HelperArr,Helper.Text,0)][1];
end;

procedure TMasterBatanganForm.CariArmadaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CariArmada.SetFocus
end;

procedure TMasterBatanganForm.CariDriverKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then CariDriver.SetFocus;
end;

procedure TMasterBatanganForm.CariHelperKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;
end;

procedure TMasterBatanganForm.CariHelperChange(Sender: TObject);
var Count,Count2:Integer;
    IsTrue:Boolean;
begin
//  HelperNameDisp.Text:=HelperArr[ArrayIndexof(HelperArr,Helper.Text,0)][1];
  if (CariHelper.Text <>'') then begin
    HelperNameDisp.Text := '';
    Helper.ItemIndex := 0;
    Helper.Clear;
    for Count:=0 to Length(HelperArr)-1 do begin
        IsTrue:=False;
        for Count2:=0 to 1 do
          if (StrPos(PChar(UpperCase(HelperArr[Count][Count2])),PChar(UpperCase(CariHelper.Text)))<>nil) then IsTrue:=True;
        if IsTrue then begin
          Helper.Items.Add(HelperArr[Count][0]);
        end;
    end;
  end else begin
    Helper.ItemIndex:=0;
    Helper.Clear;
    RefreshHelper;
  end;
end;



end.
