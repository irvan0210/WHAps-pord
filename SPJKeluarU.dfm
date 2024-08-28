object SPJKeluar: TSPJKeluar
  Left = 561
  Top = 193
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data SPJ '
  ClientHeight = 370
  ClientWidth = 602
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
  object ToXCel: TSpeedButton
    Left = 571
    Top = 345
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
  object Selesai: TButton
    Left = 256
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 4
    Width = 585
    Height = 333
    Caption = 'Data SPJ'
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Lokasi'
    end
    object GridSPJ: TStringGrid
      Left = 8
      Top = 72
      Width = 569
      Height = 257
      TabStop = False
      ColCount = 8
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 1
      OnDblClick = GridSPJDblClick
      OnSelectCell = GridSPJSelectCell
      ColWidths = (
        27
        93
        50
        79
        142
        64
        42
        38)
    end
    object Panel1: TPanel
      Left = 88
      Top = 8
      Width = 489
      Height = 41
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object Label12: TLabel
        Left = 263
        Top = 24
        Width = 74
        Height = 13
        Caption = 'Total Unit Jalan'
      end
      object Label22: TLabel
        Left = 348
        Top = 0
        Width = 21
        Height = 13
        Caption = 'Pagi'
      end
      object Label21: TLabel
        Left = 434
        Top = 0
        Width = 31
        Height = 13
        Caption = 'Malam'
      end
      object UnitJalanPagi: TEdit
        Left = 344
        Top = 20
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object UnitJalanMalam: TEdit
        Left = 432
        Top = 20
        Width = 41
        Height = 21
        TabOrder = 1
      end
      object LokasiDisp: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object DayNight: TComboBox
      Left = 256
      Top = 24
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = DayNightChange
    end
    object Lokasi: TComboBox
      Left = 56
      Top = 24
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = LokasiChange
    end
    object Cari: TEdit
      Left = 56
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = CariChange
    end
  end
  object AutoRefresh: TCheckBox
    Left = 16
    Top = 344
    Width = 97
    Height = 17
    Caption = 'AutoRefresh'
    TabOrder = 2
    OnClick = AutoRefreshClick
  end
  object TimerUpdate: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerUpdateTimer
    Left = 136
    Top = 344
  end
end
