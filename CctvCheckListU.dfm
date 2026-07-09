object CctvCheckList: TCctvCheckList
  Left = 308
  Top = 339
  Width = 720
  Height = 420
  BorderIcons = []
  Caption = 'Riwayat Checklist CCTV'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 704
    Height = 55
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 22
      Width = 22
      Height = 13
      Caption = 'Dari '
    end
    object Label2: TLabel
      Left = 175
      Top = 22
      Width = 38
      Height = 13
      Caption = 'Sampai '
    end
    object Label3: TLabel
      Left = 430
      Top = 22
      Width = 21
      Height = 13
      Caption = 'Cari '
    end
    object Search: TSpeedButton
      Left = 350
      Top = 16
      Width = 70
      Height = 25
      Caption = 'Cari'
      OnClick = SearchClick
    end
    object ToXCel: TSpeedButton
      Left = 625
      Top = 16
      Width = 70
      Height = 25
      Caption = 'Ke Excel'
      OnClick = ToXCelClick
    end
    object Tanggal: TDateTimePicker
      Left = 55
      Top = 18
      Width = 110
      Height = 21
      Date = 39000.500000000000000000
      Time = 39000.500000000000000000
      TabOrder = 0
      OnChange = TanggalChange
    end
    object Tanggal2: TDateTimePicker
      Left = 228
      Top = 18
      Width = 110
      Height = 21
      Date = 39000.500000000000000000
      Time = 39000.500000000000000000
      TabOrder = 1
      OnChange = Tanggal2Change
    end
    object Cari: TEdit
      Left = 465
      Top = 18
      Width = 150
      Height = 21
      TabOrder = 2
      OnChange = CariChange
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 0
    Top = 55
    Width = 704
    Height = 296
    Align = alClient
    ColCount = 7
    DefaultColWidth = 100
    DefaultRowHeight = 18
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
    DefaultCellStyle.Font.Color = clWindowText
    DefaultCellStyle.Font.Height = -11
    DefaultCellStyle.Font.Name = 'Tahoma'
    DefaultCellStyle.Font.Style = []
    DefaultCellStyle.BGColor = clWindow
    DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
    DefaultFixedCellStyle.Font.Color = clWindowText
    DefaultFixedCellStyle.Font.Height = -11
    DefaultFixedCellStyle.Font.Name = 'Tahoma'
    DefaultFixedCellStyle.Font.Style = []
    DefaultFixedCellStyle.BGColor = clBtnFace
    LineDesign.LineUpColor = clWhite
  end
  object PanelFooter: TPanel
    Left = 0
    Top = 351
    Width = 704
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Selesai: TButton
      Left = 617
      Top = 2
      Width = 80
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = SelesaiClick
    end
  end
end
