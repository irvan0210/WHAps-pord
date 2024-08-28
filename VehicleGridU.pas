unit VehicleGridU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Jpeg, WHUnit, CheckLst;

type
  TVehicleGrid = class(TForm)
    GroupPicture: TGroupBox;
    Selesai: TButton;
    GroupGrid: TGroupBox;
    Tampilkan: TButton;
    GridList: TCheckListBox;
    VhcImage: TImage;
    Simpan: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TampilkanClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
  private
    { Private declarations }
    VehicleTypeId:String;
    IsChecking:Boolean;
    IsReadOnly:Boolean;
    ViewSide:Integer;
    GridArr:Array of TArrString2;
    procedure Init;
    procedure LoadData;
    procedure CheckGrid;
    procedure RefreshGrid;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;VehicleType_Id:String;View_Side:Integer;IsRead_Only:Boolean=False);Overload;
  end;

var
  VehicleGrid: TVehicleGrid;

implementation

uses MainU, ADODB, DB, StrUtils;

{$R *.dfm}

constructor TVehicleGrid.Create(AOwner:TComponent;VehicleType_Id:String;View_Side:Integer;IsRead_Only:Boolean=False);
begin
  VehicleTypeId:=VehicleType_Id;
  ViewSide:=View_Side;
  IsReadOnly:=IsRead_Only;
  Main.WriteLog('Form Open: VehicleGrid='+VehicleType_Id+','+IntToStr(View_Side)+','+BoolToStr(IsRead_Only),1);
  inherited Create(AOwner);
end;

procedure TVehicleGrid.Init;
var IntCount,IntCount2:Integer;
begin
  case ViewSide of
    1:begin
        GroupPicture.Caption:='BluePrint Dalam Armada';
//        GroupPicture.Width:=251;
//        GroupPicture.Height:=481;
        VhcImage.Width:=233;
        VhcImage.Height:=457;
        for IntCount:=1 to 29 do
          for IntCount2:=1 to 14 do
            GridList.Items.Add(Format('%.*d',[2,IntCount2])+','+Format('%.*d',[2,IntCount]))
      end;
    2,3:begin
        if ViewSide=2 then GroupPicture.Caption:='BluePrint Kanan';
        if ViewSide=3 then GroupPicture.Caption:='BluePrint Kiri';
//        GroupPicture.Width:=435;
//        GroupPicture.Height:=201;
        VhcImage.Width:=529;
        VhcImage.Height:=157;
        for IntCount:=1 to 10  do
          for IntCount2:=1 to 33 do
            GridList.Items.Add(Format('%.*d',[2,IntCount2])+','+Format('%.*d',[2,IntCount]))
      end;
    4,5:begin
        if ViewSide=4 then GroupPicture.Caption:='BluePrint Depan';
        if ViewSide=5 then GroupPicture.Caption:='BluePrint Belakang';
//        GroupPicture.Width:=179;
//        GroupPicture.Height:=201;
        VhcImage.Width:=137;
        VhcImage.Height:=177;
        for IntCount:=1 to 11  do
          for IntCount2:=1 to 9 do
            GridList.Items.Add(Format('%.*d',[2,IntCount2])+','+Format('%.*d',[2,IntCount]))
      end;
  end;
end;
procedure TVehicleGrid.LoadData;
var StmImage:TMemoryStream;
    JPG:TJPEGImage;
    Qry:TADOQuery;
    StrQry:String;
    IntCount:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    StrQry:='SELECT * FROM wh_vhc_type_detail_image WHERE (vhc_type_detail_image_type_id='+QuotedStr(VehicleTypeId)+') AND (vhc_image_type_id='+IntToStr(ViewSide)+') ORDER BY vhc_type_detail_image_id DESC;';
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    try
      StmImage:=TMemoryStream.Create;
      TBlobField(Qry.FieldByName('vhc_image')).SaveToStream(StmImage);
      if StmImage.Size > 0 then begin
        JPG:=TJPEGImage.Create;
        StmImage.Position := 0;
        JPG.LoadFromStream(StmImage);
        VhcImage.Picture.Assign(JPG);
        VhcImage.Stretch:=True;
      end;
    except
      on E: EInvalidGraphic do begin
        ShowMessage('Image file is corrupted.')
      end;
    end;
    Qry.Close;
    StrQry:='SELECT * FROM wh_vhc_type_detail_grid WHERE (vhc_type_detail_image_type_id='+QuotedStr(VehicleTypeId)+') AND (vhc_image_type_id='+IntToStr(ViewSide)+');';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    IntCount:=0;
    SetLength(GridArr,Qry.RecordCount);
    if Qry.RecordCount>0 then while not(Qry.Eof) do begin
      GridArr[IntCount][0]:=Qry.FieldValues['grid_x'];
      GridArr[IntCount][1]:=Qry.FieldValues['grid_y'];
      Qry.Next;
      Inc(IntCount)
    end;
    Qry.Close;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleGrid.RefreshGrid;
