object SpecialSettings: TSpecialSettings
  Left = 672
  Top = 312
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Special Setting'
  ClientHeight = 112
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 16
    Top = 24
    Width = 47
    Height = 13
    Caption = 'Log Level'
  end
  object Panel1: TPanel
    Left = 98
    Top = 17
    Width = 127
    Height = 48
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 0
      Top = 0
      Width = 112
      Height = 39
      Caption = '5=None, 4=SQL:Insert, 3=     , 2=SQL:Select, 1=Form Open, 0=All'
      WordWrap = True
    end
  end
  object Simpan: TButton
    Left = 32
    Top = 74
    Width = 59
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 144
    Top = 74
    Width = 59
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object LogLevels: TEdit
    Left = 66
    Top = 24
    Width = 25
    Height = 21
    TabOrder = 3
    OnKeyPress = LogLevelsKeyPress
  end
end
