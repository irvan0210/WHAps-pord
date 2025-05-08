unit FResponsDriverComplaint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, WHUnit;

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
    keluar: TButton;
    save: TButton;
    memoRespon: TMemo;
    StrGrid: TStringGrid;
    CheckReject: TCheckBox;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure keluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure saveClick(Sender: TObject);
  private
    { Private declarations }
    GridLArr:Array of TArrString2;
    DriverComplainID, IsReject:String;
    procedure Init;
    procedure RefreshList;
  public
    { Public declarations }
  constructor Create(AOwner:TComponent;DriverComplain_ID:String='';Is_Reject:string='');Overload;
  procedure SetDriverComplainId(DriverComplainId:String);
  end;

var
  ResponsDriverComplaint: TResponsDriverComplaint;

implementation

uses MainU, ADODB, DriverComplainList;

{$R *.dfm}


constructor TResponsDriverComplaint.Create(AOwner:TComponent;DriverComplain_ID:String='';Is_Reject:string='');
begin
 // Initiation:=True;
  DriverComplainID:=DriverComplain_ID;
  IsReject:= Is_Reject;
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
  StrGrid.RowCount:=1;
  StrGrid.ColWidths[0]:=350;
  //StrGrid.OnClick(sender);
 // StrGrid.Enabled := False;
  //StrGrid.Cells[0,0]:=;'Deskripsi Keluhan';

end;

procedure TResponsDriverComplaint.SetDriverComplainId(DriverComplainId:String);
var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT description FROM wh_driver_complain_detail where driver_complain_id='+QuotedStr(DriverComplainId)+'and status=1;';
    Qry.SQL.Add(StrQry);
    Qry.Open;
    if Qry.RecordCount>0 then begin
      SetLength(GridLArr,Qry.RecordCount);
      IntCount:=0;
      while not(Qry.Eof) do begin
        GridLArr[IntCount][0]:=Qry.FieldValues['description'];
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
    StrGrid.Cells[0,IntCount]:=GridLArr[IntCount][0];
  end;
end;

procedure TResponsDriverComplaint.saveClick(Sender: TObject);
var
  Qry:TADOQuery;
  StrQry, StrMsg, StrException :String;
  IsOk:Boolean;
begin
  if  (memoRespon.Text = '') then
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
    end;
end;

end.
