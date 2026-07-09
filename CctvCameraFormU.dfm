object CctvCameraForm: TCctvCameraForm
  Left = 375
  Top = 151
  Width = 421
  Height = 236
  BorderIcons = []
  Caption = 'Master Kamera CCTV'
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
    Width = 405
    Height = 193
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 19
      Width = 70
      Height = 13
      Caption = 'Nama Kamera '
    end
    object Label2: TLabel
      Left = 46
      Top = 46
      Width = 34
      Height = 13
      Caption = 'Lokasi '
    end
    object Label3: TLabel
      Left = 20
      Top = 73
      Width = 54
      Height = 13
      Caption = 'IP Address '
    end
    object Label4: TLabel
      Left = 55
      Top = 100
      Width = 22
      Height = 13
      Caption = 'Port '
    end
    object Label5: TLabel
      Left = 38
      Top = 127
      Width = 35
      Height = 13
      Caption = 'Urutan '
    end
    object edtNamaKamera: TEdit
      Left = 100
      Top = 15
      Width = 260
      Height = 21
      MaxLength = 100
      TabOrder = 0
    end
    object edtLokasi: TEdit
      Left = 100
      Top = 42
      Width = 260
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object edtIPAddress: TEdit
      Left = 100
      Top = 69
      Width = 150
      Height = 21
      MaxLength = 20
      TabOrder = 2
    end
    object edtPort: TEdit
      Left = 100
      Top = 96
      Width = 80
      Height = 21
      MaxLength = 5
      TabOrder = 3
      OnKeyPress = edtPortKeyPress
    end
    object edtUrutan: TEdit
      Left = 100
      Top = 123
      Width = 80
      Height = 21
      MaxLength = 5
      TabOrder = 4
      OnKeyPress = edtUrutanKeyPress
    end
    object cbActive: TCheckBox
      Left = 100
      Top = 150
      Width = 100
      Height = 17
      Caption = 'Aktif'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object btnSimpan: TButton
      Left = 314
      Top = 102
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 6
      OnClick = btnSimpanClick
    end
    object btnBersih: TButton
      Left = 314
      Top = 130
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 7
      OnClick = btnBersihClick
    end
    object btnSelesai: TButton
      Left = 314
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 8
      OnClick = btnSelesaiClick
    end
  end
end
