object ProductPriceDetail: TProductPriceDetail
  Left = 353
  Top = 242
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Detail Produk'
  ClientHeight = 149
  ClientWidth = 504
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
  object Label1: TLabel
    Left = 59
    Top = 48
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan'
  end
  object Label2: TLabel
    Left = 29
    Top = 24
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jenis Armada'
  end
  object LabelAktif: TLabel
    Left = 74
    Top = 96
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aktif'
  end
  object Label18: TLabel
    Left = 104
    Top = 126
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
  object Label17: TLabel
    Left = 92
    Top = 23
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
  object Label19: TLabel
    Left = 92
    Top = 47
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
  object Label3: TLabel
    Left = 30
    Top = 72
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Bahan Bakar'
  end
  object Label5: TLabel
    Left = 92
    Top = 71
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
  object GroupInput: TPanel
    Left = 104
    Top = 24
    Width = 305
    Height = 97
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 30
      Top = 50
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Liter'
    end
    object Label7: TLabel
      Left = 158
      Top = 0
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Destination: TEdit
      Left = 0
      Top = 24
      Width = 297
      Height = 21
      TabOrder = 2
      OnKeyPress = DestinationKeyPress
    end
    object VehicleGroup: TComboBox
      Left = 0
      Top = 0
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = VehicleGroupChange
      OnKeyPress = VehicleGroupKeyPress
    end
    object Fuel: TEdit
      Left = 0
      Top = 48
      Width = 25
      Height = 21
      MaxLength = 3
      TabOrder = 3
      OnKeyPress = FuelKeyPress
    end
    object Status: TCheckBox
      Left = 0
      Top = 72
      Width = 33
      Height = 17
      TabOrder = 4
      OnKeyPress = StatusKeyPress
    end
    object Seat: TComboBox
      Left = 184
      Top = 0
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = SeatKeyPress
    end
  end
  object Simpan: TButton
    Left = 416
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 416
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 416
    Top = 114
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
  object ProductDetailId: TEdit
    Left = 104
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 0
    Visible = False
  end
end
