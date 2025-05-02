unit EmployeeHistoryTrainingFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ZColorStringGrid, ComCtrls, Mask, ExtCtrls, WHUnit, ADODB;

type
  TEmployeeHistoryTrainingForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Materi: TEdit;
    Lokasi: TEdit;
    Trainer: TEdit;
    Jam: TMaskEdit;
    Tgl: TDateTimePicker;
    GroupOrder: TGroupBox;
    Label6: TLabel;
    Simpan: TButton;
    Bersihkan: TButton;
    TambahPeserta: TButton;
    Selesai: TButton;
    GroupTotal: TGroupBox;
    Label7: TLabel;
    Total: TMemo;
    StrGridPeserta: TZColorStringGrid;
    RadType: TRadioGroup;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    JamSelesai: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    Note: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Duration: TEdit;
    Button1: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TambahPesertaClick(Sender: TObject);
    procedure StrGridPesertaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure StrGridPesertaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BersihkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure LokasiKeyPress(Sender: TObject; var Key: Char);
    procedure MateriKeyPress(Sender: TObject; var Key: Char);
    procedure JamKeyPress(Sender: TObject; var Key: Char);
    procedure JamSelesaiKeyPress(Sender: TObject; var Key: Char);
    procedure JamExit(Sender: TObject);
    procedure JamSelesaiExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    IntRow,MinRowGrid,IntRowCount: Integer;
    procedure InitGrid;
    procedure Init;
    procedure LoadData;
//    procedure Save;
  public
    { Public declarations }
     constructor Create(AOwner:TComponent;Empl_HistoryTrainingID,Form_Req:String;EmplType:String);Overload;
  end;

var
  EmployeeHistoryTrainingForm: TEmployeeHistoryTrainingForm;
  EmplId,EmplHistoryID,EmplHistoryTrainingID,FormReq,Role,MateriTrainingID:string;

implementation

uses
  MainU, EmployeeListU, BrowseEmployeeU, EmployeeHistoryLakaRptU, 
  EmployeeHistoryTrainingListU, MateriTrainingListU;

{$R *.dfm}
constructor TEmployeeHistoryTrainingForm.Create(AOwner:TComponent;Empl_HistoryTrainingID,Form_Req:String;EmplType:String);
begin
  if Empl_HistoryTrainingID<>'' then EmplHistoryTrainingID:=Empl_HistoryTrainingID else EmplHistoryTrainingID:='';
  if Form_Req<>'' then FormReq:=Form_Req;
  if EmplType<>'' then Role:=EmplType;
  inherited Create(AOwner);
end;

procedure TEmployeeHistoryTrainingForm.LoadData;
var
  StrQry,EmplName,EmplID:string;
  Qry:TADOQuery;
  No,IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  if Main.OpenDb then begin

    StrQry:='SELECT a.employee_id,b.name FROM wh_empl_history_training_detail a '+
            'LEFT JOIN wh_employee b on a.employee_id=b.employee_id WHERE '+
            'empl_history_training_id ='+EmplHistoryTrainingID+' '+
            'ORDER BY b.name DESC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;

    No:=0;
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
        No:=No+1;
        IntRowCount:=StrGridPeserta.RowCount+1;
        StrGridPeserta.RowCount:=IntRowCount;

        StrGridPeserta.Cells[0,StrGridPeserta.RowCount-1]:=Qry.FieldValues['employee_id'];
        StrGridPeserta.Cells[1,StrGridPeserta.RowCount-1]:=Qry.FieldValues['name'];;
        Qry.Next;
    end;
    Total.Text:=IntToStr(No);

    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TEmployeeHistoryTrainingForm.Init;
var IntCount:Integer;
begin
  if Role='DRIVER' then
  Caption:='Driver Training Form'
  else
  Caption:='Co-Driver Training Form';

  Tgl.Date:=Now();
  Materi.Text:='';
  Trainer.Text:='';
  Lokasi.Text:='';
  Jam.Text:='00:00';
  JamSelesai.Text:='00:00';
  Duration.Text:='';
  Total.Text:='0';
  RadType.ItemIndex:=0;
  Note.Text:='';
  Lokasi.SetFocus;
  if FormReq='EMPLOYEEHISTORYTRAINING-FORM' then
    Simpan.Enabled:=True
  else
    Simpan.Enabled:=False;
