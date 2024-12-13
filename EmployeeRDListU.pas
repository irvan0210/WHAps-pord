unit EmployeeRDListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, Buttons, WHUnit, ZColorStringGrid;

type
  TEmployeeRDList = class(TForm)
    Selesai: TButton;
    KolomCari: TEdit;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    GroupLokasi: TGroupBox;
    Label2: TLabel;
    Lokasi: TComboBox;
    LokasiDisp: TEdit;
    GroupTotal: TGroupBox;
    Label4: TLabel;
    Total: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridDblClick(Sender: TObject);
    procedure KolomCariChange(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ToXCelClick(Sender: TObject);
    procedure LokasiChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    EmployeeArr:Array of TArrString20;
    LokasiArr:Array of TArrString4;
    IntRow,IntCol:Integer;
    EmplType,StrCompanyId:Integer;
    Stat:Integer;
    Expd:Integer;
    FormRequest,FromDate,ToDate:String;
    IsMoveDriver, IsMoveHelper : Boolean;
    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='';From_Date:String='';To_Date:String='';Is_Move_Driver:Boolean=False);Overload;
    procedure RefreshList;
  end;

var
  EmployeeRDList: TEmployeeRDList;

implementation

{$R *.dfm}

Uses MainU, StrUtils, BookingFormU, OrderFormU, SPJFormBusU;

constructor TEmployeeRDList.Create(AOwner:TComponent;EmployeeType:String;Status:Integer=1;Expired:Integer=0;Form_Request:String='';From_Date:String='';To_Date:String='';Is_Move_Driver:Boolean=False);
begin
  if UpperCase(EmployeeType)='TAXI' then begin
    EmplType:=1;
    StrCompanyId:=3;
  end else if UpperCase(EmployeeType)='BUS' then begin
    EmplType:=2;
    StrCompanyId:=2;
  end else if UpperCase(EmployeeType)='BUS2' then begin
    EmplType:=4;
    StrCompanyId:=2
  end else begin
    EmplType:=3;
    StrCompanyId:=1;
  end;
  IsMoveDriver:=Is_Move_Driver;
  IsMoveHelper:=Is_Move_Driver;
  Stat:=Status;
  Expd:=Expired;
  FormRequest:=Form_Request;
  FromDate:=From_Date;
  ToDate:=To_Date;
  Inherited Create(AOwner);
end;

procedure TEmployeeRDList.Init;
var IntCount:Integer;
begin
  Case EmplType of
    1:Caption:='Data Mitra';
    2:Caption:='Data Driver';
    3:Caption:='Data Karyawan';
    4:Caption:='Data Helper';
  end;
  IntRow:=0;
  IntCol:=0;
  StrGrid.RowCount:=3;
  StrGrid.ColCount:=4;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=140;
  StrGrid.ColWidths[2]:=320;
  StrGrid.ColWidths[3]:=100;
//  StrGrid.ColWidths[4]:=80;
//  StrGrid.ColWidths[5]:=0;
//  StrGrid.ColWidths[6]:=80;
//  StrGrid.ColWidths[7]:=0;
//  StrGrid.ColWidths[8]:=80;
//  StrGrid.ColWidths[9]:=0;
  StrGrid.Cells[0,0]:='No Id';
  StrGrid.Cells[1,0]:='Nama';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='Telp/HP';
