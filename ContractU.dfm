object Contract: TContract
  Left = 267
  Top = 90
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data Kontrak'
  ClientHeight = 625
  ClientWidth = 1096
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
  object GroupOrder: TGroupBox
    Left = 8
    Top = 320
    Width = 1081
    Height = 297
    Caption = 'Data Produk'
    TabOrder = 3
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 1065
      Height = 273
      TabStop = False
      ColCount = 10
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 3
      FixedRows = 2
      ScrollBars = ssVertical
      TabOrder = 4
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
    object Product: TComboBox
      Left = 16
      Top = 24
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
      TabOrder = 0
      Visible = False
      OnChange = ProductChange
      OnExit = ProductExit
      OnKeyDown = ProductKeyDown
      OnKeyPress = ProductKeyPress
    end
    object DiscountDetailPrice: TMemo
      Left = 424
      Top = 24
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 1
      Visible = False
      WantReturns = False
      OnExit = DiscountDetailPriceExit
      OnKeyDown = DiscountDetailPriceKeyDown
      OnKeyPress = DiscountDetailPriceKeyPress
    end
    object DiscountDetailPercent: TMemo
      Left = 488
      Top = 24
      Width = 33
      Height = 25
      Alignment = taRightJustify
      TabOrder = 2
      Visible = False
      WantReturns = False
      OnExit = DiscountDetailPercentExit
      OnKeyDown = DiscountDetailPercentKeyDown
      OnKeyPress = DiscountDetailPercentKeyPress
    end
    object DetailRemark: TMemo
      Left = 520
      Top = 24
      Width = 137
      Height = 25
      TabOrder = 3
      Visible = False
      WantReturns = False
      OnExit = DetailRemarkExit
      OnKeyDown = DetailRemarkKeyDown
      OnKeyPress = DetailRemarkKeyPress
    end
    object FixedPriceWeekday: TMemo
      Left = 160
      Top = 24
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 5
      Visible = False
      WantReturns = False
      OnExit = FixedPriceWeekdayExit
      OnKeyDown = FixedPriceWeekdayKeyDown
      OnKeyPress = FixedPriceWeekdayKeyPress
    end
    object FixedPriceWeekend: TMemo
      Left = 224
      Top = 24
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 6
      Visible = False
      WantReturns = False
      OnExit = FixedPriceWeekendExit
      OnKeyDown = FixedPriceWeekendKeyDown
      OnKeyPress = FixedPriceWeekendKeyPress
    end
    object FixedPriceOvertime: TMemo
      Left = 296
      Top = 24
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 7
      Visible = False
      WantReturns = False
      OnExit = FixedPriceOvertimeExit
      OnKeyDown = FixedPriceOvertimeKeyDown
      OnKeyPress = FixedPriceOvertimeKeyPress
    end
    object FixedPriceOverday: TMemo
      Left = 360
      Top = 24
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 8
      Visible = False
      WantReturns = False
      OnExit = FixedPriceOverdayExit
      OnKeyDown = FixedPriceOverdayKeyDown
      OnKeyPress = FixedPriceOverdayKeyPress
    end
  end
  object Selesai: TButton
    Left = 1008
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 1008
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 1008
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 6
    OnClick = BersihkanClick
  end
  object GroupDiscount: TGroupBox
    Left = 8
    Top = 152
    Width = 465
    Height = 169
    TabOrder = 2
    object Label6: TLabel
      Left = 44
      Top = 80
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Discount   Rp.'
    end
    object Label1: TLabel
      Left = 33
      Top = 8
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Kontrak'
    end
    object Label8: TLabel
      Left = 57
      Top = 124
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object Label11: TLabel
      Left = 113
      Top = 7
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
    object Label12: TLabel
      Left = 28
      Top = 32
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cara Pembayaran'
    end
    object Label13: TLabel
      Left = 61
      Top = 56
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Limit Kredit'
    end
    object Label15: TLabel
      Left = 77
      Top = 104
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Invoice'
    end
    object Panel2: TPanel
      Left = 120
      Top = 8
      Width = 337
      Height = 121
      BevelOuter = bvNone
      TabOrder = 0
      object Label7: TLabel
        Left = 93
        Top = 72
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'atau             %'
      end
      object Label5: TLabel
        Left = 92
        Top = 3
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 's/d'
      end
      object DiscountPrice: TEdit
        Left = 0
        Top = 72
        Width = 81
        Height = 21
        TabOrder = 0
        OnEnter = DiscountPriceEnter
        OnExit = DiscountPriceExit
        OnKeyPress = DiscountPriceKeyPress
      end
      object DiscountPercent: TEdit
        Left = 128
        Top = 72
        Width = 25
        Height = 21
        TabOrder = 1
        OnKeyPress = DiscountPercentKeyPress
      end
      object DateStart: TDateTimePicker
        Left = 0
        Top = 0
        Width = 89
        Height = 21
        Date = 41741.793020648150000000
        Time = 41741.793020648150000000
        TabOrder = 2
        OnChange = DateStartChange
        OnKeyPress = DateStartKeyPress
      end
      object DateFinish: TDateTimePicker
        Left = 112
        Top = 0
        Width = 89
        Height = 21
        Date = 41741.793020648150000000
        Time = 41741.793020648150000000
        TabOrder = 3
        OnKeyPress = DateFinishKeyPress
      end
      object PaymentTerm: TComboBox
        Left = 0
        Top = 24
        Width = 129
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnKeyPress = PaymentTermKeyPress
      end
      object CreditLimit: TMemo
        Left = 0
        Top = 48
        Width = 129
        Height = 21
        Alignment = taRightJustify
        TabOrder = 5
        WantReturns = False
        WantTabs = True
        OnEnter = CreditLimitEnter
        OnExit = CreditLimitExit
        OnKeyPress = CreditLimitKeyPress
      end
      object FixedInvoice: TCheckBox
        Left = 0
        Top = 96
        Width = 97
        Height = 17
        Caption = 'Bulanan - Tetap'
        TabOrder = 6
      end
      object AllCustomer: TCheckBox
        Left = 208
        Top = 96
        Width = 105
        Height = 17
        Caption = 'Semua Customer'
        TabOrder = 7
      end
    end
  end
  object GroupHeader: TGroupBox
    Left = 8
    Top = 32
    Width = 465
    Height = 121
    TabOrder = 1
    TabStop = True
    object Label2: TLabel
      Left = 80
      Top = 56
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label4: TLabel
      Left = 61
      Top = 8
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pelanggan'
    end
    object Label9: TLabel
      Left = 57
      Top = 88
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object LabelSegment1: TLabel
      Left = 113
      Top = 7
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
    object Label10: TLabel
      Left = 113
      Top = 55
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
    object Label14: TLabel
      Left = 78
      Top = 32
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kontak'
    end
    object Panel1: TPanel
      Left = 120
      Top = 8
      Width = 337
      Height = 111
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object CustomerDisp: TEdit
        Left = 80
        Top = 0
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object CustomerId: TEdit
        Left = 0
        Top = 0
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object ContactId: TEdit
        Left = 0
        Top = 24
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 2
      end
      object ContactDisp: TEdit
        Left = 80
        Top = 24
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 3
      end
    end
    object PanelCariCustomer: TPanel
      Left = 408
      Top = 7
      Width = 49
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object CariCustomer: TSpeedButton
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
        OnClick = CariCustomerClick
      end
    end
    object PanelCariKontak: TPanel
      Left = 408
      Top = 32
      Width = 49
      Height = 24
      BevelOuter = bvNone
      TabOrder = 2
      object CariKontak: TSpeedButton
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
        OnClick = CariKontakClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 465
    Height = 33
    Enabled = False
    TabOrder = 0
    object Label3: TLabel
      Left = 58
      Top = 8
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Kontrak'
    end
    object ContractId: TEdit
      Left = 120
      Top = 8
      Width = 209
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBatal: TPanel
    Left = 480
    Top = 288
    Width = 81
    Height = 33
    BevelOuter = bvNone
    TabOrder = 7
    object Batal: TCheckBox
      Left = 8
      Top = 16
      Width = 57
      Height = 17
      Caption = 'Batal'
      TabOrder = 0
    end
  end
  object Remark: TMemo
    Left = 128
    Top = 276
    Width = 329
    Height = 40
    ScrollBars = ssVertical
    TabOrder = 8
    OnKeyPress = RemarkKeyPress
  end
  object Address: TMemo
    Left = 128
    Top = 87
    Width = 325
    Height = 33
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object HeaderRemark: TMemo
    Left = 128
    Top = 122
    Width = 325
    Height = 28
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 10
  end
end
