object SJBusRubah: TSJBusRubah
  Left = 444
  Top = 293
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Rubah SJ Bus'
  ClientHeight = 465
  ClientWidth = 578
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
    Top = 152
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Body'
  end
  object Label3: TLabel
    Left = 48
    Top = 56
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label6: TLabel
    Left = 12
    Top = 128
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pengemudi'
  end
  object Label13: TLabel
    Left = 36
    Top = 80
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'No SJ'
  end
  object Label11: TLabel
    Left = 1
    Top = 104
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Reservasi'
  end
  object Label7: TLabel
    Left = 46
    Top = 200
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hari'
  end
  object Label2: TLabel
    Left = 42
    Top = 176
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Rute'
  end
  object GroupSPJ: TGroupBox
    Left = 8
    Top = 234
    Width = 561
    Height = 225
    Caption = 'Data SPJ'
    TabOrder = 8
    object Label12: TLabel
      Left = 408
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Total Unit Keluar'
    end
    object Panel3: TPanel
      Left = 496
      Top = 8
      Width = 57
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object UnitJalan: TEdit
        Left = 0
        Top = 0
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object GridSPJ: TStringGrid
      Left = 8
      Top = 32
      Width = 545
      Height = 185
      TabStop = False
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnDblClick = GridSPJDblClick
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
  object Cari: TEdit
    Left = 72
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = CariKeyPress
  end
  object Simpan: TButton
    Left = 384
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 384
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 7
    OnClick = SelesaiClick
  end
  object Bersihkan: TButton
    Left = 384
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 5
    OnClick = BersihkanClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 41
    Enabled = False
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 180
      Top = 12
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Tanggal: TEdit
      Left = 64
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object Jam: TEdit
      Left = 208
      Top = 12
      Width = 49
      Height = 21
      TabOrder = 1
    end
  end
  object NoSJ: TComboBox
    Left = 72
    Top = 80
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = NoSJChange
    OnKeyPress = NoSJKeyPress
  end
  object CetakUlang: TButton
    Left = 384
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cetak Ulang'
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 72
    Top = 104
    Width = 273
    Height = 121
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object NoPolisi: TEdit
      Left = 104
      Top = 48
      Width = 73
      Height = 21
      TabStop = False
      TabOrder = 3
    end
    object DriverDisp: TEdit
      Left = 104
      Top = 24
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object NoReservasi: TEdit
      Left = 0
      Top = 0
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Customer: TEdit
      Left = 104
      Top = 0
      Width = 169
      Height = 21
      TabOrder = 1
    end
    object Hari: TEdit
      Left = 0
      Top = 96
      Width = 41
      Height = 21
      TabOrder = 6
    end
    object Seat: TEdit
      Left = 176
      Top = 48
      Width = 41
      Height = 21
      TabOrder = 4
    end
    object Route: TEdit
      Left = 0
      Top = 72
      Width = 244
      Height = 21
      TabOrder = 5
    end
  end
  object GroupDetail: TPanel
    Left = 72
    Top = 125
    Width = 105
    Height = 49
    BevelOuter = bvNone
    TabOrder = 9
    object Driver: TComboBox
      Left = 0
      Top = 3
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = DriverChange
      OnKeyPress = DriverKeyPress
    end
    object NoBody: TComboBox
      Left = 0
      Top = 27
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = NoBodyChange
      OnKeyPress = NoBodyKeyPress
    end
  end
end
