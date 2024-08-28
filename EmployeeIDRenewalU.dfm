object EmployeeIdRenewal: TEmployeeIdRenewal
  Left = 372
  Top = 203
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Mitra Masuk Kembali'
  ClientHeight = 311
  ClientWidth = 521
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
    Left = 47
    Top = 184
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan Ke'
  end
  object Label5: TLabel
    Left = 22
    Top = 208
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal dimulai'
  end
  object Label11: TLabel
    Left = 41
    Top = 256
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label9: TLabel
    Left = 72
    Top = 232
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jenis'
  end
  object Batal: TButton
    Left = 432
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 0
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 432
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 505
    Height = 177
    Caption = 'Data'
    Enabled = False
    TabOrder = 2
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
      Width = 48
      Height = 13
      Caption = 'Tgl Keluar'
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
      Width = 393
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
      Left = 288
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
    object EksekutifReguler: TEdit
      Left = 184
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 7
    end
  end
  object MutasiKe: TComboBox
    Left = 112
    Top = 184
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = MutasiKeChange
  end
  object MutasiKeDisp: TEdit
    Left = 152
    Top = 184
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object TanggalMulai: TDateTimePicker
    Left = 112
    Top = 208
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 5
  end
  object Keterangan: TMemo
    Left = 112
    Top = 256
    Width = 305
    Height = 49
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 112
    Top = 232
    Width = 177
    Height = 17
    BevelOuter = bvNone
    TabOrder = 7
    object Eksekutif: TRadioButton
      Left = 0
      Top = 0
      Width = 81
      Height = 17
      Caption = 'Eksekutif'
      TabOrder = 0
    end
    object Reguler: TRadioButton
      Left = 96
      Top = 0
      Width = 73
      Height = 17
      Caption = 'Reguler'
      TabOrder = 1
    end
  end
end
