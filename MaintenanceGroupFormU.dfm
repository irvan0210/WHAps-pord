object MaintenanceGroupForm: TMaintenanceGroupForm
  Left = 460
  Top = 308
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Group Pekerjaan'
  ClientHeight = 198
  ClientWidth = 344
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
    Left = 29
    Top = 32
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Group'
  end
  object Label3: TLabel
    Left = 34
    Top = 108
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object LabelActive: TLabel
    Left = 59
    Top = 136
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 6
    Top = 83
    Width = 83
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lama Pengerjaan'
  end
  object Label6: TLabel
    Left = 21
    Top = 59
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Servis Berkala'
  end
  object Batal: TButton
    Left = 216
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 48
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object PanelGroup: TPanel
    Left = 32
    Top = 0
    Width = 185
    Height = 31
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Id Group'
    end
    object GroupId: TEdit
      Left = 72
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 104
    Top = 32
    Width = 209
    Height = 120
    BevelOuter = bvNone
    TabOrder = 1
    object GroupName: TEdit
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      TabOrder = 0
      OnKeyPress = GroupNameKeyPress
    end
    object Description: TEdit
      Left = 0
      Top = 75
      Width = 153
      Height = 21
      TabOrder = 1
      OnKeyPress = DescriptionKeyPress
    end
    object Active: TCheckBox
      Left = 0
      Top = 104
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 2
      OnKeyPress = ActiveKeyPress
    end
    object Panel1: TPanel
      Left = 0
      Top = 46
      Width = 217
      Height = 25
      BevelOuter = bvNone
      TabOrder = 3
      object SetHours: TRadioButton
        Left = 0
        Top = 6
        Width = 97
        Height = 17
        Caption = '                   Jam'
        TabOrder = 0
        OnClick = SetHoursClick
        OnKeyPress = SetHoursKeyPress
      end
      object Hours: TEdit
        Left = 16
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 1
        OnKeyPress = HoursKeyPress
      end
      object SetDays: TRadioButton
        Left = 104
        Top = 6
        Width = 97
        Height = 17
        Caption = '                   Hari'
        TabOrder = 2
        OnClick = SetDaysClick
        OnKeyPress = SetDaysKeyPress
      end
      object Days: TEdit
        Left = 120
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 3
        OnKeyPress = DaysKeyPress
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 21
      Width = 217
      Height = 25
      BevelOuter = bvNone
      TabOrder = 4
      object SetUseKM: TRadioButton
        Left = 0
        Top = 6
        Width = 97
        Height = 17
        Caption = '                   KM'
        TabOrder = 0
        OnClick = SetUseKMClick
        OnKeyPress = SetUseKMKeyPress
      end
      object UseKM: TEdit
        Left = 16
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 1
        OnEnter = UseKMEnter
        OnExit = UseKMExit
        OnKeyPress = UseKMKeyPress
      end
      object SetUseDays: TRadioButton
        Left = 104
        Top = 6
        Width = 97
        Height = 17
        Caption = '                   Hari'
        TabOrder = 2
        OnClick = SetUseDaysClick
        OnKeyPress = SetUseDaysKeyPress
      end
      object UseDays: TEdit
        Left = 120
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 3
        OnEnter = UseDaysEnter
        OnExit = UseDaysExit
        OnKeyPress = UseDaysKeyPress
      end
    end
  end
end
