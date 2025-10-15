object TireMasterForm: TTireMasterForm
  Left = 459
  Top = 267
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Master Ban'
  ClientHeight = 165
  ClientWidth = 260
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
  object Label2: TLabel
    Left = 46
    Top = 40
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Label3: TLabel
    Left = 18
    Top = 64
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label4: TLabel
    Left = 43
    Top = 88
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 34
    Top = 16
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu Id'
  end
  object Selesai: TButton
    Left = 168
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 24
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 88
    Top = 8
    Width = 97
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object MenuId: TEdit
      Left = 0
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 88
    Top = 40
    Width = 161
    Height = 73
    BevelOuter = bvNone
    TabOrder = 1
    object MenuName: TEdit
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      TabOrder = 0
      OnKeyPress = MenuNameKeyPress
    end
    object Description: TEdit
      Left = 0
      Top = 24
      Width = 153
      Height = 21
      TabOrder = 1
      OnKeyPress = DescriptionKeyPress
    end
    object Active: TCheckBox
      Left = 0
      Top = 48
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 2
      OnKeyPress = ActiveKeyPress
    end
  end
end
