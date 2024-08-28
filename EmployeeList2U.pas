unit EmployeeList2U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, Buttons, WHUnit, ZColorStringGrid,
  ExtCtrls;

type
  TEmployeeList2 = class(TForm)
    Selesai: TButton;
    KolomCari: TEdit;
    Label1: TLabel;
    ToXCel: TSpeedButton;
    StrGrid: TZColorStringGrid;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TEdit;
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
  private
    { Private declarations }
    FormRequest:String;
    EmployeeArr:Array of TArrString20;
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
    constructor Create(AOwner:TComponent;Status:Integer=1;Expired:Integer=0;Form_Request:String='');Overload;
    procedure RefreshList;
  end;

var
  EmployeeList2: TEmployeeList2;

implementation

{$R *.dfm}

Uses MainU, StrUtils, EmployeeForm2U, MutasiKaryawanFormU,
  EmployeeIDRenewalU, KPPPrintU, EmployeeRenewalFormU, ReferensiMitraListU,
  EmployeeHistoryFormU, EmployeeCommissionFormU;

constructor TEmployeeList2.Create(AOwner:TComponent;Status:Integer=1;Expired:Integer=0;Form_Request:String='');
begin
  EmplType:=2;
  Stat:=Status;
  Expd:=Expired;
  Initiation:=True;
  FormRequest:=Form_Request;
  Inherited Create(AOwner);
end;

procedure TEmployeeList2.Init;
var IntCount:Integer;
begin
  IntMinRow:=1;
  StrGrid.ColWidths[1]:=12;
  StrGrid.ColWidths[8]:=0;
  StrGrid.ColWidths[9]:=130;
  StrGrid.ColWidths[10]:=80;
  StrGrid.ColWidths[14]:=0;
  StrGrid.ColWidths[15]:=0;
  StrGrid.ColWidths[16]:=0;
  StrGrid.ColWidths[17]:=0;
  StrGrid.Cells[1,0]:='S';
  StrGrid.Cells[2,0]:='NIP';
  StrGrid.Cells[8,0]:='';
  StrGrid.Cells[9,0]:='No SIM';
  StrGrid.Cells[10,0]:='SIM Berakhir';
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=12;
  StrGrid.ColWidths[2]:=68;
  StrGrid.ColWidths[3]:=140;
  StrGrid.ColWidths[4]:=130;
  StrGrid.ColWidths[5]:=280;
  StrGrid.ColWidths[6]:=100;
  StrGrid.ColWidths[11]:=55;
  StrGrid.ColWidths[12]:=45;
  StrGrid.ColWidths[13]:=40;
  StrGrid.ColWidths[18]:=0;
  StrGrid.Cells[0,0]:='F';
  StrGrid.Cells[3,0]:='Nama';
  StrGrid.Cells[4,0]:='Tempat/Tgl Lahir';
  StrGrid.Cells[5,0]:='Alamat';
  StrGrid.Cells[6,0]:='Telp/HP';
  StrGrid.Cells[7,0]:='Tgl Masuk';
  StrGrid.Cells[11,0]:='Pendidikan';
  StrGrid.Cells[12,0]:='Agama';
  StrGrid.Cells[13,0]:='Status';
  for IntCount:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to 18 do
    StrGrid.Cells[IntCount,1]:='';
  if StrToInt(CompanyId)=1 then SBU.Enabled:=True else SBU.Enabled:=False;
end;

procedure TEmployeeList2.RefreshCombo;
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

