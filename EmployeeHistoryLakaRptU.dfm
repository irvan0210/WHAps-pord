object EmployeeHistoryLakaRpt: TEmployeeHistoryLakaRpt
  Left = 63
  Top = 187
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Laporan History LaKa'
  ClientHeight = 551
  ClientWidth = 1218
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
    Left = 931
    Top = 522
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
    Left = 405
    Top = 14
    Width = 15
    Height = 13
    Caption = 's/d'
  end
  object Label3: TLabel
    Left = 544
    Top = 500
    Width = 44
    Height = 13
    Caption = '>Closed<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LihatData: TButton
    Left = 1126
    Top = 28
    Width = 86
    Height = 26
    Caption = 'Lihat'
    TabOrder = 0
    OnClick = LihatDataClick
  end
  object GridHistLaka: TZColorStringGrid
    Left = 0
    Top = 72
    Width = 1217
    Height = 441
    ColCount = 9
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 1
    OnDblClick = GridHistLakaDblClick
    OnSelectCell = GridHistLakaSelectCell
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
  object Selesai: TButton
    Left = 600
    Top = 521
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 5
    Width = 241
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
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Periode: TRadioGroup
    Left = 253
    Top = 5
    Width = 305
    Height = 57
    ItemIndex = 0
    Items.Strings = (
      'Tanggal                                    s/d'
      'Bulan')
    TabOrder = 4
    OnClick = PeriodeClick
  end
  object Bulan: TDateTimePicker
    Left = 329
    Top = 38
    Width = 89
    Height = 20
    Date = 41964.570029108800000000
    Format = 'MMM yyyy'
    Time = 41964.570029108800000000
    TabOrder = 5
  end
  object TglSampai: TDateTimePicker
    Left = 463
    Top = 16
    Width = 89
    Height = 20
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 6
    OnChange = TglSampaiChange
  end
  object CekTglSampai: TCheckBox
    Left = 447
    Top = 18
    Width = 15
    Height = 17
    Caption = 'CekTglSampai'
    TabOrder = 7
    OnClick = CekTglSampaiClick
  end
  object Tanggal: TDateTimePicker
    Left = 329
    Top = 16
    Width = 89
    Height = 20
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 8
    OnChange = TanggalChange
  end
  object Panel1: TPanel
    Left = 563
    Top = 8
    Width = 282
    Height = 57
    TabOrder = 9
    object Label5: TLabel
      Left = 253
      Top = 10
      Width = 52
      Height = 13
      Caption = 'Pengemudi'
    end
    object Driver: TEdit
      Left = 105
      Top = 29
      Width = 144
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object RadSemuaDriver: TRadioButton
      Left = 8
      Top = 9
      Width = 129
      Height = 17
      Caption = 'Semua Pengemudi'
      TabOrder = 1
      OnClick = RadSemuaDriverClick
    end
    object RadPilihDriver: TRadioButton
      Left = 8
      Top = 33
      Width = 97
      Height = 17
      Caption = 'Pilih Pengemudi'
      TabOrder = 2
      OnClick = RadPilihDriverClick
    end
    object CariDriver: TButton
      Left = 252
      Top = 27
      Width = 26
      Height = 23
      Caption = '..'
      TabOrder = 3
      OnClick = CariDriverClick
    end
  end
  object GroupTotal: TGroupBox
    Left = 5
    Top = 517
    Width = 153
    Height = 33
    Enabled = False
    TabOrder = 10
    object Label1: TLabel
      Left = 7
      Top = 11
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total History LaKa '
    end
    object Total: TMemo
      Left = 98
      Top = 8
      Width = 49
      Height = 22
      Alignment = taRightJustify
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 856
    Top = 8
    Width = 265
    Height = 57
    TabOrder = 11
    object Label6: TLabel
      Left = 6
      Top = 14
      Width = 64
      Height = 13
      Caption = 'Jenis Armada'
    end
    object Label7: TLabel
      Left = 46
      Top = 37
      Width = 22
      Height = 13
      Caption = 'Seat'
    end
    object Batch: TComboBox
      Left = 73
      Top = 11
      Width = 189
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = BatchChange
    end
    object Seat: TComboBox
      Left = 73
      Top = 34
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object SBUtemp: TComboBox
    Left = 64
    Top = 72
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Visible = False
  end
end
