object VehicleForm2: TVehicleForm2
  Left = 444
  Top = 126
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Kendaraan'
  ClientHeight = 451
  ClientWidth = 609
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
  object ImgTemp: TImage
    Left = 659
    Top = 24
    Width = 89
    Height = 105
  end
  object GroupInput: TGroupBox
    Left = 8
    Top = 0
    Width = 329
    Height = 433
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 64
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor BPKB'
    end
    object Label2: TLabel
      Left = 17
      Top = 352
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Rangka'
    end
    object Label3: TLabel
      Left = 27
      Top = 328
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Mesin'
    end
    object Label4: TLabel
      Left = 31
      Top = 40
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Polisi'
    end
    object Label5: TLabel
      Left = 1
      Top = 256
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tahun Pembuatan'
    end
    object Label12: TLabel
      Left = 60
      Top = 184
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
      Left = 65
      Top = 208
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Merk'
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
    object Label19: TLabel
      Left = 96
      Top = 204
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
      Top = 252
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
      Top = 36
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
      Top = 180
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
      Top = 300
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
      Top = 348
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
      Left = 25
      Top = 88
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama Pemilik'
    end
    object Label15: TLabel
      Left = 25
      Top = 112
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat STNK'
    end
    object Label17: TLabel
      Left = 96
      Top = 84
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
    object Label26: TLabel
      Left = 96
      Top = 108
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
    object Label27: TLabel
      Left = 96
      Top = 324
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
    object Label28: TLabel
      Left = 42
      Top = 304
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Isi Silinder'
    end
    object Label29: TLabel
      Left = 141
      Top = 304
      Width = 12
      Height = 13
      Caption = 'cc'
    end
    object Label30: TLabel
      Left = 9
      Top = 280
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tahun Registrasi'
    end
    object Label31: TLabel
      Left = 26
      Top = 376
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Warna Dasar'
    end
    object Label32: TLabel
      Left = 96
      Top = 60
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
    object Label25: TLabel
      Left = 52
      Top = 136
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Propinsi'
    end
    object Label33: TLabel
      Left = 9
      Top = 160
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kota/Kotamadya'
    end
    object Label34: TLabel
      Left = 96
      Top = 132
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
    object Label35: TLabel
      Left = 96
      Top = 156
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
    object Label36: TLabel
      Left = 68
      Top = 232
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipe'
    end
    object Label37: TLabel
      Left = 96
      Top = 228
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
    object NoRangka: TEdit
      Left = 104
      Top = 352
      Width = 153
      Height = 21
      TabOrder = 11
      OnKeyPress = NoRangkaKeyPress
    end
    object NoMesin: TEdit
      Left = 104
      Top = 328
      Width = 153
      Height = 21
      TabOrder = 10
      OnKeyPress = NoMesinKeyPress
    end
    object Tahun: TMaskEdit
      Left = 104
      Top = 256
      Width = 33
      Height = 21
      EditMask = '0000;0'
      MaxLength = 4
      TabOrder = 7
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
    object NoBPKB: TEdit
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = NoBPKBKeyPress
    end
    object NoPolisi: TEdit
      Left = 104
      Top = 40
      Width = 73
      Height = 21
      TabOrder = 1
      OnEnter = NoPolisiEnter
      OnExit = NoPolisiExit
      OnKeyPress = NoPolisiKeyPress
    end
    object Jenis: TComboBox
      Left = 104
      Top = 208
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = JenisChange
      OnKeyPress = JenisKeyPress
    end
    object Group: TComboBox
      Left = 104
      Top = 184
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = GroupChange
      OnKeyPress = GroupKeyPress
    end
    object Nama: TEdit
      Left = 104
      Top = 88
      Width = 217
      Height = 21
      TabOrder = 3
      OnKeyPress = NamaKeyPress
    end
    object Alamat: TEdit
      Left = 104
      Top = 112
      Width = 217
      Height = 21
      TabOrder = 4
      OnKeyPress = AlamatKeyPress
    end
    object Slinder: TMaskEdit
      Left = 104
      Top = 304
      Width = 33
      Height = 21
      EditMask = '0000;0'
      MaxLength = 4
      TabOrder = 9
      OnKeyPress = SlinderKeyPress
    end
    object TahunReg: TMaskEdit
      Left = 104
      Top = 280
      Width = 33
      Height = 21
      EditMask = '0000;0'
      MaxLength = 4
      TabOrder = 8
      OnKeyPress = TahunRegKeyPress
    end
    object Warna: TEdit
      Left = 104
      Top = 376
      Width = 89
      Height = 21
      TabOrder = 12
      OnKeyPress = WarnaKeyPress
    end
    object Propinsi: TComboBox
      Left = 104
      Top = 136
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 13
      OnChange = PropinsiChange
      OnKeyPress = PropinsiKeyPress
    end
    object Kotamadya: TComboBox
      Left = 104
      Top = 160
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 14
      OnKeyPress = KotamadyaKeyPress
    end
    object Tipe: TComboBox
      Left = 104
      Top = 232
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 15
      OnKeyPress = TipeKeyPress
    end
  end
  object GroupInput2: TGroupBox
    Left = 344
    Top = 8
    Width = 161
    Height = 145
    TabOrder = 1
    object Label6: TLabel
      Left = 47
      Top = 40
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'KIR'
    end
    object Label7: TLabel
      Left = 47
      Top = 64
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'KIU'
    end
    object Label8: TLabel
      Left = 6
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pajak STNK'
    end
    object Label9: TLabel
      Left = 47
      Top = 88
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'KIO'
    end
    object Label10: TLabel
      Left = 43
      Top = 112
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tera'
    end
    object KIU: TMaskEdit
      Left = 72
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
      Left = 72
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
      Left = 72
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
      Left = 72
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
      Left = 72
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
    Left = 400
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 400
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 400
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object GroupDoc: TGroupBox
    Left = 512
    Top = 8
    Width = 89
    Height = 281
    Caption = 'eFile'
    TabOrder = 5
    object Doc2: TButton
      Left = 6
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Ansuransi'
      TabOrder = 0
      OnClick = Doc2Click
    end
    object Doc1: TButton
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'STNK'
      TabOrder = 1
      OnClick = Doc1Click
    end
    object Doc3: TButton
      Left = 6
      Top = 80
      Width = 75
      Height = 25
      Caption = 'KTP Pemilik'
      TabOrder = 2
      OnClick = Doc3Click
    end
    object Doc4: TButton
      Left = 7
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Surat BN'
      TabOrder = 3
      OnClick = Doc4Click
    end
    object Doc5: TButton
      Left = 7
      Top = 144
      Width = 75
      Height = 25
      Caption = 'KEUR'
      TabOrder = 4
      OnClick = Doc5Click
    end
    object Doc6: TButton
      Left = 8
      Top = 176
      Width = 75
      Height = 25
      Caption = 'KIU KP'
      TabOrder = 5
      OnClick = Doc6Click
    end
    object Doc7: TButton
      Left = 8
      Top = 208
      Width = 75
      Height = 25
      Caption = 'S.Ket. Parkir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Doc7Click
    end
    object Doc8: TButton
      Left = 7
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Surat 8'
      TabOrder = 7
      OnClick = Doc8Click
    end
  end
  object PanelDriver: TPanel
    Left = 16
    Top = 397
    Width = 313
    Height = 27
    BevelOuter = bvNone
    Caption = 'PanelDriver'
    TabOrder = 6
    object Label18: TLabel
      Left = 28
      Top = 4
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pengemudi'
    end
    object CariDriver: TSpeedButton
      Left = 282
      Top = 2
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
      Top = 4
      Width = 185
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = WarnaKeyPress
    end
  end
  object SetDriver: TButton
    Left = 400
    Top = 160
    Width = 73
    Height = 25
    Caption = 'Pengemudi'
    TabOrder = 7
    OnClick = SetDriverClick
  end
end
