unit FResponsDriverComplaint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit, ZColorStringGrid;

type
  TResponsDriverComplaint = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    NoKeluhan: TEdit;
    Label2: TLabel;
    Driver: TEdit;
    Label3: TLabel;
    NoPolisi: TEdit;
    Label4: TLabel;
    tgl_request: TEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    memoRespon: TMemo;
    CheckReject: TCheckBox;
    Label7: TLabel;
    StrGrid: TZColorStringGrid;
    Status: TComboBox;
    Respon: TEdit;
    save: TButton;
    keluar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure keluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ResponExit(Sender: TObject);
    procedure ResponKeyPress(Sender: TObject; var Key: Char);
    procedure StatusExit(Sender: TObject);
  private
    { Private declarations }
    GridLArr:Array of TArrString4;
    DriverComplainID, IsReject, IsReadOnly:String;
    IntRow,IntCol,IsIntegrate,MinRowGrid:Integer;
    procedure Init;
    procedure RefreshList;
  public
    { Public declarations }
  constructor Create(AOwner:TComponent;DriverComplain_ID:String='';Is_Reject:string='';Is_ReadOnly:string='');Overload;
  procedure SetDriverComplainId(DriverComplainId:String);
  end;

var
  ResponsDriverComplaint: TResponsDriverComplaint;
  MinRowGrid,IntMaxRow : Integer ;

implementation

uses MainU, ADODB, DriverComplainList;

{$R *.dfm}


constructor TResponsDriverComplaint.Create(AOwner:TComponent;DriverComplain_ID:String='';Is_Reject:string='';Is_ReadOnly:string='');
begin
 // Initiation:=True;
  DriverComplainID:=DriverComplain_ID;
  IsReject:= Is_Reject;
  IsReadOnly:= Is_ReadOnly;
  inherited Create(AOwner);
end;

procedure TResponsDriverComplaint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TResponsDriverComplaint.keluarClick(Sender: TObject);
begin
  Close;
end;

procedure TResponsDriverComplaint.FormShow(Sender: TObject);
begin
  Init;
 // RefreshGrid;
  RefreshList;
  NoKeluhan.Enabled := False;
  Driver.Enabled := False;
  tgl_request.Enabled :=False;
  NoPolisi.Enabled := False;

  if (IsReject = '1')then begin
      CheckReject.Checked := True;
      CheckReject.Enabled := False;
  end;

end;