procedure TEmployeeList2.RefreshList;
var Count,Count2:Integer;
    StrQry,StrLocationId,StrStat,StrExpd:String;
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
    StrQry:='EXEC GetEmployeeList 2'+StrLocationId+StrStat+StrExpd+';';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    Count:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      SetLength(EmployeeArr,Count+1);
      EmployeeArr[Count][0]:=Qry.FieldValues['photo_image'];
      EmployeeArr[Count][1]:=Qry.FieldValues['license_image'];
      EmployeeArr[Count][2]:=Qry.FieldValues['employee_id'];
      EmployeeArr[Count][3]:=Qry.FieldValues['name'];
      if Qry.FieldValues['birth']<>NULL then
        EmployeeArr[Count][4]:=Qry.FieldValues['birth'];
      if Qry.FieldValues['address']<>NULL then
        EmployeeArr[Count][5]:=Qry.FieldValues['address'];
      if Qry.FieldValues['phone']<>NULL then
        EmployeeArr[Count][6]:=Qry.FieldValues['phone'];
      if Qry.FieldValues['join_date']<>NULL then
        EmployeeArr[Count][7]:=Qry.FieldValues['join_date'];
      if Qry.FieldValues['kpp_expired']<>NULL then
        EmployeeArr[Count][8]:=Qry.FieldValues['kpp_expired'];
      if Qry.FieldValues['license_id']<>NULL then
        EmployeeArr[Count][9]:=Qry.FieldValues['license_id'];
      if Qry.FieldValues['license_expired']<>NULL then
        EmployeeArr[Count][10]:=Qry.FieldValues['license_expired'];
      if Qry.FieldValues['education']<>NULL then
        EmployeeArr[Count][11]:=Qry.FieldValues['education'];
      if Qry.FieldValues['religion']<>NULL then
        EmployeeArr[Count][12]:=Qry.FieldValues['religion'];
      if Qry.FieldValues['marital_status']<>NULL then
        if Qry.FieldValues['children']<>NULL then
          EmployeeArr[Count][13]:=Qry.FieldValues['marital_status']+'-'+IntToStr(Qry.FieldValues['children'])
        else
          EmployeeArr[Count][13]:=Qry.FieldValues['marital_status'];
      if EmplType=1 then begin
        if Qry.FieldValues['old_id_reference']<>NULL then
          EmployeeArr[Count][14]:=Qry.FieldValues['old_id_reference'];
        if Qry.FieldValues['reguler'] then EmployeeArr[Count][15]:='Reguler' else EmployeeArr[Count][15]:='Eksekutif' ;
        if Qry.FieldValues['reference']<>NULL then
          EmployeeArr[Count][16]:=Qry.FieldValues['reference'];
        if Qry.FieldValues['reference_name']<>NULL then
          EmployeeArr[Count][17]:=Qry.FieldValues['reference_name'];
      end;
      if Qry.FieldValues['bad_flag']<>NULL then
        EmployeeArr[Count][19]:=Qry.FieldValues['bad_flag'] else EmployeeArr[Count][19]:='0';
      EmployeeArr[Count][18]:=Qry.FieldValues['active'];
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
    for Count2:=0 to 18 do
      StrGrid.Cells[Count2,Count+1]:=EmployeeArr[Count][Count2];
    if EmployeeArr[Count][19]<>'' then
      if StrToInt(EmployeeArr[Count][19])>=1 then for Count2:=0 to 18 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clRed
    else for Count2:=0 to 18 do StrGrid.CellStyle[Count2,Count+1].Font.Color:=clWindowText;
  end;
  Total.Text:=IntToStr(Length(EmployeeArr));
  Main.M_Normal;
end;


procedure TEmployeeList2.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeList2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeList2.StrGridDblClick(Sender: TObject);
var Str,QStr,EmpType:String;
    Result:Integer;
    QEmp:TADOQuery;
    StrEmplType:String;
