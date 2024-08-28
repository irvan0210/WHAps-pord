object SPJTestVehicleForm: TSPJTestVehicleForm
  Left = 191
  Top = 107
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SPJTest Test Armada'
  ClientHeight = 318
  ClientWidth = 437
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label4: TLabel
    Left = 34
    Top = 112
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Petugas'
  end
  object Label15: TLabel
    Left = 15
    Top = 88
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Telp/HP'
  end
  object Label10: TLabel
    Left = 36
    Top = 280
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Catatan'
  end
  object Label6: TLabel
    Left = 60
    Top = 180
    Width = 13
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rit'
  end
  object Label7: TLabel
    Left = 50
    Top = 204
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Drop'
  end
  object Label8: TLabel
    Left = 32
    Top = 228
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Argo'
  end
  object Label9: TLabel
    Left = 34
    Top = 252
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Odo'
  end
  object Selesai: TButton
    Left = 352
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 0
    Width = 265
    Height = 57
    Enabled = False
    TabOrder = 1
    object Label14: TLabel
      Left = 174
      Top = 8
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Label13: TLabel
      Left = 18
      Top = 8
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label1: TLabel
      Left = 21
      Top = 32
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'No SPJ'
    end
    object Tanggal: TEdit
      Left = 64
      Top = 8
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object NoSPJ: TEdit
      Left = 64
      Top = 32
      Width = 97
      Height = 21
      TabStop = False
      TabOrder = 1
    end
    object Jam: TEdit
      Left = 208
      Top = 8
      Width = 49
      Height = 21
      TabStop = False
      TabOrder = 2
    end
  end
  object NoBody: TComboBox
    Left = 80
    Top = 64
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object NoPolisi: TEdit
    Left = 176
    Top = 64
    Width = 97
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 3
  end
  object Petugas: TEdit
    Left = 80
    Top = 112
    Width = 97
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 4
  end
  object TelpHP: TEdit
    Left = 80
    Top = 88
    Width = 193
    Height = 21
    MaxLength = 30
    TabOrder = 5
  end
  object GroupDetail: TGroupBox
    Left = 80
    Top = 160
    Width = 81
    Height = 113
    Caption = 'Detail'
    Enabled = False
    TabOrder = 6
    object Rit: TEdit
      Left = 8
      Top = 16
      Width = 65
      Height = 21
      TabOrder = 0
    end
    object Drop: TEdit
      Left = 8
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 1
    end
    object KMArgo: TEdit
      Left = 8
      Top = 64
      Width = 65
      Height = 21
      TabOrder = 2
    end
    object KMOrdo: TEdit
      Left = 8
      Top = 88
      Width = 65
      Height = 21
      TabOrder = 3
    end
  end
  object Catatan: TMemo
    Left = 80
    Top = 280
    Width = 233
    Height = 33
    TabOrder = 7
  end
end
