object Form1: TForm1
  Left = 244
  Top = 135
  Width = 416
  Height = 255
  Caption = 'Info Cuti'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 3
    Width = 389
    Height = 174
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama : '
    end
    object Label2: TLabel
      Left = 17
      Top = 39
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Periode : '
    end
    object Label3: TLabel
      Left = 97
      Top = 15
      Width = 287
      Height = 13
      AutoSize = False
      Caption = 'Nama Karyawan '
    end
    object Label4: TLabel
      Left = 182
      Top = 39
      Width = 29
      Height = 13
      AutoSize = False
      Caption = ' s/d '
    end
    object Label5: TLabel
      Left = 97
      Top = 71
      Width = 42
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cuti : '
    end
    object Label6: TLabel
      Left = 97
      Top = 87
      Width = 42
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sakit : '
    end
    object Label7: TLabel
      Left = 97
      Top = 103
      Width = 42
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ijin : '
    end
    object Label8: TLabel
      Left = 148
      Top = 71
      Width = 88
      Height = 13
      AutoSize = False
      Caption = '...  Hari'
    end
    object Label9: TLabel
      Left = 148
      Top = 87
      Width = 88
      Height = 13
      AutoSize = False
      Caption = '...  Hari'
    end
    object Label10: TLabel
      Left = 148
      Top = 103
      Width = 88
      Height = 13
      AutoSize = False
      Caption = '...  Hari'
    end
    object Tanggal: TDateTimePicker
      Left = 94
      Top = 36
      Width = 89
      Height = 21
      Date = 41964.570029108800000000
      Time = 41964.570029108800000000
      TabOrder = 0
    end
    object TglSampai: TDateTimePicker
      Left = 209
      Top = 36
      Width = 89
      Height = 21
      Date = 41964.570029108800000000
      Time = 41964.570029108800000000
      TabOrder = 1
    end
    object Preview: TButton
      Left = 303
      Top = 33
      Width = 63
      Height = 25
      Caption = 'Preview'
      TabOrder = 2
    end
  end
  object Selesai: TButton
    Left = 304
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
