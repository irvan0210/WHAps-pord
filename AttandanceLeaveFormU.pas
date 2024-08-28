unit AttandanceLeaveFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, QuickRpt, QRCtrls, ADODB, WHUnit,
  Grids, ComCtrls, Buttons, ppParameter, ppBands, ppReport, ppSubRpt,
  ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, Menus, ZColorStringGrid;

type
  TAttandanceLeaveForm = class(TForm)
    Selesai: TButton;
    Simpan: TButton;
    CetakUlang: TButton;
    Bersihkan: TButton;
    GroupNo: TGroupBox;
    NoCuti: TEdit;
    Label3: TLabel;
    LabelKeluhan: TLabel;
    Report: TQuickRep;
    QRBand3: TQRBand;
    GroupInput: TGroupBox;
    TanggalCutiGrid01: TStringGrid;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QNoPKB: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QNoPolisi: TQRLabel;
    QNoBody: TQRLabel;
    QNoMesin: TQRLabel;
    QTipeKendaraan: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QTanggalJamMasuk: TQRLabel;
    QTanggalJamKeluar: TQRLabel;
    QOdometer: TQRLabel;
    QShift: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRImage4: TQRImage;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRShape3: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRShape11: TQRShape;
    QRShape5: TQRShape;
    QRShape31: TQRShape;
    QDeskripsi: TQRDBText;
    QNo: TQRDBText;
    QRLabel91: TQRLabel;
    QRShape15: TQRShape;
    QRLabel92: TQRLabel;
    QRShape20: TQRShape;
    QRLabel93: TQRLabel;
    QRShape16: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape12: TQRShape;
    QRLabel89: TQRLabel;
    QRShape1: TQRShape;
    QRShape22: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape24: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape14: TQRShape;
    QRShape23: TQRShape;
    QRShape28: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRBand4: TQRBand;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    PanelCari: TPanel;
    TombolCari: TSpeedButton;
    ppReport: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLogo: TppImage;
    ppLabel387: TppLabel;
    ppNoPolisi: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppNoBody: TppLabel;
    ppNoMesin: TppLabel;
    ppOdometer: TppLabel;
    ppTglKeluar: TppLabel;
    ppTglMasuk: TppLabel;
    ppShape2: TppShape;
    ppLabel110: TppLabel;
    ppLabelDate: TppLabel;
    ppLabelUnit: TppLabel;
    ppLabelDestination: TppLabel;
    ppLabelPrice: TppLabel;
    ppLine33: TppLine;
    ppLine35: TppLine;
    ppLabel114: TppLabel;
    ppLine37: TppLine;
    ppReprinted: TppLabel;
    ppNoPKB: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppShape1: TppShape;
    ppShape6: TppShape;
    ppLabel115: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppParameterList4: TppParameterList;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppTipeKendaraan: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppJenisPekerjaan: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppKeluhan: TppMemo;
    ppParts: TppMemo;
    ppPekerjaan: TppMemo;
    ppRekomendasi: TppMemo;
    ppWaktu: TppMemo;
    ppTeknisi: TppMemo;
    ppKeterangan: TppMemo;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    employeeName: TEdit;
    ppAdminBengkel: TppLabel;
    Label2: TLabel;
    TglCutiDetail: TDateTimePicker;
    Departemen: TComboBox;
    employeeId: TEdit;
    TanggalCutiGridSebelum: TStringGrid;
    PopupMenu1: TPopupMenu;
    HapusData1: TMenuItem;
    TanggalCutiGrid: TZColorStringGrid;
    Alasan: TMemo;
    JenisTrx: TRadioGroup;
    Status: TCheckBox;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure TanggalCutiGrid01SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure KeluhanDetailExit(Sender: TObject);
    procedure KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure CetakUlangClick(Sender: TObject);
    procedure KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SimpanDetailClick(Sender: TObject);
    procedure TombolCariClick(Sender: TObject);
    procedure TglCutiDetailKeyPress(Sender: TObject; var Key: Char);
    procedure TglCutiDetailExit(Sender: TObject);
    procedure HapusData1Click(Sender: TObject);
    procedure TanggalCutiGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
  private
    { Private declarations }
    DeptArr:Array of TArrString7;

    IntRow,IntCol,CompId,MinRow:Integer;
    FormRequest,AttandanceLeaveId,EmplId:String;
    Initiation,IsReadOnly,IsInput:Boolean;
    procedure Init;
    procedure InitGrid;
    procedure RefreshCombo;

    procedure LoadData;

    procedure DisableInput;
    procedure EnableInput;
    procedure PreparePrintData;
    procedure PreparePrint;
    procedure AddDetail;
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);overload;
    constructor Create(AOwner:TComponent;AttandanceLeave_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');overload;
    procedure RePrint(No_PKB:String);

    procedure SetEmplId(empl_id:String);
    procedure SetAttLeaveId(AttLeave_Id:String);

  end;

var
  AttandanceLeaveForm: TAttandanceLeaveForm;

implementation

uses MainU, RePrintFormU, AuthorizedFormU, DateUtils,
  VehicleListU, ServiceRequestListU, WorkOrderListU, EmployeeListU;

{$R *.dfm}

constructor TAttandanceLeaveForm.Create(AOwner:TComponent;AttandanceLeave_Id:String='';IsRead_Only:Boolean=False;Form_Request:String='');
begin
  AttandanceLeaveId:=AttandanceLeave_Id;
  Initiation:=True;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: AttandanceLeaveForm='+AttandanceLeave_Id+','+Form_Request+','+BoolToStr(IsRead_Only),1);
  FormRequest:=Form_Request;
  inherited Create(AOwner);
end;

procedure TAttandanceLeaveForm.Init;
begin
  NoCuti.Text:='';
  employeeId.Text:='';
  employeeName.Text:='';
  Alasan.Text:='';
  TanggalCutiGrid.RowCount:=1;
  TanggalCutiGrid.Cells[0,0]:='';
  Departemen.ItemIndex := -1;

  TglCutiDetail.Date:=Now;
  JenisTrx.ItemIndex:=-1;

  Simpan.Enabled:=True;
  TglCutiDetail.Visible:=False;
  MinRow:=0;

end;

procedure TAttandanceLeaveForm.InitGrid;
var IntCount,IntCount2:Integer;
begin
 
end;

procedure TAttandanceLeaveForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Qry.Close;
    StrQry:='SELECT * FROM wh_department WHERE active=1 order by name ';
    Main.WriteLog('SQL :'+StrQry);
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(DeptArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      SetLength(DeptArr,IntCount+1);
      DeptArr[IntCount][0]:=Qry.FieldValues['department_id'];
      DeptArr[IntCount][1]:=Qry.FieldValues['name'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  for IntCount:=0 to Length(DeptArr)-1 do
     Departemen.Items.Add(DeptArr[IntCount][1]);
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAttandanceLeaveForm.SetEmplId(Empl_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if Empl_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='EXEC GetEmployeeDetail '+QuotedStr(Empl_Id)+' ;';
      //StrQry:='EXEC GetAttandanceLeave @isDetail=1,@AttLeaveId='+QuotedStr(empl_id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin

        employeeId.Text:=Qry.FieldValues['employee_id'];
        employeeName.Text:=Qry.FieldValues['name'];
        Departemen.ItemIndex := Departemen.Items.IndexOf(VartoStr(Qry.FieldValues['departemen']));

      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);

    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TAttandanceLeaveForm.SetAttLeaveId(AttLeave_Id:String);
var StrQry:String;
    Qry:TADOQuery;
    IntCount:Integer;
begin
  if AttLeave_Id<>'' then begin
    Main.M_Busy;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      //StrQry:='EXEC GetEmployeeDetail '+QuotedStr(Empl_Id)+' ;';
      StrQry:='EXEC GetAttandanceLeave @isDetail=1,@AttLeaveId='+QuotedStr(AttLeave_Id)+';';
      Qry.SQL.Clear;
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if (Qry.RecordCount>0) then begin

        employeeId.Text:=Qry.FieldValues['employee_id'];
        employeeName.Text:=Qry.FieldValues['name'];
        Departemen.ItemIndex := Departemen.Items.IndexOf(VartoStr(Qry.FieldValues['departemen']));
      end;
      Qry.Close;
    end;
    FreeAndNil(Qry);

    IsInput:=True;
    Main.CloseDb;
    Main.M_Normal;
  end;
end;

procedure TAttandanceLeaveForm.LoadData;
var StrQry,StrDateLeave:String;
    Qry:TADOQuery;
    IntCount,IntAddRow:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetAttandanceLeave @AttandanceLeaveId='+QuotedStr(AttandanceLeaveId)+', @isDetail=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    TanggalCutiGrid.RowCount := Qry.RecordCount;
    if Qry.RecordCount>0 then begin
      EmplId:=Qry.FieldValues['employee_id'];
      NoCuti.Text := AttandanceLeaveId;
      employeeId.Text:=Qry.FieldValues['employee_id'];
      employeeName.Text:=Qry.FieldValues['NamaKaryawan'];
      Departemen.ItemIndex := Departemen.Items.IndexOf(VartoStr(Qry.FieldValues['departemen']));
      Alasan.Text:=VarToStr(Qry.FieldValues['description']);
      JenisTrx.ItemIndex:=Qry.FieldValues['attandance_leave_type'];

      while not Qry.Eof do begin
        StrDateLeave:=FormatDateTime('DD/MM/YYYY', Qry.FieldValues['tgl_cuti']);
        TanggalCutiGrid.Cells[0, IntCount]:=StrDateLeave;
        Inc(IntCount);
        Qry.Next;
      end;

    end;
    Qry.Close;
    (*
    IntAddRow:=0;
    StrQry:='EXEC GetWorkOrderDetail '+QuotedStr(AttandanceLeaveId)+';';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      if TanggalCutiGrid.RowCount<IntCount+1 then TanggalCutiGrid.RowCount:=TanggalCutiGrid.RowCount+1;
      TanggalCutiGrid.Cells[0,IntCount]:=Qry.FieldValues['description'];
//      if TglCutiGridSebelum.RowCount<IntCount+1 then TglCutiGridSebelum.RowCount:=TglCutiGridSebelum.RowCount+1;
//      TglCutiGridSebelum.Cells[0,IntCount]:=Qry.FieldValues['description'];
      Qry.Next;
      Inc(IntCount);
    end;
    if TanggalCutiGrid.RowCount<IntCount+1 then TanggalCutiGrid.RowCount:=TanggalCutiGrid.RowCount+1;
    MinRow:=IntCount;
    Qry.Close;
    *)
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAttandanceLeaveForm.AddDetail;
begin
    if NoCuti.Text<>'' then begin
      DisableInput;
      IsInput:=True;
      Simpan.Enabled:=True;
      TanggalCutiGrid.Enabled:=True;
    end;
end;

procedure TAttandanceLeaveForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TAttandanceLeaveForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAttandanceLeaveForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  RefreshCombo;

  if AttandanceLeaveId<>'' then begin
    LoadData;

  end else begin
//StrGrid.Cells[0,IntRow]    TambahDetail.Enabled:=False;
  end;
  if IsReadOnly then begin
    DisableInput;
    IsInput:=False;
  end else IsInput:=True;

end;

procedure TAttandanceLeaveForm.TanggalCutiGrid01SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntCol:=ACol;
  IntRow:=ARow;
  if (ACol = 0) and (IntRow>=MinRow) and (IsInput) then begin
    R := TanggalCutiGrid.CellRect(IntCol, IntRow);
    R.Left := R.Left + TanggalCutiGrid.Left;
    R.Right := R.Right + TanggalCutiGrid.Left;
    R.Top := R.Top + TanggalCutiGrid.Top;
    R.Bottom := R.Bottom + TanggalCutiGrid.Top;
    with TglCutiDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(TanggalCutiGrid.Cells[IntCol,IntRow])<>'' then TglCutiDetail.Date:=StrToDate(TanggalCutiGrid.Cells[IntCol,IntRow]);
    end;
  end;

end;

procedure TAttandanceLeaveForm.KeluhanDetailExit(Sender: TObject);
begin
  if (TglCutiDetail.Date<>Null) then  TanggalCutiGrid.Cells[TanggalCutiGrid.Col,TanggalCutiGrid.Row]:=DateToStr(TglCutiDetail.Date);
  TglCutiDetail.Visible := False;
  TglCutiDetail.Date:=Null;
  TanggalCutiGrid.SetFocus;
end;

procedure TAttandanceLeaveForm.KeluhanDetailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then begin
    KeluhanDetailExit(nil);
    if TanggalCutiGrid.Row=TanggalCutiGrid.RowCount-1 then TanggalCutiGrid.RowCount:=TanggalCutiGrid.RowCount+1; 
    TanggalCutiGrid.Row:=TanggalCutiGrid.Row+1;
  end;
  if (Key=#27) then begin
    KeluhanDetailExit(nil);
  end;
end;

procedure TAttandanceLeaveForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMaxId,StrDescription,StrDateLeave,StrMsg,StrEMsg,StrTransId,StrEmplId,StrTrxType:String;
    IntCount,IntJobInEx:Integer;
    IsOk,IsCetak:Boolean;
    ADate,AMonth,AYear:Word;
    TglMulai, TglSelesai:TDateTime;
begin
  Main.M_Busy;
  if (employeeId.Text<>'') AND (Trim(TanggalCutiGrid.Cells[0,0])<>'') and (JenisTrx.ItemIndex<>-1) and (Trim(Alasan.Text)<>'') then begin
    IsOk:=True;
    IsCetak:=False;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      Main.WriteLog('Form Save:AttandanceLeaveForm',1);
      StrMsg:='';
      StrEMsg:='';

      StrEmplId:=QuotedStr(employeeId.Text);
      StrDescription := QuotedStr(Alasan.Text);
      Qry.Close;

      StrTrxType := IntToStr(JenisTrx.ItemIndex);

      if AttandanceLeaveId='' then begin

          for IntCount:=MinRow to TanggalCutiGrid.RowCount-1 do begin
            StrDateLeave:='@dateleave='+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(TanggalCutiGrid.Cells[0,IntCount])));
            StrQry:='EXEC GetAttandanceLeave @employeeid='+StrEmplId+','+StrDateLeave+' ;';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,2);
            Qry.SQL.Add(StrQry);
            Qry.Open;
            if (Qry.RecordCount>0) then begin
              employeeId.Text:=Qry.FieldValues['employee_id'];
              employeeName.Text:=Qry.FieldValues['name'];
              Departemen.ItemIndex := Departemen.Items.IndexOf(VartoStr(Qry.FieldValues['departemen']));
            end;

          end;
          Qry.SQL.Clear;
          StrQry:='SELECT RIGHT(MAX(attandance_leave_id),4) AS max_id FROM wh_attandance_leave WHERE attandance_leave_id '+
                  'LIKE '+Chr(39)+'ATT'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+'____'+Chr(39)+';';
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.FieldValues['max_id']<>NULL then begin
            StrMaxId:=Qry.FieldValues['max_id'];
            StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
          end else
            StrMaxId:='0001';
          StrTransId:='ATT'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                  FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;

          StrQry:='INSERT INTO wh_attandance_leave (attandance_leave_id, employee_id, attandance_leave_type, description, update_user)'+
                  ' VALUES ('+QuotedStr(StrTransId)+','+StrEmplId+','+StrTrxType+','+StrDescription+
                  ','+Chr(39)+User+Chr(39)+');';
      end else begin
          StrTransId:=AttandanceLeaveId;
          if Status.Checked=False then Begin
            StrQry:='UPDATE wh_attandance_leave SET '+
                    ' employee_id='+StrEmplId+
                    ',attandance_leave_type='+StrTrxType+
                    ',description='+StrDescription+
                    ',update_user='+QuotedStr(User)+
                    ' WHERE attandance_leave_id='+QuotedStr(StrTransId)+';';
            StrQry:=StrQry+' UPDATE wh_attandance_leave_detail SET '+
                    ' status=0, update_user='+QuotedStr(User)+' WHERE status=1 AND attandance_leave_id='+QuotedStr(StrTransId)+';';
          end else begin
            StrQry:=' UPDATE wh_attandance_leave SET status=0 '+
                    ' WHERE attandance_leave_id='+QuotedStr(StrTransId)+';';
            StrQry:=StrQry+' UPDATE wh_attandance_leave_detail SET '+
                    ' status=0, update_user='+QuotedStr(User)+' WHERE status=1 AND attandance_leave_id='+QuotedStr(StrTransId)+';';
            Qry.SQL.Clear;
            Main.WriteLog('SQL :'+StrQry,4);
            Qry.SQL.Add(StrQry);
            try
                  Qry.ExecSQL;
            except
                  on E:Exception do begin
                    IsOk:=False;
                    StrMsg:='Gagal Menyimpan Cuti/Ijin';
                    StrEMsg:=E.Message;
                  end;
            end;
          end;
      end;

      if Status.Checked=False then Begin
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
              Qry.ExecSQL;
        except
              on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menyimpan Cuti/Ijin';
                StrEMsg:=E.Message;
              end;
        end;
        StrQry:='';

        for IntCount:=MinRow to TanggalCutiGrid.RowCount-1 do begin
            StrDateLeave:=QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(TanggalCutiGrid.Cells[0,IntCount])));
            if Trim(TanggalCutiGrid.Cells[0,IntCount])<>'' then
              StrQry:=StrQry+' INSERT INTO wh_attandance_leave_detail (attandance_leave_id, date_leave'+
                      ',update_user)'+
                      ' VALUES ('+
                      QuotedStr(StrTransId)+
                      ','+StrDateLeave+
                      ','+QuotedStr(User)+'); ';
        end;
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
            Qry.ExecSQL;
        except
            on E:Exception do begin
              IsOk:=False;
              StrMsg:='Gagal Menyimpan Cuti/Ijin';
              StrEMsg:=E.Message;
            end;
        end;
      end;
      
      if IsOk then begin
          Main.TransCommit;
          DisableInput;
          if AttandanceLeaveId='' then begin
              NoCuti.Text:=StrTransId;
          end;
          if StrTransId<>'' then
              MessageBox(0,'Cuti/Ijin berhasil disimpan','Cuti/Ijin', MB_ICONINFORMATION);
      end else begin
            Main.TransRollback;
            MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Cuti/Ijin',MB_OK or MB_ICONERROR);
      end;
      FreeAndNil(Qry);

      Main.CloseDb;
    end;
  end else begin
    MessageBox(0,'Silahkan isi kolom data yg kosong','Cuti/Ijin',MB_OK or MB_ICONERROR);
  end;
  Main.M_Normal;
