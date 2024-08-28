object DepositReprint: TDepositReprint
  Left = 377
  Top = 299
  Width = 713
  Height = 340
  Caption = 'Cetak Ulang Slip Setoran'
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object StrGrid: TStringGrid
    Left = 8
    Top = 40
    Width = 689
    Height = 233
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    ColWidths = (
      93
      53
      74
      154
      80
      82
      64
      52)
  end
  object Selesai: TButton
    Left = 328
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Cari: TEdit
    Left = 40
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = CariChange
  end
end
