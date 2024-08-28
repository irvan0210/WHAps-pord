object MonthlySalesRDRpt: TMonthlySalesRDRpt
  Left = 301
  Top = 93
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Laporan Pesanan Bulanan perArmada Jalan'
  ClientHeight = 529
  ClientWidth = 1049
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
  PixelsPerInch = 96
  TextHeight = 13
  object ToXCel: TSpeedButton
    Left = 1016
    Top = 497
    Width = 23
    Height = 22
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
    OnClick = ToXCelClick
  end
  object Label6: TLabel
    Left = 311
    Top = 8
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Bulan'
  end
  object Label3: TLabel
    Left = 427
    Top = 8
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tahun'
  end
  object Label4: TLabel
    Left = 520
    Top = 8
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sales'
  end
  object Label5: TLabel
    Left = 504
    Top = 32
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Segment'
  end
  object Label2: TLabel
    Left = 9
    Top = 492
    Width = 224
    Height = 13
    AutoSize = False
  end
  object Label7: TLabel
    Left = 9
    Top = 507
    Width = 224
    Height = 13
    AutoSize = False
  end
  object Label8: TLabel
    Left = 9
    Top = 516
    Width = 368
    Height = 13
    AutoSize = False
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 281
    Height = 33
    TabOrder = 0
    object Label1: TLabel
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
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 64
    Width = 1033
    Height = 425
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
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
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
  end
  object Selesai: TButton
    Left = 488
    Top = 497
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Bulan: TComboBox
    Left = 344
    Top = 8
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object Tahun: TEdit
    Left = 464
    Top = 8
    Width = 33
    Height = 21
    MaxLength = 4
    TabOrder = 4
  end
  object Lihat: TButton
    Left = 944
    Top = 7
    Width = 75
    Height = 25
    Caption = 'Lihat'
    TabOrder = 5
    OnClick = LihatClick
  end
  object AllSales: TCheckBox
    Left = 712
    Top = 8
    Width = 57
    Height = 17
    Caption = 'Semua'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = AllSalesClick
  end
  object SalesPerson: TComboBox
    Left = 552
    Top = 8
    Width = 161
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 7
  end
  object Segment: TComboBox
    Left = 552
    Top = 32
    Width = 225
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 8
  end
  object AllSegment: TCheckBox
    Left = 776
    Top = 32
    Width = 57
    Height = 17
    Caption = 'Semua'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = AllSegmentClick
  end
  object ProgressBar: TProgressBar
    Left = 831
    Top = 504
    Width = 170
    Height = 9
    TabOrder = 10
  end
  object Edit1: TEdit
    Left = 16
    Top = 456
    Width = 953
    Height = 21
    TabOrder = 11
    Text = 'Edit1'
  end
end
