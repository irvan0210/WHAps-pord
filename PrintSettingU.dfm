object PrintSetting: TPrintSetting
  Left = 829
  Top = 164
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pengaturan Pencetakan'
  ClientHeight = 287
  ClientWidth = 233
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
  object Simpan: TButton
    Left = 64
    Top = 227
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 144
    Top = 227
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 49
    Caption = 'Garis/Kotak'
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 18
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tambahan'
    end
    object Label2: TLabel
      Left = 96
      Top = 19
      Width = 24
      Height = 13
      Caption = 'Point'
    end
    object AddPoint: TEdit
      Left = 64
      Top = 16
      Width = 25
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = AddPointKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 64
    Width = 217
    Height = 73
    Caption = 'Surat Jalan'
    TabOrder = 3
    object Label3: TLabel
      Left = 36
      Top = 22
      Width = 21
      Height = 13
      Caption = 'Tipe'
    end
    object Label5: TLabel
      Left = 8
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Tambahan'
    end
    object Label6: TLabel
      Left = 158
      Top = 48
      Width = 22
      Height = 13
      Caption = 'TOP'
    end
    object CBSuratJalan: TComboBox
      Left = 61
      Top = 20
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'EPSON LX-300+ II'
      Items.Strings = (
        'EPSON LX-300+ II'
        'EPSON LX-310')
    end
    object TopSJ: TEdit
      Left = 61
      Top = 45
      Width = 92
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 144
    Width = 217
    Height = 81
    Caption = 'Invoice'
    TabOrder = 4
    object Label4: TLabel
      Left = 36
      Top = 14
      Width = 21
      Height = 13
      Caption = 'Tipe'
    end
    object Label7: TLabel
      Left = 11
      Top = 39
      Width = 51
      Height = 13
      Caption = 'Tambahan'
    end
    object Label8: TLabel
      Left = 161
      Top = 39
      Width = 22
      Height = 13
      Caption = 'TOP'
    end
    object CBInvoice: TComboBox
      Left = 64
      Top = 12
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'EPSON LX-300+ II'
      Items.Strings = (
        'EPSON LX-300+ II'
        'EPSON LX-310')
    end
    object TopInv: TEdit
      Left = 64
      Top = 36
      Width = 92
      Height = 21
      TabOrder = 1
    end
  end
end
