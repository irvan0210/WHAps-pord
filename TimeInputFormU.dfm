object TimeInputForm: TTimeInputForm
  Left = 426
  Top = 236
  Width = 239
  Height = 125
  Caption = 'Input Jam'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 10
    Top = 19
    Width = 130
    Height = 16
    Caption = 'Jam Selesai Tamu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TimeStart: TMaskEdit
    Left = 152
    Top = 13
    Width = 55
    Height = 28
    EditMask = '!90:00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    Text = '  .  '
    OnExit = TimeStartExit
    OnKeyPress = TimeStartKeyPress
  end
  object btnSimpan: TButton
    Left = 24
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = btnSimpanClick
  end
  object btnBatal: TButton
    Left = 120
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = btnBatalClick
  end
end
