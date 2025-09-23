unit EmployeeListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, Buttons, WHUnit, ZColorStringGrid,
  ExtCtrls;

type
  TEmployeeList = class(TForm)
    Selesai: TButton;
    KolomCari: TEdit;
    Label1: TLabel;
    ToXCel: TSpeedButton;
    StrGrid: TZColorStringGrid;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TEdit;
    PanelJenis: TPanel;
    Jenis: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    GroupCompany: TGroupBox;
    Label6: TLabel;
    SBU: TComboBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridDblClick(Sender: TObject);
    procedure KolomCariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ToXCelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JenisChange(Sender: TObject);
    procedure SBUChange(Sender: TObject);
//    procedure StrGridClick(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    EmployeeArr:Array of TArrString30;
    CompanyArr,JenisArr:Array of TArrString5;
    IntRow,IntCol,IntMinRow:Integer;
    EmplType,StrCompanyId:Integer;
    Stat:Integer;
    Expd:Integer;
    Initiation:Boolean;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='');Overload;
    procedure RefreshList;
  end;

var
  EmployeeList: TEmployeeList;

implementation

{$R *.dfm}

Uses MainU, StrUtils, EmployeeFormU, MutasiKaryawanFormU,
  EmployeeIDRenewalU, KPPPrintU, EmployeeRenewalFormU, ReferensiMitraListU,
  EmployeeHistoryFormU, EmployeeCommissionFormU, EmployeeHistoryRptU,
  EmployeeHistoryListU, AttandanceLeaveFormU, EmplAttedanceInfoU, 
  CustomerComplainListU, CustomerComplainRptU,
  EmployeeHistoryLakaListU, EmployeeHistoryLakaFormU, EmployeeHistoryListRptU,
  EmployeeHistoryLakaRptU, EmployeeHistoryTrainingRptU,
  KontrakKaryawanFormU;

constructor TEmployeeList.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='');
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
  end else if UpperCase(EmployeeType)='GRAYLINE' then begin
    EmplType:=2;
  end else if UpperCase(EmployeeType)='OFFICE' then begin
    EmplType:=3;
  end;
  Stat:=Status;
  Expd:=Expired;
  Initiation:=True;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TEmployeeList.Init;
