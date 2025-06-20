object SerahTerimaBarang: TSerahTerimaBarang
  Left = 287
  Top = 362
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Tanda Terima'
  ClientHeight = 388
  ClientWidth = 807
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
  object StrGrid: TZColorStringGrid
    Left = 0
    Top = 97
    Width = 807
    Height = 250
    Align = alClient
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    TabOrder = 0
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
  object Qty: TEdit
    Left = 260
    Top = 154
    Width = 41
    Height = 21
    TabOrder = 1
    Visible = False
    OnExit = QtyExit
    OnKeyPress = QtyKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 347
    Width = 807
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Selesai: TButton
      Left = 445
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = SelesaiClick
    end
    object Simpan: TButton
      Left = 205
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 285
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 2
      OnClick = BersihkanClick
    end
    object CetakUlang: TButton
      Left = 365
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cetak Ulang'
      TabOrder = 3
      OnClick = CetakUlangClick
    end
  end
  object Keterangan: TEdit
    Left = 304
    Top = 152
    Width = 241
    Height = 21
    TabOrder = 3
    Visible = False
    OnExit = KeteranganExit
    OnKeyPress = KeteranganKeyPress
  end
  object ItemDetail: TComboBox
    Left = 72
    Top = 142
    Width = 145
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnChange = ItemDetailChange
    OnExit = ItemDetailExit
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 807
    Height = 97
    Align = alTop
    TabOrder = 5
    object Label1: TLabel
      Left = 58
      Top = 16
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label6: TLabel
      Left = 17
      Top = 42
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Serah Terima'
    end
    object Label2: TLabel
      Left = 299
      Top = 19
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Diterima Oleh'
    end
    object Label5: TLabel
      Left = 284
      Top = 45
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Item Request'
    end
    object CariItemReq: TSpeedButton
      Left = 529
      Top = 41
      Width = 23
      Height = 23
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
      OnClick = CariItemReqClick
    end
    object Label3: TLabel
      Left = 366
      Top = 16
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 367
      Top = 42
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 329
      Top = 69
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object Label8: TLabel
      Left = 21
      Top = 66
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipe Kendaraan'
    end
    object Label9: TLabel
      Left = 57
      Top = 101
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Catatan'
      Visible = False
    end
    object DiterimaOleh: TEdit
      Left = 376
      Top = 16
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object NoTandaTerima: TEdit
      Left = 104
      Top = 40
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = NoTandaTerimaChange
    end
    object NoItemRequest: TEdit
      Left = 376
      Top = 42
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnChange = NoItemRequestChange
    end
    object Tanggal: TEdit
      Left = 104
      Top = 16
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object NoPol: TEdit
      Left = 376
      Top = 67
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object TipeKendaraan: TEdit
      Left = 104
      Top = 64
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object Catatan: TMemo
      Left = 104
      Top = 99
      Width = 449
      Height = 41
      TabOrder = 6
      Visible = False
    end
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 150000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'D:\WH App\PBJRpt.rtm'
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
    Left = 16
    Top = 89
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 66940
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'BON PENGELUARAN BARANG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 55827
        mmTop = 31221
        mmWidth = 83079
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 0.250000000000000000
        Caption = 'No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 265
        mmTop = 59267
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Nama Barang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 8996
        mmTop = 56621
        mmWidth = 101865
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Jumlah'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 114565
        mmTop = 59267
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tanggal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112184
        mmTop = 48419
        mmWidth = 13293
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 48683
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Type Kendaraan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 265
        mmTop = 43656
        mmWidth = 27093
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 43921
        mmWidth = 1058
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 10319
        mmLeft = 194469
        mmTop = 56621
        mmWidth = 265
        BandType = 0
      end
      object ppLogo: TppImage
        UserName = 'Logo'
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        mmHeight = 19315
        mmLeft = 0
        mmTop = 1588
        mmWidth = 57415
        BandType = 0
      end
      object ppTypeKendaraan: TppLabel
        UserName = 'TypeKendaraan'
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
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 43921
        mmWidth = 55600
        BandType = 0
      end
      object ppTanggal: TppLabel
        UserName = 'ppTanggal'
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
        mmHeight = 3969
        mmLeft = 139171
        mmTop = 48683
        mmWidth = 54769
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PT.WEHA TRANSPORTASI INDONESIA, Tbk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 2381
        mmWidth = 63765
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Graha Whitehorse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 129911
        mmTop = 5821
        mmWidth = 27432
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Jl.Husein Sastranegara No. 111'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 129911
        mmTop = 9525
        mmWidth = 39751
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rawa Bokor, Benda-Tangerang 15125'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 129911
        mmTop = 12700
        mmWidth = 54504
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'T. +62 21 2967 5555'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 129911
        mmTop = 16404
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'F. +62 21 2967 5005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 129911
        mmTop = 20108
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'www.whitehorse.co.id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 129911
        mmTop = 23813
        mmWidth = 32544
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clRed
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 27252
        mmWidth = 195000
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clRed
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 28310
        mmWidth = 195000
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
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
        mmHeight = 4191
        mmLeft = 265
        mmTop = 48419
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 48683
        mmWidth = 1058
        BandType = 0
      end
      object ppNoPol: TppLabel
        UserName = 'NoTandaTerima1'
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
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 48683
        mmWidth = 55827
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112184
        mmTop = 43656
        mmWidth = 4699
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 43921
        mmWidth = 1058
        BandType = 0
      end
      object ppNoTerima: TppLabel
        UserName = 'ppNoTerima'
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
        mmHeight = 3969
        mmLeft = 139171
        mmTop = 43921
        mmWidth = 54769
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.500000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 56621
        mmWidth = 194734
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.500000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 66940
        mmWidth = 194734
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10200
        mmLeft = 8467
        mmTop = 56621
        mmWidth = 1323
        BandType = 0
      end
      object pln1: TppLine
        UserName = 'Line101'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10200
        mmLeft = 0
        mmTop = 56621
        mmWidth = 1323
        BandType = 0
      end
      object pln2: TppLine
        UserName = 'Line103'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10200
        mmLeft = 110596
        mmTop = 56621
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Kode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 8731
        mmTop = 61913
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Nama'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 44186
        mmTop = 61913
        mmWidth = 65881
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 42598
        mmTop = 61648
        mmWidth = 1323
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.500000000000000000
        mmHeight = 2117
        mmLeft = 8731
        mmTop = 61648
        mmWidth = 101800
        BandType = 0
      end
      object pln5: TppLine
        UserName = 'pln5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 143934
        mmTop = 56886
        mmWidth = 1588
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Keterangan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 156898
        mmTop = 59267
        mmWidth = 25929
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 4498
        mmWidth = 194734
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 110596
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 4498
        mmLeft = 194469
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 8467
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppItemService: TppDBText
        UserName = 'ppItemService'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'item_detail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 43392
        mmTop = 0
        mmWidth = 67469
        BandType = 4
      end
      object ppNo: TppDBText
        UserName = 'ppNo'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppQty: TppDBText
        UserName = 'ppQty'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object pln3: TppLine
        UserName = 'pln3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 121709
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object pln4: TppLine
        UserName = 'pln4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 133615
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 143934
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object pln6: TppLine
        UserName = 'pln6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 42598
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppKodePart: TppDBText
        UserName = 'ppKodePart'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'kode_part_gp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 10054
        mmTop = 0
        mmWidth = 32015
        BandType = 4
      end
      object ppKet: TppDBText
        UserName = 'ppQty1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'keterangan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 144727
        mmTop = 0
        mmWidth = 48948
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Gudang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 29104
        mmTop = 2910
        mmWidth = 13229
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Inventory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 90488
        mmTop = 2646
        mmWidth = 15875
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psClear
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 195263
        BandType = 8
      end
      object ppPengirim: TppLabel
        UserName = 'Requestor1'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 17198
        mmWidth = 52388
        BandType = 8
      end
      object ppinventory: TppLabel
        UserName = 'inventory'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 16933
        mmWidth = 48154
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Teknisi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 152136
        mmTop = 2381
        mmWidth = 11896
        BandType = 8
      end
      object ppPenerima: TppLabel
        UserName = 'Penerima1'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 16669
        mmWidth = 48154
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
