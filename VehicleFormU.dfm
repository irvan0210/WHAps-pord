object VehicleForm: TVehicleForm
  Left = 488
  Top = 364
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Armada'
  ClientHeight = 544
  ClientWidth = 748
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
  object VhcImage: TImage
    Left = 524
    Top = 16
    Width = 225
    Height = 457
  end
  object GroupInput: TGroupBox
    Left = 8
    Top = 8
    Width = 334
    Height = 423
    TabOrder = 7
    object Label1: TLabel
      Left = 31
      Top = 51
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Body'
    end
    object Label2: TLabel
      Left = 17
      Top = 99
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Rangka'
    end
    object Label3: TLabel
      Left = 27
      Top = 75
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Mesin'
    end
    object Label4: TLabel
      Left = 31
      Top = 123
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Polisi'
    end
    object Label5: TLabel
      Left = 58
      Top = 147
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tahun'
    end
    object Label12: TLabel
      Left = 60
      Top = 169
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Group'
    end
    object Label13: TLabel
      Left = 67
      Top = 16
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object Label14: TLabel
      Left = 10
      Top = 191
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jenis Kendaraan'
    end
    object Label16: TLabel
      Left = 96
      Top = 12
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 96
      Top = 44
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 96
      Top = 68
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 96
      Top = 92
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 96
      Top = 116
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 96
      Top = 162
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 96
      Top = 140
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 96
      Top = 184
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 178
      Top = 115
      Width = 7
      Height = 29
      Alignment = taRightJustify
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NoRangka: TEdit
      Left = 104
      Top = 96
      Width = 153
      Height = 21
      TabOrder = 3
      OnKeyPress = NoRangkaKeyPress
    end
    object NoMesin: TEdit
      Left = 104
      Top = 72
      Width = 153
      Height = 21
      TabOrder = 2
      OnKeyPress = NoMesinKeyPress
    end
    object Tahun: TMaskEdit
      Left = 104
      Top = 144
      Width = 33
      Height = 21
      EditMask = '0000;0'
      MaxLength = 4
      TabOrder = 5
      OnKeyPress = TahunKeyPress
    end
    object SBU: TComboBox
      Left = 104
      Top = 16
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      TabStop = False
    end
    object NoBodi: TEdit
      Left = 104
      Top = 48
      Width = 89
      Height = 21
      TabOrder = 1
      OnKeyPress = NoBodiKeyPress
    end
    object Panel2: TPanel
      Left = 144
      Top = 184
      Width = 177
      Height = 49
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 9
    end
    object GroupReguler: TPanel
      Left = 8
      Top = 375
      Width = 313
      Height = 23
      BevelOuter = bvNone
      TabOrder = 8
      object Label15: TLabel
        Left = 0
        Top = 34
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Reguler/Executive'
      end
      object Reguler: TRadioButton
        Left = 96
        Top = 32
        Width = 73
        Height = 17
        Caption = 'Reguler'
        TabOrder = 0
      end
      object Executive: TRadioButton
        Left = 200
        Top = 32
        Width = 81
        Height = 17
        Caption = 'Executive'
        TabOrder = 1
      end
    end
    object NoPolisi: TEdit
      Left = 104
      Top = 120
      Width = 65
      Height = 21
      TabOrder = 4
      OnChange = NoPolisiChange
      OnEnter = NoPolisiEnter
      OnExit = NoPolisiExit
      OnKeyPress = NoPolisiKeyPress
    end
    object Jenis: TComboBox
      Left = 104
      Top = 188
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnKeyPress = JenisKeyPress
    end
    object Group: TComboBox
      Left = 104
      Top = 166
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = GroupChange
      OnKeyPress = GroupKeyPress
    end
    object NoPolisi2: TEdit
      Left = 192
      Top = 120
      Width = 65
      Height = 21
      TabOrder = 10
      OnEnter = NoPolisi2Enter
      OnExit = NoPolisi2Exit
      OnKeyPress = NoPolisi2KeyPress
    end
    object isFacelift: TCheckBox
      Left = 194
      Top = 50
      Width = 62
      Height = 17
      Caption = 'Facelift'
      TabOrder = 11
    end
    object GroupNoUjiKir: TPanel
      Left = 8
      Top = 211
      Width = 313
      Height = 189
      BevelOuter = bvNone
      TabOrder = 12
      object Label26: TLabel
        Left = 31
        Top = 4
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'No Uji KIR'
      end
      object Label27: TLabel
        Left = 37
        Top = 51
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'No E-Toll'
      end
      object Label29: TLabel
        Left = 24
        Top = 74
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Kepemilikan'
      end
      object Label28: TLabel
        Left = 50
        Top = 28
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'No KP'
      end
      object Label30: TLabel
        Left = 50
        Top = 96
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dealer'
      end
      object Label31: TLabel
        Left = 43
        Top = 118
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Karoseri'
      end
      object Label32: TLabel
        Left = 38
        Top = 140
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'GP Kode'
      end
      object Label40: TLabel
        Left = -1
        Top = 163
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Kepemilikan Asset'
      end
      object Label41: TLabel
        Left = 87
        Top = 159
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 88
        Top = 69
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object NoUjiKIR: TEdit
        Left = 96
        Top = 0
        Width = 185
        Height = 21
        TabOrder = 0
      end
      object ETollNumber: TEdit
        Left = 96
        Top = 47
        Width = 185
        Height = 21
        TabOrder = 1
      end
      object OwnerVhc: TComboBox
        Left = 96
        Top = 70
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnKeyPress = JenisKeyPress
      end
      object NoKP: TEdit
        Left = 96
        Top = 24
        Width = 185
        Height = 21
        TabOrder = 3
      end
      object eDealer: TComboBox
        Left = 96
        Top = 92
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnKeyPress = JenisKeyPress
      end
      object eKaroseri: TComboBox
        Left = 96
        Top = 114
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 5
        OnKeyPress = JenisKeyPress
      end
      object eGPcode: TComboBox
        Left = 96
        Top = 136
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 6
        OnKeyPress = JenisKeyPress
      end
      object AssetOwner: TComboBox
        Left = 96
        Top = 159
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
        OnKeyPress = JenisKeyPress
      end
    end
    object isOutsideRent: TCheckBox
      Left = 255
      Top = 50
      Width = 72
      Height = 17
      Caption = 'Sewa Luar'
      TabOrder = 13
      OnClick = isOutsideRentClick
    end
    object isSafetyBelt: TCheckBox
      Left = 260
      Top = 74
      Width = 72
      Height = 17
      Caption = 'Safety Belt'
      TabOrder = 14
    end
  end
  object GroupDriver: TPanel
    Left = 16
    Top = 401
    Width = 313
    Height = 23
    BevelOuter = bvNone
    TabOrder = 6
    object Label17: TLabel
      Left = 28
      Top = 4
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pengemudi'
    end
    object CariDriver: TSpeedButton
      Left = 282
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
      OnClick = CariDriverClick
    end
    object Driver: TEdit
      Left = 96
      Top = 0
      Width = 185
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupInput2: TGroupBox
    Left = 344
    Top = 8
    Width = 171
    Height = 145
    TabOrder = 0
    object Label6: TLabel
      Left = 23
      Top = 40
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'KIR'
    end
    object Label7: TLabel
      Left = 23
      Top = 64
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'KIU'
    end
    object Label8: TLabel
      Left = 12
      Top = 16
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'STNK'
    end
    object Label9: TLabel
      Left = 27
      Top = 88
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = 'KP'
    end
    object Label10: TLabel
      Left = 19
      Top = 112
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tera'
    end
    object Label25: TLabel
      Left = 41
      Top = 12
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object KIU: TMaskEdit
      Left = 48
      Top = 64
      Width = 81
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = KIUKeyPress
    end
    object KIO: TMaskEdit
      Left = 48
      Top = 88
      Width = 81
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnKeyPress = KIOKeyPress
    end
    object Tera: TMaskEdit
      Left = 48
      Top = 112
      Width = 81
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnKeyPress = TeraKeyPress
    end
    object KIR: TMaskEdit
      Left = 48
      Top = 40
      Width = 81
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnKeyPress = KIRKeyPress
    end
    object STNK: TMaskEdit
      Left = 48
      Top = 16
      Width = 81
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnKeyPress = STNKKeyPress
    end
  end
  object Simpan: TButton
    Left = 440
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object GroupRiwayat: TGroupBox
    Left = 8
    Top = 430
    Width = 473
    Height = 109
    Caption = 'Riwayat'
    TabOrder = 3
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 14
      Width = 457
      Height = 92
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 4
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
  object Bersihkan: TButton
    Left = 344
    Top = 393
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 440
    Top = 393
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Perlengkapan: TButton
    Left = 344
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Perlengkapan'
    TabOrder = 5
    OnClick = PerlengkapanClick
  end
  object GroupInput3: TGroupBox
    Left = 344
    Top = 152
    Width = 172
    Height = 205
    TabOrder = 8
    object Label33: TLabel
      Left = 19
      Top = 58
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Router'
    end
    object Label34: TLabel
      Left = 26
      Top = 82
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'SSID'
    end
    object Label35: TLabel
      Left = 7
      Top = 14
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Kartu'
    end
    object Label36: TLabel
      Left = 4
      Top = 102
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Password'
    end
    object Label38: TLabel
      Left = 49
      Top = 10
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label37: TLabel
      Left = 12
      Top = 35
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Operator'
    end
    object Label39: TLabel
      Left = 10
      Top = 124
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Asset'
    end
    object lbl1: TLabel
      Left = 16
      Top = 148
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Catatan'
    end
    object nomsisdn: TEdit
      Left = 58
      Top = 10
      Width = 109
      Height = 21
      TabOrder = 0
    end
    object router: TEdit
      Left = 58
      Top = 54
      Width = 109
      Height = 21
      TabOrder = 1
    end
    object password: TEdit
      Left = 58
      Top = 98
      Width = 109
      Height = 21
      TabOrder = 2
    end
    object ssid: TEdit
      Left = 58
      Top = 76
      Width = 109
      Height = 21
      TabOrder = 3
    end
    object operator: TEdit
      Left = 58
      Top = 32
      Width = 109
      Height = 21
      TabOrder = 4
    end
    object noasset: TEdit
      Left = 58
      Top = 120
      Width = 109
      Height = 21
      TabOrder = 5
    end
    object X1: TMemo
      Left = 58
      Top = 144
      Width = 109
      Height = 57
      Lines.Strings = (
        'X1')
      TabOrder = 6
    end
  end
  object CheckData: TTimer
    Enabled = False
    Interval = 10
    OnTimer = CheckDataTimer
    Left = 488
    Top = 480
  end
end