var IntCount:Integer;
    Qry:TADOQuery;
    StrQry:String;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  
  Main.M_Busy;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_user_export where user_id='+QuotedStr(User)+' and active=1 and form_id=180105';
    Qry.SQL.Add(StrQry);
    Qry.Open;

    if Qry.RecordCount>0 then  begin
       ToXCel.Enabled:=True;
    end else begin
      ToXCel.Enabled:=False;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;

  IntMinRow:=1;
  StrGrid.Cells[14,0]:='';
  StrGrid.Cells[15,0]:='';
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  Case EmplType of
    1:begin
        Caption:='Data Mitra';
        PanelJenis.Visible:=True;
        StrGrid.ColWidths[1]:=12;

        StrGrid.ColWidths[11]:=130;
        StrGrid.ColWidths[12]:=80;
        StrGrid.ColWidths[20]:=80;
        StrGrid.ColWidths[22]:=70;
        StrGrid.ColWidths[23]:=130;
        StrGrid.Cells[1,0]:='S';
        StrGrid.Cells[4,0]:='No KPP';
        StrGrid.Cells[12,0]:='KPP Berakhir';
        StrGrid.Cells[20,0]:='No KPP Lama';
        StrGrid.Cells[21,0]:='Reguler';
        StrGrid.Cells[22,0]:='No Referensi';
        StrGrid.Cells[23,0]:='Nama Referensi';
        StrGrid.Cells[11,0]:='No SIM';
        StrGrid.Cells[12,0]:='SIM Berakhir';
      end;
    2:begin
        Caption:='Data Driver';
        PanelJenis.Visible:=False;
        StrGrid.ColWidths[1]:=12;
        StrGrid.ColWidths[10]:=0;
        StrGrid.ColWidths[11]:=130;
        StrGrid.ColWidths[12]:=80;

        StrGrid.ColWidths[20]:=0;
        StrGrid.ColWidths[21]:=0;
        StrGrid.ColWidths[22]:=0;
        StrGrid.ColWidths[23]:=0;
        StrGrid.ColWidths[24]:=0;
        StrGrid.Cells[1,0]:='S';
        StrGrid.Cells[4,0]:='NIP';
        StrGrid.Cells[10,0]:='';
        StrGrid.Cells[11,0]:='No SIM';
        StrGrid.Cells[12,0]:='SIM Berakhir';
        StrGrid.Cells[16,0]:='No Rekening';
        StrGrid.Cells[17,0]:='Nama Rekening';
        StrGrid.Cells[18,0]:='No KTP';
        StrGrid.Cells[19,0]:='No E-Toll';
        StrGrid.ColWidths[16]:=130;
        StrGrid.ColWidths[17]:=130;
        StrGrid.ColWidths[18]:=150;
        StrGrid.ColWidths[19]:=150;
      end;
    3:begin
        Caption:='Data Karyawan';
        PanelJenis.Visible:=False;
        StrGrid.ColWidths[1]:=0;
        StrGrid.ColWidths[10]:=0;
        StrGrid.ColWidths[11]:=0;
        StrGrid.ColWidths[12]:=0;
        StrGrid.ColWidths[18]:=0;
        StrGrid.ColWidths[19]:=0;
        StrGrid.ColWidths[20]:=0;
        StrGrid.ColWidths[21]:=0;
        StrGrid.ColWidths[22]:=0;
        StrGrid.Cells[1,0]:='';
        StrGrid.Cells[4,0]:='NIK';
        StrGrid.Cells[10,0]:='';
        StrGrid.Cells[11,0]:='';
        StrGrid.Cells[12,0]:='';
      end;
    4:begin
        Caption:='Data Busboy';
        PanelJenis.Visible:=False;
        StrGrid.ColWidths[1]:=12;
        StrGrid.ColWidths[10]:=0;
        StrGrid.ColWidths[11]:=0;
        StrGrid.ColWidths[12]:=0;
        StrGrid.ColWidths[18]:=0;
        StrGrid.ColWidths[19]:=0;
        StrGrid.ColWidths[20]:=0;
        StrGrid.ColWidths[21]:=0;
        StrGrid.ColWidths[22]:=0;
        StrGrid.ColWidths[23]:=0;
        StrGrid.ColWidths[24]:=0;
        StrGrid.Cells[1,0]:='S';
        StrGrid.Cells[4,0]:='NIB';
        StrGrid.Cells[10,0]:='';
        StrGrid.Cells[11,0]:='';
        StrGrid.Cells[12,0]:='';
        StrGrid.Cells[16,0]:='No Rekening';
        StrGrid.Cells[17,0]:='Nama Rekening';
        StrGrid.Cells[18,0]:='No KTP';
        StrGrid.Cells[19,0]:='No E-Toll';
        StrGrid.ColWidths[16]:=130;
        StrGrid.ColWidths[17]:=130;
        StrGrid.ColWidths[18]:=150;

      end;
  end;
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=12;
  StrGrid.ColWidths[2]:=25;
  StrGrid.ColWidths[3]:=20;

  StrGrid.ColWidths[4]:=68;
  StrGrid.ColWidths[5]:=140;
  StrGrid.ColWidths[6]:=130;
  StrGrid.ColWidths[7]:=280;
  StrGrid.ColWidths[8]:=100;
  StrGrid.ColWidths[13]:=55;
  StrGrid.ColWidths[14]:=45;
  StrGrid.ColWidths[15]:=40;
  StrGrid.ColWidths[22]:=0;

  StrGrid.Cells[0,0]:='F';
  StrGrid.Cells[2,0]:='KTP';
  StrGrid.Cells[3,0]:='KK';
  StrGrid.Cells[5,0]:='Nama';
  StrGrid.Cells[6,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[7,0]:='Alamat';
  StrGrid.Cells[8,0]:='Telp/HP';
  StrGrid.Cells[9,0]:='Tgl Masuk';
  StrGrid.Cells[13,0]:='Pendidikan';
  StrGrid.Cells[14,0]:='Agama';
  StrGrid.Cells[15,0]:='Status';
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  if PanelJenis.Visible=True then begin
    Jenis.Text:='';
    Jenis.ItemIndex:=-1;
    Jenis.Items.Clear;
    SetLength(JenisArr,3);
    JenisArr[0][0]:='2';
    JenisArr[0][1]:='All';
    JenisArr[1][0]:='0';
    JenisArr[1][1]:='Eksekutif';
    JenisArr[2][0]:='1';
    JenisArr[2][1]:='Reguler';
    for IntCount:=0 to Length(JenisArr)-1 do
      Jenis.Items.Add(JenisArr[IntCount][1]);
    Jenis.ItemIndex:=Jenis.Items.IndexOf('All') ;
  end;
  for IntCount:=0 to 24 do
    StrGrid.Cells[IntCount,1]:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmployeeList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    SetLength(CompanyArr,0);
    StrQry:='EXEC GetCompanyLocationList';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(CompanyArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      CompanyArr[IntCount][0]:=Qry.FieldValues['company_location_id'];
      CompanyArr[IntCount][1]:=Qry.FieldValues['company_id'];
      CompanyArr[IntCount][2]:=Qry.FieldValues['location_id'];
      CompanyArr[IntCount][3]:=Qry.FieldValues['name'];
      CompanyArr[IntCount][4]:=Qry.FieldValues['location'];
      CompanyArr[IntCount][5]:=Qry.FieldValues['company_code'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  for IntCount:=0 to Length(CompanyArr)-1  do begin
    SBU.Items.Add(CompanyArr[IntCount][3]+' ('+CompanyArr[IntCount][4]+')');
    if (CompanyId=CompanyArr[IntCount][1]) and  (LocationId=CompanyArr[IntCount][2]) then SBU.ItemIndex:=IntCount;
  end;
  Main.M_Normal;
{  for IntCount:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[IntCount][0]);
  Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  if StrToInt(LocationId)>1 then GroupLokasi.Enabled:=False;
}
end;

procedure TEmployeeList.RefreshList;
var Count,Count2:Integer;
    StrQry,StrLocationId,StrStat,StrExpd,StrReguler:String;
    Qry:TADOQuery;
begin
  Main.M_Busy;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 16 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(EmployeeArr,0);
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrLocationId:=','+CompanyArr[SBU.ItemIndex][2];
    StrStat:=','+IntToStr(Stat);
    if Expd>0 then StrExpd:=','+IntToStr(Expd) else StrExpd:='';
    if PanelJenis.Visible then begin
      if Jenis.Text<>'2' then StrReguler:=',@Reguler='+JenisArr[Jenis.ItemIndex][0] else StrReguler:='';
    end else StrReguler:='';
    StrQry:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocationId+StrStat+StrExpd+StrReguler+',@CompanyId='+CompanyId+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(EmployeeArr,Count+1);
      EmployeeArr[Count][0]:=Qry.FieldValues['photo_image'];
      EmployeeArr[Count][1]:=Qry.FieldValues['license_image'];
      EmployeeArr[Count][2]:=Qry.FieldValues['ktp_image'];
      EmployeeArr[Count][3]:=Qry.FieldValues['kk_image'];

      EmployeeArr[Count][4]:=Qry.FieldValues['employee_id'];
      EmployeeArr[Count][5]:=Qry.FieldValues['name'];
      if Qry.FieldValues['birth']<>NULL then
        EmployeeArr[Count][6]:=Qry.FieldValues['birth'];
      if Qry.FieldValues['address']<>NULL then
        EmployeeArr[Count][7]:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone']<>NULL then
        EmployeeArr[Count][8]:=Qry.FieldValues['phone'];
      if Qry.FieldValues['join_date']<>NULL then
        EmployeeArr[Count][9]:=Qry.FieldValues['join_date'];
      if Qry.FieldValues['kpp_expired']<>NULL then
        EmployeeArr[Count][10]:=Qry.FieldValues['kpp_expired'];
      if Qry.FieldValues['license_id']<>NULL then
        EmployeeArr[Count][11]:=Qry.FieldValues['license_id'];
      if Qry.FieldValues['license_expired']<>NULL then
        EmployeeArr[Count][12]:=Qry.FieldValues['license_expired'];
      if Qry.FieldValues['education']<>NULL then
        EmployeeArr[Count][13]:=Qry.FieldValues['education'];
      if Qry.FieldValues['religion']<>NULL then
        EmployeeArr[Count][14]:=Qry.FieldValues['religion'];
      if Qry.FieldValues['marital_status']<>NULL then
        if Qry.FieldValues['children']<>NULL then
          EmployeeArr[Count][15]:=Qry.FieldValues['marital_status']+'-'+IntToStr(Qry.FieldValues['children'])
        else
          EmployeeArr[Count][15]:=Qry.FieldValues['marital_status'];
      if Qry.FieldValues['account_number']<>NULL then
          EmployeeArr[Count][16]:=Qry.FieldValues['account_number'];
      if Qry.FieldValues['account_name']<>NULL then
          EmployeeArr[Count][17]:=Qry.FieldValues['account_name'];

      if Qry.FieldValues['id_number']<>NULL then
          EmployeeArr[Count][18]:=Qry.FieldValues['id_number'];
      if Qry.FieldValues['no_etoll']<>NULL then
          EmployeeArr[Count][19]:=Qry.FieldValues['no_etoll'];

      if EmplType=1 then begin
        if Qry.FieldValues['old_id_reference']<>NULL then
          EmployeeArr[Count][20]:=Qry.FieldValues['old_id_reference'];
        if Qry.FieldValues['reguler'] then EmployeeArr[Count][21]:='Reguler' else EmployeeArr[Count][20]:='Eksekutif' ;
        if Qry.FieldValues['reference']<>NULL then
          EmployeeArr[Count][22]:=Qry.FieldValues['reference'];
        if Qry.FieldValues['reference_name']<>NULL then
          EmployeeArr[Count][23]:=Qry.FieldValues['reference_name'];
      end;
      if Qry.FieldValues['bad_flag']<>NULL then
        EmployeeArr[Count][24]:=Qry.FieldValues['bad_flag'] else EmployeeArr[Count][24]:='0';
      EmployeeArr[Count][25]:=Qry.FieldValues['active'];

      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  if Length(EmployeeArr)>0 then
    StrGrid.RowCount:=Length(EmployeeArr)+1
  else
    StrGrid.RowCount:=2;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 24 do
      StrGrid.Cells[Count2,Count+1]:=EmployeeArr[Count][Count2];
    if EmployeeArr[Count][23]<>'' then
      if StrToInt(EmployeeArr[Count][24])>=1 then for Count2:=0 to 24 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clRed
    else for Count2:=0 to 24 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clWindowText;
  end;
  Total.Text:=IntToStr(Length(EmployeeArr));
  Main.M_Normal;
end;


procedure TEmployeeList.SelesaiClick(Sender: TObject);
begin
  EmployeeList.Close;
end;

procedure TEmployeeList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeList.StrGridDblClick(Sender: TObject);
var Str,QStr,EmpType:String;
    Result:Integer;
    QEmp:TADOQuery;
    StrEmplType:String;
begin
  if IntRow>=IntMinRow then begin
    if Main.IsFormOpen('EmployeeForm')=False then begin
      Case EmplType of
        1:begin
            StrEmplType:='Taxi';
            EmpType:='Mitra ';
          end;
        2:begin
            StrEmplType:='Bus';
            EmpType:='Driver ';
          end;
        3:begin
            StrEmplType:='Office';
            EmpType:='Karyawan ';
          end;
        4:begin
            StrEmplType:='Bus2';
            EmpType:='BusBoy ';
          end;
      end;
      if StrGrid.Cells[4,IntRow]<>'' then begin
        if FormRequest='' then begin
          if IntCol>18 then begin
            Case CaseStr(RightStr(IntToStr(TreeTag),2),['05']) of
              0: if (StrGrid.Cells[13,IntRow]<>'') and (Main.IsFormOpen('ReferensiMitraList')=False) then ReferensiMitraList:=TReferensiMitraList.Create(Self,'Taxi',StrGrid.Cells[20,IntRow],StrGrid.Cells[21,IntRow],1);
            end;
          end else if (IntCol=4) and (StrEmplType='Office') then begin
              if (Main.IsFormOpen('EmplAttedanceInfo')=False) then
                EmplAttedanceInfo := TEmplAttedanceInfo.Create(Self, StrGrid.Cells[4,IntRow]);
          end else begin
            if (RightStr(IntToStr(TreeTag),2)='02') then begin
              EmployeeForm:=TEmployeeForm.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='03') then begin
              if IntRow>0 then begin
                Str:=EmpType+StrGrid.Cells[5,IntRow]+'('+StrGrid.Cells[6,IntRow]+') akan dihapus?';
                Result:=MessageBox(0,PChar(Str),'Delete User',MB_OKCANCEL or MB_ICONQUESTION);
                if Result=1 then begin
                    Main.M_Busy;
                    if Main.OpenDb then begin
                      QEmp:=TADOQuery.Create(Self);
                      QEmp.Connection:=Main.MyConnection;
                      QStr:='DELETE FROM wh_empl_mutation WHERE employee_id='+Chr(39)+StrGrid.Cells[4,IntRow]+Chr(39)+';'+
                            'DELETE FROM wh_empl_detail WHERE employee_id='+Chr(39)+StrGrid.Cells[4,IntRow]+Chr(39)+';'+
                            'DELETE FROM wh_employee WHERE employee_id='+Chr(39)+StrGrid.Cells[4,IntRow]+Chr(39)+';';
                      QEmp.SQL.Add(QStr);
                      QEmp.ExecSQL;
                      if QEmp.RowsAffected>0 then begin
                        Str:='Data '+EmpType+' berhasil dihapus';
                        MessageBox(0,PChar(Str),'Hapus Data',MB_OK or MB_ICONINFORMATION);
                      end;
                      QEmp.Close;
                    end;
                    QEmp.Destroy;
                    Main.CloseDb;
                    Main.M_Normal;
                    RefreshList;
                end;
              end;
            end else if (RightStr(IntToStr(TreeTag),2)='04')  then begin
              if (StrGrid.CellStyle[1,IntRow].Font.Color<>clRed) or (StrGrid.Cells[22,IntRow]='1') or (StrGrid.Cells[22,IntRow]='2') then begin
                if StrGrid.Cells[22,IntRow]='0' then begin
                  EmployeeIdRenewal:=TEmployeeIdRenewal.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType);
                end else begin
                  if (StrGrid.CellStyle[1,IntRow].Font.Color=clRed) then EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType,0)
                  else EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType)
                end;
              end else MessageBox(0,PChar('Mitra Bermasalah Silahkan Otorisasi'),'Mutasi Karyawan/Mitra',MB_OK or MB_ICONERROR);
            end else if (RightStr(IntToStr(TreeTag),2)='05')  then begin
              EmployeeForm:=TEmployeeForm.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow]);
              //Close;
            end else if (RightStr(IntToStr(TreeTag),2)='09') then begin
              if EmpType='1' then
                EmployeeIdRenewal:=TEmployeeIdRenewal.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow])
              else
                EmployeeHistoryForm:=TEmployeeHistoryForm.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow],0);
            end else if (RightStr(IntToStr(TreeTag),2)='11') then begin
              EmployeeHistoryLakaForm:=TEmployeeHistoryLakaForm.Create(Self,StrGrid.Cells[4,IntRow],'','EMPLOYEEHISTORYLAKA-FORM');
            end else if (RightStr(IntToStr(TreeTag),2)='07') then begin
              KPPPrint:=TKPPPrint.Create(Self,StrGrid.Cells[4,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='10') then begin
              //EmployeeRenewalForm:=TEmployeeRenewalForm.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow]);

              case EmplType of
                1:EmpType:='Taxi';
                2:EmpType:='Bus';
                3:EmpType:='';
              end;
              EmployeeHistoryList:=TEmployeeHistoryList.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow]);

            end else if (RightStr(IntToStr(TreeTag),2)='15') then begin
              EmployeeHistoryForm:=TEmployeeHistoryForm.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow],0);
            end else if (RightStr(IntToStr(TreeTag),2)='21') then begin
              EmployeeCommissionForm:=TEmployeeCommissionForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType);
            end else begin
              EmployeeForm:=TEmployeeForm.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow],False,True);
              //Close;
            end;
          end;
        end else begin
          if UpperCase(FormRequest)='OFFICE-CHANGE' then begin
            EmployeeForm:=TEmployeeForm.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow],False,False);
          end else if UpperCase(FormRequest)='PRINTID' then begin
            KPPPrint:=TKPPPrint.Create(Self,StrGrid.Cells[4,IntRow]);
          end else if UpperCase(FormRequest)='UPDATE-IMAGE' then begin
            EmployeeForm:=TEmployeeForm.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow],True,True,FormRequest);
          end else if UpperCase(FormRequest)='UPDATE-EMPLOYEE' then begin
            EmployeeForm:=TEmployeeForm.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow],False,False,FormRequest);
          end else if UpperCase(FormRequest)='UPDATE-MUTATION' then begin
            if (StrGrid.CellStyle[1,IntRow].Font.Color=clRed) then
              EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType,0)
            else EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType)
          end else if UpperCase(FormRequest)='UPDATE-HISTORY' then begin
            EmployeeHistoryForm:=TEmployeeHistoryForm.Create(Self,StrEmplType,StrGrid.Cells[4,IntRow],0);
          end else if UpperCase(FormRequest)='UPDATE-CONTRACT' then begin
            EmployeeContractForm:=TEmployeeContractForm.Create(Self,StrGrid.Cells[4,IntRow],StrEmplType,'','1');  //kontrak driver
          end else if UpperCase(FormRequest)='OFFICE-ATTANDANCELEAVE' then begin
            AttandanceLeaveForm.SetEmplId(StrGrid.Cells[4,IntRow]);
            Close;
          end else if UpperCase(FormRequest)='LAPORANKOMPLAINCUSTOMER' then begin
            DriverIDCustComplain:=StrGrid.Cells[4,IntRow];
            CustomerComplainRpt.Driver.Text:=StrGrid.Cells[5,IntRow];
            Close;
          end else if UpperCase(FormRequest)='HISTORYLAKALIST' then begin
            DriverIDHistoryLaka:=StrGrid.Cells[4,IntRow];
            EmployeeHistoryLakaList.Driver.Text:=StrGrid.Cells[5,IntRow];
            Close;
          end else if UpperCase(FormRequest)='LAPORANHISTORYLAKA' then begin
            DriverIDHistLakaRpt:=StrGrid.Cells[4,IntRow];
            EmployeeHistoryLakaRpt.Driver.Text:=StrGrid.Cells[5,IntRow];
            Close;
          end else if UpperCase(FormRequest)='LAPORANHISTORYTRAINING' then begin
            DriverIDHistTrainingRpt:=StrGrid.Cells[4,IntRow];
            EmplHistoryTrainingRpt.Driver.Text:=StrGrid.Cells[5,IntRow];
            Close;
          end else begin
            EmployeeForm:=TEmployeeForm.Create(nil,StrEmplType,StrGrid.Cells[4,IntRow],True,False,FormRequest);
          end

        end;
      end;
    end;
  end;
end;

procedure TEmployeeList.KolomCariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(KolomCari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 23 do
        if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(KolomCari.Text)))<>nil) then IsTrue:=True;
      if UpperCase(KolomCari.Text)='FOTO' then
        if EmployeeArr[Count][0]<>'' then IsTrue:=True;
      if UpperCase(KolomCari.Text)='KTP' then
        if EmployeeArr[Count][2]<>'' then IsTrue:=True;
      if UpperCase(KolomCari.Text)='KK' then
        if EmployeeArr[Count][3]<>'' then IsTrue:=True;

      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 23 do
            StrGrid.Cells[Count4,Count2-1]:=EmployeeArr[Count][Count4];
          if StrToInt(EmployeeArr[Count][24])>=1 then for Count4:=0 to 23 do StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clRed
          else for Count4:=0 to 23 do StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clWindowText;
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TEmployeeList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TEmployeeList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TEmployeeList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
  Initiation:=False;
end;

procedure TEmployeeList.JenisChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshList;
  end;
end;

procedure TEmployeeList.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.procedure TEmployeeList.StrGridClick(Sender: TObject);
begin
end;


