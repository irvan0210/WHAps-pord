object MemoForm: TMemoForm
  Left = 399
  Top = 245
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Memo Form'
  ClientHeight = 289
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
    Left = 15
    Top = 96
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Judul Memo'
  end
  object Label3: TLabel
    Left = 15
    Top = 121
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Periode Berlaku'
  end
  object Label1: TLabel
    Left = 15
    Top = 12
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ID Document'
  end
  object Label5: TLabel
    Left = 15
    Top = 70
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Nomor Memo'
  end
  object Label6: TLabel
    Left = 104
    Top = 184
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = ':'
  end
  object Label11: TLabel
    Left = 15
    Top = 142
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Deskripsi'
  end
  object Label30: TLabel
    Left = 93
    Top = 68
    Width = 6
    Height = 20
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 93
    Top = 94
    Width = 6
    Height = 20
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 16
    Top = 42
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Customer '
  end
  object Label21: TLabel
    Left = 92
    Top = 39
    Width = 6
    Height = 20
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Batal: TButton
    Left = 280
    Top = 253
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 184
    Top = 253
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 100
    Top = 4
    Width = 253
    Height = 29
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label9: TLabel
      Left = 3
      Top = 5
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DocId: TEdit
      Left = 15
      Top = 5
      Width = 170
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 100
    Top = 63
    Width = 437
    Height = 137
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 3
      Top = 5
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 3
      Top = 30
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 3
      Top = 55
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 3
      Top = 78
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 108
      Top = 57
      Width = 21
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 's/d'
    end
    object DocTitle: TEdit
      Left = 15
      Top = 30
      Width = 423
      Height = 21
      TabOrder = 1
      OnKeyPress = DocTitleKeyPress
    end
    object DocNumber: TEdit
      Left = 15
      Top = 3
      Width = 200
      Height = 21
      TabOrder = 0
      OnKeyPress = DocTitleKeyPress
    end
    object StartDate: TDateTimePicker
      Left = 15
      Top = 54
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 2
    end
    object Description: TMemo
      Left = 16
      Top = 80
      Width = 422
      Height = 55
      TabOrder = 3
    end
    object EndDate: TDateTimePicker
      Left = 138
      Top = 53
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 4
    end
  end
  object Active: TCheckBox
    Left = 478
    Top = 3
    Width = 58
    Height = 17
    Caption = 'Active'
    Enabled = False
    TabOrder = 4
    OnKeyPress = ActiveKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 200
    Width = 528
    Height = 42
    TabOrder = 5
    object Label10: TLabel
      Left = 7
      Top = 16
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama File'
    end
    object Label14: TLabel
      Left = 85
      Top = 10
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 7
      Top = 45
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'File Ext'
    end
    object Label16: TLabel
      Left = 233
      Top = 45
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'File Size (KB) : '
    end
    object Label17: TLabel
      Left = 95
      Top = 13
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 93
      Top = 43
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditFileName: TEdit
      Left = 107
      Top = 12
      Width = 279
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EditFileNameKeyPress
    end
    object Upload: TButton
      Left = 392
      Top = 9
      Width = 71
      Height = 24
      Caption = 'Upload File'
      TabOrder = 0
      OnClick = UploadClick
    end
    object Preview: TButton
      Left = 470
      Top = 9
      Width = 52
      Height = 24
      Caption = 'Preview'
      TabOrder = 2
      OnClick = PreviewClick
    end
    object EditFileExt: TEdit
      Left = 107
      Top = 42
      Width = 70
      Height = 21
      TabOrder = 3
    end
    object EditFileSize: TEdit
      Left = 316
      Top = 42
      Width = 70
      Height = 21
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 100
    Top = 36
    Width = 397
    Height = 25
    BevelOuter = bvNone
    TabOrder = 6
    object Label20: TLabel
      Left = 3
      Top = 1
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CariCustomer: TSpeedButton
      Left = 368
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
    object CustomerName: TEdit
      Left = 96
      Top = 1
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object CustomerID: TEdit
      Left = 15
      Top = 1
      Width = 79
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 240
  end
end