//  StrGrid.Cells[4,0]:='Order';
//  StrGrid.Cells[4,1]:='1';
//  StrGrid.Cells[6,1]:='2';
//  StrGrid.Cells[8,1]:='2';
  StrGrid.MergeCells.AddRectXY(0,0,0,1);
  StrGrid.MergeCells.AddRectXY(1,0,1,1);
  StrGrid.MergeCells.AddRectXY(2,0,2,1);
  StrGrid.MergeCells.AddRectXY(3,0,3,1);
  StrGrid.MergeCells.AddRectXY(4,0,9,0);
  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[4,0].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[4,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[6,1].HorizontalAlignment:=taCenter;
//  StrGrid.CellStyle[8,1].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGrid.ColCount-1 do
    StrGrid.Cells[IntCount,2]:='';
end;

procedure TEmployeeRDList.RefreshCombo;
var Qry:TADOQuery;
    StrQry:String;
    Count:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_location WHERE active=1';
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(LokasiArr,Qry.RecordCount+1);
    LokasiArr[0][0]:='All';
    LokasiArr[0][1]:='All';
    Count:=1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      LokasiArr[Count][0]:=Qry.FieldValues['location_id'];
      LokasiArr[Count][1]:=Qry.FieldValues['location'];
      Qry.Next;
      Inc(Count);
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  for Count:=0 to Length(LokasiArr)-1 do
    Lokasi.Items.Add(LokasiArr[Count][0]);
    Lokasi.ItemIndex:=Lokasi.Items.IndexOf(LocationId);
    LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
end;

procedure TEmployeeRDList.RefreshList;
var Count,Count2:Integer;
    QStr,StrLocation,StrStat,StrExpd,StrFromDates,StrToDates:String;
    QEmpl:TADOQuery;
    StrList,StrList2:TStringList;
begin
  Main.M_Busy;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to 16 do
    StrGrid.Cells[Count2,Count+1]:='';
  end;
  SetLength(EmployeeArr,0);
  QEmpl:=TADOQuery.Create(Self);
  QEmpl.Connection:=Main.MyConnection;
  QEmpl.CommandTimeout := 3600;
  if Main.OpenDb then begin
    if (Trim(Lokasi.Text)<>'All') then StrLocation:=','+Lokasi.Text else StrLocation:=',0';
    StrStat:=','+IntToStr(Stat);
    if Expd>0 then StrExpd:=','+IntToStr(Expd) else StrExpd:='';
    if FromDate<>'' then StrFromDates:=',@FromDate='+QuotedStr(FromDate) else StrFromDates:='';
    if ToDate<>'' then StrToDates:=',@ToDate='+QuotedStr(ToDate) else StrToDates:='';
    QStr:='EXEC GetEmployeeList '+IntToStr(EmplType)+StrLocation+StrStat+StrExpd+StrFromDates+StrToDates+',@NoPict=1,@NoHold=1,@Penjadwalan=''1'';';
    QEMpl.SQL.Add(QStr);
    QEmpl.Open;
    Count:=0;
    if (QEMpl.RecordCount>0) then while not(QEmpl.Eof) do begin
      SetLength(EmployeeArr,Count+1);
      EmployeeArr[Count][0]:=QEmpl.FieldValues['employee_id'];
      EmployeeArr[Count][1]:=QEmpl.FieldValues['name'];
      if QEmpl.FieldValues['address']<>NULL then
        EmployeeArr[Count][2]:=QEmpl.FieldValues['address'];
      if QEmpl.FieldValues['phone']<>NULL then
        EmployeeArr[Count][3]:=QEmpl.FieldValues['phone'];
//      if QEmpl.FieldValues['join_date']<>NULL then
//        StrList:=SplitStrings(QEmpl.FieldValues['order_time_resume'],'##');
//        if StrList.Strings[0]<>'' then begin
//          StrList2:=SplitStrings(StrList.Strings[0],'/');
//          EmployeeArr[Count][4]:=StrList2.Strings[0];
//          EmployeeArr[Count][5]:=StrList2.Strings[1];
//        end;
//        if StrList.Count>1 then
//          if StrList.Strings[1]<>'' then begin
//            StrList2:=SplitStrings(StrList.Strings[1],'/');
//            EmployeeArr[Count][6]:=StrList2.Strings[0];
//            EmployeeArr[Count][7]:=StrList2.Strings[1];
//          end;
//        if StrList.Count>2 then
//          if StrList.Strings[2]<>'' then begin
//            StrList2:=SplitStrings(StrList.Strings[2],'/');
//            EmployeeArr[Count][8]:=StrList2.Strings[0];
//            EmployeeArr[Count][9]:=StrList2.Strings[1];
//          end;
      QEmpl.Next;
      Inc(Count);
    end;
    QEmpl.Close;
  end;
  QEmpl.Destroy;
  Main.CloseDb;
  if Length(EmployeeArr)>0 then
    StrGrid.RowCount:=Length(EmployeeArr)+1
  else
    StrGrid.RowCount:=2;
  For Count:=0 to Length(EmployeeArr)-1 do begin
    for Count2:=0 to StrGrid.ColCount-1 do
      StrGrid.Cells[Count2,Count+2]:=EmployeeArr[Count][Count2];
  end;
  Total.Text:=IntToStr(Length(EmployeeArr));
  Main.M_Normal;
end;


procedure TEmployeeRDList.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeRDList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeRDList.StrGridDblClick(Sender: TObject);
var Str,QStr,EmpType:String;
    Qry,Qry2:TADOQuery;
    StrQry : WideString;
    Result:Integer;
    QEmp:TADOQuery;
    StrEmplType,StrEmployeeID,StrCustomerOrderID:String;
begin
  if FormRequest='' then begin
  end else begin
    Case IntCol of
      0..3:begin
             if UpperCase(FormRequest)='RESERVED-CREATE' then begin
                StrEmployeeID:= StrGrid.Cells[0,IntRow];
                Qry:=TADOQuery.Create(Self);
                Qry.Connection:=Main.MyConnection;
                Qry2:=TADOQuery.Create(Self);
                Qry2.Connection:=Main.MyConnection;
                Qry.CommandTimeout := 3600;
                Qry2.CommandTimeout := 3600;
                Main.M_Busy;
                if Main.OpenDb then begin
                  if EmplType=4 then   begin
                    StrQry:='SELECT b.customer_order_id,DATEDIFF(DAY,a.from_date,a.to_date)+1 hari '+
                          'FROM wh_reserved_order_detail a '+
                          'LEFT JOIN wh_reserved_order b ON a.reserved_order_id=b.reserved_order_id '+
                          'WHERE ('+QuotedStr(FromDate)+' BETWEEN FORMAT(a.from_date,''yyyy/MM/dd'') '+
                          'AND FORMAT(a.to_date,''yyyy/MM/dd'')) AND '+
                          '( a.employee_id3='+QuotedStr(StrEmployeeID) +') AND b.status=1 AND a.status=1;';
                  end else begin
                   StrQry:='SELECT b.customer_order_id,DATEDIFF(DAY,a.from_date,a.to_date)+1 hari '+
                          'FROM wh_reserved_order_detail a '+
                          'LEFT JOIN wh_reserved_order b ON a.reserved_order_id=b.reserved_order_id '+
                          'WHERE ('+QuotedStr(FromDate)+' BETWEEN FORMAT(a.from_date,''yyyy/MM/dd'') '+
                          'AND FORMAT(a.to_date,''yyyy/MM/dd'')) AND '+
                          '(a.employee_id='+QuotedStr(StrEmployeeID) +' OR '+
                          'a.employee_id2='+QuotedStr(StrEmployeeID) +') AND b.status=1 AND a.status=1;';
                  end;
                  Qry.Close;
                  Qry.SQL.Clear;
          //        Main.WriteLog('SQL :'+StrQry,2);
                  Qry.SQL.Add(StrQry);
                  Qry.Open;

                  StrQry:='SELECT b.employee_id FROM wh_attandance_leave_detail a '+
                          'LEFT JOIN wh_attandance_leave b ON a.attandance_leave_id=b.attandance_leave_id  '+
                          'WHERE a.status=1 AND b.status=1 AND b.status_approve=''APPROVED'' AND  '+
                          'b.employee_id='+QuotedStr(StrEmployeeID)+' AND '+
                          '(a.date_leave BETWEEN '+QuotedStr(FromDate)+' AND '+QuotedStr(ToDate)+')';
                          
                  Qry2.Close;
                  Qry2.SQL.Clear;
                  Qry2.SQL.Add(StrQry);
                  Qry2.Open;
                end;

                if (Qry2.RecordCount>0) then begin
                  if EmplType=4 then
                    MessageBox(0,PChar('Helper tidak dapat dipilih' +Chr(13)+Chr(13)+'Driver ada ijin'+Chr(13)),'Penjadwalan',MB_OK or MB_ICONWARNING)
                   else
                    MessageBox(0,PChar('Driver tidak dapat dipilih' +Chr(13)+Chr(13)+'Helper ada ijin'+Chr(13)),'Penjadwalan',MB_OK or MB_ICONWARNING);
                  Main.M_Normal;
                  Qry2.Close;
                  Exit;
                end
//        //                if (Qry.FieldValues['hari']>0) then begin
                else
                if (Qry.RecordCount>0) then begin
                  StrCustomerOrderID:= Qry.FieldValues['customer_order_id'];
                    if EmplType=4 then begin
                      MessageBox(0,PChar('Helper tidak dapat dipilih' +Chr(13)+Chr(13)+'Helper sudah ada penjadwalan di order '+StrCustomerOrderID),'Penjadwalan',MB_OK or MB_ICONWARNING);
                      Main.M_Normal;
                      if IsMoveHelper Then
                        BookingForm.SetEmp_BusBoy_Id(StrGrid.Cells[0,IntRow],True, '', True)
                      else
                        BookingForm.SetEmp_BusBoy_Id(StrGrid.Cells[0,IntRow],True);
                        Close;
                    end else begin

                      MessageBox(0,PChar('Driver tidak dapat dipilih' +Chr(13)+Chr(13)+'Driver sudah ada penjadwalan di order '+StrCustomerOrderID),'Penjadwalan',MB_OK or MB_ICONWARNING);
                      Main.M_Normal;
                      //StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+' AND form_id=''131101'' and active=1;';

                      //Qry.Close;
                      //Qry.SQL.Clear;
                      //Qry.SQL.Add(StrQry);
                      //Qry.Open;

                        //if Qry.RecordCount>0 then begin
                      if IsMoveDriver Then
                        BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],True, '', True)
                      else
                        BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],True);
                        Close;
                    //end;
                    end;
                  Qry.Close;
                  Exit;
                end else
                begin
                  if EmplType=4 then begin
                    if IsMoveHelper Then
                      BookingForm.SetEmp_BusBoy_Id(StrGrid.Cells[0,IntRow],True, '', True)
                    else
                      BookingForm.SetEmp_BusBoy_Id(StrGrid.Cells[0,IntRow],True);
                    Close;
                  end else begin
                    if IsMoveDriver Then
                      BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],True, '', True)
                    else
                      BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],True);
                    Close;
                  end;
                end;
             end;

             //end

             if UpperCase(FormRequest)='RESERVED-CREATE-CODRIVER' then begin
                StrEmployeeID:= StrGrid.Cells[0,IntRow];
                Qry:=TADOQuery.Create(Self);
                Qry.Connection:=Main.MyConnection;
                Qry.CommandTimeout := 3600;
                Main.M_Busy;
                if Main.OpenDb then begin
                  StrQry:='SELECT b.customer_order_id,DATEDIFF(DAY,a.from_date,a.to_date)+1 hari '+
                          'FROM wh_reserved_order_detail a '+
                          'LEFT JOIN wh_reserved_order b ON a.reserved_order_id=b.reserved_order_id '+
                          'WHERE ('+QuotedStr(FromDate)+' BETWEEN FORMAT(a.from_date,''yyyy/MM/dd'') '+
                          'AND FORMAT(a.to_date,''yyyy/MM/dd'')) AND '+
                          '(a.employee_id='+QuotedStr(StrEmployeeID) +' OR '+
                          'a.employee_id2='+QuotedStr(StrEmployeeID) +') AND b.status=1 AND a.status=1;';
                  Qry.Close;
                  Qry.SQL.Clear;
          //        Main.WriteLog('SQL :'+StrQry,2);
                  Qry.SQL.Add(StrQry);
                  Qry.Open
                end;
