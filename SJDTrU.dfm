object SJDTr: TSJDTr
  Left = 241
  Top = 18
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SJ DayTrans'
  ClientHeight = 524
  ClientWidth = 595
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
    Top = 88
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label3: TLabel
    Left = 45
    Top = 112
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Driver'
  end
  object Label4: TLabel
    Left = 34
    Top = 184
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Petugas'
  end
  object Label5: TLabel
    Left = 52
    Top = 208
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Shift'
  end
  object Label10: TLabel
    Left = 36
    Top = 288
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Catatan'
  end
  object Label9: TLabel
    Left = 34
    Top = 252
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Odo'
  end
  object Label15: TLabel
    Left = 15
    Top = 136
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Telp/HP'
  end
  object Label12: TLabel
    Left = 24
    Top = 68
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari Driver'
  end
  object Label6: TLabel
    Left = 40
    Top = 160
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan'
  end
  object NoBody: TComboBox
    Left = 80
    Top = 88
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnKeyPress = NoBodyKeyPress
  end
  object Shift: TPanel
    Left = 80
    Top = 208
    Width = 137
    Height = 17
    BevelOuter = bvNone
    TabOrder = 10
    object Pagi: TRadioButton
      Left = 8
      Top = 0
      Width = 49
      Height = 17
      Caption = 'Pagi'
      TabOrder = 0
    end
    object Malam: TRadioButton
      Left = 72
      Top = 0
      Width = 49
      Height = 17
      Caption = 'Malam'
      TabOrder = 1
    end
  end
  object GroupDetail: TGroupBox
    Left = 80
    Top = 232
    Width = 81
    Height = 49
    Caption = 'Detail'
    Enabled = False
    TabOrder = 11
    object KMOrdo: TEdit
      Left = 8
      Top = 16
      Width = 65
      Height = 21
      TabOrder = 0
      OnEnter = KMOrdoEnter
      OnExit = KMOrdoExit
      OnKeyPress = KMOrdoKeyPress
    end
  end
  object Catatan: TMemo
    Left = 80
    Top = 288
    Width = 233
    Height = 33
    TabOrder = 12
  end
  object Driver: TComboBox
    Left = 80
    Top = 112
    Width = 97
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
    TabStop = False
    OnChange = DriverChange
  end
  object DriverDisp: TEdit
    Left = 176
    Top = 112
    Width = 169
    Height = 21
    TabOrder = 6
    OnKeyPress = DriverDispKeyPress
  end
  object Simpan: TButton
    Left = 336
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 13
    OnClick = SimpanClick
  end
  object Keluar: TButton
    Left = 336
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 14
    OnClick = KeluarClick
  end
  object Bersihkan: TButton
    Left = 336
    Top = 232
    Width = 75
    Height = 25
    Caption = '&Bersihkan'
    TabOrder = 15
    OnClick = BersihkanClick
  end
  object GroupMitra: TGroupBox
    Left = 16
    Top = 328
    Width = 393
    Height = 193
    Caption = 'Mitra'
    TabOrder = 16
    object Label16: TLabel
      Left = 240
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Armada Sisa'
    end
    object GridDriver: TStringGrid
      Left = 8
      Top = 32
      Width = 377
      Height = 153
      ColCount = 4
      DefaultRowHeight = 19
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnSelectCell = GridDriverSelectCell
      ColWidths = (
        74
        110
        86
        80)
    end
    object Panel1: TPanel
      Left = 304
      Top = 8
      Width = 73
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Sisa: TEdit
        Left = 8
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 0
      end
    end
  end
  object NoPolisi: TEdit
    Left = 160
    Top = 88
    Width = 97
    Height = 21
    TabOrder = 4
    OnKeyPress = NoPolisiKeyPress
  end
  object Petugas: TEdit
    Left = 80
    Top = 184
    Width = 97
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 9
  end
  object CetakUlang: TButton
    Left = 336
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 17
  end
  object TelpHP: TEdit
    Left = 80
    Top = 136
    Width = 193
    Height = 21
    MaxLength = 30
    TabOrder = 7
    OnKeyPress = TelpHPKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 0
    Width = 265
    Height = 57
    Enabled = False
    TabOrder = 0
    object Label14: TLabel
      Left = 174
      Top = 8
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Label13: TLabel
      Left = 18
      Top = 8
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label1: TLabel
      Left = 21
      Top = 32
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'No SPJ'
    end
    object Tanggal: TEdit
      Left = 64
      Top = 8
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object Jam: TEdit
      Left = 208
      Top = 8
      Width = 49
      Height = 21
      TabStop = False
      TabOrder = 1
    end
  end
  object Cari: TEdit
    Left = 80
    Top = 64
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    OnChange = CariChange
    OnKeyPress = CariKeyPress
  end
  object NoSJ: TEdit
    Left = 80
    Top = 32
    Width = 97
    Height = 21
    TabStop = False
    TabOrder = 1
    OnKeyPress = NoSJKeyPress
  end
  object Tujuan: TComboBox
    Left = 80
    Top = 160
    Width = 97
    Height = 21
    Style = csSimple
    ItemHeight = 13
    TabOrder = 8
    OnKeyPress = TujuanKeyPress
  end
  object Report: TQuickRep
    Left = 731
    Top = -9
    Width = 794
    Height = 567
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
      127.000000000000000000
      1500.000000000000000000
      100.000000000000000000
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
    object QRBand1: TQRBand
      Left = 48
      Top = 38
      Width = 698
      Height = 211
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
        558.270833333333400000
        1846.791666666667000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 0
        Top = 0
        Width = 294
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          0.000000000000000000
          777.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SURAT PERINTAH JALAN'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel2: TQRLabel
        Left = 384
        Top = 96
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          254.000000000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No SJ'
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
      object QRLabel4: TQRLabel
        Left = 0
        Top = 128
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          338.666666666666700000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pengemudi'
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
      object QRLabel7: TQRLabel
        Left = 448
        Top = 96
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          254.000000000000000000
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
      object QRLabel8: TQRLabel
        Left = 448
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          211.666666666666700000
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
      object QRLabel9: TQRLabel
        Left = 80
        Top = 128
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          338.666666666666700000
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
      object QRLabel10: TQRLabel
        Left = 448
        Top = 112
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          296.333333333333400000
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
      object QRLabel11: TQRLabel
        Left = 80
        Top = 112
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          296.333333333333400000
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
        Left = 560
        Top = 80
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          211.666666666666700000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Jam'
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
      object QNoSJ: TQRLabel
        Left = 456
        Top = 96
        Width = 137
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          254.000000000000000000
          362.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoSJ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoDriver: TQRLabel
        Left = 88
        Top = 128
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          338.666666666666700000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoDriver'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNama: TQRLabel
        Left = 168
        Top = 128
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          338.666666666666700000
          510.645833333333300000)
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
      object QNoBody: TQRLabel
        Left = 88
        Top = 112
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          296.333333333333400000
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
      object QNoPolisi: TQRLabel
        Left = 248
        Top = 112
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          296.333333333333400000
          214.312500000000000000)
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
      object QRLabel5: TQRLabel
        Left = 0
        Top = 112
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          296.333333333333400000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Body'
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
      object QRLabel34: TQRLabel
        Left = 0
        Top = 40
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          105.833333333333300000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pool'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QLocation: TQRLabel
        Left = 24
        Top = 40
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          105.833333333333300000
          510.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLocation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QAddress: TQRLabel
        Left = 0
        Top = 56
        Width = 377
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          148.166666666666700000
          997.479166666666900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QAddress'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel38: TQRLabel
        Left = 384
        Top = 112
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          296.333333333333400000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telp/HP'
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
      object QTelpHP: TQRLabel
        Left = 456
        Top = 112
        Width = 233
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          296.333333333333400000
          616.479166666666800000)
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
      object QRLabel3: TQRLabel
        Left = 384
        Top = 80
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          211.666666666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tanggal'
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
      object QTanggal: TQRLabel
        Left = 456
        Top = 80
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          211.666666666666700000
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
      object QRLabel13: TQRLabel
        Left = 592
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          211.666666666666700000
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
      object QJam: TQRLabel
        Left = 600
        Top = 80
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          211.666666666666700000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QJam'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 176
        Top = 80
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          211.666666666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tujuan'
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
      object QRLabel22: TQRLabel
        Left = 240
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          211.666666666666700000
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
      object QTujuan: TQRLabel
        Left = 248
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
          656.166666666666800000
          211.666666666666700000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTujuan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 0
        Top = 24
        Width = 267
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          63.500000000000000000
          706.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Operasional DayTrans : 021-70291371 / 022-61116868'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QImageExecutive: TQRImage
        Left = 448
        Top = -32
        Width = 257
        Height = 113
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          298.979166666666700000
          1185.333333333333000000
          -84.666666666666680000
          679.979166666666800000)
        Picture.Data = {
          0A544A504547496D616765F2320000FFD8FFE100B045786966000049492A0008
          0000000500120103000100000001000000310102001C0000004A000000320102
          00140000006600000013020300010000000100000069870400010000007A0000
          00000000004143442053797374656D73204469676974616C20496D6167696E67
          00323031333A30333A31392031363A32313A3134000300909202000400000036
          34300002A00400010000000101000003A00400010000006D0000000000000000
          000000FFC0001108006D010103012100021101031101FFDB0084000201010101
          010201010102020202030503030202030604040305070607070706070608090B
          0908080A0806070A0D0A0A0B0C0C0D0C07090E0F0E0C0F0B0C0C0C0103030304
          030408040408120C0A0C12121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212FFC400C0
          00010002020203010000000000000000000007090608050A0102040310000103
          03030301050407020A0A03000001020304000506070811091221130A22314151
          14326171151623425281A1627317253382919293A2B1C21819354353637283A3
          C3A4C1C401010002030101010000000000000000000005060407080302011100
          0102040403040607070305010000000102030004051106122131074151132261
          71148191A1B1C115324252D1E1F00823627282A2C2162492436393B2F1D2FFDA
          000C03010002110311003F00BFCA5210A5210A5210A5210A5210A5210A5210AF
          0569F91E7F2A42303D54DD26DC343D0B3ABDAEB89636B47FDC5E2EACB0E9FC9B
          2AEE3FC857CDA27BB9DB26E36548B7E876BA63193CA888F51E85699E871F691C
          F1DE5AF0B09E7C7771C562FA6CB76DD86719BA5F589E185EB469E6AC2557D80D
          D794E5F3BDB6F1DBC6246A565440C29484294842948429484294842948429484
          2948429484294842948429484294840900726B55F759D63763DB4EBD4FC2B26D
          419191E4D6E529B7F1DC498FB5BACB83F71C7494B28503E0A4AFB879E45614FD
          418A735DABE74F79F28B3E13C2154C673E242968B9DC93A2523AA8FC85C9E423
          42F5EBDA53D78C99D7ED9B79D16B0E2F1147B5171BFB8BB94CE3F88207A6D24F
          E042C7E75A75ACBD4637C1AFAEBBFE13773395CA8EF12556E8130C18841F97A0
          C7637C7E60D6BBA96239A9E250D9C89E837F598ECAC15C17A0E164A6626D2261
          FF00BCA1DD07F853B0F3373E51966DBFA4B6FCB7551E2E4D88E8F4AB5596E090
          FB792E5CE7D8233A85794B89EF05D75241E429B4281AB14D8E7407776CBABF8C
          6BEE75B9FB84BBE63B2D13136CC5A198B1D647DE696FAD456E34B04A543B11DC
          9247CEB368B871F75699A7CE500823A9FC3E3157E26719A934F61FA1D2901F5A
          92A428FD84DC1047F19F01A0EBCA2C8123B5213CFC2BCD6C48E3685290852908
          52908529085707A89A97A7BA47894BCF353F34B663F66829EE7EE7779298EC37
          F4056A20727E43E24FC01AF95AD2DA4AD66C047B4B4B3D38F265E5D254B51000
          1A924EC00EA6342B5E7DA39DA869DE41FA0346B4FB21CF90D39D8F5D5B58B644
          29E7825A2E254E2FF9A120FD6B72F6A3B9AD3DDDFE8458B5FF004C9131AB5DF1
          B5F116E08EC7E33ADAD4DBAD2C0F04A56850E41208E08F06A1A9F5D62A532B97
          681D05C1EB1B2B17F0AAAD82E8AC55EA0B4DDC5655206E824122E763A037B680
          F337BC48D4A9B8D5F0A5210A5210A5210A5210A5210A5211F3DD61B971B6BF01
          A94E30A79B5203CD1E14D9208EE1F88E791F9575E3D54E8EFD4130DD7497A456
          AD0CBDE525C7D462E556B6F9B6CE6C9F0EAA4AC84344F3CA92E28281E7E3F135
          3C534F989D4B4A6137B122DE76D7DD1D07C06C6147C30F4F355674361694A828
          EDDCCD74F99CD7006F63CED1B61B59F66C6F32C46C9777FABE886D9216AC630B
          21C748E79ED726389ED49F910842BF05556BE6989D96FBAF576C1F4B202DAB74
          CBF3D06D1156E17548695254DB092A3E547B4A4727C9AAC5528BF45B2D059BAD
          44DFA0DB4F7C6F2C09C4BFF5CD4E7CCBA324B3094E5BFD651255DE3D344E8397
          32797685C0B12B6E07855A309B42388B6784CC067F0434DA5B4FF44D72F5B452
          90948488E0F7DD53EEA9D56E493ED852BEA3CA142401C9348478041F15E69085
          780411C8A423D17263B6E25A5BC90A5FDD493C157E43E75FA020FC291FA4111C
          36A1E778C697E0979D47CD6E688568B0C27AE1365AFE0CB2D20AD6AE3E7C2527
          C7CEA8235EF5D7783D6A37548C2F4DF1D9B2ADEC2DC76C98836F86E1D9622480
          A90FAC908F508527BDD5792A504A7C76A6AA78A1F75696E418DDC3FAF7FC23A0
          78134A9196767316550D9B954E84F2241B91E2122C073CDA6B1B71A0BECCE632
          DDA625CF72DB849EF4E594AE45A30B8E86DA6BE1CA04978294BFCC349FFF0075
          653A13A17A65B6DD2AB3E8BE8FE368B563F6468B51A2256A5AB9528AD6B52D5E
          54B52D4A52947E249ACDA2D09BA55DC26EB22C7A0F28ACF1338AB358F72C9B6D
          86E590ACC91BA946C402A3B6C4E834173A9D0C65F4A9F8D470A817783D4876BF
          B1DC8F18C575D322B83337285A8B2D5AE2FDA4C4612A0954978020A5A0A3C78E
          E51215DA93DA78C59C9B6A4592FBC741F389CC398767B1554514BA7241714091
          7361DD049B9F569E36882F713ED066C9347E5BD62D32FD33A8B7168F695D81B1
          1E0255F4325EE3BBF36D0B1F8D6B4DFF00DA72D4991354AC636A3628B1F9F751
          3EF6F3EB23F1296903FA555E7B1734D2CA25919BC4E83D51BDF0BFECEF3B3F2C
          999AE4C7624EC8480A50FE624D81F017F137D232ED25F69B71599726A0EB86D8
          275BE2A9402EE38BDD5329491F33E83A8473FED2AC336C7BBADBEEF030739F68
          16A244BDC568844A8A396A540591C843CC2B85A0F83C12383C1E09A91A3E206A
          A6AEC9432AFA75F2FC229DC45E104FE0664541973B697BD8AAD629276CC35D0E
          C140DAFA102E2F2552AC31A7614A4214A4215E0A527C91484709A9B912710D3B
          BEE56A5F68B65BA4CB2AFA7A6D2D7FF2D75C9E991A7E755BA83693E312D1EB85
          6471EE0F255FBE98C4CA5F3FC99354EC4C3B49B956FA9F894C749703D7E8787A
          BF39F75B07FE2874C76506FEE03F5F35EC4803CD5C639B603C8F15E0A80F8FF4
          A42008239F97E355BBD68BABC64BB68BA276C3B5EC8988F99B8D076F99025097
          55656D69E50C36140A4485A48595107B1253C0EE572988AE4F9A749A9D47D63A
          0F33F80D636270B709A318E246646605DA4DD6BFE54F2FEA51093E06350FA45F
          51FDC9631BDEC6707D52D66C9329C7B502726D13A16457176606DF78F6B0FB65
          C27B161D2807B78050A5023E1C5EF24929048E0D606169C726A5141D55CA4EE7
          A1D7F18B6F1EB0EC95071034BA7B61B43AD839520019924A4D80D06813EBB9E7
          1AC5D61F5B739D02E9F79D671A6B903F6ABDBC98B6E8D718AB287A389125B69C
          52143CA57E9A97C287904F23C815A03B1DEB61A75B47D85BFA717CB5E4794EA5
          469F357022DC14A5C35075416DB8EC852CA836924F2848EE241E38EEEE1E155A
          B7D1D520A5DC808D07893F944AE00E1F9C678254D4B04A5C54D0CCA3B86D2817
          B69B8CE481CCC6B463FB6DEA55BFA4641BBCB3E2194E56961C7653B90BD2C305
          E5249529B8685A925CECE080860109ED091E7815BF9D037A8E6A86BACABC6D37
          5E729937CB9D8EDFFA4AC97CB9385729D8C85A5B763BAE1F2E141710A4295CAB
          82B049094F10F44766E5679B71FBE57AFBF3F1F6FB8C6C7E27D3F0ED7F0BCDC9
          D2729769D97448FA83629BDB5196F7B13DE4EBA88D97EB34DE52EF4D4D534E20
          9599220C753C1BE7BBECC26305FF00E5E97773F87355B7ECF86E8B40F6FDAEB9
          8621AD39142B14DCCE1C48D69BE5CD61A8E85B4E38A5C753A7C20B9EA2082A21
          24B4013C94F32B557912F5C9771DD136F8E61F8450B01531FAC70B2AF27202EF
          172F61B9090D2AC3ADC0500399D22F0597D990D25E61C4AD0B0149524F2140FC
          083F4AF7AB84738116D0C2948FC8E0754B398BA63A6B90EA44F88B7D8C7ED926
          E6EB0D9F79C432D29D291F8908E3F9D7596DD26E97597783AB52B58B5BF26371
          BA3C8F423B2DA036C408E16A5A23B481F75B49715C7C4924924924D52718CCAD
          286E5C6C6E4FAB68E9FF00D9BA8B2EF4C4E55DC175A32A13E19AE55EDB01EDEB
          1B1FB26E875BA3DDEE256DD55BEDE6D783E1F766D2FC3B9DD7BA44B9AD2BEEBA
          D4541FBA7CF05C5A391E4723CD6F1E9E7B363B3FB0C349D43D55CEF2196070A5
          C57E3C0609FA8406D6A1FEB9AC7A56150FB61F9B5117D401F33F2899C7DC7B5D
          2A75CA661E692A28252A5AEE45C68425208BD8FDA275E42DA9FCB57BD9B6DA86
          458EBE347B53F31C6AF0107D076E4F35718855C78EF6FB10BE3FF4AC7E46AB53
          1CC8F739D2277B0F455BA226438AC94B33A132EA8C1BEC25F6AFB09E3DF65D6C
          852491DC93C1E12B478F0ABD2450DC6E72549B5F9F23BFB0C49F0EB882AE29CA
          4E61BAF3690E2907548B0524F74E849B292482083AEF616D7B11E92EA5637AC9
          A618FEAC61D214EDAB24B747B9C45AFC28B4F3697120FD1402B823EA0D6455B0
          9B58710163631C79372CB937D72EE7D64920F983630A57DC63C2948429484449
          BF6C9C61DB27D5AC8C2B8546C42E85079E3DF5457129FEAA154EBECF460A72CE
          A16C642582A18C63D3EE017C7210A586E30FE924D546B233D5E513EBF7FE51D0
          FC3557A370F2BF31D414FB5047F945F281C0E0568CFB403ADDAB3A27B29B748D
          27CCA6D89EC83248F6B9D3ED9214C48318C790EA9B4AD3C29214A69015C10480
          47C09A9CAC38B6641D5A0D8DA35770E24A5EA38AE425A6921482E0B83A836D6C
          473171A88C53601D48F0DD08E93D63D71DD3EA349B9CCB4CD9D6682C38F7AF73
          BBA9A77B998E80A3CAD4943891DCA3C25012547EBA61A95BF9EA75D56F529ED3
          0DBC5AAF76AB3A57DE9C630679719B8ED13C2573677292A1E3C95A90DF23C201
          AAACED5A61D95624654DDC5A45C8DF6F9EE7C237D618E1FD1E4ABB55C535D484
          CA4BBAE06D2A1DDD146E6D6D426E1281ADD5A6E0458AD8336D47E94DD2A137AD
          C766D1F26CC31A88F3715264B9211226497D6A8B17D55F0B71282E00A3F2436B
          E3C24556C74BAD81649D4F75FF0025D63DC15F6EAF6276F94A997CBB34E7648B
          CCF7945C11D2E71EEF3C95ACA47294F681C15A48F5A8CBAE6E665296E1BD802A
          F66BF03ED8C3C1B5796C3F46AFE3A936C27B471496811B5D5748B0E575A6E07D
          D3D2259C87679B41DB575B6D1FD14D13C8AF0B86CCD8F73B9DA253E9902D5352
          85BF1594BCAF794165B696A4AB920383851EEE1372ED9E5B079F88E6A5E832EC
          CB1986D9D82EDEC03E778D77C59ABD46B68A4CE54C00E2E5C28DB4BE65AB5B72
          BA424DB95E3443DA26C8D364E9FA8B69700377C9E045EDE7CABB50FBDFFD42AB
          3FA456C219DF56E5936CCCE3BBFA8F89B68B95F94DA8A4C9055C331028794975
          49572479086DC2083C540D6A5BD3AB6DCBF2205FCB527DD1B6786759385B85F3
          9564FD64A9C29FE621294FF75A3B0963B8C63F8863D0F16C56C912DD6EB7B298
          F160C16834CC76D0384A1084F0129000000AA51BFDAA2F4EFEBD705CB2B2A878
          DDE72069D6DA4F86C41BB23B1C481FC0D38FAC01FF00923E95358812194CBBE9
          FB0B1ECFD08D65C1F7D75176AF4A7557F4896737E6A1B1F3EF13175D9163761C
          CB1B9D89655698F70B6DCE3B9125C2948EF6A434B4942D0A49F8A5492411F435
          4D5D573A22631B62D37BB6E7F6D194BEAC5AD4A6D773C52F2EFA8F406DC712D8
          5B0F9F2E202D69050BF78024F72BE15F58929899E962F0D14804F98E63F08F1E
          0B6387B0BD7114D58BB132A4A48E6144D92A1EB365751AEE04733ECE56E6B5D6
          F3AE57EDB5DF331B95D70B631E76E71ADF39D53C8B53CD3EC369F48AB9F4D0A4
          BCA0503C121278E455C5D7DE19796F53D25C37B123D518BC6FA64A533183C994
          48485A52B206D988D74F1B5CF892614A9F8D471F94D891A7C47214C8E875A792
          50B69D48525692382083E0820FC2BAC4EF431EC171DDE0EA561BA518DB56DB0D
          B7279F6FB75B6215290D36D485B694A7B893C729F039F9F154CC6494965A36D6
          E7E11D2FFB363AF0A8CFB615DCC892472B851B1F5027DB1D9336FF00A7ACE92E
          8661DA5CC3296D18E59215B025238FF22C21B3FD526B2FAB7B48ECD0947411CE
          73F3066E69D983F6944FB4DE1547FED2546B1C7DEEE2F22004096F61D1952823
          E278972C209FC7B47FA00AAFE2AB7D1C6FD446DEE01950C64809DB22EFE56FC6
          D1693D31F1BBA625D3FB48AD37A2A0FF00EABC390439E0A52EA3D5483F925C48
          FE5588EEEFAC1ECBF66F97AF4E73ACA6E57EC923A8265D8B128E994F40E403FB
          65A9686D0AE0F3D9DC57F0E40E41ACE54F334B906DC983C80F126D158670B547
          1CE2B9B92A4A4125C71449364A539CEA4D8E9A81A02493139E816BCE98EE6349
          ECFAD3A4190A6E561BDB45C61FED285A141452B6D683E52B42D252A49F811F31
          C1ACC8900726A49A752F369711B1171EB8A4D4245FA64DBB25322CB6D452A1D0
          8363EF8859AEA13B4391B9B4ECFE2EB046773E2E2A39B43519F53697D282B530
          64047A41D0949F77BB9E471F7BC54D20823907C579CBCD33359BB137CA6C7CC4
          665628151A0F622A0DE4ED501C4EA354AAF63A6DB6C751CC444BBCCDE668F6C7
          3471FD62D6095256C17931215AADC12A977290A04869B4A881E1295294490025
          24FC7807E8D9CEECB4F77A9A116BD79D36B7DC2141B838EB0E40BA25297E2BCD
          2CA1685769293F22083E4287C0F22BC84FB4673D087D6B5FF2F389056129E461
          C189956EC4B9D981AE626C4E6DAD974B6F7BF288FBABEDD9765E9BBAB3350AE0
          AED098FCFF007B2596CFF455687FB321867DBB52F55F50D4CF1F60B6C0B725CF
          EF9E75C50FFF001935053E33D7A5D3FC27FCA36AE145FA3F09EB0EF57523DA5A
          1F38B83AADCF6982E41BDA7E0B680AE0BF970778E7E2110A40FF00EC15275E36
          A6BBE5F38A3709939B1A53C7F1FF00898A9DDAFEDEF54B77BACF8E6DDB4D54A7
          265D1F5762E4AD5F66B7B5C773D217FC284A53C9E3CAB8481C9205762BD99ECE
          748F649A2B034774A6DA0A5B01EB85E1E40126ED2481DCFBA47CCFC129E78424
          048F8726B98424B315CE2F9683E7F211BA7F68AC4E5944BE1B9736CDFBC5DBCC
          848F59CCA3E21262B93DA63D7796FE47A77B6AB7CDED8F1E3BD92CF602B90E2D
          6A5478E48FECA5B91FED2A71BAEE2B443A2D74E6C4B4C614DB6DDB5127DA84B8
          B6061C0A5CFB8484FA8ECA7BB4F223A14AED0A3C1525A4213F51906690C5466E
          757F61200F33F98886450666AD8330FE199606F34E2DC591C92926E4F92540F8
          9022A8B4F75935A747375988EF5759F12C82E125DC85BC8DD997361C8BFA6F87
          438F7A4EA91DA7B9248053CA4723C7157D9B52EA37B46DE063D1676946AC5BDA
          BABC81EAE2B7979116E9195F3496147DFE3F89B2A49FAD63E179F4B2B725A60D
          94A3717E7FADFC625B8EF849FA84B4AD6A8E90E30CA4B6A08D7280743A5F41A8
          3F74EFE1A79ED35655F65D06D34C24AC8FD2390499C13F5F423767FF00D352D7
          40DDB80D13D8BC0CFAED07D2BBEA24B5DF1D52C70B1187ECA2A7F149420B83FB
          F3520D37DAE21717F753F103F18A94FCE7A0707A565C1D5F788F5254B3F1488D
          DEAADDEB9BD3C35E77179AE07B89DB0E18EDF722B3A3F44CF810DC6DB7D2D877
          D68CFA4AD490528716EA55E791DE83F004893AE4A393924A6DA1756847A8C51B
          859882530DE2862727D5959214951D740A491CAFA5ED78DECCFF005CF4D34234
          F19CEB703A8362C51843095487AE9310D20BBDA0AD0DF3E5C3DDC8012093F215
          515D4CFA9366FD4D72EB6ECC364585DEEEF8DC998875D5B31D4895913C83CA3F
          667CB519B3EFF2E71C9014AEC081581886A01B63D09AD5C5E961D0FE3B45B383
          B83D53955FF52CF7724E56EBCEAD01527516FE5FAC4F2B01B98B00E94DD38EC3
          B05D132DE42234ECFF00254A1FBF5D593DC86B8E4A2232AFFC26FB8F27F7D654
          AF87684ED5D4CD3A5048CAA25C721AF9F3F7C6B7C6988578AABD335656CB5774
          7448D123D4902FE30A566C55E3D5CFBA3F31FF001AEB51A418F9DC1751BB0D91
          480EB7956A036B7F9F20B6EDC3BDC3FEA151AA7E2A19D72CDF551F94746F009C
          F4596ACCDFDC6D27DCE1F9476576F8ECE41F8F26BDAAE11CE51E8F3A865A53AE
          2C2401C9528F007E35D7A779F9E5C7A96F5489564D33946540BFDEE3631647D9
          F7902234A0CFAE3FB07875FE7E4951AAA62B56765A964EEB57EBE2237FF0025C
          4BD4A7EB6E8EE30C9BF9937F821516C7D4FF007B160E9CBB488D6DD3A530DE55
          76605931680BE142386DB4A5524A4F828611D840E382B5360F826A8C2C3B72DD
          1EB66197EDC163DA499764B658AFBAFDD328621BB25B2E93DEEAD6EF04AD43BB
          B96473C73CAB8A88C4EB726E69326C02720BD87EBA5A361F0365E4E81417B115
          51C08332E650A51B0201B0009E65655EC079696D3ECD4CCCA5DDA46650EE41E3
          6A672B5984A779EDEE54463D509FC3908278F9935617976450310C5EE395DD56
          5316D919D96F287C90DA0AD5FD126AD5435114C694AE91A0F8A4CA5CC6F3CDB3
          CDC1ED205FDF78A37E89184641B9BEA7EFEBB65254F2AC48B8E5539D59F0E499
          0A534804FD7D494563FBB357A570B840B3DB9EB95CE6B31A3466D4E392242C21
          B69091C952947C00002493F002B070A8B48A9D57DA513F08B5F1EDD4AF143522
          CECD348401EB51F8111D7A7AABEF7EFBD40375AA8981BD265E216078DA318B73
          409FB5952C25727B7E3DEFAC278F008425A1F106AF13639B6BB5ED236B186E83
          C04366459A024DC1F6CF21F9AE1F5242F9F982EAD5C7D12123E558787D7E9D51
          989D3E43C89D3DC0458F8BD2C30AE0DA3E184E8755ABF9923BDED538A887BAE8
          5E4DA3A63EA2210AE153176D8FF9F3708E4FF449A827D99AC5044DB96A266FE9
          106E392B50BBBF8831150BFF008C93596F8CD881AF047FFA8AF5295D8F0867BF
          8E640F7347E516615545ED3BE661AB3691E9F32E1E5F7EE771753F4EC4C76907
          FDF5D65E23565A63BEAF888AF70599EDF1C488E99CFB1B5C72DECD9ED69AB169
          F659BB7C86DDC4BBF3C6C36871C1E53159295C85A4FCC2DEEC47E71CFD6AD1FE
          55F58798EC29CD8EBAFB7F28F2E30D4FE94C673AB07441081FD0003FDD78A0EF
          681675D66F518BBC69ED2C3312C96D6A2A95F0536592B247E1DEB73F98359674
          38E9E537745AC3FF00499D71C65C9F82E22A021357549719BD4F4F010DF0AFBE
          D32005287DDEE0DA3C8EE029A89533B5D536A1A6624F903FA1EB8E9398AF230C
          70A989D695670B08420F3CCB481A788D55FD31721AF1B79D20DCB698CED20D69
          C2E2DEEC53D3EF4691C8532B1F75C6963DE6DC4F3E149208FCB915539BA9F671
          75A713C8D77BDA367B0726B2BAE72DD9F2490985708639F03D6E3D2740FE2FD9
          9FEC9F8D59EBF43FA4921E67458F78FD6D1A2F849C531829C5D3AA7754AACDF4
          D4A15D40E60FDA1EB1CC1DD5D36E9A369D7DD91698687750FB28BEE5181A5E4B
          736D37777BDA6CB8A4B6D97D3C1582C2594A879F2D8E0F8E6B6D317C66C38563
          76FC3F15B5B506D96A8CDC3890A38E1B8ECB680842123E41294803F2A9591924
          CB80EAC7EF0A52147C85A2898AB143B585AA425D5FED1B75D5B49B004071655A
          FC872B98FBEBC1015E1439FCEA4229D1A81BD5E8E1A23BE4D7887ADFA9BAB19A
          415330DA82ED9ED6FB2582DB6491E9171B516BBBB8F771C827CF8249A9A76B5B
          24DB46CDB1B731ED02D3287685C9484CBBAB84BF3A771E7F6B217CAD439F3DA0
          848F924544B14797626D73BA951EBCBCA360D5789157A9E1E97C3432B6C36003
          96E0AEDB6637F5902C09D4F2B4AF4A968D7D0A5211C36A1DF7F56303BD649DDD
          BFA3E04893CFD3B1A52BFE5AA03E88585AB39EA61814A9A92E376913AEAE93E7
          CB711EED27FF007168AA9D7C679F9347F17CD31D07C2357A3612C4731CFB2B7F
          63BF8C761448ED484FD05090072A3C0AB6473E456875CCEA976DD2DC4AE5B33D
          05C883995DE592C6457686BFFB1E2AD3EF464A87C1F7527857F0364FEF2C76C7
          FECEF6C42E0ABA4CDF4EA3D9CB6C34876DB8AB4FA782EA95CA244C1FD903B994
          9F9953DFC20D5296E7D2B5E4A13AA5AF88FCEC3D51D3D2B29FE82E143D30EE8F
          CF580EB957A01FF8C295E6AB4417BDDC9339EAA9D5893A17A7B7626D30EE4717
          B53FC15B5122C6528CB99C0F0A05497DDE7E2529427E42AC537EFB91D2CE939B
          11B7695E8BA59837D7601B1E256CE41750BEDE1D9CBF1E7D3EF2E29447BCEAD2
          0FDE3C7CC8BE1B13955575207CBFC63D314D29538AC37809A1A654B8E0F31DE3
          EA01D3EB8C0BD9BACC5EBEECBB26C726485ADCB565F23B7D4512421D8B197FD5
          4167F3E6B7437516BBA5EF6CBA8965B136573A663173623A53F12E2A23A123FD
          2454ED24972948B7DDFC635563F6D32B8FE6B36DDB03EDB1F9C52C7435DF06DF
          3663AB19B39B86C81EB35BF25B647446BCA223B250D38C38A516D49692A58EF0
          E782071CA383C722A46DF87550D72EA3ABBE6D9364983DD20E0F1A0499D7CBBB
          DC352EE50A3A14E3AB755CF6C68BDA9F2927B9CF7524FBDE99A94B5582294990
          97D5C5123C813BFEBCE3A1AB5C3D54CE3D7715D5C84C9B4942C6B7CCA4A4009B
          6FA1173A77B448BDCDA0FE87FB7246E037F78E5CAED03D7B460CDAF259616394
          95B25298E39F873F6871A571F30855760D48ED48153B8459C924A73EF28FBADF
          9C6A8FDA22A3E9589DA9449D1A6D3ED51513EECB1A55D7F51315D38321547492
          DA6ED6C2F11F247DA07FCDDB5C6FB3CD8E0B1F4F28D724A38178C8AE3339FE2E
          D2D31CFF00F057B94DEBE0FF00DBF9C45A1C08E12A9239CDDBFB01F946F4553C
          7B491856A1653B8CD2B8D8F62B70B83170B2C88705B82C2DE549942492B69094
          824AFB54C9E00E7DE15E98992A5D39612398F888C3E07BCCCBE33616FA82404B
          9A9D07D451DFCAF1673B32D0C8DB6CDACE09A22CC54B4EE3F676189413F054A5
          27D490BFF39E5B87F9D49D5332EDF62CA1BE800F608D6B599D353A8CC4E9FF00
          A8B52BFE4A27E710E6E07A7FECFB74B9BDBB51B5E743AD990DEAD6D263B13DF7
          9E6945A4A94A4B6E06D690E20294A212B04793F5A94F15C4F18C1B1E87896198
          F42B4DAEDED0662DBADAC258623A07C1286D2025207D00AF86A4D865D53CDA6C
          A56E63267B11D52A522C53269E2A659BE44F217F56BE17BD868348E429593109
          0A5210A5210A5210A5210A52111EEECEE62CBB5AD49BC9571F63C56E8FF3F4ED
          86E9AA84F66DB0E17ADE865197BE8E5BB3624F2527E3C38F498E81FEEA57557A
          B0CD56944F9C6F8E1FB9D870FB103BD4207B6E3E71778481F1AAD4EAB5D6FB1B
          D218571DBDECF7238D74CBD5DD1AE597C550762D90F90A430AF297640F9ABCA1
          B3FC4AF0990ADD4853654AC1EF1D079F5F5453785F82978DABCDCBAC7EE1BB29
          C3FC23ECF9A8E9D6D73CA345FA6274DED47EA25ACCEE619E3F726703B6CCF5F2
          1C9E42D4A7AE0E93DEA8CD38AE4ADF739E56BF3D895771F25215795AC775C736
          BFB4ECA2FB82DA62DA6DB8262F2E45BE0C4476351911A2ACB4DA53F203B12054
          3E199432B26B9D5EEABFB07E27E51B238DF5F457311CAE1A953FBB64A41036CE
          B234FE94D87812A11421D34B7D38A6C3B5A322D6DCAF4B5FCBAE33AC6F5BEDE9
          4CB4B05890E3AD2CAD4B5255C2541B292402AE0F8E7935B33A07B12DCCF5BACB
          EEDBD0DD06A9AF15C6A4B8A836666043F58B8DB4A20B315A5A825B8EDA89056A
          2A2B73BFE27B955034DCF556914B4682E54A3F0FD7946D9C6BE8B80A7E671DCC
          FEF1C29432CA36009FADAEBBD89D068011CF4C0B543427A87F43AD5D91A81A3F
          954CB961135691FA7E34553B68B9279212D4E8DC90D3A39201241F27D35FC78D
          CAE9EDD772D1BB9D5FB1EDD3583459AC76FB9007198D79B54D2F4090F25B52FD
          3532E27BDB0A08501EFAFC948F9F35254D9E7E8B35F464C0BA49B03E6771E1E1
          CB58A4634C2B49E27504E38A32FB37D2D92E277B9426E5276216902C15F6865D
          2C418F3A81ECE16D2F31D509599E39A9D9763F639CFAA42F1AB788EB447EE3C9
          6D979682A423E8141640F99AE47A86E976DE7A6474B6CDB00DBDE171EC92333F
          471EFB72D65C9973724121D53CFABDF5911D0F903C253CF80906A4974595A4B2
          FCDA3539556BF2B8E514B96E26D7388552A5D026804B7DAB79F2DEEE655024AA
          FCB4BD8697D790B627ECD6E86378C6DF734D7DB8C2099595DDD36E8CB50E4FD9
          A22392527E8A75F583F8B43E9565B525406BB2A6B43C2FED378A5716E7BD3F1A
          4FB97D9413FF000484FCA233DE16DBAC5BB8DB665BB7BBFDC3EC6DE470BD2666
          F677FD964216975877B7E612EB68247239008F9D629D3536CD98ED0B66588682
          6A1C880EDF2CFF006B726B96B754EB056F4B79E1DAB52524F095A47C07906B24
          C99F4F1363EE94FBC11F3885462348C28BC3CA06FDBA5D0795BB352143FF005B
          75D7A44EF5E8B8EC3AE21E71A495B7CF6A88F29E7E3C1F9567C54C1B6D1EF4A4
          7E42948429484294842948429484294842948442BD476ECAB26C2B58A7217DAA
          FD4FB9B60FE2B8EB47FCD5557D0B7737B79D9C635ABFADFB81D408B696D4D5B6
          05BEDCDFED675C57CC971686581EF2FCA5BE4F84A7B87711553AB3EDCBD59875
          D364A52A3EE31D03C3EA54E56387B56909046675D75A481FD48BDFA002E49E43
          58C4B7F9D70B70FBB3FB769E6912A4E01823FCB6A8705EFF00195C91E41FB448
          4FDD491F169BE13E48515D7CBD323A39EABEF46F10753F55A24EC5B4C10A0E1B
          92D1E9CBBD807CB7152A1F70FC0BC4768FDDEF20815CCCFE26A880744FC13F89
          F8C6E82CD2F8218396B4594F1E7CDC748D3C72A77B72483CC9BDEA69569469DE
          88E016CD2ED2AC4E1D92C367643112DB053DA8693F127EAA513C952944A94492
          49279AC7B763A4B74D77DB2E7FA35629086A7E4F8FCDB6C571D576A12F3ACA92
          DF71F3C27BCA79FC39AD8EE303B02C362C2D61ECB4716CA551C1566EA934A2A5
          76816A3CC9CD989F3314CDB60E801BCCD4ED4A6ADDB80C79AD3FC5A1BE3EDD71
          7A6312654A403EF22336D2960A88F016B21239E7DEE3B4DDF69969B619A3DA7D
          66D2FD3CB2356DB25862370614267E0D3484F091C9F24FCC93E49249F26ABF86
          E90E5390A7660594AD2DD07E71B7F8D9C4591C62FB121485E661ABA8AAC46651
          E80D8D9234BD86A4F406395BA5AAD97CB73F68BCDBD897124A0B4F469280E36E
          A08E0A5492085023E4471507619D317621A79ABD175D707DB758ED5934191F6A
          8D320B8FB6CC677CF0B6E305FA28239F1C2071F2A9E9892979A5256F26E53A88
          D4F48C4F57A0B2FCBD39F2843C32AC0B5940E9B106C6DA5C58F8C4F0000001F2
          AA7EF69835DBF49E7FA7BB70B6CCE5BB5437B209ED255C8538F28B2C03F42943
          2F1FC9DA8AC4CEF674D58EB61EF8BEF04247D371ACB28ECD85A8FA9240F79116
          1DD3474715A0DB13D31D39911431299B1B3365B5C7051224F325D07F10B788FE
          55CC6B2EFBB699B7ECFA2E986AEEB4DBACF7C949697F61532FBFF674BAAED6D4
          FADB6D48602CF84974A41F9567B6EB54F936FB6360001EE8AA4ED3E7F186239C
          FA35B2E2D6B717616D8A89BDC9039803A9200D488FAAE3BD2DB25AA4DC224CD5
          68A1CB664CC61AF86E34873FC70F79441414B6438EFD423BBB7F788AE3E4EFF3
          68517186332735B209B64B9D70B74794D4690B125E82D29D961B01B256869085
          12E24147C0051240AFA352954E857F1EB6F8C783782ABCE80512E75F14FDDCFD
          7EE827C2C79836C1C7588E9C4AB4A6FA9DC9B1F635BBE8224FE85B9762D7C13D
          A93F67F27C1F8549BA5FBC4DB7EB2B77D7B4EB53989CDE316F8F75BB38EC5911
          936F8CFB4A79A5BA5D6D213DCD24AFB4FBC123920579B157929950434BB9F23E
          7D3A0319B54E1DE25A2B0A999E952948DCE641E694EC144FD65246DB98F936F9
          BDEDB16E9EF132C5A0DA92BBFC8811932DF28B5CC8CDA5A528242838F34842B9
          27C00493E4F1C026A529D70856D82F5CAE1252CB11D0A71C75C3C250948E4927
          E80035972F32D4D37DAB46E9FD758AF55E893D429C34F9F6F2BA2D717077DB54
          923DF1AEF68EAD3D3E6FD6AB8DEED3B8765E89692DA653C2CF7101B5ADC0DA1B
          1CB1EF3854A1C213CAB8E4F1C024659077F9B3FB8E845C372F1B5CED7FA936A9
          9FA3E5DE9D69E6FD093CA07A0595203BEA7ED127B3B39E0F3C71E6B0DBAC48BB
          7CAE6C09E7B0DF9458E6F86F8A244A43F28412B4B62CA41EFAAD9468A3BDC6BB
          7531F7CCDEBED72DDFAC3FA4758204618A5923E477654869E6D30A0C8405B0EA
          894704AC293DA84F2B254076F278AC7A2F526D954CCF65E9931ADAD7E9AB7A9E
          4CC8AAB5CD4A21A99694F3C975D2C86DB2DB68515852814F69078238AF455525
          104052F7D39F88E9E063165F02620994AD6D4B1212331EF246964AB9AB5D1493
          6173A8D2256D33D4BC2758701B56A7E9D5E8DC6C77C8E997067FA2E322434AFB
          AB08712950078E472072383F035CBDC6E76EB45B9FBB5DA733162C66D4EBD264
          2C21B69091CA94A51F012002493E0015989712B405A4E8758ACBF28F4B4C2A55
          C4F7D24A48DF506C469BEBD2217C27A90EC8B50A0E4F74C5F70F6472261D144E
          BACC9697A2B2CC72BEC4BC871D4252F365642029A2A054A481C950E7C62FD477
          65D98E9E49D51C7F5C22BB67897762C2EADD832DA9099AFF00F9163ECCA683C5
          4BF253C2382028FEE9E3053569255ACE6E09E7CB7E5FFDE516C7387989592B0B
          9450CAA4A4EA9DD60148DFC45CEC9B80AB131FB6A5750FD9B6913B323E7FAE10
          A1B902ED22C4F34CC39525426C765B79F6425A694545A6DE6CACA794A3BC0241
          F15FBBFBFF00D9EC6B144C997AEB6A5409B8F3D953529A6DE5A7F4634EFA2B92
          AE107B47ABFB309500A52FDD00ABC57E9AA498529057A8DF7FC23C9380B112D9
          6A6132A72B9A24DD3AE97EB71B1B5F7208DC5A380FFAD2B629FA9FFAF8BD73EC
          B599C9B6A1F72CB714A9D905B53BD886CC7EF5F084951294909053C91DC9E65C
          D1FD62D33D7CD3BB76AC68FE5F16FD8F5D92B544BA43EE0877B16A42870A0140
          A5685248201041AFB97A8CB4D2FB3655736BF3DBD6231EB183AB74097F4BA831
          95BCD92F992A19AC4DBBA4F207C3422F706326A566C562235DE2E965CF5B76A9
          A8BA49626BBEE190E393A0C3473C773EB6141A1FCD7DB5D7AF6C1D3BB779BBDB
          9C887A2FA4932443833556F9F79B92D3121DBDF48495B6EB8BE085A42924A121
          4BF23DDF3549C5120F4E4D329645C9047B3FFB1D41C0AC554DC3741A93F52732
          21B5215E2730200039925368B5AD8EF402DBEEDFA643D40DC65D19D46C9A394B
          ADDBDE60A2CD0D63E8CABDE7C8FABBEEFF00601AB018D1A3C36111623286DB6D
          21086DB1C252078000F901F4AB0D2694DD298ECD3AA8EE7AFE51A778858F6731
          ED4FD2DE195A4E8DA2FF0054753D54799F21B011EF4A958A0C0003E038A5210A
          5211E1C3C20F9AEBFF00BA079EDFC759C9F84C670C9B75DB318F8DB7DA794221
          455A23BAB4FF0067B1975CFF0038D55B14FEF1A665FEF2C7EBDF1BE780C049CF
          54AAC7665851F690AF824C5FE4765B6632588CDA52848094A1238094FC80FE55
          5F992EC9F7E37DDE45CB7638C58314C3AF9156F3F364E37954A5C2CE90CB2110
          22C882EB652C8FD9B61D5951000E508EF014652A92CFCC86C316D0DEF7B5ADF1
          B8B823C6289816B54AA33936BAAA95671B28CA12141415BDEE41494A8216950D
          7BA46E44631897484DC8E05706B29C6F500C8BF5AF119B746A65E72079E8B273
          59C8536ECC446ECEC692CB6EAFB1EEDEF53896D44702B28D35D83EF0F0CDBE38
          BB2E3D88E3F9A63D848C0F0BB1C0BCADF8D66FB53A1575BCBB24B43896F9F792
          96D24242129E4F71E221AA34D307BA41D0EA4EB7D2DCB62403E168D8D50E24D0
          6A8905F4A93DE48294A004E425598EFF005821C711D5454093BC4A57ED8E6636
          ACAB44B4C30CB2DB9FD2BD0FB5397962DCFCC0D3D90DFDA6CB713D44769084A1
          6A5BE5CE4F2B74F8F15095B3675D49D9DA0EA86884BD3DC21BCAF54EFCAB9DF7
          2B8F942FD7B8B725C52A4A382C14B480CB6DB09482AF75D59E07C0FBBF4E9A49
          21902D6206B6B7742472F03ED888A4E31A0BADA15537161616DAD564660A3DB3
          8EB80EA34376C5F9F67E3A6D8ECE76F792692ED8FF00C15E4D0AE98D4C941F69
          305BCB24E40BB4B5D8186931E5BE84F604B684A9284202107E009E6B0BDA46C8
          355360BB65CE704D34D6097A89955DA449B9DA1591F30E231254D7634920A9C2
          01504ADC573EF11E00F9C8264569EC9D49B14248B5EF7240E7E1E51527F14CA3
          C67E45D6C29B99750A2E040414A50A55C840B80540EC0E9AEF7883F3EE973B98
          B8E8EE0DA3B88E6820FEA158A6E55FAC36EBD2A3CCBD673257DC990E2FB0A92C
          B054E14BBCF71042781F118FEBAF499DD76A3E85B5A6B81DE315B341B0B0DA18
          C7AE4F2EE0E6457398868DD6F7266B8796E4957A8DB44A5C506C280ECF53C433
          B449952549491A8037E83A75240B9F131B22438A14261D65D790AEEB8A59B26C
          495AC9D55A9CADA56ACA916B94A76DC48D93F4F3DC2CDDDF6A9EE0A1BB64958C
          1836A7F12C31E99DAD5E2E76E821982B9A7B784478EF95BDE9F90B586947EE71
          516D8BA716FCB1CDA264FA2565C5A1B790E6525866FD3E5EA34A931AE8C38EAA
          44F7D3194C0663BCFA9B61B2A485A8A16E727F8BE9DA4CDE65146B7CFF006AD6
          CC74E5AF5F331E34FE2061E2CB2899514E4F46B8EC82F316923390491949364D
          C6A528034BC6E4EA3EDB33BDC7EC524EDB32E9D1B4C6EF77B53500A70B92B991
          ED0869C496D942D41B538D96DA42169F7794A9601F9D473ADBB0ED6CB774B03B
          1FD1AD557722C822C56223977BFBEA88ABA4712C3CF47F507796905B25B40254
          0212124F049A94989075D0A752AB28B796DCAFE7EE8A2D2316C853D6C48BCDE7
          691361F2E11DF28161629F11DE22FBE9E31826B96CAF779A9D8869CE6D3B4574
          9DFB862991C696FE9BD9E52A130AB44468260407AE6A694A92965CEE5A925096
          FDFE1293DBC9C727F4E8DEF61BA9B856B7C16F06CF3249591DC335C9E0DD6E8F
          40B7317B75AF4A02DBFD9296E4684824A000165457F00A1C473B4C9C5ACB8129
          E46D7B0BE9A6DB019B5E778B9C8E39C372D2C99453AF1043A82A290A50490B21
          63BC2EA52BB3B27647676B9168E3730E927BA5B9C865DB4EA6C86A4E3C21DB20
          DD2DD7E720BD7944E79D93925C24F6A3B83921C78B686C2B9F49080A3EE815EB
          ADDD30B73390C3BCD9B05D32C61760BE6411201C698C9150530F13B4849B7DB9
          B7FD25AD0B90FAD725F50EE21C69B3CA892478AE893212AB6BEBF34F4D2E9B13
          E2224A5F89F435BCD29776C0D746C1B2AE97413A8CD95D0B4A45C0C8B3D4C72D
          AE7D39B7ADABD0ADF9063D9C5D31ABB603628B6FC45B46752A74A12A748F52F2
          FBF717101E50FB3A8C740F1DC94A78ED09093BEBA3FA43A79A0DA6B68D22D29C
          659B3E3F6263ECF0EDEC294A0DA792A24A944A94A5294A52944924924F9352D4
          E90725DE5BCF6E40B6B7B723ED01373CED1AF319E2B92AB5365E994E00250A51
          5590119AE0293A0BD8256E3F9523448569BC64B4A998D6B02011C1AE3AC18862
          78A19AAC5F18B75B4DC652E74B3023219FB5485F1DEF39DA077B8AE072A3E4F0
          3935F852090488F44BAE210A6D2A201DC5F436DAFD6391A57EC79C2948429484
          29484629AEDA8B1B48345B2DD5696A406F1AB34CBA2BBFE07D0616E71FE948AA
          54F67CB4D64EA9750393AA37C4990713B2CCBA194EF9264BE531D27F321F74FF
          002AAB567F7B53946BA127E1F846F8E1AFFB1C118867BEF2128F6850FF003117
          AC0703814AB4C687852908529085290852908529085290852908529085290852
          908529085290852908529085290883BA936219EE7DB14D51C3B4CAC52AE77BB8
          D81F663DBA0A0ADE93C94F7A1091E54A280B0123C93E073CD6B27B3FDB23D4DD
          B6E93657AC7ACB894BB15DF3A7A3B70AD17368B52A3C26038438B6C80A41716E
          9F75401ED6D27F78540CC4A38ED6197EDDD4A4EBE3A8B7BE36CD1F1049D3F873
          50A6158ED9E790026FAE519557B74EE917EA62C32953D1A9A14A4214A4214A42
          14A4214A4214A4214A4214A4214A4214A4214A4214A4214A4214A4214A421400
          0F029085290852908529085290852908529085290852908529085290852908FF
          D9}
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 72
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
          190.500000000000000000
          1844.145833333333000000)
        Brush.Style = bsClear
        Shape = qrsHorLine
      end
      object QRLabel24: TQRLabel
        Left = 592
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          211.666666666666700000
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
      object QRLabel20: TQRLabel
        Left = 176
        Top = 112
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          296.333333333333400000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Polisi'
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
      object QRLabel21: TQRLabel
        Left = 240
        Top = 112
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          296.333333333333400000
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
      object QRLabel51: TQRLabel
        Left = 0
        Top = 80
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          211.666666666666700000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Counter'
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
      object QRLabel52: TQRLabel
        Left = 80
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          211.666666666666700000
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
      object QRLabel53: TQRLabel
        Left = 176
        Top = 96
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          254.000000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Schedule'
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
      object QRLabel54: TQRLabel
        Left = 240
        Top = 96
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          254.000000000000000000
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
      object QRLabel37: TQRLabel
        Left = 0
        Top = 96
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          254.000000000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Transit'
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
      object QRLabel50: TQRLabel
        Left = 80
        Top = 96
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          254.000000000000000000
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
      object QRLabel16: TQRLabel
        Left = 0
        Top = 160
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          423.333333333333300000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'KM Awal'
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
      object QRLabel17: TQRLabel
        Left = 80
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
          211.666666666666700000
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
      object QKMOrdo: TQRLabel
        Left = 88
        Top = 160
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          423.333333333333300000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QKMOrdo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 176
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          465.666666666666800000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pax'
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
      object QRLabel25: TQRLabel
        Left = 80
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
          211.666666666666700000
          465.666666666666800000
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
      object QRLabel55: TQRLabel
        Left = 0
        Top = 192
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          508.000000000000000000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Paket'
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
      object QRLabel6: TQRLabel
        Left = 80
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
          211.666666666666700000
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
      object QRLabel56: TQRLabel
        Left = 384
        Top = 160
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          423.333333333333300000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SPBU'
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
        Left = 384
        Top = 176
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          465.666666666666800000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tol'
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
        Left = 384
        Top = 192
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          508.000000000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Driver'
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
      object QRLabel14: TQRLabel
        Left = 464
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
          1227.666666666667000000
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
      object QRLabel15: TQRLabel
        Left = 464
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
          1227.666666666667000000
          465.666666666666800000
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
      object QRLabel59: TQRLabel
        Left = 464
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
          1227.666666666667000000
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
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 249
      Width = 698
      Height = 48
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
        127.000000000000000000
        1846.791666666667000000)
      BandType = rbDetail
      object QCatatan: TQRLabel
        Left = 112
        Top = 8
        Width = 585
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          21.166666666666670000
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
      object QRLabel40: TQRLabel
        Left = 0
        Top = 8
        Width = 54
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
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Catatan :'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 48
      Top = 297
      Width = 698
      Height = 144
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
        381.000000000000000000
        1846.791666666667000000)
      BandType = rbPageFooter
      object QRLabel26: TQRLabel
        Left = 24
        Top = 16
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          42.333333333333340000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Operasional,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 464
        Top = 16
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          42.333333333333340000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Petugas SPBU,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 608
        Top = 16
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          42.333333333333340000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pengemudi,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTandaPetugas: TQRLabel
        Left = 16
        Top = 80
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          211.666666666666700000
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
      object QRLabel29: TQRLabel
        Left = 456
        Top = 80
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          211.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(.........................)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTandaPengemudi: TQRLabel
        Left = 576
        Top = 80
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          211.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTandaPengemudi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 112
        Top = 80
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
          211.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ')'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel32: TQRLabel
        Left = 8
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          211.666666666666700000
          13.229166666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 568
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          211.666666666666700000
          13.229166666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 688
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          211.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ')'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel35: TQRLabel
        Left = 296
        Top = 0
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666800000
          0.000000000000000000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Petugas Masuk'
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
      object QRLabel39: TQRLabel
        Left = 0
        Top = 104
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          275.166666666666700000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Berita :'
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
      object QRLabel41: TQRLabel
        Left = 8
        Top = 128
        Width = 75
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          21.166666666666670000
          338.666666666666700000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Form : FR/DT/001'
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
        Left = 320
        Top = 128
        Width = 20
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          338.666666666666700000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rev:0'
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
        Left = 624
        Top = 128
        Width = 67
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1651.000000000000000000
          338.666666666666700000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tgl Terbit: 25/03/13'
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
      object QRLabel44: TQRLabel
        Left = 264
        Top = 16
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          42.333333333333340000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Security,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 344
        Top = 80
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          211.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(.........................)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel46: TQRLabel
        Left = 232
        Top = 80
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          211.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(.........................)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel47: TQRLabel
        Left = 64
        Top = 0
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          0.000000000000000000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Petugas Keluar'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel48: TQRLabel
        Left = 120
        Top = 80
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          211.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(.........................)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel49: TQRLabel
        Left = 152
        Top = 16
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          42.333333333333340000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Checker,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel45: TQRLabel
        Left = 352
        Top = 16
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          931.333333333333500000
          42.333333333333340000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Checker,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
