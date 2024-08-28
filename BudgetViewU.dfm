object BudgetView: TBudgetView
  Left = 192
  Top = 107
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Lihat Budget'
  ClientHeight = 437
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupLokasi: TGroupBox
    Left = 8
    Top = 0
    Width = 225
    Height = 33
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Lokasi'
    end
    object Lokasi: TComboBox
      Left = 48
      Top = 8
      Width = 33
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object LokasiDisp: TEdit
      Left = 80
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 9
    Top = 48
    Width = 504
    Height = 329
    ColCount = 18
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
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
  object Selesai: TButton
    Left = 224
    Top = 396
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
end
