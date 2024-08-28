object Form1: TForm1
  Left = 268
  Top = 222
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FolderForm'
  ClientHeight = 196
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object DriveBox: TDriveComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 19
    TabOrder = 0
  end
  object DirectoryBox: TDirectoryListBox
    Left = 8
    Top = 32
    Width = 145
    Height = 97
    ItemHeight = 16
    TabOrder = 1
  end
  object FilterBox: TFilterComboBox
    Left = 8
    Top = 136
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 8
    Width = 153
    Height = 153
    ItemHeight = 13
    TabOrder = 3
  end
  object Button1: TButton
    Left = 40
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
  end
  object Batal: TButton
    Left = 208
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
  end
end
