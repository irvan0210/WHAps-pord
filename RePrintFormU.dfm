object RePrintForm: TRePrintForm
  Left = 447
  Top = 298
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cetak Ulang'
  ClientHeight = 161
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 11
    Top = 96
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alasan Cetak Ulang'
  end
  object Alasan: TComboBox
    Left = 112
    Top = 96
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = AlasanChange
  end
  object GroupHeader: TGroupBox
    Left = 8
    Top = 0
    Width = 305
    Height = 89
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nomor Laporan'
    end
    object Label2: TLabel
      Left = 35
      Top = 16
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama Laporan'
    end
    object LabelNumerator: TLabel
      Left = 56
      Top = 64
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numerator'
    end
    object NomorLaporan: TEdit
      Left = 112
      Top = 40
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object NamaLaporan: TEdit
      Left = 112
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object NomorNumerator: TEdit
      Left = 112
      Top = 64
      Width = 145
      Height = 21
      TabOrder = 2
    end
  end
  object Cetak: TButton
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 2
    OnClick = CetakClick
  end
  object Batal: TButton
    Left = 208
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerCheckTimer
    Left = 272
    Top = 48
  end
end
