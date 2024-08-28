object Fsetcetakinv: TFsetcetakinv
  Left = 389
  Top = 246
  BorderStyle = bsDialog
  Caption = 'Set Height Cetak Invoice'
  ClientHeight = 86
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Height  :'
  end
  object edtheight: TEdit
    Left = 52
    Top = 13
    Width = 101
    Height = 21
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 80
    Top = 40
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btn1Click
    Kind = bkOK
  end
end
