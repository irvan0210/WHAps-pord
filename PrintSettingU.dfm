object PrintSetting: TPrintSetting
  Left = 907
  Top = 179
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pengaturan Pencetakan'
  ClientHeight = 166
  ClientWidth = 238
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
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 53
    Height = 13
    Caption = 'Surat Jalan'
  end
  object Label4: TLabel
    Left = 9
    Top = 96
    Width = 35
    Height = 13
    Caption = 'Invoice'
  end
  object Simpan: TButton
    Left = 64
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 144
    Top = 123
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
  object CBSuratJalan: TComboBox
    Left = 76
    Top = 68
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = 'EPSON LX-300+ II'
    Items.Strings = (
      'EPSON LX-300+ II'
      'EPSON LX-310')
  end
  object CBInvoice: TComboBox
    Left = 76
    Top = 92
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = 'EPSON LX-300+ II'
    Items.Strings = (
      'EPSON LX-300+ II'
      'EPSON LX-310')
  end
end
