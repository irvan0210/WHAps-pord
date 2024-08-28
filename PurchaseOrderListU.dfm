object PurchaseOrderList: TPurchaseOrderList
  Left = 148
  Top = 131
  Width = 848
  Height = 526
  Caption = 'List Purchase Order'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 528
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 0
    Width = 305
    Height = 89
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 8
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'S.B.U / Cost Centre'
    end
    object Label5: TLabel
      Left = 231
      Top = 56
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Thn'
    end
    object Label4: TLabel
      Left = 79
      Top = 56
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bulan'
    end
    object Label1: TLabel
      Left = 75
      Top = 32
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi'
    end
    object SBU: TComboBox
      Left = 112
      Top = 8
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = SBUChange
    end
    object Year: TEdit
      Left = 256
      Top = 56
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Month: TComboBox
      Left = 112
      Top = 56
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object Location: TComboBox
      Left = 112
      Top = 32
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = LocationChange
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 96
    Width = 817
    Height = 353
    ColCount = 8
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssVertical
    TabOrder = 1
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
  object Selesai: TButton
    Left = 344
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Lihat: TButton
    Left = 328
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Lihat'
    TabOrder = 3
    OnClick = LihatClick
  end
  object Cari: TEdit
    Left = 552
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = CariChange
  end
end
