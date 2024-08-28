object SelectBooking: TSelectBooking
  Left = 549
  Top = 193
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Pilih Nomor Pesanan'
  ClientHeight = 174
  ClientWidth = 161
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
  object StrGrid: TZColorStringGrid
    Left = 9
    Top = 7
    Width = 145
    Height = 159
    ColCount = 1
    DefaultColWidth = 140
    DefaultRowHeight = 30
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = StrGridDblClick
    OnKeyPress = StrGridKeyPress
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
  object AppHotKey: TApplicationEvents
    Left = 96
    Top = 8
  end
end
