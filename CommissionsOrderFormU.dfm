object CommissionsOrderForm: TCommissionsOrderForm
  Left = 377
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Commission Order'
  ClientHeight = 240
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupHeader: TGroupBox
    Left = 8
    Top = 0
    Width = 545
    Height = 233
    Caption = 'Pelanggan'
    TabOrder = 0
    TabStop = True
    object Label4: TLabel
      Left = 62
      Top = 18
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pelanggan'
    end
    object Label5: TLabel
      Left = 56
      Top = 43
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jenis Komisi'
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
    object Label24: TLabel
      Left = 60
      Top = 67
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipe Komisi'
    end
    object Label1: TLabel
      Left = 34
      Top = 91
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jenis Nilai Komisi'
    end
    object Panel1: TPanel
      Left = 120
      Top = 8
      Width = 337
      Height = 200
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object CustomerId: TEdit
        Left = 0
        Top = 8
        Width = 81
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object CustomerDisp: TEdit
        Left = 80
        Top = 8
        Width = 209
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object JnsKomisi: TComboBox
        Left = 0
        Top = 31
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object TipeKomisi: TComboBox
        Left = 0
        Top = 55
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object JenisNilaiKomisi: TComboBox
        Left = 0
        Top = 79
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
      object PanelVhc: TPanel
        Left = 0
        Top = 107
        Width = 225
        Height = 65
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 5
        object Label21: TLabel
          Left = 44
          Top = 33
          Width = 11
          Height = 13
          Alignment = taRightJustify
          Caption = '%'
        end
        object Label2: TLabel
          Left = 9
          Top = 10
          Width = 34
          Height = 13
          Caption = 'Big Bus'
        end
        object Label3: TLabel
          Left = 81
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Med Bus'
        end
        object Label6: TLabel
          Left = 116
          Top = 33
          Width = 11
          Height = 13
          Alignment = taRightJustify
          Caption = '%'
        end
        object Label7: TLabel
          Left = 161
          Top = 10
          Width = 36
          Height = 13
          Caption = 'Minivan'
        end
        object Label8: TLabel
          Left = 196
          Top = 33
          Width = 11
          Height = 13
          Alignment = taRightJustify
          Caption = '%'
        end
        object BBamount: TEdit
          Left = 8
          Top = 28
          Width = 33
          Height = 21
          TabOrder = 0
        end
        object MBamount: TEdit
          Left = 80
          Top = 28
          Width = 33
          Height = 21
          TabOrder = 1
        end
        object MVamount: TEdit
          Left = 160
          Top = 28
          Width = 33
          Height = 21
          TabOrder = 2
        end
      end
    end
    object PanelCariCustomer: TPanel
      Left = 408
      Top = 14
      Width = 49
      Height = 26
      BevelOuter = bvNone
      TabOrder = 1
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
  end
end
