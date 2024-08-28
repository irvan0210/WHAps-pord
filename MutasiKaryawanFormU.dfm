object EmployeeMutationForm: TEmployeeMutationForm
  Left = 334
  Top = 205
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Mutasi Karyawan'
  ClientHeight = 340
  ClientWidth = 514
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
    Top = 232
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan Ke'
  end
  object Label5: TLabel
    Left = 22
    Top = 256
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal dimulai'
  end
  object Label9: TLabel
    Left = 66
    Top = 192
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label11: TLabel
    Left = 41
    Top = 280
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Batal: TButton
    Left = 432
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 432
    Top = 272
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
    Height = 185
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
  end
  object MutasiKeTanggal: TDateTimePicker
    Left = 112
    Top = 256
    Width = 89
    Height = 21
    Date = 41253.687977430550000000
    Time = 41253.687977430550000000
    TabOrder = 1
  end
  object PanelStatus: TPanel
    Left = 112
    Top = 192
    Width = 305
    Height = 33
    BevelOuter = bvNone
    TabOrder = 0
    object StatusMutasi: TRadioButton
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Mutasi'
      TabOrder = 0
      OnClick = StatusMutasiClick
      OnKeyPress = StatusMutasiKeyPress
    end
    object StatusNonAktif: TRadioButton
      Left = 72
      Top = 0
      Width = 65
      Height = 17
      Caption = 'NonAktif'
      TabOrder = 1
      OnClick = StatusNonAktifClick
      OnKeyPress = StatusNonAktifKeyPress
    end
    object StatusKeluar: TRadioButton
      Left = 168
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Keluar'
      TabOrder = 2
      OnClick = StatusKeluarClick
      OnKeyPress = StatusKeluarKeyPress
    end
    object StatusAktif: TRadioButton
      Left = 168
      Top = 0
      Width = 65
      Height = 17
      Caption = 'Aktif'
      TabOrder = 3
      OnClick = StatusAktifClick
      OnKeyPress = StatusAktifKeyPress
    end
    object StatusReguler: TRadioButton
      Left = 0
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Reguler'
      TabOrder = 4
      OnClick = StatusKeluarClick
      OnKeyPress = StatusKeluarKeyPress
    end
    object StatusEksekutif: TRadioButton
      Left = 72
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Eksekutif'
      TabOrder = 5
      OnClick = StatusKeluarClick
      OnKeyPress = StatusKeluarKeyPress
    end
  end
  object Keterangan: TMemo
    Left = 112
    Top = 280
    Width = 305
    Height = 49
    TabOrder = 5
  end
  object SBU: TComboBox
    Left = 112
    Top = 232
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
end
