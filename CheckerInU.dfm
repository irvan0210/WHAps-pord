object CheckerIn: TCheckerIn
  Left = 353
  Top = 208
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Armada Kembali'
  ClientHeight = 641
  ClientWidth = 813
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
  object Label1: TLabel
    Left = 48
    Top = 96
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label3: TLabel
    Left = 72
    Top = 48
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label6: TLabel
    Left = 61
    Top = 120
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Driver'
  end
  object Label13: TLabel
    Left = 60
    Top = 72
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'No SJ'
  end
  object Label11: TLabel
    Left = 25
    Top = 144
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Reservasi'
  end
  object Label7: TLabel
    Left = 70
    Top = 168
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hari'
  end
  object Label14: TLabel
    Left = 67
    Top = 240
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rute'
  end
  object Label15: TLabel
    Left = 5
    Top = 293
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = 'Titik Penjemputan'
  end
  object Label19: TLabel
    Left = 35
    Top = 341
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label5: TLabel
    Left = 60
    Top = 192
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label17: TLabel
    Left = 61
    Top = 216
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Guide'
  end
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 448
    Width = 559
    Height = 185
    Caption = 'Data SPJ'
    TabOrder = 4
    DesignSize = (
      559
      185)
    object Label12: TLabel
      Left = 408
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Total Unit Keluar'
    end
    object Panel3: TPanel
      Left = 496
      Top = 8
      Width = 58
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object UnitJalan: TEdit
        Left = 0
        Top = 0
        Width = 53
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object GridSPJ: TZColorStringGrid
      Left = 7
      Top = 32
      Width = 544
      Height = 145
      Anchors = [akLeft, akTop, akRight]
      ColCount = 6
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnDblClick = ZColorStringGrid1DblClick
      OnSelectCell = GridSPJSelectCell
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'Tahoma'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'Tahoma'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
      ColWidths = (
        102
        49
        76
        169
        68
        50)
    end
  end
  object Cari: TEdit
    Left = 96
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = CariChange
  end
  object Simpan: TButton
    Left = 704
    Top = 513
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 704
    Top = 577
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 6
    OnClick = SelesaiClick
  end
  object Bersihkan: TButton
    Left = 704
    Top = 545
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 7
    OnClick = BersihkanClick
  end
  object Panel1: TPanel
    Left = 96
    Top = 96
    Width = 457
    Height = 145
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object Label10: TLabel
      Left = 251
      Top = 4
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Label16: TLabel
      Left = 52
      Top = 76
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dari Tgl'
    end
    object Label22: TLabel
      Left = 164
      Top = 76
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label18: TLabel
      Left = 185
      Top = 124
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
    end
    object Label26: TLabel
      Left = 270
      Top = 76
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Stand By'
    end
    object NoBodi: TEdit
      Left = 0
      Top = 0
      Width = 97
      Height = 21
      TabOrder = 2
    end
    object Driver: TEdit
      Left = 0
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 4
    end
    object NoReservasi: TEdit
      Left = 0
      Top = 48
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object Hari: TEdit
      Left = 0
      Top = 72
      Width = 33
      Height = 21
      TabOrder = 6
    end
    object FromDate: TEdit
      Left = 96
      Top = 72
      Width = 65
      Height = 21
      TabOrder = 8
    end
    object ToDate: TEdit
      Left = 184
      Top = 72
      Width = 65
      Height = 21
      TabOrder = 9
    end
    object Group: TEdit
      Left = 0
      Top = 96
      Width = 297
      Height = 21
      TabOrder = 10
    end
    object Guide: TEdit
      Left = 0
      Top = 120
      Width = 161
      Height = 21
      TabOrder = 11
    end
    object GuideCellular: TEdit
      Left = 248
      Top = 120
      Width = 97
      Height = 21
      TabOrder = 12
    end
    object NoPolisi: TEdit
      Left = 96
      Top = 0
      Width = 113
      Height = 21
      TabStop = False
      TabOrder = 3
    end
    object Seat: TEdit
      Left = 208
      Top = 0
      Width = 41
      Height = 21
      TabOrder = 7
    end
    object DriverDisp: TEdit
      Left = 96
      Top = 24
      Width = 201
      Height = 21
      TabOrder = 5
    end
    object Customer: TEdit
      Left = 96
      Top = 48
      Width = 337
      Height = 21
      TabOrder = 1
    end
    object FuelConsRate: TEdit
      Left = 352
      Top = 120
      Width = 65
      Height = 21
      TabOrder = 13
    end
    object StandBy: TMaskEdit
      Left = 318
      Top = 72
      Width = 40
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 14
      Text = '  :  '
      OnKeyPress = InTimeKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 0
    Width = 305
    Height = 41
    Enabled = False
    TabOrder = 0
    object Label4: TLabel
      Left = 32
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Tanggal: TEdit
      Left = 80
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
    end
  end
  object NoSJ: TComboBox
    Left = 96
    Top = 72
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = NoSJChange
  end
  object GroupInput: TGroupBox
    Left = 389
    Top = 240
    Width = 413
    Height = 209
    Caption = 'Detail Masuk'
    TabOrder = 8
    object Label2: TLabel
      Left = 216
      Top = 150
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Label8: TLabel
      Left = 72
      Top = 28
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'KM Odo'
    end
    object Label9: TLabel
      Left = 56
      Top = 173
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object Label20: TLabel
      Left = 50
      Top = 149
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label21: TLabel
      Left = 56
      Top = 61
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Solar SPBU'
    end
    object Label23: TLabel
      Left = 5
      Top = 128
      Width = 107
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tol && Parkir Reimburse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 35
      Top = 98
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Solar Reimburse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 278
      Top = 64
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fee Driver Reimburse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lbl1: TLabel
      Left = 221
      Top = 127
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Overtime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox4: TGroupBox
      Left = 274
      Top = 8
      Width = 73
      Height = 41
      Caption = 'Total'
      Enabled = False
      TabOrder = 2
      object KMOdoTotal: TEdit
        Left = 8
        Top = 14
        Width = 57
        Height = 21
        TabOrder = 0
      end
    end
    object GroupDetail: TGroupBox
      Left = 194
      Top = 8
      Width = 81
      Height = 41
      Caption = 'Akhir'
      TabOrder = 1
      object KmOdoAkhir: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        TabOrder = 0
        OnEnter = KmOdoAkhirEnter
        OnExit = KmOdoAkhirExit
        OnKeyPress = KmOdoAkhirKeyPress
      end
    end
    object GroupBox1: TGroupBox
      Left = 114
      Top = 8
      Width = 81
      Height = 41
      Caption = 'Awal'
      Enabled = False
      TabOrder = 0
      object KMOdoAwal: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        TabOrder = 0
        OnEnter = KMOdoAwalEnter
        OnExit = KMOdoAwalExit
      end
    end
    object InTime: TMaskEdit
      Left = 242
      Top = 146
      Width = 41
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 10
      Text = '  :  '
      OnKeyPress = InTimeKeyPress
    end
    object RemarkOut: TMemo
      Left = 114
      Top = 169
      Width = 293
      Height = 35
      TabOrder = 11
      OnKeyPress = RemarkOutKeyPress
    end
    object InDate: TDateTimePicker
      Left = 114
      Top = 146
      Width = 89
      Height = 21
      Date = 41963.592647025470000000
      Time = 41963.592647025470000000
      TabOrder = 9
      OnKeyPress = InDateKeyPress
    end
    object GroupBBMLiter: TGroupBox
      Left = 194
      Top = 43
      Width = 81
      Height = 40
      Caption = 'Liter'
      TabOrder = 4
      object BBMLiter: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        TabOrder = 0
        OnEnter = BBMLiterEnter
        OnExit = BBMLiterExit
        OnKeyPress = BBMLiterKeyPress
      end
    end
    object GroupBBMPrice: TGroupBox
      Left = 114
      Top = 43
      Width = 81
      Height = 40
      Caption = 'Harga'
      TabOrder = 3
      object BBMPrice: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        TabOrder = 0
        OnEnter = BBMPriceEnter
        OnExit = BBMPriceExit
        OnKeyPress = BBMPriceKeyPress
      end
    end
    object TolParkir: TEdit
      Left = 114
      Top = 124
      Width = 89
      Height = 21
      TabOrder = 7
      OnEnter = TolParkirEnter
      OnExit = TolParkirExit
      OnKeyPress = TolParkirKeyPress
    end
    object GroupBox3: TGroupBox
      Left = 114
      Top = 82
      Width = 81
      Height = 40
      Caption = 'Harga'
      Color = 13882323
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 5
      object BBMPriceReimburse: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = BBMPriceReimburseEnter
        OnExit = BBMPriceReimburseExit
        OnKeyPress = BBMPriceReimburseKeyPress
      end
    end
    object GroupBox5: TGroupBox
      Left = 193
      Top = 82
      Width = 81
      Height = 40
      Caption = 'Liter'
      Color = 13882323
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
      object BBMLiterReimburse: TEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = BBMLiterReimburseEnter
        OnExit = BBMLiterReimburseExit
        OnKeyPress = BBMLiterReimburseKeyPress
      end
    end
    object DriverReimburse: TEdit
      Left = 287
      Top = 76
      Width = 89
      Height = 21
      TabOrder = 8
      Visible = False
      OnEnter = DriverReimburseEnter
      OnExit = DriverReimburseExit
      OnKeyPress = DriverReimburseKeyPress
    end
    object eOvertime: TEdit
      Left = 275
      Top = 124
      Width = 89
      Height = 21
      TabOrder = 12
      OnChange = eOvertimeChange
      OnEnter = eOvertimeEnter
      OnExit = eOvertimeExit
      OnKeyPress = eOvertimeKeyPress
    end
  end
  object GroupService: TGroupBox
    Left = 400
    Top = 0
    Width = 313
    Height = 137
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 9
    TabStop = True
    object GridService: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 297
      Height = 113
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
  object Remark: TMemo
    Left = 96
    Top = 340
    Width = 289
    Height = 45
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object PickupPoint: TMemo
    Left = 96
    Top = 292
    Width = 289
    Height = 45
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object Route: TMemo
    Left = 96
    Top = 240
    Width = 289
    Height = 49
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object All: TCheckBox
    Left = 72
    Top = 436
    Width = 65
    Height = 17
    Caption = 'Semua'
    TabOrder = 13
    OnClick = AllClick
  end
  object CheckList: TButton
    Left = 704
    Top = 481
    Width = 75
    Height = 25
    Caption = 'Cek List'
    TabOrder = 14
    OnClick = CheckListClick
  end
  object btn1: TButton
    Left = 576
    Top = 208
    Width = 97
    Height = 25
    Caption = 'Update KM Awal'
    TabOrder = 15
    OnClick = btn1Click
  end
  object WebService: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 736
    Top = 136
  end
  object ppReportReimburse: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
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
    Left = 696
    Top = 136
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
    object ppParameterList2: TppParameterList
    end
  end
end