end;

procedure TEmployeeHistoryTrainingForm.InitGrid;
var IntCount:Integer;
begin
  MinRowGrid:=0;
  StrGridPeserta.RowCount:=1;
  StrGridPeserta.ColCount:=2;
  StrGridPeserta.WordWrap:=False;
  StrGridPeserta.ColWidths[0]:=0;
  StrGridPeserta.ColWidths[1]:=450;

  StrGridPeserta.Cells[0,0]:='';
  StrGridPeserta.Cells[1,0]:='Nama Peserta';

  for IntCount:=0 to StrGridPeserta.ColCount-1 do
    StrGridPeserta.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
  for IntCount:=0 to StrGridPeserta.ColCount-1 do
    StrGridPeserta.Cells[IntCount,1]:='';
end;

procedure TEmployeeHistoryTrainingForm.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TEmployeeHistoryTrainingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TEmployeeHistoryTrainingForm.TambahPesertaClick(Sender: TObject);
begin
  if Role='DRIVER' then
  begin
    if Main.IsFormOpen('BrowseEmployee')=False then BrowseEmployee:=TBrowseEmployee.Create(Self,'Bus',1,0,'Create-Training');
  end else
  begin
    if Main.IsFormOpen('BrowseEmployee')=False then BrowseEmployee:=TBrowseEmployee.Create(Self,'Bus2',1,0,'Create-Training');
  end;

end;

