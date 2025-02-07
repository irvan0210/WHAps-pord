object BlockUnitForm: TBlockUnitForm
  Left = 356
  Top = 161
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Blok Unit'
  ClientHeight = 280
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 12
    Top = 253
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Selesai'
  end
  object Label4: TLabel
    Left = 20
    Top = 228
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Mulai'
  end
  object Label2: TLabel
    Left = 51
    Top = 192
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alasan'
  end
  object lbl1: TLabel
    Left = 89
    Top = 158
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 87
    Top = 190
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Selesai: TButton
    Left = 395
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 7
    OnClick = SelesaiClick
  end
  object Bersihkan: TButton
    Left = 395
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = BersihkanClick
  end
  object KeluhanGridSebelum: TStringGrid
    Left = 512
    Top = 256
    Width = 273
    Height = 81
    ColCount = 1
    DefaultRowHeight = 18
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 10
    ColWidths = (
      249)
  end
  object Simpan: TButton
    Left = 395
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 89
    Width = 378
    Height = 64
    TabOrder = 1
    object Label8: TLabel
      Left = 38
      Top = 39
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object Label1: TLabel
      Left = 39
      Top = 14
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Body'
    end
    object lbl2: TLabel
      Left = 30
      Top = 11
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 96
      Top = 8
      Width = 73
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 88
      Top = 8
      Width = 256
      Height = 53
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object Label7: TLabel
        Left = 146
        Top = 31
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'KM Odo'
      end
      object NoPolisi: TEdit
        Left = 0
        Top = 27
        Width = 105
        Height = 21
        TabOrder = 1
      end
      object KMOdo: TEdit
        Left = 192
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 2
      end
      object NoBody: TEdit
        Left = 0
        Top = 2
        Width = 73
        Height = 21
        TabOrder = 0
      end
    end
    object PanelCariSR: TPanel
      Left = 193
      Top = 31
      Width = 41
      Height = 25
      BevelOuter = bvNone
      TabOrder = 3
    end
    object PanelCari: TPanel
      Left = 161
      Top = 8
      Width = 41
      Height = 25
      BevelOuter = bvNone
      TabOrder = 2
      object TombolCari: TSpeedButton
        Left = 1
        Top = 0
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
        OnClick = TombolCariClick
      end
    end
  end
  object GroupNo: TGroupBox
    Left = 8
    Top = 0
    Width = 465
    Height = 89
    Enabled = False
    TabOrder = 0
    object Label3: TLabel
      Left = 26
      Top = 10
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Bloking'
    end
    object Label6: TLabel
      Left = 368
      Top = 10
      Width = 19
      Height = 13
      Caption = 'Jam'
    end
    object Label9: TLabel
      Left = 22
      Top = 36
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dibuat Oleh'
    end
    object Label10: TLabel
      Left = 262
      Top = 35
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Buat'
    end
    object Label12: TLabel
      Left = 1
      Top = 59
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Update Terakhir'
    end
    object Label13: TLabel
      Left = 249
      Top = 59
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Update'
    end
    object NoPKB: TEdit
      Left = 96
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Jam: TEdit
      Left = 400
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object CreateUser: TEdit
      Left = 96
      Top = 32
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object CreateDate: TEdit
      Left = 336
      Top = 32
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object UpdateUser: TEdit
      Left = 96
      Top = 56
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object UpdateDate: TEdit
      Left = 336
      Top = 56
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupInput: TPanel
    Left = 96
    Top = 222
    Width = 249
    Height = 54
    BevelOuter = bvNone
    TabOrder = 8
    object StartDate: TDateTimePicker
      Left = 0
      Top = 4
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 0
      OnChange = StartDateChange
    end
    object FinishDate: TDateTimePicker
      Left = 0
      Top = 28
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 1
    end
  end
  object Report: TQuickRep
    Left = 1096
    Top = -440
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      0.300000000000000000
      2970.000000000000000000
      0.300000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    object QRBand3: TQRBand
      Left = 48
      Top = 369
      Width = 698
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        1846.791666666667000000)
      BandType = rbDetail
      object QDeskripsi: TQRDBText
        Left = 40
        Top = 0
        Width = 297
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          0.000000000000000000
          785.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'description'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNo: TQRDBText
        Left = 8
        Top = 0
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'no'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape36: TQRShape
        Left = 328
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          867.833333333333500000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape37: TQRShape
        Left = 24
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          63.500000000000000000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape38: TQRShape
        Left = -8
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          -21.166666666666670000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape39: TQRShape
        Left = 376
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          994.833333333333400000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape40: TQRShape
        Left = 552
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1460.500000000000000000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape41: TQRShape
        Left = 688
        Top = -4
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1820.333333333333000000
          -10.583333333333330000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape21: TQRShape
        Left = 0
        Top = 358
        Width = 697
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          947.208333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape25: TQRShape
        Left = 0
        Top = 8
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 0
      Width = 698
      Height = 369
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        976.312500000000000000
        1846.791666666667000000)
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 432
        Top = 120
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          317.500000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. PKB :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 136
        Width = 697
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          359.833333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRLabel4: TQRLabel
        Left = 0
        Top = 64
        Width = 697
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          0.000000000000000000
          169.333333333333300000
          1844.145833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PERINTAH KERJA BENGKEL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object QRImage1: TQRImage
        Left = 536
        Top = 24
        Width = 161
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.812500000000000000
          1418.166666666667000000
          63.500000000000000000
          425.979166666666700000)
        Picture.Data = {
          0A544A504547496D6167654C160000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC0001108005E010903012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
          28A2800A28A2800AA97FA9D8E97179B7D770DBA76323819FA7AD54D71B5B36E2
          1D162B7133F59EE1F0B1FD140393FA579FDC7C2FD7352B86B8D435982499FEF3
          1DCE7F502B2A9392D231B9E8E0F0987A9EF622AA82EDBBFF0081FD6874D73F13
          7C356EC425C4F3E3FE79427FF66C5548FE2CF87DDB060D4107AB4498FD1AB0BF
          E14FDD7FD05E1FFBF27FC6A293E10EA201F2B52B563DB72B2FF8D60E788EC7B1
          1C36476B7B47F8FF0091D9DB7C45F0C5C90BF6F3113DA58987EB8C56ED9EB1A6
          EA201B3BFB69F3DA39013F9578E5CFC2FF0011C0098E3B79F1FF003CE51CFF00
          DF58AC5BAF0BF8834FF9A6D2EED00FE2542C07E232297D62AC7E2897FD8D9756
          FE057D7D53FC3467D15457CF167E2BF10E94DB21D4AE5429FB921DE07E0D9AE8
          ECBE2D6B108C5DDADADC8F500A37E9C7E9571C5C1EFA1CB5B86B150D69B52FC3
          F3FF0033D928AF39B5F8BBA73E3ED5A6DCC47BF96CAE3F5C569A7C50F0DB0C99
          2E53D9A1FF00035AAAF4DF53CE9E518E83B3A4FE5AFE47674570F71F14F408D7
          F731DDCEFD82C607F335971F8C75FF00166A8BA56916A34F89B99A72773C69DC
          E7A03EDD7DE93AF0D93B950CA316D394E3CB15BB7A7FC1FC0F498E549431460C
          0315C8F51D69F515B5BC5696D1DBC081228D42AA8EC054B5B1E6BB5F4D828A28
          A041451450014514500145145001451450014514500145145001451450014514
          5001597AC78874BD0A2DFA85D24648CAC63976FA01CD26A1FDAD784DBE9CC967
          1F47BB957730FF00713D7DCFE46A9D8783348B49CDD4F135FDE31CB5C5E3798C
          4FAE0F03F2A89393D2275D2A7422B9ABC9FA2DFE6F65F8BF239B9BC7DADEAC4A
          7873409A48FB4F32161FA703F3354E4D3FE256A59692E4DB2B7F0ACA91E3FEF9
          E6BD4028550AA0003A014B59BA2E5F149FE475C733A74BF81422BD7DE7F7B3C8
          9FC0FE3990967D57713EB7AFFE1511F07F8F6DCEE8AF27623FB97C7FA915EC54
          52FAB47BB3559F6216F08BF97FC13C68CDF1234C1B986A0C17D544DFE34E8FE2
          5F89B4F70B7F670BFA8961646FD08FE55EC74D9228E55DB222BA9ECC32297B09
          2F866CAFED8A153F8D878BF4D3FCCF2A3F12F49D41366B1E1C8E5CF520ABFF00
          E8407F3AAEFA87C37BE1BA4D3EEED5BFD8C8FD03115E8F73E15D06F093369168
          49EEB1853F98C5654DF0DBC312B122CA48F3FDC99BFA9352E9557BD99BD2CC32
          E8FC0AA43FC32D3F167072DA7C386E5350D4D7FD954FF15AA534BE05B5FF008F
          7B5D5AF5BFE9A4AB1A9FC40CFE95E86BF0BFC360E4C772C3D0CDFF00D6AD5B0F
          05F8774D657834C84BAF4697321FFC7B353EC26FA24743CE30905A4EA4BD5A5F
          8AD4F34D2349D57C46E1748D260D22C0F0D73B4B363D9DBE63FF0001C57AA681
          E1FB2F0F69E2D6D14966E6595BEF48DEA7FC2B54000000600E80515BD3A2A1AF
          53C5C76675314B912E58F6DEFEADEAC28A28AD8F3428AE1FE2678AF5EF05E8A9
          ACE9761677967190B72262C1932405230791938357BE1E78C57C73E128758302
          DBCDE6345344ADB82BAFA1F42083F8D0075545787F8EFE34EBDE0CF17DEE89FD
          95A6DC243B5A3937382C8C030C8CF5E79AF61D2AE2EEEF43B4B9B9FB38BB9A05
          91BCAC98C3119E33C91CD005FA2BC9FC07F127C51E31F175DE912695A6C369A7
          B30BBB98D9CE30C5405C9EA4838CF606A978B3E2DF88BC3DF10DBC2D0697A74D
          E64D1241339901224C6DC807B67071E9401ECB45226ED8BBC82D8E481C66BC66
          7F8B7E248BE26FFC21ABA5E985CDE8B6139327DC383BB19FEE9CE2803D9E8AE3
          FE24F8AB51F067851B5BD3EDADAE7CA951258E7DC3E5638C8C1EB9C564F82FE2
          16A7E21F00EA7E28D434F82316E5D6DEDED43B34A55471CE792C40005007A351
          5E2F73F11FE2859E9F2DFDCF80618ADA18CCB23BB30D8A06492376781543C3FF
          0018BC7DE2A49DF44F07D95E2C0544A52461B49CE3AB0F43401EEF4571FE0FD4
          FC71AAB4D2F89344B0D260098891242F23B7A9009017F5AF3BB3F8C3E34D4FC5
          F71E18D3FC3FA54FA8432CB160CAEAA7CB2771C93EC6803DD28AF2A93C59F153
          4FBDB56D4BC21A77D81E7449E4B590CAD1A16009C072780739C62BD56800A2BC
          83C6BF17F58F0978D9BC3B1E8769745CC66094CECA583F4C8C7073915EB91799
          E4A79DB7CDDA37ECE99EF8CF6A007D15E3BAAFC5FD734EF88CDE0F5D0ECA49DA
          EE3B78E6F3D8021F1B588C7A30CFE35EA9AAEAD65A16953EA5AA5CA5BDAC0BBA
          491BA0FA7A927802802F515E3B07C5FF0011F8AAF278BC0FE0E92F6DE13B5AE6
          EE4D8B9ED9E401F4DD9AADA8FC5DF19F842787FE12FF0005C70DACADB44D6D37
          07D81CB293EC48A00F6BA2B0FC37E29D37C5FA0AEA9A24E2446CAED9061A3703
          EEB8EDDBF0E95E53A6FC69F166B7E229741D2FC29653EA11348AC9F6B207C870
          C72702803DCA8AF12BEF8D9E22F0B6B90D8F8BFC22B671C8036E826DC76E71B9
          7AAB63D322BD9ED6E61BDB486EADDC3C1346B246E3F8948C83F91A009A8AF24D
          67E31DDDD789E4F0EF827423AD5EC45964999F6C791C1C63B03C6E240A8EE7E2
          07C49D12E6CBFB7BC1F650D9DC5C470B5C4329658F7B05E70CD8EBDE803D7E8A
          F33F8A1F13752F8797B60B16956F796D788C55DE56465652320E011DC7EB54ED
          FC77F132F74E8350B5F87F6F25B4F12CB130BE525958641C673D0D007AC515CE
          F8275FD43C47E1E17BAAE98DA6DF24D24335AB020A153EFCF2306BA2A0028A28
          A00C7F16690BAF784B56D299726E6D5D17D9B1F29FCF15E3FF00B36EA58B1D7B
          4A91B698A48EE003DB20AB7FE822BDE2BE479F5B97E1FF008DFC71636E183DDC
          7716906D1F74BC80A9FC149A00BFE28D1A4F1B697E32F1F47BDA3B7D4638AD7D
          1A15F958FE4633F81AF5EF879E308DFE09C7AC4EF97D2AD248A5C9EF103B47E2
          BB7F3AD7F0A78321D3FE15DBF866E50037164CB73C7FCB49012DF916C7E02BE6
          DD2F5CBED1FC2FE22F021571797F7D0C28A3B32BED907E3B505007BBFC0AD14E
          9FE01FED39D7FD2B569DEE5D8F52A0ED5FE44FFC0ABCD3E2BDEC1A6FC7CD3AFA
          E77082DDACE6936AEE3B55B2703B9C0AFA3747D362D1F44B1D36103CBB481215
          C77DAA067F4AF9EBE2430FF868CD1B91C4F639FF00BEC5007A4FFC2F3F05FF00
          CF4D47FF00009EBC974ED6ACBC45FB48D9EABA7990DADC5DA14322146E22C1C8
          3D3906BEA2DABFDD1F957CDB76CBFF000D5498231F6D8C7FE411401EA1F1BD41
          F84FAB7B3427FF0022AD51F801FF0024C22FFAFB9BF98ABDF1C182FC27D573DD
          A11FF9116A8FC00FF926117FD7DCDFCC500765E39FF9103C45FF0060DB8FFD16
          D5E53FB34AFF00C4A7C40DEB3C23FF001D6AF56F1CFF00C881E22FFB06DC7FE8
          B6AF29FD9A587F64F8817B89E13FF8EB5007BAD7CABA2F88B4DF09FC7BD6355D
          56578ED23BCBC566442E72C580E07D6BEAAAF99FC0F1C573FB486A893469221B
          ABDF95D430E377AD007ABE9FF18FC33ACDEC767A3C1AAEA37321C08EDECDB8F7
          25B000F73C57A00E402460FA5322821B752228A38D7A908A00A58668AE225961
          91248DB95743907E86803E6BF8D93C165F19747BB9CED86386DA49580CE15656
          24E3E82BD4BFE1797C3FFF00A0C4BFF8092FFF00135E65F18D91BE38684A7042
          A5A0607FEBAB57D15FD9F65FF3E96FFF007EC7F85007CC971AEE99E26FDA2F4B
          D574998CD6735E5B6D72853242A83C100F515D1FED27AD4EADA2E888E560657B
          A9541FBC73B573F4F9BF3ACCF1188A3FDA7EC12245455BBB51B540001D8B5A1F
          B49E8F39B8D175A4426008F6B2301F75B3B973F5CB7E5401EC3E04D16DB40F03
          E91616D1AA85B64790818DF2300CCC7DC926AC78B342B7F12785751D26E63575
          9E060991F75C0CAB0F70706B33E1B788ED7C4DE04D2EEA0955A5860482E101E5
          24400107EB8C8F635AFE27D6ED7C3BE1AD4355BB91522B7859864FDE6C7CAA3D
          C9C0FC6803C07F671D4A783C57AAE95B9BC89ED3CE2B9E03A3000FE4C6A8781B
          59D2FC37F1CF5ABCD56F23B4B459AF13CC9338C99381C56F7ECE3E1EB837DAA7
          89268CAC1E5FD961623EFB1219F1F4C28FC6B0FC07A569DE21F8E1AF58EA56B1
          5D5A4ED7B98E45CFF1F51E87D08E680363C7D249F19FC5DA669DE128649EC2C0
          32DC6A4F195894B919E4FA05E9D4E781DEBDFB4ED3E2D3748B5D36127CAB6812
          0427AE15428FE55F384136ABF01FE229825696E3C3B7C73FF5D22CFDE1DBCC4C
          F3EBF422BE89935DD3D3C3B26BC9389B4E4B6375E6C5F36E8C2EE247E1401F33
          5A49AEFC0CF88334F75626EB4FB80D1093A2DC42581055BB38C0C8FF00F5D7BF
          785FC75E18F1ED9B47A7DCA4926DCCB6570A1645FAA9EA3DC6456E4F6DA57897
          47559E2B6D434EBA40EA1D43A3A91C11FE35F307C4FF000D43F0D7C7F6171E19
          B996032A0BA8620C4B40C188C03D4A9C743EE2803B4FDA5FFE3D7C387FDB9FF9
          25751A17C65F0269FE1BD32D65D6196582D2289D05ACA70CA8011F771D45725F
          B4749249A5F859E64D92B79CCEBFDD2563C8AF5BF0A68BA40F0C68D731E99622
          46B285FCC5B740C4941CE71D68034741D76DBC45A6AEA16705D476CE711B5CC2
          62320FEF0079C7BD6A537CC4F33CBDEBE66376DCF38F5C53A800A28A2800AF2D
          D73E0BDA6B9F11478AA5D50AC4D3C534965F67C87D81411BB7743B7D3BD7A951
          4005797CDF066D26F89A3C5E7543E5FDAD6ECD97D9F8DE003F7B77F7867A57A8
          514005796788FE0D0F11F8CE4F134BE229A0BAF35248912D54AC7B31B47DEE7A
          0AF53A28011430450C416C7240C64D7964BF064CBE3A3E2DFF008492517FF6B1
          7413EC8BB010785FBDD30315EA94500731E3BF081F1BF87BFB19B516B281A559
          256488397DBC81C918E707F0A87E1FF820F80F469F4B8F537BEB7798CC9BE108
          5090011C1390702BADA280327C4DA33F88BC397DA425E1B41791989E658F790A
          7EF00323A8E3F1AE5FE1DFC335F87B3DF1B7D625BC82F1577C5240170CB9C104
          13EA6BBEA28011B254ED201C7048CD78FC5F02E5B6D7E6D72D7C657D6DA8CB23
          C8D3C36EAA417CEEC7CDDF26BD868A00F29BFF00841ACEA90986FBE22EB93C2D
          F7A361F291EE3762BD2B49D361D1F47B2D32DF261B48120427A90AA003FA55CA
          2803C9FC65F072EBC5DE326F111F11ADAC8BE588625B2DDB0274C9DE3273CFE3
          5EAD1090448256569028DC546013DF03B53A8A00F24D53E0D5F6A5E3F6F178F1
          2A45742E92E638BEC3955D98DAA4F99CF0A01AF4CD6346B0F106913E99AADB25
          C5ACEB8911BF983D4107906AFD719E36F166A1A55EE9BE1FF0F5B4573AFEA85B
          C9F3B3E5C11AFDE91F1D8761EC7E8403884F81BAAE81A94977E0FF00195CE9CB
          2758E4424E3B025480DF8AD5F3F07B55D7EE227F1AF8CAF756B789B72DA429E5
          213F9FF200FBD6CFFC22DF11205FB543E3E867BBEAD6F3E9882027D32BF301EF
          D6BBDB6F3FEC90FDA820B8D8BE6F97F777639C67B668021B1D3ADB49D322B0D3
          208ADADE14D90C6ABF2AFA71DFDFB9AF32F09FC1CBCF0BF8D57C4A3C489732B3
          C8D3446CB68903E770CEF38EB9FC2B1EC35FF1E4FE0DD57C629E2AB73169F713
          83A7DC5847B2448DB18DE30727B7BD7AFE81AA7F6DF87B4ED54C4613796D1CE6
          33FC3B941C7EB4019DE34F0769DE37F0FC9A56A00A1CEF827519685FB30FE447
          715CBF853E18EA7E1BD12FF409FC4E6FB45BD86489ADCDA6C78B7A905A36DE71
          D7A10454316B5E2DF885A9DFAF867518743D02CE66B617ED009A6BA75FBC501E
          02FBFF00FA825D6B3E2FF87379652F89353875EF0EDC4CB04B782DC4335AB374
          660382BFE7D32019F65F097C5BE1B46B7F0C78FE7B6B2272209EDF705FA7247E
          405697877E0EC36BE215F1178A3589F5FD59183A19576C68C3A1C64E71DBA01E
          95DA78C350B9D2FC17AD6A1652797736D652CB13E01DAC1490707834BE10BFB9
          D53C1BA35FDE49E65CDCD9452CAF8037315049C0E073401C9FC4AF85F3FC43BD
          B191B5B5B182CD1952316BE612CC46493BC7A0ED5421F869E37B5B186CADBE25
          DD476F046B1448B62176A8180321F3C0AE83C21AF6A5AA78D7C65A7DE5C7996B
          A75D431DAA6C51E5AB2924640C9E477ACAF12DEF8A351F8A50786B45F10FF645
          B1D2BED8CC2CE39F2C242BFC5F51DFB5006AF813C0973E11B8D4AF351D7AE359
          BEBED81A79D482AAB9E0659BBB576B5C0F823C41AE378AB5DF0A6BD796FA8DC6
          98B14B1DFC1108FCC5719DAEA380C3DBDEBBEA0028A28A0028A28A0028A28A00
          28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002BCCBC73
          2BF85BE22E85E34B986493474B67B0BD92352C6DB71255C81DB279FA7B8AF4DA
          6BA2C88C8EA191860AB0C822803CBBE22F8A6CA7F0DBEB1A078FA0B292DE0768
          EDAD6589CDD39C15041E41E31D3BD77DE18B99AF7C27A3DD5CC8649E6B286491
          DBAB314049FCEA18FC1BE1686E05C45E1AD1D270770916C620C0FAE76E735B60
          0000030076A00F9DF42F86CDE24F01DEEAF6725C1D521D4A7961B49DCB5B5D04
          7CEC68CF1CE3191DEBD9BC19E24B4F16F856DAFED631036DF267B60306DE45E1
          931DB1DBDB15D0471A431AC71A2A228C2AA8C003E955ED34CB0B09AE26B3B1B6
          B796E5FCC9DE18951A56FEF3103E63CF53401E5DF0EB5FB0F0325E7827C49711
          E9B7769752496D35C9D91DD42ED90CAE78CFF9EC697E247886C3C6B630F827C3
          5711EA77F7F3C66792D8F991DB44AC18BB30E0741FE719F4DD4747D33588962D
          534EB3BE8D4E552EA059403EC181A34DD1F4BD1E268B4BD36CEC6363964B5816
          204FB85028033FC55A6CD7FE07D5F4CB452F3CB612C312F76628401F89AE63E1
          FF008E7C369E01D2E0BBD62CECEE6C2D52DEEA0BA9845244E8369055B07B57A2
          5645EF857C3BA95D1BABFD034BBAB96EB34F671BB9FC48CD0071BF0BDFFB535D
          F18F88EDD5FF00B3752BF41692B295F3563520B0CF6C9ACEF12F86EDBC4FF1C6
          0B4BC7BC8E04D0FCC2F6B3344C0F9A4005876393C57AC471A431AC7122A46A30
          AAA3000F402811A091A408A1D800CC07240E993F89A00C5F0D784745F095B4D0
          E916A6333B6F9A591CC924ADEACCC4935B945140051451401FFFD9}
        Stretch = True
      end
      object QNoPKB: TQRLabel
        Left = 496
        Top = 120
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          317.500000000000000000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoPKB'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 143
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          378.354166666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Polisi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 160
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          423.333333333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Body'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 8
        Top = 176
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          465.666666666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Mesin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 8
        Top = 192
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          508.000000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipe Kendaraan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 112
        Top = 144
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          381.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoPolisi: TQRLabel
        Left = 120
        Top = 144
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          381.000000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoPolisi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoBody: TQRLabel
        Left = 120
        Top = 160
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          423.333333333333300000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoBody'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoMesin: TQRLabel
        Left = 120
        Top = 176
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          465.666666666666800000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoMesin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTipeKendaraan: TQRLabel
        Left = 120
        Top = 192
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          508.000000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTipeKendaraan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 112
        Top = 160
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          423.333333333333300000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 112
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 112
        Top = 192
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          508.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 360
        Top = 144
        Width = 117
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          381.000000000000000000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tanggal/Jam Masuk'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 360
        Top = 159
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          420.687500000000000000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tanggal/Jam Keluar'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 360
        Top = 175
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          463.020833333333400000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Odometer'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 360
        Top = 191
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          505.354166666666700000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Shift'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggalJamMasuk: TQRLabel
        Left = 496
        Top = 144
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          381.000000000000000000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggalJamMasuk'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggalJamKeluar: TQRLabel
        Left = 496
        Top = 160
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          423.333333333333300000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggalJamKeluar'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QOdometer: TQRLabel
        Left = 496
        Top = 176
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          465.666666666666800000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QOdometer'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QShift: TQRLabel
        Left = 496
        Top = 192
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          508.000000000000000000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QShift'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 960
        Top = 160
        Width = 4
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          423.333333333333300000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 960
        Top = 160
        Width = 4
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          423.333333333333300000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 960
        Top = 160
        Width = 4
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          423.333333333333300000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 488
        Top = 144
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          381.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 488
        Top = 160
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          423.333333333333300000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel49: TQRLabel
        Left = 488
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel50: TQRLabel
        Left = 488
        Top = 192
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          508.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRImage4: TQRImage
        Left = 0
        Top = 212
        Width = 161
        Height = 85
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          224.895833333333300000
          0.000000000000000000
          560.916666666666800000
          425.979166666666700000)
        Picture.Data = {
          0A544A504547496D616765600E0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC0001108005300A103012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7EA
          28A2800A28A28039BBAD5EEA1D42E22BA3241187DB6C9129DD2281F3393B587D
          00F4AB3A3EAC97771246669194A828641DF24119DABEDC7B1F4AB1A9E8E2FEE6
          0BA8EE2582E21565568DB1904720D57FB0DD436D1DB7D8A09A28C614A4855BEB
          93D4F7A00DBAC7D56F641756F6D6D77E433BED2C14373F788C11CFCAADF4C8AA
          EF04B1E01D3EF08E9FBB991BAD40351D93C62DF42BFDF6F2177F35515997630C
          A65BE6FBDD07BD005C334CAE54EB473E9F65152EDBBFFA0B9FFC06154B4BF16A
          6AF76D6D6DA6DD2C8AAEC7CD2AB80A403919C8E586320679C74ADB13CDB80367
          280472432E07EB4018B77717704F6D11D6B62CA5817FB32E46067D2919EE891B
          3C4C00EF9B443562E66B94D5ED5E5198A3F318A2A738230BCE7F0AD559A42326
          DA55F6257FC68033B42BF7BA1776F71749713C13101D542EE42015381F88FA83
          5AF5CAF8834C4BA9A4B868CDBC9E5318E58DB6C8580C01953D7240FD2AD916DE
          649144B7F74D110B298B0577775C9C0C8EF8A00B6FA8C4D7B2C5FDA1145B3002
          1C73EA79FCBF03591A8F8B0586B3A7E9B6F2A6A13DC4ABBE18A16DC2266DA5C3
          0257E538241EDE957594B0548AC751800182404EBC7CDF7BAF1EFF004AA163AA
          5B6A9E3402D6367786176964C1CC4A76AAAB761B8A9603B819EF401D6D145140
          051451400514514005159FAADC5D411A2DA98D19831324885F68519E172324E3
          D6B988FC457F36A104116A11BC52244DBBC8556FDE1603AB7FB0DD33DA803B7A
          2B9DF275C4D46696136573E5CB90260D13321418019770C673C11D6B534FD424
          BC32C53D94F693C24074930CA73D0AB0E08FD7D40A00BD4555B8BB3148228E3F
          32438E338E4F41FA13F85245FDA0CC7CDFB346BDB6EE63FD2802DD3258A39936
          48A197AF3DA99B6E377FAD8F1E9E59FF001AA325CEA332BAE9E2D9DD0905A756
          4427DB049FD3F9D0056BFD1271335EE992A457F803CD7E3781D9F1F7C7D79F7A
          912EF5F48D565D2EDE5931CB457185FC88C8AC85B9F13D85E5D5E6A36D0F9054
          006D899950024E769653CE40E01E9EF5A0DAE4848459991FAE1F4E9B8FD45006
          76A577E21FB7453FFC2313CE1571B61BB8B6F041E771079E47E553C5E28D6A5D
          DFF148DFA638F9E55193FE7BD57BCF17258DDF9373ABD9C408E0BC050EEC818C
          3364F073F855A3E2248D813AB238EE12C8FF00F154015354B9D7256495348BA2
          C480446CB98C73C8CF04FA7B9C9E8055FB5D4EFECECA28A1F0D5CC71A8DA8826
          5273D79FAF727BF5AA175E31586531C5751C9BBE55262C7CC471DFA5584F13C2
          A3336B56698EABF67727F3E3F950056D46EBC65AD41F61B5D122D292566496EA
          E2ED64DA9EA157939FAFE55B9E1BF0EDA786B4CFB25BB34B2BB79971712637CD
          21EAC71D3D00E80002B9E4F1CC5708BFD9BA9D8EA2ECC42AC36B29CE3AE5B381
          DBF3E86A45F18EA365AA69D65AA58201A83948A4851D15586320F99827839C81
          ED8A00ED68AA1AAEB5A76890C72EA174902CAE238C375763D80EA4D624FE358C
          5D594305A498BB9D6149240C0720F3C291F866803AAA2B9FBED4B56B4532B430
          AC2854BC863623693CF1BB231F43D6B46C2EEF269A686EED56331818911B2AD9
          F63C8FFEBD005FA28A2802ADF7DD8BFDE6FF00D01AA835A5A35949349043BD08
          0B214195190700F619ABF77CBA03D3639FC718FEA6B9B83C4B6D70BF636B7963
          F336B1776002E5D940F7E633F98A00E9629775F5CC593F22A363EB9FF0AAE808
          D79C8236984E4639C82BDFF1AB312A0BCB890152C428383C8001C67F3AA36775
          15EEB93BDADC453450C7B1CC6DBB0E48E3238CFCB4011E9375F6F984EC007265
          6C29C8187F2C73EB853F9D6D564DA5BDBE97722DE1411C3BDC81927FD61DC4E4
          FF00B7BBFEFA15AD400D918A44EC3A8526AAE98823B4C673F3753EC00FE956D9
          432953D08C1AA3A539F21E273FBC46F987E1CFEB9A005D43E696C22FE192E46E
          FF0080A338FD5455EACBD66EED6CE286E2E2E228CDBCA250ACE0123054E07738
          63C53D75CB0750C8F33A9E8CB6D2107F10B400ED5E289F4DB82F1863B300EC66
          3FF8E7CDF9573C91EF45E1F818E2DEE87F36AB3AC78A2D96DE6B68B4FD4AE5D8
          6311DBBA8C71C93C10391D39E6AB5B5FBAAEDFB05DAA819FF96C7F98A00B51C4
          B247B1E32D8EE62997F99A7FD8A0EA2D946060E124FF001ACCB8F12DBDACC629
          A0BC56040CEC908C9E9CF4A925D56E82868B47D4A40467EE4AB400A20169AF69
          ED0A844F358382B272080382D919CE3A7E3557E24B0824F0E5D1661E56A4BF2A
          9C6EF949FAF6ACE8B5B92E755B1B9BCD2357D3D629C97FB54122AFF0E304920F
          7E98E9D3A537E24EAF6F74FA0436D29F305D994C7244549017FDAC1EF401675F
          8D351F8BBA2DBB85FF00448167049E724C80803D08EB5D078C6448C686598285
          D5A0639F41BB35CDF8B229B4CF8ADE1ED6DE364D3E480DACD73FC28D92C14F1D
          C74AE835FD4B4EBF5D23ECD7904AEBAA5BB0549067EF60F1D7BD005DF18305F0
          7EAADE69880B763E62F55F7A7787659AEAD85EDC4C924B7704339D8BB4282A70
          07F8D43E390CDE06D68260B1B47033D338A3C350BD8C92E9C66F363B3B5B68A2
          62B83B429EBEA6803A0A28A2802B5ED9457D018E46950F6786428CBF422B353C
          316CB72D3B5EDFCAED8CF9B36F5E3A6148C0ADBA2803024F0AD8CF7AD2DD466E
          10C9BCACB2B15FB817EE0F94F4CE715B70C115B42B0C1124512F0A88A140FA01
          525140114D6F15C2ED95030A8A3D3E1841113CC80F6F3988FC89356A8A00816D
          768C79F39FABD53D4343B5D4E344BA92E884390639DA33F4CA9071ED5A751CD3
          C702832363270A3A963E8077A00C1D3FC2565A6EA33CF6E0AC5228C0DEC5C302
          7277139E411F90AD37D2627393737A0FB5D38FEB59D7DADDEC93FD9348B78A6B
          A04798B2124463FDA23853EDC9F6A9BECDE23382752B15E31B56D9B83F52D401
          37F60DB799E61B8BD2F9FBCD70C4E3AE393D33CD4E34D40A57ED37873EB70D9F
          E75CAEA767E246BF4B63E2A96D772EF060B38B1CBAA81F30278C9FD2B5AD342D
          5ED83893C49773EEE479912707F01FA5005B93C3D692962F2DD1661825A62C71
          FF0002CD4B0E8D040088E7BA507276ACC540FA01815857B1EB963FBB8F526795
          B0519D46D3CE31CF4CE40CF6246783C3ADB4AD4F54B513C5E29BD0AC4868CC0A
          8518705481C820F04668036A4D0ECA652B3FDA25523043DCC841FC37532D3C37
          A3D8906DEC225C0006ECB60673819271CF358973A278C6DA0965B0F14C771282
          1920B8B25DAC0755DD9C8C8EF563C2BE2EFEDB966D3B50B7165AC5B8CC906495
          91738DE84F38CF041E41E0D0074D24692A149115D0F5561906B327F0F69F31C8
          8DA3FF0071B8FC8E47E95AB4500605D7852D2EA30AF29CFC996F2A3C9DA7238D
          B8EBD78E6AFE9BA2DA694D23C01CCB2802491DB96C74E0607E42B428A0028A28
          A0028A28A0028A2AA6A4D789A7CCD60AAD7400D8ADD0F233FA668028BF88607B
          A6B5B402594398816CAA97C67009183F9D2CB797D1E44D3D940463E51B9D87D6
          B1859446DB609E7B7124A2E1E3336D659383C8111C6081D3D2B7B4AB18C5A2CB
          3032CB2658B49C9C13F41F9E39A00A8D3DC4831FDB6222C0E36DA7DDFCFBFD6A
          A8D33529656B25D759F745E635D9B75F358163F28652001C1E8076F7AE8CDB40
          C30618CFFC04560C9B74ED6C02F76636465090AB30ECC09E3FDE19F619A00768
          3E1BB9D0619122D42394BAA2B16B72325411B8E1F9639E4F7C0AD8F2EF0AE0DC
          C21B3D4427FF008AACCFB4407FE5A6ABFF007C37F8531AF2050083AC3FFBB1B1
          FE94004F14F71ABDB473AB2EF8E41BF0300AE31C7E39FC2B505BDE6ECFDB78F4
          F285604F76AF7B6B208B5AD91870C7CA6EE062AC7DBE1FEE6B7FF7E9BFC28024
          D66F20B4789351706DD872C4819072AC31D718355AC27B6BAB4B6BEB7D4A4B6B
          9B882369C2A06129DA3E62A41E7DC76C67A0A7E93A7DB5FEA97B7F7104B20464
          8E0FB521C81B412D83DF271ED8F735D17971E31B171D318A00C666B910895759
          765240C0823079F5CE31F8D733ADE96C6F6CB5AB7D408BC46F3D667458CE1595
          1D06073BC1C1078380474CD759776100BE8DCACEB1B2303E4EEC67238217B1F7
          E38AC9F1169DFDA3A7982D9B5812C6C268CC3FC4CBC85CBF039C7E5401D5D154
          3458B508744B28F559966D41615171220C067C738C7BD5FA0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A00FFD9}
      end
      object QRLabel25: TQRLabel
        Left = 216
        Top = 216
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          571.500000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FUEL'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 232
        Top = 240
        Width = 4
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          635.000000000000000000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'I'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 176
        Top = 272
        Width = 10
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          719.666666666666800000
          26.458333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 280
        Top = 272
        Width = 9
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          719.666666666666800000
          23.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'F'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel26: TQRLabel
        Left = 304
        Top = 212
        Width = 70
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          560.916666666666700000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Radio/Tape'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 424
        Top = 212
        Width = 49
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          560.916666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Tool Kit'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 304
        Top = 228
        Width = 68
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          603.250000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Monitor TV'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel32: TQRLabel
        Left = 424
        Top = 228
        Width = 118
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          603.250000000000000000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Segitiga Pengaman'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 304
        Top = 244
        Width = 36
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          645.583333333333400000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Argo '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 424
        Top = 244
        Width = 66
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          645.583333333333400000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Ban Serep'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 304
        Top = 260
        Width = 58
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          687.916666666666800000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Navigator'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel34: TQRLabel
        Left = 424
        Top = 260
        Width = 68
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          687.916666666666800000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Kotak P3K'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 304
        Top = 276
        Width = 32
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          730.250000000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' EDC'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel35: TQRLabel
        Left = 424
        Top = 276
        Width = 66
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          730.250000000000000000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Ban Serep'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape9: TQRShape
        Left = 304
        Top = 220
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          582.083333333333400000
          1039.812500000000000000)
        Shape = qrsHorLine
      end
      object QRShape6: TQRShape
        Left = 304
        Top = 236
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          624.416666666666800000
          1039.812500000000000000)
        Shape = qrsHorLine
      end
      object QRShape10: TQRShape
        Left = 304
        Top = 268
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          709.083333333333400000
          1039.812500000000000000)
        Shape = qrsHorLine
      end
      object QRShape8: TQRShape
        Left = 304
        Top = 252
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          666.750000000000000000
          1039.812500000000000000)
        Shape = qrsHorLine
      end
      object QRShape4: TQRShape
        Left = 392
        Top = 212
        Width = 33
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1037.166666666667000000
          560.916666666666800000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRShape11: TQRShape
        Left = 544
        Top = 212
        Width = 33
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1439.333333333333000000
          560.916666666666800000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRShape5: TQRShape
        Left = 664
        Top = 212
        Width = 33
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1756.833333333333000000
          560.916666666666800000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 208
        Width = 697
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          550.333333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape3: TQRShape
        Left = 168
        Top = 212
        Width = 137
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          444.500000000000000000
          560.916666666666800000
          362.479166666666700000)
        Shape = qrsRightAndLeft
      end
      object QRShape31: TQRShape
        Left = -8
        Top = 212
        Width = 17
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          -21.166666666666670000
          560.916666666666800000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRLabel91: TQRLabel
        Left = 104
        Top = 292
        Width = 81
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          772.583333333333400000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Oli Transmisi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape15: TQRShape
        Left = 72
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRLabel92: TQRLabel
        Left = 216
        Top = 292
        Width = 88
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          772.583333333333400000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Oli Differensial'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape20: TQRShape
        Left = 184
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRLabel93: TQRLabel
        Left = 344
        Top = 292
        Width = 54
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          772.583333333333400000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Filter Oli'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape16: TQRShape
        Left = 312
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRLabel94: TQRLabel
        Left = 464
        Top = 292
        Width = 78
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          772.583333333333400000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Filter Bensin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel95: TQRLabel
        Left = 584
        Top = 292
        Width = 72
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          772.583333333333400000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Filter Udara'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape17: TQRShape
        Left = 432
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRShape18: TQRShape
        Left = 552
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRShape19: TQRShape
        Left = 664
        Top = 292
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1756.833333333333000000
          772.583333333333400000
          87.312500000000000000)
        Shape = qrsRightAndLeft
      end
      object QRLabel89: TQRLabel
        Left = 0
        Top = 312
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          825.500000000000100000
          1844.145833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SERVIS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 332
        Width = 353
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          878.416666666666800000
          933.979166666666600000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PERINTAH KERJA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 352
        Top = 332
        Width = 345
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          931.333333333333500000
          878.416666666666800000
          912.812500000000100000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'KEBUTUHAN PARTS/BAHAN'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 328
        Width = 697
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          867.833333333333500000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRLabel37: TQRLabel
        Left = 40
        Top = 348
        Width = 297
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          920.750000000000000000
          785.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DESKRIPSI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 8
        Top = 348
        Width = 18
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          920.750000000000000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel38: TQRLabel
        Left = 352
        Top = 348
        Width = 18
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          931.333333333333500000
          920.750000000000000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel40: TQRLabel
        Left = 560
        Top = 348
        Width = 137
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          920.750000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DISETUJUI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel39: TQRLabel
        Left = 384
        Top = 348
        Width = 177
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          920.750000000000000000
          468.312500000000100000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DESKRIPSI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 358
        Width = 697
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          947.208333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape24: TQRShape
        Left = 0
        Top = 340
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          899.583333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape23: TQRShape
        Left = 688
        Top = 291
        Width = 17
        Height = 75
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          198.437500000000000000
          1820.333333333333000000
          769.937500000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape22: TQRShape
        Left = -8
        Top = 291
        Width = 17
        Height = 75
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          198.437500000000000000
          -21.166666666666670000
          769.937500000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape28: TQRShape
        Left = 328
        Top = 332
        Width = 17
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333340000
          867.833333333333500000
          878.416666666666800000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape32: TQRShape
        Left = 24
        Top = 348
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          63.500000000000000000
          920.750000000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape33: TQRShape
        Left = 376
        Top = 348
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          994.833333333333400000
          920.750000000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape34: TQRShape
        Left = 552
        Top = 348
        Width = 17
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1460.500000000000000000
          920.750000000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRLabel41: TQRLabel
        Left = 8
        Top = 292
        Width = 60
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          772.583333333333400000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Oli Mesin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape13: TQRShape
        Left = 0
        Top = 284
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          751.416666666666800000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 304
        Width = 697
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          804.333333333333200000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
    end
    object QRBand4: TQRBand
      Left = 48
      Top = 385
      Width = 698
      Height = 528
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1397.000000000000000000
        1846.791666666667000000)
      BandType = rbPageFooter
      object QRLabel51: TQRLabel
        Left = 0
        Top = 240
        Width = 196
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          635.000000000000000000
          518.583333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Catatan \ Rekomendasi Bengkel :'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel52: TQRLabel
        Left = 120
        Top = 328
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          867.833333333333500000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Admin Bengkel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel53: TQRLabel
        Left = 472
        Top = 328
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          867.833333333333500000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kepala Bengkel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape44: TQRShape
        Left = 0
        Top = 320
        Width = 353
        Height = 97
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          256.645833333333400000
          0.000000000000000000
          846.666666666666600000
          933.979166666666600000)
        Brush.Style = bsClear
        Shape = qrsRectangle
      end
      object QRShape45: TQRShape
        Left = 352
        Top = 320
        Width = 345
        Height = 97
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          256.645833333333400000
          931.333333333333500000
          846.666666666666600000
          912.812500000000100000)
        Brush.Style = bsClear
        Shape = qrsRectangle
      end
      object QRShape46: TQRShape
        Left = 0
        Top = 16
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          42.333333333333340000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape47: TQRShape
        Left = 0
        Top = -8
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          -21.166666666666670000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRLabel54: TQRLabel
        Left = 32
        Top = 4
        Width = 297
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          10.583333333333330000
          785.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PEKERJAAN/PERBAIKAN'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel55: TQRLabel
        Left = 8
        Top = 4
        Width = 18
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel56: TQRLabel
        Left = 336
        Top = 4
        Width = 113
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          10.583333333333330000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'WAKTU'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel57: TQRLabel
        Left = 440
        Top = 4
        Width = 121
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          10.583333333333330000
          320.145833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TEKNISI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel58: TQRLabel
        Left = 560
        Top = 4
        Width = 137
        Height = 17
        Frame.Color = clNone
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          10.583333333333330000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'KETERANGAN'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape48: TQRShape
        Left = 0
        Top = 232
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          613.833333333333400000
          1844.145833333333000000)
        Shape = qrsHorLine
      end
      object QRShape49: TQRShape
        Left = 440
        Top = 0
        Width = 121
        Height = 241
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          637.645833333333400000
          1164.166666666667000000
          0.000000000000000000
          320.145833333333400000)
        Shape = qrsRightAndLeft
      end
      object QRShape50: TQRShape
        Left = 32
        Top = 0
        Width = 305
        Height = 241
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          637.645833333333400000
          84.666666666666680000
          0.000000000000000000
          806.979166666666800000)
        Shape = qrsRightAndLeft
      end
      object QRShape51: TQRShape
        Left = 688
        Top = -8
        Width = 17
        Height = 241
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          637.645833333333400000
          1820.333333333333000000
          -21.166666666666670000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRShape52: TQRShape
        Left = -8
        Top = 0
        Width = 17
        Height = 241
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          637.645833333333400000
          -21.166666666666670000
          0.000000000000000000
          44.979166666666670000)
        Shape = qrsVertLine
      end
      object QRLabel47: TQRLabel
        Left = 0
        Top = 424
        Width = 87
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          0.000000000000000000
          1121.833333333333000000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Form : FR/WHET/004'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Left = 344
        Top = 424
        Width = 20
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          910.166666666666600000
          1121.833333333333000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rev.0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel43: TQRLabel
        Left = 632
        Top = 424
        Width = 67
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1672.166666666667000000
          1121.833333333333000000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tgl Terbit: 02/01/13'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
  end
  object Alasan: TMemo
    Left = 96
    Top = 189
    Width = 281
    Height = 33
    TabOrder = 6
  end
  object BlokUnit: TRadioButton
    Left = 96
    Top = 161
    Width = 113
    Height = 17
    Caption = 'Blok Unit'
    TabOrder = 4
  end
  object BlokMudik: TRadioButton
    Left = 168
    Top = 161
    Width = 113
    Height = 17
    Caption = 'Blok Mudik'
    TabOrder = 5
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\WH App\OffLtr.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 296
    Top = 237
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 257705
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 95515
        mmLeft = 8467
        mmTop = 52917
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel387: TppLabel
        UserName = 'LabelTo'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Polisi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 33867
        mmWidth = 17198
        BandType = 0
      end
      object ppNoPolisi: TppLabel
        UserName = 'Label21'
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
        mmLeft = 35983
        mmTop = 33867
        mmWidth = 51065
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PERINTAH KERJA BENGKEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 8467
        mmTop = 16933
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'LabelTo5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Bodi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 38100
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Mesin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 42333
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label10'
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
        mmLeft = 33867
        mmTop = 33867
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label1010'
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
        mmLeft = 33867
        mmTop = 38100
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label1011'
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
        mmLeft = 33867
        mmTop = 42333
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'LabelTo6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tanggal / Jam Masuk '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 33867
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tanggal / Jam Keluar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 38100
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Odometer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 42333
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label1012'
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
        mmLeft = 135467
        mmTop = 33867
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label10101'
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
        mmLeft = 135467
        mmTop = 38100
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label23'
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
        mmLeft = 135467
        mmTop = 42333
        mmWidth = 1058
        BandType = 0
      end
      object ppNoBody: TppLabel
        UserName = 'Label24'
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
        mmLeft = 35983
        mmTop = 38100
        mmWidth = 51065
        BandType = 0
      end
      object ppNoMesin: TppLabel
        UserName = 'Label2'
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
        mmLeft = 35983
        mmTop = 42333
        mmWidth = 51065
        BandType = 0
      end
      object ppOdometer: TppLabel
        UserName = 'Label9'
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
        mmLeft = 137584
        mmTop = 42333
        mmWidth = 51065
        BandType = 0
      end
      object ppTglKeluar: TppLabel
        UserName = 'Label25'
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
        mmLeft = 137584
        mmTop = 38100
        mmWidth = 51065
        BandType = 0
      end
      object ppTglMasuk: TppLabel
        UserName = 'Label26'
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
        mmLeft = 137584
        mmTop = 33867
        mmWidth = 51065
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No PKB :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 27517
        mmWidth = 15081
        BandType = 0
      end
      object ppLabelDate: TppLabel
        UserName = 'LabelDate'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PERINTAH KERJA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 59267
        mmWidth = 91281
        BandType = 0
      end
      object ppLabelUnit: TppLabel
        UserName = 'LabelUnit'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KEBUTUHAN PARTS / BAHAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 59267
        mmWidth = 89165
        BandType = 0
      end
      object ppLabelDestination: TppLabel
        UserName = 'LabelDestination'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'DESKRIPSI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 63500
        mmWidth = 82815
        BandType = 0
      end
      object ppLabelPrice: TppLabel
        UserName = 'LabelPrice'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'DISETUJUI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 63500
        mmWidth = 27781
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 89959
        mmLeft = 99484
        mmTop = 58473
        mmWidth = 265
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'LabelDestination1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 63500
        mmWidth = 8731
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 84931
        mmLeft = 160867
        mmTop = 63500
        mmWidth = 265
        BandType = 0
      end
      object ppReprinted: TppLabel
        UserName = 'Reprinted'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 76200
        mmTop = 23283
        mmWidth = 46831
        BandType = 0
      end
      object ppNoPKB: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 27517
        mmWidth = 51065
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
        mmHeight = 15081
        mmLeft = 139700
        mmTop = 2117
        mmWidth = 48948
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 31750
        mmWidth = 178330
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tipe Kendaraan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 46567
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label31'
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
        mmLeft = 33867
        mmTop = 46567
        mmWidth = 1058
        BandType = 0
      end
      object ppTipeKendaraan: TppLabel
        UserName = 'Label32'
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
        mmLeft = 35983
        mmTop = 46567
        mmWidth = 51065
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Jenis Pekerjaan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 46567
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label34'
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
        mmLeft = 135467
        mmTop = 46567
        mmWidth = 1058
        BandType = 0
      end
      object ppJenisPekerjaan: TppLabel
        UserName = 'Label35'
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
        mmLeft = 137584
        mmTop = 46567
        mmWidth = 51065
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SERVIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 8467
        mmTop = 53446
        mmWidth = 180182
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 58473
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'LabelPrice2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'DESKRIPSI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 63500
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 63500
        mmWidth = 8731
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 63500
        mmWidth = 180182
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 67733
        mmWidth = 180182
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 81492
        mmLeft = 8467
        mmTop = 149490
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'LabelDestination2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PEKERJAAN/PERBAIKAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 150284
        mmWidth = 74348
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 150284
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'WAKTU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 91017
        mmTop = 150284
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TEKNISI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 150284
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KETERANGAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 150284
        mmWidth = 38365
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8202
        mmTop = 154517
        mmWidth = 180182
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 81756
        mmLeft = 91017
        mmTop = 149225
        mmWidth = 265
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Catatan / Rekomendasi Bengkel :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 230717
        mmWidth = 53181
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 81756
        mmLeft = 116417
        mmTop = 149225
        mmWidth = 265
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 81756
        mmLeft = 150284
        mmTop = 149225
        mmWidth = 265
        BandType = 0
      end
      object ppKeluhan: TppMemo
        UserName = 'Keluhan'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 80698
        mmLeft = 9525
        mmTop = 67733
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppParts: TppMemo
        UserName = 'Keluhan1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 80698
        mmLeft = 100542
        mmTop = 67733
        mmWidth = 59531
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppPekerjaan: TppMemo
        UserName = 'Keluhan2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 76465
        mmLeft = 9525
        mmTop = 154517
        mmWidth = 80433
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppRekomendasi: TppMemo
        UserName = 'Rekomendasi'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 21431
        mmLeft = 8467
        mmTop = 234950
        mmWidth = 180182
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppWaktu: TppMemo
        UserName = 'Waktu'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 76465
        mmLeft = 92075
        mmTop = 154517
        mmWidth = 24606
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppTeknisi: TppMemo
        UserName = 'Waktu1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 76465
        mmLeft = 117475
        mmTop = 154517
        mmWidth = 33073
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppKeterangan: TppMemo
        UserName = 'Keterangan'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 76465
        mmLeft = 151607
        mmTop = 154517
        mmWidth = 37042
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine7: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 16933
        mmTop = 63500
        mmWidth = 265
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
        mmHeight = 4498
        mmLeft = 107950
        mmTop = 63500
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 16933
        mmTop = 149490
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label29'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Form : FR/WHET/004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 10583
        mmTop = 23283
        mmWidth = 27517
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label30'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rev : 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 95250
        mmTop = 23283
        mmWidth = 7673
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label301'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tgl Terbit: 02/01/2013'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 167217
        mmTop = 23283
        mmWidth = 23813
        BandType = 8
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 20373
        mmLeft = 8467
        mmTop = 0
        mmWidth = 180182
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 99484
        mmTop = 0
        mmWidth = 265
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Admin Bengkel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 0
        mmWidth = 91281
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Kepala Bengkel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 0
        mmWidth = 89165
        BandType = 8
      end
      object ppAdminBengkel: TppLabel
        UserName = 'AdminBengkel'
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
        mmLeft = 8467
        mmTop = 16140
        mmWidth = 91281
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList4: TppParameterList
    end
  end
end
