object HistoryPrintOrderFee: THistoryPrintOrderFee
  Left = 306
  Top = 357
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Riwayat Cetak Uang Order'
  ClientHeight = 322
  ClientWidth = 891
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
    891
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object HistoryList: TListBox
    Left = 22
    Top = 333
    Width = 881
    Height = 273
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object Selesai: TButton
    Left = 399
    Top = 289
    Width = 89
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 6
    Width = 881
    Height = 275
    Anchors = [akLeft, akTop, akRight]
    ColCount = 45
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
    TabOrder = 2
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
    SizingHeight = True
    WordWrap = True
  end
end
