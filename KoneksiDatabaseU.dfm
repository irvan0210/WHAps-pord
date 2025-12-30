object KoneksiDatabase: TKoneksiDatabase
  Left = 419
  Top = 219
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Koneksi Database'
  ClientHeight = 74
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 24
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Koneksi'
  end
  object Cek: TButton
    Left = 20
    Top = 42
    Width = 65
    Height = 25
    Caption = 'Cek'
    TabOrder = 0
    OnClick = CekClick
  end
  object Simpan: TButton
    Left = 100
    Top = 42
    Width = 65
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Button2: TButton
    Left = 177
    Top = 42
    Width = 65
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = Button2Click
  end
  object cmbName: TComboBox
    Left = 89
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = cmbNameChange
  end
  object Tambah: TButton
    Left = 344
    Top = 7
    Width = 65
    Height = 25
    Caption = 'Tambah'
    TabOrder = 4
    OnClick = TambahClick
  end
  object GroupBox1: TGroupBox
    Left = 273
    Top = 40
    Width = 217
    Height = 169
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 43
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object Label4: TLabel
      Left = 8
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label2: TLabel
      Left = 8
      Top = 91
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object Label3: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label5: TLabel
      Left = 8
      Top = 144
      Width = 40
      Height = 13
      Caption = 'Provider'
    end
    object Label6: TLabel
      Left = 8
      Top = 17
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object Host: TEdit
      Left = 70
      Top = 43
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object Database: TEdit
      Left = 70
      Top = 67
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Username: TEdit
      Left = 70
      Top = 91
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object Password: TMaskEdit
      Left = 70
      Top = 115
      Width = 137
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object Provider: TEdit
      Left = 71
      Top = 139
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object Name: TEdit
      Left = 70
      Top = 17
      Width = 137
      Height = 21
      TabOrder = 5
      OnChange = NameChange
    end
  end
end
