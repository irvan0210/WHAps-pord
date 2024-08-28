object UserSubMenuForm: TUserSubMenuForm
  Left = 700
  Top = 257
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Sub Menu'
  ClientHeight = 156
  ClientWidth = 389
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
  object Batal: TButton
    Left = 288
    Top = 123
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'Batal'
    ParentBiDiMode = False
    TabOrder = 0
    OnClick = BatalClick
  end
  object GroupBox1: TGroupBox
    Left = 15
    Top = 8
    Width = 360
    Height = 108
    TabOrder = 1
    object Label2: TLabel
      Left = 33
      Top = 17
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'User'
    end
    object Label5: TLabel
      Left = 28
      Top = 38
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Menu'
    end
    object Label3: TLabel
      Left = 4
      Top = 82
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filter Status'
    end
    object Label1: TLabel
      Left = 8
      Top = 61
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sub Menu'
    end
    object cb_username: TComboBox
      Left = 64
      Top = 13
      Width = 225
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cb_usernameChange
      OnKeyPress = cb_usernameKeyPress
    end
    object cb_menu: TComboBox
      Left = 64
      Top = 35
      Width = 285
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cb_menuChange
      OnKeyPress = cb_menuKeyPress
    end
    object UserMenuId: TEdit
      Left = 290
      Top = 13
      Width = 55
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object is_active: TCheckBox
      Left = 64
      Top = 81
      Width = 58
      Height = 17
      Caption = 'Active'
      TabOrder = 3
    end
    object cb_submenu: TComboBox
      Left = 64
      Top = 58
      Width = 285
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object Simpan: TButton
    Left = 127
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object btnClear: TButton
    Left = 207
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = btnClearClick
  end
end
