object BusRunningDaysRpt: TBusRunningDaysRpt
  Left = 64
  Top = 91
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Running Days'
  ClientHeight = 588
  ClientWidth = 1298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1298
    588)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 272
    Top = 19
    Width = 27
    Height = 13
    Caption = 'Bulan'
    FocusControl = StrGrid
  end
  object ToXCel: TSpeedButton
    Left = 1075
    Top = 562
    Width = 23
    Height = 22
    BiDiMode = bdLeftToRight
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF5C965685AD7F86AC7D86AA7A86A97A88A87982A3727F
      A06C86A3738CA57789A27372955A799860839C6A708F5D98AC852C8026E5F2E5
      F6FBF5F5F9F5F0F6EFE9F3E8D3E8D2DCECD9E2EEDFC9E0C66DAF667DB876D3E6
      D0E5EEE02785107A9860398C39D0E9CFFFFFFFFCFEFEF6FBF6F5F9F3F5F9F5CF
      E6CDACD3A9D3E8D2C5E0C393C69055A34FFBFFFC639D4D739357429243AAD8AA
      FFFFFFFFFFFFFFFFFFFFFFFFF3F9F3E9F3E9EFF9EFD2E9D2B2D6AF93C58F9AC9
      98B6D9B5BCCCAF5D803F49984F9FD39F62C59266C59569B67C5A9C50E3ECDCC3
      DDC2237F174D933DE0EEDF95C69263AA5DA9D2A6F0F2EC77936042984DAFDBAA
      37AC5A006F00006000004C00C5D5B52C984000430067A55FDFEFDDC5E0C3A2CD
      9F4A9D44C6E2C5E0E0DB479C55A9D8A8A8D9A2338A2F003D0085A25C86D0A600
      7500369F4CECF6EBB5D9B3B8D9B693C690DCECDBF8F8F5E2E6DD469D56C5E3C5
      A5D9A5B3D8AF00330000420000AD56009D3FC8E5CCDBEBD6E9F3E8FFFFFFDFEB
      DD86B97D42902D7A9965449F57CCE6CCB9DFB8D8F5DD9CAC7300881900BD669A
      E2BFFFFFFFDCEEE09ACB9A4AA2441A8D100F8F043AA5328AA87A46A25ACDE8CD
      C2E3C2D3E9CD7FD0A200A949007A1C889A6F7DCB8A36A03732A22C39A83243AD
      3C40AC3A52AF4A89A87947A35DCDE8CFD8EED6A3D3A600790400922F09420000
      270085BD7D77CB7567BD625CB85653B54F4DB3495FB65989A97C399D52D3E9D5
      D0E9CF04700000520088C99383A36D001300365711B5DFB399D39895D0928FCF
      8C8ACD888CC98889AA7D65B277C0E2C98CB87D004D00408F36D5ECD3C3E8C34A
      752F0D3A0089AA79B5E3B5A6D6A3A8D9A5A8D9A6A6D5A389AC7FECF6EF7FC08F
      C3E0C5E5F2E2DBEFD9CDE9CDC9E6C9CBEBCBC2E5C0B8DDB6B9E0B8B5DFB3B5DD
      B2B5DFB3B2DBAF8AAF83FFFFFFDFF0E382C090B0D8B8C9E5CCCBE6CCC8E5C9C5
      E2C5C3E2C5C2E2C2BFE0BFBDDFBDBCDFBCBDDFBDB3D8B286AD80}
    Layout = blGlyphRight
    ParentBiDiMode = False
    OnClick = ToXCelClick
  end
  object Label3: TLabel
    Left = 459
    Top = 19
    Width = 63
    Height = 13
    Caption = 'Jenis Armada'
  end
  object Label4: TLabel
    Left = 372
    Top = 19
    Width = 31
    Height = 13
    Caption = 'Tahun'
  end
  object Label5: TLabel
    Left = 800
    Top = 19
    Width = 22
    Height = 13
    Caption = 'Seat'
  end
  object Bulan: TComboBox
    Left = 302
    Top = 16
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object Batch: TComboBox
    Left = 526
    Top = 16
    Width = 251
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = BatchChange
  end
  object Tahun: TEdit
    Left = 408
    Top = 16
    Width = 41
    Height = 21
    MaxLength = 4
    TabOrder = 3
    OnKeyPress = TahunKeyPress
  end
  object LihatData: TButton
    Left = 1012
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Lihat Data'
    TabOrder = 4
    OnClick = LihatDataClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 48
    Width = 1282
    Height = 505
    Anchors = [akLeft, akTop, akRight]
    ColCount = 32
    DefaultRowHeight = 62
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 5
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
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      87
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      62
      62
      62
      62
      62)
  end
  object Seat: TComboBox
    Left = 826
    Top = 16
    Width = 49
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object PanelLegend: TPanel
    Left = 8
    Top = 560
    Width = 425
    Height = 25
    BevelOuter = bvNone
    TabOrder = 7
    object Label7: TLabel
      Left = 200
      Top = 4
      Width = 79
      Height = 13
      Caption = '>Invoice Lunas<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 112
      Top = 4
      Width = 41
      Height = 13
      Caption = '>SJ Ok<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 4
      Width = 73
      Height = 13
      Caption = '>Penjadwalan<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 328
      Top = 4
      Width = 74
      Height = 13
      Caption = '>KIR/ Service<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Selesai: TButton
    Left = 440
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 33
    TabOrder = 8
    object Label11: TLabel
      Left = 16
      Top = 8
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object SBU: TComboBox
      Left = 48
      Top = 8
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 520
    Top = 560
    Width = 385
    Height = 25
    BevelOuter = bvNone
    TabOrder = 9
    object Label6: TLabel
      Left = 16
      Top = 4
      Width = 82
      Height = 13
      Caption = '>Armada Rusak<'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 128
      Top = 4
      Width = 84
      Height = 13
      Caption = '>Jadwal Service<'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 254
      Top = 4
      Width = 97
      Height = 13
      Caption = '>Pemakaian Weha<'
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object ProgressBar: TProgressBar
    Left = 895
    Top = 568
    Width = 170
    Height = 9
    TabOrder = 10
  end
  object Pilihan: TRadioGroup
    Left = 881
    Top = 0
    Width = 103
    Height = 47
    Caption = ' Pilihan '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Nama Cust'
      'No Order')
    ParentFont = False
    TabOrder = 11
  end
end
