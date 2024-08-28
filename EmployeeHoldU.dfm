object EmployeeHold: TEmployeeHold
  Left = 312
  Top = 259
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Penangguhan Karyawan'
  ClientHeight = 282
  ClientWidth = 609
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
  object Label2: TLabel
    Left = 9
    Top = 56
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sebab'
  end
  object Driver: TComboBox
    Left = 48
    Top = 32
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = DriverChange
    OnKeyPress = DriverKeyPress
  end
  object Panel1: TPanel
    Left = 136
    Top = 32
    Width = 185
    Height = 41
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    object DriverDisp: TEdit
      Left = 0
      Top = 0
      Width = 185
      Height = 21
      TabOrder = 0
    end
  end
  object Description: TEdit
    Left = 48
    Top = 56
    Width = 273
    Height = 21
    TabOrder = 3
    OnKeyPress = DescriptionKeyPress
  end
  object Simpan: TButton
    Left = 360
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 360
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object GroupList: TGroupBox
    Left = 8
    Top = 82
    Width = 593
    Height = 193
    Caption = 'Mitra'
    TabOrder = 6
    object GridMitra: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 577
      Height = 169
      ColCount = 4
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
  object Cari: TEdit
    Left = 48
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = CariChange
    OnKeyPress = CariKeyPress
  end
end
