unit RegistrationOLListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, ZColorStringGrid, Buttons, WHUnit,
  SOAPHTTPClient, DateUtils, ADODB;

type
  TRegistrationOLList = class(TForm)
    ToXCel: TSpeedButton;
    Label7: TLabel;
    Selesai: TButton;
    GridOrderList: TZColorStringGrid;
    GroupCompany: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    All: TCheckBox;
    Dates: TDateTimePicker;
    DatesTo: TDateTimePicker;
    Cari: TEdit;
    Button1: TButton;
    PanelProgress: TPanel;
    pb1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure GridOrderListDblClick(Sender: TObject);
    procedure GridOrderListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AllClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SelesaiClick(Sender: TObject);
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
    procedure InsertToRegistrationWeb;

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;is_update:boolean);Overload;
  end;

var
  RegistrationOLList: TRegistrationOLList;

implementation

uses MainU, wsserver_form, EmployeeFormU;

{$R *.dfm}

constructor TRegistrationOLList.Create(AOwner:TComponent;is_update:boolean);
begin
  isUpdate:=is_update;
  Main.WriteLog('Form Open: RegistrationOLList,'+BoolToStr(isUpdate),1);
  inherited Create(AOwner);
end;

procedure TRegistrationOLList.Init;
begin
  Cari.Text:='';
end;

procedure TRegistrationOLList.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  GridOrderList.ColCount:=11;
  GridOrderList.WordWrap:=False;
  GridOrderList.ColWidths[0]:=35;
  GridOrderList.ColWidths[1]:=70;
  GridOrderList.ColWidths[2]:=120;
  GridOrderList.ColWidths[3]:=100;
  GridOrderList.ColWidths[4]:=180;
  GridOrderList.ColWidths[5]:=120;
  GridOrderList.ColWidths[6]:=120;
  GridOrderList.ColWidths[7]:=180;
  GridOrderList.ColWidths[8]:=150;
  GridOrderList.ColWidths[9]:=120;
  GridOrderList.ColWidths[10]:=100;

  GridOrderList.Cells[0,0]:='No.';
  GridOrderList.Cells[1,0]:='Tgl. Input';
  GridOrderList.Cells[2,0]:='Nama';
  GridOrderList.Cells[3,0]:='Telepon';
  GridOrderList.Cells[4,0]:='Email';
  GridOrderList.Cells[5,0]:='No. KTP';
  GridOrderList.Cells[6,0]:='No. SIM';
  GridOrderList.Cells[7,0]:='Tempat/Tgl Lahir';
  GridOrderList.Cells[8,0]:='Alamat';
  GridOrderList.Cells[9,0]:='Status Tmpt Tinggal';
  GridOrderList.Cells[10,0]:='Followup By';

  for IntCount:=0 to GridOrderList.ColCount-1 do
    GridOrderList.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to GridOrderList.ColCount-1 do
    GridOrderList.Cells[IntCount,1]:='';

end;

procedure TRegistrationOLList.RefreshData;
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
      StrQry:='EXEC GetMitraFromWebList @CompanyId='+Chr(39)+CompanyId+Chr(39)+';'
    else
      StrQry:='EXEC GetMitraFromWebList '+Chr(39)+FormatDateTime('yyyy-mm-dd', Dates.Date)+Chr(39)+','+Chr(39)+FormatDateTime('yyyy-mm-dd', DatesTo.Date)+Chr(39)+',@CompanyId='+Chr(39)+CompanyId+Chr(39)+';';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
       SetLength(PesananArr,IntCount+1);
       PesananArr[IntCount][0]:=IntToStr(IntCount+1);
       if (Qry.FieldValues['last_update'] <> null) then
         PesananArr[IntCount][1]:=FormatDateTime('dd/mm/yyyy', StrToDate(VarToStr(Qry.FieldValues['last_update'])))
       else
          PesananArr[IntCount][1]:='';
       PesananArr[IntCount][2]:=VarToStr(Qry.FieldValues['name']);
       PesananArr[IntCount][3]:=Qry.FieldValues['mobilephone'];
       PesananArr[IntCount][4]:=Qry.FieldValues['email'];
       PesananArr[IntCount][5]:=Qry.FieldValues['identity_card'];
       PesananArr[IntCount][6]:=Qry.FieldValues['driver_license'];
       PesananArr[IntCount][7]:=Qry.FieldValues['place_of_birth']+', '+FormatDateTime('dd/mm/yyyy', StrToDate(VarToStr(Qry.FieldValues['date_of_birth'])));
       PesananArr[IntCount][8]:=Qry.FieldValues['address'];
       PesananArr[IntCount][9]:=Qry.FieldValues['status_of_residence'];

       PesananArr[IntCount][10]:=VarToStr(Qry.FieldValues['update_user']);
       PesananArr[IntCount][11]:=Qry.FieldValues['status'];
       PesananArr[IntCount][12]:=Qry.FieldValues['mitra_id'];
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


