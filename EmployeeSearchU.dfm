object EmployeeSearch: TEmployeeSearch
  Left = 528
  Top = 401
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'EmployeeSearch'
  ClientHeight = 333
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Batal: TButton
    Left = 240
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object KolomCari: TEdit
    Left = 272
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 1
    OnChange = KolomCariChange
  end
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
      OnChange = LokasiChange
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
    Left = 5
    Top = 40
    Width = 556
    Height = 257
    ColCount = 6
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 2
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
