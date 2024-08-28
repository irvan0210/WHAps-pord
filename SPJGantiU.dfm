object SPJGanti: TSPJGanti
  Left = 420
  Top = 271
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SPJ Ganti Body'
  ClientHeight = 156
  ClientWidth = 300
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nomor SPJ'
  end
  object Label2: TLabel
    Left = 50
    Top = 64
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Mitra'
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label4: TLabel
    Left = 4
    Top = 40
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal / Jam'
  end
  object Selesai: TButton
    Left = 208
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Panel1: TPanel
    Left = 80
    Top = 16
    Width = 209
    Height = 97
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object SPJId: TEdit
      Left = 0
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object NoKPP: TEdit
      Left = 0
      Top = 48
      Width = 81
      Height = 21
      TabOrder = 3
    end
    object Mitra: TEdit
      Left = 80
      Top = 48
      Width = 129
      Height = 21
      TabOrder = 4
    end
    object NoPolisi: TEdit
      Left = 80
      Top = 72
      Width = 89
      Height = 21
      TabOrder = 5
    end
    object Tanggal: TEdit
      Left = 0
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object Jam: TEdit
      Left = 80
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 2
    end
  end
  object NoBody: TComboBox
    Left = 80
    Top = 88
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = NoBodyChange
  end
end
