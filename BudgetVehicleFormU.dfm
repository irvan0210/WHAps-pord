object BudgetVehicleForm: TBudgetVehicleForm
  Left = 685
  Top = 249
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Master Budget Armada'
  ClientHeight = 321
  ClientWidth = 436
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
  DesignSize = (
    436
    321)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupInput: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 310
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 3
    DesignSize = (
      329
      310)
    object Label16: TLabel
      Left = 116
      Top = 10
      Width = 6
      Height = 20
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 87
      Top = 10
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object Panel2: TPanel
      Left = 144
      Top = 184
      Width = 177
      Height = 49
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
    end
    object GroupNoUjiKir: TPanel
      Left = 8
      Top = 104
      Width = 313
      Height = 194
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object Label26: TLabel
        Left = 86
        Top = 30
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'BBM'
      end
      object Label27: TLabel
        Left = 8
        Top = 78
        Width = 101
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fee Helper/Co Driver'
      end
      object Label29: TLabel
        Left = 94
        Top = 101
        Width = 15
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tol'
      end
      object Label28: TLabel
        Left = 60
        Top = 54
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fee Driver'
      end
      object Label30: TLabel
        Left = 82
        Top = 123
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parkir'
      end
      object Label31: TLabel
        Left = 63
        Top = 148
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bermalam'
      end
      object lbl1: TLabel
        Left = 29
        Top = 172
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bermalam Helper'
        Visible = False
      end
      object GroupRupiah: TGroupBox
        Left = 116
        Top = 9
        Width = 89
        Height = 184
        Caption = 'Rupiah'
        TabOrder = 0
        object BusBoyFee: TMemo
          Left = 8
          Top = 64
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 1
          WantReturns = False
          WantTabs = True
          OnEnter = BusBoyFeeEnter
          OnExit = BusBoyFeeExit
          OnKeyPress = BusBoyFeeKeyPress
        end
        object TollParking: TMemo
          Left = 8
          Top = 112
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 2
          WantReturns = False
          WantTabs = True
          OnEnter = TollParkingEnter
          OnExit = TollParkingExit
          OnKeyPress = TollParkingKeyPress
        end
        object StayNightDriver: TMemo
          Left = 8
          Top = 136
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 3
          WantReturns = False
          WantTabs = True
          OnEnter = StayNightDriverEnter
          OnExit = StayNightDriverExit
          OnKeyPress = StayNightDriverKeyPress
        end
        object DriverFee: TMemo
          Left = 8
          Top = 40
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 0
          WantReturns = False
          WantTabs = True
          OnEnter = DriverFeeEnter
          OnExit = DriverFeeExit
          OnKeyPress = DriverFeeKeyPress
        end
        object BBMRupiah: TMemo
          Left = 8
          Top = 16
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 4
          WantReturns = False
          WantTabs = True
          OnEnter = BBMRupiahEnter
          OnExit = BBMRupiahExit
          OnKeyPress = BBMRupiahKeyPress
        end
        object Toll: TMemo
          Left = 8
          Top = 88
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 5
          WantReturns = False
          WantTabs = True
          OnEnter = TollEnter
          OnExit = TollExit
          OnKeyPress = TollKeyPress
        end
        object StayNightHelper: TMemo
          Left = 8
          Top = 160
          Width = 73
          Height = 21
          Alignment = taRightJustify
          MaxLength = 25
          TabOrder = 6
          Visible = False
          WantReturns = False
          WantTabs = True
          OnEnter = StayNightHelperEnter
          OnExit = StayNightHelperExit
          OnKeyPress = StayNightHelperKeyPress
        end
      end
      object GroupLiter: TGroupBox
        Left = 203
        Top = 9
        Width = 57
        Height = 184
        Caption = 'Liter'
        TabOrder = 1
        object BBMLiter: TEdit
          Left = 8
          Top = 16
          Width = 41
          Height = 21
          TabOrder = 0
          OnEnter = BBMLiterEnter
          OnExit = BBMLiterExit
          OnKeyPress = BBMLiterKeyPress
        end
      end
    end
    object SBU: TComboBox
      Left = 124
      Top = 10
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
    end
    object PanelKategori: TPanel
      Left = 8
      Top = 32
      Width = 279
      Height = 81
      BevelOuter = bvNone
      TabOrder = 3
      object Label14: TLabel
        Left = 21
        Top = 31
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jenis Kendaraan'
      end
      object Label24: TLabel
        Left = 107
        Top = 24
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 107
        Top = 2
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 55
        Top = 9
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Jenis Trip'
      end
      object Label1: TLabel
        Left = 78
        Top = 53
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Seat'
      end
      object Label2: TLabel
        Left = 107
        Top = 46
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Category: TComboBox
        Left = 115
        Top = 28
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CategoryChange
      end
      object TripType: TComboBox
        Left = 115
        Top = 6
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = TripTypeChange
        OnKeyPress = TripTypeKeyPress
      end
      object Seat: TComboBox
        Left = 115
        Top = 52
        Width = 46
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object isActive: TCheckBox
        Left = 193
        Top = 53
        Width = 70
        Height = 17
        Caption = 'Aktif'
        TabOrder = 3
      end
    end
  end
  object Simpan: TButton
    Left = 352
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = SimpanClick
  end
  object Bersihkan: TButton
    Left = 352
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 2
    OnClick = BersihkanClick
  end
  object Selesai: TButton
    Left = 352
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
