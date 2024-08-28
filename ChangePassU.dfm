object ChangePass: TChangePass
  Left = 353
  Top = 318
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Ganti Password'
  ClientHeight = 138
  ClientWidth = 232
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 75
    Height = 13
    Caption = 'Password Lama'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 71
    Height = 13
    Caption = 'Password Baru'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 48
    Height = 13
    Caption = 'Konfirmasi'
  end
  object Ganti: TButton
    Left = 16
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Ganti'
    TabOrder = 3
    OnClick = GantiClick
  end
  object Batal: TButton
    Left = 136
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 4
    OnClick = BatalClick
  end
  object OldPass: TMaskEdit
    Left = 88
    Top = 8
    Width = 129
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = OldPassKeyPress
  end
  object NewPass: TMaskEdit
    Left = 88
    Top = 40
    Width = 129
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = NewPassKeyPress
  end
  object ConfPass: TMaskEdit
    Left = 88
    Top = 72
    Width = 129
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = ConfPassKeyPress
  end
end