//                if (Qry.FieldValues['hari']>0) then begin

                if (Qry.RecordCount>0) then begin
                  StrCustomerOrderID:= Qry.FieldValues['customer_order_id'];
                  MessageBox(0,PChar('Driver tidak dapat dipilih' +Chr(13)+Chr(13)+'Driver sudah ada penjadwalan di order '+StrCustomerOrderID),'SJ Bus',MB_OK or MB_ICONWARNING);

                  StrQry:='SELECT * FROM wh_user_auth_form WHERE user_id='+QuotedStr(User)+' AND form_id=''131101'' and active=1;';

                  Qry.Close;
                  Qry.SQL.Clear;
                  Qry.SQL.Add(StrQry);
                  Qry.Open;
                  if Qry.RecordCount>0 then begin
                    BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],False);
                    Close;
                  end;
                  Main.M_Normal;
                  Qry.Close;
                  Exit;
                end else
                begin
                  BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],False);
                  Close;
                end;
             end;

             if FormRequest='SJ-Driver1' then begin

                StrEmployeeID:= StrGrid.Cells[0,IntRow];
                Qry:=TADOQuery.Create(Self);
                Qry.Connection:=Main.MyConnection;
                Qry.CommandTimeout := 3600;
                Main.M_Busy;
                if Main.OpenDb then begin
                  StrQry:='SELECT b.customer_order_id,DATEDIFF(DAY,a.from_date,a.to_date)+1 hari '+
                          'FROM wh_reserved_order_detail a '+
                          'LEFT JOIN wh_reserved_order b ON a.reserved_order_id=b.reserved_order_id '+
                          'WHERE ('+QuotedStr(FromDate)+' BETWEEN FORMAT(a.from_date,''yyyy/MM/dd'') '+
                          'AND FORMAT(a.to_date,''yyyy/MM/dd'')) AND '+
                          '(a.employee_id='+QuotedStr(StrEmployeeID) +' OR '+
                          'a.employee_id2='+QuotedStr(StrEmployeeID) +') AND b.status=1 AND a.status=1;';
                  Qry.Close;
                  Qry.SQL.Clear;
          //        Main.WriteLog('SQL :'+StrQry,2);
                  Qry.SQL.Add(StrQry);
                  Qry.Open
                end;
