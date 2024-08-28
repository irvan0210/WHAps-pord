object DepositForm: TDepositForm
  Left = 318
  Top = 76
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Setoran Mitra'
  ClientHeight = 634
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label2: TLabel
    Left = 26
    Top = 56
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Mitra'
  end
  object Label4: TLabel
    Left = 36
    Top = 120
    Width = 13
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rit'
  end
  object Label5: TLabel
    Left = 26
    Top = 144
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Drop'
  end
  object Label6: TLabel
    Left = 27
    Top = 168
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'Argo'
  end
  object Label7: TLabel
    Left = 29
    Top = 96
    Width = 20
    Height = 13
    Alignment = taRightJustify
    Caption = 'Odo'
  end
  object Label18: TLabel
    Left = 14
    Top = 192
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Caption = 'Argo Isi'
  end
  object Label3: TLabel
    Left = 32
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Label30: TLabel
    Left = 718
    Top = 35
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jam'
  end
  object Label31: TLabel
    Left = 698
    Top = 11
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal'
  end
  object Label34: TLabel
    Left = 664
    Top = 12
    Width = 33
    Height = 13
    Caption = 'F9   -->'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label35: TLabel
    Left = 664
    Top = 36
    Width = 33
    Height = 13
    Caption = 'F10 -->'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object NoBodi: TComboBox
    Left = 56
    Top = 32
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = NoBodiChange
    OnKeyPress = NoBodiKeyPress
  end
  object Driver: TComboBox
    Left = 56
    Top = 56
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = DriverChange
    OnKeyPress = DriverKeyPress
  end
  object GroupBox2: TGroupBox
    Left = 56
    Top = 80
    Width = 65
    Height = 137
    Caption = 'Awal'
    Enabled = False
    TabOrder = 3
    object KMOrdoAwal: TMaskEdit
      Left = 8
      Top = 16
      Width = 49
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object RitAwal: TEdit
      Left = 8
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object DropAwal: TEdit
      Left = 8
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object KMArgoAwal: TEdit
      Left = 8
      Top = 88
      Width = 49
      Height = 21
      TabOrder = 3
    end
    object KMArgoIsiAwal: TEdit
      Left = 8
      Top = 112
      Width = 49
      Height = 21
      TabOrder = 4
    end
  end
  object GroupAkhir: TGroupBox
    Left = 120
    Top = 80
    Width = 65
    Height = 137
    Caption = 'Akhir'
    TabOrder = 4
    TabStop = True
    object RitAkhir: TEdit
      Left = 8
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 1
      OnEnter = RitAkhirEnter
      OnExit = RitAkhirExit
      OnKeyPress = RitAkhirKeyPress
    end
    object DropAkhir: TEdit
      Left = 8
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 2
      OnEnter = DropAkhirEnter
      OnExit = DropAkhirExit
      OnKeyPress = DropAkhirKeyPress
    end
    object KMArgoAkhir: TEdit
      Left = 8
      Top = 88
      Width = 49
      Height = 21
      TabOrder = 3
      OnEnter = KMArgoAkhirEnter
      OnExit = KMArgoAkhirExit
      OnKeyPress = KMArgoAkhirKeyPress
    end
    object KMOrdoAkhir: TEdit
      Left = 8
      Top = 16
      Width = 49
      Height = 21
      TabOrder = 0
      OnEnter = KMOrdoAkhirEnter
      OnExit = KMOrdoAkhirExit
      OnKeyPress = KMOrdoAkhirKeyPress
    end
    object KMArgoIsiAkhir: TEdit
      Left = 8
      Top = 112
      Width = 49
      Height = 21
      TabOrder = 4
      OnEnter = KMArgoIsiAkhirEnter
      OnExit = KMArgoIsiAkhirExit
      OnKeyPress = KMArgoIsiAkhirKeyPress
    end
  end
  object GroupBox6: TGroupBox
    Left = 184
    Top = 80
    Width = 65
    Height = 137
    Caption = 'Total'
    Enabled = False
    TabOrder = 5
    object LabelRasio: TLabel
      Left = 6
      Top = 164
      Width = 51
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
    end
    object RitTotal: TMaskEdit
      Left = 8
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object DropTotal: TMaskEdit
      Left = 8
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object KMArgoTotal: TMaskEdit
      Left = 8
      Top = 88
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object KMOrdoTotal: TMaskEdit
      Left = 8
      Top = 16
      Width = 49
      Height = 21
      TabOrder = 3
    end
    object KMArgoIsiTotal: TMaskEdit
      Left = 8
      Top = 112
      Width = 49
      Height = 21
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = -8
      Top = 144
      Width = 73
      Height = 14
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object Cari: TEdit
    Left = 56
    Top = 8
    Width = 225
    Height = 21
    TabOrder = 0
    OnChange = CariChange
    OnKeyPress = CariKeyPress
  end
  object GroupKlik: TPanel
    Left = 48
    Top = 384
    Width = 201
    Height = 17
    BevelOuter = bvNone
    TabOrder = 7
    object BBMTunai: TCheckBox
      Left = 120
      Top = 0
      Width = 81
      Height = 17
      Caption = 'BBM Tunai'
      TabOrder = 0
      OnClick = BBMTunaiClick
    end
    object SPJBatalJalan: TCheckBox
      Left = 8
      Top = 0
      Width = 97
      Height = 17
      Caption = 'SPJ Batal Jalan'
      TabOrder = 1
      OnClick = SPJBatalJalanClick
      OnKeyPress = SPJBatalJalanKeyPress
    end
  end
  object PanelWaktu: TPanel
    Left = 744
    Top = 32
    Width = 81
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 14
    object WaktuBaru: TMaskEdit
      Left = 0
      Top = 0
      Width = 53
      Height = 21
      EditMask = '99:99:99;1;_'
      MaxLength = 8
      TabOrder = 0
      Text = '  :  :  '
      OnKeyPress = WaktuBaruKeyPress
    end
  end
  object PanelTanggal: TPanel
    Left = 744
    Top = 8
    Width = 81
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 15
    object TanggalBaru: TMaskEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 21
      EditMask = '99-99-9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  -  -    '
      OnKeyPress = TanggalBaruKeyPress
    end
  end
  object Panel5: TPanel
    Left = 296
    Top = 0
    Width = 241
    Height = 73
    BevelOuter = bvNone
    TabOrder = 16
    object Label8: TLabel
      Left = 10
      Top = 20
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'BBM'
    end
    object Label9: TLabel
      Left = 14
      Top = 44
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gas'
    end
    object GroupBBMGas: TGroupBox
      Left = 40
      Top = 0
      Width = 73
      Height = 65
      Caption = 'Rupiah'
      TabOrder = 0
      TabStop = True
      object BBMRupiah: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        TabOrder = 0
        OnEnter = BBMRupiahEnter
        OnExit = BBMRupiahExit
        OnKeyPress = BBMRupiahKeyPress
      end
      object GasRupiah: TEdit
        Left = 8
        Top = 40
        Width = 57
        Height = 21
        TabOrder = 1
        OnEnter = GasRupiahEnter
        OnExit = GasRupiahExit
        OnKeyPress = GasRupiahKeyPress
      end
    end
    object GroupBox5: TGroupBox
      Left = 112
      Top = 0
      Width = 57
      Height = 65
      Caption = 'Liter'
      Enabled = False
      TabOrder = 1
      object BBMLiter: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object GasLiter: TEdit
        Left = 8
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 168
      Top = 0
      Width = 65
      Height = 65
      Caption = 'Total'
      Enabled = False
      TabOrder = 2
      object BBMGasTotal: TMaskEdit
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        TabStop = False
        TabOrder = 0
      end
    end
  end
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 432
    Width = 569
    Height = 193
    Caption = 'Data SPJ'
    TabOrder = 9
    object Label12: TLabel
      Left = 304
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Total Unit Keluar'
    end
    object Panel3: TPanel
      Left = 408
      Top = 8
      Width = 145
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Label22: TLabel
        Left = 0
        Top = 0
        Width = 21
        Height = 13
        Caption = 'Pagi'
      end
      object Label21: TLabel
        Left = 72
        Top = 0
        Width = 31
        Height = 13
        Caption = 'Malam'
      end
      object UnitJalanPagi: TEdit
        Left = 24
        Top = 0
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object UnitJalanMalam: TEdit
        Left = 104
        Top = 0
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 1
      end
    end
    object GridSPJ: TStringGrid
      Left = 8
      Top = 32
      Width = 545
      Height = 153
      TabStop = False
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnClick = GridSPJClick
      OnKeyPress = GridSPJKeyPress
      OnSelectCell = GridSPJSelectCell
      ColWidths = (
        104
        50
        77
        169
        62
        53)
    end
  end
  object GroupKeterangan: TGroupBox
    Left = 296
    Top = 368
    Width = 281
    Height = 65
    Caption = 'Keterangan'
    TabOrder = 8
    object Keterangan: TMemo
      Left = 8
      Top = 16
      Width = 265
      Height = 41
      TabOrder = 0
      OnKeyPress = KeteranganKeyPress
    end
  end
  object Panel6: TPanel
    Left = 16
    Top = 216
    Width = 233
    Height = 161
    BevelOuter = bvNone
    TabOrder = 17
    object Label36: TLabel
      Left = 17
      Top = 16
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '29'
    end
    object Label37: TLabel
      Left = 16
      Top = 40
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '30'
    end
    object Label38: TLabel
      Left = 16
      Top = 64
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '31'
    end
    object Label39: TLabel
      Left = 16
      Top = 88
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '32'
    end
    object Label40: TLabel
      Left = 16
      Top = 112
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '33'
    end
    object Label41: TLabel
      Left = 16
      Top = 136
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '34'
    end
    object GroupBox1: TGroupBox
      Left = 40
      Top = 0
      Width = 65
      Height = 161
      Caption = 'Awal'
      Enabled = False
      TabOrder = 0
      object v29Awal: TEdit
        Left = 8
        Top = 16
        Width = 49
        Height = 21
        TabOrder = 0
      end
      object v30Awal: TEdit
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 1
      end
      object v31Awal: TEdit
        Left = 8
        Top = 64
        Width = 49
        Height = 21
        TabOrder = 2
      end
      object v32Awal: TEdit
        Left = 8
        Top = 88
        Width = 49
        Height = 21
        TabOrder = 3
      end
      object v33Awal: TEdit
        Left = 8
        Top = 112
        Width = 49
        Height = 21
        TabOrder = 4
      end
      object v34Awal: TEdit
        Left = 8
        Top = 136
        Width = 49
        Height = 21
        TabOrder = 5
      end
    end
    object GroupAkhir2: TGroupBox
      Left = 104
      Top = 0
      Width = 65
      Height = 161
      Caption = 'Akhir'
      TabOrder = 1
      object v29Akhir: TEdit
        Left = 8
        Top = 16
        Width = 49
        Height = 21
        TabOrder = 0
        OnEnter = v29AkhirEnter
        OnExit = v29AkhirExit
        OnKeyPress = v29AkhirKeyPress
      end
      object v30Akhir: TEdit
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 1
        OnEnter = v30AkhirEnter
        OnExit = v30AkhirExit
        OnKeyPress = v30AkhirKeyPress
      end
      object v31Akhir: TEdit
        Left = 8
        Top = 64
        Width = 49
        Height = 21
        TabOrder = 2
        OnEnter = v31AkhirEnter
        OnExit = v31AkhirExit
        OnKeyPress = v31AkhirKeyPress
      end
      object v32Akhir: TEdit
        Left = 8
        Top = 88
        Width = 49
        Height = 21
        TabOrder = 3
        OnEnter = v32AkhirEnter
        OnExit = v32AkhirExit
        OnKeyPress = v32AkhirKeyPress
      end
      object v33Akhir: TEdit
        Left = 8
        Top = 112
        Width = 49
        Height = 21
        TabOrder = 4
        OnEnter = v33AkhirEnter
        OnExit = v33AkhirExit
        OnKeyPress = v33AkhirKeyPress
      end
      object v34Akhir: TEdit
        Left = 8
        Top = 136
        Width = 49
        Height = 21
        TabOrder = 5
        OnEnter = v34AkhirEnter
        OnExit = v34AkhirExit
        OnKeyPress = v34AkhirKeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 168
      Top = 0
      Width = 65
      Height = 161
      Caption = 'Total'
      Enabled = False
      TabOrder = 2
      object v29Total: TEdit
        Left = 8
        Top = 16
        Width = 49
        Height = 21
        TabOrder = 0
      end
      object v30Total: TEdit
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 1
      end
      object v31Total: TEdit
        Left = 8
        Top = 64
        Width = 49
        Height = 21
        TabOrder = 2
      end
      object v32Total: TEdit
        Left = 8
        Top = 88
        Width = 49
        Height = 21
        TabOrder = 3
      end
      object v33Total: TEdit
        Left = 8
        Top = 112
        Width = 49
        Height = 21
        TabOrder = 4
      end
      object v34Total: TEdit
        Left = 8
        Top = 136
        Width = 49
        Height = 21
        TabOrder = 5
      end
    end
  end
  object Panel7: TPanel
    Left = 616
    Top = 72
    Width = 217
    Height = 289
    BevelOuter = bvNone
    TabOrder = 18
    object Label10: TLabel
      Left = 79
      Top = 44
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Argo Kotor'
    end
    object Label11: TLabel
      Left = 75
      Top = 68
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Argo Bersih'
    end
    object Label13: TLabel
      Left = 30
      Top = 140
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Harus setor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 1
      Top = 212
      Width = 128
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor Tunai Bagi Hasil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 67
      Top = 236
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kurang Setor'
    end
    object Label16: TLabel
      Left = 54
      Top = 20
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Rit && Drop'
    end
    object KomisiPersen: TLabel
      Left = 104
      Top = 90
      Width = 25
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
    end
    object Label17: TLabel
      Left = 80
      Top = 260
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tabungan'
    end
    object Label19: TLabel
      Left = 102
      Top = 164
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tunai'
    end
    object Label20: TLabel
      Left = 79
      Top = 188
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Non Tunai'
    end
    object Label25: TLabel
      Left = 45
      Top = 116
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Penghasilan Mitra'
    end
    object LabelKomisi: TLabel
      Left = 50
      Top = 92
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bagi Hasil'
    end
    object GroupRupiah: TGroupBox
      Left = 136
      Top = 0
      Width = 81
      Height = 281
      Caption = 'Rupiah'
      Enabled = False
      TabOrder = 0
      object ArgoKotor: TMaskEdit
        Left = 8
        Top = 40
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object ArgoBersih: TMaskEdit
        Left = 8
        Top = 64
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object Komisi: TMaskEdit
        Left = 8
        Top = 88
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 2
      end
      object TotalSetor: TMaskEdit
        Left = 8
        Top = 136
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 3
      end
      object RitDrop: TMaskEdit
        Left = 8
        Top = 16
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 4
      end
      object LebihSetor: TEdit
        Left = 8
        Top = 256
        Width = 65
        Height = 21
        TabOrder = 5
      end
      object KurangSetor: TEdit
        Left = 8
        Top = 232
        Width = 65
        Height = 21
        TabOrder = 6
      end
      object TotalSetorTunai: TMaskEdit
        Left = 8
        Top = 160
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 7
      end
      object TotalSetorNonTunai: TMaskEdit
        Left = 8
        Top = 184
        Width = 65
        Height = 21
        TabStop = False
        TabOrder = 8
      end
      object PenghasilanMitra: TEdit
        Left = 8
        Top = 112
        Width = 65
        Height = 21
        TabOrder = 9
      end
    end
    object Disetor: TEdit
      Left = 144
      Top = 208
      Width = 65
      Height = 21
      TabOrder = 1
      OnEnter = DisetorEnter
      OnExit = DisetorExit
      OnKeyPress = DisetorKeyPress
    end
  end
  object Panel8: TPanel
    Left = 136
    Top = 32
    Width = 161
    Height = 49
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 19
    object NoPolisi: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object DriverDisp: TEdit
      Left = 0
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBiaya: TGroupBox
    Left = 296
    Top = 64
    Width = 281
    Height = 305
    Caption = 'Biaya'
    TabOrder = 6
    TabStop = True
    object GridBiaya: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 265
      Height = 281
      ColCount = 9
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = GridBiayaSelectCell
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'MS Sans Serif'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'MS Sans Serif'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
    object Biaya: TComboBox
      Left = 32
      Top = 80
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = BiayaChange
      OnExit = BiayaChange
      OnKeyPress = BiayaKeyPress
    end
    object JumlahBiaya: TEdit
      Left = 144
      Top = 80
      Width = 89
      Height = 21
      TabOrder = 2
      OnExit = JumlahBiayaExit
      OnKeyPress = JumlahBiayaKeyPress
    end
  end
  object PanelForm21: TPanel
    Left = 8
    Top = 120
    Width = 273
    Height = 265
    BevelOuter = bvNone
    TabOrder = 20
    object Panel10: TPanel
      Left = 48
      Top = -8
      Width = 65
      Height = 17
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object Panel11: TPanel
      Left = 112
      Top = -8
      Width = 65
      Height = 17
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object Panel12: TPanel
      Left = 176
      Top = -8
      Width = 65
      Height = 17
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object PanelForm22: TPanel
    Left = 616
    Top = 72
    Width = 233
    Height = 135
    BevelOuter = bvNone
    TabOrder = 21
    object GroupBox3: TGroupBox
      Left = 136
      Top = 120
      Width = 81
      Height = 105
      Caption = 'Rupiah'
      TabOrder = 0
    end
  end
  object GroupBox8: TGroupBox
    Left = 581
    Top = 488
    Width = 257
    Height = 137
    TabOrder = 23
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 127
      Height = 119
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object Label23: TLabel
        Left = 38
        Top = 4
        Width = 14
        Height = 13
        Alignment = taRightJustify
        Caption = 'KS'
      end
      object Label26: TLabel
        Left = 17
        Top = 28
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'OnRisk'
      end
      object Label28: TLabel
        Left = 26
        Top = 52
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'LaKa'
      end
      object Label33: TLabel
        Left = 3
        Top = 76
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'P. Khusus'
      end
      object Label43: TLabel
        Left = 3
        Top = 99
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Insentif A*'
      end
      object Hutang: TEdit
        Left = 56
        Top = 0
        Width = 65
        Height = 21
        TabOrder = 0
      end
      object OnRisk: TEdit
        Left = 56
        Top = 24
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object LaKa: TEdit
        Left = 56
        Top = 48
        Width = 65
        Height = 21
        TabOrder = 2
      end
      object PKhusus: TEdit
        Left = 56
        Top = 72
        Width = 65
        Height = 21
        TabOrder = 3
      end
      object InsentifA: TEdit
        Left = 56
        Top = 96
        Width = 65
        Height = 21
        TabOrder = 4
      end
    end
    object Panel4: TPanel
      Left = 125
      Top = 15
      Width = 121
      Height = 119
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Label29: TLabel
        Left = 22
        Top = 4
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tilang'
      end
      object Label24: TLabel
        Left = 2
        Top = 28
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tabungan'
      end
      object Label27: TLabel
        Left = 12
        Top = 52
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jaminan'
      end
      object Label32: TLabel
        Left = 9
        Top = 75
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Seragam'
      end
      object Label42: TLabel
        Left = 18
        Top = 100
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'T Laka'
      end
      object Tabungan: TEdit
        Left = 56
        Top = 24
        Width = 65
        Height = 21
        TabOrder = 0
      end
      object Jaminan: TEdit
        Left = 56
        Top = 48
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object Tilang: TEdit
        Left = 56
        Top = 0
        Width = 65
        Height = 21
        TabOrder = 2
      end
      object Seragam: TEdit
        Left = 56
        Top = 72
        Width = 65
        Height = 21
        TabOrder = 3
      end
      object TLaka: TEdit
        Left = 56
        Top = 96
        Width = 65
        Height = 21
        TabOrder = 4
      end
    end
  end
  object Selesai: TButton
    Left = 760
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 13
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 760
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 10
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 760
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 11
    OnClick = BersihkanClick
  end
  object CetakUlang: TButton
    Left = 760
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 12
    OnClick = CetakUlangClick
  end
  object PanelForm23: TPanel
    Left = 296
    Top = 0
    Width = 273
    Height = 65
    BevelOuter = bvNone
    TabOrder = 24
  end
  object Report: TQuickRep
    Left = 1067
    Top = 35
    Width = 813
    Height = 567
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      110.000000000000000000
      1500.000000000000000000
      90.000000000000000000
      2151.060000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    object QRBand2: TQRBand
      Left = 48
      Top = 257
      Width = 717
      Height = 208
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        550.333333333333400000
        1897.062500000000000000)
      BandType = rbPageFooter
      object QRLabel28: TQRLabel
        Left = 352
        Top = 120
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          931.333333333333500000
          317.500000000000000000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Disetorkan Oleh,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 328
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333500000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel34: TQRLabel
        Left = 480
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ')'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelTunai: TQRLabel
        Left = 296
        Top = 48
        Width = 128
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666800000
          127.000000000000000000
          338.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tunai yang disetorkan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTandaMitra: TQRLabel
        Left = 336
        Top = 176
        Width = 137
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          465.666666666666800000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTandaMitra'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 592
        Top = 120
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          317.500000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Diterima Oleh,'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel37: TQRLabel
        Left = 552
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel38: TQRLabel
        Left = 704
        Top = 176
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          465.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ')'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTandaKasir: TQRLabel
        Left = 560
        Top = 176
        Width = 137
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          465.666666666666800000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTandaKasir'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelKurang: TQRLabel
        Left = 296
        Top = 88
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666800000
          232.833333333333400000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kurang setor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel42: TQRLabel
        Left = 0
        Top = 0
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hutang KS'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel43: TQRLabel
        Left = 152
        Top = 0
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          0.000000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QDisetorkan: TQRLabel
        Left = 505
        Top = 48
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          127.000000000000000000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QDisetorkan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QKurangSetor: TQRLabel
        Left = 505
        Top = 88
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          232.833333333333400000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QKurangSetor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QShapeDisetorkan: TQRShape
        Left = 472
        Top = 64
        Width = 105
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1248.833333333333000000
          169.333333333333300000
          277.812500000000000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QHutangMitra: TQRLabel
        Left = 184
        Top = 0
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          0.000000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QHutangMitra'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 0
        Top = -8
        Width = 721
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          -21.166666666666670000
          1907.645833333333000000)
        Shape = qrsHorLine
      end
      object QRLabel47: TQRLabel
        Left = 8
        Top = 192
        Width = 87
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          21.166666666666670000
          508.000000000000000000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Form : FR/WHET/002'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel48: TQRLabel
        Left = 360
        Top = 192
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          952.500000000000000000
          508.000000000000000000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rev:4.4'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel49: TQRLabel
        Left = 640
        Top = 192
        Width = 67
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          508.000000000000000000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tgl Terbit: 06/07/13'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QLabelTabungan: TQRLabel
        Left = 296
        Top = 72
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666800000
          190.500000000000000000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lebih Setor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLebihSetor: TQRLabel
        Left = 505
        Top = 72
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          190.500000000000000000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLebihSetor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QDisetorkanRp: TQRLabel
        Left = 472
        Top = 48
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          127.000000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QKurangSetorRp: TQRLabel
        Left = 472
        Top = 88
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          232.833333333333400000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLebihSetorRp: TQRLabel
        Left = 472
        Top = 72
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          190.500000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelTabungan: TQRLabel
        Left = 0
        Top = 96
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          254.000000000000000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tabungan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpHutangOR: TQRLabel
        Left = 152
        Top = 16
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          42.333333333333340000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTabunganMitra: TQRLabel
        Left = 184
        Top = 96
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          254.000000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTabunganMitra'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBagi: TQRLabel
        Left = 296
        Top = 24
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666800000
          63.500000000000000000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Bagi hasil yang harus disetor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTotalHarusSetorRp: TQRLabel
        Left = 472
        Top = 24
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          63.500000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QShapeTotalSetor: TQRShape
        Left = 472
        Top = 40
        Width = 105
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1248.833333333333000000
          105.833333333333300000
          277.812500000000000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QPenghasilan: TQRLabel
        Left = 617
        Top = 0
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1632.479166666667000000
          0.000000000000000000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QPenghasilan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelPenghasilan: TQRLabel
        Left = 368
        Top = 0
        Width = 141
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          0.000000000000000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Penghasilan Pengemudi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelPenghasilanRp: TQRLabel
        Left = 584
        Top = 0
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          0.000000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelHutangOR: TQRLabel
        Left = 0
        Top = 16
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          42.333333333333340000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hutang OnRisk'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpTabungan: TQRLabel
        Left = 152
        Top = 96
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          254.000000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QJaminan: TQRLabel
        Left = 184
        Top = 112
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          296.333333333333400000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QJaminan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTotalHarusSetor: TQRLabel
        Left = 505
        Top = 24
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          63.500000000000000000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTotalHarusSetor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelJaminan: TQRLabel
        Left = 0
        Top = 112
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          296.333333333333400000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Jaminan'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpHutangLaka: TQRLabel
        Left = 152
        Top = 80
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          211.666666666666700000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QHutangOnRisk: TQRLabel
        Left = 184
        Top = 16
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          42.333333333333340000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QHutangOnRisk'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelHutangLaka: TQRLabel
        Left = 0
        Top = 80
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          211.666666666666700000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hutang Laka'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpJaminan: TQRLabel
        Left = 152
        Top = 112
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          296.333333333333400000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLaka: TQRLabel
        Left = 184
        Top = 80
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          211.666666666666700000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLaka'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelHutangTilang: TQRLabel
        Left = 0
        Top = 32
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          84.666666666666680000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hutang Tilang'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpHutangTilang: TQRLabel
        Left = 152
        Top = 32
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          84.666666666666680000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTilang: TQRLabel
        Left = 184
        Top = 32
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          84.666666666666680000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTilang'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelSeragam: TQRLabel
        Left = 0
        Top = 48
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          127.000000000000000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hutang Seragam'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRpHutangSeragam: TQRLabel
        Left = 152
        Top = 48
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          127.000000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QSeragam: TQRLabel
        Left = 184
        Top = 48
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          127.000000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QSeragam'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel26: TQRLabel
        Left = 0
        Top = 64
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          169.333333333333300000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pinjaman Khusus'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel32: TQRLabel
        Left = 152
        Top = 64
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          169.333333333333300000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QPinjamanKhusus: TQRLabel
        Left = 184
        Top = 64
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          169.333333333333300000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QPinjamanKhusus'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 48
      Top = 241
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333340000
        1897.062500000000000000)
      BandType = rbDetail
      object QMark: TQRDBText
        Left = 280
        Top = -2
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          -5.291666666666667000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'mark'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QAmount: TQRDBText
        Left = 200
        Top = 0
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          0.000000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'amount'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNama: TQRDBText
        Left = 0
        Top = 0
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'name'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNama2: TQRDBText
        Left = 344
        Top = -2
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          -5.291666666666667000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'name2'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QAmount2: TQRDBText
        Left = 544
        Top = -2
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1439.333333333333000000
          -5.291666666666667000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'amount2'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QMark2: TQRDBText
        Left = 624
        Top = -2
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          -5.291666666666667000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'mark2'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRupiah: TQRDBText
        Left = 512
        Top = -2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          -5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'rupiah'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRupiah1: TQRDBText
        Left = 168
        Top = -2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          -5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'rupiah1'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 48
      Top = 34
      Width = 717
      Height = 207
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        547.687500000000000000
        1897.062500000000000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 0
        Top = -3
        Width = 273
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          -7.937500000000000000
          722.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SLIP SETORAN MITRA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QLabelNoBody: TQRLabel
        Left = 0
        Top = 80
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          211.666666666666700000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Body'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 96
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          254.000000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No KPP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 0
        Top = 64
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          169.333333333333300000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No Slip'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 368
        Top = 64
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          169.333333333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tanggal'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 64
        Top = 64
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          169.333333333333300000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 64
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          211.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 64
        Top = 96
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          254.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 456
        Top = 64
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          169.333333333333300000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 0
        Top = 120
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          317.500000000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rit'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 0
        Top = 136
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          359.833333333333400000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Drop'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = -8
        Top = 112
        Width = 721
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          -21.166666666666670000
          296.333333333333400000
          1907.645833333333000000)
        Shape = qrsHorLine
      end
      object QRLabel18: TQRLabel
        Left = 64
        Top = 120
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          317.500000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 64
        Top = 136
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          359.833333333333400000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBBM: TQRLabel
        Left = 344
        Top = 120
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          317.500000000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BBM'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelGas: TQRLabel
        Left = 344
        Top = 136
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          359.833333333333400000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Gas'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBBMRp: TQRLabel
        Left = 472
        Top = 120
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          317.500000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelGasRp: TQRLabel
        Left = 472
        Top = 136
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          359.833333333333400000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBBM1: TQRLabel
        Left = 584
        Top = 120
        Width = 9
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          317.500000000000000000
          23.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '='
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBBM3: TQRLabel
        Left = 632
        Top = 120
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          317.500000000000000000
          42.333333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ltr'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelGas3: TQRLabel
        Left = 632
        Top = 136
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          359.833333333333400000
          42.333333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ltr'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelArgo: TQRLabel
        Left = 0
        Top = 168
        Width = 127
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          444.500000000000000000
          336.020833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Argo Kotor + Voucher'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelArgoRp: TQRLabel
        Left = 144
        Top = 168
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          444.500000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelArgoBersih: TQRLabel
        Left = 344
        Top = 152
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          402.166666666666600000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Argo Bersih'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 472
        Top = 152
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          402.166666666666600000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 0
        Top = 152
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          402.166666666666600000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Voucher'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 144
        Top = 153
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          404.812500000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 472
        Top = 168
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          444.500000000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoSlip: TQRLabel
        Left = 72
        Top = 64
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          169.333333333333300000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoSlip'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoBody: TQRLabel
        Left = 72
        Top = 80
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          211.666666666666700000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoBody'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoKPP: TQRLabel
        Left = 72
        Top = 96
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          254.000000000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoKPP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QMitra: TQRLabel
        Left = 152
        Top = 96
        Width = 161
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          254.000000000000000000
          425.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QMitra'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QNoPolisi: TQRLabel
        Left = 152
        Top = 80
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          211.666666666666700000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QNoPolisi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggal: TQRLabel
        Left = 464
        Top = 64
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          169.333333333333300000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggal'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRit: TQRLabel
        Left = 72
        Top = 120
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          317.500000000000000000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRit'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QDrop: TQRLabel
        Left = 72
        Top = 136
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          359.833333333333400000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QDrop'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QDummy: TQRLabel
        Left = 176
        Top = 152
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          402.166666666666600000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QDummy'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QArgoKotor: TQRLabel
        Left = 176
        Top = 168
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          444.500000000000000000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QArgoKotor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QGasRupiah: TQRLabel
        Left = 504
        Top = 136
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          359.833333333333400000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QGasRupiah'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QArgoBersih: TQRLabel
        Left = 504
        Top = 152
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          402.166666666666600000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QArgoBersih'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QBBMLiter: TQRLabel
        Left = 592
        Top = 120
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          317.500000000000000000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QBBMLiter'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QGasLiter: TQRLabel
        Left = 592
        Top = 136
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          359.833333333333400000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QGasLiter'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QKomisiPersen: TQRLabel
        Left = 440
        Top = 168
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          444.500000000000000000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QKomisiPersen'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel46: TQRLabel
        Left = 0
        Top = 24
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          63.500000000000000000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pool'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QLocation: TQRLabel
        Left = 24
        Top = 24
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          63.500000000000000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLocation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QAlamat: TQRLabel
        Left = 0
        Top = 40
        Width = 449
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          105.833333333333300000
          1187.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLocation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel56: TQRLabel
        Left = 368
        Top = 80
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          211.666666666666700000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tanggal SPJ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel57: TQRLabel
        Left = 456
        Top = 80
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          211.666666666666700000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QTanggalSPJ: TQRLabel
        Left = 464
        Top = 80
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          211.666666666666700000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTanggalSPJ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 200
        Width = 713
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          529.166666666666800000
          1886.479166666667000000)
        Shape = qrsHorLine
      end
      object QRatio: TQRLabel
        Left = 656
        Top = 120
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          317.500000000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRatio'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelReguler: TQRLabel
        Left = 280
        Top = -3
        Width = 120
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          740.833333333333400000
          -7.937500000000000000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REGULER'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QLabelPengeluaranBBM: TQRLabel
        Left = 369
        Top = 184
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          976.312500000000000000
          486.833333333333400000
          359.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QLabelPengeluaranBBM'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelPengeluaranBBMRp: TQRLabel
        Left = 584
        Top = 184
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          486.833333333333400000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QPengeluaranBBM: TQRLabel
        Left = 616
        Top = 184
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          486.833333333333400000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QPengeluaranBBM'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelBagiHasil: TQRLabel
        Left = 344
        Top = 168
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          444.500000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Bagi Hasil'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QInsentifBBM: TQRLabel
        Left = 504
        Top = 168
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          444.500000000000000000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QInsentifBBM'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QKomisi: TQRLabel
        Left = 504
        Top = 168
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          444.500000000000000000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QKomisi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QBBMRupiah: TQRLabel
        Left = 504
        Top = 120
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          317.500000000000000000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QBBMRupiah'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QLabelGas1: TQRLabel
        Left = 584
        Top = 136
        Width = 9
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          359.833333333333400000
          23.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '='
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QImageReguler: TQRImage
        Left = 504
        Top = -22
        Width = 225
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1333.500000000000000000
          -58.208333333333340000
          595.312500000000000000)
        Picture.Data = {
          0A544A504547496D616765DA1C0000FFD8FFE100B045786966000049492A0008
          0000000500120103000100000001000000310102001C0000004A000000320102
          00140000006600000013020300010000000100000069870400010000007A0000
          00000000004143442053797374656D73204469676974616C20496D6167696E67
          00323031333A30333A30312031313A32343A3439000300909202000400000039
          38380002A0040001000000E100000003A00400010000005200000000000000FF
          00FFFFFFC0001108005200E103012100021101031101FFDB0084000201010101
          010201010102020202030503030202030604040305070607070706070608090B
          0908080A0806070A0D0A0A0B0C0C0D0C07090E0F0E0C0F0B0C0C0C0103030304
          030408040408120C0A0C12121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212FFC400AD
          0001000203000301010000000000000000000609050708010204030A10000103
          030302040305050507050000000102030405060700081109120A132131142241
          151632516171818291A123244252621933437292B1C1445393D1D30101000105
          0101000000000000000000000005010203040607081100020103010407050509
          0000000000000001020304110506122131071322415161A114718191B132A2C1
          D1F01523253342435282C2FFDA000C03010002110311003F00BFCD34034D00D3
          4034D00D34034D00D34034D00D3F6E808FE40CAF8C313D27EDDC9F912876EC23
          CF12AB939A88DAB8FC8B8473FBB5A5AABD58FA7551A52A1CBDD8DAEB5A4F04C4
          53D213FF00521B23FAEB56BDF5B5B3DDAB3499D1E8FB21AE6BF07574EB594E3E
          29617CDE17A997B3FA966C22FA929876F6ECAC82EACF096E6D493109FF00E509
          D6E0B66F2B4AF4A70ABD9F73D3EAD115ED269925121B3FC48246AEA17742E7F9
          534CC1AB6CD6AFA13FE236D3A7E6D3C7CF97A9910A49F4075E75B0418D34035F
          9A65465485444BE92E21214A6C1F500F3C1E3F5E0FF23A1549B3F4D342834D00
          D34034D00D34034D00D34034D00D34035A57776BDEE57A829B1F67302D1A44D9
          ADFF0079BD2ED9AAE29E0923B588A8697DEE7D7BDCF953FE551F6C171D6F56D5
          0FB5DD9FA92DA1FECE57F4E5AB397529E64A2B3278FE95C5633C9BCF0597CCAF
          7BD3A096F7B2CDC8F5ED97B75369D6EB324F73B51AA393E73A4FE8B5A0703F44
          F007D06B152FC3A3BA64209819EAC178FD03ADCD6BFA86D5AE5A5B3B7336E52A
          89B7EF3E8AA1D37E816D08D0A36952308AC24B716178259E043EECE80FBF7A22
          1468C6C7AF247F8215656D295FB9E6523FAEB5A55BA6EF52EDBDD44D728B806F
          5A7BEC7CC2A163CB121438FA8311C2BFE9AD3ABA35EDBF6E2B38F07FA6753A77
          4A9B27ADC7D9EAD5DCDEE71A91C27EF7DA8FCD997B3FAA8752EDB5D4136FDD79
          5AB6EF92A01549C914BF39678FA77BC943DFC97AE86C65E239C930508672FEDA
          28F531C00A976C54DC88A3FAF94EA5C1FBBBC6B35B6BB736CF72B2DEF7F07FAF
          7913AFF43FA0EBB1F6AD2A7D4CA5C56EF6A9BF86787FABC791BBED0F10CECDAB
          1193F7BAC2BFE86F9FC49301896D8FE26DDE4FFD3ACFD47AFA74FF00810CCB4D
          5EF17C81CF94DD01C41FE6B5253FD75331DA1B471CCB2BE0796D7E8476929D5D
          CA52A725E3BD8F46B3F535C5E1D6D32E66EBAE9186B641B56A8B970DD4EF914A
          AA5F4B0D82920F73E22B44F2D2072B538A7020049E79F63DD18071757314E3A8
          B46BD6F69573DCB2BFBD56AE5983B575296A03BD6940E036D8E021B6D2004368
          4247B12762C2EE77F525571882E0BCDF8BF87D485DB0D99B5D8CB2A360EAAA97
          357B536B9462B828C7C53965B7DEE0B0977CDB4D4A9E7034D00D34034D00D340
          34D00D34034D00D09007274073BEE73A93E0DDBE5CCAC4F6B532B391722ABD1B
          B06C48E66CD6D47DBCF52414B03FE6F9B8F5ED3AD155AABF5CFDD472EDA56DD9
          B82281241F2D1519299353EC27FC6AEC75415FB10D9D435CDD5C5C4DD0B15CB9
          C9F25E4BCCF52D0767743D0ED61ABED6C9F6D669D08FDB92EE94B96EC5F765AC
          F3CE38388563A2E6F7729A8CCCD9D4B6B539E5FE26DB4CF90D8FD005484278FD
          891A8F547C3BD949B497E8DBDF5ADF1EA0CAA4494FAFFCC9944EB425A057ABDA
          A95B2FE3F99D9DBF4CDA3E9EBA8B2D29469AF0715E8A1F8B314BE8D9D4FF0015
          F33B0DEF4E3B8A6FD50D46B8AA94E59FE12168FE675E89A7F88936F49F359975
          9BB61B7F4F369D5C0B03F4570FFF00E758BD8755B1E3467BCBDF9F47F8122B6B
          3A3ADAEFDDEA96CA8CDF7B8EEFDFA7FF004B07C5737573DF859D03EEBEEFB60D
          44ADC347A3ADD7EDD9D002FF003E7CC4BAD7F21AD735AEA0FD2FAFC7552325F4
          A6A34298BFF78E5B55A6E2727F636964EB0D5D52353B17F4137F27EBF992BA7F
          4795AD17B4EC76B128537C7195523F7787CE3922D54DCF74995BBCDA5D36AE09
          B215F8234CBEA434D93F41C36B5A8FEE1A9DE13C17BAEDCE4F69ADA3F4FBB0F0
          F509F573F7EEBB4D764C86104F1DCDCCA8071C511F9C767BBFD43DC61A6E9DD4
          FABB1A187E2DE71F8224EFE95F6CF5ABBCDAED59CA9AFEDD38AA6E6FFC72B139
          67BD2C2F178C9647B1AE9EF8DB669499971BD5B9776E40AF200AD5F75A2572A5
          7AF3E537DC496D907D7B7924900A89E071D07AEC6D6DE36B49528F77ABEF67CB
          9B45AE56DA2D4AA6A159637B828AE518AE118AF24B879F31A6B60841A68069A0
          1A68069A01A68069A01A6806A2993F1DD63275385B0BBFAA943A4BC38982DF70
          C699293FFB6250F9D949FA96BB5C3F45A7EB64E2E7171CE0D9B4AF1B5AD1AD28
          A9638E1F2CF76577ACF35DFC99E98830261AC076F7DD7C398DE916EC351EE713
          4C6021C90AE792B75CFC6EAC93C952D4A51FA9D4B4003F08E34A74E34A2A1058
          48ADE5EDC6A15E573753729C9E5B7CDFEBD0F3A6AF3546BC14A4FE2483A005B4
          9F43CFAFD39D47AB788B165CAE17AE2C71409EB3EEA9B4E65D27F7A92756CA11
          9AC4964CF42EABDACB7E84DC5F936BE879B7F1262DB4A40976B639A0D35D4FA8
          729F4E65950FDE940D4802523DBDFF0032748C230588AC0B8B9AD752EB2BCDC9
          F8B6DBF53CE9AB8C034D0100CF7BA9DB5ED629102E0DC9E77B4AC381557951A1
          CEBBAA8D53D992EA53DC5B42DD2949576FAF683CF009FA6A4949C938F6E0B019
          CAB6F5ED4AA8DB32617DA4CD7E9F290FC37E37677F9C87904A54DF60EEEE048E
          3D7406A8C67D4D7A77E67BEA9B8C310EF7F155D171D61CF260D06DFB9E24B993
          17DA5452DB2DACA94425249E07A004FD3526CFBBCEDA56D564D321EE5B727645
          82E5690E2E9E8BC2B2C53BE343652165BF3549EFED2B4F3C7B770E7DC680C45F
          7D42F62D8B6CEB6721E4ADDDE39B7E8379C754BA0D6AB55F8F162D6594F1DCE4
          7756A097523B927941238524FB1075B1318E53C6F9A6C4A7650C497CD2AE4B72
          AED97A0D72892532624C40514F7B6EA794AD3CA48E4123D3406B5A4751BD845C
          1961181A85BC7C6B32F772A0AA526CF8D70C65D4CCB4A8A551FE142BCCF312A4
          9053DBC8E0F3EDAFBF3AEFC7657B60BA63D91B8DDD663EB12AF2E3098C536EEA
          F47A7BCFB254A48710875492A477254391E9C823407EF9577C3B3AC17695B77E
          669DD0D856951AF064C9A1D4EE4AE4784CD5DB0942CAD8538A01C484BAD9E53C
          FA2D27EA35033D60BA54F3DA7A8D612E7F2FBE703FFD34067B197531E9E59A6F
          DA6E2DC43BDDC57745CB5870B5068140B9E24B993141256436CB6B2A57094A94
          781E81249F41AC5DCBD59BA62D995E9D6B5DFD4030F52AA94C7D7166536A3764
          262445790A295B6E36A58525695020A48E41041D019AC25D47F60DB92BFDAC57
          8037918D6F3B91F65C90DD0ED9B8634C94E36D8EE5AC3685124247A923D86B6A
          DF37ED8F8C6D49B7DE48BCA956FD129C8F325D62B72DB89162A3903B9C75C210
          81C9039240E48D011DC49B9ADB867D95360E0ADC05937ABD4D4A5731AB4ABB16
          A4A8A9592125C0CAD5D8145240EEE39E0F1EDAFC72BEEAB6C181EB31ADDCE3B8
          EB0ECCA84C67E21883765C1129CF3ED7714F7A10F2D2549EE0472071C823404B
          6D3BBED4BF2DA8579D8F7353EB347A9329910EAB4A908911A5B4AF54B8DBA825
          2B491EA149241D6B3CE1BFBD906DA6AE6DDDC0EEEB1B597521C734CB96E3890E
          50E7D41F256B0B03F874066705EEE36B3B9E8AF4CDB9EE36C7BED1191DEFFDD1
          AE46A82984F3C72B4B4B5148E7FCC06BEECBBB93DBAEDFD50939E33DD95649A9
          859862EEAE46A6FC5F671DFE5F9CB4F7F6F7279EDE78EE1CFB8D01AFDAEA89D3
          59FAC35408FD40F0A3931E576371DBBDA9AA52D5F40387BDF5BC204F855484D5
          469B2DA911E42038D3ECAC2D0E254390A0A1E841041047BE8081679DDA6D7B6B
          94F62ABB90DC3D9561B12C131D77756A3D3FE2383C1F2C3AA495F1FE90751FC1
          DD42F627B98BB9BC7FB7CDE0E35BD2BCF34B7D144B66E28B325ADB40E56B0CA1
          657DA9047278F4D01E6A9D43B60744A848A4D6B7C587E1CB88E2997E2CBBCE9C
          DB8C2D24A5485A54F029502082080411ACB62DDE8ECF338DD82C3C2DBAEC6D77
          D70B4B7C51ED7B9A14F945B471DCB0D34E295DA9E47278E073EBA036669A01A6
          80E3CEBD9B5383BBFE9479871D0A5224D5A8D4572E6A39EDE5C6E653FF00BD24
          37F929686DD6BF63AA1F5D733F85DF77F6DAFA1BBD71E44AFF00974EC2150ADC
          3A849797F3310D91F69824FF00952D4A291FA238D01539D1DAA17D6C87AC66DB
          B7299A6D58149B7B718CCD974B4B68ED4458F5593369EC0078010A121B655E9F
          F09D47D15AB51F108618A06FDF7FBB2FE9CEFC4F886EBF5FA9DCD7106FD171A9
          119B67CE1DC3D53E636CC9483EDDC94FE9A020BE346B4ADEA1F4EDC45F6351A3
          436A977DB7062478CDA5B44664D2E5F0DA120709480CA0003D3848FCB561FD3E
          336EDEED2D82E14B4CE61B3E19A7D81428A62AAB115B2D14539849494F7FA104
          1E41D01515B5F8565D7BC68778D76D3994E9F010AA954634CA7BA8799538E5BA
          8EF5A5682524F73CBE483EE4F3EBCEB21E365B5E9F37206D7A7AE3A7BE62ABB0
          9D571EAB479B4C201FD3E757F33A02DE372FD2DB63FBCCBF2819037518461DF2
          FDAB4A349A3D32BB21E553E9AD29616E2DB8C85251E62FB5B0A5A828F6B48038
          E0F345FB9BE9F7B40B33C5378D36816B6DF2DB878C6B29A5BD2AC96985180F85
          53DF71C0A6C93C852DA0A3EBEE3405F2EDD3A706C3B6915F7EFADB5ED26C1B2E
          B922396175AA0D21A66679647CCD87F82B093E9CA4100F039E754858A3106DCE
          F3F176660B4370F6459F58B57CEAACF76997A468EFD3DD7D74E61614A6DF05B2
          AEF754A1C8E79F5F7F5D016FD8EB68BD2071C6E6AD0CB98371FE1CB3B25D3D52
          63D21562C9854C95500F4771B7995458EA48903CB5295C290A29ECEE1C7075B3
          FA81D029B756C3F345B75686D488B3EC4AE30E32F24292B4AA9EF8E083A02AA7
          C15CF59B6FECAF2DD7EA33E9D0E74DBDDA616E3CEB6DB8EB6D53985201E48240
          53CE11FAA95FAEA0FE36E559F5EC7BB7CB92932E9D2A6C5A8D72317E3B8DB8E2
          5B5B3097DA48E4F1DC8E783F5D01D3DE20AEA3B7E74C3E97162581B6AAB1B7EF
          3C82C46B72935683C36E516031090A92FB1E9C25D08F25A411F83CEEE1C14275
          F47476F0FCEC7AC0DA0DA399777181E839572A642A6317157EB59063FDAA98AE
          4B407C4669A7BB9092DA5C095B8415AD7DEA2AE3B529038B7C479D2D6CDE9575
          AB07AA3F4C954BC51323D7DBA4D569969BEB663C294B6D6EC694C37C90DB6BF2
          1C69D67D5A57737F20EE58565BC45DB918BBEEF0FBED8B7AB51A3458D59B9EE7
          86E4C44747C91E49A7541A98DB64FA86FE2229E07E494F3EDA0249D4EB617D2F
          F12F8712CBCE752C07605A59365D8D6C48A1DD14982D41ABD66ACF330D4F052D
          002A51710B7D6E05F7709EE5FA14823B9BC34D8E37078BFA3EE34B7F70CC54E2
          CD90A9B36934DACF70930A94F4852E2A1415EA949412E2127D9B750381EC00A8
          CDB5E41DABD6FC42199E2F5F8A1479B5291519D4CB79591829CA0525D12C188D
          BA857F6698A61F0185AC16405051F55058BBEC5BD25B6058C373767EF8F69B89
          ED9B0EB14AA64D86E7DC28AD47A657A1CB60241534DFF65DC8504AD0EB60120A
          81EE0414814F5B71DB06DBF3778B1B3AE2BCFF008A2D6B9AD5F89AED55743B9A
          234FC27242DA8EE05A9B58ED2AEF7D6AE7F324EAE1B15F4D2E95DB79DCCDAD9E
          F0261EB1B1FDFD0112A0C11684A6E9E2A4DBEC290EB2B8885F63DF2FCE384772
          4A39078E4103ABBE9EFA68069A03E5AD52A057295228D558887E2CB6D4C3CC38
          394B885029524FE8413AFE4FF6A99672260EC55B9AE8678E274A6EF7CC19568F
          62521294A8F911D3365C5A93AA3F44F971A2B6AE7DD0F28FD34058AF8AC363B4
          BC41D3BB06E7AC010174E736E152854287262A42570E9AE34D32CB85407A9449
          87138FD5E51FAEB62747FCE54AEAB3D5DF29752AA7A048B72C0C6D6ED914352C
          1086264E6533AA09403ECA69F4C9689FC963F3D011AF1AF2D1FECEEC64C93F32
          B23B2A03F652E7FF00F635BF7663D08FA45646D9DE2AC87786C62CCA855EB966
          D22A336A0F7C4F7C97DE82CB8E38AE1DE39529449E3F3D015F3B0FC2587B6D1E
          303BA306607B1A0DB369D0E1CF8F4EA1D3BBFC98C156FB4EAC27B94A57AAD4B5
          1E4FBA8EA65E35B96C357A6D510B50E5336BAE11FA7994AD017D6DA82D21693C
          83EBAA12DE1C9611E32CC3FCABF0C7A520FE84D2E5F03FA8D017D7FF00A4FE0F
          FC6BF9C76B689B6DDF3F8B4332E07DD1D808B9ED394674A7294B9AFC40B798A6
          45520F98C2D0BF94F3E9DDC1FAF3A02ECF699D2C7A736C1EAD26F6DADED6AD3B
          42AAB614CBB7124392A7A193F8D026485B8EA10AE077242824F0390781A9BEF8
          5D431B30CB6FACF09459759513FB203FA028A3C2CFD26FA79F501DA1E41C8DBB
          EDB8C2BCEBB45BC3ECD873A4D4E7455311BE0233A1BED8EF36923BD6B3C904FA
          FBFB6A25E2B1E979B0CE9ED8D30E56B677B7E87654CB9EA95462A4EC5A94D946
          536CB1194D82243CE01DAA7147E5E3DFD7406F0F192E2CBAAE2D9E6DB735D2E0
          3CED16DD972E9335F6C12969D9B0A2B8C157E40FC0BA393F5E07D756D7D30771
          960EEA360189336E3FACB12E255AD782DBE96560FC2CB658433263ABF25B6F34
          E208FF004FE44680E12F18B662B22CCE9814AC5555A9B26B97ADDF0534EA7F77
          F6AE37112E3EFBC91FE5472D209FA17903EBAE3BEB31802F0DA9F85BB6A582B2
          353DD835F837442993A9D2414BB0DE970EAD354CAC7D16DFC4F6287D0A4E80D5
          FBB5E9E37CF4B2B376B1D65B085A2329E3816EDBF50B8ECCC803ED78B459B221
          32A501E6A541A8AF9708697DA4B0FA51C1F5686BFA1EDA3EF6B016F3B6AD43DD
          DE18BABE2AD5AC4054C74B839914E5B6925F8EFB69E4A5E6949525491CF24029
          E4292481A737DFD2A7A75F597C4945BF326DBD1E74A9F4B6E55BB94ACE7D2C54
          9115E4798D29B7FB4A5F6085F706DD4AD1F3120249E75541D26EFADDFF00479E
          BB2AE8B553CD526FFC615F94B61B80E15166225EA72AA11A7B0C92AF86742025
          2F3693D8A0567E6ED42C0118A06CA36DFD41FC54F9E700EE86D69759B5DC72A7
          3BE0A1545E82B2FB11E1F61F35A5255C0EE57A73C1FDDABAAD96F47AE9B5D3DA
          E17AFADAD6D9A8D41B85C654CAEE69F26454AA286D5F8D2891256E29A4A87E20
          D94823DF9D01D3BFB34D00D340785A7B9053CF1CFD755DD887C3D188316757BA
          DF562919C26D566D4AAD51AE45B15EA336DC78332632B6D4EFC4F9A4AFB4BAEA
          C7F663E6524FF87D40EB5DF76D1AD5DF66D0AFDDA3DE15D5D2A05EF4A553FED4
          6E3890A82E0525C69F0D1290B2DB8DA1613DC39EDF71AD53D1E3A51D8BD22B6D
          B56C0368E4D937949AE579EAECDB8A653D305C754B659650D79695AC04A10C0E
          3E6F75A8FA73A0301D64FA3EC3EAFF0061D9D8C2EADC5D46C6A1DA7507AAAA8D
          4BA3B535C9D256D79485296B713DA1085380000F25C249F41AE8DDA6E0DABEDA
          B6CB636DDAB7905774B9645122D05BAFBB0D30DC98CC66C34D296D254A017E52
          101441F5209F4E78D01C5B8E3A064EC7BD59E5756A46F36A932E99F599750936
          CBB6D30984E46911D7155102C3FDE0263A8212BF53DC84A883EA0E4FAC7741FA
          4F581C8B64DE37C6EA2AD6653EC48322353E9349A1B32897643885BCF29D5BA9
          3C90CB20240E0797EE79D01DDD63D1AE0B7ACBA5506EAB91357A9C386D312AAC
          88C23098EA5012B743414A08EE20ABB42881CF1C9D57F66AE8172F30F55AA7F5
          5B56F32A94DB968F57A7D4205B0D5B6C390988F11A43298AA597C2D495B69585
          AFD0F2EA88EDF4000B15F2C795E573E9C71FBB556775786EB22CADF85DDD4471
          8753CBCAC8C8975D466CE33ADFB5A214C16E48282C2038EAB9425AED402A0490
          907DFD7404D29BD0E373F78E5FB32FDDD1F592CC7932DCB4ABD06BCE5873E133
          0299565C49087DB6A436D3BD8B415369E4141F4E78E0FAEBB5F75F862E5DC46D
          9AFCC05695F8CDB13AF5A14CA126E17E099A29E894D29971D0C77B7DEB08715D
          A0AC0EEE09E40E081CBFD143A39D73A3BD8F7B632637389C8544BBA7B1546DA7
          6DEFB2DD8121B6CB4B3DC243A1C4AD01BF420105BE793C9D60BADAF43FAE7593
          A963F8D53DD78C7D45B05B9AA669D1EDAFB49C9922516838E2DD325AE1294474
          252909F72B249E400074DDE5B31C759F7664D6CD77750A9F7FD1E5D0E3522B12
          3E1550913DC65084A64B680B5298702DB4B8929592858041F4D576627F0E16F5
          F62375D615D2FBAC6DD78E6D3AD48321DB4EE7B719AB34857B05A8158616E768
          03CC0C214424027D3406E3DBE787FE872372746DE7752CDDCDD7B98C936E762A
          8DF79E1B74FA151D48577A54D5390A5A494AFE6482437DDF3141500A13CEB55D
          212B3D60F1459F859DDC9A31ED12D7ABAEB6F79740FB51E9D23C9532DFCC6434
          1094A1D779F4512563DB8F50375E07D98D0ACBD86DB7B10DC1D629D9268947B5
          9AB427C9954D30D9ACC1699F87405B1E639DAA2CA50090BFC49EE1DA780391BA
          73F40EC9FD30F2B5D8E6DEFA825527E27BD5D7454F15DCD6C25F05A524A10EB7
          351253E5CB6DB3DBE7A5AE16000B6D4027B4087E22E847D4B764F6DAB1574FBE
          B79735AF60F72CC6B5AF6B3A2D6BECC0A249F256B59423D492436DB692A24F1C
          9E75BBBA6AF434C53B18CD170EF0F31E6BB8734E75BAFCD13F255DAD064C74BA
          007531A3852FCB2B4A420AD4B52BB00427B124A481A16A5E1C3DCED1F7F57AF5
          1BC1FD57E4D85906F2A94F9AA7A978F63CB6E0B52D5F3464A644B5A5494A0210
          14A4F3F203E875B2EDFE8E1D426F2CCD65DF7BB6EB6B7C647B52D3AF41AEC8B0
          625A6C50E0D70C57D0FA189023480953656DA790A42C7A7B680B1748ED1C73AF
          3A01A68069A01A68069A01A68069A01A68069A01A68069A01A680F04770239F7
          D55D75FBDB2DE98336B192F7EB87F7D1B8DB66E9154A2A23DBD41C8732250212
          64D4A141752D40400940F29D59002BF1ABBBD7D881B2B72167CAE8EDB32C9996
          713EE3F37652BF6F56E1DAD66D0F2ADE4FDC6B55765BAA8D0510DB780ED51764
          798E01F8911FFD3ACB7464CA39E69764646E9CBBD2C9536EACB381AAC9A74CBA
          A6C87D4FDCB469CD9934EA8F9AE1F315DC953CC93C9524B09055DDA034EE58DF
          36EABA34643A96CF32352AE8CEAC65090E2F035C15BA90915299527E434D2ADF
          AACA75616511DC92DB8894A24A9825255DC1294E5777566EECB641B0AC673320
          6EFAF4B97295E1992D47AEDBAE355E4351D466D4909934E84C8504B14E4A0F94
          965212952415293CAB800598B7F84F27EA7FEFAF6D00D34034D00D34034D00D3
          4034D00D34034D00D34034D00D34035CA9D6A36B19937A1D3A6F4DBB602A244A
          8DD3599F45911224E98888D2D31AAF0E53BCBABF9470D30B239F72381EA74045
          37EDD3CAE6EA3DBD1C6B65EE2ACE4CADB9E3AA44DB864C58B5B72248B82E5794
          23C56CA23AD0FB4DC58E5D752EA569E56EF6FA8E750FA6F493A3F4FBDE7637DD
          874CEC4B2D349971E7DB3922D19D74C994ED5A98F3497A2CA65DA8BEB01D8F29
          847C8143B92E9E38F98E80F4C7DD222A5BD8A5646DC17572B7205472564B88BA
          3D1EDDA14FF898D8AE8EDBDE6448F4D94070668750890ECA481DCE00903B3B82
          F0B94B699D4F33CECD2D0DB3EE068544B9EF0C5D962DBA847C8AC55D969179D0
          69F392F7DA2EB2A3DEC4C0CA4075A573DEB1DC82AEE200164280529E0FE67FEF
          AF6D00D34034D00D34034D00D34034D00D34034D00D34034D00D34034D00D340
          34D00D34034D01FFD9}
      end
      object QImageExecutive: TQRImage
        Left = 505
        Top = -17
        Width = 233
        Height = 74
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          195.791666666666700000
          1336.145833333333000000
          -44.979166666666670000
          616.479166666666800000)
        Picture.Data = {
          07544269746D6170FEBE0000424DFEBE0000000000003600000028000000DC00
          00004A0000000100180000000000C8BE00000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFCFCFCFFFFFFD6D6D7747476666465
          706F726566696F6E715D5C5E777577C1C1C16B6B6D504F52D9D8D8FFFFFFF9F9
          F9FAFAFAFDFDFDFCFCFDF8F8F8FFFFFFD0CFD03D3C3E797879F1F1F1B6B6B65D
          5D5E6D6D6E6A696D67676B6D6D705C5C5E868688E9E9EAFFFFFFF6F6F6FFFFFF
          FFFFFFCACACC6565682A292D2221253A3A3D838384DBDBDBFDFDFEFBFBFAF9F9
          F9FCFCFCFFFFFFE6E6E5818182323034232225403F42A0A0A2F5F5F6FFFFFFFB
          FBFBFBFBFBFCFCFCFCFCFCFDFDFDFFFFFFCDCCCE4C4B4EA09FA0FFFFFFF5F5F5
          FBFBFCF9F9F9FFFFFFCFCFD0585759969597FFFFFFF9F9F9FAF9FAFBFBFBF6F7
          F6FFFFFFA9A8A9D5D4D5FFFFFFFAFAFAFBFBFBFCFCFCFFFFFFDAD9DA6F6E7069
          686A6D6C6E6666696D6C706160636C6C6ECACBCBFEFEFEF7F7F7FAFAFAFEFEFE
          FCFCFCF4F4F4FFFFFF9494974F4E51D8D8D8FFFFFFF5F5F579797A59585BE0DF
          E1FDFEFEF5F5F5FEFEFEFDFDFDFBFBFAF5F5F6FFFFFFB9BABA5A5A5D807E815B
          5B5D676668E7E6E7FFFFFFF9F9FAFBFBFBFEFEFEFAFAFAFBFBFBFFFFFFB7B7B8
          363638929293FBFBFB929294545255D2D1D2FFFFFFF5F5F5FCFDFCFEFEFEFEFE
          FEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
          FFFFFDFDFDFCFCFCFFFFFFC2C3C327272B0F0E12201F230F0E121E1C210C0B0D
          1E1F1EBFC0C0A0A0A20101015E5D5EF3F3F3FFFFFFFAFAFAFCFCFCFAFAFAFFFF
          FFEBECEB4140440A090CA6A5A5FEFEFE8786880C0B0F1A191D18171B1312161C
          1D20030304434346E0E0E0FEFEFEF8F8F8EFEFEF8383851F1F220E0D11151418
          18171A131216100F132523278B8A8CF5F5F6F9F9F9FEFEFEBFBFBF3C3C3F0F0E
          131C1B1F1F1D2119191C1111155D5C5FDEDDDEFFFFFFFBFBFBFAFAFAFCFCFCFD
          FDFDFFFFFFBBB9BA000003787778FFFFFFF5F5F5FCFCFCF9F9F9FFFFFFBEBDBE
          1412166B696DFFFFFFF9F9F9FAFAFAF6F6F6F9F9F9F6F6F7444347A09FA1FFFF
          FFFCFCFCFAFAFAFBFBFBFFFFFFC7C8CA211F231514181A1A1D1211151B1A1E0A
          0A0C1B1B1DAEADAFFFFFFFF6F6F7FAFAFAFDFDFDFBFBFBF4F4F4FFFFFF68676B
          060509CACACAFFFFFFFEFEFF88878A000001A09FA1FFFFFFF0F0F0FBFBFBFBFB
          FBF6F6F6F8F8F8FEFEFE656467141415B4B4B5868587000000787879FBFBFAFF
          FFFFF9F9F9FCFCFCFAFAFAFFFFFFD9D9D928272A18181CBDBCBEFBFCFC626163
          121113BEBEBFFFFFFFF5F4F5FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFCFCFCFFFFFFC1
          C2C21D1D213D3C40A2A2A49897999C9C9D989899989897DEDEDEFAFAF96A6A6C
          0000007D7C7EFBFBFBFFFFFFFAFAF9FEFEFCFAFAFA616163000000828183FFFF
          FFFAF9FA8887890A090C6C6B6EA4A3A59696989E9EA0939394AFAFB0EBECECFF
          FFFFEDEDED5B5B5D00000028272A7A787AAAAAACB5B5B6A2A2A36F6F71201F21
          383738DEDEDFFFFFFFBDBDBD1F1F21111010767477B3B3B4C3C2C2A8A7A95B5B
          5E01010148484AE3E3E4FFFFFFFAFAFAFBFBFBFDFDFDFFFFFFBBBABB01010478
          7879FFFFFFF5F5F5FCFCFCF9F9F9FFFFFFBEBDBE1413176A6A6DFFFFFFF9F9F9
          F9F9F9F1F1F1FFFFFFBCBBBC0A0A0B525154F3F3F3FFFFFFF9F9F9FAFAFAFFFF
          FFC6C7C81616184140449F9FA19898999D9D9E9697989E9D9EDCDCDCFEFEFEFA
          FAFBFBFBFBFCFCFCFCFCFCF4F4F4FFFFFF69686C070609CACACAFFFFFFFFFFFF
          D9D8DA121115484749F9F7F8F8F8F8FBFBFAFFFFFFF5F5F6FFFFFFCECECF1B1B
          1D414142EBECECEEEDEE4A494C0000009A9A9CFFFFFFFCFCFCF9F9F9FFFFFFED
          EDED4545460505059F9EA0FFFFFFF4F3F368686A111014BEBEBFFFFFFFF5F5F5
          FCFDFDFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFFFFFFFDFDFDFCFCFCFFFFFFC0BFC215161A636366FFFFFFFD
          FDFDFEFEFEFFFFFFFFFFFFF6F6F6FBFBFBE9E9EB4C4C4E0000009F9FA0FFFFFF
          FBFBFBFEFEFF88888A000000616163F6F6F6FAFAFAFEFEFE83848509080CACAC
          AEFFFFFFFBFBFBFFFFFFFFFFFFFEFEFEF5F5F5FCFCFC7F8083000000504E51DE
          DEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDEDDA7A6A8EBEBEBF4F4F358575A
          030306A7A6A7FFFFFFFEFDFDFBFCFCFEFEFEFCFDFC767678000000929293FEFE
          FEFCFCFCFAFAFAFCFCFCFFFFFFBBB9BA010004787779FFFFFFF4F4F4FBFBFBF8
          F8F8FFFFFFBEBDBE1412166B6A6CFFFEFFFAFAFAF5F5F5F5F5F5FCFCFB717172
          060508100F14CCCCCBFFFFFFFAFAFAFBFBFBFFFFFFC7C5C60E0D11646566FFFF
          FFFDFDFDFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFDFDFDFBFBFBFDFDFDFCFCFCF3
          F3F3FFFFFF68676B060508C9C9C9FFFFFFFDFDFDF7F6F76A6A6C060606B6B5B9
          FFFFFFF9F9F9FCFCFCFDFDFDFDFDFD7E7D7F08070AA1A1A3FFFFFFFCFCFCD9D9
          D93332340B0B0CB9B9BBFFFFFFFBFBFBFBFCFC696A6D000000807F81FEFEFDF8
          F9F8F8F8F868686A121114BDBEBFFFFFFFF5F4F4FDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFD
          FDFCFCFCFFFFFFC1C1C11717195C5C5EFAFBFBF4F5F5F3F3F3F8F8F7F7F7F6FC
          FCFCF2F2F2FDFDFDD6D6D82E2E30121212BDBDBDFFFFFFADADAE0000003E3D3F
          E4E4E3F8F8F9F6F6F7FEFEFD86858409080CA3A3A5FFFFFFEFEFEFF7F6F7F9F9
          F9EFEFEFFEFEFECDCECF2121222A2A2CE0E0E2FEFEFEF3F3F3F4F4F4F5F5F5F4
          F4F4F4F4F4FCFCFCFFFFFFFFFFFFDDDDDD2D2D2E393939EFEFF0F5F5F5EEEEEE
          F8F8F9E8E8EAFDFDFDCECED01413155E5F5FF5F5F5FFFFFFFBFBFBFCFCFCFFFF
          FFBAB9BB010004797879FFFFFFF4F4F4FBFBFBF8F8F8FFFFFFBDBDBE1312156A
          696DFFFEFFFCFCFBEEEEEEFFFFFFC7C7C82A2A2C27262909090B7B7B7CFCFCFC
          FCFCFCFAFAFAFFFFFFC6C6C80F0E135C5D5EFAFAF9F2F1F2F4F4F4F8F8F8F7F7
          F7FAFAFAFCFCFCFDFDFDFCFCFCFCFCFCFBFBFBF3F3F3FFFFFF69676C070609C9
          C9C9FFFFFFFAFAFAFFFFFFBBBBBC0B0B0F5151539B9A9D8080818383838D8D8F
          8E8C9024222637363ADDDCDEFEFEFEEBEBEBFEFEFEC2C1C31A1A1B272627D6D6
          D6FFFFFF8E8E900000005A595CF2F1F1F6F6F5F9F9F9F8F8F869696A111113BE
          BEBFFFFFFFF5F4F4FCFDFDFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFCFCFCFFFFFFC1C1C11616
          19606062FAFAFAF7F6F6F8F8F8F7F7F7F9F9FAFCFCFCFCFCFCF1F1F2FFFFFFBE
          BDBE141315343234B2B1B31D1C201E1D21CFCFD0FDFDFDF3F3F3FEFEFEFDFDFD
          86848609090CA7A6A8FAFAFBF4F4F4F8F9F8F8F7F7F6F6F6FEFEFE9C9C9E0101
          038A8B8AFDFCFCF9F9F9FBFBFBFFFFFFFEFEFEFDFDFDFBFBFBF6F6F6F2F2F2FE
          FEFECFCFD02322234B4C4DF2F2F3FAFAFAF7F7F7FFFFFFF4F4F4FCFCFCD8D8DA
          1F1F224A4A4CEDEDEDFEFEFEFBFBFBFCFCFCFFFFFFBBBABB01010479797AFFFF
          FFF4F4F4FBFBFBF8F8F8FFFFFFBEBCBE1413166A6A6DFFFFFFF8F8F8EEEEEEFF
          FFFF84848607060A9F9FA04C4C4E1D1D20E2E2E1FFFFFFF9F9F9FFFFFFC7C5C8
          0E0E12616063FAFAFAF4F4F4F8F8F8F7F7F7FAFAFAFDFDFDFDFDFDFDFDFDFEFE
          FEFDFDFDFCFCFCF3F3F3FFFFFF6A686C080709C9C9C9FFFFFFF8F8F8FEFEFEE9
          E9E957575B00000019181B0E0D100D0B1014131709080C07060A8D8C8EF9F9F8
          FCFCFCF9F9F9F1F1F2FFFFFFA4A3A70606074F4E51AEADAF07060A363639E0E0
          DFFBFBFBF4F4F4FFFFFFF7F7F76A686B121115BEBDBFFFFFFFF4F5F5FCFCFCFE
          FEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFFFFFFFDFDFDFCFCFCFFFFFFC2C2C22021242A2A2E7473756A686B6C6B
          6E6362648B8A8CE9E9E9FFFFFFF8F8F8F2F2F3FCFCFD9C9BA01E1D220F0E1024
          2326B7B7B7FFFFFFF6F6F6FDFDFDFCFCFCFCFCFC8B8A8C0A0A0D4E4D4F737375
          6767696E6E6E636262A9A8AAFEFEFE73727407050AA5A4A6FEFEFEFBFBFBFBFB
          FBFCFCFCFBFBFBFBFBFBFCFCFCFDFDFDFAFAFAFFFFFFD0D0D0212123505050F8
          F8F9F8F8F9F5F5F5FEFEFEF3F3F4FCFDFDDDDDDE222223464547ECEAECFFFFFF
          FAFAFAFBFBFBFFFFFFBAB9BA010004797879FFFFFFF3F3F3FAFAFAF7F7F7FFFF
          FFBDBDBE1312166B696BFEFEFEF0F0F0F8F8F8ECECEC32323329292BF5F5F49E
          9D9E0000009B9B9BFFFFFFFAFAFAFFFFFFC8C7C71A181B2F2F316F6E70676769
          6B6A6D6463648A8A8BEBEBEBFFFEFFF8F8F8FCFCFCFDFDFDFBFBFBF2F2F2FFFF
          FF69676B070609C8C8C8FFFFFFF9F9F9FCFCFCFFFFFF9E9E9F060409767577C8
          C8C8BFBEC0BABBBB37373A28282ACDCDCEFEFEFEF5F5F5FCFCFCF9F9F9F3F3F3
          F7F8F68483861514180C0B0F333236C9C9CAFDFDFDF4F4F4FBFBFBFDFDFDF8F8
          F86A696B121114BEBEBEFFFFFFF5F4F5FCFDFDFDFDFDFEFEFEFEFEFEFEFEFEFF
          FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFBFBFB
          FFFFFFC2C2C22727291110142625291B191E2422261414144E4F4FE0DFE0FEFE
          FEFBFBFAF2F2F1FBFBFCE7E7E94242450000004A4A4DFDFDFDF8F8F8FBFBFBFD
          FDFDFCFCFCFCFCFC8F8E900B0A0E1E1F22211F231F1E21222023131313818183
          FEFEFE717173050408ABA9ACFEFEFEFAFAFAFCFCFCFEFEFEFDFDFDFCFCFCFDFD
          FDFBFBFBF8F8F8FFFFFFD0D0D0202022505051F8F8F8F9F9F9F7F7F7FFFFFFF5
          F5F4FDFEFDDDDCDD222223464547EBEBECFFFFFFFBFBFBFCFCFCFFFFFFBABABB
          010004787779FFFFFFF4F4F4FBFBFBF8F8F8FFFFFFBDBCBD1311166C696CFFFF
          FFF0F0F0FFFFFFAAA8AB060507807F80F9F9F9DFDFE021212339383CF6F7F7FC
          FCFCFFFFFFC8C7C81F1D2117161A2221241B191D2220251414144C4C50E0E0E1
          FEFEFEF6F5F6FBFBFBFDFDFDFCFCFCF3F3F3FFFFFF68676C060509CACACAFFFF
          FFFCFCFCFCFCFCFEFEFEDADADB2E2D2F424243F4F4F5FFFFFFB9B9B914141669
          6869F9F9FAFAF9F9F7F7F7FBFBFBFEFEFEEFEFEFFFFFFFD2D2D42B2B2E000000
          676769FFFFFFF4F4F4FCFCFCFBFBFBFDFDFDF8F8F869686B111013BEBEBFFFFF
          FFF4F3F4FBFCFCFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFCFCFCFFFFFFC1C0C11A181B555455
          DAD9DBD3D2D3D5D4D5D0D0D0DEDDDEF8F7F7FEFEFEF6F6F6F7F7F7FBFBFB7171
          7312101437343910101488888AFFFFFFF9F9F9F9F9F9FDFDFDFEFEFD8785870A
          090D919293DCDBDCD1D0D1D5D4D5CDCDCEE2E1E2FFFFFF8E8D8F000000959496
          FFFFFFF8F8F8F9F9F9FCFCFCFDFDFDFCFCFCFBFCFBF7F7F7F4F4F4FFFFFFCFCF
          CF212122515152F8F8F9F9F9FAF7F7F8FFFFFFF5F5F5FEFDFEDEDDDE23232346
          4747EBEDECFFFFFFFAFAFAFBFBFBFFFFFFB9B9BA010104787879FFFFFFF3F3F3
          FAFAFAF7F7F7FFFFFFBDBBBE1412176B6B6DFEFEFEF9F9F9F7F6F75250531E1D
          1FCBCBCCFEFEFEFFFFFF6D6D70030206BEBEC0FFFFFFFFFFFFC7C7C812101555
          5558D9DADAD1D1D1D5D4D5CFCED1DDDDDEF8F8F9FDFDFDFBFBFBFCFCFCFCFCFC
          FBFBFBF2F2F2FFFFFF68686C070609C8C8C9FFFFFFFBFBFBFAFAFAFDFDFDFBFB
          FC7F7F7F000000A6A7A8FAF9FA4241420E0E10C1C0C2FFFFFFF5F5F5FAFAFAFD
          FDFDF5F5F5FAFAFAF3F3F459595C151518333237161618A2A3A4FFFFFFF6F6F6
          F9F9F9FDFDFDF7F8F769686A121114BEBDBFFFFFFFF4F4F3FCFBFBFDFDFDFEFE
          FEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFBFBFBFFFFFFBFC0C0151419605F62FBFBFBF7F7F7F9F9F9FBFBFB
          FBFBFBFEFEFEF7F8F8F2F2F3FFFFFF9F9F9F000000505051CFD0D13D3D3E0303
          04B0B0B1FFFFFFF1F1F1FBFBFBFDFDFD83838507060AA7A6A8FFFFFFF5F5F5FA
          FAFAFCFCFCF2F2F2FDFDFDC1C1C4111112424342EBECECFFFFFFF7F7F6F5F4F5
          F5F5F5F5F6F5F8F9F8FFFEFFFFFFFFFFFFFFCECECF212223515150F8F8F8F9F8
          FAF6F6F7FFFFFFF5F5F5FEFEFDDDDCDE212123454446ECEBECFDFDFDF3F3F3F4
          F4F4FBFCFCB4B3B5000002757476FCFCFCECECECF3F3F3F1F1F1FEFEFEBCBBBD
          11101569696CF9FAF9FFFFFFC1C1C1111012636364F6F6F6FAFAFAFBFBFBC8C8
          C90C0C105A5A5DFDFDFDFFFFFFC6C6C70D0C0F606062FCFCFBF6F6F6F9F9F9FB
          FBFBFBFBFBFCFCFCFCFCFBFCFCFCFBFBFAF7F7F7F4F4F4EBEBEBFCFCFC656467
          050407C1C1C1FBFCFCF4F4F4F4F4F4F5F5F5FEFEFEC1C1C216161A6C6C6CCCCD
          CE1C1C1C525151F4F3F4FBFBFBF7F7F7FDFDFDF7F7F7F4F4F4FCFCFC80808300
          0000717172CBCACB212122161717C8C8CAFFFFFFF0F0F0FEFEFEF8F7F869676A
          100F12BEBDBEFFFFFFF4F4F4FCFCFCFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFDFCFDFBFBFBFFFFFFC2
          C2C21A1B1F636265FFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFCFCFCF3F3F3FFFFFF
          BEBDBF121212333335DDDDDEFFFFFFD0D0D22220221E1D1FCFD0D1FFFFFFF7F7
          F7FEFFFE8687880E0D11AAA9ACFFFFFFF7F8F8FEFEFEFFFFFFFAFAFAF8F8F9F1
          F1F2666669000000737173ECECEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0
          D9D8D8FFFFFFCFCFD1232324545454F9F9FAF9F9F9F6F6F6FFFFFFF3F3F4FDFD
          FCDEDDDF25252649474AEBEAEBFFFFFFFFFFFFFFFFFFFFFFFFCAC9CB04030781
          8082FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBCBD17171A6A696CFAF9F9FEFEFE
          706F71101114B0B0B2FFFFFFF9F9F9F5F5F5FDFCFC4B4B4E141518E0E0E1FEFE
          FEC7C6C7141316636366FFFFFFFAFAFAFCFCFCFFFEFFFFFFFFFEFEFEFDFDFCFC
          FCFAFEFFFDFFFFFFFFFFFFFFFFFFFFFFFF71707208070CDBDBDAFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDEFEFEF6160622120234F4F521E1D20A0A09FFFFFFFF4F4
          F4FCFCFCFAFAFAF4F4F4FFFFFFA3A3A40101024D4C4DEDEDEDFFFFFFBABABC11
          1012353637E2E3E4FDFDFDF8F8F8F9F8F96C696E151418BFC0C0FFFFFFF3F3F3
          FCFCFCFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFCFDFCFBFBFBFEFEFEC0C0C31C1C20535354D1D1D2CA
          CACBCDCDCDCBCBCCD2D1D3EBEBEBFEFEFED0D1D22A2A2B1A191AC6C6C7FFFFFF
          F2F2F2FFFFFFB4B4B60C0C0D3A3A3BDDDCDDFFFFFFFBFCFC8687880D0C0F8D8E
          8FD0D0D2C8C9CACECFD0C9C9CADEDEDFF4F4F3FEFEFED7D7D84744480000004B
          4C4EAAABABCFCFD0D5D5D5CBCACCA3A3A44F4F505B5B5CFFFFFFCBCACC1F1E20
          535454F7F7F9F8F8F8F6F6F7FEFEFEF4F4F5FCFDFCDEDCDD252525464647EEEE
          EFE1E1E2C9C8C9CDCCCDCFCFD0A09FA107060A686869D3D2D3C8C8C8C9C9CACF
          CFD0FAFBFBC0C0C0141317656365FEFDFDD8D8D81E1C20444546EAEBEBFEFDFE
          FAFAFAF6F6F6FCFCFDAAAAAB000003807F81FFFFFFC4C4C4141315545355D0D0
          D1CACACACECECFCACACCD2D2D3F3F3F3FCFCFCFDFDFCF3F4F4D3D2D4CAC9CAC7
          C7C8D2D2D35D5C5E0B0A0DAFAFAFCFCFD0CDCCCDCBCBCBDCDCDDFDFDFDFEFEFE
          B1AFB11E1D20020203525256DDDEDDFCFCFCF6F6F6FCFCFCF6F6F6FDFDFDBDBD
          BE1515162D2C2DDBDADDFFFFFFF3F3F3FFFFFF99989A000000535354E8E8E9FF
          FFFFF6F6F76B696C131316BCBDBEFFFFFFF4F4F4FCFCFCFDFDFDFEFEFEFDFDFD
          FEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFD
          FDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFDFEFDFDFDFDFDFC
          FDFAFAFAFFFEFFBDBDBE1A1A1B0C0C0E2E2E312120242C2B2F151519353438D4
          D5D5DFDFDF353435080808A7A6A8FFFFFFF9F9F9F9FAF9F7F7F7FFFFFF939295
          000000444347E3E2E4FAF9FA7F7E810000001E1E202B2A2E2423262A282C1514
          166C6B6DEEEEEEF9F8F8FBFBFBD8D6D8616163080A0A08090A1F1F2227272A1D
          1C1F0B0B0C0A0A0C737474FEFEFEC4C4C51818184C4C4DF4F4F4F9F9F9F5F5F6
          FFFFFFF2F2F2FDFEFDD8D6D81E1C1D3A3A3CF8F8F97675781414162120242626
          291A191D06070913141629272B2423271515163D3D3FE3E3E5C5C5C50201035E
          5D5FFFFFFF808181000000969696FEFEFEFAF9FAFBFBFBFBFBFBF9F9FAF2F2F3
          28282C161519EFEFF0C2C2C20A080B0F0F102A2A2D232125292A2D1516193E3C
          3ECFCDCFF9FAFAFCFCFCD1D2D342414216161823242827282B12111508060A1D
          1C202626292221241615196C6C6EFFFFFFFAFAFAE8E7E84A4A4B040605999899
          FBFAFBF7F7F7F9F9F9F6F6F6FCFCFCC0C0C1222223191919C0BFC1FFFFFFFAFA
          FAF9F9F9F9F9F9FBFBFB777578000000605F63EFF0EFF3F3F45D5E5F070708B6
          B6B7FEFEFEF3F3F3FCFCFCFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFDFCFDFCFBFCFEFFFEDBDBDA8584
          8571717371707369686A7272745F5F61767778E5E6E6CACACB6362639E9EA0FC
          FCFCFBFBFBF9FAF9FEFDFEFAF8FAFAFAFAF9F9FA8E8E8E69686BC9C9CAFEFFFE
          B8B6B87373747473756C6B6C6C6B6F6F6E706262629B9C9CF3F3F3FEFDFDF5F5
          F5FFFFFFEFEFF0B3B3B27473755252544B4A4E5D5C5E848384BBBBBCEBECECFF
          FFFFDFDFE18282839D9D9DF9F9F9FAFAFAF7F7F7FDFDFDF6F6F6FDFDFDE9E9E9
          848284939193FCFCFC9E9D9E5C5C5E6665686766686A696C7877796F6E706564
          6869686B5D5D5E7A7A7AE8E7E8E0E0E0717272ABABACFCFCFD999A9A7D7D7EE3
          E3E4FEFEFEF8F9F8FBFBFBFDFDFDFAFAFAFFFFFFABABAD6E6E70DDDDDDE1E1E1
          7B7A7C7574766E6D6F6A686C6F6F716262637D7C7CDDDDDDFBFBFBFCFCFCDEDF
          DF7C7B7D5E5E5F69696B65646870707278767969686B6766686666685E5D5F99
          999AFEFEFFF5F5F6FAFAFAA8A8A9757475DBDBDAFEFEFEF7F7F7F8F8F8F9F9F9
          FBFBFBAEAEAF626263B2B1B1FFFFFFFAFAFBFAFAFAFEFEFEF8F8F8FCFCFCF0F0
          F07F7F80717174D9DAD9FBFBFBA3A3A5787879D8D8D8FFFFFFF6F6F6FBFBFBFC
          FCFCFEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE
          FDFDFDFBFBFBFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFEFEFEFDFDFDFBFBFCFDFDFEFDFDFDFCFCFDFCFCFDFCFCFDFCFCFCFCFCFCFD
          FDFDFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFDFDFD
          FEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFE
          FEFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFDFDFD
          FDFDFDFCFDFCFCFCFCFCFBFCFDFDFDFBFBFBF7F6F7F7F8F8FCFBFBFBFBFBFCFC
          FCFAFAFAFCFDFDFAFAFBF2F2F2F3F3F3FFFFFFFBFBFBFAFBFAFDFDFDFCFCFCFD
          FCFDF9F9F9FAFAFAFFFFFFF4F4F4F0F1F1FCFCFDFAF9FAF7F7F6FAFAFAFCFBFB
          FBFBFCFCFBFBFBFBFBFDFDFDFCFCFCFDFDFDFAFAFAF7F7F7FDFDFDFFFFFFFFFF
          FFF1F0F1EDECEDF6F6F6FFFFFFFFFFFFFFFFFFFDFDFDFCFCFDF6F6F7F8F8F8FE
          FEFEFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFCF6F6F6F8F7F8FDFCFDFBFBFB
          FBFAFBFBFAFBFBFBFBF9F9F9F5F4F5F8F8F8FBFBFCFAFAF9FAFAFAFBFBFBFEFE
          FEFCFCFDF6F6F5FAFAFAFDFDFDF4F3F4FAFAFAFCFCFCFDFDFDFCFCFCFCFCFCFD
          FDFDFCFCFCFAFAFAFEFDFEF6F6F6F6F6F5FEFEFEF7F7F7F9F9F9FCFBFCFBFBFC
          FCFCFCFCFCFBFCFCFCFCFDFCFEFEFEFDFDFDFDFDFDFBFAFBF9F9F9FAFAF9FBFB
          FBF8F8F8F5F5F5F9F9FAFBFAFBFAFAF9FBFAFAFBFBFBFDFDFEFBFBFDFCFCFDF9
          F8F9F3F2F3FBFBFBFCFCFCFCFCFCFCFCFCFDFDFDF8F8F8F0F0F1F5F5F4FFFFFF
          FAFBFBFAFAFAFCFCFCFCFCFCFCFCFCF9F9F9FCFCFDFDFDFDF2F3F3F3F3F3FEFE
          FEF8F8F9F6F6F7FCFCFCFDFDFDFCFCFCFDFDFDFCFCFCFEFEFEFDFDFDFEFEFEFF
          FFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFD
          FEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFCFCFCFCFCFCFDFDFEFCFC
          FDFEFEFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFEFEFEFDFDFDFCFCFCFDFDFDFE
          FEFEFCFCFCFEFEFEFDFDFDFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FEFEFEFCFDFCFCFDFCFCFCFCFCFCFCFDFDFDFDFDFDFDFDFDFFFFFFFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFF
          FFFFFEFEFEFFFFFFFEFEFEFCFCFCFDFDFDFEFEFEFDFEFDFDFCFDFDFBFDFBFCFB
          FDFDFDFEFEFEFEFEFDFCFCFCFCFCFDFDFDFDFDFDFDFAFAFAFAFAFAFDFCFCFFFF
          FEFDFDFDF8F8F8F9F9FAFDFDFDFCFCFCFDFDFCFEFFFFFFFFFFFBFBFBFAFAFAFE
          FEFEFFFFFFFEFDFEFEFEFEFCFCFCFCFCFCFDFDFDFCFCFCFDFDFDFCFBFCFBFBFB
          FCFCFCFCFCFCFBFBFBFBFBFBF7F7F7F8F8F8FAFAFAFEFEFEFFFFFFFEFEFEFBFB
          FBF8F8F8FAFAFAFCFCFCFBFBFBFBFBFBFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFCFDFDFCFBFCFBFBFBFAFAFAFAF9FAFBFBFBFCFCFC
          FDFDFDFBFCFCFCFCFBFCFCFDFAFAFCF9F9F9F9F9FAF9F9F9F9F9FAFBFBFBFFFF
          FEFFFFFFFBFBFAF9F9F9FBFBFBFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFAFAFAFD
          FDFEFFFFFFFDFDFDFDFDFDFCFCFDFCFCFCFCFCFAFAFAFAF9F9F9FAFAFAFDFDFD
          FCFCFCFCFCFCFDFDFDFCFCFCFCFCFCFDFDFDFCFCFCFDFDFDFDFDFCFBFBFBFCFC
          FCFCFCFCFBFBFBFBFBFBFBFBFAF9F9FAF9F9FAFBFBFBFDFDFDFDFDFDFCFCFCFD
          FDFDFDFDFDFCFCFCFCFCFCFEFEFEFDFDFDFAFAFBFCFCFCFEFEFEFEFEFEFDFDFD
          FEFEFEFEFEFEFAFAF9FBFBFBFFFFFFFFFFFFFDFDFDFEFEFEFCFCFCFCFCFCFCFC
          FCFCFCFCFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFEFEFEFEFEFEFDFDFDFCFCFCFDFDFDFCFCFCF6F6F6F3F3F3F3F3F3F2F2F2
          FAFAFAFDFDFDFCFCFCFCFCFCFDFDFDFCFCFBFDFDFCFCFCFCFDFDFCFAFAF9F2F2
          F3F1F1F1F2F2F2F8F8F8FCFCFCFBFBFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFAFAFAF6F6F6F5F5F5F6F6F6F7F7F7F5F5F5F6F6F6FBFBFBFDFCFDFDFDFD
          FCFCFCFCFCFCFEFEFEFBFBFBF5F5F5F6F6F6F7F7F7F6F6F6F5F5F5F5F5F5F9F9
          F9FCFCFCFDFDFDFCFCFCF7F7F8F4F5F5F5F6F5F6F6F6F7F6F7F5F5F5F7F7F7FC
          FCFCFEFEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFDFCFCFBFCF5F5F5F1F1F1F2F2F2
          F1F1F2F0F0F1F1F1F1F4F4F4F8F8F8FCFCFCFBFBFBF8F8F8F9F9F9FDFDFDFCFC
          FBFDFDFCF7F7F8F4F4F6F5F5F5F5F5F5F0F0F0F1F0F1F5F4F5F6F7F6F3F3F3F0
          F0F0F1F1F1F1F1F1F1F1F1F2F2F2F4F4F4FAFAF9FCFCFCFDFDFDFCFCFCFDFDFD
          FCFCFCFBFBFBF4F4F5EDEDEDECECECEDEDEEEFEFEFF1F1F0F5F5F5FCFCFCFAFA
          FAF7F7F7F9F9F9FCFCFCFBFBFBF8F8F8F3F3F3F2F2F2F3F3F3F2F2F3EEEEEEF0
          EFF0F9F9F9FAFAFAF8F8F8F8F8F8F8F8F8F6F6F6F9F9F9F9F9F9F3F3F3EDEDEE
          ECECECEDEDEDF4F4F4F4F4F5EFEEEFF0F0EFF1F1F0EFEFF0F5F5F6FDFDFDFBFB
          FBFCFCFCFCFCFCFCFCFCFBFBFBFEFEFEF8F8F8EEEEEEF2F2F2F1F1F1EEEEEEED
          EDEDEFEFEFF6F6F5F8F8F8F7F7F7F9F9F9FBFBFBFBFBFBFCFCFCF6F6F6EDEDED
          EDEDEDEFEFEFEEEDEEEFEFEFF5F5F5F9F9F9F5F5F5EEEEEEECECECEEEEEEF3F4
          F3F6F6F5F4F4F4EFEFEFECECECF4F4F5FCFCFCFEFEFDFBFBFBFBFBFBFDFDFDF7
          F7F7EEEEEFF0F0F0F3F3F3F3F3F3F2F2F2F3F3F3F3F3F3F3F3F3F3F3F3EFEFEF
          EEEEEEF0F0F0F1F1F1F0F0F0F4F4F4FAFAFAFCFCFCFCFCFCFCFCFCFCFCFCFEFE
          FEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFCFCFCFC
          FCFCFCFCFCFCFCFCFDFDFDFEFEFDFEFEFEFEFEFEFCFCFCFBFBFBFCFCFCFDFDFD
          FCFCFCFCFCFCFCFCFDFCFCFCFCFCFDFDFDFCFEFEFEFDFDFDFEFEFEFDFDFDFCFC
          FCFDFDFDFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFBFBFBFC
          FCFCFDFDFDFBFBFCFEFEFEFFFFFFFDFCFDFBFBFBFCFCFCFDFDFDFDFDFDFEFFFE
          FFFFFFFCFCFCFDFDFDFCFCFCFBFBFBFEFEFEFFFFFFFDFDFDFBFBFBFEFEFEFFFF
          FFFCFCFCFBFCFBFDFDFDFCFCFCFDFDFDFEFFFEFFFFFFFDFDFDFCFCFCFCFCFCFC
          FCFCFAFBFAFCFCFCFFFFFFFFFFFFFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDFFFFFF
          FDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFCFDFDFCFDFDFCFFFFFFFDFDFDFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFEFDFDFDFDFDFEFEFEFB
          FBFBF8F8F8FBFBFBFBFBFCFCFCFCFDFDFDFCFCFCFEFEFEFCFCFCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFBFCFCFDFDFDFEFDFDFCFCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFE
          FEFEFEFEFEFDFDFDFBFBFBF3F3F3F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF3F3F4F2F2F2FCFCFCFDFDFDFCFCFCFBFBFBFCFC
          FCFCFCFCFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF
          FFFEFCFCFCFBFBFBFDFDFDF7F7F7FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF3F3F3F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF9F9F9F1F1F1F9F9F8FDFDFDFDFDFDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFDFCFCFCFCFCFCFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFCFCFCFCFCFCFDFDFDFBFCFBE4E4E5CE
          CDCFCFCFD1D5D5D6F1F1F2FEFEFEFBFBFBFCFCFCFCFCFCFDFDFDFCFCFCFBFBFB
          FDFDFEF1F1F1D2D2D2D0D0D0CECFD0E7E6E7FDFEFEFBFBFCFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFEFEFEEBEAEBDBDBDBE6E6E6E6E7E6E6E6E7E6E7E7DCDCDCEF
          EFEFFDFDFDFCFCFCFCFCFCFDFDFDFDFDFDF5F4F6D9D8DAEAE9E8E4E4E4E7E7E8
          E6E7E7DDDDDEE6E6E8FCFCFCFEFEFEF8F8F8E1E1E1E0E0E0E9E9EAE3E3E4EBEA
          EADEDEDFE1E0E2FAFAFAFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFEFEFEF3F3F3DC
          DDDDE4E4E4E8E8E9E5E5E6E8E8E8DDDCDDE6E5E5FCFBFBFDFDFDFCFCFCFDFDFD
          FDFDFDFCFCFDFCFCFCFEFEFEDEDEDEE0E0E0E6E6E6E6E6E7E6E6E6E7E7E7E9E8
          E8E8E7E8E6E5E5E1E1E2DFE0E1DCDCDCDDDCDCEAE9E9FCFAFBFDFDFDFCFCFCFC
          FCFCFCFCFCFBFBFBF9F9F9FEFEFED1D1D1B8B8B9C2C1C3C2C2C3C1C1C3BCBBBC
          C3C3C5F6F6F6FCFCFCF9F9FAFBFBFCFBFBF9FEFEFEDEDEDEB8B8B9C0C1C1C1C1
          C3C5C6C6BCBCBDBDBCBFEFEEEFFEFEFEFBFBFBFAFAFAFCFDFCF8F8F8F4F4F4FF
          FFFFFDFCFCCACACBABAAAB9796979292939291959A999CABABACBABABBDADBDB
          FFFFFFFEFEFEF2F3F3F9F9F9FEFEFEFCFCFCFBFBFBFDFDFDEFEFEEB6B6B8C3C2
          C4C1C1C3C3C2C3BEBEBFBBBBBBE3E3E2FEFEFEF8F8F8FCFCFCFDFDFDF8F8F8FF
          FFFEEEEEEDC5C3C6B9B9BACBCCCDBFBEC0A9A9ABE3E3E3FFFFFFFFFFFFDCDCDC
          BBBABAAAAAAC9D9C9E94919598979AA4A5A5B6B6B8EAEAEAFFFFFFF6F6F6F7F7
          F7FAFAFAFEFEFEEAEAEABDBDBFBCBBBDC2C2C4C2C2C3BFC0C1C6C6C7CCCBCCC9
          C9C9C5C4C6C5C4C4C1C1C2BDBDBEBCBBBBC8C8C9E9EAE9FDFDFDFAFAFAFBFBFB
          FDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFE
          FEFEFEFEFCFCFCFBFBFBFEFEFEF5F4F57E7D7F2A2B2E3A3A3D3E3E40B7B7B9FF
          FFFFF7F7F7FBFBFBFCFCFCFCFCFBFDFEFEF5F4F4FEFEFFB4B4B439383A363539
          2F2F32828283FEFEFEF7F7F7FDFDFDFCFCFCFDFDFDFCFCFCF8F8F8FFFFFFE0DE
          E0706E7243424452515459585B403F43727273E6E4E6FFFEFFFBFBFBFCFCFCFC
          FCFCFEFEFEF0F0F179787B4241445655574F4F514545485D5C5FCCCCCDFDFDFD
          F4F4F4FCFCFCA9A9A94A494D49484C545357515153464648ADACAEFBFBFBFDFD
          FDFBFBFBFDFDFDFCFCFCFBFBFBFFFFFFF2F2F28A898A3F3E4256555A53525645
          44475B5B5CCCCBCCFEFEFEF8F8F8FBFBFBFDFDFDFDFDFDFDFDFDF7F7F7FFFFFF
          BEBEBE4C4C4D4B4B4D505053504F53504F514B4A4D4A494D4A494C49474A4C4C
          4E5151545B5A5D51505179787BE1E1E2FEFEFEF8F8F8FBFBFBFCFCFCF7F7F7FD
          FDFDD0D0D23C3B3E26252A2F2E332A2A2D27252989898CFCFCFCF5F5F4FBFBFC
          FCFCFCF7F7F7FFFFFFD4D4D55151531F1E213332353436371E1E217B7B7DF1F1
          F1FFFFFFFAFAFAFCFCFCF8F8F8FAFAFAFFFFFFB0B0B164646835343729282A20
          1F230D0C0F0606070707070E0E112B2A2F5251557B7B7DD4D3D4FFFFFFF6F6F6
          F9F9F9FEFEFEFCFCFCFCFCFCEFEFEF67676A201F233434372D2C302120235E5E
          61E5E5E6FCFCFCF5F5F5FDFDFDF4F4F4FCFCFCE0E0E1656566201F223736392D
          2C2E2222257C7D7EEAE9EAB6B5B56E6E6F48484A37363A18171B080808040304
          0505061212133130344F4E52A1A1A2F6F6F6FDFDFDF3F3F3F7F7F7F8F8F88181
          832323272A282E2E2E322E2F322020241B1B1C1B1B1B191A1B1C1B1D1F1F232D
          2C30363437323235878888F4F4F4F8F9F9F7F7F7FDFDFDFDFDFDFEFEFEFDFDFD
          FEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFDFEFEFDFCFCFCFBFBFAFFFF
          FFEAE9EA4B4A4C00000016161A000001808082FAFAFBF8F8F8F9F9F9FDFDFDFB
          FBFCFDFDFDF1F1F1FEFEFE8484840402060A090C0101043B3B3EFBFBFBF9F9F9
          FAFAFAFCFCFCFDFDFDFDFDFDF8F8F8FAFAFAF9F9FA838385010103100F121010
          140303058F8D8FFBFAFBFCFDFCFAFAFAFDFDFDFBFBFBFCFCFCFDFDFDA5A5A600
          00021312160A090D0000016A686BF5F4F5F9F9F9F0F0F0FFFFFFCFCECF343237
          0000001C1B1F01000139393CD6D6D7FEFEFEFAFAFAFBFBFBFEFEFEFCFCFCFAFA
          FAFBFBFBFDFDFDB0B0B113111509090B16151A000000605F61EBECECFCFCFCF7
          F7F7FDFDFDFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F1F2F23D3C3E0000030C0C0F
          0C0B100A090D06030806040A0201070000030000000000000000000000002828
          29C1C1C2FEFEFEF8F8F8FBFBFCFDFDFDFBFBFBF6F6F6FBFBFB5B5B5E00000411
          1114040307252428CCCCCCFEFEFEF4F4F3FDFDFEFDFDFCF8F8F8F9F9FAF8F9F9
          7B7B7C000001151619090A0D171619B9B8B8FEFEFEFAFAFAFCFCFCFCFCFCFBFC
          FBF8F8F97A797B1F1D210D0D1315141808070B0000001D1C2038383A3F3D402B
          292D01010600000017161A3332359C9C9EFCFCFBFCFCFCF9F9F9FDFDFDFAFAFA
          FDFDFDB1B1B100000217151807060A09070C919092FDFDFDF2F2F2FDFDFDF6F6
          F6F7F7F7F3F3F37171720000011615170F0E120A090D828283E6E6E6FEFEFE43
          42450707090E0D110000001011133A3A3B504F524948491B1B1D0000030E0D10
          1615196E6E70E9E9EAFDFDFDEDEDEDFFFFFFB5B4B61A191E0100051312160C0C
          0E2120243434353131332D2E2F262628151417040306000000000000555558EA
          EBEBFAF9F9F6F6F6FEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFDFDFCFDFDFEFDFDFDFAFAF9FFFFFFDADADB3E3D3F0F0E11302F
          32060609525255E4E4E5FEFEFEF7F7F7FCFCFCFCFCFDFBFBFBF5F5F4FFFFFF5F
          5E60100F121E1D2019181C222125D5D4D6FDFDFDF7F7F7FDFDFDFBFBFBFEFEFE
          FBFBFBF6F6F6FFFFFFBABABB2220231E1C211515182C2C2ECDCDCDFFFFFFF9F9
          F9FBFBFBFDFDFDFCFCFCFBFBFBFFFFFFDEDEDF2B2A2E18171A1B1A1E16151AA9
          A8A9FFFFFFF4F4F4F6F6F6FAFAFAF4F4F46B6A6C0A090D2A292D050408777779
          F9F9FAFFFFFFFAFAFAFBFBFBFDFDFDFDFDFDFBFBFBF9F9F9FFFFFFE3E3E34544
          460D0C102424271211159A9A9CFFFFFFF7F7F7F9F9F9FEFEFEFBFBFBFBFBFBFD
          FDFDFEFEFEF5F5F5FFFFFF7D7D7E0E0D111E1C20131116434246BFBEBFBBBABB
          BAB9BCB7B7BAABABAC8F8F91717072252528020206A3A3A4FFFFFFF8F8F8FBFB
          FBFEFEFEFDFDFDF4F4F4FFFFFF9494960F0E122020231010144D4D50F8F8F9F7
          F7F7F9F9F9FFFFFEFDFDFDFAFAFAF5F5F5FFFFFFABABAC1A1B1D232125100F13
          424043E1DFE0FFFFFFF9F9F9FCFCFCFCFCFCFCFCFC69696B08070B1514181D1D
          1F0F0D103231369A9A9BC9C8C9D8D8D9DCDCDDD4D4D5B6B5B75351550B0B0F10
          1013121015868686F8F9F8FDFDFDFCFCFCFBFBFBFFFFFFE2E2E2201F221E1D21
          14121828282BBEBFBFFFFFFFF1F1F2FBFBFBF5F5F5FEFEFE98979A0D0C101B1B
          1E22212615151999999AFBFBFBFFFFFFFCFCFD3F3D4109070C13121679787BC4
          C4C5DBDBDBE7E7E8E6E6E6CECED06D6C7017171A1312170A090C6D6C6FF2F2F1
          F4F4F4F9F9F9DADADA4240430E0D11252428100F12A9A8A9E3E1E3DDDDDED8D8
          D9D3D3D3C9C9C9B8B8B88F8E8E2C2B2D2E2D31D4D4D5FEFEFEF3F3F3FEFEFEFC
          FCFCFDFDFDFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFEFEFD
          FCFCFCFAFAFBFEFEFEC4C5C629292D1110143030340D0D1129282CBABABBFFFF
          FFF5F5F5FAFAFBFDFDFDF4F4F5FCFBFCDEDFE038373A100E13201F221D1C2012
          12159D9D9FFEFFFFF5F5F5FEFEFEFAFAFAFDFDFDFCFCFCF4F4F5FEFEFEC7C7C8
          2E2E311B1B1E1212163B3A3CD8D8D7FEFEFEF9F9F9FCFCFCFCFCFCFCFCFCFAFA
          FAFEFEFEE3E3E34240441110141C1B1F201E22B7B7B8FEFEFEF2F2F2F8F8F8F8
          F8F8F7F7F779797B100F1324232709080D878789FBFBFBFDFDFDFBFBFBFDFDFD
          FCFCFCFDFDFDFCFCFCFBFBFBFEFEFEEAEAE95555570B0B0F2221241C1B1EA7A7
          A8FFFFFFF6F6F6FAFBFAFDFDFDFCFCFCFCFCFCFCFCFCFEFEFEF5F5F5FEFEFE93
          93940F0E121D1D200F0E12616062FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA
          F6F6F7D4D4D66F6F7188888AF2F2F2FEFEFEF9F9F9FDFDFDFDFDFDF5F5F5FEFE
          FEA4A3A4100F131C1C1F0E0D11575759FFFFFFF5F5F5FBFBFBFDFDFDFEFEFDFB
          FBFBF4F4F4FEFEFEB6B5B62221251E1E220D0C104B4B4EE5E4E5FEFEFEFBFBFB
          F9F9FAFFFFFF8E8E900605091B1B1E1D1C1F0D0C114E4D51DAD9DAFDFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEAE9EA6C6C6F1313171514190B0A0E979697FE
          FEFEFDFDFDFBFBFBFEFEFEE5E5E52C2C2F18171B1413162D2D31C5C5C5FEFEFE
          F1F1F1F7F7F7FFFFFFBEBDBE23232512111527262A0C0C10848586FAFAFAFFFF
          FFF7F7F7FEFEFE404043131217B1B1B3F9F9FAFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE9E9EA63636516151A17161A151316A5A4A6FEFEFEFDFEFDE1E1E14A494D
          0D0C0F222125111014CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDD0D0D089898BBDBEBEFFFFFFF9F9F9FCFBFBFDFDFDFEFEFEFDFDFDFEFEFEFF
          FFFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFDFDFCFCFCFCFBFBFCFFFFFFADACAF
          18191C17181B27272B1111140F0F128A8A8CFBFBFCF8F8F8F9F9F9FFFFFFF1F0
          F1FFFFFFA9A9AA1C1B1F1414171C1B1F1615190E0F116C6C6EFFFFFFF3F3F3FD
          FDFDFBFBFBFCFCFCFBFBFBF6F6F6FFFFFFCDCCCD32313518171B0F0D133E3D40
          D8D8D8FFFFFFFBFBFBFDFDFDFDFDFDFBFBFCFBFBFBFFFFFFE6E6E649494C0D0C
          1019181C212124BBBBBCFFFEFFF3F3F3F7F7F7F8F8F8F8F9F97D7D7F110F1420
          1F230A090D8E8E8FFBFBFBFDFDFDFCFCFCFEFEFEFDFDFDFEFEFEFDFDFDFBFBFB
          FFFFFFEDECED5C5A5D0A090D1E1D201E1D21ADACAFFEFEFEF7F7F7F9FAF9FCFC
          FCFDFDFDFEFEFEFBFBFBFEFEFEF6F6F6FEFEFE9E9D9E0F0E121B1A1E0C0C1065
          6466FFFFFFF3F3F3FBFBFBFDFDFDFCFCFCFCFCFCFEFEFEFFFFFFF1F1F1DDDDDD
          F3F3F3FEFEFEFBFBFBFCFCFCFEFEFEF7F7F7FFFFFFACABAD100F131B1B1E0E0D
          115B5A5DFFFFFFF6F6F6FBFBFBFDFDFDFDFDFCFCFCFAF5F5F6FFFFFFBCBCBD25
          24271C1D200B0B0F515053E7E7E7FFFFFFF7F7F8FDFDFCDDDDDE212024141317
          2120240E0E113D3C3EDADADAFFFFFFF8F7F7FCFCFCFBFBFBFBFBFBFCFCFCF6F6
          F6FFFFFFDFE0E04B4B4D1413171312161D1D21C6C6C8FFFFFFF9F9F9FFFFFFE6
          E6E73131341514181312162F3033C8C8C9FFFFFFEDEDECFEFEFEDBDBDC424144
          0A090D2B2A2E09090C646365F1F0F0FFFFFFF6F6F6F8F8F8FFFFFF3333369C9C
          9EFFFFFFFDFDFDFCFCFCFBFBFBFBFBFBF9F9F9F8F8F8FFFFFFAEAEAF1F1D211C
          1B1F0E0D125A595BE8E8E8FFFFFFE3E5E44F4E500C0C0F1F1E20141217CACACA
          FEFEFEFBFBFBFCFCFCFAFAFAFBFBFBFBFBFBFDFDFDFFFFFFF6F6F6EFF0F0FBFB
          FBFDFDFDFBFBFBFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFBFBFBFDFDFDFCFCFCFCFCFCFEFEFE9898990B0A0E1B1B1E3231353E3D40
          07060B504F52E8E8E9FEFEFEF7F7F7FDFDFDF1F2F2FFFFFF767578100E121515
          182A292E56565808070B444446F5F6F6F9F8F8FAFAFAFCFCFCFCFCFCFBFBFBF6
          F6F6FFFFFFD2D1D136353919161B0F0D11424144DBDBDDFFFFFFFAFAFAFDFDFD
          FDFDFDFCFCFCFCFCFBFFFFFFE9E9E94E4E510C0C0F1B191E242327BDBEBFFFFF
          FFF3F3F3F8F8F8F9F9F9FBFBFB828283141216201F210C0C0F929294FCFCFDFE
          FEFEFCFCFCFDFDFDFEFEFEFFFFFFFEFEFEF9F9F9FFFFFFF0EFF0615F620B090D
          1D1D20212025B2B1B4FFFFFFF7F7F7FAFAFAFCFCFCFCFCFCFEFEFEFCFCFCFDFD
          FDF7F7F7FFFFFFA3A2A41110141D1B200D0D1268676AFEFEFEF2F2F2F9F9F9FB
          FBFBFBFBFBFAFAFAF9F9F9FBFBFBFFFFFFFFFFFFFBFBFBFDFDFDFDFDFDFBFBFB
          FFFFFFF7F7F7FFFFFFB1B1B21211151C1B1F0F0E12605F62FEFEFEF5F5F5FBFB
          FBFDFDFDFCFCFBFBFBFBF6F6F6FFFFFFC0C1C229272B1D1B1F0B0B10565457E9
          E9E9FFFFFFF3F3F4FFFFFF84848609080C20202215141717161B9C9C9EFFFFFF
          F0F0F0FCFCFCFAFAFAFCFCFCFCFCFCFCFCFCFBFBFBF2F1F2FFFFFFAAAAAB1816
          1B222125040307656468F2F2F3FDFDFDFFFFFFE8E8E936363914121614131732
          3235CBCCCDFDFDFDF5F5F5F2F2F269696B06060929282C0D0C10404043DDDCDE
          FFFFFFF9F9F9F9F9F8FCFCFCEBEBEB929193F5F4F5FCFCFCFAFAFAFBFBFBFCFC
          FCFCFCFCFAFAFAF7F7F7FFFFFFBDBEBE2423261A191D1413173D3B3FD5D4D5FF
          FEFFE7E8E75352540D0D111D1E2017161ACFCFCFFEFEFEFBFBFBFBFBFBFBFBFB
          FCFCFCFBFBFBFAFAFAFBFBFBFFFEFEFEFFFFFBFBFBFDFDFDFDFDFDFCFCFCFDFD
          FDFDFDFDFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFCFCFCFDFDFDFAFBFAFE
          FEFEFAFAFA7E7E800303071515184D4D4F98979A2321231E1E1FC3C3C4FFFFFF
          F7F7F7F3F3F3FBFBFBE7E7E74544481312160C0B0F515154BFBFC008060B2625
          29C8C7C7FEFEFEF4F2F3FEFEFEFDFCFDFDFDFDF6F6F6FFFFFFD6D6D63B3B3D17
          171B0E0E13444548DEDFDFFFFFFFF9F9F9FCFCFCFCFCFCFBFBFBFAFAFAFFFFFF
          EBEBEC5453570B0A0E1B1A1E28272BC1C2C3FFFFFFF3F3F4FAFAFAF8F8F9FDFC
          FC8786881615181D1C1F0E0D12969597FEFEFEFEFEFEFAFAFAFCFCFCFEFEFEFE
          FEFEFCFCFCFAFAFAFFFFFFF3F3F36667680B0B0E1C1B1E242427B7B7B9FFFFFF
          F6F5F5FBFBFBFDFDFDFDFDFDFEFEFEFCFCFCFEFEFEF7F7F7FFFFFFA9A8AA1310
          161B1B1E100E136C6B6FFFFFFFF3F3F3FBFBFBFBFBFBFCFCFCFDFDFDFCFCFCFC
          FCFCFBFBFBFCFCFCFDFDFDFCFCFCFDFDFDFCFCFCFFFFFFF7F7F7FFFFFFB7B6B7
          1413161C1A1E0E0D11636264FFFFFFF4F3F4FCFCFCFCFCFCFBFBFBFBFBFBF4F4
          F5FFFFFFC4C4C52B2B2E1B1A1E0B090D5A595BEDEDEDFEFFFFF7F7F7FEFEFE45
          44471010131F1F220D0C10424144ECECEDFBFBFBF5F5F5FFFFFFFCFCFCFEFEFE
          FDFDFDFCFCFCFFFFFFF4F3F4FEFDFED9D9D93F3D411110151B1A1E19191CCECD
          D0FFFFFFFFFFFFEAE9EA3B3A3D111014151517343438CCCBCCFFFFFFFDFDFD97
          97980D0D10232226161519222124BFBFC0FFFFFFF9F9F9FAFAFAFBFBFBFEFEFE
          F7F7F7FBFBFBFDFDFDFBFBFBFDFDFDFCFBFCFCFCFCFAFAFAF8F8F8FBFAFAFFFF
          FF9797980F0E12242327110F143A393DD3D3D4FFFFFFEAEAEA5555580E0C101D
          1D2018191BD0D0D1FEFEFEFCFCFCFBFBFBFCFCFCFDFDFDFCFCFCFDFEFDFCFCFC
          FBFBFBFCFCFCFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFBFCFBFFFFFFEEEEEE605F6106040812
          12155C5C5EDEDDDE504F50000000939396FEFEFEFBFBFBEEEEEEFFFFFFB8B8B9
          2222261A1A1D060509848486F4F4F42221250F0E12969697FFFFFFF2F1F2FDFD
          FDFDFCFDFDFDFDF7F7F7FFFFFFD6D6D53A3A3D16171A0F0F13434447DCDCDCFE
          FEFEF8F8F8FBFBFBFBFBFBFAFAFAF9F9F9FEFEFEE9E9EB5454580A090E1B1A1E
          28272BC3C2C2FFFFFFF3F3F5FBFBFBF7F7F9FCFDFD8A8A8B15151A1B1A1E100F
          14989899FEFEFEFEFEFEFBFBFBFDFDFDFEFEFEFDFDFDFCFCFCFCFCFCFFFFFFF2
          F2F26565670B0A0E1B1B1E252527B9B8BAFFFFFFF6F6F6FCFCFCFEFEFEFEFEFE
          FFFFFFFDFDFDFFFFFFF8F8F8FFFFFFAEADAF13111619191C0F0E126D6C70FEFE
          FEF2F1F2FAFAFAFBFBFBFBFBFBFBFBFBFCFCFCFCFCFCFCFCFCFDFDFDFDFDFDFD
          FDFDFEFEFEFDFDFDFFFFFFF8F8F8FFFFFFB9B8B91514171C1B1E0D0D10616063
          FEFEFEF2F2F3FAFAFAFBFBFBFAFAFAFAFAFAF4F3F4FEFEFEC4C3C42A2A2E1A1A
          1E0B0A0E5A5A5CEEEEEEFDFDFDFCFCFCE1E1E129272C17171A1A191D0F0E1271
          7173FFFFFFF1F1F1FDFDFEFCFCFCFCFCFCFEFEFEFDFDFDFCFCFCFEFEFDF7F7F7
          F9F9F9F1F1F163636509070D2625290504099B9B9BFDFDFDFFFFFFE9EAEB3D3D
          42121115141316333337CDCCCEFFFFFFB6B5B622202418171C201E230E0E1198
          9999FFFFFFFAFAFAFAFAFAFDFDFDFBFBFBFDFDFDFEFEFEFEFEFEFCFCFCFDFDFD
          FDFDFDFBFAFBFBFBFBFCFCFCFEFEFEFFFFFFC2C1C2302F331110142D2C300505
          09515054E2E1E2FFFFFFEBEBEB57575A0E0D101D1C1F18181BCFCFD0FFFFFFFC
          FCFBFBFBFBFCFCFCFBFBFBFBFBFBFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFCFCFCFAFAFAFEFEFEDBD9DB41404409080C14131869686BFBFBFB82818400
          0000565556E6E6E7FFFFFFEDEDEDFFFFFF8A8A8B1110151C1B1E0C0C12BCBCBE
          FFFFFF5453570000016C6C6FFEFEFEF3F3F4FAFAF9FDFDFDFCFCFCF6F6F6FFFF
          FFD7D7D73C3B3F18181B0E0E11464649E1E0E1FFFFFFFAFAFAFDFDFDFDFDFDFC
          FCFCFBFBFBFFFFFFECECEE55555809080C1C1B1F28252BC3C1C3FFFFFFF4F4F5
          FBFBFBF8F8F9FDFDFD89898A16161A1C1B1F111013989899FEFEFEFDFDFEFBFB
          FBFDFDFDFDFDFDFEFEFEFDFDFDFBFBFBFFFFFFF2F2F16564650A0A0D1C1A1F26
          2428B8B8B9FFFFFFF5F6F6FCFCFCFEFEFEFEFEFEFFFFFFFDFDFDFFFFFFF8F8F8
          FFFFFFACACAD12101619181C0E0D11717073FFFFFFF8F7F8FFFFFFFFFFFFFFFF
          FFFCFCFCFAFAFAFBFBFBFBFBFBFCFCFCFBFBFBFCFCFCFDFDFDFBFBFBFEFEFEF8
          F8F8FFFFFFBCBCBC1515191B1A1E0D0C10656567FFFFFFF9F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFAFAFAFFFFFFCAC9CA2C2B2E1A191D0C0B1059595DEEEDEEFDFC
          FCFEFEFEC5C6C51D1C2019181C17171A141317949496FEFEFEF3F3F3FDFDFDFB
          FBFBFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDF9F9F9F5F5F5FDFEFE7A7B7D0A0B0E
          24222508070B6A6A6CF5F5F5FFFFFFE9E9EB3D3D41121216131115363639DFDF
          E0DDDDDD3736381210142525290603086F6E70F3F3F3FDFDFDF8F8F8FDFDFDFB
          FBFBFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDFCFCFCFBFBFBFCFCFCFFFFFFFFFFFF
          F0F0F0A2A2A32B2B2F0F0E122C2C2F1513180C0A109A9A9CFDFDFDFBFBFBEEEF
          EF5A5A5D0D0C111C1B2018171BDBDADBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFAFBFAFBFBFBFDFDFDFCFCFCFBFBFCFDFDFDFDFDFDFEFEFEFCFCFCFDFDFD
          FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFCFCFCF9FAF9FFFFFFC3C1
          C3262529100D1319181C7E7F80FEFEFEB2B1B5141316202021C4C4C5FFFFFEF5
          F5F5EFEFEF555558100F141514172D2C30E5E5E6FEFEFE919193000000454547
          E4E4E4FAFAFBF6F6F6FEFEFEFBFBFBF7F7F7FFFFFFD9D9DA3F3E4118161A0D0B
          1049484CE8E8E9FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F559
          585C0A080B1B1C1F29272CC2C2C4FFFFFFF4F4F5FBFAFBF8F9F8FEFDFE8A8A8B
          17171A1B1A1E11101499999AFEFEFEFEFEFDFBFBFBFCFCFCFEFEFEFFFFFFFEFE
          FEFAFAFAFFFFFFF3F3F36867690B090E1B1A1F252528B8B8BAFFFFFFF6F6F6FB
          FBFDFDFDFDFDFDFDFEFEFEFCFCFCFFFFFFF8F8F8FFFFFFADACAE11111519181D
          100E126B6B6DF4F4F4DFDFE1EDECECF3F3F3FBFBFBFFFFFFFFFFFFFEFEFEFAFA
          FAFBFBFBFDFDFDFCFCFCFCFCFCFCFCFCFFFFFFF7F7F7FFFFFFBCBCBD1414181A
          191D100E13636365F7F7F8EDEBEDF4F4F4F3F2F3F3F3F4F3F3F3EEEDEEF8F8F8
          C2C1C22E2C2E1C1B1E0B090F5A5A5CEDEEEDFCFDFDFFFFFFB8B9B919181C1A19
          1C17161A1B1A1EADACAEFFFFFFF4F4F4FEFEFEFCFCFCFEFEFEFCFCFCFEFEFEFD
          FDFDFEFEFEFAFAFAF4F4F4FEFEFE8686880E0E11211F220D0D104E4C50EEEEEE
          FFFFFFEAE9EA3D3C401010141615193434379E9C9D59595B08060C29292D0F10
          13575558E3E1E3FDFDFDF6F6F6FCFCFCFBFBFBFBFBFBFDFDFDFCFCFCFBFBFBFD
          FDFDFDFDFDFAFAFAFDFDFCFFFFFFF2F2F2B2B3B45351540E0C1118161A27262A
          14141705030869676AEEEEEEF9FAF9F5F5F5F3F3F25C5C5D0C0B101D1C201A18
          1DB3B2B3D2D2D2CDCDCFD4D4D4DDDDDDECECEDFEFEFEFFFFFFFDFEFDFCFCFCFD
          FDFDFDFDFDFCFCFCFCFCFCFEFEFEFCFCFCFEFEFEFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFDFCFDFAFAFAFBFCFBFFFFFFA8A8A811111517161A1C1C1F9F9F
          A0FEFEFEDDDCDD49484B0000008F8D91F7F6F7FFFFFFC5C4C62D2B2F19181C08
          080C646467F5F5F5FFFFFFC9C9CA08070A242428B6B6B7FEFEFEF1F1F1FDFDFD
          FCFCFCF7F7F7FFFFFFD9D9DA41404211101318161B32313589898C9E9F9F9695
          979898999898999797999696999B9B9B8E8D8F3B3A3E1514161515192A2A2DC1
          C1C2FFFFFFF3F4F5FBFBFBF8F9F8FEFDFE8A8A8B1616191B191E11101499999A
          FEFEFEFDFDFCFCFCFCFDFDFDFDFDFDFEFEFEFDFDFDFBFBFBFFFFFFF3F3F46A69
          6D0A090E1B1B1E262427B9B7B9FFFFFFF5F7F6FCFCFCFEFEFEFEFEFEFFFFFFFD
          FDFDFFFFFFF7F7F7FFFFFFADACAE1211161C1B1F19181C2E2D315253544C4C4E
          5556576464667E7E7EA4A4A6DBDBDCFEFDFDFFFEFEF9F9FAFCFCFCFDFDFDFDFD
          FDFCFCFCFEFEFEF8F8F8FFFFFFBCBCBD1313171A191E19181C302F326363665F
          5D605F5F61615F61605F61605F605E5E5E6464644F4E511E1E2225262706050A
          5A595BEEEFEEFBFBFBFFFFFFB8B8B71A191D1A181D151418201F22B8B7B9FFFF
          FFF4F4F6FEFEFEFCFCFCFEFEFEFCFCFCFDFDFDFCFCFCFDFDFDF9F9F9F4F3F4FF
          FFFF8787890E0C111F1F22111014403F43EAEAEAFFFFFFEAEBEB3C3B3F0F0E12
          25242718181B00000400000117161B0A090E1D1D20A9A9ABFEFEFEFCFCFCFAFA
          FAFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFCFCFCFEFEFEFAFAFAFEFEFDFFFEFFCC
          CBCC646467100E140D0C102726291E1C200A0A0E131216727071E9E9E9FDFDFD
          F1F2F2FAFAFAF2F2F15C5C5E0B0A0F1D1C1E1E1D2119181C19181D1A191E2223
          243333355252558B8A8BD2D1D3FCFBFCFCFCFCFAFAFAFEFEFDFCFCFCFCFCFCFE
          FEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFBFBFB
          FDFDFDFBFBFB8683860606091A1B1E26262ABFBFC0FFFFFFF6F5F588888A0202
          024F4E51DFDEDFFFFFFF9797991514171E1E2107070AA1A3A3FEFEFEFEFEFEE8
          E8E82F2F3208080C8D8D8EFFFFFFF2F2F2FCFCFCFDFDFDF6F6F6FFFFFFD9DADA
          42414508080C26262917151B0000000000000000000000000000000000000000
          000000000000001413172322250D0C102C2A30C2C1C2FFFFFFF4F4F4FAFAFAF8
          F8F8FDFDFD88898A17171B1C1A1F100F13989899FEFEFEFDFDFDFBFBFBFDFDFD
          FDFDFDFDFDFDFCFCFCFBFBFBFFFFFFF2F2F26564680B0A0E1C1B1E252427B8B7
          BAFFFFFFF6F6F6FBFBFBFDFDFDFDFDFDFEFEFEFCFCFCFEFEFEF8F8F8FFFFFFAC
          ACAD1110151D1C1F1E1D20111013020203030303020202000000000000000000
          2E2E309D9C9EF2F1F2FDFDFDF8F8F9FCFCFCFCFCFCFBFBFBFEFEFEF8F8F8FFFF
          FFBDBDBD1414181B1A1F1F1D2214131709090908080808080808080908080908
          080908070809090A0A0A0C17161A2C2B2E03030858585CEEEEEEFAFAFAFFFEFE
          BDBDBE1B1A1E18171B1415181F1E22BAB9BAFFFFFFF3F3F4FDFDFDFBFBFBFDFD
          FDFDFDFDFEFEFEFBFBFBFBFBFDF8F8F8F5F5F5FEFEFE7F7E800C0B0F20202310
          0F133F3E41ECECECFFFFFFE9EAEA3C3B40120F131F1E22201E234F4F525D5D60
          3C3B3E1C1C1E1111153A393C969596EDEDEEFFFFFFF9F9F9FCFCFCFDFDFDFDFD
          FDFBFBFBFDFDFDFCFCFCFDFDFDFBFBFBA1A0A227252A0403082323262524270C
          0B10100F143F3E40A0A0A1F8F8F7FCFCFBF8F8F8F6F7F7F8F8F8F1F1F25C5B5E
          0B0A101D1C1F1E1D2117161A19191C18171C1313170F0F100B0B0B0000012A28
          2DA7A6A8F6F6F6F8F8F8FAFAFAFDFDFDFBFBFBFDFDFDFDFDFDFEFEFEFFFFFFFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCFBFBFBFFFFFFEBEBEB5A595D08060B
          1A181D3A393DD6D6D6FCFCFCFAFAF9C0C0C01F1F201A1B1CC2C1C3FCFCFC6364
          66100F1319171C1F1E22CFD0D0FEFEFEFDFDFDF5F5F569696B000000656467F7
          F7F7F6F6F6F9F9F9FEFEFEF5F5F5FFFFFFD7D8D73E3E410F0E131A191E2D2E31
          7171748181837B7A7D7C7D7F7D7D7F7D7C7E7C7B7D7F7E807575783434371414
          181413172B292DC1C2C3FFFFFFF4F3F5FBFAFBF7F7F8FDFCFC8A8A8B1716191C
          1B1F111014999899FEFEFEFDFDFDFBFBFBFDFDFDFDFDFDFEFEFEFCFCFCFBFBFB
          FFFFFFF2F2F16665670B090E1C1A1F242529B8B8B9FFFFFFF6F6F6FBFBFBFDFD
          FDFDFDFDFEFEFEFCFCFCFFFFFFF7F7F7FFFFFFACABAD1111151B1A1E16151845
          45489393968B8A8B8F8E8F8A898C868587757578464547474649BBBBBCFDFDFD
          F8F8F9FBFBFBFCFCFCFBFBFBFEFEFEF7F7F7FFFFFFBCBABB1413171C1B1F1312
          174B4A4EB2B2B4ABABAEAFAEB0AFAEB1AFAEB1AFAEB0ABAAAEB2B2B58C8C8D26
          2428201E2208080D58585BECEDEDFCFCFCFDFCFCD2D2D422212516161916161A
          1B1B1EACADAEFEFEFEF2F2F2FDFEFDFCFCFCFCFCFCFEFEFEFDFDFDFCFCFCFDFD
          FEF7F7F7F8F8F7F6F6F66B6B6E09090D2121250E0D11464449EDEDEDFFFFFFEA
          E8E93D3C40101014141417353438C8C8C9EFEFEFD0D1D0A6A5A6413F43010202
          08080C6A696CE5E5E5FFFFFFF9F9F9FCFCFCFCFCFCFCFCFCFDFDFDFBFBFBFCFD
          FD9293950C0C0F1312152F2E311413160B0A0D3E3E418C8B8EDDDDDCFFFFFFF5
          F5F5F6F6F5FFFFFFF6F6F6FAFAFAF0EFF058575B0D0C101C1B201A191D9A9A9B
          B8B7B8B7B6B8B5B4B5B4B4B5B3B3B49E9FA068696C78787AE0E0E2FFFFFFF7F7
          F7FCFCFCFCFCFCFEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFBFBFBFAFAFAFEFEFED4D4D4323234111014151319545256E8E8E9F6F6F6
          F6F6F6EAEAEC545556000000A09FA2E5E6E639393C1614190C0B0F4E4E50E7E7
          E7FEFEFEFBFBFBFEFEFEA3A3A500000139393EC8C8C7FDFDFDF3F3F3FDFDFDF6
          F6F5FFFFFFD5D5D63A3B3D18171B0D0B0F49484DE5E6E6FFFFFFFCFBFCFDFEFD
          FEFFFEFEFEFEFDFCFDFFFFFFF0F0F059595C08070B1C1B1E27272AC2C2C2FFFF
          FFF3F4F4FAFAFAF8F8F9FDFDFD89898A1516181A191E100F1399989AFEFEFEFC
          FCFCFCFCFCFEFEFEFCFCFCFDFDFDFCFCFCFBFBFBFEFEFEF1F1F16666670A0A0C
          1B1B1F242528B8B8B8FFFFFFF5F6F5FBFBFBFDFDFDFDFDFDFEFEFEFDFDFDFEFE
          FEF7F7F7FFFFFFADACAE12111519191D0E0D12727373FFFFFFF8F8F8FFFFFFFF
          FFFFFCFDFCFFFFFFFBFBFCD2D1D3D4D3D5F9F9F9FDFDFDFBFBFBFDFDFDFBFBFB
          FDFDFDF8F8F8FFFFFFB8B7B81312161C1A1E0E0D11676669FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCE2E2D301A191D0C0A0F59595CED
          EEEDFFFFFFF8F8F8F1F1F232333615151818161A151518949394FEFEFEF1F1F2
          FEFEFEFCFCFCFBFBFBFDFDFDFCFCFCFBFBFBFEFEFEF4F4F4FAFBFBE2E2E2504E
          5209080D2625280A090D5B5B5DF1F2F2FFFFFFE9E9E93D3D4011111313141737
          3639CFCFD0FDFDFDF5F5F5FFFFFFC2C2C34141441515190605096E6D6EF1F1F1
          FDFDFDF9F9F9FDFDFDFCFCFCF8F8F8FFFFFFB4B5B60C0B101A1A1E2A292C0C0A
          0E1E1C207F7E81D8D8D8FFFFFFFAFAFAF0F1F1F9F8F9FCFCFCFCFCFCF7F7F7FA
          FAFAEDEDEE5656580E0C0F1D1C1F18161BE1E1E1FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFEEEFEFECEBECFEFEFEFAFAFAFDFDFDFDFDFDFDFDFDFEFE
          FEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFAFAFAFFFFFFB8
          B8B71211151D1C1F101013747375F7F7F8F4F3F4F2F2F2FCFCFC888889010000
          6C6C6DADAFAF2524271C191E05040988888AF9F9F9FDFDFDFAFAFAFEFEFECECE
          CD0F0E1416171A9F9FA0FFFFFFF1F1F2FCFCFCF7F7F6FFFFFFD5D5D63B3B3E18
          171B0F0E12464649DBDBDCFBFBFBF4F4F3F6F6F6F6F7F7F6F6F6F5F5F5FAFAF9
          E8E8E85655580C0A0D1B1A1D28262AC3C2C3FFFFFFF2F3F3F9F9F9F8F8F8FCFC
          FC8786881515171C1B1E0F0E11969698FDFDFDFDFDFDF9F9F9FAFAFAFDFDFDFE
          FEFEFCFCFCFBFBFBFFFFFFF1F1F26363650A0A0D1D1C20232226B6B6B7FFFFFF
          F6F6F6FBFBFBFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDF7F7F7FFFFFFABAAAC1110
          141A1A1D0F0E136E6C6FFAFAFAECECECF5F5F6F4F4F6F6F6F6F6F6F6F7F8F7FF
          FFFFFFFFFFFDFDFDFCFCFCFCFCFCFDFDFDFDFDFDFEFEFEF8F8F8FFFFFFB7B7B8
          1312161B1B1E0D0E11605F62FBFBFBE9E9EAF0F2F1F1F2F2F1F1F1F0F2F1EAEB
          EBF9F9FABCBDBD2B292E1B1B1F0A090E5A595CECECECFEFEFEF4F4F4FFFFFF5B
          5B5D0F0F141C1B1F0C0D106D6C6DFFFFFFF0F0F0FCFBFCFDFDFDFCFCFCFDFDFD
          FCFCFCFCFCFCFFFFFFF1F1F1FFFFFFC2C2C52D2C300B0B0F2B2A2D0403068282
          84FAFBFAFFFFFFE9E9E83A3A3D131215151417353436CCCBCDFAFAFAE3E3E3F5
          F5F5FAF9FA74737719171C1C1B1E18181CABAAABFDFEFDFAFAFAFCFCFCFBFBFB
          FAFAFAF8F9F8434346110F1329292B0B0A0F29292DAAAAACFCFDFCFCFCFCF1F1
          F1F4F4F4FEFEFEFCFBFCFAF9FAFEFEFEF6F6F6F9F9F9EDEEEE5656580E0D101D
          1C1F18181BC7C7C8F7F7F7F2F2F2F1F1F1F1F2F2F2F2F3F2F0F1F2F2F2FBFBFB
          FEFEFEFBFBFBFCFCFCFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFFFFFFFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFAFAFAFDFDFDFAFBFA898A8A0604092121231313169A
          999BFFFFFFF2F1F2F4F4F4FEFEFEADAEAE1312142B2B2E4F4E5122212419191D
          131216B8B8BAFFFFFFFBFBFBFAFAFAFFFFFFE1E1E139393D020203717073F5F5
          F4F6F6F7F7F7F7F6F6F7FFFFFFD4D3D338383B18171A101013434345DBDBDBFE
          FEFEF5F5F5F9F9F9F8F9F9F8F8F8F7F7F7FBFBFBE7E7E7504F520B0A0E1A191E
          272529C0C0C2FFFFFFF3F3F4F9F9F9F8F8F7FCFBFC8584861413171D1D210D0C
          0F949395FEFEFEFCFCFCFBFBFBF6F6F6F7F7F7FBFBFBFBFBFBF9F9F9FEFEFEED
          EEEF5E5E600B090E1D1D20212024B1B1B4FEFEFEF5F5F5F9F9F9FBFBFBFCFCFC
          FFFFFFFCFCFCFDFDFDF6F6F6FFFFFFA5A5A71111151C1C1F0F0E126A696CFFFF
          FFF1F1F1F9F9FAF9F9FBF9F9F9F8F8F8F3F3F3EFEFEFF6F6F5FCFCFCFDFDFDFB
          FBFBFCFCFCFCFCFCFEFEFEF7F7F7FFFFFFB2B2B31211151C1C1F0E0E10616063
          FEFEFEF5F5F5FCFCFBFDFDFDFCFCFCFCFCFDF5F5F6FFFFFFC2C2C329282D1B1B
          1E0A0A0E565558EAEAEAFFFFFFF5F5F5FEFEFEABA9AC0B0A0E2323270D0E1134
          3437DFDEE0F8F9F8F0EFF0FDFDFDFBFBFBFEFEFEFDFCFCFDFDFDF6F6F6F0F0F0
          FCFCFC8886890E0C1116151928272A0A0A0DB7B7B8FFFFFFFFFFFFE8E8E83636
          39131217141317353437CFCED0FFFFFFF4F4F4FAFAFAFBFBFB97969716151821
          2023100F136B6B6DF3F3F4FEFEFEF9F9F9FAFAFAFEFEFEDEDEDF2422271E1D20
          1313161B1A1E959596FFFFFFF0EFF0F3F3F3FDFDFDFEFEFEFAFAFAFAFAF9FDFD
          FDFDFDFDF5F5F5FBFBFBEAEBEB5353570D0E111D1B2017171AD1D1D1FFFFFFFE
          FEFEFBFCFCFDFDFDFDFDFDF9FAF9F5F5F4F4F4F4FAFAFAFCFCFDFDFDFDFDFDFD
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFB
          FBFFFFFFE9EAEA5151520C0A101C1B1F222025B9B9BBFEFEFEF2F2F2F6F6F6FF
          FFFED1D0D13A3A3D0B0B0F1C1B202B292D0C0B103B3A3DD9DADAFEFEFEFAFAFA
          FBFBFBFEFEFEF0F0F0646365000000414044C8C8C9FDFDFDF2F1F2F7F7F7FFFF
          FFD2D1D236353919191D101013444246DDDDDEFFFFFFFBFBFBFEFEFEFEFDFDFD
          FDFDFCFCFCFFFFFFECECEC4E4E510B0B101C1B20252427BEBDBFFFFFFFF2F3F3
          F8F9F8F9F9F9FBFBFB8282821412161F1F220C0D10939293FEFEFEFDFDFDFBFB
          FBFFFFFFFAFAFAF7F7F7F7F7F7F5F5F5FBFCFCE8E8E959585C0C0A0F1F1E2220
          1E22ACACAEFCFCFCF1F2F2F5F5F5F7F7F7F7F7F7F8F8F8FCFCFCFEFEFEF6F6F6
          FFFFFFA3A3A41211151D1D200F0E1368686BFEFEFEEFEFEFF9F9F8F9F9F9F8F8
          F8F7F7F7FAFAFBFFFFFFFFFFFEFBFBFAFCFCFCFCFCFCFCFCFCFBFBFBFDFDFDF7
          F7F7FFFFFFABABAC1212141C1B1E0E0D115D5C5FFFFFFFF6F6F6FAFAFAFCFCFC
          FCFCFCFBFBFCF5F5F5FEFEFEBEBEBF2726291D1C210C0C10515154E8E8E8FFFF
          FFF9F9F9FAFAFAF3F2F34140420C0B0F242326101014747477FDFCFDF6F6F6F4
          F4F4F6F6F6F7F7F7F8F7F7F5F6F6F0F0F1FFFFFFC7C7C831313409090C313034
          0A0B0D404043E6E6E6FFFFFFFFFFFFE7E6E8323236151317141316313135C7C6
          C7FCFCFCE9E9E9F6F6F6FFFFFF9B9B9C131216201F230F0E11565559EAE8EBFF
          FFFFF9F9F9F9F9F9FCFCFCE2E0E12525281D1C1F0E0D11302F32DCDADBF5F5F5
          E8E9E9FCFCFCF8F8F8F2F2F3F6F6F6FBFBFCD1D1D2D8D8D8F7F7F7FDFDFDE7E7
          E84F4E520D0D101E1E21161619C8C8C8FBFBFCF6F6F6F6F6F6F6F6F7F6F6F6F9
          F8F8FFFFFFFFFFFFFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFEFEFE
          FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCCDCDCD1C1B1E1718
          1B1010143A383DD0CFD1FEFEFEF3F3F3F7F7F7FDFDFCE4E3E45150530A080C1B
          1A1E2A282E010004676769F1F2F2FFFFFFFBFBFBFAFAFAFDFDFDFAFAFA818181
          0000001D1C21909092FDFDFEEFEEEFF6F6F6FEFEFEC8C8C92F2F3316161A0E0E
          113A393DD4D4D5FFFFFFFAFAF9FCFCFCFBFBFCFBFBFBFCFCFCFEFEFEE1E1E145
          46480B0A0F18181B1F1E21B6B5B7FEFEFEF3F3F3F7F8F7F9F9F9F6F7F778797A
          0F0D111F1D210A090C898A89FAFAFAFFFFFFDBDBDCCBCBCCF8F8F8FFFFFFFFFF
          FFFEFFFEFFFFFFF1F1F158575B06050A1E1C2119191CAEAEAEFFFFFFFDFDFDFF
          FFFFFFFFFFFFFFFFF8F8F8F4F5F4FBFBFBF7F7F7FEFEFE9797990E0C1019181C
          0B0A10616163FDFDFDF2F2F2F8F8F8F8F8F8F8F8F8FDFDFDFCFCFCE3E2E3E9E9
          EAFCFCFCFAFAFAFCFCFCFDFDFDFAFAFAFEFEFEF7F7F7FEFEFEA1A1A20F0F1219
          181C0A0B0E555555FAFAFAF5F5F5F9F9F9FCFCFCFCFCFCFAFAFAF6F6F6FEFEFE
          B3B3B52120241B1B1F0B0A0E49494BE0E0E1FEFEFEFAFAFAF9F9F9FFFFFFBDBC
          BD151418121115201F222525299C9A9CF6F6F6FEFEFEFFFFFEFBFBFBFCFCFCFD
          FDFDFFFFFFD4D5D54F4F510F10122B2A2E1E1E2208080BA8A7A9FDFDFDFDFDFD
          FEFEFEDFDEDF2A2A2E1513171011132C2C2FC6C5C5FDFDFDF2F1F1FFFFFFF3F4
          F46D6D7107060A2D2D2F0D0D12555458EAEAEAFFFFFFF9F9FAFAFAFAFCFCFCFA
          FBFA4443460E0D11201F23222124A7A7A7FFFFFFFCFCFBFBFBFBFAFAFAFBFBFA
          FFFFFFCCCBCC605E61B1B0B1FDFDFDFBFBFBDDDEDE4848490B090D1F1E210E0D
          10CCCCCDFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEC5C6C7F2F1F2FE
          FEFEF9F9F9FCFCFCFCFCFCFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFBFBFBFFFFFFA4A4A40B0A0F2E2E31100F135A595DEBEBEBFBFB
          FBF6F6F7F9F9F8F8F8F8F3F3F26D6C6F101014272528302D320B090EA0A1A2FD
          FEFDFDFDFDFBFBFBFAFAFAFCFCFCFDFDFDA1A1A20B090E1C1B1F545357EBEBEC
          F9F9F9EDEDEDFEFEFEC6C7C7313035211F2418181B3D3C40D8D7D8FEFEFEF8F8
          F9FCFCFBFDFDFDFDFDFDFAFAFAFEFEFEE5E4E545444818161B212124242226B6
          B6B8FEFEFEF4F4F4F8F8F8F8F9F9F7F7F77B7A7D1211172D2B2F0E0C1189898A
          FBFBFAFDFDFDDDDDDD49484C848386BBBABBC4C5C5C4C3C6CBCACCB9B8B94C4C
          4E171519262529212124909091D8D8D9D0D0D1D3D3D5D8D7D9E4E3E4FFFFFFFF
          FFFFFCFCFCF5F5F5FEFEFE939295141418242326151418616063FFFFFFFAFAFB
          FEFEFEFBFBFCF8F8F8ECEBEDA09EA1706F72CDCDCEFFFFFFF8F8F8FBFBFBFCFC
          FCFBFBFBFDFDFDF6F6F6FFFFFF9E9E9F17161A27252A17161A58585AFFFEFFF6
          F6F6FAFAFAFEFEFEFDFDFDFBFBFBF6F6F6FFFFFFB6B5B823232829282B17161A
          4C4C4FE7E7E6FEFEFEFAFAFAFCFCFCF9F9F9FFFFFF9C9B9D16161A0F0E111413
          18232226828184C9C8CBE8E7E9F2F2F3F0F0F1E0E0E1B0B0B2504F5318181B23
          222619181C02020679787CF4F4F5FDFDFDFAFAFAFFFFFFE8E8E82A282C252328
          1D1D21303032BBBBBDFBFBFCF0F1F1E6E6E79897992B2B2E2423272C2D2E0101
          04757577F7F7F6FDFDFDF9F9F9FDFDFDFAFAFAFFFFFFADACAD0A090D1312161B
          1B1E444447B7B5B7E6E5E6F3F3F4F5F5F6ECECEDCDCCCD53525527262AC5C4C5
          FCFDFCF9F9F9DFDEE04B4B4E1615192C2B3018161AB5B5B7EDEDEEEBEBECE9E9
          EAE3E3E4DADADBAEADAE5656597C7C7DF7F6F6F9F9F9F7F7F7FEFEFEFDFDFDFE
          FEFEFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEBEB
          464548100F141E1D20060509818184FEFEFFF3F3F4FBFBFBF7F7F6FCFCFDE6E6
          E554545509090C1E1E2227262A0706089A9B9BFCFCFCFDFDFDFAFAFAFBFBFBFD
          FDFDFDFDFD949495070709202023151417969597FCFCFCF2F2F2FFFFFFB3B3B5
          1D1C1F1D1D1F17181A242327C4C3C4FFFFFFF9F9FAFCFCFBFDFDFCFCFCFCFAFA
          FAFFFFFFDCDCDC23222519181D19191C1514169E9D9FFFFFFFF4F4F4F4F4F5FB
          FCFCF0EFF062616409090C2B2B2F0606096E6E70F5F5F7FAFAFBFDFDFC504F53
          09080A2525272C2C2E2B2B2E2D2C302A292C1E1E211C1A1E1C1C1E1B1A1D2C2B
          2D3A393B3737393B393C3F3E404B494B7B7A7BD5D6D5FFFFFFF8F8F8FFFFFF70
          70720D0D101D1D1F1615193231347B7B7C7879797A7A7B7777786E6E7159575A
          19181A38383BD8D8D9FEFEFEF7F7F7FCFCFDFBFBFBFCFCFCFBFBFBF7F7F7FAFA
          FA6464660605071313160706092B2A2DD4D4D6FCFCFCF5F5F5FDFDFDFDFDFDF8
          F8F8F8F8F8F8F8F88786880A0A0C1A1A1D0C0D0E1F1E21C1C1C2FFFFFFFBFBFB
          FCFCFCFCFCFCF9F9F9FEFEFEA7A7A839383A1210140403070403042D2C2E5251
          5364646562636448484B1C1C1E0604090F0E130F0D121D1C1F7F7D80EFEFF0FE
          FEFEFBFBFBFAFAFBFDFDFEBFBEBF0A090B161719100E1415141746454869696A
          5C5D5E4847491A181D0F0E111A1A1E010103333235C9C9C9FFFFFFF9F9F9FCFC
          FCFDFDFDFBFBFBFCFCFCFAFAFA8A898A16151909080C08070A201F2050515268
          68696A6A6B5656583231350404052A292CCAC9CAFCFDFCFEFEFDBABABB222126
          0606081615190F0E123131334B4A4C49494A4747494040413636381C1B1B0101
          05818083FFFFFFF3F3F3FAFAFAFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFF0F0F188888A010004141218030306313131
          C5C5C5FDFDFDF3F3F3FAFAFAF7F7F7FBFBFB94949612111309080B100F141615
          1B080809363639D1D1D2FFFFFFFBFBFBFAFAFAFFFFFFDCDBDD3C3C3E08070819
          191C00000226272AB2B2B4FFFFFFE9E9E9676769040405131316161719010003
          717073F0F0F0FEFEFEFBFBFBFCFCFDFBFBFBFCFCFCF7F7F78586870000001515
          190D0D11030303504D51E3E2E2FBFBFBEFEFF0FFFFFFB6B6B72425270403041B
          1A1E0B0B0C272829BDBDC0FCFCFDFFFFFFB1B1B20B0C0C020205030203020103
          0202030303050C0A0F0F0E130D0D110E0D100706080202030302040202030101
          030605070000004A4949D7D7D7FEFEFED7D6D728292C0404070F0F12100F130A
          090D000001020102010001000000000000010002000000515052E6E5E5FFFFFF
          F6F6F7FCFCFDFCFCFBFDFDFDF7F7F7FDFDFDCECECF3433361C1B1E2322251E1D
          201B1A1D868688FDFDFDF5F5F5FAFAFAFBFBFBF6F6F6FEFEFED3D3D44B4A4D18
          171828272A29282B141316777679F0F0F2FEFEFEF9F9F9FCFCFCF8F8F8FAFAFA
          FFFFFFD2D2D38787894D4E5028282A0C0B0C0201020000000000000000000909
          0C202023363739676668B4B3B5F8F8F8FFFFFFFAFAFAFCFCFCFDFDFDEEEEEE66
          65671A1A1A2525281F1F221C1B1F100F110A0A0B0707090405060C0B0E1C1A1E
          242428545355C1BFC2FDFDFDFBFBFBFBFBFBFDFDFDFBFBFBFCFCFCFBFBFBFCFC
          FCFAFAFAA7A8A9504F5127252A0A0B0C0000000000000000000000000B0B0E0A
          0A0B28272ABCBCBCFFFFFFF1F1F2797A7B1A1A1B1E1E1F222124232325151417
          100F11100F100E0D0F0E0D0E0E0E0F0F0F112223239F9FA1FEFEFEF3F3F4FBFB
          FBFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDDDDDE9393958686888C8B8D8B8B8DC3C3C2FAFAF9F9F9FAFBFBFBF8F8F8
          FDFDFDF1F1F1A3A3A67E7E808F8E8F8C8B8E8C8B8E908F917B7B7DCBCBCCFCFC
          FCFCFCFCFBFBFBFEFEFED5D6D7807F818E8D908E8C8F8C8B8C7F7D7FADADADFB
          FBFBDFE1E09092918586878C8C8F929293848284949496E5E5E5FEFEFEFBFBFB
          FCFCFCFCFCFCFFFFFFEEEEEE9494978485868E8F908C8C8E8787888A898CD2D2
          D3FEFEFEF8F8F8FAFAFAB8B7B88181838B8A8D8C8C8E8F91917E7E7FB9B9BBFA
          FAFAFFFFFFEDEDED9190938F8F919492939391939592959293948D8C8F8C8A8D
          8B8C8E8C8B8D8F9090929393939294929393908F929594968B8C8C7D7D7ECDCD
          CFFFFFFFC4C3C484848689898C8D8C8E8C8C8D8B8B8C8787898484868382847E
          7E807F7F808383847A7A7BA9A7AAF3F2F3FDFEFDFAF9F9FCFCFCFDFDFCFCFCFC
          F9F9F9FEFEFED6D5D6B1B0B1B7B6B9BAB8BAB9B8BAB1B1B2BFBFBFF6F6F6FCFC
          FCF9F9F9FBFBFBFAFAFAFDFDFDDDDDDFB2B2B3B5B4B5B9B8B9BCBBBDB1B1B3BA
          B9BAEDEDEEFEFEFEFBFBFBFAFAFAFDFDFDF9F9F9F8F8F8FFFFFFFAFAFADCDDDE
          C1C1C3A7A5A78D8D8F8080817F7D7F87868897989BAFB0B1CCCCCDEEEEEEFFFF
          FFFBFCFCF7F7F7FDFDFDFDFDFDFEFEFDECECECB2B2B2B6B6B8B9B9B9B6B6B6B3
          B1B3B0AFB0A9A8A9A1A0A39D9D9E9C9C9DA5A3A6BDBCBEE8E7E8FFFFFFFCFCFC
          FAFAFAFDFDFDFCFCFCFCFCFCFBFBFBFCFCFCF9F9F9FCFCFCFFFFFFE2E2E2BCBB
          BD9E9E9F8686887D7D807E7E818686899696989191929D9D9EE0E0E1FFFFFFED
          EDEEBCBCBEB2B2B2B8B8B9B8B8B8B7B7B8BBBABCBBBABCB8B7B8B5B5B6B5B4B5
          B4B3B4AEAEAFAFAFB0DEDEDFFEFEFEF8F8FAFCFCFCFCFCFCFEFEFEFDFDFDFEFE
          FEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F2F2F3FCFCFDF8
          F8F8FDFDFDFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCF8F8F8F4F4F5F9F9F9
          FAFAFAFAFAFAFAFAF9FBFBFBF6F6F6F6F6F7FCFCFCFCFCFCFCFCFCFDFDFDF7F8
          F8F6F6F6FAFAFBF9F9FAFBFBFBF9F8F9F3F3F2F9F9F9F8F8F8F4F5F4FAFAFAFA
          FAFAFAFBFAFAFAFAF4F5F5F8F8F8FCFCFCFCFCFCFBFBFBFCFCFCFDFDFDF9F9F9
          F3F3F3FBFAFBF9FAF9FAFAFAFAFAFAF5F6F6F4F5F5FBFBFBFDFDFDFAFAFAF3F3
          F3F7F7F7FAFAFBF9F9F9FBFBFAF6F5F7F5F5F4FBFBFBFBFBFBFEFEFEFAFAFBFA
          FAFAFBFBFBFCFBFBFCFBFCFBFCFBFAFAFAFAFAFAFAFAFBFAFAFBFBFBFBFBFBFC
          FCFBFCFCFCFCFCFBFCFCFCFCFFFFFFF7F7F7F6F6F7FDFDFDF1F1F1F7F7F7FBFB
          FBFBFAFAFAFAFAFBFBFBFCFCFDFCFCFCFBFCFCFAFAFAF8F9F9F8F8F8F4F4F5F9
          F8F9FDFDFDFCFCFCFDFCFCFDFDFDFDFDFDFBFBFBFCFCFCFDFDFDFCFBFCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFDFDFDFDFDFDFCFCFCFEFEFDFCFC
          FCFCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFDFDFCFCFCFC
          FCFCFDFDFDFCFCFCF9F9F9F7F7F7FBFBFBFFFFFFFFFFFFFFFFFFFBFBFCF9F9F9
          F8F8F8F9F9F9FBFBFBFFFFFFFFFFFFFEFEFEF9F9F9F8F8F8FCFCFCFCFCFCFDFD
          FDFCFCFCFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFFFFFFFFFFFFFFFFFAFAFAFBFBFBFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFDFDFDFDFDFDF9F9F9F9F9F9FFFFFFFFFFFFFDFDFDF9F9FAF8F8F9F9F9
          F9FAFAFBFBFBFBFBFBFBFDFDFDFEFEFEFDFDFDFBFBFCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFCFCFDFDFDFDFDFDFCFCFCFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFDFDFDFBFBFBF9F9F9FAFAFAFC
          FCFCFCFCFCFDFDFDFBFBFBFCFCFCFEFEFEFDFDFDFCFCFCFDFDFDFDFDFDFDFDFD
          FEFEFEFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFEFEFEFDFDFDFDFDFDFDFEFDFCFC
          FCFDFDFDFFFFFFFBFBFBFEFEFEFFFFFFFCFCFCFDFDFDFDFCFDFCFCFCFFFFFFFD
          FDFDFCFCFCFCFCFCFCFCFCFDFDFDFCFCFCFDFDFDFFFFFEFCFCFCFEFEFEFDFDFD
          FCFCFCFEFEFEFFFFFFFCFCFCFCFCFCFCFCFCFFFFFFFEFDFEFCFCFCFDFDFDFCFC
          FCFEFEFEFFFFFEFDFDFDFCFCFCFDFDFDFDFDFCFDFDFDFDFDFDFCFCFCFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFDFDFD
          FBFBFBFEFEFDFEFEFEFCFCFCFEFEFEFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFEFDFDFDFDFDFEFEFEFEFEFEFDFDFDFDFDFDFCFCFCFBFBFBFCFCFCFD
          FDFDFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF9F9F9F8F8F8FAFAFAF8F9F8F9F9F9
          FBFBFCFDFDFDFBFBFBFDFDFDFCFCFCFCFCFCFCFCFCFDFDFCFAFAFAF8F8F8FAFA
          FAFAFAFAF8F8F8FAFAFAFCFCFDFCFCFCFBFBFBFCFCFCFCFCFCFDFDFDFDFDFDFC
          FCFCFAFAFAF8F8F8F9F9F9FAFAFAFCFDFCFEFEFEFDFDFDFCFCFCFCFCFCFAFAFA
          F7F7F7F7F7F7FAFAFAFEFEFEFDFDFDFBFBFBFCFCFCFDFDFDFCFCFCFAFAFAF9F9
          F9F9F9F9FAFAF9FAFAFAF9F9F9F9F9F9FBFCFBFAFAFAFAFAFBFBFBFBF8F8F8F7
          F7F7FBFBFBFCFCFCFBFBFBFCFCFCFDFDFDFDFDFDFDFDFDFEFEFEFCFCFCFCFCFC
          F9F9F9F8F8F8F9F9F9FAFAFAFEFEFEFDFDFDFDFDFEFEFEFCFCFCFDFBFBFBFBFB
          FBFBFBFBFCFCFCFDFDFDFAFAFAF9F9F9FAFAFAF9F9F9FAFAFAF9F9F9F9F9F9F9
          F9F9FAFAF9F9F9F9FAFAFAF9F9F9FAFAF9FBFBFBFBFBFBFCFCFCFDFDFDFCFCFC
          FEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
          FCFBFBFBFAFAFAFBFBFBFBFBFBFBFBFBFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFD
          FDFDFBFBFBFBFBFBFCFCFCFBFBFBFBFBFBFCFCFCF9F9FAFBFBFBFDFDFDFDFDFD
          FDFDFDFEFEFEFCFCFCF9F9F9FCFCFCFCFCFCFBFBFBF9F9F9FBFBFBFDFDFDFCFC
          FCFAFAFAFBFBFBFCFBFCFCFBFCFBFBFBFAFAFAFCFCFCFDFDFDFCFCFCFEFEFEFD
          FDFDFDFDFDFCFCFCFAFAFAFCFCFCFBFBFBFCFCFCFBFBFBFAFAFAFCFCFCFDFDFD
          FCFCFCFDFDFDFBFBFBFAF9FAFBFBFBFBFBFBFBFBFBFAFAFAFBFBFBFDFDFDFDFD
          FDFCFCFCFBFBFBFBFBFBFCFCFCFBFBFBFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFBFBFBFCFCFCFAFAFAFCFCFCFDFDFD
          FCFCFCFBFBFBFAFAFAFCFCFCFCFCFCFCFCFCFCFBFBFBFCFCFAFBFBFAFAFAFBFB
          FBFBFBFBF9F9F9FBFBFBFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFCFCFCFBFBFBFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFD
          FDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFEFEFEFDFDFDFBFBFBFB
          FBFBFAFAFAFBFBFBFAFAFAF9F9F9FBFBFBFCFCFCFBFBFBFDFDFDFEFEFEFDFDFD
          FCFCFCFDFDFDFDFDFDFCFCFCFCFCFCFBFBFCFBFBFCFCFCFCFBFBFCFCFCFCFCFC
          FCFBFBFBFCFCFCFAFAFAFAFAFAFCFCFCFCFCFCFEFEFEFDFDFDFCFCFCFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFEFEFEFDFDFDFCFCFCFAFAFB
          FBFBFBFAFAFAFAFAFBFBFBFBFBFBFCFAFAFAFBFBFBFDFDFDFCFCFCFDFDFDFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFDFDFDFDFDFDFDFDFDFCFCFCFEFEFEFDFDFDFEFEFEFFFFFF
          FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFEFEFEFE
          FEFEFEFEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFDFDFDFCFCFCFDFDFDFDFDFD
          FDFDFDFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFEFE
          FEFEFEFEFCFCFCFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFEFEFEFD
          FDFDFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFDFDFD
          FEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFEFEFEFDFDFEFEFEFEFEFEFDFDFDFDFDFDFEFE
          FEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFEFEFD
          FDFDFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFDFDFD
          FEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFCFCFCFBFBFBFCFCFCFDFDFDFCFCFCFDFDFDFEFEFEFCFCFCFEFEFEFEFEFEFD
          FDFDFDFDFDFEFEFEFDFDFDFCFCFCFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFDFDFD
          FCFCFCFCFCFCFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFDFDFDFEFEFEFDFDFDFCFCFCFCFCFCFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFF
          FFFFFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFD
          FDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFEFEFE
          FDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFE
          FEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFEFEFE
          FDFDFDFCFCFCFDFDFDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FEFDFDFDFEFEFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFEFEFEFDFDFDFCFCFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFEFEFEFDFDFDFCFCFCFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFD
          FDFDFDFDFDFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFF
          FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFFFF
          FFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFFFFFEFE
          FEFEFFFFFEFFFFFFFEFEFFFFFFFEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFEFEFE
          FEFEFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFEFEFEFEFEFFFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE
          FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFF
          FFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFEFEFDFDFDFEFDFDFDFEFEFDFD
          FDFEFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFDFDFD
          FDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFEFE
          FEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFD
          FDFDFDFDFCFCFDFDFDFCFDFDFDFDFDFDFEFEFDFDFDFEFEFEFEFDFDFDFDFDFCFD
          FDFEFCFCFDFDFDFDFDFDFEFDFDFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFEFEFDFDFDFDFDFEFDFDFDFEFEFCFDFD
          FDFCFCFDFBFBFCFBFBFDFBFBFDFCFCFDFEFEFDFEFEFDFDFDFDFDFDFDFDFDFEFE
          FEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFFFEFEFEFEFEFEFEFEFE
          FEFEFEFDFDFEFDFDFDFEFEFDFEFEFEFDFDFEFEFEFEFEFEFFFDFDFEFEFEFEFEFE
          FEFEFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDFEFEFEFEFEFFFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFF
          FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFD
          FDFDFCFEFEFDFBFBFCFDFDFCFDFDFDFCFCFCFCFCFBFAFAFAFDFDFCFFFFFDFBFB
          FCF9F9FBFBFBFBFCFCFCFCFBFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFEFDFDFDFE
          FEFEFEFEFEFFFFFDFEFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFF
          FFFEFEFEFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFEFDFEFDFEFDFEFFFDFDFEFEFEFEFDFDFEFDFDFDFEFEFEFDFDFDFEFE
          FDFEFEFEFEFEFDFEFEFEFEFEFDFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFEFD
          FDFEFEFEFDFEFEFEFEFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFEFEFEFCFCFDFEFEFEFCFCFDFDFDFC
          FCFCFCFAFAFBFCFCFCEBE9FBDBDAF8EDEDFAFFFFFCFFFFFCFBFBFBFAFAFAFAFA
          FCFCFCFCFDFDFBFDFDFDFEFEFDFDFDFEFEFEFEFDFDFEFDFDFEFFFFFEFDFDFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFFFFFEFEFEFFFEFEFEFFFFFFFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFFFFFFFEFEFE
          FEFEFEFFFFFFFEFEFEFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFE
          FEFDFDFDFEFDFDFDFDFDFDFCFCFDFCFCFDFEFEFDFEFEFEFEFDFEFFFFFDFEFEFE
          FFFFFDFEFEFEFEFFFDFDFDFEFDFDFDFEFEFCFDFDFDFEFEFDFEFEFDFEFEFDFEFE
          FCFEFEFDFDFDFDFEFEFDFDFDFDFDFDFCFFFFFDFEFEFFFEFEFEFEFEFDFCFCFEFD
          FDFDFDFDFDFDFDFEFFFFFDFDFDFEFEFEFEFEFEFEFEFEFFFEFEFEFEFEFFFFFFFF
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFFFEFEFDFCFCFCFDFDFEFEFEFDFCFCFDFCFCFCFAFAFCFCFCFDF6F6FC
          BDBAF69892F2BBB9F6EFEFFBFFFFFDFFFFFCFBFCFDFAFBFCFBFBFAFBFBFBFDFD
          FCFEFEFDFDFDFDFCFCFDFCFCFDFDFDFDFCFCFDFDFDFCFCFCFDFDFDFDFDFDFDFD
          FDFEFEFEFDFEFEFDFDFDFEFDFDFEFEFEFEFEFEFFFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFDFDFFFDFDFEFEFEFDFDFDFDFDFDFEFEFEFDFDFDFEFDFD
          FDFDFDFDFCFCFDFDFDFCFDFDFDFDFDFDFCFCFDFDFDFCFDFDFDFCFCFDFEFEFCFD
          FDFEFDFDFDFEFEFDFDFDFDFDFCFDFEFEFDFDFCFDFCFCFCFCFCFCFCFCFCFBFBFB
          FBFBFCFCFCFBFBFBFBFCFCFCFCFCFBFCFCFCFCFCFDFCFCFCFBFBFBFCFCFCFBFB
          FBFBFBFBFDFDFCFCFCFDFCFCFDFEFEFDFDFDFDFDFDFCFCFCFDFCFCFDFDFDFCFC
          FCFDFDFDFDFCFCFDFDFDFEFDFDFDFDFDFEFEFEFFFDFDFEFEFEFEFEFEFFFEFEFE
          FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFEFDFDFEFDFDFDFE
          FEFDFCFCFDFCFCFCFDFDFDFDFDFDFBFAFCFAFAFBFFFFFDC3C1F8635CEE6B65EF
          B4B2F6F0EFFCFFFFFDFFFFFDFCFCFCF9F9FBF9F9FBFBFBFCFBFBFBFCFCFCFDFD
          FDFCFCFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFDFCFCFDFDFDFDFD
          FDFFFDFDFDFFFFFEFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFE
          FDFDFDFCFCFDFDFDFDFCFCFCFDFDFDFCFCFDFCFCFCFCFCFCFCFCFCFCFCFCFDFD
          FCFDFDFDFCFCFDFDFDFCFEFEFCFDFDFDFDFDFDFEFEFDFCFCFCFCFCFCFBFAFBF9
          FAFBFAF9FCFBF9FCFBFAFCFAFBFCFCFBFCFCFCFBFDFDFDFEFEFDFFFFFBFFFFFD
          FFFFFDFFFFFDFFFFFEFFFFFDFFFFFDFEFFFCFEFEFCFDFDFDFBFBFCFCFCFBFAFA
          FBFAFAFCFDFDFBFCFCFBFDFDFDFCFCFCFCFCFDFDFDFDFDFDFCFDFDFEFDFDFDFE
          FEFDFEFEFDFDFDFEFDFDFDFDFDFDFDFDFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFDFCFCFDFDFDFDFCFCFCFB
          FBFCFDFDFBFBFBFCF4F4FCFFFFFDEDEBFB7470F0261FE9534FEDA9A6F3E7E6FA
          FFFFFDFFFFFDFFFFFCFAFAFDF9F9FCFAFAFAFBFBFCFCFCFDFDFDFDFDFDFDFEFE
          FDFDFDFDFCFCFDFDFDFCFCFCFCFCFCFCFCFCFDFCFCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFDFCFCFDFCFCFCFCFCFCFDFDFC
          FCFCFCFDFDFCFDFDFDFDFDFDFEFEFDFDFDFDFDFDFDFDFDFDFDFDFCFDFCFDFBFB
          FCFBFBFBFAFAFCF9F9FBFAFAFBFCFBFBFCFCFBFCFDFBFFFFFCFFFFFDFFFFFDFF
          FFFDFFFFFDFFFFFCFDFDFCFAFAFDF8F8FCF5F5FCF1F1FBF0EFFCEFEFFCF1F1FC
          F5F5FCF9F9FDFBFBFCFEFEFDFFFFFDFFFFFCFFFFFBFCFCFCFBFBFBFBFBFBFBFB
          FBFBFBFCFDFDFDFEFEFCFCFCFDFDFDFDFCFCFCFDFDFEFDFDFDFDFDFDFEFEFEFE
          FEFEFEFEFDFFFFFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFEFEFEFDFDFDFDFDFEFEFEFDFCFCFEFCFCFDFDFDFCFDFDFCFDFDFDFEFEFDF2
          F2FBF6F5FBFFFFFDBBB8F73731EB0902E83F40EB908DF3D1CFF8F7F6FCFFFFFD
          FFFFFDFFFFFCFBFBFBF9F9FCF9F9FCFBFBFBFAFAFCFBFBFDFEFEFDFDFDFDFDFD
          FDFEFEFDFDFDFDFDFDFDFEFEFDFDFDFEFEFEFEFEFEFEFEFEFDFEFEFEFEFEFEFE
          FEFDFEFEFDFDFDFEFDFDFDFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFD
          FAFAFDFAFAFBF9F9FCF9F9FBF9F9FAFBF9FBFCFCFDFEFEFCFFFFFCFFFFFDFFFF
          FCFFFFFCFCFCFCFAFAFCF4F3FAE7E7FAD7D7F9C3C2F7B1ADF4A19DF5948FF386
          82F17973F06D69EF6761EF655FEF645EEF6762EF6F6AEF7C77F08E8BF19F9CF3
          B7B4F7D4D3F9EEEDFCFCFCFBFFFFFCFFFFFCFBFBFCFAFAFDFAF9FBFCFCFCFDFD
          FDFBFBFCFCFCFDFCFCFDFCFCFCFCFCFEFCFCFEFEFEFDFEFEFEFDFDFDFEFEFEFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFEFEFEFDFDFD
          FEFDFDFDFDFDFDFDFDFDFCFCFEFBFBFDFBFBFDFEFEFDF7F6FBEFEFFAFFFFFCF4
          F3FB8A86F21C1BEA0000E62926E96F6BF0ACA8F6DFDDFAF6F6FCFFFFFCFFFFFD
          FFFFFCFCFCFBFAF9FBF9F8FCF7F7FCF9F9FBF9F9FCFAFAFCFBFBFCFBFBFDFBFA
          FCFCFCFDFCFCFDFCFCFDFDFDFCFDFDFDFCFCFDFBFBFCFBFBFCFBFBFDFAFAFCF9
          F9FCFAFAFCF9F9FBF7F7FCF8F8FBF9F9FBF9F9FCFBFAFCFDFDFBFFFFFCFFFFFC
          FFFFFCFFFFFDFDFDFDF7F7FCF2F2FCE5E3FBD2CFF8B7B4F59C98F3847FF16D67
          EF534DED3D37EC2C25EA2018E9160EE91006E90C04E70C03E80B02E90C04E90D
          04E80E03E90D04E80C03E80D04E80E06E7160EE9231BEA3B34ED5F5AF08E8AF3
          C0BEF6ECEAFBFFFFFDFFFFFDFBFAFCF9F8FDFBFBFBFCFCFCFDFDFDFDFDFCFDFD
          FDFDFDFDFDFDFDFDFDFCFDFDFDFDFDFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFFFFFFFEFEFEFEFDFDFEFDFDFDFEFEFDFEFEFDFDFDFCFCFC
          FDFDFDFBFDFDFDFBFBFCFDFDFCFDFDFCF0F0FBF7F7FCFFFFFCD3D0F86D67EF17
          16E90000E50F0AE84340EC7C77F1AEAAF6D9D7FAEDEDFAF9F9FCFFFFFCFFFFFD
          FFFFFCFFFFFCFDFDFDFAFAFCFAF9FDF9F9FDF9F8FDF9F9FDF9F9FCF9F9FBF9F9
          FDFAFAFBF9F9FCFAFAFDF9F9FCF9F9FDF9F9FCFCFCFCFEFEFCFFFFFCFFFFFEFF
          FFFDFFFFFCFFFFFDFEFEFDF6F6FBF0F0FAE5E4FAD3D2F9BBB8F79E9AF3817CF2
          6862F04D47EE352EEA241CE91810E90E06E80D03E81006E9130BE81A12E92017
          EB241DEA2821EB2A22EA2A22EA2A22EB2A22EA2821EA2720EB2921EA2921EB28
          21EA2720EA241CEB1D16EB150DEB0E06E9130BE72E26EA5E57EFA19DF4DDDDF9
          FDFDFCFFFFFDF9F8FCF9F9FCFCFCFBFEFEFDFCFCFDFDFDFDFDFDFCFDFDFDFDFD
          FDFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFF
          FEFEFEFDFDFFFEFEFEFDFDFEFDFDFEFDFDFDFEFEFDFCFCFCFCFCFDFCFCFCFBFB
          FDFDFDFCFEFEFDF6F5FCF2F2FBFFFFFDF5F4FCBCB8F76761EE1E1AE70000E700
          00E61B17E9423EEC6C68EF9692F2B9B5F7D2CFF9E2E1FAEDECFBF5F5FCFDFDFD
          FFFFFCFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
          FDFFFFFEFFFFFCFBFBFCF5F4FBEFEEFBE7E6FBDCDAFACBC9F8B8B6F69D9CF481
          7DF26861F0504AED3932EB251EEA1910E91209E80E05E80F08EA170FE91E16EB
          241CEB2A22EA2A22EC281FEA231AEA1E16EA1910EA140BE81209E91108E81209
          E81309E9140BE8160DE8150DE9140BE9130AE81109E81209E9120BE9180FEA1F
          16EB231CE92119E9180EEA130AE91D16E94B45ED9A97F4E2E1F9FFFFFDFCFCFB
          F7F7FBFBFBFCFCFCFCFCFCFCFCFCFDFCFCFCFDFDFDFDFDFDFCFCFCFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFEFEFEFFFFFEFDFDFF
          FDFDFDFEFEFEFDFDFEFDFDFEFCFCFCFCFCFDFDFDFDFCFCFCFCFCFDFDFDFCFBFB
          FDF2F1FBF9F9FBFFFFFCE9E9FBB7B2F57068EF332BEB0C09E90000E70300E714
          0EE82921EA4139EC5851EF6D68F0847FF19793F3A6A3F3B1AEF6B9B7F6C1BFF6
          C3C1F9C6C5F8C6C5F7C6C3F8C2C0F7BAB7F7B2B0F5A9A6F49C99F28B87F17A76
          F06761EF544EED443CED332BEA231CEA1911E9130AE81108E91209E9170EE81D
          15E9251DEB2821EA2B24EB2821EB231BEA1C14E9150CE71107E81208E9170DE8
          1F17E92B25EB3B35EA4C46EC5C55EE6A64EF7671F07F7AF18783F18C87F18E89
          F28B86F2847EF17A75F26B67F15852EF433CED2E26E91B13E8110AE8150CEA17
          10E9160DEA1007E91D15EA5951EEBAB6F6F9F8FBFEFEFBF5F5FBFBFBFCFCFCFC
          FCFCFCFCFCFDFCFCFCFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFDFDFD
          FDFDFDFEFEFEFCFCFCFDFDFCFCFCFCFBFBFCFEFEFCFCFCFBF6F6FBF5F5FCFCFC
          FEFFFFFDEAE9FAC2BFF78680F3534EEE2920EB0F07E80400E60500E60A01E711
          08E8180EE81C14E9231BE92A20EA2E26E9312AEA322BEB342EEB322CEA312AEB
          2E27EB2820E9241CE91F17E81810E8170DE9130CE8130BE8130CE9140DEA1911
          EA1F17EA251BEB291FEA2A22EB2921EB251CEB1E16EA1810E9120BE80F07E814
          0CE81D15E93027EB453FED615AF07A74F2908BF4A7A5F4BEBCF7D1D0F8DFDEFA
          E8E7FBEFEEFCF5F5FDFAFAFDFFFFFDFFFFFEFFFFFEFFFFFEFFFFFDFFFFFEFBFB
          FCF5F5FCEBEBFDD6D5F8B5B3F58C88F25F59EF352DEB1D15EA1109E80C03E809
          01E92C25EB918CF3EEEEFAFFFFFCF5F4FBFAFBFCFDFDFCFDFDFCFCFCFDFCFCFC
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFFFEFEFFFFFFFFFEFEFEFEFEFFFDFDFDFDFDFDFEFEFEFDFDFDFDFDFEFCFCFD
          FCFCFCFDFDFDFCFCFCFCFCFDFEFEFCFCFCFDF6F6FBF5F6FBFCFBFDFFFFFDF4F4
          FDD8D8FAA9A6F57F79F2534EED322AEA1E15EA130AE91007E71008E81209E914
          0BE8170EE8160EE9170FEA1810E91911E91912EB1A13EA1E16EA1F17EA2119E9
          231BEB251DEB261EEB271FEB271FEB241DEA2118EA1D14E9190FE8140AE81007
          E8120AE81C13E92A23EB3E38EB5A54ED7671F0928DF1ABA7F5C3C2F8DAD9F9EA
          E8FCF2F1FCFAF9FDFFFFFDFFFFFEFFFFFEFFFFFFFFFFFDFAFBFDF3F3FCE8E7FC
          DEDCFAD5D4FACCCAF9C5C3F9C1BFF8C0BEF7C1BEF8C8C7F7D0CFF9DDDCFAEDED
          FBF9F9FCF4F4FCDDDCF9A4A2F56B66F03731EB1610E90300E80E0AE86D69EFE5
          E3FAFFFFFDF5F5FBFBFBFCFDFDFCFBFBFCFCFCFDFCFCFCFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFE
          FEFEFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFDFDFEFEFEFEFDFDFDFCFCFEFCFCFD
          FCFCFDFCFCFCFEFEFDFAFBFBF6F5FBF5F4FCFAFAFBFFFFFDFFFFFCF3F2FCD7D6
          F9B3B0F6928EF26F6AEF504AED3A32EB2B22EB1F18E91A10EA160EE9150EE816
          0EE9170FE81710E9180FE9180FE9160FE9150CE9150BE9130CE8130AE9120AEA
          150CE91A11E9231AE92F27EB413AEB5651ED706CEF8C88F3A5A3F4BCBAF6D1D0
          F8E7E6F9F3F3FBFAF9FDFFFEFDFFFFFCFFFFFDFFFFFEFFFFFCFCFBFDF2F1FCE3
          E2FBCBCAF7B2AEF69C98F48683F1726EF0605AEF5049ED433CEB3B33EC332CEC
          2F28EB2E27EA2D24EB2D26EB2F28EB3730EC4740EC5D57EF7A75F29E9BF4BDBB
          F7CDCCF9B2B0F57D78F0463FED140FE90000E55551EDDEDBFAFFFFFCF5F5FBFB
          FBFCFCFCFCFCFCFCFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFD
          FDFDFEFEFDFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFEFCFCFDFEFEFC
          FEFFFDFBFBFCF6F6FAF3F3FAF4F4FBFCFCFCFFFFFCFFFFFDFEFEFDEFEEFCDAD9
          F9C4C2F8AEACF69995F3847FF2736DF0645FF05953EF514BEE4E48EE4B43EC4B
          44EC4D47EE5049EF5952F0615DF06F6AF07E7AF2908BF3A29FF5B3B0F6C2C1F7
          D3D1F9E2E1F9F1F0FAF8F9FCFAFAFCFFFFFCFFFFFDFFFFFDFFFFFEFFFFFDFFFF
          FEF6F6FBECEAFAD9D7F8B8B7F69692F47772F15852EE3D37EB2B24EB1D16EA15
          0CE81008E80F06E91007E80F06E70F07E90F07E90F06E91008E91209E8130BEA
          140BEA110AE90E06E80C03E90D04E71109E8251DE94841EC746EF1908AF38D88
          F26C67EF322EEA0100E74C44EDDDDBF9FFFFFDF7F6FBFCFCFCFBFBFCFCFCFCFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFFFEFEFEFEFEFFFEFEFEFDFDFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFCFCFDFCFCFDFBFCFDFDFDFCFDFDFB
          F4F3FBECEBFAEDEEF9F0F0FAF1F1FBF6F6FCFCFCFCFEFFFBFFFFFDFFFFFCFAFA
          FBF2F2FCECECFBE6E4FBE1E0FBDFDDF9DBD8F9DBD9F9DDDBF9DEDDFAE2E2FBE7
          E7FBEDEDFBF4F3FBFAFAFCFCFBFDFDFDFEFFFFFCFFFFFDFFFFFEFFFFFDFFFFFD
          FFFFFDFFFFFCF7F6FCEBE9FBDDDCFBC9C7F9A9A6F58682F16761EE4740EC2B24
          EA1A13E91109E90F06E81109E9150DE91810EA1B12EA1D15EA2018EB241CEA27
          21EB2C26EC312AEB342BED332DEC342DEB332BEC3129EB2F27EB2C25EB2920EB
          261EEB1F18EA170EE90F07E7130AE82A22EA4F4AED6C67EF6E69EF433DEC0500
          E8514BEDE6E5FAFEFDFCF8F8FBFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
          FFFEFEFEFEFEFEFFFFFFFEFEFEFDFDFEFEFEFFFDFDFEFDFDFEFDFDFDFDFDFDFD
          FDFDFEFEFEFDFDFDFBFBFCFCFCFDFBFBFDF9F8FBFFFFFDFFFFFDFCFDFDFCFCFC
          FAFAFCF7F7FCF5F4FBF4F3FCF4F3FCF6F6FBF9F9FCF9F9FDFBFCFDFFFFFDFFFF
          FCFFFFFCFFFFFDFFFFFDFFFFFDFFFFFEFFFFFDFFFFFEFFFFFDFFFFFDFFFFFDFF
          FFFCFFFFFDFFFFFCF5F6FCEAE9FBDFDDF9D0CEF8BDBBF6A19FF4837FF26861EF
          4D48EE352EEB2018EA150CE80F06E80E06E8130BE81912EA1F17EC221AEB231C
          EB231CEB261EEC2922EB2D26EC3129EB3028EB2D26EB261EEB1E15EA170EE911
          0AE90D04E90B02E80B01E80D04E71007E71108E9160DE8160DE8160EE8130BE9
          0B01E70000E80000E8130EE9372FEC5651ED463FEC0801E8625DEEEEEEFBFDFD
          FCF9F9FBFCFCFCFCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
          FFFEFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFCFCFCFBFBFBFB
          FBFCFEFEFDDCDBF99F9CF5B1AEF7DAD8F9D5D4F9DDDCFBEBEAFCEFEFFBF5F5FC
          F9FAFCFBFCFCFEFFFDFFFFFCFFFFFDFFFFFDFFFFFCFEFEFDFCFDFCF9F9FCF4F5
          FCEFEFFBE9E8FAE0DFFAD9D8F9D0CFF8C5C3F7B8B6F6A7A4F4938EF27B77F266
          60EF524BED3C36EB2B24E91E16EA150CE90F07E80E06E71208E7180FE91D15EA
          2118EA231BEA241DEB221CEB241CEC2620EB2B25EC2F27EC2B24EB241DE91B12
          E81108E90901E80900E80E05E81911E8271EE9372FEB4842EC5954ED6762F071
          6DF07974F2807BF1827FF17F7BF17974EF706BF0655FEF514AED3631EB1913E9
          0300E70503E82720E9312AEB150EE88984F2F5F5FBFCFCFBFAFAFBFDFDFCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFEFEFFFFFFFFFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFDFCFCFCFAFAFBFAFAFBFEFEFCEAEAFB8C87F32B
          22EA2924EA524CEE544DEE5551EE6661EF726DF07974F07F7BF18480F28884F2
          8A85F28883F28A85F28681F27F79F17772F0726DF06864EF5E59EF544EED4A44
          EC3E38EC332DEB2921E91F17E9180FE9130BE81007E80F07E90F07E8140BE818
          10E91D15E92018EA241BEA261DEB231BEA2019E9221BEB261EEB2B25EC2E27EC
          2C25EB221AEA140DE80B02E80900E70F06E82018E9362EEB514BEE6F6AF08985
          F3A3A0F5BDBAF6D2CFF7E0DFF9EAEAFBF2F1FDF4F4FCF6F6FCF8F7FCF7F8FCF7
          F7FBF4F4FBF2F1FCEDECFBE2E0F9CDCBF7ACAAF58380F2524EEE2119E9130BE9
          0D06E92017EABAB7F5FDFDFCFAFBFAFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FEFCFCFCFCFCFDFCFCFBFBFBFBFCFCFCF1F0FBA4A0F52923EA0000E5140DE81D
          15EA0F05E80D04E91109E9140CE8150CE9140DE9140DE9150CE9150DE8130CE9
          130AE91208E91208E81108E71109E80F08E90F07E81108E9130AE8140CE8170F
          EA1A13E91D16EA2017E92119EA241CEA251DEA241DE9221CEA2019EB2118EA22
          1BEA2923EA2F27EA2D25EA241CE9150DE80901E80700E8140CE82D25EA4E46ED
          736DEF9290F2AFADF7CDCCF7E6E5FAF3F3FBFAFAFCFDFDFCFFFFFDFFFFFDFFFF
          FCFFFFFEFFFFFDFFFFFCFFFEFCFEFEFDFEFEFCFEFEFBFEFEFCFFFFFDFFFFFBFF
          FFFCFFFFFDFEFEFCF9F9FBE7E5FABBB9F67B78F0433BED0000E63029EAE6E4F9
          FDFDFBFAFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFCFCFDFDFCFCFCFCFBFB
          FBFCFCFAFFFFFCFFFFFDD6D5F86966EF110AE81008E92A22EB2921EB1E16EA19
          11EB1B13EA1B14EA1B14EB1D14EA1C14EB1C14EB1E15EA1E16EA1F15E92017EA
          211AEB2019EB221AEA231BEA231BE9251CEB241DEC241EEB241DEB231CEA201A
          EB201AEA2018E9211AE92620E92C25EB2C24EC251DEB180FEA0A02E80500E812
          0AE83029EA5751ED817DF2A6A3F6C5C3F8E2E2F9F5F5FBFBFCFCFFFFFCFFFFFD
          FFFFFDFFFFFCFDFDFBFBFBFBFBFBFCF9FAFCFAFAFBFAFAFBF9F9FCFAFAFCFAFA
          FBF9F9FCFAFAFCFAFAFBF9F9FCF8F8FBF9F9FBFAFAFCFAFAFCFCFCFBFEFEFDFF
          FFFDFFFFFCF8F8FBD2CFF89390F30700E75E59EEF9F9FCFDFDFCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDFDFDFEFCFCFDFBFBFCFCFCFDFDFDFCFBFAFAFCFBFBFFFF
          FCF1F1FBA7A4F3403AEB0B03E8130BE92921EA2E26EB2922EC251DEB221AEC22
          1AEB231BEB241AEB241BEC231BEC221AEA231BEB221BEC221BEB211AEB2019EA
          2119EA1F18E92019EB2018EA2018EA241DEB2821EB2A23EB2921EC231CEB170F
          EA0C02E80700E71209E82D26E95753ED8682F2B1ADF5CDCBF8E8E7FAFAFAFCFF
          FFFCFFFFFDFFFFFDFFFFFCFCFCFBFCFCFBFBFBFCF9F9FCFAFAFBF9F9FBFBFBFC
          FCFCFBFCFCFDFDFDFCFEFEFCFDFDFEFEFDFDFCFDFDFDFDFDFCFCFCFDFDFDFDFD
          FEFCFCFDFCFCFCFDFDFDFBFBFDFCFCFBFAFAFCFBFBFCFBFBFBFFFFFDFFFFFDFC
          FCFCC9C7F7342DEAA2A1F4FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE
          FDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFAFAFBFAFAFBFFFFFCFEFEFBDFDDF89B96
          F44740EC1108E80900E6150EE9221AEA271FEB2921EC281FEB251EEC231CEB23
          1BEB231BEB231CEB241CEC231BEB241CEB251DEC261FEC2821EB2820EB271FEB
          231BEA1C13EA120AE80901E70901E7170FEA332CEB5C57EE8D88F2B9B7F5D4D2
          F9EAE9FCFCFCFCFFFFFCFFFFFDFFFFFCFFFFFBFCFCFBFBFBFCFBFBFDFBFBFBFB
          FBFBFCFCFCFCFCFBFCFCFDFDFDFDFEFEFCFEFEFEFDFDFDFEFEFDFDFDFDFDFDFD
          FDFDFDFCFCFEFCFCFDFDFDFEFCFCFDFDFDFDFCFCFCFDFDFCFDFDFDFDFDFDFEFE
          FDFDFDFDFDFDFEFCFCFCFBFBFBFCFBFDFBFBFCFCFCFCFFFFFDDBDAF87A76F1E1
          DFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFD
          FDFDFEFBFBFCFCFCFBFAFAFAFCFCFBFFFFFCFDFCFCE7E5FBBBB7F67873EF3B34
          EB180FE90C04E80B02E80F08E7130AE8180EE91A11E91A10EA1911EA1910E917
          0FEA160EEA140CE91109E90D05E80C04E60D05E7180FEA2B24EC4B45EE736FEF
          9E9CF2C7C6F6DFDEF8EEEDFAFCFBFBFFFFFDFFFFFEFFFFFCFEFEFBFCFCFCFCFC
          FBFAFAFBFBFBFCFCFCFBFCFCFBFCFCFCFDFDFDFDFDFCFEFEFDFDFDFDFEFEFDFD
          FDFCFCFCFDFDFDFDFCFCFCFCFCFCFCFCFCFDFDFCFDFDFDFDFDFDFDFDFCFDFDFD
          FDFDFEFCFCFCFDFDFDFCFCFDFCFCFCFCFCFCFCFCFCFCFCFCFDFDFCFDFDFDFCFC
          FDFDFCFCFCFCFAFCFCFCF8F8FCFFFFFBDDDCFAC1BFF6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFEFEFEFDFDFDFCFCFCFDFDFDFDFDFEFDFDFDFCFCFDFEFEFCFBFBFC
          F9F9FBFBFBFCFDFDFDFFFFFCFFFFFDF9F9FCEDEDFAD0CFF7A4A1F47D79F15E59
          EF4B45ED3F38EB3730E9332CE9342DEA352EEB3832EB4039EB4B44EC5C55ED72
          6CEF8E89F2ADAAF5CECBF8E7E6F9F1F1FAF9F9FBFEFFFCFFFFFDFFFFFEFFFFFD
          FDFDFCFBFBFDFCFCFDFBFBFBFAFAFBFBFBFCFDFDFBFBFBFCFCFCFEFEFEFCFDFD
          FCFEFEFDFDFDFFFDFDFDFEFEFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFCFC
          FCFDFDFDFDFFFFFDFEFEFEFFFFFEFEFEFEFEFEFEFEFEFEFDFDFEFFFFFEFDFDFF
          FDFDFDFDFDFDFCFCFDFDFDFCFCFCFDFEFEFDFCFCFDFCFCFDFCFCFCFDFDFCFBFB
          FCF9F9FBFFFFFCE8E6FA}
      end
      object QBBMTunai: TQRLabel
        Left = 632
        Top = 96
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          254.000000000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QBBMTunai'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRitDrop: TQRLabel
        Left = 176
        Top = 136
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666800000
          359.833333333333400000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRitDrop'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel35: TQRLabel
        Left = 144
        Top = 137
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          362.479166666666700000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ': Rp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QJam: TQRLabel
        Left = 568
        Top = 64
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          169.333333333333300000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QJam'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 536
        Top = 64
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1418.166666666667000000
          169.333333333333300000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Jam'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 560
        Top = 64
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          169.333333333333300000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 56
        Width = 713
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          148.166666666666700000
          1886.479166666667000000)
        Shape = qrsHorLine
      end
      object QImageBlank: TQRImage
        Left = 489
        Top = -25
        Width = 233
        Height = 82
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          216.958333333333400000
          1293.812500000000000000
          -66.145833333333340000
          616.479166666666800000)
        Picture.Data = {
          0A544A504547496D6167653A1D0000FFD8FFE100B045786966000049492A0008
          0000000500120103000100000001000000310102001C0000004A000000320102
          00140000006600000013020300010000000100000069870400010000007A0000
          00000000004143442053797374656D73204469676974616C20496D6167696E67
          00323031363A30393A31342031373A33373A3232000300909202000300000034
          36000002A00400010000002F01000003A0040001000000610000000000000001
          E60298FFC00011080061012F03012100021101031101FFDB0084000201010101
          010201010102020202030503030202030604040305070607070706070608090B
          0908080A0806070A0D0A0A0B0C0C0D0C07090E0F0E0C0F0B0C0C0C0103030304
          030408040408120C0A0C12121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212FFC400A9
          0001000104030101000000000000000000000805060709020304010A10000102
          05030204030504050909010000020103000405061107081209210A1331411422
          5115324261712372819116171843B124335262828395A1D1192534475373A5B2
          B4F0010100010501000000000000000000000000010203040607051101000102
          030605020700000000000000000102030405111221314151A1061361719132B1
          1533527281C2F0FFDA000C03010002110311003F00DFE4201080420108042010
          8042010804201080420108042010804201080420108042010804201080420108
          0420108042010804201080420108042011F398C0390FD61C87EB0D4D04245F48
          FB00840210084021008402100840210084021008402100840210084070CE1123
          A26508DD6DA24EC59CC44CECC6B069156B12EBE3E4B49C7EF0E7F58C5DAEFB92
          B4F482725EDBF8072A75B9E2106E9F2EBE5A82110A211B9E828B9EDF5C2FD23C
          BCE330B795E1EAC4D5C7769F31E92C9CBF07731B7A2C53C34DFEDCDDFAAFAFF6
          DE95D15A0A831F11597C10C696D1776FD3B9AA7A277FE3DE317E9D496ACEE3AE
          A6EE3BB6B5332D419773928CBAF94CBAA2BD9B11F7F4EEBFA473DF1067556779
          BD8C930BC274AABFE37C7188E91C25B165F80B782C15CCCAEFEDA3FDF3C6125E
          5A5C65655B607B08A610553EEA7D23D63842514F68EA9A6CCE9D21AA4CED5754
          BBA11584201080420108042011C494B298F4F780C5FB98DE06D8B67B678DF9B9
          DD70B72CAA43BC91A99B867418F8A21E3906DBEEE3A49C93B3624BDD33EA9987
          150F149745162B47456B763537501480A7D8B52ACACB78CE547FC9B92E11170A
          80B9CC04BADA3EF5F6C5BE8D3098D64DA96ADC8DE36ECB4E953DE9F9161F6BE1
          E6441B3564DA75B0704D01D6D7B8FE28B2B761D577A786C7EB456E6E877636A5
          B7566DBE676F8BE73D516D17D14A5586CDD1CFB2922670B8CE16023E52FC529D
          13AA558FB31BDD454D84EEDA4DCD5AB55F21573DB25F0FCBBFD1709EB135B407
          71BA15BA1D2F92D63DBD6A9D1AF0B5E7B22D55E81328FB7C871C80907B818A92
          72054454F780C77ADDD4EFA7A6DDEE79FB1F5C77ADA636CDC14C2E13542AA5C0
          C0CE4B1A2212739745F353D5170A9EDFAC78F5FF00AABF4F7DAD6915BDADDAEB
          BACB668B6E5DF4E66AB417BCC39B98ADCA3AD8B81312F2AC81BEE02A383DD070
          9DB2A9018C76C7E208E92FBB1D4594D22D28DD84BB172D49DF264A9B72D3A729
          693A6AB81069D9811654D7D839F25EDF2C4D10375148145505A4C641397F0544
          C2E7185C2263F5808F3BAFEAC3D3B36415976D9DCF6ED6D4B76B0C079A76F23E
          73F51687F0A94AB006E8E7BE3922670B8CE1711EA9FE29BE89F3B580A58EE96A
          AC81E4126DFB5AAA8DE55531F37C3F24CF7EEB844809B5A03B84D10DD069AC9E
          B1EDEB53E9177DB35045166B1419947D923154E40A89D84C797CC2A88A994CC6
          2DDC2F557E9CFB5FB8E6EC2D76DE9E9FDB75A9270587E8AFD5C5C9D9725C2A21
          B0CA2B8DE533DD5309EFF480B6F773D697A686C8A6E974EDC0EE9A952750ADCA
          B73F294AA3B2FD4E6CA59E0436E60DA966CC9A688547819F1E59ED9C2E3DF6DF
          581E9D1746DA24F77D25BA5A24AD833B3852275C9E69F6124E6878A94BBED136
          46CBC8862BC0C4555091533015ED9EF53CD89EFE6B170513691B89A65E53B6B0
          36ED525656566A51D976CD4D00C45F6815C15502EE3944C27A65339D9F1CE495
          51544B04889F7BD17D3D97BA7F28A6AAE2DD335CF2535C4D51A422BB3BD1B8EA
          FB8EB86954D3970B32D8A7CC1CC21022BB32EB5C514F9E3E5C9A9027D7BC630B
          26B33D5CBCEA5AED7A9B4ECCB4FF003956A647936E4D2A7C8A45FF00A72E1855
          FCC0638B789B3E9C44D15D7F4C4CF6E1CBABA4E5D965382A2BA23EAAA8A63E66
          35ECCCFA59B73AC6A1D403513561E7C5A9B2F8809232FDABA8B9ECE17E10454F
          4F7454891942A7D3E8F4B091A548372EC349C019643800A27FA29EC91B3F803C
          39F85E1271F8ADF76F4ED7B4728DD331DA25A9E7D98462EFC58B3F976E348F7E
          7EBF75470098EFDE390715558E8533DDE1C468E708A924201080420108042011
          1EFA9C6FB6C2E9C3B36BBB74F7CC8A540A90C7914BA20B880556A83BF24BCBA2
          AA2E048D514CD11783626582E3C543F3DDD2D7663AF3E239DFBDE3B96DF6EA5D
          56AD685A9E54D564E51C3611F5755C395A4C9A2A124B4BA8812970423401ED95
          739C6F36BBD0AFA47DC1A56F68D3DB04D3C96A7B8DACAA542994F562A8D26328
          7F1E25F1427E98557097EEAAF645440C17D2E7627B83E9FF00D3E775DB48DBF5
          415DBF28B795C0B62D66AAE36D14F13B44903A5BCE38A88D892F36F92AA20239
          CD1557051AE6E86DE1F9DC76B8EF16A7AFFD5276DF5E93B3AD947661EA5EA336
          EF9F75D59C2C0F9A04486F32DE49D3255503516C3E6E67809E7E20DE91FB090E
          987A8BACFA6FB65B26C8BBEC0936EAD4BB82CFA4CB52DE751B79B171875196C1
          1E13655C1C122AE51B5CF688C3E097BEEEE9CAA6E0F4B26AAAE3B42966E8F521
          A711A932CCC994E36E1887A2198000117E2169B4FC301853C6516450EDEEA436
          25E74D619959AAFD872A338EB6880534F353D3808EE73EA8040299C222B4995E
          C9990BD1FF00C399B77DECECCEC5DE1F50AD44BEEEEB86EBA432144A0CBD5CE4
          A4E87496794B49342BC7CE54F29A12141516845C14115C292840EF111748DD2A
          E92DAF3623BB73B8EBAE5A5A814D989C9490AE4C0BF374B9C9571B17811E1005
          36F0F35C790E5391775CC7E8336EDAD3B91DD3F448B5F58F422AED3FAB973696
          79948A84EBA208F571240DA13222F9133302AA8A7F2F251E5DB301A7CE859E1F
          8DC2EB76EF2A9B82EA8FB6DB8242CBB67CD98FB275201C17AEAA91AAA879AD17
          CEEB2DFCCE3844BC0CD0070593C4E7F10DF496D85874C4D44D71D30DB4591615
          E3614B4BD56975EB3E8D2F4871C149869B7259E160011E4365D7050493EF237D
          D78C0469F04ADF977CE16E0F4D9EAC4C3F40921A2555AA6B8796D99B3F8C0331
          0F622165A452FC42C369F8630478C9EC7A1DBDD49ECCBAE9D240CCC57F4FE55C
          9C7BEEFC4BCCCECEB62E2FAA776FCA1F4CAF0C6533DC33E74EBF0AF6DB7791B2
          AB17757BADDC96A89DE3A874696AB8A50A6E5465E5250C3328DA7C432F1B8892
          A2D6509531D851138C6CCB675D19767DB29D96DEFB17B225EBF5FB4F50BE2D6E
          09CBAA65B999AA813F2C32C4996C000505B6D14444130BDFD5603F3E7D1F2FFB
          E7A4AF5F4A7684EA0549D66596E49CD32AF38B9449B65F7D1861D4FF0057E21B
          94787F2448FD51EA75D92F60E9E566EDF978D324DE99E03F8501BCA27F244FE7
          163153B366A995CB547995C53D5AECD21A6576774CAA72B200DAD46F7ACB34A6
          89CF4106495E77F879CE22AFE48B12836E7A492178DC0170A4B28DBB405597A7
          4B3BDFCF34225277F552F9D7F3716382E4F819CE31F87B73CA23B4CD7E9FA9D3
          3C53898B545CD39553F68A7FA4A49CB82034822B94FF0057FC23D4CA0A64123B
          FEC444EEE4E5F33B554CBB04447B0A47D5544F58A82100840210084021008407
          C55F9A3489E36BBEEB54CDB0E8969AB0F92532AF74CED4A65B1F42725A511A6F
          F90CEBBFCE032778362D3A2D1FA58DC172C9B49F1D57BFA7FE2DC45CF2F2A524
          8013F80FF8C6DAD053B2E7BE3D203A09B96688DE46D04C9324AABEA89EFF004E
          D112BA8875AAD8374CF957A8FAFBAB613B76AB28EB1615B4213B567517EE91B4
          8400C897B1BA609D9719C2C06A5FAB26F87AC7753CD89DF3AB740DA3B9A23B63
          A1CB31529F76EA98F2AB174B0334C23228A620E134AEAB6E619046D718575CC2
          245D7E084A508CD6E46B8D221271B725D0D3B22E0AA6BE984F6545CF655CF744
          F550C51E3626D137BBA45F44B10917FE20FF00FD63781D1F69F2B4DE95FB7493
          95FB9FD5D508F3F55290695603529E3831153DB673FBB8B8D3F8FF00DD51B23F
          0EE3C6FF0045ED04987D70A342981EEABE893D31DF1E9015BEA21D6B7609D342
          4DEA2EBDEAD84F5DEAD238C5836D084ED59E45FBAA6D21003225EC6E9827AE33
          858D4AF567DED7592EA69B11BE357A99B47774476C144625EA33DFD287F855EE
          9652699464539883A6D798AD389E4B62DF6EEE9F6480BD3C1094665997DC8D6C
          151554EDB611517298CD517FC093E8BDFBA27AAE1AF1AC2286FAF49904BE65B0
          104BF4FB4266037C1D2CD99796E99FB7A6253FCDA69ADBAA9FF0D97CC6759911
          70382E3BF6FF00AC4490FCC978BC36C750D00EA4D6BEEC2CB68E4D8D50A2B134
          B3A19F9AAD4F3065CFE4C2C897F08DE155B72B46DCC74A3A4EE8A906DA05F568
          C9549C643FBA7A681B479B5FDC2330FF00663CDCEAEF9396E22EF4A2A9F8897A
          1945117B1F62DCF3AE98F998850B6C9A29393EED9D489E45966A936EBF537E68
          3DA627DD321FE40887FEEE258D916A51ECCB6A52DAA131E54B49368D0027B224
          6BFE17C9A8C1D3E7F38DDDA23AFA3373ECC2AC55E9A279EFEF33D3D556E019E4
          4689F94760E151636FA69988D7ABC188D1CE11712420108042010804201080F9
          8C946AEFC589B32BBB745D35FF00ACED38A3BF3D5AD22AB25C6FCACA22ABEF53
          0997199D40C7FA026DBE59FEEE5DC80D7AF84D3AB1E94ED8AAD756C337077ACB
          5BD4BBDEA615BB62B7517C5994FB4D59065D9571D2ECD13C2D30A067FB3CB460
          5DDC08FD1CBF372EDCB1CEF9E5E428798E3C3E9C78E79A63BFE58F5FA7A2406B
          DBA8875A2B1ADBDABEE8263647773171DD9A236F52C676EEA310CE53E9551AA4
          E2C88B6C3B8517DF9614374BF022A80AF74711352DE154B2F6D7B8DEA63765F9
          BBAAFD32E7BF65A93F6ADAF2D793C932B50A914C8F9F343E6651F9B6C1790679
          12238E3B8CB6AA21B58F1486E8B4C744BA4F5F1A47715D32AB74EA5A4AD2A8F4
          5F3455F98119A65E7DD4673C95B06E58B2E2E70A4385EF8885BE085ACC84B54F
          7236B1CD0A4C98DBD343C57B1802D484B1F54F9D3BFBE60316F8D7098FEDB9A4
          72E098E3629E13E89F1D30A91BC8E92060EF4B3DB93C05FF0096B6F0FF00F1EC
          406A13C70B398B876D94F4F666E23CFF00B74B8903B7EDD46A86CB7C23D6E6E3
          B45F0173516D3396A7CE7968E2C83B375B7253E25117B2AB4930AE0A2A2A2980
          22F6CC0401F0A5D8FB6EDC67526BBB51776957A75CDA832D4CFB5AD662F69849
          C3A8D41C9945999BE4E67CF9D6C090873924F31C771C9B521DA878A57745A5FA
          2BD282F5D18B8EE895FE946A5148D368D445787CF98109C61F7DD46F3CBCB06E
          58B26B944531C2AE71010EBC10959A7CB2EE42D476647E21D3B766411173CD05
          2A48B85F74CAFF00CE30DF8D64C4F7D5A4C23DB3A7E86A3F4CD426BFE901BDDE
          94CE79DD31F6F131FE969ADBC9FCA9AC467E3042280D53F8BDF6CEDEB0F4BC0D
          6AA7C921D474AAE294A9ABC3F7924E695649F04FD4DF972FF7518BBC3C9AAB57
          DCE74397F418E77CD9CB12F7FE8C3006BF32CA4D4E4A4DB64BFC675F1FF77187
          98DAF3B0D551D74FBC323095C5BBF4D73C9B90B6A814BA0B3E4C84B36DAA0033
          90F5500CA0E7F8A9455C3D3B764FAC5CC35116EDC52B572A9AEB9AA5CC478FBE
          63EC642821008402100840210084021008A7572525E7E44A4A6E501F69E156C9
          B7004D14493897624545ECAA98EF9455ECBE8A1A4CEA45E0FAD3FD6ABFEA7AB1
          D3EF54E9F613B522375EB02EB65D7694CB84B95596996F91B0DAAAAAF0507111
          5578AA27CA38074EFC297D626B523FD56EAC6F66CDA2D90408C3B272B72556A6
          D796A429C42495A6DA3FAA0910FA263BE15036EBB13E8C9B41D906C9EE1D9485
          B457AD16F661D5BCAAD5F006E66E523056CD0C41515A6D0728D0A1E5BEE5C90F
          265A90DCE7834B73140D4E99AAECA77216AD6AD7498539697BF1E98A755A4915
          72824EB12AE34E28AE7E7010CA712E288488819AB6CDE10E9F90D2CBF2EDDEDE
          E229B7A6A6D76D79EA45B4CC8BD34F51ADE9F765DC6E5E71E997911F98F2DC50
          541416D0705D8F9271C8FD13BA01EFA3A4D6E566F59DEDCBE9D5728570D37EC7
          AFDBB2B2B3BCDE6BCC0317587880505E6DC6D38F36C84849C1EDCB9087B3AC7F
          879B759D5AF779FDA166F75564DA745A352D9A1506863499C7DD6655A75C755E
          79D421127CDC79D55411414146C7BF1E4B3DBA676DB75B3675B36B336C1AE37D
          D06E69FB164828F235BB7D97A55A7E4DB5C4B89B4E12AA1881202AA7AF969011
          5BAF6F433D4EEB0374E9B57EC5DC0502CC96B0E52A12E6C5669EF4C24C9CC130
          5D95B24E289F0EB955FAF68CABD3BBA675D7B75E9CB37D36377F70DADA9B68B6
          D4E52E59FA648BF29F172134E1BEE313206791745D78D45C021C8A37F321222C
          06A9374BE0D3DD2D0B54662B1B28DC65A757B695EF324A5EFC9898A755E4033F
          2813B2F2E6D3BC3D398202E1130288A98CD3B6EF083CDCB696DF3746F5770D4E
          BCF54ABF6D4DD2ADC665566DEA2DBD3AE3240C4DBB32EAA3F32AD990288A0368
          382EC794E21923A23F411DF3F49ADC94E6B0CDEE474DAE0A15C34C1A5D7EDA93
          969D5371AF310C1D61F5014479B212E246D90909B81DB3C879F589F0EDEEBBAB
          0EEED770B3FBA9B26D5A3D1A98CD0689444A4CE3EEB526D3CEBDE73CEA10813E
          46FB9940141414014CF1E4A1B02E9A1B6FD6BDA26CDECCDB26B9DF742B96A162
          C885164AB540977A59A989165312E84D384AA2E036A80AA9EBC1224007BC0462
          EB392D604C74AADC0B7A93308CD312C3AB1238499E2F8CB914BF1FF5FCF46B8F
          E71AE9F05BE82EA75B3B52D55D6FBBDB10B4AF5AEC9CB51245F6FBBCEC836F0C
          CCC87D408A65A6FF007E5DC8898D606EB80C3D51319F45F4ED1D81C7DD61069A
          39C22421008402100840210084021008F1558EA2322E9521A6DC981025641E25
          102731F2A112655133EBDA023B5CBAF3BCAB4F50ED6D2AACE90E9BA556EF09CF
          8356EE29B49711966D1D3F33FC99485544931C50FDF38C266B37E6B76E5ECC9F
          B0B4F834C6C876EEBCE6A7DA561DAD4C8D3D81966BCD1C3DF0FCD49413B65BF6
          580AAE99EE0750E6B59034275B34D642855C9CA63956A6D428954FB42467D96D
          C46DC44256DB3131531FBC3DF9F6F48F06E5777721A057FDB367356D15464E60
          427EE1A8A3A81F60D34DE19709934F74F39C4C7EE2C4C0BAB74DABF5CD07D0BA
          CEA9DB16E33549F90265B669CEB9E5B6E38E3EDB2992FCB9F64F75C47BB4335A
          68FAE7A76D5F94292729EF091CACF52E78B8BB4B9C689426259E1F636DC15455
          F74245848C612DBC4BA2ADA11635EF6CE9BC9BF765FD557A8F4AA0B938B2F2A0
          E36EBE244EBA824A8000C29AA2775F68BEF49ABFB9B7EBF3746D6AB36D26E43E
          1C1F96AFDAB3EF1B66F2922791F0EF089A7CB85E5CB0B958818B2CFDD66EAAE2
          D16FED1927A1168542D9097999D39262E37C2A26C30E388E22014B2B6A7C40D5
          055C5FBB8ED17A5F7BA99294B7ACC97D20B5662ECBAAFD941A851E864E84B87C
          3700327A69CE242D3608E8655132ABC5133880A35C9AD7BAAD0CA615F7AE5A57
          6AD52D2964E7507EC99E9A767696CE5049D71A7C53CF11455CA8FB222FB45735
          975FB5068175D87656845BB6F571EBE656766D99FAE4FBB2D2BE5CBB4C38248E
          B6D38A6440F26138AE78AFD203C74ADC16BCB97955F42AB5A3F41A65F8CD292A
          F472FB5DC98A454E58661193CBC12FE6B64194C8AB5F8D3114497D79DE654355
          EABA2F23A45A68956A3D318AC1BC75E9B595265E71E06B8924B22E79B05F7907
          F2CF7C0481B592B5F60CAB971CACBB13EAC8ACCB328E13AD8BB8C9A099615539
          2AE3288B1EC9C6C4C5057EB9F7FF009FE5F5FCBB7BC069AFC4B1BA6BD373FA81
          A79D0CF6A95309EBDF552AD293975132596E9B202A8E4BB530BF83062536E0AE
          141A966D7FBC8DA96D1B6D3A71B3CDB759BB65D2490196A05994B669B2E9C704
          F900FED5E73EAE3AEA9B865EE46B0192D1113B24201080420108042010804201
          080420105445ECB018435DBBEF1F43FF00F66E1FFF001B5141DDE5B157BC3717
          A296ED0EF2A85BF32ECE560D2AD4906CA65A4190CA88A38249C4FEEAFA7AA405
          0768F6F4B5B1AC37B26BDDED52ADEA6DAEDFC31576BAFF002098A1B864E33332
          6DA0888364A2A2EA87A38D9E71DA2D0D3DAC6A5EB3D0B51752AA1B4FAFDD547D
          584296959E62AB212EDA519B05979604174C5CCAA11BCABEEAE7E51303B2B9A8
          5705F5D396AB6B6A4B2EB77859756A5DB95C97738F9AB32C5424C11CF949532E
          3240A8A9EBC96322EB0B137B57D60FED3F415E3655CC6CCBDF34F657B4AB89FB
          362A838FA2F107B3FDD8E7BE2122D9DB9E996906AD6C734DAC2D4CAF949BEE4F
          4C3B42A949545246A0DCE84CCC90B92AEFDEF378798A88994E2AB98B9F49AE9D
          57D2FDCD31B6ABC3579DBF69750B7DCADC9CFCECB08552944DBEDB622FBA1F23
          AD98BCB82C2AE5B2FAC40B0B68DB65A8EAD6D5680371EE1EFB95B6EA4CCD3731
          6C531C959793759F88744DBF3125D1C46C9339417073F55F6BDAE51B576F7BD0
          B4AB95A6DAA4DAB5AB3D6D0A3CECD39C25E4A71899478182717B8F9ADA8F1CAA
          F2F297E901923741AA164E95E88DC15CBE27D92666E4A62525A9C6582A8BEE36
          4D84AB61F888CD5113F588F6FE8F5F12139B62D259CBF2AD6CD7A4ADBA9B3315
          3A536D24C4AB83252AAE36A26248A88A24DAA7BAA07D202F4D955B6D486A6DEE
          CEB0DC756AD6AC504C6973D53AB4C7982E531C357255D930411069870724423E
          8E09E7DA2EBB3D91FF00B406F85CA122D9B4852115EC87F1739DF1F5C0A2FF00
          080893D6BBAFECEF479D55B534B18D9AD4AFC0BA6925556EE176B7F64D38085F
          268E59B5F877BCC7438899FDDE28F37EBCBB414BCFC67FAF9AAD22BA7BB6CE9E
          3214EBB2B29F074D7E7EE07EB67F127D9B419266559278B3F7439A22AF65ED98
          0993D06BA45EB3E82DCB737526EA175398AD6E075409C7965E7C91E76DC9674B
          9136662AA3E7B89C1144578322D8369854248DA1C908837D973944F45CFE5DD7
          DD7B77580F4C2010804201080420108042010804201080A2D6EC9B52BB73D22F
          2AAD1659EAA50D1E1919E7472E4AA3C222E20FEF710CFEEA47555AC1B4EB5715
          36F1AC50A5A6AA946270A467DE0C392BE68036EA897B72104CFE89F480A5DCFA
          35A5F7CD6DDB8EECB324E7275DA6BF4729C31C9B926FA22BCCA97B812FAFE891
          5CA2D12916ED118B769122CCAC8C9B012ED4A4B8FECDA6C4104403E888008901
          6FD6B42B48EBAFD7E6AB962535F3B9DE957AAAE3C3FF008D725B8A4BA9FEE700
          C7EAB1715668549B8690FDBF70483533253AD1B3332AF8F36DE03C89B649EE8B
          CA02CCAC6D8F6FD7069AC868ED6B4AA90FDB54C54292A514BAA37247C94F20A3
          826D5397AA1247AB49B6FBA39A2293C9A5B6048D21CA827EDE69AE4EBD3499F9
          50DE3C99A27B2292E32B8C6602E2B0AC9B4F4E6DE6AD0B1E88C5369728A7E4C9
          4AA61A0533270D53F35332558F97CD8B67EA2D08ED1BF2D691ABD2E6517CD90A
          8B02FB478F45E042A994F65ECA9ED0163E9FECDB6C1A6772B178597A374F95A9
          4AA2FC3CF3CAECC392F9F546FCC22504EC9D91113B27D22F8AAD936AD6AE7A4D
          E354B7E5A62AB45478646A2E861D95479045D402F6E42299FAF1480F339A7564
          95F6CEA91DBB2E970332454F0AB71FDAA4B91238AD917B8F24558EF92B16D294
          BC66F50652832ADD6E7655A937EA629F3BAD36A64D87EE8ABA78FDE580A36B5E
          80E886E3ED22D3CDC0E8EDBB7B509D5432A45D14E6A7A5C4D3D0D01D15145FCF
          D7B4597B7DE9FBB20DAD560AE2DB9ED1F4FECAAA3C840756B7A86C4BCE715F54
          F88E28E715CFA22E203333082828239C2276454C7F8F78EE4444EC9008402100
          8402100840210084021008402100840210084021008402100840210084021008
          4021008402100840210084074CCFB7EA9FE291F65FD13F87F824076C20108042
          010804201080420108042010804201080E899FF38D7EFAFF00F528EDFC4BFF00
          F7BC0728402101FFD9}
      end
      object QImageBlank2: TQRImage
        Left = 1
        Top = 119
        Width = 712
        Height = 82
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          216.958333333333400000
          2.645833333333333000
          314.854166666666700000
          1883.833333333333000000)
        Picture.Data = {
          0A544A504547496D616765AF020000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC0001108002D004803012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
          28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803FFFD9}
        Stretch = True
      end
    end
  end
  object ApplicationEvnt: TApplicationEvents
    OnShortCut = ApplicationEvntShortCut
    Left = 600
    Top = 8
  end
end
