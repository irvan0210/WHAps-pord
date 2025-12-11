object ListItemRequest: TListItemRequest
  Left = 141
  Top = 185
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'List Permintaan Barang'
  ClientHeight = 585
  ClientWidth = 1272
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
    1272
    585)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 456
    Top = 10
    Width = 95
    Height = 13
    Caption = 'Tanggal Dibutuhkan'
  end
  object lbl3: TLabel
    Left = 248
    Top = 10
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object lbl4: TLabel
    Left = 648
    Top = 9
    Width = 15
    Height = 13
    Caption = 's/d'
  end
  object Label1: TLabel
    Left = 408
    Top = 428
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
    Left = 296
    Top = 428
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
    Left = 8
    Top = 408
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
    Left = 558
    Top = 7
    Width = 89
    Height = 21
    Date = 41208.000000000000000000
    Time = 41208.000000000000000000
    TabOrder = 1
    OnChange = TanggalChange
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 281
    Height = 33
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
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
  object TglSampai: TDateTimePicker
    Left = 669
    Top = 7
    Width = 89
    Height = 21
    Date = 41964.570029108800000000
    Time = 41964.570029108800000000
    TabOrder = 3
    OnChange = TglSampaiChange
  end
  object Button1: TButton
    Left = 708
    Top = 448
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Keluar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Lihat: TButton
    Left = 788
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Lihat'
    TabOrder = 5
    OnClick = LihatClick
  end
  object StrGrid: TZColorStringGrid
    Left = 1
    Top = 35
    Width = 1264
    Height = 510
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    FixedRows = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 6
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
  object Button2: TButton
    Left = 644
    Top = 549
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 876
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 8
    OnClick = Button3Click
  end
end
