object UserTreeMenuForm: TUserTreeMenuForm
  Left = 474
  Top = 238
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User Tree Menu'
  ClientHeight = 292
  ClientWidth = 466
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
  object LabelUserTreeMenuId: TLabel
    Left = 19
    Top = 0
    Width = 89
    Height = 13
    Alignment = taRightJustify
    Caption = 'User Tree Menu Id'
  end
  object Label1: TLabel
    Left = 56
    Top = 96
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tree Menu'
  end
  object Label2: TLabel
    Left = 86
    Top = 24
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'User'
  end
  object LabelActive: TLabel
    Left = 78
    Top = 264
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 81
    Top = 48
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Label6: TLabel
    Left = 59
    Top = 72
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sub Menu'
  end
  object Label7: TLabel
    Left = 61
    Top = 179
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'From date'
  end
  object Label9: TLabel
    Left = 59
    Top = 203
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'From Time'
  end
  object Label11: TLabel
    Left = 62
    Top = 227
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Weekday'
  end
  object Label13: TLabel
    Left = 64
    Top = 120
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Company'
  end
  object Panel1: TPanel
    Left = 120
    Top = 0
    Width = 177
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object UserTreeMenuId: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 120
    Top = 24
    Width = 241
    Height = 257
    BevelOuter = bvNone
    TabOrder = 1
    object Active: TCheckBox
      Left = 0
      Top = 240
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 4
      OnKeyPress = ActiveKeyPress
    end
    object Username: TComboBox
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UsernameChange
      OnKeyPress = UsernameKeyPress
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
    object Default: TCheckBox
      Left = 0
      Top = 136
      Width = 65
      Height = 17
      Caption = 'Default'
      TabOrder = 5
      OnClick = DefaultClick
    end
    object PanelSetTime: TPanel
      Left = 0
      Top = 152
      Width = 233
      Height = 81
      BevelOuter = bvNone
      TabOrder = 6
      object Label8: TLabel
        Left = 87
        Top = 1
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'To date'
      end
      object Label10: TLabel
        Left = 85
        Top = 25
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'To Time'
      end
      object FromDates: TDateTimePicker
        Left = 0
        Top = 1
        Width = 81
        Height = 21
        Date = 42243.398197465280000000
        Time = 42243.398197465280000000
        TabOrder = 0
        OnKeyPress = FromDatesKeyPress
      end
      object ToDates: TDateTimePicker
        Left = 136
        Top = 1
        Width = 81
        Height = 21
        Date = 42243.398197465280000000
        Time = 42243.398197465280000000
        TabOrder = 1
        OnKeyPress = ToDatesKeyPress
      end
      object FromTimes: TDateTimePicker
        Left = 0
        Top = 25
        Width = 73
        Height = 21
        Date = 42243.000000000000000000
        Time = 42243.000000000000000000
        Kind = dtkTime
        TabOrder = 2
        OnKeyPress = FromTimesKeyPress
      end
      object ToTimes: TDateTimePicker
        Left = 136
        Top = 25
        Width = 73
        Height = 21
        Date = 42243.000000000000000000
        Time = 42243.000000000000000000
        Kind = dtkTime
        TabOrder = 3
        OnKeyPress = ToTimesKeyPress
      end
      object Mon: TCheckBox
        Left = 0
        Top = 50
        Width = 41
        Height = 17
        Caption = 'Mon'
        TabOrder = 4
        OnKeyPress = MonKeyPress
      end
      object Fri: TCheckBox
        Left = 0
        Top = 66
        Width = 41
        Height = 17
        Caption = 'Fri'
        TabOrder = 5
        OnKeyPress = FriKeyPress
      end
      object Tue: TCheckBox
        Left = 56
        Top = 50
        Width = 41
        Height = 17
        Caption = 'Tue'
        TabOrder = 6
        OnKeyPress = TueKeyPress
      end
      object Sat: TCheckBox
        Left = 56
        Top = 66
        Width = 41
        Height = 17
        Caption = 'Sat'
        TabOrder = 7
        OnKeyPress = SatKeyPress
      end
      object Wed: TCheckBox
        Left = 120
        Top = 50
        Width = 41
        Height = 17
        Caption = 'Wed'
        TabOrder = 8
        OnKeyPress = WedKeyPress
      end
      object Sun: TCheckBox
        Left = 120
        Top = 67
        Width = 49
        Height = 17
        Caption = 'Sun'
        TabOrder = 9
        OnKeyPress = SunKeyPress
      end
      object Thu: TCheckBox
        Left = 184
        Top = 50
        Width = 41
        Height = 17
        Caption = 'Thu'
        TabOrder = 10
        OnKeyPress = ThuKeyPress
      end
    end
    object SBU: TComboBox
      Left = 0
      Top = 111
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnKeyPress = SBUKeyPress
    end
    object AllSBU: TCheckBox
      Left = 0
      Top = 96
      Width = 81
      Height = 15
      Caption = 'All'
      TabOrder = 8
      OnClick = AllSBUClick
    end
  end
  object Simpan: TButton
    Left = 384
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 384
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object btnClear: TButton
    Left = 383
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = btnClearClick
  end
end
