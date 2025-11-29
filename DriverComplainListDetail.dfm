object FDriverComplainListDetail: TFDriverComplainListDetail
  Left = 346
  Top = 204
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Keluhan Driver Detail'
  ClientHeight = 332
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    630
    332)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupTotal: TGroupBox
    Left = 8
    Top = 292
    Width = 105
    Height = 33
    TabOrder = 0
    object chk1: TCheckBox
      Left = 12
      Top = 9
      Width = 82
      Height = 17
      Caption = 'Ceklis semua'
      TabOrder = 0
      OnClick = chk1Click
    end
  end
  object Selesai: TButton
    Left = 420
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 0
    Width = 612
    Height = 291
    Anchors = [akLeft, akTop, akRight]
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
    TabOrder = 2
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
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
    WordWrap = True
  end
  object Simpan: TButton
    Left = 328
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object CheckSelect: TCheckBox
    Left = 79
    Top = 48
    Width = 14
    Height = 15
    TabOrder = 4
    Visible = False
    OnExit = CheckSelectExit
  end
end
