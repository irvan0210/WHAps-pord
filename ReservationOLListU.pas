unit ReservationOLListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, StdCtrls, ComCtrls, Grids, ZColorStringGrid, Buttons, WHunit, ADODB, SOAPHTTPClient,
  ExtCtrls;

type
  TReservationOLList = class(TForm)
    ToXCel: TSpeedButton;
    Selesai: TButton;
    GridOrderList: TZColorStringGrid;
    GroupCompany: TGroupBox;
    All: TCheckBox;
    Label6: TLabel;
    Dates: TDateTimePicker;
    Label1: TLabel;
    DatesTo: TDateTimePicker;
    Label2: TLabel;
    Cari: TEdit;
    Button1: TButton;
    Label7: TLabel;
    PanelProgress: TPanel;
    pb1: TProgressBar;
    procedure AllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridOrderListDblClick(Sender: TObject);
    procedure GridOrderListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ToXCelClick(Sender: TObject);
  private
    { Private declarations }
    CompanyArr:Array of TArrString5;
    PesananArr:Array of TArrString14;
    IntRow,CompId,IsAll,MinRowGrid:Integer;
    FormRequest:String;
    isUpdate:Boolean;
    WebService : THTTPRIO;

    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
    function CallWebService:boolean;
    procedure InsertToReservWebOrder;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;is_update:boolean);Overload;
  end;

var
  ReservationOLList: TReservationOLList;

implementation

uses MainU, Math, ReservationOLFormU, wsserver;

{$R *.dfm}

constructor TReservationOLList.Create(AOwner:TComponent;is_update:boolean);
begin
  isUpdate:=is_update;
  Main.WriteLog('Form Open: ReservationOLList,'+BoolToStr(isUpdate),1);
  inherited Create(AOwner);
end;

procedure TReservationOLList.Init;
begin
  Cari.Text:='';
end;

procedure TReservationOLList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridOrderList.ColCount:=11;
  GridOrderList.WordWrap:=False;
  GridOrderList.ColWidths[0]:=35;
  GridOrderList.ColWidths[1]:=70;
  GridOrderList.ColWidths[2]:=120;
  GridOrderList.ColWidths[3]:=300;
  GridOrderList.ColWidths[4]:=80;
  GridOrderList.ColWidths[5]:=80;
  GridOrderList.ColWidths[6]:=250;
  GridOrderList.ColWidths[7]:=400;
  GridOrderList.ColWidths[8]:=150;
  GridOrderList.ColWidths[9]:=200;
  GridOrderList.ColWidths[10]:=100;

  GridOrderList.Cells[0,0]:='No.';
  GridOrderList.Cells[1,0]:='Tgl. Submit';
  GridOrderList.Cells[2,0]:='Nama';
  GridOrderList.Cells[3,0]:='Alamat';
  GridOrderList.Cells[4,0]:='Telepon';
  GridOrderList.Cells[5,0]:='Handphone';
  GridOrderList.Cells[6,0]:='Email';
  GridOrderList.Cells[7,0]:='Produk';
  GridOrderList.Cells[8,0]:='Tujuan';
  GridOrderList.Cells[9,0]:='Tgl. Pesanan';
  GridOrderList.Cells[10,0]:='Followup By';

  for IntCount:=0 to GridOrderList.ColCount-1 do
    GridOrderList.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridOrderList.ColCount-1 do
    GridOrderList.Cells[IntCount,1]:='';


end;