procedure DeleteRow(Grid: TZColorStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;
end;

procedure TEmployeeHistoryTrainingForm.StrGridPesertaSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TEmployeeHistoryTrainingForm.FormShow(Sender: TObject);
begin
  Init;
  InitGrid;
  if EmplHistoryTrainingID<>'' then
  begin
    Simpan.Enabled:=True;
    LoadData;
  end;
end;

procedure TEmployeeHistoryTrainingForm.StrGridPesertaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if IntRow>0 then begin
    if Key=VK_DELETE then begin
      if MessageBox(Handle,PChar('Mau Menghapus '+QuotedStr(StrGridPeserta.Cells[1,IntRow])+' ?'),'Training Form',MB_OKCANCEL or MB_ICONQUESTION or MB_SYSTEMMODAL or MB_SETFOREGROUND)=1 then begin
        DeleteRow(StrGridPeserta,IntRow);
        Total.Text:=IntToStr(StrGridPeserta.RowCount-1);
        MessageBox(0,PChar('Peserta berhasil dihapus.'),'Peserta Dipilih',MB_OK or MB_ICONINFORMATION);
      end;
    end;
  end;
end;

procedure TEmployeeHistoryTrainingForm.BersihkanClick(Sender: TObject);
begin
  Init;
  InitGrid;
end;

procedure TEmployeeHistoryTrainingForm.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrEMsg,StrType,StrQry,StrQry2:string;
    IntTypeID,IntCount:Integer;
    IsOk:Boolean;
begin
  if RadType.ItemIndex=1 then begin
    StrType:='Eksternal';
    IntTypeID:=6;
  end else begin
    StrType:='Internal';
    IntTypeID:=5;
  end;
  if (Trim(Materi.Text)<>'') AND (Trim(Lokasi.Text)<>'') AND (Trainer.Text<>'') AND (Jam.Text<>'  :  ') AND (JamSelesai.Text<>'  :  ') AND (StrGridPeserta.RowCount>1) then begin
    Main.M_Busy;
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    if Main.OpenDb then begin
      Main.TransStart;
      if FormReq='EMPLOYEEHISTORYTRAINING-FORM' then
      begin

        StrQry2:= 'INSERT INTO wh_empl_history_training (date,location,time'+
                  ',materi_training_id,trainer,type,create_date, create_user,update_user,status,role,finish_time,note) VALUES ('+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+
                   QuotedStr(Lokasi.Text)+','+QuotedStr(Jam.Text)+
                   ','+(MateriTrainingID)+
                  ','+QuotedStr(Trainer.Text)+','+QuotedStr(StrType)+
                  ','+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+
                  ','+QuotedStr(User)+','+QuotedStr(User)+',1,'+QuotedStr(Role)+','+QuotedStr(JamSelesai.Text)+','+QuotedStr(Note.Text)+');';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry2);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;

        if IsOk=True then
        begin
          StrQry:='SELECT TOP 1 empl_history_training_id FROM wh_empl_history_training order by empl_history_training_id DESC';
          Qry.SQL.Clear;
          Qry.SQL.Add(StrQry);
          Qry.Open;
        end;
        if Qry.RecordCount>0 then begin
           EmplHistoryTrainingID:=Qry.FieldValues['empl_history_training_id'];
        end;
        for IntCount:=1 to StrGridPeserta.RowCount-1 do begin
          EmplId:= StrGridPeserta.Cells[0,IntCount];
          if Trim(EmplId)<>'' then begin
            StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,'+
                    'location_id,from_date,to_date,detail,update_user)VALUES('+QuotedStr(EmplId)+','+IntToStr(IntTypeID)+','+CompanyId+','+LocationId+','+
                    ''+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+QuotedStr(Materi.Text)+','+QuotedStr(User)+')';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end;
              end;
            if IsOk=True then
            begin
              StrQry:='SELECT TOP 1 empl_history_id FROM wh_empl_history order by empl_history_id DESC';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
            end;
            if Qry.RecordCount>0 then begin
               EmplHistoryID:=Qry.FieldValues['empl_history_id'];
            end;

            StrQry2:='INSERT INTO wh_empl_history_training_detail (empl_history_training_id,employee_id,'+
            'empl_history_id,update_user) VALUES ('+QuotedStr(EmplHistoryTrainingID)+','+
             QuotedStr(EmplId)+' ,'+QuotedStr(EmplHistoryID)+','+QuotedStr(User)+');';

            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry2);
            try
              Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end;
              end;
          end;
        end;
      end else
      begin
        StrQry:='UPDATE wh_empl_history_training SET date='+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+
        'location='+QuotedStr(Lokasi.Text)+','+
        'time='+QuotedStr(Jam.Text)+',materi='+QuotedStr(Materi.Text)+','+
        'trainer='+QuotedStr(Trainer.Text)+',type='+QuotedStr(StrType)+',update_user='+QuotedStr(User)+','+
        'finish_time='+QuotedStr(JamSelesai.Text)+',note='+QuotedStr(Note.Text)+' '+
        'WHERE empl_history_training_id='+QuotedStr(EmplHistoryTrainingID)+';';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;

        StrQry:='DELETE FROM wh_empl_history where empl_history_id IN '+
                '(SELECT empl_history_id FROM wh_empl_history_training_detail '+
                'WHERE empl_history_training_id='+QuotedStr(EmplHistoryTrainingID)+');';
        StrQry2:=StrQry+' DELETE FROM wh_empl_history_training_detail '+
                'where empl_history_training_id='+QuotedStr(EmplHistoryTrainingID)+';';
        Qry.SQL.Add(StrQry2);
        try
          Qry.ExecSQL;
          except
            on E:Exception do begin
              IsOk:=False;
              StrEMsg:=E.Message;
            end;
          end;
        for IntCount:=1 to StrGridPeserta.RowCount-1 do begin
          EmplId:= StrGridPeserta.Cells[0,IntCount];
          if Trim(EmplId)<>'' then begin
            StrQry:='INSERT INTO wh_empl_history (employee_id,empl_history_type_id,company_id,'+
                    'location_id,from_date,to_date,detail,update_user)VALUES('+QuotedStr(EmplId)+','+IntToStr(IntTypeID)+','+CompanyId+','+LocationId+','+
                    ''+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+QuotedStr(FormatDateTime('yyyy/mm/dd',Tgl.Date))+','+QuotedStr(Materi.Text)+','+QuotedStr(User)+')';
            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
              Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end;
              end;
            if IsOk=True then
            begin
              StrQry:='SELECT TOP 1 empl_history_id FROM wh_empl_history order by empl_history_id DESC';
              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              Qry.Open;
            end;
            if Qry.RecordCount>0 then begin
               EmplHistoryID:=Qry.FieldValues['empl_history_id'];
            end;

            StrQry2:='INSERT INTO wh_empl_history_training_detail (empl_history_training_id,employee_id,'+
            'empl_history_id,update_user) VALUES ('+QuotedStr(EmplHistoryTrainingID)+','+
             QuotedStr(EmplId)+' ,'+QuotedStr(EmplHistoryID)+','+QuotedStr(User)+');';

            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry2);
            try
              Qry.ExecSQL;
              except
                on E:Exception do begin
                  IsOk:=False;
                  StrEMsg:=E.Message;
                end;
              end;
          end;
        end;
      end;
      if IsOk then begin
        Main.TransCommit;
        if FormReq='EMPLOYEEHISTORYTRAINING-FORM' then begin
          MessageBox(0,PChar('Data Training Berhasil Disimpan'),'History Laka Driver',MB_OK or MB_ICONINFORMATION);
  //        Cetak.Enabled:=True;
          Simpan.Enabled:=False;
        end else begin
          MessageBox(0,PChar('Data Training Berhasil Diubah'),'History Laka Driver',MB_OK or MB_ICONINFORMATION);
          if Main.IsFormOpen('EmployeeHistoryTrainingList')=True then EmployeeHistoryTrainingList.LihatDataClick(self);
        end;
      end else begin
        Main.TransRollback;
        MessageBox(0,PChar('Data Gagal Disimpan'+Chr(13)+Chr(13)+StrEMsg),'Tambah Latar Belakang',MB_OK or MB_ICONERROR);
      end;
      Qry.Destroy;
      Main.CloseDb;
      Main.M_Normal;
    end;

    if FormReq<>'EMPLOYEEHISTORYTRAINING-FORM' then Close;
  end else begin
      MessageBox(0,PChar('Silahkan Lengkapi Kolom yang diperlukan'),'History Laka Driver',MB_OK or MB_ICONERROR);
  end;
