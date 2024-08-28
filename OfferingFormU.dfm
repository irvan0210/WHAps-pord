object OfferingForm: TOfferingForm
  Left = 355
  Top = 149
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Surat Penawaran'
  ClientHeight = 566
  ClientWidth = 1077
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
    Top = 544
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
  object GroupDetail: TGroupBox
    Left = 8
    Top = 480
    Width = 465
    Height = 81
    TabOrder = 3
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
      Height = 65
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
        Height = 41
        TabOrder = 0
        OnKeyPress = RemarkKeyPress
      end
    end
  end
  object Panel2: TPanel
    Left = 872
    Top = 481
    Width = 193
    Height = 73
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 8
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
    Left = 792
    Top = 480
    Width = 73
    Height = 25
    BevelOuter = bvNone
    TabOrder = 9
    object Status: TCheckBox
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Batal'
      TabOrder = 0
    end
  end
  object GroupOrder: TGroupBox
    Left = 8
    Top = 232
    Width = 1057
    Height = 249
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
      Width = 1041
      Height = 225
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
      OnKeyDown = DateStartKeyDown
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
      Text = '  :  '
      Visible = False
      OnExit = TimeStartExit
      OnKeyDown = TimeStartKeyDown
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
      OnKeyDown = DateFinishKeyDown
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
      Text = '  :  '
      Visible = False
      OnExit = TimeStandbyExit
      OnKeyDown = TimeStandbyKeyDown
      OnKeyPress = TimeStandbyKeyPress
    end
    object Details: TMemo
      Left = 160
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
      Left = 296
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
      Top = 24
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
  end
  object GroupService: TGroupBox
    Left = 512
    Top = 80
    Width = 329
    Height = 153
    Caption = 'Biaya/Layanan Tambahan'
    TabOrder = 11
    TabStop = True
    object GridService: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 313
      Height = 129
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 136
    Width = 497
    Height = 97
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
    end
    object Label17: TLabel
      Left = 57
      Top = 44
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
    end
    object Address: TMemo
      Left = 120
      Top = 8
      Width = 369
      Height = 33
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object HeaderRemark: TMemo
      Left = 120
      Top = 45
      Width = 369
      Height = 44
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object GroupHeader: TGroupBox
    Left = 8
    Top = 0
    Width = 497
    Height = 137
    Caption = 'Prospek / Pelanggan'
    TabOrder = 1
    TabStop = True
    object Label1: TLabel
      Left = 73
      Top = 16
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prospek'
    end
    object Label4: TLabel
      Left = 61
      Top = 40
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pelanggan'
    end
    object Label5: TLabel
      Left = 78
      Top = 64
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kontak'
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
      Left = 109
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
    object Label20: TLabel
      Left = 83
      Top = 112
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Group'
    end
    object Panel1: TPanel
      Left = 120
      Top = 16
      Width = 337
      Height = 97
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object LeadDisp: TEdit
        Left = 80
        Top = 0
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object CustomerDisp: TEdit
        Left = 80
        Top = 24
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 3
      end
      object ContactDisp: TEdit
        Left = 80
        Top = 48
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 5
      end
      object LeadId: TEdit
        Left = 0
        Top = 0
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object CustomerId: TEdit
        Left = 0
        Top = 24
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 2
      end
      object ContactId: TEdit
        Left = 0
        Top = 48
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 4
      end
      object ContractId: TEdit
        Left = 0
        Top = 72
        Width = 177
        Height = 21
        TabStop = False
        TabOrder = 6
      end
    end
    object PanelCariLead: TPanel
      Left = 408
      Top = 15
      Width = 49
      Height = 26
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object CariLead: TSpeedButton
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
        OnClick = CariLeadClick
      end
    end
    object PanelCariCustomer: TPanel
      Left = 408
      Top = 39
      Width = 49
      Height = 26
      BevelOuter = bvNone
      TabOrder = 2
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
      Top = 64
      Width = 49
      Height = 24
      BevelOuter = bvNone
      TabOrder = 3
      TabStop = True
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
      Width = 49
      Height = 23
      BevelOuter = bvNone
      TabOrder = 4
      TabStop = True
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
    end
    object Group: TEdit
      Left = 120
      Top = 112
      Width = 289
      Height = 21
      TabStop = False
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 512
    Top = 0
    Width = 329
    Height = 81
    Enabled = False
    TabOrder = 0
    object Label3: TLabel
      Left = 5
      Top = 8
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Surat Penawaran'
    end
    object Label2: TLabel
      Left = 63
      Top = 32
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label12: TLabel
      Left = 76
      Top = 56
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sales'
    end
    object Label15: TLabel
      Left = 104
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
      Left = 103
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
    object OfferingId: TEdit
      Left = 112
      Top = 8
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object OfferingDate: TEdit
      Left = 112
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object SalesPerson: TEdit
      Left = 112
      Top = 56
      Width = 129
      Height = 21
      TabOrder = 2
    end
  end
  object Selesai: TButton
    Left = 984
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 984
    Top = 104
    Width = 73
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = SimpanClick
  end
  object CetakUlang: TButton
    Left = 984
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 7
    OnClick = CetakUlangClick
  end
  object Bersihkan: TButton
    Left = 984
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 10
    OnClick = BersihkanClick
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3810
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
    Left = 920
    Top = 8
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 81756
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 29633
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Jakarta, '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 33867
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label9'
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
        mmLeft = 122767
        mmTop = 29633
        mmWidth = 1058
        BandType = 0
      end
      object ppOfferingId: TppLabel
        UserName = 'Label16'
        AutoSize = False
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
        mmLeft = 124884
        mmTop = 29633
        mmWidth = 55298
        BandType = 0
      end
      object ppDate: TppLabel
        UserName = 'Label19'
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
        mmLeft = 127000
        mmTop = 33867
        mmWidth = 55298
        BandType = 0
      end
      object ppLogo: TppImage
        UserName = 'Logo'
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        mmHeight = 25665
        mmLeft = 12700
        mmTop = 0
        mmWidth = 72231
        BandType = 0
      end
      object ppLabelTo: TppLabel
        UserName = 'LabelTo'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'To :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object ppTo: TppMemo
        UserName = 'To'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'To'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 25929
        mmLeft = 12700
        mmTop = 30427
        mmWidth = 84931
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppAbout: TppLabel
        UserName = 'About'
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
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 57150
        mmWidth = 42598
        BandType = 0
      end
      object ppGreetingHeader: TppMemo
        UserName = 'GreetingHeader'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'GreetingHeader'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 12965
        mmLeft = 12700
        mmTop = 63500
        mmWidth = 163248
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 5821
        mmLeft = 8467
        mmTop = 76200
        mmWidth = 171715
        BandType = 0
      end
      object ppLabelDate: TppLabel
        UserName = 'LabelDate'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 77258
        mmWidth = 29898
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 38100
        mmTop = 76200
        mmWidth = 265
        BandType = 0
      end
      object ppLabelUnit: TppLabel
        UserName = 'LabelUnit'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 77258
        mmWidth = 32015
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 69850
        mmTop = 76200
        mmWidth = 265
        BandType = 0
      end
      object ppLabelDestination: TppLabel
        UserName = 'LabelDestination'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 69850
        mmTop = 77523
        mmWidth = 80698
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 150284
        mmTop = 76200
        mmWidth = 265
        BandType = 0
      end
      object ppLabelPrice: TppLabel
        UserName = 'LabelPrice'
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 77523
        mmWidth = 29898
        BandType = 0
      end
      object ppReprinted: TppLabel
        UserName = 'Label21'
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
        mmLeft = 137584
        mmTop = 19050
        mmWidth = 43656
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8731
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
        mmHeight = 8202
        mmLeft = 8467
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 8467
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 150284
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
        mmHeight = 8202
        mmLeft = 38100
        mmTop = 265
        mmWidth = 32015
        BandType = 4
      end
      object ppRoute: TppDBText
        UserName = 'Route'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'route_indo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8731
        mmLeft = 69850
        mmTop = 0
        mmWidth = 80698
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
        mmLeft = 154782
        mmTop = 2117
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 2117
        mmWidth = 5027
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 38100
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 69850
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 150284
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 179917
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line102'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 8731
        mmWidth = 171715
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 129382
      mmPrintPosition = 0
      object ppAccount: TppMemo
        UserName = 'Account'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Account'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          #9'  '#9#9#9'           ')
        Transparent = True
        mmHeight = 89165
        mmLeft = 10583
        mmTop = 25400
        mmWidth = 184415
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppTermsConditionDetail: TppMemo
        UserName = 'TermsConditionDetail'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TermsConditionDetail'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 90223
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 184415
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabelTermCondition: TppLabel
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
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 23283
        mmWidth = 61648
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 20373
        mmLeft = 8467
        mmTop = 0
        mmWidth = 171715
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 150284
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 5027
        mmWidth = 171715
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 794
        mmWidth = 5027
        BandType = 7
      end
      object ppLabelRpDiscount: TppLabel
        UserName = 'LabelRpDiscount'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 5821
        mmWidth = 5027
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 10054
        mmWidth = 171715
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 15875
        mmWidth = 5027
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label14'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Sub Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 794
        mmWidth = 13758
        BandType = 7
      end
      object ppLabelDiscount: TppLabel
        UserName = 'Label15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Discount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 136779
        mmTop = 5821
        mmWidth = 12446
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label17'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 141817
        mmTop = 15875
        mmWidth = 7144
        BandType = 7
      end
      object ppSubTotal: TppLabel
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 1058
        mmWidth = 23548
        BandType = 7
      end
      object ppDiscount: TppLabel
        UserName = 'Label20'
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
        mmLeft = 155575
        mmTop = 5821
        mmWidth = 23548
        BandType = 7
      end
      object ppTotal: TppLabel
        UserName = 'Label201'
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 16140
        mmWidth = 23548
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 15081
        mmWidth = 171715
        BandType = 7
      end
      object ppLabelRpService: TppLabel
        UserName = 'Label22'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 10848
        mmWidth = 5027
        BandType = 7
      end
      object ppServicesPrice: TppLabel
        UserName = 'Label202'
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
        mmLeft = 155575
        mmTop = 10848
        mmWidth = 23548
        BandType = 7
      end
      object ppServices: TppLabel
        UserName = 'LabelDestination1'
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
        mmLeft = 8996
        mmTop = 10848
        mmWidth = 139965
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
        Stretch = True
        Transparent = True
        mmHeight = 265
        mmLeft = 25400
        mmTop = 118534
        mmWidth = 169598
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppRemark
        TraverseAllData = False
        mmHeight = 6615
        mmLeft = 0
        mmTop = 122767
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
          PrinterSetup.mmMarginBottom = 3810
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
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 24871
            mmPrintPosition = 0
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
              mmTop = 21167
              mmWidth = 61648
              BandType = 7
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
              mmTop = 1323
              mmWidth = 53181
              BandType = 7
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
              mmTop = 16933
              mmWidth = 53181
              BandType = 7
            end
            object ppSalesSign: TppLabel
              UserName = 'Label12'
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
              mmTop = 16404
              mmWidth = 53181
              BandType = 7
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
              mmLeft = 16933
              mmTop = 4498
              mmWidth = 44715
              BandType = 7
            end
          end
        end
      end
      object ppRemarkLabel: TppLabel
        UserName = 'RemarkLabel'
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
        mmLeft = 10583
        mmTop = 118534
        mmWidth = 15081
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
