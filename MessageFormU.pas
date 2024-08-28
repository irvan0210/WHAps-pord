unit MessageFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ADODB, WHUnit, ExtCtrls, ZColorStringGrid,
  Buttons;

type
  TMessageForm = class(TForm)
    GroupMessage: TGroupBox;
    TimerClose: TTimer;
    StrGrid: TZColorStringGrid;
    Delete: TBitBtn;
    AddNew: TBitBtn;
    ReadUnRead: TBitBtn;
    Reply: TBitBtn;
    Selesai: TBitBtn;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DeleteClick(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridKeyPress(Sender: TObject; var Key: Char);
    procedure AddNewClick(Sender: TObject);
    procedure ReadUnReadClick(Sender: TObject);
    procedure ReplyClick(Sender: TObject);
  private
    { Private declarations }
    MsgArr:Array Of TArrString7;
    IntRow:Integer;
    procedure Init;
    procedure InitGrid;
    procedure RefreshData;
    procedure RefreshGrid;
  public
    { Public declarations }
    procedure RefreshForm;
  end;

var
  MessageForm: TMessageForm;

implementation

uses MainU, LihatPesanFormU, StrUtils, MessageSendFormU;

{$R *.dfm}

procedure TMessageForm.RefreshForm;
begin
  RefreshData;
  RefreshGrid;
end;

procedure TMessageForm.SelesaiClick(Sender: TObject);
begin
  MessageForm.Close;
  IsMessageOpen:=False; 
end;

procedure TMessageForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMessageForm.Init;
begin
end;

procedure TMessageForm.InitGrid;
var IntCount:Integer;
begin
  StrGrid.WordWrap:=False;
  IntCounterMessage:=0;
  StrGrid.RowCount:=2;
  StrGrid.ColWidths[0]:=0;
  StrGrid.ColWidths[1]:=450;
  StrGrid.ColWidths[2]:=70;
  StrGrid.ColWidths[3]:=50;
  StrGrid.ColWidths[4]:=120;
  StrGrid.Cells[0,0]:='';
  StrGrid.Cells[1,0]:='             Isi Pesan';
  StrGrid.Cells[2,0]:='Waktu';
  StrGrid.Cells[3,0]:='Jam';
  StrGrid.Cells[4,0]:='Dari';
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.CellStyle[IntCount,0].Font.Style:=[fsBold];
    StrGrid.CellStyle[IntCount,0].HorizontalAlignment:=taCenter;
    StrGrid.Cells[IntCount,1]:='';
  end;
end;


procedure TMessageForm.RefreshData;
var Qry:TADOQuery;
    Conn:TADOConnection;
    StrQry:String;
    IntCount:Integer;
    IsOk:Boolean;
begin
  if Logged then begin
    IsOk:=True;
    Conn:=TADOConnection.Create(Self);
    Conn.ConnectionString:=StrConnection;
    Conn.LoginPrompt:=False;
    Main.WriteLog('Port Opening');
    if IsPortOpened(Main.DbHost,1433) then begin
      try
        Conn.Open;
      except
        on E:Exception do begin
          IsOk:=False;
          MessageBox(0,PChar('Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message),'Koneksi Database',MB_OK or MB_ICONERROR);
        end;
      end;
    end;
    if IsOk then begin
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Conn;
      StrQry:='EXEC GetMessageList '+QuotedStr(GroupId)+','+QuotedStr(User)+';';
      Main.WriteLog('SQL :'+StrQry,2);
      Qry.SQL.Add(StrQry);
      Qry.Open;
      SetLength(MsgArr,Qry.RecordCount);
      if Qry.RecordCount>0 then begin
        IntCount:=0;
        while Not(Qry.Eof) do begin
          MsgArr[IntCount][0]:=Qry.FieldValues['message_type']+IntToStr(Qry.FieldValues['message_id']);
          MsgArr[IntCount][1]:=Qry.FieldValues['message'];
          MsgArr[IntCount][2]:=Qry.FieldValues['date'];
          MsgArr[IntCount][3]:=Qry.FieldValues['time'];
          MsgArr[IntCount][4]:=Qry.FieldValues['sender'];
          MsgArr[IntCount][5]:=Qry.FieldValues['ack'];
          Qry.Next;
          Inc(IntCount)
        end;
      end;
      Qry.Close;
      Conn.Close;
    end;
  end;
end;

procedure TMessageForm.RefreshGrid;
var IntCount,IntCount2:Integer;
begin
  StrGrid.RowCount:=2;
  for IntCount:=0 to StrGrid.ColCount-1 do begin
    StrGrid.Cells[IntCount,1]:='';
  end;
  if Length(MsgArr)>0 then begin
    StrGrid.RowCount:=Length(MSgArr)+1;
    for IntCount:=0 to Length(MsgArr)-1 do begin
      StrGrid.Cells[0,IntCount+1]:=MsgArr[IntCount][0];
      StrGrid.Cells[1,IntCount+1]:=MsgArr[IntCount][1];
      StrGrid.Cells[2,IntCount+1]:=MsgArr[IntCount][2];
      StrGrid.Cells[3,IntCount+1]:=MsgArr[IntCount][3];
      StrGrid.Cells[4,IntCount+1]:=MsgArr[IntCount][4];
      StrGrid.CellStyle[1,IntCount+1].WordWrap:=False;
      if MsgArr[IntCount][5]='0' then begin
        for Intcount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Style:=[fsBold];
      end else begin
        for Intcount2:=0 to StrGrid.ColCount-1 do StrGrid.CellStyle[IntCount2,IntCount+1].Font.Style:=[];
      end;
    end;
    IntRow:=1;
  end;
end;


procedure TMessageForm.FormShow(Sender: TObject);
begin
  Main.M_Busy;
  Init;
  InitGrid;
  RefreshData;
  RefreshGrid;
  Main.M_Normal;
end;

procedure TMessageForm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=Arow;
end;

procedure TMessageForm.DeleteClick(Sender: TObject);
var Qry:TADOQuery;
    Conn:TADOConnection;
    StrQry,StrTransId,StrMsgType,StrTableName,StrFieldName,StrParam:String;
    IntCount:Integer;
    IsOk,IsUpdated:Boolean;
begin
  if (IntRow>0) and (IntRow<=StrGrid.RowCount-1) then begin
    IsOk:=True;
    Conn:=TADOConnection.Create(Self);
    Conn.ConnectionString:=StrConnection;
    Conn.LoginPrompt:=False;
    Main.WriteLog('Port Opening');
    if IsPortOpened(Main.DbHost,1433) then begin
      try
        Conn.Open;
      except
        on E:Exception do begin
          IsOk:=False;
          MessageBox(0,PChar('Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message),'Koneksi Database',MB_OK or MB_ICONERROR);
        end;
      end;
    end;
    if IsOk then begin
      IsUpdated:=True;
      Conn.BeginTrans;
      StrTransId:=RightStr(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0],Length(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0])-1);
      StrMsgType:=MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][5];
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Conn;
      if StrMsgType='G' then begin
        StrParam:=',ack_user='+QuotedStr(User);
        StrTableName:='wh_message_group';
        StrFieldName:='message_group_id';
      end else begin
        StrParam:='';
        StrTableName:='wh_message_user';
        StrFieldName:='message_user_id';
      end;
      StrQry:='UPDATE '+StrTableName+' SET del=1'+StrParam+' WHERE '+StrFieldName+'='+StrTransId+';';
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsUpdated:=False;
        end;
      end;
      if IsUpdated then begin
        Conn.CommitTrans;
      end else begin
        Conn.RollbackTrans;
      end;
      Qry.Close;
      Conn.Close;
    end;
    Init;
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMessageForm.TimerCloseTimer(Sender: TObject);
begin
  TimerClose.Enabled:=False;
  MessageForm.Close;
end;

procedure TMessageForm.StrGridDblClick(Sender: TObject);
begin
  if Main.IsFormOpen('LihatPesanForm')=False then
    LihatPesanForm:=TLihatPesanForm.Create(Self,StrGrid.Cells[0,IntRow]);
end;

procedure TMessageForm.StrGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then MessageForm.Close;
end;

procedure TMessageForm.AddNewClick(Sender: TObject);
begin
  if Main.IsFormOpen('MessageSendForm')=False then MessageSendForm:=TMessageSendForm.Create(nil);
end;

procedure TMessageForm.ReadUnReadClick(Sender: TObject);
var Qry:TADOQuery;
    Conn:TADOConnection;
    StrQry,StrTransId,StrMsgType,StrTableName,StrFieldName,StrParam:String;
    IntCount:Integer;
    IsOk,IsUpdated:Boolean;
begin
  if (IntRow>0) and (IntRow<=StrGrid.RowCount-1) then begin
    IsOk:=True;
    Conn:=TADOConnection.Create(Self);
    Conn.ConnectionString:=StrConnection;
    Conn.LoginPrompt:=False;
    Main.WriteLog('Port Opening');
    if IsPortOpened(Main.DbHost,1433) then begin
      try
        Conn.Open;
      except
        on E:Exception do begin
          IsOk:=False;
          MessageBox(0,PChar('Periksa Settingan Server'+Chr(13)+Chr(13)+'Pesan Error:'+Chr(13)+E.Message),'Koneksi Database',MB_OK or MB_ICONERROR);
        end;
      end;
    end;
    if IsOk then begin
      IsUpdated:=True;
      Conn.BeginTrans;
      StrTransId:=RightStr(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0],Length(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0])-1);
      StrMsgType:=MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][5];
      Qry:=TADOQuery.Create(Self);
      Qry.Connection:=Conn;
      if StrMsgType='G' then begin
        StrParam:=',ack_user='+QuotedStr(User);
        StrTableName:='wh_message_group';
        StrFieldName:='message_group_id';
      end else begin
        StrParam:='';
        StrTableName:='wh_message_user';
        StrFieldName:='message_user_id';
      end;
      StrQry:='UPDATE '+StrTableName+' SET ack=1'+StrParam+' WHERE '+StrFieldName+'='+StrTransId+';';
      Main.WriteLog('SQL :'+StrQry,4);
      Qry.SQL.Add(StrQry);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          IsUpdated:=False;
        end;
      end;
      if IsUpdated then begin
        Conn.CommitTrans;
      end else begin
        Conn.RollbackTrans;
      end;
      Qry.Close;
      Conn.Close;
    end;
    Init;
    RefreshData;
    RefreshGrid;
  end;
end;

procedure TMessageForm.ReplyClick(Sender: TObject);
var StrTransId:String;
    Qry:TADOQuery;
    StrQry:String;
begin
  if (IntRow>0) and (IntRow<=StrGrid.RowCount-1) then begin
    StrTransId:=RightStr(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0],Length(MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][0])-1);
    if Main.IsFormOpen('MessageSendForm')=False then MessageSendForm:=TMessageSendForm.Create(Self,MsgArr[ArrayIndexOf(MsgArr,StrGrid.Cells[0,IntRow],0)][4],StrTransId,'P');
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      StrQry:='UPDATE wh_message_user SET ack=1 WHERE message_user_id='+QuotedStr(StrTransId)+';';
      Qry.SQL.Add(StrQry);
      Qry.ExecSQL;
    end;
    Main.CloseDb;
    RefreshForm;
  end;
end;

end.