end;

procedure TAttandanceLeaveForm.DisableInput;
begin
  TanggalCutiGrid.Enabled:=False;

  Simpan.Enabled:=False;
  GroupInput.Enabled:=False;
  PanelCari.Enabled:=False;
  TglCutiDetail.Visible:=False;

end;

procedure TAttandanceLeaveForm.EnableInput;
begin
  TanggalCutiGrid.Enabled:=True;
  Simpan.Enabled:=True;

  GroupInput.Enabled:=True;
  PanelCari.Enabled:=True;
  TglCutiDetail.Visible:=True;

end;

procedure TAttandanceLeaveForm.BersihkanClick(Sender: TObject);
begin
{
  if TanggalCutiGridSebelum.Visible then begin
    TanggalCutiGrid.Height:=TanggalCutiGrid.Height+TanggalCutiGridSebelum.Height;
    TanggalCutiGrid.Top:=TanggalCutiGrid.Top-TanggalCutiGridSebelum.Height;
  end;
}
  EnableInput;
  Init;
  InitGrid;
  RefreshCombo;

end;

procedure TAttandanceLeaveForm.PreparePrintData;
var StrQry:String;
    Qry:TADOQuery;
begin
{
  QNoCuti.Caption:=NoCuti.Text;
  QTanggalJamMasuk.Caption:=FormatDateTime('dd/mm/yyyy',StartDate.Date)+' '+Jam.Text;
  QTanggalJamKeluar.Caption:='';
  QemployeeId.Caption:=employeeId.Text;
  QNoPolisi.Caption:=NoPolisi.Text;
  QOdometer.Caption:=KMOdo.Text;
  QTipeKendaraan.Caption:='';
}
  Main.M_Normal;
