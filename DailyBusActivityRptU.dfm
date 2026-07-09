object DailyBusActivityRpt: TDailyBusActivityRpt
  Left = 341
  Top = 212
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Laporan Aktifitas Harian'
  ClientHeight = 592
  ClientWidth = 1167
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
    1167
    592)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 10
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object ToXCel: TSpeedButton
    Left = 1021
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
    Left = 398
    Top = 10
    Width = 63
    Height = 13
    Caption = 'Jenis Armada'
  end
  object Label5: TLabel
    Left = 711
    Top = 10
    Width = 22
    Height = 13
    Caption = 'Seat'
  end
  object Label2: TLabel
    Left = 200
    Top = 564
    Width = 118
    Height = 13
    Caption = '>Aktifitas COMPLETED<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 806
    Top = 10
    Width = 64
    Height = 13
    Caption = 'Jenis Aktifitas'
  end
  object Batch: TComboBox
    Left = 467
    Top = 8
    Width = 238
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = BatchChange
  end
  object LihatData: TButton
    Left = 1040
    Top = 8
    Width = 99
    Height = 25
    Caption = 'Lihat Data'
    TabOrder = 2
    OnClick = LihatDataClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 48
    Width = 1147
    Height = 505
    Anchors = [akLeft, akTop, akRight]
    ColCount = 12
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    FixedRows = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 3
    OnDblClick = StrGridDblClick
    OnKeyDown = StrGridKeyDown
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
  object Seat: TComboBox
    Left = 737
    Top = 8
    Width = 49
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object Selesai: TButton
    Left = 575
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object Tanggal: TDateTimePicker
    Left = 304
    Top = 8
    Width = 89
    Height = 21
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 5
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 241
    Height = 33
    TabOrder = 6
    object Label4: TLabel
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
  object GroupTotal: TGroupBox
    Left = 8
    Top = 554
    Width = 177
    Height = 33
    TabOrder = 7
    object lbl5: TLabel
      Left = 5
      Top = 11
      Width = 79
      Height = 13
      Caption = 'Total Kendaraan'
    end
    object Total: TEdit
      Left = 99
      Top = 8
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 0
    end
  end
  object JenisAktifitas: TComboBox
    Left = 875
    Top = 8
    Width = 134
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = 'All'
    Items.Strings = (
      'All'
      'Order'
      'PKB'
      'Tidak ada aktifitas')
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 208
    object Copy1: TMenuItem
      Caption = '&Copy'
      OnClick = Copy1Click
    end
  end
end
