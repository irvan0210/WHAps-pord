object WorkOrderFormIn: TWorkOrderFormIn
  Left = 265
  Top = 193
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Tutup Perintah Kerja Bengkel'
  ClientHeight = 554
  ClientWidth = 1193
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
  object Label10: TLabel
    Left = 560
    Top = 497
    Width = 337
    Height = 16
    Caption = 'Note: 1. Keluhan yang sudah dikerjakan silahkan diceklis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 595
    Top = 513
    Width = 220
    Height = 16
    Caption = '2. Part yang dipakai silahkan diceklis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 595
    Top = 529
    Width = 243
    Height = 16
    Caption = '3. Untuk Tutup PKB silahkan ceklis close '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 433
    Height = 249
    Caption = 'PKB '
    TabOrder = 0
    object Label2: TLabel
      Left = 15
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label4: TLabel
      Left = 13
      Top = 72
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Body'
    end
    object Label8: TLabel
      Left = 15
      Top = 96
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keluhan'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No PKB'
    end
    object Panel1: TPanel
      Left = 61
      Top = 44
      Width = 316
      Height = 49
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object Label3: TLabel
        Left = 171
        Top = 4
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jam'
      end
      object Label5: TLabel
        Left = 149
        Top = 28
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'No Polisi'
      end
      object Tanggal: TEdit
        Left = 0
        Top = 4
        Width = 97
        Height = 21
        TabOrder = 0
      end
      object Jam: TEdit
        Left = 200
        Top = 4
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object NoBody: TEdit
        Left = 0
        Top = 28
        Width = 73
        Height = 21
        TabOrder = 2
      end
      object NoPolisi: TEdit
        Left = 200
        Top = 28
        Width = 97
        Height = 21
        TabOrder = 3
      end
    end
    object KeluhanGrid: TZColorStringGrid
      Left = 61
      Top = 96
      Width = 369
      Height = 145
      ColCount = 3
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 1
      OnSelectCell = KeluhanGridSelectCell
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
    object chkkeluhan: TCheckBox
      Left = 87
      Top = 122
      Width = 14
      Height = 15
      TabOrder = 2
      Visible = False
      OnExit = chkkeluhanExit
    end
  end
  object Simpan: TButton
    Left = 632
    Top = 466
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 712
    Top = 465
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 2
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 872
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 256
    Width = 433
    Height = 281
    Caption = 'Data PKB'
    TabOrder = 4
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object TombolCari: TSpeedButton
      Left = 186
      Top = 16
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
    object StrGrid: TStringGrid
      Left = 8
      Top = 40
      Width = 417
      Height = 233
      ColCount = 7
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnClick = StrGridClick
      OnSelectCell = StrGridSelectCell
      ColWidths = (
        110
        64
        80
        54
        79
        86
        64)
    end
    object Cari: TEdit
      Left = 32
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = CariChange
      OnKeyPress = CariKeyPress
    end
  end
  object NoPKB: TComboBox
    Left = 70
    Top = 24
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = NoPKBChange
  end
  object GroupParts: TGroupBox
    Left = 441
    Top = 224
    Width = 393
    Height = 233
    Caption = 'Pemakaian Parts'
    TabOrder = 6
    object PartsGrid: TZColorStringGrid
      Left = 8
      Top = 17
      Width = 377
      Height = 208
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 0
      OnSelectCell = PartsGridSelectCell
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
    object CheckSelect: TCheckBox
      Left = 39
      Top = 50
      Width = 14
      Height = 15
      TabOrder = 1
      Visible = False
      OnExit = CheckSelectExit
    end
    object Keterangan: TEdit
      Left = 56
      Top = 56
      Width = 217
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = KeteranganExit
    end
  end
  object GroupPekerjaan: TGroupBox
    Left = 442
    Top = -1
    Width = 399
    Height = 225
    Caption = 'Pekerjaan'
    TabOrder = 7
    object Label6: TLabel
      Left = 10
      Top = 27
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Selesai'
    end
    object Label9: TLabel
      Left = 219
      Top = 28
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object PekerjaanGrid: TStringGrid
      Left = 8
      Top = 48
      Width = 385
      Height = 169
      ColCount = 1
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = PekerjaanGridSelectCell
      ColWidths = (
        376)
    end
    object PekerjaanDetail: TEdit
      Left = 8
      Top = 72
      Width = 377
      Height = 21
      TabOrder = 1
      Visible = False
      OnExit = PekerjaanDetailExit
      OnKeyDown = PekerjaanDetailKeyDown
      OnKeyPress = PekerjaanDetailKeyPress
    end
    object Teknisi: TEdit
      Left = 72
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = TeknisiExit
      OnKeyDown = TeknisiKeyDown
    end
    object TanggalSelesai: TDateTimePicker
      Left = 96
      Top = 24
      Width = 89
      Height = 21
      Date = 42222.565481944450000000
      Time = 42222.565481944450000000
      TabOrder = 3
    end
    object JamSelesai: TMaskEdit
      Left = 248
      Top = 25
      Width = 41
      Height = 21
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 4
      Text = '  :  '
    end
    object chkClose: TCheckBox
      Left = 294
      Top = 25
      Width = 67
      Height = 17
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = chkCloseClick
    end
  end
  object CetakUlang: TButton
    Left = 793
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 8
    OnClick = CetakUlangClick
  end
  object GroupBox2: TGroupBox
    Left = 836
    Top = 224
    Width = 353
    Height = 233
    Caption = 'Analisa'
    TabOrder = 9
    object StrGrid3: TZColorStringGrid
      Left = 4
      Top = 18
      Width = 337
      Height = 209
      ColCount = 2
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 0
      OnSelectCell = StrGrid3SelectCell
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
    object Analisa: TEdit
      Left = 8
      Top = 61
      Width = 329
      Height = 21
      TabOrder = 1
      Visible = False
      OnExit = AnalisaExit
      OnKeyPress = AnalisaKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 842
    Top = 2
    Width = 345
    Height = 223
    Caption = 'Mekanik'
    TabOrder = 10
    object StrGridMekanik: TZColorStringGrid
      Left = 3
      Top = 17
      Width = 334
      Height = 200
      ColCount = 3
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 0
      OnSelectCell = StrGridMekanikSelectCell
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
      ColWidths = (
        64
        64
        71)
    end
    object Mekanik: TEdit
      Left = 67
      Top = 35
      Width = 222
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Visible = False
      OnExit = MekanikExit
      OnKeyPress = MekanikKeyPress
    end
    object ListMekanik: TListBox
      Left = 26
      Top = 77
      Width = 252
      Height = 84
      ItemHeight = 13
      TabOrder = 2
      Visible = False
    end
    object StatusMekanik: TComboBox
      Left = 8
      Top = 32
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'INTERNAL'
      Visible = False
      OnExit = StatusMekanikExit
      Items.Strings = (
        'INTERNAL'
        'EXTERNAL')
    end
  end
  object PanelMemoKhusus: TPanel
    Left = 504
    Top = 469
    Width = 105
    Height = 19
    Enabled = False
    TabOrder = 11
    object MemoKhusus: TCheckBox
      Left = 5
      Top = 3
      Width = 105
      Height = 17
      Caption = 'Memo Khusus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
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
    Left = 80
    Top = 168
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
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
      object ppLabel18: TppLabel
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
      object ppLabel19: TppLabel
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
      object ppLabel20: TppLabel
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
      object ppLabel21: TppLabel
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
      object ppLabel22: TppLabel
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
      object ppLabel23: TppLabel
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
      object ppLabel24: TppLabel
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
      object ppLabel25: TppLabel
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
      object ppLabel26: TppLabel
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
      object ppLabel27: TppLabel
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
      object ppLabel28: TppLabel
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
      object ppLabel29: TppLabel
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
      object ppLabel30: TppLabel
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
      object ppLabel31: TppLabel
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
      object ppLine12: TppLine
        UserName = 'Line12'
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
      object ppLabel32: TppLabel
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
      object ppLine13: TppLine
        UserName = 'Line13'
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
      object ppLabel33: TppLabel
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
      object ppLine14: TppLine
        UserName = 'Line14'
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
      object ppShape3: TppShape
        UserName = 'Shape3'
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
        UserName = 'teknisi'
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
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
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
      object ppKepalaBengkel: TppLabel
        UserName = 'AdminBengkel1'
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
        mmLeft = 100013
        mmTop = 16404
        mmWidth = 88900
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
end
