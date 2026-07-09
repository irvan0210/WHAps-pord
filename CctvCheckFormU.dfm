object CctvCheckForm: TCctvCheckForm
  Left = 260
  Top = 100
  Width = 840
  Height = 480
  BorderIcons = []
  Caption = 'Checklist Harian CCTV'
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
  object GroupHeader: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 42
      Height = 13
      Caption = 'Tanggal '
    end
    object Tanggal: TDateTimePicker
      Left = 70
      Top = 13
      Width = 130
      Height = 21
      Date = 39000.500000000000000000
      Time = 39000.500000000000000000
      TabOrder = 0
      OnChange = TanggalChange
    end
    object CekOtomatis: TButton
      Left = 220
      Top = 12
      Width = 100
      Height = 25
      Caption = 'Cek Otomatis'
      TabOrder = 1
      OnClick = CekOtomatisClick
    end
    object Riwayat: TButton
      Left = 330
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Riwayat'
      TabOrder = 2
      OnClick = RiwayatClick
    end
    object Bersihkan: TButton
      Left = 575
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = BersihkanClick
    end
    object Simpan: TButton
      Left = 655
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 4
      OnClick = SimpanClick
    end
    object Batal: TButton
      Left = 735
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 5
      OnClick = BatalClick
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 0
    Top = 49
    Width = 824
    Height = 392
    Align = alClient
    ColCount = 9
    DefaultColWidth = 100
    DefaultRowHeight = 18
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
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
  object CheckSelect: TCheckBox
    Left = 8
    Top = 400
    Width = 17
    Height = 17
    TabOrder = 2
    Visible = False
    OnClick = CheckSelectClick
    OnExit = CheckSelectExit
  end
  object Keterangan: TMemo
    Left = 8
    Top = 424
    Width = 200
    Height = 21
    TabOrder = 3
    Visible = False
    OnExit = KeteranganExit
  end
end
