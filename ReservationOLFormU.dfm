object ReservationOLForm: TReservationOLForm
  Left = 344
  Top = 134
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Pesanan'
  ClientHeight = 383
  ClientWidth = 562
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
  object Keluar: TButton
    Left = 280
    Top = 347
    Width = 75
    Height = 26
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = KeluarClick
  end
  object GroupPemakaian: TGroupBox
    Left = 11
    Top = 11
    Width = 541
    Height = 332
    Caption = '  Data Pemesan  '
    TabOrder = 0
    object Label6: TLabel
      Left = 65
      Top = 44
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label4: TLabel
      Left = 58
      Top = 100
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telepon'
    end
    object Label8: TLabel
      Left = 16
      Top = 169
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Acara Perjalanan'
    end
    object Label11: TLabel
      Left = 63
      Top = 148
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produk'
    end
    object Label18: TLabel
      Left = 22
      Top = 20
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama Pemesan'
    end
    object Label22: TLabel
      Left = 72
      Top = 124
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Email'
    end
    object Label13: TLabel
      Left = 58
      Top = 228
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label2: TLabel
      Left = 24
      Top = 248
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi Standby'
    end
    object Label3: TLabel
      Left = 40
      Top = 307
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Followup By'
    end
    object GroupOrder: TPanel
      Left = 104
      Top = 8
      Width = 433
      Height = 139
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 148
        Top = 93
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Handphone'
      end
      object customer_name: TEdit
        Left = 5
        Top = 8
        Width = 156
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 0
      end
      object customer_phone: TEdit
        Left = 5
        Top = 89
        Width = 132
        Height = 21
        TabStop = False
        Color = 15532031
        ReadOnly = True
        TabOrder = 1
      end
      object customer_hp: TEdit
        Left = 216
        Top = 89
        Width = 217
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 2
      end
      object customer_email: TEdit
        Left = 5
        Top = 113
        Width = 212
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 3
      end
      object transaction_id: TEdit
        Left = 181
        Top = 8
        Width = 124
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 4
        Visible = False
      end
      object status: TEdit
        Left = 325
        Top = 8
        Width = 57
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
      object customer_addr: TMemo
        Left = 5
        Top = 32
        Width = 428
        Height = 54
        Color = 15532031
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
      end
    end
    object Panel1: TPanel
      Left = 108
      Top = 141
      Width = 430
      Height = 186
      BevelOuter = bvNone
      TabOrder = 1
      object Label14: TLabel
        Left = 70
        Top = 87
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 's/d'
      end
      object product: TEdit
        Left = 1
        Top = 3
        Width = 316
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 0
      end
      object Itinerary: TMemo
        Left = 1
        Top = 27
        Width = 428
        Height = 54
        Color = 15532031
        ReadOnly = True
        TabOrder = 1
      end
      object FromDate: TEdit
        Left = 1
        Top = 83
        Width = 68
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 2
      end
      object ToDate: TEdit
        Left = 89
        Top = 83
        Width = 68
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 3
      end
      object PanelJam: TPanel
        Left = 172
        Top = 81
        Width = 185
        Height = 24
        BevelOuter = bvNone
        TabOrder = 4
        object Label20: TLabel
          Left = 2
          Top = 5
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Standby'
        end
        object StandbyTime: TMaskEdit
          Left = 48
          Top = 2
          Width = 41
          Height = 21
          Color = 15532031
          EditMask = '!90:00;1;_'
          MaxLength = 5
          ReadOnly = True
          TabOrder = 0
          Text = '  :  '
        end
      end
      object PickupPoint: TMemo
        Left = 1
        Top = 106
        Width = 428
        Height = 54
        Color = 15532031
        ReadOnly = True
        TabOrder = 5
      end
      object followup: TEdit
        Left = 1
        Top = 162
        Width = 155
        Height = 21
        Color = 15532031
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object Report: TQuickRep
    Left = 1072
    Top = -9
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
  object bMark: TButton
    Left = 176
    Top = 347
    Width = 97
    Height = 26
    Caption = 'Mark Follow Up'
    TabOrder = 3
    OnClick = bMarkClick
  end
end
