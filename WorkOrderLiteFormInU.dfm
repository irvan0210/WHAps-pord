object WorkOrderLiteFormIn: TWorkOrderLiteFormIn
  Left = 339
  Top = 124
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Tutup Perintah Kerja Bengkel (Ringan)'
  ClientHeight = 505
  ClientWidth = 907
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 457
    Height = 249
    Caption = 'PKB '
    TabOrder = 1
    object Label2: TLabel
      Left = 15
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label4: TLabel
      Left = 13
      Top = 72
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Body'
    end
    object Label8: TLabel
      Left = 15
      Top = 96
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keluhan'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No PKB'
    end
    object KeluhanGrid: TStringGrid
      Left = 80
      Top = 96
      Width = 369
      Height = 145
      ColCount = 1
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = PekerjaanGridSelectCell
      ColWidths = (
        259)
    end
    object Panel1: TPanel
      Left = 64
      Top = 44
      Width = 273
      Height = 49
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Label3: TLabel
        Left = 171
        Top = 4
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jam'
      end
      object Label5: TLabel
        Left = 149
        Top = 28
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'No Polisi'
      end
      object Tanggal: TEdit
        Left = 16
        Top = 4
        Width = 97
        Height = 21
        TabOrder = 0
      end
      object Jam: TEdit
        Left = 200
        Top = 4
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object NoBody: TEdit
        Left = 16
        Top = 28
        Width = 73
        Height = 21
        TabOrder = 2
      end
      object NoPolisi: TEdit
        Left = 200
        Top = 28
        Width = 97
        Height = 21
        TabOrder = 3
      end
    end
  end
  object Simpan: TButton
    Left = 488
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 488
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 488
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
  object GroupDetail: TGroupBox
    Left = 8
    Top = 256
    Width = 457
    Height = 233
    Caption = 'Data PKB'
    TabOrder = 5
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object TombolCari: TSpeedButton
      Left = 186
      Top = 16
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
      OnClick = TombolCariClick
    end
    object StrGrid: TStringGrid
      Left = 8
      Top = 40
      Width = 441
      Height = 185
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnClick = StrGridClick
      OnSelectCell = StrGridSelectCell
      ColWidths = (
        110
        64
        80
        54
        79)
    end
    object Cari: TEdit
      Left = 32
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = CariChange
      OnKeyPress = CariKeyPress
    end
  end
  object NoPKB: TComboBox
    Left = 88
    Top = 24
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = NoPKBChange
  end
  object GroupParts: TGroupBox
    Left = 472
    Top = 224
    Width = 425
    Height = 177
    Caption = 'Pemakaian Parts'
    TabOrder = 7
    Visible = False
    object PartsGrid: TStringGrid
      Left = 8
      Top = 16
      Width = 409
      Height = 153
      ColCount = 2
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = PartsGridSelectCell
      ColWidths = (
        206
        119)
    end
    object PartsDetail: TEdit
      Left = 8
      Top = 40
      Width = 265
      Height = 21
      TabOrder = 1
      Visible = False
      OnExit = PekerjaanDetailExit
      OnKeyDown = PekerjaanDetailKeyDown
      OnKeyPress = PekerjaanDetailKeyPress
    end
    object PartsName: TEdit
      Left = 272
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = TeknisiExit
      OnKeyDown = TeknisiKeyDown
      OnKeyPress = TeknisiKeyPress
    end
  end
  object GroupPekerjaan: TGroupBox
    Left = 472
    Top = 0
    Width = 425
    Height = 225
    Caption = 'Pekerjaan'
    TabOrder = 6
    object Label6: TLabel
      Left = 10
      Top = 24
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Selesai'
    end
    object Label9: TLabel
      Left = 219
      Top = 24
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object PekerjaanGrid: TStringGrid
      Left = 8
      Top = 48
      Width = 409
      Height = 169
      ColCount = 2
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = PekerjaanGridSelectCell
      ColWidths = (
        262
        119)
    end
    object PekerjaanDetail: TEdit
      Left = 16
      Top = 64
      Width = 265
      Height = 21
      TabOrder = 1
      Visible = False
      OnExit = PekerjaanDetailExit
      OnKeyDown = PekerjaanDetailKeyDown
      OnKeyPress = PekerjaanDetailKeyPress
    end
    object Teknisi: TEdit
      Left = 280
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = TeknisiExit
      OnKeyDown = TeknisiKeyDown
      OnKeyPress = TeknisiKeyPress
    end
    object TanggalSelesai: TDateTimePicker
      Left = 96
      Top = 24
      Width = 89
      Height = 21
      Date = 42222.565481944450000000
      Time = 42222.565481944450000000
      TabOrder = 3
    end
    object JamSelesai: TMaskEdit
      Left = 248
      Top = 25
      Width = 41
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
    end
  end
end
