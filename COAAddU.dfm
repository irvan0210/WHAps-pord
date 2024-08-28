object COAAdd: TCOAAdd
  Left = 746
  Top = 178
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tambah COA'
  ClientHeight = 83
  ClientWidth = 552
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'C.O.A'
  end
  object Label2: TLabel
    Left = 32
    Top = 48
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Simpan: TButton
    Left = 440
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 440
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object coa: TEdit
    Left = 72
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = coaKeyPress
  end
  object Nama: TEdit
    Left = 72
    Top = 48
    Width = 353
    Height = 21
    TabOrder = 1
    OnKeyPress = NamaKeyPress
  end
end
