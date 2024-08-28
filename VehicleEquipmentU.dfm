object VehicleEquipment: TVehicleEquipment
  Left = 605
  Top = 288
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Jenis Perlengkapan'
  ClientHeight = 151
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 32
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Perlengkapan'
  end
  object LabelAktif: TLabel
    Left = 79
    Top = 104
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aktif'
  end
  object Label5: TLabel
    Left = 22
    Top = 8
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = 'Id Perlengkapan'
  end
  object Label18: TLabel
    Left = 112
    Top = 124
    Width = 71
    Height = 16
    Caption = '* Harus diisi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 100
    Top = 31
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 45
    Top = 80
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label3: TLabel
    Left = 40
    Top = 56
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kepentingan'
  end
  object Label4: TLabel
    Left = 100
    Top = 55
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PanelId: TPanel
    Left = 112
    Top = 8
    Width = 145
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object EquipmentId: TEdit
      Left = 0
      Top = 0
      Width = 109
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 112
    Top = 32
    Width = 305
    Height = 89
    BevelOuter = bvNone
    TabOrder = 1
    object Name: TEdit
      Left = 0
      Top = 0
      Width = 281
      Height = 21
      TabOrder = 0
      OnKeyPress = NameKeyPress
    end
    object Status: TCheckBox
      Left = 0
      Top = 72
      Width = 33
      Height = 17
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 0
      Top = 24
      Width = 281
      Height = 17
      BevelOuter = bvNone
      TabOrder = 3
      object Low: TRadioButton
        Left = 0
        Top = 0
        Width = 57
        Height = 17
        Caption = 'Rendah'
        TabOrder = 0
        OnKeyPress = LowKeyPress
      end
      object Normal: TRadioButton
        Left = 88
        Top = 0
        Width = 57
        Height = 17
        Caption = 'Sedang'
        TabOrder = 1
        OnKeyPress = LowKeyPress
      end
      object High: TRadioButton
        Left = 184
        Top = 0
        Width = 65
        Height = 17
        Caption = 'Penting'
        TabOrder = 2
        OnKeyPress = LowKeyPress
      end
    end
    object Detail: TEdit
      Left = 0
      Top = 48
      Width = 281
      Height = 21
      TabOrder = 2
      OnKeyPress = DetailKeyPress
    end
  end
  object Simpan: TButton
    Left = 416
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 416
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 3
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 416
    Top = 114
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
end
