object Title: TTitle
  Left = 188
  Top = 202
  Width = 432
  Height = 238
  BorderIcons = []
  Caption = 'Title'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 173
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 42
      Width = 23
      Height = 13
      Caption = 'Title '
    end
    object Label2: TLabel
      Left = 13
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Keterangan '
    end
    object Label4: TLabel
      Left = 41
      Top = 85
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status'
    end
    object btnSimpanH: TButton
      Left = 340
      Top = 116
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnSimpanHClick
    end
    object btnBersih: TButton
      Left = 340
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 1
      OnClick = btnBersihClick
    end
    object edtTitle: TEdit
      Left = 76
      Top = 38
      Width = 100
      Height = 21
      MaxLength = 10
      TabOrder = 2
      OnKeyPress = edtTitleKeyPress
    end
    object edtKeterangan: TEdit
      Left = 76
      Top = 60
      Width = 250
      Height = 21
      MaxLength = 30
      TabOrder = 3
      OnKeyPress = edtKeteranganKeyPress
    end
    object cbkActivasi: TCheckBox
      Left = 76
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 4
      OnClick = cbkActivasiClick
      OnKeyPress = cbkActivasiKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 173
    Width = 424
    Height = 31
    Align = alClient
    TabOrder = 1
    object btnSelesai: TButton
      Left = 339
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
  end
end
