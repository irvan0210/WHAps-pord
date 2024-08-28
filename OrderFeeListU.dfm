object OrderFeeList: TOrderFeeList
  Left = 348
  Top = 203
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Uang Order'
  ClientHeight = 322
  ClientWidth = 556
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
  object Label6: TLabel
    Left = 11
    Top = 8
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal'
  end
  object Label2: TLabel
    Left = 312
    Top = 9
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object GridSPJ: TStringGrid
    Left = 8
    Top = 32
    Width = 537
    Height = 249
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
      59
      73
      154
      64
      64)
  end
  object Selesai: TButton
    Left = 232
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object Tanggal: TDateTimePicker
    Left = 64
    Top = 8
    Width = 89
    Height = 21
    Date = 41780.000000000000000000
    Time = 41780.000000000000000000
    TabOrder = 2
    OnChange = TanggalChange
  end
  object Cari: TEdit
    Left = 343
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 3
    OnChange = CariChange
  end
  object All: TCheckBox
    Left = 154
    Top = 8
    Width = 65
    Height = 17
    Caption = 'Semua'
    TabOrder = 4
    OnClick = AllClick
  end
  object Button1: TButton
    Left = 212
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Lihat Data'
    TabOrder = 5
    OnClick = Button1Click
  end
end
