object PartGroupForm: TPartGroupForm
  Left = 619
  Top = 447
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Part Group'
  ClientHeight = 179
  ClientWidth = 412
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
    Left = 55
    Top = 8
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Id'
  end
  object Label2: TLabel
    Left = 68
    Top = 56
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Label3: TLabel
    Left = 75
    Top = 32
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tipe'
  end
  object Label4: TLabel
    Left = 28
    Top = 104
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Armada'
  end
  object Label5: TLabel
    Left = 16
    Top = 128
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'GP Reference Id'
  end
  object Label6: TLabel
    Left = 47
    Top = 80
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Part Detail'
  end
  object GroupId: TEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = GroupIdKeyPress
  end
  object GroupName: TEdit
    Left = 104
    Top = 56
    Width = 281
    Height = 21
    TabOrder = 1
    OnKeyPress = GroupNameKeyPress
  end
  object PartType: TComboBox
    Left = 104
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = PartTypeChange
    OnKeyPress = PartTypeKeyPress
  end
  object VehicleGroup: TComboBox
    Left = 104
    Top = 104
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnKeyPress = VehicleGroupKeyPress
  end
  object Simpan: TButton
    Left = 320
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 320
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 8
    OnClick = SelesaiClick
  end
  object GPReferenceId: TEdit
    Left = 104
    Top = 128
    Width = 145
    Height = 21
    TabOrder = 5
    OnKeyPress = GPReferenceIdKeyPress
  end
  object Bersihkan: TButton
    Left = 320
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 7
    OnClick = BersihkanClick
  end
  object VehicleModule: TCheckBox
    Left = 104
    Top = 80
    Width = 105
    Height = 17
    Caption = 'Modul Kendaraan'
    TabOrder = 3
    OnKeyPress = VehicleModuleKeyPress
  end
end
