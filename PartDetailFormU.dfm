object PartDetailForm: TPartDetailForm
  Left = 266
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Part Detail'
  ClientHeight = 302
  ClientWidth = 465
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
    Left = 79
    Top = 8
    Width = 9
    Height = 13
    Alignment = taRightJustify
    Caption = 'Id'
  end
  object Label3: TLabel
    Left = 45
    Top = 80
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'Deskripsi'
  end
  object Label2: TLabel
    Left = 59
    Top = 56
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label4: TLabel
    Left = 54
    Top = 152
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'Satuan'
  end
  object Label5: TLabel
    Left = 20
    Top = 128
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Armada'
  end
  object Label6: TLabel
    Left = 8
    Top = 272
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'GP Reference Id'
  end
  object Label7: TLabel
    Left = 21
    Top = 104
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Non Inventory'
  end
  object Label8: TLabel
    Left = 7
    Top = 176
    Width = 81
    Height = 13
    Alignment = taRightJustify
    Caption = 'Harga perSatuan'
  end
  object Label9: TLabel
    Left = 204
    Top = 176
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Periode'
  end
  object Label10: TLabel
    Left = 336
    Top = 176
    Width = 16
    Height = 13
    Alignment = taRightJustify
    Caption = 's/d'
  end
  object Label13: TLabel
    Left = 67
    Top = 32
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tipe'
  end
  object Panel1: TPanel
    Left = 96
    Top = 8
    Width = 185
    Height = 25
    BevelOuter = bvNone
    TabOrder = 0
    object PartNumber: TEdit
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = PartNumberKeyPress
    end
  end
  object PartGroup: TComboBox
    Left = 96
    Top = 56
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = PartGroupChange
    OnKeyPress = PartGroupKeyPress
  end
  object PartDescription: TEdit
    Left = 96
    Top = 80
    Width = 353
    Height = 21
    TabOrder = 2
    OnKeyPress = PartDescriptionKeyPress
  end
  object Simpan: TButton
    Left = 384
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 11
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 384
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 13
    OnClick = SelesaiClick
  end
  object Scale: TComboBox
    Left = 96
    Top = 152
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnKeyPress = ScaleKeyPress
  end
  object VehicleGroup: TComboBox
    Left = 96
    Top = 128
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnKeyPress = VehicleGroupKeyPress
  end
  object Bersihkan: TButton
    Left = 384
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 12
    OnClick = BersihkanClick
  end
  object GPReferenceId: TEdit
    Left = 96
    Top = 272
    Width = 145
    Height = 21
    TabOrder = 10
    OnKeyPress = GPReferenceIdKeyPress
  end
  object NonInventory: TCheckBox
    Left = 96
    Top = 104
    Width = 97
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object PriceUnit: TEdit
    Left = 96
    Top = 176
    Width = 89
    Height = 21
    TabOrder = 6
    OnEnter = PriceUnitEnter
    OnExit = PriceUnitExit
    OnKeyPress = PriceUnitKeyPress
  end
  object HargaTglDari: TDateTimePicker
    Left = 248
    Top = 176
    Width = 81
    Height = 21
    Date = 41647.523671064820000000
    Time = 41647.523671064820000000
    TabOrder = 7
    OnKeyPress = HargaTglDariKeyPress
  end
  object HargaTglSampai: TDateTimePicker
    Left = 360
    Top = 176
    Width = 81
    Height = 21
    Date = 41647.523671064820000000
    Time = 41647.523671064820000000
    TabOrder = 8
    OnKeyPress = HargaTglSampaiKeyPress
  end
  object GroupStock: TGroupBox
    Left = 96
    Top = 200
    Width = 129
    Height = 65
    Caption = 'Stock'
    TabOrder = 9
    object Label11: TLabel
      Left = 23
      Top = 20
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'Min'
    end
    object Label12: TLabel
      Left = 13
      Top = 44
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aman'
    end
    object StockMin: TEdit
      Left = 56
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
      OnExit = StockMinExit
      OnKeyPress = StockMinKeyPress
    end
    object StockSafe: TEdit
      Left = 56
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 1
      OnExit = StockSafeExit
      OnKeyPress = StockSafeKeyPress
    end
  end
  object PartType: TComboBox
    Left = 96
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 14
    OnChange = PartTypeChange
  end
end
