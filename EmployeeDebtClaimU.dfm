object EmployeeDebtClaim: TEmployeeDebtClaim
  Left = 467
  Top = 235
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data Hutang-Piutang'
  ClientHeight = 361
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label2: TLabel
    Left = 12
    Top = 64
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'No KPP'
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 88
    Width = 369
    Height = 265
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    TabOrder = 0
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
  object NoKPP: TComboBox
    Left = 56
    Top = 64
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 160
    Top = 64
    Width = 153
    Height = 23
    BevelOuter = bvNone
    Caption = 'Panel1'
    Enabled = False
    TabOrder = 3
    object Mitra: TEdit
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object GroupLokasi: TGroupBox
    Left = 8
    Top = 0
    Width = 265
    Height = 33
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Lokasi'
    end
    object Lokasi: TComboBox
      Left = 48
      Top = 8
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object LokasiDisp: TEdit
      Left = 88
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
  end
  object Cari: TEdit
    Left = 56
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Tampilkan: TButton
    Left = 312
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Tampilkan'
    TabOrder = 1
  end
end
