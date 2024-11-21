object CheckListIntegrateHpp: TCheckListIntegrateHpp
  Left = 268
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Checklist SJ Posting Integrate'
  ClientHeight = 493
  ClientWidth = 1014
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
  DesignSize = (
    1014
    493)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 494
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object ToXCel: TSpeedButton
    Left = 979
    Top = 464
    Width = 25
    Height = 22
    Anchors = [akTop, akRight]
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
    Left = 248
    Top = 16
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label6: TLabel
    Left = 632
    Top = 15
    Width = 16
    Height = 13
    Caption = 's/d'
    Visible = False
  end
  object lbl1: TLabel
    Left = 270
    Top = 469
    Width = 175
    Height = 13
    Caption = 'Perjalanan belum selesai (Completed)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupTotal: TGroupBox
    Left = 8
    Top = 456
    Width = 249
    Height = 33
    TabOrder = 4
    object Label4: TLabel
      Left = 105
      Top = 11
      Width = 68
      Height = 13
      Caption = 'Total Data SJ '
    end
    object TotalUnitOperasi: TEdit
      Left = 172
      Top = 8
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object chk1: TCheckBox
      Left = 12
      Top = 9
      Width = 82
      Height = 17
      Caption = 'Ceklis semua'
      TabOrder = 1
      OnClick = chk1Click
    end
  end
  object Tanggal: TDateTimePicker
    Left = 542
    Top = 13
    Width = 89
    Height = 21
    Date = 41208.000000000000000000
    Time = 41208.000000000000000000
    TabOrder = 0
  end
  object Selesai: TButton
    Left = 900
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object Batch: TComboBox
    Left = 312
    Top = 16
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Visible = False
    OnChange = BatchChange
  end
  object Refresh: TButton
    Left = 928
    Top = 9
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Lihat Data'
    TabOrder = 3
    OnClick = RefreshClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 48
    Width = 998
    Height = 409
    Anchors = [akLeft, akTop, akRight]
    ColCount = 20
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
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
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 352
    Top = 8
    Width = 129
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 6
    Visible = False
    object GroupDisp: TEdit
      Left = 0
      Top = 8
      Width = 113
      Height = 21
      TabOrder = 0
    end
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 6
    Width = 281
    Height = 33
    TabOrder = 7
    object Label5: TLabel
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
  object CekTglSampai: TCheckBox
    Left = 656
    Top = 15
    Width = 17
    Height = 17
    TabOrder = 8
    Visible = False
    OnClick = CekTglSampaiClick
  end
  object TglSampai: TDateTimePicker
    Left = 672
    Top = 13
    Width = 89
    Height = 21
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 9
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 762
    Top = 252
    Width = 151
    Height = 33
    TabOrder = 10
    Visible = False
    object Label2: TLabel
      Left = 7
      Top = 11
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pilihan'
    end
    object isAll: TComboBox
      Left = 42
      Top = 8
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'All'
      Items.Strings = (
        'All'
        'Pesanan'
        'Service/Storing')
    end
  end
  object CheckSelect: TCheckBox
    Left = 79
    Top = 94
    Width = 14
    Height = 15
    TabOrder = 11
    Visible = False
    OnClick = CheckSelectClick
    OnExit = CheckSelectExit
  end
  object Simpan: TButton
    Left = 808
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 12
    OnClick = SimpanClick
  end
end
