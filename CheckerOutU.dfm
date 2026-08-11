object CheckerOut: TCheckerOut
  Left = 726
  Top = 276
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Armada Keluar'
  ClientHeight = 615
  ClientWidth = 731
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
    Top = 333
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label17: TLabel
    Left = 60
    Top = 192
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label18: TLabel
    Left = 61
    Top = 216
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Guide'
  end
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 384
    Width = 561
    Height = 225
    Caption = 'Data SPJ'
    TabOrder = 5
    object Label12: TLabel
      Left = 408
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Total Unit Keluar'
    end
    object Panel3: TPanel
      Left = 496
      Top = 8
      Width = 57
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object UnitJalan: TEdit
        Left = 0
        Top = 0
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object GridSPJ: TStringGrid
      Left = 8
      Top = 32
      Width = 545
      Height = 185
      TabStop = False
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnDblClick = GridSPJDblClick
      OnKeyPress = GridSPJKeyPress
      OnSelectCell = GridSPJSelectCell
      ColWidths = (
        104
        50
        77
        169
        62
        53)
    end
    object Previous: TCheckBox
      Left = 64
      Top = 14
      Width = 113
      Height = 17
      Caption = 'Tanggal Mundur'
      TabOrder = 2
      OnClick = PreviousClick
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
    Left = 632
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 7
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 632
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 9
    OnClick = SelesaiClick
  end
  object Bersihkan: TButton
    Left = 632
    Top = 544
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 8
    OnClick = BersihkanClick
  end
  object GroupDetail: TGroupBox
    Left = 392
    Top = 248
    Width = 329
    Height = 129
    Caption = 'Detail Keluar'
    TabOrder = 4
    object Label2: TLabel
      Left = 34
      Top = 16
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'KM Odo'
    end
    object Label8: TLabel
      Left = 54
      Top = 40
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Label16: TLabel
      Left = 36
      Top = 64
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Catatan'
    end
    object KMOdo: TEdit
      Left = 80
      Top = 14
      Width = 65
      Height = 21
      TabOrder = 0
      OnEnter = KMOdoEnter
      OnExit = KMOdoExit
      OnKeyPress = KMOdoKeyPress
    end
    object OutTime: TMaskEdit
      Left = 80
      Top = 40
      Width = 41
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  .  '
      OnKeyPress = OutTimeKeyPress
    end
    object RemarkOut: TMemo
      Left = 80
      Top = 68
      Width = 241
      Height = 37
      TabOrder = 2
      OnKeyPress = RemarkOutKeyPress
    end
  end
  object Panel1: TPanel
    Left = 96
    Top = 96
    Width = 433
    Height = 145
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object Label9: TLabel
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
    object Label10: TLabel
      Left = 251
      Top = 4
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Label20: TLabel
      Left = 185
      Top = 124
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
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
      TabOrder = 3
    end
    object NoReservasi: TEdit
      Left = 0
      Top = 48
      Width = 97
      Height = 21
      TabOrder = 4
    end
    object Customer: TEdit
      Left = 96
      Top = 48
      Width = 337
      Height = 21
      TabOrder = 5
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
      TabOrder = 7
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
      Width = 169
      Height = 21
      TabOrder = 11
    end
    object GuideCellular: TEdit
      Left = 248
      Top = 120
      Width = 113
      Height = 21
      TabOrder = 12
    end
    object DriverDisp: TEdit
      Left = 96
      Top = 24
      Width = 201
      Height = 21
      TabOrder = 1
    end
    object NoPolisi: TEdit
      Left = 96
      Top = 0
      Width = 113
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object Seat: TEdit
      Left = 208
      Top = 0
      Width = 41
      Height = 21
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 321
    Height = 41
    Enabled = False
    TabOrder = 0
    object Label4: TLabel
      Left = 40
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 228
      Top = 12
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Tanggal: TEdit
      Left = 88
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object Jam: TEdit
      Left = 256
      Top = 12
      Width = 49
      Height = 21
      TabOrder = 1
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
  object GroupService: TGroupBox
    Left = 400
    Top = 0
    Width = 313
    Height = 137
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 6
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
    Top = 332
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
    Height = 37
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
  object CheckList: TButton
    Left = 632
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Cek List'
    TabOrder = 13
    OnClick = CheckListClick
  end
  object WebService: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 600
    Top = 176
  end
end
