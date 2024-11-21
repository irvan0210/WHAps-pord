object VehicleMutation: TVehicleMutation
  Left = 668
  Top = 250
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Mutasi Kendaraan'
  ClientHeight = 212
  ClientWidth = 302
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 16
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Bodi'
  end
  object Label2: TLabel
    Left = 23
    Top = 64
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lokasi Awal'
  end
  object Label3: TLabel
    Left = 47
    Top = 112
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan'
  end
  object Label4: TLabel
    Left = 31
    Top = 139
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tgl Mutasi'
  end
  object Label5: TLabel
    Left = 47
    Top = 88
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tujuan'
  end
  object Label6: TLabel
    Left = 39
    Top = 40
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Polisi'
  end
  object Batal: TButton
    Left = 176
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 32
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object SBU: TComboBox
    Left = 88
    Top = 112
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnKeyPress = SBUKeyPress
  end
  object TglMutasi: TDateTimePicker
    Left = 88
    Top = 136
    Width = 89
    Height = 21
    Date = 41193.557532546300000000
    Time = 41193.557532546300000000
    TabOrder = 1
    OnKeyPress = TglMutasiKeyPress
  end
  object Panel1: TPanel
    Left = 88
    Top = 88
    Width = 169
    Height = 17
    BevelOuter = bvNone
    TabOrder = 4
    object Mutasi: TRadioButton
      Left = 0
      Top = 0
      Width = 57
      Height = 17
      Caption = 'Mutasi'
      TabOrder = 0
      OnClick = MutasiClick
      OnKeyPress = MutasiKeyPress
    end
    object NonAktif: TRadioButton
      Left = 72
      Top = 0
      Width = 81
      Height = 17
      Caption = 'Non Aktif'
      TabOrder = 1
      OnClick = NonAktifClick
      OnKeyPress = NonAktifKeyPress
    end
  end
  object Panel2: TPanel
    Left = 88
    Top = 16
    Width = 169
    Height = 73
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 5
    object NoBodi: TEdit
      Left = 0
      Top = 0
      Width = 89
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object NoPolisi: TEdit
      Left = 0
      Top = 24
      Width = 89
      Height = 21
      TabStop = False
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object AwalLokasi: TEdit
      Left = 0
      Top = 48
      Width = 161
      Height = 21
      TabStop = False
      TabOrder = 2
    end
  end
end
