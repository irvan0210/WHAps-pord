unit VehicleEquipmentCheckU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WHUnit, Grids, ZColorStringGrid, Buttons,
  ComCtrls;

type
  TVehicleEquipmentCheck = class(TForm)
    Batal: TButton;
    Simpan: TButton;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    StrGrid: TZColorStringGrid;
    GroupHeader: TPanel;
    Vehicle: TEdit;
    PanelCari: TPanel;
    Cari: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    NoBody: TEdit;
    NoPolisi: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    GroupInput: TPanel;
    Tanggal: TDateTimePicker;
    Employee: TComboBox;
    Bersihkan: TButton;
    CheckSelect: TCheckBox;
    Details: TMemo;
    PanelTanggal: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CariTanggal: TSpeedButton;
    CheckAll: TCheckBox;
    Qty: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EquipmentChange(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure CariClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckSelectExit(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure DetailsExit(Sender: TObject);
    procedure DetailsKeyPress(Sender: TObject; var Key: Char);
    procedure CheckSelectClick(Sender: TObject);
    procedure CariTanggalClick(Sender: TObject);
    procedure CheckAllClick(Sender: TObject);
    procedure QtyKeyPress(Sender: TObject; var Key: Char);
    procedure QtyExit(Sender: TObject);
  private
    { Private declarations }
    StrVehicleEquipmentId,FormRequest,StrVehicleId:String;
    IsInput:Boolean;
    VhcEquipmentArr,VhcEquipmentDetailArr:Array of TArrString8;
    IntRow,IntCol,MinRowGrid:Integer;
    procedure Init;
    procedure InitGrid;
    procedure LoadDataGrid;
    procedure LoadDataGrid2;
    procedure RefreshGrid;
    procedure RefreshCombo;
    procedure EnableInput;
    procedure DisableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='';Vehicle_Id:String='';Is_Input:Boolean=False);Overload;
    procedure SetVehicleId(Vehicle_Id:String);
    procedure SetDates(Dates:String);
  end;

var
  VehicleEquipmentCheck: TVehicleEquipmentCheck;

implementation

uses MainU, ADODB, StrUtils, TreeMenuListU, UserLocationListU,
  VehicleListU, VehicleEquipmentCheckListListU;

{$R *.dfm}

constructor TVehicleEquipmentCheck.Create(AOwner:TComponent;Form_Request:String='';Vehicle_Id:String='';Is_Input:Boolean=False);
begin
  StrVehicleId:=Vehicle_Id;
  FormRequest:=Form_Request;
  IsInput:=Is_Input;
  Inherited Create(AOwner);
end;

procedure TVehicleEquipmentCheck.Init;
begin
  Vehicle.Text:='';
  Tanggal.Date:=Now();
  Employee.Text:='';
  NoBody.Text:='';
  NoPolisi.Text:='';
end;

procedure TVehicleEquipmentCheck.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
begin
  Employee.Text:='';
  Employee.Items.Clear;
  Employee.ItemIndex:=-1;
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT dbo.GetUsername('+QuotedStr(User)+') AS employee '+
            'UNION ALL '+
            'SELECT dbo.GetUsername(username) AS employee FROM wh_user a '+
            'LEFT JOIN wh_user_detail b ON b.user_id=a.username '+
            'LEFT JOIN wh_company_location c ON c.company_location_id=a.company_location_id '+
            'WHERE (b.department_id=17) AND (a.active=1) AND (c.location_id='+QuotedStr(LocationId)+');';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      Employee.Items.Add(Qry.FieldValues['employee']);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT dbo.GetUsername('+QuotedStr(User)+') AS employee;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      Employee.ItemIndex:=Employee.Items.IndexOf(Qry.FieldValues['employee']);
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleEquipmentCheck.EnableInput;
begin
  GroupInput.Enabled:=True;
  Simpan.Visible:=True;
end;

procedure TVehicleEquipmentCheck.DisableInput;
begin
  GroupInput.Enabled:=False;
  Simpan.Visible:=False;
end;


procedure TVehicleEquipmentCheck.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;

  if IsInput then begin
    Employee.Style:=csDropDownList;
    PanelTanggal.Visible:=False;
    RefreshCombo;
    EnableInput
  end else begin
    Employee.Style:=csSimple;
    PanelTanggal.Visible:=True;
    DisableInput;
  end;
  if StrVehicleId<>'' then begin
    SetVehicleId(StrVehicleId);
    PanelCari.Enabled:=False;
    Bersihkan.Enabled:=False;
    GroupInput.Enabled:=False; 
    LoadDataGrid;
    RefreshGrid;
    CheckAll.Checked:=false;
    CheckAllClick(Nil);
  end;
end;

procedure TVehicleEquipmentCheck.InitGrid;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=7;
  MinRowGrid:=0;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=120;
  StrGrid.ColWidths[2]:=0;
  StrGrid.ColWidths[3]:=35;
  StrGrid.ColWidths[4]:=45;
  StrGrid.ColWidths[5]:=35;
  StrGrid.ColWidths[6]:=180;
  StrGrid.Cells[0,0]:='ID';
  StrGrid.Cells[1,0]:='Name';
  StrGrid.Cells[2,0]:='Keterangan';
  StrGrid.Cells[3,0]:='Ada';
  StrGrid.Cells[4,0]:='Tdk Ada';
  StrGrid.Cells[5,0]:='Qty';
  StrGrid.Cells[6,0]:='Keterangan';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
  StrGrid.Cells[6,1]:='';
end;

procedure TVehicleEquipmentCheck.SetVehicleId(Vehicle_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Vehicle_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetVehicleDetail '+QuotedStr(Vehicle_Id)+' ;';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin
        Vehicle.Text:=Vehicle_Id;
        NoBody.Text:=Qry.FieldValues['body_id'];
        if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
        else
          NoPolisi.Text:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                              ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
    Main.M_Normal;
    InitGrid;
    if IsInput then begin
      LoadDataGrid;
      RefreshGrid;
    end;
  end;
end;

procedure TVehicleEquipmentCheck.SetDates(Dates:String);
begin
  Tanggal.Date:=StrToDate(Dates);
  LoadDataGrid2;
  RefreshGrid;
end;

procedure TVehicleEquipmentCheck.LoadDataGrid;
var Qry:TADOQuery;
    StrQry,StrSubMenuId:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(VhcEquipmentDetailArr,0);
  if Main.OpenDb then begin
    StrQry:='EXEC GetVehicleEquipmentDetailList '+QuotedStr(Vehicle.Text)+' ;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VhcEquipmentDetailArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VhcEquipmentDetailArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_detail_id'];
      VhcEquipmentDetailArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['remark']<>NULL then VhcEquipmentDetailArr[IntCount][2]:=Qry.FieldValues['remark'] else VhcEquipmentDetailArr[IntCount][2]:='';
      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TVehicleEquipmentCheck.LoadDataGrid2;
var Qry:TADOQuery;
    StrQry,StrSubMenuId,StrVehicleId,StrDate:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(VhcEquipmentDetailArr,0);
  if Main.OpenDb then begin
    StrVehicleId:=QuotedStr(Vehicle.Text);
    StrDate:=QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date));
    StrQry:='SELECT c.name,b.remark AS equipment_remark,* FROM wh_vhc_equipment_check a '+
            'LEFT JOIN wh_vhc_equipment_detail b ON b.vhc_equipment_detail_id=a.vhc_equipment_detail_id '+
            'LEFT JOIN wh_vhc_equipment c ON c.vhc_equipment_id=b.vhc_equipment_id '+
            'WHERE (a.vehicle_id='+QuotedStr(Vehicle.Text)+') AND '+
            '(CONVERT(VARCHAR(10),a.check_date,103)='+QuotedStr(FormatDateTime('dd/mm/yyyy',Tanggal.Date))+')'+
            'Order By c.priority Desc, c.name Asc;';

    StrQry:=' Exec GetVhcEquipmentDetailListDate '+StrVehicleId+','+CompanyId+','+LocationId+','+StrDate;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(VhcEquipmentDetailArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      VhcEquipmentDetailArr[IntCount][0]:=Qry.FieldValues['vhc_equipment_detail_id'];
      VhcEquipmentDetailArr[IntCount][1]:=Qry.FieldValues['name'];
      if Qry.FieldValues['equipment_remark']<>NULL then VhcEquipmentDetailArr[IntCount][2]:=Qry.FieldValues['equipment_remark'] else VhcEquipmentDetailArr[IntCount][2]:='';
      if Qry.FieldValues['status']='1' then VhcEquipmentDetailArr[IntCount][3]:='v' else VhcEquipmentDetailArr[IntCount][3]:='';
      if Qry.FieldValues['status']='0' then VhcEquipmentDetailArr[IntCount][4]:='v' else VhcEquipmentDetailArr[IntCount][4]:='';
      if (Qry.FieldValues['qty']<>NULL) and (Qry.FieldValues['qty']<>0) then VhcEquipmentDetailArr[IntCount][5]:=Qry.FieldValues['qty'] else VhcEquipmentDetailArr[IntCount][5]:='';
      if Qry.FieldValues['remark']<>NULL then VhcEquipmentDetailArr[IntCount][6]:=Qry.FieldValues['remark'] else VhcEquipmentDetailArr[IntCount][6]:='';
      if Qry.FieldValues['employee_id']<>NULL then VhcEquipmentDetailArr[IntCount][7]:=Qry.FieldValues['employee_id'] else VhcEquipmentDetailArr[IntCount][7]:='';

      Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
    StrQry:='SELECT dbo.GetUsername('+QuotedStr(VhcEquipmentDetailArr[0][6])+') AS employee;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    ShowMessage(Qry.FieldValues['employee']);
    if (Qry.RecordCount>0) then begin
      Employee.ItemIndex:=Employee.Items.IndexOf(VarToStr(Qry.FieldValues['employee']));
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  FreeAndNil(Qry);
  Main.M_Normal;
end;

procedure TVehicleEquipmentCheck.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  if Length(VhcEquipmentDetailArr)>0 then StrGrid.RowCount:=Length(VhcEquipmentDetailArr)+1;
  for IntCount:=0 to Length(VhcEquipmentDetailArr)-1 do begin
    for IntCount2:=0 to 6 do StrGrid.Cells[IntCount2,IntCount+1]:=VhcEquipmentDetailArr[IntCount][IntCount2];
    StrGrid.CellStyle[3,IntCount+1].HorizontalAlignment:=taCenter;
    StrGrid.CellStyle[4,IntCount+1].HorizontalAlignment:=taCenter;
  end;
end;

procedure TVehicleEquipmentCheck.EquipmentChange(Sender: TObject);
begin
  InitGrid;
  LoadDataGrid;
  RefreshGrid;
end;

procedure TVehicleEquipmentCheck.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrException,StrEquipmentDetailId,StrVehicleId,StrStatus,StrRemark,
    StrDate,StrEmployee,StrQty:String;
    IntActive,IntCount:Integer;
    IsOk:Boolean;
begin
  if (Trim(Employee.Text)<>'') and (Trim(Vehicle.Text)<>'')  then begin
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    StrVehicleId:=QuotedStr(Vehicle.Text);
    StrDate:=QuotedStr(FormatDateTime('yyyy-mm-dd',Tanggal.Date));
    StrEmployee:='dbo.GetUserId('+QuotedStr(Employee.Text)+')';
    if Main.OpenDb then begin
      Main.TransStart;
      for IntCount:=1 to StrGrid.RowCount-1 do begin
        if StrGrid.Cells[0,IntCount]<>'' then begin
          StrEquipmentDetailId:=QuotedStr(StrGrid.Cells[0,IntCount]);
          if StrGrid.Cells[3,IntCount]='v' then StrStatus:='1'
          else if StrGrid.Cells[4,IntCount]='v' then StrStatus:='0'
          else StrStatus:='2';

          if Trim(StrGrid.Cells[5,IntCount])='' then StrQty:='0'
          else StrQty:=Trim(StrGrid.Cells[5,IntCount]);

          if (StrGrid.Cells[6,IntCount])<>'' then  StrRemark:=QuotedStr(StrGrid.Cells[6,IntCount]) else StrRemark:='NULL';
          StrQry:='INSERT INTO wh_vhc_equipment_check (vhc_equipment_detail_id,vehicle_id,location_id,check_date,employee_id,status,qty,remark,update_time,update_user)'+
                  ' VALUES ('+StrEquipmentDetailId+','+StrVehicleId+','+LocationId+','+StrDate+','+StrEmployee+','+StrStatus+','+StrQty+','+StrRemark+
                  ',GETDATE(),'+QuotedStr(User)+');';
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,4);
          Qry.SQL.Add(StrQry);
          try
            Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menginput Check List';
              StrException:=E.Message;
            end;
          end;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        MessageBox(0,'Berhasil menyimpan CheckList','Check List Perlengkapan',MB_OK or MB_ICONINFORMATION);
        Init;
        InitGrid;
        RefreshCombo;
        Employee.SetFocus;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Check List Perlengkapan',MB_OK or MB_ICONERROR);
      end;
    end;
    FreeAndNil(Qry);
    Main.CloseDb;
  end;
