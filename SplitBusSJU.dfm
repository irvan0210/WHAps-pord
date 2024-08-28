object SplitBusSJ: TSplitBusSJ
  Left = 252
  Top = 170
  BorderStyle = bsNone
  Caption = 'Split KM Jalan Surat Jalan'
  ClientHeight = 348
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 34
    Width = 104
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Surat Jalan Utama'
  end
  object Label3: TLabel
    Left = 112
    Top = 34
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
  object Label4: TLabel
    Left = 67
    Top = 110
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Km Keluar'
  end
  object Label7: TLabel
    Left = 249
    Top = 278
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
    Left = 263
    Top = 279
    Width = 48
    Height = 13
    Caption = 'Harus diisi'
  end
  object Label2: TLabel
    Left = 67
    Top = 134
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Km Masuk'
  end
  object Label12: TLabel
    Left = 38
    Top = 62
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Customer'
  end
  object Label13: TLabel
    Left = 72
    Top = 87
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tgl Jalan'
  end
  object Label14: TLabel
    Left = 88
    Top = 158
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jarak'
  end
  object GroupInput: TPanel
    Left = 125
    Top = 25
    Width = 191
    Height = 152
    BevelOuter = bvNone
    TabOrder = 0
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
    object out_odo: TEdit
      Left = 0
      Top = 82
      Width = 87
      Height = 21
      TabOrder = 3
      OnEnter = out_odoEnter
      OnExit = out_odoExit
      OnKeyPress = out_odoKeyPress
    end
    object NoSJ: TEdit
      Left = 0
      Top = 6
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object in_odo: TEdit
      Left = 0
      Top = 106
      Width = 87
      Height = 21
      TabOrder = 4
      OnChange = in_odoChange
      OnEnter = in_odoEnter
      OnExit = in_odoExit
      OnKeyPress = in_odoKeyPress
    end
    object CustomerName: TEdit
      Left = 0
      Top = 33
      Width = 188
      Height = 21
      Color = 12320767
      ReadOnly = True
      TabOrder = 1
    end
    object TglJalan: TEdit
      Left = 0
      Top = 58
      Width = 87
      Height = 21
      Color = 12320767
      ReadOnly = True
      TabOrder = 2
    end
    object jarak: TEdit
      Left = 0
      Top = 130
      Width = 87
      Height = 21
      Color = 12320767
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Simpan: TButton
    Left = 224
    Top = 308
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 579
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 2
    OnClick = BatalClick
  end
  object GroupBox1: TGroupBox
    Left = 334
    Top = 22
    Width = 321
    Height = 278
    Caption = ' Daftar SJ yang akan di split '
    TabOrder = 3
    object Label5: TLabel
      Left = 20
      Top = 182
      Width = 112
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Surat Jalan Terakhir'
    end
    object Label6: TLabel
      Left = 130
      Top = 182
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
    object Label9: TLabel
      Left = 85
      Top = 208
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Km Keluar'
    end
    object Label10: TLabel
      Left = 85
      Top = 230
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Km Masuk'
    end
    object Label15: TLabel
      Left = 105
      Top = 251
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jarak'
    end
    object Panel1: TPanel
      Left = 143
      Top = 173
      Width = 167
      Height = 97
      BevelOuter = bvNone
      TabOrder = 0
      object out_odo_last: TEdit
        Left = 0
        Top = 31
        Width = 87
        Height = 21
        Color = 12320767
        ReadOnly = True
        TabOrder = 1
      end
      object SJLast: TEdit
        Left = 0
        Top = 6
        Width = 145
        Height = 21
        Color = 12320767
        ReadOnly = True
        TabOrder = 0
      end
      object in_odo_last: TEdit
        Left = 0
        Top = 53
        Width = 87
        Height = 21
        Color = 12320767
        ReadOnly = True
        TabOrder = 2
      end
      object JarakLast: TEdit
        Left = 0
        Top = 75
        Width = 87
        Height = 21
        Color = 12320767
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel2: TPanel
      Left = 23
      Top = 25
      Width = 290
      Height = 144
      BevelOuter = bvNone
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 59
        Top = 6
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
        OnClick = SpeedButton1Click
      end
      object Label11: TLabel
        Left = 3
        Top = 11
        Width = 46
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cari SJ'
        WordWrap = True
      end
      object SJLIST: TListBox
        Left = 0
        Top = 33
        Width = 266
        Height = 110
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SJLISTDblClick
        OnKeyDown = SJLISTKeyDown
      end
      object clean: TButton
        Left = 190
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Bersihkan List'
        TabOrder = 1
        OnClick = cleanClick
      end
    end
  end
  object Bersihkan: TButton
    Left = 320
    Top = 308
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
end
