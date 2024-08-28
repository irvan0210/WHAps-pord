unit CommissionsOrderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WHUnit, ADODB, Db;

type
  TCommissionsOrderForm = class(TForm)
    GroupHeader: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LabelSegment1: TLabel;
    Label24: TLabel;
    Panel1: TPanel;
    CustomerId: TEdit;
    CustomerDisp: TEdit;
    PanelCariCustomer: TPanel;
    CariCustomer: TSpeedButton;
    JnsKomisi: TComboBox;
    TipeKomisi: TComboBox;
    JenisNilaiKomisi: TComboBox;
    Label1: TLabel;
    PanelVhc: TPanel;
    BBamount: TEdit;
    Label21: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MBamount: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    MVamount: TEdit;
    Label8: TLabel;
    procedure CariCustomerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CommissionArr,CommissionTypeArr,CommissionTypeAmountArr : Array of TArrString4;

    procedure Init;
    procedure RefreshCombo;
  public
    { Public declarations }
  end;

var
  CommissionsOrderForm: TCommissionsOrderForm;

implementation

uses OrderListU, MainU;

{$R *.dfm}

procedure TCommissionsOrderForm.Init;
begin

  CustomerId.Text:='';
  CustomerDisp.Text:='';
  JnsKomisi.ItemIndex := -1;
  TipeKomisi.ItemIndex := -1;
  JenisNilaiKomisi.ItemIndex := -1;
  PanelVhc.Visible := False;

  BBamount.Text:='';
  MBamount.Text:='';
  MVamount.Text:='';

end;

procedure TCommissionsOrderForm.RefreshCombo;
var StrQry:String;
    Qry:TADOQuery;
    Count,IntCount2:Integer;
    StrFromDates,StrToDates:String;
begin
  SetLength(CommissionArr,0);
  JnsKomisi.Items.Clear;
  JnsKomisi.ItemIndex:=0;
  JnsKomisi.Text:='';
  Main.M_Busy;
  Qry:=TADOQuery.Create(Self);
  Qry.Connection:=Main.MyConnection;
  Qry.CommandTimeout := 3600;
  Qry.CommandTimeout:=3600;
  if Main.OpenDb then begin
    StrQry:='EXEC GetCommissionList ;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CommissionArr,Qry.RecordCount+1);

    Count:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      CommissionArr[Count][0]:=Qry.FieldValues['id'];
      CommissionArr[Count][1]:=Qry.FieldValues['name'];
      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;

    //==
    StrQry:='EXEC GetCommissionTypeList;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CommissionTypeArr,Qry.RecordCount+1);

    Count:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      CommissionTypeArr[Count][0]:=Qry.FieldValues['id'];
      CommissionTypeArr[Count][1]:=Qry.FieldValues['name'];

      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;

    //==
    StrQry:='EXEC GetCommissionAmountTypeList;';
    Qry.SQL.Clear;
    Main.WriteLog('SQL :'+StrQry,2);
    Qry.SQL.Add(StrQry);
    Qry.Open;
    SetLength(CommissionTypeAmountArr,Qry.RecordCount+1);

    Count:=1;
    if (Qry.RecordCount>0) then while not(Qry.Eof) do begin
      CommissionTypeAmountArr[Count][0]:=Qry.FieldValues['id'];
      CommissionTypeAmountArr[Count][1]:=Qry.FieldValues['name'];

      Inc(Count);
      Qry.Next;
    end;
    Qry.Close;
  end;
  Main.CloseDb;
  JnsKomisi.Items.Clear;
  TipeKomisi.Items.Clear;
  JenisNilaiKomisi.Items.Clear;

  for Count:=0 to Length(CommissionArr)-1 do
    JnsKomisi.Items.Add(CommissionArr[Count][1]);

  for Count:=0 to Length(CommissionTypeArr)-1 do
    TipeKomisi.Items.Add(CommissionTypeArr[Count][1]);

  for Count:=0 to Length(CommissionTypeAmountArr)-1 do
    JenisNilaiKomisi.Items.Add(CommissionTypeAmountArr[Count][1]);

  Main.M_Normal;
end;

procedure TCommissionsOrderForm.CariCustomerClick(Sender: TObject);
begin
  OrderList:=TOrderList.Create(Self,'Bus','CommissionOrder-Create','',0,'from_datetime',30,1);
end;

procedure TCommissionsOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
