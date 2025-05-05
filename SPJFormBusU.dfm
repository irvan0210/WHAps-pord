object SPJFormBus: TSPJFormBus
  Left = 233
  Top = 195
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Surat Jalan'
  ClientHeight = 559
  ClientWidth = 919
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
  object Label2: TLabel
    Left = 344
    Top = 443
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label10: TLabel
    Left = 343
    Top = 468
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Catatan'
  end
  object Label12: TLabel
    Left = 656
    Top = 607
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari Driver'
    Visible = False
  end
  object Label23: TLabel
    Left = 13
    Top = 567
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan'
    Visible = False
  end
  object Label29: TLabel
    Left = 100
    Top = 20
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
  object Label32: TLabel
    Left = 437
    Top = 583
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Pengemudi'
    Visible = False
  end
  object Label33: TLabel
    Left = 558
    Top = 196
    Width = 146
    Height = 13
    Caption = 'F5 = Tampilkan semua Armada'
    Visible = False
  end
  object lbl1: TLabel
    Left = 646
    Top = 445
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'Seat'
  end
  object Catatan: TMemo
    Left = 396
    Top = 465
    Width = 275
    Height = 89
    TabOrder = 6
  end
  object Driver: TComboBox
    Left = 792
    Top = 307
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Visible = False
    OnChange = DriverChange
    OnKeyPress = DriverKeyPress
  end
  object Simpan: TButton
    Left = 823
    Top = 345
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 9
    OnClick = SimpanClick
  end
  object Keluar: TButton
    Left = 823
    Top = 505
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 12
    OnClick = KeluarClick
  end
  object Bersihkan: TButton
    Left = 823
    Top = 377
    Width = 75
    Height = 25
    Caption = '&Bersihkan'
    TabOrder = 10
    OnClick = BersihkanClick
  end
  object GroupMitra: TGroupBox
    Left = 436
    Top = 625
    Width = 397
    Height = 217
    Caption = 'Data Driver'
    TabOrder = 8
    Visible = False
    object Label16: TLabel
      Left = 240
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Armada Sisa'
    end
    object GridMitra: TStringGrid
      Left = 8
      Top = 32
      Width = 377
      Height = 177
      ColCount = 4
      DefaultRowHeight = 19
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnDblClick = GridMitraDblClick
      OnKeyPress = GridMitraKeyPress
      OnSelectCell = GridMitraSelectCell
      ColWidths = (
        74
        110
        86
        80)
    end
    object Panel1: TPanel
      Left = 304
      Top = 6
      Width = 65
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Sisa: TEdit
        Left = 0
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 0
      end
    end
  end
  object CetakUlang: TButton
    Left = 823
    Top = 437
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 11
    OnClick = ReprintClick
  end
  object Cari: TEdit
    Left = 720
    Top = 603
    Width = 97
    Height = 21
    TabOrder = 3
    Visible = False
    OnChange = CariChange
    OnKeyPress = CariKeyPress
  end
  object GroupPemakaian: TGroupBox
    Left = 12
    Top = 32
    Width = 541
    Height = 321
    Caption = 'Data Pemakaian'
    TabOrder = 2
    object Label6: TLabel
      Left = 58
      Top = 44
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label4: TLabel
      Left = 53
      Top = 68
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Customer'
    end
    object Label8: TLabel
      Left = 24
      Top = 188
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi Standby'
    end
    object Label11: TLabel
      Left = 69
      Top = 116
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Guide'
    end
    object Label17: TLabel
      Left = 360
      Top = 115
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telp/HP'
    end
    object Label18: TLabel
      Left = 38
      Top = 20
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Pesanan'
    end
    object Label19: TLabel
      Left = 74
      Top = 137
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rute'
    end
    object Label9: TLabel
      Left = 41
      Top = 243
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object Label22: TLabel
      Left = 68
      Top = 92
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Group'
    end
    object Label24: TLabel
      Left = 100
      Top = 20
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
    object Label25: TLabel
      Left = 100
      Top = 68
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
    object Label26: TLabel
      Left = 100
      Top = 44
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
    object Label27: TLabel
      Left = 100
      Top = 132
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
    object Label28: TLabel
      Left = 100
      Top = 188
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
    object Label34: TLabel
      Left = 37
      Top = 295
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'KM Estimasi'
    end
    object GroupOrder: TPanel
      Left = 104
      Top = 8
      Width = 433
      Height = 105
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object Label14: TLabel
        Left = 74
        Top = 36
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 's/d'
      end
      object Label7: TLabel
        Left = 238
        Top = 36
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jam'
      end
      object OrderId: TEdit
        Left = 5
        Top = 8
        Width = 156
        Height = 21
        TabOrder = 0
      end
      object FromDate: TEdit
        Left = 5
        Top = 32
        Width = 68
        Height = 21
        TabOrder = 1
      end
      object ToDate: TEdit
        Left = 93
        Top = 32
        Width = 68
        Height = 21
        TabOrder = 2
      end
      object CustomerId: TEdit
        Left = 181
        Top = 16
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 3
        Visible = False
      end
      object CustomerDisp: TEdit
        Left = 7
        Top = 56
        Width = 348
        Height = 21
        TabOrder = 4
      end
      object Group: TEdit
        Left = 5
        Top = 80
        Width = 428
        Height = 21
        TabOrder = 5
        OnKeyPress = GuideKeyPress
      end
    end
    object Route: TMemo
      Left = 109
      Top = 135
      Width = 428
      Height = 50
      TabOrder = 3
    end
    object Remark: TMemo
      Left = 109
      Top = 243
      Width = 428
      Height = 41
      TabOrder = 4
    end
    object GuideCellular: TEdit
      Left = 405
      Top = 112
      Width = 132
      Height = 21
      TabOrder = 2
      OnKeyPress = GuideCellularKeyPress
    end
    object Guide: TEdit
      Left = 109
      Top = 112
      Width = 244
      Height = 21
      TabOrder = 1
      OnKeyPress = GuideKeyPress
    end
    object ReservedOrderDetaiId: TEdit
      Left = 368
      Top = 8
      Width = 97
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object PickupPoint: TMemo
      Left = 109
      Top = 187
      Width = 428
      Height = 54
      TabOrder = 6
      OnKeyPress = PickupPointKeyPress
    end
    object PanelJam: TPanel
      Left = 368
      Top = 40
      Width = 169
      Height = 24
      BevelOuter = bvNone
      TabOrder = 7
      object Label20: TLabel
        Left = 82
        Top = 3
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Standby'
      end
      object FromTime: TMaskEdit
        Left = 0
        Top = 2
        Width = 41
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object StandbyTime: TMaskEdit
        Left = 128
        Top = 2
        Width = 41
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
    end
    object FromDateApi: TEdit
      Left = 37
      Top = 264
      Width = 68
      Height = 21
      TabOrder = 8
      Visible = False
    end
    object CellularWA: TEdit
      Left = 137
      Top = 268
      Width = 368
      Height = 21
      TabOrder = 9
      Visible = False
    end
    object Kmestimasi: TEdit
      Left = 109
      Top = 291
      Width = 217
      Height = 21
      MaxLength = 30
      TabOrder = 10
      OnEnter = KmestimasiEnter
      OnExit = KmestimasiExit
    end
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 0
    Width = 542
    Height = 33
    Enabled = False
    TabOrder = 0
    object Label13: TLabel
      Left = 58
      Top = 8
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label1: TLabel
      Left = 332
      Top = 8
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'No SJ'
    end
    object SJDate: TEdit
      Left = 112
      Top = 8
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object NoSPJ: TEdit
      Left = 368
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      TabOrder = 1
    end
  end
  object PanelCariOrder: TPanel
    Left = 277
    Top = 46
    Width = 49
    Height = 25
    BevelOuter = bvNone
    TabOrder = 1
    TabStop = True
    object CariOrder: TSpeedButton
      Left = 2
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
      OnClick = CariOrderClick
    end
  end
  object GroupService: TGroupBox
    Left = 560
    Top = 0
    Width = 321
    Height = 193
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 13
    TabStop = True
    object GridService: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 305
      Height = 169
      ColCount = 9
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
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
  object GroupBatal: TPanel
    Left = 560
    Top = 239
    Width = 73
    Height = 25
    BevelOuter = bvNone
    TabOrder = 14
    object Status: TCheckBox
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Batal'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 560
    Top = 216
    Width = 89
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 15
    object Package: TCheckBox
      Left = 0
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Paket'
      TabOrder = 0
    end
  end
  object Destination: TComboBox
    Left = 87
    Top = 567
    Width = 297
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
    Visible = False
    OnKeyPress = DriverKeyPress
  end
  object GroupDisabled: TPanel
    Left = 232
    Top = 619
    Width = 177
    Height = 30
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 7
    Visible = False
  end
  object GroupPengemudi: TPanel
    Left = 528
    Top = 583
    Width = 233
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 18
    object DriverExternal: TEdit
      Left = 1
      Top = 1
      Width = 217
      Height = 21
      TabStop = False
      TabOrder = 0
      Visible = False
    end
  end
  object Report: TQuickRep
    Left = 1200
    Top = -17
    Width = 794
    Height = 650
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
    Page.PaperSize = Custom
    Page.Values = (
      50.000000000000000000
      1719.790000000000000000
      100.000000000000000000
      2100.790000000000000000
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
    object QRBand1: TQRBand
      Left = 48
      Top = 38
      Width = 698
      Height = 155
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
        410.104166666666700000
        1846.791666666667000000)
      BandType = rbTitle
      object QNoOrder: TQRLabel
        Left = 40
        Top = 112
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          296.333333333333400000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoOrder'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QCopy: TQRLabel
        Left = 600
        Top = 120
        Width = 89
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1587.500000000000000000
          317.500000000000000000
          235.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QCopy'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRBand3: TQRBand
      Left = 48
      Top = 481
      Width = 698
      Height = 128
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
        338.666666666666700000
        1846.791666666667000000)
      BandType = rbPageFooter
      object QTandaPetugas: TQRLabel
        Left = 56
        Top = 56
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          148.166666666666700000
          256.645833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTandaPetugas'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QMessage: TQRLabel
        Left = 48
        Top = 104
        Width = 633
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          275.166666666666700000
          1674.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QMessage'
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
      object QCatatan: TQRLabel
        Left = 48
        Top = 88
        Width = 585
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          232.833333333333400000
          1547.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QCatatan'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggal: TQRLabel
        Left = 72
        Top = 8
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          21.166666666666670000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggal'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 193
      Width = 698
      Height = 288
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
        762.000000000000000000
        1846.791666666667000000)
      BandType = rbDetail
      object QJamReservasi: TQRLabel
        Left = 608
        Top = 72
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          190.500000000000000000
          150.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QJamReservasi'
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
      object QNama: TQRLabel
        Left = 144
        Top = 248
        Width = 249
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          656.166666666666800000
          658.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNama'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoPolisi: TQRLabel
        Left = 464
        Top = 264
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          698.500000000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoPolisi'
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
      object QNoBody: TQRLabel
        Left = 464
        Top = 248
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          656.166666666666800000
          214.312500000000000000)
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
      object QTelpHP: TQRLabel
        Left = 144
        Top = 264
        Width = 249
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          698.500000000000000000
          658.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTelpHP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QAcara: TQRMemo
        Left = 192
        Top = 152
        Width = 385
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          508.000000000000000000
          402.166666666666600000
          1018.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Lines.Strings = (
          'QAcara.....')
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QAlamat: TQRMemo
        Left = 96
        Top = 98
        Width = 481
        Height = 55
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          145.520833333333300000
          254.000000000000000000
          259.291666666666700000
          1272.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Lines.Strings = (
          'QAlamat....')
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggalReservasi: TQRLabel
        Left = 96
        Top = 80
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          211.666666666666700000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggalReservasi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QSeat: TQRLabel
        Left = 464
        Top = 43
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          113.770833333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QSeat'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QGuide: TQRLabel
        Left = 464
        Top = 61
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          161.395833333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QGuide'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QGuidePhone: TQRLabel
        Left = 464
        Top = 79
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          209.020833333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QGuidePhone'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QCustomer: TQRLabel
        Left = 96
        Top = 40
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          105.833333333333300000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QCustomer'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoSPJ: TQRLabel
        Left = 552
        Top = 24
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          63.500000000000000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoSPJ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object PanelService: TPanel
    Left = 560
    Top = 264
    Width = 129
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 19
    object OutService: TCheckBox
      Left = 0
      Top = 0
      Width = 129
      Height = 17
      Caption = 'Service/Maintenance'
      TabOrder = 0
    end
  end
  object Kenek: TComboBox
    Left = 705
    Top = 492
    Width = 93
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Visible = False
    OnChange = KenekChange
    OnKeyPress = DriverKeyPress
  end
  object KirimWA: TBitBtn
    Left = 823
    Top = 471
    Width = 75
    Height = 25
    Caption = 'Kirim WA'
    TabOrder = 20
    OnClick = BitBtn1Click
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCFE7D6FF69B982FF289C4CFF088E32FF088E32FF289C
      4CFF69B982FFCFE7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF6FAF7FF66B77FFF048F30FF039332FF039433FF039433FF039433FF0394
      33FF039332FF048F30FF66B77FFFF6FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFF6FA
      F7FF3FA760FF179B42FF099839FF039634FF039634FF039634FF039634FF0396
      34FF039634FF039534FF039332FF3FA760FFF6FAF7FFFFFFFFFFFFFFFFFF66B9
      80FF039433FF34AB5CFF41B066FF3DAF64FF3DAF63FF3BAE61FF3AAE61FF3CAE
      63FF19A047FF039735FF039735FF039433FF66B980FFFFFFFFFFCFE8D7FF0593
      33FF049836FF089A3AFF4EB772FF95D3AAFF63BF82FFA7DBB9FFB6E1C4FF85CD
      9DFF44B369FF38AE60FF049937FF049836FF059333FFCFE8D7FF6ABC84FF0498
      36FF049A39FF089C3CFF3FB267FFE9F6EEFFFFFFFFFFFFFFFFFFFFFFFFFFF7FC
      F9FFEBF7EFFF4AB670FF32AD5DFF049A39FF049836FF6ABC84FF29A250FF049B
      39FF049C3AFF3CB265FF66C387FFFFFFFFFFFFFFFFFFE4F4EAFF51BB76FF079D
      3CFF6BC58BFFD7EFDFFF41B46AFF049C3AFF049B39FF29A250FF099738FF049E
      3BFF049E3BFF3BB366FFBDE5CBFFFFFFFFFFE6F5EBFF27AC57FFA3DBB7FF8CD2
      A5FFD5EEDEFFFFFFFFFF53BC79FF20A951FF049E3BFF099738FF09983AFF049F
      3DFF04A03DFF3AB467FFD2EEDCFFFFFFFFFF63C487FF86D1A2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF55BE7CFF32B161FF049F3DFF09983AFF29A655FF05A0
      3EFF05A13FFF3CB66AFFA9DFBDFFFFFFFFFF29AE5BFF5FC384FFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFFFEFF4CBC76FF14A74BFF05A03EFF29A655FF6AC189FF059F
      3EFF05A241FF30B262FF4BBC76FFFBFEFCFFB0E2C3FFCCECD8FFFFFFFFFFFFFF
      FFFFFFFFFFFFACE0C0FF42B96FFF05A241FF059F3EFF6AC189FFCFEAD9FF069D
      3EFF05A342FF05A443FF49BC75FF5FC587FFF1FAF5FFFFFFFFFFFFFFFFFFFFFF
      FFFFB5E4C7FF3EB86EFF21AE58FF05A342FF069D3EFFCFEAD9FFFFFFFFFF67C1
      88FF05A041FF05A444FF07A546FF43BB73FF44BB73FF5AC484FF67C88EFF4CBE
      79FF43BB72FF23AF5BFF05A444FF05A041FF67C188FFFFFFFFFFFFFFFFFFF6FB
      F8FF41B26BFF06A142FF06A545FF06A646FF11AA4EFF3BB96DFF3CB96EFF29B2
      60FF06A646FF06A545FF06A142FF41B26BFFF6FBF8FFFFFFFFFFFFFFFFFFFFFF
      FFFFF6FBF8FF68C28AFF069F41FF06A344FF06A546FF06A646FF06A646FF06A5
      46FF06A344FF069F41FF68C28AFFF6FBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCFEBDAFF6BC38CFF2AAB5BFF0A9F44FF0A9F44FF2AAB
      5BFF6BC38CFFCFEBDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphRight
  end
  object pnl1: TPanel
    Left = 555
    Top = 286
    Width = 185
    Height = 21
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 21
    object StatusWA: TCheckBox
      Left = 5
      Top = 6
      Width = 137
      Height = 17
      Caption = 'Status Pengiriman WA'
      TabOrder = 0
    end
  end
  object NoPolisi: TEdit
    Left = 485
    Top = 441
    Width = 100
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 22
  end
  object SeatDisp: TEdit
    Left = 596
    Top = 441
    Width = 41
    Height = 21
    ReadOnly = True
    TabOrder = 23
  end
  object NoBody: TComboBox
    Left = 697
    Top = 512
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 24
    Visible = False
    OnChange = NoBodyChange
    OnKeyDown = NoBodyKeyDown
    OnKeyPress = NoBodyKeyPress
  end
  object DisplayNoBody: TEdit
    Left = 397
    Top = 441
    Width = 81
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 25
  end
  object grp1: TGroupBox
    Left = 13
    Top = 362
    Width = 316
    Height = 95
    Caption = 'Pengemudi 1'
    TabOrder = 26
    object lbl2: TLabel
      Left = 6
      Top = 20
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object lbl3: TLabel
      Left = 7
      Top = 46
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Telp/HP'
    end
    object Label3: TLabel
      Left = 6
      Top = 68
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status Penugasan'
    end
    object DriverDisp: TEdit
      Left = 96
      Top = 17
      Width = 174
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object TelpHP: TEdit
      Left = 96
      Top = 41
      Width = 150
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = TelpHPKeyPress
    end
    object CariPengemudi1: TButton
      Left = 351
      Top = 13
      Width = 43
      Height = 25
      Caption = '...'
      TabOrder = 2
      OnClick = CariPengemudi1Click
    end
    object BtnDriver: TButton
      Left = 274
      Top = 13
      Width = 35
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = BtnDriverClick
    end
    object StatusPenugasanDriver: TEdit
      Left = 96
      Top = 64
      Width = 150
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = TelpHPKeyPress
    end
  end
  object grp2: TGroupBox
    Left = 13
    Top = 458
    Width = 316
    Height = 95
    Caption = 'Pengemudi 2'
    TabOrder = 27
    object lbl4: TLabel
      Left = 13
      Top = 20
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object lbl5: TLabel
      Left = 14
      Top = 46
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Telp/HP'
    end
    object Label15: TLabel
      Left = 4
      Top = 69
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status Penugasan'
    end
    object DriverDisp2: TEdit
      Left = 95
      Top = 16
      Width = 174
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object TelpHP2: TEdit
      Left = 94
      Top = 41
      Width = 150
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = TelpHPKeyPress
    end
    object CariPengemudi2: TButton
      Left = 349
      Top = 13
      Width = 43
      Height = 25
      Caption = '...'
      TabOrder = 2
    end
    object StatusPenugasanDriver2: TEdit
      Left = 94
      Top = 66
      Width = 150
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = TelpHPKeyPress
    end
    object ClearDriver2: TButton
      Left = 247
      Top = 61
      Width = 59
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 4
      OnClick = ClearDriver2Click
    end
    object BtnDriver2: TButton
      Left = 274
      Top = 12
      Width = 35
      Height = 25
      Caption = '...'
      TabOrder = 5
      OnClick = BtnDriver2Click
    end
  end
  object pnl2: TPanel
    Left = 555
    Top = 312
    Width = 185
    Height = 33
    BevelOuter = bvNone
    TabOrder = 28
    object Connecting: TCheckBox
      Left = 5
      Top = 8
      Width = 137
      Height = 17
      Caption = 'Connecting'
      TabOrder = 0
    end
  end
  object BtnKendaraan: TButton
    Left = 677
    Top = 438
    Width = 41
    Height = 25
    Caption = '...'
    TabOrder = 29
    Visible = False
    OnClick = BtnKendaraanClick
  end
  object GroupBox2: TGroupBox
    Left = 343
    Top = 365
    Width = 305
    Height = 69
    Caption = 'Kenek'
    TabOrder = 30
    object Label21: TLabel
      Left = 5
      Top = 21
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label30: TLabel
      Left = 3
      Top = 44
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status Penugasan'
    end
    object BusBoyDisp: TEdit
      Left = 93
      Top = 16
      Width = 164
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 133
      Top = 69
      Width = 170
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      OnChange = KenekChange
      OnKeyPress = DriverKeyPress
    end
    object StatusPenugasanHelper: TEdit
      Left = 93
      Top = 40
      Width = 124
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = TelpHPKeyPress
    end
    object BtnKenek: TButton
      Left = 262
      Top = 13
      Width = 35
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = BtnKenekClick
    end
    object ClearKenek: TButton
      Left = 240
      Top = 40
      Width = 57
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 4
      OnClick = ClearKenekClick
    end
  end
  object Penjadwalan: TButton
    Left = 822
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Penjadwalan'
    TabOrder = 31
    OnClick = PenjadwalanClick
  end
  object WebService: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 632
    Top = 168
  end
  object ppReport2: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3810
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 144780
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 121
    Template.FileName = 'D:\WH App\Order.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 760
    Top = 200
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 137584
      mmPrintPosition = 0
      object ppNoOrder2: TppLabel
        UserName = 'ppNoOrder'
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
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 22490
        mmWidth = 39688
        BandType = 0
      end
      object ppCustomer2: TppLabel
        UserName = 'Customer'
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
        mmLeft = 29633
        mmTop = 38100
        mmWidth = 80698
        BandType = 0
      end
      object ppTanggalReservasi2: TppLabel
        UserName = 'Customer1'
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
        mmLeft = 29633
        mmTop = 48154
        mmWidth = 80698
        BandType = 0
      end
      object ppAlamat2: TppMemo
        UserName = 'Alamat'
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
        mmHeight = 14288
        mmLeft = 29633
        mmTop = 52917
        mmWidth = 146315
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppAcara2: TppMemo
        UserName = 'Alamat1'
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
        mmLeft = 55033
        mmTop = 67733
        mmWidth = 120915
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppNama2: TppLabel
        UserName = 'Customer2'
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
        mmLeft = 42333
        mmTop = 89694
        mmWidth = 55298
        BandType = 0
      end
      object ppTelpHP2: TppLabel
        UserName = 'TelpHP'
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
        mmLeft = 42333
        mmTop = 93927
        mmWidth = 55298
        BandType = 0
      end
      object ppTanggal2: TppLabel
        UserName = 'TelpHP1'
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
        mmLeft = 16933
        mmTop = 107950
        mmWidth = 42598
        BandType = 0
      end
      object ppTandaPetugas2: TppLabel
        UserName = 'TandaPetugas'
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
        mmLeft = 16933
        mmTop = 120650
        mmWidth = 42598
        BandType = 0
      end
      object ppMessage2: TppLabel
        UserName = 'Message'
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
        mmLeft = 12700
        mmTop = 132555
        mmWidth = 186532
        BandType = 0
      end
      object ppNoBody2: TppLabel
        UserName = 'NoBody'
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
        mmLeft = 133350
        mmTop = 93927
        mmWidth = 42598
        BandType = 0
      end
      object ppNoPolisi2: TppLabel
        UserName = 'NoPolisi'
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
        mmLeft = 133350
        mmTop = 89694
        mmWidth = 42598
        BandType = 0
      end
      object ppSeat2: TppLabel
        UserName = 'Seat'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 38100
        mmWidth = 19315
        BandType = 0
      end
      object ppGuide2: TppLabel
        UserName = 'Seat1'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 42333
        mmWidth = 42598
        BandType = 0
      end
      object ppGuidePhone2: TppLabel
        UserName = 'GuidePhone'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 46567
        mmWidth = 42598
        BandType = 0
      end
      object ppCatatan2: TppMemo
        UserName = 'Alamat2'
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
        mmHeight = 6615
        mmLeft = 12700
        mmTop = 126207
        mmWidth = 186532
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppNoSPJ2: TppLabel
        UserName = 'ppNoOrder1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 21167
        mmTop = 26723
        mmWidth = 44715
        BandType = 0
      end
      object ppJamReservasi2: TppLabel
        UserName = 'JamReservasi'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 182034
        mmTop = 45244
        mmWidth = 15081
        BandType = 0
      end
      object ppCopy2: TppLabel
        UserName = 'ppNoOrder2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 31750
        mmWidth = 25665
        BandType = 0
      end
      object ppGroupName2: TppLabel
        UserName = 'Customer3'
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
        mmLeft = 29633
        mmTop = 43127
        mmWidth = 80698
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SURAT JALAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7408
        mmLeft = 84667
        mmTop = 25400
        mmWidth = 44715
        BandType = 0
      end
      object ppCompany2: TppLabel
        UserName = 'Company2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 2117
        mmWidth = 59531
        BandType = 0
      end
      object ppAddress2: TppMemo
        UserName = 'Alamat3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 10319
        mmLeft = 143934
        mmTop = 5556
        mmWidth = 59531
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppPhone2: TppLabel
        UserName = 'Perusahaan1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 16140
        mmWidth = 70115
        BandType = 0
      end
      object ppLogo2: TppImage
        UserName = 'Logo2'
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        mmHeight = 15081
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Customer4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PEMAKAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6350
        mmTop = 38100
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel19: TppLabel
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
        mmHeight = 4191
        mmLeft = 25400
        mmTop = 38100
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'GROUP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6350
        mmTop = 42863
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TANGGAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6350
        mmTop = 48154
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label201'
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
        mmHeight = 4191
        mmLeft = 25400
        mmTop = 43127
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ALAMAT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6350
        mmTop = 52917
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
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
        mmHeight = 4191
        mmLeft = 25400
        mmTop = 48154
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
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
        mmHeight = 4191
        mmLeft = 25400
        mmTop = 52917
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PESERTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112184
        mmTop = 38100
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label202'
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
        mmHeight = 4191
        mmLeft = 129911
        mmTop = 38100
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'GUIDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112184
        mmTop = 42598
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
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
        mmHeight = 4191
        mmLeft = 129911
        mmTop = 42863
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ACARA PERJALANAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 67733
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
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
        mmLeft = 44450
        mmTop = 67733
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PENGEMUDI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 89694
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
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
        mmLeft = 29633
        mmTop = 89694
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NO. POL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 89694
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
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
        mmLeft = 129117
        mmTop = 89959
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'MULAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 40217
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
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
        mmLeft = 194734
        mmTop = 40217
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SELESAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 55033
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
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
        mmLeft = 194734
        mmTop = 55033
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TANDA TANGAN PEMAKAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 146050
        mmTop = 103717
        mmWidth = 48948
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '(.........................................)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 146050
        mmTop = 121709
        mmWidth = 48948
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '(.........................................)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 14023
        mmTop = 121709
        mmWidth = 48948
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NOTE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 126207
        mmWidth = 12965
        BandType = 0
      end
      object ppFax2: TppLabel
        UserName = 'Fax2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 19579
        mmWidth = 78581
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KERNET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 98954
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
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
        mmLeft = 29633
        mmTop = 98954
        mmWidth = 2381
        BandType = 0
      end
      object ppKernet: TppLabel
        UserName = 'ppKernet'
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
        mmLeft = 42333
        mmTop = 98954
        mmWidth = 55298
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Surat Jalan'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 134
    Template.FileName = 'D:\WH App\Order.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 856
    Top = 200
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 138377
      mmPrintPosition = 0
      object ppNoOrder: TppLabel
        UserName = 'ppNoOrder'
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
        mmHeight = 3704
        mmLeft = 21166
        mmTop = 22489
        mmWidth = 39688
        BandType = 0
      end
      object ppCustomer: TppLabel
        UserName = 'Customer'
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
        mmLeft = 29633
        mmTop = 38100
        mmWidth = 80698
        BandType = 0
      end
      object ppTanggalReservasi: TppLabel
        UserName = 'Customer1'
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
        mmLeft = 29633
        mmTop = 48683
        mmWidth = 80698
        BandType = 0
      end
      object ppAlamat: TppMemo
        UserName = 'Alamat'
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
        mmHeight = 14288
        mmLeft = 29633
        mmTop = 52917
        mmWidth = 146315
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppAcara: TppMemo
        UserName = 'Alamat1'
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
        mmLeft = 55033
        mmTop = 67733
        mmWidth = 120915
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppNama: TppLabel
        UserName = 'Customer2'
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
        mmLeft = 42333
        mmTop = 89694
        mmWidth = 38629
        BandType = 0
      end
      object ppTelpHP: TppLabel
        UserName = 'TelpHP'
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
        mmLeft = 42333
        mmTop = 93663
        mmWidth = 38894
        BandType = 0
      end
      object ppTanggal: TppLabel
        UserName = 'TelpHP1'
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
        mmLeft = 16933
        mmTop = 107950
        mmWidth = 42598
        BandType = 0
      end
      object ppTandaPetugas: TppLabel
        UserName = 'TandaPetugas'
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
        mmLeft = 16933
        mmTop = 120650
        mmWidth = 42598
        BandType = 0
      end
      object ppMessage: TppLabel
        UserName = 'Message'
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
        mmLeft = 12700
        mmTop = 132555
        mmWidth = 186532
        BandType = 0
      end
      object ppNoBody: TppLabel
        UserName = 'NoBody'
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
        mmLeft = 133350
        mmTop = 93663
        mmWidth = 42598
        BandType = 0
      end
      object ppNoPolisi: TppLabel
        UserName = 'NoPolisi'
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
        mmLeft = 133350
        mmTop = 89694
        mmWidth = 42598
        BandType = 0
      end
      object ppSeat: TppLabel
        UserName = 'Seat'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 38100
        mmWidth = 19315
        BandType = 0
      end
      object ppGuide: TppLabel
        UserName = 'Seat1'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 42333
        mmWidth = 42598
        BandType = 0
      end
      object ppGuidePhone: TppLabel
        UserName = 'GuidePhone'
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
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 46567
        mmWidth = 42598
        BandType = 0
      end
      object ppCatatan: TppMemo
        UserName = 'Alamat2'
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
        mmHeight = 6615
        mmLeft = 12700
        mmTop = 126207
        mmWidth = 186532
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppNoSPJ: TppLabel
        UserName = 'ppNoOrder1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 21167
        mmTop = 26723
        mmWidth = 44715
        BandType = 0
      end
      object ppJamReservasi: TppLabel
        UserName = 'JamReservasi'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 182034
        mmTop = 45244
        mmWidth = 15081
        BandType = 0
      end
      object ppCopy: TppLabel
        UserName = 'ppNoOrder2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 31750
        mmWidth = 25665
        BandType = 0
      end
      object ppGroupName: TppLabel
        UserName = 'Customer3'
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
        mmLeft = 29633
        mmTop = 43127
        mmWidth = 80698
        BandType = 0
      end
      object ppExtras: TppLabel
        UserName = 'Extras'
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
        WordWrap = True
        mmHeight = 16140
        mmLeft = 69850
        mmTop = 107950
        mmWidth = 128852
        BandType = 0
      end
      object ppKernet2: TppLabel
        UserName = 'ppKernet'
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
        mmLeft = 42333
        mmTop = 98425
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'KERNET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 6350
        mmTop = 98161
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 29633
        mmTop = 97896
        mmWidth = 2381
        BandType = 0
      end
      object ppKernetHP: TppLabel
        UserName = 'KernetHP'
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
        mmLeft = 42069
        mmTop = 102394
        mmWidth = 55298
        BandType = 0
      end
      object ppdriver2: TppLabel
        UserName = 'driver2'
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
        mmLeft = 81756
        mmTop = 89694
        mmWidth = 38629
        BandType = 0
      end
      object ppHpDriver2: TppLabel
        UserName = 'hpdriver2'
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
        mmLeft = 81756
        mmTop = 93927
        mmWidth = 38629
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
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppReport3: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Surat Jalan'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 134
    Template.FileName = 'D:\NANANG\WHAPS UPDATE PROD\surat jalan baru.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 808
    Top = 256
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 138377
      mmPrintPosition = 0
      object ppNoOrder3: TppLabel
        UserName = 'ppNoOrder'
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
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 26723
        mmWidth = 35454
        BandType = 0
      end
      object ppCustomer3: TppLabel
        UserName = 'Customer'
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
        mmLeft = 23019
        mmTop = 26988
        mmWidth = 80698
        BandType = 0
      end
      object ppTanggalReservasi3: TppLabel
        UserName = 'Customer1'
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
        mmLeft = 23019
        mmTop = 35719
        mmWidth = 80698
        BandType = 0
      end
      object ppAlamat3: TppMemo
        UserName = 'Alamat'
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
        mmHeight = 17198
        mmLeft = 23019
        mmTop = 40217
        mmWidth = 91017
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppAcara3: TppMemo
        UserName = 'Alamat1'
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
        mmHeight = 28046
        mmLeft = 41275
        mmTop = 57415
        mmWidth = 135732
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppTanggal3: TppLabel
        UserName = 'TelpHP1'
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
        mmLeft = 14023
        mmTop = 120915
        mmWidth = 42598
        BandType = 0
      end
      object ppTandaPetugas3: TppLabel
        UserName = 'TandaPetugas'
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
        mmLeft = 13229
        mmTop = 133086
        mmWidth = 42598
        BandType = 0
      end
      object ppSeat3: TppLabel
        UserName = 'Seat'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 30956
        mmWidth = 19315
        BandType = 0
      end
      object ppGuide3: TppLabel
        UserName = 'Seat1'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 35190
        mmWidth = 42598
        BandType = 0
      end
      object ppGuidePhone3: TppLabel
        UserName = 'GuidePhone'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 39688
        mmWidth = 42598
        BandType = 0
      end
      object ppNoSPJ3: TppLabel
        UserName = 'ppNoOrder1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4657
        mmLeft = 83608
        mmTop = 13758
        mmWidth = 44715
        BandType = 0
      end
      object ppJamReservasi3: TppLabel
        UserName = 'JamReservasi'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 185473
        mmTop = 29898
        mmWidth = 13229
        BandType = 0
      end
      object ppCopy3: TppLabel
        UserName = 'ppNoOrder2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 18521
        mmWidth = 25665
        BandType = 0
      end
      object ppGroupName3: TppLabel
        UserName = 'Customer3'
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
        mmLeft = 23019
        mmTop = 31485
        mmWidth = 80698
        BandType = 0
      end
      object ppNama3: TppLabel
        UserName = 'Nama3'
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
        mmLeft = 23019
        mmTop = 94721
        mmWidth = 28840
        BandType = 0
      end
      object ppTelpHP3: TppLabel
        UserName = 'TelpHP3'
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
        mmLeft = 23019
        mmTop = 98954
        mmWidth = 28575
        BandType = 0
      end
      object ppKernet3: TppLabel
        UserName = 'Kernet3'
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
        mmLeft = 93663
        mmTop = 94986
        mmWidth = 49213
        BandType = 0
      end
      object ppKernetHP3: TppLabel
        UserName = 'KernetHP3'
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
        mmLeft = 93663
        mmTop = 98954
        mmWidth = 49742
        BandType = 0
      end
      object ppNoPolisi3: TppLabel
        UserName = 'NoPolisi3'
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
        mmLeft = 165100
        mmTop = 94721
        mmWidth = 30427
        BandType = 0
      end
      object ppCatatan3: TppMemo
        UserName = 'Alamat4'
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
        mmHeight = 16933
        mmLeft = 23019
        mmTop = 103717
        mmWidth = 172244
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppNoBody3: TppLabel
        UserName = 'NoBody3'
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
        mmLeft = 165100
        mmTop = 98954
        mmWidth = 30427
        BandType = 0
      end
      object ppdriver23: TppLabel
        UserName = 'driver23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'EDI SUHAEDI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 94721
        mmWidth = 23019
        BandType = 0
      end
      object ppHpDriver23: TppLabel
        UserName = 'HpDriver23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '08551250120'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 98954
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pastikan Surat Jalan di Tanda Tangani Customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7408
        mmLeft = 72496
        mmTop = 87048
        mmWidth = 125148
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList3: TppParameterList
    end
  end
  object ppReport4: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Surat Jalan'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 134
    Template.FileName = 'D:\WH App\Order.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 752
    Top = 272
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 138377
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppNoOrder'
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
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 26723
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Customer'
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
        mmLeft = 23019
        mmTop = 26988
        mmWidth = 80698
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Customer1'
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
        mmLeft = 23019
        mmTop = 35719
        mmWidth = 80698
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Alamat'
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
        mmHeight = 17198
        mmLeft = 23019
        mmTop = 40217
        mmWidth = 91017
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Alamat1'
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
        mmHeight = 37042
        mmLeft = 41275
        mmTop = 57415
        mmWidth = 119327
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel35: TppLabel
        UserName = 'TelpHP1'
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
        mmLeft = 14023
        mmTop = 120915
        mmWidth = 42598
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'TandaPetugas'
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
        mmLeft = 13229
        mmTop = 133086
        mmWidth = 42598
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Seat'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 30956
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Seat1'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 35190
        mmWidth = 42598
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'GuidePhone'
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
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 39688
        mmWidth = 42598
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'ppNoOrder1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4657
        mmLeft = 83608
        mmTop = 14552
        mmWidth = 44715
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'JamReservasi'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 185473
        mmTop = 29898
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'ppNoOrder2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 18521
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Customer3'
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
        mmLeft = 23019
        mmTop = 31485
        mmWidth = 80698
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Nama3'
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
        mmLeft = 23020
        mmTop = 94721
        mmWidth = 49213
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'TelpHP3'
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
        mmLeft = 23019
        mmTop = 98954
        mmWidth = 49213
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Kernet3'
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
        mmLeft = 93663
        mmTop = 94986
        mmWidth = 49213
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'KernetHP3'
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
        mmLeft = 93663
        mmTop = 98954
        mmWidth = 49742
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'NoPolisi3'
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
        mmLeft = 165100
        mmTop = 94721
        mmWidth = 30427
        BandType = 0
      end
      object ppMemo3: TppMemo
        UserName = 'Alamat4'
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
        mmHeight = 16933
        mmLeft = 23019
        mmTop = 103717
        mmWidth = 172244
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel49: TppLabel
        UserName = 'NoBody3'
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
        mmLeft = 165100
        mmTop = 98954
        mmWidth = 30427
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
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList4: TppParameterList
    end
  end
end