end;

procedure TAttandanceLeaveForm.CetakUlangClick(Sender: TObject);
begin
  if AttandanceLeaveId<>'' then RePrint(AttandanceLeaveId)
  else WorkOrderList:=TWorkOrderList.Create(self,'WorkOrder','RePrint');
end;

{
procedure TAttandanceLeaveForm.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry:String;
begin
  if No_PKB<>'' then begin
    Init;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='SELECT a.work_order_id,b.body_id,b.license_plate,b.engine_id,a.odo_in'+
            ',REPLACE(REPLACE(a.job_inex_id,1,'+Chr(39)+'Internal'+Chr(39)+'),2,'+
            Chr(39)+'Internal'+Chr(39)+') AS job_inout,CONVERT(VARCHAR(10),a.date_in,103) AS date_in'+
            ',CONVERT(VARCHAR(5),a.time_in,108) AS time_in FROM wh_work_order AS a '+
            ' LEFT JOIN wh_vehicle AS b ON b.vehicle_id=a.vehicle_id '+
            ' WHERE work_order_id='+Chr(39)+No_PKB+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(StrQry);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        QNoCuti.Caption:=Qry.FieldValues['work_order_id'];
        QTanggalJamMasuk.Caption:=Qry.FieldValues['date_in']+' '+Qry.FieldValues['time_in'];
        QemployeeId.Caption:=Qry.FieldValues['body_id'];
        QNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+
                           Copy(Qry.FieldValues['license_plate'],2,4)+' '+
                           Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1);
        Qry.FieldValues['license_plate'];
        QNoMesin.Caption:=Qry.FieldValues['engine_id'];
        QOdometer.Caption:=Qry.FieldValues['odo_in'];
        RePrintForm.ReportName:='PKB';
        RePrintForm.ReportId:=QNoCuti.Caption;
        if RePrintForm.ShowModal=1 then begin
          StrQry:='SELECT ROW_NUMBER() OVER (ORDER BY work_order_detail_id DESC) AS no'+
                  ',description FROM wh_work_order_detail'+
                  ' WHERE work_order_id='+Chr(39)+QNoCuti.Caption+Chr(39)+' AND description_id=1;';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
          if Qry.RecordCount>0 then begin
            Report.DataSet:=Qry;
            QNo.DataSet:=Qry;
            QNo.DataField:='no';
            QDeskripsi.DataSet:=Qry;
            QDeskripsi.DataField:='description';
            Report.Prepare;
            Report.Preview;
          end;
        end;
      end;
      Qry.Close;
      Main.MyConnection.Close;
    end;
  end;
