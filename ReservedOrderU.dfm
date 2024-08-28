object ReservedOrder: TReservedOrder
  Left = 42
  Top = 108
  Width = 1290
  Height = 630
  BorderIcons = []
  Caption = 'ReservedOrder'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplayD: TPanel
    Left = 0
    Top = 193
    Width = 1282
    Height = 371
    Align = alTop
    TabOrder = 0
    object Label8: TLabel
      Left = 496
      Top = 7
      Width = 57
      Height = 13
      Caption = 'Cari Sopir 1 '
    end
    object Label10: TLabel
      Left = 342
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Cari Armada '
    end
    object Label2: TLabel
      Left = 645
      Top = 7
      Width = 57
      Height = 13
      Caption = 'Waktu Dari '
    end
    object Label5: TLabel
      Left = 629
      Top = 29
      Width = 73
      Height = 13
      Caption = 'Waktu Sampai '
    end
    object Label23: TLabel
      Left = 809
      Top = 7
      Width = 62
      Height = 13
      Caption = 'Jam Stan By '
      Visible = False
    end
    object Label6: TLabel
      Left = 1
      Top = 277
      Width = 62
      Height = 13
      Caption = 'Jumlah Data '
    end
    object Label7: TLabel
      Left = 497
      Top = 28
      Width = 57
      Height = 13
      Caption = 'Cari Sopir 2 '
    end
    object dtpJamStanBy: TDateTimePicker
      Left = 877
      Top = 3
      Width = 96
      Height = 21
      Date = 41473.647034143520000000
      Time = 41473.647034143520000000
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object dtpWaktuSampai: TDateTimePicker
      Left = 704
      Top = 25
      Width = 90
      Height = 21
      Date = 41473.647034143520000000
      Time = 41473.647034143520000000
      Kind = dtkTime
      TabOrder = 5
      Visible = False
    end
    object dtpWaktuDari: TDateTimePicker
      Left = 704
      Top = 3
      Width = 90
      Height = 21
      Date = 41473.647034143520000000
      Time = 41473.647034143520000000
      Kind = dtkTime
      TabOrder = 4
      Visible = False
    end
    object edtCariSopir1: TEdit
      Left = 555
      Top = 3
      Width = 50
      Height = 21
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Color = clBtnFace
      TabOrder = 1
      Text = 'Cari '
      Visible = False
      OnEnter = edtCariSopir1Enter
      OnExit = edtCariSopir1Exit
      OnKeyPress = edtCariSopir1KeyPress
    end
    object edtCariArmada: TEdit
      Left = 407
      Top = 3
      Width = 50
      Height = 21
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Color = clBtnFace
      TabOrder = 2
      Text = 'Cari '
      Visible = False
      OnEnter = edtCariArmadaEnter
      OnExit = edtCariArmadaExit
      OnKeyPress = edtCariArmadaKeyPress
    end
    object edtIDWilayahKota: TEdit
      Left = 879
      Top = 25
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = edtIDWilayahKotaChange
    end
    object mJumlahData: TMemo
      Left = 71
      Top = 273
      Width = 50
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      ReadOnly = True
      TabOrder = 7
    end
    object edtCariSopir2: TEdit
      Left = 556
      Top = 24
      Width = 50
      Height = 21
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Color = clBtnFace
      TabOrder = 8
      Text = 'Cari '
      Visible = False
      OnEnter = edtCariSopir2Enter
      OnExit = edtCariSopir2Exit
      OnKeyPress = edtCariSopir2KeyPress
    end
    object GroupNamaProduct: TGroupBox
      Left = 1
      Top = 1
      Width = 1280
      Height = 270
      Align = alTop
      Caption = 'Reserved Order  '
      TabOrder = 0
      TabStop = True
      object GridNamaProduct: TZColorStringGrid
        Left = 2
        Top = 15
        Width = 1276
        Height = 253
        Align = alClient
        ColCount = 10
        DefaultRowHeight = 18
        DefaultDrawing = False
        FixedColor = clBtnFace
        FixedCols = 0
        RowCount = 3
        FixedRows = 2
        TabOrder = 0
        OnSelectCell = GridNamaProductSelectCell
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
  object pnlDisplayH: TPanel
    Left = 0
    Top = 0
    Width = 1282
    Height = 193
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 12
      Width = 90
      Height = 13
      Caption = 'ID Customer Order '
    end
    object btnCariCustomerID: TSpeedButton
      Left = 242
      Top = 7
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
      OnClick = btnCariCustomerIDClick
    end
    object Label9: TLabel
      Left = 87
      Top = 78
      Width = 34
      Height = 13
      Caption = 'ID PIC '
    end
    object Label25: TLabel
      Left = 51
      Top = 96
      Width = 70
      Height = 13
      Caption = 'Status Kontak '
    end
    object Label19: TLabel
      Left = 68
      Top = 117
      Width = 54
      Height = 13
      Caption = 'ID Kontrak '
    end
    object Label3: TLabel
      Left = 60
      Top = 56
      Width = 61
      Height = 13
      Caption = 'ID Customer '
    end
    object Label4: TLabel
      Left = 72
      Top = 34
      Width = 29
      Height = 13
      Caption = 'Sales '
    end
    object lLain2Ke1: TLabel
      Left = 774
      Top = 147
      Width = 54
      Height = 13
      Caption = 'Lain2 Ke 1 '
    end
    object lLain2Ke2: TLabel
      Left = 774
      Top = 170
      Width = 54
      Height = 13
      Caption = 'Lain2 Ke 2 '
    end
    object edtIDCustOrder: TEdit
      Left = 123
      Top = 8
      Width = 118
      Height = 21
      Enabled = False
      TabOrder = 0
      OnChange = edtIDCustOrderChange
    end
    object edtNamaCustomer: TEdit
      Left = 244
      Top = 52
      Width = 250
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edtPICID: TEdit
      Left = 123
      Top = 74
      Width = 118
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtNamaPIC: TEdit
      Left = 244
      Top = 74
      Width = 250
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object cbkKontrak: TCheckBox
      Left = 124
      Top = 96
      Width = 33
      Height = 17
      Enabled = False
      TabOrder = 4
    end
    object edtKontrakID: TEdit
      Left = 125
      Top = 113
      Width = 240
      Height = 21
      Enabled = False
      MaxLength = 30
      TabOrder = 5
    end
    object edtCustomerID: TEdit
      Left = 123
      Top = 52
      Width = 118
      Height = 21
      Enabled = False
      TabOrder = 6
    end
    object edtSales: TEdit
      Left = 123
      Top = 30
      Width = 236
      Height = 21
      Enabled = False
      TabOrder = 7
    end
    object grpboxBiayaTambahanCustomer: TGroupBox
      Left = 775
      Top = 4
      Width = 278
      Height = 136
      Caption = '                                        '
      TabOrder = 8
      object strgridBiayaTambahanCustomer: TZColorStringGrid
        Left = 2
        Top = 15
        Width = 274
        Height = 119
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 18
        DefaultDrawing = False
        FixedColor = clBtnFace
        FixedCols = 0
        RowCount = 2
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
        ColWidths = (
          128
          81)
      end
      object cbServicePerusahaan: TCheckBox
        Left = 10
        Top = -1
        Width = 119
        Height = 17
        Caption = 'Service Perusahaan  '
        Enabled = False
        TabOrder = 1
      end
    end
    object edtLain1: TEdit
      Left = 828
      Top = 143
      Width = 243
      Height = 21
      Enabled = False
      MaxLength = 20
      TabOrder = 9
    end
    object edtLain2: TEdit
      Left = 828
      Top = 166
      Width = 243
      Height = 21
      Enabled = False
      MaxLength = 20
      TabOrder = 10
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 564
    Width = 1282
    Height = 32
    Align = alClient
    TabOrder = 2
    object btnSelesai: TButton
      Left = 1197
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
    object btnBersih: TButton
      Left = 1118
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 1
      OnClick = btnBersihClick
    end
    object btnRefresh: TButton
      Left = 1041
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 2
    end
    object btnSimpanH: TButton
      Left = 963
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = btnSimpanHClick
    end
  end
end
