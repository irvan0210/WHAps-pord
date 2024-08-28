object VehicleBlueprintForm: TVehicleBlueprintForm
  Left = 613
  Top = 268
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Blueprint Armada'
  ClientHeight = 98
  ClientWidth = 340
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
    Left = 45
    Top = 24
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 18
    Top = 48
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object LabelStatus: TLabel
    Left = 43
    Top = 72
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object LabelID: TLabel
    Left = 18
    Top = 0
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Blueprint ID'
  end
  object Selesai: TButton
    Left = 256
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 256
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 88
    Top = -8
    Width = 97
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object BlueprintId: TEdit
      Left = 0
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 88
    Top = 24
    Width = 153
    Height = 65
    BevelOuter = bvNone
    TabOrder = 1
    object Name: TEdit
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      TabOrder = 0
      OnKeyPress = NameKeyPress
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
  object Bersihkan: TButton
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
end
