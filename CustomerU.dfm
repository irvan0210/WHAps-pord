object Customer: TCustomer
  Left = 431
  Top = 95
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data Pelanggan'
  ClientHeight = 557
  ClientWidth = 889
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
  object Label18: TLabel
    Left = 496
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
  object Label10: TLabel
    Left = 496
    Top = 19
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
  object GroupContact: TGroupBox
    Left = 8
    Top = 384
    Width = 873
    Height = 161
    Caption = 'Kontak'
    TabOrder = 3
    object StrGrid: TZColorStringGrid
      Left = 3
      Top = 16
      Width = 862
      Height = 137
      TabStop = False
      ColCount = 10
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 3
      TabOrder = 6
      OnDblClick = StrGridDblClick
      OnSelectCell = StrGridSelectCell
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
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object ContactName: TEdit
      Left = 48
      Top = 96
      Width = 105
      Height = 21
      TabOrder = 0
      Visible = False
      OnExit = ContactNameExit
      OnKeyPress = ContactNameKeyPress
    end
    object ContactAddress: TMemo
      Left = 152
      Top = 96
      Width = 121
      Height = 23
      TabOrder = 1
      Visible = False
      OnExit = ContactAddressExit
      OnKeyPress = ContactAddressKeyPress
    end
    object ContactCellular: TMaskEdit
      Left = 320
      Top = 96
      Width = 185
      Height = 21
      EditMask = '99999999999999/99999999999999;1;_'
      MaxLength = 29
      TabOrder = 2
      Text = '              /              '
      Visible = False
      OnExit = ContactCellularExit
      OnKeyPress = ContactCellularKeyPress
    end
    object ContactPhone: TMaskEdit
      Left = 504
      Top = 96
      Width = 81
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 3
      Visible = False
      OnExit = ContactPhoneExit
      OnKeyPress = ContactPhoneKeyPress
    end
    object email: TEdit
      Left = 584
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 4
      Visible = False
      OnExit = emailExit
      OnKeyPress = emailKeyPress
    end
    object Dept: TEdit
      Left = 704
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 5
      Visible = False
      OnExit = DeptExit
      OnKeyPress = DeptKeyPress
    end
    object ContactTitle: TComboBox
      Left = 8
      Top = 101
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Visible = False
      OnExit = ContactTitleExit
      OnKeyPress = ContactTitleKeyPress
    end
    object ContactZip: TEdit
      Left = 269
      Top = 93
      Width = 56
      Height = 21
      TabOrder = 8
      Visible = False
      OnExit = ContactZipExit
      OnKeyPress = ContactZipKeyPress
    end
  end
  object PanelHeader: TPanel
    Left = 8
    Top = 32
    Width = 593
    Height = 345
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 96
      Top = 48
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label2: TLabel
      Left = 92
      Top = 96
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label3: TLabel
      Left = 73
      Top = 168
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telephone'
    end
    object Label7: TLabel
      Left = 68
      Top = 191
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
    end
    object Label8: TLabel
      Left = 40
      Top = 216
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sumber Referensi'
    end
    object Label9: TLabel
      Left = 8
      Top = 240
      Width = 116
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Pelanggan Referensi'
    end
    object Label19: TLabel
      Left = 87
      Top = 291
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Catatan'
    end
    object LabelLead: TLabel
      Left = 68
      Top = 0
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Prospek'
    end
    object LabelSegment: TLabel
      Left = 31
      Top = 24
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kategori Pelanggan'
    end
    object Label13: TLabel
      Left = 127
      Top = 166
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
      Top = 94
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
      Top = 47
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
    object LabelSegment1: TLabel
      Left = 126
      Top = 23
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
    object Label11: TLabel
      Left = 127
      Top = 190
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
    object Label12: TLabel
      Left = 85
      Top = 264
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Website'
    end
    object Label27: TLabel
      Left = 71
      Top = 72
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama Alias'
    end
    object PanelLead: TPanel
      Left = 136
      Top = 0
      Width = 153
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object LeadId: TEdit
        Left = 0
        Top = 0
        Width = 89
        Height = 21
        TabStop = False
        TabOrder = 0
      end
    end
    object PanelCariLead: TPanel
      Left = 224
      Top = -1
      Width = 49
      Height = 26
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object CariLead: TSpeedButton
        Left = 2
        Top = 1
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
        OnClick = CariLeadClick
      end
    end
    object GroupInput: TPanel
      Left = 136
      Top = 24
      Width = 449
      Height = 321
      BevelOuter = bvNone
      TabOrder = 2
      object Label4: TLabel
        Left = 84
        Top = 147
        Width = 5
        Height = 13
        Alignment = taRightJustify
        Caption = '/'
      end
      object Label5: TLabel
        Left = 193
        Top = 169
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fax'
      end
      object Label6: TLabel
        Left = 219
        Top = 120
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Kode Pos'
      end
      object LabelSegment2: TLabel
        Left = 150
        Top = 3
        Width = 3
        Height = 13
        Alignment = taRightJustify
        Caption = '-'
      end
      object Label25: TLabel
        Left = 193
        Top = 145
        Width = 15
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ext'
      end
      object Label26: TLabel
        Left = 260
        Top = 147
        Width = 5
        Height = 13
        Alignment = taRightJustify
        Caption = '/'
      end
      object Title: TComboBox
        Left = 0
        Top = 24
        Width = 41
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnKeyPress = TitleKeyPress
      end
      object Name: TEdit
        Left = 40
        Top = 24
        Width = 285
        Height = 21
        TabOrder = 3
        OnKeyPress = NameKeyPress
      end
      object Address: TMemo
        Left = 0
        Top = 72
        Width = 325
        Height = 41
        TabOrder = 4
      end
      object PhoneNo1: TMaskEdit
        Left = 0
        Top = 144
        Width = 78
        Height = 21
        EditMask = '999-99999999;0;_'
        MaxLength = 12
        TabOrder = 6
        OnKeyPress = PhoneNo1KeyPress
      end
      object PhoneNo2: TMaskEdit
        Left = 96
        Top = 144
        Width = 79
        Height = 21
        EditMask = '999-99999999;0;_'
        MaxLength = 12
        TabOrder = 7
        OnKeyPress = PhoneNo2KeyPress
      end
      object FaxNo: TMaskEdit
        Left = 216
        Top = 168
        Width = 80
        Height = 21
        EditMask = '999-99999999;0;_'
        MaxLength = 12
        TabOrder = 11
        OnKeyPress = FaxNoKeyPress
      end
      object Zip: TEdit
        Left = 272
        Top = 117
        Width = 56
        Height = 21
        TabOrder = 5
        OnKeyPress = ZipKeyPress
      end
      object CellularNo: TMaskEdit
        Left = 0
        Top = 168
        Width = 97
        Height = 21
        EditMask = '99999999999999;0;_'
        MaxLength = 14
        TabOrder = 10
        OnKeyPress = CellularNoKeyPress
      end
      object Reference: TComboBox
        Left = 0
        Top = 192
        Width = 129
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 12
        OnChange = ReferenceChange
        OnKeyPress = ReferenceKeyPress
      end
      object Panel1: TPanel
        Left = 0
        Top = 216
        Width = 329
        Height = 23
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 13
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
        Top = 215
        Width = 41
        Height = 26
        BevelOuter = bvNone
        TabOrder = 14
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
          OnClick = CariReferensiClick
        end
      end
      object Remark: TMemo
        Left = 0
        Top = 266
        Width = 325
        Height = 55
        TabOrder = 15
        OnKeyPress = RemarkKeyPress
      end
      object SegLv1: TComboBox
        Left = 0
        Top = 0
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = SegLv1Change
        OnKeyPress = SegLv1KeyPress
      end
      object SegLv2: TComboBox
        Left = 160
        Top = 0
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = SegLv2Change
        OnKeyPress = SegLv2KeyPress
      end
      object Website: TEdit
        Left = 0
        Top = 240
        Width = 297
        Height = 21
        TabOrder = 16
        OnKeyPress = NameKeyPress
      end
      object Ext1: TEdit
        Left = 216
        Top = 143
        Width = 41
        Height = 21
        TabOrder = 8
        OnKeyPress = Ext1KeyPress
      end
      object Ext2: TEdit
        Left = 272
        Top = 143
        Width = 41
        Height = 21
        TabOrder = 9
        OnKeyPress = Ext2KeyPress
      end
      object SegLv3: TCheckListBox
        Left = 336
        Top = 0
        Width = 113
        Height = 113
        ItemHeight = 13
        TabOrder = 17
      end
      object Name2: TEdit
        Left = 0
        Top = 48
        Width = 325
        Height = 21
        TabOrder = 18
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 417
    Height = 33
    TabOrder = 0
    object Label20: TLabel
      Left = 56
      Top = 12
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Pelanggan'
    end
    object CustomerId: TEdit
      Left = 136
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = CustomerIdKeyPress
    end
  end
  object PanelButton: TPanel
    Left = 800
    Top = 112
    Width = 81
    Height = 89
    BevelOuter = bvNone
    TabOrder = 4
    object Simpan: TButton
      Left = 6
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 6
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 1
      OnClick = BersihkanClick
    end
    object Selesai: TButton
      Left = 6
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 2
      OnClick = SelesaiClick
    end
  end
  object GroupBatal: TPanel
    Left = 426
    Top = 5
    Width = 65
    Height = 31
    BevelOuter = bvNone
    TabOrder = 5
    object Status: TCheckBox
      Left = 0
      Top = 4
      Width = 65
      Height = 17
      Caption = 'Non Aktif'
      TabOrder = 0
    end
  end
  object GroupAdditional: TGroupBox
    Left = 520
    Top = 216
    Width = 361
    Height = 161
    TabOrder = 2
    object Label15: TLabel
      Left = 73
      Top = 12
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Limit Kredit'
    end
    object Label16: TLabel
      Left = 52
      Top = 60
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'GP Customer #'
    end
    object Label21: TLabel
      Left = 77
      Top = 36
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sales/AM'
    end
    object Label22: TLabel
      Left = 91
      Top = 132
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'NPWP'
    end
    object Label24: TLabel
      Left = 42
      Top = 108
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Virtual Account #'
    end
    object Label23: TLabel
      Left = 74
      Top = 84
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'GP COA #'
    end
    object CreditLimit: TEdit
      Left = 136
      Top = 12
      Width = 105
      Height = 21
      TabOrder = 0
      OnEnter = CreditLimitEnter
      OnExit = CreditLimitExit
      OnKeyPress = CreditLimitKeyPress
    end
    object GPCustomerNumber: TEdit
      Left = 136
      Top = 60
      Width = 105
      Height = 21
      TabOrder = 1
      OnKeyPress = GPCustomerNumberKeyPress
    end
    object Sales: TComboBox
      Left = 136
      Top = 36
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnKeyPress = SalesKeyPress
    end
    object NPWP: TEdit
      Left = 136
      Top = 132
      Width = 169
      Height = 21
      TabOrder = 3
      OnKeyPress = NPWPKeyPress
    end
    object VANo: TEdit
      Left = 136
      Top = 108
      Width = 169
      Height = 21
      TabOrder = 4
      OnKeyPress = VANoKeyPress
    end
    object GPCOANumber: TEdit
      Left = 136
      Top = 84
      Width = 169
      Height = 21
      TabOrder = 5
      OnKeyPress = GPCOANumberKeyPress
    end
  end
  object GroupBlackList: TPanel
    Left = 304
    Top = 7
    Width = 105
    Height = 24
    BevelOuter = bvNone
    TabOrder = 6
    object Blacklist: TCheckBox
      Left = 8
      Top = 4
      Width = 73
      Height = 17
      Caption = 'BlackList'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object AppHotKey: TApplicationEvents
    Left = 808
    Top = 8
  end
end