end;

procedure TVehicleEquipmentCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TVehicleEquipmentCheck.BatalClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleEquipmentCheck.CariClick(Sender: TObject);
begin
  if UpperCase(FormRequest)='' then begin
    if Main.IsFormOpen('VehicleList')=False then VehicleList:=TVehicleList.Create(nil,'','VehicleEquipmentCheck')
  end else begin
    if UpperCase(FormRequest)='MAIN-CHECKLIST-INPUT' then begin
      if Main.IsFormOpen('VehicleList')=False then  VehicleList:=TVehicleList.Create(nil,'','VehicleEquipmentCheck-Input')
    end;
  end;
end;

procedure TVehicleEquipmentCheck.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  if (IsInput) then begin
    if (ARow > MinRowGrid) And (StrGrid.Cells[0,ARow]<>'')  then begin
      R := StrGrid.CellRect(ACol, ARow);
      R.Left := R.Left + StrGrid.Left;
      R.Right := R.Right + StrGrid.Left;
      R.Top := R.Top + StrGrid.Top;
      R.Bottom := R.Bottom + StrGrid.Top;
      case ACol of
        3:with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width :=17;
            Height :=17;
            if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        4:with CheckSelect do begin
            Left:=R.Left + 9;
            Top := R.Top + 1;
            Width := 17;
            Height := 17;
            if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        5:with Qty do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
        6:with Details do begin
            Left:=R.Left + 1;
            Top := R.Top + 1;
            Width := (R.Right + 1) - R.Left;
            Height := (R.Bottom + 1) - R.Top;
            Text:=StrGrid.Cells[ACol,ARow];
            Visible:= True;
            BringToFront;
            SetFocus;
          end;
      end;
    end;
  end;
