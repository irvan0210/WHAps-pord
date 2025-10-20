object CustomerComplainCorrectionForm: TCustomerComplainCorrectionForm
  Left = 256
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Customer Complain (Correction)'
  ClientHeight = 494
  ClientWidth = 975
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
  object LabelKeluhan: TLabel
    Left = 495
    Top = 35
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Daftar Keluhan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 30
    Top = 64
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label6: TLabel
    Left = 24
    Top = 86
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Customer'
  end
  object Label13: TLabel
    Left = 43
    Top = 41
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'No SJ'
  end
  object Label8: TLabel
    Left = 20
    Top = 110
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pemakaian'
  end
  object Label11: TLabel
    Left = 12
    Top = 17
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Komplain'
  end
  object Label7: TLabel
    Left = 48
    Top = 134
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rute'
  end
  object CariOrder: TSpeedButton
    Left = 239
    Top = 10
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
  object Label19: TLabel
    Left = 479
    Top = 7
    Width = 88
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kategori  Komplain'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label34: TLabel
    Left = 282
    Top = 17
    Width = 83
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Komplain'
  end
  object Label4: TLabel
    Left = 512
    Top = 183
    Width = 49
    Height = 13
    Caption = 'Kesalahan'
  end
  object Panel1: TPanel
    Left = 76
    Top = 35
    Width = 379
    Height = 151
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label21: TLabel
      Left = 110
      Top = 29
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Label22: TLabel
      Left = 69
      Top = 77
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label2: TLabel
      Left = 168
      Top = 28
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Driver'
    end
    object NoBody: TEdit
      Left = 0
      Top = 25
      Width = 45
      Height = 21
      TabOrder = 1
    end
    object Customer: TEdit
      Left = 0
      Top = 49
      Width = 333
      Height = 21
      TabOrder = 0
    end
    object Route: TMemo
      Left = 0
      Top = 97
      Width = 380
      Height = 49
      TabOrder = 3
    end
    object Seat: TEdit
      Left = 134
      Top = 25
      Width = 27
      Height = 21
      TabOrder = 2
    end
    object FromDate: TEdit
      Left = 0
      Top = 73
      Width = 65
      Height = 21
      TabOrder = 4
    end
    object ToDate: TEdit
      Left = 88
      Top = 73
      Width = 65
      Height = 21
      TabOrder = 5
    end
    object Customer_Id: TEdit
      Left = 160
      Top = 73
      Width = 62
      Height = 21
      TabOrder = 6
      Visible = False
    end
    object NoSJ: TEdit
      Left = 0
      Top = 2
      Width = 160
      Height = 21
      TabOrder = 7
    end
    object NoResvDetId: TEdit
      Left = 160
      Top = 72
      Width = 113
      Height = 21
      TabOrder = 8
      Visible = False
    end
    object NoResvDetPkgId: TEdit
      Left = 283
      Top = 2
      Width = 49
      Height = 21
      TabOrder = 9
      Visible = False
    end
  end
  object KomplainGrid: TStringGrid
    Left = 573
    Top = 34
    Width = 380
    Height = 141
    ColCount = 1
    DefaultColWidth = 435
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
  end
  object DriverDisp: TEdit
    Left = 277
    Top = 60
    Width = 133
    Height = 21
    TabOrder = 2
  end
  object NoPolisi: TEdit
    Left = 124
    Top = 60
    Width = 60
    Height = 21
    TabStop = False
    TabOrder = 3
  end
  object NoCCP: TEdit
    Left = 74
    Top = 11
    Width = 160
    Height = 21
    Color = 14811135
    ReadOnly = True
    TabOrder = 4
  end
  object GbKategori: TPanel
    Left = 573
    Top = -1
    Width = 379
    Height = 31
    Enabled = False
    TabOrder = 5
    object cbKebersihan: TCheckBox
      Left = 4
      Top = 7
      Width = 81
      Height = 17
      Caption = 'Kebersihan'
      TabOrder = 0
    end
    object cbFasilitas: TCheckBox
      Left = 84
      Top = 7
      Width = 81
      Height = 17
      Caption = 'Fasilitas'
      TabOrder = 1
    end
    object cbPelayanan: TCheckBox
      Left = 148
      Top = 7
      Width = 89
      Height = 17
      Caption = 'Pelayanan'
      TabOrder = 2
    end
    object cbPenjemputan: TCheckBox
      Left = 228
      Top = 7
      Width = 89
      Height = 17
      Caption = 'Penjemputan'
      TabOrder = 3
    end
    object cbMogok: TCheckBox
      Left = 316
      Top = 7
      Width = 57
      Height = 17
      Caption = 'Mogok'
      TabOrder = 4
    end
  end
  object grpinvestigasi: TGroupBox
    Left = 22
    Top = 201
    Width = 937
    Height = 129
    Caption = 'Investigasi'
    Enabled = False
    TabOrder = 6
    object Label15: TLabel
      Left = 4
      Top = 19
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Investigasi/Analisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 93
      Top = 16
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
    object Label20: TLabel
      Left = 520
      Top = 19
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'PIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 55
      Top = 102
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 101
      Top = 16
      Width = 380
      Height = 81
      BevelOuter = bvNone
      TabOrder = 0
      object Label23: TLabel
        Left = 264
        Top = 257
        Width = 71
        Height = 16
        Caption = '* Harus diisi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Investigasi: TMemo
        Left = 2
        Top = 2
        Width = 375
        Height = 79
        TabOrder = 0
      end
      object Penanganan: TMemo
        Left = 2
        Top = 204
        Width = 333
        Height = 49
        TabOrder = 1
      end
      object eStaff: TEdit
        Left = 3
        Top = 160
        Width = 333
        Height = 21
        TabOrder = 2
      end
      object eTeknikal: TEdit
        Left = 3
        Top = 182
        Width = 333
        Height = 21
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 545
      Top = 14
      Width = 377
      Height = 107
      TabOrder = 1
      object StrGrid3: TZColorStringGrid
        Left = 3
        Top = -1
        Width = 374
        Height = 106
        ColCount = 3
        DefaultRowHeight = 20
        DefaultDrawing = False
        Enabled = False
        FixedColor = clBtnFace
        FixedCols = 0
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
    object TglInvestigasi: TDateTimePicker
      Left = 103
      Top = 99
      Width = 89
      Height = 20
      Date = 41964.570029108800000000
      Time = 41964.570029108800000000
      TabOrder = 2
    end
  end
  object grpperbaikn: TGroupBox
    Left = 22
    Top = 330
    Width = 937
    Height = 122
    Caption = 'Perbaikan'
    TabOrder = 7
    object Label24: TLabel
      Left = 45
      Top = 20
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Perbaikan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 94
      Top = 16
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
      Left = 521
      Top = 22
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'PIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 54
      Top = 93
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 106
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Penyelesaian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Perbaikan: TMemo
      Left = 102
      Top = 14
      Width = 375
      Height = 81
      TabOrder = 0
    end
    object StrGrid4: TZColorStringGrid
      Left = 547
      Top = 13
      Width = 374
      Height = 97
      ColCount = 3
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 1
      OnSelectCell = StrGrid4SelectCell
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
    object PIC: TEdit
      Left = 559
      Top = 28
      Width = 298
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Visible = False
      OnExit = PICExit
      OnKeyPress = PICKeyPress
    end
    object ListEmpl: TListBox
      Left = 566
      Top = 46
      Width = 252
      Height = 65
      ItemHeight = 13
      TabOrder = 3
      Visible = False
      OnDblClick = ListEmplDblClick
    end
    object TglPerbaikan: TDateTimePicker
      Left = 101
      Top = 97
      Width = 89
      Height = 20
      Date = 41964.570029108800000000
      Time = 41964.570029108800000000
      TabOrder = 4
    end
  end
  object Panel4: TPanel
    Left = 22
    Top = 453
    Width = 937
    Height = 41
    TabOrder = 8
    object Selesai: TButton
      Left = 543
      Top = 6
      Width = 76
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = SelesaiClick
    end
    object Bersihkan: TButton
      Left = 461
      Top = 6
      Width = 76
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 1
      OnClick = BersihkanClick
    end
    object Simpan: TButton
      Left = 377
      Top = 6
      Width = 76
      Height = 25
      Caption = 'Simpan'
      TabOrder = 2
      OnClick = SimpanClick
    end
  end
  object Tanggal: TEdit
    Left = 369
    Top = 11
    Width = 83
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object Panel5: TPanel
    Left = 576
    Top = 176
    Width = 377
    Height = 25
    Enabled = False
    TabOrder = 10
    object ChkCrew: TCheckBox
      Left = 7
      Top = 4
      Width = 68
      Height = 17
      Caption = 'Crew'
      TabOrder = 0
    end
    object ChkStaf: TCheckBox
      Left = 68
      Top = 6
      Width = 52
      Height = 17
      Caption = 'Staf'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object ChkTeknikal: TCheckBox
      Left = 123
      Top = 6
      Width = 78
      Height = 17
      Caption = 'Teknikal'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
end
