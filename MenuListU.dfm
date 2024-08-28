object MenuList: TMenuList
  Left = 598
  Top = 341
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Menu List'
  ClientHeight = 262
  ClientWidth = 443
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
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Selesai: TButton
    Left = 184
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object StrGrid: TStringGrid
    Left = 8
    Top = 32
    Width = 425
    Height = 193
    ColCount = 4
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    ColWidths = (
      41
      108
      182
      64)
  end
  object Cari: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = CariChange
  end
end
