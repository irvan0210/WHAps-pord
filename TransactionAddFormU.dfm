object TransactionAddForm: TTransactionAddForm
  Left = 346
  Top = 100
  BorderIcons = [biMaximize]
  BorderStyle = bsNone
  Caption = 'Penambahan Transaksi'
  ClientHeight = 594
  ClientWidth = 625
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
  object Label2: TLabel
    Left = 71
    Top = 8
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label1: TLabel
    Left = 42
    Top = 32
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'NIK/KPP'
  end
  object Selesai: TButton
    Left = 528
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object Cari: TEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = CariChange
  end
  object Biaya: TComboBox
    Left = 280
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = BiayaChange
  end
  object JumlahBiaya: TEdit
    Left = 424
    Top = 24
    Width = 89
    Height = 21
    TabOrder = 3
    OnExit = JumlahBiayaExit
    OnKeyPress = JumlahBiayaKeyPress
  end
  object Simpan: TButton
    Left = 528
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = SimpanClick
  end
  object GroupKaryawan: TGroupBox
    Left = 8
    Top = 320
    Width = 609
    Height = 265
    Caption = 'Data '
    TabOrder = 5
    object StrGrid: TStringGrid
      Left = 7
      Top = 16
      Width = 594
      Height = 241
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnDblClick = StrGridDblClick
      OnSelectCell = StrGridSelectCell
      ColWidths = (
        91
        113
        93
        150
        110)
    end
  end
  object Bersihkan: TButton
    Left = 528
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 6
    OnClick = BersihkanClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 361
    Height = 89
    Enabled = False
    TabOrder = 7
    object Label5: TLabel
      Left = 53
      Top = 14
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label6: TLabel
      Left = 19
      Top = 37
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Hutang'
    end
    object Label3: TLabel
      Left = 5
      Top = 61
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Tabungan'
    end
    object Nama: TEdit
      Left = 88
      Top = 8
      Width = 233
      Height = 21
      TabOrder = 0
    end
    object TotalHutang: TEdit
      Left = 88
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object TotalTabungan: TEdit
      Left = 88
      Top = 56
      Width = 89
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBiaya: TGroupBox
    Left = 88
    Top = 144
    Width = 289
    Height = 113
    Caption = 'Biaya'
    TabOrder = 8
    object GridBiaya: TStringGrid
      Left = 8
      Top = 17
      Width = 273
      Height = 88
      ColCount = 6
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 3
      Options = [goFixedVertLine, goVertLine, goHorzLine]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = GridBiayaSelectCell
      ColWidths = (
        159
        88
        2
        2
        2
        2)
    end
  end
  object GroupKeterangan: TGroupBox
    Left = 88
    Top = 256
    Width = 329
    Height = 65
    Caption = 'Keterangan'
    TabOrder = 9
    object Keterangan: TMemo
      Left = 8
      Top = 16
      Width = 313
      Height = 41
      TabOrder = 0
    end
  end
  object NIK: TComboBox
    Left = 96
    Top = 32
    Width = 106
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    OnChange = NIKChange
  end
end