procedure TReservationOLList.RefreshData;
var StrQry,StrAllFoward,StrLocation,StrCompany:String;
    Qry:TADOQuery;
    Count,Count2,IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  SetLength(PesananArr,0);
  if Main.OpenDb then begin
    Qry.CommandTimeout:=3600;
    if All.Checked then
      StrQry:='EXEC GetCustomerOrderFromWebList @CompanyId='+Chr(39)+CompanyId+Chr(39)+';'
    else
      StrQry:='EXEC GetCustomerOrderFromWebList '+Chr(39)+FormatDateTime('yyyy-mm-dd', Dates.Date)+Chr(39)+','+Chr(39)+FormatDateTime('yyyy-mm-dd', DatesTo.Date)+Chr(39)+',@CompanyId='+Chr(39)+CompanyId+Chr(39)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(PesananArr,IntCount+1);
       PesananArr[IntCount][0]:=IntToStr(IntCount+1);
       if (Qry.FieldValues['date_submit'] <> null) then
         PesananArr[IntCount][1]:=FormatDateTime('dd/mm/yyyy', StrToDate(VarToStr(Qry.FieldValues['date_submit'])))
       else
          PesananArr[IntCount][1]:='';
       PesananArr[IntCount][2]:=VarToStr(Trim(Qry.FieldValues['customer_title']))+' '+VarToStr(Qry.FieldValues['customer_name']);
       PesananArr[IntCount][3]:=Qry.FieldValues['customer_address'];
       PesananArr[IntCount][4]:=Qry.FieldValues['customer_phone'];
       PesananArr[IntCount][5]:=Qry.FieldValues['customer_cellphone'];
       PesananArr[IntCount][6]:=Qry.FieldValues['customer_email'];
       PesananArr[IntCount][7]:=Qry.FieldValues['bus_type']+' - '+Qry.FieldValues['package'];
       PesananArr[IntCount][8]:=Qry.FieldValues['itinerary'];
       if FormatDateTime('dd/mm/yyyy', StrToDate(Qry.FieldValues['from_date']))=FormatDateTime('dd/mm/yyyy', StrToDate(Qry.FieldValues['to_date'])) then
          PesananArr[IntCount][9]:=FormatDateTime('dd/mm/yyyy', StrToDate(Qry.FieldValues['from_date']))+'('+Qry.FieldValues['standby_time']+')'
       else
          PesananArr[IntCount][9]:=FormatDateTime('dd/mm/yyyy', StrToDate(Qry.FieldValues['from_date']))+'('+Qry.FieldValues['standby_time']+'), '+FormatDateTime('dd/mm/yyyy', StrToDate(Qry.FieldValues['to_date']));
       PesananArr[IntCount][10]:=VarToStr(Qry.FieldValues['update_user']);
       PesananArr[IntCount][11]:=Qry.FieldValues['status'];
       PesananArr[IntCount][12]:=Qry.FieldValues['transaction_id'];
       Inc(IntCount);
      Qry.Next;
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;

  if Length(PesananArr)>0 then
    GridOrderList.RowCount:=Length(PesananArr)+1
  else
    GridOrderList.RowCount:=2;
  For Count:=0 to Length(PesananArr)-1 do begin
    for Count2:=0 to 11 do
      GridOrderList.Cells[Count2,Count+1]:=PesananArr[Count][Count2];
    if PesananArr[Count][11]<>'' then
      if StrToInt(PesananArr[Count][11])>=1 then for Count2:=0 to 11 do GridOrderList.CellStyle[Count2,Count+1].Font.Color:=clGreen
    else for Count2:=0 to 11 do GridOrderList.CellStyle[Count2,Count+1].Font.Color:=clWindowText;
  end;

  Main.M_Normal;
end;

procedure TReservationOLList.RefreshGrid;
var IntCount:Integer;
begin
  if Length(PesananArr)=0 then
    GridOrderList.RowCount:=2    
  else
    GridOrderList.RowCount:=Length(PesananArr)+1;
  for IntCount:=0 to Length(PesananArr)-1 do begin
    GridOrderList.Cells[0,IntCount+1]:=PesananArr[IntCount][0];
    GridOrderList.Cells[1,IntCount+1]:=PesananArr[IntCount][1];
    GridOrderList.Cells[2,IntCount+1]:=PesananArr[IntCount][2];
    GridOrderList.Cells[3,IntCount+1]:=PesananArr[IntCount][3];
    GridOrderList.Cells[4,IntCount+1]:=PesananArr[IntCount][4];
    GridOrderList.Cells[5,IntCount+1]:=PesananArr[IntCount][5];
    GridOrderList.Cells[6,IntCount+1]:=PesananArr[IntCount][6];
    GridOrderList.Cells[7,IntCount+1]:=PesananArr[IntCount][7];
    GridOrderList.Cells[8,IntCount+1]:=PesananArr[IntCount][8];
    GridOrderList.Cells[9,IntCount+1]:=PesananArr[IntCount][9];
    GridOrderList.Cells[10,IntCount+1]:=PesananArr[IntCount][10];
    //GridOrderList.Cells[8,IntCount+1]:=PesananArr[IntCount][8];
    //GridOrderList.Cells[9,IntCount+1]:=PesananArr[IntCount][9];
    //GridOrderList.Cells[10,IntCount+1]:=PesananArr[IntCount][10];
    GridOrderList.CellStyle[6,IntCount+1].WordWrap:=TRue;
    GridOrderList.CellStyle[7,IntCount+1].WordWrap:=TRue;
  end;
