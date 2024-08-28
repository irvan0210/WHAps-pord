unit Unit1;

interface

uses
  Classes,ADODB;

type
  TConnection = class(TThread)
  private
    { Private declarations }
    Qry:TADOQuery;
    Dset:TADODataSet;
  protected
    constructor Create(StrQry:String); override;
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TConnection.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TConnection }

constructor Create(StrQry:String);
begin
  inherited Create(True);
end;

procedure TConnection.Execute;
begin
  { Place thread code here }
end;

end.
