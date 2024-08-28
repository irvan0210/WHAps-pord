unit UploadTopup_eTollU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, MD5, ADODB, ZColorStringGrid, WHUnit, Buttons;

type
  TUploadTopup_eToll = class(TForm)
    Selesai: TButton;
    Cari: TEdit;
    Label1: TLabel;
    StrGrid: TZColorStringGrid;
    Button1: TButton;
    btnCariDriver: TSpeedButton;
    lbl1: TLabel;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure CariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CariKeyPress(Sender: TObject; var Key: Char);
    procedure btnCariDriverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FormRequest:String;
    IntRow:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshGrid;
    procedure PopulateStringGrid(Grid: TZColorStringGrid; const FileName: string);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Form_Request:String='');Overload;
  end;

var
  UploadTopup_eToll: TUploadTopup_eToll;
  Row:Integer;
  EtollArr:Array of TArrString2;
implementation

{$R *.dfm}

Uses MainU,AddUserU,UserFormU, DB, UserSignatureU, EtollFormU;

constructor TUploadTopup_eToll.Create(AOwner:TComponent;Form_Request:String='');
begin
  FormRequest:=Form_Request;
  Main.WriteLog('Form Open: eTollList='+Form_Request,1);

  inherited Create(AOwner);
end;

procedure TUploadTopup_eToll.RefreshGrid;
var Count,Count2:Integer;
begin
  StrGrid.RowCount:=Length(EtollArr)+1;
  for Count:=0 to Length(EtollArr)-1 do
    for Count2:=0 to 5 do
      StrGrid.Cells[Count2,Count+1]:=EtollArr[Count][Count2];

end;

procedure TUploadTopup_eToll.InitGrid;
var IntCount:Integer;
begin
  StrGrid.RowCount:=2;
  StrGrid.ColCount:=6;
  StrGrid.Cells[0,0]:='No';
  StrGrid.Cells[1,0]:='No Etoll';
  StrGrid.Cells[2,0]:='Tanggal Trx';
  StrGrid.Cells[3,0]:='Jam Trx';
  StrGrid.Cells[4,0]:='No Surat Jalan';
  StrGrid.Cells[5,0]:='Nilai Topup';

  StrGrid.ColWidths[0]:=30;
  StrGrid.ColWidths[1]:=145;
  StrGrid.ColWidths[2]:=80;
  StrGrid.ColWidths[3]:=100;
  StrGrid.ColWidths[4]:=100;
  StrGrid.ColWidths[5]:=80;

  for IntCount:=0 to 5 do StrGrid.Cells[IntCount,1]:='';
  //RefreshList;
end;

procedure TUploadTopup_eToll.Init;
begin
  Cari.Text:='';
  InitGrid;
  //RefreshGrid;
end;

procedure TUploadTopup_eToll.SelesaiClick(Sender: TObject);
begin
  UploadTopup_eToll.Close;
end;

procedure TUploadTopup_eToll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TUploadTopup_eToll.StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Row:=ARow;
  IntRow:=ARow;
end;

procedure TUploadTopup_eToll.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then UploadTopup_eToll.Close;

end;

