object CetakCreateSPJ: TCetakCreateSPJ
  Left = 192
  Top = 114
  Width = 779
  Height = 459
  BorderIcons = []
  Caption = 'CetakCreateSPJ'
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 771
    Height = 247
    Align = alTop
    TabOrder = 0
    object StrGrid: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 769
      Height = 245
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      TabOrder = 0
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'MS Sans Serif'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'MS Sans Serif'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 283
    Width = 771
    Height = 109
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 13
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Data ID '
    end
    object btnCetak: TButton
      Left = 440
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Cetak'
      TabOrder = 0
    end
    object edtDataID: TEdit
      Left = 55
      Top = 7
      Width = 200
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object rdgDalamKota: TRadioGroup
      Left = 56
      Top = 32
      Width = 185
      Height = 60
      Caption = 'Dalam Kota '
      Items.Strings = (
        'Opersional'
        'Surat Jalan')
      TabOrder = 2
    end
    object rdgLuarKota: TRadioGroup
      Left = 248
      Top = 32
      Width = 185
      Height = 72
      Caption = 'Luar Kota '
      Items.Strings = (
        'Opersional'
        'Surat Jalan'
        'Laporan Luar Kota')
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 36
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object edtCari: TEdit
      Left = 37
      Top = 8
      Width = 290
      Height = 21
      TabOrder = 0
    end
    object btnBatal: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 1
      OnClick = btnBatalClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 392
    Width = 771
    Height = 33
    Align = alClient
    TabOrder = 3
    object btnSelesai: TButton
      Left = 683
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
  end
end
