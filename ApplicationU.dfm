object Application: TApplication
  Left = 443
  Top = 289
  Width = 209
  Height = 236
  Caption = 'Aplikasi'
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
  object Tutup: TButton
    Left = 64
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 0
    OnClick = TutupClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 161
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Aplikasi White Horse Group'
      'Versi 1.0'
      ''
      'Dibuat:'
      'Korynsan'
      ''
      'Programmer:'
      'Korynsan'
      ''
      '')
    ParentFont = False
    TabOrder = 1
  end
end
