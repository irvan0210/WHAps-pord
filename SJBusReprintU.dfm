object SJBusReprint: TSJBusReprint
  Left = 488
  Top = 284
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Surat Jalan'
  ClientHeight = 277
  ClientWidth = 581
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
  PixelsPerInch = 96
  TextHeight = 13
  object GridSPJ: TStringGrid
    Left = 8
    Top = 8
    Width = 561
    Height = 233
    ColCount = 6
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = GridSPJDblClick
    OnSelectCell = GridSPJSelectCell
    ColWidths = (
      93
      66
      83
      154
      64
      64)
  end
  object Selesai: TButton
    Left = 248
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
