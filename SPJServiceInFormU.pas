unit SPJServiceInFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Mask, WHUnit, ADODB, Math;

type
  TSPJServiceInForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    NoBodi: TComboBox;
    GroupBox2: TGroupBox;
    RitAwal: TMaskEdit;
    DropAwal: TMaskEdit;
    KMArgoAwal: TMaskEdit;
    KMOrdoAwal: TMaskEdit;
    GroupAkhir: TGroupBox;
    RitAkhir: TEdit;
    DropAkhir: TEdit;
    KMArgoAkhir: TEdit;
    KMOrdoAkhir: TEdit;
    GroupBox6: TGroupBox;
    RitTotal: TMaskEdit;
    DropTotal: TMaskEdit;
    KMArgoTotal: TMaskEdit;
    KMOrdoTotal: TMaskEdit;
    BBMGasTotal: TMaskEdit;
    Panel1: TPanel;
    NoPolisi: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    GroupBBMGas: TGroupBox;
    BBMRupiah: TEdit;
    GasRupiah: TEdit;
    GroupBox5: TGroupBox;
    BBMLiter: TEdit;
    GasLiter: TEdit;
    GroupSPJ: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    GridSPJ: TStringGrid;
    Cari: TEdit;
    UnitJalan: TEdit;
    Selesai: TButton;
    Simpan: TButton;
    Label2: TLabel;
    Pengemudi: TEdit;
    KMArgoIsiAwal: TMaskEdit;
    KmArgoIsiAkhir: TEdit;
    Label10: TLabel;
    KMArgoIsiTotal: TMaskEdit;
    SPBBatalJalan: TCheckBox;
    GroupKeterangan: TGroupBox;
    Keterangan: TMemo;
    Bersihkan: TButton;
    procedure SelesaiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSPJSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NoBodiChange(Sender: TObject);
    procedure CariChange(Sender: TObject);
    procedure NoBodiKeyPress(Sender: TObject; var Key: Char);
    procedure RitAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure DropAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure KMArgoAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure KmArgoIsiAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure RitAkhirEnter(Sender: TObject);
    procedure RitAkhirExit(Sender: TObject);
    procedure DropAkhirEnter(Sender: TObject);
    procedure KMArgoAkhirEnter(Sender: TObject);
    procedure KmArgoIsiAkhirEnter(Sender: TObject);
    procedure KMOrdoAkhirEnter(Sender: TObject);
    procedure KMOrdoAkhirKeyPress(Sender: TObject; var Key: Char);
    procedure BBMRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure GasRupiahKeyPress(Sender: TObject; var Key: Char);
    procedure SPBBatalJalanKeyPress(Sender: TObject; var Key: Char);
    procedure BBMRupiahEnter(Sender: TObject);
    procedure GasRupiahEnter(Sender: TObject);
    procedure DropAkhirExit(Sender: TObject);
    procedure KMArgoAkhirExit(Sender: TObject);
    procedure KmArgoIsiAkhirExit(Sender: TObject);
    procedure KMOrdoAkhirExit(Sender: TObject);
    procedure BBMRupiahExit(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure BersihkanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SPBBatalJalanClick(Sender: TObject);
    procedure GasRupiahExit(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure RefreshCombo;
    procedure InitGridVhc;
    procedure RefreshGridVhc;
    procedure CheckData;
    procedure DisableInput;
    procedure EnableInput;
  public
    { Public declarations }
  end;

var
  SPJServiceInForm: TSPJServiceInForm;
  VhcArr:Array Of TArrString14;
  TransId,Tanggal,Jam:String;
  BBMPerLiter,GasPerLiter,PerRit,PerDrop:Integer;

implementation

uses MainU, RePrintFormU, AuthorizedFormU;

{$R *.dfm}

procedure TSPJServiceInForm.Init;
begin
  NoBodi.Items.Clear;
  NoBodi.ItemIndex:=0;
  NoPolisi.Text:='';
  RitAwal.Text:='0';
  DropAwal.Text:='0';
  KMArgoAwal.Text:='0';
  KMArgoIsiAwal.Text:='0';
  KMOrdoAwal.Text:='0';
  RitAkhir.Text:='';
  DropAkhir.Text:='';
  KMArgoAkhir.Text:='';
  KmArgoIsiAkhir.Text:='';
  KMOrdoAkhir.Text:='';
  RitTotal.Text:='0';
  DropTotal.Text:='0';
  KMArgoTotal.Text:='0';
  KMArgoIsiTotal.Text:='0';
  KMOrdoTotal.Text:='0';
  BBMRupiah.Text:='';
  GasRupiah.Text:='';
  BBMLiter.Text:='0';
  GasLiter.Text:='0';
  BBMGasTotal.Text:='0';
  InitGridVhc;
  EnableInput;
end;

procedure TSPJServiceInForm.RefreshCombo;
var QStr:String;
    Qry:TADOQuery;
    Count:Integer;
begin
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  if Main.OpenDb then begin
    QStr:='EXEC GetVhcOutList2 '+LocationId+',2,3,1,@Order='+QuotedStr('body_id')+'; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    Count:=0;
    SetLength(VhcArr,Qry.RecordCount);
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      VhcArr[Count][1]:=Qry.FieldValues['body_id'];
      VhcArr[Count][2]:=Qry.FieldValues['license_plate'];
      VhcArr[Count][3]:=Qry.FieldValues['driver_id'];
      VhcArr[Count][4]:=Qry.FieldValues['out_date'];
      VhcArr[Count][5]:=Qry.FieldValues['out_time'];
      VhcArr[Count][6]:=Qry.FieldValues['out_rits'];
      VhcArr[Count][7]:=Qry.FieldValues['out_drops'];
      VhcArr[Count][8]:=Qry.FieldValues['out_argo_km'];
      VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
    QStr:='EXEC GetVhcOutList2 '+LocationId+',3,3,@Order='+QuotedStr('body_id')+'; ';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    SetLength(VhcArr,Qry.RecordCount+Length(VhcArr));
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      VhcArr[Count][0]:=Qry.FieldValues['vhc_trans_id'];
      VhcArr[Count][1]:=Qry.FieldValues['body_id'];
      VhcArr[Count][2]:=Qry.FieldValues['license_plate'];
      VhcArr[Count][3]:=Qry.FieldValues['driver_id'];
      VhcArr[Count][4]:=Qry.FieldValues['out_date'];
      VhcArr[Count][5]:=Qry.FieldValues['out_time'];
      VhcArr[Count][6]:=Qry.FieldValues['out_rits'];
      VhcArr[Count][7]:=Qry.FieldValues['out_drops'];
      VhcArr[Count][8]:=Qry.FieldValues['out_argo_km'];
      VhcArr[Count][9]:=Qry.FieldValues['out_ordo_km'];
      Inc(Count);
      Qry.Next;
    end;
    QStr:='SELECT TOP 1 * FROM wh_price WHERE GETDATE() BETWEEN from_date and to_date;';
    Qry.SQL.Clear;
    Qry.SQL.Add(QStr);
    Qry.Open;
    if (Qry.RecordCount>0) then begin
      BBMPerLiter:=Qry.FieldValues['fuel_price_litre'];
      GasPerLiter:=Qry.FieldValues['gas_price_litre'];
    end;
    Qry.Close;
  end;
  Qry.Destroy;
  Main.CloseDb;
  Main.M_Normal;
  Main.StatusUpdate('BBM : '+IntToStr(BBMPerLiter)+'/Ltr, Gas : '+IntToStr(GasPerLiter)+'/Ltr','');
  UnitJalan.Text:=IntToStr(Length(VhcArr));
  RefreshGridVhc;
end;

procedure TSPJServiceInForm.InitGridVhc;
begin
  GridSPJ.Cells[0,0]:='No SPJ';
  GridSPJ.Cells[1,0]:='No Body';
  GridSPJ.Cells[2,0]:='Pengemudi';
  GridSPJ.Cells[3,0]:='Tanggal';
  GridSPJ.Cells[4,0]:='Jam';
  GridSPJ.Cells[0,1]:='';
  GridSPJ.Cells[1,1]:='';
  GridSPJ.Cells[2,1]:='';
  GridSPJ.Cells[3,1]:='';
  GridSPJ.Cells[4,1]:='';
  GridSPJ.Cells[5,1]:='';
end;

procedure TSPJServiceInForm.RefreshGridVhc;
var Count:Integer;
begin
  if Length(VhcArr)>0 then begin
    GridSPJ.RowCount:=Length(VhcArr)+1;
    for Count:=0 to Length(VhcArr)-1 do begin
      NoBodi.Items.Add(VhcArr[Count][1]);
      GridSPJ.Cells[0,Count+1]:=VhcArr[Count][0];
      GridSPJ.Cells[1,Count+1]:=VhcArr[Count][1];
      GridSPJ.Cells[2,Count+1]:=VhcArr[Count][3];
      GridSPJ.Cells[3,Count+1]:=VhcArr[Count][4];
      GridSPJ.Cells[4,Count+1]:=VhcArr[Count][5];
    end;
  end;
end;

procedure TSPJServiceInForm.SelesaiClick(Sender: TObject);
begin
  SPJServiceInForm.Close;
end;

procedure TSPJServiceInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Main.StatusUpdate('','');
  Action:=caFree;
end;

procedure TSPJServiceInForm.GridSPJSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (Trim(GridSPJ.Cells[1,ARow])<>'')  then begin
    TransId:=GridSPJ.Cells[0,ARow];
    NoBodi.ItemIndex:=NoBodi.Items.IndexOf(GridSPJ.Cells[1,ARow]);
    CheckData;
    RitAkhir.SetFocus;
  end;
end;

procedure TSPJServiceInForm.CheckData;
begin
  TransId:=VhcArr[NoBodi.ItemIndex][0];
  Pengemudi.Text:=VhcArr[NoBodi.ItemIndex][3];
  NoPolisi.Text:=VhcArr[NoBodi.ItemIndex][2];
  RitAwal.Text:=SToCurr(VhcArr[NoBodi.ItemIndex][6]);
  DropAwal.Text:=SToCurr(VhcArr[NoBodi.ItemIndex][7]);
  KMArgoAwal.Text:=SToCurr(VhcArr[NoBodi.ItemIndex][8]);
  KMOrdoAwal.Text:=SToCurr(VhcArr[NoBodi.ItemIndex][9]);
end;

procedure TSPJServiceInForm.NoBodiChange(Sender: TObject);
begin
  if NoBodi.Text<>'' then begin
    CheckData;
  end;
end;

procedure TSPJServiceInForm.CariChange(Sender: TObject);
var Count,Count2,Count3:Integer;
    IsTrue:Boolean;
begin
  if (Trim(Cari.Text)<>'') then begin
    InitGridVhc;
    Count2:=2;
    for Count:=0 to Length(VhcArr)-1 do begin
      IsTrue:=False;
      for Count3:=0 to 14 do
        if (StrPos(PChar(UpperCase(VhcArr[Count][Count3])),PChar(UpperCase(Cari.Text)))<>nil) then IsTrue:=True;
      if IsTrue then begin
          GridSPJ.RowCount:=Count2;
          GridSPJ.Cells[0,Count2-1]:=VhcArr[Count][0];
          GridSPJ.Cells[1,Count2-1]:=VhcArr[Count][1];
          GridSPJ.Cells[2,Count2-1]:=VhcArr[Count][3];
          GridSPJ.Cells[3,Count2-1]:=VhcArr[Count][4];
          GridSPJ.Cells[4,Count2-1]:=VhcArr[Count][5];
          Inc(Count2);
      end;
    end;
  end else
    RefreshGridVhc;
end;

procedure TSPJServiceInForm.NoBodiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then RitAkhir.SetFocus;
end;

procedure TSPJServiceInForm.RitAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then DropAkhir.SetFocus;
end;

procedure TSPJServiceInForm.DropAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMArgoAkhir.SetFocus;
end;

procedure TSPJServiceInForm.KMArgoAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KmArgoIsiAkhir.SetFocus;
end;

procedure TSPJServiceInForm.KmArgoIsiAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then KMOrdoAkhir.SetFocus;
end;

procedure TSPJServiceInForm.RitAkhirEnter(Sender: TObject);
begin
  RitAkhir.Text:=ToString(RitAkhir.Text);
end;

procedure TSPJServiceInForm.RitAkhirExit(Sender: TObject);
begin
  if ToString(RitAkhir.Text)='' then RitAkhir.Text:='0';
  RitAkhir.Text:=SToCurr(ToString(RitAkhir.Text));
  if ((Trim(RitAwal.Text)<>'') AND (Trim(RitAkhir.Text)<>'')) then begin
    RitTotal.Text:=IToCurr(SToInt(RitAkhir.Text)-SToInt(RitAwal.Text));
  end;
end;

procedure TSPJServiceInForm.DropAkhirEnter(Sender: TObject);
begin
  DropAkhir.Text:=ToString(DropAkhir.Text);
end;

procedure TSPJServiceInForm.KMArgoAkhirEnter(Sender: TObject);
begin
  KMArgoAkhir.Text:=ToString(KMArgoAkhir.Text);
end;

procedure TSPJServiceInForm.KmArgoIsiAkhirEnter(Sender: TObject);
begin
  KmArgoIsiAkhir.Text:=ToString(KmArgoIsiAkhir.Text);
end;

procedure TSPJServiceInForm.KMOrdoAkhirEnter(Sender: TObject);
begin
  KMOrdoAkhir.Text:=ToString(KMOrdoAkhir.Text);
end;

procedure TSPJServiceInForm.KMOrdoAkhirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then BBMRupiah.SetFocus;
end;

procedure TSPJServiceInForm.BBMRupiahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then GasRupiah.SetFocus;

end;

procedure TSPJServiceInForm.GasRupiahKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(Key In ['0'..'9',#8,#13]) then Key:=#0;
  if Key=#13 then SPBBatalJalan.SetFocus;
end;

procedure TSPJServiceInForm.SPBBatalJalanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Simpan.SetFocus;

end;

procedure TSPJServiceInForm.BBMRupiahEnter(Sender: TObject);
begin
  BBMRupiah.Text:=ToString(BBMRupiah.Text);
end;

procedure TSPJServiceInForm.GasRupiahEnter(Sender: TObject);
begin
  GasRupiah.Text:=ToString(GasRupiah.Text);

end;

procedure TSPJServiceInForm.DropAkhirExit(Sender: TObject);
begin
  if ToString(DropAkhir.Text)='' then DropAkhir.Text:='0';
  DropAkhir.Text:=SToCurr(ToString(DropAkhir.Text));
  if ((Trim(DropAwal.Text)<>'') AND (Trim(DropAkhir.Text)<>'')) then begin
    DropTotal.Text:=IToCurr(SToInt(DropAkhir.Text)-SToInt(DropAwal.Text));
  end;

end;

procedure TSPJServiceInForm.KMArgoAkhirExit(Sender: TObject);
begin
  if ToString(KMArgoAkhir.Text)='' then KMArgoAkhir.Text:='0';
  KMArgoAkhir.Text:=SToCurr(ToString(KMArgoAkhir.Text));
  if ((Trim(KMArgoAwal.Text)<>'') AND (Trim(KMArgoAkhir.Text)<>'')) then begin
    KMArgoTotal.Text:=IToCurr(SToInt(KMArgoAkhir.Text)-SToInt(KMArgoAwal.Text));
  end;
end;

procedure TSPJServiceInForm.KmArgoIsiAkhirExit(Sender: TObject);
begin
  if ToString(KmArgoIsiAkhir.Text)='' then KmArgoIsiAkhir.Text:='0';
  KmArgoIsiAkhir.Text:=SToCurr(ToString(KmArgoIsiAkhir.Text));
  if ((Trim(KMArgoIsiAwal.Text)<>'') AND (Trim(KmArgoIsiAkhir.Text)<>'')) then begin
    KMArgoIsiTotal.Text:=IToCurr(SToInt(KmArgoIsiAkhir.Text)-SToInt(KMArgoIsiAwal.Text));
  end;

end;

procedure TSPJServiceInForm.KMOrdoAkhirExit(Sender: TObject);
begin
  if ToString(KMOrdoAkhir.Text)='' then KMOrdoAkhir.Text:='0';
  KMOrdoAkhir.Text:=SToCurr(ToString(KMOrdoAkhir.Text));
  if ((Trim(KMOrdoAwal.Text)<>'') AND (Trim(KMOrdoAkhir.Text)<>'')) then begin
    KMOrdoTotal.Text:=IToCurr(SToInt(KMOrdoAkhir.Text)-SToInt(KMOrdoAwal.Text));
  end;

end;

procedure TSPJServiceInForm.BBMRupiahExit(Sender: TObject);
begin
  if ToString(BBMRupiah.Text)='' then BBMRupiah.Text:='0';
  BBMRupiah.Text:=SToCurr(BBMRupiah.Text);
  if ToString(BBMRupiah.Text)<>'' then begin
    BBMLiter.Text:=IToCurr(RoundTo(SToInt(BBMRupiah.Text)/BBMPerLiter,-2));
  end;
end;

procedure TSPJServiceInForm.SimpanClick(Sender: TObject);
var QStr,StrEMessage,StrMsg,StrBatalJalan:String;
    Qry:TADOQuery;
    IsOk,IsAuth:Boolean;
    InRits,InDrops,InArgoKM,InOrdoKM,FuelPrice,FuelLitre,GasPrice,GasLitre:String;
    InArgoKMIsi:String;
    Count:Integer;
begin
  IsOk:=True;
  IsAuth:=False;
  AuthorizedForm.FormId:=IntToStr(TreeTag);
  if (SPBBatalJalan.Checked) then begin
    if (MessageBox(0,'Mau Membatalkan SPB?'+Chr(13)+Chr(13)+' Otorisasi Pembatalan SPB?','SPB',MB_OKCANCEL or MB_ICONQUESTION)=1) then
      if (AuthorizedForm.ShowModal=1) then IsAuth:=True;
  end else begin
      IsAuth:=True;
  end;
  if ( (ToString(KMOrdoAkhir.Text)<>'') AND (ToString(KMOrdoTotal.Text)<>'') AND (SPBBatalJalan.Checked=False ) )
      OR ( (ToString(KMOrdoTotal.Text)<>'') AND (SPBBatalJalan.Checked) AND (IsAuth))then begin
    Qry:=TADOQuery.Create(Self);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      Main.TransStart;
      InRits:=ToString(RitAkhir.Text);
      InDrops:=ToString(DropAkhir.Text);
      InArgoKM:=ToString(KMArgoAkhir.Text);
      InArgoKMIsi:=ToString(KMArgoIsiAkhir.Text);
      InOrdoKM:=ToString(KMOrdoAkhir.Text);
      FuelPrice:=ToString(BBMRupiah.Text);
      FuelLitre:=StringReplace(ToString(BBMLiter.Text),',','.',[rfReplaceAll]);
      if ToString(GasRupiah.Text)<>'' then GasPrice:=ToString(GasRupiah.Text)
      else GasPrice:='0';
      GasLitre:=StringReplace(ToString(GasLiter.Text),',','.',[rfReplaceAll]);
      if SPBBatalJalan.Checked then StrBatalJalan:=',cancel=1' else StrBatalJalan:='';
      QStr:='UPDATE wh_vhc_trans SET in_time=GETDATE(),in_date=GETDATE(),in_user='+Chr(39)+User+Chr(39)+
            ',in_rits='+InRits+',in_drops='+InDrops+',in_argo_km='+InArgoKM+',in_ordo_km='+InOrdoKM+
            ',in_hired_km='+InArgoKMIsi+',fuel_price='+FuelPrice+',fuel_litre='+FuelLitre+',gas_price='+GasPrice+
            ',gas_litre='+GasLitre+StrBatalJalan+
            ',update_time=GETDATE(),update_user='+Chr(39)+User+Chr(39)+' '+
            'WHERE vhc_trans_id='+Chr(39)+TransId+Chr(39)+';';
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      try
        Qry.ExecSQL;
      except
        on E:Exception do begin
          StrEMessage:=E.Message;
          IsOk:=False;
        end;
      end;
    end else begin
      IsOk:=False;
      StrMsg:='Kolom disetor Tidak boleh Kosong';
    end;
    if IsOk then begin
      DisableInput;
      Main.TransCommit;
      MessageBox(0,'SPB Berhasil Ditutup','SPB Service/Test',MB_OK or MB_ICONINFORMATION);
    end else begin
      Main.TransRollback;
      MessageBox(0,PChar(StrMsg+Chr(13)+Chr(13)+'Kesalahan:'+StrEMessage),'Kasir',MB_OK or MB_ICONWARNING);
    end;
    Qry.Close;
  end;
  Main.CloseDb;
end;

procedure TSPJServiceInForm.DisableInput;
begin
  NoBodi.Enabled:=False;
  GroupAkhir.Enabled:=False;
  GroupBBMGas.Enabled:=False;
  GroupKeterangan.Enabled:=False;
  GroupSPJ.Enabled:=False;
  Simpan.Enabled:=False;
end;

procedure TSPJServiceInForm.EnableInput;
begin
  NoBodi.Enabled:=True;
  GroupAkhir.Enabled:=True;
  GroupBBMGas.Enabled:=True;
  GroupKeterangan.Enabled:=True;
  GroupSPJ.Enabled:=True;
  Simpan.Enabled:=True;
end;

procedure TSPJServiceInForm.BersihkanClick(Sender: TObject);
begin
  Init;
  RefreshCombo;
end;

procedure TSPJServiceInForm.FormShow(Sender: TObject);
begin
  Init;
  InitGridVhc;
  RefreshCombo;
end;

procedure TSPJServiceInForm.SPBBatalJalanClick(Sender: TObject);
begin
  if SPBBatalJalan.Checked then begin
    RitAkhir.Text:=RitAwal.Text;
    DropAkhir.Text:=DropAwal.Text;
    KMArgoAkhir.Text:=KMArgoAwal.Text;
    KmArgoIsiAkhir.Text:=KMArgoIsiAwal.Text;
    KMOrdoAkhir.Text:=KMOrdoAwal.Text;
    BBMRupiah.Text:='0';
    GasRupiah.Text:='0';
  end;
end;

procedure TSPJServiceInForm.GasRupiahExit(Sender: TObject);
begin
  if ToString(GasRupiah.Text)='' then GasRupiah.Text:='0';
  GasRupiah.Text:=SToCurr(GasRupiah.Text);
  if ToString(GasRupiah.Text)<>'' then begin
    GasLiter.Text:=IToCurr(RoundTo(SToInt(GasRupiah.Text)/GasPerLiter,-2));
  end;

end;

end.
