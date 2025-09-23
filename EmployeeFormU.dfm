object EmployeeForm: TEmployeeForm
  Left = 575
  Top = 38
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Karyawan'
  ClientHeight = 611
  ClientWidth = 511
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImgTemp: TImage
    Left = 592
    Top = 384
    Width = 89
    Height = 105
    OnDblClick = FotoDblClick
  end
  object Label29: TLabel
    Left = 592
    Top = 364
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
  object Vehicle: TButton
    Left = 576
    Top = 129
    Width = 91
    Height = 25
    Caption = 'Kendaraan'
    TabOrder = 2
    OnClick = VehicleClick
  end
  object Family: TButton
    Left = 560
    Top = 41
    Width = 91
    Height = 25
    Caption = 'Keluarga'
    TabOrder = 1
    OnClick = FamilyClick
  end
  object Emergency: TButton
    Left = 576
    Top = 89
    Width = 91
    Height = 25
    Caption = 'No Darurat'
    TabOrder = 3
    OnClick = EmergencyClick
  end
  object ArgoPendapatan: TButton
    Left = 571
    Top = 187
    Width = 91
    Height = 25
    Caption = 'Argo-Pendapatan'
    TabOrder = 0
    OnClick = ArgoPendapatanClick
  end
  object PanelArmada: TPanel
    Left = -375
    Top = 312
    Width = 369
    Height = 24
    BevelOuter = bvNone
    TabOrder = 4
    object Label33: TLabel
      Left = -301
      Top = -3
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
      Visible = False
    end
    object CariDriver: TSpeedButton
      Left = -143
      Top = -6
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
      Visible = False
      OnClick = CariDriverClick
    end
    object Label34: TLabel
      Left = -94
      Top = -2
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rating'
    end
    object NoPolisi: TEdit
      Left = -249
      Top = -6
      Width = 105
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object RatingInt: TEdit
      Left = -68
      Top = -5
      Width = 65
      Height = 21
      TabOrder = 1
      Visible = False
      OnKeyPress = RatingIntKeyPress
    end
  end
  object pgDataKaryawan: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 566
    ActivePage = TabIdentitas
    Align = alClient
    MultiLine = True
    TabOrder = 5
    object TabIdentitas: TTabSheet
      Caption = 'Identitas'
      object GroupNonInput: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 43
        Align = alTop
        TabOrder = 0
        object LabelId: TLabel
          Left = 68
          Top = 43
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'No KPP'
        end
        object Label15: TLabel
          Left = 242
          Top = 46
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Berlaku s/d'
        end
        object Label47: TLabel
          Left = 11
          Top = 14
          Width = 18
          Height = 13
          Caption = 'NIK'
        end
        object Label53: TLabel
          Left = 31
          Top = 13
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
        object Label68: TLabel
          Left = 302
          Top = 1
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
        object NoKPPExpired: TMaskEdit
          Left = 305
          Top = 46
          Width = 71
          Height = 21
          TabStop = False
          EditMask = '90/90/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object NikKaryawan: TEdit
          Left = 40
          Top = 12
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object StatusKaryawan: TRadioGroup
          Left = 210
          Top = 10
          Width = 281
          Height = 30
          Caption = 'Status Karyawan'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Kontrak'
            'Tetap'
            'Harian')
          TabOrder = 2
        end
      end
      object GroupInput1: TGroupBox
        Left = 0
        Top = 43
        Width = 503
        Height = 196
        Align = alTop
        Caption = 'Identitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 74
          Top = 84
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nama'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 21
          Top = 128
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tempat/Tgl Lahir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 238
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
        object Label8: TLabel
          Left = 297
          Top = 104
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agama'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 29
          Top = 34
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tanggal Masuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 71
          Top = 10
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lokasi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelKPPLama: TLabel
          Left = -232
          Top = 261
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'No KPP Lama'
          Visible = False
        end
        object Label22: TLabel
          Left = 385
          Top = 274
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sumber Referensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object LabelReferensi: TLabel
          Left = -244
          Top = 241
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'No KPP Sumber'
          Visible = False
        end
        object Label13: TLabel
          Left = 64
          Top = 60
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'No KTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Cari: TSpeedButton
          Left = -38
          Top = 237
          Width = 23
          Height = 22
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
          Visible = False
          OnClick = CariClick
        end
        object Label10: TLabel
          Left = 104
          Top = 30
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
          Left = 333
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
        object Label23: TLabel
          Left = 104
          Top = 124
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
          Top = 79
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
          Top = 8
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 543
          Top = 57
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Berlaku s/d'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label37: TLabel
          Left = 204
          Top = 35
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Id Absen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 360
          Top = 132
          Width = 48
          Height = 13
          Caption = 'Gol Darah'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 201
          Top = 155
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status Menikah'
        end
        object Label45: TLabel
          Left = 16
          Top = 156
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status Pernikahan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 325
          Top = 154
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'Anak'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
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
        object Label48: TLabel
          Left = 105
          Top = 152
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
        object Label49: TLabel
          Left = 73
          Top = 175
          Width = 33
          Height = 13
          Caption = 'NPWP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 267
          Top = 174
          Width = 25
          Height = 13
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label60: TLabel
          Left = 249
          Top = 59
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'No KK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 302
          Top = 11
          Width = 61
          Height = 13
          Caption = 'ID Karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 104
          Top = 56
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
        object Label66: TLabel
          Left = 324
          Top = 34
          Width = 29
          Height = 13
          Caption = 'Tinggi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 414
          Top = 35
          Width = 28
          Height = 13
          Caption = 'Berat '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cm: TLabel
          Left = 386
          Top = 34
          Width = 14
          Height = 13
          Caption = 'cm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object kg: TLabel
          Left = 475
          Top = 36
          Width = 12
          Height = 13
          Caption = 'kg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Nama: TEdit
          Left = 112
          Top = 80
          Width = 377
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = NamaKeyPress
        end
        object TempatLahir: TEdit
          Left = 112
          Top = 128
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnKeyPress = TempatLahirKeyPress
        end
        object Agama: TComboBox
          Left = 341
          Top = 104
          Width = 41
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 6
          OnChange = AgamaChange
          OnKeyPress = AgamaKeyPress
        end
        object AgamaDisp: TEdit
          Left = 384
          Top = 104
          Width = 105
          Height = 21
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object TglGabung: TDateTimePicker
          Left = 112
          Top = 32
          Width = 89
          Height = 21
          Date = 41192.000000000000000000
          Time = 41192.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          OnKeyPress = TglGabungKeyPress
        end
        object TglLahir: TDateTimePicker
          Left = 250
          Top = 128
          Width = 89
          Height = 21
          Date = 41192.934186550920000000
          Time = 41192.934186550920000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnKeyPress = TglLahirKeyPress
        end
        object KPPReferensi: TEdit
          Left = -142
          Top = 259
          Width = 113
          Height = 21
          TabOrder = 9
          Visible = False
          OnKeyPress = KPPReferensiKeyPress
        end
        object Referensi: TComboBox
          Left = 479
          Top = 270
          Width = 145
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 7
          Visible = False
          OnChange = ReferensiChange
          OnKeyPress = ReferensiKeyPress
        end
        object ReferensiDisp: TEdit
          Left = 623
          Top = 270
          Width = 121
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = False
        end
        object ReferensiId: TEdit
          Left = -142
          Top = 237
          Width = 105
          Height = 21
          TabOrder = 8
          Visible = False
          OnKeyPress = ReferensiIdKeyPress
        end
        object NoKTP: TEdit
          Left = 111
          Top = 56
          Width = 130
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = NoKTPExit
          OnKeyPress = NoKTPKeyPress
        end
        object SBU: TComboBox
          Left = 112
          Top = 8
          Width = 161
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 12
        end
        object Panel1: TPanel
          Left = 112
          Top = 102
          Width = 185
          Height = 25
          BevelOuter = bvNone
          TabOrder = 3
          object Gentleman: TRadioButton
            Left = 0
            Top = 4
            Width = 73
            Height = 17
            Caption = 'Laki-Laki'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Ladies: TRadioButton
            Left = 68
            Top = 4
            Width = 81
            Height = 17
            Caption = 'Perempuan'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object NoKTPExpired: TDateTimePicker
          Left = 605
          Top = 53
          Width = 81
          Height = 21
          Date = 41210.000000000000000000
          Time = 41210.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = False
          OnKeyPress = NoSIMExpiredKeyPress
        end
        object IdAbsen: TEdit
          Left = 250
          Top = 32
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnKeyPress = RatingIntKeyPress
        end
        object GolDarah: TComboBox
          Left = 416
          Top = 130
          Width = 73
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 15
          Items.Strings = (
            'A'
            'B'
            'AB'
            'O')
        end
        object StatusPanel: TPanel
          Left = 112
          Top = 151
          Width = 209
          Height = 17
          BevelOuter = bvNone
          TabOrder = 16
          object StatusSingle: TRadioButton
            Left = 0
            Top = 2
            Width = 92
            Height = 17
            Caption = 'Belum Menikah'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnKeyPress = StatusSingleKeyPress
          end
          object StatusMenikah: TRadioButton
            Left = 95
            Top = 2
            Width = 65
            Height = 17
            Caption = 'Menikah'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnKeyPress = StatusMenikahKeyPress
          end
          object StatusCerai: TRadioButton
            Left = 159
            Top = 2
            Width = 49
            Height = 17
            Caption = 'Cerai'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnKeyPress = StatusCeraiKeyPress
          end
        end
        object Anak: TMaskEdit
          Left = 353
          Top = 152
          Width = 28
          Height = 21
          EditMask = '99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 17
          Text = '  '
          OnKeyPress = AnakKeyPress
        end
        object NPWP: TEdit
          Left = 111
          Top = 172
          Width = 138
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Text = '88.336.818.5-543.000'
        end
        object Email: TEdit
          Left = 297
          Top = 171
          Width = 192
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object NoKK: TEdit
          Left = 288
          Top = 56
          Width = 133
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object IdKaryawan: TEdit
          Left = 369
          Top = 9
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 21
        end
        object Tinggi: TEdit
          Left = 356
          Top = 32
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Text = '999'
        end
        object Berat: TEdit
          Left = 443
          Top = 33
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Text = '999'
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 239
        Width = 503
        Height = 147
        Align = alTop
        Caption = 'Alamat && No Telpon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label3: TLabel
          Left = 32
          Top = 21
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Alamat KTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 92
          Top = 16
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
          Left = 9
          Top = 81
          Width = 81
          Height = 13
          Caption = 'Alamat Sekarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 91
          Top = 75
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
        object Label4: TLabel
          Left = 369
          Top = 122
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'NoTelp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 47
          Top = 125
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'No HP 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 89
          Top = 120
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
        object lbl3: TLabel
          Left = 204
          Top = 124
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'No HP 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Alamat: TMemo
          Left = 101
          Top = 16
          Width = 387
          Height = 41
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object SamaKTP: TCheckBox
          Left = 101
          Top = 57
          Width = 111
          Height = 17
          Caption = 'Sama dengan KTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = SamaKTPClick
        end
        object AlamatSekarang: TMemo
          Left = 100
          Top = 76
          Width = 389
          Height = 41
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object NoTelp: TMaskEdit
          Left = 411
          Top = 119
          Width = 81
          Height = 21
          EditMask = '999-99999999;0;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 3
          OnKeyPress = NoTelpKeyPress
        end
        object NoHP: TMaskEdit
          Left = 100
          Top = 120
          Width = 91
          Height = 21
          EditMask = '99999999999999;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 4
          OnKeyPress = NoHPKeyPress
        end
        object NoHP2: TMaskEdit
          Left = 250
          Top = 120
          Width = 93
          Height = 21
          EditMask = '99999999999999;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 5
          OnChange = NoHP2Change
          OnKeyPress = NoHPKeyPress
        end
      end
      object GroupInputSimdanETol: TGroupBox
        Left = 0
        Top = 386
        Width = 503
        Height = 87
        Align = alTop
        Caption = 'SIM && E-Tol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label24: TLabel
          Left = 58
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
        object Label9: TLabel
          Left = 172
          Top = 18
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'No SIM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 211
          Top = 13
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
        object LabelShift: TLabel
          Left = 74
          Top = 177
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Shift'
        end
        object LabelReguler: TLabel
          Left = 57
          Top = 197
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Armada'
        end
        object Label14: TLabel
          Left = 335
          Top = 18
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Berlaku s/d'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 429
          Top = 186
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
        object Label44: TLabel
          Left = 12
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Jenis SIM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 394
          Top = 14
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
        object SIM: TComboBox
          Left = 66
          Top = 15
          Width = 41
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = SIMChange
          OnKeyPress = SIMKeyPress
        end
        object SIMDisp: TEdit
          Left = 109
          Top = 15
          Width = 56
          Height = 21
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object NoSIM: TEdit
          Left = 219
          Top = 16
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = NoSIMKeyPress
        end
        object PanelShift: TPanel
          Left = 112
          Top = 175
          Width = 217
          Height = 17
          BevelOuter = bvNone
          TabOrder = 3
          object ShiftPagi: TRadioButton
            Left = 0
            Top = 0
            Width = 49
            Height = 17
            Caption = 'Pagi'
            TabOrder = 0
            OnKeyPress = ShiftPagiKeyPress
          end
          object ShiftMalam: TRadioButton
            Left = 144
            Top = 0
            Width = 57
            Height = 17
            Caption = 'Malam'
            TabOrder = 2
            OnKeyPress = ShiftMalamKeyPress
          end
          object ShiftSiang: TRadioButton
            Left = 72
            Top = -3
            Width = 57
            Height = 17
            Caption = 'Siang'
            TabOrder = 1
            OnKeyPress = ShiftSiangKeyPress
          end
        end
        object PanelReguler: TPanel
          Left = 112
          Top = 196
          Width = 225
          Height = 17
          BevelOuter = bvNone
          TabOrder = 4
          object Eksekutif: TRadioButton
            Left = 0
            Top = 0
            Width = 73
            Height = 17
            Caption = 'Eksekutif'
            TabOrder = 0
            OnKeyPress = EksekutifKeyPress
          end
          object Reguler: TRadioButton
            Left = 144
            Top = 0
            Width = 57
            Height = 17
            Caption = 'Reguler'
            TabOrder = 1
            OnKeyPress = RegulerKeyPress
          end
        end
        object NoSIMExpired: TDateTimePicker
          Left = 405
          Top = 16
          Width = 89
          Height = 21
          Date = 41210.000000000000000000
          Time = 41210.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnKeyPress = NoSIMExpiredKeyPress
        end
        object NoHPimei: TEdit
          Left = 440
          Top = 184
          Width = 73
          Height = 21
          Enabled = False
          TabOrder = 6
          Visible = False
        end
        object grpGroupEtoll: TGroupBox
          Left = 11
          Top = 43
          Width = 483
          Height = 39
          Caption = ' Nomor E-Toll '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object lbl1: TLabel
            Left = 184
            Top = 17
            Width = 18
            Height = 13
            Caption = 'Cari'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object CariNoEtoll: TEdit
            Left = 208
            Top = 13
            Width = 169
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = CariNoEtollChange
          end
          object NoEtoll: TComboBox
            Left = 6
            Top = 14
            Width = 174
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object Simpan3: TButton
            Left = 395
            Top = 8
            Width = 81
            Height = 26
            Caption = 'Simpan'
            TabOrder = 2
            OnClick = Simpan3Click
          end
        end
      end
      object GroupRekening: TGroupBox
        Left = 0
        Top = 473
        Width = 503
        Height = 62
        Align = alTop
        Caption = ' Rekening   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14710601
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label35: TLabel
          Left = 206
          Top = 39
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'No'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 32
          Top = 18
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nama'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 6
          Top = 40
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nama Bank'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 70
          Top = -1
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
        object AccountNo: TEdit
          Left = 228
          Top = 37
          Width = 133
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = AccountNoKeyPress
        end
        object AccountName: TEdit
          Left = 68
          Top = 14
          Width = 205
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = AccountNameKeyPress
        end
        object Bank: TComboBox
          Left = 69
          Top = 37
          Width = 132
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 2
          Items.Strings = (
            'BCA'
            'PANIN')
        end
      end
    end
    object TabPekerjaan: TTabSheet
      Caption = 'Pekerjaan'
      ImageIndex = 1
      object GroupBox6: TGroupBox
        Left = 0
        Top = 89
        Width = 503
        Height = 91
        Align = alTop
        Caption = 'Pekerjaan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label32: TLabel
          Left = 31
          Top = 17
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Departemen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 62
          Top = 42
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Level'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 62
          Top = 66
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Posisi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label69: TLabel
          Left = 92
          Top = 15
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
        object Label70: TLabel
          Left = 92
          Top = 39
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
        object Label71: TLabel
          Left = 92
          Top = 63
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
        object Departemen: TComboBox
          Left = 102
          Top = 14
          Width = 282
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          ParentFont = False
          TabOrder = 0
        end
        object Level: TComboBox
          Left = 102
          Top = 38
          Width = 282
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
          Items.Strings = (
            'Commissioner'
            'Director'
            'Executive Manager'
            'Manager'
            'Assistant Manager'
            'Supervisor'
            'Staff'
            'Non Staff')
        end
        object Posisi: TEdit
          Left = 102
          Top = 62
          Width = 281
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 89
        Align = alTop
        Caption = 'Pendidikan Terakhir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label5: TLabel
          Left = 5
          Top = 22
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pendidikan Terakhir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 60
          Top = 68
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Jurusan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label62: TLabel
          Left = 362
          Top = 22
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tahun Lulus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 216
          Top = 20
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tahun Masuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 44
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Institusi Pendidikan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 405
          Top = 45
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'IPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object PendidikanTerakhir: TComboBox
          Left = 102
          Top = 19
          Width = 39
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          ParentFont = False
          TabOrder = 0
          OnChange = PendidikanTerakhirChange
          OnKeyPress = PendidikanTerakhirKeyPress
        end
        object PendidikanTerakhirDisp: TEdit
          Left = 144
          Top = 19
          Width = 65
          Height = 21
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Jurusan: TEdit
          Left = 102
          Top = 64
          Width = 388
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = TempatLahirKeyPress
        end
        object TahunKelulusan: TEdit
          Left = 425
          Top = 18
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object TahunMasuk: TEdit
          Left = 285
          Top = 18
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object InstitusiPendidikan: TEdit
          Left = 102
          Top = 41
          Width = 209
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnKeyPress = InstitusiPendidikanKeyPress
        end
        object ipk: TEdit
          Left = 425
          Top = 41
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
      end
      object GroupBox9: TGroupBox
        Left = 0
        Top = 192
        Width = 503
        Height = 225
        Caption = 'Kontrak Kerja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object StrGridKontrak: TZColorStringGrid
          Left = 8
          Top = 20
          Width = 488
          Height = 197
          ColCount = 4
          DefaultRowHeight = 19
          DefaultDrawing = False
          FixedColor = clBtnFace
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
          ParentFont = False
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
    end
    object TabAsuransi: TTabSheet
      Caption = 'Asuransi'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 123
        Align = alTop
        Caption = 'Asuransi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label18: TLabel
          Left = 7
          Top = 20
          Width = 64
          Height = 13
          Caption = 'No BPJS Kes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 6
          Top = 73
          Width = 62
          Height = 13
          Caption = 'No BPJS Ket'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 213
          Top = 17
          Width = 65
          Height = 13
          Caption = 'Tgl BPJS Kes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 214
          Top = 74
          Width = 63
          Height = 13
          Caption = 'Tgl BPJS Ket'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 6
          Top = 98
          Width = 70
          Height = 13
          Caption = 'NPP BPJS Ket'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BpjsKes: TEdit
          Left = 81
          Top = 15
          Width = 128
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object BpjsKet: TEdit
          Left = 82
          Top = 71
          Width = 127
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DateBPJSKes: TDateTimePicker
          Left = 282
          Top = 14
          Width = 85
          Height = 21
          Date = 41210.000000000000000000
          Time = 41210.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = NoSIMExpiredKeyPress
        end
        object DateBpjsKet: TDateTimePicker
          Left = 284
          Top = 71
          Width = 84
          Height = 21
          Date = 41210.000000000000000000
          Time = 41210.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyPress = NoSIMExpiredKeyPress
        end
        object Nppbpjsket: TEdit
          Left = 82
          Top = 96
          Width = 127
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object TabLampiran: TTabSheet
      Caption = 'Lampiran'
      ImageIndex = 3
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 163
        Align = alTop
        Caption = 'Lampiran'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object GroupFoto: TGroupBox
          Left = 14
          Top = 15
          Width = 110
          Height = 105
          Caption = 'Foto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Foto: TImage
            Left = 8
            Top = 16
            Width = 93
            Height = 73
            OnDblClick = FotoDblClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 135
          Top = 15
          Width = 110
          Height = 105
          Caption = 'Kartu Keluarga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object FotoKK: TImage
            Left = 8
            Top = 17
            Width = 95
            Height = 72
            OnDblClick = FotoKKDblClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 259
          Top = 15
          Width = 110
          Height = 105
          Caption = 'KTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object FotoKTP: TImage
            Left = 7
            Top = 18
            Width = 96
            Height = 72
            OnDblClick = FotoKTPDblClick
          end
        end
        object GroupSIM: TGroupBox
          Left = 382
          Top = 15
          Width = 110
          Height = 105
          Caption = 'SIM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object FotoSIM: TImage
            Left = 8
            Top = 21
            Width = 95
            Height = 72
            OnDblClick = FotoSIMDblClick
          end
        end
      end
      object Panel2: TPanel
        Left = 14
        Top = 123
        Width = 478
        Height = 34
        TabOrder = 1
      end
    end
    object TabKontakDarurat: TTabSheet
      Caption = 'Kontak Darurat'
      ImageIndex = 4
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 69
        Align = alTop
        Caption = 'Kontak Dalam Keadaan Darurat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label41: TLabel
          Left = 194
          Top = 44
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'No HP Darurat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 42
          Top = 19
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nama'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 20
          Top = 43
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hubungan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object NoHPEmergency: TMaskEdit
          Left = 268
          Top = 41
          Width = 93
          Height = 21
          EditMask = '99999999999999;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 0
        end
        object NamaKontakDarurat: TEdit
          Left = 76
          Top = 16
          Width = 285
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object HubunganKontDarurat: TEdit
          Left = 76
          Top = 40
          Width = 109
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object TabMutasi: TTabSheet
      Caption = 'Mutasi'
      ImageIndex = 5
      object HistoryPanel: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 311
        Align = alTop
        Caption = 'Mutasi'
        TabOrder = 0
        object StrGrid: TZColorStringGrid
          Left = 8
          Top = 16
          Width = 505
          Height = 281
          ColCount = 6
          DefaultRowHeight = 19
          DefaultDrawing = False
          FixedColor = clBtnFace
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
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
      object GrpRiwayat: TGroupBox
        Left = 0
        Top = 311
        Width = 503
        Height = 57
        Align = alTop
        Caption = 'Riwayat'
        TabOrder = 1
        object HistoryCPCustomer: TButton
          Left = 336
          Top = 19
          Width = 105
          Height = 25
          Caption = 'Customer Complain'
          TabOrder = 0
          OnClick = HistoryCPCustomerClick
        end
        object Riwayat: TButton
          Left = 9
          Top = 20
          Width = 104
          Height = 25
          Caption = 'Riwayat'
          TabOrder = 1
          OnClick = RiwayatClick
        end
        object btnHistoryLaKA: TButton
          Left = 118
          Top = 20
          Width = 105
          Height = 25
          Caption = 'LaKa'
          TabOrder = 2
          OnClick = btnHistoryLaKAClick
        end
        object btTraining: TButton
          Left = 226
          Top = 20
          Width = 105
          Height = 25
          Caption = 'Training'
          TabOrder = 3
          OnClick = btTrainingClick
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 566
    Width = 511
    Height = 45
    Align = alBottom
    TabOrder = 6
    object Selesai: TButton
      Left = 288
      Top = 10
      Width = 83
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = SelesaiClick
    end
    object Simpan: TButton
      Left = 177
      Top = 11
      Width = 84
      Height = 25
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = SimpanClick
    end
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerCheckTimer
    Left = 623
    Top = 304
  end
end