end;

procedure TReservationOLList.AllClick(Sender: TObject);
begin
  If All.Checked Then begin
    Dates.Enabled := false;
    DatesTo.Enabled := false;
  end else begin
    Dates.Enabled := true;
    DatesTo.Enabled := true;
  end;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TReservationOLList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TReservationOLList.FormShow(Sender: TObject);
begin
  AllClick(Nil);
  if isUpdate then begin
    if CallWebService then begin
      Main.WriteLog('Call Webservice berhasil');
    end
    else Main.WriteLog('Call Webservice gagal');
  end;
  InsertToReservWebOrder;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TReservationOLList.FormCreate(Sender: TObject);
begin
      Dates.Date := EncodeDate(YearOf(StrToDate(Main.Status.Panels.Items[0].Text)), MonthOf(StrToDate(Main.Status.Panels.Items[0].Text)), 1);
      DatesTo.Date := StrToDate(Main.Status.Panels.Items[0].Text);
end;

procedure TReservationOLList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4,Count5:Integer;
    IsTrue:Boolean;
begin
  if Trim(Cari.Text)<>'' then begin
    InitGrid;
    Count2:=1;
    for Count:=0 to Length(PesananArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 10 do
      if (StrPos(PChar(UpperCase(PesananArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridOrderList.RowCount:=Count2+1;
          for Count4:=0 to 10 do begin
            GridOrderList.Cells[Count4,Count2]:=PesananArr[Count][Count4];
          end;
          GridOrderList.CellStyle[8,Count2].WordWrap:=False;
          Inc(Count2);
      end;
    end;
  end else begin
    RefreshData;
    RefreshGrid;
  end;
end;
procedure TReservationOLList.SelesaiClick(Sender: TObject);
begin
    ReservationOLList.Close;
end;

procedure TReservationOLList.Button1Click(Sender: TObject);
begin
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TReservationOLList.GridOrderListDblClick(Sender: TObject);
begin

  if (IntRow>MinRowGrid)then
    if Main.IsFormOpen('ReservationOLForm')=False then ReservationOLForm:=TReservationOLForm.Create(nil, PesananArr[IntRow-1][12],isUpdate);

end;

procedure TReservationOLList.GridOrderListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TReservationOLList.ToXCelClick(Sender: TObject);
begin
    if ToExcel2(GridOrderList) then ShowMessage('Export ke Excel Berhasil');
end;

function TReservationOLList.CallWebService:boolean;
var
  orderdata : return_array_php;
  i, j : integer;
  Qry,Qry2:TADOQuery;
  Count:Integer;
  StrQry,StrReplace,StrTransId,StrFieldName,
  StrMaxId,StrEMessage,StrMsg,StrUrl : String;
  IsOk:Boolean;
begin

  try
      Main.M_Busy;
      WebService := THTTPRIO.Create(Self);
      //WebService.WSDLLocation := 'http://www.whitehorse.co.id/wsserver.php?wsdl';
      //WebService.WSDLLocation := 'http://localhost/webservice/live/wsserver.php?wsdl';
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      if Main.OpenDb then begin
        StrQry:='exec GetWebServiceURL';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,2);
        Qry.SQL.Add(StrQry);
        Qry.Open;
        Qry.First;
        if (Qry.RecordCount>0) then
          StrUrl:=Qry.FieldValues['url_webservice'];

        Qry.Close;
      end;
      FreeAndNil(Qry);
      Main.CloseDb;
      Main.M_Normal;
      //WebService.WSDLLocation := StrUrl;
      WebService.Port := 'PHP Web Services return arrayPort';
      WebService.Service := 'PHP Web Services return array';

      Main.WriteLog('Call Webservice : (WebService as PHP_Web_Services_return_arrayPortType).get_data('+CompanyId+')');
      orderdata :=(WebService as PHP_Web_Services_return_arrayPortType).get_data(SToInt(CompanyId));

      if high(orderdata)>0 then begin
        pb1.Position := 0;
        pb1.Max := high(orderdata);
        PanelProgress.Visible:=True;
        Application.ProcessMessages;
        Main.WriteLog('Rec Count : '+IntToStr(high(orderdata)));
        if orderdata[0].id  <> '' then
        Begin
            Qry:=TADOQuery.Create(Self);
            Qry.Connection:=Main.MyConnection;
            if Main.OpenDb then begin
                Main.TransStart;
                IsOk:=True;
                for i := 0 to high(orderdata) do begin
                        Application.ProcessMessages;
                        pb1.Position := pb1.Position+1;
                        StrFieldName := orderdata[i].FieldName;
                        StrFieldName := StringReplace(StrFieldName, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
                        if (StrFieldName='From_Date') or (StrFieldName='To_Date') then begin
                            StrReplace := StringReplace(orderdata[i].FieldValue, '.', '/', [rfReplaceAll, rfIgnoreCase]);
                            StrReplace := StringReplace(orderdata[i].FieldValue, '-', '/', [rfReplaceAll, rfIgnoreCase]);
                        end
                        else
                            StrReplace :=  orderdata[i].FieldValue;

                        StrQry:='INSERT INTO wh_form_submission_values (SubmissionValueId,FormId,SubmissionId,FieldName,FieldValue,status, DateSubmitted) '+
                              'VALUES ('+
                              QuotedStr(orderdata[i].Id)+', '+
                              QuotedStr(orderdata[i].FormId)+', '+
                              QuotedStr(orderdata[i].SubmissionId)+', '+
                              QuotedStr(StrFieldName)+', '+
                              QuotedStr(StrReplace)+', 0,'+
                              QuotedStr(orderdata[i].DateSubmitted)+
                              ') ';
                        
                        Qry.Close;
                        Qry.SQL.Clear;
                        Qry.SQL.Add(StrQry);
                        Main.WriteLog('SQL :' +StrQry,4);
                        try
                            Qry.ExecSQL;
                            try
                              Main.WriteLog('(WebService as PHP_Web_Services_return_arrayPortType).update_data('+Chr(39)+orderdata[i].Id+Chr(39)+')');
                              (WebService as PHP_Web_Services_return_arrayPortType).update_data(orderdata[i].Id);
                            except
                              on e:exception do begin
                                  IsOk:=False;
                                  StrEMessage := e.Message;
                                  Main.WriteLog('Update data that has been received was an error: '+Chr(13)+StrEMessage);
                              end;
                            end;

                        except
                          on e:exception do begin
                            IsOk:=False;
                            StrEMessage := e.Message;
                            Main.WriteLog('Error: '+StrEMessage);
                          end;
                        end;
                end;
            end;
            if IsOk then begin
              Main.TransCommit;
              //Main.WriteLog('Insert data wh_form_submission_values berhasil ');
            end
            else begin
              Main.TransRollback;
              //Main.WriteLog('Insert data wh_form_submission_values error ');
            end;

            Qry.Destroy;
            Main.CloseDb;
            Main.WriteLog('Tarik data pemesanan OnLine selesai...');
        End;
      end
      else
        Main.WriteLog('No Data',2);
      WebService.Destroy;
      PanelProgress.Visible:=False;
  Except
    On E:Exception Do begin
        WebService.Destroy;
        StrEMessage := e.Message;
        MessageBox(0, PChar('Data order from web '+Chr(13)+'Kesalahan:'+Chr(13)+StrEMessage),'Fetch Data From Webservice',MB_OK or MB_ICONERROR);
        PanelProgress.Visible:=False;
    end;
  End;
  Result := isOK;
end;

procedure TReservationOLList.InsertToReservWebOrder;
Var
  Qry,Qry2:TADOQuery;
  JumData:Integer;
  StrQry,StrReplace,StrTransId,StrFieldName,StrCompanyId,
  StrMaxId,StrEMessage,StrMsg : String;
  IsOk:Boolean;
begin

      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.Close;
			Qry.SQL.Clear;
      StrQry := 'SELECT DISTINCT SubmissionId FROM wh_form_submission_values where status=0 ORDER BY SubmissionId ';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      JumData := Qry.RecordCount;
      try
          Qry.First;
          Qry2:=TADOQuery.Create(Self);
          Qry2.Connection:=Main.MyConnection;
          if Main.OpenDb then begin
              IsOk:=True;
              Main.TransStart;
              while not (Qry.Eof) do begin
                  Application.ProcessMessages;
                  Qry2.Close;
                  Qry2.SQL.Clear;
  		      			StrQry := 'SELECT RIGHT(MAX(transaction_id),4) AS max_id FROM wh_customer_weborder WHERE transaction_id '+
	  		      						'LIKE '+Chr(39)+'ORWDC'+FormatDateTime('yy',Now)+FormatDateTime('mm', Now)+'____'+Chr(39)+';';
    		  		  	Qry2.SQL.Add(StrQry);
                  Qry2.Open;
				      		if Qry2.FieldValues['max_id']<>NULL then begin
                      StrMaxId:=Qry2.FieldValues['max_id'];
  						      	StrMaxId:=Format('%.*d',[4,StrToInt(StrMaxId)+1]);
    	  					end else
                      StrMaxId:='0001';
                  StrTransId:='ORWDC'+FormatDateTime('yy', Now)+FormatDateTime('mm', Now)+StrMaxId;
                  StrCompanyId:=CompanyId;
                  Qry2.Close;
    	  					Qry2.SQL.Clear;
		      				StrQry := ' INSERT INTO wh_customer_weborder '+
			      							' (transaction_id,company_id,customer_title,customer_name,customer_address,customer_phone,customer_cellphone,customer_email,bus_type,'+
				  	    					' seat,package,Itinerary,from_date,to_date,standby_time,pickup_point,status,update_user, date_submit) '+
					  		    			'   SELECT '+Chr(39)+StrTransId+Chr(39)+','+StrCompanyId+', Title, Full_Name, Address, Phone, Handphone, Email, Bus_Type, NULL, Use_Type as Package, '+
						  			    	'         Itinerary, '+
        		  		  			//'         Isnull(NullIf(Convert(datetime , REPLACE(From_Date, '+QuotedStr('-')+','+QuotedStr('/')+') , 103), '+QuotedStr('')+'), convert(datetime , REPLACE(To_Date, '+QuotedStr('-')+','+QuotedStr('/')+') , 103)) From_Date, '+
				    				  		'         ISNULL(NULLIF(CONVERT(DATETIME,From_Date,103), '+QuotedStr('')+'), CONVERT(DATETIME,To_Date,103) ) From_Date, '+
							    		  	'         CONVERT(DATETIME,To_Date,103) To_Date, '+
									    	  '         Standby_Time, Pickup_Point, 0, '+Chr(39)+'System'+Chr(39)+', DateSubmitted '+
      										'   FROM '+
  	    									//'   ( Select cast(fieldvalue as varchar(max)) fieldvalue, fieldname From wh_form_submission_values Where SubmissionId='+QuotedStr(VarToStr(Qry.FieldValues['SubmissionId']))+') d pivot '+
                          '   ( Select cast(a.fieldvalue as varchar(max)) fieldvalue, A.fieldname, b.DateSubmitted, b.status From wh_form_submission_values A left outer join wh_form_submission_values B on A.SubmissionValueId=B.SubmissionValueId Where A.SubmissionId='+QuotedStr(VarToStr(Qry.FieldValues['SubmissionId']))+' ) d pivot '+
	  		    							'   (  max(fieldvalue)  for fieldname in (Full_Name, Address, Phone, Handphone, Email, Bus_Type, Use_Type, Itinerary, From_Date, To_Date, Standby_Time, Pickup_Point, Submit, formId, Title)  ) piv';
		  			    	Qry2.SQL.Add(StrQry);
    			  			Main.WriteLog('SQL :' +StrQry,4);
		    		  		try
                      Qry2.ExecSQL;
                      Qry2.Close;
  	      						Qry2.SQL.Clear;
	  	      					StrQry := ' UPDATE wh_form_submission_values set status=1 WHERE SubmissionId='+QuotedStr(VarToStr(Qry.FieldValues['SubmissionId']));
                      Qry2.SQL.Add(StrQry);
                      Qry2.ExecSQL;
                  except
		  			    	  on e:exception do begin
    			  				  IsOk:=False;
		    		  				StrEMessage := e.Message;
				    	  			Main.WriteLog('Error: '+StrEMessage,4);
                    end;
                  end;
                  Qry.Next;
              end;
          end;

        except
          on e:exception do begin
              IsOk:=False;
				  		StrEMessage := e.Message;
					  	Main.WriteLog('Error: '+StrEMessage,4);
          end;
      end;

      if IsOk then begin
          Main.TransCommit;
          If JumData>0 then
            MessageBox(0, PChar('Ada '+IntToStr(JumData)+' data pesanan baru!!!'),'Fetch Data From Webservice',MB_OK or MB_ICONINFORMATION);
      end
      else begin
          Main.TransRollback;
          Main.WriteLog('Insert data wh_customer_weborder error :'+StrEMessage);
      end;
      Qry.Destroy;
      Qry2.Destroy;
      Main.CloseDb;
end;

end.
