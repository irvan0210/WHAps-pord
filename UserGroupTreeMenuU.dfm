object UserGroupTreeMenuForm: TUserGroupTreeMenuForm
  Left = 585
  Top = 256
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Group Tree Menu'
  ClientHeight = 209
  ClientWidth = 365
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
    Left = 12
    Top = 16
    Width = 96
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Tree Menu Id'
  end
  object Label1: TLabel
    Left = 56
    Top = 112
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tree Menu'
  end
  object Label2: TLabel
    Left = 54
    Top = 40
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'User Group'
  end
  object Label3: TLabel
    Left = 78
    Top = 136
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 81
    Top = 64
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Label6: TLabel
    Left = 59
    Top = 88
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sub Menu'
  end
  object Panel1: TPanel
    Left = 120
    Top = 16
    Width = 177
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object GroupTreeMenuId: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 120
    Top = 40
    Width = 233
    Height = 113
    BevelOuter = bvNone
    TabOrder = 1
    object Active: TCheckBox
      Left = 0
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 4
      OnKeyPress = ActiveKeyPress
    end
    object UserGroup: TComboBox
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UserGroupChange
      OnKeyPress = UserGroupKeyPress
    end
    object TreeMenu: TComboBox
      Left = 0
      Top = 72
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnKeyPress = TreeMenuKeyPress
    end
    object Menu: TComboBox
      Left = 0
      Top = 24
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = MenuChange
      OnKeyPress = MenuKeyPress
    end
    object SubMenu: TComboBox
      Left = 0
      Top = 48
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = SubMenuChange
      OnKeyPress = SubMenuKeyPress
    end
  end
  object Simpan: TButton
    Left = 40
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 248
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
end
