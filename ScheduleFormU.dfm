object ScheduleForm: TScheduleForm
  Left = 352
  Top = 222
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Jadwal'
  ClientHeight = 94
  ClientWidth = 578
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
  object LabelName: TLabel
    Left = 42
    Top = 8
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Mitra'
  end
  object Label2: TLabel
    Left = 29
    Top = 32
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Armada'
  end
  object Label3: TLabel
    Left = 26
    Top = 56
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal'
  end
  object Label4: TLabel
    Left = 169
    Top = 60
    Width = 16
    Height = 13
    Alignment = taRightJustify
    Caption = 's/d'
  end
  object Label5: TLabel
    Left = 32
    Top = 144
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jadwal'
  end
  object Label6: TLabel
    Left = 352
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Label7: TLabel
    Left = 352
    Top = 32
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Driver: TComboBox
    Left = 72
    Top = 8
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = DriverChange
  end
  object Vechile: TComboBox
    Left = 72
    Top = 32
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = VechileChange
  end
  object Batal: TButton
    Left = 496
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 7
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 496
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = SimpanClick
  end
  object GroupMinggu: TGroupBox
    Left = 40
    Top = 192
    Width = 89
    Height = 121
    Caption = 'Harian'
    TabOrder = 8
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
    Left = 128
    Top = 192
    Width = 273
    Height = 177
    Caption = 'Bulanan'
    TabOrder = 9
    object MonthCalendar1: TMonthCalendar
      Left = 8
      Top = 16
      Width = 260
      Height = 154
      Date = 41191.555329270840000000
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 72
    Top = 144
    Width = 177
    Height = 17
    BevelOuter = bvNone
    TabOrder = 10
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
  object TglDari: TDateTimePicker
    Left = 72
    Top = 56
    Width = 89
    Height = 21
    Date = 41191.727418611110000000
    Time = 41191.727418611110000000
    TabOrder = 2
  end
  object CariDriver: TEdit
    Left = 376
    Top = 8
    Width = 113
    Height = 21
    TabStop = False
    TabOrder = 4
    OnChange = CariDriverChange
    OnKeyPress = CariDriverKeyPress
  end
  object CariArmada: TEdit
    Left = 376
    Top = 32
    Width = 113
    Height = 21
    TabStop = False
    TabOrder = 5
    OnChange = CariArmadaChange
    OnKeyPress = CariArmadaKeyPress
  end
  object Panel2: TPanel
    Left = 168
    Top = 8
    Width = 185
    Height = 49
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 11
    object NameDisp: TEdit
      Left = 0
      Top = 0
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object VehicleDisp: TEdit
      Left = 0
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object TglSampai: TDateTimePicker
    Left = 200
    Top = 56
    Width = 89
    Height = 21
    Date = 41191.727765659720000000
    Time = 41191.727765659720000000
    TabOrder = 3
  end
end
