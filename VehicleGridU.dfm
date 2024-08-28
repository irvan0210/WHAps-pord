object VehicleGrid: TVehicleGrid
  Left = 423
  Top = 188
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Grid Armada'
  ClientHeight = 491
  ClientWidth = 746
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
  object Selesai: TButton
    Left = 664
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object GroupGrid: TGroupBox
    Left = 560
    Top = 0
    Width = 97
    Height = 481
    Caption = 'Grid'
    TabOrder = 2
    object GridList: TCheckListBox
      Left = 8
      Top = 16
      Width = 81
      Height = 457
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Tampilkan: TButton
    Left = 664
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Tampilkan'
    TabOrder = 3
    OnClick = TampilkanClick
  end
  object GroupPicture: TGroupBox
    Left = 6
    Top = 0
    Width = 547
    Height = 481
    Caption = 'Blueprint'
    Enabled = False
    TabOrder = 0
    object VhcImage: TImage
      Left = 8
      Top = 16
      Width = 161
      Height = 177
    end
  end
  object Simpan: TButton
    Left = 664
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = SimpanClick
  end
end
