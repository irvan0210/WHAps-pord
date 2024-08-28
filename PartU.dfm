object Part: TPart
  Left = 679
  Top = 379
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Part'
  ClientHeight = 101
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Selesai: TButton
    Left = 396
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 236
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 316
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 2
    OnClick = BersihkanClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 65
    TabOrder = 3
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 63
      Height = 13
      Caption = 'Kode Part GP'
    end
    object Label2: TLabel
      Left = 19
      Top = 38
      Width = 50
      Height = 13
      Caption = 'Nama Part'
    end
    object KodePart: TEdit
      Left = 75
      Top = 8
      Width = 137
      Height = 21
      TabOrder = 0
    end
  end
  object PartName: TEdit
    Left = 76
    Top = 35
    Width = 393
    Height = 21
    TabOrder = 4
  end
end
