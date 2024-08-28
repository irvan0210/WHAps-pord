object UserForm: TUserForm
  Left = 278
  Top = 118
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Form'
  ClientHeight = 416
  ClientWidth = 372
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
    Left = 93
    Top = 8
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 73
    Top = 32
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 67
    Top = 56
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 37
    Top = 80
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'Confirm Password'
  end
  object Label5: TLabel
    Left = 67
    Top = 175
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'User Group'
  end
  object Label6: TLabel
    Left = 91
    Top = 390
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Active'
  end
  object Label7: TLabel
    Left = 75
    Top = 199
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Employee'
  end
  object Label8: TLabel
    Left = 80
    Top = 223
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Location'
  end
  object Label9: TLabel
    Left = 66
    Top = 250
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Department'
  end
  object Label10: TLabel
    Left = 66
    Top = 151
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Initial Name'
  end
  object Label11: TLabel
    Left = 73
    Top = 271
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Superior 1'
  end
  object Label12: TLabel
    Left = 73
    Top = 295
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Superior 2'
  end
  object Label13: TLabel
    Left = 70
    Top = 127
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'User Level'
  end
  object Label14: TLabel
    Left = 29
    Top = 319
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = 'Max Discount Price'
  end
  object Label15: TLabel
    Left = 16
    Top = 343
    Width = 105
    Height = 13
    Alignment = taRightJustify
    Caption = 'Max Discount Percent'
  end
  object lbl1: TLabel
    Left = 95
    Top = 107
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object lbl2: TLabel
    Left = 79
    Top = 367
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Awal'
  end
  object Change: TButton
    Left = 288
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 16
    OnClick = ChangeClick
  end
  object Cancel: TButton
    Left = 288
    Top = 359
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 17
    OnClick = CancelClick
  end
  object Name: TEdit
    Left = 128
    Top = 8
    Width = 169
    Height = 21
    TabOrder = 0
    OnKeyPress = NameKeyPress
  end
  object Username: TEdit
    Left = 128
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = UsernameKeyPress
  end
  object UserGroup: TComboBox
    Left = 128
    Top = 175
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    OnChange = UserGroupChange
    OnKeyPress = UserGroupKeyPress
  end
  object Password: TMaskEdit
    Left = 128
    Top = 56
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = PasswordKeyPress
  end
  object PassConf: TMaskEdit
    Left = 128
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = PassConfKeyPress
  end
  object Active: TCheckBox
    Left = 128
    Top = 390
    Width = 17
    Height = 17
    TabOrder = 15
    OnKeyPress = ActiveKeyPress
  end
  object Employee: TComboBox
    Left = 128
    Top = 199
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
    OnKeyPress = EmployeeKeyPress
  end
  object Location: TComboBox
    Left = 128
    Top = 223
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = LocationChange
    OnKeyPress = LocationKeyPress
  end
  object Panel1: TPanel
    Left = 168
    Top = 175
    Width = 129
    Height = 97
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 18
    object UserGroupDisp: TEdit
      Left = 0
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EmployeeDisp: TEdit
      Left = 0
      Top = 23
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object LocationDisp: TEdit
      Left = 0
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object DeptDisp: TEdit
      Left = 0
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object Dept: TComboBox
    Left = 128
    Top = 247
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    OnChange = DeptChange
    OnKeyPress = DeptKeyPress
  end
  object InitialName: TEdit
    Left = 128
    Top = 151
    Width = 41
    Height = 21
    MaxLength = 2
    TabOrder = 6
  end
  object Superior1: TComboBox
    Left = 128
    Top = 271
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
  end
  object Superior2: TComboBox
    Left = 128
    Top = 295
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnKeyPress = Superior2KeyPress
  end
  object Level: TEdit
    Left = 128
    Top = 127
    Width = 33
    Height = 21
    MaxLength = 2
    TabOrder = 5
    OnKeyPress = LevelKeyPress
  end
  object DiscountPrice: TEdit
    Left = 128
    Top = 319
    Width = 121
    Height = 21
    TabOrder = 13
    OnKeyPress = DiscountPriceKeyPress
  end
  object DiscountPercent: TEdit
    Left = 128
    Top = 343
    Width = 25
    Height = 21
    MaxLength = 3
    TabOrder = 14
    OnKeyPress = DiscountPercentKeyPress
  end
  object Email: TEdit
    Left = 128
    Top = 104
    Width = 182
    Height = 21
    TabOrder = 4
    OnKeyPress = EmailKeyPress
  end
  object edtkmawal: TEdit
    Left = 128
    Top = 367
    Width = 25
    Height = 21
    MaxLength = 3
    TabOrder = 19
    OnKeyPress = DiscountPercentKeyPress
  end
end
