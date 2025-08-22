object DailyOrderFeeRpt: TDailyOrderFeeRpt
  Left = 207
  Top = 147
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Laporan Uang Order Harian'
  ClientHeight = 498
  ClientWidth = 1037
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
    1037
    498)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 210
    Top = 65
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object ToXCel: TSpeedButton
    Left = 775
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
    Left = 221
    Top = 16
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label6: TLabel
    Left = 361
    Top = 64
    Width = 16
    Height = 13
    Caption = 's/d'
  end
  object Label7: TLabel
    Left = 204
    Top = 466
    Width = 134
    Height = 13
    Caption = '>Input menggunakan Apps<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 715
    Top = 22
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object btnTombolCari: TSpeedButton
    Left = 862
    Top = 18
    Width = 26
    Height = 22
    Glyph.Data = {
      26040000424D2604000000000000360000002800000012000000120000000100
      180000000000F003000000000000000000000000000000000000F8F8F8F8F8F8
      F8F8F8F8F8F8F7F7F7F7F7F7F7F7F7F7F7F7F6F7F7F7F6F6F6F6F6F7F7F7F4F5
      F4F7F7F7FBFAF9D2D8D5E4E7E6FCFCFC0000F7F7F7F7F7F7F7F7F7F7F7F7F8F8
      F8F7F7F7F7F8F7F7F8F8F6F8F7F7F7F7F7F7F7F5F5F5F6F4F6FAFAFAD8DBDB95
      83899F9598E9EBEB0000F8F8F8F8F8F8F8F8F8F8F8F8F7F7F7F8F8F8F7F7F7F7
      F7F7F7F7F7F7F8F6F5F5F5F6F5F5FAF9F9D3D9D89B868D8F4054742C41B8AFB4
      3D22F7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F4F4F4F3F3F3F4F4F4F4F5F4
      F7F6F6FAF9F9D2D7D69A80898F405596354E7A263FBFAFB70000F6F7F7F7F6F7
      F6F6F6F5F5F5F6F6F6F8F6F7FCFBFBFDFEFEFCFAFAF6F4F5F7F7F7D3D8D7997F
      8990405693354E7C2B41B399A3FBFCFD0000F7F7F7F6F6F6F6F6F6F8F7F7FBFB
      FBF5FAF9E4E7E7DCDEDEE6EAEAFDFFFFE4E5E5997E8790415892344F7D2D42AF
      959DFCFEFEF8F8F70000F6F6F6F5F4F5F8F7F7EEF1F0C8C8C9A39191977A7A9C
      7D7C957979AB9C9DC1C1C28F495D8D27437E2E44AF929BFBFCFCF7F5F6F3F3F4
      0000F5F5F5F9F7F8F2F4F5C1BBBCAF9496CBA8A0DFBDACE7C7B4DDB9A9BD958C
      A689879E74807E3447AC8D97FAFBFBF7F6F6F2F2F3F7F7F70000F6F5F5FBFDFD
      D5CFCFBCA1A3F7E9E4FCE9D5F8D7B7F8D6B6FBD9B9FEE2C7E5C4B4A37E7DC7C0
      C3FBFBFBF7F6F6F4F4F4F7F7F7F7F6F60000FAFBFAF3F4F4C2A9A9E9D9D9FFFB
      F4EED2B8F0CFB1F3D4B9F2D2B5F4D4BAFFE9D3DAB6ABC1A7A7FCFFFFF4F3F3F6
      F6F6F7F7F6F6F7F60000FDFFFFE9DFDFC29D9DFFF6EDF4E3D3F5DAC6F7E7D9F7
      ECE0F7E9DDF4E1D1F8E6D6F2DDCFBE9897E7E1E3FBFEFDF4F3F3F5F6F7F7F6F7
      0102FEFEFEE4D3D4CEA49EFCE7D0F0CFB6F6E6D6F8F3EDF7F7F5F7F2EFF6ECE5
      F7EDE3F7EBE1D6B7B5E1D8D9FBFFFEF4F3F3F6F6F6F6F7F70801FDFFFFE5D5D7
      CFA398F8D9BAECCBAEF7EADFF7F3F0F7F5F3F6F5EFF5F3EEF8F6F2F8F1EDDCC1
      C0E8E0E1FBFEFEF4F3F3F7F7F7F7F7F70000FAFDFDF0E6E8CBA29AFADEC2F2D8
      BFF7E8DDF7EFE7F6EFEAF6F5EFF5F7F3F6F9F8F6F1EEDAC3C4F3F0F0F9FAFAF6
      F4F4F7F6F7F7F6F80000F7F6F7F9FBFBD5B8B9DFBCAEFFF4DFF2E0D1F3E4D7F5
      E8DEF4EFEBF6F6F6FDFFFEEBDEDDE4D7D9F9FCFCF4F4F4F6F6F6F6F7F7F6F7F7
      0000F4F5F4F9FAFAF3EAEBC89F9DE2C3B5FFF0DAFDEDDBFCF2E3FFFBF1FDFBF7
      EADBDBE2CFD1F7F5F6F7F7F7F5F5F5F6F7F6F7F7F7F6F6F70000F6F6F6F6F4F4
      FAFCFBEFE6E7CEABAAD1ADA6DBBBAFE1C3B6DFC6BCDAC1C0E3D0D2F6F3F4F8F8
      F8F5F5F5F7F7F8F7F6F6F7F7F7F7F7F80000F5F7F6F6F6F6F6F4F5F9FAFAF9F9
      F9EADFE0D9BFBFD6B8B8E1CBCDF0E9EAF8F9F9F6F7F8F6F6F5F6F7F8F7F7F7F7
      F7F7F7F8F8F7F7F70000}
    OnClick = btnTombolCariClick
  end
  object Label8: TLabel
    Left = 569
    Top = 466
    Width = 193
    Height = 13
    Caption = '> Perjalanan belum selesai (Completed) <'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 360
    Top = 466
    Width = 85
    Height = 13
    Caption = '>Sudah Transfer<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 207
    Top = 41
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object GroupTotal: TGroupBox
    Left = 8
    Top = 456
    Width = 185
    Height = 33
    Enabled = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 85
      Height = 13
      Caption = 'Total Unit Operasi'
    end
    object TotalUnitOperasi: TEdit
      Left = 104
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 0
    end
  end
  object Tanggal: TDateTimePicker
    Left = 257
    Top = 62
    Width = 104
    Height = 21
    Date = 41208.000000000000000000
    Time = 41208.000000000000000000
    TabOrder = 0
  end
  object Selesai: TButton
    Left = 475
    Top = 460
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object Batch: TComboBox
    Left = 258
    Top = 14
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = BatchChange
  end
  object Refresh: TButton
    Left = 900
    Top = 18
    Width = 74
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'Lihat Data'
    TabOrder = 3
    OnClick = RefreshClick
  end
  object StrGrid: TZColorStringGrid
    Left = 1
    Top = 87
    Width = 1036
    Height = 364
    Anchors = [akLeft, akTop, akRight]
    ColCount = 45
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
    PopupMenu = PopupMenu1
    TabOrder = 5
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
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 301
    Top = 13
    Width = 220
    Height = 24
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 6
    object GroupDisp: TEdit
      Left = 3
      Top = 1
      Width = 214
      Height = 21
      TabOrder = 0
    end
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 6
    Width = 193
    Height = 33
    TabOrder = 7
    object Label5: TLabel
      Left = 10
      Top = 11
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object SBU: TComboBox
      Left = 38
      Top = 8
      Width = 147
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object CekTglSampai: TCheckBox
    Left = 385
    Top = 64
    Width = 17
    Height = 17
    TabOrder = 8
    OnClick = CekTglSampaiClick
  end
  object TglSampai: TDateTimePicker
    Left = 401
    Top = 62
    Width = 89
    Height = 21
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 9
  end
  object GroupBox1: TGroupBox
    Left = 548
    Top = 10
    Width = 151
    Height = 33
    TabOrder = 10
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
      TabOrder = 0
      Items.Strings = (
        'All'
        'Pesanan'
        'Service/Storing')
    end
  end
  object edtCari: TEdit
    Left = 739
    Top = 19
    Width = 121
    Height = 21
    TabOrder = 11
    OnChange = edtCariChange
    OnKeyPress = edtCariKeyPress
  end
  object GroupBox2: TGroupBox
    Left = 548
    Top = 42
    Width = 473
    Height = 40
    Caption = ' Filter '
    TabOrder = 12
    object cbCancel: TCheckBox
      Left = 7
      Top = 14
      Width = 82
      Height = 17
      Caption = 'Data Cancel'
      TabOrder = 0
    end
    object CekTglMasuk: TCheckBox
      Left = 91
      Top = 14
      Width = 70
      Height = 17
      Caption = 'Tgl Masuk'
      TabOrder = 1
      OnClick = CekTglMasukClick
    end
    object CekBBM: TCheckBox
      Left = 283
      Top = 14
      Width = 115
      Height = 17
      Caption = 'Blm Isi BBM SPBU'
      TabOrder = 2
      OnClick = CekTglSampaiClick
    end
    object CekTglInput: TCheckBox
      Left = 179
      Top = 14
      Width = 70
      Height = 17
      Caption = 'Tgl Input'
      TabOrder = 3
      OnClick = CekTglInputClick
    end
  end
  object CustomerName: TEdit
    Left = 258
    Top = 38
    Width = 199
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object Button1: TButton
    Left = 458
    Top = 35
    Width = 30
    Height = 25
    Caption = '...'
    TabOrder = 14
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 490
    Top = 35
    Width = 31
    Height = 25
    Hint = 'Hapus Customer'
    Caption = ' '
    DragKind = dkDock
    TabOrder = 15
    OnClick = BitBtn1Click
    Kind = bkAbort
    Style = bsNew
  end
  object ppReportReimburse: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Surat Jalan'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 541
    Template.FileName = 'D:\Source\SC Delphi\06 Jan 2020\formReimburse.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 720
    Top = 184
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel58: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'FORM REIMBURSE BBM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 6879
        mmLeft = 1852
        mmTop = 4763
        mmWidth = 193411
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2117
        mmTop = 12700
        mmWidth = 192882
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 88371
      mmPrintPosition = 0
      object ppDriver: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4200
        mmLeft = 28046
        mmTop = 17198
        mmWidth = 54504
        BandType = 4
      end
      object ppJenisUnit: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4200
        mmLeft = 28046
        mmTop = 11906
        mmWidth = 69056
        BandType = 4
      end
      object ppNoSJ: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4200
        mmLeft = 28046
        mmTop = 1323
        mmWidth = 54504
        BandType = 4
      end
      object ppNoPolisi: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4200
        mmLeft = 28046
        mmTop = 6615
        mmWidth = 70115
        BandType = 4
      end
      object ppLabel49: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No. SJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 1323
        mmWidth = 21431
        BandType = 4
      end
      object ppLabel50: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25929
        mmTop = 1323
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel51: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No. Polisi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 6615
        mmWidth = 21431
        BandType = 4
      end
      object ppLabel52: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25929
        mmTop = 6615
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel53: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25929
        mmTop = 11906
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel54: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25929
        mmTop = 17198
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel55: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Jenis Unit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4200
        mmLeft = 4763
        mmTop = 11906
        mmWidth = 21431
        BandType = 4
      end
      object ppLabel56: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pengemudi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 17198
        mmWidth = 21431
        BandType = 4
      end
      object ppBudgetLiter: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 60061
        mmTop = 30163
        mmWidth = 27781
        BandType = 4
      end
      object ppBudgetNominal: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 91546
        mmTop = 30163
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SPBU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 34660
        mmWidth = 18785
        BandType = 4
      end
      object ppSPBULiter: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 60061
        mmTop = 34660
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'BUDGET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 30163
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'REIMBURSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 39688
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'LITER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 60061
        mmTop = 24606
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NOMINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 24606
        mmWidth = 27781
        BandType = 4
      end
      object ppSPBUNominal: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 91546
        mmTop = 34660
        mmWidth = 28046
        BandType = 4
      end
      object ppReimburseLiter: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 60061
        mmTop = 39688
        mmWidth = 27781
        BandType = 4
      end
      object ppReimburseNominal: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 91546
        mmTop = 39688
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 45773
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Border.BorderPositions = [bpTop, bpBottom]
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6085
        mmLeft = 59002
        mmTop = 44450
        mmWidth = 60854
        BandType = 4
      end
      object ppTotalLiter: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 60061
        mmTop = 45773
        mmWidth = 27781
        BandType = 4
      end
      object ppTotalNominal: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 45773
        mmWidth = 28046
        BandType = 4
      end
      object ppKMKeluar: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 53181
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KM MASUK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 4763
        mmTop = 57679
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KM KELUAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 4763
        mmTop = 53181
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KM KELUAR - KM MASUK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 4763
        mmTop = 62971
        mmWidth = 55033
        BandType = 4
      end
      object ppKMMasuk: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 57679
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 62971
        mmWidth = 28046
        BandType = 4
      end
      object ppKMJalan: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Border.BorderPositions = [bpTop, bpBottom]
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 6085
        mmLeft = 88106
        mmTop = 61648
        mmWidth = 31750
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 88106
        mmTop = 68263
        mmWidth = 31750
        BandType = 4
      end
      object ppRasio: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4400
        mmLeft = 91546
        mmTop = 71967
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'STANDART RASIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 76200
        mmWidth = 49213
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RASIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4400
        mmLeft = 4763
        mmTop = 71967
        mmWidth = 23548
        BandType = 4
      end
      object ppRasioStandar: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4400
        mmLeft = 91546
        mmTop = 76200
        mmWidth = 28046
        BandType = 4
      end
      object ppSelisihRatio: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4403
        mmLeft = 91546
        mmTop = 80698
        mmWidth = 28046
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tgl Terbit : 17/03/2020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 163777
        mmTop = 1058
        mmWidth = 24342
        BandType = 8
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rev: 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2381
        mmLeft = 89694
        mmTop = 1058
        mmWidth = 10848
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
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
