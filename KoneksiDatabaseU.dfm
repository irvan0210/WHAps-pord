object KoneksiDatabase: TKoneksiDatabase
  Left = 767
  Top = 284
  BorderStyle = bsNone
  Caption = 'Koneksi Database'
  ClientHeight = 211
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Server'
  end
  object Label4: TLabel
    Left = 32
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label5: TLabel
    Left = 36
    Top = 140
    Width = 40
    Height = 13
    Caption = 'Provider'
  end
  object Label6: TLabel
    Left = 32
    Top = 14
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Cek: TButton
    Left = 24
    Top = 175
    Width = 65
    Height = 25
    Caption = 'Cek'
    TabOrder = 0
  end
  object Simpan: TButton
    Left = 98
    Top = 175
    Width = 65
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Button2: TButton
    Left = 170
    Top = 175
    Width = 65
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
  end
  object Host: TEdit
    Left = 94
    Top = 40
    Width = 137
    Height = 21
    TabOrder = 3
  end
  object Database: TEdit
    Left = 94
    Top = 64
    Width = 137
    Height = 21
    TabOrder = 4
  end
  object Username: TEdit
    Left = 94
    Top = 88
    Width = 137
    Height = 21
    TabOrder = 5
  end
  object Password: TMaskEdit
    Left = 94
    Top = 112
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 6
  end
  object Provider: TEdit
    Left = 93
    Top = 138
    Width = 137
    Height = 21
    TabOrder = 7
  end
  object Name: TEdit
    Left = 94
    Top = 14
    Width = 137
    Height = 21
    TabOrder = 8
  end
end
