object UserAuthForm: TUserAuthForm
  Left = 508
  Top = 284
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Auth'
  ClientHeight = 127
  ClientWidth = 304
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
    Left = 10
    Top = 32
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tree Sub Menu'
  end
  object Label2: TLabel
    Left = 36
    Top = 8
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 54
    Top = 56
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object GroupInput: TPanel
    Left = 96
    Top = 8
    Width = 201
    Height = 73
    BevelOuter = bvNone
    TabOrder = 0
    object Active: TCheckBox
      Left = 0
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 2
      OnKeyPress = ActiveKeyPress
    end
    object Username: TComboBox
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UsernameChange
      OnKeyPress = UsernameKeyPress
    end
    object TreeSubMenu: TComboBox
      Left = 0
      Top = 24
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = TreeSubMenuKeyPress
    end
  end
  object Simpan: TButton
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 192
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
end
