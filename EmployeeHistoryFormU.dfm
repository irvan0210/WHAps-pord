object EmployeeHistoryForm: TEmployeeHistoryForm
  Left = 57
  Top = 132
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Latar Karyawan'
  ClientHeight = 475
  ClientWidth = 554
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
    Left = 17
    Top = 136
    Width = 128
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pencapaian / Kemunduran'
  end
  object Label2: TLabel
    Left = 106
    Top = 160
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal'
  end
  object LabelInstitusi: TLabel
    Left = 110
    Top = 212
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Caption = 'Institusi'
  end
  object LabelKota: TLabel
    Left = 123
    Top = 234
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kota'
  end
  object LabelKet: TLabel
    Left = 90
    Top = 256
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Labelsd: TLabel
    Left = 249
    Top = 160
    Width = 16
    Height = 13
    Alignment = taRightJustify
    Caption = 's/d'
  end
  object LabelDept: TLabel
    Left = 93
    Top = 187
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Departmen'
  end
  object labelAccident: TLabel
    Left = 37
    Top = 326
    Width = 108
    Height = 13
    Alignment = taRightJustify
    Caption = 'Penyebab Kecelakaan'
  end
  object LabelFollowUp: TLabel
    Left = 80
    Top = 396
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tindak Lanjut'
  end
  object Simpan: TButton
    Left = 472
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 472
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 537
    Height = 129
    Caption = 'Data'
    Enabled = False
    TabOrder = 2
    object LabelId: TLabel
      Left = 99
      Top = 8
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No KPP'
    end
    object Label10: TLabel
      Left = 109
      Top = 56
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 105
      Top = 104
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label5: TLabel
      Left = 273
      Top = 8
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label6: TLabel
      Left = 55
      Top = 80
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tempat/Tgl Lahir'
    end
    object Label7: TLabel
      Left = 43
      Top = 32
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Bergabung'
    end
    object IdKaryawan: TEdit
      Left = 144
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object KPPExpired: TEdit
      Left = 296
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object Name: TEdit
      Left = 144
      Top = 56
      Width = 233
      Height = 21
      TabOrder = 2
    end
    object Address: TEdit
      Left = 144
      Top = 104
      Width = 385
      Height = 21
      TabOrder = 3
    end
    object Birth: TEdit
      Left = 144
      Top = 80
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object JoinDate: TEdit
      Left = 144
      Top = 32
      Width = 81
      Height = 21
      TabOrder = 5
    end
  end
  object Detail: TComboBox
    Left = 152
    Top = 136
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = DetailChange
  end
  object DateStart: TDateTimePicker
    Left = 152
    Top = 160
    Width = 89
    Height = 21
    Date = 41683.700159282410000000
    Time = 41683.700159282410000000
    TabOrder = 4
  end
  object DateEnd: TDateTimePicker
    Left = 272
    Top = 160
    Width = 89
    Height = 21
    Date = 41683.700159282410000000
    Time = 41683.700159282410000000
    TabOrder = 5
  end
  object Institution: TEdit
    Left = 152
    Top = 208
    Width = 313
    Height = 21
    TabOrder = 7
  end
  object City: TEdit
    Left = 152
    Top = 232
    Width = 137
    Height = 21
    TabOrder = 8
  end
  object Description: TMemo
    Left = 152
    Top = 256
    Width = 313
    Height = 65
    TabOrder = 9
  end
  object Departemen: TEdit
    Left = 152
    Top = 184
    Width = 137
    Height = 21
    TabOrder = 6
  end
  object Accident: TMemo
    Left = 152
    Top = 326
    Width = 313
    Height = 65
    TabOrder = 10
  end
  object FollowUp: TMemo
    Left = 152
    Top = 396
    Width = 313
    Height = 65
    TabOrder = 11
  end
end
