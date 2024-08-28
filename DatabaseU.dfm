object Database: TDatabase
  Left = 331
  Top = 284
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Database'
  ClientHeight = 146
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 16
    Top = 32
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Username: TEdit
    Left = 88
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Password: TEdit
    Left = 88
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Simpan: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
  end
  object Batal: TButton
    Left = 136
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
  end
  object Database: TEdit
    Left = 88
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Server: TEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
end
