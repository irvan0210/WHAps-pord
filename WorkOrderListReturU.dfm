object WorkOrderListRetur: TWorkOrderListRetur
  Left = 408
  Top = 253
  Width = 918
  Height = 522
  Caption = 'WorkOrderListRetur'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    902
    483)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 543
    Top = 10
    Width = 38
    Height = 13
    Caption = 'Tanggal'
    Visible = False
  end
  object lbl3: TLabel
    Left = 250
    Top = 10
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object lbl4: TLabel
    Left = 681
    Top = 9
    Width = 15
    Height = 13
    Caption = 's/d'
    Visible = False
  end
  object Label1: TLabel
    Left = 410
    Top = 430
    Width = 90
    Height = 13
    Align = alCustom
    Caption = '>Barang Tersedia<'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 298
    Top = 430
    Width = 81
    Height = 13
    Align = alCustom
    Caption = '>Sudah Posting<'
    Color = clMenuHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object GroupTotal: TGroupBox
    Left = 10
    Top = 410
    Width = 177
    Height = 33
    TabOrder = 0
    object lbl5: TLabel
      Left = 5
      Top = 11
      Width = 91
      Height = 13
      Caption = 'Total Data Keluhan'
    end
    object TotalUnitOperasi: TEdit
      Left = 99
      Top = 8
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 0
    end
  end
  object Tanggal: TDateTimePicker
    Left = 591
    Top = 7
    Width = 89
    Height = 21
    Date = 41208.000000000000000000
    Time = 41208.000000000000000000
    TabOrder = 1
    Visible = False
  end
  object StrGrid: TZColorStringGrid
    Left = 4
    Top = 34
    Width = 893
    Height = 409
    Anchors = [akLeft, akTop, akRight]
    ColCount = 20
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
    TabOrder = 2
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
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
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
    WordWrap = True
  end
  object GroupCompany: TGroupBox
    Left = 10
    Top = 0
    Width = 281
    Height = 33
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    object lbl6: TLabel
      Left = 19
      Top = 8
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object SBU: TComboBox
      Left = 48
      Top = 8
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object CekTglSampai: TCheckBox
    Left = 705
    Top = 9
    Width = 17
    Height = 17
    TabOrder = 4
    Visible = False
  end
  object TglSampai: TDateTimePicker
    Left = 721
    Top = 7
    Width = 89
    Height = 21
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 5
    Visible = False
  end
  object CheckSelect: TCheckBox
    Left = 81
    Top = 96
    Width = 14
    Height = 15
    TabOrder = 6
    Visible = False
  end
  object Button1: TButton
    Left = 413
    Top = 450
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Keluar'
    TabOrder = 7
    OnClick = Button1Click
  end
end
