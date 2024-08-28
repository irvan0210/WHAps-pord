object AddUser: TAddUser
  Left = 531
  Top = 160
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Add User'
  ClientHeight = 267
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
    Left = 16
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 84
    Height = 13
    Caption = 'Confirm Password'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 54
    Height = 13
    Caption = 'User Group'
  end
  object Label6: TLabel
    Left = 16
    Top = 208
    Width = 30
    Height = 13
    Caption = 'Active'
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 46
    Height = 13
    Caption = 'Employee'
  end
  object Label8: TLabel
    Left = 16
    Top = 184
    Width = 41
    Height = 13
    Caption = 'Location'
  end
  object lbl1: TLabel
    Left = 16
    Top = 64
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object Add: TButton
    Left = 48
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 9
    OnClick = AddClick
  end
  object Cancel: TButton
    Left = 192
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 10
    OnClick = CancelClick
  end
  object Name: TEdit
    Left = 107
    Top = 8
    Width = 169
    Height = 21
    TabOrder = 0
    OnKeyPress = NameKeyPress
  end
  object Username: TEdit
    Left = 107
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = UsernameKeyPress
  end
  object UserGroup: TComboBox
    Left = 107
    Top = 128
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = UserGroupChange
    OnKeyPress = UserGroupKeyPress
  end
  object Password: TMaskEdit
    Left = 107
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = PasswordKeyPress
  end
  object PassConf: TMaskEdit
    Left = 107
    Top = 104
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
    OnKeyPress = PassConfKeyPress
  end
  object Active: TCheckBox
    Left = 107
    Top = 208
    Width = 17
    Height = 17
    TabOrder = 8
    OnKeyPress = ActiveKeyPress
  end
  object Employee: TComboBox
    Left = 107
    Top = 152
    Width = 41
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 6
    OnChange = UserGroupChange
  end
  object Location: TComboBox
    Left = 107
    Top = 176
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    OnChange = LocationChange
    OnKeyPress = LocationKeyPress
  end
  object Panel1: TPanel
    Left = 147
    Top = 128
    Width = 129
    Height = 73
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 11
    object UserGroupDisp: TEdit
      Left = 0
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EmployeeDisp: TEdit
      Left = 0
      Top = 24
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
  end
  object Email: TEdit
    Left = 107
    Top = 56
    Width = 182
    Height = 21
    TabOrder = 2
    OnKeyPress = EmailKeyPress
  end
end
