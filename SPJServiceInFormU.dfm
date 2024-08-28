object SPJServiceInForm: TSPJServiceInForm
  Left = 484
  Top = 125
  Width = 526
  Height = 605
  Caption = 'SPB Service/Test Kembali'
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
    Left = 24
    Top = 8
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label4: TLabel
    Left = 52
    Top = 72
    Width = 13
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rit'
  end
  object Label5: TLabel
    Left = 42
    Top = 96
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Drop'
  end
  object Label6: TLabel
    Left = 24
    Top = 120
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Argo'
  end
  object Label7: TLabel
    Left = 23
    Top = 168
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Ordo'
  end
  object Label8: TLabel
    Left = 42
    Top = 216
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'BBM'
  end
  object Label9: TLabel
    Left = 46
    Top = 240
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Gas'
  end
  object Label2: TLabel
    Left = 12
    Top = 32
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pengemudi'
  end
  object Label10: TLabel
    Left = 11
    Top = 144
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Argo Isi'
  end
  object NoBodi: TComboBox
    Left = 72
    Top = 8
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = NoBodiChange
    OnKeyPress = NoBodiKeyPress
  end
  object GroupBox2: TGroupBox
    Left = 72
    Top = 56
    Width = 73
    Height = 145
    Caption = 'Awal'
    Enabled = False
    TabOrder = 3
    object RitAwal: TMaskEdit
      Left = 8
      Top = 16
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object DropAwal: TMaskEdit
      Left = 8
      Top = 40
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 1
    end
    object KMArgoAwal: TMaskEdit
      Left = 8
      Top = 64
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 2
    end
    object KMOrdoAwal: TMaskEdit
      Left = 8
      Top = 112
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 3
    end
    object KMArgoIsiAwal: TMaskEdit
      Left = 8
      Top = 88
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 4
    end
  end
  object GroupAkhir: TGroupBox
    Left = 144
    Top = 56
    Width = 73
    Height = 145
    Caption = 'Akhir'
    TabOrder = 4
    TabStop = True
    object RitAkhir: TEdit
      Left = 8
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
      OnEnter = RitAkhirEnter
      OnExit = RitAkhirExit
      OnKeyPress = RitAkhirKeyPress
    end
    object DropAkhir: TEdit
      Left = 8
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 1
      OnEnter = DropAkhirEnter
      OnExit = DropAkhirExit
      OnKeyPress = DropAkhirKeyPress
    end
    object KMArgoAkhir: TEdit
      Left = 8
      Top = 64
      Width = 57
      Height = 21
      TabOrder = 2
      OnEnter = KMArgoAkhirEnter
      OnExit = KMArgoAkhirExit
      OnKeyPress = KMArgoAkhirKeyPress
    end
    object KMOrdoAkhir: TEdit
      Left = 8
      Top = 112
      Width = 57
      Height = 21
      TabOrder = 3
      OnEnter = KMOrdoAkhirEnter
      OnExit = KMOrdoAkhirExit
      OnKeyPress = KMOrdoAkhirKeyPress
    end
    object KmArgoIsiAkhir: TEdit
      Left = 8
      Top = 88
      Width = 57
      Height = 21
      TabOrder = 4
      OnEnter = KmArgoIsiAkhirEnter
      OnExit = KmArgoIsiAkhirExit
      OnKeyPress = KmArgoIsiAkhirKeyPress
    end
  end
  object GroupBox6: TGroupBox
    Left = 216
    Top = 56
    Width = 73
    Height = 209
    Caption = 'Total'
    Enabled = False
    TabOrder = 5
    object RitTotal: TMaskEdit
      Left = 8
      Top = 16
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object DropTotal: TMaskEdit
      Left = 8
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object KMArgoTotal: TMaskEdit
      Left = 8
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object KMOrdoTotal: TMaskEdit
      Left = 8
      Top = 112
      Width = 49
      Height = 21
      TabOrder = 3
    end
    object BBMGasTotal: TMaskEdit
      Left = 8
      Top = 184
      Width = 57
      Height = 21
      TabStop = False
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 0
      Top = 144
      Width = 73
      Height = 9
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object KMArgoIsiTotal: TMaskEdit
      Left = 8
      Top = 88
      Width = 49
      Height = 21
      TabOrder = 6
    end
  end
  object NoPolisi: TEdit
    Left = 168
    Top = 8
    Width = 73
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 1
  end
  object GroupBBMGas: TGroupBox
    Left = 72
    Top = 200
    Width = 73
    Height = 65
    Caption = 'Rupiah'
    TabOrder = 6
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
    Left = 144
    Top = 200
    Width = 73
    Height = 65
    Caption = 'Liter'
    Enabled = False
    TabOrder = 7
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
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 338
    Width = 497
    Height = 225
    Caption = 'Data SPJ'
    TabOrder = 8
    object Label3: TLabel
      Left = 80
      Top = 16
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object Label12: TLabel
      Left = 320
      Top = 16
      Width = 114
      Height = 13
      Caption = 'Total Unit  Service/Test'
    end
    object GridSPJ: TStringGrid
      Left = 8
      Top = 48
      Width = 481
      Height = 169
      TabStop = False
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
      OnSelectCell = GridSPJSelectCell
      ColWidths = (
        64
        61
        188
        73
        62)
    end
    object Cari: TEdit
      Left = 104
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = CariChange
    end
    object UnitJalan: TEdit
      Left = 440
      Top = 16
      Width = 41
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object Selesai: TButton
    Left = 424
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 10
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 424
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 9
    OnClick = SimpanClick
  end
  object Pengemudi: TEdit
    Left = 72
    Top = 32
    Width = 169
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object SPBBatalJalan: TCheckBox
    Left = 296
    Top = 248
    Width = 97
    Height = 17
    Caption = 'SPB Batal Jalan'
    TabOrder = 11
    OnClick = SPBBatalJalanClick
    OnKeyPress = SPBBatalJalanKeyPress
  end
  object GroupKeterangan: TGroupBox
    Left = 71
    Top = 264
    Width = 434
    Height = 65
    Caption = 'Keterangan'
    TabOrder = 12
    object Keterangan: TMemo
      Left = 8
      Top = 16
      Width = 417
      Height = 41
      TabOrder = 0
    end
  end
  object Bersihkan: TButton
    Left = 424
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 13
    OnClick = BersihkanClick
  end
end
