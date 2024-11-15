object MaintenanceGroupJobList: TMaintenanceGroupJobList
  Left = 468
  Top = 217
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'List Group Pekerjaan/Perbaikan '
  ClientHeight = 371
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
  object Label5: TLabel
    Left = 17
    Top = 11
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Pekerjaan'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 529
    Height = 321
    TabOrder = 1
    object StrGrid: TZColorStringGrid
      Left = 2
      Top = 15
      Width = 525
      Height = 304
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnDblClick = StrGridDblClick
      OnSelectCell = StrGridSelectCell
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
    Left = 362
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 0
    OnClick = BersihkanClick
  end
  object MaintenanceGroup: TComboBox
    Left = 111
    Top = 9
    Width = 233
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = MaintenanceJobChange
  end
  object Batal: TButton
    Left = 448
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = BatalClick
  end
end
