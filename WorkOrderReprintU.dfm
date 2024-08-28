object WorkOrderReprint: TWorkOrderReprint
  Left = 491
  Top = 192
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data PKB'
  ClientHeight = 282
  ClientWidth = 439
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
  object StrGrid: TStringGrid
    Left = 5
    Top = 8
    Width = 428
    Height = 233
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    ColWidths = (
      105
      66
      93
      73
      64)
  end
  object Selesai: TButton
    Left = 184
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
