object OrderFeeAdd: TOrderFeeAdd
  Left = 252
  Top = 547
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Uang Order'
  ClientHeight = 582
  ClientWidth = 938
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 72
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label6: TLabel
    Left = 69
    Top = 96
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Driver'
  end
  object Label13: TLabel
    Left = 68
    Top = 48
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'No SJ'
  end
  object Label8: TLabel
    Left = 45
    Top = 144
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pemakaian'
  end
  object Label11: TLabel
    Left = 33
    Top = 120
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Reservasi'
  end
  object Label7: TLabel
    Left = 75
    Top = 216
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rute'
  end
  object Label14: TLabel
    Left = 13
    Top = 269
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = 'Titik Penjemputan'
  end
  object Label19: TLabel
    Left = 43
    Top = 301
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label23: TLabel
    Left = 69
    Top = 168
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label24: TLabel
    Left = 28
    Top = 192
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'Guilde/TL/PIC'
  end
  object Label31: TLabel
    Left = 509
    Top = 123
    Width = 72
    Height = 13
    Caption = 'Tombol Cepat :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel4: TPanel
    Left = 708
    Top = 552
    Width = 137
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 4
    object Label10: TLabel
      Left = 9
      Top = 6
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object TotalBayar: TMemo
      Left = 40
      Top = 4
      Width = 81
      Height = 21
      Alignment = taRightJustify
      MaxLength = 25
      TabOrder = 0
      WantReturns = False
      WantTabs = True
    end
  end
  object Selesai: TButton
    Left = 850
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 8
    OnClick = SelesaiClick
  end
  object Panel1: TPanel
    Left = 104
    Top = 48
    Width = 401
    Height = 297
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object Label9: TLabel
      Left = 40
      Top = 100
      Width = 19
      Height = 13
      Caption = 'Hari'
    end
    object Label21: TLabel
      Left = 219
      Top = 28
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Label20: TLabel
      Left = 93
      Top = 100
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dari Tgl'
    end
    object Label22: TLabel
      Left = 204
      Top = 100
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label25: TLabel
      Left = 138
      Top = 144
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
    end
    object NoBody: TEdit
      Left = 0
      Top = 24
      Width = 105
      Height = 21
      TabOrder = 2
    end
    object Driver: TEdit
      Left = 0
      Top = 48
      Width = 105
      Height = 21
      TabOrder = 5
    end
    object NoReservasi: TEdit
      Left = 0
      Top = 72
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Customer: TEdit
      Left = 104
      Top = 72
      Width = 289
      Height = 21
      TabOrder = 1
    end
    object Hari: TEdit
      Left = 0
      Top = 96
      Width = 33
      Height = 21
      TabOrder = 7
      OnKeyPress = HariKeyPress
    end
    object Route: TMemo
      Left = 0
      Top = 168
      Width = 305
      Height = 49
      TabOrder = 8
    end
    object PickupPoint: TMemo
      Left = 0
      Top = 220
      Width = 305
      Height = 29
      TabOrder = 9
    end
    object Remark: TMemo
      Left = 0
      Top = 252
      Width = 305
      Height = 45
      TabOrder = 10
    end
    object DriverDisp: TEdit
      Left = 104
      Top = 48
      Width = 169
      Height = 21
      TabOrder = 6
    end
    object FromDate: TEdit
      Left = 136
      Top = 96
      Width = 65
      Height = 21
      TabOrder = 11
    end
    object ToDate: TEdit
      Left = 224
      Top = 96
      Width = 65
      Height = 21
      TabOrder = 12
    end
    object Group: TEdit
      Left = 0
      Top = 120
      Width = 305
      Height = 21
      TabOrder = 13
    end
    object Guide: TEdit
      Left = 0
      Top = 144
      Width = 129
      Height = 21
      TabOrder = 14
    end
    object GuideCellular: TEdit
      Left = 200
      Top = 144
      Width = 105
      Height = 21
      TabOrder = 15
    end
    object NoSJ: TEdit
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      TabOrder = 16
      OnKeyDown = FormKeyDown
    end
    object NoPolisi: TEdit
      Left = 104
      Top = 24
      Width = 73
      Height = 21
      TabStop = False
      TabOrder = 3
    end
    object Seat: TEdit
      Left = 176
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 401
    Height = 41
    Enabled = False
    TabOrder = 0
    object Label4: TLabel
      Left = 48
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 308
      Top = 12
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Tanggal: TEdit
      Left = 96
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object Jam: TEdit
      Left = 328
      Top = 12
      Width = 49
      Height = 21
      TabOrder = 1
    end
  end
  object Simpan: TButton
    Left = 850
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 850
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 6
    OnClick = BersihkanClick
  end
  object CetakUlang: TButton
    Left = 850
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 7
    OnClick = CetakUlangClick
  end
  object GroupService: TGroupBox
    Left = 416
    Top = 0
    Width = 313
    Height = 121
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 2
    TabStop = True
    object GridService: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 297
      Height = 97
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
  object QRLuarKota: TQuickRep
    Left = 976
    Top = -104
    Width = 805
    Height = 1230
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
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      50.000000000000000000
      3255.000000000000000000
      50.000000000000000000
      2130.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    object QRBand4: TQRBand
      Left = 19
      Top = 49
      Width = 767
      Height = 464
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
        1227.666666666667000000
        2029.354166666667000000)
      BandType = rbTitle
      object QLTanggal: TQRLabel
        Left = 552
        Top = 8
        Width = 137
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          21.166666666666670000
          362.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTanggal'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLDriver: TQRLabel
        Left = 184
        Top = 194
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          513.291666666666800000
          743.479166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLDriver'
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
      object QLBus: TQRLabel
        Left = 184
        Top = 215
        Width = 121
        Height = 17
        Hint = 'c'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          568.854166666666800000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLBus'
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
      object QLCustomer: TQRLabel
        Left = 184
        Top = 257
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          679.979166666666800000
          743.479166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLCustomer'
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
      object QLRoute: TQRLabel
        Left = 184
        Top = 236
        Width = 409
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          624.416666666666800000
          1082.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLRoute'
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
      object QLFeeSupir: TQRLabel
        Left = 184
        Top = 306
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          809.625000000000000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLFeeSupir'
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
      object QLFeeKenek: TQRLabel
        Left = 184
        Top = 326
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          862.541666666666900000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLFeeKenek'
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
      object QLBBM: TQRLabel
        Left = 184
        Top = 347
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          918.104166666666800000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLBBM'
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
      object QLTolParkir: TQRLabel
        Left = 184
        Top = 368
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          973.666666666666900000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTolParkir'
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
      object QLHari: TQRLabel
        Left = 616
        Top = 257
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          679.979166666666800000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLHari'
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
      object QLTotalFeeSupir: TQRLabel
        Left = 576
        Top = 306
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          809.625000000000000000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotalFeeSupir'
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
      object QLTotalFeeKenek: TQRLabel
        Left = 576
        Top = 326
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          862.541666666666900000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotalFeeKenek'
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
      object QLLain: TQRLabel
        Left = 184
        Top = 388
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          1026.583333333333000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLLain'
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
      object QLTotalBBM: TQRLabel
        Left = 576
        Top = 347
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          918.104166666666800000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotalBBM'
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
      object QLTotalTolParkir: TQRLabel
        Left = 576
        Top = 368
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          973.666666666666900000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotalTolParkir'
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
      object QLTotalLain: TQRLabel
        Left = 576
        Top = 389
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          1029.229166666667000000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotalLain'
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
      object QLTotal: TQRLabel
        Left = 576
        Top = 417
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          1103.312500000000000000
          383.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLTotal'
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
      object QLNoSJ: TQRLabel
        Left = 552
        Top = 145
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          383.645833333333400000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLNoSJ'
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
      object QLNoReservasi: TQRLabel
        Left = 552
        Top = 161
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          425.979166666666700000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLNoReservasi'
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
      object QLCopy: TQRLabel
        Left = 656
        Top = 48
        Width = 97
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1735.666666666667000000
          127.000000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLCopy'
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
    object QRBand5: TQRBand
      Left = 19
      Top = 19
      Width = 767
      Height = 30
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
        79.375000000000000000
        2029.354166666667000000)
      BandType = rbPageHeader
    end
  end
  object QRDalamKota: TQuickRep
    Left = 936
    Top = -24
    Width = 378
    Height = 561
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
      1484.312500000000000000
      50.000000000000000000
      1000.125000000000000000
      50.000000000000000000
      50.000000000000000000
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
      Left = 19
      Top = 105
      Width = 340
      Height = 168
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
        444.500000000000000000
        899.583333333333300000)
      BandType = rbTitle
      object QNoSJ: TQRLabel
        Left = 208
        Top = 8
        Width = 129
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          550.333333333333400000
          21.166666666666670000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoSJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QTanggal: TQRLabel
        Left = 120
        Top = 72
        Width = 113
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          190.500000000000000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QNama: TQRLabel
        Left = 120
        Top = 96
        Width = 209
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          254.000000000000000000
          552.979166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNama'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QNoResv: TQRLabel
        Left = 120
        Top = 120
        Width = 209
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          317.500000000000000000
          552.979166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoResv'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QNoPolisi: TQRLabel
        Left = 120
        Top = 146
        Width = 129
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          386.291666666666700000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoPolisi'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QCopy: TQRLabel
        Left = 240
        Top = 32
        Width = 97
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          635.000000000000000000
          84.666666666666680000
          256.645833333333400000)
        Alignment = taLeftJustify
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
    object QRBand2: TQRBand
      Left = 19
      Top = 19
      Width = 340
      Height = 86
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
        227.541666666666700000
        899.583333333333300000)
      BandType = rbPageHeader
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 273
      Width = 340
      Height = 264
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
        698.500000000000000000
        899.583333333333300000)
      BandType = rbPageFooter
      object QBBM: TQRLabel
        Left = 120
        Top = 40
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          105.833333333333300000
          256.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QBBM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QFeeSupir: TQRLabel
        Left = 120
        Top = 64
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          169.333333333333300000
          256.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QFeeSupir'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QFeeKenek: TQRLabel
        Left = 120
        Top = 88
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          232.833333333333400000
          256.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QFeeKenek'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QTollParkir: TQRLabel
        Left = 120
        Top = 112
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          296.333333333333400000
          256.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTollParkir'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QTotal: TQRLabel
        Left = 120
        Top = 160
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          317.500000000000000000
          423.333333333333300000
          256.645833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
  end
  object GroupBiaya: TGroupBox
    Left = 12
    Top = 352
    Width = 829
    Height = 200
    Caption = 'Biaya'
    TabOrder = 3
    TabStop = True
    object Label2: TLabel
      Left = 58
      Top = 24
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'BBM'
    end
    object Label15: TLabel
      Left = 32
      Top = 48
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fee Driver'
    end
    object Label16: TLabel
      Left = 29
      Top = 72
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fee Kenek'
    end
    object Label17: TLabel
      Left = 54
      Top = 124
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Parkir'
    end
    object Label18: TLabel
      Left = 4
      Top = 146
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bermalam Driver'
    end
    object Label26: TLabel
      Left = 24
      Top = 170
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Overtime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 66
      Top = 99
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tol'
    end
    object GroupRupiah: TGroupBox
      Left = 88
      Top = 8
      Width = 89
      Height = 186
      Caption = ' Awal/Budget '
      Enabled = False
      TabOrder = 0
      object BusBoyFee: TMemo
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 2
        WantReturns = False
        WantTabs = True
        OnEnter = BusBoyFeeEnter
        OnExit = BusBoyFeeExit
        OnKeyPress = BusBoyFeeKeyPress
      end
      object TollParking: TMemo
        Left = 8
        Top = 112
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 4
        WantReturns = False
        WantTabs = True
        OnEnter = TollParkingEnter
        OnExit = TollParkingExit
        OnKeyPress = TollParkingKeyPress
      end
      object StayNight: TMemo
        Left = 8
        Top = 136
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 5
        WantReturns = False
        WantTabs = True
        OnEnter = StayNightEnter
        OnExit = StayNightExit
        OnKeyPress = StayNightKeyPress
      end
      object Panel2: TPanel
        Left = 8
        Top = 16
        Width = 79
        Height = 25
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object BBMRupiah: TMemo
          Left = 0
          Top = 0
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 0
          WantReturns = False
          WantTabs = True
        end
      end
      object DriverFee: TMemo
        Left = 8
        Top = 40
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 1
        WantReturns = False
        WantTabs = True
        OnEnter = DriverFeeEnter
        OnExit = DriverFeeExit
        OnKeyPress = DriverFeeKeyPress
      end
      object Toll: TMemo
        Left = 8
        Top = 88
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 3
        WantReturns = False
        WantTabs = True
        OnEnter = TollParkingEnter
        OnExit = TollParkingExit
        OnKeyPress = TollParkingKeyPress
      end
      object Overtime: TMemo
        Left = 8
        Top = 159
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 6
        WantReturns = False
        WantTabs = True
        OnEnter = OvertimeEnter
        OnExit = OvertimeExit
        OnKeyPress = OvertimeKeyPress
      end
    end
    object GroupLiter: TGroupBox
      Left = 176
      Top = 8
      Width = 57
      Height = 186
      Caption = 'Liter'
      Enabled = False
      TabOrder = 1
      object BBMLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
      end
    end
    object GroupTotal: TGroupBox
      Left = 727
      Top = 8
      Width = 97
      Height = 186
      Caption = 'Total Rupiah'
      Enabled = False
      TabOrder = 2
      object BBMTotalRupiah: TMemo
        Left = 8
        Top = 16
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 0
        WantReturns = False
        WantTabs = True
      end
      object DriverFeeTotal: TMemo
        Left = 8
        Top = 40
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 1
        WantReturns = False
        WantTabs = True
      end
      object BusBoyFeeTotal: TMemo
        Left = 8
        Top = 64
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 2
        WantReturns = False
        WantTabs = True
      end
      object TollParkingTotal: TMemo
        Left = 8
        Top = 112
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 4
        WantReturns = False
        WantTabs = True
      end
      object StayNightTotal: TMemo
        Left = 8
        Top = 136
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 5
        WantReturns = False
        WantTabs = True
      end
      object TollTotal: TMemo
        Left = 8
        Top = 88
        Width = 81
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 3
        WantReturns = False
        WantTabs = True
      end
      object OvertimeTotal: TMemo
        Left = 8
        Top = 159
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 6
        WantReturns = False
        WantTabs = True
        OnEnter = TollParkingReimburseEnter
        OnExit = TollParkingReimburseExit
        OnKeyPress = TollParkingReimburseKeyPress
      end
    end
    object GroupBox1: TGroupBox
      Left = 232
      Top = 8
      Width = 89
      Height = 186
      Caption = 'Rupiah (+ / -)'
      TabOrder = 3
      object BusBoyFeeAdd: TMemo
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 2
        WantReturns = False
        WantTabs = True
        OnEnter = BusBoyFeeAddEnter
        OnExit = BusBoyFeeAddExit
        OnKeyPress = BusBoyFeeAddKeyPress
      end
      object TollParkingAdd: TMemo
        Left = 8
        Top = 112
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 3
        WantReturns = False
        WantTabs = True
        OnEnter = TollParkingAddEnter
        OnExit = TollParkingAddExit
        OnKeyPress = TollParkingAddKeyPress
      end
      object StayNightAdd: TMemo
        Left = 8
        Top = 136
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 5
        WantReturns = False
        WantTabs = True
        OnEnter = StayNightAddEnter
        OnExit = StayNightAddExit
        OnKeyPress = StayNightAddKeyPress
      end
      object DriverFeeAdd: TMemo
        Left = 8
        Top = 40
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 1
        WantReturns = False
        WantTabs = True
        OnEnter = DriverFeeAddEnter
        OnExit = DriverFeeAddExit
        OnKeyPress = DriverFeeAddKeyPress
      end
      object BBMAddRupiah: TMemo
        Left = 8
        Top = 16
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 0
        WantReturns = False
        WantTabs = True
        OnEnter = BBMAddRupiahEnter
        OnExit = BBMAddRupiahExit
        OnKeyPress = BBMAddRupiahKeyPress
      end
      object TollAdd: TMemo
        Left = 8
        Top = 88
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 4
        WantReturns = False
        WantTabs = True
        OnEnter = TollAddEnter
        OnExit = TollAddExit
        OnKeyPress = TollAddKeyPress
      end
      object OvertimeAdd: TMemo
        Left = 8
        Top = 159
        Width = 73
        Height = 21
        Alignment = taRightJustify
        MaxLength = 25
        TabOrder = 6
        WantReturns = False
        WantTabs = True
        OnEnter = OvertimeAddEnter
        OnExit = OvertimeAddExit
        OnKeyPress = OvertimeAddKeyPress
      end
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 8
      Width = 57
      Height = 186
      Caption = 'Ltr (+/-)'
      TabOrder = 4
      object BBMAddLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        OnEnter = BBMAddLiterEnter
        OnExit = BBMAddLiterExit
        OnKeyPress = BBMAddLiterKeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 671
      Top = 8
      Width = 57
      Height = 186
      Caption = 'Total Ltr'
      Enabled = False
      TabOrder = 5
      object BBMTotalLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 376
      Top = 8
      Width = 89
      Height = 186
      Caption = ' Reimburse '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object BusBoyFeeReimburse: TMemo
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 2
        WantReturns = False
        WantTabs = True
        OnEnter = BusBoyFeeReimburseEnter
        OnExit = BusBoyFeeReimburseExit
        OnKeyPress = BusBoyFeeReimburseKeyPress
      end
      object TollParkingReimburse: TMemo
        Left = 8
        Top = 112
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 4
        WantReturns = False
        WantTabs = True
        OnEnter = TollParkingReimburseEnter
        OnExit = TollParkingReimburseExit
        OnKeyPress = TollParkingReimburseKeyPress
      end
      object DriverFeeReimburse: TMemo
        Left = 8
        Top = 40
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 1
        WantReturns = False
        WantTabs = True
        OnEnter = DriverFeeReimburseEnter
        OnExit = DriverFeeReimburseExit
        OnKeyPress = DriverFeeReimburseKeyPress
      end
      object TollReimburse: TMemo
        Left = 8
        Top = 88
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 3
        WantReturns = False
        WantTabs = True
        OnEnter = TollReimburseEnter
        OnExit = TollReimburseExit
        OnKeyPress = TollReimburseKeyPress
      end
      object XOvertimeReimburse: TMemo
        Left = 8
        Top = 159
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 5
        Visible = False
        WantReturns = False
        WantTabs = True
        OnEnter = XOvertimeReimburseEnter
        OnExit = XOvertimeReimburseExit
        OnKeyPress = XOvertimeReimburseKeyPress
      end
      object BBMReimburse: TMemo
        Left = 8
        Top = 16
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 0
        WantReturns = False
        WantTabs = True
        OnEnter = BBMReimburseEnter
        OnExit = BBMReimburseExit
        OnKeyPress = BBMReimburseKeyPress
      end
    end
    object GroupBox6: TGroupBox
      Left = 519
      Top = 8
      Width = 89
      Height = 186
      Caption = ' SPBU '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object BBMSpbu: TMemo
        Left = 8
        Top = 16
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 0
        WantReturns = False
        WantTabs = True
        OnEnter = BBMSpbuEnter
        OnExit = BBMSpbuExit
        OnKeyPress = BBMSpbuKeyPress
      end
    end
    object GroupBox7: TGroupBox
      Left = 463
      Top = 7
      Width = 57
      Height = 186
      Caption = 'Ltr (+/-)'
      Enabled = False
      TabOrder = 8
      object BBMReimburseAddLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox8: TGroupBox
      Left = 606
      Top = 8
      Width = 57
      Height = 186
      Caption = 'Ltr (+/-)'
      Enabled = False
      TabOrder = 9
      object BBMSpbuAddLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
      end
    end
  end
  object PanelSJ: TPanel
    Left = 257
    Top = 46
    Width = 32
    Height = 25
    BevelOuter = bvNone
    TabOrder = 11
    object CariSJ: TSpeedButton
      Left = 0
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
      OnClick = CariSJClick
    end
  end
  object Panel3: TPanel
    Left = 206
    Top = 552
    Width = 137
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 12
    object Label3: TLabel
      Left = 9
      Top = 6
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object TotalAdd: TMemo
      Left = 40
      Top = 4
      Width = 81
      Height = 21
      Alignment = taRightJustify
      MaxLength = 25
      TabOrder = 0
      WantReturns = False
      WantTabs = True
    end
  end
  object Panel5: TPanel
    Left = 349
    Top = 552
    Width = 137
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 13
    object Label27: TLabel
      Left = 9
      Top = 6
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object TotalReimburse: TMemo
      Left = 40
      Top = 4
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 25
      ParentFont = False
      TabOrder = 0
      WantReturns = False
      WantTabs = True
    end
  end
  object Panel6: TPanel
    Left = 492
    Top = 552
    Width = 137
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 14
    object Label28: TLabel
      Left = 9
      Top = 6
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object TotalSPBU: TMemo
      Left = 40
      Top = 4
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 25
      ParentFont = False
      TabOrder = 0
      WantReturns = False
      WantTabs = True
    end
  end
  object ListKunciCepat: TMemo
    Left = 510
    Top = 139
    Width = 278
    Height = 53
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'F6 : Otorisasi Revisi Budget [Integrate]'
      'F7 : Otorisasi Revisi Budget')
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
    OnKeyDown = FormKeyDown
  end
  object ppReportUangOrder2: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\WH App\OffLtr.rtm'
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
    Left = 736
    Top = 48
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 114036
      mmPrintPosition = 0
      object ppNoPolisi2: TppLabel
        UserName = 'Label21'
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
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 59002
        mmWidth = 54504
        BandType = 0
      end
      object ppNoOrder2: TppLabel
        UserName = 'Label24'
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
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 52652
        mmWidth = 54504
        BandType = 0
      end
      object ppCopy2: TppLabel
        UserName = 'Label2'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 28575
        mmWidth = 38365
        BandType = 0
      end
      object ppTgl2: TppLabel
        UserName = 'Label26'
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
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 39952
        mmWidth = 54504
        BandType = 0
      end
      object ppNoSJ2: TppLabel
        UserName = 'Label17'
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
        mmHeight = 5292
        mmLeft = 141817
        mmTop = 23283
        mmWidth = 38365
        BandType = 0
      end
      object ppDriver2: TppLabel
        UserName = 'Label32'
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
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 46302
        mmWidth = 54504
        BandType = 0
      end
      object ppBBMFee2: TppLabel
        UserName = 'Label25'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 80433
        mmTop = 74877
        mmWidth = 20902
        BandType = 0
      end
      object ppDriverFee2: TppLabel
        UserName = 'DriverFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 80433
        mmTop = 81227
        mmWidth = 20902
        BandType = 0
      end
      object ppBusboyFee2: TppLabel
        UserName = 'Label3'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 80433
        mmTop = 87577
        mmWidth = 20902
        BandType = 0
      end
      object ppTolParking2: TppLabel
        UserName = 'Label4'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 80433
        mmTop = 93927
        mmWidth = 20902
        BandType = 0
      end
      object ppTotal2: TppLabel
        UserName = 'Label5'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 69850
        mmTop = 106627
        mmWidth = 25135
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 44450
        mmTop = 105834
        mmWidth = 67998
        BandType = 0
      end
      object ppLabelOther2: TppLabel
        UserName = 'LabelOther'
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
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 100277
        mmWidth = 25665
        BandType = 0
      end
      object ppOtherFee2: TppLabel
        UserName = 'OtherFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 80433
        mmTop = 100277
        mmWidth = 20902
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
        mmHeight = 19315
        mmLeft = 4233
        mmTop = 0
        mmWidth = 55298
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
        mmLeft = 131234
        mmTop = 0
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
        mmLeft = 131234
        mmTop = 3440
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
        mmLeft = 131234
        mmTop = 14023
        mmWidth = 65881
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
        mmLeft = 131234
        mmTop = 17463
        mmWidth = 59531
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'LabelOther1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'BBM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 74877
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 74877
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Fee Supir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 81227
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label7'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 81227
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Fee Kenek'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 87577
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label9'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 87577
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tol & Parkir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 93927
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label11'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 93927
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label12'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 100277
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 106627
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label13'
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
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 106627
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tanggal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 39952
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel13: TppLabel
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
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 39952
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Nama'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 46302
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel15: TppLabel
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
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 46302
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel16: TppLabel
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
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 52652
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel17: TppLabel
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
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 59002
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No. Resv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 52652
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No. Polisi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 59002
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'OPERASIONAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 52917
        mmTop = 67733
        mmWidth = 89165
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TANDA TERIMA UANG ORDER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 52917
        mmTop = 31750
        mmWidth = 89165
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppReportUangOrder: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\WH App\OffLtr.rtm'
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
    Left = 736
    Top = 8
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 114036
      mmPrintPosition = 0
      object ppNoPolisi: TppLabel
        UserName = 'Label21'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 59002
        mmWidth = 55298
        BandType = 0
      end
      object ppNoOrder: TppLabel
        UserName = 'Label24'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 52652
        mmWidth = 55298
        BandType = 0
      end
      object ppCopy: TppLabel
        UserName = 'Label2'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 28575
        mmWidth = 38365
        BandType = 0
      end
      object ppTgl: TppLabel
        UserName = 'Label26'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 39952
        mmWidth = 55298
        BandType = 0
      end
      object ppNoSJ: TppLabel
        UserName = 'Label17'
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
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 23283
        mmWidth = 38365
        BandType = 0
      end
      object ppDriver: TppLabel
        UserName = 'Label32'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 46302
        mmWidth = 55298
        BandType = 0
      end
      object ppBBMFee: TppLabel
        UserName = 'Label25'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 74877
        mmWidth = 20902
        BandType = 0
      end
      object ppDriverFee: TppLabel
        UserName = 'DriverFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 81227
        mmWidth = 20902
        BandType = 0
      end
      object ppBusboyFee: TppLabel
        UserName = 'Label3'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 87577
        mmWidth = 20902
        BandType = 0
      end
      object ppTolParking: TppLabel
        UserName = 'Label4'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 93927
        mmWidth = 20902
        BandType = 0
      end
      object ppTotal: TppLabel
        UserName = 'Label5'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 106627
        mmWidth = 27781
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
        mmLeft = 2117
        mmTop = 105834
        mmWidth = 55298
        BandType = 0
      end
      object ppLabelOther: TppLabel
        UserName = 'LabelOther'
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
        mmHeight = 5027
        mmLeft = 0
        mmTop = 100277
        mmWidth = 32015
        BandType = 0
      end
      object ppOtherFee: TppLabel
        UserName = 'OtherFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 100277
        mmWidth = 20902
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList4: TppParameterList
    end
  end
  object ppReportUangOrderAdd: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 152000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\WH App\OffLtr.rtm'
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
    Top = 192
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 114036
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'Label21'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 59002
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label24'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 52652
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label2'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 28575
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label26'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 39952
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label17'
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
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 23283
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label32'
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
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 46302
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label25'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 74877
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'DriverFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 81227
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label3'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 87577
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label4'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 93927
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label5'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 106627
        mmWidth = 27781
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 105834
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'LabelOther'
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
        mmHeight = 5027
        mmLeft = 0
        mmTop = 100277
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'OtherFee'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 31750
        mmTop = 100277
        mmWidth = 20902
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList2: TppParameterList
    end
  end
end
