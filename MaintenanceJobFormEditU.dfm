object MaintenanceJobFormEdit: TMaintenanceJobFormEdit
  Left = 542
  Top = 274
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form Edit Group Maint'
  ClientHeight = 104
  ClientWidth = 549
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
    Left = 39
    Top = 44
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pekerjaan'
  end
  object LabelActive: TLabel
    Left = 57
    Top = 67
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 9
    Top = 19
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Pekerjaan'
  end
  object Selesai: TButton
    Left = 456
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 455
    Top = 15
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object GroupInput: TPanel
    Left = 96
    Top = 8
    Width = 337
    Height = 81
    BevelOuter = bvNone
    TabOrder = 0
    object Active: TCheckBox
      Left = 0
      Top = 58
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 0
      OnKeyPress = ActiveKeyPress
    end
    object Description: TEdit
      Left = 0
      Top = 8
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object MaintenanceJob: TComboBox
      Left = 0
      Top = 32
      Width = 328
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object MaintenanceJobDetailId: TEdit
      Left = 179
      Top = 7
      Width = 153
      Height = 21
      Enabled = False
      TabOrder = 3
      Visible = False
    end
  end
end
