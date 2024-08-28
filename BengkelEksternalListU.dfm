object BengkelEksternalList: TBengkelEksternalList
  Left = 309
  Top = 217
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'List Bengkel Eksternal'
  ClientHeight = 275
  ClientWidth = 667
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
    Left = 24
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object StrGrid: TStringGrid
    Left = 8
    Top = 32
    Width = 649
    Height = 201
    ColCount = 6
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    ColWidths = (
      51
      102
      173
      86
      123
      85)
  end
  object Selesai: TButton
    Left = 280
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object Cari: TEdit
    Left = 50
    Top = 4
    Width = 266
    Height = 21
    TabOrder = 2
    OnChange = CariChange
  end
end
