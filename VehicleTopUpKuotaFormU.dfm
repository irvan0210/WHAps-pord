object VehicleTopUpKuotaForm: TVehicleTopUpKuotaForm
  Left = 467
  Top = 189
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Vehicle Topup Kuota'
  ClientHeight = 191
  ClientWidth = 281
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
    Left = 50
    Top = 66
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kuota'
  end
  object Label2: TLabel
    Left = 5
    Top = 113
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Topup'
  end
  object Label6: TLabel
    Left = 22
    Top = 39
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nomor Polisi'
  end
  object Label5: TLabel
    Left = 21
    Top = 15
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nomor Kartu'
  end
  object Label3: TLabel
    Left = 80
    Top = 65
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
  object Label4: TLabel
    Left = 49
    Top = 92
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Harga'
  end
  object Group: TPanel
    Left = 80
    Top = 9
    Width = 187
    Height = 55
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label18: TLabel
      Left = 0
      Top = -1
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
    object Label21: TLabel
      Left = 0
      Top = 22
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
    object Label11: TLabel
      Left = 82
      Top = 21
      Width = 7
      Height = 29
      Alignment = taRightJustify
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NoMsisdn: TEdit
      Left = 8
      Top = 3
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object NoPolisi: TEdit
      Left = 8
      Top = 26
      Width = 65
      Height = 21
      TabOrder = 1
    end
    object NoPolisi2: TEdit
      Left = 96
      Top = 26
      Width = 65
      Height = 21
      TabOrder = 2
    end
  end
  object GroupInput: TPanel
    Left = 88
    Top = 64
    Width = 179
    Height = 77
    BevelOuter = bvNone
    TabOrder = 1
    object kuota: TEdit
      Left = 0
      Top = 0
      Width = 49
      Height = 21
      TabOrder = 0
      OnKeyPress = kuotaKeyPress
    end
    object TopupDate: TDateTimePicker
      Left = 0
      Top = 46
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 2
    end
    object harga: TEdit
      Left = 0
      Top = 23
      Width = 87
      Height = 21
      TabOrder = 1
      OnEnter = hargaEnter
      OnExit = hargaExit
      OnKeyPress = hargaKeyPress
    end
  end
  object Simpan: TButton
    Left = 40
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 167
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object VehicleId: TEdit
    Left = 480
    Top = 79
    Width = 153
    Height = 21
    TabOrder = 4
    Visible = False
  end
end
