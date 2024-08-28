object Lead: TLead
  Left = 444
  Top = 197
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data Prospek'
  ClientHeight = 500
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 40
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Label2: TLabel
    Left = 92
    Top = 64
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alamat'
  end
  object Label3: TLabel
    Left = 73
    Top = 136
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Telephone'
  end
  object Label7: TLabel
    Left = 68
    Top = 159
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Handphone'
  end
  object Label8: TLabel
    Left = 40
    Top = 184
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sumber Referensi'
  end
  object Label9: TLabel
    Left = 8
    Top = 211
    Width = 116
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Pelanggan Referensi'
  end
  object Label18: TLabel
    Left = 480
    Top = 0
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
  object Label19: TLabel
    Left = 87
    Top = 235
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Catatan'
  end
  object Label13: TLabel
    Left = 127
    Top = 134
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 126
    Top = 62
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
  object Label17: TLabel
    Left = 126
    Top = 39
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
  object Label23: TLabel
    Left = 480
    Top = 25
    Width = 98
    Height = 16
    Caption = '* Diisi salah satu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label24: TLabel
    Left = 127
    Top = 158
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupContact: TGroupBox
    Left = 8
    Top = 288
    Width = 473
    Height = 201
    Caption = 'Kontak'
    TabOrder = 2
    object Label10: TLabel
      Left = 86
      Top = 8
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label11: TLabel
      Left = 82
      Top = 32
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label12: TLabel
      Left = 65
      Top = 128
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telephone'
    end
    object Label15: TLabel
      Left = 346
      Top = 80
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kode Pos'
    end
    object Label16: TLabel
      Left = 61
      Top = 103
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
    end
    object Label21: TLabel
      Left = 87
      Top = 156
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'e-mail'
    end
    object Label22: TLabel
      Left = 59
      Top = 177
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departemen'
    end
    object ContactName: TEdit
      Left = 168
      Top = 8
      Width = 285
      Height = 21
      TabOrder = 1
      OnKeyPress = ContactNameKeyPress
    end
    object ContactAddress: TMemo
      Left = 128
      Top = 32
      Width = 325
      Height = 41
      TabOrder = 2
      OnKeyPress = ContactAddressKeyPress
    end
    object ContactZip: TEdit
      Left = 397
      Top = 77
      Width = 56
      Height = 21
      TabOrder = 3
      OnKeyPress = ContactZipKeyPress
    end
    object ContactCellular: TMaskEdit
      Left = 128
      Top = 104
      Width = 185
      Height = 21
      EditMask = '99999999999999/99999999999999;1;_'
      MaxLength = 29
      TabOrder = 4
      Text = '              /              '
      OnKeyPress = ContactCellularKeyPress
    end
    object ContactPhone: TMaskEdit
      Left = 128
      Top = 128
      Width = 81
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 5
      OnKeyPress = ContactPhoneKeyPress
    end
    object ContactTitle: TComboBox
      Left = 128
      Top = 8
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnKeyPress = ContactTitleKeyPress
    end
    object email: TEdit
      Left = 128
      Top = 152
      Width = 329
      Height = 21
      TabOrder = 6
      OnKeyPress = emailKeyPress
    end
    object Dept: TEdit
      Left = 128
      Top = 176
      Width = 185
      Height = 21
      TabOrder = 7
      OnKeyPress = DeptKeyPress
    end
  end
  object Simpan: TButton
    Left = 496
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 496
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 496
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object GroupLead: TPanel
    Left = 136
    Top = 40
    Width = 337
    Height = 249
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 84
      Top = 99
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Caption = '/'
    end
    object Label5: TLabel
      Left = 185
      Top = 97
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fax'
    end
    object Label6: TLabel
      Left = 219
      Top = 72
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kode Pos'
    end
    object Title: TComboBox
      Left = 0
      Top = 0
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnKeyPress = TitleKeyPress
    end
    object Name: TEdit
      Left = 40
      Top = 0
      Width = 285
      Height = 21
      TabOrder = 1
      OnKeyPress = NameKeyPress
    end
    object Address: TMemo
      Left = 0
      Top = 24
      Width = 325
      Height = 41
      TabOrder = 2
      OnKeyPress = AddressKeyPress
    end
    object PhoneNo1: TMaskEdit
      Left = 0
      Top = 96
      Width = 78
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 4
      OnKeyPress = PhoneNo1KeyPress
    end
    object PhoneNo2: TMaskEdit
      Left = 96
      Top = 96
      Width = 79
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 5
      OnKeyPress = PhoneNo2KeyPress
    end
    object FaxNo: TMaskEdit
      Left = 216
      Top = 96
      Width = 80
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 6
      OnKeyPress = FaxNoKeyPress
    end
    object Zip: TEdit
      Left = 272
      Top = 69
      Width = 56
      Height = 21
      TabOrder = 3
      OnKeyPress = ZipKeyPress
    end
    object CellularNo: TMaskEdit
      Left = 0
      Top = 120
      Width = 97
      Height = 21
      EditMask = '99999999999999;0;_'
      MaxLength = 14
      TabOrder = 7
      OnKeyPress = CellularNoKeyPress
    end
    object Reference: TComboBox
      Left = 0
      Top = 144
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = ReferenceChange
      OnKeyPress = ReferenceKeyPress
    end
    object Panel1: TPanel
      Left = 0
      Top = 168
      Width = 305
      Height = 23
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 9
      object ReferenceId: TEdit
        Left = 0
        Top = 1
        Width = 105
        Height = 21
        TabOrder = 0
      end
      object ReferenceName: TEdit
        Left = 104
        Top = 1
        Width = 193
        Height = 21
        TabOrder = 1
      end
    end
    object PanelCariReferensi: TPanel
      Left = 296
      Top = 167
      Width = 41
      Height = 26
      BevelOuter = bvNone
      TabOrder = 10
      TabStop = True
      object CariReferensi: TSpeedButton
        Left = 2
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
      end
    end
    object Remark: TMemo
      Left = 0
      Top = 192
      Width = 325
      Height = 57
      TabOrder = 11
      OnKeyPress = RemarkKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 393
    Height = 33
    Enabled = False
    TabOrder = 0
    object Label20: TLabel
      Left = 60
      Top = 12
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Prospek'
    end
    object LeadId: TEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBatal: TPanel
    Left = 408
    Top = 8
    Width = 65
    Height = 17
    BevelOuter = bvNone
    TabOrder = 6
    object Status: TCheckBox
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Batal'
      TabOrder = 0
    end
  end
end
