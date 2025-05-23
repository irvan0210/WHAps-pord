object MasterBatanganForm: TMasterBatanganForm
  Left = 608
  Top = 228
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Master Batangan'
  ClientHeight = 244
  ClientWidth = 527
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 37
    Top = 267
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jadwal'
  end
  object Batal: TButton
    Left = 274
    Top = 211
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 1
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 186
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = SimpanClick
  end
  object GroupMinggu: TGroupBox
    Left = 40
    Top = 288
    Width = 89
    Height = 121
    Caption = 'Harian'
    TabOrder = 2
    object JadwalHarian: TCheckListBox
      Left = 8
      Top = 16
      Width = 73
      Height = 97
      ItemHeight = 13
      Items.Strings = (
        'Senin'
        'Selasa'
        'Rabu'
        'Kamis'
        'Jum'#39'at'
        'Sabtu'
        'Minggu')
      TabOrder = 0
    end
  end
  object GroupBulan: TGroupBox
    Left = 136
    Top = 285
    Width = 273
    Height = 177
    Caption = 'Bulanan'
    TabOrder = 3
    object MonthCalendar1: TMonthCalendar
      Left = 8
      Top = 16
      Width = 260
      Height = 154
      Date = 41191.565994305560000000
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 80
    Top = 269
    Width = 177
    Height = 17
    BevelOuter = bvNone
    TabOrder = 4
    object Harian: TRadioButton
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Harian'
      TabOrder = 0
      OnClick = HarianClick
    end
    object Bulanan: TRadioButton
      Left = 88
      Top = 0
      Width = 65
      Height = 17
      Caption = 'Bulanan'
      TabOrder = 1
      OnClick = BulananClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 15
    Top = 49
    Width = 500
    Height = 73
    Caption = 'Driver'
    TabOrder = 5
    object Label3: TLabel
      Left = 10
      Top = 44
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tanggal'
    end
    object Label4: TLabel
      Left = 165
      Top = 44
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object LabelName: TLabel
      Left = 10
      Top = 19
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama'
    end
    object Label7: TLabel
      Left = 340
      Top = 20
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object driver_tgldari: TDateTimePicker
      Left = 65
      Top = 41
      Width = 95
      Height = 21
      Date = 41191.727418611110000000
      Time = 41191.727418611110000000
      TabOrder = 0
    end
    object driver_tglsampai: TDateTimePicker
      Left = 190
      Top = 40
      Width = 89
      Height = 21
      Date = 41191.727765659720000000
      Time = 41191.727765659720000000
      TabOrder = 1
    end
    object DriverNameDisp: TEdit
      Left = 160
      Top = 17
      Width = 175
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object Driver: TComboBox
      Left = 65
      Top = 16
      Width = 95
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = DriverChange
    end
    object CariDriver: TEdit
      Left = 365
      Top = 16
      Width = 113
      Height = 21
      TabStop = False
      TabOrder = 4
      OnChange = CariDriverChange
      OnKeyPress = CariDriverKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 15
    Top = 128
    Width = 500
    Height = 73
    Caption = 'Helper'
    TabOrder = 6
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama'
    end
    object Label9: TLabel
      Left = 10
      Top = 40
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tanggal'
    end
    object Label10: TLabel
      Left = 165
      Top = 40
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label8: TLabel
      Left = 340
      Top = 15
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object Helper: TComboBox
      Left = 65
      Top = 15
      Width = 95
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = HelperChange
    end
    object helper_tgldari: TDateTimePicker
      Left = 65
      Top = 40
      Width = 95
      Height = 21
      Date = 41191.727418611110000000
      Time = 41191.727418611110000000
      TabOrder = 1
    end
    object helper_tglsampai: TDateTimePicker
      Left = 190
      Top = 40
      Width = 89
      Height = 21
      Date = 41191.727765659720000000
      Time = 41191.727765659720000000
      TabOrder = 2
    end
    object HelperNameDisp: TEdit
      Left = 160
      Top = 15
      Width = 175
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object CariHelper: TEdit
      Left = 365
      Top = 15
      Width = 113
      Height = 21
      TabStop = False
      TabOrder = 4
      OnChange = CariHelperChange
      OnKeyPress = CariHelperKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 15
    Top = 5
    Width = 500
    Height = 41
    Caption = 'Armada'
    TabOrder = 7
    object Label2: TLabel
      Left = 10
      Top = 14
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Armada'
    end
    object Label6: TLabel
      Left = 340
      Top = 16
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object Vechile: TComboBox
      Left = 65
      Top = 13
      Width = 95
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = VechileChange
    end
    object VehicleDisp: TEdit
      Left = 160
      Top = 13
      Width = 175
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object CariArmada: TEdit
      Left = 365
      Top = 12
      Width = 113
      Height = 21
      TabStop = False
      TabOrder = 2
      OnChange = CariArmadaChange
      OnKeyPress = CariArmadaKeyPress
    end
  end
end