//                if (Qry.FieldValues['hari']>0) then begin

                if (Qry.RecordCount>0) then begin
                  StrCustomerOrderID:= Qry.FieldValues['customer_order_id'];
                  MessageBox(0,PChar('Driver sudah ada penjadwalan di order '+StrCustomerOrderID),'SJ Bus',MB_OK or MB_ICONWARNING);


                  with SPJFormBus do begin
                     StrDriver:=StrGrid.Cells[0,IntRow];
                     DriverDisp.Text:= StrGrid.Cells[1,IntRow];
                     TelpHP.Text:=StrGrid.Cells[3,IntRow];
                  end;
                  Main.M_Normal;
                  Close;

                end else
                begin
                  with SPJFormBus do begin
                     StrDriver:=StrGrid.Cells[0,IntRow];
                     DriverDisp.Text:= StrGrid.Cells[1,IntRow];
                     TelpHP.Text:=StrGrid.Cells[3,IntRow];
                  end;
                  Main.M_Normal;
                  Close;
                end;
             end;

           end;
      4..5:if (StrGrid.Cells[4,IntRow]<>'') and (StrGrid.Cells[5,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[5,IntRow],False);
           end;
      6..7:if (StrGrid.Cells[6,IntRow]<>'') and (StrGrid.Cells[7,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[7,IntRow],False);
           end;
      8..9:if (StrGrid.Cells[8,IntRow]<>'') and (StrGrid.Cells[9,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[9,IntRow],False);
           end;
    end;

    if UpperCase(FormRequest)='WAITINGLIST-ALLOCATE' then  begin
      Case IntCol of
        0..6:begin
                 BookingForm.SetEmployeeId(StrGrid.Cells[0,IntRow],True,StrGrid.Cells[1,IntRow]);
             end;
        7..8:if (StrGrid.Cells[7,IntRow]<>'') and (StrGrid.Cells[8,IntRow]<>'') then begin
               if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[8,IntRow],False);
             end;
        9..10:if (StrGrid.Cells[9,IntRow]<>'') and (StrGrid.Cells[10,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[10,IntRow],False);
              end;
        11..12:if (StrGrid.Cells[11,IntRow]<>'') and (StrGrid.Cells[12,IntRow]<>'') then begin
                 if Main.IsFormOpen('OrderForm')=False then OrderForm:=TOrderForm.Create(nil,StrGrid.Cells[11,IntRow],False);
              end;
      end;
      Close;
    end;

  end;
end;

procedure TEmployeeRDList.KolomCariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if Trim(KolomCari.Text)<>'' then begin
    Init;
    Count2:=2;
    for Count:=0 to Length(EmployeeArr)-1 do begin
      IsTrue:=False;
      for Count3:=1 to 3 do
        if (StrPos(PChar(UpperCase(EmployeeArr[Count][Count3])),PChar(UpperCase(KolomCari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2+1;
          for Count4:=0 to 18 do
          StrGrid.Cells[Count4,Count2]:=EmployeeArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshList;
end;

procedure TEmployeeRDList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
  IntCol:=ACol;
end;

procedure TEmployeeRDList.ToXCelClick(Sender: TObject);
begin
  if ToExcel4(StrGrid) then ShowMessage('Export ke Excel Berhasil')
  else ShowMessage('Export ke Excel Gagal');
end;

procedure TEmployeeRDList.LokasiChange(Sender: TObject);
begin
  LokasiDisp.Text:=LokasiArr[Lokasi.ItemIndex][1];
  RefreshList;
end;

procedure TEmployeeRDList.FormShow(Sender: TObject);
begin
  Init;
  RefreshCombo;
  RefreshList;
end;

end.
