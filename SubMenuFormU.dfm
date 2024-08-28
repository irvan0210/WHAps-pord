object SubMenuForm: TSubMenuForm
  Left = 460
  Top = 308
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Sub Menu'
  ClientHeight = 176
  ClientWidth = 270
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
    Left = 27
    Top = 64
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'SubMenu'
  end
  object Label3: TLabel
    Left = 18
    Top = 88
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label4: TLabel
    Left = 43
    Top = 112
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 15
    Top = 16
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'SubMenu Id'
  end
  object Label5: TLabel
    Left = 46
    Top = 40
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Batal: TButton
    Left = 184
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 32
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
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
    object SubMenuId: TEdit
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
    Height = 89
    BevelOuter = bvNone
    TabOrder = 1
    object SubMenuName: TEdit
      Left = 0
      Top = 24
      Width = 153
      Height = 21
      TabOrder = 1
      OnKeyPress = SubMenuNameKeyPress
    end
    object Description: TEdit
      Left = 0
      Top = 48
      Width = 153
      Height = 21
      TabOrder = 2
      OnKeyPress = DescriptionKeyPress
    end
    object Active: TCheckBox
      Left = 0
      Top = 72
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 3
      OnKeyPress = ActiveKeyPress
    end
    object Menu: TComboBox
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnKeyPress = MenuKeyPress
    end
  end
end