var IntCount,IntCount2:Integer;
    IsMatch:Boolean;
    X,Y:String;
begin
  Main.M_Busy;
  for IntCount:=0 to Length(GridArr)-1 do begin
    IntCount2:=0;
    IsMatch:=False;
    X:=GridArr[IntCount][0];
    Y:=GridArr[IntCount][1];
    X:=Format('%.*d',[2,StrToInt(X)]);
    Y:=Format('%.*d',[2,StrToInt(Y)]);
    repeat
      if (X+','+Y)=GridList.Items.Strings[IntCount2] then begin
        GridList.Checked[IntCount2]:=True;
        IsMatch:=True;
      end;
      Inc(IntCount2);
    until (IntCount2>=GridList.Items.Count) or (IsMatch)
  end;
  Main.M_Normal;
  CheckGrid;
end;

procedure TVehicleGrid.SelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TVehicleGrid.FormShow(Sender: TObject);
begin
  Init;
  LoadData;
  RefreshGrid;
  IsChecking:=False;
  if IsReadOnly then DisableInput;
end;

procedure TVehicleGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TVehicleGrid.CheckGrid;
var IntCount,X,Y:Integer;
    Chk:TCheckBox;
begin
  Main.M_Busy;
  IsChecking:=True;
  IntCount:=0;
  repeat
    if Self.Components[IntCount] is TCheckBox then Self.Components[IntCount].Free
    else Inc(IntCount);
  until IntCount>=Self.ComponentCount;
  for IntCount:=0 to GridList.Items.Count-1 do begin
    if GridList.Checked[IntCount]=True then begin
      Chk:=TCheckBox.Create(Self);
      Chk.Parent:=GroupPicture;
      Chk.Caption:=GridList.Items.Strings[IntCount];
      X:=StrToInt(LeftStr(GridList.Items.Strings[IntCount],2));
      Y:=StrToInt(RightStr(GridList.Items.Strings[IntCount],2));
      Chk.Left:=((X*16)-16)+8;
      Chk.Top:=Y*16;
      Chk.Width:=16;
      Chk.Color:=clRed;
    end;
  end;
  IsChecking:=False;
  Main.M_Normal;
end;

procedure TVehicleGrid.TampilkanClick(Sender: TObject);
begin
  If not(IsChecking) then CheckGrid;
end;

procedure TVehicleGrid.SimpanClick(Sender: TObject);
var IntCount,X,Y:Integer;
    Qry:TADOQuery;
    StrQry,StrMsg:String;
    IsOk:Boolean;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    DisableInput;
    Main.TransStart;
    StrQry:='DELETE FROM wh_vhc_type_detail_grid WHERE vhc_type_detail_image_type_id='+QuotedStr(VehicleTypeId)+' AND (vhc_image_type_id='+IntToStr(ViewSide)+');';
    Main.WriteLog('SQL :'+StrQry,4);
    Qry.SQL.Add(StrQry);
    try
      Qry.ExecSQL;
    except
      on E:Exception do begin
        IsOk:=False;
        StrMsg:=E.Message;
      end;
    end;
    for IntCount:=0 to GridList.Items.Count-1 do begin
      if GridList.Checked[IntCount]=True then begin
        X:=StrToInt(LeftStr(GridList.Items.Strings[IntCount],2));
        Y:=StrToInt(RightStr(GridList.Items.Strings[IntCount],2));
        StrQry:='INSERT INTO wh_vhc_type_detail_grid (vhc_type_detail_image_type_id,vhc_image_type_id,grid_x,grid_y,update_time,update_user) '+
                'VALUES ('+QuotedStr(VehicleTypeId)+','+IntToStr(ViewSide)+','+IntToStr(X)+','+IntToStr(Y)+',GETDATE(),'+QuotedStr(User)+');';
        Qry.SQL.Clear;
        Main.WriteLog('SQL :'+StrQry,4);
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except
          on E:Exception do begin
            IsOk:=False;
            StrMsg:=E.Message;
          end;
        end;
      end;
    end;
    if IsOk then begin
      Main.TransCommit;
      MessageBox(0,'Berhasil menyimpan Grid Armada','Grid Armada',MB_OK or MB_ICONINFORMATION);
    end else begin
      Main.TransRollback;
      EnableInput;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+Chr(13)+StrMsg),'Grid Armada',MB_OK or MB_ICONERROR);
    end;
  end;
  FreeAndNil(Qry);
  Main.CloseDb;
  Main.M_Normal;
end;

procedure TVehicleGrid.DisableInput;
begin
  GroupGrid.Enabled:=False;
  Tampilkan.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TVehicleGrid.EnableInput;
begin
  GroupGrid.Enabled:=True;
  Tampilkan.Enabled:=True;
  Simpan.Enabled:=True;
end;

end.
