object TopUpETollForm: TTopUpETollForm
  Left = 467
  Top = 189
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Vehicle Topup Kuota'
  ClientHeight = 235
  ClientWidth = 402
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
  object Label2: TLabel
    Left = 37
    Top = 109
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Topup'
  end
  object Label4: TLabel
    Left = 72
    Top = 82
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nominal'
  end
  object lbl2: TLabel
    Left = 91
    Top = 135
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jam'
  end
  object Label1: TLabel
    Left = 40
    Top = 58
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Surat Jalan'
  end
  object Label3: TLabel
    Left = 108
    Top = 60
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 108
    Top = 84
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 33
    Top = 158
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 47
    Top = 159
    Width = 48
    Height = 13
    Caption = 'Harus diisi'
  end
  object Label9: TLabel
    Left = 107
    Top = 136
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object GroupInput: TPanel
    Left = 121
    Top = 47
    Width = 179
    Height = 107
    BevelOuter = bvNone
    TabOrder = 1
    object btnTombolCari: TSpeedButton
      Left = 147
      Top = 5
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
      OnClick = btnTombolCariClick
    end
    object TopupDate: TDateTimePicker
      Left = 0
      Top = 59
      Width = 85
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 2
    end
    object Nominal: TEdit
      Left = 0
      Top = 33
      Width = 87
      Height = 21
      TabOrder = 1
      OnEnter = NominalEnter
      OnExit = NominalExit
      OnKeyPress = NominalKeyPress
    end
    object TopupTime: TMaskEdit
      Left = 2
      Top = 85
      Width = 41
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
      OnKeyPress = TopupTimeKeyPress
    end
    object NoSJ: TEdit
      Left = 0
      Top = 6
      Width = 145
      Height = 21
      TabOrder = 0
      OnExit = NoSJExit
      OnKeyPress = NoSJKeyPress
    end
    object CekEdit: TCheckBox
      Left = 48
      Top = 87
      Width = 97
      Height = 17
      Caption = 'Edit Jam'
      TabOrder = 4
      OnClick = CekEditClick
    end
  end
  object Simpan: TButton
    Left = 80
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 207
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object GroupGroupEtoll: TGroupBox
    Left = 18
    Top = 8
    Width = 368
    Height = 39
    Caption = ' Nomor E-Toll '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 220
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
    object Label6: TLabel
      Left = 193
      Top = 15
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = ' * '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CariNoEtoll: TEdit
      Left = 248
      Top = 13
      Width = 105
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
      Width = 187
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
  end
  object TrxId: TEdit
    Left = 272
    Top = 86
    Width = 145
    Height = 21
    TabOrder = 4
    Visible = False
    OnEnter = NominalEnter
    OnExit = NominalExit
    OnKeyPress = NominalKeyPress
  end
end