end;


procedure TVehicleEquipmentCheck.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
end;

procedure TVehicleEquipmentCheck.DetailsExit(Sender: TObject);
begin
  StrGrid.Cells[6,IntRow]:=Details.Text;
  Details.Visible:=False;
  StrGrid.SetFocus;
  Details.Text:='';
end;

procedure TVehicleEquipmentCheck.DetailsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    DetailsExit(nil);
    StrGrid.Col:=1;
    StrGrid.Row:=StrGrid.Row+1;
  end;
end;

procedure TVehicleEquipmentCheck.CheckSelectClick(Sender: TObject);
begin
  if IntCol=3 then begin
    if StrGrid.Cells[4,IntRow]='v' then CheckSelect.Checked:=False;
  end;
  if IntCol=4 then begin
    if StrGrid.Cells[3,IntRow]='v' then CheckSelect.Checked:=False;
  end;
end;

procedure TVehicleEquipmentCheck.CheckSelectExit(Sender: TObject);
begin
  if CheckSelect.Checked=True then begin
    StrGrid.Cells[IntCol,IntRow]:='v';
  end else begin
    StrGrid.Cells[IntCol,IntRow]:='';
  end;
  CheckSelect.Checked:=False;
  CheckSelect.Visible:=False;
  StrGrid.SetFocus;
end;

procedure TVehicleEquipmentCheck.CariTanggalClick(Sender: TObject);
begin
  VehicleEquipmentCheckListList:=TVehicleEquipmentCheckListList.Create(self,Vehicle.Text,''); 
end;

procedure TVehicleEquipmentCheck.CheckAllClick(Sender: TObject);
var
  IntCount:Integer;
  StrMark:String[1];
begin
      if CheckAll.Checked then StrMark:='v'
      else StrMark:='';

      for IntCount:=1 to StrGrid.RowCount-1 do
        if StrGrid.Cells[0,IntCount]<>'' then StrGrid.Cells[3,IntCount]:=StrMark;

end;

procedure TVehicleEquipmentCheck.QtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    QtyExit(nil);
    StrGrid.Col:=1;
    StrGrid.Row:=StrGrid.Row+1;
  end else begin
    if not (Key in [#8, '0'..'9']) then begin
      // Discard the key
      Key := #0;
    end;
  end;
end;

procedure TVehicleEquipmentCheck.QtyExit(Sender: TObject);
begin
  StrGrid.Cells[5,IntRow]:=Qty.Text;
  Qty.Visible:=False;
  StrGrid.SetFocus;
  Qty.Text:='';
end;

end.
