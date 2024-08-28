object SJBusServiceForm: TSJBusServiceForm
  Left = 452
  Top = 189
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SJ Service'
  ClientHeight = 280
  ClientWidth = 426
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
    Left = 32
    Top = 64
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label15: TLabel
    Left = 15
    Top = 184
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Telp/HP'
  end
  object Label3: TLabel
    Left = 20
    Top = 136
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pengemudi'
  end
  object Label5: TLabel
    Left = 16
    Top = 112
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan SPB'
  end
  object LabelLokasi: TLabel
    Left = 6
    Top = 208
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lokasi Tujuan'
  end
  object Label16: TLabel
    Left = 35
    Top = 88
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'No PKB'
  end
  object Label4: TLabel
    Left = 55
    Top = 40
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 0
    Width = 393
    Height = 33
    Enabled = False
    TabOrder = 0
    object Label13: TLabel
      Left = 18
      Top = 8
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label1: TLabel
      Left = 220
      Top = 8
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'No SJ'
    end
    object Tanggal: TEdit
      Left = 64
      Top = 8
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object NoSPJ: TEdit
      Left = 256
      Top = 8
      Width = 129
      Height = 21
      TabStop = False
      TabOrder = 1
    end
  end
  object TelpHP: TEdit
    Left = 80
    Top = 184
    Width = 177
    Height = 21
    MaxLength = 30
    TabOrder = 4
    OnKeyPress = TelpHPKeyPress
  end
  object Tujuan: TComboBox
    Left = 80
    Top = 208
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = TujuanChange
    OnKeyPress = TujuanKeyPress
  end
  object TujuanDisp: TEdit
    Left = 152
    Top = 208
    Width = 161
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object GroupPanel: TPanel
    Left = 0
    Top = 232
    Width = 329
    Height = 41
    BevelOuter = bvNone
    TabOrder = 7
    object Label10: TLabel
      Left = 36
      Top = 0
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Catatan'
    end
    object Catatan: TMemo
      Left = 80
      Top = 0
      Width = 233
      Height = 33
      TabOrder = 0
    end
  end
  object Simpan: TButton
    Left = 336
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 336
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 9
    OnClick = BersihkanClick
  end
  object CetakUlang: TButton
    Left = 336
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 10
    OnClick = CetakUlangClick
  end
  object Selesai: TButton
    Left = 336
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 11
    OnClick = SelesaiClick
  end
  object Report: TQuickRep
    Left = 649
    Top = -270
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
  object Pengemudi: TComboBox
    Left = 80
    Top = 160
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 15
  end
  object Cari: TEdit
    Left = 80
    Top = 39
    Width = 177
    Height = 21
    TabOrder = 13
  end
  object Panel1: TPanel
    Left = 80
    Top = 64
    Width = 185
    Height = 49
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    object NoPKB: TEdit
      Left = 0
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object NoPolisi: TEdit
      Left = 80
      Top = 0
      Width = 97
      Height = 21
      TabStop = False
      TabOrder = 1
    end
  end
  object GroupTujuan: TPanel
    Left = 80
    Top = 112
    Width = 257
    Height = 17
    BevelOuter = bvNone
    TabOrder = 3
    object Service: TRadioButton
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Service'
      TabOrder = 0
      OnClick = ServiceClick
      OnKeyPress = ServiceKeyPress
    end
    object KEUR: TRadioButton
      Left = 72
      Top = 0
      Width = 57
      Height = 17
      Caption = 'KEUR'
      TabOrder = 1
      OnClick = KEURClick
      OnKeyPress = KEURKeyPress
    end
    object BBM: TRadioButton
      Left = 144
      Top = 0
      Width = 89
      Height = 17
      Caption = 'Pengisian BBM'
      TabOrder = 2
      OnClick = BBMClick
      OnKeyPress = KEURKeyPress
    end
  end
  object NoBody: TComboBox
    Left = 80
    Top = 64
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = NoBodyChange
    OnKeyPress = NoBodyKeyPress
  end
  object GroupDriver: TPanel
    Left = 80
    Top = 136
    Width = 177
    Height = 17
    BevelOuter = bvNone
    TabOrder = 14
    object DriverCheck: TRadioButton
      Left = 0
      Top = 0
      Width = 73
      Height = 17
      Caption = 'Driver'
      TabOrder = 0
      OnClick = DriverCheckClick
    end
    object NonDriverCheck: TRadioButton
      Left = 72
      Top = 0
      Width = 81
      Height = 17
      Caption = 'Non Driver'
      TabOrder = 1
      OnClick = NonDriverCheckClick
    end
  end
end