begin
  if IntRow>=IntMinRow then begin
    if FormRequest='' then begin
      EmployeeForm2:=TEmployeeForm2.Create(Self,StrGrid.Cells[2,IntRow],False,'',True);
    end else begin
      if UpperCase(FormRequest)='MAIN-UPDATE' then begin
         if Main.IsFormOpen('EmployeeForm2')=False then EmployeeForm2:=TEmployeeForm2.Create(Self,StrGrid.Cells[2,IntRow],False,'',False);
      end else
        if Main.IsFormOpen('EmployeeForm2')=False then EmployeeForm2:=TEmployeeForm2.Create(Self,StrGrid.Cells[2,IntRow],True,'',True);
    end;
{    if Main.IsFormOpen('EmployeeForm')=False then begin
              0: if (StrGrid.Cells[11,IntRow]<>'') and (Main.IsFormOpen('ReferensiMitraList')=False) then ReferensiMitraList:=TReferensiMitraList.Create(Self,'Taxi',StrGrid.Cells[16,IntRow],StrGrid.Cells[17,IntRow],1);
            end;
          end else begin
            if (RightStr(IntToStr(TreeTag),2)='02') then begin
              EmployeeForm2:=TEmployeeForm2.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='03') then begin
              if IntRow>0 then begin
                Str:=EmpType+StrGrid.Cells[3,IntRow]+'('+StrGrid.Cells[4,IntRow]+') akan dihapus?';
                Result:=MessageBox(0,PChar(Str),'Delete User',MB_OKCANCEL or MB_ICONQUESTION);
                if Result=1 then begin
                    Main.M_Busy;
                    if Main.OpenDb then begin
                      QEmp:=TADOQuery.Create(Self);
                      QEmp.Connection:=Main.MyConnection;
                      QStr:='DELETE FROM wh_empl_mutation WHERE employee_id='+Chr(39)+StrGrid.Cells[2,IntRow]+Chr(39)+';'+
                            'DELETE FROM wh_empl_detail WHERE employee_id='+Chr(39)+StrGrid.Cells[2,IntRow]+Chr(39)+';'+
                            'DELETE FROM wh_employee WHERE employee_id='+Chr(39)+StrGrid.Cells[2,IntRow]+Chr(39)+';';
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
              if (StrGrid.CellStyle[1,IntRow].Font.Color<>clRed) or (StrGrid.Cells[18,IntRow]='1') or (StrGrid.Cells[18,IntRow]='2') then begin
                if StrGrid.Cells[18,IntRow]='0' then begin
                  EmployeeIdRenewal:=TEmployeeIdRenewal.Create(Self,StrGrid.Cells[2,IntRow],StrEmplType);
                end else begin
                  if (StrGrid.CellStyle[1,IntRow].Font.Color=clRed) then EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[2,IntRow],StrEmplType,0)
                  else EmployeeMutationForm:=TEmployeeMutationForm.Create(Self,StrGrid.Cells[2,IntRow],StrEmplType)
                end;
              end else MessageBox(0,PChar('Mitra Bermasalah Silahkan Otorisasi'),'Mutasi Karyawan/Mitra',MB_OK or MB_ICONERROR);
            end else if (RightStr(IntToStr(TreeTag),2)='05')  then begin
              EmployeeForm2:=TEmployeeForm2.Create(nil,StrEmplType,StrGrid.Cells[2,IntRow]);
              Close;
            end else if (RightStr(IntToStr(TreeTag),2)='09') then begin
              if EmpType='1' then
                EmployeeIdRenewal:=TEmployeeIdRenewal.Create(nil,StrEmplType,StrGrid.Cells[2,IntRow])
              else
                EmployeeHistoryForm:=TEmployeeHistoryForm.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='07') then begin
              KPPPrint:=TKPPPrint.Create(Self,StrGrid.Cells[2,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='10') then begin
              EmployeeRenewalForm:=TEmployeeRenewalForm.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='15') then begin
              EmployeeHistoryForm:=TEmployeeHistoryForm.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow]);
            end else if (RightStr(IntToStr(TreeTag),2)='20') then begin
              EmployeeCommissionForm:=TEmployeeCommissionForm.Create(Self,StrGrid.Cells[2,IntRow],StrEmplType);
            end else begin
              EmployeeForm2:=TEmployeeForm2.Create(nil,StrEmplType,StrGrid.Cells[2,IntRow],True);
              Close;
            end;
          end;
        end else begin
          if UpperCase(FormRequest)='OFFICE-CHANGE' then begin
            EmployeeForm2:=TEmployeeForm2.Create(Self,StrEmplType,StrGrid.Cells[2,IntRow],False,False);
          end;
          if UpperCase(FormRequest)='PRINTID' then begin
            KPPPrint:=TKPPPrint.Create(Self,StrGrid.Cells[2,IntRow]);
          end;
        end;
      end;
    end;
    }
  end;
end;

procedure TEmployeeList2.KolomCariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(KolomCari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=2 to 16 do
        if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(KolomCari.Text)))<>nil) then IsTrue:=True;
      if UpperCase(KolomCari.Text)='FOTO' then
        if EmployeeArr[Count][0]<>'' then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 18 do
            StrGrid.Cells[Count4,Count2-1]:=EmployeeArr[Count][Count4];
          if StrToInt(EmployeeArr[Count][19])>=1 then for Count4:=0 to 18 do StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clRed
          else for Count4:=0 to 18 do StrGrid.CellStyle[Count4,Count2-1].Font.Color:=clWindowText;
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TEmployeeList2.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TEmployeeList2.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TEmployeeList2.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
  Initiation:=False;
end;

procedure TEmployeeList2.JenisChange(Sender: TObject);
begin
  if not(Initiation) then begin
    RefreshList;
  end;
end;

procedure TEmployeeList2.SBUChange(Sender: TObject);
begin
  RefreshList;
end;

end.
