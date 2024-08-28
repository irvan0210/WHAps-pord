unit BengkelEksternalListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ADODB,WHUnit;

type
  TBengkelEksternalList = class(TForm)
    StrGrid: TStringGrid;
    Label1: TLabel;
    Selesai: TButton;
    Cari: TEdit;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridDblClick(Sender: TObject);
    procedure CariChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    //18 juni 2013
    procedure LoadData;
    //18 juni 2013
    procedure RefreshList;
    //18 juni 2013
    procedure AskDelete(SvcId,NamaUser:String);

  public
    { Public declarations }
  end;

var
  BengkelEksternalList: TBengkelEksternalList;
  IntRow:Integer;
  SvcArr:Array of TArrString5;

implementation

uses MainU, BengkelEksternalFormU, StrUtils;

{$R *.dfm}

procedure TBengkelEksternalList.Init;
begin
  Cari.Text:=''; 
  StrGrid.RowCount:=2;
  StrGrid.Cells[0,0]:='Kode';
  StrGrid.Cells[1,0]:='Nama Bengkel';
  StrGrid.Cells[2,0]:='Alamat';
  StrGrid.Cells[3,0]:='PIC';
  StrGrid.Cells[4,0]:='Telp';
  StrGrid.Cells[5,0]:='HP';
  StrGrid.Cells[0,1]:='';
  StrGrid.Cells[1,1]:='';
  StrGrid.Cells[2,1]:='';
  StrGrid.Cells[3,1]:='';
  StrGrid.Cells[4,1]:='';
  StrGrid.Cells[5,1]:='';
end;

