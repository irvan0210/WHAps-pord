object VehicleImage: TVehicleImage
  Left = 605
  Top = 161
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Blueprint Armada'
  ClientHeight = 574
  ClientWidth = 562
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
  object GroupFoto: TGroupBox
    Left = 6
    Top = 8
    Width = 547
    Height = 529
    TabOrder = 0
    object VhcImage: TImage
      Left = 8
      Top = 16
      Width = 529
      Height = 505
      OnDblClick = VhcImageDblClick
    end
  end
  object Selesai: TButton
    Left = 240
    Top = 544
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
