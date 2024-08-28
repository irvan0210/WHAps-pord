object PartNumberForm: TPartNumberForm
  Left = 326
  Top = 226
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Part Number'
  ClientHeight = 143
  ClientWidth = 465
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
    Left = 17
    Top = 8
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Part Number Id'
  end
  object Label3: TLabel
    Left = 60
    Top = 56
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Label2: TLabel
    Left = 13
    Top = 32
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = 'Part Description'
  end
  object Label4: TLabel
    Left = 58
    Top = 80
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Skalar'
  end
  object PartNumberId: TEdit
    Left = 96
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object PartDescription: TComboBox
    Left = 96
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object Description: TEdit
    Left = 96
    Top = 56
    Width = 353
    Height = 21
    TabOrder = 2
  end
  object Simpan: TButton
    Left = 72
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
  end
  object Selesai: TButton
    Left = 296
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
  object Scale: TComboBox
    Left = 96
    Top = 80
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
end
