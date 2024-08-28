object AttendanceTransfer: TAttendanceTransfer
  Left = 475
  Top = 284
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tarik Data Absensi'
  ClientHeight = 114
  ClientWidth = 322
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
    Left = 16
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 16
    Height = 13
    Caption = 's/d'
  end
  object Transfer: TButton
    Left = 56
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Transfer'
    TabOrder = 0
    OnClick = TransferClick
  end
  object Selesai: TButton
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object TanggalMulai: TDateTimePicker
    Left = 64
    Top = 24
    Width = 89
    Height = 21
    Date = 42219.435538194440000000
    Time = 42219.435538194440000000
    TabOrder = 2
  end
  object TanggalSelesai: TDateTimePicker
    Left = 184
    Top = 24
    Width = 89
    Height = 21
    Date = 42219.435618842600000000
    Time = 42219.435618842600000000
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 96
    Width = 321
    Height = 16
    TabOrder = 4
  end
end
