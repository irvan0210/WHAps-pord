object Bank: TBank
  Left = 375
  Top = 151
  Width = 421
  Height = 230
  BorderIcons = []
  Caption = 'Bank'
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
    Width = 413
    Height = 161
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 34
      Top = 19
      Width = 59
      Height = 13
      Caption = 'Nama Bank '
    end
    object Label3: TLabel
      Left = 58
      Top = 42
      Width = 35
      Height = 13
      Caption = 'Alamat '
    end
    object Label4: TLabel
      Left = 44
      Top = 65
      Width = 49
      Height = 13
      Caption = 'Kode Pos '
    end
    object btnSimpanH: TButton
      Left = 332
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnSimpanHClick
    end
    object btnBersih: TButton
      Left = 332
      Top = 132
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 1
      OnClick = btnBersihClick
    end
    object cmbTitleID: TComboBox
      Left = 95
      Top = 15
      Width = 57
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = cmbTitleIDChange
    end
    object edtNamaBank: TEdit
      Left = 155
      Top = 15
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 3
    end
    object edtAlamat: TEdit
      Left = 95
      Top = 38
      Width = 300
      Height = 21
      MaxLength = 50
      TabOrder = 4
      OnKeyPress = edtAlamatKeyPress
    end
    object edtKodePos: TEdit
      Left = 95
      Top = 62
      Width = 80
      Height = 21
      MaxLength = 5
      TabOrder = 5
      OnKeyPress = edtKodePosKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 413
    Height = 35
    Align = alClient
    TabOrder = 1
    object btnSelesai: TButton
      Left = 332
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
  end
end
