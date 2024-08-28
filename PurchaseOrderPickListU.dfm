object PurchaseOrderPickList: TPurchaseOrderPickList
  Left = 219
  Top = 71
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'List Purchase Request'
  ClientHeight = 489
  ClientWidth = 882
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
    Left = 455
    Top = 8
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Thn'
  end
  object Label4: TLabel
    Left = 319
    Top = 8
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Bulan'
  end
  object Label3: TLabel
    Left = 328
    Top = 32
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 0
    Width = 289
    Height = 57
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
      Left = 24
      Top = 32
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departemen'
    end
    object SBU: TComboBox
      Left = 96
      Top = 8
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object SBUDisp: TEdit
      Left = 136
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      TabOrder = 1
    end
    object Department: TComboBox
      Left = 96
      Top = 32
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object DepartmentDisp: TEdit
      Left = 136
      Top = 32
      Width = 137
      Height = 21
      TabStop = False
      TabOrder = 3
    end
  end
  object Year: TEdit
    Left = 480
    Top = 8
    Width = 41
    Height = 21
    TabOrder = 2
  end
  object Month: TComboBox
    Left = 352
    Top = 8
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object StrGrid: TZColorStringGrid
    Left = 5
    Top = 64
    Width = 868
    Height = 385
    ColCount = 6
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssVertical
    TabOrder = 4
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
    Left = 392
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object Lihat: TButton
    Left = 584
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Lihat'
    TabOrder = 3
    OnClick = LihatClick
  end
  object Cari: TEdit
    Left = 352
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = CariChange
  end
end
