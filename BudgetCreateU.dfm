object BudgetCreate: TBudgetCreate
  Left = 354
  Top = 83
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pembuatan Budget'
  ClientHeight = 493
  ClientWidth = 949
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
  object Selesai: TButton
    Left = 864
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 0
    Width = 297
    Height = 97
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cost Centre/SBU'
    end
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departemen'
    end
    object Label4: TLabel
      Left = 63
      Top = 56
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bulan'
    end
    object Label5: TLabel
      Left = 199
      Top = 56
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Thn'
    end
    object SBU: TComboBox
      Left = 96
      Top = 8
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = SBUChange
    end
    object Department: TComboBox
      Left = 96
      Top = 32
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = DepartmentChange
    end
    object Panel1: TPanel
      Left = 136
      Top = 32
      Width = 153
      Height = 41
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 4
      object DepartmentDisp: TEdit
        Left = 0
        Top = 0
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
      end
    end
    object Month: TComboBox
      Left = 96
      Top = 56
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = MonthChange
    end
    object Year: TEdit
      Left = 224
      Top = 56
      Width = 41
      Height = 21
      TabOrder = 3
      OnKeyPress = YearKeyPress
    end
  end
  object Simpan: TButton
    Left = 864
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GridCOA: TZColorStringGrid
    Left = 7
    Top = 104
    Width = 852
    Height = 353
    ColCount = 4
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssVertical
    TabOrder = 1
    OnKeyPress = GridCOAKeyPress
    OnSelectCell = GridCOASelectCell
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
  object GroupBox1: TGroupBox
    Left = 576
    Top = 456
    Width = 281
    Height = 33
    Enabled = False
    TabOrder = 6
    object Label3: TLabel
      Left = 10
      Top = 12
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object Total: TMemo
      Left = 64
      Top = 8
      Width = 97
      Height = 21
      Alignment = taRightJustify
      MaxLength = 25
      TabOrder = 0
      WantReturns = False
      WantTabs = True
    end
  end
  object Bersihkan: TButton
    Left = 864
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
  object Rubah: TButton
    Left = 864
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Rubah'
    TabOrder = 3
    OnClick = RubahClick
  end
  object COAId: TComboBox
    Left = 424
    Top = 128
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    Visible = False
    OnChange = COAIdChange
    OnExit = COAIdExit
    OnKeyPress = COAIdKeyPress
  end
  object Proyeksi: TEdit
    Left = 584
    Top = 128
    Width = 121
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 8
    Visible = False
    OnEnter = ProyeksiEnter
    OnExit = ProyeksiExit
    OnKeyPress = ProyeksiKeyPress
  end
end
