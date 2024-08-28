object CetakLeadOrder: TCetakLeadOrder
  Left = 192
  Top = 114
  Width = 981
  Height = 378
  BorderIcons = []
  Caption = 'CetakLeadOrder'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 973
    Height = 213
    Align = alTop
    TabOrder = 0
    object StrGrid: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 971
      Height = 211
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      TabOrder = 0
      OnDblClick = StrGridDblClick
      OnSelectCell = StrGridSelectCell
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
    Top = 249
    Width = 973
    Height = 95
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 13
      Top = 4
      Width = 40
      Height = 13
      Caption = 'Data ID '
    end
    object btnCetak: TButton
      Left = 472
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cetak'
      TabOrder = 0
      OnClick = btnCetakClick
    end
    object btnSelesai: TButton
      Left = 554
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = btnSelesaiClick
      OnKeyPress = btnSelesaiKeyPress
    end
    object edtDataID: TEdit
      Left = 55
      Top = 4
      Width = 200
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object rgBahasa: TRadioGroup
      Left = 268
      Top = 4
      Width = 200
      Height = 42
      Caption = ' Bahasa '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Indonesia'
        'Inggris')
      TabOrder = 3
    end
    object rgCetak: TRadioGroup
      Left = 268
      Top = 46
      Width = 200
      Height = 42
      Caption = ' Cetak '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Dukumentasi'
        'Email')
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 973
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
end