end;
}

procedure TAttandanceLeaveForm.PreparePrint;
var StrQry,StrLine:String;
    Qry,Qry2:TADOQuery;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry2:=TADOQuery.Create(Self);
  Qry2.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCompanyLocation  '+CompanyId+','+LocationId+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      case Qry.FieldValues['logo'] of
        1:ppLogo.Picture:=Main.LogoWH.Picture;
        2:ppLogo.Picture:=Main.LogoWHDC.Picture;
        3:ppLogo.Picture:=Main.LogoWHET.Picture;
        4:ppLogo.Picture:=Main.LogoDT.Picture;
        5:ppLogo.Picture:=Main.LogoEUR.Picture;
        6:ppLogo.Picture:=Main.LogoGL.Picture;
        7:ppLogo.Picture:=Main.LogoCNR.Picture;
        8:ppLogo.Picture:=Main.logoDTN.Picture;
      end;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TAttandanceLeaveForm.RePrint(No_PKB:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  if No_PKB<>'' then begin
  //  Init;
    RePrintForm.ReportName:='PKB';
    RePrintForm.ReportId:=No_PKB;
    if RePrintForm.ShowModal=1 then begin
      Main.M_Busy;
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      PreparePrint;
      if Main.OpenDb then begin
        StrQry:='EXEC GetWorkOrderLists @AttandanceLeaveId='+QuotedStr(No_PKB)+';';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
(*
        if Qry.RecordCount>0 then begin
          ppNoCuti.Caption:=Qry.FieldValues['work_order_id'];
          ppTglMasuk.Caption:=Qry.FieldValues['date_in'];
          if Qry.FieldValues['time_in']<>NULL then ppTglMasuk.Caption:=ppTglMasuk.Caption+' '+Qry.FieldValues['time_in'];
          if Qry.FieldValues['date_out']<>NULL then ppTglKeluar.Caption:=Qry.FieldValues['date_out'];
          if Qry.FieldValues['time_out']<>NULL then ppTglKeluar.Caption:=ppTglKeluar.Caption+' '+Qry.FieldValues['time_out'];
          ppemployeeId.Caption:=Qry.FieldValues['body_id'];
          if IsCharAlpha(PChar(Copy(Qry.FieldValues['license_plate'],2,1))^)=False then
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,1)+' '+Copy(Qry.FieldValues['license_plate'],2,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],6,Length(Qry.FieldValues['license_plate'])+1)
          else
            ppNoPolisi.Caption:=Copy(Qry.FieldValues['license_plate'],1,2)+' '+Copy(Qry.FieldValues['license_plate'],3,4)+
                               ' '+Copy(Qry.FieldValues['license_plate'],7,Length(Qry.FieldValues['license_plate'])+1);
          ppNoMesin.Caption:=Qry.FieldValues['engine_id'];
          ppOdometer.Caption:=IToCurr(Qry.FieldValues['odo_in']);
          ppTipeKendaraan.Caption:=Qry.FieldValues['batch_name']+' '+Qry.FieldValues['brand']+' '+Qry.FieldValues['type'];
          ppJenisPekerjaan.Caption:=Qry.FieldValues['job_inout']+'-';
          if Qry.FieldValues['general_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'General,';
          if Qry.FieldValues['body_repair']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Body,';
          if Qry.FieldValues['insurance']=1 then ppJenisPekerjaan.Caption:=ppJenisPekerjaan.Caption+'Asuransi';
          ppAdminBengkel.Caption:=Qry.FieldValues['user_admin'];
          if Qry.FieldValues['remark']<>NULL then ppRekomendasi.Lines.Add(Qry.FieldValues['remark']);
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=1;';
          ppKeluhan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppKeluhan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=2;';
          ppPekerjaan.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppPekerjaan.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
          StrQry:='EXEC GetWorkOrderDetailList '+QuotedStr(No_PKB)+',@DescriptionId=3;';
          ppParts.Lines.Clear;
          Qry.SQL.Clear;
          Main.WriteLog('SQL :'+StrQry,2);
          Qry.SQL.Add(StrQry);
          Qry.Open;
          IntCount:=1;
          if Qry.RecordCount>0 then while not(Qry.Eof) do begin
            ppParts.Lines.Add(IntToStr(IntCount)+'.     '+Qry.FieldValues['description']);
            Inc(IntCount);
            Qry.Next;
          end;
          Qry.Close;
        end;
        ppReport.PreviewFormSettings.WindowState:=wsMaximized;
        ppReport.Print;
*)
      end;

      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
    end;
  end;
