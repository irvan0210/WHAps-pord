object EmployeeCommissionForm: TEmployeeCommissionForm
  Left = 583
  Top = 277
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Komisi Mitra'
  ClientHeight = 274
  ClientWidth = 454
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
  object Label4: TLabel
    Left = 14
    Top = 216
    Width = 82
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jenis Komisi Baru'
  end
  object Label5: TLabel
    Left = 29
    Top = 240
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal Mulai'
  end
  object Label9: TLabel
    Left = 208
    Top = 240
    Width = 16
    Height = 13
    Alignment = taRightJustify
    Caption = 's/d'
  end
  object Batal: TButton
    Left = 352
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 352
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 417
    Height = 201
    Caption = 'Data'
    Enabled = False
    TabOrder = 4
    object Label1: TLabel
      Left = 60
      Top = 48
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label2: TLabel
      Left = 50
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No KPP'
    end
    object Label3: TLabel
      Left = 57
      Top = 144
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi'
    end
    object Label6: TLabel
      Left = 56
      Top = 72
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label7: TLabel
      Left = 32
      Top = 96
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tgl Gabung'
    end
    object Label8: TLabel
      Left = 232
      Top = 144
      Width = 39
      Height = 13
      Caption = 'Tanggal'
    end
    object Label10: TLabel
      Left = 58
      Top = 120
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status'
    end
    object Label11: TLabel
      Left = 31
      Top = 168
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jenis Komisi'
    end
    object Nama: TEdit
      Left = 104
      Top = 48
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object MutasiDari: TEdit
      Left = 104
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object EmployeeId: TEdit
      Left = 104
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Alamat: TEdit
      Left = 104
      Top = 72
      Width = 297
      Height = 21
      TabOrder = 3
    end
    object TglGabung: TEdit
      Left = 104
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object MutasiDariTanggal: TEdit
      Left = 280
      Top = 144
      Width = 81
      Height = 21
      TabOrder = 5
    end
    object Status: TEdit
      Left = 104
      Top = 120
      Width = 81
      Height = 21
      TabOrder = 6
    end
    object Reguler: TEdit
      Left = 184
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object Komisi: TEdit
      Left = 104
      Top = 168
      Width = 201
      Height = 21
      TabOrder = 8
    end
  end
  object KomisiBaru: TComboBox
    Left = 112
    Top = 216
    Width = 209
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object TanggalMulai: TDateTimePicker
    Left = 112
    Top = 240
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 1
  end
  object TanggalSelesai: TDateTimePicker
    Left = 232
    Top = 240
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 5
  end
end