procedure TRegistrationOLList.RefreshGrid;
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


procedure TRegistrationOLList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRegistrationOLList.FormCreate(Sender: TObject);
begin
      Dates.Date := EncodeDate(YearOf(StrToDate(Main.Status.Panels.Items[0].Text)), MonthOf(StrToDate(Main.Status.Panels.Items[0].Text)), 1);
      DatesTo.Date := StrToDate(Main.Status.Panels.Items[0].Text);
end;

procedure TRegistrationOLList.FormShow(Sender: TObject);
begin
  AllClick(Nil);
  if isUpdate then begin
    if CallWebService then begin
      Main.WriteLog('Call Webservice berhasil');
    end
    else Main.WriteLog('Call Webservice gagal');
  end;
  InsertToRegistrationWeb;
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TRegistrationOLList.CariChange(Sender: TObject);
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

procedure TRegistrationOLList.GridOrderListDblClick(Sender: TObject);
begin
  if (IntRow>MinRowGrid)then begin
    EmployeeForm.SetMitra(PesananArr[IntRow-1][12]);
    Close;
  end;
end;

procedure TRegistrationOLList.GridOrderListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TRegistrationOLList.AllClick(Sender: TObject);
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

procedure TRegistrationOLList.Button1Click(Sender: TObject);
begin
  InitGrid;
  RefreshData;
  RefreshGrid;
end;

procedure TRegistrationOLList.SelesaiClick(Sender: TObject);
begin
    RegistrationOLList.Close;
end;