end;

procedure TAttandanceLeaveForm.KeluhanDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=38 then begin
    if TanggalCutiGrid.Row>0 then begin
      KeluhanDetailExit(nil);
      TanggalCutiGrid.Row:=TanggalCutiGrid.Row-1;
    end;
  end;
  if Key=40 then begin
    if  TanggalCutiGrid.Row<TanggalCutiGrid.RowCount-1 then begin
      KeluhanDetailExit(nil);
      TanggalCutiGrid.Row:=TanggalCutiGrid.Row+1;
    end;
  end
end;

procedure TAttandanceLeaveForm.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;


procedure TAttandanceLeaveForm.SimpanDetailClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrMsg,StrEMsg,StrTransId:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if TglCutiDetail.Focused=True then TglCutiDetail.OnExit(nil);
  TglCutiDetail.Visible:=True;
  if (employeeId.Text='') AND (TanggalCutiGrid.Cells[0,0]='') then
  begin
    MessageBox(0,'Silahkan isi tanggal Cuti','Buka Cuti',MB_OK or MB_ICONERROR);
    Exit;
  end;
  IsOk:=True;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    Main.TransStart;
    StrTransId:=NoCuti.Text;
    StrQry:='';
    for IntCount:=0 to TanggalCutiGrid.RowCount-1 do begin
      if Trim(TanggalCutiGrid.Cells[0,IntCount])<>'' then
        StrQry:=StrQry+' INSERT INTO wh_attandance_leave_detail (attandance_leave_id, date_leave'+
                ',update_time,update_user)'+
                ' VALUES ('+Chr(39)+StrTransId+Chr(39)+',1'+
                ','+Chr(39)+TanggalCutiGrid.Cells[0,IntCount]+Chr(39)+
                ',GETDATE(),'+Chr(39)+User+Chr(39)+'); ';
    end;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
    on E:Exception do begin
         IsOk:=False;
         StrMsg:='Gagal Menyimpan Tanggal Cuti';
         StrEMsg:=E.Message;
    end;
  end;

  if IsOk then begin
    Main.TransCommit;
