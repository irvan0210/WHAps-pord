object SPJServReprint: TSPJServReprint
  Left = 631
  Top = 185
  Width = 537
  Height = 305
  Caption = 'Cetak Ulang SPJ Service'
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
  object GridSPJ: TStringGrid
    Left = 8
    Top = 8
    Width = 513
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
      62
      66
      64
      154
      64
      64)
  end
  object Selesai: TButton
    Left = 224
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
