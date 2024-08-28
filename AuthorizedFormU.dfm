object AuthorizedForm: TAuthorizedForm
  Left = 322
  Top = 181
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Form Otorisasi'
  ClientHeight = 169
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 64
    Width = 47
    Height = 20
    Caption = 'Nama'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 11
    Top = 96
    Width = 78
    Height = 20
    Alignment = taRightJustify
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Nama: TEdit
    Left = 96
    Top = 64
    Width = 185
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = NamaKeyPress
  end
  object Batal: TButton
    Left = 184
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object Otorisasi: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Otorisasi'
    TabOrder = 2
    OnClick = OtorisasiClick
  end
  object Password: TMaskEdit
    Left = 96
    Top = 96
    Width = 185
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PasswordKeyPress
  end
  object Pesan: TMemo
    Left = 8
    Top = 8
    Width = 281
    Height = 49
    Alignment = taCenter
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerCheckTimer
    Left = 112
    Top = 136
  end
end