end;

procedure TEmployeeHistoryTrainingForm.LokasiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Materi.SetFocus;
  end;
end;

procedure TEmployeeHistoryTrainingForm.MateriKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then begin
    Trainer.SetFocus;
  end;
end;

procedure TEmployeeHistoryTrainingForm.JamKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key In [#8,#13,#32] then
  begin
    Key:='0';
  end;
  if Key=#13 then begin
    JamSelesai.SetFocus;
  end;
end;

procedure TEmployeeHistoryTrainingForm.JamSelesaiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key In [#8,#13,#32] then
  begin
    Key:='0';
  end;
  if Key=#13 then begin
    Lokasi.SetFocus;
  end;
end;

procedure TEmployeeHistoryTrainingForm.JamExit(Sender: TObject);
var
  Hours,Menit,Durasi:string;
begin
  Durasi:=TimeToStr(StrToTime(JamSelesai.Text)-StrToTime(Jam.Text));
  if Copy(Durasi,1,1)='0' then Hours:=Copy(Durasi,2,1) else Hours:=Copy(Durasi,1,2);
  if Copy(Durasi,4,1)='0' then Menit:=Copy(Durasi,5,1) else Menit:=Copy(Durasi,4,2);

  Duration.Text:= Hours+' Jam '+ Menit+' Menit';

end;

procedure TEmployeeHistoryTrainingForm.JamSelesaiExit(Sender: TObject);
var
  Hours,Menit,Durasi:string;
begin
  Durasi:=TimeToStr(StrToTime(JamSelesai.Text)-StrToTime(Jam.Text));
  if Copy(Durasi,1,1)='0' then Hours:=Copy(Durasi,2,1) else Hours:=Copy(Durasi,1,2);
  if Copy(Durasi,4,1)='0' then Menit:=Copy(Durasi,5,1) else Menit:=Copy(Durasi,4,2);

  Duration.Text:= Hours+' Jam '+ Menit+' Menit';
end;

procedure TEmployeeHistoryTrainingForm.Button1Click(Sender: TObject);
begin
  if Main.IsFormOpen('MateriTrainingList')=False then MateriTrainingList:=TMateriTrainingList.Create(Self,'EMPLOYETRAINING');
end;

end.
