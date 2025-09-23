object EmployeeContractForm: TEmployeeContractForm
  Left = 519
  Top = 270
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Kontrak Karyawan'
  ClientHeight = 308
  ClientWidth = 436
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
  object Label5: TLabel
    Left = 16
    Top = 159
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal dimulai'
  end
  object Label11: TLabel
    Left = 33
    Top = 184
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label4: TLabel
    Left = 213
    Top = 159
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal berakhir'
  end
  object Batal: TButton
    Left = 251
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 1
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 166
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 417
    Height = 148
    Caption = 'Data'
    Enabled = False
    TabOrder = 3
    object Label1: TLabel
      Left = 60
      Top = 48
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label2: TLabel
      Left = 30
      Top = 27
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Employee Id'
    end
    object Label3: TLabel
      Left = 57
      Top = 150
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
      Top = 148
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
    object Nama: TEdit
      Left = 104
      Top = 48
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object MutasiDari: TEdit
      Left = 104
      Top = 148
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
      Top = 148
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
  end
  object StarDate: TDateTimePicker
    Left = 112
    Top = 157
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 0
  end
  object Description: TMemo
    Left = 113
    Top = 183
    Width = 297
    Height = 63
    TabOrder = 4
  end
  object EndDate: TDateTimePicker
    Left = 307
    Top = 157
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 5
  end
  object chk_status_kontrak: TCheckBox
    Left = 29
    Top = 249
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Status Kontrak'
    TabOrder = 6
  end
end
