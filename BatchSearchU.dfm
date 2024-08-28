object BatchSearch: TBatchSearch
  Left = 192
  Top = 114
  Width = 502
  Height = 319
  BorderIcons = []
  Caption = 'Vehicle Type Search'
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 38
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object edtCari: TEdit
      Left = 37
      Top = 8
      Width = 290
      Height = 21
      TabOrder = 0
      OnChange = edtCariChange
    end
    object btnSelesai: TButton
      Left = 413
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = btnSelesaiClick
    end
    object btnBatal: TButton
      Left = 336
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 2
      OnClick = btnBatalClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 38
    Width = 494
    Height = 254
    Align = alClient
    TabOrder = 1
    object StrGrid: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 492
      Height = 252
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
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
end
