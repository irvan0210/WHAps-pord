object CustomerComplainForm: TCustomerComplainForm
  Left = 328
  Top = 227
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Customer Complain'
  ClientHeight = 353
  ClientWidth = 591
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
  object LabelKeluhan: TLabel
    Left = 14
    Top = 230
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
    Left = 42
    Top = 98
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label6: TLabel
    Left = 39
    Top = 120
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Customer'
  end
  object Label13: TLabel
    Left = 54
    Top = 75
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'No SJ'
  end
  object Label8: TLabel
    Left = 31
    Top = 144
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pemakaian'
  end
  object Label11: TLabel
    Left = 40
    Top = 51
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Order'
  end
  object Label7: TLabel
    Left = 61
    Top = 168
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rute'
  end
  object CariOrder: TSpeedButton
    Left = 252
    Top = 44
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
  object Label9: TLabel
    Left = 334
    Top = 11
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jam'
    Visible = False
  end
  object Jam: TEdit
    Left = 356
    Top = 8
    Width = 39
    Height = 21
    TabOrder = 10
    Visible = False
  end
  object Panel1: TPanel
    Left = 90
    Top = 69
    Width = 346
    Height = 151
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 8
    object Label21: TLabel
      Left = 110
      Top = 29
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Label22: TLabel
      Left = 68
      Top = 77
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label2: TLabel
      Left = 169
      Top = 28
      Width = 28
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
      Width = 333
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
      Left = 288
      Top = 2
      Width = 49
      Height = 21
      TabOrder = 9
    end
  end
  object Selesai: TButton
    Left = 473
    Top = 317
    Width = 76
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object CetakUlang: TButton
    Left = 318
    Top = 38
    Width = 76
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 1
    Visible = False
    OnClick = CetakUlangClick
  end
  object Bersihkan: TButton
    Left = 473
    Top = 288
    Width = 76
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 2
    OnClick = BersihkanClick
  end
  object KomplainGrid: TStringGrid
    Left = 92
    Top = 229
    Width = 334
    Height = 111
    ColCount = 1
    DefaultColWidth = 435
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 3
    OnSelectCell = KomplainGridSelectCell
  end
  object KomplainGridSebelum: TStringGrid
    Left = 92
    Top = 237
    Width = 334
    Height = 85
    ColCount = 1
    DefaultColWidth = 435
    DefaultRowHeight = 18
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 4
    OnSelectCell = KomplainGridSebelumSelectCell
  end
  object Simpan: TButton
    Left = 473
    Top = 259
    Width = 76
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = SimpanClick
  end
  object GroupNo: TGroupBox
    Left = 8
    Top = 0
    Width = 569
    Height = 33
    Enabled = False
    TabOrder = 6
    object Label3: TLabel
      Left = 39
      Top = 11
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No CCP'
    end
    object Label5: TLabel
      Left = 206
      Top = 11
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label10: TLabel
      Left = 423
      Top = 11
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'User'
    end
    object NoCCP: TEdit
      Left = 82
      Top = 8
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object Tanggal: TEdit
      Left = 248
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object UserName: TEdit
      Left = 451
      Top = 8
      Width = 101
      Height = 21
      TabOrder = 2
    end
  end
  object KomplainDetail: TEdit
    Left = 92
    Top = 237
    Width = 334
    Height = 21
    TabOrder = 7
    OnExit = KomplainDetailExit
    OnKeyDown = KomplainDetailKeyDown
    OnKeyPress = KomplainDetailKeyPress
  end
  object NoReservasi: TEdit
    Left = 90
    Top = 46
    Width = 160
    Height = 21
    Color = 14811135
    ReadOnly = True
    TabOrder = 9
  end
  object GbKategori: TGroupBox
    Left = 440
    Top = 64
    Width = 138
    Height = 161
    Caption = '  Kategori Komplain  '
    TabOrder = 11
    object cbKebersihan: TCheckBox
      Left = 8
      Top = 21
      Width = 120
      Height = 17
      Caption = 'Kebersihan'
      TabOrder = 0
    end
    object cbFasilitas: TCheckBox
      Left = 8
      Top = 41
      Width = 120
      Height = 17
      Caption = 'Fasilitas'
      TabOrder = 1
    end
    object cbPelayanan: TCheckBox
      Left = 8
      Top = 61
      Width = 120
      Height = 17
      Caption = 'Pelayanan'
      TabOrder = 2
    end
    object cbPenjemputan: TCheckBox
      Left = 8
      Top = 81
      Width = 120
      Height = 17
      Caption = 'Penjemputan'
      TabOrder = 3
    end
    object cbMogok: TCheckBox
      Left = 8
      Top = 102
      Width = 120
      Height = 17
      Caption = 'Mogok'
      TabOrder = 4
    end
    object cbDriverBermasalah: TCheckBox
      Left = 8
      Top = 124
      Width = 120
      Height = 17
      Caption = 'Driver Bermasalah'
      TabOrder = 5
    end
  end
  object DriverDisp: TEdit
    Left = 290
    Top = 94
    Width = 133
    Height = 21
    TabOrder = 12
  end
  object NoPolisi: TEdit
    Left = 137
    Top = 94
    Width = 60
    Height = 21
    TabStop = False
    TabOrder = 13
  end
  object PanelClose: TPanel
    Left = 440
    Top = 224
    Width = 105
    Height = 25
    TabOrder = 14
    object LabelStatus: TLabel
      Left = 4
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ChkClose: TCheckBox
      Left = 46
      Top = 6
      Width = 57
      Height = 17
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