//    SimpanDetail.Enabled:=False;
    DisableInput;
    MessageBox(0,'Tambahan Cuti berhasil disimpan','Buka Cuti',MB_OK or MB_ICONINFORMATION);
    Qry.Close;
  end else begin
    Main.TransRollback;
    MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan'+Chr(13)+StrEMsg),'Buka Cuti',MB_OK or MB_ICONERROR);
  end;
    Main.CloseDb;
  end;
  FreeAndNil(Qry);
  TglCutiDetail.Visible:=True;
  TglCutiDetail.Enabled:=False;
end;

procedure TAttandanceLeaveForm.TombolCariClick(Sender: TObject);
begin
  EmployeeList:=TEmployeeList.Create(Self,'Office',9,0,'Office-AttandanceLeave');
end;

procedure TAttandanceLeaveForm.TglCutiDetailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then begin
    TglCutiDetailExit(nil);
    if TanggalCutiGrid.Row=TanggalCutiGrid.RowCount-1 then TanggalCutiGrid.RowCount:=TanggalCutiGrid.RowCount+1;
    TanggalCutiGrid.Row:=TanggalCutiGrid.Row+1;
  end;
  if (Key=#27) then begin
    TglCutiDetailExit(nil);
  end;
end;

procedure TAttandanceLeaveForm.TglCutiDetailExit(Sender: TObject);
begin

  if (TglCutiDetail.date)<>null then  TanggalCutiGrid.Cells[TanggalCutiGrid.Col,TanggalCutiGrid.Row]:=DateToStr(TglCutiDetail.date);
  TglCutiDetail.Visible := False;
  TglCutiDetail.date:=now;
  TanggalCutiGrid.SetFocus;

end;

procedure TAttandanceLeaveForm.HapusData1Click(Sender: TObject);
begin
    TanggalCutiGrid.DeleteRow(IntRow);
end;

procedure TAttandanceLeaveForm.TanggalCutiGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntCol:=ACol;
  IntRow:=ARow;
  if (ACol = 0) and (IntRow>=MinRow) and (IsInput) then begin
    R := TanggalCutiGrid.CellRect(IntCol, IntRow);
    R.Left := R.Left + TanggalCutiGrid.Left;
    R.Right := R.Right + TanggalCutiGrid.Left;
    R.Top := R.Top + TanggalCutiGrid.Top;
    R.Bottom := R.Bottom + TanggalCutiGrid.Top;
    with TglCutiDetail do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      Visible:= True;
      BringToFront;
      SetFocus;
      if Trim(TanggalCutiGrid.Cells[IntCol,IntRow])<>'' then TglCutiDetail.Date:=StrToDate(TanggalCutiGrid.Cells[IntCol,IntRow]);
    end;
  end;

end;
end.
