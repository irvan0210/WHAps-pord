unit FolderFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    DriveBox: TDriveComboBox;
    DirectoryBox: TDirectoryListBox;
    FilterBox: TFilterComboBox;
    FileListBox1: TFileListBox;
    Button1: TButton;
    Batal: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
