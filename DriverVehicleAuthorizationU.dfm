object DriverVehicleAuthorization: TDriverVehicleAuthorization
  Left = 352
  Top = 222
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Kualifikasi Kendaraan Driver'
  ClientHeight = 126
  ClientWidth = 480
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
  object LabelName: TLabel
    Left = 16
    Top = 8
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Driver'
  end
  object Label6: TLabel
    Left = 331
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Driver: TComboBox
    Left = 51
    Top = 8
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = DriverChange
  end
  object Batal: TButton
    Left = 243
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 133
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object GroupMinggu: TGroupBox
    Left = 51
    Top = 32
    Width = 417
    Height = 49
    Caption = 'Kategori Kendaraan'
    TabOrder = 4
    object BigBus: TCheckBox
      Left = 16
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Big Bus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object MediumBus: TCheckBox
      Left = 132
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Medium Bus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Hiace: TCheckBox
      Left = 266
      Top = 22
      Width = 118
      Height = 17
      Caption = 'Hiace (Minivan)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object CariDriver: TEdit
    Left = 355
    Top = 8
    Width = 113
    Height = 21
    TabStop = False
    TabOrder = 1
    OnChange = CariDriverChange
    OnKeyPress = CariDriverKeyPress
  end
  object Panel2: TPanel
    Left = 147
    Top = 8
    Width = 185
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 5
    object NameDisp: TEdit
      Left = 0
      Top = 0
      Width = 177
      Height = 21
      TabOrder = 0
    end
  end
end