procedure TResponsDriverComplaint.Init;
var IntCount:Integer;
begin
  // Jumlah kolom

  MinRowGrid:=2;
  StrGrid.RowCount:=2;
  StrGrid.ColCount := 5;
  // Header
  StrGrid.Cells[0,0] := 'No';
  StrGrid.Cells[1,0] := 'Keluhan';
  StrGrid.Cells[2,0] := 'Status';
  StrGrid.Cells[3,0] := 'Respon';
  StrGrid.Cells[4,0] := 'ID';

  // Lebar kolom
  StrGrid.ColWidths[0] := 20;    // No
  StrGrid.ColWidths[1] := 200;   // Keluhan
  StrGrid.ColWidths[2] := 75;    // Status
  StrGrid.ColWidths[3] := 250;   // Respon
  StrGrid.ColWidths[4] := 50;   // ID

  StrGrid.CellStyle[0,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[1,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[2,0].HorizontalAlignment:=taCenter;
  StrGrid.CellStyle[3,0].HorizontalAlignment:=taCenter;

  for IntCount:=0 to StrGrid.ColCount-1 do
  StrGrid.Cells[IntCount,1]:='';

end;

procedure TResponsDriverComplaint.SetDriverComplainId(DriverComplainId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount, No:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_driver_complain_detail where driver_complain_id='+QuotedStr(DriverComplainId)+'and status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(GridLArr,Qry.RecordCount);
      IntCount:=0;
      No := 0;
      while not(Qry.Eof) do begin
        No := No +1;
        GridLArr[IntCount][0]:=IntToStr(No);
        GridLArr[IntCount][1]:=Qry.FieldValues['description'];
        if Qry.FieldValues['status_respons'] =1 then GridLArr[IntCount][2]:='DISETUJUI'
        else if Qry.FieldValues['status_respons'] =0 then GridLArr[IntCount][2]:='DITOLAK'
        else GridLArr[IntCount][2]:='';
        if Qry.FieldValues['note_respons']<> null then  GridLArr[IntCount][3]:=Qry.FieldValues['note_respons']
        else GridLArr[IntCount][3]:='';
        GridLArr[IntCount][4]:=Qry.FieldValues['driver_complain_detail_id'];
        Inc(IntCount);
        Qry.Next;
      end;
    end;
    Qry.Close;
    Main.CloseDb;
  end;
  Qry.Destroy;
  Init;
  //RefreshGrid;
  RefreshList;
end;

procedure TResponsDriverComplaint.RefreshList;
var IntCount:Integer;
begin
  StrGrid.RowCount:=Length(GridLArr)+1;
  for IntCount:=0 to Length(GridLArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=GridLArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=GridLArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=GridLArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=GridLArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=GridLArr[IntCount][4];
  end;
end;

procedure TResponsDriverComplaint.saveClick(Sender: TObject);
var
  Qry:TADOQuery;
  StrQry, StrMsg, StrException, StrNo, Pesan :String;
  IsOk, IsComplated:Boolean;
  IntCount, StatusRespon : Integer;
begin
  IsComplated := True;
  StrQry:= '';
   for IntCount := 1 to StrGrid.RowCount-1 do begin

     if (StrGrid.Cells[2,IntCount] = '') and (StrGrid.Cells[3,IntCount] = '') then begin
      Pesan := 'Keluhan No: ' + QuotedStr(StrGrid.Cells[0,IntCount]) +
             ' belum memiliki status atau respon.';
      MessageBox(0,PChar(Pesan),'Respon Keluhan',MB_OK or MB_ICONWARNING);
        IsComplated := False;
        Break;
     end else begin
       if StrGrid.Cells[2,IntCount]='DISETUJUI' then StatusRespon :=1
       else StatusRespon := 0;
      StrQry :=StrQry+'UPDATE wh_driver_complain_detail SET status_respons ='+IntToStr(StatusRespon)+
            ', note_respons ='+QuotedStr(StrGrid.Cells[3,IntCount])+
            ' WHERE  driver_complain_detail_id ='+QuotedStr(StrGrid.Cells[4,IntCount])+'; ';
     end;
  end;

  if IsComplated then begin
    IsOk := True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then
      begin
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
            Qry.ExecSQL;
          except
            on E:Exception do begin
            IsOk:=False;
            StrMsg:='Gagal Menambah Respon';
            StrException:=E.Message;
          end;
         end;

         if IsOk then
          begin
           MessageBox(0,'Berhasil menyimpan Respon','Respon Keluhan',MB_OK or MB_ICONINFORMATION);
          end
          else
          begin
            MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Respon Keluhan',MB_OK or MB_ICONERROR);
          end;
        memoRespon.Clear;
        Qry.Close;
        Main.CloseDb;
      end;
    FDriverComplainList.RefreshClick(Sender);
    Close;
  end else begin
    MessageBox(0,'Respon tidak boleh kosong..!','Respon Keluhan',MB_OK or MB_ICONWARNING);
  end;

 { if  (memoRespon.Text = '') then
    begin
       MessageBox(0,'Respon tidak boleh kosong..!','Respon Keluhan',MB_OK or MB_ICONWARNING);
       memoRespon.SetFocus;
    end
  else
    begin
      if CheckReject.Checked = True then begin
        if MessageBox(0,'Yakin Tolak Keluhan ini..?','Keluhan Driver',MB_OKCANCEL or MB_ICONWARNING)=1 then begin
          IsOk := True;
          Qry:=TADOQuery.Create(Self);
          Qry.Connection:=Main.MyConnection;
          if Main.OpenDb then
            begin
             StrQry:='UPDATE wh_driver_complain SET is_reject =1, response ='+Chr(39)+memoRespon.text+Chr(39)+
                    ' WHERE  driver_complain_id ='+Chr(39)+NoKeluhan.text+Chr(39)+';';

              Qry.SQL.Clear;
              Qry.SQL.Add(StrQry);
              try
                  Qry.ExecSQL;
                except
                  on E:Exception do begin
                  IsOk:=False;
                  StrMsg:='Gagal Tolak Keluhan';
                  StrException:=E.Message;
                end;
               end;

             if IsOk then
              begin
               MessageBox(0,'Keluhan Berhasil Ditolak','Tolak Keluhan',MB_OK or MB_ICONINFORMATION);
              end
              else
              begin
                MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Respon Keluhan',MB_OK or MB_ICONERROR);
              end;
              memoRespon.Clear;
              Qry.Close;
              Main.CloseDb;
            end;
          FDriverComplainList.RefreshClick(Sender);
          Close;
        end else begin
          FDriverComplainList.RefreshClick(Sender);
          CheckReject.SetFocus;
        end;
      //end;

      end else begin

        IsOk := True;
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Main.MyConnection;
        if Main.OpenDb then
          begin
           StrQry:='UPDATE wh_driver_complain SET response ='+Chr(39)+memoRespon.text+Chr(39)+
                  ' WHERE  driver_complain_id ='+Chr(39)+NoKeluhan.text+Chr(39)+';';

            Qry.SQL.Clear;
            Qry.SQL.Add(StrQry);
            try
                Qry.ExecSQL;
              except
                on E:Exception do begin
                IsOk:=False;
                StrMsg:='Gagal Menambah Respon';
                StrException:=E.Message;
              end;
             end;

             if IsOk then
              begin
               MessageBox(0,'Berhasil menyimpan Respon','Respon Keluhan',MB_OK or MB_ICONINFORMATION);
              end
              else
              begin
                MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrException),'Respon Keluhan',MB_OK or MB_ICONERROR);
              end;
            memoRespon.Clear;
            Qry.Close;
            Main.CloseDb;
          end;
        FDriverComplainList.RefreshClick(Sender);
        Close;
      end;
    end; }
end;

procedure TResponsDriverComplaint.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  IntRow:=ARow;
  IntCol:=ACol;
  R := StrGrid.CellRect(ACol, ARow);
  R.Left := R.Left + StrGrid.Left;
  R.Right := R.Right + StrGrid.Left;
  R.Top := R.Top + StrGrid.Top;
  R.Bottom := R.Bottom + StrGrid.Top;
  if IsReadOnly <> 'YA' then
  begin
    case ACol of
      2 :with Status do begin
          Left:=R.Left + 1;
          Top := R.Top + 1;
          Width :=75;
          Height :=18;
          StrGrid.Cells[ACol,ARow]:=Status.Text;
         // if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
          Visible:= True;
          BringToFront;
          SetFocus;
        end;

      3 :with Respon do begin
          Left:=R.Left + 1;
          Top := R.Top + 1;
          Width :=230;
          Height :=20;
          StrGrid.Cells[ACol,ARow]:=Respon.Text;
         // if StrGrid.Cells[ACol,ARow]='v' then Checked:=True else Checked:=False;
          Visible:= True;
          BringToFront;
          SetFocus;
        end;

    end;
  end;

//  if IsInputGrid then begin
 { if (ACol = 2) and (ARow > MinRowGrid) then begin
    R := StrGrid.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid.Left;
    R.Right := R.Right + StrGrid.Left;
    R.Top := R.Top + StrGrid.Top;
    R.Bottom := R.Bottom + StrGrid.Top;
    with Status do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;
  if (ACol = 3) and (ARow > MinRowGrid) then begin
    R := StrGrid.CellRect(ACol, ARow);
    R.Left := R.Left + StrGrid.Left;
    R.Right := R.Right + StrGrid.Left;
    R.Top := R.Top + StrGrid.Top;
    R.Bottom := R.Bottom + StrGrid.Top;
    with Status do begin
      Left:=R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      if Trim(StrGrid.Cells[ACol,ARow])<>'' then Text:=StrGrid.Cells[ACol,ARow];
      Visible:= True;
      BringToFront;
      SetFocus;
    end;
  end;  }
end;

procedure TResponsDriverComplaint.ResponExit(Sender: TObject);
begin
  if Trim(Respon.Text)<>'' then begin
    StrGrid.Cells[3,IntRow]:=Respon.Text;
    //Calculate4;
  end;
  Respon.Text:='';
  Respon.Visible := False;
  StrGrid.SetFocus;
end;

procedure TResponsDriverComplaint.ResponKeyPress(Sender: TObject;
  var Key: Char);
  var
  IntCount: Integer;
begin
{  if (Key=#13) then begin
    ResponExit(nil);
    if (StrGrid.Row=StrGrid.RowCount-1) AND (StrGrid.RowCount<=IntMaxRow)  then begin
      StrGrid.RowCount:=StrGrid.RowCount+1;
      for IntCount:=0 to 3 do StrGrid.Cells[IntCount,StrGrid.RowCount-1]:='';
      StrGrid.CellStyle[0,StrGrid.RowCount-1].HorizontalAlignment:=taCenter;
    end;
    StrGrid.Col:=2;
   // StrGrid.Row:=StrGrid.Row+1;
    StrGrid.Col:= 3;

  end;  }
  if (Key=#27) then begin
    ResponExit(nil);
  end;
end;

{procedure TResponsDriverComplaint.Calculate;
var IntCount,IntNum:Integer;
begin
  IntNum:=0;
  for IntCount:=1 to StrGrid.RowCount-1 do
    if (Trim(StrGrid.Cells[1,IntCount])<>'') and (Trim(StrGrid.Cells[2,IntCount])<>'') then begin
      Inc(IntNum);
      StrGrid.Cells[0,IntCount]:=IntToStr(IntNum);
      StrGrid.CellStyle[0,IntCount].HorizontalAlignment:=taCenter;
    end else
      StrGrid.Cells[0,IntCount]:='';
end; }

procedure TResponsDriverComplaint.StatusExit(Sender: TObject);
begin
  if Trim(Status.Text)<>'' then begin
    StrGrid.Cells[IntCol,IntRow]:=Status.Text;
  end;
  Status.Text:='';
  Status.Visible := False;
  StrGrid.SetFocus;
end;

end.
