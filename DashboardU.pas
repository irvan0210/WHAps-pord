unit DashboardU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WHUnit, ADODB;

type
  TDashboard = class(TForm)
    TotalPesanan: TLabel;
    UtilisasiHarian: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;
    procedure Clear;
  end;

var
  Dashboard: TDashboard;

implementation

uses MainU;

{$R *.dfm}


procedure TDashboard.RefreshData;
var Qry:TADOQuery;
    Conn:TADOConnection;
    StrQry,Values:String;
    IsOk:Boolean;
begin
    if Main.IsDashboard=True then begin
      Conn:=TADOConnection.Create(Self);
      Conn.ConnectionString:=StrConnection;
      Conn.LoginPrompt:=False;
      try
        Main.WriteLog('Dashboard: Open Connection');
        Conn.Open;
      except
        on E:Exception do begin
          IsOk:=False;
          Main.WriteLog('Dashboard: Cannot Open Connection');
        end;
      end;
      if IsOk then begin
        Qry:=TADOQuery.Create(Self);
        Qry.Connection:=Conn;
        StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('total_sales')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+Main.ThisMonth+')AND(year='+Main.ThisYear+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          Values:=Qry.FieldValues['value'];
          TotalPesanan.Caption:='Sales '+ShortMonthNames[StrToInt(Main.ThisMonth)]+' '+Main.ThisYear+' : '+IToCurr(StrToInt64(Values));
        end;
       Qry.Close;
        StrQry:='SELECT value FROM wh_dashboard WHERE (name='+QuotedStr('persen_utilisasi')+')AND(company_id='+CompanyId+')AND(location_id='+LocationId+')AND(month='+Main.ThisMonth+')AND(year='+Main.ThisYear+');';
        Qry.SQL.Clear;
        Qry.SQL.Add(StrQry);
        Qry.Open;
        if Qry.RecordCount>0 then begin
          Values:=Qry.FieldValues['value'];
          UtilisasiHarian.Caption:='Utilisasi RD '+ShortMonthNames[StrToInt(Main.ThisMonth)]+' '+Main.ThisYear+' : '+Values;
        end;
        Qry.Close;
        FreeAndNil(Qry);
      end;
      Conn.Close;
      FreeAndNil(Conn);
    end;
end;

procedure TDashboard.Clear;
begin
  TotalPesanan.Caption:='';
  UtilisasiHarian.Caption:='';
end;

end.
