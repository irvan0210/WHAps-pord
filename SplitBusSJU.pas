unit SplitBusSJU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,AdoDb;

type
  TSplitBusSJ = class(TForm)
    GroupInput: TPanel;
    btnTombolCari: TSpeedButton;
    out_odo: TEdit;
    NoSJ: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Simpan: TButton;
    Batal: TButton;
    in_odo: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    out_odo_last: TEdit;
    SJLast: TEdit;
    in_odo_last: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SJLIST: TListBox;
    CustomerName: TEdit;
    Label12: TLabel;
    TglJalan: TEdit;
    Label13: TLabel;
    Label11: TLabel;
    jarak: TEdit;
    Label14: TLabel;
    JarakLast: TEdit;
    Label15: TLabel;
    clean: TButton;
    Bersihkan: TButton;
    procedure btnTombolCariClick(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SJLISTDblClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cleanClick(Sender: TObject);
    procedure SJLISTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure out_odoEnter(Sender: TObject);
    procedure out_odoExit(Sender: TObject);
    procedure out_odoKeyPress(Sender: TObject; var Key: Char);
    procedure in_odoEnter(Sender: TObject);
    procedure in_odoExit(Sender: TObject);
    procedure in_odoKeyPress(Sender: TObject; var Key: Char);
    procedure in_odoChange(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
  public
    { Public declarations }
    firstOutOdo, firstInOdo : Integer;
  end;

var
  SplitBusSJ: TSplitBusSJ;

implementation

uses MainU, SPJBusListU, WHUnit, Math;

{$R *.dfm}

procedure TSplitBusSJ.Init;
begin
  NoSJ.Clear;
  CustomerName.Clear;
  TglJalan.Clear;
  out_odo.Clear;
  in_odo.Clear;
  jarak.Clear;

  SJLIST.Clear;
  SJLast.Clear;
  out_odo_last.Clear;
  in_odo_last.Clear;
  JarakLast.Clear;
end;


procedure TSplitBusSJ.btnTombolCariClick(Sender: TObject);
begin
    if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'SplitSJ',0,True, 2);
end;

procedure TSplitBusSJ.BatalClick(Sender: TObject);
begin
    Close;
end;

procedure TSplitBusSJ.SpeedButton1Click(Sender: TObject);
begin
    if Main.IsFormOpen('SPJBusList')=False then SPJBusList:=TSPJBusList.Create(Self,'SplitSJ-SJAdd',0,True, 1);
end;

procedure TSplitBusSJ.SJLISTDblClick(Sender: TObject);
var
  Mystring : string;
  StrList:TStringList;
  IntCount :Byte;
begin
      Mystring:=SJLIST.Items[SJLIST.itemIndex];
      StrList:=TStringList.Create;
      StrList:=SplitStrings(Mystring,'-');
      SJLast.Text := Trim(StrList.Strings[0]);
      out_odo_last.Text := IToCurr(StrToInt(Trim(StrList.Strings[1])));
      
      try
        in_odo_last.Text  := IToCurr(StrToInt(Trim(StrList.Strings[2])));
      except on Exception do
        in_odo_last.Text  := '0';
      end;

      try
        JarakLast.Text := IToCurr(StrToInt(Trim(StrList.Strings[2])) - StrToInt(Trim(StrList.Strings[1])));
      except on Exception do
        jaraklast.Text :='0';
      end;

      FreeAndNil(StrList);

end;

procedure TSplitBusSJ.SimpanClick(Sender: TObject);
var Qry:TADOQuery;
    StrQry,StrQryNoRev,StrMaxId,
    StrDate,StrTime,StrNoSJ,StrNilai,StrEMsg:String;
    StrInOdoBefore, StrOutOdoBefore : String;
    IsOk,IsNoRecord:Boolean;
    IntCount,isStartTopup:Byte;
    IntAvgRadius, IntLastAvgRadius, IntRadius, IntLastOdo, IntFirstOdo : Integer;

    Mystring : string;
    StrList:TStringList;

    VhcTransIdArr, CustomerOrderArr:Array of TArrString1;
begin
  if ((Trim(NoSJ.Text)<>'')) and //((Trim(Nominal.Text)<>'') and (Trim(Nominal.Text)<>'0')) AND
      (Trim(SJLast.Text)<>'') AND (SJLIST.Items.Count>0) then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;

    IsOk:=True;
    IsNoRecord:=True;
    SetLength(VhcTransIdArr,0);
    SetLength(CustomerOrderArr,0);

    if Main.OpenDb then begin
        Main.TransStart;
        StrNoSJ:=Trim(NoSJ.Text);
        StrQry := '';

        IntRadius := StrToInt(ToString(in_odo.Text)) - StrToInt(ToString(out_odo.Text));
        IntAvgRadius := Floor(IntRadius/(SJLIST.Items.Count + 1));
        IntLastAvgRadius := IntRadius - (IntAvgRadius*SJLIST.Items.Count);

        IntFirstOdo := SToInt(ToString(out_odo.Text));
        IntLastOdo  := IntFirstOdo+IntAvgRadius;

        StrQry:=' UPDATE wh_vhc_trans SET '+
                      ' out_ordo_km='+IntToStr(IntFirstOdo)+
                      ',in_ordo_km='+IntToStr(IntLastOdo)+
                      ',update_time=GETDATE() '+
                      ' WHERE (vhc_trans_id='+QuotedStr(NoSJ.Text)+') ;';

        StrMaxId:='REVODO';

        StrOutOdoBefore := IntToStr(firstOutOdo);
        StrInOdoBefore  := IntToStr(firstInOdo);
        StrQry:=StrQry+
                ' INSERT wh_vhc_trans_ordo_rev (vhc_trans_ordo_rev_id,vhc_trans_id, out_ordo_km_before, in_ordo_km_before, out_ordo_km_after, in_ordo_km_after, update_user) '+
                ' VALUES ( '+
                QuotedStr(StrMaxId)+','+
                QuotedStr(NoSJ.Text)+','+QuotedStr(StrOutOdoBefore)+','+QuotedStr(StrInOdoBefore)+','+
                IntToStr(IntFirstOdo)+','+IntToStr(IntLastOdo)+','+
                QuotedStr(User)+
                ' ) '+
                ';';

        for IntCount:=1 to SJLIST.Items.Count do begin
                Mystring:=SJLIST.Items[IntCount-1];
                StrList:=TStringList.Create;
                StrList:=SplitStrings(Mystring,'-');
                StrNoSJ := Trim(StrList.Strings[0]);

                if (StrNoSJ <> SJLast.Text) then begin
                  IntFirstOdo := IntLastOdo + 1;
                  IntLastOdo  := IntFirstOdo+IntAvgRadius;

                  StrQry:=StrQry+' UPDATE wh_vhc_trans SET '+
                          ' out_ordo_km='+IntToStr(IntFirstOdo)+
                          ',in_ordo_km='+IntToStr(IntLastOdo)+
                          ',update_time=GETDATE() '+
                          ' WHERE (vhc_trans_id='+QuotedStr(StrNoSJ)+') ;';

                  StrMaxId:='REVODO';

                  StrOutOdoBefore := ToString(Trim(StrList.Strings[1]));
                  StrInOdoBefore  := ToString(Trim(StrList.Strings[2]));
                  StrQry:=StrQry+
                          ' INSERT wh_vhc_trans_ordo_rev (vhc_trans_ordo_rev_id,vhc_trans_id, out_ordo_km_before, in_ordo_km_before, out_ordo_km_after, in_ordo_km_after, update_user) '+
                          ' VALUES ( '+
                          QuotedStr(StrMaxId)+','+
                          QuotedStr(StrNoSJ)+','+QuotedStr(StrOutOdoBefore)+','+QuotedStr(StrInOdoBefore)+','+
                          IntToStr(IntFirstOdo)+','+IntToStr(IntLastOdo)+','+
                          QuotedStr(User)+
                          ' ) '+
                          ';';

                end;
        end;
        (* Last SJ *)
        IntFirstOdo := IntLastOdo  + 1;
        IntLastOdo  := IntFirstOdo + IntLastAvgRadius;
        StrQry:=StrQry+' UPDATE wh_vhc_trans SET '+
                       ' out_ordo_km='+IntToStr(IntFirstOdo)+
                       ',in_ordo_km='+IntToStr(IntLastOdo)+
                       ',update_time=GETDATE() '+
                       ' WHERE (vhc_trans_id='+QuotedStr(SJLast.Text)+') ;';

        StrMaxId:='REVODO';

        StrOutOdoBefore := ToString(Trim(out_odo_last.Text));
        StrInOdoBefore  := ToString(Trim(in_odo_last.Text));
        StrQry:=StrQry+
                ' INSERT wh_vhc_trans_ordo_rev (vhc_trans_ordo_rev_id,vhc_trans_id, out_ordo_km_before, in_ordo_km_before, out_ordo_km_after, in_ordo_km_after, update_user) '+
                ' VALUES ( '+
                QuotedStr(StrMaxId)+','+
                QuotedStr(SJLast.Text)+','+QuotedStr(StrOutOdoBefore)+','+QuotedStr(StrInOdoBefore)+','+
                IntToStr(IntFirstOdo)+','+IntToStr(IntLastOdo)+','+
                QuotedStr(User)+
                          ' ) '+
                          ';';

        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        try
          Qry.ExecSQL;
        except on E:Exception do  begin
                    IsOk:=False;
                    StrEMsg:=E.Message;
          end
        end;

        if IsOk then begin
          Main.TransCommit;
          MessageBox(0,'Berhasil menyimpan data', 'Split KM Surat Jalan',MB_OK or MB_ICONINFORMATION);
          Close;
        end else begin
          Main.TransRollback;
          StrEMsg:='Gagal Menyimpan Data'+Chr(13)+Chr(13)+'Kesalahan :'+Chr(13)+StrEMsg;
          MessageBox(0,PChar(StrEMsg), 'Split KM Surat Jalan',MB_OK or MB_ICONERROR);
        end;
        FreeAndNil(Qry);

    end;
    Main.CloseDb;
  end else begin
      StrEMsg:='Ada inputan yang belum diisi!!!';
      MessageBox(0,PChar(StrEMsg), 'Split KM Surat Jalan',MB_OK or MB_ICONWARNING);
  end;
      
end;

procedure TSplitBusSJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TSplitBusSJ.cleanClick(Sender: TObject);
begin
      SJLIST.Items.Clear;
end;

procedure TSplitBusSJ.SJLISTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key=127) then begin
        with SJLIST do begin
          if ItemIndex>=0 then
            Items.Delete(ItemIndex);
        end;
    end;
