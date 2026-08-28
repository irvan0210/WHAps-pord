object InventarisForm: TInventarisForm
  Left = 393
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Master Inventaris'
  ClientHeight = 496
  ClientWidth = 636
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
  object LblKodeIntegrasi: TLabel
    Left = 12
    Top = 39
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Kode Integrasi'
  end
  object LblLokasi: TLabel
    Left = 12
    Top = 63
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Kode Kantor'
  end
  object LblInventarisId: TLabel
    Left = 407
    Top = 63
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Inventaris ID'
  end
  object LblDeskripsi: TLabel
    Left = 12
    Top = 87
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Deskripsi Ringkas'
  end
  object LblTglPerolehan: TLabel
    Left = 12
    Top = 111
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tanggal Perolehan'
  end
  object LblKodeLabel: TLabel
    Left = 300
    Top = 111
    Width = 103
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kode Label Inventaris'
  end
  object LblTglValuta: TLabel
    Left = 12
    Top = 135
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tanggal Valuta'
  end
  object LblNilaiPerolehan: TLabel
    Left = 332
    Top = 135
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nilai Perolehan'
  end
  object LblUsiaPemakaian: TLabel
    Left = 12
    Top = 159
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Usia Pemakaian'
  end
  object LblBulan: TLabel
    Left = 255
    Top = 159
    Width = 27
    Height = 13
    Caption = 'Bulan'
  end
  object LblGroupJenis: TLabel
    Left = 12
    Top = 183
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Group Jenis Inventaris'
  end
  object LblGroupSubJenis: TLabel
    Left = 12
    Top = 207
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Group SubJenis Inventaris'
  end
  object LblGroupUser: TLabel
    Left = 12
    Top = 231
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Group User'
  end
  object LblMerk: TLabel
    Left = 12
    Top = 278
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Merk'
  end
  object LblType: TLabel
    Left = 12
    Top = 302
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Type / Model'
  end
  object LblSerialNumber: TLabel
    Left = 12
    Top = 326
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Serial Number'
  end
  object LblMemory: TLabel
    Left = 12
    Top = 350
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Memory'
  end
  object LblStorage: TLabel
    Left = 366
    Top = 350
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Storage'
  end
  object LblSandiBi: TLabel
    Left = 12
    Top = 374
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sandi BI'
  end
  object LblKeterangan: TLabel
    Left = 12
    Top = 398
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Keterangan'
  end
  object LblUserPengguna: TLabel
    Left = 12
    Top = 255
    Width = 130
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'User Pengguna'
  end
  object KodeIntegrasi: TComboBox
    Left = 150
    Top = 36
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object Lokasi: TComboBox
    Left = 150
    Top = 60
    Width = 244
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = LokasiChange
  end
  object InventarisId: TEdit
    Left = 473
    Top = 60
    Width = 145
    Height = 21
    Color = clYellow
    ReadOnly = True
    TabOrder = 2
  end
  object DeskripsiRingkas: TEdit
    Left = 150
    Top = 84
    Width = 470
    Height = 21
    TabOrder = 3
  end
  object TglPerolehan: TDateTimePicker
    Left = 150
    Top = 108
    Width = 140
    Height = 21
    Date = 41927.000000000000000000
    Time = 41927.000000000000000000
    TabOrder = 4
    OnChange = TglPerolehanChange
  end
  object KodeLabelInventaris: TEdit
    Left = 409
    Top = 108
    Width = 210
    Height = 21
    Color = clYellow
    ReadOnly = True
    TabOrder = 5
  end
  object TglValuta: TDateTimePicker
    Left = 150
    Top = 132
    Width = 140
    Height = 21
    Date = 41927.000000000000000000
    Time = 41927.000000000000000000
    TabOrder = 6
  end
  object NilaiPerolehan: TEdit
    Left = 409
    Top = 132
    Width = 210
    Height = 21
    TabOrder = 7
    Text = '0'
    OnExit = NilaiPerolehanExit
  end
  object UsiaPemakaian: TEdit
    Left = 150
    Top = 156
    Width = 100
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object GroupJenis: TComboBox
    Left = 150
    Top = 180
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = GroupJenisChange
  end
  object GroupSubJenis: TComboBox
    Left = 150
    Top = 204
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    OnChange = GroupSubJenisChange
  end
  object GroupUser: TComboBox
    Left = 150
    Top = 228
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    OnChange = GroupUserChange
  end
  object Merk: TComboBox
    Left = 150
    Top = 275
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnChange = MerkChange
  end
  object TypeModel: TComboBox
    Left = 150
    Top = 299
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
  end
  object SerialNumber: TEdit
    Left = 150
    Top = 323
    Width = 470
    Height = 21
    TabOrder = 14
  end
  object Memory: TComboBox
    Left = 150
    Top = 347
    Width = 156
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 15
  end
  object Storage: TComboBox
    Left = 409
    Top = 347
    Width = 210
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
  end
  object SandiBi: TComboBox
    Left = 150
    Top = 371
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 17
  end
  object Keterangan: TMemo
    Left = 150
    Top = 395
    Width = 470
    Height = 50
    ScrollBars = ssVertical
    TabOrder = 18
  end
  object UserPengguna: TComboBox
    Left = 150
    Top = 252
    Width = 470
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 19
  end
  object Simpan: TButton
    Left = 247
    Top = 460
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 20
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 337
    Top = 460
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 21
    OnClick = BatalClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 33
    Align = alTop
    TabOrder = 22
    object LblAktif: TLabel
      Left = 516
      Top = 9
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status Aset'
    end
    object LabelCaption: TLabel
      Left = 20
      Top = 1
      Width = 245
      Height = 31
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Entry Data Master Inventaris'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Aktif: TCheckBox
      Left = 574
      Top = 7
      Width = 44
      Height = 17
      Caption = 'Aktif'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
end
