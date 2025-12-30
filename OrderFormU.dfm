object OrderForm: TOrderForm
  Left = 114
  Top = 178
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pesanan'
  ClientHeight = 662
  ClientWidth = 1112
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
  object Label19: TLabel
    Left = 480
    Top = 568
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
  object GroupOtorisasi: TPanel
    Left = 496
    Top = 512
    Width = 241
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 13
    object Authorization: TCheckBox
      Left = 0
      Top = 0
      Width = 225
      Height = 17
      Caption = 'Otorisasi Pembayaran Setelah Pemakaian'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 880
    Top = 513
    Width = 209
    Height = 136
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 6
    object Label9: TLabel
      Left = 10
      Top = 6
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sub Total'
    end
    object Label10: TLabel
      Left = 14
      Top = 27
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Discount'
    end
    object Label11: TLabel
      Left = 32
      Top = 73
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object LabelPph: TLabel
      Left = 22
      Top = 95
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'PPH12'
    end
    object Label25: TLabel
      Left = 35
      Top = 52
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'PPN'
    end
    object Label26: TLabel
      Left = -1
      Top = 120
      Width = 93
      Height = 13
      Caption = 'Total Invoice - PPH'
    end
    object SubTotal: TMemo
      Left = 64
      Top = 0
      Width = 141
      Height = 22
      Alignment = taRightJustify
      TabOrder = 0
      WantReturns = False
    end
    object Discount: TMemo
      Left = 64
      Top = 24
      Width = 141
      Height = 22
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
    end
    object Total: TMemo
      Left = 64
      Top = 69
      Width = 141
      Height = 22
      Alignment = taRightJustify
      TabOrder = 2
      WantReturns = False
    end
    object PphPercen: TMemo
      Left = 64
      Top = 92
      Width = 40
      Height = 22
      Alignment = taRightJustify
      TabOrder = 3
      WantReturns = False
    end
    object PphDeduction: TMemo
      Left = 107
      Top = 92
      Width = 97
      Height = 22
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
    end
    object PPNPercen: TMemo
      Left = 65
      Top = 47
      Width = 40
      Height = 22
      Alignment = taRightJustify
      TabOrder = 5
      WantReturns = False
    end
    object PpnAddition: TMemo
      Left = 108
      Top = 47
      Width = 97
      Height = 22
      Alignment = taRightJustify
      TabOrder = 6
      WantReturns = False
    end
    object TotInvoice_PPH: TMemo
      Left = 64
      Top = 114
      Width = 139
      Height = 22
      Alignment = taRightJustify
      TabOrder = 7
      WantReturns = False
    end
  end
  object GroupBatal: TPanel
    Left = 816
    Top = 512
    Width = 65
    Height = 25
    BevelOuter = bvNone
    TabOrder = 7
    object Status: TCheckBox
      Left = 8
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Batal'
      TabOrder = 0
    end
  end
  object Selesai: TButton
    Left = 1004
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 11
    OnClick = SelesaiClick
  end
  object CetakUlang: TButton
    Left = 1004
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 10
    OnClick = CetakUlangClick
  end
  object Bersihkan: TButton
    Left = 1004
    Top = 131
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 9
    OnClick = BersihkanClick
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 512
    Width = 465
    Height = 73
    TabOrder = 5
    object Label6: TLabel
      Left = 44
      Top = 8
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Discount   Rp.'
    end
    object Label8: TLabel
      Left = 57
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object PanelDetail: TPanel
      Left = 120
      Top = 8
      Width = 343
      Height = 62
      BevelOuter = bvNone
      TabOrder = 0
      object PanelDiscount: TPanel
        Left = 0
        Top = 0
        Width = 177
        Height = 25
        BevelOuter = bvNone
        TabOrder = 1
        object Label7: TLabel
          Left = 88
          Top = 0
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'atau %'
        end
        object DiscountPrice: TEdit
          Left = 0
          Top = 0
          Width = 81
          Height = 21
          TabOrder = 0
          OnEnter = DiscountPriceEnter
          OnExit = DiscountPriceExit
          OnKeyPress = DiscountPriceKeyPress
        end
        object DiscountPercent: TEdit
          Left = 128
          Top = 0
          Width = 25
          Height = 21
          TabOrder = 1
          OnEnter = DiscountPercentEnter
          OnExit = DiscountPercentExit
          OnKeyPress = DiscountPercentKeyPress
        end
      end
      object Remark: TMemo
        Left = 0
        Top = 24
        Width = 329
        Height = 33
        TabOrder = 0
      end
    end
  end
  object ScheduleAdd: TBitBtn
    Left = 973
    Top = 240
    Width = 105
    Height = 25
    Caption = 'Tambah Jadwal'
    TabOrder = 12
    Visible = False
    OnClick = ScheduleAddClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
      C8807FF7777777777FF700000000000000007777777777777777333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object GroupOrder: TGroupBox
    Left = 8
    Top = 272
    Width = 1081
    Height = 241
    Caption = 'Data Pesanan'
    TabOrder = 4
    object Label14: TLabel
      Left = 77
      Top = -2
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
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 1065
      Height = 217
      TabStop = False
      ColCount = 10
      DefaultRowHeight = 36
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 3
      FixedRows = 2
      TabOrder = 10
      OnDblClick = StrGridDblClick
      OnKeyDown = StrGridKeyDown
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
      Left = 32
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
    object DateStart: TDateTimePicker
      Left = 456
      Top = 24
      Width = 89
      Height = 21
      Date = 41726.000000000000000000
      Time = 41726.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnExit = DateStartExit
      OnKeyPress = DateStartKeyPress
    end
    object TimeStart: TMaskEdit
      Left = 552
      Top = 24
      Width = 27
      Height = 21
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 4
      Text = '  .  '
      Visible = False
      OnExit = TimeStartExit
      OnKeyPress = TimeStartKeyPress
    end
    object DateFinish: TDateTimePicker
      Left = 592
      Top = 24
      Width = 89
      Height = 21
      Date = 41726.000000000000000000
      Time = 41726.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnExit = DateFinishExit
      OnKeyPress = DateFinishKeyPress
    end
    object TimeStandby: TMaskEdit
      Left = 680
      Top = 25
      Width = 25
      Height = 21
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 6
      Text = '  .  '
      Visible = False
      OnExit = TimeStandbyExit
      OnKeyPress = TimeStandbyKeyPress
    end
    object Details: TMemo
      Left = 176
      Top = 24
      Width = 137
      Height = 25
      TabOrder = 1
      Visible = False
      WantReturns = False
      OnExit = DetailsExit
      OnKeyDown = DetailsKeyDown
      OnKeyPress = DetailsKeyPress
    end
    object PickUp: TMemo
      Left = 312
      Top = 24
      Width = 137
      Height = 25
      TabOrder = 2
      Visible = False
      WantReturns = False
      OnExit = PickUpExit
      OnKeyDown = PickUpKeyDown
      OnKeyPress = PickUpKeyPress
    end
    object DiscountDetailPrice: TMemo
      Left = 744
      Top = 32
      Width = 65
      Height = 25
      Alignment = taRightJustify
      TabOrder = 7
      Visible = False
      WantReturns = False
      OnExit = DiscountDetailPriceExit
      OnKeyDown = DiscountDetailPriceKeyDown
      OnKeyPress = DiscountDetailPriceKeyPress
    end
    object DiscountDetailPercent: TMemo
      Left = 816
      Top = 24
      Width = 33
      Height = 25
      Alignment = taRightJustify
      TabOrder = 8
      Visible = False
      WantReturns = False
      OnExit = DiscountDetailPercentExit
      OnKeyDown = DiscountDetailPercentKeyDown
      OnKeyPress = DiscountDetailPercentKeyPress
    end
    object DetailRemark: TMemo
      Left = 856
      Top = 24
      Width = 137
      Height = 25
      TabOrder = 9
      Visible = False
      WantReturns = False
      OnExit = DetailRemarkExit
      OnKeyDown = DetailRemarkKeyDown
      OnKeyPress = DetailRemarkKeyPress
    end
    object Units: TMemo
      Left = 704
      Top = 24
      Width = 33
      Height = 25
      Alignment = taRightJustify
      TabOrder = 11
      Visible = False
      WantReturns = False
      OnExit = UnitsExit
      OnKeyDown = UnitsKeyDown
      OnKeyPress = UnitsKeyPress
    end
    object CheckSelect: TCheckBox
      Left = 16
      Top = 32
      Width = 17
      Height = 17
      TabOrder = 12
      Visible = False
      OnExit = CheckSelectExit
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 184
    Width = 545
    Height = 89
    Caption = 'Detail'
    TabOrder = 2
    TabStop = True
    OnDblClick = GroupBox1DblClick
    object Label16: TLabel
      Left = 80
      Top = 8
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
      OnDblClick = GroupBox1DblClick
    end
    object Label17: TLabel
      Left = 57
      Top = 44
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
      OnDblClick = GroupBox1DblClick
    end
    object Address: TMemo
      Left = 120
      Top = 8
      Width = 401
      Height = 33
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = GroupBox1DblClick
    end
    object HeaderRemark: TMemo
      Left = 120
      Top = 45
      Width = 401
      Height = 36
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      OnDblClick = GroupBox1DblClick
    end
  end
  object GroupHeader: TGroupBox
    Left = 8
    Top = 0
    Width = 545
    Height = 185
    Caption = 'Pelanggan'
    TabOrder = 1
    TabStop = True
    object Label4: TLabel
      Left = 61
      Top = 40
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pelanggan'
      OnDblClick = Label4DblClick
    end
    object Label5: TLabel
      Left = 78
      Top = 64
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kontak'
      OnDblClick = Label5DblClick
    end
    object Label13: TLabel
      Left = 58
      Top = 88
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Kontrak'
    end
    object LabelSegment1: TLabel
      Left = 61
      Top = -2
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
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Surat Penawaran'
    end
    object Label20: TLabel
      Left = 52
      Top = 136
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Discount CN'
    end
    object Label21: TLabel
      Left = 160
      Top = 136
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '%'
    end
    object Label22: TLabel
      Left = 44
      Top = 160
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Guide/TL/PIC'
    end
    object Label23: TLabel
      Left = 336
      Top = 160
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Handphone'
    end
    object Label24: TLabel
      Left = 83
      Top = 112
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Group'
    end
    object Panel1: TPanel
      Left = 120
      Top = 8
      Width = 337
      Height = 105
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object CustomerId: TEdit
        Left = 0
        Top = 32
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object ContactId: TEdit
        Left = 0
        Top = 56
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 2
      end
      object ContractId: TEdit
        Left = 0
        Top = 80
        Width = 177
        Height = 21
        TabStop = False
        TabOrder = 4
      end
      object OfferingId: TEdit
        Left = 0
        Top = 8
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 5
      end
      object CustomerDisp: TEdit
        Left = 80
        Top = 32
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object ContactDisp: TEdit
        Left = 80
        Top = 56
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 3
      end
    end
    object PanelCariCustomer: TPanel
      Left = 408
      Top = 39
      Width = 49
      Height = 26
      BevelOuter = bvNone
      TabOrder = 2
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
      Top = 64
      Width = 49
      Height = 24
      BevelOuter = bvNone
      TabOrder = 3
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
    object PanelCariKontrak: TPanel
      Left = 296
      Top = 88
      Width = 57
      Height = 24
      BevelOuter = bvNone
      TabOrder = 4
      object CariKontrak: TSpeedButton
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
        OnClick = CariKontrakClick
      end
      object DeleteKontrak: TSpeedButton
        Left = 26
        Top = 0
        Width = 23
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        OnClick = DeleteKontrakClick
      end
    end
    object PanelOffering: TPanel
      Left = 328
      Top = 15
      Width = 49
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      object CariOffering: TSpeedButton
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
        OnClick = CariOfferingClick
      end
    end
    object DiscountCN: TEdit
      Left = 120
      Top = 136
      Width = 33
      Height = 21
      TabOrder = 5
      OnKeyPress = DiscountCNKeyPress
    end
    object Guide: TEdit
      Left = 120
      Top = 160
      Width = 209
      Height = 21
      TabStop = False
      TabOrder = 6
      OnKeyPress = GuideKeyPress
    end
    object GuideCellular: TEdit
      Left = 394
      Top = 160
      Width = 145
      Height = 21
      TabStop = False
      TabOrder = 7
      OnKeyPress = GuideCellularKeyPress
    end
    object Group: TEdit
      Left = 120
      Top = 112
      Width = 289
      Height = 21
      TabStop = False
      TabOrder = 8
      OnKeyPress = GuideKeyPress
    end
  end
  object GroupService: TGroupBox
    Left = 560
    Top = 80
    Width = 329
    Height = 193
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 3
    TabStop = True
    object GridService: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 313
      Height = 169
      ColCount = 9
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = GridServiceSelectCell
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
    object Service: TComboBox
      Left = 32
      Top = 24
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      OnChange = ServiceChange
      OnExit = ServiceExit
      OnKeyPress = ServiceKeyPress
    end
    object JumlahBiaya: TEdit
      Left = 184
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = JumlahBiayaExit
      OnKeyPress = JumlahBiayaKeyPress
    end
    object Qty: TEdit
      Left = 144
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 3
      Visible = False
      OnExit = QtyExit
      OnKeyPress = QtyKeyPress
    end
  end
  object Button1: TButton
    Left = 1004
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Cetak Resv'
    TabOrder = 15
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 560
    Top = 0
    Width = 329
    Height = 81
    Enabled = False
    TabOrder = 0
    object LabelNo: TLabel
      Left = 21
      Top = 8
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Pesanan'
    end
    object Label2: TLabel
      Left = 39
      Top = 32
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label12: TLabel
      Left = 51
      Top = 56
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sales'
    end
    object Label15: TLabel
      Left = 80
      Top = 30
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
    object Label18: TLabel
      Left = 78
      Top = 54
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
    object OrderId: TEdit
      Left = 88
      Top = 8
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object OrderDate: TEdit
      Left = 88
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object LockButton: TPanel
      Left = 297
      Top = 8
      Width = 30
      Height = 25
      Hint = 'Penjadwalan Terkunci'
      BevelOuter = bvNone
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object LockButtons: TSpeedButton
        Left = 2
        Top = 0
        Width = 23
        Height = 25
        Hint = 'Penjadwalan Terkunci'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
          333333333F777773FF333333008888800333333377333F3773F3333077870787
          7033333733337F33373F3308888707888803337F33337F33337F330777880887
          7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
          7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
          00333337777777777733333308033308033333337F7F337F7F33333308033308
          033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
          7333333373F77733733333333088888033333333373FFFF73333333333000003
          3333333333777773333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object PanelBookDirect: TPanel
    Left = 896
    Top = 8
    Width = 153
    Height = 25
    BevelOuter = bvNone
    TabOrder = 17
    object Bookdirect: TCheckBox
      Left = 0
      Top = 0
      Width = 129
      Height = 17
      Caption = 'Langsung Dijadwalkan'
      TabOrder = 0
      OnClick = BookdirectClick
    end
  end
  object PanelBook: TPanel
    Left = 888
    Top = 27
    Width = 164
    Height = 22
    BevelOuter = bvNone
    TabOrder = 16
    object Package: TCheckBox
      Left = 8
      Top = 0
      Width = 73
      Height = 17
      Caption = 'Paket'
      TabOrder = 0
    end
  end
  object GroupSalesPerson: TPanel
    Left = 648
    Top = 56
    Width = 233
    Height = 23
    BevelOuter = bvNone
    TabOrder = 14
    object SalesPerson: TComboBox
      Left = 0
      Top = 0
      Width = 209
      Height = 21
      Style = csSimple
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Simpan: TButton
    Left = 1004
    Top = 104
    Width = 73
    Height = 25
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = SimpanClick
  end
  object GroupBooked: TPanel
    Left = 732
    Top = 512
    Width = 81
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 18
    object isBooked: TCheckBox
      Left = 11
      Top = 0
      Width = 70
      Height = 17
      Caption = 'Booked'
      TabOrder = 0
    end
  end
  object GroupIsService: TPanel
    Left = 890
    Top = 47
    Width = 166
    Height = 52
    BevelOuter = bvNone
    TabOrder = 19
    object Label3: TLabel
      Left = 157
      Top = 19
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
    object IsService: TCheckBox
      Left = 6
      Top = 0
      Width = 59
      Height = 18
      Caption = 'Service'
      TabOrder = 0
      OnClick = IsServiceClick
    end
    object cb_pilihan_service: TComboBox
      Left = 26
      Top = 24
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1270
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\WH App\OffLtr.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 912
    Top = 160
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 73290
      mmPrintPosition = 0
      object ppLogo: TppImage
        UserName = 'Logo'
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        mmHeight = 21431
        mmLeft = 122767
        mmTop = 2117
        mmWidth = 65881
        BandType = 0
      end
      object ppLabel387: TppLabel
        UserName = 'LabelTo'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'To '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 27517
        mmWidth = 12965
        BandType = 0
      end
      object ppContactName: TppLabel
        UserName = 'Label21'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 27517
        mmWidth = 72231
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'CONFIRMATION FORM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 8467
        mmTop = 8467
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'LabelTo5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 31750
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 35983
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label1010'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 31750
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label1011'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 35983
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'LabelTo6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Company'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 27517
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'HP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 31750
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 35983
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label1012'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label10101'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 31750
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label23'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 35983
        mmWidth = 1058
        BandType = 0
      end
      object ppemail: TppLabel
        UserName = 'Label24'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 31750
        mmWidth = 72231
        BandType = 0
      end
      object ppPhoneNo: TppLabel
        UserName = 'Label2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 35983
        mmWidth = 72231
        BandType = 0
      end
      object ppFaxNo: TppLabel
        UserName = 'Label9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 35983
        mmWidth = 72231
        BandType = 0
      end
      object ppCelularNo: TppLabel
        UserName = 'Label25'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 31750
        mmWidth = 72231
        BandType = 0
      end
      object ppCustomerName: TppLabel
        UserName = 'Label26'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 27517
        mmWidth = 72231
        BandType = 0
      end
      object ppHeaderMemo: TppMemo
        UserName = 'Memo1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 8467
        mmTop = 42333
        mmWidth = 180182
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 18521
        mmLeft = 8467
        mmTop = 55033
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RESERVATION DETAILS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 8467
        mmTop = 50800
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reservation No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 55033
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 55033
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label16'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 59267
        mmWidth = 1058
        BandType = 0
      end
      object ppLabelDate: TppLabel
        UserName = 'LabelDate'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 68792
        mmWidth = 29898
        BandType = 0
      end
      object ppLabelUnit: TppLabel
        UserName = 'LabelUnit'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Unit/Seats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 68792
        mmWidth = 25665
        BandType = 0
      end
      object ppLabelDestination: TppLabel
        UserName = 'LabelDestination'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Destination Details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 69056
        mmWidth = 76465
        BandType = 0
      end
      object ppLabelPrice: TppLabel
        UserName = 'LabelPrice'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 69056
        mmWidth = 27781
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 67733
        mmWidth = 180182
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 38100
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 63500
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'LabelDestination1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Flight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 69056
        mmWidth = 21431
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 139700
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 160867
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppReprinted: TppLabel
        UserName = 'Reprinted'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 14817
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PIC / Guide'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 63500
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 63500
        mmWidth = 1058
        BandType = 0
      end
      object ppGuide: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 63500
        mmWidth = 142082
        BandType = 0
      end
      object ppOrderId: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 55033
        mmWidth = 59531
        BandType = 0
      end
      object ppGroupName: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 59267
        mmWidth = 144198
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Thank you for choosing White Horse Deluxe Coach as your Transpor' +
          'tation partner, It'#39's our pleasure to confirm your reservation de' +
          'tails as follows :'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Lines.Strings = (
          
            'It'#39's our pleasure to confirm your reservation details as follows' +
            ' :')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 8467
        mmTop = 46567
        mmWidth = 180182
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLockSign: TppImage
        UserName = 'LockSign'
        MaintainAspectRatio = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Picture.Data = {
          0A544A504547496D61676589020000FFD8FFE100B045786966000049492A0008
          0000000500120103000100000001000000310102001C0000004A000000320102
          00140000006600000013020300010000000100000069870400010000007A0000
          00000000004143442053797374656D73204469676974616C20496D6167696E67
          00323031363A30353A31372032313A33343A3239000300909202000400000035
          30300002A00400010000000F00000003A00400010000000F00000000000000E0
          02D8D7FFC0001108000F000F03012100021101031101FFDB0084000201010101
          010201010102020202030503030202030604040305070607070706070608090B
          0908080A0806070A0D0A0A0B0C0C0D0C07090E0F0E0C0F0B0C0C0C0103030304
          030408040408120C0A0C12121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212FFC4005D
          0001010000000000000000000000000000050810000103030401040300000000
          00000000020103040506070809111221000A1415222331010100000000000000
          000000000000000000110100000000000000000000000000000000FFDA000C03
          010002110311003F00A93775D636DF74CDCBEC6D366E579AA033876D6B0A6DD1
          2EC93595262D52E07A6C7661373E2C51227442224875B6DD4E9C976545F1CAFB
          23EADF451756B4B3B697F4039C2355F0FF00D3D12EDB4ECF27E500D1A53BF219
          AB350989488F04743084E1363FADB37FF1E10F8F41037B86B18E77D226F9362E
          E655EC6E33B1DC29D6F54DA911654475E9A14F46525B1F1DD2E50D500C45487A
          F91545F1E19F6AA69E750D93B737C9FB8C55AC26215875AA6D5D972A272A2898
          CB9F39992DB4319A2E453AB6E72A80209D784FEA27A0FFD9}
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 55563
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Guest Name / Group'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 59267
        mmWidth = 29898
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDates: TppDBText
        UserName = 'Dates'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'dates'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 8467
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppLine100: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 8467
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppUnit: TppDBText
        UserName = 'Dates1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'unit_seat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 38100
        mmTop = 265
        mmWidth = 25665
        BandType = 4
      end
      object ppPrices: TppDBText
        UserName = 'Prices'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'total_amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppLine102: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 38100
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine103: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 63500
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine104: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 160867
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine105: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 188384
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 139700
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppFlight: TppDBText
        UserName = 'Flight'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'flight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 139700
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppRp: TppDBText
        UserName = 'Prices1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'rp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object pp_route: TppDBMemo
        UserName = 'pp_route'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        DataField = 'route'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 7408
        mmLeft = 64029
        mmTop = 265
        mmWidth = 75406
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label29'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Form :IT004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 8647
        mmTop = 0
        mmWidth = 17018
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label30'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rev : 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 96235
        mmTop = 0
        mmWidth = 7747
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label301'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tgl Terbit : 14-07-2014'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 160708
        mmTop = 0
        mmWidth = 24765
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 96838
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 20373
        mmLeft = 8467
        mmTop = 0
        mmWidth = 180182
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 63236
        mmLeft = 8467
        mmTop = 27517
        mmWidth = 180182
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 139700
        mmTop = 4498
        mmWidth = 48948
        BandType = 7
      end
      object ppLabel115: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TERMS & CONDITIONS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180182
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 91017
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 1270
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 2540
          PrinterSetup.mmPaperHeight = 297128
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Version = '10.06'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 41804
            mmPrintPosition = 0
            object ppFooterMemo: TppMemo
              UserName = 'FooterMemo'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 10848
              mmLeft = 8467
              mmTop = 0
              mmWidth = 173832
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppMemo4: TppMemo
              UserName = 'Memo5'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 
                'If there'#39's any changes or cancellation in reservation. Please in' +
                'form us at'#13#10'Phone. +62-21-2967-5555  |  Fax. +62-21-2967-5005  |' +
                '  Hotline. +62-21-6855-1445'#13#10'e-mail. marketing_jkt@whitehorse.co' +
                '.id'#13#10
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Lines.Strings = (
                
                  'Please sign this confirmation form and send it back to us by ema' +
                  'il or fax to confirm your booking. Thank you')
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4498
              mmLeft = 8467
              mmTop = 10583
              mmWidth = 173832
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLabel385: TppLabel
              UserName = 'Label1'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Jakarta,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 22490
              mmTop = 14817
              mmWidth = 11377
              BandType = 4
            end
            object ppDate: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33867
              mmTop = 14817
              mmWidth = 34131
              BandType = 4
            end
            object ppCompanySign: TppLabel
              UserName = 'CompanySign'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'PT. Panorama Transportasi Tbk'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 8467
              mmTop = 38100
              mmWidth = 61648
              BandType = 4
            end
            object ppAccepted: TppLabel
              UserName = 'Accepted'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Accepted By,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 19050
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSign: TppLabel
              UserName = 'LabelSign'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = '(..................................................)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 33867
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSignatureBelow: TppLabel
              UserName = 'Label1013'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Customer'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 38100
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSignature: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = '(..................................................)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 33867
              mmWidth = 53181
              BandType = 4
            end
            object ppSalesSign: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 33602
              mmWidth = 53181
              BandType = 4
            end
            object ppSincerely: TppLabel
              UserName = 'Sincerely'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Sincerely Yours,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 18521
              mmWidth = 53181
              BandType = 4
            end
            object ppSignature: TppImage
              UserName = 'Signature'
              MaintainAspectRatio = False
              Stretch = True
              Transparent = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              mmHeight = 12171
              mmLeft = 12700
              mmTop = 21960
              mmWidth = 53181
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLabelDiscountRp: TppLabel
        UserName = 'Label3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 161396
        mmTop = 529
        mmWidth = 5038
        BandType = 7
      end
      object ppDiscount: TppLabel
        UserName = 'LabelPrice1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 166688
        mmTop = 529
        mmWidth = 21431
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 160867
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppTotal: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167217
        mmTop = 12700
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 12700
        mmWidth = 5556
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 12700
        mmWidth = 20373
        BandType = 7
      end
      object ppLabelDiscount: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 529
        mmWidth = 20108
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 139700
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppRemakLabel: TppLabel
        UserName = 'LabelTo1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 529
        mmWidth = 16669
        BandType = 7
      end
      object ppRemark: TppMemo
        UserName = 'Memo2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 19844
        mmLeft = 25400
        mmTop = 529
        mmWidth = 113771
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 139700
        mmTop = 9260
        mmWidth = 48948
        BandType = 7
      end
      object ppServicesRp: TppLabel
        UserName = 'ServicesRp'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 5292
        mmWidth = 5027
        BandType = 7
      end
      object ppServices: TppLabel
        UserName = 'Services'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 5292
        mmWidth = 21431
        BandType = 7
      end
      object ppServicesLabel: TppLabel
        UserName = 'ServicesLabel'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 5292
        mmWidth = 20373
        BandType = 7
      end
      object ppTermsConditionDetail: TppMemo
        UserName = 'TermsConditionDetail'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = #13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 65881
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 178065
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppTermsConditionDetail2: TppMemo
        UserName = 'TermsConditionDetail1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 57415
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 178065
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
end
