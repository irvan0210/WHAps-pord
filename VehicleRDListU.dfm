object VehicleRDList: TVehicleRDList
  Left = 323
  Top = 251
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Running Days Armada'
  ClientHeight = 413
  ClientWidth = 645
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
    Left = 285
    Top = 32
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Label4: TLabel
    Left = 274
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 372
    Width = 97
    Height = 33
    Enabled = False
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Total: TEdit
      Left = 40
      Top = 8
      Width = 41
      Height = 21
      TabOrder = 0
    end
  end
  object Cari: TEdit
    Left = 309
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = CariChange
  end
  object Keluar: TButton
    Left = 392
    Top = 380
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = KeluarClick
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 65
    Width = 633
    Height = 305
    ColCount = 13
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    FixedRows = 2
    Options = [goVertLine, goHorzLine, goColSizing, goColMoving]
    TabOrder = 3
    OnDblClick = StrGridDblClick
    OnMouseDown = StrGridMouseDown
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
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object Group: TComboBox
    Left = 309
    Top = 8
    Width = 249
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = GroupChange
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 241
    Height = 33
    TabOrder = 5
    object Label5: TLabel
      Left = 16
      Top = 8
      Width = 22
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
  object Panel1: TPanel
    Left = 441
    Top = 30
    Width = 152
    Height = 26
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 6
    object cbGeserArmada: TCheckBox
      Left = 8
      Top = 4
      Width = 137
      Height = 17
      Caption = 'Geser Penjadwalan'
      TabOrder = 0
    end
  end
end
