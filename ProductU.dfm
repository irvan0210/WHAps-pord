object Product: TProduct
  Left = 452
  Top = 286
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Jenis Produk'
  ClientHeight = 150
  ClientWidth = 502
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
    Left = 8
    Top = 32
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Jenis Produk'
  end
  object Label2: TLabel
    Left = 21
    Top = 56
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jenis Kendaraan'
  end
  object Label8: TLabel
    Left = 9
    Top = 80
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lama Penggunaan'
  end
  object LabelAktif: TLabel
    Left = 79
    Top = 104
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aktif'
  end
  object Label5: TLabel
    Left = 54
    Top = 8
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Id Produk'
  end
  object Label18: TLabel
    Left = 112
    Top = 132
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
  object Label6: TLabel
    Left = 100
    Top = 79
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
  object Label9: TLabel
    Left = 100
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
  object Label17: TLabel
    Left = 100
    Top = 31
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
  object PanelId: TPanel
    Left = 112
    Top = 8
    Width = 145
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object ProductId: TEdit
      Left = 0
      Top = 0
      Width = 109
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 112
    Top = 32
    Width = 305
    Height = 97
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 31
      Top = 50
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam /'
    end
    object Label7: TLabel
      Left = 134
      Top = 24
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seat'
    end
    object Name: TEdit
      Left = 0
      Top = 0
      Width = 281
      Height = 21
      TabOrder = 0
      OnKeyPress = NameKeyPress
    end
    object VehicleType: TComboBox
      Left = 0
      Top = 24
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = VehicleTypeChange
      OnKeyPress = VehicleTypeKeyPress
    end
    object Hours: TEdit
      Left = 0
      Top = 48
      Width = 25
      Height = 21
      MaxLength = 3
      TabOrder = 3
      OnChange = HoursChange
      OnExit = HoursExit
      OnKeyPress = HoursKeyPress
    end
    object OneDay: TCheckBox
      Left = 136
      Top = 48
      Width = 73
      Height = 17
      Caption = '1 Full Day /'
      TabOrder = 4
      Visible = False
      OnClick = OneDayClick
      OnKeyPress = OneDayKeyPress
    end
    object Status: TCheckBox
      Left = 0
      Top = 72
      Width = 33
      Height = 17
      TabOrder = 6
    end
    object Overland: TCheckBox
      Left = 64
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Overland'
      TabOrder = 5
      OnClick = OverlandClick
      OnKeyPress = OverlandKeyPress
    end
    object Seat: TComboBox
      Left = 160
      Top = 24
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
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
end
