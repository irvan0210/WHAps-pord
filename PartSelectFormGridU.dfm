object PartSelectFormGrid: TPartSelectFormGrid
  Left = 469
  Top = 300
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Select Part'
  ClientHeight = 360
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 24
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label2: TLabel
    Left = 245
    Top = 2
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Detail'
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Type'
  end
  object Label4: TLabel
    Left = 16
    Top = 62
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object PartType: TComboBox
    Left = 40
    Top = 0
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = PartTypeChange
  end
  object PartGroup: TComboBox
    Left = 40
    Top = 24
    Width = 281
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = PartGroupChange
  end
  object PartDetail: TComboBox
    Left = 280
    Top = 0
    Width = 329
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Visible = False
    OnChange = PartDetailChange
  end
  object StrGrid: TZColorStringGrid
    Left = 6
    Top = 85
    Width = 363
    Height = 239
    ColCount = 3
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    TabOrder = 3
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
  object Cari: TEdit
    Left = 40
    Top = 59
    Width = 185
    Height = 21
    TabOrder = 4
    OnChange = CariChange
  end
  object Selesai: TButton
    Left = 163
    Top = 331
    Width = 59
    Height = 22
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object ApplicationEvnt: TApplicationEvents
    OnShortCut = ApplicationEvntShortCut
    Left = 304
    Top = 112
  end
end
