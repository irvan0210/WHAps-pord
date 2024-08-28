object LocationChange: TLocationChange
  Left = 721
  Top = 195
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pindah Lokasi'
  ClientHeight = 106
  ClientWidth = 276
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
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 83
    Height = 13
    Caption = 'Pindah Ke Lokasi'
  end
  object Pindah: TButton
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Pindah'
    TabOrder = 0
    OnClick = PindahClick
  end
  object Selesai: TButton
    Left = 160
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object NewLocation: TComboBox
    Left = 96
    Top = 24
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
end
