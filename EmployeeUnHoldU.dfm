object EmployeeUnHold: TEmployeeUnHold
  Left = 402
  Top = 224
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'EmployeeUnHold'
  ClientHeight = 404
  ClientWidth = 780
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
    Left = 17
    Top = 32
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Mitra'
  end
  object Label3: TLabel
    Left = 22
    Top = 8
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Driver: TComboBox
    Left = 48
    Top = 32
    Width = 89
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = DriverChange
  end
  object Panel1: TPanel
    Left = 136
    Top = 32
    Width = 185
    Height = 41
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object DriverDisp: TEdit
      Left = 0
      Top = 0
      Width = 185
      Height = 21
      TabOrder = 0
    end
  end
  object Cari: TEdit
    Left = 48
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 2
    OnChange = CariChange
  end
  object Simpan: TButton
    Left = 360
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 360
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 4
    OnClick = SelesaiClick
  end
  object GroupList: TGroupBox
    Left = 8
    Top = 66
    Width = 761
    Height = 335
    Caption = 'Mitra Ditahan Operasi'
    TabOrder = 5
    object GridMitra: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 745
      Height = 313
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      TabOrder = 0
      OnDblClick = GridMitraDblClick
      OnSelectCell = GridMitraSelectCell
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
  end
end
