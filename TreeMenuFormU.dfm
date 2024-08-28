object TreeMenuForm: TTreeMenuForm
  Left = 646
  Top = 195
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Tree Menu'
  ClientHeight = 410
  ClientWidth = 519
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
  object Label2: TLabel
    Left = 37
    Top = 88
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tree Menu'
  end
  object Label3: TLabel
    Left = 34
    Top = 112
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Keterangan'
  end
  object Label4: TLabel
    Left = 59
    Top = 136
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 28
    Top = 16
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = 'TreeMenu Id'
  end
  object Label5: TLabel
    Left = 43
    Top = 64
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'SubMenu'
  end
  object Label6: TLabel
    Left = 62
    Top = 40
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Menu'
  end
  object Batal: TButton
    Left = 432
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 432
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 104
    Top = 8
    Width = 97
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object TreeMenuId: TEdit
      Left = 0
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 104
    Top = 40
    Width = 265
    Height = 121
    BevelOuter = bvNone
    TabOrder = 1
    object TreeMenuName: TEdit
      Left = 0
      Top = 48
      Width = 265
      Height = 21
      TabOrder = 2
      OnKeyPress = TreeMenuNameKeyPress
    end
    object Description: TEdit
      Left = 0
      Top = 72
      Width = 265
      Height = 21
      TabOrder = 3
      OnKeyPress = DescriptionKeyPress
    end
    object Active: TCheckBox
      Left = 0
      Top = 96
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 4
      OnKeyPress = ActiveKeyPress
    end
    object SubMenu: TComboBox
      Left = 0
      Top = 24
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = SubMenuChange
      OnKeyPress = SubMenuKeyPress
    end
    object Menu: TComboBox
      Left = 0
      Top = 0
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = MenuChange
      OnKeyPress = MenuKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 168
    Width = 505
    Height = 233
    Caption = 'TreeMenu'
    TabOrder = 4
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 489
      Height = 209
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
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
  end
  object Bersihkan: TButton
    Left = 432
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 5
    OnClick = BersihkanClick
  end
end
