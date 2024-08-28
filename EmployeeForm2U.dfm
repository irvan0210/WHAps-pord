object EmployeeForm2: TEmployeeForm2
  Left = 466
  Top = 182
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Mitra'
  ClientHeight = 374
  ClientWidth = 515
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
  object Label29: TLabel
    Left = 312
    Top = 348
    Width = 76
    Height = 16
    Caption = '*  Harus Diisi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupFoto: TGroupBox
    Left = 400
    Top = 0
    Width = 105
    Height = 129
    Caption = 'Foto'
    TabOrder = 4
    object Foto: TImage
      Left = 8
      Top = 16
      Width = 89
      Height = 105
      OnDblClick = FotoDblClick
    end
  end
  object GroupSIM: TGroupBox
    Left = 400
    Top = 128
    Width = 105
    Height = 81
    Caption = 'SIM'
    TabOrder = 5
    object FotoSIM: TImage
      Left = 8
      Top = 16
      Width = 89
      Height = 57
      OnDblClick = FotoSIMDblClick
    end
  end
  object GroupInput1: TGroupBox
    Left = 8
    Top = 32
    Width = 385
    Height = 313
    Caption = 'Utama'
    TabOrder = 1
    object Label1: TLabel
      Left = 74
      Top = 80
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label2: TLabel
      Left = 62
      Top = 128
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tgl Lahir'
    end
    object Label17: TLabel
      Left = 137
      Top = 123
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
    object Label11: TLabel
      Left = 29
      Top = 32
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Masuk'
    end
    object Label19: TLabel
      Left = 71
      Top = 8
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi'
    end
    object Label13: TLabel
      Left = 65
      Top = 56
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No KTP'
    end
    object Label10: TLabel
      Left = 104
      Top = 28
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
      Left = 104
      Top = 76
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
    object Label30: TLabel
      Left = 104
      Top = 6
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
    object Label16: TLabel
      Left = 38
      Top = 104
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jenis Kelamin'
    end
    object Label3: TLabel
      Left = 70
      Top = 152
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label4: TLabel
      Left = 47
      Top = 177
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'NoTelp/HP'
    end
    object Label18: TLabel
      Left = 211
      Top = 174
      Width = 5
      Height = 24
      Alignment = taRightJustify
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 65
      Top = 225
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'No SIM'
    end
    object Label25: TLabel
      Left = 101
      Top = 219
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
    object Label14: TLabel
      Left = 225
      Top = 229
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Berlaku s/d'
    end
    object Label26: TLabel
      Left = 280
      Top = 222
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
    object Label5: TLabel
      Left = 218
      Top = 171
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
      Left = 80
      Top = 201
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'SIM'
    end
    object Label6: TLabel
      Left = 101
      Top = 195
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
    object Label8: TLabel
      Left = 104
      Top = 100
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
    object Label12: TLabel
      Left = 103
      Top = 123
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
    object Label7: TLabel
      Left = 74
      Top = 249
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'e-mail'
    end
    object Nama: TEdit
      Left = 112
      Top = 80
      Width = 161
      Height = 21
      TabOrder = 3
      OnKeyPress = NamaKeyPress
    end
    object TglGabung: TDateTimePicker
      Left = 112
      Top = 32
      Width = 89
      Height = 21
      Date = 41192.000000000000000000
      Time = 41192.000000000000000000
      TabOrder = 1
      TabStop = False
      OnKeyPress = TglGabungKeyPress
    end
    object TglLahir: TDateTimePicker
      Left = 112
      Top = 128
      Width = 89
      Height = 21
      Date = 41192.934186550920000000
      Time = 41192.934186550920000000
      TabOrder = 5
      OnKeyPress = TglLahirKeyPress
    end
    object NoKTP: TEdit
      Left = 112
      Top = 56
      Width = 113
      Height = 21
      TabOrder = 2
      OnKeyPress = NoKTPKeyPress
    end
    object SBU: TComboBox
      Left = 112
      Top = 8
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object PanelJenisKelamin: TPanel
      Left = 112
      Top = 102
      Width = 185
      Height = 25
      BevelOuter = bvNone
      TabOrder = 4
      object Gentleman: TRadioButton
        Left = 0
        Top = 4
        Width = 73
        Height = 17
        Caption = 'Laki-Laki'
        TabOrder = 0
        OnKeyPress = GentlemanKeyPress
      end
      object Ladies: TRadioButton
        Left = 96
        Top = 4
        Width = 81
        Height = 17
        Caption = 'Perempuan'
        TabOrder = 1
        OnKeyPress = LadiesKeyPress
      end
    end
    object Alamat: TEdit
      Left = 112
      Top = 152
      Width = 265
      Height = 21
      TabOrder = 6
      OnKeyPress = AlamatKeyPress
    end
    object NoTelp: TMaskEdit
      Left = 112
      Top = 176
      Width = 89
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 7
      OnKeyPress = NoTelpKeyPress
    end
    object NoHP: TMaskEdit
      Left = 224
      Top = 176
      Width = 153
      Height = 21
      EditMask = '99999999999999/99999999999999;1;_'
      MaxLength = 29
      TabOrder = 8
      Text = '              /              '
      OnKeyPress = NoHPKeyPress
    end
    object NoSIM: TEdit
      Left = 112
      Top = 224
      Width = 105
      Height = 21
      TabOrder = 10
      OnKeyPress = NoSIMKeyPress
    end
    object NoSIMExpired: TDateTimePicker
      Left = 288
      Top = 224
      Width = 89
      Height = 21
      Date = 41210.000000000000000000
      Time = 41210.000000000000000000
      TabOrder = 11
      OnKeyPress = NoSIMExpiredKeyPress
    end
    object SIM: TComboBox
      Left = 112
      Top = 200
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnKeyPress = SIMKeyPress
    end
    object email: TEdit
      Left = 112
      Top = 248
      Width = 265
      Height = 21
      TabOrder = 12
      OnKeyPress = emailKeyPress
    end
  end
  object GroupNonInput: TGroupBox
    Left = 8
    Top = 0
    Width = 385
    Height = 33
    Enabled = False
    TabOrder = 0
    object LabelId: TLabel
      Left = 77
      Top = 8
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'No ID'
    end
    object IdKaryawan: TEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object Emergency: TButton
    Left = 406
    Top = 280
    Width = 91
    Height = 25
    Caption = 'No Darurat'
    TabOrder = 10
    OnClick = EmergencyClick
  end
  object ArgoPendapatan: TButton
    Left = 406
    Top = 248
    Width = 91
    Height = 25
    Caption = 'Argo-Pendapatan'
    TabOrder = 7
    OnClick = ArgoPendapatanClick
  end
  object Simpan: TButton
    Left = 406
    Top = 280
    Width = 91
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 408
    Top = 344
    Width = 89
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object GetData: TButton
    Left = 406
    Top = 216
    Width = 91
    Height = 25
    Caption = 'Tarik data'
    TabOrder = 11
    OnClick = GetDataClick
  end
  object PanelArmada: TPanel
    Left = 16
    Top = 304
    Width = 369
    Height = 31
    BevelOuter = bvNone
    TabOrder = 12
    object Label15: TLabel
      Left = 52
      Top = 2
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object CariDriver: TSpeedButton
      Left = 210
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
    object NoPolisi: TEdit
      Left = 104
      Top = 2
      Width = 105
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Bersihkan: TButton
    Left = 406
    Top = 312
    Width = 91
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 13
    OnClick = BersihkanClick
  end
  object Family: TButton
    Left = 406
    Top = 248
    Width = 91
    Height = 25
    Caption = 'Keluarga'
    TabOrder = 8
    OnClick = FamilyClick
  end
  object Riwayat: TButton
    Left = 406
    Top = 216
    Width = 91
    Height = 25
    Caption = 'Riwayat'
    TabOrder = 6
    OnClick = RiwayatClick
  end
  object Vehicle: TButton
    Left = 406
    Top = 248
    Width = 91
    Height = 25
    Caption = 'Kendaraan'
    TabOrder = 9
    OnClick = VehicleClick
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 10
    Left = 24
    Top = 8
  end
end
