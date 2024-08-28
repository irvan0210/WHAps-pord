object AdditionalFeeOrderForm: TAdditionalFeeOrderForm
  Left = 265
  Top = 217
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tambahan Biaya Pesanan'
  ClientHeight = 357
  ClientWidth = 991
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
    Left = 488
    Top = 328
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
  object Panel2: TPanel
    Left = 696
    Top = 273
    Width = 193
    Height = 73
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 5
    object Label9: TLabel
      Left = 18
      Top = 2
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sub Total'
    end
    object Label10: TLabel
      Left = 22
      Top = 23
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Discount'
    end
    object Label11: TLabel
      Left = 40
      Top = 46
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object SubTotal: TMemo
      Left = 72
      Top = 0
      Width = 113
      Height = 22
      Alignment = taRightJustify
      TabOrder = 0
      WantReturns = False
    end
    object Discount: TMemo
      Left = 72
      Top = 24
      Width = 113
      Height = 22
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
    end
    object Total: TMemo
      Left = 72
      Top = 48
      Width = 113
      Height = 22
      Alignment = taRightJustify
      TabOrder = 2
      WantReturns = False
    end
  end
  object GroupBatal: TPanel
    Left = 632
    Top = 272
    Width = 73
    Height = 25
    BevelOuter = bvNone
    TabOrder = 6
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
    Left = 904
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 9
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 904
    Top = 256
    Width = 73
    Height = 25
    Caption = 'Simpan'
    TabOrder = 7
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 904
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 8
    OnClick = BersihkanClick
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 272
    Width = 465
    Height = 73
    TabOrder = 4
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
      Left = 53
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Pesanan'
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
      object RefOrderId: TEdit
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
    object PanelCari: TPanel
      Left = 328
      Top = 15
      Width = 49
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      object CariPesanan: TSpeedButton
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
        OnClick = CariPesananClick
      end
    end
    object DiscountCN: TEdit
      Left = 120
      Top = 136
      Width = 33
      Height = 21
      TabOrder = 2
      OnKeyPress = DiscountCNKeyPress
    end
    object Guide: TEdit
      Left = 120
      Top = 160
      Width = 209
      Height = 21
      TabStop = False
      TabOrder = 3
      OnKeyPress = GuideKeyPress
    end
    object GuideCellular: TEdit
      Left = 394
      Top = 160
      Width = 145
      Height = 21
      TabStop = False
      TabOrder = 4
      OnKeyPress = GuideCellularKeyPress
    end
    object Group: TEdit
      Left = 120
      Top = 112
      Width = 289
      Height = 21
      TabStop = False
      TabOrder = 5
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
  object GroupBox2: TGroupBox
    Left = 560
    Top = 0
    Width = 329
    Height = 81
    Enabled = False
    TabOrder = 0
    object Label3: TLabel
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
  end
  object GroupSalesPerson: TPanel
    Left = 648
    Top = 56
    Width = 233
    Height = 23
    BevelOuter = bvNone
    TabOrder = 10
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
end