function TRegistrationOLList.CallWebService:boolean;
var
  registrationdata : return_arrayform_php;
  i, j : integer;
  Qry,Qry2:TADOQuery;
  Count:Integer;
  StrQry,StrReplace,StrCompanyId,
  StrMaxId,StrEMessage,StrMsg,StrUrl : String;

  Strexp_identity_card, Strexp_driver_license,
  Strdate_of_birth, Strlast_update : String;
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
        StrQry:='exec GetWebServiceURL @id=2';
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
      registrationdata :=(WebService as PHP_Web_Services_return_arrayPortType).get_data(SToInt(CompanyId));

      if high(registrationdata)>=0 then begin
        pb1.Position := 0;
        pb1.Max := high(registrationdata);
        PanelProgress.Visible:=True;
        Application.ProcessMessages;
        Main.WriteLog('Rec Count : '+IntToStr(high(registrationdata)));
        if registrationdata[0].mitra_id  <> '' then
        Begin
            Qry:=TADOQuery.Create(Self);
            Qry.Connection:=Main.MyConnection;
            if Main.OpenDb then begin
                Main.TransStart;
                IsOk:=True;
                for i := 0 to high(registrationdata) do begin
                        Application.ProcessMessages;
                        pb1.Position := pb1.Position+1;

                        Strexp_identity_card := StringReplace(registrationdata[i].exp_identity_card, '.', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strexp_identity_card := StringReplace(registrationdata[i].exp_identity_card, '_', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strexp_driver_license := StringReplace(registrationdata[i].exp_identity_card, '.', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strexp_driver_license := StringReplace(registrationdata[i].exp_identity_card, '_', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strdate_of_birth := StringReplace(registrationdata[i].exp_identity_card, '.', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strdate_of_birth := StringReplace(registrationdata[i].exp_identity_card, '_', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strlast_update := StringReplace(registrationdata[i].exp_identity_card, '.', '/', [rfReplaceAll, rfIgnoreCase]);
                        Strlast_update := StringReplace(registrationdata[i].exp_identity_card, '_', '/', [rfReplaceAll, rfIgnoreCase]);

                        StrCompanyId:=QuotedStr(CompanyId);
                        StrQry:='INSERT INTO wh_web_employee_temp (mitra_id,company_id,name,sex,mobilephone,imei,email,identity_card,exp_identity_card,driver_license, '+
                                'exp_driver_license,place_of_birth,date_of_birth,address,address_info,status_of_residence,phone, '+
                                'marital_status,children,isownvehicle,ownvehiclename,ownvehicleaddress,ownvehicletype, '+
                                'ownvehicleproduction,last_update,generic_id, language, basic_technique_certificate, city_knowledge_certificate, safety_driving_certificate, '+
                                'family_name, family_relation_id, family_status, family_date_of_birth, family_work, family_phone, '+
                                'relation_name, relation, relation_phone ) '+
                              'VALUES ('+
                              QuotedStr(registrationdata[i].mitra_id)+', '+StrCompanyId+', '+
                              QuotedStr(registrationdata[i].name)+', '+QuotedStr(registrationdata[i].sex)+', '+
                              QuotedStr(registrationdata[i].mobilephone)+', '+QuotedStr(registrationdata[i].imei)+', '+
                              QuotedStr(registrationdata[i].email)+', '+QuotedStr(registrationdata[i].identity_card)+', '+
                              QuotedStr(Strexp_identity_card)+', '+QuotedStr(registrationdata[i].driver_license)+', '+
                              QuotedStr(Strexp_driver_license)+', '+QuotedStr(registrationdata[i].place_of_birth)+', '+
                              QuotedStr(Strdate_of_birth)+', '+QuotedStr(registrationdata[i].address)+', '+

                              QuotedStr(registrationdata[i].address_info)+', '+QuotedStr(registrationdata[i].status_of_residence)+', '+
                              QuotedStr(registrationdata[i].phone)+', '+QuotedStr(registrationdata[i].marital_status)+', '+
                              QuotedStr(registrationdata[i].children)+', '+QuotedStr(registrationdata[i].isownvehicle)+', '+
                              QuotedStr(registrationdata[i].ownvehiclename)+', '+QuotedStr(registrationdata[i].ownvehicleaddress)+', '+
                              QuotedStr(registrationdata[i].ownvehicletype)+', '+QuotedStr(registrationdata[i].ownvehicleproduction)+', '+
                              QuotedStr(registrationdata[i].last_update)+', '+QuotedStr(registrationdata[i].generic_id)+', '+
                              QuotedStr(registrationdata[i].language)+', '+QuotedStr(registrationdata[i].basic_technique_certificate)+', '+
                              QuotedStr(registrationdata[i].city_knowledge_certificate)+', '+QuotedStr(registrationdata[i].safety_driving_certificate)+', '+

                              QuotedStr(registrationdata[i].family_name)+', '+QuotedStr(registrationdata[i].family_relation_id)+', '+
                              QuotedStr(registrationdata[i].family_status)+', '+QuotedStr(registrationdata[i].family_date_of_birth)+', '+
                              QuotedStr(registrationdata[i].family_work)+', '+QuotedStr(registrationdata[i].family_phone)+', '+
                              QuotedStr(registrationdata[i].relation_name)+', '+QuotedStr(registrationdata[i].relation)+', '+
                              QuotedStr(registrationdata[i].relation_phone)+
                              ') ';
                        
                        Qry.Close;
                        Qry.SQL.Clear;
                        Qry.SQL.Add(StrQry);
                        Main.WriteLog('SQL :' +StrQry,4);
                        try
                            Qry.ExecSQL;
                            try
                              Main.WriteLog('(WebService as PHP_Web_Services_return_arrayPortType).update_data('+Chr(39)+registrationdata[i].mitra_id+Chr(39)+')');
                              (WebService as PHP_Web_Services_return_arrayPortType).update_data(registrationdata[i].mitra_id);
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

procedure TRegistrationOLList.InsertToRegistrationWeb;
Var
  Qry,Qry2,Qry3,Qry4:TADOQuery;
  JumData:Integer;
  StrQry,StrReplace,StrTransId,StrFieldName,StrCompanyId,
  StrMaxId,StrEMessage,StrMsg : String;
  IsOk,IsOk1,IsOk2,IsOk3,IsOk4:Boolean;
begin

      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Main.MyConnection;
      Qry.Close;
			Qry.SQL.Clear;
      StrQry := 'SELECT DISTINCT mitra_id FROM wh_web_employee_temp where status=0 ORDER BY mitra_id ';
      Qry.SQL.Add(StrQry);
      Qry.Open;
      JumData := Qry.RecordCount;
      IsOk:=true;
      try
          Qry.First;
          Qry2:=TADOQuery.Create(Self);
          Qry2.Connection:=Main.MyConnection;
          if Main.OpenDb then begin
              IsOk1:=True;
              IsOk2:=True;
              IsOk3:=True;
              IsOk4:=True;
              Main.TransStart;
              while not (Qry.Eof) do begin
                  Application.ProcessMessages;
                  Qry2.Close;
                  Qry2.SQL.Clear;
                  StrCompanyId:=CompanyId;
                  Qry2.Close;
    	  					Qry2.SQL.Clear;
                  {transfer data employee}
		      				StrQry := ' insert into wh_web_employee '+
                            ' select  distinct '+
                            ' mitra_id, company_id, name, sex, mobilephone, imei, email, identity_card, exp_identity_card, driver_license, '+
                            ' exp_driver_license, place_of_birth, date_of_birth, address, address_info, status_of_residence, phone, '+
                            ' marital_status, children, isownvehicle, ownvehiclename, ownvehicleaddress, ownvehicletype, '+
                            ' ownvehicleproduction, last_update, generic_id, update_user, status, language, basic_technique_certificate, city_knowledge_certificate, safety_driving_certificate '+
                            ' from wh_web_employee_temp '+
                            ' where mitra_id='+QuotedStr(VarToStr(Qry.FieldValues['mitra_id']));
		  			    	Qry2.SQL.Add(StrQry);
    			  			Main.WriteLog('SQL :' +StrQry,4);
		    		  		try
                      Qry2.ExecSQL;
                      {Transfer Data family}
                      Qry3:=TADOQuery.Create(Self);
                      Qry3.Connection:=Main.MyConnection;
                      Application.ProcessMessages;
                      Qry3.Close;
                      Qry3.SQL.Clear;
                      StrQry := ' insert into wh_web_employee_family '+
                                ' select  distinct '+
                                ' mitra_id, family_name, family_relation_id, family_status, family_date_of_birth, family_work, family_phone '+
                                ' from wh_web_employee_temp '+
                                ' where family_relation_id<>0 and mitra_id='+QuotedStr(VarToStr(Qry.FieldValues['mitra_id']));
    		  			    	Qry3.SQL.Add(StrQry);
    			  			    Main.WriteLog('SQL :' +StrQry,4);
                      try
                          Qry3.ExecSQL;
                          Application.ProcessMessages;
                          Qry3.Close;
                          Qry3.SQL.Clear;
                          {transfer data relation}
                          StrQry := ' insert into wh_web_employee_relation '+
                                    ' select  distinct '+
                                    ' mitra_id, relation_name, relation, relation_phone '+
                                    ' from wh_web_employee_temp '+
                                    ' where mitra_id='+QuotedStr(VarToStr(Qry.FieldValues['mitra_id']));
        		  			    	Qry3.SQL.Add(StrQry);
        			  			    Main.WriteLog('SQL :' +StrQry,4);
                          try
                              Qry3.ExecSQL;
                              Qry3.Close;
  	              						Qry3.SQL.Clear;
        	  	      					StrQry := ' UPDATE wh_web_employee_temp set status=1 WHERE mitra_id='+QuotedStr(VarToStr(Qry.FieldValues['mitra_id']));
                              Qry3.SQL.Add(StrQry);
                              Qry3.ExecSQL;
                              Qry3.Destroy;
                              except
  		  			        	      on e:exception do begin
              			  				  IsOk4:=False;
		              		  				StrEMessage := e.Message;
			      	        	  			Main.WriteLog('Error: '+StrEMessage,4);
                              end;
                          end;

                          except
  		  			        	  on e:exception do begin
          			  				  IsOk3:=False;
		          		  				StrEMessage := e.Message;
			  	        	  			Main.WriteLog('Error: '+StrEMessage,4);
                          end;
                      end;

                      except
		  			        	  on e:exception do begin
        			  				  IsOk2:=False;
		        		  				StrEMessage := e.Message;
				        	  			Main.WriteLog('Error: '+StrEMessage,4);
                      end;
                  end;
                  Qry.Next;
              end;
          end;

        except
          on e:exception do begin
              IsOk1:=False;
				  		StrEMessage := e.Message;
					  	Main.WriteLog('Error: '+StrEMessage,4);
          end;
      end;

      if IsOk1 and IsOk2  and IsOk3 and IsOk4 then begin
          Main.TransCommit;
          If JumData>0 then
            MessageBox(0, PChar('Ada '+IntToStr(JumData)+' data Mitra baru!!!'),'Fetch Data From Webservice',MB_OK or MB_ICONINFORMATION);
      end
      else begin
          Main.TransRollback;
          Main.WriteLog('Insert data wh_web_employee error :'+StrEMessage);
      end;
      Qry.Destroy;
      Qry2.Destroy;

      Main.CloseDb;
end;

{
procedure TRegistrationOLList.SebarData;
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
      StrQry := 'SELECT DISTINCT mitra_id FROM wh_web_employee where status=0 ORDER BY mitra_id ';
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
}
end.