procedure TBengkelEksternalList.LoadData;
Var Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT *,COALESCE(phone_no1,'')'+Chr(39)+','+Chr(39)+'COALESCE(phone_no2,'') AS phone FROM wh_service_location;';
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(StrQry);
    Qry.Open;

    //18 juni 2013
    {
    IntCount:=1;
    if Qry.RecordCount>0 then StrGrid.RowCount:=Qry.RecordCount+1;
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      StrGrid.Cells[0,IntCount]:=Qry.FieldValues['service_location_id'];  
      StrGrid.Cells[1,IntCount]:=Qry.FieldValues['name'];
      StrGrid.Cells[2,IntCount]:=Qry.FieldValues['address'];
      if Qry.FieldValues['contact']<>NULL then StrGrid.Cells[3,IntCount]:=Qry.FieldValues['contact'];
      if Qry.FieldValues['phone']<>NULL then StrGrid.Cells[4,IntCount]:=Qry.FieldValues['phone'];
      if Qry.FieldValues['cellular_no']<>NULL then StrGrid.Cells[5,IntCount]:=Qry.FieldValues['cellular_no'];
      Qry.Next;
      Inc(IntCount);
    end;
    }


    IntCount:=0;
    SetLength(SvcArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while Not(Qry.Eof) do begin
      SvcArr[IntCount][0]:=Qry.FieldValues['service_location_id'];
      SvcArr[IntCount][1]:=Qry.FieldValues['name'];
      SvcArr[IntCount][2]:=Qry.FieldValues['address'];

      if Qry.FieldValues['phone_no1']<>NULL then
      SvcArr[IntCount][4]:=Qry.FieldValues['phone_no1'];
      
      if Qry.FieldValues['contact']<>NULL then
      SvcArr[IntCount][3]:=Qry.FieldValues['contact'];

      if Qry.FieldValues['cellular_no']<>NULL then
      SvcArr[IntCount][5]:=Qry.FieldValues['cellular_no'];

      Inc(IntCount);
      Qry.Next;
    end; 

    //Qry.Close;
    Main.CloseDb;
  end;
  
  FreeAndNil(Qry);

end;

procedure TBengkelEksternalList.RefreshList;
var IntCount:Integer;
begin

  if Length(SvcArr)>0 then
  StrGrid.RowCount:=Length(SvcArr)+1;
  for IntCount:=0 to Length(SvcArr)-1 do begin
    StrGrid.Cells[0,IntCount+1]:=SvcArr[IntCount][0];
    StrGrid.Cells[1,IntCount+1]:=SvcArr[IntCount][1];
    StrGrid.Cells[2,IntCount+1]:=SvcArr[IntCount][2];
    StrGrid.Cells[3,IntCount+1]:=SvcArr[IntCount][3];
    StrGrid.Cells[4,IntCount+1]:=SvcArr[IntCount][4];
    StrGrid.Cells[5,IntCount+1]:=SvcArr[IntCount][5]; 

  end;

end;



procedure TBengkelEksternalList.SelesaiClick(Sender: TObject);
begin
  BengkelEksternalList.Close;
end;

procedure TBengkelEksternalList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBengkelEksternalList.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshList;
end;

procedure TBengkelEksternalList.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IntRow:=ARow;
end;

procedure TBengkelEksternalList.AskDelete(SvcId,NamaUser:String);
var Qry:TADOQuery;
    StrQry,StrEMsg,Name:String;
    IsOk:Boolean;
begin

  if (Trim(SvcId)<>'') then begin
    StrEMsg:='';
    IsOk:=True;
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if MessageBox(0,PChar('Menu Id '+SvcId+' Mau Dihapus ?') ,'Menu',MB_OKCANCEL or MB_ICONINFORMATION)=1 then begin
      if Main.OpenDb then begin
        Main.TransStart;
        Name:=NamaUser;
        //StrQry:='DELETE FROM wh_customer WHERE customer_id='+Chr(39)+SvcId+Chr(39)+';';
        {
        UPDATE wh_customer SET status='+chr(39)+'0'+chr(39)+
                //',update_time=GETDATE(),
                ', update_user='+Chr(39)+Name+Chr(39)+
                ' WHERE customer_id='+Chr(39)+CustId+Chr(39)+' ;';
        }

        StrQry:=' UPDATE wh_service_location SET active='+QuotedStr('0')+', '+
                ' update_user='+QuotedStr(Name)+' '+
                ' WHERE service_location_id='+QuotedStr(SvcId);

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do  begin
            IsOk:=False;
            StrEMsg:=E.Message;
          end
        end;
        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil Menghapus Menu','Menu',MB_OK or MB_ICONINFORMATION);

          //StrQry:=' SELECT *,COALESCE(phone_no1,'')'+Chr(39)+','+Chr(39)+'COALESCE(phone_no2,'') AS phone FROM wh_service_location;';
          //ViewData(StrQry,StrGrid);


        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menghapus Menu'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg),'Menu',MB_OK or MB_ICONERROR);
        end;
        Main.CloseDb;
      end;
      Qry.Destroy;
    end;
    if IsOk then begin
      LoadData;
      //RefreshList;
    end;
  end;
end;



procedure TBengkelEksternalList.StrGridDblClick(Sender: TObject);
begin
  //BengkelEksternalForm:=TBengkelEksternalForm.Create(Self,StrGrid.Cells[0,IntRow]);

  //Perbaikan 18 JUNI 2013
  //DELETE DATA
  if (RightStr(IntToStr(TreeTag),2)='02') then begin
  
    //AskDelete(StrGrid.Cells[0,IntRow],StrGrid.Cells[1,IntRow]);

  end else
  if (RightStr(IntToStr(TreeTag),2)='03') then begin
     //ShowMessage(StrGrid.Cells[0,IntRow]);
     //UPDATE DATA
     BengkelEksternalForm:=TBengkelEksternalForm.Create(Self,StrGrid.Cells[0,IntRow],'U',True);

  end;




end;

procedure TBengkelEksternalList.CariChange(Sender: TObject);
var Count,Count2,Count3,Count4:Integer;
    IsTrue:Boolean;
begin
  //18 JUNI 2013
  if Trim(Cari.Text)<>'' then begin
    //Init;
    Count2:=2;
    for Count:=0 to Length(SvcArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 5 do
      if (StrPos(PChar(UpperCase(SvcArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          StrGrid.RowCount:=Count2;
          for Count4:=0 to 5 do
          StrGrid.Cells[Count4,Count2-1]:=SvcArr[Count][Count4];
          Inc(Count2);
      end;
    end;
  end else
  RefreshList;


end;

end.
