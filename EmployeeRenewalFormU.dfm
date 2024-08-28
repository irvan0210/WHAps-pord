object EmployeeRenewalForm: TEmployeeRenewalForm
  Left = 348
  Top = 116
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Perpanjang Karyawan/Mitra'
  ClientHeight = 253
  ClientWidth = 396
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
  object Label1: TLabel
    Left = 53
    Top = 32
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Label2: TLabel
    Left = 37
    Top = 8
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'NIK/KPP'
  end
  object Label3: TLabel
    Left = 49
    Top = 56
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alamat'
  end
  object Label4: TLabel
    Left = 23
    Top = 80
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'Berakhir s/d'
  end
  object Label5: TLabel
    Left = 27
    Top = 112
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'Perpanjang'
  end
  object Selesai: TButton
    Left = 304
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object Panel1: TPanel
    Left = 88
    Top = 8
    Width = 297
    Height = 105
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object NIK: TEdit
      Left = 0
      Top = 0
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Nama: TEdit
      Left = 0
      Top = 24
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object Alamat: TEdit
      Left = 0
      Top = 48
      Width = 281
      Height = 21
      TabOrder = 2
    end
    object Expired: TEdit
      Left = 0
      Top = 72
      Width = 89
      Height = 21
      TabOrder = 3
    end
  end
  object GroupExtend: TPanel
    Left = 88
    Top = 112
    Width = 73
    Height = 81
    BevelOuter = bvNone
    TabOrder = 1
    object OneYears: TRadioButton
      Left = 0
      Top = 48
      Width = 65
      Height = 17
      Caption = '1 Tahun'
      TabOrder = 3
      OnClick = OneYearsClick
    end
    object SixMonths: TRadioButton
      Left = 0
      Top = 32
      Width = 65
      Height = 17
      Caption = '6 Bulan'
      TabOrder = 2
      OnClick = SixMonthsClick
    end
    object ThreeMonths: TRadioButton
      Left = 0
      Top = 16
      Width = 65
      Height = 17
      Caption = '3 Bulan'
      TabOrder = 1
      OnClick = ThreeMonthsClick
    end
    object OneMonth: TRadioButton
      Left = 0
      Top = 0
      Width = 65
      Height = 17
      Caption = '1 Bulan'
      TabOrder = 0
      OnClick = OneMonthClick
    end
    object Free: TRadioButton
      Left = 0
      Top = 64
      Width = 65
      Height = 17
      Caption = 's/d'
      TabOrder = 4
      OnClick = FreeClick
    end
  end
  object Tanggal: TDateTimePicker
    Left = 136
    Top = 176
    Width = 89
    Height = 21
    Date = 41390.650827291670000000
    Time = 41390.650827291670000000
    TabOrder = 2
  end
  object Simpan: TButton
    Left = 24
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = SimpanClick
  end
end
