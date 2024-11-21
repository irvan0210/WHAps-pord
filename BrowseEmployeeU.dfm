object BrowseEmployee: TBrowseEmployee
  Left = 341
  Top = 219
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'BrowseEmployee'
  ClientHeight = 407
  ClientWidth = 830
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 480
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Cari'
  end
  object Label2: TLabel
    Left = 128
    Top = 435
    Width = 108
    Height = 13
    Caption = 'Pengemudi yang dipilih'
    Visible = False
  end
  object Selesai: TButton
    Left = 416
    Top = 374
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object KolomCari: TEdit
    Left = 504
    Top = 6
    Width = 161
    Height = 21
    TabOrder = 1
    OnChange = KolomCariChange
  end
  object StrGrid: TZColorStringGrid
    Left = 6
    Top = 40
    Width = 819
    Height = 329
    ColCount = 6
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
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
    DefaultFixedCellStyle.BGColor = clBtnFace
    LineDesign.LineUpColor = clWhite
  end
  object GroupTotal: TGroupBox
    Left = 16
    Top = 371
    Width = 217
    Height = 33
    TabOrder = 3
    object Label4: TLabel
      Left = 126
      Top = 11
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object Total: TEdit
      Left = 157
      Top = 8
      Width = 41
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object chk1: TCheckBox
      Left = 12
      Top = 9
      Width = 82
      Height = 17
      Caption = 'Ceklis semua'
      TabOrder = 1
      OnClick = chk1Click
    end
  end
  object PanelJenis: TPanel
    Left = 248
    Top = 2
    Width = 209
    Height = 31
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 10
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Jenis Armada'
    end
    object Jenis: TComboBox
      Left = 80
      Top = 4
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 241
    Height = 33
    TabOrder = 5
    object Label5: TLabel
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
  object CheckSelect: TCheckBox
    Left = 79
    Top = 94
    Width = 14
    Height = 15
    TabOrder = 6
    Visible = False
    OnExit = CheckSelectExit
  end
  object MemDriverdiPilih: TMemo
    Left = 248
    Top = 427
    Width = 489
    Height = 89
    TabOrder = 7
    Visible = False
  end
  object Submit: TButton
    Left = 331
    Top = 374
    Width = 75
    Height = 25
    Caption = 'Submit'
    TabOrder = 8
    OnClick = SubmitClick
  end
end