end;

procedure TSplitBusSJ.out_odoEnter(Sender: TObject);
begin
  out_odo.Text:=ToString(out_odo.Text);
end;

procedure TSplitBusSJ.out_odoExit(Sender: TObject);
begin
  if ToString(out_odo.Text)='' then out_odo.Text:='0';
  out_odo.Text:=SToCurr(out_odo.Text);
end;

procedure TSplitBusSJ.out_odoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    in_odo.SetFocus;
  end;
end;

procedure TSplitBusSJ.in_odoEnter(Sender: TObject);
begin
  in_odo.Text:=ToString(in_odo.Text);
end;

procedure TSplitBusSJ.in_odoExit(Sender: TObject);
begin
  if ToString(in_odo.Text)='' then in_odo.Text:='0';
  in_odo.Text:=SToCurr(in_odo.Text);
end;

procedure TSplitBusSJ.in_odoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    jarak.SetFocus;
  end;
end;

procedure TSplitBusSJ.in_odoChange(Sender: TObject);
begin
    try
      jarak.Text:=IToCurr(
                      StrToInt(StringReplace(in_odo.Text, '.', '', [rfReplaceAll]))
                       - StrToInt(StringReplace(out_odo.Text, '.', '', [rfReplaceAll])) );
    except
      on Exception do
        jarak.Text:='';
    end;
end;

procedure TSplitBusSJ.BersihkanClick(Sender: TObject);
begin
    Init;
end;

end.