procedure TUploadTopup_eToll.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    InitGrid;
    Count2:=2;
    for Count:=0 to Length(EtollArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 1 do
        if (StrPos(PChar(UpperCase(Trim(EtollArr[Count][Count3]))),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 1 do
          StrGrid.Cells[Count4,Count2-1]:=EtollArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGrid;
end;

procedure TUploadTopup_eToll.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TUploadTopup_eToll.CariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then Close;
end;

procedure TUploadTopup_eToll.btnCariDriverClick(Sender: TObject);
var
  openFileDlg : TOpenDialog;
begin
    openFileDlg := TOpenDialog.Create(Nil);
    if openFileDlg.Execute then begin
      Cari.Text := openFileDlg.FileName;
      PopulateStringGrid(StrGrid, Cari.Text);
      //RefreshGrid;
    end;

end;

procedure TUploadTopup_eToll.PopulateStringGrid(Grid: TZColorStringGrid; const FileName: string);
var
  TextFile, Line: TStringList;
  Row,Col: Integer;
begin
  Grid.RowCount := 0;//clear any previous data
  TextFile := TStringList.Create;
  try
    Line := TStringList.Create;
    try
      SetLength(EtollArr, 0);
      Line.Delimiter := ',';
      TextFile.LoadFromFile(FileName);
      Grid.RowCount := TextFile.Count;

      SetLength(EtollArr, Grid.RowCount);

      for Row := 1 to TextFile.Count-1 do
      begin
        Grid.CellStyle[1, Row].Font.Color:=clBlack;
        if Row>0 Then Grid.Cells[0, Row] := IntToStr(Row);
        Line.DelimitedText := TextFile[Row];
        Grid.ColCount:= Line.Count+1;
        for Col := 0 to Grid.ColCount-1 do begin
          if Col<Line.Count then begin
            Grid.Cells[Col+1, Row] := Line[Col];
            //EtollArr[Row-1][Col]:=Line[Col];
          end else begin
            Grid.Cells[Col+1, Row] := '0';
            //EtollArr[Row-1][Col]:='0';
          end;

          if (Col=0) then begin
            if CekNoEToll(Line[Col])='x' then begin
              Grid.CellStyle[1, Row].Font.Color:=clRed;
            end;
          end;
        end;
      end;
    finally
      Line.Free;
    end;
  finally
    TextFile.Free;
  end;
end;

procedure TUploadTopup_eToll.Button1Click(Sender: TObject);
var Qry:TADOQuery;
    QStr,StrEmplId,StrNoEtoll,StrDate,StrTime,StrNoSJ,StrNilai,StrMaxId:String;
    IsOk:Boolean;
    Count,IntCount:Integer;
    StrMessage:String;
begin
  if (StrGrid.RowCount>1) then begin
    IsOk:=True;
    Count:=0;

    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      for IntCount:=1 to StrGrid.RowCount do
      begin
          StrNoEtoll:= StrGrid.Cells[1, IntCount];
          if Trim(StrNoEtoll)<>'' then begin
            if CekNoEToll(StrNoEtoll)<>'x' then begin
              StrDate   := StrGrid.Cells[2, IntCount];
              StrTime   := StrGrid.Cells[3, IntCount];
              StrNoSJ   := StrGrid.Cells[4, IntCount];
              StrNilai  := StrGrid.Cells[5, IntCount];
              if (Trim(StrNilai)='') then StrNilai:='0';

              QStr:='SELECT RIGHT(MAX(id_etoll_trx),4) AS max_id FROM wh_etoll_transaction '+
                    'WHERE  id_etoll_trx  LIKE '+Chr(39)+'TOP'+LocationCode+
                    FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                    FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+
                    '____'+Chr(39)+';';
              Qry.SQL.Clear;
              Qry.SQL.Add(QStr);
              Qry.Open;
              if Qry.FieldValues['max_id']<>NULL then
                StrMaxId:=Qry.FieldValues['max_id']
              else
                StrMaxId:='0000';
              StrMaxId:=Format('%.*d',[4, StrToInt(StrMaxId)+1]);

              StrMaxId:='TOPUP'+LocationCode+FormatDateTime('yy',StrToDate(Main.Status.Panels.Items[0].Text))+
                        FormatDateTime('mm',StrToDate(Main.Status.Panels.Items[0].Text))+StrMaxId;

              QStr:=' INSERT INTO wh_etoll_transaction ( id_etoll_trx, id_etoll_number, trx_date, trx_time, vhc_trans_id, amount, update_user)'+
                    ' VALUES ('+QuotedStr(StrMaxId)+','+QuotedStr(CekNoEToll(StrNoEtoll))+','+QuotedStr(StrDate)+','+QuotedStr(StrDate+' '+StrTime)+','+QuotedStr(StrNoSJ)+','+QuotedStr(StrNilai)+','+QuotedStr(User)+');';
              Main.WriteLog('SQL :'+QStr,4);
              Qry.SQL.Clear;
              Qry.SQL.Add(QStr);
              Qry.Close;
              if StrToInt(StrNilai)>0 then begin
                try
                  Qry.ExecSQL;
                except
                  on E:Exception do begin
                    StrMessage := e.Message;
                    IsOk:=False;
                  end
                end;
              end;
            end else begin
              IsOk := False;
              StrMessage := StrMessage + StrNoEtoll+',';
              StrGrid.CellStyle[1, IntCount].Font.Color:=clRed;
            end;
          end;
      end;
     end;

      if IsOk then begin
        MessageBox(0,'Upload Topup EToll Berhasil','Transaksi No EToll',MB_OK or MB_ICONINFORMATION);
        Main.TransCommit;
      end else begin
        StrMessage:='Upload Topup EToll Gagal'+Chr(13)+Chr(13)+StrMessage;
        MessageBox(0,pChar(StrMessage),'Transaksi No EToll',MB_OK or MB_ICONWARNING);
        Main.TransRollback;
      end;
      Qry.Close;
      Main.CloseDb;
    end;

end;


end.
