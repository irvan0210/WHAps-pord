object EtollForm: TEtollForm
  Left = 326
  Top = 222
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Input No EToll'
  ClientHeight = 130
  ClientWidth = 418
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
  object LabelName: TLabel
    Left = 44
    Top = 11
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Etoll'
  end
  object Label5: TLabel
    Left = 32
    Top = 144
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jadwal'
  end
  object Label1: TLabel
    Left = 23
    Top = 59
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'Plafon Kartu'
  end
  object Label2: TLabel
    Left = 22
    Top = 83
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kode Topup'
  end
  object Label3: TLabel
    Left = 59
    Top = 36
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alias'
  end
  object Batal: TButton
    Left = 304
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 304
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object GroupMinggu: TGroupBox
    Left = 40
    Top = 192
    Width = 89
    Height = 121
    Caption = 'Harian'
    TabOrder = 4
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
    TabOrder = 5
    object MonthCalendar1: TMonthCalendar
      Left = 8
      Top = 16
      Width = 260
      Height = 154
      Date = 41191.493882256950000000
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 72
    Top = 144
    Width = 177
    Height = 17
    BevelOuter = bvNone
    TabOrder = 6
    object Harian: TRadioButton
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Harian'
      TabOrder = 0
    end
    object Bulanan: TRadioButton
      Left = 88
      Top = 0
      Width = 65
      Height = 17
      Caption = 'Bulanan'
      TabOrder = 1
    end
  end
  object pnl1: TPanel
    Left = 91
    Top = 6
    Width = 185
    Height = 118
    BevelOuter = bvNone
    TabOrder = 0
    object NoEtoll: TEdit
      Left = 0
      Top = 2
      Width = 177
      Height = 21
      TabOrder = 0
      OnKeyPress = NoEtollKeyPress
    end
    object cardLimit: TEdit
      Left = 0
      Top = 50
      Width = 177
      Height = 21
      TabOrder = 2
      OnEnter = cardLimitEnter
      OnExit = cardLimitExit
      OnKeyPress = NoEtollKeyPress
    end
    object Topupcode: TEdit
      Left = 0
      Top = 74
      Width = 177
      Height = 21
      TabOrder = 3
      OnKeyPress = NoEtollKeyPress
    end
    object aktif: TCheckBox
      Left = 8
      Top = 98
      Width = 97
      Height = 17
      Caption = 'Aktif'
      TabOrder = 4
    end
    object Alias: TEdit
      Left = 0
      Top = 26
      Width = 177
      Height = 21
      TabOrder = 1
      OnKeyPress = NoEtollKeyPress
    end
  end
  object Bersihkan: TButton
    Left = 304
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 2
    OnClick = BersihkanClick
  end
end
