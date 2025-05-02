object EmplHistoryTrainingRpt: TEmplHistoryTrainingRpt
  Left = 202
  Top = 36
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Laporan History Training'
  ClientHeight = 576
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToXCel: TSpeedButton
    Left = 798
    Top = 543
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
  object Label2: TLabel
    Left = 429
    Top = -19
    Width = 15
    Height = 13
    Caption = 's/d'
  end
  object LihatData: TButton
    Left = 828
    Top = 16
    Width = 86
    Height = 26
    Caption = 'Lihat'
    TabOrder = 0
    OnClick = LihatDataClick
  end
  object GridHistTraining: TZColorStringGrid
    Left = 0
    Top = 93
    Width = 1129
    Height = 441
    ColCount = 9
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 1
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
    Left = 574
    Top = 540
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object GroupCompany: TGroupBox
    Left = 1
    Top = 0
    Width = 208
    Height = 33
    TabOrder = 3
    object Label4: TLabel
      Left = 19
      Top = 11
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object SBU: TComboBox
      Left = 48
      Top = 8
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Periode: TRadioGroup
    Left = 214
    Top = 3
    Width = 283
    Height = 38
    ItemIndex = 0
    Items.Strings = (
      'Tanggal                                    s/d')
    TabOrder = 4
    OnClick = PeriodeClick
  end
  object TglSampai: TDateTimePicker
    Left = 405
    Top = 17
    Width = 89
    Height = 22
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 5
    OnChange = TglSampaiChange
  end
  object Tanggal: TDateTimePicker
    Left = 291
    Top = 18
    Width = 89
    Height = 20
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 6
    OnChange = TanggalChange
  end
  object Panel1: TPanel
    Left = 507
    Top = 2
    Width = 310
    Height = 35
    TabOrder = 7
    object Label3: TLabel
      Left = 8
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Nama Peserta'
    end
    object Driver: TEdit
      Left = 80
      Top = 6
      Width = 193
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object CariDriver: TButton
      Left = 277
      Top = 6
      Width = 26
      Height = 23
      Caption = '..'
      TabOrder = 1
      OnClick = CariDriverClick
    end
  end
  object GroupTotal: TGroupBox
    Left = 3
    Top = 534
    Width = 161
    Height = 33
    Enabled = False
    TabOrder = 8
    object Label1: TLabel
      Left = 2
      Top = 11
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total History Training'
    end
    object Total: TMemo
      Left = 107
      Top = 8
      Width = 49
      Height = 22
      Alignment = taRightJustify
      TabOrder = 0
    end
  end
  object RadTypeEmpl: TRadioGroup
    Left = 572
    Top = 46
    Width = 245
    Height = 40
    Caption = 'Tipe Karyawan'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'SEMUA'
      'DRIVER'
      'CO-DRIVER')
    TabOrder = 9
    OnClick = RadTypeEmplClick
  end
  object GroupBox1: TGroupBox
    Left = 213
    Top = 46
    Width = 356
    Height = 41
    Caption = 'Materi'
    TabOrder = 10
    object Materi: TEdit
      Left = 5
      Top = 14
      Width = 316
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 324
      Top = 12
      Width = 26
      Height = 23
      Caption = '..'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Button2: TButton
    Left = 828
    Top = 48
    Width = 86
    Height = 26
    Caption = 'Bersihkan'
    TabOrder = 11
    OnClick = Button2Click
  end
end
