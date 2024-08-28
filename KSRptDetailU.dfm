object KSRptDetail: TKSRptDetail
  Left = 538
  Top = 146
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Rincian Hutang Mitra'
  ClientHeight = 446
  ClientWidth = 507
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
    Left = 9
    Top = 8
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lokasi'
  end
  object Label2: TLabel
    Left = 233
    Top = 8
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dari Tgl'
  end
  object ToXCel: TSpeedButton
    Left = 475
    Top = 417
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
  object Label3: TLabel
    Left = 366
    Top = 8
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 's/d Tgl'
  end
  object Label5: TLabel
    Left = 24
    Top = 32
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label6: TLabel
    Left = 4
    Top = 56
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'No KPP'
  end
  object ToPrinter: TSpeedButton
    Left = 443
    Top = 417
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    Layout = blGlyphRight
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 80
    Top = 8
    Width = 153
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object LokasiDisp: TEdit
      Left = 8
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object Lokasi: TComboBox
    Left = 48
    Top = 8
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = LokasiChange
  end
  object Lihat: TButton
    Left = 320
    Top = 56
    Width = 57
    Height = 25
    Caption = 'Lihat'
    TabOrder = 7
    OnClick = LihatClick
  end
  object Selesai: TButton
    Left = 224
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 8
    OnClick = SelesaiClick
  end
  object TglDari: TDateTimePicker
    Left = 272
    Top = 8
    Width = 89
    Height = 21
    Date = 41318.000000000000000000
    Time = 41318.000000000000000000
    TabOrder = 5
  end
  object TglSampai: TDateTimePicker
    Left = 408
    Top = 8
    Width = 89
    Height = 21
    Date = 41318.000000000000000000
    Time = 41318.000000000000000000
    TabOrder = 6
  end
  object NoKPP: TComboBox
    Left = 48
    Top = 56
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = NoKPPChange
  end
  object Panel2: TPanel
    Left = 152
    Top = 56
    Width = 153
    Height = 25
    BevelOuter = bvNone
    Caption = 'Panel1'
    Enabled = False
    TabOrder = 4
    object Mitra: TEdit
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object Cari: TEdit
    Left = 48
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = CariChange
  end
  object StrGrid: TZColorStringGrid
    Left = 16
    Top = 88
    Width = 481
    Height = 321
    ColCount = 4
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 9
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
