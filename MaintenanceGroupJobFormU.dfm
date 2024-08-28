object MaintenanceGroupJobForm: TMaintenanceGroupJobForm
  Left = 717
  Top = 163
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Group Pekerjaan/Perbaikan '
  ClientHeight = 368
  ClientWidth = 547
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
  object Label3: TLabel
    Left = 58
    Top = 80
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label4: TLabel
    Left = 83
    Top = 104
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 70
    Top = 8
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'ID Group'
  end
  object Label5: TLabel
    Left = 33
    Top = 32
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Pekerjaan'
  end
  object Label2: TLabel
    Left = 12
    Top = 56
    Width = 101
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pekerjaan/Perbaikan'
  end
  object Batal: TButton
    Left = 416
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 416
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 128
    Top = 0
    Width = 121
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object MaintenanceGroupId: TEdit
      Left = 0
      Top = 8
      Width = 113
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 128
    Top = 32
    Width = 265
    Height = 89
    BevelOuter = bvNone
    TabOrder = 1
    object Description: TEdit
      Left = 0
      Top = 48
      Width = 265
      Height = 21
      TabOrder = 2
      OnKeyPress = DescriptionKeyPress
    end
    object Active: TCheckBox
      Left = 0
      Top = 72
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 3
      OnKeyPress = ActiveKeyPress
    end
    object MaintenanceJob: TComboBox
      Left = 0
      Top = 24
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = MaintenanceJobKeyPress
    end
    object MaintenanceGroup: TComboBox
      Left = 0
      Top = 0
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = MaintenanceJobChange
      OnKeyPress = MaintenanceGroupKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 529
    Height = 233
    Caption = 'TreeMenu'
    TabOrder = 5
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 513
      Height = 209
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'MS Sans Serif'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'MS Sans Serif'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
  end
  object Bersihkan: TButton
    Left = 416
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = BersihkanClick
  end
end
