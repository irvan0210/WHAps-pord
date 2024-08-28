object RevenueBonusRpt: TRevenueBonusRpt
  Left = 395
  Top = 133
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Laporan Bonus Pendapatan'
  ClientHeight = 381
  ClientWidth = 728
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Bulan'
  end
  object Label4: TLabel
    Left = 360
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Tahun'
  end
  object Selesai: TButton
    Left = 328
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object StrGrid: TStringGrid
    Left = 8
    Top = 48
    Width = 705
    Height = 297
    ColCount = 9
    DefaultRowHeight = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ColWidths = (
      32
      92
      82
      145
      76
      72
      46
      64
      78)
  end
  object GroupLokasi: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 33
    Enabled = False
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Pool'
    end
    object LokasiDisp: TEdit
      Left = 80
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 0
    end
  end
  object Bulan: TComboBox
    Left = 280
    Top = 16
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Tahun: TEdit
    Left = 400
    Top = 16
    Width = 41
    Height = 21
    MaxLength = 4
    TabOrder = 4
  end
  object LihatData: TButton
    Left = 472
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Lihat Data'
    TabOrder = 5
  end
  object Lokasi: TComboBox
    Left = 48
    Top = 16
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
end
