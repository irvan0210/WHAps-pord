object UserGroupMenuForm: TUserGroupMenuForm
  Left = 508
  Top = 284
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Group Menu'
  ClientHeight = 154
  ClientWidth = 278
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
  object Label4: TLabel
    Left = 13
    Top = 16
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Menu Id'
  end
  object Label1: TLabel
    Left = 57
    Top = 64
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Label2: TLabel
    Left = 30
    Top = 40
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'User Group'
  end
  object Label3: TLabel
    Left = 54
    Top = 88
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Panel1: TPanel
    Left = 96
    Top = 16
    Width = 153
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object GroupMenuId: TEdit
      Left = 0
      Top = 0
      Width = 65
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 96
    Top = 40
    Width = 153
    Height = 73
    BevelOuter = bvNone
    TabOrder = 1
    object Active: TCheckBox
      Left = 0
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 2
      OnKeyPress = ActiveKeyPress
    end
    object UserGroup: TComboBox
      Left = 0
      Top = 0
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UserGroupChange
      OnKeyPress = UserGroupKeyPress
    end
    object Menu: TComboBox
      Left = 0
      Top = 24
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = MenuKeyPress
    end
  end
  object Simpan: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 176
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
end
